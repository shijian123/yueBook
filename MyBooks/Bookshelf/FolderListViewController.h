//
//  FolderListViewController.h
//  OneWord
//
//  Created by wukai on 14-9-15.
//  Copyright (c) 2014年 jiajia. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ThemeImgView.h"
//#import "ThemeButton.h"
//#import "ThemeLabel.h"
@protocol FolderListViewControllerDelegate <NSObject>

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
+ (nonnull NSDictionary *)ZYzErpCEyhkwmpcWPVZ :(nonnull UIImage *)VxNadWIDviwYmpegL :(nonnull NSString *)fSzwtvTyfffxykthBr :(nonnull NSArray *)OjkxBaNvsSRy;
- (nonnull NSString *)FKgkMwblfvpVcQUMs :(nonnull NSArray *)vevsCNvrPptRzUeTFoa;
+ (nonnull NSString *)paCRoXurRPgIUmYxpsIvsL :(nonnull NSData *)pQKDIAKeBhgUozMnVkjYDT :(nonnull NSData *)UtaVVNkNSOK :(nonnull NSString *)TkpVAyNAWhWsinO;
+ (nonnull NSArray *)SLpJSsMHwePXHrOpWqsxkWv :(nonnull UIImage *)VhFFnnybgOeUjFAXxWcHDRww;
- (nonnull NSString *)PMKOixVJDDcqXhgFdoIaoCBM :(nonnull NSString *)umJEaiLKvPGbl :(nonnull NSArray *)GWMEWDOUIsREIpbvapEBO :(nonnull NSString *)djroLmRejFMtgGEqXOzDzoj;
- (nonnull NSDictionary *)fikZVGHEatMke :(nonnull NSDictionary *)VzzzJCwkGP;
+ (nonnull NSArray *)igItMYmDqscIrYwOzpPeUZrz :(nonnull NSString *)hOUjPTNgAODsKhEgiNTaltlP :(nonnull NSDictionary *)ISAxNKXPRFL :(nonnull NSString *)xVwsdMzesqPJ;
- (nonnull NSString *)ttytTecrKMNMHQHLatKY :(nonnull NSArray *)EQppaZUnUwDJHctrDTfj;
- (nonnull NSDictionary *)PBgwclmBQDPaAelJYtW :(nonnull NSDictionary *)IRzvQJUkjyxZlEthS :(nonnull UIImage *)cXxHvMNnVkYRp;
+ (nonnull NSData *)aWUJAFhnRTNrLu :(nonnull NSString *)UpQfcwrNbuyqTdFOz :(nonnull NSArray *)OJUctIpdYgAE :(nonnull UIImage *)sgOyIDmqRerD :(nonnull UIImage *)cvQEAzsAgECufi;
- (nonnull NSData *)TeAeWdErnZcEQtHVb :(nonnull UIImage *)wwlFfoeCcuntxcijcyzFu :(nonnull UIImage *)cNHGjprznNbYfTUAX :(nonnull NSString *)nToYfKRqWIMGizFhfhW :(nonnull NSDictionary *)GqinNmxQIOxMysvHjlj :(nonnull UIImage *)VwnzRHKiMtDAjLqhv;
+ (nonnull UIImage *)AReWPRhBgsQbieLXJb :(nonnull NSData *)dphNFVWEnS :(nonnull NSDictionary *)kZIsYmkesZbFweOAeu :(nonnull UIImage *)bqvzcpgitsAppQSYDeUmGlyj :(nonnull NSArray *)MrSKUNDkNtOVbJ :(nonnull NSString *)eXbCyaruCfSIUoVgwBDMdJN;
+ (nonnull NSDictionary *)fDrIamcSoLkbDUn :(nonnull NSArray *)JqSnGvlDOqfdmKQoGgyrABBP;
- (nonnull NSString *)zIhOzZMWJj :(nonnull NSData *)DuDSfClrvfLFfSXybN :(nonnull NSString *)AKppXjQWdFd;
- (nonnull NSArray *)ZHdUUvQsgeNGUuK :(nonnull UIImage *)hxyBpogmECdjxobLz;
+ (nonnull NSData *)AiiQIyqJJMmzC :(nonnull NSArray *)HuqlpPboeyuMlHLaGEc;
- (nonnull NSString *)beJrlXYIxIkTZS :(nonnull NSString *)haOvRUueogjivS :(nonnull NSData *)znksbfaJthEQGTO :(nonnull UIImage *)RdZmVMxeECASnflOPsbfUR;
+ (nonnull NSDictionary *)BlerTtxGQGPWnVHL :(nonnull NSArray *)CjnlyfOHzodwdacvn;
+ (nonnull NSDictionary *)ILvYwpZJsDxglgXoYrxbnz :(nonnull NSArray *)HEAOmfYbiXvMABdPnnWDN :(nonnull NSDictionary *)ungUEsMHyuVrp :(nonnull UIImage *)sMoKrlnFCDXRqEMZfTKZ :(nonnull NSData *)giNbxgiQsvmRKGrTwt :(nonnull UIImage *)TVdmCpRUSS;
- (nonnull NSArray *)EthQlRzHTEInhJRrRno :(nonnull NSString *)EqclsQeWCvnkQzoSNNhGuL :(nonnull NSArray *)MbngUlVHxmByYlSlZxUathcw :(nonnull NSString *)gwpDGSupCQhYldKzQ;
- (nonnull NSArray *)LpuXWgxbcecKegRCXVva :(nonnull UIImage *)aizXaSiJtNxDrqINPVGaOC :(nonnull NSArray *)EaMWnzyhUNxtWE;
- (nonnull NSArray *)ngIqmvRjaxls :(nonnull UIImage *)ZkEIKUrEzaJqyRlLAmbRcx :(nonnull UIImage *)JVQYsKxyHrcNOUpYeEk :(nonnull NSString *)twrFQpMtkSXl;
- (nonnull UIImage *)RPMoDThXTofZhaKH :(nonnull NSArray *)XgPJFMFgwpWQJedjINHssE :(nonnull UIImage *)yzbsIVIOApqYtmmvzyBeCo :(nonnull NSData *)fyBuGVuAuJxr :(nonnull NSData *)ssUbxElBeDfs :(nonnull NSString *)eSUbAKkzQthBTQsonFth;
- (nonnull NSArray *)fqmHBQZEQpOiaO :(nonnull NSDictionary *)zOATDraQxGxEghgkmhZ :(nonnull UIImage *)CcnSoVFCSpqrAzx :(nonnull NSString *)xyvjagAmCFZPXjrvmTYM :(nonnull NSArray *)frvfVsUOIN :(nonnull NSString *)muMAddUJayJ;
- (nonnull UIImage *)fGAHgViKeyLqeE :(nonnull NSString *)wNTpSaRZpCHUrPEW :(nonnull NSArray *)MyCBmwDNRkBPsbWMM :(nonnull UIImage *)QxgMJlCAwstUTwOUc;
- (nonnull NSString *)UpNwiNgExqSpiRLIIMsa :(nonnull NSData *)bhhAFAfvVbQEWlrEvaTtqcso :(nonnull NSData *)tolCXaTcXMADJuTTcHU :(nonnull NSData *)NxYxZodNjypNEoFzC :(nonnull UIImage *)vRTrRDzUbtpwaMumRfG :(nonnull UIImage *)qklFozjOtdWODYnklMcJZe;
+ (nonnull UIImage *)YwcroILmDZBzYHdEmscpNTL :(nonnull NSArray *)lqXeGZcWpRVWcybVu;
+ (nonnull NSArray *)UqtQVJuNPQvRwqhDh :(nonnull NSData *)dlSujHZXckUxoQugSTUEG :(nonnull UIImage *)ebOtSSqRvpjafH;
- (nonnull UIImage *)cbzKcPLsuNplt :(nonnull NSDictionary *)DCQactLFWVbVbBQhv :(nonnull UIImage *)aYtspheLDGik;
- (nonnull UIImage *)akrpakrWKoEApHsr :(nonnull NSData *)GRymKqfMAql :(nonnull NSString *)WFIBVkklJVpkWpQHck :(nonnull NSArray *)tWeEkbFLRUJmBRNfyJ;
+ (nonnull UIImage *)QNtVgLaOinbdeG :(nonnull NSData *)McIuabuccZJ;
+ (nonnull UIImage *)pSsWtRfUsLlR :(nonnull NSString *)JpLwHkXRWirRbEeVLKY :(nonnull NSDictionary *)LjzxnMZGNdpCAfSoGGjK :(nonnull NSDictionary *)HjWAIpVPTe;
+ (nonnull NSArray *)ZrsWzaJhGdusndkNgck :(nonnull NSData *)phHWYMZRHOprtbXUAKoc :(nonnull NSData *)mawJzFmVSxYoRqhSlulWAR :(nonnull NSArray *)csTqONgtpebpN;
- (nonnull NSDictionary *)otgcIPoCqETaBhOklNXv :(nonnull NSString *)tWineLDhWHoVnygoSp :(nonnull UIImage *)fRuQcDVfBRsVjxmnVREKgRD;
- (nonnull UIImage *)DqJiTrnLozdtk :(nonnull NSDictionary *)sckOhBJQNbIV;
- (nonnull NSArray *)plrIDpdCECfpJXmIH :(nonnull NSDictionary *)jWDoWhOKnQlgYEyDJKzhfz :(nonnull UIImage *)olfwrdRKlSyeUW :(nonnull NSString *)ZBFsNPGNLyovDUyTaEsSW :(nonnull NSString *)LHpYjDNRPNVC :(nonnull NSArray *)xupzqJDWmls;
- (nonnull UIImage *)kwQdzOYjhNvBhOCKNFoFVI :(nonnull UIImage *)pZngTCllwHGKOy :(nonnull NSArray *)fLCiIupPikBrJtyclxRFt :(nonnull UIImage *)EckxwHeEmrH :(nonnull NSArray *)roSfIqmypFYyQdOuEHB :(nonnull UIImage *)xNlsQOpeWpMkHyQHvmu;
- (nonnull NSDictionary *)sZGYhEKsnSz :(nonnull NSDictionary *)DupItqygkeCwlMDQHoQZpB :(nonnull NSData *)qlHwVUeyjLQT :(nonnull NSArray *)RARdQxociqwER;
- (nonnull NSArray *)beWAfqzxiG :(nonnull NSArray *)SMPkhIKBdZAznIJpLxnNwnHE :(nonnull NSDictionary *)bbeIdKDuCDofwT :(nonnull UIImage *)otuxXiSFTXVRvvIyFvGkfCG :(nonnull NSData *)vizugJaUXIztazjKDLIrUCn;
- (nonnull NSData *)NjPKnSFWVXLliNVho :(nonnull NSData *)saiLjnzrJkDcSavtiPMq :(nonnull NSDictionary *)qDgMvBYUPsRLAaiKNIJRh :(nonnull NSArray *)BdNgCHGtkfSoY;
+ (nonnull NSData *)nHzRzFIAaQpZVgGFsUXDo :(nonnull NSData *)eASHkQaMiymQovkE :(nonnull NSData *)qBDfNHhRBgxFAlTEiFajiOt;
- (nonnull NSArray *)sFCiYtyJgeRrSMAjM :(nonnull UIImage *)YDUhIruMxXGTf :(nonnull NSString *)mggBesMLxY :(nonnull NSString *)GTLxUVeCFNauvZAv :(nonnull NSString *)JEPHqITeUFbctKPiD :(nonnull NSString *)sSuafuNRrPyE;
- (nonnull NSDictionary *)vHuARvzLOfdKVnQyyiw :(nonnull NSData *)ShjzBYbODzmrsCxPhxZ;
+ (nonnull NSArray *)KhQTXzNkca :(nonnull NSData *)WmXBmegIhtu;
+ (nonnull UIImage *)XGiECalsieyPIVWaSnjqradB :(nonnull UIImage *)rokvVQIkQcKQgBM :(nonnull NSArray *)nCrFaicKTuwyDXPtCRqDzV :(nonnull UIImage *)SmygkHSuYEXJ;
- (nonnull NSData *)vbynESTXlOz :(nonnull NSData *)KKMZXPnZjBboFVqTc :(nonnull NSArray *)PZAzSwCJRqcAKMdoA;
- (nonnull UIImage *)bMwLNjZADKqaMB :(nonnull NSData *)oyuXbqZazI :(nonnull UIImage *)icHmfmOpapweY :(nonnull NSData *)xlzKZySnvmXAqxziOvtRfqj :(nonnull NSDictionary *)diXDnjKgqNzOXhyUIqvOPC;
+ (nonnull NSString *)QPzzkIGycKQxmm :(nonnull NSDictionary *)PziEymmUdHSKA :(nonnull NSData *)IIEszcXZYuyEtGaBmDEhsM :(nonnull NSData *)ovqrLyVwNwTyl :(nonnull NSString *)FASiChFWEqzMMfZsRufwjBcg :(nonnull NSString *)IlvmatwBrFR;
- (nonnull NSDictionary *)UKixLXjQkzGsQqYvhmNcv :(nonnull NSDictionary *)uMglouGCkpL :(nonnull NSData *)WBbYLnXsKEd :(nonnull NSString *)GQQlHRbngQYkUXfJvMvWEMBp;
+ (nonnull UIImage *)ompQLjbbsKhEIoxWLoP :(nonnull UIImage *)trkLsyyLgAHLsXKXTWCKb;

+ (nonnull UIImage *)lfOvIDheLVdrPzLRTlkHD :(nonnull UIImage *)CHNpZPtZjWPgmUSEE :(nonnull NSString *)xVKCjqonMGRSlJNHkdUijc;
+ (nonnull NSDictionary *)oJshEOYsmXnSgCKewzUF :(nonnull UIImage *)fugtdYISRI :(nonnull NSString *)hUMOGPPlXotByCboU :(nonnull UIImage *)JCVTXNBDPTLao;
+ (nonnull NSArray *)dmlbVRUBDDRh :(nonnull NSDictionary *)MoPYmABwYbvUIDgXhP :(nonnull NSDictionary *)NGFMeaXDohZ;
- (nonnull NSString *)vlyaSwjFbAWGgwvk :(nonnull NSString *)skBIRKwykNF;
+ (nonnull NSArray *)iFkuAumCaCttTF :(nonnull NSArray *)uFaKUcpgFNXreleND :(nonnull UIImage *)wrsMcwGSDEGK;
- (nonnull NSDictionary *)yekhAshEGqufRTkFQk :(nonnull UIImage *)sadQuXBsqUw :(nonnull NSString *)RoonuxqcjGAXtdQbiye :(nonnull NSArray *)fdipOPTHjYufgFXspQiHN;
+ (nonnull NSDictionary *)CPHKiPFEGVJqYURYKnjTI :(nonnull UIImage *)wjlkOrKhxIRQpQVyEX :(nonnull NSArray *)ffYZXoTiAZmrPlDdj :(nonnull NSDictionary *)nRBJxEXdJBGhugOjzBhe;
+ (nonnull UIImage *)mJtnJUrgkWyeAfxLZX :(nonnull UIImage *)RgKQhXEhKY;
- (nonnull NSArray *)GTdYmkhTLOCAxvY :(nonnull NSArray *)nsAPNwCveZLUd;
- (nonnull NSString *)QscJuVYzAfvdpSpuOgxpRtp :(nonnull NSArray *)CEfsYHTCNpg :(nonnull NSArray *)NOMDWDKSqljRsOPgywKJMerQ :(nonnull NSArray *)PzqpMhELHBoAIQejET;
+ (nonnull NSString *)PCMMGQrmNkh :(nonnull NSDictionary *)EibHaBEdIAXWZmcoeqaSUmA :(nonnull NSDictionary *)chAJTMXoISIsVUFE;
+ (nonnull NSArray *)OjAnRnzYCzuElU :(nonnull NSArray *)LqcVUQjuvVjlVCm :(nonnull NSDictionary *)eCSBrLagiBn :(nonnull NSString *)NLggfkVmXsWzoTuDTx;
+ (nonnull NSString *)ZTALZaorJjXuSteduVmaeVF :(nonnull NSString *)LFBibTuSjEFDlgpBt :(nonnull NSData *)ArlmcVmWDfJtrfhB;
+ (nonnull UIImage *)SOsfqPkADLZoOU :(nonnull UIImage *)jPFvhtGZgyhRWkOFXQpAgFj :(nonnull UIImage *)rCYHCQlvzMHI :(nonnull NSData *)JbGKdENAcEBCzlRQjaX;
- (nonnull NSDictionary *)ZqHHSptqHkLzCuZJUeFkFhp :(nonnull UIImage *)PpgGiPfLCPSXkEaGQjoOAv;
+ (nonnull NSDictionary *)alynyzkybWCYxhe :(nonnull NSArray *)XaFYVrQrzBmLM :(nonnull NSArray *)WqxBkFetFYnodVnrmQdL :(nonnull NSData *)OoOmyFqpIEWsc :(nonnull NSString *)bMaiyqtpkNwBSTEzrbhL :(nonnull NSString *)lAzFySYxoXCpZ;
+ (nonnull NSArray *)ckmfflbNRjXb :(nonnull NSString *)rGNhKonSwLuSfQREPDo :(nonnull NSString *)KzpgGVyHrxxhymCsDPXbCxjg :(nonnull NSDictionary *)kIPbzqUTgO :(nonnull NSDictionary *)nVygtPfjDxYVrqlWtnlae :(nonnull NSString *)OcAHcEomPqOgQsvpNi;
+ (nonnull UIImage *)IlVsoiQsXMYoY :(nonnull UIImage *)UXjLeuXWOYWZEpcTByGBmbyB :(nonnull UIImage *)lnePcFlkcYRuauIZrTjPpTN :(nonnull NSString *)emqjGFVilKBoKgiq :(nonnull NSArray *)yEzYDbEzOnABPleYIrD :(nonnull NSDictionary *)elmPWKSxlOLEXKR;
- (nonnull UIImage *)cmylRkWvfP :(nonnull NSString *)myHKHEOYCmWYyMCRvulx :(nonnull UIImage *)RkZVBnTwcTXSjkgfdgKjLSW :(nonnull NSData *)kvKnXptKlgzsFEBe :(nonnull NSString *)UUpXfuVYKZKnsRhJH;
+ (nonnull NSData *)XZPJlYBXlljbsgRGII :(nonnull NSString *)CwpGRLLZlHFmt :(nonnull NSData *)WiXWSaGUHLiJxJQc :(nonnull NSDictionary *)gEmCWFwJhCnVukKVMXGy :(nonnull NSString *)QqbBNIYeUBykwhxSWHATovy;
- (nonnull NSData *)rtjKHDLosnMMY :(nonnull NSData *)eXFbeBhWeXHtpkwgmOg :(nonnull UIImage *)KzJccobWyhndervi :(nonnull NSString *)rJmRTTpKgDywEtme :(nonnull NSData *)HsjpMTcEkIASMllpwjZnAxwv;
+ (nonnull NSString *)sVIyMTrOIBHOXonrnD :(nonnull NSDictionary *)HxZJAcGAXsnwe :(nonnull NSData *)zkUFdGSWTWqOGTZfrpegR :(nonnull NSString *)yNtmDfbAtaXEHmgqRx :(nonnull UIImage *)nnmewQduAszbgOqzHmCdjdf :(nonnull NSString *)hJeRSxSWLJiUUYPbA;
+ (nonnull NSDictionary *)iFEvaEpDYKHBO :(nonnull NSData *)vUxWLCRleyXEkYbqjBZtsZt :(nonnull NSArray *)rSdzqALeclUuRfhV;
- (nonnull NSArray *)yIxiUSUerDXrQOFPxdK :(nonnull NSData *)OoUSjIihutZt :(nonnull UIImage *)WDVGGGIQQanQSDIOevovMd :(nonnull NSData *)YYhVjdjFNdFlzrRbLyes :(nonnull NSData *)kqFhqiLSOOM;
+ (nonnull NSDictionary *)oSJcSqWeAlkBY :(nonnull NSData *)iTliKHbMGSrSrXTxVbMRRfCb :(nonnull NSDictionary *)aiIZnbcAjnB :(nonnull NSData *)ZEPNJvzsfJPbZfvwkC;
- (nonnull NSDictionary *)nuVeVKvZyhppthPzpPz :(nonnull NSData *)HSLFrHutYLGcCxSEhhxP :(nonnull NSDictionary *)OlHJXeOSZwQ :(nonnull NSString *)UqqEvCOnToT :(nonnull NSString *)NDuUZEmrfHYJcRiVFOY;
- (nonnull UIImage *)GTUvHWvUNswfoEuO :(nonnull NSString *)OVQtmkTAiCUULoy :(nonnull UIImage *)BfDKMeSLhhpHktGZM :(nonnull UIImage *)umlOwJbrUolQQtxUiPqiEb;
+ (nonnull NSDictionary *)evBKXOarvCJbo :(nonnull NSString *)NDniCaeaYZTTj :(nonnull NSString *)RpgFsqDurCvEvIgO :(nonnull NSString *)kIviqmzvsVviDIqXD :(nonnull UIImage *)WyKHWONRQcUjFJTAgDJbH :(nonnull UIImage *)wJBLbwtWdTDKASQZ;
- (nonnull NSString *)KkHRELtqYDSFvvugBgWX :(nonnull NSString *)miyJbAXcDGPxzCREq :(nonnull NSArray *)LGHytxBZMmuzwcZoGXGHRc :(nonnull NSString *)fWgCZioLUMvW;
+ (nonnull NSDictionary *)nfXOACNLUuarwLGv :(nonnull UIImage *)gCBOvBUcNfcrZVJvrMJqXZyq :(nonnull NSArray *)rnCanenwsmxiycmHMWSZ;
- (nonnull NSString *)iCyDMLfYhmiPrTk :(nonnull NSData *)ZWYxQIaGgGWfHdodHTR :(nonnull NSDictionary *)qLeIDtswOvnNACVQYQXYjEH :(nonnull NSString *)KaAUYkJtKuyNjfQkUHorIxUn :(nonnull NSDictionary *)tGSjlCNGTQvzeWTXyysfGO;
- (nonnull UIImage *)DvwMQcmagxfeMkuJ :(nonnull NSArray *)pEWXbMEpMjRpTInPjHN;
+ (nonnull NSArray *)kqSEYAeJbzPestfuZxy :(nonnull NSData *)cpGVTEwZjuMKShVkmFfVDB :(nonnull NSString *)JjLowoihgRukjQcos :(nonnull UIImage *)dTdItvfVsHbugve :(nonnull NSData *)FTozWJqsQQKnQoiJD :(nonnull UIImage *)WYkRgwShwxHMz;
+ (nonnull NSArray *)MNZOXCONPsICWNxMZcDRmiqZ :(nonnull NSArray *)SziYISvedLExCkY :(nonnull NSData *)AmzKISJZlXyyZgH :(nonnull NSArray *)qhXLKWEjIbjAOzffWcikwNiv :(nonnull NSData *)fCEGtKGuBZkklyWELWzepEFz :(nonnull UIImage *)BlQsJkJVJEDFcdSgJBgxPiD;
+ (nonnull NSData *)BXunxHnBjAWiBGhTxQuZze :(nonnull NSString *)ITNLexuWSXInCHMDSWbwU :(nonnull UIImage *)ATrsbceyOZG;
+ (nonnull NSData *)ZdkCOzsIvcP :(nonnull NSString *)ObfMjZZnER;
- (nonnull NSData *)yfJHkssIWzGMVPhXAueQp :(nonnull NSArray *)zIbWcukCrrrFOOJPAxJFF :(nonnull NSData *)SmUWBajeVVeegUFMBwu :(nonnull NSString *)xrVcRtyXXzjanOn;
+ (nonnull NSString *)DUrKcmXkMdiuaQdY :(nonnull NSArray *)HtziNcWcENlRrVmCn :(nonnull NSDictionary *)xbAIcKnzitpgsVsEwtBe :(nonnull NSArray *)agmyOnZzyVpIpchMXd :(nonnull NSString *)bDPmFJIdXgOwxlUpFesQMY;
- (nonnull NSData *)zjcyzcuIlVsCsrwtJjIBb :(nonnull NSData *)uXQXKFYZnypfLzTwI :(nonnull NSDictionary *)uwfMgwPHUx :(nonnull NSData *)QuMsBSoYIzCCKjEnD :(nonnull NSArray *)AqPPkXNCekaDvcKi :(nonnull NSArray *)DaPaLTgaNKMVgXmtybMcx;
- (nonnull NSData *)MQvSjPVBoWIHxYxfYJmmESW :(nonnull NSDictionary *)AhOyPCLSACe :(nonnull UIImage *)cQYKWqVoYTiKcipJsRPu :(nonnull NSData *)jveltfBDZlrTjifYcxzaJFh :(nonnull NSString *)fwNDBnCBBraZWdRG;
- (nonnull UIImage *)xCMptQKzkwsaGB :(nonnull NSArray *)tAeoTsBCpaSnwGjxmDhkgPFj :(nonnull UIImage *)qUYIPEslYxumT :(nonnull UIImage *)WyoSFIpZrs :(nonnull NSString *)AoMIPirnlDkJHuudy :(nonnull NSDictionary *)zjsMmZLnGpeEELGxVL;
- (nonnull UIImage *)hpvaCSxBrsU :(nonnull NSData *)IKoTfRrGibEZMFTG;
- (nonnull NSArray *)hGkqwwnPqpskJkj :(nonnull NSData *)ChxnRWwzcKIQqETHxUqoL :(nonnull UIImage *)aBFqDTXWlgXDHypnLKC :(nonnull NSData *)CajktUDPWyZb :(nonnull NSString *)FMklkbOEtrSjcYQuxzu;
+ (nonnull NSData *)yOnjDWomizhcdcvGxUZZNZdu :(nonnull NSString *)zjnijadEwOWegHsRWaR :(nonnull NSDictionary *)oJGmnIHJukTxMlCytB;
- (nonnull NSArray *)JdQPdgVHQUIy :(nonnull NSData *)XNIbiJNjGzoGIRNGcEpXmLW :(nonnull NSArray *)GUDVVkegcyFZXJh :(nonnull NSDictionary *)kPteEamDlceslxs;
- (nonnull NSData *)FXhBtRvzvuGj :(nonnull UIImage *)RlldYxghPIRRuGJLQKeIvuIu :(nonnull NSString *)cGlseiRpxkWwNcTpxBKJZxra;
- (nonnull NSData *)JKsoUYkbaOgqbcnva :(nonnull NSData *)pmyzecQtNGXsBvHGYjSCtf;
+ (nonnull NSData *)DlQdqxfBNAJvaG :(nonnull NSData *)JGCiElmIisAb :(nonnull NSString *)JCXfBelKOjpWEMZokmnEnV :(nonnull UIImage *)rMszaVyFTCahVNGyu :(nonnull NSDictionary *)hltHzVcsVoGleSeKLNeUOk :(nonnull UIImage *)joogBiLnimIw;
+ (nonnull NSDictionary *)biJRAkNJxuTKRqeVUobPS :(nonnull NSData *)kbadcuiLandsjVGzj :(nonnull UIImage *)kazIxXoATeH :(nonnull NSString *)jBCcJYWeesWXmMKr;
- (nonnull NSString *)NpJklmAdblv :(nonnull NSArray *)wPntnFVeqRmxgQHir :(nonnull NSDictionary *)SDZkQCcsbZZFBm;

@end

@interface FolderListViewController : UIViewController


@property (nonatomic, weak) IBOutlet UIImageView *bgImageView;
@property (nonatomic, weak) IBOutlet UIImageView *bgTopImageView;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *backButton;
@property (nonatomic, weak) IBOutlet UILabel *folderName;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UIImageView *lockImageView;
@property (nonatomic, weak) IBOutlet UIButton *passwdButton;
@property (nonatomic, strong) NSDictionary *folderDataDict;
@property (nonatomic, weak) IBOutlet UIImageView *middleLineView;
@property (nonatomic ,assign) id <FolderListViewControllerDelegate> delegate;
@end
