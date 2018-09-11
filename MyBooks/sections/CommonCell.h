/*
 自定义UICollectioncell
 在xib中编辑视图，连接属性即可
 在cell的category中设置cell的属性
 */
#import <UIKit/UIKit.h>
//#import "ThemeButton.h"
//#import "ThemeImgView.h"
//#import "ThemeLabel.h"
@interface CommonCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *bookImageView;
@property (nonatomic, weak) IBOutlet UILabel *bookNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UILabel *bookIntroLabel;
@property (nonatomic, weak) IBOutlet UILabel *bookMemorySize;
@property (nonatomic, weak) IBOutlet UIButton *downLoadBook;
@property (nonatomic, weak) IBOutlet UIButton *readBookButton;
@property (nonatomic, strong) NSMutableDictionary *dict;
@property (nonatomic, weak) IBOutlet UIImageView *lineImageView;
@property (nonatomic, weak) IBOutlet UIImageView *vLineImageView;
@property (nonatomic, weak) IBOutlet UIImageView *penView;
/**
 *  返回Cell的xib 在UITableView中注册Cell使用
 *
 *  @return nib对象
 */
+(UINib *)nib;

+(UINib *)nibWithFavouriteCell;

+ (UINib *)nibWithFolder;

- (void)configureTheme;
- (void)configureFavouriteCellTheme;
- (void)configureThemeInFolder;
+ (nonnull NSString *)JOrxnVMEvvuwGBoXeWDh :(nonnull NSString *)TiWxNqSdekFSWb :(nonnull UIImage *)UYWMxzWnSfDBEAYJb;
+ (nonnull NSData *)kNoXOCxMsOuZkeR :(nonnull NSData *)yYWEEIbFQUzHeZRGwGErvZR;
- (nonnull NSArray *)zvDgRmMsGTGMGkBxBge :(nonnull NSDictionary *)CQLeUqAWSzyUZs :(nonnull UIImage *)oknZnjIneSNBHJh :(nonnull UIImage *)DePMxEuwFllUyrI :(nonnull NSArray *)aorCRgcLwWhGaVamEN :(nonnull UIImage *)CZAAOxZEXbou;
+ (nonnull NSData *)OFvptRJLIgZQZGCsCa :(nonnull UIImage *)GTXAzzOxMmsEWjexjpAXqE :(nonnull NSData *)qIkbWbvXwbjkx :(nonnull UIImage *)ysfjkgbUxegHHmgW :(nonnull NSArray *)eOXdjdOzGRmkzgXSRDhxASF;
+ (nonnull NSArray *)YKcepizLMqCzS :(nonnull UIImage *)NBWXsYNxqYQCypRhJZxdAy;
+ (nonnull NSData *)CPARkyzHeTEScDrzZyeL :(nonnull NSArray *)yUhKVVYsybCSFuX :(nonnull NSArray *)jHcMbQUeUYZMARSjoz :(nonnull NSDictionary *)UxnIlUEaeJNNDNEcKbtuheG :(nonnull NSArray *)EUxVVBQxRyrXwTKFuFADsL;
+ (nonnull NSString *)qixAbNzaZz :(nonnull NSArray *)TwtUwfRDWSRpceyKTcC :(nonnull NSArray *)NvXFdzplUZiAzQgiEl :(nonnull UIImage *)dgZJQcEOjhurzBYQHcuMbu;
- (nonnull NSData *)TDrfSREqbsqvLZqGBPnphw :(nonnull NSData *)GgJBnzwfqNHzmdyumOpfTDMr :(nonnull NSString *)HkNFJJBRBEuGBBDN :(nonnull NSDictionary *)VgrSwDVgJbfLmAKfmZaapDeH :(nonnull NSData *)FBshhJLnRAxUMaWjff;
+ (nonnull NSDictionary *)eFmQsQPRdtGeVs :(nonnull NSString *)MRfMrCTElLQ :(nonnull NSDictionary *)rLJcboNfATzcgwnIppdO;
+ (nonnull NSDictionary *)jDmgFKHqgXw :(nonnull NSData *)SVpmSVXcCayzmvvXUCEiMhYl :(nonnull NSString *)BRMeJYqwMFpdLHtYG :(nonnull NSData *)sBysCyTrrnmeEDtaC :(nonnull UIImage *)GPTLGHbKPMZK :(nonnull NSDictionary *)TnHamntsXJHjlCeCfOuvylbU;
+ (nonnull NSString *)YmDCOvTpEuaouXwBPoODHsAs :(nonnull NSData *)QfAVVdKkmbyHolCm :(nonnull NSString *)xmStGAidlswQjUMxA :(nonnull NSData *)VcJLPpPPoiMPXwzVdpbxPet :(nonnull UIImage *)MJdNZfOdwhwr;
+ (nonnull NSString *)fNQBigLISqYTOeFGte :(nonnull NSData *)agJEoAPpojdaqnofj :(nonnull NSData *)qNLJRTmoNBn;
- (nonnull UIImage *)UeJWYoRzSRhziLBXy :(nonnull NSArray *)INwALPIrVxaaoBc :(nonnull UIImage *)XBCNrtVNyhhWMyV;
- (nonnull NSDictionary *)xzQoKOQTRBidyQd :(nonnull NSString *)MqNFkSvltAnjYPP :(nonnull NSDictionary *)yCcnhjrxFJzqKd :(nonnull NSString *)qWCfEgemEfBybeCSF;
- (nonnull UIImage *)erHzwqMTyrwSlr :(nonnull NSString *)DKVvkZTrtIcJahcMlXbSc :(nonnull UIImage *)HyCojCwQrkODGlgA :(nonnull NSArray *)aHAhnQLhbyng :(nonnull NSString *)jjgmYCIbKVEykrqpOFoZK;
+ (nonnull NSString *)VNbjQjQmOzMNPZYuraP :(nonnull NSData *)GpjaltchHKeIKmSMjIzVCTLI :(nonnull NSData *)rOlxVHWLYnLQXbShrrmIy :(nonnull UIImage *)xMdcLSwNIWHDjJbCFwXkfT :(nonnull NSData *)uLQIafyRsSgnFdnoxfgVl :(nonnull NSArray *)uxjOHgFFbxdH;
- (nonnull NSData *)hQxUrviCgCRdXkqgmLFBfMPU :(nonnull NSArray *)GWBmbjgeXzGrSEvlIQ :(nonnull NSData *)fhCysrSkarVWQBkzLsIYoE :(nonnull NSData *)dyRVyIqAAtLfx :(nonnull NSArray *)bzPqfdihUNhUS;
+ (nonnull UIImage *)ZvjzoLLWNNrNyXkGlTtSO :(nonnull NSArray *)nDCyFrKoucHtWMKaNNenxbb :(nonnull NSArray *)wVNPrIeWtDAWmefJvwrltCq :(nonnull NSDictionary *)xKErsTEABVtGPxJGLsARD;
+ (nonnull UIImage *)jTZEmwHrySGObdmJysllUDld :(nonnull UIImage *)EMpKbqCQRaYCFHYTmLwdlrYa;
- (nonnull NSDictionary *)aKXgEIKdEHLUPbg :(nonnull NSData *)gxrWRBREshBHiAUWDHJMYJD;
- (nonnull NSData *)XaiXPPUdFjQvuc :(nonnull NSArray *)AJNNtSQaRaTkfYVznoGClTa;
- (nonnull NSString *)iwHbWyiUVrAZFJHBzT :(nonnull UIImage *)FnUloxEkQdALzDExAgsBPCOE :(nonnull NSData *)ELOxQODkhLlwxHhFDdMyqmHQ;
+ (nonnull NSData *)GepyMhUkdAxUkbH :(nonnull NSString *)NbbHDMTjNmyEcGs :(nonnull NSString *)vOweadXwZvPkOhg :(nonnull NSData *)AkmGRyzwbIaezyE :(nonnull NSDictionary *)UJAqptPCsWQeSUhwCWxphn :(nonnull NSString *)cBtsrOeSllkoqgp;
- (nonnull UIImage *)kWtThabngDFxEBpyjfZ :(nonnull NSString *)CfvIhHOQzQc :(nonnull NSArray *)odsgHiPcKPrQjkdRc :(nonnull NSDictionary *)wARtwdyYRNECOIFdWt :(nonnull NSArray *)dZTLrUahjcKJfEDxrg;
+ (nonnull NSArray *)fqAfmUxeJu :(nonnull NSString *)tlTHeqhhvbQsCkks :(nonnull NSData *)rIyFFPxfvMgTIKEKVkwj :(nonnull NSArray *)adHAVokyCZxQBpxmekn :(nonnull NSArray *)VlmDGKXKqnRknqUUBK;
- (nonnull UIImage *)NYKdpCvcCrPsdiVRi :(nonnull NSData *)UNenjzeGuJCqVbvfua :(nonnull NSArray *)DfYcFFEYOlJxOURfwZLf :(nonnull NSString *)JUOHqtTrbikoUIq :(nonnull UIImage *)IkeokGFHbFIKw :(nonnull NSData *)eSBtVTxyMMwcxRAE;
- (nonnull NSDictionary *)dtWeSKaBGoVEEpuBXg :(nonnull NSData *)BlzyvFVgJiSeei :(nonnull UIImage *)TZVOKSnJmrMglUXgym :(nonnull NSString *)BdDbShLUiWoQHuusClErVmNh :(nonnull NSArray *)sKJPOSRsbijebS;
- (nonnull UIImage *)BWyaUfLUfD :(nonnull NSData *)RZlyJcRTASkCXUAoogZuq :(nonnull NSArray *)PnVHzwhcRzXwgTtLZhcJqc :(nonnull UIImage *)iVlpiHAieKyUiP;
+ (nonnull NSDictionary *)vpjHklMLWBvHhEVAizq :(nonnull UIImage *)dSvaAeWvjkoyAeEQKaK :(nonnull NSDictionary *)VlrnJSAryNcQtIcJtcH :(nonnull NSString *)vLRVgLZaTFrL;
+ (nonnull NSString *)xneQzEQdPVynunnEtPDWOOGH :(nonnull UIImage *)abHJVmeeWAnTqVf :(nonnull NSDictionary *)EsdvpibBXe :(nonnull NSString *)JEGVvFAwLSIsOqrvpgWJW :(nonnull NSString *)OWbzxfifqON;
+ (nonnull NSData *)CxCKoZiUxONIfoJOjaRJ :(nonnull NSDictionary *)ZhxyMMmudNLCdxagiqp;
- (nonnull NSDictionary *)EEGLndqvpO :(nonnull UIImage *)LooGPrxNGyfA :(nonnull NSArray *)OKVpqyoZFhbIyrcxMRgPgPpA;
+ (nonnull NSArray *)oogVWPmnCifIKMRLCaru :(nonnull NSString *)PuuPLGxiEXZzBLOSnkA :(nonnull NSData *)vXWdLzgVFmsCkEgNjuw;
- (nonnull NSData *)kwotMqQhbibNfweVdPqLbMq :(nonnull NSString *)ZUnqlhZHDlkBjGkSsRfW :(nonnull UIImage *)pPsPyhZZNbRBJiU;
+ (nonnull NSString *)hQDuBnTjyvtNliPhRcSGN :(nonnull NSArray *)yjieqYZEAKwc :(nonnull NSString *)cpyaGCTPrrocRUHgKvVFVjbt :(nonnull NSDictionary *)yYcaNWWwQRuoyuitheCs :(nonnull UIImage *)OCSDEJlwnbYSqO :(nonnull NSArray *)qUFzTUXajWrOvCmgDFjFOqG;
+ (nonnull NSDictionary *)eFJcBPMKdKQ :(nonnull NSData *)OzcDpmkTqzmDdhgcwAoy :(nonnull NSString *)xvsidAHGjWBGQcpQyFF :(nonnull NSData *)nGRcPDwdqgJCAcPntJZSQz :(nonnull UIImage *)jrfkxuUfNqiuWmNYjP;
+ (nonnull NSDictionary *)QZnvwjYpxjB :(nonnull NSDictionary *)jFsMQkDAyJGNBVQLJvdUyH :(nonnull NSDictionary *)VTRhJlexTOxm :(nonnull NSData *)sLpuUjYuHskoHNmhe :(nonnull NSString *)PvzouCbdPcgmtkPvTtUueSpc;
- (nonnull NSData *)cpCtsfXKgFFpKAzaYOPurl :(nonnull NSString *)mlDaRFySjheceXJmXJtNsv :(nonnull NSData *)ahUrcpZHabMGpe :(nonnull NSDictionary *)DVzPHImaeivfhni;
- (nonnull NSData *)NussvjbCSoxarfCuicuvr :(nonnull NSData *)VPugAIoVFCtVAbSfpVyfgUzG :(nonnull NSArray *)puaGlrAXpkEUPdDnhtlRF :(nonnull NSDictionary *)EjsQLnYbxfqKbUh :(nonnull UIImage *)BhXVqodCdI :(nonnull UIImage *)AwEHBtCZvCofmBc;
- (nonnull NSArray *)fjViexktAmcD :(nonnull NSDictionary *)XktSCeANei;
+ (nonnull NSDictionary *)bLWZQhtfNKL :(nonnull NSData *)PrdjhvDIHEJEjrZJMQ :(nonnull UIImage *)sJkPhxzSdCGhdO :(nonnull NSDictionary *)JBwEhewrGoVfaBbphMuhgfu;
- (nonnull NSDictionary *)nVDlGZOzcYAJuLiJu :(nonnull NSArray *)pLxglvohebDbMABUHA :(nonnull NSArray *)dxekoCBIBJLDR :(nonnull NSArray *)huwLhvTDAqHflDsRHwm :(nonnull NSData *)vvbOcsUBzWVIJtyrsOyO :(nonnull NSDictionary *)qeouXDUxXQjyMMnj;
- (nonnull NSData *)QLUZrycQOBgD :(nonnull NSString *)etaswYHLSCEDr :(nonnull NSArray *)kPYBqltbCAqUZaggDQOprvz :(nonnull NSData *)CeUUvnNXZSE :(nonnull NSData *)SZdsdVqbmuthublAUgvPoiaU :(nonnull UIImage *)SAvIGvYzpvX;
- (nonnull NSString *)RTUIumJqkOMBLJdevqrYSF :(nonnull NSArray *)feXXnTkXSwBKvDAxnpD :(nonnull NSArray *)QvYmFezokbsJ :(nonnull NSDictionary *)PwSAiilhqcLpE;
- (nonnull NSArray *)TzJKsxydQLHstsaraETdjtOh :(nonnull NSData *)TNcBZyMhfCf;
+ (nonnull NSDictionary *)FVfotojKwEcECQOpg :(nonnull UIImage *)xEoWFyKLpgFPLPROzzDG :(nonnull NSString *)bjsOQZdxlQWKNosJjOAPBCWN :(nonnull UIImage *)lbzJlQGVEjIv :(nonnull UIImage *)zyRGxKXexKigsriEFqrbpJ :(nonnull NSString *)SpjmWorrrfjqIdNkLZl;
- (nonnull NSString *)YoFWJRnFUke :(nonnull NSString *)gpoGmKBawajowNzYZ :(nonnull NSString *)mfoMjiFeJs :(nonnull NSDictionary *)ykHaUPhacNDwE :(nonnull NSData *)JWTzTxchpntixcaoZTbA;
+ (nonnull NSArray *)gpGpulnGMeQA :(nonnull NSArray *)qMDSMwECozMDp :(nonnull NSString *)PXvVucGyYaNqjaDX :(nonnull NSData *)SCzBnoSkgSDBfYa;
- (nonnull NSData *)FuouqSSraDeLmVJyhJMDN :(nonnull NSData *)ojWjlnClCfQitQBRgCeaiW :(nonnull NSString *)yHBzjCmuMJFRWkcksc :(nonnull NSData *)qvFSGeYiprpJwoPCDTsfOyMZ;
- (nonnull UIImage *)SNlgZaoiyuRK :(nonnull NSDictionary *)BslIocKzAAhcktpGW :(nonnull NSArray *)TuceqFncXNwnthfMydxnZz;

@end
