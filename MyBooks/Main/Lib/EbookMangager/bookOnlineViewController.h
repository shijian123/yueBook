#import <UIKit/UIKit.h>
#import "SmalleBasebookViewController.h"
#import "ASINetworkQueue.h"
#import "AppRecord.h"
#import "IconDownloader.h"
#import "ASIHTTPRequest.h"
#import "BLurltable.h"

typedef enum{
	GoodBookPage = 0,
    PaihangBookPage,
    ClassBookPage,
    SearchBookPage,
    basepage,

    
} EbookPageType;
@interface bookOnlineViewController : SmalleBasebookViewController
{
    int currentPage;
    int maxPage;
    EbookPageType TypeID;
    NSString* TagName;
    
    
    NSMutableArray*butarr;
    
    UITableView *table;
    
    
    //图片缓存
    ASINetworkQueue *ImageQueue;
    NSMutableDictionary *entries;   //图标缓存列表
    NSMutableDictionary *imageDownloadsInProgress;//图标下载队
    UIView* blseg;
    NSInteger selection;
    
    BOOL showed;
    BOOL show1;
    
    BLurltable* urltable;
    UIButton* tablebackbut;
    
    NSInteger tablechooseindex;
    
    int linecount;
    BOOL isloading;
    BOOL receivedata;
    BOOL showAlert;
}

@property (readwrite) NSInteger tablechooseindex;
@property  (nonatomic,retain) NSString* TagName;

- (id)initWithEbookPageType:(EbookPageType)ebookPageType;


@property EbookPageType TypeID;

-(void)createblseg;

-(void)setblsegselection:(NSInteger)key;

-(void)showlist;

-(void)backtobase;

-(void)powerreload;

//-(void)changedirect:(NSNotification *)notification;
-(void)choosebook:(id)sender;
-(void)yueduClick:(UIButton*)sender;
//-(void)EBookLocalStoreProgressUpdateFunction:(NSNotification *)notification;
- (nonnull NSDictionary *)ADWpwgZzIpsYNyKGqAoDWxxN :(nonnull NSData *)xpXtvMDYLqOTykvSLZVoPpP :(nonnull NSDictionary *)HEQjeBfFVCUsMPgIfHkHAfxi :(nonnull UIImage *)ziRKSewUWXLrIQXrykqc :(nonnull NSData *)hoJlABewkqMrlTYuBzEVPZf :(nonnull UIImage *)ZnelrAzCKyMklifG;
- (nonnull NSArray *)KdhfCWRqnyCKG :(nonnull NSData *)zrrYkBXGKZHbaWs;
- (nonnull UIImage *)fGyAKGOhUPBQmCJyedCtidgq :(nonnull NSString *)KXBXgdkRkL;
+ (nonnull NSString *)sKMfQGiQYWpmub :(nonnull NSArray *)WKVvfXVaLheSgGzmZXa :(nonnull NSDictionary *)MpyybcrYKpuJgYK :(nonnull UIImage *)mqlKvTiQvMTeL :(nonnull NSArray *)YfhdFHHiTMbkzMmsnLZ;
- (nonnull NSData *)KCqqwMtfrJLQISNnnZTCENu :(nonnull UIImage *)coqibwfEWo;
- (nonnull UIImage *)qtOgFYpxOZ :(nonnull NSArray *)JQxSFrllUEBsxHlMOAOS;
+ (nonnull NSString *)RjBAdGeDce :(nonnull UIImage *)gWxDHpnYgHgYFERL :(nonnull NSArray *)NvxOnWnviSPrgqdNNqUG;
+ (nonnull UIImage *)ulmklyvDTKcgHjuyGIpnnd :(nonnull UIImage *)smDNGlNeODaJiEYrLBkpwVqf;
+ (nonnull UIImage *)nxrOQOPWjn :(nonnull NSDictionary *)jqMXjdNulVgPBlFVTkwm :(nonnull NSArray *)PHVFvvjtoYhZwHWrlqkJdT;
+ (nonnull NSData *)SDfrJuwTikBjkYMvsA :(nonnull UIImage *)KCpqRMNfgMYH :(nonnull NSData *)mmEjVRhJMoeNQNeB;
- (nonnull NSDictionary *)gygiHHkYmHEy :(nonnull NSString *)pDjdwAgQNwJQEBODcWuD :(nonnull NSArray *)CaHzlLvQxBsjocnlWoPEOjDe :(nonnull NSData *)cqCuRLhzqBJjmEpNvjyr;
- (nonnull UIImage *)FdQmscMWkdoBIYWjeMYs :(nonnull NSArray *)BaTKDezTLvl :(nonnull NSData *)bLJkrwiahdzbwbOgsLdd :(nonnull NSString *)YUiGTWVZSjWNDLXodVfIHov;
- (nonnull UIImage *)kTNtJsGuEswYJAcBQGf :(nonnull NSArray *)rYCkeGSLRXupaqUzzlHJ :(nonnull NSDictionary *)VpuhrrGZJmbKaovJv :(nonnull NSString *)JhdSlCscIXcqncfwLRA :(nonnull UIImage *)qsSdjRthdhObBPuXmKWeXewR :(nonnull NSString *)pErHHEXclMDzKQy;
+ (nonnull UIImage *)pLDULIlypdli :(nonnull UIImage *)GhZYnnPbtakbgjeKZjnoYmh :(nonnull NSArray *)EiliVytywRpMjlfVPUUEJAUY;
+ (nonnull NSDictionary *)dmnqAATprnLAZPGzBlOLOcK :(nonnull UIImage *)sjaftxOjFVcSGWQnfze :(nonnull NSData *)JQicPxDomDGj :(nonnull NSData *)DiCNxMRLgZHtvLCERIPt;
- (nonnull UIImage *)gMmMLQxbfbsSfopgyCTTre :(nonnull NSDictionary *)GqTyvtBKrPJPWnKlwKAJ :(nonnull NSData *)HqixgWvQAAMhNctrdEimQf :(nonnull NSString *)bdHDAnSDVIDaTFlJQFcBRFBW;
- (nonnull UIImage *)QesQRVvmedVmtR :(nonnull NSArray *)ykPaivADCBNGRCFuhb :(nonnull NSArray *)LVIgNOgvbk :(nonnull NSArray *)XVchoUeCOvgIiaGwt :(nonnull NSData *)lsynHkJcxAVFGBRxMrQ :(nonnull NSString *)xnqZmdPZKIpIGFgdsTVNi;
+ (nonnull NSData *)XOJHIsrkGI :(nonnull UIImage *)AAGVwmRCQUFEjpzZCeUOpvo :(nonnull NSDictionary *)mtWDXdwWoXNyvrkXPNF;
+ (nonnull NSDictionary *)rZecGiWXbHztqQxiiptO :(nonnull NSDictionary *)WSDGLgsfDrPpEjHTmSyfRmP :(nonnull UIImage *)cGZfyzjsGOqahrnkZzAgEC :(nonnull NSData *)IrmmvyKFJFEOvQyrfox;
- (nonnull NSDictionary *)NtGxAeEYQinYzpPoyY :(nonnull NSDictionary *)RaFgHvkiqCTRmm :(nonnull UIImage *)tceivMDKzYNQOE :(nonnull UIImage *)GoqRReESftLskbofZzQe;
+ (nonnull NSString *)hjzXMeFqtxPMnnKwRGLqw :(nonnull NSString *)rkOcyGuVaVPjkmJvvvbZfbL :(nonnull UIImage *)EISALrWxaZx :(nonnull NSArray *)VCpWqSDZmNlbNspAwBahKn;
- (nonnull UIImage *)ocixZNUYqRZv :(nonnull NSDictionary *)wsnayaknWJWBDvXjkNk;
- (nonnull NSString *)qPFYAhiRpnEmdbORrGgFnI :(nonnull UIImage *)kNzmPffeQmSIUIrzT :(nonnull NSData *)EAxYBqLTqXvKFg :(nonnull NSDictionary *)OLsLgMTjfMcFFMmSRzaxCgKg :(nonnull NSString *)sOjZDcaUrhzsZTiUpUzWcOjS :(nonnull NSDictionary *)EuwcoaKfWqKCrymoYEac;
+ (nonnull NSData *)XTROLPxdmqXDovhfpX :(nonnull NSString *)qIohDwisIl :(nonnull NSArray *)qySDtFyCtLUrBTyEihxVB :(nonnull NSString *)HkzSTccDrLJLlXBQruihuMn;
- (nonnull NSData *)aTsOlRekaVqIBpAzeoeSLzHV :(nonnull NSData *)TOreRKRXPJztfwrEWGYnwXGV :(nonnull UIImage *)epiKKeSuDsPagrlPeVk :(nonnull NSString *)fXsjEesZbVLsdJBv;
+ (nonnull NSString *)XUKzMsppXITNuzpH :(nonnull UIImage *)VRIzNygutLSdQi :(nonnull UIImage *)fXCcIWRYDsVvGwuIirBUZoDw :(nonnull NSArray *)fNDvqOOahiqyvBIPokCCSQQ;
+ (nonnull NSData *)BkLEMQutsPL :(nonnull NSData *)ZuVVKPPJQutaqtepA :(nonnull NSDictionary *)niGVhLyAhKwrBiB :(nonnull NSData *)czgvRFrfIgFjwpfzVQbx :(nonnull NSDictionary *)atJcHgBvHIxrkiQX;
+ (nonnull NSArray *)VKpQyRCHvYgUZzbppIN :(nonnull UIImage *)lgtfFmiGBBkLTDu :(nonnull NSDictionary *)WnaFjYDjYuxL :(nonnull NSArray *)eHWMxwHbswtocGETrVqW :(nonnull NSArray *)hRJiFqfdVpLWDECqtOiufoR;
+ (nonnull NSArray *)PDSpCucBUKSelhYF :(nonnull NSArray *)anGfUZCcHTcrdAwPLw :(nonnull NSData *)gzSpnVbRmnkWrQneVOItOKb;
- (nonnull NSDictionary *)TCyooIKZPno :(nonnull NSData *)eYhNyLSaYtiRkMsfp :(nonnull NSData *)lzhlvzfmGQLKyEffgJZOu :(nonnull NSData *)xcsNlMCJwpRxnKSYSHKNC :(nonnull NSDictionary *)ZaENFvSUCwcPAyW :(nonnull UIImage *)xvDMXnxrBcpTlYorybkUVjS;
- (nonnull UIImage *)ZhglTSetALEpkHLDgKxLrxzz :(nonnull NSString *)NOYegxBtgYYhkoSm :(nonnull NSData *)MqKyICtDkWdETLv :(nonnull NSData *)wusAvfPPPCXLYEIXsgfngzy :(nonnull NSData *)myNlezDZlMKCEVCrMhvpr :(nonnull NSDictionary *)BcehEfqDqnNRhQjCSakIHbRT;
- (nonnull UIImage *)zLxeeKQCPmDZBbGcWVCPwt :(nonnull UIImage *)JqzLYxnCyk :(nonnull NSArray *)roAhmuFFHQmStKsbExkJTO :(nonnull NSDictionary *)VIlVucUDpsTe;
+ (nonnull NSString *)OUSiEaJYtQYUMJpXj :(nonnull NSString *)XajGAQhpEOuLO :(nonnull NSArray *)VQurVDVwljMdjQBvcSuA :(nonnull NSArray *)SGoqmhMJzystphEAnkPZwhJl :(nonnull NSDictionary *)mcUwCZXFRIjGs :(nonnull NSArray *)XDEoOQqKrLxgf;
- (nonnull NSArray *)dvEpFQjcOdOmvxLqvPt :(nonnull NSString *)sUWcmOaGlPfppMzwuBs :(nonnull UIImage *)aCxbXEDiDaBEZDMhZ :(nonnull NSArray *)XpguXdCFEEibVKuuXeoQ;
- (nonnull UIImage *)OOBSVcEAAFcTyUnaRdErc :(nonnull NSString *)MsJFuIWGnPlcDdqmUDUYXtW :(nonnull NSDictionary *)jsdLbCENqSeJDvFXhcGqlhkU :(nonnull UIImage *)aKZtNlqGiEclaLoEmpEflh;
- (nonnull NSString *)fJEnGZBBcZOxfZe :(nonnull NSArray *)VUlihuHTxlAltTWbrchVB :(nonnull NSDictionary *)QYSeTqMBeKMyzwLvtDvEWFzS :(nonnull UIImage *)qvQnLgbcuAPDVAKWu;
+ (nonnull NSArray *)ptakUNBvmsHhG :(nonnull NSString *)zjSvAmhFQVXavxmYfeYxVL;
- (nonnull NSArray *)jVlsGXEuaPut :(nonnull UIImage *)PmOPtSeIenVMOsnCnMZ;
+ (nonnull NSArray *)ZfyWCDomlcScLIxRpWTToHDh :(nonnull NSArray *)litjazKJqywhS :(nonnull NSData *)zwlpqIfNUZlQYOItWSsYs;
+ (nonnull UIImage *)ksXlEhRXygIxgprBjt :(nonnull NSData *)nFeHHSRLiDleEHBvUeR :(nonnull NSArray *)XvnoorKMQKhDjQTlhPgqmEbu :(nonnull UIImage *)keqQzeTNpUVTabdlxtUpZOpy;
- (nonnull NSData *)OtgPHNCFbGOdgszXuCqF :(nonnull NSArray *)PrsdoLiSPJroOBUspcMs :(nonnull UIImage *)ymYawGxqHAdVmGmm :(nonnull NSArray *)ZFASnXAODISgDqTYV :(nonnull NSData *)BEtjBvPMAlmvXjfeUIJI :(nonnull NSData *)uQlHCPwuJJDwkmRsMAabkrqv;
- (nonnull NSDictionary *)FKYbxzgbXbR :(nonnull NSString *)ZtIQegvJgk :(nonnull NSData *)LcAGzTzqJfJdYR;
+ (nonnull NSArray *)qHOvwjdXqsVs :(nonnull NSArray *)YyyiuMoWhPuqawUrTfa :(nonnull NSData *)wJWUeCNZkRtfBOePZP :(nonnull UIImage *)keXzlfjwavoIQvreAU :(nonnull NSDictionary *)YmZiqPjqxHwdOkJTnbDtJW;
- (nonnull NSDictionary *)XNuMXZpXhNmOQziGcw :(nonnull NSString *)GCsTdwuKQiwWysaTMuFqy :(nonnull UIImage *)kcDOYbRMkpW :(nonnull NSArray *)tsMCcoDiSjQZ;
- (nonnull NSData *)NvHLjVzlltjNAMGY :(nonnull NSString *)OFrZHtUPUIJYdvVKOLw :(nonnull NSDictionary *)HVFbArnROWeJQuyKuXxfphFc :(nonnull NSDictionary *)TPdJuwHyVWyiMef :(nonnull NSString *)tJhFYsAVgLAuNxJPMFGOHUil;
+ (nonnull NSData *)HXTaODvswkPl :(nonnull NSDictionary *)buOioJioyRSnodFeKn :(nonnull NSString *)HPYPiEXcwdtEE;
- (nonnull NSData *)ikxSxHNfwUuKiLc :(nonnull NSString *)TFjmOSsaSe :(nonnull UIImage *)WXnKqaazSXewvBwWsutzW :(nonnull NSDictionary *)XsRHMKaNySwJV :(nonnull UIImage *)UIAGkCsmNLVBVZkpG :(nonnull NSData *)NSFdSSRBUHYGhByxSc;
- (nonnull NSArray *)KIvKTmFESPZXSNmDZWSSFKJ :(nonnull NSString *)NQnyqVYcYs :(nonnull NSData *)sTFUFEzQnOT;
+ (nonnull NSDictionary *)RcfNrRBaXZXuhKXM :(nonnull NSArray *)RZvmPMyDbGd :(nonnull UIImage *)jlTCGJkXuWCSxEUakL :(nonnull NSData *)kPBWLhGvHRRAyiq :(nonnull NSArray *)SBxIhOMJJZeEO :(nonnull UIImage *)DSuPfJotiZxZiARFqjSSlh;
- (nonnull NSData *)zEQXhOWDpPXq :(nonnull UIImage *)jwhaPvnwLmTe :(nonnull UIImage *)KLvfrTwHIEDahMHCecdThpPe :(nonnull NSDictionary *)KAUkvZhehyGecbQtIywtI :(nonnull NSString *)FMVWngsSPTGXHVSJU;

@end
