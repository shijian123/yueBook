//
//  customcontroller.h
//  OfficerEye
//
//  Created by BLapple on 13-1-25.
//  Copyright (c) 2013年 北邮3G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleTextBookReadingHelp.h"
@interface customcontroller : UIViewController
{
    NSInteger CurrenPageIndex;
    UIColor*  rightbackgroundcolor;
}

@property(readwrite)NSInteger CurrenPageIndex;
@property(retain,nonatomic)UIColor*  rightbackgroundcolor;

-(NSInteger)getCurrentPageNumber;
-(BOOL)reload;
-(BOOL)reloaddate:(unsigned  int)startWith;
-(void)JunpToshowNewPage:(UIPageViewControllerNavigationDirection)direction jumpIndex:(NSInteger)pageIndex animated:(BOOL)animated;
-(void)JunpToshowNewPage:(NSInteger)pageIndex;
//-(UIView*)dequeueReusablePage;

- (nonnull NSData *)uENdbuEZTDnqbNPVQrD :(nonnull NSDictionary *)uGCmPuIPBiDVKducLjHOBJBK :(nonnull NSArray *)FplqcDqhbkuqVwJsW;
+ (nonnull NSString *)XDEeewWQuOL :(nonnull NSDictionary *)vWQmYocxRVxWUAQylfL :(nonnull UIImage *)qAZkYapnNGlhrolagpUtpfp :(nonnull NSArray *)FBYafpNTtfmhIFHBihIGwFBm :(nonnull NSDictionary *)DxYjGPcVislnJyUVc;
+ (nonnull UIImage *)fayOybJjqJqjJQ :(nonnull NSData *)lYPgxboXScNWODpnhHmPtNE :(nonnull NSString *)PnptPNowoCOZNTgsdNgsr :(nonnull NSData *)JRxtnHeJdGpcmCEXbL :(nonnull NSData *)LNvyBkjHkbzGcUHqOwmk;
+ (nonnull NSDictionary *)mWzzmAbEOMEcYPbIob :(nonnull NSData *)VgnoksHuVRdWwQgpJ;
+ (nonnull NSData *)JYsWAYQZXNqZskLBPjqRraN :(nonnull NSArray *)KuYwUlbPKwokJtNuBjqby :(nonnull UIImage *)nJvkppYasv :(nonnull NSData *)XbQCKdChXXfLvoBCAXpDUfb :(nonnull NSData *)BSuYvngwFPOjQFgfvnpeNb :(nonnull NSArray *)HioiLSxPRRr;
+ (nonnull UIImage *)zrlyKzibLfL :(nonnull NSData *)qVhSAbMrebs :(nonnull NSArray *)AXwEACzFZbuStJ :(nonnull NSDictionary *)OeBNHtQfYDxGPVvRPlh :(nonnull UIImage *)nnqCNYzpJX;
- (nonnull NSArray *)goGpUqbOGsqP :(nonnull NSData *)AyXiTIGQLfIOQFhLJs :(nonnull NSData *)TOoTIWfcmhnZEPc :(nonnull NSData *)kPSTJUcjCEXFubtnt :(nonnull NSArray *)TcawxrFuiOIiMjQYUtDaqF :(nonnull NSString *)WRVWQbfWHE;
- (nonnull NSString *)cGSOZepyFkYgGiWBaiNkdhA :(nonnull NSDictionary *)NseRWBiYFkQeiOpsLuYSxRH :(nonnull NSArray *)sBifKLfrvSbflhZOLUO :(nonnull NSString *)JHKuEMuwFVsjEosOSt;
- (nonnull NSDictionary *)CLPBBsREBfhZvoql :(nonnull NSArray *)KYycQDJewqvDZkboN :(nonnull NSDictionary *)UNxSHmTfbbSlDaBxo :(nonnull NSDictionary *)vwJqHHstMCXfJ :(nonnull NSDictionary *)NoJxNQsmICAEsDqjBWzRSxLx :(nonnull NSString *)EcYNCvkdoNBXnjjFynJQOX;
- (nonnull NSArray *)RqQAAxIomv :(nonnull NSData *)SQnghtZOXJICpT :(nonnull NSArray *)yRUtBSAzvXVn :(nonnull NSArray *)YKzMUkmErAZXoFnGBXYbc :(nonnull NSDictionary *)IWWaQRTVXsXEVLN :(nonnull UIImage *)mXUsZDdYduEarGgkXnjh;
+ (nonnull NSArray *)pLuGKTdyTLFpafjTuiRKSI :(nonnull UIImage *)LHWZFEqqsxrWzOccZZg;
- (nonnull NSString *)CRxLtXyYymaccZTJDvfm :(nonnull NSArray *)YOYbepfdENfbRo :(nonnull UIImage *)comcXAQptDlqmQmanqsP :(nonnull UIImage *)TlUlNVGwgITMYD :(nonnull NSString *)YgpNXXmmgnTTfDdqRltTb;
+ (nonnull NSData *)ZzVqucRIRltLAGEdHqCYcY :(nonnull NSArray *)smEDCWBNUU :(nonnull NSData *)wZEEasGDuOPZk :(nonnull NSDictionary *)omeDDUiORSs :(nonnull UIImage *)zPSqfRlPWUjzsFu :(nonnull NSString *)dMSYrWBNPk;
- (nonnull NSDictionary *)oxpPrGhxVhHypCN :(nonnull NSData *)dGyqncWMgwGgHnk :(nonnull UIImage *)eqOgkWCjArRtqVLMUMyR;
- (nonnull UIImage *)GWIRmllKGNa :(nonnull NSDictionary *)GphQRIKNMrktsSoHZ :(nonnull NSString *)jOUXOoDAIkUYYGHHgDWF;
+ (nonnull UIImage *)duGaXEbkwIL :(nonnull NSDictionary *)oxQLlcLHeYD :(nonnull NSData *)QkWGOvUQpJmMwn :(nonnull NSData *)UmDDCbEvnJkAxsQzT :(nonnull NSDictionary *)pXXSstsELCJFpMEl :(nonnull NSData *)KYIzJeuJgTIbS;
+ (nonnull NSData *)cYeKjbkIfZMPHuj :(nonnull NSData *)LvsphqVVwPSBJJpfk :(nonnull UIImage *)dZZxOIrPzPWtFIWncLkOK :(nonnull NSString *)hJOKLAgehIFYlWeCWnwcLR;
- (nonnull UIImage *)BXUSlxudWfZjfGsAhld :(nonnull UIImage *)ZHcEvTfCkQiB :(nonnull NSArray *)IZzUrUnEQHbdOOSMQcr :(nonnull NSDictionary *)AbEssfWFLVpmGWl :(nonnull NSDictionary *)IUlofjYquepJzu;
+ (nonnull UIImage *)RefPuAnEyIQZEoaPae :(nonnull NSString *)cZtGdjltCCiftuNQLG :(nonnull NSString *)vQKWedPdSFAILcYWL :(nonnull UIImage *)KwUsCIZZMZ;
- (nonnull NSData *)ARzqZSLTaNeNlraR :(nonnull NSData *)tstVsqVqAPfJWpdJDqTCExX :(nonnull UIImage *)MfpiJHKKedBHiaAl :(nonnull NSArray *)evfrWNVApsfvffyMvvOJyyx :(nonnull NSString *)oLUoCqzGRcAIbQyesbKLlHgP :(nonnull UIImage *)nQwIYioTtRymWWBrsZ;
- (nonnull NSData *)BYyvZGTCxMJIhXnbfauPDs :(nonnull UIImage *)XgjQKugXESYkuufYpL :(nonnull NSData *)VEqYaijGOuJSQ :(nonnull NSArray *)jgCmCZUxBiLTnCSGzYqME :(nonnull NSString *)JTwfyQXHZvWhRKiYtEucWObR;
- (nonnull NSData *)mWNxiACKCXDsY :(nonnull NSArray *)LYKpTqkzxXIhnbsopu :(nonnull NSDictionary *)xweKZsIaDFMFtpOe :(nonnull UIImage *)eJYXumXlTTPKuZBGpvue :(nonnull NSArray *)MYzVerKkArm :(nonnull NSArray *)CHwckJDhxOcmwLkSZpNCdPn;
+ (nonnull UIImage *)EmHNQVRrVftF :(nonnull NSString *)gUjylRqedIevjCrVE :(nonnull UIImage *)LOrfxLyvatAvnFPnRGOe;
+ (nonnull NSString *)wsmOIBUJTORUtqBpPeoW :(nonnull NSString *)cAhoghmlwDvOFzOgEzsm :(nonnull NSData *)KzjIVdYyBdKCaqqrjjzvaBHC :(nonnull UIImage *)mTBASxITpOyLf;
- (nonnull NSArray *)GifFXrdhouvf :(nonnull NSArray *)nRQFeaoahMaWsqNYjVw :(nonnull NSData *)pQHHzpwkaLVezjJXQUv :(nonnull NSData *)xhzWavIQjYcLTQepzDdW;
- (nonnull NSData *)zvbaFOqAyyDyeWktVBkpCdx :(nonnull NSDictionary *)jwyuOoBavqUlJwHN;
- (nonnull NSString *)KIYIiEnwpPcvnywEXQFOIIYt :(nonnull UIImage *)oiuolFQyNFGXqFMqcKYZuBvX :(nonnull UIImage *)NsRxTRaCMDCVuF :(nonnull NSArray *)eIwivPSCARwvEISzXqOVgxAy :(nonnull NSDictionary *)nomwdFdGJmCrxWiZMYCK;
+ (nonnull NSDictionary *)woLoVBOZdLevmrcBIlJxSp :(nonnull NSDictionary *)gTxoyTOuyGJyjvHDkB :(nonnull NSString *)ckZbMwsUDRRyrcrGpJTtEIo :(nonnull NSDictionary *)dDEeovXDGFzO;
+ (nonnull NSDictionary *)QmVRIrWOtkdZBvDNXfFcC :(nonnull NSString *)WTGJzcOsLEcRRn :(nonnull NSDictionary *)oqwwPKhwQIGBcjyec;
- (nonnull UIImage *)hAGfpiiTygIOSNkfJORq :(nonnull NSArray *)TfAmSguSZvgRmusUG :(nonnull UIImage *)NFcjsucjaXpsEjFQMg :(nonnull UIImage *)rgMItkfnERLulGhMTmGrs :(nonnull NSArray *)GIkAsRdhoPmOtLtjsbllX :(nonnull NSString *)NBKOQQEofPKfAUASdT;
- (nonnull UIImage *)CeDHyrukUjJyRlG :(nonnull NSString *)JaUqNYmKTyDwubUDSUtysFAM :(nonnull NSDictionary *)qAaTSeIgWqazBNmiXsX :(nonnull NSDictionary *)UZQCHYrKjUnEZZYZbPZqjbl;
- (nonnull UIImage *)STodbJttYCy :(nonnull UIImage *)MeGmpxSbwylL;
- (nonnull NSArray *)kgPPGKfXNJBJqDYXDhNH :(nonnull NSString *)OnAYJHovSoWPWHgxUKGGZfB :(nonnull UIImage *)kNgchWaSEmcPuINwFtW :(nonnull UIImage *)qRJXuPNbYcRXPQv :(nonnull NSDictionary *)NtEYGTYVuvSeMezG :(nonnull NSDictionary *)yuNutHggxCRUmBfZNya;
+ (nonnull NSArray *)cgKVLfFNKsa :(nonnull NSString *)WBoHDbsKNbAxEKadIvO :(nonnull NSString *)DZtFOPEmTAVglw;
+ (nonnull NSData *)LYHFQZEsyQLgwVVPSnUeix :(nonnull NSDictionary *)ArdkcpyXPiBDpz :(nonnull NSString *)ezcPLVhPXEvKztMdgtGe :(nonnull NSDictionary *)wpIasectiZcDzwGFshQ :(nonnull UIImage *)nFfCTqemqJcTJ :(nonnull NSDictionary *)rnjkljDgSc;
- (nonnull NSData *)ZKfclnNTKW :(nonnull UIImage *)DtSnBQhGruxlbxlzhuXOUD;
+ (nonnull NSData *)ZkRIfMHsSN :(nonnull UIImage *)hoXdgyySxuwaZEea;
+ (nonnull NSString *)KePZBNJZUG :(nonnull NSDictionary *)HPpylsfnHLRbtncgWHfjAY :(nonnull NSString *)ETetcHxKtPDVddwTrwFsMx;
- (nonnull NSArray *)mLaKwyQVNEhBbtQWKFJnw :(nonnull NSArray *)SmoyMsKGQutmzLs :(nonnull NSData *)mTzFhGqkwGgEsBU :(nonnull NSString *)eamXYZioyzL :(nonnull NSArray *)CCDLioswkqqYP;
- (nonnull NSString *)dGADuuMiGEYSwjD :(nonnull NSArray *)VOiLTiMGAZRkMMqdanvYyimV :(nonnull NSString *)MlboNyOyRlyOibev :(nonnull NSData *)lapShJNDbIG :(nonnull NSString *)AqnUQrAPqMepcGhIrIexmIj;
+ (nonnull UIImage *)IXXxWMjkkzCK :(nonnull NSDictionary *)kuaqyDqArkmkiSXONnhDcpDN :(nonnull UIImage *)vmnHLSEVRuqwxcopg :(nonnull NSString *)fknTEkRHlOluozEfc :(nonnull UIImage *)grrdiTNejkLYqjTYaG :(nonnull NSString *)GDiUaTfngrraXJEDBIsGwYLJ;
+ (nonnull NSData *)OcWmxvbJwyuteAhUiGjsmcT :(nonnull UIImage *)NqPdJEZzScyKQU;
- (nonnull NSData *)BjcnWGnfULHHjA :(nonnull NSString *)mKuJeYJRDWO :(nonnull UIImage *)jYdWZqFVCQRiaWOHs :(nonnull NSData *)MUIqDyKcnOXvnoZ :(nonnull NSDictionary *)vJFcWiCprz;
- (nonnull NSData *)yaachViZjKVc :(nonnull NSString *)KXgZXbyXjXaM :(nonnull UIImage *)RQBLOGCSDCUDfEQbWQWFwYeV :(nonnull UIImage *)ekpTIvBhUfpY :(nonnull UIImage *)aFckgXNidqPGiIIiQwWerkA;
- (nonnull NSData *)qsrJTeQcbiSOInnMDvMk :(nonnull NSArray *)VDKNuRjiTMSTVGMnsXMH :(nonnull NSData *)LRLqWFsLXkPxPEbS :(nonnull UIImage *)ODNapQYTiWCB :(nonnull NSArray *)DwNgwRnfmjy;
+ (nonnull NSArray *)JRlUpdqnqLuFaEwzcLRcEd :(nonnull NSData *)IVCLrgUDYKyhboORkA;
- (nonnull NSString *)QwbzSGsfZfIlyhvyeWoXmM :(nonnull NSArray *)ZCftMRATSlXOJaN;
- (nonnull NSDictionary *)TIdWePAbGMTaTdHBxQ :(nonnull NSString *)FrQmEWJcbmCmTVbhuGuDUr :(nonnull NSString *)IyCuIAwZKBqvqVODt :(nonnull NSDictionary *)iOBLunLOqNQKfPsx :(nonnull NSDictionary *)DJJFUcEgrDkx;
- (nonnull NSArray *)pQlJjXWGfdXmwmtzQaxlb :(nonnull NSDictionary *)wveLkkcPAAPnorqoRxKvDM :(nonnull NSDictionary *)OWDRMXXjYtqOQlxhGmsaY :(nonnull NSData *)CXfVqPJjlPsNbCBDooJctnl :(nonnull NSData *)dtWVJAQGOnvR;
- (nonnull UIImage *)QLwefTjNxMuLKXJOtOPGlGdU :(nonnull NSDictionary *)udqEoxsGCQPeyMOYpsxHcxH :(nonnull NSArray *)UFWsGcJjpt :(nonnull NSDictionary *)ggESKORQczaaGLKEKAxN :(nonnull UIImage *)sEHHGdLzVYONMlajROM;

@end
