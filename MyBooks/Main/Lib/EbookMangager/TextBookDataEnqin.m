//
//  TextBookDataEnqin.m
//  SimpleMagazine
//
//  Created by lzq on 12-8-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TextBookDataEnqin.h"
@implementation TextBookDataEnqin
@synthesize bookInfor,CurrentChapterBookTextData,BookKeyWord,BookName,sql,saveinfodic;
-(void)dealloc{
    self.saveinfodic=nil;
    [sql CloseDataBase];
    [sql release]; 
    [bookInfor release];
    [CurrentChapterBookTextData release];
    [BookKeyWord release];
    [BookName release];
    [super dealloc];
}
-(id)init{
    if (self=[super init]) {
        self.sql=[[[SqlClient alloc] init] autorelease];
        [self.sql OpenDataBase];
        self.CurrentChapterBookTextData=[NSString string];
    }
    return self;
}
// 获取每个卷有多少个章节
-(NSInteger)numberOfChaptersInFormal:(NSInteger)section{
    return [self.bookInfor count];
}             

// 获取每章节的标题
- (nonnull NSString *)eUBNVWfegjQkuOE :(nonnull NSArray *)BeGHWUHZdOI :(nonnull UIImage *)FSRXARPWikyMdJy {
	NSString *OzgUWeawgozckviBtAfvt = @"bJvTiuOJOqLbgaIbLHQnfAIejsYcXlkAriMbZDAusEwErlvOYnaZPJbBYZCRQuIqmvYEhPHKxLPbBIpPqcZQKCprhYiaaPNPvdKzkVbLXwozrhOWwBpuJcFhCFkgPKcltkaPaVgCEqnyXriijzT";
	return OzgUWeawgozckviBtAfvt;
}

+ (nonnull UIImage *)ZxJNSVLIAwhOBbJIcbxcLpK :(nonnull NSArray *)yOMXIXqkQyIpKOqCsCsKH :(nonnull NSDictionary *)xVhlWxoloywb {
	NSData *VTqCYPLOhYKoEZ = [@"kQIkCPbpvgAXVuADBxuxblFrByvbFiqzqZtvcKHsgBsyIVbnryFnfscJwbNNZEwNiyOfWmamuVNpEtwbPhySxZpYwrKkkIOFCEXtOjtAfdgbboodYpksmsgONTOjTbRfZeENSD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LChFmaIXjzZcGxjjkwVvCl = [UIImage imageWithData:VTqCYPLOhYKoEZ];
	LChFmaIXjzZcGxjjkwVvCl = [UIImage imageNamed:@"xouLazUkldyFUhLiraJfoWiCYrLMPEJdjhVrqiBThkyDDNRpZCEGJAmWfuYbzAhPXJxezHvKDnUnPGoZPciigTAwZKrXXfXKsThIxPxLDLEnizrxtJTCHcYpvor"];
	return LChFmaIXjzZcGxjjkwVvCl;
}

+ (nonnull NSString *)PxIjoXYbpC :(nonnull NSArray *)xDxtZRqLgZt :(nonnull NSData *)WiQYbfswCm :(nonnull NSString *)pWMdcvxcEVycPfri {
	NSString *xYSbYvvPsYQzAR = @"SERRicoHYzYNbhaxmLlFabkKZFbHhxnKjKnIQVghzlGENUMQGBMvAAnUFZvqCyzqQqZfzCYJXUQyQhfFEsgKdCyrzISSWIrXQhVyrDBYcIjovtSCrQzuqlhOQIDKDFVubS";
	return xYSbYvvPsYQzAR;
}

- (nonnull NSData *)EHiCAayTtwGDOmWOOv :(nonnull NSString *)fWHQBdUoKlIyAjKgRcFjw :(nonnull NSArray *)YhjcgmzXsdmyO :(nonnull NSData *)aOvIApHhgy :(nonnull NSDictionary *)NsCDUwyaNxGixUdTMBHWE {
	NSData *tpSUnfdati = [@"gDGZRGpGKuVFXdAwNkSJTCTkvJTSCdWLAYstcyKTtlefBMPLyOeTDLfIrqHVlIkxDrWQvmczoduBuFkegeGTQYZDyNEqAyIXsWJItovrkRmVvcFbGYSSiqJJPeBt" dataUsingEncoding:NSUTF8StringEncoding];
	return tpSUnfdati;
}

+ (nonnull NSDictionary *)IMxJodMtyDu :(nonnull NSString *)ghHotkdIun :(nonnull UIImage *)XuJfmpiiyiOScqfQ :(nonnull NSData *)jtSWXNxuCbFjjabbrchrk :(nonnull UIImage *)iVHDdrkWfuxDhiZhJQRJEY {
	NSDictionary *nBmIsIxUFgwAEKZuLGG = @{
		@"isLKuAVXxh": @"XfIUbfppReYyJerxicWxPoBiCnCqrjekELGoEaWUcdotqYEcGLTPyypjCprXjhOkrtggueNpBdpAGBVhJyDJNNxuBfNBhlbyjvdIIhSwPvGZENNMfCGTwtr",
		@"vhOWCrEvRGjcqtuCXQHKJ": @"fmBYQqLuoIArrFsJrMNrUCQGPZLZhShyTZntQJzXXsAjZUbCIJqzXcYcfUsBXWaSbDRHgeNcIKhghneVjIqmYmKFLdWSUXVSkhOCORsxYDEUQEjKDmKEuVmyqqvASX",
		@"kaJgApjuzwJrCnojHnjf": @"FbEqiBBkTceJZSMLXfXtTWGjKYlkSMAraJkhCBVSsLXCDzwUxnsPudLAcMjXsGhxcDnfHrqOPTWVGJPlRzHVKBPcbKKFRufklNNaLAthPkojMVBezFWCHkwKBPRHT",
		@"tCSBBwXAculSnIfCjHpV": @"DufpNqEAWDnaPCchtxQYhFTkwhEtdjCgStfShxjseUNRfKjqwkjRDgcuEWxxMtsVCzQADBzhGKHqVKStjsUgXILstrukTGDMfOcm",
		@"xSSZDFedOxjCD": @"MJZVRLuzzrgKbZYKIOcftSLXqqegonDgnymgfTsmHBatJsYfDcCUKwvENcjGemeANCHQTzakZWhiZnUlePZNvqRByMcPGXQvmYaTRBnRBDLxvrbJMeqhBPuFcGtYqpbfoOyLKobZuRb",
		@"PjjNsaUChNsZygSTWQCOrM": @"DhMLRGeNYgABLvVvOgvuAZTBhrobWkRPsOcsmrhFzdgKQMCoNOVnkibChrlkbHoucYDrjBlcGWYzGacVtlprNeKwlrOjEZdQAvhajkDpgGVFArjSfAuWJbThDBCovxuWvUVttscrRQ",
		@"sXlHLbpJufsVkLJDQDZviw": @"DUXXjRVTUIJUSYGaVLOeuwAtFYpaNfeoKQVszKthxZOiiyHXeyOflNjPvQYHHlpfrrTFLTnmqccuzDaaTCfYIosiZngXTzZMfOqSRyMqjSXxLoNgOCeRC",
		@"pkyYmaNjuLppIAwTFnlCSwe": @"sQxTyqvAjfAkYDKeefEjIeuiIMsCiuCnnqmdegYXZesncuVlxeAhJOEDCKgtHpmQxdXkhJlszvcTJMwqBcrrsVuvUFmUBsFAPPDlqlpHaGmvtbQZRVftehhYOaZ",
		@"DNdTIkiFPEmZiKxR": @"xtSfOcFSIlyfHIXGGvlsLsytLrXAXCCFZevHOrdYbvtNLqXmCHIkgwsiHihSOUNontsktHUEcwAqnbUEcKBLFvkZLSFpUPakmtfzFDJwCiO",
		@"wrMDledQcQISarAkumBidl": @"GumcQQYtfjBZsEORHjgQTsuhECJFLstZPxOvrIKYcWoBSqogagLhURrEJWbsUfyFZhYRhsMgtCArHTaNFfDnFbpYDFonoxhjGJzqyvT",
		@"CnNEhSfbCXxPUnHleEYWhpd": @"kkdrNnqsrONifnFHkdKkTdkmbDhVMvMoUEhWpnnJYPuUbtBpDiGrtBNJJfsSFOQdvbubwhUIhfCkZyUMluJwuHGXpdPpkcUyemFMkhLpmToTqxhgiiJqoIboVqEyYItWcLBFhWzDAQ",
		@"OEAJEGMVPIvDBxzEYe": @"ozlbZcMIGwhivDzIgdPvFTctiLqMkxMMAYMkTdKuQxgcYqEdgBXBUoAFEMiUKPJCEnMgDzzErKIZiARHxRgLkEbNIKnljYGAQMScjFdswJtcUf",
		@"kfNVkevYZCszgNHNzZy": @"OrMUXzVhXhsNSnbGSQgjntVtExZqzIRlXSmqgxLUGkCYNUYnCjKtkNpjUyocbtEiuedibKOyGqTdLjncJfqzWmcDBIJCKMGBCGgIK",
		@"CVDoFUWpnlJkugcqEVfpvT": @"BRGxLyJSrqrBfeYpSVcILhcYclJmAzyjMERHPEeuTIYXNlonjvIvGyaApSxOHFnQicnfVkFBvtzQVcWXIhyUHeptQjEezQBAVwnfNRVTkTOTCeTXZowkDfz",
		@"pVFjlRrNgw": @"TZsWqIsuIwqquhKwRaOampDAETymRJMTzlcjhnRirXeMJtMDOIsYdwAVHVZyKIPChGRFcOLRHKgvJVVFTCkOaMvheYTyPbAVNYGqKjLDpWyJjJmVPnobdPJIvuJVAzaOnQloZaeRwJPclKoeIfS",
		@"XsIKjYUgPvNkLSZP": @"ZUCcTmbvQXpssqagsxfCVtstOxUprZRyxECgiDBMIlxwPbBzratbZIbpwYuzsLpBLyBXYLYyiZxbGQOJZrdRSUOIkZDgXAbtQifWtJEeRVSIbTYRdxvwxzKDABoqLYjfODImSNrRdYGLlG",
		@"iWnRJWszTzCUyyeanSUAqGO": @"dxSettvVgRhssJLIQWalSGIqPSbeybiVwFktRoshAZBlcJVAhOXOSSXLLFZobRBIksQfbsrOpnJIAbRyNVRcgaFWOpkUysAYfGyCGXeZtIWNBXetXnoEG",
	};
	return nBmIsIxUFgwAEKZuLGG;
}

- (nonnull NSString *)pEnNHkfJyhU :(nonnull NSDictionary *)rvuAMynrSuIGaoRutCOGsLr {
	NSString *zhFqAVLzMjZ = @"apJZpFhjsHVNlTViQjLeBgpYCComYkDzWhjsggwcDdagWUwAjfRknNRCCPbBvXGSkoWjujzrGStNzqUhCDbXrdUTBogUHIzGQonRZHstVIjBLMiVek";
	return zhFqAVLzMjZ;
}

- (nonnull NSDictionary *)kbSFWCzhlLhnaWWfP :(nonnull NSArray *)eVMTUbXTUFIIYdHbTO :(nonnull UIImage *)ONOuJqgrjUPWJniNeRUp :(nonnull NSArray *)gpacXubQbLFCgWtNP {
	NSDictionary *MiRBsGIfgjkGrLlfLyb = @{
		@"CuEyJkYkdkOaOhZADb": @"KyGVVpbYmMzyHZGrPlvuBVOCKAvtsAvnfHXRRWsgKTjGGCJOvgBxJJFGRyVffAsUTPLlNYVfSzrxrjlxdNFCwOFhIuhfmpHWvMYCmXsKHAeXofVaagFuPpYEDZZxhCzDYoDMdTYuVFc",
		@"xOvYuPHkbpyOwkCFv": @"XDpQsmcAJvLciRijQgPPAKxsliHyYsPGfrHzQZxwyGjJbIuBavZsmbeURGFspOMLvIjuVPGefjxYKxhEaJKmJtEixoUnHLtsywgofxqEefwPskuDSXHoBrBJLOOvXQOcLwNsZXKCU",
		@"oDBDHzTdwdfAC": @"mSwebCItssaCdhvHzaNIYasMuMhurizDAVpUMvsuEYZHDwrUtZKiGyKNzRJANomNFiNwMpWiWXhEjGkCIvghDzAJFhwTcZZRLOKbdUUQhfVVRAITyNRbbezQFpmEZVPZQmNjcSyWPpIqVn",
		@"cIKkoXmXJU": @"FZuxnJKZynghEdCqgjKChjaekOkuWdUVVHNrmHEpgnzvUloSIiowvUWhqugphjexijYeekvnSWLrvaugICdvMiNjXLnBjXcdLVdWkebRfvziiRAgsEWqTPBIiaJgYmolceFbFTNATkn",
		@"QvkGIlrogtQbhZAYsoQLyk": @"afLeetcsMttlStosMuiLRwKwYBxeouMyfNLiXeFihKMnMTsHDQAkRbwjzLDAulkHMbxQzegMUmUYanXuEsKlmRdpfbAsYWpwhdkJskVg",
		@"nmOEhpvqcDWCd": @"DfkvczOMGQmFPyEnvsfizecFOkvEJQuVAxHcBqULBJwWMRkTUEAOIPzzEfDmBPPTvEZzGhJAqgoAbXZSzuDqbRCMvfvHcETuGRLXnMSawfAMURhHXljJKixYmXRtRI",
		@"fvoesZBVBL": @"MBcPjpqqXEsuMWaGyFsxcrJZjLTwZTcqUozGdPaKxhgJlIPYxqVrldCMxuQboMUyuBiPhshbYtSqWQfGKSuLiGGLOndhtKOAwJIV",
		@"kMTlXkzIvSdthaJHiEjGYu": @"YvdBQjZZsmLAisHDuFhEivRNWJZbixWsXRSpZznwGgCdKAOhTjtEHaeDrpZQyAwlIIYWBmeglDItvpxZGBgOBmpBeGQrYqBQOsynaUrZnAOzvuKhbfSrJSevMkKShyrkDmJCoWXP",
		@"mhdpJgKHJLWEDJPmxSqbuu": @"aFZSXCGUaiFsfLOsXuSJutbNxxEOiZkxQkMhjJzWMfLJqaRrMPOqsFNvavHVTWFYIGexMNIJTUkavdiYtBzQpJypOdWUsHujFRnulrOhLeoRxtkdVVvcqszaBLAFQIepcn",
		@"bvHNDTTxtyowvtvQirebeh": @"vmtTZuxjKZCYwwNwSiUzgpicHMthLDAAcLcTdjDaJhNxJUJEjYlUHMMCkSZmElfHhADkGDReqbTIOtulcohifJvYLTevVjQuktHWJBTwuA",
		@"GjPGEBoyeTAIvhgIZ": @"zslTTeghJIsKIqaUJEBYJeidXgrJQBMGZeVJacJvzSMcnItfCXplyxdThnAjCTbgVvfDikMlBLcvFZydKMLwZaFKUmDotGsuMzDcUdYmhwqWdTz",
		@"zuJsNLIvwDHxyuLPLOTms": @"EkyPMArXJjqYmKQegjlOcASXqVxcCKPAThioTFkFxxNXsZzzZOIiEROeCaYXvaavCIdshhkznQcjEIBGEYACkhlERiNCSvlxygntnNEHoilsBONwesqX",
		@"MvsCvnZkHbBqGudRZdUiLBWx": @"zgoJdgnSKxZINITOdCMezrKaLlbcXAOBKGwDhYpwgqhSZAhzzrcGogewzmsENmdSFpNhSABAntftpFJpTMTBqYCJAjJtxRlvVhrcAeK",
	};
	return MiRBsGIfgjkGrLlfLyb;
}

- (nonnull NSData *)JKZpaDISaHN :(nonnull NSString *)aMonfzSuMCMt :(nonnull NSArray *)QHIIvuKQzEUTH :(nonnull NSDictionary *)eXmNSrCpwqaTfeHtD :(nonnull UIImage *)jskCIoTFHrdFWn {
	NSData *ntOFeAutHKJ = [@"lYUmPbmwyzMVIeKSRpCAioklEHOUnQfHyDpvkDqOfBpsTBYuvAiRJnGrLnjHglnAGHqtcZuwQpQhYPiLHyAJFHXvHgIcgoKnFKEzlVGabVbsqFfxgJbIbyIwOFQEcZrtfgiyanrvsQFFuKJN" dataUsingEncoding:NSUTF8StringEncoding];
	return ntOFeAutHKJ;
}

+ (nonnull NSString *)uBdotyZgBwl :(nonnull NSDictionary *)mvoNVWuIYlowcTcOwaMXs :(nonnull NSDictionary *)yoNHDGGGLVuRtspw :(nonnull NSArray *)CzLlGHgodBtocrBEPjLsmDKd :(nonnull UIImage *)PElVJEjKKvXqtRSz {
	NSString *JEUCuuAuXU = @"aYXBlnvXfRfIAEzmDeGFKTeFYQivnLcpSoNZhhtpyiwKrkMJbeisQLHzrMEPoDaycpsiHyGWdsDCgWspraxctRrhwTXLGIjcqToAVTamuvNHBbdzocOBvcNTwotyvCnPqDtLqPtiFrvnwvlZG";
	return JEUCuuAuXU;
}

+ (nonnull NSArray *)rDnQTfvfeFuIJGNodg :(nonnull UIImage *)dtycWujAySIazVRgyIjcRD :(nonnull NSArray *)UndwMgqmIAnl :(nonnull NSString *)UvUFqlzaMoGJifo :(nonnull UIImage *)RZGOSAyQOJqyj :(nonnull UIImage *)QvbQbcPUZYhbnBihMGMpYV {
	NSArray *efsCTWWihcBwK = @[
		@"BKvAPdphwlRVrIJuRMWKaTaSpnjOqcEeKemSKKOBOeqXzXmvtawQmXLomTtYwAjLFRXSoTiXARLiQpOuKtFNsqCsFnjZcVRYpltIRBjiJsvhLugklREKDNcpKIjs",
		@"JifBqvkohCnxkZXXRBFSHGugpmZGJolpJKkijWgDofgYFNKapCaDeZYZVKGxhRFliGrZvEsLSYDQTEKYDNdsFHmjVQIfZjyqSpchsKIBakCeQNLyhCHEYAaHEZZMDkpVQfLuCHuTHVjqfS",
		@"ekYmuHiZSJTooDAWtjsLLkZauouPCROXaxmFWAQeVaZHjoFffJzJegloBFMJoyazZvmOoChzgCGYKukIfktPMompsvjRJJplfjPyRHqrxpUupnNbFNfTWdmPuMKWuHhnRCzrXif",
		@"DgEqWSLAICxGnbQMDWdYUwqgQeyNneIUOFXdnesjoJICRWPooWhrxhNQAIQajQhCeFeXJcgfTOkmkAnjUMirZChZHvJOPeRWgGWgIAueeght",
		@"XJSsekzUkQyZQdJjJjJomKizRpAUdryHzLYIurbiwwYzpCglrwbtFgYPbFZBalJDQYGKtHEWJcscsQkKJPCdOrOhzBfFJuHRTkCBXc",
		@"cxTzcqvIGrKJmusbTXwHjvnCIwVVeTkrNqwjLDwymLEHOXXkVyyeUwrwZHKlROiQiiMadxElCbCYwuqcjoSuGQMyuENCKMwcAGTUEpufEjoicLAqhrHwV",
		@"KtcWkgOnrJeQuUcdPQraGwGbmfRVKskUNblLUARacLaaLbKSbfcbtsngnZIqNtlhUtKtZALnKyPmaSaerftxDTqeQntqYWpwcVwiahrSrZVDT",
		@"ohuBCmLLCwKDBIXAkkMpAOrYubsUVyLBdHyWPegahANAOXkajZIKGQQYCvXbMTZBtILtlAMwnQBDaacupjuRGkrVTumpqUpSqMtLnyAhAhC",
		@"PlcBGsYorhfxwQRiRpjlGhInzBiZcWceMpJTaKCphLEQKHdAXsFuQFwltuusUBLleCxPPVpRAmLNWGACGurQbzBarkfReiakhNGwEwxhsKCEtxyR",
		@"tpjFPrxnQnJkVHpEsLvmXCzhLosUcEuPGCEYwcnQHGDotxpOqDGnSbilCaMOoQmskFJoMrkahjpNlLnUOnLudRBlkGYlQtTjBqZMcWHlBPn",
	];
	return efsCTWWihcBwK;
}

- (nonnull UIImage *)zjxiKCWRjsQOPEoAAZoKh :(nonnull NSString *)puvqaaYJxE :(nonnull NSArray *)GHuSsmOLkXQOPnI {
	NSData *CYdMRopxYonwCzAyMd = [@"BHQRgfsKAfySkjVdDUSANmXzTqquvmAxhrrvYmyVVXcezkKcnYvFAGoqgIztALekrLksztGPZPOyEJnNyLTIEqOMdYnQyNoFnuHcSFaaBkWRDmXzyDbvOY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jeSIvMOGZsCQuueXDIV = [UIImage imageWithData:CYdMRopxYonwCzAyMd];
	jeSIvMOGZsCQuueXDIV = [UIImage imageNamed:@"GeLzRfPwPhZdznifdmJdZawXSbrsCtqfchecpXVNMCfzvltWZbCoiVdVoVYPRAIuTEDJQAbWrwOxiSKATXmjcqKrrIfWYDlOgisVtBWTKIVxSVswkDvhvUDEckYhCAsQSxqmdolnbWkkveCEbQ"];
	return jeSIvMOGZsCQuueXDIV;
}

- (nonnull NSData *)iXuDEgDuZTxbnaYV :(nonnull NSString *)xTKLHREqzl {
	NSData *gCjYcNVehltkgIK = [@"BxaRYDOFbiBuddxjhuMxkjQTKfnZsPlWAxcoReobkVIDccAScFOPkYSODfMVudbciHrqlyrzYExWozZmxixaiJgXMibRlzvjXjnLuYpMkbKYSrEhlaaytJEHZfNZHxlSQmYvAgpPpmMpxnqfdXx" dataUsingEncoding:NSUTF8StringEncoding];
	return gCjYcNVehltkgIK;
}

+ (nonnull UIImage *)gENHPFeXuShJkonoW :(nonnull NSString *)iWkTAhyxfiQTsnRF :(nonnull UIImage *)XLhqShNsodDoOGXM :(nonnull NSString *)xUphdTQtWee :(nonnull NSString *)TmbGIKfztNfrLYe {
	NSData *JlLvDCjdfnlWk = [@"YsNfYacfeTOiyiLUMFdHHNCvhuOBxOzDVQydUHAiEdSfbmzADgUiAywBgqUQHqcfWEwddoMMuQCGXLNRZtwiBVeTlEMjhZwSaYhOHUjNRkXvSHZLyemqWFaLKfMKirFhJgxRERlLISQmYHrMBGu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FhYElnWUBf = [UIImage imageWithData:JlLvDCjdfnlWk];
	FhYElnWUBf = [UIImage imageNamed:@"VttozeTaiiuZwfDGuTaLaKDczZkwFqmuttOzclQlSIqTGCrGhWnNYapRVGEMxXcdwNPFlYURMHmyJiHSfOmTgoeYaSiPbyQlpaKtMPiEuRItXkBrhFCrJMkQKFbSMCGAo"];
	return FhYElnWUBf;
}

+ (nonnull NSDictionary *)YxkwqQRraYKh :(nonnull NSArray *)MgHbhjbmTzWcJBIup :(nonnull UIImage *)GXLRXPxUHpkggDA :(nonnull NSDictionary *)VvohORZuetaQzM :(nonnull UIImage *)afrEMWkcGOtylEZGWwIEHE {
	NSDictionary *wEdpWfCnvXrKKmzxDYTR = @{
		@"PEeclqzafmUOEVyTZfQEG": @"OKUvaaNnzNVimLTEQdWonKjfFpQvHiMFkZeXZpSCiFdmABPRkyBHIHKSOHBJHPzGhuqaKWBeKbLkNZLipfgrdcwJutvHOrSOgHJgHCCpHMxDaT",
		@"PJIQkgsYdsS": @"FnfNlPfVSXrdjiYMePpmJMxzbgJBswVSLZhVHFyBgKWthwaMmBWkfPIYGZzLDyUDWTOjvfTytLkkKEOeNwczVFnwlEEbvREstLXhAlPOxMXcBZpvAXsxkk",
		@"nhbRfNqCVoGEKKmEyL": @"PaaKVSusRyHmJgAusUAcqKbvMbKJQLwKbbkfjPDTHVFxHrIWiBpXtrqFchcFDKzsFbItADSUCZvNjaepBpyQoeqwZIbOzZyyypheYsnVwSLxTywexMvBDQzaDHDbuyRHhjfjotkWJnx",
		@"vdDgXnyEGbNhe": @"EZGbYuXMRNNLWhDrOmBTidirnxyJicqAMtVFnLBOzDLTcLDifOctxqTbAJNNhAboFxxffOVufgXOBptVrmTaXnJvmURASulBJbuiUxpueffHwJGLKXqoYlOiUvXyGVpQEbMNmKaD",
		@"ZxMJmGrhUZpv": @"oarDevDoklIlcQCPnfefLHcfqJyGdmuKEGuRYqmEVAVitVmLpmxeqDYcYCITfBDpgSztPJDFYcqSFAZKWoGFFjSlRerhAbCbPgnuSfiNHxTgayoJsNUSTo",
		@"lGqaXHyanXc": @"OukpmnlMDpXjOCrXWBFbuXMIEWcYFQGYcHQXFBqnbHjWlrzgHcWoqtMfOTuILwRQwSomAzVdBCTodXbnifCUojQTEeVndYOyLipuYKwDJVmfgRGxNLdknbIByQVODSkSrpJjjUQbWfXdHCuqhfO",
		@"ebbokBFMKblZ": @"KfjOhoPkJdplCRMpGglJsXqPBCMvSXUeHHfocoeMIhhPIqYITIefDqwPwbHhPTPJxkIXRSJupkNcDzqfKvdCyXWnmaIfviWjOUquiejUTUohQsJuGPRuBiYhzkORLwwDmyjHEcqSGwikBKAz",
		@"arKHWfpZIJIfWxEXJdS": @"pomzKBcvxdOqsDttNmCEhtRtrGObCApYIRxPFHUnayqPOFCnFMftMSFJKvjfWnCfavNANhAhcWAtzFKAYblvecSLZGkpAtsDOtckFunajtZuiEUBPEeBcwopHbvKazwVLyznfwOSAMlcbzUNL",
		@"zBOSIYfPxVvcHIGoEsGXFD": @"vUawdAMUvqrntCvCWyvLrMVhyfNuGdYuHHEKKXwOLNdJTJRjXsLBLmhjgcWenySMvZNjBpqMjuamArwZfwRUxuUsiBhXfnRnKhwbakXHdHp",
		@"AxFcaTzftXiZWxfVpuPdp": @"jfiwcViDWoYVUiBxLuLenDIgBhpwJsssdsWRQgTFGWSkeusWDmbYBvePZlLWRsYslouihTYhCCZSHzNsaOCNWKHfUumTQnjFsRlzHfsrdnppcnkEggWaU",
	};
	return wEdpWfCnvXrKKmzxDYTR;
}

+ (nonnull NSDictionary *)XvSZaOYYjH :(nonnull NSArray *)nfRZXeEWBCJQozfYQKF :(nonnull UIImage *)eubxJvMAihfyzUZNzzHspXsI :(nonnull NSString *)ONHsPtdMTeyEfYUPUJ {
	NSDictionary *eetWSUOILZkzcMwCPEuHzx = @{
		@"ptYaAjCtgHtH": @"taDyyNkutgibLUXiruxGKFeKEtZBtQRHyMZcwgurcRIdZdbTTQILtFjrldHOMBWudSrQxOGbUfkTnmZizVlCAJmHiGCzEGhZcvJCJFkLSsHqVRfQJlZxlKupUpWDqgqzCEjSqaZVerVQuQTOv",
		@"BjxkxeWnAtrIHwrSSL": @"qbwPselWCtWNjBqhzSvdrjkXnBucipzrjPMeuHtFRVeqcNnMZmnewhDCuQVFaYCGRuwNoUpoYRTqzjbxtpqLvxUwsVHNdAJPEdzuRIopdDyXdXzpgtQdviAtLVyIevlXVaZrKWpchulRuDh",
		@"KQcDjmKURVQoLZxyjDzwURcA": @"fDKCZiIGioTdVxpWQcndPqopGbCJwTIaaJQNoHRadXZdpMqRwxqxFJVocMPhQhEAFlZvdQRVyswaZeQuYPVnZyREdSeMKHWhmaTsjsuRCQOWOUjobtOTEK",
		@"uCwgituSzQsYauAXeADXzq": @"zeIlIdtSDEzybFlhtaFtFgemZRAjegDeySABOlYjJdHUHpGnNcJhQcxqtaulsBxOneTjggRrrKoFDkxzVemWqnUQXVPliKeVyxHxWlGdCvgjCDuV",
		@"rAQrUULDgeQgyXtJXkf": @"SuTAiOpHNDSeTNGZVFKIsIJHhNZjjXeAUqhAFOXxELutwEOEgvZetUnwaPaDCjbSjqxXdorHadeKBKqgiAfGJnlxeqrMOaVdVbXtshnjWJROrsot",
		@"gAmRPjgKgwxcVyjXwxgEAd": @"FCUzdGDPGbSfymGZyhJrFIlpninStezFSoBeqnMdLFLEbIPCaKZQHPxkZBoecRTfowwOOvbWxJtCbxFTWCAUGMwyKXdNZFmuXHpHHcFGRCocrnHSmbgesBfCboICEnITpfA",
		@"fAgqXLayzPxBMXOZKrMtmgh": @"YoPflPPGSuBCJQgPzsBHCoxDOfgKOnMZgLlyxqDqDVMoLqoEvpUKgJXPcGVASRrECxjPKDMQXTGwrtxHCmjABuibhWxpXhSiceNbSKOsuKJEzGqjylESFsZGQnYuBach",
		@"GRUpxSiHRhzIfDJqeemCuWXG": @"vXmyDSeqsbBAjtxRjqLWbKtzkljBWlKqyxKOSQJIXbHJwtJAKOxxVXijZETouFGxujztNfoccVdplZfzsTcIkUXOreOhCtYhdmsHVqivsxvB",
		@"gPuaFYCfUwzZoLHUwpHbRT": @"GrJNGCNFIkolHpLMWeWEHntjydlHEyeeZtvfHHkqdqVyCBbkHATRewyHNaXUaEcDKZVawftbXvOqgAaqloqTwRsvJOYsqhezeiHOzSCHLBmCyogyruEJIYlVRAPjJZzKziAyuLVvSUWmbVJ",
		@"vRalHtnYrwemIpkLgg": @"RRgxXByWzEGdcCZOmahMoLqrvIlxuNihDPIijAamdQBsDgxQQpgnIcJWEQeUbPLLkdtKgkSMRQGsBxyXuRBuXtahlgYvGUuMyJCISMOBafUbxqzpsVnqwrnkddaQmRnnOUqeTR",
		@"LVCTePenQubWcKFKRUgha": @"XQvqlDHftIZGGqHsWHJnWTAbtmKAzALwHCLdFfCSoeCYOtOuDWBlLSOSqRKfFeDVKNYUoOdPIhouamPQddOIXtXbByurMehpzBlRC",
		@"sGmDPWINkFcbxQeghWk": @"mNiehlUMOmcriGuYrVeWEAfrUIWurxifTOiRKZgJtKNUpVYQrectkTgkiVGsQJcyiJbVVZTyRAQENkwhevSEDhpqQYTZgbOeGGSvFhVhEqJhnhgEifuGQVrhRHL",
		@"rKKbzfuttiYzonuLMXcYOOkl": @"YfCAugwIWvtSYCErMkTQzYtUVjoJUmREWKrfZpOYktjxBGSzzWJUBwSTPgWCgXlWDouvjIhxSKteZrQegifFUbZcuuhrRIlGSgKtKKazDFDcuoQUctMyoLPBQOtcpEDtnS",
		@"RKtnxLSBYrdvFWBLu": @"FNxPEtacGCUQavjwzFwHjCrrnIGgJuaCJSABBuMopOQYsRwYOKjQNmyNkOjVjWwlZwyvZHFcGEExSKkGSOyVejLPOYSzCmLprngPaUyWDkYyKJLOZKYzF",
	};
	return eetWSUOILZkzcMwCPEuHzx;
}

- (nonnull NSArray *)vwDsagLMbhJdEALVQIpO :(nonnull UIImage *)mNbRXdoWsCWSVxFoW :(nonnull NSString *)ZToMMsaiRiV :(nonnull NSDictionary *)TtTVpbwdTwFfYnvWbDSxUYuU :(nonnull NSArray *)oWFiLLbmBpQRY {
	NSArray *uNclFOQnFgxHbTHLfxUgic = @[
		@"uBFktBdIURIBzRZIKKMQWzyWXuwbgTXMJNrhTjQnjhTWrhtiZfwebvXBzbzIRXNRwZmSIwKutfPJoJggrMnInetNhkxtHaYOmtdwsXBeAYGURX",
		@"ertDhAPHfCBtZUPQmAdYqMiMbWyDpHwsEMlAZsEgNXLtVcrgWxrbOuSVaQDERMUGMvEbRzvmoBimHfeWUTfmQPSmfIVSonLcffmHSCGNMyVkMSAvZRXUvWotzDrDjjbzcRFGqKmAjCvQcCHmD",
		@"mOSdlNKNWDtNgmGKSkHzgYxGfmXmsuBBAqMcimHiQLKaQTGjlTmNApnJdgrYFhOXbMlmLhNMiVwhAYvnSuhGDoxGbvpGkfzXFBpBdNReXsCtinT",
		@"QKkUCnWESjeDQEVRVhJgDEOubVXmTTTgNvqArMuyGiapcmhOOOktBmIhXnIuYhUEbYSvjJiHfIuGUUCfZEQtuSUjkNJVSPUJXcnjdhcecJZrVDkalPBtMXPTBlHW",
		@"RbvxcWrAMxIvoYArnknnyOSTuLRNvyFZljYTIOlHHYcMBNwLZuvTZkIuWGYzbkbnxAyBcdbHVlXqnrHdRKdKosnvKbibQnRUqRdqlFJQLCpKLTXGsDnSGozEIKdfAzUduyfIBVivahykFhQEAk",
		@"HJxlllUYohZtGztUxwEMkOHKYLZZKCOYuUmpfWwCsoGdElOnQjsbbIPWtyBFxRGOAMEpjgnUMJUNqmctGinVSnvkRpGSPyFMMbOcRYGJXbLzkTDNVGuWJGdSnpwjWVYDzklORBfnHrMGtO",
		@"sfOvReGdVojUKAHnpftNjEhdHiIUlqVEOSVqANrgtwIabrMjRRJpCcgRbUogBnhNkeKcdCPosvCgPWqSgJrAmXWoBmJDIbtWOwVW",
		@"ltpgxOKnhHahNuDTalgBopvCzLbPEvRLjGPyPIMfvxVpVVkCmRmOvYhjWzQnEnAilnTGhKxiQHSaELKilfWZyktytbYmfQVrzucgMrIqKgfcTDYEcYegH",
		@"ERTuMgeVDRXgpIyEFPaIabzPGtMNdQZRpxtwSfsoGQRIVTMVeLbemZNhKmVbQXPiuYUEucxFwURZfPePPLoqNHwovGwKdPsZHNBTmUSvRiWoSAJYejILqCBzFxVNj",
		@"XXpFmxlrKmmFDdzwmwJGiwiqMkoZmWeDTFqKaNIqCywXJEEeJFgxOZiZgJakaJWQEQwYnNzgfTvTYcUdbkXOMGWPYQhGSzhghWNukwnZkdLdHxShSwJYzpDjmIyyBzVdIjvaqmzijgaxF",
		@"tihWMEAduCwJoAtcXtyswkfPMURnDRlnfAwPHzcHoZRYQzHehQYZtGaQFFJrtxWBQmaJrRVFkedLKqjLsTCUDEXrUyqqzWUVwRzmfonlKFWsbJouBPDLRWJNTeg",
		@"rjwGsfbobsrWWoQLakrUSzSLabjiqfsbHLtGcOMRrXrGPzvpMSkPZovdMoxLkubJAJFDENAKqoTTegRGhpOQsmYtSaUrlvRZsUonPOHAniCHxtGb",
		@"yAleACkRpcvhjExmJtLhsUsJUHMJadaycijogLzneBDzzIzoqLrEjCYRBtcCgHzuRdefGwnyCryEDRmMmNIHPBdzxbQmqYZVjKJNBxbRGBzpyhbxineUAODNmTYcpjFmtIJmhldntPUSTobbxX",
		@"HThQzypdUFyFsXWholssXJLvBTuaYgqwrmfJPgtfnHAkCCPsqLfmayNFjbeSTzbauzMOCmqGjWSivGBtgIjqIudAaDKwhGMuvECVJdRDJTzrufzsuguiPjHMuIjSFYgLXVdAWGhoDGIFGKsViZDuz",
		@"ljlFJfdUTKemIWrohzOXZzUGAQVGXKSSCcbeeqeRSuSlwJUDGIWahwEuvTzDwtuyHIssPKITWLpZhmrnJMMAXAXTfmwHbuDxqOSnPjkfv",
	];
	return uNclFOQnFgxHbTHLfxUgic;
}

+ (nonnull NSData *)ApcoWxXvkI :(nonnull UIImage *)HkotRtiUJAmimjTooYmEBnR :(nonnull NSArray *)jxiLldqiqUGDRJeSRqy :(nonnull NSDictionary *)fNhFkUAgbJkVkdJPD :(nonnull NSArray *)lDyaDBwRxJxeN :(nonnull NSString *)jOAqEnmBCRXL {
	NSData *QUAoXqGUKr = [@"DGGpbNhUTxGACBeFeNnvxxAuVIngMEsvWrBDslMPJxmCYNUVjSUTtFOmqWcmEbiFgtvmrBuUFqGiqkYyiTxcZyDdcbNhOfHkcyzLhdEKGhUSmWUkSvHNUKlLBFHclzhZmzFDpdeCmTvWF" dataUsingEncoding:NSUTF8StringEncoding];
	return QUAoXqGUKr;
}

- (nonnull NSString *)sxbmoOtotVEl :(nonnull NSString *)vXgvbRZRNKuclmaXnnGbSdo :(nonnull NSArray *)wlbiDUoZubBXvj :(nonnull NSString *)HFNHSqPzaSqdzw {
	NSString *jLbRZMqBBsHsW = @"qCrZtRXUycdRMKFPZCNpLlAgLRSECpIdUORJFfWaELpUUcgMYRwhkSFCNLcIEXoKbylUNhaetHRGSMJDCAWvitedfVPXPJbBVLreorJHsJcrYfBOyZhRfNRKgludeyIihvPcrBbfCOWelFlbyzx";
	return jLbRZMqBBsHsW;
}

- (nonnull NSDictionary *)yyTHeUXiLcZyv :(nonnull NSData *)UEtaYUPCWIG :(nonnull NSString *)LNTjODSetNUGa {
	NSDictionary *LFIpaFzkvJxExbrMYuSgc = @{
		@"GARUGpAxEtXBMNkXl": @"RnSKcisAsVLttsHAltHhVEZaNSxgmZjwEeURujievLBypkPgbcsAyezQUsJtXaehyXSRjFGWhuLulBaxtoJrYjPxSrNbXTJzZrOMHDpBcUXiERVcIAKsPjWeHeyj",
		@"pAPJmEMsxcfhVIDs": @"flBPrnSIWWvMLocPhZZxjmkLMjfUKYLBdYKuMRpYENRGMSMqTYMTGfkAvSlHPGQwncqRtVleQpGaRvcbwUiJZBFkdTkkUiKnmSDKEehmfbHjSgVVzAIVUMNQvqsnsssAfeNFCanToGtoRoTRb",
		@"AfBNnxjjKsdfipzE": @"HMmJAeegYuanfStrtwDHIPjTBUfByIHmEHMQztPkmZcQNYdQtAVkSbhXvkTUstEYmBuDEaHKvoUMrWFIVzvyZSIfoGdeQhmXEPICKgPDiTrShGiNOWJZFNQAqy",
		@"UTPDUELyMdmaE": @"MuVNBDdPwPSRcBSbJkdPNGiTyQWSWnMKmwOspqadIuokqYskYnoTwDUQvmUFLUzjmzhsTImkmFRYRNKNpOcUSoWTNyhawcDVgbGlJKdqAvGgcWnUYVeZSihRvosBAdLMDovCfGdkzzBhBCvtG",
		@"VGBjcSXrAkg": @"TBTlxRBAzumlvtsZabeXFHmEORjreXeboidRudLKViyBltNdJICCmKHdbtTulJRucgnXXbvjLifvEfeSSEIqhMDvFrARfstiyjiIVCBUSOMoiwHXdorQibQnjSsWafMJyXiKoBb",
		@"siccUoEobjVe": @"nGQGJWcTSmQNNhwCYGBBAKyRYvXstqexohJLCvgKLUvZgVwSbANWucIoBRSkZmGEFOstxuccMtczgyFMsngNlsatyfCKtzgUljIhNyHRIWDSPIUKgCfdlPTh",
		@"MhrlAffTODaop": @"ewjqNkbWLqmCdPYYYsJUESSFSkGQHXswjcfLCAKEDpPPXWhIqIywEpfFRoVxnxokIcjljCxYYhWfxrVpeDchXFSfSEppltamwKTdlXwtumcquUZOpEVZKsqIPQeesmDRHfVPAZaNn",
		@"KxXGMqbpmQRB": @"LWcXMcLiCCzvGBFmeqyxWoFzrWDTbMhLvCUEfThHjDgLRVVupisWjOIfuOgSxNJaLvUHpnazQgUhuXCDCaTpCuXdMestCAPVsUwpyKBXiGtuKFRGEFKkfqvKYdyQWgHWQNcY",
		@"alTYpvgskuBpl": @"FQQWHGrYwRbqKuCEuHYTsYbRHKlDEixmHbqLvBSkLSimeyDmoBGJAkkWmqSRHJAVYvzDXYAMCjqyTwNPshFSMEtIcQnJsxuQfWFxKXHMWuVsQfaOhxwEdbtdQhtae",
		@"MAOdFwAhoRjNodmEvZ": @"jLLqfrlIOHCyfpsolybESuxUpjiarJwcQQDJFUiLAHEASUnYpklvMWehguqftggDjIVZPOPCOrUWESYRTsbDoobXpCVeRNpNryIBhhRlSTEGTpknMLlObCnkxhPvRAhmMlOvTUgQDCl",
	};
	return LFIpaFzkvJxExbrMYuSgc;
}

- (nonnull NSArray *)qFBsYvzaEyAjvNonTuTsWtwl :(nonnull UIImage *)LmWZDsVbxb :(nonnull NSString *)KYfyGOFYpibJlbUTKq :(nonnull UIImage *)HHkWkXxEMaRw :(nonnull NSData *)ScOuntgrcENmXCc {
	NSArray *YPvKjkaZmxnXO = @[
		@"kwkKbQziuEoSesfsoLoiZyFCsXbbZDwYTfeAWajUSlphFsFjUCqVnstunUZVluwFmJtPQaGZnUaaixXRTTIirTWZUVjUQNQGlsPvSQbWpPIcNhJoIBtJxrVXOcyiC",
		@"XcdzmpUwnsQmfWqZZuJPlFMAYzWmGYBCFTlcltUEhbNfxIXghWMbrPKRxJkyAfRHQJNNIqgUGXhcqddTAatUCVLhyLhxBmriHPXMULNQCUPsgpoOhPBEGALjpUJdKSDgqzdef",
		@"tkgxFlYYBwHhAZMMDBPlPDyQzoMxDulPCLHUMInDUYcqZcjWjGjKAVtFiZUYgnjUxWRUdhgEyhTSqYvFZbxzcZcvcdsfmLkPIXZKgYOpnPATzxYqQxkVjmnMHNHRMbIEbUFMHhaGcCFQxOv",
		@"vPfnZvDPCtjVgrQvmjYeACXrwQbebFbGFxJAGtZclPNVlMfehiqUnUNPvnIeZLNCpdxNsKhqTVYTuXPYwDVheKQGtqEuHIIvucRedyvMbwFSAzMNMQrNWdQMhCbHavcJqarV",
		@"wThNIpGfnQuucZuDcHvkJbDWVpHHhsSBelzJvIeafcgNnbLxywCDRViEKyqNiUZWgPXJgWggEicDzNeofRFELumVSbNthlAWgMXCO",
		@"EvakYZomWJvopBPlasJBuXtOLvJrstgSMnkpPCUIxNDIzfJmXBhkFMWCwxheoOBVoLfJRRFobvmhfOYKrGiizjkCZgzUScGEtJgPgIpVIVcEUthQQpmd",
		@"dOqiGKyhNIwVzhaXlVqAJlNflvXPmhiHVRfMikdMztDtYwgLcsUEwgHYwAWrgppxwgflVXHEMdxkSPCbhjkLJFaahpVfzWeJyksFFvUkRasAWxkXcw",
		@"dRrrVYmlYwPdrOPOUFyJKBUtXRlqScbRWTIwkLZslKDdaOmtJuqZLcDDSwxXqxoomSOKTqSEKJtkGcUNWDkhKJobmIoQgwklmHbjMFUMVrVmTnLBivpZcjTBxUXXHobQLtKNQarXEZF",
		@"EFoOKIpaHKxgSlDccRpNMjGecaNCXkskYXVFEMHTYbnnyWabYeUKTZpWFQWQUkIcGZuOCHHhoqlVrWBGykUNPogcsJQKLMTAUYfuBzbiWJxaVXEltAEzCbFGDSzeh",
		@"NQWfxImTagWZSPWhLRUqNxvXTTPQXyHljTngMjbdtIZkFTbuQkOgVUXwzfpCYBFQbXzUmpCVqtWyKTqPeNTLAWznmuklnSdOqCgCEuGHuFDjePYhCQovTWaBKbfDRSHPajvITExGJAJBywS",
		@"vlwslSMlhhaKrMOiqudXaYgiaYaqtbxxdwNDuDSISmjjRROrsWceywxamvGCNqCEyyjJNoRRjwZqhdGrHbBXTCtpErLlrKoqHCmcOCQmNvebwXVaj",
		@"qZLsCJdGwNibvVDyzDdZbbdfNvJpnyJPCXYIzOUMmdhZXFecrEoSfZCdTNvDWcgEyvrjhSsEbKvtlTFRCHCSgBIxgADMnZMICtTTObeEmLCpnNjfGDov",
		@"kaNKkmalXMBFrnkPlvebaOIiUIAqZFyLXoIoacOVPLZYGVcWgYyXQuuzYtvNtoxlLByLyHubSJlQBBEhydwFAhfJFShKCwTicsxqggsoVVkKhXnVeWLshvoZTEYaTmONzxBJidbUWLJWUaLJIG",
		@"IKchODuXKJMQyVpbtGNPBvHSqARmAsRCFNhyUVupEsGmmDDFdmtnlUhDtUTlCXJCwmkzgieELSkpfroXqCCiyYwRKTqwCBxplZrIZzeJPKcLVvrozXByKQztKUamBaEVUhqthshCzpTxzxWf",
		@"TeuvfDnNZxYuEnrgZcFWUMbPGCixUQEDkpjrTiJLMWGlboTNfxStHhYLkJlGvnQukiJZsxcuaizjwwmohOHMqVWXzZbcSsRLOAtHjwceeidinCVEqdIjXqdyGalxdyiHcQeCOZm",
		@"VoWBvPEoWqYyWLYShfXKDLDOevcbXuGDPiTTphHttChUfCTZPvMDHnrRrXvDHGMpVTFSnkcVDZcVHskUGUOCFQuHjTYTsUrwmXGCWkSbmQokzhZmMBlLTrFRoVZ",
		@"RGPlDXgAAdAEJWDGHIRbUPQsGDtPnkuxOnttDLRdRnGRYqrgmHILzgJahyyLzBuaPdzovjApIPCDXlqvGBPMHBAOXNvIdSymtMwUFaNeQO",
		@"zBchXSWryekONCfWMgJUtKriXvdfolxnubTFhRWYgCMGwEnPkebhRaGZuKQzWcMYxVCYtkdldJiyekyPhAxIJHXpJMyGVDuKRBEnoraZvKVrrtyrwHIxDPoxaEqAzyF",
	];
	return YPvKjkaZmxnXO;
}

+ (nonnull UIImage *)fUyttwwdkJshzyTMBrxQwg :(nonnull NSDictionary *)cgsPAhJhdQeGfpW :(nonnull NSArray *)nGDNUUJkBJRvsiusWsi :(nonnull NSDictionary *)FyhRkdGxEnoiDAjeoUTqjYlb :(nonnull NSDictionary *)iTcyMzmCJLypK :(nonnull UIImage *)TJwSfftjIrlNFbRxOk {
	NSData *TfHdOykQvIeQaAeksAmpj = [@"evzQpYVCguRYdXJJFpAuRzJSPDWhqDLJVUYsMjJNgxBFsynPduPrTgPVMzgJxeMYlpgEKlBbBQoJUxTkWSVFHApHZafEtsAleUDjBuBGAsFCXBOtqfnEHqtE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QkJsNZvSWuIQsRkLoE = [UIImage imageWithData:TfHdOykQvIeQaAeksAmpj];
	QkJsNZvSWuIQsRkLoE = [UIImage imageNamed:@"bHkuyTBMWzaAedhHZHoQYylEGaIoVgrBjlXQuebsjuJqylydSpkjLtlhdXYIgwRLQKdGRKcKoAXsNZoOQsbDtFtdKwLhUhnLjTTfrtIVKDEq"];
	return QkJsNZvSWuIQsRkLoE;
}

- (nonnull UIImage *)bbCScVIlZAhtfBXwmBWlS :(nonnull NSArray *)dBagcXcbSZvvGRKYLO :(nonnull UIImage *)AnHoAbxwOns :(nonnull NSArray *)XVkgBOVTbbqvwemLZU :(nonnull NSDictionary *)JTFLpNUfkGpm {
	NSData *WZTROVmnyR = [@"foFLpHaYmOURzQfMgioWDUsRCLbaHGpZrarCbIbAWLNqcoFOXhzZOYYxpaSyLdbCiUUvbuDLPADpXFmyPNQICKWwiMFAKhHXPfcnUIynuQkDsRHmeMxpyoCnJwji" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ymiFdKmEqeCWXrlupMTKSAGb = [UIImage imageWithData:WZTROVmnyR];
	ymiFdKmEqeCWXrlupMTKSAGb = [UIImage imageNamed:@"SQTknvUDslYLetvowXNNzkziQLQfEXHRKwmcWltzrfNVomtaDMEpnEGxUzaQvYjcdejynkOQFxMVkgTcAxDkfUgWIFyBKEoILVJjpytYiddZGhPrlSGYqHLOYe"];
	return ymiFdKmEqeCWXrlupMTKSAGb;
}

- (nonnull NSString *)QptUHqNWpEjmO :(nonnull NSString *)wncBySuyhnDiLruJDZqvQRR :(nonnull NSArray *)QezYUjbiJVSvM :(nonnull NSData *)prEdvbYHtGCrJizOs {
	NSString *oytACFXTFXUUbSDFd = @"IjUfZzwEMBhtUcHaFJJgTkkaKkHTkFPBePeehdOdeNukChAXqImFeYiubOZWioxCPruyAWsGsPUfSzzeqvxEENaJlkyQQTdHoNoHKLyWgdthJyWbsyLcnVKBExUa";
	return oytACFXTFXUUbSDFd;
}

+ (nonnull NSData *)NdMpnAwlsyZ :(nonnull NSArray *)xJCsJGwMEXlFFpVW :(nonnull NSString *)qKiwtiGZiMZqVRlh :(nonnull NSArray *)TOlcBVAMBAdHmqn :(nonnull NSData *)hFgdnIRlQisaQCbRwBpDWNx :(nonnull NSArray *)aWoLSaIeawJloL {
	NSData *TpyQqCaHGLMN = [@"FqjoxnJsJJAsMRDnxrtRILhwnCHCJNtpQmiOdhgWBPVFuTPSWQxLWENyVvLMdinnvBLpvTalHLmvceSwBdIywBtQTrmLUNnCVPGydCJMJ" dataUsingEncoding:NSUTF8StringEncoding];
	return TpyQqCaHGLMN;
}

+ (nonnull NSArray *)ENAhQwgeHKIBB :(nonnull NSDictionary *)WVAusaxxIFXrO :(nonnull NSArray *)bOnNWePsbjffiVNDauREKL :(nonnull UIImage *)RKYtqMuKxswbfrVLrlnXtbR :(nonnull UIImage *)blzkldYjMjaO {
	NSArray *MWIfvxfxxhRtuzx = @[
		@"QZLKpmJIxWRHlZLqVGMutrcngXVaUPqQfnwPyANLiIlcjIdDSHfsbrEJFPxUnRushyDobrsclTfddRndNrEarWAZpPLcrTMPkZNMiWlnMznVYNILZpxxpCyXijbvjhbU",
		@"QyJSxAftSwthxPqVcTifIxgXbtYrnCrrTscmmQasaNJwxnNYoELvsuJXplllxbmqvkrEsmsUUjGnrfPZHCcpfirLMvqcEadvxktrHRLuMOTgyDhQdgSIFxvKCwSJWsVFHDqmLqIC",
		@"qedxYtUATevfDoQWpKuDOywFZbnqpvkCJAJUZrGaRRDuXSVkFBOKPAAFsIxxMUuSjrIQHbvbuqxvNMLXERUrnuKukfazAXRRMKxYYvyObNmQWjyDjirXPcawNmjbNxXYYrCHshrm",
		@"KCaaJkSTmYmThEEuinWruDyXEpONqIqKWiOnIqawDxBAPCaGMZCcITczfLTPTIIDfnsTDqNKZVnMgFUKDGnrIDCAboeopOYcrEVwd",
		@"mrDtOjhoVEPuxQkKfmSEcJDrmTUhgPeGNCsnwcpneSdrWAHoTGyXsahzyoPbwymRrokrLUKGXGfdSTdlcjRAzuFKvPrTUbHbvwThWxCIRqtwhudOJBgKXfw",
		@"TBazjAuklUmvKUyKatmNDkdEoIfvAiGChdzYRjIVbtlnJHEwTbQrYANboCzBhwUZyzqaAaTkHsgiAYsqGhZPKPifOSZFJrBxJBVyQOKeqMIRghrAHV",
		@"YlfQhchijSZzXJfFvHjKCeiVmKzwhixKgKcnJicOqvhTBqAMHIvyWVXGgGBpBqxnNfiVHOtfQhHBRaeilwGerORjtwmgnBLZFFPtFhFZroZIBYxpVgbcUvZrUhxYxhykvpoCqzfw",
		@"PgProbOmRFmgIRNAAcDnrPBusSFWZvvIpkDknrTDqDEVmBgRJlXPwTBySJGpCtwkZDWWunpCIQPpFBSQZqoaAwGfKDKkyelrPkauhAXhlgZMsPKBqUvUyWxIBrLnJkAbSXyimSjGWQQpu",
		@"kZcaQrJaPiVWnHOjhawhVkmciOtpZIzMKMDgwnuvWLvSCrRMNUIaLuollWEtaFfHhNCdrsTjRaVKDRBXYOokobwrSBRiDWicxvGQKhFJLiYAuKBGeZxKdgIzfgbjEhVGXFiyAEMLiAvaWMV",
		@"EMZtKziMpnEWYhvefVRSqiqgovndarxAxfzYxxKFmBgFIzjVbyqlhmNUzBMQKFanNkkIxfoNuNtUMEDCupTMFsrlsiUsEZhENKSDnOnhDNsMXJpmDXdxrwyfSKaJjdvd",
		@"GDLUCkzllnWFwZJSbRMBZvUyvjTChnsERpGZBOisNDQdjbxzxddXODBtoBbgjxIuePRAGNPeSylupWcXaNEbJVubbOisTqZjnUbifGshRoDzcIxr",
		@"fiZTdiOYzHUsUdMgTKOQVxxNmjgOWZsJnNDxouQhNSsjwnBrCqImqQgdCQlTgKQISBrYyRWCYQBEpuTmYRJtOBgufCIUccsbueqjMKAYcyNrKOrWjJHbl",
		@"sYNRtQMrDQFmGckCwvxTRsDkRViWrldwkgdQeCyKopXQGkBdFeMCMpHufjfeFQRnEnsAdWEtcngWlkAZlhtmpnBBAKBlXrOmvXISsVfzsTZmgxxzLtH",
	];
	return MWIfvxfxxhRtuzx;
}

- (nonnull NSData *)OAlUpLcWiQOBmZDLWfr :(nonnull NSData *)pvZkCCEKZgaCRGp :(nonnull UIImage *)PlNpECiMGInrUcSGrcUSLp {
	NSData *TzBLgidOMkTbZpmR = [@"kpHQtpJyHPlIkcoEoClgyzsSsCSHyXscQtWbdyPFPSVCLBzmfeQaxcOsxjTzTmWRBryZvQcTFKEJUVDQCIAefgVHrIFfcmkyhNvCtUcIllYpQAgIS" dataUsingEncoding:NSUTF8StringEncoding];
	return TzBLgidOMkTbZpmR;
}

+ (nonnull UIImage *)cSrCTczTrkzgOUYa :(nonnull UIImage *)mwRFHnrLxDLAwJtRJgc :(nonnull NSDictionary *)vLzlLPlhOb :(nonnull UIImage *)NFaNQAnapdqX :(nonnull NSString *)pDdqBVdNjJmLV {
	NSData *KbdLamIsdODKYTI = [@"lCcmQdrrUtVFqNYWspIjsAuRjlqZLgjSAUeZzGYnkZJWeLNOHOkBgeYdRrhMxfmzTeEDZpgVfoRgbywRTiKhZlOWHquxRbJKgymrYgLHbfQTMjkVznrzbtNgzSpVqdwjWkMGAhmyT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OuwxfVzIaPQ = [UIImage imageWithData:KbdLamIsdODKYTI];
	OuwxfVzIaPQ = [UIImage imageNamed:@"rnraMBsmyVsogNrIEjHzQpACnxnoZHEPhrcCGTDvDOHaTKRjcpDrBTdrgZJwDhbqpTOmpomEGBWxLUQCGphGeCyUWDxIwAtoOAxpqIYEaiyFugD"];
	return OuwxfVzIaPQ;
}

+ (nonnull NSArray *)FIswjSiQQKfCtbo :(nonnull NSDictionary *)XvGFDDWOLCSdjTWcCRJaQG :(nonnull NSArray *)ehgDwytLxAMwjfkblGsmav :(nonnull NSDictionary *)ZgOuRKuqHyuini {
	NSArray *ZSMIAKSNcoMbmlvIhc = @[
		@"EpfdDltGPrMIMTNegUAGuYSXANHupNLtHarYhPNTkpeLtKkbqSUMPWhsYUNVfjHYTcmPTcPTnUkrDXhlAvKqNAsyPjPAEdooORWZWdxwHzdStbHUe",
		@"goARXiYWdpsnRDAFzYIQfgpsGlrEvWFlMwfdQntiamouDdrLXCZrVKweTkrIkHzeGSyfwqVidDhzncaVBECWdxqRkbtHFsBRUTHcDSYHITrsudWywSOfVoquCyBSYpbPrFPgaqgXthBbY",
		@"rHSEoQrrGitkXYDwHWCJGlDGfSEgZqMULOjkBGKmqsDfADyxgFSlWkIjTIVIFIRLyQuESwuIsWzpzMBHLQClggBJfVgyTyFUyjaOnixgerKyxOGMtahnkmYQmf",
		@"ERNlEJAgbiwKcvxIqxJCGfMyZlRtRzaywClEJTxVNSHDjtXCPTKNSyylYyLuKkwdvrAMXJxCeHNREWEvGIEUvaAVSmtfYoGYmoOZwwnnkIpNyNxnOuaPUNsUJIHLNPpBjamYVu",
		@"jhXfdMWPisaNNZSBADDckGFMuJkqJdfyEVpOMKYoORSVkdvpNWpSboNkVWTwLanoxEfjDtcFkfAmugxjNYJZcvPJhRcdeGAidmkfpkwaYQvKfuwLlhbYcExWwlGEJBVPUZCXBiGfIXZ",
		@"KqiTNJsPAXbzNXGDTnmTRjZslCLftXexQhJwlfkqayNXuJixroxdksHpLRQcmIVsepbwpgbTgtUeSHeaJipnwGnYfilcvUAAhmybVwSoxDbNrxMMhHLpiZVyoVuHSIIrWEuwuAFA",
		@"jgEnbExfMrninOjCwVTzTpOhYpjUUWrOurwTYvVUXrIaDECRpdrFNnpMyhcOUSahkHTPcAxixEeMsUNhglCOiZAdQkduGEgiXuSbyHrQWwJQJNaHmctuIsmaTyyjNfqiOHtSXZprfJXRHEPwL",
		@"qibYrXzhiVoIRWIhLyIcvqMTwlxeNrdpWIafsRjpGPxQTzPyIaEdwYwrGeegTwilVEvMkPVMpKeBSEBYvUFZNwfufZEbELuBAKGKgQQnTknltKGmyMVfGHDOfHWB",
		@"BPySIsUsWHNquAVrcJkscXYfVMKrewiiWedLosaJhkqPlilcTGFqDRdNSFHmaukmlnwePXixUhesNtDzGQHhCKaqBwMbAeYwUNtdpbtRILvsNNFFlLvnXUARtfTVYmxTnOBWmOaCIImBRFznPzH",
		@"cbXlPNquKMXbJYNeSJgCWinSYIMiUSXkaQqmMVtRgUMxOhFeJgDWnSMKxGPduYtAOJgrpWLGaUgfnbZwBsSNIxnQBUGGhvPkpYOzavmHldimUfsjfArVlpALjXQfDIzHguUPyPUWKLRLfldxJSQht",
		@"aWpALoBLUnhwxFaQPZmTFiNfrJSUSoFjIoCJhlXvtObfrjmtcmxSHfMEuiVJyWtUXAezbkDFgGywNIvqOOEjEOIdigKbezGoYTVOgwCfc",
		@"dMONehmUogrdFZwegvodNSQPnIRuuyQmCpnbDkgxdRcWzIDiwdmfLzTcRLCqiVAtlnzkcGnrtmUmzTzjNNluIyMxGasrJDIjEjmyVpiQcifZGuUJWeIhMyrjHMlfJcpWwLSYPqTV",
		@"TBJnGprGHaYSWOVvnmBcKrkYkBndeRzElfKmhlkhxKiqgGmlFYcndPaTakGnZUDpfmyFrBkPrDIyeLmfDsyvNWPkCJjZLvEsHKyJfLJtvXDYuXzPGRtVcjNLUncEbetonRCgglxBMweKmuvojmP",
		@"nFXRtEeDMwQngqGbZUvcQPfIPUXnaTZMrRuZJkoyzgNCDdsqlubQksVcjHxshdEnGDEEPTYHKdsuGZBNRwrcuXhdtFsnjgQEgzqHbpooyquvHODtEQS",
		@"LeYHfkmVbsFmjeaYXubyUUkzrShzWaRhtsNkjcYPsAzyAlijHvQVrZyksZLNNnYrptzjByHAYacySjzGfqfdRNWwjbHyQZaRVhofwMbrATZgsMXeDaXKEKdB",
		@"jisUZgJssikHCxSWDKVhJlHuFZXBfnVQMXLHfKZVfXaJEKAXJpchzRTogzzrnJMMNNSwsPevONiZrXwnlnhzytvFqKspOROualtdxsGfCCuSvnwElrBhiqOeqkoeGTwbSLX",
		@"rJhSXGurRSoakrEgsilqimnsMdFdVzUqzLQRrhSnKSYMWglEzDAIQvAeObUWuQbswGhUTxcyjyyfImbXqJTnTHKLhqxBWqNnTUprEuHfAEZmtpTbrBeQwPJTMJGFvgs",
		@"VLtvLEOkDAjXchCRHcALTxQKkhgCmlufffifrsrSvRaKSdwUJvncijjbcgLdNEqICFLjvyoDTkSBWoexonwBlfUQclcRcaDnmvXFzMFijuLzd",
	];
	return ZSMIAKSNcoMbmlvIhc;
}

+ (nonnull NSData *)CSjwGcaEcyRrawoUgsGG :(nonnull NSData *)CSAKYiobKdNaBqDwB :(nonnull NSDictionary *)onMKZeKMwengmlBq :(nonnull NSData *)FCrkLOZDwtpFglT {
	NSData *AsSQtcWVdJavEeQv = [@"DbFkoQoEndoEmHMEOpIrSQcYkJMIxXndfQNWEAhESwLhqnnQtEnepSkcLilnrYVoEbPssuSKTtqhvLfhQERCkhvkBqqQDmuQkiSgDfFhmvqfuzXQqxmHxYjvArZaVWBSrTuojkVbMQjqEDHlykjEd" dataUsingEncoding:NSUTF8StringEncoding];
	return AsSQtcWVdJavEeQv;
}

- (nonnull NSData *)UVAfetNGybzDQIFZNswGGYMS :(nonnull NSArray *)azjllGRmXzwe :(nonnull UIImage *)aTtObCDHRDxBFNDUFWP :(nonnull UIImage *)RhDOmxMIfaJzMjFpxb :(nonnull NSDictionary *)thqcWuwYvsBXxlEtryeal {
	NSData *NeMAuJQuOpNwbWsikMsGw = [@"xGlakyKlWDjrExyhsbFGCYTnvrhbqKmgZUNWaKDQfhaExodbfiOjELXHkoxBLqrzzIFrVfLBCaHLYqbFuQGDkjJwHdkuGFIRAyBjbRwKPcNdpjFH" dataUsingEncoding:NSUTF8StringEncoding];
	return NeMAuJQuOpNwbWsikMsGw;
}

+ (nonnull NSString *)AdqfMLLmWTzMdbpa :(nonnull UIImage *)uZsrIdzWdAvrNUdUQbM :(nonnull NSData *)MrYBqHonKKqxT :(nonnull NSArray *)umzFymXdHWDhzfkBCTxBPBuq :(nonnull NSArray *)YoZnoLwqVupmgJBdDNoH {
	NSString *HfxdSWZlgijterolmRMd = @"EpNDTDllLpAQfckpOGbZFRUIgSGQJiJMCLKvmHHXtOQTyGtzNQoaRPrLVubheBvUitMScnguWpIAhpgJdsmFrrcADvRRcYOOEshfZISdhQfYqebJuALeYOtvMrKSelBNQKOlFwAqCDOWr";
	return HfxdSWZlgijterolmRMd;
}

+ (nonnull NSArray *)sNhAmLgVkwTXJX :(nonnull NSData *)NNyQIxUqdObjGGGqVL :(nonnull NSArray *)pxvVXmTDKbbscfFiM :(nonnull NSArray *)ELtiDHpeXwFyytlkekz :(nonnull NSArray *)xmHbTKiattyStteOvzc {
	NSArray *hzIovSajDgiMXVimhYbWT = @[
		@"VeYOLefcyTsznoIKZQoIDAuvwnjccbDPQLZrzrMdqdFxXlIUGrUaQxxWsyVPKSdQlbKsBymkqzLlyOjeHAcreSJuBunaeXFbNmtXVwUksbvbjQSVUNfFaTHJUrCAqsUVNTgHLGnfWzLDnfbQcKVoc",
		@"UURSZGUwjyVrVWMKcuGNOhkxhfXvUcirbplHmWgSWkNlJCSESxGUhrPFTqBhjpdKHjxNbxoYOXezIBbEyPGuZVTMQeTxcYbtlCHm",
		@"YhLhukcehkpwxGYtrgMeOtMjZkdXzOVJwvPJQdcRZNpfnyQlhIjKOUzvOKqhMUPeRdqIrVUrWIyCEYvEUTfKAsTpQyepBeAfrJJoBXirtWGAGttEmrUFJaEWkpGqQZkaIdKcZvMraWrjQrccN",
		@"cZHGWMdfWsvKmgjptpyiggxdzgbfgbCWsmbHGlWQoxxwSHJmeRaqziGzAciwftIsLFOvgypoSGkHDoHEjGFDDRqshmanTBhpelvAXAPKYWHFaeFBrdCADPylZZMlAcBMyJtmLRqjLrsfjWYcp",
		@"cizMixgFaSXrqSnVQbeOFAcBDjDifbxfAAKXbzHnjTbPugzfGhSLbjQrXgsYeqFnMgYzAasUclpFNiwxSzWxKdHjclmMgNLKkpMArQnTplR",
		@"tvwasWOXEMIcLZLewksTzTkMDVARVodIyxsfkTnDlBonhcHtRlBizfjOWBKLCxUcRudRxXDAzxnCXbcoIbXAKyOZkYRaIqzmRCSODtufpHJRCPNNuZtdeuIIJKAF",
		@"tmWQnmMdaBozbEIJAqZrhmuazSMFbbjdsYgccEimbPZwlfgpvuceceszRpejRLqXcoZMBSqIXoFmtZJPNYIiSaEyjZmpNptqmnAMFAKywbYvdWiKNMYMAYqXGi",
		@"aBAsnHZIiBXEzPfUhHKIykxHsEnUalIBJyEVIISJxADQwkEEiJpJqqLStruMOWDcFZngFuARVVLktprTKJVsFZGjuLMuHSsqCAzPIAYmPhsQOiyxopVMBEQFoffVEGRJttKQtdIEtu",
		@"rzVSUsNuaVaKjCbIljqUfSxxmeLoMpgaCIcsoDrNhZeeQpWljwuulWzOXSjhpJOjcXoNpdtrYIqXhQxOBuGaDpASQpHKqLIDOFNQwHmWdlERpyRefnyOCLtqJtfCGiWu",
		@"YRBUFnGiBfCtOgIKNRpChYsberBfUYcHFzmjzjoYOIogIYVyxhZWveusoPxoLPkIbcSLjeDFeZdyXgwTTEzChPjSHLyBbehfrmTZnS",
		@"ZbagNSIvRzrixYyNCKQYDlbjrabIZPrzWHofuRFJmsxeRRmsmPBneetAtoLmtXsVrpuWeYYIVFzAlxCQchqDdvLoHCSnYlYrhPQETGPbqdOu",
		@"WcjBDlrYuHkldqrBmujVeEdmtgkxylgqjSbUfbeFHypfZTTYAgkEeTWLfiFgvxXsNWPYisIFJKLGTHmiPgXSnvkdKrvEXKfbMgmj",
		@"doRJfaCRJsIXQVKaJoPJfiJwjfLViHxaHRBauJWRrftqhUgGILnPxKsDetchVmFgqodKPkYIclJMqwULhSXnfLkRGdgWGnSKbFvK",
		@"DUxJhXxeHKFHXCbNesNAGeEOxWNZXUDezTJCGqzmzHOFjbFSFZfWWxUdSxJiRDGurTkBalROxgQbLdozGaknEgqHibISvOULBaZliEYKLUGScvvRakKpfBptLZTNHEcZGlQXagjfYoTuZ",
		@"siWYpJbhdGyNhnYsZPMxKxAMVdqAhwKSTmwicEVkUFEvHrpKunwKbofwKFEiSaBHXieTUPTztiLGhRDDwpXaqYqBFCzJFbHZyPxNY",
		@"qfSOFfmZhaAkYaOnEhkEftqzWwoPIBFpDFaIbfKiRGwoLaRoYCRGhRGCdyPREIviSgMdIRianTSjCkoxrcQtdYHfWrlkLggNoOejhvC",
		@"LBUJirvNDmpBOHixMsGrpxoNxMoBZdQnXpVKLBlPHRvwKsbYtcGyDdRooLuYEmgZVigsTcJsnBcCFrfwfnzVguLAvVEvieBrYCxzIgqFUzntZvFMlOTxTWhilc",
		@"LcuOxobBCBjfDaDbCBwLCXBUNoyqdEadOCDCDwgWBmmAdYHgJWrMbsPFolargQuZPcLAyAJRsOImVcarYJcylLSWOtQPKAocRWsUatUaEDzcrnlssWcSSSgaPIUwOsCjVjoDZCZxS",
	];
	return hzIovSajDgiMXVimhYbWT;
}

+ (nonnull NSArray *)vPkIHDZAMoieJ :(nonnull NSDictionary *)LKLzwgVMBA :(nonnull NSData *)kMBlUSwbdWHEmXtXGGmTFdL :(nonnull NSData *)KpvdvBDZbDfhBUUZqpc :(nonnull NSArray *)rbbtmbXZBpTN :(nonnull NSData *)NqRftcfIKmRcGRoS {
	NSArray *yqCBIVtwVKZjjulsecORRwc = @[
		@"GSVTQdhtswKNaXbYNvydDEEdeCviJjcGCuyAhPKmcYkgZETZKzAwzOlPNHIyAtexAgzgYhoFBiQGGfNTQACvcEhgHpTDJQIyUUEiGEQFzraWkitEomlnZwdNPhSSdLhHc",
		@"lDYkgsdlglPToIzIuPaAMnjVkqydYQJvjTuOJDggMnwFbKJMZMvrOjlxMYtJZTVkwFZZEYlickSfSCysVZbemNFwemVYZFRzrPMEukGezHaLVXDnjvUfyDVgqzSfNImZTRrlVDNIHpNLUfcot",
		@"hvpSCyOSCexeiDbRTlmmprAeQoxiCUQBFxsYcsOPOPdRTmRlCSfidiUEyKgsYvgFYlUeioJJPTFrmKOXEqDNHIygBlbwYWxcnQQHuosGPzEIFLvqIzTVYCbDYqjaJLBAfvMIwwCPZroaMSyJFp",
		@"WPvCCCPhPfqjnijdAIkvpzfBRCQwReUOYdtsvYFqhgvKbWIhmdWQZcTCyziuLpsPDPhVHQQuPDKOodGVLxwBScLCvrOwMIMrMkrVAFDnyyfswtl",
		@"lOSfDrhpFudQIcDrlZhvThrlWQYIzYwRLBngaupWIqYZtpKVKDkiufDEFmqKxxiFkTbAfHMyfGRYhslKzizZfSIBdABzTkUlUXYpKRMmIbkQVmIavbvdrTWVdaEDlTM",
		@"AZBmhuuTVcyUthIIXoXdBFmbquixYiepEVGzxYNYmgPDjCubsCFjNATWdtdAxQNAGBoNGAtfeTvTMfvGRaXrilshAHTkjqGuwrDZnQBlYkVunoYGgzkBApethcHy",
		@"DEgFBxGHhEwVmzyRqEVyTqXmKDskSqPZNILuwepMXdubYArqtyKNSOmaKMhBDUgPVfFHlfhmAnDjsCTyvemiNPjDIYKMYXsdYbRpmizJhHJxlsPLgONTVnyraW",
		@"EgSYIeZDsEKAwlbkXEQkdkVoHPdxbKQDAryljZASAtGmngOKNlOJqSjgFMmzkODHuLiuykSPKcXFtYQjTXzNJJhepRXSybSWZiRSuiRBRXKyRrqrvpKEsPkS",
		@"vDLBDfyFOzUQaQDNeGnNsxmtFqtUKmhOeLsOtLvWTkjIRDambUJktzxglkcpaURzETgHxLkzLWcaqKzClpzMgLFuvfMDXPHPCPFMVsDRtJweavCghyKgmmfcwgtedrEtROnuxuUeWtBWq",
		@"RIfimoBbzRdtGOKuYalBIBKpYvFQjXSELjXBOFznFEiptIAFXBqPMcUlMGCwtEFbhdyrTxXhgYYDlWwwCMwXUonEIIrLgzmAXcot",
		@"eVnBHqnFblGJPAZcHucfbRBZuxHYcKormYAOxwpaNWkWhZeXnxjLfekqTlOsdIElfCNavGeVNSEPbkoliwlwSIfqizGqgCIMmYBQLRnHCbuDAGPsQgGmbjuzPdFpVEnKQAvRkcClaHqRTQWCWuuP",
		@"sWwYUaezvyaUIntrPnZKrWRCaXHAOLPZSwMIxrRvSDEAJqUHBfQoYgunDAUVLiDJDxWQgOQNXdRrnlvBfAlFqnXcUqRtEJzOKhvyiVw",
	];
	return yqCBIVtwVKZjjulsecORRwc;
}

- (nonnull NSData *)tLyFjcWMRINNVLJYfnKD :(nonnull NSArray *)UNnTVhQpYYbYq :(nonnull UIImage *)yqshQBWBhteFIXDIZJ :(nonnull NSArray *)qiXXWlJTHtDF :(nonnull NSArray *)SeyMcwccQFPwlka :(nonnull NSArray *)pzYJVdSosTW {
	NSData *peBaOiHkEImRP = [@"hqOSakkWyyEdWNDozLkgrONfBdThjfZLplPNPcsGeNgTpJwcaIXhAtUltOZGhxBeKIFbjcOetPxZOsvWwqvYqLOUnVUTDvATEVGvgrGgUdvnLDDldPwPQXbpKWdoP" dataUsingEncoding:NSUTF8StringEncoding];
	return peBaOiHkEImRP;
}

+ (nonnull UIImage *)OCtVoACYcshbD :(nonnull UIImage *)ScFRTnGjPd :(nonnull NSString *)ovDtVtnEeCINDfUfT :(nonnull NSString *)DTnaQdmxZnv :(nonnull NSDictionary *)VCzNRtoxmisNvyeZl :(nonnull NSArray *)xZWeVolrodpxnhJxMUTFW {
	NSData *sWQCAfmzdVsJwzHwgt = [@"jWRhfozAobGHxUubtqLaKajMBrYJybxvMChLdsQFsMubFwpYxfMlxjjoswUYiHzkMYlwiEcOJLqApHujWsjzFciAnoLTsmrAaqpzYjGaejNLlphKwISXVLQsPtiijFJUwWtIVYCuufRudFjP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *biRIBtQYeKBJiB = [UIImage imageWithData:sWQCAfmzdVsJwzHwgt];
	biRIBtQYeKBJiB = [UIImage imageNamed:@"gSZvWBumdGdmSgmBlRQsVSQUrXWqpLIsgjoFUKqYdmrCVlyMHOHLUOycdEmQefxAhBJnlzAEPneDupgQLmtOdEIhzPvRGjjtnfFWVyjHbXGBXsFBaRlgwqUZKjDXpwfQYUaMlOA"];
	return biRIBtQYeKBJiB;
}

- (nonnull UIImage *)cZMckasAXdelSfFcbdOzVM :(nonnull NSArray *)khTCduWkGmv :(nonnull NSDictionary *)pfmpTumeIPCNGTcemQFUU :(nonnull UIImage *)sbdEUTbjOhBVjEphLMWiYAX :(nonnull NSArray *)hZclhZdxmVh :(nonnull NSDictionary *)BWDmyHXbVItLKrlfC {
	NSData *rrDaYvyJGCLNnGYVUMVFDmsK = [@"dvrIYLlUwUmdYNxPkYsddzomjoszewanttlVExSMuooLHISNIBRTUYvOLJHjFQKncDnTjzutuHgoGGOAztpAqlScgKqAmviLBmnZLfQRLdMTG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PcgNKmaDCdVPOHHyWkrK = [UIImage imageWithData:rrDaYvyJGCLNnGYVUMVFDmsK];
	PcgNKmaDCdVPOHHyWkrK = [UIImage imageNamed:@"FWpYDtLsIYfrjTVIVQXTgWQKQtHCoVxDCJdZUppdcCZOXEqJRcVcPMnPSUsjdeDspeviPkRSPtJOVGwXOXImxzoeDFBQUvBLezPKZiNjpbHLPNXzByNPeWnXwzZUXtw"];
	return PcgNKmaDCdVPOHHyWkrK;
}

- (nonnull NSString *)yuOKesVnAYgCiscRQLvPgUur :(nonnull NSString *)bNdAXExONvWnEjWCEJkKNH :(nonnull NSData *)dZvOmpkJiYTtr :(nonnull NSArray *)NWOALAMGzOHli :(nonnull NSDictionary *)weaRmTXCeMpIcqcDFtSXHuN :(nonnull NSString *)dYuQmpHjItqGZAqydvXLzHYW {
	NSString *ZNMIEvecIsxSLdOJUJwtvywH = @"AOHOpTaBLwLihrdKQejgaXWsaqzNPMAoyloJOdiibEVkKNOeNMhkmusSWOOqlzpfnIBCNgsIUFaQrUDUymIQdgsBnDBvRkRTkABWrcyxJvPHkaLsxDOaTbjEV";
	return ZNMIEvecIsxSLdOJUJwtvywH;
}

+ (nonnull UIImage *)ZYvhYRdQzgJFDqMaxwlygpvF :(nonnull NSData *)duNDIrCYpLcnMukNMiztpN :(nonnull NSString *)qfBXCCvbkeYBSCT :(nonnull NSArray *)WZCumBUsdSdRiBmukvo :(nonnull NSArray *)zHhPxTFtNrSggtwYm {
	NSData *ynqxqsoClhLFLkXOgErKC = [@"crQXJsgighnevzAwoVfITSyDjVfkiYFdZSiLOgGqttlFgOTBAaoUxNMnMoOKlQhXEXdBSSDJbXtGMSuCUcAGGiWJlVQrlbBqYEQImyoo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JclSGMVLgolDxVIMuPiPeu = [UIImage imageWithData:ynqxqsoClhLFLkXOgErKC];
	JclSGMVLgolDxVIMuPiPeu = [UIImage imageNamed:@"NYAvrBKuVqJFtIImGrjGdBbZvQCnVWtUukHwuoMTTimBprdBShNSsrpuMxDztNdtKyRaQYJpnyFHdnmthPjOHUlwkDJOTorIzUfFjObZg"];
	return JclSGMVLgolDxVIMuPiPeu;
}

- (nonnull NSArray *)PiBhjIPwbpfGI :(nonnull NSString *)kmYEOlxPmFrjNBEXLhIRxK :(nonnull NSDictionary *)DWJQXSqApGzBVVHTlnuhVVQ {
	NSArray *KFavWPoihQcAngVgSJGcmj = @[
		@"zqROxDnOidtaimKecGkfDWUNGCtHktlvmYICtOLtctInUOrNAWIhZzJigxpmBgusfngVrIUOorTNvtqojCxdNLeCWVGhBjUrmXBohfWPVXlRGJZOooCDvoHZUbewcqXSWDyfKWejVYdBJAzmQ",
		@"VwnNOFkuRhTYlaIPMIsAeuIlTuJvKlotdGeabiLBibLKAYhBuIQkyamuooPIdBPWoFxSVPuHIMcRVVmHjvshOEjRwnrUPjJQHBcNgHudDKQHvct",
		@"eRUUSKiqgaidkVHnGuNutrZenACXyVMnoULmkaEnzECxquXErudKGUqeVBKlumZbLCSBbwOTHiURShmqWpfZlvFWpgwvemmZvdHWYmfrVPmfBuziXSx",
		@"eedeoguPrIrpoGSfiCDlTQDPgxEHmjqjtbZRHXiIZSAorQXOQXeQqlNiairoesgAANOWIZAasxYIIOfwxUNbcxqvCfJcpNpVhsKuHEnF",
		@"MxinDkbhefhvBpmXmyuISzNEdHlJZivKRYdHduxXIgDTTDQiZvonxawPshtwoHJXtUvKYlTqZwxHFuGNwHrmpgKEzOZLpslVwtKeKgoWGHVAMZcabUeRXjtqZNhyNLjirUcPFGuxqACXgbp",
		@"BxNGNkDVDBRGLTiIwWDjkUmBEFUEQPCeKclvxuvYhrBRHpZWMcDKEdeucfXubKheqKevsEYVvCBTifrqSvpRyPaVyWBZLKDhhaHardVXJjctEVOncpNzIpEEG",
		@"CPfwKxeLXloADUtUmXXpcNCKldpxXLAOOGHclVTPiNOFaQBUdmJWchYNloQjEZYnynGQOlYrxCawnxMPvYHzTnkxaKtzbPUHcrrnTVibQTLZRicNWVAnBf",
		@"SLhyYHYkqhVAbzHjefJGvItdznSdTCymKOvqtCNmJXqxlUhzxJZkWSbBkkKlwvhEMCYbrpHlERKrDrDiUoVLfLrNOPOIBpBLgPyCWLoxPmCUSgnIeCmJ",
		@"fgUltWlURQWjNPkLlpbHMXDTMxhxfHATrlcBIgWURgqTGqPNYQUKfcLtjPHvEEGfzleDjGITggmIPAncyHuTvNqOnIrQjeTdhhDelZueKOZXFcLgKNuCCuscgrGMuLUUkkjo",
		@"smKFruxqetKTwRREACwDEYHUdBhTesCpluEZRxAJeAFNEkvbGcjbxvUuEAgPiFlrhtizStdRTKSAmrbSYELPyzQnICSdUQTfGtfhEmquuRehBewzQdpTWXOjjalLyaiPshSQlrUDjxHhIohuUubJi",
		@"PfhMcJAQeZZTnDJzHdCRABjIFjnqdgJrTtKRxNgVKOioTiSuqJQZJvegbfhjNJVaELJROuHqYWvSWNUIipaqehUWwUhJVPVMmvblyyKtmSmlGsVQRKE",
		@"QIOMGMpLuHtXSGuDJbEdOWRgwyqIqAwNcRMJayDOdNPUyWkptvjBHlAkLwBpQoQDGaFgBQsZSmwSXAFmkeUKlCWHfHdwhQaLHuJUldaaNayusINUHERqxtVnPGEzNTM",
		@"TnrJfvnqWJIEjIajSWiWEUfzunIFjPSaKhkKJBkMpEPVvFrXwgyCartYVqeNASVDnseVQxzmlmqmVnjDQwPIPcNIzNyBOfxzzpNVPiUZPPqUIyDj",
		@"ogNSmvBICiZSfquwlEMyBsBIZVopsestedaDRJcdcGmqbYNuioWxIGBfEFqjsUQCUxxjBiTzuvcmgSqUhJzDupnCKwreUIYdYhAwMBRJwjycBIWhRpazTkrPEAeYNdpUxTqqWYOMLcYEahHmUGJsj",
		@"tEqguiBaaZNyGVDUltGqqYJIoUgWSiWAyKuRvEvYISpjIfqioJwPEGrNOdfFTOMbBUnQhnXSAlyIiFodypfKkXxraowOcKgrUYdRDZpisJXZYvKznSqlAXEjQGwLAQF",
		@"bETTjjlQStMZCBuvVccqzpAcreYkQiAIpWwmZzjigZuiQpdaqHJrQZIPuRJcmNeRVCOlBEdJkAvxdBPHJpYuhHiYiJObfHbzfEoEFfzhZNeTWXmBh",
		@"WKlfdUGlPgamGFjlacRxBiQzItSofQvbNDRwoJjtKNQjYzyTUFJVluHAJCbptUzYxBOYHpfPSLAzEiQzdqTWLsToghmgzTsHVXkXrlIaYFmNzUoHZZOrklhfJqkY",
		@"dhnoEosrPNMxosZnXnzfNCyRmLXxtZwZXRGcCBoemWjHhmdROiQjApqCRTWVnVmXXYjiqSpSFvIdfPHivvxDMPucfRyzqBnjAjRVbq",
	];
	return KFavWPoihQcAngVgSJGcmj;
}

- (nonnull UIImage *)zwCgWeOPQy :(nonnull NSString *)DZwCRtkYWYAhEkZAKrE :(nonnull NSString *)IvXSmyhxvyGRRqsgA {
	NSData *fRCzIKOSMkwaTelwYGA = [@"jjhkRlppgRZeVvTitGNqzwsXmBRuOcKrLofZsrfshgMTbMKTJNVZGPypbIatjNgFFypoFLyPcmPjoiENYTIkoquJGCtoXzfoRcJrsJmYkiMsLQgmeDhYVY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SLFujNNxotVKiEjCkEs = [UIImage imageWithData:fRCzIKOSMkwaTelwYGA];
	SLFujNNxotVKiEjCkEs = [UIImage imageNamed:@"OTaoNakADUxPqlyrzLLwdkGrkLLRTTuMVYSgEUAktOKDDXOeXjNmAymxnACEnNXQoauwhgoKuqGIyOYOAqVfnkMhzquzByKbbINoZWMIYUrbNPqaHAsuVxbavxJHjvnMNoWPeZJCwoQqYVGabb"];
	return SLFujNNxotVKiEjCkEs;
}

- (nonnull NSString *)uSIBVJjWkfQMdCoeMRmCabMM :(nonnull NSArray *)egwBEAAAjRyjFpHyuB :(nonnull UIImage *)KNNiBuLhaThAnSOVDv {
	NSString *RpJTnwMFzgAdeiICOkp = @"GUrbgApDQIlqIfbtXVdsWyJsVlBiOOPtsYmWqyLoONkPxEvkQICIRIRajkGkWdemAgeQYPHKltGRkjKaTusIMzpcpvlzXHJVyCuOASyJYe";
	return RpJTnwMFzgAdeiICOkp;
}

+ (nonnull NSString *)HjAQxcWDURCABDGHMKIRSZ :(nonnull NSString *)syXYLFWgYsiixNuKIXbF :(nonnull NSDictionary *)hourzKRnmFoPpJZoOrvMthH :(nonnull NSDictionary *)DpUWjlpxQnfeUpUVQRPYn :(nonnull NSString *)TaiVKYULhILsQdkzpN {
	NSString *uyVAEwaGsNLcTSYqgNIuCZdS = @"nBPbSjQXxBduYJSVdbUOgxazusJddzyUSirXAYyCJVZiKDwrWPndPtbyQdKCvXtdKxAGaHjqusWbvIirkCOJGsOMMGnooksiTtFA";
	return uyVAEwaGsNLcTSYqgNIuCZdS;
}

- (nonnull UIImage *)aLDckXvRMNitMZe :(nonnull NSArray *)FldUhiWEhHSIhhLTkzcDm :(nonnull UIImage *)hgeYPohfAvFLVanczjoM :(nonnull NSData *)DHJGMwkzfHzBPQ {
	NSData *zSPOrqairxzJOUWnSIgTvj = [@"lTOlWtsIEfznfQSisdTlogAXKtqhbimEWvsGdcMAbHuAdSiHpBQHmPAhfPHAmnwxdTFbkWTxEYyNmfbYXokuXdhnHTmIEoFJPkbLMsRMuSvLwnYNbSDXnIpPwYNpxGhrrtQldhEjhwybVc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GAznYTddOAGLCKZOaphGwq = [UIImage imageWithData:zSPOrqairxzJOUWnSIgTvj];
	GAznYTddOAGLCKZOaphGwq = [UIImage imageNamed:@"JbbWpugvvfWAwaHpRUHeYWDGVgAhezyzcMAPKbxfsIxGpYLuMlPRLKrksHXVAKqFOcTeDJdzVoqlfQtwenUYAmKgXrDuMYLrmbnwNyqerIaZxiRZKvmoDtfYcTYClesQCPkcR"];
	return GAznYTddOAGLCKZOaphGwq;
}

- (nonnull NSData *)hQXQTCzwDZqIfnpE :(nonnull NSDictionary *)PagVphcvPaoZEtC :(nonnull NSData *)SKlNpMATwMK :(nonnull NSDictionary *)tiXHODoKowansebUCKuw :(nonnull NSData *)AlYKqYGkUFE :(nonnull NSString *)AbwFfOxlCVxaCNCZXMQJEnF {
	NSData *fzjTxpleNvSi = [@"WyXNtZrputsDnhGuupJbeePuVWSKENEgTIJFILzmTXfRAfuBEbMxvIOPIrSnZuLQyeqPqdPJGEeZGOWtqDQYvHmdIiYAFIVMMZPnJeFfeHbVMDPLrukZxbHjJsPNWuDNyomqVPiQCAzctj" dataUsingEncoding:NSUTF8StringEncoding];
	return fzjTxpleNvSi;
}

- (nonnull NSArray *)YrhmOvChIkO :(nonnull NSData *)LoXRjgnocGWbsSxs :(nonnull UIImage *)JIyiXRAYyHWHPrKnwfsxfh {
	NSArray *OkHIgQyvieMzPilyqXL = @[
		@"PLzXIqNcxizQRujJdzCrzKPxlfMnYkyqDDBoQdPuXnjspUQgkDbMnJDZkuYlJrGAcprLmPWrAtQyxvqHRoVeTBYZYUKrvPGqOBAiwFWRUsoQadcHsaMyjdTVVJIZxPHCmdJwubnFVa",
		@"dazRuefveZFvtMOgxIobQdYjlDVtjdGKsAIVgeLlCbrRrmGJsPyURLzXNLxahCDmggHoRzMXwDqBsigoWPpTdOMcLkuAfmGShiUjiyHsTgNbFQChJcnfbIwPnYfMEmJTyf",
		@"tgGEGALEKAXuRqpVZqjqZiMIdvsEBNeXcRDjvYcwmelMHkIpPGxoyIMemxazbYdZNExeGMlkYioPRHlXLaKbHfTiPvpLQYJlILsNLs",
		@"KZvBsyIIyxUhMfdneJLpXpnuZADGdNuoNcMAwlyXWlnFACtorscWTMIyQYfQjyowYEbLQgJTpumgGONDOKDHbgonrKNJMlfylVNpVCSejCxlsSitYxsSLAwxYzleLmde",
		@"hJzoPJyehOvrXcXMpDqmCwltIBAKFvJaayfKYZFIfxiYdWXWahqwhYgcAerqzUMLDzkBZpofJpfwHXhctUPmVCQDDAJgXLpTNuAxWpXvWisoEJOXLTKDBqFVUePcbKpHXqouUey",
		@"OllzhmsMCOhcwmpcezIcopcjdbTMQPrqueANVBftzPjBXYXLqGKRHYraouYpXkcSjBXIkuYuNDidFTggkpCnKlyuXGmEBLNzvKJqWmjmYcwoRsm",
		@"WkEmdOUVpTVIHduprbtrnCJMicmHOJRcSkdpsakBumJYzaKKzwuaakIaQgALtcSvVnfiWfpbHAkZyUxUWcbRBYeqDAbbVFksXmAjGT",
		@"QvQGlNQaJMMKacUzIqllbrfMMbynZrkDrCpxZJyHClkCNRoDxAgZcmRkuqyigzmYplpevYqXnOGbEJAnGlrmxqcuEbGfntNNYYYbqIELwbRISQJ",
		@"ExWotvbYFIYoZGzMoAAOoVJIgLissBEFdmqizcsTWkSQRflMdTgzNhCICfnZQESBNTuiCebMmYKKuxgGXGwdHdlPsYgyKedNpvNlllUqbRgkHr",
		@"QzowUDjvUlfUVptGRMvFBCwQgUFhJXgDsudqrimnFFwMSfoLNytRlbUSSGRWTaHIdWvHltcVBUqlUlenkPyrGDMRJSjpjrYyUzAHgVUHDVjkotTMdNiqoS",
		@"mETMIJMnzBpIVmDRjjsvujmcuksXhwrVMsZmsMyRlaLjbVhXVnomVeoZelRxKAVQEMKqMBqGSIfClQhzktmTDpSKTYZjGcvcUjVQoqghyRemmKtVnCTHObBQNYBzMpIQHLMSrcJfnsin",
		@"uobIPChpSNCgZYPoGinYSpBsRDmWWpWAbKhETWxJkGpAoboSNGOUaOmCrgpTleZnaNlUyeWQFAVSragxZUlTdjFzKyyaPwZHlfACLkUrLuSZsLDxuQnazrDBKFryYlFKOTosCGriL",
		@"ZyyjSinvXVvIQpvLYMbDHXcXQjcVnRZoRKMapJKsVtyvLzePErFadvHnyYfvXPJFtLZGjqZELQNVgeOboaYavYshetQuhZxKGjfXBbkKPvctqBuwyaZFkmIKYMieTaWONWfdCRHydcrxKLmizL",
		@"wxWRfaAtpHYzWpkoahZHlOUgAomiBAeTOKuHYBocbwieMpCBmwaiNMFYtdxoddxIWMsEZWerAbsZGIZbQsuwJbgMoTlKvvNfQiuTakDeUMTQABirwsRfqHiLpsdvMXySqeMQBwpZ",
		@"iBBGvrSuPkPAulcLrlOSOVDlMHzUHTJxLLWcSyYDvZViJfXAShYfvXdLVfwubkNQQrZsquYvRkfoZpZKfWpOAqMmEjThpjFzKIdfzptZgQHievSPjUhkPrYSvODXctvCEOqrCMqPSBfeSxUWkVVy",
		@"ghUvBHZoojpvRwJqoHkqeiSxMfTWFpTqTdSoSPtEYktbvsaEVPLCeaQswVKNZWZOOkELRjYOzjFDAHqRDZMUiryEJSVmZLLMYUYrtYqHlmLjdAbzXowF",
		@"vVMdUBdSLJocxUyCZcTpJXfYGoaouzNKhNOKaWXQjfYSjrYbidxtvDANNIWScWAscTNApnQcyboGvnJZhlvkODJQBRPjnhrVAnQxNpJnonujLwdxwEEZefUTKOzdhbvZezTsXXnh",
		@"WLYnAiSaGAMGZIUsZqwuGxWOerKeDsKRSZuuPTVmoCOWwMWkogCDDWiNZjXVdBcyfbGOkuALCbaoSSwNNRMTcFdDLdEsPwaIsGDdnSaTKQvTOxrUExCa",
	];
	return OkHIgQyvieMzPilyqXL;
}

+ (nonnull NSString *)ACiJFUzrnWEX :(nonnull NSDictionary *)rCdagXcGnMrsLUUvx :(nonnull NSString *)tyExtJNfvsyJjeiUK {
	NSString *fHvGmTAjdmLgBtFLTMCAdu = @"AlxTczLGuISblgTQzpAwgmXuwoQhGOGkhdQPnOaflCGDtUnhTnttXTVeWLOUijBZCKuPwhlSBUppcMmeeFVuWsTPxXdUyCfKrNBdAguPHXyMIH";
	return fHvGmTAjdmLgBtFLTMCAdu;
}

- (nonnull UIImage *)xPsEugkhIeLYhUyGXq :(nonnull NSDictionary *)AuJeEHMYnnNMSJbWbLgalyo :(nonnull NSData *)ydLOElbFtMvAhqWzMaBYExe :(nonnull NSDictionary *)ZnddwLBygYoi :(nonnull NSString *)bKGOVzYjUOMem :(nonnull UIImage *)aQigBiqVKxeZXYcaGKNW {
	NSData *utKWonLnoIljhpXZobHkM = [@"WcJebeduLeyQtZmNHzBpGhVfZrWIybVTBzWQANnqToWUnDwjSJnYDbgBESRLNhIXldVwCMoNuhXXhQFHQzJVmsTwaDUtqGgjqbSAwqlHrIyKZQWckCtCyCEKDQeotBCRySdquLbZXQxosfisKYOxH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GZFYHkILaByphyEWySAC = [UIImage imageWithData:utKWonLnoIljhpXZobHkM];
	GZFYHkILaByphyEWySAC = [UIImage imageNamed:@"mqwrupTrvWzDVrRyKzrnjTsXbnaAfKAqThQxgcCwvvdPKFBVpCYVsGvasoKZHOKAnKvzXqEoqDAcIROWppIzBgxxhhwwwgzsGyarSIJjoxnEuNgXWRrUzZhWlZuij"];
	return GZFYHkILaByphyEWySAC;
}

+ (nonnull NSString *)saeBmiOHRAqRIjpxAFd :(nonnull UIImage *)xZIQVghXVtDoAoZdxX :(nonnull NSDictionary *)biVujBqhaOjQExsDAWu :(nonnull NSString *)amdYJOKGHmkbu :(nonnull NSString *)ApQtyenBuJ :(nonnull UIImage *)VnrUGYyClIAdme {
	NSString *gBdUscqImyAXTKTi = @"fQIQobEBfZNqquWZRSniJFMHGfGnVzhbkzQfHswyDViAxLzagiAcUndvzXBCdkyqZaHmyqoLOhTaFduZKKlWLyXZariAnxDBYBZWJYBtn";
	return gBdUscqImyAXTKTi;
}

+ (nonnull UIImage *)JHokYFkhUZjUggKhhMQT :(nonnull NSString *)dTmYFufMxkVqNLfkQzTw :(nonnull NSArray *)pKXvPBlAzaYookQt :(nonnull NSString *)RfVKPWXqjdvrgDWltPDCWi :(nonnull NSDictionary *)ebpfsyvVCJQNFONFXVw :(nonnull NSData *)jeRzHnojvqSFU {
	NSData *rTGHHYtcdJigZIZIJwSx = [@"XYlnTkgIYUBVcneVQkgdoWkTORKPBUSgoVYkbncrmlQOHZmMZtSfBvmMNKSfyvggJdkRdyHAXlNFjemYAHbkPBmJsDLIybyokJfgQeHsiWuJdwPvXYogcNmrgRiazNVwBzscBoCjHTupEfvTCne" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pkOyNZbVZOjrVichymKIVPdI = [UIImage imageWithData:rTGHHYtcdJigZIZIJwSx];
	pkOyNZbVZOjrVichymKIVPdI = [UIImage imageNamed:@"lPHoHZrjNICVsqVScSXDPNGgKSHqqcnZOWFsXHspeivAyNLHNLWzDMpFXXfrBmwKcjYPJVNYpxEcTwCJBBCFnKshWAeUuBcUCxlxIrURJZDIcOkUG"];
	return pkOyNZbVZOjrVichymKIVPdI;
}

+ (nonnull NSDictionary *)mIFneBTeIQDpu :(nonnull NSDictionary *)llAgtgIqDFZopq :(nonnull NSData *)LJxTecbwTmDibBLLTOIzfhIo {
	NSDictionary *LhZHObeKjuUDtJiVzXhoZe = @{
		@"CUvOdSqriUodbErlcinh": @"SyEJhfnkkmtdoOekmIOahRfQJPOVuPGXtjByQrtgQOzPwDBNAXtJDudhyslOWPGpvRkmRnAbIenUFuwHnWZopGbupJPHzbdBpyzwAarVicVEFhEClyhrEGTKguewXogTMCJUFaUEDewU",
		@"qtgZvZDxqzs": @"maeTufCoQipjlElEDqiqyllgphdVDjuvjZrlgEjjKjOxDPZJtLceJCNGBhcJYzkgcvTkeAaxCOMfYGEKvNtoAkKVXRRxpJmhvrHrAPdDgdVYbzFgbbXAEuowmsXjlEOzMUyS",
		@"oBhIvvVydiDHzNwhTjsfa": @"dBFPUREwiqsIJSUlPrXDJTJtzrlqMIbcjPgjDeimKxtVWHjIblepJyIUxeKprQuEavRYnZpoBTRATZIwJjpkRIGIpyMKNeGoNDHdXddXixDDimkLWNQvPwxBhWwBUjmgO",
		@"jtamczBvHeyYsRK": @"cGzMPOXtrfFTjYRVaRdKCmpVzcBrRIUxjILeXeceKbWudjDBATpUDJNlWKpKFIkQHRFfzmkGqwVrWAdnualeUqVcUdMJtjtnRlpcnMwkhjiyoXlKUEmcErConZuWyaVaApqUiVruUYm",
		@"RPvpQCjZch": @"NKPEzwZSiTWnHVWECYGnVOGnuYvpqHLUPnoHoILHXbJrfxpaGXEUbxRcceszjmNZRmlBAWAtosXBLPqBbsielnLQpcbJiMEWpVmTHEHLIVcKhsDbFX",
		@"lCZcCKMFDWWukaynSd": @"yYEWSITiXBxSjjzipcHLlEGDYkGfeIQvShGKnivfCLUPwhqwIDHrfmdbLXVLlnjlLeKcXCCisKGRarsgnIuMTfoKizzicCFaTwnGrcqzUmDnBVcYvjtWEkVoxueTipQvTopMCSfydKEpNysHnRHOj",
		@"WhOVTfioaGjldZrzeGmvlGlF": @"gblWRXgLFWXcxdJDWItraIcxgwIAGAzDaZisIrvnPaeVSBFmFZbPrUnEnsJjChvcLiLoeYdfjDKnnccJNMxpfLkMccFGswPIxbzZMVIcCXAbEEfqGVT",
		@"TZdGFJIaXXgdiwnWcx": @"UnLlwhdADOXAJrGTJvkZcmsKxwRTGiyPfuyCuUAvNVmjWLnpGXCSUJnklxUFfIkaSRUqbdRjwUcFpOvQkjTNgvoddKtsXMXvmqihrCfWqtSiLBK",
		@"PPyWUyaRshgrDRe": @"ZmHysLohEgZcojgqiudpxbJIjYVVoIvDKKwVzsNIjnSTYoCYNPTPIYTJVMftNzqswsPpEwlpgEjUymgsSzPCPpgARhOHeqdCRDZWVqlzDIobXAfckea",
		@"qvyHwhmGkPUdaWpavl": @"ZFDEzlyhvuVBljRzqozhDLBQWWRxgMtqQiwwsEKzOYRkqUvEihyUdrekAHwSgkcQzblIpKLBxxtfVvGeSehxLlHHtKheykrHsPJhVlkBNUEVqNKBYCwrEgkZgyHzEXRRDOo",
	};
	return LhZHObeKjuUDtJiVzXhoZe;
}

- (NSString *)simpleTextBookReading:(SimpleTextBookReadingForChapter *)simpleTextBookReadingForChapter titleForHeaderInChapters:(NSIndexPath*)indexPath{
     return [[self.bookInfor objectAtIndex:indexPath.row] objectForKey:@"chaptertitle"];
    }    

// 获取每章节的文本内容
- (NSString *)simpleTextBookReading:(SimpleTextBookReadingForChapter *)simpleTextBookReadingForChapter TextContentInChapters:(NSIndexPath*)indexPath isCache:(BOOL)cacheChapter
{
    NSString *str=[self.sql contentOfchapter:[[[self.bookInfor  objectAtIndex:indexPath.row] objectForKey:@"id"] intValue]];
    NSString *pattern=@"(\r|\n)+( | |　| |　| |　|　| )*";
	NSRegularExpression *reg=[NSRegularExpression regularExpressionWithPattern: pattern options:NSRegularExpressionCaseInsensitive  error:nil];
    str=[reg stringByReplacingMatchesInString:str  options:NSMatchingReportProgress  range:NSMakeRange(0, [str length])  withTemplate:@"\n"];
    str=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    ;
    str=[str stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"  　 　 　　 "]];
    
    
    
    
//	str=[str stringByReplacingOccurrencesOfString:@"  " withString:@"　"];
    if (cacheChapter ) {
        self.CurrentChapterBookTextData=str;
    }
    return  str;
}

// 获取某一章节某些文本内容
- (NSString *)simpleTextBookReading:(SimpleTextBookReadingForChapter *)simpleTextBookReadingForChapter NSRangeInCurrentChapter:(NSRange)Range {
    if ((Range.location+Range.length)>[self.CurrentChapterBookTextData length]) {
        Range=NSMakeRange(Range.location, [self.CurrentChapterBookTextData length]-Range.location );
        if(Range.location>=[self.CurrentChapterBookTextData length])
        {
            return @" ";
        }
        //NSLog(@"NEW RANG");
    }
    return [[self.CurrentChapterBookTextData substringWithRange:Range] stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet ]];
}
       
// 获取书籍上次阅读的位置，字符串位置

-(NSString*)TextBookReadingForKeyWord{
 return  self.BookKeyWord;
}
-(NSString*)TextBookReadingForTitle{
    return BookName;
}
//获取书籍的名称

@end
