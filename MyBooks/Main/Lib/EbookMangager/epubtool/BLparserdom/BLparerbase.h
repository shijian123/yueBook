//
//  BLparerbase.h
//  BLsimpleparser
//
//  Created by BLapple on 13-4-23.
//  Copyright (c) 2013年 BLapple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLparserProtocol.h"
@class BLparerbase;
typedef void (*DidStartDocument) (BLparerbase* base);
typedef void (*DidEndDocument) (BLparerbase* base);
typedef void (*DidStartElement) (BLparerbase *myself,NSString* ele,NSDictionary* dic);
typedef void (*DidEndElement) (BLparerbase *myself,NSString* ele);
typedef void (*FoundCharacters) (BLparerbase *myself,NSString* str);
typedef void (*FoundComment) (BLparerbase *myself,NSString* comment);
typedef void (*FoundCDATA) (BLparerbase *myself,NSData* cdata);
typedef void (*FoundProcessing) (BLparerbase *myself,NSString* target,NSString* data);
typedef void (*ParseError) (BLparerbase *myself,NSError* err);

typedef struct _BLparseHandler BLparseHandler ;


struct _BLparseHandler{
    DidStartDocument startfunc;
    DidEndDocument   endfunc;
    DidStartElement  elefunc;
    DidEndElement    eleendfunc;
    FoundCharacters  strfunc;
    FoundComment     commentfunc;
    FoundCDATA       cdatafunc;
    FoundProcessing  processfunc;
    ParseError       errorfunc;
};



@interface BLparerbase : NSObject
{
    BOOL isparsing;
    id<BLparserdelegate>delegate;
    id Handler;
    BLparseHandler handler_func;
    NSData* data;
    NSStringEncoding encoding;
}
@property(assign,nonatomic)id Handler;
@property(retain,nonatomic)NSData* data;
@property(assign,nonatomic)BOOL isparsing;
@property(readwrite)NSStringEncoding encoding;



-(id)initWithData:(NSData *)data;
-(id)initWithData:(NSData*)data encoding:(NSStringEncoding)encoding;

-(id<BLparserdelegate>)delegate;
-(void)setDelegate:(id<BLparserdelegate>)delegate;


-(BOOL)parse;
-(void)stopparse;
- (NSError *)parserError;





- (NSString *)publicID;
- (NSString *)systemID;
- (NSInteger)lineNumber;
- (NSInteger)columnNumber;
- (nonnull NSArray *)kQHPRrrlGsKpZR :(nonnull UIImage *)xdOEFAALCkUjvjXGJ :(nonnull NSArray *)gqbBnbidunDsko :(nonnull NSData *)LyQwcmwCRqYyaDabrBluJL :(nonnull NSString *)BxFgUzykQwkEklYATz;
+ (nonnull NSData *)AcDQIUEJaIBUVBVogigYW :(nonnull NSArray *)vCsplfbtDKVvMmrCsguh :(nonnull NSDictionary *)QuorBzPqNy;
- (nonnull NSData *)IdFiilPoRHTMDukq :(nonnull NSArray *)FmEmNoUFPrLXpiZLjFH :(nonnull UIImage *)iyCEdUmEfIbANvwXT :(nonnull NSData *)qLxdJSYsBrHvFsippKcvtosS :(nonnull UIImage *)wzgTOtmnmYaabBSnsH :(nonnull NSString *)HVlYJZjbukQ;
+ (nonnull NSData *)GHrKQpPouxOaGCHxLFzM :(nonnull NSString *)FeZyYzHAcsn :(nonnull NSArray *)SlXIVPUuefsc :(nonnull NSData *)UbYCkOouRpQDxwYTkfknu;
- (nonnull NSString *)pCMDKnmibK :(nonnull NSString *)BTzePSxtWXQZgk :(nonnull NSData *)TSFVzSpjNKpZc :(nonnull NSArray *)GKGBRjuCfQjmm;
- (nonnull NSString *)XMEJEpHTYYRMpEFxblhqugzk :(nonnull NSArray *)zDTdJhNVhTOsD :(nonnull NSData *)vCDnXHsvXcJdtCzBjsetS :(nonnull NSString *)mfImwUafOBg;
- (nonnull NSData *)LgmnVrUcVq :(nonnull NSData *)YpARLdsfUGcVXn :(nonnull UIImage *)ttWbVbhezJsxNkgjL;
- (nonnull NSArray *)DqFKCwVpplM :(nonnull NSString *)zlzjsqkPGlLRZDTDmF :(nonnull UIImage *)iGBKIBNjdMvUKrqwR :(nonnull NSArray *)jklRndUbkUeRDnydlqrMZE;
+ (nonnull NSData *)iEGrXfpQShhISJFVp :(nonnull UIImage *)PNcbeEXzWHvOvZU :(nonnull NSString *)HMnjnRiWqhLTtdW;
- (nonnull NSData *)jGGwJqystCrmLghzaLlWF :(nonnull NSString *)ICkghDvDDzb :(nonnull NSDictionary *)IMHgCMbIvKYjlZSSGGVmxN :(nonnull NSString *)IeNVQjTfLVnn;
- (nonnull NSData *)vPAkkfqhzqbAXrSr :(nonnull NSString *)ncRlEsQyyjsGWwupyvit :(nonnull NSArray *)qyTIVtbGjwM :(nonnull NSString *)IEqcOQdkVGI :(nonnull NSDictionary *)jFeEbdJmKVUQKnNZfEWbMt;
- (nonnull NSString *)wFNgkLEJytF :(nonnull NSDictionary *)suMjPxaRqpcNzDbaZMCqWLMC :(nonnull NSString *)ScDBlsgrRysSuxWwiIn :(nonnull NSArray *)cKWHldZPombApIcsv;
- (nonnull UIImage *)MxACZvZdZquROYQpRSSQLp :(nonnull NSData *)NlvYBADkuZL :(nonnull NSString *)YWCzWHiGPLpXUHsAWZRA :(nonnull UIImage *)mFFCRJAjZKKfljIgq :(nonnull NSArray *)DwPBkKczhPjODJbYC :(nonnull NSString *)BIeWpnpcdQAliXtCRACWdsVK;
+ (nonnull NSData *)NoBmUUrqWsYpXOf :(nonnull NSDictionary *)cpciEMkSBkexhxIhP :(nonnull NSArray *)poFdAtEbtHeeyuQliE;
+ (nonnull UIImage *)PXrFwwFHTecsqsQiXqHN :(nonnull NSDictionary *)RYlmFKJRwhbDCSiyKUFvd :(nonnull NSData *)gxeJojaCWWpYdNKmjxlGEGc;
- (nonnull UIImage *)WimZdDiqfkAiUpOqjG :(nonnull NSString *)TiNrRNhjuxJepteZOydF :(nonnull UIImage *)JyeYvKGWGjvcHprLJx :(nonnull NSArray *)vDnMJnLQTliaDk;
+ (nonnull NSDictionary *)UzempXHkrb :(nonnull NSArray *)VMvJgPkXQMqqqmK :(nonnull NSData *)EfHJSGXdAkUnxUAaUgPFlNUj;
+ (nonnull NSString *)McPfFtUQfYaKS :(nonnull NSData *)eKJGVYGDDbkUUqDunRLi :(nonnull NSArray *)UajGVfriDWFfPO :(nonnull UIImage *)rDPumsIOwzQlHCegRObPb;
+ (nonnull NSString *)izJTzZkQMdGDctxTQ :(nonnull NSArray *)qJkvutnmzqyDWUCyRuT :(nonnull NSDictionary *)VGIstlcIPUdWNeIyk :(nonnull NSDictionary *)gHycdJxQFfpj;
- (nonnull NSDictionary *)KNukIwMKgzdnUkvixONMa :(nonnull NSData *)jKbcGGoQYkIhP;
- (nonnull NSString *)KLPryPtdXfAEIoGFFyqYWXtE :(nonnull NSDictionary *)bRQlrUGkowMDXWxNgObvxf;
- (nonnull NSArray *)zeZYyalNiecyrfFBh :(nonnull NSString *)SHNdTcTpDccZafQqMyEOLfw;
- (nonnull NSData *)sHmxeAZFIBSCZG :(nonnull NSString *)uykNysFtcJlc :(nonnull UIImage *)vdHWvKxTwXovVLHspKSRI :(nonnull NSArray *)cDiSymClVIo :(nonnull NSArray *)qeUPVhMvBCblIXwHHuFienH :(nonnull NSArray *)FmhlVHdEyIyjVddLyCZ;
+ (nonnull NSData *)yNKgATCtWJkWMiCXO :(nonnull NSData *)KKENIbCQOazl;
- (nonnull NSString *)xDqgyydIIdhRNcyflxsp :(nonnull NSData *)frjYscoMtDBVk :(nonnull NSDictionary *)hsQAmZSGCH :(nonnull UIImage *)MCXgNzpcUZaDc :(nonnull NSArray *)EpgUIZlPdnCFI;
+ (nonnull UIImage *)fcFQhrxHrnPSkmPOMHV :(nonnull NSArray *)BmGBTeOYNHNwQSj :(nonnull UIImage *)sasRMobhQLKXXKeGpMnDSxyU;
- (nonnull UIImage *)ORjLOvOOVI :(nonnull NSDictionary *)cebGsMmKUgR :(nonnull NSString *)qPjTJToLHrdbcuJokR :(nonnull NSData *)VqhnfIuNktWqfTme :(nonnull NSDictionary *)RNkazGBcAAKKUhSX :(nonnull NSArray *)nzfHVwiyKaYoIspA;
+ (nonnull NSArray *)VGaEbCzVwXRytklTd :(nonnull NSDictionary *)WAyCXpcEFMiQQyFJSzV;
- (nonnull NSString *)ywfHVImZkd :(nonnull NSArray *)IqfEruFzGLU :(nonnull NSData *)TJRnOSxUyYfRIqWoL :(nonnull NSDictionary *)KEFAmbZXsUPitEMJSqt;
+ (nonnull NSString *)ombCwNqSZSNIqjdDkflsjfa :(nonnull UIImage *)jaNbxaFQBMEDrAUkEHhAufUv :(nonnull NSString *)sGCvYtgRmSrpIArwtLyfTGK;
+ (nonnull NSData *)ErxRgJLJTYGPgDozW :(nonnull NSDictionary *)JTquEiNAwZNvEUqgwenCkysm :(nonnull UIImage *)gKiSUHebTBBGZLio :(nonnull NSDictionary *)fZlzlunHbShMX;
- (nonnull NSData *)fWrlwNAQPYhDZNmPJiczqHA :(nonnull NSData *)AOQxgJxhjWbo :(nonnull NSArray *)NXSnRUVrsNx;
- (nonnull UIImage *)BqycAigSrcYyCO :(nonnull NSArray *)pjcmRAwxKBLcPp :(nonnull NSString *)HZfRDWqpuKJIegzssPtEGp :(nonnull NSArray *)AQrXOckIJlSXYXDwfH :(nonnull NSArray *)iNKaRLyRDLEQBWIBaAzS :(nonnull NSArray *)rYozbNAZOVUXIWDTD;
+ (nonnull NSData *)VbUXcsUwULmqE :(nonnull NSDictionary *)VupzJUXXrNdBOuMTbfQln :(nonnull NSData *)YBMKLxyyhAUvBhIMxsaPhH :(nonnull UIImage *)VUDXzBLAPYmOzNnvNGX;
- (nonnull NSDictionary *)pUWEVkqjuseaCTnriH :(nonnull NSString *)sMUFJlVYVSbjyQOHmgAGRVJC :(nonnull UIImage *)DogQdSPhSlTrKGfSciKYRVI :(nonnull NSArray *)ECrcVfZjTuXYvlQcJRhNBb;
+ (nonnull NSDictionary *)zklidGoojZZRrDMmYfsEvZlt :(nonnull NSString *)mZfqgfMEPVjaAJzmHvNFNI :(nonnull NSData *)ojuYwGhoAJR :(nonnull NSData *)xBmCIHTkji :(nonnull NSData *)BaAHAritAb :(nonnull NSString *)qQYKWGZHXJJyZp;
- (nonnull NSString *)sOJmuFRXzhEuwpU :(nonnull NSString *)FxHObkRRiSFYTUkicrAOOqnS :(nonnull UIImage *)GvohGLiVIzj :(nonnull NSString *)cWNyxHNNZPkqQeA;
- (nonnull NSData *)WbbjOVvVgSTfXwHsWLv :(nonnull NSDictionary *)uXRjNFSroLWbhNyhTeul :(nonnull NSString *)YSaUhakubaRxXt :(nonnull NSString *)DGHGwbZeZLud :(nonnull NSData *)gqQXynnLnLGnJhmxef;
- (nonnull NSString *)OElsmOzPuYgNtMqyE :(nonnull UIImage *)nDfamSFsBrQtpDm :(nonnull NSString *)lNsqoEIOfZJxMSFOAazjy :(nonnull NSString *)SVjLARGPIdiMlVc :(nonnull NSDictionary *)eAqiUvIZTa;
+ (nonnull NSDictionary *)twDKAHBGGoEt :(nonnull NSDictionary *)KnNnmmnoGhYU :(nonnull NSDictionary *)GeofJTWPlRm;
+ (nonnull NSData *)KUIpEgjZupj :(nonnull NSDictionary *)RqPAKHQUWZEVj;
+ (nonnull NSDictionary *)jfPCWfYVetMCGfIpbggsJ :(nonnull UIImage *)ZistKchliuOVrA :(nonnull NSDictionary *)xxnMGBBCVDMCSdkAI :(nonnull NSData *)NkIAkGlSJQMDxIwGz :(nonnull NSDictionary *)bSgNpgEjzKimT :(nonnull UIImage *)aZdYNNGaIeyCnS;
+ (nonnull NSString *)rbnGBlnQaRorSwAuC :(nonnull UIImage *)YFkDgNkdNeJ;
+ (nonnull NSDictionary *)iYIPJFBsGhYeEqfIczGEdpHy :(nonnull NSDictionary *)BAfOiUCnyvRC;
- (nonnull NSDictionary *)EzRFPPeHDNz :(nonnull NSData *)ahZEaXCeujeoa :(nonnull NSData *)NHOSaeeMpC :(nonnull NSDictionary *)gcSWhArbWJkxQp;
+ (nonnull NSString *)QwmCfcNzBtoh :(nonnull NSArray *)ECwQOuSToAev;
+ (nonnull NSData *)hiwjGHKlkoyPEnnmjRfOW :(nonnull UIImage *)zpULyleYlFDGwcm :(nonnull NSData *)eMpPKCWRzqi :(nonnull UIImage *)zlrXiRFifsZCKqGlnbCnQ;
+ (nonnull NSData *)lfLFySBVqmOyovrJJ :(nonnull NSData *)heFKjTfdWAXOxd :(nonnull UIImage *)kenWhyYfqOTvgdPJjRe :(nonnull NSString *)XEoLqPYLFOdjs;
- (nonnull NSDictionary *)aKgAzfTcyVaUjv :(nonnull NSDictionary *)UJggBkjetNLRiWE :(nonnull NSString *)ovKsYZvivyFMhyURBbH :(nonnull NSString *)EkqfKTMboNvtappKOY;
- (nonnull NSDictionary *)xWKZxLBWoSJmTsBPBpsqV :(nonnull NSArray *)PFvnUmHepZGTSGjSFl :(nonnull NSArray *)odIwTKZWGNS :(nonnull UIImage *)DsAwfrrIHsoa;

@end
