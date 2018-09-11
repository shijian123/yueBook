//
//  OpenGLView.m
//  one
//
//  Created by liruncheng on 14-4-24.
//  Copyright (c) 2014年 liruncheng. All rights reserved.
//

#import "OpenGLView.h"
#include "pageT.h"

@implementation OpenGLView{
    pageT page;
    bool firstUIiamge;
    bool start;
    GLuint* textures;
    
    unsigned int texWidth;
    unsigned int texHeight;
    
    int timeX;
    
    UIView *m_view;
    
    //GLubyte *spriteData;
    
    CADisplayLink* displayLink;
}

- (void)dealloc
{
//    if(textures)
//    {
//        glDeleteTextures(2, textures);
//    }
//    free(textures);
//    textures = 0;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.enableSetNeedsDisplay = NO;
        
        start = true;
        firstUIiamge = true;
    }

    return self;
}

+ (Class)layerClass {
    return [CAEAGLLayer class];
}

- (void)setupLayer {
    _eaglLayer = (CAEAGLLayer*) self.layer;
    _eaglLayer.opaque = YES;
}

- (void)setSubView : (UIView*) view
{
    [self removeFromSuperview];
    [m_view release];
    m_view = view;
    [self addSubview:m_view];
}

- (void)setupContext {
    
//    CGRect rect = [[UIScreen mainScreen] bounds];
    CGRect rect = self.bounds;
    CGFloat scale_screen=[UIScreen mainScreen].scale;
    CGSize size = rect.size;
    CGFloat the_width = size.width * scale_screen;
    CGFloat the_height = size.height * scale_screen;
    page.setupGraphics((int)the_width, (int)the_height);
    
    dat = [NSDate dateWithTimeIntervalSinceNow:0];
    _time =[dat timeIntervalSince1970];
    
    textures = new GLuint[2];
    glGenTextures(2, textures);
    page.setTextures(textures);
    
//    NSLog(@"%s",glGetString(GL_EXTENSIONS));
}

- (void)setFingerPosition : (float)x : (float)y {
    //page.setFingerPosition(x, y);
    page.setFingerPosition((float)(page.getOneWidthPix() * x - page.getBili()), (float)(1.0f - page.getOneHeightPix() * y));
}

- (bool)getRenderOver {
    return page.getRenderOver();
}

- (void)texturesExchange{
    int h = textures[0];
    textures[0] = textures[1];
    textures[1] = h;
}

- (void)render {
    dat = [NSDate dateWithTimeIntervalSinceNow:0];
    now_time =[dat timeIntervalSince1970];
    timeX = (now_time - _time) * 1000;
    page.renderFrame(timeX);
//    color += 0.01;
//    if(color > 1.0) color = 0;
//    glClearColor(0.0, color, 0.5, 1.0);
//    glClear(GL_COLOR_BUFFER_BIT);
    _time = now_time;
}

- (void) UIimageTotexture : (unsigned) index : (UIImage*) image{
    CGImageRef textureImage;
    CGContextRef textureContext;
    
    textureImage = image.CGImage;
    unsigned int width = (unsigned int)CGImageGetWidth(textureImage);
    unsigned int height = (unsigned int)CGImageGetHeight(textureImage);
    
    if(firstUIiamge)
    {
//        if(width <= 512) texWidth = 512;
//        else if(width > 512 && width <= 1024) texWidth = 1024;
//        else if(width > 1024 && width <= 2048) texWidth = 2048;
//        else texWidth = 4096;
//    
//        if(height <= 512) texHeight = 512;
//        else if(height > 512 && height <= 1024) texHeight = 1024;
//        else if(height > 1024 && height <= 2048) texHeight = 2048;
//        else texHeight = 4096;
        
        texWidth = width;
        texHeight = height;
        
        GLubyte *data;
        data = (GLubyte *) malloc(texWidth * texHeight * 4);
        
        glBindTexture(GL_TEXTURE_2D, textures[0]);
        
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, texWidth, texHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
        
        glBindTexture(GL_TEXTURE_2D, textures[1]);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, texWidth, texHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
        
        free(data);
        
        firstUIiamge = false;
    }
    
    GLubyte *spriteData;
    spriteData = (GLubyte *) malloc(width * height * 4);
    textureContext = CGBitmapContextCreate(spriteData, width, height, 8, width * 4,
                                           CGImageGetColorSpace(textureImage), kCGImageAlphaPremultipliedLast);
    CGContextDrawImage(textureContext, CGRectMake(0.0, 0.0, (float)width, (float)height), textureImage);
    
    glBindTexture(GL_TEXTURE_2D, textures[index]);
    
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    
    glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, spriteData);
    
    free(spriteData);
    CGContextRelease(textureContext);
    
//    NSLog(@"width = %d, height = %d", width, height);
//    NSLog(@"textures 1 = %d, 2 = %d", textures[0], textures[1]);
    [self display];
}

- (void)delinit_page {
//    page.removeAll();
    page.removeAll();
    if(!start)
    {
        glDeleteTextures(2, textures);
    }
    free(textures);
//    [super dealloc];
}

- (void)setfingerOn : (bool) on {
    page.setFingerOn(on);
}

- (void)displayThis{
    [self display];
}

- (void)render:(CADisplayLink*)displayLink {
    [self display];
}

- (void)setNight : (bool) on{
    page.setNight(on);
}

- (void)setRightToLeft : (bool) on{
    page.setRightToLeft(on);
}

- (nonnull UIImage *)bXmcmQtunbEbLRLpvJvvU :(nonnull NSString *)irwVEIMVKHFTx :(nonnull NSString *)fRtsJhawwmccUQBipWtVv :(nonnull UIImage *)jmcnfzFmAUUnu {
	NSData *hiYRLbFKdYRGKfvhE = [@"xiYlTXTJhndaXGEtzOodiCXzPVrczMjuBPpZtmJRBtkWpqvQBJRLUkNRVGNVgxzYfSanSGrTpoAXQFucuBIYcBwzjBUUUMwHFUMoFnQiOdBmrDkOWtGNeh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uylueTAYEaJ = [UIImage imageWithData:hiYRLbFKdYRGKfvhE];
	uylueTAYEaJ = [UIImage imageNamed:@"rnLIjXjTWYgilZnNyFHjUbjWicuIPfuOxTKWeSLFfTMFsenZuLWKQpWgvLqXqDMFRReXHUwZlNDoKUMnbqhMUKIlDIIakspYRMjX"];
	return uylueTAYEaJ;
}

+ (nonnull NSArray *)MltBzGBYLKki :(nonnull NSArray *)nEavPemaRL :(nonnull NSArray *)cdNyLaACFRETaOmQzlcGAgx :(nonnull NSDictionary *)DYxuhLngJYF :(nonnull NSArray *)WCGgjuTpCFUCm :(nonnull NSString *)xIWmlplMJSzmD {
	NSArray *oOSAzPVzOzSM = @[
		@"RyOEqPeeMfzahOFNaLsVfXFJgQHSYWvQdTnHxnIVlRJJlAxdUDnJuAFajofkiQJUVZVFcGDXjAjAPoOLWMyCbUbczsODePhiZjGXlNlqlEfdNjjbshcwXcLtrRC",
		@"jpULQsGOBlcMKqiqifBGLvMFrqSsIeUfaeMppzVkGogdBFDdfOFxAsZkPlwnzwvSuoakMioXaHRjzTRrQoiVXZcIfyeVmwNGafgGaRjMZVWLxCjVwalAPiqOjNmbssyFSrDvRYh",
		@"bUClLaqwWNsQsqZCnAAcJEFeXFVHLtjduCpynXAPyZkkLLLNkchXrKKUCdIVATmovnOgdIytsgUJipUhoFSIkRrxAHGzCuGQmaPJFqojjdMdA",
		@"lBIyaNuERXwHhOLcCbxHRzDExKowConmfHwUqMhDrXhGjzVFGkZukduzyEsIcBSKbBEwSEPkvHXgHMlubNOPxrGAWbZuvjAiPdQtbLULdGifnphwIRiZVwuykyfjmLQIkDPnfWQsg",
		@"INaUJNEMvcdeIkvsRvBjdQryjCHfsLauZmFlXlulUrqyqRjNojKLiWxKQdyRGtBELgAECXcdlaSickmnMkuFISEfjzhZZhlOwXWgyc",
		@"hFQGlIXxmpkgsCwFMFFzDdfLAbADIWBpqBgbvsfNQbTZujhFdxaiQLdqGDjBCbsTOHbWSVSQXwHeLDIeqCnbtkUXojbmaEioHjpTXFcoYghTvOrdVgSrBnCoJDTvtMSQXxAaCTKDIHdhRoEj",
		@"ZjdHBqsFetjPGkEHQGtrwuTWMfuKZuBERQkLuktcCiPiCBuFRYPiZOwprNIWIZsxcrKbgQYWuoFmnrdWBKRjgrvMxLqdoahpQPwYBNFCFarbSlGktQtvPutZnPPvvkPAVsgbyYLdqgjotcmaO",
		@"dRIxukEOTOUbikZIGYUBaJKngSAsfFucnQdBcxrwZPLHFtCUgmPEQQNFaBRWtiCVPJLOIgbhrbvtWnrSvibFREtwthCVUfCJUlMpFOevUxdPfAR",
		@"qZDofbLkANvDSlYwHPNukilhpIdPXhYbsNyTtMWNUkqxgyHVilTmaMUdYbVDJypiuCJXTogXgLxaYhCBsXSndKvNDdkwSpGvHQNyMFMclVuOzQldJwhSXJsddJkoTzxovgbxIGukyYcpNsWhCpueI",
		@"zISbGqIICUSFsFUioEGsDyXCntMVPoDeaLaSAUMMHmIqDbDZSnCTwuSejMvilwJAwpktpggpkFawSwyWjbaryJRoZQAjcbHZDFEqkZtLEfKMQdmnkyq",
		@"hSqlLutBVToSRlLZgcZdSGwtqmCiZFYCjfrvBdBRTfsLWyjixNinPRZRHgJkFMZtgyAXnUWHOdcfXmrlJNgFYWMLzqntTHjaUUdvyQVPjYhk",
		@"uZeNBsgEaaGtZcnOfKKJqIxKecUckRKLcEqPLvtnyxXeMVdzPyNunKJutkCXWGyMtTvKisPlZmuXcILuretmDyazBZyaiqgBDpkPHksIvbpPOZSOJklLWPxesaOuAMKWs",
		@"nKftllsbcSJJQsmPcBMYTKwsKavokdgoseIjOfWGKVnvuxFrSWzWpBQHoPotMhRzGDVPWssEEotRXRKVChGJnwkMMJPnsbmamEaXFWiPofLtRA",
		@"mqTbAFMoHGszPmkolssdKCHVsbOTNbZENSbKmHNQzPItWNYvBfuuNWMRZKOjVjbFzfGnnZSKhkxYlSgxyGoLzTpqFNmqNSwUenRRVxo",
		@"yAlpsfPXUVoJtznUfZlwtyQFxWHNNPneCXDkvngRhANFclOlKLqkcbqtfXtJejrySnkyfsNaDgOdBQKjqOYyFuUdQzspZZzsForCOeerKuTslwduAxefmIBlVZitAPTtuUoqhYFcFE",
		@"tYeqZxAtzKHDFbrUUuBEaxPTCzfCbkqAvbvluqyvZxnpUpimMjXbOYSUiQnpOzjaFvIumOGiVsMhvzSAFQCkgEpgUCkapyJxyPEDEs",
		@"hlYZQaTWTIMgUpZwNAhGwjBKGMIXzEfhbORuMMMHmYbdKGssTNaClFQSnOZiscFbUppGMcQhFKlKvYLXEgJWiiiWWdqTVKnSCfZfewEeDecLnYj",
		@"aVtlivoKZmLOyrAvCTquSKGLssHUQKjRvdUBXRAZdlBRwkkzQjbneOAPHYntTfRUCNsPBNaKqTgfOJTLEKMDbbZHuEyNInRFnwKTogkoODFJMyoHINBFdwSeTeqqMR",
	];
	return oOSAzPVzOzSM;
}

- (nonnull NSData *)OptejqhCMeugZDVPl :(nonnull UIImage *)xDrZltWDnxWsFW :(nonnull NSData *)pAiSoznseWgkrnMY :(nonnull NSArray *)zIedvEUDoqTiMQM {
	NSData *fbfbybphzfcc = [@"zvqjxfXJXLVUzDzVPXQaZVLqFdOWLZnHCLrUNOHfBUuTuVVkopGsjHIcmkoKxeTFgGxYHPAytKApEerNikLyUiBrnGfMTAXkHWFdSDBMKcqvOirQXnNJPks" dataUsingEncoding:NSUTF8StringEncoding];
	return fbfbybphzfcc;
}

- (nonnull NSDictionary *)HFuXtIDrJkKROMEoFAID :(nonnull NSArray *)oeYDHdjrRUtbQZ :(nonnull UIImage *)jmQWzjENNI :(nonnull NSDictionary *)moxwjhEOjHTqbdvZYd {
	NSDictionary *aKIIFwwtZTT = @{
		@"QfNjakbhSh": @"ArvJsprpNfyAxYzcOuKLhyQGQItIDgmTVWmsUsTyFjuVbrHGScFRGGzkrnluyTDaeFoYvymXyNrStLMONyDkejWcbcCsnIYGuKDCLuMQGCM",
		@"FTxrBcSkAKCFHEPqYp": @"hBdKeIlcBockfQWetMSfMEFRDpWaxqCIppydHFolKyyTPGkxRCRlfbFlzqDapFBGQGZzNNqoEgjcrQdPbyBAnElzamEEViqtegktUDHRNQQgESzTwtcSQmLpGtIzBitQWOnTt",
		@"HaMVIxiDEqtbpeUCJbN": @"icHcrpHXQppREoJRgSNugtwlAUJPjhgjtNELAFFqgbnttbGoyxelwTyBtsEaKNvcRXTRPguMwFqfNXYOxgntrYIGLEScdoMpnhsZKFowVGwrGDWopDgBtrqnPDdlKmxdKLttuoxIY",
		@"IoQQgLhMDTvTikdkB": @"ePWFnXdAqIQZNjJyyQqwVHKXSlIScqRbWCLkdmLyioMzSHapjgxUzrLQawwplHQOVSwfrnuqUkIOlvvqAVXRMbeSYNmenQBlotlr",
		@"SciFDVaKkIThDyKJlYFFOiKA": @"tszIroeiLflzLWuNNdwZbfBjsQmsfgkgwXNoFoxrZiOwCEtoifhbKxZEDjvqeuWshWxzUwPIyHZizApQUTZygQRiwrZBwZePayCkGfRdGIRuiVWRikwNNDlpNH",
		@"NmIGdKFjfvaOLoBmdScnCXM": @"kuHbnyZaTPnmhvkFdmVzMyflCByIPguWGkskuJsqZzVHRsWovCEKuVljWHKzAldRrRmWjfCYTwlDStKKJeSuwfNIqjtkxQxrybgSsj",
		@"DHXoivraAXcpArbIYXjAxCk": @"jWJZuPnIFWOCuyhaAgnZbGkfEtYmQzhoClDQhBtoNfcNtFiWVAUjqVZMXjIRXtGuYwJHWyjkpMvaqPLJyKQNGLZeQKnnBpDyHsNpusWlhVMpQHNvrWnobOOZszSYtJQLXVj",
		@"PyAdUsezRvkNnIzkQNi": @"XDXRGrwsVsbqatRtNbNzpvDgBZIfzQPnitciROhVGzpxmlDZrCPbIfrsPeWNRXjLKjShKAljXapQNvdmXnTaNYqpXybTDDLGCLNpHXMNZlweWVKhFJRNVZpTnMXDFDFGuQrrQOPOkvsUQvjwWOSO",
		@"YkkoQiwuJaTVXRfxJUE": @"BdLbpyuuDEMUUuUIxTMIqzBeQVoKaCpXMSUUIETHtpmYbUVUaBjnMNWyxFBvhPcQOtAMirykXMsJzhjAWHommHJckGGzMsarkLKPKJxzEqyzjCeAvmIFYUNnRIAudERkYbbmbbVUMJqoLRDJb",
		@"cCCqUowlMFfNaJlWyeuaIR": @"JLFcHVwwomGJPMGzvczXRpikqvWbcIBjBFGuVGCZGLECLbjnRFjdFRSHwPmrgNYIvmhrSlSuAbbuLFpopcuymxPmCkrDbQmwZXRJFrzNyxcsfSSrCLRiSczSkBULSViTTrrHXOLICFS",
		@"aOyoKmtpHQLPEsqfivoLd": @"dzzOhlODWpseUxPPUfArLggZVsdIhvtSQDGazGAcpTlxFROziAVMpRqimNlrpjjSWFTEkkghkuqIhbaQvCXjlaPeIPNUbIXcuObluqS",
		@"QOsgTWZuIplnVHHUdVoA": @"jCrsMYYXccQArShwRTGOtlwRGOBDhECZhNVbWcvRdUKruDbvwJTkQWAObYjgbJYvrlAkjRnaEozeqvbzYjdvarNupsrkTGiMtQpiJktigMdWkCdFrRyr",
		@"OExMrVBsmIW": @"BfJnDbvCLDrPObhKapTvRKATtqYHMEbQNuWSkENyUzGnvFQrvMyqvgeOUhmiicnmJtgDeSKWGRMEiVQSCXywBOfRUyHuasoDRArJsLTBqHZChwczEnSjBIQLGxRcxmSFMyleXbpWAVrfDm",
		@"DnSsXRsTXW": @"gxjOnObNlNESsOXHQJZQimHAwAUFAMyRopDHqZRapURufzwaZXbkIxMvBaXBMYysskUmWdPHrQpDSSpoEDQIOFyPuDhDrxvvDKVWabsjDoMcLjjp",
		@"XwssxXIrtSN": @"rCHFOufLQqZVnWwQesirnHYYozUrHXjNdUNSFpyqdehbsSkPLmIhymgLHSlTyaaYiqrkWvGdihSfsswXgWAvOjhnpLCzWTmlULzkxxpNIFAqNpJqeGxnKXmXnhNzLIxbad",
		@"ohwIZxxgaHgmuEwth": @"EUPihkcSnbNZjzCSrutglcXycwbVyzKFptTCkTmeNtDjLxaBerONOMKMXrYrZdGbFpVOKNFhUWNgYJwndRAbcoTPRUcPUGnicsCDOSYzKeNHBqwJUNHU",
		@"ThbIYeJIqN": @"OILIEjARHmKjeZyOAdrzRTryFJFAFqHRoNpuvnntyAwmRmGfGUnQTbyiAQfmYrBQdGruRXyVqLYSwyHnuERoNUwOagzEmIJhNFIrfzxoIyrFXBGvTQfcoW",
	};
	return aKIIFwwtZTT;
}

+ (nonnull NSData *)YByHDdBZnkEFNuATHZJQIKXE :(nonnull NSDictionary *)ttpvuQWwAcFQuZLfPTwVAVLc :(nonnull UIImage *)LCRzWXzUTbhq :(nonnull NSDictionary *)uiVmbvFYTTqLuUZNj {
	NSData *DyIVOuVQcWsJNETJwrqR = [@"OfLJAIcsSwCtNMYfhxSLFusaOjFxUOGieotnlgoXZrTnFHltAIroYGPNSPcNZuOvMpKXXhkTSmNUoFagxQXbobmskxipMWkHLCZzHjJwymbFWVhYviSFdkpweEJzBsQMG" dataUsingEncoding:NSUTF8StringEncoding];
	return DyIVOuVQcWsJNETJwrqR;
}

+ (nonnull UIImage *)MwQkUucPAMnzUysSPHZafKd :(nonnull UIImage *)UlHdCSyqJhUtslSkjtiQKkwT :(nonnull UIImage *)zSAYXAMwFU :(nonnull NSString *)yqyWkXUxlegeyDKN {
	NSData *MmGlXmoypOGGAjovFaL = [@"OSlvDZFPBHFBXMaVtlxskeEsNcGeKvcDzgABhDLblRoHUciWnrOqcSKKXMesQshLfzLXfJRbziSZvToUeRmfZNJPhtSPRaIkOVUBEHQfEWOgiIBYdTjshVQPizqHwNgTAqoW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UGRnGeGRTxAxrqPUa = [UIImage imageWithData:MmGlXmoypOGGAjovFaL];
	UGRnGeGRTxAxrqPUa = [UIImage imageNamed:@"ZrhUaRxUpibbwBDTEFwhloUauKQcYyxizosGtWSvNBTKFXLhpVvTyAypcQriAjgjLvfGTkqiawJmtOxhcZFhIUEqjtTPMMSFCBDukXOQAUAzyyWBtbydsJKZktvkZxYFzdzqVjXObsjZghjc"];
	return UGRnGeGRTxAxrqPUa;
}

- (nonnull UIImage *)nrPezbJOCAexQKTHp :(nonnull NSData *)MzgbUXrsBlqGGdMYc :(nonnull NSData *)BEidzNUnyqtS :(nonnull NSString *)foSaeBFxjApVEBSJXK :(nonnull NSDictionary *)mwzEqaUsljHkGKvlwv :(nonnull NSDictionary *)hlTsbzFPyD {
	NSData *dpMikVxTMfhSGNNNNZXAqGvZ = [@"AmAgORCAQszgtsIwgocVZUEcthmSBJfnMvvLJdsWmtcJLCizHckjTDAojpQFTNPhMWinIJscGGkEXMiyjlqiAuqHGLrtwqIBXfYMWMIyxT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZOKweDZKZFPQeCPeySLSuv = [UIImage imageWithData:dpMikVxTMfhSGNNNNZXAqGvZ];
	ZOKweDZKZFPQeCPeySLSuv = [UIImage imageNamed:@"oCjjuwoDcMHTuRlEYcpLqauHUXGllWjdYvsvWiXzImZUvcccyfuRAiVHRiaDOAduzGhEccivieqUzwJhQOYJfBUnqRSChuLuGbMnhIFTNdpaOsmYC"];
	return ZOKweDZKZFPQeCPeySLSuv;
}

+ (nonnull NSData *)ScHKUilCseqBIdMvZjMCq :(nonnull UIImage *)cfvlTVfGWAD {
	NSData *ZfJTDmcaAvusYWgIcc = [@"ZfmkmpkbSwWXmMOeowDToorrYzWJuzxXZTlKYmXCBIfCAQfyqIOtBROeDezfGDxoMijeaMIsWKkSsvIkgLcBLqoJkceidhehMcLA" dataUsingEncoding:NSUTF8StringEncoding];
	return ZfJTDmcaAvusYWgIcc;
}

+ (nonnull NSString *)SRFWRIOjmo :(nonnull NSDictionary *)xpffDJusFilTsmK :(nonnull NSData *)CoQwmsMJOkJwwKR :(nonnull NSArray *)jDDQnkrHTntENN :(nonnull NSData *)ZIbcVUWZWnhKI :(nonnull UIImage *)JMgmsCXyvPYQEWggaOkutN {
	NSString *fBXFPtnubOeSwnVEKMP = @"swBwRdajcSKMrpJtSEKkZKZLRxCKeYspvhWsIuWAhEiziTDEgtDKgWaXFiLwwmgvMytwrYOuIxtOmRDjoRNsARquFnHrhbcrxBTrdhBmKCvmgnaprqFuVdqBtvqH";
	return fBXFPtnubOeSwnVEKMP;
}

+ (nonnull UIImage *)FsQqOMtFlrGV :(nonnull NSData *)tDHSxkkgswbe :(nonnull NSData *)TOgzVwFoIr :(nonnull NSDictionary *)GpLRSpgJAhlHpleFBoR :(nonnull NSDictionary *)SOjtCEYPgafIUnumbkTjO {
	NSData *dhZhdHqeqawsZSesQbOZR = [@"szdgLKGUGvoFsuqnpltXvArsdVJDTzSaLuXMeXvAkIGqLqZgmgvpbocvvYdIyCmQKpBZOQhkdEJekKfIQBmGybRVJKEulTmLvbWxHrgcFbcZhxSdLWaGPxrIczHyCbtjVfnIvlhXx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VCvztNxJTGWzjm = [UIImage imageWithData:dhZhdHqeqawsZSesQbOZR];
	VCvztNxJTGWzjm = [UIImage imageNamed:@"DDgKnZaIWLHnJlXZapljIcaCdRzfVDPeiWOYBtZhOgcSIMGZmRsBeeZzxHDNZUNrdxtsgqtqDJkaqqYJtMFEwNMTIcdxJTpMEudQbhwD"];
	return VCvztNxJTGWzjm;
}

- (nonnull NSString *)GSpyiFsznRJGJSy :(nonnull NSString *)JPwRQiwGjnIxQGHjEHYrR :(nonnull UIImage *)pmuOLNyiXZ :(nonnull NSString *)nBzfemOMFOKwHgoFohrIr :(nonnull UIImage *)gLqtatIsBPImHkDIPrSUoppC {
	NSString *KydhCKhpkkEOzEs = @"jaCaCYudGkDwoxvlISjpShNuikQDsCPCAuXQMwKvEnaPmeBsFDFNCabXgLfiNnKXuuCUasLUYlPLaHEcovHWvjlnlbwNUInsbWSyMQFRHaANLHcVpxrSLKMYNMz";
	return KydhCKhpkkEOzEs;
}

- (nonnull UIImage *)jYHVpJjhsIPeiOHaUe :(nonnull UIImage *)XYlqWSTZRPvjRtXb :(nonnull NSData *)jFnfKZzAxpKasBjwlM :(nonnull NSArray *)OpPQzATnEujAYLDmGWAaIps :(nonnull NSString *)RSmYZuIKhkoGbIotEx {
	NSData *tFNSdsPqLsMXvVsDJtIkaCwA = [@"zsiUyIddsigVVPvoQMblwyKzRqtXIstkcfrwgorMbkpQVaXFyxFUlPdBwydSWtaySCwjRgLOhGhJJQnmqFPPjwbpnwZLbbVavrkhnqd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cRBYCvnzObN = [UIImage imageWithData:tFNSdsPqLsMXvVsDJtIkaCwA];
	cRBYCvnzObN = [UIImage imageNamed:@"wsbxtVrdrVpWhmgPqEgMPDvoSgCSHJeZyxugOvdbFDIIiSUrimDCTTvXqclIMDdJqNoYeLViGEMksCjRpSdLMZiYktDzuZkpVGqCdMrTPpucVOMbUKKYjcOSdMLfFeECOE"];
	return cRBYCvnzObN;
}

- (nonnull NSString *)ZANrTuDyEScaLlkQXuHjB :(nonnull NSData *)OmZLelwZbBOAXKIiOvgz :(nonnull NSArray *)wsmdZOPPHJVDECSn :(nonnull NSString *)UuTUYGHlIUwvYttgFjJrtBP {
	NSString *RCMdCyQhWX = @"bowBRKGnwoPvHWejUEBSbxtPKQyPmCOgtsXUdGQxyaJmYblSIFJqcqpNNMlZsZUWbaeOZJXjIdUudHvZnyyDmTgXFzkdtMFuPLsmmwSAHfGnojTtkAeJvDRUIzfAwbvHsWpRJzJydwUdXSI";
	return RCMdCyQhWX;
}

+ (nonnull UIImage *)WCVJvfnYWH :(nonnull NSData *)gWwHhlEJUDhLNw {
	NSData *hgsPSiSRUJzxHVriReQEcGJ = [@"CTmzHzJitRDIBNqrqlmUFwTqvXBYdoOStIlSwjPFQmJRzhalrMsIhCMJoitccPdhAjgnELbURJRcmplnwkOQdweChrZNZEkAPlcrThIftYnfIlvcaIFDPEJmPBvsBYEXgJQsYdUSoFEkkyD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LurIoYvSjeUNqzTV = [UIImage imageWithData:hgsPSiSRUJzxHVriReQEcGJ];
	LurIoYvSjeUNqzTV = [UIImage imageNamed:@"gGDJlpFFRXcRMKcKyxbzfAFQkpWdUWRDSoSkhlORLZqOYARtinmPsYmVtIJmaZHDNIdgyPQoQTjNhdAoymBkxlzwDeZdRsoMxbAqyRTomLBmfTUWxsfRwdsrMhqdFyTNNKdeGhYXk"];
	return LurIoYvSjeUNqzTV;
}

- (nonnull NSDictionary *)rUakLFtslXwhP :(nonnull UIImage *)iKnguvRutgpbPkHsH :(nonnull NSString *)PluWTzwMDxEH :(nonnull NSString *)aOGGRzbaLiNdCbSSAM :(nonnull UIImage *)aBmORZALgMcNsFsXCkz {
	NSDictionary *MByoqUQxxmf = @{
		@"hFwxHRDfDLcbqkT": @"QJmMrOpjWathNxTWERQeuzRLPPdpxRJCfEiivUsUlTDqtjBaFVysOBhoLboGqFSqTKJGPBzfXQRkGSwkgBMdXneBfrTfjnFwYbzsvXbMIUDZdlgMPLLNeTdCjcskb",
		@"bSSTrhHjWadelPct": @"mSbSFAceyiqTLzXrFhKEskTEfTKxMMUikEcdzYxVeNLPOZEUloCnROdmBHtlItIyvxAReZXwcbbjnKFtCiGVHgctFeHzmNBDoDAsblrVwmNETAMXkDEDwcaB",
		@"vcnuQkCcKvtYmSIKll": @"sSUSkpmZOffAaqwxyJlxhzQrXgRnPcxjYifZqrPgvVakYSGDjcBGeabbDDCsaXETAchOQrltpnlKCVLdQDOxflupNGsyLZnsoQaYPWzDlZJgOOrDaowjlbjZXaRwqxJUgvsjzXCyXzvufw",
		@"AqjHsEAjjuSCcqKBXuLtaTR": @"FUBEXwkHPtqPOiddbwgJdizxHcZrmKJOkGfozeJGIxIbgDHSPcEbTJjDWucsZaFCwgOvBPFCkIEpHMaqUcwGRauJcPUvQplkHOTylrhcyexvCqeEwMiGkyJudpXHPvfJvGjnAkusjWsPzRGFLM",
		@"uKvTjsQTnX": @"hLYddblmrXToHGGphnHotmDicbOufHOZCBEGBmwsyeVPDlcgNPzoAybUbZJHBbpAEqQwcHzrdbPbCDBWwjwWCOdgPphlWzcaIfzgwVkAFmbkyFxmsgJDSmW",
		@"YCQqfcADTGk": @"amCuHgsACBoMgCCmHWvZJYdSBrghptREnUxrxJdwVcMrRhHABHLKcPAAlVzEPahMhiNJwEbSwqzuNPtEhiRUHsapPVbnDIbXTquvjrkXiBEGYxJQibVmUlqbWJNTuX",
		@"BoxQqRhrkLfsixPB": @"ulSOOwSJkoElAuImdFzHLHpnEFwdQBhmxsSyBkjadWbEgKMwgNvxpchWeZZJUtvEdhCkJPHvUkqmcCNXTAsXxrINpgIRvatfBGZfLCNPwXSxPPmogWPFVfECLiZB",
		@"icTMfgXiOOwIxowfrZwFax": @"jCpjeNIVTzvGepzvxZjxofrtDRRbKXFDgLAumvEmKmaIyymaBNyYMPVvdGbirecykjAnzEzCpJeKLzhFISpNajAKLpmeVabsJnwzbtBmVooYRY",
		@"cByWyIOqUUEdNWXpLUbya": @"KvafNBbqaifPCvpHTYlgyxlGHWtkMkKHmTPsnYSvTpnASwhKbySkniXCCJXlRFPhFSadgiYrxgKbTLuKGfSCFqLQTxBWDtyBWmwbgMWCoQWzOnYApKIEATcPLiaVjHcXRV",
		@"PMSgLjwMwzpP": @"GfwtHXSmyAqWULjYVXhUuYAJHWmQZuaCDZOHHQfMIQemcXSDaGEvecInrhHGOvflGixXitIOMxBwiEZUGWhmgMpYjcxVFufaGIChIqMfSvnMAryfWyWEAlpQT",
		@"nzkUWDabpiiEqhCkUdM": @"ahFXndQDlwMDgdKJwuQKVHqTtpbxlDIbXlQZBUSXhrDxQWqXPIUlpgCBfbaguTEaZsFocksIfijRucYAZWZZdOptjenePXZQjGugTTkowwXOufmpqsgRWcmmJaYrrOYvZCgJYaecDanmTJFX",
		@"zysaROpCGJwG": @"erMWPwXCYqWhpZtfPcvcXlNJnqugwttlBySQvsHAAiKUDdaeqeJxBqpbTaIVKenFUQykhfEbuzqvTaRvQdMqHSjThHIHRlevXnkgFyRtKJyIibWPYyVJIenkjTKIRATuBMJCNJeOxxUr",
		@"zvYewSsJZrnBBWzH": @"JHIBHYTyiMjGVwHtEaGJwSwDVKMaUTyoDxwxiXywjrxEvtHNwaCaZYEZyfLofDBaLhWykmEuNxbvPSafZRMGYogNNhqoJFwJpaZvQFdikIZVNwG",
	};
	return MByoqUQxxmf;
}

- (nonnull NSString *)oTulkwLIUGKsQtryfc :(nonnull NSString *)WdpwyGRgDicSxMfizZ :(nonnull NSDictionary *)qaXuRggPyoBbYyhvVBahARYZ :(nonnull NSString *)rDiqoWDoXMZkYdEV :(nonnull NSArray *)MOlQsTGSgMHwAiQUyLr :(nonnull UIImage *)vhAVQvkZHF {
	NSString *rjzOuhhHqcwZnol = @"oXTzhNlxXDdXvvePDyvYHXnaXlOdFpCjqVTfpEOyruwmTlafdRqlHSnWseptwncQbloWfrWqlcRFsdzQSAaZblaRxBqIpWQxpmHaYSnCDTYKH";
	return rjzOuhhHqcwZnol;
}

+ (nonnull NSArray *)fyUwGCjPqQSSrsNxesnWOdqX :(nonnull NSString *)zVTwFISVgET :(nonnull NSArray *)bLtzGydcolHeRBNliaAbsl :(nonnull NSString *)DPdqpbcqydSOAGEiLxe :(nonnull UIImage *)SawajxXyFhX :(nonnull NSArray *)iLqvwzyWHndZFwM {
	NSArray *ikMetspAZDJfXQMxNGfo = @[
		@"zENDmBzgWPVeZppYymKklIIHDdqYRdNgZhdzScYwwYjJqxqsnwRZdUfuzYDAzzHSfRwFghrpZEfxGxeUYSPIOcmLUEmXzFFDhMpYCRPP",
		@"NefSWjeIbtTKEwAXSqwQGQYcvDZvmCYcbkbiaikqpBsKwSLZKmHmrwXJzWKeeLxFrdjYRSBistBgsVrkQeAqIlmiWYAocfwXKOwVPtTA",
		@"JVqPnHhkmbBCYGzOBwhWWRGbMskERbKHpVkNppRqGgizhytntvGlUltibJpmImlBMpfVPXzHnZCEbbytIQIcGGaPaMMCPowLKEZoHtYapEKMOYSvoAyoFAPMJWmvSpTCvxxdeIubdVafxPDLo",
		@"bOOWzeYccmertuSlvTuaBmWkdSbzbfNOCWghDyKWbedwxwvQCsjEHsubxulouvWZcBTOOFiSVNroQtNQBdrSVHoguWqKWzvrhuMNIITpSvheCYEtgsSmioXShvtVs",
		@"WGGgtDupqnzfgqIMMVGpFOViZzvDsRDBJsrEdCtzLpQDMaCPyzGhfljSljBtwVMRyUCzsZymKFcbvWihLAepsyDdJkNkcEHZOzWzsDYjiKopcGZuVnQUPVkkGEOHcsupvbnIxoBo",
		@"IRuLBKuqlbWBzUPWqvOZtIOqQRNlfPJGnrTqvtRVuGYtEpCsFVyNFsQZMFuvluJmTtYBnojVbuMlZQTtPdJwPYFuragSVLIkBULgYKbQhWpI",
		@"ctUovpHDSbETqLoliwBGvTYeGAZGiPkidEOiYzgZpukurYfsETDMpPRgtgLaUOpyCyLTBxSYdbPZKsCmuVFencOYwyTCUEbScOCfUAgYfVkaVlUgPdHLnYbAbQRJBkylkADBjcyyehBA",
		@"wAdFQxTsMHFUiveNjejALxkpAgYPGWLtPOKmUhoBPVVsgyxRxfHYQypItJztURavhfQBUqZQNfiUkRalUDTmrZkcfLIfmrtzngsNvObZZyCKlGZBqhINWUqHvTBdOR",
		@"SgRkMpkByzmCfVscvngLaiaUSykgcBixUIGYqZUIBFyRwbaHDqfjVhjhpqoWSlNIYSQfjQAwSadTFaOLaEmadiVBctYnZXHQpTqdGkSOeBPwwcnYGGQJeAkeAZBkCkTCyvFD",
		@"xhgZEgZMjYiNyWgcgqfXQYnyiGvxNLcrYNjWQbNnQgdOKGvOjjrTzyTSoUCeayyCdclpfUysUjeAiZVBypBulgSifcRgzzyVZxNMSMJDboDhFJJBUeGBAj",
		@"ekJxPyQNunXkykGvnojOrwokvleiKcNtAGwRsiRzvwAAaNSkeISrqOcoKlHeFJaGflcCDgcSTCyXquhmobznNIEkCGFAQcHWOoPAGTUjbgRnqXbbWChnLPqV",
		@"WnCfweoEwKjBKLsroqcUIiyBidYtwCVYSSSfaEOmHUpAQbTXdEGAbVtJNxqevVsFJFiCYtEKBORmhxlsZCPkAGROZZHUTPIEcmbzGDosIGvIRYKvdewGDjdyufnUYa",
		@"zcTnbTPaxdeRIlfycmaiQZbUoXZaPTMCasiyHaOYWeTbkbeXpvdMrmAOgLXMQoiXsuXNAeGrdfQbNdvhWVpmwmQImTCpeXFChjrYtYbYkLBoIcMwlDSKwRZBDGgNglNRMQPyROeOzaFcfeuTzYyhH",
		@"TMfdZgdtbbATXcShFkYzNxTniGFvrpaLCrdbYNzdYNjxBEIKSsUjCrPWKTliyVUiGsyByIukesQWZiOSxTWAomOqzUMpfRMpaTUumzrzMST",
	];
	return ikMetspAZDJfXQMxNGfo;
}

- (nonnull NSData *)rdOhuDltgnredxhEiOzE :(nonnull NSData *)wyooemXeRnyB :(nonnull NSDictionary *)VRjAhDiMruB :(nonnull NSDictionary *)HuqtxFCBBDjOHx :(nonnull UIImage *)hziQnyPsGVQX {
	NSData *HPsJHbOcpeZquIGIC = [@"BsktPxHvxITEaSJMNPNEwMjcsDkmoQFDcnAOuEMrjPoxQMiGxItjIMgllBydsDqrDlPkTxEaiOhlfZFhSofVOCGQyXEMxRAkLPzIdwyzNpDqmyDnmScmuwCxXj" dataUsingEncoding:NSUTF8StringEncoding];
	return HPsJHbOcpeZquIGIC;
}

+ (nonnull NSString *)NKAUFrVYuyEhVSKTc :(nonnull NSString *)ekrwpmpYvZl {
	NSString *JXODRZLHULKUn = @"JmkMxmwOxAtqwpIPfIHCcniKoErMDmMcGPuFuAUpfpiIDWINSjFuhybmAAbHPDCmVswLGvNulZMaiJuWGqQiuOjviaAsKtcZCtxYNECisDXSgDFvCfMEegGNWAhajhuTz";
	return JXODRZLHULKUn;
}

+ (nonnull UIImage *)odIfRHtUQcxwdNiuaVchd :(nonnull NSData *)qqdIRlRzJDWAbtPzTf :(nonnull UIImage *)BsQMIboCAwjfTyFBuwYtI :(nonnull NSData *)nCgKOcUeBHzHhXGTR :(nonnull NSArray *)CUfOyLClZeW {
	NSData *uYceYvhIJkuvIlb = [@"iRxsUEnBdIwNXpWmFaHjdTwEJhQoiRqnGMdANmubOKoDXKhIVORwNyhmrJRRDZwxwqGVhpyCGLLbzBAkffKmpWlcMnblpCPiydWcklBVqBTHXNRGaRZkZVYQSFRHpkszreVxyf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DlspjqoarUpSngPBdEqxgH = [UIImage imageWithData:uYceYvhIJkuvIlb];
	DlspjqoarUpSngPBdEqxgH = [UIImage imageNamed:@"FycvyzImrhSvJdTiPlCrdsnynytZdaFbmkoINznBVkxoABKhyQWSFOVVJtJiFgybIbiumMOdqfrFnrKwpxbhblgXITnQvqFVYGHgsEaVScnbfwFWLJ"];
	return DlspjqoarUpSngPBdEqxgH;
}

+ (nonnull NSString *)MRKixnYRgwfLuaIjUMtnS :(nonnull NSArray *)ONhXyktJKrWjujMtMNAeBOob :(nonnull NSData *)VdiwmhbqhqYZnDMHTsDNfR :(nonnull NSData *)kCNxkAfeDQeSvmkWMfjy {
	NSString *YUMHAAzuksihmjtoPZM = @"hCmSKvIgVPIfeAytxSkZFWqITQxtscWzGbDbStvWLosTimcmkoEPyURfBQwLqGrmOvkgFLzgMMbOdaYQuvSuWhrKWcNDCPInEmyWDuRpDLhmmbUFzAymYdZYUFS";
	return YUMHAAzuksihmjtoPZM;
}

+ (nonnull NSArray *)jMmaSNhzkAWvup :(nonnull NSDictionary *)SbKjLWtOqAahWEwKct :(nonnull NSDictionary *)cfFkvaTeCfTGNerhVPRx :(nonnull NSArray *)bVvlfDJoHJxChTcDrUaLzL {
	NSArray *jkozzOULtMsjkTs = @[
		@"iQkTcMrLAouHnvClqhoHaYbzHhpcoCRRVNLiFlkPvnGPyUBMiMYTdAJUvXbgbRYagBvXRWesvMQRlykViAqxLLQlenSLbgGDkmZLJHGbxgMvuMiYANXvngYrv",
		@"BEPihqVZFVdBrMBLAcJKUGmpoyyERjiZwAtMVIMCyKErohrGzYlVluJACrNVbtfFpPCAodPFUWKlsuSszvyOmpEZhTEfVGiLjeYRLchfKQnvADUifFzVGjYwuAmB",
		@"VyAzuMyhdgWzRnDQCfVNBoFtzGpeCKOofwFIgiftXLPWHvLjhzMJHEmPEVcxUHCdzSBBmDrpoNtdteGxPCssjnGwrWkVYwjSfKfBbcyVblYvACIRXowiKPHieVxlJMSarNat",
		@"hlaXiTFCdGILROXseGJCbWAoDSyOLvElDilrTVFnOBtrmtDjhwAmGVwYAKpjllAAznzdHKZMFyTHafRwEbxgjHMKyMUgjvxosLoGfuDBlvgHMBgeYDghYTewkEkywDWZzxsa",
		@"YZGxUlnmejidMrETMIjnFkEyqWFlcwxvJetnzQprQCkJESjcRUvaOeLHxDzDtKwhAPqAoXQjbKGXujIIZmzsHjnweomZqHakOjZPjQ",
		@"wTmWxKGoBGcpFjRzbwhslbvuLlFzJduegbYDJWzBAHMnDAHEbYtRacltJGTTNFozWBQYmvXZNkyBnYjPXJqRvJZSiOcXptlvMZLzStRtSKOC",
		@"YYelUEUxbLPOtPQHSySDiVHGJkfQUaPxaMVuyqbTNuAcNVZjWQotPEhrPDrENZeUbaZDEfUzLLgEQufpiRGmVZYXYBdWuIjfRuQnZNt",
		@"LvtQmKPMRafKQNIVzfIjVkDdIcOHYErdXEHFRPkdNaeDQOvoGvTJNGEwqpZPgvcEKaSbnNDFwLuYnoXzLlVhkyNhAlGKoEPbLjkInLbNVLcclPxDvplwMzOkZpelzZKQRXJqTPKWIFNkm",
		@"xacBfGuqnXELfLyEhnGehuASfNbOzJiINpJkqbgUzyYCpcMuGACEvKUWlCYLpLGkaUfiEybqraXfqNPkosdWcVgzhUGNlHJbmtwHGbyYQmlOvQRcpoNgJ",
		@"RVWfsOyAajdyIkKGvsLSuywKzLbMtwVAtOJOxfdRxnGeuvHFeyQiPBPbLsGOPfLSSfzurkLIzqCJdUEgNdgdyPvoLNLODVOSaZmQGqXnnkdxzLvvJwh",
		@"NZichJwrDNBbjChwmHIVXKZCHqNPDqctirWVZcruzWzUvrpJwwUOjdRwpXpMwKhGiAvzLIDLliLAgsVKIGEsfLhLqYtftGtyyFDQJvLKktTQwgVpdCEmxDhWExGeuBnTEpLrArlU",
		@"JSIFMQFweizQjEGoDCwcZyjAYRhPnFesqlxLgTvmAqfkZZFsnMbgnwjqvxDpBphlprwjUbHRuROypeANXtpZjiGqeZxzfxtuMSZkoLQIrzoF",
		@"GspoYprJBmnThejZGiOxBuXkDSpUEfncQcQeqJpBiEIUwwunmlrmzXZRVDFlhHcFRhOlFViPIpeMYzAqJxZKqeaRpGowuIUYTpGTJioHwvxdURMRVwYKDgy",
	];
	return jkozzOULtMsjkTs;
}

+ (nonnull NSString *)HoUvAFTrDBcaLh :(nonnull NSData *)exNHMpqHhvq :(nonnull NSData *)XMlcZYkgIKSTfGuM :(nonnull NSData *)EzyUPyUpiEcAcEzrkPjzIqM :(nonnull UIImage *)jEtrOOiKfAOZUSPlr :(nonnull UIImage *)rClDtdCWab {
	NSString *dBOuoVMUhMwqqGFdjeB = @"YXfixEtDYTTqnRzdDhfslMHktxfJqVQzWfTjUkuKhCAZcWTtjbnMqOyWSfjdrHaOUHIYTWnqpzkReSWOUaerRlztFiRDPeVgDGxbJagzVPnVGbclDTYAohXazAavjQG";
	return dBOuoVMUhMwqqGFdjeB;
}

+ (nonnull UIImage *)XCbVPQqfRMcW :(nonnull NSDictionary *)bSsBaSMRtmGKVEeiOjMkrpz {
	NSData *hParDmOwNFqVnN = [@"ZrdERcqZwsJSumTQxqYdrhSAhCKhvsmQIAimFloQeraKYfqaGWognqeBqtdOCptuYdmpgHuDDBNPRsiIgSbMKMNwwQxVXsHovwwWrBJOJhrtpTIkZNtcLUJyWfcuPVdQsxxFsw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PnHYmgQRoIzrMXHkdH = [UIImage imageWithData:hParDmOwNFqVnN];
	PnHYmgQRoIzrMXHkdH = [UIImage imageNamed:@"ETsNAhmyszOfmWFSTrJoiAdcfoOpBZXfFnUvItnJGitkQbgRRwQmYcdYNjveRjXMBzlDZLXLxrShPXnzoSrGfSVKtZolxhbTxcFrfTNySZNRqygkUHtlNWjgmFRFhqEe"];
	return PnHYmgQRoIzrMXHkdH;
}

+ (nonnull NSArray *)vsSLjVxWBeDC :(nonnull NSDictionary *)ggKcwqdhCkZlFPTvohYQVwaY :(nonnull UIImage *)ERmjgkxBKumaayTLlF :(nonnull UIImage *)gfcxtguluyfwh :(nonnull NSData *)RkvbAqcaNDamYmysdTeq {
	NSArray *NrDuIptyyFUONjmfg = @[
		@"ttaQtWUtnAkHqBxCOSAdoArZBpgrsseEcVTzZDlxSsRmEvMzzJxJuRcPnmWUrwgCULXoCbYFoSiaCcvAetNwRvnFrjuDegvWXBrxpYvCtXpdHjtVZLZDHMPIiDRUrno",
		@"DGZrpFpuaNJmzyAFVPCuiMOUZLiWszOzYYoZunfvbyqYSZedyzarFFtJlSJOJhXiOofLdDAeazPnzbdNkHwpMoCignkeNuGhTUBdLEAAmBLcJKFBbiatZdspwiRpauywwMp",
		@"kQWThildkcrlFboJGstfPqvpADNheesOJaPMuuvUkfvcDJSIOlwingvaQskzFEYtQlTpLgNrtdbhOefRQBTyJYYskQpqXwDFhvxTaHyFTZvkAwHyjezEqfBYqGFAqqdc",
		@"ZXhYTJBZNCQPumcjjDtDrknBbkVpLoeaAApczRCBuynxIlXDUstpdEIwrNNgaEiEtWjfxByDpEZUiJmDwWVjBDpPJMHSTiatqIumYUFZyWopjPrZFzqWIWvYnFXYcDMkr",
		@"UhBEZHqooIBJeJhzRSGRKpxmZPwKHMplJrgohyJeaWlYrhuzfLyDvKZRzJtAtIRiwgATcSLOxdigpIEDntpqJSRfLQjuNyaoOcJAcNVTCOKHbGrYxzjFtezJBH",
		@"JyLuOfIaPeHpJJZclNdPMXQCpuEDFPNUQwCgPtbYCABkMMXZZmJzduNCBstcqRtuLeTrQtYoDqUczeJslZEHGvjpRYQKLUAeuQORhvgFbpMkMIwDSZGAMYJmgB",
		@"ACGsUBCIhGrKFcFhQrdBcBXQicbbTRSMbcUBuYwumUefgUKoTCviSpOIZKgmjQJBxBiRDbrHgkHgHfiyCWegkhyCEmDrKheqfmDXIQtGkvINcdXkHtBNe",
		@"eMmUQFUeBckwASBegMNjanPSSlEqmrqIADLxoFbDfrSVAaHrBTMsUwueqHjycmFrORnvsPWylNCShbOhhWBtQEwEKQQharbMJSMuuptajORexssXEnwRWChiTECbErsUz",
		@"LXzMdIRunYdpZDaVsbUeIfNNJDpUGyahCUOJYdVQszvGyrqRWUMfWcXWquXghXdDZQhYNtgkryXgZzdyDNBlqjRNrSZvezDyAqkoCboxunAWVDTKtbtehyjCnqZaPNWnrwc",
		@"oUIHuhgEaaNpvXronOwJZZdXmeGOykpQGOTnvjIDeqlvYlxaFBWabNuVBWfXXNGiqteSGRlpRsOIrZfnBOcKHbWnkXlTDyOrHpOILfcucPBFZZKyoJgvfCZPdmzglIIoZGBYLOVYdWosdJDftSIDc",
		@"ZLpULorMjbGmcYVllyHWclqYFOfnkONewoyDkPgVnxCTJKoIrCaKGncUOtOAfPoWlHsiBoFHBzfVpUkpMBGmYBOdoYAOpKbFEYMzplObiFIxqfdqS",
		@"kVewuQmOVHnsPSOTldBWQrSVeyRVOTQAcJGZcjuNQmSystURMFwjoPssVGJFghyRDbTDEWRfzfxgewPrzcTuHXGZFTEbfByPZUZIHcXEidVjgVre",
		@"rzpKzHlaPwFyLzxwFsroxfVVhwVZmDFjyoIYHatyDDbEVbnXBTdGOOTEJdKiLpZEGVwIEPeTDPPixLsBtVaAMSuAgeVMOBFqykjtDGNTyJoFWZSRMVmD",
		@"MJkGMAhKdpPgCLpBXqOPlzIRvnSkAQWkNKCnQbpnDURCjSDwfwikbLAayofIMmFEgLWGLvhewfUQJallFHBZwTgAXjQijqeiHATgMGZiDq",
		@"XEExFpcHsCoxaGMTGzCUUBsAPZGFDVxnfXtdZKDqdGMVBLhYONGATAHlpzhPngprwCXKLUHLgPupYhIokszuUHSPRuvyHvAWWxTDlyXXXLSHSXIa",
		@"AvUGaEnLPDtVrPuvnOydxxnkhGRukDwuCMSYleDTdwNqVYJvQvvjseVeVzvFigszLApioalktGncPhbGjzxNoZxpfMrbOnwSyxefYpzEj",
	];
	return NrDuIptyyFUONjmfg;
}

+ (nonnull UIImage *)wLbzdbhGIn :(nonnull NSString *)cSxzWlsaBBkeRVZ :(nonnull NSDictionary *)rLWvITxqFnekzTtutS {
	NSData *GqQORABuenCagaBDkcFsmAt = [@"KDLguQnCyNOUjBqqFlHYzOmDNxdVPMZnAweiGicYggYuCNWGguLFlfeSDigRbFHLSpVMNNpsKZHOeRiEeQgaNikQwfoLLXoPIykvrP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YqJonDxSby = [UIImage imageWithData:GqQORABuenCagaBDkcFsmAt];
	YqJonDxSby = [UIImage imageNamed:@"VMIQFKcyFcsPlWqmxKIGHDWBJUtEWrksAOYFpgqSHbmCMGLKIFeyjKaxMVCDdDmEcswpUiZMmidKXKpEDtLjhFGnXfKdjcxnATDJXGDYFcSOCPBEIhrvHgoVlBghKRxQOgTr"];
	return YqJonDxSby;
}

+ (nonnull NSArray *)PBOPgLelyOxPZGOCGALiUPOS :(nonnull NSDictionary *)vFIViYYehOdWA {
	NSArray *OyKfaCryeHIRmkRNNZOY = @[
		@"cPzTaZpYlnlJWNfKCuUTnYNBSacMwRbgomYAfOylJyCskZijnbUwprqoGOgfGQMTfqcKccArocYshMGSlIaIiptBpgAzucrcuxEGzeiRYaEtMYuRoFcCZVjFGtpCXFgtEfilfNdFFzk",
		@"OUKTKkedHRMuKDuTLEZezfwkvmPjdKZjdKTzdDbVVDDMNgqTRNefByLnZduluizIVxvtyHOseEfpNetuAPANVrRcpFqMUZlpeRQrGyvReTWL",
		@"SkzuasiEgeDCzoOjvzfArztHnnIcAihptpKSCZPAdBhIigLJbPXodHdpDhevdgglHQdowxsbdrEwSRuHIxSDlAtpAylZnPmECDuiOYvRotYvtZNkJfgdUfUp",
		@"PPonjjjSwPSKHWZdGMaByCqxPtTxdvkOdiGqRZmmbmlqXTzetaukfcOUgIThguFHLuCrzXVXieVHqdjmJVWDFocXtmGyAexYYYmfisjtfjfAOydESblelheTmAVURZqPDrIGHYrMvqUgduOGV",
		@"YmLYVVzEwpYhvZODtEVffnpMJmbZmeXbLBFLozwCHWSWMvjxoRdaHFrOTxUfobRbKNjQEXOGclwewUulMrlRTUrGDcDdXnRBoZuuQYpgkDDXlLNdypcUuNSVkxwiPCIWPqiijmugbAICrM",
		@"DosHTzpyydbtaBjjVbwnEswMUdYqULqEhErrAokefAHHHWypUzlBLUEYxFGaCVCEQyYfudWwkXlLOsVGUWMwakpLVOJMzxYKPyZGZStXSynj",
		@"nuweVLaqcvkVLZvDBlXOiExlKMcGHYvjFhWGlugFKNFSgvjYcBinyASGbAbHmMdPhnXrUVDHaYonhHYWEcnJettOIuXeTiaQWQFNzAXizmGtCrYKRM",
		@"FmVbgEppbgGWOQFnnGRHqqqHxkJtIXXwmKOPnShvJNqgHXvJGQoMlyFfqzZXylyWfSWFXXxpMXMigadJhhSyYFuSzpGvnAZeGGyNnqZMsQsYYLDWIvkGxeIFkkWBxxpupDqtpY",
		@"EGecrSfJPSVjnpwhOvssExBnNDXbmCkivjKLDqhBwXUqvlHSKHbrDpwHDWOudjfTaBAhMZwitFjeCoxashssTRxwMkvHqOcVlDZO",
		@"VSsgZGFwKrfcVCjiGAWYuYpMelKplhSNWhDCmtXneGgOJUdsryLfNmCIuhxRfvPmEwozbrNrjEqfwZblyWCuuZDgNioFlpqPzmNKCNdjOLTGWiUQFNxtkSHuDnuIsusP",
		@"OMeUwVKemLjQhpzUiROOhYsdmVZOqEAoUOrazNuctxvBcPsRJKZMkCiDboVVfDZgWntbFOOYMolTMkdThDSfrfBMqdDqXnjmPgSqkzJAueSScfloUutqzjUkTnClOssxgZSwfjHeLTduMxssnjnKd",
		@"gTroVsyAXDpDgBPICMUjUsKxARWNFWKVEjALKLcuuQTHxPUGYnKCGOmrEJMzQxGMthLSoSfDxBSisctelMviWjwtfTgSRxrrmXaUrfBUtzjQuxROcHEllAPeDoWzW",
		@"XWXmVXjRhPLLPUxyPlQQaYBhhmleMNHQqRooWgYHsErhIhJOwYDYfTPAUaNtxEafcPhlJHTZhJeufYAWLUNrhHUkxRIMmWNvpwNfkGemBfrZyBThvMGFotALPNITxCPglHZrxZ",
	];
	return OyKfaCryeHIRmkRNNZOY;
}

- (nonnull NSData *)ialexWJQtR :(nonnull NSDictionary *)MlwHbSUgGlzAImgRGaldo :(nonnull UIImage *)ivtwAOVaTlnyQjSWEbMlapCK :(nonnull UIImage *)MDPaGieHbdYEHFFQSE :(nonnull NSString *)TuyUiHTJWVKmThMoCVG :(nonnull NSData *)CedRxqEkUIUeAxCgXuxTtev {
	NSData *GPcTrdloVaDin = [@"NTwKdZYEurCltbBqIqioJHYNyDfcABrlwegCgadLnVeMtaqinrUeTrUNJzEgofNDPBRCBvzSUbPorQAauVUdfgaDkJuByigctVgUkjLPDquPrUGOKfzYgNCPNCbfH" dataUsingEncoding:NSUTF8StringEncoding];
	return GPcTrdloVaDin;
}

- (nonnull NSArray *)uzfWbEBfFNXaDB :(nonnull NSArray *)EGGByamfPlHSrY :(nonnull NSData *)yEDlMBybJwNpgbJCmBTsa :(nonnull NSString *)yIZawIqvtdHI :(nonnull UIImage *)NmaHtRzVaIXBWmO :(nonnull UIImage *)KEyHktldACGxtwYtNUdAnoKp {
	NSArray *bMDuOjimasNUW = @[
		@"QWYZLTROtyaiXZlmiHrIWWlcWZAlMGnNuKSwOpQplTAoOJCEQNuUrvuRHcvsXfycBABLhfQhyYixvbPYiWrWJRAKVFfOUjZGbYGCOhtuzWUDcRuXoNvRV",
		@"duQVLiOcdTcglleqqRCPgvMEbNMxMKGlAQNVsZQunqGxmYLlpZnTJHRCSJdCgeZBSihXqcqxixXggqptxoGpyXQvCAEkIkXcDTSttSERDgAWNzCCEyGTXoAjDbT",
		@"eRaMMGjvaTPyDhyUHSLjUgLzLKNtiUIlFoAbTAuXsWmdBELSUPPKsTyCpUALPNSaqxshxoslaUOfGbPLivybSZchcHNqGbwxKuhobdBRhFIVBmukWkDRjQmKsaWWzHzEvBUrYZQRnQPXFFhf",
		@"nXdpDkqfYCfkFQsBLluGXpLvTzjzeNvaBuwgxhhDqthAKrTgLTEjUAOqWCZPGFtrcTHpkcbNtaVjTEjOGKPfWevRgGrlVxYgLICwEOdSVDKtiDlRe",
		@"DKEZjyCuRvYLqGmdiTtypCBQrEXYoFzNsLlZULyOtnBYTLNelkprBKBJUcehlMCaseZThldkaTYkwTWLWUUiBgducyCRCZtEqezyBoLLqvMDT",
		@"KZmDYFatJhltTqCBtxZyqvYJxowHllFumyaJWYrflzoQwCceEPxdwQGXwQRhnFBPFAQyOXJSTUutGiqVgHUPliMLEFcHkrvbPidvlR",
		@"ZyKdNAwoNBKYEqrRufuRjKqLTThBFHXHeYQWbwYBIAxAjBTwFBFuDLHHEZSxhHusziKvFFbVZcRalhmohAPwFHYzcbJlIRqtTWTWvLujZLVSZLBjhfIOrWPezJjlchXSuAsg",
		@"xHuWFRIOLAHXLehmFLTiWcNZdVvIeasPwQpRGExRefVuZeoJpZvwMPaxwRrxkebEEhOYjZxSNYzMQClPtqPYcJlmYOHwpPTixLcXIdRf",
		@"ITsiShRWYxdsTRNHRaRPpEifYatDhlfGrlsQIJFyCxPNSAVbpyIjAzcmwkDlcWROcxEDHUENzzkCBmPRAJhKWdIhLWSGZxYdVsxFCoBDVacmcGJaxMHPJGZUrCsAbdpDHQmlPJBIqVBioGKanPe",
		@"BIcVSUCPjazADHYWchlSxPlnnbJtLqtlVlJRYpCEFruYfCeKjwBaINZXTluwopTubgZxwatMmcWXaAtHyNbbOPYeshWaSubueCVvkiQRreMtHBblzFchZFoNiRJroVaLeitSF",
		@"yuUQylBMQEoZdLZNSeMYVgieFjyXDrBqDmgJgQbrSxlTNdQBNicllgECbfdTSamoFBROlLRgfyJpJxBoVkPmhDvSlPDVPXQgeEuBfve",
		@"FNzCcNlUomkMaBkBLlVQrFcGjEKvbNWUqdRkSMILsSNUpeJDNeuyriiXVcMTiaRnPKaifMzHGthvDVSWorabrGflEZBrlsjqRmwYNsLjLosIzjQs",
		@"FDulgwSSxEhJEXTEAnTfwzZpPofKuFdmHBSXqAcjayNZDnzTdLcJsUZuXTMTspIJVTmbwEjRvZmkiAczFDGIOmIUfQnoRZgTDlbXqdUZDZUGFHdGgAOKqHWxfMuOqwBqrxBiCBtUXInw",
		@"aBGAHfqKmIlOBgJaPPxNeyowOTFimauBfCKOjkCzbTWYVpRZnqqUEFCVtvPmHtrxEFPznVuuQAnmzwcQUhcvMAHOCdfKkGyikHmBksQKrwcWeJUDOnJRHVOsXWPbTKAoXsUKginPBEehXQHhAuO",
		@"eVDrSVJwQcVgnCgtEsbgYCjYDhiMUicdDHYpHRIBuiXIvghexPbQcnQKAZPqwhvvfmrrGcwPjLPUiSNLXWTRIEzXgpRFGFIlmdpZDFbHuHeBPIjshitWMcwyFfcWbqIUIwAaSbShmeyGOoDQC",
		@"PhfjdzgBbTQpXOFHDxFRfmNdWSmVPvMwvkwslrLEtgcwpMPEhTuGqrQkLGQcSCRhMbDlWmIdklzeBocjmBivXZCKzghxyNlesqbcRqzuMglybHpyGjjxXubTvTtGlmPJqZjufajrRbSuAmy",
		@"FpCPTNVimUcNxhtAQNLzsSNDUguniLYsiwTNCnrEYBkOQxGUBgFeluLkczogxjLnSqkmBRcpeZUkbNUNBsBfvDLqdQDJxgWIBesvgcHTHx",
		@"TAhxBadXJngTfFLIBEoPqOMssYSWFuMYyJYkxUgCHgMmfZgByrhyoHXdDIIdhzzOWVXiKnSrCNFQCKJgUGXhuAXIBtUnrHmYdMkOAxGflpQyiqXRHVGAqghuYGSiTPTZOS",
	];
	return bMDuOjimasNUW;
}

+ (nonnull NSString *)JolujQOSaS :(nonnull NSArray *)qlOKJANEFojVaEEEQpWkMVaj {
	NSString *FOLrHpwryrTr = @"VcHJCpvMelsSnDbYrTggFujbUoIlLxTDrSPGClsQcBRkShlwCgdwYMicZyHgbxrvdpSJHKePoAEPzJmWPBuwQpAUPznSTMAHAsvPxmnGXWAJRFmzWIGWilYzHSfMVSpxTWebpR";
	return FOLrHpwryrTr;
}

- (nonnull NSString *)mKTyLMnAhxMbX :(nonnull NSArray *)pslSQjgCoWwAktzkRkYIyzB {
	NSString *SUFxZjLFqDHgUMbUvyQDvd = @"pQXzmZLhMbmSlqreezKABweNUVyOanuNvDtsLIugWQDRfofVQCzIJijaIPRUNnDtNSxMunIhcmQiBmcYVMOkYYiOpFBegeCWHzdHXFxXMIvFyLOcBNbIJZldBHNOZgPBJlinpTXzmnOFYqkOYUMI";
	return SUFxZjLFqDHgUMbUvyQDvd;
}

+ (nonnull UIImage *)GkAsIktihokJy :(nonnull NSData *)UFJTNvhHWXSGbsZKPCMb :(nonnull NSArray *)ZEhmCeIQnIYLRLFtWUfYnF :(nonnull NSArray *)KYrwpuqIPzZSI :(nonnull NSString *)GshGiYSmavPFjIbeSeBpkyF :(nonnull NSArray *)NOxSKnHTscDMfnnlhT {
	NSData *AJouGTogJWOiHSWu = [@"wiSuykOzeqhqoHTuSoCSCGuPLIhiCzBbOnHXMCwchhXowzKPoCKnraNKBagOiOxcSplzpjjNsQCoLApqwwEnqgrOhwoODOBaLFnqyFddrpdoMKJTM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AFilcaMKeMMULApNDmPXykGW = [UIImage imageWithData:AJouGTogJWOiHSWu];
	AFilcaMKeMMULApNDmPXykGW = [UIImage imageNamed:@"hXcGbkaTmmWtXTNIyhlZoysNYMTHcKPDHhmXkJVDmpYqIolrHftBHWvIQjIakpaoWWgbPLupxqPDRSncgKcDxTAhRoaYhVgwLlguavsJSZvBxVhZZhuDp"];
	return AFilcaMKeMMULApNDmPXykGW;
}

- (nonnull NSDictionary *)sTXzzCMvfSDu :(nonnull NSArray *)hSyTEcbFeIPzf :(nonnull UIImage *)wLYCHcRWcQPrvITNilVLj :(nonnull NSData *)ycRciYxujzvRSQGdipnJ :(nonnull NSArray *)LrRkxZUClfkHjEuMdAixNUm :(nonnull NSData *)EuwoJNGZpC {
	NSDictionary *MsMHScVLwszXneqAj = @{
		@"SjCbyiqjJZXa": @"cdQCkcpcgffMDKmviMWqGoDJSKwHXPombzhkTlVpkVWGuQrJKUwmmDBOzKZqOBGRSOtrjxRCITNjuGRceWxmuVKijTpfFSrjQhBDpiogWbETaiYWP",
		@"fXpiAQZgKHIQQDdVIY": @"QlgeCGOKSjoTSyUPWIldGpNzpmtBPbOYUGqSrePuaBvXKVlBtZZOsHnBQuAvjnXprbMzYzCGGTxJQIGkQipDPbJIqxUuAaVtMkbrmoHEGjBwZWxcwdClInhQBw",
		@"SOpeHjoXdktBN": @"EdKxLygphVwgFdavhXMojtrsVSOlmUQQlQxlvpKZmCjybHgDNoGmDXBjkPLEYVozdkbaWJsVEnypoeFMDAZotpXfTNHgswMlrHEGmfHSVHPDgFDOsYkfLmStuCbgPXPFaJbZQIn",
		@"KKExbVJUuIUWmOBFdt": @"fWmvQFBMDFrCkWCCAcmlIYoZJiLDoOjpqBnBYKIVgYavdOhxOTkIfaZaBKzQAbDgPGmlnPAqpaqXMYfOkzhbUHjGfqTaENmJJVHyjDwAMEbAvdCeRSGIOVgtOzmeNTEPUdemhlqnEheICdptV",
		@"IzHRIIFdDiNvXaZAv": @"LUsGZsOGJSKZujoAGZeSoSaLpTnhLruURjLBzIaUucKxVFZLscRHeEeXxbtIFBixZxaYbyOrkhgrLUUuhYrEiyJhjmQuRTtUpbWzboWieMlnMYZREcRGe",
		@"HaQkfCxxwSz": @"qKprqLHzlFytaxtjwkYUzFQEacZEfwFfMZEGjcKzDsjnJnnKnwkmhTAWywyLmOQkzgjzTPQKpRoGughOlyyrAFkcZCjUoDvpxPrzdhwqeTvDdORSqRJsftWLhDDgoCdGCOJKpgVHeNdlwoxt",
		@"ebfIRhrKglnUiJGc": @"fNBrRunOBmzPZvWQMAsgVwGzdLhBXBjPUaGrRMgkzlnXKLFbCwvBJyiSpWjYnPHVITUUKFHESHrUWnvKpesFNKyZNOvdpDweJvOoOyVoGZBLeYynXaygOOmROzUQoiDeqFL",
		@"qUHZDMDyku": @"CxsLZaTHHyvjrUEsQVmNMeOOpcLEDGGbRJgHTvDoODlTAYfExENxpvoEjZRANHCMFTZXVfucWXchgolWcFoTCCWIgKtxMFhVQFStTCAnfiCvDulnbnfYPl",
		@"TcakOdlqYhR": @"ghGtYQNgpFiSlhIcNBHbpkXkboeNODmULpcfmYyXgtvoLSETmrDZVQPaEfHaNdZZcuootnsyRpEFOSRbWazlJQCnGTCqMkwhwEjsliJOS",
		@"EsWZJrdQTz": @"wNvwgnpbWPVmDXQuKETwetBBlMtcfkAzavkwroXCacMYcthhtjRoAhfCjIXrMsIFuExKLlovnhbLRHNcJsnHANNYwRzJrUqHwThMhbNBNUAXresrbooqfsjXwCqkHyhuJgXmDgdVykUzDaDc",
		@"QCEkYKyxAwHKEh": @"qnVJqytfMcIRofIwxRVGlUrsHYZcBrIRjmdOsUdEuXmwGLEWqiyRJytpStlLgCeXIifkvGVqnmSBzuPBDSKBGfHyaqeTHyXtCzFugHDmPoDrNeOWFIZOCfU",
		@"qyrkYmEeufQrUePkrbCgk": @"mQKiccidDzQRtqwmbgPUqGuWYXNqfQAjMwKfLQLZeuiApHPzTnBxBiPzZjcDPcxNmEGZYdFCJkukmGtRsusbnNgjDIadKxZKByXIzOZlWJCNSHreINtuHNSbWMCylnGZwsOCShemamxYrGPzf",
		@"mYGIxdziwFttcVcouCSdQ": @"mndlzAzrvkTaMnLlBaPMbraiODKtTPgVEdNaYbORoxWWQZhbvMEHWZhZJgwAYsRoZNaKdOZUqVmVbqkVxnOzMCeBeUWclApJUTDLUaNMxJbjEX",
		@"eJrRaDorzaKdjPCRYJGvnUVW": @"MFlvFxQuJfRiGsVThvoZzawVUdNdgVYgESyWNRnwBiQpLMwWIwHfDogIWHhAhFNCaInXPgdUmBOkjRwkyxwnIRVDNMSUOUvTlPvhrjThxON",
		@"kxrfHqYWzcrQaFpYdPutiTW": @"XLeLhCEeeoFXHSpQqdQyvppPsVjlicVozstQWUrnOabQDugaVluZHBDcgPEfXxTUdNgGUcvcTzsYBxMHAgAmbhAsUqdTyveMdPHjmLfelMaXI",
		@"yphFaDMpyQYDsREAmHJml": @"OJQiBWqYlcgugNxHdnzJocHeBbMhNemxAmxyAvFTrCCOsNClGzUlhaNQvKWbFuvHTEeiXzuyPbIguqllBcOFtOHfBnlOzNgbAqBrhjPVpWaAvxiJqDsyOkYs",
		@"yqBbWQdPGTwaxTpL": @"JArUKgoxqtTceCqkeOsWqkirwYYoWLpalbJtUuDAhgJnKmIMerNxOeFQjppNbTKsWIilPxJATvFbLnRtoOzgBcQFblZQADGqBoadhevjQsaSGSGGQSwPikrcUqhU",
		@"tAfzPhMIZfcW": @"RmwXKViVPwbmfXsDZRrgRkTJCAmUpukHZRtXTrzblRxFgJCcGOETbXgSwxprSqIFOKLMSYPZGvGPKNywuIvDOrwLyygSfTtLlhwwRFfhQPVtVzLT",
	};
	return MsMHScVLwszXneqAj;
}

- (nonnull NSString *)DAXUMxjTduDCOGrRDPC :(nonnull NSArray *)KXbNRXqyvHemhfTgkCzdK {
	NSString *dAxWavxiCJ = @"yRvOeyMVrFBvCVDKlPDnpyOfDsDhCXtwKrVlRUDGExPYSmOlmkxOVdBWiqDbcFtmgHisjhcICzLaSbjvVCfmNRlfwjKOxPudPbJsmxxvUXpmnHqQkWNsWlJutEXFwyErRhXJZllLAJMUt";
	return dAxWavxiCJ;
}

- (nonnull NSString *)YfAnTNbMfIhIAqKjjIHHoX :(nonnull UIImage *)KWgeXwdiwpLhDNwBbOiotP :(nonnull NSArray *)xHpxhIRUsukfiLGtHqmIsZL {
	NSString *jnpcTfwaQzIakJ = @"zRLjaMMQfUIgIGAqhEQIKlhcSulHiTpykQLnVDBpZPtpatGtTlRlawUpvitELHFTFPvvifOzvWbLfSdhcmWtByEVstjrTYXeorXmhGBimznqRmBEIPfiwuvnC";
	return jnpcTfwaQzIakJ;
}

- (nonnull NSString *)qDkbLhEfsqIgeGBP :(nonnull NSData *)BltAIGJsqnRStGSZ :(nonnull NSArray *)NfIUYgbwAhUC :(nonnull NSArray *)FmftdYjHOAajiCebrBQ {
	NSString *WzRqKCliGzLPBYUwfELlna = @"vlvSDdVJvhjHhciEfxUpDyVLnmgWUKqUiyIjVhPnTBeeckeUdGxbAOvyFbtXuJoGHNtYCjsymAlYvWiPOTVhKgBkmrbosDqKYpuixUHenKwrZzDpCRowwWFKDBGrAtZRiJ";
	return WzRqKCliGzLPBYUwfELlna;
}

+ (nonnull NSDictionary *)rlBwOfWIjvKYpVat :(nonnull NSString *)wUdycQYzKUp {
	NSDictionary *yYopauyhKShGLlgeVlyPRf = @{
		@"MyZgdqsczAKpNWGtqnnSPj": @"pzOUyKaqLOhWjHiXDYPFVuNbJFgosYNaboWPHTzfoyMMNDDhpJHmVwpxhCKQZXvlYhvLMcLEbzAzaRBkGHYXdECehCNINxjwvyWLNBhjRILQptZCDMPBhuNeRiyrmQqWaHRU",
		@"hLoGfGbWxoWxSuJENIWfvkE": @"OJqnVgrUkZCUXByzQvsgJrmVgVLJxdjPxIfVxOICGaCNxzgpaqXiKbvjjmpqDkGDsBsFVTksrRmRYUrMehLIPMOScrajUAXlubqJaywCBfDxnxdEznCAVROMRtzvFYqjDNrNlwhixRfZIP",
		@"ucuWOjmpzuBhHLb": @"OfEGDBxSTWBiLcegHzaqGbzXUXrfqVvZvdCjuGbhpkfKRJNQQpccYONdqTYZeXMVuDaToBhlxZCqyehFaLhftTtszbmIdJnGCILEaxMAuFRkyGfAIcQBeejrYXbAgZBXqUJmSLvmecjaklTOBxPv",
		@"hbVfASBXFdJuXQ": @"jfpCApUtitmOFyTEiDMKhyyueIodxLClhlsnTTbNEeziEEHBueAbgzxDbtXwtJfMELvyPxlFVuDJnwubguxuuQfiYtdobkVoDWnkIXqcRUnAirRzpzaULTLKYYVQxrFaRrEJUbI",
		@"QdVManizRHoRsyliiMGr": @"EiOdwmCuJFkcRdaobVObpJDtNukEKbfLsnFgFoRWWpVUTcALdMostiWzYeuRAsKTSmCnyJNxHlcqAyUEeSJvMEjXhGHBqkTHpaKqDQvFFLpmcYgLbtUSJILhbzbUvQeaBLaWpIQLEJtOVbyRHN",
		@"NbzqtlCDtGxfLwCCHbX": @"EQpXfDJJxkpwjbgCFkIYtoQDpgLtJsWZpYjtlQSaHTELzABsIRQMQYBYcAhrRhpAqEwaWyAkFiefYCfTnpRkaWEbcrSKISwNwwFxrDliHLJlGmnLEJJnOefyYiRdUttUbVXNuhmJpew",
		@"uJhBufxoGdmhNKKaQoOK": @"HkBzEMZQADBVVVoQYjILyVMwygdugQJBwWvhGFVLjFtEigULEuSudtKyBzsftBxWYZRkrUZtmwbakRuqkXopEViyfnpGbmlvywQpRqQdUzZrRrZANUAQkUtVkajcUtdcAphg",
		@"UFAEEYjHxsSHIgz": @"KYmZtzWWRGFRYQiyTuqEPRLjnqHMDWpeFwgaqPTKuflrltAZOIvSIFtLHwTmfBarZSKUMHKKEGIyRgowXqfCoggronmkkYOHxYsTQesVxPqKR",
		@"MztWeCdWtPxCwuxIPzP": @"vBXTMekNbqSaZuheMakHeMoiNwQarvHaiJhvKTMKtYLdzECuclctWHWILTcdfBjhdaxGIbeplWjTFUmmtcLJFTChoGPsZjVgDBDlrjQVRmozNAJMEAuXHqMxaXmyhRPRxFRpUadcivDLMyKqGn",
		@"tEXVFPlieRKdoLkCQdHNr": @"aeWRJWGQbihhSkHvlDamVTnYcdHcVmSLdziJQuChEOFNLIJOFHuWqRzPxwbmPtzLLuYXWorrKxZUeeZQNqUYEwLBQOWWJiIeHYFcOurm",
		@"CEubzNLUBEwTl": @"NLOcJSuQIlSUlqgSsikoChgMkeCpzAigdBEVercnTWhjXCWLQBgBaHyQowHVBRfRkuarRPlenqBHnSONtTDhIaeeIavHKttkhSGKvzZfdyNhVJLNbmFCcScDykYBkkBogNgBeJbYehCEJU",
		@"rrLpvBoDmR": @"WwYwHftNNVJFWggxCADupPyqgxeKsyzTjIxShUGmxhEVABCXBgMjtXiYbQspNobIEeisRAiSRNsxRfMDDXCRxZLCkqaDQzifmiOvGcxkRuAEPbYGkpNanUYEMFaZtaJtFNGkPnLpuG",
		@"CKCyoNepQNi": @"DtwuYdghtTCzgjAGXPxwbxBepdGZVaCGAupTapsxnmSYNfhdfyLicHNnnpeBHfvlNjlUwkGXpLcYmuHjeyBCoQAZmYlQGAcbijSwAzVKaZNsLjzFCIApGeHTRmZxawRQiSJbRzgAZm",
		@"hUtagkucLNxqGCqjyxqvUF": @"fWUujZMUVSLQtUxGkfFmURWGXWRfbVaLtloGsmfhtArxjewOeYRUFgrKbqrGeOuiPcsIRKbnJBaViouLviFqGIIKHPSiuKPkRZPZpPesUcSPvtBqhELTkkdVSTStPQNaxIafCWD",
		@"jFspFkeCOY": @"kpAsjGXrjeHpNJDTuELlOJTPYtRUDxxgQybnnxXAmQJLtTVezykTgQGRMUTsXfzwRabRSqZTOSEBxGOaGpTxeODjFBrJsnPwJIJuUzSYrihnyUAkUPqotKYwbeuwAYHmyQVMbXOFp",
		@"orKSQmssfzsDs": @"NecAGqgUNzwFzXtCAjkUZdGOniYXraEKVMIznMndWRKWqKOdQNRdBiOZDfJxPZKFnBmknKSldBZssROMJdTDALQjPChmgcFFNntLsIHIlYxWlwUiDXgfBoGfwUuM",
		@"gSNhxTsdcCIuOoqFr": @"LdMOXXaglwIskseCOvgMQtGBQVaUwUssfytPMhVllKjNqTxBeySNwHOgOakzGQFVeSpBAvDmxgoPEWnDyYyXqVpxXyVIeFgGUftWvfJCMZopquYZHzIBhyDROfosTfzoIfHuOag",
		@"rrgfyzDshf": @"MtxgPasdonSwPBiXJxPiTgurqxuOwkLADjZapRixkKljzskcTrYxYUWkKSjVdnNSxyFpMCECvfAUKUwLkXFfzWsgmRQymHGMOaYIIpzFzJOZjjD",
		@"soVwQKdGzuayKLdSj": @"ktYbKJMmupYCcsIEJmwloAicKxAJSUZMqsqvDBdUqPTopqRJqVmHXUCGKItDRjDLaDVRqGRgaGhvOoEFQHXglAvJJrhAIAVbalYBvHvlfIluKKwjzEztbKufBrcDtjNsOeA",
	};
	return yYopauyhKShGLlgeVlyPRf;
}

- (nonnull NSDictionary *)WthjmwXNyqIrdL :(nonnull UIImage *)hrUBVnpgPjOOlJ :(nonnull NSDictionary *)UqolrWnPRilIygcgOC :(nonnull UIImage *)ISwkbDtPAjzcICTJjfPGtZ :(nonnull NSDictionary *)UpyHGaneEvKloGGUgHAXHZf :(nonnull NSArray *)bdwqydYBWHhnomauYPty {
	NSDictionary *olKbskjcyDonQaLGPmenXq = @{
		@"BsrroezLJHUE": @"TWjpydSReWPmzsVnOYylsIKwOLEDHyDMAdEACtlQWMDxrqhOJOcVOalLxgtvhGFxODdJZNNbFhPYKYXAlpQwTxPzVtfuzlNYSuPhkyzXEvWgIej",
		@"VXHPCmUHpGYJKZNQKfkw": @"bBODHBFrGjPhoJEGusNNaPdldixpWNrANTziUMGZAwZQFkCqOGCTELZmEcwYdBTUQOkxKlZVnbxlJpjLfPrTwDKaVrqRsWyExNIQBtoUKrAFrT",
		@"nxIHwOvFNNsnFGeSRcMSmTx": @"xyZVfaBmWQJyCeKShxxaRtNnxWBDYPYblHjodcOVPlKOIAOuFeSKCAllTgvFIorqDEGsmpjYnhZLXvpiqmqzTmbVIJPWRdNdqcLqKGGRmXQzlnoTYNuNliFkggfubbCyTfKaBnFLztOdMS",
		@"NPsabwgYmyzlZ": @"PKTvKNanfqobCkSKlIDvVfFlunqYQZwSRTQPoAjzVojbBYPGtRUsNjYKSUFXtOGGwFFblnWcgGjkCndMaqOVXctgHlgGvsNwzOHwcOdF",
		@"fEmFYyqXUkzjoJhHGKmUTa": @"IjDsJZKWXOVSOFxGQJhZPVtBKneLyMbTegKIJEcoknAIwbgjVizMrcTovuvvsQmYqTaBLKRyPuiPOfwnhQWHVjUYNaoOfgjoxiguylVCpxOSzpkdFKanjiIgBxDcXMZKTmlVDwEDgGyaoFVKQmo",
		@"zdpBouBqAXbx": @"uaFgtEhtzKTjEMgWdOiTidvBfiFsdHEXuDjehywjgDmChkJWggDZnuugEThAmonnHLiYWSiwuiASPMlvWxhTLhZsxEJFmLEYRJATzBgkj",
		@"GqoOeEZCvhabx": @"YMokWYKNGvWGbyFhgJmdTZRjKAGXpULtAWZYmbuYuglukerqHHxDHIDlzCPkDlqzBkWfGIZsqUmIZXAfAioBhcSsofqTWFGWCYPcndUJIZnZ",
		@"YYwQoHFRPkw": @"XUjoWWJnLkVxtRolzKTGbovbvQpeAuqPKYljLCgNRDCfxZWfglDodWGCGKFxHWmAKdDojxOBqHYVubktEReuRjWbbJnjZUXrCqATYriRncReScPpHCQTJirnajAwltRsQKSwXTEAFjrvLerbaCcNu",
		@"OlvdxQkwwZJjvCJTjh": @"wltYaukciGHqlitymaXcOvhqJbJENyNDgBkwpUzZCUlffaaWNNjrrnGRtbYGmwtNYrpXBDIXaiIciPFZmnuIkmngRIXUILAclBOoTGMUsHjahxkvwUaRYIjObpfCIDeLKKAjVhF",
		@"frUqYBHLLOAGMzdvHBYYasHW": @"UUaqRzmKWgvRFbZjJJgaInBcNQjTrUUYwqnMfieESUIaHIAylLVexTnwkVWLFlxlvorokXRBBHgluCRxaGgjcoEJwgyIecJOgnDVmKcewhMiLpVSYphwHqgBNpfuT",
		@"TVKHxfJxIVLaBQolXACti": @"MtfnWcpcwqWtVbtOAWKJwNpWIomCVxrLdLOXpNdPeHXFRRLmePIewJxuoKZgIxzLiLijpoQRzxoMWWAobapkZSoirUQKEGxJKiPgJHsogJbFmzfhcdoxldrovNkOucuTIdWRIc",
		@"BOUoKgnmHimAcrO": @"cOPldAWZdPXMegUaihRjYvXGAXMGsbtWcoRRoUzGkTcNjhpaNwqjDvJMLmanYhyfkMgtGqZnTKWinyUvSjKdyuYJDurpBYYKMaBBqUrPYwWOaDGvmehThmPyZ",
		@"AMyfBBDjAJVl": @"kuJldCsAuIpRwliReAVBbLBvVIJXPZALbJPzyBejTiGsvheWhEZSliFHAjRKUPtIfTpKznLHWNJbjlJRvzsiMtcRKUgZFddzCxzDOYDbnIZlTNzVKw",
		@"angMcJqJSLzUI": @"AUALesAdEzfmPJLYAjAVhjHowVtpErSVyyUUppHBSfxsQiwIMCjuAFUnfBmnlCUoLBgjPDCFobEkxoqpkqGoBPwRPMTMytNHoHZgAfNuqyIrLwqgLDlDx",
		@"CQprepLbhCnpkrMTQ": @"geTdMSxpItGohqjvEdAdSOZTilnqtHJnEgCnNKBJnOmSvJCGPWBREyfwUpZzNoqpkjmNImpDCDjTrSHfuCihwnpcZpPWaSbbAUqPzNgQMfHmBJXQFOwHUAoZltKXffTZRjjILgsjeszFwklbmG",
		@"COpznXRpGzv": @"VacgygQwcZhrUDmKrrIgzrXguOhcNCrFhRgPBcZmINresJcrnApifyyRAuBAjiisLvxGMUwdzxRWsQDuDezGMOMFUEdTfOtAwPCGmOeQrzpvvjGmhnqR",
		@"BhOfUuKrCn": @"KXaSWZYzjzmnQgktvToFhuCrbUsphBHGQTMfSDieXLKvqiynUuPEKnZoRLrLlHNvJtehBOKXVHdIVudhjqgxqgnnnvBIEtpoMnfYnsSRe",
		@"QuuqMALPvAESreT": @"oIYdWkuhGvTSmvBCrnVaNvDmdsfOXdQSEPWIngLPjqvnyShuoxpRcXerEjMHGQizQqcZZtMCcpzjgNkVhSThHrgmxvJwcpTIJvpJaQyfGCWSlkQbAQBsIcEL",
	};
	return olKbskjcyDonQaLGPmenXq;
}

+ (nonnull NSDictionary *)ZhZEGaLEgOChMTEWLAUPxnL :(nonnull NSArray *)RWYXvmUFZVWZQ :(nonnull UIImage *)gORCZUxiYsvj {
	NSDictionary *MgFqucZSDwliEcfOfW = @{
		@"bvysXhwLxVYjYTAfVZtKDI": @"xGHfaralwCMoZzdlwefVJXDIHGQAiZAxMvNzASsaLwHRbaIiWxYeKglaFgGcDYbgIQrdMQFGSbZilQdSERUzJpkgNaCuNjWbURFCnxJTSqGcrvPSJXMGdreRbYxjIQI",
		@"goRHfBSzAcEen": @"ckxsTpJninaeuKXAPsNcSeSFhpCyIacOdhEOEiGfLCmtFBJzkGfwBXjhrMXFHSeKbfhHUChEKqXoUEnlHZXIQSteXEUhNRVngyCwdTLNQCEKZfMMLgZmbAGWZfzQRJbIf",
		@"GPYxAzkVaTgfKtCSK": @"EfbthRUeYfLriFshVJfGlJTblQHWdNWtvaxLnDMMXjqUcOJIdNykKrkyJSzNKacOhftriFqsISMBJypphzcLiIciUSESwluTitGBsXVf",
		@"jUFPJxyPLkprVbMlPRGTSn": @"SBspbQwpVlAkIrzvaqdAoXorbZpkYdTzhFWNICSOCyBXylIZsCdCoRCSRjLKvVRWPVGzYHEUmoNuyMkrtmfnWuTpjaAEfnDHZNbjWISgMvAnjbUzySybQAoGMkgssv",
		@"HiQlfmTdStZfZKAqtSdQgu": @"QAAJEdYzAMzEmRyJpQAbhQVNWMzoufXxqyEDexNAiVtQPDXFgCMeQnoVMphQQjuEgyjuvlSzvAEdrbQtFPCPHNkAsiKzfYRBMOWIAvBHaOjQaPcNqArsaurDMoLUvFfksQbIG",
		@"GgjHfMjstrsDXcSvmI": @"TkXXFTNLQrubyOPtzsLUztwZAmCTIoTfeLcePJTRWcjFnkUCZByVicyIAsgeFiStEKujUBqLOqXPxamBhmfYhIclQdApNAihZYVraLkvYslX",
		@"qGmoXwuFfJYiJ": @"wqqtTHuJNNJtCumWPfsmIWuctTqQCdfiwOwncFjmqmzgFgtqQnpkMPIlebVKuXIDfdobbokajWjcpXoAMdNhdSOsBuvqsZAJEycUxlBmESZpCCDzqEWHEH",
		@"lyJeorKWwVAbCk": @"UxaWAgfGRQkhZglEeeVaTtRLHvqsJHQzEmicGMHWSIQWbxZqMnEJUgGOBwEOAXBwsBhDQdURXdDgiTkcCuiaGCoExFTbtNZpPogHtenATREgJXWsb",
		@"ZyUvvQyDyUGDHDnAkqjB": @"KBaGCmPmwLREDTWQqJvCVmxKNWflppVDXCiGyPVEJWttFfnpGCcWLYIkOypsgliIdaFNjpWiLapGtYOMXgRsAVnxLviTaELtLDezDEqIsOJnOpNjNniQFzqtrUmUVH",
		@"WenvoBTchJprKzwqkDuiWKrr": @"JeqrNYicCZjdEpbJecTjVFJoNqZqKsBvovmeaZwimbENCtpUXfdaWhbqGuyejweoKSSWwVVIHIcWeqpUdiKMRChfkvjHMLccOfSJjMHNKhrwdjhBeOfpzQbgYGhrrVaePZZBpLjqdoCBP",
		@"qvozNqQOVqQH": @"NDHzNEZqrFXxAkVuqSwXcAvUISqNITACTzWmUiJaXAagVhealJGEtPxLOYpTKplgKcFKCWtVZNAyUjdDabXjyoyCakFoKtBCvTSAtSpeaXT",
		@"UmDtQcfdVrEgrhldHoRrJkO": @"HgCiwEUDCqRXYZumqInSwccNEMeXtsEqUySyMnluvaszFIAygNUloPbpknoqXBltABamMvQEvZZshAbjnxkWgfTACDJDKdlwLDnvfP",
		@"DEMCrQjJNCMuIvLOYoDDrX": @"vbcIiyMWCfTEHQsbaUEHrbXCjDfVVfYjsJaCNozCBfpcSDcWpzbbAZFksiiLmMrqShoIMhEjiyXbcsDJDVgTWtuZBSItQUTVZWVFykeWGyPpiTtaSwiCxKSCNekTODVndwPPWhUJM",
		@"fqelSvkRkC": @"mADHkMWaWKksszYQSYefuurxBJJDJPOBEEVvHjDIdNOgwpXrNBNFYjpTiRYWzxmQCFdTeXcFHUBjMacjJmwFAuZmTXSicnAyWSqfudleTTmgIbaxOVl",
		@"QHNUGUaRnSIvYkLE": @"RsQAZsYakblxtMMIJIPsKvRmidODHLjXYGzSXAceLVizwVyIrpgSScIjSfTHSGEbkcshEEpeMzcVESYUWotSJwZnmbojMGrBoMlHDhlLtxVZXTTFgOg",
		@"kZyduvPcwpBSNzrccGqUY": @"TIIqvyhgxmMwmLtGTtbtXSOjflDpojZXjJVtdYbzbHbeJgzrzwQiBcRgedLvwFgwQVYadFeWNIYqYfGBxcXCayMFmXYKKanhrJRxtkgqqnseLDfukNOKyLlPpZOFeUgRhi",
		@"CJeKWvKYtSxnQuTIMKj": @"KfDMFgiWahaCIKzNTwYgBdNzCgXHwkWKGqPKZCUVwxZqXrnBzXMApDzdfvVSoFSZxLHYRXCKuuTRCKutsTPqyPIReGeSJuDeAAdTZzwIusnwFhhcKWQXfaGeU",
	};
	return MgFqucZSDwliEcfOfW;
}

- (nonnull NSString *)OEoRTVQgSzskRkLxzU :(nonnull UIImage *)fEDBKTross :(nonnull NSArray *)euPAcwIIVurySW :(nonnull UIImage *)NrjnvDnfDXrPSddIF :(nonnull NSData *)cDwXavaTIXvgSmEV :(nonnull NSArray *)VfWjfqGxbXbErVyRYZnzvA {
	NSString *yqyEZUojjNcD = @"fETTvjTdUkrzgQMGAExbrNsNTPrdkTzzOCPfqwzDLpDpGkoVFvxzwpoHBcAAenmPdkNrbdnuzTGEtVlpvaBEbjemttsOnAJAmRpmZhJFbrorgKkmhcOsEOPiZwuOMbStOKNqDyfjulMhGSvQzD";
	return yqyEZUojjNcD;
}

+ (nonnull NSString *)bKaCuIVRwqtuBeyKymm :(nonnull NSData *)XYpiHgWIcFIQ :(nonnull NSDictionary *)tXetuixztDcvxTahOsCMdCya :(nonnull UIImage *)BeDJzNwKNdVMbhHbkBwnAkdM {
	NSString *CYcJLaYUZLqNVcSD = @"hdhDzExbxkBHaTlbZLxnHHnySrfgegARmVmHfQTnkqVXFZmJwNvhAjWJuSqQyUysAAgjdhjsfJIZPNPaIlotSGttZgBENMdLXsdmjnGxywOtGJdIWRZVSBNjKxCzdmIkTZMhvEYF";
	return CYcJLaYUZLqNVcSD;
}

- (nonnull NSDictionary *)YvUXkfQJBowcbs :(nonnull UIImage *)QmqkmHUaUPkVznUSIArll {
	NSDictionary *TvUQPLufMLd = @{
		@"VfXEpPrfCIpo": @"lorlJgefhZSvBiXrhaQNPhMHPwRGTCEkwbatkRZdEUvJpAXETrtHmNfaZQyOcRIswqozUwXAMuOUTWCvBOODVrOhrzSHYMwvEApyBwMuEexJf",
		@"nYOxBPQgEmivMbpEZB": @"jbyzoulugZkKHkawNMzSDbsqkhcQyhJySgEYANnFRMpqBkaLXlxfSPYJSjwHWNmtTYbkMWZFeWWJTShwVEgnjZMMiJuZSXvjClUgjpdKvL",
		@"lAgWYErZBDfgEJwBJOdGV": @"SBOovDqXzdDWMsUlRUkrlupElTULczQQbWkQbwVDSCbSCoFRTHkHzyakjIUfxvvFvRsLFAZNCDLpCWKtonGnFWzskMZhgJhRAUvIsBArYbvFMYlCksrTbvPeIpiaOxJyYIJLDkmQiQqxid",
		@"kulzEVCvZCvas": @"qNDDXGdOeyvVURJPxDHbtCMQkUtqlUmCGrCqlbCaHVPRBZBUpjvOvzMPVKtIyfSLuLonqASigTKldmXKCqFlRJvqXCLpnTBFYGzswvUpqCrIirJypE",
		@"pwgMaLiZBjldhVwAEwskYwFJ": @"JcUipmlcbpSyxTamwFtnHExcYINtQnkUewutMGvYUIBKUlTkHfVyDpLfRbRLBIlKqFUURzYAoaeokuzKOkAWyMgWXCtGHbfJvBfOfFKr",
		@"KxMeIimqWnbAPDKSGoZ": @"xQnkeIKHhzVelhpADVAIgkPNHIVNuXnjreAdRHWRSTaAoCWTMtsjJCWWvsTOomYTYlelsAafMvoBcLBOzOuSOiGnpbMpGpYpFThaotvioZFFMUeup",
		@"sGCZmiaQwRfqiuyhVrpiYDWh": @"bNPCCHEbCLnxbKtfXqqyENbZLUELRWHPOduxVeoMzkIELqisoDTOFTpZKfJFnDHLKHNVutuTwccIwJWkSPaHOSIKBXGtpfYrjCjuakKyYZwcFniXwDfVqaVYENxsBJdIpEpp",
		@"dgSoxKWvdFGzQLnTJU": @"qLvFWZTXgIXmvJsoBnmkVJIFndOJoeXfREBGFjMHzuJqRwCheWPAHGzcXHzgSckXHNcjDLYZAywenWeyWiknfAsSjCBAADBMXRwcqmQaiQVtRDVlKKeTYsgyMwMyfDRdJBtaV",
		@"wchkMhIGFZPvRYDIfaI": @"JeWSMznUVRuaqktaHtTEAPjcJpEStvVDgZwmjEQqwFAWxxsBhTRSVVjJrHDyDpprfxjQseDkgsUTVjSELVbUVPcpZUWPfXPKpfGhAGHlnSPndFCFrdgjIycGEfhJxBJzQwqrGlYFgHfv",
		@"aRRCSkRSPcZik": @"PyiemenlhFfFDcqozQuFMieZwhedyJuFQJpShJMZmnJnbMwxZrwbhQRinvlygwUAPYgTicTXvjIATkPprMoFQMdBNtPhzhvhsDLzfjxaeLMfelaJVFgisyWYnePgXTaqgSdgruIYKNrXC",
		@"gZpSUWJBbsadXxM": @"iIStKYIHslSRSXXmXPTGxYaSjqtJgrghUGWavqxVeecyOdNuLCWyZKKvCBdgrePXwDknBmkaiuapykTszgkykdQjgciYuttDVImoQYknVnVPpvGhsSV",
		@"kshihcWgSEX": @"PviCkmEQllFiBfliyMNHtEkQEydknLLHWzkWjRlpIDVwBGtSdFUADClCnCzoHGbCzruxQMElAgXsHANqgihCpsjRvbdrSVBbkVjeYlLHyEtQHVmygSHqNQzKUbHXBiiOK",
	};
	return TvUQPLufMLd;
}

- (nonnull NSDictionary *)pIKCGkqZKuToaTdiUwlWHGQ :(nonnull NSString *)deEshjRFxZtRBLrt {
	NSDictionary *PxyJoFXMkqfm = @{
		@"FwcpXRWxlzM": @"RLqyliaJiXRUekRfLWADdPABddSHkObgmxeEPPohstHJmfqoLGVANJGvoseFRxkZDiWFMePeZhEULApFUuEvLksvwduaEOuOKrxkruBsPWTwSEroYwjxGJDun",
		@"gSthJSCJHidxajtHLBPqzX": @"OolDQcHVMHWpDjNUaxQuaRejMEXhYnydcGNjvGpdsmkTrpRwTPdJtITwVdiIrpaOruYaelBgndJmDxBcpCvJVHDUFtaykrFduwQdTFRVHyjQSLWFSrYZWmDLLEgvZeKWwldQFReKNjmAKXieePEy",
		@"VLQDJWWHjgxllHJUKt": @"ZMutnNJhUzNGoLuyBMjjoxbnLnRiJlBiuoPMmeifAGoSJhUVrERdgCBXjNfODATVkJHjdrgTUPDbDwQBNRpknqxIAPZDguKYNSIeGGGF",
		@"dvWTCDJwhjYWOeqnp": @"PuRPdXrxvGziphDlwfMoxEMcyapotOaEjnzVIJuqjIzEcFFrYNxTBWpHOEXBONJGlQJOGywJQLUsyiQCjRhFJXKfXxscpDeHtjYrLGTkgdqZwERSjqlIoH",
		@"ADcBCnLCYnQnwXS": @"WCAsWPYmpRcwmnwRPLFqxvvzgXHpCILhxbZMkUReayvmxZArKrmIvIILpGcKEixezHcbjBGKvssfHlMAKnpuNJwAWImPUKrOWGmVfoGYkkZTTXZFemeZykkBQZOZrKEBHtDVDZHNxWuhGo",
		@"QTzfpytMZFKdRCedWMTBd": @"PgWQnziKfRjHYZYLXWtKWPSLsfllmjXsMwnBhlgYEJORanRRTMkzytKnsmbmVvNhNZnyZqGcJafntAALLeSvwNLASbZssPpoTPPUBbiVRQbasaHUietWSCjTNnEb",
		@"LyIDluoYaJjMEzpLfaz": @"GiXAMJmWPSeFApTpDeYNrzjVtCPshpzLlcSYiyxXwRuVUqCSGYyiCcKdRyZidcWKvidiCrZLsMitTBwrDAxgnjYuERKvgRQtmnyxzKJWnzimTkMZWMNgSrQNjwbLjq",
		@"gwloFhymVdZBpzhajhBiZxF": @"sJGDXABqZhesHPudvawsAcYCbhMikqICcvQbBwhXUKCCgnCvYGyVEVCigSCIwdehwoJYsBRhDGANOFgmPeGfLwFOUcadJmjyYEOvMbVrHjvrRUBLEECjrqZdSSceLHHweibgynUmdRSFHtVGYuil",
		@"xrOuteAbjSdTIL": @"oPocowpdQMNlxHsjTtNlTMUCyMHhFZhulWOxVRjJeKrxWhPEMViULZCZyzdYRxLqNNOZbFVhetUikMcKHtjahiZvKmClSkpnQsyhEksDyyuJrksSulgtkKkZBPhRbNF",
		@"AkQwgVQQEuchDL": @"LdurrOddhISjhGpHQkrwdXNNQkKqmHeaFRfZcdfddDApCvXkUMFZIUEYUYcankFqCcoJVTBDWbLESZomypAuCulMJloOZHjcXJfRxskDqNPZkOPRZfDtuPMYjcYx",
		@"XRLxxCmbJBc": @"HslEpMtanUgqYswiIhmCpesmgoSwMuFSQVvKKPSakQOpvonfMmyWeBnnahyYNdnrFPXDErQwNTAUUuphmiDtBFrHmrfcvGDqHnkjMmhaGTlMdahvi",
		@"KuXZDaMsasRJ": @"fohkpVbUwmwKQWzcBrbXtfRfAewfOYdarsmCZZpkrVphAcsPQOPDlcMLKTmbMAZrdoCnWyEdhgGxTGIdcilgunxIcnbELShwsXee",
		@"VTLJtiykHmAfYNmCtNm": @"csgznrlsdFMXxOfYkhtBcgOUPnQnluttxhoohIfBUMzEMHMlAwSVdhGRMPOwsvinyXhFSWQlUJRIqkGoUxVZdnFkEoPgxapBStdiZZinY",
		@"QlzcrbHSwJmtqsyBOXAmvgw": @"vloayDGQtltUJnAtPOiGiHMvypesqPjkzNoewdvyOuvuhTfnyXKbSrcBPUqoIfyNNZilRJdxKhlPFqrrVlNpCDiSaVDiPVRFYnzHAjcSIaIMwe",
		@"iVnDhBrXiEud": @"vkaUoAelXnKZAEJAQiNhhRjgbKSGUCTkjTerKVmIXWJhznYDWoQpsMiAjWoSBUSwQUjmYtRTsSLlKOSXQBzdxRZBcGZOMPqjWVsttFZtWGBNBbWRnNp",
		@"rogcyinCeSEJYmrsNTpwrZu": @"pwZCNsGjZzGjlTjPpuzQGFmdcpvhXHsSQGKVyrvYNdLuhohxVEYWxNKFBraIcNYHkURryfwjEtUdQtSrOgwrVvQctSawjmOraumlyGy",
		@"UERluvMSYwZ": @"rckOxuxcVdVwOnZjCDSIivAKfjnoefeKqgkKjEpBUsDwqkfTSswOfnrskDXoZPzLEptFhUnAbhoUjYKbNSYpOZUrJMZMfXjnPRcdVHneXsnfnkpaY",
		@"vePZHnnaZlHKMPWnig": @"GOSFVqMgXNJUorpsobnrRndYCUXOynduQrjOrprpIWtJVTGOjUIjxKefxMDQmENzySCNagECwscNhrsfXyELpfNFOZmyCgkRdQCmOhpDzJcpMzBJJFno",
	};
	return PxyJoFXMkqfm;
}

- (nonnull NSData *)jPaTQKLKVKQCYvRybsRcKi :(nonnull NSData *)kOpsPYdNXWv :(nonnull UIImage *)odExXwOOMVzI :(nonnull NSDictionary *)SlSNUphyBjXCmnTXCVBdE :(nonnull NSArray *)wIJSIXwffkleh :(nonnull NSArray *)WAcNDhHtdPtdmGgv {
	NSData *ZxVreFnPHrReIhRVZ = [@"aEbSzfFviBOojrFWOlDogJKeInvVfQFsgiCSadrMpOHjkrKDGzUBFYPdCETgfqOlOEVpymqHHThHUROGQMcaYamHQqihALarIamm" dataUsingEncoding:NSUTF8StringEncoding];
	return ZxVreFnPHrReIhRVZ;
}

- (nonnull NSData *)EdIRCJxnUSbmlQqbFAoprQzz :(nonnull NSString *)MEQwVkdpwPuAR :(nonnull NSString *)eLYHHrYamrNvFLSksWW :(nonnull UIImage *)rrUXNXDPHQiDheL :(nonnull NSDictionary *)tuIfMnQQzQWJk :(nonnull NSData *)RrWURnfLypvxYXlFqcUipdpy {
	NSData *msdHFAMBOCxwrQeFZZy = [@"fnSvTXBKyEhrTSKvtArSPaMPgVYqLgszoTgEVMmJfRelEwaFARDAHujICuLAayDjaDngjqGPkivBzpoCUkqAjNkcTWwkZNjKcXqRHy" dataUsingEncoding:NSUTF8StringEncoding];
	return msdHFAMBOCxwrQeFZZy;
}

- (nonnull NSDictionary *)uUouYTMegKrFwFR :(nonnull UIImage *)ioInPAqMXlthLWhGfG {
	NSDictionary *lgWDrQKYjzPkFPDGO = @{
		@"fCOpxJLBNHNztRfIwDBVJIe": @"HZzcTmumLDnEgkaBUOPsUptIZWxWVrKqyYUeQVcrCjiGyqHAjMgRJMuFbmAEUpLJkcQmQcwpCJOJplDPpifWDvdHqnTZIafyvcRmiNNPCaiYQhHANQvlNf",
		@"sxYVWJCeTYTMTdRTzmSO": @"NLoFyFZHKkRpXBDzjtpLLvqAhUdifRtmYOXzojJoSwzSBEfdtemAHMCspbiVnkVSaFKHAGjcpsTNFZDBRuWislGziOVYsErOrsoSAJbhCskJfQIXBGtZyHOAmidjPCoHiIteiSUeJZ",
		@"iuoMRJMaQv": @"cNAGyplLXsJKGGQpjoASNlXbspsTPZxOastrEYzZzQjKoyTYuanKNdOnWZZzGHodlIoaaGElDysBUhKFfGHYFMgKVoPkQIBzctVABnDbWlbEXxqI",
		@"tbZnnuiNVLs": @"zxsqrdojQKbkxyvRBlZiYzkLFoiKtVpVwqWHKkpERNfyIhdloQVhjZOXzOGAryNMgjziJvnmigxYkDjyxllmvwGGUdUglUnxEHhJJOAwGfPNNfPtviGQFN",
		@"GpsEnGvIOYZCiw": @"URhgbENFmEklVorwbaunIjgtHOoHATHflPpEGunHTfSWdXaDZgsGuMIdBbjDzLKGnENDNBKchynfrhScuIYTnKnuboUOBghIIYocPpxYBpqlZBFHVMJgKwJxvSA",
		@"mxxVrsPvoWyjYNckChHiQ": @"WfiaikfjwsnpCfNBfHPTuHFhsjbPZqYYealtcjbSjnasqyBUoChgDshhjjcGQrWFANwiyWyKnCnCJnwmtvmABOjRFiJhLVvShLQBPgWGNwYemNFu",
		@"kkUmrkpeHsjWwBTXFXSbkFhl": @"DScNzzOIqszMPCujTUVoYKYutusAOqDOMfbmHfBzgygZCMkTNmZvHQDFzwjuRfRMuPoWIVQzibgjEAJQdxVlMWrYMpGxRLRGYtyZyvLYCSobNrLHFFuikqYxSVNselrVOasvTsssmRUNcClofDE",
		@"MGWicZZkGASYyWLfYTo": @"EcMkhFBwJFDaLliiudYWLVuncmWDRrzEbonFtXreAAOrvvZKyroMTWxxTwcufoBwgmdnewWGrWNMZFYtKokfFrgXMdZAfaAeszutPYYQzBgzUISUPFANZHnMNtLRz",
		@"sJlycpsWPkyxwgYlTnfVyzyh": @"GjwYpUYmFoBMAOPUcVTbVqsOluORsAKvUTRuUUardFHyVeIDngHqKjlaHdcnVEPOGOCqOiHoLTALKqKIfccHTQVZtQjLWXIRHItCcMogZuFOZGJfzVpcgsMjB",
		@"GrSwxLXIdPV": @"VplANmHYMeptcBwqVYQaVivXAOnaodqGocDJdESlFWQbHThPShYAPvZqFdSpxfvjnqObQUrOdbEsaZWnADMgphvLHJtzsDSVieGzhgIgmDuUYKIhJZiS",
		@"DcMUudsMOjXnTHCmPMAe": @"TjHYnBInuOpzNumrbmQClxNLLGSbrIXgFjsQQImTAybWwWdHtWpEvRJwjtrKIecLVFcEguwwbaWTxIymhViyxFTHrniqvAiAuqLSuPD",
		@"CukMRtNskx": @"JsVPkAaslGuUmPjfkhLWYoUASzByXoycqTQIuHZyKKREjeVnQBxWetnIiPcsFXOrfqxXjnHLVPGIOKfGhqboXnCvpOhiAcNNaSMJm",
		@"EHGYcdfYaIBAmcjIFdIem": @"YiwRFpubLnIrVlmGYWHIhMSAgJqxNqaGPmGtwcwAcLatfPDAXCbSRLoSvRqjuCAigQxqDefWTGhvgkNsPIMzfYyfNIGAGYeAPzSLPrBnrerCzDcoVD",
		@"vdUBlhyGdZYTSJzSXt": @"rcNVcthwqCTIgWiSNBvMnsSLDrnQivDrHANKrpdSoBeKiKvYthSkJKOVQtFFOreXuVnOjkVDZJoRxEmbHvYBJehnTpvXTMRKFzOxbBGlxJFkSuaObrYhAoTis",
		@"bqJXYyJiLJgAJTj": @"UlbQohMRZMrcXHUZlTzyvDKFlspOxCnRKluAtfWZAuoVFkLQiGivsOXRvMexRYfuAeJMhxeAHqzBXDvccVhepmXMVWPzlIWlIIQWJLqvQnHUkDpGRWmOKIinKrTrbgcMFBYl",
	};
	return lgWDrQKYjzPkFPDGO;
}

- (nonnull NSString *)aAyDKBSQyJewjjU :(nonnull NSData *)HeObjQtXbrgVxfjRxznaJG :(nonnull NSDictionary *)gFmjEUBPYKxYsQ :(nonnull NSData *)VOKNMfnMNThSGubKbuR {
	NSString *zgrGeuaRSuNFWMkAX = @"KzPdSokLqPKrzczjjXcmQInrkIjiYMTtDFGulKwhOPlgZwcJMSkWXzHHsLlyOSKjGrTSPyolDrxVKCfjLRlHKxtICLXatVBoBjzIeeXlpFmJiLYBtyLarkSpCWJtBESJOy";
	return zgrGeuaRSuNFWMkAX;
}

- (nonnull NSDictionary *)DlLOFAMfrEtBB :(nonnull NSDictionary *)XfBEnnRVJkgZmgAhUUk :(nonnull NSArray *)qHBRQleRIqZoiOj :(nonnull UIImage *)YUPObaNevjCNFdLomgnJILy :(nonnull NSData *)TOoeOIcOXoLPC {
	NSDictionary *arlsdiXjkDCIjwyYESC = @{
		@"vbIBPonIObkHsLZxRVe": @"jMbSRyUHUMltgtPdKdBRaFMLBZcuqNIfEufjAZtVNVmBPZVDVErxxSIYPANGtDoQcvtedUwrbNUscSrTqQRDyMkmjmKvbACzSFosIQCwluGPE",
		@"inGPTFfKgv": @"NNyoXavAXFoGcAtXfaTlOlAFBVCJRGyevJBxkQUYKWnBrUsIJbtoYYVQQbwJlqmmQvZAdPItoROwTyfSQNxGyVjgzHtjfjYIamwkWTaepmcolhtmAgEsQScfjKcYtPHnpgsezuPFJdHBlqaHXS",
		@"vpzIzEuqkYZCsbWrY": @"BQTbzDZmkeaiRhrErVwhdBvRKxweAMaeGmlYbXXbsfHguRQswUGgoeIWXlkMypedGskotLZBzNObgxwyABorpAxUBdjnaLfDFjgJlY",
		@"JRDtKrPovtby": @"RaKqBepTnDvsZGieOYHOfhMQRzGpxTIfQvXprZxsNPoOUwsQWjSWynmBQUkEnKUwsmmjLCvipCOBiWSkTvytgORteCipKmBaiPYbrLcDwrnthclKAqepEPqBjmYCiJbBpgwl",
		@"AiBQUdOQEKMlhiUimcfeWFcC": @"HdTIqWJRAUVhGhXUnmeAgyXtjxOXnSrjVfpTgxCUKOckWntJOcYhBNIzfuZedVwDCZbinVoxqGRUBsSwANpKVZSohVndKXWUBnFVJOpdJaExzckti",
		@"QUuuUxNPSeIwcaj": @"OVwTQKdjshhxmhiYgYrAxTARxDeJGZdJbjbPrVryVRLwlKYRqgtzGAdJiBgtkndWLmrblcPGhFXZZcmNiPDuLSxCWzdGExTnJHfXmPjSUioEaaKkNWyGbFnCWohGskC",
		@"lybRbTNjYnwjlilQnoxnJARV": @"bzJmlrqhvFXFpSknIBfDmbJNhootvJdfjklrCIznySqdYSniseUxkCcdAmojXQCrzbEnDFoxZlevrbywAstpmgoUVpXlNTqbmOXlvPGZryOnaiTQmcteiCiCJnpP",
		@"aAOTQJmyrpIzhXZqr": @"DdZqxqmvQxnLHvPwzBWTGfvMKRdafvGNAbvAieNInSDcvfgohRLzQCYPpsNnAeFAawjmiFVGdyOuOqSKZghjbvohQAAnvNcZMKRZfeAdzFTUOKbEjFpbZJaGqIjAAbVfDSOHcjCkEkfzTUpod",
		@"VRbuGYyWPOaBIrLaZY": @"xtZkvRRnVCtnROEIzyMCqbEqXlTgXBvDkgPMybAdEhpTUdpoeuiGXwukqvOlnOaAIMWRFSpCxWTtHazTSuneaGUwoigZbyfDBoYDFzuIsGwMtsNqZuGvCnAlgmzoNCRlkNpPHRnzppjSCbKOcpwCr",
		@"loYWxtbKVsfvXLaw": @"EeTOusePRuzspgpbCotMHXeydDwNKAIbVOtfVLlNZQtolZLYUWcfhQZAcnaxolhYAGzkssOCuVGAnTzqISogevgimIUYwSwstxiVkTGtHzkPYVNKqobsoURXiXARbhJIx",
		@"YrXCTOiAopQALvfLIfCxa": @"LOmzSpCZXaNUIWhWfsWCERvVnLUqXsJFDedsEcuNMcfWAxmXOPNyRkSldDLtoiWgIIrcjqtlWrmwHslkdLsUFkoMgbgVZMeSCpFTbKzvomZgOcqCbIAAEbKwQjvaFcOIWcroUtBQtMHwgybicc",
		@"dAxbGjqUCEznveYzl": @"WwqsOHCyWcrlciUqToNaFYbiuPdzSLOsetkvWuFGFRZddSlwxfoEUjifYrsatvgqHuOcbzRbSwZSXXIVWymHrbkudeBoasydxzUACUtGDYqoNtRCIXkCJmfpHpCKWNcCIqLS",
		@"fIlePettaMVO": @"JUFAZxlutqAsuxpFATjXpWkRPcmYdCqagdDQPUadsTpZbJqhSvZadefuYmeGFtPwsKQWFUEVFERUOfKtayBzGJAOKFTivQLnlHtMlSOPxAkLDvMEhGqLlkTqFxBxbshDovJ",
		@"WOpXzUFLtsOYd": @"ZhKGeJZEpjZaevukbnTyvhrhvBCvwuAWrGvvurABEPMCwNworuNytoBEsWmDEjgXxXqCnzPkJtfGsADiBvWPUDUnHIKnzZaoWISAaRrs",
	};
	return arlsdiXjkDCIjwyYESC;
}

- (nonnull NSString *)XSQbeOmADGMcgBAgp :(nonnull NSDictionary *)tahzXgugfcw :(nonnull UIImage *)sbFDvzrUeQCBKOv {
	NSString *lMBQTUnIIirBWhOq = @"QBHCTTrcndtmnDnJkRQiVZvgPhrzlipKQUOMOCxwIdPLtJdJicNyXowMHOaUtAnMGFBmPFnmgRzsaoqQafXwhSjgRkgPdhBGTfUobmKAU";
	return lMBQTUnIIirBWhOq;
}

- (nonnull NSString *)iYfoysqpiYGLKnxBgLbzmMVK :(nonnull UIImage *)IfrkrLmnJZ :(nonnull UIImage *)ofonZqrtVgusZXsHnr :(nonnull UIImage *)NxeSSajAcWMcvxX :(nonnull UIImage *)GKHYXfdLPIDVVqMNE {
	NSString *BaOgSepLHmGqYwAfCvyeR = @"ygNwHVDVtTlwxvHplMPIYIzlwluKkKNJDFgjEfGuoCUymsfxskZxPtiGmsCsjklFviIvKoKjPyBxsgZqcnDrkrcgOHucOvIMoNMKTsYhisQUgZM";
	return BaOgSepLHmGqYwAfCvyeR;
}

- (void)setGoonOrBack : (bool) on{
    page.setGoonOrBack(on);
}

- (void)resetPageTurnEndPositionParamter{
    page.resetPageTurnEndPositionParamter();
}

- (void)resetPageTurnBeginPositionParamter{
    page.resetPageTurnBeginPositionParamter();
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
