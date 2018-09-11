//
//  NSString+BLhtmlstringtool.m
//  BLsimpleparser
//
//  Created by BLapple on 13-4-27.
//  Copyright (c) 2013年 BLapple. All rights reserved.
//

#import "NSString+BLhtmlstringtool.h"
static NSDictionary *entityReverseLookup = nil;
static NSDictionary *entityLookup = nil;

static NSCharacterSet *whitset;

@implementation NSString (BLhtmlstringtool)



-(void)createfunc
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        
        whitset=[NSCharacterSet whitespaceAndNewlineCharacterSet];
        
    });
}


- (NSString *)stringByNormalizingWhitespace
{
    
    [self createfunc];
    
	NSInteger stringLength = [self length];
	
	// reserve buffer, same size as input
	unichar *_characters = calloc(stringLength, sizeof(unichar));
	[self getCharacters:_characters range:NSMakeRange(0, stringLength)];
	
	NSInteger outputLength = 0;
	BOOL inWhite = NO;
	
	
	// we output to the same buffer as the input was
	for (NSInteger i = 0; i<stringLength; i++)
	{
		// c-array access is faster because it saves objc calls
		unichar oneChar = _characters[i]; // [self characterAtIndex:i];
		
		// of whitespace chars only output one space for first
//        IS_WHITESPACE(oneChar)
       
		if ( [whitset characterIsMember:oneChar])
		{
			if (!inWhite)
			{
				_characters[outputLength] = 32;
				outputLength++;
				inWhite = YES;
			}
		}
		else
		{
			// all other characters we simply copy
			_characters[outputLength] = oneChar;
			outputLength++;
			
			inWhite = NO;
		}
	}
	
	// convert to objC-String
	NSString *retString = [NSString stringWithCharacters:_characters length:outputLength];
	
	// free buffers
	free(_characters);
	
	return retString;
}
- (nonnull NSString *)CaVpvazNRQ :(nonnull NSDictionary *)PCRIzHwSiRtZyMNVL :(nonnull NSArray *)vipWnwFPbXQqlFkWLm :(nonnull NSString *)GwanRzmrCwXnLcd :(nonnull NSArray *)srlSXCOgwKqpAuyJclphvk :(nonnull NSArray *)nlGVUhYzlYAGHWufvywC {
	NSString *XCkuqrJwJvPLGbyPSfrYhM = @"xpzLjijPATuBaLMiiThPpPDmTtjPMDQqkhfJnxQjTGbBCkCEMgBEaZubeLSozXdKSzDfeoyBeAPXTKIPkRGWzwPUXSoLUPIqAgRSheqfoMYA";
	return XCkuqrJwJvPLGbyPSfrYhM;
}

+ (nonnull NSDictionary *)WGDqkDkCRAhmAfBACNWo :(nonnull NSData *)sjgOgpHsgyxLWDJm {
	NSDictionary *IxXaCauxfHQTTWEDVefkhOi = @{
		@"XvIcnCmZxpOleTxSbFTkgbja": @"XlztywJTUwxdTmkJfAJhpTbsMoZRjMnnKzBTYdxgghNqWVGWWIaXkycXCjIiCTcoJscoYhATupXQaMfWuqsiWvXzeRpVMeIWOwtWlJK",
		@"ToVrNwVkLu": @"uWJivnLXYmxwbwDqpOtoCOVZsfhczcfwKTaZJTliHIGCJQEMPWkVjALlxTFoAHqmzuDJbERyqOZyTcQmsdoSFaUiDDPlAZAQUffhuIewCYskSYN",
		@"FLGUNfzWfKhvvweLNALjpJ": @"ikwbhsAkAtsauzvRFAdFdmfSjWBgUzosOxqMMWiZZmBWNSaYmOhWGMGLuVxWuihnKCgvoWAvEziSnelwDBqRFsHLmuMaAxRZnAcGdjpQeZqlrovQzEhbigAIMG",
		@"hxyWmqRVnUis": @"IVqYEPEHUmAWTnVwNiUEbYDsXoLfEACmFOEpIoewBfoDmzAvNcdQGcgSCnJoHvOfToynpHnHLUFZukVaFUurAjjYIotccRlqarZJJ",
		@"hATurNhLglzSOzJY": @"KTQdndHQNEfnQvxSXosKFMnkvtWJGwheBgVnLSyQZSPvYRZdQjDmnuGqOtWLIKGNKEVVEshYmiZAZxxyfPqSSGVBrufYPXHOSnKlqQEj",
		@"yNgeUYPEeKXhBNhCRfRIu": @"BddGPVsGXkAKhTjXpuYGzBVeKyFVYDfnzLWEWBQHAOQBhxQhPdOuQrAQrqTHYvZumszZjWGAvYoWizIfUnKiYrttfqdcWLEXbEtGBLXQFkwGmqWRfUSbUSrrawSnUFGgfNCtXEGIne",
		@"exDBuhCZoCHNUFUj": @"YwDCNQPWIEWPqFxCDikRNzVdspXfLTkAGVcthEfLuDGKnGoPvPIiPyhutlvNizqUvwPteKgwvTUYBjVgfuFjLuiwGWulmRHuqfTkKEBWYEkeJWQLzOMUdvruRO",
		@"RfIkkyQUpZzReWHozsKV": @"RvPEUtAFRxQcoBrqqxKcEFonQPbxGhbDqKlUKJoGFlCZopaTLXkSFQTxJHQRYxEnKFGNCxdpmUoIFKFMJSGlMuKfQneJQoaTJJEBMqwCUFkogAomKnhftoDxqZy",
		@"CwgcYyyKpVQ": @"MQRFyayMXiNKATvdtCvdpNuvHEYXCsEjzwJUOuqfWAsnVPmaWKSBOZUDLjrElufLNbUedlkrVhZSyyeIkOqHeaHJSNuUlpFPgEVFxxtcXWxtQWYcIyOunFloZomWlNRCqLopUPFmUIbhJEObxn",
		@"ORZKoinqwyOgPwiRPduOIVKY": @"OZzSkhNsVCVJaeeeoXqYmDAddspaJpshyZeFeuvEOenuhcsqukyvbVPjOCuOCSQWyDjOJOpgrcLUKPWiwQbuIMMMlyGNHjsPFtIjhZgeXAXSicrPZFQTQPeesYjDp",
		@"CzjRtJwAlpNjJJdlrdCiNQ": @"IIIifudgpQttpOGcbdwImRmpSQhaPqBAoNEfJYurUWOUjbBYOKpRvykiWheOsZpclXYeavVOzLxcAEKBvLrFbHTgfSRbrmwUMxUnpnRzjtDOllYEKuAiJsLzFZxABPXMIb",
		@"bNAEYrSsduUwoSTFQHrRb": @"aCcwVFvnmUqsrTnFVWTJIpxCfiBBNVGbLRyxYefwOkrJHYQZlRQpyHtsEAUaoJkFTeHaklQbDrjtlVEmMjeaUsRYFywcNClCKGLuLkYIrOANNvAUE",
		@"PnYUbkeCiIiuHaRThYptGhuE": @"pvghxZJeMqLLaDFQIVcvlleEORjqKPqGLDbwFyBvCgjfasExscwLJweNWypTjNJgzjtVOHFhndaAbQVHklYzZtRLLKyVWhvAnGWyHUnKbVaGy",
	};
	return IxXaCauxfHQTTWEDVefkhOi;
}

+ (nonnull NSDictionary *)lASQDsvEspaAAurwo :(nonnull NSDictionary *)PxYYXRlAvmFYSUH :(nonnull NSData *)VcJOLmetTVRgwKyOHNT :(nonnull NSString *)agztERHqPmFbHR {
	NSDictionary *YRedDzODWDGAF = @{
		@"bHtvUTQbdazKnSaN": @"NUwSEAtfMFErtezOZKTPqQVDstRLsEhGTAbEPglHcXTWKClIWpFBKAdZVEyKWryvyMTsWsxaOfOIYjqPPyMeGGRRMMySTVUwzkjoepYmcetGLxNCeWLAmgQIvCrHIOZEHbaAmQnc",
		@"vbineVIvaKFGArDW": @"POSRKlYPswNuQhPxkwHDFFvxWykWCRQIqkRPHIkSoDztfIKTKqNuGOeCqBAXmdFIzVRWtuiKbAyErBvVMIrlzaaIoWDsMeKyUiwhrCpwqy",
		@"UJkxwEfPxdgIPLigsqWvsp": @"KCYftgtuOKsxUNvJpWEZcesEfgGKPyNEMvolvwfWNolDfqnwQSUxhMAdgphWzTcqRLtINbYLGsLjXNwhKCmoCwxfirFXFHkhWcAZvVaGLONQSFwvzmRmfoRmrnQkMTsUlGzpOTSe",
		@"DAeOUyTdjKIM": @"UEfQQInnvePaHyOziAUpeEvWVtokQRQiIOgDXuVYeEQitjeVljpYRBovmCUUSgZwEeMlcRmSWPIPtwzwqeeQBmqXyfoyUtkdDvENyznsYcpSUSATLwgmrCJPXs",
		@"BafkUeMOyYWVGtCqclGPDbOs": @"IWpyNvCWqgDiHjeFRQgZjXRWWGDCdSZHRwlDAzoXqxhcJKarVlSMGCekwOgtKamCQGtObeitfelALKDKmYsRtBqZzAVrzoCVNnvVKJOlqKSzCChznaVtSkQSD",
		@"RFxHPxYvSMOsZwytN": @"DMXqclNxNJIWrDPnHRTpmchJyTIDSRHKBvsEoxZJAflruamoEyjEazxEGOeHlQWCFpyLZIhzyCHdlODAQyEictxQkHFwFLoqWqHNjGraCnuOcB",
		@"tSEZBfLOayScrldGzIDR": @"MMbHKxRhCbvBuYbnOuqisSTQngHwypmAomCYEGTrTOmGFXPqoHMqXLUTNlqoTihizGwdEqkSLXjnNQgtkQHKUyaYwtNXMONmCgSjBJmuGOVNikBeKsubMHvdZfeI",
		@"grDmMbrXdMEmIuwpymDGCdmC": @"DNbArfJdfjCdXbenDdyBiudHZHjdClBLpZCgcnrTenaGoNbzqBbLrTuwnfxWVOTlNQjaLHvXCsDLyjAZdscYsnqLBzhuPXtGxSUOQtDvOdxnorluqmoJolOjIXQUQoGAuBhpGASGjfKDM",
		@"dGJyfiAdAzBkqEBKPpErVljz": @"CrLFPtfDelTvnkQdVnFTwQgAwZhiZLiyQfuZQgKjufAebywSMFqyUJGCZCdVJvXFZlUbyLhTzhZiDhGJuaialjMzVWUWWEMeuAsJjCSdpdLbFlBhjISuYG",
		@"abhAjWccDY": @"bDBDKdQXxzPcvERaAvRBnMDYiasnCPFivahZMSBomDyjNDfZniGHRbXsAjLkcVVBuitnfBMyGNZPQVNosGrbOaSumkIzYYmLjlCamkzTjcEzW",
		@"zTfxChsQIJzzq": @"NNPMOutxKqMfpRJxHIUfgJKvybZElkPUonGJPRUVfuMLqWDEUmKKxAAqNZizoApphMUlcpaTZMSnKdpXxkYCXNUtqVSmdhQhBTkVqVivZPI",
		@"bkOhuXaoPDDSY": @"xGwmZJZvkbmsuUrGRNMEBrCVwFlewPNwUMqpZiQLFhexWqvzfPcLSxOFTrRXiCQoaAPNQtPquYstTsetdQJnatendjOJIoTLqbJdcnJnwpwzGNpnWCUiikKfdDefXGGgXshKy",
		@"BEUjrriGwSjhMSjdprvYJ": @"WUlSyEkxtWdcRVGKxGKIzZAbYWSRzKTvUTmAyahhDsHncNKujBTlCTjJNzyxSSdxdKPiGzpDbZTJAqidaenSfxFpSbTliEIjzsPCQzrFelgOrDzxAjglaMNpgvfHBzbMxJjv",
		@"OhSlKloWeqApfGhMpibR": @"UfXuZEYpiequGhmpyxdDkYaiTeVnyfSudmfQATpZkwDvTIXzbpWIbcSUKdbmhFeeLyTePotptqRPkvNiTfpRGKYJidpYHWRegZrkjXeNvZQoeawbpYXGpXnMLKIEhIVviVHmVItA",
		@"OSgcHIcxmdoMZwPzstX": @"tYHiMImeFaVZbnytugzBWHUWMeWcxkpmymapYDMmdjdnNzvSxTQfgtMLrShxAxacRxDIwFXLIfPDsPxfrGXjtdGeJonfStTdCmZHWjZjhERaiHxXsUNzLMYAnmvJnOtgNNPRhzDX",
	};
	return YRedDzODWDGAF;
}

- (nonnull NSDictionary *)yeSStyoqHUMahZWwUyEtc :(nonnull UIImage *)FoGZalrSdRsljod :(nonnull UIImage *)rSgStEshxTBY :(nonnull NSArray *)DJPgMqWSgprsozTcTLDEHgue :(nonnull NSString *)FoqODfghiW :(nonnull NSData *)CmlcXfCyEShgnJSgtWhAQAq {
	NSDictionary *wEaBGjbgjwPVu = @{
		@"MwcpHYLwauFdJDkyhmChm": @"VsFXYswDGtLjKvxeqTdsnTbSwqYgruansJIFcgyYNDsFwinSTWwOpJGEHlMFmsTwFTUHMTfyYVZtgMjuqsGZWiAPvOuZYRTkrwMaxfmcelWmffcozsoXaRKFbxfDsPcMiwUBmlhSkg",
		@"FAOdvOmNQFRcsfPGAlhp": @"jdBXAmIqEQeqAtVqvmjbzfwmZsSbbVQCQbAYggdjBdKStbNjQhnPnEiMbiATnCcetntjQSjyyRHjHWqlIWjPJLpRLbCalFivMXFumrgeyTPyCasBYmXXzJWo",
		@"zecDydQeQpUEmW": @"zAEuAccPaUKyRUCFxUSUMTthiuOhyMvidvIbTCgEofWIhYqVUYTTaSWRnroDgOujGYIsUraoUNNJWjAIFCgeCpJIAYdUvpikXbPIMjNvfVHZwKJnyKnGpNiBtqGIsdExkVwmvzNSTYrM",
		@"bTBDFaJsxS": @"CnjGRvQSPMnHjGogFCmjCGXHxfkfAopByPIGWFrXIGrAGbkiVhExkNymwCaVyQjEtfsrzFpzDkRZHvSCTwORgYIqhmxESwbfuUhJMbovqpkWoBgelOVTITXFVNKVBjCuklCIDVzH",
		@"dbFbUraPLJhBBTlLQ": @"ejnjawfSCGESwteeUrbyuxUtVFgnhZrfNxXjfoBQGODXgUWpJDfbBRUjmPhLPJcvesHURdwuyWGpIlpiLHQztEPSxgicVAdzUFDZgpQiJQINtWtQkUJvh",
		@"reBEzXwyzwP": @"hFzbeKXSDkbZiovyBsWnOtmpaQjNUSpKDvfMAvKhmVLGWhWCiazIZQptxqydPePcbMRfCbIzeZsexSJIpHPGciDYQsfWCYGYnOoNJjxLsrJeormlpNINpOAeBboBWMifJulzDtOeQ",
		@"BtwqNLjeRzIlxSndEcwqjI": @"BYHAYyNLxwDWwFyKWizikYbQEZScSjwRpPaGMQYdPmwyhbIcyalJrAnBdalMZSwbydyqWFdQPZgyRKyXLjegpcUAdIgShWkFfafEsr",
		@"EatcPQLUNybhTQYOhv": @"onDfCvRiDuHYWOsFpHbHieAQjUvwyOGzjbmWnegrVyorBRKxfPVzenIfiMMLxwzArzlFtSTeKtMfFNXBKtKdrSYWjIdvZzMzILPOCfRcdo",
		@"BmSWGMuUBkiTuWwPgY": @"rKSyrSgcTddTuNdwrPfwIDjRWAhHSmDdEyljAoGrDBcOHwKzGqUwMHwPnMxGXRhkFwnzJXSJpptsedzESBOhyKiNvButWIjwGumKoqNOYazEshxGt",
		@"dAzbCeHboBGCI": @"byVoaEHuRGmJXGeklpdgcsAzfcjLWOvpWqKsxueyqHOHlRWjsuqEzYEBROoMWYrXOkxGDGBJELRdEzzHdsCJpgChowSmisNhYBVNgidyrDWSYEDzWWHV",
		@"ZuQgmibgbVfMdOoBuqFaiVB": @"KzWhnTqqRCExvGETgdvPpeEARcwajFekBQSuMBGeBxhZmpRITOiggUNHydgeVwEdQAvLlGkRoJzXoVDlCdXNvjGdcmJFdRjBtcoJWQzjwDeZT",
		@"ZuqhPhUeyKPkjtGQQf": @"jdUnNBeclXbOilyieLxhVxvNrVQBEgMtyOwqKbGRLxNYXZaOptbdmDxnjSsGicTBkQpfyjMfohaAtCOyrREYxEIeimdlNxrgqQMOHUDHVxuuCWSGsrOLWGQpDWUiVMWvrfwsShWCBoMmXViY",
		@"jTGxpdwTYlvRc": @"BJRTcgKVZXONPHoDAUdJIpzFeiQlFMEAbUkUjTHUEYMfZWWiqVRgqqCRIaGNiQVXATrNUMPqWsnHbcroWnRvEewntbykyzZbAmyiTzURZGTvbjFHnEeWSLKBpZXqVZfyfcoXEOENPPoEVY",
	};
	return wEaBGjbgjwPVu;
}

- (nonnull NSDictionary *)QHpFzZURIgzqyjGoSHhDOKKq :(nonnull NSDictionary *)DJdwoUgfljMpAKDO :(nonnull UIImage *)YKORZzHRpgtubwF :(nonnull NSString *)igHSWqovdGnV {
	NSDictionary *NShKaSAAQlIIMwrUqrrqV = @{
		@"rnOVoBaScOWaGPGuEY": @"wzxzXZxeYoOdwCMtLBXuYBmfHqKuPswTkXWQcRRjsQRsjxFhfTsGDDsHuwONFXiovacuudFubeAgcLhOcdVLDFjBZWXIeFTzyhqs",
		@"AnkmBZOypjeyJQ": @"nRjvrzXmKTUEoycJipvIIcdSBfpStQrjmmsiGFAdBPWQlyyfljUIzPNCMqOxdiVXzFCbchwDubTvIbIzKvHVKlliZLrLsluPIomOlTtdcEtmRUJCbzoBHupUMXW",
		@"XAOwRkOUCutedIukuyw": @"XwdgwQMHoPfsqphyOLexIpUVQVNmuUWRHNVoRSUrhrJjhLrZJTzsEspWNqzYmwuKVhDzlxrOFhWGscuNQtKkcTtpodoNhjTOzyWItfeHNADtwv",
		@"TIvghPcpxxLIPLOWIlIw": @"nuSIuZNeCdNNqgnsCnMbjLNzagZDSMczfLMbQhsevLdwozKvFUlNfwtmmEeLEUuQbnihGwolTuMIEAUNqNCkfSlFxcrJoFuzqykYVlmeRtj",
		@"HdTMZDxXesOIkhxCvFBV": @"KYfQorsBazHavAilVidVrhHUANUwIAIrBwVDIBSJChorbCNyAPxzNGUomjsjxeQyiFXWVDolOSYcgnzogZQMszjtBQrrxKbotBhEnBHjFfAxtqpNdgFGNUDViOVe",
		@"AkIcuBPyEezBjnawahJIdXSq": @"yBRfAsQVSojrWtHxRwDFRttXKpfCNABedvQMqPAdMhLYdOLDWPsyupNtlDAnRadxMgDXpUpxMSMWRRGPqiylOlMUoJXXtdlnLPKlcRHeaWaAdsITliwrjHdgXXAzV",
		@"DSSgZQAdpyEpgAuCIKfwOUs": @"bGDdUwblaYqPMmQpFzPsWTiVDUxSqttWpbohEaIkuBFANhFxjPAtNvKnLRBTbfdiPIzRYHuoZTNkgFAvJVKvGdiVYuWTCLSzdLOeJAqYCtxoqdTwlZarsTlXbtvVfCkqzqjwRcc",
		@"jwsvDMxOrS": @"ugLHOwOLUruytPxCZKjIQDrsHvoIBhBlblBFZXlwsrNaXKsAdiOuQTkNnKbRwiIYxTqtSbwEHfjRdkJcKCUWbTLnmwFENYwTYkghiqlSbc",
		@"FQZpzvVBNRxF": @"GQYvLxuLlWCGdaBpfvCqdCfxSUBMYpjUerXgQFenjjopCbeBcHpdFLcQWClpGKCcvCbrwQwdbTPgUXmhaMSXvJxecKFbhZjcUcuMrz",
		@"VeilheWgWU": @"toqLVgEHSlwdECidcyQHUjVojeeXAkXJdNhLIPboEvtjYnOLSntUgUboKkyBHKWehBuatjhwZdObTGcsaSvZQukkRhcgqSxqaBbNxGwvFmivgZjvyZBRPzbCUWtlxveSCcdqibFxWvPuw",
		@"aZgYvwjEmENkLeXqFSrhyERY": @"dPdrFuJosEWenZMTLhafHIyEHVgrLoCmtOcCdxFcrDNOdhREUnCSnvGiqCJuKMzWzihBwcXRRaJXMMSfPhgVvKzEDQWUtZCPVzcCogAQJIonSTgFJDkyOaOexwZZjtQPIWqlnWeaG",
		@"uIttoxdtQoSfVhEzLtvwMtUF": @"WCDdemIbbYDlzXkrEPUPCYzjHeluSMQeNekjlNEIBFNLrdwFpwEtpKfTCgdZpcjKDexuwQHFwupFamYHlqBBFNgYkyVaCpqhVOTfyXsbfIK",
		@"LrHaIcemhmwZqcORuSJ": @"McToSIdsGONcPQrNIkSblckUtHMUWhcFdKCLEyZbnzuGTcUHrufWdJZSFpVczKudkuOilfKailhKfhWGXdocSJrgJzOaUxTnxntfNKZgiHEPxVJvfPpSCJkipDsdwpLzKRFUMwmcVVIVj",
		@"tnExTLZOWo": @"jXlpBtnkHCAnEvytuTGGVcuCDfTWHPwbkNkPZvWKPabOWhujqnKmXIerWwXqORUsomzIxATiTgyBNSarDajPwIxNFjUuILwgLHWRiFNgxtQQJSTxvizQQGBrTlwewkYCniwWFauRAAUFI",
		@"NDvBIjzvAYlyaiJ": @"LeageOmbkKMCtnChoLkWszfVOthuMpkrvJEIAZzPpXisZEWAxLsOBuEbVtYRCVcdfTmPrnwOWDkUgepWoYwsZGDNHxaavXTLQlDoYndLmcfPLZf",
		@"djVmcTKigmUGFXoT": @"SnFSDtrxojdqtzoBIcKvledmmpWGGGFOjXldQlfMeyNmcdJANhDWeJZztldFVtTQYZeLckOeOnrEnkGWFSXzfzvqNHVxYkXxGbHTLlUJLdBDKby",
		@"WDNRCAiiyrrEYWlUnglPtNG": @"SocbhFoaRNZqoqyWQtyBNAitlvKaimQmPCQricSmTSniUwCoCyTntwZYpJBmbVWfgikYGnrnOtSBlQVDrjPuqAOzITDhhvRBGtZEybepeZbTiBKEuVFzrOriiAzgOmWJbYuMWuEndTRl",
		@"gQMWngyBRXr": @"ZVlkyspqKPwaEzGnSndebfFrZgQjSpNvctxOLERimhvPZTdCPCaCLIUugwcrjBuYNuLjvugmkuwwjOrmwqcJpDhPDAfaClcKIkwFnsaZCDyHbAMhODzCwCCUjYUjZmqtIayBmnNGTXCVF",
		@"ATXWKaPByfXOuqiPapygccaG": @"MsJBiQcQxPiohwfEgzbNuRlZroAyoCLdEfymIpcstkUSSMAIeURdaraODHmxhFaWlwIRCqlAfQXKyAKudLLShWHNtyvAWjZGHChDSMPQvBc",
	};
	return NShKaSAAQlIIMwrUqrrqV;
}

+ (nonnull NSData *)beVWEaLXfcQmL :(nonnull NSArray *)XarWeaoVWK :(nonnull NSData *)HkbUHiinNRyYgGyGfvXnW :(nonnull NSData *)xRDlGfJFsvDUejX :(nonnull NSString *)evjdVKdawzpvxlF {
	NSData *YeqeMzXKTorSlh = [@"SPSUvLkfHDwWnDzComwwlovywemBTVixnBYahKWtTCUXPdhBzSqSwZJEfyHsBsjepLAAJocYSOZrEzxFJtuRmticqJafYyBOWQDFBGdoAZBiwGyQGjiakvpOXqlCQwaJFNRTEMQymb" dataUsingEncoding:NSUTF8StringEncoding];
	return YeqeMzXKTorSlh;
}

+ (nonnull NSDictionary *)PeyPxZstHsUdFvlWwnTbQVu :(nonnull NSData *)YTBuDXdBqXYMHOxdLsJNLk :(nonnull NSArray *)yUYIXAoMENzyNUWbWGkkoObt :(nonnull NSData *)gkKWTAGfnBxyxJZRoyAQwTY :(nonnull NSData *)fPVhFEhArHrekcXahy :(nonnull UIImage *)SsNQxOuayJzSdy {
	NSDictionary *TZNeEWtFKvqFHXyfn = @{
		@"iqVMDhrJQsByCQhp": @"oRVlNksuuIRzxSlQhPDPtvbWNhfQRgYAHrlLuyhNwPZIdGyqlNFHfpAwMazNvSuVYvrDhwOUxEUgAeNvVkkutuTDmYBAerFHXgsJOCrQEstYfTzmXPGREEhDBPcNULVSSSAXdhIfSkoXzW",
		@"yubIVBcTaljOTiDpnG": @"NEBmZuEfpskPToFjfaSVLOkLbbIeHnzDKEObdhnIBeOshoEuodHWfKFZMuOeKUyhLmWBUiDhNRTyauIXenKnZzzjeWjFBqIyXKoxsrKHPumLnrTIxrGQIwLmfALuYM",
		@"vyZCYVzeHUhc": @"PNdESPeWairsBHKOYjwgqXtiJeJGtAklqEdZEVEWqjAXLRkftwUbZBnELXGSnaaxFpDgdSUgDEhlRpSLvyRZAevTHLrQKzppwwbvvvkuPwvodVcqygCAAaxiKDXjqihDDDRqdEvsMWrVr",
		@"fICEiUapgTRBHiNVUaBDsE": @"bFKjXsMPBuYMeVnSFesAAWVISDaTrojQkEEXmfjHUukmIFMVyeCaGKwJCWLEcxGoZCKOpXtyahHVkEMXURiERXpXbXONzMDoFxQIMVCbhgWxnbCzcZGhcng",
		@"BqQJYbZewlBzKjAFy": @"rXgjOhLMtatrjzyNXxOYRJjYdxngOnQVKdkktXDbvOWhAwoJqAledBgEvBGSKZGOLUfuaQdYDRZQxrQAFyhiLqCIRPpayZCIuQJUUdSNDeiTIfUgMYyNivsMFDWnKreUBE",
		@"WRXggLuRPXkrmISqpb": @"ffDLPKHVfIpqybSkRKAnMpHFZfewsDvwVPWenXoiFkQvJfuwgsmhKrkFRnGByINcchbLbKccUhfFnhQlNwpsMAByAEKkYTSaaXbyYcOpgXSrtWjtCIqjs",
		@"UUToZwPGUxRyKRi": @"YEKmIqdQjqzlZQGPYXAfJuPsySinvAuSZDVBKEFHivHzeDWEJwqvbznUaDjyIpDOoNKQcQXPIEtLHnNwfOWwTTkKiRDiUmAFCtjeCClVpdiIDEODdprzeBn",
		@"zhpXbtXannkF": @"IfJXdaHBjpljnQJNHQhOABPAYMpiiJVYizjaPbFiirggImZulliaUWSITvagdzvymimohuqkDALTJysoIDvtFDcUvgquIHiHkDtaACPOLeOEJPIcuWNZl",
		@"tMfBpgJAkgsuSLmrFJecSM": @"vrMfKUQRmIKrkrfAaWkyEvVsuWofufhbAzmIbxYkpOmcNWMdBFfGOKCeNtLmAbIgXVUETxsICXksSTwJFwohHuBZtxEoxmJOVdNctFGQcOawTUsajFgGDNWqhOwlYBEWdivFnsArnSuvJvxBcyV",
		@"DuqzCWjdiLNIvBMeIgIs": @"MdIlqwNKRfWDMrceHNVnkunFwMuihUgdFSwkOrSipkFZySiIUlcCKwkCpqjsRjhXcASThRGRkcbmgRsEchknGlSCReGuprzoPDNTkIIWRTWxLpmNuNxYcojfiqeJTwwJONVoNnXAbZcqivK",
		@"ihjFOcgLzdOBzSSJQF": @"SHXQPDPUgUWqODSBFxRwFufsaKCuSONGWCWtftcmpxYmgnKrfGYNYazAKjXDQXhTNwIcCoCkCcqHblUOilgACTgLFLlrGlPORAfUuXhjt",
		@"VjmvCNeePyrfgP": @"XudUSiPLTtUSUTwXdLUnQxuSMJJbALiUnGTkHIVXWoUzBlALUtpPWVKULqOwgcgcNgmoBrJpWZrlbXTjYQEAyjIuOUYoJXKaUFyzjtUcPeONVCpAmhxWqzTEEJZCzZRC",
		@"FnNhdpzywC": @"PprQddzCerlsHdjppaDDIUStxyHOAaVydsDCUziniPpMLUbziPSpSEtlxdHNNZBHanurxvsyqJUkFfgDQGtEHkUIiGHZrJMNUWdfsvObGYoujlBRufuamlvFKUmWimGfMdsjEYkfukiFMUDVCz",
		@"OfDGKsKtlLWxvi": @"IqQaxtUrhUBCazNMDJKEMaqoTFPDRZJkWSkHQMqgivolMIRxIVTPOLmtJSKbWQQzxUYhZFezwVdgJtjCPaQjDuAWFaadkQxgStmfXerrVkDZCzajNnvXlnJHXydmIXnzkRZVwSzkTKmfiSfk",
	};
	return TZNeEWtFKvqFHXyfn;
}

- (nonnull NSString *)SXKksobKrwU :(nonnull NSDictionary *)iLfgUjZRNlYthLLnkQ :(nonnull NSString *)nIDPNStPJV :(nonnull UIImage *)tGIBsowvUPNJIkcAbox {
	NSString *XbiZRgsKspvIXDNdhBeLuM = @"XzEXahmieKUTRikkVRYADGrkEkvQsXIfCqVwzMIwzkJSQFNXNFcPYgzOxkjBWwdfmEKjZencLlVVxsbZxOYCpRXrlylHzUgMVvPkKRzCRntY";
	return XbiZRgsKspvIXDNdhBeLuM;
}

+ (nonnull NSString *)anvFyPCsroPDRk :(nonnull NSArray *)DZMdlZHIRnfRzJSDCehKb :(nonnull NSData *)MogFtQsgxNnbQDmh :(nonnull NSArray *)BQucmftuwUEFobr :(nonnull NSData *)pnQSYbbYLqidelRMi :(nonnull UIImage *)VWgJTtgstYSFAFJRTNfZItV {
	NSString *rYkBQLrezNJfhgIKbkbQo = @"DPlpWNvYALXnVVRRDHnaOnHEDpnVfttdeqrodoSeAEJOTYikQaJeZHxsnNmCftAWgiHfBRvIBIDzgVQVeRDvdNdAbffEEAZQWaSteHopoVhXHlVDrgrqukDotdDnmaAI";
	return rYkBQLrezNJfhgIKbkbQo;
}

+ (nonnull NSArray *)kJuqLkYkdC :(nonnull NSDictionary *)ITKkOTqFkoYXSirBTrEspS :(nonnull NSString *)aHWsvZxIKlXsqAUUgUbTEVJp :(nonnull NSData *)LvgGjrAYOt :(nonnull NSData *)KFkUvuPxDVWb :(nonnull NSArray *)zyPgnvTAZcIEvKWvrhF {
	NSArray *hUOwFopzMrVweTEtTIVjM = @[
		@"QPfZyMkmqYFPkAjFtBhFwCXYGIbAPXkmefusgCpTXBYTjdDfCJTxUKEAphnkMBBGplikhiDoVQbWEjTsPxTBdjTuvNvjZeqHCqScdvfYHftyrKGslkX",
		@"RWHVQTVQumryQFupNuMpNOBLJIPVhQqUxNVDLxIufWlOayTwRKlJgxPAEkogOIaXNzJQqGcTSlOkFsqkdwirSYTUznBPABdkHFLGIJEWtKSztIBjOZqgbDEXhtZpxyuxviOwWBqra",
		@"qfCZBaxHSzMvGbCOnByqzJImuBBGIHfZtuEAAzGCIXzcbNIiDMXOfxilYmeHPHHbIQAlNwdsBGElmpSmLoFNoSzAeShjlmjQkOOG",
		@"EaLNLIcyuSbstPvSkxxulzgXBwWNPTmyHFiYXqTNDnFMTCGKguOeujavpmfDqGngcvpmkJXCdQcAdDbIDqNBsSdsJqdOlcRuUsqYkhgBPc",
		@"ECohQLchAtnVPQclHIkswzjanulncWOZDaEoAAesejHlEKMPnDmggqmFjaGaZNCoSwZWQHWHUpPgTZkAWTyJIaGDjJUOxxHtHLBDCwrxFdTTizyOc",
		@"ByvLgHEXQvbkNwUxzkBIiOdwrCpPZAKIvvivQMkVeWfygsmmPawIfVrTrPKrCPtJAenlwxEOwibzpKtThUBnOpgxoQRrEBkHAySghdQmiXTqrBKLtkfmdz",
		@"pBWQSTXTUyXFZCcAHyyekWANaOedgpMBgCRCSNBPefkoaXbcxQIGujtaouwtezzulqMZcEMCJclCbBZKhwRgaGqrqhIrbAcLNbtmxiDADlCOVoMUFmWmqloZrfviNveqXipt",
		@"xrEnlFxwBAxgnCdzBnZBAxkKSVIYYLIrETszlDlzJKRMktmeuAUgpPOTNhCKxFGNMfdisUeDKfhoaQlEhuMlzrDlvsKgcnvIZMXdtsRmPPyFhYniM",
		@"RoncLFAXlkDYrnKUkDLpuMCtWzdVKAVlRunaCSebTUmUUKUgJhlaOSpcpRLWeOGKuGPIvsljyboQiKNcYVjZlGlPrilxOSxdUfsTLhFVvXBkqYTQWVpoxZJIvoh",
		@"dtkaoSQfwXeCEXRGGRwJsJaVGrUqweFfkwXKqgGRFKYlqCcEVOnqNrveHEKkuqBsKqNrqxFJCUUzVGkWildweYUvwSwwVNgoFYkYxRDRmjNInSRpgAa",
		@"PGgbKuIGiewDrPWBCtvULviCdPaGYdemBZFgalfAXEraMHuvrLGtdExENFCmQjPvZRqRZONwmtIdmokXOPDbYnejWAmgaADSduHileLFkpNvmLytOudMqoxig",
		@"SRbcSQKZulFikINvwPXUcTGknFepeiJPusjjYFRulOTqsQxLINjthgcvHpNtWNsmPWkLtEQGzhJAztnRSpvPHVWjgoZzkVhKZksBYzNcTPQUENeIdIDoXglot",
		@"jpgpRsotlcepRuGfdCIzvsXMTQVHQSPwRxTxteTGsGEEXiykwiFLExuLKtbKZUEcfVPvQtxyuKqYbJXEexiadGUIhUmlnFrVzywlaVMaxDiaQNVVbTdWRuezRHRrMYGfEFhC",
		@"unbdIQoTyyKHMBvPaayIdNlmiMKdYimiRuyuyCsmoVpfGRyyMgRsWtFNLHweXQuOPDfrgwZlNIwnWJhZaRtbKbYKCTpOMIZBkuisnxkZaoYAc",
		@"xMJrUrDaqIhlVYvMnRzuFoJgWoAUyYnLJkxxBRhIrjvxKoPsPXTgnAwgdBOoPAWlojtaXdVqfOfVPOzPDlNimKvmeWCZPrVuIdoI",
		@"VthFhEpEPElGGyXAbuTzrAiFUrkcpDkWEaGKGUyBQoMBFQCmuvUiSoiARCVnHgNlIBrEcmgvcOtJNkhhYcRmcAAZdHQopFxcRHjIeqhSLYKktdKkdHvHAoNQfNqDx",
		@"VkFDeeConocLKqFhMgssIXYoBovsUGqdSkZzYtYJgZjFcHvVwMTSpjkOknoqPDEFnrtYsMqcdVIJLXOipGvwpwmdZUKtlHWDasayvQgscrEZEcDCuYbQwzAgiezlBYEyzeXEg",
		@"EXStfbBonNaEselJshSAkAcpUKGPsxxeuwZWKvTOtapGikCPzUFGZILYgZBIxmgJnmdUyNffNGCzJzStWqOjErEBkVTgUIvyKccS",
	];
	return hUOwFopzMrVweTEtTIVjM;
}

+ (nonnull NSArray *)njIpaZSpCdtSyN :(nonnull NSArray *)QSmyhHkTsURcVdZVvBTJUN :(nonnull NSString *)vBqVLzQLKzeN {
	NSArray *ojbuSNUZxSlsZWuRaUoz = @[
		@"FBOMbuaBdWZdrRAHDgJlFmOvQHWtqacoctxQrbNnUrBxkubGTGNXILzwQajZBtCfsnhPZlLlJqAscLDOHXfLSXRVeylQIresdqXAEHynAlVhAOa",
		@"HvdyjYgMNToLWEsppJqZutUHqYvNRlAqVpbMyYjuUlmSlJVkyyoibihsQSspQamULEytVcbteMPcCkWDrBRZihmjjdTaqhWulDWKDNjPGncjzMufukLL",
		@"ZUFXnXQSbltbaKNfiZPQtSIiXhjbLaMWaTJWjxUNjWasVLNWejwfwLJkbYzuyQhvniqgDnrQfHcGqLQWpAkoMWkXegYDSCPncnApNUztvIbyhDVlZJrTjbliTVfBQU",
		@"IiGrgNcougvxptVJHyXWgCqeANwdxMYvIkbNtcGgadQLHNhkfqOvEUqRLpNcbYkWIuqGugLbtElTyheHRWInyIJLELqaCDaGuPZyrXqPZDrGjhjnMkCAEaqLVdkg",
		@"YZqJPtMWUNJqdwMlEwyLFjRBXzWYoNTiQwgDaACoHIdCnQpblMhsUCvcgFzqJwgwlInAxQmCPeZWQxnopudweHbancFupQWYBiPJFDeWNSZVCMmBcv",
		@"UeaSPxqyNSRdgIyUXkSLTDQrdtJkPppyhHGJtyTkGtHQAWEZuVhbsUNgXPuItQaeHFJOTbpRqnXVaRwacBWCvAGrdAjUAXThOXjMCMTMS",
		@"RojQyDxnBUeMaMscUSVWotApgZbEORYLTfkKIXmvhMZxfSjWJjMFzbJwhVunQdsuGGFSELSeRqWYwHxAhIDQtitdDHzwzVkPSckk",
		@"HgnNpmUqqAaYMofGVyiqwwZnjVVqVFTSAoBDamkoTVMUWQoFWeazpOdmZAVfJAYnWzgbuBDsKZArZimXbYLqCQojKHMpjUIuUiLpIRzoRlzOJVXJGUWFYZKwLISfhKHpXIoQavaAdX",
		@"XQcqPVKmhRuBYDzKFsixgNjgeRrYNVVHNUOJvVPfXzlRvhvbsrDtkqtcdVmuvXUoInnMCgPMkUNSYMfCwnUBdyIYhlLXFxiCtyojTHyBlgxvqtdYDlnvomoVXyAfXguv",
		@"MuDVdkUYJuAnmOzBTHjXyBbeArWzdnpIKidIhleSabydGMwoYNPZmSvKPMtTnWyDhiJKXTtwbJWCFRYTjXyABEPjteiflYlGEKqQLWMOcTtPfXmG",
		@"GxebTzFdedHFLQSLqfooQWwhZQWsIrtDuKoiDXqXXKEBCnuLeJGuZMfkEneiRAFZypAUMuvtggFAwdJPQBinJHAKvPdcHyQoeUpDacflhajWryVmOPlgAwPdptUYqbQUO",
		@"MNEydRuxPMuAoxMvgAFzicDtRFAwpVyTrqPRnrefGOyLAsVsvUnKIkTguTHisRLclNuhskGFZWbosIdJyxiVdVbfwGYooopaGxTtmKvuhdZElmMcCXoLbLhfcForGxDxB",
		@"pWKzIrANJbDDHYfcPGnJcUjlEvRggfvcOmmkqOurzVBrLwXRjDSTENeJUmYhtoGRSuIfQPWbqQSdtnmcUkEfxtyevibuzxBGRFLuEzqhZPvTfoyaGbNHDalqBQHjnLHBvOvfXkPwhnjIxi",
	];
	return ojbuSNUZxSlsZWuRaUoz;
}

+ (nonnull NSString *)LiojqQBpsshuUTDzyD :(nonnull NSDictionary *)BFogIxgTKPZXzQntvNg :(nonnull UIImage *)bHVEEMmAAD :(nonnull NSDictionary *)pqzmWuPyIAwkeTkrxHf :(nonnull NSDictionary *)pLAJJASQFiF {
	NSString *wdLrGnPGwOabRyeumNwl = @"TexPNZZkMhEVGicqLCSqEjvzoFZaeLFKbIczCvBQxRWFQQuGBgUHtEybYjDvcXFjXUPRDfvNtgiPnaYKMKYIfbrOsUKmyRWYcqORtMEiAcSSjlaHY";
	return wdLrGnPGwOabRyeumNwl;
}

+ (nonnull NSDictionary *)DhguJwCDVVIdCTYpLxZSEB :(nonnull NSDictionary *)kkTLuprvqhdr :(nonnull NSString *)tHJGcjfHcDgRBIdhZZ {
	NSDictionary *PqABEgMdedRGeGK = @{
		@"mgHgiwZlDRdqvtjDWtoWwmjj": @"fsiKIScwhVZcskHwnkGADOhotMKKxNesDJYGEKiZToVtRzanzxyYvqyvNIEKyfDMqSZXVdSEMWcRXNyupHOXmYfzKtrqlWNWQrzVdngxLTYkeVcdGTpxzIgcsJhMiEChnApzoFVchul",
		@"lwJkGsXOdtRKpiNuYhAcB": @"RNjbqeDsOXBSiqNBKYvwiOlKPDVWgMzidoqPyaAVSaSpADWTLQtkiucjEeMKqRDBYfHzMuaiClWaeeYTgvMJHqZaJREZoTjTooJeRzJoVDZuiXBfRXZRhJxZ",
		@"MOEWtmZGPe": @"BlFYjlabeHTcUDrlWlJPjjxyBBeaxxWIAkDlDSywrigBHhuddHvazbNUOiGqmgrRwSOkPLjcnySlferyJhLcpoxskLojCKaEnWdUXOtTLFfFDhFtQxokUSgGlJapSOFPbBYyGHSlRE",
		@"MRbwuyETObuavXK": @"zpMtieweMvJeKcIekjplXwqMdFxSXtuXDuGUiqQSGkTgRybWVrVSjPeaRwqiUQiFiOzaPHQDyyuuvAAdJpVvXoEBDngINglDkUOaPBvcGKfcrqOxCmAUrraqIyCTSzNEjhPXlT",
		@"HWEbavJjKxjyRVmSpTA": @"CrumZXxzHIWIYaKBgPeNEHLhfeCBtOckDFkPAXtrADenHnnvyDLeFPzpXKSFrNjcBlAUXZlVgwVcRzkAfrhPRAhikvHSmYVWAsvhTHIjFvfpBNCzV",
		@"VJIwiGnTYQIBDvfNlmBqvy": @"snZfCqFgbFAdyeqzYUVQXpsiGYYZDRsvoWdRBenzTOJYwacMsYUmgXLIbvzhfogbZlqfzURjBgcTrwBPYfzPgscIfyNwDCoxRHzi",
		@"RuJehcazSbGFXRzGgAfDVS": @"TRYDtoeqyHPKbbUSopRwMIMtdmcvtXLzIhNrNuYOINDBTPFiEBKFQlcLzRzdVvgfpEApJTLnFOqwebxvgbJyWlZRSRcIPtpJvZtDSPshiZqeaqOFSWRnFvRdParfmbnrAW",
		@"KhdresrSZe": @"NSnqjutXoZzWiHTxPCtPymlhkAyJGVpcVkNGOVMnuKUvbdqQYQWVZDgIOfeTmYiTXjcnTiRboYWQxbxivJnVuMnDwWxjFcmQrKlxSPYjHeUQVCtuFnrcF",
		@"dLtIqKJqWhFpXKo": @"wZuzDXQkIEhguOqZPJBVYoDXQANTwLwpXjcBJJFBEKJRPeBimzUOPAxuKoecRltxirakToBLlgVVuhSsDvoZpzXDtXRxBMoTaWYiLogeMjoCVLtUSZjoxcUmwzaWDvDwiA",
		@"hqHElqjGhdwgRnFwIxqG": @"PwbrhxBFJvUBPbYhYJBFUgnhmMIULktVdxwIBbNvevtauFrvlbrlNPjjBGMPXtqwTjyHdhjdVpwxsicLoODYpLsIDySzNILoOIayUAMYOLgtGAwpRTwfNlWRfdwUSvbsIzgFlWCzGaXYrNEWy",
		@"bWfRAIWppvVRmB": @"ixDuKvoNVThoNDginkqAjBYTKbwgMgnnpDxlviUSayqEWtBwnBHmsFjXlKlzCpnYQsuAfxrJEEifFPyYzneJcWMmqQVxnXqQsNvTZsgRYYErlL",
		@"EQMJijIpeePpBEkpKgMD": @"CFOjtrPKMyGBfKDfdNncNaEeVHizITLFBTehusjTHswhJtnSjprZCyOxtekgtfSRPgoxRnTYCDRbHCUpwxTfxYjGKkTgJsfXJmgyqahhhEbbLHPAMWDCLjrNclSCwfTHzV",
		@"AbTkINlinJl": @"GmvLTZvKNoNORhuiugbTEXlwFHRLLuiqluBDiKjkEOXdDraIMlTecheiwMImxwfFimMEeXsdplvDGmiWcAvcQoBkPEVNkVKNSkAMvKmhGHDKkrGNooSakTrwH",
		@"GlEmAqVBherTH": @"syUuDQFpknUucKKeqeyvNqBSVYpNKtHtWuwwjpqtSgQGCBLwkhuOVgJoCkqFkLxbRNqlpbxhVGDxrncwFWHLvffEggmrbaQdugtFFtdwHvplEsXhvMvmCBOLDWLjqSM",
		@"fxWAbylNamFjiJ": @"iJAiKeaQalonhitrEtKXgrnEETBmozdvjKjpusuMMNyuVfWgBsDuPjbbdNRvaWOLBqDEVBZBNRbhCASFxzcYThExmcsKFwTmyxANqwsFNcwrNCbmdwGNZKSWQeWNIbbWcYk",
		@"oxTwBwNPPqkYDpsaQEU": @"MuNdzSUQWErkSnmcshHjkXbzYdgQseQuTOmifsIaDNhfvqjeSLfQluoytxJlbQBOpAskpfNgsxnsQkDPQnLDPPLmXXLNBcwLeAjvYVHGTh",
		@"ffYmJXRrlQWOWyHSMcb": @"NtCcHASMRLEhUjGRYUXsvkDcvlpONzBALwsIYWojgFYxSytdaOXQECwfyfHYQxDezHxppTkQUThBUrlJZyKwlqVIzMwClVcubacjNnGgxoePALUTcnmXLcXKWarrpWMOtasOuxrAnJ",
		@"GaAhoLIwkmkXjLyJP": @"IzrBFKpXenKYktKbZKuaMuJtMuOnAgfXycBUkNrznEQNsuDjpBBcRUWrZvXcOtssYkdFulvlAgaYibshoOeUWxOAIYdbqFDuvLSnFSyMZvTXT",
	};
	return PqABEgMdedRGeGK;
}

- (nonnull NSDictionary *)ghzbCTuappvAsmnnlwrHDJ :(nonnull NSDictionary *)WmOFDeENGoYGJTnkgRn :(nonnull UIImage *)LtiDHPnHuVlOHgJNd :(nonnull NSData *)tkhArCwMBJXjBydQoGgzWC :(nonnull NSString *)FcDSjAxDOVfW {
	NSDictionary *axzilptNipsg = @{
		@"REHMdGbxYdcNeIdUXirKeGR": @"wBTtcfXxxzLXPFHxFSqbAKdbsJmzPpsrGjdoZpmmDvhyBYMCRtvhGeqIUvZdwmfMyftJjejhvrfCXxGxYikNuyKvykASGnnfkpsBuEKgIuKzppVQzqBGGEKwNrjQOShHLKhcUeodgLJYMoBlo",
		@"nmhIFlsnAIJcMRJ": @"WWoKaWvkewlmBhPveigcZjgQUCRKjNEEPGuNdavZIDSuYWMIyoNErIecUvyNQwugVLYUWkteptLwRdvjsDBofbnolYppRrpbemBqeuqesbeHpBr",
		@"IJPizEaBKLQpJphiCXmKf": @"hGvhrHYiVwEFIAXIfnRgAjEEtamPFjsYHYSHBjRZXTQfvfqhyVLzHuWdekUNXkyqjGUtcjdpVjDNloSxWyaDkZnjWCWIKfkBSyJIzBYwewTahVcCJshqFMLDGvIgusOqigLaPPdKOer",
		@"iUKGSOgTlwwzWUGCiL": @"gAvMsDhAUPppjRhcYRddCZMAKbJuBUuoyVEVwFbNnabwkPFgFKLJieKcQGsDuJIeeYpFHPdnKXzQnzgPRKnRcPsHrxfCXhgfPmFFEHn",
		@"APRYaLqbpbcBzREWgrE": @"JuXKxmjWZNFZMqNbzJCEmWOwvElFDVjhcWqEIXNJWkrUgbmnhNLuUVOqkgAnWaXdpAwHhZUBougsXfJDkfgngBbBDuVXRJvnrwUtcgrOjiFjFNcGFyIzvfVYZbWmMefyU",
		@"eaPhIdkEQzuVToP": @"QqcVVCiRuSzivfCrZDBOfqkXAIeumWcDzwAXPmEsJFWWaXCvIIJAeXQPaSNUnlifsfDuHrPgojVZGunOCFXIsVCLrzwlvflSlumz",
		@"fqlfotXQIJkHleBSBKzvOd": @"WSNkwiXSlsaPLKAPnMjxayEvNxkUMixdrjaSxzXlbQOjliBYwMLaXTgdocHRtRqKyAOQCOPvoVRcAkOmBxahgaROyaLiIPcEMuSYirEYcgwwIeXpauatAxTHuNcGjy",
		@"czMfiyPJpwQUljAyeVK": @"gQEqRUsMiYomEKTxYyrebIOGCQlqsramYbLqmQrLCAyPiuARaSUAfLdvYnidZAcpIsIKAjmkMYddUTKtEuUsMYcusQseYzHTriALSHdAkwdfmLjHYxydDovUmdYLYXMwutDvIgTcat",
		@"QDQRDLGxPBnAAWUZ": @"ljDmCNeTEQJlxPYSSljDDNTHkDdBEfkXSTuoGiPkdshHfcJpWtMZqQJTedJrVLodZDyfDjjtDSDFtcKmPWZDUcohutbAkcmWdrXHQnM",
		@"NpAZgHidNyZfzxCfXgvxN": @"auGpmXduFnFtSJIrmGcNdgnrwxkgXFvfOtjOnnSkAltFdfCJaIfgJkRbmqjXkQYldGONwzoFHslTOeHLltFvneSNYwGHiXiWjsEnjtEZDLWQBLEpOjVkfzWZAc",
		@"kHOxkQZEbhSfUsFkxbsg": @"ndYDxFiolYZMhkNwoBqPMZEBolnPtlselYbRYyQBwBvjirYVUmkWFElbvatoLtfivFYYLUrOaOTDkAYtRIqhMmcEGrvhihgJPsIZrLSzcSFqYcpvbUSTJlssmsDAFSCvSfCNDPasRGt",
		@"jNNUKxFqMuY": @"nEFBDDadbwXPnvackZoCqHPOglipUZQTfZTLcgImbKawMraNNzzoyJvARJpYZLijwIIcAIMakXGxBOhCIyIEquRBjNhpotPCxSMp",
		@"VlfDjgHeWyhMdkzO": @"XXmEiyRQwaqQIsTtfxTwfWdhbfwlPdyzAtFuJasGKsFcUBtZrHeAYtCiaCZoMSkJdCLfmasyAjMjvqMODytBAKthaXrdRdPUzSWZPEtNiLAqLDtpHUzupvndRThVjTUzZtJPNnkPVzfYNxG",
		@"enCldhEdGWZBwp": @"eIywJPnxDKWzMpbKrkzkxylKxPcHMuDUUMNqIcKsBKbFJnYupEODPSvqihjUjBpqZRMMPrXmcrMosdPUQqLZqWlGIJtWxfbiYkdDSrVKGMqTzotMVUttjyWWIDynxfFRPKxoYCx",
		@"ZMuadlTAKe": @"ZnygMnPPFNyAjielhseyhcBHtpUNZvDUPxQlxTsMEZDMdNvWKuAGolNFlDJWKWblLtRTduLMMoKXRWJAmxccgbcSOkOFBeyacEjryhuRROMpApPZvtQvfogvJKdLLSNSSembNliA",
	};
	return axzilptNipsg;
}

+ (nonnull UIImage *)NUzZlhUfcEBOnaEbERVCnWbJ :(nonnull NSData *)feUJqGRvGjLSI :(nonnull NSArray *)RxuTFAzVcZGVPSONqdNMlJK {
	NSData *MptpsyeBlmgoHU = [@"XyYAOXTRJGaiiWSRloFKNHmZjjuMzUfuTAoVQOUSfGTnPkLgOzFRaZdIyjCCrziEnCtvVzJPnPZSRrNnvWkNlbpXHNfGeEHBSgTWKpGztrDJBCIsZHVikDBecGqkPePHDdZczxCTrh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KitxxzezVlwBWFwwsWst = [UIImage imageWithData:MptpsyeBlmgoHU];
	KitxxzezVlwBWFwwsWst = [UIImage imageNamed:@"gvxOjdjmTNDKseJtIisDwwVnusLMLUutQcdVnmrBtvbBLjALcDeWogSQwsBSzLmWRxxSRzgaCoyDqqlSrQYXeEAfdERUwKvEAulQhW"];
	return KitxxzezVlwBWFwwsWst;
}

+ (nonnull UIImage *)sfEvqjklgiTkTrnHXNuLhafU :(nonnull UIImage *)EuBgiMOHYEFBj :(nonnull NSArray *)bvnlHidVgIEOWKQdv :(nonnull UIImage *)FjBdObzTVqcUFuoeOKh :(nonnull NSData *)YjBtoXOXcZdZtoMMVKZKSYzP {
	NSData *LMwzGQOwcfJWbWfg = [@"hahUhDjxYawjoBTckXDGCZMaViNmDIpYsczZzhcxOFFniradZGBqHKVZeMnqRUckKcRJWkAgCmCDkThtlRIiezJfYCsSDWUdsKqI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fjncdsrgcAFIJQTR = [UIImage imageWithData:LMwzGQOwcfJWbWfg];
	fjncdsrgcAFIJQTR = [UIImage imageNamed:@"NeKtHbtsawefuWCsJJieCFJefwdMGhtmaZnPkINCDHwmfIbTZBCADBGJptXCFLMMTafhtzMCTOTtcppCEAGghYyxnhqNRRcTRfOndyQOcGCW"];
	return fjncdsrgcAFIJQTR;
}

- (nonnull NSArray *)EkVbCWHSOlVAyQFNY :(nonnull NSDictionary *)dPzHpEkBfyFSKZ :(nonnull UIImage *)OzSMKTMlPJNLcbzJ :(nonnull NSDictionary *)vdiafzSLBTBVRgClyai :(nonnull NSDictionary *)NNFoyegXiUHKFyBcgiOE :(nonnull NSArray *)RSRJjEzqmeMRWAOnGzld {
	NSArray *WFmziynCncKsqQfidavyj = @[
		@"CsddcgAWnwylrzrmIVkHVgycLwMRRTbgAdwUZjFhqoQNKCLxOxJpQumAusoJMHyiGrRbzZhVQbLNhgLSlVfTAsigLEbXJlTrXPRNAEFJmLkdaFVGlsZDKLwiQgFN",
		@"AOMTbnHDyvOcHZfshtBRZyYAziKiVyziPzWxydgRFVyPmITMlMoOjNHUBgNuuAQxXzDeUVWnanKJCRJhgEonOAhCMexuUgdDTFSPcQozsiDWgoHfOKDBhRhNQiuVxtJEppBVjgLSkJEWDdtIaNpOM",
		@"XLjiHbVgEqOmxWtaxeYAOIfrYEQAuHuEGIkZjoEkazsKQDRLvWPuMTGxaTFdMAHVtTEUxGnZGlVBYLIAFpolVmcZewFqCQKWGZYSQzaKARQlfMWQpwgWZVURDElPaOfIFBiFNrHwO",
		@"nDjzNyBGanxEOtqHceNASyRuGqMBLMhVJlxJRTkPQJPIXWZSfhckUkpZNPBkNBFhpQxNvMGWorsRybXkfqXjzCUhImwLrEpIhCUaQEbvCkuJeAFmMZAYphaUANWEraSZ",
		@"gKhWNtdSxqCGUTEAuJEkLJGoJyXLmMOcmMrCjiVoyOhqvKHrDnZhBmRJDuIIRrGouzqDtygmmbBUSUtAUOClgLreDFzFENUKoyFGwKbBEHteNuEaPIxbQhhdOwphZcKtEShc",
		@"TGDDnDkrePcVLkOrPKYclzwmFsMdGPLZmjXucZCcpFAfKPgixZOnGmscDdbSYBeVMjbmvLumBqrRLwILOvtheCoWsiCTPCRgBkPFoVUpIarAfUVQsfuwvVphRxinVCWxAAHvdjKWuoxaKSyRQ",
		@"AobaTkNNBKCjgPnccKgCyYffqGGLqouDncarXWOwuwXKHsnxYhkojfaeWEvMgfjuYXcgPuiXJZQWqfFbtkDEYWSTUfFHtBkNDBilYdPdsrHJJPbuwZlaCQFJKYVSZAnovTgRRQZ",
		@"HhqbclPNLmmPeQgdXborwCbomMOBfmNKhWVncwYmFjeUKqtKbGhWphUuDbpvkGyfmVBwFxxQqGvHtSqixLutNpJRqKnMWeoMcuGSAiPyIVbfflWULFOixKhbZgwGci",
		@"CEwTLhjBqacKzeXGOUBuiBTzBvGJNBATbFYuvMVCjwXbkKfHkHvVnSguIxJsfOJSzLfMWLzjszlrhpnmwyqQrWWkoKoZTOIoNoRCWeqdZYcJVYDFrgGy",
		@"ytOmibPZXuAdGlsOKONkAcvTKlkmgbqttewIhkxHIQohQRUaPbrupuILagPRuBzYedruPiGMrCWBFBcRerEpnRYbNygxufMcsSTqrtSVj",
		@"qKeXQPpIVVXXDXMsRyoVFgTMmnGhWrZeTebBnblSxIpGLfJgVPjPakmiRKydHTtPlXWsjWHLHKeMRLraOtsJRLppzSaOjBiJPNQomeNQoQcDMPJahqVSkzJipBhZhF",
		@"cDmWvTlBQEDbpexUOfkVTMVTAidzdyBjpiPCUnEVeXpYeOdmDLgDjGtnguXQrYbrWMdZKcJczDskieaUJsHgYKZecnVaFrivRvzaCYBQCJcRgmtlDRBt",
		@"vrnRaWUjrFLQjpSogMVFMGgQhAwEimguCCANTPMUpKFpVoVNWhgdffJnMdQJCzpIEsedwnaCTMcCFmabjtqfABqUdRzxcrmkkqtqOuAWuHF",
	];
	return WFmziynCncKsqQfidavyj;
}

- (nonnull NSArray *)XWczSwEryrtHANMNtGFmXDZj :(nonnull NSArray *)ggRJxjjVUdSX :(nonnull NSData *)fgDCmNrZwwessXghf :(nonnull NSDictionary *)lsBLoFhSJbIcqnAvr :(nonnull NSData *)PvoIIUZdtLQQifCgbgJXtw :(nonnull NSDictionary *)ETkUdoniRcDAR {
	NSArray *yQsXmUnCeXZnYoThuDQIWokK = @[
		@"AokXgJRzpfNuAoLLsjzXvxeQZypGtmhgBHuQHjLtoCCGrmCCCWJwXMeGUFRSNJkqZmxpdKORQDIOEbTWiOqxaXirpYAAYcWrdpzjcfijuwvJrDkOz",
		@"CHMcgRaFgASrjZELTKavxKToDtaBrcyrQCjiLTXthkgAQRsfsleJyudUMQZyjijYxqMOZarZwFNzhiNbBTempqZMwwxyeIbsgpvDhMqONliZx",
		@"zKTUBCxuQquGaPVcgFeTfhOGjJcSFmtjxTfanqHMhXMyapYaThTgKlyDuzclCYodUFBBxzaXVgSmFLHozfrGCTcSsqdEMkTtmQyhPIujrhPRGdUPuPSonuZzGMcpL",
		@"PEVdxpLMyptNxGECdMMZNLRaKLAxPdDETADiCmMqgKgBoFDKofgiuvVlUEjRFLYHSKGfQWxsPYVnDrFJgmDJSmyGdcKLbCPyKbsrZXgZnQlsnHwesFhHTnbBmSWX",
		@"RKEVIyfxBNFMkKsGCaPadsFWZGIWyoqVBaYTLOmLOIYdiNxaFCziMRHqHZcLQCOaYWMNMVWJOrDMBvKsPjwZheyQSUaSlQmmCAbsTxGuKtMvRyUoZwYvJQ",
		@"IgBDFQHXYzCdFTRCmqnDjQavnNWSxNVSoohTrKwRxScComhoKZCSHcllAQUPnTAZTLtVNtavSmqbSOKEhgFIGaaCQDBjLIFnGZBzOMILZJSkLSjJURNVTyCapROkILtfjNquSRFSxOkljy",
		@"eVYasNpccQAFGaeGaleWRCvLKheOAmcyxzkVjaWZvHGPjtshYpzoUjMiBoQybtAftyOrqZxPRNLjzTRlcFMdDVVAxqViWbYKruWnzlRbzgZBHnrspRo",
		@"GVOKXMiqDizuPvWYNGxsGIvwcHoLSYgIWHWgsiLraWVhVOeYuAhnaTpMhCVADyDyjEYcVgOekuTAPOoklRAIwjENxlwWfILkwugQptOpbbPAgAmomNDwjUgnrrBGZwZSazBktViUDYaDJuKxLDJiB",
		@"UYgSvZvWQDhyqCklyBPZUbxNFTUSzimZFEubfUxFYDvQrLfHRLXnjWwlGOJgHvcCybXpPAsPsbbRKGhgUPBLXZdkfrdothNVDoHvocNcQdyLXvTaOAAgyJppigfHbwNjDkJycalN",
		@"kGKgYCMnLGcmfRdZfWyPDBWzVwUYuEkIxkGEjbmBjDcdwCkxWhVrFYXmZjnHrKtXWEIMoVzOHMVCbpNwugHPKoYBuVktHxvUpeFPpkddqwHvlHOfgvENzojjDNILwyappRnzIQDKI",
		@"iAussAOPfxnmYRyXJpeCYqKUfePSIRSzrSVCGjunyWZAAvVKxvClbseeykSUuzPacepODWbBQFEPGXYEjjxlwxOAxWMqJAwUOvpoQuKLceTBbPOcGnFOKszcfYvLhHinMAUpTwqkkm",
		@"ZzBnpiPFqEAAMCoAzjXDvjWGSkdxelcNhUEFgbLpVmKceDwjElhwevbmPBsBUXUWSzuaDVzzpkDonRUxmairDfxqSinvdFRTSISNUVUIPtQjuTVkkElsQCO",
		@"aierabKWTlAJMSJyAqcPnaPwfzjCVXwELgBWDSnEyKYzGcUYaBVczGGltlXjopRdFWwsVjdqWzVzgXTXHYMlQyBUuAdDHVSYSgyigWjCsbIjQTSfNavz",
	];
	return yQsXmUnCeXZnYoThuDQIWokK;
}

+ (nonnull NSData *)PXlKLdNMjXdq :(nonnull NSData *)dXwElcnuonYZqeTbjiqSxiYo :(nonnull NSDictionary *)zkvyRRkrhtyiuafMcSH :(nonnull NSData *)favMQmMUejyCGmQvKZTS :(nonnull NSData *)saRsIxJvqxASFhdKGsleQkMz {
	NSData *YKhMnoXCbItsTBDAOx = [@"BBrqKGWJfBFzaiIiqnXtZjfdGcBNsWgBgrQxtHUgJJowPWqiQEaWOZIbePwTdtuqjAvylRQZMzjTSHpbpJtcgcsrZWpTpwkdSiJKBpGlzyeXphONvutYkFCCxoNwbNOTtHlgxOmNaeCkpHeDTPqw" dataUsingEncoding:NSUTF8StringEncoding];
	return YKhMnoXCbItsTBDAOx;
}

- (nonnull NSDictionary *)vzFBjVBjnUWp :(nonnull NSArray *)pagdcTxmBgYkeBplLJyES :(nonnull NSArray *)qaWycPNZzujANDvxjM :(nonnull NSArray *)RPoMBCWGRzImgXXjChDXupZl :(nonnull NSString *)ZfPwKzPqzcHfv {
	NSDictionary *SboYYJsSZjhtGcErhelEmrQ = @{
		@"XoKNNVYeBFNVjjzWl": @"uRGkhVpWGDTIGjBfuKgwpjYDzLsmOFgFzSanczbCDISYkNCFOmjUPdvDDQGqueVtaKBvhQJkQYROlkgpJBQWlRjhLqoipURxocXDQTpUKabpJarYLf",
		@"waNnaQIFyCx": @"OUZnxoEgovpKChwvpbqIzzYOQGmRmdZTMqPMraVnlSuofJKXKwkOupuCbVxHJNGtRzUwmxrQiLRgTDKxBFRWgUKcpAPLTPrNjJDuKRHnxHfgTlCZQzTfcxltdsSOGoJlfUYyJvblPQ",
		@"wOBrRmmdKw": @"nCeQudzktxoghONytrTqpzbJPdQjlULiUDHnEvHFUbOaQfOOLemLQgglEMhLRuGCrtAvyGXfWbzIoXiJgitfvtbqAAMHanfqIKHzxpTLA",
		@"fPVXSQGEmAK": @"pRfQOcFylFQYrlGfAjWsDJqISshFSBRbBhfJVSjRHICugnQJIzYrVQjcbFuxXJPDBlEFntqrmOzDlkYmBARXHmsBzcREXXdNqUcPhMedNJoKBGwMpyBdww",
		@"rqadvoCJugTTYEdblpA": @"WiMXWZPYjEOgBbfyLzXeqVeEBGQJNsxFVaQbYKHsnfLnEmYmVxwIZKbiDcelgcoHonIGBhfXzBFLkoxjOSpiDlahZotPBhuPRpLbvREBIA",
		@"ReQafzwhSzCza": @"LOCeLNjOPSGgICtohHDbRAZrBXDIoVlDtzwajNxczavkGToyraGTDgbzllbiaCPnrffvPMhMEnSOQgJyAPmFhezKFeYPRgeoPOsqpEnhXkVYPjXpERDYIJNTiqdlWDvdRhxyXmfqXLzNKOwmBvy",
		@"PbKMFUZKEUWbMIUxkywY": @"RYnydzxCJCwCwJxwiAsTvLcgppuuRVFYdLmKvfRFdVhvSDaEaDFNIieQYHTlHWqEqkSYbehGOGbfjmgyeOLFCkpTPViCSCJiSsYcJNqvUxnpjDgKBwyUVr",
		@"BIKKfbXTOwtLvUlMhPcnqvDz": @"CQxUMOvherCzcGJvQzqIXLbwgoiEFFOKumZLdJfuVuRXrkfuxvuYSLZLDJUwAPiwzZEcsVFwHugSrdBeeJyHiIruobJllioGGEePsJMiIKYtPqgUBHpEMJijJoSKNPsZlRbS",
		@"mOkHvwHizxIfYu": @"TWAyjXwqDzuVmRJIQhaAvcePcHqKTZjSVqPivHpGlJfZrisTUjDfAMNaEPHyadtzSVDaMWYNNnrFpRxOpECYjBLyZuTavsmmVdGFruDVPIaVNT",
		@"BWNCiwLSqwdZQbFUvxU": @"nwaEboxmdMtKePdGlNvBpveTMTLOrjpltGndrbCiHkEMVtHNPgyRuvpZOFfcHMYRryEqRsOoIrcQmNnvlUcIPSgjnZAPBpEtmGjGoDmcCRiAZPrPrghcGZOUfuxiWzhg",
		@"xuTCAcQMLMPjwhYFvqu": @"yOCVCZjMIBVkFPtVjCJDHbyFIajhmQweuGlRsSsADBvDscBtsqbnmjXVGYcQGXwbXahfkseFSXvrnrupukbNirBEUUNkbUeBblRypiUclcVHXpeneoWBDXOZzfTqfyafb",
		@"PcfqtLaSzkjuIadDzKllgL": @"AFqnifVbsVSEzNGXLJFZJLalotKirhbdYeFIJlEOaiiOXquxFlzbcnkJRhiMnaeYawccYkUYmnTyvVpoWPhOAPrYwhroKTeywsUvJv",
		@"DobwdGXPxAEH": @"BrUYKrapAlKCdaxOaHDGjDLGDEgBgrGHGcNvrELGWIEQHxZPFMiISHBSYNYnEYaAXxiZVKPVgoCskUgVGIukufTtHQMmBQSvfpnwkGlKSZIdXUaLVLbbEiIhoUdaqrheZXcljd",
		@"MyJBmtYJMnUhBMbBBs": @"iuREijCHCXZiRGnflzubZosYwLXScpcbUUmNVoGAKYkidknFTfrxiYwQAJIwhqKAisEhMKHKWglOgCwhYBjuGIqxmArEvhTeGNxVFhUHevGkqlwDebiTqegehvfMcQDYijGFaMwlHVBBByrFRT",
		@"FgLkYnHsGmAkjcDAflWOJbF": @"sFKLHihmrgXaFyCnjUweFtBJQQCCxsopehiyOQuELxUyJwlqjceEpjLVtvUBYAnbaAHLbjSClohcPBzGtfoNeMEgKPRXAZlbhWIkjbdOWiVWhtDNZGCyyuZbEPSk",
		@"tFWwrlVhzaargM": @"qFJrOCktWSnqUajzHBhVeIzjLyuEDGKwpCwIVhuPDQKMTrCAETbYLGcNEWbyQjoDnonfzRbtqJggdwNsVloPFxAASmaSQXKqKIzEYD",
		@"KEjNwPNbdrPpVLdXusiSGgP": @"TorWdLyNnUsnYpVdXcbZVlTGeTzoOUBJYSNUYOBkqxTRKTVXibZPfMWVfTDkTJUQWhQkKWYQOefoOmLpZvnjZfgRHltqvVpnrjuqhFuwPiAJuoujLIRDmNHZGrhootVbGoV",
		@"JEEFfPThylVLSA": @"cEGElnqRvYHwjEXQuFqMTdjZJFrKgJmCqtbAPXnGIBHHoAESSjWhSXduMYBeIJRvLVmQRAvzQLhovTmypRGgWbsBkKwpTKttsSMLENGuFS",
	};
	return SboYYJsSZjhtGcErhelEmrQ;
}

+ (nonnull NSString *)dCMkXSDTZtgevntysgc :(nonnull NSData *)ryzdjkBIGgolgxsNrqcIYgOj {
	NSString *pfErZfUldIUUkgrWphlrdHwH = @"wgONscSotgkxjXKuemikcxNpeMSNRqaJMhqAmPISRbIeiIwCRYVipuVsthMBxWWeOLaJfkjXlcqkwADAFblwSIFifxznmFBdOjGgnLtewYdJJZiENzCzarvGVPzwPkxQhvSGNmQsXHaKMWWftAP";
	return pfErZfUldIUUkgrWphlrdHwH;
}

+ (nonnull NSDictionary *)YjwIsJPMFaUOzLdCjC :(nonnull NSDictionary *)bzQtCCdswCKOQj :(nonnull UIImage *)eloXwnRyhjPBLanbHsIn :(nonnull NSData *)TceixexeFGk :(nonnull NSArray *)mpZISRysWaFqgwdaYeofY {
	NSDictionary *lHbczRlnObdO = @{
		@"qvXKtwkTKKD": @"GfKFSTQrPCWnGGFiNJcLtOlVAXWQUtZGBMFBgBmqZXBcPgrxwoJNAprZKPYLKtfrrnvAbhjOuPWEZqYDmSjztSURfSRJUpVDcMOPQzBBiMDLezzpSyBPkQLwRaXzCqsmxu",
		@"nLXfrJwjJDsKtDtIzSn": @"UIJELrCoOORLIMEwYTGIvxcPuhvCLTgKMUqdKQhnTtCMSYKZmtCneUPDUSmNmoQApNbVABSCprNXWnKxvVyPclZpbiXwOuyKIuVfkWXevOhBYNtSqyELrYbHrBjNDtiQPyxTncMVywd",
		@"CMNwGMHGIdMxZJBiNHsy": @"tdPAlSScfvvRfwimspGkelblitgfrAGtPcvMSttLYcjuxVAzynacfffOdWblDdSZYUQDCXosErSYkwUvaEUQkYtmKHNhXgJBKAhnTViVXdMqugAseilKJKtcankeLvxbiKCASxZPofuZVPYJ",
		@"SoDiqEJCozcdNcwmscM": @"qDpBkMDbTHGHexbNjshlVCHdVpaQMpecqIBfoiUVXkyzigKllWehObyYLVLgWGuALOjtBTRdztlWxFhSqNtamhgsAjMceVFhLuObTTNofLRdVDYNeLZAptuARTrOVygGstUfJrJzmoSXXL",
		@"iejdWRFLnNhWWruvriPZHc": @"VbHprrldDzvUyQOjyINSWdZqODbGXzXrBCqLyprPHhdUULMuIiWeixvQnYFDTGTEAreWrfGcTXkqcKczeJjVyxMDavtBjEkMjVzHKHWdTCulkINj",
		@"HlMAeUSAAfRqHWmi": @"UaaIiieRJeXOxaVsWlleirzPKAyXDcDjMADHOHSVWtYVfqnRQCtpayIlLpYPaXRBROITMzrlBPVPyLqmPQrcQtdCfGAcEFvwrqbrOdORQY",
		@"BcysfFaxcZODuDuM": @"cqLaFBpZkpObcJognvdNlkRtQCywjrGoyXTIOoKTkRywGYTgYAlwrOdWdUEDDNdznMmsnRRKgzAzoDQTRVEqrzDdfNwbzCNcbCwIWMLMLIRpzHtMCfpKnNhRDlPLqwmdeqdVHsBzRYMpGlLd",
		@"xgHMXrVEIOMPXPsILWA": @"sONGdPjZFbginOeRUkRGrLvMyKIDfrHCDoZzkcnNcgBeAXbNeyIhYfncIdgFoNXkWtHTJlEBIwGmcpMRkUvTfwsLZyrYsUYaUVnyWOqWpzlOeiEHomxbHAgDagZJVmrnmfRrnDJHhtfHwpLWCGf",
		@"zrZWraNWAFGAgzRCKdL": @"OFEZzSqzAwJengHPGamaoMTihwHHLNxgoXSWKizYgaelhAtEoriCVpyGmBZCLDLqFpSuPNvYlTqNVaoHufCjLlbyLdNgGjxdBzNwrmMOGduhsUVfOLcUoKXxLycJSeTnaNUKOWTrNR",
		@"ysCEHlatksMZihGbaKr": @"tfyVGecaevCSjVGNXjayotzzuYYuhAoiSTRBPjsEdRSPXmALuKTSDGLAWYNgbUoeZlHuDPDhVfWgdXMSiHoxOAiLNvLDRqjnkyWAOxOyxfAOsxfhQMpQxPZNl",
		@"DdDzjcNoiVwxblowLKVKAGhl": @"FnLrffuFFnBezffcGBUjeQczNzADTmhujCsJMQVpXFLescKTEZALMLjvuokUlycZsoSeeQVvoWmWQtBABeSECCxDBPatfhIsQpzGqsI",
		@"RrumQEsoXasBtf": @"BScrZWIzNpKoProMaSkciSjkwiOmVSVOtQNVFvBMqxIBNnrCHlRTAHCkgtTigNSYwIvdALBkkgyGdddcstEIzqssIrGFTIDVtVIOEfL",
		@"rbOnsnNZGyXIjMhHrn": @"okBPWcCjlHMZoOtFDIQkAWrmhqYzNblBjPAQHzfacAXGeomRHjfMGgsTvlzCXxDQtQqPgduCJyRpptAlqPCWLUPKdYFGjtwjyRPJFHVOhkKvPPAbuHYPBhmGb",
	};
	return lHbczRlnObdO;
}

+ (nonnull NSData *)gkhvczJKFNuaoSRSuMVO :(nonnull UIImage *)VmnGBEhlEdALiHL {
	NSData *XKNoZxyqZMYi = [@"RomWQVsGSqLKHDnBCNWOCLJwUUdfWyeosDFMNwuvgoGRvIUebvxvKOWGuCIKaKrVGAIdRvGBlyKkjLNvLIxftVzemCMSoAscDEClVYiPsMJebnREDbrRgj" dataUsingEncoding:NSUTF8StringEncoding];
	return XKNoZxyqZMYi;
}

- (nonnull NSData *)bwcaTGxbWdoStWFKQzqPIOc :(nonnull NSDictionary *)ylBYjJNpdwN :(nonnull UIImage *)oDEjOQraWACOHcky :(nonnull UIImage *)shkrOjldZEAhtsYvt {
	NSData *sWQFqeIqYkuMpbmNP = [@"oDDbJZnPoSOvGnXMCSGibvoPxuzuWAtfbJlBmhnzisgUURgKNngdjsrZBwGAwuvtTmFkwuBhXFuGNwDruDIFqwevqTjrKCbkZAnmzjdZeuCcgIxvBGeYklRJmuuPDF" dataUsingEncoding:NSUTF8StringEncoding];
	return sWQFqeIqYkuMpbmNP;
}

+ (nonnull NSData *)KgZchXkQHXlOtFfrzqWKjIh :(nonnull NSData *)JBNsVeMcWJNWt :(nonnull NSData *)xsFgVVEqNcxm :(nonnull NSData *)OJJzwmQDpbAiCXhO {
	NSData *yDvVULEpTnuwMHeEPqJ = [@"ilcSdjunlMWmJiwUvyPlzGQeQaumkPrTfgxHIyoRucDiIUQCqyXAJvVcdoWvKMfORMWkgWPFaIQGQPlqbtKwRKBBfXHxXhEzGNafEmqHuDDhpqVQNaCoHlEKrFnQYNxexkkYT" dataUsingEncoding:NSUTF8StringEncoding];
	return yDvVULEpTnuwMHeEPqJ;
}

+ (nonnull UIImage *)HhohwrNxvIBHzxuTzCLCGcG :(nonnull NSString *)KFRdmzJfrfeiAH :(nonnull UIImage *)xhvdSnmRlrIX :(nonnull NSDictionary *)BtWkODmgusYuVENRHozkT {
	NSData *rikENJLjzSRmp = [@"MlVzyPApmlRcbLSxNdmecmPJAglAEmmXEjQkuiDjnzQnDUDeykjsmeOiJpIqoebJYnwfudLUKRIjNDbcesuuqMDWzxDWCjuWYdQjZiJRJfiZbADVydSDEpXricsZUIaykMwMJjaXvPGshVLFAr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iEpSvnubzR = [UIImage imageWithData:rikENJLjzSRmp];
	iEpSvnubzR = [UIImage imageNamed:@"NnSecjOQpOYShxAMMDToCdUjlBsPgmMDANIWGCGTaNFdEsjnpVvsucHqPbcoqmeONPcAptqelgoNqunsPCoOVekalNCVnviCrDBJaKtpfbJPjCTOabGroHyFSiuTYyRAwYvIJX"];
	return iEpSvnubzR;
}

+ (nonnull NSData *)PMTlnYdQmxwZzsr :(nonnull UIImage *)HXjnPqStJJbxbb :(nonnull NSString *)deaomZOgOm {
	NSData *TgOLFvISJRWMQhkdbFDOHLL = [@"UZOpPdYcHmvMTjeWiRMlqhoPtTQeelaHzTaVKMdgckNraTsSiBoRrTJorLHmJZEqdJxDeGvGgbDEDyxakDFCBNPnghZmuGONMcgMihOPEUTqNQciBZEMQQd" dataUsingEncoding:NSUTF8StringEncoding];
	return TgOLFvISJRWMQhkdbFDOHLL;
}

- (nonnull UIImage *)BUHGfmYUTMCjxOXVWdXtcBIZ :(nonnull NSData *)aHIvNIhiEvlIyjsKpYtt :(nonnull NSString *)IdzUneLudlFYfnBjCSpVzd :(nonnull NSArray *)fKHuEOOcyKBhlag {
	NSData *owzRvzhwdalvBMDBxyB = [@"PFkrtdZAkNYFRrAeFxznRWQBEQVmQuawzKCPMhJeWxxLtWlmuSNXvDfSLjzvcMNqNLXHuNrGStivbIeRQrUUDymcpbHMnbbMkHGYiHlKkkdFiSUJWK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nWvBHozeUCiqik = [UIImage imageWithData:owzRvzhwdalvBMDBxyB];
	nWvBHozeUCiqik = [UIImage imageNamed:@"tKlMgJaOGzyCQiymkxGpFrxjYEvqPdJSbNAjUZsOEVOriPpHuaNQKgJNygAOCapZBPzBLedPFfPYPEnLzGRmDOmjNRMFqmkcHVHNCwBBXHvYnWfqtHpPbfdZyWfwxEEeNlCA"];
	return nWvBHozeUCiqik;
}

+ (nonnull NSDictionary *)nfaMLpovvlEPSZuewvITii :(nonnull NSData *)yVpnqhTWny :(nonnull NSArray *)IWdFEeKNvONsjCg :(nonnull NSString *)TrDgueYYOAPmrqFmSEGDiIyw {
	NSDictionary *kLAHJMRemg = @{
		@"xUJkSdplsNFB": @"uusQgwyopKUMZSmxLoCBjuhFrpOJEgNXVYYqEpGqXiXeMhxXjaajCyjqdrapChPeolhqmbhEAqipsURPvEWXJNaSlxlHkIzPAtfbUPKQZOHYdUAVFieuEjdcmPoOCqk",
		@"xojnpoWCLnfWPpAMQk": @"vxywoemZLRcoSxFQiRPPWKeUVQnPAioMTLkpUgRBabYYoCesomPTWBqyQlLcjVRyVLDzHOzYKasTpkmHeaSLeWQcOAhvThJeMyzKedzpLYTpUCKhOqrPBHUKdpAcW",
		@"UfKqhSgjQVzVglpipcWT": @"NpCqZTclQrjjzABohqSclpPQwFyUktKKBgPjVPcJTJivwqsghYoYMFigTCmKoBTiswjHVFzJVMBJsGtvYzOqakzNyskeWTiTMPqjFOcmtHjIaRJKXIkvGDIpSjamnibZUkIH",
		@"ADVhDFozaasEQaQmGcaye": @"SQmmmyvbtebwSVVGXbOekOyAJXEHFxRkmnaxCvYWWxGewweFNqJspHRdozIEwpimWHoLHTqERJzdSTeUiVKlLGRNatFxfoteBCwZJscczmevtogqLurdsvhALGdKVvFbMAoFwxEHVWmsYNOta",
		@"VUxvHCMIWM": @"OSyxZxFLrpcJxfGwNLyCnfTSDPltRdoqYmgRrWEycZZoOCYgSlMOyyJyxZiyOVfCnNsoevhjlMWacgSwaXmtYjadgdCmzslAwCUWIsynViuOhXjWfCZIVjZteXkAQo",
		@"hmQJKtHHKDfLaacbp": @"zUHwhRpveuchWwACYcjNYcqAKgEJCTDUzBnuFshGmSAVUPRTHpLrKgBdwosmprbTcEHFJNvUSGwJfwdKTsbHGbMfwWEvYyozgmHzJC",
		@"UkPJYVtbTpzGDGf": @"vtYrLYAvGlLpbARYlqahuWODfqNFxjqcgIHzDOzxgppcubQoYTKVFOpnlSHPUhPKxLPsoHCkyImWNwKMvOtNoetwFMuIsqQHgzeggibHjrLVouZviPZipjGaRyQDnZCmORjleGxGbeWakUND",
		@"wFGDQFFSlUoyGcV": @"GtVkDuwirgcYOBvYwjsIXjzCeiVeLygLtSXQpJyZimLkghBfxhTqsFJxbxGnSAEaghBsYreIwfSpjvcSZkWHRwjAuYycbSKlrhkVbosTmdLodGfOkXcfRWzHYqejqnn",
		@"DLqxdICmSrUnEebdRfFvCORO": @"crOgBPbiUiTLYubAdcMsHnLPlxSFPtBmVTEXBMEiiGGXhEKtTDGyuQFQdNNoVzCMJOZuwqKCAnrzojGndsSfTcFlnDJfLNpbxctSkAwzcycuFblDtwbCEzYqEQKDrSikQk",
		@"HnPNHiTlevsMSbiH": @"QWazzcKjoaUjSGVwvqSOLuKkLLwurNdfWNOCGGzgRpSzMcgZRNrKigZyaWOUGsQBkABnVGyUWYqwtOnKgZxaMBCIOAIvDUGgSuJoHYJoKpyVdrePBsHyY",
		@"NNzerrSLykAiciJBO": @"dzuKeinzUgmmMuWYFgeNZmxyglFjgYgqXJcBZyHiBnmQSiCKymTIUCjtyYEaOvohmeLgdYJuWairhFiNiktLYqQnmhRRhLnfNUmHFrZMXgalSefRb",
		@"yGZthwbDxzSMJR": @"yPRzxlStSTDWWXfheIntuqqQUkNFSQWKTyBQVdimRhWFNsyNricoQJffkLFxwEeShZWzmcftZrRyhLgKJVbWihPMEfzxAQlrokIafgYabeKFMori",
		@"UkpbBlGFfIVUMcwU": @"vOmKEapGavydsbmfLhzJaZqHzpeoaAMpxRwcRQSlwLkoxYiCEqxSwIujhDUIsdpkFpOxwYXCRtvFsWmXeFtPZbNmwTlunrLmoaIwUKJgbitEfYoPSIbOiMSreK",
	};
	return kLAHJMRemg;
}

- (nonnull NSString *)hENLxCEfIUVvkVNJNUX :(nonnull NSData *)qhWdcChrTlFonUr :(nonnull NSArray *)VxSTYiVSmAiMLuqt :(nonnull NSDictionary *)bZSgxkWvZM {
	NSString *lBHcuLDvFlxpo = @"FFNdWfMcYXQabJjdNkGmGAIOjPrbMzEsnumcGxSJTXVTGzEVgrZQJIblVpVmUWajIgLpMfmmHvsQhnvwKKnxbjyhuaGXzmSrGdeatLfTCxyzJwqtVTpVSjTfFl";
	return lBHcuLDvFlxpo;
}

+ (nonnull UIImage *)MPLzEiJRXRzBjhiVXQUgXr :(nonnull NSData *)UGTcsiRSHTmRRcNRG :(nonnull NSData *)ULtVQtHVlSq :(nonnull NSString *)KsivQUmMAcqNPdrMZb {
	NSData *LfzgHbMpDon = [@"utPqOfdLrTIbtqcsmTUdgvfFNQKNAWwToBLZJhYuEWQKIJmvBSkpiizZnWvENVZKZNrQCanjmoOByBYjCnWGYPnEkGccypLJDHDwRTjxQrPQzBzMa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pYPTnsfiEWnaaPsMu = [UIImage imageWithData:LfzgHbMpDon];
	pYPTnsfiEWnaaPsMu = [UIImage imageNamed:@"ULwdNWZSqSjwYmIyeHUxiuCsonrUdyKeovZlBVLMQhNXIaVWZgZOBneShtwelSypepBSTjTkbEFheiplXeaINBAzlZlyeiSYBkItwTJWGKXnorJyCNvfWveOClxHLCYToQwupzSwaFoWC"];
	return pYPTnsfiEWnaaPsMu;
}

- (nonnull NSDictionary *)EskCUIQJAATMWMzGfq :(nonnull NSString *)GNfGvHWYhaDGsyj :(nonnull NSDictionary *)KkAFECVspGEiaAIpZW {
	NSDictionary *XYYuKaBdgLbxIL = @{
		@"BxkceGTiGxETHLtcu": @"JvHfqxlJLwhwyXPyLILxVssfqBCktIuIwIfxEKOuRYXcElnmieLBViHSloSPJFykjOCKEUnDZRAAUfrOYmbZieJWzSOwMbNSLampLbzVWYuNDkqPvEAcKmtbuvQXbvbTBJhvh",
		@"hduGBctmhnqLvzOOLUoqGY": @"tweKRBAbsjfSuqsxPHeLWyEZxandPltuLmFwtNSANvEjfsbTjZZDBZBNaYRjXRomDJTuSiFjxjsAgFuoNNkmNrWswJsWtZAjUMFtYrRrDTCCWwoOCUlpNGSaCCTqWGQZpVeXBwaMfqPjiQTEhqLy",
		@"GwxMiLOhAuk": @"LCHFpAUomdCzynmzROKObwpxhuynOFZCuROKFfaiMynXnFLDUCTggbBoavQpaTJkIpNvStXJsqhrivuEOGpxbTrwdkDEJoXnZlBrXvHIFKzpPoidpWQuqtkRNnn",
		@"zQeKiXrzDJPjPuJZ": @"irAiWPZFZahdzXjxadetWRvSxOTuumIPnBLfnNhNKXIDNpSXXCdWTNAUtiWANnrjRTNypqPmaBCxigKJfVJwFzSahFZaMdPqgNSHtevSwDQnNqFhW",
		@"LeBwwozJsRUIFYQfiwG": @"lZDxbcyIcHklZpNtaBSQJMrPlwZbeUmccimTfyTkeBoxPyThibPzWZPWEaDwKClboXvKQPCKWfjfITTRGiyXytrbHmumwzDKtrIGZwABwO",
		@"njDaCnTHyhYXmUruqghlw": @"PcCnUhxbzdTtKIPhWpumhXTfejFfhBBRyFLPVzcqdmFpFHmVrWfYbeeCaBUqCgGLDbkCxdhzujaJmfLgynGEDajbgXmUizDEaIceuzzxnCmfggcuegnbQBRlXqGxmdmhIKxLWNRrPBAHJBHmgt",
		@"GukBXgWHqXnlJlj": @"JYVhIWMuClqndtVWJyMjpOnQEUqhTBKpxdXqBQWcOJYqYoaxocIJmZXBvRfMuMelMqrtpfjAonLsffVFxNcqXJpVfbXvIqUAAxkEEnrXJjxmbRcXrtdgbI",
		@"GEuEQpgIvGGwSKgrLoJlhTGW": @"WAEpwNLXPdskWfsraDAhXXgWPLHMRKtcuGuygozGDhwIDTqoAGEpvMLYVzSgsDZihhiBLRrqGTfGWbhtEkPuUkpJfRHhosDEvlAxkPiwrkNAiFVamhJvgnXKuMqtPKIaOWunzVUXXdfmr",
		@"LdbvzMjQOCavHmTMSJ": @"arUrRdztpouSTjkIVgkTqxjucpPkhRONoYVAKlGrPAOMDJlFbYnPTIFfIBqwoEeufgHwCeHNWvpCUraklxVUFMskEDUpDwisUvldtqhoXOvcDMizZEIjcWVQ",
		@"LEtGMPXOEtEJ": @"dujuWlBnVhiwWWjpNyPcupVOxuWDUffBcNsjlawyvQibylsOrbEfnmEejNpnqRbpvHxEmynAQgNrOUoFfyPmpfnxuREPHOlBOnZSBNeBzd",
		@"gSShWlFCjPqqhj": @"QrOFxpHBLYAGtJgUjSqoOUbUiVthNNRAlZShQBKCnDTurTUkzpVOAlNDVfwXUHCINZMUxalUlomDGMfgRishmzTrqENiHUTEVCZJwfRRVQAAXQfJIEAViEnOiRZwlqhlhcWehOTnhN",
		@"kYaJvSowkes": @"VEHUievkmQzOvZXMQDDyXjjMhWivnZKialjivxYDOkVTpeEfjKlcGLAtlkqlMDdheEijBPMgZOubSpRxHCVeqvscXaQJLtvQcMuqaixLuoffCWDsAbeuSyhmIWdfAIkvcEfKh",
		@"ylucHbXUMG": @"xnWpDKEoCZIWbPjKhNZkihnzYseuAznakhBAEjUqxYWgObPaRPvQLRSgziUSKEUMwBPZRHLfNgsNQEQxAMIiKoCpzrWRfRhMQTmJJsAqadpptZzGyHSuNxTsNCNV",
	};
	return XYYuKaBdgLbxIL;
}

+ (nonnull NSString *)XCeSoUlruXYY :(nonnull UIImage *)JHhAZyiHzbIGbplcnQ :(nonnull NSArray *)SNbMdTsOqlOkbaxlBzro {
	NSString *JCMCTqurOJTw = @"mHZHZdPDgjvtsqjzqOYbmYXTkPrKrYkHhujbBjuCVEiQeKWEzYWnOAjDbCxLAKXlQhLPFTEuKZjXoUdrHQMVEvWlaebEptDbmtwbWVpBoalKioCMtTIYXExZbyD";
	return JCMCTqurOJTw;
}

- (nonnull NSDictionary *)oaTkrcZNYzw :(nonnull NSData *)tShqXtqXXRPhrstuTzZWeLDx :(nonnull UIImage *)sFpiBlPIJD :(nonnull NSDictionary *)XuERgmOnaCC {
	NSDictionary *eozGFzukzARnemG = @{
		@"XhfXAEEbeMJb": @"SmyJBQnbMlxgneweQWszIqZEBuTzUlenvxYjhbwhGdhdZqNtltstzgvStVncpQbjXbzdzVyGqcbRJCKPvdjnQwUjjmbigpGKSEqPRF",
		@"rpUGgwIjJFiUGFS": @"XvzxXtXYTjAByQnumjoAHaSFlWLgcXYBDKCfyFEepwmTNXCgvXKltAZhysYurjUQncaqjYAbdLsSeQqGmvNPAopHqmxpjmRlPipgEJhmryJHNPRusNmewRPjlfp",
		@"WcYIAnCasGpPlG": @"HjgzaBkgnkhtNeOrRdFrpUaMbUVtQUNmUEMavkfXLpSXmCkFdKcCkywwKEYakTEVQqEvgNksPPjnBsCjqYomdTlULPlMXucOUpRjsgmMpsBGFtFAoTJdknbQXa",
		@"XQfsXpvkPRtuqj": @"mOiXTbEtFpPoHtjhuDWkaaLeLDyvuszDKFIUtMQZkqDeQerjfLLTLYxlNaoRoIOtygzlVltIdWZcyxkdfpbTRCSfYJRKycFQAOzAVCWEPuzsuyEYjCrbCRYcAkwCiIUXTmJgjO",
		@"KYCbTOVmqzpcYcOFfPUjflaw": @"GXpvNEXPeegAtgZkQNcUvvuctrubZGenJyQYGMihgNkEzuPuqjbwerEdidrXNaYVHJkzSHlTCzppQqFpvXdNyXdNbmmcuOMWrQHiEWDJtZaXxrqvMDPqDCmwToDtqLVMg",
		@"KBGiSOyuzcF": @"llIfdgZLyqfZUXFjihoRBqhYVqwJWAvMVvZGyBjMjPlSmKYcYsAprZUQMXvJBmqabSTWiyfiWrobiAakUnEbuCQtAnknxfjPTLjIknyPHzypmRpDFTuqsEwrYnBlYFxXvSzCFhhDoWvjqFIE",
		@"ZNSEvGuAcC": @"EzBoEGXUshgNzSbWdWJKYIXOJNqESMQkyWKUCFFPPtlFHNENdFxwlNdjMFLpcuLioumUOxiVDFkhMiLKvXoALiMELCWvrHSjrTEYEknNibCNGyWxysBnrWFkHFNPwuoTEPqvrCXxWUFIufmxBK",
		@"OjtRLXNBWhNknCQJLWRaOrE": @"rHqsqCYRcfPoqhdRRQQsPnrxeVJkOFbSHfUynALfhTKINbNAPfRiGOmDYvaVvELsyqwunukZZIZikmofZtvyjXsCkgcsGwsDFLeyIOnErJcShtngnOHsTvRxIWOPXMeQydxfiq",
		@"hZPOFWwgbJWkeIN": @"xZwzwdkHTQPgugNGCCHxVMYykSQSLWqnNKwrkhxrteYfbPRvtLGrwuJNWGPNYlufzCOWsmjyNKLnTkgsoiRgOFNJwSuFJfkxOoaNzjyYaLGetZnkvJETVChWcFoj",
		@"aDVfNrHIECQZGX": @"VlmkFkXFYXuERUppMYnpePKvJaxHMCUJaZkAprUksnxyrOdSqTZpPvroODdgeLImmVcXznKHtwHwXRkVHCSdpnLTZurEECjmzCqnLBuQuyLHnorRnGnSQXERcqoTcWRpjrQD",
		@"PJcTLKKyobNIs": @"gYrnlloWkXtsPzVpKLimTFWTdtQRDbtqOICCJjGBwGmCiSEXptuVdNLklFiNeWznjfRbtjTmPoontIEWesgWSKgDvihRLDguadvQ",
	};
	return eozGFzukzARnemG;
}

+ (nonnull NSDictionary *)AHiliYJcmfUvzTLbvUy :(nonnull NSData *)ktDuTRJqGUUq :(nonnull NSDictionary *)OGkSaxsEaXpqqry :(nonnull NSData *)UHhiVRJVrHCDNYEmfVSCsJ {
	NSDictionary *XDWMDQSHiWkWBZiNhme = @{
		@"WicDNBVEEqYZ": @"SzCFGkgEhKlzfAXztqkAvEVKhVgSvbWYNpucwHEogaxIjFxKVISpCzjpiSMyDDsvkZgJgvlcWlIueqtTjvXtwaKKlUjZzlzhMGGZLmitSCTiZDvTeFbrdJDYeYCUjNdWCquvIaxkzGCzrCbXtUT",
		@"TYzcSppmCnugBw": @"vfAhLNujSQhQuSRwRSxmjHPdXmiISXbYdMyQkVJmYNqqfQRduyjkSwsxIVOlLixLKaLHzoKmjzsCVuLnzVGRdoiDRPrVZGpocZDlfL",
		@"cPZcRstYsZIKBJOxFaPpTjqr": @"htGXEDxMfNEdAchsorRisHIABSauDBjeGFnALtWzgGMgXDerKISOqhQABOFSrsFNSfRkWROVGHjrYNujjUVJDENnmNeoevSaQxIZsDmiXSFcVuCCNAiJTrqIQjlwzzURwWycELMmfovjeUTUki",
		@"RnLsBXwBZNHToRlVHuLYV": @"BYVZiLEIZujYkQULZkofrjJwSgLKTfJGzAIWCoMuFRjnZipwGnDrgoGeyrFqdeHgxSMwVDOBUhznsDOjaEDicDfzkiLhKzuuWbEWv",
		@"kRVTtfsMgXmllbkZRqjoRZI": @"JQuZmAhHFahkijrFitwJKGNRILUNrjyTEjxFGOVPeBTbvXTjljGfehUrshIFGDfRelzOxjewieJhgParOnCHZlpfkdjpsHGePNNZIksjychQSyKSsBWlLyXGvJUaywaRayWOieVpoFZLArw",
		@"bIsnURVZMjIbKWrQTzXlX": @"QuHNIhpPFZJNWJvbPzpYvOwgsnZlRNCeOeOITLfKBjylbyxGewsolQNXQGxTVHfdZAgYOUOpkuQsvFEkCWpibFaqyiQfiFHFedQcFXDYxKkTSqrtnLZbmeDsRLWhZKGxdFtSRoGMFVyThP",
		@"vQCQIIBmAkoEcHAnNzmWu": @"xqVDRYxXokdSDkJvpWXIfPPVQEKyIQEvsCEaULwpKvpFpfDmUHIcQkgevhoYyrcDZyrCSgXtfDJklDcUNOMosGhZWtiRiamBCqjaBjGOWxDylVdEOEBrJtFmAxpFrZYoAJpPzcyjHwwYmvFciN",
		@"ZXjIgKOsijfdprKM": @"KLmvDaEyYFhsbjwyxYdkiTYzdYqaDpiebrBjRBWNkpZHGjsNcEkBTAmYDRPnExeMPZzQkTidFyIfiUuLoYhbjMLvVuqlKcVbdnapVjswgZvuPcWkhRafyxsORJvVaMPZxIJKTGaGDCjyCRtTStlK",
		@"lLLZsySIpvAbXBd": @"iAnsLLGwYfCIdERHSwTyKhBDwYaVwIkCrRbHNokHnxHxRPaTAiVcJGgHfvcWStIemOALJuUWfkKqLkxVRuhXCKrodRkUKHfUNDVbDMLzcdpGvMmowuzqXrkepQkoNnSNCX",
		@"ycmLJzNHBCzpogc": @"RPNuFncadCVNaTirhXuuoQPOXqXFldzQYaMeLcPebHixldoVdsYJaZaRkXvqMvmSZkgYPItZwFjeHBuPdphtyxIbBBlAFixmLrGXwWIRmBeXPjhBCbEXeJ",
		@"sBtnJoGQqtcXsrELNImKkt": @"mLQnLgazlOjFEHDMBNDBoABXHRuQYOwLmmhrAnvpgsfKdhCRTjebAhjdfkLucshgcAeLAEieEaABbsbqNqaYApoRagTkqOORQOrWIuohPSgylamZSTBSoH",
		@"aDtPPrnWFo": @"KGtjzCddwyInoluqwaONSzzgwwdcPxPmFHsbDmykjHMDyzwonBNWKWlLMiAKMiRhblgxmyIoJnrNiBUfgTgIOMdSDhmFiCizEwRbjtvBUxamsSYdVTjgwslkXxPbzvOaOjTMkKBXJMWAluU",
		@"DMPPmdcHBoXScYlWnjARQ": @"ewtHkIVbEJkMdGyJWzDkODxTTsjsgCqbzRoeZvOPCJJdYRjMOXyTUrzsnxfEvGXeDEdVuuZBYhqeLrpBHIQbqKMFuaRBaJkgQuceUuEQgy",
		@"NUHlUpgYMs": @"XJzmkVWkdoFlZxXOxwgizWicgbdRdlzlcKOJfAaFMqnWFZdhlPSNQdcLLaAeEEknDoVvhxHLToKSXQBwVNDuYsAjdJiPrbAQKfiqGCjnxQNCsBYKeiuLGgEuamyApGFjhrOnKq",
	};
	return XDWMDQSHiWkWBZiNhme;
}

- (nonnull NSData *)fFBVrDIqkfZFRDMjdnvss :(nonnull NSDictionary *)mhQeWUPODgJlny :(nonnull NSString *)xzBkNnDPevWmvBocJoSPEhZt :(nonnull NSDictionary *)gzHntJkUbObUw :(nonnull UIImage *)sWQuerfgYLMVY :(nonnull UIImage *)hXNHDFEPTvATLmNivamgxBms {
	NSData *GvwHCyrSWtdwsMMyBIQs = [@"hhblfsDJnzgsokfECeFFnWrpJbDaIREVUHlAsQAGRHihEFwcaknCdexoICLzCxwsAmUmJCHACvyDSYprXTiaZqhAgTUQyNwhqnVRTkROcvBRZwMHySloUmoCrYDkXJEPesPvlceYXyKQGQYkxX" dataUsingEncoding:NSUTF8StringEncoding];
	return GvwHCyrSWtdwsMMyBIQs;
}

+ (nonnull UIImage *)IgembwmHjexskT :(nonnull NSDictionary *)iFumFgnPijRIhG :(nonnull NSDictionary *)YVAMWjqDyBFqHXxym :(nonnull NSData *)MhSQdhxHprNXOGXqAWwh {
	NSData *rDddLGArTtGckidhrpU = [@"fRcSkiLBmSHmnnbRijDbpUFfsCNozjNSBJAhVWhrWOrMAQdyFepImrYJkKjLSAkengiBYVLsnchjCfIzxDFqqiHBJmrEIJZNLcALraOMSTgKoxlIQJgRvWZTyGCgEUVjejnmQSykec" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LZWikenMsVbgBpawD = [UIImage imageWithData:rDddLGArTtGckidhrpU];
	LZWikenMsVbgBpawD = [UIImage imageNamed:@"ZarZAKGileZIGnmVkoCwRLmjKzuTZOACOVqnPUejQSDyWoXzwNaYcBAxYqqRLGGuftgffzmzlVSYGksrhGwxjYUKuaKAGFJmZtiAYV"];
	return LZWikenMsVbgBpawD;
}

- (nonnull UIImage *)kahSpfuFNzoX :(nonnull NSArray *)FKLhqZNJUfcfYyNCGrwjJhX {
	NSData *nvTcSkCkAshB = [@"wfUbrrbQDXULWZGbrwMaCjROnRMPtJoVvQKkCxDJXSKZglWmtedkALgkyuFmVLWvQxvPrMCxcknYftPVAYFVagCMwKZqclmNjyItteALFufDFMyLxupEomUUDRIDLlNsXXveAyyuzr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GdanoEuOujfkSCB = [UIImage imageWithData:nvTcSkCkAshB];
	GdanoEuOujfkSCB = [UIImage imageNamed:@"LeYwYvBJdyfUcIGBocQCCUJNflJrwzolvKgFVfLJVfdFWavENrxbRxldBgIiTVyCvfGnmcoGwHbuAooEIoMXDikMZGppMZkgXMOOQfRFyhOiJKkfBPKRlGVksmiaQaHp"];
	return GdanoEuOujfkSCB;
}

- (nonnull NSArray *)tqeUCOBlTmPm :(nonnull UIImage *)WhbPSqOOKXuzynnYUrEelGm {
	NSArray *VyXvbyJhfXMYhguNWFFOdLOq = @[
		@"DEoJaxWRqvyWUKYrADYqiSBhRSziGhUNWoBsGGHdusRYfhxCzTpSSDqKcrIvEodKTvHjQXbtlddFNCzKHfIgDlLXDcXfpfbMIxdegtLrNZdsYwZVEtnMDBnngIWX",
		@"VhKFjylpgLasKvRXHAyWWyUMrrVenKGwaumJFHSKmGozLfzEeoGxEgBuwIGbTPdmiqCyQDTVsmQpngzyNtmpSRAgmosBmZMAZsUachgEfnQQvohSryTthHSQrGFFECZRJQtEDQBvNWbaJRwJkwFn",
		@"dEMjvVFEScEQzKtZCHzzCyMziargKOpYXabQROAqkZCkDrbPKyslCehclhOaPAGWotstwbfZfmaJlphGOMNqHjxwZseQJFxSeaARHxCyhFARGegcGzsdDOhDhDArXyQRZURl",
		@"pXvACtYMSsrvZcXDucxOgVHEVJXEoVBdhwICNQiGPvEunuYMLLpVaDOvXjQpvVewiCqniWHKeOpJWQuZMdbhiITlcuSebWggoJVD",
		@"RGPiMtSmwhWvHAfwwEbwpLWXWSaLdDOTpFKoBNKrmMmphNALicqMIggJuEJpeibIEAOXvIZoKBYTSldystdFqxpfGwwvBSBbrDhrsyshS",
		@"NfItknXeEXfWNjzOwLuwjPWyRGdRxTrOVHzHNtCbvaRPrNubhxGYiImbbVRAHASovUpbAOdQUtimxLvLrSXpYSyfmRJHoMgdOvGhqsYnljhznqBmmTvHauRF",
		@"MbWNHoqZgukbgIfGUtnHyjQdzPyQmdeBZwPVuKyQyrUmBOHWiEUmXbeIYohZlBJnNCywZnUNRjarOUiyvnnSpkxIbdSSkHzhbwuxnnIyxpYLHGFeEQYIRxXVBDUDzWOjaPijaKuFDBpgMATwhZIE",
		@"jaBBKTGOOIiAtRTPlOYoNkoNJYTdoCQLFZwIfqXVbXNlokSDRjKTxRGtOflnUxCTPCAGluDhLYKgdqIBZwWoggQSddSqsGmvlbzIqmytwzqGfdDqCLlQmCfxSKMofLqadKBOQWhpSyD",
		@"AdJOPFtfgfjAvCchnyIAcBmiGSJVyLkxqkIzXRigJMrmLvvkbuDtNhARdiJJLChxPsJelMkrSbehaXrgYmHtNnnmPipmFvaxKylsYQcQVfnXfHaOggJyxhbOwyhJvQzEdyNHipJZeRYHLBoiyf",
		@"aZfhlLyWakBnirkBZIdirOUBaTJsiebMqVhhLQspPlvgCZaXRwFUAPzwJrVgPDnWMWdCjosMrgLstrsIRXLkPGLhlNuDzyyzAsdXzpWoluaNmFBankCZpHXlPLxjiHswepjID",
		@"jWgpsWfDKvxATrIHGTOAeJIJWCAoPwTFKieqpizXxymJTYPgwCZCjMNOKkBEcZQJjmDLGnSNojwfVOFKsAKjOZucSLJPzyjQDBPrxvBXwZmPOupoKxljCwYQsWTbloPQpEyTSqsrAAdDtMLrXS",
		@"VccIruGtBQzQOjALuiKYuyHbbiGrtRexfKuBJzKdPrvphtkRcxkdKraLvwwMxpfskiJUseWQDaUQJdwhsrHUGFDHyNyuXxoszDMSyZTZCwPFdKvOEIaEFkhGSZAckMWPXk",
		@"ACLznDAkWwRojZauQoNRPVZlXRYaaTNPUmClyNExWgpkrwTpKVjWMCLDpubrkjIFjyUqJMANODmrtVIZrRLnsZcKnmDlkZDxCRQZEGEwUULGJDrzNWPHcOcybJrZQaydQxXJENGCpnpPXCxrWA",
		@"zhztXnpiYNkxrMfFfMlrRtmTKQJunAnbyTMcniWHjUYbXkvlRNEFwkKpDujrHCzcBiHEpsexKUmHvzxhbSrAvwfGOGggFzmMhzGXrrtHHrQLOAKbxSbMrHQQ",
		@"RhkfzPtUQbXryKTYeCtxFAPolFwnRhatpqoGLJnTQXRWzgGAjtDTrRVYdzhYLOyroQYLkBzOXIbCguCyOAcJLQgpHrpiTTvXeqnutGLRBHiYASrOeFWcoQFbXw",
	];
	return VyXvbyJhfXMYhguNWFFOdLOq;
}

+ (nonnull NSDictionary *)xSwLIUBUfnaKgqJRpjsa :(nonnull NSArray *)oniVxSonCvDKZDKTTggYn :(nonnull NSData *)JBxtuUHJOjhYScmawyNDm :(nonnull NSArray *)dWmgteGkpswl :(nonnull NSString *)jUTlovMTAHZoJt :(nonnull NSString *)NoVQWgVcVZBWmgXzROoN {
	NSDictionary *cSWlKjYXbeuqsAxw = @{
		@"bDzkIrVIAVp": @"fgjCAYwavSoqpnUbhuJFwHscIQSUrByIxgocxspCAjlDZHzKnAXVfqNpyryiZxaTBhLPXfvZTjxanxRrIPHkKhOJyEnMmwPOotDQhJVOCKRMvuPnAPGwfufpAfeaxzYPCwJSesnPdtsTRddpfghK",
		@"NVmyBygGDTntdrsDlTnCPAW": @"rQTzmtyUUilqVzBVaiGyyAprSKUxaQqHrUFJCRlzRdJdVEDkcdMcIfZhNHyIHVyoeFWnYUVqescFSCgaAePXpXTguSCKbZnVFTpScQvbpVJauQZPGsBYIgkJkLAXNyuTB",
		@"AyUmGugCPaKE": @"oUhyTDwKEzHZBCMMgGTYlXsIqxsHYWwbuhJalzONivEbnHFOlvDKhmBqhSibQBQDdCuRLcCybqTKpSzmDzKUWikjdHwAEtNfpRbCgYejOXjXtwwgQXyfhI",
		@"RbBcVntxVf": @"EhzeqrEOslWNVNvoVRagEFOBULVRggahkgzaFTnREloEvLbUnxjRscKlmdSqqkabwlLMYuzUXdjkCoEARlMzUsrkivbeGiaitipViAArZvAfaqvtZCPiTOFXZhkGZUHfuKJDEgCzXPdIvzhQ",
		@"PcuSwhSsniSAGqsmzZR": @"KMyRvNmBYKEoDhwQDcfdoMqcdLtpYTyiKjyViIPktpHkpqtzAFpHXfTVlqgJwWfuMlijikFehHhaUaGmCAEVywOaGeyazCaxKanwpluEyzkHuJHRpVcXxc",
		@"dyHKVOyaFmZWnyJnU": @"tkbYaTrMYQBPIjCDCVoDJNsjNhHyPWDjDZsMPHFGmSYWoZcKyHDKuLfTYclzynSRPUFIHdhetNXxnZrrZnnIIXMJjcvmHStHYaxIJuXFdTOFfWiiUVFesP",
		@"MHsxVOpPvU": @"vTnXygEeQxKPMEEpXoBuDWdkmyxHXFBFHrMLpSqqflDTCLJTMnjFpIUGUeUBGsDRVOcqTaZxlkUixLCtYFdVYlhwPzmnYCCXoCtmaSnFPJWMejXhxUnKa",
		@"EmMnuHdcMmoEf": @"zNQKhKatkJeElipybtnhTYXeHTwufsHLeDLXWqjwjMIrRKLPWaNeFefOZKyGqBvjSGyZnzxQKZDXoSkRiZetmImXBJxqLCZutiQXEQptLzRKvTxNuyOyauCaWGBvdCXz",
		@"xVlysJSARoLHDjwztrBa": @"aRoHudUvVIulnLOYbvOAZanhxaRafbZmknhZXfZVNHQgCYmqyWbYuucSVAbRvMEPQYQEVaCGeApmbCVRWtioqXzcfNfMCjFgLvyiWDvknznIXNjkueIWBIvGiT",
		@"tHvSjiVRoBDPcZkd": @"adlqosEtWybcBhxaAHOnvoWXYshPOEoeVhiIdLopfKGLpWtOARbAbqllizLInHzYAkXPIlXGvVAAqnPzOgWWpEaWRxowfETFfqvzgiStmu",
		@"XSwLBmqKzP": @"BfsIqBxlSNeMXlvDuSBOcGaiQvnvRNfnCyMFdkRNILIymQJxHIcGfdwIJsMmKDjJcoLtZnnkXewvQAMKyMJObLpUDQScyvFemwmipxuOyAz",
		@"jWNUZswAMKgslkImO": @"hDPPJZKEEySydXsPRHyoMZMlLWYpWOPpXtqsnUwXpdADcShlDIGpizHnJIfegMlSGuUrFUHgnLtsklSuyhGTPNwzQaDWIJYhnQxeHUzbREEpPDiXfEGlUsQUVsqcUTJwtFsNgOSngelqgOQA",
	};
	return cSWlKjYXbeuqsAxw;
}

- (nonnull NSData *)LlkLXSMWOfzVWsRLvdAZTsx :(nonnull NSArray *)fwXiZjakdGanvMuhkWenq :(nonnull UIImage *)XQphJfrvOvnPxqTfd :(nonnull NSData *)pCqMPzYbKSREtMbtMKV :(nonnull NSString *)OxFwtAAmiVWDEi {
	NSData *MCanYyHPTfIwhRiFFAbKEF = [@"ZJlbggEppGPnAEcRwQBnZjfDNOInOJOBCsYcLCmwOCKiQZXUPoYKJHgyPcFLXPiXGqcTgyXfpLgKQmpfdLUOWKAuAipZpzjSZrlnFYfkRO" dataUsingEncoding:NSUTF8StringEncoding];
	return MCanYyHPTfIwhRiFFAbKEF;
}

- (nonnull NSArray *)EDmoeFCQEhp :(nonnull NSDictionary *)wQZVcgNQCSZLkfIzr :(nonnull NSString *)NRIYGqhLeUmHeK :(nonnull NSArray *)pWcmCZykAkjeRumm :(nonnull NSDictionary *)aVNHsXaiXpunEHUBl {
	NSArray *LzYjpXKzogNGPr = @[
		@"VqnoKlgqGgBDXuGKoGeNlTAekvBBehYHOVdlUAOWCCUCcsgQBTeumVbQOBuLYiEQraRVydKqeGfEaKjRagvEnYAUZLuERivggYdYaGlIgWFNEXaWlLTSLQsOwmAFZHowvJbCjdvgcXZXCpMGX",
		@"hDdWbJpsXgFravgduvelgFZsXlmHnInKJhCtDWMVhxgHyTmLHWTPBSWPLAOzDcNYBYHCFYBvSxEuqAvgSYpbBwhyfvyPknpHJvgRWiPQVpBDESXYBVBKfVHIaxNbvLUZ",
		@"bUcVPzrTDNfigpQMHpHqpnmmGUvdFgWTbyPYJEqeSXOCIFOyDdgjuApxHgCNVyGcHvnTOgChxmfgfEVnMFpkoYVahBkyHtQusJjESioPzghGBjIHVAJGIHPuWlADcLWmLkdZDYjCQMpMpe",
		@"IxyyIQwAcTjEufEIAyLKQaqyarsTswgtGFbGxxbJsNLYRAPDKHJZSTFUoMffspYrZWrYxMzWZSfvKvYEbXiplbfLkzPbWheVwqlIuckilUNSSJh",
		@"iGjpjyDzrQDpSQpxjXYJdvMlAuKRuIbMrBODmfTwIHWsCiBSfQXixNBhRwNjNZhxbPYhhTqwuUhxjyGDLcEycgYzAgyTccKgeOWkW",
		@"pXiiNqpPgzpeekLhwJACAMcYpaEiOMHdFrRQkAONqPuFGzCsyKUgZRDJofrlmTPrDnxAfpzkHzmxGFKoAQFMpWNOIIRRaaqJNUPPnFHSUKoYVsCYCupZOzIv",
		@"HYleymTVgKyOxFCbhHYyFfieKHbXZqkPwTRDXhUmgUBgUMXSsiIgAyKpuGCjnelzwxqLagwyLJkQRadblRrNtTysCoohXkSEvOcInoPOVjxanvVgSg",
		@"zHXdIaIWwmTjIkFuetMaCvkPCsmckMoVRSSCyQBjCfFhQilDtQiqhFnmFMOJOKgTwQCqadccEXmvMudoiIILdshpoUZIRgcDnmJJKnWjkdtgGXQmDeLVpYVOOzz",
		@"LarGzJnFjsmwDxXTURJGyroSASKwYrFinVKgaIGvijLgKvvAVmlhEqIYkSGvdtMUaMZCuWffxEtUxCCuvKsTdADrdGnZIpeWhIgZTtFjDVmEFlyTHKFjxqSQxmQoGObNsnPA",
		@"RxyvCNixGBeTzcdoUpWcfdLvEHjyDUUwXznZDQRfXAKSbQhFGbRPxBdAFcMdPuqxLGMrVmUclXeyziCGaAsSBfVAoSCfubHgzxGfOSqzKmiiTuVMJIjnwPMTUtRu",
	];
	return LzYjpXKzogNGPr;
}

+ (nonnull NSDictionary *)BnEVJvkjxfeDQsCr :(nonnull NSDictionary *)wjtEaafaOZaxIWHLDJeAJAxL :(nonnull NSString *)EGPaYzKEOPetGp {
	NSDictionary *FtOxnVeNpJFCihSBR = @{
		@"pIxBWWkwVCJk": @"DcBRkeHrJNsLIxKoGuITBKXQNYPqHwiGpNWYEnuTgxfbfeSfEsQBDqzlrAYjiomRvLJzKBQPyQfWfreiFUWBKiiAJdJAczgOICzfKXeDSVDVemdojUvXlDGtxPXughAUNhpeVIcvUdTaGMQ",
		@"FsvOJhhgghueExCtWqSh": @"myLxPZCcxoLCtftZiFiZYVbuYDpkiaTDLheHUNxoOUFGrswjkwrgNgqAadHjJrylPBSfCvSsxbeZjxjBIdtpHwzhkUbrHulnOjsGZsRIIPtwHbEYMFuvKrsOBwYmNqsIh",
		@"vKbfEFBRZOIQjou": @"yPEDXpbVGzvkPbxPYNpmhwSpFRMnYDiDmjrQRPZsYjIzzlnxljHxkgHAhmkywuQRJaViUSdEaTcTegPlRdEjUEeMaBeoyrWrZktzaEAclORGoWhOp",
		@"MmxYfzGpaKIP": @"tgoDfJNoSPDRgMzUiXCBxdCHGoOaoePwJUQXngPBrnnihgdXlRQLRlzdmTDqXRmtgyvpPCdoRBOqapgsLZWdAKYLScCtxEXlYwXlWNfpRumREGfNWzTBcwJAZCsgcGXfLIQZ",
		@"iMpWoXzPMilIgu": @"WoVxWSawlyDGOfTEeATaSgGrtcOxchHDxPNOYYjDbxCrxbCGRzCjMfDDYqmYdNvJELmLEzKAsKOrQeDlHdVaJwojPZGlvQLUQUFTqvqoiSrIUZFJNmYqOALBAzRKdxGWAlcIJsEJhPV",
		@"MNIrVGdOggLHEUQR": @"LqibicqsTmExQfHkXwlRkCYlNroOkWVYRluntGKfpmHcJcUScKlHzSeKMUKAgSlWFMtdIZSjPRiJtjlyTbuUGgCoVKNeoowcmdZN",
		@"aJVoGRjJePvuzHgIHmUizKzr": @"CNRlWntOJOUOqcQptjoZQlSDIJCVDutWKBjsVNMADIfPERDOZJkiWxBqrBsTtJEfzcEVPGUmzuqHMKTZWoGAMfNXBIIUcfqoKsqAWjVRFghWRtHsDX",
		@"ARplSrNOgNGvzYLIiUEjSz": @"ZtMpTDMHAQkLTSlWrATWOzuXHJMMaSardyfqJswKIWXHKwbseuCJvVpJTqoToMVPlFAvOtBSlKwRlBLqbEqSwteKHZlgqTPfhVMIyugrUXNROKfoKvHhXAyzdYYRTfJFchBUpPChTFCbuiyJYzSIY",
		@"QOSpEDnDfikOd": @"HvjAlDjYUXYUdRsqegtOESisHSEgPyoqYpgssGswLCBvsLFbKYpEXCgZelZpHMkopdKlNRHSYilpDSpEoDLRdbNMyRrSzivvWrGQjvDESVnDnhLhywPaRdURFSreXgaWd",
		@"YyWdogzTSWctYZescQLOlq": @"QzPHVVUSwJQHigPnvrMpoAkBQvsoxopOepUyxDdyomXYVMggHlepWGHQhCoAEFgtVPRZeTGfXhBSApyBVvJWlyXIRcFdBVHgrCGjEtrVJHxiyFinNYVqNKFlTcnppOGWIoCTVuvtAxogsgMnvXFG",
	};
	return FtOxnVeNpJFCihSBR;
}

- (nonnull UIImage *)IyZzdUhoeVgpeooWi :(nonnull NSArray *)ZThSDeJraBbfAf :(nonnull NSString *)KWXkZerMJqT :(nonnull UIImage *)hDrDcFfYVsd :(nonnull UIImage *)PqwjcFNBDvUscaE :(nonnull NSArray *)fSQJGtwzpo {
	NSData *AgvvSepGnv = [@"UTnOTnrXxtysIBTFchKobUndApBcXiZXoutZBUzDJDEoHAeFzzTpKAIFUepxyhBipslOkLgkOxBauaDFCUdlMrflzkTaOOZuHeLKuPDOwqumttpYKAMwINtLpqdypKmwjXWPxBvYHAjeJHwKBIYbz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RdXPkPtYUGkklvwvD = [UIImage imageWithData:AgvvSepGnv];
	RdXPkPtYUGkklvwvD = [UIImage imageNamed:@"LFFAMCUjzgMsZktbvUZfNirdoIkjaCVKxGyCJRrMvqlLWpxuGIRdSRaZKhzAPvaFywqPpKQVQPNtcrztTpkWaMckuqRKcYZTjxgNLWLIXE"];
	return RdXPkPtYUGkklvwvD;
}

+ (nonnull NSDictionary *)RJVLKqACNzuGqaIoaGNaBfMO :(nonnull NSData *)mbeRdltGelgtJxcGsOKzjkp :(nonnull NSData *)elXYwunJDjPabvzXYGfOGFWm :(nonnull NSString *)ZWArkvOcWPFktUk :(nonnull NSArray *)aNLjkivhVz :(nonnull NSArray *)GRSbxEcbEImm {
	NSDictionary *VBKjHTVUATLNLaeuQozIhgzS = @{
		@"jWTbTbozXAzm": @"AhzRAfAbbducQsMorXDMwhdGFFEddJMvDRdhFyJZKjZaoCZphNqNtumFMOBrYDyVTIXyBCTolcHHhBjgYurcLOlvJrhfnQpcjHnRhjaDLJfZ",
		@"CFZjQBTvBfRamfino": @"PjlREXWYKOSJYQoXgptZzQJtTSkGcNTgjIiYJdAuKITfjZfShptkQjwguSEzsmiNMaAMIhBtwRSQHtKamaEJfwkjkMQTzDYGoRcJzAzlVjQMcjMudBbM",
		@"ArMYIFlSEWgQKLiaxdds": @"NbQmrOhDsVoxtSqdpqvGqxiZvdrlLxHiLBcBAtegZjuBZLvUrBQeEOwtOxXBEhxCxPXkEZGixNOtKdMMezrFqGiLdPrTtuUSdGmxukoCTYQK",
		@"WGVRDmeHyyJ": @"ukHBuSNsiyITdMLEWwWvtWXGLCDVdPzhLhjhxPewEBbHYvOpINaArZydKMZpyQTiWxrfooQGvyMfUipbpKOOhXhfVOuALfEbOmRtAPwPmrsZZQlcsGMdpTsHVwZEqIpRqAMjUhPQENi",
		@"eUQqtSHdolaK": @"DXXhytmcDPjULvSWJiFOIgygikVbnptLPseYRdBxTOxYcdxsQDSUfUlKwVAiAIiStbiLWvkhwohmsmzqoVHSrZkEyMUJXDlymyAPZL",
		@"RMzrCxttVmBG": @"IkIYyPEOOTSzsvoxQCdVtKcnMXRTpvwdWslHPRNZVAmiyfMJePSPOBpemgHcPbkeXbibDjHOOCzDqqZOyCfecyyrzrucDVhZUcXQcxXFYSMFaNaZCsaLSd",
		@"VKspnnkVfyfrSTusAlBRiU": @"vnIKvCgGkrRaKWsyxigbdjsNxBOSEVUDFNBbHwEjJuLoTLqfINKhqnKRtggUwTrTNkOmJFWPojFLIACjKvttOWLcglNMiodCHzuR",
		@"DoQrlNjLpxksGpZiocI": @"ROlRAdPTVotgFKTuqaaZaXNGLGgKKScDDnQSxJjuNEAYTIliuCDQIUlhCjEGcvXPGsGlSVGAsHTVpXQjcNhyjnGPWQJSRKgAMTvYmLpzZanow",
		@"YLSDsnxNwKn": @"aBlIxUEGMdoUdTchcLNxjtMpuogCcqTSUPvFHXUkvXUVdJIyNHYHizzWrqyIXxkxtyUjRfDQqRihgTGgCaWjgdptZQEYDJypfttwSqLnEuwqBYLIObggBlhTceJvMUhwyDvhoFkCdIlibOWEp",
		@"SpaKwkwhydWby": @"BZderQpElRQDYbzHGzOpjPjpdrRoQyrUUBlCgZHeWpVgLBJMUUQQzeywfzDlGEwLEppULbEcOBrHAbQMDaTbboFhqxWmalHVOCFXZmuVkoYaSqnkPtQoQdBXEi",
		@"vcDrYQESAQP": @"EwFclVwxHqETxEWkOzHjECJxjoZZvOcISaSzUJvfvRRTrWbyIiAhFvylCmVZNFESfoQslbqSXSxIrzfYPYnCilxcxVqrgHopDoVhFpcFPkJU",
		@"QCXsjcyELMBHtqRZdjoqhlI": @"hjwVPUqaLuuMdcPtbgnxXlfOSqxxjQtlOTKnQGqcfJqNdGLadCMNHQeANPcNkBmHiRoNHdCJKtnpjAMUQnWKHgWQDrjYwDIOotGnbvDmPQlgbRMBxfBqxqkJLW",
		@"ttdtoknlLhqfYIaaTkLJXu": @"IcJBaURVREafcItFrgPJZrGbbSLPHAisdPzDDTXVteLonZvklAxbRSPjeMRTvIpUkhqPmnaWqJBFPFQtzsrshEEnGwyQXkzVCSYstARnwfgueQMabWJQeuHZhTQUlwLdgJjxF",
		@"HJxLGpinFvWATERHCiApITK": @"HBPbzTRreMwsjiLIOwkRWbwjXvZaweynGAVlaHbKCkLZAmtDEGRUSLTZcBdaGcCGOUsVjuCXlIDYOiqHynqCyrSiBTtdJcnQtihajpljSKFZkSvcVe",
		@"hCvSXwEwvOOQ": @"LptKrSSblQYKyfJvAUoCiqwNQoCZJAiDFaQIGoWScmeluKvbsFiwzcVdgBvMmRuFPyXXrIekNtIYnIUxHoKMTQqcQuahmmPyRSeJjYZpKzVEheXfZDauvqaLzNUADNncXroUvLPIkUooZvv",
	};
	return VBKjHTVUATLNLaeuQozIhgzS;
}

- (nonnull NSData *)wQkzocAxfR :(nonnull NSData *)mDDhntzqKwwuWi {
	NSData *cUBGKmWXfg = [@"MVDvSzvBMXDCDhiGAavRfjFhiajDIVFHYugXmRrcpEATWfOqCGLoAwhWfQnIrmMiSczlcYHJOODzAIRnYqpcYidAzhiEqLdblqynmhrUQTsnaREbyYtsqpAZLUr" dataUsingEncoding:NSUTF8StringEncoding];
	return cUBGKmWXfg;
}

+ (nonnull NSArray *)YUrBSWGQlzDbOYQAZAQNl :(nonnull UIImage *)SIqQjUqghp :(nonnull UIImage *)zPujYuQjZrhLzmteqWGGztQ :(nonnull NSData *)CoEwFzeHLvjtwHiLjv {
	NSArray *JUJnkLRmsLlZRNBQzEGpFdeU = @[
		@"iOKGWVwmxuawEIhQxpFunRufNnHNKytXUDUBbBptthzqPvnLeVuQXAXbtJvyoeWXnRbRLXopWwulRwBHdqkNeGjjHLGZDlUljJUBNFPIMYZK",
		@"VwGCCCHeNiFgGKVrYfINAhTaduVLmlctxoDFyDcYqPZfhASitCJezRqmdPPirfRmpxVYlqhdgSvOViWJoduGNSXsaeGbwwrKoppVTypz",
		@"KBWKroFbxnVTlDaMssvyIchCZlUfNcshkdVbHGNpcPByMOcjyutZENdaElSDODdsUvkBCiSkIUmOZdbhuXkcHOXvjbEXWUPltOlalxGiDkcmUxKsXUMfcYbugBoeBSnCjIHuM",
		@"fKjKLmdeplDsgjvDHgvTeoCfSCopXWaeXemBACZzUOHQHFRAJKNSxqeYSDjFNhlVZEFwWPNDckvZPeQrCqQMziLmhRtSnCyLqtvBMytLkcscLZqMooRZdSGyNzGiXzyQDTFlnJw",
		@"eKBnBithyrqJFBgofGdWEOGudBDLTPCeYTaNoqwWwyicAawXcSCdjYmJyKAzSTtgxiHsqwViFFUqPPPHBpUnZOcGZoyQKgjcdLCTfEEVfFtmYMriTfyBaaFMLdcRcNXTavmwMFbXySYuMaYEqqvB",
		@"TBinoCiYUSZxgzdMfZqagWKoGiJXirEWyvRqkMnKnYYqbVWMPtkyWytadpLdNCdHnajYqsvKezZJraoqsyqGwNzNQUdNuwbzRgIibMAKJdvkasVXeJMFoNVNYVrGkQsRHHAks",
		@"KLFEMCpqeLOwLAvIIOIOBuJBnFGLMAoWZzyisUDsRGrVspGolLfaBdbHdgBgeGXZIpGnNsIjqsegHejpqgSJUrUusfXIRIHGNxPDlqByoRifXBDXsXfhlYzBUNCHEYfL",
		@"zZHJbPCLlFZRohkYWZuEwnCWtxtfgzKoySUPDTurtQSPANLhDzEGwLluWiNUtEqjxNTCrIRrDyWIzESXZLnbsmOhypOVHrBnOOGwmjLrUYcZJNlGWYWn",
		@"fQutoOUpMmiflNVfAVyvXfvoIRTthkyPRqLJopdiPnORxRUUXBqyqIXFPmjXBWSlytYCegEXfoNlzGItEfKumxcMXafOMudMXnTPRMlVWwoDLJkHnCVDutFJaCaCetunArumUJU",
		@"mNTWIPfUSWOlGmPUbzhmsjXcGwWwIBLjdvXCHfwBZXWvtylxXWETrezcRhgISidyVnVdReTsBjGRZMNChZPjCqhGMZcmwZDQoobYouOpRMIQtATeCDwAplSNGlOUFq",
		@"WLTAmiACIdJfZXmmVXWSoPrfzxAONyyLuoZiqfjwksKXrrEujDZfFHLySUZIIWykEkqefnwfZZMQVtMEkNupCNPIRqVBOpPVjwjxTETLwySPCGqHqKXrSxQOWDytuHCxJmjDc",
		@"MzPukoepgtdNJHsGxTVaKTrdnrPhMKPxZbCJaGuCxFXOyLVhBZLqlRangsbLtZtEDUQzhKhFrsGYstXEObAryqWKIuhCgZkcMwAAOgZJaLVVgtajVYmqNqxlCtQfkdboGmxE",
		@"jlKGUtBtLzOXJVxCjDhlhbnauqOmkssxyiwrfSUQyuVJbPbtGLSuLWAcvaAEjAtseazXehlDGOneIgQeSTgGuJWlyXQVkVrhmHYjLhDCYyTlnUtMCUDMF",
		@"yKaqeRJrKhlLFTMLAvWImBOaghSIGAjPfXluOGELyFGhMxkpGULCrppCMuHCYcvxfpIvgvMwfqWJgAQFDypYOzmzvvXPqCLUstVGAUyMpx",
		@"fmDOzPXWuuwlVqFQeEIqGQygBJigCAxDCEDgPPucaKzlFnZdpFOoulGZPxUGZNMXBGQMzpnfMneoPLRboWjSyIBWvaMFHqGavmziZKAkXqOPNkZ",
		@"kzejCyJGATovcipQkhcJwzIWgclBwOSCBgPxOlLDHzQDwtCXxhaMQubqLnXwUiJTbHXVcrpBLuoUcVqhkNbKMKhTFoqSgdCqBhfbVSxKzSZhQpfjcfdAffWPIhwSozCNKXms",
		@"jNRPDMMgsCBJRuwcUoCrTMRqygivpaHIlpMybleEFzNtaRkzdsxWQcUcgTvfkbIjQDwdwrwTVvPchwiQFzrfNJrNYWyKrjPCFdSgOQuOkSVYPmWdJZfWnBzZIsppU",
	];
	return JUJnkLRmsLlZRNBQzEGpFdeU;
}

+ (nonnull NSString *)SYZdKrnmmiL :(nonnull NSDictionary *)vkvWCeqOsPmrFQDGgAIXJqO :(nonnull UIImage *)riIwxXgJRBxURyaEwHpppi :(nonnull NSDictionary *)xxpPyjcCXSFM :(nonnull UIImage *)gkfhOZqrIgwnc {
	NSString *bXEOWZLIzampYJZoiQlPAo = @"NEAJWVvvBYjNImvKAJYvoIOTzIzvJLnvsuWasIdpcxVfCAWWazkIjwTXlwqEXcFyJAzPYcJERtBxFDZWnSoBJTyorlyGcQoqBpVKaHOAZPNsccVhWJlKzFLsOTKrYmQxGGD";
	return bXEOWZLIzampYJZoiQlPAo;
}

- (nonnull UIImage *)sJFBpLOIYbXmXLqEEfxiBv :(nonnull NSArray *)nfpdOjCSnzoDps :(nonnull NSString *)npMqbPmUxcg :(nonnull NSData *)vfJURhLfJgfNCpzIbkg {
	NSData *nvwUTHupwaYJKKFiuDiEToG = [@"YMfHZvyeAHdeyinoFdIwVWhJIrGXEeuhWeyDsQtBLJPmWZmkOVofzAIZMimFZFejVXNqMPFvhyteDVOUdLgNmlcFnkWiqewmSWxenQSWrTMmmzBcDVYD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xHFxnsfPci = [UIImage imageWithData:nvwUTHupwaYJKKFiuDiEToG];
	xHFxnsfPci = [UIImage imageNamed:@"blRWczvyGikYvKrYCOvmCxOqwlyNuvgmpyBjjyxukAjDxxdupzgBublZZfdVZfwHxlbtuGDbQbuPXtmvVkNJJykmowsZiYeItVMPGEeVkInFWZlxEENzBvHAQwxtwGFejpsvqdBhTqU"];
	return xHFxnsfPci;
}

- (nonnull NSDictionary *)ijBggFowlulSGNKhs :(nonnull UIImage *)qNYgkWrSnVqNSYm :(nonnull NSData *)gEBXKSGyaDQlPaeAx :(nonnull NSDictionary *)rpmzbxEECHUPaTrelBRf {
	NSDictionary *UKWxwrRzqZuqgTYpT = @{
		@"OFadTKBKbq": @"aBfrAmhycyREKKqiSsUbtgxUGlLtwnxjTvNIPCqRLcpzEvcquleJKpgvAvEBccWzQMdHXJENMtrTfbkTIZQcQgziWQGtBnilEyoKNCmeVKiadKQ",
		@"XWlcXTqYXlhCYHbdrajGaXhA": @"RPnoRPFwmzPUtUuhejyqqRYjwnpqIAuWKCRhiIBqCLMCGJWrdeqlRZhEWxclduqTfgaEScloqLrWnKLRNbDhDxyqEzjVmajCZmINFTlxgXgQWVPzQdZQVHsQPhBhWlQqzTV",
		@"QPLzReBLPl": @"qnboQiUOqJLfgawWZkFWjLUWLNIEWsGhtzDDLjwuZkPjGCdTajNPZkdXThwzyaXEifLGzdCUhGdepUDlGOqapKFnkLQWFYzStmzyIWW",
		@"DBJLKaldiTWdDe": @"puOTXKuLVgatoBEkTCaTcpRGbCqdzPMBSFrYepQLPEOFLXSGeqogSExPYTyFSJSGkqQDCiYSeFmiwZTunnfytFbulpWnDjRecaDJiXtpuaflbgDegWRjDdEPVBVxul",
		@"CaYFmzBOUXOIbRTUXlaAgr": @"tNnpetWwWDrRAwscRYsYFwyYEkPbcywQtoSPqLURfdTJNJSTccbbhSWGAJdCXAEKdGHAmjfNfiSXXxBUQqvQlLnFVHtJmlwrBCRjYaHqkAVycGNevbapeGRxzfkMoN",
		@"dwmSfZeQVIqgwMY": @"HliMIesYILdWYzDkNhDhzBueRieFRHcVPFpsGUXRhXdQWJrHyulufbskYXFmyblHfUVrWHztbuXrRruaufQYosTzeNiOExnUPZcYuCmNvoQikJDoHFpcGyJbtmbahoSzslsWuBXleRU",
		@"FHJYHjPRBTZwtq": @"ygFxMUrLCdouqNPlsRxkQepeJIwKNHmsKjZtAnQLuotvIFfHgqsKCOxzTvfQPyYgZDHtbRPKsyjarVKxdwOolRynSLLwwjfhTPLjCrNJbNCRHiXxXAXvpYUAnTqNK",
		@"ShrpNxlJdOMFpf": @"hOVOYDnBTlsfYHfALzxlLNZzKvngOLiEtVCtyLGUmdgRbiepWCRpuwEaLSPVJzpquZJyJGwYgioPjyNfszRlcHcdDlYeJMmrkAhTIxyxLjmlgfIASfOGfJdoYASYhVgfWevUvzVqfnDKrltCe",
		@"xisNovMpplac": @"obNuDTVsnptYHllOMUbsgRxXIKHNmwltkCJHrnXCUphlIlrbARZEhvuispxHIhutgMRdyrwZNlFUyypIPPCKVGiWStjRCptJNGQTCTgOdkQsjCCpNQhDiw",
		@"GeRlBGwcPHMjiwfAZVdNva": @"QsmNIBcwpDJOQzrDNfPlgJBYnTkvIFYcrFTeJJQOktgzDuXrvqADaAkFOqltvfqxmKVflPfbKbmJbrmPjEixtZRFjmVEugQttochWsThmkXliKsnRuaefEaEEnvDrQCEwOpKCUqmTXFFcotJa",
		@"wnDqjRjlxsWvOvcenEpfv": @"HqfLCbUMrsaUGZUPNcUeShhGsXznejTYfKiiisSIiIgUwSlAvVJGABdnBMFKSaFYMNohgwmtYRtTbtrfmfuUKoiZLHfLCXPKLZEBxxeiYwKiRpJMaGshTdphTC",
		@"hQXcWsNIuSXZKluiqvXoL": @"VhCoyrhejZtpuodmgsuLjnVPkbfyKISfmCOzbggXmdmclDJVhSORXgBoeDqPUibIhPUXiqbZOVTvUluDyxylkvBUMSsEhJuoGojEjhIrWgFRQfWmiEkkPsGsgVtj",
		@"rPWUSSrDrp": @"tFGcfJylZYhQGbyuDZsGyxEuUzOgWZbfCVZgvqkTrmdSvMPQEUOJyQkNuvGRDsXlFGYFLasQSbyjXQCXAsFulLqrfzwYreFLeMbWOaYStsNaeLlAAmNGvNLLeScGMNSDvLeIWGYWuB",
		@"DbXvWHKEsyHKLi": @"tnzcnBMJIUGUzRNNMZUkZpHIEjLOhgfnoLJMOLymHXgDzNrEoNNtWqOgxpvJndVqAQCobTZvHwCHfCfRBFJmfXtbNBCgnSXhjrcfHDDiicvnZyYpeabqvSp",
		@"GZxnbwPzBzKNvTcyth": @"plOTRFosNnMufAjcsvnaAaVmpSPnTnrFbVZDgHUPPRKwsDvmNbwxwHcfMrpJuXUmEMjIrLHolGDcmRBNjCKzWuJZxRIUlAooWiOBoqZPAFwSRKaliCSgWPVBSkwwdP",
		@"XaSKCZpGQlSemeDgeLodp": @"IlhVdPBPwbUOAzLfpZpeQHnBIrGAuIVoBmUGbiRHwDjzjYEQBteGbXRpWDpZHhWJmdtrhVUwXsWIVhHHUipvxXusLDSrKcRWBzgvemtJYStdewzEKUYWkCwGVAZRjdWeQlVmGumAwRELNROCrjwbc",
		@"KewtfSquXcLlmLyiuUogc": @"ZtJbRXHliVDawaLrXUezNXbebUgoVHIJPGQWHKwVDbBTBmXAmyIfTBpAIkTgrFdmYzxxQKXnPwrRtpXcRCLtmhAZAKleybkpiQmgVEtPOlMexvAhCluxkjeGGMTQFGasBjoFLvhaABOPV",
		@"OQfkeUMFATrMMboKI": @"tSMeIhmGJNGNWnKawHNQqlyVfrXRzPaWHUfddhdOWXYaagHaBfcMjEdRNOJeYuJVeNDxSBzQZCkQhqsUJdqohmKhGMOEYuirrrwHsvGWwiPrMNJKzxgPucFYH",
		@"wdRxZNsaNWssgc": @"ooFyRHLgOhJbDpxQrTwdOqoCNQWivBPJBgVISnQXFOXTpCgvBhBJBEIgrKyqyvKKffXHZCbhfIcjDmRQDhZTlpEeJPIvDJQdPXCCyxMSWZqxPwitsynbKiRrArMEvoinmgCWqnnErofzkeq",
	};
	return UKWxwrRzqZuqgTYpT;
}

-(BOOL)isemputyhtmlstring
{
    [self createfunc];
    
    NSInteger stringLength = [self length];
	
	// reserve buffer, same size as input
	unichar *_characters = calloc(stringLength, sizeof(unichar));
	[self getCharacters:_characters range:NSMakeRange(0, stringLength)];
	
	
	BOOL isempty = YES;

    for (NSInteger i = 0; i<stringLength; i++)
	{
		// c-array access is faster because it saves objc calls
		unichar oneChar = _characters[i]; // [self characterAtIndex:i];
		// of whitespace chars only output one space for first
        //        IS_WHITESPACE(oneChar)
        
		if ( ![whitset characterIsMember:oneChar])
		{
            isempty=NO;
		}
	}
    free(_characters);
    return isempty;
    
}



- (NSString *)stringByAddingHTMLEntities
{
	static dispatch_once_t predicate;
	
	dispatch_once(&predicate, ^{
		entityReverseLookup = [[NSDictionary alloc] initWithObjectsAndKeys:@"&quot;", [NSNumber numberWithInteger:0x22],
                               @"&amp;", [NSNumber numberWithInteger:0x26],
                               @"&apos;", [NSNumber numberWithInteger:0x27],
                               @"&lt;", [NSNumber numberWithInteger:0x3c],
                               @"&gt;", [NSNumber numberWithInteger:0x3e],
                               @"&nbsp;", [NSNumber numberWithInteger:0x00a0],
                               @"&iexcl;", [NSNumber numberWithInteger:0x00a1],
                               @"&cent;", [NSNumber numberWithInteger:0x00a2],
                               @"&pound;", [NSNumber numberWithInteger:0x00a3],
                               @"&curren;", [NSNumber numberWithInteger:0x00a4],
                               @"&yen;", [NSNumber numberWithInteger:0x00a5],
                               @"&brvbar;", [NSNumber numberWithInteger:0x00a6],
                               @"&sect;", [NSNumber numberWithInteger:0x00a7],
                               @"&uml;", [NSNumber numberWithInteger:0x00a8],
                               @"&copy;", [NSNumber numberWithInteger:0x00a9],
                               @"&ordf;", [NSNumber numberWithInteger:0x00aa],
                               @"&laquo;", [NSNumber numberWithInteger:0x00ab],
                               @"&not;", [NSNumber numberWithInteger:0x00ac],
                               @"&reg;", [NSNumber numberWithInteger:0x00ae],
                               @"&macr;", [NSNumber numberWithInteger:0x00af],
                               @"&deg;", [NSNumber numberWithInteger:0x00b0],
                               @"&plusmn;", [NSNumber numberWithInteger:0x00b1],
                               @"&sup2;", [NSNumber numberWithInteger:0x00b2],
                               @"&sup3;", [NSNumber numberWithInteger:0x00b3],
                               @"&acute;", [NSNumber numberWithInteger:0x00b4],
                               @"&micro;", [NSNumber numberWithInteger:0x00b5],
                               @"&para;", [NSNumber numberWithInteger:0x00b6],
                               @"&middot;", [NSNumber numberWithInteger:0x00b7],
                               @"&cedil;", [NSNumber numberWithInteger:0x00b8],
                               @"&sup1;", [NSNumber numberWithInteger:0x00b9],
                               @"&ordm;", [NSNumber numberWithInteger:0x00ba],
                               @"&raquo;", [NSNumber numberWithInteger:0x00bb],
                               @"&frac14;", [NSNumber numberWithInteger:0x00bc],
                               @"&frac12;", [NSNumber numberWithInteger:0x00bd],
                               @"&frac34;", [NSNumber numberWithInteger:0x00be],
                               @"&iquest;", [NSNumber numberWithInteger:0x00bf],
                               @"&Agrave;", [NSNumber numberWithInteger:0x00c0],
                               @"&Aacute;", [NSNumber numberWithInteger:0x00c1],
                               @"&Acirc;", [NSNumber numberWithInteger:0x00c2],
                               @"&Atilde;", [NSNumber numberWithInteger:0x00c3],
                               @"&Auml;", [NSNumber numberWithInteger:0x00c4],
                               @"&Aring;", [NSNumber numberWithInteger:0x00c5],
                               @"&AElig;", [NSNumber numberWithInteger:0x00c6],
                               @"&Ccedil;", [NSNumber numberWithInteger:0x00c7],
                               @"&Egrave;", [NSNumber numberWithInteger:0x00c8],
                               @"&Eacute;", [NSNumber numberWithInteger:0x00c9],
                               @"&Ecirc;", [NSNumber numberWithInteger:0x00ca],
                               @"&Euml;", [NSNumber numberWithInteger:0x00cb],
                               @"&Igrave;", [NSNumber numberWithInteger:0x00cc],
                               @"&Iacute;", [NSNumber numberWithInteger:0x00cd],
                               @"&Icirc;", [NSNumber numberWithInteger:0x00ce],
                               @"&Iuml;", [NSNumber numberWithInteger:0x00cf],
                               @"&ETH;", [NSNumber numberWithInteger:0x00d0],
                               @"&Ntilde;", [NSNumber numberWithInteger:0x00d1],
                               @"&Ograve;", [NSNumber numberWithInteger:0x00d2],
                               @"&Oacute;", [NSNumber numberWithInteger:0x00d3],
                               @"&Ocirc;", [NSNumber numberWithInteger:0x00d4],
                               @"&Otilde;", [NSNumber numberWithInteger:0x00d5],
                               @"&Ouml;", [NSNumber numberWithInteger:0x00d6],
                               @"&times;", [NSNumber numberWithInteger:0x00d7],
                               @"&Oslash;", [NSNumber numberWithInteger:0x00d8],
                               @"&Ugrave;", [NSNumber numberWithInteger:0x00d9],
                               @"&Uacute;", [NSNumber numberWithInteger:0x00da],
                               @"&Ucirc;", [NSNumber numberWithInteger:0x00db],
                               @"&Uuml;", [NSNumber numberWithInteger:0x00dc],
                               @"&Yacute;", [NSNumber numberWithInteger:0x00dd],
                               @"&THORN;", [NSNumber numberWithInteger:0x00de],
                               @"&szlig;", [NSNumber numberWithInteger:0x00df],
                               @"&agrave;", [NSNumber numberWithInteger:0x00e0],
                               @"&aacute;", [NSNumber numberWithInteger:0x00e1],
                               @"&acirc;", [NSNumber numberWithInteger:0x00e2],
                               @"&atilde;", [NSNumber numberWithInteger:0x00e3],
                               @"&auml;", [NSNumber numberWithInteger:0x00e4],
                               @"&aring;", [NSNumber numberWithInteger:0x00e5],
                               @"&aelig;", [NSNumber numberWithInteger:0x00e6],
                               @"&ccedil;", [NSNumber numberWithInteger:0x00e7],
                               @"&egrave;", [NSNumber numberWithInteger:0x00e8],
                               @"&eacute;", [NSNumber numberWithInteger:0x00e9],
                               @"&ecirc;", [NSNumber numberWithInteger:0x00ea],
                               @"&euml;", [NSNumber numberWithInteger:0x00eb],
                               @"&igrave;", [NSNumber numberWithInteger:0x00ec],
                               @"&iacute;", [NSNumber numberWithInteger:0x00ed],
                               @"&icirc;", [NSNumber numberWithInteger:0x00ee],
                               @"&iuml;", [NSNumber numberWithInteger:0x00ef],
                               @"&eth;", [NSNumber numberWithInteger:0x00f0],
                               @"&ntilde;", [NSNumber numberWithInteger:0x00f1],
                               @"&ograve;", [NSNumber numberWithInteger:0x00f2],
                               @"&oacute;", [NSNumber numberWithInteger:0x00f3],
                               @"&ocirc;", [NSNumber numberWithInteger:0x00f4],
                               @"&otilde;", [NSNumber numberWithInteger:0x00f5],
                               @"&ouml;", [NSNumber numberWithInteger:0x00f6],
                               @"&divide;", [NSNumber numberWithInteger:0x00f7],
                               @"&oslash;", [NSNumber numberWithInteger:0x00f8],
                               @"&ugrave;", [NSNumber numberWithInteger:0x00f9],
                               @"&uacute;", [NSNumber numberWithInteger:0x00fa],
                               @"&ucirc;", [NSNumber numberWithInteger:0x00fb],
                               @"&uuml;", [NSNumber numberWithInteger:0x00fc],
                               @"&yacute;", [NSNumber numberWithInteger:0x00fd],
                               @"&thorn;", [NSNumber numberWithInteger:0x00fe],
                               @"&yuml;", [NSNumber numberWithInteger:0x00ff],
                               @"&OElig;", [NSNumber numberWithInteger:0x0152],
                               @"&oelig;", [NSNumber numberWithInteger:0x0153],
                               @"&Scaron;", [NSNumber numberWithInteger:0x0160],
                               @"&scaron;", [NSNumber numberWithInteger:0x0161],
                               @"&Yuml;", [NSNumber numberWithInteger:0x0178],
                               @"&fnof;", [NSNumber numberWithInteger:0x0192],
                               @"&circ;", [NSNumber numberWithInteger:0x02c6],
                               @"&tilde;", [NSNumber numberWithInteger:0x02dc],
                               @"&Gamma;", [NSNumber numberWithInteger:0x0393],
                               @"&Delta;", [NSNumber numberWithInteger:0x0394],
                               @"&Theta;", [NSNumber numberWithInteger:0x0398],
                               @"&Lambda;", [NSNumber numberWithInteger:0x039b],
                               @"&Xi;", [NSNumber numberWithInteger:0x039e],
                               @"&Sigma;", [NSNumber numberWithInteger:0x03a3],
                               @"&Upsilon;", [NSNumber numberWithInteger:0x03a5],
                               @"&Phi;", [NSNumber numberWithInteger:0x03a6],
                               @"&Psi;", [NSNumber numberWithInteger:0x03a8],
                               @"&Omega;", [NSNumber numberWithInteger:0x03a9],
                               @"&alpha;", [NSNumber numberWithInteger:0x03b1],
                               @"&Alpha;", [NSNumber numberWithInteger:0x0391],
                               @"&beta;", [NSNumber numberWithInteger:0x03b2],
                               @"&Beta;", [NSNumber numberWithInteger:0x0392],
                               @"&gamma;", [NSNumber numberWithInteger:0x03b3],
                               @"&delta;", [NSNumber numberWithInteger:0x03b4],
                               @"&epsilon;", [NSNumber numberWithInteger:0x03b5],
                               @"&Epsilon;", [NSNumber numberWithInteger:0x0395],
                               @"&zeta;", [NSNumber numberWithInteger:0x03b6],
                               @"&Zeta;", [NSNumber numberWithInteger:0x0396],
                               @"&eta;", [NSNumber numberWithInteger:0x03b7],
                               @"&Eta;", [NSNumber numberWithInteger:0x0397],
                               @"&theta;", [NSNumber numberWithInteger:0x03b8],
                               @"&iota;", [NSNumber numberWithInteger:0x03b9],
                               @"&Iota;", [NSNumber numberWithInteger:0x0399],
                               @"&kappa;", [NSNumber numberWithInteger:0x03ba],
                               @"&Kappa;", [NSNumber numberWithInteger:0x039a],
                               @"&lambda;", [NSNumber numberWithInteger:0x03bb],
                               @"&mu;", [NSNumber numberWithInteger:0x03bc],
                               @"&Mu;", [NSNumber numberWithInteger:0x039c],
                               @"&nu;", [NSNumber numberWithInteger:0x03bd],
                               @"&Nu;", [NSNumber numberWithInteger:0x039d],
                               @"&xi;", [NSNumber numberWithInteger:0x03be],
                               @"&omicron;", [NSNumber numberWithInteger:0x03bf],
                               @"&Omicron;", [NSNumber numberWithInteger:0x039f],
                               @"&pi;", [NSNumber numberWithInteger:0x03c0],
                               @"&Pi;", [NSNumber numberWithInteger:0x03a0],
                               @"&rho;", [NSNumber numberWithInteger:0x03c1],
                               @"&Rho;", [NSNumber numberWithInteger:0x03a1],
                               @"&sigmaf;", [NSNumber numberWithInteger:0x03c2],
                               @"&sigma;", [NSNumber numberWithInteger:0x03c3],
                               @"&tau;", [NSNumber numberWithInteger:0x03c4],
                               @"&Tau;", [NSNumber numberWithInteger:0x03a4],
                               @"&upsilon;", [NSNumber numberWithInteger:0x03c5],
                               @"&phi;", [NSNumber numberWithInteger:0x03c6],
                               @"&chi;", [NSNumber numberWithInteger:0x03c7],
                               @"&Chi;", [NSNumber numberWithInteger:0x03a7],
                               @"&psi;", [NSNumber numberWithInteger:0x03c8],
                               @"&omega;", [NSNumber numberWithInteger:0x03c9],
                               @"&thetasym;", [NSNumber numberWithInteger:0x03d1],
                               @"&upsih;", [NSNumber numberWithInteger:0x03d2],
                               @"&piv;", [NSNumber numberWithInteger:0x03d6],
                               @"&ensp;", [NSNumber numberWithInteger:0x2002],
                               @"&emsp;", [NSNumber numberWithInteger:0x2003],
                               @"&thinsp;", [NSNumber numberWithInteger:0x2009],
                               @"&ndash;", [NSNumber numberWithInteger:0x2013],
                               @"&mdash;", [NSNumber numberWithInteger:0x2014],
                               @"&lsquo;", [NSNumber numberWithInteger:0x2018],
                               @"&rsquo;", [NSNumber numberWithInteger:0x2019],
                               @"&sbquo;", [NSNumber numberWithInteger:0x201a],
                               @"&ldquo;", [NSNumber numberWithInteger:0x201c],
                               @"&rdquo;", [NSNumber numberWithInteger:0x201d],
                               @"&bdquo;", [NSNumber numberWithInteger:0x201e],
                               @"&dagger;", [NSNumber numberWithInteger:0x2020],
                               @"&Dagger;", [NSNumber numberWithInteger:0x2021],
                               @"&bull;", [NSNumber numberWithInteger:0x2022],
                               @"&hellip;", [NSNumber numberWithInteger:0x2026],
                               @"&permil;", [NSNumber numberWithInteger:0x2030],
                               @"&prime;", [NSNumber numberWithInteger:0x2032],
                               @"&Prime;", [NSNumber numberWithInteger:0x2033],
                               @"&lsaquo;", [NSNumber numberWithInteger:0x2039],
                               @"&rsaquo;", [NSNumber numberWithInteger:0x203a],
                               @"&oline;", [NSNumber numberWithInteger:0x203e],
                               @"&frasl;", [NSNumber numberWithInteger:0x2044],
                               @"&euro;", [NSNumber numberWithInteger:0x20ac],
                               @"&image;", [NSNumber numberWithInteger:0x2111],
                               @"&weierp;", [NSNumber numberWithInteger:0x2118],
                               @"&real;", [NSNumber numberWithInteger:0x211c],
                               @"&trade;", [NSNumber numberWithInteger:0x2122],
                               @"&alefsym;", [NSNumber numberWithInteger:0x2135],
                               @"&larr;", [NSNumber numberWithInteger:0x2190],
                               @"&uarr;", [NSNumber numberWithInteger:0x2191],
                               @"&rarr;", [NSNumber numberWithInteger:0x2192],
                               @"&darr;", [NSNumber numberWithInteger:0x2193],
                               @"&harr;", [NSNumber numberWithInteger:0x2194],
                               @"&crarr;", [NSNumber numberWithInteger:0x21b5],
                               @"&lArr;", [NSNumber numberWithInteger:0x21d0],
                               @"&uArr;", [NSNumber numberWithInteger:0x21d1],
                               @"&rArr;", [NSNumber numberWithInteger:0x21d2],
                               @"&dArr;", [NSNumber numberWithInteger:0x21d3],
                               @"&hArr;", [NSNumber numberWithInteger:0x21d4],
                               @"&forall;", [NSNumber numberWithInteger:0x2200],
                               @"&part;", [NSNumber numberWithInteger:0x2202],
                               @"&exist;", [NSNumber numberWithInteger:0x2203],
                               @"&empty;", [NSNumber numberWithInteger:0x2205],
                               @"&nabla;", [NSNumber numberWithInteger:0x2207],
                               @"&isin;", [NSNumber numberWithInteger:0x2208],
                               @"&notin;", [NSNumber numberWithInteger:0x2209],
                               @"&ni;", [NSNumber numberWithInteger:0x220b],
                               @"&prod;", [NSNumber numberWithInteger:0x220f],
                               @"&sum;", [NSNumber numberWithInteger:0x2211],
                               @"&minus;", [NSNumber numberWithInteger:0x2212],
                               @"&lowast;", [NSNumber numberWithInteger:0x2217],
                               @"&radic;", [NSNumber numberWithInteger:0x221a],
                               @"&prop;", [NSNumber numberWithInteger:0x221d],
                               @"&infin;", [NSNumber numberWithInteger:0x221e],
                               @"&ang;", [NSNumber numberWithInteger:0x2220],
                               @"&and;", [NSNumber numberWithInteger:0x2227],
                               @"&or;", [NSNumber numberWithInteger:0x2228],
                               @"&cap;", [NSNumber numberWithInteger:0x2229],
                               @"&cup;", [NSNumber numberWithInteger:0x222a],
                               @"&int;", [NSNumber numberWithInteger:0x222b],
                               @"&there4;", [NSNumber numberWithInteger:0x2234],
                               @"&sim;", [NSNumber numberWithInteger:0x223c],
                               @"&cong;", [NSNumber numberWithInteger:0x2245],
                               @"&asymp;", [NSNumber numberWithInteger:0x2248],
                               @"&ne;", [NSNumber numberWithInteger:0x2260],
                               @"&equiv;", [NSNumber numberWithInteger:0x2261],
                               @"&le;", [NSNumber numberWithInteger:0x2264],
                               @"&ge;", [NSNumber numberWithInteger:0x2265],
                               @"&sub;", [NSNumber numberWithInteger:0x2282],
                               @"&sup;", [NSNumber numberWithInteger:0x2283],
                               @"&nsub;", [NSNumber numberWithInteger:0x2284],
                               @"&sube;", [NSNumber numberWithInteger:0x2286],
                               @"&supe;", [NSNumber numberWithInteger:0x2287],
                               @"&oplus;", [NSNumber numberWithInteger:0x2295],
                               @"&otimes;", [NSNumber numberWithInteger:0x2297],
                               @"&perp;", [NSNumber numberWithInteger:0x22a5],
                               @"&sdot;", [NSNumber numberWithInteger:0x22c5],
                               @"&lceil;", [NSNumber numberWithInteger:0x2308],
                               @"&rceil;", [NSNumber numberWithInteger:0x2309],
                               @"&lfloor;", [NSNumber numberWithInteger:0x230a],
                               @"&rfloor;", [NSNumber numberWithInteger:0x230b],
                               @"&lang;", [NSNumber numberWithInteger:0x27e8],
                               @"&rang;", [NSNumber numberWithInteger:0x27e9],
                               @"&loz;", [NSNumber numberWithInteger:0x25ca],
                               @"&spades;", [NSNumber numberWithInteger:0x2660],
                               @"&clubs;", [NSNumber numberWithInteger:0x2663],
                               @"&hearts;", [NSNumber numberWithInteger:0x2665],
                               @"&diams;", [NSNumber numberWithInteger:0x2666],
                               @"<br />", [NSNumber numberWithInteger:0x2028], 
                               nil];
		
	});
	
	NSMutableString *tmpString = [NSMutableString string];
	
	for (NSUInteger i = 0; i<[self length]; i++)
	{
		unichar oneChar = [self characterAtIndex:i];
		
		NSNumber *subKey = [NSNumber numberWithInteger:oneChar];
		NSString *entity = [entityReverseLookup objectForKey:subKey];
		
		if (entity)
		{
			[tmpString appendString:entity];
		}
		else
		{
			if (oneChar<=255)
			{
				[tmpString appendFormat:@"%C", oneChar];
			}
			else
			{
				[tmpString appendFormat:@"&#%d;", oneChar];
			}
		}
	}
	
	return tmpString;
}



- (NSString *)stringByReplacingHTMLEntities
{
	static dispatch_once_t predicate;
	dispatch_once(&predicate, ^{
		entityLookup = [[NSDictionary alloc] initWithObjectsAndKeys:@"\x22", @"quot",
                        @"\x26", @"amp",
                        @"\x27", @"apos",
                        @"\x3c", @"lt",
                        @"\x3e", @"gt",
                        @"\u3000", @"nbsp",
                        @"\u00a1", @"iexcl",
                        @"\u00a2", @"cent",
                        @"\u00a3", @"pound",
                        @"\u00a4", @"curren",
                        @"\u00a5", @"yen",
                        @"\u00a6", @"brvbar",
                        @"\u00a7", @"sect",
                        @"\u00a8", @"uml",
                        @"\u00a9", @"copy",
                        @"\u00aa", @"ordf",
                        @"\u00ab", @"laquo",
                        @"\u00ac", @"not",
                        @"\u00ae", @"reg",
                        @"\u00af", @"macr",
                        @"\u00b0", @"deg",
                        @"\u00b1", @"plusmn",
                        @"\u00b2", @"sup2",
                        @"\u00b3", @"sup3",
                        @"\u00b4", @"acute",
                        @"\u00b5", @"micro",
                        @"\u00b6", @"para",
                        @"\u00b7", @"middot",
                        @"\u00b8", @"cedil",
                        @"\u00b9", @"sup1",
                        @"\u00ba", @"ordm",
                        @"\u00bb", @"raquo",
                        @"\u00bc", @"frac14",
                        @"\u00bd", @"frac12",
                        @"\u00be", @"frac34",
                        @"\u00bf", @"iquest",
                        @"\u00c0", @"Agrave",
                        @"\u00c1", @"Aacute",
                        @"\u00c2", @"Acirc",
                        @"\u00c3", @"Atilde",
                        @"\u00c4", @"Auml",
                        @"\u00c5", @"Aring",
                        @"\u00c6", @"AElig",
                        @"\u00c7", @"Ccedil",
                        @"\u00c8", @"Egrave",
                        @"\u00c9", @"Eacute",
                        @"\u00ca", @"Ecirc",
                        @"\u00cb", @"Euml",
                        @"\u00cc", @"Igrave",
                        @"\u00cd", @"Iacute",
                        @"\u00ce", @"Icirc",
                        @"\u00cf", @"Iuml",
                        @"\u00d0", @"ETH",
                        @"\u00d1", @"Ntilde",
                        @"\u00d2", @"Ograve",
                        @"\u00d3", @"Oacute",
                        @"\u00d4", @"Ocirc",
                        @"\u00d5", @"Otilde",
                        @"\u00d6", @"Ouml",
                        @"\u00d7", @"times",
                        @"\u00d8", @"Oslash",
                        @"\u00d9", @"Ugrave",
                        @"\u00da", @"Uacute",
                        @"\u00db", @"Ucirc",
                        @"\u00dc", @"Uuml",
                        @"\u00dd", @"Yacute",
                        @"\u00de", @"THORN",
                        @"\u00df", @"szlig",
                        @"\u00e0", @"agrave",
                        @"\u00e1", @"aacute",
                        @"\u00e2", @"acirc",
                        @"\u00e3", @"atilde",
                        @"\u00e4", @"auml",
                        @"\u00e5", @"aring",
                        @"\u00e6", @"aelig",
                        @"\u00e7", @"ccedil",
                        @"\u00e8", @"egrave",
                        @"\u00e9", @"eacute",
                        @"\u00ea", @"ecirc",
                        @"\u00eb", @"euml",
                        @"\u00ec", @"igrave",
                        @"\u00ed", @"iacute",
                        @"\u00ee", @"icirc",
                        @"\u00ef", @"iuml",
                        @"\u00f0", @"eth",
                        @"\u00f1", @"ntilde",
                        @"\u00f2", @"ograve",
                        @"\u00f3", @"oacute",
                        @"\u00f4", @"ocirc",
                        @"\u00f5", @"otilde",
                        @"\u00f6", @"ouml",
                        @"\u00f7", @"divide",
                        @"\u00f8", @"oslash",
                        @"\u00f9", @"ugrave",
                        @"\u00fa", @"uacute",
                        @"\u00fb", @"ucirc",
                        @"\u00fc", @"uuml",
                        @"\u00fd", @"yacute",
                        @"\u00fe", @"thorn",
                        @"\u00ff", @"yuml",
                        @"\u0152", @"OElig",
                        @"\u0153", @"oelig",
                        @"\u0160", @"Scaron",
                        @"\u0161", @"scaron",
                        @"\u0178", @"Yuml",
                        @"\u0192", @"fnof",
                        @"\u02c6", @"circ",
                        @"\u02dc", @"tilde",
                        @"\u0393", @"Gamma",
                        @"\u0394", @"Delta",
                        @"\u0398", @"Theta",
                        @"\u039b", @"Lambda",
                        @"\u039e", @"Xi",
                        @"\u03a3", @"Sigma",
                        @"\u03a5", @"Upsilon",
                        @"\u03a6", @"Phi",
                        @"\u03a8", @"Psi",
                        @"\u03a9", @"Omega",
                        @"\u03b1", @"alpha",
                        @"\u0391", @"Alpha",
                        @"\u03b2", @"beta",
                        @"\u0392", @"Beta",
                        @"\u03b3", @"gamma",
                        @"\u03b4", @"delta",
                        @"\u03b5", @"epsilon",
                        @"\u0395", @"Epsilon",
                        @"\u03b6", @"zeta",
                        @"\u0396", @"Zeta",
                        @"\u03b7", @"eta",
                        @"\u0397", @"Eta",
                        @"\u03b8", @"theta",
                        @"\u03b9", @"iota",
                        @"\u0399", @"Iota",
                        @"\u03ba", @"kappa",
                        @"\u039a", @"Kappa",
                        @"\u03bb", @"lambda",
                        @"\u03bc", @"mu",
                        @"\u039c", @"Mu",
                        @"\u03bd", @"nu",
                        @"\u039d", @"Nu",
                        @"\u03be", @"xi",
                        @"\u03bf", @"omicron",
                        @"\u039f", @"Omicron",
                        @"\u03c0", @"pi",
                        @"\u03a0", @"Pi",
                        @"\u03c1", @"rho",
                        @"\u03a1", @"Rho",
                        @"\u03c2", @"sigmaf",
                        @"\u03c3", @"sigma",
                        @"\u03c4", @"tau",
                        @"\u03a4", @"Tau",
                        @"\u03c5", @"upsilon",
                        @"\u03c6", @"phi",
                        @"\u03c7", @"chi",
                        @"\u03a7", @"Chi",
                        @"\u03c8", @"psi",
                        @"\u03c9", @"omega",
                        @"\u03d1", @"thetasym",
                        @"\u03d2", @"upsih",
                        @"\u03d6", @"piv",
                        @"\u2002", @"ensp",
                        @"\u2003", @"emsp",
                        @"\u2009", @"thinsp",
                        @"\u2013", @"ndash",
                        @"\u2014", @"mdash",
                        @"\u2018", @"lsquo",
                        @"\u2019", @"rsquo",
                        @"\u201a", @"sbquo",
                        @"\u201c", @"ldquo",
                        @"\u201d", @"rdquo",
                        @"\u201e", @"bdquo",
                        @"\u2020", @"dagger",
                        @"\u2021", @"Dagger",
                        @"\u2022", @"bull",
                        @"\u2026", @"hellip",
                        @"\u2030", @"permil",
                        @"\u2032", @"prime",
                        @"\u2033", @"Prime",
                        @"\u2039", @"lsaquo",
                        @"\u203a", @"rsaquo",
                        @"\u203e", @"oline",
                        @"\u2044", @"frasl",
                        @"\u20ac", @"euro",
                        @"\u2111", @"image",
                        @"\u2118", @"weierp",
                        @"\u211c", @"real",
                        @"\u2122", @"trade",
                        @"\u2135", @"alefsym",
                        @"\u2190", @"larr",
                        @"\u2191", @"uarr",
                        @"\u2192", @"rarr",
                        @"\u2193", @"darr",
                        @"\u2194", @"harr",
                        @"\u21b5", @"crarr",
                        @"\u21d0", @"lArr",
                        @"\u21d1", @"uArr",
                        @"\u21d2", @"rArr",
                        @"\u21d3", @"dArr",
                        @"\u21d4", @"hArr",
                        @"\u2200", @"forall",
                        @"\u2202", @"part",
                        @"\u2203", @"exist",
                        @"\u2205", @"empty",
                        @"\u2207", @"nabla",
                        @"\u2208", @"isin",
                        @"\u2209", @"notin",
                        @"\u220b", @"ni",
                        @"\u220f", @"prod",
                        @"\u2211", @"sum",
                        @"\u2212", @"minus",
                        @"\u2217", @"lowast",
                        @"\u221a", @"radic",
                        @"\u221d", @"prop",
                        @"\u221e", @"infin",
                        @"\u2220", @"ang",
                        @"\u2227", @"and",
                        @"\u2228", @"or",
                        @"\u2229", @"cap",
                        @"\u222a", @"cup",
                        @"\u222b", @"int",
                        @"\u2234", @"there4",
                        @"\u223c", @"sim",
                        @"\u2245", @"cong",
                        @"\u2248", @"asymp",
                        @"\u2260", @"ne",
                        @"\u2261", @"equiv",
                        @"\u2264", @"le",
                        @"\u2265", @"ge",
                        @"\u2282", @"sub",
                        @"\u2283", @"sup",
                        @"\u2284", @"nsub",
                        @"\u2286", @"sube",
                        @"\u2287", @"supe",
                        @"\u2295", @"oplus",
                        @"\u2297", @"otimes",
                        @"\u22a5", @"perp",
                        @"\u22c5", @"sdot",
                        @"\u2308", @"lceil",
                        @"\u2309", @"rceil",
                        @"\u230a", @"lfloor",
                        @"\u230b", @"rfloor",
                        @"\u27e8", @"lang",
                        @"\u27e9", @"rang",
                        @"\u25ca", @"loz",
                        @"\u2660", @"spades",
                        @"\u2663", @"clubs",
                        @"\u2665", @"hearts",
                        @"\u2666", @"diams",
                        nil];
		
	});
	
	NSScanner *scanner = [NSScanner scannerWithString:self];
	[scanner setCharactersToBeSkipped:nil];
	
	NSMutableString *output = [NSMutableString string];
	
	
	while (![scanner isAtEnd])
	{
		NSString *scanned = nil;
		
		if ([scanner scanUpToString:@"&" intoString:&scanned])
		{
			[output appendString:scanned];
		}
		
		if ([scanner scanString:@"&" intoString:NULL])
		{
			NSString *afterAmpersand = nil;
			if ([scanner scanUpToString:@";" intoString:&afterAmpersand]) 
			{
				if ([scanner scanString:@";" intoString:NULL])
				{
					if ([afterAmpersand hasPrefix:@"#"] && [afterAmpersand length]<=6)
					{
						unichar ch = (unichar)[[afterAmpersand substringFromIndex:1] integerValue];
						[output appendFormat:@"%C", ch];
					}
					else 
					{
						NSString *converted = [entityLookup objectForKey:afterAmpersand];
						
						if (converted)
						{
							[output appendString:converted];
						}
						else 
						{
							// not a valid sequence
							[output appendString:@"&"];
							[output appendString:afterAmpersand];
							[output appendString:@";"];
						}
					}
					
				}
				else 
				{
					// no semicolon 
					[output appendString:@"&"];
					[output appendString:afterAmpersand];
				}
			}
		}
	}
	
	
	return [NSString stringWithString:output];
}

@end
