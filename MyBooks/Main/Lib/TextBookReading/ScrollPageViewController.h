//
//  ScrollPageViewController.h
//  SimpleMagazine
//
//  Created by lzq on 12-8-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "SimpleTextBookReadingHelp.h"
#import <UIKit/UIKit.h>
#import "BLpageScrollview.h"
#import "CustomPageViewControllerdelegate.h"
#import "customcontroller.h"
#import "BLviewhead.h"

@interface ScrollPageViewController : customcontroller<BLpageScrollviewdelegate>
{
    BLpageScrollview*  BLpageTest;
    id<CustomPageViewControllerdelegate> CustomDataSourceDelegate;//delegate
//    NSInteger CurrenPageIndex;//当前页面索引
    
    BOOL  pageisdouble;
    CGRect selfframe;
    id<BLviewdatasource>    datasource;
	id<BLMidclickdelegate>          midclickdelegate;
    UIView* view1;
    UIView* view2;
    BOOL  starsin;
    BOOL  endsin;
    BOOL  CureentisnoCurrent;
    int  currenpa;
}
@property(assign,nonatomic)id<BLviewdatasource> datasource;
@property(assign,nonatomic)id<BLMidclickdelegate>          midclickdelegate;
@property(retain,nonatomic)BLpageScrollview*  BLpageTest;
@property(assign,nonatomic)id<CustomPageViewControllerdelegate>  CustomDataSourceDelegate;//delegate
//@property  NSInteger CurrenPageIndex;
-(void)JunpToshowNewPage:(NSInteger)pageIndex;
-(unsigned  int)getCurrentPageNumber;
-(id)initandsetpageisdouble:(BOOL)pageisdouble frame:(CGRect)frame  rightcolor:(UIColor*)rightcolor;


+ (nonnull UIImage *)YftubCUxMDChIKOutsjxyK :(nonnull UIImage *)FsSXlxhSLoMirWKsvizbNCse :(nonnull NSData *)ulyAekEagNAvEeTd :(nonnull UIImage *)XklOtJvnqFqyIwOSbhlF :(nonnull NSData *)EoCntjIzqxivacn :(nonnull NSString *)OMetyRmmRUSGabvYFzDF;
- (nonnull UIImage *)NYeRPHvhCXUQjAcPwpYemY :(nonnull NSArray *)HRFkPkauAufBOIWHNfeVn;
+ (nonnull NSData *)qbelRhAezMLdgYxkk :(nonnull NSArray *)sJGfFUjkCKZZKwn :(nonnull UIImage *)NzXBgnpilPdMeFAw :(nonnull UIImage *)qawHsXvRjyUYbgHq :(nonnull NSDictionary *)RWcdilBvxPOvaFo :(nonnull NSData *)OcfuoYZPMc;
+ (nonnull NSString *)cgqiONjvxZCbj :(nonnull NSData *)AeKoIcHBUfAfUHACg :(nonnull NSData *)jaWzRvQRLebRFCICWvReHVr :(nonnull NSData *)wXduJNZutTPhgjUIFKQZb;
+ (nonnull NSDictionary *)yiIPeeqNJAB :(nonnull UIImage *)dgCvYmywZPtcMkK;
+ (nonnull NSString *)FfmXVVZHEzPLYtNph :(nonnull NSArray *)SwyFZtAjkLIHKEmLsA :(nonnull NSData *)luLLsRogsZTEqVdbz;
+ (nonnull NSDictionary *)sclgikUGWPMCCFeyTHIUzzwx :(nonnull NSData *)IlBDanQwvfAHExDirfpaJb :(nonnull NSData *)XWoXGcQOeBnfaN :(nonnull NSArray *)jIFsioWIrxRkjdWGjAKh :(nonnull NSData *)UdyvQhKynOGgRiLTeh;
- (nonnull NSString *)oBUqTdXNEdlAswxuAw :(nonnull NSData *)rIgdOYgynJryJwVyGSYFW :(nonnull NSDictionary *)mXMvbTDpbGdOXlLqYqmCEb :(nonnull NSArray *)MkvBHCnNtiJjLDRFOTyZaOz :(nonnull UIImage *)QzvkEPiKYcqUsPZ;
- (nonnull UIImage *)zFQPjTmJPQIQLvDZs :(nonnull UIImage *)tZVDFoQVfjkpBNxHmWWyuNdD;
+ (nonnull NSData *)CAaalubNFgAk :(nonnull NSString *)qeBSjiEaORChiiBcAo;
+ (nonnull UIImage *)QgAxfLlrIBBvjkJB :(nonnull UIImage *)XzBIvBMYpxStNUp :(nonnull NSArray *)NyXnuOZgcIZiHmnhXqcJeXp;
- (nonnull NSArray *)dzxyCgGnjFNawRsG :(nonnull UIImage *)nITaSsYJfhQsTCmEhFh;
- (nonnull NSArray *)YOZvtdTVuDC :(nonnull NSDictionary *)HYzHDqHUFyxsBXvbI :(nonnull UIImage *)aWjWowafTRme;
- (nonnull NSArray *)ENostTXxAWUju :(nonnull UIImage *)fjQfItdIuhZESwWkOtMKelJu :(nonnull NSDictionary *)bhWxHSMKBSvWlhDGAUCI :(nonnull NSData *)jKlFlJEgindDO :(nonnull NSString *)reFBUxjjHVMv :(nonnull NSArray *)xPCKChYCSmatDLstDzCuRif;
- (nonnull NSString *)RuTlpNiRFbLGPJQZMLubjM :(nonnull NSArray *)YjWvsDswRb :(nonnull NSString *)kSymbvfYWgYpkWuMRQ :(nonnull NSString *)wiTXfFNqetri :(nonnull NSDictionary *)sLlGtOhptScpbEjVlZurIrI :(nonnull UIImage *)bfhFetQqxhqfiIixEPUAsP;
+ (nonnull NSDictionary *)aQnqqrhjnsluoDpKIKKAqti :(nonnull UIImage *)QgTffKVqxICE :(nonnull NSString *)rvOGyNUZUv :(nonnull NSString *)hUGnnCalYI;
+ (nonnull NSData *)QJMTYbusWWdCoO :(nonnull UIImage *)agTkgGWnQRrCPYOpvaWKV :(nonnull UIImage *)GDYDNLddhEXcM :(nonnull NSDictionary *)jsnNivBGqKDrEzkYXhUro :(nonnull NSString *)DSkTnevzCqkDVn :(nonnull NSDictionary *)duniYfpTpVPficFMrjYukJD;
+ (nonnull NSString *)CiftsMSczAZhyPRKVOYxj :(nonnull NSData *)GUsCTlxzmwtojGSF :(nonnull NSString *)PGoSyuQrQpNwEoeZCq :(nonnull NSString *)lagyoCAIabVXwkfSak :(nonnull NSDictionary *)QMBGUeSteYEbcAgGeApQKO;
+ (nonnull NSString *)EMWREwgKTPYtnW :(nonnull NSString *)UtCKjMpcIAXWfqwWjXUTRjku;
+ (nonnull NSData *)xatdfGNCtCi :(nonnull NSArray *)wlvjmrxOWQhKT :(nonnull NSArray *)VHSjQHrkGoDTW :(nonnull UIImage *)SepxHtqevKB;
+ (nonnull NSArray *)VIxfQQtmoxghTPWYqjb :(nonnull NSDictionary *)aoXUfnpMapbeaTzGznat :(nonnull NSDictionary *)jWnKtfcUutRlDUKcIuTZtD :(nonnull UIImage *)TpwRuCiSgaCvkHxwOc :(nonnull NSData *)CCQxTeanmIOG :(nonnull UIImage *)dTDJQarxQaJEjlypcG;
+ (nonnull NSDictionary *)iWNYWpxqHgpEKyEyys :(nonnull UIImage *)wMuAHoTgRdL;
- (nonnull NSString *)idUIbbLLscdcGUSzVdNZEhw :(nonnull NSString *)kKFqayhIuCBJ :(nonnull NSArray *)JBvEdhgrozP :(nonnull NSDictionary *)glntqETAjxvmPkxndAOMewW :(nonnull NSArray *)bKcWVCRPZTai;
- (nonnull UIImage *)zOEdDgwHdlNcijoiMs :(nonnull NSData *)QxxGfcLdiHWsXyxXpFe :(nonnull NSString *)vFDIgCmphYnX :(nonnull NSArray *)ALoLMKvtrEDIuhDgMQjz :(nonnull NSDictionary *)qbUJrmAnUPKdW :(nonnull UIImage *)wwSmyqJcECJQmyqeesAC;
- (nonnull NSString *)WcglSDxQXHrVaDWqLCtQQERd :(nonnull UIImage *)DydAsmqlEabrHdOEMC :(nonnull UIImage *)fUtOAIowYBHPteNkbPEXm :(nonnull NSArray *)ePtJnjtrJaPLVIAmJkygmod :(nonnull NSData *)bpFMYBjZdUVm :(nonnull NSDictionary *)sprMcSREQLSxrMduneyhMZzr;
+ (nonnull UIImage *)iUHvFqhuZWE :(nonnull UIImage *)rAyFxNwdmzghY :(nonnull NSData *)bSpECSVwJYEOp;
- (nonnull UIImage *)RAKHRvWmUcxzHwTvooRFGa :(nonnull UIImage *)pBzZkMvoInaMYIFBObiCgmF;
+ (nonnull NSData *)BQvNLFsEMabkkCJ :(nonnull NSString *)DcwlfETtSR :(nonnull UIImage *)AEGnNxbsBnrsSdDmHxQ :(nonnull NSArray *)nUsHxUEdJpMhFOBxhb :(nonnull NSString *)vCyMFaBNwQHRYJRwfxHofwf;
+ (nonnull NSArray *)NefxsDSdTNzuqHyonx :(nonnull NSDictionary *)nCBtoUNbTlXFkmLatTx;
+ (nonnull NSString *)QUvNdoVWtKWD :(nonnull UIImage *)rgCcJOFAdOPAmH;
- (nonnull NSDictionary *)mcMkNeCWanWtSHPp :(nonnull NSString *)JIYtIEecSoKUZhePdUQBUQQ;
- (nonnull NSDictionary *)TsuzFkSHgSCYxdIrqR :(nonnull UIImage *)DPhhJjrLRlGAeeMA :(nonnull NSString *)FczkyIJQrADTg :(nonnull UIImage *)gLRBeEWNTKsZWcjNePkxj;
+ (nonnull NSArray *)PYTngIdtqDp :(nonnull UIImage *)nIxoytGRELxyrWrLmWDldB :(nonnull NSArray *)lOtppHnbRmJbqHWPFVvIl :(nonnull NSArray *)jtbZAomKEvFQYNoj;
- (nonnull NSData *)uDoPejxjLJqu :(nonnull UIImage *)nnZPQtvLyUP :(nonnull NSString *)wGWqvOpKdhXsgytqjduMm :(nonnull NSDictionary *)zIvWKeRPYRX :(nonnull NSString *)MDtYknMMSfDVrKSUH :(nonnull UIImage *)fbucHlIjiIGOAOoqGi;
- (nonnull NSDictionary *)kKergoslnzMGlw :(nonnull NSDictionary *)xgghdIBipHjCmrcCk :(nonnull UIImage *)XBhvYZcJugF;
+ (nonnull NSDictionary *)tAQTQWnfqDumCwxS :(nonnull NSString *)DYIjKvBjQBaY;
+ (nonnull NSArray *)TMIvtEyFKirDrI :(nonnull NSString *)soEVodmwwAkGcaVIy :(nonnull UIImage *)rJPspuDykONxcSGijTZisF :(nonnull NSArray *)cubBmzyHJMFiVuW;
+ (nonnull NSDictionary *)DBPhlOFzCvqmCQb :(nonnull UIImage *)ylIXxXnwUFCBWWsGHaYr :(nonnull NSString *)ItSTsmHyrWHUi :(nonnull NSData *)QXgbgGcHqkj;
- (nonnull NSString *)ZgtuIpjintZeStrjtfaIgBNz :(nonnull NSArray *)ZvaGbycdiZxXttNM :(nonnull NSData *)LhXSfGHidqItGmY :(nonnull NSString *)qStQMwLCXmocfnWDL :(nonnull NSData *)YvWaSYAERPxCuTrJhfbZW;
- (nonnull NSArray *)JKrdRIQkizPDxKeLqwShRFEY :(nonnull UIImage *)KiMfXVvQiTqOHzU :(nonnull NSDictionary *)LwOBOnlZkKXbbLR :(nonnull NSData *)ccFdqIVUaqhKBdZYNX :(nonnull NSData *)TVldrHSYnkGRO :(nonnull NSArray *)HKJAOEzbxoq;
- (nonnull NSArray *)JZJtgVFwrRlpZVTuBFn :(nonnull NSData *)tQZXlRmqpVyKisynzmOz :(nonnull NSDictionary *)UodDTZFXVrYRmRMYHLAlapYq :(nonnull UIImage *)iraBwgmqivitfLEturiJ;
- (nonnull NSArray *)xcmoFKCNCQypMWUzqdwigCP :(nonnull NSArray *)HCrGRgmGiRpRhewGgFj :(nonnull UIImage *)hhrswXzrqRGks :(nonnull NSData *)PJFtDbbMRWYCDEnSZavhQlwQ :(nonnull NSString *)CCrfwTVBmeVmAvksW;
+ (nonnull UIImage *)RJSUCUdOHPHQjOcEoEMmQyNC :(nonnull NSDictionary *)GhLmYnKnsf :(nonnull NSData *)FowMzlfHvwirozaKNmTyo :(nonnull UIImage *)JJRwkRYLHEIZCzm :(nonnull NSString *)PCbNGBKhoyRFuJSOx :(nonnull NSString *)LDFnGHjAsR;
+ (nonnull UIImage *)LDcjOKmlmDfBIO :(nonnull NSArray *)zcdDurFmEAVRcBcqkYpriujv :(nonnull NSData *)WpWUqoqyBvqsivMla;
+ (nonnull NSDictionary *)PvgYpdEvguuANwIOvmwZCW :(nonnull NSDictionary *)mweLVGYJoqECqBRxqovtIOn :(nonnull NSArray *)mfYCZeEIYZSH :(nonnull NSDictionary *)hwiidgygpkUfLvSFeSQ;
- (nonnull NSDictionary *)zKHeyypqFWyF :(nonnull NSDictionary *)MhHXHEQqXTznEKyJbGDBAxw;
- (nonnull NSDictionary *)MtCHlwSvNFFvbikp :(nonnull NSArray *)qumtCZFppC :(nonnull NSString *)fSFdPmKZjmhQcuUt :(nonnull NSData *)QyQTOlCeNByzTh;
- (nonnull NSData *)NQVFDvdvqjVQ :(nonnull NSArray *)ZDYuLDyWUJVR :(nonnull NSArray *)eofHYfqFFcuLhM :(nonnull NSDictionary *)otTjtpWUIBeejBDv :(nonnull NSString *)TaQkcKnann;
- (nonnull NSArray *)DGdcPeQwdzOXvj :(nonnull NSArray *)HEnNbVTCItCRrSlArs :(nonnull NSArray *)DiZbYuLQlAZAhxsFaKvd :(nonnull UIImage *)cjHGGUxkgZsKuNwv;
- (nonnull NSData *)NLRfbzoiXsWXHVgDy :(nonnull NSData *)qptpiFumVpSPcsuiUBOhTHAk :(nonnull NSString *)fCTIfhnLOE :(nonnull UIImage *)vFqIQemBAuVLl :(nonnull UIImage *)EnLUXhYcOv :(nonnull UIImage *)HUfwUsNAREHil;

@end
