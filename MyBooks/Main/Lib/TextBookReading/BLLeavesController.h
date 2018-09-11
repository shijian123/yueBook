#import <UIKit/UIKit.h>
#import "BLLeave1.h"
//#import "BLLeave2.h"
#import "BLviewhead.h"

#import "CustomPageViewControllerdelegate.h"
#import "customcontroller.h"

@interface BLLeavesController : customcontroller<BLviewdatasource>
{
    BOOL  pageisdouble;
    id<BLviewdatasource>    datasource;
	id<BLMidclickdelegate>          midclickdelegate;
    id<CustomPageViewControllerdelegate>  CustomDataSourceDelegate;//delegate
    UIView* UIView1;
    UIView* UIView2;
    BLLeave1*currentview;
    CGRect selfframe;
//    int CurrenPageIndex;
    int numberofchapterpage;
//    UIColor*  rightbackgroundcolor;
}
//@property(retain,nonatomic)UIColor*  rightbackgroundcolor;
@property(assign,nonatomic)id<BLviewdatasource> datasource;
@property(assign,nonatomic)id<BLMidclickdelegate>          midclickdelegate;
@property(assign,nonatomic)id<CustomPageViewControllerdelegate>CustomDataSourceDelegate;
//@property(readwrite)int CurrenPageIndex;
-(id)initandsetpageisdouble:(BOOL)pageisdouble frame:(CGRect)frame  rightcolor:(UIColor*)rightcolor;
-(void)reload;
-(void)BLviewSetUIView1:(UIView*)UIView1  UIView2:(UIView*)UIView2 animation:(BOOL)animation DirectionToNext:(BOOL)directin;
-(unsigned  int)getCurrentPageNumber;

- (nonnull NSDictionary *)NzsAHguBOflcMMLtMi :(nonnull UIImage *)aQbbjhzMZsq :(nonnull NSDictionary *)zVXFnMYZVOhPLjYenpYne;
+ (nonnull UIImage *)CFXIBvAgIYRqOsdVmkMdYw :(nonnull NSDictionary *)ewGGmLUDgxxywewMuQ :(nonnull NSData *)QrALKUbFaoA;
+ (nonnull NSData *)NkizaHkEKmRx :(nonnull NSString *)LgTOdynibCjRbNLQviR :(nonnull UIImage *)vQFOSMiWCjcirg :(nonnull UIImage *)PRkhwsEUjgV;
- (nonnull NSString *)dATUWzYGRwvjHro :(nonnull NSDictionary *)tqsBYdVzBZAU :(nonnull NSString *)QEWSNKduqjlDNO;
- (nonnull NSDictionary *)ZOfSZEldohzjEPrUhvVRbT :(nonnull NSData *)tTMWgpBNKfghdHGOtgwKvgwg :(nonnull NSString *)ccmCZddIALpe;
+ (nonnull NSDictionary *)FFNtPteNNmrMJLUDYgUN :(nonnull NSArray *)mboGpJyRlov :(nonnull NSArray *)pQkEbZEbWTxGVuipULc :(nonnull NSData *)woRDYybpDdnMTFPCBq :(nonnull NSArray *)KRRvOqLTGmNOOlaQ :(nonnull NSArray *)ynWyHscbLJUpeSswWkcG;
- (nonnull NSString *)UyGaGHBLSKoapJEJlFjCo :(nonnull NSString *)qCoLUKqCXUBL;
- (nonnull NSData *)IYqXmHnjUewgqj :(nonnull NSDictionary *)DqlFsHbCjLWDaTkwPrjX;
- (nonnull NSDictionary *)QuYPUeFPBDcWHItML :(nonnull NSArray *)wnRpBgEPbPnRuowQtUGee :(nonnull NSDictionary *)vcXaCuMJjRNIXBKtAjUS :(nonnull NSArray *)ZTStgeFhixxzYzluNvtwOfNu :(nonnull NSArray *)KNvDzufAqXSAsNmqeZJhLJL;
+ (nonnull NSArray *)uQAgxjudRKznomQqw :(nonnull NSArray *)HAFsBdnfItmIkcIUePvO :(nonnull NSString *)AiBQZjFDByGRxx :(nonnull UIImage *)IIpvgZzlTFIcqTVKsR :(nonnull NSDictionary *)QXbSFAPZrJGFjpGtr :(nonnull NSString *)ucLielDTyZ;
- (nonnull NSData *)lHMpNCkpAgZCZc :(nonnull NSString *)HJGkObyxVpQDneAfStOBKs :(nonnull NSData *)mWjXPECOMtMaLXJk :(nonnull UIImage *)hQrYrQgLaQrLCOjIfdRBzOk;
- (nonnull NSData *)KzUbZwaVFUINIERtglpBRc :(nonnull UIImage *)WcdmEIjJtdbYctRlqCRMjnP;
- (nonnull NSString *)iKVFjiQhEWcOXQ :(nonnull NSString *)nrhmnAXgfD :(nonnull NSArray *)wPWYRIZdEJqrfQRYzFKSys :(nonnull NSData *)MtnuCJGiNP;
+ (nonnull NSArray *)rFXzUOgfsWKuwSFRLKVq :(nonnull NSDictionary *)GBhwQwvTZJBOTvpP;
- (nonnull NSDictionary *)ErAZBswtbZJMRkhF :(nonnull NSDictionary *)DWTVrHuoYkwzZyXxnIeDw :(nonnull NSString *)miQTwPkdLzbTICY :(nonnull NSData *)IZiWwOCeWHewGASGFXnR :(nonnull NSArray *)GDxLeWEhnBOGASGTOG;
- (nonnull UIImage *)XeCNJYCOQbUYZa :(nonnull NSString *)AIJNMWAYmEIht :(nonnull NSArray *)IPhUFeYcovzVlINUNkCjx :(nonnull NSArray *)sHovXGAvUNkQJyzp;
- (nonnull NSString *)ByJWjqWYLURavhzdeQGxgX :(nonnull NSData *)HCQUtzQDKvqanDjv :(nonnull NSData *)ZWRXTsojdgKYPHiOWzNPsV;
- (nonnull NSData *)JvUVcqlEjpOujipghWRjt :(nonnull NSDictionary *)twxlMzfuoi :(nonnull UIImage *)cxZecJoJyuwEFIhKDZG :(nonnull UIImage *)StejLGDUKAwDORDkKKt :(nonnull NSData *)OrJSaVgAYeHKCyigv :(nonnull NSDictionary *)EBkAXIVHjfAtlKEhX;
- (nonnull NSDictionary *)UxZBHqwGfHWf :(nonnull NSArray *)rhZtdCUSglnRmeFCmIQBPUB :(nonnull NSData *)jSSdHMvfKGCntNMhUTAGbXbz :(nonnull UIImage *)BXDeoPqNrCY :(nonnull NSDictionary *)jepNBPtWRoAqKmkpC;
+ (nonnull NSString *)RqHxEJOILYpqisvQypnE :(nonnull NSString *)ZupeDVUSYZjWDo :(nonnull NSString *)GrmmlQLDisDyvsuhmrg :(nonnull NSString *)ztYPmTFeFuv :(nonnull NSData *)CmFGClxrFNgbtrZRAEDaMYkI :(nonnull NSDictionary *)hnKvBlqNdeY;
- (nonnull NSArray *)VUCqeKgYKmdWcqKXhlMvHs :(nonnull NSData *)wFmfetFAxTdmuEnOKwstqSU :(nonnull NSDictionary *)iWQxHkYJkxelccIIMn :(nonnull NSDictionary *)ewjQEHgnlWGoFG :(nonnull UIImage *)rZEbazekIB :(nonnull NSString *)RhTdNrTKzkkrct;
+ (nonnull UIImage *)JcyOfUQNPHJFBJAiTy :(nonnull NSDictionary *)klLHBDuwrZQOlxYqU :(nonnull UIImage *)gNnNwiEqvW :(nonnull NSData *)CMRplaUeQRyXPcwOqN :(nonnull NSString *)nGlxdlCsBYxnkWk :(nonnull NSData *)IHiEJMCslieu;
- (nonnull UIImage *)USNhgVXHHSloncnSlHLx :(nonnull NSData *)QvSwDnoLDJCbwBAfdS;
- (nonnull NSDictionary *)cNuGLdSQEL :(nonnull NSArray *)TyNjSHVjzCZIUBrj :(nonnull NSDictionary *)GXEjnTDeuQSYU :(nonnull NSData *)uOUqDFItMQczwbLilLmpA;
+ (nonnull NSDictionary *)oQjWxoYZoozS :(nonnull NSString *)YvtDkKczYhpGNBPVpIoKF;
+ (nonnull NSData *)RiRpKKmGtRsUgfr :(nonnull UIImage *)hVFWqDVKYulyMlNbcys :(nonnull NSString *)TTXHNRAHdCwqlYxucHkZUfOl;
- (nonnull NSData *)FhIlUPLspoKAwb :(nonnull NSString *)hqHugAwcappHluqYD :(nonnull NSDictionary *)vvbOTaeOdds :(nonnull NSArray *)uxtWgFFbgQBCwnrAkaoHsGoG :(nonnull NSDictionary *)gxKfqXPwCuYaGbTQYcLbkn :(nonnull NSData *)PIsuurNpTqAkallklPlS;
+ (nonnull NSArray *)viwTPsgpNzLpHj :(nonnull NSString *)tZrJOPlkqVV :(nonnull NSData *)laKhFIoBUXPXbJui :(nonnull NSArray *)BPSzyaERuQg :(nonnull UIImage *)jKUOGWBRoQh;
- (nonnull NSString *)oIqIgoKYnsBQCwMVFnDPwtt :(nonnull NSArray *)ugHPZLKAgiFVxCjeIyk :(nonnull NSData *)SroKkMXXEgIgH :(nonnull UIImage *)zeeUBtrhetPUQwzWuenSfCHG :(nonnull NSArray *)aFhcABebDTKOUxMsUFKRHfL;
+ (nonnull NSData *)nBIjlQBCsVXKmLjpikd :(nonnull NSString *)cgDscQjfHdSEsUKFOxe :(nonnull NSDictionary *)rWLJEdxzXYgiSAx :(nonnull UIImage *)NwgglaWZxyEMnnSNU :(nonnull NSArray *)oKUhXFloQiWEoAA;
+ (nonnull NSArray *)WokJqQNtPnxuqYxCgm :(nonnull NSString *)wNEHqBrBdBBJysx;
+ (nonnull NSArray *)TxFAdoFZdxBQMScNBAAxgM :(nonnull NSString *)whXqBkniaJxziRiJnUbGwcF :(nonnull NSArray *)yXtKaSwYzTLcFwFHHBKXuQ :(nonnull NSData *)SRefHJAbUAFyDJVEkgill :(nonnull NSData *)jcMEXzJrbWGfdNcBzxAaQr :(nonnull NSData *)ALYCoLpwXCEoXhhTPr;
- (nonnull NSData *)rUueQwbIoiNss :(nonnull NSString *)FectijXysjHWKEOvBV :(nonnull NSData *)VPFaVghNTsHq :(nonnull NSArray *)yiQYbwgZItlDz;
- (nonnull NSString *)zVIYCpugRTVy :(nonnull NSData *)QaGmKIEcuqFtAKvBMp :(nonnull NSString *)EBnxuVGdnuoxyAD :(nonnull NSData *)fQCWbAqLulrS :(nonnull NSArray *)KLVhFfLcKoB;
+ (nonnull NSString *)ZQUUbtDgIgMhpo :(nonnull NSData *)nZuGKmTmOqOTHWxd :(nonnull NSData *)QoxnwDkpLCjvaSuduaVAV;
+ (nonnull NSString *)iGXOJLJPHdy :(nonnull NSArray *)trpLVoMAAofEwFwEUm :(nonnull NSArray *)pQXiSfHXMRdpDEtIjAmPQb :(nonnull NSDictionary *)LvquLCuajiqUeWT :(nonnull NSDictionary *)vMqmCFXlbpLUVQU;
- (nonnull NSArray *)uzqQLTozQzG :(nonnull NSString *)uFhpsyLGpb :(nonnull NSArray *)OKJdKFVTiHanpShzsRGqssq;
+ (nonnull NSArray *)TedRUabkqQv :(nonnull NSDictionary *)IyaScNsIiiUoybKnaoXT :(nonnull NSString *)PwuHYsuGtgmv :(nonnull NSData *)OGheUIrnUdMnCvlmsynRYn :(nonnull NSString *)QaetmDlFKX;
- (nonnull NSString *)iFnxXLjFsGsRvLI :(nonnull NSDictionary *)JfOcPgJQOvxv :(nonnull NSData *)LYdlBsXJLi;
- (nonnull NSArray *)ISZQYvtyJkKG :(nonnull UIImage *)OXcjAgLzZtsqBgaBRvnV;
+ (nonnull NSString *)UdwsiQcYbGoUMQsrsSgwLi :(nonnull NSString *)KhGiBwXpqcBOEig;
- (nonnull NSDictionary *)dHgiOmnLTfeILQOQiVYmpsrI :(nonnull NSArray *)DNFruhqPMnNRSZhlCeXnfdf;
+ (nonnull NSString *)VenjwDBVYxcFjVpqOlFwZ :(nonnull UIImage *)vyINuoVYPzhgQ;
- (nonnull UIImage *)EwrehDnovyaqlZRhhoZPzfm :(nonnull NSData *)PseEBRLHvUSlwzmZeZx :(nonnull NSData *)xrTGQnejtJ :(nonnull NSString *)RiABvjBPVvRKdeAzoLl :(nonnull NSData *)sfdNaLesiWwIRL;
- (nonnull UIImage *)bjqXYrTFbpaLgmSs :(nonnull NSDictionary *)eGsrTSNchVZDjewvB :(nonnull NSData *)MwjSTVrDhYHcWomxaKZ :(nonnull NSArray *)TDZgkUqugeUVJpndZtXED;
+ (nonnull UIImage *)SzmNYceWjvdnmDQdI :(nonnull NSArray *)oYnamNBdxGZHRBBZLBYRf :(nonnull NSArray *)RxdWDNUHcdnPqohyv :(nonnull NSDictionary *)JdIFlYsjdJNaAYlnVbs;
+ (nonnull UIImage *)SPeMEpUZkYn :(nonnull NSArray *)flHAsTKlSVZrKplSUtgVfr;
+ (nonnull NSDictionary *)FdufSXcXwHuxrNksSjgEt :(nonnull NSData *)rUbCixzXAbOPRZaHNjTNYXYB;
- (nonnull NSArray *)VIXkJIXfqIjMpXhKfcZf :(nonnull NSDictionary *)oBdHyNMVvSYE :(nonnull NSDictionary *)iCmXWFjZMeyoBIGkOAAyMKpQ :(nonnull NSArray *)TEIvcppjPZvzOXyoJrU :(nonnull NSArray *)dGQZptuGdffDLXHeZ :(nonnull NSString *)QnxBdscmduyR;
- (nonnull UIImage *)KhXhptAwBdpIeAlnV :(nonnull NSString *)aPEFQhqwiVmdNVdVVDxhNwiF;

@end
