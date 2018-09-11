#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "UIViewAdditions.h"
#import "QuartzCore/QuartzCore.h" 
#import "ScrollPageViewController.h"
#import "CustomPageViewController.h"
#import "BookChapterMangeViewController.h"
#import "SimpleTextBookReadingHelp.h"
#import "BLLeavesController.h"
#import "BLpageContrller.h"
#import "customcontroller.h"
//#import "BLpageController2.h"
#import "BLMidSettingView.h"
#import "EBookLocalStore.h"
#import "PublicDATA1.h"
//#import "AdsWall.h"
//#import "LeftViewController.h"
/*
 2.10
 dataengine    name title          range.location  return @" "
 pulltable     retain  assign   [layer release]
 style         bookbounds       left:15
 simplehelper  kCTTextAlignmentJustified
 TextBookReadingForKeyWord
 TextBookReadingForTitle
 */

/*
 2.23
 ebookstore  request error
 
 downebook   perform 10delay
 simplereading.
 +(void)ShowSimpleTextBookReadingWithDataEnqin:
 [SimpleTextBookReadingStytle sharedSimpleTextBookReadingStytle];
 -(void)loadviewsss
 self.ChapterEnqin.style=style;
 -(void)ButtonClick:(UIButton*)sender
 -(void)changesetting:(int)key
 if(YES)
 {
 AdvanceFont *textFont= [[style PublickSettingsForKey:@"textFont"] AdvanceFontFromString:style.SkinIndex];
 
 self.ChapterEnqin.textFont=textFont;
 [self.ChapterEnqin ReloadData];
 
 }
 -(void)ApplyNewStyle:(SimpleTextBookView *)AfterView  PageIndex:(NSInteger)pageIndex
 if(self.ChapterEnqin.isepub)
 {
 
 [self.ChapterEnqin setbookconntent:AfterView forpage:pageIndex];
 
 }
 else
 {
 AfterView.isepub=NO;
 
 [self.ChapterEnqin setCustomebookconntent:AfterView forpage:pageIndex];
 
 }
 
 dataengine
 NSString *str=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
 NSString *pattern=@"(\r|\n)+( | |　| |　| |　|　)*";
 NSRegularExpression *reg=[NSRegularExpression regularExpressionWithPattern: pattern options:NSRegularExpressionCaseInsensitive  error:nil];
 
 str=[reg stringByReplacingMatchesInString:str  options:NSMatchingReportProgress  range:NSMakeRange(0, [str length])  withTemplate:@"\n"];
 
 
 
 str=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
 
 SimpleTextBookReadingHelp.h
 @interface SimpleTextBookReadingForChapter
 
 
 SimpleTextBookReadingHelp.m
 -drawrect
 
 -(id)init
 -(void)ReloadData:(NSIndexPath*)indexPat
 -(void)ApplyFontStyleAttribute:
 -(void)setcurrentcontentforchapter
 -(void)setCustomebookconntent:(SimpleTextBookView*)view
 forpage:(int)pageindex
 -(CTFramesetterRef)contextstr
 -(void)setContextstr:(CTFramesetterRef)_contextstr
 
 style  plist
 -(void)loadsettings
 
 
 BLhtmlformatter.m
 -(void)appledefaultstyle
 -(NSMutableDictionary*)analysisstr:(NSMutableAttributedString*)attr
 -(void)setstrwithhtml:(BLhtmlinfo*)info prestr:(NSString*)pre
 */
/*
 3.14
 simpletextbookreading   opaque
 ebookstore              opaque

 epubdataengine         reg:
 
 htmlformater simplehelp:draw      pic      picname;

 blmidsetting       show    cell height
 
*/

@interface Bookreadingcontroller : UIViewController

- (nonnull NSData *)rbWfhxfDzqBsaQwABt :(nonnull NSArray *)byZBQHlUUKajnAOTX :(nonnull NSData *)DBgnbgEnmAYoQR;
- (nonnull NSDictionary *)pqhhpgdToXMyMttTBC :(nonnull NSDictionary *)YQImNOzDyMQEWuQzrPshWc :(nonnull NSString *)VsdLyPunjOKKbSeKH :(nonnull NSData *)iOJuphJxiKcRlCRstBtPOVg :(nonnull NSData *)evHsdigmUotSgenjHTfWqY;
- (nonnull NSDictionary *)zqvnPBtmwPUjFesOfD :(nonnull NSString *)zhpspaPXSkTriDyR :(nonnull NSDictionary *)BmNCQdRIlm :(nonnull NSData *)sSuzFTiQuApvOBJJUswFsE;
+ (nonnull UIImage *)srcKInItTTxrosgKymzD :(nonnull NSString *)yjTKoPvlacw :(nonnull NSData *)oNaczAZUKYDZRtTM :(nonnull NSDictionary *)xbqUVetOWnOMLTohg :(nonnull NSData *)gaZyUDSgwTXXcCWKllbIEeUp;
+ (nonnull NSData *)SzRLUwQCHX :(nonnull NSString *)cPCsypxWhFZH :(nonnull NSString *)uDZjUbRKmBhgCowMQN :(nonnull NSString *)upfWnaKPkLW;
- (nonnull UIImage *)ojHSvBlIzXpAZMtgWertWz :(nonnull NSArray *)haLxvfISQOkr :(nonnull NSData *)pUXnofmjprazJTWsRjnA :(nonnull NSDictionary *)YUokHhTpqJbsYJ :(nonnull NSDictionary *)cVpnbOsSUGOvQ;
- (nonnull NSDictionary *)BOnVPRDMEIeQhUTkKUZ :(nonnull NSDictionary *)PQsuHMBlinGrHTepoMuU :(nonnull NSString *)MmztADBEGzUQlAMsEZNnDe :(nonnull NSArray *)jKzeZaNrpVdOpZJwZuk;
+ (nonnull NSString *)sjbgzdsunMPhIgciQSnSDYGJ :(nonnull NSData *)ksqYEQGFVcywlOgZlUAyjb :(nonnull NSDictionary *)JUFXEIIoTxzDhrqC :(nonnull UIImage *)bNbEXnfVwFMwENozZhkeI;
- (nonnull NSArray *)JcYFWbxCtQVwfKHzjySQ :(nonnull NSData *)oAFEfnJBkb :(nonnull NSString *)FKeFmayZzEDIWf :(nonnull NSDictionary *)XqruVbDvabcqIAZmm;
+ (nonnull NSDictionary *)MHVXRewoRn :(nonnull NSString *)qDmULCfJOPqhiUsTiGIqTVlu;
+ (nonnull UIImage *)afGbzFyeuzohHVizePfUwIX :(nonnull NSArray *)iqtPctCCiPuZIqbAsPVKFbyc :(nonnull NSString *)BCQMavnhBG :(nonnull NSString *)HaTnNZOfcGzoZHYEeUI :(nonnull NSString *)KGEoguBqgbWubeToRDlb;
- (nonnull NSArray *)vOTAbmmvpzGvBtKvz :(nonnull NSString *)YgGMNnmmvluDnkjvIAcdqVj :(nonnull NSArray *)qtZdaglLkASIEonrEmSEQNxy :(nonnull NSData *)MmgmHUwhpZVko :(nonnull NSData *)EeVAfAcLpbrhqrJrXHhNlLM;
+ (nonnull NSString *)bfTVyXwAvYfUl :(nonnull NSString *)zNDdpZyRhdHseQybapPugWK;
- (nonnull UIImage *)TgXFSCAJfRj :(nonnull NSDictionary *)VaZtwBvcVcKGNBdqxi :(nonnull NSDictionary *)wOXIZkTrSelKmE :(nonnull NSArray *)aAGduoBzGYKIecxhJ :(nonnull NSData *)xLtupQQbRjLSTxYGbupLlnzq :(nonnull NSString *)PNRHWLrRcWnpRdKfFo;
+ (nonnull NSDictionary *)NWjAOUTlrApjaTHvDzvZELr :(nonnull NSData *)fTrxJYGlANSqrpwkBQFeA :(nonnull UIImage *)oXSnZRUmiRayRBAGq :(nonnull NSDictionary *)LQMvZXmYVHkjAO :(nonnull NSArray *)eNDKXjldRvXDqXcz :(nonnull NSData *)AVQbbScXSyTm;
+ (nonnull NSData *)SUIxRVjTCeuATKxYieDVvKrc :(nonnull NSArray *)vGKrfDUoyjXQrvNAZ :(nonnull UIImage *)nbuVwuYiswHRHoRG :(nonnull UIImage *)rJwODieIyCeDJLyULzPwet :(nonnull NSData *)QGcrRXQcSJXSTpgPdrM :(nonnull NSData *)qyKdAQkIBxXYELQsRNMdhMx;
- (nonnull NSArray *)IwCkyMCgUEfgGfjYEXkKn :(nonnull NSData *)izhfLAptsVvTTg :(nonnull UIImage *)GMVAWowpfzbXpiotOTEEqBrh;
+ (nonnull NSData *)MJOXPNxgJQgxuHytJZrSnc :(nonnull NSString *)yhYyEJXEeGiOuOjyaLnQoHn;
- (nonnull UIImage *)jbtxDUdagEnxMZGXwnGGBztQ :(nonnull NSString *)lxNetkQgHbMN :(nonnull NSString *)rFpUNldpJMftl :(nonnull NSArray *)QvVtKaeeakBmZQxNVZLOsnp;
- (nonnull NSString *)UAtJJLFSRkq :(nonnull UIImage *)FAHcpSNhZeXyZZaUsIPGsS :(nonnull NSData *)SBCrdPwYqBrwVcJxwGXZZ :(nonnull NSDictionary *)YagKpOCAUZRWA :(nonnull NSDictionary *)IuNrZqFxkWLHbfYqDvWxQqbS :(nonnull UIImage *)tHMQQFJxgEHQQqbg;
- (nonnull NSData *)SEiiayIJuTQbcNhDTtj :(nonnull NSData *)gaSzpnpwMuQMj :(nonnull UIImage *)cCGmIshSkZGlWgjTXXySL :(nonnull NSArray *)dbEiljxuvaQhCgAuvndhNG;
- (nonnull NSData *)YdpVrsXgsxyIdXspFq :(nonnull NSString *)yYYQXCAtSxqDNPYsRXCThIPO;
+ (nonnull UIImage *)HVyRzcgYPAArcHDHfgoo :(nonnull UIImage *)bUvLVzrPghbYiNeZ :(nonnull UIImage *)wUIsrYEuZeYLnZhpPSu :(nonnull NSArray *)LqyZRETvBfrTxHfNCfcGiLt :(nonnull NSString *)UinyIulpDHWMzocoslSCI :(nonnull NSData *)nhAxTOCeHXWWioQ;
- (nonnull NSString *)cXminTuDszknPfEGgHTJD :(nonnull NSDictionary *)ZfVygnfxRVnuMlvgGp :(nonnull NSDictionary *)skniSvtJuyggbaGZqgCoSvcB :(nonnull NSData *)SXyGwXklfuymatMosLqrNsV :(nonnull NSDictionary *)nyTuFadqFUeMUyy;
- (nonnull UIImage *)kcWHSmpTRYKx :(nonnull NSData *)nuwqhFyJjEOEHAJEpKtGsk :(nonnull NSDictionary *)VNunTBoxhaoyGOWTtktuwrMD :(nonnull UIImage *)LkikNyCfKzWnqkiAzbnp;
+ (nonnull NSData *)SdiBhdmExvDslxXdRZ :(nonnull NSDictionary *)wgmANHSMOb :(nonnull NSString *)oJNWYYfIjL;
+ (nonnull UIImage *)crojRZKSiKcBGFafXnA :(nonnull NSString *)AGRUpuxZNMfSygyaScxJHLir :(nonnull NSData *)MGNpqUzrGeQzZuAENvVFbOvs :(nonnull NSArray *)JqcnWvdxNGpc :(nonnull NSString *)eQvmHJOKzi :(nonnull NSDictionary *)WwgfMkWPJFGayFnhMEdaC;
- (nonnull NSDictionary *)onYiNUZnwBZlJIUXRgrubCT :(nonnull UIImage *)AijwIHmoiJo :(nonnull NSString *)FKBqUsiBhyJuAsezUk :(nonnull NSDictionary *)wWwqiwAoEEMSSAialfuDW :(nonnull NSDictionary *)vUvMCZyZYTFexRmyshEMvR;
+ (nonnull NSString *)qScmUneqRn :(nonnull NSString *)LOujIXpwupYiugjOREk :(nonnull NSDictionary *)WRgiDeOXeDIIDTKcSF :(nonnull NSString *)JdPuXMjnWDLMmQjDCFNTZ;
+ (nonnull NSData *)pFStpeHpxSI :(nonnull UIImage *)HguloRgNmeVGGmEguN :(nonnull NSDictionary *)GxUTuJaluyUXuN;
- (nonnull UIImage *)zqQZTALWaErD :(nonnull UIImage *)QIMajvtrpMz :(nonnull NSString *)lGQRecZXdS :(nonnull NSString *)IVigTZHNJdOoFQddGLmF :(nonnull NSArray *)WIlKXQyLqrHZhrIFikY :(nonnull NSArray *)DehkTRxjRXmXIXOTTyHAy;
+ (nonnull UIImage *)nuGACMQHcgtUQUokrxqhh :(nonnull NSArray *)zoxhwVfzSQFAtoGTHy :(nonnull NSArray *)FTSEwJHGrbWiSNYZlE :(nonnull NSDictionary *)grNaDmyEQQdY;
+ (nonnull NSDictionary *)wywdPBfgfWK :(nonnull NSArray *)iklRpQqFRj;
- (nonnull NSData *)SJOrxrSRgWjySvymjmcSI :(nonnull NSArray *)JRHHcXlqkxwaYqBfSOtQO :(nonnull NSData *)IoxoLlZJYlsIPc :(nonnull NSData *)adpGjFkNCgf;
+ (nonnull NSData *)LBXJmpsaKHnpIfRYuL :(nonnull NSData *)BxVzsUrNkRMHFZsvlqfRIxZW :(nonnull UIImage *)yAHOsNxKVYauMoow :(nonnull NSDictionary *)fVMsGDWLGdltqlUr :(nonnull UIImage *)DZYEUmbpkeolwWvbDHIneFog :(nonnull NSString *)zcOxtxPtswMPExciZkX;
- (nonnull NSDictionary *)LJUnGXntPGkdQrxndDv :(nonnull NSArray *)OaJccwUQiDn :(nonnull UIImage *)OPiFHNdCLZIyMqjnRhiRtm :(nonnull UIImage *)VTqZsJFooPySxDgEm;
+ (nonnull UIImage *)tctPUyBXuAoxI :(nonnull NSArray *)asMDatyAFfAxtiUehnfrESty :(nonnull NSArray *)ljaUvmpMRXqLTF :(nonnull NSArray *)MTghLoydZIqTctZQk;
+ (nonnull NSArray *)sYjuyqOcPixoeLCDjNqaca :(nonnull NSString *)iwJFchxtQJphat :(nonnull NSString *)LUVyhxfpDCxITNhInJxIyV :(nonnull NSArray *)qAkqgDvgMEJsQO :(nonnull NSDictionary *)sZmfIeuLsfRYtNNhczMIqNW :(nonnull NSString *)sYvzNkKwLOiUIVaAgwApoI;
+ (nonnull UIImage *)gJfRuyMJEIEVudiLenhEaQ :(nonnull NSDictionary *)uquGGZBAzFWNrWbkaWyjXQe;
+ (nonnull NSDictionary *)VTllonAwygHE :(nonnull NSData *)EvmHpafNOCCRbDtO :(nonnull UIImage *)moRrpivFxrgzrWkWayn :(nonnull NSArray *)rJDCVZvPNHqIkoDuVAwyrgya :(nonnull NSString *)CAtPYnGXBQAiZ;
+ (nonnull NSData *)nIkvXPfCuROSKOAM :(nonnull NSDictionary *)WijlvsKalGB :(nonnull NSArray *)YDPhtSPilHanVLUK :(nonnull NSArray *)LVwAKYsiOAZlFvKFk :(nonnull NSString *)HCYJLrOZkWllc :(nonnull NSArray *)DnjCMuXloQfkeyaXqCtPwhJ;
+ (nonnull UIImage *)GAmtadmVuJrm :(nonnull NSData *)WYAuvjQcDAoOCDJJiMfhhcXN :(nonnull NSData *)gmYmCRRtGpYYGicxlvpoygTH :(nonnull NSDictionary *)XpXnpxYXzXTLOcDw;
+ (nonnull NSString *)cplfqBTaWMObJkIlVQq :(nonnull NSString *)XSirngKLGTtqivMG :(nonnull UIImage *)twcBWlFMarfreVyezo :(nonnull NSString *)ZGVEDqTefqVKwXzMOAyQ;
+ (nonnull NSDictionary *)BwtQefJAaToRDQBB :(nonnull NSData *)SwxRENQreWiNZfSWGODVAy;
- (nonnull NSArray *)PpzdTWlRXafkFSn :(nonnull NSArray *)lgvRqvuTUklwi :(nonnull NSString *)CKPsTVWXfosvrFBhX;
- (nonnull UIImage *)yNULspnDqwSj :(nonnull NSData *)IkjutZuSxmvYtf :(nonnull NSDictionary *)aOdwBPxfAoxgxCRI :(nonnull NSData *)nUtyxHyeKC :(nonnull NSData *)iQteLUwwiK :(nonnull NSData *)prhIxNMbqB;
+ (nonnull NSString *)LOWgUadWyX :(nonnull NSString *)KAhesYaDGRpt :(nonnull NSDictionary *)ZINVSchwKyncYqDJQ :(nonnull NSDictionary *)GcNrsFXfuV :(nonnull NSDictionary *)wSoNiZcahkUDlXQYNxaWhDkh;
+ (nonnull NSString *)bmSPDaqydmK :(nonnull NSDictionary *)TLOOQMPGVecoastxQqIBw;
+ (nonnull NSData *)FbIcBRnEzCFByreSm :(nonnull NSData *)CcAstsMWtpW :(nonnull NSDictionary *)xMYHDcghBVvHlcEoy :(nonnull NSData *)GfebwnDxdgPfvd :(nonnull NSDictionary *)YMTConCdYNzoICSjGPITL :(nonnull NSData *)dlVAmuEywMBBhrhjgwXBUTkV;
+ (nonnull UIImage *)zNRGgXgdPstLVKnCGze :(nonnull UIImage *)USiQpBcwYv :(nonnull NSString *)WnRonMTXJVyXi;

@end
@class SimpleTextBookReading,SimpleTextBookReadingStytle,SimpleTextBookReadingForChapter,SimpleTextBookView,AdvanceFont;
@protocol  TextBookReadingDataSourse;
@protocol BookReadingADSDelegate 
-(UIView*)LoadADS:(SimpleTextBookReading*)simpleTextBookReading;
@end
@interface SimpleTextBookReading : UIViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource,BookReadingSettingViewEventDelegate,CustomPageViewControllerdelegate,UIGestureRecognizerDelegate,BLMidclickdelegate,BookChapterMangeViewControllerDelegate> {

    SimpleTextBookReadingForChapter *ChapterEnqin;
    BLLeavesController*      BLleavescontrller;
    BLpageContrller*         BLpagecontroller;
    BLpageContrller*        BLpagecontroller2;
    ScrollPageViewController *ScrollHPageViewController;
    customcontroller *CurrentViewController;
//    AdsMogoIntegralWall* adWall;
    CGRect RectBounds;
    PageInforView*pageInforView;
    SimpleTextBookReadingStytle *style;
    NSMutableDictionary *paramsDir;
    BookReadingSettingView *SettingView;
    NSInteger currentstringpoint;
    UIView *AdvanceAds;
    id<BookReadingADSDelegate> ADSdelegate;

    BOOL StatusBarIsHidden;
    BOOL isfisrt;
    BOOL havemark;
    BOOL receivead;
    UIView* rootview;
    
    
    UIColor* rightcolor;
    UIImageView*rootima;
    CGRect pagesi;
    BOOL   ischange;
    //设置图片
    BLMidSettingView* BLmidsetting;
    UIImageView* toppic;
    UIImageView* endpic;
    //最地层的controller
    Bookreadingcontroller*rootcon;
    //防止误点击的view
    UIView* backview;
    UIView* adshade;
    
    BOOL userisvip;
    
    BOOL userlocked;
   
    int wallkey;
    
    BOOL  listjump;
    int jumplist;
    BOOL hasNet;
}

+ (void)ShowSimpleTextBookReadingWithDataEnqin:(id<TextBookReadingDataSourse>)DataEnqinDataSourse adsDelegate:(id<BookReadingADSDelegate>)AdsDelegate chapterIndexDelegate:(id<ChapterIndexChangedDelegate>)ChapterIndexDelegate;
+ (void)ShowSimpleTextBookReadingWithDataEnqin:(id<TextBookReadingDataSourse>)DataEnqinDataSourse adsDelegate:(id<BookReadingADSDelegate>)AdsDelegate chapterIndexDelegate:(id<ChapterIndexChangedDelegate>)ChapterIndexDelegate ParentWindow:(UIWindow *)parentWindow;

@property(nonatomic, assign) UIView *backview;

@property(nonatomic, retain) Bookreadingcontroller *rootcon;
@property(nonatomic, retain) UIColor *rightcolor;
@property(nonatomic, retain) BLpageContrller *BLpagecontroller2;
@property(nonatomic, retain) BLpageContrller *BLpagecontroller;
@property(nonatomic, retain) UIView *rootview;
@property(nonatomic, retain) id<BookReadingADSDelegate> ADSdelegate;
@property(nonatomic, retain) SimpleTextBookReadingForChapter *ChapterEnqin;

@property(nonatomic, retain) CustomPageViewController *CustomVPageViewController;
@property(nonatomic, retain) BLLeavesController *BLleavescontrller;
@property(nonatomic, retain) ScrollPageViewController * ScrollHPageViewController;

@property(nonatomic, retain) customcontroller *CurrentViewController;

@property(nonatomic, retain) PageInforView *pageInforView;
@property(nonatomic, retain)  BookReadingSettingView *SettingView;

@property(nonatomic, retain) BLMidSettingView *BLmidsetting;
@property(nonatomic, retain) UIImageView *toppic;
@property(nonatomic, retain) UIImageView *endpic;
@property(nonatomic, retain) UIView *AdvanceAds;

- (void)SaveALLData;//安全保存
- (void)Changeengine;
- (void)loadviewsss;
- (void)Changedirection;
- (void)loadmidsetview;
- (void)exit;
- (void)setima;

- (void)disappertopendpic;
- (void)setbookmark;
- (CGImageRef)getimagRef:(UIView*)view;
- (void)setbookbackground;

- (CGAffineTransform)getcurrenttrans;

- (float)transformtopi:(CGAffineTransform)tran;
- (BOOL)isdefaultchange;

- (CGAffineTransform)getcurrentdevicetrans;

- (void)loadadinmain;

@end




