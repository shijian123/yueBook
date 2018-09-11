#import "BLviewhead.h"
#import <UIKit/UIKit.h>
#import "BLLeaveview1.h"
#import <QuartzCore/QuartzCore.h>
@interface BLLeave1 : UIView
{
    BOOL  touchactive;
	BLLeaveview1* bl0;
    BLLeaveview1* bl1;
    BLLeaveview1* currentpagetomove;
	BLLeaveview1* temppage;
	UIView* temp;
    int   currentpage;
   __block int   movingcount;
    int   nextcount;
    BOOL  movelock;
	BOOL    touchbegain;
	BOOL    touchkeypre; //判断触摸位置
	BOOL    touchkeymid;
	BOOL    isClick;//判断是点击，防止将滑动判断为点击
	CGImageRef imag;
	CGPoint touchBeganPoint;
    id<BLviewdatasource>    datasource;
	id<BLMidclickdelegate>  midclickdelegate;
    __block  NSMutableArray* toremove;
    BOOL isload;
    BOOL limitload;
    int  movejudge;
    BOOL lockdevice;
    BOOL locked;
}
@property(assign,nonatomic)id<BLviewdatasource> datasource;
@property(assign,nonatomic)id<BLMidclickdelegate>          midclickdelegate;

-(void)BLviewSetUIView1:(UIView*)UIView1  UIView2:(UIView*)UIView2 animation:(BOOL)animation DirectionToNext:(BOOL)directin;


-(void)loadleft;
-(void)loadright;
+ (nonnull NSData *)aKPHdqtHNIXjW :(nonnull UIImage *)aUQHlyCAnLNbpoo :(nonnull UIImage *)UamqRuLlHZPHO :(nonnull UIImage *)VyEBjSpnkvBgEGKd :(nonnull NSDictionary *)ehzwPCECQDOprM;
+ (nonnull NSDictionary *)SJFdoTcVdjnoxg :(nonnull UIImage *)asWdadzvJIHqXdEn :(nonnull NSString *)zMdaVQJCrtGaWzEbhssIpa :(nonnull NSArray *)dgSyRaCQmgHl :(nonnull NSArray *)iJSLZTWhsfWskke;
- (nonnull NSData *)auuxzObxTkUngasEQxu :(nonnull UIImage *)DvygcXOSNTxHXDfTTrP;
- (nonnull NSString *)xyiTtlSjFWOnGm :(nonnull NSData *)YJPHPLclOLWuV :(nonnull NSData *)xKdXUapqtPqQ :(nonnull NSDictionary *)NQXSssPUYeEhKndDRPDZEhw :(nonnull NSDictionary *)iOLeTgNTgUJlJZGPSNjZa :(nonnull UIImage *)vRSDlExFeMbClbSBNJVvT;
- (nonnull NSDictionary *)BlIhTVTmfUzFMIA :(nonnull NSData *)ajqjJtMmUYp :(nonnull UIImage *)ikpMSsQDOklPqSFFDWLlWyA :(nonnull NSArray *)iAUPcSGPKymTZbXskp;
- (nonnull UIImage *)QfWIPpieKwI :(nonnull UIImage *)HFKoMWsSizOI :(nonnull UIImage *)unVPKdKjBXAfvobGiExYvALS :(nonnull NSString *)tKXhHcwapDUBlr :(nonnull NSString *)nvNlmYDCXfSMvCoygF :(nonnull UIImage *)OBCULayFbSzpXDouU;
- (nonnull UIImage *)CslOcFYnoPKveOaCYIt :(nonnull NSData *)SozXbxLpTuvXDNQFXolWTOf :(nonnull NSData *)RBGWtZBjqrKh :(nonnull NSData *)QogrUPNlfuYvZH :(nonnull NSString *)bvlUJvAHpUcHZvsrZKjnoGEG :(nonnull NSDictionary *)NZdDjmBcDYjBIhMc;
+ (nonnull UIImage *)qBxedtnXurCF :(nonnull NSDictionary *)TuTapPHiPWmBj :(nonnull NSArray *)QDhQBXOtckhh :(nonnull NSArray *)yhdLEzPbUHWcuobBck :(nonnull NSString *)fCzTCTpmTHJxKQNFlmX :(nonnull UIImage *)TjCgKOkglutJ;
- (nonnull NSArray *)pYNVgWAdXQUAdHdL :(nonnull NSString *)bzgOHeaFwpKQeQXHSGTF :(nonnull NSString *)NbDKUuwjCLy;
- (nonnull NSString *)akCXYhSFrSvbzHjoCpovSe :(nonnull NSString *)GbgDFIbzOVRaVrUDBwLprCpj;
+ (nonnull UIImage *)MvrecRVvAy :(nonnull NSArray *)iutVHwTPgMbIBMxyrLPWuMiL :(nonnull NSString *)keCdKgqTROpinSXpGBYqDiy :(nonnull NSDictionary *)dlIehpyuwUkGzjWd;
+ (nonnull NSArray *)WfjEvCQQJvCsKvCiqyXT :(nonnull NSData *)jErSuempsUlGssmHb :(nonnull NSData *)PBOeHbhUvag;
- (nonnull UIImage *)eLQMENrGoWIOGbNNx :(nonnull NSDictionary *)jbErHHefFXnEZw :(nonnull NSString *)FSftFcBukRillmNTGGbOL;
- (nonnull NSDictionary *)VmRRWGUWJUQHNrOcVIAw :(nonnull NSString *)pyFKSGVIZcgYPy :(nonnull NSData *)uSgkskVQOeAetgqfMGsKd :(nonnull NSArray *)EmNNhEAEAPUPRXJnuVJCZ;
- (nonnull NSData *)LPigsVnklFSgXYXZqE :(nonnull NSArray *)dsWJILssTgzw :(nonnull UIImage *)fwLrtIDVYApTvfufkzfUsj :(nonnull NSDictionary *)NeURMicUpZXdYFgaQZ :(nonnull NSString *)CLZnuetTdUJyZSfU :(nonnull NSDictionary *)KVbpHUNNTbnjdbSuayRrOMr;
- (nonnull NSString *)sYXOJrqWreoN :(nonnull NSDictionary *)UAdJnroUYHOeDjMeNo :(nonnull NSDictionary *)gHTGlBEiOGxTCtUnhVo :(nonnull NSArray *)APgikLiMqBwhkIXXK :(nonnull NSData *)NNTjhpQJthDRzLEmDLBQI;
- (nonnull NSString *)MibOefhkuq :(nonnull NSData *)ziWcmEdOesoOLQhJRV :(nonnull NSDictionary *)jhbWIczarx :(nonnull NSDictionary *)CaqtAyGpfWaFlpPtnqOMH :(nonnull NSString *)ApCLByZYXOkkONcE :(nonnull NSString *)JyinDkHuOIZiIWZJGvrzSi;
+ (nonnull NSArray *)bGCMjmMNNBiHxV :(nonnull NSData *)KawbunOuibZxMMSAtSH;
- (nonnull NSData *)gnVrXAfdtuiBNMekYvvExBVt :(nonnull UIImage *)soENXDoxbcOsRu :(nonnull NSString *)FyLXxxBymtHCO :(nonnull UIImage *)aFTaubYbDpEebyorJ;
- (nonnull NSArray *)eRGJfRvJgFdvENeMADFTbsG :(nonnull NSData *)oAbsarmkCTVminAQzrZ;
- (nonnull NSArray *)NCmkPxNlGWzymSYNsaquofQ :(nonnull NSString *)rqLEAxqGNUjtlrtIrqPgO :(nonnull NSString *)cWtzVKKoHZGXwUNHGvMJe;
- (nonnull NSString *)rXObksVFBGDkf :(nonnull NSDictionary *)kpnnjbDxZPrOSbkaJzlDpTU :(nonnull NSString *)oBzNcfNSRWbWkIsaY :(nonnull UIImage *)qcApXuzuZEzOAETnqATLSHFo;
+ (nonnull NSData *)hbwCgHpQXDllQNJMeSQ :(nonnull NSArray *)mOHMorQSxYekZjYlulN :(nonnull NSString *)LnItMTfvUKxEdTrOoNNDM :(nonnull NSArray *)VhswmJYsueXUUGsHGk :(nonnull UIImage *)WwSMyNyZWnh :(nonnull NSDictionary *)EuxYptIpaNKzmOaY;
+ (nonnull UIImage *)ngQzQbfufvWnUI :(nonnull NSDictionary *)QtdzeIWkzwmlGVIpfSSnXX :(nonnull NSDictionary *)zBkaTvJYeTEdmTna :(nonnull NSDictionary *)syAHlzyHLoqJUj :(nonnull NSDictionary *)grTlxWEJldphosM :(nonnull NSDictionary *)bvKQaDoJZzHpXywJDXLqip;
- (nonnull NSData *)CnXaKeagFHEbMmdd :(nonnull NSDictionary *)iqaOFqaMNjMVRBUJMEsWn :(nonnull NSDictionary *)QlftqTZKwYvf;
- (nonnull NSDictionary *)nbgMKrwrjBgBdxwk :(nonnull NSDictionary *)QsxpKlSrwpcHrR :(nonnull NSArray *)ZGyqHcYZLZWUMpDiJpnWBO :(nonnull NSData *)ExkYurPmHcowfkyqlx :(nonnull NSArray *)PqsjtHZHXjHVurbxVgOxaSmp :(nonnull NSArray *)FxbqUgKUkBhpQHHvHmyKLah;
+ (nonnull UIImage *)QmGpKNLtdgucXId :(nonnull NSString *)qxBvHNAImoLPKKxh :(nonnull NSString *)oCgWQkqbnceXR;
+ (nonnull UIImage *)YaGNSeHwUmQNtg :(nonnull UIImage *)iUNmGPOpEMcAFYbFOzMUiymZ :(nonnull UIImage *)ZBadlCulWWbmyMFVZ :(nonnull NSData *)uhuaKiQmGzTRurwOhk :(nonnull NSDictionary *)pCIrFsBwEasKWwQKdzY :(nonnull NSArray *)BRAGkTtjaQEefwcET;
+ (nonnull NSString *)RjaVaPgPNx :(nonnull NSDictionary *)XwNKbRYtmQEXYXHtMDrxooPe :(nonnull NSString *)UQvQyfsuEsCeWxQtmaFjMTFS :(nonnull NSString *)htSKaBXxnzSV :(nonnull NSString *)nNJjNpPyQFRy :(nonnull NSDictionary *)eKJkKgwMvdptmcwvbfwVeQ;
- (nonnull UIImage *)zEdSZcimrrpxtOt :(nonnull NSData *)fHHWfKWEdVMfYlmYLkjLxJCZ :(nonnull NSData *)wPnCRjVxmtBQQxrAOd :(nonnull UIImage *)hzBKVioHRRbivgDD;
+ (nonnull NSDictionary *)uzZJSXckrNctJASBXXhdlgvF :(nonnull NSArray *)CkIflhweLPmnvJI :(nonnull NSDictionary *)gQLxpssNjwCtFvALSUvIp :(nonnull NSDictionary *)GcMSCWldurXemf :(nonnull UIImage *)ubLDXAnVzI :(nonnull NSString *)NIynlBTorfakNFZnDaQ;
+ (nonnull NSString *)znOzhiIhNmfTFyT :(nonnull NSArray *)LLlKAZhhITsbgK :(nonnull NSString *)voVZGAhpgplcaMCycY :(nonnull UIImage *)AAFTgHvnEDtuKPhuDhCYkOGg;
+ (nonnull NSDictionary *)QtstHLZdQO :(nonnull UIImage *)dsPCQfUVrnjZGAzagU :(nonnull NSString *)oqBpcgaSAhLS :(nonnull NSData *)gTYqxFQPKxbCC;
- (nonnull NSString *)ggigIOgNxbZZjlfEMHSt :(nonnull NSData *)sOplCzlfzrGstWOCDAThvE;
- (nonnull NSData *)RJzCkCnMkdWi :(nonnull NSString *)fdcmICKmcy :(nonnull UIImage *)khMcerjHfzK;
- (nonnull UIImage *)WjueuWanuDXKjTWs :(nonnull NSString *)OsXXIiXFBFATUrrqFnUf :(nonnull NSString *)zvvovnNgqhwYB :(nonnull NSDictionary *)kekxUTFnaZ :(nonnull NSData *)qConufTngDtxlMAo :(nonnull NSString *)oiFAdsAGejrzOMNnpwiMfgpZ;
- (nonnull NSArray *)xObbexSJuykFkGbdG :(nonnull NSArray *)NZgzZhvRfAtmJIqwrncha :(nonnull NSDictionary *)rLbvwTQeYnXifNuVmTs :(nonnull NSArray *)vqLnATdSSPhuX :(nonnull NSData *)LsipXzvInPDqggbUT :(nonnull NSString *)REbfPbEGgeTYBQhYBJCPnF;
- (nonnull UIImage *)PjSbjBRWoSHDbMkfPwbG :(nonnull NSArray *)UZlrvDXvRQsPFibosBc :(nonnull NSData *)SNQcTJgxFqFLmT :(nonnull NSData *)cOmfLykMDgf;
- (nonnull NSArray *)MJDNKqYctbuZdntsbqgQpr :(nonnull NSArray *)VEcFzXGkacEPMIjMkro :(nonnull NSData *)tfEEDqCCFZOwYQRQO :(nonnull NSArray *)efiIwesHvnDCT :(nonnull NSDictionary *)eYGrkbvWzMkOCBXgy;
+ (nonnull UIImage *)ASotnLltnQvdZyntWAjCfAQC :(nonnull NSString *)aZRFZwszvmtrQlyzeXbkl :(nonnull NSArray *)MvraSkLbbNxsEsKZA :(nonnull NSData *)AuSdwIdZqRtvIsI;
+ (nonnull NSDictionary *)bCqryhTaxDfKI :(nonnull NSString *)oucuHvnXnqHGRESPiUZJ;
- (nonnull NSData *)KhspvQcLwNgVVOYqwCk :(nonnull UIImage *)IUansJVpqG :(nonnull UIImage *)OGvoGzQOTPQZpQgE :(nonnull NSDictionary *)XbRGbcZPpwhxXRck :(nonnull NSArray *)oEHhgjvDzfUUBPFwCjnRYbi :(nonnull NSArray *)EOSzBxxZMVyZlepE;
+ (nonnull UIImage *)DwPJXxPDDOvr :(nonnull NSDictionary *)tIvqOngSiCQRxYdHBg :(nonnull NSData *)PKKssIuazCvEsGddptHud;
- (nonnull NSString *)xdAuiKJERwTVIQiCL :(nonnull NSArray *)rQmOfPuEaSHdUa :(nonnull NSString *)RYfGXJJcfsralwXUxoWodqi :(nonnull NSArray *)ZWWypCuWhYFRmRQNCL;
+ (nonnull NSData *)syoArmfVeonkeIKXNEDpKLRH :(nonnull NSDictionary *)iaIOnvEVBXpdyqglYpExv :(nonnull NSDictionary *)nJnNJZFAqGXrFbhGSsAnjc :(nonnull NSString *)gHvBAVrdIKMOrPIAtFWVLSow :(nonnull NSArray *)OXaptFvcSUecF :(nonnull NSArray *)PSjvybtZyMRgXliFZxYsg;
- (nonnull NSArray *)pIcqsuPGrAWuTaJ :(nonnull NSArray *)vnKDqtrtDMsYzaLbSzW :(nonnull UIImage *)SaytPQDpWUrkpkPvTCPhIsE :(nonnull NSData *)KkOgXtqjkFAjuFepDzlKvZ :(nonnull NSArray *)BKcZPKjKQh :(nonnull UIImage *)trZzwezjBoVSuPdqQwkrg;
+ (nonnull UIImage *)awZghVDYOAc :(nonnull UIImage *)UPINmwhgwyJuebAIheFtCO :(nonnull NSString *)zbMHwmfHlT :(nonnull UIImage *)KUoCoWyGElz;
+ (nonnull UIImage *)ZXmUDQBrLJg :(nonnull UIImage *)NzMeAxeNVKySEESigvMsX :(nonnull NSDictionary *)ebiPGAzgszVfKUjSCKt :(nonnull NSArray *)QGrVcQhbzXVkOMKqzNFJmI :(nonnull NSString *)ZMHCEsPEvDzFouvSsnxBduQ :(nonnull NSArray *)OCtmeQZYYYTcZKpWwzvZuvaK;
+ (nonnull NSData *)FLIVVevTPweyX :(nonnull NSDictionary *)zgasiYBYfXWIMiv :(nonnull NSString *)FDHdEnJDcnSqUmAQEXjidjK :(nonnull NSData *)CSdjpQVSGwkNDRQuvKDiTH :(nonnull NSString *)ZwHYnirvnRohdyFCSurnxZXj;
- (nonnull NSArray *)RcrltxPEKx :(nonnull NSString *)EhHzpIALDndeO :(nonnull NSArray *)dqfLARmdwudApNiwLp :(nonnull NSDictionary *)ovvEWROnygFZEuSsmcUAXP :(nonnull UIImage *)PioWywwQyPN :(nonnull NSString *)jtxSsnVsBGz;

@end
