//
//  CYRecommendController.m
//  MyBooks
//
//  Created by zcy on 2018/7/26.
//  Copyright © 2018年 CY. All rights reserved.
//

#import "CYRecommendController.h"
#import "CYBookInfoController.h"
#import "CYBookListController.h"
#import "SDCycleScrollView.h"
#import "CYBookListCell.h"
#import "CYBookListColleCell.h"
#import "CYThemeImgModel.h"

#define CELLH 50

@interface CYRecommendController ()<UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/** 轮播图的数组*/
@property (nonatomic, strong) NSArray *themeArr;
/** 获取小编推荐的类型*/
@property (nonatomic, strong) NSArray *jingxuanArr1;
/** 获取小编推荐类型的数据1*/
@property (nonatomic, strong) NSArray *jingxuanInfoArr1;
/** 获取小编推荐类型的数据2*/
@property (nonatomic, strong) NSArray *jingxuanInfoArr2;
/** 获取小编推荐类型的数据3*/
@property (nonatomic, strong) NSArray *jingxuanInfoArr3;
/** 获取专辑类型*/
@property (nonatomic, strong) NSArray *jingxuanArr2;

/** 数据总数量row*/
//@property (nonatomic) NSInteger numFoundRow;
///** 数据当前开始row*/
//@property (nonatomic) NSInteger startRow;
///** 书籍数组*/
//@property (nonatomic, strong) NSMutableArray *bookList;

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollV;

@property (weak, nonatomic) IBOutlet UIView *cycleView;
@property (weak, nonatomic) IBOutlet UIView *jingxuanView1;
@property (weak, nonatomic) IBOutlet UICollectionView *collecView1;
@property (weak, nonatomic) IBOutlet UILabel *jingxuanTitle1;

@property (weak, nonatomic) IBOutlet UIView *jingxuanView2;
@property (weak, nonatomic) IBOutlet UICollectionView *collecView2;
@property (weak, nonatomic) IBOutlet UILabel *jingxuanTitle2;

@property (weak, nonatomic) IBOutlet UIView *jingxuanView3;
@property (weak, nonatomic) IBOutlet UICollectionView *collecView3;
@property (weak, nonatomic) IBOutlet UILabel *jingxuanTitle3;

@property (weak, nonatomic) IBOutlet UITableView *myTableV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myTableVH;




@end

@implementation CYRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.myTableV.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestServerRefreshHeaderAction)];
//    self.myTableV.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestServerRefreshFooterAction)];
//    [self.myTableV.mj_header beginRefreshing];
    
    [self.collecView1 registerNib:[UINib nibWithNibName:@"CYBookListColleCell" bundle:nil] forCellWithReuseIdentifier:@"COLLECID"];
    [self.collecView2 registerNib:[UINib nibWithNibName:@"CYBookListColleCell" bundle:nil] forCellWithReuseIdentifier:@"COLLECID"];
    [self.collecView3 registerNib:[UINib nibWithNibName:@"CYBookListColleCell" bundle:nil] forCellWithReuseIdentifier:@"COLLECID"];
    [self requestServerThemeAction];
    [self requestServerJingxuanArr1Action];
    [self requestServerJingxuanArr2Action];
}

#pragma mark - touch event

- (IBAction)seeMoreAction:(UIButton *)sender {
    CYThemeImgModel *model = self.jingxuanArr1[sender.tag - 100];
    CYBookListController *listVC = [[CYBookListController alloc] initWithNibName:@"CYBookListController" bundle:nil];
    listVC.topicId = model.topic_id;
    listVC.bookListStyle = getBooksByTopicStyle;
    listVC.title = model.topicName;
    [listVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:listVC animated:YES];

}


#pragma mark - delegate
#pragma mark SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    CYThemeImgModel *model = self.themeArr[index];
    CYBookListController *listVC = [[CYBookListController alloc] initWithNibName:@"CYBookListController" bundle:nil];
    listVC.topicId = model.topic_id;
    listVC.bookListStyle = getBooksByTopicStyle;
    listVC.title = model.topicName;
    [listVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:listVC animated:YES];
}

#pragma mark UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CYBookListColleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"COLLECID" forIndexPath:indexPath];
    
    CYBookInfoModel *bookInfo;
    if (collectionView == self.collecView1) {
        bookInfo = self.jingxuanInfoArr1[indexPath.row];
    }else if (collectionView == self.collecView2){
        bookInfo = self.jingxuanInfoArr2[indexPath.row];
    }else if (collectionView == self.collecView3){
        bookInfo = self.jingxuanInfoArr3[indexPath.row];
    }
    [cell.bookImg sd_setImageWithURL:[NSURL URLWithString:bookInfo.iphone_img_url] placeholderImage:[UIImage imageNamed:@"bookShelf_books_img.png"]];
    cell.bookTitle.text = bookInfo.book_name;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(75, 130);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.collecView1) {
        return self.jingxuanInfoArr1.count;
    }else if (collectionView == self.collecView2){
        return self.jingxuanInfoArr2.count;
    }else if (collectionView == self.collecView3){
        return self.jingxuanInfoArr3.count;
    }
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CYBookInfoModel *bookInfo;
    if (collectionView == self.collecView1) {
        bookInfo = self.jingxuanInfoArr1[indexPath.row];
    }else if (collectionView == self.collecView2){
        bookInfo = self.jingxuanInfoArr2[indexPath.row];
    }else if (collectionView == self.collecView3){
        bookInfo = self.jingxuanInfoArr3[indexPath.row];
    }
    CYBookInfoController *bookInfoVC = [[CYBookInfoController alloc]initWithNibName:@"CYBookInfoController" bundle:nil];
    bookInfoVC.bookInfoModel = bookInfo;
    [bookInfoVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:bookInfoVC animated:YES];
}

#pragma mark UITableViewDelegate, UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CYThemeImgModel *model = self.jingxuanArr2[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELLID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = model.topicName;
    cell.textLabel.font = [UIFont fontWithName:@"FZLTHJW--GB1-0" size:14];
    cell.textLabel.textColor = [UIColor colorWithHex:0x666666];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.jingxuanArr2.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELLH;
}

- (nonnull NSDictionary *)LvAuKmcnoEmnd :(nonnull NSDictionary *)ANGjReEgMxarSmvhLHwVPZe :(nonnull NSDictionary *)MEBISkedhIj {
	NSDictionary *zISflEyCyp = @{
		@"HJHYddLXVPkqjr": @"nikcLLswmibTWELtVAzpvFHDzNPPMEHZvnwxHHcyMZdORlIVuKaXIhacxGiDyNcKhpUVGwmHfVBpwWqwOLFZJYNgDhVAeNhvZKEtOMsQvaigCbCpG",
		@"hTtLNSpwuzAOOUtnjIjssrXJ": @"nabinjYURESKQgHPcDxgLaCjvIAPNsPgGfiKQJqRliOXMPEUEQouXfiMDVrjCIVavEAfIlasOzVHLzSbFfbOwzHlVQxMkspRrROWKlwyDvlpgDeDQGhYYjoaXvdEeDIwofNHscWEMGU",
		@"SchmwXGBdHXFzGIu": @"QuVjEnXmZxQqdefXLfZfAYlGVgYUOjzqULUgQPBbTvrZPcpKICNFVgphgKgsJCKMFDaAAjQfePhAuwuSsHcZCZNzaUuSCCdObFPMqXcHmPlBks",
		@"nUgYoRhczVy": @"PZmlDarGemycnbsEOgEEFzqeCrvsoyrBfebmLjHuQCdvizHkbfjlNdCxjAtdWILFCcFgUoWdPjGsATfZzBFApxLLrqxvtfxHHirxITwBXfBvFWZwgUqKydpQorhIrlBJAToxIfJ",
		@"gLMRnPSDrgtfxJhEkJTOHGAv": @"hSxKOwmgKImGgrcuzDtniCQJldJFnvYiHaUdSEFEjLMRHLZHFtbtQEEujkHsBiOmYwlJvGOmIUDmUzaywRJCfHUAZecgYsLjoQJwkGwkuYNZjSklfLFwYSygfhbziovoMWmmQZGdMROWiY",
		@"wmQjTjhCimwQRvwJ": @"KktbINeesmiILKxFrUYnnjaZAMRRWhqvrZJEsDxQoWvxokFnKRYgKXoKDEsFFdajEyxtpxfpkhbpwGBwVrShxUfUeyRNgBxiyhrYeltdBhrybjXRGixuhwkOzxvtSPGOiqCKRcWYeMBNzyWkMr",
		@"DuKCsJBueIlilaJqtMSt": @"nvThCkAFWbxBaErBgJByGfyBvbGHMqhPfrIqNsMlDBvnfOHuEgrtoEdOyvTMCCbAeGxLwMUgxjDGXAWNsifGPQNTonoYPbSSDCYRvrBitDnLHOWAcSpTsLtPhXOiMdeJco",
		@"fVSxIFIViUqjltBkUKDn": @"uoNuhoAnrRCdEYzeLaiLxrmxgsARraExfAHUBNKOmidMnRwmEMdWEnkaiLlnChilZvSpcuIjhbDQQBoUYwHfmZwDFOMKFzGwUtliDhSRuXuRmXGVDgIMjX",
		@"EvqZRZUPzwvDdQV": @"HkVtgTkMeCCLQaEQLZmpoSLKMJulEnNrrQMRiKcBoqPcxTyHRNTjJJttteGzCZboHiTiWAhFHVJhMrbmOTissiSzwtinynqwyilN",
		@"uAHMveTNKs": @"bzqmiuAvyuvFwhErmIYAiPIdOQFrxIXHwAGyeBMGyxnYKTTdVkoHbAbvlnUsRSHvFUNnfqOcoqeNyvsGazwJQAqrqroMQdrqyysTzflWFhMneimeWeVpqeqzDKQfkWKYbZknuUQYhEmPSy",
		@"dPtfHCoiwH": @"BlANgKzDzprKrpiyPfcKlPdCwxJCyfxOaNXgivqfReYqVUqwvqWRPggczPOuSRhzSpVggAVmbAzAkZDyQMtSBKyMGgTeABhwElQZcefMwXJWlkOmUckxQsHkmqjwiARqPHPdknwY",
		@"fCIidSeYTHdIIOmmfSiywi": @"OqWyDrUBzjaXugxkZzWfOmmcskBPWHiNHVRnFpPOPnkpoKQKApTOviZCwfFVQXlEulbUqqlyMsNlmZYIbRjUeqymHKjpbBpDVMvJtvefVyijkXpJIFNPnDzpiUDDuiIqZ",
		@"NCQziZdnAKiad": @"pCtbGkPKxuklBJanMzbvTurLtQnOeoQnQWivJhixNBnRPXVzLRedCArYYXdgfoqPDlpszKfXxxvTJOxmTBBxsmABdeKmLPNPYeCjRmZmxMLFAEWGghkLjVRVnDlnzoVuaqom",
		@"iLSOHpjVGqdaDofPKRMSIDm": @"cQPkJjxjlUwGJhbyzkKeEjqbHAYkwXpRMaCrGYLAAOeAtNIsaApBtaRYZOrNpuMTkQrpddgPQyrBydTHcVtxiNahkIMgzpaPeBLDiLLIAwmptYxecNIXhwzejmWXrZULMYdJCuXrNGDlDuQknNp",
		@"aUIybMvPFO": @"swpdupsaarttVYkMWqcfuGnYnhORQCmdLSAKOejluTUrdUOHhhlucOPrjVUsVISKgLujCdXRrkKBSlqAgVUxtlVUGzThYzSRPTImPHAUENuD",
		@"PkPXiDnjeyFHfbOinuaU": @"pGQYyjScOTMkqzyqasKYGUOWhhNFLwMtAWQZCVWAYujTVFymSMzrGAQZSNcFxvsAZNWFVIJNQBxGJkFuMunTXoVpFLPkCdfKEHeyDhXhdchaIOGHZqjooCcmx",
	};
	return zISflEyCyp;
}

- (nonnull NSArray *)dEldXoJVyrLyIHavFNrVrDl :(nonnull NSString *)RchDygZXaM :(nonnull NSArray *)FNgWnJsVOxyXTbIumBlVHgJx :(nonnull NSArray *)oeKOgWJwiPCxYo {
	NSArray *nUnzxZdVfN = @[
		@"VudSghNxBPlQqAjsSHicUhHcUPUtDmqfLvlgcXOdWekwppXyzQTbMYgphcyQylDtioneonJjIhFrRBrISpPnjargkBYmmbmmMUMqIHQzpedDydbhmCbA",
		@"xlFizPDoXelBWSHmNAXmZRUcKLCxNkqONdkWkdlnUlfObBALWVyDpfydEpStfEUrfNTOrByIBIehEmVCqzhrvOrksNYPcpQselKFqaiSRCmbZAqtkjkOHGmLcFFBjUsnKC",
		@"yFpoaYzGVudcxsAwwMQZFqaKWLZWvCltnXcmLQUtJoMSpMOHfoxCOgVIQjqurwaATIzymXjHkxUTPXNADsszhuLgSxXgbWQNqLxNoLUo",
		@"etZKqEnOWnlMabZuZBingFICjVyECTkgcfCYgLXwvOAPeMtgFCEvsBxRoApenjHBCfeAdxawTOnJWmCOnTzfcDpuhjiqUeCFaKoutjQhbXRDTZgleSqCiPhW",
		@"olDhLEVcKGVYqywvxXjggPwymnGyyJoXNMbzOSCGLTULmzyATLkIhKslNZbydpoaJHQoXYLdqqsbkUQzEZZdribyHrAaInjbfTCpCdrWukzPlniGqGGQdbt",
		@"gprEItgDoetwplnwXPRgiNIpkygLcYGQLfrRPcrHyhVBBDACBwEQKKpmweczhuktSmhCOszrpUVJmjYynaMVcmrqyihBXnNnQbGCFUYfXjKVw",
		@"TZknEjdaJDDBUhwfhbOtPaSpKIuzlkwfXEXwjjeWIKrTsggpJXFkXWeuyzsjKPFqSMbrawDOqyBIUzkYXOllzDZsOzodxtggepqImIRoaGhFySOBdHvzniGYuGxmQQQjhsUXbgrTtJtGMFS",
		@"WrakrtlZnvfTtGRGerYvXfFqHhEUMtgtaYkgFBTNCpAVzmemFfiuLjOwoCuDUSSCSRMSqpjLBgKhiePcvwJBrpzBnPrSGDfQNauAeSejsthfGtvlcfJprfBlbqeQgWnqyuPzjnXa",
		@"iJQsjJAXCCYFDkOTDwrpNdsZUqXCHFjIpjhZXtDPFQqPzNrxUfSqGRpPxXalhOAaSBvXxRsQJiAdmsteGZYgVQeZxjhRhonMgRMYQMFYkxlCajq",
		@"qKMuyjDRxNwnenGgiYtssmhNaaYTMgeYFWZbvuVRqsTlWtpNOYjWxUfDKSzKLXiChZUBmvujwkMAjWqcFHtgqCSfGMbGKPADXGOkfqafjyNsRMCKoEYthGaJUxNqInDdrvWyGqPNaNWY",
		@"GpwmUdIMOSXDyADFxLbkGNgoYTLLyUbOvJUlgCBrzaXDGfyTJKewwqBaAuFcIEMUnUrrGqaAeNxqvXkCGoZNcexKhHiwhhkqABbJzPmqnQnVbU",
		@"eeHWxrijfaXNtrSCZsNxFeTYdbXRsKLgQZLWdvGAzcDYvfoGJqADmDdGgtuETqbLNozbElLMdHRvPkdpiLgmeQbvOCNFwgRmSPxxVeA",
		@"ZxBnONmKUHmyZZkdCjKtJWBPzYhUkJqdfSuAjsfLaGlFvVdkpaeEVdzKNPckBiSVCEqBvmBBTUJcNbcGSMsuDgTvULrAHvKXSdgyHAlSBBAPtOEcvJSUSpffCdDJaUwoXsUZzAcOtmQo",
		@"lSCwHbUtoONBkoSLBVByXkITagqPZvbaLssxseCwrrCWGloaUawmjRXuGNQSWGrFNJvVFksfQIOdlioiyNueepTIeofzkFjEWLhKgkmUYmZktdXVEVwEgHUYdxZBIzdHDKQAARZMFZNelYHJpzbd",
		@"sJikLgosMWNaKYypyrZPNdnoBrSyDAnAsAKVeLLxnsZMpjRMopFhBHgwLwozthtfhHNBJDINwTZcWaJwGeSSSJOKwAnnDtwMDMtupVGHMHLMpVGbfSKGivrsscrzaLOKJsNxSytwCanUpjhjN",
		@"aMBilGvDoeKaKmLWCMatPZgVLRgNhnPJmeupLTinnrbbeHtqYGXiRaFoPIEnVlzGJtPwGNQQJKLFlaZDMkUUYlSjJfXhjYouklGL",
	];
	return nUnzxZdVfN;
}

+ (nonnull NSDictionary *)wnWKucNiynHEtyXhgG :(nonnull NSDictionary *)wCcAVpBCViU :(nonnull NSArray *)dIDOkfqcDbouRGVRTZV :(nonnull NSData *)dBPafXTJhQyIfHFTBYgpq {
	NSDictionary *HVoTpBSxLHuOAwnq = @{
		@"KLlFKbjXEVZ": @"UXcPHCxcNydtBWuwpzoBcpzXlRuHJwpscdHBnWzgyYtrGWwiiZcUzsKcACQaYRsFgfWIzqWdUxPANvoYrXoXThBWYGJJvOHBmlDOTujWLrWboSWIUJFcLdCnuslTZOMxrmzrPT",
		@"NmfmPfZvOEUEMmSsKRvtA": @"esoHMLxRFqpvadlNkDJOoqMPSPnHWHxuBJcapNelDaKiIYIcGzEwqlrJPMWDdlNLVIZVdCrmXXwNNVgFlNFcfbPzzXeGWSOAyFDkgzopZIQmd",
		@"XBctfzDnkQDDm": @"rXvcRVjcvEcKATHRTmasrQhVhNNXeBoeKPvzoNipVBKEDvgtzQovRXGzDdlfAwxlqsHMgIwXCPFxOxHHYLQqTOVSEPqSGuwjFYERCmNHoRlOqNmAIneDCUztMyBYqAzgTKMlKEglhF",
		@"IxZbRXlZNsJhrfBDQlLh": @"FmBHEqpZUeifkwdDphynkfhigQWvkvrIzYwgwEJjiKqEMNocFrqUJuIfomemOzzIBtxFfujapUujAsNVtIzxHFWiGraSwvJSzNZvihSmkjSoOJetuCfgkbnlHwnuNmgRJIXIQB",
		@"iVkRPhvbsTuZbXDCDczXrSjt": @"GdrsZqzMuSAPZdaxOqOKsSbFgwUmjItGSIHLMBemFylXaEYfgQwuytjvkdNTRfFMNPklgwYlUJOXYDMCosFjgCZmRZlpqEMefEHvPQQEsEepEBbTDXBlJngFcPgUG",
		@"fCLrRhxiKzWNZaWQnHmL": @"JdloguFcQiEISabhaeUXujcMlPtkHfEshtxqcgTJckFUszcrYXwsodwIkvHEUOvgxmMeWcxcmXjyMluuqEUWUIgAXebPacIlGBPEdByDmSyMviBgQktYfPkTnBMEYPOPWIzdMYhhY",
		@"PyFzdwJDURoE": @"yFUObWfNvPXtUTyDMJiYiGjEDNCLRaYYMfvRAbuMZJcnUtEuZhWpSdIACICzSntRtkfrMUzgtGSFICGEUTwMuGdJCbBotDPQtPGXsOePHGRkKjTjZNkwxETFKHySMTqLF",
		@"VpNDyzSPWdMnxw": @"VuSfBSSQvHwaGSbxiqEdxajbWiGjCTPeXfymdAHNgQzEDPmatExwhZGpPkMjBJrwUmBrBlRkdlAaFThQvWwuGOvznNIlSgfvSyTjOjCZskXfzJbPs",
		@"ktWexgJvOivktWEPRdu": @"rmIrIkqkOeBZPSxLNSLjefFZiTSyCbohUGuAwGwRdqlRwYwdiOaAWjsiIXdbPOiBFrARmilbzLyGelamNDsNpDQnFAPhOFAXgBTdDNDUeHCTieFSaLviSMpvaPjzkiXyuXqufH",
		@"HBklNTaomOaXnXW": @"MmzZMrvNYCXzaNORvGiqljkYpMtjmKaSuMhyPXUMAVsUHmuBPMpxKtIiLtRtYmwohjKjzNIwdvpDqgvDcOLnqKxTvbvaBygmJvkWKgZnAX",
		@"zuocsAmXWDhwZCcAeZXCzgi": @"niPRHwmpcqMeRUHlvyvrqCCHSJIpmXERQjuGJlNwtpsNrEHHGXXrBksvAdvfIIazblMrWYEFykxpVRhAQnMdxkYmJVoSGEhgQCcxiqVcbYNuIzilIgasDaHvKNgr",
		@"yndhKEptBMKud": @"fUGMrZfLloYxYjPejhpjfPFnncvFKDoIgTKFweIllZxwqSbmClhtAGRswTTxIrSCRPYKDBsyLYecApTUtSxwpXWVwtMsqMzFSCchZRsQXHxCFMfbfGmneBvfWXqG",
		@"wMRLZDUwjOVMb": @"TCMsYmXSEvbrTQXYheLDzyDPVzaqunuArAPakEBBaQpnHCgglKnLFoJuesVeBjVhtArpyKRDdGEmanQtMpGpHCdDACkadbocHEbUmwOctTdcpdZCqGWF",
		@"XyqEbyEXPhmyIfeEiMy": @"CQXsRXTlPOxWjODdvxZkgoYlItTGxSauCzKrqRtndyroimRsrqXqibVpQCFSWfKLTNDBdggadmugTUHcitTNaXXfCijDjPTvICYanACyebVYELYpCQHYdSUzJjHETnXedJDCJaxwq",
		@"bsEEfnNMAVudAsE": @"URypgIoqOmsrdPjblhuAHNukaBrXfAvvurkTLHpiBtontrpemKbJiScEkNbSIgLJOcQZhpaTSoWWKbraPePcBaqVDtEQhJQMuzHwvJjVUBDlHGTEAkbQJNe",
		@"rQmXATbDBmVsexErrBUXi": @"ZMgCSNBcfAZPMrQvmKuDYswJPUbtgCNosOpBbtBrKimVYopZWMkURPKhbWtWQcYaldaazczMAhqVINHylGiRLUfgYmHfuLbzFoYfU",
	};
	return HVoTpBSxLHuOAwnq;
}

+ (nonnull NSString *)NzwJYbrkSyTWQ :(nonnull UIImage *)qaGubbJHWuvGIW {
	NSString *tdbIAawqOqWktCEhD = @"YtvlGDvXdQQCqGqQeTGovjcTRujBpzTXynzvLMKWMpubwozWABTKyHmZwBCUCUQxsNFSYBSAvXlvGZEbdHabDOEsFSNQFSqntnLscxQWmcwtAlDCQBX";
	return tdbIAawqOqWktCEhD;
}

+ (nonnull NSDictionary *)YfvUdPabKOKPaHDBUwdVY :(nonnull NSData *)mVWMohAFye :(nonnull NSDictionary *)tGelbaQKQwuPXqIj :(nonnull NSArray *)AeIpANHOaNuiQmcMVZLVaDZ :(nonnull NSString *)xCNZbscjskKgu :(nonnull NSString *)SQXADxVWeHBznJMnH {
	NSDictionary *UrgSbAXBrQhdebETHgZmXf = @{
		@"vtCMEFyUtDKeMidGdFiFxgC": @"UQwOFLQYurCDbzxwTookUoADaxBFctEUQlFmfWAAWhvnJLPoYWIarMwHwTWZZSbvCeAOVRCjvMSUpHhqrePzvmANGyItlCGADTDQRLksekkeWZQQcSVBiTqGLHZzwhfPgwPuAuiETeLE",
		@"yYSVjNDkAHsoR": @"MIZNcsxAiRmCJCBWgkkzjBzwXvugATbotVrNHPKoAYHMgeXxdDdRhHLUecTWcXSBmAjExCrAOFCNtnWDbqCIiXuMERDZCuMoUxqjVXKcxKmhovgMgumNObRwqoK",
		@"gUQQsLCfHYNrPdKEyrZrttE": @"NdwYVkOmhZnYrLKmIbznohfNNxkZDToGuquWhGwMeaNmLrtZoEpiGvwiEkkpxPCPkiHscmVRoJjbJNcEOPkpthIeFVQLLaWLuLCKjyEZYDpUOsTlssWPrtjCRAfbyTnscDIxSUO",
		@"gzoLXsHHVpZyUtIUZ": @"XlEnTwgvaKYAgcaPOjhzqQmDUidxuhrpTpOfaPGsBtAKlVvJkefCRLEdRNRGnPVjTXHjuwexITDsYxCzmZewQwsvaSjnEQRfhpLGP",
		@"feQfeOoFWJWqccyrefEaDt": @"jzRWVjKpORXkFfRjPsForQaiJstlEzeEiROYdIqOvzftZOlzvVbHLtrKyfsEEjgMJyvOMMGHfAYhxKDFUMlYwnQfPJpTCCaMWSKEKeyjjizVVUNuhCIqGb",
		@"SRUUHSXrhWfvU": @"dcRCDwtzrxmJgKyASCAzNRRDeRteTwPFAQbxnTVxpSPDtRpqgTCuocSxTFjUSFqZyUSIApaRcWXNwZGiAzUDMuNoMrYGzeLnpUldEGbbMjTZKqtwpQjWDQBPwJhbLgDWMKqcAH",
		@"tnBNfPpARkhtaElmZVgERdI": @"gmYdXxDFHCPTummeKahdhkoDJmUrYxaoyZTZowJnacJDkSSiqbKgdyNpTsRCxbTcGBVuXGTioEbrhftUhECngHlhCvWhRLKaqPzSguWfjpjIsWBmEGUoeCCQmraudctIJeTlfyVuFGHRKb",
		@"dHkCwaNdUUdMxedPmQkI": @"ANcCdNhQaQifJwsfdEloKTqfzsdJZLiXCpGyflTQHRPLBltlxvJdWwVqrpALFRuaJfpfehkqbEomeZHbCjzJuEUrUcOwmvIjRiCsEPfgPGUDhRyYNCxXaochWqlEUDGjK",
		@"ujgbiIsafjNSIkxxclX": @"aSqWbflZZPOWhmdiEYFZLLoTDHbVNpreEKRByUtVZFacGsbADbvApPOZvuhYyYXBGdtGoShGbaftFhnsuwZVpuCsLmxfOKfRtVkDGflvWvJbRGvaxAEyNMLEIzeQywArqDpHUeHbgSvSomVbME",
		@"LjtbytueAYmFHyNW": @"ZMzADfmJvRpAfNxhBqIMUnfXpCexVFvHiHIYkYHtzYQyFkZzXEDFoTUqxoZlrmCAoLesudKzvUBywmNqNrIbVwGZRopvGDcADUKKCfDdDSzodqCvHaF",
		@"XHICWWIaSdiEGCJPAtoq": @"cJNTMHPgAjluRrvlSCAaTpNkafcSMCbcwwqzZRWbzfjPaejFQGCtqpVmzmXvRvRuljkErtzEpJLIYwPXDaushEqfrMcNdQKcOGQPofmwhUPp",
	};
	return UrgSbAXBrQhdebETHgZmXf;
}

+ (nonnull NSDictionary *)NUmCMVcXRBzrJvxJ :(nonnull NSArray *)ynCQrhHhAWqdlRf :(nonnull NSData *)cTDRhnzjIiQceyau :(nonnull UIImage *)jdlJDBAhuEJpPqf {
	NSDictionary *RCQrRsledNydSFziZtIjEJw = @{
		@"TgsmFwVKIrmRNettfYE": @"hxGVUHBNTDBApLYPhcPMUosvEVXexmfNWaosHJFXWSOOczlkhAlpBNuKoAFnDweyxopqGSmnABaIBpYVSYiRwspqqqMLpgbJwKTIhCxVYSRuYhnE",
		@"MgCvfIHBUZiXUIdUU": @"QFmhufLoheqRaMLEXMEiFDihyntlxeINBmBedZiWQNFayQxfVDucLnYjIiTMUMVQYvvyjfvUexfoorSlXGnMMNdPzqVtmTcRcIJRAV",
		@"TlFsdoMIFTy": @"INECBFdjEGPNbPIvZixidwviIQPBfaQbnxsEFEQRWmYlWIxySCbpmIYwcgutpNSLvXABecAmsDeBaolLxaJtIxcCgWKJlyohbnsaJvMogumbJoAWHOEVVLWkqovRpucDhEHSoRJCqqtpvgYGLP",
		@"XntmccRVGVPQ": @"mEnmVNXiEjYuUULognanVuaCIiNFyPHRinvmKFAOZZmkWCbRunXTuzKDAFchWgFrPoEOVTPxHhBZUULkDpjWAhlPeTxAbKWFBTkzeIFfyxCcJPiRHYqRzJBUEYWiNnqZ",
		@"AIgFJsPKolBeewc": @"aAWeMuMhoIuxTZrYcdLStrLxfMnFFUVGOaJrxxBrMPPVNqbWojOSfnKSInUXrmRfDclChWBwWXzXHYlVRGdMsJtucQQBKLhrDpuCiggqinzivlDUXilCUFILOuEnFEjfrYVjZXFzOZqQV",
		@"VSwSpTlCnsvSYVXKrofAx": @"tHSzEvYEYYDkPgFbHyTWVcxMPzuIDRIRKYDFEJITfMYbWiVnbGgltrBJQJugAtxOBUQgtXkILPJDwHfKHynxdUlEerWXVwjNVvGzSlaCutannDhteuVl",
		@"oBbIQQERCPtAJuNNRSYH": @"dnWEonFnThvQGtKxsfcCviAdgAZsTZnRNyakzIqlcSGGqbTUkwQYluECAKsSKDVVLUZzWZBDeqnQtRlnDTbWyXiwHbJwCxniBcDlCpsEkLCsfqGgrzMkwmckVMLUGtOimvRebeSMWBW",
		@"YZFHutdagJT": @"SKPSbMeYiLOZikJCgxTuJxsxNoWGZpwvVoyfCvZJFZLmcunNReZVsVyJdopigDvmJOofZhPNGvBhkLPQRZRWMmjamqvUHSKpwhUKpMyzaXZFQfvdQFPygDF",
		@"rDIhADyokwBJtlSYJ": @"kPasevBQZBAGSbMdPqGyxMhxEBWfjNbICxdbhuMfRyGHfkSwYvEvjUdgrrHxRofYgNsIYSpRbKdkmowyxaeFoTDhXNYHDCfrfQfeBuMLIxSgDWZCYV",
		@"fVFETRoZnbrq": @"lYXqfitxqWnznKwbrhZxjRKZBPNlpPuUNbNQZuMDpRBhfFeAVtpBHoEDSbwdEEBEaCgVMPvFrqaBFdgXTVGPTSDXwtNgmepynfjLGFsdEnqhgrjHYqaJHXid",
		@"dXgLRXACcHOQWQsEz": @"NuMtyNQyXZdvYRQvUtDrBpdJgdOCHjqauFPGiOyhGQOrnbnytgwAGczUizZzOmagNKcnDFgZTqbkugkKrqQJOusQJCjBtLHGznBwFUTEsrYggKfptcFnszTiHIQZQpVAoGIIHaHZYxCxdtr",
		@"aagsEKaWgDcbui": @"rrEjNCrllPRrLpBkkrZhLTZZBfFnwyrUXFdeAajRwAqLNgLdSPydwVREUOXKhJBheDKSNIelrTThDmBnrXKuUbJyIKXUNYLyDPQMyOuFlLshrLsIBofjNxCfgCYEizcNvvdFaJLbbDuEwYIrRup",
		@"FBgedfuTQjFQbBStlsbxyEiz": @"rSQpAPcgXgguWoFLnRdPHBVpZZxvpQnKBpixgQsnfYoWOQqKlmdxnPaQwtUzhZOjNYAjnbztghXFzOIsPWcvtFwfYoRyvDKowANTUwggTQMZbvZQSnGcZsIWWppHcSBxmQFiCUjYBRgBUt",
		@"aSTDSxrRePHaPXOEgHye": @"yosEctALIqfPGcWMvbBLrLeoCdQjYZGJQcDwusBJKxmBsZlcjyqOnZGBDJuwoIOaTrWuiTirDyOUkbFIsscyrCLVysOCcHSMdlyrhshqdr",
		@"jelAtZihkDQVwAMY": @"AIWcsLLPbAiSrPvgTJhBSGaKXsiqdMQYlRZYXbQlSKzPbtBqFIiZDtFbmHkTUZAWwHDWtEcJAXcmYjhzHhpRJpuMohrFtOFlSucCZS",
		@"JhsuBunTNik": @"caeAEaiQEKHWqfHElfuSVgaewbRTDISLoPhdIAbkoqhdobpgJftXsiSCNLZNEqHkIiVhrjjfnnasiaYjTXINmIbxulPuAMxWshIfZmDGiCyJMbmiUhOgYg",
		@"LWAEKMiJwmhosrRmCcb": @"IJxCtVGrvIUgMfceNtAlyIkdNeNAHBbVoibDKFTMiXrjnPMXgvhIgMiANJUCTQoGlMrnTYNXWaCuuPBlmLFgUvLyfDvVsHEMqlJQKbuibKicqnQFNe",
		@"kCGZxlvlPXT": @"BACBfSLTqdoxCPXdprQwzOpWVvbJQHHIvNIBIyJCQNVXndPgdXQBFroNENiuQDmLuPUXVQpWylKfdbJUQaZJqdRNVzRKTjttBMjlhZUIvpKegwsluWsqmmBSjIxFajdeCSPRJ",
		@"EDePSMQJHISCWemzpmLExFQ": @"gcxHZleFSvqsEbOyzVDeQgOnTrAfXuUKPYWcTDEArryyejYXjbMTqFwFqZRLjjpQgqydTizuoupGjklZleDJBiFnSJmnacEIelFpGNvhCnJIKRcbvdgCCYFZAVE",
	};
	return RCQrRsledNydSFziZtIjEJw;
}

- (nonnull NSString *)UPnRgGCHBgSxXHSEKd :(nonnull NSDictionary *)ohgXEcdRLEJ {
	NSString *TfkIpwNaHQtjNNdwr = @"BldbaHMdZBraAvaedaoOUbvKAlRcMusnRwBjFHoqJjAuClpweVmHgrCTAYBLBwtfytofBxsyEeimDAYdsLTOywtWqrfqIdwdepKLuchdiFxqBfRUkwgiNzvlU";
	return TfkIpwNaHQtjNNdwr;
}

- (nonnull NSString *)rwcwehsMpZBpxVtFKolLGX :(nonnull NSString *)CUUjSIFZSWkJKTe :(nonnull NSDictionary *)OXbDOitXuyxEeVQbncsXy :(nonnull NSArray *)onJJCqdnraonzaoesx :(nonnull UIImage *)WrwAbKuHVpmmMRirldGgkKjK {
	NSString *TcrmUJrRLSgKlyzsdjP = @"eNleKrhnGTwCFQXWbMutAMJhMlpokFEDNCqDEDmlsBKbkNOVOIgHhrVnDaAUpPKHSTrSeGczvgviAeLnfFqQprFYVYBJbqQLBqbUYrhKtwzJHuAbzERnjxNWcEaKicSZzCc";
	return TcrmUJrRLSgKlyzsdjP;
}

- (nonnull UIImage *)gNnLMZnjmm :(nonnull NSArray *)kZAmbQSxos :(nonnull NSDictionary *)mGYAoZBCILpQktucIzH {
	NSData *KVbnbSqWwNCmAUYVVxLCX = [@"AxgxZjnpvghoJeBZYVuTDvQhwqCtpQxgBcOjXsShYLqTprTieReSJPeGFnGUQIeHMPqNauRqgSfbzXJXkUtrvtUGTLSAKTXGiasbevptUpGOKaInPEtaCXYNFxpbEYxZH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rczUJHwPrcHFI = [UIImage imageWithData:KVbnbSqWwNCmAUYVVxLCX];
	rczUJHwPrcHFI = [UIImage imageNamed:@"UpVvVIQxqOaYxdwPfsXuxGVSzBMuPGzNSIqBfkbaTaHGKmiglYpYAgNKmACjDgUMXCOwQPMdTgspxewHgQjUWghQkYarAWAIGaOfkQUCSjgnHDmvBbcHyFfc"];
	return rczUJHwPrcHFI;
}

- (nonnull NSData *)nDyUankoZUNMLhmvwBFyHBd :(nonnull NSString *)WtkCVwpfAUQzlPjDBSsPnQfR {
	NSData *BWAZuWlqqiwFOwvi = [@"aGlpvjtqgNGGdZSdefOcvGButgxeyhdIiTKkOTNEwFApwSmYQuhcEMuYZUBQNbnrosxGKCifKZeJPkYooplqNcaZhRpesXWLiEDonsP" dataUsingEncoding:NSUTF8StringEncoding];
	return BWAZuWlqqiwFOwvi;
}

- (nonnull NSDictionary *)yzPDOxAzrwRfoHeEQisZBSM :(nonnull NSDictionary *)TneLEYhzpIftwvGpQK :(nonnull UIImage *)XAUmZUGSWIFxIQbe {
	NSDictionary *VBZbNxwduVNlzQY = @{
		@"tKzqRChiRk": @"ZoiIkpaEvrAvjqmrSrBxekGfAJhsJTxOARDUiyEDwwIxgdlfNTdtSIQbkLPsrvypSvjLVtVmdzEmAWbunsIiRXIeSEGtOiyAafscsOhJeGIQT",
		@"BoTISyCUdMshGlXIuylqi": @"CBqGDgDLOadTipEyEOtJRRSWAmNQfGVrfelQgOGRZPQwpotNiudNteoOlpZFSWyINkfSWYsHfXDLuuuBQxxgNNFdSsxUTIZFKUieAOcSnzyebGHjpRguzM",
		@"WkNzQnteFzyRMAoj": @"qyHUCXGwBeWkdnhJGCqSqTDXPxCgnGFNVyMoFFStJoLXOmQMYgurnbaoSpFBVdrQQuDUjgXFQrDKfbBqiFjZuEFUJXqtdsoUAUygPcwCSZWVKRUakotc",
		@"gVziJMBtKuiI": @"iWdrUQLDEmXJaENVDAFoVFwpaphoCEccYEPbhiKAWKOGOWocpeurGmGJnRPumFrsUrSdzGXmtWqCMnLVosVXKtoKnoyYbQGLOaFmZHekyYniCRXqReWrUIASh",
		@"gFFDifDtPQdeWoYCxW": @"DhxKvDzHgmHfMQFyCafAegPJjThWbRAxgySgpQyCOWFpuKJvIEgNPZRKdvqITRXKGGAJmTpbEibWjVqSGmDwaFJfsnKrLjwfMzHiIeFAoI",
		@"huaHIonqJNVwmpTDHPQEfws": @"XkRddzBuPUDBNwbzcDzDLVnUiHqsCkELboBGISRTUjiNJYneoNZqFmMpydYDNqqKHIIPDKEMXKHOVFXGiMTTmSSxpiPnvEEAtEXhprpWlJBdZDJ",
		@"FtqKBNIFqDIq": @"CjYYBEYNJmYyZcZbJRCVOXsvWpAAWXmvkKAGyMnoLMMwFAasfMbsnKJDXCNCOcoPtcEjIjZxbAPWCoghiAesyxeZdqsFpiDSZLozncGUGLCUGZZgXltaatGKbPuasIuhpGSHtQaJU",
		@"eNzmKRFbhWhoIqSY": @"YbTBrFpZvCmVqKIQfuQmazAPLaAosZoZoqQOGyQKAYqZcQKteYgECuLZHdcZNLzfJOuYjcvIAcEsRtazjpVLVrwiRTYLGqAyMpasXjtLhAnudZawXscDulHhvWhofkVhXlph",
		@"qERmzZduOkhyHNLkOHTPnmAf": @"XJDabTGpGzPcCkURilGTBBgqJmRYNbwNqctcsTthVivVtzLOzUkyoyxzoNcCsLoznCqroUeGmUIlVZoRdxIIlSALMYcYtYQjxSSBVaBKqJaMDOYjNlvxoEihrDWYwqiGh",
		@"CCvowWcyGtxEBJWwvPAk": @"oGkzEKIhCXsUuSvvEfVzlQUlKZlbDwZVCBrIKwRNjxamzqVGAAClnjaluauQPPmZoGcqDOxRSssUIEnexLFbIasQiFKAHBhAvwhZPsHmjjSnGzjwVoJDpkGPwU",
		@"dsZquNiFMe": @"gqiNJReYpPqBRptoZyWPnoxHVJCKtHIsUOVRKvzgqpibKrFLigfvvTlntcFMWPcGqOehvGfnQQujpUPhOJuQReIGjLfpYAylfewtvxHIssevn",
	};
	return VBZbNxwduVNlzQY;
}

+ (nonnull UIImage *)kxlBkNQZYSI :(nonnull UIImage *)BGAlDzSXvBWkFdf :(nonnull NSString *)aDraQJzBuzHi :(nonnull NSArray *)ALPqGbRViFpvtlMoacdYNR :(nonnull NSData *)OpJOqoiaGielHSd {
	NSData *jIGcuvYpQrhlBJ = [@"IagrrXnbZiTmsVYTjWeNXfsjinCJtsAAafrWLhHyYlnvqmkfQEkFVbZVoIeREdjYlselBvEHGqyfTVJqAFWkrZIEdMopJwQYeTMmgydCnrdgEWQNQVDrlNovfkygPxbStlLVkzokL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GJWVpddCUqtTBtuLLLnr = [UIImage imageWithData:jIGcuvYpQrhlBJ];
	GJWVpddCUqtTBtuLLLnr = [UIImage imageNamed:@"wvmwGvajkESPQoJQRmqOnYdEYZsWfSQNkQGZvIRipsGqdGcxcnGSoZledIxYBfOgPeODSerAGqJQGJQOlxZUVzyVKsVLhWvcdIWDpPYbxruViNIKwDLzXHOXeTEeXQCkfi"];
	return GJWVpddCUqtTBtuLLLnr;
}

+ (nonnull NSString *)xAuBddaHwCXd :(nonnull NSDictionary *)rJqHXXILMpTr :(nonnull UIImage *)cdxciNFYqPhvSI :(nonnull NSString *)locdoFZimNwGulCS :(nonnull UIImage *)DUQEIHLZxlCM :(nonnull UIImage *)YgEAxUxJGwotKCAPzx {
	NSString *ugzpjZETaLvnUYXBWtiEm = @"GlejGQTKDHiZozeDrdvlvANUfpZTSauHdlEpCiLFjyuGbBhFDSAjsMYIJOiozMOjJfzrgnWMJgRCddOFtiZJwPSjAHjayGGNpbEZzDvebWVvSgMDlvLSZnwqrcvECMBlakbcT";
	return ugzpjZETaLvnUYXBWtiEm;
}

- (nonnull UIImage *)eCOHBDGSYW :(nonnull UIImage *)cFKHWDtxXH :(nonnull NSString *)NabPqBeJlcYzW :(nonnull NSData *)WZzZeEQeRgrt :(nonnull NSArray *)uUnignKTcDaAVlpvIV {
	NSData *ZLwosBcszWtgWMyjSPBSk = [@"vodHDQdfbJfNCOWzdOUqZRYVRaSUbekSKuXJxvjrrdUkFZifDkgEQqpJjgrhLWtMmogoJMNvVcslPOSyWCEwOVRtbrEwNZPoSQYOCBm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MPKPlzbCxLxkKTPPL = [UIImage imageWithData:ZLwosBcszWtgWMyjSPBSk];
	MPKPlzbCxLxkKTPPL = [UIImage imageNamed:@"fQXlvjzhQatuwlFgDFNWodudiLvEyycbmHuwXHkGYABTNGJjJQesJlGWvCBbTNVyajOlaTOTqQiDRlEavTvTptMYdJWZZVCdXbUjagRzzoQYTwKBrVPez"];
	return MPKPlzbCxLxkKTPPL;
}

- (nonnull NSDictionary *)YMZPSvvoqNQ :(nonnull NSString *)eRFYibNyYPaIt :(nonnull NSData *)hiLrXPokodiJZZgcOZGBky :(nonnull NSArray *)QLwbQjXwxEOlrscBHjKdFpm {
	NSDictionary *fFRqtqCzhHVerimeZCXgymD = @{
		@"IHLMVXsQxkMWILfHwLc": @"xXJNahmyZPELbuXUXfKXxqccmwAgnUwvPTmknMSlZvXPKoGkomLCWpjXujjrywnUunJZmcFCfVuFQReMUfkaTQIjrnJRNjnTzTcTtoPPJyBtbeXPs",
		@"uIMjpKhkjBcEvEqJ": @"kfkotfarTBLfeZAHWmDbHqfebBGDKgExxzotjmFxOESyOdMZerArOydEvIlLjQgwkONpRfEoCcdhPJNgvjncSHdOxKTtXcDiidlCdDxACalUHw",
		@"CFyhvZjIvAxZNdykjLlEcJQ": @"dkhSnasgCBflzMcGbuCRPPfuVjpUWFNlSAveFHpEfehOJtuLxViyHHGUhOVyCWKUEIDtWZpUlUZdwEIJLREjsDQoyQGCqkKWvnsNGGkFVKdSzBSvEvCnkSRxnGnwMniRSDWiiccsjSbrAvisjkQ",
		@"EcXFtSaRsdtbVgRFiEh": @"PYbkaJWuarmfCGAYyMTmDHxiClYKKHgkJXicKzuwLmaIOMWAoYFbUsLDjTEBrepmylSMgcFYaxeOwnlRKwxCEcUnDchNofrFSSglevVFIlLpuZdofCZYqJeqfWYVISWfVxZdTBCaKZ",
		@"BjJpNMLjTTx": @"NxueinTugmAlqjspfhqwtsXGnSHIHeXwqgsfMzVfRBxyWUpJaiCKWPLjBBNaQsYlMXOcMzptinwewzXjWYdPNwQbTzwBqFcCkSuRhsIOOLFFeObZjWxeUcLceogDLHoYSbURqrOUXJpLK",
		@"rCeCzmILZvwG": @"jipPxephgtDZfvYMgDPGomepXuWLnCOZKBlMuizmRBXAPNOdtKoonwAGmNKaXKWgjBrPGQxygmplJsDmHwIiWsXtrTDwWDTitbaqKMGAHrtyGCYzcVhjwRwBXuMUvKpxiHT",
		@"XeCejoUVjnYzz": @"YyitmKKnGsZmFzHSUzVoWAYQDGtkImdhetyqcVPDNpYSoYNWzeYyZrTorzYobhpddWrxCkbjTFrvfGXUYgQEsToWwynXIcukrqhHHhFeknwxocyFeiUtWPdMDEOfuwcIkFoZMtz",
		@"ayfYbjmHRdguZh": @"AuBkWmwtflgvdYTdfpXjvciRSBOSKYjPZTCfmZRpRzfFdoXeYeDBKqFgZUKFqoqqYWngcGHWCpwYzTDhFMLMwlxOFYpHnacfeygfqKwXIPrfAeAEoPXehsDZVfTjudvUJ",
		@"BkTmsTAriBCpGWRttiI": @"cwAIAGZMTVAgnjToEBjoYBqxrlaSqrgnZKjjGfvupnbZutogsvMfQsBjEBypkrdrCqmymcGQlDGdagGpjpkULqanRnrdGYwiSeDdvEPmJIsFMJNamlRGTutYzmCcCPfHDSyywKYOzJHjMZ",
		@"LYRBUjslTFyq": @"IAwOzGfTUfPrfGZqQsksHBfQzBUYkLqoTQwxxDzMyQkQzgjHCjGNEePfjkXIBWShsJtByofQporwgcceLbQNiYecHwlIbhKusjOYElx",
		@"fJDsvTkmLGJFRMkFsr": @"BZxMupyGYCaSnwqliMUQbgWLzcMOHYDMcxgANPIrOoKOOQlfLTkrIfdzhxbGlVTZAREeBUkTfbDrdceSTzStfSFuqTrVJoypSdUHXQViJKolVsDIzzDoMSYKUpjpqaZG",
		@"SpeAVecAOXWwHA": @"TawKUkXdDQwwOMTdCKQxFXJPhAtHAyTNeaxbfRygNyHCjEBwnWGWwhrJLUjlPNnoWxqAdgohgormBsOPsBgFJXbnOQeNIWGvNBeUUU",
	};
	return fFRqtqCzhHVerimeZCXgymD;
}

- (nonnull NSArray *)HsUKKthzFjW :(nonnull NSArray *)pDJmpYLsuxsfdYCm :(nonnull NSDictionary *)OKtswnhARCPyWHuveATZnlQ :(nonnull NSDictionary *)rBRjbGnwBPDcPvxrSPdPLDn {
	NSArray *OOoavQcOuyrZjoZKjyLGKRWn = @[
		@"FWAMjyUyqJzAReYLZfbXbPfpPIXCCYwDSjigkEibCBlXSfafqHJecdoWlopChGrEWKCmyuHyrdFJwGGLLbhQBdVvCttDHkYPFLowXBxfWWn",
		@"CoRKXLQyflLBIxTnRCaZbRvFuuostVxVLAtBrEgegEocblYGyIgXexLsOUbaPUppGqhsjzCzFyPLNBZXqKPBhWopHMSqXKQClmTPvCDJTlJG",
		@"koIkwcGZSDkZRXmGUmzcfJDdYYcJIspmbCqEBzcoiprnzTiuJAcjrYygjmOXIipIzCidRZCIVnVKNhFOkAuKKTcsfofYNEjJYoxvoKHLqKvNItatNEmhAo",
		@"kMiCJbNtaIAJvIDxnoULsvRWXHLOFIZokRrIAlKAAsZccrZNYCUPNODEPpqXezeLEyOHAXfDIvsoPbDJRvnpJjtRTNSJTqLbnZlhTKWBaecIpEUjva",
		@"dwNDmeAgROcUITDkofVQiTFzlQDyROqfkaxAbBXfNpYdnDCEoZjbtHkLLHYgOMbsMixBMhDOgytGGhKsfINffpVqTlktgDQRMulKhJtqbNXdVLlCueYNFCHeqANmWcsQ",
		@"JSQHoHAtgPGyUfjxRUngfGhpWBnTxuFdNMqpGKbkPmVJwKeiHcinIAWgOyEDHbYAVgmEEwkoDlZoPQlvYmxuxULPxRwoXUtwwGtiymxBpSQpqMowrO",
		@"cOBttzrlHqERLdEmKdzVRbSeeqiVPcmfVshqvhZJrUsZbeIRlBwADgUntgvhDOsJaLFmETtaIldHbXhaTafyrDOARDeSmNWzNywjmmfEbJm",
		@"pFUFveIYNwHfkfTXLlrqYFXflIoeLxXIVrbSjMrvKvvysvXargsHDTCfvehhzojKezjSjxAhsjggjOQgoVajPFvQdxTPcPOPIETHUaocAYdhpkQbLoLlAPGrTBqeaUOtFPhKoiyRZrCSSEqRr",
		@"zVdFblgqsWRxNdKsTpWVumiqGerCZJtjYnXLENcIcrFaFPQeAburziRXlcbevdvshtMdmbhMQVJcaYsRFbDeQXIOTSrUnLFaAcFjAXjqpLpMPoakWuCprQLfkj",
		@"ezohMxrmoGAjBEmIzFNwFFGTnZKUYnPZyMnLZqbVaRrYszTkPzUqIbpknBmgfOZrKYjgtDItvnVmXZNFKTMFCbeJVhajEoBpgOFGsBKcTdSCRJgsbyjmFHMUodTGSggStniWOGFqtsDoSTzPZ",
		@"rdzErtIsGtiGkkigPpxsZFddJhsOQWCyFcvxBqBHCHGUHDjNYJoXBYYnmnsUspHgkcfMglkDujTIpUPnoWgOuqYtIWKLBtxeqIDVYsLKQyaFArLNpDCkIvLQZXK",
		@"SoJJSSPaEZlilbyRpSaLthxqjjsaPKAFuEdVfJoFjfniqqzukKfNQqPzAohVoSWUAGHjXIZaAqiFsZuVAfBylKAlCEdvslRcSfhtwJZfYeDgVpOqBXMYKmxvhsszaLYl",
		@"zMQRfEJedJPtWfxlHjZDiJOnPdOtTaszXDMGkBsGnkJLwQOkqAFkxlyOBHlfstrJsQYGaTTzHwAGqpzeaHufabdvziKUtzuxJgsoJzsUOInPYNPdItnjwaFDGXABFWTOczQGKRPNzWXZ",
		@"lnRBxtRkozNefaGJrAHUwfFRHNxxcdAFONXjPJLRgtJrzxRwlffCeercaFgRDEEWgShlXqLovXJqwEtJeGVtdueZkWoBRLYAbLOVyDhizBYBJqdDVVptOstn",
		@"flQYijvLKaRreUMBNaBjeTixTpPGGqdmVeuegVTbvZGlTkvGVsnYJzMTWoscnapgTedwtaEeOkfMZNUAKhyJXNGkLzgssiAAAAnUTfEOIQwVVlHdLePMdoFHeuftmRdIxiVhCnWZx",
		@"SyPurZGZefDFwBZXhiECFVrEiNhLxAQreQPOJgcgLmarJuHrdMgebIEnAKakyMlNQzlrEBowBfnQqMZGzRNUuifeSkoHIWaIiQgeBlxPeAWeftYogWKzQKNcplkROIAWghvHxSCjV",
		@"BOhvrIbiGhxJGyKtIuSmfVZOkIVhLkQmtIUgwinJaJIoQerXldWDUpCIYMxxMtFlVJkokHXDMJWlHHVRzqVNzXZROvPFdAGOibfkrfKtQoiyaEgjVgULRytzcEeHNeynEJaTyBUaPAoGae",
	];
	return OOoavQcOuyrZjoZKjyLGKRWn;
}

- (nonnull UIImage *)IYtGGFkWKulAfzUHwJ :(nonnull NSData *)zozFiHEfPe :(nonnull NSDictionary *)RtmaPZUkAUjJEsRtPKrJ :(nonnull NSArray *)kpfLnbArhSiMhv :(nonnull NSDictionary *)uXgsMtNSTlBpYxCnHEwN {
	NSData *zrqXKqCYHZRYdBhQIju = [@"fQInUNmoCOjKUACJwUoOIMcsVpLkyUfXsCmGSNqRzsoOiKSvOOCDLScYaWetlTIlfwLTABrdTzMcpczXrSFxcvSflHAtZjnsVknofOjwqkcfxGUurFtMHBgUke" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hTsehqOVPOY = [UIImage imageWithData:zrqXKqCYHZRYdBhQIju];
	hTsehqOVPOY = [UIImage imageNamed:@"kMadktRMdwxzxhYZSGDJLANNPVdnsjMDDlcNsIuroAOnksOBrYupdRPTahXdJJIQAmGkKyEMxCrsfkjUsSdqrBGNqTDjlZNhZHnrLbatTxkL"];
	return hTsehqOVPOY;
}

- (nonnull NSData *)OODvRoEwSCpinEecYhecjtnS :(nonnull NSArray *)NijuUVeXVXveBAYwZSyzxnEE :(nonnull NSDictionary *)ZTohNaocmpHDDaVfByMrmV {
	NSData *vkzQsmkelpoyMKBxBizWYGXW = [@"ZOHGXFeRUoAWYwyXKIbeyoDQOYOsWWbrxmbWGwshaVFGeaMrkcLnLDTosHmrujTVUjCFHBDOSwPdkTsqcqrMPNjmcdKdzHHqgfnbLiylopHDSzsBupNXYUxzhmqkKpCztogWeXP" dataUsingEncoding:NSUTF8StringEncoding];
	return vkzQsmkelpoyMKBxBizWYGXW;
}

- (nonnull NSDictionary *)iJpGCyCAdChVKcvbKqJfwPwb :(nonnull NSArray *)UwqPObtxAeTgZ :(nonnull NSString *)qJSaQwPOjdvqKvHKPL :(nonnull NSDictionary *)iEyRcUOwAqQnmdbaf :(nonnull UIImage *)iOhScswuxfXIOKzqCBFaN :(nonnull NSArray *)lhWJvYfbxoKHoVvFnnPl {
	NSDictionary *gjsOBVkXZMCygeSKW = @{
		@"wXdvXNBnnAAT": @"TVuWamfeDtzdmvjFKmXlovcgihVimcYKeDOoEymiUcBCeHpsYgHlVqMwFyZMJYuBWZPiERsSuZmkKflwtlJKtKqAxHPfBCnjoWZGaFBqhLdtDZTgsvghuKj",
		@"GovgiUNatbPyTEznvIW": @"ekjEYVVBKQxnFsMZfMdZuxACXThhNeLwHpNfQyGJXLIkUYQVsiXMKBtEYvipZMXIUDfdwoPKnoEQKlqJRgjfMgODNffBPLRHwLGtPHtgeibwfSGwdqvClzJWdzlzTLuSbfWNyXQTrhWgb",
		@"eOQWRHCSSlfxNFlpnchyd": @"BhZEJTEoHtZiiAWiSsvNUSpxqQGkcwHVfDRibvOkXCOghLBLhsgFOlCoHgRKEPZZSSgYTcYLNYiRefQoyJSedZncPfYYzcJEJfqCz",
		@"RVJiVNsyxBjUgmRKeVXlNk": @"pYmpMjiFNRquVjgtNpfgKwEMEJkrDqpOAuCiefrUATcKVkuLBdssrGIUeAisHaYCsvqLhGAfWTAgxJTBScoXWsxRpHtRhkZffQdsqJcXpKntXOIIBmUmKLWEYUtDzKZONMHVvsBAtxLrzV",
		@"BIreytmUxABwVyZphuG": @"GJOODHUtefypoPXQVFTwSxwHXFCMbKsyfiRFDfjwhJNMjwTyicxpgXjzisgemteMdUWpPlmiVJjUKapcNDeLzhLHnLRJrhCMSYpopNZqYhLsMVGwyKfPQksKEYuoSYcnhzCnStoaAAIdu",
		@"EeTJeOxWdvZdf": @"LpRLDPNqlryFCuHsIsspkjUPhEaRdVlxcATXKnpcsdRMIdXrWiMshdGNzjRsrGjmgYIaPGLyIueIkNlRnYYvoaHbcKnPGGmQwOjimgciBPHu",
		@"ayOwikqkBUwr": @"CVNweJUlBdqjzzKIezcxcWxjNCRFEQuEHkQpyomMPlzMrjVzdDczbSYxCziMxcmraqDFYVHfvPUDwjFjILivlVkuWaNhgyXDCFIWXBlVGSgJftEYwVRqdGUOhIUearloVXvBU",
		@"WYbutbhvkZsitKHUdbiU": @"NtOHEqKIXLIeoVuONTWgGEeQCTSVtoWclFNVgKmdeybSbgXrOToYJRjcFuDXmlEqusgNdEXEVneogNOiNzHImocbIJLoEQblTDLnfvnrAqUfisIcmtlxrhfnokMChlWyxt",
		@"TqKYTOUltlf": @"vgijSxsEDmhGhVKnIjCOQWpRhPYqnAYjSDtfzENPaducuwirTRDSNoZCVSsaANoBSGsguKJVsKIchauxOgGhkCuuooEYMtYteLCzFaMYsjNGcVXpjPNFfsxvfhLE",
		@"SezAtdumexfiyhPaR": @"AVvLpvkpHwdSjNukgeBRdpqXDfPUxcKdwHYFAHuLudvvibJBNhuSjeFMneMdyAGvXGfaMtbQDOonkutmdbdzqpNyHgTeCZSpBfzmWzZtUlPPiZncTspMhWfghJhENxOcJaPkDTpmCkJq",
		@"aVWbsDmxHDOLw": @"ohdFNLXavOpQWJimaxSObdOeSKkdhDIyMwFafpSXCphvQRyrHApKItrAtMLxceHXFkGFIqBcPUtVygZpbNKHcuYuTIUSEdwaegfYyquxhjVslkewTfKZuAhVCapcqlpIoLLhMTxUpf",
		@"YfXeFaolrCLzFUAq": @"uKGfULDXauohXjCrjhRPlouOurQEcYDVTBZybMtMwtWTzBRlzFgtYZNKTZNSVEKNrbcJJSdrAwblTUUImMByPxTDfWvVqckXCTSaaVkWvmYs",
		@"ynOuUzGlvK": @"uMtqdWyHUrxDDRFkMPBMIWGXUcaUOZiXWHcZMUekOffccVxKkRJwqqgoPUjEsYNgBbHfsNGuKHrzLBZmFvraqGjywOKJtRCSbcsCyXkbjnLBkdUJPzaSsOxvuein",
		@"LFczCZpRVnyVoyKqmWq": @"nUGGVzIbbKxiMbnTlocuGMqcvZtSjOJWSsxnTiktMpNHMHiUTQXcYRmgipAaxZFdbxajdxjJthPaUAbqHtMnlUcRGssXVPAJYxroDpsirfpFAYhgnTdsMtdGVkwqTZddihhoLNuXuW",
		@"MOfAdUfALjmdKvOjY": @"HyXqykJXDdlicVIPecRmSaLZZYFghfIxhgmJQjkzTUdvTGPjZUpoxOKkejqgURZCwpnhirHaUqvxSDjEkvatVTEIBROkIFNeuZBqdUPMINSzYSpsLy",
		@"HysIqNjruPgBIS": @"EsaEoWEKxSbyxdunVBJKeJEYIjnHpdsrYZfciMPjmGIlFHhunvDUYhrJMpgvxMcMtuoeDWZhbJNYTOLSRAupqqOxjgiciznUbIlYcFAQPMwowlbZty",
		@"cluWIqiWuaOoLASzSJwuqK": @"TegLRrYEvdwuYUJZqGQwjffuJNtPCSjJTqNnWIeXQSvopCeVEUNvmpFAERcjaNJYKYNpzBJUgsJXmMekMWkbzPRRVuHyjCvTpsFRetMychkBZI",
		@"CTnwnPKHpIxWaJa": @"aowHxzFstgUsdGUQiQUEQMjwMDmqFJpVDGScHFwlBPGdyYLwvjZtBDaRXCdHXNhZAMeufSWMbcwiUrnkhCSoJaqmFmmjDPvvKSqyHqDwRqCofbbVEN",
	};
	return gjsOBVkXZMCygeSKW;
}

+ (nonnull UIImage *)dHBmVmSqOTU :(nonnull NSData *)jQbtQcINBVvSNYHqUB :(nonnull NSArray *)KHGtYiUmzZQKNlduAuMUiK :(nonnull NSArray *)gnKYItikcKOnZv :(nonnull NSData *)PAwaQLAONcdNESdScNy :(nonnull NSString *)arJIQAWykOzTkQaSUmU {
	NSData *TUqmdIyqruYcfIlSJCEjUvo = [@"VnsBkIlAYttYyArrscudJVNPaWHMurbvfOnZHGMMnUVXZyikplCVjkNizBYWwxnCxjNvHqYfUAZhCwNvNOiXGLOrSoecfZGhlFKWQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bycXwQFscsaAadawijB = [UIImage imageWithData:TUqmdIyqruYcfIlSJCEjUvo];
	bycXwQFscsaAadawijB = [UIImage imageNamed:@"dOIXckcQXdDwTIBUznZOJckLQvPloQTHOdlgqlsEDnmEDbfmgCyCaetCtCCyjtKsQfTjxExaWzpUlIHBXLzEdVAqOmaNRLGiqebuChFnOlFIqXEBOsMIBDDx"];
	return bycXwQFscsaAadawijB;
}

- (nonnull NSDictionary *)pATPdpEZoDlryHnsYMZWT :(nonnull UIImage *)JibObdHFMCi :(nonnull NSArray *)iIiRteIrSYOVeHLmSLlD :(nonnull NSDictionary *)mgQkAfugeC {
	NSDictionary *zjflbjfOJUOC = @{
		@"gfQarolAqOofMCXgtHqE": @"slnKzhVdVElneUhnAUGhhYoMuccoaEqYNVKAZIycIIebQAXuzldMgCaTwvUWJGeCGwudymHImxFihURDfoLBopkLorkJAPQyWkfBi",
		@"BmQfGjxrYfsRnbAm": @"irXEAHGJXaoywvbdPrBOFrKmrnbwCDrrxPvMAPowImpwcWDpKQlvtFkRxUWhuyewyHBqIuDvdKkkdXlfypjEvdWgzQvEqzahjvZMsgYgPLAPyIrKCxzOoTLMjcjzodRfIMdgkmZ",
		@"mQjhBPOoYoSQVXRqNXPevl": @"TGEHSlyTHnppUuhzStoncIQFhcoIoShHnEYThyrtDFcfYZHXtKdmQqidbDzyvZpQzVeHQlCUWgKzBOZSWDkkuOxkHmBXTrWHXQxiDsLBkRZKmbnDeripstPdHSbbYEzVg",
		@"LIkzHspyJVHBNxEptiedxs": @"eTMFICOdEvHvrmyhItcPAaAAVvElBgdfmFkEleUsYQeqCQkZxzzatIQqmQTyeqQpvSDTHRFADmcaklnMNvLgqhmEAwLBYWziMCDeiPi",
		@"jDBeEOXVzWmqloK": @"EfsWNmrhiwuYGquQzPAIYqiiNkspadGTcBWcNpzryifpnjXVFKFFpfMeMriBjdiADRsDUTqThCsUWyziWJRPsXnDMdwCfmtNJjollvsiMZkYbhjpvdJWOlFXDNtKvuZgFbxNbTVLWDsNZMlQ",
		@"JywfpHhVjcZLjQLYCkq": @"WgGHFVBPMuDoPcsLTDyfGWLoQsRhAUxVADBprfMfnTOvvIQajKPSWJbNmtMoeUwXZhAvvMvNVosmaoYyYMeTpGwbCzTPJzWojqpTlBFcsdYAkpuYnjyOyyxHlZFmFCecjFWtTNAiQoA",
		@"EcPdNVMccBUEL": @"NzFzCsxNyvKcTNieruLqRsWALWRSGwjYgcjuSDFyVybJpsnrlJssLAYLgHEgrWZWdJjwqUDVAUyNXaKgqFynqZcRvUBmCZivvYmtnjCgiKBfTYnpwDjlXyNVKySXRY",
		@"kIyQSajpMKZvqecBCaCKF": @"gkeCeISRYMIcHmLUEmoKHxqYUonryHYGcpfVnVPUrBdfEyXeiowabmELLMWRsVIVBeJskBpeIhBfVksCSdPvGgeVzAfSlyFBUkRRFiuvCIiPEklCcHwXZGGqfjcWLKgpjDdIducTbqPRZXgxB",
		@"RgZNXAlAfsEdJGvgsIQQJe": @"PLwvvnxNTZxKKZbktHBXFbaIBggFQJORPDKkEffOZYkclEWZwKBVzQVAjRKAVFbAUrrfASOVqMqDcpvRrzzGRxqkxdnodNsKfnSSpiVBhwdfgjdTyUAwvST",
		@"EUwkSPbeFMSBmUAkD": @"QmFEydvxcjDtJUXAbhmbjlqnEjZVuQyxxGRJIqoweRbfdoBaabveECmzEwVFUdnbRQnHPsFznZBDlzNpkaIuZToLLiJicbvMGkqsRrMoCGrJPrblbCvgHasbKU",
		@"ztXKbNuDdSWhLh": @"kGFNgcvkUIIuslcmXkpQthZfRKeAcgtmewiOuEajIwpcbCpACJpRqCPCNkWiaDxBkrmXEHMwVPrLzoJHApgoTfeUEuKdtIvRoXFXXpowqZAB",
		@"mWcqkEubTQNk": @"hExRnIcFLBzBkstuPjUqEJDLwkFoUasAnEwHasrtlLupiSspCMnRuMmCZZyzAsTQquxNxDGUsEClGxwsySqzqoiqmJeVZjcNmvOhoTIqvsHwOhKlipGzEJYIS",
		@"MLyvPaeZYmeXDEoAltPpYJl": @"EDTuEONQnEwKlKWbrcwrhPTcjTvjVdBMCSbhoGTDiqtMwIQaqrNuPgOtVmrOpQAxfXKvlzEpbrmPKMDOGnmKMTopjMvDHqBdtekka",
		@"CbAWSjcObJ": @"EdDypkQhGRHiBgkvUZhYidQZeBRqCNBBtVSmHVlGeRqJeusFQwmomYsqkILJJTmDBmSsYJQrbSzaObgEefnhJZwSNcAOKBOPSjnqgFVWPrWnDcRUkfUqwYAXuGoApVDXFBRnnm",
		@"WfnNHnXGYpnLXnHqpYhMJqFg": @"AcfqamheyhGxKhpdKeRoPeqQInNwCGKOrDFHGBXQcJCwBazVyElliTuahaRSXkhMiDeJWWACzwmFuxOxCahcqJVPXQPeLnlzQZMCNaBos",
	};
	return zjflbjfOJUOC;
}

- (nonnull NSString *)ekskuIgFgjUFf :(nonnull NSDictionary *)VuOpxUGDmt :(nonnull UIImage *)socqOfKIIvyBpQmcxamBnz {
	NSString *psWtrUOdEaIUej = @"DNcVCnyVhFqBHyppmysNzxszgMdeKAtzzvSNMRasVIBWRUpwQkbBBshlWFOvrbATUAfzfyuSuAQqRLPcvfToboUkjoxQQAcdJzKmzmFSCDFmWLsmHKjWhp";
	return psWtrUOdEaIUej;
}

- (nonnull NSArray *)MGoXwFIhHPNxvNAOPevVpH :(nonnull NSArray *)ZhtlBNjbdxaiJmve :(nonnull NSData *)rgVLbgANzxgTAHyRp :(nonnull NSArray *)XsYxjFRYnapZwiRDbYNGfMqZ {
	NSArray *fhMsiqFrFToLAqKyYzCIF = @[
		@"PuVdBtlMJXxYpycPeyJgyTknBvOTIYopArubWTcSIziCDDnDzdEIDxoWVWBPwGNRAlAxhknLmZeYOWvuolpeGVcSVtZHolzohbmvsdJtZAJAwYNLzunxggbUrwIJY",
		@"wwAqeiEMCGkmCNTWwCMNSzEsRJSVxsABVCJeGZcLQiLgRtWDevtrnNaXCEXnUFFHnzzfDCuVbQhaSggpAgHbxhXdxxyCPRMOIxqfOliXgNMI",
		@"sKWmHkwOsKJHsnCofRoZdoEzOQXwreWIUllfpfQpvcCkhCjfGvulhwgpmHENumhnsJqKylpIOvChpxEpAIPqCTkTQQzjkxPjfspmQRkkKktFRxaCforjsHBDxuXapHyiyKZBgzDjroPgNJzDtxg",
		@"XFoRADNdEHxkMRpocUQqnWvzIksskMNEqLdeFuHVRIISdgEFmSeDZGqrrBTAlKEGBLHXEpLJRGxkLRlVmvnSFJbHrzkTNnjKFsHDtuKrDKljiJTO",
		@"UqcISWgvkNoCjAncSCTgCpUXpNAxOXLMXMkCXpSInsTkLfrYiXZcPmhuJuhTGyKWWefnkTHMCPQsGnnMndESVIxDmsXnPyqXrLIzDDAurHRmCwFCkrDyrMyjoVnb",
		@"CGAQiaPruQzeSprCvSKJgZchhebwHGujIUdEjIMknuMSIAozeNvPyyeYUfSsQBcCOzumLnLkbRSfzfkORukiPWcdxmlOpUEYxUwTTLxihvuLMmFPViHubHBHmWvVSZvmqOLxBNJNmhnrWpLoJ",
		@"zSoezkadDCmPQFGDjHCyiFUYVmPHVsZXdBrrKmmMrTKIAMEWqMJXXqHkrwbjHogQfaUVEHxGKmZLynnCCRaicxhfBQaFHIKrxHtjafIyAMyFLxCInCDtBJZtmMaNdGDTmZX",
		@"sgwTiREbRROBUaEkstttBxUZMIAGEcfGjYWWLAtjXEWoqbaOypMvouPUjopPWPHAAAVHfzqMEBVsYlbBzMxkDaCgBZlTElsWmzXmrMRT",
		@"WqPAoDnNiVXhEMckkFhBfDFKEddngoDdOGrwrDyZOVbjBqPIQnOzqLibuWmnSfyGxslrZRoFZKJKpbzQBYaTSLcboFJcZCjxmbjLptFzpqdjQyioFXsRzXzLhNCjLlbhYXZhD",
		@"UymtMzvnHLRMGvhkeBNwmsVjYyylzphrExJiTOHhmPXflsjdWawdiYMoWMMBLUbUJiCXuBusmBfoHrMGdbDdXaoiwFxxVHxBoWEzwyQRJTh",
		@"SEmBWzxaUmoHTcvtnnScpgBEBbSPXxZiwRlGqKXaWUkONsIxDSNtvJPiMjGPXKGplHfjPSKfyjxyoZXuvGjTsJuBsANkXbPDADkXhAleqIeZwAydsnEBpGXkpCIGbnBbJnTsSBbBSFrNV",
		@"QQqYkUvmYsVJSUdvPdWARmgJwOpmlmOyNcKCHtXmzOaxQjxFdqoVWhKNkwAIWKpdtTGPzVvuCGobhyNCKMGbdYZcpEkKQbNYctOeMMHFEQEhDEigLpIiZsMGMBySV",
		@"BcIaxClTNQZpomiQUJBxjpAWvXinPRXtzDHAvEjdLrYBWxvgLQFidpNTlaAXgoWAcQOOFFByhkCJBsYcZuoJWRfekZElTBOpmZvkpJZCoEApsAhdH",
		@"BWNLbvfIcSmLOqAaGcuiBvcFTqKFnbLGZimeFssBPdotRtXrntQRCtJzkvGkUSyBEDLHFasPDlQTBvuRZkgGHXgPAeUbvapPbPdcbj",
		@"LnnpSDoXKNcDefcYVyodkatSQIVQllyTePhFUgikvCjLCRXcbvBNKkeQDalYpKdWwYwLXsqeaMAPUBNBxepkvnCVyYPdQHlTplXGorjPwXqZIrVXLSlKKxVgkvhviyVnRSpSxPKInouYPmBZZHF",
		@"krpiGexmHREuqJCxnBVoDyJzvBpbbNoPfzdaKnqeKQJTykzXvztznjGFILROaQDiGONJITzKndPHDsQTCWDVQBiNlzEuIxQzMOLXoAshhaoNUmkdBprBjDbpLsKrZ",
	];
	return fhMsiqFrFToLAqKyYzCIF;
}

+ (nonnull NSDictionary *)TBrHQlvaQxgixzLO :(nonnull NSArray *)MLRmvOSpHvceKKTim :(nonnull NSString *)ueRvPWIyXqsAvzRWGAw {
	NSDictionary *OxPPRxvWuFON = @{
		@"TfGcOzYOYsxNlNwUgSf": @"KGkkTJZeIxatsCbsXpnFPoLqTNRShGawpNclvMPgXgxdYxJpbyLfZTJrvwIZPtpaipbdDAyuOxNSNMKjFtqnlpyYYhdJVNZnWJQJbqFgfLL",
		@"ujOTwnaQYyWrDrjCnntxQs": @"oLqcMsWyeQbeJhsaGyhqMfjQvrGlFZoFlwTceMtLkLdtsHlZPGXqfedevPqHwJuqRMFZzkGEzHbUDtZPVIIuLjkuFBHLoLJLbBXsSNBvgAxFhZOqBxMKEbeddpFNuEHhEjNPFirUsIjmKvgjoz",
		@"bePIwxaVUPCvraWA": @"AhTVHGwogiGGRdnsQfMfqLALCKMIEJcaWuOsfUXHJhVhdznHvvZGbNYTWXbUPPpZBHHVdwPRbEHkEaZuyqRlVLvWxceChkHCCVdhzDKKbdlZvT",
		@"WPEmnstUZWd": @"LMtyFtzcsCtyJNnqnmaSDxJOjjBDTtpnrgvuGnyOWBXMIJsyscooHWFmqMtJZiKaZjIxdsynLRBUnWFYlCsJSVNauZdeWSkKYVjwoslLWcsTsjZzLDXxAWhLgOeSptTbKyCGbsGjubunoWOv",
		@"fxMurONlDQvIVDwQMUQ": @"VetEANUzXAGbQHSzNxnYsDDNcnOOPuPsiqFRZTxJJmgMaLONPPJPgiQtgALbxrhyTTiuBFSRRkcnYhbNyDhdTHYsdMrSOfEOMRETYfkcimBCM",
		@"wuxvscKWXRoOXNkAcjjd": @"OzvwmRyAcMvMIKYMvAzgCiSkxbbwYQHxNhWEaeYkNLACUptpYqDcYfEmaXYcqHlMIMgJVpCExXOSiLuUTuBBgrEYSQelbTRielSWuSdgiPmmXRtMGlTgueDtAukJnfCbOxFBJbGOn",
		@"DeJzgVpapu": @"hwBQwyifQchbuHCJsfZEiKaFWFBxjSDHudvcXqnUKMbDgQMupneyaKwnlklWGBqxJmvMPrIAXGJCXpqXhEkjHtRdOiMdvhpKYwIHJpmYUDEkIALi",
		@"DOaWIGFOrtYtEbEq": @"WxkHJuhFtmDNcZSNhncREEOeCYJCdlgXaYCgwFgBbTCcydqUxTrJiHZygXGFSygqelhcLcpiOTUIshpYgnkYCrbXDHtoEqDAnaHlchrBoMWyMbUcWlkoDLrssKCjZVHAjufsIxEUfsHTKsvJ",
		@"cwgCnpEuLwDbIAkpRA": @"eHqgMlLBkpDUDpedKTQKfCocmUMXamydIfYwBviNyQptTjYjehkmYPXzBnTRRcANLrkjkAzgQjfuqltFeWGAWRkFkXKSvWYFMTBExYmKrYZMqmSSEeDgLPzbhDy",
		@"IWFrpcYzvKjC": @"plyhxAwxjesJVGSeGUmokSqQnwBKNVjxnyRtcjteAPvFnWbcstnnizzzNyKxCPRRAUTpASqUaOZTBXHVEzpxoELSlqbdOTpsZsDFxiApoguhwcFPEBQxvNaRGpajhUOfBEGlyyuyoO",
		@"eWFTHnJKgqSqSCtnv": @"mqnBbdIAbJSMUNiUqvtrlvqiEhPFnCCnOSiKbsfLktYbkOaRLmTwAATqnSNqODSoXqGxvmwseoSDCTGvImMCsXUGmBJxInJGbNHXgvrfLUuLomSIoSEVYBvUkwfBlvBgTkXpdrWNT",
		@"uNLljJdjelKH": @"aXdHlzosqlAknJXXmxaOJuWbJOfIvfycISVbpyaPeuQFeVvoWbDADbwAZToOUYwsdqAYzGsafLxxLIrkugjrYsXChLIadfxMqVxlhGYwrTpTtvjWPg",
		@"BsGMEYFvyUwEi": @"HanrHrUWruURXYBAOzbcrNUqgLODbjEUelwYOwDGpXmNmvxoaQeftVUORqiNigvfQMukEPeBFmSXUcNwOAztAFNtmUlJLegwtqLJINPYpQJeOPqNdZuCWNQYUZahAgYZxcotYeDbpeDFUD",
		@"FAZfzYlXSHKwDPMNakgx": @"CZQVdkMPmJNYITQATeloPjsbgRfexjzdYtqNSHghpCeiKGcJfYmopiLgDCbauirXVwUGnzxlltqcYdyxxqKwpSVnAdrlnNDnfEdewwiKQiqYxJhRujwooxeVsDiRmGNeDIEISRjppmLzevYzy",
		@"xrlqUaAxgzMhZkEB": @"wUArpPeBkCIPLbsCNsXfaZBrhLlFIqfKpHDYlBilWMjktVtsNhTjyhwUXIlgdeCuMvCLuacYiJtPYfXDClecvQxlBCNnWtPRHvIDBmGWyyPHKzNU",
		@"FEwNDfNSwMmNjzVAyD": @"WzixWaqUlORQePpzpBBfCgdTGNlUajgJBzTtfBbREjrhFkbqNOwIHyOkDBzRXNtdjqkkXPsYdRxNaLsYjCkllSHpSWsGDbTwjGyACLSVfyZqkmCXNjOcF",
	};
	return OxPPRxvWuFON;
}

- (nonnull NSDictionary *)lXBVBKNKoONGJWZaCsUc :(nonnull NSDictionary *)SUjMmGGiqlJqUL :(nonnull NSDictionary *)SOkiBdnakpOSe :(nonnull NSArray *)clRSgqarpZERiMMMLpGhVdN {
	NSDictionary *FTEMtCXCzsrbciYJt = @{
		@"TOsCSshnzx": @"gpOqouwzgqSRXryHiSeqGAsuIlCPStKEgthpbqiXQNLnTdacDLkEjYACQiHoaTIRVbpnjpatxmRGxKEFTJzeZahtoLVrxmXOuwYiViwSshboLUzBEzfuVRSZDbvFGrJQvxvQqdlMoatDfo",
		@"WqKFJiVxYkrddmDGzUCW": @"zSJuQvMyOeECmKPvPzMeQxJtHUVnWkWgjBnuhAcJJjFeDcBkEIfuJsmdzKxmnvygfYbUEwoLahFpcuimPORtuZGrHQPTLdozOpuEjbWTndcvGXvu",
		@"tsXHuHTzlTJvMZJgbuQj": @"jJVxRAXicBDSUUzGwuTyZTfzorbZCGJhgfvRGvTkcmbIDGndpAhOGBBmIuGBGKIVNJDUyGHlswqdQLPMIOYYdIUNTrHMtmaYghPbytczgqDSPxcbTUojkfzEytcjkXFLQPJUvKSugSUOWVESy",
		@"EqolZyRRGklMkLIRFiqkm": @"nAKpjvkZdDAEdUmxUrjxmURkpVIBjcguUQEBbiDRiKjFHkIROTwTjUbElpeyCkTbzdnJlziFRCQkTErfQbTsonsqvZMOIRoyLKUiMNR",
		@"FDRqokHipKUnfGoopQuzcqp": @"oEwOyOGKFdYJFsLBbedPMqMsuYPhvwfvoLyICOkbLjRNTXCGtSdkEZYXAzfhxKxDdYyzxACnRNxidZCMdBJeBDfzIbsfHMAQaIELUqoTeyEqiJXuakWZZbxDAq",
		@"svXAoVUregfgRQfkUvGFM": @"WrceKJuKBkjuZAsgIEzUqZtAaexOuwRmUBhUyTDOzDgMgipDXJCKHCGohYPCbgNogvYgVXfZFcXFQgIUByzKnSVPNxActkqqbgVDyaIyoQxHmtTrUFVcyLyBPcEXoypJsR",
		@"tCDELvTfFJVlTuqfHvI": @"rlTZXVqVVEpETBMQPzUrAyMRMlvAjHEqmSZHvAjxMqpLJIVckpWTpohwFhwtdMygxhpZYpbuyzPhKbBLMyXsAvDorIERsOCBSimtmuwIMVbpfieflgPOxLd",
		@"ESFhYnuoVHlBL": @"iLmeBmhklXuCvcmtFPMjxgRZflEQEoDDoMaxrwRmwBQBBOJnCGhALbZeKzbeIvnQSpVIqzFBGstaocfngaHavgtlBziMybOUjkyMuzfJHuqJgZtmhwRirknxjNKtLs",
		@"HnfQTNCvHROtxVs": @"lhFabKVvyyrldEFCLtDEafMCxKzgMEwMwdJEXpCDPWgvJSEQiWdkdPBOLCAPpkgNNSmaLWaKcGsgqgzYiUJMcTaavoSXBUIJxZdEFepPBuhlZTwbqrDTEVCGgfdbdCzkd",
		@"hggPDdTmbQlFdIBDLjzVUU": @"BbopFzrdGyRDLyDTWrJGXztrQTKuhrsJLjNKTvpqyrloSiBqRVEkhvrAFAShIRxFNUkvlvVOvSRPrOBstIagoujyebKHtndnUvQvtBjURnvEmmTtlMcXMkpDBcKEjoLslywDeFVOCEQXXIv",
		@"jGuilTBXrzGZiVjM": @"xtbOrkGKnCpajFVeOUPOWAlWNwPnHfypzNAdktftZgDFbpImNWRWEwuZEZMrGjLcfumcBFMCoCRriZJGYeibuKsHiKnHFqmiTyWXbZMFYPHJhtaiAkDyYMMymYjgQzBClHTkFrDkA",
		@"NdQuSJTuvsd": @"xszyWsphlboeClXByOBcqPxOdxGbPcHKdBVBCPtuKrkOchswctfpqbkDkrHMFNdnHMeuepMkadELVYGlsdxKErOokawIFzEWdQpDSNBehotozjKjiAWtumRMnyyFdaUOVNSkCjLtMfdjW",
		@"SRopRRNhvMkOdKYiERYLJ": @"wRKcDjXNazggFdwovOUoIpxCUDMRnXBkURExxDMPYBUnFHQfKCgHPLnpSNCWohbEJlpjDNmJvsaLiyWzlkgrgTwsTZJNXRDVBwVWtcLPLPVjZdutODpTIfeQzikemEXUnYBtoaFIdRL",
	};
	return FTEMtCXCzsrbciYJt;
}

+ (nonnull NSDictionary *)ZPuRQGLlbVdaoVLuHcReeaJS :(nonnull NSArray *)RGIODGDyRbKmZRllSlASe {
	NSDictionary *yDkaPIFigbTGaZutnN = @{
		@"ZHSDsCKUuRsb": @"DtIpygDvYYjGXdzYscvfRyFwgqDFynYyptRQFeHwjwzPyXynLPiwercccAXAEtTjOLrAThMLiFXsTWJhGNKroptpixUIXOuCOkwSeKFcjyWZ",
		@"WwvxovitOAyzhrwHGdnnAxt": @"cxyfxEKninKCmpRlRmsAUYfJTOXnAFxYPRxXmBEiFAmccyizhBoTRMmijLDZAZXBkQQsgScOQTqAofYjOtDLwQYdafoGlQgnyVezMZxqmEXWavnxFWFCigbuRTdHE",
		@"HYEZYVNAAteBlcS": @"glyhyFYEVfPIwqqjUbOsUjGgTKiWdGVHlKamBVaFrORPDGYKFrQeCxodYMKrOsBPFOFXCfrALZxaXZMCmXoYFdDKthROMpJFLcklepVeHZtaSLPirJkkfyerFpyprZYNvleyAzgsZB",
		@"GwYqCNMFoHKhMUYZQSRQvH": @"ldEeCUEKcvVJcPRKFHqHCroqwbNoWFCHSyZLHaINesTPMxxMMxcYuJAUozejjNVqDhrsgUtCpApZDVmEsUaAVimYAXFahQnTBAsSvEWoEJtVMcGJxXyUQVkrDeEymMKB",
		@"YNOjqGWGHUxc": @"HIlTvJYOqSWoZIzKZnwQbquXVfAWaInTzrhmFtBlIJEwSoIvyJmyHqMTJnxqSGmoWZNmLYyJwEzmHhNPYWZltKdFONlrihczkITKHFYCGlqBfpEvRKNQqpWbtsVMkDVeKIOjrWjAeOLrGUsJHgVfE",
		@"FqeFVKqJvywDbna": @"emXhicvvQEiHyOPetkImKDBRAnjvxOXhvsniFFnfTgQqCceJHJwjjJCFzuflGrFugvEDkdeNbsrhbTcnsWlvhlIfTotiRgQsTZEtAMySezxpUDHTEK",
		@"yfgSSRUXMgOihlzzpLtuMa": @"ZMlKYmVoskojILNGCnzXYJrmsGZtHbRNQWsHjhBenWPiRDKaeEAoKTByBINfxcqcwYxPWtApoCTpWAjANtKOesHGEEsqwPfqrCuyHSrXoTMYVcRcDFPsmqYoTtaAcHofuM",
		@"xDLJdfQFGcZgRcS": @"uJbvYJRwrUrEneqivHSzfstcPjgkgEtrDrndzjILrRkcIdFQQKiqiottxKbqoPuOHOIOBnQZCnOLcTmUhUBZtcNrSQszybZayytZEaYKDevguUhuRGgouNnqmhG",
		@"UIsYdMiSWYBVrTQWIQixuza": @"TlzVNXnDSVzIfEEXBkUWAvQXDKKDmAsMcziUgxGxGFnzqtWQgSjgOWaeHIYdAThIPLFKXPtdECrPaSRgQasWXNWcIYTlicLYKxHqgeTEjAuqckYsayScgBbxhUtYD",
		@"NMSyqbhHHoFjiIpOcYrI": @"ljuaqvSPkFHJLVgFlntfThOCShOQdBdrlncasULigaASvFQmSOMDTUfFHFijGdlTHCqnCGBvZaQnYNYKjsJyANZNVXsimhzLybTTFONfMhvWqmRyrqwHvdFdhDkJNdeilgWUJ",
		@"AljvisVfTRoxBkOKZnSWSR": @"tFXhHsyGKQMjDsRFdiUVvGTaCtSeueARkNGKeZHweuxDVrGaOGGEVmUZTPdrRAmxoOvhyfpzBDGEZwqTsUcCrIvbDzSehtVsWmtMclDqt",
		@"ijZFKFephdRjjl": @"gTCEyXvCUsrcRCyqrlddAyEsYHUdShgujajHmqjHJqeDGOrFrMkIeVavutYNLGbfKMPeQKFdlUJJSaVoWgbsrzLjaShFkouLlBSh",
		@"kLNihUdweAlNV": @"PXGBjQFFlJcyUUSMRfzrXReeEvakExqXQRqZxhlotSOHNqZycxQtpbHAaQcIcXnnMSvnDjhSKuelWQEOlFjrMgtxLTyhgYFLwtHWLmoVZacQejtIDWkRxpp",
		@"QKfmsltvUeGNc": @"YszgfpjjfqmmLCbCVKItZpgKwjMTapyBsUZAABzYfzLgRNatKSXTazTOeLxKfkIpCKUmLCpSYnHvYXhjUMZnHPsbcTYCEfcHgohxzFNnpfPJoZeNxMYhKvzCFJvjVDXSY",
		@"goSjkEJNmmGTnmD": @"YJIWRcqkMNjtipAvpXnlkBSpjXXoNHzuPYcqaEENBFezsYUxGPIfDoRPyYPKvYCWmsAxJQdIVdVzDKnBjYZBANpOZrfzSwQwFGBiwdOzAiPuesU",
		@"jGEmxubquyKlAwgV": @"xPJXFczRSvLZTAzppJzYuAclViduIeXhMKKIBGmJmJwvtecuvkonppdJjMJWlTRIXHZqilhxTUuJJiWGkTzIubblKXNvRQKXMeFSmjNJcVgiGtvcSKxhHYYty",
		@"omHkNMjfTMlIxJtOZObs": @"lVpvruSrFKCFdZAjSSRqnpBerRqFTPdmHOfGjZSsLqbuuDDfbIYsOqVxOGDleyWQXFPqmORJwapVpSoePUYhEnggGIcrXePslAGrjvMoAMyigmiuZZLYAwnCqNSTt",
	};
	return yDkaPIFigbTGaZutnN;
}

+ (nonnull NSDictionary *)vdWwgcmGKcXofFeJfVRILrx :(nonnull NSDictionary *)aIOkXnFddZ :(nonnull UIImage *)OwneUktCVwuwFexXF :(nonnull NSDictionary *)CPUbpuwaDcbMoTd {
	NSDictionary *NTvTAMGkadCLrV = @{
		@"AObSmhlWeXmsqTFPCFwft": @"hWZMSLdklotWmDxZObZYAkjdJXLyulafQbiWnnqfvqJBhpaRydBkSiCSgRwgTvbxQNkdmKtHrSbOIkGbkHYfQKXkNmDoghsnwqAvtXXEoNYVq",
		@"zXQDJoriehpxbnhXUwppmYGT": @"NqocEYOSJEkLpEoAJRHexXSHCQoihPNwZbkTjhQfMqLVWjUpfTHMTEUWlDkwmuKHykcJMPEVDFJOZdlLWcmkidWIAPfcJDBoxfWrpzDSYWgiEgTvhaeNekAmNrdoYPrTGtoScPTJzYtzKx",
		@"rUvpwuPqPrNRAdYsvSVzd": @"kfsvyeagFoFiovkOWUXSIVmNecQfiNATQQLRlzAcxsxfVdakbakBxrojscbgCuaVqRIvfxBlWtKhgqrCldQRNsaLToCLQIlIqEsEnVwrykCARiXjjdcRPndYDwrSdCPMUbMPDC",
		@"jlHOadpUdthdNUhTrwSvM": @"oxvcJpUUPFHNKLMQRhiwmvoJVSgfJHXHinJGUQEEnALqrkasuGiySCILoCjineFqVoKtTHjhxWeDhveIYSREalaMiWaPsrfWhmFrCbTQrq",
		@"almSNcATFWqZzlwDXqE": @"nxitpQsXpnzgFbrDKDborVZcJAjFcIMmJimLUijjALRUmDZfEPWngfMUOlBUaFbLOLcXpottVnQzvARVgnzzZMTFJhOrwENrrtDsTFFljLHMXMGyzVWRJzXQzBaxArjKoEwQdfFXA",
		@"gmJjjarSzmPulXqzjYu": @"AgpqvPvpLhvPXvJARehvFoXDuiCcvqcXrQVhGFHYliWGuXXLCdqrfEzMAvTnDOtAnQDzphvQERjZfrPVSxkqMzjZdwnvDUrfSGwMvslDpIElVQ",
		@"vuumeEireciIjFfSRKD": @"lhJUXMcIHjKrigukuzgKyEggfPIQVcdYQzwXMVgKBzFRwdIKwJjANzAdtKRtoDZYUNsOsQKxTbyIMYlQISUPqYkfuOytzPNnoCMabHGSdOcgAZzGJugrTPtHwTdXZSsAXQopwMtsMo",
		@"uqzZevdIQBWonBXQMiBiGS": @"wsOrMqefwYtmxsniZasfMrJHntNHMIDoVtunKbZOKrZlacJDqbJBiblDoWvWWQnJgeIjpsxEqDTBasjAxVLhCZfgsaoqvzNMrspqacxEyGHHsvOSzVRGnBIAMmGyixnMxoKjkMBonHfE",
		@"gCwaQhTvZKEIJKieRsNj": @"acMsCVxEiSIklbGnrQBPAkAPDrTIKrgKqmVuEzhSDSaAMKxEmiFRjvcRkCkTogxARmEpRGODrJtaTxrqZWVPGxyNluAqtCuRHVqtALlnbUoLctqlJQWbtcLktd",
		@"GlwtUOOkAUALtQZolln": @"EzPQZGnFNZOVByEUvHgahppgdGmnCWSZxbAEigxjiwIcPjNHEwToezaSmrAUBhOpvtczQyBWqrKtuJpYOtUeeJwgUlmYPJYNengLAfPOwU",
		@"CRxRGvRvOWAgSEsY": @"KHYPgpsZHxaJmEZmLENhjwxtuLbDjImmxwmQwORqJXBeXBUDqKGOijRRphcwXEemEQnwOngOIVTEwNOOGQOhjprgQKjJZvJxJVdhEbIkUhSehFfHklkFjxfNYGUOUUYMrbmiBqfdgftTnWD",
		@"tBwurjHpJziyCFzJQGeD": @"ZmknIuZEJnKaRpRUzObVOmkchAEHbuLAiMdVDGlPTpTEIQnRXWDLKNFqujYmTLfHNzddpEEJUwIMyzUCmMZADfYTsdCdTOPseZEauyJeXJMkcpBDvBrtCkGXTtpWwaqaQpFD",
		@"zAveJpRxsIzBWs": @"buwMelLEvkqUgbkRbEVKEBceILOazJQWnaokUXOKwROiaAHfxniVUketSaPPGEWDsnTYFwoWrExIwQRRyZNrlmlmXQQGSEBFyfyofXrGywsOSMIxZaWeEyIqjAURxHNFVqjGVkkWBjQkPg",
	};
	return NTvTAMGkadCLrV;
}

+ (nonnull UIImage *)LVSwoHDzOz :(nonnull UIImage *)ClFOAUZCVw :(nonnull NSDictionary *)jnRcYDDqCd :(nonnull NSArray *)RQZYrCuHgNaoj :(nonnull NSDictionary *)kaVYmtGcOQgtANQ :(nonnull NSData *)RUPTcjYUcCPAjW {
	NSData *HnAwrEjySjEHQJxWbrQprftW = [@"PoAURikiSlPNgDjNwTZxfXyFWEJdYdnpSwRxiHFsOLLzdScMoNuQrMjjcQWqLqcdKZGvqxvUGLhvTBleOfRVxLfsacimjCdhVaoGvdOWycFRuzHCf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IbVimysAjWDdlwrdRfJSzlC = [UIImage imageWithData:HnAwrEjySjEHQJxWbrQprftW];
	IbVimysAjWDdlwrdRfJSzlC = [UIImage imageNamed:@"CwHwkkfHSNqIDBBeNoNLKkypiFVfzlhKgTSqAXXuwlJgPmzGPkhhgTZqOOxKQfokkPkZAQzGdZHzluedZmdPTIcbdCywyelxdDrloUtwVXh"];
	return IbVimysAjWDdlwrdRfJSzlC;
}

+ (nonnull NSString *)tWtdMoRFrTjOXivkRZhzXU :(nonnull NSDictionary *)SArweCLLuhcqXCUMmAHtOO :(nonnull NSArray *)ZonpmwJdMKA :(nonnull NSArray *)BcgfOglLqOHQlNG :(nonnull NSArray *)IzGqLcGnsYRPrqcXxqrxNqY :(nonnull NSData *)IbxuzVyBpSWCwksoLdGC {
	NSString *OaDaBKIeORCoPqJI = @"mcOshMhHKJlYYonjhAdzXLsphpvYfzaenhvfSnbBkxdacvcEgivCvaJTNNkCedKNvOzbipNdOkUaviICPOpBCSAtAVxhNIFYlHeGMttBGFemsDAS";
	return OaDaBKIeORCoPqJI;
}

+ (nonnull NSArray *)zkuSysqsJIuOccLz :(nonnull NSString *)uuIWAGXgNFcSHfQC :(nonnull NSString *)PZERiDlUoO :(nonnull NSData *)IacLhTgCdQvIWlGIPHetKza :(nonnull NSDictionary *)FZLQxBSKpxyERueQoFoxQfHG {
	NSArray *QqehAXbbGumSA = @[
		@"AsMknKPKGrtxGvrojPMjcacuPbItxMAMVgZmbSXqBdnFShSIRsFguogkFChbUQadqXLNazajfZrHMuBWCvBppvUlgpTGGJaoRQaptqQdoZPuCkTgBjZFxZnzHqKHfk",
		@"SNsgxNfIvLuczDtBvpPrAhBmRsbjVlSwFYGWoUZdFnXzxDzhEgExbIHWjqpiEHbWYwEPKOqcYyKzlOZANiEyeJZcwnRzHolosFaEcNxfZDXtxPi",
		@"BTorblpGRrTCxwrKepCROmwFrjXOkQyqrUcQwgszmPiYUbDtqCYRhqFjSXQkKepCpGCGTfcngebSvvOhcyMOcbXqDMrlfMMynWtrnkhQULqNlFLzwqQl",
		@"eAxekBfiYeSbDFVNJdammiTBuRrrIHWGWOFkgppNtXfIoHMIDYmwNtkgjRHesbYXDNzliCcpKSvxFwumcuuKJAJwjpGPumigmiwGQnHszGymdgveWxFeRQmxeDQgjqnu",
		@"BaeYtkqzKimRcNvhIrpvKtAyYPRFWTMMRASaoWRzUqdQYkAppYNzBbkshUZlGsZwDiEUOWecoMMngIXtlIptIFAGjRoYYhPnTIiETBHyXTCYnhpGkMueaw",
		@"vLwicdGWlDtUeIZLFXfaNalEbMomlNNksiDgmYvcwhQdFdzAVrcYDPdlUdbcjvJBRYYErynJRlXLkRQralyFlUMDfAHIrehIFklsjRzWlEbjM",
		@"HuQHuAzGYPzsddWvCrwzVnmlthlWDGOlAjhBHUPnKFixWCRetgyIXtUEecOZoyRHdkqqgWWpLaLjBArebJGvhctMgezlVmPeNiwmPBFkQDXUOEiYknkSppfubCbMcA",
		@"cmdzRXiVyqQYVGGVZplVFMZBctlDJKkgpAEaQRFPHlpBSdeygecmpAekSTtOorUzAMxXZeOFDWIzqdgwVcPclhoIMYnwbHZRhFucuQiGvzBnDGEtsUvHQghLHZYesGBmwKX",
		@"IFWRvgcKplVfuXEDGqkhOEnyAiHJBxtxPyxVtwWWuzHZhkoHSTaNrsJANnQekpiocrahAyXzlZwEiAKMmGNeDqBLgPRTnewsZJvoVziMpBbUrD",
		@"sDQHdXZLMHcLyumYLNFZQJzPGfogbkrFqZPHNDDPWHwPWSfYeegDRHGZVvDVkldpiLJpihSCiaukrTlTFQfPgMdvRiHLykAgdCDjDOiBSVrPOCUmMyZANEwxgKyBPOWfUBjfzBpDhuAygWgfQQAr",
		@"wLZAxNTmpTxwKZZNnBSTyeLyLmrpltvsvHNhHscYTTHlgEZVvvIKllcirDYSzcWmCnXIdxiUKgBRFFwkecnRnjLHpsGBvBXaxMSjBjFFwZpAwPsgLiQLZcnsBHaTymEnyNWJFoSkIu",
		@"WdzeKcCFqxxegzOMHcmQiEhFFXayCZDRNhzZPtvtpHWrvZuhelgfEBIkFzvkKAezXhAhgAPumijxtlcwaevntpBVmVtgSBxzMczNCveAfgNFFplosffWVScgwZAdCGhAsctBdVPtAJhXoze",
		@"wPfikWZAFWXXmmTkQKCgeIHFYGpbUEnDBiTRPggwSccHZhziyTMvkslIVtUlySyAayYAwuxrHtqRiUInNrZGAWuMqRzCpeoxaSUkIJLVYJXlgxRZoZEeivn",
		@"yENySOJYlIBMucUBKbIkynTwNMJqcOdaRrNhjeTmHCbIoTKnKKogyigMmMKBToJFxIhsxwuwwfWGVAPfcemqBPqoipRIiScgAxVntRJwtEGbDBgKQdMML",
		@"iFzJrOYUtNttEpZkQERcqrIBuumYBqQbTPtptdsNdNZxMzSLhNaacCERcCJurYbAwAHUDHEsqIhcOwzOOPbICXziMLNVjFqDYNbnyuzohHuGEwBwbBuaYCjvmvYajxEhKkA",
		@"scGKtCXEhLaRDekLfvtrdkGpOFcyCPLYfGbqdplqPXmcbNpCSuxymsZfdZZWUBKZKgNuzYKYhVPyGNUXNCbOyyyaRrOleVcdmujRCeQhMBVpNFoeHvELyqMWrgJkUccfjeaTR",
		@"KSdpZrfOVvQkMLCdJuqKwUXDcTRSIKZoTXbxRpJuDRJwchrGtxhhMUwxIfGliwqhrOlHyfBdebvZXKvQMbxacfVItmqTKCPQQsxrSdwsjWkxcOACFFIDaumNAJIUpBEugSkWUlRztKQLGpNzsPcUM",
		@"FgedqqxQonbQqfDHPUerMMnaUmaLnfNqmBKtLvvFGfFErFCFtEBZncXlAyKWmYiCoPkJXnIukcFJpZewRSHQnIYshFWUcqgpZEgaTXgmQDCjnpLXugxtLUNwkzuIbubOpcExXSVjfDWk",
		@"selXNHCkhXJADXGWnABkHDPLzfVgDEaoTXFjGSPxpYFgmMCKquPOhClsCCszbSQlaPGjuQtuxHSBMBEvSRHijMjhSvHjZDcAfmKWwxRsUYDXlXZVQguOcyNxNWkLwEqYDegvuQXqWYiFoNKS",
	];
	return QqehAXbbGumSA;
}

+ (nonnull NSDictionary *)fVxrYPVLdsavMkYJNYU :(nonnull NSDictionary *)FTCEfZGbmXZixSdFmOPjAi :(nonnull NSData *)GODIvJsAzbAnPBdevzHmVpp :(nonnull NSArray *)yaWjEJGODrjtIxPcXJAnmFd {
	NSDictionary *DUDBYOJbkmcYoDURO = @{
		@"OemRmJPXgBXdQojvqUBCk": @"HxhmOasZCwYqnSFEbLMttaGHQqfeeVSsBYvSHlSlZedizShodcDdYBopfkDSAvicDUDCSdHEQTltGppIGNCIICxBiUllVodKYLHYOMsDmuEnQnjIoDGARzggcNaTaxEoYLAEkorkSQxgnQOZIoSIX",
		@"jWPGgYyiLsZBjFolKdVOiNwM": @"CSOAtYCMxdyUHPEcIYrLJNibyRmfdGeGmxNYlPReSIuVvwdsTMxvhzfFZOsOLRyXelFvlmRjsuMwdxVDjOVciDAJHoduECKJphVAMZBFIuyRgQTQdyiBWbzYzdSphkEpENlOvhwYWnACyUxKnBZ",
		@"hFDWszNZybnajaIZswOWU": @"lkhDcXohNtyMSqCvkAVAXUjsvbYTHceKorNvOIBhJzXdjfXursFhqijHFrbEzCEjRKflqQiYVVEBsFcRZWVvzIPaQzJdPMdIIdBOeBxCPuMHTLmSIwNkuhOVqjw",
		@"WEPqMUaNTLTJKvYst": @"esBmdWRFIASWuBfUFRYKkhYCgWEHRAEfZPXgpqghbFwvLdLAYaGsSlcCLHXOKgARrPALNPrNYgWQDpECinpzkjWpuXBdVFpjJOlpsFTrIeyZsBwYtRllfslnboiIashpawOJUuJkvkkDRgK",
		@"XbUwgyefGpIrYvqIqpttLEoC": @"bWMMzunHMLSeVyxXUcQHyFCcEFwOIusXJeZWSdsDydDSUsTqLfLzlmaNcxXTFCSidEESfiediAIhwWoljvZkZIULqTwGFbouDiFWnJWloIPpQhjkumfRAdfjTWEGRKElwckcnlCcOcQtbyptK",
		@"zlcNcCxPiYNZadFRrWmg": @"bMwpdNURViNOfwDppVTHHlKLmxvkZAoiqkkYgMOHQQeRvKowRxBzzlOzaZqYpxOVRdTfXepYeGqtDBxkNUOiHCobhBqvGvqQjahhmhshXfsaZvdZAYGPTILTbUHWuXkhPThivPhG",
		@"oHEGJSWdNj": @"GyLJnYnpAJXxrVHyFJaayqznJZXcLoHmShtzHwQZKwdScLtRCDevZreVmYhGNyWIimBLpEacdDZtoxPndfSoxJhKrEZCJzHAEsWsSmvlECHQNgcjQoogTqEJfuHuCuIawxBTriyKQjEXqhHNFHys",
		@"iGSmeAETNQtqRpirvkKedzH": @"XhEpridzDlGfbTHrrDfjEdlbjHPRKTTfBXpkIXwUueiHWBwhbeQTGJaeLqdAhVvWOOvSWwVXWeDfOMhvSRtBNkMTHloAQQZyzKChPJZiAlTc",
		@"ClsZmgNYgmZeMi": @"kOyWcLsOTeQkOcdttYjbEmtNviKaSwgWJzGqTOVMlnEOGotqrhChiNhEtLpeubhlHPraigqVZtpvqlnurbnESOzkyRSnGuaBQzrwShLjEXRPOSNVmKwBHsSebBhkPcgZgEwbLedsTTebGposqZQhD",
		@"cDdkrDBKcRFyATNh": @"IhvrqBvgLNjVpHRBogGSZVBnCcMFVrdIimhKMyTJAtHLRcYphbGXravkjSvtIliisqOanFmDXjbmbmdOTbJbNchJxJRaUgOPJbDZxZpRs",
	};
	return DUDBYOJbkmcYoDURO;
}

- (nonnull NSArray *)welzmVdPfXuPxBswglcxyag :(nonnull NSData *)jDWkLxFUJMampvBMiXUIMu :(nonnull NSArray *)HaroFYFjIKoQGxubFjxBqLl :(nonnull NSData *)QqMRrvIDklpRmaYQXnEHgQM {
	NSArray *JLccjBqciyoSWxMBouOL = @[
		@"NbPvDddUKYOZXoaNQvvcVSkajFDYhovxcQktdqIARnMrWyXIqBybqwDreTiwQyNtrHDyGcXwdGroOhOCWpNylkJysfGbmIwHdLMaepKROwEGStmqsMUq",
		@"gBokeVTrwqOZgfefxqjFCoPxxUvMYCzGnlGoGiiAiSzdiJqYqDiNZqxJbxcwtOIDSuiorhwOjXiXoQcbssIugbMTmchHoeFUOHlEQUGqHsWBFOdWqwYmcfXfWIRfifzMRKSqgFwBaIbPHiOToq",
		@"xpGviuujZkvAKfRWvOGANuDkVynuohXKTsFeZfKbFpFeIdhzLbpeFhZbXnRxVqsZQnZTRviGoLhhpVdVrfTekQdppLmuvfGfyYXTIVhKqnurKDjxWroNflHjCnKUYGVwjkncN",
		@"BmNGKkKRBqRQygiVoMvXdxMwlFoDHcQCSTOMMUcdlabkmMdElDRsIOOPdnwJezSfIWERllgRfUdliUGcXAhWrKBKuITXZlhyxJaSLwuexqN",
		@"izJLWgSfXbnkHOsqiZguIMKVyYljasdLJpaPZHdKyaLFcQdqJIAywDvokZaNkzSIXGpiiFRSephgufZcTlZpDEevmqGvtMUkllTMuUfPEOWulEkprYgXWkuzZbpASIshAfDJGPGvtwXpcEkyFTON",
		@"tXnhqjZEiapmYASAPVJoKvXqMRDTUwBYQfvZbHqSDUjcwITHvOPxTNhMGihoMmORGQBjzKnUHVcqslkdQJwgHVRbpTxeDUQrFOadUEjSKixwagdWmcmJsoUHPGdFjHiPYZjWmbSCDEzB",
		@"TJXLnsFWNBThRlIblcrORJlgdqIVYdTBXQrMvqGjtSAcXbUXJfwzEUSfqUXuUZYEexyBHfUTXDZcjMCqVhYpLkNnlFoVfNNhSWydISImvCWaMDKdqWkAOyWa",
		@"zsBiSfSnKCpzLxHefmMjVzRBmFdUroufHmAdNtytiAjZuITdqJaGeZmdjpjzWqyJfERMJRIIQqEMaDlbeVZpSgeUOJYNUhxmjdLodnavhoxKLoBBFbvJBRjCgnefmGXZYTHZGrKYLqRhEERl",
		@"yYpnTTFYYbbsjMMZjOnwOmUccKbgYtcIxItXTbycRhmxOuGFiWKEXikLDfJRRpNwtjIMgihUHTHFvtkxfunqHWXuakgoVGfZkwbVLOgXJrMrHMhMimowwTuBOCLwxghmiQUnitDDEaoUql",
		@"ZwxMniArCDrIkIBFxRFeKnpjcpokHTnAyKVatrnGMFfPfHbNflWRristIAAIUrWOXFqStEpLrcumhXuqLyfRMCgKgUKcOwurIQJjMnFjIzY",
		@"oFSVRGKyuthUwekvXDYyXppSbZfJkVUNHfnUOGBOzxZmNKjKMPAyMwbpBoPLKXWHnJqFcDmnsQdGjZiISrxQJLwEKXEgEsVjCfDApBEUNCVTiSuQjRYlilFmqBrtiltKoNmXfplgLUxcUDV",
	];
	return JLccjBqciyoSWxMBouOL;
}

- (nonnull NSDictionary *)gFjLtfjKFmvJkK :(nonnull NSString *)UhBkHVZlqgYhJOokBmvjDI {
	NSDictionary *BXapVxSLbSsoFil = @{
		@"JNTTrZCEojFgyQ": @"lqomGXouiwoEQDHZtmxcPrMGJbFyhNTZxTIGQSYMSpGZBDyOAlVgeaByHTyhnUEkogYpbuiMRITiFtWtciCWqznziVAwfKJZBnxrINlwRRaEdpIOJrKvMiznLSlk",
		@"bhAbwMAkHIQdgMaJQBDSoZJ": @"pGGNugbQvzqRiqrJWYmWWHqyrGmpMjrvMiZEvigsMajaFpatduzzjLuzjKJJMgtkHOerZDAkzLCXNGgNxkzQYJgUKmpgclcbowXcfHMYKZTXAj",
		@"GDPoIeFDSjrtzZzoTY": @"GNelEgSlAjjTlMbSVOENGrvYkfcZrWKdrynaIWmtbVMwzvVJkRZSGTQAAklusPCmdmUOQxsoTgiVXgMsJAeLOtXPFkUvHKYFHOcIfBQwPhFjfNYaVaJAXUlbeHDlUtwkawDTAUTyibS",
		@"AevnyPWgUOHwsHNHXEMmVQ": @"ZYHptryOevFVKjDIatWWtzlyWeprNBnXuUmhLpWGNhqpCIvPJhBcgFzzbgdQmYESCDQqSqMjsbJNpVUrUXBHtBrALLgqTvdVSGWuWmAjTxIfZDPyLGuPGmrkjhff",
		@"okDzKjUhgp": @"vYryVpTjRgKlIKRQCvPfabpFOxzLawWxUnYPSBBYmxAsiBPJcULFDCEQxwbUEOunpgxFjLFiUTdOkGgPBHQEhYsFQKItfBypENFEPNtlVfPOtgLMesuulrATBmbBEFBeFCth",
		@"oSottAUmBAUMHB": @"ubWmDHnTFcnNqoZKnxTYgQBWOseJWrotwgItSqWXgnjWKvzvKiHdUsDrypJkAusEuqhtnfuFRoMDcWWTTwGzDCAUtJZjWAXWRTkjcataZBZToUiYIpbhHvVrrFtSkYEUsVexTWCtgNHgroHcnV",
		@"WTXPbQIluaBu": @"WvQJTmdQNBmiZzgqsRhvZZbNOvMNgzqHuCSgDYrmYtQYVCmSvPWOEtxdgVlIIWoXyvsWWxgfnsPouXZDlrVeLkNuONdzPNdjFAyBMBvKrmKbRGAwiQOJqZGZmXNdLmXdnSdKnKzhd",
		@"VgAlcusVbUlvXKWwTxYrCf": @"LuKUgnoQjcVAKVpmjhXRDNeWjLehBBpthjHVElmAJpccEPWkFCDJyBRWtkzLXjJTxCoHWeVJlMnhhZbaQlDsRdakQIfpsEtQEmXFtvDhFcEUWLnRNXwOAwrmSNNFbcAGKQhqMzf",
		@"gjhkgqAzAKeHXR": @"xUwHcwpizDFdxLXEEyPKrpmghQMwDzTlvskAKOGpVuVhegqibJWVeUEyYnWiHNVIzyDddzfgaRewwQbpUeBJFkEkrWhuHPotAPfqGNaBvPTtjDxgttIvkMzwvELnxRp",
		@"mEuSepyhdAEdWxFeKYjCM": @"AVsugbCqbtblgSJVLDIeayrIPzCThHrSEirumRWjGrUCYFDHgsEyAcHvZQEoZLFiVMWrgxzjHpgpzaEDbOYlQWseRZBJUvulNEabpyZBIbEcsZvtfmADWAyluyFKXtjZTSyYpMQAwxYDUxDJz",
		@"FFcfsNSvovGCJm": @"IgvWZDlpihcehEsIrWfTNRAMRrzhpwAALIfYhEZQJuefZjgbUVkRmxIVNqMdcPBcbuvEuQfavCgszRsHAaGpBBQYuJPppqJcQJrQZOzkBausUFXVtdAaqdFUVXvHDnLIhkVSvGGSATnVxGwXwCOD",
		@"NhhVjxxesin": @"xbbvcgwGMNmiGEofFpgvLNdXAnbyqYpFUHwOuDPmijVhguhsBSFddqfQvgpNsiqOSzaXsaAFuxATfgdnAZlaCZIisGWeNMEpmfSuTmeUQSsBupGvsMZSXDBZbQhUxXV",
		@"QPFBioTxImIQVSRST": @"BTRfUmwhSgefGACImoXBAJPgVbPsMOiAIFHOmYwZEtCSWUSrhnlPwNxSpWKHdWbGQVWagpteJyJMQqgEVjtIiiAYmhvWIwuNFjxOetsWyhkiVPUQEzvdRvSlbglhWZHmmwtSOBCE",
		@"AEsMXvylevpvg": @"vWJoTvrIkxbNtqetZliMrTwUtuJTmaUqSmDLLduRZPTDYypJlYziezDUeOFWERNrKciaBSwBJHTtdAqZprQgMeIRIcRpgObXsFgnzLLCubBnSZ",
		@"XNAffOcjMRjGHS": @"QYZKJAmmtQfPXELvqcBNbliwHZkUStfdCvxenXbKMNMFZJugOAPBkivbiOYAyoRfIrIoFTdHnSnsfZQqawYEZuoFoeyWGtwQVoZlAOUROPWDYQgHuoHMIcXYaWfXryQmkXvNKmSJoFVVZ",
		@"hAolwiIFFCdcLMSAII": @"MewsbchrMSSjAnwfdJRqWjLRDNtBhtKGtCGQxQBeGgpTbWkLnDBKIksSNKjIdhMQrhivxXtvPlGTAEHZNYNexKPNYOspbDDoWDCAoMAoHAyevoYMpkOxrMPWJxQAYjyG",
	};
	return BXapVxSLbSsoFil;
}

- (nonnull NSDictionary *)XTecVflPzMmvcUUxKyfSSupr :(nonnull NSString *)ffRKxUHPlRfDuibgNBohNuTD :(nonnull UIImage *)kpNMuieiYzuxVae :(nonnull NSDictionary *)TIqUFqHoLRDVR :(nonnull NSDictionary *)rWwqbQvZergprYAxbVhk :(nonnull UIImage *)VWuvfDrdJfl {
	NSDictionary *gecFyuhHmwHtAaT = @{
		@"MReKWkBPdGeUJqipfqolGH": @"guORaHkitRfjXEbScttgcXFnahasAocnGmpXhULIredkEqfvssdEzKEugtYLEzlcmjdGhmTYBXeoqTpGAsTCMelFyBWdxvhVubBLcOpLUiAMWcxAwrDTQuDmqE",
		@"SFZjCtaNcBQzjy": @"QuROTFjhxnDuNVSuDLFUPFxslPbHFKiQVGsDwHLlZTfTjgaNzczUNXxopMpOHoRAspglSOOAmFIWZfICcXUxjUuYOujtMjCtOjlzLOsRqupDKZRqlke",
		@"EPvsXKtMFOWWzYDNfHHz": @"ROrQrXuFMYPwqRmgYkWrMfYYxkeHATBMYQfwAmVWrprtuliuhJUrWDqHxHbXKQZNepgEgkCpSqaJlEXlXTUppdSjhjosKOoiThnnvtcqnH",
		@"SwwdbOyDNVAhaKSAoppzj": @"ADolOnYYMpFDRMTKdkhZedhuyKsPboZuuOdiJMrjIRGOyGHhDqTUqSRMIzwZvvROifvnIrFjjsZDRXIOtsRWGocivbhsXuBXqYLOxOvXCzydfLrNJaqkByoMDGObplkWCTxUsGhZ",
		@"tOHRFGPVEOAyarrPovn": @"puozjECbnRLUcZskzySXiyfjuonEZEEBMvfdqkZMwTtzWKvrtGPRYEnSqudoolGysQHHRRtHywDAKIOeYxoRzztcCbXiPIJbhWsggucypfwstf",
		@"KPezondAgccQ": @"IKRhNgrQHMdjMEZZtOOmvkqjQcQRdBoqJLEhDAuGqRHqtkimdyDmsoYvXkPNLaypHczBDeSLEhZYBOCitXvivWFVejaXcRZpsHnTFRueXMChuUBdAxmgsmTcEQRMRYaNfBdLxjxcOzct",
		@"TqoIhERsPAnzGrVVKaUl": @"FlkNMLgcVnVWiliLygTbRYtcBQXbmZTOhwNZLCYbIaNRSPfWsrtHSbxKRAQeRkLqQcnhtPwaBYGLJksaBOoSGCsgrLBplIxMlbBVMjqqrkKawYKx",
		@"sjUfrycvjLMTuc": @"ZbVVtTckUtbwzbXDNNSBRCNIttBvwWKzTdiHUBycSEYsdUgHWLHaouNmkhoqshrUImNCRXZPtckGJZPyaPaSEbznXUyvovwjdKOSXbImfQKFnFoduInyaAnJMAZ",
		@"YHzxVkFZQVPYqujaclR": @"sAudHPfxVAKsRYvcsnTnhYRtExfdjjqAvFTgLXFQWyUZgWyrGISwHLGhSOeCcYzNSpxQVwOYmximgmfkVKdfJvKLBWdwkYVMlnATtUbNMNulD",
		@"SHNTluRzfhqRgNaKbXL": @"SOEaDrtDsKIcxVChCgasEQaUXXMrOaQqPcDpoprMdsUGPbsTzuAonLbNTFrkbkNhaskAOXyxlSVzNyeHBeRoFVUYBWeczUlzIatpCtqYIFWzPKjVOQqnlGETwDXJakKIBinfbxnagJMhzpL",
		@"GkVesshtxAPwZFzXOGZ": @"baxJRrGOCNoMmvltTvswWDcORMfbOTEQGdNBPzGLtulRXrTomlkOgeBpLYepDpmtNSsIVDLZBXIkrOQvSZOsWsXEkdCyUsuJlfrjCjCzjIJnWZaYrzLbHnedlgtq",
		@"KIchwEblzrruAKvKstw": @"bZxJvXTpezSlzcOlQnnCLoaKlSTrCfAtpywTasBwEhjGNkoMCEjdZEvLjtCNPQkhoZCwDhOTUlnDCnKJMMoUyDLHqPlVgnkUeBpQiDirJwtoSXnQcndDrVILaaIDSbOqyAkGUzOPU",
		@"NiHbYcoeWDQiBiaNucgKfvpa": @"unNyiBGlQCyqmUvEsLEfVyOdlmJcPkmJzLvdbbGqQTZDvQgZbhRaMYkjBBXeCicEBDUJDoLfoxMSfXGbgqwYWBMgZrfpAeRvBUmdf",
		@"enBydqwaGjdABjD": @"FFuMiUpkBzwPbOZLSzbDTTDiTyyzOZWgQsnuHVEUNNmPGQIMEheWUWISKEZgwRtRylliZYWUdiiynLVEprUlbkdwmoVcxbKUMnFcwDRKerWNuhgnCWJRabXhmxOuVXPvlHxeRh",
		@"olLwGpAAFuwTXCk": @"SxeUGaCTrQOarCzwwxtumWuPvQQZZPKECCeWNRwpFNaWFmgTBdkhNOWhOXbEQRQacXEyCLbHoYlWpNcSclDNzOZikgHppmZYiWFobQdQfcTTcuMhSFOkeHLpZFympCVbqxGcHmtIJFOsdPWEjRIfr",
		@"KfXnIefafCBtVUjxZAbBt": @"qNjuGOFdyFiQTNoxbctRyYvCoBXUJmHhAbGitOsboAoAQmUSBqUFlazKiQfMSPYQwvAiFSsIKXWInSvtHCiCGGJunyazgRdbtSRkksNbHJEJuukxXSLPSJuEqJGFpHBGFe",
		@"aHYtLahNAMbPFgClvGsmwIhi": @"MpEcRarGkyhBIUlyohasUfaWHsAxtAfWETJGhRopOCGXQaKNeEseUFNqjSXWhcbaWOTrpGYWmfkXjubaZEAvbrtLsKElypfhEjpajPzxLoZEVMSwmVeiMIEerJ",
	};
	return gecFyuhHmwHtAaT;
}

+ (nonnull NSArray *)FCajgSczbEQKNljnF :(nonnull NSDictionary *)mkJTdotIPSloiMgDBEIF :(nonnull UIImage *)MFAqmBZVOAbRvrvUAnDi :(nonnull NSArray *)VGbFWXjlPsEhxXwfNJIuO :(nonnull NSDictionary *)DIWKXIPOFayA :(nonnull NSData *)LyryLQWQvmQTgGZGvfa {
	NSArray *mCyURwuFBKXPVnJgoBfBOjDG = @[
		@"uvIGKyQITOMixPDLqYKrPLnTAHRAqcTyvnIKfEqMOFvBPwHOsSSmlxgjRAEyFIYqVLsglniKnQFekFbiZixapuGtViaprVEFIWDBsqKQkqeWeuOjQJqHkKUKpUomZZGDIp",
		@"NbWQlPJJoBKNGFgfuQWLqhyYqLaNtSJQODlzdlQuRLjasMgEfBStDTPZsvJsIVyEMyOKJpuElMqTNMYWRGnsMSCfWCzhlyoKBOccQoFKqsZz",
		@"WRgNuaddNObqYuTDDVBNdZMXJRZyvoVKkCexmLSGpXnUSwOGNCAJtfJHiVUSeqWNqclLeQuIIIyWRNwQpDUVZkxuCDcevvSODXewwxMIFpDkrmhNupARywzkWKvkycNrSSFPbijETyaON",
		@"cMfFrOJWLnITiqMaaKxHUmDWLeoIcXtencOcclUfXQawQffwISxBnjKFkpHJWIGvHNBjNTLpTyyMpPhjvkfSiHzMOqCONTPoUCJbVtrIqmrFFsfSTQjU",
		@"JGsbxGLKHkxSqlTffGUklnXfQSQeOzvBipBsxuBYYAjECLeRixQFkGWaMPSlxyQevVQsesqNuYoYHvwatPFffVXmrYAFYQXKLijUleTXekLfKAHnaKILegFyCWhtmhxCnbPohdROJEBzHW",
		@"cwlJKTTcuXuzxNEjfoRSLZCynqbKiuRypsDvxiTQIHxjoRYNLafeYaGwHZuxmVkauwhdvjpxnRdTRmPbCIJEQrhYZDWpofPPLLFVrfAdjrPXtJbWwwYlEBkDEfycTOMR",
		@"JWqBchqUndzrrjShovEbBCfMQobuxEBzDixcyDSohqaDVhnCbafaxKhLRjlOfXtTtQWgtgavIYVShRGLBNjgkGNTrLjPIfOujOLIUIN",
		@"JuwkurkhoDAWqyHRemfufvanwSMJvaCJwHHjMFliFvWBtlxhPbcctoyHGIUnFDSAKSWbKlSbqEjgHgIBMuvuWzEnmMaPsbhgvmHXAhSKCdkJikrJXNvFstKdYesNncAdoRJyjF",
		@"HRtqujeCmwoATSRNHvcBBSpfmwcUQpBHnHxyTZHlGiffTJrXpRTkqugIcLOkEvrSwFRIsGMBnFuZGLmmbaaIrtOHThVBKjIfoYCxjVtbWovlXVSLdSwJVP",
		@"FzUHcNQCFiRbHSSNsHdxLgVdcSEgDQFEtfssXSvWHUZsnRRewyTBofhHwgxhJydlljUvYYJblEgMaLJUiGCYjeEzJztVtJYBVKHqRrGNOsGqDXpCzuUxXaAlLgBvnBKSvH",
		@"emBMEPgfivVsGlngfBlYpvdNVwSWXwTmVJOkfBJnSlxgVeMvtRixUtNWeYsaNIHNXzSzsqUztwFkHlKmnveJanTkdorzavHJuShzjunnxNa",
		@"JnYqKRPBbxhrcGrKpPdnfwbtBplJKnROXMzLJmiljfPYtAObYHORNKlrJgjnhoLtboHiWfVBuNCFOcFVYLeNfnSZFbrfnPaaPvHHBUnvHIxqQhdu",
		@"mxFlNQJlOmNWQJmKQKqKTlnZyWIGhrtooqxCnYwGkbnvPALoGjRrkZuHfJUNcXvtVhCSWJqESoAQcidVAYrhyXoqcUKVlooduMlTTeVKgaWzwovmPMZMSsdgWgPWuBs",
		@"hZdBmwBweTGeHZylpixmoItEcBjZEUylYRHBQEPbUHNvhmGsOrQdlIuAhLbsSPiVvjffccmtVYEuVFuIEXcqaDmqlGefJPcnoMNdfmlDFmFiRoZAQUQfOVqkjWSoWLJoxDmo",
		@"hOeBRoYaQNLNNAKVSfOuDzPLDtdoXWmkonVpuqbuevXPvBeyoIRtZSXwOgFGhMeZilbqQdgjZFQLBUDmgxLkrrMwlMBPorsMbnXmbxILoiBmbYeQIXlfQJqdoKEFruKvaNQzXAKbi",
	];
	return mCyURwuFBKXPVnJgoBfBOjDG;
}

+ (nonnull UIImage *)NMeWYeylpJhlBMQUqNp :(nonnull NSArray *)jQlvIcLJZuqWAxwmbLX :(nonnull NSString *)zXmJINlYvrijOsaF :(nonnull UIImage *)tNirYYdRPVCBl :(nonnull UIImage *)fUqmMXBZsfJHcwOnrZLiPt {
	NSData *XwRhaLGAuvGhJXIkS = [@"zlTHiwavLuxhSsUVcsHJtSnrTYMawTmujdgmrVmRozCXOUlheJLzmRfflmbyUtnyeItHLtAaKnSbVehmPDjPpQDBLsjBJEcgCOrxtjTzVxGT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zyFweZiTNZtzjti = [UIImage imageWithData:XwRhaLGAuvGhJXIkS];
	zyFweZiTNZtzjti = [UIImage imageNamed:@"hFdrabyvzJzPsGaBFKUaWYUeDigXjcAyiIbKwSgxHqaoMJdLzAMUMyOwqxyHdNzsAkQhPZwfQNrdFADrXtPYmcEZZRkqfhvTOdSgM"];
	return zyFweZiTNZtzjti;
}

- (nonnull UIImage *)yJDQexUUCWwvaCgaG :(nonnull NSArray *)sukFIKjZaMMbW {
	NSData *KvZOtraIbhQ = [@"bxzpMMUJcJRUUikLIwleCoHivAyATWQSRuGFqAUlprUmpDoprNxJDEeVyliLRPXfharvAVOYdrMVPuHEPHEWOOglsoCXEWiQLswiqHzkegtITyHNFIGzTQRsnfFWCmftgzcRfdXpa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZmdploBBpbNzNoy = [UIImage imageWithData:KvZOtraIbhQ];
	ZmdploBBpbNzNoy = [UIImage imageNamed:@"ZBpdCRWhvoleMIhgwORqkbluaZvpUWeOGoGouEvbaKOVGZrAYOlcYhXIMoXCQnLxeoIDLXuQvoEdfqBIMXdierDgSHEymQHqoJOoPSKLvJrOSjAXqoYt"];
	return ZmdploBBpbNzNoy;
}

- (nonnull NSDictionary *)FKYwEcJUOrRrwJqECAb :(nonnull NSDictionary *)bfPoAXCZYmN {
	NSDictionary *asmhbaTEFmKixkGrzNt = @{
		@"dTRJywTifJZhduTYMYTpkaJ": @"JrHbeYwuXFIKWqDiwqgtoLsyQTngJOawzuODmRNFBxpFykNrSeEwlthsfSGRwdsaVmdaqeoFfSnadeYjhzuMFrQVUJSfXNtTWdaCKPPxzhfdKK",
		@"dbkEXkRdKRMUbhAOkonovjHq": @"dECtdcjhLkWZDtkHnfJJKDQoMJvCnMoNZrkOUdiWXEsGnLxQbWxlhnNIdROXRasVUyCNtlaqidqfroVeIlEtTfIUZlQxFCtOuPrGiWyzgxnPmHVUfgTKaEvBewmGeVUCiuH",
		@"DaEWpsBwukYaCtcuQiqwH": @"yObiKDVYMLWvhAhJhpIWCcbcQoOJcPZmkZnyXZPCVoAxGOjeLhrZDjLlZvLseJILSjyMPAIlXSQKhmPZOvYjUaAhyHVfFaCbDHUozqBopMxGqIqkVQPjhyTLlkctvLhEnlGNFtljawt",
		@"VXmhKrbXendWzYSSBv": @"AhFfPJnIZSsdYMfNSTzvjlDAXxMkKmMnTodjkXGPgbUNbzbQpwzCHyqPhpKXtCRbiDxOXZpltutDyTvUiJqmWreaLNaTbptVFQDOuwcdPFXOQvxEkbCWthZWSaNJbZdvX",
		@"qJYWSTRmSLqxjluDH": @"ELjtEHaJafmTETQaxXxHwYUHuySftmSzGtBMSckgAAMxgesiNjrkgUlFDIpPQtEKxdUjqaTCWSWJIzbHwFtlHoHIKmLgnUzUMJpiPDEmBCVDvos",
		@"aprsvnarMzYswGAh": @"ulGuBUyGAAuJlvgtbEOqlKFDoqcTArpXZNLAulPAIrcWUwPUQRrNfafJSYPZZEfHtfiANkpcjHEQRgpDJYKOTHWqrOzzcGHjZcJrQAISyZVF",
		@"zzAVqQrcWfhQpNZZJ": @"lzcSgaZqkmdRjqxfuepkUqPhUyPgbivoGBzochajHHXtxbKlnoZpZJYeuVTmkpUcbOIBKfLgzwFANpfYzmXkxOBpgvFeBUOdejGqInjXYLEtlrEEBmVzvKfKMEBHLkXq",
		@"idFilapKUOSjXSZ": @"wxCWooQXPHiYIcQcHMLfhBwyjwUKmEKMIMRowVIGHWuWtSMbeGjtEgHrBfdVWIIVqBhHYEQqzabyMLrlErGqVWKzYeRSnBjtkKliQlYxcYFmNvmMHHMs",
		@"fnFAzaOnpqJf": @"NHTryBQDLcrgMKAQLDlFmweZlxxGsgSIbCBNcfuBvYGqVbLjZBQaOimnZXHMCzUuaSZvSgottRpLYLjhhwilERXVrQaYWnUsKxHXQrYpHiWpvWiFq",
		@"gnkxAiITkFXxygPIEkiBHnk": @"NvvKrKKubcatbjwjTmwkEyvykHGpnHmMwOKHJXAWcAKImtfvMUGsytFLRoDvHzFIetXczApioegxxpukCzZcevHARNsxpPlYCAKTHrqZuoMKIRvjVUsZNVHRcIcWFKYVsTvkjQc",
		@"JIvuaDxgtYohVwE": @"VAxBkykmqsWnJosZWrwsrIfWJcSgLdtlVFZPmiEoJqykqRFQQOOkAqZXzlEdIhrhtIVdcCSVUAAmFDXuAMJybvsNQGSxcNafSiAJPbRsEnn",
		@"BkKkKlPkUoVn": @"tkyJrtNXkOojLkfaJmzFzhEIjzzsmPDSygyzCZVmBmtGkVSdYwEikNOxEdxqcpMjKtHzsVNNnSLQmtWdMAcvtQqGlGvTbRqAkRIFPP",
		@"iRxoKDEOGQceUEo": @"pHxIGmTnFGawntJdVlCNyImtOUeoIEjpmbyEhFwygyEetvYziUqvLRSLUBzoARFIoyjatescTLsOqumZLQOYlakKKMTgLBgiSbBJITcFmCMYLtYCGHqHthXdKwWRiMsPjVOyfxklujUYdmCtP",
		@"RTzeBJFVMRgk": @"dgZBxdydvqYesKVVIGWKPnuPzvoOnEWQHZaRZGRdxyZbpsWqpcmBfeViXPrkunnspblUERHuMytSEvZNXGOoRtPbVoGUjwhaSCznAVKcBpIWKSskNBNkoTlxVOIbiBlVXfVTCVJsbBblaaDnzEG",
		@"dDDylWRrXeEHNrPgqCoG": @"DQSHIsGvRtQppTpeOmbMGIAzFwDzpsyvRYQJqJsYXKHVMQMcvaILWhVkUlFKzAkArOHdmXSbIghGAeUaBNFWXRFCjykRjYyvLAswTPyACMYafJVskeWWRVaqLDWnwOciWvL",
		@"vRciRwiYarajRLW": @"GRLMFiFkjSjLnrSzURGnjzNMzWhSKbAhRPoZYpFcKjqYOxYHALFjwimfYUYuhbrqBtzChpSVqKrvktLgvCvexMWypytCdSdbbiSpvtQBUhla",
		@"FPTFVtnkAIBDECcTqCnFfQdX": @"NipeHpUiTUpRVXtpJcKRVyfnZkNFyPMstuRDtPoMUHzQyZBcvSqqbDKvkvldChfRTKCbehwJRgHAlHNgcxNbnTaxhkAtWJHEmIURqHIqXMmNZPXNWsRhMBGmwnSgUMduFtmZzavWknLzwvHul",
	};
	return asmhbaTEFmKixkGrzNt;
}

- (nonnull NSArray *)IFgBIxWARnkZqdDzKcjoB :(nonnull UIImage *)olQrBCNMPHw :(nonnull NSString *)jFsLZhKtvOeVLlSTvdPmCGG :(nonnull NSDictionary *)UcOEtpRjKJqwvUHzyM :(nonnull NSArray *)QXxwqBdrvvc {
	NSArray *AFVNfGHfVv = @[
		@"bvBqGACJZbaJvsKbauVXfBEZcviedrkUuogliXDVpYAqEeviVFrdNzuYALwWhELbYznWGLTtMpiAHTMLUKnTUpGzxVeiTNhHLaMvUDWMCuAHDHbnwdhmdwJlaWvobfXzuLx",
		@"wwmBIejJLtjqNrseKEmohXyVsdtCwnAqOBMivIPmPjvGpZyKeXVchOsabJobUXFTiabFvVPtoRZkwLBXdKWDmdFRjwNXIGyCIsojuRuHAuKdQToWjFYyR",
		@"QLAnvRfxWfzWDuZBgQkEXBtaUyZdOyhJTNTmiOayUkyyMDagwGcHEEwaEfiYrDDzbGIWtRnPgnwfIMEeZGgtpRWiawYRSKUAjjsAZEodSckZScaaPrMBqLPWztSqLelQTtrBvaKVLrVembt",
		@"gDlCEqkirxDLNxoEMaykkzuideURjARQttHowGubDwlmVRqxEZEJGlhDcFyaOctkgDqsgBBHShgZqZGKUlZxdSQSftgpITfwXhtSKHhjiAqT",
		@"uLISDvPOWbXrURWHjKRiGomSuOTBxuQEKIWBuoLsBrneLOduwiCfCZPHokKeeDaRxlSFbTFsApmArmGAbvwhfaYxnFLWqBNFDTestvbhQuCaRiGNPphkNjQVvZCzTtySSsBENLAgLccmN",
		@"pABDHifEvYwZkIAmKyNcHmOkoDuuPAsJZRthBfvGWFLgkSuZcWlUuanlyCFTRIbEpwHQJwGqLmkrsnBJCofnmUHajFoNFPRPzJDppscMuuIFlACTIoiu",
		@"pWIjQCdPnhOcTVdYWbDEyILRopBWciKJdxZIFtrYYjweZqMjVhjvNJyIPhtpXtaXyNheMeBcuOMGtkXgjRlqrvcgaWMkceTfIoKVsUhDlevHEJLEVWQSPoPNTPjivMnDNwcyeruFvXHsWoAdQ",
		@"rcovBzxHAYRjkxWXfCSkSQHQzgwNiYyYUpZuQWfuzgHbJhFeeHuobseQcxMIHnRfRqACvwpWZKoqwSeRGctqwZyYBmfEsLqlPQmhiqmJLmHsuecvQfSoIuPIqqIpGcDztPSum",
		@"iJyaIyKCqpNQuupJGklPnUjNovFATkRyRoaNGYXFQpWqPHNnLmYBoztKlSPgUQaksphdXpVPcgycTtvcuiZcdZCfLngqVIdaEDuyWxUqZwBWPFDZ",
		@"XFHDCqyXOShMPQZERiYPUXosBfntOhQRVYYqoqiSkJOFgYxwDFEECBImhgMtuNwGGKWBzZDcCUUOAJcpPAQzkfcZbjSfaNqoMOfHUeTUyHsCpAHxpMZMCZ",
	];
	return AFVNfGHfVv;
}

- (nonnull NSData *)xvDvehUFtTnEBmllPC :(nonnull NSDictionary *)jToYsQSWWfbiDfzM :(nonnull UIImage *)NRJrUeZcAjFNDzbFiFKrTm :(nonnull NSString *)qBEHxZXFXKrKipSmhBM {
	NSData *pswXLZjwcoPKaDlQxOXOA = [@"iLMdMXLoJzxqPIMmmhRcnmeLewcKjXgnIoupvfcWufLmOPqiGuDtImQwsZXitikzlbYMRtpYlOaoSxNchpfizCwnBJfjkkqWEDMRMAxXnWjxwyeUltYgyMOKiERb" dataUsingEncoding:NSUTF8StringEncoding];
	return pswXLZjwcoPKaDlQxOXOA;
}

- (nonnull NSData *)RlLPMJTfmicL :(nonnull NSString *)ExOOOStsHYLAinS :(nonnull NSData *)wbJgQdBrToKn :(nonnull NSArray *)HLveCxVfKsmX :(nonnull NSString *)CUtrSbnLUCIV :(nonnull NSString *)fhIQCLNKAeXrQERsOl {
	NSData *ykkIQFmLUXQgavsbMh = [@"bKmApWoCEGwFMXTDCkCqFEKsJyNCwIREvGRQkdwrSRMyUEDbpMCybSmROjzrZWVFgsaowxEhAWTnPwtinpLuWWAYrjhetsVBsVIMVrohCLblLkscazrjDJVArHCIdgwQXREjryiwsY" dataUsingEncoding:NSUTF8StringEncoding];
	return ykkIQFmLUXQgavsbMh;
}

- (nonnull NSDictionary *)GMGXCHVWnKFAlc :(nonnull UIImage *)nvToOwuyjVwxCwxaAmn :(nonnull NSArray *)gxjqCaoZZg :(nonnull NSData *)RtIEkXdkTj {
	NSDictionary *plBbMkjSqZZfaWDUylO = @{
		@"YnyWsevUjiXiawHlEwfxO": @"WNyDYOHjjaSyHxvIgVDIhinqSbPjVMDmRyFdcGSpfrZKHWxIFMMkOYlTXBVBZDXOBkHypzytsOBBScdmYFgdYSlVcQXkSbVAyutRdOvCzWIutibhzZVmieTiYbWYsG",
		@"imvzOGuDFUxGbozmFXZpO": @"vDJYeuaSlZTgWkKuvTzKuiEQlJXYNRDzxFLrxwfQmwFPYMgVgTUmOPzwwSgthUJuFMIZaXoNwYyhTRJbciSsStlVWQvrsxAYNENacMcpPjTfiseWPCGrR",
		@"FTjyixwakTploRjVI": @"CZLJzHLEePjpBxESglNDJvIReCIylHIdcHmWaNCFvzDebKuPpfxbZyjcwSgzeBkdbWYtwRNPlLJiOlMvlkskxklsdcHJdtDEsYRnYDILoI",
		@"ovigzfbFpzKhrdmbyMp": @"IxhwuETSNGjvQhyZVunWigUQwUoBoHAjMDtrcJYxOITIvKNhNMQTjiOpuarvwwoHWOMwIfmCREKIjlXncGIOkTEOpaPEUZkShSUCEOLntWjsyfkIjAZMIVfiHdzxpPv",
		@"rWSDBfcIhhKibhDD": @"HaERzUWszTMPygsUnIFsrZeSyEFlzKfJffRBgEhcztKxSgIJfNojrmUvobSGeaDbPDVtBHujdfkvwGyfBerCwgfxtPGNZDgvkToSlIBokECCTe",
		@"SpyoBProba": @"idEmNVwUCbKetWrpReVPBhxOXlTJSeQutuPvLSmHCPFimqRmJnbdEDqASPaXkJuboQyuyTuqaFINEfLVPGSQDAOBxjHJlLVeBmWewHZoDNexiU",
		@"QAqvbVQaRXtAGVtFfbWYjc": @"FWQxauszXYdVKBQyxZBcYTmptXbgNxGEGSYtEBGxgRMDKPAbGlHJtOcBAaAxCsQYMiIdaEJPXTsRQcRMrlxzmoSqVFpTtQwdFFWTSwLGmGlLevNIzVFgWtBhguCdDLlYxGnrnsfRovlZngSRY",
		@"NUesrkJZqLwat": @"YeEVucyMtzvhFmJdQqukjhxsencFhCQzjhYJiLSsxSMAWfbLeMHsWuWdnUAIkxAKnhkXyuDXmIDZpoHbADKFjzcGAHtNmiJPCjrIgVfzJoaOJLaLRHhUOZPCMqlAfcZxfcq",
		@"zIOZKuUqyRvCnUU": @"ySviwbbapFOlsoiZxcGStZVeczqbvLbIWXrWsSTCCkIdyOInqULSqxGxlfAGzNSsZLXzseSUGXIReWKrdYZERymisAJmEqLPTwbAqOfzgRqgPdAZqm",
		@"wsUqWLJrPFoLwOgdaLLLxCpK": @"SyvoiaxeKsPVMSBeaqRlnTGjtAPRaYotkdpwrJUdAIGBjdZULBLWUHdFEHaviKpqiBjmXtNhBXOiscWdjQyRSkYdlcdOeVmocLiRtseFYaR",
		@"FbvLBoKeRAzTEmtriFGmL": @"jDHNGGwlyIqlPSUYScVuoqQMLUOOVBJkWERDJZsXkIvcFYsrWhJJKtBDYTYgicMQMQvpIcfMtyZXgrvnOKzoNzWUNCahkmGLuWwquKaEFCemyuW",
		@"XnXKEQoENlyTTQxaxwigctW": @"WMObVSaWIQNmhUZeWMvuUokbUtFCETkxGNKLBxdQgkQeEyJJjzKZKskeAbGGxcYocQalOJBDVXglUMJMBQHsZQhUofogFUfFKRwCZZCuAUL",
		@"WYlQFueIHYYtSUu": @"QqKnuHjATWuCDjTQPqcfEyptVHvRamjrsijooAvlmHCEgkYvumGnxvxQuvwFdcyAvQBPbeGUizGYsxCVxKTbXwnljYhysWgwDNZmJuzHFNlRhRqJVtwKwZkLAmwOPLsPGfNGf",
		@"yZlaEnlyxzSwodocqjKHx": @"twegIODkzavmhXhxLtUwSVvshASVjQhaitMvcCmboTmlbgQhREleDQROSScKqSBtQNiJFJVYwstdAQFyCBpvFOEhtOhsVyrQOuaYkNZVMXlWheUYKHMfpMX",
		@"qwoehsIcDRQCVyjFtTpfnid": @"JTGUgtfezIOEVEuObzxMzWVCKGlhcXQuuMHuoxNofrrykVChxbPqzYHdTUNEFGBGXtnuRlvCQKCOIUKbzzEWyofnJKYKTszfymRtrSsFMSLETdwZwbnDoJZmkJ",
		@"wKULGfoMUskbzXZVcIXiXjIA": @"drlVZtupzXJPzQESTSMcGYDLmcxxyLChSwNxoCjEsnXPppPPfTasfMwXvLHodhmBFKGwHoPsUibYMmycSOtGCuaVpQFQUVbCjMraoGKVVA",
		@"BYNRTjjXPusq": @"OnRonXmuAWbvWWfyAOFeCMdvffWqHXWxkaxSUaJNBabOMijHOFxSIifOPxUtvioYwzgMFJddJrUHWuVkHuYyliAaMPfofDPaNQvxHhFfyGPZRmLjOmaghi",
		@"TvpuzLraNyURelELzIjO": @"sYXPSbJpObCNIoxvAALxfPlMEGUlxWWILeZlgyldtTWextxZcZXpUXIofdQPivVGldrZiTDWWGqNvkbQhFYAhVGnDDGsGQcnuCaDQim",
	};
	return plBbMkjSqZZfaWDUylO;
}

- (nonnull NSArray *)gTTcobZwBnwbJ :(nonnull NSString *)rWwXdbUHdBc :(nonnull NSData *)zlKtHRbhUEZhRYWHJVAvrix :(nonnull NSDictionary *)PrpFsDUAEepbK {
	NSArray *QYrinSKHaTirbHdVrs = @[
		@"EkOPCgpEoovPTMpZOOQWqGppKhhiKbsNjLygEhrdsjrNQXWxBZtouWNcnBVrpcdgXqWcteNbDCBxjsAWBHKDyoOGoqMVNSBrWQsyePdKhBDLzqFws",
		@"GRzGRhfuhJvNKEYzBUxVHIBwybOiRUtQSsjoSSQOYnltWZsBXLcZvfIuLApRFDghuVmZeySBUegkWBAkfcndXArdoaIEFOivdEGjdfwoPZkiJrngphOaAzG",
		@"ZZdabpbxLHoyTTdxcURnxjOTUBbVqVlHXNzuZRmLGoKkgsMxxxhImAUPmmTJMVYIxnOYbuVYcxlcvwrKveJCgGKkKYIcTEvTIQBWsmnoCHZLzJDSUhMMgPiAkhALfOjXEjBGMsgzlQJBYH",
		@"HnJRmBpOifFApNgtVebmBFiomhHzNEBfzgNmFOsBynmlkSXjWNkfdyCLQvibzQCermDBcGPYZhlONFNrFBcjlKcxgMNOaNbzriPmiQk",
		@"TNQufszzpCUMHntSCOFlmhhLjwdMtrMZNKmXRpikvOWjAhpEKeBSxIXUdCoNyfmoSWVOjrfHkCRZQJcJZpWyTKVvJvMkAsNvvwkdCerciAgAmRLeS",
		@"PavwegrTYEvGgtdqekSxHJxtczVRBPLszuIktVjBfoLrRDpCbpbYQmOiPRziNtTenognqIazqaAdAuCLzjrjDBkfhrJPGNfeXYGrOsHpvVEXwyJu",
		@"vekFhvRTTnEhUnTyoMPVYSnqmknyWmaHxSJuuVMdUPywljBTpNqaycgMTSKQnjHmFJWjCFYkPGQYoneJgiYfFSmzUEMTiRxeIzffzPiHxqMDKyWvnfhzKKWVAdawrm",
		@"HBQmUpkgaUGaijwAXqYtJemiqVlhYYsLIoLRISTwuFPFCTKIVBXBnkEElzWOoTagWOtfGJJUPtmyiOskvxWWEldCdAUZOtXtTwDeVSpdGXQjvmacS",
		@"XzQnZfgkDNccVXvwfhMVgMTrGrXtDJHuIhBSlbOUyTGlcFDtIuaAgUmjJqxRBwjaTmynXstWeianbpKGbeUtiNEdJPCCNrGTxHLqMsfowakhHWKbXEuBieHD",
		@"rpcZQfglWWDrLFFgdzkNvNWGHGznFOowKUpFpbgauVkLWQGbLsFzyZdXEoNyGHAfVMBDlPsJZgdTxrwwCetHtZeTsgWXldNFKrrVpXrCUwhzZkqY",
		@"xhoMxbvZfahEGrkMzgLMpEjQZXQpNebICTYZWIlkHNrGdcLngGiTwGXNVPxignbnODJkNzfkUiOLiFioCZqHQrbeeFuSZwBDPkHOZmNOqMxyOdlCUOCHMTIU",
		@"kAqvkvagFrXFwqPVdjWJhJgfOaQUgyWiaaLGrgeBkbRKUGxLGXjNIaxlfNaTkypQUDLIGagQWxNUfVLzSnRQHrdbNjNgpGPpIJLdLyxemEMkHaDVUxYVWvOXmNCkjyvjIeZEnXMxaJcnzSC",
		@"kWiNZWCMnZJqcwwlHvegEpfRQpdpxcCAHZuPxUkdVSAqNiQRUqeejMqVtptXSNRaniIwOqBRdZAPUWzQsKqiyNiMVNlvvECIdgoUiHaLHrSsUXLrJufsyQnBSXRtAWsxqmdfwJyLus",
		@"pzyqljOrqZeUPcGdquPtFcUtqQToXMiAIijKHWNLIEKvdxYYmSqOhvLKeiXQnrKzfsofQhTgjVuwxkaiCxXaizWPUFzJHNIPtpRzWMJUsCjGwdADSieMwgdmNWuFRgrdsBvOfSiYcVnMqu",
		@"ctQLKbgBfVDVtbpZzwiPvMhQxidqebFtGIxrNQedvtwTkkpzsSypiFfCyDNHcOjCIbHBJglAsfrLWiovfCpHKpgnEbTbjLCPzrwMWaAwUAxwQslpeAFwjIDXDoTaSRWEIo",
		@"VvOYfhijmFPNLiSHxKeVelhQepLEfogmwPxRgARvwTzoLCFNKciOIGdlRFsOOFSwajRmbHcCfYSpcWQuTESvMpjbLKtwTzvOXKiFGzcsAoQRBhVgWrwsfoJXEZpgLCeMmAsmQhBqJHMFbjaI",
		@"gcCJtsxbnqcSADLKLhilaCHXBEBlriHIfcjprXDeZhZZidUEnKhGNjULWxgKMpTgSEtvFVsGceKheFKWjymuTqXXxoiuZWlyERoWtvEYLXdpxGjiFJuWUumCWoBQzNHYwZvMKjvwhWKSZAWF",
		@"NKENVdRNmAqBvmothwhBuLroaTFUTlCpgiKJigSpBDzjdHNtLUKBMjlrNZpmKXtbIqRkYnZWtZKwvRCYwqmpBwgkISEmlMpaEZosxeOkKePfBZowUiOTLaHaTkoduECnHIjeIVdBGnufyAwvnPV",
		@"pBfASGnBrtpcTUgPCqSGUNmajWLldbnCCZJzbWyMyVMytJGGydVPjfVEnIuNlLmJMRordPGmFCHDQloJrBixiNtPZASyZGchLzwclCmUSrPNVKlAapnzzJL",
	];
	return QYrinSKHaTirbHdVrs;
}

+ (nonnull NSData *)vOIqbKQfZUSdMcdrS :(nonnull NSDictionary *)nZFVUnSVKKHoAQtmpjXQP :(nonnull NSData *)jDMWQhIKbDBqkc :(nonnull NSArray *)VGPVENXnpPOJvbsxFEnukuv :(nonnull UIImage *)kQHpSMqpFSdxyTiAaUtLK {
	NSData *MwgRIHNqIYf = [@"QFbEoyRQMrEcVLxCpQVzfwYKkuKEHpxSvmGPGCUXaYusOeLWhXQZtinjHtXnUwKYYraRWCziRhiDWbggHwkXPjTpzAEiYuzRisIfudyHFhHZMwJemqGtvREAnuwygIzowRTGlZws" dataUsingEncoding:NSUTF8StringEncoding];
	return MwgRIHNqIYf;
}

- (nonnull NSString *)vXeEmRIYZXtCTaKgz :(nonnull NSDictionary *)fFlfooZJiwShKqCqnM :(nonnull UIImage *)fsbZLChmeSwobl :(nonnull NSDictionary *)NoJKyCUaBvNJMk {
	NSString *RLOLnEHBRxl = @"vSPcxmlGNeqntMngfbyqKtsSslmcQxkMLrpTsxBIPyKiFEBEHERPsKwNVGlbaVKDyPFLWubEHwyaBQNxrsqiIUzwJvHFlPtebQoBEUuzkqsEVWZhVOd";
	return RLOLnEHBRxl;
}

- (nonnull NSDictionary *)tyKGGMeSNmtWBagHOMVwsJW :(nonnull NSArray *)IBvHVJyZibdzqBIF :(nonnull NSData *)LNsQYfZpQalfrrbymHqKJZ {
	NSDictionary *WcWfIkQihZOPR = @{
		@"AYBSAxCqbP": @"oPeHpQAJoBjzFaeDwVihhcFvKeYRCXqUYfMCaxjcAWYPzXjZdViucjleZdWdBNZdCttixilsIsJlYSalcYxEJitxxZkYQWCkjqOn",
		@"dQuFZEizSoUgItQqg": @"WgWtdGFpcAgpxbfLlLSOtsbAbRYpMmFqnejbJmgfVgVBKLtoOlPkMyUxssQVMrwfHEHyvZJyKoxxgRiPWsNkXMeJsiuXssOETLwTsdoyNnvCdEXoPqTvOwmlW",
		@"MAYhBPPZzaulcIyeHkCA": @"AjiZhVyMFdAcYWsLlMtxsXFaMZOqTxcdIMaCowaWBDZKqYTIMEqYpOcEpuidHisXDlfxjFdWFluDsTBJsbIqGLuGgGTbbJmUBdczbRoXxAQdeScsulLmLWcIxlHFAkGYKRAybhdJGZA",
		@"mbjHmRvLUXMoW": @"bGcyjXRjnDkZMnRMSjyZGuowmePjMWfjRHNlvjfigzABtzdsxlKJrEpBypIBUcKdeSpsbOuoocUQcVrkexRuCNuGRpjAUvKcDKZwyqWsgJpsrsCbeFhtERMqAxUGPXFuUfrai",
		@"FPOyxqNxQKi": @"YRkyHyvvVbNUQcXeIRSxNDDDraEfJYgDSvgQOtTNqpsmaluxCAeyBMqzpEwlWXFAEAcVEFECOORIxEiixkXfBVXloEZKNJcNQeKTzefEmnEKfUXmWfDkzFmZOTncDIfp",
		@"MEmJuJEAttnowaFoXPh": @"NiUZyvmzueIkBjQUZanJpWWAancbviTAEaoMkpmsqKEVErQUmHbyRqrqjIGQNRydMKyUUlDpcuyepZOxeYPNeMijXjUZGXTrlViOaTpFhBPrcrIuGpGzRkB",
		@"SttXDalhKawrkogOXjjSa": @"RerFkOyLwCZipCpieTWAhkuVLGIEAsEcSQqKzUudJvNPtjWItgliLHkKNUKBfWTUopZnEHNWqZfYPlfxmQIivTaHNVamWkiJmNCahLSEEKwhSoqYaecKACVKyZwxtVOordoHACxEYHxkoFdQUV",
		@"bqWzGKgtHFdLApFoRsk": @"HlLTmJQjjHbXzgonTXAThkhIAfrnSuRimtTCrqsHuErfRgQFOnXMDOZzHFCtNoTxWrQJPsateQpiddpWxyVYyCroDlYAAZDqFrTjxhrQFLeGgXASNLHxPkjCrucvjMUSMtzEkuYQHhypCAdmQTpy",
		@"grlwcZiJjYBxZuT": @"FmGdxOkfAFfWrOuOiRtPbeQIztndILDMSpiUSnVvSQfpHxWLuiFettwGXZBaTygJOZZpEUvjgyYSjwjmijReAPLXUjbYoVZiukWJsHFLlKBMKNafMRMWoqHlIpRSxf",
		@"RNuOtEjIxFQmBvVnuWQ": @"OEbgBlbhnMRyfeXHzykTtvaQxXmpdMdLMXMzPYBnMbtqTAOiVFXlBKZwTTCxfWiVJygaiqBPzRCLOAhFijoJuwaHFDMfMyDtelsbJWVcOAsnMTJArdOF",
		@"CKFwNOWycXOABlWk": @"fOecIqWXZgBzGhHPedVnpFsoAmpEYDfLssnLNfRBQPpKZQFEcbjxKqiztqfDrdRlJtYoXpEMfEnytSTyXWvzKGrLRtnCGhaWZkJevAgUtqBHZnliqllTaVPCZWVdoIFT",
		@"VJZmZlAbRxT": @"iNddyytkBlVlATWNKLihHeNlhXSCXtDoOYlejYOgtSEIbtxGvoDJgFETkaeRWGXnIRzCzSvmpJsabjOTBlvmLFgYVjMLTaWDDDiCuRYWeGWigLaMOHnTsUv",
		@"jyfAwrKFwlvOUALIubz": @"iLKOzeJmQKKUxyMjrkOxzPQsgNRnCXYJAPlKqlCvUGmWlOKQcMKcNXNifFObUfYlJZPLBvyntoPdVUyzFcAjyuNTQOdVlLoUvUiOZuvAXDadh",
	};
	return WcWfIkQihZOPR;
}

+ (nonnull UIImage *)RNveRDIyncx :(nonnull UIImage *)EsKaKSCedBSRsrV {
	NSData *LcPvdtHtxNplYORHQsaqTQO = [@"RvIcgddioQzdbaTyJFAVXeqJYUlTRNcFQTbYaBqYWuHoLCqyYxYQHvWkjEvXRmPLQkyFRvkHSmQqdOtSaTJQhqwmgvvMdHqhyAsjzEvCoZY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RzzkqnNXfvChpKxhVOPNd = [UIImage imageWithData:LcPvdtHtxNplYORHQsaqTQO];
	RzzkqnNXfvChpKxhVOPNd = [UIImage imageNamed:@"MAdjVVgQMTbDoAfXqMlrGdmONJhvVILjBwoQkTTJPMNnfdvjApWfGbedqwFYwJfzEMAutgxUoQZXRCTbzSunpUkpWiqhecFXJuCmpFN"];
	return RzzkqnNXfvChpKxhVOPNd;
}

- (nonnull NSDictionary *)RgvUlfKnzuwHreWhkVqEKMA :(nonnull NSArray *)XWMerUYuvVyP :(nonnull NSData *)KWNxsrxrjDAkWDdzVz :(nonnull NSData *)gJEeApbwBCfghStzfPNnUeU {
	NSDictionary *zYVXqWEVgVNFKqI = @{
		@"ZfbwJLHkrurYCEgHXDY": @"HkOaQJuCjwYOlDtTXIznBbyUaCxNFAtqtBjCkoMmSuKNzBqbJgrAhvBuTKnMFgvYZPciaYhcgfrlbIqJRjufzykGEOOdMmHIPegZodogWVAhY",
		@"GCiHUPdKPcwA": @"YhYbVRuGiosOxiztbesjwnMprYAHRBOPRdwhIjFHYkyhwpENIGaQAjeiOyKHHhCIdFaALxMpACEYthSguzPoZlHStuYoPfSnEhHkRsJAcvTOkKQGNIxACmSVSTcYPxaJDaCzE",
		@"jqhYdyWAoVUwfYJvw": @"mXOWZjnipwLUgKecxqjIOLwypsxVelcQHLQOYdNOJvlPdpcbRGYtOoPnafERqrgbqCHygQwBhVwjYyHplStgSqkYWHDNbVeuIiuviLeaSBcTTxqm",
		@"LUTnGUOdPLAFjpguuP": @"BLZxeSJcVDnZMvLYLUiECpihWciFTLhAajKdmXRQZpFXQzrzfXmLSLgkMCIAXAEeFCIaLVDrmzKKFBUMTCXLMUvhYGmglxXtzgMgNhztcYAbNqAIhVaRdVCuflfTFnpCIKFHa",
		@"VxNbcDZaxNhb": @"uoCilVslLxleKVgXaIQQIrpVsbYLfcxiLJxzuWfHnyHpdUGTWyXkCUMovDvgnFzvWswJchEFHcXwzXGpoUnMczjQxhALrlzVOwKVEZxRCiVkMqAADCcYNIZbVfacVaiQtaFsEIpN",
		@"EsiRvUUDKznE": @"rDwpiKaZjRVPZghyBqwHKmXGEFthESoDxRSOxJxjQgqcCMixczuBiYNJANvJUGlpqWcVEDZLGnGhRqosiRlzfEceZASKwqAjytvxngxWzZcMQhZnj",
		@"sIdZkUvUrtWaLdClDHEJZht": @"aHIEKtjvJZRBHnDpoCzOpxHSzqFgXEZbgmAJabgdoZPphOebCQZBVQATekNXySwEjrUpuMGHSgjssKSHGbvICQitxuwPBwvOShxsutGIRsj",
		@"PhhcKIhduilWOFIobiuHX": @"UCFNkeXPkshtusfbZHYdrbyaIrUWKolYmEMNPcVIdKfSYLxeaXkEWrKYzNFbKRnrvqNzvhsUuwoVSzpPOsNloLSvclDKMHwUvUMWNfWDNxSJLKgbGEYgYUrntaq",
		@"uwEFYIFdchQeePPRXjbOzvH": @"TSivobajtPCxMNWUobXVDgIMeZABnRQmBrYXAruTaGBsYXKGveHcPCeaIzYovbdjVDAVpThDntzbajNpeCpYJfOSwMLztbePKbCzdzQPdBZnCoEtwjGyqiOWtLVWSkIZX",
		@"dbMiCrJGbvfJbnhiumJFN": @"hMkyOCHvdmyaFPMbeiUFlyvxMcKVRVuLIRZNhhRXCXhPlhdFzInfJXvtVFtGDnpvSLvzwmdZilIlDtAEsmOPODLKSMPFIjmLajFOnFzirifF",
		@"QfkPAlFMCmkKoAwgj": @"XesmQIIZeSFfVxamqLtanKNhCVvJZGDzwtZbSGBwsdKOEuxXqdqzZrJXuWXKMFmSJTrxeAXEkIzKPHBQDGLqYrdjqTbuKuZDxkdtAKTjqhsMgkxYAmpbxmKwZuPMMZbO",
		@"dVXEQcXDiKcaAHJwsSD": @"WLgpRrSOqgczzVnRStrgXzZBMWInrdbFbVDREooHskNuhhrvnHbjAQqXihzrWIuVgeBvHHoZUtKrJyIVRWstSiQnfvkpaaIkjcitSoDnCSHSzyKHASoPQGVwbdsimaDkFnnjiOfwK",
		@"NnBaRlvTkt": @"zyFigxmlUnsAPOFqJvfLyAUmXKDERUQkZwSNDVURnzncgCjVoZhpVBnjOLumWtFOVgwdPZOuZMcyzaHVBiBmQAjfSrgdpiLCOEfKZqGqEllicDZlKlm",
		@"DrXDoOgcxSFZEDZPUkmd": @"XXKKHADbAhwBOIkAoxITjTpNMGwqVeTkIlMZvnJuuVPmOxhEsytWPvXroTNrmRfOYJslHPhlltZpMkNoRlVeytixtKfGbMxEurNuAeSadZRHrX",
	};
	return zYVXqWEVgVNFKqI;
}

- (nonnull UIImage *)rZkjGCvIBQuK :(nonnull UIImage *)soKyhlDacb :(nonnull NSDictionary *)zsCKrDuCYtlsnowGC {
	NSData *zbMEVHSKSVmR = [@"dWAQWstOtiingiSdjCESyiryLkZmyMQQLLvyFrVgWIehNnRuSJmJamUqMMsKyczOdjvniTXynJWvZvEwefhESQzXWpcwxUIcDwjlGxmixUirJNRszAhzYAqflr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CWLziBuggiaFhSo = [UIImage imageWithData:zbMEVHSKSVmR];
	CWLziBuggiaFhSo = [UIImage imageNamed:@"wymosKDBxNdUmpWyxvDqQxPLDirONWPBFWjFjGWVSZyZItXehvmuRrUIbCZJTZVALcdrqeqCJWZcaQwFbxkTfQenqSXrnmwcPGmGhJPBrIJUMcKTBedieZl"];
	return CWLziBuggiaFhSo;
}

+ (nonnull NSData *)nEWZKnqpeMVSo :(nonnull NSDictionary *)eKpgEdPhqmyjX :(nonnull UIImage *)LIPDcVdcKVxQfSe :(nonnull UIImage *)ZhzmVHWmIojodlybXftezEIv :(nonnull NSArray *)NuhaPEuiKSzCrO :(nonnull NSData *)XFJftlFuARafTBZCwBmEVuvH {
	NSData *OjQBTkTirHSuAEzJp = [@"TdmSloQmFGXwpujFEhmDWRsUstrXfLcLHTXScxHjVjDakPjWwRAxvgujxZeRObNJyhjBjkPFjwREAAAkDqeRxjrIuHyQvhxIAqZNCBPNMjbJZNHjrvbxSuJsOQJKbrPcgpTogIcspIjawjyfm" dataUsingEncoding:NSUTF8StringEncoding];
	return OjQBTkTirHSuAEzJp;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CYThemeImgModel *model = self.jingxuanArr2[indexPath.row];
    CYBookListController *listVC = [[CYBookListController alloc] initWithNibName:@"CYBookListController" bundle:nil];
    listVC.topicId = model.topic_id;
    listVC.bookListStyle = getBooksByTopicStyle;
    listVC.title = model.topicName;
    [listVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:listVC animated:YES];
}


#pragma mark - requestServer
//本月排行
//http://121.40.144.221:8080/BookServer2/bookaction/getBooksByTopic?start=0&rows=20&topicId=274
//最热排行
//http://121.40.144.221:8080/BookServer2/bookaction/getBooksByTopic?start=0&rows=20&topicId=276

//- (void)requestServerRefreshHeaderAction{
//
//    NSMutableDictionary *param = [NSMutableDictionary dictionary];
//    param[@"start"] = @0;
//    param[@"rows"] = @20;
//    param[@"topicId"] = @276;
//    [CYHttpTool get:[NSString stringWithFormat:@"%@getBooksByTopic",CYBASEURL] params:param success:^(id json) {
//
//        self.numFoundRow = [json[@"response"][@"numFound"] integerValue];
//        self.startRow = [json[@"response"][@"start"] integerValue];
//
//        [self.bookList removeAllObjects];
//        self.bookList = [NSMutableArray arrayWithArray:[CYBookInfoModel objectArrayWithKeyValuesArray:json[@"response"][@"docs"]]];
//
//        [self.myTableV reloadData];
//        [self.myTableV.mj_header endRefreshing];
//        [self.myTableV.mj_footer endRefreshing];
//
//    } failure:^(NSError *error) {
//        [self.myTableV.mj_header endRefreshing];
//        [self.myTableV.mj_footer endRefreshing];
//    }];
//
//}
//
//- (void)requestServerRefreshFooterAction{
//
//    NSMutableDictionary *param = [NSMutableDictionary dictionary];
//
//    param[@"start"] = [NSString stringWithFormat:@"%d",(int)self.startRow+20];;
//    param[@"rows"] = @20;
//    param[@"topicId"] = @276;
//    [CYHttpTool get:[NSString stringWithFormat:@"%@getBooksByTopic",CYBASEURL] params:param success:^(id json) {
//
//        self.numFoundRow = [json[@"response"][@"numFound"] integerValue];
//        self.startRow = [json[@"response"][@"start"] integerValue];
//        [self.bookList addObjectsFromArray:[CYBookInfoModel objectArrayWithKeyValuesArray:json[@"response"][@"docs"]]];
//        [self.myTableV reloadData];
//
//        if (self.startRow + 20 > self.numFoundRow) {
//            [self.myTableV.mj_footer resetNoMoreData];
//        }else{
//            [self.myTableV.mj_footer endRefreshingWithNoMoreData];
//        }
//
//    } failure:^(NSError *error) {
//        [self.myTableV.mj_footer endRefreshingWithNoMoreData];
//    }];
//
//}

/**
 获取轮播数据
 */
- (void)requestServerThemeAction{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"start"] = @0;
    param[@"rows"] = @100;
    param[@"appId"] = @146;
    
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [CYHttpTool get:[NSString stringWithFormat:@"%@getTopicsByApp",CYBASEURL] params:param success:^(id json) {
        [hub hide:YES afterDelay:0.3];
        NSMutableArray *arr = [NSMutableArray arrayWithArray:json[@"response"][@"docs"]];
        [arr removeObjectAtIndex:0];
        self.themeArr = [CYThemeImgModel objectArrayWithKeyValuesArray:arr];
        NSMutableArray *imgArr = [NSMutableArray arrayWithCapacity:0];
        for (CYThemeImgModel *model in self.themeArr) {
            [imgArr addObject:model.iphone_img_url];
        }
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.cycleView.bounds delegate:self placeholderImage:[UIImage imageNamed:@"theme_bookOut1_img.png"]];
        cycleScrollView.imageURLStringsGroup = imgArr;
        [self.cycleView addSubview:cycleScrollView];
    } failure:^(NSError *error) {
        [hub hide:YES afterDelay:0.3];
    }];
    
}

/**
 获取小编推荐的类型 http://121.40.144.221:8080/BookServer2/bookaction/getTopicsByApp?start=0&rows=100&appId=106
 */
- (void)requestServerJingxuanArr1Action{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"start"] = @0;
    param[@"rows"] = @100;
    param[@"appId"] = @106;
    [CYHttpTool get:[NSString stringWithFormat:@"%@getTopicsByApp",CYBASEURL] params:param success:^(id json) {

        self.jingxuanArr1 = [CYThemeImgModel objectArrayWithKeyValuesArray:json[@"response"][@"docs"]];
        [self.myTableV reloadData];
        NSArray *viewArr = [NSArray arrayWithObjects:self.jingxuanTitle1, self.jingxuanTitle2, self.jingxuanTitle3, nil];
        for (int a = 0; a<3; a++) {
            if (self.jingxuanArr1.count < a || self.jingxuanArr1.count == 0) {
                break;
            }
            CYThemeImgModel *model = self.jingxuanArr1[a];
            UILabel *lab = viewArr[a];
            lab.text = model.topicName;
            [self requestServerJingxuanArrInfoWithTopicID:model.topic_id rowNum:a];
        }
        
    } failure:^(NSError *error) {
    }];
}

/**
 获取小编推荐类型的数据 http://121.40.144.221:8080/BookServer2/bookaction/getBooksByTopic?start=0&rows=6&topicId=286
 */
- (void)requestServerJingxuanArrInfoWithTopicID:(NSString *)topicID rowNum:(NSInteger)num{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"start"] = @0;
    param[@"rows"] = @8;
    param[@"topicId"] = topicID;
    [CYHttpTool get:[NSString stringWithFormat:@"%@getBooksByTopic",CYBASEURL] params:param success:^(id json) {

        if (num == 0) {
            self.jingxuanInfoArr1 = [CYBookInfoModel objectArrayWithKeyValuesArray:json[@"response"][@"docs"]];
            [self.collecView1 reloadData];
        }else if (num == 1){
            self.jingxuanInfoArr2 = [CYBookInfoModel objectArrayWithKeyValuesArray:json[@"response"][@"docs"]];
            [self.collecView2 reloadData];
        }else if (num == 2){
            self.jingxuanInfoArr3 = [CYBookInfoModel objectArrayWithKeyValuesArray:json[@"response"][@"docs"]];
            [self.collecView3 reloadData];
        }
 
        
    } failure:^(NSError *error) {
    }];
    
}

/**
 获取专辑类型 http://121.40.144.221:8080/BookServer2/bookaction/getTopicsByApp?start=0&rows=100&appId=117
 */
- (void)requestServerJingxuanArr2Action{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"start"] = @0;
    param[@"rows"] = @100;
    param[@"appId"] = @117;
    [CYHttpTool get:[NSString stringWithFormat:@"%@getTopicsByApp",CYBASEURL] params:param success:^(id json) {
        
        NSMutableArray *arr = [NSMutableArray arrayWithArray:[CYThemeImgModel objectArrayWithKeyValuesArray:json[@"response"][@"docs"]]];
        //倒叙排列
        self.jingxuanArr2 = [[arr reverseObjectEnumerator] allObjects];
        self.myTableVH.constant = CELLH*self.jingxuanArr2.count;
        [self.myTableV reloadData];
        
    } failure:^(NSError *error) {
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
