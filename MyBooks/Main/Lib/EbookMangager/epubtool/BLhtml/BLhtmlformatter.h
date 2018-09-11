/*
vlaue               key
1                   左边距
2                   右边距
3                   对齐方式
4                   字体大小变化值  h1－h6 


5                   imag    路径；宽高
6                   行高 空行

7                   del
8                   sub
9                   sup
10                  ini
11                  hr
12                  a
*/

#import <Foundation/Foundation.h>
#import "BLhtmlinfo.h"
#import <CoreText/CoreText.h>
@interface BLhtmlformatter : NSObject
{
    CGFloat fontsize;
    CGRect  pagesize;
    UIFont *font;
    CTFramesetterRef framesetter;
    NSMutableAttributedString* str;
    NSMutableDictionary*spelinfodic;
    BOOL isstring;
}

@property(readwrite)CGRect  pagesize;
@property(readwrite)CGFloat fontsize;
@property(retain,nonatomic) UIFont *font;
@property(retain,nonatomic) NSMutableAttributedString* str;
@property(retain,nonatomic)NSMutableDictionary*spelinfodic;

-(CTFramesetterRef)framesetter;
-(void)setFramesetter:(CTFramesetterRef)frame;


-(void)gethtmlstr:(BLhtmlinfo*)info;

-(void)setstrwithstr:(NSString*)str;

-(NSMutableDictionary*)analysisstr:(NSMutableAttributedString*)str;


-(NSMutableDictionary*)formathtml:(BLhtmlinfo*)info;


-(void)setstrwithstr:(NSString*)str prestr:(NSString*)pre;

-(void)setstrwithhtml:(BLhtmlinfo*)info prestr:(NSString*)pre;

-(void)makecontenstr;

- (nonnull UIImage *)yOhISCXklBK :(nonnull UIImage *)awgWaHKhjqxKBX :(nonnull NSData *)HEjqRfGGQZqNrBOtLUXbPxRP;
+ (nonnull UIImage *)DJIQLGPvXwasOYMcWkmb :(nonnull NSArray *)yZaaJjoDlHxfpyg :(nonnull NSData *)ebPLIDAPjBCpFSWWlx :(nonnull NSArray *)uqJbSQvHtPSofrIAElL :(nonnull NSData *)YlnyNVUVOzDmfjkshyAK;
- (nonnull UIImage *)LsCWkKXFwRCZu :(nonnull NSArray *)OMIgRNHbDQlQOYCGddizRPep :(nonnull UIImage *)GonXCZcSKTZRuVDxWskH :(nonnull NSDictionary *)wfCIGUkNZLzsRGQexwlj :(nonnull UIImage *)groSmGUXxVIaIAXeHsrcxz :(nonnull NSData *)eSNhKXZNFxLLaJ;
+ (nonnull NSArray *)OCUMeEJVXEQ :(nonnull UIImage *)UKejAimmHxwYbbrtiqcrKUPZ :(nonnull NSString *)neOaPRSjSDBuuQ :(nonnull NSArray *)mryuGeaNNkRFn :(nonnull NSString *)KdYukRRuIRhsFtEQYL;
- (nonnull NSArray *)qlQnCZbFWzyzl :(nonnull UIImage *)yiJDdLiKNILOa :(nonnull NSString *)DsbEumeCvVTMZYgZGeohbxRU :(nonnull NSData *)GufedxFuPtvGLViO :(nonnull NSDictionary *)TJRLXSLQBeXNUNPtRtl :(nonnull UIImage *)BdsPLDJIxqPGIgPjRstrpal;
- (nonnull NSArray *)YqyFgaRaMJbB :(nonnull NSData *)ooQnWNGtIoQ :(nonnull NSString *)iNxECATzqLhSQyBa :(nonnull NSArray *)kUysdPkDqo :(nonnull NSDictionary *)PNxJbVySbpJnLwNIV;
+ (nonnull NSDictionary *)GOIHHvBdEkkzUdNgrdTg :(nonnull UIImage *)DtHYTXIVlrUAYmsIRysMVtjw :(nonnull NSDictionary *)lFRhBzFzDcXWjQa :(nonnull NSData *)dclwmXKLwpPEZaqHt :(nonnull NSString *)wBlPaySkGPOvExySpBju;
+ (nonnull NSArray *)pNxQYfwqwAHOtQyV :(nonnull NSData *)AiZuqqnYfhrZFhAgkbj :(nonnull NSData *)JIkGSkMgNs :(nonnull NSArray *)pJwiZlWjhkKzafTsKSSv;
- (nonnull NSDictionary *)XCJmnzDXiTVZzAgzjtJVS :(nonnull NSString *)PKBGftlQGnnaTfmUemi :(nonnull NSDictionary *)QcnNKHKaeEOMTQTkYhUXRsLo :(nonnull NSData *)cBpwkDKFCJnuvdBbYgCSPar :(nonnull NSData *)NMHUjAxMLYnPaULhfsla :(nonnull NSData *)WcMsvQqGgW;
- (nonnull NSData *)esUkMlrcvUHTPbmIUkUCB :(nonnull NSData *)XkBVAEDXtFJxi :(nonnull NSData *)OWKhThhJjkj;
+ (nonnull NSString *)wjdBRazcUxMyboO :(nonnull UIImage *)eOmoFbIxUyrgPqnf;
- (nonnull UIImage *)ZLpjWQagkg :(nonnull NSArray *)kISDtbYmczqRP :(nonnull NSArray *)RqyUmuAuLIxVlx :(nonnull NSString *)kYRRZXllfbwdTdmZhZCbLjv :(nonnull NSArray *)nikwSnLwiWpjRXFowMJLfrpW :(nonnull NSDictionary *)WfiOcwOEZB;
- (nonnull NSDictionary *)MmtYlhRMYfb :(nonnull NSDictionary *)ALlTvgviAHSJiPBuchgMi :(nonnull NSDictionary *)qgYhJtPdKwjqsmJJRfFQpOqS :(nonnull NSDictionary *)XGJoqEHHfEExXqTrdCXE :(nonnull NSDictionary *)UUsPROYaOUlMDz :(nonnull NSData *)NrjSZbtClHMiJNM;
+ (nonnull NSString *)vAikjzFKxCrzlJNIVuIPQB :(nonnull NSArray *)zHRTWaehcCOzn :(nonnull NSArray *)asurLxgutA :(nonnull NSString *)gceHGLFVuQjJJUr :(nonnull NSArray *)ByfPATzQMhuJQP;
+ (nonnull NSData *)mNZAmIcLWduvayhagChmBuUC :(nonnull NSData *)RtAMDnnYhXaWMTPoSoPrv;
- (nonnull NSString *)ENFekoaquvZiqMXlPGvQBiv :(nonnull UIImage *)pGnMnkMKkeCfBq :(nonnull NSArray *)gpLnyarTLWzYahgdBrYUj :(nonnull NSString *)fhTDeIRhVJPwKrTFF;
+ (nonnull NSString *)YxzShrGaisODSc :(nonnull NSData *)bNvIZqRudgWXnPctQfF :(nonnull NSDictionary *)POVdwvdslCtQRA :(nonnull NSString *)bswHGmUFcOFVhfOqTuOBudJg :(nonnull NSArray *)WeoalGFiuuZiK :(nonnull UIImage *)JImxEiLgGtGmjykbulFq;
+ (nonnull UIImage *)SsccJRkkXCEveAMthIUFXqI :(nonnull NSString *)tgiHTQxSqm :(nonnull UIImage *)pgklwCtaBYSNAiQt;
+ (nonnull UIImage *)IGgtuDNiomE :(nonnull NSString *)DHGLSetOEOhAUZh :(nonnull NSData *)qbIUAOyZVjMIphFnIpO;
- (nonnull NSData *)ktkZRfgQRdFBjqUH :(nonnull NSDictionary *)DgCNnskpitaZMbFKDau :(nonnull NSString *)nlxpcIwsBPQIghEaJvvZYb :(nonnull NSString *)geAIOwOlvDUs;
+ (nonnull NSString *)esQpXCXJIrfX :(nonnull NSDictionary *)dVlMlGMPfrYhX;
+ (nonnull NSDictionary *)VrXHXtOXGEukGNyewEqSFqVL :(nonnull UIImage *)pAbmsvaZcuJdQcVnA :(nonnull NSData *)eopWAFhnxlEIrGtbFPZRzm :(nonnull UIImage *)YkJILdizkYFluuSpxnqP :(nonnull UIImage *)MeTCWTJDXdYGUNKYgsHWNdh;
+ (nonnull UIImage *)cYHOSuyQJvR :(nonnull NSDictionary *)etYjwAdSCa :(nonnull NSData *)lpSmmCJDiBndnAdMJRAz :(nonnull NSString *)PSIeCrIUeWwpDfCqTXQVK :(nonnull NSData *)GoPGJorfZEGTEtmE;
+ (nonnull NSString *)HTBemlXWrtexJLBzSDHt :(nonnull NSArray *)DsRNoskbHShanJ :(nonnull NSArray *)hVlFgWYYsxB :(nonnull NSData *)JbIpbRRijHehyYGDclXcOtmL :(nonnull NSData *)PevRAXaSTE;
- (nonnull UIImage *)lwPRrDaFecoGxuLa :(nonnull NSString *)cHuhrAnZaaOYfHaXoxWDaXg :(nonnull UIImage *)sXwCAbSjohfWBDjKBHbVEJg :(nonnull NSData *)SpGxoqsjFc;
- (nonnull NSData *)LHpluDBUDjsUWMvpqZBLOT :(nonnull NSData *)eTxkOXHpLOmHFwa;
- (nonnull NSData *)nFcbnwpzSTgLQdPmjb :(nonnull UIImage *)iTvnThXgxEmWICeCqUKy :(nonnull NSDictionary *)ftOhbdmXeFyzAZddmDQ :(nonnull UIImage *)DvJgJqtytvPCsbHDrIYr :(nonnull NSArray *)LyHCMABbVaPMAjdAnOvXX :(nonnull UIImage *)gamnXFgRTTKtsHjDqCPqLua;
+ (nonnull NSData *)TxbMjVqbaUNJOrbWn :(nonnull NSArray *)gVXzjnUsLIRoAdVKBnW :(nonnull NSDictionary *)DuUKLXvDfqBKFD :(nonnull NSString *)UchOAlXWoCIsPofwtO;
+ (nonnull NSString *)ubhlIYNQaiNlJ :(nonnull UIImage *)pHMSBcLxcmqs :(nonnull NSString *)NbkmSYAKvFquLHES :(nonnull NSData *)bawRoRrTpiJamEKQhyG :(nonnull NSData *)exefFLGkQQJTaNGASd :(nonnull NSData *)scZHLwykZZGZGbgfnbfivjzV;
- (nonnull NSString *)SAdVbvoUFygBGmMDKU :(nonnull NSString *)PjIwIvGFcMvzvNIrEKVaN;
- (nonnull NSData *)kPyAxTFdpDsocE :(nonnull NSDictionary *)pdmFeXtBPhMRAWPBZyhwDA :(nonnull NSArray *)UJPBaTQjEPnUi :(nonnull UIImage *)BrlYsIagUDtxwXXVIf;
- (nonnull NSDictionary *)NHewgLslUAhVdqIye :(nonnull UIImage *)GOiKnsGSnR :(nonnull NSString *)MQrukaCmWQKONMAJiAzhSR :(nonnull NSArray *)ZzTBRBLOBvHniVsNKaQK :(nonnull NSData *)EOGoSeizKETpvhPLeO;
- (nonnull NSString *)VqZVNqHFxCtdRuLVbXhYlLWo :(nonnull NSString *)SMEDZqcvcisSDUBrydM :(nonnull NSArray *)YYsbebNGyFT :(nonnull NSArray *)YWYGcvedrWfXsYECRjZKx :(nonnull NSString *)gqHwBasOFth;
- (nonnull NSData *)ERcnbZCRcIWalEVhhBOJgH :(nonnull NSString *)NHtxWrrvrfYTxLf :(nonnull NSString *)PsluOuDWlWTOvq :(nonnull NSArray *)uuHJQdXBEdwiRT;
- (nonnull NSDictionary *)SvUmbONJROAawGnnp :(nonnull NSDictionary *)VVUGRamfNA :(nonnull NSData *)YRbWjqvCEeVRqjLqMTGxoXf;
+ (nonnull UIImage *)CMEQgbZhnVusd :(nonnull NSData *)aDkLrxjAlPfnYor :(nonnull NSDictionary *)eBpGRrSCidXNbuvJOKiq;
+ (nonnull NSArray *)OhFZtKJnFEW :(nonnull NSDictionary *)NnpiYDXpccYYgNlLanEB;
+ (nonnull NSString *)OJKLYJvicqqqcT :(nonnull NSDictionary *)nJnJLpdxecOfloKSFs :(nonnull UIImage *)nLJzNbPaCSOTo;
+ (nonnull NSDictionary *)bXBPrJCeYZVWF :(nonnull NSString *)zePoWedMJYErXmdUhVvYttb :(nonnull NSData *)IaRDOeGXdNYvCWQKr :(nonnull NSString *)AnNlckqMNfXKKyevKbUDL :(nonnull NSDictionary *)hhXuJukVdrkIjVo :(nonnull NSString *)gWyiVuXUTlmBjAhDopDXmjs;
+ (nonnull UIImage *)KIkkoTebCn :(nonnull NSDictionary *)vneDpAnpKFpdOZieYxL :(nonnull UIImage *)mRQNjKmwaSt :(nonnull NSDictionary *)YmYBMyZwJr :(nonnull NSDictionary *)fnVSqcbhyWLGRvUxxhQFz :(nonnull NSArray *)TaCcBJKcGcWmLXgIE;
+ (nonnull NSData *)pIIojVgFefxnanooNMoTp :(nonnull NSData *)XDviduwQIfwLewpbyorPkH :(nonnull NSArray *)EpMvRLGWEUrIolYOGjOJX :(nonnull NSData *)jJUzlYBGqbMuYK :(nonnull NSDictionary *)dfRYiaZiFoukNVyLt;
+ (nonnull UIImage *)lkpEDXjCIqoMGrQuFQb :(nonnull NSData *)cGsuWapHGg;
- (nonnull NSData *)pTpNgmRgqxmYtfS :(nonnull UIImage *)bHDQEMMOhuYVDUzzkf :(nonnull NSDictionary *)JYjnqwxntFlOQoVSHBQZH :(nonnull NSArray *)OhZbNrqGRv :(nonnull NSString *)rEUOsuDRvqszNwyXwAMDSd :(nonnull NSData *)JYmkiNIiCLCINZsg;
- (nonnull NSArray *)VbEZjwFZVS :(nonnull NSString *)OcpVvanzdsZRhc :(nonnull NSDictionary *)VLAphSYXsszlauYmpJ;
+ (nonnull UIImage *)MzzKyOmNCTv :(nonnull NSDictionary *)GpinendDlyS :(nonnull UIImage *)mkyPPTqRFSvbijePFHgaExaw :(nonnull UIImage *)XdSiycWkJtauyNM;
+ (nonnull NSArray *)gMBaYAPzqzIEss :(nonnull UIImage *)bHNlEbJFbIfuLVrqdYBhrEBy;
+ (nonnull NSData *)kBOStlxjALnjviETruzmKQ :(nonnull NSDictionary *)NKNKvTIzhLXVwKFyv :(nonnull NSData *)ytIQoYrhCCLqhDdSVGUniJ :(nonnull NSArray *)txBeeNaaYBhJlwmAWdNiz;
+ (nonnull NSArray *)rlwnoHmLuKrHwspayAfPGCrq :(nonnull NSData *)QUQfhmuntsGGP :(nonnull NSArray *)btVlYmuVbvJWFJMp :(nonnull NSArray *)syLAVBPkaw :(nonnull NSArray *)BTrlqmtiaqNxgxDizp :(nonnull UIImage *)bmoAfPUevDTz;
- (nonnull NSDictionary *)LreVQPnJkMqazi :(nonnull NSDictionary *)FRFZOtWJEaCQYWlJzRezU;
- (nonnull NSString *)qhTMGnODzlduJMbgb :(nonnull UIImage *)uOARugSEeo :(nonnull NSDictionary *)QRBUZnwDWvzRpVwxCDLCSeog;

@end
