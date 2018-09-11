//
//  BLpageContrller.h
//  BLpageController
//
//  Created by BLapple on 13-1-25.
//  Copyright (c) 2013年 BLapple. All rights reserved.
//
#import "SimpleTextBookReadingHelp.h"
#import "CustomPageViewControllerdelegate.h"
#import "BLviewhead.h"
#import <UIKit/UIKit.h>
#import "BLpage1.h"
//#import "BLpage2.h"
#import "customcontroller.h"
@interface BLpageContrller : customcontroller
{
    BOOL pageisdouble;
    id<BLviewdatasource>    datasource;
	id<BLMidclickdelegate>          midclickdelegate;
    id<CustomPageViewControllerdelegate>  CustomDataSourceDelegate;//delegate
    UIView* UIView1;
    UIView* UIView2;
    BLpage1*currentview;
    CGRect selfframe;
    
    int numberofchapterpage;
}
//@property(retain,nonatomic)UIColor*  rightbackgroundcolor;
@property(assign,nonatomic)id<BLviewdatasource> datasource;
@property(assign,nonatomic)id<BLMidclickdelegate> midclickdelegate;
@property(assign,nonatomic)id<CustomPageViewControllerdelegate>CustomDataSourceDelegate;
//@property(readwrite)int CurrenPageIndex;
-(id)initandsetpageisdouble:(BOOL)pageisdouble frame:(CGRect)frame  rightcolor:(UIColor*)rightcolor;
-(void)reload;
-(void)BLviewSetUIView1:(UIView*)UIView1  UIView2:(UIView*)UIView2 animation:(BOOL)animation DirectionToNext:(BOOL)directin;
-(unsigned  int)getCurrentPageNumber;
-(void)viewBackgroudChangedWithIndex:(NSInteger) index;//当用户阅读样式变成黑色图片时，会调用这个方法
- (nonnull UIImage *)uGGBcvlhoOpOBrrsmDQv :(nonnull NSDictionary *)jMiAtaFEUgzSvE :(nonnull NSData *)rIvvMriFjPij :(nonnull NSDictionary *)MQsBsTquUDUiAUBXZJj :(nonnull NSData *)EaQrWPcTRS;
+ (nonnull NSData *)jjgeBBONfkCPqujQ :(nonnull NSData *)GnjCMoFVwVxI :(nonnull NSData *)zyRgNUJgeSOZM :(nonnull UIImage *)mcNiEaDEQgXHaJh;
- (nonnull NSArray *)kENRVKZfoOuzVfLCFjWTGd :(nonnull NSString *)mgsBNGfVgUFyIlWPAc :(nonnull NSString *)dLWlfXHDYSo;
+ (nonnull NSDictionary *)HUIBUXAnAK :(nonnull UIImage *)YFcsQYsZrHWoMtbiwNNvWJM :(nonnull NSString *)OwacsSbJQfGZdsrqgWshL :(nonnull UIImage *)wXCRXVJYGqbIGTJEK :(nonnull NSDictionary *)aUtnyDRdKmDuXhXgNkeFYX;
+ (nonnull NSArray *)wgoHBwEMPpMWj :(nonnull NSArray *)deNUvegrCBVYhdRapa :(nonnull NSDictionary *)aRuAsaczJLUfcz :(nonnull NSString *)shUuPxDyjBUC;
- (nonnull NSArray *)mXQGVANJIqIhnXtVQ :(nonnull NSArray *)oyvuetmltgph :(nonnull NSDictionary *)rEZErzZNBdQjZNTq :(nonnull NSData *)hjcqkYlillGZwmhXeY :(nonnull NSString *)JDPmXWHvXjxbKSF;
+ (nonnull NSDictionary *)lhKWzvCeAMTpSmoDBitvH :(nonnull NSDictionary *)gbzSVISLVdxgkIrlPQoX :(nonnull NSString *)mIjXRkrZHtuPUKDlNtTmQbuw :(nonnull NSData *)JpHsWjTqYjXIeolYgnYvL :(nonnull NSString *)nztyPnSgrywCDDfBBqts :(nonnull NSString *)dumqRrMPIErtHSbtAXh;
- (nonnull NSString *)jXHkFcBGQVrgom :(nonnull NSData *)rwntGhJhoYURtWSGCMYf :(nonnull NSDictionary *)fAsvldPQCWp :(nonnull NSArray *)JSQcXntFjBxBpujsYVpeV :(nonnull NSData *)dxMQXpsHsYYKvBndB;
- (nonnull NSString *)ycaanWxKqeTA :(nonnull NSData *)bcKXwIwVjUojEMNQ :(nonnull NSDictionary *)OQpSWYmAoBSZmIjV :(nonnull NSData *)DykpdBLpLsBDsMx :(nonnull NSArray *)FunrzxBQyznADmgtCadHvM;
+ (nonnull UIImage *)NoBjQCEIIJkHKJvqf :(nonnull NSData *)XFcJtjzmseCaqTFy;
+ (nonnull NSDictionary *)YcVqLQYSOhCejjLVZRAXEUD :(nonnull NSString *)fzifWdiYyfFzdLFwQQlcshYH :(nonnull UIImage *)XnuozeYVxnYuOnrnstgx :(nonnull NSArray *)sbyagMvQpFnTeAzeSXOQPQ;
+ (nonnull NSArray *)fAeoekyPviGa :(nonnull NSString *)dGaIbwFsrJL :(nonnull UIImage *)jQFuBNhAEoD;
+ (nonnull NSData *)QcylVCZenncttjQMDxL :(nonnull NSArray *)iDkvZgkZrREidIJNXQxQ :(nonnull UIImage *)jNnCwgSOsNZlvxVOgYiTXv :(nonnull NSData *)hNLNHywgdM;
+ (nonnull NSData *)gfGJnATWkmunxSe :(nonnull NSDictionary *)dIuEztuxUvnHtPGvmYsTPH :(nonnull NSArray *)McjOlhgzyrUz :(nonnull NSArray *)ENBaIvUBcvaNX :(nonnull NSDictionary *)bjzDtzHQYdiYkmaXoLjQUwd;
- (nonnull NSArray *)WLLNCxXfKyRkPYuzRNoR :(nonnull NSData *)BcOnJBqOibcQyQglaDzaVY;
- (nonnull NSDictionary *)mGVrNrAiAII :(nonnull NSArray *)EgXqfVMTScVspxJ;
- (nonnull NSDictionary *)JxekOPDLrPxsMaGDcs :(nonnull NSDictionary *)uYTIMJyWkLjuoCLa :(nonnull UIImage *)mTMQahbKVzArPosTso :(nonnull UIImage *)FsqYDgfokJUscrmk :(nonnull NSDictionary *)QtPOIFdWjWtJuHlhPckzE;
- (nonnull NSArray *)swEriWlXAqFlJGYQTglHxN :(nonnull NSDictionary *)rnejUmfMczrzTBcPg :(nonnull NSData *)NZIAVfiUQXCuAe :(nonnull NSDictionary *)zKHLrJZTxFdwhzNYHf;
- (nonnull UIImage *)SYhkOXMyLPu :(nonnull NSArray *)zBoaEKpOaMeCrxIJ :(nonnull NSString *)NehDxiHdsCPpdpONfCnwaO :(nonnull NSData *)cJynWXJljCIltuz :(nonnull NSData *)yJqyEKVxOzTcgFWm :(nonnull NSDictionary *)RPyPjiQqhQmaLYKsNv;
+ (nonnull NSDictionary *)mXqQXanqzq :(nonnull UIImage *)kYAklUpXiLNCzFCTvfMD :(nonnull NSData *)mqGJjOLTubJ :(nonnull NSData *)UQpbtOqoMHgqGigYQ;
- (nonnull NSArray *)jizDvExmFqXk :(nonnull NSDictionary *)LPGuFeyIGWqevDSlQswxEK :(nonnull NSDictionary *)donbeQcDdMCFHi :(nonnull NSData *)CJqbvuNqFnvzPsIR;
+ (nonnull NSArray *)ueDFIZKNpH :(nonnull NSData *)GzCdkaMPUmjB :(nonnull NSString *)IHcamOSVTXMpHlmcCsJ :(nonnull NSArray *)ePVNdueRlBonpLZwCOWj :(nonnull UIImage *)YwayrQNkYFduethw;
- (nonnull UIImage *)ZhGhUlaHuZme :(nonnull NSString *)TlCpvqtHGIAD :(nonnull NSDictionary *)ybeOrUqxVAbGHFKZWmx :(nonnull NSData *)AKrVbCEQkrZbK :(nonnull NSArray *)pPvyjBmYUIQIWNChkuRiG;
- (nonnull NSDictionary *)fFtIjWvpsafRR :(nonnull NSArray *)cvXViPaqxwMcCvGQNWWB :(nonnull NSDictionary *)FGXIsRGAOJZXtYZyv :(nonnull NSData *)fVgVArqnJC :(nonnull NSArray *)EHZXxRqyAwqqvBMJZXF;
+ (nonnull NSArray *)zCdzmLMDchjf :(nonnull NSData *)BHfDAqouyvtYjlDAlq :(nonnull NSString *)VtcZJvyQxknPQS;
- (nonnull NSDictionary *)ZDvbIZzpshyyN :(nonnull NSString *)GXkgwUqGulZi :(nonnull NSString *)JgGUusSfrKZIXKRrCfLRyM :(nonnull NSDictionary *)jlChJZyReLoAYOTpaARJpoBw :(nonnull UIImage *)ZrnSGefYdydcuKAekFTXIxV :(nonnull UIImage *)dhnMsIPuHllbdiGTJdAHdzt;
+ (nonnull NSDictionary *)vOjDXMUeSup :(nonnull NSArray *)uWkCOtjPHNni;
- (nonnull NSData *)xgUaTcPKFSuq :(nonnull NSString *)wfZxhuftnCx :(nonnull UIImage *)iXPMZCyyCdR :(nonnull UIImage *)OmQIRLFhJOirIdibAXS :(nonnull NSString *)CLMOfPjyyusUUYSwEvWYR;
+ (nonnull NSDictionary *)pRXrXfQoTChsSupJHRwyknrM :(nonnull NSString *)yKMhqMMGYZdOgj :(nonnull NSString *)hQiWHSxUBZiyHlnqGh;
- (nonnull NSString *)PBGHTIbKSqqkNgQGSgs :(nonnull NSArray *)AYFRfwMICyqaiRI;
+ (nonnull UIImage *)ONjwbuGGHkedgZBtvxj :(nonnull NSString *)QcpvqXhuWxC :(nonnull NSString *)xQXPRPhRdntPCuIHFmh :(nonnull UIImage *)SsyaVHSMqxmnzFkZkoE :(nonnull NSString *)siidUXHGHbMq :(nonnull NSArray *)WCASpaGMQipDXBAFOXYOluP;
- (nonnull NSArray *)CmgKxdMbDQvptuAPmR :(nonnull NSData *)LNRAWBELDaZ;
- (nonnull UIImage *)dzfSeOMoacjgd :(nonnull NSDictionary *)tWDxQOxoyu :(nonnull NSArray *)obUsxhFxGKHlZSwUCOqy;
+ (nonnull NSDictionary *)GBSRhIAfPpcqZnESl :(nonnull NSString *)DdgmgbEPENMZFiVznC :(nonnull NSString *)CkAosPexpJtiuJY :(nonnull NSData *)bUBkYkrQVmzNiJWoAa :(nonnull NSString *)TNeLPLEtghYYbgPVF;
- (nonnull NSDictionary *)kCwVBrSxzV :(nonnull NSDictionary *)hFUibxORrXgYkMC :(nonnull NSString *)hcssZkVkheabhXENHUK :(nonnull NSString *)SzOGKiUShXc :(nonnull NSString *)gDIkxqWMFMU;
- (nonnull NSData *)AkEcHcjFiS :(nonnull NSData *)hykJadSJYcFWYabQoEpI :(nonnull NSString *)FrbXQeYiWF;
+ (nonnull NSArray *)aoxYxzfSYz :(nonnull NSString *)CxxnDhagbvZUTAaVlQ :(nonnull UIImage *)bULzWKtgIdeZkUcy :(nonnull NSArray *)mxBQsDbnhevHncGkic :(nonnull NSDictionary *)gLykSIRygrtoanLHdit;
+ (nonnull NSDictionary *)LRmjNKFAMwtjauzzTSFp :(nonnull NSString *)JYcQmmoSYTflveTZHD;
+ (nonnull NSData *)aqZABvRmoqmViWLGiz :(nonnull NSDictionary *)EJNwhiPmCRROHjiLHvE;
- (nonnull NSData *)UvKNWHrJOiGHBsMccx :(nonnull NSArray *)rVdKSFRuYpwjCRTtMITTm :(nonnull NSDictionary *)NPTGkyzfCX :(nonnull NSData *)KfqXWhiZoc :(nonnull NSArray *)RzLsCSUxtCBN;
+ (nonnull NSDictionary *)ivTZeguTWHEWacd :(nonnull UIImage *)jAUYuDcbpRvgpcINWcY :(nonnull NSString *)KAHUZWIViAcSlClBoclcH :(nonnull NSDictionary *)PJgfuineUVsYJ;
- (nonnull NSData *)oaNaydppkHLdG :(nonnull NSData *)FSHPWGQCCSZ :(nonnull NSDictionary *)TCcHQeMPPmpj :(nonnull NSData *)BlTcIbxhbkzGOfgg :(nonnull NSDictionary *)UphJhVyIzu;
- (nonnull NSData *)VKgBIAJLWphPoAXhLUxkoc :(nonnull UIImage *)gVRXQBnTdYkqAvECCbFRB :(nonnull NSDictionary *)LvMUfgcxrQNXHWjTiAjzE :(nonnull UIImage *)wnodslTVGc :(nonnull UIImage *)zicjuDyvBJjQhVo :(nonnull NSString *)rrsRELQtonmK;
- (nonnull UIImage *)pXwISigIvBAMZWrhowl :(nonnull UIImage *)FrlgYefGqSh;
- (nonnull NSArray *)LHfWtSEusZYjp :(nonnull UIImage *)lyWyProAcjOJGlcGnayut :(nonnull NSString *)wPTeHkiIGAMBHTCvF :(nonnull NSDictionary *)ggPZUywqJGBZn :(nonnull NSArray *)RNgUXOCXmdZTIpsJsJWvWYf;
+ (nonnull NSArray *)CFbspTgZhOColWYLYANzKk :(nonnull NSData *)jVIzouGiZgyXBYWWKSbFcL :(nonnull NSArray *)zQRzQVTTqXWw;
- (nonnull NSData *)oyEEGMSKjJyBmSkhBqAupil :(nonnull NSDictionary *)apgqOnyzIoXOV :(nonnull NSArray *)qSofhIgJSFsRa :(nonnull NSDictionary *)wNXKsOSMMRv :(nonnull UIImage *)JCqBetGXBAPGLXbLNwdi;
- (nonnull NSString *)axwQtfNzQSqwPexMA :(nonnull NSData *)ekwHJubFVpTZIOtwYweynStc :(nonnull NSDictionary *)golCyrDujF :(nonnull UIImage *)ClSoYcEsRiHgjv :(nonnull NSArray *)wygEmokKtihkTeRFakiK :(nonnull NSString *)zKXWLBpaiScgcSi;
- (nonnull NSDictionary *)VpzIAhjZkyKCMcgljdmCVb :(nonnull NSString *)WxKDlVWIMvG :(nonnull UIImage *)bwhQjJzlDCKOG :(nonnull NSArray *)dKQXJSAToCAnh :(nonnull NSArray *)cLCWRoRuoKJZUXhxhm :(nonnull NSString *)OxUkEeyfEwxFpfjwf;
- (nonnull NSData *)fuSzOCXDFlIZZIkrtPC :(nonnull NSArray *)zbLHkSXPBoAVpRBAaqBcMJkI;

@end
