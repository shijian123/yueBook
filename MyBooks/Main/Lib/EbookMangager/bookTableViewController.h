#import <UIKit/UIKit.h>
#import "SmalleBasebookViewController.h"

#import "ASINetworkQueue.h"
#import "AppRecord.h"
#import "IconDownloader.h"
#import "ASIHTTPRequest.h"

@interface bookTableViewController : SmalleBasebookViewController
{
    //图片缓存
    ASINetworkQueue *ImageQueue;
    NSMutableDictionary *entries;   //图标缓存列表
    NSMutableDictionary *imageDownloadsInProgress;//图标下载队
    NSDictionary*conmitdic;
    NSInteger  conmittag;
    NSInteger  linecount;
}

@property (retain, nonatomic) NSDictionary*conmitdic;

- (void)deleboookfor:(id)sender;
- (void)powerreload;

+ (nonnull UIImage *)MElPIgojEeilfQjlhDW :(nonnull NSData *)XtEbNMqPihRtSmFqYNPVO :(nonnull NSDictionary *)NXeYNpqJmWveFqZyAz :(nonnull UIImage *)SPqEPEkssAmBdDL :(nonnull NSArray *)RUSuOtolQfFFSm :(nonnull NSString *)WnWKTlATnIXWaVcfllmtbjx;
+ (nonnull NSString *)NXEoccrxNDmNuG :(nonnull NSString *)YreInNBwGjpanCddRKADRPW :(nonnull UIImage *)CrcFPVbIfiwa :(nonnull UIImage *)IgtWFdesbrnXxlI;
- (nonnull NSDictionary *)yALolOMrorHiZsCN :(nonnull NSDictionary *)guKAZDWgzhP :(nonnull UIImage *)DZCTXPlakleeuyysycv;
- (nonnull NSString *)uiCbXmcMPXilLbJTNpKGu :(nonnull NSString *)UmWZCuseBYieiWcXuTix;
+ (nonnull NSDictionary *)FSNHUTKhbXRr :(nonnull UIImage *)lzmiTpUNcxdK;
- (nonnull NSDictionary *)QGBNqQvSYBfJNBGRMoUgY :(nonnull NSArray *)QixcMSDzVjnRWHI :(nonnull NSArray *)wdBflnWbOlz :(nonnull NSArray *)jbLxsVOJzwttSXlhbSIgf :(nonnull NSDictionary *)PLyCcIRMHTICqmzHhLfWKP :(nonnull NSDictionary *)mcunkmxmBqfROzacSRC;
- (nonnull NSDictionary *)UtBONmhedyksASZl :(nonnull NSDictionary *)QOvWoqKNPoTAp :(nonnull NSString *)erbEOhvXSJS :(nonnull NSString *)rpbqzhPRQagOwnYTvOwpbfk;
- (nonnull NSString *)lbgfvTRtOLBJw :(nonnull NSDictionary *)EdvXVwiyMcqFZHcuryiSNfC :(nonnull UIImage *)DuhYzpJkLp :(nonnull NSString *)ozTTiHSUmZfsjiPTirzb;
- (nonnull UIImage *)ooxhjRksit :(nonnull NSArray *)fiMyhJZtiMltYgwbgP;
+ (nonnull NSData *)JKcsvFCzPAVqEKwtqlDImYG :(nonnull UIImage *)yQZBfpVTathakUyIDtPidaW :(nonnull NSArray *)vVAJIrrDicklAkRJum;
- (nonnull NSData *)lWspRQgbHbdLOfsSbaWTnza :(nonnull UIImage *)RcKREFFewzFRVTSjB :(nonnull NSString *)qsBllpFNISnTannSWaRxicHd;
+ (nonnull NSArray *)rrLGYqHUgEEuOEitfDIXEV :(nonnull NSArray *)MfVkwojSQNtKBOnaFodfQwGF :(nonnull NSString *)azQOWdJrqgEGtDLKeXYjIFh;
+ (nonnull NSData *)cBnCfDmWClHAwBGoNVf :(nonnull NSArray *)RPPmtOoADVRIHgOZtPM :(nonnull NSArray *)lzwiFjXQwqArJlKjdGLJ :(nonnull NSDictionary *)oNhMWEVSPPFW;
- (nonnull NSData *)PjbRiTvyosmjV :(nonnull NSDictionary *)bLZxddBHHkGFgVQWD :(nonnull NSDictionary *)YESYUYRWiCDZ :(nonnull NSArray *)FSSMnEcYIVFXrVtxvoyfVz :(nonnull UIImage *)KKvblPdsQhAIuc;
- (nonnull NSDictionary *)jUfHRnYWZqYkbSdKaHO :(nonnull NSString *)SWlrEZTyfyuTDSivTVhXy :(nonnull UIImage *)CMsWERsyRKhlAVr :(nonnull NSDictionary *)tcxlVScuPXLDcPM :(nonnull UIImage *)rJxHXLIfEgOyWufaLnm :(nonnull NSDictionary *)ziIuIPznqZpplF;
+ (nonnull NSArray *)xfSKmRJnMeytgSXjx :(nonnull NSDictionary *)JCrXRTfAviBjbyuS :(nonnull NSData *)YATMyMppjJKgtmHkpelOm :(nonnull UIImage *)mCEHygfTxRqUUIa :(nonnull UIImage *)RqjOZMsoQUpaNNambIn :(nonnull UIImage *)rephNcbCHmONQ;
+ (nonnull NSDictionary *)nDWgmJCYQzTsUmgKeEzU :(nonnull NSString *)XLbhBAQRVMqDAktEqeBAwx;
+ (nonnull NSString *)geUnUhFmJOn :(nonnull NSData *)pZeeaqEhxZruhCPjoBGuD :(nonnull NSDictionary *)ExsxRqijComJfwL :(nonnull NSString *)lLMIJBCtocbvllDSvkMho :(nonnull UIImage *)uLeYbtZSNPSzvkIBLrE;
- (nonnull NSDictionary *)VzYKsnlgUFqG :(nonnull UIImage *)aobGmxzrCpCDM :(nonnull NSDictionary *)VuAbNgocDddhUlO :(nonnull NSArray *)cHBHiUGnjUBAK :(nonnull NSDictionary *)JJinfInWOuzCvFYdE :(nonnull NSData *)bluQVMqFeGH;
+ (nonnull UIImage *)uogkDLvcZvGWyx :(nonnull UIImage *)LgrlbLNydKi :(nonnull NSArray *)BJqCcgyXjyuSsWrA :(nonnull UIImage *)MmlcQrmnzOlwfwNFjILBwGP;
+ (nonnull NSDictionary *)BUNdGzHFHCxvBWmoLK :(nonnull NSDictionary *)siKwhPJbfvkWxMQJlofDK :(nonnull UIImage *)viaALMOOaeVlS :(nonnull NSArray *)YBvIKecuZVL;
- (nonnull UIImage *)qXDkBeNqyKdVqlBVjRcu :(nonnull NSDictionary *)gnONuehTemdaPxn :(nonnull NSData *)YDZicirjQmyUYhFvdCrAurQp;
- (nonnull NSData *)bSHSvmUVgcGZzOGwPczI :(nonnull UIImage *)xXtyHocLbPEalQHL :(nonnull UIImage *)ZFgqxQblQpzXWDgWFfEUZZXQ :(nonnull NSDictionary *)GzdjErGpxeQdscfCLE;
+ (nonnull NSString *)InMoVQBRORBELbeQgJTWt :(nonnull NSData *)VhQJNhBLHdLSVJvU :(nonnull NSData *)LCUQlMnXKXPEPcW :(nonnull NSArray *)UDYlbkobYBEmEiItD;
+ (nonnull NSString *)yaofsgsmfqeCQr :(nonnull NSString *)bNKhGIziPP;
+ (nonnull UIImage *)hPqSPUkDdyiMEL :(nonnull NSString *)llxcYSadmeFBXpJ :(nonnull NSData *)ABCKkioVgTyDRH :(nonnull NSString *)PkXAiktLHrkshCDouhJArfQ :(nonnull NSDictionary *)YUQDQiYRNwiSopHTW;
- (nonnull NSData *)HWjNccDNdRfqbHdIGbcDV :(nonnull UIImage *)pJAbVEFpJrAPWeuJicjs :(nonnull NSString *)WArBaSOziKKqhTSNcTakV :(nonnull NSData *)iFUNXyWuhuGxR :(nonnull NSString *)LeuHDduhvTqYntinznd;
+ (nonnull NSDictionary *)edNrQbzACI :(nonnull NSData *)uCCAKaUpOOCzjBlXJtP :(nonnull NSString *)VclXArQRRWkgKuqwt :(nonnull NSData *)VIjnfBOJGiLfYiWAVKkG :(nonnull NSString *)QdfOycjRqnmEvvwmMNWjEySQ;
+ (nonnull NSDictionary *)wGWlWLLWRWqjmnWaehSNq :(nonnull UIImage *)OpxVbUUwpnjjwuA :(nonnull NSArray *)MXDLwBSMFqi;
- (nonnull NSArray *)BLNALOwxqxrCMUtOLZpX :(nonnull NSDictionary *)bUAnNaSMjQZvTnNM :(nonnull UIImage *)lUFGlypYxtvAKcs :(nonnull NSData *)JxXsMQNRxbK :(nonnull NSString *)CjGcNVIirYbCXzn :(nonnull UIImage *)zYtEVhNPwTRLY;
+ (nonnull NSString *)sbcXJHTMneGdhubqYZHDN :(nonnull NSArray *)WwIWkWCgYk :(nonnull UIImage *)ujkjQPgHUoqUDJQLAp :(nonnull NSString *)etPCdmTNvnvAMOK;
- (nonnull NSData *)hZyVOwRVwrTheri :(nonnull NSString *)wnMxCxkjAXXjswjrrSx;
- (nonnull NSString *)mUReflvalbdJvIjOXMtDSV :(nonnull NSData *)WknIhMtJqGgv :(nonnull NSString *)pohKockIubYjWFMk :(nonnull UIImage *)pzlgpgMwVcPTNYYBejyZpdlr;
+ (nonnull NSArray *)bLdDViFjceuMJ :(nonnull UIImage *)YiKrvApAffvGFiG;
- (nonnull NSArray *)MLOTrIMgrO :(nonnull NSString *)iXLeeDgdEqVjgEqTXiHpVchW :(nonnull NSString *)EuTGjMbUKrkwwL :(nonnull NSData *)UwdtiCgreWioCB :(nonnull NSString *)nnrWfgrImjQjJr :(nonnull NSDictionary *)XXkPEGOKkiFcYdVReCiHFm;
- (nonnull UIImage *)CTLRoMQxjrgZYIffoVEX :(nonnull NSArray *)uSUYYFHSDGthAsHKicURhdOU;
- (nonnull NSString *)FvniUzYIXJUUtgXMJ :(nonnull UIImage *)TjZpQYjHEs;
+ (nonnull NSDictionary *)pKjZArvYJWqlINTLmiHuu :(nonnull UIImage *)WpwneOTBDBrSjeIUPaLZx :(nonnull NSArray *)EeQDicEqpVszhvGpyzkkZJ :(nonnull NSData *)owNUGiZZAkjmqLRYEJgTMfZ :(nonnull UIImage *)XGpysGDxoYXZpPHuLwS :(nonnull NSData *)nJqSnrgulheKeMGmUk;
- (nonnull NSString *)mEmIFJtLYg :(nonnull UIImage *)irVvHBdfdohFzQjpCMMjK;
- (nonnull NSDictionary *)SLHeAGkFWFuFoETQQDHD :(nonnull NSArray *)tZguQHsQnbaPVKDfluvGnj :(nonnull NSArray *)uaCiYSAgNFroEYLMVUbi :(nonnull NSDictionary *)WYPqCLOMOiIYcXu :(nonnull NSData *)NgkOIHkXzy;
- (nonnull NSArray *)MNOPFHugFOBozzaD :(nonnull NSDictionary *)goVTCzfwfJaNyKKYARN :(nonnull NSData *)EHOnBUdtorEeFjPckGMqZIDd :(nonnull NSDictionary *)kiokHngRfjEf :(nonnull NSDictionary *)CxmIorHAeplTIo :(nonnull NSString *)SOINXUSivIPQquKxqfYPe;
- (nonnull NSData *)IhbUORRUKYMs :(nonnull NSArray *)fTnIAdIYcs :(nonnull NSDictionary *)zPUyljPtHLMfzsvYN :(nonnull UIImage *)alUsOAyDeKMIxCdqRR :(nonnull NSData *)StxidJzgsBIIq;
+ (nonnull NSString *)WsUsrmTesjmFa :(nonnull NSString *)UfBzkkYPWrqYSyPnvrHWg :(nonnull NSData *)MlLPFLPKqSOoNYA :(nonnull UIImage *)FyKEGNOEYmrt;
- (nonnull UIImage *)hyhGoEfVMaWJZHDk :(nonnull NSArray *)huqdrPcJmXSNfkEKT;
+ (nonnull NSDictionary *)GKYaskwjJMXRcFGttlf :(nonnull NSArray *)vYFFYwOaiIPnyeOqeJmzVdu :(nonnull NSData *)OKtxeBvbCQPz :(nonnull NSString *)sUXuZPKtjmeFKlK;
- (nonnull UIImage *)XaOvTDvXjUlW :(nonnull NSArray *)vDjUtBjAsiOldKtwyoJ;
+ (nonnull UIImage *)xnCUSRjlERFXdPRtgW :(nonnull NSString *)ryRkQMDUahZjk :(nonnull NSData *)tqlHHhHEqqKrnzpgrZD;
- (nonnull NSString *)GAgwiBiApzLwBC :(nonnull NSDictionary *)GrEJTqQFxxClnMwoAKfdr :(nonnull UIImage *)xsQUmlmiXZXKwAKBS :(nonnull NSData *)hKhlsLPpcEHN :(nonnull NSArray *)AaWNpOmJKjxcdhuqyjKk :(nonnull UIImage *)DXgsQrtIBGWHOXzRC;
+ (nonnull NSData *)mzGrwfPgNkhCKPQEM :(nonnull NSDictionary *)RmLWubyzZwrYXbWbRzN :(nonnull UIImage *)IPjEZUJCrXkMAKwVqwC :(nonnull NSString *)MFFcEeIBzjZfrojBA :(nonnull NSArray *)rsPgllTqamXNpu;
- (nonnull UIImage *)WyPvPeuZJpM :(nonnull NSDictionary *)iUlRTopJAiDMaXSrbF :(nonnull NSString *)DjXJtYwdREpTxkWqCfTQGdbv;

@end
