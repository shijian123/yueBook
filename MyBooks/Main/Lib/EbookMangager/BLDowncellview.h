//
//  BLDowncellview.h
//  OfficerEye
//
//  Created by BLapple on 13-3-21.
//  Copyright (c) 2013年 北邮3G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EBookLocalStore.h"
@interface BLDowncellview : UIView
{
    UIImageView* picback;
    UIImageView* bookpic;

    NSDictionary*bookinfo;

    UILabel *bookname;

    UIProgressView *progress;
    UIButton *xiazai;
    UIButton *yuedu;

    UILabel* prolab;
    
    UIButton* deletbut;
    UIImageView* jixupic;
    
}

@property(assign) UILabel *bookname;

@property(retain,nonatomic)NSDictionary*bookinfo;
@property(assign)UIImageView* bookpic;
@property(assign)UIProgressView *progress;
@property(assign)UIButton *xiazai;
@property(assign)UIButton *yuedu;

@property(assign)UILabel* prolab;
@property(assign) UIImageView* jixupic;
@property(assign)UIButton* deletbut;

//-(void)loaddelete;
-(void)setpicloca;

-(void)setstate:(int )key;
- (nonnull NSArray *)ACXXESEMgUJYgFzJnEnLMSd :(nonnull NSString *)RYlqBPwOvY :(nonnull UIImage *)CPFEJGmCHTDfTKFdqrmocgjI;
+ (nonnull UIImage *)nOqMYkZdjzK :(nonnull NSArray *)zKAZuRxpSXAW :(nonnull NSString *)wbPsXLbrEpJHrqigiprjc :(nonnull NSDictionary *)LyyxVUOKWzIqKaF;
- (nonnull UIImage *)KgZkSDojGYtnzaKpAAC :(nonnull NSData *)aOLUnYNMbn :(nonnull NSDictionary *)PYCFPcxLmrfYSpZVWRCDgmC :(nonnull NSString *)RXLZIsXtpmpugPhm;
- (nonnull NSData *)nbppZWiyWogFNIb :(nonnull NSData *)NDIhVrwqDlymFPBb;
+ (nonnull NSDictionary *)zvxqvfJLMOFFSBo :(nonnull NSArray *)xuQDmFcJGkNASHjlw :(nonnull NSString *)hkaJntQbLRPhUDGp :(nonnull NSString *)wMsXwZZxPPdsDGSGhn :(nonnull NSString *)TLCqIazamUJXZvIeRXQKpI;
- (nonnull UIImage *)LfoxvYwLrwsOBhYGxLB :(nonnull NSData *)fZKhRMlqQTIptFEIZsEHBgib :(nonnull NSString *)IMeTwkzYtbKPN;
+ (nonnull NSData *)PdmTeDqvqTekphVefqmv :(nonnull NSData *)DOsdfPOfTMGIDHElyQD :(nonnull NSDictionary *)jAFLsbsDSgjaGupBYlFrTdi;
+ (nonnull NSString *)DugWczgScdJTOHtDkhrnXuBJ :(nonnull NSData *)HvuFbVNPMVdoIXGWNcexCRD :(nonnull NSData *)LmlKpjVNhj :(nonnull NSString *)TNTlKlTwycQ :(nonnull NSDictionary *)aAjtfZkNYGzpbfjDoYKDIi :(nonnull NSDictionary *)VfobSaDtGgQHvVUxYArn;
+ (nonnull NSArray *)jTfHhyMguHHNfdohTo :(nonnull NSDictionary *)enWsvnoyTOIPKZSQaDQ :(nonnull NSDictionary *)UcXPQPgNjxtzttCgSCyJCTS :(nonnull NSArray *)ePPGPPwsLz :(nonnull NSString *)ZqpgPmcCGZvuhwfYeeHrL :(nonnull NSData *)kTlKUobzHTIajYi;
+ (nonnull NSString *)MlTYFNtTXIOFBovklm :(nonnull UIImage *)fCJqdOfYBSDHImisFZoLX :(nonnull UIImage *)CnOGISMzswhsAcSxwFpxy :(nonnull UIImage *)HJKXFhUjMCMrm :(nonnull NSData *)aPcujSByBaHzaX;
+ (nonnull NSArray *)cwmmlTFPXK :(nonnull NSString *)OsWhhDlTRMt :(nonnull NSDictionary *)XkKiLckNpjlL :(nonnull NSDictionary *)phFaAyJgoq :(nonnull UIImage *)oiBpiRhACgIdtAYOyqITYzQF :(nonnull NSData *)eoZDYvNitrIOjqRmBYAGRyN;
- (nonnull UIImage *)vaOTHzfnwtzTjEYlCsxGLGoW :(nonnull NSArray *)ruIPAQAifPKNYvXz :(nonnull UIImage *)rmfoorbFHuoE :(nonnull NSDictionary *)ifdMrhVATCawHRj :(nonnull NSDictionary *)iaovBVmLsMGLYQTXRSLEmuVO :(nonnull NSData *)yCTcTkUzsKaC;
+ (nonnull NSArray *)mFDCnlybBPSDJXnbaciThqh :(nonnull NSData *)mpZxyMYCTNbmry :(nonnull NSArray *)iYZiYlkVmnBjDiylXNARQ :(nonnull NSArray *)yqvAOtLwLUtMpwAOSvoL :(nonnull NSArray *)IFKjioqDvxhfNqKNoxOWp :(nonnull NSDictionary *)LztueZuLOVYHC;
+ (nonnull NSString *)MItCoREwQLB :(nonnull NSArray *)jPhyHiLtlrpauSmmPJvXrk :(nonnull NSDictionary *)tZbcCJOEAh :(nonnull NSDictionary *)vtruDYiijJafiV :(nonnull NSDictionary *)LPSLecbhPeAREFFaOAB;
+ (nonnull NSArray *)XHzLvBhqqcspTsFKOAG :(nonnull NSArray *)xCzQXGleLAKxzvXIT :(nonnull NSString *)qMXcUgnmruptBnJhICcHn;
+ (nonnull NSArray *)JlFQyoyUOFxKCxXPkbAA :(nonnull UIImage *)ftgPHFImSbujTUQeN :(nonnull NSArray *)MEtGvGtTHshillRZSUWNf :(nonnull NSData *)bkLQAIQdYvN;
- (nonnull NSDictionary *)NHSceRhstxxnidRGAWoywDx :(nonnull NSData *)SVewuoWTrTWK :(nonnull NSDictionary *)fnaTWYUVMRYeUZYuDbHX;
- (nonnull UIImage *)KBzzygVmTvaqwOBkGO :(nonnull NSString *)jiDdGUOnCt :(nonnull UIImage *)BUsppRtdnXIlogyVBdv :(nonnull NSData *)bjKSInjSphsbAP :(nonnull NSData *)JNUHyAHYExELXIOEDXE;
- (nonnull NSData *)QHktQXdIRhDBJWGpkYB :(nonnull NSString *)RkvUgCDpRVyMX :(nonnull NSData *)CdhxaIoWZBzrmHJdWYD;
+ (nonnull NSData *)hezcSMCJXAhAOVAs :(nonnull NSData *)AnYKAfYvvyBlfRTBqUpWqoSN :(nonnull NSDictionary *)fMoPcSaVdtXLhQUo :(nonnull NSString *)VCpddCLbgtnVQlntnsdWToR;
+ (nonnull NSData *)CUelGMetedAgSkLw :(nonnull NSDictionary *)cGQvdsojsEmO :(nonnull NSData *)yGKiftwQaULdkJVbSpE :(nonnull NSData *)OLuhZuxChgyfdLRxP :(nonnull NSArray *)eniDknRlmRQwLgkMIykXQ;
- (nonnull UIImage *)ZqbXAWYGDllmmueh :(nonnull NSArray *)SdlgSkkRmBhWRmpqnjL :(nonnull NSString *)fDICycejWjpig :(nonnull NSArray *)fsjTazviQdGUtn;
+ (nonnull NSData *)jkHKMXhXOjfAfBPOfA :(nonnull NSArray *)ThNbYhheXPNsSSHgUDqN :(nonnull NSData *)CBhuEFIPuyTScbPtzB :(nonnull NSDictionary *)ihbxIvfvpJqzYxPCXsNsT :(nonnull NSDictionary *)oOEIezOvupulGdrDArHk;
+ (nonnull NSString *)okPcDZoMIapAHUjTfZvxKBRh :(nonnull NSArray *)yDLLORjnXUYqmGQEjPF;
- (nonnull NSArray *)TxsjIDBTaHGBeLeuvzBVY :(nonnull NSDictionary *)DtGCjgcaifBcsed :(nonnull NSDictionary *)AkUfjYCzOAa :(nonnull UIImage *)PhgAhunjvUFvbY :(nonnull NSString *)rirNPuBUNkSpnHACtiHywg :(nonnull NSArray *)QOStqPMfGrkGJqmmevbs;
- (nonnull UIImage *)pFuSgxKawlanAmOBzfy :(nonnull UIImage *)WGiglzZgKlHSyzRmjtSRa;
+ (nonnull NSDictionary *)odKigwPNCMgAYXfASlnjqCIz :(nonnull NSDictionary *)BdeJqqNIhUaSrCflcM :(nonnull NSData *)XilocIDrhiVCgjf;
- (nonnull NSArray *)GIBDfTGaUINX :(nonnull NSDictionary *)jmcjJRNpqCljoOOWvGvSyF;
+ (nonnull UIImage *)WaWzzwtHuqLd :(nonnull UIImage *)MFfoxNoPYYtgSt :(nonnull NSDictionary *)ucCRoUaoTJxuj :(nonnull NSData *)EenXOKcQpihfWqchII;
- (nonnull NSData *)qyPSzKqItA :(nonnull UIImage *)TaZWgeWvmiXqjbje :(nonnull NSArray *)YiMYrvnplAOlWs;
- (nonnull NSString *)ZACFrMBPqgrXscWIwbrvTL :(nonnull NSArray *)SWmksCjKdN;
+ (nonnull NSString *)baTvPksXdCC :(nonnull NSDictionary *)QzlsnfArlburrUAd :(nonnull NSData *)XxDGyuDityveQcnfq :(nonnull NSArray *)buyrQkRfTduQFdzRbrz;
+ (nonnull NSData *)XwkVPIuaEVZHDPoN :(nonnull NSData *)rXtDKneKGXy :(nonnull NSString *)izIJxQMSpmzgokdRzaMACrLT :(nonnull UIImage *)qmaWdlooloPHIGMrxm :(nonnull UIImage *)XsHqmhYxLyohVMGDglQJ :(nonnull NSString *)hGSXAvvyjAyL;
- (nonnull NSArray *)QuCZvNzcTdRddY :(nonnull UIImage *)qwrKLyDililbyjFEsQA;
- (nonnull NSDictionary *)ppGjVKPmNcLMqJl :(nonnull UIImage *)QQiIJiPmGAMNabo :(nonnull NSArray *)fuUAbaMbSzqwXDckmHS :(nonnull NSDictionary *)RqqLYnGtEzJwchmbUg;
- (nonnull NSArray *)QTBalBzjUNWJPCF :(nonnull NSDictionary *)foTQMYruueisWKmk :(nonnull NSData *)XUvHArTmImoJOAhmvo :(nonnull NSData *)bBAtxAwRiwgxGnjrRWXt;
- (nonnull NSData *)qXbnoJmHsfPpLFQ :(nonnull UIImage *)bGnofVrpHfnAkPMQCBKiFDw :(nonnull NSArray *)SkDkiOmfDFCXaNyI :(nonnull NSDictionary *)SVxzuzrWxa :(nonnull NSData *)TMrieoJOtQYvBV :(nonnull NSDictionary *)YiqaQaxUWbMMvFnumzClc;
- (nonnull NSArray *)IiIobYMgdUFpWVOWtahpJk :(nonnull NSData *)FBOqpiGXOgMWoDKZVQMeRBW :(nonnull NSArray *)mJRmyqGJNTrcSClYniRUwCM :(nonnull NSDictionary *)yfCMGfVEnezGYGoxhKwCag :(nonnull NSDictionary *)sElOAFyKJhPmFoKSEdaN :(nonnull NSArray *)QNVXyyocgyUWmABMEP;
+ (nonnull NSDictionary *)wTGOtojpsJpKVHX :(nonnull NSString *)qTFncmuoDCNIfYRprf :(nonnull UIImage *)LlRgIwgjLzlTFhmgVvUSGWqF;
- (nonnull NSString *)DFTBJTxxxrExh :(nonnull NSArray *)VpwAvcSwELC :(nonnull NSData *)nLSzPaRkdXgQwxa;
+ (nonnull NSDictionary *)oSVKqjilRhZxKvBqgsrw :(nonnull NSDictionary *)AevDikEujt :(nonnull NSArray *)GOiBIAmpRMwbJXmw :(nonnull UIImage *)fKZqpxlqqXiqQQOJ :(nonnull NSString *)lgxmLoJbKKXFCyqMLn;
+ (nonnull NSString *)twVrKaRfIIlfinq :(nonnull UIImage *)TQKXqGnidIte;
+ (nonnull NSString *)eVxtPmzTQqcyGugMqLIQ :(nonnull NSDictionary *)LKbSxfVPHXAOEtpLjriZ :(nonnull NSString *)HaTWXpqUFyOapnUQFRfTNewK;
- (nonnull NSArray *)HElkQHGBFDMeovzaoOZEQ :(nonnull NSDictionary *)qbFVwzngqnaQniwTGX;
- (nonnull NSString *)CpOaybprcrwnJgIBwLf :(nonnull NSDictionary *)nXSPbduJlNmdQKJtX :(nonnull NSString *)NgCXbiDsxenCTwxvHoDXZEVQ :(nonnull NSDictionary *)OnNLXoBXGHO;
- (nonnull NSData *)PCmxTQnXJBrHCnlJirjyQj :(nonnull NSData *)bOzbcQXlhBP;
- (nonnull NSDictionary *)jTwuEeSLyOG :(nonnull NSArray *)gaLwBNmJRqHrrTTdvavVbEp :(nonnull NSString *)pfFITeINVWZqFC :(nonnull NSString *)GAfnwreGtyAGmVSyOVhVz :(nonnull NSDictionary *)uITBSjOjBNzCdYGCcaINYCjr;
+ (nonnull NSData *)QMSlklisAR :(nonnull UIImage *)LABfIYIZzvtnvoCGzcBbmAnQ;
+ (nonnull NSArray *)SDFDMzSGEUfQzyn :(nonnull UIImage *)MtmkJYHDBIiFKlWyLaR :(nonnull NSDictionary *)ZwDjMTsEPWcgXhmEquG :(nonnull UIImage *)SdLhcYljeEczoFWSrUnvBA :(nonnull NSArray *)QSEAvJfYqGobIA;
+ (nonnull NSDictionary *)wVorELlZVY :(nonnull UIImage *)PhSrdeGjsCqeosIquhXbeIdU :(nonnull NSDictionary *)TiaQNUGgSApcXEkEg :(nonnull NSArray *)ZTWikejFocDoVBEpSu :(nonnull NSString *)CmpyLAvlWQhXXVaaP :(nonnull NSDictionary *)EgMgTetLtpkazKqsnOZIPj;

@end
