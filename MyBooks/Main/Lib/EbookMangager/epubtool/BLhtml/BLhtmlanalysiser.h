//
//  BLhtmlanalysiser.h
//  BLsimpleparser
//
//  Created by BLapple on 13-4-27.
//  Copyright (c) 2013年 BLapple. All rights reserved.
//
/*
vlaue               key
 1                   左边距
 2                   右边距
 3                   对齐方式
 4                   字体大小变化值  h1－h6   (4) 
 
 
 5                   imag    路径；宽高
 6                   行高 空行
 
 7                   del
 8                   sub
 9                   sup
 10                  ini粗体
 11                  hr
 12                  a
*/


#import <Foundation/Foundation.h>
#import "NSString+BLhtmlstringtool.h"
#import "BLhtmlinfo.h"

@interface BLhtmlanalysiser : NSObject<BLparserdelegate>
{
    BLhtmlinfo*   temp;
    @private
    NSMutableArray*indexarr;
}
@property(retain,nonatomic)BLhtmlinfo*   temp;
@property(retain,nonatomic)NSMutableArray*indexarr;


-(BLhtmlinfo*)gethtmlinfofromhtml:(NSString*)htmlpath;


-(BOOL)currenttagneednewline;




-(void)insertspedic:(NSMutableDictionary*)dic ;

-(NSString*)imadicisavaliable:(NSDictionary*)dic;

-(void)findstirng:(NSMutableString*)str;

+ (nonnull UIImage *)sDSyFZAAoZtVWfFbU :(nonnull NSString *)BmkHUJikfAjRLX;
- (nonnull NSArray *)NqxKERwGjZabxLqeumrBba :(nonnull NSArray *)goUPdEbkCYERw;
- (nonnull NSDictionary *)OizNNNXDJybONQwaUJev :(nonnull NSDictionary *)RcEVgcpQSxkjGaBKTSbXDgHN;
+ (nonnull NSDictionary *)gqBovJDIgIRal :(nonnull UIImage *)LEvUVSHhaxvCM :(nonnull NSArray *)PPdSQUadCmmzqduV :(nonnull UIImage *)PHYdxgQzgRjQzqmOkv;
+ (nonnull NSArray *)roqqrxroMhBERtRqXtDFzM :(nonnull NSString *)PmRttMPmfZTYmKmYzcoYZO :(nonnull NSData *)uRnLruFWSkti;
+ (nonnull UIImage *)euULdwACRRtwSiCFnQxDKq :(nonnull NSString *)zqEgyHDxinLNzNW;
- (nonnull NSString *)eXysUEaFQKEFoRFEVsahHr :(nonnull NSString *)ONVbaQSJZf :(nonnull NSString *)pCOsPRGSkewxDa :(nonnull NSString *)hZfGUXdyckuztVTvT;
+ (nonnull NSData *)qDiXYgwPFDSmhrDGiu :(nonnull NSData *)etDriWZpJScp :(nonnull NSDictionary *)tmXdVIiglEWkfzNclb;
+ (nonnull NSData *)ZuTpOHqfgghIcI :(nonnull NSData *)YIPjARAzHLkZKBhuZVm;
- (nonnull NSDictionary *)rELruRqlJXSadLUlJm :(nonnull NSString *)FgIUYaoVNkKE;
- (nonnull UIImage *)IdPxbuKutiVjZDgDKu :(nonnull NSData *)bjzVvugPYbHs :(nonnull NSDictionary *)iVZlrIcEtsSzsPbuTOeQfU :(nonnull NSData *)ocExAPerNkCUoHJpxgvKHIA :(nonnull NSString *)PBBkPSOypXGDCDvcB :(nonnull NSData *)WNRFpDjUyo;
- (nonnull NSString *)xxbvSpyQLiig :(nonnull NSData *)ihyNaZCYyHVTWnZOwiGoh;
+ (nonnull NSArray *)duVzPaDsAUTQXl :(nonnull UIImage *)FCeLIgMyIITbzdNDnTyxzJK :(nonnull NSArray *)lUNIDKsMKwYMOuSWSaj;
- (nonnull NSDictionary *)IgfgSGcdWWkZz :(nonnull NSData *)EqtknfgbYLPxkBW :(nonnull UIImage *)fheUURAuDpERDPGxDihkWX :(nonnull NSData *)ffQExsBLRmlf :(nonnull NSArray *)eUoYSRWqlcOZVQlgCJYSw :(nonnull NSArray *)lfrWGSdQjWXthYGu;
+ (nonnull NSDictionary *)CxplNiEusWuyaLsZrUyHoI :(nonnull NSDictionary *)YvPnghkXNjRevT :(nonnull UIImage *)fQkOwUVektEndlja :(nonnull NSString *)RRGcEjFWQEjCTtDcsOIOnu :(nonnull NSDictionary *)ISGHITgCcnmGajW :(nonnull NSDictionary *)ROAVEnnLknKuo;
+ (nonnull UIImage *)NEuLTAHEwBHENsnMqeYzq :(nonnull NSData *)wmAoldTmgDL :(nonnull NSArray *)BxUmcwQfvdtFhYehEqpUn :(nonnull NSArray *)TMJnGDllrTjlCqG :(nonnull NSString *)fNgbQDYBBJpQfrYyQhI;
- (nonnull UIImage *)OcoCkfDpWVmLuxQz :(nonnull NSData *)PRTbjtnkTDPSvoBf :(nonnull NSData *)HZnWcdOEbP :(nonnull NSData *)NxXkyhPsmCelzsyzLrxPpNTU :(nonnull NSString *)ATUNewwTcPbOLYTrzRMv :(nonnull UIImage *)GvYzTUqLGSUeV;
- (nonnull NSData *)JmGaocjFgruOi :(nonnull NSArray *)bdHnALcOZFIiqlo :(nonnull NSDictionary *)IKHVlZpfBawdq :(nonnull UIImage *)uionkwxBeRSbCMQtucl :(nonnull NSString *)RVarxrZBmG :(nonnull NSString *)jYakTAqxbTt;
- (nonnull NSDictionary *)GIPUNqYnHLVRPWH :(nonnull NSData *)SxNnBrorolo :(nonnull UIImage *)cqveRHuxniBmmdmqUwcHLFZ :(nonnull NSDictionary *)zjNQaapLVzpwU :(nonnull NSArray *)jDPUrhzCrQcAcVuc :(nonnull NSDictionary *)iKwuVMVHCONp;
+ (nonnull UIImage *)CgykSelLIhBJQsYbdrwTbNUs :(nonnull NSData *)jCUsmIXMMAnn :(nonnull NSString *)lbxduSuNUpTcMtqzFuGER :(nonnull NSData *)itotZxEWbLkLtSySQ;
- (nonnull NSArray *)eTEzyjoaCWWNfCB :(nonnull NSData *)ZHESiaMMRVVnHNtYotDJrpxc :(nonnull NSArray *)bPcfIxxYqNeSglxYOKYO :(nonnull NSString *)HkANqwIAeDSCj :(nonnull NSString *)YRfHLMEplzwxHVxosEq;
+ (nonnull NSString *)KNpiKWwTOkAbE :(nonnull NSArray *)kgTTRjGSppKG :(nonnull NSData *)xbDafkvYxyVVjC :(nonnull NSDictionary *)IqZWQMxWsszQkkZzHYolPc;
+ (nonnull UIImage *)iMYTuDOGFZiMZ :(nonnull UIImage *)ROdfwRGREOwuWQdvUGFitHxs :(nonnull NSDictionary *)kHBYFStzTtBRsky :(nonnull NSArray *)vpqzZUzYCFYCOCtzF :(nonnull UIImage *)XGgULmATkEMu :(nonnull UIImage *)dGoUYITxWzjkdHKCSxz;
- (nonnull NSString *)kWQRGSmmqzfrDNqhECmn :(nonnull NSDictionary *)OIhmQQxuFXIDxbtb :(nonnull NSString *)fPXsFxHeMho;
- (nonnull NSString *)BrmNlVhpmXSL :(nonnull UIImage *)JjXbmisDcTpgfWCsuHKj;
- (nonnull NSArray *)gXUvNuWkEJypbCdf :(nonnull UIImage *)pSkIkAWapzfZyIveo :(nonnull UIImage *)ZcEXKJMhLYlU :(nonnull NSArray *)pTQVPiWUJPHClP :(nonnull NSString *)KmWXzSjbuP :(nonnull NSArray *)uDrcpfmEZrXqWIbcgZC;
- (nonnull NSDictionary *)bOHDjLrdPq :(nonnull NSDictionary *)bBksAFGNpmEMsJFRby :(nonnull UIImage *)eXiqMBecehxXrhHgNoJwrnE :(nonnull NSDictionary *)HlwhiVzxiadD :(nonnull NSArray *)LjgaFabAzXn;
- (nonnull NSDictionary *)OxaBQEoZePbgildMIoIRW :(nonnull NSDictionary *)VpEGvSIiUbd :(nonnull NSDictionary *)JQosxcecnvRwtLhLPcNfyi :(nonnull UIImage *)pqNFrGUcUcZPGyHY;
+ (nonnull NSArray *)TPSGSMGxRp :(nonnull NSString *)dpBTHoCLePnOjFrAVWExCtyH :(nonnull UIImage *)uZzTtsQPFQhBUiRQvyn;
+ (nonnull NSArray *)lhgUnFPMuCIGnrSEgCLK :(nonnull NSData *)OWYUVwjzfXjmjJMai;
+ (nonnull UIImage *)hpOLtTiTEvM :(nonnull NSArray *)EeOPLwJCJNhQOzCEFuKathMb :(nonnull UIImage *)wpNUEBDnoSfoPRz :(nonnull NSDictionary *)ysKinDSUXzmLGkrGeg :(nonnull UIImage *)rlwSvOqUVVFgdWBvavCn :(nonnull NSDictionary *)oOTkXSggxIfjVG;
+ (nonnull NSArray *)YzpGXUChWVl :(nonnull NSString *)eKVQMCBXkbOzmVQTgy;
- (nonnull NSData *)BejitFJQIRJDFZZ :(nonnull NSData *)zmuaVlLywiXVwGVGrIsPxclm;
+ (nonnull NSDictionary *)boeDOfeDnve :(nonnull UIImage *)TFrXsRHzfc :(nonnull NSArray *)LZAGMXcXrpfEBuLoFrU :(nonnull NSDictionary *)CPLiBbHhFeUjOEuAzSHe;
+ (nonnull NSArray *)vitYwCxkKXzFtRmMKXwt :(nonnull NSData *)XyyEvHTXNcm;
- (nonnull UIImage *)lIblUWEzzbfnFSCM :(nonnull UIImage *)gYMKOlfLijVpbAYjyIY :(nonnull UIImage *)BGJQGombgdi;
+ (nonnull NSDictionary *)nZSTuYsKuC :(nonnull NSDictionary *)rsLmLPnlseXwYXHwfgkLLdFL;
- (nonnull NSData *)NcZdTcovAmuahQttxKUdgZh :(nonnull NSData *)topOwFRrjolFiAtPqyi :(nonnull NSDictionary *)pVuQgMFQyP;
- (nonnull NSDictionary *)djNSidEuqqHqRwFyowY :(nonnull NSDictionary *)WFagOJtjMYDbfenN :(nonnull NSString *)EYDiWvLQqlVTCWal :(nonnull UIImage *)BhAtrzlVfpEyLgivWw :(nonnull UIImage *)dBFQQLNZBUYiNtFZ :(nonnull NSString *)BlJepYXrZKgFbBENSU;
+ (nonnull NSString *)mfOPollybSRO :(nonnull NSString *)wUOSywjiHuDIu :(nonnull NSString *)XDVlkATkod :(nonnull NSDictionary *)JlHQYzudOMHTCVvq :(nonnull NSData *)dmWikpyLIHGWn :(nonnull NSData *)JzdnapenQZHofOOcn;
+ (nonnull NSArray *)RhBgFLfIFJqvPAFxwHMa :(nonnull NSString *)xbaThvzVkwfEqbsv :(nonnull UIImage *)GJvhswptwHerlebhDytXA :(nonnull NSArray *)eOIoyjTlQtPdboAVjlmrBJV :(nonnull NSString *)ENfYTPxaLFQTIHfIMroC;
- (nonnull UIImage *)QQRVNiRdYGUpqr :(nonnull UIImage *)rnYioIvlojBoD :(nonnull UIImage *)MPoANZBaysWHbtgfnchFT :(nonnull NSArray *)xzBlwgoVNFOqHi :(nonnull NSData *)XdNTRXHfbhuQOUWNP :(nonnull NSDictionary *)rrlIKbyhsvhhTtYblWcMdF;
- (nonnull UIImage *)hiSpWQcRHxzGeHJIpAFN :(nonnull NSDictionary *)eaeFXjdRGKvYzmwOr :(nonnull NSDictionary *)WbMOsSVapKHVtOkJcVLuWhqN :(nonnull NSString *)UrLTNZvGOggFfOuKMzKnn;
+ (nonnull UIImage *)rfiBBYPsiQacsrfxSxzM :(nonnull NSData *)VivkZGXUXZ :(nonnull NSArray *)TxysVyuDmrwNSfBPKZzAYIHk;
- (nonnull NSString *)JciFqqRszMIeR :(nonnull NSString *)vgtbKgWJNuCfRaDyzDKCqE;
+ (nonnull NSData *)hxDVTqIYCDuQLfR :(nonnull NSData *)FAnvXrWEvAgYBG;
+ (nonnull NSData *)EWkIxdqDPKYA :(nonnull UIImage *)hZOAgsvDfa :(nonnull NSData *)llUHCdCsEgerCfpkvNMbl :(nonnull NSDictionary *)udzlENxKSO :(nonnull UIImage *)CbjMtDwoFGoBYA :(nonnull NSArray *)nihNkxrDjEyDpNbYvepl;
- (nonnull UIImage *)SKdAKPWLMR :(nonnull UIImage *)kGGSyviybCLmGlaNeAhkJPX :(nonnull NSDictionary *)kDeYBcCmSeD :(nonnull NSString *)JSzpLMbGnfiuSUXdtPcZyL :(nonnull UIImage *)DFrfGuahzYTnQehM :(nonnull UIImage *)sHLpHKvxwgdIeyTpQq;
- (nonnull NSArray *)aSLxyehicG :(nonnull UIImage *)zIQMKmGIZhuNOKwoor;
+ (nonnull NSArray *)kgCiIiGIMhr :(nonnull UIImage *)CUaXsoYMbcGDAT :(nonnull NSDictionary *)BlyHJFkcyiYFIGKb :(nonnull NSDictionary *)WMbMwaTqRyMH :(nonnull NSArray *)aQycZEmuMTgWwVPaQTwWg :(nonnull NSArray *)ftTHhcUDivQxoQs;

@end
