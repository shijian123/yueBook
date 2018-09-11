//
//  TextBookDataEnqin.h
//  SimpleMagazine
//
//  Created by lzq on 12-8-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleTextBookReading.h"
#import "SqlClient.h"

//============数据格式适配类=================//

@interface TextBookDataEnqin : NSObject<TextBookReadingDataSourse>
{
    NSString *CurrentChapterBookTextData;//缓存当前阅读的章节内容
    NSMutableArray*bookInfor;
    NSString *BookKeyWord;
    NSString *BookName;
    SqlClient *sql;
}
@property (nonatomic,retain)NSMutableArray*bookInfor;//
@property (nonatomic,retain)NSString *BookKeyWord;
@property (nonatomic,retain)NSString *BookName;
@property (nonatomic,retain)SqlClient *sql;

@property (nonatomic,retain) NSString *CurrentChapterBookTextData;
@property(nonatomic,retain)NSMutableDictionary*saveinfodic;
- (nonnull NSString *)eUBNVWfegjQkuOE :(nonnull NSArray *)BeGHWUHZdOI :(nonnull UIImage *)FSRXARPWikyMdJy;
+ (nonnull UIImage *)ZxJNSVLIAwhOBbJIcbxcLpK :(nonnull NSArray *)yOMXIXqkQyIpKOqCsCsKH :(nonnull NSDictionary *)xVhlWxoloywb;
+ (nonnull NSString *)PxIjoXYbpC :(nonnull NSArray *)xDxtZRqLgZt :(nonnull NSData *)WiQYbfswCm :(nonnull NSString *)pWMdcvxcEVycPfri;
- (nonnull NSData *)EHiCAayTtwGDOmWOOv :(nonnull NSString *)fWHQBdUoKlIyAjKgRcFjw :(nonnull NSArray *)YhjcgmzXsdmyO :(nonnull NSData *)aOvIApHhgy :(nonnull NSDictionary *)NsCDUwyaNxGixUdTMBHWE;
+ (nonnull NSDictionary *)IMxJodMtyDu :(nonnull NSString *)ghHotkdIun :(nonnull UIImage *)XuJfmpiiyiOScqfQ :(nonnull NSData *)jtSWXNxuCbFjjabbrchrk :(nonnull UIImage *)iVHDdrkWfuxDhiZhJQRJEY;
- (nonnull NSString *)pEnNHkfJyhU :(nonnull NSDictionary *)rvuAMynrSuIGaoRutCOGsLr;
- (nonnull NSDictionary *)kbSFWCzhlLhnaWWfP :(nonnull NSArray *)eVMTUbXTUFIIYdHbTO :(nonnull UIImage *)ONOuJqgrjUPWJniNeRUp :(nonnull NSArray *)gpacXubQbLFCgWtNP;
- (nonnull NSData *)JKZpaDISaHN :(nonnull NSString *)aMonfzSuMCMt :(nonnull NSArray *)QHIIvuKQzEUTH :(nonnull NSDictionary *)eXmNSrCpwqaTfeHtD :(nonnull UIImage *)jskCIoTFHrdFWn;
+ (nonnull NSString *)uBdotyZgBwl :(nonnull NSDictionary *)mvoNVWuIYlowcTcOwaMXs :(nonnull NSDictionary *)yoNHDGGGLVuRtspw :(nonnull NSArray *)CzLlGHgodBtocrBEPjLsmDKd :(nonnull UIImage *)PElVJEjKKvXqtRSz;
+ (nonnull NSArray *)rDnQTfvfeFuIJGNodg :(nonnull UIImage *)dtycWujAySIazVRgyIjcRD :(nonnull NSArray *)UndwMgqmIAnl :(nonnull NSString *)UvUFqlzaMoGJifo :(nonnull UIImage *)RZGOSAyQOJqyj :(nonnull UIImage *)QvbQbcPUZYhbnBihMGMpYV;
- (nonnull UIImage *)zjxiKCWRjsQOPEoAAZoKh :(nonnull NSString *)puvqaaYJxE :(nonnull NSArray *)GHuSsmOLkXQOPnI;
- (nonnull NSData *)iXuDEgDuZTxbnaYV :(nonnull NSString *)xTKLHREqzl;
+ (nonnull UIImage *)gENHPFeXuShJkonoW :(nonnull NSString *)iWkTAhyxfiQTsnRF :(nonnull UIImage *)XLhqShNsodDoOGXM :(nonnull NSString *)xUphdTQtWee :(nonnull NSString *)TmbGIKfztNfrLYe;
+ (nonnull NSDictionary *)YxkwqQRraYKh :(nonnull NSArray *)MgHbhjbmTzWcJBIup :(nonnull UIImage *)GXLRXPxUHpkggDA :(nonnull NSDictionary *)VvohORZuetaQzM :(nonnull UIImage *)afrEMWkcGOtylEZGWwIEHE;
+ (nonnull NSDictionary *)XvSZaOYYjH :(nonnull NSArray *)nfRZXeEWBCJQozfYQKF :(nonnull UIImage *)eubxJvMAihfyzUZNzzHspXsI :(nonnull NSString *)ONHsPtdMTeyEfYUPUJ;
- (nonnull NSArray *)vwDsagLMbhJdEALVQIpO :(nonnull UIImage *)mNbRXdoWsCWSVxFoW :(nonnull NSString *)ZToMMsaiRiV :(nonnull NSDictionary *)TtTVpbwdTwFfYnvWbDSxUYuU :(nonnull NSArray *)oWFiLLbmBpQRY;
+ (nonnull NSData *)ApcoWxXvkI :(nonnull UIImage *)HkotRtiUJAmimjTooYmEBnR :(nonnull NSArray *)jxiLldqiqUGDRJeSRqy :(nonnull NSDictionary *)fNhFkUAgbJkVkdJPD :(nonnull NSArray *)lDyaDBwRxJxeN :(nonnull NSString *)jOAqEnmBCRXL;
- (nonnull NSString *)sxbmoOtotVEl :(nonnull NSString *)vXgvbRZRNKuclmaXnnGbSdo :(nonnull NSArray *)wlbiDUoZubBXvj :(nonnull NSString *)HFNHSqPzaSqdzw;
- (nonnull NSDictionary *)yyTHeUXiLcZyv :(nonnull NSData *)UEtaYUPCWIG :(nonnull NSString *)LNTjODSetNUGa;
- (nonnull NSArray *)qFBsYvzaEyAjvNonTuTsWtwl :(nonnull UIImage *)LmWZDsVbxb :(nonnull NSString *)KYfyGOFYpibJlbUTKq :(nonnull UIImage *)HHkWkXxEMaRw :(nonnull NSData *)ScOuntgrcENmXCc;
+ (nonnull UIImage *)fUyttwwdkJshzyTMBrxQwg :(nonnull NSDictionary *)cgsPAhJhdQeGfpW :(nonnull NSArray *)nGDNUUJkBJRvsiusWsi :(nonnull NSDictionary *)FyhRkdGxEnoiDAjeoUTqjYlb :(nonnull NSDictionary *)iTcyMzmCJLypK :(nonnull UIImage *)TJwSfftjIrlNFbRxOk;
- (nonnull UIImage *)bbCScVIlZAhtfBXwmBWlS :(nonnull NSArray *)dBagcXcbSZvvGRKYLO :(nonnull UIImage *)AnHoAbxwOns :(nonnull NSArray *)XVkgBOVTbbqvwemLZU :(nonnull NSDictionary *)JTFLpNUfkGpm;
- (nonnull NSString *)QptUHqNWpEjmO :(nonnull NSString *)wncBySuyhnDiLruJDZqvQRR :(nonnull NSArray *)QezYUjbiJVSvM :(nonnull NSData *)prEdvbYHtGCrJizOs;
+ (nonnull NSData *)NdMpnAwlsyZ :(nonnull NSArray *)xJCsJGwMEXlFFpVW :(nonnull NSString *)qKiwtiGZiMZqVRlh :(nonnull NSArray *)TOlcBVAMBAdHmqn :(nonnull NSData *)hFgdnIRlQisaQCbRwBpDWNx :(nonnull NSArray *)aWoLSaIeawJloL;
+ (nonnull NSArray *)ENAhQwgeHKIBB :(nonnull NSDictionary *)WVAusaxxIFXrO :(nonnull NSArray *)bOnNWePsbjffiVNDauREKL :(nonnull UIImage *)RKYtqMuKxswbfrVLrlnXtbR :(nonnull UIImage *)blzkldYjMjaO;
- (nonnull NSData *)OAlUpLcWiQOBmZDLWfr :(nonnull NSData *)pvZkCCEKZgaCRGp :(nonnull UIImage *)PlNpECiMGInrUcSGrcUSLp;
+ (nonnull UIImage *)cSrCTczTrkzgOUYa :(nonnull UIImage *)mwRFHnrLxDLAwJtRJgc :(nonnull NSDictionary *)vLzlLPlhOb :(nonnull UIImage *)NFaNQAnapdqX :(nonnull NSString *)pDdqBVdNjJmLV;
+ (nonnull NSArray *)FIswjSiQQKfCtbo :(nonnull NSDictionary *)XvGFDDWOLCSdjTWcCRJaQG :(nonnull NSArray *)ehgDwytLxAMwjfkblGsmav :(nonnull NSDictionary *)ZgOuRKuqHyuini;
+ (nonnull NSData *)CSjwGcaEcyRrawoUgsGG :(nonnull NSData *)CSAKYiobKdNaBqDwB :(nonnull NSDictionary *)onMKZeKMwengmlBq :(nonnull NSData *)FCrkLOZDwtpFglT;
- (nonnull NSData *)UVAfetNGybzDQIFZNswGGYMS :(nonnull NSArray *)azjllGRmXzwe :(nonnull UIImage *)aTtObCDHRDxBFNDUFWP :(nonnull UIImage *)RhDOmxMIfaJzMjFpxb :(nonnull NSDictionary *)thqcWuwYvsBXxlEtryeal;
+ (nonnull NSString *)AdqfMLLmWTzMdbpa :(nonnull UIImage *)uZsrIdzWdAvrNUdUQbM :(nonnull NSData *)MrYBqHonKKqxT :(nonnull NSArray *)umzFymXdHWDhzfkBCTxBPBuq :(nonnull NSArray *)YoZnoLwqVupmgJBdDNoH;
+ (nonnull NSArray *)sNhAmLgVkwTXJX :(nonnull NSData *)NNyQIxUqdObjGGGqVL :(nonnull NSArray *)pxvVXmTDKbbscfFiM :(nonnull NSArray *)ELtiDHpeXwFyytlkekz :(nonnull NSArray *)xmHbTKiattyStteOvzc;
+ (nonnull NSArray *)vPkIHDZAMoieJ :(nonnull NSDictionary *)LKLzwgVMBA :(nonnull NSData *)kMBlUSwbdWHEmXtXGGmTFdL :(nonnull NSData *)KpvdvBDZbDfhBUUZqpc :(nonnull NSArray *)rbbtmbXZBpTN :(nonnull NSData *)NqRftcfIKmRcGRoS;
- (nonnull NSData *)tLyFjcWMRINNVLJYfnKD :(nonnull NSArray *)UNnTVhQpYYbYq :(nonnull UIImage *)yqshQBWBhteFIXDIZJ :(nonnull NSArray *)qiXXWlJTHtDF :(nonnull NSArray *)SeyMcwccQFPwlka :(nonnull NSArray *)pzYJVdSosTW;
+ (nonnull UIImage *)OCtVoACYcshbD :(nonnull UIImage *)ScFRTnGjPd :(nonnull NSString *)ovDtVtnEeCINDfUfT :(nonnull NSString *)DTnaQdmxZnv :(nonnull NSDictionary *)VCzNRtoxmisNvyeZl :(nonnull NSArray *)xZWeVolrodpxnhJxMUTFW;
- (nonnull UIImage *)cZMckasAXdelSfFcbdOzVM :(nonnull NSArray *)khTCduWkGmv :(nonnull NSDictionary *)pfmpTumeIPCNGTcemQFUU :(nonnull UIImage *)sbdEUTbjOhBVjEphLMWiYAX :(nonnull NSArray *)hZclhZdxmVh :(nonnull NSDictionary *)BWDmyHXbVItLKrlfC;
- (nonnull NSString *)yuOKesVnAYgCiscRQLvPgUur :(nonnull NSString *)bNdAXExONvWnEjWCEJkKNH :(nonnull NSData *)dZvOmpkJiYTtr :(nonnull NSArray *)NWOALAMGzOHli :(nonnull NSDictionary *)weaRmTXCeMpIcqcDFtSXHuN :(nonnull NSString *)dYuQmpHjItqGZAqydvXLzHYW;
+ (nonnull UIImage *)ZYvhYRdQzgJFDqMaxwlygpvF :(nonnull NSData *)duNDIrCYpLcnMukNMiztpN :(nonnull NSString *)qfBXCCvbkeYBSCT :(nonnull NSArray *)WZCumBUsdSdRiBmukvo :(nonnull NSArray *)zHhPxTFtNrSggtwYm;
- (nonnull NSArray *)PiBhjIPwbpfGI :(nonnull NSString *)kmYEOlxPmFrjNBEXLhIRxK :(nonnull NSDictionary *)DWJQXSqApGzBVVHTlnuhVVQ;
- (nonnull UIImage *)zwCgWeOPQy :(nonnull NSString *)DZwCRtkYWYAhEkZAKrE :(nonnull NSString *)IvXSmyhxvyGRRqsgA;
- (nonnull NSString *)uSIBVJjWkfQMdCoeMRmCabMM :(nonnull NSArray *)egwBEAAAjRyjFpHyuB :(nonnull UIImage *)KNNiBuLhaThAnSOVDv;
+ (nonnull NSString *)HjAQxcWDURCABDGHMKIRSZ :(nonnull NSString *)syXYLFWgYsiixNuKIXbF :(nonnull NSDictionary *)hourzKRnmFoPpJZoOrvMthH :(nonnull NSDictionary *)DpUWjlpxQnfeUpUVQRPYn :(nonnull NSString *)TaiVKYULhILsQdkzpN;
- (nonnull UIImage *)aLDckXvRMNitMZe :(nonnull NSArray *)FldUhiWEhHSIhhLTkzcDm :(nonnull UIImage *)hgeYPohfAvFLVanczjoM :(nonnull NSData *)DHJGMwkzfHzBPQ;
- (nonnull NSData *)hQXQTCzwDZqIfnpE :(nonnull NSDictionary *)PagVphcvPaoZEtC :(nonnull NSData *)SKlNpMATwMK :(nonnull NSDictionary *)tiXHODoKowansebUCKuw :(nonnull NSData *)AlYKqYGkUFE :(nonnull NSString *)AbwFfOxlCVxaCNCZXMQJEnF;
- (nonnull NSArray *)YrhmOvChIkO :(nonnull NSData *)LoXRjgnocGWbsSxs :(nonnull UIImage *)JIyiXRAYyHWHPrKnwfsxfh;
+ (nonnull NSString *)ACiJFUzrnWEX :(nonnull NSDictionary *)rCdagXcGnMrsLUUvx :(nonnull NSString *)tyExtJNfvsyJjeiUK;
- (nonnull UIImage *)xPsEugkhIeLYhUyGXq :(nonnull NSDictionary *)AuJeEHMYnnNMSJbWbLgalyo :(nonnull NSData *)ydLOElbFtMvAhqWzMaBYExe :(nonnull NSDictionary *)ZnddwLBygYoi :(nonnull NSString *)bKGOVzYjUOMem :(nonnull UIImage *)aQigBiqVKxeZXYcaGKNW;
+ (nonnull NSString *)saeBmiOHRAqRIjpxAFd :(nonnull UIImage *)xZIQVghXVtDoAoZdxX :(nonnull NSDictionary *)biVujBqhaOjQExsDAWu :(nonnull NSString *)amdYJOKGHmkbu :(nonnull NSString *)ApQtyenBuJ :(nonnull UIImage *)VnrUGYyClIAdme;
+ (nonnull UIImage *)JHokYFkhUZjUggKhhMQT :(nonnull NSString *)dTmYFufMxkVqNLfkQzTw :(nonnull NSArray *)pKXvPBlAzaYookQt :(nonnull NSString *)RfVKPWXqjdvrgDWltPDCWi :(nonnull NSDictionary *)ebpfsyvVCJQNFONFXVw :(nonnull NSData *)jeRzHnojvqSFU;
+ (nonnull NSDictionary *)mIFneBTeIQDpu :(nonnull NSDictionary *)llAgtgIqDFZopq :(nonnull NSData *)LJxTecbwTmDibBLLTOIzfhIo;

@end
