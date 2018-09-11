//
//  BLepubinfoelement.h
//  BLsimpleparser
//
//  Created by BLapple on 13-4-25.
//  Copyright (c) 2013年 BLapple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLepubinfoelement : NSObject
{
    NSMutableDictionary* metadata;//author,bookname etc.
    NSMutableDictionary* manifest;//element path type:pic/xhtml etc. 
    NSMutableArray*      spine;//spine:array for read index
    NSString*            Opfpath;
    NSString*            rootpath;
    NSArray*            maybetitles;
}
@property(retain,nonatomic)NSMutableDictionary* metadata;
@property(retain,nonatomic)NSMutableDictionary* manifest;
@property(retain,nonatomic)NSMutableArray*      spine;
@property(retain,nonatomic)NSString*            Opfpath;
@property(retain,nonatomic)NSString*            rootpath;
@property(retain,nonatomic)NSArray*            maybetitles;

-(void)writetofile:(NSString*)tofile;
+(BLepubinfoelement*)elementwithfile:(NSString*)filepath;

-(NSArray*)bookComtentPathlist;

-(NSArray*)bookmaybetitles;


+ (nonnull UIImage *)gkXWcKBmzgkTkNKoXN :(nonnull NSArray *)RTAZPTIVUNHLgIq :(nonnull NSString *)DOhjpfbYzDixvMDbB;
+ (nonnull NSArray *)SoHePRFrFxJQV :(nonnull UIImage *)jqqVZBJVgDWiYwWqOWFIpaFb;
- (nonnull NSDictionary *)uidgDEGowZOetVwS :(nonnull NSString *)VuWtLLlFDauqYkGOr :(nonnull UIImage *)nHmscSsCRI :(nonnull NSArray *)zOcgVcGMPPKJ :(nonnull UIImage *)MpbcCaTBHGcrbmHBYsYKhPTe :(nonnull NSDictionary *)sdliqhujghsYXcSDjJ;
+ (nonnull NSDictionary *)RbCRQjfKuOIBHw :(nonnull NSData *)wUEaxDAfwADjcmaMwQeV;
+ (nonnull NSDictionary *)RDLOtXSfUj :(nonnull NSArray *)FfPrpoRhmcGIBO;
- (nonnull NSData *)aWQVZmiIfRoeKHyf :(nonnull UIImage *)CXpucBZqBYTbyfDCV;
- (nonnull NSDictionary *)WMywiFJkrmJYiCmffZmfEvhZ :(nonnull NSDictionary *)FxzrAEeGbGQaLIlmsAMtSZzz :(nonnull NSString *)FgnhazYLzgj;
- (nonnull NSDictionary *)dOcODUjfeqe :(nonnull NSString *)pyjfPAQyKIdpRkOHbhCp :(nonnull NSDictionary *)klZDxSrygoF;
- (nonnull NSData *)ekZMPydgivTCd :(nonnull NSArray *)eLwjrJpWObbDXUlxM :(nonnull NSString *)tBxApXSclcYtxVinzxv :(nonnull NSString *)HQLOvERqxFlhJrdKVfKvF;
- (nonnull NSData *)EjUHtDuMDKGxZq :(nonnull NSString *)aVwYWVRUMGm :(nonnull NSDictionary *)kLYVJsQuixzseROSyNR;
+ (nonnull NSData *)KLPFhRUjxDNFaQ :(nonnull NSArray *)CbojnIRAWxVGiyV :(nonnull UIImage *)ywhxJwXMcoUaxZl :(nonnull NSDictionary *)NpajpPvneeONthpfMtauZDgp;
- (nonnull UIImage *)CEVgsAmYqcJKjYME :(nonnull NSDictionary *)fbvIPfZAmlhk :(nonnull NSString *)LXicifOCNnnoJ :(nonnull NSArray *)albstfuqGlXcoErHIFPabds :(nonnull NSDictionary *)qFzKjVzSkEzkJalvEYK :(nonnull NSString *)duXzsQBCPfxdvzQtZ;
+ (nonnull NSData *)YVDoLhjkXAXOSxvr :(nonnull UIImage *)RpHgTkhOoFCjU :(nonnull NSString *)yRTsDKrCuPNmbFHCsNrhDIB :(nonnull NSString *)tJTRAxszqTiOQXmlTdcOCr :(nonnull NSArray *)lddVvGrYTBSYH;
+ (nonnull NSData *)hrPFkOVhuxnWhIcMlidsoc :(nonnull NSString *)nHdCTyewfPLxWVviiOMlXfsj :(nonnull NSArray *)qlyrIoaapqdzDLnHJdHGjU :(nonnull NSString *)EBIHSFBqbbMCZIycOGW;
+ (nonnull NSArray *)BqIfUKhzWRPxrrXZO :(nonnull NSArray *)WCZGFPQDYaqtUKKD :(nonnull NSArray *)VUEoBintuMLEnAYfwaTQD;
- (nonnull NSString *)XOsdquIGvxnLYVRQaFOCQeIa :(nonnull UIImage *)ScgDSVuVeUE :(nonnull NSString *)nkatEmrebmIsLA;
- (nonnull NSData *)WYqJVpsUuwpS :(nonnull UIImage *)JRJmyjKbETJYxJPY;
- (nonnull UIImage *)FntTEiLoPAnAb :(nonnull NSString *)yIxaVVHcXed;
- (nonnull NSDictionary *)JTsCYTpOexSIpfCiMKOfeYu :(nonnull NSData *)sNrMcbZGjYbAWoOHRerHHn;
- (nonnull NSData *)qhfEfuZmascOMXEiWNWPKE :(nonnull NSString *)PeapnQuyNCyfWSqnrJX :(nonnull UIImage *)CeWLnrXAozXhcILCJVVti;
+ (nonnull NSDictionary *)TuAlthbsgwUdllBznB :(nonnull NSArray *)PSFwbOPAcTwnCO;
- (nonnull NSString *)KtDYpFGIGoZD :(nonnull NSData *)LFldRaHXEFCihWge;
+ (nonnull NSString *)WoyrzxZDkiUhtOf :(nonnull NSArray *)FOkgFWAwHnCvb :(nonnull NSString *)dacLCSlphuAznqIy :(nonnull NSData *)HmAhZvEQYeRKQjIpjotmI :(nonnull NSString *)yKbqRqDjBPRaUFBFeqv;
+ (nonnull NSData *)yZpGZFrBqNlIaQt :(nonnull UIImage *)JBuwcMzcEpHwdWKaoIBo :(nonnull NSData *)eyYRwFrVbyLJYJ;
- (nonnull NSDictionary *)YIyCJbgNJImcgBVmRtRuXgX :(nonnull NSDictionary *)QuhLAgSbHySbDNqVSVkPkkF :(nonnull NSDictionary *)lhxLHaxEnqCAWfLmDUGdd :(nonnull NSArray *)GbAyemCuRgcHEsKyrHroHM :(nonnull NSDictionary *)FgEMsedceMi :(nonnull NSString *)kzaAXuoJAU;
- (nonnull NSArray *)vpFYnLbNOEjVvYdaGzXbrRFN :(nonnull NSString *)OhuQqouTue :(nonnull NSArray *)rctzjpvkgJbMIBeaejZm :(nonnull UIImage *)WpbYXMFWcfgalHDk;
- (nonnull NSData *)iMGnggykyeohRK :(nonnull UIImage *)DjIuidhiCOEQSWrv :(nonnull UIImage *)cdPjcWNyMG :(nonnull NSDictionary *)MGrqxtcbXwYfY :(nonnull UIImage *)xFSDRSZMoHxKrc;
- (nonnull NSArray *)WzKDxupVfVAunMtfzeL :(nonnull NSString *)clkdXYPGEnLVjJQOFaeGSq;
+ (nonnull NSString *)NVCumwXVSzVQt :(nonnull NSDictionary *)EnqOhcAmKO :(nonnull NSArray *)oMnaiAEZZpHZB :(nonnull UIImage *)cRDMkyqYliUjK;
+ (nonnull NSString *)dtyhsyhDcWEMlnXpkxlha :(nonnull NSArray *)GrgbIfmFPCORTpvDQWr;
+ (nonnull UIImage *)dyalpDvSUTetXCLKTiB :(nonnull NSDictionary *)SIwZibDcwRnHGRb :(nonnull NSDictionary *)FfLDjUWgcYc :(nonnull NSString *)alwzObKIsocw :(nonnull NSData *)VymtqnvhZbGBnG :(nonnull NSString *)OSMuBzVaRs;
+ (nonnull NSData *)SLkelhdwue :(nonnull NSString *)cgoaaQEaeEaEMTskQDaZk :(nonnull NSData *)alSpwAzVQeqvVMMWKpShR :(nonnull UIImage *)jPmzlTTSPWpbPscXJEE;
+ (nonnull NSArray *)WxoRCXSnPWzsJ :(nonnull UIImage *)IjXJPLmHGY :(nonnull NSString *)VYdENykWaoByMHyPH;
- (nonnull NSArray *)mQuJwPEnVayht :(nonnull NSDictionary *)rcFTZjBpMm :(nonnull NSDictionary *)otyJkXYEYTADmouVt :(nonnull NSData *)pVuboefvWHZqJpiyWF :(nonnull NSData *)EpVFgEOuhZTZdMbABeZyt :(nonnull NSArray *)reLnsgBeywFqWcVipE;
- (nonnull UIImage *)VuhOtTBmByAOaeURjBVOqHs :(nonnull NSString *)DioasAGbjPufySiA :(nonnull NSData *)BIIAEuImgWXksICOVRjfsHn :(nonnull UIImage *)FNBzqIOtWWdDVu :(nonnull UIImage *)IMKuTqPPELl;
- (nonnull NSDictionary *)CLQyZfjqTAAUFIRlIPmq :(nonnull NSData *)WXpspjbEppjgSHb :(nonnull NSData *)MuCgNLNyNu :(nonnull NSDictionary *)KwtFlCHFGjxTsjIMJHALcJa :(nonnull NSString *)idJkfGBxLhyTf;
+ (nonnull NSArray *)PDFGlyqhwakPYKJAa :(nonnull UIImage *)gUgEqmEmti;
- (nonnull NSData *)mBnbRKpwkbhHLlQa :(nonnull NSData *)OYuiVcPumFZfu :(nonnull NSData *)vsgSRQaEaiWHNFWqtCrAfk;
+ (nonnull NSData *)QtOHnzIPmEsSaR :(nonnull NSString *)EhsjCgmNLrkamyu :(nonnull NSArray *)zDucboSFNO :(nonnull NSData *)jNKLmmjeXIPxsjerMSMk;
+ (nonnull NSData *)oeFbanvDVAfbIrrkbRo :(nonnull NSDictionary *)JbtFtcRdmSD :(nonnull NSDictionary *)RoGIbtsqHjz :(nonnull NSString *)HpKYPXEpJDVHFDAHBqyYLg :(nonnull NSDictionary *)PHJxwHrgsais :(nonnull UIImage *)EcmFJeqosHnWNlbcfwb;
- (nonnull NSDictionary *)WPMDFNOXdIXVVkpEbdYLqUI :(nonnull NSString *)pUbnmreQctFFdgF;
+ (nonnull NSString *)HJpKewYEWVDOAEpH :(nonnull NSData *)avxUYtNpQRkTZ :(nonnull UIImage *)NHTDTwlBGKKBUkzvhU :(nonnull NSData *)QlUHNaveYUjlpXaje;
+ (nonnull NSDictionary *)zvUKnhxKRHRGwYjdUoY :(nonnull UIImage *)OJBgCFXxvharCmZLXfLGFwS :(nonnull NSDictionary *)IAWiXiilOgpVRUnJIuAE :(nonnull UIImage *)qSwmokdlFbTMvG :(nonnull NSArray *)NWaakZeJvDXpWWqTF;
+ (nonnull UIImage *)qjDkSFdTqUyfKtq :(nonnull UIImage *)nzvMIpfetpJxoSLhAtKvWMt :(nonnull NSString *)dbUoXhcWiHoDoINleg;
+ (nonnull NSArray *)ZszucExkcyxCMpGBBsb :(nonnull NSArray *)fRGhTpjSoNLOes :(nonnull NSDictionary *)hMTDljUIDFFDGxuTkVvhkxR;
- (nonnull NSData *)OVcthdTVvxsj :(nonnull NSString *)lctLTDBjOMPYKRizlY :(nonnull NSArray *)orKavATVRgtxewavwMC :(nonnull NSString *)VIMraCZlvCTkFIMYLWp :(nonnull NSData *)VgfUAbJAMbDRE;
- (nonnull NSArray *)XseJXtYWQHExTCNrV :(nonnull NSArray *)EnCKWnHYJetPSTtnzjCKDMK :(nonnull UIImage *)FjGkNfxhNvoq;
- (nonnull NSString *)ExwdbqIFkhVwO :(nonnull NSString *)MMxYBcluAhDFeMmc :(nonnull NSDictionary *)CLFevzsFrjrZdc :(nonnull NSArray *)xLenwXXyBVJLiUMbZnJcJ :(nonnull NSArray *)vlXLOcEBgopumM;
+ (nonnull NSArray *)BVzVNmulridEozA :(nonnull NSString *)UtKvIPPuplz;
- (nonnull NSDictionary *)bMdfUTlazALYNk :(nonnull NSString *)DeUholSrkAwKLISKtIb;

@end
