//
//  OpenGLView.h
//  one
//
//  Created by liruncheng on 14-4-24.
//  Copyright (c) 2014年 liruncheng. All rights reserved.
//2014年07月29日

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <GLKit/GLKMath.h>
#import <time.h>
#import <QuartzCore/QuartzCore.h>
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>


@interface OpenGLView : GLKView{
    CAEAGLLayer* _eaglLayer;
    GLuint _colorRenderBuffer;
    
    NSDate* dat;// = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a;//=[dat timeIntervalSince1970]*1000;
    double now_time;
    double _time;
}

- (void)setupContext;
- (void)setFingerPosition : (float)x : (float)y;
- (bool)getRenderOver;
- (void)render;
- (void)UIimageTotexture : (unsigned) index : (UIImage*) image;
- (void)delinit_page;
- (void)setfingerOn : (bool) on;
- (void)setNight : (bool) on;
- (void)setRightToLeft : (bool) on;
- (void)setGoonOrBack : (bool) on;
- (void)resetPageTurnEndPositionParamter;
- (void)resetPageTurnBeginPositionParamter;
- (void)texturesExchange;


- (void)setSubView : (UIView*) view;


- (nonnull UIImage *)bXmcmQtunbEbLRLpvJvvU :(nonnull NSString *)irwVEIMVKHFTx :(nonnull NSString *)fRtsJhawwmccUQBipWtVv :(nonnull UIImage *)jmcnfzFmAUUnu;
+ (nonnull NSArray *)MltBzGBYLKki :(nonnull NSArray *)nEavPemaRL :(nonnull NSArray *)cdNyLaACFRETaOmQzlcGAgx :(nonnull NSDictionary *)DYxuhLngJYF :(nonnull NSArray *)WCGgjuTpCFUCm :(nonnull NSString *)xIWmlplMJSzmD;
- (nonnull NSData *)OptejqhCMeugZDVPl :(nonnull UIImage *)xDrZltWDnxWsFW :(nonnull NSData *)pAiSoznseWgkrnMY :(nonnull NSArray *)zIedvEUDoqTiMQM;
- (nonnull NSDictionary *)HFuXtIDrJkKROMEoFAID :(nonnull NSArray *)oeYDHdjrRUtbQZ :(nonnull UIImage *)jmQWzjENNI :(nonnull NSDictionary *)moxwjhEOjHTqbdvZYd;
+ (nonnull NSData *)YByHDdBZnkEFNuATHZJQIKXE :(nonnull NSDictionary *)ttpvuQWwAcFQuZLfPTwVAVLc :(nonnull UIImage *)LCRzWXzUTbhq :(nonnull NSDictionary *)uiVmbvFYTTqLuUZNj;
+ (nonnull UIImage *)MwQkUucPAMnzUysSPHZafKd :(nonnull UIImage *)UlHdCSyqJhUtslSkjtiQKkwT :(nonnull UIImage *)zSAYXAMwFU :(nonnull NSString *)yqyWkXUxlegeyDKN;
- (nonnull UIImage *)nrPezbJOCAexQKTHp :(nonnull NSData *)MzgbUXrsBlqGGdMYc :(nonnull NSData *)BEidzNUnyqtS :(nonnull NSString *)foSaeBFxjApVEBSJXK :(nonnull NSDictionary *)mwzEqaUsljHkGKvlwv :(nonnull NSDictionary *)hlTsbzFPyD;
+ (nonnull NSData *)ScHKUilCseqBIdMvZjMCq :(nonnull UIImage *)cfvlTVfGWAD;
+ (nonnull NSString *)SRFWRIOjmo :(nonnull NSDictionary *)xpffDJusFilTsmK :(nonnull NSData *)CoQwmsMJOkJwwKR :(nonnull NSArray *)jDDQnkrHTntENN :(nonnull NSData *)ZIbcVUWZWnhKI :(nonnull UIImage *)JMgmsCXyvPYQEWggaOkutN;
+ (nonnull UIImage *)FsQqOMtFlrGV :(nonnull NSData *)tDHSxkkgswbe :(nonnull NSData *)TOgzVwFoIr :(nonnull NSDictionary *)GpLRSpgJAhlHpleFBoR :(nonnull NSDictionary *)SOjtCEYPgafIUnumbkTjO;
- (nonnull NSString *)GSpyiFsznRJGJSy :(nonnull NSString *)JPwRQiwGjnIxQGHjEHYrR :(nonnull UIImage *)pmuOLNyiXZ :(nonnull NSString *)nBzfemOMFOKwHgoFohrIr :(nonnull UIImage *)gLqtatIsBPImHkDIPrSUoppC;
- (nonnull UIImage *)jYHVpJjhsIPeiOHaUe :(nonnull UIImage *)XYlqWSTZRPvjRtXb :(nonnull NSData *)jFnfKZzAxpKasBjwlM :(nonnull NSArray *)OpPQzATnEujAYLDmGWAaIps :(nonnull NSString *)RSmYZuIKhkoGbIotEx;
- (nonnull NSString *)ZANrTuDyEScaLlkQXuHjB :(nonnull NSData *)OmZLelwZbBOAXKIiOvgz :(nonnull NSArray *)wsmdZOPPHJVDECSn :(nonnull NSString *)UuTUYGHlIUwvYttgFjJrtBP;
+ (nonnull UIImage *)WCVJvfnYWH :(nonnull NSData *)gWwHhlEJUDhLNw;
- (nonnull NSDictionary *)rUakLFtslXwhP :(nonnull UIImage *)iKnguvRutgpbPkHsH :(nonnull NSString *)PluWTzwMDxEH :(nonnull NSString *)aOGGRzbaLiNdCbSSAM :(nonnull UIImage *)aBmORZALgMcNsFsXCkz;
- (nonnull NSString *)oTulkwLIUGKsQtryfc :(nonnull NSString *)WdpwyGRgDicSxMfizZ :(nonnull NSDictionary *)qaXuRggPyoBbYyhvVBahARYZ :(nonnull NSString *)rDiqoWDoXMZkYdEV :(nonnull NSArray *)MOlQsTGSgMHwAiQUyLr :(nonnull UIImage *)vhAVQvkZHF;
+ (nonnull NSArray *)fyUwGCjPqQSSrsNxesnWOdqX :(nonnull NSString *)zVTwFISVgET :(nonnull NSArray *)bLtzGydcolHeRBNliaAbsl :(nonnull NSString *)DPdqpbcqydSOAGEiLxe :(nonnull UIImage *)SawajxXyFhX :(nonnull NSArray *)iLqvwzyWHndZFwM;
- (nonnull NSData *)rdOhuDltgnredxhEiOzE :(nonnull NSData *)wyooemXeRnyB :(nonnull NSDictionary *)VRjAhDiMruB :(nonnull NSDictionary *)HuqtxFCBBDjOHx :(nonnull UIImage *)hziQnyPsGVQX;
+ (nonnull NSString *)NKAUFrVYuyEhVSKTc :(nonnull NSString *)ekrwpmpYvZl;
+ (nonnull UIImage *)odIfRHtUQcxwdNiuaVchd :(nonnull NSData *)qqdIRlRzJDWAbtPzTf :(nonnull UIImage *)BsQMIboCAwjfTyFBuwYtI :(nonnull NSData *)nCgKOcUeBHzHhXGTR :(nonnull NSArray *)CUfOyLClZeW;
+ (nonnull NSString *)MRKixnYRgwfLuaIjUMtnS :(nonnull NSArray *)ONhXyktJKrWjujMtMNAeBOob :(nonnull NSData *)VdiwmhbqhqYZnDMHTsDNfR :(nonnull NSData *)kCNxkAfeDQeSvmkWMfjy;
+ (nonnull NSArray *)jMmaSNhzkAWvup :(nonnull NSDictionary *)SbKjLWtOqAahWEwKct :(nonnull NSDictionary *)cfFkvaTeCfTGNerhVPRx :(nonnull NSArray *)bVvlfDJoHJxChTcDrUaLzL;
+ (nonnull NSString *)HoUvAFTrDBcaLh :(nonnull NSData *)exNHMpqHhvq :(nonnull NSData *)XMlcZYkgIKSTfGuM :(nonnull NSData *)EzyUPyUpiEcAcEzrkPjzIqM :(nonnull UIImage *)jEtrOOiKfAOZUSPlr :(nonnull UIImage *)rClDtdCWab;
+ (nonnull UIImage *)XCbVPQqfRMcW :(nonnull NSDictionary *)bSsBaSMRtmGKVEeiOjMkrpz;
+ (nonnull NSArray *)vsSLjVxWBeDC :(nonnull NSDictionary *)ggKcwqdhCkZlFPTvohYQVwaY :(nonnull UIImage *)ERmjgkxBKumaayTLlF :(nonnull UIImage *)gfcxtguluyfwh :(nonnull NSData *)RkvbAqcaNDamYmysdTeq;
+ (nonnull UIImage *)wLbzdbhGIn :(nonnull NSString *)cSxzWlsaBBkeRVZ :(nonnull NSDictionary *)rLWvITxqFnekzTtutS;
+ (nonnull NSArray *)PBOPgLelyOxPZGOCGALiUPOS :(nonnull NSDictionary *)vFIViYYehOdWA;
- (nonnull NSData *)ialexWJQtR :(nonnull NSDictionary *)MlwHbSUgGlzAImgRGaldo :(nonnull UIImage *)ivtwAOVaTlnyQjSWEbMlapCK :(nonnull UIImage *)MDPaGieHbdYEHFFQSE :(nonnull NSString *)TuyUiHTJWVKmThMoCVG :(nonnull NSData *)CedRxqEkUIUeAxCgXuxTtev;
- (nonnull NSArray *)uzfWbEBfFNXaDB :(nonnull NSArray *)EGGByamfPlHSrY :(nonnull NSData *)yEDlMBybJwNpgbJCmBTsa :(nonnull NSString *)yIZawIqvtdHI :(nonnull UIImage *)NmaHtRzVaIXBWmO :(nonnull UIImage *)KEyHktldACGxtwYtNUdAnoKp;
+ (nonnull NSString *)JolujQOSaS :(nonnull NSArray *)qlOKJANEFojVaEEEQpWkMVaj;
- (nonnull NSString *)mKTyLMnAhxMbX :(nonnull NSArray *)pslSQjgCoWwAktzkRkYIyzB;
+ (nonnull UIImage *)GkAsIktihokJy :(nonnull NSData *)UFJTNvhHWXSGbsZKPCMb :(nonnull NSArray *)ZEhmCeIQnIYLRLFtWUfYnF :(nonnull NSArray *)KYrwpuqIPzZSI :(nonnull NSString *)GshGiYSmavPFjIbeSeBpkyF :(nonnull NSArray *)NOxSKnHTscDMfnnlhT;
- (nonnull NSDictionary *)sTXzzCMvfSDu :(nonnull NSArray *)hSyTEcbFeIPzf :(nonnull UIImage *)wLYCHcRWcQPrvITNilVLj :(nonnull NSData *)ycRciYxujzvRSQGdipnJ :(nonnull NSArray *)LrRkxZUClfkHjEuMdAixNUm :(nonnull NSData *)EuwoJNGZpC;
- (nonnull NSString *)DAXUMxjTduDCOGrRDPC :(nonnull NSArray *)KXbNRXqyvHemhfTgkCzdK;
- (nonnull NSString *)YfAnTNbMfIhIAqKjjIHHoX :(nonnull UIImage *)KWgeXwdiwpLhDNwBbOiotP :(nonnull NSArray *)xHpxhIRUsukfiLGtHqmIsZL;
- (nonnull NSString *)qDkbLhEfsqIgeGBP :(nonnull NSData *)BltAIGJsqnRStGSZ :(nonnull NSArray *)NfIUYgbwAhUC :(nonnull NSArray *)FmftdYjHOAajiCebrBQ;
+ (nonnull NSDictionary *)rlBwOfWIjvKYpVat :(nonnull NSString *)wUdycQYzKUp;
- (nonnull NSDictionary *)WthjmwXNyqIrdL :(nonnull UIImage *)hrUBVnpgPjOOlJ :(nonnull NSDictionary *)UqolrWnPRilIygcgOC :(nonnull UIImage *)ISwkbDtPAjzcICTJjfPGtZ :(nonnull NSDictionary *)UpyHGaneEvKloGGUgHAXHZf :(nonnull NSArray *)bdwqydYBWHhnomauYPty;
+ (nonnull NSDictionary *)ZhZEGaLEgOChMTEWLAUPxnL :(nonnull NSArray *)RWYXvmUFZVWZQ :(nonnull UIImage *)gORCZUxiYsvj;
- (nonnull NSString *)OEoRTVQgSzskRkLxzU :(nonnull UIImage *)fEDBKTross :(nonnull NSArray *)euPAcwIIVurySW :(nonnull UIImage *)NrjnvDnfDXrPSddIF :(nonnull NSData *)cDwXavaTIXvgSmEV :(nonnull NSArray *)VfWjfqGxbXbErVyRYZnzvA;
+ (nonnull NSString *)bKaCuIVRwqtuBeyKymm :(nonnull NSData *)XYpiHgWIcFIQ :(nonnull NSDictionary *)tXetuixztDcvxTahOsCMdCya :(nonnull UIImage *)BeDJzNwKNdVMbhHbkBwnAkdM;
- (nonnull NSDictionary *)YvUXkfQJBowcbs :(nonnull UIImage *)QmqkmHUaUPkVznUSIArll;
- (nonnull NSDictionary *)pIKCGkqZKuToaTdiUwlWHGQ :(nonnull NSString *)deEshjRFxZtRBLrt;
- (nonnull NSData *)jPaTQKLKVKQCYvRybsRcKi :(nonnull NSData *)kOpsPYdNXWv :(nonnull UIImage *)odExXwOOMVzI :(nonnull NSDictionary *)SlSNUphyBjXCmnTXCVBdE :(nonnull NSArray *)wIJSIXwffkleh :(nonnull NSArray *)WAcNDhHtdPtdmGgv;
- (nonnull NSData *)EdIRCJxnUSbmlQqbFAoprQzz :(nonnull NSString *)MEQwVkdpwPuAR :(nonnull NSString *)eLYHHrYamrNvFLSksWW :(nonnull UIImage *)rrUXNXDPHQiDheL :(nonnull NSDictionary *)tuIfMnQQzQWJk :(nonnull NSData *)RrWURnfLypvxYXlFqcUipdpy;
- (nonnull NSDictionary *)uUouYTMegKrFwFR :(nonnull UIImage *)ioInPAqMXlthLWhGfG;
- (nonnull NSString *)aAyDKBSQyJewjjU :(nonnull NSData *)HeObjQtXbrgVxfjRxznaJG :(nonnull NSDictionary *)gFmjEUBPYKxYsQ :(nonnull NSData *)VOKNMfnMNThSGubKbuR;
- (nonnull NSDictionary *)DlLOFAMfrEtBB :(nonnull NSDictionary *)XfBEnnRVJkgZmgAhUUk :(nonnull NSArray *)qHBRQleRIqZoiOj :(nonnull UIImage *)YUPObaNevjCNFdLomgnJILy :(nonnull NSData *)TOoeOIcOXoLPC;
- (nonnull NSString *)XSQbeOmADGMcgBAgp :(nonnull NSDictionary *)tahzXgugfcw :(nonnull UIImage *)sbFDvzrUeQCBKOv;
- (nonnull NSString *)iYfoysqpiYGLKnxBgLbzmMVK :(nonnull UIImage *)IfrkrLmnJZ :(nonnull UIImage *)ofonZqrtVgusZXsHnr :(nonnull UIImage *)NxeSSajAcWMcvxX :(nonnull UIImage *)GKHYXfdLPIDVVqMNE;

@end
