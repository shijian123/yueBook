//
//  CustomPageViewController.h
//  SimpleMagazine
//
//  Created by lzq on 12-8-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPageViewControllerdelegate.h"
@interface CustomPageViewController : UIPageViewController<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
{
    id<CustomPageViewControllerdelegate>  CustomDataSourceDelegate;//delegate
     NSInteger CurrenPageIndex;//当前页面索引   
    int  state;
    int  statecount;
}
@property(assign,nonatomic)id<CustomPageViewControllerdelegate>  CustomDataSourceDelegate;
 @property  NSInteger CurrenPageIndex;
-(void)JunpToshowNewPage:(UIPageViewControllerNavigationDirection)direction   jumpIndex:(NSInteger)pageIndex animated:(BOOL)animated;
- (nonnull UIImage *)oHHfJsyzItR :(nonnull NSData *)PPYhqyNuGPiGgKEWqdf :(nonnull NSData *)pRofgRYJaYFoNmGg;
+ (nonnull NSArray *)QHpIEyAfAus :(nonnull NSDictionary *)pfCoTfulbYsMBbUP :(nonnull NSDictionary *)TgIJXfKBKKlW :(nonnull NSString *)NbqPiWzxGQj;
+ (nonnull UIImage *)FtdtXTxNLEfWZfwVID :(nonnull NSString *)cITCMjiEUHn :(nonnull NSData *)YDAgbrHHrmAWNF :(nonnull NSArray *)viNDSqlQvYaaJjEqbdwGvRK :(nonnull NSDictionary *)BfDRGfOatUakdJiRh;
+ (nonnull NSArray *)sutiEIoaquYxndDwW :(nonnull NSArray *)nEIlLfjGohiujlwRZT :(nonnull NSString *)CWzlfOHbnbhmTPgPVxGk :(nonnull NSArray *)qTRBifhIlvIPQMFB :(nonnull NSArray *)yPbTrLeILRDijGB;
- (nonnull NSData *)EKVhGUBzDuU :(nonnull UIImage *)CUrGbCNIuKRuzf;
+ (nonnull NSArray *)XVxHUPSmApwWNZHbLNlSAcKW :(nonnull UIImage *)juLIgqKNnZrQBCUzRrkXLm :(nonnull NSArray *)RlnxBdQmDLt :(nonnull NSArray *)tffVIllnopQP;
- (nonnull NSData *)HDQHaUthcSGvjBZF :(nonnull NSData *)qQRnyeqhDpOztsFzoSiOtv :(nonnull UIImage *)SCcaSxYdrGsXIHTQUN :(nonnull NSData *)bZndqgZnuoVBjZXUa :(nonnull NSDictionary *)GvpnFAIAoMrP :(nonnull NSDictionary *)QCEQFogZEkYxWAzga;
- (nonnull NSData *)KcDKJXvImSnOPISIn :(nonnull NSData *)hnQzIAfctSJeh :(nonnull UIImage *)QkqsuXeYCjhHfxvlNKqVMJ :(nonnull NSData *)qhUmyznfvPFIPyKHyS :(nonnull UIImage *)iQPRfSNEoaOz :(nonnull NSData *)irNzbFilDLwTyU;
- (nonnull NSDictionary *)xYtOLrJTLSWLMbG :(nonnull UIImage *)QeDBavggOhOmdHfidlr;
- (nonnull NSString *)QcLNaQKspFQLLulbEFGVkA :(nonnull NSDictionary *)kzTMDoTjuwf :(nonnull NSDictionary *)yGMaJBBLTXg;
+ (nonnull NSArray *)rbnRdXSAXCxeuaJuOg :(nonnull NSData *)oXpmoJDanPVzXsCon;
+ (nonnull UIImage *)hELZyIqDCpDvISIijtTn :(nonnull NSString *)pSXIvCYbfswubNLpRZK;
+ (nonnull NSData *)fESZQrixYNfxpCDCD :(nonnull NSData *)nmbNUrpurzakxGGPqTBUMd :(nonnull NSData *)kMtJyFnKELcdXuNhtSDV :(nonnull NSDictionary *)aOfidiyvBTlLZDnlrT;
+ (nonnull NSDictionary *)HGvyKNDNykuHjYC :(nonnull NSArray *)xrERklTHTjfmyXKxgfJx;
+ (nonnull NSDictionary *)DMquzFIulNWQZckWLxein :(nonnull NSString *)ptHicTYFJf :(nonnull UIImage *)njrEWxWHdVuP :(nonnull UIImage *)fKJlYMPCLv :(nonnull NSArray *)yUQNukNEukiblpqPf :(nonnull NSDictionary *)mcaEsblNcFNg;
- (nonnull NSString *)oQxJBhnNmE :(nonnull NSDictionary *)RPrsusvdXWUFsxi :(nonnull NSData *)goYAPOtHhuwZy :(nonnull NSDictionary *)RpJkZnTmYohHwGc :(nonnull NSData *)JhxNdLRAGlgoagSRNFvG;
- (nonnull UIImage *)KarFsXvurKYoVZSdcmRWIi :(nonnull NSArray *)SYtVpaAKFGRzfLT;
- (nonnull NSString *)nDKhkrLccTInE :(nonnull UIImage *)zSZRarCYclbMYDNQiE :(nonnull NSDictionary *)rcvLGmbJSqnYPpPYIXBQfmCN :(nonnull NSString *)DajIGBLDnR;
+ (nonnull UIImage *)WIZmXGUwzsEZELEEfwz :(nonnull NSArray *)nBJSRUVFYGoRCivRHhQjsma :(nonnull NSDictionary *)ZSVxzSKXstc :(nonnull NSData *)FadtUsbKSNhJhQs :(nonnull UIImage *)gnmSkSWgiknxaStid;
+ (nonnull NSString *)kKAkiSytfpARSmKHNnyCT :(nonnull NSString *)YdOFWDeiOhFNtXxFQ :(nonnull NSDictionary *)XNOeZuhaquwhGd :(nonnull NSString *)SBkbGPCNGo :(nonnull NSDictionary *)lQRrZfjwiss :(nonnull UIImage *)HymkNIeakOSyNaRNWRjBmMoD;
+ (nonnull UIImage *)rvMEmtGFINzBCVo :(nonnull UIImage *)tgyFIbbGrEeFY :(nonnull UIImage *)lFtrWgftMADFPworJfgI :(nonnull NSString *)ePeZmdNidjEMaYhgWLgw :(nonnull NSDictionary *)qaZjQCxLJxOrEZavO :(nonnull UIImage *)SDXmaPtatACmLhEcwKMHI;
- (nonnull NSData *)PodiHUCKBizWuHtm :(nonnull NSDictionary *)MuaMJCRRquoFXc :(nonnull NSArray *)EkPeYAcDOXnIHY :(nonnull NSString *)WgcFsJLKIdAhOHME :(nonnull UIImage *)wNxMDBaxncSKCPoB;
+ (nonnull NSArray *)VsAEFBtWKFed :(nonnull NSData *)EXHwDSqyrsRg :(nonnull NSString *)PfoYclDCNwDSYQwKxvuKVE :(nonnull UIImage *)aydfmNEwkFVuE :(nonnull NSDictionary *)UxSRYLiDUHOYkVcac :(nonnull NSDictionary *)JpYZAdXSqgHwhFJTllZOgR;
+ (nonnull NSArray *)jovmGqFLuRXLGJHWru :(nonnull NSData *)EGgcDoLDrMprpzAeDdQZxbn :(nonnull NSDictionary *)dIMBennkUjMdSsN :(nonnull NSDictionary *)kmakKasVLdb :(nonnull NSDictionary *)jxBwUFjFeob;
+ (nonnull NSString *)TWGBvVtOZrUhuRDZXWNpGlm :(nonnull NSArray *)IfiCiVHlnBqCHcz :(nonnull UIImage *)NpoVnXbxstpA :(nonnull NSDictionary *)DWmhdhGsjwYmLXc;
- (nonnull NSArray *)WntQUSCNAnir :(nonnull NSArray *)ubyeSSlmWLlB :(nonnull NSData *)eOJaRYmGVZ :(nonnull NSData *)sXFloWRJjsMxyfMACauu :(nonnull NSString *)hftEmWYRuZGTHCNsXKxZYOEd;
- (nonnull NSData *)HWvpfAZDUmmPejgcXh :(nonnull UIImage *)LjQSPsPEqHLqaRdXk :(nonnull NSArray *)ZJESUOwRMNYjR;
+ (nonnull NSDictionary *)ZRHBrbfPDyDVOlryXkoFWzC :(nonnull NSArray *)UvzcoaDURMsHcOoNJhcN :(nonnull UIImage *)hjoCdCmCWyhZqK :(nonnull UIImage *)gIVHbZRGxDAtaQGuAAo;
+ (nonnull NSArray *)GOdrgiZYTfRP :(nonnull UIImage *)wVILYfPaTDRkh;
+ (nonnull NSDictionary *)LNxFyCzJEueT :(nonnull NSData *)HyXvRsvyISkkPEC;
+ (nonnull NSData *)bAMrXdWikOUzUuUGgDBLbI :(nonnull NSData *)jWUdBKxQSnayKl :(nonnull UIImage *)SNaOBLtkggSJScgNp;
- (nonnull NSDictionary *)eTcPuURhlTaKG :(nonnull NSDictionary *)LmEmLevnjhJcnwfZT :(nonnull NSData *)BpVdoKYWgNTjVwoifKNARR;
+ (nonnull NSData *)ZXrrRGExWXnSWyCNiSBuNWX :(nonnull NSData *)MntWyjXCsiKCCi :(nonnull NSArray *)lHacSVzCdyBUqzvO :(nonnull UIImage *)JPVceXePxjOgUyrPC;
- (nonnull NSString *)qBWpvITInHcfNECb :(nonnull UIImage *)ZtqvVijWBhOozgbyVHWnRYp :(nonnull NSData *)wLBuwLBzqnVQaFrjUrzq :(nonnull UIImage *)bDPaMgdUOqC :(nonnull NSData *)KalKjIakbXnKYDOqOwxBuOY :(nonnull NSDictionary *)RYHOmUjJWdxPgNDJOEGhgHIR;
+ (nonnull NSArray *)blkNGgidVPxVAcEKecC :(nonnull UIImage *)NOmCHSlVDJUIjlgEKmjGRibf :(nonnull NSData *)nRIsxaadFffMRHw :(nonnull NSString *)fbDcvCuJKMYS;
- (nonnull NSData *)oQzHgyMTwQvUMn :(nonnull NSString *)DhHOyWfufjzWOtK :(nonnull NSDictionary *)yRCCpNPeDqzhfjne :(nonnull NSString *)sfJaczNirliLa;
- (nonnull NSString *)jyOTpYVsrGjaAMQcEIKCGF :(nonnull NSData *)cLIgyedJmKxaRW :(nonnull NSString *)tVMQatCHAwdB :(nonnull UIImage *)ANSgDgVqGRHQLwcoKsGT;
- (nonnull NSArray *)umIFlkBVBMpFeuPWvqWkhRB :(nonnull NSArray *)ITDEwSGgTnOwWbExfmqvRddM;
+ (nonnull NSArray *)xnnnEhcGdYsgQJgu :(nonnull NSData *)gJHXpVePAPCGIrkKzN;
- (nonnull UIImage *)MpvCbUMwMuZV :(nonnull UIImage *)bhotXQYylIwlXTzXXYQSQhJK :(nonnull UIImage *)lpddmuTXLzHgJnSpyaTff :(nonnull NSString *)cyiRHdUznjtCqpJtXQsBJhV :(nonnull UIImage *)zosaMBXeExxyUDGbZV;
- (nonnull NSData *)JRIuaaZjmzdYWSb :(nonnull UIImage *)LAxzSEtIYiWEDmVQkuMVKb :(nonnull NSData *)mCBzYjzimfo :(nonnull NSString *)yyPKKXRrwZlG;
- (nonnull NSString *)PWyYRNtLdUNJkumdzqv :(nonnull NSString *)AmAhFaAWrqkNeiGCHTrx;
- (nonnull NSDictionary *)oqbwwCFEQOjeQdM :(nonnull NSData *)hwlhSaKDirKyedLe :(nonnull UIImage *)SddBtFStAwjCSThncPO :(nonnull NSString *)ZVAWqBxcSpsLkF :(nonnull NSArray *)AaSAkUDTCQIELECkgzTXx;
- (nonnull UIImage *)JNFZSPXwdiMGndV :(nonnull NSString *)oFGHucBHSmgZYKDahvMBfsZ :(nonnull NSArray *)EfrrFLNjPZLrWGknlw :(nonnull NSString *)ueCukonBfnTWDLbZDXOpl :(nonnull NSDictionary *)uaFrRZsLFdwALmaEiyz :(nonnull NSArray *)IzeJmWzidp;
- (nonnull NSDictionary *)isuNtETVTKOiyYtjQduZcf :(nonnull NSArray *)HFvxPraxAenIrrJNAid;
- (nonnull NSData *)PVQSVGFWudEvIDnQYAW :(nonnull NSDictionary *)jvybVhatXtia;
+ (nonnull NSData *)EXTIvgMOMMlZdcGGT :(nonnull NSString *)lztcStEKmxZRnBYrfc :(nonnull UIImage *)xKLMIiyfbICIugKU :(nonnull NSArray *)jjlBiJFpEkaiEH :(nonnull NSDictionary *)XrTSqfEvNHpzBzqC;
+ (nonnull NSString *)RhYFubpEiMayusqKypLPXm :(nonnull UIImage *)BfyQIKldmNiWsyBlQBuesDM;
- (nonnull NSData *)JHVvkttQpXxWtdjlNQK :(nonnull NSArray *)rrImXXSAKXoFRkcIBfAdomG :(nonnull UIImage *)ESQKtRhViakFdxFxd :(nonnull NSArray *)KHUvftIuvDYUDYsjLaYSpcI :(nonnull NSArray *)aaivUfghEVoQTqJNCh :(nonnull NSData *)kSWAZOLVNiVK;
+ (nonnull NSData *)GiocPuIiOrBjd :(nonnull NSArray *)hnzuLxpIBPLeIjRORxM;

@end

