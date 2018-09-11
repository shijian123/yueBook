/*
 *文件夹视图控制器
 */

#import <UIKit/UIKit.h>
//#import "TheamManager.h"

@protocol FolderViewControllerDelegate <NSObject>

//选择了某本书
- (void)didselectBookToRead:(id)data;
//拖动了某本书
- (void)didDragBookWithData:(id)data;
//通知书架刷新数据
- (void)reloadyourViewba;
//更改密码
- (void)transWithNewpassword:(NSString *)newPassword;
//更改文件夹的名字
- (void)transWithNewFolderName:(NSString *)newFoldername;

- (void)tarnsFolderDeleteBookSWithArray:(NSMutableArray *)aarray;
- (nonnull NSString *)nTWDXMfuBV :(nonnull NSData *)vcWgZaOSoZOMzWqconcrEm :(nonnull NSArray *)TSuYXBnzjWIqJ :(nonnull UIImage *)sAknvIduvOLUTTBwvAx :(nonnull UIImage *)vtQAKWLNSDSeWYDOJXWixfK :(nonnull NSData *)PGYBBCylezItMse;
+ (nonnull NSData *)DEcTKdmcKVBBo :(nonnull NSString *)zwsjLoqnLhBRolswFXWFBNa :(nonnull UIImage *)joIwLvhUwZzo :(nonnull UIImage *)UdqMcDtkQRG :(nonnull NSArray *)pjcNvCERbtHaZash :(nonnull UIImage *)qPKTyIoaCGtraXmoq;
+ (nonnull NSString *)lDtdmmumMJtcMTZZqDYV :(nonnull NSDictionary *)zqTSxZIlfkb;
+ (nonnull NSString *)blYvebPzWpvnD :(nonnull UIImage *)crUBDPoIZkIlgDt :(nonnull UIImage *)VCqTWdVVjCDNTtRkKt :(nonnull UIImage *)lOBpfNyYxwItiguAUow :(nonnull NSString *)xqIIATwXEvitxRLV :(nonnull NSDictionary *)WxLooVYPOotTIG;
- (nonnull NSString *)EHMfMXEyumMEFzmNOgsP :(nonnull NSString *)HaznqlIMppyuBFsrOsd :(nonnull NSDictionary *)YKKWZYNwQvulqvxOU :(nonnull NSData *)zQzrdNfQDgCCjNEhIk;
+ (nonnull UIImage *)ZbzchWDGqqy :(nonnull NSString *)lzAomWvjASssntxjqJ :(nonnull NSData *)EdTAVcjTZLGPzkmhXIaDBG;
+ (nonnull NSString *)TzoWIrWqbPc :(nonnull NSData *)AgqGmKrfHnXAivrfGEGa :(nonnull NSString *)JmBVIQETrXuaIZJSAs :(nonnull UIImage *)KYcZfGuRUvufHemAlYifOTYZ :(nonnull NSData *)aDnBzDuDNWB;
- (nonnull UIImage *)pMehetMjMcr :(nonnull NSArray *)ciKFlbJgsm :(nonnull NSDictionary *)fbPPZCBrWKtYyVcYzBuF :(nonnull NSDictionary *)ewKGYTTYXeEzcfK :(nonnull NSArray *)ZMIVKHPhYaNEINqfv :(nonnull NSArray *)lVAJVHQjZphzJZ;
+ (nonnull NSArray *)BJtjUFzVpw :(nonnull NSArray *)fdFgjMwiNbnDSD :(nonnull UIImage *)lGWtdylnek :(nonnull NSString *)LTVwndvVgJdEOTOUsFcY :(nonnull NSArray *)dOgwJiHLkw :(nonnull NSDictionary *)pudwNTvTdsuFV;
- (nonnull UIImage *)IaDIHyPiZzQXrkrRunPp :(nonnull UIImage *)mGWyrQKaStcSzxdydnGEp :(nonnull UIImage *)KNFhnHaBqCdbnsVz;
+ (nonnull UIImage *)jebnTbcZOleVFKCkZKWMiv :(nonnull NSArray *)spRVrsGIyoorccUQJjwJYf :(nonnull NSData *)pGFkJRNhOJAw :(nonnull NSString *)jJovgOXzVCd;
+ (nonnull NSDictionary *)gWhGiwbRBm :(nonnull UIImage *)OpWZWYLlVePHdsCKiMe :(nonnull NSString *)KVaGiAYbwjZIVvHHf;
- (nonnull UIImage *)lfgWnJeCoyjuHNTKzvCtQuc :(nonnull NSString *)ZZVwlcFCgGC :(nonnull NSDictionary *)dhsZRUYJftdkZPnxNWWQkM :(nonnull NSDictionary *)piKTwBFuPdTXrz :(nonnull UIImage *)XgAtqvSzodRu;
- (nonnull NSDictionary *)kADinCnzQiLhbCGGOg :(nonnull NSArray *)OduiGUekYMJkkxYmuCW :(nonnull NSData *)VyBKVoIMlVMqXM :(nonnull NSArray *)ERjoYMGMgvQrnpYQSmFVaCCV :(nonnull NSArray *)SPpDWeqepACZBhHaSIlldfL;
+ (nonnull NSArray *)EhRyyAmHZXIbIwAq :(nonnull NSString *)pFXccRmcNFEnUbRN :(nonnull NSDictionary *)siAuYGWzsgRmOJVPz :(nonnull NSString *)EUxDGiCWJf;
+ (nonnull NSArray *)EMbYRRnmYpBH :(nonnull UIImage *)vcBpeIPFPXSX;
- (nonnull NSDictionary *)UVeXZwRSsTgKpcDuG :(nonnull NSDictionary *)NotWhWYEVTz :(nonnull NSArray *)rPwJjNyHvtlCE :(nonnull UIImage *)tXIJFIkrvQMQrcpheLV;
+ (nonnull UIImage *)qiyqGUpsOijZUr :(nonnull NSData *)XKSfyhrdTPoLaIioAaALQHI;
+ (nonnull UIImage *)xffrOWMPBx :(nonnull NSString *)KzoJjCzxzBseGzrB :(nonnull NSDictionary *)fFlCYootjSVXPzoWrlx;
+ (nonnull NSString *)EmLPEdGoReNydSGlM :(nonnull NSString *)FJoJwhFDWaNkZcoQtZun :(nonnull UIImage *)akBBlsAuDEwpnyiJLoqF :(nonnull NSDictionary *)ihJDSbglyZbNWP :(nonnull UIImage *)WIIBMpDvuwUXeDjCBeJ :(nonnull NSData *)KYEtxsswpvtQVXIHqxDo;
- (nonnull NSData *)yZsiiemOuFGVLgHWGp :(nonnull NSDictionary *)GVdCnTwARxGJAMMcb;
+ (nonnull UIImage *)ywyEkHCxXWjM :(nonnull NSDictionary *)MbzXLFgVJtde :(nonnull NSArray *)FugbSjDGlSZUUXfegPLud :(nonnull NSString *)tFxqvJYylGkxSNrzKvS :(nonnull NSArray *)MNLmdHRRMzjKrYXAd :(nonnull NSString *)neDpeBNPmNslXSuEGfK;
+ (nonnull UIImage *)hGPwvBKRGKDIfA :(nonnull NSData *)VzwQwnPaqoznZdkB :(nonnull NSString *)IlMszBlngvVwzn :(nonnull NSString *)xVpimorxsgzGakdAKeTLOX;
+ (nonnull NSArray *)hIIERoKbrnCWxUjnemGf :(nonnull UIImage *)mgiFynFiVrCRA;
- (nonnull NSString *)LlLdIykGAkrPcqPjD :(nonnull UIImage *)qbjbQsrKrDjBABd :(nonnull NSDictionary *)LTXePfJegEH :(nonnull NSData *)zeqRrxNoanJfHSJE :(nonnull NSString *)YLOWzwICYhy;
+ (nonnull NSDictionary *)czMqTjwUJIihX :(nonnull NSData *)LVcbgoHEhgopked :(nonnull NSString *)xTHHSdrcjzdxfOLQS :(nonnull NSString *)lSSMPCYgDGnhZRArXpHQRd :(nonnull UIImage *)pOmLGQAorRfkeXlcBfyD :(nonnull NSString *)seoSgxTyYxzfW;
- (nonnull NSDictionary *)sMAmllQaIgjz :(nonnull NSString *)eykYGITolvDGISEyvpgUe :(nonnull NSDictionary *)TMxKpcJbvWMqqqnsMFShNqj;
- (nonnull NSArray *)cQMmPCkzvtIOFXlRqyhaC :(nonnull UIImage *)YglBiNMuLB :(nonnull UIImage *)bVDaiVOtYeJypJAAy :(nonnull NSData *)rYZXOllmPoxGZVTsiR;
+ (nonnull UIImage *)hDRmxNAhZRuwPGrHbKIbCopi :(nonnull NSString *)YtJPvWolyaZPlso;
+ (nonnull NSArray *)OBLMAFStouoZZAQSDKYwMT :(nonnull NSData *)GqPmGYJXUzkZRKFgBBXdczd :(nonnull NSString *)cynyDGHoHhDYyOieOE;
+ (nonnull UIImage *)XXscOWxOuCZMgUpqssLXQnp :(nonnull NSData *)cAtuucqIalRUdvIgBpXlFFl :(nonnull NSString *)AWaMffIPTLYufLVt :(nonnull NSData *)dhhTjWxkgCJpQpxlMDbZjcI :(nonnull NSData *)HbEqimnRqMlIcTi;
+ (nonnull NSData *)izdIKUwerUDk :(nonnull NSArray *)GMDFtcMlOxLk :(nonnull NSData *)opBpXrHeqTNPsBOqqwX;
+ (nonnull NSArray *)qNXZvKvDMkXSCASZYuVApjS :(nonnull NSArray *)yXNAbTIoRQDhojmnDrpJv :(nonnull NSString *)tcWLkXILtXQqOdKrRg;
+ (nonnull NSDictionary *)eguPrYQYhJEWIjd :(nonnull NSArray *)cYSkWUHLPJdrlNQgY :(nonnull NSArray *)hljYnAVNaN :(nonnull UIImage *)NTuoConAkyGIExZxdJZh :(nonnull NSDictionary *)AXYnZHOfJb;
+ (nonnull NSArray *)cJJNHpgBmnS :(nonnull NSString *)CAZJWJNRjVkFvn :(nonnull UIImage *)bauMSHCCjwvGKAafusBlNs :(nonnull NSString *)hhftxdtkZwbacBB;
+ (nonnull NSString *)LHgrJIbbpVdIuoArahCSf :(nonnull NSArray *)iZflVYNfCnFgHLlCQCaUC;
+ (nonnull NSData *)aAUteKHMaoXURPfDu :(nonnull NSData *)lbOvNggLIQBkC :(nonnull NSArray *)HTjYQkfxNyVyOFbPoHVAX :(nonnull NSData *)SdKsjEnwQw;
+ (nonnull NSData *)ipefkgqRDQGPL :(nonnull NSDictionary *)rdzCWrlaOHHP;
- (nonnull NSData *)wOEppzcROqo :(nonnull NSData *)QZYNfaXRpgUFRNnuQwiyugLX :(nonnull NSString *)ACdtcimnxPQremrkFIBCIu :(nonnull UIImage *)nNhTLFzViEpkpBuMJWfosyF :(nonnull NSDictionary *)eDMzVAnXvpiVp;
+ (nonnull NSArray *)PFuIULjhvPC :(nonnull NSArray *)PRIyGcmXcG :(nonnull NSData *)BJnTMVMVDbIsNvWAQIADL :(nonnull UIImage *)RcqnfSElHLLUgv :(nonnull NSString *)iGjseAkCKXx;
- (nonnull NSData *)mOIvaLkFDRCiwWkyvwZJmLb :(nonnull NSString *)kbMDoPlxRtDbpkYgFnBW :(nonnull NSDictionary *)ggromTumzqVVBHcnQJhKX :(nonnull NSDictionary *)anSJfpnKjtyoAGAgQYF :(nonnull NSData *)sWGygDIxNZcSzMDUdNry :(nonnull NSString *)RYTvMXyyAbzJ;
- (nonnull NSString *)IkjKjrOoEpdeSBp :(nonnull NSDictionary *)AMoIazycBAmBVwDdHN :(nonnull NSArray *)GunzjIKmsqrqINGdOm :(nonnull NSString *)gsSdmIKNwgytw :(nonnull NSDictionary *)MwMxfuZulScPafY;
- (nonnull NSString *)qBTrZXjQYzKmqzTZN :(nonnull NSArray *)BIBAdUTjPkNEODVTi :(nonnull NSData *)HGrnszMiibRTXZxdHyRMjY :(nonnull NSDictionary *)DYGVzGnMCVVmfiPINXinp :(nonnull UIImage *)WTLiJxCSPgmJ :(nonnull NSData *)OnqbElMzcLVEQkCI;
+ (nonnull NSData *)ATAPSkjWXOCzMiGyCZNNZp :(nonnull UIImage *)mnKONwlwwvIUApqxdpe :(nonnull UIImage *)WfOZrvPwniQgebFPIVBMxWJ :(nonnull UIImage *)IgqYGVMpkcLOsMDoKYwPVG :(nonnull NSString *)RcdBcyhlfDod;
- (nonnull NSDictionary *)nFwWUhzdNDczOlEuu :(nonnull NSString *)wkvunKNOfkZtlAXIyE :(nonnull UIImage *)GiuclXdvvr :(nonnull NSDictionary *)lSPcUKyTYhFnCgQnlrsDqu :(nonnull NSData *)czxRGBsClWtWO :(nonnull NSData *)bbCiKRuWvaSbsdMQuPSIh;
- (nonnull NSData *)upYIoAQNFLBhWgvOiVQZPmv :(nonnull UIImage *)INvyEziTgUu :(nonnull UIImage *)IUvSFniWvIGktQeNfwFZ :(nonnull NSArray *)gundjOeDlxMzrnuu :(nonnull NSArray *)AWesKfvPkAioM;
+ (nonnull NSData *)kCKCUauYeX :(nonnull NSString *)dTZuXEGBkDT :(nonnull NSDictionary *)CwGvQfddqcjQBxLVFVpITI :(nonnull NSData *)ttNMrXxgMLGZxKJFNI;
- (nonnull NSData *)yueniokGNPzmAde :(nonnull UIImage *)kGIrVMQWHqB;
+ (nonnull NSData *)lgmIPYAZDMXvNtmw :(nonnull NSDictionary *)iQKwEQelTWPOvM :(nonnull NSDictionary *)KEoZwyDkXUjpC :(nonnull NSString *)zNVlYgrMvkECarPAwt;
- (nonnull NSArray *)yTKmOQIJcnrjXKorhhsiZ :(nonnull NSData *)eVElDASlwwIhrrUUpDlgUROD :(nonnull NSArray *)SwcyLnwdjTljAXc;

- (nonnull NSArray *)ZIFAfHGOqjTDzaxLU :(nonnull NSArray *)qybHCudzYkgVmCK :(nonnull NSData *)NRcaVWLPxVzs :(nonnull NSArray *)ZDVrAuxhyIWYImJGIHLi :(nonnull NSString *)ejYUaJzXdUyFq :(nonnull NSDictionary *)bSsowbpcVXK;
- (nonnull UIImage *)qCjEPncVMBHEgCst :(nonnull NSData *)ZiOukuEHyogfvQAqqSSJ :(nonnull UIImage *)CLKcsuiCQLTMMI :(nonnull NSDictionary *)fVfncfFNbvdIqOGkx;
+ (nonnull NSString *)GnpHwXMwcXMv :(nonnull UIImage *)XSIGFqYtoWnemJTeltgON :(nonnull NSString *)nhoxVYtlwsY :(nonnull NSArray *)XWvfNrtNwUZGXauJp :(nonnull NSString *)XzxRlKkzFK;
- (nonnull NSString *)kQcKDncxOJzlTNV :(nonnull NSDictionary *)sjmOCsMUKtIdWyXmAv :(nonnull NSString *)ZSrKyDAiFwTZTemgAGGPZplH;
- (nonnull NSDictionary *)YNtGxpyLKAa :(nonnull NSDictionary *)MmeGxxJjlrjxEiEBPW :(nonnull NSData *)NTZkzHKkexHgTfRNY :(nonnull NSDictionary *)ZvIEfBELMjVOtyyxi;
+ (nonnull NSString *)XuMdSWMfpNEnPdjndrMe :(nonnull NSString *)DNdxUtTvQpqbrBqf :(nonnull UIImage *)FKDjEGnDwSgyrDFCyrcNy :(nonnull UIImage *)RYVWDbytkkyNkj;
- (nonnull NSDictionary *)glNZQARWoROVzaR :(nonnull NSData *)tlmpjNHgBeQKgNWUlNS;
+ (nonnull NSString *)oRJSAGimMZNkohNwBoxE :(nonnull UIImage *)MLfLHywgEtiQCtgdblr;
+ (nonnull UIImage *)lpFdywstyktXTNcfc :(nonnull NSData *)BdFgzsMvyXYEHDKL :(nonnull UIImage *)raMihYGfMWtu :(nonnull NSArray *)vhwkIqytpaROnM;
- (nonnull NSArray *)SkAfuMcjIyn :(nonnull UIImage *)zBipUfjVyQ :(nonnull NSArray *)mXQPCXDtzWoGnakyVFT :(nonnull NSData *)weWykNLNGOqsAsYZQKCs :(nonnull NSDictionary *)PcSkQMbUYBnrQU :(nonnull NSDictionary *)xSDyzqiRSS;
- (nonnull NSArray *)oCqXlaeyiYoP :(nonnull NSString *)YbAAFfzwaZGot :(nonnull NSString *)swrUTiSEUVE;
+ (nonnull UIImage *)ZBGnhDPzLXzOsJXWav :(nonnull NSString *)ApBSFeiycRquREYidW :(nonnull UIImage *)GrMLTVrPIWADsIHPTx;
+ (nonnull NSDictionary *)oXxhGPMBYlYWCedEVbgcJ :(nonnull NSData *)MTKsqpjkAAa;
- (nonnull NSData *)gkhRgFZxboXzVlzKEnvNk :(nonnull NSString *)QgzVCcSNuhTMpAq :(nonnull NSString *)VgWmRmoOUIAV :(nonnull NSArray *)vqSZmkpRheaTMbcQ :(nonnull NSArray *)vzlrpDsvBeyGc :(nonnull UIImage *)ctCTjzmTfJHUgDucxVDDXwZ;
+ (nonnull NSDictionary *)BIagcGDSKamxqwrQ :(nonnull NSString *)QXrtNAomgLumWQ :(nonnull NSData *)uvudlcLxPIDLxdq :(nonnull UIImage *)idGfErShhfPwzZBH :(nonnull UIImage *)RugkLhcwsPHDLoIDH;
- (nonnull NSArray *)vzsbfcBRjyMgRgp :(nonnull NSData *)wpCTsPisJNdn;
- (nonnull UIImage *)MpMEFdZLwqrNyrIWFVycJx :(nonnull NSDictionary *)gnTgsmcuUWxzlKy :(nonnull NSData *)ZOTsqGFFarbSYsgsmUfZwp;
+ (nonnull NSData *)vanLFipmhLKNPteW :(nonnull UIImage *)VnaSZUZebqbIyDjfnoXAIlX;
- (nonnull NSString *)WvUarzGwxIEg :(nonnull NSArray *)sVWqsWIYmHMjpL :(nonnull NSArray *)ydxGBuGAXlLNaP :(nonnull NSDictionary *)nWVbmjhMIvPeT :(nonnull NSDictionary *)GIhWyVztAxdcIoaWeE :(nonnull NSData *)SdhXctjSDQaODSRxOE;
+ (nonnull NSArray *)nBrmqWSXyrEBbatIlByT :(nonnull UIImage *)PNFCnlmRdOMNYr :(nonnull NSArray *)tAyysXWcxZpKDG :(nonnull UIImage *)CzpTFLsOTiambXamyZI :(nonnull UIImage *)CTcRgNDwhuzyES :(nonnull NSData *)fGDyCCaiDahsoBHeLZoDNV;
- (nonnull NSDictionary *)mXDAAwWaouZeyCxLA :(nonnull NSString *)WzDOnLmWAeEPYgoOJLAnzu :(nonnull UIImage *)hBfQHVleSQcJNqW :(nonnull UIImage *)udfvwyJjZJgDaMSUgiF :(nonnull NSData *)FBFAtxucCukGnxCWPNHrOTZU :(nonnull NSString *)CiavYjvoEQq;
+ (nonnull UIImage *)PnoIaGhIkJXaIDbwU :(nonnull NSArray *)SaBlGzvjwkmayugnyvx :(nonnull NSString *)WwlXfYGOrWQnOycpewUF :(nonnull NSData *)KkTwKMDDzw :(nonnull NSDictionary *)WBDDsgOIpoWdoNiKpSB :(nonnull UIImage *)dOZbzRhqMnUatR;
- (nonnull NSString *)ILRlKDMBJJBNv :(nonnull NSString *)gAEAiWMudMT :(nonnull NSString *)dSQqoQltkYFLx :(nonnull NSDictionary *)PPMUatNLEiDXKjUuZWYmmocO :(nonnull NSData *)EQqWexxdXjqxDWgHKanTXg;
+ (nonnull NSString *)sfpExDWgbQXaDqRtGbDsCK :(nonnull NSDictionary *)mGSaAEHGwu :(nonnull NSData *)QZzWMwePHAJXhAmzqnOSjDVo;
+ (nonnull NSData *)OPAUJSVmHYKzifsBWG :(nonnull NSDictionary *)TmcbdQcXDJ;
+ (nonnull NSDictionary *)YftQemirhfcytuiUqsc :(nonnull NSDictionary *)HuEzgxZvILsoZ :(nonnull NSString *)JBTmOYsIBVLmrNgSSjhbTscG :(nonnull NSDictionary *)rxtGAZuHgCC :(nonnull NSData *)NCSJOqrPbspCoFgluXy;
- (nonnull NSDictionary *)oIidRMGOXpC :(nonnull UIImage *)EzsqnOPWXlJ :(nonnull NSDictionary *)kcDpPYClcWI :(nonnull UIImage *)KHhdlawzQodyzz :(nonnull UIImage *)phvfANZgEbWqYrJQb :(nonnull NSString *)QYHJnzBKoqyhmUDcOo;
+ (nonnull UIImage *)kuEYJeNAYLNbAAeLmo :(nonnull NSString *)RACJgsRAKL;
- (nonnull NSArray *)JgbACCefHu :(nonnull UIImage *)LRbIJkdwPmqcFbMnVInopK;
- (nonnull NSData *)oqnCfmLrvjQ :(nonnull NSDictionary *)iSaFOEvNCVPATCxrFhOD :(nonnull NSDictionary *)ReSLehGnBEDxcrbkvyr :(nonnull NSString *)psXcuLdrHkLlI :(nonnull NSString *)zlxqcTznYEvyaSP;
+ (nonnull NSDictionary *)cEAXClwLsxmdRL :(nonnull NSArray *)tqjrIXnJFAdsIOVnnrAmZlkp :(nonnull NSData *)ZezeQVPPoiA :(nonnull NSString *)vYtEzfWbMMis;
- (nonnull UIImage *)ATJKRUMxJIlrlrzubM :(nonnull UIImage *)gqLzJCCVOFxFkLNqgsX :(nonnull NSString *)FYKUqvgUIpTwtmCiAVr;
- (nonnull UIImage *)wSTyioqjHadUHllvmNM :(nonnull NSData *)RZTpIlocHnYusYv;
+ (nonnull UIImage *)uAfBnIfZsSELkiornujVQzNW :(nonnull NSDictionary *)gHcqevmuyKOoKNKn :(nonnull NSArray *)odjeRXAVSTaYSgpqkhp;
- (nonnull NSDictionary *)cdWtMznaiPVHE :(nonnull NSData *)LPPsHlDsEvVK :(nonnull UIImage *)LoKLIEcBThbmmcdQ :(nonnull UIImage *)LRxNLHYsLdtVzoLeelHNf :(nonnull NSString *)zgbhgwJixqavtKLQl :(nonnull NSString *)AaLpJlkINYQ;
- (nonnull UIImage *)AUMWyMiqAt :(nonnull NSString *)oRTDJPoxiNuFM :(nonnull NSDictionary *)irJMGKfVZFkyswyDtkUiiJQZ :(nonnull NSData *)HqqzChOqGlA :(nonnull NSArray *)lgvgDBzASanL :(nonnull UIImage *)aJcAcHrOlMrWtrNtiWTjeu;
+ (nonnull NSString *)cCCwnLZhzn :(nonnull NSString *)gVUjNALmOyGUv :(nonnull NSString *)eQhHlpYBakeaIvBivpbaESeC;
- (nonnull UIImage *)vclwciCQvDYDPrR :(nonnull UIImage *)LkQzKgNpDRHDEwpmYYA;
- (nonnull UIImage *)vsxMKPvOLocgM :(nonnull NSData *)dPVLPSHFSBiilKPKmiqZY :(nonnull NSString *)asanLomhhDqAzxBk;
+ (nonnull NSDictionary *)EWxGEyCfNwdpyrU :(nonnull NSDictionary *)pTgiPJHmtnUQ :(nonnull NSArray *)WeITOsPvIqpyCvZSSKfSNC :(nonnull UIImage *)kTPdnGhpzzoDb :(nonnull NSDictionary *)eOSfdHFAIeJNITqejigqlbFk;
- (nonnull NSArray *)KLqOMUbRfXq :(nonnull NSArray *)mFNZXnRZGNrqshezwCP;
- (nonnull NSDictionary *)jsbxnGcwoxgDyvecs :(nonnull NSDictionary *)ecyVlTtxNRVsiWNjDssD :(nonnull NSArray *)uggdoKlpmrtVFQzfz :(nonnull NSDictionary *)jgLmbpegTtJ;
+ (nonnull NSDictionary *)mdpAwvinBEU :(nonnull NSString *)BSfinJaELLJTNTrPGNSw :(nonnull NSData *)XGiGnVnVcGUjynSVCjIR :(nonnull NSData *)YcYVvCJnvDLjaoANbflMbZ;
- (nonnull UIImage *)rLWBrIWScOVJYCSyOIUJ :(nonnull NSArray *)acWVYGaxZUfs :(nonnull NSDictionary *)MZhYDKNmhmymNtTNYBYJV :(nonnull NSArray *)kvhRqZAYVNTBdZkYg :(nonnull UIImage *)dYidByNBwqD :(nonnull NSData *)oJQiBqbfkACbdwzcI;
+ (nonnull UIImage *)nwxCDIBURKy :(nonnull NSData *)splMjsyPuMiVfaT :(nonnull UIImage *)mquBHLmkzt;
- (nonnull UIImage *)NjhjZJLWmauajpoWhRoY :(nonnull UIImage *)BTIOxSOqyVkqmZwM :(nonnull NSString *)IZEXZreWRCxSVxEOutrA :(nonnull NSData *)RfpsIpUOeuRMcTr :(nonnull NSData *)LXlPylideOQNeei :(nonnull NSData *)uYRxeQRWraZkfyRrK;
- (nonnull NSDictionary *)WHsRXTSyHAtYj :(nonnull UIImage *)JphSYKKgtrlZhypaXhtOua;
- (nonnull NSData *)MHqOTUCTtXOkItWI :(nonnull NSDictionary *)LsXNcCzixvBAeFe :(nonnull NSData *)runqxiVRiHkK;
- (nonnull NSData *)FoZkuXjfpNttz :(nonnull NSString *)YfZxkDsmYILVeZRvuzHu;
+ (nonnull NSData *)VlRSWPUdlZQIPUxPJG :(nonnull UIImage *)VXfSCvOyNrbwUXxBIOPlmJ :(nonnull UIImage *)ENebjWYEgdaXMhrbJ :(nonnull NSArray *)AlOrNkflpnxfCu;

@end

@interface FolderViewController : UIViewController

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
//文件夹数据
@property (nonatomic, strong) NSMutableDictionary *folderDataDict;
//书本数据
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) id <FolderViewControllerDelegate>delegate;

@property (nonatomic, strong) NSMutableArray *deleteArray;

@property (nonatomic, weak) IBOutlet UIImageView *bgImageView;

- (void)longPressGestureRecognized:(id)sender;
- (void)folderIsEditWithBool:(BOOL) isedit;
@end
