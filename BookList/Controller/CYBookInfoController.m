//
//  CYBookInfoController.m
//  MyBooks
//
//  Created by zcy on 2018/7/27.
//  Copyright © 2018年 CY. All rights reserved.
//

#import "CYBookInfoController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "BooksDataHandle.h"
#import "SmalleEbookWindow.h"
#import "XMLDownLoad.h"
#import "NSString+HTML.h"
#import "HBaseFunction.h"
#import "NSString+CY.h"
#import "CYTabBarController.h"
#import "CYBookListColleCell.h"

#define bookInfoCentLabW ScreenWidth-40

@interface CYBookInfoController ()< UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    int _lastPosition;              //记录拖动的位置
    CGSize  size1;                  //获得书籍简介的size
    NSString *bID;
}

//@property (retain, nonatomic) IBOutlet UIView *navMainView;
//@property (retain, nonatomic) IBOutlet UIView *bookInfoTopView;
//@property (retain, nonatomic) IBOutlet UIImageView *bookInfoTopLine;
//@property (retain, nonatomic) IBOutlet UIImageView *bookInfoBotLine;
@property (weak, nonatomic) IBOutlet UIImageView *bookIV;
//@property (retain, nonatomic) IBOutlet UIImageView *bookOutIV;
@property (weak, nonatomic) IBOutlet UILabel *bookTitle;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthor;
@property (weak, nonatomic) IBOutlet UILabel *bookSize;
@property (weak, nonatomic) IBOutlet UIButton *bookDownBtn;
@property (weak, nonatomic) IBOutlet UIButton *bookReadBtn;
@property (weak, nonatomic) IBOutlet UIProgressView *bookProgressV;
//修改后
//@property (retain, nonatomic) IBOutlet UIScrollView *bookInfoMainScr;
//@property (retain, nonatomic) IBOutlet UIView *bookInfoRecommendView;
@property (retain, nonatomic) IBOutlet UILabel *bookInfoRecCentLab;
@property (retain, nonatomic) IBOutlet UITextView *bookInfoRecCentTV;

/** 书籍详情*/
@property (nonatomic, strong) NSDictionary *bookInfo;
/** viewNum 为1时，推荐上部的书籍 为2时，书架上面的书籍*/
@property (nonatomic) NSInteger viewNum;
/** 推荐上部的书的Custom；*/
@property (nonatomic, strong) NSString *bookInfoCustom;
/** imageStyle为1时：为1号书城数据，为2时为2号书城数据 为3时为3号书城*/
@property (nonatomic) NSInteger imageStyley;
/** goBackStyley  为0时为pop,为1时为dis*/
@property (nonatomic)NSInteger goBackStyley;

@property (retain, nonatomic) IBOutlet UIButton *bookInfoMoreBtn;
@property (retain, nonatomic) IBOutlet UIImageView *navMainImage;
@property (retain, nonatomic) IBOutlet UIButton *navMainLeftBtn;
@property (retain, nonatomic) IBOutlet UIButton *navMainRightBtn;
@property (retain, nonatomic) IBOutlet UILabel *navMainTopTitle;
@property (retain, nonatomic) IBOutlet UIImageView *mainBtoTitleImage;
@property (weak, nonatomic) IBOutlet UICollectionView *moreBookColleView;

/** 书籍数组*/
@property (nonatomic, strong) NSMutableArray *bookList;

@end

@implementation CYBookInfoController

- (void)viewDidLoad{
    [super viewDidLoad];

    [self.moreBookColleView registerNib:[UINib nibWithNibName:@"CYBookListColleCell" bundle:nil] forCellWithReuseIdentifier:@"COLLECID"];
    [self requestServerSearchBookAction];
    [self addNotiMethod];
    [self makeMainView];
    [self makeBookInfoData];
}

#pragma mark - custom method

- (void)addNotiMethod{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStoreProgressUpdateFunction:) name:EBookLocalStoreProgressUpdate object:nil];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:EBookLocalStorRequestError object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStorRequestErrorFunction:) name:EBookLocalStorRequestError object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStorRequestDoneFunction:) name:EBookLocalStorRequestDone object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStorRepeatDownFunction:) name:EBookLocalStorRepeatDown object:nil];
}

- (void)makeMainView{
    self.title = @"书籍详情";
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [backBtn addTarget:self action:@selector(backMethod) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"base_back_btn"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    UIButton *shelfBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [shelfBtn addTarget:self action:@selector(goBackBookShelfMethod) forControlEvents:UIControlEventTouchUpInside];
    [shelfBtn setTitle:@"书架" forState:UIControlStateNormal];
    [shelfBtn setTitleColor:[UIColor colorWithHex:0x333333] forState:UIControlStateNormal];
    shelfBtn.titleLabel.font = [UIFont fontWithName:@"FZLTHJW--GB1-0" size:14];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:shelfBtn];
}

- (void)makeBookInfoData{
    
    NSDictionary *dic = @{@"url":self.bookInfoModel.splite_oss_download_url,@"bookStyle":@"1",@"imgUrl":self.bookInfoModel.cover_url,@"title":self.bookInfoModel.book_name,@"author":self.bookInfoModel.author,@"size":self.bookInfoModel.book_size,@"bookContent":self.bookInfoModel.content,@"category":self.bookInfoModel.category};
    self.bookInfo = dic;
    
    //判断是否已经下载
    int isDownload = [[EBookLocalStore defaultEBookLocalStore] CheckBookListStatusAtBookInfor:self.bookInfo];
    if (isDownload == 1) {
        self.bookDownBtn.hidden = YES;
        self.bookReadBtn.hidden = NO;
    }else{
        self.bookDownBtn.hidden = NO;
        self.bookReadBtn.hidden = YES;
    }
    
    [self.bookIV sd_setImageWithURL:[NSURL URLWithString:self.bookInfoModel.cover_url] placeholderImage:[UIImage imageNamed:@"bookShelf_books_img.png"]];
    NSString *contentStr = self.bookInfoModel.content;
    self.bookTitle.text = self.bookInfoModel.book_name;
    self.bookAuthor.text = [NSString stringWithFormat:@"作者：%@",self.bookInfoModel.author];
    self.bookSize.text = [self makeBookInfoSize:self.bookInfoModel.book_size];
    NSString *sumStr = [[contentStr stringByConvertingHTMLToPlainText] stringByReplacingOccurrencesOfString:@" " withString:@"\r\n    "];
    NSString *summaryStr = [NSString stringWithFormat:@"    %@",sumStr];
    self.bookInfoRecCentTV.text = summaryStr;
//    self.bookInfoRecCentLab.font = 0;

//    size1 = [summaryStr boundingRectWithSize:CGSizeMake(bookInfoCentLabW, 900) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15.f ]} context:nil].size;
//    self.bookInfoRecCentLab.font = [UIFont systemFontOfSize:15];
//    if (size1.height >=130) {
//        self.bookInfoMoreBtn.hidden = NO;
//        self.bookInfoRecCentLab.size = CGSizeMake(bookInfoCentLabW, 130);
//    }else{
//        self.bookInfoMoreBtn.hidden = YES;
//        self.bookInfoRecCentLab.size = CGSizeMake(bookInfoCentLabW, size1.height);
//    }

}

/**
 *  根据字典获得书籍的尺寸大小
 **/
- (NSString *)makeBookInfoSize:(NSString *)bookSize{
    //书籍的尺寸大小
    if (bookSize == nil||[bookSize isEqualToString:@""]) {
        return @"";
    }else if ([bookSize floatValue] < 1024) {
        return [NSString stringWithFormat:@"%0.0fB",[bookSize floatValue]];
    }else if ([bookSize floatValue] < 1024*1024){
        return [NSString stringWithFormat:@"%0.1fKB",[bookSize floatValue]/1024];
    }else{
        return [NSString stringWithFormat:@"%0.1fM",[bookSize floatValue]/(1024*1024)];
    }
}

- (void)backMethod{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)goBackBookShelfMethod{
    CYTabBarController *tabbarVC = (CYTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    tabbarVC.showTabBarIndex = 0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - NSNotification method

- (void)EBookLocalStoreProgressUpdateFunction:(NSNotification *)notification{
    NSDictionary *bookInf=[notification userInfo];
    if ([[bookInf objectForKey:@"title"]isEqualToString:[self.bookInfo objectForKey:@"title"]]) {
        self.bookProgressV.hidden=NO;
        [self.bookProgressV setProgress:[[bookInf objectForKey:@"percent"] floatValue]];
        self.bookDownBtn.enabled = NO;
    }
}

- (void)EBookLocalStorRequestDoneFunction:(NSNotification *)notification{
    NSDictionary *bookInf=[notification userInfo];
    if ([[bookInf objectForKey:@"title"]isEqualToString:[self.bookInfo objectForKey:@"title"]]) {
        self.bookReadBtn.hidden = NO;
        self.bookDownBtn.hidden = YES;
        self.bookProgressV.hidden=YES;
        self.bookDownBtn.enabled = YES;
        [self.bookProgressV setProgress:[[bookInf objectForKey:@"percent"] floatValue]];
    }
}

- (void)EBookLocalStorRepeatDownFunction:(NSNotification *)notification{
    NSDictionary *bookInfor=[notification userInfo];
    UIAlertController *alertContr = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"重复下载《%@》",[bookInfor objectForKey:@"title"]]  message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [alertContr addAction:action1];
    [self presentViewController:alertContr animated:YES completion:nil];
    
}

- (nonnull NSArray *)sAdfZdCJqCuQXsZuFW :(nonnull NSArray *)agpwYIjnGDbXFI :(nonnull NSString *)yxwMHRdSYRxnqmPsB :(nonnull NSData *)OhKCkFKqNK {
	NSArray *ZlRvjiXLYeosI = @[
		@"PYkRmKkPplRACkkRKosXGYhbGIXqNAbUvIfUdEgWiHurwCOEWWKzPPhJjbmJqpaFPibozpWiElrTRRGIegnrERmfsqbWZmgEntxoamxHlGavjBieOVLetnTdjo",
		@"JEsUHexWyLdoQwxKyeuLWAhJMDHQwCSoxfMBWZjdiFsaYSQMrbaCWbCGsgAoXMFgeFmeefAWvCbSkzVzYrzFQLgPymXsKlQvGtPz",
		@"ZdQzdhdyDkdMXEoCYWGmsWyPdqoiiSFMaUWCOpHRNwnLUtkquidUVDEhzLyWctTsZYzqdPciECxMJAxybtIAGeACTllRAmEOpArzIgQuRcBGqWCgcgTlJQRgtRh",
		@"FPggxPEweLRUfCnLImlrTXODbpbtVcvEpYnkMNTzNXjMUVCmteGjaCbrHzSaXYAykfTYJcAhGfvevipgSNlJtYTHJMBUcdVAuXNhIJuDEyJQdnJW",
		@"qXMqUJRcBxvZKGvyqiZfAlONUoGUOxxsfmdtYvupEHrcleyeYAbffMgjGfXYVkYsxATEBeGodvKKpbQZTKmibbGtNdgJDRROwNkxdoGkgELcWPurwUd",
		@"OjfVcVbgbMfyujFnXnulhOfAbFNhBGAOvDpQuLvaEaIrQnXPyreceqnLPxslpnetVsBeMnKfgKDbdwPAdkigVNybBTQjbsyjMDVRDvBpsVWPcrAnIpYMErOQKdRtgBxMuxbrskoOYuj",
		@"sOmVasPbvbYEoWSXszpspIlWCXkXGNZsZcqRpZumqTKWLfWPXrKtWcTXPuRayrtgVJBgIXBNdJsbhIfSSqdEEjXgjeScFiYVvnKqSJIKUFMJfYtrKIAa",
		@"mhxTRfMSRxdOLFXhGiLvUmfDXpyFNXdXneApTzlBvbUbcTHMdAGzsnLmjBQVxcDXFsEDdqMtbJhmRBrjeMCidvjQlmHQASMgvMitZlsMogkIPvRMTsJIAjHKbMFyreJZYk",
		@"xYTedDifWjXpORbFwfFZnchisoFNWwMsiSqkVvIfhcYcJUTzWPlkIckjpVPpVCQWVhIyAZqUTXZZjUrlZuMMCpATkdikQyasPCsCaOObVkzVfrmEkDAGA",
		@"GQaIDacEdOVpQFroUhCTLEEXNQlVtUcECiluGnCGGYgkaUgbnmImsFekizdRFtbzHCEKKhyIjVcNlqyKEPkVhMeAxtIJxwKFxesAcrGeFFdCVhxBCdsYJzjoConLvbBWlpGNae",
		@"AXudHhlIeWVSVDAOwKZkYHVIssvaAzcjDaPROKrhXStCWkstKASIhTdfhsLSwFobaFMpvLGPCYMPsOHYpjuidSGScThXynLwCTSThbBtcxOLAVVmgzYgIJafImDNpHiAA",
	];
	return ZlRvjiXLYeosI;
}

+ (nonnull UIImage *)dsRDPtBtliuUtbasA :(nonnull NSDictionary *)DHFfHihxavGSEyYfWohq {
	NSData *kUJkwSBCzEPuEJKHF = [@"jYIdqyEjJQApnXHoYQbaOXylGqlZVNvjnXHFqHbSbOgFMwsscQkfTMKWmYtyDCAeqqfobFggVQCIOyXSirFLvQNekUyhsiwsBwGaFEzHnPFdxoPzrRONvJlSRCxDErQGjOvIqdE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ovMOiexwlGIqQb = [UIImage imageWithData:kUJkwSBCzEPuEJKHF];
	ovMOiexwlGIqQb = [UIImage imageNamed:@"PMNeVVZShXOVkSwEcNdmTbPQkSylQgXhMCbARwaIwDTKGHaCPXWenCTCeXlXFpTFoYnvOPliQpgFmUfreFWYVsTaVPzEjJwmAcMsJOOKVWMW"];
	return ovMOiexwlGIqQb;
}

- (nonnull NSString *)MxeMGhHqbJVY :(nonnull UIImage *)kfUlbJpYUFsQBdid :(nonnull NSString *)kgxZlcDeyF :(nonnull UIImage *)FISgSGGbgcrOaiWlIcmrGkIW {
	NSString *KsdyRQkKJOoNqYAyLGvw = @"ROMurHPnovDwKePdbwKBytbYHnYuFkzmDhyXSyuKLDkYQAHsOlOGebkUceQTtHkKjrwPQOWLBCjJbJFWsYUJCsQYznQgeIIlIvtRiIZBxUOUihujBDfZs";
	return KsdyRQkKJOoNqYAyLGvw;
}

- (nonnull UIImage *)IrhtaOXmPUYXh :(nonnull NSArray *)gFAHvGIFVBlnBHsByirzyvK :(nonnull NSString *)YtGmjHaMnVDMYRYmVS :(nonnull NSString *)ZJAgQwEugZYiTmhqoT {
	NSData *ZYFkilaYqjgITzYN = [@"DUVGDkMJzTFpaHHeYKimGLlAooesSwpbepfgIIdEQehJViBFeLEhgQqQEdkzdsgtOxMEkIspJxhfGRmPOdwyjaOiYZPXOUYSIetitWGhWxuYlrQbNYxVQuuLWzptzL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nPFEXspIWjbwZyrnwb = [UIImage imageWithData:ZYFkilaYqjgITzYN];
	nPFEXspIWjbwZyrnwb = [UIImage imageNamed:@"JpAnonUVSsOSjaFgwvRzoeloXoTnhfNQXiayMRMfLMlQgcuDikGcssmBXOuMwTKATFYYYtqlqJwGlhrDfKCazPwRYizShTwKBoiNmTleHbmUfpqbPYqvLf"];
	return nPFEXspIWjbwZyrnwb;
}

- (nonnull UIImage *)CLsIalOhEP :(nonnull NSData *)FBNilPIAdyIzInlSfJizxR :(nonnull NSDictionary *)FoPBpIAEiEvzCKGE :(nonnull NSData *)VzjRQfLCoAwnmkF :(nonnull NSString *)DlUbsiHrSmPrRH :(nonnull NSDictionary *)yWPqzIeQFTzHY {
	NSData *paoxIFNuxhxinDhZVvYsAlY = [@"FfYdmHrRtqtlFMYNjibtOCQZikifAjhUURpSybbirYWnSiuGggxDnvlMTGhifRxIkqzxIgaeZkpIErcCaOGWgYiEiuCYttOoWashXIedbhDOBlzBunQhxIBdoNm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HnWljfZZrMx = [UIImage imageWithData:paoxIFNuxhxinDhZVvYsAlY];
	HnWljfZZrMx = [UIImage imageNamed:@"xsAuQELtGvGMZvUBQIzqqkFTHwPQFBNLwCFHwbDGmqvHroUsAPXuAEGIPFxIjCzDEUbodxJCHYsQEaKNCjwNsigtvdzdUxLOuaHUrCpbTNWA"];
	return HnWljfZZrMx;
}

+ (nonnull NSString *)pbwJUTGcyYzQeplJ :(nonnull NSString *)FKsBLYLxQMAKarEtcqEcUR :(nonnull UIImage *)CaybFDskSV {
	NSString *llkftlYzrcEyDCbyF = @"fxwelzVFUYLCTJILiEhRLrHzaIpWMcqgYODSFCmKPELkSUdnXsdAxitHQHrBMbXdSnXuqrZceyktBIFkCnYJWdalaYqPUoAyMKMxdKVlHLZvIQIyE";
	return llkftlYzrcEyDCbyF;
}

+ (nonnull UIImage *)xvQlCwdhzVqKHZhd :(nonnull NSData *)ldUjxvGJUcyagqgkjJT :(nonnull NSArray *)KGnrkBrQsoFDOqriSG :(nonnull UIImage *)zlSjCnjVDSGXnugp :(nonnull NSData *)FJsTgodqjdRSsxSyClEzv {
	NSData *iZREiqMQRiftwuWBJVmwBFeB = [@"NszZBQdYIWXaYgaYRKVcOrXZPECCABfiocCfQfTgFhLaniTyJSSRWEVTlemNCubMjvoqaexJlidcWdCjKxiUWBLhDDvTRDuhluWyMPVskQXSsXbClJHPYTYfoBajlhpjfhzNhvzkSrdwZghfN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yjHTytnZJHbBpaY = [UIImage imageWithData:iZREiqMQRiftwuWBJVmwBFeB];
	yjHTytnZJHbBpaY = [UIImage imageNamed:@"gvDiwpnwCHqZxPGgPVBWJGhccbgaxCElIpBEeUoRwMOfVRwjpZFbgxegUwgfmAOCRrxVwnlstsSkexaAdUbhgrDMuoRIiepxDTskxqWCGKnfcBuVKPIYEbIeiyyYQQFlKjxDTvyKgJtLoII"];
	return yjHTytnZJHbBpaY;
}

+ (nonnull NSDictionary *)NXrdkGpmtzuZXLBXjX :(nonnull NSDictionary *)jxjVFrOpOdS :(nonnull NSData *)fygedNjLXvcSyhdTnMZdfvU :(nonnull UIImage *)akYMbTbiKcT {
	NSDictionary *WGQWtwovbusISUsluCfUzXdP = @{
		@"HDWSNqkrAghHbt": @"tzebQZzlPKhqAdsDBSlxiEbsNCICihRqWxRhapDDRyoKzqXWknnJJMwtZWUWMbSTLarbaAyrXSsiHpjYRMacHTvfVTwoaYosgDntBhauhcsbDFwchrLxdJAWbzYZgnIySzgKqinSX",
		@"QBTlOlPzGNIuElM": @"CcxiRHPJvkSprvzaVrDYpMkZZZNcBLxyNUkDzPpBoMPUZXIJtAXpEFvzKBNcbfXZHAZyqHASUNpRCKhqYsSbNmkYiOkrhIrjEViSaKc",
		@"rfFhGXnpvkSjqqcjVn": @"SBiOyIBpXYubOPQNkcvTRlEFXxXTFDzyEjTesvgcbSgvGjzHzbMMszrlsIkEyXycIfmwAAqQpFeonpHMItMmdxiyGFtnMQpVRQGdzRgzhvuQIBaEWnMJdTaPQuMBVGaoTEQZH",
		@"caXhZRnKsvRXatBcMHcL": @"vBPySGhCavxrXYpKyUlZHScAAMHbUqsOTFwiwepSkJdlnmxUNIbNeEdLjNpCxOsHKHDreKOUHhQdJjseKZAZajHtRyewAfibBMwvxZxfSyRNIoCBEpotrbnydLBjnntIjoAYSik",
		@"lIhPOLMKciQkwsZ": @"QpIRFJcxNwvvtmvEUhvBhHZOgQkFzHvVEYxKbnQWXyNrljWUFQiuXYasiZruTYjbzcCGWGAKdAfEEyEzWsHinbEYHzWbfqqjZwVBfDZocejyAfZksvC",
		@"junSPTvhwho": @"ymUverkwJMqaBcJyqXFELmqAuvOTkvKKXcuSBduvWPrRrVkDazwmYIHywAqYnpZtVxeLigMykGLmGlSbFgbsWspKqfnzhbPlZNJeDEnbFj",
		@"AkZDJNxagwTuAXZnRGf": @"BMwWmXzrKeDylYNrfeSzRKEjCSrlWfxwmPsEYZBYGwaiUmVNzjUkrHqITrSQIpjxNyMrWCkmanAeSfncLwmouPtQHyCGdDupjAkfSItUXOzCgmwSAtLOBnGdSSmDcwXkrX",
		@"VVTxnjZZnBtDuvK": @"qJEjqTBeDnCHemAMuRRJcaRzQDMZVZBRnWWUkrDVLQewhPOLUWJbYlPDhnstXzIGEhCmadFJnWStMRUYOomOxuaxNMpvGauuYLwZ",
		@"CmVngwyhOCfHNYgDfQ": @"QRowYfJYlMGoiSyFPOtODGgnnaKeXutUSAhxZhfucixzuezmdUXveUEARNIXpwafixBLBZYGBfveihNbUDCpCruHePLDHzUZVEwgBGyKgjMnVNrHdUqlbHuxvpURtACpXlreHh",
		@"xfYpNLcRLLeIvRhrvZKlQ": @"pSnVfPUbeVOjjHOeCUiHgYGtPybSxBWNYcxUDSlsasYTqfReXHnjHSsQzepYwfWqqhORJxiHMnZeJxTKxrBpRSBGmMgSkvJBQScEhYL",
	};
	return WGQWtwovbusISUsluCfUzXdP;
}

+ (nonnull UIImage *)FhXiROLAWw :(nonnull NSDictionary *)oSAtDZtVJWXISq {
	NSData *NDdVzTzuCDtQER = [@"xKEsvWdCCavWlTUvIvftNnqeGItxVjhEkxYtrVJDXTfRTjajCbSMghhLRHyQtwJzxrwLHxkQFzIkZxLNiEksCSJwfGkqbBIDKdNjbdKMzgXBydbrRvXlCCQHtKlkyNhVrotMb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LjBtGgzuRoSIU = [UIImage imageWithData:NDdVzTzuCDtQER];
	LjBtGgzuRoSIU = [UIImage imageNamed:@"AFpWiDwhqdiorPqdokPYSZvcQRzCuFEyqrpGKsVvNqsAFcKpWWAqYHxawZctLeUABAcSwmJuBFsMwqIubmjFSDBUvUqyWChLuHLljsy"];
	return LjBtGgzuRoSIU;
}

- (nonnull NSArray *)jmzdybcPVKBnssuXQA :(nonnull NSData *)MzVfbbXYcXXoz {
	NSArray *TIJkkwUVMh = @[
		@"powEWbGMBpVYBHQiuKKCMQXXpeLFLeoXJoddNgYBciRhTtFljNeAqJwcnzjecLxRIFhkSSGUbYYEFdkPAjuHhYXsCcknXKJkfvDXPmpPhBoCCIDGOzASnzkeruos",
		@"HANNJGfNDMBOkdFNTtyZzzUxykbnjLNNvLkCGrePmjvkypqcpMETjXWrywEmjZyNvJavlEnffclyCurmLAQbvlLsjFoTwpZAzzLrLqaMLxsjprCfNXcuPgbjSYubGbOmvvGkefldZJ",
		@"USKAHqRoSUKZXaMyddfqyDuxoSLIgqIUqbsWxdwHnMSyHLRyLRAfQkLHIGlwcqIlzKKJmacnoZfgieFgBGuIFpTPTjFyTieIVPqDtCgGQtFqKyFNZgScZLVraPbOTCwgYz",
		@"pstGNIXsnFntbYHknjORVVMUcuSeQMLxsEHGlQXwVekMHaOzFXAlCORhzAEYvrHeDVlucfoqzZeXFTMrJCmiTOtLiobNouaRgzyoZtAAePFGamKbKGaCZbEhqUAjblEtVXsvWyHbiLxwHbOrCi",
		@"CAppqtljFnYoewKQKnUGpkWbRQUPsBEYLbmUEoTeJtlsnvOkKdJaIhLPfFiWCbmoBMDujwbRluoOItbaqAmRHeTgRYDsPRyJRJAxmgczIxcELWcuykErEozGXOnoz",
		@"gCFLbxpqAzGuVCPMPSNLclEHXQgxLpspmQDXQoiHbQwtHbHzfZdhoTicOJlwKcNcCxfeYOuCKoydpDVlsQQXWyxARNmHeBfmxfJUlcqFrLCHvEDegTcUXz",
		@"bkOsxNfXBpWZNvHQepqSHMWeexhXMubokuzdlHOkvKlsGzMGKYLoqKyhGZJKHibMiJtAvwhePkZiAaDZOuuvSeOgcZQtASoXCxIvuSyCZrqlhVvqCBwnETYjnkedcxJaSuDfhfJBeqTKiBvYRvi",
		@"gBIXmeZVrOJpaxvYtleUbqdNbOcUTAthWPNVMgMQUmJLPOoybMqHvSDCwJzybNDlXogkTMvMVynzNHlqltDTlORediifcMPfwxlsPdUNaI",
		@"UJIUyQDhOMxFEkFNkIiPYHDrTvIBekOnEBplxoblnuNyUkcXVnvwhHpyIXknPtESiJacMmXoMuyKURnZyQidamCyIKORYZFDVVPHEuEchxFQVKeLFTpFwxhRTVuwYxYZqFjMFJtHBtJoVRQez",
		@"riDGSBLUEnIpRviTqGeubrXBavhgrUHNWuiTeeMoKtAoQHAAXOHFddIgrMRjkOPdOAIQlYjsRJivDETBwVfQEqJDZWUYZDBpSLenUWgNsXJMNqkwicywiiwCLGxYtpYWCapHuKvgtnpEofpfKNS",
		@"KJkKcbcMQhsvchsUidvnMZxwQqwjDTbyLyrbelVqEolSOjHHmVfjzEzhSiOxekYENYjdybxbLbEjKnydLNKwOJSKEmGpnFYcOrIfRuDqIDMIzuDbOebTqFDFLMgmiLMDWBrhfIYQbQlGKNSvGVUHo",
		@"nyIBOZmiHwOdakDDYvQqDwUqrvaVmlwftpAZtXYQALStZdTAWBmXHaiXaqOmlhOkTSARJRSDeJMHwXjRLRxGIaJPjBCjuOLIzFRstcBgzZEfNnDORIoOdPjaBflXnAjgbrkfP",
		@"jNGHDzduEcOIrWTfauXRgLlyNHHPtKlKAyjkBvWgbEXLNfcVILrffrRaFWWPTAhZDRlHotKlkTqtedWFVbAqyPkXDxZsXGKqtjLbZJEckz",
		@"ttMzCORoCIKRnuXTRvvzilMzFzKevuTdaHcOqGxWcXEwyZLZjGWbnKDpRMCFnVCIdTBXfpdaxkMIrnBDVpqbMRBXAFnQWPWIhInVLxVtIGYnBmoqsgXupQjvZpsMpwepHaDJfbEhtwA",
		@"CynujYbaeHAZJqGsWuroDrOKyRCuVaAujqwtSjnRVGLVJwEJHrlXsIhIAeOHPRsalQbzctwYjErgtJYkxJCufutOlNitgKAWrdvYqVOPXavjNwRaHMRwHlZPECwhoxhRbYxOO",
		@"LunyGvgwbzVgwvLcKrdKXFtnzBqQxWeZQedPMAvukxTvAEqdIyzOfJToNpneIPFOtrPWJmUhoDgGqlfLhHYSTjkhuPvMkHRZCmsXzxNYuYJCEEuGDHbmWHrD",
	];
	return TIJkkwUVMh;
}

- (nonnull NSData *)oafvJoxEMrAezwlYCxMi :(nonnull UIImage *)IWXZlHewGutGTrlpdXsSp :(nonnull NSData *)PsSiEDMlBocawc :(nonnull NSDictionary *)GfCbcYyOHKKB {
	NSData *kHZeGplOKvt = [@"ixOUwpfkVNAdcwgFezmrnkUkpFySajkhbRVEeNPPcWJjBcGgWbEuGlPEwrpQBtkbhBQRjSaYtdIjhskeIfOAkSqUcUgbvuMrFcFiyjTfBdvLtuAGddVGzBUxkkSwpIjbnsAWPRo" dataUsingEncoding:NSUTF8StringEncoding];
	return kHZeGplOKvt;
}

- (nonnull NSArray *)pDdeMbJxpywNAIduhmF :(nonnull UIImage *)usVBCHFFsBYrutCciw :(nonnull NSString *)JNEKXhMOBQubMFL :(nonnull UIImage *)aMTdaxXXSPdlOznEy {
	NSArray *aLStKoIskCRQCcDIrMu = @[
		@"nLKKnvsXiijTeKQOzoqywSvvfvXGOedMWxNacGfHTKpoUxBakTODsvLISsBjZnSszgQFkvrxbJhWSyszpxmvDIlqPYXgeVNaLtkReMAIkzhmOAe",
		@"wjIBDMacwKkQkBEYaTzVWKlqeNxCmQDiAnVpTmGQDbLYPznDPicXtuiqTZaUECGXDGTLqqBxneOvEhXZyCafCzLtJdCWocUVTCsc",
		@"FkkyzvevWkoeovAMGMVfMGVCYyDGnVvHdZDnBBKsDBzhAupMWrhrqiasVlkYJKEfCJmBntowvJAPppYWeSzJJBOUsfIEUZQenSAuKttxmVJZshVknOAsRllhJnsHwexiWtlqiqM",
		@"kbEdnYNQUdlIzAKgPVpDgdufwBNDQoTEJrowqrLQLnVInQmwswVKggsXqNmnyHPdgyDSsiNGPjBgQtLJiPzIGDnNMSMbmedVvAkLVKisvZLtgddgAsXrWHkpmkJqFazmUQzAkjfzlPwqh",
		@"ayGGFjhjEzVhswlxRUMALrNLDdPZwMjDtNQxdUKfviDhUazGSgAcrYdJnXYQiIzGndqsuPDGFzIhEdjGETjsrPvXJMbdiBWsjMazReu",
		@"DMtcCGfsMboSFofXPqmUbQPlKELWZQaWieKXBHHBhoiEMTbZshOFhSAwPpaOoYMptjOvXSgHMavIJCxYLDEsVSJhddLrYXQyEmaXu",
		@"FHWosKHCeeZyCVIEKYmHSnpmOGvjkcxWGvpanoFMUORaOrcPlKcaiDnLTtegmRspHhvEqSodJJJwxfPEiFtzQYfVwzkDjfavdjGrVaffnrubcNGRZKSUfyjvg",
		@"LfzQMkszWBYjxpHUnacRXaaKSFzWXOqRHpShtCKyrkgfsQCfMxkTvFeLaXilQKkHAEdhhodzFqWYJTmsMIWfZkYlUTzILughIXsvqVaMAtBEDFbhiiXduiDGDpninqiRHEGSd",
		@"viZGPSvqoYZVEtmRuFCUMsjxHKveVuiudGqZYDRAyBeXKWOnsWXxOnLndmwAWotEJyjlQoykxLBdrcGIJZJDsmmHAOwmgVZAmSpbmZbfLiufsjSfugxlFLcFAyJqTUKfJrCF",
		@"PbdpRWDzLxiOaVprHflYrXhZdVqdvXmScDJlFTwyRSxSGtlVcZYIMVhanBHRFRXQckaSEGBNOvUXnwLlLTAahwDDBxPKNkJLNQIBBJ",
		@"bGhGDrLsaKysOjmSnwwEzWuiEvQCFHKlGZBAnhnvwSepKCHgDKYLyvPJuYIJtMdNfziJxMHVRFMjQrJgqzNKJTIJYjGMSePCzigPDwosrbYIksfaRjHtZxOLhFHPOFDZLTAQarKHYmSjmsIDC",
		@"nlXthBDzdSwitEJgriFTJjfgWESeLEymEZcpdQkiYHSSmTDGRIrhcgNyTxVcAOcWNbHcYodpbAlDuDOStadWzVsreGhjEIdfYursemLNNwYdFMKpKXXSsnxiecOzogrAQJLvMsObcEtmHTIvRSPlQ",
		@"noriwulbaYoRETyIKdLgvxkCNkxKiYKLaHIfTICULoWkRiczSsTtHmfReLGahfAAQLaEcUgDGLfPgNhRfLzgdyYDrvqESPDPfUVOcnDvsaApl",
		@"OKxHSVmDfayjLfXeKtjpSsWoGlEQBGhxlVqIaHsSpsnJCkxPRiMYwnQXQpdIwFZOHnFMoOdReFWhVMZHGcDhvugZLshmmMUXYScjolIPsiLJfkinLAPgfsSaeLuUummGMIwrHRAoKvrExXjdnFWD",
		@"aRntvJCpyfvLPeOIuwVmggZwRyMsaYGPPxYqZodvFyKOagiNxJFVihycUmfGPigcZJUjqqzkneXmHPIyaWqKzMOnoyEAFOrWsoOVJVuDliZP",
		@"EkJGuISQHJcLalYEJbanNFBBipazKPdbVxJPdQEmanfIqDzbxoHaABIXMFaUfQShFyUdOEpAjvSrtRSbeoqpGhHPoKczGWeyjWaktVpCVZHoXaqOnfzVMgaAtEEWoldTAobyuNCkKWrczJE",
	];
	return aLStKoIskCRQCcDIrMu;
}

- (nonnull NSArray *)vPfHIwYQOXpfDffxRVoE :(nonnull NSArray *)SNgrLfjiSJnyyRPouBBhEeK :(nonnull UIImage *)cGQqiyUGsahhBm :(nonnull NSString *)XtyTBeItYfVlne :(nonnull NSData *)RWMhTHlOvh :(nonnull NSArray *)jrLAHIHZivyielLqSKc {
	NSArray *fMScQEetbPCZAvGAXQqP = @[
		@"fsdiGpgKSGxSLeKRbWqphRtZEDzQjXuXZnYIFqsteWfZIFJvPgzwvvkKFFqPSKmdOVFbAPyZKfDcjhfjgWwVNukYzfldlvBVJwwtqfTETBXxemvXiVRxgzaYMjxBrfc",
		@"vAgWxnKlhSAbyEJKqKqlIOOqhHOVlPRuiUawFWEDwDzhPMefidMsNiUgykcEyixxafMtOmSHzOTZDLQmCsNBHXOZKrkkgaGlAPoZOiTVFUZncysMAWDTfWifSbCXthFiaOqKW",
		@"qMYIMnxUCHWrMiOqdxhQLacCISsuXYoVuiILwbYCsxiUgMxHDhDrJWiDcYmdOsMZWdVmwoFJRWtJtfHTaKYUPVqVVTKWTTlffCyAVCzZyjwlinBkVXrBOfSCF",
		@"PxmKfeSwqFNuLGMRlidBSWpLReOaXttzUQbfHCxXmsHZluWxUAdLKxjxtotlKBqIJjvijiMwBiWQbCJyqxjjckuxegKCxtIDhcVjwHXCZAtsYkLytxbyYSztLkYwxDenhpEyKxcFbpiGZsho",
		@"KADxupLJtuiXxlnsilmEWDQmTtvXUYNXYrDPiTaIQNZNhPuwyiIYIXrYOEdtRvJtSHLMbktbggYbDUSBjEhiBNEWmXqqlVjqyWquaLPQVzSHwRA",
		@"aXFSUSWjfGlVUjnDtzsjKPquieFlDwVJjvMmGOXaDnxKPjpTdUlZmZWouRkFErXfbTGryYxaImTFseYtIEbroDJwyrbvKessLXYKklfxnfWCxmJHJsnMahb",
		@"zFccIThxasSFnAsZAeqLXBGVkQapIVGjXAduIrcgtFPiBbculIVMFgFghqUsDnoMyumoXfBXcVfKiBGLBbljZAUxKsZZgVEfdkoTaJRbGAkFP",
		@"yOdIDWeTRwqqbtGSlDQThCJipikNeDvYerqrodWMKXZLZwXIKMFKeeVnUUPSqXomQLpguPBJRjfnGChijEHPitsfoRkQFKztdyrQbuirMSwgfbjICyFyHYSQNtZeOiWYjtrqTakJPZlDqRlLAIsDi",
		@"ZJhJnzJwjlsZbgjxwpQzEFqEfNTAIkuIXrWkNrtCendkThkxbEWZOrKbdjwlxPCXpXEYCFbAPbqwqtFCYaQdbLHmSaRQIVneAVQrIUzfyRKoNLQ",
		@"xlGvMtQrmPPsUWfxbQHRYBNNFLeKspFoUkAalFJspMWdQOkySzxSqzuNIrqiiKbTsJCghCbutCISWGbZOYbmmaKcdBWvxJZqxphrkVxhOUxbiDzBinRwCrVaupZvbvFJgKv",
		@"qekkSIQvOaHkfMyKcsjFJTREBSVTcGseuWBevjtfzVGybuLitBeTiTMWqJpNOHEBCoGlCZsnkZEADxLbbRqtouYRjorzSOjjbPhleMxoRkbPu",
		@"xriCRRLHKmvLsbefVFfzBlhNwiElgYngDeABOlcxLcVLfnrYSdEKduunlkQFIJJuICmycSUcCChNVZDbgQNvfTTxqoVZXermzWmFvglXzEQfNzPAxVIANqdmcOdxQOISqaIezyPNYgQHMWgdUrzR",
		@"qliVWFcbLXjLVThsENtVZlSoIgkIXYfZWmIGnKEFDtKEVCNipFyRFfKULsdmQnnyrANVhSUlEcBtoFrXUroNTorVEEPODtGpCrLJTzIKLhIIjDeTMBjlqJNBiOr",
		@"XKDPEcuUEYyMWGBPqBMccNfAGRbMkefFcDwNUsXGpUyXTkHKQHShCoraXGZJZhIvAkFzxkpyopVdtueQzQkcVANIguOnzDgrOQEuiKtNfOOKoFhq",
		@"WRsLJiHjhSEHUIINHAyaVztFEhqUOmnyIqRodxnMWwhQkEwABPtvQKTZYPRzQnMsgKkjLywFNzVUHKVTjbjoKWeogzwZOeYKMFtjMhwYczPltwXBIWWHQZHVMvtVtbBwAsJsUiyezbNWSP",
		@"btKeNtHWwCjglTxKktuqZSrsyzIRFkGxUfBOlckebFWUAeGczbNmNduMOdNeFDZFGCIrqAaNkfoCWXpqwelmGqmGMCDNZIZKKQgbeuqpIMuXYaQXWQEEEaiIoRuKtLl",
		@"JLLuHRECnYmOfqLUHjmVfbBzzXwPQNhuZqsMHHLjlXJaIxenNCeTbHlFFnfGviMnKCqkQJGpmWbVSIvXAHhwWlQgFaPBLDosqheNlykMPc",
		@"PrYEUfHmftMAaVkuegeCCteZcXlhnbxfLNMwBKGmzFuJuMPYlTRdQELiaexTvjczszIusaNrrFSzOBFLlbhgEFadQnMeLQNKXYzHdMdBWVyVpgCwakNtSxlrqUKRwCbGvaHD",
	];
	return fMScQEetbPCZAvGAXQqP;
}

- (nonnull UIImage *)WnbdHfRuQYJUvoTssxstzxGD :(nonnull NSDictionary *)dbLhcwNmbQDapDiHwYayH :(nonnull NSData *)VhahyqNKRXrHiSZTCPAeWQi {
	NSData *acfWgHPuUiWHNTDBh = [@"YvitmVJVPsuFPKJuWeLQVwAkYBiLjCpriQAFxKrNKcYENZXHXJvUTUjWcrdzTPqOAbWfvIXgcJpIFlXJVHMVKHifeTSjzitHhtphHSwEybIVnRGicWxAmLrbLjTBUeNWGCbPjXcHYNLGavpLVVSE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sfTqGVaBsqBhhBqHoTdZHIx = [UIImage imageWithData:acfWgHPuUiWHNTDBh];
	sfTqGVaBsqBhhBqHoTdZHIx = [UIImage imageNamed:@"ONYOcMNDkJQhRxmsZbvkOySfyrPCBJTlekWsGjruvusVyaUGtcdVQoVKPJzeRvxdVnJXGnvaSPSETpZUEuASdcPoxTtNeeacdkMdZipidkFpxkZUMzgAJPSxObLZtSwXbTP"];
	return sfTqGVaBsqBhhBqHoTdZHIx;
}

+ (nonnull NSString *)PocZUhYCnGqFCTRzkqKkzyo :(nonnull NSData *)clDzpVjCEXSBYapeiq :(nonnull NSDictionary *)UqDHuPVtCXiGcA {
	NSString *SolGzcAvQNOa = @"SHxZUeuvvlMzMMoIwBCjHdbmQyvkFFjSwPsvGySaIjpiEXVjKklSDtZUveJNWLrmezZxilFsuPCQanyStytFXjTeggJLsdXBFaoBECvBwMaDSOmmgrorQlz";
	return SolGzcAvQNOa;
}

+ (nonnull NSData *)bMJmYqiOfizbmIThLT :(nonnull UIImage *)UXisILBHhLNXBp {
	NSData *IJYezOUTMiDY = [@"QRnKLhaerFdFCrgiepSYWIGSJGqDyrvmjKycfYYjZwzPzfSWXvmoWlsrKEvMOpjUYXvWuTqeHXpbLhfaelbLICYLNzicfBWkyoTAPnSRZbEYAUtQ" dataUsingEncoding:NSUTF8StringEncoding];
	return IJYezOUTMiDY;
}

- (nonnull NSDictionary *)rKTKJcrrsgRD :(nonnull NSDictionary *)IyGiqlNsaHhTwcVpKp :(nonnull UIImage *)tCvnNqJyCHMPuUES :(nonnull NSData *)jyeRPneZKwFWipX :(nonnull UIImage *)hetSxpOAzrlMFBElNI {
	NSDictionary *AlMVFKbgZzuF = @{
		@"mxabbKOnOzkpYBcqVRRUqjZN": @"AtrNQbcMqmuOPlXmwxINnvyxkGUbODMpIDZbcxGOpytZXwculOsXIrrOeWPiAmyCPTLCUtwsJNAbHSINSsTlSxqzPGUdmYlvzOiampkbeEs",
		@"XWsgoaIoWMSyBfoCkZEZKGZ": @"nONXlNASgQGhhNgqnAXroXUEULhAqeNKgetujpFPHOhtAPJYUmrDzySvifRNUvwaKVdZqPxHbiAGnjOkLNFatPHWcrTCcDlApGWqcRtkdl",
		@"pjAlcJpqgmoZsGqVMDiM": @"jYwmwkseCTdcSGIXsvKENnDPkYduxNDBIXnkAonKpyuElkbddoakZdQcIoZsUqkEgYEYpbBwGTkjMXdHMcxAAWqqPeEwIBJieSqZOClKNmrqdXngkWCKItopyLGAdVHPVVvaJdZDY",
		@"gdrVfZsERFsYLDHkR": @"XrokDtbThstAJQalyDiNVxzIphGKPshAXnLdfvfRKIVSLitJpUFWUNiXlCpWgMTsIRWgFeZKgmNyVnRopAAdvXSUbgtCvcoeoqVMoVezYYoSUAZWtGqUqBamjgpOLFwiUazvlkmBraXsfMOZe",
		@"uwuioWfofHeWTcbbFSpXQ": @"RUjRQdyqrlXjJQCxnYTruflFgsgbrNpnBdgiMcTZYjDxsQyVZtaGdWKHpxVfybYJnXrXtcBpGYGRatVPqGxbNfLyHmrHbTGCxTRVzuwJIhRKVESqNmMWTPjXzAzaVEwTQHoCvYXxKcBEPwRzZjv",
		@"ssBvCElwXkbUQPNz": @"OnXkuczGHuEfVPFvxMIIGcaFVbsbKXzWqZXgxdfDZsfMXGqthkeevTJkzFZUxlLjPsoumzRntHDaZLucjTeZBRVqujATHuVJxZlB",
		@"oeMnHXRKpF": @"enekgzJnXgSADsKFTKYBCfREprhajRPvnjuyLAulbioCmtvxdtLgFLoiFhfyWSmsMFZjCwPkmgvlIVFGOFvQAWPzGbZcBqshUEqzdmdLIYVyTNQPKqrczHpDeWgKFDgRNEkhmtpdhhMGcfR",
		@"KFpKGRDxyzSdnkmeEQCRFyA": @"VpCJeQzvgZzRuxPivIRTkPQtieRItOIxIOJupwNyqycUnvfnRgWpIJFsBpujWlizStdFsaDdmiuVrzaYUEVgyTFGGtFKhLIzuDCfMRJxOhFoQtUgJfJkngStxkagnXIADIcyGYdpXKUTGtFeqHm",
		@"idPZDysFRFVgksPoBESAOfv": @"LiqNzDBNzzyTaDjxQxvZAVQDDsMEUydzNRaTrMGviDGImcXZiBIweiwYdwlrckDyRGOGBHbfECPCCrbbdOXbmDJEiXRlFPoWIbiXeImrKDZTiKUEJSelfD",
		@"XGIdizVSpC": @"rlElpaxfuyQoyoLXxzSNGMviXsOLEaVZfFONiPiYlhgjoXSLRsPzkOggtivKjxAyAixvtsLXsYmCKzRoOXJNkidGBbyTVQdycOoeCg",
		@"zZClPJmaICirY": @"irDFpnDCLAHKQrxAVmfEvaLBAEuEQknEJZWsivFlgbxnnMHdeMqFSDzWvDYXvIfxSRGhMEmkrSXNzqQRVxEvSAkyEoRjgCTrruLKRsWvBbSwDsEzmfWAqMcJspkx",
		@"tznDPPPKCyZvaJRryUXI": @"FgEgjRWoxScszrCfcexXUuZJYqJmdpfcrVjLHwBBTZHWcdxDAwEOZcTwspzQeQTMYHbuQQyXhNdHrADSzsutLDfPvqnFdvCHbYDrQJPbWtShFVuoksVAZRxAxEQVtqciVWxWqGRcgRFb",
		@"COPYwPTgxLKqxzxjmmuCvpG": @"LTNVdooLiZjxlBpshATCHAyCuJqzJOclSNUKzHRaCEJffoaBMclnXjdXbbSuslNIBUUJhzxlMhIDPXphSobVlgVudcDAUyyKPRXUAwkUxUYhwqVAjUjrHwwsuxmuowhvRHKPCWVWmsJYmDrLlQn",
		@"LqbMOBNyYnkbysYsIwVNL": @"CkrGIzdYtldqqjVVHyAiOOSQqHlAibthhFzKhIqjmxtvgTnTSfQiXJyPemddvowvbMQioBmkarVlohxBWWiMSBsTQANGNnVrPkXevQ",
	};
	return AlMVFKbgZzuF;
}

- (nonnull NSArray *)VNLhCllwSgoC :(nonnull NSData *)LlIaRAjxghTW :(nonnull UIImage *)KXrzyHdfFMPRgEkXqiHDE :(nonnull NSArray *)zmdRSQSMOdzvDWcti :(nonnull NSDictionary *)KoRkHCSvUQcS :(nonnull NSDictionary *)hqyCJeaCyZINGcpblq {
	NSArray *uLgSnsLecXAPlboF = @[
		@"llgVQwQSqklqSefRmqjTVUyGQxjVTVWzdVnueLgBbavYPYjibNsLyrnlpjEdiYUlBiksZimeqOMYbaVOmTXGAVGxjpCbGjdkOyovqUxRtckrEOFJrhoniKnnyYdCbRFEsrLUullQFEPGN",
		@"eZnBQQEZNMtCuRhAGwKfKetHYDEQLzywFeiZOAeNqKNOLeAWJMWovGoKujebshJhfCelRuUvBslkNANnJeXPaBAHyTUHPDViOQCQVJciLHwxG",
		@"FFSjYYMOwFuIRdQuEilNSukOFwGBlgUWGpCyPgrtcOLGtXQZCnnLIGuBmUmmGzFvRdMKZWJWieTKtJalGdoroaCLDIILVHiwozyBEvAkIAvjRnXaHAhwnavPbKirMdLZEaMYmuRHyxIcifLsNsB",
		@"ijoUIyWSIbaFqSZFNRKWTciCtYSSnVeycxUdwHohgeRQXLrFMDBCTAfETOCMzbSkwwlzKdKhuTibUkKeOWShHJKeteBjptEsAkCiOWx",
		@"avtxmFJYczzbzRBzKgFxZMlSqvNeejlBYnoSXkrxIEKuKDPjRbNyfyNTdUaWsytfTRSkHsWMtLMLisybtVkirdPuesseqcsdVxqxWTGlXev",
		@"xffZmHQwJALpnpwFfJZEXaUsfFHxBTPtmorsUzdVVfBmBpFUGMVmutCvezezWQwxJxcsZvKgKqMFmOqFQfQOCPNDwyWWwYZmxFlh",
		@"QnVrPrTAuVbqOSoMaXozzLsawrjonrLfXKBunvpgkNeNNDVWTeyszRatIiipYLGdlGjhncmkObUNKBLxIVtnaLGFGZpBAzlZJBiVBHBjcHla",
		@"jWryTiMefuBDwTfKbckRmOCQuINVLVaJOJNWooUXAlCbxcsFpuaPkIPmmFgCNhmmdJOxTAqGmtUOaGcTBWkeCVNsPToYKvvQVQHkzlGHOgnaAyQAC",
		@"ZfHlRLYJXCEwZnLLMWvFhZOkjQBjRukWEotxpxcJmXACadaSmhGidSZBMtcYVeWNzxTHqaznMIcXXDEoezkymAavLzQbnHawyBJfgzjG",
		@"SMhXBuzkeVnDGEEUhpKJBCwgNTaodGufGzGWVxlLULyJxeJayHifnmpyzAZbQGHXVdzkBxADFevIKlNIkVxllRvuXiSthcEMudVfKfKLylf",
		@"xehzzWnKKRoKajloQkPVuuhTRpSJPOaWiTlwTNQZBykdhZblCOZLtQGJvJOLbzQtGoMQUKIxVPgrIqmGIMVHhGIMrQxKknoucTpsxcIIQzUEIQtuiNGCKgtCaVX",
		@"xTtpVlSlwtQNjhOiDijrWryuFvBSJwaPNRAzjEiblGXSQPufySJITyrqNxdxAkaZhtIUelPJOVOpBzZcIkuUBbIFxtVacALIZvoWhSHnD",
		@"lZEUmXEqkYfGxJxTrzUmYUuNOAPTIUQLkqYMqHkIvsybVLTMeoRDuGIfzSHZsSQYaRhXuPAjXtuZhDrxnpyjNsIJmkovarAyPpPFyBgawBAfWgaedWSRvYdnAiJqxZrd",
	];
	return uLgSnsLecXAPlboF;
}

+ (nonnull NSString *)OpMIwSQxyJaBJXLwLqT :(nonnull UIImage *)pJGyJkyEujZw :(nonnull UIImage *)SpyXWDsCuuOCd :(nonnull NSData *)bgoKJYxJkVfCqBrHAIZjG :(nonnull NSData *)CMYVewpbFzCVsnmUiQsbHwpR :(nonnull NSString *)urTdfcmIXTBkVe {
	NSString *jQxKzMwtPnNGwExifsdxyuX = @"BQhkVgQGznpsDGYVipZgOiwpkHAANSgrOGcSFBSzbWFRhAuNqRaQhnVAsLwnSRJKsutjssfALObESGduYTtPrrOibjuhLJmBDppEhteAOPYUaqVXUZvRykd";
	return jQxKzMwtPnNGwExifsdxyuX;
}

- (nonnull UIImage *)CEuXyCLYrSV :(nonnull NSString *)wAtYfxRnEzxGsX :(nonnull UIImage *)HoZeFTpQBqtSWyjSz {
	NSData *XsymFEHTLHTZZblKQFYeUR = [@"AITXnjWAJbfAjeUecYOKuwHaELEuWizAMAXsJNgYBudohCnSVjhuXHllFicVKsrSAfDJGNLlwPByCFypXZwCAaqrVVabwwmQLWxSYTAQxmEDezzZboUZixtvpJIFMdlmDslwqsbDQeS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EANkkqQSetRqULJBdugdW = [UIImage imageWithData:XsymFEHTLHTZZblKQFYeUR];
	EANkkqQSetRqULJBdugdW = [UIImage imageNamed:@"jhixrVDsWafVhrddmEUDZubwyhgnrgmfcIYhJWIQVkGSDFMovlsvdCkpxtVUjnXhaUnNiRqquTJmNuBEBwRePTUrkOCnROaarHVcHpylkvMzOmUDCUYYbariyPL"];
	return EANkkqQSetRqULJBdugdW;
}

+ (nonnull NSString *)MKZalkGnLGcrueXNMy :(nonnull NSData *)MOnyMRDMaJa :(nonnull UIImage *)hrBHtCxapMnkDYDboMaBrz :(nonnull UIImage *)KOrhMpkWEYgCXO {
	NSString *PieGcWvcjJbISYP = @"JbBuPawZHwASkLfpoXzzgOwqZibNoMyvrJNcvXEJdPlpUwClMnnRwBqJDrCJMVPhBpPveZbVkQaNtFdQcfNWbpLeYYhyCcdNqALbyWgylqL";
	return PieGcWvcjJbISYP;
}

+ (nonnull NSString *)eAcUENmVijsLngoihHUOqKK :(nonnull NSData *)prtdbCJHFRomHfBDEDbzV :(nonnull NSArray *)HfgsJBlKxyKPJqqnuJv :(nonnull UIImage *)IlorLyWMbzp :(nonnull NSString *)LSKqywhRchHB {
	NSString *rErSKfhzcUlhrzU = @"UJIyAGCiUSUDpYPiWMrxKBjSFqTCszfYLarcgFFVIPiprGcQpyvGdVobfUjWSvpqFictzepljODctLuxZdqmEtlPZEtkzHhxIGDgGRzariqMUv";
	return rErSKfhzcUlhrzU;
}

+ (nonnull NSData *)xdYspDjWaZCGvVhgp :(nonnull NSArray *)boluufPopyX {
	NSData *oWvdRtFgITtbljLgAGXd = [@"URaElIjtOUeqBsBVzGqLXCrAFaYuaysOQXWcVnLHoEzmgAETBUGzMClgJQqKNTMcIeuKGbTZPyBnDuCtjeyvymyoziIJQWpkiKpLRvuChAgDvYFSUjgXcAAxXgTqFTXEXkiHVNeAQVTBvJ" dataUsingEncoding:NSUTF8StringEncoding];
	return oWvdRtFgITtbljLgAGXd;
}

+ (nonnull UIImage *)mdwxwFjEXwCuaoaqE :(nonnull NSData *)KpNAPQKeAup {
	NSData *zEfzQpItVKsaBzimyk = [@"POuYmYiHRFEXlBLBqoEcySizPEGzFreYeoLOjSwYPvjORAXwfGNbZFQKxCGITOBFuOtwcxZuhaJHpmVWfXerkVcynLGVBlmbIWwjYUTRNPElSWQHrFtvRTcgZLnb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KlNRCsAMSBFdomftEi = [UIImage imageWithData:zEfzQpItVKsaBzimyk];
	KlNRCsAMSBFdomftEi = [UIImage imageNamed:@"oNiPTgSlwzViyxnqchxOAfAkJLrTbABFJKQOABitUGNscJPhnrYOENVFoJqnpIwfYGLlMKoTiqMLqHddMHiaFtUbIJCLVlzUoRwTXGKYzcPKMCFVGv"];
	return KlNRCsAMSBFdomftEi;
}

- (nonnull UIImage *)GjuzRbvdVDWWRKUNRBxRf :(nonnull NSDictionary *)FGYTczWxKYBEYKWtus :(nonnull NSDictionary *)xEKhUFRZqIFRdpFaEUC :(nonnull UIImage *)qNuHABmRWQia :(nonnull NSDictionary *)dojuWynJrNMdwxFA {
	NSData *RkkHZVPyCRxrmFzFmMCiCU = [@"vxjvXUrUQaSsjltdFesoCtyLGetjLqNhKWCZFvfLABGgXmtGZdjeuSajudlSNBgGeZjFYGKFyBLGWmdYLybFWnwfXZtNAdBBaLWRMQBcIrPVVWlVLldHUMUnAwxn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LhwJiTLQSVVnp = [UIImage imageWithData:RkkHZVPyCRxrmFzFmMCiCU];
	LhwJiTLQSVVnp = [UIImage imageNamed:@"CBtrmplIuJUWfhUnAfDymFaewLfsvCwXxPeCXGvwhzjSSDEjByZxJIRoRQCZxlhuIphuAvarLFlLGYWTPSYHknVKwAdmzWLftqwXHvlphYgZ"];
	return LhwJiTLQSVVnp;
}

+ (nonnull NSString *)TCMOAkAFXeFPUbbtMUMfo :(nonnull NSArray *)syEqUXbSSlN :(nonnull NSArray *)ATCKNCDcIKRd :(nonnull NSDictionary *)GEncEzaUCNvdybtI :(nonnull NSString *)MAHNjVHreuRgO {
	NSString *NtByIUZwSNx = @"yRXbLktDHJMSxUGjlCqGbyMoydzPMeUyjTMSjOJjsZntuckiaowIybNglvcYNNMpqbiUZsAeJYzUSfAsEeUatuESoRKgwlmdnMZvuxJEs";
	return NtByIUZwSNx;
}

- (nonnull NSData *)wWvBkHsFfeTax :(nonnull NSArray *)rpRAsrFhtfQ :(nonnull NSData *)oogEFzyvDraayXydYZfgV :(nonnull NSString *)QLblSNmNwDpMuOSSSCzBT :(nonnull NSArray *)hePdXXopneXIs {
	NSData *awBtIKKBbfUBFkLA = [@"vFqneYNbCVTLvRPmWwpcuNMimWpLqisdQPeaLFDnsINUvzUlaMDnZijNmnhEQQMoOlSanMMZzBrUDKCdrdwFEusRahnnrzStCPgdufPCvXQNSujdirAFyHUzOoIUkqomnFFOHDLHsEHP" dataUsingEncoding:NSUTF8StringEncoding];
	return awBtIKKBbfUBFkLA;
}

- (nonnull NSString *)zaNDFTkwoS :(nonnull NSString *)ChyioZDRtxAhDxCaHcFRMP :(nonnull UIImage *)MPhYEMTbwBZld :(nonnull UIImage *)dloTYwWDTntPKfDXlU {
	NSString *vwJFfrevRTDfhlJAJD = @"OvreoZlBoDkAxcbLorfalpOdkkpHYcSvWRfHlzhJClAnpDnXLPqTmKddCWdBuIBwpfPHydZHNkRbtIoefOWbohqcfzDCwRCPucCUTYfAOaDZjyOoawymudot";
	return vwJFfrevRTDfhlJAJD;
}

- (nonnull NSDictionary *)XgaUubxJdnkOBnEaRNE :(nonnull NSArray *)IHokAhWjQIU :(nonnull NSData *)xjScpbgvwQwopUSDI :(nonnull NSString *)gwGcFJXUXU {
	NSDictionary *xQyCLUTSkVWzYjmWNTNE = @{
		@"VGdIeyUAAmVnqbioAjXzIZN": @"hbqPCftJdpvDLhLRcDCFpxhMKegCmsSQKlmViubUSqmkmZQyCCKJmkGgMRDmOdkgwDcyazxOQQVkdnWgiPDfoYmImHyayjczXdyOQieUKNzqCR",
		@"lnAZPncRGyltz": @"cdErpereNywvUxRNfVStzByYhJpjxONYXXQpzDPyIwlksYWLegmeXgzUccjylXyqSWmXRkWKukwTlrNaDvbskJwyHUtSqjkHOvoKBQuu",
		@"gxzFmBSPyDdFhaOXtotHVtOY": @"fXZUprnTSLkacQKHIjGggrPCiCmwGWKqxJasYqzMAYijJbBIIbQvTEnjFiEyWVUgWErYEHBmutKCDHkmYriFyizceClLzQAvZAdWHHYevqEh",
		@"BJNpjioFMEAabQFgdxjSu": @"rcKZbHbsizyPklGaiYRtYvlOeNiGeUDHLohTqqWDHIYinkfBLwhFyNJbWuhBXQJAaYysVXocMBcPpOEVxHVqsOUfoxkuYPLPnswAsuifeWQUHZzh",
		@"coXlBlQmvS": @"qsmsYydvnIrLYcUTiAvdYyNDGOAZSiTskqdibNzbFEvYwScUYlcGQUgRcnjgaQzSBhxztxXHOezXLbwJIeAwQvgUzPcPorDTdNhyPullVfqeymohmuDKXzvBoHjqivyWXSBXAiarfna",
		@"unWBRnWKPUusFWoUqz": @"nftyGNtOjVlxAVJVaodglIgMwePAWAmvUMpLomsctqVFWdikdUmHpXaZtRYzEBRXXCROLbCCtNSeFuQRoBQKNWzYYvKagizYYVoIKDxfBaISlmk",
		@"uJMVaduUocx": @"gwAncHXJMlwCxqWmsMOlICSrkQXlLpDQysrcOpyGcHoVhNnKiXghhwKCFAtqwQXSPkEYrahKhWoNJaWxAlJUKIWjzrtDIfJJSfhkpzrNclzlizGpzfgLJHPPK",
		@"bhQRYNmFXZIY": @"nNrUJCpTdwejmHxRWYKrHPgOiczkqnjbeqisjRgTlBMrgLZHrLLYpmRLIaPiRLUePIDfCuevcuQpRQqJbSRKFrETDYDHCITJObbi",
		@"bpgmYWrZZDVM": @"dFwFtOEAOBypZGdgHMEtIaKRGpgmUmyZNTihbkzazxKWsbIhHXcrzLFXgfwnLWZtogpOBPAOqZQsbvjWFBHXgLIIllNNiADBFAqcgXRAXhUGGxZMji",
		@"lEtAhjvaObkqS": @"kjAWhrVWsVkKdlKTRBJyoPeIeguZORAphsKpDuomFwBBiqHaZxmtckZpdeEAPlhbLmhTNSfxuBnmzPialqSiKNMFhUUUEnwmPMmhfjhoodpvVGinkdSpkHwQWyUyHhpdgj",
		@"OWohXRgNunKfRohBBoLkswoz": @"JOPjXWxqwFQZuipccxkJyOaJPTfXLrsQWqTFshMpagvfPdpRLBaBJoheSyXiTPezFnXJZDHfcZxBXQCEvGsfqHNMQxHCwhpJuppbYRqxBGkDmyFmzeNWdLb",
		@"ufgOwuShscEnqthfLziWYKCW": @"xxNmlPHOMtMIkmKKtvbIEouByCDTcRfxJvcMoorKiaaxfeXAMVkGdKGmyLPnnCSLtbUrOnVSGOGPNDIjWGagmaKTnlbesqOObynQLfPhxZyFBXUPaICMa",
		@"ZxLkYgRJCmfDFH": @"cKgWQmXDXHZgTtiksMcjOVKmOigPkwVLJlOgXgDDaxLwfFjBVupehxQdWQECuzvwfcSozBXguaVzbdpghEsqxKBVZPNDUWcMeVjUqwdGfkq",
		@"uEUDeMYOkpOsCHSu": @"PKFuMDKFDOCXeIlFcMjOPDAQieTSkGrPiPrgpQVYyoBgTcGAzIOUqriDLLkILECytEUkYLoHrEyKqtqPdBwqYJfQyeeWAyfhesELrIuNbQdRdxcCOpOjEixAQo",
		@"HqtbWklehHsfuuTmxSJCmB": @"vmeZUVtrtTZsaOfNdYaOtwettOIyCWbXydjdjfilDWoJVGxNTvRUkuyHWDVUoUchTRhFUhAdWiSQQGQUhsXfRmZBdMfeMcYYmFEemxdzUAdCEPPHGwwizOTLtoUViHZyXlGpgUmFMWfn",
		@"phpChPuMtQcsuKoSLdill": @"PpyIeZRXrtXKmkZRxlYAxoAJOohkPzCaesJvaRXMcLTFcwiDJmpwXjQJmqKrgyuTnvMGjmaQIpYmmnhRUJuNazIzROAiCzRcCNNzJLugsWsCiLPLJTukmIlOJZt",
		@"ugvIwxfaUF": @"taYxgfShisoFMLHSdvnezDYobBDccFHLVGWyfiSmtWcvwCsTWKEgzlsUtfYUcNXyAJYiIsIyKwfswAYdsbAYQmXqXmZHRHjBOADNgzaKovMDXajtPTdvIPsfTtQJDLBEFhxnQHDjGHEgjXEL",
		@"TdwOsoNISwW": @"AAIKTetWACoLltcMrmEmKOKoZPgoiOZLzkhWSrbfxhURWPDnMDhATBfEqveprVtAAjecAgrODaNburQlZnegqjHjfcxOGazBYaIKNUVTSgczHyIcWgGfUInYuZYqiNiWfatucRnYMcpalIAemoc",
	};
	return xQyCLUTSkVWzYjmWNTNE;
}

+ (nonnull NSString *)StgVOevLetxSbvS :(nonnull NSDictionary *)MOiIIheLYBMmjqcmrGGvqZbq {
	NSString *KBGvEeOIqYEmcWMsylD = @"RsXDvWbVEPZWwJHpMYjjhzBjqCoyHzZqmjQnEmmGEtDyEzgGWQBnCrzWhPyxQwFVOhaJfttlbQtdcvmmAydNqoCbHuCbrOLzEZOjvlXmTgROaMUOQikxfaStFExGxHpi";
	return KBGvEeOIqYEmcWMsylD;
}

- (nonnull NSArray *)uJJespjSCCOikEadhUKCFCfF :(nonnull NSArray *)zGzLLiQgmEFPyNVLoppuK :(nonnull NSData *)BzKevpTTcyUTOebRYIS :(nonnull NSString *)bacWaOUHRkcgMNfXXDLUQke :(nonnull UIImage *)WtkRlSeZxudBvuPmhPXmR :(nonnull UIImage *)EooJhQkUayeBBLBKRC {
	NSArray *QUxnlMJBQY = @[
		@"xLlZzxamTahiPasqwIaWiDpaAYxbFVOIpIMEREawWZVlWBNwzwQNfoOCsmtDOBAXnWxUGqLfAeMKlAKNJpjiSdRQFjfubnrcRkowpfexhZriqirzItPoffWCenvszGIBkguYYFXDgqiNSEDCI",
		@"TXajTyMTGclBpoeWhrpzICmZtilySEvnKcTkKBcSKJGuVArVLHRgqjxShNWZGrcrcSFrIhibMXPIluXGDEAHTjvRcmpIlHLNEBvyGDMfIdYhzeVEyOlsqkkJA",
		@"SOuIvoqJdrWAgPMeGobYofmTuDTFebDjhTdqlCFTpLiiLDKpbCvdYWIezdBoLiTkiWaByVXNMuuBlXBOpNdTtrChDHaYyYVdpfWpYZNGsuRLOjLvvdw",
		@"pMmgEfiaWbTDZlZibWKTpBlskTrRCVpXonpqDnbMOfPWoQTlNLOshMrMKhyIeIVKhelYxurmYGaNlHdEEFwwTcTTkTJWyUOIxALCmbGucqfcTGoLhanjJZxOwGuTjmOVcKCqMjRMLk",
		@"tteNdcXOMCNUNbjztcfryePrNjfFHVwjhOYARBLooPDBmtxpbwFVPwJUFSqdNiephZxDtKrLZlAOVlXPbTkRjHxwsoTSNpiNNWjnFytnvJB",
		@"LGabIhEsKUBkkVmpVJNGKWcsJYHzMVNgVTncFIyxhKLGOpvmyqRjHnpkVQXDgrytdKtzJybQJktQLzaKkMVvBWXuFEBSAbrpYbgPyYsltmpWbPFpxdHbNGbtobVyrS",
		@"xvHHSVkTlmFjQQGFsFOgcJXCsLRbkltWKUKplJDoFERrNQavBCsiwwWUxFfUxUDNgTFdDTfZURqPqxFDUkvjmmAqsvtLtJyvYCDpvfUpZgWXoMPrpGRfPWqwmSHIblyeZAmkdPHoH",
		@"tkcGJHhcCISbADFCRRtDUlPvFJEsIqXIzVHBZbIRgRaahplHMrzPxkUFSFXrVBKUAzDjbTVjntXriyCRwnifwbOfDOSjaYsEYskAxSSUiFptEfwjQtRvHjCtobAT",
		@"lFYAQvVVvdtGGQolhhQMwisQFjkRDDmsNJZIslblcurKwqhllDcIDPxzbpQuHLWLMouxTYmIUNMyhLjOksyPoGxgSdqMdvUkHAwGfueRRBvpZdxhjMW",
		@"IpEfTOxIkIKXiHEvYZVpowXiXYJztBYVSIOHjXQEvNGJTWNrIhIeYtmscHjWaoxnvauMRhCKdaHqwOoyzofmmnoKOBcttUTGYFwwJyYrwixxmWlGQlgQp",
		@"uARLqFcYpeGjVvduRIkdOUAdBCgUOclaRgmpvAmCbqGgckyOSjxqFIDiWeEDZGUQWqNMWuwhowrPDoBaFCWnAWgiwwPYaZeYWUJJqSHLRPQhAkPaiAUeIwEsWgIOEoUCRRo",
		@"FnqpykeqFDvNTFIcIfRfJmtmsyLCrHTjvZfxptkYhqDkTbrmPvJkWVjFpXbcxCIQVUExBWlEPdrLNZPeaZGdsMuKDKrqZzpHahlLLMwQADDJIySJAuItzBaVCwqFCHDtvl",
		@"MhwHzmvVcIEnwjSPQLZAYGINOGAUWlvsjPVomGmlEVOCxEnCUQgoUpWxzOIHDwLAzcrlbHBdvlHxAWKQKWzCTVLijUxkjUBxLkgrVKcqIcEMNveYqDBadaXkjJllD",
		@"JoHvLTRcTmnDTUvbaTNjTJKEPJSgwILTmjEZIALAobNJzjjoTAVMCMUndYhLjYogsmxVALdYjXGpKyzHaEHkjYDRAHPnkYDEphJtNAhVotvVLEBefR",
		@"wnjdVmlDLTBUfphjssDvEHjLXpltFtaaJzqwBIVRTpmehHejBAfcejNXkwUNOqDUpeoJJiPRYHJKEsjugwoLCrSjIeSGNDNzESZKBUBSKbmarXgDrKwJSnJrwtqgvqvsaDNIRcwgABrtwOKrIyWVT",
		@"DrTjUNLOaDjhFkCssHwESOkJvVxKzWZiPfCocUvQtFiMaTbwVCPehYKIGTUZniiONaGUdOEgrQCMDBSvkFJlBDENJUXDvmpIMoWejSKTrQBZioCSExLxMaJqGHRNhjNFpjzAUOZiCxWiRgaU",
		@"izccqqtRgVdmAQMeXYJRosfSsVbhKInRAChCEhbKBiBrXpHcUNyMIgEdFMrFBANdJEKgBXpXcvOXqhkdvCITloRfPCvXtnHzKLMfpidMwqFZBYqWNFeJGiWzim",
		@"tlpbVtICpNbasgBoQtwYjxRjqPKELOLPUYPXTMrLCAnqZjpHHcKHehpUceYvcWlWAiLxrEkTBISnSBIFzSHsSTApFcIuPhQLjQLCdlIeUimvuLAsgcVymhOnBXydt",
	];
	return QUxnlMJBQY;
}

+ (nonnull NSDictionary *)hSRLfRTAdogC :(nonnull NSString *)yRIIwswfCqYeNfYm :(nonnull NSDictionary *)IWOeFiRTruj :(nonnull UIImage *)wjIwjkskegbvJTEjLzLVWMeP :(nonnull NSString *)xLlqoDBSmKVHYiNNfpNU {
	NSDictionary *geaIRcdlMTqw = @{
		@"izzwctooeYjLtwkHagGhl": @"RHETedtskSmZYndAsOYNgjuIaYVTqJvlcMtMKCtHbQlQJaYxWZWojnLnICSibtoFbeZTxhZZgKkswnfGDhkWeVDhNcaNybryvidxPuyPss",
		@"jJJbCNWMTnrKBsjTIGSR": @"rMhpaAMViVgpeBIACwVgMTutZIhbPrtPSTYuUOBshvMkxdVPIOGuVaMJkDAuBcpGtieMwsJfPJPxyZZSwkqCFCEotxJYMzwaOUkvuw",
		@"ZajGnjGbkGDUJRTb": @"LcLCKfdEZIwLCmeDWeanNCUkLMbdqloFNPIfNkEZZHVjtfetlMTKmJNnmwmIXBksUHAmChIHsPHToFBwBbPacDDqWeraLQviELhgs",
		@"fiMJiMeGfKm": @"fVrStkIowMnmOtRDBTGvRNtfCRRiTNDOMXEGftsQgMLfavhinCJUamyJIQhPlfhVvKvUCBBkkuGXGdzUJZofDNaFcMoNiDaWrkZNyl",
		@"ifqdNpgeVdXGiK": @"RAWXXHfANLiIUoZQFgOkLACbEOHtCEnitfXZONpyttqAIlJNRyqBvluiyHpYwEGVroCjClIVFvlIfqUfySVrFcvVbXqgWnMliigTTMnfgNFmdhEnRDy",
		@"fOhHaTdJvqNzWSoIqs": @"vzVxGfNFzhSOocklNIqjjkGPtQJeTHpjZXIFsaHimPvqWupmGJaTiblHFaQVCBpAxKCXaFgWyZaLAQgLORrlgCsBiKpzyhiqERdZrSItOuH",
		@"ZDZwyobICcYgGubPqxVKUip": @"QMKuelJMYwUIHDHFZaioJYcqdFEvvXzBGDcZMaVxiwnKcEirJDubenXZfNexDSJeHusmddYmTCVPAOXoqecyHwEXBwcyXrHunxdJoamrYbijsKTTCbfDiODOauNoFdMBzGzkozfCxNlaJZ",
		@"uHcmHgLEWEgscWseGmyhe": @"aDWZOTeFFgdzpWrmuZpiXfovDacNwSbDZtczztcfTzWdHsKyNQwTXkEOPgTiqaGIeSDhyQjCJhjxvcokWYSNLINiQqkEtujtdekJthwIOopmHDHOBfpPyf",
		@"MVyinZYOoGTUmYBhwmwl": @"pWVrMTRzmyeoTeKOCHfLwNXRjtQejGlYmCFdukvQmeUXxSifKEyIAVoUZtwKLnzOcaESaZGqwGFqmJgwPeQlfzGERwEacVGdWRfYgNccnf",
		@"zUvIZnDyrGt": @"fdAHVMzUvLkAtwtvahglfUOqdtPXSeiaNderCwJnSIDwHQMnHlqqyTGXeKvYTvyyiEgKWcWcOnmZbJZTcJGBaVxvbDNhIzeRyyQZkWEXdpxNRvJWGT",
	};
	return geaIRcdlMTqw;
}

+ (nonnull NSData *)MmqVshdNupIWQbeoFDk :(nonnull UIImage *)nYshpfVjaqVJihjBHXOZ :(nonnull NSData *)qxKeDsAbubmIvjeXnygCn :(nonnull NSDictionary *)rGhmCtCjqEJhUDIf :(nonnull NSArray *)NqaDMQEABiVTSMaw {
	NSData *BoFpwEwakKXpWkxtjtUeW = [@"RgbdBfFaECSzSQKMNieufOvDDWEkusbizpyLImMAAgTecNLnEQlPfJNHihgjsggXFrYSxLGgzbURbxhKdCuqZFwKQHsxxdmPlJoxpHoRizAAGehQJtzJcZMongZ" dataUsingEncoding:NSUTF8StringEncoding];
	return BoFpwEwakKXpWkxtjtUeW;
}

+ (nonnull NSString *)zPNJkYSceESR :(nonnull NSArray *)IbNJVMRFLoyLxRt :(nonnull UIImage *)zOLXefdSZlYpgDR :(nonnull NSDictionary *)xbeNLgbOuiXkppjUceUJViBx :(nonnull NSString *)eOchLyHSWTviSOillzDmEmoJ :(nonnull NSData *)NkommFCdrJksAEoUdMBCi {
	NSString *DieXvTQaXSqqvBqFuQYr = @"JbAzBmvrMNnoKiSSnVtktqyBZGzsoeXMvZlFBEgdrxuQUdzSPtAYrekGWjpapvybzvKRYgixtNhHYlmJLIJYXYJDaJNEeIIwdzbXbRAPRuiHhQGGZlQYFIJMdmQtYZPXBVzRhTBxJgnjYbYtXxmL";
	return DieXvTQaXSqqvBqFuQYr;
}

- (nonnull NSArray *)wQdFOLhnumamIIo :(nonnull NSString *)oUhiBqzKfdyGBRqDS :(nonnull NSDictionary *)YOBRmlTpkZ {
	NSArray *USebqhTFry = @[
		@"qcRoXQpzPziUtptaQQyIcHQodRrOULDtTSsTWHVGUKWJiFYEYzKCVpPwvvnJWrSucfWbPrGLkriMIFeeiZyzZoipiuYRucbQRgFwJCoDkJIBAMQBxRg",
		@"wDJYKghGzPxJigxIsbnpRJfaOkhIkzKXqdwqmhtMgLfluIcCTNQcVarIHCZUrMtQskhOGtlHRaEKAsJZerKFoxiFEQjIgMTSwAEvvTgKbfdyT",
		@"kmhXbeyjdeaCECXtLCRwzgMrbrNcavookfjhgNMKBAMuXLanKbkIoDHOufbKPycfaBKtbfHsJFSJXMIjoNkIImPEGGUwqlGSVlfzRLfzBibvKYkVWfrLRXGiHHtgBjhsFteu",
		@"HyobBoioMRfHSbkBqiwZdIUelNOOEBKuZnJOnqzNzGDywxJfOynGebzosfEGVIExUjcVRsEqYzCoZjFNJqVXSHteFoqBVBfGuYfoRQtMwhyfsooiFILLmdxPzVdYsGTkbxRmwvHBjUOpjoA",
		@"IOEpmvIhbDImQBLaRyhKcemfvYmAdLKjqpslpnfbvtWndeiKGrPqkHuLhggFgslFauwXvusAWtLsaqtxCMXkJGyfukNRPRuPIgDBsRKoUUVFebubHkdbKJJtTsjQAWhGAlwVUzsSSA",
		@"YlUDbzFFKNpknzvSMooFQDgCDQYvtnaNHEkrOnrgBXOoPTnmyIpsxKzfEJDdkDpgJNIgleyYdsVDnUJoGIImHSbTyoxYWtyDSJpvDcsLrGf",
		@"XklyxwOKtnEKudmEviozHlSYgloMLszOZSYktviFMwBxjoTEpsVytHDpPMlgEXZWacfAgRCuzpQVbSHhlVmWWnwnShRDmtrqDqHOeiGZZFoE",
		@"ApjCRDdegZVopiSpZqyDUHgHWNxQyjugrXvQVkZPRnGywrAmTkddEkBwGkPJxysZJfrwYoYqLjGKnyuWAdymVbylNUcifFVBHuONpABMElDXuebTmZKwOrEUYIuiS",
		@"XNQHALqrDQwGGfytssYbBtnEcaiLiGpMcdTqxvEiRIuPaWolrYbTVAMZwgZnPZLWayDhePmIROVzdDDNMSXknySekerfDGuwjnEoVQRipWGD",
		@"TtWcJcGqxVTSJdCaNYnuZLBtWQmUzsLCUHooSVtDzqfpjQUbFODRWBngZawqRCEMaDEmvoFteKrGxCQbWfiVHNvlNxszYmuPNEZQLVcuvIUxSQZuCYlARydotkcWANHwo",
		@"aoDwZPsIuPSWPUOSBVbPuAQuwwBmCSlQqVtsJtkxTkOaprEMTSyeAvoKCfodPHYLNSaWyGICgKBvOmhilMHRKlpvczUEZMIdKuBGSakISwKGAKJmkIUGamcgvQzYUjqnOGeGdlDKhRUgioNIM",
		@"VtiDaRRUlhYtqhvVxdxYJnjbWblNFXWjlrIagxLtzLGHrVQqcUMPcriSlHsXjOKNMOUJiqUUqiUvDqSrwtIEvauvgUnKolGDkZUacQnktbDkDXKXSdQr",
		@"meizxLiUhbFchExFaPnvSdgGyNEBgqdEoDtVNKmDbUhElVdnyptSTVAMFCtkFIdnvTqiaHVYPDFjEJoAAvYuZyuPJqBtmIHEKBpDPtEQNyZRlULi",
		@"KtYAMmgukzQRfOKiIKItvQSWTOYvCfIBgKluZdzVnFIzdMmuqxMIZZUlTUWTHmwKpTwLtbLwoneHMcETJpAlfamKcCFvtVkNxXAJbHAYjoupzj",
		@"NsbDWrCfwjXwzcgqhyoJOViIGViMpfYphqGvdDTfUasQGMbShhwpsoyhkcQsTUUCwYLmjtZULXvfBVfalZlAuhPXBWjCPYqQHilSCrwBAGKQdPVbiXFZWAwtfDmORRUiWhEDnNvZeTbFhK",
		@"JVbQwEuHrhYGuVCdocEsQkqesJReZozbwWNuYvvvyTrvbYTxbCwSgxOZpqspfOYOWAxaDWcYsIopbvffySdujRVUhyEQxYysKsxvtcCamMxvtAS",
		@"oEVKIInyfOhbaHeKyORszofitXOiBwcwBaQuqIBCKCBFiEWszqhwqVaaDbJAcDeAcRYRIYyadLgDVNzObYZNFwuimhWqxzmbBHynVySInVJxDoHNeyRvAMAhBUdjrPSeSpRPtysoewROv",
	];
	return USebqhTFry;
}

- (nonnull NSArray *)cLMRbqjoJaGOWX :(nonnull NSString *)HTswVNJMFnKING :(nonnull NSDictionary *)YTToHEEvnRVoxxyA {
	NSArray *GHbITOwNjuaJOjuqTu = @[
		@"GRdYkiqUkDVEBKwSBGoJcljCnjblKFbfVeEOySnCRdVsaguoPQtzbkvlUlpCOeofgJVxdpSiKWKsssYoMmKDmufavzZHsvlJUDjBCUouDegJCaqjVc",
		@"SeVBsUGPEJBdouIIvRCBuxBVFSVmrTUWXGCCUjkqNEfRDxbpoLdeHRjpKqbUpPrOwXpbrwRxrjUOmGJlFGHySfyBVkIZgOqumJST",
		@"VpHmIIFHwmCcaRMwWlczZbxERWQUKTOFxJslPQqnnHtBBikCaPJxcOtYwlAmATtocuQmDZgRVvlAcshzJFqmlCFcWzWwXwuRBIiLKdqNwpqCMONzFjaAbvHmnwukjeuvOKZyTZFl",
		@"CgzkKpFGUvzUBhciscuIeJOhTDdrLIYsabFiipesPLxvnflnQpvGrihUZfxZTyvsBNWLperqgWztCLrFXyaMNzyaPfujnzjsqYzUjmI",
		@"EjjwKSJoABuPZZjNouKhhORXcRiPQXUdEeIkDLbwHmfaNPgoYZrLLlyflmOMJnWhNBeyucUwkKgORgfGEyEBIKSeyEZeEvgbiaHqyDyLKxf",
		@"PRxoSPnzrIuArCRWmoVWCDyhPYzxHqWVkEkQxuxTWcCyeUmYRtlEUbhUVjUzxacyDCaQmfKgyiobBhdVskRDDLThPXabqjxBMHGAemfmPlMzbmNWYUbYzSSiQqEwfCoLtNWYzgRJdVljxZb",
		@"JQGoZVgpJezgplQNAFNjMHhkhSZsvawJXJVcDuOQpKDRIWMuKLhvWTvANrhdRBvfhydsZNULzhubPJaPyZiMWzdJafxxzIxCAKhdkQJYLzH",
		@"TPmKIhebRNHsGwnIayantRaZRqwPgmITxhwHzBsUYTuxxQVTcrusMjBKDJROGhMowKoBGGlPVudOfjFhHlCbchLXttAUzBygwXcx",
		@"uzsVJtKzRPxCNpwHqFcWXoDAhWjuNqqfOMlyvYPREcrDyIjgbLiRdNItPeYbXMcSUErRtmHQGKdGpEmZTwbwrOSrxlThCgfeVmjnDbjxJXLFYAyMYBAJSJsnvtONQtypnoYkXivOwvpQnvxILV",
		@"ZNJRYtApzGRxmEQzvyUobPBYXIgenWfQzbZPNcQiJAHZKttjYzCASTXFnFQyaHTKeKHNpjLqYIWIrLmVRNhCHuGJFAsFNaSDRQinieeLHMnyWJxSuUuMvDfsG",
		@"jOITyODpWIFTxQvtMEuYxiNJtxUVIsZrVtdUmuWonluCezFViEMKEgESAeXrdajrWeYWrjotPmiLdRHuRZPdVAkYsDJFFCdRKqvdkQOZVfjoAdLbEeQKzGqeYTRQqvkKxaQrVzdMqEwGByWNwBl",
		@"vHGXQddAVsIbabwJZtyqQGpMsfBVFEhehGhpyPHTnyhLcKmVLSZcIVFzifbofyLfyXZhLEOaqYyKCIImczccpaJpAyvxJguSjhSuFZfEyZcUCB",
		@"mlHLbKlUTLsBTabUITJMoelJtWNonSYCbuhcPiOXzohhKkJBGjifbdJUZPmxpNVpOtPhoQQyRBEaasQqRYvOiZryGcNeLXuUbifpWpDGeNHmEewcUwxUYYesINgraEOhRWVvyxuxNwyCe",
		@"uVKmFIhMSOrXdmMFiMRZMHklEAdDIjfkYwWwJrCDVwVVDRPzWwpatGPueBzeDlFxinGsAosTMiRUQUkHnsEIaOllLrzsFDRmiwVhDIuxCtcMqIBPjAXGUblS",
		@"eyAYICjASyLaNCnaNqOlmXbIAlcCAUfqxPjjmdwadzdsHmNDHkSEtskgUQTpiNrzgnWrZzrqbDfaEYAJIgWZRxziVsJzhPOcbFlngdEFQDQBzdmGPiCWbhHnYZznayDipwpYBifJEM",
		@"QpmaTqlHPXcOGJQZOvHfQhVaJrufTHMGaKXapafTTgKtEthhjhNGtVnHENEzmEoDryIiDHlGFngmxEQoPKKFjGaOsNXPriTIVzdjmKfvROPJMWNiOeJaelBY",
		@"mHHDzYUxueKvfNwNtqwtFsSPYSAHkolMiIhXaJpgSvXCUnofXFBCGnjcfYipJaAQMsrqWPRfxUslauRXJJBBkdGJGkoFaewnBYdxXChXUvPJTYxPgwVaVujZlAXZQJEcfRKnfaTd",
		@"iLJYWxOucnNxAowPKXWpoGVFEVpFgMYkVTRuzQXLCsqRBDGTUWbwVfJDyyWRAVoZlUcCVKTJAqDmsDmTgcMGwsqlFCdzplJcBSFBiOuBAUyKewMDeoaKeQC",
	];
	return GHbITOwNjuaJOjuqTu;
}

- (nonnull NSDictionary *)swUDhVxuiZSRjbMqDVKF :(nonnull NSDictionary *)JAPydaUxvyhmQzjVJWCMbn :(nonnull NSString *)QkpumxRSDdXkdi :(nonnull NSDictionary *)EDQtoFgvFGgvbEF :(nonnull NSString *)AiUPgXBBsMPSbk :(nonnull NSData *)sRQCciCXcPGUaTHdh {
	NSDictionary *PUZSLwhluMJV = @{
		@"EpLZludHaYaEMpEhq": @"gmHHGdyBMDmGBiBsQdobfMuGIkaVxgQzDbwgXmDPTkOVOpKpZZFmEgwUpddNooVDzWkJQuwEhbjwLOpwcGCVXNIvGUOEdlwQOHNOKJoExVmnmRmxWMmuTyTgUxPqJ",
		@"TihVPjNIGXyfNONcwvVr": @"OnvYBkkqDkwLteVAzuwqoZelcrgMBQncMNVYOHethlaaJabSYCiuvUartTIXLqepKEkPwfkLndAGSeJirNPGxjtJsyrrdjZmcSMSQHGJmbrjZDfeWobTavFsX",
		@"VIylbEnqhOdUHb": @"AfURDowvlQxTQQpZzlcPzQwGySbNGRdmwPfLSWdnKZkPmQQDxzJTMytKmovpNRGxsZuEmMdYjLqXbMGZiAHlBjSdLQZQKiXdeEGZOdWD",
		@"rStfjzrvKiRNkcIYGwP": @"nRgbmqOTqAOejMJGDWOPYthjqGtamLZszDGrBXDXoVJXRHehmLnFRXgHWygPnvBrMMRhZeLBACaFyltlfrYEtzVdrtdsmSogQqlYl",
		@"rJslETPUnkrK": @"MlpoJhpQxIePBtLMlfArYoPoITXpdNcwTYuEcNdkXEQBhnRbaUvqgooonmXMjQZlIwaWSWscxZdTNIspqbGxbOnphwcLLZAvlTLRYFXBTwcuKYRJDKniVshlgoocONSeDQzEfpgem",
		@"yLLcZMoAnUPuTXftKm": @"lXblQlIQslYNUjZoIwcAmZdNYiegYjXrGnosPbCThTehlSiOtePEpdRHCXKJErzqkMTEBJBQzKcgSiDSzNTdsCzKXLbSDqoeUgDIKlUgIvSCqlXBETTejXwfiP",
		@"pEXgEJyrRhPBUz": @"TouKzwVtyIgocehULPjhgOXTjWQeRqEdGvLzxoEWnhHjrMtwoxenNFiuIPoJgxtufomoWMSMWeypePXPNUOSWJkuYEIBimwaufQheGGUZCPzdhMWIBHqhowrFBUBHksm",
		@"GiHkqlNBDzkFzyxOarGy": @"nhoOYjEQnEhdreCABXHqAzfsHDtmXCcBIjvEftueBikilzEjxCLgSvnzAwdAWIzNDTKHMdqAoOUpMtERodLhHJkLGWNIfHwYyIIrgINTv",
		@"CjAyBPSCRK": @"EBxzZabeepGswUGksCmjElUfIcOXINWezFNBMckOfmjKTmsPxHdsfJuGjpgGIDDXzZvQolSoYDRgorHPGNiwVdPxPNlbVEuHwllXdeBrSoirUue",
		@"fGxSJRcgys": @"JKhmXJUbpmomGLLFvDVluHbbWtvPAXuMmXWOSTQDobzxScXYGlCeLsYmQeqEOZTHxXRvaxtdcQJdantBrunMJJMtPrHzFayxLxhopMTCTthhgmadhPlFaZzmUjtuithbeszJpLVUbjVNFheOL",
		@"mTODKbHoqKFqYzUgfchqWCY": @"xYvXVuiHBwYzVubEsKDvymAkaaFpLksOsDJnolLBNkuzYAxwePkaWTYivxImLKXyfezBfPPsrdCNpmcUgKBkzTxbbyuemCUitXGzHjvBvwGjaPvnbjgBLLiuzoWR",
		@"FRoEYVTjNHDgIhhfGDxKN": @"hpVJhSkRJAyYoGnrVaagFFgCuXSLenOQBlfbTMWbcosrtQzMYzUjzucyPoNRRNHadQAqAdmMeozsfIcTENskxgNOUicAwaloTXSzEqgIIEalxmIPeZQdOYvgOilzkdiNsGZUjn",
	};
	return PUZSLwhluMJV;
}

- (nonnull NSString *)IYEQcDasVXNutzX :(nonnull NSDictionary *)BttZFwACvcYjlRSzj :(nonnull NSString *)HvgHjNtoTqwACr :(nonnull UIImage *)uaxnxCfIlRziqDJMkdxp {
	NSString *ddRxUBOdDJXIyUDYfnFqnlo = @"HORdkovXlZTNTRdRqxyCCyxjYeUYaCYYjJDCXfJsirPbXrGJrfFqLdnIOzdcBUwQleSqdIHYqWEyuyWyvvVzQcwmGqdWyAUmeiIknmOYQoKdwKfeDOopvdIQNgdH";
	return ddRxUBOdDJXIyUDYfnFqnlo;
}

- (nonnull UIImage *)HZeolAGAgXq :(nonnull NSArray *)GsfBtpMzRUKzspsxmmmZbE :(nonnull NSArray *)wcLlcSnHiiMnsfvLkn :(nonnull NSArray *)qfelmxamSblovRTxwdjvkaq {
	NSData *ubFnBHSvqvOlJFLpjbgfRC = [@"XcvlphPvFxLBdQkPAqTRzNoZDUgokOLpLimuXsduAzDFurolXIpkUGrihXbVDbHzdCANoRulbCrqQztCjKQcZYdEcsOKuqPefcRYcoXjCJLsEGkfpspFKfmHwOCzoklZXepsRhut" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CYfahatRTLZ = [UIImage imageWithData:ubFnBHSvqvOlJFLpjbgfRC];
	CYfahatRTLZ = [UIImage imageNamed:@"rTidLYPWrHRHdKXmwYFsEjvnasvOvOnnwsGoAkRwZulbFnaIjjePWTdWWxZnEfsYaqxqyvTLczJJmPEvQEjuODwVCeOHQeaBCCTRgXjNfjxZSbKBVNnCzEiCB"];
	return CYfahatRTLZ;
}

+ (nonnull UIImage *)nYDyQQZBdzHtrRhKzgh :(nonnull NSArray *)XGcCjkjvEnlERwklCrnSYuMa :(nonnull NSArray *)nEcZbsAquOlhzNp :(nonnull UIImage *)bGrhvMNNLxqYrcIArATb {
	NSData *wqjdGKPELxZyaYbCCzPJ = [@"JSjbRwhpyKbzAkvLFWsczqvUXqViGKNPFVINBhrhoNYtITxKgtjylvUenQJOxWNntUHgPILHoInihkeTwwdTKMDDdVFsERvfyoNrktWhPmberSZwkmWDfsbVQRDBTDlVpZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qrQFVguWsIPHCpkvxduUWw = [UIImage imageWithData:wqjdGKPELxZyaYbCCzPJ];
	qrQFVguWsIPHCpkvxduUWw = [UIImage imageNamed:@"zTSoecuvFnXilOsaSkRDGtJhnAYnHdmqydHUCZuUdGRNsgZoKiKawAHgqszAwoVvPGHOMEXaJTHtAwNwRhXDPrKrKpMqdKwXfbAvNZYdCkKX"];
	return qrQFVguWsIPHCpkvxduUWw;
}

- (nonnull NSArray *)zVxAvFjKNkPlNDhiBNWOt :(nonnull NSDictionary *)BOBtXyCSlsaBB :(nonnull UIImage *)iZMTLWKBmPLnwLgjNyxu :(nonnull NSData *)uOyutbljUiZEgAwKBYDfsc :(nonnull NSArray *)uDACsVjhhoDPXzkASa {
	NSArray *cooifIOMToDGSBMEHDa = @[
		@"FALFEoefXAmjhmrSGoXqxspmqOkPoqrxQfyEjLKFifaZjrUpkghlypmVylgrxrxzWrpKZdspMamWNYUIWJognayBGmQqqknuGMRBFcQUAmPWNTMVxfMk",
		@"kIIPBINyLZyJNBcsYFQKKhGZxlWnXVmHUrrsBeAOILaTnCasROMyitdPqlEAYtiWMaPNEbDWPLKqaIXfGTzSuFFmZHivtSyVeHvM",
		@"XTZDSvKxbzmPSzbHCAxKFIWEHrtyuoGNYbsVTOFYIgRaFcqOKlMxQhzYCkHpxvnjnwScmdeAbyMmEWHnsEpNwyvDlhlsaJvVfjABRBboeJBZUkIFPxIICijxPQYbIvkCmfrxThyeqBHnUWZuHyX",
		@"FkUzmhygUWEpuiqAHyyAoocaMtJcFegzLBBadGtyHRPcllgVeaBUspFJwMSivcUBWcFZIoRxHfKeHbiIknxnHZrbaewaggKUoCFQwCXpkmNZNxRRbArhKMXwYEgbyiZJTRpDIpQbYdzJju",
		@"aySioHgThjsjwAVgstCIhCdOTqEwLsdsYyDDwbToQkJgGjiheTRaEgCedkrdaKuytQFzGdDFcgTvNlSaiKqjHTDlcqeYgFyRFVjLdneSOatHEnYDAfEFDPSDTiPLuVprwHZFDYeHxlbfnAzwn",
		@"cIBeOihdDmaVpDKiZbetdiXFFmRHEXSbEoVdLGmjByAkkhlpPCNCqjbFfbsWiVnaDKmZAFyAjXcotwhMPhZsXfxITfmjNdwFjokyYMPkaIxrVBIsSdpBKbJacUZhDfOspqviucfL",
		@"fIImGDmZlLjvuaLXTRMGizYlqBKjDbJNQnAGCJAJsgyScqVRcIVgyrscHUtTmipCVSQpycsBPFSPShayTNXlxONXEDMgTkRHDdiUKGQRdvBGMOThJ",
		@"qulTcNEjPjwQMzryxdhXuhCogOqWZSfgtfcUVWcIuAnFWZcqQEmSaBLaJrLsUACTcPVZVEKDcLlENSxZLcOXtgbHltufeTAVeAfay",
		@"EMDhSCBlXPBgelrBpDovxjKfXfNUucBawMShLOCNDnpuMPrwYRTpuYjhphIfsgehersYrilOBGJFDlhAHDKnTpxolPqGOYdNkEIIkGjgMHKtvpeRurqfYmxSRxKXiqFXIdLjQQiZuJfoFRNb",
		@"MmJZwhGkDvTrqmJVWTxYeHrTHqsiEmuypFKofZJWeugWzWXNtOwBqluKRmhXSzxIdlzEWBkWdFmeaeyYSpjLXLleXdhmZkIjqbMABOFVlYkus",
		@"ctMSwKFkzMhUNJHDSecqKtXRfhIwKFGZCodNdMPIXKuhQDtGvzCjkGZgiQUEqSlZxVCJQxHeCUdWXFZSpBXBzAoQXVDBCRukXdfGgGvHgdWjlIPFWNpxnRAzpyKrhrISiLXME",
		@"LhucpUWtzGcgVCZqzAOAPWVwgsApjbginFmyhLgguScCqDfHfUiFlEsHMlJVOnzIHOJeFvoAVSXsmBNNhkNhbRWrpfNQMthqQyRvVRPCLTxBRKRQYTnCcZClRkrkAZWjUx",
	];
	return cooifIOMToDGSBMEHDa;
}

+ (nonnull NSData *)rdLXtjkiNQ :(nonnull UIImage *)lCpAEvbMGfjUbp {
	NSData *UOVSCIDgRVruNK = [@"OdxVWnaMdPzGioEjECmeuwgAEjNbvJZcFzoocPKXRyKkTwacljWxLmpAmrzLnaFJREjtJVtaGrwOhaqpKTeWoFdXtiAZUPYhNDlQqIPOnOH" dataUsingEncoding:NSUTF8StringEncoding];
	return UOVSCIDgRVruNK;
}

+ (nonnull UIImage *)qYcBZbZiCHRjSc :(nonnull NSData *)MLoomqiBBqGl :(nonnull NSArray *)wVnmAhNeTcykpFEcTsl :(nonnull NSData *)UtJBxgoRHw {
	NSData *MzuKaNVFMQexGPNwbdpMseLh = [@"DlXGushXaglaHdhTDqtnbsVCcaUWZoNeuidcKptblJPGghbYdhyGaPoOhnjULBCbpfNzTmDorHWhhFckmoFVrcrWMZqiLsIuTaRSSbPSeDidsGhyVoixSrvjNIaqONsf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *beQojRxpBcjPok = [UIImage imageWithData:MzuKaNVFMQexGPNwbdpMseLh];
	beQojRxpBcjPok = [UIImage imageNamed:@"tMtuPMVVyiYxvzZGQrFEXeEylOzyawtfQGwWOBiVjkHfrVKlVMLvbZxWXNQeLOeoqzVszkPBAiaaJENeFJBpSmtDakLSDdUeSQJREHllqfYLqYXxJpScDcpgFYIlMpAgqjFSISkZVaf"];
	return beQojRxpBcjPok;
}

+ (nonnull UIImage *)JmHivYlSskb :(nonnull NSData *)ATxUfrRFJL {
	NSData *XidMxoWsraRsRmGRe = [@"JEHEyMtOCntSoobdDcAvlBjurcFSQTxGlNrSIbGvFoMEkRixHPDsdwMJQfbsYUFILHPEljJhPHiHbTEdGDrmdSYeodnqwxUVRgcfTRLkRESwVdNCYkFRXkpaQZskuyyFIimzsrhGhQSNMc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DSEqrmmfqCDFrdyzWzYkDmDT = [UIImage imageWithData:XidMxoWsraRsRmGRe];
	DSEqrmmfqCDFrdyzWzYkDmDT = [UIImage imageNamed:@"vMXtrEPRZBgOUCkomQmMvQmyIdJPAFfDUlUROjsUkenapRNsttMwKnqZBmFUDJMncjRVKPizPTiJCHvIUNVAStxZkhkVjmzMZBke"];
	return DSEqrmmfqCDFrdyzWzYkDmDT;
}

+ (nonnull NSDictionary *)PfvHvDqKNEBgj :(nonnull NSData *)gjXqJECkhFytxnNOqTTEM {
	NSDictionary *rLeFvdImNHxxySCGBSQsLB = @{
		@"aQJNBpTyAqE": @"GgWKGJrNsTSprccHlOGzrSpqjheuErQkkrCEcBETVFnDWJkJjGnOTiWxlNuUfPpIugnACWpAbvVufIkzgJJQFNoHufDlSDptRPXpvdWDzVKyAgKYlpPTYwhyNhcqCOEK",
		@"dRdsZAGVgWLQCXA": @"EFQrxtGRIYAneDDbGxtXxeNpvQifvUNqrzmVZbvfqdyMfuyKJAUltTLCELjNhoRSjynZEWeAcbXiACicaMCIdyLlpAhMLwmFFjvzJUXIuKriHYZqUqDybyIIaIRxkVjiIniAWHvjuhfFaRC",
		@"ywImZPdigqWZaEWrwn": @"ZoInufstvBINtVxietvjpJKFTVelpruSTKBgmnRZtuWVHbKPflOBNZEAonLEvbcEPQvCxhpxHWgVTPLFkFQuMguReThezvnBDoHYgLQCnBiu",
		@"dvukZMTmHlzWblKiEUgrKJX": @"jTFeLGZDSYjhhyZakQvpGSdOfsDviJGuZbPStSasFHeZOuQYKhpzzlHvLdglgUcThcjOVSZTuhTFYgyRBsYbPDTanLiVyEDseWOk",
		@"ksRmAqbTsxabw": @"vjGQKaWAnPhRLzsvYQmQSlwXVbSkoKBRuDsTrPdaLqVgXLRSHoGqIePkKCEQHGtSheEQChacmrArnggqjaSxMEPPOGIUVScLvqTNAwEFxRWWVjTJIISdDeBaYwWoSKYA",
		@"qXBdSTFghCGqzmlW": @"oyhUihthgvKKAuqVOewxiydsoUPcJvytmxTOmJLbFHbhqxwTxYNXgaByBtPklBBNOsccSEtIWaKMKTlTqVbNcZhWBOvkQuxCbcpQSTMdOkdZfWGYvXU",
		@"TtSIbdZsRiETO": @"cQXkYuGgkVvhXqCLsKBvwUjrhMIOyLragHdbzgDBAhUKCXenQXKXBGsbwjSJuBxCSVYdknSUXrUEsUlnRqiTKLTonxGwyXKHabpTZHZYnJFBKR",
		@"OXSzDEGkAltjfKn": @"vyMNdoUkftvDLioisseyuWYQAKoRtYjyVUoBaPaUGglsYajZQaGfxwsCaAoSRuVTUsuHsALfWBnWlFTlaVLpwMCnlnCszzeEUglQgN",
		@"vwbRiNWuziBXymeN": @"fTCGUNwpmniRYXtOgNBgaQUuXXXkgFKFeTkRaiYSOJVKOaUNLaAqDYtrgjvoFHjLeXAGWDqWaiJHSJjMwrhBOGMSeIxkGkOLRhyijFOJCo",
		@"jdKHvKqRXPBWv": @"JEtFocXVgxbyGRxwozsUuLgrPvpJaBuywKQbywTjlPnrznPSweRtEssGBWiOjnXwxYkTOfTEDYIADKzwmbjvDnAuhdtHKuZrwgHeTO",
		@"YMSfAYSbTNVrQOLeGymD": @"eeJSVSnGkMyiLgChrNrzekcjwycSbfqdqGvbTRZRoKDriwCkMbHHCONIsfeSkEpsTXjjAOSKTCVQZlNePGDVAMxTzEKagbcCSruzFpxLYPgrYtyBjsYqJOCZugeqnYPVuFpTedfG",
		@"QrvfRqceZeCgvGorzGndsh": @"vyrkkrKUlyuGKZnZNCxfKNzzoOSGRhvcnxjzGDxTmMEsxQctjUdPrtsgpjjycxwwCykSalxjiLPnxnvlmBLJsAfjGduCshCKoefdUHOhfb",
		@"atqPhOWrHyGHzHHwHAtpVZ": @"BxbLYWERWAAeUNhlWoaPPvSgVukUgjETqZzCXuRhPGVspZWVYRJbIsmXGnglKamfCvRSGMwQxgNssFhLUDOPlSyXsQFjnuHNITgrhcnFhTejrWRFTZTZAxUDGAzspuLWyaYMIveND",
	};
	return rLeFvdImNHxxySCGBSQsLB;
}

+ (nonnull NSDictionary *)SlnpMPJWYTOM :(nonnull NSDictionary *)XhHumzUFjJyR :(nonnull NSString *)sTmenXUhoUUtgVsi {
	NSDictionary *CFuXgbePghZg = @{
		@"nimolOovhNwhykUfi": @"eMKBLGfFsUioYfuQRaUcPlyNmMlQzivOajlWnpdLhVoEBccjsXbaQIHuVbJxZeaterURpWFmerEjsHFPzoMkWaDlGWclnFfTZVOaaKFjwzfJfeoNXernUXbaCnTB",
		@"pzrwLuZDyzLLVHl": @"YbeKmovfTHnIeCckRGycboiMDtNylaJExMtmoAtTKHfzcctPdwIVtKmmXvyRWioWpjgqLJUQuYkRHWezsJKlABjyypNIZrpGCyrqG",
		@"ahtoTtZayOlznRnl": @"QIdlqGrCYoTkNakSLMylPXVnIHhugppxCqytkBYKRendovvzQPRbRBbqumttpMcJCoIgqDvpKHnZvXzyjtAXlkFzkmCUhkDBuKaajaAtytvYXnRhqAWBsvv",
		@"tzocWAnlNUqxjQ": @"wCOaWCPgrUlwxJJNOjhypKtkBpeSQjZzFNUdElQXpewJiDWzydumYiDkvGMsxDvYSWpbWHKpEviyzBddQACUBIAZsHXuvVqFYvvdBdUIAStGzqbOVIrcSpJVFRo",
		@"JEUWcImDUGsceVEuyvuIW": @"fegjxZMGHYwTohxtLaAncaYoLuxYQSyWJxyfeCXXubInibRuRhSzGSWgLqpusFIHibkbQpQEajfbNzxqLqdOcuSsLbTtDuyvGivveKSXwzwgAgDbFNnPkf",
		@"FmvVkaWHqUn": @"slItmoSswTYmPONvPNrsbnmIjDkeJwZMCgIgOUthZFpJuQZRqGSJTxOglGxpQEwpKONNbNIfgEkmQNsMUftCiFvFjlqvvmpkeTFA",
		@"MmbeJdWlMTBXwOHPFPD": @"ZQVKkiumwykbYluuWQhnObwCvPymDuewVmUZnUvHZtMhDMBtNloPnsdXcwMDSJHPbPgQtStbbGrubCBMaqVZfSCHfHNMlBYslyGNdCpxgdzGDJtIYmJfeNybkqfId",
		@"fccAAQoppxiJ": @"VonKFmhRoIyjBfVpxLEyWngEPmLuCtSCJDDLsiPltJwKHfCtbClzVMvjQLuTeKTHoUAmqPbsppDSiZnTEyBSuPPIlLcronPJwhMQTGaygljUDQqvItLvjmer",
		@"ePjScqLOUvvxUaU": @"fnUHANiPFypNDGfMsQlyDdqPZIGsYMrzAmJYOvvlQPUsLNfMODLFELEvUhVopuAxKtjDsRLtJZDUAYYuuMScZTKUGqWmXSwhzKXBIREmmVfEBDzdkJlabcN",
		@"XIXvPygNbjFYTYCnQMdFJSqh": @"MwoZwGIaTXvvSHvTsyKxAVKnfbStoGblilYqoZTeaeXlPYqZPHHmIaPWatoGACqlTeKVNorElIvOaXXINRSQqhFcqBqWFnurMoxEQKmLUQrFpKuEaMuqoxwFelMq",
		@"xgOckEFhygnYHmTDwp": @"iigPMQzzmGIQnOTephJNbsAepeaICCydKvsQXjTMfsmaQcpSqbEJJUZvbosfmycCBwRmyVEopGfMkEGCuypAfBhSFKKNjaGtKaAqXiwejb",
		@"ESTpEzXquqkNTFGksx": @"wyPzwwnEhupfcujmWDRVuBJUgfaWXaJjtmVGcIFKNlRFQPWdAPjiLUltWDGTpXfRAepSJHwDCvJypFVGnKdVJdKlKKHBcFZFTCpSzTXGCVrGoGeSFVfpsBxtWdxKzIDrnQjzlNTEKJomCdy",
		@"FThNdCTkLsCWGY": @"gRHpAqeGPHUzrUIsoDbkKLyjPbxusPQtWIAApLKqTysaMKINlecmWsQsKXcTmnPapbCwxTBhEwpYfSaOJhgzxZXzOjMDXYqducTPklAZYMzjOOyXqivjqfMkJwKRSmEOGgTAIfKeqxm",
		@"ibjcygqCSLODFxVmFzCJ": @"WpEXKFmkjYGSsISDHIucrXpQqLpzcNTVWzlQKrOdyMRumRaWUMfyFuCwlOeGsRmcRbVPhJqFDaVzzoiwDVhKiDtRMBBXNfRElePFIogdCcSIU",
	};
	return CFuXgbePghZg;
}

- (nonnull UIImage *)BSEyaKNTyxnfpudIXzTa :(nonnull NSData *)ZWcpVCWuDwHbLZPLqw :(nonnull NSData *)OgcdsyIOymriDCPbaGSDfEp {
	NSData *XOAnSTtLgvBoErxM = [@"ZwBRULwnFYzLzejTaHyRcHMLkIgMtcNaWqXPXeCztkCucSgJPkmGMgGcWPFZdoMqGslDPUKuNGORZrMsNpGMIdaDfBcrizYorzaqwHVIhmjbkHFjHVjTdCXqMOLLdcrcDEujjWjZsY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rvgeXMcBeKNiXGkFszJ = [UIImage imageWithData:XOAnSTtLgvBoErxM];
	rvgeXMcBeKNiXGkFszJ = [UIImage imageNamed:@"FmzqnAbUsTMFwdXkGmOLUuPEuHgFidTHxiBSaIbmaIXdLCuxVyQRWKNChxNMmpsnPkXdrglbmvpZAIYliRBrutZsUhanhElluxWfxsebXeWKZULhkQoK"];
	return rvgeXMcBeKNiXGkFszJ;
}

- (nonnull NSData *)OBzMAECacgPc :(nonnull NSDictionary *)CVNabzlCNuoeqIKrNszH :(nonnull NSArray *)TJGEYCgNAGAS {
	NSData *pJTLFIxSaOeuJRYyrWl = [@"AnmKCvRwAUQfUzvWYaGziwaHjlpdSAwiumihGxQbPMpxCbeZBRNnlgxhNAYFeNkLtojoDSTweWpKftBvPjOzemiTblwYuAUdvBlLML" dataUsingEncoding:NSUTF8StringEncoding];
	return pJTLFIxSaOeuJRYyrWl;
}

+ (nonnull NSData *)hQwPoOjJJPuvBvzs :(nonnull NSData *)apdaRBhifJoaIeBXnTO :(nonnull NSDictionary *)egGMRKqiUdcIvX :(nonnull NSDictionary *)VheQnfwxiGXlsWpJkAQOpmAy :(nonnull NSString *)whftEYkVIoSILXTE :(nonnull NSDictionary *)CCBVlcmSoPxiwjeJOR {
	NSData *hMLABfrexeCDZelrtFZHqt = [@"geHIdzDmDyrwXwpPwoLEMGCkWvPvBGsiHWNhxjaRzwqoXOHBxEWoRCBMVSJwDNJEAlbgxxKiqNRLaqUarBNEsxDQYNduHtTFSNCWgSwvgNAoEeUOJeghv" dataUsingEncoding:NSUTF8StringEncoding];
	return hMLABfrexeCDZelrtFZHqt;
}

+ (nonnull NSString *)hYlKdVpmnwbkeNAptSHKdbD :(nonnull NSArray *)IDuKOgOAwZd :(nonnull NSData *)LUKVvwqzfWNDvlXNPSZt :(nonnull NSArray *)MxhwbYOrSn :(nonnull NSString *)gIoNOeGaEpEsgQLCBUFPsFKp {
	NSString *aOzbFwiTMxg = @"tJDpMblgPexjhshKtvEaWIjxIUaeMsLJAgGHnztUZDDfBbYhwphgdVzIWofVuATbyLMzBKHTbtDbGlHXaovEBqfGhNQDVRjGhGITugaPkGIlsQqDrCEQOBlRcsywrMLbVRQnTjCJ";
	return aOzbFwiTMxg;
}

- (void)EBookLocalStorRequestErrorFunction:(NSNotification *)notification{
    NSDictionary *bookInfor=[notification userInfo];
    
    if ([[bookInfor objectForKey:@"id"] isEqualToString:[self.bookInfo objectForKey:@"id"]]){
        self.bookDownBtn.hidden = NO;
        self.bookReadBtn.hidden = YES;
        self.bookDownBtn.enabled = YES;
        
        [MBProgressHUD showError:@"网络不太给力，请稍后再试或者查看网络"];
        
    }
}

#pragma mark - touch event

/**
 下载书籍
 */
- (IBAction)downloadBookAction:(id)sender {
    [EBookLocalStore AddNewBookToDownload:self.bookInfo];
}

- (IBAction)startReadBookAction:(id)sender {
    [BooksDataHandle willReadingBookMethod:self.bookInfo];
}

#pragma mark -导航栏左右按钮的action

- (IBAction)gotoBAckAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)gotoBookShelfAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}



#pragma mark -动态显示tabbar
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
    //    int currentPostion = scrollView.contentOffset.y;
    //    if (currentPostion - _lastPosition > 15) {
    //        if (currentPostion > 0) {
    //            _lastPosition = currentPostion;
    //        }
    //        [UIView animateWithDuration:0.5 animations:^{
    //            if (iphone) {
    //                self.tabBarMainView.frame = CGRectMake(0, ScreenHeight+48, 320, 48);
    //            }else
    //            {
    //                self.tabBarMainView.frame = CGRectMake(0, ScreenHeight+50, 768, 50);
    //            }
    //        }];
    //    }
    //    else if(_lastPosition - currentPostion > 45){
    //        if (currentPostion > 0) {
    //            _lastPosition = currentPostion;
    //        }
    //
    //        [UIView animateWithDuration:0.5 animations:^{
    //            if (iphone) {
    //                self.tabBarMainView.frame = CGRectMake(0, ScreenHeight-48, 320, 48);
    //            }else
    //            {
    //                self.tabBarMainView.frame = CGRectMake(0, ScreenHeight-50, 768, 50);
    //            }
    //        }];
    //
    //    }
    
//}

- (IBAction)getMoreTitleAction:(id)sender {
    
//    //已经展开
//    if (self.bookInfoRecCentLab.frame.size.height>130) {
//        [UIView animateWithDuration:0.5 animations:^{
//            self.bookInfoRecCentLab.size = CGSizeMake(bookInfoCentLabW, 130);
//            [self.bookInfoMoreBtn setImage:[UIImage imageNamed:@"bookInfo_xiala_img.png"] forState:UIControlStateNormal];
//            [self makeBookInfoMainViewAction];
//        } completion:^(BOOL finished) {
//        }];
//    }else{
//        [UIView animateWithDuration:0.5 animations:^{
//            self.bookInfoRecCentLab.size = CGSizeMake(bookInfoCentLabW, self->size1.height);
//            [self.bookInfoMoreBtn setImage:[UIImage imageNamed:@"bookInfo_shouqi_img.png"] forState:UIControlStateNormal];
//            [self makeBookInfoMainViewAction];
//        } completion:^(BOOL finished) {
//        }];
//    }
}

#pragma mark -主视图的位置设置
//-(void)makeBookInfoMainViewAction{
//    if (iphone) {
//        self.navMainView.frame = CGRectMake(0, 20, ScreenWidth, 44);
//        self.navMainImage.frame = CGRectMake(0, 0, ScreenWidth, 64);
//        self.navMainTopTitle.frame = CGRectMake(0, 11, ScreenWidth, 21);
//        self.bookInfoMainScr.frame = CGRectMake(0, 64, ScreenWidth, ScreenHeight-64);
//        self.bookInfoMoreBtn.frame = CGRectMake(ScreenWidth-50, 60, 30, 30);
//
//        self.bookInfoTopView.frame = CGRectMake(0, 1, ScreenWidth, 160);
//
//        self.bookInfoTopLine.frame = CGRectMake(8, 23, ScreenWidth-16, 1);
//        self.bookInfoRecommendView.frame = CGRectMake(0, 165, ScreenWidth, 160);
//
//        self.bookInfoRecCentLab.frame = CGRectMake(25, self.bookInfoRecCentLab.frame.origin.y,bookInfoCentLabW, self.bookInfoRecCentLab.frame.size.height);
//
//        self.bookInfoMoreBtn.frame = CGRectMake(self.bookInfoMoreBtn.frame.origin.x, self.bookInfoRecCentLab.frame.origin.y+self.bookInfoRecCentLab.frame.size.height+10, self.bookInfoMoreBtn.frame.size.width, self.bookInfoMoreBtn.frame.size.height);
//
//        self.bookInfoMainScr.size = CGSizeMake(ScreenWidth, ScreenHeight - self.navMainImage.frame.size.height);
//
//        self.bookInfoMainScr.contentSize = CGSizeMake(ScreenWidth, self.bookInfoRecommendView.frame.origin.y+self.bookInfoRecommendView.frame.size.height);
//
//    }
//}

#pragma mark UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CYBookListColleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"COLLECID" forIndexPath:indexPath];
    CYBookInfoModel *bookInfo = self.bookList[indexPath.row];
    [cell.bookImg sd_setImageWithURL:[NSURL URLWithString:bookInfo.iphone_img_url] placeholderImage:[UIImage imageNamed:@"bookShelf_books_img.png"]];
    cell.bookTitle.text = bookInfo.book_name;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(75, 130);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.bookList.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CYBookInfoModel *bookInfo = self.bookList[indexPath.row];
    CYBookInfoController *bookInfoVC = [[CYBookInfoController alloc]initWithNibName:@"CYBookInfoController" bundle:nil];
    bookInfoVC.bookInfoModel = bookInfo;
    [bookInfoVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:bookInfoVC animated:YES];
}

#pragma mark - requestServer

/**
 搜索此作者其他书籍
 */
- (void)requestServerSearchBookAction{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"start"] = @0;
    param[@"rows"] = @7;
    param[@"bookName"] = self.bookInfoModel.author;
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [CYHttpTool get:[NSString stringWithFormat:@"%@searchBook",CYBASEURL] params:param success:^(id json) {
        [hub hide:YES afterDelay:0.3];
        self.bookList = [NSMutableArray arrayWithArray:[CYBookInfoModel objectArrayWithKeyValuesArray:json[@"response"][@"docs"]]];
        if (self.bookList.count > 0) {
            NSArray *bookArr = [NSArray arrayWithArray:self.bookList];
            for (CYBookInfoModel *bookInfo in bookArr) {
                if ([bookInfo.book_name isEqualToString:self.bookInfoModel.book_name]) {
                    [self.bookList removeObject:bookInfo];
                    break;
                }
            }
            if (self.bookList.count > 0) {
                [self.moreBookColleView reloadData];
            }else{
                self.moreBookColleView.hidden = YES;
            }
        }else{
            self.moreBookColleView.hidden = YES;
        }
        
    } failure:^(NSError *error) {
        [hub hide:YES afterDelay:0.3];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
