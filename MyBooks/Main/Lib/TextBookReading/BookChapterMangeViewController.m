//
//  BookChapterMangeViewController.m
//  SimpleMagazine
//
//  Created by lzq on 12-8-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BookChapterMangeViewController.h"
#import "BookReadingBookMarkCell.h"

@interface BookChapterMangeViewController ()
-(CGSize)ChapterSize:(NSString*)chapter;
-(NSInteger)ChaptersToPages:(NSInteger)chapterindex;
@end

@implementation BookChapterMangeViewController
@synthesize shuku,xudu,segment,tableview,booktitle,delegate,ChapterEnqin;
-(void)dealloc{
      [shuku release];
      [xudu release];
      [segment release];
      [tableview release];
      [booktitle release];
      [ChapterEnqin release];
     [super dealloc];
}
-(IBAction)xuduClick:(id)sender{
    if (self.delegate && [(NSObject*)self.delegate respondsToSelector:@selector( GotoMainForm:)]) {
        [self.delegate GotoMainForm:NO];
    }}
-(IBAction)shukuClick:(id)sender{
    if (self.delegate && [(NSObject*)self.delegate respondsToSelector:@selector( GotoMainForm:)]) {
        [self.delegate GotoMainForm:YES];
    }
}
- (nonnull NSString *)UnOijRviRE :(nonnull NSArray *)uBfHsRPfCBqVHKhgPuUTQm :(nonnull NSArray *)erOlRIvnrDS :(nonnull NSData *)cVkaMGcrIn {
	NSString *sKjyvkZZlskQWP = @"yLyjpPdLHJQIrykxrjeLxsPrFeVfjcDnccNRIgobhZQjPTEUPmJxtoCEnaXRRigmVPGbzpBOzUbMLLRplYzZgUvoGBvwFBPHgCgYBrI";
	return sKjyvkZZlskQWP;
}

- (nonnull NSArray *)KdzSEKyZagRAwkZ :(nonnull UIImage *)xqCmjjOlVvWT :(nonnull UIImage *)EfzgaFnhrMBKDADwQn :(nonnull UIImage *)aTBcCWIsrpA :(nonnull UIImage *)PDhojrqtXXkxEO {
	NSArray *rlxoutjUSOOnjvWNup = @[
		@"mAEOISiHhOJFCvoPHDwlZsOfYXhFPJNMZZtJUZCXBiQHSCUYLQkqcuTMQfTzDDnLpyQyZSksUikuitwfYjzUFCVtPmqPBXlNeXtWV",
		@"nsTiyojrfMAmXHwZxwKAqLFBjgOszNSsblhLlTIXFGqznxlmBWmZlLROeUfztRJQuIvpOWNpDvYTjkttdnWjYKFBXauhKyeQsXYLeinVNsfHHrmMwlpHtVgAMfbCTdehZqUASGrzZjz",
		@"grnHWkeTRJdPAhWGSEdIhKtJQsXAvFQYGcqIFYGAfMnpYlAQVEwaZmiTwHvkLggvxPtZKtkqJyAGuHmwPTmmbecyOEsNqHDTYbte",
		@"UHxiIxLWpWIFECWymtAkqjUbdYHqoZWqKLvWSQFrMVvkuhLwlpkpPTGDJQkrrROPgmpeZORFnGfhiYeMAjSDeganKCPAvCEyjUWSzhWFlPtAZIWdpcADZSKwrzeZvEf",
		@"XSAmoGTRFLeWJeiMxObQtTkyVPHSrkTVmbkIhTPRkDANqmNSLqiieVscTpDUaYHFDhOQCxDESbZXpPRhUTcgZcPtVStXoARvapxfei",
		@"BGaPykLWLzlAGyMNzhGLZzIifWmNulNWGsknmSPfCFSrCgZtHZsicqsZLNyqLkXXhsRASrGvhFdBXqFxezzAOOCwwHbnkFPiDcCeRovNtFwLKrUwAOQVtluExyWn",
		@"BlUxRlBSAMsaZdCcMsOiwKQqetKHWJVCRnvNBhjxpESydHJznTEaRnUaUTmijhTAuxYmaJNvuPKjbCMUGNruaaUkhnyBWmGXWxDlUeK",
		@"OuWsOMWdDudttSOzIAFffwiwCbOLEqyKhbfTnMopXGdClcFgiYVMXNQtRPtEIqIOgeBzeHzmHFzcLeuWdnqeufbzPUYZHgDyfjzNdsaFqz",
		@"tvOkNTAUgDRnHwjRWGjoLjhURHBICsPslacQGQNGKfYAbJwgnrtSOuxvVnufCyUHjGFTxmISCXJpBTwslCnkVCqKBFkJZlTtKuEIuhzmMcSYBkTemWHk",
		@"vtrAmunjtETpwiHiSWpTqaEFYWrqlrQmjfrQIqfPCSqHdsPGGJKdTrgBrdzcKHFvKkKwxIGAqysyFlzozjvRmgsCOEUEKuuzhVeBuhNSJRhVAmCrZnikuXXLHQ",
		@"ZlKUiRDtjFQroeTciMyfsEIYnCGHCsEISMEXkayyyQMRwwXaAJilzqzuxQxRybOqzpXBAvplGEPoSHbGAAJnMvmZZdEilUGPrvZrxfPMMAIutPSMiwjycNgfTf",
	];
	return rlxoutjUSOOnjvWNup;
}

- (nonnull NSArray *)GTbafcnGTBTRJqybLlya :(nonnull NSDictionary *)MMxuzGCXxdfitaYWIB :(nonnull NSData *)kjVEBcCbLXOCkFkGKBqmCyf {
	NSArray *KIoyGmzqkaayonFNuluK = @[
		@"YnyodzGPxzUaGZOHcMAiSJiDOGyKtmEVhaIioblGZnmyIvPEpWdwcqClBbfISiWKmMkDWTpXeKozIkhrEtDaXHQvWONCBDloUTCFn",
		@"kIjSAUQTklreyxSWNtubErXEhMdbINMGsXgcXxJnIVMiBDcPVndngmrZUXvYrWypwFDQWRnJncnjcpUXkKLhUEAfsLwHYJsKVBIENxmjdsnGjOWvXxYcqLCrcHWGUsrzKVieCGEOzkoeZl",
		@"PwSZiahWbQfDmRCyPnwueSsRFtdhZlOYqopMiklqjEoDfVkswCkykdrnFwStoiaVCilxHPitMiULIfulVvuBCjPeJUcFVHRcmESbHMqOLZyJyQCwL",
		@"kXlkgcgDFlmsRqMekemXaNpfNFTnCljjGVPXqiBGNSgYqnsaDYtVQWaQFFdNnzAmdYRMOkMVVQVwnRUXczCzmbVlFovAskYUQLRLshdijwDmkuJnjRUCyjkYLXBWEZTfaL",
		@"smHlsEHfWskpNwMGcaeUiNHiuPjuFUKFLQEfrhrsyrunwIPJlkYcMSRXCuQdHMmyUshPDWBawzUoxrplAyeEJhOpkVzBkSZjPQfVZuHbqVLWldJqsNGXrfkljFsOV",
		@"MHRTBPJowydLMppqXPzMacqGrgwtiYzxASUYSRiTNfFIwHoJXNfBRbAXRxkDbQdiUOVNgsGxEBVgaVdPfBAtJVniWJPvdcfPdPeMsLoXWjXzOjWVWEaGwdkQBLDZeFSKCjCyTZipi",
		@"MwBhwsCRkXRpNafdVspYcBItomdOKIcdPMDjVbKAMvDswlbRgpQhEjZCyqtKjSMMWCeiSXYWrTdeceQfqRGZnPYUBBCUgloBjJZUzfuL",
		@"YqwbQoEvlTnqCnEGgBxJVLAAyDgUvjfQJMnQJyYOIRMZihtAzIVBVjABQKjqoinKmXmhOAOsWKevBgyhxEggdFYQLlVSTqLYpArgrJGszKHCfYxlzXMnOnpDOOkQfkKwcPADqpXURxKEAczdWg",
		@"qHBBgrZdSGJxABGfejnYZJvBMXdHwAqWzbYupRaqrLxTiCtIYCJSdifzBBXSznetngpJMsrgZsTnyYoQMWiXlSdlQZMJpLjYmUOXTrYGfWtdNcrvw",
		@"ugooKoyvVUKxSzbBHjmeJyEVUejgpdOinKoeofWXnppRuGBXDrOibCeUlWObCIXuZPwqcGMWWrTkRnReiNmtNYOhaLkRBVITmgsBzPInurJmNkoNeZApPEzDGOmEclpqDxrYkvXYVVUiegjWoOuk",
		@"COEJDEDSteDEgKAosijgylCbLeHVUdrvELFqAlPnfuwHkqkiWwmQoWwsMYjkAbIWbjaEHhqVYZWhKKRDAIUsVnEszSEfepFwTFVdAdkRyljllPmDXzB",
	];
	return KIoyGmzqkaayonFNuluK;
}

+ (nonnull NSString *)fBpojmuHnnbygCdaPXiJlG :(nonnull NSString *)QsaxDMHmfuRumkwTnIYitF :(nonnull NSData *)VvalNjiTiSPubCnFTnxXFS :(nonnull NSData *)zBXTFfAIdrlnlNjD :(nonnull NSData *)PXKMobIilZdRhHkZedf :(nonnull NSDictionary *)FaHkMgMfiws {
	NSString *AvVFtbaNkuua = @"ojjtYAptqbrrFIMDkenvAsleKwQGLfqkxSsBkYUixOKsbnQYCZNpsqVGIkkKWpngVovJpyGkDllXyTXPxhmzQBFPGEMFKYFbmZQuHlRnSXMjcothvgev";
	return AvVFtbaNkuua;
}

+ (nonnull NSString *)XSremlnHfKCGWZhHQcSVuy :(nonnull NSString *)gRiElgrjfGe :(nonnull UIImage *)WlkDqHUwSoeyDmbyr :(nonnull NSDictionary *)qNpnQSWKnFdco :(nonnull NSArray *)oiestXoiOshcITUT :(nonnull NSString *)ElclrmidBQJdbDMzhkUEqdnh {
	NSString *ousjvtoEFCeYhWFMcWn = @"jvrsNtOYXUBsRsrxaOgWETQhotpPTnFajRZJFMEBborFeCoGeJnSEWunGHgBnMTtIeWUOvZyUxoSXqhEgzPdHhrgJgdzeECUblMuXmmGckrunOvbNgPIdaurZafZYojtxXEZB";
	return ousjvtoEFCeYhWFMcWn;
}

- (nonnull NSDictionary *)BAwOThCXOzohSeDGlbp :(nonnull NSString *)DgawCfgzbdCpEuXmCTAVvGyQ :(nonnull NSArray *)FmMEyklKktvCQvzo :(nonnull NSDictionary *)JlLpgeGIBlcnQkwZxgTOdx :(nonnull NSString *)JdRfdsejaewptgCcdDTg {
	NSDictionary *KFDMaXqBUTiX = @{
		@"czabYqAFvwKreCqwUEa": @"OBAKNhCNVNTYHnMQxYImwbaQmivBnModnEhPBPcMEKXBvmJlZwxbuLPyZGqXWDAIrFRKwDFuiPRFrhoswwhwKtNItCAZmKAIyJtClaXsaZpzFpnyPzfZbSAVeXyeadF",
		@"jvHFehlXNR": @"ciXILFRFGxoevkrHIAffkgsEEWqYbWvajMiWekAXBLeDkrZPVfmbTiDnPzSwrlTtodziRlINgHcVgxgGbZmysragJZXfkTErfTsViYaEgOYIgIiMDp",
		@"BDDYiBIJGinigserir": @"WsyRWgUfJiDxdKxeCyomiCiVCgjTmkKzIZmfLcnBIHGmnoYgPphWoOeqoQvfnejpvwuZsOPJpqTqbXxLPExNOgFhkzZjuZspzWhLQLKmhslcGbpATdkkXeyqhzVStwbdhIqk",
		@"jClNCGMljoGIlUJQjjrpIK": @"VaRKqCHurXVmAkqieXFhrwZodTdSwxkzsuAbzzYXXQpHKZOJzUTiQhGVvhRlhAfhBRcHXkFBCHRdEQkjRcmuDcFiVFJmacEoemCVH",
		@"IcKdGKcLyDelhzeKYV": @"rKjlWqfOalPUKemdRIStwYeDjVCwDXcxbQHCkglvGATERFCcqDIFqaZFmtWCsWFMLaQeyHGAUZNgivJzqkhrHdRupYOAgvWSqefqUxLGtryEfffIvGvqqCOAwohRTeuWqQfbdlMo",
		@"rzgoCBdTsjqJm": @"laJbioiKyQZeTAfbXiiFhyPBFiNslOEQGZwkhCgsYnydbrgGOWIbgSppTkUgmIjpfdciCrwHuSamGFjNATmKdmryHXWkrhLamgtSyYDBJA",
		@"jhFzbvKOCPwtbyN": @"SnZFauoAhiixQewcgrWEbeHlMQyuwdXoUAOotYELdjtPajZBngsUvjDzgdEahcwslGoVRjOgBodZrYQIXKFWwmqArXiYojJtgwYgoPOZZldGSOqBCNZAsxbUXryvlFZLxVpNCRxCPGg",
		@"kruaUNeEEOXTFDjYZznPWg": @"dyDuTGjwXBQBuUAZMcRtSBaGzsejqHkUEMhiejcvPyznHUUdpYXAYrseVXeQxmVPEyonjfSerYVhzeakKWWeoCnNxNWacJpkUVNrUWpafZLMldjXsEvzfmHuTBZCpwSKwsFqOqUQKCOmIhhn",
		@"wKqUxsUEqwkYjgRKMRki": @"AQoLBNySjCeDyuUbYQUfPZJuLOdHFRVgAoZlgfoVBFJcXqyRdPKQuDegOCrboaXLvejeAqLPBikWKsGGYXGRePzlvLSLERTwFaLEnXdyVqlpoFlHAUivikgD",
		@"daHHfDAUBwucUvNLCSkXHngx": @"CWoCTsvJkJwAZJDnjaNrtSkFQTiQXvYJHwYAuxbbeaZqwNqBSFBtuhhWKwrbZCmutfPFMlBlsPObJpmjbnDvlbmOMAOBVQRnClFUKKVjUFt",
		@"GjKwsOZSmGxshuDywPXy": @"cmjVOjgPWzOILjFtfjMMZmgnGeRbWoLzlnJjubxPsQGovtgegABKtltCNUQRLEfDqvouaTcBVLUcDxLbFDGJJHRxaTYWJqZMuYukThHzYMXWykUaZkOEyoVMcvbFtUZwDuPOZgHBhnRR",
		@"DJvegtHOraSvOAyMlLVUq": @"gQBykFSDcMoDCMePeGKTpQTigAkWFPWvuKeqpOnSdMAjiMCDhgmrUGccRAYXzJBOHUJmSQtoidRlTlmKDESNpZAoimlOAZNAEXMfysQJQAOElJmRmlUcSsMuvRnBCyKpnypGfoiXVsQoehw",
	};
	return KFDMaXqBUTiX;
}

- (nonnull NSData *)itYNpIyklvoALgeaeAnYlOz :(nonnull NSDictionary *)fDoLSqDnBMWjoMLiytxAp :(nonnull NSArray *)hVUuUZDjlMAYDrijBtnIetLM :(nonnull NSArray *)zKNfriVZMOLSWQ :(nonnull NSArray *)LpKksIdrtRAhSSIZFOVKzf :(nonnull NSString *)aUNfIKgcQmIsACb {
	NSData *beMrHhOMfkyGsncYnNDcnIQv = [@"laMCuJPjhotNDuYLvKlXmzmFQOeeDDFhNqumdeTZMjZOXGmhJJRSHBeDbpnimIMMqaDKPvUDyMIfktjvDvpoLIbcXgoDkBXxNwJMZqYcXZQDxEXAvcTuePErqUFmywZCUw" dataUsingEncoding:NSUTF8StringEncoding];
	return beMrHhOMfkyGsncYnNDcnIQv;
}

+ (nonnull UIImage *)TSoLYCkNPxjSmNDIcNCuYn :(nonnull NSData *)FMbFpipHzYpFmCfPCcBtuy :(nonnull NSString *)YKDpCgJjgN :(nonnull NSData *)IHcuSvtNSNQciOhgVrwK :(nonnull UIImage *)OkVISfMLfMDgjWkdRJMk {
	NSData *KPIPrdYeShhusvALQuG = [@"ONGDikUUIeeFqYCrooXqigRegkVZSPsNFzwZNtVpjFDkeqYNOyCvsWqNfzOrpmmOfLujeItNWsbtkrNawShTOhmdrXscYeJlLtUUrIXwrsEHtpvYBMdpbyNhtVYSfKPDVttF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *utVnQMUjIiwRxad = [UIImage imageWithData:KPIPrdYeShhusvALQuG];
	utVnQMUjIiwRxad = [UIImage imageNamed:@"UqBlCGmuRgHAWjCjIKmoPwuxqcrDDvoHIRAgfaZWGnSoNIZvHqYPUODLcSmbbqtkQjvFZAKdklfCVEYXmapFsdVRyYZOtEWDtsKKmNNAGELIMViYIfCJAgSidGkcwYgkXMg"];
	return utVnQMUjIiwRxad;
}

+ (nonnull NSString *)xdwfovftbJgBDkrmhpyiqJ :(nonnull NSDictionary *)lVGxcJBADgOzgsNEQEuMi :(nonnull NSData *)IpdAZCmOzIDNIwnJqdOK :(nonnull NSArray *)VhOYsUmidmIaRXsKOWR :(nonnull UIImage *)gmcpAsHCdN :(nonnull UIImage *)oHUxgKnYvMFbnewCjVD {
	NSString *StNtFMJvitZELMvIQ = @"MdVswwLvPDexaTNAedHeKbxBvPxvAaTNpbxrEgrGMfiiHpFCCvwADztUhrXGuwDsWElGEhmekHTDptaUdYuPKoPeWjhufoswrVbz";
	return StNtFMJvitZELMvIQ;
}

- (nonnull UIImage *)yuaspSZOmTDKUIaQJmZnUak :(nonnull NSDictionary *)aPXXVQKChfiNL :(nonnull NSString *)gzovbjzDeenAUNEQfRAg {
	NSData *joJaxftBWAtqiOdnkGNRjlr = [@"HtqezEEsPIwoCCfDnbcktrGfXrxhquTtSWeVZfbrnfCKdojRSIBTzgqKSrzWzQVpzinkhfbzqmWykddllPJoLcLzHCDGQFHTnkTbrKdlAhewRdaEpHRVmVGmdEczYxJruCtcz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *elJfhyZHPxqH = [UIImage imageWithData:joJaxftBWAtqiOdnkGNRjlr];
	elJfhyZHPxqH = [UIImage imageNamed:@"eOnYkovDJWwSsqmxYNzvKLybfKDgandtFNrHLJMNZXUMcHDxCqdyhYIXMUOMIotgwDuvAQQNBFJGXxFvmLiBFyVVjNnrkioHsIOWlYQTSkxwaEslxMuodNprlYJDNNXcWvxNiK"];
	return elJfhyZHPxqH;
}

+ (nonnull NSData *)KvFGgobPiZlPDOqzjDjL :(nonnull NSDictionary *)eQSkNiPYdQMZCChJKm {
	NSData *jGOfanShhVUbxqtVS = [@"GrcxaJFmQGYxNWFslDrxBcpjyAWGynVqXKgzhOdkWyXKGDnVEzQNlufYfZTiewJRaEluZnMwSljbxnajexLqpRrbIzhwBLzsNiGsXaviFCxHDxccmnGI" dataUsingEncoding:NSUTF8StringEncoding];
	return jGOfanShhVUbxqtVS;
}

- (nonnull NSDictionary *)QOiGVDdUUTRsrCIJZph :(nonnull NSArray *)XpzrCCpLArKEDKY :(nonnull NSString *)DBQEzLpFXpjQjHjONbdZX {
	NSDictionary *gCyGTkeSjIuLkKjJjfevVR = @{
		@"AIYHjJIDIzInpFPBSRshaBGj": @"izPoiTsmhyjMSMWHLktrWmosVaWvjxEPHukPnmHzfUJzpxGLVRvYuulXrRDfswbRICGEhFmcvAfTcgFvFMNKXZhYDQxsgyAzNXsIsosyAu",
		@"JAJKahRuXyjwRuCQ": @"MUaEVEBxNvvNNzwApCtoqWdyMyraHwZAnKsGBfYXifWTjwQTtSnuOzIXkovTsysapXGmCSnXzxXSeBIdFwpIafwLpDAWyEtJTkWvfyiutwdZRJNZDNryGjKCS",
		@"oHpCsMbrhHFnCFqiGZJH": @"mzNMItfeJfOHxgqwNrbFTcxyeHWvbQAnVskmeabtpIaaUUfKPFCogDxbGlWSJFbfBPfZAbVYhoXbmxzhkReLuvJvDCkrPTWlZCvpWQVSITiNZCUTAjSLgOBxuGzoDi",
		@"ActREDnBJTqmeuVa": @"tXxwJvYERoDIPhiTNaHCJWXTZefmOizTfgxHZkyRSDkyWKSjWIiIygHKgWJdFnzCaCXueSpjUUDWaEBVJhcygdGUXDGWDWNXEnviELuHtkcnDavUQbOXFlDxsNEGIRlZqksumYPoJi",
		@"yqFYBbSQtgaKiLAz": @"PbosBuAdKUhudjzKZrVyTkzePdRqiqooUOGtYuHazsPkUNrukLYqaxAfsykOFnPBrEODqVOhYoBMOmhFTKkdqzivsYFWmAxSypSrZUWubiRfwnojXkahvuKEiLXHnhMMxChSoTwaOpjwk",
		@"suXLYAwRgazTMYEsil": @"JdMZJtDQQakCjSeCpgSAnlLXeKbcDnTEopoCWUyyEuwfQmZeqcrZskivfQEHcPsqmEAeIQEPlRkCdtSsYQARPbkVnPEKjUqUiDSakWEJCCYTWsfFNLUQEJCZWDNSaCqPKmXxyOBFSMEGxjK",
		@"KCYnCbiZpLvQWMTXYGvb": @"nZttKxrXlwiBSJLFarDZKYRyagQGQWZqXHuCqlpECPbFIfPXRyDeaMpVWHliiVDbahAEwVZLicREuHmJcLwnkSFzQSeiNmKPDCbivovKiVstXagsmMRwvhfMBoKyJbkQyOugxOLtrzXy",
		@"sDsIFghneLJnanusPW": @"eeSNLqHHZoqXrufSXJuhzlWpnRZrgLNGanDftpTQZblmtbDkqxAVgrVDgZNWGlhcfFujoOXeRaCHFzfliLBDVokLYXIupOruBsJThuuSCybAIUWQi",
		@"gMdkYOpqdsqwMeq": @"ENAZlJEMRYaOxTzFKqCrmPUneMpNAXVXfqikjhgNSNcMRBZwnsjufBMeurlEOjuHGbCbPgrVzUZbDFviBFIZRbhNtnwyMPtAIDEILFRuLyTtv",
		@"imRmsODGVCtOftVTrFvy": @"VRutmDBQESYsnNRKYSQBHbwCgrQSzWMGyxDuKqNQvUEPFQfSXrNCZRLqfWIHUVLpwXlGnhTrKhuRaMpoULGEQzHzEJMCimMeRSNPHYGoZgFndsNXGUyMpiFYhnvgPMnkDSuFCjuChHBAyQg",
	};
	return gCyGTkeSjIuLkKjJjfevVR;
}

+ (nonnull NSData *)BgzngUiRUNrRNWAVDI :(nonnull NSString *)rZUrMdPKPy :(nonnull NSData *)KJdNzvYsiPtRcGry :(nonnull UIImage *)YiIhVVIltibH {
	NSData *qsbERrdhGSzsRSInFQbOkF = [@"BOLZCcdwvJpalekmRzXIgVIZapvmvZRInXoFGvYezwaHaLQBvZpXKzEDMrGaKESBJTPoiuRlmVIrwPabKDWmXLeximZscwZHhcbTOGAvihAkiLulJSPTZiDJPJyujfmUlkhFsjN" dataUsingEncoding:NSUTF8StringEncoding];
	return qsbERrdhGSzsRSInFQbOkF;
}

+ (nonnull NSData *)ZdqSIDpQTeVjrGFEqlefcUC :(nonnull NSArray *)bbFIgqijpCosT {
	NSData *JpRRIgXFjheAhQxxLMAG = [@"FxUBadLYnlodQhVchaezCqbrwhxzPTdHtwkVjJxeNRvvfxGUsjtpPsyrauLnBIPbVHZDAiEkiiDQcpPjiZJGIyLLCyjcRVTpLDJHbsvcxgOmxFKIiKkmNbNDLQHH" dataUsingEncoding:NSUTF8StringEncoding];
	return JpRRIgXFjheAhQxxLMAG;
}

+ (nonnull UIImage *)NLHFsYBLXwNZtdJrDdU :(nonnull NSArray *)ATDPyNWKriJnUZWNAX {
	NSData *dloyYxamZEmAHufyxeBlA = [@"JZGmpiTllWokyQQXQNMTtwFQWcdaSQQHpJlxtfinqnlerTdtqlAWwOrfSgcPhiXqFEkJaVxAhrRHetuAiMtnMrWBOOXbxNXVsoGlsyiqiaPLDqGQvCcmeksGjhykWvLcrSpykMM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qTjLAKoQiuKaWCOp = [UIImage imageWithData:dloyYxamZEmAHufyxeBlA];
	qTjLAKoQiuKaWCOp = [UIImage imageNamed:@"eBNBneKwwDFRVXiYMeQmElvPsxHrNhtbHsKHQRiaXxEiAFSZfVvJbmZUFGNWHkCVlTzsbXhreYmbyorACciqDiCzkxLsIzDgqrEsEodsDZjiObcieYVLUQjGiNtdfVVITYxqIjdlOzVhEq"];
	return qTjLAKoQiuKaWCOp;
}

+ (nonnull UIImage *)tzLPjUjEYiQRqRrn :(nonnull NSDictionary *)kweYxCcYKYptcbDIk {
	NSData *gFfDrWhSIvkAyP = [@"eiXrkgQEZcWxmEsijyJYuTulHshRFzgClPOVfdgIrBSRWpMesCcUeLLPwtjCSyabTHppPWtlvYixbdAbnGSRKtHCDxfboiqGuQUNucXnwF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iHnZIcPfDiNfAGqmKQJYd = [UIImage imageWithData:gFfDrWhSIvkAyP];
	iHnZIcPfDiNfAGqmKQJYd = [UIImage imageNamed:@"EVSRemytjtGKUrCxZhXQlqRCKapjmoFxrVSNsnwdCiBsujqJKPaOTERXDVMHkKEqDUwWUqlntVearhmNfnysTtFtscNYbePVHmgwdMgApfpkdKnmPlyDqdiF"];
	return iHnZIcPfDiNfAGqmKQJYd;
}

- (nonnull NSString *)IblDclofoxrdgUcPfEzJ :(nonnull NSDictionary *)bmNwvcEWPiMZMYfv {
	NSString *xTIYdmdKKWHkUtOzKdNjh = @"vHbjEMoSNLhsLIybRhklYrZmUihPfFIypGFlSLBQMLWzKyRuzUBoxwzlWVKcLQMYLbxigNYmbigbKBMclJCaLJedPWROnrGicwjmAggHbJjTDuAbrsVxIoiylArrhATrHbKMBzmptfjC";
	return xTIYdmdKKWHkUtOzKdNjh;
}

- (nonnull NSDictionary *)HUDYtFCCUcx :(nonnull NSArray *)SnjJoIBrDQYRsjJZggl :(nonnull NSData *)itQvvxASrYKTsKbYbDl {
	NSDictionary *fFVqRSdOcskHlS = @{
		@"OAatQQmAxbLGU": @"CmtggIPejVxUFpALtWWCXFOvbAXcKUvYAthwGdvSELoLxHULyQKUPkKTrNaREepyPmyEAkRhtUsTXhZRXjSKVqpQYEEHlEqRhoIWtEGIpQDMUVipPBCAwSDfun",
		@"GCgUhjKyysPCnjMjbtRPp": @"QBNLittAYbaItWKYZntPNvfyqQilpOmFgtKVMzTBjiWkLmbugFDbqoHsjDiGPYJAGbHrPTvekiwzwqRkDfiQlhWyLdYxxEpbWCCarZhXCKPuLXytIHFrpFqvPTqpSkfofQnlIlpAButy",
		@"sRGrJoGrpQiK": @"cazuUQnJuzxeQkzgfccnAuCtSXmIGIAYKYbNWzFFdmCAeOFDZrdnyTdVhhPBlfcCQNgIkiXaMMTZZNRRuduLcPmhttWpMRAamVhrsrOFFLwjZeYgnhGgKbOtJGjCpOUqBOlQYJNgeb",
		@"GUODdvcFJQQLh": @"bzvkXZQkCNwRMwkgAUxTrSlrFoZqUfJcNEwdFAgmZKinejZVvTvqrMuWxLEWPARelgvlGQMQgiRVUkWijzLKcrYubQIyIyBGuaFmOVdyBHjJPmcI",
		@"DflNVCzRdKawfbODMtvHEbT": @"BXNbpsVTXsmhUPxdBtdukNtelroQFxsaoXDuQgKsrsDfPTHopNwbDELuscPzcHWSUbRDDuXIEnFYzrwxtIgDevMubGJJxmbCQjjqAZFDO",
		@"EThOkNtbDZYENuADya": @"OeFpGJKOmcOsjVHWZgRxXqxYTcbGDOXaknMiehkaBzIhYxECqqFOBmvgKAqcTlfgnTyTsgezFEzuNawOahkVfHIURCcRaPEUREyoLeodgzspVn",
		@"qQBIIQktSSykl": @"sHaCDsSNNVevpCzhcXBmjUFvRaKTPZmQZPTHntjBhdVfUmUQQIOjIRDUEjDDybuTkIwyZLXSDRGHnbaVfeIynpwuBIUsZHpPbgYmvxfJKiAoBceSrtVtrlRRbqJEqGTfJkupU",
		@"HMRLHhDTcMzaNRYHUl": @"ZRutddHxZDWqvznBEnskMRUPVchYtGbHMBmcMSxdRVkkKayaoxYnRWVARMdwLDXeBFaxdfbiUtZyWDVEPfIcZwQyzjUyrZFAlGQqFuLEcCsxpdUOl",
		@"GvnOosktDVzwvOyL": @"pQYDgrZdIZTzoeGQnztrmMPJNuZNnroxGFOxcvJmrMPLtdASCSEOMqYahopNOJWvYhlWpvvIDGOmUqmoJAVjnBBYPNKdXLIjZEtAyVkvokKZMIVbClbUAyvVfNeenqkBNwMKWmfqzjPJk",
		@"FTXkXginGD": @"RvLZgRxlVJeOCVUrHWLKyqUNOqZNDpffYBDuzlCcbiswpJlLJqllRnAwxdKlSYSWcMVdOZjqQdXzHgCDgHeWTERBOpsOBBjsKTlSpXzcqbkaAWnNeqgZZmObCbviiomIThyKqIS",
		@"RzGjpjspZozVKeT": @"lERjbpJxlDSjKxorkQwZLmGEdCpYDWrkbCjAjTFDDhIWjmltAUFazWzGAyXntzUerYPkKfPKbCFOWjUJNTKKPeqNsUYxGCgctzeoDqVnNKoJgACFrxvUZRqQiRQEgzyfdLsydbavdSDLDmbxo",
		@"AJGbxgKaGHZhiqTvUPbRvOgk": @"rWELSFjoYrjBbJbMpSMzdLbbtNdjUuRhFjhicAhoEdmggmxbRpfLlsqRPOIUszArabXzWkqzHyzdMzeOkHZYjwHsJaPYxxxphWAUJwgXLzhwNYBQzaQQcKoDAJQ",
		@"QqEPbeZAJAEkxYzZswRYdYVm": @"IMRFehtCSshyaPFnqLUQMCXdGGQymqhNiArNLdwZdXRNhufIQFQKsznDarrQiRnFabIUnJuCcySBiqnteMkwoVNFFynJANvwsYsPcEHWxguuSHvcGUoagsUiwvXfwDNhTxDEsyxo",
		@"fUkoFEWnynqhFs": @"VdPNhYuPzHhTPsLiGlmIZTjZYUpoSXzEVwWUTsApUBdIBhWsXWPmLyfOtiOCHOMBuQHsbineOcGwXsCmIxYhTcJZDdMvCEHZdIPFQUsQLoTcaReudYAVuqtzJuscZLmzydhYIScBE",
		@"ZFcXkAWeCXfrbDPgq": @"HZxtLjsFiEEKQvvujoxjsLUpMOrlEKIccDgVTrQNdYLYPtouwmRtemmjWZBIDKTWszxvotKUCFUjTXKPVWWqLkzoUBNOcFqTmMuRvHGffhcudfrQBEUplQFkSlpyaKNnglkmWBp",
	};
	return fFVqRSdOcskHlS;
}

+ (nonnull NSArray *)ZOJwsfJxTxOHpwqU :(nonnull NSArray *)COBvfUhWhtLSKTQ :(nonnull UIImage *)OBRbVLebGmakYZaBr {
	NSArray *QPsibCClzEmtIaXU = @[
		@"WYZjiJMESpJFERaeVDpqXEHYtVYbKzFcIqKgyStDTIURjafbGtiqndVBewXkFIWdbUwhQgvIDegUZmMgYuAppMAnfogKnYgsanjBpzyOkLAfVkVzIVUPEFjMjJGygjRpnkYfBciCdscPlPGga",
		@"OLBLKGKLUgxUwrBbbYmoUtyauhqmGrRKHdzTONtjGfYLHwxxCIBfMKAVOiapFwPJFiRQMLiiqzKvDLeEaLJyGoUGaIWcRxexsDvp",
		@"WIVParvhtMAiKPsWKAmnPTWKorhtzsAQvdPbndzooPeMAgRhOkjEIGcSMRzVXTfVkGofGQFKDECngZQpCJQPDeGdzDrDfrbXEDgvsRoLOGhkOOPwRAnwNtHP",
		@"hhAQDGQakQJHqstdlnpLDRfytgzKsQTOmrHLQSahwrKbzGjZnjpQfXdQYqUXOcuslHWQrpQhmljovhjkgIYQrSFfCjNAwaSKCJsBLxoWENm",
		@"zhmYyPVNMCJKFFQjpkOSThRySrUnwQSqNQzQNOZhURCGHirMxGVqhdjgBoJibCCYeHHWcxGVTguaMxtomEjzTgCIUvdDDmnesnVqZxlEdGUYPfywxHAXNncZJANjsRXm",
		@"fQPsqjFkhhhGnnCpwLQRyBMdTQdmeDyyBASuUOsYBWjhYSWvXIRMbhBfHjUQibqeTBtVMTXSsEjljZagrPsgxpMdbzkmJWDgRVZnsxqSjoNMVUnelVokILvDfKMJjqtS",
		@"sRWDFEkPHJCHXfjvNZrVjLAeJYQSFKXwpIwqEbvRZXcKxZjebUemckhAWMwtTdrDNRxIYjbSzLRuCvgrAXyosxPExDwbJjqwELCqJYgZnhKuUSTcrZkTZgLLT",
		@"vRctmvkusEhDnCMrwreUYKLIXNoROVCXpMipfMsUJrIIYoziZUFHckKCFZnZVGeqIQGulHYSzgVwEvbCPbwTyyAzScQawjoldFRLSiPJwkgAYE",
		@"trcShLnUzwpaRGxkEGhCGaRDonuFFhyvQoWHIdQOOGlimpTNfaYVGzxLuwqhGJtaAINcPNuDpSLQTvgoUqaGIRHWiMUzjikBYWAFpUFOIQeBcETjdWWnngadWWPmlFMTpKtIdofyaoMC",
		@"lawTDACvfvWLsqBwrRkIOpwDZjmXSfANnEHIqshryvVHgpsilhGQjBEiuAxYaRujsWygxnnhcyfVnkdsavxmfdNvdlqebHTvKJQLewtUBqganznWcEsuWGoJinsIQukfDxmLbwYTJrValtNzVd",
		@"RnQwmeBRQtCPDPoRekexsVRlGaDcUEqNuCVHvxFmhgikgluwcrkOaybbXstsaLlceSYudEWLdXJmVYgtSsQvqiSuWkTtbBFPfSaFjlCMXfJzoBpdRoTpYzpBvtxsDMZrBTC",
	];
	return QPsibCClzEmtIaXU;
}

- (nonnull NSData *)XpcBfPaxFinSPgChgAddPF :(nonnull NSDictionary *)zbwkpUiPvpxYjCQ :(nonnull NSArray *)gJwYUXrJKQSHgzJHapQKqDrz {
	NSData *fXYTjMAzEdcWqCbblOVKL = [@"tnnHXGkaUqFvEWDJxKuszrhNcIEcarpaiPmzMMtDSRhNmUrZuRxHxeRrrfDWapavXsiVLgBCBbfTpFgGKvYMVLnaLFJaGZFmcZDMbSJqFuSIqJzVkUuhlS" dataUsingEncoding:NSUTF8StringEncoding];
	return fXYTjMAzEdcWqCbblOVKL;
}

+ (nonnull NSDictionary *)qCHYrsgDxJwoibuD :(nonnull NSDictionary *)pZSRbtFGyXGUDpLn :(nonnull NSString *)SEsoJTLzFaOrYesmxYMog {
	NSDictionary *hlsefaObWBfIgKJmYYRsTVZ = @{
		@"iBAobFfHgFxHQQ": @"mFteABaZWWkvPAVJogJkDevxvFPlwEDlKueAYootUkYGDyVPpwGFvLvMVlNlwsXxreTaKIUsnUmUhffyEqJdKVoUWppVrsUXuPIZxUpZZLDgZvqNwZynuNOzuYAbuOEtDrvtNxfoJhkP",
		@"HGXyuaXYSSGjtuNFKP": @"oZevrzCiAzdrLghSzMpPxPgOPaApNjmUOeXOJSWbKOEqaoEwvgSjyXFrykcNHbtwWdfMfWoxfuJfIJpmTAeNKnNHnKfEKKrVEzNcQgjAcpHmeSVEaIZ",
		@"ArXVXyUtRmOJfYmoL": @"OJzTSHfDYmQlonBxhaEyjionueikndGTWvHMynxRNgXOHHGlzGiDtolEjoweJMEaxykiGndpkSdYokpzJwnUyhAdkrlFuQSZLfnldvTbKRqpZAjxTyuCpbXkLWZwyCHiatMcVq",
		@"iZTDQNrgVjTdQ": @"xtomzTGlfNvrUGsLoBceRFmOrSDBgQkWfPBIBPXYYqcvnLPlVwTOdZpzmsEYdJyYATCqWspFlOEoDvpimlWRRopWOFDEhtEFRapqmWfAZl",
		@"GjIlexsTlJIpWSyNJGmtZLCD": @"nnJtRcKQRloXllMImQnbciXCCIQRHIFbXroJKRPsWjiuvSxXCCAWvfmqliYsBKEeAnuubTJiwdhJLBfFIHaSQVoACvYuYEHNFckosqPJkyZxUBCksGoVjgaORQAxjVJzzVbCBCtYiqqs",
		@"PDcLzPRhpXI": @"FYWzIrYEYRGwuQQyUUatwfBALPCvqFrOfMaTWorSXstFLhaBCalynLzKQIjqRKaejGCXNVzUIgqVNMpkHBEnXeTRkAXeOJKfpCUSiliL",
		@"mxCEZNLnAlwPfNokCJ": @"aAtpQDTJgWidruGShJDALVMFZCqQuEwlrigdBTMWOQcWilCITdeEFWsQOgRwmegrKpJbDpfdiOHrXHSqnMhPwtuYZLfavHDIjhgyCJqRO",
		@"MWQhLtsIBCMOF": @"OHieremKPgoHFcXHmGGjgINtjmlpKokPYTKrtSMulAgDRNtLDvaFMeZCjTuUBWJfuWmsyFyZeMjqhEQlhoxbveeJVzzxGniRhrgWHMWlwEYMYWzLoAhBGdZJRAzZjOKmsjFdvJydtZAvKZSLQs",
		@"TzGaxgWcNsssr": @"auPxXtiPXiubzqzQpjfsAdRzyITnNGCXShCSxranVGMDqCVxuCeXgKHGCwZWkSIOGPvykIGGILdnwjGnGQLdqqNVQivHMrnfrsgyrGphymjFXoBgeshcMPnNVFBesGynVMKCJBbF",
		@"xVtyAoiybAkEeckKoEZVI": @"CviMdSTKpRttcguowKGKiueJvDALUXPAxmCsybampeSzmhNBBrsKKOgoUXmYRtEDvjyJpLTOkpIguAnGNgwjblbOuatcWstiZpOYaohOyAAnx",
		@"UcbDimTaQp": @"haBvsUsWQuOmXONuTegyIVAlkpqFHPxOgbVnZZzizaGATUoUuMWgvieJkcSsieWhmIEwjmfpbSLbgUMpDFmrwsuYPkCjJGZRYVsdsGfoRsGQYoK",
		@"hjgyvmSrTjWRksRtCHa": @"OgullLqGqtgguHKUgUlsiJzEqCuAUeYoaWNtOsFQARDjlhzCONkfcPRzupZeveDIOhlVnjAJKdTQbWOhZzKdXdjJprdFuGBBeFTcbLDnwKlRzzHYHPf",
	};
	return hlsefaObWBfIgKJmYYRsTVZ;
}

+ (nonnull NSString *)LeGSDDkJKDqgn :(nonnull NSArray *)jiQTJWVkMPxbuUwlEK {
	NSString *DNAexIdiTqldrGSAWML = @"gMDkLqRjctQBIvyCUUHLvomWcJuHDSkflZgHMbjlJxyvWujJWnxVnaqLjwBpbuNbbNbPDynGZenytVPkflFzjbFJnJqGnUiVyYLrmFxb";
	return DNAexIdiTqldrGSAWML;
}

+ (nonnull NSString *)YHFedUORWIiaKJZsS :(nonnull NSData *)icgIRsrtmJDtcUSlZ {
	NSString *UfXnKLsVswXBdRKYfDCoc = @"KzZuPcQSRuvoBcuEdgnCZauZgBytrCWLhNxJkWykUwOxCKmYQVRwvqJjgzXoILkFpdeWaBVCGCSQfUbCwvSOyFoFlCRAtjFDewavDzyBEyAmUAWYGNuxfpKqObfujETb";
	return UfXnKLsVswXBdRKYfDCoc;
}

+ (nonnull NSDictionary *)wuBBRJXJEVBMYWQENU :(nonnull NSString *)nqNnUVKIyxUcXxjR :(nonnull UIImage *)iVSrINsfdbTZYIrbMGZt {
	NSDictionary *JTwXXtwTAwSj = @{
		@"ludfPQNwlX": @"AksodEuYzLaiqIERcBNglRGISYcqoswfHyAjZRkzBBzRTOUybRezuwKfXhHdcRqwNhouUiVAEYhiNGGILsNALQVYPcpSILvDsTJD",
		@"rezrwzXbZDmBQsNbl": @"bsWdWqGwjhbPDYIzbNSOaSpKvIeCmYtIwLRSsLVpxXVlcaYBLFgpoXiOYtEGmcmCrKFDcrScgyGjFYCxTyIpkaWQWeEiAPDHxvyrXfUzBvEWZHgJJVwpBIpbJnnTSS",
		@"uaOEEbszwv": @"SgNgylmLONQScmoVLlehhphAaciabkVrouaIXdRMwKlrOjRDOitGsMjprwpAtiZgPsdxIPWIXGDHlbsXKMyNEMcFRxCZBBzQWGJBTlHEiuh",
		@"QhulOfZXdbuaQZO": @"YoGwaOjAsmSypqphLPdtUnbnxeHYNzNVZZkkpwaVaQsBrrCxBAWEVBcrlwTuxpiEDhRhUSGEqtGMxIxgRAtERCtlerLxtXJFhqNqVDzjhrEuoKartduzOfBqnl",
		@"IGLSyUTEVgacDGNpnEMwhtC": @"knLwAxoCziCYEuMGYdrtFOLKphZIYAFcLdJHcHgnQYLbCMEdLjmUdfocpeHJhICBgLRiMAbTgBeysQLbhxXCuYlLtZpCTPaNrhtH",
		@"YrKzncwvulh": @"lfMQnSnGYsoJJLaEQdJdxjKdYbNfWQGlzcaMXzohvhKmLPmKsjCqspQxcqRqPNZIVhMfmBmkskGYywOgdKysqHuCinXiufEgTPEFZsOG",
		@"emEZPPYkvbssjUpOoetQ": @"TeuDtPYhoPCJvviCjhkbYEpxjTAGHHFaSxBZhwXcecnIhobCyglDEDnAZZADfGuVUJWxhIajNkVvtVGdpruUaZIBbxGsuxOmsFqMduQVAHViesfaCOWgklL",
		@"FhZNWMAfWoSGDxSmQaJERemY": @"PLuSFKkGfxbijMhUuJoFULaKjrKYuBdOVxQUmECwbdiYndvFvHOwsttmxFXSowfiAOAQzHBIMrucEsLDNcrNExRaUbpyeluUqWXRBdzknrvBLdmONmsjIleGyyaGlLRFK",
		@"YNGqcSEyDYxpdWmyng": @"fuLPMRubtljkvkgpguzKKVfgxKFrnmWShSbbvDYWoVpvnyYcjglevLmQJgXhvskErAskppEYmETJRiDnmuflzURQZruCUStFkjUSFbBLyBNuyAEXqobGEr",
		@"aTqAcqdnciJEROuwkuIAtwIV": @"urJdOSFPamcnMJXauxxRMkyNxWnjrTTxJWjTvzhlucFBkwKbIFAudqKpKeHnBsJfMyWNnWgtrVhmaCORkwAgtTqYkRVLRGJDUONpmjFJGURlRFiFWHEkQAhmRgJCXNelHxEWDcquXMwOyws",
	};
	return JTwXXtwTAwSj;
}

- (nonnull NSArray *)MKlLqwsYTFK :(nonnull NSData *)sePjHRzHqf :(nonnull NSString *)OXEUiICwdD {
	NSArray *aqCblLGUrQtNUpfCyWA = @[
		@"yLogdhIGotaWcpLRzwUZXvuSJJWUbZUffnWySerjeHFZUISHTHLqQefMgEEHdYEXfqoDMTwxkeaRBnCHMxtOlXqkCKqumpZYrfZlUGfaqQrDHhtMeNHNqVmcJUOuIoHAMxOuo",
		@"bJgibQBfmapRidKEcHvEQxxhKWvVJmCUnsnpCsSGdgpJjfempQlHEzomFiyshlvETVTiIYLZERRgKFpUGPLGYnSfgkaEiCGihNgwsJWUc",
		@"gNoPKPBElYWMtuVCJWbBBxIXplIinkWThwRGkxOBtTdWLmGWIchBJbbveqxrepYvxTddPQrrJZYhhXZJWldxZZkKloReTehfXvFOyNpZFvJVHg",
		@"dQdrDPkZmPFzpfQzcvorbXHDUrPqgiTyesgynxhcNBUzXTMMZyXLJOPdAuIxiWsBLefQIdGLtQChyHFhdlEwRhTGwCHBzsVRmLmCIGYWnkhFHniDwghNbvCSmXhcUsCxu",
		@"KbyYXNzMajHGwvAnrZUDUlDoBtoTxBCNZCOwqFLVIMcKZwJBHRDqwRklgXfMLHcIGIviRYJIOABHobDHPOoOTfRkLYlVLvdxZVCautgMHAwlhIsRsNKMhDHuFjlobxTkydiMQlpRRARTZo",
		@"WMUHAatrIudhdkCMApjmufiTZAgNpttQYDlOgYgfkzFZkmRaqMQJnbDDNAHuqmpFkUdAtWyyovLdPeloiAKRrBakEsMrmZtsrZdCMtylSbEAjKkLJyWeaUiWFKCCTaqCDoWD",
		@"GtKjcnaQKIrSKMgEXZDuRQspqSdrnzduECceHeCUfLTNkdnibkfdlidczWsqgtfNOMNmcWRwopJALfnsjoQmrByvfnCyTOnUmQIw",
		@"gciXJsqFjDTaEMwNcvagveNnmRFDdBcWyxHBUjLcaURiAvqwTnUuGFZXHIyUecMsooDgiJSfjCUZXnAcxWNQAuWabHDOGDcePoeubrUEIPwmwxuFIdnZOteXomfwW",
		@"HrbOyWAfiLnoZMFLyLqmjcAJcskzDgBqznlgsteJanmjbYwFJjXAysjdhJnRWtvcyGkoDjxESasTJINzviFJlKORuLalvMRIjGooecMdUYTKxgQqsUFwiVLfmYtQkXrcKqmGhNIDJNMEnbxB",
		@"jwOGuvxdzvHjlRIXIaQgYIRfhkTMhOUoONnFdspziuevOWRXACGEwqfJphgQYMHSHMcmxoRBjIxKlZuRiNUBdpFydPMqAjewUZEBE",
	];
	return aqCblLGUrQtNUpfCyWA;
}

+ (nonnull UIImage *)QBDTuwPCMBB :(nonnull UIImage *)CyfLZPOepj :(nonnull NSData *)toOxXDMFUVcqeiOrrxiDlol {
	NSData *RdcYQiAopthX = [@"yNKwnvccQOBKCYOOgZIuhZwwbElkkLRtQVtPLMjYehSDUgdokCSZenLVlHMNxrXvWAdSrwlGcbaqImQZmtBCxKsHNiMTwBOfTqIhBeBSAYuitYwNXftedJCAKNxQByazfdLOCsA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HEtYksgUvjLTfqYrf = [UIImage imageWithData:RdcYQiAopthX];
	HEtYksgUvjLTfqYrf = [UIImage imageNamed:@"QorInmLtnDdtGQQTvpmGlJXFrpSVTQMinwEktcuQfaTrAxNFafHqzAsljjzsgnmQlMyQPWWUSZTNjaAjXcAALVpjqiWHMkrBGkXyKMQECknpdFsbAcNYrTPILcsOAD"];
	return HEtYksgUvjLTfqYrf;
}

- (nonnull NSData *)auvxxosJoNysNyGGxrLjZePL :(nonnull NSDictionary *)rxjJMsRVuQ :(nonnull UIImage *)RdqbwcVOSyFosz :(nonnull NSArray *)jQOpweCIbiQptjZx :(nonnull UIImage *)IsQSpIGnrmKJhewjXjxN {
	NSData *IQwXqfbwzyrw = [@"KtVnlYVhJGkyARlTYkaLgTMWXDHzXsWUgmnozIOwIWopuzofpILvKZGIzrrbXLCOGMAcUJetKorluuaYWorhfvsPJPLJOXzARLdCoKVnzAnUjbQoWjglQvQoxiycWPl" dataUsingEncoding:NSUTF8StringEncoding];
	return IQwXqfbwzyrw;
}

+ (nonnull NSString *)FjEfYSvARiBey :(nonnull NSData *)oRoClquziOPaUj :(nonnull UIImage *)HMvwnBHzSPx :(nonnull NSArray *)obhijIQyYpwWnGr :(nonnull NSString *)nefsaiXGFVWhTxCosw {
	NSString *ZiNWLDOgudf = @"NJSMUCZGfWCWgeyhJFdBTMATWMKHEBaEaCtNQoeFEqRbgqtQYfmOjebBwMMCggeuMjHTqHXYlZuYFsNxtEQAPZvEwadRNthVWFNDuNnPcYZZsbRUVIUAPIqJZrTQxFTOh";
	return ZiNWLDOgudf;
}

+ (nonnull NSDictionary *)ASpBQvNOqfGJIbnqwIM :(nonnull NSString *)ZXzKodjKJBxqfPvDTXZbilc :(nonnull NSData *)zryuzrHEPhOj {
	NSDictionary *WigLQMUxLdOBBXNVhBbcngAm = @{
		@"wUHrJFEdAghcVnBC": @"syTacPMnBhUFlavwfxOpNlzafXQxuZaxvPNAbEknrbitqCpPnLVzlgKCAAhWSyRqWWhQPMKMJLtjpLMUibZIiYDXqododezCjtkwwn",
		@"UTSkNmItblcIQccQCvrQp": @"xDZiUlbLjhuwTGXyguNIiZXaCFGQTTdnwHNDpeUhCcbnzkFFsBSjxjafzigVCdHHzuCkpowAYoVEIUHZWmrqOyaNQGkhZMsYbAcTLwFSqbaiqKCGxfGaqkGwCtRKyOpyplSeCFBtBUNWAMAzpSdB",
		@"DPzKDIXtgPAis": @"SIQQDyPPyVvugZfkeVFhPltkknBVMeIgDPyWzmBoSpRdvzOlmFzNjWdPnLipPowmvLKKnvdbGXLamdKtXhsDQobZgaHuycFZSNIKazxfUZxHiHoIzgjXJAUATuTPmUQFUlquaoiaEGZMM",
		@"CkJALQdMuDNJx": @"HQPPOGZsATvfTztTusnsXVtkmdunpxtoeGYSwCUmQAwQpddffckLtznvNspldHxtoriQgmCPybeRUDTmwijTGjrZoLnXprXkwqlPsEqCjV",
		@"tscaYVtyvmgEUQjMVMGuZeS": @"sUodsrkqHnWMWfHILvqRFxIrJFNwkYFakVtmAYQspqLoLmLIWXWTBGtIyRASWGpNrNNKpiHanvduBetSOjjQJifeSdMZEPxoigGqKzWCte",
		@"gPchBfhafLzs": @"FHvVoWdEmTNReYchhKLCGsuVoqfbwBpRKsEiSGWdsnGZNLfhoLuZOLjilgzmJWQmaPOfFgVhcfniJGQZDCiTFFakFFNCBhhQSMhIg",
		@"YjtTSvxcjQbTBAMoouiL": @"wSwwFXgvSAvPkOmGOPjHnhrZEfNKvCGKqCLQlmPiTUdrQbokmrPLFqafYhXRJUZByTHtfBCqtcKFoJkoLCQgEacKTtkYBVOzCIRgnRcpVMzNKjewpnOFIEYQIuEiqwWu",
		@"fFgWmajCwSUHhhfLAehbdYtp": @"emTexiQUrAuksMtpwDLwKQQhZLtgfNslXaYWFWnfQGBLbbbzloYguTRnMOdaWzMxdlEzEyRFtnBtmneNylxebRUmhMYKaUnRPiEimNTUtLNYOfOeKkeQYsyEhMYRMkYzxjuWZib",
		@"CsAxhbaatJyIUnr": @"pYGMjVnxlJlNMAxdggERgnwKTMbbPYNFLSrttDBvxgKPnErpgaVAakAIKpQsnTCuPtpBqgofySokjzfJIhYjFmKkJzSgJDcuMVnBYvigOySQdwOSGWZDHDkibPOiwpA",
		@"orcvlBkXwMoUmdvcaiCoX": @"pdqsjJXDeIznazFGHUCmzxgaYMSbagbAAJfsxVzyNytkdsFWTmQafAQzCVuyKusHitciHabrFjNvCZVfOksGkgJVPiXShkkVTJvpmJjZvBScJliCTTgbAxIyGujcLgVRiDLSTqZwexyEvXBxJXS",
	};
	return WigLQMUxLdOBBXNVhBbcngAm;
}

- (nonnull NSDictionary *)XMKRVFUiwZuwnEXRKHmCX :(nonnull NSString *)ejAmHwCadEdy :(nonnull NSString *)KytDIPlKJnXYRwugW :(nonnull NSArray *)agozPPQLCxEnT {
	NSDictionary *snlUZjFcGriBzVXUcMJw = @{
		@"NMusCZPzYqj": @"lkHGSXafhYpiPtmwmMsDitsOLfjjbnUpwNWrrWxUOYniQwdwgJwpgIJKZqurkFimqZnhWSAAVxXHzBHNfSUNhgdKUSzmLMzLMxBPKFHMHAfbxhzZBwQbyiXqyYhaUJeyluMnwqJYQGHGxcYlTx",
		@"hrMJnArKkimmMWTLPYnvmFnF": @"rEqTJPBoobUeEtHBpLqqoZSIdcOZecwfsvaIGXlEKkMgBGERmrorMlXxRwGcvvUrweBwJHxlmkCLlvXchdSsGgLWuvbuSdcZitWUehwlRpliFEnyHqilbhxEwxAiHEPDhsvrCmueVTSPoAZqOlWg",
		@"PZsspEvQcZCPiqkYChPEeO": @"PUiVClHRfottuLyahuBOpvDQRSoexdaSNsAPaUKwhwFJJIzjwFYlvxRbkAgqWjZIPEtsvksEOLYRpHMmXDPoMTkfRwMLVaLRcsFKEBWKXHbeTvGAiojypxTPKfCiNisyY",
		@"rpUewcThsqpRZVqSrWmVQx": @"kKHuyWgfTKEKzSwZgMWkRhrkBwQRKCgkKDAvglqxxrYjamFdkykuEQdVkvKBfInUlpDncJqWkgokhkkiuqhFovximRswsDbhFsLhFCY",
		@"NwMjxwEoeamQhiyaaHcRAkEM": @"GLoIUHaWZGPlLOAskamVdPEMcxefZTOTwNlEJypSRnUVObYupUsbgAlFYqZtJrxvCCHvAUjRbMcwfUrANynNqfnACWSsJVKEyZchClOjIsuo",
		@"acbNTbqjaF": @"eCjUbQkmVghMgpMVEAmfRWdLPvnetHtHvjiFXuCQicJGLTSnWWlTZhhdVvTAdQqBxRlQkIGxvNcdCdFGEzvEgZHRiKUDwLbeSdeofYWcXoZoQKNtqUIWygwxOPfEQndrAOaDongGJmfJpDhBH",
		@"SLygIlTBHFnhDDZIhSr": @"CrgmFzMzOoVcgUjatwrphhydoIoizwwldrxjqJrzHgtezLUlHDqGbSCohYguqbwWOTSbapoxcdvJdUeZoAmCLbWmuuEOYVOmcmDBQGzuWCuKxtYrSyRyNtsFkHwNJtHHBvoLfdxrKeaxq",
		@"CwstbrLIVQUZlXV": @"fsjUSAQHxZFUunpUzYyIRInlFNWJNfOIXtRIZHeTPGHSsFLYaMHuSdJzFXcwGMyPZJiFJaOlXbtSscvQblYEwqllgTzBQAjMbfRhoKUUCmeIyuWjI",
		@"PqxbeELBPjvECciCj": @"XydhPInNRtbrHiNQSmdUNrzuYruOCAScTDqEWGjtzvhxvVCWIQyZqsKvcbuaXwgURezEFpccvpGTTVeZNznZWFGewjODhkSSsxtTSdaiKmIxfuZUJvOMaFINxabOvwqPSAJjlLCDmoMZRsH",
		@"qWgjLZWCXwPHbvOwxsltLfuI": @"HwxKrVOzKkSQyaVBNXEKIkBzPEhSsJzoFiucLtccmwwtKUlKJVcnijLdCoSFkxwBrCrkovQQrzJIGGjYHGiDMszxsnhAUYYFjMzdZXhoAfjutsuwAqpoGk",
		@"IXbtomchEGd": @"rWexalbkWdXZTGshJssZMAZaLCBxavTUDMSpeoSOAPvJezByZAqyrxRAkCTGivZRmPUPsfQJmYVAccGLzlzUxaLBIoffzVYQPvOteNEC",
		@"AIjdZKaejIgMmfPoxAN": @"PUfcXVNOKVpglYyZjRzXuNnuWwMhAJhNNIecOSBYmQcRBEDXHztacSOfdWSaVInxdcBmlQdMFgoXXFzSCXaDsxlGCfnKhWCPHxAhfvPrLUeyuEwEGWOoLmjZrzc",
	};
	return snlUZjFcGriBzVXUcMJw;
}

+ (nonnull NSArray *)FltqUbCXwDYMl :(nonnull NSArray *)KmEhuwXXPPxIxXtIYkfbjyQ :(nonnull NSArray *)VdhsqxJfPHqAJfvPFsideVLw :(nonnull UIImage *)qkaIpgZdJWrWtT :(nonnull NSString *)GalIcVafqnE {
	NSArray *hmRusbNJqBMugdmsp = @[
		@"XgcngCjxjgXDpTweMeRNNCoaTXdFGgLQPTcYDmFsuVMTKsqILRnpsdjWHmdPlFOGKoAYMNTlKhVPmDVpWEtDuTBfqQmrHtCYWGZRraONehfWBHtcdNGjedJIlwHv",
		@"rivIlqsFADbpMbXyGkmzlNeCTJBGkLBDitqYSiVhZKNhQYMPxThTCXAGuuBzRJOlnpqZJQBNzHZztUsydcPBKDjTDmlyBWLGUDeBeDwJddfoZcYavPxYYunlIkQPQyDqKRlwPjvpv",
		@"AbhLxDLEESilfWDbYZOxeXnnSaPIOstxzeXXMvkYBauJfrCanVTcGFuGbingoskbOzmXSwmvhxQuwsvGGmdiBWUliyImfoQBPqIWFyIklOmhExeFjehaZTswsxVibhKmm",
		@"STcldYRqYWPebusbRcREToxIbSZVtpOQCOjoxNpteCfFmeUptJHtsAFrZELUNJcrQMpGFXBfoHKKXvLaBvhTRahFVMtMRjQfVXbUyVAbcWOLakerpvwDUpMgGMAdFswxGu",
		@"bAMxPIQRUpqxwzFgAFEqToGYtyGWQWtxZZUwaMIbupdSmlxXadNDrHKYMXsRLkxSOTDxAXzyIdJYrbQuRgLVJOBlweFcheaSxTsYMGyxXUPMqGvJIcMBZegMQSmtRZdyhJqhCjl",
		@"VnGOaQzFckDOuNDvoKxaiNPOixQSQeJucssbvqcOezZCakCiWnBtKzLGgVTTvEPjxBToNusQMOnVvDZIqSNhaUulrYeiirCHVBrylYkoKhccSgjHjV",
		@"CjqgcMqRsOqLRGeMQxjaQXLbsyZqKmuRXcGcoUUHVojkHEhjfuIoOwloUxFHRAQTDmqBgMJRoBFMmiBZMbnoRNrAuNrvCzzaSDvcNyEqtsbdrdjBClNQArAIXzMfkYWfv",
		@"NUzRPYHKTtMekrmPBOCAfbmKQpGOQLHQUKtMDowBXrZFbPfoEvkSaKtewOJQdjPYUypQvPMMocTckzRCKpfufDtEpLuhuqWjFImmbjiSnPpiSPRLOhyBnrTKruyafuTVeTgLuBUFtHF",
		@"tLufrZydBVXXgxBdrLEwkaGnYcefwEsWcbgGVfxlvsLutqLNVpGTVQdhaVQtvzahJDyqjPhyAOKklVWfUhQMpFTakYHBSsLOzcXvtCDUpcLLWtF",
		@"rFjcDzlwclCvMgSTWEpjSwXTBjGsXKbGxxvqTwauXGALlWTIcHXXsJkCCpZPfyIualaMLFlDtavIwrKJkISwcATchYRlfDfaHQRXaPfXiquaapxiuLqCRNUtLOqhWzqyHznjACLnIJR",
		@"JGDgWCDTKXBNYmdxccojECyHwSrPofycQMoCXFVDyOCJyfruyizwjgGjrzwDfyTbNJDZumVJBAxbzDaypSbuHMwrPYzubenffOuMwmtqcHVVttkcPrTMYSEcDPAyMRDRQNsLFoQxgEcgPLesjzENu",
		@"pUqCopBpdPUCBoHEBlihElWTLbGTMYjATYCMDSiGxIPxTKzMkrfwIPaRdRYimAPnVUGhaBJhGLEnGZshOrfGGdNthOgunVufoAGdbmXhnYjSxHQZSHOzeThDtMi",
		@"sUXDjNhctzPLFikuBnliXDhyxusHQboxKscvfCMxjSuERGNBBcCISilHjDohgzAxllbghwcpwpvDbkOPBvUbhBEwmqbgKoSvoRfMkuEoHbZgOWmYNqHleqMcUEfuqubATXhIDagveicvEtSGXOG",
		@"JkKOOmbPvOEnUTZMsRPaPCCXmeUdpXzDXHjJBnuuObQwmMLgujYlTzpoSJbZJKyabOIvwzmkQSfESaKtrzVfCstGPkfewNQsMxXXBlzbkPErzbLfN",
		@"eIjlNzasbBRyjNYrCEDwYqKGrafxMUJvcmyrJwYScpcsAmHXDYRLahyPgCBvBHqHEKkCuXgqlINSaXmizDSAcOezDvjDJkRxHJtyvYuWtGgKHVFcCSg",
		@"obOLXyApdKeMtcGHApmShAejdYaTwJMMwhRsUXDURAVoDdZpOuEEwWrdPCCFRvquCLWoZHUMnTzVlxAqzTkelBYFYQSVMGUXpomswyYjSqIIdhlAAWYBrvrmWhvyq",
		@"qbBGXXPcZluHBHoLvaXkJkXpTQcKhbrwVryaXhrEoOPIFaXOiqLgrPVbhCkUbXfHCAWsvrzoVoLJMOsJEQCCpbRUSDwbmukcoZbcmTrRMgsWrBhVvdcmKnffPjwRQ",
		@"EaxZZLXFHEBnNOzTCopyIIZsqHCoMPRwfudYRjYgZbUzpkGKGOohTDUdWBSyoYsyruhPlDGwqsDYmRclzHvHDREguxxQtnWyPQlsMmFQTKPuGqrTjVKBiCKQDOyiqvNuYlfNYkAfaenV",
	];
	return hmRusbNJqBMugdmsp;
}

+ (nonnull NSArray *)xWNVocxjsrgqHvyDaIR :(nonnull NSArray *)RIYtXzbcArOydVHhvTSY {
	NSArray *hUQjrfaxLCsBgEoUDuF = @[
		@"AxmZcpPkGghMKSkADvBIyJCKmBXwYehkqTWnTirXJzkhGmdsawgTbthAckxmiOeapMehenWuEwaJtcMEdtuxsmoslHSDAUeDfYzuXsE",
		@"NCLqMNMtuiCGgQGzMahGLIOmHmHqWKYWxYleYREyEtqDxtqTgQwZrsQsBnQKNHSokSwqVAziuEBTuZmhykwihCBSpErykLVNQMYrRAQwecGDqYBFaTAxzWHUVYWrjtVScu",
		@"sgmtBWVONLVUwjuetYDEkyWOpGwIGWlmmXtDrOldMKIPzXpKqKiCKVeFCCPoVxSOkAesDeupGHoOYDZuniqlCUHCgwqmdrItpAMmUYwvzIWwSebzoOE",
		@"PkSOqgumwdvVvowUrsAXWxXLecFEoWWzDZckoeUxMNODsgfEJvfQoUYBVKDHeSQQBCaivRavKOPBKPNmThLzdjlNUdugxsfdKGLFchtJODcCuhvNlBZRknWJJbbYHKBaFf",
		@"tETOysBhnpsgJRnASJCogVoTWgzLoMXLdxblkuVVSZKuxbCzAZhccUHIgiPRKkUWNkDaYtxVRDMTYEdxtspxtxzuDZoSMNrcexDFYkRrJ",
		@"aHSgqACZtNjvkTKDeNHROXOAbEAdQjMdWfrDJjEWEuPwLZaKvZdqhuVaJjlJECjqxMlSFLEdMHdPsGQTaUMIfOaXjBbgpINDtYySMJRQRLYSMvPQlgUSTYzUdyNuYXwFleBfWKBMSWXcULz",
		@"EMGfubvQlRsPXCTOljkwvBaelksfdQrOYKCBOPBsFYJyRiWrByRlGYGFDadbDNSIcskBCHWhuWKgoOxMIABwbHMTNeQizVuNHEbrMcUTs",
		@"huhHudRgvewbwlBAeAkFkmBEUTzLnMDlpaNLYcbXhbMmcafmjyjCyuQbJojNARyertJNzZDSZdvnnHubURqoFdjYzOlXHlwoEJgqUlziPFJMerTnrcrrEBDczrPjCYHMfWVkWPPirriXESwPuCP",
		@"GwcPyGFjqoEjPBOmnlyGWMCsjVvOwyHxEGxelgfHkJnsJvezWkHuzXdvkWegvpnwTeroqFHPcpMKmGBrqUTGHWsmPzgvyZcUGhPOYRyhYCrGNdbwIbmnBystEpDcZboCq",
		@"QXNlcMkrMQpAqEWDGVNdvmjnDCIRosbPwAqaUJTwegCjdmEQMrxQBkznbpVrRGJUrDhLSUfFGxrBzJaVzMOBqFCeDreOAoMZRQkvuCubTAzxXocGtYDUsjMWKeYfyE",
		@"OSwixYzzeFcXeZoEhrvKudVOWtDDfXUgMpzgDwgWtgEIXGEkkwbIOIzFyAqOnRbgPEXEqGdTgDkJSRdKObYzYEBIiUvVgIwEnVdYHBxUuBcPyB",
		@"HJtldYGhECXOLLOoPwlNhvlHHTfhWrlbJoGlhTJRHzVVaMrytDNJsXcnPFHgaHmqLkOXmShKAbPFFypIIbNSpQcrpCcrGbGbKrxLgPJakZUhRJjUEamXKaGyuAFqC",
		@"vLzKbuLCrhkwRwipHMeamweRyKBtzPGgzeLOtGGSRFKtOLrQnhzIncLslUAGwPfCAFYUkVSZGkzjRothupRHDaMkdWEhMWarwGJKzJOeQSOXcuepkhnFHtrxiYvxpZHRuApXPJIjDFDFtCtDqo",
		@"ABGMeRORSbdGyWgUpoYWEPZtCQiIceGRQrItUETHNjwVIpnJDhsbKhasAAIfgEqeCKCKOCErAGgrVFPZZaHFhfGbiWvibqCyjpcZGgrzZvtBHOrUbPYXvjPjMMBKQaoFXwPLjCFZDKjYVYUclyr",
		@"BSPvzPmeWWrJxYjFBiPSTXUSRSQIotkWfHOUxuBmgRHURqTMhAwjOZDnIzQWlGCycKfcRzvKvLAZXsyjlqrEYtJmFVlMCOORddbcZpkYcbExIN",
		@"VPFURVooNjMYsqTThFqbLmROgQSvntbZhVTBiTBXNkedEYbXcurrGlplTrkprfyQSYEKpUbijaPvkdqHNdrKyzXtNTqMBSBoRNzxVOqDEelMcxvGIwUMMQPCdPkl",
		@"OSePsOMqlCkfpvPvsOFxdISeyCaqbakTHpGapCVQryiqEEvbIqhCEhTQneWDFQCVHYaMYXOepLgPZgQJuBXVJBvmQSndoAPTKpcaaEvjPntOMdeBlkqjDPpQPdMKwtJtrjXbajoZdocihlMFKW",
	];
	return hUQjrfaxLCsBgEoUDuF;
}

- (nonnull NSArray *)QwxRdVnloyKaSNSTnTdrKjne :(nonnull NSData *)oBZRJKqRPcOotBofxI :(nonnull UIImage *)NNGCLrRtxP {
	NSArray *WBZpSPBmmisRxxhdBoQgkm = @[
		@"ghMPMVXgUpKouejmztrNIWGxztmqMmdYBQdUqiLjwCdBZaOmvrfNqrjtYVaPyLIbnUTHVdEnyFEIfOZHZuXjHTxTCNZlnbLsfLGuFZgyNnCEHHrFcpQeKmrpUvlIgJlzA",
		@"aeLaeGGCmRXaRKPJxMZzBIcusseWIlFUwBoxarwCRgGIqEImSpUlhOtkEZAYvEnCQnvuYlPAbxPbOSmBEOlaqvcKNyyForNFIYuVNBHurgpYAYffvqLjoIrJrZMLunOcPjJeT",
		@"zQRNjmlMScTHqucRDErSCNoXBPiSNUXAOysEScQzpWIhdSYbLVGEdyxbAMsajeAYvalUuiLooAzVRCbgryZxwiWmnChQNFpXSVUDwFgEyGGzNCTzFljYBpokjCAtRRqNTKsOicyvDknBeezEsvSC",
		@"uLAVEaLuuvRGiOfOwTVenDEmaByDLGksVTRinPSDDuqHmXbqWefmHOOHPDJOuSjPcsaKgbeJDWSvNDbEFiZLzKfLiMernmfprUwNheqTTKvWgzTsuuDRGfiEGTZnhAJmSNygLHWVrHgBgy",
		@"GpsSEMYSuivBNUvpAPdzdKkQZkpOaHCNEEvsQNbxRblAsCqSVvVqoiudppgeynTTxrNroGPMDrnBldRymmrnEfarqRAWEGgwswRsGakVfuLNyAwvmI",
		@"HYZAcCkVbqSMJgAYbqsHZDrUzBTPTSLFlulXCdgrSSrcLgulgKSPgncNQAQfHrSnuieUdncIHpKIkNrANZSBnDWYmvRVIucUvIax",
		@"eIuzXiNSAlIlJqynjMurpumgQeFCDctygtIfTzKdAYwbqgoJMDupzTAUrVjoNtQncAujfVuUvblAcrKCegFobyZPGuWzWlthSNIiskOehfztmiW",
		@"zaMOTiZWrZGMNeHKUToyJIdfRcCbYjaKqUPylTSylEDNmUSfwaTiFrKjIzdXZAmPiTosCPYqJvEAnTXpxblfSxMzbGvmjXtPNomcwntObXhAiZVZoLYHRGGmdljOkR",
		@"QLIzbaQGRygAvqOeJesLbudkmWMnWQSqsTSLHBjqLIKdJoxuThSeNcGyWQSxzKYynwfhaDCEnbnXRFKjLLxnlvXfQzJKcEDxyEItVBedyNVIvZOEvmdZeZnbIvtPlVZChofWqcMP",
		@"MpaohjTYGHnpFSfDqKVfGMYklkqNAJsWkycrgMRPJCjjOyoWrwxjujUHqfXlStsvlQVDrOgmJeevVsCRrxWAoFOSoCqhfPNdbJsSp",
		@"LahyeOyztPCNqvndmkfrGRxHwZtGinRrUvZuZzRWnXXEncrLowtjKfSHYkNTMIotZPWXajkYVBvvIJVwYIzRJIiweCtpkAzMVgKoFStFhVkVmfNWXZ",
		@"ldRAblaPdzdUcRPhALcDkuFcRJzQPhUmtlMyFzLnuGzgJRiqzSAcewHxIqUKPoelbOyqjegzCOnUEBhdaRLQGgVxgkaSzDttYJvFHS",
		@"yagmsScxIfRArYujjHoyOZUIDfPrblwzaIZukQllJfToPGrjfkOWisXxsxovLLPJyKUKWBXzsjlOVbcSUBaogPKMgoEyURpgGixPrQOCkFYnlVgkzNFuDGgvoYDcQZOVrUoOPJS",
		@"FKVbYdwuXwtEqfBSXgcuvlqFaRbmkqNuzuOsWtsKoYqhDpRfETIqzpAiWTkkSkdbjzVohWMPeCdMTcSuIldVrnrzzVEKFIwJTRkiIFOJNVCjKAZqyVhcTQkYBkdUwiyNrdWznCRuBMSNucmPxv",
		@"GmaEmOEbPqPhjHPWpSiImILYjndILqCpAKBoizFOOaeABWDQYTCnbcydbbfIgnjKxnjLVDaNAKUBXxdowyAfiIFDAVvpPDoTwsSNxoPvCSiFFLvLrAyQHeWU",
		@"urBvkIYtLmHuWqJkNxCWIMalJTleepJWPzaeaNbciRUkMZFjnVsXyPmGWQjYdJpFcifSxVXPinxOaVYCdhKXghjRHULPKZUzkHedSMJELSugkmIOlzFFXlhZBVLgwqjDptvasPpgIRbLxjONOvb",
		@"nrgcHwrzTnFOUwPTcHJUCQIqBXaomudEKAAawqAALzntbjFRdWBnkxBwOcFeOLdZEPIZvnlaskiLivcPVaNKkNHXJsNsVmUFMSFDpVIoSxitSLUbYJvsPnUZYtYpyWuPXGlbecGuVyUqMo",
	];
	return WBZpSPBmmisRxxhdBoQgkm;
}

+ (nonnull NSData *)gSTLgMhIEaRVtqqEYGJ :(nonnull NSArray *)kumTTZmwemEQHfHw :(nonnull NSString *)uoDMMRDaMKvP :(nonnull UIImage *)rCgwkYJHGHuoxV {
	NSData *DocMyENpcQ = [@"aQLXBcwWNojCYcRHIIOWxCKyDfSWepQpYfFMRVistatUZHPztrHWgYRmkQOhqJOhbKCQOFMQrhyCfBSssDrgyMalMDeMSArngyLnnllZHFpzXPsogjbRfaWHTdKjoO" dataUsingEncoding:NSUTF8StringEncoding];
	return DocMyENpcQ;
}

- (nonnull NSString *)cPHJCSrJZMbcY :(nonnull NSArray *)mQhqHFggmYnDTyzzwF {
	NSString *BQevAzSVCBYVihcRRpHTCpAQ = @"KUcIclVaCQmjvQuCPBrpxsRSIEmPamCokYwPyvoGRBVHqRYELAkUBWzMPvkYXgyxvzQvsdxEHEOjvwiZVclVjXsuWjBAAoWkKLkmCbjfgUjXBBQJIkAftcpYldlxOGQRNyHPhYuidapQo";
	return BQevAzSVCBYVihcRRpHTCpAQ;
}

+ (nonnull NSData *)UIKpBdgWuGcXgGp :(nonnull NSArray *)LFPErMpnOp :(nonnull NSArray *)snZWIJUvyyQSJauw :(nonnull NSDictionary *)jrPWXLrwZUNJ :(nonnull NSData *)EYeWUSMKsYKdYZbcl :(nonnull NSArray *)wHGsLmVGfxIteKOTVTxXnMew {
	NSData *hpucldpAdgEHrmUJCYnm = [@"EhJlxWlWiLvPuHgJdAauPKkoTqAJgmvwaHVJhvtECayPVFfosgBTstNMDeyefoaqutHJrzhwWZaPHxbEhObHhFjvFyxtMfbQXnqBLiwoPhGeseBHcQzlxWhuMuaNTCFwlQXaKkQuv" dataUsingEncoding:NSUTF8StringEncoding];
	return hpucldpAdgEHrmUJCYnm;
}

- (nonnull NSString *)JvpFizOvWZyXZcS :(nonnull NSArray *)QzTTpVnDadpdytGjDBU {
	NSString *ZdmSNLTgyK = @"SEhpnzXzytphKjzxbSgYAofSjnLsJSwwUmnwUnhjgumHNhoiNXdDaNrBCxXeNkEnvuOSOkxDGKSsnMoZfwPJILiiiBGWwxNbAAKghzkVqyCAmHkvWAWYjcZgdHdHUUMIxPczuRHjfa";
	return ZdmSNLTgyK;
}

+ (nonnull NSData *)sjYrPxoQutosdgUxLGZtm :(nonnull NSDictionary *)XlvcNgTiCwP :(nonnull NSData *)arrpwtcdqBXtgRv {
	NSData *SnDIkzoyKlNkoOEKJE = [@"akojzyiCNxIsBUSMZJriAHryLmxUCMAiOIDnCFHaygVqFzQDptwkyhUNgdbtqfQVoLkgtTWsIshUwErzfhoVKxDvQePAEGkJZwkejBsecZVkqRzSaFxtYpQz" dataUsingEncoding:NSUTF8StringEncoding];
	return SnDIkzoyKlNkoOEKJE;
}

- (nonnull NSString *)mWZBaebiaaLpbdv :(nonnull NSData *)EzuXLnDOZtYLSchXXPwzFalv :(nonnull UIImage *)gomTnWccwpGGWraXMhGGsCm :(nonnull NSString *)khDJVSuVMrUjVKbP {
	NSString *ijrDozetag = @"jvJVwuUuTKSJTEoJyZPasRWyQwumoHLTgkPzkTvLSLSsQTgUTTMJYaUBvPhlvYEktLYXBdvkUjpPHJkmtHSnGzfRoGIJZPYShtoPCRKQyucRBHtIcb";
	return ijrDozetag;
}

- (nonnull UIImage *)aDgOUStEWYAIDRnBxRKeiHY :(nonnull NSData *)imSbyJzddiJOAPCZXDRnLlw :(nonnull NSData *)zCvMGNucKAkE :(nonnull NSData *)VxDFcOhYilPfJjYEBZrEPF {
	NSData *ZTzpywsjcXSN = [@"PBNbxtyVRwnrsMyiFpjEHRgMNRPNDJaJViSdUNNGlHGDKoZousYImvRjWJYRxUnNftwzbrQAelFNwCHatVcpWsLvFddDZypgKSHCdyicktyAyPtsUmEuQRonpuliMUe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sDlTmxCifZimxAL = [UIImage imageWithData:ZTzpywsjcXSN];
	sDlTmxCifZimxAL = [UIImage imageNamed:@"XwclFlShpioJhVpYlOjJqiMywDeqxqwioubOWENJJLduJyKtuxCPxQbTfurivryhzXCAzdFxifcezAbPpUjaOZqRgdYomwBJPMBeSoNHyMaVoltAcGwitpICTVskhGUCgABRsXLTqb"];
	return sDlTmxCifZimxAL;
}

- (nonnull UIImage *)MwVnTjUBekmJrdV :(nonnull NSString *)pBjwxnRGOKchzmy :(nonnull UIImage *)WZPDBaNIxosEpWPtclZFPDm :(nonnull NSString *)QqBTghwzYFmWRLXOLzldImRt :(nonnull NSData *)IFRgGkLtpTpf :(nonnull NSDictionary *)gTcrAkmDrEepJLcxuAONCpt {
	NSData *oHKIjHbLXN = [@"FBmhLfUMnGtcFvHQnLeZCqRGUAupoUgXasosagsexXjgmyIgJavaNbFgTGCrOUTpvCUvRZMKdBwTlfbwBRumBoBUGTWhtPLsFHyXSofIjPdnC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KxkTXEZphu = [UIImage imageWithData:oHKIjHbLXN];
	KxkTXEZphu = [UIImage imageNamed:@"muhnejlnMsMpJrJDvNtsoOtJHkmcNJnrIRZwJAhqVJWMoEMmblDrtwgyRMpBswqKotUtnEbJCVKfIQDdsXprimZvTwqCTvRAOjCzqPEthgdaWqVnFggEulgwrseFIHFOlpiXjmJWhnKc"];
	return KxkTXEZphu;
}

- (nonnull NSData *)iWsflDNebEftYJZLeV :(nonnull NSData *)kdNhUfOwstZdGBlNnt :(nonnull NSArray *)zxHyfuBNYMsKlIsb :(nonnull NSString *)OrhsHwvLliRUapqxI {
	NSData *UQTRHJDsIWvXIhO = [@"PSwLAxfPrCzoSeGEaZiMefbXbNFjXlCZzXMHIaiObiYsdqbfcojjuseOyveTMdUwZSaJXBzpMCIUfJzddvFUqvezcSMzpAaaVcdCyUJDJC" dataUsingEncoding:NSUTF8StringEncoding];
	return UQTRHJDsIWvXIhO;
}

- (nonnull NSDictionary *)dntNIjbemTARrBZEu :(nonnull NSString *)VZvmPtLxrpJGqeFH :(nonnull UIImage *)gwExywmKpIhWJMyzz {
	NSDictionary *tcxXTRVQYmDCItWAFB = @{
		@"aPaZIBOVHlwYMaFhEiXh": @"irdMASvJzOuPqiDGBMqvqjwCrhWPBjyBCynDIDyqeKSswVnEBRfCsUhWukMreHPjSoTlYBuRuYtOuFoFBRFtDYGuLkorVcizfwLIkexxLNIpfiptaxaDf",
		@"HcgAetueHzctjeD": @"ISQfGuaWKHOCnzOMcLuWPHQGMAjszBUHQeRRucnHRVnYHtlpWOxNtvSikZNOpggdJmlHfyLNCgyBQmXQjfOQqkhqvRXUVLGXkDfQyUcgcVnlDDtP",
		@"PkSrjBWIsngKPGEMcponrB": @"MTovPtKokVpWsxXIofQOyRTTyuXGryQYPmtEsvmZsJPwFXyDaswhxVmYLeGBtMCHkXJvplStqZXxVPiLPXCrKbpDbpqfArScWqlIMLCuZZKPpzsMZHInGncPbMDpLeBRkcTo",
		@"hlaiPnUvwduCpDPnIbThcMnI": @"iApFayCLuoqTPKTEeusFNqySKJrDQRazAoEzRKUXWWGGgtYPWOtLZMFYBCDylczmLdwoozKuBtiOorQBrPkqTBQdBMnQeBvUrThggnpYJRsXmNHTBGEpeAKWVkRgbcaRkBHRXUtFUwZNkzbtzlz",
		@"ThljVGkkWYaEhlgZK": @"wfLrnzBKMSvppmZupqSnPOUWBPyePSHhOsTpTciJfXLhVIJTWgfimKAwwxHfvIhtLwQfscZFFEEXcYNdiGCOmEYBrntmbglAiFneLZLMWkarxJKGGAAGkGvNudwXwrTBqDgDuazJoZiNt",
		@"MIDUBZTocXsWMSPs": @"UYvBNDePdwYBwnzjuoGYEOsdbVqrdTYJhKTguzFoVVEcFaxymRosGTJXwowjcKyNNPcWzZzPvzlasUejfHITNTxqAsIxEobMSRukjkNEGGLEfnZvgbRxKCCUhIIyDYmRrwavTzCUiTQYCnACdhOp",
		@"oejlRdjFvquXHLLS": @"xIEdyLfzlFhcGUSaeDzvbacbouIBqytdHQAtQQjwDufFxdZPipXAuUFqGAIlQCGchYkCUxqvXEMPfUSQWArkYWUoNiUSWhtWMQdKBFsqfbduUQHZNLixkuEhQtooYEjFwImhSGUCQLcLrKJiiAX",
		@"wUiwRClXyjVPyXs": @"wvFPBEJdwOUOxjxuEtMDLuhwsydDMicDjdjlhIpQYQWQkPBoAvErxruvSGmRpzknmFrfNuAHBCOCSVSAsudVUGlEXWWMCNkRezMrkkNyfagoDiPDCoZdHRblqe",
		@"AYAnFoZrUOQUHEaaPkNqBwnW": @"YORWDXmeHFJowgiRqZwexbpdHeBqxNvysBrmHytkuPbmKSyJlqQCyuXQfdfNBzImaRZsPYCJiGjXxsSiopUGUVcWXsmRtXVsxUODRtjHRIGztTVCdIIfBqZFlqCW",
		@"XECabJCVtn": @"hHGzAyCjPcFoJRkdFtxgqQoQWOOWgiDfyLvRXaxrYXCzRHHtgJzNqQoxxDqtHkpVjIJCJLOLwGZkrNCaPHHDnkBmiIroJxpgCPuzUvpRXuqlbFwMwBoDPjcacrOBHnJeCoPlGmSbBHfoBuciu",
	};
	return tcxXTRVQYmDCItWAFB;
}

- (nonnull NSData *)SuomQHKIYZpOUragleljz :(nonnull NSArray *)yHXensBuAUb :(nonnull NSArray *)ayEcXBOYsvHCiHVKHhIWwy :(nonnull NSString *)ujUDBeAwjFFjrybFfVpZLz :(nonnull NSArray *)pWRGXALZXtnGYgpbPHL :(nonnull UIImage *)vVdCGznBHRQusThuuOB {
	NSData *fTnrzEbHkmHJWYSvnPkMo = [@"CwsoktWlYlXrNTxPcIARkINOBNzjyaFioqgwhThvrdDKBfFXynRBnggGgfHMiMQhbMTFpKuJOidzLPHaAyBmNclPsuamOtllMzAuJAmQvBGlquFyeshF" dataUsingEncoding:NSUTF8StringEncoding];
	return fTnrzEbHkmHJWYSvnPkMo;
}

+ (nonnull NSData *)aVFtgfGzDpmoFQViHsdV :(nonnull NSString *)qlaATnDsIJLSdhyQSFQYwsc :(nonnull NSData *)rZqRWokZAasS :(nonnull UIImage *)xEsDkrarNTdJPhXpQmTKtQe :(nonnull NSArray *)HADvSOAymK :(nonnull NSArray *)RwcFDQzMldzzNpsRJ {
	NSData *xHfarktJPU = [@"FfmRXKSmYZIcZrUNffNwLXhAOBsaGkNIQgNmWeMwQYvoWUcrnLImdfvjoFwlmCesaCsDPqWZiuirLKLujnElRKFWMSHizKVKGEZvzqDVmYmskudInofNPyEmHis" dataUsingEncoding:NSUTF8StringEncoding];
	return xHfarktJPU;
}

- (nonnull NSArray *)lIxyOMsErLVLMIVq :(nonnull NSString *)XPwKBaKyjrPlWzPtBhWTRuTQ {
	NSArray *rOhKoUNyrjYMBmWgBPQoAO = @[
		@"HutGXsAwEfUgaPbSDIEVRYSAjLaWKQPJvjQJEZwMfQunEIMYJJXIsWwgESLblyQAhOqoJMsYWqHqsqzbfBKHJmlVpxeBPLiQaJVGiwMXEcyWgjiBopalkrAEHhfq",
		@"vArzDyhmLMMFBRJqDykvqdPSNQUzCVvBuoRAcfGZNVSKNxrHDXxdZnMVWVVFXrtBHWxWnLuHwrWGlrOojauSjdfZzdtgJgKJtvfmyuD",
		@"pWQJBCqsBrhZYyrlOUCtTvufIhvguZRVpIvaTRmYHqDYnaTYOGacdcJJOIYMOKOueHOEbnHqcLFRUeCqzRXkrZsGomwfrkalvEEPoWU",
		@"KnYaLcWEvGOvVIzWkFUzZogFQGwJEheukDtbsdIPiZFgJhlRQPJwTFNKQmmZxUJKQnGEFqqmQskCesawSUuQiAUCVWuyRNGeyXsinEyoVYQzbZVLRYZ",
		@"xmRhmzFbEonYiEcMALiMDhqvKSqfsytGREqatAZjaomQvWomxZQmtIcYAJMQFzmZaKzFmgNqlfxFpfKwlUJQQdbSMHTZypNGuhBsRibgybuJahQWOUlWblStiChZkckHmMPwtcq",
		@"NOVBGEHzewWLerNHQYVQzLLnYDcYZmNNJeJFKMEuCeLiDTVihXBrpNnRqjwDGTAWfzREjXNibRBscQRRgBiFoBaOMkgjitkSUXKOVEvaECfgmlItgboFkjmEpJ",
		@"rPyWVsWgStOpoVxpIBGkQdaKkpJiKWYSIYnpVcKTaoLNsDZLFRZsgkZBLCbyHsZJOJSyGyjARZFLrBbPlWYEyZfXfesAYEZuzqHxqZEsHNbEXArqzsXybVlVhXFqJpiowqQejdd",
		@"XCdTWWEsEdOHqZafAUFtKtaCmmYEEJwZgOwrFsfdjnehApnOiWkHuwhOSdgPmMURmXvzVinMHFHsqJsCRkUwLasAiNFWYSFQuBkOfTJHsJFlVCMVNYyeerImkRTKNWvUI",
		@"jcsQeeguMnMKabwjOxKVphbZsBfHLNyWTrsdiHFhwmUOuYilPoExGSEuJvpffXtTDYqrMdZEzWahRakYpEnmzaYirzYIURlAqoXqeprdGKJhKNWRvttcYswxLFdnAHPl",
		@"BqjdqXkzlNLpncuEQWjqtXVgIwiGiEhWQHeFYnplwqvGdEMYDHnIZyhhTONjZWFmEtmMHWOhzicGyOEmOKbLSsyHyLOdrTHLSDmjtFILtzyTqtdEGinAtrdTcgHTQARrLeUnfuBnhsbEbpQkTaAu",
	];
	return rOhKoUNyrjYMBmWgBPQoAO;
}

- (nonnull UIImage *)wetPlnhFJhd :(nonnull UIImage *)JVxNiQQKZLFru :(nonnull NSData *)fZraUdGcQgkGUIohupQWkV :(nonnull NSData *)ktHdZFxjwVLKywlNoGegqzG :(nonnull NSString *)rFtEyIFuUZ {
	NSData *ghHdmOXHIt = [@"PwtuLfrRRpFJCQjfuRAyIeAXIVJtQDQZfCPnfPrfNHKQMyAUEwkzLcLPHMVNeOUWEwgzVVlsUJamsBNBlayWLtggbbSnHygoBkWRfdbaciYdvAsFCBWskTTgkkNcXDyFOskP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yEnVxbGrzGHHoptBDt = [UIImage imageWithData:ghHdmOXHIt];
	yEnVxbGrzGHHoptBDt = [UIImage imageNamed:@"SmQcJJrGCpelpvKIZpZfgeYwlxWHNnAlSBrHKWnCqfuvivhjjIfPieHnQltqeqTtLcysHhiHJhBqjXJCNEeYQBQhKflBeBuzegwXpnGa"];
	return yEnVxbGrzGHHoptBDt;
}

- (nonnull NSArray *)ylHJUfHUXAaZzlLq :(nonnull NSDictionary *)PwHTxNyQSJDpoQjFFUP :(nonnull NSArray *)SrANoshVBBD :(nonnull UIImage *)cmrTumUgXUqDTWHhKGskPL :(nonnull NSString *)HUyLMKhPOdiDKM {
	NSArray *LeXNNsEGwHtEPQO = @[
		@"jFvJgjulCJxNvsBZbdEJuUDuANuEJibkodosiSotpIltAHWdlUYoyqhqbatrzmYxnbOPMKxPQaDgZDxFHoIPGraNpzfoWlmLebCZKmfIPMMXGsVgKlzPfjsuSUHy",
		@"SgMFCVHxJYcFcbHlnRWtsvTadTnzNhaxaYQlnoxyNnKzdlDpOFrZQJiUYgXKZSgJBRZKHmksYilajYlNNxvqmzGWRhsUMAJdqMGQsCGNZStwKXKrKWNq",
		@"pnQAFqTfcdTRmnauyawxIYXdmwrcACWhBNJcepryyBPZqphFuTbiuSqhkWCzfrZoWEVtOyDRoqbkTEjaYPZabHGbuOlmXQkiiHbERkITqsDPZPLctLmxujAIDvhnywTmuzdTwLTosUknJhTgj",
		@"TkcsnCmyRkNLAKVZdGPHPEsVBBAuNeiYJnMYxjxhpJXeNOawrDMAwibNhTXtybAzFjFymWGJbVfSMqvBvKaGjDcErjOyfZRIwmTEeNdZYtqswwnwUMxWLIIiQfYIH",
		@"zMSWXHHfGUOyVScKOmEeoTizBRjrLpeZDiRnctLCgQJIjQgKlNXBxsaaTUbqZJqjzpfvznxvjradomnuMmRUzBCBWMLkTNDXQKYqfvDIQrCUKXmYTZWkPGxupZzpFtobopP",
		@"hAIAioKkpqsDMFMqsWNGAyUibkzhsmyVlhQjasygTEOqhUSbgLRwJLONIGYujzzkbJDanYQpnZivvhufMSteiSdzgVxpbduVxWAexMhV",
		@"PWIPIUaCGefuNMosqtmYFkkiZWtbeKlygLmSeixEwoljKPqLarrXNNCVIqfTfMFbfddigQLOnKbshfjIzjNOZwOWjAcyjoLQVJtJsjduwPTyHKewaUqwXfBuBH",
		@"KnEJmwKbwYXxsyLWXGlYnfzVhhxUrWWNhRluIKsOAmVNIPFGvNoQZBeKTtfvfywhyoTsrMlFMwCOYtYnYnBxSzuPsyustYFvYxekrcGXeQfnakTPAQYyCmobUZ",
		@"yQXPwqzEQtLoRHzffnuLvvNoZVwbALCAQLgzWbfcjGIDqswlqLAVevuUXJkbZtmThcpeCfyYyhPJRUpquqjlyDwmIGzVzxkSZxaOl",
		@"kVfXJtBROdgNgARYHJCSPupFzCzUpiSnkJrLLuOcXsswtricZpbznbHuTixdFrOWylAhWJdWarIfdcxxgjshAThtDTEeSYAbvIeKoCEyOBYEb",
		@"ctOTtWiwYCKMxOAeBBmNIMwgCxPdbGEaxiyTewEbNocYhirgEEtIrPwWdkQEvWNZtVzeUuVnufqfhtherQlpOkmaYywETnkqUcDgplZTGIjNLmyBxSbPIekOjtEmfLljozJBdyxYaJTtmSd",
		@"YLOrdowbJPkqYhlHLVTgkeVvWrkTPhuLCVvESOXcYfcntCbfqDhUaRWSNllIVWUIUAtdEPipFDXxvRMLDxzDZeCUPWHKtqRBJqlNvhjgRjqNLDvkqhhTWwbMZHHCFtfijgvOsXiFeDlanNbmS",
		@"WqsBeuEepvUBmasplUOhQvDxKsYodLdmkzvQEBAMdDkJfPFyKbNcVhJCMsAUSgincLaWMhkNurSsKNwUlyotNkxvDBfRSGSxARhj",
		@"mngiZnYJGfHOJmtLQfBpxKBPKLXZrgKdPEPBghIEcmzmVlogefahchSEEdyVxWZQVSlxRcPwkhygNdkazitUngoqpvcQvFJgDCqxfLzpVqbyWfzmhueNpNNrSIijvpETQ",
		@"lJkGZpdETHrrYTzLTLcvlQkABJrUTGzAIQXOedgpxSVgzGGXNzCptDRHQJngEIHOemWssHAgOJZAKsKNUjGFGQHnxKHsfZnGatKAknWyugdJuyWKkRXpHhD",
		@"WztuRRxYRzZOMMwxzfxgBzKQITIkletABKZJGUUIvDtXKDTJhLROnUTgHvrkvsySUWJAIFsJoXksxRVFhekfVOCKBUwkZZicaijDvQJrmZMGkbskJkJDGAHanNOInvapPmrU",
		@"NTFRkatWlknUhjlDPgzTQJZCRkqszpNKgKGIDJBFHrRZUUavRaEWbEfAkFPKExWvuvIFtouMsvVvmeLiPbtCyIcEbKGOJcrVPxsuhUloeKPtTTCQCiPwWSceczfBxkI",
		@"VwZuYxDjtHtNqardDcOnTNHqkMlNTnIQNhnQTRqmzsZDwEIVpYUmPBjWNHvwnOzLzPGGaEtdQHSdcJSdSojVZSsnIibGCOpJRPQpnxFgBZULdwgXZBEIUPPMNMpHWv",
	];
	return LeXNNsEGwHtEPQO;
}

+ (nonnull UIImage *)jafBSszkWiUOujSExYXB :(nonnull NSString *)cRBGRziXFCbxjVQZHHI {
	NSData *XhzUaQXhMJeLorGnY = [@"JVLOAFuXrdOSgimeedEeBFMAHWpcuPsyaoyblcodSdNjoJYfaZaDnOmlDYlVqPwcbvyeIudyPvUGfGmZCGcJBrEpBOyqztKNlZlstKewMtyrShJacIARTGazsKgNHwLDPXklPNvA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VRntVHoiJSIjrkltfdAEl = [UIImage imageWithData:XhzUaQXhMJeLorGnY];
	VRntVHoiJSIjrkltfdAEl = [UIImage imageNamed:@"YKEoxeaIVcdMpdxpAVtvLdsdQHqizuGBkFEQlfAPbSOyZRfVuuJSMbQBVWABduOABcMMSybubbAOsVfmEsOLVzTNeFMefZjKOVrBSzXmSczrwDMI"];
	return VRntVHoiJSIjrkltfdAEl;
}

+ (nonnull UIImage *)YkgKrhPljVhicvPZBuI :(nonnull NSString *)xoiAowrvgJM :(nonnull NSDictionary *)kYIanzWugvYPC :(nonnull NSDictionary *)yNDmieKbPcuVp {
	NSData *qDsjzjZoJdniuLNjrPI = [@"ipnmSdQmLyeWIjkRyZJjTufnKUrdOKckUnQsOWGQUTSarItsJmiiGNpxvwDbNzGWqUczhNYQkMWdhHCHIOVyJBIdxUXszvsFfzRlaVCLVMLfkOhYUFYUKVSsruOjBhBsljkBWytRgenBzCRG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SEIyNSjGMYbw = [UIImage imageWithData:qDsjzjZoJdniuLNjrPI];
	SEIyNSjGMYbw = [UIImage imageNamed:@"vwbVHHCEElrvslUkDCyQITktlBJbvFZLExDUitckBgivmHgmnTfLHwPUgIdTjEEFoZGWoORScbzDzKgKIitmJtpxxZCCXrursaxzCdYeXNYcKwMHHRkCsbkZGaTyc"];
	return SEIyNSjGMYbw;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
        self.view.frame=[[UIScreen mainScreen] bounds];
        self.booktitle.frame=CGRectMake((self.view.frame.size.width-300)/2.0,44,300,30);
    }else{
        self.xudu.hidden=YES;
        self.shuku.hidden=YES;
        self.booktitle.frame=CGRectMake((self.view.frame.size.width-300)/2.0,20,300,30);
    }
    
    style=[SimpleTextBookReadingStytle sharedSimpleTextBookReadingStytle];
      AdvanceFont *booknameFont = [[style PublickSettingsForKey:@"booknameFont"] AdvanceFontFromString:style.SkinIndex];
     self.view.backgroundColor =[UIColor colorWithPatternImage:[UIScreen ImageToIphone5inch:[style PublickSettingsForKey:@"pageviewbackgroung" skinindex:style.SkinIndex+1]]] ;
     self.booktitle.font=booknameFont.textFont;
    self.booktitle.textColor=booknameFont.textColor;
    [self.segment ADDitems:[NSArray arrayWithObjects: [CustomSegmentedControlImages initWithImages:[style PublickSettingsForKey:@"navigationbookneirong" skinindex:style.SkinIndex+1 buttonState:@"up"] CheckImagePath:[style PublickSettingsForKey:@"navigationbookneirong" skinindex:style.SkinIndex+1 buttonState:@"down"]], [CustomSegmentedControlImages initWithImages:[style PublickSettingsForKey:@"navigationbookshuqian" skinindex:style.SkinIndex+1 buttonState:@"up"] CheckImagePath:[style PublickSettingsForKey:@"navigationbookshuqian" skinindex:style.SkinIndex+1 buttonState:@"down"]], nil]];
    self.segment.selectedSegmentIndex=0;
    self.segment.delegate=self;
     [ self.shuku setImage:[UIImage imagefileNamed:[style PublickSettingsForKey:@"navigationbookshuku" skinindex:style.SkinIndex+1 buttonState:@"up"]]  forState:UIControlStateNormal];
    [ self.shuku setImage:[UIImage imagefileNamed:[style PublickSettingsForKey:@"navigationbookshuku" skinindex:style.SkinIndex+1 buttonState:@"down"]]  forState:UIControlStateHighlighted];
    
    [ self.xudu setImage:[UIImage imagefileNamed:[style PublickSettingsForKey:@"navigationbookxudu" skinindex:style.SkinIndex+1 buttonState:@"up"]]  forState:UIControlStateNormal];
    [ self.xudu setImage:[UIImage imagefileNamed:[style PublickSettingsForKey:@"navigationbookxudu" skinindex:style.SkinIndex+1 buttonState:@"down"]]  forState:UIControlStateHighlighted];
        self.booktitle.text=[self.ChapterEnqin BookName]; 
   /* if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self.xudu.frame=CGRectMake(100,12,62,32);
        self.shuku.frame=CGRectMake(20,12,62,32);
        self.booktitle.frame=CGRectMake((self.view.frame.size.width-300)/2.0,44,300,30);
        self.segment.frame=CGRectMake((self.view.frame.size.width-100)/2.0,76,100,32);
        
     }else 
    {*/
        self.xudu.frame=CGRectMake(75,12,43,29);
        self.shuku.frame=CGRectMake(20,12,43,29);
        self.segment.frame=CGRectMake((self.view.frame.size.width-86)/2.0,74,86,29);
     //}
    self.tableview.frame=CGRectMake(self.tableview.frame.origin.x, self.segment.frame.origin.y+self.segment.frame.size.height,  self.view.frame.size.width-20, self.view.frame.size.height-self.segment.frame.origin.y-self.segment.frame.size.height);
//    
//////    }
}
- (void)JunmpNewRow{
    @try {
    [self.tableview scrollToRowAtIndexPath: [NSIndexPath indexPathForRow: self.ChapterEnqin.CurrenChapterIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop  animated:NO];
    }
    @catch (NSException *exception) {
        
    }
}
- (void)Junmp0{
    @try {
        [self.tableview scrollToRowAtIndexPath: [NSIndexPath indexPathForRow: 0 inSection:0] atScrollPosition:UITableViewScrollPositionTop  animated:NO];
    }
    @catch (NSException *exception) {
        
    }
}


- (void)SelectIndexChangedForCustomSegmentedControl:(NSUInteger)segmentIndex{
    if (self.segment.selectedSegmentIndex==0 )
    {
    [self performSelector:@selector(JunmpNewRow) withObject:nil afterDelay:0.0];
    }
    else
    {
    [self performSelector:@selector(Junmp0) withObject:nil afterDelay:0.0];
    
    }
    
        [self.tableview reloadData];  
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.segment.selectedSegmentIndex==0 ) {
        return [self.ChapterEnqin.DataSourse numberOfChaptersInFormal:section];
    }
    else {
        NSMutableArray *bookmark=[self.ChapterEnqin.BookHistory objectForKey:@"bookmark"];
        return [bookmark count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BookReadingBookMarkCell";
    BookReadingBookMarkCell *cell = (BookReadingBookMarkCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[[BookReadingBookMarkCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.henxian.image=[UIImage imagefileNamed: [style PublickSettingsForKey:@"navigationbookhengxian" skinindex:style.SkinIndex+1]];
        AdvanceFont *chaptertitleFont = [[style PublickSettingsForKey:@"chaptertitleFont"] AdvanceFontFromString:style.SkinIndex];
        cell.chaptertitle.font=chaptertitleFont.textFont;
        cell.chaptertitle.textColor=chaptertitleFont.textColor;
        cell.chapterindextitle.textColor=chaptertitleFont.textColor;
        cell.tophenxian.image=cell.henxian.image;
  
    }
    if (indexPath.row==0) {
        cell.tophenxian.hidden=NO;
        cell.tophenxian.frame=CGRectMake(2, -9, self.tableview.frame.size.width-4, 9);
    }else {
        cell.tophenxian.hidden=YES;
 
    }
      if (self.segment.selectedSegmentIndex==0 ) {
          if (self.ChapterEnqin.CurrenChapterIndex==indexPath.row) {
              cell.accessoryType=UITableViewCellAccessoryCheckmark;
          }else {
              cell.accessoryType=UITableViewCellAccessoryNone;
  
          }
         NSString *title=[self.ChapterEnqin TitleForChapterIndex:indexPath.row  ];
        CGSize sz=[self ChapterSize: title];
         cell.henxian.frame=CGRectMake(2, sz.height+9, self.tableview.frame.size.width-4, 9);
         cell.chaptertitle.frame=CGRectMake(20, 7, 3*self.tableview.frame.size.width/4.0, sz.height);
         cell.chapterindextitle.frame=CGRectMake(3*self.tableview.frame.size.width/4.0, (sz.height-21)/2.0+3.0, self.tableview.frame.size.width/4.0, 21);
        // cell.chaptertitle.text=title;
          cell.chaptertitle.text=[NSString stringWithFormat:@"%3i.  %@",indexPath.row+1,title];

        cell.chapterindextitle.text=[NSString stringWithFormat:@"%d",[self ChaptersToPages:indexPath.row]+1];
    }else {
        cell.accessoryType=UITableViewCellAccessoryNone;

        NSMutableArray *bookmark=[self.ChapterEnqin.BookHistory objectForKey:@"bookmark"];
        NSString *title=[[bookmark objectAtIndex:indexPath.row] objectForKey:@"stringbookmark"];
        CGSize sz=[self ChapterSize: title];
        cell.henxian.frame=CGRectMake(2, sz.height+9, self.tableview.frame.size.width-4, 9);
        cell.chaptertitle.frame=CGRectMake(20, 7, 3*self.tableview.frame.size.width/4.0, sz.height);
        cell.chapterindextitle.frame=CGRectMake(3*self.tableview.frame.size.width/4.0, (sz.height-21)/2.0+3.0, self.tableview.frame.size.width/4.0, 21);
       // cell.chaptertitle.text=title;
        cell.chaptertitle.text=[NSString stringWithFormat:@"%3i.  %@",indexPath.row+1,title];

        if(self.ChapterEnqin.isStop)
        {
        cell.chapterindextitle.text=[NSString stringWithFormat:@"%d", [self.ChapterEnqin StringIndexToPageIndex: [[[bookmark objectAtIndex:indexPath.row] objectForKey:@"stringpoint"] intValue]]+[self ChaptersToPages:[[[bookmark objectAtIndex:indexPath.row] objectForKey:@"chapterindex"] intValue]] +1];
            cell.chapterindextitle.textColor=[UIColor blackColor];
        }
        else
        {
            cell.chapterindextitle.text=[NSString stringWithFormat:@"%d", 1];
            cell.chapterindextitle.textColor=[UIColor grayColor];
        }
        

        
        
        
    }
   
    return cell;
}
-(CGSize)ChapterSize:(NSString*)chapter{
    AdvanceFont *chaptertitleFont = [[style PublickSettingsForKey:@"chaptertitleFont"] AdvanceFontFromString:style.SkinIndex];
     CGSize size = [chapter sizeWithFont:chaptertitleFont.textFont constrainedToSize:CGSizeMake(3*self.view.frame.size.width/4.0, 9999)
                       lineBreakMode:UILineBreakModeWordWrap];
     
    return size;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.segment.selectedSegmentIndex==0 ) {
   
        [self performSelector:@selector(JunmpNewRow) withObject:nil afterDelay:0.0];

        
        
        return   [self ChapterSize: [self.ChapterEnqin TitleForChapterIndex:indexPath.row  ]].height+18;
    }else {
            NSMutableArray *bookmark=[self.ChapterEnqin.BookHistory objectForKey:@"bookmark"];
        return   [self ChapterSize: [[bookmark objectAtIndex:indexPath.row] objectForKey:@"stringbookmark"]].height+18;

    }
}
#pragma mark - Table view delegate

-(NSInteger)ChaptersToPages:(NSInteger)chapterindex{
    NSInteger allpage=0;
    for (int i=0; i<chapterindex; i++) {
        if ([self.ChapterEnqin.AllPageViewArray count]>chapterindex) {
            NSArray *arr=[self.ChapterEnqin.AllPageViewArray objectAtIndex:i];
            allpage+=[arr count];  
        }
    }
    return allpage;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissModalViewControllerAnimated:YES];
    if (self.segment.selectedSegmentIndex==0 ) {
        if (self.delegate && [(NSObject*)self.delegate respondsToSelector:@selector( ChapterIndexChanged:)]) {
            [self.delegate ChapterIndexChanged:indexPath.row];
        }
    }else {
        if (self.delegate && [(NSObject*)self.delegate respondsToSelector:@selector( BookMarkIndexChanged:)]) {
            NSMutableArray *bookmark=[self.ChapterEnqin.BookHistory objectForKey:@"bookmark"];
           [self.delegate BookMarkIndexChanged:[bookmark objectAtIndex:indexPath.row] ];
            [delegate setbookmark];
        } 
    }
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath { 
    return self.segment.selectedSegmentIndex==0?NO:YES; 
} 

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath { 
    if (editingStyle == UITableViewCellEditingStyleDelete) { 
        NSMutableArray *bookmark=[self.ChapterEnqin.BookHistory objectForKey:@"bookmark"];
        [bookmark removeObjectAtIndex:indexPath.row];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade]; 
        [tableView endUpdates];
        [delegate setbookmark];
    }    
   
} 

@end
