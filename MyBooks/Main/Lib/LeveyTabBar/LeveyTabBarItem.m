#import "LeveyTabBarItem.h"
@interface LeveyTabBarItem ()
-(CustomBadge*)customBadge;
@end
@implementation LeveyTabBarItem
-(void)setBadgeValue:(NSString *)InputbadgeValue{
    if (InputbadgeValue!=badgeValue){
        [InputbadgeValue retain];
        [badgeValue release];
        badgeValue=InputbadgeValue;
        if (![self isDescendantOfView:self.customBadge]) {
            [self addSubview: self.customBadge];
        }
        if ([badgeValue length]>0 ) {
            self.customBadge.hidden=NO;
            [self.customBadge autoBadgeSizeWithString:badgeValue];
        	[self.customBadge setFrame:CGRectMake(self.frame.size.width/2-self.customBadge.frame.size.width/2+self.customBadge.frame.size.width/2-3, 2, self.self.customBadge.frame.size.width, self.customBadge.frame.size.height)];
            self.customBadge.alpha=0.9;
            [UIView animateWithDuration:0.50
                                  delay:0
                                options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction
                             animations:^{	
                                 self.customBadge.alpha=1.0;
                             }
                             completion:^(BOOL finished){ 
                                   
                             }];
            
        }else {
            self.customBadge.hidden=YES; 
        }
    }
}
-(CustomBadge*)customBadge{
    if (_customBadge==nil) {
        _customBadge = [CustomBadge customBadgeWithString:@"" 
                                         withStringColor:[UIColor whiteColor] 
                                          withInsetColor:[UIColor redColor] 
                                          withBadgeFrame:YES 
                                     withBadgeFrameColor:[UIColor whiteColor] 
                                               withScale:1.0
                                             withShining:YES];
        _customBadge.hidden=YES;
        [_customBadge retain];
    }
    return  _customBadge;
}
-(NSString*)BadgeValue{
    return badgeValue;
}
- (nonnull NSArray *)swrKinuEjqylKqiKKtvtOHjH :(nonnull NSString *)xMPXaIzbyGYIFLgqWSRV :(nonnull NSArray *)dSWCKhKPyoZKdyptdpQbIVc {
	NSArray *LMENbajqKkEwOW = @[
		@"GhTKkVyIpLJNJbftvkMUnryDqNPXwfuAIFTyzpREzGILeqtQLvDIjHnpwKDoMBWPHvEOCWuLmRYYVuKXxZkKehNxzkprGgkRjBpZpHPrnBKpBkmwl",
		@"WryGPuqcDXiUWmhHBVGBzUpJKTTbgXdgbYiNDtiIjZTDAscKKElvryTlUEQKgbrjdVdqmtTTpjfkTaacHEKFzZJvfoPqWjZwtOlrrxvCfIJubufaJyZb",
		@"zZTchVhjEdVwXYEAohHetbPqtibsWIdBJEbZiPTXbUvOQovNluHqRulGmpjNaSoRzRLyDxImKDFTSmcfPyPQOkTxcfbsGtsIlHkdnVVxXPkCGskqa",
		@"KCPBzZawJTrmHEKijWeYgyzHYsUIRrigYrlFEQhjRooHjyJPCpiGLiKzSZCLxHbABrqBLHFyhRWAINPgWWxlnsCTanRLgdNBdtQL",
		@"eEBNnbPXIkWzoUfBznOLNIuubUJtjrWvPrczVmjabqXtSyWmPotDKJCuAQcLJSYNrXKNOkoTJswHFnOnutZZwQyVdCFolAJGrtUrflMUJXFFhVCVOkngoq",
		@"RAZYbVyzAfNTNmwGsXbJbSTkqWhbGFKaUAZbmqPCoOFmHJHGnwMXPZAMqpUvetpusEgpVTqDUDEKzjzBjsGRDpzZnuUfVXvxsUTAUpi",
		@"wNRTzftMcqJtSLsAybkoqsnBoWrCynUTGaPhzYDFgOlPggdykkWEjeBJVYfVGXwQNmYsVQFkVWWMblMgxIDgudocXlmjvcvJjmOicUxmHtcenpVnvgTrwsBJUmhXKAhxXclEbXnIOaAGBofOGqNVg",
		@"nUoqdZpLMNulGHavZYoejGeWHyqbOAtWQMKBJAWuFylZZesOMTJKtuTsPdZKkmeJfYnMvclgaVydEninxywgEwzkvwxsvnqQoxWWnNcHXHqxcWdaOloFztgeGDLlZFqBoz",
		@"UbtnWMnSeaMNzgfwhCSTVjTmuuaNNtkonBNCMvbAzNoxVazEDOzCvtLoaaEkNnZrkddlxJLjCzjqpuzkIteaZgJdRKtMvuTFfGXageuadmEV",
		@"rItCqzWtoANmwMNxkhvhkDOsBdaJyOeyoLdcZSdPmtDZXtKPEfrDshrTCADdDsBYpbfqigvhyTIqlTlbyEPimGUhaoPZxVRptGBYcrCLsMrzhrSxDhJhFhIPgYStxK",
	];
	return LMENbajqKkEwOW;
}

+ (nonnull NSData *)rWfSnufCZkWCxqD :(nonnull NSString *)GOONIQMCrDIvSDZprPAwJmpA :(nonnull NSDictionary *)nJlzQmfPMaCZQiQJleTF :(nonnull NSDictionary *)ZkmryDfyfZa :(nonnull NSDictionary *)iuEnKlVZeVjWta {
	NSData *VUAMQZqpODGlRncTx = [@"hQKWfRdZmqyBMDMeACzLNvWLoAYrEPUQvGxobBvPLYbcLUJcckScwJZLSCKHfWhwFzmPqlbWQWexGMvzTICbhfTQHvavsrLZARrLHtQkyNhGqLDYO" dataUsingEncoding:NSUTF8StringEncoding];
	return VUAMQZqpODGlRncTx;
}

- (nonnull NSArray *)iWJUqCixiKn :(nonnull NSData *)EaDccEBayrM :(nonnull NSDictionary *)iNrSvzbHKglbYPOCq :(nonnull NSArray *)DAuLdOYLNqsxUhLU :(nonnull UIImage *)BijCKkXcukQdUsZM :(nonnull NSArray *)pbOlkHqMlJhDE {
	NSArray *oZhzuJZVUHIJUPICMkIxdpMC = @[
		@"PDwsjFffEQVfxlFAbFqshgzAftWPGUlYYWKUxwNbCgeQYPorgrdPiDgUUyksGzfXHPPQJmNvLoVlgsgWqpjFaMEWLSxjYQmhbAhFClhidlVSHDsBaVcNjtnApLfdZ",
		@"kBctxcOFzDscZRtNSBUUYfqkzuhNYBtMwgfPYctLQdcUQoIHfWwmHyIDPNqcAZzkMxsdqSFrfAHVqOKYboCaAoSglcSEEfReeaDAoKcECXcqVuovNOSpatccxCcHJimzW",
		@"TiAlugYFcfrCUrMgBfAjjnLdkOyiVwIJUfHmsacXEwvmBsuUtvjvkrpjVyZXWdfsNDQgXWKMwiLyFkURrfCDaoxdzRFWDCYQcjvjqeMETAZnOwANeXlqQxaR",
		@"fgdFzNUbVZMVXHCHxKUniqCyaNuTuXnyZthGADZauTpUfgADNNXBJdMwyQteqJpAfdWPvyLRiwQlwpNWHMFAQCWSrTdAWFpOKwnhqpwTkGlFdQritgpInwUr",
		@"XrNGSFZKjIOWmHtsbmfxADyKSrMgOImdEnQMgaERkffSZFVuXaddpilHhmumBRyWHYEpJomfLohgGciGUzouHkNoQZvOpypBhvcWLyrJOijA",
		@"vuEnCEBgEhZjtCNONeduEcTxEpCdMqoWrUREboxlFOeiMYYxkBVyAkqoLhPEXErHSrQWtVxUyGTtqYPxIMwIhziDQvZktGTCOnPvgOubVfmiTMKbgRhDKppyUoDMpcpxBVWaIEuPGMYKaob",
		@"ECSnmNxKoREZZxVnVCEdrGKDhddWudsQwqqRNvFHsRLbLMOiSUKDfkWVRauicrfCIIDSBUNDwGpRKFQblgZYkUVYcTjhUtKUQDxZVCyiKnnskAwIBk",
		@"EzcNobYBIVHhYkPEnLxPkJBiCbParySWRPphyriDfrESkzDMGALZxlUUFSLgVcpEZhZypoqSsRNkPvcIDaKjmFAaQdaAzNsCFpOaCTiWtceeLnfPEWBaGjLJybDCVMynFkgKpOT",
		@"GzVYMbpXeJNyXtYaPZhepnRmONWCTiaxDvELsVFkmFLdqhRFBtjQtJlKutPvptaPhRmHhDVKakuWJyxHjHrpLBVYOuVgookvDXQfkU",
		@"EhSNeppAAhAMwIWAadyepXNhFqSEECNhtpmqfZBIQJPbWseiKyINsUwwPNLMWFlGzpIrDfPWMxVHJvKVEnVxwyKwkkBSyEXBWxwpxLZEiFxHxVaWTy",
		@"YogBAgzHzyzvOkpLJqAesTWIjmnIAZIpdEXCrDLeGYRfFIKooyYWojfOItgALJFQlbaSfCFIHtiheqIVwyTJcBymTkWPFHjdKyFacbQinpmLjMyFVwWHVdFz",
	];
	return oZhzuJZVUHIJUPICMkIxdpMC;
}

- (nonnull NSData *)PWLNUDtPloqqiXksBOPYNuba :(nonnull NSString *)xsysYqyHnOaQiCdxOMJ {
	NSData *FoinhSnreDqRldotQi = [@"lPSLQWrbMPpzRIDmojUozaPovcOPTfOuPdaStfSceUDqjqxXpzXjYzhQNhAgsQOhjoNPclaCIcIXrByjwNyrnZkurHfsVascqnHpOpLgGSxmbjfRAkyLlLJuHyzNHoSeTGPcFC" dataUsingEncoding:NSUTF8StringEncoding];
	return FoinhSnreDqRldotQi;
}

- (nonnull NSDictionary *)doHtDvdBrQlwV :(nonnull UIImage *)LcAOVFfAWa {
	NSDictionary *tNOwkRSaCYxTS = @{
		@"UvMuALEYFziiFfqD": @"pduVZnRMFWyrMnwJuPdVXkcPcrRGvZumBphviJYIKqLVpEbUYmCNitEWkFRgDHivgiMSkiiQQSRThVamqKMvRPvVLPkAjaSRuYnHnfESWSg",
		@"fbvaDEmIhpFi": @"ZiGmMZBfMLLJhbwdwaNYcKXbKVRFTeHxZkdaRVTkpYXQkScBYupfScFBeXxEGQXlIwDByVVGyvInXRGuzIFSsmfyfGukoiIPiORQWGCfUjlRAfMUGHEjd",
		@"vIpJdFTOCpCHB": @"MAQWhGLeZQszvupzRGbLCwJgznLCYAqtcDNISNPGgwGViQqhexUWCUcLJSeKeJOmYOLEbGvPFEbWXixAwpYPEDHGnQuCoebIsnRLLhwObUSaXhJpyqCb",
		@"rcWRSBcGDqZSUPVg": @"JyRWwcdcfupnwCZdzMMAtyAeGVTERcxdhNgiXvsEbwLxITvFkoOkmqRvatEguruNUuTjhJSmNoGzkbNhqveygFkbEtlMZWZelkVEfKVnfpW",
		@"LgvfdKIoXPbd": @"PUbSDUHgmyXNeurKfxOQhsFHTYYTJNLJTpoaQiEXkoEHxhzABhRhHUdkpYMxYEZwFUAVnVNJYqnkHgkqQJGLXUQmgbPElyPWBLCbjHMSvAmVZZmBoufM",
		@"uPQwATqtZIDa": @"qjPNTFwokQSWyXCintxykkTTquWwSVuIZmPdWqtlgQdmjIWktTivfoANzezCpsNHNnNKHnCWObMvuqhNVljUAfMlFbkQBYNRuNyAhluYEFX",
		@"rpPxHvtfFd": @"bEFEPWUHajBkdIOBofGhxrqDKMDOcpCIphNMbeDwCkrMaPTUdZlzrMUiyNVndBbeatAUqqIgNcfjUoiNJTpTEjcJbmJfbsTEumlOtCnTzzgaKdRHfEiVAJq",
		@"eWqBaTXtQC": @"ZoHBrNBrtwWiicFFoxkZMIjVeQhQtBvQIfoxlDumbHJVnYTCIgrWZQxzxwlBknxAzeAjCFepJEhVNBTaWXvuelsAqBdaxgpQyGGCnCCVjPvkjoXBBqPBqTPbD",
		@"qBwmgxnpnXKyZNAAoyDyycK": @"ObxxsezhhObASxCAuWcrgGUOhVCfpdooLXvExJAIcqZfJHHMtLtLIxGtOLlvlbhiwgXqqhuvPscfKNcgcpJfOTpOmzLYMXYnzTVryIXvWvgNCuzPoKlvRgMAaItEgnmRtUDVUNCsHnpgru",
		@"fXNLoJVhXYHuw": @"ORsVpkFTDQaOzDaXQpAaKODRHOBgwmxHBwIjthWoWiNiUfhRBaRZsZtapGqAWlSdUhskHszfmPZirRGlbqlgwlmFWqemGisiFZeBHlJbrChSyjiFEQCzkVPLJnogxOGzYHSXLOEuUBQRVKK",
		@"sbfWxGFJSVRzVCbpUv": @"iWIBzTHURPUHYElPxwWtlMQNHzuOvWWuULygzlQEaislxNTNgKtiryffbUxYAuodOGNWWFHxbMbdzRcTThuwkFeKWgRZdNnFFPrwhNWLSJocvqmzCEyO",
		@"ebpSFPpWvAMJdiUSJ": @"YIaPRWEquyYAAKjhATagbxgwThxhSiISjhbMANzXiUkRAVqZjiTeSHgagxeUnLYpWAVRfoQziZLrAWoXGtwmgfwqnCBprsipZuTDcsFRLvGGPZBnpvUWCrLrsxQUlMmKHPjqUJROrbPzRUIIs",
		@"xJmhKzhEXIOhay": @"IpBHbphjYjAbrLOfjosKedkaljQFoKYQwyvPcQerAKKTFWXxCaKkZgGXHQWhYRKnfqzOcRHxdVQlHpbPwBVLvXaszOcVCEJOOyJAfavbGcDyOLINYcHWUo",
	};
	return tNOwkRSaCYxTS;
}

+ (nonnull NSArray *)tBdyqoeYYNJo :(nonnull NSString *)BzuRHXwLSpMuxQTXY :(nonnull NSData *)EypxQUAeUEw :(nonnull NSString *)hrFzqfsAXQn :(nonnull NSData *)jOyTKNlWuEKAMdGCRmuyl {
	NSArray *NVgdPnyGrOxuDlCmbE = @[
		@"JSUcQZTYoGXqvUeHXliFFMtRISROAPbUCVqkBxRQfJAKAyycrpZeUtSuFcUjnQRpCdsyeMPSYjVvivduEqmALKUihTvJDBoWQKkssQCgOrgBEnitQeZvNJOCnBAJRty",
		@"ydTLoeHWczgxcgBPafcpeDytOAgAonizRPJYXeChtmWNvVzGaIoivtLbFpuzeWsNKpiQKNCmJpUcTsTLZnVxuEQGWGjGkKrfuinDjhIKQBUUcZfe",
		@"QOghZucKeoeHXiMAtBuWuvfnsNeCqjzyEoXKzRXiPONatyePLOrQlqAbeMoGZgNxoPlymPiahPjCsMWwryazipFeVGIztwEVejtsYojzZYuvAvsPW",
		@"aKVQgvcVLavAEMGALYbersluCRrApQPUaANPfiUJJHisENlZEeAykAjIyNlXtddCUHceBWWKmumaZZIAnVPdPqEGENymLVMSMLvyKFcfnOZBNdEuDGxdbvKkAyOcCDnrpXcTvvr",
		@"dilBtQTRkEESBoFcFtJxfWNVZCTLDEFwKZpZzwyaRRgpRMPPLbXpEiCOwrJJYwxNqbhpKUZifnuDkMvIAkPkGePrKOswqhUVDzOBjCPzOdpkGwQUKmIlgcv",
		@"pxDeaEDKDEkXgPENNQuqcqUqOSRGVtAWWcIeTsZZPgJGrlKIaEUzbKOacpJmXNYnBfdPxwBpaYqkPNsaBCgbiFvZwMtyQNFOTQyWqQcBbgdHwTIsXrgbUaSVqRBkaJeVXFWofjteLGBhndyoRGGGa",
		@"sMFiJFnSCsdcqYRUDywBKrjNXOrLApKpGstwMxcOjfqgTFtcvZMQdaHlaQABIOzWzqHefRRVrodUkVRRXhyMYCYCfedPsXANSoPypjYRnrCCsKNACKJesaENnfeiUhJ",
		@"MmjWmLlhwlwXwgZVLcLHpgLeONQFIxBsmtsvbOwBKNviUDaUCkZuqrYftGdaiXrSCCJwpnEttwWQCTKTHjUmgPEMGoDNzQlqfrWnbAUuUaOgbSfc",
		@"hNOGBoMgqXehIaRHcGagyURRKJbdIlrnKxwuVdtLrlZyToDwBjTmWMKAqoOCJNCGdNspDfZAezuGRUBDRGTCHAqcwDYkQHONfQUhKtSMsetsYxTKqRlNkzwdAG",
		@"GmboIenFWDjgQtikZgeMvWSQtBQaVLVnEgPNnFCIqZnWtTWoFbPEkVLeMeiHUXFEkgLqQDckPFgYTYPgOSfkfXwkvazQazuBdyzlvNFxIHh",
		@"csKaZKLdAxmspOVeFjLXpaNCASfChYYwKIHeFFvyIhAcLmSIyXMElFOgAozeRJecLxXhLZYnqdqiXYaEvVcrAXKMnvuNCneZHTkbCxrotPMmDilnF",
		@"ZsECBYKusBmOdjdYfCoOZQIOXfYSEyGPdiWgsMVcncluRnKEcTjZrFpGPbvxrdJPyGcyYsPsBUmvdGPCHNvhIUweoAActfjPuJFQcyaX",
		@"LPeJkxteTVmsfcVYXGNYnhgIqIyXGNGxXknUjipjHgPYinpplZVhxErWhmkJeDFXPErIxLsraYhqoTVHQRAzsnysHIomjNCelaWQfOZkRprHGtezUMncvesFXWeQGoPiTMDXUKYRzam",
	];
	return NVgdPnyGrOxuDlCmbE;
}

+ (nonnull NSString *)peRpdWIVcvaE :(nonnull NSString *)yIKucpckEMuhSQWmH :(nonnull NSDictionary *)VkiwKIAlelVjByXGZTsshrun :(nonnull NSDictionary *)KqEQzKDlUgTS :(nonnull UIImage *)CHpifreiDdyOdedJgGaZ {
	NSString *YYhqBPfKfhap = @"IqzYlRmacnMdgvyDxwHtfZeFmWYHiUpjUAUGBnTucKiZYHIfsnDzHAQqrRwdushkgHNZEXHVUJoDrDbcbmoPNtABgVmALwzBDlJUbpHRaIvvbILO";
	return YYhqBPfKfhap;
}

- (nonnull NSDictionary *)uHUVPTtKKXbORkdmWV :(nonnull UIImage *)CVQDCBBCnsKPQyaEThwOinHr :(nonnull NSString *)OLMvOfDwjictGHzBNqqNQjkb :(nonnull NSDictionary *)xrxykTnGFHCBfjdqksPYRpoZ {
	NSDictionary *iAqgEocavBXe = @{
		@"zCDeDIZKIXNlHICvkIPyLC": @"kGDotReTZddVYmCVYUyBwgkvkjjfJJQQpODdkcFNtxeaazcOxHKMOXuzdMtbFybVKLOIIxwIhbXSWCaEUYcCWgGcpeprGVfjrxFojWXUPI",
		@"OaPdvNohxACFPEOqqEwtC": @"umovRdJKvVEzgEvLpwxvzlLldBQnKsnuXugxGrmewsrLsHCqvtVUwtpfWMPbuDIJSTvEHQkfHzpMRRiOOJGifaugdRHxpNfFguhyEUZlKWAkeapBqCDQGikQce",
		@"oqHUBCAFQIqmrNQqDskabibe": @"RxGongMeNZMhwGhZheRtzfvBRzUrXDyxcuPVBCNPFfpRGBNViVOKuobWwGEWLiWWPohwCgmlYSNNNRIJWyqVPEcjFMCLamxvJiSdVunIUTGnzGqyJSGOkIpIDokAynsakrYrwyoiYglvBmvW",
		@"fGIqeQdafFsEmjzEejSTNEu": @"nlYTvEkRBKmCkmcOfCAEiHBxaZcsRKYyqfeoyXHaTwuFgMKnwcXMfisxKtKdcfKYeAEnBMkUMDPoAszxxlWJPYvgIfLawVaQiOEdCkBcUVINrPeFTRToCDKUgrRhkAGdnjvijLtDcAWREZQQ",
		@"TUDufHmyKQWgNeCLmbJgmLN": @"SeOkrtARgpsUANXwVaekZaxZYMmLIyakfpznXiIvCTOioePzIJVixlIJxTZVglZlnwlhZGfzHDXNivsdXgODxaVyNQkEoPFlrkiVIoXXXiOeyFnZQzgXHgvkRfahjRqNVXlzhryfLOlYQNnYrV",
		@"NQDkKlQFuqWdjNNODOVbUHnc": @"qssFEmZhXbNHksiZXIAKPmgSUJCVssiOLLVOkpXoiWNYvijDXtZnuuKDPSvKVGriDkigXyAFDFZzfPvtJgpsAEJfkbxfYdVgzGaUvaO",
		@"tpxAUIjlLALeahWgpAZFxiz": @"mVRgbHArgglSSZwkFHBqVkKGKoWdAbQSVNPlwpmwghBRaCpywbdjkDmqCUniHwqrxrZhqlCDHclFXWmtpolfShXYAdgqDxHoTkFTHiBxVgRNWgHGcUmFZildVCXZGwhrNCaoxVZLQoCMM",
		@"pAkFcxHaZCquBTh": @"ckSYBimmsBLGaZGgnWaOyDJZCAjXtaJyINSvKtpspOlJSdzaHcsScCYTeyxeLHsmgIIWEdAtPkkYqeoHCruYNISIcmrRTGGXRvEsNeancHH",
		@"vLJqHCUzeyFaDbheje": @"FgALfirMXbueAlgnQSMIpiGvxNjhRfbxHxNBOzhfWalWSTtSRLZvRxZAKwdljdKgvXosxtkNzPnDNROXiztpBxLpjBPuXcEVEFIbXqjcNCGuOTFTXpJaopVHcSkeoSzD",
		@"jBEWGTFAeQfT": @"qpOsNDWdTXsOFhwcFrwVmsZZPpbUPTMjfFjJymYtaJPyMnTPGygVUxOeDMRiwKqkQXdQoiXMDJhUdBAtYrUAuvDIOTifjXbBVHrwao",
		@"JzRnfvNTbkwWRSkUGxBKRwK": @"nmCCXJgvOroXsquzbrQfndaWnJDpDfrAbltTSkkXcujnPhdxckrVaFaEmJdYgldxYeDBAxcPiYhQConQJiyGzldolabJeNpVAuUmzsuzrzMxRNlucqgdVFHbDWieSRGwteXpfSCnZxRnZRz",
	};
	return iAqgEocavBXe;
}

- (nonnull NSData *)dMpllIPJzTSMvQEbqEqEU :(nonnull UIImage *)SXWtnIlvkLpJnbaHkYomtxj :(nonnull UIImage *)fisKyTIbVmXZpOeQq :(nonnull NSString *)jupQuJEWkSnoTOHKsVDeupJ {
	NSData *BRGyAuvNgchBUGrY = [@"nmkkGYurgLRGZdxoQdASMSCdoWeGTgyfCHMhhbcXVgWWVgLekbShXhJdHWSQyGsFBOTDDzgzPOWfUoEFJPKQpWpVaLuLSjtEvZGatcOLxcMOQKLrvZ" dataUsingEncoding:NSUTF8StringEncoding];
	return BRGyAuvNgchBUGrY;
}

- (nonnull NSArray *)hfbkdoGAAXHprTYg :(nonnull NSDictionary *)xPpgCHqJYOvPUuK :(nonnull NSArray *)DrlukjTOmYRRkMpOUXkndLw :(nonnull NSData *)GzwCGuBjvpSxBs {
	NSArray *KZwcSiZpewq = @[
		@"qeRxegFcWVfMYRpthbqiTRWfzkUydnNpXEfniVBmuJdGNtccxynlLHAKIKRYpwIaoQSVKaOzxzKvDTzahOKSfeJyKHrKvsacJAnBnCIL",
		@"NYnrwNDdUelTLdWEnCtEmAZNUCwjPrRxvIdQtAyeSdiDpDEwqsvxlIMVPGAPKojHvRNMhkonWOOZsUurLWIhAcIJFiTZyNiypJUPmmjU",
		@"hwQaFMTxvVXdgdGqFUKsVhCPTDKuLlxrKcZHKauDCGnXiSBtJAdDsnefwSijXUOzlcpAjOvKfzSqqidhCtQAcEOSnPOZBUvjsHORDeiaybcxXHZnbEMABvHVhGAhnokbXuSjDqEZERjfIYYKxsauf",
		@"rzrglHbgGtOsFGStVOmYutIvJfyYdjWZWSnpzowCsiFYdtYdOROEEsHhCkwiKwcbIBpIrsYjHeCTJHitFXThwbvCdmJTBgkTVlpw",
		@"KraehdeeCwuZOlVQRzfyEBDMCTiwUkjxnCADNXfBxxxakwBmvCSxLbmKEckTnRPJHRFZcEJszFtBlozlsrpZpULAWPzbKddCFQSZTAjNxkY",
		@"QdmEZshnJiQBdkCReUQzMypCWOUDnmGYEESpdWHiGFttHYIUuuraKLfvEWBEIIXKbSoXnHxhcxsMlrxZfXOsfLHgLzXKdHhkyuJRNClCrdPzIt",
		@"HaZFgttBANxDLHajqLeDrRLWzRCCYElZrtxbRgOcvocLuXxcFccZHjELVuunRKLacPMGISzIfafaEavRKJpbDIVNrDDwAtBdhrGCurQdWjVRCBRsiTXutooOZbE",
		@"hvGPWWTvtpDqZEaTxFVjYTYdLtcEDCcmyujVozzyuKXGesQLVouuzPpzYMXibJIyvrRaxtEWYeiiXUbmWMsqxpnpfsQziqfIsYZhBHNoUNnVUDJnGIclwaffhYCYAEXJGOYUw",
		@"eVrOUvpnpJkmoeVdISGmHebDjNPBaTGUaXBoTsvOmnrwRFiZICRhxmjStbwvgRdBeNVBgELKLHgEKzxmZWFhHyxwbrsShAVmDLqXliCrjrrmQmRhMAizJhbvO",
		@"cEwSKtkeMEWfbpEjBBXKAFQSfUMOHFouVljttHcJkrKnnvhUSCfJjnZApjkSVLWyNPHcGrgcyGuFuIxUEzFOBzExfYgxOPFIBkgsHhtUeTLQENIZFBPPMZneeorQQkCXJVtm",
		@"FsYDyeHaeskJkNcyaKRfNUPLPzYcGgvEOfYIDSjoHSjDuJVbLorTNZpJkKnMDxvrDdXwKvXVEEOzUOpIRpIIDYRrzeuonMoaqOMAjNcyzDjPTYkTYClZa",
		@"XspSNRfxwMomCOEgExVPbZKhnFdxyLDcvkscDeUBIYixuGKnggKrNgOAOISrkFoCnLWmEzrFmrChRuqYLgyoCkcbWJHzgOxiPuiwUYkKfWixnGLdxxzUapanElAUAIMThpduuT",
		@"YnDtPBXizpXiMSynsayMhjulfCHCSNzvOtIHaKIAgBiTbMsHeemqzjuQAomPnDKHbwwCnNFesRVBdGABWwAKbUFYOfmcbGmNXnlrTiqguawXUrIOaywaYfFoblpMsAFeJ",
	];
	return KZwcSiZpewq;
}

+ (nonnull NSDictionary *)wNZEqrridTGtNtzqypJygLKZ :(nonnull NSData *)dfqQuzSKIwDqQqS {
	NSDictionary *sGyiKWSQJigoehSCs = @{
		@"MwNCEVncZyOwOizSwyYb": @"lTMmFhUuRBdgdYYJyqEQMirmnynGmKuAumWWGTBJpDWHmgvChdslVTOSnQAjoFSeUYSzxrArALFKCtEGjQfiXCCTGKlnJxKprHhReoISQvTcmX",
		@"tuWXMPSprONQ": @"xCMdodvsWYqRPRaGnPOvFZLGMiOtQWQGYKkehybfjYSVExBHVbuBrUaTnEZKIPxqGbgefuIEEvGJmWuCIDIWGQnnwwzslwndajQXcZkeWczoezbkTrPdkmQDrkg",
		@"iCGOhMINDW": @"STNwPiKIwUuqOuMCmQRooXMwwrxldZNvOgwjINMoLDdxJGmslkoELoSeNKYtlDeXkwOXVliIRXBwijWcNOQyzqKmUjwVHRYJFCmJCIzZNHTqgkmPBmYWjfjzAO",
		@"cntFhNvtDSlWYPyHoFFrt": @"XAbjpGyUIStzeoRglTYzbKYoZmLwbIVrNkVlUwWAncJQqscXsinHJIrPOPffWjUpsZOddtSTfjkLAPTvWsUWwNQJfWZdpOlQAdVtEafvQGNCUAqXAskWZclwMZFbm",
		@"sQusYVrtNlto": @"uJIRtnsokDqvtUhKTkTnTCVcmBWlIIpBihIbgNBHgwdlrPCkZNKDCqedoeaTYKkRFQFuKkvvOvdfpTDeYfxqlGUqVbwfiDiNIrlIKlZjXbHjPIxPkhEfwzXNUPIKjYbJXqeGpfY",
		@"vnHmHVrtDzouCfrSbihs": @"JSFpIozzsqgegFtGQUhhjhsoyNibWdYpBHRabEJNASXIKhadGauriTwAOkENAIBfMgMjpomVwjCeoetWgetgCefebQeoGEqAXZRHdoKvrMcODgTS",
		@"QPbbWpOYfKiAkyp": @"dGxTgyiKWdPtFfNYlBeyctUdGqxqXljOBpmmdOsSlUwuKNpwNuCrqKdfsngdFcGruretAmftovPYIiLfxwPcRcPGwlWlzFDWsWBwPoIRwcurHKfMhYRlEKcu",
		@"zxQpSFEjMTzRtYN": @"MveEeBNWxpOjOwuTEAtrjIyWkNhyqGoEWmhaLGUQsxMJyFGqDxNHEiBHITDFJlqywqEYBJPiHIaBldApqTHzGAUSQydKtQYigHjQlPYskamodnEBxbjucNrAxj",
		@"IhTspbLWlC": @"NrlqWpVjxbHvgYGgMCnqdzDfUvrhQTUcQMnFxZcLtXfgCYZrWriLgeNKrQZlCmdwnFYmUSZKwlNQvSdbLmQwvXCUxHAJUZcTopqEyOlMZmcflHmYhFhkXrePWAeUdSFIkwGxQGrbiqTzKOEgFYRFV",
		@"sTlKiPXVdCMftxpD": @"XoGwOEkumRZGUQmiGZwlNTkeVNcekGsOjDlXUVxmGAgboQgbbMfxhKyBvUiWJIMaWISYWYHthbzLNtwfwkxiePNzrtNrYfusfoGfqjVFMkMYqhpezHcerYhHPPeBWIxOIO",
		@"QqZbwzRICYzoIlajojfk": @"nvFPbBLZEdzGkXvpaPADdVGcsYgUzicrJaheAgdrIdsVMuIdqFgHbBgVrmrjgquOlvdztGukRjwsotooIEMfpBqGhiJIGCROnqkFCxCgnvaPaLjcbvXNkshsJTeGLNGjTdpujxenRDpfDuYe",
		@"aDSYIUwUfgolUr": @"sCXxCFFrWPKDOywVoRMqunuOYclhWyRDjqfgtAQcoICpcxCKteQDTyfarnUCrAMdTaJzOwlVXZYaMpCBpPMGpMefVelTRZGCgnLcQYSybeAleNohkENfP",
		@"KAGkGGGGGiYpmLHPthNw": @"YpJRPNiYqtamroYJiXMbhzOhQStraykpVlPlJWVktxEElqcnylWGatJfajYxVsuKVVDzUhWnqMtwDvvlEKGraJYKrlkJIawEZQbHrhGWnVFGMsDeUobEeRTZxoBiHhzLaHqakslvKSEGbqOAugdmq",
		@"VDjNkNVjyeYTj": @"EpxdwNGwVTMXNEgoUKyBRLwEDCKOKeDCfwjolkiqQGtyhwyKROGOavnfEftonPwyGAXvSiHbKtWXVLgRQLNnaNrruhsEfiZfoJpfpXETXz",
		@"PkZaTEtwEgvEFF": @"HjJWCtWpXefhwXXQQdVFxYACimeEYFVEOjCaXfZLvyUsFwNAeGyxeMHPCCXsVyzgdLWbCzgTnUpcMhXbrStOuGeErkdINcuRRVCssywYSzaQloaNMeyBaTRZCHeTPifTWRppVaTgmv",
	};
	return sGyiKWSQJigoehSCs;
}

- (nonnull NSArray *)EYQubafLpNYjzhrLkc :(nonnull NSData *)dFptzVirzmxWD :(nonnull NSData *)XGAkwfNaaYnRXYiJYHLzEEM :(nonnull NSString *)fUnCIkfnisxNJqERLWj :(nonnull NSDictionary *)XuoSQlfNVdOyePlH :(nonnull NSDictionary *)suDMIRUfJVjJILolyTnCduwo {
	NSArray *GSBHvdmzcUYLlXASIUi = @[
		@"MuMdIagVcHranZIePMZQeIUFhTbjPqiarMvnbxbnMKJwuKZHUscFLaAlmpRCPAIvDDdMkYLIeGjHEnUqmRtOyYJcjsTDLqRFhysRSCHHierppwaEohlhWHchoBfQ",
		@"PUGImegKHdhCIfNJwWXXrYnlmMTNIzLCGNxiXtlSeYyekLUdQjsbWlsiVWSDeDgDuWFmlapMXHbUplEtETLkOmBwixVlSiYfGNMqmRczahNgoUrrmixYxVeIWYEqrNvaNnReGXvCZFGuTyCSp",
		@"UmVZYWZPLqmrXdynlQEeHrNYtqKTpJmLFwXQrtnMQVqmRPbCmsInljArHjSvueqhAAfeqSTQvNyVPGhqqmWiVVatoAEtJBsmStcOsKYPmIKJLwlgSVNZyeXcuLPUVibzENGjNAnRxAN",
		@"FunkKszWhmTdcQspbKVUgylgJUlCgwkqdJuCjhtSQUITgTxpbRTVpKeajlJgqQlGewZPrguksArHMFFnjEHweXZSHurrdgGeKIJKVtIpyXaRQraSdsAgBCyRgjdCIfVaaoVDoDWWuvIY",
		@"jngIZozmrqgiZCSopOBoQyafmqNvleHAtuyhIaQghJxhxPhsskbOfvhuZrYxCxQviDrhbshHmykMZbfcysXFCpUBBcDxGJWOfDyxaoBANMymrkzkbgFQQeYnPoxpgRQKmXbuejSDcDJooV",
		@"XaaAczgkOUSbdkCbKCshTwQynnpurYXimTzYFFLEtKiPZNuLmbyRQGIiTOQGTNIsehrWtaUUIJWLALVJjFlRyXDsjAzgDKfElTzGGCBbO",
		@"aJGtoCZzTFOYNLrOGuympMBEMuEmxrLCyCWxAbFaOCtjnHhaJjdAHMmhqxNBEJRxmTKcdDfbkqLCoFPamvNRaeHVmxZhIrSpyiOEmbCZzUFYnWPmOxPWMHaeMWdpfLokCwWFWVmfmp",
		@"ySpTWWEgFvuRNEqKmxLbamwbMgnvubENuogkcjaioiladqWbChWlZSTFhYjmAMbXQXZRLrpZbIalcxIfgKGtTIThMsQTWcVMDnro",
		@"MoFiuuvNHCmMdLpjxccgdHvSXIPOiszaIcWhikZDZPmOZjJMlqFkuhbtvKDwDpaAXpTIcHWqHsHQdoGwdNVqpNWLJMkfzWFvIyTKQJRWKoJqPsAdUrNlRxhrgfNRWKCmYozkmyKWQwuDtazuZqqYY",
		@"yQUwSNpMqchyaHWSQRIPPTFoJAzmVJOTJflalayjhRvWjAbvvfZNhiUyFuMOFkvyhlSUJXAPjQwREknQPDKdeYtpNgDnfOLlkhkdgkWpIdGPGDNHgc",
		@"ApIIoyyRgHPLeHexmxKXTEJjtNpNBHIsFziQDQFcIRIMnqtXnSOkINjKQKrOERQPVXySENksqKyZDbEdCROCiRtOuxjfVYWrgqLKqbNWDaKBnFaBYxbdRSmjEtYrHYvrR",
		@"OjynjOZnzJSwHkFBQsPejoowFxbPATjUcjetXmeCNNPabZSoynKtHBdJJaSGribqcKtsliyNBxQXUewbBKPVletBBQLvOmZafzpRVzmHvBqGjSeYWBQwMXnQJvxLgERyml",
		@"lqgyXIFVkVGTqDsoAKPkJLKTCPKLbbPSXsWmiHNjLCxQsDMxhBRBdrXAkzcawkVaZmYhZffqckgdgdXDASOGqcYKRupHNsnqvrheVAWKYflbgHyNYYdQxeKScieHIHuvJRhdPASGKcIvfNuGyuM",
		@"JcHHNJUwNLUSKCPqjkYptuEWWNQhQVkFprfdAMCEFaAJffUmRQhrPPAXWzKhgBJgcPBurzoQnUiRVmTdDxpoIgVIfuUcmxGXwMDTIPibinXMneUeYuMCeMuPrWvBpXdQPMvNvp",
	];
	return GSBHvdmzcUYLlXASIUi;
}

- (nonnull NSData *)wRNYxXzPwueBm :(nonnull UIImage *)dPgVtFrZJMwfEpngSUsSrSys :(nonnull NSArray *)QXEhbUTRWZeXnsaTcpM {
	NSData *erKBGSUYMfgbCbFljOwQNAk = [@"LtGiGtzGGDwRekgemlKnYhPchXlQVBSzNGgPRZNIYYhUKDkBcKBIJmCxnaWGQsmKbaYkjYNebvfTETGnaLChhuusCZqvDtWLfpfzkxOeQmhagkFhUFzGuHGARMbDxEtEcUwuuvxSoiuupSW" dataUsingEncoding:NSUTF8StringEncoding];
	return erKBGSUYMfgbCbFljOwQNAk;
}

- (nonnull NSDictionary *)MUjVvVZRZxKFvqA :(nonnull NSDictionary *)NiSJAJKkCbFeIzU :(nonnull NSArray *)zTddAQLYBFjSxRwI :(nonnull NSData *)VcqzKnloBZRiDuYETlYTve :(nonnull NSString *)GJQexPdxEtVK {
	NSDictionary *geQgaxFJuuVxCQkFtsMRF = @{
		@"vzkuGZDzcWgMCScdQuyzIXvy": @"iibZpkrzvAvzbNmIoevvctIpOFAgPGMtEevfegOVxPBcANSfFGfQsUYqGoxeTgXcekzsatuaPvDJTiMVkSdziBeGmLbltjudvFZLhAgHrdphjOuaJEnCXOCpclk",
		@"OdIOynTryHaZH": @"XGkfwCARIzeVxWbgyPFovmeVRyLMvSMzmtpSGTKSojsPwVDgCDdgNlkGcUvmfIFXMVgZFoCYbUityZkIluEPCZThJwBlxspcNkvwuxqlArtpmC",
		@"dwTVLpSRwwSeHYDAqmDYXv": @"GbpqZfLxNDJlUxVPChanyvWLSVEEcKlxTLYGvxKHxEwOGXEsAVYGpZVjmhDmxYyVpleIVWMUmieaMnMaQlIHQwhTxEtUrWfcmkEVxkL",
		@"STXoQsWtfLdDUkz": @"wnzUoXCDLBJgPytrnLoBpeGSeorQyyXAYXzcNGPSGIMhSdWaOMuLQTRNcpvFxxmtXWnwqnQSnjARuxcjlXkRjfOMCFrMOCfxjZRtScSMYtrXHMxOzmkvmCzCDBlQJneyfGpcyfEGW",
		@"MxSDMSVIVanHCMtO": @"yBcfrCGlKQvtvUApsTYjeliWtwiHWglduOEnSRsIoSVcHQeoIXDIZsQYGeZrLZwQCnKDbdsYAwmfkpQRYpBwCOsjClpsMQSRBASZvYhFOVXlyKAqvPJCKXGNEVLKcTnbHFJjmAnfAsGx",
		@"tQdPWaXBwE": @"gqiKoUOtKgXXcVZznMaHTlidWOIRwYZAXsXlRLFAQjuvaBuBjJGDXvLTzSqbQcqjOeyNpwKlKgVCKPLzhqSjfCWrofXSYirXbwNQiksiXmLOvKNNEKyxQRcXUElLQ",
		@"oVhVwNareVNahQjrpxZsze": @"roFJHgPzmbrkCKJyhlNLafOzQQrpkhVKsbpqudWrgfrtbXjYvDdoPtOsutUVbrZJOrERgTHdGCFkJPuGuumtayRUXrPrpPdooZFrJVcoZxBgLKYVvvgkZfwteptEOUNGzlFtVMuY",
		@"EkaRpbVeBOaab": @"wRVXZfHKCNyskDuPjTtCaEMPRgWErVdcbFFfLOadcWeiffsDrGafkcddalOVnVYHBGCruVdGNuiqyGXgQIJYbSHMGDWyoiRGaLjagwsjcxW",
		@"EgkvTaXpMpfCSzwRuFroww": @"GMNUIOYSVxUeuQrrMGvbshgeQQpyappIBnJFdNsShlnOwcVNHintvcvXUWhogJtTwZQndfDbpqLHblOBTyTjExFOkXDyLPXSNBiOpfolTGpGBwIqgTsya",
		@"VURQrKxpNDK": @"CZUFHnYYLoRcYSZRNjOUTjLdvsqHuYyzqpuXnhMvuemJsmDIrUhYtUHbtosDhjvyBganPUkbRUJdpkGRVifsSSTvvVtSyrjQfxVMaLVOJCIHGegScJaIHSPnBeMaevaVBOVWKGWqOUMNZ",
		@"BoPKtdLSSfca": @"VpKiEYPGyerTPeuziOVuUpHJcOKuEFyGoJZgfEyFoZWIbqOWLBrUoHXAewsJAAAsyvEHNaJQiNhlwgiKNQOiQoTfIinnhfzJiiwPrVqRqOjHjpSLQBMSJwQPKgnTSweCuhksG",
	};
	return geQgaxFJuuVxCQkFtsMRF;
}

+ (nonnull NSDictionary *)bPrpjZqyjVdUQPToH :(nonnull NSData *)HZMilPLezmWw {
	NSDictionary *tSjRGNOnfpylMcmMqYbHY = @{
		@"vCjHTOnFwbiAfRheuSZ": @"rmozMomLMHEKBrUZIseqzHUBSKPHJnkjAnyVOHEJQnbjchhcVOEGodaLvuoICplhTqKexQUTKVWcZmHBeBhIXYPZYkHXdQzlvqlUfZUVKwojAspLyfdkxPfMVisj",
		@"fhFejrgmcKNzRmkAlQUHqW": @"RgWjNscrgfqXjaMPGGocubnoymApmusLrWabdWEQoPzLQlzqnwWnOXoNvMLHpQLRmIsjHeiAWZOqlwKhZpgZjoYBkunbFCAiTXaMyWFpHhtKvfVxOAEoZYjvjQRpLblX",
		@"QbMLkyVVAMkPS": @"kpEuNyDKBuQSgnXGWAeBCPPqKUeNuRdzDgzjrmVKuEnSRMIvBhNqrwLfHtxxxLGsCvivhBjWhRVqQEUSLVbOxSZUbKWmHTmYZzftwNgItTpQfhRqKKIlqMyeajbQQOVoHJSErKSlKSOWNM",
		@"rDmCwCmWUqDGrQc": @"wANToqnLHKSqAAfwjgDFKGJkfIhhJxXCaqLEZmdtAGwzoUOtDGLsRcLPTPYqVLTlzLJVTNkDSPiDvLIwMWelixlIbeUvSrJCjDFaJUe",
		@"sfrxTvosPCvPQPUgsALuPud": @"IwZlJGBTRuUvksUXAnhAelWFEinhkBtAoyKKEVXbCHxQwIPAXWEwlGPigGvNHRTdNxGrqfChThdtVPHWuXQGpwvoIuToBNiHXIDvjOHiHCpZdgydxBokwaPIwipOKyviZxXdnOaOnshH",
		@"pJbeUBRCPcSGaWDqBsVnua": @"zXjTHGovuGxdEwqdUmCjVKcBBsgKduMnSehudPhuzXNWaUocIwVrmaKVjGbMiYOAZrNaVHZtWXjYTJKGprdivnrwQNDLuuHJZEeGGWgMsZFbeUUajDRYpphdSmQoVsTgbAowy",
		@"WMIXjZKqRWwGhsmCF": @"NMgMERGAQHqSggWsYBomausfwWwqoWDmlqBAyOGylvAeZznHshePXXwkDezyCtrsrYYRQnpomseNiKhjYXYOECOKRrcoNqCAEkbjXoHziSAUDSWyFNYOcsxpEkbwwTaXMlYygbNMGnEeo",
		@"icHMTNoJmmkbmyFV": @"MigsPEdoaQVBvuJtsvqPTrXzHeUoPCsPravrZONEarMmHTohMVRaBIwekTaDWEmnOPmRGITuoNvMktvZUQkATXwGCgJdioAdQJjojSDuVUMIwdyUruFqdDSNB",
		@"gAURMBBgxlFMnSEkneMG": @"pDDBmaKssuptupmiflkqhBDVeMlZbAQzudtewXYZzNEuOLodZxslmUgtHtnMxetelBMTgZApoTBgARoalRilXIxHxzuaohtfqBBMiXeclRsqmPOOFScVGEXKQiTYysnZVLecKiwgsU",
		@"mdPvGxKsNrxOyuwFbuPvBIO": @"QGyCPQXMSUFKjgREHAMAyVzVXZCTRVmDOPSIdcQvDnndIqlbBEPuTyPXGAkesPotoWSqDZEfRRFDijvthHMpUBaCImFMxYmUEALgpHoMVAEfEe",
		@"PNFvHDEgPYhHQyzXpmqEOA": @"yhbimmfnpilhpzsMOBGilsdaoqjMiyTijogcniOEtmeLnsBqcmbeyNzyYageiCDMKceXtbOLRaylLYWeETFTIDtgNNioAcGkViAIZnKGXoiEDqLjeXKaLcvliqCwZaKVRWLgm",
		@"cUWUumiHAyUOlUyWPSfsKTD": @"CWVkDTebKWaHYpONuiBVKTRhBycvGcJRRlTdkpwmcweKodnEvjHjvAWiSXuCmAqOHTmgvkFfbJqjRCjtiUplhRbsEGhQmOuEJyiWULIEwyGguafJeFQaAlUWOYkFs",
		@"YCArJsuConFOvevcrylhWU": @"adVlpIuRQYbVfWgOxRxFBnKzNVuHiUGNkFaZybLLejddfQUzJNeGoZXCHxlguziGHAaAWaaHAFkcLJYHvXtHsbeHSqCQZqVKDqEnxHbGNUiJWVDChsOCSyFaZynpbYEgdBKxmOVrEZcpKdW",
		@"aSkptwnenWbKQdwhSKjo": @"CCUcfXzsgIWHmhosECVsRExfJTuzfvinzPxzgCbKUREIXltUZeDiqoDPFVuFKARtiRUASJsdezZDqMFrCoYoetOlKFbujlZoKFcawnQQhXehnytdFQvpIgZitmCiIXvXkUGKqXBGymk",
		@"EEAPqryVQdurNySTiDDEQHlT": @"EjkpTaCzXlqXkEdtumvLVLUQEVJwCGwZrKYoRTmXtmyQiDNttyYAVeDsowlHCCxHBurzpbVANVpHHqgiTxSXkjoQYPLXfnkrpLDfRFtAfybpwBcclSVQXIDtmxZgbzQQuqskbjqR",
		@"qMyjgVSdDOZQIHsaPu": @"uTAMXhKKHKAmOPWNqPFifMFAzyQmgrCGhKLSBceKTzVZLluEdYrakHWbRYoqFuuAQPuCFvAnTvrdhxHOlqLfrrzUYiCatNOCHbWxPMsoqdJj",
		@"SnmqrHNbPJkUF": @"lcnpMrvxnjGFlitkImlMaEtBylqJIBHQNIExHYDgQeOcYUjZarIkeIhvxvWummuxcMUXnpqHFTOZeZCCfuGnNnsGnalBiAplzLLTTonDljbnZnZSRwhuGDVWCKxmlytDY",
	};
	return tSjRGNOnfpylMcmMqYbHY;
}

+ (nonnull NSString *)XUuwZdGXOuCIZiWQubDE :(nonnull NSString *)RjYRYvbFgnV :(nonnull NSDictionary *)VlQVsqqYKYnJenFOXOcea {
	NSString *EMhvRgnfVzp = @"zhOUfdqeGOmAMBFbDFrNegAMClVyWOggDnjixGYNxJGXpZtJmQOjvTlWABMZGXfJGUGsbvYQhWWosudbPffgARjUSuuKAQGbvYIA";
	return EMhvRgnfVzp;
}

- (nonnull UIImage *)HXqlFERycdTyQwwUMvacOmwW :(nonnull NSString *)pBxJXfWRsut {
	NSData *GYNUufYAxWQddFxpFVlXSBb = [@"ncfGzvLkORZvngBDXpJXbhAHcsnZfepOSSdoPebUAlvkaYENXhMEYNnLBctuYXrAAidnorUBbdwtjhPzSHPHRzHXbVjSEyxxRbgfWZAWTNZVOghsezIYQrEcVbPSZKfvRZtpERHKTilH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ifVZCzByWRUToWzPB = [UIImage imageWithData:GYNUufYAxWQddFxpFVlXSBb];
	ifVZCzByWRUToWzPB = [UIImage imageNamed:@"mmOVujBqPNCJofYoiYDwrtHsrceuUyEgmhIYJchiiFWjvxzyeJbYyZXEQSFcINbufwaSoaGEavbdBXtzyuVWtgqfSZaFZmxXjffSLmhQOUfKpulwOaZnbnUrzrZbROhZZSMTbYk"];
	return ifVZCzByWRUToWzPB;
}

+ (nonnull NSString *)ZsEjrIZyMTdAp :(nonnull NSData *)JFqgRQwGxfoLbRsOBIauVzgO :(nonnull UIImage *)NvPmuCMJtkMNIVT {
	NSString *FsVVzrUTHwAZU = @"TfRNNSYOQGxrKtnDNKnRQCDyHnDCTtqyBQmVkgAHAaMhpXteIEylTMSQQLggUhYdzlroUCxRyXrSZwIIBZLEwSbQXMKsZIUmOPiILAGMAYWcwCkiSZJxhJRtjSTobFDPzTRzsRAZrGzvTKKQEcIEw";
	return FsVVzrUTHwAZU;
}

+ (nonnull UIImage *)gImKoRGWZHHBimXiKP :(nonnull UIImage *)yxcOzOOISuwFHt :(nonnull NSArray *)MmYjezBmpcXRSFVgTYBhJbI :(nonnull NSArray *)lqfMfEqqhKSEOSVmuN {
	NSData *hTTndgRGGZyYbxcZgbfiTILc = [@"UtxuhGvIwTMklNocECnAvSHRjWZgJHHJwezUmpUmHlZQpTLDYAFcFHOgPaITWkUIqCWkTcVjRflnBZHaPXZkXdAGvsqVKdPSjNcoVCwaOPszZIObJZRpfHsmJhkzDcmFCtDNNdYNLuPceGAvfaayf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dyMjZOcINTUMLANQot = [UIImage imageWithData:hTTndgRGGZyYbxcZgbfiTILc];
	dyMjZOcINTUMLANQot = [UIImage imageNamed:@"wHhdoCwEwpJjLRrmjrVgOCZBFiVhWJlNtRoslZNZnCFygIUJeGIzVerKxcbBBRdhtuHfsfmjPRobXOHpAtnzDTnSWGvchuHHLdvFMJdBrkeKaoLGHWYbaBcBlusCkW"];
	return dyMjZOcINTUMLANQot;
}

+ (nonnull NSDictionary *)UvcfswAaYwdKhAs :(nonnull NSData *)qAjtqQkPeclQCxiCaGbFyPkR {
	NSDictionary *GGeGssRtYeWiINStRxFsc = @{
		@"TjNVBJjdDtbmFElFtxMH": @"PrRtWRueuZFALhBHqmPPGXXgpaHuRwYPlpuDdpsvMZOYnwkyeSjADWbKYFrHbJiXbaYHjNETmcQZnMAFMXgHflCYBVtQwVcounrjTporfyl",
		@"iiMjYiOhUDHoClsEQsgE": @"OEvoDwRvUViVKcGOWneQRFIGgduyzMEpKHgimlKyyHZpRRayDSaigttPydGUFevGTtwLBYAnqwPjAmZbHxfxetRVwhLwUCZsOiAEXLBEEIfYNPGkcRfCReFyaYhvvyVPDtKYFCjvEyCfdAPVdIjG",
		@"oDlxWtckiRqv": @"HhbEqUUUylvgaOJIVQeymrbvYZMsRypFZeVaXmHdiLTWLNzEPOKjDtlciGGlSBAloFmQrBcpITPACtCuLCeFWBxXOFDKwQAcUIdwJSsmIclxo",
		@"aYWSpgwklLFJjYDslo": @"JYIsKSkKAHtBgmjyEJfIwIohbDjeogagNwnBeTOQsnVCRgoQuwcGQzXowSxMRUJTIxFsGYSqTaSvFgPHGPbDMzmzCPjvXFCyZfnOMLxxLeCubVwatwGreiIxVCCOIxnPDlyPAOdAiot",
		@"HiatPmNMsqTqGsWmXLBhE": @"ufsJURGFcPyTHzRIYudDKguWmMxjGdIrRaRNQRDQMNKSvYtYqfglWhLfjpQJodavTyKuCfFBGrAhcdREmJjLXcuXTgAzzDvAidWGUkSITcypkPHPAH",
		@"DVMcaztuqusWFuIQOhQgkGw": @"qmQEgEfPcuuwxoYOIIyvEvCdUvPbBVcBgTTGdYVzFBkTQfGjnouNpxKtcVYoNVkRVKfWsQSKGPIQPIPoCATzmThmsqQsdxSLnBmnoXLDSMiMEjUQYYHnwoazSQkVCDo",
		@"EpQUNSOSvZUKfiBHquTTge": @"qoIprtkheQUKuBfvGguRFtdsNfmmYoFEKxVHntvBumiInOWhaxvXaHsNXdizRlgqYBQDNNqSRizEHlGYBeifhItMrSuZRUQhIJrnZNCLvoYtpytgDicTdRgsZLYjhAVISNFFoNaRWQwaNVLisEck",
		@"gbSyGJeezdlsJiswC": @"TYJZdFzwnWdHqvPrsRLswvOAcUQPOCLyaGxRMOUsEKFVVTVUFRtPvqUnpgsUpawfLyVbKRzUGaSVQNMOlnKwmjjGlGfYIErFmSoCNTXsdFYzLhRuzlpIdvLdW",
		@"McLoNdvmhQN": @"zQZprDkLoqEXLsTIaBdfGsTzpRGUrWbYkXJpJCEOlwvIyZoknvvjbIEkohHrsBjzbPcgARrfrAyMIePhYRDKnIHBOXQCHswzzaDuVjfQYNrXkHzGkZbhCxDlBIWDPunzrxQuhzZFQXkQkAbKcj",
		@"cpXmbJWyrfxmPTsS": @"gRjaWZMxuHBuumAnybZGHJcBODfcwFGQzCmIoHGrNkFVGXdPFhXRrCTYLbAqITxwsVvkdsrxAJLqEEZASTgySuhjiyFpsAkNXmjTppGGYcSolFLJfvfpxbghtrgJNSLUhovCZBAfMv",
		@"umZlqCUfTdyHYFocGZDD": @"GSmZnIuWGaHUPUnfdKIGgmiNLRedgPlDUKFXUjlwJAiFYtbKWabSsgeBUvtKrWBqPvvnjluyOrzGcySrTHgPKBpDeFgYXsfVNbZgwCxZGzuggM",
		@"ktVstVwwRdpfpiczKDnXXDeo": @"VCjVuvJcHnbyDVTrHesASgFjvkoKsaCzeNejbOcbReeQruMFvncTDvSBLBHPtXSwtGGgmTSqsRGDQpSdGgngaPMfioHyHipGnmowyLJALLXZqqtjjifGqfklJsKaaYbJuPMlYd",
		@"RbncEdNcKUaBb": @"kDDJYhjcAudYbcEilTWqiSonEyAcECtjwYWUSzArBlRSwuERhOjxBcVYksovWwbitXmgBmdvbkKPLWqnEQEXFTbARbHRXrnYeSZhSNEjnqWkDxrsTCErTJSqPchBAJDzQ",
		@"PxsMrFBMfIHXGcZXzgDBWCQb": @"oiAdFaYFOisxqehzOgxRTdRSyIXOKVWaQEQrpuhbPcBtFBBUqEFRikPlIRXrZrPsDJlghPfrfLwFQrphCBEbKcZxbENowPmOmYIUwoQRuRFUKMGNMnBPqttPcjGXRVnJhAjwdNGkOESrSlGNBUd",
		@"qyLpLJHShuTAXc": @"YmbpIetOxNPLRQdlDRcawaHRhOkkxsBBmyKWROQHCRXqYRqEAQBtGoEXGbJUACTLFeEZTmPMfWZhjMFBYSMGTZwxnEjPIQGFVOHCrRlSuphdcGjy",
		@"zQcLVGahVuIaZPmjmVf": @"UcPrqwERmqYZgIZOldGZSMxPKrlFxVSnpTRqiwgiCsMZURVDWjJCZnhlLLZvkItfEuPgiEcQYwefUbqCEOzBPKCwraEupTNpRQIikFsjkkKWmcXtkBETTAbBsVNDyIotpddw",
		@"lNtlsNlGidCeME": @"filokjzZdxpVZjgjhPUZtWAQSOIJJquaxAfkLgauQYgGIMviNgcxMGycWGYLoepDwuwyNEJNvHxumvNXaktatoarpFrSAnjLXSXzTROKjUN",
		@"ocMFgvVMilKdZw": @"ylUvRBkBqXvxaKJHNdGUsonXlzUbPTeKbMNlvJHgWYnpFWaHtAKJbYsRhUKJlZrByoWvtmkjKYONcveiGekAVDBqbPVHVKYMlowtmCfTIyWilQhXHGGpyiIM",
	};
	return GGeGssRtYeWiINStRxFsc;
}

- (nonnull NSString *)pPJYogYIjGvefkf :(nonnull UIImage *)SWKHwXFazqS :(nonnull NSData *)GRqfCnHGVXq :(nonnull NSString *)FCDqGBoOYa :(nonnull UIImage *)BoHsWVvCoxGFzJDihyZnkmnL {
	NSString *EbhWupRGjoKHPQN = @"qLctfPEIttyUoLnWwVFhKBmOYTZgLgHYwsIdhOOZOLTbDPnPsSaIinToselsrczkRnOPrqWRUlJMMCGDbEHiOxTxJGNzmYaJvDqUEwk";
	return EbhWupRGjoKHPQN;
}

+ (nonnull NSString *)VWpptsQJLxtScwvCiCWTSmE :(nonnull NSDictionary *)RaCqNeCqwaMIBinbKU :(nonnull NSString *)fGfRKfKRTivjpHWQ :(nonnull NSData *)BbJYFbcTcZZ :(nonnull UIImage *)FzgcajtXGcclUbGxOYiDj {
	NSString *AWsLLHDgsZXD = @"vIsVRpQSxrXEGTfImjIukvzKlYzomMgamgKkkZKUQgbJGBWJSduYqSPBCcTWQJfYwcVoEytXqjkbKMYeDjhLMfplHuCoSjphhjtiAjUqsMAjX";
	return AWsLLHDgsZXD;
}

- (nonnull UIImage *)XFfLyQiKSUOfByYDyQlXEmtI :(nonnull NSDictionary *)IaAZsQwgDspJVhudsSb :(nonnull NSString *)rHyRdLBBrywFRr :(nonnull NSArray *)hvtJYRUGAVgpzfb :(nonnull NSDictionary *)YtZfkkjjijoqgzNmTM {
	NSData *wiLIYubNsfjVllcuf = [@"PKFUpMUQTBzQhifHOdTxDHfyooCPpwMxNEytbePRnourpxIazoQSURyqOcZOJdYgEiWFCyfobnpXbkOcAKfZbjnqunEkfawpxMvNMQOFNhdzqTJGpZdJdUhDXKvmvPgMrybVNDANSgqdraoChFRf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lpuzjvyWyuTWwrntfV = [UIImage imageWithData:wiLIYubNsfjVllcuf];
	lpuzjvyWyuTWwrntfV = [UIImage imageNamed:@"mBbGGkMIqPHumOMhfmELPFTjHVnUIAthdPZcYmYYvDkueYStKSLCsqJamkYQzqmKokHPjuuXIpvdjvpKHjQZycHjktvoBvpuJrMbpsaaWLaNSHNkxqUWfFIjtGeAY"];
	return lpuzjvyWyuTWwrntfV;
}

- (nonnull NSString *)LJqHyFNqAccXYcw :(nonnull NSDictionary *)UMojmrXtXvhAUYQzbgDA :(nonnull NSArray *)LOmtKluExZuoFhXR :(nonnull NSDictionary *)CPUyBaqNsjkI :(nonnull NSString *)duCeMLIEvFsLhu :(nonnull NSString *)pJKdgPCCbkQoMcIpE {
	NSString *XPvcfnZKHo = @"DhFRRLbIsICnMqROrbVFQSzvsppJngnNLnueXSxiWAhfwNzESHjMCPOUehrVRGZzgUZSQUcwGjOKGheXkXJGEwIaxPCFmMNitvGUTBFvAKUVzrZEwbRKFcDvvQzYBhUdUgyds";
	return XPvcfnZKHo;
}

+ (nonnull NSDictionary *)qNiHynXTpgQhNakbdo :(nonnull NSString *)ptslAjAsgSVMcd :(nonnull NSDictionary *)nrBBiMlYIDmgEw :(nonnull NSArray *)PFitYZOZTbrrduYSnnxpyXF {
	NSDictionary *flQeumYLXHwXjcl = @{
		@"SghdiGjCOOHAjxPqO": @"QRPTEIxWfXeIzpenvxONWIgCYbYVuUwkOrSWSudBIVDwobxjblrQTLJECSEiAsJKMFolAxiIQteskrWiQZMTUTVAAYifWeRfPPHToXYCIJIr",
		@"jsyPNdwCTJPeyRDaOGPoVWD": @"IiFLbLYCkkPwooDxhfeUrHEfwrhJgcngSwPTgNsfwjsJWHgRrZasDXyXornHNGLkxEbyuiZUXTcgoqMSIqvQxedqqepVWMvhWFsTIvuKoayoWJOHmTljYvdbQnHYAMAporCqDJCtUnG",
		@"oESCEXVoEnYnEB": @"LiKeyUmvhFxGaMRbsFizluUQPOumqabLpPvGEdBCHwyEprqIdNHjzVCYOdJZwBuURidtAkuXsftWiAghJaHHiZqaIEshPoQmGhhTUpfJEhhdEgianPecQyHTgdxMnDWvWkURbpTWscOFRqIAqV",
		@"itHdNRvDyhyALDmmb": @"WJbHdOhoFwcfplUvkQzPHqVirVoYaaCqBJGaEqeRypHpYHYAEDcaqzJfjhVjzxsbvQgowKPhuMKvUOmKWkyvMBXwFkpIECNqATzzVkjHOTBsFDLwDOoKioVkDXxbKq",
		@"jDyZxZjLFlBOcEZ": @"QoQWAcyGdHHXunjCywhcukkYHPCDNYUJClKUZueUoJkapIDUXPNxNQCegvXHDnXnYuNzfwQEEkeTgwQGyHlLGcYYLrfjNFFDUjRsafGXjaHHuQdAKcILjQhfzDC",
		@"tlvianIjRgvigzBRQkKLZ": @"gdbRkzNWjMUgcZQHDniHlqGllhNqYhJcgSQGvGrLTCBDfErZENDDhYEyCBGGcQLAWItgJleJuAhhmXOcYzdTZtbcqGyZHLziWUAWiCDClqVoPcpgLneZaoaZgIAAXpvlywvhVAyiYdQmD",
		@"NILnApaexuxdxE": @"zJpNIgjerYrRMLkIqHTPMULrFbUsGrlcppdPqtvUryefkjJwxWmwNHsbbFpDTmLDsgkaOkOuFuolErvAUVivzKwOaelefcLydUHLbynWbyssrpzbdmDrBaUuNnjOrXlEEuCeIGrdIJTWTr",
		@"BeAFjFedluw": @"LAdbxkrJyZJFybOlVkpMOocWqiLdPSbwPmjUyjgoqDPNtfbDHRmuYbTyUDvNfkFXdthxKvvcAPQPeLIvduMhJEODZcCJhspjLgTauTLiCSDJqdLlJGmflHVYudqFujMjgCrezvuQAqrDaFZaXu",
		@"pXOgAHIPWeW": @"ZrcFYmbbPnfIgLvpHqyqqYMFmdpVrWKLDIpQBGmcdfwyzFbOJoYuSAZUGGMFowNigAauGKYKMBlJijNcGrynKPxlvSWXmuKzdGSgMVGqJNcK",
		@"fZwZeTRVMNgHPYE": @"XhvIeRIPlPbSYrekUXTRomwVIInDGooyrPOuLaUEOjhxpdSRXKBQETWloBfjTblmMHeLDXGDqetUqviDBZZFIEHTgllFNTDZEbPUIJkRomLVubHLqNye",
		@"yuNgoZuAvUz": @"TtvNeMAUVGYwslgarBZdBxMIhNBHgpaXZHkRYeiwTzFZwormITEWKfcsberkmwzSGqObtdzxpbQAeLkDrQXzJIhgHgyvjUJPkPIUuKfkgofUIEDmCAXXfjaFI",
		@"gpVvuQyNJCJLHKyaAHB": @"ofxDEVguuOMdnwQIQJALEpJlbUVxIviVKzCJglFnksCngrCnXqmNdAWlzbKxUCHyzQFCiyisUHoWsaUuLavkdnLWpjSDiJgTqEaLF",
		@"jwOwChsftFqJlHlaR": @"INbwnusKhuAgDitISHzJhSOGntkpoKotbpNGziTiWwlXITUwKXNNitiNGdDvJBObxFhIxQbtnGAuWocVzcHzEMtrFeEotxxLFRzBfTuKsqjcuPlblrHwttAAOxfmPMpphJbVuPKgVccoAVOxJBqx",
		@"HoiebGYIgjuLPZEBxgjMFoB": @"qLIVTXQPppjbLWKoiuvaXpaYpCFZUuGxUnkRczqYMHrxfupMohDWlCaSorQWfAVWyRioljhZGsBpcdFEoFlmgGFecGNHYsnlXJkxGxNQEbGaDmtCdzzWAGAPILRCibIwuLwjOlHekJFWAZdkwnU",
		@"QNNwQOdGDeUFFzNOS": @"NbQhAfFPrqtIfXqqoCpbrzijdRrsfWfHODgaawWhEENKyetFWLyDCuibJSIOIujBWGDBJVwIWnycnqTcscpKqpNdtLDpSrtziPpsjkxyUzsHyheQaFZiIDMzPSpgzXOHTpbogOdPAKOPdMxix",
		@"OqmlnThxfPuIAvs": @"SqTtatrYQNHwwpythwfAjTkfzHIbiEDttZciSFttctGQhGJnxkrXfYRyoyRreDUAYrBGtaAjQbUAAdghsDHBxdanPAyraBbiMHEwCXWuswRwOEnEGMMKimuigGnDxZerjz",
		@"SXVvulbVNsbOxJQwOauWgh": @"TDwCGMHhRSKLLTWsqlqUNxUOiQKCQwYzwjgqAnvkNuDtpLiXiXSbaYIecvOGnYmosKAqMQIZQjqmWlFqbqxswENqQQSHfqqPaYpBVgTUclGfiGayZcSxePSTtrx",
		@"pQYjEZHrggzvGjxBGltNgA": @"JsELsSgnSzQUqmsrFqBfxtkwFNjHgKKbkkyDuOWzJAqeElMERrxwiBODHjPXccmKeUtzGKYpsglbZNDFqCHlHbJrkEyMIvYDgVPGyvtqH",
		@"DuaxLubKTigfQGaIlKGBTTT": @"pPuiCLrsGNOINtxwqdGjLctLDmWZDmEvAFzpMyKUgHSycKWDPLqaTiNvfAnZSAbIgfOnOkscQJnOXtzdTUeqvWwrsEkkyVhQpqZzwKKBEcnbXWmWrjpBBhmorRexHNUUklipTpxTTJlg",
	};
	return flQeumYLXHwXjcl;
}

+ (nonnull UIImage *)qHrMvxphnmlnIZzmViRZYR :(nonnull UIImage *)wAYFHRMofxEhksNjSNfC :(nonnull NSString *)SlIThlWxOSzT :(nonnull NSString *)MaRHRXDRbCSIQmWqbVw :(nonnull UIImage *)xbqJgxxdCODTO {
	NSData *rzFwXADbGoSMjodTuFNyhc = [@"GrzyHWOKKwSsyBfHQsQnYhhNAroDiFDwOaZAtFSEAmfBnzmveiTkBvBPfRvwcWrClmRqdOMkFpErgqpzKHTMzNddAFrYiwLOIordZuPHCjHQrDsNaTphdhkblRrCIknCOCOWxU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TKDKeMsiXpotbs = [UIImage imageWithData:rzFwXADbGoSMjodTuFNyhc];
	TKDKeMsiXpotbs = [UIImage imageNamed:@"HjpCGlynXSdqToywuMevIESeLWSavzVYUDdfgxNXiBQKngCNDsHKsWZbEhtmZZuuFTRJuCJjyKKwflldDHvJCYlnoepzMRoGjAQYVeShAErlIcRkQtRtolTsWf"];
	return TKDKeMsiXpotbs;
}

+ (nonnull NSString *)rKsVPbQuLNogmCAgCbRiBpVs :(nonnull NSDictionary *)BLVoMTjbDGzQPwxHjFDp :(nonnull NSString *)cPvFRscpLoAIHAiVI :(nonnull NSData *)PyShzvRENaqlzkVpH :(nonnull NSArray *)zznhnBKchS :(nonnull UIImage *)STNrYmhfoybGHuqBA {
	NSString *APeooNPNGdIigKzWAZUkuWnS = @"RJWsmCnJWAdExXovptAlOlZCSBPypWmEywtjEHJPrJVKdNlncUFpaAcMgXjliLGvHdAJjRooldvYOcsIMWqNebnAYFJXXiPJyJqgEvLP";
	return APeooNPNGdIigKzWAZUkuWnS;
}

- (nonnull NSString *)HoGTKiEqaLOa :(nonnull NSData *)smKxkMdMqyBhQkwJ :(nonnull NSData *)TtQgfYXQnnIpJQV {
	NSString *FRpOMRlTpeSxWu = @"LQSsizixQeUunsgoAjBbyneuXkGuzotWbiJczLJmTotQwWIbkdcicfoNuIBAMPjIjtenjzNgpRKwaqvvgeyLJeMUpUqSiXcCLNPyUbEP";
	return FRpOMRlTpeSxWu;
}

- (nonnull UIImage *)sZfcimTilwTbwmaztU :(nonnull NSData *)zFawoinuPGdWakhkMJqwHFqy :(nonnull NSDictionary *)uxkIsmSWDoU :(nonnull NSData *)GxNcxCNkbQ {
	NSData *OGOLaSxMKtzZp = [@"VggpHWbIGyEuafwypdDCmZKIdEHckZUvcreHXEdsdwuYCMndLXmiUNGSgtleTyVBhnZCtUstCDYmLNUCoAsUYMRnQkmERQXZBYsbBdUDzcJpbZBosdFSGcSvVYXM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KsVaRQjfBmJsGrYaEAk = [UIImage imageWithData:OGOLaSxMKtzZp];
	KsVaRQjfBmJsGrYaEAk = [UIImage imageNamed:@"yXiKmoWzItcOROVzNaJMYDfjlicNBeXndiUayrkqBDntDFKPeyhCQIRFsOaPJHkNkCQIetOaDyxFGYXOmPoDYbsfpKdBDQqGeRqdSHhumPeKAvbPzHXUtEeBLOtdKiR"];
	return KsVaRQjfBmJsGrYaEAk;
}

+ (nonnull NSArray *)zJrnUXBSfpCucTw :(nonnull UIImage *)ehJrDTthHVyTuBgK :(nonnull NSData *)nyJkuHUhGascaMui :(nonnull NSArray *)WfjBljLKfwwmXTGDIegYB :(nonnull NSString *)VjYssoNseJjNPpkMIodpBA :(nonnull NSArray *)cRcbTJjcZZbra {
	NSArray *rFootkQSZccCbcTESx = @[
		@"wGgcyVJvPugsufgBJOFyCvhnuXeipcNHysnnJPlpAKImaKTRBCqIeRLundDUVnMLJCsIIIOAyEzBXSAvsNMHLsVFhwvKSAroUTodkAVFAZuozkDFbmQKRrLzvvonFbISVkoJtauYrBICyvwDmGxw",
		@"oAKiRxlAFpvdNzxMgxysOWSJvVEQKOBCLiwijCJipPYyFKogbgLtmnWhoVnoXtPuKlCCMRAdWWgJqhfzCxyZsvzqzRHnTVjfBjaEIXnZrfTJhPmLntuSQWnCIDTqpKD",
		@"UGveeHGWDBdPkJpCsebLdVfRYPWrYmZPIyRCtxgPiYiULPeAYwOEIvvRLwfADataXdEzUKYztDrbDxzSemHHpZQPnaOmFljmjgqfmKsNCrTpCKlMGNXrCtcGEopamJIwEUGQaldJT",
		@"dZgbElqhgJmlpbruNiGcGzxSXDJlirjfmjXKhREWdXhrQCNDmDOQVFpWZJqnQuMtanXGUZMbUkYfXcdNznOBvNfNroKysjGbEMfASwcniGxnaqXKeERbgEAq",
		@"pfblzeCZhJmXXFJCGPyarooFknNlzxiSOOTKEpCgDLFkVHXBhFVfMpEdVLjyRnWxJPxSieUGtWLDVmrScpLkjxfmMNmPSwdciUoxQSFILagMFwIigZkNUqgjorqjQPqAnJwgDRDnBeOjwAF",
		@"SsKXOTtpHahYgWXDQQXQsWXzNSMfUZewYrpkRnnNSmkFwRZjAdYIXZTleVGOAmbYintmTmAFXcVewneKKcHZixkgyrQoOxCvTnLwYZnHVLCPfietbcltuahWlLRCfjxatbeedlbQWzvxjLdKKSPHL",
		@"EtjjLLzxzFfULKLjrFeUoHuQRUCoFJqZcOmymIQVVPeLfaOTCCHjtDKKthLrdjAYqguNAkVDhIYHSBEgDVqBWhzzORZunaAdroMIOsVVMUNrCKiMWhUhkJ",
		@"lZgkNAHMZqbKbBmteOOjMuvsAYjcgxqbMReXOMBoUHfaIWSHTnFGYdHeGwYmkwvXLjcXIDAlscaScaTbEMgiqUpeEyzqpjBMoDjXVSQEavJrNyAICFkRX",
		@"aXhLlFUTDirRiKOmEdUGjFfSeJDxoimnrMasBLhBVfxruZzVreLErWhODjWboxVIMacpHroHHOhHCQsNsJOnVlcYPKUvUFIEByhznycckvdvEaZHfAmKsdbXuTwOLndpwbhQTksbsvpVDZCv",
		@"OFmYNrtAPVIkYoosvCQtKVRvHsdXVXdeuEkpPPyVyHKoMRyTMSjoayaNijPLXbklIoFEBsMuBABHQYoFAjAeNpddBFwsmiDTaNrxGjPtVdyKTlyrRJhH",
		@"KBGIkbdFkCmSVCnIoYClbjlGzcWmTiVaCNtJpAmXsCjfGPjbDDlsYCTrKbwJRjgPQCgdDhepUpoHzReQvYAQjIsEXttLPDzQdXIJgIDLfaRKhyThYvKPoMBtOLkGsSWosh",
		@"cxfUfEBWMItjWObrmeKsUsCvkFywFDlcJgofCESaPfGwadisTTgflXqsuFoCqOTJUhmxzyiscvClAvTtIGHyalkvKXEdYqYZBqrfMCrQBmiCOEzKVRRS",
		@"uKlvrJWnWUzINAaKXginPyUYtbOEaUQOtEHHKfwZOleMguaRIuJJQfgbMWNlCrfXwsIjWxitGfxTyOQNZFFtClEhFOoUKtpLbNxkxVudeRuFoplFxVG",
		@"AnKGYQtPzOxxhOHguzSjntkxZZycyZUNeNHpSsseCSgobFFwJZptnsNkHLWvfWzzWaQQMVxivRQbiBTHASZkifAljXFGZPRzoSrYEVopSbbL",
		@"RqNpMkSYMIMxcgfqlRXkstgusIUheWZFldejOLzPsYvdRTUdNzaSUkHQpumpQpXZsASCQgufEMMWJBdXAxLlzzbswDytjcCFXNTPCoWFreoubGVjnnzNXmHMcpYLqxZDQBKYZCjKHSHK",
	];
	return rFootkQSZccCbcTESx;
}

+ (nonnull NSData *)VGQoqnmPdlGzB :(nonnull NSArray *)RpyMhmVMwQqMSO :(nonnull UIImage *)zKLyRGUeIRyekMNgWPepiA {
	NSData *dtWnJIGPBiMZVzYkBnVjq = [@"OQNNYEnwOKWrYzoUBhhcexHprDyflraabVPTkJjLRKiOqpqvBcPNFRkrjaqyFzbIGNdsKaFMqghIrAxRyQFSLlOylvCDswGgIPDHuUOKwnTuKUfDdBcYct" dataUsingEncoding:NSUTF8StringEncoding];
	return dtWnJIGPBiMZVzYkBnVjq;
}

- (nonnull NSArray *)FgKpzjDanfl :(nonnull NSString *)NkbDPvndJEOBMcr :(nonnull UIImage *)aONdMPNFgZeKi :(nonnull NSDictionary *)YEihxZqUPXhz {
	NSArray *FanOrnJhXD = @[
		@"uQwamSnLwFUEbSTccqdpkoHdPJzpDjvMRAzTPcZYLxjJrNRITACvNLTujLPRgPYxQPVqJliVUHHQHOecDgtaHsydZXkSkhQgISinuoYgTIUxrSkZwg",
		@"HwIRLtcJWVWRGPDmPSIwSpQLgTOnfatCSLwoBQHsXntMubpRpKbzzJOKISjmzxpTubZLVlYjunpThpHWojqeNWUBELsGMMkklUEtGjuoldAIvOMaoRTekBjJhIMkpOFtmjZNKTsK",
		@"DkuyMzpBzJNVkioiASCSlIijqSEeHNmEJVphtEvxpTxpBGAklxGwKyImJksGGPPBGzMuXzoJhVNEjtuTyZgMEPJBTkrvQoKEGAZPBpiBijrvFJNNRNIEeoWlCsOUhjAtfImHQmcZWmqv",
		@"OgLtvLdcRJTBGrclHAyEDVgKkbArvEqGyHlRXWISyimZeozMpWmqsmMWQyiRViImestCxxTyVyLqFlzHOKeNiemMXCjqnihfriXiEtrTJFLaLRVeMkzULoyluCqNH",
		@"LqeTPEgGciVAQBHBVOjpKRmLixfYcOHUlcvNZsGyKbKUXQNzoYRGbmfsyobTSANLJbAuTMklDcQbFYfOJrhcPQHlPIqTgKMvMRXzPGTkrkiHVFccSqDvsvNYbmesjJFwHvmisLf",
		@"koWINTjWEfwbXNyxYVzfEbDtysNuflGhyEBtgRUAmdWaxlBFFpSstAIsYSSjcHGompPtiUHkdooqCphUTBysXxbMJueheQvgYFSizDcvTffGhPezUdPNdfwogFBbULoxkKSCCCkVZwjDEwAEJMxuE",
		@"bBRtpjoeGakuEtYsCJXbyrIszYMTPgmLoauBkwJCrZCeTsqWugvEGeLlNzGnItrEOMrXYWJiXtfuDbjzGUlNfXUuyUizFqrxVTgfGbzwRXludmnvHkiCTSuRkKQltBTQRr",
		@"EDGwztncQJflsTMmDueWdNgoAJSznffYDFJoRBbVXeKUnOdIsAQTitBagNxfkJDMenbCidIdahDyjabvRirugBMyVZJkwZUUBAMjaJdaPpaSRvYLHPvgOGpmEFDBDFcTMNhXukPnhsEpMcT",
		@"zKJOXkQKMnHBkKoakdPImhvCicSwhsmeSiCJBfOFGNRuGEJtUHxQFIvFisThggFtYAlmiPgeGYnHGTNemkUwLhPLTIYEBPnyiKKNgEUJHeRewLywfDzgPUrnVaFpfCPmIN",
		@"KZtvuZOtKHlOXedyHMWkvqpuYdpqozFINVToaNHDqsmbeMJuRnxDIJNnRyHWbQHEsZSLNCalDOpNTuepoFTXAiOnRmmNgdImPrzQOjgxwoWobxTsemEujAliLIIuzFlkMDktmgOa",
		@"QRyYdfoXSWRuCpWdPFxwbNlMYMBsZAKZoHKFFpFljWpBMrRNgdxccRKnHCiDGIMUtHcujHkvLEWZNECoyuLrlSwadeHpNNveMBTuPdQAm",
		@"bUDBOJIonFMxFxMUElvWnxvbPdfzivRHxUUBFdhUsqIRUzFlLxqGupdIMERqQAuwPnmxTjvjKRVkQXLvyTDcuooZovCpLeKZLqyEdtNhWkbSUDhdhQWW",
		@"zEeutIJBgvAkKpVIUtUCUVlEeWMJRQUfsMFrEiCrcCxCrqMuSjMQsDoUTiwXaWeuQKhRRieweyNOyuJPoDbgJEpDSvXqvDLHrIeLhNLGQgIaTplfdvTkaNHmRQtkatRdfdKseXUvtZLgP",
		@"EsqrIcmIZbNhAnMdmNanpKPdeKbgxdQvGLqrFsbXvgvxFtRvcJGGOpBghfoeNWuaqovXTfReMUiJWumrlutKRcZkcNvnQtkJBXIxAb",
	];
	return FanOrnJhXD;
}

+ (nonnull NSDictionary *)RZJuBRsbjt :(nonnull UIImage *)nFMZFoFICq :(nonnull NSArray *)ZEXcSHDFEBalMItExpiNtBCi :(nonnull NSData *)CqeXTyzzriZibCrEAU :(nonnull NSString *)ACOLIIKdMrCj :(nonnull NSArray *)ATXKMFUOWji {
	NSDictionary *FrQwXpJrxqZM = @{
		@"nLxXkQQiidbUtnvqm": @"QxuaOScOOMDbHZHcWFqFwWvtgPAzKAyzARuLzzSoluwBfuOdlAgbbgsTSzHtXqXAorivKBwwuAHpjWkFAHXUUlodgXXtxtZTAxHVSXUZvmJCogUSDbZCMWyvoUUZItJoLsAnoyiKhXNhwKcKyQ",
		@"IOPiqxbrILaeGvE": @"jygACzMGAPFZMcrdIoGhKQofCkVnwUFGpqKBTUwAmzpaeEMMQTawIFMgELujIcOlSHfLhlEjLAdksTiDqtBglcjKwVHzHaMMSCKlqEqIJALYZMAeVOGlgkbSPbcatdZvRqYhAXEfZPf",
		@"AIPUzoAfvdEM": @"OYOvnsizVrQbZiIbPYOwAivAsxkEomTghNWzXOycJDTarURwppYTSfarFRFUrHJenOpHZCejwfTxuiQDGMOeJLGRQNpVFeKwgXSeMLNJfpoTtFnAJQRwHqrDPCpnYUoDOIRgcvlhpfbWTUFDh",
		@"xWfRGvDWOxPhobmntvzOLwT": @"ylpmbhDptDvXqVjWTOUnxfUTPwoDSomRHMMBfUIYnQsaVsEuVtuLsbcmnpHAPzWhaXLYmMMojFOPWTraeGtKqPWhXaJIiouqzDAhPZEIFnrGVIfzDZGCrkITzQZilJRaiNEEupaVsGQW",
		@"pCKpOOhibiWloZwFdoW": @"HCakZWIEJJivJqVtZZRzGvTIwFqvEnMmiALQzLpXihJRWHvuRBdgtKNgomvLhQnLHFTVsKtwEvplAlPATSYQFQvymgAXGBCrAEQAWJfErjggHOcIdpncBEgAHRiVwwNhG",
		@"SDiGEySftXkwbRK": @"IhJQbnaFCVFmHhGsMrSZqwULRQqSUPqnpIMnCcVmKXxOmMJGkraOcyIhtkOmdhvRDkcrJkzNFVjgjnIMDyjDwldzAPfjmbkUkTTCGH",
		@"TshwJOqsTwuJSqSZz": @"mzKxrrpJChemHHalyUzyoYvChBIndDfanTFaOSmqqtMgPHQlEblOLFZAaADkOZWgIxAAFNtiGCNWMgRdXkLpHQYOUIIdNZAhAVWeKeUfrgIildAyBhELKvXVaCKHOGEfjwfNQdTENCWaNNSIseQ",
		@"UQtDXpuvNtkKnKztCYfOJl": @"NPiZoRZSzytyaCfobXQZJPoDRkqkXAkLSjamhMEqwkPqHabPEpYBxmCgFUELBhRtPOmRSPUtxtMCuLqBPbwSTySlQldngvTPpZAygbeJlfcRczt",
		@"PHHcqLJBXkrVqUmiLp": @"AcNzWXWpTJOUXWYmJcaekUhvLSwzJUNMIqgTNeiNVQEJVSpwCCPLHTsHgsMjTzvZHtXDTIhLiTgbmmxApxvOJBPNuRxtzkdTwfRjURTWgnUzyXMyEXZrBzpeKUvhBOenbbdTfdcsOGgMzc",
		@"BKOnmKXylct": @"InxyfXxBXnllJqSpRTimrVQxzytpSHNKMIfwnSIHPVuKwirwDyEmakhdJNIkbOeiWLquBqFltXuqLMRTmkwbeDUwgFklwxXWLwFtfdRmLxPgzmuoBnahDFRURuiIvRmkdGL",
		@"hIFVHQPFDgWuCiyUowcV": @"UpxqGRmJXDnlqXSLKHAWSMUiQQJEKUBlmVxjJLTlhMvXdhuaVoSbmXJpvbSfBJbfvgryNllCwKusfPFlULEuaUYtjarBBLaFNkVcKueijJKweEAzR",
		@"CcPLDsPYlIiHb": @"gNeAVWCNrBeLOovLSrQCuHanAAyzGeTrZpfvCrgyvfoPTeKHaKiITNsMmzzpIAFfWFEmYLRlEFrtdJEyxsQXQyKQuOLKLjNEbLZjUCwqPOqSnAKKivmWtCnNWkG",
		@"hbvrbjziCBvQAhGbTqc": @"aWVQjllqwECxTtrxifJJBeIELzwKLaLUhiHKdVXUvAmiVqKzrJymGZkXdpQiYoSamvjjWZjxNrZnqxbndiLnKxEKwpBPdjzkkPnfitxICtrRaZURf",
		@"BmLGrwJwOcac": @"ygGOyZurGFHwqMAwpdfyDcXGshFgFEeQSNSCdNcoEpDhIlrlPeapRvXNANPbJbdEIsjtOvqqFpAYoAmiJBoSBKuHDOzHvKYhIldJfKlvbqPbOyjpkYemnVUTHXZREOkHoSRUKAjbBVKuRDRGuO",
		@"sxhsnDMZuXW": @"PsTHghOepDOFzAmcPkQhAuGDcaembqEDimBykpGTCBMEKPtDjqxhcVvCACpgqzFqYtHKmoEqvzTTudwEJDEBdnKYkGcvoNflrYdvduxeJGayCOEkOEwklJXpKsOHOxMSpWI",
		@"SzkxXNvfLa": @"RzENuMwkPLvqzaQqaicEoVYHlvywUSdlpookckSpteGnziEoXaRDHwTqXFqDpqqrgcVjHpFdOtQJTOAsteJDvYQNPERZtHQenBlODqGLWEuUbQuMCueAjUXwjzmLxXqGWVMQLVJrRNYbJCYQk",
		@"vHZGWqyUXIDwvRMSENpI": @"XEzIhefrsXXRdzJFgbyzyMeTVRqeKJphpfrsdKwAqbrWSCspAsPTVGONMiPivtaKXyPOIhtITZYRfKDDvkWIbqwgUSjPEyCtsiwGuWQkPyEnOKYbyJalbZjhCeGKaFxpocD",
		@"jjEaHYsgMbANkZIYNA": @"CahGUPaPhdMVdoGgbGZjkdNXdkAWaSEaoFxrkTIXihfQcFkfHkzSJbQNeRatYBzAZjlVrBPYMBjWsUQXmXoDWbPbeTAswyYpdQRjQJzbunIzPHiPEBhtbcYTRcG",
	};
	return FrQwXpJrxqZM;
}

+ (nonnull NSString *)acvtcCGksQU :(nonnull NSData *)XoJpycGitVNOnT :(nonnull NSData *)CKmbefQTCdRnjyU :(nonnull NSArray *)rIqYHXIiogso {
	NSString *RkmURfobpqlBTpbs = @"mGfsDPIRcuBaWVeCMSZGXzSXnNrtQblOwdpiUVmOzuBLIbvyAXkuYzTbzyfLzeZIDYYoBWWvdPNfXzeHdvoxaBAXoVmUmOaESXdvVVOPGUUljXEZjXWTkSmRkEGpXOjrmaxFnrNcrKzTfhVZ";
	return RkmURfobpqlBTpbs;
}

- (nonnull NSArray *)ydkUQMMvxwoPdJJFd :(nonnull NSData *)GvOuuWkWxFZZFlx {
	NSArray *mKwvlRCFLQMAErNATUcS = @[
		@"RhvxTfsjbKxlFizeeqfXtykskkcTfQgfpUvCKaSAaPqiyqyGpijvaWXGNXJsKhPZoJHPzPLeXSbzPLqZPFcdmfNHLiHMGLbuGVsAMCzRJidqfvyKE",
		@"wzzyHvZHzOCyzMbTbRgPRamYjaESqkWkKQncxPJlnoMFbTrrqEXlDvnTtZdYABjHIsfjYCckJxwBFjyaFTIGwhnIpHrxXvgPCpFwnOvgvXAtMHRcXurWvFKgDv",
		@"jvXgWzdInjNdTCXcOzVFLlORwIrXaxzmigDTJPAbKfHvGRFFpOwWOecOsrijvChcfgtDpxVuXWuGRyqnrITdkPLomYXLMoNrIczMeOHuRzEammogSRGPSi",
		@"ZyHhBbRhuCVdSstcdeUxSUTDZfYXdcINSGmXfoNCSkYVYVpTxowLTqJSDzyopIhVWDMFLqRgqzhgxBBgQNboqnktVAcoaXeXaTKhSIuHxLzACYyxSocnwMhdPU",
		@"qkRUzMhDeZDRWIIMBlkTwJrawqZfDrJVEstyLUkQLiQuVcbFfKPFIfDRuuueNtmmrrbCXBziQFhGbNpeHGCkqkJXixzqLVZKwPrWzZSkwSDPjjswwYBoZwjIRPUFJZPWhEcdetyVjq",
		@"XesNRVPMAAkxunujkVnWZqPgQlIzUJvVOgPqhxwRLgsjEYSHDEREhxdZwsPrWApmLYxMKcsMhZSTQFGFtGbzCfUYbDqAJuLNlyoIhUoCtCWwTK",
		@"dXabkEbcLUuHFLRgrHAwHNqGMOjaLUwnUrGlEfaeOFokyoKXWpEhiJKDkshUAhRFmgpcvOitNupOAviwPCMwAFXmmJqDUclJxRhvhtCBAXuFCAlNTzicEHt",
		@"nyhrtYNfDYFYgeaOciPtpCJNoPAqgFLLUGbNupRxBTdASqlyBYJtkeuYeXjJHkKsjuFxFrtyqhsbJXWBlrqfcPDQVEiwxIynyJVhyXShGArgcDiOHUNxWhqbKRDziPuasxSYjRXEMppkYusNlc",
		@"iznxOmBNIGbUEkgOhAXcYQKEgwECCyhtqkYwwJyRsrYkgGUnRqoUIEnSkVpCrcdgXAlFgTpAwNKGxVScSWXxUwKGNJlipMDwRYPiqhjZWxcKGihYpAlculwVtTxUOJX",
		@"puCghljqeiLdYMjXTWzXbcVKzGhDaMFKchyhzKvZCfeUOFebjVMkVzfdkviDVGtiJXHIPLmrUmyEFnvpOEBnzZVPTuHUVsjnZtyoEURJrWrqmrhGwvBjsIbBisiCmlILeixudajbzhtsULM",
		@"UoOoFggtQCXxpLyUBOstlsNqxAYYNkDdjvOjDnEaCgdlugAoCdyWRRXjQjTOYhxZuYaOYFtGKRJgbhUZMjIybuwImSpbNGLQzkVWhehVVdSLKJGOclUFdrJzvIkEMZcXYBNqzrbFjRMGPtyd",
		@"TWQBCpmvKSXdFUvzmUFntKTesVLjrqFZDptFVSdqYFMvjkTQSccAIJfejnLprYQgrrovNKexFPoFqZEAffPvzEFvboNsBkYGNwBUsbQZVEnPNihFxFYTZXUJsxCBrimRhScNd",
		@"KzIdFEtJCwFkkoyViZAydLzXMEdZQgLqdOKvZGwYTRziNynZtufySfVTXJXuoRborqXSsFUoPkoxxhuoINvWZoYJZfDWXbBtbQayONkdGGYDaLYpsTYwchLXxpXvEoytVyV",
		@"JRrdiENXcHTfnOQnBYxUoxXRuWDsiocrftKCDnQKIlLVfFoGFGzLipVBsoLCBOdtdROSDHvVwqJREBNBePrugDiXQDBHLSWokpbsSHQmaLmQMGNyrmnOQtJWjsjVYssbqeph",
		@"iYDIUIOBnGpekNZGEfGuOXcRoyPwCedmxjuoAkfzotfLLESYJEujlZvqMaERlGIBVbZgmXpHyDdhjBeMIzFtZdxExyJRNhuDNOJCvldFKcUjhAuVoerMZxvKOUZfspOSUeChURzaItegbXXLJl",
		@"lGaSCvrowAPypYImmegADeNBYLqiVNrkhJNOYVwXYTfDVDHHnpPJertUBQYyQLcKKigtOkOMiRRmvSIOWZxnvNjnTXIHIdRNbfJwBZ",
	];
	return mKwvlRCFLQMAErNATUcS;
}

+ (nonnull NSData *)FvMTdrNgaIYMbaU :(nonnull UIImage *)knprGQnBiyR {
	NSData *YZikAqVBUwCIpMae = [@"vtjoWdvOSPHvlTBPwlWJWenhmFwrTsJPTLvuwmPDBOpMdqETXCamTkQXCYouDTrGnVzcsLYlPzHnDmrMJNNBPWZYdnBcYGLAFsWyYaI" dataUsingEncoding:NSUTF8StringEncoding];
	return YZikAqVBUwCIpMae;
}

- (nonnull NSData *)FaySBCxCwFUyRmL :(nonnull NSString *)AluFNWakfAzjrjg :(nonnull NSDictionary *)AmKjuSTxfDkZDxLig {
	NSData *ehHJpnXWCcyGioEcyAlOUCBk = [@"ZHgYSJiyOzXNDZMArZAHyaBZWUdraPVRCGzgyTMobMhNIeaBjOiyYWlvJpnbYupMHYnvRSPDEQQnscJDtQuogTvVTykbJNcLOaBGCUT" dataUsingEncoding:NSUTF8StringEncoding];
	return ehHJpnXWCcyGioEcyAlOUCBk;
}

- (nonnull NSData *)IPmmQCShNptqtQLzC :(nonnull NSArray *)aGlHyRMKitMza :(nonnull UIImage *)XDFgUiAPGNUlBJmmVZWV :(nonnull NSDictionary *)NQKPndhfvtfW :(nonnull UIImage *)MyZEHGPFtdSdHx {
	NSData *YoLkAKsLMJzDTEhQ = [@"WLylMOopseZsKEfPMvjRuNwnpGqmogxqSPVXUaWHQdNCpnfrLVysOXYtBPguvHtOuBPtdXANpqmzKefetlNsCYDUhdKRTlqJKLIbobtKACtXvDoXfDRYHHijhamLWCHOYWYddHyxqighzGtbbTBB" dataUsingEncoding:NSUTF8StringEncoding];
	return YoLkAKsLMJzDTEhQ;
}

+ (nonnull NSDictionary *)QWYyoDxOisdZ :(nonnull NSData *)AgdCYlNzBRcMcfJGGQuf :(nonnull UIImage *)jsNMBRWadgRnvlkw :(nonnull NSDictionary *)FrAiJFGGTiCxtNJ :(nonnull UIImage *)zylXWkHZkC {
	NSDictionary *SUkyhCwqkMKDTeOajujcsnu = @{
		@"NUcRMiMHTWOHgqjTRvqA": @"kFWqtSdQmhZyIbVhGSNoufbvyABgNNWQXQWPhWTUGeQWXhkKTrBUAYyJXUgdRMgbQCfsRYMxWDFCXczuXIqWcylNUrRISQxOqtwBHfTkdgUCGVKzOkJQbkqTvFFVpTBoIvaQkNubCfmdRotvQo",
		@"qvYbJYAyHxbIvnNoh": @"UPgsrQmXhNgDaJXTsMuFSdLxQrXWuzFYGRWyirrOKfdrrDkgaxrmtpFfYlWAvbGeUIthwFmSCHMHpRIGxdFWksnLnsgcPpdXlJdwRTndsesJuDLfGX",
		@"QzBpGtEERZSQJrAZrOXZm": @"KspjDGRrZPXbUwHwPlxPfnvzMqlRiMwSCDMQRpOLCEDAqGzOceDICOizDwidpjCZCEQTiGyUDxRapAftnbEztBDsXdWSBncqkqiGHhANurZzNFp",
		@"zDSgiHoxzFyYZlxHXEdBtvj": @"HtZkZLTnCOxPvtsTnsFXbPkBhqnjJOCmtfhIoMjeFTrvcSRIQGwtrZVHDZPaAOBBAlmzUEibNzlCeTbEDLkqrCPqgyjMWSmEOwKruyqNgkThWwvLpDnhsgqQBgs",
		@"eNRjqSxhUAbTQsRHGQeUDJeA": @"CWVsWfGrzmHpIjPzrOucdeiJXmrUyFtQYRViLnbpGYeleKCobSRCYAcCsCOqUiHixmuIQFFBNWBehFJlfxeUTNeCkCyIrplwlIaRdkgMlsthINjJnCoyPywJ",
		@"sHCLgeZLOrMg": @"memEhrdReeoUVYEIuKzXZHtjfmyQQRPFTeezCCuCSeDQvIUUmDeuwaJYwsYuKhghVxpTNZQPUbvZihcQxYzbxcWdEMSnylVQUAyKXIBKWMjvHwzhwoykYzdtWNNqKyPoYZeeeruVHdNCNvIUa",
		@"wWGNtDgeYWCkQABANjOs": @"cVAskTdbQcgFnlhbBhjUbVLoiqGGVKuOSpJqFWamQmeEqeeJLetkcrfQvXiwuuTcbCLOpuzSaKLSiHhJQDjfjOpedGIQvUPZLCxxxPvCfevupkijUBN",
		@"QorwPdRClsfABf": @"MdQeqPvScocwiyHfLAvXGCpxeLFwqawSZtbDADaDqYpEppFMExKDnzQwIZQcDvkXEmXUkWnDXVuJQRGeNLgnUEjEVxYOwlZzwQJSeUXezDyyPVVarIyuEshERqJStMeSrvnNGIiTjqjmyM",
		@"RNkxAbGFmxvGQFymIk": @"euLYsjnbhbGVyGwnzISJMgTxpdVCwvxUfUmGRtFBEQASBiCGhajDvBbDYjKIBdgUUxQKYGgYBHpjVxNdDwMcgSApXzcXWHtKZDTaQzbNVXlqp",
		@"PMZutKtPSOJwuojgd": @"eNorFeWAInvusiiLJxhtKOqYCpZkakCUrxafjrJkiPxLPccuegzclYaxRrlYWizhuEqvZkTIplYkcMHXVyqcKZHIbJVthdfCTOUNOnqPBFPnuQIioyvcGyAhVdwcHOplmxvmOOsTPwYcAoQsoC",
		@"YenQNbVIebdjc": @"ZLCBbGCjMObEcdpmwZXNJVEiOpXqETvaglRNDWyCxHRccwRgWmZIeCpDCdDJcXFATDMWLACiXxSOfbLJuVrjOomjFkmUxSmyjYJRXqWHCbEKKJrfd",
		@"CtgjmkRvaeMzvzvFJglELloA": @"fbhXqzlfxUEijrvkxwTSQrTUlaJKWzZLupQYeEgrJxujeqsukwYYBLRfQviyLxxFfATCtzYOnOCrWWyrveGOzXDEVwrRAjfecxJBrsO",
		@"uygFBMLbJbLMGypkZ": @"URkhczCKrxlpMXVAZshqGNcAgKAdWBsxyAHSsMkWQBirSVkMJXYFCQhDzNwytSbPuJVasOWKPssWxNnMLYIwHuDRvNUUJVRnFfwRgTwicChFedAimShgiIKXkHdFwcDaGntKXOYbPQxtDxssFI",
		@"wMclZPLAUuTcOmRqUlsBnB": @"duaMvflOOfhrIztvZkMZRzkaLkogOKkqqjBhXpUKnvOloBpQUfJUmPWyxxBfFuJtFsnEbBwtdxBQzFKkIwiGBILhSXMvPKPYHNkOBIlNBXezXhhsIOsSDUsipkHNGOVHasYRmmsMJRx",
		@"wBSsPyJjgvScAoNf": @"eiIBdpmobceUvWpBlyqYDTibNXYqqKMbOtaUbNVNGEBKqJDUGUzXnsOSyXDxnULyqGBFrvfULkFWIrAObUpRwqJOvFkqfDIRSXyLuoPBbNxacOLbxnrgGLqvUFuLPqGuyIdlqVHGp",
		@"YRVviSKdzRKNCQMzhZFWxcgj": @"ysDsOZVLOztlkvDnajzJCdiEvUDnjWAOZjcQQDfgFxZhvcaoCtPqtMTtulHaHcTtFIyrDRSPawbTNzZeoIkvtNXIwQgZXoFpybqIRPcrcBaDIuWQQgeakqTnAW",
		@"WmruEygmBZlByRCxQAMlTRf": @"OiZicniNTVmpQBUnukRZEedUHVofPVvNvdagNoviKUApFpRziGssgcSeBsgbYAqmdRNWsKyRVHhShLnHiLDYvbRhsJdIAuruiStoYtwM",
	};
	return SUkyhCwqkMKDTeOajujcsnu;
}

+ (nonnull UIImage *)DhBXAWhiPwUvfWZr :(nonnull UIImage *)OSGPnaEMzjnkZmJbvQmQmoHE :(nonnull NSDictionary *)YIMceOZwmsHzAfRHMMlxXJRE {
	NSData *nGdosSuRfaS = [@"LMfxlVFGZkAwUNEbiKeVlaIuzCOjWcomVqVlPSSsLEPnKewEZnkyBAEFAFlVVaBEAegbteJpgztFmggSadvLlcEPDBYspateiFegjQMsGpOiqYatMlrTbTqT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rLYRHeYkySqp = [UIImage imageWithData:nGdosSuRfaS];
	rLYRHeYkySqp = [UIImage imageNamed:@"NmAglpwSGpKnbfKceVVnVzYTPpYCHikueVqHorwYTPzaHRnOCnBxZZxbwOkXyuSfFTMAoLJgLapgxAzrXqXWFXztQMzerKSpbfUhkzoQXviToRFgxeEuYIZLITxmISBvlHpWsUOIRjKuETgOYv"];
	return rLYRHeYkySqp;
}

+ (nonnull NSString *)PwoRmEYXhGOfOpUwAh :(nonnull UIImage *)fBhXENhEoIuZhYOc {
	NSString *OZuAKHkDFjuxcGKHHrwsT = @"IFoaJUlRMTzinUyfyoqgqFGyJBWJgcZGUjSXMGTJZzDqeinPRWXYkHdwGYGAHYdUqsppexeDuoAJHtirnbsPGNLQMRefZmTjgfsBtsqUKPpwVZsu";
	return OZuAKHkDFjuxcGKHHrwsT;
}

- (nonnull NSDictionary *)wXMtzTgsGlPwJWdZiBDuY :(nonnull NSData *)pkqNFWlczpQnGCz :(nonnull NSString *)pSgKoYLLPtVkxNJFJqRvoFng :(nonnull NSDictionary *)MjAUPYDvbFQuqkHBO {
	NSDictionary *zgjKJCYoYe = @{
		@"PTwmOUgzPPkXWEdchwNuF": @"psaCycJsGgBNIaxNCLlZbrKYJskVjEDYnYqEtNmEqxKBQuIOuIepvSKmioglOTLDnzsBLlqzDMkNziGcqSTdLbGRbBTAPPXxAeOmrGtpFjeLuTcZmKEmV",
		@"yCGTATSUdMDJE": @"LdnPuppaXxYanfMbjMnYvfewADNzOnDOhNnAYFtVaicpsaIgQiLgGDOCgljVMVNusZJKWUZSCrQcGjYQRuRrVeRRaZVBCAAusoITugZekSmxUTAKLGdGGzRFnKVVt",
		@"UdGUIcePCYAiiRLDgn": @"kTwAvVMIPlIjZOuTerWAjNRLnuCdLoenmpmWBmbVlejtHijSnmiiAFHTCDeUFFwHKyqWzBsouBCohikkiUxZidUSYIbFXNcexGbiKwNZdKMwQeWdrodGqLgjnKOvxFTgzXzKijNReFLCkuL",
		@"NmlvLqdKjEPmzLU": @"jEnVQwxTWCCoCRdeiNrOBFdGLLQuiZpXRwApTJOzePORBiaiUpSvsbsHcAAosOUGVTrQtzIhJQRphhwXjmUzvxBGULKavrGmGOGPPOvnbvLYqeV",
		@"bTirTFkCKiQrxCxxJdjzG": @"fqrnxblhVlWPNgrEAwmzEpoCPDQvHJocFfMViIBVpdnNnrzaFoFsolKcRPlVBOlndYGxkfcZxYgdnYdDxOBCtQZNKbJbykiGpyQPQmObqaeDKyMkVAkEZVyoPC",
		@"cEdsuQXwlZkmvZlAgkHlHBa": @"YUCBvgobopuxyfszYypJEtzZbyTNqnKsFrzMoocYTGFmcAzfDEdqErJwVKbvVEIYLCbgKvPAUdXRyIbVmQrSGeQCYwTsdmQzWohSqaMSdAVQxhHgEfMyKVzIHSnQTmnPeBOsFEQ",
		@"PvlSGslvPtlGiZlZAeaGijf": @"pvDIMBiDLEeDCRdzlurSaVoXhJhqhhnslGRsoxmHhCkuBLMZdMFGptNzpwBMbALIjXhKUMXbEnVLDOnMreaTFrfUYlputIPlzkaJeUBhjrFXIYbGgevYcKfuXwszVdU",
		@"KTnJIOCGyG": @"PLtgVUEWwQgOkqJeWepUUvroHQzrEwmESPdfEyExkclPLEtmhyXjNRLtcBFtmTBARCeQOJJsNWAPZqtQDLCoDIiMyPTPfkaBcRxLifXqffLewyCSaxqQjlObLYvo",
		@"BACrzkYJZmQYFCyvH": @"gnVbhXcowTaKrZrsPesWzGSDBXadMBWOTEeSniMZPJMiYHiKiGIHqLYkvohaRkXGuTfDoARznbNUpNJXtQJABkPWBSfADxDCKDDwbkiPqGIUnUclPk",
		@"kyYpPpLKWvy": @"KYBZdlnxKLyrlVSPqfdAZQUPGeCfBnHvkjlGPcOcAcgqahoEVQMTPHvEVeWyzmebsTZRrksraHHgrICeQjciiKjxfFnBaQHnsvym",
		@"HvDnejRkGsOGgmdq": @"FbloyNclzyzgVYqkUDcgLzVDNeBgrMVWECcBQlkoCFnELvhxzhYglyhYgyWVljUBzQiJamKWeGWkAHpkDLJeyCuXibjSifLrDWds",
		@"ZogadnxdTnagtb": @"lDrgqwHLdmbUcLeNrHcSAjBINQFySDBMHRlbKEGiNBXBdSloMUECRayIZhBslcAsDsuQSDCVPyQeQnFxgOgqiTwShNcWxPjHsGlUewUIjbaOWBWUydZEwsUe",
	};
	return zgjKJCYoYe;
}

+ (nonnull NSArray *)rVvJQaTZSSYL :(nonnull NSString *)TRBTkxtlgKukQdvl :(nonnull NSData *)lJzyTaVLRswZb :(nonnull NSString *)GjPwUBaJGmLeqwDelX {
	NSArray *xLnGzxsRmymhPBprHeSv = @[
		@"AMJMYpdrGkXYQbqrmgxdeYscmEfJHaoIdlfyhXTYNlzuBQOnLFWngaJOleaIAqcEeFQBiFulYIaGuMyMMaTdrKIvaIpPPXYPLzrPSrAGxeyG",
		@"bXzWnjzKlZvAcOODyHQrquzxFvALtqiRdapldojHlOOcuuIOngjcfhrDJquVgurJDuEpojmmuZmJyJsuJVixJFsKQLbyfKVfPwjuaKkLiiYaLktY",
		@"wlaLAkKnOimrAVDaIXQaKWwRlcPouTQWThINctxJHMSRIXaIODQYoyBjLIbJHNsAQFCnNMWJhhMLocyxwdfomenDfYBSniPLhYBUyKokBDpgzxZYHQjfhcmL",
		@"CcZBqlMPnlgdxgHGtHFVfDZFXrvMmpjaImcssXhOOuWZrBFIbdSanDFildEyJyRRPNoyUAQWSRhsnSgtmShaxoYhDchwaBpokGRwAHvQmmiyBTUwNDfVykPRDiOJohbzuBrJROQFUvm",
		@"wmJSrVsCEFlxXoHgOmmyLcMcZRJTLAiQDIIOYOFPCWLvrmWORSZlTcCXzkSWkuZhhYfRHbZhVytOUqExzmmiywjgeWZvluMRRBRJbnXXUlSnOZwHfpVwSqXivThCZHnBJLedRBAWgywPabu",
		@"KzMFCOWakvwXEkqLZRaOWXaJiVReDlIyPiNLJPqNGbauXRYAyfDuzuiMwhdAJZQYgkgyfuxRPJRSFGlnBZjOnXMGSZEFDWeYISrNhrWQdzDyPhNbl",
		@"fJoWbJfSBDdqblhGGmVVqNrwZjYiEMXBkfYsoMMmMRbGalLnkUPUIZiXgennFhowFLrlhQvFWzrQQEVIzAmKuUadVsDuOMNQrnzWcWVcNJqiSOCWVUAcLYkLTyhkxEyrYZMRxwoAjfsxSIsijj",
		@"NGzXQdXLrVEOJPJrPAJrmUShrRYxoAaWNgqDWZDzcHzIAPHZXCusZZyiNlsltKXAqpanYJAUJJDfrSaokUyybkrweWGSkdZbQWQagzBXjOVGKDfVqnRkqGWEb",
		@"AqZonAtbEZbnjYlwilLYtEGtJRrOYppbIoFjNDlJkzXIHQLxtBDyLOqdzoMpPDYgqqJtEJlFNVaPvvMvneEZqfLUFFzEsGxOJqPRjcpxyYjLorkGKtpvjjLfjoh",
		@"mPGJMFyXGvISMSLeHxjGfnfyRMluiqkhrCPjceQtIDgRsKGRaWgzXfMPYhkQJVgYuIIePmZeOAQGQAhMgMfkboFgQNQZvknqGFrbwtlpiuCWzxuyhubQQmPlPGqXeBFjOsySksYoIdOdGpu",
		@"nNmILnMjDWxiktWpdOtoGDptYLCCjXkQmIAwbHCdCTaYBNcZEOUEmJXMywEiPRkHafGArcszhjFDuRDhjIsOytWdjQJsGqLaJmNrIrpjP",
		@"YFvPjqtaaJJpIiToHPBBxfxBXiYinKmHzEYhRbdfGMgjFoOABZuVUVFdBPXFuFfGIaqmMktBVwCsJmQsRZzMMPgRxxNRsdKZynvFoBuIKZyYZOKrdSbqjcnFMaQV",
		@"EgRIehvYqAHEOjbBtoSkTxxzowLZRgndgGcrJLuSEckOghvBoqomyFckYIaPolaRBRAwkVeDAFLlJqVYXZLfTkUmBotTXbHxFAzHeCzaSmUvRwskcjGcCTvePDbfTxdh",
		@"XBgekOiTlEDwKfgpLPxvliblLPGxtBOrouMSgWxBPkRBglagWXXggitnHFIHCVCfEEdvZNWbJBtVkQOkDXelugHoKQJIUggnvoPUIuQflvkeK",
		@"whEINbqeyRrHkjrtSGiQPWWtJNXhJIUWxUZeAhtSqfdCZibAHLglboBjCfnvlUhfntKApyaUZjCoCovEXtfuasirSnfIRhoyajLagksWfzNteuiuiFMkcMceNreTfCnVGCugqzrIbjKAEFuzDPMm",
	];
	return xLnGzxsRmymhPBprHeSv;
}

+ (nonnull NSDictionary *)jHIeAOXUsmAlnFi :(nonnull NSString *)bOHmJoOFfRJ :(nonnull NSData *)RsoLIHIzByWomIB :(nonnull NSArray *)JFfKQdLgjyxNaUxfC {
	NSDictionary *bWnShsAWgPBnmLksBVqHm = @{
		@"zMngTMfQExWPsCAvlEYTpi": @"pSkGadFyKqvlAeQJnxqwvKmakttwbVJLuneGKayMucVoHWOQRuRrzPgxDFRgBomngBIoZyzJUKkRRTFCioWZiaAJrfvSNnGjZBMGlbvquoCEAsLSBSetQxiDFqkjvXlNjkRHacUlfYtdCJdUU",
		@"OuRBHZYoVMBHg": @"IfaPwieIZQhWfplLuTJSbsawAfhCNxuhOCFLQrddbRRVSZUEMffXpafypJavGwdVxYAJWkNoysiHMVjlLVGCaoIxTTwwIyJbXRLxnYtHUMDdhKlORoKRtDXndyieTI",
		@"QKHGtQmbsRJHjTl": @"PkmimIwQopawkVuTLZlktkZypuQMNtiIJKMZGRTtUbVPKMtxbGpGjBMtYMBHOvSnAEbBzPznkaivsGiOftOOyivdQFOoYOdjRZXVplRxKgkOJSjhLhxnBDxvErFfTtRePsFd",
		@"UnfcfQkSFhMVzXIhqvi": @"TRXWpwMJTRqLHBhZPoXbbSwPLWhrmhtWKrUVTfTvBHjWzzxKUfHBNtvcGxfJiVUqXWgMqKvaHNuqUxNIDFdganJFShQuWjIpBVQFlUTVQdfSCDpsrAeFTLjbzvqiVQlelZabjGebdIJIXIquZ",
		@"mrPGMXbmMLtXVpsWviym": @"MIQVeYcidlhbcGjiPCMRaCdMmyHrlYUDSPuBVMiwUSyQHKzXpaOXDOVRfQbugCRtDHNrMjXYgcKOYvMCSjJemzGKAEINbCVLQptGvyTRyPu",
		@"LNHrPzChTbKKSRlANAc": @"FRKJtupYbUtjzexdfOObBRpCjcBxywWGLeJxhkYNGeVeoWaNHNfDaZoUiXpfwDOnQnqSMXwEeJBrKFavimVXyoZoZFAGQMUslhiHPOjJGBRkdAYPYpmLoWPrRiuzICOtCYLos",
		@"glfPWcpnxRbuRJFNdTbID": @"belMneBgQTNPqeBcQBjNjViLxHgZjEqfFYWdrJOAyknohpGJfVxZnrMrtVKFLePmRZlzRyLDOoqZqavGmVZyXazQIDSWdLqbQBHXKRHgbkHdKpzQIUgneVEjWeyQeo",
		@"rtVpRVwgdWonRtSpOWodqa": @"YtvyanLbtZDRCXDqLYiaKYLulVjCGfQCYFUHXuJUzQoyARSjFzZtnvYrSxEpoVTVXnJANcQlDmfPcSOxnhTePzNZSAQySGedlCWJZ",
		@"NHpuFRnPyzrTOUAamqeJnrv": @"lErSlNCOFfPqcMUKeTIJCZottDVweQlWDbLsexOjlolNPYjdPVKaSTSvFCWRcRZyepyIPBiNgOnZSsIJGkUPhaSMEonQbXriOhjiICctAIvctCIZaHNTBAZLgCCZhDnEFEmlBpbsgHLbvAwMMmX",
		@"crjwFvtPdra": @"jFNpQlGHQpLyfPMjavLIeiuMVqPGdtLLULwsEXObyrHfAvFWyStDsUNPunilZyOzAQOZuTOQueaapRgBjabrifgCPZZYMckeKiuKvtHejgNYruFzvzWZyak",
		@"CdQYPpRVifWvJkgKQd": @"QhkXEJueWidnwRdMdluqYMLFXSDTjdNKkAlTXaHFSkxotKSLDSwZZPHcSlrQBVvyjkeesrhWimBsLLZhpgRVkNtLRrFDnaoxKLqlgdfbhNMHvtIVMoFBWAfnSOaIIusHVBbjY",
	};
	return bWnShsAWgPBnmLksBVqHm;
}

- (nonnull NSArray *)XKgSKAIyxqtKRbdPJH :(nonnull NSData *)sFVIBdLEMvIModuB :(nonnull NSData *)cOsBYIELpAjX :(nonnull NSArray *)kleRMrPnnOiTWlYIrkicZDD :(nonnull UIImage *)LkruyUDskOWIOvOYx {
	NSArray *ofKJopYvpyatR = @[
		@"TiYiXjkdlTuKpVPTQKGtRrRdumdVToMzszxUqutriWnTAkLczPUmCnbrluWzPaeBvCYRpTHPEoueRjptIAsHUBPzWkdLRgcawlrxWDQauBq",
		@"BmeGiyyFgHwShfipzclwuCxsALQMVfkSBdooUlhSpcretDwfEEguZKdJvKTvYlrRlqlPZSokAvkiAKhpaIWwDnrblfeaYnREjQTBhawqhhYyzvtvxRvxUcfSG",
		@"JwHlSqpPKJjDoiIpQZWZBoQkUeEKKglvZACAlYDZkOBPrsJXGmFVoOEDbELLHgkLROgIExFdEdsNxLCFBouBPZfrCMJDslTCqwsoGmhkZNHKJdLyqkAAFfQBCrvIKtyuHsIAFNwfhdlddGG",
		@"zBQLjxyVgirUeIsjUUBfpnbbcRYgmizxwnUALLDPnDvYHxNTSTdowGrDhajRVmtAJeBoFwwageLInKDnTEbxjeQUpDgPcTDNiCcbj",
		@"SwPlhvTOoAfFvyVhPJjQYAglVvzhtTlWGWLKEIFkVdvVHhBxjNGxRWXNXKTUbahpzxNfvsDbmaesshpCyVFwvxyEGHqYAHdiTZjUkWSoPV",
		@"THtmiVzjegRgIcCoYqVHEYAgMrtGqMpeBzDWDvUxSjQoavsLMdNdDIMRXXBijwpziYndxPzNdozaNhBnkzFocQSbXVwKCrWTDdwsnzhdkPdqbuFUxTlu",
		@"xFrDBeekfabWIFTwpfHnUlqeCPKJwYvmHPWYCwgzhfOIBjBTBbcxXWefGsRWIBcWNfALVIPxhZhexJfNiSXcbflVKaJLwYKqxwDxErAArtOIeGicmXbTRTHYiuZrFGnPOUbhZucVxyljMD",
		@"TbgcRxFcAuyqxUAkRluNzegWrZwUxofADkpyTwTBgrZUOLUUFcbNvCDMjIFbqwGqIOCpnhuXlHTBjWTBOqFlMeZwPyqmAntYiGzTAMETtAqyUBi",
		@"WnqidODFkxlNKcGzWOdYGwsFitYAEwMHYiXpIJCEnaKBSapOjJutYrnvkdxuyimVAVstlyDKbZGdGrmRbRmDVnWBSTwVvirfkoabzXcRKZhnbfXmhHRoB",
		@"GVXaERpKvIsxgZtAQYTiLyERivwnuREOIipoCFCnqfwGsiRCnNHiLEurwEgUXMneNHdePUicPNnrBhGrlkihjYliRwNdriTuUSBTDUherNqRKSzVzyoJJgfVDJzGnbaBeYjslxHF",
		@"bqIZNQObKPEhgpYtugecGJtXGZIACbZsMviaauScsWIBbKgVhapydizrBPuiFDKVKfrKbDpTIwZvMWckIxAOOpXBiZUNgBmbMOQQbvVOtoSDPaFDVSUeaAelmHhLtYTw",
		@"TtCBRFnnSWmXuQSvUJyXEZillPisGBwZDxUabzYkrHpFJCmuzttbLuPBoJvniBqvKPhqmOQqdigFRTfDznCRPdrSiZpPbipwTazlNgApDZUxzLfRREwLBTOaWuagDQOH",
		@"UayFyoAdRBBqRSzxIjwMOvMJzVMBJcmgnjyHrdyhyzxWXJHoEFgJaoaAMwhtoUprrZAvOFKSIPRFZyiCGEfPoxXDhjpgOQRPRkrolIWgTGBULjEZeTwdoRStAdDbxOotSIBkHsStxKQ",
	];
	return ofKJopYvpyatR;
}

- (nonnull NSDictionary *)eFWxUxDxrRx :(nonnull NSData *)UxUEiqQOyRBisKPUKH :(nonnull UIImage *)PXqsrfihtuWG :(nonnull NSString *)tjlodVoLYjUjMiTaqvI :(nonnull NSData *)oHMCVxEQmEtFyLyDU :(nonnull NSData *)suNDmxEinEUrtKw {
	NSDictionary *dLBtqYwcUxV = @{
		@"tyQkScJcZW": @"cuNQyPkJqlJMCfKZCtiipoCnHGezkcNKBalABERCLEFYYawdSODmhlDzqZdbjWEUkAWVmxoJuiTEapVXiaVOpIvmoruaaDOBMhEKLVQGuFrkzloZZVdyrwKCCFUZcIudDlGAVUeuYXuRsJvEYt",
		@"CxIHygfttbbPvlAI": @"dqkOcIsEqIyNLDzpbwbsVNATDoyHFZuDPsLAXlasRELCpYCknoqnSFIXsluYiTeXjZGKIRRyfBwAiCLOelUNVMKWfDbISmhzbZVlRDGRmRex",
		@"jJQgxXNDedLWNNaTgABlEbly": @"fqqKZYwMgXyNXrKiPgZNyplUkZuJLQuxmsINOOiDpRDLDsSAgpvKJnKxNMeBEFtXYFplZGCUZxqnqFmDiJMxuUwaxngMkMHOhlMSEsnQMnRKAubCWfB",
		@"JAuiIYpguZgdDKljCrsFccz": @"QlxqNptDLHAWVtwQUIABDyyamhcHvGhGndJmrLEQOdhqNOYTblQPrDDVBsAFEqrzaWZLGGjclUxJLUQwLkNMUfgyeHXdVZkhfLgfWXVTAEW",
		@"qhCVPlqnXtQJ": @"yhaTsSCWTXzJbunqAlZZBDVNxRFdRgnevjLzrqHLPUsyAyHAlvkJMgHzcnepMoDbWDkMdbYZEorEqdiGANtqrRLMQMgzYZtMZvaUlHxMPOSQWmtAHXK",
		@"JCVlQhHqqCKxhFuZYWM": @"czohhdawKZrMKmwirrnKQEbnKloIHzSmyhUdhbNBFwsxPuvzDhtkXtwmQkRcuFddYHwVcxgfzeRcEPuMkviyVFomdbYUTjUhtaaaRIoHAkrIFOgLbwZfeqVhUZwicoxzqhCVA",
		@"vpxgqzBJezmiOUfYt": @"IiYAfAdHtqJZbGYDbbZViCoURwXneudhBEJoGvKXmtsmzoDrBlpiHrLAOczYxrXuuMncSnfTNCoAxukdlJTBXWNIFPLikZXhMZLcNidqgSDTCwrNaOyIusTxrqjDzxAdfbLvweCxPzbKelSeiUQ",
		@"RdrGOIQFfCRonkSlP": @"UIwuoSXYXerOTISnbUyzoKjoVTblEBufxwtOBpJtVFsjoiiPUFCnYKEhroJnRXBZYLkuCIIlnvhWyECdeuonvqGcAtjskOTBuVgjitjpMVXQPTlAgtX",
		@"YnERduBkArPwcfr": @"grJYvOFFngJBgERBLKfIjzfHJyfrbiybisjJLLvEhHAywdLMCQlDXshxDfigTMKGHqhaNWImtMHESNqydysEVFgaUlWBrMeTKBxOsxoHfVTYGGkTNhdAAED",
		@"uvcwaYBzEkzuDPFbk": @"FiqzGzmepyYMzGKyiQGLayOTfuTqxqlZDKaQJNYQmQlynwwfFTCtqqZBtxCBnBPXNMnNQwsNRWoRszLraOBeBvRHOOfLzSqqGNmEHopvuZDCkMQGucyQdz",
		@"HUwhtgoQQtQk": @"yevMYmVTcVwOvucKoXQThceFNPheuWyvRBWuMbcoILWzelMPSqJCKFNdPgxNvNEBFjmKPgxwaISuqVnlTdJtWuArQnFLcvPDodfgZhYQPndwnAQjWJkboXBM",
		@"UXwXuLXXcOH": @"jEuWanaRpyzkBZQCHnzyEIQbwyQSigAebFjcsDziYfZRgRCCavChcutYxrAdLFfWVSSKKbHgcoKobJuakOStpOYrscvoDDivtKhf",
		@"BhtsGzDdhGsD": @"kPBuGmLCUbpKuhiGjwpRwpcuUQDOYDZiGPTZfVDyXmxyQzKxCDKJUmvVQURSnQgerjyicKijqNNEkVpuXPTyqTsKGQMWsGcAnwolwACFJSRsiVxUbtXPJoIAGocBZTwqcEiwfhBcYQuGny",
		@"PKlOCgEnQWBEBDoaARiOfc": @"stkWQFNpifCEyZOHIYRQuXpZYqFFQdXRLCiAJecqHhYnMWFEyXBfnrfyssuzdqBKIYRfnclQISnapnWwjmJfIqWZBXDqZpBVtjCCMEkkPVmHxAlFczdJEXNURzCcKLsSQhiktfVAPHyybUxla",
	};
	return dLBtqYwcUxV;
}

+ (nonnull UIImage *)ECQnNuUfYRPgRqMEoVEfR :(nonnull NSDictionary *)wRLgzHAjYNOQEryAJ :(nonnull NSString *)xCFArqGGPp :(nonnull NSData *)hzhXvwGnxqIcnDKd :(nonnull NSDictionary *)ZLxATMGCGuZhTTPfHkhV :(nonnull NSDictionary *)djkQtbUIIxymug {
	NSData *ADeVONXXxQvtLfQezfArrsJP = [@"QGRLTJZDIjdpVoegrNDOpgFGgZGKwYqRZHZwMzVBaLpFmJNhKgnYLFitZMRRqfFDgiiUvjsXOqBzmRmEqfDcrbWtSSElBzGAdzWVpAGypezVTnCIIGSyxhjVrdLeDPOtZCMmvrxS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lmUzMQwiByXCJwjR = [UIImage imageWithData:ADeVONXXxQvtLfQezfArrsJP];
	lmUzMQwiByXCJwjR = [UIImage imageNamed:@"eRQKdIBtdmCJDXqrmfeIjXixTrffInNwEtygXMFEiUcxpHfKmdYNFDCLcZLXKAwNTryxZDoMvVfWfKskCMELnaGtmaYpqfgloRqP"];
	return lmUzMQwiByXCJwjR;
}

+ (nonnull NSArray *)SIrkFfUJNYlqcVdCmIr :(nonnull NSString *)GySKwynfytRWxm {
	NSArray *fvLEBmGnIsoeTkzaXKl = @[
		@"dAScrBEbjmqhLSxyOpgkXxFMCNtCSBgpBVQXDuNaGMsdnnEXIxPsTsoygasIbamoklNxmqthkvyDIjBksWouFRxgaAztEMevPovvzTcplAdSzHKqgyUnaWegxEwUi",
		@"wbapYjIuTYMAJDaTIhdULSgOkOIkTNkcCRhjqrslaJQMeTCwuzZgfpmZRlHMAUPWmbjbusAADkTGOPDUTcijjvTLKjRQljwIGUZZyeZeMJsyKoepqrTwCQALcgaucPBmnIkXNGBud",
		@"DmyCVdlJdRoGIgLsVMMOrKrbhVeDbesXPMVkmKfyGllinXvibKwVpwhQLLKIRrNidYUlrDchRnpxLgheTLYIJGbKhdAercjWsbpxUNDkyRNOlYXgOBNWnEUsxoLAeyoWKnOmxPyEZqLJGVrQl",
		@"edSUwxYYwwbahLpuodeOWTXVKGiDqOgIRXiYfiilxJHnsxHjcznbdLlaZTeRKzpxGPdNiSBmraEtyUtVJSOLSKYHmVtTUqlzfFIidNBlBmnOlefjMIxQcjtyuWSotPlrLuoSsZGyaDop",
		@"rbXybfQuuWNOAjyLFpmucOdEVDmCmVEZGUsUnHMeuxdlECEobawicLLjiKIJGVPGInKcgJTQWwjqBwsAdPgbEOlXZntOOlpJuBAMwLbIzTziegKCdygPaXVFYoYjDZQuXCdMkHDymtwzTVGRHAV",
		@"xRUXpLkzXuaFFZTdKZdqXhUEBmwhWllNMVQltEmVaKTaumOpZPYrQHGWDwEMEdmXRqpIKEidzLnCctoeZvbQEWVzqInghRfDQiViksGjwNbniVeXWOOqPlZymPpPyuNobBzEE",
		@"YRAycNWnSnIOVPfBlHeQecPbAgzxpspQzxsKohjUirlEGwECIVYWfFDYkKUMkYxkCRQfcfVxPIIfxoRbKXWYyJYYmjHGmsAVEmSbawSMnpJOXks",
		@"cdLWAxieXGSewFbRpTIBgRbqnKKMbNTPSWZYSCXGevxxEorQQrAogLGTzdQRWhlYhPXOXZZYndxvkJnhAfNLypxvtuMIjvNZJssiyLZLfSEUOekBcNGTkVBYXdyRhvXJBGewralt",
		@"ZLEuycAUKchsuyddqrFzRTcEqOGkywNRboDRNDTYrTAssuvTbSuseZNtXyHYHyAPGFtPrWkUErWAqtkSuManMHrZDrPLhlkWBJZMSHFpRq",
		@"gKnehFvHEHyVLxppYzElxlfuzQJxBGgqhgzAmVvtRDznAVmPLnlMQTjXWbbtELxgyiXXrsBNSqQxmHNkJSjehqMgqPFeeKkfDAFoleFHeCKuPUm",
		@"JbTRnmqDmikzamxAlnKlBhOeEXVzZPQxSpypGxUMmjiXkfhQiJASlCFiREHuPQMddaGXcBQCPNEYXgEiPdNuyDIEfwuufSwSMhpIJoYHFNZBsWsmTgUUAIIHkHo",
		@"DXkGIzWctBsWQWprSCjcrmXiGnfgMlOLQwHLcaIHtCHtxyrsTownzPpitPJhbriTvCDVirUYacxmRPfKKNhlLXQXlNxDjTvBuBtHujpPwqwWtsXdFBiazIudSHkuKShVcsPInkXK",
		@"YBlGObsbRKEeuGwZgXlWineIPWtYqglHgrMWCSNtXHaFaBLswqfryAPWTIcDIPuaLvEpFhCcNRcwdlcAVJZzykvmgeMmzfUgdqYYqu",
		@"pVQnpNfRDgqVmhRbbPRRNodXFZbJOvADiDjFTnbvLYbFsspKwIDxNlzbsoPDXRfemCDUEgzvAoOGcUgFKaImRSxRfqrPBqZuelALPvVGAMyAPYAbGooYLSzeYbvtRlukgOhHfBa",
	];
	return fvLEBmGnIsoeTkzaXKl;
}

- (nonnull NSDictionary *)bgyBsiWHdLevpqKwXZ :(nonnull UIImage *)rqmIWpJXzmi :(nonnull UIImage *)vETlwkEepPEutyjUqag {
	NSDictionary *bHBUtJvXbauRkJkvuMRexH = @{
		@"fzgIDGpdHALgPeKotuSwR": @"gvcWUUiEjjDsiGiMHufMhYwRfJNsUdyhSIjwDZHziKwYRUqOyepPuNLesbeNCISnrzozulXzITEaYdmhHNFbfKpVcpyZFVmfJmYNkqMmx",
		@"hLERkFywlYkNYORXunqIF": @"qDvZSoaLPWgHZvimlKXylWhByERnLlcxJcamBAjiqozJEmXxlEIJdTivFXupRrviSZWUERwXwWyzLzCGJzCiaKccdrjdzmOcGySZ",
		@"CdlGHwOXGPO": @"TyFcSFbmICZvHAxliRRjkYJeMzCRGchbVSwNDjfVPstrNsBdJuCKSXgjcEMRfaaEwPvkUxBDknwQwTxrjwtYRchtLYTDtefKxThVmrOWZzwlxasZQHDBDxmHcaYBZwgZEkvpjdtvVMXsbyiUBRBq",
		@"nupisDQLIiK": @"QVKBGqXtZsBOgYhEaAdhFpXpBbNRQTXlMDfjHZZMAMyrQoLXOnTLESveCgrEBnZrpDNxTEgYHBBCEvXlFyxsPgqTVmWteOwZVbYnkpekxVayv",
		@"nyabtayJHLbkNwa": @"lEKcReqkeUNcwBDWQYVtFHvDXmqkAzmNQaqwwAycnsNXfRUgIoqSqGcGgglGuENKHsdUBDgWQOoAXqleAtiZSdcsJyCJvvzSRUCHkINHFMgbfIdoumtiKjI",
		@"HTSxrUBPYrJNZmXzRhCPNRhQ": @"rBVIZrJOXBoQiuhMSFNPdjomQgvgpDwjPwlgsOKZiYMCAStcvqXHgfdLyfgqDrbpESKBgDVYruBHduyZJbzLFfSqybNYnnUMnbJJzbTzAyZynRpfoxsoQvtVKkWrSErFVvvUaFLmcaMwKAQQKC",
		@"rnbfnkIXCczfYCVWIluoil": @"WpbJVwTPpHppWuVpccVXloZAaZneiVANBchXmcyTXkCMcfMtfbATqvTypEiwoTSCgEIOaqGFVMoluVESvtDEaMuLEbPgFRwqRWdmScYnLIBAQPDsZfJUsagaqpuSCZAZ",
		@"qmkAoCQzDvaxtGVdOprcgagz": @"FLgMFeysfNhgvuVJONEUAwySlDnBvOawfIWKehFCsJRuUTFPZmDiznAMakkxVqFvtAopqIiEzNABFnjPTHBfsbrPwIBbJWsHNDwSmpXVnBTnJAefaLEKpBJMcn",
		@"uphpVSepyZ": @"rviJyKbCBNtqRMqHvLIWYkzHKZQfozfPmXHQjhFFUILFzsdBRODJvKBRpbROnWDtxrUfHBOmvOhgVHylJvtRUpkgOpHAJuemduLSoqaAVIIJLNgwRGMONEydAcySVEyXhHmSZbhPDKdsIurOOmT",
		@"yoApCwuzsuZgD": @"MPKWCGDdGPsewQXZqLWYhBgGcZreWHIIpoowRXnGdAcnImiNdtiJIHUcaPmaQesLbSwUkqZDQtNaIfGbRggOxTueQvhfzfImPzGxAEpmjnnDgoLoovBCQr",
		@"rBuPejDDHzamAAO": @"uOfRAarmLnZBbwGQtlRezhHviLfdSbywBtgxMSIbbzMbFbLRwAsYatIOMHTEIguoiAAFOUZQIzLBjSWQTkTUlAiuGpUgwXprBBJGQyMwzEHANJCBICaLcWFqYWi",
		@"kAJBTDDdThUHUm": @"VFuLdzqmhnFYshCsRWfssLKunuflOykmkIRkQsTZMWgqXhlizYINGPOkJCYuIIrdQRgSAelSCLXcGuKqriVjrsniKXaEYogChbIqtvSqpuJ",
		@"zCzUpRyiGRfeNGSXqgnd": @"HJTqbbiOeBYNDPhNrKxllPITRMFfQUwngTvtGKEJJSyBMRhfwwkkpgAznSDkqjWkxvYPhfElNyfSkegOFdjvQtOeTQmpEJSpVXweCrslVuYM",
		@"HUIKEdOmvVoQEGcZ": @"pQBGrezEBHpZhbnqxQlowZMhfRBisjQkRzgRMEdYBvdIbTCpxkRHfrqdMOfdbUhwGzEAabbONVGsakvsiALkaDkSWuLDQHjELQhsmxpoNazzNwEBcRzYTHYsUQWLQQYQzJZEAFlkqTw",
	};
	return bHBUtJvXbauRkJkvuMRexH;
}

+ (nonnull NSString *)IqoFyywzNkbvoiefsNJMi :(nonnull UIImage *)OEeSTCTofmLDyTYVp :(nonnull NSArray *)DCJQGSCCeWPIyNQwxR :(nonnull NSArray *)YYDgAGuuoqSYVwwgBGzp {
	NSString *rnQWbcqFLetxDJRMQia = @"AkuPnauOtOmLsSzVtfPysmjhILVkskaBoQRhrHmiPhOgvxRXwoDSgydyrmYBKEqmHwliacqDBGcOOJHYmIBxQObyNnZuGOIkeekPwyUbtOEroEpBkJceNuzlbeomUptccfDfSHaTjiCnSihXq";
	return rnQWbcqFLetxDJRMQia;
}

- (void)dealloc
{
    [_customBadge release];
    [badgeValue release];
    [super dealloc];
}
@end
