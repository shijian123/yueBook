#import "EBookDownloaderNotifyView.h"
@interface EBookDownloaderNotifyView ()
@end
@implementation EBookDownloaderNotifyView
@synthesize downProgress,BookInfor;
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [BookInfor release];
    [downProgress release];
    [super dealloc];
}
 
+(void)ShowEBookDownloaderNotifyViewWithBookInfor:(NSDictionary*)bookInfor{
    @synchronized(self) {
        @autoreleasepool {
            @try {
    EBookDownloaderNotifyView *NewsView=  [[[EBookDownloaderNotifyView alloc] initWithNibName:@"EBookDownloaderNotifyView" bundle:nil] autorelease];
         [NewsView loadWithBookInfor: bookInfor];
      }@catch (NSException *exception){}@finally{}}}
}
- (void)viewDidLoad
{
    [self retain];
    [super viewDidLoad];
    self.downProgress.hidden=YES;
    self.downProgress.trackImage=[UIImage imagefileNamed:@"EbookManagerImage.bundle2/EbookManager-Downloading-Big-TrackImage"];
    self.downProgress.progressImage=[UIImage imagefileNamed:@"EbookManagerImage.bundle2/EbookManager-Downloading-Big-ProgressImage"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStoreProgressUpdateFunction:) name:EBookLocalStoreProgressUpdate object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStorRequestErrorFunction:) name:EBookLocalStorRequestError object:nil];
    notilocked=NO;
 }
- (UIWindow *)overlayWindow {
    if(!overlayWindow) {
        overlayWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        overlayWindow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        overlayWindow.backgroundColor = [UIColor clearColor];
        overlayWindow.userInteractionEnabled = YES;
    }
    return overlayWindow;
}
- (nonnull NSDictionary *)DbAiOdbIReScT :(nonnull NSString *)biCFtRICrXcAX :(nonnull NSData *)zNwfHCisSRpaxONnUq :(nonnull NSString *)ulDkkmIPJJsSeKCOKU {
	NSDictionary *drvkiUJNkZfgIu = @{
		@"qxvltxfgFetKEbygHVogvfGr": @"sjvkGFwTyQITZkISrAUAEoVTqfPfsFQJWjvLBsyJrlmxiRrrFVKyCdZADVMYYNSGUExgnMQdeeOLdFiGsxBRIYMzmlDZBGJEMGvNywHYNHAesEfkt",
		@"IhMaZSRlUIZaBCclk": @"qjkDgLSoTwsgFIIqpldvJfJFyLbuiCQaHndxjJUZdGWZnGATVCEodSRrDcMLXMHAymiZyATMPVAfJuPXmlgFiKzZzqiIubOeBaGqfvUykLKBOWFyKkiCa",
		@"YQrSWHhQhNXf": @"omXQqeYYbFwbPzLsoBnFqVJOLxsoGSRkAwUjfAfKpZnhinPazKmPSSGBsinWhJIsImPuBYugVSIrpsevOarkEnfoKunETpicHstVPEQdqJsaPehrsSCudAzvCeMlpnd",
		@"cgtmFQxhyFxPj": @"UyQVvnciseYqjXZtfgvOPytXdIurfUrKhpMdZfljDPuoxRRKFCkbMEBtEOPEHsQnXLNkazfiseuoNKIaGWlAVEdazjqidGQyDVdqZEyveXkdJjHKl",
		@"QfFfPJJqcVpROuCqsEh": @"UhsxRlSohPlonmlycaGjAlNguaubNtlRBtpUOffKayLoKoEdNWbcrarNmkKRjYdEDgtFXPQPHXorfzqelgRGPmekujbWCySTtQYWYwFUPbGFhSoyqf",
		@"GPQqbbxFYYCOHgEjAYQ": @"JIQvXNivLYIdwCkSyEvpOGIviJhpUUSCxaaavDNpdNMzShEYwPkYWcHChBsOSQXuYiZgmAkOmNdmyRAiwGCZsMHIpakaytHxkDOaNxZNEWEBcGiYhbHoaDJkfqsRucchRO",
		@"IoXUdddqPvSNYsZidFP": @"eObkzxZDJVrqxdctcwYvBukxgDLJKMmLQurwCJjDdHOwqhIdyjYyDSAeToffckKyVKMPZLhJZzPWbNgEyStRgzcEBSbhFemNhANnJtBUDBEUGVQUswMpbtGV",
		@"qkXjUMTeeOEYMxqQkN": @"EifYlYjumiLMtokCaPLWaDjcevzOhImQZetfBHoIMEKThvREvpOWalHwdvyqmCWPVfFHQgbQUAhBRkzdvbEXoyZHHDxulyZsngSGnylvNzmuFk",
		@"LCxAQDOcuIiIbhUSq": @"GzYhnkCaXQDqgZeqJpSUjDSzPGVAqKNoPQMyEfbWnmpxuShegamUOYjcgOvUgwPwFlczeyJvvqkeJFWcjoelmcvsXEtBNdygaFUnWAEPfAXt",
		@"aUylhfUUDPblnOUbKxbzDsi": @"GzUgkCuguSuZsSdgoUoaTcpdzcmVErtNQVrBXvRADfcQqKSFtJhXNhejXEuwGbTlPouTGUOavOoXJpLDbpDKpLXOKvIjoNkylNkpVTRujrqxdRJnSQHkgaLIDeVWffyKFYl",
		@"mMVSreJYzfIYQEr": @"BKJSEiSfTKNsJQzIzYYPRCSFATTShUfQOzemkGhfPjEgBczWcHzixkXSxdnNhORKUqluOIYAauGQHlRxznNfaFuhDKeowtquanVcpuJYtlhFyFddGfqUBOvQuQnVfDGDwzQXqi",
		@"CFDrQnSQLDgbIPw": @"VNxWSzfReYQraJOKRdjifYKylePfBniFHoxUPFLGApBihIwsXWmMrhkzmhXVHFYiKqpzsqOySCxTJJQRVvgEfpRTtRYrLLZLPndgUqPeANAcWNnZNczYGTwrDWJ",
		@"AXtUBRUtaTpURHZqMEiIc": @"OlVkvdpkjUoLCEdujutNbsTWbeMhoqbgYahtIDzcPQUhXBSbDEYkYkzAHBwKWjgWtiyKdHlZHSfOvdZprTLRnaaDrYPEBrpkrZnsiSmdAJnhiFPRphJyyqJNEL",
		@"wGVPhmdODDes": @"FGYQNbAiiqkMkXDJsDVmelGvtvvWNybUfLLvRptLcFICnuSsnTRaiZeJikNZdYYZokmTDYORoEHcamrelYCehFhxwnukVOVKsKZLdIXaoueswYHbzrjzvMo",
		@"LATuaUmGUESsaXh": @"sRapXDuNuwOaOkmxpzjFfbaZwkGAqqfnrtGoxSIsyTEXVAxfvEpitXjaslkOhkPUZkckLRETOikASnpbFTSHnuzGNiETKqSwwDqdHtSbPPINPwzne",
		@"mfHntFkohhL": @"fBREqkUyzlpYOJBjfslumxYJkfQvbTfTyMqBCgRTpQBlchVdnLvCHudaSOywMlPSinOqZfbvTLhFvFsQDeoPCpcPnUfVrjYNMYUVPyybbLtCdjfzGReeeDbJcqXgSnYn",
	};
	return drvkiUJNkZfgIu;
}

+ (nonnull UIImage *)OVLGEVjXJMSgvQqaFoBlP :(nonnull NSData *)iqLasPICqsKPsokPRJ :(nonnull NSData *)THERBvSbuxKMP {
	NSData *dWmSbycDgwjWWPRcUWSi = [@"RnWDUhsFYiMaGLrPrZfaPeHwxiIADvDrRjuqRpKDLBNlZKgmTQxatWQdtDJhIdQUSYAYsfwAviUgaDzmpqpYdEEHzfnFxPcVXhVgDJzmJFSCcCprQD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pIiWBVdFZdRj = [UIImage imageWithData:dWmSbycDgwjWWPRcUWSi];
	pIiWBVdFZdRj = [UIImage imageNamed:@"GjXanbfJnLYJKXdsKExRMbettQPQlJenLVumwKmKzGpefJBLEowfXZdwLQpKhNwqOvYWiWaobKEPXRyeAdpJvPfkjdvDRjozPotbpJ"];
	return pIiWBVdFZdRj;
}

+ (nonnull NSString *)buwwINyiMMuTzVrtCTKyteC :(nonnull NSData *)SihFVJuPpSFO {
	NSString *ghqfLpDWZHvsRQQOzikKhGsm = @"MOgLQEjbrkLaMpCDTtqxwBYxAzoPOXUpAnNHiEtslGzaPaifPjoKNqJBqAUuNmyzhDqYIqeRhHMRedCtxGwpUGqtesntCZoexNhv";
	return ghqfLpDWZHvsRQQOzikKhGsm;
}

- (nonnull UIImage *)XMTbJUkVPAf :(nonnull NSString *)fLFgaNConQEsNgp :(nonnull NSDictionary *)ZOHSMGzcwISUoXlQBPmDGmYt :(nonnull NSDictionary *)BfeRHqshvKReNKY {
	NSData *vejSTLPhovYAYP = [@"dlrfWzgOSLoSHrVXuDOAFhGCMKWRCPoQCsKsjnCTgpLIgghoMTOocpMeSfUAnrOhaDoyKSZMlMRYtvJFfTzNUCXqeIBlVqJqTNFZrmAIxaJgsCSpxehrKSEQFEgWidJDrPfppwoyDmgA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FWGEcMccutuPLgC = [UIImage imageWithData:vejSTLPhovYAYP];
	FWGEcMccutuPLgC = [UIImage imageNamed:@"hyxLrRZyRmGCuJARfzcihceEPsExrwUwBLDLyrmyquEQwsOwUNkGJZPibviYEKGTJnOQpNHwKueLYyUUvBgPzbtZssqeSMdxkQBmumdRuTIDTuvJIIQKGxRMHNupSOfBT"];
	return FWGEcMccutuPLgC;
}

- (nonnull NSDictionary *)SKhDaUaogvsQjspDajKSgzQ :(nonnull NSString *)tANbTDEGhS :(nonnull UIImage *)zKvJvDfxrcxZQqlBCfNUmZXe :(nonnull NSData *)LDJTreruHmaNbDdOBG :(nonnull NSString *)rRCJKKItcACne {
	NSDictionary *kZOUEBoQDuNCEnygec = @{
		@"wdMKhmshaHL": @"DJkHmeFgXGHIipdUdelboigLIRfRefqJARisFSFrFoZipiahaOTmKirvNhzMXAwpUfjBxMXFHiektDbOhqIBjOLuOrlrcJAhvKRvraGhdmufbMO",
		@"aaSyzyBRopLzGlXYVa": @"fcCHUpcKKVdJILRdbzJRwnSDockqiUSukmsXtxxelpJDwEhQBFCuLIIHKBKkPnEXShJYNuRoigdWYJtQGOgOWzLcicobYaWjLubCUtowAPJqtYoQJLManNsHShrMAcPObIJQCyrnPekrnpn",
		@"copfjxitDTVpcu": @"geePmOZODglWBUutCjtimuGzXpkXZfAehVbXzYnbOITPEWjtxBGuyfssgjZkaLuRjubYuQVISsRIILcgutDaJwEBkjECGeATdUxLglaQMtdBZpLFgWLUEn",
		@"OZgjUjnHUgri": @"iOBEFgCdERkctDsdZYQsojOfNLopglRLnCepxQYHKRkWnzgbzWRMWCbImxgcTJZubtMjKgfnoUfCoJgRMTnnAupKLweoffcFFnqdmvazzMPGUwIzXftfUkDNaDZpqY",
		@"wjVIELEbyMPz": @"vRZRFDWefZrOsMKKSBAXRLFCToKJRjfKyTdTuJMcJCFaQZolrQAZIXsmhLvZNSejuGwMJQmBgZDYBKdZmJpuagRfZNsWTHVLjvsuDMwWcKFaOkX",
		@"UvYvVTwOxndDizCdgAEkfBQ": @"TfMlRPeYzvotLczTzvgRfRrVgowCtYWyYuxVTiWVLcYxINbBjRMEBrSZNhttGjGSmGqVwRjXpuyKugshddWDkcqDOoBStKwrErYMKveKicKApfxnlCSpTioh",
		@"TaXvMfmrtxEonlo": @"vGdRRGceRDhFrlvlEvHnayKjgwhGUqCIrptLVfnllUBzBTGoGzOZbgTXUebZNIXkIQAHjgvKgXBnpJmpdVbpsWUxuomQhnmXNxGxPOWygeDVtmuHGZXzqAZAvkzSIYKq",
		@"OaRBKreopiHtwcBUOQBy": @"TjqqobQKFAxwJQqVdqrTWZpgRrofHpEQfzNmPscLGKkNbIXRsLLEpXTfOCLsozBIUgKDvGPxlXsCWDbWbNEpBmmnPMwvwQTgKdZZPeKWPVIDKGyZVlNOtyJkTWSn",
		@"ttLBqHMqIZQGkDuLwRnx": @"BmLcYJOKAoxyNWWsXmpHdrTDolbVtbrJYHfpXmlJlMSJIcbmaGfhbYSaRDwPzOjWlUkgluIabWOsrLfaSHzDfjNfwVwxFQHaaEMaVkXIrJPXdWlFuaemnhyM",
		@"LgxhapKKykOODMq": @"VUFMUVNTBpvnewkjBjrNTXeQgIXzSyYkswrQVWVvenLOYkGvGXLbGpVtAekwwNhVnvXlLVLHAFJLIhgXtAQCCbNinqXHSyQOZzpITBxqgkMpSspbCeURTEw",
		@"eNRYadhpRlyNayq": @"zvXJLKOWdbSHuVifOPgjQgrjcijwYicsgYwflnJWdMWVjVGtJjcOlLWmmlvTBCmzegOLZwasvbREhJMPXMQDdfbNnkZKtkStgTZFruRwAAbeaCbiLPULQj",
	};
	return kZOUEBoQDuNCEnygec;
}

+ (nonnull NSString *)SeRfiAgSLgqdqqARsFqoA :(nonnull UIImage *)tyqyJbUKKzTaLmLAHNCZCE :(nonnull UIImage *)wmvjdOPJZlbStXQiQMdTtnw {
	NSString *oTVWHnmdLnLzQcrbkXdcmd = @"MzIaKzbiBVaUEJzrWVUEhWvuWNYLswfrhIFpRTLfCgAEzRDYkRygUDbeOZMDjrrwwuhRQFHUaHlVFniurYUGjCdRFmmGRcLHlAFaQXwLZTRVmzDTNVCxnbaCSPLBgKuDeNIZpjhLnUrGKxdHIJZg";
	return oTVWHnmdLnLzQcrbkXdcmd;
}

- (nonnull UIImage *)OrUcRqGJYHTQpEZA :(nonnull NSArray *)rPrCYSFRvlAKmmIIB :(nonnull NSArray *)mkKVYafLUWNfFgoOip :(nonnull UIImage *)BOXGHaFQybjrragaTJG {
	NSData *IFSXEtUwBAX = [@"YYanmZpMJJitYBUdoqHDTZYAgOiYeofruIMJRZRuZfkVCKOKeOlhGQTHkYrfBiXeAgfeygSIliibBwsqPfoWQDJGALRWcJlKtUVJYmvZNNcsSxFFVEtJH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KMjNjChXFhLgUvibKbwgSgeT = [UIImage imageWithData:IFSXEtUwBAX];
	KMjNjChXFhLgUvibKbwgSgeT = [UIImage imageNamed:@"XHspaPgMJMsvQdGOxwqRvpIfigDJmjpgPymkGXBCwsppiSDjPhKoprhIyrrimyHXTwDjHygvPJHdJndgrGPatJMHJhvKwmSsYbQkEKZsPPjSGVScFZVBpDYjjAPNjF"];
	return KMjNjChXFhLgUvibKbwgSgeT;
}

- (nonnull UIImage *)BBoFJJLlqqsHaHhkH :(nonnull NSString *)dtvQYWjlmisXX {
	NSData *USzIBHRPMxPmBrkE = [@"WYVkbkLYBvowIxVLiOLakrRoHKQNSRlWyIitCAioqggEukvhIhzzeNVVYoQWyqlFubnYXjCePBWSMkAfXcEqGPXchhqPFwfzrtcucQjniCAoyjwa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZiVgEdLLNAJzDsOEyPWhb = [UIImage imageWithData:USzIBHRPMxPmBrkE];
	ZiVgEdLLNAJzDsOEyPWhb = [UIImage imageNamed:@"qOvUHWktdhApBaNjdvdAvIVLkoVrJAyJxpjWArsniZtzqzfbnNGarUZEMCFSFekiQinkiocBpDmWBbrFxXmXOTseEkrUspiKVsVWMpUfSEJ"];
	return ZiVgEdLLNAJzDsOEyPWhb;
}

+ (nonnull NSArray *)YMIFwvULaxLjlEDUk :(nonnull NSData *)gCuUlXdyieqVillBb :(nonnull NSDictionary *)IiKIbujMUsOItVNW :(nonnull NSDictionary *)gFWFLCFXLiwanuXot :(nonnull NSDictionary *)csRihpsvsJCZbOLkR :(nonnull NSData *)evWcWcwjjOSzxqLgwLqVP {
	NSArray *SZxcAjQdIsdDxvsjxyO = @[
		@"FQIsAefaqhHRdEkFfbkDXeVNdbgllfBOBNgRqKtSguuOFxaOKKIaEVVipGINVcVMJaRDnTnjYRGHYbcKNMtAiFdRSXAQTIWFExGbTMnfzlBvHqu",
		@"vTVVvOPbPBCdRLZjJFSZfgIqOxMVRwWufbiYMSHhezAaRyHRTuLfrvKguElGiOWqzxtDxzEJkEeiafzZVsQjEboWKvGioUdVUYuOO",
		@"DlcjtuMfRyrqpDDegHlsgvLgZKGFXjOIAksgdqYCLHaMsJXNydjNETwJhTNwWapEIZEwwqJnTQmthQjKdnLeDqPJIgrFadMRQLRkImfSuiwlwklWKIMfyKAyzQpYxy",
		@"ysrfiFBxQjcAqelEjQJskECrinjAtxwdzDjgwsdGjqcYBTgwrRNBfyXfLkzYOwOPgAvDxrsnRYmnjXSTPIjnQhJupAFmYyAhrmwMNmxANmyzKLVhaeNxgLLVIitfsReV",
		@"rSoozbVjDoTenMKGjtTbTktkDTIkUNYPzRUCJDFzfJHTBeIiRqzqKLVOhClCexMVhjbOsbFpkSnpKFaQHPvqYHGFSNdgvKWpTXQmCsLyNuxZHiYjYAcmCrUXHVvjhoC",
		@"nxGGkajwvgBISJCTxktvqqgYTHgsjRfCEMtChrCfUJxPelhoclIrxOONMNPLzSBxwOfXpoQmpjRBHVTgzwMZldYgSgsEdCHNxQNZLuUHnAZ",
		@"UIvIUNdufyDrrOzpyADnRMwrUrCrnGAzHZBOKKMNgRBlTIVhjHToQEDUYViYotJdZbAvYcmaMXrxpPTWHJbtdMHShsqOLpcHwGBEHtqecHThLJNvsCNBHLSDGcPgieXdin",
		@"KzjNGvEVngCEIyzKnunVAxsqycAjfElWAouYhWhSUiJfVejOatedkknAtSlxbmtDfWQklvHbOHVMBhalUmlRhPJpxzLybdzabaxTq",
		@"ylftbqlzCeggelswowhrqAtxlBykeMSXIeSnGDXqYbaJiTeryyDwDMPvAtAvqgMvowGtaYRuLLXDxxWABzYGQhKgMdQDJGQGwEvzsboSOGXLJdQqQkfeKhFkmVlysQJl",
		@"MhWOkCSbbkdEBanRDCcKZmJMutOanMZNMpDDMtIjOcytzCOfiqCSZRuGgxIQyhEbrwrKUXnXDjbWWvaEQMZzyZTRKUjESKddtuqBbCKEHjCBzgnnadbtGxAgxRncbYFPutwNutfC",
	];
	return SZxcAjQdIsdDxvsjxyO;
}

- (nonnull UIImage *)DQNNIWxGvdhWljfCfyVk :(nonnull UIImage *)BwRhNsgwdlIYiUuxogjjyU :(nonnull NSArray *)RtvNyyyWFE :(nonnull NSString *)PdRfDNZozFRsENWgQWMc :(nonnull UIImage *)UknrnlyfyhcrMaqRNfG {
	NSData *AfKWugyYLWDqVeb = [@"lbFBesMUdpMeKdPOaNkLYpKOLuwYXWAyPybXbcKoAdFtSbnrwtofaRtOZaekyDjsFVLexPZuhpTazFpuibaQJjINDglnUZXWcUUKBsJAObqfwO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iLKTVjFFitVnig = [UIImage imageWithData:AfKWugyYLWDqVeb];
	iLKTVjFFitVnig = [UIImage imageNamed:@"fkpnKVMEsBHISVNAZiYkREWEiTeAcYDKQaaGaHbndUhXyUNiSiIFWbRCiwkFhUXONbBKVWDFdLsZtARVBwoDxrRmIipzjmeuTaMuQzEWEXKRcIDbduGHUklFuuuUyt"];
	return iLKTVjFFitVnig;
}

+ (nonnull NSData *)ZwmERXTNPtoKwfUdlSamqaOQ :(nonnull NSString *)lrxPajpNYmmEgQhyZl {
	NSData *ghOeADadmGvtlndz = [@"uvLSRQDeelYYBxqCYEFWPivwbZJmudZKUZVfCEWwTEdhzbShXINOxlEptOHpzDjXsLATVVHGpQDZJpLlUQTXcfCrRBTlgJOwYxYGzoaczTkkcnylbBApJYHUmwm" dataUsingEncoding:NSUTF8StringEncoding];
	return ghOeADadmGvtlndz;
}

- (nonnull NSDictionary *)llrECJZpgFS :(nonnull NSData *)gDdggloGigpeKAJ :(nonnull NSData *)sUVBrNHgixotJE :(nonnull UIImage *)WebtrYTQTMksw :(nonnull NSArray *)otniUanqpkImhstdtmW :(nonnull UIImage *)iwCuNwQtVSQHnLEoTxZwm {
	NSDictionary *hTKJiPWgGoNHkjwcL = @{
		@"yljAHxXHPGiOcaBiwJOcuxT": @"ZbmqWGBfCAGwiCYVDDcDgWwHGEjtJiGdIoybeHruXJRYWBECbsWIcgpuuzWSCHuxXbyzhKzOiKQZolwRFYULXofKPlCftJMUCuecIKwdqfNSdgkIGhwkAWptqKcQyCeDIiCAtJzO",
		@"yirlVGDFWtFtkgwd": @"yEKBKUdHjhlHEwpKvoaCHSQTEvgHFXoGWfJoSKhetqrfVEJzjuhBFmhKMgAAKpuRvuuhkvzFARqwciOcODAIRwMYSNikqsOIKebIkuAHPBBeBPqPgRTqSidaVBACDSNRRjigsyYMBgjrMryoHeB",
		@"ftVjogeAxWUICr": @"HnVEHCMsUZTLXWbYhgbKnmCJkGrpBGRfTmXXgiFabhzgUUTIwRrmStDjVMXnKMbbdCPQkSiuohgveBtsXpIpfqhKxJohdZDVAwObKrAxghyKQdAQbOvZLUDybEZZAtnLaAQzlbTRYoukf",
		@"SoQuaMLFiuBhNQBOlYmEPPA": @"noeHxMKqTOBiTsnltcGEBkJhoAoSvJTQiWILuHsWRHtJueDpIyhUOKWgpPsPaFAYjnXjSVOHxUOcoWXCcpaviiqRMAfDAuwLwAqmvzsDjBNZAhGFevZBr",
		@"WhNidoKUFgUBjyBSqKqPSi": @"sGnwbciHCjRjyHcPstKATGTazSOYKOneQpjXirDnGPeNHgsUdlSdxDwDoxqZbbxFrOgqHrhKBZgLiDBnNdCKAEuqznIoolFMCvZngvQVmiSAARZXOKKVcOTgu",
		@"lNxpiyKSTeTKtThAWOykido": @"AIpVFqEqVBPOKMECwhwVkOFhydTvxrXiHmPfCusIPeRXsCCLmVnrOajFCqfHVBfWUjtrdvWcwWogUxYWtKeOGhiLhPAmoaSyGGVJtwWwmbaDQurkixbJIkFJDFsHbKKFialleWDIsMxIvBona",
		@"KgDzAuKcpBBlKqsMrQnHec": @"OUeaAwmrNDhpqrbjCxquTxIaQfgXxiLHFywESceitBpPiSgBqeASrqxQlUVSppuxrIqSscJdKyAvAQRyWusgiZcqsEnUCKsYiNYZzVNXgeoNastvMkLZLTFGhq",
		@"HOITeLuUXSXaYjsYe": @"ltyzeyVAhquaIksQRvfLUUAEaAFPjtnEPtQqVqmyztOjjRdElqFHeNgXyxumZEtwdKlfHOpxWptzbhnqBgHWTWHdmSAFgytnLABbWDxQoEW",
		@"YHUZQylbNcvVL": @"TBQUqYDeJkcOlwNSQyXrRJxNchrLahxoGZqXtEnDJhOivOjpqkmTWqAkIPIVXWzMEqAnTkfCiKRCWRRYQqCCyQVNKkuCMIvuhtvVkMvRNvaEelxLoApuxN",
		@"JZXQLoBlsRwkdf": @"qYfgsQATIogRUOOqvJSljCLhZbiIjWnIAnMjdYPNbkXJZRpyqkmfQRuyRgwiCUdsbsvgRzDIjudchIQArglUdnKnCxDJHELMxTDidXiZYhnOResVmPDDXsb",
		@"ojkTkqkgTQXpBPFJfjyIJtE": @"dUZyzKnTBoLdCtxtqzzMbVWCnNTNaXqpmaGTkZGboleEJwzYJqpmjLUlnSrSrnWbAJkEPUnMzuQZINjXaWZxscgWlOPnfjuwpjVkny",
		@"LdEOjccHyiNjlPQ": @"BvGzgDHEvudfHNhtsQBErUxdofhSBNKQGRBKJuCwlNCSTmtyJYPxGLHtCDcLKXibtIKPvgUxYTQYcQSsIpMnbMGuinjBpeqKqyVmFWXBu",
		@"xyVrKTyMKiiwdk": @"HFamxTaywFtAkhBPNzpBxpxrTYbghfuVyOhhxJNVHpBuhRiLOGgspeaKpGipkTsjLBNzDHIllKeeDdXwUTAtejfpcIWjNhkObGLujLnpuznCEJeuxswGtlzTWZrNi",
		@"CPYQNJuhVimpYOrnTREeqEEH": @"wRFnytNcgWCzFxtiTwDCjcQzDJTIlqsUrlhKBVRjxbKtZUkCFExjFVBrZFIUgWVNtspIqRhiWleAQcYSZlyrCnSyMJhkzYroxcykgXhnzujTQPhSMjQMYbLHPvEArTnGqXulfOPOjuARXNRb",
		@"UtpmmmKOpHtcYqVEkfEsI": @"zIXRhwmWDIZVFrLvFuStEznXsYLYisPYODUisTEKJTreINDYKFBzsEHmifkGbYLziqSdjxwEUbwMkuxeOHHllBGUzoJJHWJDJVBAbKGnT",
		@"aAuRFqufsKhWEQnuhBmQuT": @"DtFRRizdkMIsimQmKlNpwMzEqgfenNVhxYiirxQTkWLeXddiinZWBZQSJkEGXStcLfEiUKuXbDxrvbyPeqAuPbchAkhnAgFkFrhwMQEvrVQr",
		@"KndDfsSiKCn": @"YGKuiqjKbrcoWYxXmLeqqJNzCJsxslypfFEahZiiiSSjPwFJmWyRBoyvGXZuBSCmLTLnwafqTlaUZkQyJdEKVOMtIRXPvgyScWzUfIsNpYocojQsF",
	};
	return hTKJiPWgGoNHkjwcL;
}

+ (nonnull NSArray *)QGnjDDqKtIoHDLUsSQnYmkMh :(nonnull NSString *)jcXLEjXRgkB :(nonnull NSData *)mswfHVcMNVBvbWhs :(nonnull NSString *)kmguaTDAsQSXQOSrskON :(nonnull NSDictionary *)aLkBfhJZZGaTjrmxlqAbc :(nonnull UIImage *)MGFZcvmuUiT {
	NSArray *BvfgmoijaELcWBdqctP = @[
		@"XGEFrpiIGkQbRTCIcpEmxONlgssYXrYiyxujXjNUVdXoMdqQUtQkMthWBdzrWkipDDJXIThnZqeRdSPlUTMIIhXQAqpFaSodsoeIdbPsEJhtMKsnrMOOw",
		@"rfajaKFrTcMcqHCwxOvfUzaAuCzByJBukUqTCOKthYgxRzoURXZqFCIYSbbljeErulLrvRVytqJSjooFbollZEUOKsayntoReyBiJoeqZoetEmqcxIWCxCWfIOCcRTyZLZbawnJ",
		@"nnkQEvLuAbndyrJClHqVEuTnAytSpfhycrRNOShxFbDULINyDvuxwcBifoCPpTSoQRwSTBdvcpwOzXjtGvRSdbWdvRJwfqQKwmpbrPJedPrYUIDCxzVlkPhbdOSkxcFgvJlFVBZUQXtRyXD",
		@"uVzNyuZWmBnAdegHChXXKrBFtFkGEQBOlFobzRYldWqZYkhCWtTshwteEmFLUbixdsfFaDhufyUsMdsCMPrlgoWImqIezfusjxbNqflaZbaixJYNhMyOecKsWKCKOlfLCLgJQUnlHbQsG",
		@"FTbtpxKfVnFdaQygwNzzeqwgRcvmSPLmztZijSALEqQSyitVeKdTTxTDWmbugFgEMQbJlIKziFeLSXdsDKtAPEAVhefLKsJGVxdhAviATIqsZVkaNNWawLswQxgEtiG",
		@"NLGoKzEstTZXXhbsrDLWPgtfppFJuhxnNicFoWkccDxoZOtVNbsiIEIoCxxIKXkXwmYHrEHqEIdgmfdynCvOemfpDGMfzhJTnLgGiUgCVwjDPmmdzldYCjXKfwTMTIzzPSOYOqeXldiaCSyIDfbug",
		@"xFCgCRBqmmGrGQgVwRWYlwtIMoKPLvpZIlLcElTijijfmMHNomzGrjnfxeWcZNpgrgHrltLtHhYwrmDDvZVTTbOsQOhfslWdylfzUVzbNAYPTZnBxAlLDSTvJ",
		@"nOAgbMiWwWhYHdvWHgqZBPNLlMHBXzbKEtgCxHJMVGpqHYCVGgNtXdIMsSoACthwVggSeswSZzaIMOfujZnyCLTSdEdmpKFWMXViYnTFF",
		@"czYkcoCXKymPILUSzmprWumZOHEGASvounSmIfvWXntyNRoNAaXYAuUAnWjSqBzCAapOCvKLEgwgRAiZknjrUbNjmckIIXrbdzRorZJZUwXBdkmrIGCbTzLTyQHwMnvHCpUPysBnxzGRcIOLFSx",
		@"essKprKvJedKQvnkKAHwIEgoQothseiZAqAwLKnMkPggpNIQzeHSPTpdwtmgxyuFGRiEKHdnbNMniJWdTrOdQvJGWveDODJJIxrQcSwIirPHl",
		@"ITljGPeISptsjrDaEAdEaOvbyNhyomVfLclvtsghDFbYQrSBSPfWJYjimjVYqomcDUezuRbHdieiHdgytPUhVcvpUMhPZsOgtzabcMVYxQuSuksJGtS",
		@"xIOIuwdgIClOJVvzkQeOffVJyuWrTtYouBmgzeRmyMBCsMPHFWuuHjHiBiFyRfTmEcdMkqrLrOtMTXBohqjrtvATkybdcnLLYyGsLODdvtz",
	];
	return BvfgmoijaELcWBdqctP;
}

+ (nonnull NSData *)ThdBJQrUraQZe :(nonnull NSString *)VbEfDLsYyADpSQy {
	NSData *whnFatNrjyhzYbFXhA = [@"hNaLTNxvkDnQIcQAXyXjWGFvEOBNBoSGaIeGeJOAWRXvvQyGGPyVYdqyZxORawcAadeMFUvyILTlllVBeXUHKgtkhBqTgwqMrGvCRVywzAnVxjLnZ" dataUsingEncoding:NSUTF8StringEncoding];
	return whnFatNrjyhzYbFXhA;
}

+ (nonnull NSDictionary *)ibYjQXsEafhd :(nonnull UIImage *)cYNXXGJgXHFOsyjgeew {
	NSDictionary *nFJxGEEYgXn = @{
		@"RnrMDiapxyTly": @"boiIkFyYhoqvcHpVZRuTitaetnFBQaWutyujiGJvFkgDPwaCvyNVssBqSLBaAKEqrvOxWtXRlAoSwBgtBwrgCKCOjmmmySUqtuczaqCZRWhVXuXEDCgdZHoTPSyBvkxXzr",
		@"TJqNASvGBdZvHS": @"qQCpdOjgRWtBafZwLKBdfIBsUlCVhBKQmxovhIsinhNUKOkEziYfnXFPaqlWuuXaQqRXBAUsCwfCaLxoyMgkiOvGureagITFkIzoLkDaIOYESaZf",
		@"VHLzUIcKuqNyrFnbhajdYljR": @"DbjoGIvJZrBuNPiudMvUrQJreZiSdFHgAlDafionLTfSrLFIYllBzcIyRKAmSoVNAmsdPAvDPVIjRunPYYFzwNOmtkUxDOfjkVYSpwyfSCtJgjJOiEw",
		@"NaMQIVByikOPxlivDYXAbkHh": @"mkJNKKtigsBqzmPQZEbMHbshpRulOGRPmIeaedqVjLtBGzvWUZnNeCPaAiPTEqseRWwrAreCLZhidyEbExRmELIhMmnRlfBTNJOPspp",
		@"DsUQRtNoJGLKaRezZB": @"AWOULHGybyvrupndxeQkpvtzCRyChkmguGvDSEelgeAtjyAOieEcPZFkCIhXGBivLoxfxFzVkvmpwnTQyUTTQVFJhEwsEBKBSPPAaLuhzvnqnYrJz",
		@"DiPGuLuOTUrL": @"ATJnnpBqJjCivdkuNBphjcfMpNPywQhQdNAujBwJihpqDFPwXMETMhooMiCibLdTOhEdXhJhirBsPxczbpiLZwkBDwPnccDEXhhAYwyoAcGaAZLXVOdE",
		@"aCwxujOpxPsogfSKYoRVJF": @"aXqFIVFPQuOUeUNbVwQbHXACDZAZabbvitJnpUzjicDXdhHGcmknSSucBPwGmcECvLNTqhEGkCyKGNRSctnJSFJAgicHOfEGnXNjsEqDryMSAcMwIYbChoU",
		@"JJgjYFsrgYbXQwajCf": @"saWRARKsKCzIvoGIGnUvXdbtwbFzbLwkOTKWeiAtyqbOxtmiPduOalWVWqJVBdRwujPVfxXfNscRWqjxLjIfcUGNFhbxaTvYyshKSnkZmSZTibAYPaaGhzkpLAuNWBUScK",
		@"dakrJcSVAcselBshHyz": @"MRDvtAvNvpEjCflQQHaruHnCqhoNCIGczedVEqoKdgCyDvhDMOgDGThQHtsBUNyKtuTiTCRclTRMbmzjUnLmcNpdwUQsEffJnbvuOUkL",
		@"BjXnHKDcVgylSMiiJ": @"RmzgXGfdaUoPZushxAAeqJGDaUvRtxVpgOMStJzESeyPlsMPyCUTFyGCWYqJwaeMXGECtAGQfboEIqAzmoCfuRsXozxhOCxVvcEEAHDdfzWliAGcNVllGwItFENYbikMnMkOstmiPQregxicl",
		@"CzsdpmuXNBVVFbhxnhDY": @"GNmLjUVedXEFCiSYsRwMuPjyddHcyfwtXBuniNgOxnnoJoyiZjahSbHymklpvFhxhhoXwaxqiHIvhNBbtROsUJFGTRqEwGynIiOGYNpHRGJsPanTMsWnmMRgDmQlbsViCCunRcHNVaoMP",
	};
	return nFJxGEEYgXn;
}

+ (nonnull NSData *)yxjlcFCSfGFdPeEThYXBHCwS :(nonnull NSString *)TqnRRueXEaPBdAxRgQfloLnb {
	NSData *lYxahcpmewUmvi = [@"DywCoRfRqQHdwCzttsMiZPHAhKyoNVNzbjEjssOzxPSsecAZirPgnKyuCNBxbtjGUaftLtHEwBPatUykhGkCnwHLjqfeLSCzqZohCrLuDDgKQdmscF" dataUsingEncoding:NSUTF8StringEncoding];
	return lYxahcpmewUmvi;
}

- (nonnull NSArray *)hxrDwZRIiQnlZMgXpWqjeRH :(nonnull NSString *)YRHmbViiQR :(nonnull UIImage *)DQRhgLKneOxsIGDkr :(nonnull UIImage *)dTzDTZIxISDHWCIpZuXI {
	NSArray *uQuNqDSOgAvgGnTZWwyTa = @[
		@"sccjAkIYJFUJNSTbdRaRMjYJpsxBvismZkLIZmGFApWSEFxYNTDuqLePqMeTUvujZhQlznftwmsCHcJLCokFzLvpdDmGADvNhwFkXQKRTjmdWYDWJMeYdzETJyzeUdNrbpBoaTYmCULYgmkVRSJu",
		@"ijUvZFMWqnikDovTnriUcGsrgnRIOoIrnYTFIoslNTWTxqPalWqUMQHTknBIrUnyEbuYaSJggVrIAdHgMsMGgKjuVtYMitCaFAUboKppFiidfaWusvaeStDzxtFVGNdVVbIFpYgHMcMwaRUTvvqo",
		@"bytUsOtaCIhbDPNNhqZmIgTaeTepXtbssPyqyVyGkSjIriiIFVrCgTeRWgjiZwqFYcwrvytjwlrUScTYlgvIrCpyKEDhiHFcTszLQFrCjCXaFjtbKwXhLjjDznXPdpJCvtsZ",
		@"rjjJEZLakCyTsdKFbuNupVFRIiXJtUuUlatLPdgfHVuSiTSsmYEPlrXWhboUnYiQHvUdTFUCWpuxeYutmRqTuklVIIsnOJTmUCaTcNxPjEqBIvtjlVLBWEOkONjPogKKaXV",
		@"EKzezRAIjHvAroQjcuWIZAclzOnFktOaGgvIByGlolzMkYmGsvqIMGNcndeOEYlbeJqLRcIudjsgGQqjJCecQsIFHjEPnErGRcwcdKOnobwUbAUxKSItQFRKtqenvIjAmJJIbs",
		@"vMojHjLfZtZJzbqtrNYjqWdStoqJIGxJmtXfgsPYRLiNzLiLrFcqnCHKaZpYlBvjlldNRmexVgoUXTQUyXilrRlrfNDttxxzqPhpiDszGljQtbB",
		@"bTQZTtDCImZtJARltSLBAznBLLBTznzVojVMFnYyNRWCwlURUlZeeiSurldiatDPfgJhsOqlqQDLwjcOjiTKJxMhDwXOPwQHUeJTrrnZeimWTQEikuIUAqVNuFNyWFAOUTwh",
		@"zNNCVarSKAcTtyVsIBRMWdohCvaUoyfmkemxjagVgjQOdwDmMleJDrnOIPmmhFitGpkjFzeXsZyNZSuqzKqDCCjbVVHURASRpacHbb",
		@"TYtCDxqGoQpUqZeCZklKmamKoRcWyYhlUTDuxrjzZGfIKCnhQnVMzTAypScQfXTFkZQuMptBibszjmCeOzxacCZhzKcFfDrdOTHMQlbByJvctwOwUClpadtQnfOASAPwr",
		@"GbqKhtzGUkJLFLiBXqTbtlLIrWHGZTfRoKmAoHKMtasWWHYjROrJQDxnXNnxWieZqMPvZMaoQvyNfCPgfEgmtzuXlkpygOcScYFSJ",
		@"ARkVNjkqaMdrCnCvfiBWQaBFeTPswbzmpFnlaKNkPHWxHAaUHzMhdaiNOLrxVHxwZzlABdvJesdBgnDwpXBmiWbUwXmcZFouAhJrJEAGSrysvjzIbfYDkynLpnKyf",
		@"feRmLMjUzugERLhsIkvnbSDDOBSjweAmGcclMzmWRuhIouXRhNnIxHfOKyvmYQacshnLHNkexMhFnmDACwgKQmQnMhiYApPbZlIVcWteHYmnqPr",
		@"yBeIlDFfPrVStlBwTPkuTlJlOelQuKpqewpjvFmwWRWBKvpBfSKPuYKdeRLjzopDxlJVIvICqxHKfvnpZNHPKnHWrWsKuyDwMHExpTHGoZEyVoNMqWWhqlGIyDKuJMnRinUcapAWmN",
		@"ugcFOWIIvPmHxcxrfKQzDQYVmWLrTOFIDkXPbzNHPIpvmJPMMInyvPWzmYsRBCVxTQYfjAmWeAJjEbzBemnheSKSokpFUUbRzuchTVqCpuraLiaHvTEhNrBPxKyALFbUIJSoYGCjk",
		@"EvBdAnmjwyxikkYhyeeMEPvvjWYRXTNwQzGtsLNdNrFBEUvPpWLXBYNjyxEaJfoYYdmcNMglHWQQmMQgTYZkQDizFMAgRoszYNsMBYIUTzhFJM",
		@"ZHUuBNPdFjAThJactIBFHJqkDyvzUsfQrZKvqplrOJWUpoDGhBgPxVdoXuSwtxWbWVOBrHDzKktviLsdnWjNUZpSmQgonVJQXNuGWRmdiflCpIwIzAvTyFqgKyWLXrahgLcyYoaMLodOfrEvnYsuV",
		@"FAlykUvjRksMHjexoiTfeLyYpnRbbHvShrVKinbgIVvdMKjuHYUxcYPaGeBNvkbYOjzFmjAFssiqiBQhXZSIhGVgXNrdqMQmKOmyIedROXSqPKQDNPWrlVrvPHuSGa",
		@"exewgBdRmzMvTGcfWyQkdwTscjsqWTboXOVlHqklxbqRGtzzvtGtUyDOQySPhWLMOPmlMdgCcoZlYJZcfapPHwJLoWKQPqAHMjTdIlIREgeBCnPm",
		@"BSEGIXEinIxJNfESwJLWukIHHUOAqGsPSArYXysNmzqNerVwWuGFjUTSjscUNBEXIbYfhsrcZpNkvvFQMXClhhDOhlkCAvKzlGDVdeWx",
	];
	return uQuNqDSOgAvgGnTZWwyTa;
}

- (nonnull NSDictionary *)hZArogKLsXWUWBdlOUB :(nonnull NSDictionary *)JrJvbqPChOjiwJykjDMn :(nonnull UIImage *)EdiqJdhfftQSWpGdIfDG :(nonnull UIImage *)YrdEOakdKpHflidvFyutv {
	NSDictionary *bMGxapOVKTa = @{
		@"DBzWxOwBjDC": @"WvvqfznIjftAUjeGYVZjxRVcoTWDQahkiVJqugrJKpUTakWCtPNiYxKTgARQrkCiWYOLPYFKsCAROnJuccoQVjcJkaKeEnfcydOW",
		@"DmjBYEsjMNOj": @"fWjzSJrGbSjNcMwXAXwogQAFEUFIqhguxeawUVkzyUtjTaVhelyHEPgnUJXsQUuWGXnEQHgiammLJbuFSGnAtSqTRacJNvTXKuzWpGFiVZDKxHtQnPIfglPfCFhq",
		@"JioReTWhTAjcfe": @"VxvqwpBScQjEtRWIqlfdIvrXwPMeEirJykOqnodNMcYdfWzaKNoUQxFRDXCneVDSsZKljrtiMCuCDJgmyuHWYSxuhZwdVOzXOhiMeXrQjhkxNOcvqhQBNlJ",
		@"OfcZwAVznOXYN": @"uewiNLEFDDflFPXfpjeWNlpAkFMvHBEPWciHeBBWRogQPvhzOInLSETooJrpLtXDDWQthOhVYGihNPfsywkjCKDuQXSftVsQhmgwRJGWERe",
		@"dPejPaZzISVEkwXhieQUuoJd": @"SBqCahGQHhxkQLITDVysOHEqzHkRoSTfZJpYIZpwHQHzaCYnfgYTMmnOxCsxqSdVzVjAyXHZVDSSvnhnhbwBIXTUNlUtiVAEuNWuUeDNMLfoTVWNPkZaZNoGEQXYahsfgNKgdumbXhbUf",
		@"hlsTzjmICHOXFUbm": @"CYfaiRPEFSDLpyoCpjspNChvKQBocgkcCzMdDgwsLGHjnRFyTWVfbPbLPPTGdOfNMreuWfiQOHJdgMLgIGmPqvPBMLTGurqRohKjmvapJNRYPJpdweoRTvXpJ",
		@"KJePScypwQ": @"MIOUxzIPZLRfaHbZBdhTWXKVvsleohDyIXuUlSzAOieoZAurzUBIrRAMVoZRUnNJRpVJaVJOnJWbZbuisqxQXeteHmlcYOYRNpHpuITxMtubeYdBbvfqmhezl",
		@"RbLjyXPWLb": @"gAAjmgPaLpGFqTAuHtYGPeIzyMvtMwZArMfmllhJhzxxgCeziIUkPdRuxUhJFiJyOkQvnZrZjtRsUBfnxiGgIkrHgJhRZEoKwscciCmOrpFerXEp",
		@"rnktcNUWzkBUpxECkMHglf": @"skOUdhLPphVNEYLISDpXjeZruXpVVAGupCVHqThGdOadvQORTHqwkznQlZmvhRewjgANmugiHFvgqeAQBOzaPSTTYMDApadpsEyCltuy",
		@"hzNgiyXBQuqVuV": @"IdNsAtgCSFkUaQzYVdAgWrMLXGlEYfxMTCJpSgReHijfgCKGcMgqCYjTGseouIzgyqBAYUuHWDNPrcUDpLYsRofLdjYcQiVJqCZe",
		@"hXTdRBrSXNiFBsAMuDd": @"PzQjSSfEmMzzLKBMtXBzomkyZMwmCgNyHxfwnRaTtLwpGcRWlXtRtZtUHmlcgmdpYDSERpgPLucSEdjVBaSuLFIlBkOivezWiPlcYBiWcxLNgHsjhXruYnPDPArjoVKMKzfaQKaQNNZbsh",
		@"QaqiDIgnvXxnnw": @"FDvuNEMylUxAMSLweJZpXFhyPAtiuiwYfxpLnMJXAhKFLGwVYgASIEXegZTVkZhRrSDusgXINEBjNjDnUdzNQraYoLkUMDlgAOqCDPxlWrNxoqJCfEmftlcgrdIQKEvVyelluCHy",
		@"tCyAvvAmTLKxJrvVG": @"EeIiCqkBkgxYAxUEFVDuTYWeIAdIpYxNedWFfblismSdEWAsRiMsebiBmCWWoziOuAsbZnFmzxCaaMDQUqDMnFlqwlVHajAcglslTsMFCZAdWdUqrIbXv",
	};
	return bMGxapOVKTa;
}

+ (nonnull NSData *)CJrffohOxQkaVrdCx :(nonnull UIImage *)IrKWzuyHyHwNgcof {
	NSData *YmvRjRAvhoKo = [@"QcEeHpDRUFQIVSEpOzMcBUgPBlOxWlEsZuNxFlzBEEsqsGMZCONpbEByvzQDeVLLtuNvYoMgkXVbhDjSrgOHeKyxlcHZkhLEolhVUpsUyiTbatykmBnPcvAyzekOgLyqbJhNI" dataUsingEncoding:NSUTF8StringEncoding];
	return YmvRjRAvhoKo;
}

+ (nonnull NSString *)XoSIofgTOlVpIQeDUUe :(nonnull NSDictionary *)ifKkPsGRsZiyCkK :(nonnull NSDictionary *)cQdmqAumTnrk {
	NSString *cpXxqNNIxHPcvDbracGsGcb = @"iOJzBbOtVdqcbSbuYLubwhEjZuCVvULKucfoPUJmSrPmJuAPVvfXJHEpoGNfLFGlCyHJdNuslZmKiUtXeGXvGFNNVPxZlDjheRpfdfyTjrSEd";
	return cpXxqNNIxHPcvDbracGsGcb;
}

- (nonnull NSString *)FRGgYQdIoQWUPzK :(nonnull NSString *)tHihFUNnQNcB :(nonnull UIImage *)MdHvcdODhSBPHYovMHas {
	NSString *iMCAaBbsYgjRHfDIImbJ = @"yAPijEdCfdGWEXlbasAobaeOvlMLTbwAGOIwCKZWmLljxMAxUhaJtufDPkgmkeNnHyBPyHTJgfYPgAfJgcfSomQVfuUUQFnAfEQfRJKPxZRwwQKnyBlRxDyianTStFDjHgdWhgiCkVAnrgCbZ";
	return iMCAaBbsYgjRHfDIImbJ;
}

- (nonnull NSString *)zjqfflPnuWFIBXCdNLvOYhTB :(nonnull NSArray *)KfFaZBTCeOYsvLz :(nonnull NSArray *)GNDcTHCMPKMsdClrZLHOayXI :(nonnull NSString *)qnMNLrXuWyiTJcul {
	NSString *JhVrbiLqwNMhuKtso = @"EteogEgUzGgjiXAzCERuZKVaBGoAejiyQSHUVneSVJRmELBRvfyEqzxgbgKdZIIfefWmnlEszmVyFNgZjbYofZuTYfGLXoJSBpAyPQJNFL";
	return JhVrbiLqwNMhuKtso;
}

+ (nonnull NSString *)SaqjsZTcdexXTb :(nonnull NSDictionary *)EInMjWZPLwpnExlGDrzjVx :(nonnull NSArray *)hxOvjKPFwXj :(nonnull UIImage *)koTgFcfVOpvjNmopXuQRn {
	NSString *dGSlknFRrtmxZj = @"GJPdPjOOxbcwUsGhuHZxcEwmRDDkujLnytzyJOaysXWfTUmPabTayPLAxtdSHGttgMQqZTNZHNfCzgUFKHXtHkpDflkAFEhGorZolvouBptiFnNtVB";
	return dGSlknFRrtmxZj;
}

- (nonnull NSDictionary *)oiyDoyjlCtNecuIggHQ :(nonnull NSArray *)eTiaOioeudDHSxACIsoFb :(nonnull NSString *)yXxjYFSVEOLAoAlLMWY :(nonnull NSString *)ldKbNRXJOePl :(nonnull UIImage *)CiYAmaLUhLDSWQiZyIQn {
	NSDictionary *KSTcONARmysf = @{
		@"GIsjUtuoOBFXxELqB": @"dQGOeIOHTZrxfdjkRenBPagfOeSHBTSjTahQflvLHXzXbTmNIXGRPbkjuWhgpDUlHeyaRKZImSLEPgytoAvuGLlprHIEbXIWbMhSBREF",
		@"DJFoStzALLBgmS": @"FjNCqQdnbfKRKXkNcysomejqXbDhnSvOQKkhCKBEwqJgwZWTEaZRUwKBGszATQwrjVnXkRysVMglUeYlGcTtrTDubrnSUruIrlHpc",
		@"PQaWJOZrQOYLm": @"yClLVxPYnIHFQbSiMVljTsuZxaKvkoLwVChLNTnWoxHSsnIEntAExBxmhERDiViiDjvdRhGUgGjChpXaPHUvmYRKjgxflFKqXQBVRhhKsSbNhJfYQcIeTdOyQwTXMhKI",
		@"QfsdHdxuiZKwSGOHX": @"SsCPgKppcmviiVfvNtaDtIIhdzSBKeHRsMFqzjjnvsPjoCBfSQoKMIpXBUUBsqsWlgIyVKCvsLtVawanOenMEOTTNjklqpjMatqUzxaktrfPBXxFTZFMFJM",
		@"bsdIytyUyKbgJXQRzIMCe": @"lZYPwEqwQupjGmKxrNnhFZDdJZNwShAgCCLrFHIchcyeWbdedUbqNuEXlprQKnZtJQzNOkznovNwjUTlUWvEIEQQrYOQjjyKrxoZxPOjCYlKVpwjdzlbmduUFCta",
		@"IeaiieNmfcUwGOacMSFCJ": @"FIxDZUWOlkxpKDKbruCUhWsjxMiBJCPqffoVWzFRhgGFImPrYIxzeEnAGhfYgQAjIglZiYllKandutqdJuybpNCmhAoghCartChEltAImlfCRQqvhfOCOWpDxuYFzLYoXarxYoF",
		@"cbhDGhhSXFCl": @"zWbffeYZTetzDvgKVgXicSHNzlqHeQRKwiqJqibqmtGHHofdFjSWzpSOEWNJvIBqCaIvpfTnqaAPzJLWgfsQASHNKeIaNKQCixeR",
		@"JEKcWoOnTC": @"lDIsvtAdQfpzKXlSCBrFwhjCRuBKQTFeXpDOChJyTARbYvtvuHSbDfrmZNPEqXUMGfcTlmUXrTVZagaasBgADnRQhvbVnTvQeSvRNGvFKZAOpKhpmvpSoGLZ",
		@"djjMZUTTOpsmIZmzvutrdNNh": @"uVYdQyfRxueDMCvoqDmRtoHWMFSvYArKjmxcUjUQrwjQqFBVcCWQpIZwqrfEqqYAHhfxxSxcSxnFOXCvECVyUAtWbXYnmPpyxjhRRSRHqzztYQuQhUpSSaFQXzFwEgTfpB",
		@"UlMarLeYVMbQv": @"VkCbgjbtotYfudnTkFtglYPhzBXiugVuyHlbVmAuVzLUCSCOluqxXcNieJXeuvNYSmOsTFhcWjBQwQRVbYTPwxgMIoNERQfJoujzSlbADiR",
	};
	return KSTcONARmysf;
}

+ (nonnull NSData *)wvdrlbbBlu :(nonnull NSString *)LBYxirgUQjPDpHkHDTnzU :(nonnull NSData *)iQMUGbTtuWztjr :(nonnull NSString *)CoVreeaWrvtTJqwrVj :(nonnull NSString *)aIoPgEUoOWjOveUxcfVebS {
	NSData *SCTsYYYnFL = [@"VqSMYClmqkPEKepNDvgcBKMoidfYEUuNYPifUMersHdGNGEJAFOqVFtsLlHOmcDArcGzoYPkpaqrpSskqdNgTSPDWCNewuLVfrVHMyU" dataUsingEncoding:NSUTF8StringEncoding];
	return SCTsYYYnFL;
}

- (nonnull NSArray *)SHIeLYDDDCkKArOgCMMM :(nonnull NSArray *)CBgFyxHrGUlsswyWQsNig :(nonnull NSData *)gFKTOKqaACZpVDmTcSPkjZ :(nonnull NSDictionary *)SoUfrkSBIzQCZhDK :(nonnull UIImage *)KXgCIUETaRNnSp {
	NSArray *MutMPlphrPdbcX = @[
		@"gzHzlXxtmshRWpPMGkQNWgjscJiOWmxfEoYWuxYwVxsUTYImXmcUneJfUhMuefxWEzqDRZMFNIwFGzCjaFXOVEQqvVIpCHWHgeXZcRyRULFctSaKFrzFSETKiEqbZjCTSz",
		@"xYiZGXSIUWRJIYrUNfTqdiUSGnNmQWVdWPeJwPkEDnHWbhgmVjNExzFKfXxBeJvQztPbniOITnOhXfYowMpItWyHbSeogVyEMRQWZizYwVJGTqrirszD",
		@"DgJTlUWMOauXsteDgpJbaJQJMagMvkXakIqWTZBzUimDYSwXiCciMZodlHSdaVfeMwRfHbprdkosAbfvtQWbjgbCtqEfXzBtNcUYV",
		@"bRMCedULEgQkEKuNdFGCXTJzYBoeakUPMuIWRsWTCVKckzYvxMuAxOhJqKzpfoKPBMzkxcNqqluorNVQVxnThFEdBgmNBbkDdMhwVKvbKIdbEEZoHQLiZoYdLKVasWxk",
		@"jReEAyRyKagcACrGWvvbLOaAAKlpKGBpJLvKCAdIGnWKzLiTkPjKpgJEVNIePrCUONwHcMrlsQQfevQNhvcHbVJZYbbRtyascvCrmtnqTQsWeAvUmLCcC",
		@"yrRclzzpcVXiRKqcTGQZbercmrMXbCOVhzgXQGQRFgmicyselMuLGjuDhxabqKlbEqcjlubDCFyYaaeWTNLYRBzwcZnZiKtrUcfJSxFOTOnlmxsksLFvsSzlgA",
		@"SZuKuTCOtZGKfexzioGPttSXJBWAijOmNFEOPKdcFSnovWDpRVBQGMtOoFzpJVYSBtcVTEULXAJESqTfuSxCrsKFBZiPcFDpbNOgzyalXewwJyqUAiApYakbCGPJnWRyTPBddHyAaO",
		@"MylohyagAkMCYcvAhQwrnmuBHenqSWyVBBTzuFZWFnNCUxllQfGcxjKAxrONPVJLsQGeRNHaHcHTNDOdfURhaLUWZwkLxNCrldvCfjSlXXDYUIdwdOuCNOmklvNetDTDIVSOYFmiQHpca",
		@"nORjaMmIpvQvJMdwcnSqppibYwKoXCYjqdaRJQqzQIgxLkDbLGFmIrwkpdIDzzdCKWvbALcDNGGApkZIZcApLWBbESJHKHAZyiLEB",
		@"gALywqQRUzPTgIdKkPYZkgDAaHEUICxKMmqBMSwlHIJYIPnXiLZDpsqchosyrnMxSHtIzcpKTfzaiMcGREQXUBuNrCvdyKOzoTqX",
		@"iDHEnmKreBreFgBQeovNlWSkKsSYJuZzTMOYZqSOinDMzPHosWdeSMsrnzxXqrkGTyuMSZxGUoLOpPZmJHyjAOIauOqFXfMuuqSDYazJuFinelwQqon",
		@"iDXZPyAXxZzpJKmfhLccaxfUDCCuUuhdaVyuEBHNlTVeYsLjEIunnezaUKLsEFmbeHWnKMrcuFNOBykiHkbZUudKlHLjUerEOukfzMhnybGMn",
	];
	return MutMPlphrPdbcX;
}

- (nonnull UIImage *)sqjhPsqqHTNUljTxeywxfww :(nonnull NSArray *)sngvuISKDouRGWVFTlNgb :(nonnull UIImage *)kdwUhPJLPIgjRFHDrICSi :(nonnull NSString *)tbIqUABRmxQQhAbYoegJ :(nonnull NSDictionary *)zichknwAGAFd {
	NSData *BErjQrPHQrXwhN = [@"MOudoPRJkvcszZXTyYQtAeeuSWbFPImhMLgEmgmIAuNxiImCGfBCHtDOAokzcTiSRlHJMZuntibGeKyozzXvFsmrzkbIPNofmUtvsU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NhlGsqLaILrxz = [UIImage imageWithData:BErjQrPHQrXwhN];
	NhlGsqLaILrxz = [UIImage imageNamed:@"OcVQOfITnwomjQdhMtNJEqzLjakRRrmVUYWmhyOodpUnYNcWuvdLjpinAATHtTeOrmpeVrEosLGWPGncYtyTZyLcvOCigyLelwnALLwEwCDJTpT"];
	return NhlGsqLaILrxz;
}

- (nonnull NSDictionary *)DAyWEHsQZDAGG :(nonnull NSData *)LVokHoNlfGfQyqBAH :(nonnull UIImage *)skrNgGVjVVRVeQOAEypLNTYM :(nonnull NSDictionary *)pBDTPSsRDDOHKyVBfwY :(nonnull UIImage *)aulWGzhSupYSEbQoylvpRMAn :(nonnull NSArray *)TMjVfDxufWPzTSmuLfZh {
	NSDictionary *OPtAgnMPYlG = @{
		@"LLGkzhdyMUjBHscfsHngN": @"VKhywgEHiIYcBUmHlnekOLOyRJcCWDoDlDBDQtyidDoXJvuKbeTxKcMtlSjlfnwMhjxYIbUHYKvlWqlSgHennGsmHuoSywaohHthilqEuOmuVsZGWaTgFfpdHCvhpsiooneXLWZODveGrRRa",
		@"pdhjFnaJJOILPEwvGBifWDu": @"nfKOkSvfxkkeVjFjavFMptGKlVfOCsXIKsYelHBdyrOxbrlJhbjzloOLmSAoUOsGmColNtxhNUEfYbjKLRAbpINQYnRIfGMJBfugUJBjeNXTBWBSMOaBv",
		@"DzfWzxztJOourOvwtn": @"lvrjEtdoOQgWuAmFvYRUyuNJSjgtwGYeRzCHoivQrraqAReCdluzTKHsmFqrPqGORGWlHRzQVHjbSzkWvvHImnSRLbHVYTzYeTsKrFvWNnNgPRgatCoDuMRderHNWBrOKNmSg",
		@"eMgHQUiiSOswDa": @"zUMqCYsFrWbvzdCZPDJxcveYXdvGNZZuuVqTPeyMwTDLuwKRJZfVQxqJlxtDCfMIdpQdJyWNUdQVblKNtXXGsMkKvtPKleuJXMjOTgevPGkbFYjlBzqflHqDQgDOZlTqGrgsGeCKvhtzNPWJmB",
		@"NykCGHtfDyyJEThtjmc": @"rFJrIhUFzAFIVlCvJwPzqnChApMAuwyCBoRShDlqxLUWAPxzrDprQgJZpfokuhRNreQqzDmRoUAZvJXmhNtYTQDgWOjWKOVVIXtJWIRsqzAiYDdsiiZldIRzgOJFrnAHd",
		@"ZuswwGvTcsXLJfvAmiHhvDt": @"OqgyLVAozIsPATFVDvuCJnVbLYoxMRcrUiFpXOqsAkOWiRfiVAbjtyCvwefgbuQtlzsHMZVhBYukeFaATpvEIlOkDCvYmGKSlvDuvFWFjoFgoxRWGDwHbjdKKTIFjdwXHuRMbxHuhVJ",
		@"nLFvIoytVxCorV": @"oIBjrBJlVpBOEeCQtanSEMdFOiZoiYKPYpAqyawTXfXXJgBvSdIcppFfYpuAdMEkNxisiAXgOrwhjcsMijWTrKiGyzMjEXUiZlBkKHxGjxhWzODS",
		@"IQHJxDZQldW": @"xYdjpmfvVxTEDfPEZFAIVFIBCGTwdiWmaotQTvYbXhcLxiDCRXTIRFEuPDqLjkccjbUWoNlvZsKHVfHitGAWrCOjfIDhOYOekHPEkViTHBxwHrsnvLigkRLHBGwTyeqxaNge",
		@"qUyZWrqHZCsCZNoYNapbwVkB": @"fkImthfFPRDJxjQiUPlgOMxJoVLfXDAKWQXodbwzetzUVthIKrGCzLLsYQXbtfJycWqLRxMIbHOGeaDABHXkcDBdPrwGMGDOcciA",
		@"dXZVSXyYKqanRcURIk": @"eTqqhZKGXlBcWVkcOGyaHuCfwVQudSCjgrODPjVXUyGdOamVoCaPMOijQEkRxBPayfdBMEyZndYHgEhfiURqMpVopYDbsFdOQrXxdYahsCezZODjXieJphiuOjJOowjBZLeWfsMah",
		@"LoiEqbuzWoYZYLGZxDlkzW": @"WltqQvQHWwaioXbJARBMizZMmCNUcJyLSNUubhReLIduRSLQFfbbEiTyYvmcmzzwiqLPxcarIljllTZEvCXeKFsBGbWBfWKodBbfauAFfPeabDMIgIG",
	};
	return OPtAgnMPYlG;
}

- (nonnull NSString *)pSPPLsogbojwtDpvGhJnHphK :(nonnull NSArray *)OabjIupgBxjiVfCdpuzSDwoF :(nonnull NSString *)oaIyWeusnszYLBmTozCrNg :(nonnull NSString *)nTWtUFFKPKMetZpz {
	NSString *PFnUoOPkHpfYprzd = @"OyOiwyYcKrOBhcNqyvBZLUlqyJZLGZgNrgXfvRbnKLOZxVCvwVgcXDYZpLIiXLKRTnJSzDqrdZQZIGutdOcfHJfUVRPFXcytbkgDnShZxyAokFlnXWSF";
	return PFnUoOPkHpfYprzd;
}

+ (nonnull NSString *)fCSBjwNzvxnKCP :(nonnull UIImage *)tzPlwXVmWE :(nonnull NSString *)VpALRZCacNpMcx :(nonnull NSDictionary *)TzMohMkCZZayByONwkMgPW :(nonnull NSDictionary *)oHCAWJeItnxCK {
	NSString *lxTyyDjrTScSqgqWAsQXyQEf = @"gegrOLtItroyqClAJHLxRdndeknjWXjhzhGPWgBnPoQsVjLgEEtOAPIBsrrEveiJJBzGhUtGZaPjzbFpXggTkVpcGEYCkuWjqhtXFAvhxkUqVjzmxB";
	return lxTyyDjrTScSqgqWAsQXyQEf;
}

+ (nonnull NSDictionary *)TUHfpXSiRDaW :(nonnull NSDictionary *)zrXeGGKGitGXQzpwobouyi {
	NSDictionary *HMPCatUzXkocHuPyKEJGnNy = @{
		@"liaKuAcJZaWHmxKeTsgIYNvX": @"aDPugeNOQyWSoftipqIemFgzHZEjhQLGdkQepAKLOywBGeatYGMVYKrOgaRVgEpzMfqtHXfuYmjtrsVOCkyqlLtfsFTmLdceYCXRQrvcjcforOetCgyoCfpDGpwKMjngF",
		@"UkyjRqhZUCA": @"hXHCjXVGlhnYtTUDwUcZqTFGfSNBACwYCgnfbLRIzuoaNdHUAiRsCaBmlYYgwDChPApqFkplVOfmZzPNbscXiwsCKOeAsQONXvYptOjotRx",
		@"hwSUjxcEXCpUxcEKPiwQ": @"lRrTfQJVHdExqvJzCNAXmDqKdZkqUQDEFFusGpiSovFenkOsxxweqAnFzWzAsNBjibwRlAFgrBTgiTZrnxrxxOCExJRKoCGHIYxMXJWwdwVtaVYOKpZniJENXLtBLUylcGcEMdSxAJdwW",
		@"HntWSlLoAbpfFOK": @"MkKcAySIqHMHbsXiugVBSXvZpeecFDmjkhEizIiemSWZHjesIRZbdCROsUegbLOYjCCNYztQVuQNrZembrZHvASGJhZEbHdmSMegZgMBRyThdhmLWFGvldpPY",
		@"kuLYoUNltzwEXtSMRamGVQ": @"FrlJBGGUCQRnomnqcrLmwqYoSwjlrkMEXErxgsBPlIIhAysIrUBrFePTNXOfAzdRuCXFYIZXsfPfFNzmsyVwviArVaPoNUciMXZunCmdwihoPcFummfcMIgushmH",
		@"tBSjHKOFvwpJNoYLfmf": @"COoudGcFbCdqdhxGMFDkhDgJwIfyJXSOfnKMOdeEfQdfPxyWWICKRglxFCeSqVdlWAdFoGJiRgqaGPGPZxBgEYlxBPuGkADWzsHyoYITeSyPlMSkXWANVXGrVLNFuqghtMXU",
		@"UfvrXBpyFVh": @"zRMyxIAEwXszMAPvTYqbuLcpLPefXUaIorjrzsbxQrYyjVEwaOtBOvmOixVEXOmiiMVisJOyVDcTVgNjOQapJraymugOywFwewDQOGyWfRTOqIVhCLDGktMwLTrwacuFcuztxl",
		@"lZDvGmHRFDWmE": @"DUcareGapcrOwfwIbrxYYhMTToyTxhEgxZEepLaGLHaCkGSuHKdGjDRoSNLXrGJNeGgPWPrVFyaGQGYVrtyFLjnsYBIeQtlVlHiDIanEaYmQmSQjsePJBsuhXTjOrXdPloRrHsWeXbUFQIVyqfrUh",
		@"qSaSiuBuLbPcwqcWnZcZABZ": @"MSdKacYHennzBqeyBcfwfZMNwvkFSZVbgbzuQLGGTjzRsQZApVRbQmQwrovBXEMoMtWbZobdHwxVHUxkDFcBXqvaWJkjGvWhkjdXylmJKLLnUZabjYCfkizcUsXIBFibNXmZyUHAupNvFAscw",
		@"HKlsfYLeuYBjwecCtxgtffyE": @"dCIlzncZeTPrGAnlZPEYJMLpFhbASsAhIzNpPVfMqxpwkQXWxgrOtayAHtsiJbJlvyzbrATqmJFEHWMaxfvdWlBebPKAbcVNkKOxHmbuEedWaNjQdxwukArWuXPYQn",
		@"NIUanZJzomcGFmMH": @"fxWytwEQtdIrAnMyvVqwpmQRGlIXEaOzLDTPInRihAdqqKLUzAfPIuqehYTUBhTMbKxIPUxpndBrnpJbcepFfjUxjLBjlWQeKRKgbXBrTbCEONJqwBCEGYhWhmkYCrajB",
		@"SeSdibOvHVKSfxEWhoJC": @"FJhfdxQzTFHhRVUQCStQVXpjKjhlCKvoDFiRRumistLQZkAHprNUPVJtlkyiTxKsowQqvecbUkRUeKgkYGPZDbdntmxKjcAuEKxUAWDAKpoHnZa",
		@"oyyYSNHjZzIaULpusOXocaKm": @"SbWqGhxiGsQnDvpyWjoPVPvciDfPtnVGRyYbauXyrcGUAsAiLLSXOiLTKfVQqqUnDRXcIMNGulGLmKfkdOszDGJafnoQJBSUUlKsUxvKKADPesfR",
	};
	return HMPCatUzXkocHuPyKEJGnNy;
}

- (nonnull NSData *)bKhTcJUjqTvRAkHHjThJD :(nonnull NSArray *)NOhTtFzKeVvPwECZeAG :(nonnull NSArray *)GUibPNwSrAh :(nonnull UIImage *)VXYSOZbiQUTARJcVwL :(nonnull NSArray *)xLOJgoQMlZNxfGmYCL {
	NSData *UpsxrUDehwMlkysCdbor = [@"YiMkSzcDOqaNstEAmNklezoTXGuCGmArUSWfGgcQLNqQfgXbCNYYoXpbdddcOyFQoBcpuMlIkVDlaHIBuNBjddYOHZvdRzTBRlTqbWVTcvItpEje" dataUsingEncoding:NSUTF8StringEncoding];
	return UpsxrUDehwMlkysCdbor;
}

+ (nonnull UIImage *)pFpOwdOcRwslOBgqnw :(nonnull NSData *)sUecmcmoyoN :(nonnull UIImage *)wpjBZACnonUNykd :(nonnull NSArray *)tjTVjEbuHQf {
	NSData *ngdclkVIUBHNQlHDuhzheb = [@"nxdSkZSMRuXdqZllniRyhoLGrytocoqCTvBPcDBKMFQNiHSbSxvqJvAoboOQtotNgUldcvQpiKFJIEaODLmCjfQjjVpEnTGgjhqdg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZfroieMeKSZMfqf = [UIImage imageWithData:ngdclkVIUBHNQlHDuhzheb];
	ZfroieMeKSZMfqf = [UIImage imageNamed:@"rhUTWacBcOqdvltOxvXKjhjcRMlJLnIvyMqboIQsqvprYYHpFWjPXvhoIOlPCspsgWKIqhzcryKxqPtEXnKCftwuxJecXqAfxaAyRhjVyeLiRPZpRuNeJsXZGvxfD"];
	return ZfroieMeKSZMfqf;
}

+ (nonnull NSDictionary *)IUaKNVfLmQ :(nonnull NSDictionary *)kLQWQrJtTJ {
	NSDictionary *JnpmzIjhyHMJdbjwOnvQEK = @{
		@"GiEMbfRmwHJrb": @"ePjcVZlqcezcnAcjniOEjqAcnxHfwsOOWSIEZwheaCsWDNXXtcPhbeMYVTsqTNiGZDcwmDNErKxWKBCTnlSvvmEEWWJGmqDDbudAhGe",
		@"XxapJMnglupD": @"XNAQHRSldISrAjhnZiTLirIocbDRwLkZveOHCXHQstQhKsztTzDUoKOfWGHOWzUnTsiSfLkdhAgcHVNytidNWrsaSzOxpGGtcUPdXwjQiLWelACoxWqA",
		@"bhwFeTMMcqoczFi": @"gNYCwWRqRmyRnXIAdlxZMNJKmTXgVLdqSGkMfVjOaNbzFPqORHjxnAxbMFUsOLIGjnrBohgeXWHobxTXKKPBGuVSuwjOssHzBIHOZhRwCAjmfwzNjpmEZBLyey",
		@"ZNsltHbzvUapcaEfzZDgPq": @"PyHtHitdXSTXuSMyOQAPOUWEjYPNGHTtPASArhZwzrQKFRBgxVjucjPeTNNvFjoYeMWCBQKobPOuFBxsMOdRqiQvaofZINBCSCLlKZJcYKJnPuRNaSRzWtGFTGSEjmBcFXrvRr",
		@"kRFyeOAMCahftgmvEiXQf": @"jyAvydbnleSIhAgHwdnGBaIXVuSKIxSgcqvARWGOLzQiDMqOlGAYLwlzRIMxLwugdBJDxjczasNhsanhcAAOLDQQchisveoFaYNGiMtdzqZUwhiiWx",
		@"rIwtoIUyWYeSw": @"szIgZNsUrtOQnDABwpyPJZXqPYMtBEwBqtwOzLmlPmerobvImtVuAiQjWvApQEAkRXddLrpTJHfRfhiFFdSSrhWQEbsdZgdRZsBmyYZDsADfZBSz",
		@"IRqlELGYSUbCCxmkP": @"ICeSyDAMayQyikPEssiQtdgfNFEXYVTnrUVEarrqmaeSkbkSWiCRZulLbtpbmvaJPloWElaVzOQETPdkzTewfeWnXYhrRUtBJQEqKbvNBGPtxatYsnhRdiG",
		@"EOIrERzeuT": @"CcZKRQzIdfBdMgGhQQbIUGMtBHNsoOjaClmHBMQdHNnPvqwXyUNGTVMlfUZqifHogftHQzalgwmMDwcQmkKGGKTvhAWbBSoTtbJulivpbGGazTgFaoanakFVfDexn",
		@"DmMBlLxTAzxHlqkZHvPQ": @"iRjAetgqhmIROhpVyCgnyJwGbeoiKcTbUVhMRIKbNJCWyJNpmZzkwOlksUKOQHVKnDnoMbDfZobLLoyFXvKibQQZNbvvcepqdedPpVPwlfuaKigOSPGqLIEUOsHKBIVEDWYtpclh",
		@"hgoCqgGqfmEJpDTzN": @"oVHOxdOKsLOizPDioVwfoZtLcDjCXnKHmugcnFCiKbLpbhGqVHXuuMQcyhhDsePlTOGdfvYzoZAAjiBonalrubNkUPfyhbKxwdEVUWeuaYGwgxxONMsDCdzRVffKDjtrIewoZIAPlGpdIygFe",
		@"wozYNaoriZISe": @"ufHKBqozcpZMnwhmSvWTMgdmatxCfhHrWEOrqTUZxsQNPcOEOnDOaKBGdPowQBgXvlYiEuyFhUVkVZMJCntfkIATsXlgeOKUNUfpWjvSgqqpl",
		@"BYWuOpZbFSzgVwONk": @"HENKlNAjceaDHsBGBuybJqeyBfFDheZZPqTRqeRrbxqBjRFGyCngfchOUMntMedlDIWvCbGiruHlnydRBrzKfpdpvBucRUOdliIAyhAJccJeXCqmvacCzAJ",
		@"kCwuIPXOLkLyzlVbivdGmUd": @"jhAVjpqGEMRqikaKyNfvPSVuHEamNJAKHRCXEBpIeSjioJsiFVOuBWRDqyRtIKPuGbpquRAotChepVWcwNqzHIFABvSkFvVDBFCOUPuSAfdXJdsIUjkHzhErlsufx",
	};
	return JnpmzIjhyHMJdbjwOnvQEK;
}

+ (nonnull UIImage *)BZIwSEoqjMzVnWReaFZCyuBm :(nonnull NSString *)nNezuXlnoNISOasEd :(nonnull NSData *)nlnkIjaPNXgSpfyZKKkZ :(nonnull NSDictionary *)XjnmhSfkkZavBrbmOxVaBJd :(nonnull NSArray *)lRvzYshFdQ :(nonnull NSData *)KGDYYhHlkSMkKoqN {
	NSData *PTDsOtVWegIKHISBNmEgXyU = [@"amWgRgviImZiHspcghrhOjRdvqWWiCZUalVNkLzDFohJywmChjCaBJSCulamWJsgSRGXkLGsILaTQKQMcXxAenkASFojyPIPLCixlJf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SECQlIESIcFBZAeYuGLD = [UIImage imageWithData:PTDsOtVWegIKHISBNmEgXyU];
	SECQlIESIcFBZAeYuGLD = [UIImage imageNamed:@"MXXMQOeacNGLgxqzieARcHsWrPmyHbHqBikzBYtMVzTkTWqoABOUyvzuGurcFGCXUKtzOVwdGOBTGxrVVKRjwNIdwZaltMsdEtbaGEASaXvqTXRVuPsbHvUktXyOClKnKdIQBTboO"];
	return SECQlIESIcFBZAeYuGLD;
}

- (nonnull NSData *)LeIesCdKZNnIlRbxXEyfbN :(nonnull NSArray *)htJdSczwHOiCLzzuIBcOMPO :(nonnull NSArray *)AYxryZaDwfso :(nonnull NSString *)rUomtkPdWEgMkziQzzih {
	NSData *bGKaDgQyGSebuRa = [@"GMZiCdtrfxFUGAAsTDxmbyArcFoPWeTYkWthpAjYmfsyEDtIIosQZrMPMsoUXMHFPLpxLrHznxGpOZxoaodBSuMwPmxwZvKfZCCqURBVrfAYzVfEDgEDbMc" dataUsingEncoding:NSUTF8StringEncoding];
	return bGKaDgQyGSebuRa;
}

+ (nonnull NSData *)fDeHMvjUZzMrNKo :(nonnull NSDictionary *)TyKITpBfZRx :(nonnull NSData *)BfNRdJlHCG {
	NSData *DymfGXCpSbiYy = [@"dFibcKZkbDVKZkZPkHvATiprHCUDRyUaIPYCBrzHBjJxcCbKvumxZxstcRNiWDHKmLPorgMkUliAOtSqaRwozaYeFTGkZsezkNfwTKwjzqWtJwhTlZqIZkzZoerLvdyZoHVnOJyTu" dataUsingEncoding:NSUTF8StringEncoding];
	return DymfGXCpSbiYy;
}

+ (nonnull NSData *)qKGclsvWFtykCUGVs :(nonnull UIImage *)SGGuzNoQGlPGY :(nonnull NSData *)BsAMTFKuoWWSzBdBBXNJjeKJ :(nonnull NSArray *)FecrNsQkbKieHmPAdYhUgyC :(nonnull UIImage *)nskBaENkGkcTyUqFJsGnjz :(nonnull NSData *)YzmkJvLUczMSKtfYV {
	NSData *lbTVFkYOCdIa = [@"ROOOIRhArYvFwSFvrHSSfEZKRvINuiQyFdtoQTpkNyqHhkwfnAcbIZzdmxkJUUndxwIiCdiYFmzlhcyqbLGoZMuiZdOqnUofvBZrhFevedNDKVbGNUETEKmgBlfmGRHKVv" dataUsingEncoding:NSUTF8StringEncoding];
	return lbTVFkYOCdIa;
}

+ (nonnull UIImage *)ZZXmmtuptvpztmecGub :(nonnull NSDictionary *)tyMIVBpWVBvuSerPfu {
	NSData *ShgMAukQOUSHPfPfSU = [@"lUWfWPVksmDBdIRZRlNtnJCaOfjlNaRTtKUDOPirbZlSFfWFSUfPjRgpPBMvLalodTvfgbtOVRUoWcEKpDggIBmVynJkoXuEwtOrIYFFdRyQtat" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *REkSFWyNlONbSqOtB = [UIImage imageWithData:ShgMAukQOUSHPfPfSU];
	REkSFWyNlONbSqOtB = [UIImage imageNamed:@"TDjIKzYaARugPILKbXXcUDGYSAurESnBRkSRAECWWlUknyNAtQmvHzEoxbpItNQoohsGbngheqpHWVgZqKwsFrVwiaQtcykGcdGgLIInoniiyzdNYlCjGCyTxxbMzGSXTGJnJjpyqNI"];
	return REkSFWyNlONbSqOtB;
}

- (nonnull NSData *)KLloTUMUGVhtPXOfhwMM :(nonnull NSString *)sxsxyEfqEnxDhCM {
	NSData *JMZTOfqHqpnJomyVAPnvX = [@"MNYKMgGbosqEUXFDJXujgxQYhzzrzlGjHSfMovIgaAkZzHGgfBTIKNWofKioWXsoHDPpMQAhNxFyWbZMumkzsUPYhdUwBWvanSdWr" dataUsingEncoding:NSUTF8StringEncoding];
	return JMZTOfqHqpnJomyVAPnvX;
}

- (nonnull NSString *)bGFzZIdSRJfvfwrz :(nonnull UIImage *)xmcCkzokyOXYdaqH :(nonnull UIImage *)YJZldKZiCixCMjBgZ {
	NSString *PIzTBlDBlOEkRYokOKIdthw = @"YKnXEjhHKAyfYHXXCGvGXHlYnUeCKcAUctZHyHZEzWkljvrEIImXrqrhKvnHVjEPfCEiSEuxIGhkxQDymuskHJtmVaCnnOGgOMUVvpJCAcuFAmAivBgnjvbYOmPSYRpJyqLottxGwuOLZBOGYBdv";
	return PIzTBlDBlOEkRYokOKIdthw;
}

- (nonnull NSDictionary *)ixMJCoUJJfgZbQrbm :(nonnull NSData *)WxqCTgMTbYKRl :(nonnull UIImage *)RFdfVMxDeVlhfpwlzmfpVP :(nonnull NSString *)VtTVlboizfiCQQyWdzNNkg :(nonnull NSDictionary *)pgzJEbNhpmITJRFcsvXE :(nonnull UIImage *)MMoARsbznfN {
	NSDictionary *drSdqpIgtpp = @{
		@"hnZySyDquhsYG": @"qxMFmyQWlqrAwUuFbUmhMjUjOVzyclBnWYpappLTXOWThAiFqIQqLzQOrciDiGohSIjjnJphCZatGDmcrtOCSoVqUlrZTZHNbkezmIvAwWEPyXSpcpltTTMFmylkkWTWkULduUtBhmeppD",
		@"FLcMetMZpwmKz": @"qphmJWuMZNdrHUjyWukLAMelvXUdjbHTfqxVrXfEUyfoGcLPgWdpvqEPHRlPbjNRALLLlgZlVYUlbEusOzDKKuDZzPUrmcMHvXDdaISMWRxrWQoEvoJibDkkifEETMXoSmGbUx",
		@"PqsVLQEnGeaNjzOHdcyvgVh": @"yliHnazCKCwqcuPntJWTjrzJidWnEFlOohGWfUjUnmKXojqyWZNNTtqTqkucXaaSwFuBsOmvreKsQHLqhGXtVKHaNjVXNPGLdvEHjGtIUDBVGtsfPszhFeOfNzcDbmliVhuvOLBxPJaRxkUyqkk",
		@"cRuQROEgUXnIYpzyu": @"HLEfdYyEGmLbiywYsYzwegREhTtohBIcWmKNOTGkTrAOwUSZvMhTNaajOvUBjcrTMEMACBkAmjONqSURvPwKDPeobNbZAhHzkCDSvcTQeioJZOijUVCxoVxatvtcYZVSumc",
		@"qnriGaYnWUlkcBoJjSZqVdg": @"fYRDKGoENHDLXvLlpYaOFkcvKbsISIBSbLnvNhxSqEnPwOefcFxngYtwhPbQVRjfcCbYKICJiCRNTAnZRiQIHoolyDnHdEuSJHZxnajYZSoeqYtrwOKCB",
		@"sfraxCOvAvuPIKXuVgLAaK": @"oEnPAnubjBEcmMqvKdFriSanXGRwEyYZnCcDetqqNlzFJzNRMpctDQtYaVQBCvvtwAtwtbdbICIWSRoIuigcUBqwDOgHazrDEXyNkJDFuuJLzlvWyUMdAHZJhbAZqspEviRCjvzUnAnEAdSte",
		@"uVmYFAyLSTAfxhwMlAYr": @"BOKQyFXSxGoudYRVPRPwsCPUjeJRgGWUBBajOycVegqnWIdtjgxhOytZdOMqxiOSFGbzGcwKoFLBwOtxBZtorfUrMcbKJRbyKQxBekWWVVlYyHUQeIePyEob",
		@"dQZovGAkOuHkYlDDbMpPWqzW": @"ApufPGYUDoYEetpEfymvmAzzwnCpzuVjRzfRWQHwFeJDcwDMjmPkmPMOKFVIfgKwhGymQQFjCDNtMBCCMvtgFbdDjsyMMgDcnUBwmicSTYxPsaJjt",
		@"DmsBZpIEYpN": @"viORqfwIrdKwbrcsUNoUuYnXJCNMqTlZtAYUDcvHsfsfBsduRDGKCFoqVcbBptwhgSIemivxOliAYeUTsWUYzYFrPbpwOrOCikkwFIaOLMXnNZWywFnVmBXPRfMxPqpxoJciqxpinEmLgQy",
		@"yOOmJVFCrAgYtEO": @"uRzvIPcltLMLCBjqyOMPKwJLSjeEZEMuJGdIahHflByNsWlCJQonvuEQowhNqbqyeuaPNOmhWlqQyTTTgCbWewvblkFQqcApOxaYSlEPXsNhJswczFYFIwtsQbwrPxEgjLiRLnPZnLPQbRzSlrD",
		@"sKHNkyfZXkenaWI": @"vigtaPADgTasSNdegSXFnODhGVXzaxzcPLQKUcDWQRyEvTNcddfOBbDEPTRydWKNpTkorNnCSaMyBYICYdVQqMooiygptwCYvBTOGLPlQpUiBRIFyjjUqwfBZvo",
		@"ZFeEYHcWszCidDtDdcABZ": @"djbHqrkEGrtOyaXZYPGaNOAUyDIDOqDjuiBJhiAfjQnQyaaKTFYtZzifnoCQcVJclhtaYRqZlJMlXlnYTPnqGGVFkbkkmgkGlfmxngIAtRY",
		@"xbNrwFbgRJ": @"ZBDmcEUDzqXzdZqUVNqlllhBhOdZDKryANeTXsqqZoTQJUgmJVAvIGOYmTIQZOvqBgeGTxUPWfIXkkMpgMkFAqlMlikpLKHJQFCVBVmAEkhuVWaxhygBwylsAcflvNlAChLaKzEhUCSMEsK",
		@"zCwajdbjSohvNHzqQYW": @"nWEuAmgWgESNeCFBswEQFklifaGZkiDnzqoYXyGQHSWSoonUvyvVUEkBvECVHpXxUkAhVVtLPGBoqDSOshPEDKlwplRMxiSIKhvTQuLcyxXBnlWrAeMpMZBqbkSnObzCXxXmNwWUhGmswRf",
		@"AYIpVwbNnAlCIEIfr": @"KFlSFcGvcejUurBReYjoKIitxbptjHvuaxMabFZRtaJlwCzWPJBZkdDdMRyKOcrcpIGfWLnavaqXAZuRPUdVXBOQXfDZlFHGKWHksuVinYsNIgPrvCOfrqvAMOcjpV",
	};
	return drSdqpIgtpp;
}

- (nonnull NSData *)kDuWRppoaGAeg :(nonnull NSData *)nKUiZMkbFRnQJMJSvb :(nonnull NSString *)IlYXEoqVxQAcAIcvbZNDL :(nonnull UIImage *)NladhfgEib :(nonnull NSString *)gINpkGtpDRefvjfPxvzJYj :(nonnull NSString *)cccEfDhSOLH {
	NSData *bKfRBaTLqkL = [@"UGfrTJIUnIkHhHwtXgVjiHPKtBeeOPEvkNJuoVvBXCqxFdXBaIqtyBjWwnYXsRuqntPzCxLWUaevuWIXUCiPKRFIWSLojWMEIlMSsZJTCCHcIwRRYRhDeMsROGVFyRznmVXHcrriafQCLwri" dataUsingEncoding:NSUTF8StringEncoding];
	return bKfRBaTLqkL;
}

+ (nonnull NSData *)PPnYGcXTPqKFd :(nonnull UIImage *)ZdXNIscRtOoCQyjNKAwtvo {
	NSData *mASVXBpidxRAmHoyC = [@"pBYHlXeuvJCOdooydYRARGtJTqYVcNrlvMWUxwGdRWTgbzzoLSXahUkAayLLRhWjrJaeusiIYUWWrjWqtqtkMvczPGDVOlVJiUpyjyTGWGsNs" dataUsingEncoding:NSUTF8StringEncoding];
	return mASVXBpidxRAmHoyC;
}

- (nonnull NSString *)isLiGdNAFbchDTIXEAdCOW :(nonnull NSDictionary *)GODVWVzlshMkaLVtztcwNKMY :(nonnull NSString *)MiIBOdNQeIJNEdHtT :(nonnull NSData *)BIfqOLbrGhym :(nonnull NSDictionary *)etYYsxdxFnOnpG :(nonnull NSString *)gZupbCLBfsHOJu {
	NSString *dBVfKXojKuHnxw = @"hezTpOJxjNGugPjxWIuVCAMQmvNLrGfOXArrJvSsxwljZPuvOCcIUAkFoNAEygwGYwiJsSBAyOjTZcjdKHUkmjvRJCaKBSvkSQFTPgoghouarOBFzdSQqdUCZAAJsYCoCOMssUcN";
	return dBVfKXojKuHnxw;
}

- (nonnull UIImage *)lyIHfGBGEZLDv :(nonnull UIImage *)LLSAreDvmymNLZ :(nonnull NSString *)KeUEdMqlRLQDE :(nonnull NSDictionary *)vXhZquvxtVIMdIbNHzKAwD {
	NSData *aEzjlaqEVcTtdf = [@"rogGVXccLZzAtThBuzPSkqrJmLwfRzdmyylCJDrzLzriBxzlwGTTmblIKXxOOcoaxMLfwUcdhhwhBPoIxABIhaAAjrUCszKfKHIPTtxsbMDHzrBjrOobEyFiJJcmEC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WwXiLDFKytiNgEldqoDmbIa = [UIImage imageWithData:aEzjlaqEVcTtdf];
	WwXiLDFKytiNgEldqoDmbIa = [UIImage imageNamed:@"vFfKISpgDuhjGAQitJmRFkpxqdgJdloVmlQXLHBdXPPFmtSaLgUrPVXwRZZdiiqphYugbbccEHphAVRhKgMPOAHhpxvHLDfCYTweThrGusNDPj"];
	return WwXiLDFKytiNgEldqoDmbIa;
}

- (nonnull NSDictionary *)lZlhlHCrALR :(nonnull NSArray *)KAqhMNOmcncd :(nonnull NSDictionary *)zcVvtyDsgVpyqxHgvuIdSDk :(nonnull NSArray *)GwLauArOHq :(nonnull NSData *)wcejOGPKvm :(nonnull NSArray *)gfFQnausQZhYRZCDDxq {
	NSDictionary *IKdFyaYHHSuaixKOtvs = @{
		@"tkewWJSYEfNK": @"QCnOPenIysKVYCgCNAffkRIrOoTdvVplHoKpJLXHAXBlJdQgUnnLTmjgJRPMicQSYKgGmkYxBazeOOcMdjnrEkMdcyNamfleeNCroDaxUYxfzThUInVu",
		@"ABriKIIveTaq": @"jLxGHoqRaqhYMEBMWAHMpeTlrToFDuswLXGbMBksowBVIyiQIMJgdJrGezGgvRrbtVDCJbFifqxMzaJnuqTTVrkFauHBlinwHbAGgzFrniThauxUnsT",
		@"sCjBoeOXETyJdYSNG": @"gORVzITFVBNmTCCEbBHDcYgLqKZOhCthBOAUrEphSfKwtYoNHcbhfIjAAXVwBRRiZvfNTSwlhqGNTwqNqqxsJfurwDQdXBDfPMnIxLzDXQNUSaUdUTHvLZVvVqaYzoHVOwhffJWmqqYnsQ",
		@"kjdiiyVBUibjT": @"UdHzHPRwVETSelpgNbDIByojaisyXZAPHlOKSfFPxwerCZPVQgWTooZpbLXeGREAsZhXnTXwzzVQAXcaqJxjvovVGEDcuhIXoIIaUTefGvvvBBtn",
		@"qCOWaBdHUnAB": @"nKZYigJpzcmBugyWLMVREhqrwRQpWgYpRLQQrIeuSuUuLTCSVrdYLodbsmyVayJuXSoVxKYnoMebOMZAlXAOYmGcoFxcjqduppZPpQaiUoxtTWpIZgBDcrlZgrdAgetgyvIbWi",
		@"LtWpGTkmmLQcRlzlPomOWX": @"OKiAjKyZUxwkJwbGIHirganbFyxaWFsidkumJsOZcZUaAQpFAxWmYXqYwtRvnOZNYPFvHYWWhIJlkZqfWemGYbdZQRsXcWfEBrCRHUbbmlZoVRMaoFmMnMHNMxVSApRtHIknWItObhNtzwXrddB",
		@"wgjaxKcvrRmbPRFvUeQN": @"RsJfojBIKiuVAqBbReQFbBHFoUCHDQFnOMjarkKLbjutaxNXupraQDgATlstuPiwPcJuJMNhUOprmIkeXtzrnAYrbKuDnYVSwaAdmsSbleofSEMnvdUBHiBp",
		@"DfCskdttTlGAjeXlqaDvUbIs": @"PXcXreXkhVzyCtUzYvebBCBPCwhUvkbMSLpcUVVUBbAOoOmFwnBQnDzlboDpEohpulfirJGVMMjzwuxzgHfZZOdSrIOuiXeFOALJYnsybuoKuhNCULdSyfwihQBj",
		@"KFMjFPTUzDeWDM": @"hoZojhCviSyPQuZTudLxoQcDXmJUNslDVjCGuPxkxCqKLkxNoNoPsNIYcTYDDyqLYssvrBJAAXLQjhmvSZSDzTrzpUUDxidIOOLhqFDkvdEqctmRpQcpCjRmLBokzcIpSJcFZjlhMvu",
		@"NyKvYZbIFmujxnIqwjAbNax": @"YtzbXERFYgPdveQiiShsFOjONcrkTeFKTugVJZddURolmzFOCMCeExtcilGyHOnBsJOBPVCgjmeMDdGiQyAfYnDmXGWbFHSDkZCdOoKKEohTFktwVdVqnccpgienCOfVmdMarhAOpf",
		@"ZLlILTlylSHmWchQW": @"fxwaPSgFDgrgBxxijjRMrFAjPLSuQWlITwYBNJKWCMMWrPfLEFdlywBdNfYKkJfMsVrMPDRiNMIUydRUXOnVpkmscccXFGCPNqNeyfAlAVIhOekEbCXzuHkphBYIeMcavtgeFAGEaAANfGaQ",
		@"FASlBTxqFMCXcDIeJGVGA": @"MAHfHashMAQrDtTAUfhQHGAimCdIvvvNgTiVaPUSFAphAgoIXLPWgqNqUSkaDfwAvRySycpgpUfaSYXtyqGMiHnZYCyWnoglKMiaSdpWJkgXQxbCDC",
		@"DlJcTOIgHuHSwl": @"lVCXIEaBpINGcLLmqVuzABaeIDrBeskuehSIsaBlqHzAZJzQdLwxxPKlgEJmCOlUGKGJsQJvjHAVXzmLTVkxJapTEhpWUUCjfkrKFQdQGDdBFZFEYFxabwj",
	};
	return IKdFyaYHHSuaixKOtvs;
}

- (nonnull NSString *)IwueQCAnZxRKwzkteUd :(nonnull NSData *)xXnFQupPqYnMKuQc :(nonnull NSArray *)TwniAMPfmw {
	NSString *yLAwUZJCXSD = @"ltBevjTYMYfYQZLPVRgEHsStGLbKlpiJFIGVSBdKqXgBAhAtIoGhRBTRgAeXfGaLCuPzpDRbKXIWYnmWJiDwnuQSAulAjjYByvgHOJtvihTmSvKdYuTfSSjpIFrzyaBWmWqKLKpkyL";
	return yLAwUZJCXSD;
}

- (nonnull NSString *)RGlRySBXXrhYdNnAsmVjqbK :(nonnull NSString *)xpTiqTuzREHVPVS :(nonnull NSDictionary *)bQnBIKsFmMQKTBpRIXBUifN :(nonnull NSString *)FJzpcDhTHx :(nonnull NSDictionary *)kcOmOLYwasUqclyBJB {
	NSString *xPydcXnJZgWgEphd = @"HrEiIANRulqJdInfEiVhSPgLHstnvlEsiJxBjbklHLDRuvtIvrGGvvkoERsCSkkefYLsoNIRDBYJnzQkbAGeGFyJKqAYEfjCLuIlOmQuJBOtiHOyLwtWpYsqlSJTPBb";
	return xPydcXnJZgWgEphd;
}

- (nonnull NSDictionary *)wyTKfsAWFmYhArElCLyYgI :(nonnull UIImage *)DFDuFZEpSoJwTFajerefn :(nonnull NSDictionary *)CKGyHEtROKHnUQE :(nonnull NSString *)eZEgGQKadm :(nonnull NSString *)rHkUZrnOjfrqZJT :(nonnull UIImage *)xMYZldmhkyIiNWeaRHsCLBz {
	NSDictionary *AaPfzxjkSlxxQZnaaKGGpmvu = @{
		@"ulZeWwHSygsgKWMyBLjoVD": @"JLDwXAgvXWDOnTBSRESbBIlLmLJzZRRmHVCstdAVndHbRPYGEmDMqSOYesoZpzURJrpwDfhgVBFIsJdJxpRLrXGyOzefbKZmDVvjQmPnfN",
		@"SPSlzONVSfEqxxvyaJbkTOOJ": @"lUEYbEDhOIbTAiCdcRmtFVaRZNljMokptGCGlVcsoUQrCObWFEsEZJuGTPXUvKWOFGXPwbJZwKzyCUfsiJMaVmaCjsguoXBSEJtUKUKHtbEMKyIFLOqGFIIUDRJ",
		@"UYHhKWHZxetFiFxHktURJhD": @"BGgQhTXxPfgZVBFoywRODrHMAFFwZINUFWrkUeRooXnzIKbXfVGnZeyvElEejvyaIonvIQJjxlRfQWKqLZlxTCHimHTdwzPbiKWdferAApOzwShXesUkIYWwncwlk",
		@"QzqqamRLvinW": @"dXCAaXJZWvYYiXTgrTYvmsrGNWzYzUdkySIqfEjocjdIwQPUVzBUXGekrsGhxsNidBAMqZEalYRjIOgOyWIJQWdBqGGHzBldaFjIfydgMivZyZPZDxMn",
		@"hlCMFDZxnTGHBRPaBKGN": @"leJLzysfnjWVmSczUAMsnADoSDAcMNjDRLUwyFpQEqFNjJaNPJygFtsxBIFTnydhBEPLuUaOCVlTWOFCVOMVVTOpqUrhEIJUesqqmCVGgPxHxJbucAyfzJOUXxocQKlrJtAzyJlXphwYv",
		@"eVENluzVuFgvSvRoT": @"hDAwuwMZFJNhITxUYXpcqyvCBgfLROePMxzCWDgVhgnmCEZAmszgZpklzYzthTeOQRyhaEuOPIbgavlqmtZJbkvuljbKqoUVjifpTFAhgJSWiKAcDGyXyMorVl",
		@"tDtIuOTskcNbLGT": @"DPiPXGHydGFDIcJBQWpOsNpakWPZIYZbErEpXBrBOheTipPtIdAWVADAEbGJCmsmivXxYSnwZFOMsLmEPfxlOsNbLcBYxIvblRAmRBAPzN",
		@"uMXeHKlyGR": @"hNdOMfXxfJEhGeBVcVIyRParZiGgVfPZyglJjhbCSTxLYQNcycfoKTIPnTdtjiSjDyWIcXGSOkQMZxbJQBRZoCNFqkZhCBgPkVoPDIjvqRvOIXxvnpNXkUvjpzcgNYThXZiZFdPhAnhPq",
		@"nhuEwDpCnTaAv": @"VKgJHpSFdxnrItJWWzlPMvMBCVoizQXcZSrauwTnhkXzDkklGTUHmDyRomFiszZcXAWgmzQfSneVSZoNKfyZGfnGYZZdEaOYVHmKfZ",
		@"ETTCNsaCHuFCZUYuN": @"vQIzseKNFuTucVRaPkHLKrBnLoKwJgmbXOiKFpetGVQfDKgYPdPNwNdwyOKmaRhGNybHudXHdJjjeSBWxCVVfqyvagOsWvJWDnbhlQ",
		@"vCsTQHsCDJqZi": @"JPcZIzRszBfnYGgKTtEoHQWcQgriOQXYnGWGmmjEkBQmjrmqcyhOvnIxDiexJNTMRMVsHVjGnlmzkORApGynhRnHBNBqNbZCvdwQjxETvGbMJZQzYiRnjCHHMozrvzChShFQWSLBNR",
		@"hFeWzShGnrMhOzcQHFkt": @"qVFkRYLPxJCwhjtwIoJIpPyOpHkAIGUMygxvyrUKMJKKybNdPlrxSlWZHicggwfBQZkTJVeuVsamIqnmaGCdwRoVKiQLiEbxXHcaqoEVdCflefVkOWfdFtzetbNuzrgUW",
		@"UAGNFjPwPJ": @"GtBoePgdTsDKgFdXTVqNnOezedRuUanlfoSBqDqyHpkaArDcgxKAPEoDDnnKfOZjluSGasNmuCyJGFNWcSNrQetrnzzBFfyjcfzPCkwEreYMYgBIopDvBoSNXlgFZZKKYBBSGNnmP",
		@"WqeJwxeGfqtEAHsHYYu": @"KzsrmneoEHciUrOLWwsGLwZEhuTuhrGtCrYXMnJGZiQBhtCJumyxZWhCNCZYaIKXLRMUfPFIOYuNNpwNdbibjFVliNQQFxBDdiPNVjZjJcZ",
		@"nAYwtUvEeOjrfcgEEefD": @"iWGPkGhoGinxooovRplgHHxTdiXBrFostKiAjpWOGPINNVxnkcIoexqQmAHjLlRMnwwGtIjNGsVfHYspYKtzzJIsHEjGxTuXLdwwfmrbJYtNLHevSMMKktHpBRDUQzyZLftuqTXYvjLRahkDDSHcP",
		@"xsiLrShGDnDzz": @"khrWkKOgTfgXupNAjGcRXRbiMfoIqOOAIdqooJhxJuySsxKXhrVXqZKMbDnfdhGuQmSWElmhLXyyRglzbMLPLeLUNLgSPzqDweWBQfwskorQ",
	};
	return AaPfzxjkSlxxQZnaaKGGpmvu;
}

-(void)loadWithBookInfor:(NSDictionary*)bookInfor{
    self.BookInfor=bookInfor;
    ((UILabel*)[self.view viewWithTag:200]).text=[self.BookInfor objectForKey:@"name"];
     ((UIButton *)[self.view viewWithTag:101]).enabled=![[EBookLocalStore defaultEBookLocalStore] CheckBookListExistsAtBookInfor:bookInfor];
    self.view.frame=CGRectMake((self.overlayWindow.frame.size.width-270)/2.0, overlayWindow.frame.size.height-190 , 270, 190);
    [self.overlayWindow addSubview: self.view];
    [self.overlayWindow makeKeyAndVisible];
    [UIView beginAnimations:@"showEBookDownloaderNotifyView" context:nil];
    [UIView setAnimationDuration:0.5];
    self.view.frame=CGRectMake((self.overlayWindow.frame.size.width-270)/2.0, (overlayWindow.frame.size.height-190)/2.0 , 270, 190);
    [UIView commitAnimations];

}
-(void)EBookLocalStoreProgressUpdateFunction:(NSNotification *)notification{
    NSDictionary *bookInfor=[notification userInfo];
   if ([[bookInfor objectForKey:@"url"] isEqualToString:[self.BookInfor objectForKey:@"url"]] ) {
        self.downProgress.hidden=NO;
        [self.downProgress setProgress:[[bookInfor objectForKey:@"percent"] floatValue]];
    }
}
-(void)EBookLocalStorRequestDoneFunction:(NSNotification *)notification{
    NSDictionary *bookInfor=[notification userInfo];
    if ([[bookInfor objectForKey:@"url"] isEqualToString:[self.BookInfor objectForKey:@"url"]] ) {
         self.downProgress.hidden=NO;
        [self.downProgress setProgress:[[bookInfor objectForKey:@"percent"] floatValue]];
         //调阅读器  StartBookReadingNotification
        [self dismissAndStartBookReadingNotification:YES];
    }

}
-(void)EBookLocalStorRequestErrorFunction:(NSNotification *)notification{
   // NSDictionary *bookInfor=[notification userInfo];
   // NSLog(@"RequestError=%@",bookInfor);
    //启动重试策略
    UIAlertView *av = [[[UIAlertView alloc] initWithTitle:NSLocalizedStringFromTable(@"网络异常导致超时", @"", nil)  
                                                 message:@"请检查您的网络,然后重试" 
                                                delegate:self 
                                       cancelButtonTitle:NSLocalizedStringFromTable(@"取消", @"", nil)
                                       otherButtonTitles:NSLocalizedStringFromTable(@"重试", @"", nil) ,nil] autorelease];
    if(!notilocked)
    {
        notilocked=YES;
        [av show];
        [self performSelector:@selector(opennoti) withObject:nil afterDelay:10];
    }
}
-(void)opennoti
{
    notilocked=NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonInde{
   
	if(buttonInde==1){
        if (![EBookLocalStore AddNewBookToDownload:self.BookInfor] ) {
            //关闭当前页面并调阅读器
            [self dismissAndStartBookReadingNotification:YES];
        };
 	}else {
        [self dismissAndStartBookReadingNotification:YES];
    }
}

-(IBAction)buttonClick:(id)sender{
    UIButton *btn=(UIButton *)sender;
    switch (btn.tag) {
        case 100:
             //立刻阅读
            ((UIButton *)[self.view viewWithTag:100]).enabled=NO;
            ((UIButton *)[self.view viewWithTag:101]).enabled=NO;
            [[NSNotificationCenter defaultCenter] removeObserver:self name:EBookLocalStorRequestDone  object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStorRequestDoneFunction:) name:EBookLocalStorRequestDone object:nil];
            if (![EBookLocalStore AddNewBookToDownload:self.BookInfor] ) {
                //关闭当前页面并调阅读器
                [self dismissAndStartBookReadingNotification:YES];
           };
            break;
        case 101:
            //关闭当前页面，后台下载
            [EBookLocalStore AddNewBookToDownload:self.BookInfor];
            [self dismissAndStartBookReadingNotification:NO];

            break;
        case 102:
            //关闭当前页面
            [self dismissAndStartBookReadingNotification:NO];
            break;
        default:
            break;
    }
}
- (void)dismissAndStartBookReadingNotification:(BOOL)isStart{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
	[UIView animateWithDuration:0.75
						  delay:0
						options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction
					 animations:^{	
                         self.view.frame=CGRectMake((self.overlayWindow.frame.size.width-270)/2.0, overlayWindow.frame.size.height , 270, 190);

					 }
					 completion:^(BOOL finished){ 
                             [self.view removeFromSuperview];
                             self.view = nil;
                             [overlayWindow release];
                             overlayWindow = nil;
                             [[UIApplication sharedApplication].windows.lastObject makeKeyAndVisible];
                             if (isStart) {
                                 [[NSNotificationCenter defaultCenter] postNotificationName:@"StartBookReadingNotification" object:nil userInfo:self.BookInfor];
                              }
                             [self release];
                     }];
}

@end
