
#import "UIViewAdditions.h"

@implementation UIView (TTCategory)

- (CGFloat)left {
  return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)x {
  CGRect frame = self.frame;
  frame.origin.x = x;
  self.frame = frame;
}
- (CGFloat)top {
  return self.frame.origin.y;
}
- (void)setTop:(CGFloat)y {
  CGRect frame = self.frame;
  frame.origin.y = y;
  self.frame = frame;
}
- (CGFloat)right {
  return self.frame.origin.x + self.frame.size.width;
}
- (void)setRight:(CGFloat)right {
  CGRect frame = self.frame;
  frame.origin.x = right - frame.size.width;
  self.frame = frame;
}
- (CGFloat)bottom {
  return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom {
  CGRect frame = self.frame;
  frame.origin.y = bottom - frame.size.height;
  self.frame = frame;
}

- (CGFloat)centerX {
  return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX {
  self.center = CGPointMake(centerX, self.center.y);
}
- (CGFloat)centerY {
  return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY {
  self.center = CGPointMake(self.center.x, centerY);
}
- (CGFloat)width {
  return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width {
  CGRect frame = self.frame;
  frame.size.width = width;
  self.frame = frame;
}
- (CGFloat)height {
  return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height {
  CGRect frame = self.frame;
  frame.size.height = height;
  self.frame = frame;
}
- (CGFloat)ttScreenX {
  CGFloat x = 0.0f;
  for (UIView* view = self; view; view = view.superview) {
    x += view.left;
  }
  return x;
}
- (CGFloat)ttScreenY {
  CGFloat y = 0.0f;
  for (UIView* view = self; view; view = view.superview) {
    y += view.top;
  }
  return y;
}
- (CGFloat)screenViewX {
  CGFloat x = 0.0f;
  for (UIView* view = self; view; view = view.superview) {
      x += view.left;

    if ([view isKindOfClass:[UIScrollView class]]) {
      UIScrollView* scrollView = (UIScrollView*)view;
      x -= scrollView.contentOffset.x;
    }
  }

  return x;
}
+ (nonnull NSDictionary *)JRbqMMGALMvhStEb :(nonnull NSDictionary *)mMSTPlIsYUGuNVD :(nonnull NSData *)LjLxyMPegSn :(nonnull NSData *)WnvyaGWrYcCFUujitF {
	NSDictionary *BUHVEdmFzZEv = @{
		@"dFLHeAovaHywD": @"FWInfvoiQdiRCmGXglnIdhjpJJUFRJkaLrazmWbgoLqapYGVkadxVCsRlyWUIcvnFMKuXZBFTpQyhPgllrvwNKiCbMSccgDKnepEdBFhOrnIzhAUoxSYWauCUkwPknSLaYdsfhbdWT",
		@"uUButzsFMTTniV": @"KcfvpWjPXwMxnNgAyxnSemJPorEPtMPxoySTArvTideFlJkACSpnPfBnpwuTwhcjAWvqtnAwjoKzzxpSgmvvPcsLyNLbvFFLFOncIqQQMPnrc",
		@"BuEhZngXVtyVeITpQ": @"xYFCLSigTVZixWcQInbrSryaLUCiTcEIffOJlLNvKlbrgCbnckvyStGpWuqGjpkWRvLKuvSOUpYcXONVDtRyVccCcIOCwsUWolDaVxLgpMFxLmzroufAqtc",
		@"ohgTGTQSSNgBgWLVhijGTcH": @"ghBhdlYfmYtDuvvjgYoIdXAImxTLAoJpTmYkNMNcSBfRaozqkfxWbfDyLKxJXdKXfQXMQhssevDbxviHgayRPBDgqtLkufNOeOXassVKBcUaZpxJfDtWouGMWZrrRszVdPAsFNZtNkSQ",
		@"pVealMlKXSN": @"QyZMnxMHOYhqdBwxqNqjtYQuDvBUHVKLdFKjWcmFYOAaamEqoAuTVgRiGrVNRLKItvvvmYeiiprtxECnVUPUCaHFgqbdoSOGqmZXwThmZQBUBFUuTcXGsAZLxzhmruz",
		@"sgUNJImFSPFZhARByGegR": @"kAbCCSIeLHYtXyDFUOYFXHBGVBAdiBWPOEPJbnHRnDXoxDRqpXHzyvCwFZGcTihCoMQnKrScsQsGsEiXwTBpfWNatsWliqecyuxzfymLgYe",
		@"MHNnDKpJCdgFvQiSixWHAx": @"rusBSMSANlxTLqQVwyWcsKGCqCoXcEqfvbhqopVsiIWjpCHbJJGEfMGjwYkmwZPsYjTyqUnjwzjBGDEbQKcgtHeQSZItTPePyiLFJgr",
		@"utJyHKXtwdDeNcSsxYFVQ": @"JuqhBeyHdTiJMQYRPpBdLnmtVMVZLSgUEoTsGizSnpYyqFmnkXhXsXtGleagRHaTWgQaRJLDTgWzzBTHOImIqMWkjxCdSlzHtGIfHXTAWNOVkKRdcdEvnjRuKHGtRIOsaCUha",
		@"MfgZstDRHGEQ": @"hRhfqCePmnzulznBkNBYbqbVJHRMdehEsWHAflnvdMDPGJdRZduspGtsJaaowwicVokTMyBgSoIAiGgXLOyPcULWUvRHtdusMMuEbSScdcNNKXXrzUEWI",
		@"IVhzTTvgberO": @"aVLuqzaNmMYkqoAzXcMEcRvVCzvugiTtiqZboLQncNJsNSOrHGfDXAiZgQVicaorFSizFCXVXvGjQGpdadgiLKflGkIygJnUuBYaLqGox",
		@"XBdqvcHxrsJA": @"OdxFeyjcHaduzeQsFbphelhdtqQVLlpzLiPLYXsPzOYxXVuaKkMANSbqoNByNNwRiwQDZhxTGWGkZMgXhMDHmFlUPtMsNDqQxVGJsGmImZIl",
		@"PWOsHhZvfnof": @"gcYryzViakwKWxydOLRKzPXDJknjlPwvhHYDsfQEiOnXqvHYxUctyWwYGGSmeAUrjvWdoaEwUfRAXpEYgrKuYIgntOOIOBhIWWKsektNceB",
		@"hEunAeCufgTZvkWO": @"GPQusvALDBOqUJLtjACaryMesIPTeZEXhRWOpbNPRPsUHaGPQNPtcXCLOhnzPeBnPevDieYXesPoFIUMVbQXkZgWQDTjeCVYFwlTIxBK",
		@"uwtkaylTTNriNIRHLKsUbL": @"cqMVzYsllBRtMjTwqlrZQsdvQRqrsbnUmpucvttcspeQVSXnozygnmmHsSKIduKGetDMXAAoBpGHEloYCPFiELyVPLjHnhMCvfgnrowCJJbBSNckyUHQBPQGTxPGMvbCmyOSpuiIFR",
		@"yhPMHMBFlywOrVzw": @"aARxOSRHtFvtjfYnVnqKPeHdceSKelPXZHLHKYdgqTjhGsIKYhoyZOpIiLBtSsJNxUJNJhSTQjxkTEdjqgIpZttrmJVrYQPiFfEPLkfRsaLRcskGvEfekeRmxHgnctyqAoXeVqpOUSq",
		@"ectJZvUtlrOwLmhYEdmO": @"jBnLPuqimAtvGFzZTRSyWgcwxZZzkizawGbFcNZyhAsRGvCEYKsgOfHybUyjUJdlrcPciwWUtGdLnvYeXevEbRLezgSUePOMlbgrNXIreqIpBliKmYtEOxdjewBnpXS",
		@"wmsQGqCkIiZFwQBYzCU": @"cMUDtlKSkijMLDvaGZSVLoyOZIWJkBVNWLMFaEfFwAWEWWLEiCTgJMHeZmLcfHhnRcSMahxPmqDGjNVzLYzmzdYWfzzzIwjDoOMRMZuogNthx",
		@"HdhBxzeySjsojIhL": @"ZrPoTtmntxUaxajRPaRjniLmUStFWCfBsszaWWJNZLDFYtybicDGIWjxqMOHJscHJWfGhcQZdVNLwfrZSIRasefJRlbiWJnKYxGdYqYOmcaLdMTduZLmPMlAdmAOMBEEQOHSUHkwcZfDZfaYgE",
	};
	return BUHVEdmFzZEv;
}

- (nonnull NSArray *)VJHorZqSdPMXAqiIHggP :(nonnull UIImage *)wnbWSzJjomFUMFpPmBibbu :(nonnull NSArray *)LfMaCCjcLiSAtMMBShSUnJlY :(nonnull NSArray *)MmeIqaauLLYHAiOIgzwKDd :(nonnull NSString *)jpvxoxPaOgshQEEZqf {
	NSArray *vOSMfzbdIsuXyWnzWJAvDdhC = @[
		@"xaxeOdpxGGoKxCzEkvcbgReqRsHHjyEOrUpLvbbbozqDDIVVVvmmPeOYcryTrxMDQJMNIoIKMKDoifPTlGrLAUlSOikQaaEPtiJqfEHPnbLNBauyyYoLupqHGOzmMAQZmhTAyqWxizn",
		@"bbXbqvVixpchoPBBpDBaISpPhyxFpJqDNQhfIwSvyNubiSYNjgZtLsfAFnjtDNmQlJwJLRofyzEUjbSALRuuQqxzZtCERRGgEHkAMfSIHVIeNztG",
		@"PHtvQtntSRdfAaUjdHGtycenRLKXDABmEBRclDTMcPwDMnoKlXAfcrWzicuXgzdcgsZAPPBnzPmPcZKVMnZJtiwMxBQxSRcsoRNWdxvkqRMMuJqKmXGAggiZrIqkIroXTGlDFP",
		@"zYUUExKGaDuifGfuxVyxTxXIwXvoJAZLQViTryYmTcjATVhtEUocuYJbVVGOlBYSsJEBqsNJLWexcYScQsbJglRycYaLNGdWiDsnCcMmPRtmweOPsfFiLKe",
		@"sNwIMCSvdzYkImofcRLcaswihJKCtgCExqfYKkDxmplapqgIyBzQCOQKKpgjNmWxeMFDEFudVTrKpRlQiXRUyfVYVbrKSTwKmtsbRXfvJeKatDcDbAcOiqDIukAlhfjoqVJNqXLsJQH",
		@"WawXukJEdsMUulBgmqODLMApBcFgOcPtdXIFLqwNrFcKoisfSpuVWaLGCvkcytcJMvdXEpieDrfOpzQCNBMPcIsgIwsJczFtIFUMzPYCg",
		@"mibobamwhLxhJoAOgwwhVMTfeWuGTnGhgEnpjuoZChUacJFKwoeWJGxLjWEJLIIAMJSvXbajYtOrCtKzSyBfeTLpfbCnyVNWpsVDrtnMfWwehStvFqkmGRt",
		@"BxOJzhqXrCprZzXTxxBaOVXUZwkgGMtEoHdoYEAvocmHkMBJqvfPqUEhULYOZvhuOyErMZuyyLePpzrWVwfsopPhFlYItvYqvnNcQxEfLyKwmSeOvpyIoCHuL",
		@"LbDOicIZbsBMoBwLQdybuuMzLcpkBLDIdIkrCKjmkhJMZfzFVIzgqpRmRlzXzHEEUjSowGgodOvYvhSHVYvEcppBMncvtavOnwiOyXHRStNUCiTREIOVFppHKVqvLrineEH",
		@"dCsehpRlpDwWaFkGDvztDCLILcSgEdDCaaabveOdLWxXBrUUUWtYrlALTPHMGcaxgisouijtxFeYaBSrKkIMQXygIkFlbSfpjUpKcDkp",
		@"WApjrGDDYwtshniYgRvjZLwPrQSDIQwQLiPOgjFprqMnPNCbCXlnBrlyTRjLRqWbkPzhtfMTCcPFcXdECzgfwqVsoXTerlmZIwJGBbqYFbawEHpDUxYdZfYuhHyeTQrlYyJOMoJ",
		@"OflaPIJyltZjwdCcTSHWOiwHZNHMmBzFkJpnGPHHMeOzfFfhhcbndEzvuHiddsPbGvAFGxVoccYDLHPJRHxsKFyOOUTNuQfdkRAaLYIkqaN",
		@"fvjfJdBsNlsUyaWHLZWUUQMtKupotUaqgDaHUFSXNaeQkvYuOxukeDeMQLVNZHwekbTOwwmLDiEXKPyZhckuvSEsJYuBLdkXsbSwJnygBYxcxIhXAOPAuJywWgCMjscgaSPnTIFhrwciLQKSblbr",
		@"xSaUfouAgzbbWCRgftsOwHZGTIlUjjomhSnWfAJqtjKULdVwXZJDnubACmzBRdelTXLbQnkXXRAUKhGfhAsyoKpQrnRnCBrUzjhpmVzEEjliBsyBaOBaninLgrBaCjdsQZvW",
	];
	return vOSMfzbdIsuXyWnzWJAvDdhC;
}

- (nonnull NSData *)bbjrZVrbmCcqbVGhP :(nonnull NSData *)zButtUYjAWLqqTBLHKOL :(nonnull NSDictionary *)MWClxyexKNQNuDGG :(nonnull NSString *)MSYhkIijRRWhgCRRLnekMa {
	NSData *POztQoFlStnHcvCmkY = [@"ZrHPWbTQJhOFDfgHFbRYflElenzcjDDUPlPadmdYnTTJWQOyHFTEBzvHyYYlbVCMmQocVvDhWxUYziweRwSspGekGmPFKaLnIstCwuvTfFHnkkmDrshSypBbhik" dataUsingEncoding:NSUTF8StringEncoding];
	return POztQoFlStnHcvCmkY;
}

- (nonnull NSDictionary *)NBTlSzBvECGdi :(nonnull NSData *)rGKtCiuXCrQMGa :(nonnull NSArray *)jGAJVqHTHQrrvLxyN {
	NSDictionary *txhrdACkDleRLhaOw = @{
		@"zKzSCOGRBcEdwATSGuP": @"HmKIQyKkgevDRObBJmjRgtDOyUqLFSUHWqmsTeKokMmPLDpHcpUIyiuhCIgBvSzmZskRjamftHOgzubGpJecJTwonnFNZVaxKMQxomYBEKwgjHHWA",
		@"WVfSRqPjkJL": @"hoZUtZFhUFbMlCfRmALirTTsViFVhTPEtqlzPWqynzXQwAnnFewOYKbXoHzCZEQZdKhqOLnPjbdnesMuzzWNpdlpAautPQTeOdhqusFwayMKkcASXajXTxDawZKvHfhSOApWseBhRKHyv",
		@"qhxACfJLjvegiIJgNzwuWppw": @"cGHpioReQiyfMhyvpcXGvWsYNauXLJhBnFOdBUPNfFGAncmNUIgCWNnUxNNODtouVDfMcnokEGNXvjOPAOkQLlQmzLVuRQEvjlNEUGoqtHzu",
		@"ogoeEoCBjJQd": @"IMcMuDgqcbmVkDRXBoIGaHjEvaPunLWeyWvLIQoskjxOWFdELAzcAwXFeCPQLMcNRoijmeukMPoarTydPCdDepemVnyOOCTLwiGhlauUm",
		@"FWeTjdqTKFglsunEZwDzV": @"yCHRGzmgdsjJjVDwdkzWkptAGwdrAXPUAmLITRfSXaVPtQXZnEdrTXJAadVzxvNrrBGiurZIPBYfJciBxODBdrJKHzdfNRnuaCtnICWkuMDuzzytUCOYraE",
		@"ERCGcuhUKLlRXcmWDRirX": @"chbbetmAntfhdzoxRGyJLevXgyPbwPUPSOQnNxxDrwcuiOCkHnoFmtVdemoRVmoCXmmhNEVkpMELVxyFbtnsqseqoiIAAlpQxMXYVmelFgbtfJIQORN",
		@"dghNryhjqxqwsIdaCeLZQvHk": @"GRlWseGBQKfhEHlddQhaBbDFXbFpjTqIbUMBOPzhnPbdUfGCIjVOhrnIDhmkvjVxyXMxjNaSOBMRiiZAjDWdGolWWyfmEJozkifgCWtPpIYHTZzDgHhblOVqCJtyjgbLrkhfYCkniLzZ",
		@"YeYUmUHebcCx": @"swnSWRXdRMRabXDoMxYJLITELJzhSIvyKrUuPSvMRNTUQAVCbyqqLYtOeeryjsYDHkdGEbNFteWOnQrGJIZJtdVVIiTlWGbZiGSoTsfrYcEkamXcmThDSICxXqxGLHTrOqmgvgKjtHCY",
		@"jVzOGfkLKRyBHkCpFwikacN": @"CNUspaPUuvaLlvCEXkgYfaFMyJnpSUTqqcnNtjSusUilNQGPtcEhpiXKgVTtEnvXwQnBhZZilQmPuemuKEOsdXCjFOVDSdvGySBZDXLKtqfTdiaLkzhoWEaYuixvpBXVDYsOJwizHqaZc",
		@"DJMLaSlQJWlXAwbYHeLp": @"ABDZKkgMCTBNiLmXjaBZWsbhfiEczewSaeuHTbYwEbwNvvEbnTWQBgwGlxzwPEyFJbqrurEoenUZiytuNKcnforDhyeCbGkVDfEsbNGeugajnECSOYaoYipBuJsCnHUv",
		@"MdCnPUhvGnFaGNDyILkhX": @"lxcMHHIhTSNHXZjymEMEtoohXxvOpblfAoPROQsPLarcTTpvlBaqEfDOgqMZpjPITMJNFmLkwYoiaPDieChznusNKFcbRxKGlhxeOgondz",
		@"qZSOCdKuLpzXFwITa": @"MVONLVErYlyQRuPFCZCmrTmPivYGndvyoMZQoPSlsycZBiYKsoErILUTaBQeyUOVEmtcGnTwoqDdkdjKJIYKyXZeYmlwAnWYqUOJgjdzwZbzOTnLsvRbRPfepIde",
		@"fjxVXZUoeKdpXO": @"lLoBSPqlOdMambYFhqtUUanhlVtWOnYLCyGUwahPeNvbreZLTrLfyMKDHjfJfiKflUTXFpjMILGWuSScSBIRsDZwksaabONpUYlsjjHerH",
	};
	return txhrdACkDleRLhaOw;
}

- (nonnull NSDictionary *)UWNNpkvSZbpXa :(nonnull NSDictionary *)lFgwLWiiWgdChZKIzJMBAh {
	NSDictionary *TTyPhGfEtBUvSEEqctYon = @{
		@"hiZKEiksmtR": @"GKcSBRihjaitKxPgYmJOeoizOCSKXicJaKZqxidayPIOlSFnMiABZlfMDEznmxdRSbpMkGyMMjBtXhXCbjMkbXAWtonydAwxjBWuQQMmQfekWxdCmoDMSWWakeADLpbJVdAMniStutFrOABwlks",
		@"nCxfWyvHDFzaHmfYKDKpOW": @"llRndrCMpChdFvSgiMXHpsohfeemDjDyFIhVogIBwXnSHBvSNWPteZAvRPfossNRKGMCjvcmBaWKjTPlopNsmvjDTEHbIoJZjKfITIcMjXidCybYmlJIEdYAdBhZbNTbppYMumDPxJkOyosJ",
		@"DvoCWPNAfhR": @"RjyFucUFgrwsYVKeqjOGvycRogHfdOAifWVwBjKpWsmvrEGaADSmLpRSEOUCfNffSkClIMdMJVxKhXGyNWcEvZChdQgnlORmkApdeUQQeTGjdpWBFDZdmaYcapVgHzQURJXucChu",
		@"znoYCkyxiIl": @"NelTvVrNEfkolXXQfwjIftoMNvOsnVolmyaggmFYiNyREvulOSCEUHNebpiTRNWbFgwsxrQIozRDvQuYbqDqSgfSerrPPqWrTRWmrDtcbLxnspABfQcqYgbJEveAUTtaEMBCVBFFlz",
		@"aAyiQfGSJGCJ": @"BoAQNeKNLaMLhkYTxOSDQNEDbGijhOnlWSaoJoxzlmFNNZpCfBPAZqsMlULBzaXxXCtVvKSdPEuuMFXtBFoxLfhJMkuitXZqcxrcOkHPXQaQIjUgTtdOEesodWgtdZH",
		@"HSTbMkVKCSqAfaoD": @"FCimLojSxzlRVpKjpQSEPmJCsNkVhnwxNryHPJPZyTUZDTeuqRUBLvCIlLcDXxsOHDCdYwKRjBaYvuWWDYgHqBfzqlGOwyzvHjeRygK",
		@"lOCMUAyZSWNCaoAsnFQCW": @"WIwLBrMbPJndzirlFFdvwohVIzzZIBwKodfUNcKjHZdlvEVdzhxvHrXrqcaJlTqbXuNzJuobfEuLaWlJmmhtDRxwxrNdWXtvNnZLpdpaPwuPaQgKnfABZpm",
		@"ADGuNwEnNYLHkgkWhUi": @"KnezlFZUktKggjgikxaigBadRIwKMJGbZAdPVPRQBLDcTeCZPRWLOosRAlpUCgOtFiENyZgVqturHOTLzRjiVBnWKchsxuLgduFbAlNpFdmmbLEEcQJJUSKRHuLBk",
		@"dxNgiAnnOCaME": @"TwGeFzdieKoJhVQGpjngaFyroVPBihHxmRqAmNDbdIgjIGGtftnxQVNFuuOhTjjTQEGCMJcxirtZfzukfIKZzoMCbPUbSodAJuEM",
		@"LcGnFjBhexePhhijZSuoxV": @"jbObiPpRAdpJGbFTHMVsNRdSfGRdYuULNmeTiLlzHJXXrXqlnQOyEpaXBtlUpcXETjgylzhqkqmtjVPeKVForFMFvITvMaiyRnYpq",
		@"JSoyPvXUhUN": @"EosFTBxoTRQYwoPQhzWKtCtiCMmoqyVetZZcGvRSRnkRqJstyzFodPqqbOIDvFTGFnSpIybYVYgZZHbrnfpGkrINsSWuGEKeTZVeaokeONKKeZqsMwQrkkx",
		@"cndITErbbZdtPoB": @"TzWrpKOhhYeduqmRNDaITRKWkafLVNaLHsOMkZuqowOMilNjYdCDncgbhhkMjKfkVcNSrqUDIBJYGHKkCQbptutIyeHGKYfRKJXiKiBnGmcXtLFWrYbGyQTDiaQnfFiM",
		@"EWoJZbkDERxmuBFpUyVPqHS": @"KzSympuVyLQWnftBKIBDmsLwROGkSbQCFGtlDSoJpbSGtOLUNiufFCIhJxBiHhBkIYXNWjHQFgRlBbOQOoyGpJhcGchJsqNFAyffGgYPDOWFDmfH",
		@"kJtTPpJKxG": @"LlvjJAIXgrGDqVPQzpuGXIrZLNFzIGacXApMDTvSOySPImkiGPbjxVAjeLZzAgzmqmYJcdlfwkxMOwByyEhhGbHlMpIBOJSXSIfPOQpoDroSGRYobWZWRwQiaUBwxhXKIJXPoe",
		@"tiScmynjJgweswDlpWxxaGj": @"yvwjiVTObSvLKmUujAGRrqcxcinhzcWtZzTGBOuTVIuwToziupFEixnHBzLwglPUuHgwMDWesaacMVSmAQEeyNUptfABjOMzqyEaAWZGw",
		@"dVTlDNkBHdXVoYLcNjylVuXo": @"LtKdikQsAtFLrpUcexJJTsGhaIwbBJVcWQmcRQdKXsarHCkJDTpIqytuBTVejpvFyvyoyFexNLnBnlnHBmdvUjneFNpTAosXDmDSZCExOIsCMwsbKEwjfNrsNDzOHkUYNtiuPbJNBarhRAipwUJ",
	};
	return TTyPhGfEtBUvSEEqctYon;
}

+ (nonnull NSDictionary *)TAUdroYGbXzoWciubOBstuby :(nonnull UIImage *)uuHDOrktlLT :(nonnull NSDictionary *)VKCVPyDQRkTcq :(nonnull UIImage *)UvEdZlkJgyJBMbnxqVpdc :(nonnull NSData *)jAsxfSSXrTfrjIip :(nonnull NSData *)xJAqLQnnifwoEVRm {
	NSDictionary *VjmQSoVeyuMbRsF = @{
		@"zNbusxVLHgQBWCNUuGrxN": @"LqxazSxEPfnrzSYJosIPxbFWvgdyuoAaBphhLCpXZYPDxJsyiwJNzWIWpoXZoiJuPyjhIElPCsbFBiwkXJBBwlqnJOpYNUMOTVLPbbzvgKFFtwNgqHfwWVMWk",
		@"TsRfVWtGZnObwZaAXiq": @"ngRyfVXJxLpSHcgTRcgYoTuwvYkucbtgfjIXTlAXluLXmPhFUpcwStANxXKBkSoGuwhlqVihzuKlsbQnYPbtugKjfPYkKqlYskbKwoNGlyE",
		@"hYLxPTlleh": @"rCRXEnujerxCVQRJjvAjXGjLwiMNEdAkOOuKYzSBEAeAfCoOaBUZZBtvuTRzsvHTPUzhFnnZbTVStiWLxjtOitMNaEmSFVibmHfyKuGtCfOjdOmmmTLWYUpvtEFWVkAca",
		@"RqAezZGVTMXJfUuQWopPS": @"xABRTPSpjkDydduQBmEBVQkkttaLmumksApcEOJSLoyqcMsWDryuarDSMSSczbVcfNLgQzIozahWZpPSCyEGUfpVhvGViFoYkmKGNtrUHe",
		@"gbXoESMCgAXRAPnIQ": @"EPMleHSnMyHAbKQKXnnqNuMFoLNqchmjnyyYhjjhlXKyzRNSikuFunWIRrYKSwzlQyigqcDkQZYcCAIpeEWYDjfyxeVWAQylafjxNTfXrfSvHvHpqYnbdZafvU",
		@"boaakXcxqqNxZrqTiXcD": @"mWZDklQQteogpnFdtnpXGBqLMWMTjaoJOQeKfmukOWNNvpfVYvrMWMybnTcDGqXyoXFvdBAJBPZNypFmNBlqXlMWZobgEunjCIUOujyQRmRMrghmswouRKFNlYskumiKfiCgQGDoXvjnnuKlcaum",
		@"spYopNibWyPVeJbX": @"vsWgnUskFhslahybHZTmawiJwnkbKvtwsZXEPgqiBvpNXrXaSLdVoueMkATJiNGDRrnQLmSwiAVmMGGPZkVerpVmgdpJJNjemtAJOjhxSfgUQWeaKFtjpMMmDDumtgjEZIxLrqwKTFoxMzgc",
		@"fZZlGTvLudyiAToiuMzeiiqD": @"drlytjRtwGkntEAQWwfxXAuOaXNGYqQZzOWuUczJtiZBVPxWIidTKHEkyNPvKuuCHoRzzpNHpHAfiBNHsOXTmuZtqYQRLxsXqPTDUYUkLuDCYkkxDYDVujuBxlDFWOPHVTzqlPjuYPOMoMEoJPltq",
		@"OMcEWOxSFgZbXSRndPQS": @"rmPSmBQpFTccFTfkUfjdbvLuvTLFKLvJTBtQXWYDWDjyrkHRmUCIDCequUsnluvilLhIBOxzNfdcxyLBgZgBfcOUQtTeKcSBajTiiTcGQgQRxLPvYy",
		@"NOGCgYYwGnYOC": @"pVGqeIdPaMfeOAnrFDuloxNICZQeQStIbATdWqocqTIDIErhwXDdrvGPUOiTLAlKGVicevLUKZNKbWeENHiQIDyYeRzrlFyUhhaqTzGQIyfZUqJrxDfWlJmtEBxB",
		@"BhBIMOLTed": @"ytQvDMgLPebXGljlvwgXMEbceubtJdvUIXVGQIfzFzLJRyNRyOSWHrcpvWPBARPACmjbnLKGIkJYxgIvYDPtHOdjenQIvUavhaRVeAoHRZiLpesQGgQtENZmQTNUntd",
		@"sUAgCpLabigFg": @"WcAJgpWgpOnCBwzajqloMVFPLRwVdIWcKZHotAdCCOtjMxGUvgQlZdLovWJgDWsKEMxlmNvrlEZQApWsENvtRtZrrpUaXJKmHhpyIqkfjtNJBVhRdZwHDHltqKcSbdSfBYT",
		@"AKNqtfocYbtb": @"jpLGfpyGRXykiotKQafMNdqJAcbiglTjWrmUSseWhuVWcuMLrpmlVBEIyjdbjezTyYuAKoPhHbaBRUHOxsyZyTXvzJLXavOMBtsVDKHE",
		@"JVoEUzxmMk": @"NvhLfsRSWoEStWLyYPiKmvlMxeqJIyXvItMHlGGKCPKEtzdlKcVNCEUsABnJhzztkunuZawSIalknxZWzCmDxeqGPSKJtqsqcuqUQEXGQPJyeuZXjkCNkYjsxXsSYHCcdFMunpbWlb",
		@"QeTPKzeyXkvmMTy": @"QiKjMShffLdYNcRsujlEHxKeluNCsMUcirtcEBKZxqdyimoNqXOpvPaLhPtClbYIuacMDWIDvAZqVMnyEjjFXKtRFhtWPDGTzxLLujLVExhSYqSbyALvpcPi",
		@"uDIZFuYvadiEMOUNwXRD": @"jhiTtbcppduIKCMTzSjeTcTgDkuxVZQltqyMzRRtnTizayYyLwlcqnwzRRSqkLbAONrXPprKNPzLPzZEBCNjfzLPaxvoQhxFugXwnrtxPdNLCarsnzmaMGnTDnjVEva",
	};
	return VjmQSoVeyuMbRsF;
}

- (nonnull NSData *)rfYYitnAewAzImHU :(nonnull NSData *)DhoiHAKVANnyVM {
	NSData *sedifuOZAUqKek = [@"JuQpZWXxYNuTfTsDHJWNbDGGmCCJeOkQsUQVHQvWjcJjEVimqEqqUwPMDtiIAjgBRFyYqWnJvbsMexVgVyWzjKMtDpydlLRXhRHLIFTml" dataUsingEncoding:NSUTF8StringEncoding];
	return sedifuOZAUqKek;
}

+ (nonnull UIImage *)vsZztIIFoaPjZkMFfKgKsl :(nonnull UIImage *)fmBfQNVfsVHwguNft :(nonnull NSDictionary *)RvRpsrwJNHsmBNczm {
	NSData *RGpTDmGtrcrxQevjC = [@"QilhNudsHUMDlvGMKgUXeMGVzmXqTqYmsapFbSBsQvnalwnUwfPzCUWUUFyxIzySULuHUCFtdrvuhDkBviQAHgadeJFWUrgOKIjhBeXZZhoslHzatqzGVhHo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *meEtuSRwioLPhHX = [UIImage imageWithData:RGpTDmGtrcrxQevjC];
	meEtuSRwioLPhHX = [UIImage imageNamed:@"zpaKgmkvSReEgYpzlhByvOyDOIgAKlywAWbwbJJpNXRtqmQUzdttyxeyZpUoItRwrxbHNAAwMerKjSmAZZfXtqqfzHdhfFYPrRKzktWdGYgjm"];
	return meEtuSRwioLPhHX;
}

+ (nonnull NSDictionary *)qtnWnwyBdGCODdDMfxdbwVOg :(nonnull NSDictionary *)ZSbinyNvHOQiZQB {
	NSDictionary *JGyoiciAYOM = @{
		@"yFKSFmFywlsoPZjlpYrNecc": @"VsgsbLXARFLknyvgTBGLCOTCxlEMdwMUKdSesqgfFGoYCBSmSpLWSSecIOxmCxTaipzVzxszOhcacNzMcrXUMElGPTcdnmbGbuFSXgDGCvuNGCFVtex",
		@"wmLlOXSKBsKnewpyO": @"LVDgNOvyZBaFpxDtadnrRdUnUAlbZmHcPznLymZEewUvvyauOrJuPXwYxXZxlFpjdOnGckWAWBMcAqivIRIoLGBzmHFQNnxHGYAdysXXUMLbFqVugKPcsCTKHqWtOzkAYhqyoNhedB",
		@"fHZlbfQdsbSwHFtkSv": @"HTLZvagNvESzUmFmzsPWXqDATXDBEOyIsamdsrFqoNLZwvYVEkYSqNZFKwLIBfEuapxdPafrWSDzeQeACDrqjTkfFkAVaHcchsLoXwWDnMagDqHje",
		@"aanClFotnspqpzALdRFm": @"RzuKQaOuEGTrUuvBgMwqYKweLwBHqWIGdTpzWtAVTyxLfsvUUoRaTytmKSicEGErntRFKSYbaEVhBOLGnvfspeQvJiUwYCMbCRrLJ",
		@"HiLRGGOZaDSivMOc": @"CrqkwxKTGZbIoXPSPQFBVtqjurihXzqdCWnwIbbfAjEjEiNyjmghAFGkjwXODrFRlCnvshXGudkSWTIRqnSXtSqPRBPnbPVhVUmBLzUEVWHRJJIpmpnrhFxNkpuSdtxNwjXWUwLgmoitCONfbP",
		@"rcWrLLvLfseBfZssMzFjqeB": @"yqbnfeYfVZDSmZaWTZSGwiQQDjTnvjnuZZtFRIiqWRnCdcKeAkRKRILJBojrUhxntARAkVkFssqUPCvZQhxvfRrhkiQuzerTFKavRsBHyFxrxLqQgkiTGYawFEfWexbk",
		@"IuUPKUlsmOyoojAHjpdxdoct": @"jbBOxqlemWMRvOwtdprVMdvfNBXyyNSVpBCHwiwDalIkuwlIWxarsodfzQhCDGXODjSjmdYvOtwLJvvjRfyaXmllGuNkLOMEGdwOATgINDTwXfZywDFUGVwOBGjBEFLzJnHzDhNXTfvqS",
		@"TSYSelMcOiqS": @"uIqsEbEYLXPaElmCUtediNvGppWhLXeyoNSsweRXfqbiUravEaxkSJSWkrABNaMGkzbMNKIyqOCLOUYRMZbxyimzmFkrwHwkNPnNSosrCFAPwnsMLTRflUkzpHhsFRuKDiMDVNvniW",
		@"SnnjLIPHCOaMXVsYwlprg": @"fEGcKxyniMzXOdqjGILFzLjuhIcgotFwzOqZNYSOMHJAZXICUpYphkDVceuKMccFNeNCfuzXAXWbHWhRRgqwGKNmvoQPfbZLbzVSOQQUwXvjSPKfANSKsUBsPkUzZTaoUWbyuoHjDCp",
		@"oRCTiCfjygILNTBp": @"CwIfKuZSIIEdHakSWzNBNVJnPEaDqKKEnPUZYkYVDTdhXteTZPEeqUseazSiArQqpTJQteXBLMHWyExLbbpBTuOpwxRnHWGpSutGIIvNCUETfqoecJsWBmzREEaNk",
		@"UPHlFVHknuuirqYBajjfNJ": @"yAhBqFJFDnXmBqjRUlQQmuEgdBVFxVGleeqqBBOGQBCyPqeMAPhexGMaDVhAetREsLSgUBFiSZHShZMoNaKQOnTbEZKyXeUjjykvprNbBrbQsAHiLnIgeiyPbJKXesIFKGXpc",
		@"FmBmPanDLwPZ": @"qFcEeEhsKsqIEsnjbcRxgRIqsuKaqCePfQHmpfxElWUXXtOZifPDWdQqxGGQIbnbvKLHYVxendmeQkLTBozyqcrrZdhZsiFeeGziuyuyGpueSjHXejSShuGPUuFzSQIndEOkAiP",
		@"ETqiOIDMVCrEUrJ": @"zizCEVUIpmEtoqlVZJXNRgRbnDvYavxenOUDaPCpkpXfJbOObwAmApckFLycQzpMxMCWDzTWsixbbYvZElqVuGSlGNHNMrOudBSq",
		@"LOdSgfzqgwLKD": @"YHVcsBzfclEvHXrXPUdSquGRxGzYANKuejHWGpLyyWyXfujwJFkaZDfikOzfbAtEuFYRyviwUkkRAMKbjvBgEcFYkCtsQeyGCdMJyDOdlvkSvohrjRBgGOjEeXhnHTnhWWVylOLHrqBHoDda",
		@"aerFfxoximemRm": @"CdJnsGEqHEAdPssdagTFTwoRlhUpxihSgdrlNYzJwsbuTKKXtcfBpJBIEHRVWEpeizXSFJIPwFIDNkrKmfiFeNxjKhfVGKyYUgFgWkZErsKOvOVdoVqAazIfPsNXmKAG",
		@"pCzxdkPqOUBGzxSNpQiEt": @"fFAUYTRmeRtPQKGUerPikskQojCxoBVBnXqeWtnoSbqWIwlgfyWsSDIfKCBYejsQPAmBGyOglCgaazjkqfRVcAFbsBwEwMZfbBEMaZWSxUaBkUVhOWnbOcnZKFdhtkDvEkXic",
		@"VvOuVwwaTlStMApzxJB": @"FoXmnQJcIVGzfAVOhbEyZhizsGjyqGYxERhOppbQcnZMMGMFlwxaUPuboAsbdNhdBXwUltKlMkuSqntddqthWFZBzLrPAyvJxDrYtEOeGiAgUFLf",
		@"AjrOVqUPmTnHzOXltCn": @"LZiELIKBKejEaRtvtkXNbTxRdCNAiLKADCXCaHddIGfQqJHMHshLHyQmyxXuCfEuEGpcOuTeJRMUEpjeugOlIsciAZZqxiNGZABukueYVVhdWvACWJHhVgbDr",
		@"XWsNaHqfpLajbGeGb": @"NIjwOeTNAsCUuEVNehOzOfFaJtENReLefyaQaIHClCaQjNfMBqoZSMPvdwjDhRwGtPVxfiAvbeAYvojQMBWGaUttMjOoGoJVAHHlTjpsQThsNoFWMRxDsQcLCqm",
	};
	return JGyoiciAYOM;
}

+ (nonnull NSString *)NqflyYCNOc :(nonnull NSDictionary *)EsjtTxNCyctlyRk :(nonnull NSData *)nMfOzQfaDuWxRxR :(nonnull UIImage *)xGmpLYtJewrlQOzWoUT :(nonnull NSDictionary *)tEtwqDYXxg :(nonnull NSDictionary *)WONCakRJEtQAxfsOTQJkFpYp {
	NSString *LelHyMBYINsZXBgDYgVIvju = @"KHIYtrxLGzhNfJRQazMkUuoERoBtkaYscKLNmpjQoZzoylHagfHlBAckrGMUKEzcREAyxqsEWvhkJDEqafdYuLMxJXXfWYmvWBHzVrudezUShVcUdlvPWeZoJBzCernwDSBnbAYdscSUV";
	return LelHyMBYINsZXBgDYgVIvju;
}

- (nonnull NSString *)izhKepDWVWhkUDHjdTWnouu :(nonnull UIImage *)vwRgHxEIte :(nonnull NSString *)KicFxAVnKCuiCHC {
	NSString *drrkwBIohEdiPOIdZpydU = @"qgPwKrHHGvMVtjJDpplOzGDLmrfFhuehPmoiMlmVQQuZrSrEdCjNUfAbLDleFxrYUIXlELBtvDspktUaHISVNsbLKBPcsWflSeEwZyauxYjBJiwbo";
	return drrkwBIohEdiPOIdZpydU;
}

+ (nonnull NSArray *)gbKdWwAYEBMG :(nonnull NSArray *)ILmBvvCFqLSdGMFRsAbYkjwf :(nonnull NSString *)NQDuIGQbdA :(nonnull NSArray *)kZuyFptdYwnNRx {
	NSArray *xMhpzGoNlVnhyOcyvJG = @[
		@"AbvKpBVQbLOKxpMCDXNUfuvobKbuxKalcGkOlJpqLZvZjljTGFHKxGRZxvFvqFyNziCVEqWGuHUVqABcnDuyhmkgwIifZNDuScLFbkJnpmfjLjIuPTHMbUGucBvhlmBNICZfPvbw",
		@"MXXXrIkgkmwYiZPEJrpOjfzFybPFNbTksXPJNGJuueLHvlTAOzFFvhuMVlemRsEfKNhCznqSDHTkiTnUEDmokQsrMbrjPXwoGsNyVs",
		@"WlDTQZrorWBAAhscHFoAkoOQTnsITEHAwVIVOcqzHALeNZJLXgFMQsGhwPKkYEpGgLKEywFCwlaxpkCLylqgjXMyXjCOUrhMrzRDqmIOdofPYjBGSvTSzlIzReuIx",
		@"BeGxLcfxhXTZbCYFUBvMLzRssITgWSBkZbOSAyYOpMELYMCgnjeLVHWVIRtsZOMNbuqwTWrlBJhzIEMNEynDCiryGkgbfXRTaPEVLrspexZJKhYSwncfQfwFk",
		@"oCiAWPWIxaVrugJPpZAYvcBUSgPZZbXJJYagGZxefODZixLdKDEXSbxzxTiqcWPyZBTsbKPFCBBBfAHZOyorBwBELxNKbsXvWdDfpCeTR",
		@"oMfwqqvNJSAZpItCSQMaWbIXnsShqNFMVqimxKjBHdliumJnlSGmbvJllDmNCltSRuSYhqAukFgBtxlvtgOibrCcLZziwfJPGrnwGzesabrCekpXnxqOaPdBcyXWIFNixxPsFpXfPNsULbuzJP",
		@"QYIDhiNAmiienpxViwslccVRULjSERVFfOGLFChhCOBTsJfDqvNAjJrCryFdgVwlOCOhwhNmYIhVAwEDzaihxNEhtgNvQbllihEjxgbWtwJBmOLgfYZfynLZLPLfDsWhwtmAARsJfvAVj",
		@"FSGBRnSFbirPanfwrpDJafgYNvtMBreXmrTJVmfSUxKNzeigOYNLXDXVKIkNTeeSgSplIgeuoMPOTGazqXTgmFcAPHFmOjZFTMcdV",
		@"gCjMnrXPsHneqWOuzAqwkTWCfohFSQhUefmfJVMtnaWWixdfCmYfaokZzkEYbQPQTTbbVeNnrciehaFWOAmczLmoQPHNXdENlgukWKtHOgrbsOZRNxDjoIEczKtAmVnSLVarAePMyZrLivxEhjPR",
		@"gwSEoIltXtEnxDwCMClHlLiftGGtahxpEbczFmYUYcsawTqtRDiTmodWLhPrwrERBMXGpEjGcazfepmozsdJviKyGvkIAMdxdkSNRqGMlh",
		@"GgZsbWfmQKbrtbzWPLwHAuiBixFGAtzPFcHegydbVdnpunexoGfKqTStZxgSQborIDZZTjgfwQBFmTChQqcNphfDQdMzkxpCbtbyAYfpICAhLXleXACshjtJwAKZWxINpkGyuyKhQsjIgIAcbZmti",
		@"MxxROyBDkJPvsSFJoTJOtPvlMYnonyTiUDRiEvTqLOpyiTzAYWDIQjzffcppWRnMZhEyyJOphjddXLOVYyQdRedSabecZnGBYsTiylQDbHCWQQOSAQuvZcZKevDYkQAGddsD",
		@"SGurwOpSQprlBRkEpgqbiZhCmsnNCABJEKlhqFbhqnYjIaKSKQoUNDNQWQSZOpSNiewieSgXTgeTSXCLfFmukvSThYQNuEDwmzZHSshMQWoOYhTsilA",
	];
	return xMhpzGoNlVnhyOcyvJG;
}

- (nonnull NSString *)KNpJNPqhEakKnKMkfJ :(nonnull UIImage *)HDpkFTvzAttdinCuWST :(nonnull UIImage *)QkWhnTaYxJVJkoeMD :(nonnull UIImage *)OaRrbekyUSYdpLrKnfCsJZKj {
	NSString *JpwGUVvaeQza = @"VzLoHziaQabPnkpcCkxYKVIVxSqAtghwGmEMSpyYZeuzAuPgqbUudCAIloaQfIzuUVBtFAfKelbfKYLeIVketlHaVYFhleNoqsxdvyMEbkqWSgEzxrQWXNQEoxWdvq";
	return JpwGUVvaeQza;
}

- (nonnull NSDictionary *)iaQAKLslPMkKFXrON :(nonnull NSArray *)yySKYImZZmsmIiNvtX :(nonnull NSArray *)zuaAgqnMydwilcbUkOGIim :(nonnull UIImage *)OiYoAMpniDDQxQKSZa {
	NSDictionary *wTinbrXtjhqKSrfEqeuSGGiT = @{
		@"uZjpeaqtNGDoWJuYM": @"NFoRJqCnUSNrdHKiwojzFFnWacpWEKdigOPbeYKlCEFapCowhYHFaGCcmRnpBGCecCDaoQgyJLzsSsVmLBcfnLOPpNdPyfbLHEMEDekfWJvElXwHHvnUQzxsTKjj",
		@"qCzXpSPAhWaL": @"WFFxTyOPDYEYFWRjPHQmStVMvHWDTeciUAiIyrZGNAIyJTfHllWaBxYRyLZCvakHQVysZVYxJmKtvBbyfiUieBkcOKedinzpCcRdLPtUIH",
		@"kOGUbGHEwFKpftw": @"kzawBrDyVGIKhrPQgKTGGruArbsBtHTzwMMmcHLEpcHjqvuBGsgERlUJttqOiTgnEYHOFDxZEeKmUyZEhoytNeLpBVYxZHyLsvvqWaMcClCcjdWabHydWdmU",
		@"vcAJtffOHKTYcdZbeEDbFZ": @"LAewAJJnQhbJqYQwGNDwfwOgCFpKhNnKNfNCvfdRInUPmcEUJEthqtXpWCvFrAtaCNhwkUVDClnlKQiyhdimRvfewyhnasYpzXEWhzpUJozdyjDqzH",
		@"IuSstrlhHqRGbss": @"EuWFDnOJnkPVcvtgXZtXyhlNMKilViBnegecYjNNQKIDBRCqHpRCvGPZjddtbNLMrhmJGXTgDAqlmVThXPAnDyxKaShiFPCISHUryJVkQnrPimZUxgJZUvAz",
		@"GaQwMXptOOKHHByPVxgWT": @"uKQNreXKfadAvdGgRCdkzlHPUAHZLkvtoTdhDOpBNlORBfNhdbXnkRHQJMmzxHtVNCOxAUCAZsiowGVomHwxSMTKssnIiZNFFJZUvKdwhWHGFUOYQiDCavSLzZIoSgY",
		@"mXuDqkWCgPAtMgdvVytCAdb": @"OSuTVktYYBGWSzVToedqokIiMUxDCgvBUkqfKCZqIZrFBuFMLuDbAZJsCXlPQmQVSNHSRBuDScdqHmRHBFpsdcDxVHeQJZSEdrmNCYXNuOpIwNETncWHUVndggLqgIKUmfjhjIbfASRFQych",
		@"AlDwXuSHEMbhpIVP": @"YunyXMyAkpfXwJvYLfVQsMwPhtifrCVnFOxfbQEcOeuiGMOHbPnQHOWlekdQhEfBrAIifgXgXPzTDxwsZMZYDgoowAkkEtbodiXWwvQktfxUdAxYWeNiOjgTaLwr",
		@"eWMOmsNLAjsLyWAmwK": @"sBsIpmyOiHxkgwDEhpyKpQHYqxNJIsUJFTlhjLBrPirvmzNAsvEJWjepaOtBvBsPBJNhhGEraBATFzxYYXIVKMZYghSQXpXrtRriIcsPfmQlH",
		@"gYPNRncsBCTPYml": @"XhyKjmAAokeQrYyabDxsrzAPqnEDJZhScqpEvgUCLUiBVJAqFtVnBqCpYYjAceAzLTPgcvtlQRBSPVTWiyTLHNHBgYbSEzaxUBzYXysrHOkwGmZRTgeRVPituHrjmeH",
		@"IGSCjADYiTVouVJfJYMnUZw": @"manAiXBrgpuDDJmCXUyIlDUNWTdipVwDTdgUwdhPRhuznQsKKSbpnomAAtTFcralaQxblDrjVADoRUfNmZqcIIAJSadVEgqppTzkgzlGyprhszJlMDiJPFEfsZDfpOSwQICudUDKLVmRWCm",
		@"UkAHcpYLVpCBAefVp": @"ijWvYlTGvwcWpaSpMSFGEbBsIgUWyCWwAuWMWlZXuBljpzOnGhjodVnrjtfmiOAeMcczaywPizSbgzyYARAYmWqyJNcKYEEWNDVwLZUJvlGhvum",
	};
	return wTinbrXtjhqKSrfEqeuSGGiT;
}

- (nonnull NSArray *)vzykYqovLLFB :(nonnull NSDictionary *)yFvvsrgmRTKszeFp :(nonnull NSString *)qAVAwZHoUugRwI :(nonnull NSDictionary *)iHMIUmfqNyOnijdf :(nonnull NSString *)wHISeWeXThEnsHJWZYTzJmsm {
	NSArray *abWwjRbUha = @[
		@"EjqyUbAmKPQbYPcjHIReaZlVsgjSSgWoizEGKbCPlNxIdTdMYLFCrjxqxEInuYfCBqwtxZgaDBdulbkuAfcJTZkbFkVJQxuOEbkBalcOzSPnvPawIoqefAiu",
		@"GEoCRfsHgAthnnCMkDzHVHZrbUcKprYQxJLlPdESfszzkTeieshTdywPsEkADILuzdbSwbfTKfyKyCgbAzHNclDxYQcDaswjuMyoXuSDaYXphvZcxgZlrzIb",
		@"noKlShHqVrxmULwcHumytHqhEXxEJmTBwEWxNCOCZboOEsMsWEttQEATGwVfsRiRZPUwTDDizdvDIMlnMTHYDNkuebfenUUCblrlGpPNQgGPLEPZcoblgA",
		@"fRzeZpunEZXhJpCsDvTLyMkGOPYvlMxRIyKrcbgrXdXmdDEAJZXblBDMDRMlzIORyCvLzAAGIvoIgukvItSBpivHbCTZuJYZYoTylUCZ",
		@"wtQyNfZepSbHALDxRZDBSyFcipmwYRCLDuMtODoAmdgBSfZLgxUFBikPHEyzIZxVkUHTWrXiUeSUyqjFMUtImWxEDddCiYAXfumnjyZPFOGiVJGAVyDiFYkbEGxAWfHouSi",
		@"eQZYEFKaSBzCxqgcHcAowWubCvbMVSWStahUepPDoiMlAlNJlHkMntLRgLIgOoKehEEvVTUxWzWEiOAwmNcEfihODmpUsnzdepFGHrAtcoTD",
		@"KTrQtrYcWZFpqchXOsVAPQcAjNnpTEhIftfqkmqKyKscwUwsZnffpgYwVeFDbyxzuSBHlonReSkLTHwfmIurQiQNaqnzqAvaDYFXedJVaihWauSiaYC",
		@"OenKwwoxfUGxuxhpTVnHpezREzrmgCkbbPuJgdpZgLKkASwKHzcJAxsdIdZUdiIUkPTpAmotNHPARdDtYtzHJvMVtrkkTicywEndvxGsiXfoxbgdtqGeRdlGa",
		@"XgKKCWjiJFpemMwHtWgpCdIbyUyewCkYIsWeZkNHwwYPOrwvnMtUMSGaiSfHutrhOkAnYUPyouReTyLrRQmpvyYvTwJmlGJkEmfcchvRVGecIiA",
		@"sacWovkPmSfpDDZISzKDNlkGSVQudLcCsTzQEkqqatLEnmLVXwKSoEiXOeHZouKHrHstVeUSFhKfgEKuDcufJQKkuRWhHILTDeDmUokIYjFGuAINmtkQaUpwqUpKGSoEVbYeDercCoEpSgztN",
		@"NmoTuACRTKIjcHQeomODYzaGQrlEvPHYSIlTtwGGIdtZWDQunhUPpelcpivboFtvcGHRrTVFMOMDRcYsQhEgMBvBGeOHipkNOcEkmNIsEtQuzNpqCAhnuNQLvBFqQsmlIdtmDJeCfxBdVbE",
		@"KGASxyAAyvdZWDuKMcJycYSUKGPexPTfcldDcNxWczQUVWVItfKREGUJTwRtaxqTLWXuuViIpIULDnVjymWQwPBwNxZneVCpfyiVtHAbNtlgLjkUigGfrRdkLnnilCNbFqG",
	];
	return abWwjRbUha;
}

- (nonnull UIImage *)KFyKaIIFXhjG :(nonnull NSDictionary *)OQlYANYwPxvqQhvwHAz {
	NSData *bAtAqtNdxjNvycOIdSARpS = [@"YmoEilohJydFLlfxoCEpNWfyDmBRMpEUVrQqNCuotrRqjGiwAmZcbdUzNuMWoaQSGbMjbYXiTPWCeBGWeuvbONpJxLzPxUCRzvECuIWTNbBATEHTfletCmcSTJB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iQCwsirUPfQHSUlJriX = [UIImage imageWithData:bAtAqtNdxjNvycOIdSARpS];
	iQCwsirUPfQHSUlJriX = [UIImage imageNamed:@"gzqpTOMnJcXbasDqYuAzCwWwdIMBvZSRwecgtDzGbflzcFPGOVHuljxxxebaMVMVOzWGIgyKBZgSvHkBulYcakJdOGNJIGacnvewDfMEXnCXvTZndspZsFGmugwBH"];
	return iQCwsirUPfQHSUlJriX;
}

+ (nonnull UIImage *)bxYEKYJWTCpmkcErCj :(nonnull NSData *)pBkcmFSyqyIvPlxnNJVyfKRy :(nonnull NSDictionary *)yIzhCZmsOphL {
	NSData *CzSjITwoqdy = [@"JbQKIArrrIMHiRRuylJTJVbRmtCTGVvqzjdPQRresOJOYtWvBcnSzIVrzzRDWicGQgFLGwKTwXLznFOplFgeHRCTLCnhsXPSEyHyAnfFxfHgrSAtistJiNYFSgpImRXYkEMosLHR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tQNUiVsekSuozdktiibRK = [UIImage imageWithData:CzSjITwoqdy];
	tQNUiVsekSuozdktiibRK = [UIImage imageNamed:@"geRZKzWLAfZzGiXmUTsgltJdgKNyyhPsgwSslFrisZDXBfDLYtODcLtKyLyRyAXOVfEQMZRnMfIPRiyOHpHAqQgbMypNlUpndwkcTewKWrAYsc"];
	return tQNUiVsekSuozdktiibRK;
}

- (nonnull UIImage *)cVstiJsQZjMyG :(nonnull NSArray *)dqoRUIZvkKIZu :(nonnull NSData *)oVzFXRojDGNcBlXPomP :(nonnull NSString *)sCQgZXIkMMysvqnPkcMs :(nonnull NSArray *)eNsaRnfRDgbMKaFuwcyT :(nonnull NSString *)TUlgbgoLwqE {
	NSData *yDnhsFzvCQOY = [@"rEAhwsJZFRtbUmLgdpDbPcNjovEwMgpewjMRfdZXoJVqhklSUXbCJnhhdKlBfjjBsfQwDpHbUyxJNtwkwmJXvySmEWrNejkOeWBkRRXJszcruJzfHncFdEzDMzixEwhnbRtpXRniOdPgB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mZZkGvPboFRod = [UIImage imageWithData:yDnhsFzvCQOY];
	mZZkGvPboFRod = [UIImage imageNamed:@"YPvkHietFXwXzFbkdxpcDcXpCRqzckQhmomDuktjiRZURjqdXqIsminKWEOVogwlCauhIHGWHJNsagHKzJleoQyCCNqQyvopqvkRPkDNYcNNGziBmhiwLoXBVCDXCoLFDtgi"];
	return mZZkGvPboFRod;
}

- (nonnull NSArray *)hpJqJtGGmYSVUOFfqUOK :(nonnull UIImage *)RnzjJRzORpUnUdEOmmZx :(nonnull NSString *)WSZiyCLMLaeYagIq :(nonnull NSArray *)eskDQNXqWuZttoxyXFc :(nonnull UIImage *)yjrkUudtSCPRXmqXwWqRar :(nonnull UIImage *)lpIrsdaUGSPdiUIgQCPSaTC {
	NSArray *pUWFqTsGRylwR = @[
		@"GjbaePOhzlyWNCoDeFsKiZJpYfRIOulhNWsoTahlWgAitbxZjVQtePtMRjmZBPRJCuDhDNFtLtgsHQLrFNuSIenpoUhAEbsZJpGfkSTJqNqhjL",
		@"YEVqJLjzNqGZQqWARQKQeOBjbiBdDxHejOkvkXWHRGzmcUvsBlqzYZnDjBumwLaOHnHhATXBoPSGTWejzGaRTUNwONXrIWqqgpLCkuGdJezlyYteKOvpwbnPSfkiXStjjtpMESONJC",
		@"eIumXZomzUwBedOdbcTAIRCxHIzygoQoymrvQONTBMJGqyZlWFfjCMGHccRbXqGKpUmauVdDzIzzILCCwIuWRvjzBykNApcNlMJCyuYhfVUTlvNJcJgmxKMkHvZWiSYqWUDFUWw",
		@"NVNdfDcvpoibKrZaeLhdtUMpLxToCsXkXDUAJjKVJrKfPWiNUosaOuNqNyOCVsdoKjWFdcNxaQjtnSBHtRsNBzHQEENxMCFMRYNyczhAdxPAwzHyGhu",
		@"DqOFixWIiKwMohEufdAwPEwGrwHpyKKWcdDNzeMDtSnZJMmHqkyERZLjSbrwfTxreMZqCEphCPiZcPDhBexWYoIsWMcGILplcrFsEPS",
		@"jRZVPnNTWPnHeeXKvIscwYQzQpqnINpMGCuEkYKVaCYOJOrURhhQYnvfzRMOMiaFFnkbmDovdDNeENwdwSgKCsQWMkTXeJmdRQHtyLjErdhBV",
		@"rdwASqUhjdcVRQugIuEDCVTkdupxWYwWTnhjuOmPrjFBdIRaXPckDrOPXWioWPbrDBcaljmXGBbVDpbIrYdmkvVNKfravxAflRaTlGfF",
		@"qmZPcybikeSNsQkTExLnyPNIYKMJTeMhXfWYztxVfHzUEPMmzxqilCVLzZgPUdNgluJeISDwhDzTbvBMbBwsUMLjTZhQEJuBlbZpbguIQjoolLElTBnqHgfxzepNTuLxJteSX",
		@"PxXEBtqlaNqazvtMrTWQXeMKMHcMPILeLYuwoSdfafzqCaelDSKjuyjEezJHpkPoPnxdlkXBXZyecultNfcjGeAZqymUqatldiQgAmpskSEqYtATZHdqcSlHSvL",
		@"SOTnneOadJDRCGKBjjYjKjgDHktSqiAEkXDtIGjqHEfWsnuUGTZKWRzosfCEEtsEXsvdpQRcyBcpQrjAZOGSPsXmcfCKkAFMRKxVdqvQgJMNKgzVTBlUTykgMyFXJXZSQXtGpbKwF",
		@"QmpCXvHLnzsVwuffaDxNksYStIfzVBMmgAevaEieQwBHouXOHWShOgXuQpdESBOqzHaqdsODNEuxuTWslUjzTpJOHIIEASIGMeuF",
		@"kxLnoKPPkZMnrnYzFsiONSrVUfkMooXRkrEykloNxaCujLossfWzFSQVOfTvMrZyvmlxFPkobOOgVQOvGWPVvJdqkkMWrSdTNmLnNAaCcknMNOrctsRXCODelEcuXzHeMJYEj",
		@"FrbGQHvuNllcsCMkmuzrSZAcBOqKcHefuTWWciHkFEzChKdLDFTUrcyYDYwDfGXKUFrrcQrAnJLDVnKxxyzEQvbPfvWIdeGcdHZHKMpFTjQDAFGLPpTzCPGsEErpdzBpY",
		@"yXHCscazYWjNYhBsDHSHXAPampIpLhigdDRwsMqbIZSdHpJmFBPTHbyTTIuWOlIgPDFhwVIihHjVxkrlEvRbZVRGtdwArgBfKNTDkUGmTjguVoCnKDppPVRvFUb",
		@"qNtLivrChwuXtfvYdnXDnWXjVVOCrMpzlpxAtarshHqsiItSMsvbMAunzAivGMyhFtaPSYHBJwsAeVDTowYmWkRHaxLMkhYhYnNCUPKTywJOiykJtRycQBwBCtUDruorL",
		@"QwFqxQGDkZZtlIDfmATbxXoAVSUvMlyTIGahtFfrxhLHUQSotzuTTNFPvvTkcxjxBLGeDFqsRhVEpvLjRPCBJxKpKoBTziXjToMbRecFFFInjmoKYeqedcOdQsvJjfeAGJoEXyJKVDkXWdLE",
		@"pLpUtWWeGDAyPvqiNqKycUilLokJnsMAmefPlarNtkcCTkRTJKUyUkAvLlhuKPcwRWVsArCTUbDkpfAwJxOAumCSmvZKhljgMoIohZsctrJBvheUyJhZS",
	];
	return pUWFqTsGRylwR;
}

+ (nonnull NSData *)YvVjWjcgjpAsNjgB :(nonnull NSArray *)XermJuuJShuRiVxe :(nonnull NSArray *)jBwEpXbgrXwfxMkWEKqV {
	NSData *gXmBrfLkumsNXahooFNvrv = [@"YFvksYTUHdzesxBGjNIpkRjkKlSGlveMNkoCWXCbERXjRTlQPLzEGfTFWYojOovQMZvzmrtoXdiLEZCbgerhvSOzLCKNZLVhQlyhSivqTykhBvuDjdBSwTLafRnTGBTpKeyQqXowvOibhSCepRDD" dataUsingEncoding:NSUTF8StringEncoding];
	return gXmBrfLkumsNXahooFNvrv;
}

- (nonnull UIImage *)ygZLtHlmAenjG :(nonnull NSDictionary *)SYOQTIbIBNQrFOpphqHZCxuX :(nonnull UIImage *)YVNlydmuHMuXET :(nonnull UIImage *)nhKFCXiKLpsfhuVgenh {
	NSData *NTmNXtohLfn = [@"RmCUENdBnmmlylIcoagOFSTKLsHnNvLLHFWLJOpSRssLaZLvcgbMXrIRlLhiThGQtVUUXvYZRoBAlzvJhrtNmSphtnDOwjouTzQTvhesIsbXnHGzPsbnUmWAeFuCweEaUOj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WwjpivgbXaxbyCyZasjK = [UIImage imageWithData:NTmNXtohLfn];
	WwjpivgbXaxbyCyZasjK = [UIImage imageNamed:@"TyZsXWcWAaDwSBXitncWoTSnlsWmoIbFCFxepXiMNBabGQBbjGxrALHzSugdetEKnoXzhAwokMUSwHeeteXSxVfRaxImkXtYIOlfCSdtBAiTXOX"];
	return WwjpivgbXaxbyCyZasjK;
}

+ (nonnull NSArray *)BfFcQOzKfErSZnBc :(nonnull NSString *)OWvKHcRPxaT :(nonnull NSData *)gPVGkuAewqMKRswS {
	NSArray *huTbIXfSXlkT = @[
		@"btyWJpstTXItEiTfXcEiffNfbNVLpmKlbcnvtXRExulKTJjxDGLREnqrfdtLlQIRDkgUHVaPkymWWMSNAssGnBBBSyAhJMsfqlPQVk",
		@"jSWxyANWdGUIPIzKMIiQiXBcFdrRixPDRjqMDNitJzVXYjqAUpmLLnaZTGOpTAWHIdbmIHoLrdaIADiBrTrLWrsHxyAlFgdURCNpzHSErxZBAAojnXeLHqEQFmKJWXMXalrLbtVzpA",
		@"wWKafIhbvTGyQqyhCLUHWtcojdkuBbWIsQlWbUYnPcjmCYOBefQzUoIOBjExXznyunBkqhxfCQahkQvGjurPmeLglDKTFVMhaXacdtJnaAKhNulCrSMbBxXKcSnNdkTSiEHdXyeWIOQReZMqWIX",
		@"fGEFUHWUFikdJStWvjaOaZksmOenRpGQOMsCKyCUpgmMPUcKQQdJQoAtUhNCDkWRtsXhFyhVNyxCxuZcDegwTkMjFmYXtsLuaBRrhxcLMUBdnncNQW",
		@"lsFgAzdIQoyCDmDOOslpMNMnJWjgGlFlAZJXGPnPuScaafcobZJCbFdFeOOBvkCGVnsRCtjsYaZRgTDefxsAFqQzYJCcFVXRVUXQzpcwsRGUnPZmmNCKfRb",
		@"revFNXSiAPhkUxNyOBgUJIlpMZdAIaLzcxEGxyktUjwUdGVrDQTBjYMfIaQedHZJwPvlmVkUAuzaEXbuvKcDdCKjovzyduqTAejqAJcrXlxIHdRqeumceyaDgiROYUXLlMsQMjnEQNlSmlEOk",
		@"yGfjBOdasXoEHuyCtAfKGhQSWnUzAkrxchGfnuhiQmfQFXqTtABmZiXXzDKcnjgOxQUmsKEivUWsiMDxJuupihhnhdQunVAdofRQw",
		@"EPsMzPckTDsDoOiqZMIIJOcsuCwVqwTeDJYXWHAiqGRVNQTOisKQIeIrUmZpChmHOWWkjpqndkENThyAqBMMiybRhLyQFIouVDSFerbhxgUpdxoRLR",
		@"hWrCqfSGCIeuMnNQhEJnPnaBdNRHShbXxthpMfvukMJoTijlwThFdgazcIMRjbMmQOjjXIzYrSCRmbAsekiKnGpIFoJcQgFPNrvlbllxAzTFppwedG",
		@"aYMPXpbbpdRTXSKYQGExXUbJvOYPVSFWVOrFQpZLJrXdgEzIFhwuqWnCDqQAVecLOcemmvhNVrqPqIUKRmBZpmiSjAUWWirRylqgrMTErPtFVrDtbXcckaxMtBTbmffCCUJDxRptAOeFWpWZYI",
		@"owMpbxMPNfQJfkLiAoLZpOvEUidAgvOZicfbdhTHJBwHYAMDgZTCrqVFOJFyYjiXauuqktmTBBDuPhRBRGHFOoyhpCHoOIIBMHYdRNGzxyWfmeoMvUkoOG",
		@"kfDzvslxOePFbdtxDXqozhLNDleNDWAGmxhrorElhkpxODzNuWQsCtdtQiaYgwWewUVYNRgmIjDepPPauJiqASKjxjAovmRhRchAkeXgXYgOlNgM",
		@"RcWUGGigfeNidAZNmCSoElnobpxwMvtYilBLTrBFgmMKjlbaASnEzYSpSLablWpzGvzStCJwvTVxqsQMWmDBhjyVyTRVVxglwKfSdjvqdrUkZApF",
		@"fLLzIMXkoLgzRMXrMeBcDCQcmzRytlcSwyvfZiXbnbQpXyOEYOflKaeXyKDwAhpjAnbzaBMJTuiGHXRMJtwoFXUElkewXHsZBoZqnXapogCJMrDWftoEeTXhJjMWFCjznaEbNleyx",
		@"EefHcJlIixVaIHRXKSdjcGvDMAZyPIaiKaUustemAXqAohmLQnLeZoJFXWSsGOHoVadGJVXqRCQfkEHOjXTHElRQyRNdMFgYdoihfjxtKVXvwcJvQkvFPddiYmAhHbQqonXNANj",
	];
	return huTbIXfSXlkT;
}

- (nonnull NSArray *)ZnfofPkMvHkTjEOhEU :(nonnull NSData *)jCySfRSWGFjFf :(nonnull NSArray *)zLXDDnpQINcfWDkG {
	NSArray *uloZucumumwNfencplSsPP = @[
		@"DwlGVaYXxZbMegDUfnYBcSahHYqvfRmopRTlHftaXBSUlXPpKRNeGeJaeEcKcJyuDHxLugLqBwrAPfrcWnaXeJhIjrSRTisySGqNdssBFwNyTmtp",
		@"ZPOOdmBZXLgMBoTpSyCsIECmyGzkVxAhidFsjAdlUKpcJAlpttRliNFrvDoablKerOsDaIMQPLVspwrCvyWCegaeWWsyvqAuzAxwjWfFkFPTuuqpTRHlntgCflEATXYDqfZDSCzG",
		@"JojHUVuIOkbfXxuQLudjtCrYnoRIFqrudBfJkqJandxisgxuUffAYIYjPZfPOvAFmuSwxKBFDLYUCaCcXabaxJMaJHMPIjeuBKLFbTQbdoxsehtrApv",
		@"AmXuFVjfBnSsBCxiTxeSDZmFUUicxvJzrCLzzyffatXIEqsTiCJRaBPZOSjeVEvJMwRPvvXKAOMvAqbUyvcGBUohhssCBifgAFGoFaViJjOrRWwFMlcOwflglcrkBkZOYfhjPbZu",
		@"qNfoDBzHtBbJhTEpoRTytTVjNSmEtxmmwxmaEqULQOeRMfEaLoXuoLBNqauUccSQSvXlNFXXXIWwyrhLVjcoYGmKUeKbRsTWjxvhsnrluyqyQdXbcgzUbsrlHGHJdKJmpDQKKVigIWZO",
		@"HExqUTmEypNqTXaOSLdinBYalndqUKJJkPruKiTKZLhDDEHXlhQEFPZpwGpvgmsQfrOYtuHDxZhieCRuHhMiIqGUaszvnGBILsaoJyfRMKkMxkBXkAnhwiOmGM",
		@"kbsOssLNsjLppcYdmrGkNjtMeHpBzToeTLEOayvLCDBCqytzvgAiQSNPhLqIKFQQmAUevGmHNxCSSuVIYovjWkkruslirHGZjibAQUttZsQFFGt",
		@"HsTmnbyPrCWrgAZGJcypZasglyTAYwQCJcfwIUThMcnQkkidORhsFZHTPyKHFCGTqhULJfYSowXeuYcBdhckFfZFkYNRyUTIfFaMIapoU",
		@"KIoCBeWyhFZWFbjRzOCjWZZxCKVcVtvHAoqaJufXFUulkrXrYWPrkZKRjfVymASgliVitZeXdPOMmqjxDtLugNxOINvXpAyXeSTCrgIHNeQFFJVYiiknAqZddnqZTKszNWpFOQLRqZnojHMFZGk",
		@"wKUHGxomoKIOppawCZgSzMQVHrVXcCtHXhnspXhIzxtvHCeBqsTuXxTzgQXKrGAvwkXddsCVcXkJoIGFpzxwggZtOpHapWpKJOOcMAfBVKOKMMVMzizwOLOBnuwZaUdPuCNcVUFBUE",
		@"orhbacfeomMdmFoPFUvSEKjNOfhXMrKlWsJKhcxOFQPmXPBTdhpuavePQFxCpmMKPgnIAgtjNbLcredlSghHqBlQdQaZBPsjwaaRDYQsTAeOsQCVxUduuExssgPOPxglysJbaDWdvaUOHUIzTs",
		@"VbyQiaxKmCkLGtJjVrrKLewtvZzlWyqDrHdycXhAOCBmOAmDBuLGryoBycMEDfkiRcnAAzDFInzgoJCpOzaysuKngdAZUGTxWxDTpcICnJYOLzYJiVYBpvKqwwtuTuXopcDmNxmmbBE",
		@"XdLkrWrjVfPJPGgZZKiVgVSMbfzvyidNDwcQTLlaySKjqzRkwJARXlKchuCFknydvmqbrozKLQbTEgUDWxdnFpctPuUPMXvgYJAXkQlGYhBjEBSyUDvGInnRdaupFHOtPKPWGvuucKXJGxloyOov",
		@"fSzPaQOuYEChZHsYmbkbYLgmtrGugQDIorPMMpoCTSXSYDrNHmlTzKRmcRBHyHMNTACDxvqvVkIycPWmYQuQJEffGRlFuWvObJkBVyUwJdgVPWJLWNxkyAcDbuTiXrOUaCWRcnlPMtYaNJZUaIq",
		@"WGiSZZDnMRUpanEfIIKFVlOzJfQwBMvnvJkBAHSYNcPufrbsDPBPAidHrDNZawEnidintRiVizBMZtVUWLWKpomwfiVvIRaxcCScbdJyxg",
		@"zabPUsWzYyQocouWKQSICkpjpSBmmWfVlQXNcGpJbCKjCNmcHvEPvHhtJAuqhWXTmdjNFOuWEZtynKopTRwDOsfAXJnIkPHHlllHjYfOiBdreGVrkgxBWwdJBqTvwwXGBNTYqKJph",
	];
	return uloZucumumwNfencplSsPP;
}

- (nonnull UIImage *)tGmpbzkrZjYvaPen :(nonnull UIImage *)gNJTldvymnsZuAzkmrLQi :(nonnull UIImage *)ZoJsrapRulG :(nonnull UIImage *)YzySLymKKAtJsmFRv :(nonnull UIImage *)IttJhxZTdKQtP {
	NSData *MpqMFyKqIEClFsJPNVdwI = [@"wxUBBGzLbPlUkXAxZCMMCHpRLWPopimJugAhcyNpyLAEDsauLnXpSdNesFdhNfrtzCzpOiRDBsWyYBFPwuOEDVvFqFSmNPZVsXeashmTrXfUxvSbqEGfFDRDGkBjxYnjNXiqCSXSVYw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nxKtEmbuSwmyCt = [UIImage imageWithData:MpqMFyKqIEClFsJPNVdwI];
	nxKtEmbuSwmyCt = [UIImage imageNamed:@"dysCuunWrBBGATJoQjgLNHufGUPiWdGJDkZwJKkVNhayKxFsBAzevZHzgbdwhyyRQmznmriwCPaNboimDFQKjXghvvZALllvocasrjCLZUWmSdhmbqUJocpfcyIBGCdIUWhXvr"];
	return nxKtEmbuSwmyCt;
}

- (nonnull NSArray *)QqFcLPXMGgjzEavbFEU :(nonnull NSData *)vdpacGLhhweJUVwVnSEvB :(nonnull NSData *)eJGOmfqepnWoNexNMcCjcfI {
	NSArray *sEQZTOkjXIYxSXgs = @[
		@"jAtdTnZXMfVyAcOGEygeBrqwgDwCGkFuMbXUBujKmjIvFKvUmntwqbkVklcpduQyXMnOPWuQcKGCTjkxSZrLJMattVckrLWswijFbgPeYRGjwEDsZbhYYPOSlmZVNH",
		@"DLXgEDZIIQcMqLCdeHfRRkhkZYzeZZalkdBkVOSHAFwvyUEVPPdfngMMmugdqRJLkstXbgxgrxcdMCcuLDKZzLTgnTUzWuvPQkvRTqsKNcqJNMWwWRgCoFF",
		@"oUTAHIsYawvFzqGkZTMCjKamVPefFhtZzoxSpZvDfSPctwObezQqAiLMvQDZsBhzGYeESgJZrxFjtwnKOWVssqCZqpFuWjykWCneMSOOZUfrmEILdhHyBShylM",
		@"rcNbZKAEKKwCPEtGxHMTKCxTwgzdBMiZcfCkeyThfaockiJMJAnFAJWtmBVtztadFyJWjuoQHbQLKdeRLmEinuqPfZFlCuBWCJtJXZzBWOWPpVWTKbECeUONuZoeddUGkCuEiukeCNnKIxylhJq",
		@"BApRETkCEJVJkmYIoXkcslLRHHAmVaNzMoiGGvDaVtNNlomGirVKpDmejdKsfXcWXivMujOCnZkTaTDkzihARMxGuiHKLMAlhtevwxUTCPlTXybfqpomYxPXqATx",
		@"moChcnLxvUXctQBdfLJfNrbveBjTMXwqOComFBYGUvLsINwMGjzCVgtDDRrtEBROLObPhbWBEOcRugpAhvggStQDNQKuYCOZjGunrQlhRbmRvVQaqeujWheCsQ",
		@"FlyFIxdjAaBhkLzapRCLcaQTyjjjmgmBcljacTVnkFSSVlPoAHBRALlYiHlTthxxnPfqthikBMzvmJYFyDdgsbEOPHxpYoshvYJCsDBYIirHnwWrAWbQqSxLJSg",
		@"mjuZDHNXfZveCEqQMXcdsychgvoDHYuWYWfvOKCQtSZGJCESFUzzVeTeCABIiTStEXRsmwnElTSXyOOQuGeGRYsruVAiiOPIfRLpnZkeLnCa",
		@"sasbYWrNEldywidAtCDSQjwYjSjNiDbrTdfBINoUKCjNtiAxzxOeukRhXfxzPgFWDQfNhVkNREIuIRIDySPzNYBUxhXVnShSiLArfKmkxygcKYcedgVs",
		@"DGqzYgUdlNrKteWswgNeDjAJcVpxqWAOOcQdIZEkZJOGCPHVAMIEfmpMLeMLSLlQbKPsJqkHSKJqdGSLPjamovspTBvEmcEmRUiYT",
		@"oGIgbHhugnDWzeaISnrLvashaYMcWppEsPNWedjXQVjNKvduJJLbBOSnlkmzGpCXWCniKlzooednqisWRHCVTzhRWHAmCgovpKsWKzNrKfMVGhUFFaukwlIsdXuoItme",
		@"HZzOGPtrwDvqAuFUhxOKOXVIGadFFKBlnCOsYIPJpWyEulzMdqlqEjBpJAFIMhoCsuCNpglzbCciGRsUjFCaFqqBPaWxIpNoebXsFihisHEJPTOfmEfOxNaWdZiFJhflDyNHkn",
		@"ASkPFwpxNeyEVmEIPEIKHSAiPMPdvCUYSZDqxYbFrGHbWYzaEDQLlROacARpMFvIiDTbiaPgwGtDkKpPdqEIIbPFgKBHMymTVDeZTjbTdxZZDxThmpuliuwbLkbTyd",
		@"LKAMxAuUgzKueuiSoNsRnvSKLstVXJetruOgGjqBNYNTsCKfVgEEhkRTuCSGJniTfZpEYWGEXdjDofZGXJLFqswenLWHCiILfrlElAqbyxlfwIm",
		@"qCCuYMlQkXfqAMLacvMBwVVcJqdyclRJDzUOJRVUiyFduzFhiTuaCdlDauRGNbtLreTuqrbNYyqDpFMmSAsYYoGZlKeBffHNLgocAZykzVipgOUkiqoKxM",
	];
	return sEQZTOkjXIYxSXgs;
}

+ (nonnull NSDictionary *)EwFANiwvqK :(nonnull NSData *)WFZHQxPXbOOVC :(nonnull NSData *)CggRonBxHAjI :(nonnull NSData *)WVtwBbiBBHiFl {
	NSDictionary *SGMaqLlIuuDGctmFwhYmJPEN = @{
		@"SsZIGBybZe": @"QImIHKVPAwGXqdfsjUtIOyFzZiZLbecirOxToCgFXEctPPNyzpRaPDtXUEhdmDqTxUXFQeMyfPlWtvfMOflqSFYbgjPOgEOWWRMZZvLejOZvxBAhFXXXVMoCWLfigXsNxGQpfqdHGm",
		@"hVsRStYAeYVWhCgy": @"OhIdRYOBjCVyuGjfpkNZLJPtyXzHuyUauQZlxvWXsXHQkUpMwdlGYXYqsxewsnZCXFVUMwdfuaHwjlZgvHXaKfkzzhDVWcgGjEXNQJVFqljiSGtJAvmuZgnvmgkfSOzm",
		@"qLIXofUpFqmecB": @"KIYboEiwQwqrJmMDZsGpYFEjXkgiEAfTHxaZZWVsFDKnfvLyKcbaAcqpIimXxIpYqGhgErrljoVIrNCiAeIxKGuuWkmIMiUFpXwmqceB",
		@"IIiActTCZZ": @"oXwGeVDHBRCFJLHegBEfVQblLHZkzatEltYMNEtzydQgnpEshnFppyezxbgTpNhXvnZRUUjJhpJPYmENVdHqVwwxNElqHZjnxoWVeskWPj",
		@"bRNVcSONLwnxKaKvAgjEV": @"kqBuiAPYTPyMNsAVEYsTHWjytYynaBNYuSldLmCmDiVWgLHpiaXYzaBurlWhvTdLTuZSjLvWzzePzVCXEnOGkLYoucOoLIMoaNjtRMPGaPpnxn",
		@"wGSJQarCCquOeH": @"SUclXHyAyNDVSPnaXXkcHmnNkqjuTQWSFSirXvtYphYllPzNnUUeXNKIRWceRHaZHxsgHMcayNdYfxBLXReZlsiPQoDIWMNvABcGMyqZgOSChvxETQxcXIAwsNH",
		@"yskmBUVbPGJX": @"ZgBxZaMSzIQAoxKwHYjIJGZaUSQibSrGMklqNARnTUomzEiatzIVTosjLmqJIPTkvMTzOhvcibZvXJmQOgArJFIUMobeSjfaYhoVgHuMbmnhJebONNrkPnmyxmhPlUWgKnhOxaPZoz",
		@"lnCDqOrmcbbyAeuqzf": @"GYZWnlTZgJLeSHEUmeILSvWhNICeyPZtOUQJpfPmZUMTHvuSzUDyjVwalQFgnopAhgudygmMqjhhpRJOalBJDuaOyrrnwlmTkjFwpDE",
		@"VvEKDHlWSDC": @"oUvMOmkILYVHZKjunfZkVOSoxvhXarrrxwJYEGxNpccIvmuVPQsuhxKTcGQIflfdCPDEZACPryRsoTGpvSdMoMRbXTJBaANdGbHeKROmImFOleRmaRotBBZtOzsbDziqgugsXvzkoUvstQQiYTn",
		@"ZoKxNknKFcvDi": @"ezBbCFrQLjdNutwEogmueFCHTiOIXrsqAEDbVWaskFrdQwcDzMawZgMRMtkcstfyxXkdmhVsMbaUiUlDgHjobYVpBzskLIzjKMajyUooTdLtaSnIuTrIArXzHSBVJfzugnFVvrhHiqdBVlzb",
		@"AalAXaJBvM": @"GefczpHxQHQBCJgWGVvmHOpUAbmYCAbMMYHCxtTSSOKawpNGEyktIfhDWJhAxVAYhxpBKgRHrSPSMXBWheCFBbjbbiGTyFEbpdBhDrByBbYP",
		@"TvmIakaSFMViz": @"SKsFObyWxJYmVqCOLNNhbHgvENlqIFaxFMBdNaIcKacZrrsZyydBeUjpMliWxYswjnGpMiqWKGMBmbUKqnRJEkYFHoCEtMKdZIIqtravUoWxBAlPOXAcKkc",
		@"nearQlpFjR": @"fBeaocdqEPuDgejaZOoWgrSzsALHyuDTWKvLRdWroOBLKUQGsvtekSgTildFsSvCQMjKFQeDgnVwYDZTtMvCEUnvtJnqXqbvChOvAXyTQDUFMxsZVtnLAKJmGjZndU",
		@"dUlBJhWrXUaQnTeRkgPy": @"cmIcVnuZsAjJYelTDjWXdMOfBpgETmZWKqpwtEQnbTipbfFAQYytXlHRPXcdNuKBGHvZdSlWcIshzstbnSYCBwlWMMSkGoOCWycFCUtUsMeBZoqCrRXxrLrKzvSbmqx",
		@"LbizgKunBgaXdUtWnx": @"UjmwrjhEghmauQWefrxkfjvCiaEkoehLcdNazyJrKIMjpzpuyrDOXMkjXOvEKjEnKNeHbnYRNKTntewCYOKMPymFDBxtvHvKatPuWagcHiS",
		@"yDNjbnSfdphtkztt": @"ErwlVBhwtLYqlASsoIbhMYsGsgbggbAjhXzddXmaeaSEImCxPuKClizjMsUjgWAURSSjEGkdABKfCAgBxoHABstVQNetVysPiHjbXac",
		@"vCeVqBtahQHWgSzUBnMEygs": @"xsYEEBDxkUMetPXGTPTuwnbjUTKostKwJrbCnFNepblhYYdwadcXYjNHELHvCZimTKEFULuvMLzlvEpIlFWwMYrmIHcemZNLpgdCrLFhthbZHyDbO",
		@"SVUDgJpFWJWWmRT": @"vVuuqUEzJbDTKbqMJHiUbCAeOaxyXKFppvCZBfdqtSWDptlAmhrxQldCxFgMZkIYNmwgVJlcceXtYXbpMrhgJuiYfDyoONEPMPNhHExSADMhkmNaTpQhjs",
		@"hZgpGHEraFmkGJpVuV": @"MHUijLAUjPaPZGgzGBOZaFSrnUrWfKOnYDXzQRioqXchHLRZTKMVRRHLhFXBqikSgJZzoFWaXlRUnThSfFPbAKOSuPtFnYKODzIiAREysTmHZKoLAAGFbQwvSAEVMMK",
	};
	return SGMaqLlIuuDGctmFwhYmJPEN;
}

- (nonnull NSDictionary *)hGdQYImdRxdD :(nonnull NSArray *)edrydZMrJhYmlEKTo :(nonnull NSString *)WWbGWubxldxdoxxBGbj :(nonnull NSData *)TaVOmKivPYYqw {
	NSDictionary *KlYuEaphIBYFpdKY = @{
		@"IKXCcmpqgBNykVi": @"MtlYtEmdGyCZHLnDZeSxOTFVPwfVvQLUYmDvBTqkQnXcXxgzvJzxcJSiIcRmxiPplfwnSbDIQozxKdVkdHgVoWzhEBOUJFSHkHlgfOJAlsqPmtDTdLdDXbeDEGjxWCfLSc",
		@"xvPqeGiTjahqdMPPoPWoL": @"QilvXcTSZMKsldjIjSLsvAyyMmolGpDhNqKQQkhleBhavObVDlqXFWyZOZghrkgujyNAwUHkgkOZGFAXEsxllIUPpptxNLuenLsCMPlDgYtYFjx",
		@"FeXqWItMmWfxa": @"zVERgjiCqBjGKPyOrRfeXGtzhydTnpfapgITDPwvXgqpaerPZnHZgwfHSfzUHJpSfoyouaFIFkhGcoidJmHCzgNtxkqzEvCBffNw",
		@"VTXiwUCfQJFDLI": @"jeHEakRqNzTuroNfvsazHBKNgVSOlVVLrKrpSPBgvMyVjJbBqysyJwFQwSesKZtrFtHSqvcxfjVmkEiWZUhuetBWZqVDXBWPirrzKDvUOpMpsJpXnZxWUJsMGYVm",
		@"GxREsTUylkDA": @"ipkfiBPrZSpYYYZMxcxNNaNEfOPBmLISkUQphBSZMCZGRWUVAGIbZoOMSFKyqFXmlCmqyqIjMnMjfcijEYGlUmBdEsfDeHCYaLlZDtuvxGGmXzFlHYwOXjaCnddrsyVxLwyfmwfRRqSZmHrHxYwj",
		@"FyaElbFsEIWcbUIenkkcov": @"OPsVhwUMosdQPGHMTyynSJlgiQcjobjIXZqBUJyfUHsfqTuRKJdKLaPXYHRzsUATnnZNHmPRdCyAnXSpsYqXqLMUWoNJHcoTVbODgTiwJsRQkgoVVQVXaQTtFaBGONOqhiyHAwnpLZGFbBtSSW",
		@"oeNDCTJHCflmNjLe": @"fbCvOCDIrKhNcktsEgqobHyYugmEBYtMHWbzwnFABnraUQFpyNhkrPDaWHhtrCLnbfJjuIHZBusiiayJzRHxyEMJjnQwkcVsBDPIufQXDJxBnpDGWoAhZrKpNqAtdetK",
		@"JKSkTXlLPSdKbkpGgbL": @"sDgFlDfPKqOLtUuXpcApgzOhJdAvSlgFYCcrKOsmRgSQHqYdSxgFXUdZFJUtBWHBrxZGVlgBUbpRaPhRaXvAGtsaQXKREbrKQdzhjTCgMKgwMVjMUcaJSTSNuMhfKRyZ",
		@"SUrfwjdPruoRCd": @"sPfKhGGAdjsUYAcsHCIAkUDpwPtakHOFmzThAZpXQyTVEZfywVqKVBqkIkdgXimVaMEZTXtyalSvgJzSqZnHVYxIvbSmqrGmAyIzFfzd",
		@"bZDUXRwRHdngQjuCgl": @"jDXIqUDumMAthOyCyXsFwaNVaIRhsZtdeDWrzgUWsIUYkMETBObdVyxYFcfNZJcPzPJWvfQaOETBVYrGdAVXfCMWXvsWAJncyBKEkvBbAqALpJyMeyKKFTfSIjxcYecpxKuLvmpouOdkEjn",
		@"wRJntPxEWTEpibSW": @"kquweuXPNTlSlYEYEHFmrAiwUifNYMDeznUBxtulEVVhXZvVDuEPIpgPxPLfBbdfTegXTpFtyqAgKTibllZxcmXKiRWMxYNTggxhZviHWSFKlmcYggGjCKXZmrgoLxVmyqAiCMjSlIwnrRoKXDD",
		@"bCvghGpPVEavMApMKYFqU": @"yjSMsYoQdmZBFSHfJcZmEXkntiLPvFRxRqBufrkaGMGLDEbPgaPnqtaxwOZYRqNblVbRIKVVkalFLvTJflGkpvvdAUjIzgqAEQLbOpWYNzlmzZYOOXqPNXtCwRAdtrizgKvRFAP",
		@"hgqpLCxpGldIDCvM": @"QPQBRNuWyNMBlkShxNHNyhHOWppeWAkDeymCIzMFajOdHHAVUDaOCsdNfwFCEiYbrIDoqVNiPYsKqQMuEjcZqVIHlOdLrCHFZkGSipKCbynpFwGZmwncTolBWL",
	};
	return KlYuEaphIBYFpdKY;
}

- (nonnull NSDictionary *)TQwhcWPogbhLuhGGfvOyq :(nonnull NSData *)DOIEdeWUAz :(nonnull UIImage *)kEnKnLVEGroACL :(nonnull UIImage *)jGqJDRdyaBmETAgIGYw :(nonnull NSData *)yLwmLzYHMFiNiepNepx {
	NSDictionary *xVTUWIrWDod = @{
		@"sCTQkrdlMShkNaBRzsRapAOH": @"HieoBiWykNBAVPPmUbmJPiqzLTmEPeZsSQUtGnmEwKBZONSuVlHligPynkqUnAYWsrzbMfbjrwwAaikgdMVcexkEIsorwbxqJxXONukRQSKMDLtQUMvSNUjShqvbmImpOGC",
		@"KTPcccUUPmnUj": @"zrUfNfUKwWBIbcpqrexWVKfKCyLILDBoMvhrOoVDjzzEKgvazaCWImphQbfxQEXObxTuWDLuqYiCtWJMoyfJiMFNADgduONxZuwRYwkEdrlLNGzIiXIUPSrvQZRCaJH",
		@"dYJufCnGUzPEIQFiEsXysSR": @"CcuLuFuEasKzJWCCBNJgtPZnFmvyZcKFHEUJyiIVBkaEhWWdQIlAYjGqVpLEDWQFXwXgrBjfAxAScIodANccXLQPdtNjKLInnDCsXpyOVflbYTcluPQLFvsykekARBnBxZEAsQvHTQy",
		@"NzPYZqPSsA": @"fqxIUwYkIgvukZJZNlHgjlAWNxXCCMBPfGMLMALHLiZPyqPvGUbdNyWwXUUPfVENdsEPvgxsmTeXcENKuyNpQMbaxaEDjeeLyYXHTOMOWFHJWbjYlCYWgX",
		@"GkaDJPrrvPrm": @"lArgrvhwywaBUzkzBqYOCMMTZCOFWuyWnPuPCctrIfHzUraqxiiAFwqTBFcCsJbvRCCfizFzAAEdxLczFlfYYGlsARJqAfyItSMRTdPwFRMbNcOhsuPGdPaaKFAORYhunfqAeLRMNImKRKw",
		@"bXPfAgMsdMr": @"AdZesJkEPwajkCgsfpIzczurvsngpyRuAEqNieuAqCrHlfzwHxIPriMBYrCeIHawCFPcGWICLredoqOUDccXbDtcOtOjGoTQCWdBlApGpNmXtmvlpiKikovcxsYYWXnwvEz",
		@"hCeCYdpNeNRxzUCFkyZ": @"WvClYJUlgTWJaheAJFvcLTtOCpuAIcCdOxSmklQSKLeqpPpugwVkcTbyaKuISYVyJjtFTDshwPjsRtToFnqeLHRVZzEFoYTTcCsqrukxtfyjekwiolMSjONutouCPiLqGhxfi",
		@"wSHeexekFiFnZbkzAHJmgAsH": @"WRrhMkrOZlEfANWsWpjMYidRCcVXleSApOjEpchbQsUoOklVKJIJbxnEhMBCUZWzhyxalEQlCRGxIwNcYoHeywkRiQSDJkafMffqktZDMQJiqULvfMyeiJGkTUwNYcRMyuIWICq",
		@"ULroTbzRejbQHFV": @"chcIdqqhosOhjVeAIkeCIKTNzyWbBOaTvECOkvtMekkdMyEuKfxwfNcKDlajGPhDjsbVrqNfHjSeYCfZYmEmOwrSxsjOpTEvpnFqowlYosQSHLjQdPCJkIW",
		@"bMDAWKcvgwRfzKd": @"KtDYttqScYjXelhAtsaxINNayrBVVgzLGyfWMiuSkPJgSTCnCgElyZNvBrdXswXINrHqeoMaUCVKkUMdgqawcZqmgIYOwmJtIVjPABzhJIFmXNVpovaPjJfFSdIiudnYBLhQDqiJTLuaWZcBhX",
	};
	return xVTUWIrWDod;
}

+ (nonnull NSString *)oJleGXlCAoPdn :(nonnull NSArray *)SOAFwGOojFgxNoOjreZqeSpW :(nonnull NSString *)qdlkFddpgBd :(nonnull UIImage *)VQXtLojvSuwbvZviMVOn :(nonnull UIImage *)vRupbUdgeoenwEVHExxT :(nonnull NSData *)IXCiiacgrq {
	NSString *dfRFUFudjjJGiXSlBKkQIH = @"THYByGnGUzItMgHqhZWimxulEArJvKbVmpntiThMcPrqYeUqAfgBjstQTtVTVamzNhaZHIFpiMMAuVYlHAhBzamrLlqVgkvbEEauursBIjnPYUvEfxkGZlxGFbjurismT";
	return dfRFUFudjjJGiXSlBKkQIH;
}

- (nonnull NSData *)hOXeeRVLTqPPCquoMKb :(nonnull NSString *)rTGXQoiTYAlqzQi :(nonnull UIImage *)CXPCfHvfEjtmq :(nonnull NSData *)vhjtNAqupV :(nonnull UIImage *)KGfmIgksIAsjcG :(nonnull UIImage *)hjLpekSRIaIkqZPpGUL {
	NSData *BkWDZOxEgq = [@"bfkOwEUMALVdceGcVyqVrUZwqJbZDIIXtkqSrfFctpkEuygNDIvHiphLZsHyZrhWgFkfxwspvUcIWNxmIVpKbkRCWNUSmtOBbFwtZqPtjQGkHDbDPjkalqwEGKnWqZgpdWZVFW" dataUsingEncoding:NSUTF8StringEncoding];
	return BkWDZOxEgq;
}

+ (nonnull UIImage *)cINAEilkznraWjzHkUWK :(nonnull NSString *)fcBGqEBBnWjsDNcJHQ {
	NSData *KQiTBtvHazyOiBZJTl = [@"DyotBOQEmZSqqMtUEjLUypwVZKzcAPcsZxhPdMPgstkWSNzjSxklsIkUlDicqjxkutDghdhZNUfYpoiEoTBSjkbTKkNPbPojelqTvnJvMhdBdKTTD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TygVEmeGaeGE = [UIImage imageWithData:KQiTBtvHazyOiBZJTl];
	TygVEmeGaeGE = [UIImage imageNamed:@"BqYydmwszYzvAnLMGnmGuLjaIeIiAsUvAsifRnWbnFjhRAjsUmtRwhDXKqMJueFaQzaHzDiTxfDeoKzIehRKNSbRdfTibOovdmhqHtAMCKADUzETpiooAXBhQztMZsb"];
	return TygVEmeGaeGE;
}

- (nonnull NSData *)clqfthHWzYyvJiXHMVerh :(nonnull NSArray *)qqdMNYuMkCTrQuuUFryX :(nonnull NSString *)XiWgnYirqLkLtZWVQa :(nonnull UIImage *)WwBbbwUZPnMUJex :(nonnull UIImage *)UZgJIxwExWpOBVsHomTyr :(nonnull UIImage *)JDPCxiOUYBaXpSV {
	NSData *SWAzToXWnOPfchQJv = [@"FNXwztJkrEWnqdfxhYZiiAbQhbjbXnsJkQqyzNxhoJPETiVfQsqlgeTKMQayrBUBSOJvtAbTdcUsAtloFpRVmHWXlMjKuMMQprwH" dataUsingEncoding:NSUTF8StringEncoding];
	return SWAzToXWnOPfchQJv;
}

+ (nonnull NSDictionary *)bTTxqnlMGmxPyngOeW :(nonnull NSDictionary *)DxBYIUKfhwsxTbVA {
	NSDictionary *ByhRfYifehHSiAF = @{
		@"RDfrcWwtmvrANbtz": @"nJKRvgfGSeJABSGahpSviXyyLCxDbOqrhDNsmjNAPOiDXkssfMcBlVLCrzkanGkmTVQfVhnfdgRDMNnAhYPtPDXNXbEHzxmIPAFMQMe",
		@"QtFdcWvyyCurMRVaePmGEXwv": @"ytFLenVGzzhahAzXslCbdxfHSjEzoajhczgMTrgYHAAuyrhpYuUXSJthjABJwCpPeyezkOWwtmWYgpnjmAAdTKAEiMHUictLGioEChWMQaKiyQKsXXCBIReASRsxh",
		@"VHTTPDyFAylATWSyCqUMj": @"nEQXaDSmxxUrMEIhEJOagJTAJGLHibidtFViNgmSbLImIIDwnyawiOBoqPgxlXXucwhgfxgtqRhMXHMfXrJCWGimwZmuIlBFdmIN",
		@"ToKsPMujaycrfzGmYsWaG": @"sQMhyfatfVlwQPRMCUmWJvLVrkgYqtpfBUtvFCibazfVHLXWODDpafjQvSrBeYxOFQCXkxaVurLWRXppBxRSLMoyuoNTkBhaTxhmTt",
		@"aLpuvSnmgzs": @"sOcgOVDZQWRiNIUgZideyMdLMUBobbpQktBhXrIYKOjVhVlgsoaLdGgkZtTzwjnRpEGwnIZiOZmYCgdaQCsdHFYwxIMnMdmVQWwNKJgyNuZK",
		@"eqXUBuYdQFiwzRYJgN": @"zUqtxqqAgPfSwAlhvjvnOymectayVWJysZwrWtfbXZNHvewMEJenUYqbJtpRLPZJVGtUPwLdwSuJgJaVhxFPxpXndcCwFdicbhELWdqjXEckKKpL",
		@"qycfGzsQSbgiSB": @"pUOdQfAEAMbsFeMYNyzWYaLNamzyfiCFUreuqliLLmzvnCOHPLkRXSiUDitzDRgFBkxbsNEQwgYBCSzNWXhBpwfMgTdrZvFfCFPFeCqLBMCdzycAHMiCNAYKDTTyxvGOLmBerPCkJiNiL",
		@"LIgTajwkhNZDPn": @"lngsMbtMMZygHuuTUmgjaScMZowCiScpbkHrhwZYezRzmivpxoajTqoyHTRWECvzFnFtLWjCmwfRoMBygJOikfsBZAvsRPzkbVseRxyLBmnDdtcZyioEMhJMVMpQgaPbPxjUEGGydeF",
		@"bbKRQevRNBvuLLOIDXJmIxpe": @"ZTxcTDypMBoxyJNzAeGtOKiSVMGMqhfoKAzRDsKmhRMpsuxKxSpcClwvoNZIuJsLmDrXalwVdiIGYJFMCaPthukzatbDbmYbTYwsMHfwzEeUkEMLTDuiPaQDbhmYSFahDjQgEIcBlyyBjxnIoEq",
		@"evFUNsObMCJub": @"vZOSSQbPcUkJnVuELXCUXVWlJyQTTsiKnGuiPwSyNNlfTrqMEZjYhVzEdRisbmIyJxjviqXsgkmZdiUMahQIIKWyaqqRTfxupcwznPwrZvMTsPIHFBdM",
		@"KLNaNmZHTwW": @"ULAQLgwHIrIEvpiYwfeSIsCRkcxbHVBRVLQpBHgneWyjNHiZjDTbEcZxiXlJRcNfubCtWArJOkqLPKWsSuVMunqWcpPedlDBcrajqrRuarVtxNAxZQFrJjJOLgqnEWMJFjCpvd",
		@"YvAHQpIaAEpivZWDyJCeepy": @"xCPWIZotvtSlWexdrKjCCibOEiUPgVIZpeasfmvPvuvOHlzrLpYafdZiTICeDcDnmTcyNoQqlGtogSHTyLwfMWWmDOWwgcdGDHvaUUPRmQaKxrcDAVseTEJAsRpXnOeni",
		@"LHvidMqSBekOSPIXEVdayBYZ": @"rnaCUgonFxXSOUkvcShEEyDXZpvZmGQTVcHSjbKdEpqIgBcBNAZuJftWeGOLNiKwKvXoJqjAqOSvpWvHCJgtfXCwboCGTCqjUehntxVPQUjvDahKfYFDb",
		@"kTMaeTCceXFFCcPm": @"FltdXHOrQgfIxhTWttagTkmXHSTPuRuLNclaNYqVIbhbQpjhvhpAdoyVuSSsQeZdmKFXNRmQZCkLgFuNiGAaXJyWsSDoBuTDBoGUzuBGYpDy",
		@"WkAWHjvPoqCktgx": @"SWkAxBPRQMMOiANIsUKeOBJEeHRGeLzDmaQQemHmdcqpGyeLtkPKrVCFvYJVzDohZhwWlLnPoCHJqRlFKahDGgXLhoeAjMjyufmCsUyVqBQQyGyMeQwkGPTuhQOYrHjLOXlADQbjufqQu",
	};
	return ByhRfYifehHSiAF;
}

+ (nonnull NSData *)sJzzspDsvIY :(nonnull NSDictionary *)sKOZRSIHcQeXSvC :(nonnull NSString *)NLIVvcNesg :(nonnull NSString *)dcJdqfozNLKrAYOqRnW :(nonnull NSString *)ySbaaFyQgnmTw :(nonnull NSArray *)CeUfarmdtf {
	NSData *pRXBrbxeNvnDfIdvvhZrE = [@"ipYMcLvRwsuTBgTiQcTGknezBAwvYPjCOpjvsgbZtXeblFIYxwsWLATbmkhnYbDmBXsWgCVVgNDntcItGyKZTdzjRLqluOhngxeWIbdbPhVBIkTmFiYLLDiMLKn" dataUsingEncoding:NSUTF8StringEncoding];
	return pRXBrbxeNvnDfIdvvhZrE;
}

+ (nonnull UIImage *)GAMqbIhDCUGpUJgkEqV :(nonnull NSDictionary *)cliclciQwBGkbmj :(nonnull NSArray *)rqtSCtZNSYhqMlVIBOQIqtN :(nonnull NSData *)qCHImNQACgzqurdc :(nonnull NSString *)DPVrXhrFWHKAuHLNciab {
	NSData *WcLRpEyfteakZuKOEIjsxOaE = [@"qzHgyhefFaQdLpevElEvJPtBJufHgJLcrlGtFeiWJWGhoWuPOeVrQdASuCmjGtwVsnpBFLPmzaMJDcZkPuqtEcQLmDCZGpMPTdnizsZcWDTFIIqdiggaktGRrcvmFGqrHVX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VEnVrOuxUiyQNQ = [UIImage imageWithData:WcLRpEyfteakZuKOEIjsxOaE];
	VEnVrOuxUiyQNQ = [UIImage imageNamed:@"BUcscKDjoSbPtvmHokNUIzmHQCVigxtLTfFjJmgBXacRhfrWuspusJvknOFZaeinHPkHHWCoaJYWnDFDFsxnoOaNOdUzHbaGYjgpejtZLEftdzRVsBoTtipVfbbtkFitw"];
	return VEnVrOuxUiyQNQ;
}

- (nonnull NSData *)YIYBlIhplSeuwoZArqHUzPD :(nonnull UIImage *)njOMEZeHpjU {
	NSData *FUqaCmQpirMkv = [@"DQzlmJshAEZJWhtmDDwDqjJitiKvtdieMjBKKRFQRfLZazUxvnQkxSKfpfyWmYxjejAlhrjXgxrGgBEYkPTwtoKImvACLvuWiHRpNGSKtYlDtbeapmgxthJfEVNmeaKH" dataUsingEncoding:NSUTF8StringEncoding];
	return FUqaCmQpirMkv;
}

- (nonnull NSString *)uZLxVLaqXFM :(nonnull UIImage *)YSJHlHCJkslIxcvAqHba {
	NSString *fgHavQsTFiajQoVP = @"gHGsXBPULcUDWglLHnZMVKDxMfLxUnUOWKRsaTLDDijqactwvwHABUKsYjdwNrwjsmDUukNQnmfCzYMopjsVFiiVYjEzBqFcsSMCTANBct";
	return fgHavQsTFiajQoVP;
}

+ (nonnull NSData *)HkkcyMIgAL :(nonnull NSString *)KlqEthvMYB :(nonnull NSData *)BvgCRDMzrFsTAx {
	NSData *bTdayvnymVyFdKcIbuSes = [@"kqlwZbhHOBTMcvydLAGkmIcCscaMfwBPWSsRNRuRMfzRatUOZVjznhvaiJHhoGKSVMpGGWRlJRwMkFKvrkiMTRwsMXtQgCrXbkAHPIunImEEOXpQlvoUwhdBBKAMcH" dataUsingEncoding:NSUTF8StringEncoding];
	return bTdayvnymVyFdKcIbuSes;
}

+ (nonnull NSData *)wpTGsXkAjPJtDcK :(nonnull NSData *)irEOPAdbZbSWdVTGnqHL :(nonnull UIImage *)uzjsCTLcIowvUdKnErOYws :(nonnull NSData *)otgRMzxCIwpezKBIGJa {
	NSData *WPUjzCDuTwPZOgPDFpeaSrQb = [@"LVNewyfDuoAsvlnFwZiadZgjuCDvEWKiDpWHiBLWsyLCgTeyjVPzcUoKLUJCRpbKtVPPBLEvlNWYhWugDCozuglxwbVdBkheGbwegHOIGgINSNrjqtOwNkHxtFbWBtxpIZMCYtbgNJ" dataUsingEncoding:NSUTF8StringEncoding];
	return WPUjzCDuTwPZOgPDFpeaSrQb;
}

- (nonnull NSDictionary *)pmShfqElQiRmcZ :(nonnull UIImage *)kobfMdHhoNeezhKNftpsr :(nonnull NSDictionary *)xvSrsgvWrDdOKOcRxebVkLg {
	NSDictionary *yiiIGNWhZYe = @{
		@"HSKrhHiYGylFh": @"csHIgDaLUpdJehUbnNWTTOhWLjdCGMjtdbvVQnkRXxHeNSNkLLWjQJUuPszzASmBKBiuNDYwhZNZDIWPfAXVITftbllxpfuwchcmVnPXYYwCyzfxSRisvhNfIvsfa",
		@"TleOninQDBBHWjEhzFJnn": @"pvfVRLmojDhZEXopaLlCnrNhsxQbjHpBcgQRbrcFEzttxkQeKIzJFulfNpBRLzftqIOtKxZxkOUhNxxDkKFqMHpTrbuYZmLtENIzRLHZLGYzFoHHlibDcCCjZWTRWrBxmUkPaLOFjrLBqW",
		@"OBQPcTXAxpl": @"acMpfgWvqMBswqqUZcUtKLADInwcthhIfqubuzDFQcTXKOaaBTSYhyXmKkyasbmIWZbuCqHmyIeBwghUxHHTrjazaYWVbqlRDIPTVFbQesKPRAAzFiwCtMdVBsFfQbMfVyjCwdirANxlWrbmMp",
		@"ZzdqFOoPYcHjH": @"wyDYCeOWtFNbTJTPvFshhRoDOLtoibLfrFLSnyEKAntUTbkasQIMytlZfOCbFWtPTjCTeKOvsCxSYQhvzQlZAseOHTlhmdWTFAqe",
		@"HaPSKQWnMWGOadwk": @"WIjsZQMJhdqgUufRFdnhpTNVYbCEIgJcroLJkfdRjyNAAmiHLVVsYkjlETVOjkfFNOuzAhujTbaTXxqDjiQkjiLskAcUEZRsLxBjAuJrpOmZtMWUMCYjFJ",
		@"YOTLGYLplOEmfgJftBl": @"fkHWtftlUiohDwdxARYWDvJkSodOtUPatEWeztopDOqXntOaxrgkSmmfRBiyVbwvqijSmIaGgWRMmGHsISWiBjjLxslsVgQqcYFJcXuSt",
		@"eLAtMsKfFtVxksZUoEcOlsN": @"OIgSxMDGGPBAbZZObONSOuQzeYCwDTEkuDTKCfywvnvplSzkfVaeDqhzbKyHjJAbmWQAprlhyMIeFMMBLvImdOKyIJglMjdAgjHirxOGzbBjsyFUiRDtADtddaCxAQr",
		@"ywYOzwrNHkMlMg": @"NYxNjkIdgAwCNLirGNnRXXReJdASfOYwkXBKflFXSSyRJtGlYnJmuIDMFRbtJlIGrZmnNzMAEmgbilOxwvKnQAuNucOvhrdiIqWyaZZGzRoqSGZefTsqUlbgzILpvMlAvjtHTPdMaj",
		@"zrJdYqvRujHEdukk": @"jNCQQCeLYDILnStwKtxjPJmsOlODIHgCXSHKWtgUUXZEdsSeJNEcGQywKVSFlDVFIxmfVreqXHytOVsZlAUVuLQVPQhROEtEGmJuZodcxQfmNLeytuKDa",
		@"nJodypcyprpXZFtYCi": @"qVJusXJTwbddFpiaGKbPLVQWtwBAFdTCZNSbXvGaiQHDnptbdrjoTFhsdcEakOvRFWsLVQONFvXfcoOdQjVWCgBnrWehYaJBSdaEvbnuLMBbxQohLNZeycGanWnptQzFWdXjFVDfNvbHyDKVuLn",
		@"JjrepkbXRCMJya": @"hYtjfdMypOivlLsNcTjPzjEBMNZhEVmcdDombxmBLSKzgruYYWNpQPjChaUnmsJDTCqAqkNpbBssfKQKoSxMziEdQBqMstaWhbLUgcPQIVSq",
		@"hYJLXTqJKRXzAhLxvkOKxu": @"JDMvcJhQFmUZzrjALFrGAqticmATFMgLyTkUeGBUpeBCXQFtnMtwSMropryEAnJZqAQJlJlimNhYdQNRXJkGGhIfefzHSuzRCeiuRovqN",
		@"AWsBuCgDvRtofAbJB": @"ZhyOGjccwPiLYOqXHMmMmlRsyslpeQzkgEeCbtKtOFYEsXVjWoRkjGsnCxUlnvwiVJFdPbOyvVNfTwEfkMvrPuMurYnlvYaSAQbdgxNJQlgieOJQeyERZWKuntEoSQYVMCEKxVhyremluHPGsTE",
		@"OStjahHUbicHmJKcYxoLqrf": @"ujZnMXnLutewXZzOiIWPAXZKWwGQeuHmvXPbaXrcJEIDLAVPJfEMztQEPYshCEjDxyHVbELcyudSKVHGeyrIauRRvHppGAtYkfXlIQVaELMDVgoYamhOf",
		@"SHqZmqPvxnXeg": @"YBkckGPhUfjkDoQUQvoWBAoIpioTgpaCqSpkVKbPzVAfvIVfzNKtsqNJbfScWFMMnTgDrzUFKXxTfspefOHjGujIeUlMYUXjtlrFNLB",
		@"tOlBDaBNPHoqkhIM": @"HSiDTPfruyBAEWwEouOVBEnpFTMKEyRrLSNsXxISwlbpwTFhGGiHyiuOnyhLsZZnWlTkveicgmpbXGzLunHARNDQYVqRDitCYOmDqzIdjDaIesaiZnSJQPukJkbXukYqhAnN",
		@"UHTDmoUNCQduhAlWbMcWI": @"hRCIIHaIwpNxIDmrXMsEDLGvhtVwMzXBDFENKwKVVAnHjOYYmgFrqnfZeVfEoijFGTqfudJWBaQbYgvDpQCVazuLXFBWtqwaHvYNRHvcFgfvpXowQdmMxwS",
		@"LegpiSSTmleDlvKNfMHlqmz": @"IAAMLnhnRUEAGgzwEHIrTiaSFQuhOarntxatqBNxjpLQAYhULWtmFoYpbVkfRQaqErlclLXSnvBqoPPjNoCciuYDeWTDPPAupkKYhODbmPfOoeLPGmgWYecygiYJz",
	};
	return yiiIGNWhZYe;
}

- (nonnull NSData *)LWRGLhYxemhdYyoBaMgkE :(nonnull NSString *)JAVDtSNFZyPNRhsnNGo :(nonnull NSData *)LpPpigSTUUnnySthcO :(nonnull NSData *)ilGnxbFynPQPxaCbQVXw :(nonnull NSData *)taXnEbwcawpMKqhfUdstgFnN :(nonnull NSDictionary *)FhdrrlatzNmQ {
	NSData *MlMuaxbcqA = [@"exVZqtLVmTopLvlmylziBaMWLHZmyyWehCmJVJiccXGaMSGsNvdOQAvBrLcxrtEUoGncIxzWvaTPhfFNIdoFCODJJGQUlfzByMdFdCRn" dataUsingEncoding:NSUTF8StringEncoding];
	return MlMuaxbcqA;
}

- (nonnull UIImage *)eKLwtobBPeCjAjhk :(nonnull NSDictionary *)DvSuwTnncKNmWRWvl :(nonnull NSString *)KVnJaZERqLdveSmUfadiFr :(nonnull NSString *)ofKjZtnldfcxtWBRmNlEAGzz {
	NSData *ldFosEGdXBIKVaiXPVzOM = [@"ZEMjKWqEljtNSSPervnGUbbPWDXqKSsumIcfGtoYNvRkMDTtrhSSNbIUAZznoWlzKIsgLTkjswBoWtSqjaJcJTlrSsmJcnmbvAQyOiCyoKOqdmtmiDaWwahmMGOdthwUgffRKQyJkqgGvDqbW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kuxcgHiDvrFZtixtcRnj = [UIImage imageWithData:ldFosEGdXBIKVaiXPVzOM];
	kuxcgHiDvrFZtixtcRnj = [UIImage imageNamed:@"jVoHivYnlJQBqlnsYSQrlbJMhJbEGRuhteCuXSksbmbQqDCbpXfJyciGTPmOErJakpRRfFpUoQRDvSNnZnynXJRuqnlElynvkseLjfNRmKpwQwYQrPvbvHaYAJMfMUBEdwosdpBGErMKKNVyt"];
	return kuxcgHiDvrFZtixtcRnj;
}

- (nonnull NSData *)xjVWMaxFJilGA :(nonnull NSDictionary *)EiUKQXqXnT {
	NSData *HRdXMtyrNRjrVbjPEmoHkxWC = [@"sAgXTkxyxgjclrCWXRUGsMVQmvJshMBcimwSDdZnJMBiwaPFkKozPnHhyCNhqlUtGccoJblVVEczKkZbJDozyGZFaLfsekCLqpAeXlquTKKlpn" dataUsingEncoding:NSUTF8StringEncoding];
	return HRdXMtyrNRjrVbjPEmoHkxWC;
}

+ (nonnull NSDictionary *)CVSggkpOunmOqlbPG :(nonnull NSArray *)eoKXtcRJJiJPXi :(nonnull NSDictionary *)tdhjzcwCxJAGnlhU {
	NSDictionary *COPbhseDPOjrsZKYCXuc = @{
		@"FxnPZTVIcq": @"PsrvSDoksetqFmOEiNoHsARBBbNPHaiFClqGJJKcUseHToIHHmAuWdqewJpspuZjOBMrNfkfOVFPHltoilhaoTWzZAiLwnqOoZPzRKNFwbwvWqfRvqKdobkSqok",
		@"FVGnQCeBWiNYMIH": @"rLSIPGiELXbKxyfAYCtEvXEZBjSCWzyinPDHCFLhXKzzkURWSSXcuBUumCCOTlWrDmWjyFdbBaPPiibOuoNwxioPfaDAiyYPnKqhCWQTdeOZwIDh",
		@"xnhBqHtCsfkfmBAv": @"zNIwrCIhQpBsnpFLIuCTTqMONvrsOBoiUubdAzRctXimqHcrOhkVSoDCkVeSmDppbXnSJKxtRssozocYwDcolbcsYkHBjsrgkgxOoMCaaAUcNYgVeYHmmsLpJTcuEDhYwcbKHIV",
		@"MpIFGIHrSd": @"tsAJtJTxxwVFgZWYchJJixplhQEduplTzmCUBUFJeVnleQFnPtvBvuACZppQUoIbXmthAcJQamUwTMbBowarkMKDNFTQbFQAjzRkWmb",
		@"lfJQvMMqfMMgRwXkoq": @"fPYSfOymKVBbUxxbzKrnoDbpChRrXPaACQdxOLaHshSxtfrbDSqPqEfdMoFKAdfAcmlfNMoWIBmIDAhZKITVZEIbWHKEqGbxylhpgg",
		@"ebmjcgAVxxcbBsgUC": @"zESEJAelfteRtpcWJfGcfDpyaFDzAyleQEuGJVObcCAfknpGbDonsXtmVFJZmBwvgxtQxyIUIqDGHsbdWSgXNHyqnIDwHqmyOUnEj",
		@"OKTrvRFgnvtBLurmA": @"vbFHzDZEGOnVCTNHPTpZiYgaUaxgqapICAtAILeMATjlQSkgeSwWWHKtyZcJQbxgGNnweskWBIzEhCNEnsnVbtPEqhCoqaqFgTzRUdZhjG",
		@"RsInJaGuxRJjmUinKrkSWv": @"mJYuZYzaRNLQpvVpCGCmzZmoYvGUleerMzSWcrWjUdfCWJoAAhOmgyEGtJyhqfrPDFihjUfvUHHNHHSpMzkcxUWwDEOJFyDtvRla",
		@"LjWgwoOqawtvDu": @"cTfxTpIHRcmgqnOjCojPAaCFYPdnRfqgfflvOtrkRTXtClsNnKbnAtFVJeVnyyvbfPtgsFjJtQTlBRAHcQFXPFcDBxsGpwZuMyrvNFOKftsOObGdfQybmDuICAclTShEUSBvTABc",
		@"becjGxpdWvlxs": @"VncxFiYTsuyElCSCqPewxihMhnurcwMmiFjZuZDckOugZAqrRAnPIwVpHFJnTEempOoTeFwAUoHXKENSthVGeEdfhtaBkrAMFzNeKRRKfOKgpYtANGAIsLkvhNnjdAmXnZy",
		@"pGxKUFkASmknO": @"UkdmAhaxvklfkgjooKyAXzEKpfLscqRSEepEeLrOHwdeITOlaWTbcbxMTqjHnCLqqZJNWqiEnCdRnstNWvatKavGqucaGTujxWFEoSMBOjZZOYtmkLVqYqpkCydramxI",
		@"gigUXagqfRFUMTsMSiQ": @"QXLeWMTaiVsVQUChZGSDNVGyirHxEqtSAIjMGOYiUakVQMmkmJvWlnsUHyYFrlMuTQAEuKxzficAwpBWKaENMEbTPfKFSzOBEhwmkZnmtLUTbBVRfSeKsiMFpne",
		@"xjcSjizksPbaTsKSlK": @"rLaiaFZVXyZKzLaPyOCCVyyCxESWWlhUIAEgkYOOyIkZwCGqQBaWruhFNBAoGDDHMAyFJbhLUIaGLKYUPQMoVSxTMeDGptNtrtjIIUmPcumjozrQurtKHzFLqjzZ",
		@"IiSwqGxYQe": @"ureGOnsppZhAxvosMBJTtRLjazQLpJbXfbobKkWhXxKRXmLBjEFOgEFUxgdQRZkgszDwAgrqAatWSKSlENvXdFkTFFmRbwwjNSdYakZTsXGwSGiCZxIYDvUjyQsGVnMwR",
		@"tlKdwvORqZFybyvEekVCXq": @"AgTtRFbYwbxMtphwiAgxgAUJVDddhBEtuOtSgWwUqViUPcDrqWstfxhyzSjRFSyWOSTtyjBjwklfQDWEDKadLEWpqUWRdjHRRdryJPfEpnVIuUwLhNRYqroTXxssWJpaBXabWipCCkhuPGZu",
		@"PJmoQMmLJvXFD": @"FskHDgezqcJQkifRKQBQFoAnEUYToMcJAjrNaegLEEpMFwfNxxPItNPMqteFZemeeMopOkQqkTlDldCEupqAbfnFMKFeaSehhDhmKYKINofZlWJJnRWVBaeLFsPdfCGDvxYIS",
		@"xGkpIeOgUJmRQiLHP": @"cCymcpWAoivwUYQjSKfgENVrnKTnPTdhtGgSKMMUTsrUTThYZIhWNqOeEslPEvvAPUzpzuIxkUWVthvphfnnTEIYGfOKqSwkaFhjtxDfNYDmiD",
	};
	return COPbhseDPOjrsZKYCXuc;
}

- (nonnull NSDictionary *)qxfFbryzIQxcnDzZd :(nonnull NSDictionary *)InOMhlWlJcqcbR {
	NSDictionary *oDVNnpJqlGTAN = @{
		@"uCqTtNfoapiyQFguMTCHK": @"JlvXmHTMCzdFYDVbmoIPKevVeSeRGMnVANPFYZtZYhgMbgbtKCKjRNLTuoEUjHTnWBgnTazaFgftPVfRXuJYKwvVDxHJDurBCHmtshaAkpOiwifKxtmzLqEuylqjwEkOS",
		@"qoaOLwMTtbmpJFGGAIlo": @"fJNomewpdRFLsDRoSGGiSBdTeGVNTnrkqLbhjzvnDUorNGUzbLytcXENjIXZjwhhjkQZtofTHOLxbLNJOijCUTXYsAOVQSywJpzBopAfZtincTkghzAKYiKgfOdYTrkFjqLmOFRwRqn",
		@"HhTQteWtJjEWax": @"EcgPrUEKqaOEunmDNxOPdvFnYmznYPUEZXknBUWwEnawpSduVoWJIaQUcOdVaYlflCnwzxTzSBpWfYbKeOWRqgzRNmWagcQfpGFjCQAxRuNoGcRfKKxDHHH",
		@"OGYnlctbMFHlSivJVs": @"VAUgtLZAoTnLrOZutltQivSorJSYZncWszJRZIxNuxxfmNFtzNGSLHNyGCjQhQUHBqOYCrIyLIAdwYwcAaxSrcJWnNRTCVLzjlgTcpfNGiJWohPKpdnVO",
		@"WdeMEzranIcJpV": @"zYiKNLcSStJTQigLBzxiwRVFACBJuTaTCZaTaDpmoMUeUKWEYJnqQTornKixBAyIlcbqrELSMMKJogYFZzSAPbUkIkQvwsrytqbvmkQP",
		@"CHDKlrXDMhWP": @"nieBEWsjdJMJMELyjGPHSipkqrUKDgzWSeoSwAkIFuZubhFHvxugMicDlZSUWYxArmjJVrkjVXRvzeWzJRLrHutHSmtZfhwxETulVdxryf",
		@"MPChiJOvRmzWaXZgPPtdw": @"uQygQpQoLIeSEqZbMmTFTzPpxCKkSDOxtbeEMffVIxsfyIyuEjefANJConmnQcSHLwnCnFIJpJCCTwsfftjKPKSvYqxkvBSFZCngCWYmDbn",
		@"LdBUsHOrhtImgNn": @"mjcnLRoewugnhSynWTumeedNmFoYdGVhZpnBxVssgFRHrHRAifKtSRttJCcomgdSVhvABunevgjDZUkYNuqtdhifnxYJDRLDrfJvtWMopahgjYBuhXbcDUhGtCRCNZjIsbjZgUNnWYP",
		@"YzdAqUDRJz": @"cHomPSuzIJtzSrpQuoauxfjSCaJbvPLedQEKNYyIzjEKEMTgcHAjKYiAaalOSBUIOqSOwmzEnEogRiqhMmnaVIrRkBKxSEedpEbkJkGYwhFFcvjuBdimEtMb",
		@"lUdjrGgNnzJ": @"xWhZuESJhcTObxOBXZDQWFAHrbtNKxjDUgHcpnceONNMWMYTyanSTKifOQkAjxeznDECYoMGHQMAlvzxfDjvtGApdmfLPVXXERbAnNypEPOb",
		@"ZWYxLlkxcYgFxeyX": @"WPsIUXNUOBUEBlWoKqVPfQHfPwgohXeUjpOVRhzHIhPLBYfFHZehejmsNmxgcNdSHlxfihPFtKHXhnaYBcndkzYABChptEERhkbVucxHcEXqtiMoSguAgXCH",
		@"mCmBNZIVnAwFSuX": @"DXvAivdRBkaNlUrQHgEXlHgKIlyWEVnKDYmstSSygwmBEgGrNYeBCaWpMZkHNZwmtbGGEXysLcLJFZXAKnmrybBqZBbxLzftyPqyyHfNrRaMTcwmwBYZjGsPqfDMsnqbWAiTyaO",
		@"JMBrCZVRnbzTtqsV": @"HNprIjVpkGPyyWTzooLwvOMREHaJOdaLvsrQzkEmQkDJxtKoeRwKESLheLJYiwQycJGSxxBGAXFrBxFwwukisarYHJIIDYBQGyUxgbBX",
		@"EludgeXXAXMzztdAwLvq": @"esoAtZUDrbGzZPeTMulzIDOCtFgokSTLiIFFtwhSWwcpbyZSxZjEDSrhCWbQpRVJidTGpJTSuAmFvZVtPsTJeZeOBPkNrqbzsYmoDFAWGaeVTJhcSe",
		@"TCSxKitcgC": @"PHrlufBjrgaoYSKOlfxuUOtmNNyatcbkLFPTibLKooVAADPBXomYimfHbxleztrcOFsnIlTMIYAXRcGfCsIsqkhgLIHiIBlVdyFrhpuozKhaHIFWPMy",
	};
	return oDVNnpJqlGTAN;
}

- (nonnull NSArray *)JmEjonIRopCIlAyfkgT :(nonnull UIImage *)zgNcYDjDfusmAvtnvLKQ :(nonnull NSData *)hsKBVxvDDPQDhRhrus :(nonnull NSDictionary *)WeFNToMcIKrVrFLFwIhyxFY {
	NSArray *IJQTNSHtCnX = @[
		@"RjaLjBRWkEOaKjdBQVovoeoMezRzarArPEkGFXaXQtvzxUyDLqlNZFvRcGLiqoHTwBEkqjAcwouOFfkJlJeJyIDRttDNlDMzJEKHWudFJNFcTMdaoECiKJuFSccMycKmtcLA",
		@"ZjPIqfzeLCzAPdNEpGmWuCnjsTDSZwltucHHWsvnCmqeUvkOvMTXmRqTBIUCRgRlzRTCgvcHpxyJZBJGRTmEWtgSiAfBgXhmhYDPqX",
		@"DwjdRpJajkMPAHJUeLkbMcFpbMUFBGutzxTtlWlLmVnKffFVpRReQbaFmPMbpcViOPleDWFSXlVrbnnpBCDnbRVhBhoSMSyZjfBfBVsBaRcOKHfPGnnDNWQqNypKqJeROkaKNmyRojUgRTbrEOMJ",
		@"ZardZtyFczAXmaBlmxDoHytnTvzNZQqDXCCCIAgrLRECEbpHbRksOXpHlolkyRMQfrKzVYMBFhLizLExWcAxTPIGjrfcWwrGsNEOhvAVYgFKwucFGzPtQhHSwksIIBWlBMhVPVMqQOKsnMjxMD",
		@"JAVLbFGCinFMXNGjAwWogMMIWAGPpTQXCfiLJwaqoOTaKKBVWdcZGWnlTAeIBnbmxpWNgywJTsZYwhyRQAodaWaAmUKcoxyjnDYIpfXdoesnSObmXQvNeSNgUhDn",
		@"UFlwGXUvlTUFkGKxliVqLLdabFKggvvyhSzcdDwNTcUWefwMpRYFgqjsSYRIYvEcSFNfgYGvcNecbQCXIFCyHrLWUXwzXVPpzURFWx",
		@"qsaFiTZPHSyeuYbugnsWjhwKwblInZRHAxYhpWVdmMNMxxwWjKhTgDWAJYvVmAtkRwwqeRzghYqHZGVVIvUhUwTHeICPPTjOFAOQOLpXUnsliYkPqTleqpNVZcmoXddb",
		@"LrebtSlVJTGNOFmrhBzplIusDKJOiwTVAPgGjZaakXlTcoaoRoXUVKpvIDifanTTHxkyfqVCnMoaQJsVyxHAOXcYYVBKzuEYIEukiBhdIVe",
		@"PwfdBELrTjUrCPpfRYqVSMxKRxBSxduuMXKduUXAvrNNeaASOUcKdCilSUaLZuLgwxuwwMuigObdoTCErOMUWAiQZvDpKnYHjlDpWdpwOuQvxjLeuYFRnopVttBlyJfaWuikWncVQpnpPfvx",
		@"XvDPfEODxERScVTxIYTzYXmbwFWveMAevbeDVdDAjOBtjLDrwOzpQmnpZSkJZcGrHNLQuAoLAtFKQYehaqikvkeEwVnHLHDZwICAsMXcZHsvKKLXlqVQpOlaCRnayqlyZZYkJtFNozdic",
		@"KjWQAQAQFDBPtuBBWpYIsCmUpHqTrCIckKjJOYlUKDRIIsqiaEJvttDwHwcuWvVkcsFpNTxYJRVgsqYNlkwuOxAtdqWJehxJouTtx",
		@"qTvrLtRNUofKekVgsAvVEXmnTOblDliJyfSqZpZrATSCbIBrTfMBLaxteghLKXYCMYIfhJRpTMgOtAvPrOaddDXbaFFOlQwJvirM",
		@"mWZRQsewtjGdxKNMKMlDcqcpwlGCueYnKdqyFiCiTTivycIfWBDizbWIBVBuNcdpyRxgmVgSQuEWYSTdqKcaPhEXPmmfOpLnxqZwUYPaZwEhNPzJiFeqyDlTwGp",
		@"TaJkUzxGPQbjxkAfgnaqauuyjiFlemxjABraNSRaNNtTRPSbXdUwIOFbuzaEpQdivXdGZZeVBzAVNGIxMjlQdXPSadEbwjcjwXwE",
		@"RyXlNJuAsKxLGBIcySPrHRJcwMBSyAnffiqCjRwpLSaxlaZlupKIvLzVZLMKUHhKPJaGLhcKuKtKXOzIiGAEVHtJabwOMOoNJYAKUnxZyKh",
	];
	return IJQTNSHtCnX;
}

+ (nonnull NSArray *)uuZGAtHmODMzRJOUlyleX :(nonnull NSData *)rDphPDrzWkbpsigNQhHH :(nonnull NSString *)UvoYJcniTymQbWTypqPXv :(nonnull UIImage *)BswYpPRCTuuTScjmkDdA :(nonnull NSDictionary *)cMdwuNVewmuGMVVjF :(nonnull NSString *)syzwTmvDALcR {
	NSArray *OWgWuBclLqrkzXFImuap = @[
		@"XdflTPmpbuLrojREiymtpOvadYdYffxWyIHOopWkHmLKEiQPTHFnPtxHSDDUfRpPnxmUbqOkEjeFzdBzFXkvKiMuhfqjayFJNzxbWlERGpPsJAgLUl",
		@"YZFVtaObgBiFOGNuaRNrQlITpvkHvVGLqapsaYnOxWOZkvAIVLfJtISmAdVQdxlrAQmJEmUhxBGRBuFBUDrfKcuCMkUlRgSQZUyUXqRTfNfSEZrOZcwdsFPJU",
		@"vPQaiZjiIbTusGAPFnIPGmLPftrgLTDAHEgGYZxHGzyBuUxsklmtwxtkFEJbtCvSjFyqeUGHjZBnCBHymcBMuZvKEkisLXlDaRjQCkK",
		@"KTpBVNCvHiWcxPRgTPBcaaRgXSPEDjSqWNpIUzvkgnEIKunVNJxcSbkFTokUSmvvdBYfSjfIVKBUBSjJAMqtLbyaSCksugixXKEPBPGaICyG",
		@"WolDuAiQyyMvFMUafOoDBTwqfrHaBGFThVjymOVegdylovLLwfxGGwqejydnWNHhErjdBIvoXhOGDomXucxiiOkhqyAMzAkfRZTBQWBYQzkTjvHRaZyrzrHZMqGrbNVlOhVU",
		@"rpYqBjZjCSysQYKeOEckZvghcFFKlXHyIicJinRfBRNHQTLgwEkxbjXYuNowhLFrRVgYOyGJmrViuqPvKAUBuUioJibIGNDXJXEETBsaJWYyfsQAAtOVBueyfrLCCxgKikMEkpsPz",
		@"iYKfAoLRopIrhZgPEApNlLhoKwNlYZFzXPLcsGGJwKGgBVDvwyBIYARkuURKQSGdtVztUwDqCiMskosGUvdRtNmJdrnLkYcvEPYoKvXiGfVChKhZTpzjISAtgqXTWDmTyojYPQpSvhCXQU",
		@"TuRQzfNPMtbCgXLAFtEhsLwfNQHuZDdwQPhBczpQJkfthgNzCRQKibhXxdkFLKaliZuAOpbVaTGWkJcfmSFDpmIBhojzrXLcnOsiFhZQFppylyLZbekSnNBv",
		@"UEeMEbezDppEMnCTSJIpcHZvARiFCRBhQxlUSrJGmrTEXyIwdDDwYKGWFoSYlYYpkaIXGqDbUBILEGFqQFqhyWwtRsIYrnCiyqGwUdpy",
		@"XyktaHlXjFQHTHjJpfBYzjlFIhubmZKuzgbgbobujhHnPhAxWBhooeUtYlqEZVbdnOFqhQQxxNiQeqQkCLiKnEzMYKQRboKbcXpXcXExSU",
		@"VheegHHffVtehFWhQBRXhjBJDwQTOMoZZduvDlwcUrOkRqTIvmjXdCrGEsPsbYOFSnpfjTEdiYIanbfUZHhmlgzTeIOsvUNiYhCuosUqTAIlSlPIYTp",
		@"nrpUySzSpvPMAVMVrnKpoNeViLSHMvVSnzEyIABdUXMKsMMlvKyvnFPgkrObroZwREGmtHvuJCmJtuevNbSMzdjGIFwFvaGRLGCOYVtYAuPnFbIBiZNdLDGfMwWevdLPxchvtWbfAAvbGnjZpScA",
		@"DupgHtYTNszoRBUuQXsikFApnFHKKOCHccHIzTRBmvdORiOzWYhImdUynkcSDovprwNobPofGnoNSUevNshAQgXcttxLTTKXiRzcbXICRN",
		@"XoLlcoSManWrFlVfhfqvTrigLBlmLHeNzqLMLJDeLgiMGNQVzGssKcAtswSXllzHPPKLhyXXRbzhqyIJCjPTMiLoMeXmMiEVNwtceWCGJRHslMPpDaaWD",
		@"uQKzJJkleBmsdzzCqumLkClupXkiRkuCdyTyemMRMSVlUDchPfSLjDAoVGvicPGfwoiuFDJgJtctVszTqWBaWAuNaNBNdgiUCNDZiSjwsA",
		@"UHRqcwmznMrVKxzZmsUvBItFCxOMrFQhIPdaQdFdgKxGJblKUqZKwFwLTOuJmxcNdgZHKtQjBxHvXTZhxMlBNBqJtNOsjWymgfRATBWaNpHlwmkUrVryJwSHZSNWhwociIcON",
		@"IvAgYDBhxwYLJuEUVSsyhgYPJHMlZYEuoZRBSlQhUOpMOWVvWqyufJOnVrmqtPOKTMRNwFwuHqGczmnJGSsfDmXFqiQJHqdXPIrUxhxzqNYazHVQbYORn",
		@"xjpmENZYsnlFAoXFDZzEewhJCTKZyPEwDOrfuwkLTTpYgiNiZzEbfnaKdYzqiMQWhTuZbfoErnFSuIimBQVNEJuULwqMaDtDoFlymZassbzlKytDbVzvqObuinioLCNANZNVYASd",
	];
	return OWgWuBclLqrkzXFImuap;
}

+ (nonnull NSDictionary *)dAtUuMpFeklrUkcXbbL :(nonnull NSArray *)gfXaqDAryQKZmMl :(nonnull NSData *)OaKqIxozUDaYxUot :(nonnull NSData *)OUZVBevmLlMJgFYJFv {
	NSDictionary *jzmNkLHxWPCaguesIiYr = @{
		@"udWGsiWuObZVOIuAItTgYvl": @"QZEDPElaHVpDziMeqRgJSewrTPUOQdRyPDmrNpdIPMwlmVulmJAKWPWZaaIvPngKRstonGdjSYLmezffBBkjVoRlPDskWKYpuhAtUPwskFxjctsnNMdNCrqNlNOxfGlZkcRBXNlLDHkC",
		@"dXeWedKpfQPlmTXFcsEdW": @"plSWoINwFBFdLbOFLeUIPYECPagifcYdUWbVqHIPpyxasOXXrMQittAEAGbnijPeUXsDhioCPWWOpWSZnhGMwRYZxPKNdADrZcIyUKv",
		@"FkzIKCjLeLFXwAHDTgeedg": @"CegsqWLSZmvvFESdhpZNbPNSCBFkmDqmdlsczOaNQwbIfnGLwgSonNkTTUawqRKHJVIncxBzNpJWYDddzDOOmFwcKVZcOozsNMLsLokxhbRujPsdjxxsrxUyRjpCrPBYuyAkYEzVzuOa",
		@"RlzTmsnmeOFetnyTqqkq": @"siNxPZIsqvxlxSfYJzxsykwLfnKYLgzvtgyeDIAOwNpCKboCvLHASZhVAqzSFrlwxOlIDoHFMForgaxafGutOwEhDTOWWtMGRvVnJBChQQDLvVhWxyBWX",
		@"mcMeXJmvZv": @"YjnKNMYmbesVsTOEBQGWKtSSXJeBuUHXeTKqLsuCbhXPQUcdKnGccUOqClUTiRTDaKKSyPwMVZxcpMdwzkAugPUYrehNWMvKiBucWgxVHERFaAfKgRGwlsIsPbEoKmKDBJhNfvMgzcTRKqvtysND",
		@"IHChWMrEMGRqpRSLCkUOxsG": @"PlFvdNQGxAnvUqNCwWUcmVEgGvjdLRjoERFQVigopfCeeWznqGzSCQnupYZjvciRNBttVKXIjamEABKfEuCbPDGderzdHwUHuROaQdgeekehrOqpSxzqASRoPDnWRlxpMGsgOFugzmMugHCEiKhyd",
		@"GwdjoNuSCGxtKZPg": @"jhvccmhFRnrZuVjnEQXSlmlOEcOwMqoAtaivDuQrFtxAZqzolTsIMROVAzQcFkCIJqErwNRdBPasnVhpSKzMVDjFcabGhenCzpfWhqQctjSbRGnNJfKVFWPEkOCTPwkGCDffOlooiunE",
		@"nsYrnMnkOIOVo": @"eVPbHwgiWfYdXvdYcOSWOFJaMXNvEGwFruTOhMrEdbfEUQBsDxvCvewSBgFwYBQGnFoVWerDfmbGXqVbeHjnXoZmZskSSzMFqSxQNntdDPgeXJyFwsduWYmXWsusLLmPuriYzUBIY",
		@"QIEgEQcJFXozLeH": @"xztrHSbdLGXzzMBTeJnAEQdXZzLaftsxlvHEVvtffYCYjywUjFkzKuNExABVTBFFMfxbvelxVacrKQVankpeCLDohszQFSKuiOFijTcDdICyKMswCNEwtWcZYsgPxlQ",
		@"YegXosDPXKDMbukZmWHQKe": @"GArlwqBkkWqoTANTKWKhenrAmGiOyvwJpcAHaybAVGiUAGlEsKfCWOVYAylfnxnXTkveqsZEiEILwUvQPsrsYWFdAjoLlldPzKZbHNLmHrLnYVLqqHDPqShmBuOXRpocpGVAiXY",
		@"ZaZsvLYAxddXbMeZVBhUPXY": @"eQZurvwAdaROyavnksoWVuxrBwPOpXjUJrGXzuarNRoKjgkTaifufNATNwzjEIwzaFejUfGwyKzZtwffZJmQgGiyVXdaeoSfJHOgUQEPJkPEsvzTEfsrG",
	};
	return jzmNkLHxWPCaguesIiYr;
}

+ (nonnull NSDictionary *)iJwSlqocgVSkH :(nonnull NSData *)dvwNOwFybTyNJZWcb :(nonnull NSDictionary *)YJPiwNdDTACxAJmB :(nonnull NSData *)PnLWHwizjYa :(nonnull NSDictionary *)qSNeHzweLw {
	NSDictionary *OEPTfvFAyONnmfRMTdB = @{
		@"ThmPAHTRaSRaSqwt": @"UBynPcYFxsOtNjDXDnAUzMpUrYqeYGtyTVufRNQVGrZuVnmWeQMeXUsUmzzBvDIYcFKAUASqeiumNfJXAdkrBBGQEvEDsoTyvEDGdFRpFCVuIuZcvvYZojIzobGiK",
		@"ZylDdLOUgUw": @"ZqmqXAPYLcgfTokdBdQBUwIINAwoYdtAGZuMFlFFBfsaJyhcDPRBrdQoQDDDeNLSnIcOPinBYJvgowlkhaFrvxPjDLNrJXzeOJpBIwbCcMGlsH",
		@"JCsPHxQDytoZUJM": @"hGGfeQxbIWEesDeaoiHrGCcpcGuWYwXOhCamlyMGnHgINrBTtCIDIcMnedFnUkJhOCTDIWDgSJwYMMFVeDbgIhNyEEVPYuPAbFGOTjAwRQGfhhlUjl",
		@"zpWGRGUqyJsYB": @"eSwnaVXHIMyfYHCmEkGZBjDOHtSTEbYyblasHNcgdKAkeChnKLMljdPSBxvmZRkkJPDsyCUTYaDFsBSMLAblqhwjoSrMXBztBWckvuCprFGDVeendokCTdwL",
		@"QcMRssjnqk": @"jNebKNxDPkGVLkJQghKnchIuJrBXeTfyvjALXeKahqNGHwaZdJQjjzkTiYIjNaJxnjBYhyoYcoilTgcTsPWzjoIuvOJzovNYHCOIacwdmul",
		@"ioXirDEnGbHRpDdLWBMeiM": @"qrpkhQADtDxGtJfsAjtrtUrBrLTjGuOnYJqinLsNwCPAIBSrOgqDEdBDsONZwZDDcKBfDFGOQUEEAfnogqSyjqHHkmFWCOybErFaQFudNcHllhWpjeeqwJjInSX",
		@"djchxnFlYlnSlpIRALAkuE": @"GtjRZKVymdUswrIvexfaTshRyWVplFYcKUzoAMXxDBcWdtjODWagUfSGTdjUtNfIBnEDwSOMcEucBmyutdBadSvJbLVOccOiSYRTXlXQVcFYMdmoNZSZMKKwZwmaZmIkNZnPCM",
		@"ykbTFipXEoGlufpJS": @"VqjGgZoaMYTwZADtTjhXZDcBKIPBJVERCnrAoWARHJsADzCyOiZmDYhVTizSciDJdYamYSZjhSSJOrfCDliYpaPlIwhJlUfAukjjulCPWgZFstpGemoJqFrqqvHhDvXjuIWIuGoAuy",
		@"aelmjGgKwZYzI": @"ghSEPygUlZkeWUISNXImyXFmblpvGxGDurseGTKKSyYPZnovkFbYxsqqnbdxjQJIIYVluBZpGJKaLiRnPZNgZRTpQjLdOoDryslnBRIKiocmZICrZIEweMXpmwSbdNXzP",
		@"uibogrevNUjCCfCUOE": @"esIDrVCAxvKEMRfTZENJwqwQwZplVNQWDjxqLSjxDWAJxbTlvDrDMdrwMwtxmpJtNqZnsRopDNJxmeCAgZqNQAZQVWPfXXeUuZamGdkVZYPOJNkYm",
		@"atbQmMMDHYvltotXH": @"pkCNjpoupREfcAgqlIpFfZkNhOuluAELCrCeIDVScuqwNoubnLReyRhvLMfirBasEBlyPvSwrZWSHxjpmzzmTUkuGOfpKXhzzHOyI",
	};
	return OEPTfvFAyONnmfRMTdB;
}

- (nonnull UIImage *)fvKlPdNFvQXaiVzBgnqRSMjo :(nonnull NSDictionary *)uMtkrlFizOLr :(nonnull NSDictionary *)tDKVPhxBjUzI {
	NSData *DrOKyyoaFCsidQKKDe = [@"eFWnYQIrcwYAZdzEPDblqkoQbCSaWupjgwPAUkiiwOJbWktKoNGQpSGQRblHIwjoKBlcAuJPVGxiZCPVGhsJGiZhnhQgOgXWUkUOBGuHERQXrmdXDDMIFYLmsSoHFKqemJKrIfsbJgE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rzJaWjopXftZJwpZE = [UIImage imageWithData:DrOKyyoaFCsidQKKDe];
	rzJaWjopXftZJwpZE = [UIImage imageNamed:@"GZemUrnPHDNrfLkeYRfQGaUFXjfKgAzKPyGQWPLLabPVXDSwoeuvqfNcVccEQEXZZOxEnmKOvhYZsKhWrhrdhqMXicFJKzHNvgeabtELDt"];
	return rzJaWjopXftZJwpZE;
}

- (CGFloat)screenViewY {
  CGFloat y = 0;
  for (UIView* view = self; view; view = view.superview) {
    y += view.top;

    if ([view isKindOfClass:[UIScrollView class]]) {
      UIScrollView* scrollView = (UIScrollView*)view;
      y -= scrollView.contentOffset.y;
    }
  }
  return y;
}
- (CGRect)screenFrame {
  return CGRectMake(self.screenViewX, self.screenViewY, self.width, self.height);
}

- (CGPoint)origin {
  return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
  CGRect frame = self.frame;
  frame.origin = origin;
  self.frame = frame;
}
- (CGSize)size {
  return self.frame.size;
}
- (void)setSize:(CGSize)size {
  CGRect frame = self.frame;
  frame.size = size;
  self.frame = frame;
}




@end
