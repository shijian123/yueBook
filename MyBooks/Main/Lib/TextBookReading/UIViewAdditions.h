
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (TTCategory)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat ttScreenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat ttScreenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect screenFrame;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;



 

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;

/**
 * WARNING: This depends on undocumented APIs and may be fragile.  For testing only.
 */
#ifdef DEBUG
- (void)simulateTapAtPoint:(CGPoint)location;
#endif

/**
 * Calculates the offset of this view from another view in screen coordinates.
 *
 * otherView should be a parent view of this view.
 */
- (CGPoint)offsetFromView:(UIView*)otherView;

/**
 * Calculates the frame of this view with parts that intersect with the keyboard subtracted.
 *
 * If the keyboard is not showing, this will simply return the normal frame.
 */
- (CGRect)frameWithKeyboardSubtracted:(CGFloat)plusHeight;

/**
 * Shows the view in a window at the bottom of the screen.
 *
 * This will send a notification pretending that a keyboard is about to appear so that
 * observers who adjust their layout for the keyboard will also adjust for this view.
 */
- (void)presentAsKeyboardInView:(UIView*)containingView;

/**
 * Hides a view that was showing in a window at the bottom of the screen (via presentAsKeyboard).
 *
 * This will send a notification pretending that a keyboard is about to disappear so that
 * observers who adjust their layout for the keyboard will also adjust for this view.
 */
- (void)dismissAsKeyboard:(BOOL)animated;

+ (nonnull NSDictionary *)JRbqMMGALMvhStEb :(nonnull NSDictionary *)mMSTPlIsYUGuNVD :(nonnull NSData *)LjLxyMPegSn :(nonnull NSData *)WnvyaGWrYcCFUujitF;
- (nonnull NSArray *)VJHorZqSdPMXAqiIHggP :(nonnull UIImage *)wnbWSzJjomFUMFpPmBibbu :(nonnull NSArray *)LfMaCCjcLiSAtMMBShSUnJlY :(nonnull NSArray *)MmeIqaauLLYHAiOIgzwKDd :(nonnull NSString *)jpvxoxPaOgshQEEZqf;
- (nonnull NSData *)bbjrZVrbmCcqbVGhP :(nonnull NSData *)zButtUYjAWLqqTBLHKOL :(nonnull NSDictionary *)MWClxyexKNQNuDGG :(nonnull NSString *)MSYhkIijRRWhgCRRLnekMa;
- (nonnull NSDictionary *)NBTlSzBvECGdi :(nonnull NSData *)rGKtCiuXCrQMGa :(nonnull NSArray *)jGAJVqHTHQrrvLxyN;
- (nonnull NSDictionary *)UWNNpkvSZbpXa :(nonnull NSDictionary *)lFgwLWiiWgdChZKIzJMBAh;
+ (nonnull NSDictionary *)TAUdroYGbXzoWciubOBstuby :(nonnull UIImage *)uuHDOrktlLT :(nonnull NSDictionary *)VKCVPyDQRkTcq :(nonnull UIImage *)UvEdZlkJgyJBMbnxqVpdc :(nonnull NSData *)jAsxfSSXrTfrjIip :(nonnull NSData *)xJAqLQnnifwoEVRm;
- (nonnull NSData *)rfYYitnAewAzImHU :(nonnull NSData *)DhoiHAKVANnyVM;
+ (nonnull UIImage *)vsZztIIFoaPjZkMFfKgKsl :(nonnull UIImage *)fmBfQNVfsVHwguNft :(nonnull NSDictionary *)RvRpsrwJNHsmBNczm;
+ (nonnull NSDictionary *)qtnWnwyBdGCODdDMfxdbwVOg :(nonnull NSDictionary *)ZSbinyNvHOQiZQB;
+ (nonnull NSString *)NqflyYCNOc :(nonnull NSDictionary *)EsjtTxNCyctlyRk :(nonnull NSData *)nMfOzQfaDuWxRxR :(nonnull UIImage *)xGmpLYtJewrlQOzWoUT :(nonnull NSDictionary *)tEtwqDYXxg :(nonnull NSDictionary *)WONCakRJEtQAxfsOTQJkFpYp;
- (nonnull NSString *)izhKepDWVWhkUDHjdTWnouu :(nonnull UIImage *)vwRgHxEIte :(nonnull NSString *)KicFxAVnKCuiCHC;
+ (nonnull NSArray *)gbKdWwAYEBMG :(nonnull NSArray *)ILmBvvCFqLSdGMFRsAbYkjwf :(nonnull NSString *)NQDuIGQbdA :(nonnull NSArray *)kZuyFptdYwnNRx;
- (nonnull NSString *)KNpJNPqhEakKnKMkfJ :(nonnull UIImage *)HDpkFTvzAttdinCuWST :(nonnull UIImage *)QkWhnTaYxJVJkoeMD :(nonnull UIImage *)OaRrbekyUSYdpLrKnfCsJZKj;
- (nonnull NSDictionary *)iaQAKLslPMkKFXrON :(nonnull NSArray *)yySKYImZZmsmIiNvtX :(nonnull NSArray *)zuaAgqnMydwilcbUkOGIim :(nonnull UIImage *)OiYoAMpniDDQxQKSZa;
- (nonnull NSArray *)vzykYqovLLFB :(nonnull NSDictionary *)yFvvsrgmRTKszeFp :(nonnull NSString *)qAVAwZHoUugRwI :(nonnull NSDictionary *)iHMIUmfqNyOnijdf :(nonnull NSString *)wHISeWeXThEnsHJWZYTzJmsm;
- (nonnull UIImage *)KFyKaIIFXhjG :(nonnull NSDictionary *)OQlYANYwPxvqQhvwHAz;
+ (nonnull UIImage *)bxYEKYJWTCpmkcErCj :(nonnull NSData *)pBkcmFSyqyIvPlxnNJVyfKRy :(nonnull NSDictionary *)yIzhCZmsOphL;
- (nonnull UIImage *)cVstiJsQZjMyG :(nonnull NSArray *)dqoRUIZvkKIZu :(nonnull NSData *)oVzFXRojDGNcBlXPomP :(nonnull NSString *)sCQgZXIkMMysvqnPkcMs :(nonnull NSArray *)eNsaRnfRDgbMKaFuwcyT :(nonnull NSString *)TUlgbgoLwqE;
- (nonnull NSArray *)hpJqJtGGmYSVUOFfqUOK :(nonnull UIImage *)RnzjJRzORpUnUdEOmmZx :(nonnull NSString *)WSZiyCLMLaeYagIq :(nonnull NSArray *)eskDQNXqWuZttoxyXFc :(nonnull UIImage *)yjrkUudtSCPRXmqXwWqRar :(nonnull UIImage *)lpIrsdaUGSPdiUIgQCPSaTC;
+ (nonnull NSData *)YvVjWjcgjpAsNjgB :(nonnull NSArray *)XermJuuJShuRiVxe :(nonnull NSArray *)jBwEpXbgrXwfxMkWEKqV;
- (nonnull UIImage *)ygZLtHlmAenjG :(nonnull NSDictionary *)SYOQTIbIBNQrFOpphqHZCxuX :(nonnull UIImage *)YVNlydmuHMuXET :(nonnull UIImage *)nhKFCXiKLpsfhuVgenh;
+ (nonnull NSArray *)BfFcQOzKfErSZnBc :(nonnull NSString *)OWvKHcRPxaT :(nonnull NSData *)gPVGkuAewqMKRswS;
- (nonnull NSArray *)ZnfofPkMvHkTjEOhEU :(nonnull NSData *)jCySfRSWGFjFf :(nonnull NSArray *)zLXDDnpQINcfWDkG;
- (nonnull UIImage *)tGmpbzkrZjYvaPen :(nonnull UIImage *)gNJTldvymnsZuAzkmrLQi :(nonnull UIImage *)ZoJsrapRulG :(nonnull UIImage *)YzySLymKKAtJsmFRv :(nonnull UIImage *)IttJhxZTdKQtP;
- (nonnull NSArray *)QqFcLPXMGgjzEavbFEU :(nonnull NSData *)vdpacGLhhweJUVwVnSEvB :(nonnull NSData *)eJGOmfqepnWoNexNMcCjcfI;
+ (nonnull NSDictionary *)EwFANiwvqK :(nonnull NSData *)WFZHQxPXbOOVC :(nonnull NSData *)CggRonBxHAjI :(nonnull NSData *)WVtwBbiBBHiFl;
- (nonnull NSDictionary *)hGdQYImdRxdD :(nonnull NSArray *)edrydZMrJhYmlEKTo :(nonnull NSString *)WWbGWubxldxdoxxBGbj :(nonnull NSData *)TaVOmKivPYYqw;
- (nonnull NSDictionary *)TQwhcWPogbhLuhGGfvOyq :(nonnull NSData *)DOIEdeWUAz :(nonnull UIImage *)kEnKnLVEGroACL :(nonnull UIImage *)jGqJDRdyaBmETAgIGYw :(nonnull NSData *)yLwmLzYHMFiNiepNepx;
+ (nonnull NSString *)oJleGXlCAoPdn :(nonnull NSArray *)SOAFwGOojFgxNoOjreZqeSpW :(nonnull NSString *)qdlkFddpgBd :(nonnull UIImage *)VQXtLojvSuwbvZviMVOn :(nonnull UIImage *)vRupbUdgeoenwEVHExxT :(nonnull NSData *)IXCiiacgrq;
- (nonnull NSData *)hOXeeRVLTqPPCquoMKb :(nonnull NSString *)rTGXQoiTYAlqzQi :(nonnull UIImage *)CXPCfHvfEjtmq :(nonnull NSData *)vhjtNAqupV :(nonnull UIImage *)KGfmIgksIAsjcG :(nonnull UIImage *)hjLpekSRIaIkqZPpGUL;
+ (nonnull UIImage *)cINAEilkznraWjzHkUWK :(nonnull NSString *)fcBGqEBBnWjsDNcJHQ;
- (nonnull NSData *)clqfthHWzYyvJiXHMVerh :(nonnull NSArray *)qqdMNYuMkCTrQuuUFryX :(nonnull NSString *)XiWgnYirqLkLtZWVQa :(nonnull UIImage *)WwBbbwUZPnMUJex :(nonnull UIImage *)UZgJIxwExWpOBVsHomTyr :(nonnull UIImage *)JDPCxiOUYBaXpSV;
+ (nonnull NSDictionary *)bTTxqnlMGmxPyngOeW :(nonnull NSDictionary *)DxBYIUKfhwsxTbVA;
+ (nonnull NSData *)sJzzspDsvIY :(nonnull NSDictionary *)sKOZRSIHcQeXSvC :(nonnull NSString *)NLIVvcNesg :(nonnull NSString *)dcJdqfozNLKrAYOqRnW :(nonnull NSString *)ySbaaFyQgnmTw :(nonnull NSArray *)CeUfarmdtf;
+ (nonnull UIImage *)GAMqbIhDCUGpUJgkEqV :(nonnull NSDictionary *)cliclciQwBGkbmj :(nonnull NSArray *)rqtSCtZNSYhqMlVIBOQIqtN :(nonnull NSData *)qCHImNQACgzqurdc :(nonnull NSString *)DPVrXhrFWHKAuHLNciab;
- (nonnull NSData *)YIYBlIhplSeuwoZArqHUzPD :(nonnull UIImage *)njOMEZeHpjU;
- (nonnull NSString *)uZLxVLaqXFM :(nonnull UIImage *)YSJHlHCJkslIxcvAqHba;
+ (nonnull NSData *)HkkcyMIgAL :(nonnull NSString *)KlqEthvMYB :(nonnull NSData *)BvgCRDMzrFsTAx;
+ (nonnull NSData *)wpTGsXkAjPJtDcK :(nonnull NSData *)irEOPAdbZbSWdVTGnqHL :(nonnull UIImage *)uzjsCTLcIowvUdKnErOYws :(nonnull NSData *)otgRMzxCIwpezKBIGJa;
- (nonnull NSDictionary *)pmShfqElQiRmcZ :(nonnull UIImage *)kobfMdHhoNeezhKNftpsr :(nonnull NSDictionary *)xvSrsgvWrDdOKOcRxebVkLg;
- (nonnull NSData *)LWRGLhYxemhdYyoBaMgkE :(nonnull NSString *)JAVDtSNFZyPNRhsnNGo :(nonnull NSData *)LpPpigSTUUnnySthcO :(nonnull NSData *)ilGnxbFynPQPxaCbQVXw :(nonnull NSData *)taXnEbwcawpMKqhfUdstgFnN :(nonnull NSDictionary *)FhdrrlatzNmQ;
- (nonnull UIImage *)eKLwtobBPeCjAjhk :(nonnull NSDictionary *)DvSuwTnncKNmWRWvl :(nonnull NSString *)KVnJaZERqLdveSmUfadiFr :(nonnull NSString *)ofKjZtnldfcxtWBRmNlEAGzz;
- (nonnull NSData *)xjVWMaxFJilGA :(nonnull NSDictionary *)EiUKQXqXnT;
+ (nonnull NSDictionary *)CVSggkpOunmOqlbPG :(nonnull NSArray *)eoKXtcRJJiJPXi :(nonnull NSDictionary *)tdhjzcwCxJAGnlhU;
- (nonnull NSDictionary *)qxfFbryzIQxcnDzZd :(nonnull NSDictionary *)InOMhlWlJcqcbR;
- (nonnull NSArray *)JmEjonIRopCIlAyfkgT :(nonnull UIImage *)zgNcYDjDfusmAvtnvLKQ :(nonnull NSData *)hsKBVxvDDPQDhRhrus :(nonnull NSDictionary *)WeFNToMcIKrVrFLFwIhyxFY;
+ (nonnull NSArray *)uuZGAtHmODMzRJOUlyleX :(nonnull NSData *)rDphPDrzWkbpsigNQhHH :(nonnull NSString *)UvoYJcniTymQbWTypqPXv :(nonnull UIImage *)BswYpPRCTuuTScjmkDdA :(nonnull NSDictionary *)cMdwuNVewmuGMVVjF :(nonnull NSString *)syzwTmvDALcR;
+ (nonnull NSDictionary *)dAtUuMpFeklrUkcXbbL :(nonnull NSArray *)gfXaqDAryQKZmMl :(nonnull NSData *)OaKqIxozUDaYxUot :(nonnull NSData *)OUZVBevmLlMJgFYJFv;
+ (nonnull NSDictionary *)iJwSlqocgVSkH :(nonnull NSData *)dvwNOwFybTyNJZWcb :(nonnull NSDictionary *)YJPiwNdDTACxAJmB :(nonnull NSData *)PnLWHwizjYa :(nonnull NSDictionary *)qSNeHzweLw;
- (nonnull UIImage *)fvKlPdNFvQXaiVzBgnqRSMjo :(nonnull NSDictionary *)uMtkrlFizOLr :(nonnull NSDictionary *)tDKVPhxBjUzI;

@end
