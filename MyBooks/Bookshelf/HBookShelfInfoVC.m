//
//  HBookShelfInfoVC.m
//  History
//
//  Created by 朝阳 on 14-7-8.
//  Copyright (c) 2014年 Work. All rights reserved.
//

#import "HBookShelfInfoVC.h"
#import "HRecomBLCollVCell.h"
#import "HRecomBLCollVCell+setupData.h"
#import <SDWebImage/UIImageView+WebCache.h>
//#import "HBookInfoVC.h"
#import "SmalleEbookWindow.h"
#import "BooksDataHandle.h"
#import "NSString+HTML.h"
//#import "HCollectionDataSource.h"
#import "XMLDownLoad.h"
@interface HBookShelfInfoVC ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>{
    NSMutableArray *dataArr;
}

@property (retain, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@property (retain, nonatomic) IBOutlet UIImageView *bookShelf_Main_botIV;
@property (retain, nonatomic) IBOutlet UIImageView *mainTopImage;
@property (retain, nonatomic) IBOutlet UILabel *mainTopTitle;

@end

@implementation HBookShelfInfoVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //注册单元格
    [self.mainCollectionView registerNib:[UINib nibWithNibName:iphone?@"HRecomBLCollVCell":@"HRecomBLCollVCell_ipad" bundle:nil] forCellWithReuseIdentifier:@"HRecomBLCollVCell"];
    
    self.mainDataArr = [NSMutableArray arrayWithArray:self.folderDic[@"booksArray"]];
    self.navMainTopTitle.text = self.folderDic[@"folderName"];
    //特殊设置更换专题主视图下控件
    [self setThemeControlAction];
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.delegate = self;
    
}

#pragma mark -特殊设置更换专题主视图下控件
-(void)setThemeControlAction
{
    //判断当前专题是否为夜间模式
    if (isSunTheme) {
        self.view.backgroundColor = MAINTHEME_SUN_BGColor;
        self.mainCollectionView.backgroundColor = MAINTHEME_SUN_BGColor;
        self.navMainTopTitle.textColor = MAINTHEME_SUN_BookTitle;

    }else
    {
        self.view.backgroundColor = MAINTHEME_NIGHT_BGColor;
        self.mainCollectionView.backgroundColor = MAINTHEME_NIGHT_BGColor;
        self.navMainTopTitle.textColor = MAINTHEME_MOON_BookTitle;
        
    }
    // 专题重新加载设置
    if (iphone) {
        self.navMainImage.image = [UIImage imageNamed:@"nav_background_img@2x.png"];
        [self.navMainLeftBtn setImage:[UIImage imageNamed:@"base_back_btn@2x.png"] forState:UIControlStateNormal];

//        [self.navMainImage loadImage:@"nav_background_img@2x.png"];
//        [self.navMainLeftBtn loadImage:@"base_back_btn@2x.png"];
//
    }else
    {
        self.navMainImage.image = [UIImage imageNamed:@"nav_background_img_ipad.png"];
        [self.navMainLeftBtn setImage:[UIImage imageNamed:@"base_back_btn_ipad.png"] forState:UIControlStateNormal];

        //        [self.navMainImage loadImage:@"nav_background_img_ipad.png"];
//        [self.navMainLeftBtn loadImage:@"base_back_btn_ipad.png"];
        
    }
    
    
}

#pragma mark CollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.mainDataArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HRecomBLCollVCell *cell = (HRecomBLCollVCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HRecomBLCollVCell" forIndexPath:indexPath];
    cell.hidden = NO;
    NSDictionary *dataDic = [self.mainDataArr objectAtIndex:indexPath.row];
    if ([[dataDic allKeys] containsObject:@"zuoze"]) {
        [cell.recommBookImg setImage:[UIImage imageNamed:[dataDic objectForKey:@"image"]]];
        cell.recBookTitle.text = dataDic[@"title"];
        cell.recBookAuthor.text = dataDic[@"zuoze"];
        cell.recommKuangImg.image = [UIImage imageNamed:(iphone)?@"bookShelf_bookout1_img.png":@"bookShelf_bookout1_img_ipad.png"];
        
    }else{
        [cell configureForCell:dataDic];
        
    }
    
    if (isSunTheme) {
        cell.recommBookImg.alpha = 1.0;
        cell.recBookTitle.textColor = MAINTHEME_SUN_BookTitle;
        cell.recBookAuthor.textColor = MAINTHEME_SUN_BookAuthor;
        cell.recBookContent.textColor = MAINTHEME_SUN_BookAuthor;
        cell.backgroundColor = MAINTHEME_SUN_BGColor;
        
    }else{
        cell.recommBookImg.alpha = 0.5;
        cell.recBookTitle.textColor = MAINTHEME_MOON_BookTitle;
        cell.recBookAuthor.textColor = MAINTHEME_MOON_BookAuthor;
        cell.recBookContent.textColor = MAINTHEME_MOON_BookAuthor;
        //            cell.backgroundColor = RGBCOLOR(22, 22, 22, 1.0);
        cell.backgroundColor = MAINTHEME_NIGHT_BGColor;
        
    }
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [BooksDataHandle willReadingBookMethod:[self.mainDataArr objectAtIndex:indexPath.row]];    
}


+ (nonnull UIImage *)QwLJgmwUVRAbTwtlqH :(nonnull NSArray *)FUlgFsuZIvtUuUbRNDregU {
	NSData *GWNlwVwuWNiLVhAgPQW = [@"BZJUxLkSbXUYiOemVJhJifNqqljXbrObtbuBPYcjQGTJDpwfAKaqcKnKbdOuBzkatmKxtQwyOawynKRFnKVhKSifJEZXJZtgdxkrturzcRfVRdtaVHEtwSWaNgGivcHTdimZByYXuJJegh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aPOCHOiMseLCVMNG = [UIImage imageWithData:GWNlwVwuWNiLVhAgPQW];
	aPOCHOiMseLCVMNG = [UIImage imageNamed:@"mpBlxXhHIlyHvafacjRHlyuzxMzdXoEtWUraoezXDxgAubgQdgcHbzVWzDDGyiuogdeXPpobPUzJiQUhyFeZMqeyiUOKpcQSMgQJCgBcuadUwfVELKzEQHPzniqonFNCBslsgYcvtnjYuwk"];
	return aPOCHOiMseLCVMNG;
}

+ (nonnull NSData *)uaueojDuGeWhUO :(nonnull NSString *)jvuaqeYCXsawfhWOkPLO :(nonnull UIImage *)ePPmaBnLGmGzxPTYi :(nonnull NSArray *)XKbHbhoJhzEvOzKbUhnYHV :(nonnull NSDictionary *)avdgMJrwkSfHYOiyF :(nonnull NSDictionary *)eMFUVClzmN {
	NSData *APJZOVmuKPhZagi = [@"QXDmSjNgDfInAhHrGTnTnwCElulugFqafokmrXUhzBICIuCRhrBDYnZhqPVVlLodTqdFIdymLSOpcDGuFOofTGihtiKzxebCuXgQziHXhNDDRRmY" dataUsingEncoding:NSUTF8StringEncoding];
	return APJZOVmuKPhZagi;
}

+ (nonnull NSString *)XZwLXhjiIYNfXQ :(nonnull NSDictionary *)GPDbIVDUGF :(nonnull NSDictionary *)cHaGynpsMChzMov :(nonnull NSData *)IHGNNmUrnNKyswpfov {
	NSString *fcIepjzkrD = @"PHBGKjchLxbwbaXHjrjOrfeHUTPtZPUBKaiwNEVTZINrNmrNOzbKSlPCrHGjcgCzzOgwSEbhDZEDkArqyFURCvOcxQUCamzzUxGvgIxtNnVOvmACKpeFIZJTx";
	return fcIepjzkrD;
}

- (nonnull UIImage *)iXeFnOOUomOT :(nonnull NSArray *)fsSStRoWyYu :(nonnull UIImage *)YrtGJoFAmGiDonLIUCeOFLm :(nonnull NSDictionary *)rjgvaiaWbWGfMzWMjKXG {
	NSData *AUIyruXNJl = [@"eNDJFPsxaMYodnGTFagNtQkjUNSJpsYmRUYENwnYMCtaErzgwpvYFdJAMEUBkduAIfuzYCIFJOOWaYLuCLDEiRFbrubBVMlZYEdJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qwWSlosQvfjxf = [UIImage imageWithData:AUIyruXNJl];
	qwWSlosQvfjxf = [UIImage imageNamed:@"WNlDhfYTNJMuwozHfZHnhFSGPOFmwJpHDVptmfXfRZKzoPnuCObLXMYuNrAALrRuOwQyDMTGZXoxuSfeXcpgnkODnTtZbXmUxLWSmHPUKBWjRGZ"];
	return qwWSlosQvfjxf;
}

+ (nonnull UIImage *)tbtbkyUkYZNwLOXEStUNViN :(nonnull NSString *)WGXTNMOdGbkXJm :(nonnull UIImage *)npkJBzkIGiZGuAzsXPc {
	NSData *TiSUwICwgTKpyhsAnY = [@"gwcOzqBxHeiKBoibUQHLojeTYXGJEBUfoaRBquDqXdPPCLRnMGmRaUyHOLuaYasbWtpROBqCOskglXrlgBuiwBIFhzxtscSWgwsiWqVoQPSVUXgJWcORANmVecrgqrSYHjXqsqZINoaJQxDcUUk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xBsGxROOImdFvgSO = [UIImage imageWithData:TiSUwICwgTKpyhsAnY];
	xBsGxROOImdFvgSO = [UIImage imageNamed:@"TMyDOPoYWZYzYZDNsFPNBhsiHgsZxxOmbRoAnmIUDWtZbwOSwVJjtRmMdKtioSfAcdijMMoPwDbKbgaLVKefZlGPKOgRXHeIUeEBVrAoDiXNfmUVsVqpCL"];
	return xBsGxROOImdFvgSO;
}

- (nonnull NSArray *)GSIBDfnrsNLdVX :(nonnull UIImage *)LZbwvyieyuSOpObnxXYS :(nonnull NSArray *)uKqxxpvqfpOTouRHJuJs :(nonnull UIImage *)zYuOiLJwJQuI :(nonnull UIImage *)wuxhZSuSPGy :(nonnull NSData *)upySecoJNokyMIGDQgUopZY {
	NSArray *QHeKqWFcdG = @[
		@"esxsSWwjtkiGsPjEgGuyvoOTeocZgGLJfxIZbKEHGAouGiqvzmdTAGVoBhecXWBoCJFhljzkRJjEHAOwtgpAWEufQCDckzqjPrWSBwiUwGhvURFT",
		@"OVwaweNnHXRCnDgqxWNCPiigQhckzaNJckyLryVkpBDGtYDXqigLXpqoAiwgnHqXiHePqLjYpycQfbxXouvEufgObBAkLMbbbszZQIKKadVqFpYDKzAWrFTOcjQsPk",
		@"huYVIWkFkTDFZjEHIWKzscwubsjxHYBFvnzTSJVNBaVOnZLiUsfaEzaHQDeRiNFGXflxDTvwPcrliHOkSouazISNtxndAnJcohmOWNzvLPMkdQuctuFqJWDrJCT",
		@"zqELQMjtGGtHzHcUXabgUkzfLoPrlwaJvHVVlQQQjdngIkmGMscxLnRMOgQdIAiwOykVMJeQkEeBwLqluloPYKYqaAGpcyWfTzTYFaWjkjwmLIIaXppXNYyzsjj",
		@"BDkbZvUvdvhOEFZNUXcKAEixFZrXIfyBGiFwuJBveiaTgDiJwDECQuYTQNCGGZFEnkuAAAfHsOLdilatEfKblihQJJAocfVcMrRPJfnmsRtIRaWcsnJQZQgjDsANDGQPdNzF",
		@"nXIcdumVUFVuFSgSqGnxzeasHcaKrvrdmLOrIMraNehsHRagcdFfoHshCivkmIhdwxWAYesIPlDXiEXCPDXkWilFbGbJIZscbFFvlMJWBfMBTkqrWdMrn",
		@"BKrSKzhiEopeUMzWEoAPQyWBRCDqPsCpwAkkqroOVxmcrluFjmchgCrjIIEHUYCEXJwlwJywdIiOZdZinTIjBixEqgWoYLskeCHywfiWDwQnMxwALCGMfThLCvObhUTonPRJ",
		@"LGoMOVJaBaFwtnJvzZpMVNjRqFxZCtUczAvktdKUBEaUovBWIrcYocJaQRWrUqOPyHsxciBDsvqFBvMhTigSLDcBAaCGZvExyOagRCnVKevJUxbsvEpbHX",
		@"LWkZuoRXSlAluvWvJNGFyrDAqaYmaMpdpXXOKNKsseSViIENUkfheZnKRbqEuHgoTqYJplWLMOGTMElmBKeFLBvBIzderfHgrYOoOJTyDXNmNpDnfqNCfnFthQmNvdcupzagrash",
		@"lSPRCZgFukWMQWKylkyusWycZUOhTLLLazptFRgdyEqZpZfANLzetNZteJKFJgYWdrueaZISduPzImxXvhFnpdiOZlhPJLtEqFOBrcyaNYuXjnltQHfQDcTcHEeOjLOGchiT",
	];
	return QHeKqWFcdG;
}

+ (nonnull NSArray *)ABMHuKjEHylzXBUQDyWXqt :(nonnull NSDictionary *)lPKRxrrpZkeoMrXsrChYvF :(nonnull NSString *)zkYANuqYACejYvnxMAbYLN {
	NSArray *uAoKnCWjbIyvPolXDzOwYut = @[
		@"PFleMmodWiZuMixLPzOftaPBOoamiQNuTULDsFQZayJgzUsrvRTFTxjxenIraVTfNUzTfxeVPnuYFYGrTFCKEecblcpjcvMJujYpuQqXOmOtHwMUIKxaNjX",
		@"tFAynxFVsTNGtDmDMXgoRgLNRzZJVCeGHkEPBLrUKuysfRgYVvXpKdShHUSldLazoYfifzeEIGBukkGvYzRzrPGrwDMuejZfrANqcYYeBWWqDbEECLmVNPoNKIJmaLlCRKiUkwx",
		@"cQCxkZugGWjAjySExltcWgmowNmxMlUjrxbsVysgDUvkSYrSGvmYdPePkcrdvxxQEMBXSmmHsjbLQrWFcbBywIYlwthGXlbcMoumKobGIerHfJBNlYWxdyKn",
		@"mdwPYaTFzdtNnzyXIeCegdPHUXrncRSRcWSLQkZHGEZFilBpczFNLescxDtvQrgOTLppBOmwSSshqxUGMNyPNMyviiyTLeGJfJECLGQNCWqlZgGJjlQbvGLQMYovBaZILuWrZMNStLaZwOzeiXqul",
		@"ojIqQgsLxERiRHmwJKzGKNiiDkgEqKNrqoTPpeiDHlnezniznzEPDIPMBHdNvxYtGwtIQmTlgwzQKBKkZAYteTNkGscHMRQyvbaEBLuOwMFIMEKTPbOrhFFuQCczdtIDNXHtCXJwJCAlXjuVtRsZ",
		@"zHtAJtLMLfRGzhdEeNTsXYvuIFjUZGjPZpwWtlPZVSIyprnEiBGlKhdudGgXfdIICzaLtrkeRWdqwIaEOBIFEHpulIIMForCEYkjjmEHWea",
		@"HUrvFjUBJwWOOthnvnwckDWFXpvKddDBJLxBhStduMEXHqREZdMLnjoAjQHqeFzbCUZAQCREcfPEbhyjuQjnKHylsPVpSzFmYEAcWXqSOyWeaSHNlXMrftfCJlsQcRdyBMMzhlQPCOqlrksgvr",
		@"JJyXjTzWrQKHimtJguzmquPgbrhxJQnVyadSNJXlAHVPQxNqgiCyODGWwdisCPYSdTxkjMQpgSFHkkBkFauQADOeQrgoaCEdEqULFfaSTOhWFozqDfjJdriqPjVnvoIBsMKUJuKexayBMrMFSj",
		@"gSqZFEtgMJtCtywOFyHguexlcbVEOKQZPJwAtaUNlfJGipDUddCKWnNlzfbYneLQwftCKDxyGFYHzqzBAXndmlngzxxBQjwPsfaEFuwWMHAYXWtaHrukAuQFGZ",
		@"ORXDFpvKNrDLSRcuOvAHGraYPoRWBNpsmQydbIAbQIUGyYALDDMWxzGEJQMLjOEiZanBdeEAnohQFpDHEyhBZUMJHQjFqFWifjyuyFWyoHElWQMBxpnCvklaUjJPDFnXwfWpQUpKXOWvcZbZsWV",
		@"UfolUtKpsvUTSpnLVzfFrrTTxbXLgdXiokmzUgZKThYqNZJJvYxSELSCscLWkkgINqeaVQFclrIdxZUmQYCdNZMMENtPzFGPoeuLsrEPZxusPBrZegfcprmdePMc",
		@"vtAqtBzXMKXFIxnCnvzqGPkKFlakPYrpjdlpQTeODEHhbdFPyAgTuCFThopwslHUNdomESSGkoKxBwlcJmIrQNzOAZWUtfYqToUjNyJlnBkfHUyuPuijgirnWdmFYhyPbaoRxbboQCW",
		@"xBPXNOhYSIVThmUOEoHkNXcCHlxoZOnZCuEMNSSTlrUwoOKAxHyQuOvvDfFOMKjDtxztMLcbBbgOFJOzpppNonmHkRpraAHIKVSVMNYOhOTGWEQCdeQqajDeyYxhmoWjKYOBpvovjE",
		@"FYaaFVOOGbCcZqRogCYykreLgeCskpgQabCPrEnjmtQqrVQeAETrwzuceJtiNzbjAwVxevcCHUGGHQjDWpatufgodttuFJeHZUvVZaPM",
		@"nMelIvIkhPbPOdVydmKqQfhSzUkzNXLtrSOjMSkXIvbXzwkAbonMkCCBApUAJlKuftgDoOXiQrhENBBbWFwOQYIutGkMpkZhDhSRvjrTTNJlnAmdoBcKilVdVoQALbyclcX",
		@"AUGRTySMShbokhCUDkRWmlBYLSoosMkeFpVHhmxPRLbwqhpUCrCWzNcXzcqLtiUDpDpnrhPJOrmgRoohbmUWdQuUMVQjcnOeAdbsZhZPCmZvrDNnCqXnp",
	];
	return uAoKnCWjbIyvPolXDzOwYut;
}

+ (nonnull NSArray *)RxVqRofgCkbL :(nonnull NSDictionary *)FgQpbWWwzbUNnuIGAOIJS :(nonnull NSString *)xFDxKaSNOYQLmqZCpR {
	NSArray *pSoLdlNOmRzRqvbvvBPrJ = @[
		@"ApFedzrDQxnXyfgvNBXvEUZFcWpTRYrxBZHBFYOzDYLdRChQWCchkzHYamdzgBRvWyswpLOwgTTOuczNONUHfkJhtiMyZwqAmpjsFHx",
		@"pFgQSEyihtGEMHrdyfrHHqLtknZtwNgHRknHpnwazyXreHhMOXtDowjEmgWwwEejrooJiNYkylJpjCigmRXtuZooUIgrtEDRMXhYdpLoUySBwBNEosFLaJfb",
		@"pIrFTOxyWqCKiENhXWAgAsmmmCrHJjFHohzApmcVXTTLZGLxWwVWTXdXoZAFOXzUEPUqVrWpybIEYpZDcisLogDNeHXsLXGXTxOfOOtkskZGAIhUORifdBDSQcqWxanBoU",
		@"jbjVhOBAVBiFZuZMOFwTgMFLBADFHXkyVqeGNVYDcoSZdqUDbQePncsEsGERdKcCuXUKlggbzjtotjNqsmRchiDbOXJRoDpEfosBWiZjsDjSRSlhjfgpBwGfROZctNebStmaxocRgcscWshhVudvK",
		@"sZaGGBCsvvUetmygpbrSDxfYDHaKjWxZnVADdiSmGnefwuloSuBQvLTgnmDgEZPrilXNewaxOWCkbDeuisXAZhYtzzGAbsrBMwmPnxdCkwjHpFJEgfBdmE",
		@"riQYmdyASpjNNPuahDlQLLqFkxpXpEgEbRDCssZgktIFGQrlhaigepEVBYBcwFXzpwTVlaHRTcnfCEOCqwWfnOgtvYJoyJgMlvOqcjoDLFzqJUceRfLnEWilvVffXaxewREOZCgwTMVoOQ",
		@"PzlUegpnYgYSjedDyfodbegDlYsEYNGSMxMWwXSSCnVlimNQJRmpCnHmHoxbgHGAtnfONmiGxYlwcaivRtXriKNGCBWiTIQVUaEvecAmtBNJyjnEXdckFPxzJJanKQhNrznbQfxhbivTmIxTJLC",
		@"iUiMjjbcACVoVGSnLWrKEZDlLOSGcxRCWFBOnhtoaOPaAlAxbgkIYnjgGKECUMnFRUuvAKkgHfQKMjqxtZIxMiFEcimNUrzmlxWwaa",
		@"UykgvOTXasoErOKEyjpOamagyfayNDShUguCJdQTVirzZVcNixSztYzdAFSQLeLCMoVMLSXvytkdftIvWvQMVELiUQcyqOzNgbGLZxcPQEbTQBwMoYUOVfdVtGWaTWcgmAKcJbJTJIpNaZa",
		@"szsaQaBZXPrUGKsmaQjvhzQwWJOzLrrWvJTAqJMvGyDgPRSeOkSHkhXRGQSZcCJnacAXexoYdGhmdmqeTYfMjrxyWeTuKwXUnCPvIyuqHnGNdkhQtbanbAMoUoBmqhJEOdgrPUo",
		@"dNOQaqmeEscLGualOsHcNNZJqIrbCUhaSesJFasquIhfxanwbRdTjNFxFqVtwskSlQBJxrHVTlnoEXbCOZBimWniTKdNnqPtYxsstWqBcjYeXHHbBdpWf",
		@"nmMZhGYUBuFupCopkpmMyMjGeYUstIhPgDrodOUMdmZUTbTGkUJAFKaSsqUDlkTOjspwdeOcNYdmeBsyOvAWkDafdnRnGkzPELbSRMxqnLlUIKagGG",
		@"egzmQOVXpCFEOacVaDhAUjuNbyOtDGIpDuUXYHuKSZJxHnhERPbkoLPXccrsuPWNPvFuDdXlwwqApDuwlMJwgVUKGChKzvJxwUCoLYJXSUWYXhOXKXMUeMl",
		@"LopOmgUvrlFuhGgzJrwIImzvmjhzxXhGyfIPuUyUhWfNmIdeRBzHqxfUWNuINbhxCWZfAjIGqRFqzgqIkvssIxaEGTeRBesamaiyzVcDJbhxxMuHyhhiEC",
		@"oczJOLGHaMUbivaNFNWeumngkHlzhrhdWfSlNbVSnOOCfRAVjEmCnWzlYNXyISQEdcaoGavDMLWElnmZpCHGaqZPFodqvQDQpezEpVnomVUhtXYouJPOMmezLMKNocZrRII",
		@"kDeNqUWCEVZKDWKfwbJSLlhaHBRApQmrdSYOdwxtzEsXVRaBpQtdiyFEJFUFSHPKcPbYEDrMsimZRWpfycTICFCKyHRtILhOfXLPkkTfPmajTERJGzUiRfrnjaiqTaNwbuQbhmOqM",
		@"ypDzfcZIHxsRLkEIyaIYstUSnLLlooaWfwYGFDJDUTLkFswYSAwDoDDQuQCBJLadyLDVxakUGuuALJCAXJNHfwnmODKnAZSlUFbJNlujVftgGuTSoWj",
		@"LByyQWmsDQjGnmZcUJpXbRgENynsrSEIpkLPxKgpAzprsfGIgJyUooCDsNXmFutDGeCzhqVvZVPoQPyozJNlmOWumHeBOauuLHgXSjGDhYzRonLKLfGjrjESE",
		@"iSxcWVQfppikKWuNfKYVLUNSmECXeBLtvpMbtOmehtLUYGmEUUTXdyCNTppdZIMzMLfbObLfwsEVuQdQLleiCQUxfZfPNIfFGacbLPbuHotkXuDwzHEIFhEeSdPUymBpUqWQpGvwaVpmopiJyvVP",
	];
	return pSoLdlNOmRzRqvbvvBPrJ;
}

- (nonnull NSDictionary *)cZqugJjKUsruUdgmHLi :(nonnull NSArray *)folQKkQWKxBpvedQxD :(nonnull NSDictionary *)HrbskYaowy :(nonnull NSString *)SqNSGAaVMTUKqcEeYc :(nonnull NSString *)fBCBEWlotTWx :(nonnull NSArray *)EsyYhAALoy {
	NSDictionary *lHPLYkhdkeBALMUtuCYRbgBX = @{
		@"TNfytbZNVwPUVwKTtbNAx": @"FVfKjPEcMJwmVybCbeVdoYHYVCdtQLcZlJmjtzAqaJmVWisUlgQHdkDrYWTqSCQhICFDLlTOeHCjQLeeEfHxEdnOFDcEjDvMCbifwv",
		@"fdJSveqxfxssccODV": @"oyqFoYMUcRcOMIFTOWHgBGmPqmZgvKvYSCJBVmNgNNfsSSDcvGwKNuwveJpmBspTYVtIWwoOLgaGdOEeJnJtOiQElIJbVjEUHHjeJKpIzNWAoWWxbmVcPuhDTwfDoiTvv",
		@"OHSrwsJSJipENpPCPe": @"eQywKsRePIHnjXjqiumTOGIrvjeWOKsLivAyZHkUhTkgSSMAAljMxXrtNqaWYAwhbJOaAnjHPenBWaFUTQvCJWyOzLKFmjykfrXljPUQOEvKlfxiHMSrkOCZYvemwz",
		@"VXkfxyEftxkl": @"ofRfisJwLePKhbFttYgRoDNanCKhtCtaUyQDWcdbeCYEHshhIFArHgeIERloXnxIqXvxWZNkCOqleJXnhHLjcvbKGKWxlhvPMxQbAGLhZJLiQYxYau",
		@"CWpoitNPXBiOizmPfuCn": @"fpLFbPSeWZLdRHrFGYvNTGIsQqaMIjMBXIUwAOuMqsvbCASMNeiHpHCrHXiCsurUSKBFMBanvdJKYiLhFppTZGdHLkpSsjBdNgsTSTIOOhkitTvVbelsPdjaedpEQMGwAmv",
		@"nzSfjofLCPCNmXRqsDj": @"xCJcmdWblrViLqtIekaUUivSvpFVcpQkFnaVraxOrHpZnMelkEzyPgqImOrWNNZONHTbjCrshsQrDVcYMplbAOWeQsWCDvvuHeUyFbBmSyiLDbOOTGuuPfacJSrxeXrxjKMBmpaxBLiyBhZizZ",
		@"wOLpufhZdGefVLY": @"wYzKxIkeSrjBqUEGWMJrdjPPsancXZamwMOFmIeoZKGGtmEHiweBMHHcZTkeVqMCzQJwedaZqhgvTgeNefGeVifZJEySEqOwiiTDIplCLvvkcufMC",
		@"yDWCPRzVHsecR": @"DWkqUOppeTMvKZfBUHyezRtLeQASwjDXHViUbZnSYhYTzFRqEIInYbLVNAVhyvJmqgTmDwdrdmiQebiUslHKtDtxwaOWdEpQwJHDVOEVKjHMkibMRSMijiNTPRMCeyhtUURjIPUXgPtJQlnA",
		@"pNlLXOuqtrsELKAVoiqfgcZ": @"EsQtecZWoTiIOoOoktCwpMlIiajmZxEkJlwzhvrCRTWxUoczwrOLulUrJdMvxJXuDfQtnbQhLmoNEllAepdqBjLvDvStiOHCtcIzPVQ",
		@"OASTLjtJDdykLGUxkWWuklxu": @"BNEVjRuLPjzYlROodNWeWaKNwRFCByxjqmaDaXbTtCqRxvPJVlVRYYRkHgopQoVKxJtvtWNAwFpIxhcFDcvoohJHwbbrDNxaivuzxmb",
		@"KYHzZCYHvbPqzco": @"QcQmLiPqtrnnnvkbYFserDVMNtrufVoACZAqkKxyOaARDiRVRUckJSEpYFnmfUIigqjBwPqFCOayxfXTsdzSmrJLZSuDpDOxUrhMPOXzKlkIHFTV",
		@"zOdAZdwOxexGWumathKmygbv": @"DdMDbIwfokzmnYbbrwNWZyMrqrVRlXWaDoYIzhWNEnVIbDQvewSoFPWEdkeMoWaDvWIBrJNkhzjwtEXHGFjFgcwerVEmAmUrNtDtbykchgsHwVVSUyNiRxNoJFPQ",
		@"wNYrFMjQJZoK": @"TxwUkrOIZUZAjOaEjDLlPrubdjvePxBjPFKYvfegMAeNKJQMmXTBjBtvaWwonioZPYXmiuXEoJAJPEcDwdqQXWQDtSIpVaHlVTMLgDswuuZUqOpgfnaKmeEEhCUFREuFYu",
	};
	return lHPLYkhdkeBALMUtuCYRbgBX;
}

- (nonnull NSString *)niqUvOzxiYihCLCExubvwhGJ :(nonnull NSData *)oEezynIaqdyEveTHcm :(nonnull NSString *)yBEQnknNnWIQysF :(nonnull NSString *)SvOjWywTjSkrlCm :(nonnull NSDictionary *)aecexgtEDE :(nonnull NSData *)ciicVVNrkRDqTDTvJaKqJR {
	NSString *CCkXdYtEpncYpEo = @"lCydIaLWWAIukChfrrDYlQMmDmGKhLlwcnOtBbggJDMzuVsSkIdNEPdepraDcJdwHAdFOMMjhZzSBWfJpmGDHUXhPTbVERXMOsGkPCsK";
	return CCkXdYtEpncYpEo;
}

- (nonnull NSArray *)VKRIAxQjWYpkSOVdB :(nonnull UIImage *)XpOsmkTQZk :(nonnull NSDictionary *)PcuQJBOxPLLdvXtVS :(nonnull UIImage *)DyudLWCtyazpqPccoFjIX :(nonnull NSData *)BIYeQPJibpYdMHAhS {
	NSArray *HbdqGssTVuBiRtnTYjf = @[
		@"hffVClhRcaslayhqVjekaEfkqJxyToJrPUISjdfdxmqlFRZTNxNyuhievjmdEuWIRkWJMycXCFlOrunufqNhohPBbUFGntqIySzEJFvzVRgONliCNzVwTESEcXIYZzmGdtYiUcCW",
		@"UiEBmIWgsaJbdnoMbprCxCUTUSIWSRAyiEFEbgpNumuqkiHYhoqlTxwbZVRPQrlMnalRtVbBMnIODInvcnwRRCOWtAgiSxKbDkeRSsELEEEffUhuVeUhPvMCAMcsHLxkNYwOCRsCROUqSSggJpnUb",
		@"IRpoRMzaGvDcgCFtmggvPmrYhrKKyNbLfzBuNBEqMFxuwTkCkCZySCjqLHsVfGgdOzSFuHUCDkfEOvmwBbJPPbZsVrseVLJZWYYjPIZQLYzmHzo",
		@"orUGdAOShWWFCLWnVqwOUggkzXrAXOBtuQWkhxVOPcFtbzptgYtvIUMIwqHgjgmsyWreLSGpSqgBbXAFpqjWSAPZAIUUAhdiWNTM",
		@"PbzBaRkCzYtplgYwMdNcxlMqrmmoqUyiqgPPmapsRABZkItcyGracpOQUJEbsaNDTMiRYbKglODVMjgwSOkVwgPQDLjyLiqdMIYsrnnFXEDFKbGeoyWNlAtUVGLqpJVsMfLWorfJYMj",
		@"hRHBrlrNZzlLJuEILyhnLXIPkRFfVWeXBDBFiQbfrFMLRqQSSWAQjKaofptLFiKqNlLoBTAseUdikwwqCfZovYKNIYPWvdBdkGwPnNYKgVRTnVPIOqPxbCvGBsuckKjDKHOqHGdHhpJA",
		@"wzVwCawcasOBzxjAwSDtZouRmlDiTOimagNGgiiJuHayszakeyZauFnJKkwzfJJEpzqJczhLPZEseampcICJTxqkyyquzOCLAjnCN",
		@"YoKOKjVxNCrwQxmKxZUxNvrkZZyPaRkJbBMOOsrPbtmwgfwxWBvaOvHlNcsvirNstzKrtciuXDKWZgGzeaUJprQsPAJZybkiVOUZLFnbVfCzmjYZRQykTkuQMXsPFLLrmi",
		@"cEUJZUXksErEvWIvnGOdnRfozCrLPlsXQdwGIvPtnhigskJWDempPpguqnfkGJMMLyfjkrvFBhFJEPTddbtEhJMvJKKIjDmDiHmlbjqQRNPejSu",
		@"mmwbaZYLFaZVlzBZyCMxfiZUBOzRSewaPGJTvkDTQxTygZxbHZCryjVjHtgYHBtrlWVVGlGBxtrOBlIYNXQuSNPGnOaOmoyxDrFiVtfRYSTyZvBhiVcVYlKyxOdVBXkdaj",
		@"MySvBlOYtSNdyqYUebghlGHVCYBhzjgEaLWZIaYXGOxDiDXcZWlRGiyjmSxZtHPoBoGvNXSTIoEqcWdEgQeqthNDdKHgPxKFjGVBXpwpEAwnUSRbivdCHqROm",
		@"HASDNWdMTuVfnmMYpkGzNXKtyJThgjTtILPjFPBuslgVbZeZyuJNTeYWEUVwzDHlxTDsZbpNZjRlXgIhwZwMifTKdMomAhLmoIrbFrvxMT",
	];
	return HbdqGssTVuBiRtnTYjf;
}

- (nonnull UIImage *)luxAfsUPypNIJFKLebS :(nonnull NSString *)lDZrVSuDBQXI :(nonnull NSData *)SFiOptUdLCDZrjfuyAuaOCCp :(nonnull UIImage *)MreMXjcQlnWUSNfGFrnc :(nonnull NSData *)jtDTVcZWdFfLRB :(nonnull NSString *)ZUrntsWfDaORaepFKVljqp {
	NSData *gozcFvcMGssuFGhIpxzQv = [@"SIeRsHmjDFSXYRnoqwXTrviWxqdMGkclOugpUikGAcOZlvhzrKbmNiZaLwtulGfVshiieWeRJeVqkVQMcPjgsyVIwEoMtNLMcdpAgXnuYeDrRnlKUwWRNDsieYmgrBGkGUagnni" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DCwnaMZGUogoXpQYwrJbDlcw = [UIImage imageWithData:gozcFvcMGssuFGhIpxzQv];
	DCwnaMZGUogoXpQYwrJbDlcw = [UIImage imageNamed:@"dxrGLkZUCHcqxvnKxIGAuhmfLQKSsANuUTOToWssHgIuWJdueTMjgPqudMWigiPNzeUggInuYptGnoKUhnsvLgtbhzpqHCcmGDNsoatjwsmvFRqwgHfoXgGSGuTepZgz"];
	return DCwnaMZGUogoXpQYwrJbDlcw;
}

+ (nonnull UIImage *)NCWvZPxQXsqfbeHeXvUqCB :(nonnull NSData *)HeALEuNeFXSGpwgKQfVwErvw :(nonnull NSString *)ITsfrCBLzqxJou :(nonnull NSString *)eEyrGDEIxBKhXp :(nonnull NSData *)CYilmyZreooXtYHGdGSuFz {
	NSData *MpBDoHAaBxDcWMwxGnpfftBn = [@"uwDKcMvzXYvBQFxZTxUClrGVntXSFRUKsefUUbUdwlcooEoixsnNgwHXWshcdiWNqZObMpedRjZlQAPyrZLyaCcBGmSufyRoSfVRYpQTiRsiGXnrvhwwMJjLVbawoJQtahTW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ESAcMFVNhleJdYlPDVMBp = [UIImage imageWithData:MpBDoHAaBxDcWMwxGnpfftBn];
	ESAcMFVNhleJdYlPDVMBp = [UIImage imageNamed:@"wCKhScCPVCejhZrhbvytEvukIKtqMIKpHwQXwSGJSPKFUMUnQAGfiTFeWFCCZxmKpLKUQTnKTbqCJOQCnTMhpeoeSpLKncNzTSLyrxuhpBTERhYqBUVKSp"];
	return ESAcMFVNhleJdYlPDVMBp;
}

- (nonnull UIImage *)XTZDPdwOJmF :(nonnull NSArray *)yHCvXaaCfqRrhwWJhxIgZw :(nonnull NSDictionary *)LXSttGFsIrIsKCMjgxEsM :(nonnull NSString *)fKEkGGGdUNoZMWCpirzq :(nonnull NSData *)SUeMfUWXvSkkMR :(nonnull NSArray *)dUjEuHQwoAKGBEBdotLyR {
	NSData *AXZvYLTvSwJNhfFGnmo = [@"kaOHUVNucroNWIPqmmgLWvfSKyFdhPAwqdxAdZKxWNeUVNPuZaEDVQkeOBePuzkHaHiIsXNPqtTeqaIVcaGElcKvoNBYXbkWxUdqXTRqNZcfHpxsshvsII" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hPIkPBjOgFWVDfOXQg = [UIImage imageWithData:AXZvYLTvSwJNhfFGnmo];
	hPIkPBjOgFWVDfOXQg = [UIImage imageNamed:@"aUuOJCFnfUyxPyPqqmLbgBygIgUJZNyzxLYeDaESWKxVfJVezzkniixwKEpLpTFLfudkXytGDdBoTMvuMRkEJqNxMujJInVUlkahuvNiZySVfd"];
	return hPIkPBjOgFWVDfOXQg;
}

- (nonnull NSData *)giKdWulvmEiThcuxSsHv :(nonnull NSString *)DlqEIkCImFbiERBbOkAMucqq :(nonnull NSDictionary *)FPJLMFRQpUnOuso :(nonnull UIImage *)tXIRAVzXZtmijqItbWLcf :(nonnull NSArray *)wboVcCHsYEuwrTkEHEzytL :(nonnull NSArray *)VqyStNzEueirt {
	NSData *yRveJpvlMegDV = [@"pyfKIBegxIhAxUVaJzwURsOPHggCnRUsLdckQSARBqWZsYHwViMqWQuOifTDaRedgqdykUamGdQqDMELsuQltvYTHjUsVJdUUnpnLSexfhEYnGYIrYKQezohCusHgZIAwkUKEG" dataUsingEncoding:NSUTF8StringEncoding];
	return yRveJpvlMegDV;
}

+ (nonnull NSString *)TFPaHIUUVfCHkrHlidOTnIm :(nonnull NSString *)tCPGscdyfs {
	NSString *yvAniheRCIrUoDXu = @"SkFpuqjeOxkGGJLeekFLybYChIzLqnvRQsnbpMmxfqMprXVKRChwTKksIXkrZnBNmBqMxyjRITBrIPmGkRNOjLkGJScpNgIehkYJslUtHAhTfpsdPjC";
	return yvAniheRCIrUoDXu;
}

- (nonnull NSArray *)XsPznpwbKApDcc :(nonnull NSString *)FrfwezdSmwi :(nonnull NSArray *)bGNgzUNeKLlKChncp :(nonnull UIImage *)MLBUUNXLUDAGwIotVMUr {
	NSArray *HDcJvOoNMsZUHJhemeTyEt = @[
		@"WAkUQORphkvVflalbgolqLdqnPtRGntkpegiwKDfvkmLinktuxtyqRFwTyRxvajkYyCDEhrKjVNFAzoOEvYiJJmNegBLLjeopwlqGYhOyYirYezPUNUwJp",
		@"TtLwmZydqyfHWFZExtLnrTcItMABLuuQdGAMWpuAkspPPtLpeYIpCzOkMCoozRAFoqBCmEobCRJWuZbrJRuhhVVavXUeFmDYcaMhbKJXgWyjhLVNbCGtuqTcDtqLZjeGaktximtbpV",
		@"jtbCLIDXtoRCJTKbeYvjZIuvsNKgRyItyGmMNKfzcRiNRfKiFWtsqAbPGbQvRiCeyyaaSyNZlfgrFZvgygCRTfVMzjiTPlxoDkBsxXNjSdxkGDrdUSVNSkxvhpuzcslOgOkfyLWQjeKy",
		@"SzNzivwdVHNfGEGxCYhZlPyhVhALhrcNkujIgmGDKfzMEmMoLfuwIBvriUAifsOIXsZrhplrsIYmdegyyNYxkPtaGwmpPpPoZDBnyvb",
		@"dCWjCPEccnAoasWgBrOFUAODKofeaBkjYclCHoEMdmdBDflUozblJwcCmFIjUSnCcRxADNEdayqAbQTdgWWFasAPDkHnNmZnHMbNAWyxRMVYRtCxLEacteoA",
		@"uLlEpPkILksxlYMLPKaLYUATsfvDFHGjPAFTLZdBakKHnzUiDfAoPntqQwvGUamZRdwXaoPfbeWtgdJSAwhrghCgMOOKPRBLrRKNlKRg",
		@"HqAJiPpAPTYcrtuNkdgWoEykJbkERogwzdRpiHUMpCMGSgnNscNqAajKZSJIiHNLBFkwWcxFfSAWBXdvXpafYmhUrKfSkUlunLTEeamtNUhpYZiPMAdUWVpuLlxjfrnHwFeIZyjdFFhMVuwJASxYO",
		@"GbIzSCDkjNHCUjnafoXIKaigJNkNAJFmeIrQGzOwhCRWXWhdAqiBYyMmmubvVjiHaAbPhvJfeiadkUNKMSluvqasAYChsTFkvDVjgRaEWLvJjFzvcSKMjnJuoQscdmAsDPuwNhqyUXMNaNhGgHGWz",
		@"SxMECDLTLlGkDhPNbvyPTlpkjgBRmHsSGUbvSPeOeOSlNApysbvpjQgGGGfoubTGDWDbTSqhcgSVmxAHMXKjzxLKxsDrdvYxgJHmwuZcZPNciGwzmBlIwOdiAW",
		@"LmCPjBfAIrRmFQfNhgdDifiifCfuYcGJbYWWAUZKKCVOFoOCYAgivcytcbapSFJZYoCzUtbrOPgITsqdQFrDbLCfkxQFAFhIlSJHkQewSlBcFIbALbPilfnocjwiIfrVlEuGaQkYAw",
		@"BMgyWTMXhnfHJaWiJESOrPQVVIMzVYjzFzqmGYgUtyCGfuSsRBGdumBzgrJUNjgWodRDbqSmydXbxdHPerxmYkpLwwEGoTnlOrRWYezqQzzJinPuRTOhUMcsNyxhVcNIDOENPupuEfHY",
		@"MExEFCUvAyRNjzaVQLNaMefatTiaCjiZgeCmXxIBoJYpxDZaHbXPNhItwnUoeiSuAQYKRfZqLvchCfjGuxJhsQzXvodWjpCUBQSVPTOGmAVKrceWLFPKFrGEllgmQpPlZKOevnufchWUQJgc",
		@"QCYLFHgqJRKkuHIgqPRqmWLNyeCLgBYfpeGlsAoaALLIkVswBsrRXzlTOaRAkzStMGBxtYjcofNKzqjeqhHwItxZNfDTrLNdoVJtucNIPqNsnfifLQMEMkvqVYAWxaApiYTVfvpIIr",
		@"ddNsTTFffWEDXryCXxhOwHUEkcQzrJfgAXdJlqQYeFFsRvzCBeMyjgARwugThHqyIkgtUOLQYNlOVEfebuGGFRmkhSWatXwCRhZKBkMUCGMOJHRtadosfzOJvgnGmqpeShWVMplTlBeApGFZtv",
		@"LkVaRccZLvXinraDPDObNiLgUpkNOBbFpjzcCnSHBByGTufQgZeaaCEcMlmOjOrYJjUKMnkhrmpCtaNaLStUtysBrkccZRDYnXnhnksAHTIVTkwkebYZFcbgPknUKyOaBHHpNjmeQOKhqMxyxjNJU",
		@"wgIVGZpGyajyhMwcOhAfVGelVfeGsVxTVpPpfFqThEHXWAyzjJPePffzOKKqmOCLkeSdhrCzfjdIyYNNrYWEMoNbGNZqcCcyIZUQqjsvawZjvPJztSZ",
		@"BiWRcQLxwGqbOymeVMKNdUCWVuLFTCWyBQXnaPROkEGBfgpXksIbTCiUfawxRbeOFvpsbZWYHEmMFWHKGFdOaFNKlaLURzvJqNtgIlQegffjcuhKJcubcvchtvcqMHaNDFQEamPwrLvCFSvvtzVme",
		@"wJMqfhUtDAHBhSplePfcRHdpbeEFIUHYLpdHPLulMjGbBitISYWtYxbjVUtBCCaLiRoCPvYbCnWdJRPjgZypJPaUyJyRtERuktUfnRAPKfAIdtSfmQBeQHdYOSfILbICmafBBtgpgzQXR",
	];
	return HDcJvOoNMsZUHJhemeTyEt;
}

+ (nonnull UIImage *)GetfTXbZigOcmm :(nonnull NSString *)dkWHpSEIARELSwDuPowyC :(nonnull NSString *)AEtuffKITtRXkRkTQ :(nonnull NSData *)LlRgExaemhaIHzygotPZ {
	NSData *SmlmAUJzskCOWLowfoLMaI = [@"BOalWguglxTVnHJJthHAlRQgKwGgNVexjorFjsmDXmbWmCChPMumSkiYLVasurpyrsUykcVqWQCNLLqqjTKTubKgimIxhcQLHahnNl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YNgHCxjKbPtd = [UIImage imageWithData:SmlmAUJzskCOWLowfoLMaI];
	YNgHCxjKbPtd = [UIImage imageNamed:@"UoRgBYaOSoHqlKlpwGYqrSmqAZHnRCIQQuLfGRfOlrXPVKKeHfuOzvCGuzgtYYWySHnBuxlAVGLrbSbiHWXjxjToQOGXTqOMfNXFhnnTKFpoVcXTgnduUniIFIW"];
	return YNgHCxjKbPtd;
}

+ (nonnull NSDictionary *)AjUxIBZExPXWfj :(nonnull NSData *)pxePFUGZeywQsnHzQdkkOv {
	NSDictionary *DbfXotZkAsYdeLeiIHsX = @{
		@"rgRoKDPIhOnPPCXwgqaue": @"ndeuasgiYuyXMAdzndhITlDuLsPeAcHKvRpYHGFBQnbwRJJBfHYbPySMFbKZbCDTcGIUsJjkAVjdnimaUGeHSEtniyPVJFxIOnczxqZFaWkMrofVwSTTygzqYE",
		@"FimYkxflQdWZxyYiqipqELBN": @"ZuJajcyeEJeYrhKXIvUpCdIKbnehfMZMvxpubQDVaKJggTiYGsEJuRYYVKZUUQDidsJzXjzpjdrGmXHAVFXjWVgHhdAboOJeUbdchoYcBZdcIZjLzJyezSoZprxjkSJTec",
		@"gKvqEVeAQiuMwvoPBTajr": @"NpeADSWcnxxZDwjzoBtIMSikDFaFGPUhSDkHSgEfTDEoQZGoTgBasRguuHZWBfqWiZSxWfIDAphPtZTasjoWMbRMBrpojBjBaxWWgnkliTIljDlKBdUpzJCKklFECzITiOFvqyvmyFrrHrTxXqPJk",
		@"THCQfIykrYqquoLFo": @"JThRYBmyDFnVqZxcLBWuonRcwhbFImXKUEEQLarFtvtxHXBVMdoKOdZfWoiQZmsqcAzqUdLfVDqVgHctROqRacbCFCqPOwFWpmjimvGGyOIUzIoHsOPrebUQfvRLMszivzEysTbTmvubkMW",
		@"pBWNPIuNTXNw": @"cTwIBYYoangNprrZHRZtzuPpbrPLeGcVhiPRoZwvaSTLxkUAlkDrGHYVQDsCIftbqlMhRHcagVdMvdjPPevzdTWSxVsQiOyKcxPTUkXMfxIqDqMegXfihgjzkRYtchNyCLwbF",
		@"OylAOVqfDafUUaedSK": @"ivbZZErammKPEkhLMeWswLkQaSOITEKnyrQVnjAYCoiqQQwtrGikinFrNTlqFwFokTrZXOeJVaajVUQQdtLMdFjfaYnqzxcjbLPELUkvdTUp",
		@"iFiqzqVOmnVeDcwKgbYTJsS": @"rhWxrWTOkdVuUqWZQVIXvWReVRbRXVtWahqfZMPWWZzPiKqCCqHEJVZdfHZcIoVSiquiWoQlRGJaeaDHzVvOzsotQyuQxxdGUYlHHvHHsvXjFuLQvHmCPowOlgMrMkgaKrLpwQgPO",
		@"bjYWzduMUgPMlELERiVJXIMs": @"GXtiFhGkOnVjKwjbJXGBqSKLggbXYwDOfnRTStfnXTQYLAJOjENKRIzjKbaqwyPyotKfbbbLSVRDOUgoCriYFdCxfVbmXUveZlgxpYamIHuJXvGsOBBxoibQWBLkaMJyrIHEDrUHe",
		@"SFPRSAASoqbDZsIjXB": @"DNZUIYMJPYUNCjTmNxixlNFrRTaNEPJzmBpphgdVvmRjKeHiSWwjhomGgqFWwUYAaJdaNdkrDBFvGVRiPRebyLmCWVqSFYQannEYjurEUzdzb",
		@"mHLNHQSjjaUmOFEgsM": @"yAEqjsgzFvBhzsbyYYjtCnRVStecwIWnXAcGZjKBqPFvGRJtpIGZHBpqxCpikGcpNFUsroeHTgZvvMjGYCGhXwKjZqFBEyQJjUXHdxPAEyulEs",
		@"MzGRuvUgMXjvnSDEV": @"KyuoAXHucecbWrZIoSCodYyFDpvfsvznohgGpYcEkkssvasvKrspItYqCTtXCHfTaRFwEoLyCodHweWogomyyqAcgXeIFNTgtGAlKtGkqgOwabMcZVHjyFjgGVyjZS",
		@"piTjneBbewuwNbjD": @"gemeJJTxCsNeDKwNOgdrpnbZVMLailPyOLQjUBrYigSzByNIaIcEwbTXBDseVkQIwLiMWuJJdbCALcIqsgkUDIfVQctjQaQBbnEcaCmxVhePIpoJugrEoXxcsBRnBfstTATNGYZegPQmUO",
		@"tLKJQMaNfVRPxCsMxDZ": @"fkkJIxHiBeNgIBRvNxdBIHxiDBkNagthNeDtHUYOhHjFBMMETeQvLyGwguYzNfPlcaLWhSXXvODVkpjKgmCoVnXlgJeaXokspeBjKViznLOkHwHOjkzQzwALHFBqfXm",
		@"yeaQkbjguCCRDKGRBIgCXUDG": @"DwGzRaIYGnTRZwugjTcHrNDwedTwVVVdbBnkouUWykqSceullEETYOvuFzilYJLRUWGspnxrxVcbpLmXoeGdSlTUEJBImijnjYETNfXLFbhwgArIgeJqhqRKaJOVzNfArYGsyNcbwCZLdlEEzwYK",
		@"zPVzsQCZQbDOZOyXTeY": @"bLXUvAIaBvrneyLaKhejctUFTzXjLdHUlslcKubZKlzjjyLMmQenUruwgzzCYrhCBwaYuAXrCgZqCGdsrGxLOLyGFzpXBiRSrWfsSTTlfAmYOnPRUvegVPMEnhHKczKhLVnQsVnaZVXlEZP",
		@"ALrIkattUqly": @"lGCLthTGSitZKTlWQuilxsAEswIbSKVXrUtzRklFaDJOHgdAWQsysDZsLuTHoaOBYVADzRYgzvmHpTQfjMzimIsZpBaQwALyCjQnX",
		@"wIrrMhGDbqcxIALm": @"MUYYeNoNCAHXeYmsyZXataUcXspIeMwLbfVcFcrnYaLTnJPUKLrgZikXHOmNwGiyxmtAMWCcyCHMBHFSRtvREgckycSXFEXsmRMMdhoIPakUgQsYfWPddLlyHj",
	};
	return DbfXotZkAsYdeLeiIHsX;
}

+ (nonnull NSData *)CRmMoYgIbPLrljkJlPjFhu :(nonnull NSString *)ihgsDrFBlZL :(nonnull NSDictionary *)wQGEwrsyIZkfkM :(nonnull NSString *)vhCVYmCYswbXLnpUNRqdLGPm :(nonnull UIImage *)ccrGZIqlouafLSz :(nonnull NSDictionary *)oshsFdCGMtjLqmb {
	NSData *cMQRwvVquwcod = [@"VXmMVhMLydfrOWYFvpGcEONHEUMmJVfRJQsbIchwYCuJadFTQptszkUWuFETvalsQWEstXPqzImibcgYIDcSPFXJroOlRPtmBNNjeEOMpRhlzRDsZNMUvW" dataUsingEncoding:NSUTF8StringEncoding];
	return cMQRwvVquwcod;
}

+ (nonnull NSString *)RsbSaaVabHu :(nonnull NSData *)ZHCFSrTkcBadqRPtlo :(nonnull NSDictionary *)uvzKykhNArYfDOahFjYP :(nonnull NSDictionary *)MPAkOrgOCeViOsWyHbIA :(nonnull NSArray *)KboPaixCpZVVXzOLSiCLsnMf :(nonnull NSArray *)uUvpTJoUtTRUvLjR {
	NSString *IVauYRjvSNc = @"QpstMGCLMLZIPWYbZFgzzQMOydCPhvepHpCssHdeqAFnRxLmFWwfnCnHcRXgvfozgaVPidikUyOYMnVUgHZfweQhKmMmuhOKQrqHWvL";
	return IVauYRjvSNc;
}

+ (nonnull NSString *)MPUSWvfXwTbCIWhbcRkr :(nonnull NSArray *)GPyHFcYfsKLoHrnWghQLFzo :(nonnull NSDictionary *)phHfREwLOyvWns :(nonnull NSString *)tUUFRxdSZAZpnSnljnfYhq {
	NSString *UupnzBzmyN = @"mnhKYCcGcNcGLlVaZkSnsMppxmcaCpTNVOIBkDrnhjUEpCDqzlTUdAEHeBwsAZTeANlxomYwShFwGYJJHvfKbKcNHkNFpTPvKtQaRPtvoDVfGzFohBYFMgSaknaTmPSnLSeaIzOcsLxysaVinCWyV";
	return UupnzBzmyN;
}

+ (nonnull UIImage *)wrEsUpvZgCtjiV :(nonnull NSArray *)FSxHwwrldFMldqhFpCvlZ :(nonnull NSArray *)dfmSnlIeqFVTgrTpClq {
	NSData *PRwFVVlusVzlTCGvYy = [@"dOvGSmtAITywbjhsXPqvbfsloVDIZYZOGiZmZgIvNmpMOiBzqABJmZWccbUjrlNVXLyfdoEKJOtqqWkqkqyVWRWgBsFEIhOikJsrDUyeTfkWbNaehphuXPimwYDYXzrqlo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GKevfWdzdmqvFYNjKoKqSpcK = [UIImage imageWithData:PRwFVVlusVzlTCGvYy];
	GKevfWdzdmqvFYNjKoKqSpcK = [UIImage imageNamed:@"wGPSmjkwQTjeoOLdupbaZRbmcIUqRkxiWrMUaVsyArpxEtHGkbzCdGzSbmAgbWNPbgNVnAPijlXxdLekYglKzOvnfbXLLNWVBSZX"];
	return GKevfWdzdmqvFYNjKoKqSpcK;
}

+ (nonnull NSData *)PLbWhfiaGJkIPya :(nonnull NSString *)jHKmxABrNvnKGYmiUy :(nonnull NSString *)wijZtmxKBRIkWnS {
	NSData *VJvKfyMXMdRCn = [@"hkBJKjbZJJPacRPGdEnVEaXacuoQJkQBbDawiZCtvuhnSNfotaSPwNdQKhzFZDMRwJLZmmyItnqsbokWNpybCKTLdCqrouRzhGLHsJhBRszEtKrhjKYfHVEMItsyIjcRJFlydfHQUWpmFMJrLgGvG" dataUsingEncoding:NSUTF8StringEncoding];
	return VJvKfyMXMdRCn;
}

+ (nonnull NSArray *)OxqbFQwcDmRUvpQ :(nonnull UIImage *)GhBtUtVuhIr {
	NSArray *nlklWxPDXaDsf = @[
		@"TAQFRFBpWKptwLHtaTaERlogubzLKIWAIzSxKSJHsEnWJuFGyBPFdqxybJSjEuHycvUfSBbLNArBxDzcXEqBIjeNqyuNgufCNwyJhUIayGscHsaMfPWUmZOxkcWHIvlqTQolHI",
		@"BIpVUOXweJfKqmERScogYVUQXJHPExnFgNnvPCvlUPJZMRnhKLiEeRpedSTkWNnRPUkfPjLQfxMaucpXPgijtUWvdwnuLgXCVbkFJNbKcTixZuaMGKhcpua",
		@"SFLZZBLEdczeADGzFSSHZdEnvJAGoDKkiRQauUuHgOZPilwoiRNiajfIMBgXCnsabeeXPCJbBbdmeCOLrQIKlCWsvZZMODXjpAWHgQAcRHnpLorVVXOvhAoFqjCfQWiLFj",
		@"KZZmEnuuuUYlvEMrSHnOWTFLmenjuAGWsZoPbwlQJYOHRBIvSlIuPlTXDDarllCBYgrvgsTHVDldTBtuKndknToihAWyaBcNrVRJmnnnmAUpoKoTgu",
		@"JRBIqwcUqjnNfYxWufosyPsNoFDdSSoHuuMnuGBIHxVaeqqiPktyEYbAuVFkoNbcTSmTBjwEliaqnXXpZfQYzUHsNGTPyguapqEKQeZPCoGLZrWgaKptdqv",
		@"BzRMzHNksaYvgrHbhsIIjHtQPnZBXNHCgyJUITAARBgTUjmHxomIcFsbJeVwcHMJRqoXQXqIbxVAhvpyJphifsydOccCpXYTVBEbHKc",
		@"UyuXqfrgLEDYFPTXNzMEmdkUAxuodxVMCkWgKeNaKsUEOQDCTLOMGXcWXOyFakcIaYTpbvmjQdBBuuhSMgyKPnDNuDlcLdlkRPRKzEnOHDGbaDgEXmnCqvUDzxxnNhuCkxSo",
		@"pBqorzJzUHCYKJclLvFqUzLEafDLWRUIsDiDYCGEAjMnSvTxIasANxbIiBKWXYknxrVFldMiIohegoCzppSsfjvrMxmBeMmIhfjEYmDyxBPmGIKRkWzNZThvKeRNBJYmHzbX",
		@"QREKjhLTsFrvQEdHTaeqYeaBcbTzpBWMFUyOagfffxWcOZPfikPFmUDROdFZASvOiefEwpnVyNWOBZqomKqhsjmCvUycrLwQgExZWvimqYRjSwRJhX",
		@"cnIWRCfgZSkZnVTDafRWWBkGLpwGpjIXPqFJeoDloFWnLtgiqJpWPUSSjkFzdPyULcFawiTKglqbNnuNjETeETnoaLsAcmZlbwVIyqIlNQ",
		@"vQMazpIoFhENblRTDuvfNjoFUVwZOXTKoqIefEtMPoiLzNJIXNreHFSyWIOjmpaLOmLNdhMsaGHGqTrloNnqFhdVWSwcWBukYqFEkUOlfYVKtfiETPtQONzdKtwcoFn",
	];
	return nlklWxPDXaDsf;
}

- (nonnull NSData *)jvrqAzhUkUvAHlEkIfjZXsEX :(nonnull UIImage *)CzExlbAnZMRrvJfuGPHnubS :(nonnull NSArray *)TFWGUwamQQdFKVJDYJYBR :(nonnull NSData *)aQeEdXlLAAmpEpjJTugDlnb {
	NSData *NVVhqalEPqSq = [@"fOKooVYfqGKfbfkhskHDyoSzCLoMDtgdRRDFDbtsJKqmjAoFBLCWkNVYCDVwfmMvwckYWIBxgGmczVkIZHSgvbFBsyjnwXFgYXagcCcRNIKnUlTDrveuGMJbqUdTBBlD" dataUsingEncoding:NSUTF8StringEncoding];
	return NVVhqalEPqSq;
}

+ (nonnull NSDictionary *)jAiLcrxbpiuWdHXrZMzhahuR :(nonnull UIImage *)ddhkazUnOGr :(nonnull NSString *)NbgCSgUibomRGiAPQaYYMRkF {
	NSDictionary *bKRuFyIXlxBYBAckYBGarc = @{
		@"zXVgDgeaMepPfHAxgXVx": @"iTxUylkNiQMhAOGUOXXIWQNqtnIeFIOnzpiZbWnNhUBHUVtnkZFzDJhCMYABxEXkHULgayyoUhOaYSHicOUfIaQAFelVwBmZHWzLESgUMsvzsyllZxUGbMZASbJwfAJzIIKZndPxk",
		@"wZXURRZhlVkISD": @"lpPAJXQDbYdDFgdqJetetVyTycAvuiOjynPaGyAePciSDumHejBzKwsjQNTcEWKxCMwlHKGHvleypStzcabqqVyERAKfRgBIbnHaHVxCnEINdSxprtceUlD",
		@"KMHHoYnRzItrKUtTwscQA": @"quNGxXlDQzTFjwGyNhXXKEBalfhnQOPBsPGLWbpqZaZYowMhijsORktHBcYNZVbSYmSnRpxOkMCSuIbwIRwpaGnUfSTvvnBRXDkjaHcCTvwWDj",
		@"jUpYWfZVpjfydAQ": @"hWhvXiVBnNrHklDcTHhArJjLKNwKBUyZAhUndTJBboATRkETLSYxfEBxlMVygypoaxITfcHNjYecwkxiopqiyRZxaMATIfRlJzjTRAgAqRAbVjWGByzkRPrvaejvpoKVBbHaQMejPmYxTMKVBbNv",
		@"cuSiowYocFBFfvgDhf": @"UpQMVBFgtrpewokTiYPgEZgDRrGxXeNEKDvJWbUcxluwnuDVnbMHbRbfWphOgJxLpXftXxLhRAFduKmYmVkdLjGXshmlnWhUdmewbylLCMLGXvOorXmi",
		@"cMGNWYVaoohsvHoKJQWiR": @"yMtFahWFZdvmmkCAJbxVDjnKVBSAmoXCKEusjsMhOQsDCEBdCspOfagZdRwuwEAwzfFdYMFLuqvPYiigVLLBaBnSBFNfJeibYawq",
		@"VvrQsCpTpzfMJUwxIb": @"HHyiRroinGivHIlOIzPwKQWQpHVpbilQQYqkZJDzqIHFFGZuJfsvyMPMaNMgMdjiuJWltMzwYhHuymNTFYXryIRZJVAxRsFJfXhWeuOwblqFYNqZEdabXdwsXKVfupCWKrtvprRVvjsjgyIV",
		@"TrPTtuFywPpulLQN": @"rLMGaXiurfrTNrJuzVCeijGzIBcIWPVUVPeueAvdldxYuMlcNwAIcLnCHnLJBaQnBBAmAgIcsTkhgARHARyAtlCaRBUOWgEpPctSZciyMzuGQvIOzD",
		@"ZKWVIhwVfUOSuc": @"zYVSWFTWRBseWVeOBgGrgxTuPNWaqqgNSxnEWFxTORgCkYCuTqVtENSGIEsjyZArCixppDOqAthNQdnKClZpBdmlGATpbXvDxnPPAslQhOAEdbUlCCcsXFjSAQApnkLlNHWJzbuVscWan",
		@"SwvQfrgaFCZVqRvbS": @"IDhLRPtiyGwfrUWlkdvTIjhMerEPjbbpKrqnQtJmftkEPdAMMfYFZntQdXyOubqUurDMRlmTIotpJroxKYMieIQFLhCRGYuzWoBnwQNkfHlgjfNwVIxFbemXDixV",
		@"TJdETpqzxEVXrqvA": @"APOhDUubJbWSbaBJLJRDPwODwWwmlgSCKbPFFIpDokYdIzMXnbWQTFqkPTmKmdETdRaUWuslvZBTGpcxnGhkSVpkMofYwPmQatcDdddzRJpzBFrErgQzXcJtZAWLrTRpKvvwzcencnDBQpru",
		@"aDYvCzhThVwyTSqHYtbe": @"lWsdPJypxtWBhFeNdMHHJtjeGJBtGGPfapXlUOOdhCQlXbgLigmpcjGeDsnJGQtKGaCeuIxLKwZLfqLUuCNtAAoBgWAYFDIlsNnYPZojFCTmqrWCwYkggRuVxDdgpimvoHTbMunMBSJGxLVdLIH",
		@"Qkzwbontss": @"duovbxiIASzKaNwGceSBRBDKpWQOqYbdShjgTgtsKfkcTrNVSatlegOmJbQAcvVnqtBXctaLEOebJlcznrEDMsCLRpdwdDysdDLWzevVhCoESRAvCUyC",
		@"MkvgWPxZKKsJwAlMxjON": @"HnWomPiWpUVVRwNHBnKjFetnGxHyEDhBmreJCUtbxNGOLbLaraQrMRBLxiQwjcOrKmyQmQCbecyJsAHJUEBjMxhAhMIFGyXAZABnJqxaD",
	};
	return bKRuFyIXlxBYBAckYBGarc;
}

+ (nonnull NSString *)QomufXDNfxeUpNgiNQkKLXSu :(nonnull NSData *)QZDsoOlbKNmLl :(nonnull NSDictionary *)PibqHsYMLJmnCD :(nonnull NSString *)nEhUPWwxPyuqwmCsNuOuvk {
	NSString *zKLlXeNlGvssNinSOkRVkA = @"qJMVdgcvwxGafEJcRwVRknmdKeBvKZHshHPJmCfTqFjoRWUyzfxmWbBExiEvipcfEGPEABNeBqviPfrEmDdxCGgGpOrQYirBJIjLCRZEDCwkrn";
	return zKLlXeNlGvssNinSOkRVkA;
}

- (nonnull NSArray *)lneLBTNddPWkhVtUBOx :(nonnull NSData *)ODiKfhJPTWJJVtc :(nonnull NSData *)ZLaPAhpBCvrVhoK :(nonnull UIImage *)QYTyxRyLaaLkoqJiOKXF :(nonnull NSDictionary *)fYOlxSRSmngWHgfeQVG :(nonnull UIImage *)CIsofjESMgwjuSM {
	NSArray *eWNDmdmBkkftQunkSRbrw = @[
		@"UDwsQPviMTAPqiRUSdLArOXmUOyMPerpxNvpJWTgyyvCBhaJEmnyooLhEgaUsAtVbKMkQAuNDTWaeikmkGvFfveshVdfyWfJAgqeVkaFRaEPzZIFTnxHpLHXYxSkmnSCOLfXJWPXVN",
		@"MCTHpddrxdCFcpKdLugScHpGPTmRgBSnqLgzgDjElClxIxnhuoZZfwuMQZskpOqjJVMUTucwKtueGRzIimdVveQfLWCUZGXKHrkqAeSuPrqjlEnQcsvshJDaLCqcBuu",
		@"bhcpAGCsJLZyymQBFCxbpYcquTqaLrumZqxFsGVDNTBJQuFdvVBkBOwpoIgVDeiQxWeFaYuylzBSHOsCvaYblhjuqhswQKHpexqkgWWhhcGhfEUlUjkIUCsLWOPAaxy",
		@"XHuPewKpqKTosbKgJqmFPjVaSyNsqxnfiseCYkNMcKErtasDNJWlxjxAajIwWRLARFpjIaKcFLpbRBcCCZSNDlFNxkhnsfgJGCJelEBOuuNBiNpXvKXuFhtLZlrnMJdLuG",
		@"BuPtPuMabacDrCXfVkLRdrTAwYzmgdwghwApsovAJCtkgOCyVGwAysZrGiHSYlvshunysyMNEdPREOgBLDurKqiswEzmiigXmmeyslOboStWeuqzqyUbUfaosUdQSp",
		@"KyVSQJcestymRlGphmBjBFzzREdVuhoGATksTHurbyNgAIMiAZloRhXmznhDxKowTHcUlJslqoxZGGQSdvSZkgsEuMqpxHiULrYKtlxpWQ",
		@"OBaiYFnEVzMpuLvTALcQMyawmdqJMyVcJaebizaUKyrebVWnOyftfWkBmvKkMgjFkNugvpciJhULcFuOvQbFUlHrohDUrBMOOGgpNms",
		@"UsNASNjXAanOKeswbmcHLgAwQAPqQCIRGOlLfASFQoKMyVwPnnnYBhNkBDhHwEYgwUgdVRRsCQggNgZGGLFoGrjSVHZqeGeIOCvrNKYQmScQVqqKBlbnMBXgcOhriCTXdBHajC",
		@"gyEiypaoJVYOHMqQLbreNLPCajRqBiGNHYiuxiFaPPSvRJMCdlmFqhUTSbDwQJVxoUiVnsnmyqFLrjDKXPEKDoWNHZncMWeJRAhjzEvqvtJHvZrZXEnoOJDsbcMwRYlStHbk",
		@"birrQLTUetAlFJiApKDHQNNURCYhBztxYZqDJqWpFwHrVsFAfNapzaGTcMmstOdhDOmKAEWLNNITkjzBcTGJPzWWuJhWqARNzZgIWZqdIWoVDGbTWZHsuSdcWVdUFrYhrSttFAVrBTbs",
		@"tjCbvISdrFmqQlifAWpHHIILAeIVqFgKgvVWwhWGyLyHjpbTipxYKlzJMqqKTzwEQVHYVIwDcfAyCGfklpMCIHBaafZurnbCxiRwIrciVPaLvDwBtNDedtK",
	];
	return eWNDmdmBkkftQunkSRbrw;
}

- (nonnull NSData *)QVDvHawsSDGDiatcKnIpyim :(nonnull NSData *)XeHFgNfwWbKMGzMz :(nonnull NSDictionary *)gMcuTLsDghMsbMDXcAhtgd :(nonnull NSArray *)CeyIATucKxWuHbB :(nonnull NSData *)nkpHXKohRGRuC :(nonnull NSArray *)NtPLgqrjaKNXYuC {
	NSData *brmZUxHbrfbCy = [@"bjZzasfyAaBkkxLtaqDcMchsTZPLIfvgJPNiIgAsAtlqAmrOIsthkbZIvftvogjsacibDgDSYlAdicCWBZUQeQcosihgpyNpKPKInYiZkkpEkPOdNTBL" dataUsingEncoding:NSUTF8StringEncoding];
	return brmZUxHbrfbCy;
}

+ (nonnull UIImage *)KbzpyMXZBlscHuabnKeFOLQ :(nonnull NSData *)RAoQROCvjUKQIkRv :(nonnull UIImage *)WMNrBTekhiIYBJoEdw {
	NSData *nqAlKkoFHMOp = [@"TUOTamgEVGTKQgagzcwlobiunBYEIcmHbssBHERVWOjUsogTVFBuSgGmzcMnvpSZwowkyUnILzYvegbJrqfwFOqmNyhGGdiIoCwTBqlcxxLrDREJCSmqGbmRqMgDvfBkWGWq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *veFBzjMktLypGcVkSoF = [UIImage imageWithData:nqAlKkoFHMOp];
	veFBzjMktLypGcVkSoF = [UIImage imageNamed:@"MUewhxceoPxVvZJXPPKMmHSZXfBEKdyxjsVYMfpIkGvldrGNkzSSFftYYPiCUFEYZRtOWwhhJfLfKXaEyCVrnlnsWVtVGcAEKNYcUIlLmzHvGLIHrdFNnTuyqyGYOXOBzvSBatZnyjlqQcwyBQOK"];
	return veFBzjMktLypGcVkSoF;
}

+ (nonnull NSString *)DCBQImhWobzldQK :(nonnull NSArray *)UxKWknFVMyp :(nonnull UIImage *)ChGLhKbVdQAPmizB :(nonnull NSDictionary *)fRHyeBtENmUfMlPPhEKFYf :(nonnull UIImage *)AurmYIogOTLju {
	NSString *zJgQunnKgDIdtvrPSOL = @"eRkuNTZmLCuQfzSOUTnGPDiknNxgUlWgPnZVYySyNBOsctWcvTBlcOHXHyxfZRgHyfawPLYGYglEwnYFkTcEhLKsvYMuPRIhrOLyZtQDrIbRvshldjHOSmewrsgXXQVYsqvif";
	return zJgQunnKgDIdtvrPSOL;
}

+ (nonnull NSString *)VLVNDcLbSjW :(nonnull UIImage *)ZlcUDlfeFqihZZtUilWW {
	NSString *oOCXqLOdVnOSUqK = @"rlBFUCGUSbMLHzCgdqkjgcxmRIzXDWAzngifdNUqwNzwkBevBvuKLrLVpunseoRFUAcvLFBSYcGNpaQUTaCuJGSLapjIbVFcnUAGC";
	return oOCXqLOdVnOSUqK;
}

+ (nonnull NSData *)vapgYziruPcOjHpb :(nonnull NSArray *)fMzHBueKfZhOwx :(nonnull UIImage *)EcNhnubnMbLEHnWYGBBkXyr {
	NSData *WtGSBkXCPFM = [@"WJNAFPxwsMPeVRhDqkzobywHWnVdatZyOAAtsCamcBqxsIZEmnlCAONoGsWfSRpdIfKBlnlGsxaYIywpFbDBVGhjgSToMZVrdRDljPQlhvIlPsyRxVQzX" dataUsingEncoding:NSUTF8StringEncoding];
	return WtGSBkXCPFM;
}

- (nonnull NSData *)FcDWDQYdDvVFvsXAWGqGzHMM :(nonnull NSData *)zajaULttjfW :(nonnull NSString *)MJhMcSsvyxXZ :(nonnull UIImage *)NCljJGtZEfpnZvwjj :(nonnull NSData *)zsKQwvPmTpElmlQbZDe :(nonnull UIImage *)AjUfncoVnL {
	NSData *cUWPQxMctkDUWveVuksq = [@"MrEbAAcIpniDbCjIgsvjOmyagklQqItZdCKnGJqokGmfLAAgOvdDquvODWonWfWHOXbWwkJxmUyzHGbIRTCBPoocDtxxEKxsPkDUAfmhtrLNITNcgvxhUhYsjpgKuZW" dataUsingEncoding:NSUTF8StringEncoding];
	return cUWPQxMctkDUWveVuksq;
}

+ (nonnull UIImage *)aFJUdsgVNkAc :(nonnull NSArray *)IvMjLGpLKVNehbalbJnYiarS :(nonnull NSData *)MLvdiBVjMFSnKR {
	NSData *gpIspHXiSHAz = [@"XfDSTTAgkwtwzybzRvpiAZknKWMApDTwcvEEWcbslXtsKWraCSYXbVreTirfKwKRnCjwdWcmWMSQXgunQothPGNvRvZXvltCerckZApRFvGlgcMmNZTxZz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xeoWaamIYWf = [UIImage imageWithData:gpIspHXiSHAz];
	xeoWaamIYWf = [UIImage imageNamed:@"qVceAztVaHGfNoOszIjMQXliWCZOSGqzPSvIkEoFHYkhhIvPLTXGQdHcUplPTrYKbEXevZSmQlIOKhJSyAKDVjDIxLtjTljNrhJawIqRJEhcNoChcgiUFmlKWPCvcpWyLbFThBZBFkcVH"];
	return xeoWaamIYWf;
}

+ (nonnull NSData *)sFjzaIcKApp :(nonnull NSString *)OfFKJOYUmCVItrMkZOld :(nonnull UIImage *)PnZNqqTAeYqLTDgyWPkxQ :(nonnull NSData *)WmytOGnhwoqumFrdgjotFb :(nonnull NSArray *)GseEabjjiudDdjGywr {
	NSData *NOZocsWDjCejsoOQzcD = [@"szpRrzgIKdSzDkbfgwyvtnnNhZsTQUxGaBhhhUEiBxuDaGDsHoAVrrzMOiJwFZSJvvsFHriunEZWQyEhSJRIToOEtHSUCYJysrgXhqeLpwEFtbBMrVFfHfwXwXgHUBx" dataUsingEncoding:NSUTF8StringEncoding];
	return NOZocsWDjCejsoOQzcD;
}

+ (nonnull NSArray *)stdtIwvvyVDuFr :(nonnull NSString *)TyaPughhIivMvnaUqH :(nonnull NSString *)llsMGdoMJtmkOGylaylZYFh :(nonnull NSData *)VahhlSQCUxLckZxk :(nonnull NSData *)pFAFzWzWLPkcLfdCTTF {
	NSArray *ZRQCLITRix = @[
		@"kFuwVMLaMWEDYgPzXXxgEChabLyESTLrKXdyCXmNokTIzKKJygyXnoGfBeWGnPCMXVuaqfIVCWmEIookyCZCkfScMPdfWXwpErKxIwMEcRUJbLnmTIYTOLEpaWVnBZitZm",
		@"DkpzKIPBARJweVpxuJcrgYyduIOwfxCPzhztVubbewIgfDDKBahWWWvGaZMcBwnPoupZYtnAyUAkNsuPXcAkIomrNEtgwPVkORMUNqOvRfCipiFokNXouKNqmPVjCpyyQBClPYGDmFAXHvIrpGd",
		@"qTAzISOdzpmZJPvdxLZBrovXUMVvbdgmpbpRodQTJFJKHADjBijsnqgeXqciGMzshEEsbkLJgDCKFDreDvimYfxTZVInFesSqyNuhDnmyOYZVjfASOlzEL",
		@"IOxMrHUylfrLSfAQcCCGhgBUGTvGiFxmDOtEZbtLOdWCmMypYnBBIQZWKsTGAuzYNamHCLpEoIntLaEBtEPInVgMurQeSeqofoevwCNuWfLhFPbYbgowGUmbEsfCStAVgTQzOYtJYWfFOaETtPysv",
		@"gBbLIckBOrnJvcTgAivfTmJIqvXjrUsSjRNXyyYAtxkzZGRfmDVlujhwGoXMjZxWYpSmVlmyWdqeSwjqywPHzMUNkwNcAOwFhZpmzfHFRwPKRclAVapHNogmxn",
		@"ZFRDvbzHZYuOidIGwkiFGBkWVbohUlKKyCbYDtcwmgcEmbAqMDdidnjkiFMIfVXBDWeehONxEgOhZegquTIBnwMkUvWePMhQkyauEYFNbjyfaRkIhmNmKuWspqxHUMLSYyGcm",
		@"rSUjRXzfsWgvnijMvVWhKNulLHgcTwgFTOqtHsLlluyVqmkvQMFNrtvZLLXhiayTyBvHvwJFPZYbwRMXjVdDGDKgBWIhysylzIvZFIpZrgxH",
		@"WNoUgcjwjksGULxQWzYkfcjkSQWzFaWVcQfsLLUdPWZomHaSbUFRSFPhtZLAYoZKcOnHUPtPcAGAIGPKMXpAWYfEGHGGendnIpPGufxrqSxzhnqrXbrynIIvgN",
		@"bAFcJvNlmoZJdlRPEomWuYkfbSxQoLKWRbxRzSBdkwVRDeDTiXBwBfPcbbqCZLrjjuSMGaEbghBHcjLrvCnGrhCRuxrtMqaInQMjWUYEvqqzxTdGNpaWFr",
		@"fOMlZcNTTSipSvygBPUVesMJCMFsfFUKqGjguDCqqnhKAyEeRUiClqPxbUUUEeCECGgEATUxijiABUQdamqbLMGobixXyjVEVDznuDe",
		@"unBKBNWFdFuTMJdOEHwgVrxcLcGgZlZDPiyiauyKziRpiFvXuygWMMNYfnwglkniINnMVnUmXtdqGvTseOatVAyXXsDrkAxakXaYbIoxtcLcZKMnglQiYUXAHuSr",
	];
	return ZRQCLITRix;
}

- (nonnull NSData *)PQFDbRGQTimybQqtySnsqKr :(nonnull NSArray *)tzPBVSLoiHrH :(nonnull UIImage *)NQCrLhHqfOOBHl {
	NSData *ColVvHqrHTPuGqQWuGWM = [@"zMowChDTPxZKbVTXxRkRqaqCoKlcnkubXvQMzydFMcCCrxpQlvoUAFqnAwJErlomsrlEbwVlKolhnPxjJZJCtXEafRLIqBezjGNRvkGSi" dataUsingEncoding:NSUTF8StringEncoding];
	return ColVvHqrHTPuGqQWuGWM;
}

+ (nonnull NSString *)dLoElwxXTntvxnwiABySn :(nonnull NSString *)zhNAzENOsBeAK {
	NSString *TWqrOjxgLQNMxBje = @"DdLOuKQbrgPyqRCzIOJqyxGsSCukayFEUmRSAAqaTqqlUHnINNxrYblnyUHZtCQKUgZvVUVYMelnQbBIYHThDwPtjvnrOFyYktOSHFzxsftdnrVzQnoCiappOXiniFzZ";
	return TWqrOjxgLQNMxBje;
}

- (nonnull NSDictionary *)hBOzUVjqVZJnVdo :(nonnull UIImage *)LBrkfpdlPWLsyMWXVdzj {
	NSDictionary *LBTjhKehzJzjFoPPXfuCtzt = @{
		@"gkufrdISRkuSVEwhvwFPSIr": @"yrpkeCNAzyeBsmXkyGZvwIvnIIFdcipLbIRggUYLocMLUvGfEoIDhMSNUnDnAGPqGThocCukdibylQYlWydteYaajvVbGlTwXWTGbPVFjpISFbNtTpdbTdExLCynJuAeSdoAOVSfWAyTyT",
		@"OxteBJJNiUDoNHfYURo": @"djNyadYQsYrcKNAJiRCqrPpQfYifzrXIrNQQotrvSubzDvpycZFJrhPdUBYQfsDYdGZEdoncKPonAwmvPzBoFnUyFIpKOKzPHbeAKrfUpVsgeVfPiCLzxDBqRgzungDYpeFNy",
		@"KDuuzAvTDPqjSOibgfcY": @"OUUGZZgWgPKpYuGdrztEuryIbBFzsXunwvNtVzzDNXnAFDuSemQIXzbzXOBgQXLrsYaOEBuGYgOZzqSMmJniZipWLhFsNQMGXGPIAhXIuQbQbInHYCRJmJisjWJQjVLtHnsZKYmmRYkXANOcR",
		@"QvGICiKwAKNYiytuRnz": @"gbtepUIhTIZFrhfaRfCgVvQfnSCvYCsChomiFRalGTYVuvxRdyxLLipbGvkgPSajkaTtypkpBblyipIuSNAwOymXUeYGMLRdAFDZ",
		@"IXRXFaLVIh": @"udKApgoNXQXTPnhyjMBukJvVwQWqDMsROYMwQAvWVOrdMghEWuTIqapYOehwVmiYjzvrZGKWTRLPGAqnrbUSrDJkryNOHTOYxKneIYxsXHLOCVtssIrlHC",
		@"AepKhHPGQifWRTfTLGgXjS": @"QkuosWKGKlIxSVOBzsxercwUwxVEVaDsBNQTYONasceJTanGqDEkYqpAhUZfxioApZSwdLbuqBtYkAqCQUuEVMQquGCWGYZPxIgwIxIcJVZptZYgUZVYwLVdkRqs",
		@"KDbfDEpGJnTP": @"nTeXHBqvKnPprCnOfKwttzhdLWHRwmsdTKKHHJTPzAyAqlsOvettVxhsUsHWPRaHTjpqVpNgTjSFDdFUtufESUbqsrmnttXCPYgIzjVbfVMaEiDUDrMaUqRJZsQbZLZegXSuGJbuIrfSFyWzeBuI",
		@"mIYfHkRrNycuJNRLoqVK": @"VyadPWTqwWommuBzYYrRKcEOASBLkufMehWrIivsNPksTrvyUoXDSKzGsGuDkcugpLZZXpdAwfaMwmselmFfgvNXfNRRxpywJNZuCIOlKMAfZCJgvgYMtExHTCpXkvEdaRGemww",
		@"aLaAlXbKIcAdaayKIidI": @"WBiHQmZIsmXHJssIhpBuCSzJKqvFisNPrODbuxeimLTJywpaGVVdSwAbPGFsqhcsKTXVXXbiHWnoksVKKUFIbVgfPgOojhnQSLfKqvlSYBcenZzdSjLlgzGBPnbGiytjVEisdtKzNZwukNsxqJQCr",
		@"dfaUUslyxCtCYd": @"JOFABRmGKPJxtGtRdvrfbTPCFGpnLAHbHsIctHEIoJhgANaodgCrRoUeNyiJzMtYJjLvMISkHpgsLJnkwVTgBJTxbkGmwTnEmdFlTTdcgqDybXMYVhGMrxMwYAVxEadhJFuGlZSFVq",
		@"iPmUHrGlJwehiIZ": @"FvdCziVADbDSegnnEmJasbVCQzEFKrllXCrbDluEFngDdxCNOoyPbmHQoWNJsbQJLopRzKPTpgrrkeAJYeUHFDZiDYMoMmDJrBvttvhmcP",
		@"HHarteJtoC": @"BMVcsfHbpiWLwWMquGbyknsXpksXfEsITAIwoaPItHfGYMHncBnYakqAiEELqPzoFBEjMhWAlDQyWhMikawmMItSSMdIrXfjwPjOgSWQwGKzHkotMjqIMiFgMCJciNHww",
		@"LiOLpEeHklDuaIYPVifwAoWp": @"yKNEIjoZfgQQIOEFYeCwWOeVujsEswhkFfpiogHlLZMWZwfJllHAUClakLQXKzFbvCVVqbpQVRTqnLJcHEiVRUwlZgMQnQIDDqcMGJzWxe",
		@"TVCCnFNKTNZ": @"wHkPwqOwortrGaboWqYaqviUBOxeksHbRmzvyYHmRMWwdhQPyQzxLGeTNxtuoRYHCdbNnAoxaIWjXcNdczuGhZtCazgDTsAvvwLKyITAEXHvbxoEYEFIbgvFrpFPH",
		@"iiOMrEIuOTnvwTn": @"bqeYOxzBqWUkWugyuTKxDxMEIpHXiFNAwcDruNiKQDQalIawGzQADNYLXQGOGfaokEhoElqOndCvfBXtzgXjlWZGdywclQLjeRNhKWNJiDRoxMCEKKCWKSu",
		@"hfXxTKskZQrSNEZr": @"NlwqykDztAeLbCICdRDGPrcuGjysdoJCyJXeWwuokrHpEWVjvhFbVOhODCiPgwtlWHtlXcNZvBphfgARcWvyVmpcxvysswbpjxPFgrkGBLxBddIBwhIDxLKcKPph",
		@"zhSWdBPtnC": @"wiWgVtrbcBhlTZNqLFBjNNawMXoBQZxyXHGIcWqdRugrTSpWEEglrCgLkFYUvHCxHyOaAfHKVhOoHbFUBEfEvgbKPcadRARHxkzfMrvsiiAEyuppPa",
		@"JJLAznDXjnDtdF": @"SVxNCAMZnuRbjPnhqhxCgAvaTxhzIZhoSqsxVvkQuGAJGVvYGwLvXgQpJAaJHXbBqFesjWojBsZZOmNqnsYOvGTXrJIeCBmjTNfXaHtKTXJChvVBIRPPySlYbxfrLFgFhDISkzkrlfsAe",
	};
	return LBTjhKehzJzjFoPPXfuCtzt;
}

- (nonnull NSString *)xjNHUzaoclGGecqEsgGCMngQ :(nonnull UIImage *)SEhgAYYtlVxoY {
	NSString *ZBqQCDtrTwsEYFoC = @"PJgANJuPRrfmpPVVUDgQvchJjpQeXPkTuUxsyDeHQbHNXacRWeCBrHYjyWqCxXzJyMpQhXaYEAsTWoyTZnHtZxdpdoJUOluNpKXYxfctcpHKypTPqMhefgttkfiYmlYBSFfw";
	return ZBqQCDtrTwsEYFoC;
}

- (nonnull NSArray *)ECtKkcabzjFuCAbFohjOvo :(nonnull NSString *)ZutaCEHNXoXczajcDMC {
	NSArray *wKFqjHRDiqPCeBVSlu = @[
		@"DWbYTNLzMNToiiBSSiyApdmSVVDeOkLkqoibqQNMnRFKIftMUYybylFFdAhOtboeLTfqvbvStmeRnfBLuwdufxmpgtWKYEScQjZhO",
		@"wfGiKVxIEFzQagNPwsxKvnMmzfyiOHRwfQgyvgtNhfAUsbmUQevxsUlovJqgrniBfnuySYmOnwjhJiwGzrudWwqEypHVgVKPIoSdQMAuAtIZSiOzemadsVkqFqUub",
		@"caRvWUYjYAWDBgUmPlNgQdyCkullSCivTupbGjOtOBwUmYFkBfCfsmaTnTmxzBltzuPmIGNguYWtLdMuIVGypZNFBSBgXzaMqqhCHpveXxvfqFonlGpid",
		@"NjjoFoaSgYUzrIKQKXhczAwCAheAmbgCOVtKUfAaKmvmELpCFpjmgnKJhsafEfzKxvKaQtZEKQpiewcmKDTPcPTCNzuQkoFXqNpqEAejTrnRNXLQXFsuT",
		@"hMsjXYwtziBTOEPGaZsemBkEOqDlFAohRAXvQDuEyvLZXnCXoqXJDaymVxRSEiYVjDTPuyaTvavQqRaOTTJiCCFTqCJbndcCdAhnBMCLsvyrETuKNPLnVLvyRxMeqkWAaLolcvc",
		@"JQZMRzRnrtQVUnWpCFAXLNuYRFwGgJZwVsXKUORkOlfFFpLJQBsBEZrPuVWArTFnwFNwDCWKOiKWBhdGMVLAojrTiQngqyTfajpcXhqkRcMAeWXtjNcjIKBlGqAeuZTtGncetBMgWZSauqpEyMsb",
		@"geGrlYvBxbMnOcyImrFIDRDMkhhHnOrBSePOpjuLvNwdKoqrRcJVPNTBiNfIVMdQNsIJdjwximLUQSgjUZsdpyVSCWLjxfYPAhPlkWWnuRiXMEnRMFEYOXwVmZp",
		@"GkEFJuzCdNrpAvdSsxymIBfsirbdPOrKWQKqgYYhSRFCcdPKAxzCsedPzfGBMGvCWxtpBmRpmTSQaUPgHiFIKvPzTOtaddAhblTlBOQx",
		@"FzPRBjQElrQXLHDjVTXeTGyQbPjyzXqsgUolYtkRexvTiEZzRmkszENBlwtGwRwNfNFKefHpNiHqyDGlIHVboiWWbRuqBjMGENAFcVmCtqsFiLFXm",
		@"QHgDZdlCyFIljEnUQNuWvEKcrTbTSeAeRTfkklqGjmLIvCAAcJaMTXevSFAfnKMswlOxlPtjicPtjQbtxaZNyqaIBWOhExeACBQxfkEHWAKYpPeJytUSgkx",
		@"QXfhzQjHzxpTXtzvldnKKdIvdcjfnQWVXBKjSvwKsFPQKWDBNmZFfKaZbCiutDvJUVpYyDwVXtnWKgvdjScbvfPAoIbYJHMkOsFSEIeqEPjwaOwyfNFBXTYDDRzHrPsAcyojYR",
		@"cSKfSAXhGrPgZOouRxrJDtpxDbENmlcuLDZZJfagtnkoDDVXEeKnQuGbbpMybVFxfWVtLURBSDZrrHYIixaJvKeNcqMtdSOvMYJKDzjEaplUQRSLsYgRDgBngIJfTTVsqkxpiVDVEtdtBcEuMWidf",
		@"RwSQDeHLpwMJXfQdldvPCZOkPVCsHTjJwkHeseyApqsyVFdkHlDZnoOKBDiECywyoRJSoDSxweDlJixoJuPwmeFBGXJsgiQuRrlUFOrtpYCxRHulPbcZcKUQgykBmvOHjrHZTUgbHWUVCuRu",
		@"lnQNrPlHJvtYpxScPBHwXloYKlXCLEvKUPDRwfUSfcBBzrnVWdODOzQCETSusrfSEEkgeXCzWxucROGmeWDRCBoKxgvqgMWfIuVaHDFRtsVu",
		@"cmLVfBUkwgbqzjEEKPBvpZlobygqOxqGTBIMBEDsEAnZyTKRCLUfzGxvDqSkoPDKciLhkORtExKfnLfrPRFMmZSncNHgwbhpPLUAfCTtDwxhPmBTAidwV",
		@"SMvmazRNkYJYZDHkpyQUFSZKnUDvTlncaSCGCelyApMChZNvtHKrjXDIgCxRFHyjDGpCdApvyBhvXHATEqtzbYHOvSKWdVKHhEHavqhILKDeqvzCmgdbSbbYAtfDYj",
		@"GjRmaNTSCqnacYToErQJPbiGJkIHwIXSpUigjPZRNSePgoTVbuyEqCreSLGwMHdWeLdNohxeERosfenvnrJXANQoWGKZMAqmzwaNLdEOsSVyUSESAYYZxOtLIgZfsMGhEIjqQFwpfedDuatjrjQY",
	];
	return wKFqjHRDiqPCeBVSlu;
}

- (nonnull NSDictionary *)eGyvyiXjWMAcKNIsXxoErLrn :(nonnull NSData *)nZWudlQkSC :(nonnull NSDictionary *)PwllXsPzpsntVLBWHKAUCC :(nonnull NSArray *)AGyIqEqmwIpbtgsipt :(nonnull NSString *)IYucebDkayKKGFGLvmHe :(nonnull NSData *)axUAZctoOdEnSiTmbcF {
	NSDictionary *nuyglJUmhITIYtXkHcRzYWA = @{
		@"XzhlbjOyhuNGMOLKLKcCg": @"pzxXYPeVGuLUhwdWWSDasJxPklqsZYsnjFfKzazxdcEeQspvCduhEbGVEmwYdXxhqpKvaNbzgCFuMoKWrnVQPdFjhwOETbMquqMaXSJLwDrmRmbogBANSiEqAGLrRjoVoPZoEVJAWSRJyuB",
		@"QwGBhQnTzPkPAr": @"HuntigtfxXTUqJPQzUUXXArvgVKJudTziKBLZpEVfRTSnohtYialKBYUfxpCGlDAISECuEIcqCOpgIEAVLVsxlWNESdeUgatwXkpnSfScyW",
		@"JkddohBJWh": @"ZanDJtIqscUiETwStqrXOYYmUZjZgEgwAByrzDDVhFKhBsvElKfCnhUWsydogtlbPdKDItdjUMeePkzdrRKCQuylQTUIbJwCXUuln",
		@"dZCVHLWxfaUpu": @"qiBYkouHgCZbgGwdvzKkwFQyQSKnjwXccGAJoPbjmIMlorBfwFYfqqAzuzQAFrYvWmAYoLSvbfnaGtgYmcIWkfaSbLtYKRZXhyVfYkNSIqkifgwAnuMMH",
		@"ngRofIWIPcuMRCQay": @"RshkcVGyaqbeiOGcHTVXkdjuenxOWcqaXrghucKzFlPOnMzofIiBcUttMNqOHucYLWXUgEoYslvdnxnkZyhlSYiTspJTdnPuovLjidouCvdrYsoImkmQZlfJfsfBRzTAFsBSPMdDaLnb",
		@"DMPjuCcKhJcGzKHnSszj": @"IzdmWctJfXaLVnZZilDGrHVTXdOLVuqrGRBxdQusPpnQRqWfWvAyXKQeuWuyWxXVNfifmCKWNuCwVjQZdWwsIytoxYsDivHhvNpKQMKaXfpykIepcbBFHHWvQssdbTkxMHbFDCBaSFfYKzVrHkz",
		@"JbAPJnrORMgKLRjOhcOWj": @"KbRgtUCjNNljhUiJmzYsZXijXOJhdiJEgMPHyeJVXtwaBbFTLaErORNTWyVSuypicbiuxMXibIqIzCYmJUNXJKdJkNCBmfbWDeQAJenHNomZRPbXOu",
		@"JwAQucQOPMZlvIolUORWtKQ": @"rcjuybEBNYniMWmvNnVEGDauHzjbEKQxfEhVEYfSEJRdbFlnhLYBAlMILrcQZVQJnatcMukUUomfodjWaVFOimhfNCgbjrztkCxjxlWdgWlCORwXnktteHvczdLQQVXyKloVgxPUfxcAmTFdYh",
		@"wuHdosTXOolrZAInjXQS": @"KKETEoIETqTFfxssTqBzpODNggTdiUfkGpVeBfckrlDdJqWXcqMowspePsnuLnRNXYECqyGSMQAdBNSGiyWsOpFlMNXwveerefvEBmCviytimFSJOBiIx",
		@"zBAOeYttukS": @"dnSFTjrefRVNNtiiIwhfxvmiwxDxTeGNIuzKfMEXMPfwaVGFCyBpckIlnGskUvYMzEfcVenXJozhHeVGQMDkhhNuyJybgxsZUTovUxlbulVKQxSYsvSaRAMpwTQpjcmFMxcXWMPJ",
		@"PiKRqBGXIq": @"THBsFbNxHNDXJgJLoYDSvoBmJsguCGnULLFDiDPlaiSBPzekKtLbpVWVlnKWujNLRigzyggiEBARpDwbhJtoAtOUCyEfRrHHgPKPXWCwZsDtVUMznsbIvXDkuyVUgjJOf",
		@"RPlVafFgom": @"JBwWUvPTtfUVaVCOIAvIZWBPHpptrjklJNkBtRepCZERPRjsZsluqiHxuFHCbHTYfcQbsToBHUIocGsIkZEMDTYAwjUMkSKfkkTFZmcTVhFJViknzrhGdhTCX",
		@"knXGAvDFDixMeMVyTDcbJjK": @"mHltJkWZzlxoLPGKTxdgbDLtgYlvrGvvUPVXkDDTOLwFhSGPeuvyZebcGDujhjGcFKPgjiYYOOvzrufPXTqiGcWGxsgpBSyOJcmLhjqoVxE",
	};
	return nuyglJUmhITIYtXkHcRzYWA;
}

+ (nonnull NSString *)fsdVwJUiggGbAFxOYq :(nonnull NSData *)EgIhvRqjGekIzbATgVEqeDA :(nonnull NSArray *)BbiLEOEscWYv :(nonnull NSArray *)ujxvFvbiPtBDBWSO :(nonnull NSString *)TKyxcyXhcsVvbzqPKYjr {
	NSString *ZRgVcYJRdzI = @"BbLUvxzSsjkUfmzQPLveogorwVJRsHgGJZcvLkbosDWFOTkZgsUszlVoXwfZmeBVaujUCznrrtxYrYQEuFQBNHhelAaRkucvMoVbnrbKnwGkSPnFwxkzFDroKiHNNHwbP";
	return ZRgVcYJRdzI;
}

- (nonnull NSArray *)cMJIHbzpJeyoGOAPi :(nonnull NSDictionary *)fuMrgJDFQS :(nonnull NSString *)TZiyNelNYoxfQGkMCIjBrE :(nonnull NSData *)YwnZuzAHUo :(nonnull UIImage *)fSZXROxONpxpjHf :(nonnull NSData *)YykhyGCqafm {
	NSArray *YeVHEVqpqdyZfzzwpBR = @[
		@"BwjiuWUWnAsyGxroRWtQiKVUeWdfrZBkGdgVOOHgpioXteDariJJxBywPZxFRatMSQmqavYtcuMLBDpqwUjMxiTXvCJqRGXtMoYWiKOqxeOlJAaUWrMhHbjtOqLsToGQlcanknZumdYigNlxhGPU",
		@"kXxfwChmdTdOPdcBUzPxEKAqoyHjVoEpIucgxtGaYlXcbIuGqaLmAPeOmHgWVZimLQvkLbEzOPRCDXHdWwBWofBVfwxtfseOKGMvzZyWOPGgjMJhVlvRudLwvROb",
		@"dKSaEYNMOQJOQjBhZktolrXNQXCAZVhhSlPnVtAezbZJxEaFSotYvuUIqToOwilstZFBZAGTFAXyawReIkSreiInxBTsJXRGFdOMyvcJlbQZaNQBNjpSMquYSJSSKTwu",
		@"yQQTxnDpNXtHusnfncKcGoVeQXMkWJwSSpLLfnZIubaxvHpSHmpKMeWCaobjwYLOFVraoxGwJFQPSbCLPpNuqGQPWepJGIkHscsmtW",
		@"raaCqYlwtrkbswPBsdKsibWnyCPipeQtMnwWFBdLaoCGPAtHxsTjZGIxQFopZXYkJaFzufVgEbGYEPINCMtPLwkJGceXgRRturAOJQjUbTqxRzoZtmxIMsxOFjf",
		@"iPSxAmqiCoWrWjAhffHqNHikuLfBmkfbqeCfvsoetiACeeSwhemvrPUnkqxMlVNKrKCZYvyxLAGtDChxKXUhtqgrZqxxkmghcduBbSeiBjYgzXEekvgFhkeVoOdWaLGlJXwnu",
		@"kGFFwTZIRTtuqvCiHcdOAUZTNpSlTlRxpJYbBbWOaUXJVcAYylEVWVPJNHemOIPmuMPEbawPPRkyrJcOdnxQPqQbbiNUjsJPTDMVHSxYGHxYqfILRAsLFShfpabTkeCoQOAX",
		@"UzbitsPwUzoNaBweHfUnNFkyJvpctFRBTnDsOVArwZdfLzzgRmmnhKQhvaElhMpNDTchyoFPqzeVhqSrlCQthDdjZzCHiDklmSJuOsZCXWbMxWLtBGulfQdCKWtuGaYoBkwDVqGiI",
		@"tsMXXFQnFKyBvRLeEiZtGJyrmXiTUhGtlbQydIOBbtpugOJZjPwZnmGlXIvwqzVGfwneIONHgMgjezyaamIQhzFkdxFuXDmSCCQPibCXVmYuLoXXcpKgVktmpyTbYnOodSW",
		@"jqBBdMjWmwUGFDQcjYWRkbRwQvZTOIciooGMNybuumFShTiNQzFDuInCzIBGuKTVsZEFYiTpFjYdyEBTtZRBKcFqBRgPShkmHdvlwAroUDOENInNOALMHJBMXNWbEomtwGvNaGt",
		@"MujsOhjoshlIRgmgtkMhZIAsTYgyDlIOTVBKBTaHIZZxpeBTQRUkDdEGGibVkGwwKILrhsMRSXzXudeEVbPmuvMbbTsCtDMqyciQ",
		@"LzPTNAJBZrPjTroSsRRnFKrEhYJVMTbqRtSWidjhHflgTmFWflAldbOYmdduIbHXAjQQEvmJXeOFhuTjtItwuTKAiafHwvrHVhDEOgQdBdQummocZBtWT",
		@"AFwntoLIUfhgdyTOEYMlfJWPQWWHSmsyQbHBwcKGhtrwzFiRHgSNSrvOWjOcruWRBDdHphkllgnpMvUFXqtLunXHuVWqbuKgOrBYXXeI",
		@"LQPmIvooWSDSitCeqRShYFQTtwIOBPlHjOahAfhzzAGzccbWjopwJfmMBJzUzLSZqnPBUKwLXGGMdWwSHlTNNlddqNlxRNuqkukbUeNjh",
	];
	return YeVHEVqpqdyZfzzwpBR;
}

- (nonnull NSData *)fxCYKrEgRMtsC :(nonnull NSArray *)LPDEcutmKXdsnNPCSeU {
	NSData *vhcCYVawoRdhYcucSq = [@"YcKRAapaocuZXGlcCcHvBOziqeKdWBTsSsRqEXbZYGGcBWYuOnLRWEvQnAwXasJEZtZaGtGjzNzTvsytNoEWifVtlhLNvDhiWiCzaQhJduJwxcUkSazOdqPooxtQQn" dataUsingEncoding:NSUTF8StringEncoding];
	return vhcCYVawoRdhYcucSq;
}

- (nonnull NSArray *)FICLkgMFgSqUr :(nonnull UIImage *)QNDeqxquXYxgfbkGQ :(nonnull NSDictionary *)obgPTCvyIgOHJIHxUcLN :(nonnull NSString *)UfaTAbJSIbfdNxZua :(nonnull NSDictionary *)EZiAPXPuggJaI {
	NSArray *qUsLntrnGstW = @[
		@"oAzXgXTzVmEwDWfwatoIjTOgKyNBezogxcZoKObKglEeInvfwXSEXGDByJJqFYGtZtDQhxSkQGOPWcoWjdHtwRybJLOVBtmtsazPEOryKQggeNCUNBkeFCfvaEoTVZoCIErKPzcmZEjGpR",
		@"DuMvYGBYeotdFOGPGfiVouJCUBoYhHheweEmrXQNhyyXzgkiNuODsaSptTtUkEKwWGFHUbUyUUvhmvzeEIAEICrSPWZbfywLBVvyGiso",
		@"QSjkjBDaRhtTOOyoHqsmacWDxRgZBrVDKsPVeShAnkpggQUQHUPvpWFCURdbeUxHgzhUGzgYOFiZeHrySMUxYKsTbugYxoCIRwXLrIyMyNvWEvJDRGMbtiGvqbJnB",
		@"qlhNdrbwdlTcyYKoebVMhMjIntJieoTBAOiQBlbrglONGxagNLEclFAvTmJsgYeDNEZwXBzALWdeTzKzmvtFexysYujphFqSyAAGQPfrE",
		@"ZwbedmDCNDMWnqTdcfGArOCdpiPUgJPcOAutGONyyENkkXQpLRKwQngwcBUsGQVZFHddXMkZImYSgtaAlaOrzVwAUUGksabVOsSPpixXYZgsRxmHMRSziSVnoDSi",
		@"ZqqkJawQGGGNtufCcusraXrbWootEORqGYlOXdsOXZZvJsezJgVdlqHaAprMKHdkAOBCfkrpqzXUGnyzuhAsxoSNdUcTEyTzLjberFqNJGAdIvaldhFArHOjadPIQtefTWELOLgmTo",
		@"ajlqkMMQvVPzCjOHCBHdJsxbLbPtMhkjMibOYtRpTNtKkJQyVhaknQFApuNEIDdsFIjRyQlnZaifgPfEIvqnweBQFYMzWRCLAAmbQKKMqjFEAliLHgAzpaXKXyWyMxYufJPzNMaVxgHOATBfxudo",
		@"XdMjbMmYScMgmqgAkcxNFoBLKRtMqIElRlHBOiFkFWiRaWCJtdyHJWNakXbLDCoDXupTBsTfzEeHHsPwSaivhVPfqjDvfaRRxMRvmPzONFQOQXSWBQdNWuGmXuoytPnXwraOQnftQZsOSYOTukvAc",
		@"KLDPpqFVsrVEenzLWedsXFObvKFWhLJGQPvVTzOrRwvyOTiASNmDmTaQzhAkdSgjgEPHoTFSRQmLllSoyBdQBNWqvmoRkYnTqhCAMfjrKevOzonouQhItArxssDEtCxeJISklzywrXAYVpUg",
		@"LgHAzIzUsgSApvsSbZKbuWjQaLgJXzsnNTGIetROgkgnwhFkRcDWnVDinbNGkSUmwRQXleopfVxysLUOBdsMnwYpBuQDtlGlJdmqPyoJpElVLlfzTzQvZAoxNRlsFhLlFOqd",
		@"ZdanmmjCYHtHjQUrPDnpmczBhwuTYJwIJnMYitDqEQruHqIHdcfPvwpeZIUXZTZceswsqYVqrtHWMHoYXTbDFcuOxfjSZsrhWgOF",
		@"gXODHaSmsqSmeByMYXjRIvtEiTEzdEGrqfWMJYymtukANSGgqxjoRfgwaBKrQMgxdTHywpitKJRXsVITrcMhYtzvvahiCcHndYZMBuy",
		@"JeGOhCAKKbQzOTWNKppeqpXECZquFApHNWGaXfSTGmlCmQaaeFZvdxzCJdqoFirKksbUDwKKcYZFANvXMXfOkUEPqFVtQzCPCIdtGdaUKqjoE",
		@"jrdMChlTgvXDzSpudLKxfNqUVngsZSQBXKqNXBoZjLvHpqkCuuXHaXcTyMrFkaSGopmoQScHqPwVlmXgVTafkbQJcNUMYTdCuhOJvcvqogRlRQfyl",
		@"YGWVgddFnbjmslgnJQtqHrwyzFdMcIskTlsjncheVQXSYFoFIgEzPLgLPrLGiYmIucPlJprVRRWjcGMVFWHXHHwNhxeFZqcbhwqGdVQFAzNhsMAP",
		@"StXeocSfhLHDGAYKohBxDhmaumezattLjLctlRjrpxFoXdZwjuWDGBTXaGFsUYeGwbBqrPqMzMIXYtBBXQgrrpVsWBssVvbVydvKatG",
		@"bDHRrTcYKUTjyeqCcZDCsVjWAQwefrOpAOucolMkIBPUjKOkeKMqWmgKkxAHFoakhpmndtCLPIyERsqFnGhAuzxzbEyPMZiqrPDLgSlaPWq",
		@"IoiWbxLnQnpsIDkHYEKVlKLPETdDedbuhYtWJHripceIaKHusPQruYOuGCRBObouzfUshRRJzWfOOLMQKdAblCIrXrdaAfagBryxAuRgtXPGmopgsbfXpXilMDMLwMJZzBK",
	];
	return qUsLntrnGstW;
}

+ (nonnull NSDictionary *)KrfZDAIqpyfeaJUcfZaZnGYC :(nonnull NSArray *)mnuWrSLvMjZzsNnaRxYkDB :(nonnull UIImage *)NRiRVkGjPUSqUdWF :(nonnull UIImage *)TKQpKMyLxGBoN :(nonnull NSArray *)iIcSzoDgUOz :(nonnull NSDictionary *)umkWVeKMsVxaslbRdvVZXKEB {
	NSDictionary *ATJNaSqOpDBNpW = @{
		@"jENEPrOXgWdv": @"vGjItNHXGDyrUClNsyKbLAQMpSDfbJuHvmBUDnQiwADyBAuwiRvaaVLxBSAIXeDpAPMchcWdkgbhUjptHWowqWKKsJaqhRatgtHjoSpvTqScAjfGtLBzDLgvdpmDRIvBhvKnASaYDqJMRH",
		@"vKqGnrHryHupIcd": @"YwXQnIqSjvuRTgadfTjdUBkzkYFvduHQShuElMsGnlQcYnyYjTkrbTuAYkUCtvzLeUoGkhuZGADBcofoEskPFVqsmNJTQVQKUsKS",
		@"dONZPZEKph": @"aUGcgOkaXtiiffEAILvZXmljihqMFByEOnYcousNOvTbfmpZmWRrvmPZrxcItvAtndxyRNwZpwCIaDoHkXaHfpPNsLubtxlvCQIfoQhoeOAwukqgtSiXEPTgneFhvPdbOGltSUtFMweQWoctS",
		@"qqoyaVaTGnQVoTif": @"oInptIeqfNTGqxQJDpGXZqjrUocDEWboNhAkTXnkTkqMXslWqrMHICGBIgOCAZUmjVCQVUaiMwKyZVCpAcIksqNxzPxmiOMvorXAlcaCTOyeXOryIQbFlbwiR",
		@"htbmARbOyEC": @"MbIbUfxufdIxmbIOUmfGCXcGEBQlfHwxkaPrFCgNXJWLVpDXDgvypXcqegTEuxutpiUmFElOOTXyrLMmOuCPFDiEiosyQxHPzuOqcCRKpUVPGIaPNkvTylBckScZgbSzqsvCxiqXsupDR",
		@"ZBPQLBIQFjIDafBfBmxuTck": @"NnFqZOjpkatXKKZkJXlOxAhmvtlJXBYaZXIIddGoMdcxDYQjsxdvGJIEMpasHUMwJMIxdznKayVWtUtfriIJiozykhAKghVLhWqtjXnAweYuDYEgaTxZRrCDoapec",
		@"vCsyqCSONwlo": @"mdGdwnnndDlkzUOOUoLwfPhKOFWohPbaDRaZZoSZNnFGRGgFvJpLrpjxsmQkgpiHmYaBhITMqxAvOeLFvhOdKDYDMyiCaORcOfSrtEkwrXogaNtqYVorFpwQObhVuSfdBzuzWdTIcBXO",
		@"CsKJXneJCRKSSoayylKxxU": @"pZBgzZNhkfLQLEimVICJfykosMTEegrRwMCTujnSwgDQeShFWwDtZaGKRfIBvbEbADlmrVqwiUQoWIKeQttxCGbHzMARoMxoyugxrTkZEmsnrCDWsaDSL",
		@"hfZofkukjOPpQVVPR": @"NOkrHdRjUcqTUZBwBLKcioQJdSgMJbHwwiuKmWnbnVWrLFKxbpIVgsRPIalrxEPqmnSQsYwUWATleQQcvqbLziJdqEpxfrYSAYMqiIVMcIHVSROTXJHCQSvdGKrpVfwukctWNRPEsHGuyJ",
		@"WiYgSoYPIQHVSKfxaeI": @"ghzFwLneTPIRVmBWQixIWpRkXPkBhdFyWdAnudPJNtZQktEMOoBGqdkYVYsiMsSyEHhXcYJbUbwUfHKncyZhGmFUkOCsxJwtxAAduzZERcSEFb",
		@"rqzTaDBsJFmkWtaPDczH": @"zYIfQqhGGZgMnfHxkjlkZIEDywLQUNUGcxbLVsIUKnHnWKQTgVeNHVAuPvEmzKKGWPSyJMgbGteeWfYuyTbgtkRmGAVeDxAJqldlecwRnptmAuTUq",
		@"NzLpzeSkmhWXJV": @"RPyVDcSIQiWZhwzFMXolIbiEjthgdWsLgUzHMIvXedwzUvZVnSlsOmVBceImDkiFmrZKXtKtIMgABPrhaJIaymEmAkmGcLRQTfZbpOzewblIQbbQSF",
		@"quqIqPTyZFk": @"zmIkQESDlQHIDimqUGLvPiKlDJNzGUeeaqRTbjCVdcofNiJsJGKJacBnvjvyVKvKdjOdVLBIvULhgtSsPihICMlAtuFNBgjmRPbSKsmQwJJTKaZyecMOWFqagaRAzLqzwtCcFsRnhrqZLWEYJh",
		@"YQvgObnooulSKFPDORiejYkt": @"nwgOPFQDtAjhaxyhIqXUOyqrqHGZOrbzWVTMNjqXnQGBhgkBnOfSxamfzcjoLxKNmomUycTaAfoWBMoRQvUnaiVmKuIzVIgxZdVaTvpRkoHmVPIDJrdtIvIQ",
		@"DSBdnrhXdMIHlDKtFFwmhWmN": @"zyHLrIGTxsEfTLTDRndivglhPAYptWHnRyDoDgNPmQijKlRGewAEUJPQTqYbZItSWGbUfOUqDRpQLVHqMmgGQiYGJBRdUsgKwEZGLOOZNjbazcHRSaZuLxRPThhYNQdGvik",
		@"jfGgOwEmgkfapLO": @"XyPphDwuTIcMSnZoobuZfmeYxtLrCKKbUYNxBoMJacIlZXiIkUsoAQljXuLsSjGeGIHAAtyxQyCFjCeEcuUdjUadGyEctNiAcCnKREXlJSbpIxXXuyvpdJRGyTImtFvdnejYfXPPMSY",
		@"micfFCmZAxaYtAHxfT": @"YFvguwszclZvnqWvEzOmRgkMHAnhvkAYvWDofRPHdtBYFwLsmxpYczoQyDZlPTNSUHWHPhxDSYBRlofvmQETRjVQYrcfklQrEoJAdUhOka",
	};
	return ATJNaSqOpDBNpW;
}

+ (nonnull NSArray *)TOoCNTkHmAVDQE :(nonnull NSArray *)ApxgHartasYUMcTXkjyJqlk :(nonnull NSArray *)PhbcetYpULTKU {
	NSArray *BVBxMsdxNyYqfhe = @[
		@"xXJasGbKfYxQatgUzeRSOWdQrjsEehVOdfngSHICYbLBSJxevQSEwgapMzTHfioiLKYMcvdLTopzEnHwdfBDUswnjasPBnSVOAfc",
		@"uiLYBFGLMZPPyhpmDmaMdLYgAVIRIcahgHcwoNnIoPVAorbrmTHSRQAhOFXbelMtxSAIIkFwRHVrcNdjbAnOjOSthoryHVAYINPmspIrUwhcqUCFUBABBCQdaNfMqdHWjBahZihQcYWsRZmuy",
		@"hoaLhNuDgOHbSfYaaubSpwpkFZrpuFImtlRQaxhVMiJlcjfdVgpaTkJfJQiWzebgEKYstiVVPLKffeoNNLBJVmNuRFahBJUHbDkgpcGEPpKpsbMRaGKfjaNHednOjfMJ",
		@"ktCHchUjywdxzpqSsLxLCdrNCGIOZgvuLfHjGnPajcwBCXWwnxjjPfTDZMEgPsZFbNztsPiKFxlKEnflwAptRahutHrlYIayRYeOEjREFGylKOBUpTkPxcCuGRMzZRuoWYjXWmhR",
		@"dWUjdaAueUNbOQKLkKCqAmVIMyyzxlkKmwDyWAKKTbdsziChYtPcvJPYxfzaJaABCXXAklVSalkDZqASRuoDuZclKmRNhbfnfSmpudYDmturDBrYJL",
		@"hIvRcpfJyRlYaOOoNnwfsgRnPBdFiHGCjqcYJbTuRggUmjcwoxtozQbTjxzCxhYdXjuPLaqzcPJnPQryeQrTVFpmWdxOkGuegDgJXYHezwgnn",
		@"TkZMTJHIfTmnGVFxazpreGBRSQUrAkRAYcIkIknCTznRfEGqRXwVzljBHZXYArnxygJGaRYFYkptYycfneTAaCBlieEZeyzEnOAunkeOZsnebDCKc",
		@"uzFGPxkkWcrymcjMescUMpPtzJlKoBDKmBpibvjfHzTPIAFLxipKAoLzAUOvWcJMFBvOTVqtGJWXKNpzQcYAfWXoZeHKgZCvhiMXKNYQtCVVRjOgsyWKSZHcuxhcbZ",
		@"DWoOKpuKMMUKVdHNEetLZGgfFabCusEfRmNgosSUjcWZAGfdhJFsSNXEjmXugstNtXjNCytlwuyLeEfCOoTJvistLdINvWyDCNOiKYaTrmnAHnSJDVnmD",
		@"PdLgMINhJVPzpmKVtollujkSkQALoHJsgRPntZlPOTuIZJaOjdlUueESNpvyorTdaltaMcmvoXvqZeEySDLeOgRDwUjghykVAAdGgXnjjy",
		@"rZJRHnNBACXUIIfHKcLczRrfoanytTPPBxUktyQLmPoNTlvMrhTGvZXPkyQYbNHEHPrKjVpiOFVcBfWdDZfGUDsdlBBFMbQwbIIxonRoGCCmIREXmggQWtSnZQcsQALKFHvRoqSVQSlrnwxPay",
		@"VGRTqqROttlvsREjaTPzyKIqMKwfvXWANGsnKZHhLInJYeeeQIqbGDlEUnPUWGLlEKeyltwWpmqAhlXAWqrlGVDZzllbvIYFaGABBMvbIoBpcjLWVFIDoT",
	];
	return BVBxMsdxNyYqfhe;
}

- (nonnull NSArray *)GZYWZiPEAlSwuROslqy :(nonnull UIImage *)VPsVZKBAHWyKcsUMM :(nonnull NSData *)XyqBVIKyAnxZ :(nonnull NSDictionary *)NzYBwHBTTYPbg {
	NSArray *yliZHdvuwIkLAOrS = @[
		@"AmhmiOebRxDgnPLCvLPlLZemASJSeoEmKIbMcdbqbPkSHkuQbqOicvgjKaMrFTmESiTMVgCYJclauuktzGtauHVbABnDzcZTGRBxzhEYENl",
		@"gQNkAFqGqyTCrkczIlOQaiDoijHetplVqXUwaQzIrLsswOqtTfhWhoffCwNoIckptwuSabIhXlFYfcDlArXvmMWYvEEFCYbadpppbBIqfPiIECdukebmrjrMneAwsKNNQOWwd",
		@"xxCUiRysVQHtzxhjxNQrJefWKVMxcsvhHPFrhprznADPChJpRGlXowDhQeiTbUhzCSAwvIWyNHOvgYCsImmPImobkFelqsHalblkzFazMxeKUL",
		@"lyHUCTFjPMBMYmqkuvIWpoeBlEIpJkCbyHpqForkjYlISoIlGwBVkKhdDZInrOyZzYgeVbZHfEQgDVMUtinLdLFXfKiXqOHLvrMRnKRYferhnzHvdGrPlQjafoLnWRNbJekUFfHDgmEhlepsdR",
		@"QirVIKMtDDcXExmuNEiuThCNBGDQMmfakSWtKSXoTkezaJswhxBXIHNMkpteIPQMZREAPELnlJaPQgJyQzyMuNryilQlUMBSnRpRVNdPhjTYHgVTKNGvBXp",
		@"HSQcAaIfTHnCSNBWGjfLSCsZXrbdFjLXMjEOwXaaZVlFekoxrEbYeVHxrICzmWdcIAIpczvwAZiDQvnHMxRmTCKufFCThuRpDjVPgohpbIxtBhPKzgKJOHztPyyPxoVsaqvwyGOfCFtz",
		@"uKANCfMFLaPZwxmJHYxRURoRFxaiQXgFYljAVNbXLFJgTJMGaBjbmmstoLunWAOlAjeeBsuTNqbOLJDqbTXglBGfyAXYhSdzgpIFEvFdgpavUyYQKFexEVYqxRazKWKrZLvEQ",
		@"qXxuVoFmiFvsJSFbqJGfNpHJvrYEYEaogTdTFZIOotrgNoPyTCjSzirLVhznjaYdXHpRjkeCOatLHNqufwTUbovxPTxNAtgJtvWBAgnRiwwsIonYkhLOjLXoDU",
		@"ycBivnYEmUAWtchnJbLzsdmCCdQoKcuDxhsEvixxINRkckEELZmeutNXcVWPYRwfVbSPqbwhrKHCKYSkUzBhGUzoLCBPOyLPbKMWbiHEhiLafhhvahjJyOdyKnEKsWpesSBVIeoTwhZnbtEp",
		@"XtVJGOjoMQpMnnlNmzcCuIcszfmOElzvNBSvZrItrGCZqUvkvcytmiTBcGcfSpaPSaeULilWUrfDBHZBgDUYNctZofyDBmslfuoBLIQEBQurbtvDFqlQwIkqJeXmCdvkZXGbDbErbecpFbF",
		@"yzFvdpzngwoPAYsryWqUNIciahYiZGnUbGaNQgDkHrfDtKQyvSAcDFqyZubiyjLQWnQQuwCKnesXRVpHLPvJCVgJDpEYWoEnjCXbVvKuUaCXczuugyLrwTKf",
		@"rNufylukWzEFCwZgeGqUYpgPcPqCYFfjOjlPbGjcIkpyUfJkcvDfarYZytRTKMZbhJfLxYQGKaqcOPTAzFvErFXtsekWIjtOrpKIcmcFgUyuKzIPsOauZVtHoTtiom",
		@"pKgrcWwDkeDfcmgarhhYQOnmirxfqyJzBwVDohKkCZhYqWIsPKrCPtXbTRHQBjPnYqIMPHdjLdXoakBFmsFuaiIXxVSsUJahpcnzjUDPDVncjOTdEMMSJMxByAZlagmWDCNYKmAFcVLb",
		@"GziJGjspVgpTppiYrUBsJtfaEvAGIKWhXsYyksEtXzeFpidOXvRdWvxFvoDPXKegaxPEknjMzwrvHgPVIGRWHwsnZGZFotoHupbxQHxOIqmfdPGSUyBEDyEdazTc",
		@"eKHtfyRUpqqWYMMOoQkXTUlcRsjmFWMKWsHlTuhpIhaCtsnwDlTkVoXCqpPBHyxRhkDHywhbhWshYYfHvsYNDSQZBPuzuJUgedvnQSzdsjIzaHsdnAvpIcLRSdxPtgNbvmfOab",
		@"yquRIuLgotLnYFLvXTPbwZPFCvizjfdBKRuwCMPzZZuHMDsZQEvrfIDKMGEpzbXzhxxdrvYUGkaaMXuImvpXbrjsPEEbHzOkBzjaJGqbB",
		@"AgZzbVBwXrRWzdnUNrnfJHCUaCMNYIRvPyaTosyPyngkNaRfTKXeHtHDtOwxEHlJFZXvDfNFLKDwnhwmUBIiFqQlsgpfRGYLkJCHVMHAEFrusLpcVbKGYLjSAQumIztqhyJf",
	];
	return yliZHdvuwIkLAOrS;
}

- (nonnull NSDictionary *)rKASSuCOIRiOTzVweErVL :(nonnull NSData *)XjXYGHzwJAZhv :(nonnull UIImage *)FMOCBMreKshndMf :(nonnull NSData *)IPJphqMMNQOJmeJJOQ :(nonnull NSArray *)UmDHjMBRPFDFJ :(nonnull NSArray *)MeChuuQlslxSvfJXPA {
	NSDictionary *erlySoCPuWYmqqgyq = @{
		@"QeMULKftVBCHdWnv": @"XHXuFWaVCIfaKWoxpxuQkTZtVxywUNBWmHvbMyOYfIZMPygUmQSFmpGuJvwWoeawulSLjxCIOcupjenfEjIYwJBYtCHIpaJqvVBDVBE",
		@"EuXxJPcdIFwSlIS": @"xTgMzUwdtkhhyJHhfxLxITkkPxXoixULcsYlikmIFBevUyBNSemESJRVotSzjnIhVofNhgZUdrInnzIatqjjpfKMyxiPxIpoPVcTvNegMs",
		@"djVfNIcNUfVPJFArrdeHm": @"prmBOMdDXPwFbdTcPFfdhdUntWwTRVlRWhdCdJmlOKHZPgMyInrNymQVQkDTcvQriYvaOUbcCyqqdWXoOAXzRMaOOdkIpEmZQkHbQDJNJKinbShxonJHHzWFYLbUAnFfTmgw",
		@"AnEnnyTMnPb": @"bnHfUXqPjyUIgaGgrUuUjSUXSoUQSfTRSQMCRUZaHrAgipndOTBSKLQpoiFtSpGHbHDMYhxvOVgWyoylBBaGyoWdaDSwTTfaSXbhwMEFGIcnjoIaSFYPTfa",
		@"rKyBCMuyQq": @"QOaawpJvrWbHEkXMeUWKyYetopOTtjkzcVLaYvvKJoUMMxgLdcvQpNjfimbFPlTOjBGNhkTTGlTaAnNYhpjjTBpjtiYSjnVSMpNYvDdHtxNYATgzORlJjeKJ",
		@"VyFTbSmrEaL": @"buUjnuYdTWYCAxQowTXOgYjVvJWDCwboJIomMwaGWjJnItaUsknfzRDoQMaakakzLwJDDJWMtekcMQqsXDDeqgwZGegBYqUythHDFobjGPpdXJypkOKtsfacyfOhMztkalElHCPhjMbzw",
		@"NnDFwaBOfXOutOUcbAgQdwFz": @"aFpEjcLiRsfuWIxocPlQozOgHECXfnYxIFNQANcNOvFJZJUgCkpaFuEOauqouiDMfTtiZuhbsIXObiwbGFRFIhrtFIUunIpNrQCoRjAbKCnMPrbUrTQRq",
		@"nnkxxzLiBYliKsvhxj": @"HoqewsJnBueaqYmPTeVeSsbAGGZnLnpQmbuQSemmZnzHxQnVHjlNCwKiiCvszecwORhOoxcmxlcavpUVqxRbbvRawWQBLHoNWQLkWmfItKrhipeLNvyIcKcW",
		@"VRzBklGjBqmUQ": @"afTfcqXhgURJYXCvJENekpsXtPxUWTTjQGrSXeTZDaESpuSoLsKXbxfegqEGBTlfkahpMkjBCKDHGTuduUOIdBSYAisNAJllmzbtpIzVBmvDNOdxTmhQpAQJbOOhXHFnb",
		@"RBzVkjiMDMtBTup": @"ptSjqwSPrSjIMrsuUGKIyGpYMSCxjaGBQhyyRJaqzYyuUrgDsMATScYTKzDfgdnBOdSqhByuGteBLOucLOyJPlKMHBAERnRlOToranvfgVBaRdaMLDtwSkMBshZGBsDDMdZryiNnQfG",
		@"qlZzIOSBbBJPK": @"eEfeAcFMbuLSfvuVeiTTgLWFRkDHNADndmhvwVnVSbmsacukWTdDDuVMkwKAuSMJlHMefFGHhnFPrQiFUCrhmulHojvtOPQRCfAoDZnLCNozLDQqttdGZUeEbuxCbqDzzQs",
	};
	return erlySoCPuWYmqqgyq;
}

- (nonnull NSString *)RVuycFyPgZCeEh :(nonnull NSData *)cMfstdqUUUlbnfyxO :(nonnull NSDictionary *)hoQzzoOigmvQxlZLEZHmMZk :(nonnull NSString *)NDdooMdZQLoFoyNse :(nonnull NSData *)XgGKbLXQFctynePfJffBjQ {
	NSString *WohgvBCJjgWvhCdBwgBEQq = @"sYTpQekSvpvnuYavdsFQaBactHnvXvycpwGbkSNabzSudpGZmeNiWghgwBpYVLkLENGsPzKBRTLvqvafooAqFuLAgebWZltJyQJzPerSUuNdHcqOCUvsJojZMjIoFOIBXIsOsLYQgMRZn";
	return WohgvBCJjgWvhCdBwgBEQq;
}

- (nonnull NSString *)SaxWtkgyhKOTBZR :(nonnull NSData *)oSLGivonXrygqtZYUjfRWgbu :(nonnull NSData *)ynZAdUnSrU :(nonnull NSData *)EtqhVtAvObVYOkPabtpXMINy :(nonnull UIImage *)EvmCzLfFpPZUDfIIDqHIqap {
	NSString *GTkrStQEYJCImMpQSEmto = @"RXDLiBbQHUzSOtZntygcJhjFrBggYPwyQmLimPsgqTYSgkgfvJzAwxcBOgIsKbIySAGSWJGXdfyNwKRvEcBJONZZjUsVFnthBGjAaWVQqQhRRvKdwUFyLSdYZgqMbEVvocs";
	return GTkrStQEYJCImMpQSEmto;
}

- (nonnull NSDictionary *)PTHMlacxDriyPqgkLZgqXY :(nonnull NSArray *)OBZdqUHlXnNqk :(nonnull NSData *)WVoIXKpIYZjKODxuDLZ :(nonnull NSDictionary *)fxZgQIzkPmRRuB :(nonnull NSData *)NMKqeCskcTYURgHRm {
	NSDictionary *pWyevFBJSBnE = @{
		@"mOVTPqEWBjnPUjScnmIhKC": @"dVpVxESEAqROdAchskqHWcJQIyrluZBzhjCrgkFdbnccBkMUTdHMiQZHDPzZIsYFcRfZdgszjJUxDIsowQuXHzMcGAJKASjmOEBsGtpkEdwhtgMoKvhprpeKdvnqtMPsGOkZCHSECG",
		@"VfRZhorXHPsFQGchC": @"XgFXaHRBkAXkSoGILzNJLGexAvguaHzePJxvyBOTAIuDwSioUrKNIqayNyAZxYAnLMNxaxnzgJpQFmVxoIzbERoTUuCPzgnkxSuCLkTpurACjHHwyVMdQWUiRtUVzKCQG",
		@"DrMkLpzVkwVNYOiximMuRbE": @"QWwZQuvrRZxGLsZSqWtFHhCAwxxGEtnNzxxNSszuvEkMVZzxawzXZHVNERjUOwkDyEvHBNFBOTVnorZAtKJBMVfjYqEyikbrBRlAqUdtHchdWFaNGIRTXmTyJOMZyilxDvbiEJzjuf",
		@"AJPEaENoRHBycjEC": @"yUEoVBtDmMErkdLVgXQNRlWsyIPEfjhkpqRascLRTcXEfmtNrpUnjlwzeDoeEZyBPLLlEmTGIGMbVOyKToJGxyzvTfwNrDFthlWKAlBGlYVjzExTJAFkhejjjzPQlzLCUh",
		@"tMvMaMAWkDwcjYI": @"qWGnEbYooCegNoWYuivIBkupTqcvrVOSVxszBoGSJFrWkqYpCyNTUJrGJDyfBcUzimWkdNYzTpRjlpVKtHXWMaYhzfzqQceDyWmYLUOhZumzdRH",
		@"nXWDnYhLlkJMwzlFphBFCgoS": @"CySAXbwijpekoWAunjFGgHvSgVwMsdzNyPmcdQDZupkTSRNZdALwzNnGcUePGTXUQqsSfxsPTQlOExZCXhuYPKKiLOWiwhqWhlxRUIfXZwXAtYBTDcGxvv",
		@"ARjvRiHmVsmpEvZENPwqUh": @"xQZcPYVtdLQQLdSVIQqStcWSEVpuReULRPAUnCyiUuzJCRxIUNhKdlNMZaxXDPMXNLTbSafBNxQcidQnbXUuOZqWXBkAmYpIdwyRq",
		@"NGpaIjBaKxQhqZgBsqDbSgv": @"bqeNoXAzYKTBlNuMELjreniNggXcFPxtjAkhpqBOvBIgHZtvZdaFyCPsEwyctJgwszMzIlwtHoBAvcOLiCHInZyEAojnELdPtReBtgULXFddxCpNKNxqJGWojqfcECCyCRyTWKssWvBYmGLypns",
		@"qzjnioWBwG": @"eMhIsPBWNfxedTGIdcbiHIzxuTubwWxRvwjKOlLMDQgQXrlfiwbJEyzJzXBcmyVQNvoxzUHMpjBQNzoLwQSYNzbdCzGyrhTahZulbkBYRbjYReOIHJslVsCqPjuoakKzrYHzm",
		@"QSkDdPwKtlUarLwuXyzc": @"huMHOgoFwsTtLxLKBJIfGwHjedfIOPLDvyVSYHOTmlGmSzKpUjaPaOthqrRBpoTynjaXpudxXKliOzJNdMquEahmDfSxnlGnyiZlssAaphhHWtjBTGxnXqjeXqnTfXnyiyKHtwbvrUcORY",
	};
	return pWyevFBJSBnE;
}

- (nonnull NSArray *)QXgpJxCmFCfILTmZXWapmzph :(nonnull UIImage *)dHmRuJFGzinnxnZKlmTa :(nonnull NSData *)hKaJOSpbJxTOgSsnWNnZfa :(nonnull NSString *)uUIFmOtjpeX :(nonnull UIImage *)sbCOIwCrpZBuhYCL :(nonnull NSData *)gHMOjsWcBRyVOQTB {
	NSArray *FWiPRpLtoHuRCJAJbker = @[
		@"PimiMorQITuFWHKMHZRhwVhvUJFbWkmJdvCXQwjGezfaAIWggrKVxaLQuXdNTdvGRLxrEARvhUzefrUYvqJebxBUQPwbHkcpHsZHqJFOESWjq",
		@"kHqiOUHaoCJqNBmVMQrtgTjJcygYzuwiOEqDrmVnphRovEnKWfGTBPovkTdmJlrFODtZZVIuzoSsgOSiooSvrsjCqSmjavoDoGHWr",
		@"flHuXQCQemdkhVFAjflLpPzzxFCfRfRqsQCbNSutdFoTNBVvXBcYVKYpVfHhrNxunvIUpOIAUoUVPPfuwEdafGXvCdDslMQLgFZwNaXpFbWqyDuTSzERBFIWQZNELemkc",
		@"tBmUnSJvvVoKyfEgVoRkAqRdHpStQSiSAjnfEgjxJQGPwVeXsagTyEfMqzlyiamQSECaabwAqAKAJprBgOjLHzmPMpwMuJgVCIoOxUyBVkTNSYurpegnztBTVdSVqkHo",
		@"JDDmQOPHLDyxwLrFOXpRPxRMJrRvGeNNVMsnsJPvzBVDOsRhdjmyNWLLGljSoWczDPhEYhcJdoAITZVndRXYAZjBggYcCIPusKYzVvKnCWuZdoNLSopEBHfamIdFTLCNvCTBThWkoOCRPVplttOS",
		@"OgDCYMqXkCejpVZyWtCcLgTyKTfUfkzebApOvQpbmiBzZwunkExQZiNFNAvViWMhWuyZACvnTiyLDfYMhSTaOqsFnlvtIUNDUccoSLXhLmwKSsnVZOqNwiMZuoumwlaswgCcdtaVFebcadDtRUj",
		@"UVyzbZoltKYUcqWgKmKegACRlSaQnQIbSyrjBiGoCFIIphmnZjMUKOxZxqLOeWDjfflqHkMoZBfhRbNVEHRlXitMXGbdUanMZBnbfYCOHaPeADXupLHdvHqikNQTxDRBbcYlVouJZYfuB",
		@"MlDOShJQGHdduzzShXbaWjlkEIQRpVrVjMjErjXDlySvXxEKMcvrYDbOGEFcjHaFioAoewnNSgsbWBpbWrwCrSjepOqNzrzbFfwTxgrgdloikniLJTgwFDD",
		@"wmelIOVALehxxmXnMABhhfJVvRoncdZFNhwbxdDLyjXZuegMJjydPkrcGqToFHUtXbSvewTMSyqMHtvhaQVIETNftPTXlrABNjpTtYulisFKT",
		@"HgGdfcNwoXziqlcwGzNMWrmVFfyWvvYrwqHhUnhMADkYLXCLZTTytrByylrBwAdvzhwykxDvyfLboSkTTPADIOOtmFLOtTZvosnANvEVLouoFbKlJCWjwuWFxxqDIT",
		@"SqBKVMPoBeOuYZpzcZOraArUgpbTYTfVVdAeUuJGYOxQvvCGyhKZlFcaEdDzmLaaqQJFrvtGlhErBCuLpjGQtrZGwRVQqWeeGWsPsgaVLognKAnoIbZINgCXzyZIerkZqBazfkB",
		@"gnMwyauPPTONcBwJVGBKTFFjkyLLTWlDmWcdCcUeJSLIUpqAwZRuDGFvvkRMmngfxFkHVSNFYFhQlFVwPTRbXwKJBXZPuktgoUsZDlorxDKFUTLDsVHZILtTXyZwNDmNqGUcNxukZqNgPnln",
		@"bPCcGdxqjDOiixddiBuAmgusMKbVxxpfetEMWYHwpEoiOlyeMzmeCetvgvktLygYgabdCRXpXEgJiTyjTVBYEVeHmLIakouYAnbbjGXHp",
		@"RhXcqirdWHUYNKVPJeeAoJtbtCtejZlKSgKgIZgjRAHrEgulvARhxWnBdwIPEwpjjiCwTtmMWlOmYyOupjIeyTZYGyiNLgTBlsKDqSVUZUUTNmePeDvdRtJgUmsgpnZAxgoLAIChvFOKWJtu",
	];
	return FWiPRpLtoHuRCJAJbker;
}

- (nonnull UIImage *)lEwdvsieXSTICflwdfq :(nonnull NSDictionary *)xoVaIWjbZYutUZmoGQzg {
	NSData *PzKUATwHPhBCauCmXWfpbQZ = [@"oZKNtOuKpGVCyUhyiAmdZjOAOYItojwdTqSQaFLOfHvWCNlNdycnksEhSiCYnlAVTRFWkvCHMnceDFKYRyLsVzVTJNOrGMUeEmhBUYowjawlzPNinCtXKPbPFIUMyXRufZWXLOwBkPP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vmAYQytyfhjQPXWXl = [UIImage imageWithData:PzKUATwHPhBCauCmXWfpbQZ];
	vmAYQytyfhjQPXWXl = [UIImage imageNamed:@"WkYZiTMKPvxzeNssbDBYzxkmKfklMfESHUhtqvKxbXLwboJtcBsxHtOJbCYMbCvgxCzkVXEzQNstvFQfJQwmgntWAhUuHVNawScRWqWZCZOZXYyvNGeAjojFJfU"];
	return vmAYQytyfhjQPXWXl;
}

+ (nonnull NSArray *)UrgCdTdeMJMdDXTEzn :(nonnull NSString *)rjNEsKmwTKr {
	NSArray *uCuPekYNWIqJNjTlNmeNi = @[
		@"hmbAnOwgqJwikQBXBHmQPuZsWJkTOmuvCUlCrKFuvqgknhrhBamsafinMOrCRQDEDeZBaaOgAbFpnwwZySrxMtfnBpwTklTXGsBZSMIHqKbgwaQ",
		@"bXSppYbRkDXzLkNAXISkPfpKAWGAKDaoQHXCpsAyhdvcBYHlXHtIEzEqkEgIFyyNfNEQaHsBbcSrNAoLRadhcYeDQxZRMJQMGCtsSSDEyMqEgbheGsdgNHdYjFcCqLazdrkJkfmELpC",
		@"JymQdqVWVDOWBQXQxGppCuhIOebAYdTVoNpXAAUkvrSbwbqbveKBrKoPUaipSpArUhOrdDijWJGaZytwweJPglTQYaBBkkZwJIuF",
		@"JrcBJWTyHRZlMMoXwsYSEbJxxsWAdZXrGTVAmUtBTyVrtKeobTFmKcVqBJHzvgAJEUyWthMgnjOMSfpHzTdBJvNFSAFiiWTUWxnPiZgpDbU",
		@"bhYJYmSxuGOglkzZGigGuvHDCSpZsnoFgKBJFSrezpHYfuDYXOHQsWuzzEAUOCBfbhjAKXWaRsGSmBoStMeUezlnJVipnQzDcjWtjQsFXQxwKFZGNeQJeDXjMqXBkVSv",
		@"gkxQkwWVRqyAgoSVOcsLhWyvTYOGOjPUBftqkJfOyfDqTlpFPiuftIaGJPOeoEnuQfLPIGxZIuMxqIgvutJgxLFNUejjleFIbeqdVdQGYGlDdcaeomDsWgqKGAXkCcztZyjLzXPo",
		@"jYWSmRNUjumoHipxXEOhTkTwyretCXDHHpGxigZUVlvmrxsqWYCLYlBKcmOTZngDvFtLxusPFNiaMWKeKfxShdWACtxrdyhHDZTJMyUPLQDTTHJNwdxYZwO",
		@"gmFQJuPkBbDkxlOhJpHKOtNMldoIuOygbCxIFFwLwqfNYrczZsbZxNCzCgjIGoIIZnbzmMJablgrCwNFdsRqhfkjLpVvkjJnjjxpOkQFRhrhPUGKPGDyAhG",
		@"KUbkZgDUhpeNRGtUjnisvdkWwZqcMOuyohjVQxxLvsuRRlVPOnxLBLmgvmrXHcUMFQRTbBgHcTERixMIaebxIsQOQKJofbeBFQDMJxhvoW",
		@"iIIYohvUcbczJihhDoDWJQsCMPwKZoYHhVoJloZgtqHLYLxyhgndzBQAZiUrntYCtQfIAeAGSruYpUJXJACZWJZEuqFIvfvtGbkJbsPnxWn",
		@"GWurJusToScByVloOUvMkytKgOxsCoOPRNyieUEZLKemFZShZpyoeAmpKJsMUWzNwdfIFZkNWplAmVsixgykFxUdLDhoLJiIBATA",
		@"qjAszKwMHoWQMcPcEDwdwRKFysdbRUzeoPrjRpTdskINyQDbCRXBwlvzaAjAbDukwSjuktjYeRVBbBHmKMeNKmCJqTYELexVEoUUjZZZOQdAaoSnNOoSWnbxeZDOmQpHdWbUFdGKJASHhavwycDm",
		@"dFWfcRNJNcVNFabkdVgXZnSXIynSxEqXQsAbjLXUhUuXpCLEyHrgLZoHENXAyxxebVTwjRxiXbIGnOOszqllCgDJoybCjZIVIdcScmHYIyEmfRvekkjoJPjwglQwtAlLYkTLIHIGOKFxuAyO",
		@"wDpMMeRIWCWEqCPucQrMcgoLWRtZjXGTeljxuYFiREGklZIORTQnThUeRwyTtPHewobPnOGMYUNGWhoiLEKKNLXFMeQYfUacCOLpFOsANihUPWFXqTFRArUrumTX",
		@"slRFFjhVIuUURPSPJspWGrHWkjatpLnTwUhrWkwgULYoPFJRrVqRPQRqTqxeAdQGdZsesqjjSQHJQeRYwHmjbakqzXklrROCXmoPGagWiMoqgvhxGpKVQifvvDQEOd",
	];
	return uCuPekYNWIqJNjTlNmeNi;
}

+ (nonnull NSDictionary *)EiLofFVIDKH :(nonnull NSData *)QOMDpohsZupSUuEZtbbexGkM :(nonnull NSData *)hNOHMGmiAKzuhXMsp :(nonnull NSArray *)DKjxlolYsXJw :(nonnull NSArray *)zhLYmcDsQWKh {
	NSDictionary *WYrBtFOLOoQXXLGmvSJXmhmn = @{
		@"HDbrCmpuZWeKhoTZ": @"OmDgvIVpTCTUZmdvlaoeyzbAmuIlGfYJHWpXQmvNisgDUtuzueNIsaQuaJhWLEnzMyAIdDiQbUByLmPKdYifphNMtnjzbRdLINZaZowNXUnCBuLDwexXnEsOvJjvPEubQWoBaBnpeu",
		@"DhDHqmpTPj": @"TDQJlIkxbkFfLnfcwcrkMCpwkUWAjlCYpLWYZLsEcEPTNnPadnwWlLMcDlUaMjfwCqrnDmjXSVdmxzJBoktWcoYxoPsQdoHnUJqJqLlPxVckyiURrCkzidGtpJsqMlk",
		@"dPZYbgRbUYpqUeLuAKH": @"SaKUzeYwKwHwxwQtRQTSGMfuabPrtKzKJPEemHNuYRngBkjewvrySBdqknURxtKsVJStGnsGLHhyrlbNLtmsLyZIBbjReUwZUrhjtBslwNedg",
		@"CdykqdBWfoSVyCXHlsrIl": @"wDMqfOwfCZFLqxhNEuhvOQCoQnSEjMgDjIKurHUqwwtbPxgOXADXiUXWzziNddYlqsdmirrrEtRSrZVKsWYoVuwWwFPWsVVWzUnuleVOAjsQEsNamCoNhwEqfYaTomrwmhmDZTcLqHz",
		@"glvKMSeuEwssqasvq": @"FDSNjYqvatYpWfTBpYPGsTaAKCQpsTWjxRwGYABNaASrKCjWQNBtMQiELUEaIWcrKJJbtYWIuTivZlsrVDGfcAmbcMgKDizaBhhyxXzOZdDaqpXKmfSbYHksKcHfJa",
		@"HfDHQNizbLfUHSH": @"ThFiXeOnSMoZsdlWNHFUVjnQpbMcvdbgTWLSHpKYmWtXyrmMGNTrXcqpLOiTatiKSoWNfxPZwzwYrPwGUYpvjIruerkRIXSmCeLrsYSjGz",
		@"OaPofSBuwKfwBQ": @"HyjVDhsSzEHijUAvvbAhGdPJuJuBelsBgkNMRMDhtMbMqreoxTwEnQcWvxqUXFlHaEtysndDpRbUgTmtUTblhCBxbtcvToupsSdQomVvDuhAvBSinRdsTYdbIPJNeojTthzYKuLxHPLUFsXNwLSFB",
		@"HZhsvPWNkduGLLRFIUg": @"EUontGRidiLLXgsJTNErowrJxsaJYsaYvLuFFjPQkIaoXlmtrIrwDVynIIHhdvALXkbBvosJbttCjZcIrXDsHyKzboFqPjvMnYgpIuNdpBPgyoBEJdeQVFOYKYadHj",
		@"OAeAjLzkLYBtpFsZPQLhAyaQ": @"AtckcHaEcnHTZBQPYwuHNbPwKfPCdiMLAfjwhclQyWGDZLCQjbTWpaYZclPFxauMoVdGsbxiKQYoHvadFGZcVcNIwMoeJqYrphevyJeoXPECLJziBoklFNWCjoxdvargCTRMrxtFN",
		@"khlkUhQYEww": @"jILWBYRtZHbpEJwRdPKNSNjITyywMFAbBBrBUuyjCiXBxENFHnpUNQfYLnXmsAjxVZCRIXstPMgeOTFOiHqewaqhUpMsryOovUAVdZAYKIwvyFgMPJabFOiuuJvtjGN",
	};
	return WYrBtFOLOoQXXLGmvSJXmhmn;
}

+ (nonnull NSArray *)NTiyassoaSKwYJq :(nonnull NSArray *)LuRpIrCyMzE {
	NSArray *jGzgJUQyYlIXcgKs = @[
		@"LOsEeJNjdmGoSxcaSOWsNPreewxvtXwGcRvBkfCyAIdUYfjfGjwUyzOxDThOHpTSYKaODnJKvJrLaFjIoFnjlzrmEbkuXDZblTxUQYLeAQnoYEW",
		@"KkmaiFFOjZhtAanNaAazWmVsrbvuRmytiOcwwQEjQskoSnrydHBUyFMUHWSGtGmtcWCaHQrzfELGCQvrSrvwZbehNdLLzdWugQoIMFAWCbdegAwlAexsaXSP",
		@"DdoQyldRXyEeICQdTMOTzTrPNXRVojifXfVgndkDZTkinAIVBJIUEEGcYIZNkjzNAnuxTUklNBctkJfJOfwGeJFaFHBMcnOlWKkztPgGSOswwoAqgoWkMuNpMtbzUCoRAWeJbxbRWX",
		@"mCEVpfBoVFCLUsuKvfFWibMkvOBZOZbEtjqIdVCmvMVvaTnsiBkpikNQIJnyiBaoJtqFhVLPrAorAYsaXPLEMwFycQJdmGMdWDocKWXFglqQpkvtDsClMb",
		@"ScBLEbxwMZDAAPeRNvIKHQAyESJaKSHraCDXcWpzDOIbTYJFlFQSEqlTcqgvUsGybgvfYGoHHxWwokrVmZzIfiCshBnkVswjcxcmLIr",
		@"XgmBLbDcyzVrxaTQNuyyEFeAyPdmcPIurpAJGKRXaAxhppNdtdrhFXNTwWarMYbgFikgeKrFqyaNlrayoREiimAVmmKYRybdRbtIaOZeorfdFjrVRZIHlpLidFbv",
		@"hjxgJWNIvsGOlRKkNCPffoyZqaWmhLmHAxfWeMxPsiksdDWjNEtNsdWtJQqbMzsHHaoIIoAFFqvufKVaMZUehvkmAJILUYXEffXWPLjsELS",
		@"OEhYrUXYiLjEvBqagSZaUJMOHIBdwSafGXTdkTuBuZRwiExlIKBsQTaSwaAHHDDsioxjoYXOCfaBToKWPeetaURWBbgQZcVLMkEuBwkdPTpYKNXkibcwzcoEkFoLwyjyfX",
		@"nyAxAWYHMjloWAcrxVfvlTecVIxhLXQsOEAMikhzhEtfAFtJOtaSTsAwjoBNEzXyJefHELLSMirDoYBqxCnwCIuhFwzMWGphCBYVwSeUifP",
		@"jjLBxLlMEyXcdQnIiWIhBJcJkGxtvOaQxuYZkQmLFmCfhOXvcNrKEIfsLoXJbYiStjvBanLgafeheNewYOLyzLhosDdjpcbKTUyPXfHfwMEbzhFstuIqSjLMUylXhKCphwZeOeBGkCIYQbl",
	];
	return jGzgJUQyYlIXcgKs;
}

+ (nonnull NSString *)CTERCEiCLEDbYZhMjVE :(nonnull UIImage *)PxaOwqUtkzkWfRQhnDzO {
	NSString *luQReuBEyT = @"zvKezsYBRonbtyBiAwISKNfLCCCckTAkLIyJnqWfmgORFKPYtxwWNPtbJKGeqxVvUXRNnzPErTVBrwcqSvEIwVWHSoExOLGQetwESXygzeNSUEPZigWQjXdlZgtJCvBZfjRPCiEp";
	return luQReuBEyT;
}

+ (nonnull NSData *)HlzaVgWJRRApsPFA :(nonnull NSDictionary *)MsoOgiHurRLRCMOzoR :(nonnull NSData *)MazBJRcyhIcidmD :(nonnull NSDictionary *)SxomyTDfYtYDhUXcZo :(nonnull NSDictionary *)dDWsZjsPJCETCrVbWsmNVem :(nonnull NSString *)JysjhnKvBoKh {
	NSData *DBZTKdgEVvhKFbGfmoBXGY = [@"RtfFDkCmEnxCFCCArcPhlBzHmWOmdNYjBkhPmspWqMUqEQSItKwvaGLXVRfeKurfTjVvxHyyMjHOnBoWegONKSEoxMtoneskosvMdkmCkNLZpKBNICnvxule" dataUsingEncoding:NSUTF8StringEncoding];
	return DBZTKdgEVvhKFbGfmoBXGY;
}

+ (nonnull NSDictionary *)SBhIyKACchP :(nonnull NSData *)VpWJWLHWDPTOhaFS {
	NSDictionary *jpnWJkwyXRLFrSMXGbBFe = @{
		@"hFhDMMhYcCmORSrtFdPNBx": @"QdFayNFWkQFAoOxBJxXWgfHoRnXTKFKufYeSqdEvGfGNGWyswySwihYCKJjAedZitvamNMvXzkCwIckutSfbqERFyVuGYMohmMJIpsCLtLqmKdjnbffhVNhLLEVzB",
		@"WmUoNYXdQbTwCLd": @"AQbSvTjMpMQKYqhyKPRMkMofKsypxmHXUgkGERZJNSDlFKMkNjnsSzkFJTZnUVDrqYeeLLhOOCvLWyBojcFQNfvnOWbXmmkzphJuZtvqsyFiCmDfIG",
		@"kRJCcNtSDT": @"fLXHuwDkwUiyaJAIPdUSNtzBpEwSsJBPtzocKYeIrGqJseJgywlRcnbJzyEWoQnbvTfFEeuAJJpFANaQhqrHpnjbStWNyoQzdLqUl",
		@"KGUZVqlmqIVNjWOcYQfySaz": @"icpMQIPihaQoJehDhvnTABdEOZcWXxuRUAXDdQRJgeyrvjHtagwdnSkcIAzTYVpAmpTOZZkNerqFfmfvSEQzeTaJZOVAWDGuXtrfsMyzsEIcaIKpgyDoHmc",
		@"JachkaineXrgZRL": @"jNjxLDjSTquHTjCFGpZjriPXVRAIpzPPbyCDVPXIDoklBIvRcCfSUmxhbyfIUDRzawMhgonnxknVoPXnjntZSGQoBdTCSrMwgSayiPEQxWdvUEIQZmxgXNshZDSnsPXDuk",
		@"eosctSvBRSTbeuEoioLP": @"wOYvazMZFnPyiqGJxApordqazeGgsqsPWERUJQiJKKjbWhXegmuHLcmckjKbSJbHfuQxXMLeGSdSSIZrQYOBMRFVVONEsiXMYIhZiCuwG",
		@"taoNiHexKhiJeJDkePMvqNW": @"KaNpOKVqsYvrpZyUkncYHhhUgdwRamRPaiXDZQkJjexCIubrrHOwiHTuqmikIQzmoFeDwNiOjtZvWxmCoRtsBhMzVMWbWufAVboiFxLSWoBdvCBYjxg",
		@"PkntkyQSrwV": @"GUlOzzUsnPPRfEpjVFZTsuovcEokGjWghwLeuRLDXtJRidWErAtkjYWFefWXhvqZFKjThQwzXBKcdVDFeBpdncQmbswxATSYZqLjElfP",
		@"CyDzfZNgKUXpZdadhhb": @"iyhWFZShxkbcdKkQCAECKKyExByBjBbnQCUpvbHblMnmDtUavrkMrmRqDDEGErjhtsinbGqUEquUSrMkDqkkNYtaTkaboFrMBrdKeOAlCcMNpiOPOE",
		@"XAScdcuSOgZOUZWACWqBY": @"VPTnnHZvtDrzPgXzfZqlXWCzKQehHfGixQEFTlEcfVNZmKifXpMCTCRtdmLRZaiPMGlyMvhcIOztoxGiBTwqEsjoHjjZmGVYKGhFCnwMXXQMgERDwNZomRVChVwmdqDNWL",
		@"ahkUKaxnusGG": @"kpRFKidjmIveUiEgiXoyPrcotAkAVwRjoHhrshyLldccisbRprGjXQEhytPymypHrHiIOcsCDkkctEVIOWwOOEYYxLNWZjvVZhMXycxcViiBqNXcaHKmdqhyKEwMsSyBVqLqaYIPSkAWtERGr",
		@"tsHXtARNempeJFwYx": @"XSfUFobjoXQggQUthrNBKGNdSRJptCsrTBxSVrSMnyOYfizzXGubhLfyXVtbhJiQSqtrhHQnmyFupQImozTJoVmbSiCgHQKfsdvwLIeACoIsOQBdFcpqswxFN",
		@"iVZkXeerRXeiapXXjb": @"nDcKOgBmdNjZhTNnpyGEhwOjmsbgaUyHOOrApBJpSkMTHVhNVbMoPajOSIinnpaRQQkZdjUDzaTDYHpQdsYbCBWqdmNBlOfnzGSdwojCJGnjjw",
		@"FINIRkupWFliSDn": @"GTWqEsGPPcQCVWaIIJgHaPgSpOEoyFiQsnZKqxXhPKqDOwaHKClllBgPkFAmeltqpyXJSnbtyxWvHihRYNKRxFhpsUYhgarHdFaZwILVlwjhNHzMEtF",
		@"PXcGrQZuQHe": @"alHABNUMYhzsZQGYfiGRmFFhsLvWbAhKzLzIVntqCWqphzWFwXNFXMayvXhmESdsQmoaQKKDYfjkVYGqcldhbjtzgDfWZsCMlmHLlXSpcIenIZljarYkLNeQeOnKV",
		@"wNPArrLnqWqo": @"NbvClqJDrSWBFAYJcTWrNsYghNBWPEszYExExWvxJdErwmOWzzZeiXnFAWNhBYnkVSQxeeHmtEESqtPXQiFwmDwWTWELJLUFTGPZjlFbvLyAc",
	};
	return jpnWJkwyXRLFrSMXGbBFe;
}

- (nonnull UIImage *)UckjjHDQgVlu :(nonnull NSDictionary *)fpnWegpjuwleqICbmPIXvH :(nonnull NSData *)LiRMosnIbZW :(nonnull NSData *)RJccobKNDuBneXHeFQZIxLc :(nonnull NSArray *)qjFGUiwUvdaM {
	NSData *pTERPdGtWLwQlqHVoViZRD = [@"HfPgwMyduirRdxPMBGMhToBwPEZwVZLlpgaTQEVflASFYBvspBPUOMNwcMzwalPvQSezGlvnhNBgCxFSSzaKNgUzfnEqTayHgbjLLApSHFQuAas" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YPbrKdkOvxetVNlilgzeCrzC = [UIImage imageWithData:pTERPdGtWLwQlqHVoViZRD];
	YPbrKdkOvxetVNlilgzeCrzC = [UIImage imageNamed:@"YjvwzShAIiDFJuwykVogFSUIEmdFGuMOXFhqtHFqsMXaCsHVCfhPjrwJSbbKeQBuRHFdTWHLkULXmbCmERhrkElhcAXPfaddtVuuQANWRakruMyENAeVvalMUQS"];
	return YPbrKdkOvxetVNlilgzeCrzC;
}

+ (nonnull NSDictionary *)UtyPCPDjtiXEG :(nonnull NSArray *)ZOBocbCaGURVq :(nonnull NSArray *)ATWRyudPHChvB :(nonnull UIImage *)yDLBQtqRGdaXE :(nonnull NSData *)RKyLpNKoWmhNjylCEys :(nonnull NSArray *)OfZyjNEnLJq {
	NSDictionary *SJewCnWTDcWUcFjzdDDzmKe = @{
		@"sjtCbysrcOhgXFcOyBLjVws": @"VgAeAvsWKtOiIsVOYRiCsGQDrOkiXHvCCQiMVBGWDPkLYSyZoantAjjVrLXgyrDXtrxEvlnTfYNsTsIjDjCvBdWVsHGFpFHmZomCMhXJVWPzSgbDPZokfAMgdhXcbeKMQVqRGMqhRhQwW",
		@"uoNkYluABnAlPy": @"dahczfJkrUuOgzipLXVbuNfhzzZhlWGkAfCkTFgawoTacVxYFQewexakUbhETxwDiduZpedFEbsyARxqNEyXwHiAvxpfKmIqpOcdPyjnDtNwnniPqfMRdNRFbRYkrgmoFZp",
		@"LrlGnlyunmCo": @"sAIXAoEaQvCGZwcGhCzdvNEjunjOrSBnAwzYWJLwqwMcVonVAUfMpdwNxMNaMqbAeitHZIVtlUjXQznmtniwpvJXzFFknSmGNrtEzsCHskSKfIvPBiIXIupxaFzogDrQpcise",
		@"isRlHWFuPAt": @"mTfLMVwMVfFAjszzTDPbTgLIGUXvTspcYZUZwvGZXhMjeaQIIBBxxxuquZTHjyzchyVKTkhkaHJAwyosKDMplPEmMWrZDwmOaqlNfnqeIzzWfafpylzUMcKvpIMPbNOuPtJtcOgMx",
		@"UaAYkehNeVx": @"DLlPnkFxjPdcgjsbaZrALOzjKwdffqWDfUKSKMjiqfeKtDiaREYpFpmWXEHgJMWtBgwkGyATWnLRApXkvtjqcobFEkqMdmDLEBdcnBiYiCbFvRPaODDKtRLQIfnWMrNtOHSZAIYccgO",
		@"hCUIFVsEumOrJtT": @"GIODCHvdwTEPJCNhiYbcyWjRpewWjUCWpvDlChACStdxVHXUqVszbkzkKVahDVVjmbIfvBFsCCYzsFrsAbILeQCDAedXxqmpumlJmfogIsobGDkFThzBoLbe",
		@"cFKMMXUFSSeR": @"vVcwExNnDPyxuLILjUbLeCQAiHhkweZMdPSqsEdxhyyqcSaXaaRKYJJegHWgXiQXGaXwUiAepuFHpWRRiaLjhcKITosYXXGlgCMgpaBIREqbIsHkMFcBpCIDKeSkDgmPasEwloNIPqeX",
		@"kcnSxNPlnVgnzsxZzhv": @"DvgICovKlIBwwjJSxeKzywzunJEgkxhxlVuXjEcIpTVlHxeXRbZVNIHNMsmGOkOjKdJgpZFHqdGxvavnhhlAnpmBCiCSzyFDHCunqiMHd",
		@"awjzhVdchGYCbqq": @"lcGdxseydwKORQIAxVzsCiElTbKttVsmgqEEIsmMjEUPWTdmAGRiFNFZtyRcLvNnqnQqmYUnjKIYWjDCEQFmwLftfwoHJYAJsHRHquZwsbyJElsgfWJUjebhM",
		@"KfRElXfBdlNugAcYkqwM": @"UHwrDMPiguQJsvYggavDcbNRgFPEICckTaJIsnxhCBRlpmvmmulRnvtGmmyzFYMhwVHoFMTNjABqIrEUYQOCxGNmGsWVyEpzhNmzrMUqaOFEMRLcYeUDhGCqsddezLwfQQkXQFhIcXQncRARKtyju",
		@"quEestnAKGuTobjxlcpUNK": @"JcHdUJpTudqmwvkwmFxCKIVwfoLPjYPhySguepyrnsldvPpUjQDRHAEygXwTZCIxgWTRjGOLYQLMRtjKFJBVMJFlJFXstfMJSpWlpogHTaBHUQWIupasSbOsI",
		@"tQstJRQBMl": @"vWQaLELuiqsgpHHBQcUnboVhrzaTdrvTpVHBrfBDYJfYShhudPSJRJOgiqxtpaYQKClpePkTpnoqAJhzpdppWpMIXlhLYbvxjOfroc",
		@"oPOoCfDSTaNFLgfkJYVx": @"jFJQTHeNaklPtRiomHgBFlycOZXlEFllYBHokvlufuvIlKpGYGbjARgEWQzKuOXUwLAZezbzkKOkrvztxyxtLcZWhKOSubYITTStWwPHCMCoCEhkxdbCphYEbAOUSTQUFkKJMxsp",
		@"UKkrujkegonCFpcBs": @"uPcoxffdKtXMiLJekSBlqDcbfwwiThFeIDvROuxtzHAZOHuewhxeGeDQUiRMHocBoTwLqvAdACfkpBHrxLEGvGxrkvXJNOVAbHoqmLGHUZKqzfFkHiUMqMbCRsIuPsFRPIasBHjDub",
		@"qGLXKTVNSEqaFXFVLvYUdGX": @"xgXqkwAYCuzlGvlaCOQuwYxWLvDLSzXdCWQqmIrfleOheqDkzgRlDyLXIsVKxFntvoBOKaBVhkwVRdxIffuCNBdrRwgBTUDaYaIzTIyMCJlCjGumEyIXAJAsVDQRbpgyRf",
		@"cvLGUKmKRXEJ": @"ZTqQqwYZPgpjvMfatGIbUbFFyfBmRzZHXORsdJYHxxbsixmbfYxPloIyPVrcXecCOKQtfHVxOESDGJulVzGGbKDkVuKVAficeXgxrtQLuhCagoTO",
		@"cDHpMCEKwhNxsMfqbj": @"lAKlMFFwaAsVEethPpsLcZSKxvLywcWnnZZxXCuNKpPZaPzYpvNDSbGjYNspszVAFtFoiRQlsjOLIwRzyeataTfsVCwwoXgZUeSwANxoTqtCWMVRPCHBkWCXuEhBBkzmP",
		@"ZdHPqrSrnGyn": @"DOuuGpLECkVqgXtySLhMllBLAoQDSUbDRAHcTWiVdvgESmoEitYZAiVPXjNWxpOQkghmDBGqkjgPrvLKSbtNKxUhfJHaxLaUavNchDxohXNnAGEPcRucplpphlxWcSTKMDriIWgRBZeudNhCvaW",
	};
	return SJewCnWTDcWUcFjzdDDzmKe;
}

- (nonnull NSData *)HVfKvvqnOg :(nonnull NSData *)sgtOpfgVigqtvzzYKIPDycfw {
	NSData *vTRmLLvZUSYfDPBjUMSU = [@"qmzSBdfKGStTQToiWAPeuVdnTtegTsEQMyScHssvcrxIRMtITHvNzDnRdCCfdLqcDMKYEsVlgYmoHNTplLPGiMUhyuPwBmDCmoflHZOvHhCMjSfDTAS" dataUsingEncoding:NSUTF8StringEncoding];
	return vTRmLLvZUSYfDPBjUMSU;
}

+ (nonnull UIImage *)uApskWYkmtOpPJopsTMT :(nonnull NSData *)zsuYrbdyulydiZVpSBPXu :(nonnull NSData *)TZYTJWHxgFIxFt {
	NSData *rcFBYIcKFUeeyzPwueY = [@"OKRoUgFbdnaYSKVeuRPKkKKOADKAzKFNoEansUQCjmZzTOwKxwHbCcLbBVkRIrkLjioRkMUNBMVgynbReDEImagkSfOZzeTutkyp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mzbWJgQrlXHhfLEMUj = [UIImage imageWithData:rcFBYIcKFUeeyzPwueY];
	mzbWJgQrlXHhfLEMUj = [UIImage imageNamed:@"GIcrvRXruzsnIyFudCpQApPYxVvikoPFSuTAGIEmfuWgKzJodvVnyEWVtvmyHIgcRXRclxiPqQoPiAbswYAFZwMfbOclMGfduilTuRxFBgCeNHd"];
	return mzbWJgQrlXHhfLEMUj;
}

+ (nonnull UIImage *)SezkSEjIaAf :(nonnull NSString *)FSKSVDAMycDr :(nonnull NSDictionary *)ejEBJMBJkh :(nonnull NSData *)JgDqvoYoPymNWQRzikI {
	NSData *aKIOuAWJlmAW = [@"zQmdiyucFcHzpvqtgjWGsrdlLZnKbYxyNUItRfStetdbOxGmcBjouXxYGKEXwXLxyhzVuMlfeqLkAjFeDLXkbbieAGTUKuWIAzBGFkxzlIjpGdCZaQiUtwcbGauSjYoJEfbnwNwDcn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vztFyoPauOKBxxowLd = [UIImage imageWithData:aKIOuAWJlmAW];
	vztFyoPauOKBxxowLd = [UIImage imageNamed:@"QBwxDJQYYhAMLvAlbsJyfcqtWiGqbxiZbtekSTVvsSKywEpgjkzuyeKgdlrPbxpoYeOsmWeqvvOxxdAPoUKvFVLjUgPIwjJzbaupmvnSrvpHIAoHBgWTGvqDVOFtLIb"];
	return vztFyoPauOKBxxowLd;
}

+ (nonnull NSString *)hKfXmHvSTxLQLTGAQf :(nonnull NSArray *)OLPrYuKLqLV :(nonnull NSData *)kbACSDshieyRWKQnww :(nonnull NSString *)XiTlZdQXjJDQNNwKe :(nonnull UIImage *)IpcEqUHxAwBTOdTxg {
	NSString *cuuYrFmACZEXMjhp = @"hPWuUjSXiWUhDOSxYsnULhPmfwamIqHTBvnQCVTHWNQHIqZEJTAuHYVIzkdOxNDEhFilAdFajKLBsaAuzhtIuPgjUnkSQIvaegbrDsUEslBlZkYlwxtajlgCoRSIerhUeGoiRFPpbjI";
	return cuuYrFmACZEXMjhp;
}

+ (nonnull UIImage *)IhLIZEJWEYbYjxtDrnIKNr :(nonnull NSString *)IICLHkKUnoOwlIKMdlrD :(nonnull NSDictionary *)LwALlIqezVARRsYA :(nonnull UIImage *)ANuIKaGzYfiMh :(nonnull UIImage *)OdFcUTusrrp {
	NSData *PvCBvEHCFRmop = [@"fTUiWJLhOUVFtLjICUfMAoGHzcUvBgbKRedbgNsOjBmhUenTxRyzYWVdZtWTSLeirfVjXNeEcwYtAmNzUHzMUnqzjOKhQRjuTdKPkXdjxjhXycyUYFmPZigZvXzXbGM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dsbYvYgLArsjGaMoRmFKoaOB = [UIImage imageWithData:PvCBvEHCFRmop];
	dsbYvYgLArsjGaMoRmFKoaOB = [UIImage imageNamed:@"GwnuABrpTKrYxlDAZOifARRDPXSoVEuHaVWKbULbjAbmbkMDIuePWFGrOuAPEjpysyvRFpMRXHcqcMIEKYoeVqZhwrWrZvUDTvVBytPvfZteTlUISXmQrZRgjVIQQebVyllfHGVMFIs"];
	return dsbYvYgLArsjGaMoRmFKoaOB;
}

+ (nonnull NSDictionary *)zVbcWSbELCCRSyNq :(nonnull NSData *)YivlWNziWZ :(nonnull UIImage *)MjFxaaQGdYnE {
	NSDictionary *XKhHueAhriWe = @{
		@"dXLgxGewTLNHyN": @"fCxLqWLDtKpcgEiDoBlTqtZznCuIvVEKVzLZaSOieqeeXsMoMwyKVAcYkYdIDtRSyrKkUROTrmnGzymSnupTrgOhTylVKLBBygyXXHtPnOkLuNtRPOcIhOibeNPgoxHkEeEKypBUNDELLq",
		@"RIJFpkzZsnZMPX": @"cuhJYOSUCCtjinAEActRtIslbjJPkOCBbjKvocDmiSDIJHtteBQodIgYWPgAFMJSjFPQEMjffqzBmNbPZknpTsTPLihCTAWOatVrYiBPquxsdornFWVskJhAtgD",
		@"LFKgkooCAOPshRnHbnQHnO": @"RnzTgrNrAHobsagGdKCviNAvGDgBKLhFGXgQlHfzYKttotTlgpsbYFXZtXnavpxezImQmxTQoFZMTlIiYYaWNZUwBiKVRTDlnDuUafjSfREgsawCXhbOESSNbFrBnHNueWBQBuMgDAr",
		@"NIcQWDXmmPOMRxSBZN": @"zSgjsVmuXdCBCHtNAyyzDrKzMbuJUoULCYPAZImujkEkufNeCCcqcyyObvTpbJjwXtNmGqLlKcNEZHcMNRMhuyGrWWsQAVgInkHmBKuiGdR",
		@"vVrdnghqkYbGjHxUorLvklO": @"jjxlqhokkVayYnfhRMIWdSszPYPfumdGPamBUIKJLSpwgKZtyeHgXrtQYkbYNbbnDoXgsGDyPyFFYApUQCXoEbZjhxpramPqxLcAfJwyEGCZLQLKlMIT",
		@"OtDYJmNosxkdYHDiiKhhgvaW": @"DoweNjtiGcBnlyKLWvWTmoEGbpqprvUsoQEkDRrOYWpSlJqnjkiCOulxBIQxKJLYgAvHXCWqWrRWYagOTiAnGYBdQsHbraFSIoNwaACkERtmVijVYrfzGiwBOTTXRPePiovMKAbOgBgugqGWXVkbZ",
		@"BRFZgmdNfoZi": @"hygXfjfikvmbVDwEJMGWRFkSfikHJjuoTaacUTSZJzkzhIyCHsuZzLAXOPAmBTiChUhGrwxUYCpOShYxddiMrSdwGMxGBzMxOGwfjgzPWKOORJFTEdOhFCakb",
		@"DVagaTPJKUYHgQDmANYzd": @"vqymVpZhSwKDwgLrCMTCSbWsWtYNqEhXndOoEEkzkCsaRLWAikewsiOWgEyunqNBXxLJfOIymWwInVdqsumrdpLiqiCFxuCsOIfHVEeHFloHNCAVKMLnpBPNRfAQpqJtiHePKcJcxuFnGaEl",
		@"WksJCqdrsTUiIriGn": @"kVONESEfkaDCZOKGhLaMvDjlsxPMdqexRVjRCTDtVSHxJPGZQrrdeeJWgSxWDjBySxomFyLbjqrtnusQlnlNuIcdVZCSbdupRrGmTZKbRlZiPAzcvsrTbeadLpdfzKZxlfQ",
		@"hUdXNiJnnPMivgi": @"PENToFRYpXOMGILetqjtCPeGIguGrMloJhtZNVCVgxRLegTqiMMDifOcVCrOyNhAFNWVjqbalqGvExouSCWOjSjkpHEGdXxJRuCCD",
		@"QiaQROXlwKaGpQahoJtQtis": @"ZnzsUqOTehjPldTgvieJgZEaVjKLvzfIMMAxauNBKWSWSASwUVfGkFmiXrlERfATBxjxqjZqDKtzktgrPUoyoYjLYNKNVtWqZHKaHPhULRDxAYkBFNspwNsL",
		@"IgCRiJqxpmldxqUj": @"ydWATPpTDuXhKwoJsPffQsfJJqoluvzLvQynrkjsEoNRdazdLOvJLrjwMpmblSWnDhCODAFYsDwFJVPRlInKJsJKfmcZjDDcUCcLtHVfVbwLKZzGiAsojBNp",
		@"aQUweihANIEmedIPZktJ": @"OycGNzUOqlsQKkCbfFVoxfSJRIVXaXKwHcXVNOdQyoPAwLotdseOjiMAdglRMqpuScqhaujghqTymnnCeNEfsYDJClPVKNbzbfQMsoQjdKf",
		@"ZFWAFRdnMYWUFHIhhRdr": @"zmeUEaqVmIDydpbKxAdJoHGJcgmmILbEmvzkGMobmfloALSjYnicuLInzgehsELdgVfGuLkbqXTsMkBLOADFTsSbIfBoQuAGjrrFj",
		@"WbJhxzZhLIORptum": @"CiWiIaJbJSifxGvcBvmUhTiQvxITuTkjjtvEIrHbUEnNQFLxTAlRQPZrOFwDFgmLNIaUYmOpEcxqbbaZJmWpihektqCIicwizwAgvtAuImwPTBcfiwpAD",
		@"vxuQlsMQfVMJgghrK": @"FXSLarqLOoIcFTcZoOktOthOkfbMEpQKAkkZdskSKwgKFswJMXiWbCqqmwRwhlHTWyTdiYXSXnyqYvTfcwWeAKQJfiaOxwsPGeMLGwbvynCpre",
		@"KcNXECcATFOXmgax": @"pXBbKhcgJivVIYSnCopaXRRpdqJmwExgXlnOtTmqIAKxXHvvJxRKZAldilOnYfwoOzefGVoGRidMtAYcTujbfmEvfbwnnTcTHaLXFyiZDnjeaYuUuEHWJgLHlTfUhANIKLkr",
		@"SjgOExfJWUY": @"YbqRDrKEVWHWgDsUMDBhgQstQpqsHhnPXZnzdLNFdwyXHbxNyvUiDrxIkRaAnmjJaoXPNoXmwMXGlXCuKfEHTGgaPRrCQQjadivndSjrf",
	};
	return XKhHueAhriWe;
}

- (nonnull NSDictionary *)YTqZIobZyotF :(nonnull NSData *)ItAdTmCWRvEk :(nonnull NSArray *)FgMLWlfTIIjdxJIjhvBC :(nonnull NSDictionary *)LjEaTMdDZUCzuNZhP :(nonnull NSData *)YCOehrLOJEsRboBYEIS :(nonnull NSArray *)NuapvQRnHu {
	NSDictionary *RNMzRVtkowJMQ = @{
		@"wLUGnwgRTh": @"BZHkQYIpsmnzCjOJpAHroDPkyzFpmFFuWETIbNjCuSDQMQIWkVXaKqtCIfUkKzkmYPanmCFSIbpwgKtdOpVcRXIgfzFjiSUFkfHMPQCTQIoiknVotQEMWLIIx",
		@"OABDXgEEJrQHKqUa": @"rPsXmvlmdPvnckesvaScMednLUjaYexJnEFqDhZgTeCCVGoIwhZrDzicgiQJWbBqaEIHXqRXmgrvFqLTHGwsLRBGgmhXLPlQXIFYcKGUObwevMHFavpcNhKZTckLOVtvaQj",
		@"gLqUOGSnWPkzK": @"rYOoVRXYBfpOqGXKKIUQgSgyQQrVzpSQkFodsfTaTlzrhdQMPpPGOPjbguRBWvbdPOkPUTRloYlMetNzcXpLNxlqNuhqYOzpjMhcvOAILWNKVzClMsiIYhsoZJvmucArNUpW",
		@"sIHgnYEsIF": @"waIbtDHDLCQOawrHmHYMxOOGbTkazIFMSgsmxJygbKPfOskIIiFJqdBHudHsdLUCHsyfnoDBNYmBzcjDYVSBAzImptedHbvlszqRZGZPQjHWuDCFzHMspFWspTW",
		@"npBVqLTGddraz": @"YPZrGRByMrFVeYGOIIhDiIadXmsxJeIKACYfoZFPIWzJIDZqthPZPotGcHleCmIRfmLnwqEQppUTtSWLERBTjBnzHOCsqULhsQtZBZQplmHnZRAACQARxvzfewRqqGPwvYLIff",
		@"kxPqpaUVkiDRHh": @"jZdJtPJUsTwQTdpGVSgkEXzNbvfWZyfbALiqLGVxeKiAchoBHdijmZcmSbazCQctSMibrzBjGrEnIbDgYdMaJJdSXAvURLWVykyYobRrTNh",
		@"XxRsIusugINYHoxMyYBGHmV": @"ZfavdkUiYcXLAfwlVolACuYuoZErvbqRtfPjRTLcudFRxByEKxeCJNocjAOglCcTDIrVaHcKzWfRuAIyAYnLfJfePlcYoXABZSwhDwvdhMBtFTwgKpReObaVFa",
		@"xsTAOYCzemlomoPbWx": @"lCbMKMOALJFTEtDsiUpUghnyKjEnllEqXPEfTlgUfblArfkFfQyBiybvoJalpThEIIpTOfMtcYlAoatczOEzfwhhEDDlTIsoSPGQMYWWrtEAkNmjRMaPcsqTUWkhdqGLzUHoE",
		@"ImlBnikqAoYoT": @"mFgIegxVpSdJWFLCYCQxbaWKDWkEBnKpKcphxiWqPhWXHnoTZnrnmVmGGyCnyPLqdxZrPwFczTLWFcaSTWDqiMssUbbXkBZZwLVCEcqmHy",
		@"lyiXqlbRQFknU": @"uZHHgYNDwTKbAcUfCtlRVcVQlIZyqTeXltBlIsCzSTMzENBoZDobLeEuWHRwiNSSYBcNEJZOYGyjHCPKZsbTTzwfrbobKNVrWchXRyPfVjKuXsYmrCdSZkawsHvERnpbgV",
	};
	return RNMzRVtkowJMQ;
}

- (nonnull NSArray *)mDKjSxWRcpEThpyW :(nonnull NSString *)yXJGkRIdEBLKwgKJVZ :(nonnull NSDictionary *)QkRfaZIMCWe {
	NSArray *tNHjPcKFnBLzKMTQMqP = @[
		@"eZMkGNhgjMkDEvKyilaqxZEQIxdeWhnepBIvGAsaxDeHEgHwXhiOCClsTFIjjkZqfreYyqPdohOAMJPxvYgMlwqMklTwnloUqcUdUzhlE",
		@"JBQIebnVSZfPDJMDYBRBQlMESCggsJXBqQjhDVuhazmdysjcpMynhHjVlXMGivYgnXuGgjWazpfaefFhQCoXPpldvoYADuNlQhpeBXEcdHcUXnykwkEzowYqOfLyJcWMsUVNaxpNlPSe",
		@"jmWMvGHoNyUmRZUnoJKDDEEwsTNUeiXbQHxdAsBVvbiYqhsBBnFBdRWEgHEIwhHMAcdxLCmWhBetnkdDiRHvucFrUWMmmlfbIvdtRkvBvnGfMeDoDFjLrkPtiaEvg",
		@"eUffnxIlKthoqLgoBshZTSqTTmIwejzQLDeIlrgPQhfHpEXvTeqshZEzoGrDczoEIetrdtdpPgnWPBDcuuBrdLWqykGZophWkEfkpKCTmfLUDBmSggSFBW",
		@"qvAbRJbQQKrzguvMisIhmBIIMQpuTkALIdAbottusUcoBInpahujqMKFkvXIXlvHRUsJGYixGXxkVNZbsMJBPhJwWVKbQTUYlsKlUYmZOPxiaLFsMWzJMbwN",
		@"iHxGPlQPcxCBuKpeVpNPVnokkgegNjhcWsXiejTKYLnurhhWCnRKKgQVtBDFJMttrwTyDSbnBWZhrnkuVakKpbUKAMyGayFioYNOfc",
		@"klRrwZUaIutmwgYwueMHyOcTsZLKJHDtnFjPFypfGnGjSVaKriNLRmAlHfEBOVcjmafuzQQsfDWTtmvUTLdJHcoYTKeuzhLGvzKUnXoNakteDuwrrrTkWlVISUfVqGAjxsHlCdJoYnbJ",
		@"gjkNEYqAKAQeqXXYZTfAOqALNqfjkVtDljAoiLKogdydVCXHtZCbVJzfNWphJfizBrfUqBMzGAGVwakFWYSXKlKHMFlImrqXAHVJcKHFUVEdoHsSzgwweDcmVgWoSQrcajxROrEkMRol",
		@"IGKXiBAfvyxNYZxQXSErrzblLhNGrKjhMmJpfVWfVOyiNRNOsNkibUDXpzPyPyUVUYdfiUTCuAWyZGflWdHIDxznmpnlSTMxZBMxsoXJZRnKwmplIwEOrHLXcFGIFJLpPJYKqlSqpcDmzQ",
		@"PdIudwwXoyZgvsjOnfmRIGagBcQwohVrdzBkHkBlTTEcXBThbhExtEAJeuNvgfZlWVcVrCGqBztfveomuMEisqVlkUudeVNlVHpLxelZKkqWRWruYOEXustufJIp",
		@"zwAIIgpCshbFwFlnWjDPcYJkcirajAGCmBkHPsNuACeCtJxAUYeZZmHwbNTKgeXypHvSsYwBTrtZbRXyrYrFXGMbuDjxjSvynKTpXYbNqMYhoJDhvPGRnncPzqNmYXJaABKnLbSzVTurrTeBRWt",
		@"ixBBiiAgKOlYIEDemEbgCBSWEiQJNptDYrGmapQNxwdPColbinlpLEYusiLtjormCdRihJDuTANzFNgZySNsyqxJpoHeNcrskQDkqxopwaNZaTXlUEPcxZSwDfkiPyqFvqhvpbagGVMNp",
		@"BFMlSadtVNOisSEKgjvkeAdpivaKhLOloFvhzgtMNDdIhNqEUYMFLDAvxWVZLSRWXvDyPfGmpURyzAtoWTbLgIhMddsPpowZsdOjGMflhItRQCkikOrDqtjtuSEcUV",
	];
	return tNHjPcKFnBLzKMTQMqP;
}

- (nonnull NSData *)MhQMmksvkhzN :(nonnull NSArray *)gAPrtFsBXwSEYGBVZcEKTfLT :(nonnull NSArray *)vfVhlXWIGzMRxeFQKtt :(nonnull NSString *)GqiIoyYcZmCLPBMxeKRMF {
	NSData *lvCUgLkkPfERfGBAmIeAXC = [@"DHjuwWzqfAilMPIOiabKOKLqNapJoLnovMvHzzYtAOBoWJBINxWzLffIZvEgUpjevLykPPaOFXvhQBMIdseXDnMTACFbbtCJxqrMdu" dataUsingEncoding:NSUTF8StringEncoding];
	return lvCUgLkkPfERfGBAmIeAXC;
}

- (nonnull NSArray *)GKbLOAqERWjaMp :(nonnull NSData *)iIPzMVDNegdHeDS :(nonnull NSArray *)eCdrwchaQzAaxlyVFznrwGp :(nonnull NSDictionary *)rPRwmHOwoRcLoNkgvlKTXTtG :(nonnull NSDictionary *)aMfNBQzXluYadQoAfVosVQLo {
	NSArray *eRhppikSZsdUxpAgGJnKDn = @[
		@"gdnczjWIfppOOWVqrTFWXuuxvRMJYNgwDOFxGrLOaiiKAjrHrZrGjYlTwlmksfQGFQsmYMCMpNrIgswmDMpTdXNOqHuTRmJEYIPxZKAvAPIboTw",
		@"HPlJYvBCynoycFvcERucHthpucjSCRrwqEhTfZTgoSyHGfsMxaxmUoomljwbjttCWMIxbeTTxJnPYxreyFnAUYsHSipYNEsDEBGvsaHhEiWiiHMnDmADbjbWXaTBcsEavLagKTEMyRJenGx",
		@"xsdjtcndXWLeMaGDNshHJmaGAFUQuUyURWEsycLnPbqUNcImHltebkvrpswSlJHasYtzkXkppbVoxrGPiScdQjgHJzanqdMoNBqWZvxKyd",
		@"bHikLdmKGuJpRhSGKrMfyyOsaULvkRUgabbFzIgHbLEGPzqnbpXwzTodluLhnblzOdfNFQEMTidShMRmllcIEUYGJyQTPGiMQLAfLfueMImIiKepfsURqNXNa",
		@"dTZtctVgwwrXKazzcqhaNRznShIrgKgOPQvMhqYwJTXfSXEWawHWKOrCyGlujcOOeZEBlLLtDAfQUADCrJRJnLghUhPAeSvhCIIlPppxesJdtbzSyOodxIKlXwhoRzwKNrOb",
		@"LgbzhQtAenEfNgASvKqWMbRPfuslaimoAszPYjcygUgjgHWaNsWXWEuOyfpaKIXmNWCNUyCKTCeMDJXkMZKREfSpUkOeWDAPayypcQnsJgLweSoNuBiJuYDvoMtWqDCiBPbzQLyIhBFKfnA",
		@"YoPahCFEInjAsxkfdxwbrrUoBObZZiqZBJlXAunIkbKngiaskcXGbYLszZZDcAwOTXVpNHXEgYQRWSNZoljkDCVeDAblyXoamfBQnaDgeegtQUJtM",
		@"NYczeBnTiygNkSOZHxxxzPxVlWmlPHcTaHgDGztVVvsTcBJerpRiDfIQzNuAmUDxgTtUJLsKyQJftTLNvGGAMhMTiexXhtoCQYRObimSqyxajRpuvBRCGNswTBCYvdaqKFL",
		@"ALrWYWxuwqQhVUrnSZIxTbbDLqGUscIpnngahHLSoHcbMGaoJtCvrCGLzzslhTwKirgNealRCIHUEeqYmzsOxDrqlokIOzGKhiKuTUsdcuOeocWwCoVHlHJeFxNxJJAQgJVPBaPiWDksoRIMin",
		@"pbKIjCpedApaLTAOJWSXZiODrPOtAwZTcRRzcDhuBiBhywyuTcLBqyVTLsJQgkBUhqCCaGlBxZNcpNBTHHwFyxVzmPimrxSGyNMHyBFWBdOgynFyXFAQWoLekUHKnlzdnioDoSZVbgjYH",
		@"daqGwnaQOKXHJruxrWraZPTeCFMKsMDaiORfGYLEiQCestyBIRKtfYBYVXzJNaFmyaTubipJIDfIShuurFcoRXrRIKlgErCfsTcqyoyiEThckSOfXpeMogHOxjPGSZgLJdBzVTjiSnountRWUJ",
		@"GjMDAnWpytlethcwWqfYfCWCPynRiyaZOdRsdrdurOgDqXtkeckKcgttkXOgUeZRSTlZKfTxmoYTvDvVrIGXqKXcQGRCjBSqPoZSEJaBwmMmLsYynYmpkNLcgntsmKTZYoKpOJR",
	];
	return eRhppikSZsdUxpAgGJnKDn;
}

+ (nonnull NSDictionary *)ytjpTuGhOLPsadx :(nonnull NSDictionary *)YUPGSdzJqeHTQAEJTGW :(nonnull NSDictionary *)JCCorMuYogNIjI {
	NSDictionary *iZRbqSwOOgoyhZUg = @{
		@"sdRdrkGDjSbBiYxfMeAkky": @"NNpoAefvKTDxkzpkYFhYVetWUuPgfXXNFoIVvdoWSdqtTdYiKUcJTbKpEmfgjzVjpWkANIlgFNHcTzmlmowUmQOVaqlpJMVrisBYktxOhGf",
		@"AnzcISpEkpkSUJOePdqFeP": @"QMdCSjUwwoEznmXcImILBNFwCKYQJVIhhVeabjbADQnEHYwQnNtNAZfJXqqfMnrLLfOlGxifGChHGdomdMnkJXDAFPxsstmbRcmcIDpToliOOsyWWXHibeqUvahkBsdbspejaudXVXxkxLa",
		@"cjxxSohour": @"prcNbvROvCGAFoxFIentqaraIQkQRFDNQYIrdJmbWtwEPJpcszmMAXRKLDyDKmOsdoqbHkoLkoCwUNUXIDqEZZHuZudcDTIzpgyPRffmqcMNLmDrwaupcapOOmHZO",
		@"eriDZpmyFcF": @"MMUPuguuyyEGWzrKfTzzwFJtAptzdYKdclqzHCuBSkxFqnNDMDfvbdVIlPhDsKrxjmRanWTNULzuTMEnKCmezFXiqAOPAGDNnqnEGIeVLpWjYKcbZSBYMwQoXQ",
		@"ohFwGLlLhWxtvpVScFGbABMA": @"IigZVQQFzAGmCRnfaQGMENWooJkqkQOrIhFTjFSstplhtZLXPTepNIwFvUBLXJjyMBlqHUeVfnEITGVCkOxgZsCgeOqDxcxOQXtUHWVrcQyxzcMRTQR",
		@"YLEOnqdNUjmOn": @"wHzBxfgtvflYmLNbiMpEpWSmGVjgzQnInTMQFBgTeLCLqcmfwJFrKFdSgeMaiCLBrdGyVIhwrcvWELIevNIYlLcTQbaavkOQXKeUTN",
		@"mSLLUxfwFjXJMXrwsVrWvjLk": @"QpgRcSmYEiZxBWcYLWxcJjbtCGqoJAJbTNSZjJrMeuWAplJdQJauxFXRDxSgAXGtaAKKmRcqBPhlcgCxWANGzTBWsEvIYqlbhMrwlrTwhvDAKmnkXg",
		@"NsEBmzKpWQVXjY": @"EvPWWiMXvzNjnNPAoVtPgrAuItezeLSUrcvadbqeOBFstKmnIUTBhehoJfZMbqAlKGXdyGVxywviIaVXaspUIbvOUXZpmVlxFdkSAG",
		@"osOTAkqueh": @"iTNVWCAOJMEjuxasIiXnianYZcFxhVEzWYpsOsuqjjmzGtsWXYEnGIYHxYqqwhRVVKAMSwIxuzlvYBGyIoRCNsWndmnphhotiApCqiPqlvoGWbvNvx",
		@"JUOcfICHzRYc": @"CyLNEPXKjvOjcLNzbQhTreuuzQCLehbnCsHMXgXLHKxBHaTDUkCdfwIcveANmCtDyepBkfIbsmaoBglXcLwiOvpUAWDoIyyXAYXALgpRUlBzmbVKcMGTuwIvOBcfWpifwHgoqU",
		@"pgvPUzyGTTzgh": @"AtkdoNbKOEJPOOlYFITjTftTDjleQnPrZjAiUjWNItuAUjdWTwYwagkAJsLsHEKDYDGzenuJjgLxiYFPAfvmRoZtRlLfXdTjkiFhzriOVPjfOVXClRwKgKYqCtT",
		@"SdatpovmVqBJFNVdBufYPUF": @"xTScTrwPsqrRBDUggHLEMytDhsWgeRTxpZoyXOZjuUKruxRzPdlDzNDTzhAOOlfpUaQYEKybhqpDKonNrtYHBOrzWbBqVNaknTdamMzAAPWuNBmEQTswXMgMBppxTQfmkdWqOfip",
		@"uaqjOSdvZjpdcvwBkpS": @"BotsVKchtgepNwfDHggjgDSSwItQmpyqhtPvQOalUevcGONTyZlbTqiFqaFxAuyHnRVORCLjzwZdsAKRdeQoiSOYiCkszwbJelrOEKTbMvDjKbEtcjRTqKiGrlAqalPYDKBAmkMPOOhN",
		@"eWVERArRamlhfLVqZRJ": @"QfpQYwWcATIKfXULSMRPhnRhpocMfyTVlyfxDuEILbYcTfkbvhmuNKVMGczFUonsEkAmwoJeXABbdgDjidxZCBgBhNgzNEnzKShJSrFKJiPOMmtovaHzkJvmeLflsDnVFUIzKkHEwojUmLVc",
	};
	return iZRbqSwOOgoyhZUg;
}

+ (nonnull NSDictionary *)UmwHuJRlkktxI :(nonnull NSDictionary *)fNFZcWapIwlQFKbJEK :(nonnull NSArray *)decTyDxOdnLsZN :(nonnull UIImage *)EFgnyDjQUUmAeIwObOnPVmmP :(nonnull NSArray *)AqxkYNjylcYGv {
	NSDictionary *fabXOYJcPlsy = @{
		@"EzWYrdeUIOvNr": @"JZyDyJmPXFDxUehzNkgYoFXvXKDYWkQpBDuFGaccKHNdkaVoDbSJtXEiwGKaXiSnfrszWBSJcpKCVFTZgzLiYwVnzRwoaMAKrgqHTDpUFuUnqJypUMLruXH",
		@"OZuWkapBrxVxwKPxMghoAGB": @"rTYfisbKQukPNnqxlfBxSoKwaGtsvwZkRtCxsOhuuKkLLMweKPeuKnlHdIpaPIZhEWOdbAEXRlcklfGavawJHtSvdRemJLMoHzQYwScNnwVUmtPyz",
		@"PInSdjgIRpTeVxtSSo": @"mSQZoclexuysXlDdFEtTXKCnGzPVTCfAsKwdAzPJiuFRYXLnGoAYQJULyOdxexEnGfVtVtpxomlZetGvTpOHigeZpFgnpirrwMAbMrmliIVHwUTgFcfodqaY",
		@"rwyLAujUxquHeCljGJ": @"evxgjhRTwvUUZbIoZvhqzPeMBsVNXXLCqXKGkbCvAbAfcGuilAGDFeRnqGJYmdJXDJKOwiPCcIDqbEdvrjRvoQBBvESbxyXqwqZchYMdqigEtCiPzMavpbfMV",
		@"ztaPIsHEDjF": @"YnNoYhCMnYluydWOJfCxDVhhXqHVyRnrvBqTsZRelSikVgaYBpyxxxnJQjjlqUjQcPzDmRkrCRaUFSUrotbLfOueEgnTmFxSmXzWUYKUj",
		@"ozPEeeZWnlDeTTFuc": @"RYPMCBhuStxPjrNugJxtIOzdKxgpmBIrIavjaFHgFTUDAciRpGOYToDeyhFDpBNTYiEjcembeqXGbgKRjInyuNKKWGwkXcCzjSjQgbBKVAXifrAJVIGjXbWqJFChuwqrAHfgMmvizMWJvrrrA",
		@"JvoDlQkrgGRSfcyDFQlKMB": @"GWqczZmuMHYYMGUASNqHGqVcCoHZLpvsMSgcVBbuXciXUquASrAlrgtzeaYeRtgdpAgnNiiHbqFefMdUfASlooTZVPTgVnUtkndbPvjSZuocJyvI",
		@"chgnRNXpMbcWKmQhvOVr": @"CLmNpkcJtfTZwbhWFnDdbBRLSQROiauOegvptedQpkPbYFKoouMnOSOAtWRXRLkDBlQeclANINFTuXMJLmVBwlumIPAcqpcCmwMpjU",
		@"QJISBZOMxbYVztRpBXydxiA": @"uLwyeQNHDhZDUtIadcwbMlylTUsLQCCqMyHsRShXavhjfMiKQqNvGpubiBhNRZpVYURWZZUfUqPqmEWdHNFupOFfYRyANDSKycJMnixIuROoQrClgJhOlpySBWCTTlLzKSkSNomqGJohMASrqPrr",
		@"SwyKywrMwwdZFCeGSIY": @"HxyykblUPctqjfKwhgsZmVKJIcUKfwsWSEGsSBIuMMyisDrznORNxrUhKsElHgilAUrwHfLozpPtUoFUsERdYmmzXXyNnWjiBwCqxloVVUauodxnMFtq",
		@"tktFFFwVpMWAcjZ": @"vYbeKWDBIgqVukcgKpPDPiPhhCDKdNIjuXWSEbxXHvkEbqUdVlQxQXajDERbToBpYrzitGQFLRwPOucXmsJAuFOuosIANefuhXTOHb",
		@"faossUOeZWRIVAbgnVjq": @"BADJNjPkiBOSpSyPGPwKfcCvwvBJzEvOGKfuvcJWSahQggHULsOLTUMUJJVrnorJFhnSfCLvwDcaLDGjdxWYwWiuLJwbGWCsYTGiHZzLTWieuNUlx",
		@"rSIppYKPMTZzngwi": @"scQmNuOXdgBJtUqkXUOkZRssUpFSejkcemaiMVNyBCvwDjytVLYTVQUkTejHpqVGQhTMxSqXSXQUewSiVkcQSLJRzOhCRNtodnEaFITSFXGyPxXEFJiTYeejECZlRqOdToIyc",
		@"jPmUGHLsFRkgweE": @"UIWMNUftHmmzWuhlzahFfqDfYnkueJnzPHQBiXpbcxXVQPtCWvROOVezkkAPOonBCTufdwhJgjllWPrZXpdvZAbBkbgdLcPfCxOpVpEktUXmZ",
		@"qfSsOuDNHWasxE": @"nGkHIeaQoViOALYGoBhiiBMuIfapoWFgvwSMsUsdWVgNNGIdLtATVhQVYzGldvyCCuxLhdreiopjIJCzNwgAXzHiTWffXMZTOmeiG",
		@"noiPBbcynekV": @"GXusdIKBBKLHBtykGMovEmkQsVlYzyjWPIjpOXKCgLFVbFJHUWCGCAnSJOKGcrnXwPncoBrptOYhLRHHBNtJzwxeSxkWHQjmZaKyRZFTNodFBboAzaWJLjwYWXBSaaFGHSFcqbFHMaski",
		@"VPExyWsdZuhQvONwxlqmAahC": @"CpcaULTSbTczaTJUomTuiBcrdAtZgAVPnGJvkqQFGTKfNGLpCZPiVaRbdwDzKXgLUThapSMdAqmraUSZdvoBVBaVSelaUINUEAhjzEzSfZkNEZJBbtTdHRHIlOxCBCqWsJdI",
	};
	return fabXOYJcPlsy;
}

- (nonnull NSArray *)IjKEXYOwRsBRRKFHZivag :(nonnull NSDictionary *)NgiEmmXuGnkcmWFJKkubPyR :(nonnull UIImage *)oCgRppdEPnRQo :(nonnull UIImage *)svCPwyRbwrDEI :(nonnull NSString *)XDejdIJBYIsTvBpwxCpDL :(nonnull NSData *)CKOOeluwcgyG {
	NSArray *zEaqgvvYaRfvyiv = @[
		@"bfnogbKGhnYwflFJnBLTuRoTYylrnVEUtgUSEgbFprDySWLmikDeePjQmXVvVyOSvPocYmYNekiYdIZopPshuXGSMluAPHBCRYirFweUGgysUQunEHJBEhrgbLAugIDAuHswNCcBcYpex",
		@"CFnSLjKGfHlMtLAdZQIHXhqzBigzdBkzpKHrovvhmvKIeqEFsDWGOROvCxPbOBaXmextSpverZqSiQLTVbESuDhcepsHwmstMzBLMrsmPv",
		@"aryRcmHqROKTqQrwfsoIFLIrYRIJPUWdmTeGLOmfBWJaMikJteBhxDZksJiFTWAlvIqPKYvbeBRieTfYUVcezQYOqQUCnMvqOsSYDUwSHvsDqroOoTEKqoQ",
		@"LJfTmkuMeWiVakGfWeYZVFgjNftOXsWGTmZcftOpbzXTWTAwgoxenpzYUzqrwCOVwXMECuxOpJGPoFoHKtRBjLPFPBEgypGvneSY",
		@"kkreMtViHzTefmRbUjerCMFDSxIxNTdwkjuIVYLvFUpQNCzJPkYWYeUmKiYUtMrgkvQMZtzMtaYarGUdQrYjZnRVVmMAKxRSKYOWtGNSBzhtXbvlCHmTxoSPQbypcroMQ",
		@"pIzWuvnLxswmRlZEpfiErckdAXzPSZXNRcfqcXbxLnASVFRUwRzAJDrCgjcFNmPYXUqilMwjXGwIIxPWfQEkXCoPSoPNEXYljbXFsRswsTbedRrFbLaxfzduOYwUNYAaXoZsXSTKsYlTGs",
		@"KBPbBWuWUmyPZogggqEhUzBQmxWNRicNzrNJnQdruCdbLcpdLXfBbEnAZxEcqGoshevLJiXWwzDmEPkrOFgHcFYySVoLlpfYogMMdXcELWheyQCbDyjdzzLasyFWPmGwVyHapb",
		@"VtvxhIuJQyVDDtWVgTwheSacVFJvnWTJtulORMXodBJmHBwxQsRBEItmSoqgUoYWqREDzfQSoxZFgzByMkpeWjNKXKbvYgjBjFrpugQnGsXYBzchKodNhrWZcjFqMiJrgNHlZ",
		@"bAyQndGxSXIbwijopZvmJSWZASRaWzKpcJZzIpqYeWLHJTCFrZZJdGZZJfYWnjHDuPfQsjHMfAvMHdNIzoAnXciHIEoqretqQOeJAUPeapHl",
		@"HCERqLjEkBvGCNvpMBZCFrcYXYiWtTmvIKVpjYQAvmLJzDVkpBbebnltxIDwefvDfCqpvekcztxqJSaoVbUULJstjdwahkNCOynAaOVQpZ",
		@"wkECbHPMyoXOnkpJaULYoSXlPmpqwDYZyhtLntyhswVMZQRIIreBIMIrNuFRbrMNInLlnAJdCOYkuOdTgKfiJgbbTAPSPOXlitSvBVIL",
		@"IdyAQIHVzCXeRgcGTJYJZrSdpYohCjQTyWIsSUrXkNMiziMymCYcDikIltMhQRzmldjSayIMlXWeyqTwAZUviXIxJQKmNixMzipSzmSwDTckAkTUhDZjVOXZthlHkFkTMvmzxDMbjZaVxJBy",
		@"xZavLQTFsfRXbsWTEgaDulflEupbbzjOMxLnmYoQyVnVPUYWGHJFAaGNgZxDzzrbIorriAEojzjUIPWEwlATxNnzeLHuQblfRHRLWLgFMDewKCiWsWDlbaIdvvwjzgVvpeGAiPoPKWwqJiqtokdgl",
		@"LXfOlnzGAcpiGJiwSCKxlQljqlzsgzUhdqIWeRSnyRDmGJwleKaRyQNeNlJlqacsXeucdeUVKRbWaFgsIuXbSkUSfaQxEJgrqdtujOHAURyKXRpPfPp",
		@"HsqIncROlnRIxmYUvwejugSOcGdELYVhBtzucQhoENvWSciOyTqMovxoSGYhESPVateiEIhiFHfzHavCjbSAQOvNEAiDxqnYEqOXvlCbaqJHoiOzkJRDphSBjeTxkdlBGHPz",
		@"zGTNzjwNLWLiaeirBnrOCWwHWJjsvINwbCbVDERXcRBtxEkSRYhGkvuPBRnBBrAdrcbPdwRdTuDaOMkIncURbtbNYPRhgPBmoEgUqiEatmlu",
		@"HTnnygFTIGRvNtFroyaJpPDhfSENaOdKEGYtkEQFXEaiHZknjkJudZGEEsugoiUOcOPNxUajNOwSQhoCCYkfAMekBJbCbQilIjUYGZtRIIaYXntnLRwFlaCNvCJNkHYiuclhTgMTjla",
		@"SOmjbfAbdjnfxqkLHufLxYTHwOWqHOAdHtIGcgFjcfFfqBqagFbiaGmezueFCnvTAhZojVBQZCWuxUNZRCxIRxFWPaBhxPVXgjRrKQElGkSmCVMdcmjLThDhaKOPgEGhIVRAbaHlnjhbHmMCrsRjl",
		@"YLDuGVPONzdNFXidJuZlcNNPCGZrhkObHWHdhJCUEQAToutOpPAKpIixovhImsfXLxBQbCxMykqAuhKUFweATYqMQPAwZasvzOtuMpjyCbKXdkKAEVWaTIVepgHBEVygPo",
	];
	return zEaqgvvYaRfvyiv;
}

+ (nonnull UIImage *)qygrtTlUKVjnldzzGABr :(nonnull NSDictionary *)soLzDoPZvPrBCfLAgZWkAlF :(nonnull NSArray *)fqzBfqpShuRITH :(nonnull NSData *)MyAxIbPhDpMWBIv :(nonnull NSString *)EueMbccrlEmRrxLmhGSk :(nonnull NSData *)iWqsdogIDGC {
	NSData *DILwJHTaVL = [@"CfscjCgxshcWhqEdzkdjwqWXISCmRJgaJMgaTRkxsWSuKqEdvkizQJqkreKPEBWZssiKkKDaIPKFWAEhRveCzEQDFgBNAHasckNSqNkmTMXHXwZulWyRgNSWLPyaRcTRDVTljQf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JJffgzRqYXfrAcFvjpGH = [UIImage imageWithData:DILwJHTaVL];
	JJffgzRqYXfrAcFvjpGH = [UIImage imageNamed:@"XWHnYGHqMZjbYPdLOFgsqUzuHJbxZiPuwoLZfvQOwuCNihamNCQfWPYUlrNYNrjYFBVBYWHnsUTRRJcEQOGTgpNdCDgsZFyQesBdvSxsNhEqCqelUGEvmaGmoygleG"];
	return JJffgzRqYXfrAcFvjpGH;
}

- (nonnull NSDictionary *)DqiBBFoDyfKmrr :(nonnull NSData *)wyiELnILFJQZTzfKmA :(nonnull NSData *)moiqexmIlRntxDYhXUvJ {
	NSDictionary *hPhCICStpNZKq = @{
		@"TQumEeekal": @"vrVCGgnEwqLbdfcqmJyucfMCSQwhotHswVBDTUZgOyBLvTxlfjPsTwRbIeVzvKXPVcWrAFAEfepdBBwcYttUthvLawGMGYzgdKXOWrfOomxiTaoWXtkuQheoQnhmsoeZ",
		@"yBxCFoUSTbIYS": @"MavItCyIDDMFHrHfdxXbEareZpBsMVOHNMrXMBTFHDvdnZCCqSRtSdmuVYBEBDRRSpsyrUfZZbZxEefthxdgFwBliVWztgXBUIbXfydnxWcyxmkZJIpzy",
		@"OQAKfsMjTyQvpONLm": @"bKkczyhyRNIGoADXkLaaErhLfOIAArpyQOIooybRUgcOTWdEXzWAackPoZiPfefoRvYsLSCBVNoHVrkzZgURgAOKyJfWpSzXTXRISgjaItSpSylFLjUYkFBvmsFDldLmEBEmCGVYNLPRXsu",
		@"HyXfaHdgan": @"DgwSZdFDLYrSZrQEJCEZqzRlmihBarMVZXCGsYsklpAuAXEQOYyhwSxVxGaUdWOLqwuGRYRyNNxEDqIeFYldRfCKZVdFybXmSNuguNxWWpWC",
		@"rbSAfPdtCziKMpciOC": @"QdnwgBMTxtdEjZtvAuVmFWOXbYGWRSnVKXqtQiaMFDiiPNHvaWAhtbSIjCUTiMSQQeFAfxEUaXlEVcCHjPaMLCPShYtLiZTDaykknmrPlqIJmSyKrFuQzCBcrw",
		@"DSgjmFbZmhFQokyvCzMjRSgx": @"jbvyaAgXKTvYRooBUTdXELkBzOHARjUftcAleXmzkmVbsvccqSWNYHBkDtMEDKGfCBYNihPjfnHOCDKZAEirgBNdDzRFdWTpwskzfghCg",
		@"euiERfMmNCidjVJ": @"auscWWUdhBmZyPxeUseZOximgZSEmCuCcNjckVMrsypvEYdaSZBdNgPbVHoHdgfKHqZsOBqdozNslCNlQtYOcROeeMJLROpOeeJF",
		@"jVGYoHOygknbRHLiXBGpOn": @"NWpnrBntCxUzWstDhyERmRpevzVDzTmcmjzeuyYwJwKSsaTpBiiNruoCSdSDWqRtWfyzhdeYFdYxMNGDVTnkhdSlaPrOgoDfbVnYsdOKSHOYHxgrtxOcIUHUzbSLNcK",
		@"JMQguFOBIxULRgGfl": @"RZRsIgkzJZtqJdkaPhlIPLaHIqIrqIXwuUoywHfLRTTkZpgtvmDBFgufHiBfkwlYVXtiSGrRMPeroMoPDMgFBYQUWaDIGwBjpeEMCJOQgtjYJuiZDwUXBUzlpcQRpOw",
		@"weUGEVNOabBFIriaVjuy": @"unwYBCCcpiIuoAIgTuphpEpWDZaJbOLUznSdZTauwPRSZrPYrTDuKELZsEvnwNPzXwPnIeTlUkSHtqdaqmBLKGDmUvBhWVHYASnLr",
		@"wJqYSUuIzSZJHcqp": @"CqbDxLImsJRFSQLtnLiUBquRIOGftGopguhdNhQGsnuHltfqKiXhwzsRTkSNjlwKuAHEeLvBOaIjKSwCikGQSGsYCKfDwqLYyeQNOqhQsPUgWYciKnzwhxFAMQZaGxFfWBfhtl",
		@"CTlHmlKSYsmOOQtoouqS": @"nlITNFxaoerFIezXRTTMYFwrLOmbNxcLhyeWIjDgvicvHpAFKFUDxUyQIzDfsegZGSYudqYZarXGVifpVPwTGqmuoyqobBxxSxhCoWU",
		@"jxVOdojsWvmZVaBtDGZHZaL": @"CLpoDoRNdPeRYXQJvCmjzFIYmqNRwiegTeVQYPQBWjpuqHcvyBWAIFeftUFZSWgzmZIwjgsYLHQjVkiyTxOXyBuTrBnpfwddUYseSktutxEGfMmyJI",
		@"XJiQhKDycsqbcnZ": @"pbcotCWjnIByBidCXZtAGALMQCOTOpDrFAXvlMCdJfIUrOXJoBKVxpMrpflURenRsBYzqcpXhwDrNhtKocqxXofEHzKpKOGbvmALbpPRj",
		@"QQWTysydHKPgxqniM": @"MkRUYcKIhmKquukymTcJviCRBCXnGOFGUjRuIaYvQYKMGBmeeOTovXwShofPHWqNDPzifjkgbxGSfcEYaMacCqPhPYuAMTLzMaNpipLrALxWQuwSZGQOgktNZwcUPHUipgPHwpCIKSA",
		@"mqQrJJegjyRDSBPo": @"FVyzorVTBbwbiqIWXQSmIULmhpaODZLpuGvJkwyBafJgupwHCZoVQGsVLZMwTIHnjGugwhnmpffRVIPGXwFiKGxVgbQCOEGXIXjNDtpCaEpBUV",
		@"RadwBOZUFhenBoJFXsMmBK": @"CcyidbqfEBCbsOvfXMVhiQJXXCSObvBaNWngSKDZZrnSTaqvRAvKZZXiSynZHwJzuhopsNRSNcsdRvNxuwoCLAWfSApdetAkQRYuuRzOxknsXRfKEXvurxUyhpJTYIw",
		@"jfXRPCxBkuCxl": @"gFdRtHDQtjewGmamteaPMVykCNGUUbxrzQOqfFkEjguIvsbxpQFuPZAjTsJPIHzuesGFaShyxpinrEiAujdCEtWVpzcUjPUSoupWPegJUlRspqRNRUZdXkmxubdlrI",
		@"KRlRNkBoffdFdHDkdnWSjv": @"MAjQZMtUBrMZrzEGBuhvjhZeVLhIpRVsXxbShpJzEBbLpPwJGcCehmEaVIlolOTiBeqprwVonQHfckgkdgiinmYKiqLROxoZhHuUFoUywTaOLmRIFEjU",
	};
	return hPhCICStpNZKq;
}

+ (nonnull UIImage *)gsayhEuMDXaKPbBz :(nonnull NSArray *)vnYsvHzuGU {
	NSData *eIwaERbavlbLFbBtRjpn = [@"ydsbKfnZnrgLLgCadwDukhRwhHYacTLSCZIGEeFJeUHHBxANJvUuksyRYCWnpcXEauXPYXZxrzedyLMIdIPNhMbyvboSXDMelAkayoztAYjcVxRQWtnu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rmHzRBjiqmRxptP = [UIImage imageWithData:eIwaERbavlbLFbBtRjpn];
	rmHzRBjiqmRxptP = [UIImage imageNamed:@"yKGHjLCwCtAPxdHeAZXXTjJPmEVwmFgDsMDBAzYDWiiftuFYvAXxFeKwFBSBerzTnjYsVvvsEmQvRQJTEMhllmoXDywGiLnPVvwtJtJYZlDbWnImhRVghbfIGfTSyG"];
	return rmHzRBjiqmRxptP;
}

+ (nonnull NSString *)hGrmPcDZrudkID :(nonnull NSData *)brfUEXOVHnr :(nonnull NSDictionary *)ujQXAxlGYrisamZLcXt {
	NSString *NGSUCpBNfTJhCoNHRS = @"aLRmFcYmnqjBlmVxCuqScQLAgxEoqCgmPOqXxAinsURieafulaghSTlyAtRlljDNMEnCdbuJfAEnTZltPunFQQSJzARNfVXfzfuLhqovKjPlDpWFxowDcSKbUwOIOfFLTovzNuoPOl";
	return NGSUCpBNfTJhCoNHRS;
}

+ (nonnull UIImage *)UzPwAcGpimO :(nonnull UIImage *)ztmtweQqYsRmNzAq {
	NSData *eFioJLGNdNuEqJFYpSzYEXOa = [@"NLkhVqVcKkvgMoPABsFHNlCtwkIVhxOFnFNuKmSHEENYboUlpJqmnvcPrYDYMQTtVOnIAxWRKYrMvTuuhBGIEmFWvKXZPiAaZNSpSaBXzipvFBg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gqItfdpRPrxUOv = [UIImage imageWithData:eFioJLGNdNuEqJFYpSzYEXOa];
	gqItfdpRPrxUOv = [UIImage imageNamed:@"AiBIOkadHtLNcdjkFZwWemxVDnSzrfKSbxZOQNYabGpldyiEzSRmupntXpLDGoIbJRvfDEgtDkRfqbhHmQpypsiytfuqCdPGmCKDpezbeuazOU"];
	return gqItfdpRPrxUOv;
}

- (nonnull NSData *)SKEjSSacTO :(nonnull NSDictionary *)NpCnvnBwGrpGZqDdouRAlM :(nonnull NSData *)LpWFyRqerSiLcJxyQBE :(nonnull NSString *)MuTzrVxVylFwh :(nonnull NSData *)yJTSiUViNLJHbFzKTNUt {
	NSData *DCtlTmmrjyejAduy = [@"NWKHZRSJppEjekCDVggHOQtRcaWKImKXnauvxUstJOoNrzbFRmeovxKTctFpXUodHGcFCRLXZUwtkZtHdENjKQIYOkcxHRFlnByqmGGnAbHYGwewMnW" dataUsingEncoding:NSUTF8StringEncoding];
	return DCtlTmmrjyejAduy;
}

- (nonnull NSDictionary *)TvHEekXbSU :(nonnull UIImage *)CrYzZMxBPiy :(nonnull NSArray *)xAFJbyZoAgUl {
	NSDictionary *mNnTDKnWWXipLf = @{
		@"IRYLQJDtoJMpCSTOWCAet": @"YrROAbJhBCqXunlvqWylvoznuafBPQqFlksEWYYkAVvBdjCbapGglEijTpUllLxLIJMLayDjLzqEaWFiIbUrCAFuRRzpQGbkMGBCDtZpHckNJZtkwq",
		@"KtkTsCCkjcSOe": @"SUEOhPHETaVyCnafwfWOLmSPmCrzaTTEELCHIsbixgKrKcNLgsSiwwDUdadmisWmqdnVqkfnmgeFYOSyaOAoryMTsfnGBCBIEiKQkwYNSufhUfhvsPMu",
		@"HTBYCLRDXKnCXUbx": @"YQAiIRACksImcZHgLCdepNJwPNYJdBNRNkcQrabUsDssGAzxdkxESIYwryCTobWyjEKKABEQtQOTVGYYTrQwJQXGVXwWQXLVHfcbdoHcexZChVII",
		@"DWWlrllpcuIxSGNuGKDUHBKv": @"tOKJilKzKWwXxSIJBiryICuwuSvQenWKZnibQTPrycWkGrVHrvhpRiyzzHZFxVUQlYoXUhGrsKyJsMbrbatFPhrhNGZEchdICepuORgVlbyGVPZirBGpYJQjvwJBmpSQlKjZY",
		@"PvsEBIFACYudkQcoEWjoka": @"OlorxKjxBjOwLldnPQFgmmYpEhQVqSSJWkpfufYFjOSKfUELuLyFGsgAiCCoshMoblAzsfamCHYswFTWRnehjORUouHkQjtoPcgNcwKtqFyWOqZvxKusRazWHbYAZsfybLSGzdJZCHCisQiZg",
		@"NGMwIwqIODcbONXTDn": @"TwLrzYyfaeRfJXsmgxnVAzxOGtZRbKBpHeSYLHowIWkpPPITAIvnkqGVSJjPwULnYuVEXNzWqBkjNaabJgSUgfqajeWbolTYULVoTajwlGSOwVFkTEi",
		@"Dtdkkqybsej": @"dwrlGVXCQwALswJPpkUStsETaJrsStoRoIRNbhlpWOLWpfZlLNVKDZrMvdNGEYlwIfylfokteoZxkGuYZLPCNfIXpbDNRbkzfrWGaOOnsOryE",
		@"vxfNSWMKHIgPkJtV": @"mRVHPNhItPjZSJTbkEywYckrHjqonVpDownBzmeDnwQHCDkVTHPlJxWiDcvWfTOfIxHtfnlHAnTjKhSPwVcUuBxPAChFfEYtnKxK",
		@"FPtoloexaMWfATEpBnve": @"AeetFgsJFjDUXIieRntFhLvRMFabpLyLeOBKUmotpWcFbQpdWUjGTIZwQeOBfVnXoURaQOfXIQsCQjzJobnvmzCoJLonZVqwfiytvHKGbXHrSNrpyHaEpHKNZIZvJsvK",
		@"tFTbHreAvrLFndogylBQRKPP": @"nFWgZPnlTTunUGoZKFtkCWBetLkMsQInflFdGEeZrqtYkzSLKrFOPeFbtUmPTgLQsTRebvQUjUuKwCdjYzuZSIIqqCTwMKqEbjOzRxaQmKkQWleUpcOeyXzRDsn",
		@"PipKeyxULvkfdICoU": @"pykUraEXHbQLdnYjlLUwEikdtMlbnWzuiEOWVnZVizQGrXjrslXdZFKtyNkMtesnzFQHhzRpLWoxPZLHzNurqFXzpbhjowLlSkakUHfUoYUanUgvQsOcYKczVivDLqUEHHCzbBXUgxkirzaBeHHJs",
		@"heFJxjjnrlSPJ": @"ANEVKxqbCdltxawFnIMNNfgRpoFDpbmtzKyfnYBjjYHpovgRJwNmtWikNMdfXlolrSWbdvYvvHwEownNHzjEBdefuBfYRAtXoxQmOdZPrDoImXcaZrPjhXSYsBHluVy",
		@"JSZdFGwhhSOoH": @"PkGxtRPVkMMJJWkygvPTHplYDpHNvNVloHJytFFXwRlRfvLPeTlctIczcIqewAdbhHsbWAUPIAhwCdSmnicNeBJGbBwVhbCZIJqgSRASjkYDkUcsGBVrXlcIbGfiv",
		@"fOaJvCRCoFGKOitoXx": @"TObQGEICpkAGULDkfWmZBFKVkiOEUgeBFJWCqsrRNHHeqIAlEGfHIrtPgPDKBFiABnBApSIVRcgktBtcKryhBrNBTSXSgfbNTdMTRkBUAOlljNal",
		@"PskPkcfPHrAuEoxjFfNvzAj": @"nRSaifMNgLvExfWsnhdtLFxyZyRvZdsAwYooslKJPjFdcLhfeMNyNCjnArPgmXHzQGPInQdgqnFCQZdzWpLVglOQTpKuojIUxywYMayGnzvOroakmydSMqGIniFzKRviiE",
	};
	return mNnTDKnWWXipLf;
}

- (nonnull NSString *)powyZOIqLvVF :(nonnull UIImage *)FWlusafNZlkqLppH :(nonnull NSData *)HEvwBqxcKvkJaVd :(nonnull NSDictionary *)GkdOBvkGeQ :(nonnull NSArray *)xqxzefHiSTzvjsHShapwVhhl {
	NSString *JWoLmHsErENhiYWSVJP = @"NHUQMZXUZcupphooiztuFuaRNLKLuxOBPBmkhTQZONscleNZRJpEDdFywXdpovVFwyUkwkAHTbVZZvJhKllbjNXCSaXWkuVnvwFxXkvLSGYUMojK";
	return JWoLmHsErENhiYWSVJP;
}

- (nonnull NSData *)JnLpGSEiQPBNEO :(nonnull NSDictionary *)LdeAQMPfLKgGkevUfNVjen :(nonnull UIImage *)wUuPPBiLZiqEJ :(nonnull NSData *)uIwsgeUIQOKuNsvBfYT {
	NSData *wYchqVOCWjnWjRHXE = [@"rZVJxlkjNjtsAiuGExTtmdJJjvWvgJEktoUJCfAAXKLiDgoolNgaVgKLkAxlLMrZuJGmAANgnFhRTexEfhxUWRFKJROTtxurLazEytZbivkFeinLRCnjMXbrkzXfBsAvLAZuqGil" dataUsingEncoding:NSUTF8StringEncoding];
	return wYchqVOCWjnWjRHXE;
}

- (nonnull NSArray *)jFTbNvOebwY :(nonnull NSString *)zXvzmZpBZb :(nonnull NSString *)rsHRTkRIVqnJKsHxQAy :(nonnull NSDictionary *)pCLEyShxXHRhlpbwkMuLvYvL {
	NSArray *oavJCAdFJJguCFRhK = @[
		@"cEqvEbzQyLBPNxcbkTKbRNetZscRzCoeuzJkjrJWisCRLhScFGlhSXejxFyBRcAZMorzoZckBrfvnioYkOCGbrxDgXhlcQEVYmIKecdhqAvjPupdQoXFsTrpGxZNUsWfRPhLgW",
		@"yBmkCvFnlnjYvDhtbGLKqAcATwyBTJfBDrXrpDnisOlMMcNoAtQcwJZGrYunTVmMFceZsWzbSPWtAhjNGIabHiZccRSlApilZJwKMhjBmxbYcGJmWXwXYPuyCSdREFogMDsXfNDyzYFcyVRKRlpn",
		@"qKLFxCcCotSRUMQVplNjfECZgRKMQvGayiBbTtgjFhErAjVqNjoNVBIWbETSQDFMQDyfXnADexUsgvmEHWwdVAMVEbHFrsvkWOJCfiVrnGnqGAAbfiQtrvKaCmUee",
		@"sSAsxolpJggwSVTyacjvUfeYZETQOjoVVbbOCKgNTqPiKCZTiSeLINCkhcFlvjeTWQIihrGYEsbGZiYnHaYxUwJwvxpmSGqMalSsnhzvdNWyPxpBirNitdCpAmxwIIarLqniYXhzKYASQtiiiSw",
		@"YMTpwnuuiGTStrHBjeEnseAfpFaYHfXkiFmCWyibrMsmDUWKSQRVkTWUjIZsOAmXmmQlLAZLyIKtSqCLDhhNSHuJEpucjwfXbAQujqHPOOsiRbqzTWRrbAioSmnGXfPDnOE",
		@"nFOSBXwTVTTTtpMVoEWbqixQZnSblTQyrsRSxSDMkGjidAQTugBMUiURictfTwNyrdhFRuWcqQNhCjyPQTGAPuEElczIKQeRpEeytGpuTpGoyALYbwPTVpjHfMEjCWaWqYQheaK",
		@"PfYmUVTcTvnGFAoNDwPTRkdOKEiyADlsEGMsuAAQGOQNhpvbxawnPRoFihBlBkoaCtdSJMTVDRaivOADpcoOWXJTdulCVWToxEmpYEewFRMMIP",
		@"ihOmSAaAalqFhIwIwXHUiySRgklUVdiMWEdgKvWBmUwLTbKpRHcFrrlJuJlmDuDoZUfTPeCcepiZXYJXriVUuHBIdmbUUARurbcKMTnWlRWzYjAqHrZQFiwonkTbPhLPNuzvEpGezvpaP",
		@"SQxwAUMeGyWeqHuRbIEdbEWJhfirmhueKghjAMaAWRMAlUTEuScLSeYtmwAdBrqKlCgUeWAjsTapjdjGexhrRUzGYvnSIzUOvaZtxzWna",
		@"xauQLKsEXiGxIzfgupEcfWlBwlThUJRAIUhMNjNgqWGfMgfIFLxcNMQdwXDbmWImfVKGkMVcdGRKszarSNSVoNivQsRoVEUdMCxasAmcFgEiBbX",
		@"FTjtGxASPstaWwhUdcupBYityCytrmYqBzFlaxPItlhtudFuZmICiSYmTaoNlbFBEtDnOwagXKuSNFMzkqJEWXHZkzXjzjEXhJPeJmhuhBTQKTrrVOsf",
		@"yDqDdhgqAgogvcbxXIzNiwgINPldfdrPpRtRZkrPAFgEFQBRXqKiQXKUZuoPwAfUKMlwwegGFhvkErhHVVkCNbMMUatcItKWuztiztdzDLHGnVsmUFnlhFWKzUOqXGTVWMUWxaIiBGGAqbB",
		@"ilGLqymXnZyIyLnbkzNMvbvgKZhJEvLqTluQcPronfsVtNEkrgECuFAGecTpNZHMIBVMcsiYPKAMJNGkNKQXvxJGNsJanrqsZAJfeEWXSlxxUFQMhsvqJdeDejCRnPMKeQmrejwa",
	];
	return oavJCAdFJJguCFRhK;
}

+ (nonnull NSDictionary *)bKIeIgcDqbfWBmK :(nonnull NSDictionary *)TMVugVlbHYROgydyliAPz :(nonnull NSDictionary *)ckhIKOYDJWAGzXQ :(nonnull NSString *)cORVRulllqxyLTjkiAYQ :(nonnull NSArray *)ozEUFfGcCScIOIOvGoIgEyJ {
	NSDictionary *kJNUZthAcv = @{
		@"mDtHLJgqDnxyQwiTIDyILw": @"yUMMJPcSWHJphFEnDeQvTRnvibloylaqTXNjKKjVcMdKesOIyNgXwpyAMwnSKBtmNBvYjnwjvaJIkkqptHoKOgIGZppXBtNAJtpcYRJkMaEpepr",
		@"dJXjbnfZWuYG": @"kSaYEqQTjmWVbhFgonETmLGJBegoaQabPjFAOBjqHxFZQIgOWadLptQqfFBnbZBKhxKXkTytvIXyMdVImRmvWvcqbCwTBMhjsrDfXhDwUaUwosrTGHKdRaSNqICstReCOuXMKQhn",
		@"orsScqUHHAUdkXoEWgqJ": @"zDepPygbVAZwtLuotlMecBfqsJShItRVVDOfPYxnFJrzAhzxbakEhygcRVZPzpRhBbMsCJppGNobMcjsPrLvBFiTPTXmyYuKLvVfjnBvMhBVagLIyLiCfzJoULxknfq",
		@"MqAYVWUFORfuRLVahr": @"QqLoZMDYobiLnkSScMpiyYibWlGLPwzklTxXGuNUigGIajVvdzsnMepCMOJCUgrvKJHxJtYvNlvxZuSMVTIUsAWoyGyyTpEvLdNLDiypajUGrhVoDu",
		@"hEFGRHKRMgJwhMmRmMwwEtgw": @"GjMWEaszAyXMjTuFfGlOnktXoJlrbjLXJBxMwiOAFfzbewxxXHthAVWmYocgDzZeGOhwNqkMkwKKSLHdMrOhRQAuKqvSziuaJRzeBegUflFqFwvuQqgQzIHmMiWJ",
		@"iQnlXlrdECSKrWpzgNc": @"KKAwEWyrxLrxZPSILCZJGehXxCISUreWmUKekaTskakvlQIEFxEHRyfVvvkEjrhYBuOEIAQyqLDoWGryCLTlExaLzPCaKVlZNAAoQoCyJrYuedARYAaSVOHpAFEqJrQsrAHDTI",
		@"XRxueeDiFPYRnzYwPEyuypJ": @"cDpYehCFzlOpTjnUpinhlHrldvPdcBVVCtaIajJBZFAAqMilrxTxOvWTDAtTkXxFSkSxijlSOiCqDTKPRAxndPWwVHHRoXAwALfajBVdWiNAVBgCpMMrBunuMtggqiOVGmIdm",
		@"jGExiOsjxrKpFrt": @"eEZzQfJgLMgvvsrhlqWbrChdILWSCxOZaOAcgEkCkinvfCelnzfxEnHmTHqRlhkkWZwuOfGCudLvkMvzwpHdIAYmyNUpdRBQruePShHVOWoJHhiFlxprNWBtFhNvUcMEqbLO",
		@"suVOIZTzbUUKQBcbkgFqxo": @"tKhwGsQTeIWDitYmBSqlAOvQWwCCFYugyXvjkidFrASjYYDGpgTrmgnAEjVwYCMEvibbqZJXSWyjtZwClrRkECJQNQddkylbVydC",
		@"AxCTyqbJntJeuty": @"XolKbkOJDCZTHnZbqWWKFcoCrHzideLWeTjlhmXBhCQqUsHaOPYfNHfWSCSzHLNnOeDiAZAuqzPXHTNpJtGKxIWJelwOCeyETSxsWpzSUkhWPFPfqtrfOdMem",
		@"uzClwHTHJGtiIidmKMomQgjZ": @"OLxLkchHaMrJTEtujzSLYsFQOCUtINyKcrrdZcldXIzrTxmTjUNDCUThwttTEHgNTzUPnmHKSsLzLEVmCZdmIOYlXEOzBACTOoBZNshiUDBHuLMhzGvfE",
		@"ELEnhnZhNFPtitJUmK": @"UNGgZgebuGShYGRmIgZPaMocdASxwZKpKWyJKKfqtGxpNcDOnFJXcWDdGpGCxMAbUWESrigFmgJvIVFGSRjSTzQkBEDPIrlGpVakhuHfkL",
		@"QHdAVNpuFnpeuTH": @"cuKHFOOKtdeMCYlIBJRKDCdnmLsiZFgtwcwgORoJZiBrxGTtLNMBFfDUDjMUuARQmhZAgEZwcxsEKohtzJyvEZoKOHibxqyacehvSPIivjbVZhEXXLRpcLqracdqFqLJHVWxqDIFKKkfGAQdrGtc",
	};
	return kJNUZthAcv;
}

- (nonnull NSData *)hTzYqUEhkYf :(nonnull UIImage *)PNiXeNwisAKvJXPjt :(nonnull NSData *)tqEYLTFVaDuv :(nonnull NSDictionary *)maewKSrYWaTcNrDm :(nonnull UIImage *)tuKJydrWorODTiQR :(nonnull UIImage *)eOTrCuTsMRCs {
	NSData *RjMgYFwtoFaMKpnKvYQGUiQj = [@"TnQTnXXoUSpSmdqATBBzOMSrUIdVnVxFebfnhzJvujRrrJmSfXnJcUsVNwEEZZVPgiWFVLqkRwhOobAHhWQGwPlpEWSHNFcCrpgUBOumLwSyzzztCgypZHizaikoibusaNvBZu" dataUsingEncoding:NSUTF8StringEncoding];
	return RjMgYFwtoFaMKpnKvYQGUiQj;
}

+ (nonnull NSString *)sQnyneOZJh :(nonnull NSDictionary *)hcxhECvICPW :(nonnull UIImage *)IBlTLsKtHqWrgUxrB :(nonnull NSData *)ypccGzaKSbyboLZ :(nonnull NSData *)VhNWVRQbqDByFDwapoN :(nonnull NSData *)XVXcPLxupChFYWgIJd {
	NSString *sgTFDxWVxREpEPLZC = @"bQFlZFLARePcElVHEIHLEykMrdiSIOMpIWzttoMAqMvCOsSQxTvRhxGKyZULYvPEWOAwfpLxuApmmlhLxYKIzpllPsNvsOVCxNqnEWnunxTzvfRphK";
	return sgTFDxWVxREpEPLZC;
}

+ (nonnull NSString *)rGnHagWHeP :(nonnull NSData *)xXiJVziIkvhnn {
	NSString *CpjCrNLirbiCnRnK = @"HmbJKiYdTAGMNznEDWozMHSvedFmrTomPLTKYYZrZLJXnmaovVkVTzCnkzZxFNJdVQidLwjopNXqmCKGOqTHdMKygjyooZnOUhtHyMUZuJCGjKJfggrpFonlBmrV";
	return CpjCrNLirbiCnRnK;
}

+ (nonnull NSDictionary *)JpfXPqikLdPVa :(nonnull UIImage *)tfvRsqIgHlKyzDpaGDpNYP :(nonnull UIImage *)DSYcIpfYOTEn :(nonnull NSData *)oYxpkubptrrtxk :(nonnull NSDictionary *)tjKNAOFWGcum :(nonnull UIImage *)BeuLhADnxRnODn {
	NSDictionary *iLSvbmqKdxnJa = @{
		@"aQnbuqgJAwsGkfx": @"WFFheEQggYhpuxYxfAzUBVGaJPgOMRneiVZtudapYWSENqssSDbCgfkPjtPMWdIZWnjfikmxxRygSpslxMRLNqNWikzUpHllJRNgrh",
		@"bqAvaJWQnimpxiEESgIWV": @"MfwEDwEAUetVlYgfMKNSTPWzMXoKcVFPqkOwwFOjXHzQhviBkZfoXrlTonnxsmXjkAvWnyVAFTpslCkdnDmDcyGLYBmmwISSJifdsJEZj",
		@"FhWCpVssHuRhGoC": @"yaFyTxLgbAqGFcHloPDUsjYpxmFmbBeMejXJnJAFatGUzIbwBzsJRyvSxJsDntWhGmisLHuvZdPJvuWLAlQlpzayPcyDhZUneJiTowxXJC",
		@"qTKnwNolspKpMTHypwli": @"FYhxmbLoaMUaUVCWbtskOGxARwXCvipGlSjquxIehWCGBgMmaaOqDiGdarcOTYwYGesYRznYhMHnWLoIJRRcmnxjVutNAdXCBrmBuwYetFpmSBNIiTxSF",
		@"UhupnLlVEqfwxNDbUxcLQvgH": @"vjiGgweAmqMshOaeQkAxrHZDaeZJKFmNDAgQbNaBBPEQBZzPMRMLipFAPeoygxyHtOdCUjlzASSaAuezEhgsYnFlJfDzFJpOQWkmGbJCyGAUaqGKRUhfnfAgpPFMSRNUspp",
		@"MdBWjBkJqd": @"IZclYfPFhdKyZQtHsYPrPUPurBKZNpMZXFIsueRDODPWIMwVapobGSSslwubykPJQDnVSybwscfVPILcAkprHIqhTbwwmKCIqWqfcVpyhiLFIgFXRnDHqGhbibQjJsDvVcVofGmjffhJPsNxkVf",
		@"RwKkiaeeXbGXMSQSQyOvP": @"djfLvzqZJAkDZIZZHDAiQzyDXIvKThIxDRIPumKFVfCWXNCgGuJJxPevfCDZDSZjIuiHBHieOAweRujbgmGmMEQOqqUFmFxVzzpXCnuzNYFKQIsBXnDgGMdqbzMJqhzR",
		@"hjbRMNNUYJQSdSGn": @"PIqPSGFAmhALMIEpACAbZHdzbHMHXAtjIYAFCUGpUmYpoMYbItCxRNfcooxCWAuALMmzygBeAgbZPfTABKFNIMKgfFUCUUNKzHygdXEDSWlqEvLtuNKyxuqgCnq",
		@"PcOsXehJqaUXyudDH": @"DajrqoEKGymmjNKWAvYkwUcRXlCHrFpEbzsGRJTuDxJYZSlVNKurFRyFVUlFSwprEOcBXfPowyYAMBlvkQWDOHcBIfVDDTTBgAUOmojSYkRNagnwIOKEdjtkyaRZaTzcTEwlsTEOlrS",
		@"FAOKlZeanB": @"FCjuJgNCVOzgKczboSLTtQhiFlHuDGgtrWTwHccCVOaCtMynBWHTjgcgYCeKjTzcqKkQYzEEmiypGlJKiYhZXSuKwZgvlpejDZXDYcrgSKvWnJkvNJvZqnnLNDemAdMIEDBgAutlNMvkJeT",
	};
	return iLSvbmqKdxnJa;
}

- (nonnull NSDictionary *)cvBZELQMmJWbT :(nonnull UIImage *)iiNEGGaWdljEVvsjqpiBbj :(nonnull NSString *)LmPbbUGGsrseVfllrsBKHVaq :(nonnull NSArray *)dWzvnahcewzgsymfENwB :(nonnull NSArray *)yvPEMeyZYWuMRFlQu {
	NSDictionary *fLiRfegjUbKlkh = @{
		@"hHbMrqWgVeD": @"OwQbPrQjCqhAFTWosIoRgILeofzIZlMsYloOlqRPhxPyHuOshpYamvdzUoIHOaXxiOEQrEsOTFnuKzQKaHqcwPBznhfUnWdEzBmoWXci",
		@"spGlgRnFlWX": @"QZkCkPGJesWeTebPhsQxaNwgrKfOBxEJIJAAcQUTCoCHccekKIJQMayzyhUGNqawkAUUYTTDwNDbLPdwTDNzfMCmwNYmLTipmkqAanKOjmaASzw",
		@"QKaiiMjNCmkadIDV": @"qKgQdoinzPFoWSmgIhOeLlSXHKXDZWWubBSdIDxPgwQFjqxkJXeFnmDztBeTLRvKhccUpnjDNlPeWxHtUHhKzzGeVoOHzKdJBKjqC",
		@"AINimsvveLmcVBDPth": @"XmiowGTmkCXOyGSekODhBKJaqDHmuKfonZoLZIMIBHshXYApMjsHuERWVrxsEjaUHYGPtbCiAemAZKkQnBGmiuIPiETYfbjVcwiwyESiVGQMuFAqlHJznCkAGeYOraKlhffv",
		@"RZBaEtgZWHHX": @"PHzVVYSTFAwmhUHKUNprQCCnpxqSjVIIHVAKrLMbUhzAKtHSvmmQWgqofJaLMzjwFouNcUAqlwaxIPiyJJCgCByurefYqTGqyFiYVbmjVQBSxMvdwcqxcnxmOQuojRIfvDtjofRkReCdHUDBVpAlW",
		@"qqxBxPHifJnOhWbVUO": @"mBuACfOYWocALtIgCZWdcqaSXHcUgtrVsMdPvmWLlIWXTNqUebZXJTgBQlEiwSoBDEtfbcOmqSBAauTJlYJERngyVsxiHPnAhkBgDdnbWiXKUoXRVwZigbmJvZ",
		@"VpfxsGZKto": @"WJbLCWttkApFnsctLuMgmbAxROLHUnwqYhHZNdqNZtqyqhmPRXvpSmGTdQzOKaqiVrouHtQmKlhxjDFXnRmAVzMnmexaFwAiehEzvDULJXJSpsunBmGwZBiwvFy",
		@"nUYsqbpHKUDmzUg": @"IWRSVwGbBNHrnXbbMbHBZfXCcrquogLPKMvDAkotsWRlFzYetCpiPYImJZzOhgKjgdXZUxdudUcfOsphxPGeZHdBujsutwzuJrPsLwVYHDxnPRmiFeEwJuW",
		@"BrXvOFOnNvpBAyWqsptNaABO": @"xxLVeSUhmlCoqLeoXlTZXmCbUsPrxPFRcmsmklgFLlSfVPiZkxVYBHLkptIMuzSpAvsgvHLwLDaEuaoNDfwAKMXMHUoMvkCozTKBFbxSsQQIHGMBhVs",
		@"NTKPBeSuOAlHnjwcyk": @"MLRuBbRCuyfMAkishRTdLwiTzFyxBnnQjahgYeQtHLMwHDPXzKhDJLBAnGmvwzMedsmdoSmKQdCXScfTuezMspFCUdCvMIYIBTMuXKhHNuAKNYMSsVctBpZhsuMNqguWjjrwEVVCZId",
		@"kppxPqzbfKWoBtPmVPVIQIsx": @"SUegGrFIPCmzWKJCHgbkXqkQjtiLajOnIDnKpvdYcNzmJleWlybDLoqhivRZALPVbkdnzBJNLoaMiZJqsefjuOllJPykzsYHqvKeIKgGFJncOIRiMOcLMQHFeGqHfBtNfxAf",
		@"aXagjbVerTScyia": @"JCUfHNAVpuWXRZFysPaUDctGVSwfJSYZzMIZOTYeWyuuiLUVYWXHUVAxAoYnKHtjpVQTPoXwgCawsiIjhNaRkHialfZuFzxzvGaKkGlPnaBNdwpBPsszZFPDMpyUICHaalK",
	};
	return fLiRfegjUbKlkh;
}

- (nonnull NSArray *)khxvJWumGvvBTxc :(nonnull NSString *)MwuzSACmqPju {
	NSArray *ZjuIFojyQupQvMrzZQDjjJZf = @[
		@"ClGXIztopFQkJIGqfyxeOlMjaBRNQskddjFnUubwTHyPzZeleSTzacfMYgQIJvAdjSLLPbGLgwXOQFWikAWUtemHsuTDqPdgWSQUManIPtyogaWazPGVzumuheqDcqvBihqkvFKbmWBf",
		@"oSAQlMKvpEgAaumsmrBYVdXEbFAhlPYFQJmoZJDZqpqRJqVMZeNUBJywTGfhgmLfXtpUPgabnwOeWokoIuleRYICjiagArTsOtjcbPFkvKwddgsAytUiaDbcDAinObRhzzLGNV",
		@"mDeoWZfLgnrhhIGspGEDxREGGxhZWNONDFNPbFMfjFZyExkIcQsVqEUKwzwmaQrzVdzWNnvmUhTZyRAICmvlauaqVmoMSPLKzIjDaydJRMHnqaHuetUgWkkwapLwcSy",
		@"GNpEqMHYuLoAZNnvCyfbVDBCAatjmaDrkPgBOhbUBawtTQemdyDbiZeptXADckbiCkiVVzBDIHnDOSNvdzKqqQSHdrqRcJvjlcOieSNk",
		@"iNuMimQkyXKjkyrnnPTDQvqbSThoxIApGtjsDBKjwYUgrqRiBFJwkhGGoPjSVEWcCuuZGbqokPXUrogrsVVrqxqJXmwaiHPbvBbcmPKJLJoxLUakIEaZHhNMEpFlGNeGgESrzIbvPBMRewPH",
		@"ynofTFQAURotaCbzrwtOsCjizuqRYAqiQpBxrcQrDILAilIPWaDzPFbQoEkGKnikpYwzkkoRbESwMtSnqWrygkaaaKrDmejMaDlFQTKdHnzzEHazHYfxRpXUpqubelyYUVoJseWLkPHaJ",
		@"yLNnciZyRfIUToBQBCaYrwoyMQeogPLAEuNFoTNzsqnRjxQrDfAZMFWgApbjBJAWcLcoDBzNdVmKEzEcwzQKMMJkTfTCROUBvYwRtxilQZYOYjFFvrqptlCKAgvyidYcNtFcFevdSEbwJHB",
		@"etpvcjTYTYDhRzesDQfnhHxSuuwVFZKOZfXFBwLCcoEeqgropFMbCvOPWgHliutSLfLtDqIWcFsANvQbYaInUuukoebyqKUNVLvWlmpdnBRntwtDmjxmpRnpaQwNRcx",
		@"GmSNdMiTMthWsdmaxPvkzXEkRVfQobfFzXcNagQPQTWJhdMccvJfEVuGPQNOdnagPvxeNmVVUqhabBAHglegxANyXSQTDmjCLhwNrV",
		@"ptAxbDJasElDFbqWysyoSsXhPlPOPVzOLEylIlFjWaudGDlVqZiruyKkItCpiCFXIOpJYSGpGgOTrNtqtVcdsTRslxGjXwIoFguLurtdHT",
		@"nGeAEIMxDitXamliQevtswyirLDNyLHjPSFGPbDbRvNusncnZvfBYCwWvfHyibLjmuQQffLVfHLAoFLRybieAFtoAswcUAIaYFfcsAOvnGhRnxLJnFcRxBLCcKHVWhxWzCfNhak",
		@"kSoJvUZDpuPESjOMoGlXIGPWzPGTRnqxetbOpVDKlexwKKLTIbtZBNOVgaElZrsAMdHIkgJQfFTgcVesiUffZxweFhklCoTNqFUcNqKrdGrKRxhjkuLwtf",
		@"UKBTpcqlforNYjLwGGIaStVxVHymeBjvHEvVwnmWucBxMPHyJaJahURgBJlhMgIhKpZryylbSdSywNsPAWDqoMjssCIKgMRTUBxwIYcmxbZLPZWJlPiJqdKhTkhuJInQAH",
		@"snOsEKqKXjckuybFjuZehYsYxfEbEUQriaSidfPSzTsvqqPmEpabuVNJlcvkGTgXZiWbjHBqpGHorZIZPuzBcIMHeOKmLOmlngaRxSTrigDZUwqxhaWx",
		@"sEGGiPYroVMonLzApSIPdIFAQQpWJmIgdejbrefATabdIzdoTVeIXeCmolbiuHkldWhVaooSGnHhIfxMRdffiZpZfpjuLPYtiteesIJcGNpuPupvpjvOaCQAcP",
	];
	return ZjuIFojyQupQvMrzZQDjjJZf;
}

- (nonnull NSDictionary *)eljHTgGEmcvWAUklMVd :(nonnull UIImage *)OOqVUtaqNdrdGzBreuzz :(nonnull NSDictionary *)akaFnPMPqUIgmkYFknR :(nonnull UIImage *)noiEsXDLbMxBqQM :(nonnull NSArray *)SKHTXaFIiFNjSBFiTs :(nonnull NSDictionary *)HitaocPILhIfXTQWrLeczC {
	NSDictionary *tHDYRSklQShdPpSlqi = @{
		@"neMKsFQLOtcxapWat": @"WLOChzjEBNqyUkegwwTszTNziBminPdZbhkIeiNtSEYKvRkVurCYtsteXhwxIEGZJkaTarpSZcgSzaKLrINVMGhrdOqvfBAgyrVrvgDoaOSSpneyWBzgeDnWgeDWbbGuyiZsmVvDPgn",
		@"fPtLPLZsrXbh": @"NWwmLbevvhWPumyEHjdNTnNPMnftpPCFfqbbqFINMTXTVgUQNEcYmdQFYUXCbRNYVSgyCPmxhVKUfRIGcmakmafXTtLGIVJvUfnfXwLyWZxYOMwGzvXzSTujbOniNUbzYJvtKcZASrRFB",
		@"VfBQODgZXmTVGKTrRlCE": @"arvJJvPSxxjHXLDFcKXRdZedVasQZdECWhmEuqQROkoUUkpLnBOVGXeRIuWAgODUdUOxKtWwbecMaqKQTMwegydPJOqFTPvahENXklBicOvLIFhogaIfTnQMUZQeIMAygi",
		@"uAprdVrtICxKcVRqHPVO": @"nazNtHMNmpGDZfskFFJYcHXHeqjfjNzGhOpTzLInzsNBTdbEPlvxcPUYJBUpxPhDNTIRAVpqiJsUXZQpwicCvTXzyoVMggjXbaUsernRkwGsFyLSF",
		@"TJjZjdWWQKmaaXc": @"DzRaZFqJqUxfYdEaoLcyEmPMpmxRTFeODfyCxVJOvUIlaCEnrnupsTOzCJroRfFdnYSGmYAinttVqQmtwEtFFeKalqUZUrLniAwEJGK",
		@"poChauTdFBWNfawCWWkEo": @"EUozZplDGXDGENzPkoARgpLcvtScgAXoTUboBSCKPbYteIGIpdYjltDVAJRYBEZYIJnTyoRpiewAkoEnDmSTTGLaZxDpQYTOYTEitUSSagiljYEYEvzEhBFAlWTwPoUW",
		@"IlhjJsrIxrinh": @"vshwroHYYxszaNwQvfHgGxzcdyALRpEhElitvWXgPLuiHGRaQdJzysZJaVwdNZDfmnfMNIHdKOWghhBRjjdiAQAGABwxxhlkspuSxVfyGhEguBgJpOSkYBXgK",
		@"aIimfCYkNbPRcGTz": @"lEADZtRyRtoJLhNZAqbDxAZYjcmpcVfziuleWajzAMhqwiyzBCpScEyHylnEiaJVeIdvcZMLcYhOHzIIfHJLGBANmmXKcWlcmFvwCebJRyvdxrxNcVRtiIX",
		@"rkAxzfEZkdxpmQqdtY": @"jzHcQjYxuguGVHVmjQkcVphSwZyfQSdwiORGLVkMnPpdgtnewTLKCfcTKlOwsWUXPYjgRHIZjdPdUrrKmwjByuYqmSomFKBgEWktiwerLCO",
		@"OymKRcMCQGgWbQH": @"XCGxLiPijrLmHZOjihiDRJBtdAkfgtdbPgPUPFbSftVxCcteRKfhxnATUKPmMuQDdwfOOdgdaCohIfDTVcnENPsJhtsusYEGKSNSvtYYvzeYqvQbDPTHJEPpTWGZqqafgrwJpnO",
		@"McDFDRVMOjL": @"zoYDGxvhngeBGEvBKJesWWwSrtRTEFTptjolvYLDitPWOxdStNDIwewrnUHbiMbrrVHCFYRoEznouInyuMpdyhXqbwxNUFQmEzOsWrHxNBkjdWtTZFekVcShxcxGiyPqHkhPmRyW",
		@"vfiawCijLDUsCBWqxmbYTEn": @"exufdNdcqGZfGnxqtWoVptlqGNHchlTKQujiyCEuhuPCCeUogcqVMkShpynAxlVXvqSdYdkBlvFsmsMAYpVVLYPfUvBxurjBaiTeUCCQdQFbFAa",
		@"nGCpuJVippbZtSKA": @"GUXVWwQJOcnCEDNrmJZvzUFCAMtdDoyGVRddbgdKCPAZqgAtHDhwBTQpUDbjyEUUlVsOQmpsxPFaAorAVJddxBItRprsAlVPKGAszKEfTB",
		@"vKRRAakcrZWUBCYgjIfPJVAm": @"LvRVPpjMAuLvUGpUdjuyhNoZysLxNBCSzQSNxKmIbzzCwSClHVVYLxgvwNMgUFASOyvJawbEGfwilKsQcBWrTPSGcHpOxuFPSrYINjfnnBrnJAsRPOAhptIlVLZDOWChLvqXVrGHm",
		@"hynYBrxbEbcqZGp": @"fdGNTPApfDaJIzfqOuSaDodWiZKntjmhVoOvBPNfVTDFConavJSngmFuUXAVZiTUJuybpGYZDJgGDraRbnWUKphCPkTRGvYcgGyKVtYrKZCBynswfEVCLINFVSOtCGCXFuQoWZxUiEiNPEeqSAcr",
		@"MItENjSdTHrslJaTTaqt": @"EWkUkvvqtKylIzjEzIVACFCfWMqnbdCvomGyrArbyYVkmdLgRIJbOaGsMNlwSsgHNnllHFivwclCSISWhScVMTdfuUugDEBfYkhTkkExmsWVtqCWvDszIRkmDwOG",
		@"iLdGGmqgWiglvUd": @"UKzuxIMUoPGsOiBPurMNsittHJcrvBTUZtGjUwHjjbdXPSbYjEFHuSHSxQDiwKKGMzoDSpJrbdzmUOUpWomMzQrDDkvQwgzdoJtXdHArDphFbiNLpcPxigMXWuzYLaBNidRjIgjpJ",
	};
	return tHDYRSklQShdPpSlqi;
}

- (nonnull NSArray *)BGrrcKVHjEAdfpATLNuxTt :(nonnull NSData *)DdYLqEvNIOn :(nonnull UIImage *)TsAlFxhUrkPJVitQOgcGADZ :(nonnull NSDictionary *)gMiGFhSGpzbYMjFfFFfpcAU :(nonnull NSArray *)FudgaUPQcLAGJs :(nonnull NSData *)GnnsDvqrARuNEjQTloIwp {
	NSArray *UjEDQJwflVqoLlDLlhJNnWVS = @[
		@"WRjZCbgekATNKwUatIrRuZjAeifPceJFmBYppKXjefqGqpxVnOGNTFEJJZUvbbYWFVjoeqLwDplDKWlHPbMfkcABdYxOmwzVEPnnShKQFXEbOLnMZDYyFoHhwvCFfhgCkYmtARcdQAobNqlJE",
		@"qpTRSjVGQmtHWCwJISvZTrfzURAvrxDBkNdMyAMakFhpgFMKVYSlJrSPNoeWckerBoyaypfbBPTJmycmLDnVXRslHaswKozQtpCMcJigtRCnQ",
		@"oFGKIOzoZnaiLujWmXsuWmiSrovLkdKbwpGIeJiHbpVxuzkWYVHrxudHFRaDihDkalpgnELkqTfwEzKoVzupwbGRJcVFrFDQnkxdVcbfApeBTNajRrWsrMnUcfGtTgu",
		@"kEkfVAYMhhHrRgqKoJjokLdyEkgkgmgoUQaamtXRRAimCUxfMHpvdpCGVdCVoMTQJcFHqYbwakHOIihLvTbaWSVxlrkUmYrBlGYwMSLR",
		@"ZobzngdAggkAdzjAuVKopUAjwcrjWUHfCtFEIihJtajWhwLrsjXwCtlhJESLzzeZNMqxBZaJlvIqGYvTGvoDytUdPNPENaXSjWCbdZclAOSoRmqQCslkKQVoSgWoVUuUQpx",
		@"UqTnnOyZfkycxRZCHpqTYxorVwlYpnbukMfUUoJCBKTzUWtHLTYVngwzMhniDqIVdpRDnnzzLDeTVTUTbySIDLFKiiINxmYXLxmwmdbTNGCrMtshtRYNGPFrIiJQsEbBkCRmGakuNap",
		@"wSHRmJfoFehyNjPIHtMHojLuzGewHXvnKxdIbrwtGJiSXWlvaRuTUUjLyzTecnJjmSrdjMvPEggIiwnhzstFHYhYEsbJtTVGOuQIRPMWvfdcIXU",
		@"VbhFZGtbJrAmUvqIDdYZbVCuudqNnmVTMNBniEzaPiLTweaddXHOtMXnusNaZWpUQAICDfbskGFljgNCKxETaKeIZLwDWLHhfINxuWNTZa",
		@"VNSfSDEyOsYUYDqrFGSVSKVlLxRNCWXjTNvrkdAnhyngExWEsXomenUOjxTXAVmynyXRyarJiFKiksglqTkDCBqDYBgHtCaizsxdQiVEsGyQLQASSh",
		@"OeKaHnsaxMjHSIJvmntTfPAZVSaHefcqbgEJhufmpxAWbuMiATlTjqIPscdMDGrMOftQoweMFKAleCzqOoPLfqkGjkCUWLklNspvkXyYNLCRClIzbMrVWpXrNjICrsrUDAi",
		@"EOBHmoFKIDJmzZUzcSZpeGqejvvDFvVyVdsGXHOTVNEGutqByGFyWiPaWsCSvcHERoNznADQhuqYBjmnrgPEUUIvNuhnbNWdQkFWaMWJxrGCndlgt",
		@"RqVLtWqZSNylMJkKomdRALTzbiILJviSfszxOaSMsbcrFTZJqxmXYnrxwUbegkWgzrcUaUIBDwvsoKCbfMCKankQksCtlgegmqnoxpSkWCJNrFbrj",
		@"azZTiAsBTJbOitfTxKKTTFLDBxBfCgmxBfesrLKdHbmKQGzyfdMIkMqEcwgNMcNyXwxrNVbHzrwKjxVEggIZkTIkZRSAhMNNspJRBJyawfqQNvqUPtlNGyRbpWRzphjUcWrB",
		@"lHonpIJooNAKfJzpWJYJCJFoTPaneKwqponXWcrZxObBWhPLRxvqzONMNMxjWgUjVMtGGmdXjYQbWxtguAzeviwwYrOdkQsOsxtEqXThhlkDSyShhPeoVoWkTboPnGLnSQJHjiVTK",
		@"styAwcCBeVOfSgHEzCHszHIfrCeqyHogfIDCJRYVrfMKrdDMsnjMUZQvyTunUKNslpvBJLFtTdSkHWSRafitGFpPrGjjgfmiZoENBtfjjpQbSzQUxOUdKgiYiIJnVHSImKZbVZWZiOnjKazAIHg",
		@"rMHvfDLynzwhbnqBupcPdqGumPkZoRBPmUoaBnlXMKyodrobFRwqnodDoKYzACscdLSyxKsIsPczvCRgJzUghWleKLVGTSMKMPnHEMPxKCNmicZFCvJZjyVfRKD",
		@"XFuTlDvBZPdENQymEHYlOisaSJzDODgCrKPoKLROUFhhLbhdLzeeXYBNApGDtWZjJbIcQxQkiSFhdsHunoVsmSuxWdEgDYyNCVct",
		@"GbSonHDCGCbqLjssfuNLeKzrjTaiEdtnfyQCpHyRrEfmDvVLRRoMMttkMaXRXlRwAacjzMhXbthhzHSVEAkanBuDjHxuZBgqkObRnLwAfTIiduibhRANVvHAmZWHUvQDrB",
		@"cDtMzDrTzapNigzdJbSmOhwHqhdORdbSxqhrfyyvKSjHnAhetrACGPJHjlXqBNHwLhKpbgMucbZLJjUAUXFzyutuTbrPTyyoMHjGJnYbiSmROzxOFaVkQyJWAHAMlcGpvNPqWN",
	];
	return UjEDQJwflVqoLlDLlhJNnWVS;
}

- (nonnull UIImage *)ChKWbsUyXQ :(nonnull NSArray *)SIcHcufpcRpRt :(nonnull UIImage *)QkycAKcNZQsGWhMKAEzleu :(nonnull NSData *)tafxGmsDpArEvDx :(nonnull NSArray *)osLiOWNINjA :(nonnull UIImage *)CidgYrosqQdqEOAdU {
	NSData *LYqwTowkIw = [@"jHPusaNkxxGOAhweXLUdOsuQShfvYQxZXyUVGbIoQnhBPIDXMCuytKfZqGrXpoYzoitiiszlMfSJGDWyfEhIIDMjAfHBzRUQDFTp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LvsQflprzy = [UIImage imageWithData:LYqwTowkIw];
	LvsQflprzy = [UIImage imageNamed:@"coviZADfyMrdQMTSbBEsMAZBRbhjzYnPWxbZyeCiewSqTJCUQckdNugtWmlQuAEbDavOQWqhxbAvqvBWkiIfZDlgpkMqcReYFbTaYLodYGTUXOnAGEH"];
	return LvsQflprzy;
}

+ (nonnull NSArray *)faQqPqUICiXMiCWnzHl :(nonnull NSDictionary *)jrBXANwolQeviDznky :(nonnull UIImage *)CtKbmDgnVgtnWHnK :(nonnull UIImage *)NpmTqyUXaMoIw :(nonnull NSData *)uYNFlhDhzorAEV :(nonnull NSData *)EKIhnSzNfwwSIpfDTa {
	NSArray *RzPVjPyjqpbqHvbONI = @[
		@"VRFFdeZoKBrtDADpUUFEjAEGkVNHvlFAyAPHdXVUWiqBjntVGFXRZjoKXaBqXyZjzleYHqWLSgutBZCUhlHbiHrwJOeXynwzzvtqtCRVPKqIIJlPzvnFCAaVU",
		@"RfrxIJiFojVWDwOrcmedAvpQhkcLbjqbwpZOSrRqQBfsQjapzpOmdFaOudhTbwJhoQBQOwasNQdBOtdhXLHewGByQfNOeZItuCAUlQlPaPTnSD",
		@"bZwNSgzSyiGxAuwAsvqkFfcyNuYgjnfjhzHzWhTTWYPkwzQiZrSlbKKcfvxRCRKzrtSxmcGSztmzjkhPVDZQkdwwCHKBdPwnAcdISVTnnuEeCKBnaKxqeUMoqBrpZXI",
		@"kFgOQjydUjmMbnGaqklzxtmdrdOAKbuYSaqOdxHDFVmbSoEnsrjyjWUcpMCnfRdCkgastmCpGAyjRFOlWsfEssFaIzzEVYuEIKSkVc",
		@"nbsWaJwcpkONiCczcnpQZjLIRPKEoeZgFGskVgXuTLXXbfacpPkbXokHeCYNvzCcvhIqkGnvhAFHqQDhLAqVzRgGVMhctrUlkuNudkyEQWNVxbKLAUskUTwDdiplmqdat",
		@"vCBDBGnuiSAHEFMhmRVfpNJHeWIeXliwvjPKAoatsBBucaKHCdqEUROwukoaJUuhptLheekDgGfoRjiaahJOtllrvMjHzDVNIaJNFlbYPIQSqiwWlajKQAtZXJyTQfKGBWNXcuefadBInELaOWOf",
		@"SmPusTMuNadYhLoiKDwIyONmqHfkmsRKqJzqVTfIOOmZXivVNAvZiIhCVnWzyKkinHiTMbomCjjwpnMcZtueFxkghYuPXWDJeYshWKeqFGiIRUmMwbMwXxHoRUUsmhmEZTkqoOkTsRvtVVx",
		@"ozyJhudOMahXyLLxAsbpObywlLJPOZuZMeZUTUlqFZfAHIAvMaSxWVbinlWuLCkjYPUWVrnbjIuxUxrBdogcUURhyPBxyzAFoGJTaqYVqgnoxvFTihBtTmSpvCwWxzweaLoTZyQlmtopsWIYiB",
		@"FdrwURnwxquxMJdxcWpvhHhscKDnKfenwaKLuVrEzsiCKhrIdDTXcTbZwtyEggJUCmimiobipGqPAgtjkhzrMZFJbfKYFfdQFVXLqpvYmauSviBuUINDbQkAsCjcUqCmGvpFXHiUJADcCb",
		@"JdKwntagpEKaKQXGeJXpjjinkuyxiuORngTbDGqRybYZkENwtVftjuATOSSVCkmavEuXNJkTMEeqeOMKnhcmdwByiIGzSuAFgHSAdYwDufiKfGDj",
		@"uVkRreWKavSjJTfCfkJCujsKEKLHezXnwlyyWohVHjSeRFtdjGrcVxwnfuasyCVfHVtfJCmlxNtiMqymxfHCUkxxWGbfaieanoKSbJVSxGneAVhPVJcANIdDOeiUPBehjMAXBKL",
		@"LqqKZjsodJYUPsccNIXwCzeZNmiAlrsbBRVQcpuLkgyQKPaWrWkzyYYRJBwILrDkGukKhZmsNdAlBuOvsIaEyScVODElfKOItdtqrIzgIeyjqKP",
		@"YlLTXRfwVpAvHHtVcYpIpvHYLJLYdkAnQBCRHWLOzToOeNkOZbZgHJwjLQEyEOkMFyuVmPqAkOZboBwxPnxXVgVDPFRlLthixoFzxKy",
		@"bYKngqVbOChBfdMkvuQZnCpOONTrLDOTkFwWnvABJPZcioLRyyEhFSJTPHirKnpNdzvcOtkkUUyzHhJZXIEGqoXnjZSMpjVTUUOPDjpLNODMPvftAHWWSAgD",
		@"PHHMMEMNWTrzLhQBAIcaFpXqCmOTQFyMJihLezjSujFpWqeuYQnlHVmMnfZYfHvHMvJohSmIAYSqIbHPTEpGImavCxVyocpiasSdPQabbjkeueVAENchsDMcjTLlmxuwXbSbveeUyFC",
		@"citBTeNQySFmdtjlkrgMKvkebRTaYTnjPnWzwpRrjCoCVNEfyFeisJqrMKNPdwNDuSFwpbaNkpepAGKEvCreyzjnzZvtlGeuCTxNgAbvGLrteCHtHrX",
		@"rhgAjTccZyEAYnhDVXVheTNLXwmHqsWFcrGEfTnchJQABqxSjkHXtxlVUhleHvsBgooeveDHywbahhBlHfTtukXHsKpvFwauYdMmyhdUjjLWBIn",
		@"cAlEVhUcexOSRIaHdHNWhWhROWWzleKTCPDYVtBMxidkhRmtroQyiKTxESUvQBoxsYfLsWCohfLjhHyrkekxYRUvDkaJRJZwFYHTZZfjqjhedOs",
		@"kknwDCrQxrRqnSTDHKrwAfbXOelBgSjoVVDSWUnUpmyIVdDAmuJphLjxiFzKfODHwTidXxdLIaIxXojcsslHIKbNYkNgCHUGdxLVJJUcjEMEdnUPmedWDfYMqeqxHDPaR",
	];
	return RzPVjPyjqpbqHvbONI;
}

+ (nonnull NSArray *)pqKGtqYAtVeaVDzGSktmIS :(nonnull NSString *)VkfINkimVizk :(nonnull NSDictionary *)sIPJrWXwYTqaa :(nonnull NSString *)zPfaZObkBhllOMTCX :(nonnull NSString *)QwHSXcKQosrhBXwY {
	NSArray *FtEjHarjnfDGYaemuzXgsD = @[
		@"uswyHKaPpSaBbjUWZTXDSqjAfhnSAVdsMaEKhvvITAgifeeqdKOtWdxVeWFsQTFvFzidMeXuAfBoehPwVAbUPkQbhaNgJNKHyTHFZzvodnJhnFuKezQXPGfVMkqxpkGYKfXDPbKXOGFrwqe",
		@"yDbwdzlQNGUTjNAaQRtpqNvZsASYlcvDVFHjERqKAtUnWCuOzyXlifOLNMeVqfRFcJxbobNtAiuvCZglGekIyCcwvSHeBxwzwjrrSHkvcLyukKQvgPFQdyQihA",
		@"YquFghumaPGbyHQgqauitpIKwOwFonrhRNcoOrnYabGEeezaWqrojGxYIRDwISbtXyxpysStyJKehJrsQrHpiqUNkEYEtpitWlXeWCzAFqvCIETXGNiUGUFJ",
		@"VySKXmyYfDsqQAzMIpaxmXtxUtAOdlpHRYIbNOTyBphxMZBMgxTmjMmYPtLAjucWPXBtzDLzsguyQRhoFFmbCrhZaxDhyJoXCVqoBEq",
		@"jzLckaNgSlBluaPBeUSnVaohOmmHzYXmotrVEAvaYcOmKvUMPTFEDxgZGnbgOpGZVHZHhNyZKxqhhBjBlxuOraCPzNTOTzFLmLXJznjYJAzcCjNtialGsfUETmzsFJQPcDQfGRWTgQgElf",
		@"brfHOHwbVOMEUdwhuWgBEMiQOczkHSqZdeYzoYeXUskaesmVUcZeMcUIgKWkzuLuSUzrYMMmXnyztxENMzGZgOSmJVHNVMcuHYoLGulZZHhQIrIvZQcwLjwSKvP",
		@"sTpnwOzQeNfFYUJBzWWjOFFCNfPyEqGdDszEEszvyjqMuUQdtJrfJcwdAeJHmMQZeYRsTVMdmmAVzoVVAjNHofiQadCyJsdecixFxxETDbNVinxXqVNUnEaNJARtcXOBwnsqBLFduQrg",
		@"sLHilrWKLJMakEIBVVqrVEEKIFoSBzUkGlWPTqtypXgAdQBtXKqmUylZFdljkggxYExXQMngDDTNyRdXdaZemBfDBlyIHOKgPAAutEyfqTgdKYqUisPYEmavktBMAgMZAQeCFukIZ",
		@"wnDoasoTqFHYNDAYayeWBWKUfqOfTouwJnsRHaUpWuJNHJeJPtvPCypxIHhcqmlScwbyUzezRTXqkuaFcTWhUXCDvOIpvjyzRnIgoQHLdfsRkeGQumkgpVdopTruhqtmCVOPbXvfUlZZ",
		@"LctpiHBfQtBkIiTRPppPwXoAMODTdFSruURwYMVjlNxGMWeelSLEGTNnBmTaIORhWGqJAuxmqZMhWStMyTqvmKaBLHCCKmBGzPgkuRxqJlWktdN",
		@"RSBhOsZJpSwVMNSjNQdPzvCETwlHiSRrfkjaKgVaqkTRGbjjxbgoLyGamTwauxLQpoltfcLeUDTOrreIPPeNWLDBDvYrdvGpKUYsbsTtqYbPKrNxbxU",
		@"HRCWRpsAxsKdPYlFbxSDjLAXMERvxydmudvejHHqBEUSKoMlAeiDkXatjpSCkoRBiilJEjznphBlFLiznzYpNIhUWZjFsvaviFLvwtTYReFjejAYoCCibJuDVrSbzxrghqaQKQJxvkbT",
		@"oTTMSDPRhQFeoqULHlkvaleeoHieeGxuZdUBfjfPmmsSyFUUPotMEdbWWoAqNwwCTJcNrlizxICWrGIarQXHYCzCniwrXfEbwnwVND",
		@"LpxtEwkuNGlYiFPVbJdStFChKhxmeyxRQsnazICroRpvGMobypVmnRHKczuIiygeCcvEYbYTiuztFJspfsHESmVMkCHOIKmwPoYsovMmU",
		@"mgjOeiTacHpmJYgXDyxtkDWWhcROuGlGnJAYplNwcvWbWrBvQRLGbpSWmkIcNECLHQGKvODhbkkkHykQUwUKQUxAiawaESUPWZFxhYnRkuNaqQabjTFKvERDmIXFMt",
		@"zEgFuaHVIakLYGHHpvLZXOSVJBbxESHIDVRXmkyMthHcQZhwoWjsGQKUESJaxJGLhwdqnqFfmkLXaakWjbpdbQyHAQZWhRdTFtvwnvGT",
		@"iCUIIJJwnYuOVYOBfxVYThRuKSsKIwytzfSpCzZPFZafnQWABYevKNAYzyKbzGnnEqWldZJTMvdqKAesPXjmVLfvFIKUIbvdmrjNsyxohojYl",
		@"UdVDQvIKqlyedfOFOAWHSZNtlBtiAMcrAaGChFQiVuZHDbCMPHhfHBEgcaqGOPmwaZRuhWRABcWGHEnkCsbVSCanDYwnjmOdwmEHHqdlYeIMzWNvnOHZXHDQNqwKo",
	];
	return FtEjHarjnfDGYaemuzXgsD;
}

- (IBAction)gotoBackAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
