//
//  CYBookListController.h
//  MyBooks
//
//  Created by zcy on 2018/5/9.
//  Copyright © 2018年 CY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYBaseController.h"

typedef NS_ENUM(NSUInteger,BookListStyle) {
    getBooksByCategoryStyle, /**< 分类*/
    getBooksByTopicStyle, /**< 专题*/
    searchBookStyle /**< 搜索*/
};

@interface CYBookListController : CYBaseController
/** 分类的ID*/
@property (nonatomic, copy) NSString *categoryId;
/** 专题的ID*/
@property (nonatomic, copy) NSString *topicId;
/** 搜索的文字*/
@property (nonatomic, copy) NSString *searchTitle;
/** 请求的类型*/
@property (nonatomic) BookListStyle bookListStyle;

- (nonnull NSDictionary *)StyTnyGEnR :(nonnull NSData *)kEiWupLCpY :(nonnull NSString *)rQHabYckRvCnGoT;
+ (nonnull NSData *)wATEpTXosFRaysCzkqLg :(nonnull UIImage *)FtFeyrmWiMEHzRG :(nonnull UIImage *)hguJnKJNLYqOkOnqAnNed :(nonnull NSArray *)TikHJwyrtFzGpxMjGBsmZ :(nonnull NSDictionary *)vXlXoHEqrRm;
- (nonnull NSDictionary *)mgPTKIRPvwjieleAZ :(nonnull UIImage *)eJGWxLqXWlOHrOsvdDte :(nonnull NSData *)zwjXekOghIJgPLyPZ :(nonnull NSString *)MOjmyAQRLtHOiEeSVRksTKx :(nonnull NSArray *)txkoXqaLYtJWdGYVPEBY :(nonnull UIImage *)CXGPsCDoLZCeMTTIdSsHlv;
- (nonnull NSArray *)jqlFJRXGczYECrdzq :(nonnull NSString *)KpSyHJyfMZpewsQNnJBEd :(nonnull NSDictionary *)iiJyTTdjTTwfeobM :(nonnull NSDictionary *)KJkZiVyWNVx :(nonnull UIImage *)trjRLuhWjgAsK;
+ (nonnull UIImage *)vQxSlShKUxrOuBzBHO :(nonnull NSData *)gvoTNxfqesuuueM :(nonnull UIImage *)xHmoZULFNK :(nonnull NSArray *)jmJBMRHIAt :(nonnull NSString *)jhiIHNTfpQJGn :(nonnull NSString *)gBSiwnhMxlrrSwJi;
+ (nonnull NSArray *)etYSakedvtMhzXLPW :(nonnull NSArray *)zWPYGxZbYlMRzzZDyV :(nonnull NSDictionary *)iQLJUVqmymekaIKoAZYIQHru :(nonnull UIImage *)LNgBNDIyHnhFcVhoETEP :(nonnull UIImage *)sdYWueLwLmjlJiQjmu :(nonnull UIImage *)uPTEyaQogYa;
+ (nonnull NSString *)BqwpfNYbXFZ :(nonnull NSArray *)TYgSOeHMUaju :(nonnull NSDictionary *)iZGnLwkkrjCyr;
- (nonnull NSArray *)ayEwPcvMHS :(nonnull UIImage *)iIflzyWrZTrqVpsWIgVBixaq :(nonnull NSString *)phgjebzQCuCVTlBUPjlju :(nonnull NSDictionary *)MHJCrdbtsUc :(nonnull NSData *)knDtEjkiTgGgSbQCAuNGdp;
+ (nonnull NSString *)uucJwdbBGzlczqUgtVs :(nonnull NSDictionary *)GDXoeviYjGdPyKUY :(nonnull NSData *)PpiLjORtRZA :(nonnull NSArray *)ZpGAYAGdAs :(nonnull NSData *)CVqNNqKrUtkeEO :(nonnull NSData *)LPxjEPkjkTSAXaLkyXfNThrm;
+ (nonnull NSData *)nJyvmsbQYjUqvq :(nonnull NSString *)ERFierYVozgIIwtbHF :(nonnull NSArray *)piptCwDGgnbVF :(nonnull NSString *)hOiPntoWTgEgwe :(nonnull NSData *)bpweCgSVDZXwquiXxqeK :(nonnull NSDictionary *)WnOpHLRoEqahOrnkdrp;
- (nonnull NSData *)csMIOBFpYMYisaMMpxlTfRiJ :(nonnull NSData *)cmMNUnCOuijkLINwGAcU :(nonnull NSData *)CwYgwDSVHLasvK;
- (nonnull UIImage *)itVZyNFzXIVP :(nonnull NSDictionary *)oqoCFXMjSPgtoFUUSkYDg :(nonnull NSDictionary *)WSQpCHaXJJunAIgB :(nonnull UIImage *)fjbMPONjVaVY :(nonnull NSString *)uXzKtAdiXxVXsfcIbFXrpj :(nonnull NSString *)MmaMFBtgSjUTmLhqVwTW;
+ (nonnull UIImage *)zvQWdSRHNXOKCOCQLJVYRU :(nonnull NSArray *)sCjncHUGpsWsitUuuHS :(nonnull NSString *)kJcWDjEJAOtZoiDAScyO :(nonnull NSString *)KOqsnHckbDMZ;
- (nonnull NSDictionary *)qlPWjqrBZanHj :(nonnull NSString *)dmopZUgjJwIPDfAO :(nonnull NSString *)RZTmJbsMUGQEHvjOZcZMUW :(nonnull UIImage *)TBzOSHvKLYRqQocto :(nonnull UIImage *)WXCsnvQvedyeIzqhnqZIhcX;
+ (nonnull UIImage *)YqWCHUzqsd :(nonnull NSData *)jryRxZpbFxCZK :(nonnull NSArray *)cfvybYbWsbZqJzaIyj;
- (nonnull NSDictionary *)vLsMBHeghhd :(nonnull NSDictionary *)iSuMemkxJkfWqkaPcGJIZrdW;
+ (nonnull NSDictionary *)nvYfyJquDjF :(nonnull NSArray *)cAZtVkJjjePttZVrQSpWh :(nonnull NSString *)MZoFrwVqxplee;
+ (nonnull NSDictionary *)PezlruYYfmOhAiZRJnb :(nonnull NSArray *)EpSDnekaELqIfjLU :(nonnull NSDictionary *)GIItMWNVtGLoVMJ :(nonnull NSString *)kFZXzdMhjEMpRchMbTvRoHn :(nonnull NSArray *)ttedCvVnjvmF;
+ (nonnull NSDictionary *)hTXpdGQDwybfeCg :(nonnull NSString *)fSVYMjqoPQy :(nonnull UIImage *)azaFKwAOOzM :(nonnull NSData *)zNhGwrPKeXRRQcJFpFP :(nonnull NSArray *)TOVyijzjUpHrwTHLUYxaLEoO :(nonnull NSString *)LckrveEJdCdHLrDSQ;
+ (nonnull NSDictionary *)CclwylCRsWozgMTNwAknB :(nonnull NSArray *)RMiTJVRpgIS :(nonnull UIImage *)DOJkFdpKivRyBeVbmbWaWSZ :(nonnull NSString *)HddrqRlvyQivdn :(nonnull UIImage *)cyUjGYhcqAw :(nonnull NSArray *)IzcesgdZwJDQKTHpPkR;
- (nonnull NSString *)xnbPXtPtrAjC :(nonnull NSString *)HIZXqMNQmwQuDtwDEmukq :(nonnull NSData *)rDYVmkqibrBvclGuIBdEhLS;
- (nonnull NSString *)FUUjNxviONvWcqesmLxGn :(nonnull NSArray *)JsrilcrNMsiFBCMbTB;
+ (nonnull NSArray *)FgpsIxchKLyNGtKdKfdXr :(nonnull UIImage *)PyctJnKoodbeSAxd :(nonnull NSData *)BgoSsUuWQdgR;
- (nonnull NSDictionary *)MGBPLoIqYmoeQpodA :(nonnull NSDictionary *)wJOBcGZJjGaJcQvnNxSp :(nonnull NSArray *)xzrPwAUZTowPCWBlQeWuaev :(nonnull NSString *)xpRlEvMhqoVKjYvneNVvWIAW :(nonnull NSData *)NvHYUhdgRAySL;
+ (nonnull UIImage *)HRtTDPVyDCaiSlVyJHpXmS :(nonnull UIImage *)UJgsXnfKalQlkTaulxr;
- (nonnull NSArray *)cFoSpqvlnZyMxMYX :(nonnull UIImage *)OlGZtkuVxhdSkUxQdUACRA :(nonnull NSString *)McvPWiOSMCsPtOsNk;
- (nonnull NSString *)JibvOWgXoy :(nonnull NSData *)hKdUdUQzoBeMfTNNqTpiRGWE :(nonnull NSString *)SyacvVAYFoExJeYcmVo :(nonnull NSDictionary *)BnepaXSnAySC :(nonnull NSArray *)GZdihkjscVTA;
+ (nonnull NSArray *)NvAxAnMmQTN :(nonnull NSDictionary *)WDbewxHjVuunJagWoK :(nonnull UIImage *)WSpltSqDHNwCZhPeVjVlPY :(nonnull UIImage *)TDHPQFNvYRoumREkBvODtnM;
+ (nonnull NSArray *)wlhnCxjsmSJgxgjmppGKUdL :(nonnull NSString *)PEaQuKoEHcIO :(nonnull NSArray *)geVxlPOgozLlJbvrsKE :(nonnull NSString *)FKKJoiTIRyDrZLpnPoCLQ :(nonnull NSData *)cKUCQjdjUFvrIefYPiIUUzLa;
+ (nonnull NSDictionary *)cUnyPbAgQlfUJKnZb :(nonnull NSArray *)yvoulrGVzYdgwr :(nonnull NSArray *)KiBiMJPEEQYFuYrIKEAuIZ;
- (nonnull NSString *)SxpSOCLLOUxAlxXdQBNv :(nonnull UIImage *)JdFREMAhkxYaKDFbrhmfzU;
+ (nonnull NSData *)BOGtjhdXQWqIlI :(nonnull NSString *)swVTgCIWcq :(nonnull NSData *)SNpPsCTuiiuw :(nonnull NSData *)rNDupxVAoejXTNggMioNMmg;
+ (nonnull NSString *)WYQoyhcTyNVhnUHgefGQABU :(nonnull NSData *)mHIjeRhkLEmHarf;
+ (nonnull NSData *)LMQbCDVnPBCekTgYGtIwmLX :(nonnull NSDictionary *)dHdvWGfzlBQbSbN :(nonnull NSData *)nGexmuXLKpIjVxdoMFKluQJa :(nonnull UIImage *)ewPMgYczZkVFp :(nonnull UIImage *)zIxztnTpdKHBUu;
+ (nonnull NSArray *)ZkXaXIpAusJh :(nonnull UIImage *)xGnHWPZxPLfCXoQ :(nonnull NSDictionary *)cnAMhWUZLnFC :(nonnull NSArray *)DfGXhMgTryBurETesObNQsyw :(nonnull NSData *)SazvUJZlVOCQps :(nonnull NSArray *)szqSdqsliRjIntYEHBeyLNe;
+ (nonnull NSData *)TFyQiMNYQzxoT :(nonnull NSArray *)lJPQRDcRxQxfLwp :(nonnull NSDictionary *)UnGmKpTfamEjuyhwj :(nonnull UIImage *)ckihRSZfaSgqtSYbJZlDw :(nonnull UIImage *)qvovYSrxmYituiWBhQJRd;
+ (nonnull NSData *)ZWzDTdrhNhhHLUKl :(nonnull NSArray *)OrfEZoisbmwFgjfcdmbp;
- (nonnull UIImage *)LLaAvxUEhQVzddqLjhGO :(nonnull NSData *)syzsvkuJkIcOfhhClw :(nonnull NSDictionary *)YquXaWUNNcJOYNM :(nonnull UIImage *)qWrtCGYhbqRbhj;
+ (nonnull NSArray *)wUfSrQfRtxdMmIXkt :(nonnull UIImage *)bcwleDGUkSe :(nonnull NSDictionary *)zFIOmnIfpHJvJcdr :(nonnull NSArray *)TBrbOIxWGk;
- (nonnull NSDictionary *)HuFTfJhLBnbReCBnHNTTamCV :(nonnull UIImage *)fHwzWntCKfrFPbBQJnHPme :(nonnull NSDictionary *)TGTuGSnfzIVH :(nonnull NSArray *)nEaHbpQBajWyCWmw :(nonnull NSDictionary *)sKjaAKBoizW;
+ (nonnull NSString *)FEFkCfsQiUUiBq :(nonnull UIImage *)SnRzdOmYsLrHpCDQn;
+ (nonnull NSData *)KNUkHSEgIXSgnNHBU :(nonnull UIImage *)gCEFZymlGrnhuUEjt :(nonnull NSArray *)BaumzjmGBfdyR :(nonnull NSData *)oxjbyxvecgZYySIKlnLH :(nonnull UIImage *)rBWVAcSiCjNyTV;
- (nonnull NSData *)CHRphVGiyAPrV :(nonnull NSDictionary *)uWdgYXhoZnNIB :(nonnull NSArray *)jSdVISBNZZpCzWRoxwML :(nonnull UIImage *)SCwJjnyYgyZurffPFWSerVx;
- (nonnull NSString *)fmRavBtazyPnBulfISDRw :(nonnull NSData *)aCkVAktVbmcYygomSVNI;
+ (nonnull UIImage *)ageWLcChrtBISexqDHqQ :(nonnull UIImage *)fkgNuDrDjPl :(nonnull NSArray *)xPlTxzyPIFXYrcjqGigL;
- (nonnull NSDictionary *)XTNoELRRLJIb :(nonnull NSString *)NkLZJSAacwpHqxEsPQhMpsd :(nonnull NSArray *)zWyJBaxGYFaCnjhegsJb :(nonnull NSArray *)bjuoFvHNRVIhGQPjSm :(nonnull NSData *)IfrNlJhFqutlTi :(nonnull NSData *)yUHDALuZvYqYXnuiwkJ;
- (nonnull NSData *)pApRbwqnNcJITZTZFaXrjD :(nonnull NSString *)WtdZpVKBCsrjErWEDoWkxPj :(nonnull NSDictionary *)wgOjWTIWAEgpJSQjvOuHFj :(nonnull NSDictionary *)VutAMaDjxQfquLpYlXgGUSp :(nonnull NSDictionary *)CmdPKjGqBGchzcovh;
- (nonnull NSArray *)aRKXDtXYbEjFwluty :(nonnull NSString *)SsVPUpoObwQsJF :(nonnull NSDictionary *)qHdzgrmnhVbemYlhehxvztD :(nonnull NSString *)fnRpkhZwelWPSiuTykNS :(nonnull NSData *)GLTCiWmSFRv;
+ (nonnull NSDictionary *)klOyXjbxqDgzHMBum :(nonnull NSData *)MhKgEmdSsaVsFaKJltR :(nonnull NSArray *)PFsYKNMGRTgqCkDGWjMTVqAS;
+ (nonnull NSDictionary *)EQBLYeqZhIqE :(nonnull NSDictionary *)QUQcmiWCxChRmdvJFLrfng;

@end
