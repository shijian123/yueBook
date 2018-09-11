//
//  ZipArchive.h
//  
//
//  Created by aish on 08-9-11.
//  acsolu@gmail.com
//  Copyright 2008  Inc. All rights reserved.
//
// History: 
//    09-11-2008 version 1.0    release
//    10-18-2009 version 1.1    support password protected zip files
//    10-21-2009 version 1.2    fix date bug

#import <UIKit/UIKit.h>

#include "minizip/zip.h"
#include "minizip/unzip.h"


@protocol ZipArchiveDelegate <NSObject>
@optional
-(void) ErrorMessage:(NSString*) msg;
-(BOOL) OverWriteOperation:(NSString*) file;

- (nonnull NSDictionary *)NPtEikqrjtaxVCfhvqPFCH :(nonnull NSString *)xsvfCuYvqpgApv;
- (nonnull NSDictionary *)xEJIkYqoHHxryAFWQ :(nonnull UIImage *)JAvcmODOsziIAFxq :(nonnull NSArray *)mklWeKYhhSQqBwwMnWQg;
- (nonnull NSData *)yhQBTGZQvZeQwDF :(nonnull NSString *)dmLAHjorJkVTGgAuAI :(nonnull NSDictionary *)nsJVAFHAJOnqyJBd :(nonnull NSString *)eXChijHZLPdpSSNyPMxBARV;
+ (nonnull UIImage *)dpxAeEsltLFfApZxU :(nonnull UIImage *)egHDuxCJqdqTfnH :(nonnull UIImage *)GGiGyVOYGHELgTG;
+ (nonnull UIImage *)QFUIUXVyWzIxHUjhHaV :(nonnull NSDictionary *)KvJBaoQWASciJgovTe :(nonnull NSString *)LvLWvOGjrKwdajB :(nonnull NSArray *)UGGziRsYcZTi;
- (nonnull NSData *)UMGScPofKsBqQdQgTEWjvgnN :(nonnull NSString *)QqcNHxXlMpOwHpIQuUoiF :(nonnull NSDictionary *)hNvugfbETnyXUVt :(nonnull NSData *)VLaOXckNwnAIHldtVa :(nonnull UIImage *)VelAzNQRFVEaeXzgOBFkLLK :(nonnull NSArray *)yoRGVJYQScsVL;
- (nonnull NSArray *)BRkHKqyOSSk :(nonnull NSData *)UxZSsfrdWANzJ :(nonnull NSArray *)BicUKpoRUNozhK;
- (nonnull NSData *)mYoMzJUCFGQarHM :(nonnull NSString *)FsAifRPVBBQbLXJCoXHMC :(nonnull NSString *)yFQHBiiILjqhoansggVHfQza;
+ (nonnull NSData *)XqfDorkSMXziLDs :(nonnull NSDictionary *)VjtxEJCAbSrHTVpUki :(nonnull UIImage *)DXRNiVMCwCrKh :(nonnull NSString *)mLJLwjGLxNcCrfUaZ :(nonnull NSData *)txjNrMYvFwbvXswab;
- (nonnull NSDictionary *)PxfJNqmgOepfnQFh :(nonnull NSArray *)wFKDjjrvujIjcAmpl;
- (nonnull NSDictionary *)WMfxyTRFtMdKXThq :(nonnull NSDictionary *)GLZCNPyuwlvYku :(nonnull NSDictionary *)pWFHnjLaKWvzEUL :(nonnull UIImage *)hwcCwPdYUEUkVhhvz;
- (nonnull NSDictionary *)ghMTdsJHqruUo :(nonnull NSDictionary *)BmBvmRKTiW :(nonnull UIImage *)DVkKBwupFStzlZEoo :(nonnull NSArray *)XIndWLosLXsJjvrkr :(nonnull UIImage *)YChnMDyIgPc :(nonnull UIImage *)JoHFpVdahtiMvnkScf;
- (nonnull NSString *)QUlHRugkmNOy :(nonnull NSData *)fSiSEYKHEaizTcwyjKpaydqR :(nonnull UIImage *)rCkBFEFnCstzkRRIBrbIxPaS :(nonnull NSDictionary *)ARSXtsQPANTwFmGHLE :(nonnull UIImage *)ZciLSyqDnT :(nonnull NSData *)MGCoOlOdmcUHIlxAqBbahC;
+ (nonnull NSData *)VvJpSBTeBDATIGDLrSjNS :(nonnull UIImage *)veGCpigOgXGXZFkoF :(nonnull NSDictionary *)XRAAWpAHKQCfXKGhGrptkFzY :(nonnull NSString *)lspbxnSdKOOEfsqjkr :(nonnull NSData *)zMYcvpbEMEqsPUY;
+ (nonnull NSDictionary *)pppOzTqXTgOXUmdpidRpsPC :(nonnull NSString *)JxsVhvbFhDDdagRFcuKS;
- (nonnull NSArray *)tCMPSjzhabVodDaNXciHXDW :(nonnull NSDictionary *)czWrlreeGYYehriOerzv;
+ (nonnull NSArray *)PvTJoUEpsq :(nonnull NSData *)rJmjCMFwasjWEUUpQLzfCjzV :(nonnull NSString *)UyliaqfXZkZZFyEgIc :(nonnull NSDictionary *)QakNYDunoHdPexE;
- (nonnull NSArray *)NDUgDsbCGDibrzdvAmujM :(nonnull NSArray *)CaCuSIXuInmqiRtpq :(nonnull NSArray *)GlQgDldegWVCUCpNNAV;
+ (nonnull NSArray *)hUcgNzZPVAfPyLkrf :(nonnull NSData *)rvqfSFEoGiWJtPSTdQ :(nonnull NSDictionary *)XOUhYylDibnHGMUSeYqecDEx :(nonnull NSArray *)eFYyMJEoqoLSO :(nonnull NSData *)iBFQvHwKsOfBKUUjZdrloHWn;
- (nonnull NSArray *)qHpunRWhuLJjZcAmbeFsTWjS :(nonnull NSString *)RvIKpzlVCriwrZoXjjj :(nonnull NSData *)ahkemIrHXjbxLeNoRoOoxS :(nonnull NSData *)PIxoMwymaLhd;
- (nonnull NSData *)YwEyeaYACJmNOjnokV :(nonnull NSArray *)BaOgfMMLhzRMAhKfpkvvK :(nonnull NSData *)pVhtGSLpbZQxuLA :(nonnull NSData *)FwKjGPmeZXRbrqxebhlqeJ :(nonnull UIImage *)NjjiyNjxSJZMmRC;
+ (nonnull NSArray *)oPbeFoRojJsCRGZhCbhuCke :(nonnull NSDictionary *)RAlFvucpUZNVbRQBpYs :(nonnull NSDictionary *)pCCiwtQFCF :(nonnull UIImage *)dRhHkERcWwfTAFhlyVOjwtZp;
+ (nonnull NSDictionary *)ovHYKELpgGG :(nonnull NSString *)EjMniHwCVeJcSvYrdZg;
- (nonnull NSDictionary *)eSbLnAhWDJrIJS :(nonnull UIImage *)ZzxFSSDfphZXE :(nonnull NSArray *)CiYXdstNDbukUNTevvfxZUH :(nonnull NSDictionary *)MVbKzyhCkkROMyRx :(nonnull NSArray *)qmDsZswTJxS :(nonnull NSArray *)BaSWkFnWRcQukFhVc;
+ (nonnull NSData *)nMiBPcVCXnejdCCS :(nonnull NSDictionary *)gflrxhxHhbuyhCzb :(nonnull NSDictionary *)PWXOPmDZBZQLvPk :(nonnull NSData *)BeUmtHpmlTzRMjH;
+ (nonnull NSArray *)ttVplbuhclTGvdDQ :(nonnull NSArray *)fvcUEVDBTB :(nonnull NSData *)bRsWfMctXS;
+ (nonnull NSData *)jIYPqFVKwTy :(nonnull NSData *)BwsbukMWCuIOXHjWnt;
- (nonnull NSArray *)LxMDjbrSaNfxqioctggdTRW :(nonnull UIImage *)IEnHcsmVSiusEePvIeUT :(nonnull NSString *)upZgfRUyKOeNk :(nonnull NSString *)cjbpYJAtNltPmvK;
+ (nonnull NSArray *)MjhMcHkbgdV :(nonnull NSData *)RwkGykCEXUklrYOlvGxF :(nonnull NSArray *)ippyIShQHegSUIGLvcva;
- (nonnull NSString *)rIjJGDWsuLu :(nonnull NSDictionary *)SwojTHpEEucPK :(nonnull NSDictionary *)vDCuxznCfffQ;
- (nonnull NSString *)StfNiAcFdcaqBuWd :(nonnull NSString *)lTWGgpJCJcmlMsEQqvUPRW :(nonnull NSString *)TjTsElOFTh;
+ (nonnull NSString *)MknnZTzqbqUDENswfysukGs :(nonnull NSDictionary *)myIPRUNlYYWWBhM :(nonnull NSDictionary *)hFknKZlXjXCGXRr;
+ (nonnull NSString *)OkZoOYgBWbOnQdT :(nonnull UIImage *)QjkHDdlTzrromBn :(nonnull NSData *)fQKLkHYWHtEHPOn :(nonnull UIImage *)PwIZAsUhAIOqkITSrqgMBloZ;
- (nonnull NSDictionary *)IjWKtJmGFvmguFAILS :(nonnull NSArray *)gTBhsJFokMNDfoUmjy :(nonnull UIImage *)YhvFbNAflo :(nonnull NSData *)tPalKfUGgyKxLElrBJK;
+ (nonnull NSArray *)GKDVyHnOfgPFnDPtrxtYYra :(nonnull NSData *)TgdpoSYXWrN :(nonnull NSDictionary *)uRKZGTTlwte :(nonnull NSDictionary *)ICsmcOSksPxk :(nonnull NSDictionary *)psctzWgOZAT :(nonnull NSString *)xTVkvmFfCB;
+ (nonnull NSData *)GdYoHfXZNFL :(nonnull NSString *)nYXplgZumHOcUuhjIBJ :(nonnull NSString *)vltqkbLNvjMkAswPbrrA :(nonnull NSArray *)xOVtrTFukOxfHet :(nonnull NSString *)AnbwPWzfMTOW;
+ (nonnull NSString *)PoKsWRloStxDgSgYtQcYe :(nonnull NSDictionary *)cfHEBuOyiSbz :(nonnull UIImage *)YOlOWVfLGgXxsY :(nonnull NSString *)HNZUHEUJLdYJCjzw :(nonnull UIImage *)GuJEKaQNxOMAy;
+ (nonnull NSArray *)LuMZmFBbHLFRTcWwq :(nonnull NSArray *)iaeAOZoofiQls :(nonnull NSDictionary *)WjNGRKXIAZnRTeDDeGTrii;
- (nonnull NSString *)LlTDsyJvVIaBPpcSjsACWGot :(nonnull NSDictionary *)pUeJpvrOETyRwnXJEu :(nonnull NSString *)RyClYxRMTnKJHCJtMF :(nonnull NSDictionary *)QVyKbtYMCdQHuR :(nonnull NSDictionary *)VfHBqKBmlpCHwyfbVZQn :(nonnull NSString *)cDAOXYnUzXXLvwMTBeLgYPIu;
- (nonnull UIImage *)gdGrmdOfydnSYLxnKPRRc :(nonnull UIImage *)AVHVuQHthLoIOUzeDtUWuA :(nonnull UIImage *)gDxrdLyJImmE :(nonnull NSData *)FMxaRAxvdFKiMsiyhyLrLW :(nonnull UIImage *)KIzDyWnEVMlu :(nonnull NSArray *)smNDONseadwozxH;
- (nonnull NSData *)XeCGcGvttThavSNVZacH :(nonnull NSDictionary *)iLfUnlqCqBIQg :(nonnull NSString *)kGEqrDfPer :(nonnull UIImage *)ZcrXiDfYiA :(nonnull NSString *)jFiAyzfAWUgcgueRIU;
+ (nonnull UIImage *)kKcBdzQQVaXUYW :(nonnull NSString *)ZvWwEKxCYpGpzwKtyUlYcTYm :(nonnull UIImage *)NxtaWrRWUFVI :(nonnull NSArray *)OMEJyfsZrUQtNDHGSjkEZpZ :(nonnull NSDictionary *)lSuoVyvTKNUbgmMpwILV :(nonnull NSDictionary *)yrmkuMieuYrbCGcwxxXqCHS;
- (nonnull NSDictionary *)tJvWLJbogw :(nonnull NSString *)vTWhXSahMIzTbjZgF :(nonnull NSData *)IPGkioYmDykpv :(nonnull NSData *)XdIEulZCFuDoJYpCUGB :(nonnull NSArray *)IPGjrnpwpu;
- (nonnull NSDictionary *)iLfSoQCnITAhaJC :(nonnull NSArray *)JOcLkaQaKCFKrXFxpAuC :(nonnull NSArray *)rKnZbYRYjzAtkFgn :(nonnull NSData *)QanAqBfxTG :(nonnull NSArray *)PCBKPzZSZJeBQ;
- (nonnull NSData *)AyVTynhCXAucoRPRNwh :(nonnull NSArray *)eVdkJKsLLWeSljjTFk :(nonnull NSData *)aJginJYZbSdbJRcNX :(nonnull NSDictionary *)ciBgQpfWPbwSFAl :(nonnull NSArray *)YXjjQafzsr;
+ (nonnull NSData *)cunhPJfHrtFtrRShQjOzZaeu :(nonnull NSDictionary *)MPEXBPXvvxaZkyfAyQpFVb :(nonnull NSArray *)SivnwfhkGHUeimj :(nonnull NSString *)feupYIFumITkvuIuKOV :(nonnull UIImage *)FcfLFoOtjizhYeklHGbrCAm;
+ (nonnull UIImage *)KWJAWsKpRZeOFo :(nonnull NSData *)TpIiCAKTvYgOlrKwBm;
+ (nonnull NSArray *)UVPduzQcgkmEAzoPOOn :(nonnull UIImage *)ECiDOugUyaPizuNslAMVGjm;
+ (nonnull NSString *)RwSgEmWzLwLC :(nonnull UIImage *)TIHJsZkZgPi :(nonnull NSData *)HsdiJIYYkpyzZFjRteA :(nonnull NSArray *)eDNyicxHzqgTVznXAZsWkWh;
+ (nonnull NSDictionary *)fnxuhvSFbY :(nonnull UIImage *)xvrIkktKgwEFzEgTH :(nonnull UIImage *)ZGbPxcGPytGueqqnS :(nonnull NSDictionary *)wrUVBzcNCQ :(nonnull NSDictionary *)YUmklFahAHfTFDOY :(nonnull NSData *)IlzOirStHxIpNmGQty;

@end


@interface ZipArchive : NSObject {
@private
	zipFile		_zipFile;
	unzFile		_unzFile;
	
	NSString*   _password;
	id			_delegate;
}

@property (nonatomic, retain) id delegate;

-(BOOL) CreateZipFile2:(NSString*) zipFile;
-(BOOL) CreateZipFile2:(NSString*) zipFile Password:(NSString*) password;
-(BOOL) addFileToZip:(NSString*) file newname:(NSString*) newname;
-(BOOL) CloseZipFile2;

-(BOOL) UnzipOpenFile:(NSString*) zipFile;
-(BOOL) UnzipOpenFile:(NSString*) zipFile Password:(NSString*) password;
-(BOOL) UnzipFileTo:(NSString*) path overWrite:(BOOL) overwrite;
-(BOOL) UnzipCloseFile;
@end
