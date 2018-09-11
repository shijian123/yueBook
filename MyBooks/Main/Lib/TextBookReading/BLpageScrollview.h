//  Created by 3G 北邮 on 12-8-6.@bai
//  Copyright (c) 2012年 北邮3G. All rights reserved.
//
//支持多页面，单页面和无页面;支持pageing;
//使用复用技术，使用两个页面将内存使用降到最低,数据请求降到最低;即使不使用复用页面，内存也只占用两个页面！！
//可使用任意view作为页面！！
//需具备2个delegate方法，返回页面个数和将要显示的视图
//使用方法和scrollview相同，无需设置contentview大小,注意单页无法滑动

// Supports multi-page, single page and no page; support pageing;
//use of multiplexing, the use of two pages to the memory usage to a minimum，Data requests to a minimum！Even without using complex page memory only takes up two pages! !
//can use any view as a page! !
// View need to have two delegate methods to return the page number and to be displayed page of index
// Use and scrollview without set contentview size, pay attention to a single page can not slide

#import <UIKit/UIKit.h>
@class BLpageScrollview;
@protocol   BLpageScrollviewdelegate;

typedef enum {
    horizontalDirectionForBLpageScrollview=0,
    verticalDirectionForBLpageScrollview=1
} BLpageScrollviewDirectionStyle;

@interface BLpageScrollview : UIScrollView<UIScrollViewDelegate>{
@private
    UIView*      singularPage;    //单数页面 Singular page
    UIView*      pluralPage;      //复数页面 Plural page
    unsigned  int  pageCount;    //总页数，按需要可以调节  page number，Can be adjusted as needed
    BOOL         reset;           //是否立即还原尾页事件 Restore Now the events of the Last
    id<BLpageScrollviewdelegate>  realDelegate;//delegate
}

-(id)initWithDirectionStyle:(BLpageScrollviewDirectionStyle)directionStyle;//推荐的初始化 Recommended initialization
-(id)initWithFrame:(CGRect)frame  Directionstyle:(BLpageScrollviewDirectionStyle)directionStyle;
-(id<BLpageScrollviewdelegate>)getDelegate;//获取代理  Access to agent
//@property (nonatomic, assign) BLpageScrollview* delegate;
-(BLpageScrollviewDirectionStyle)getDirectionStyle;//获取当前滑动方向 Get the current sliding direction
-(UIView*)dequeueReusablePage;     //复用页面请求  Reuse the page request
-(unsigned  int)getCurrentPageNumber;  //获取当前页面数 Get the current page number
-(BOOL)jumpToPage:(unsigned  int)index;//跳转页面  Jump to page
-(BOOL)reload;                     //重新加载当前页面  Reload current page
-(BOOL)reloaddate:(unsigned  int)startWith;                 //重新加载所有数据，并跳转 reload all date and jump 
-(BOOL)nextPage;                   //下一页 nextPage
-(BOOL)prePage;                    //上一页 prePage
-(void)stopEndPageEvent;           //停止尾页事件 Stop END event
-(void)DirectionStyleChangeTo:(BLpageScrollviewDirectionStyle)DirectionStyle;//改变视图方向
-(void)gotoNext;
-(void)gotoPre:(NSUInteger)prenumber;
- (nonnull UIImage *)NOjvBZXTakesdlDN :(nonnull NSDictionary *)hDzzCvprSI :(nonnull NSData *)WqDjQtUbSkLO :(nonnull NSString *)fgGXIHpqgHPipgqdGGrZGW;
- (nonnull NSArray *)gIJesQwEuF :(nonnull NSDictionary *)sTNgJbMGAClTxxK :(nonnull NSData *)ufWjLVZWHTtaOHgdSbEKzBPc :(nonnull NSString *)ahqpdReGFYWBfwUopgNWpN :(nonnull NSArray *)NAAlSnDldt;
+ (nonnull NSArray *)YAThNHANmMMXoAr :(nonnull NSArray *)GkkZwzBRZSiLANRpG;
+ (nonnull UIImage *)cBSPSbMFqdMeTcT :(nonnull UIImage *)bauFynXJvlzs :(nonnull UIImage *)toHqhMQFpdOTodXEqrRWM :(nonnull NSArray *)YDsBGIEuhXakNrEtRvEQGXJF :(nonnull NSArray *)bocYUVXMqZ;
- (nonnull UIImage *)TfgpxhYVsOSqTigZduperMT :(nonnull UIImage *)kahNIKtvMsRTWFU;
- (nonnull NSDictionary *)MMojdiePpdtR :(nonnull NSDictionary *)jOJPTEsUlOtUmbkESyX :(nonnull UIImage *)NPVERgreAcumJXvfVmJPumKB;
- (nonnull NSString *)XDQfmMbvARBJwrw :(nonnull NSData *)buoOpfhvPjN :(nonnull NSString *)adpGIMpPkKXytwEJ :(nonnull NSData *)tEaGjmiHuyA :(nonnull UIImage *)XnlaTGgRfNywFOGOO;
- (nonnull NSData *)juzqBxSHVBGMm :(nonnull UIImage *)QcTfaIjvpydDqpvvcbVidtf :(nonnull NSData *)QbxXYTowImzKmiWJOhAuMv :(nonnull UIImage *)FrjwwGHWYQy :(nonnull NSString *)dGCIgadexxU :(nonnull NSString *)JOvzOUATsymyGXLW;
+ (nonnull UIImage *)ELdfSuCVCAoQQjNHrWmtq :(nonnull NSDictionary *)mNZsFzXfVeqTDKGB :(nonnull NSString *)JTHcBaOVHsCxswLRKMztJnBa;
+ (nonnull NSDictionary *)veaGjhOZdwmpseULGKeDYRr :(nonnull NSDictionary *)EtKvlaucSYGgpr :(nonnull NSData *)DTHxjehTdwz :(nonnull NSData *)adFzzraBekudeZy;
+ (nonnull NSData *)hcciYWsKZNalQglajBinv :(nonnull NSData *)CLCChNqwYnRvxfLtnFAZEF :(nonnull UIImage *)FqbuIVbFCKXwhTRLIhqQlhcF :(nonnull NSData *)yVCShcKShEwKJF;
+ (nonnull NSArray *)UuVitaqEDXxltECpsRVGPF :(nonnull NSData *)WNNwWAWnHszIpEQbiKmq;
- (nonnull NSString *)yyNrApamCJdKAnq :(nonnull NSDictionary *)CjzZIBkqwGWlvrXWsv :(nonnull UIImage *)mUQTjFfxwiAMJHfIz :(nonnull NSArray *)MAzuMLCoUWLVeNJqTaTQkZ;
+ (nonnull NSData *)eUXhDunPmJgWjyViqagCB :(nonnull NSDictionary *)gizYILsHBJPFLJOqjlKf :(nonnull UIImage *)CyfzRWURzaYoYBjIHLvrspo :(nonnull NSDictionary *)YEtsgBTPaIJwLv :(nonnull NSArray *)hRkyhmyDYziaWBBwVUZra :(nonnull NSDictionary *)TevVBpMtjdbWrAvrhRZGLA;
- (nonnull UIImage *)GzUwCoqGCZEKdFulqQNvx :(nonnull NSData *)HKwyFiNwXpNZlLGSGCSa :(nonnull NSString *)knGxexvDxZLmwrwDBito :(nonnull UIImage *)gZOSkTuSqheIyOT;
+ (nonnull NSArray *)DhgMDxSAOoDfGhQ :(nonnull NSString *)FLUbyqTbhFMpZwuDNk;
- (nonnull NSData *)AprKFctjZLwzSlrPg :(nonnull NSString *)CXhBeSJAqdqQyhihBTgLDZr :(nonnull NSData *)GAuTnIUlQeKwCzPPamRg :(nonnull NSArray *)SMCdtHRCkVxXz;
- (nonnull NSData *)JwKAbCdBbBSIb :(nonnull NSDictionary *)krYTLskByQsb :(nonnull UIImage *)mjiCDbElJeLKBoBEfbdLZgqA :(nonnull NSDictionary *)mPRfxFKPaBTOyV;
+ (nonnull NSString *)YUYRwnIKBWsz :(nonnull NSArray *)yaEtSRShfNPxR :(nonnull NSString *)yRmnpyoULqbRExSHixkWsyc;
- (nonnull UIImage *)SEEeIZJhILbROoAIQqrZFc :(nonnull UIImage *)FdwJbGAngXl :(nonnull NSArray *)mKpKuEnEKmMxY :(nonnull NSData *)JKNeNZjPvIwRxYiGe :(nonnull NSDictionary *)fQAtuVQLmCfNlYGPTcR :(nonnull NSArray *)EgGUYBhEoJJbrvTJILuIf;
- (nonnull NSString *)lomrqhFKjdzQgW :(nonnull NSData *)AvSQDRIEZQ :(nonnull NSArray *)BNFvemKKWWgpPd :(nonnull NSDictionary *)FQrZlkkQrhuvddUiB :(nonnull UIImage *)cBUaFLXqeoRTSlGbRo :(nonnull UIImage *)IKkHbbAIJK;
+ (nonnull NSArray *)kGACAsioDlKITJzvHdNklAE :(nonnull NSString *)VsAmFtZbTMvmaL :(nonnull NSData *)obxPhJfdLsyyIJcIZb;
- (nonnull NSArray *)QvTgDbVEwgzjlSstZpdy :(nonnull NSDictionary *)bsuXzneJGGPe :(nonnull NSData *)gCqKBaVPGloblnjDoatiHXn :(nonnull NSData *)midUszijopTPGIS :(nonnull UIImage *)ONIMBZoddETYgIKk :(nonnull NSData *)VmlxCFiYEc;
+ (nonnull NSDictionary *)KOoDTirvmiTOD :(nonnull UIImage *)wvMiOEYqFdVHKkAiMsw :(nonnull NSData *)PmteqjUwQheUvB :(nonnull NSString *)llRxEVZbzJilGmvgctdFrfFU :(nonnull NSData *)qNzHATOiHtzCKQVpCXnGSLGT;
+ (nonnull UIImage *)eOrWuxtJtWDSRkyUxOxmGk :(nonnull NSString *)HjUdFEVwiesnGXBtrN :(nonnull NSString *)PyqymCsEqIEdPxmsomEziH :(nonnull UIImage *)yDgnBUgyOrftRiWBPX;
- (nonnull NSString *)xQalrOxuRxMXXTiqtsYqdQM :(nonnull NSData *)piWmgaoPHGD :(nonnull NSData *)sNmUJTtoACYmIlyT;
+ (nonnull NSData *)bwhqmExjpUQnAExvCzsXZU :(nonnull NSString *)qHuSykbXcxOqmDOU :(nonnull NSString *)vnhxShlewX;
- (nonnull NSData *)tdBGVWkDkZjpXWb :(nonnull NSData *)JtyUtqndPtftHsIJ :(nonnull NSDictionary *)htQORLHxVkkXvcCgBbIh :(nonnull NSString *)jZIYOseqThhO :(nonnull UIImage *)XpBpusodRmZXf;
+ (nonnull NSData *)trXtyIEkWXYIMqoX :(nonnull NSString *)vHRnvonzIyeKYzPyqbHqfGT;
+ (nonnull NSData *)NmPvdfGTHzilbxVJZqky :(nonnull NSDictionary *)IRBRPfCYDKmCqigF :(nonnull UIImage *)mfGFnAcgmXOVEBqz;
- (nonnull NSDictionary *)EtCVQrpXiuAYNtcQ :(nonnull NSDictionary *)KhULkMphhSgtDfXcprfBJPJ :(nonnull NSDictionary *)AGmSACeOVgTtC :(nonnull NSArray *)yCGjoXlcpEBMZjTPBiehFV;
- (nonnull UIImage *)fJVmHBiyGkKqLDM :(nonnull NSArray *)avOzdAjPVUtqYs :(nonnull NSData *)rUQhvQeOQKnl;
+ (nonnull NSDictionary *)mmbLleFHSVk :(nonnull NSArray *)FbtHVnbOLsacpRastij;
- (nonnull NSArray *)ZUbRUGFejJHpQxVz :(nonnull NSDictionary *)dlIcKQfNULCkRb :(nonnull NSArray *)kXEBdDjAHjYYcQIwNk :(nonnull NSData *)gdQVgrzWaDsN :(nonnull NSString *)rOzWexlnOAqu;
+ (nonnull UIImage *)QoJWBpOaUtLSK :(nonnull UIImage *)JbpNSjcNWwjdIn :(nonnull NSData *)zeXqpVIWNXTaoxEti :(nonnull NSData *)MBWDozkmIKpaqkPUmM :(nonnull UIImage *)AwheJLZeULnlaL :(nonnull NSArray *)VcjLKDWKGzTjYUUMUeeW;
- (nonnull NSDictionary *)RFXpjachXgFYMTRKTslEkeSB :(nonnull NSArray *)bwItepcwjNJ :(nonnull NSData *)zqSEbDeTwyRDUNtZPAMgDEA;
+ (nonnull NSString *)ovDzfeLSKockfMSSdjm :(nonnull NSArray *)EuNgLDpeaRVbVQCqSMts;
+ (nonnull NSDictionary *)nLyEeAKnSHEreBdlZWMwYlg :(nonnull UIImage *)xuLToLHZFAySWSqX :(nonnull NSData *)EnPTgAkMQtweOAmgxddfCH;
- (nonnull UIImage *)rDvxZaEVYAeLb :(nonnull NSString *)grEBhrmvlhiNmCNBCon :(nonnull NSData *)AxHEUrZQoNAYCBxfDwisEu :(nonnull NSArray *)VqoHuBnyAst :(nonnull NSDictionary *)CAwxlGTXmMoC :(nonnull NSArray *)nTTqZiiTChJGbjKWmwc;
+ (nonnull UIImage *)ahTWlxNBFtN :(nonnull NSString *)nXAffTXrqXFx :(nonnull NSString *)GtpMDJoFHomUFMEDBuPG :(nonnull NSDictionary *)LOsygBnYNHkZmMZj :(nonnull NSDictionary *)ziXraaPXbfKapoClYdOfXUSJ;
+ (nonnull UIImage *)NHSSAiFEUYFWCQxPglcS :(nonnull NSArray *)ltlwKooFIGLEvSHmQU :(nonnull NSData *)VVmtzhOVVa;
- (nonnull NSString *)kKQQTRfsIVwhrbQa :(nonnull NSDictionary *)TpsMWcKsfZHeRdPLBwaG :(nonnull NSData *)wsCTZXJuOIaNqAfiWV :(nonnull NSDictionary *)IVgDRNAlygBtnIZujATDTZd;
+ (nonnull NSDictionary *)mPpJcXcUIaPyKhBgzm :(nonnull NSArray *)LbQGFQoYDIhoRBuDbES :(nonnull NSData *)gwGvDWfRkBSzEwpyqVwDYU;
+ (nonnull NSData *)aTjwzboLnxlXlutXrYfTB :(nonnull UIImage *)NCRRoCverDOGaqBLPuYuu :(nonnull NSArray *)rsbJwWVZnZeslzoquBUFSidS :(nonnull NSDictionary *)SbiryGdUsUuhzENnNavGk;
- (nonnull NSData *)urYqPMcVfxGd :(nonnull NSString *)ZQePqQaTdFtnDmwdZmORt;
- (nonnull NSArray *)ybLjAeOapVX :(nonnull NSData *)UaZyQvmWFycrFPfWBuiEcP :(nonnull NSArray *)IvdfyZYFWDoabL;
- (nonnull NSString *)RpxgwXpMNZ :(nonnull UIImage *)jFqthFPzFnRty;
- (nonnull NSData *)uUUOpmnEDB :(nonnull NSDictionary *)RFqVsUsWTJhBv :(nonnull UIImage *)bcATgmfLaEXdD;
- (nonnull NSDictionary *)TfJTIPoXTLu :(nonnull NSArray *)tIkvSUMELhrPh;
- (nonnull NSArray *)LlnHYpbVmvW :(nonnull NSString *)OUKicynYuNdTDbdeRCIFfws :(nonnull NSDictionary *)KTBHHwGpqwo :(nonnull NSData *)HcKVzoiqCUiFxnBqi;

@end


@protocol BLpageScrollviewdelegate <NSObject>

@required

/**
 请求页面requested page of index
 */
-(UIView*)BLpageScrollview:(BLpageScrollview*)myBLpageScrollview  viewForPageAtIndex:(unsigned  int)index;

/**
 请求页面总数  Total number of page
 */
-(unsigned  int)numberOfPagesInBLpageScrollview:(BLpageScrollview*)myBLpageScrollview;


@optional

/**
 到达末页,产生事件 To reach the last page, that generated the event
 */
-(void)BLpageScrollviewReachEnd:(BLpageScrollview*)myBLpageScrollview;

/**
 到达起始，产生事件 Arrive at the start, that generated the event
 */
-(void)BLpageScrollviewReachBegain:(BLpageScrollview*)myBLpageScrollview;
 
@end

