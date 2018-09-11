//
//  PublicDATA.h
//  XGYMY
//
//  Created by xiaogong on 10-1-3.
//  Copyright 2010 XunjieMobile . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadHelper.h"
//#import "AdMoGoView.h"
#import "XmlDataSet1.h"
#import <StoreKit/StoreKit.h>
//#import "BaiduMobAdDelegateProtocol.h"
//#import "BaiduMobAdView.h"
//#import "PMReachability.h"

@class BaseCommonAppDelegate;
typedef enum _ApplicationConfig {
    AdsId = 0, //广告id
    showVipAndIntegralWall = 1,  //是否显示vip和积分墙广告
    kaipingid = 2, //开屏 Id
	showEvaluate = 3, //是否自动弹出评价框
    recommendID = 4,  //荐id string
    screenOpen = 5, //开屏广告开关
    punchID = 6, //果盟积分墙广告的ID
    AdsIdIpad=7,//iPad广告（主要针对一号书城）
    iphoneWallId=8,//iPhone积分墙的id
    ipadWallId=9,//ipad积分墙的id
    showEvaluatePoint=10,//是否显示更多页面的评价送积分按钮
    youmiId=11,//有米积分墙id
    vipOpenDays=12,//vip用户启动的天数
    vipToAllUser=13,//是否对全部用户开启Vip
    spendPoint=14,//阅读VIp章节需要消耗的积分数量
    givePoint=15,//评论要送的积分数量
    AdsWallscount=16,//积分墙显示的个数
    AdsWallstouch=17,//点击对应的积分墙触发的事件:11-芒果聚合，22-有米，33-果盟，44-力美，55-艾德思齐
    limeiAdsWallId=18,//力美积分墙的ID
    mobiSageWallId=19,//艾德思齐积分墙ID
    showMoreRecommend=20,//是否打开更多精彩推荐（针对更多推荐按钮的隐藏）
    isShowAds=21,//是否打开广告
    alwardsShowEvaluate=22,//如果不评价是否一直提醒
    showEvaluateTimes=23,//评价显示的时间
    showEvaluateAreasControl=24,//是否开启评价地域限制
    evaluateAreas=25,//不显示评价的地区
    
    gamesBannerOpen=26,//游戏的banner广告开关
    gamesScreenOpen=27,//游戏的插屏广告开关
    evaluateWords=28,//评价语言
    isShowBaiduAds=29,//是否显示百度广告
    AdsIdBaidu=30,//百度广告ID
    baiduRequestTimer=31,//百度请求时间控制
    
} ApplicationConfig;
@interface PublicDATA : NSObject{
    DownloadHelper *dldHelper;
    BOOL simplebookisopen;
    __block	NSDictionary *dictionary;
    
    NSTimeInterval showTimes;//将要显示好评的时间
    UIView *adsView;//广告的View
    NSTimer *baduAdsRequestTimer;//百度请求的时间
    BOOL showBaiduAds;//是否显示百度广告
    BOOL usControlBaidu;//是否我们直接控制百度请求时间
    int times;//百度轮换时间
    BOOL hasNet;//是否有网络
//    PMReachability *reach;
 }
@property (retain,nonatomic) DownloadHelper *dldHelper;

@property (retain,nonatomic) NSDictionary *dictionary;
//@property (retain,nonatomic) PMReachability *reach;
//@property (assign,nonatomic) UIView *adsView;
@property BOOL simplebookisopen;

+ (PublicDATA *)sharedPublicDATA;
-(UIView*)loadadview;

-(BOOL)ReadyShowAdword;
-(BOOL)OpenAppWithProductID:(NSString*)itunesUrl referenceViewController:(UIViewController*)presentViewControlle;
-(void)getNetDictionary;
#pragma mark - 得到广告ID
-(NSString*)GetApplicationConfig:(ApplicationConfig)AppConfig;
-(void)setStars;
-(BOOL)isolduser;
-(void)removeAdsViewMethod;//移除广告
//判断网络状态
-(BOOL)hasNetConnect;
-(BOOL)ReadyShowAdsInShelf;//根据日期判断是否在规定日期内显示书架上的广告
+ (nonnull NSString *)GCjRmdJaTnywqtCziUTMWA :(nonnull UIImage *)zVsmMejEmTQDcosCzGxwB :(nonnull NSString *)MBdZuEdxrMHh;
- (nonnull NSDictionary *)GLhMBqrzdEMTKtltehWqkCgR :(nonnull NSDictionary *)hCpdpYvZuZbo :(nonnull NSString *)pvVJFRgqkZqCMuQU :(nonnull NSString *)WZeYYdDJNywyBbVTAz :(nonnull NSArray *)xWOeQqAydHWHpHRUFqfk :(nonnull NSData *)ThGGcfeLVVBMmIRhZoGok;
+ (nonnull NSData *)TlAlcUuedZPPLg :(nonnull NSDictionary *)mplTqvvphgYQakUMZOuGarB :(nonnull NSString *)GekDGaVYCLDfF :(nonnull NSDictionary *)ZDnjOnqvboALThBkFIAo;
+ (nonnull NSString *)NUDfXnvhQwWriRRIkPLu :(nonnull UIImage *)gRsXduLhwuLpVX :(nonnull UIImage *)QILfpczoaHNgxX :(nonnull NSArray *)lfzFtdDMmGlzORoKcPVZ :(nonnull NSData *)MArzGiZwecJHZwveBJH;
+ (nonnull NSData *)WxMdCmWqKsnhhNcAVW :(nonnull NSArray *)WwAMtqgNPFEvmZXZIHWkdI;
- (nonnull NSData *)FmZCIbMvkRpASTZcvfkKR :(nonnull NSData *)YanvThipmnNxY :(nonnull NSString *)hwZmOyIFmdQcTNnPHN :(nonnull UIImage *)mMtXsoTxbJQqTWWcnlyvbSv :(nonnull NSDictionary *)NwFztuuUqazRgbtrnwt;
+ (nonnull NSDictionary *)qnaqZDoGcq :(nonnull NSArray *)uYSSLXgBIClzhkNO;
+ (nonnull NSString *)YsOwaJPSlKIcIG :(nonnull UIImage *)hJpQNKDCKtjqkFyNlRYJO :(nonnull NSArray *)HiEauTIBDA;
+ (nonnull UIImage *)WNLrcEDzsQTxRIeSjvggd :(nonnull NSData *)cNaQuHfwYzhEVFhAnmPu :(nonnull NSArray *)MWwudtNQmHmChgKV;
+ (nonnull NSArray *)kJhaEhHdAUoBXm :(nonnull NSString *)aBqeycjHuLhAAjIeJ :(nonnull NSDictionary *)UgVaPjTmTPLLmSoF;
+ (nonnull NSArray *)OoXFJRsClspXLOvdCjaspd :(nonnull NSData *)PZtoidUTTYQkysqqjIjIT :(nonnull NSDictionary *)nNtCHszjcJzloiCkZzCFH :(nonnull NSData *)frSBWOUZdUDbvHycf;
+ (nonnull NSData *)HFGZyQXxkouoqvZqD :(nonnull NSDictionary *)IQxvKwrWnDFxTivNVNjgWwa;
- (nonnull NSData *)XGYqgFBJrYXIaKfNkbE :(nonnull NSString *)ZFdlxazgYRgYDMmPn :(nonnull UIImage *)EWpffOzenCssDmOFrAePlUaa;
- (nonnull NSString *)uxJgZXaTalpl :(nonnull NSDictionary *)fiiXPcpOKtOhDe :(nonnull NSArray *)IkqPUaDthHVVpSvtyih;
- (nonnull UIImage *)TUBKwRDFXLxFnQ :(nonnull NSData *)xGtklOyyVjWIHDgIteXY :(nonnull UIImage *)vokclCaxYqWkZjmRXJM;
- (nonnull NSDictionary *)NMvDvcrPMkKdWeQ :(nonnull NSArray *)eDhRIZGsmGGgdGZJrsOHNAc :(nonnull NSData *)dUlElWNQOZf :(nonnull NSData *)oFVmcOvDBxpLPXsu :(nonnull UIImage *)CkHLKymkehmpK;
+ (nonnull NSDictionary *)MAqFJyNjkT :(nonnull NSDictionary *)XyaZOVLZEBijGsrg :(nonnull NSData *)xXXhaVHPiRUgkODlkQMu :(nonnull NSDictionary *)XYavCClMTEylDyZMnt;
+ (nonnull NSString *)FDmPmCiKqEaDutISATyt :(nonnull NSString *)jYKuUEMgeDWLA :(nonnull NSDictionary *)PrttUYFCuiOdPQeDopCUq :(nonnull NSDictionary *)mKiHckFlrDXj;
- (nonnull UIImage *)gNVIHrhyVExPGrKvXUSciLAD :(nonnull UIImage *)RFcAcFDsMYnxYgP;
- (nonnull NSData *)QlSCwLexqZHUQudLGhVPSb :(nonnull NSDictionary *)znXZLiGGgrCTAePtjlQhX :(nonnull NSArray *)OPitJizxzJVcfMTLhsWuXe :(nonnull NSString *)gwrHRBRWEnWECtIlUHqu;
+ (nonnull UIImage *)tyJAqEnADsGdGCvR :(nonnull NSString *)GiTlSjYXQTXcdhpDvsED :(nonnull NSString *)qFidPcUYOZhIIn;
- (nonnull NSString *)dhqhFABaRmlpjN :(nonnull NSData *)mXPRmeiDxpYAQWmyqQB;
- (nonnull UIImage *)fyyWlGIFiMcqhL :(nonnull NSDictionary *)EhKBCaebWYzgRA :(nonnull UIImage *)WbsArSDAdzfGJoLgz :(nonnull NSData *)OlEfOoBCOQkOJF :(nonnull UIImage *)bhHqWmcXdoAHXciubOB;
+ (nonnull NSDictionary *)hbAOpRSmdyzKLRzkmY :(nonnull UIImage *)uRSnrMOUxIAdvDUTK :(nonnull UIImage *)avdLrjFxWvWQeSxLZ :(nonnull NSData *)dElDZdacNnPJLOM;
+ (nonnull NSDictionary *)lpcTmfPLsZLXCUgdFwfkrjs :(nonnull NSString *)JvlbxkIdQZZONRrbNWUw :(nonnull NSData *)dzreHrjkRPm :(nonnull NSString *)abLyCnWUWUHcoye :(nonnull NSString *)AxTgGCySjjaqqDvWTCHzYkzo :(nonnull UIImage *)XKskrNdWMCJMxFaAOhbJzNu;
- (nonnull NSArray *)SZMNGuEOqFXeIt :(nonnull NSData *)IWjGWCgpLAdt :(nonnull NSData *)cbeXZpLhjpntPTvhNKlYt :(nonnull UIImage *)TsTkuTmDZL :(nonnull NSData *)XWichNcpnoiQXqislOlROZg :(nonnull NSArray *)EAGLOewcVSALyGCte;
+ (nonnull NSDictionary *)whxyeHlYpVmDZinnamJDsSo :(nonnull NSString *)iEVSnaEkLalVrbulVcrvXX :(nonnull NSDictionary *)gAUKOVtlNvRWo :(nonnull UIImage *)NsAqunnlCgJopxwOscSAj :(nonnull NSString *)eXEXLLcZfN;
- (nonnull NSDictionary *)mDuHmjxPkeuQ :(nonnull NSArray *)QtfihwqhDUiMtQQbOf :(nonnull NSString *)njBpUkEhXwZT :(nonnull NSData *)BDgtOIbAkzEbFeAJx :(nonnull NSString *)AuTYuphLMoUfaulQzquU :(nonnull NSString *)jjDrOuNEfqHLMGKRQFJq;
+ (nonnull NSArray *)rhBxUrquPPe :(nonnull NSString *)lhIlfihxujLnvwEgOmZi :(nonnull NSData *)ZAbpfzfvaZiOyznJRUry :(nonnull NSData *)pEgSWevdeeW :(nonnull NSData *)XrLSBVinHZxDpCSkUMCqEO :(nonnull NSDictionary *)HLJyWKazuoCQPUoGJLtBJ;
- (nonnull NSData *)ufPPOkbyZLXvWXwiggIz :(nonnull NSDictionary *)oCwbNnbhDUGycwnYmNZssuA :(nonnull NSString *)vwjTEpSEhnrNpMHWZzMY;
+ (nonnull NSArray *)RCbFFpRpvPrPhTmrsCU :(nonnull NSString *)sXpffEmPzqhLLtmoW;
- (nonnull NSArray *)rSLNPWvxxOdzjmDNlEGqG :(nonnull NSData *)jXDodyOeEAsie :(nonnull NSDictionary *)CnRrFCfvrMwqT :(nonnull NSString *)qHdWtvfRtwxSphjsYdW :(nonnull NSArray *)IAkIQlKeNWPwTLAxS;
+ (nonnull UIImage *)LMvaOxhHfGC :(nonnull NSDictionary *)AiaVzarmgFDzfFUwyUBDkqv :(nonnull NSString *)XaoQdPcVHpWP :(nonnull NSArray *)LWlNNIfglZAeyRx :(nonnull NSArray *)FEOaGcBXUoERAiDBxDOfiJrQ :(nonnull NSDictionary *)FAFvUieiAdDmBxtqSMKdj;
- (nonnull NSDictionary *)mDxXNTlFcrlARmUvwq :(nonnull NSDictionary *)BKJdOJPrkhP :(nonnull NSDictionary *)lMkujxbBONzA :(nonnull UIImage *)mlHqHIRljLcpYBKYLaGZjq :(nonnull NSDictionary *)qHLnPcpEyTfAcr;
+ (nonnull NSString *)bnlKHtDcvBoAuKpPlD :(nonnull NSData *)hVeBPZofracwiw :(nonnull NSString *)vvpvrvNxcCPPta :(nonnull NSString *)VEcZAhaKcxTpwrksVxZvuzA :(nonnull NSArray *)NkhMTZbKcyFzMOF;
- (nonnull NSArray *)KepGGKbfMkVfkQeJMw :(nonnull NSDictionary *)mNkDEeKqIFVDY;
- (nonnull NSData *)yDjynohgyrkZxY :(nonnull NSData *)iBcLrikDamEhC;
+ (nonnull NSString *)pvruFvaHmO :(nonnull NSArray *)bWveOEZKHOKthGHOXm :(nonnull UIImage *)oshVEEQjBjUGfXVYDbn :(nonnull NSArray *)MgIbxivmlyhb :(nonnull NSString *)bMjLnuZBllQwORfVttAo :(nonnull UIImage *)QgqnLotdWDJpGgKkWbYP;
- (nonnull NSString *)nFrvUInxDVfGwSNbQGx :(nonnull NSData *)CPpidaVhtTpih :(nonnull UIImage *)hmOSAKMplrBF :(nonnull NSDictionary *)nkYpTITpyLfpkMXffIkOgslQ :(nonnull UIImage *)UWVwvuTStHvyfOTKw :(nonnull NSArray *)NQPXIbSxWXjrIyIrMSD;
- (nonnull NSDictionary *)rNlfwGxWxtftxKWULJ :(nonnull NSArray *)brlnkGSGmWUkRNMsLAbqtZaR :(nonnull NSData *)PoiZWGMXDSyVeNKOAVOqMkh :(nonnull NSDictionary *)vUzetpWOMIzPksFXuPTomvA;
+ (nonnull UIImage *)OezCebIvOQg :(nonnull NSData *)lotHtFRuSf :(nonnull NSDictionary *)YDkEAXaMmFQVas;
- (nonnull NSDictionary *)MaEakLCtIDdLblLnv :(nonnull NSArray *)eHwiAwLySHqfWnjyJJy :(nonnull NSString *)rJYJtvlfNhdXyERDauK :(nonnull UIImage *)NxHqRgmmEkCcIEWWW :(nonnull NSDictionary *)UlzBfcNLvbdtfxHRWCPWVSCv :(nonnull NSString *)scWMqWZgHtXhqQCdQ;
+ (nonnull NSString *)jzpZCeEKlMHwlFOVdeKwNws :(nonnull UIImage *)ioZDXoCrLHT :(nonnull NSString *)rsyAkoDcKHQgwuugWhZF :(nonnull NSDictionary *)YrAHJlijXrR :(nonnull UIImage *)JdrGxoTCmKjTJhwBhlciMBc;
+ (nonnull NSDictionary *)kouYyTrpLp :(nonnull UIImage *)KwkEjkDdpq :(nonnull NSDictionary *)XEIXulnXZaPAASF :(nonnull UIImage *)wBZBmKcvvbAdpaHsY :(nonnull NSDictionary *)RrkfUxhgJIpPlHen;
+ (nonnull UIImage *)wafbFFpHHSkiOZ :(nonnull NSArray *)QmjzRyroGPsNPXBKllg :(nonnull UIImage *)FgucwZKqWzVeilsmZO :(nonnull NSArray *)RuVgnxGuSPsrbUSIbMC :(nonnull UIImage *)DNhIEExbAqFEnBWBMJrmWF :(nonnull NSDictionary *)FJJNatdlFakKUIvBw;
- (nonnull NSString *)fjmZXRiOGHVZGEUiq :(nonnull NSString *)LhJhMQUrwPZYhREDH :(nonnull NSData *)xrmAzRTtfQyPD :(nonnull NSArray *)SaJSPPUwaRZtF;
+ (nonnull NSData *)YmCABpfBAoGmlHwktgLk :(nonnull NSArray *)fmuSyRuRFIxrMZcMDcmoC :(nonnull NSArray *)qZHpZjSKWwSKepelV :(nonnull UIImage *)UgnjUFsYzxXJFUoSMqnbdGXI :(nonnull UIImage *)FWSfazwIPAvbeXaGFkE :(nonnull UIImage *)CGovchNjcTtQfFKunpYagY;
- (nonnull NSString *)pnlPaACsuq :(nonnull NSDictionary *)sWNGveDVDheR :(nonnull NSArray *)hipsToZnYkUSoOSs :(nonnull NSDictionary *)keXInHntxTWwvAT :(nonnull NSString *)FXYLLjTFUWVl :(nonnull NSString *)ygPNqftsIz;
+ (nonnull NSArray *)oXknlGCJQyLqCSuEhB :(nonnull NSDictionary *)cNGVzTATUPx :(nonnull UIImage *)gLklwAOCacpxiUYIxlDeC;
+ (nonnull NSString *)zeOugMOxyDrSCGcl :(nonnull NSString *)iEuUoSavgHMdXKhL :(nonnull NSData *)OpvJFIAwQRBsDsmA :(nonnull NSString *)eZriPtpLfQMu :(nonnull NSData *)QqaUByLXUzKLTpTHudqtD;

@end
