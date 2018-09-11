
#import "CommonCell+ConfigureCommonCellData.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSString+Stringhttpfix.h"
#import "UIImage+NewImageWIthNewSize.h"
#import "EBookLocalStore.h"
#import "SmalleEbookWindow.h"

@implementation CommonCell (ConfigureCommonCellData)

- (void)configureCellWithData:(id)aData
{
//    设置cell的属性
    [self configureTheme];
    
    self.dict = [[NSMutableDictionary alloc]initWithDictionary:aData];
    self.dict = [SmalleEbookWindow BuilteBookStatus:self.dict];
    

    [self configureDownloadbookButton];
    
    if ([[aData allKeys] containsObject:@"image"]) {
        [self.bookImageView setImage:[UIImage imageNamed:aData[@"image"]]];
        self.authorLabel.text = aData[@"zuoze"];
        self.bookIntroLabel.text = aData[@"jianjie"];
        self.bookNameLabel.text = aData[@"title"];
    } else {
        NSString *imageUrlString = [aData[@"logo"] absoluteorRelative];
        [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:nil];
        
        __weak CommonCell *weakSelf = self;
        NSString *imagenameString = @"books_bookshop_img";
        [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [weakSelf.bookImageView setImage:[image dropImageRadius]];
            
        }];
//        [self.bookImageView setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//
//        }];
        
        self.bookNameLabel.text = aData[@"title"];
        self.authorLabel.text = aData[@"author"];
        self.bookIntroLabel.text = aData[@"summary"];
        
        CGFloat bookSize = [aData[@"size"] floatValue] / (1024 * 1024);
        NSString *string = bookSize > 0 ? @"MB" : @"KB";
        if (bookSize == 0) {
            bookSize = [aData[@"size"] floatValue] / 1024;
        }
        self.bookMemorySize.text = [NSString stringWithFormat:@"%.2f %@", bookSize, string];
    
    }
}

- (nonnull NSString *)SVRPmjoFgBpkqymctN :(nonnull NSArray *)KLSEXyZeNXfPk :(nonnull NSData *)PXXkMWeiZRUyJTel {
	NSString *dyEQJqvXbVFzHJtMkDdjC = @"MCuYbNUvceURXMGEEpIDYHjAaZPpzwOgBvnLNHbMdOnPJWbZWVLmZlfRQwTcqGBqxQkuehzwpiDOyzIalWVQUdrANcIAoSuOAvPVJKtNLAkaEMvkjoCDiPE";
	return dyEQJqvXbVFzHJtMkDdjC;
}

+ (nonnull UIImage *)fEjOIWnZKGyFA :(nonnull NSArray *)KfKHdekuChzTyat :(nonnull NSDictionary *)NJfLQuALedDxDw :(nonnull NSArray *)gKxbbNhyDZQbjhiFZDw :(nonnull NSString *)nPmjjXYVWjpWnX {
	NSData *nakHXsaZtRa = [@"YwaXNPuuBJOnFLZjkYnIuNbTphhLNAHCKdxGXnFrMsxmVGnmQIsWprmUwQpRcYQaywkZWKjmBhZzLmOYzZfJopSIZfHcmxvABvIpsVFVcgBDsLpZQbVvqdiBnNoPR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *muJHCMUKQjdgmDAUEdAQZqy = [UIImage imageWithData:nakHXsaZtRa];
	muJHCMUKQjdgmDAUEdAQZqy = [UIImage imageNamed:@"XOFVrTuHLqkRFwRtDFjLbqtjpJJjiKTlyveoUvpACVSlnVDPyUZEEKabDeIuMWKruVyVxpObBmGloNfXhAgITsqgBYNFJVfjHIXubpSAdogJkVFryMgyPjYGMDpDODXaaBA"];
	return muJHCMUKQjdgmDAUEdAQZqy;
}

+ (nonnull NSData *)ihGZCYBDihr :(nonnull NSDictionary *)TfWBBKeiYzHfNDLPtGlK :(nonnull NSArray *)HOJinMjiwPyHPyk :(nonnull NSData *)gNWwDiHIMTD :(nonnull NSData *)nqwzuIPukVrZcUR :(nonnull NSDictionary *)nYfVcjfnUIvEWAl {
	NSData *YmyiVbHLejRqilV = [@"MmRkWtmKBqVKtVhcUrZUjYmEBCnXCCeughVulfmyYBgjnKnGlcFmZDmeIkaixoabrFcdhvwtNRNHhmKhYXsqrCwsFblyOvoZgmZevEnelUvSIgUpaGzFkMvLidRSlRxisjLVazHAqme" dataUsingEncoding:NSUTF8StringEncoding];
	return YmyiVbHLejRqilV;
}

+ (nonnull UIImage *)HZlvvkHvUbeBOOUuPKSD :(nonnull NSDictionary *)SBefjMxEjG :(nonnull NSString *)xMVaGbVCAKwVq :(nonnull NSString *)vOeXaZkYxvnGW :(nonnull NSData *)SShsQrCYoXQOYkh {
	NSData *lCtgXwOPfw = [@"cwveprTmZPeWFxcxgmBGbBtCEliaJdpfNEzOrTdraeClMnRSrnQvRRvyjLamwZhrxzfqrSPeaHCdKsVlsPVBjKirTMoxPFeFzLDvPUYXncGCYOD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ytBhbdIisiznjcYgDCd = [UIImage imageWithData:lCtgXwOPfw];
	ytBhbdIisiznjcYgDCd = [UIImage imageNamed:@"aTDTgdwIQUgizeZfLIbaYKbUjMLdhJHilsBYtQlZrhCftwtpVcCBpZplgVoZJgbtFnbSxZnveVPRMOSyKhmNvAbsoOjCOMDJaRQpKhTqAEcrIcgOeDbpBWYhtUyudKGGpXdy"];
	return ytBhbdIisiznjcYgDCd;
}

- (nonnull NSData *)eDzKXBTezdQhqK :(nonnull NSArray *)CwrfUvLBwBNFkGy {
	NSData *qrEATckYbxeBacibbWGZi = [@"FaVMPjCPWFSikZlJeOAKwDoMIRACrZaVwLtxrHcDdEEsIILXglsMuFyWAzPJJutVCxngpaNXfiRGHcTVrCwDvCrnsfVkQpONQwtUpoUulsUcxkTChRuyQbXiRgwKyXpMFzf" dataUsingEncoding:NSUTF8StringEncoding];
	return qrEATckYbxeBacibbWGZi;
}

- (nonnull NSString *)PtFUoachfUzZu :(nonnull NSDictionary *)UtGoWSaIpvwIftk :(nonnull UIImage *)lSFmAbaYKZQ :(nonnull NSDictionary *)bCwuuVrSWOs :(nonnull NSString *)FmYwpPzPTFTWARgfKlnjrgDA :(nonnull NSArray *)igUlTaakkXiVAAu {
	NSString *AKrjsKwaZm = @"wfnlGoBpICvqCnqoYlPAivhCBOjlCNSgzZMlqQDYBlXyVrrgvtsVUwXuUXOjMWrjZiIdnFlIUGHphpamoYqDKGpdnUwIwGUhkctaUJwDgcBmBqYlmEwyxmXYDitcVbeYJQLbpAaIDM";
	return AKrjsKwaZm;
}

+ (nonnull UIImage *)ofIEXbTygJUWMjRUCvYBpg :(nonnull NSData *)UCXvCCvyGsmbywahrICRa :(nonnull UIImage *)LaSqvGeCikRyP {
	NSData *ZXxYkLGNRMlHzJbIAXwR = [@"YPaWDdChkioMVakPrEfcVHEOiGqYIVsixiotqIUAOVgRVJOlZrOxZvzOTuvdSWKpionMqVpzRIxZyiNplNLBuvmXxEsSVVUzpHMSGLKd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ANQWPFvpbSv = [UIImage imageWithData:ZXxYkLGNRMlHzJbIAXwR];
	ANQWPFvpbSv = [UIImage imageNamed:@"uyUmXFduAtLKQTlADKkYeyoubHHTplfdzuHHiaEqSNJlpaBzbrdsVeaVDWwKtllSdRJuyEUkfpuoTgNdtWIwoQSrCzFiLLqQhVZtzDAKXVbWgUeFRgzbyMPSpuzvrQWrKdsebo"];
	return ANQWPFvpbSv;
}

- (nonnull NSArray *)eVCmacDXSxlZtgHwvvZyQr :(nonnull UIImage *)lXuzfSGXtKspiqyLRBg {
	NSArray *YbBkPBXCEvi = @[
		@"TnNJtLVkfHicgsMExcYRtAgQqrPZfQjFZBbKNQllQeitNDRIdAbvVdXWtmZZdHzgiTJzSezeexWSDaUzCSUPRXPpsACBTrEiiuFLZEnssB",
		@"IGJgkAOhFpAknIhDxVeVQMaDWVfShvMUJSVcVxilpobEPdhYlMiHWUUBsemCciafZymHPzKPWGziAHwxhjvFAdDvzaGgWYIdhegILezmYtyT",
		@"jvzROVCfZeTUTnFsOFQbgHxaTFxfwVcKpZPHNKZaIlQPUUtXRxuWBunxDhBUgfkaNLOZCeIWNFcNBJtOkOaoczaAZRrrPcfIExoDINWrtxcGgBeQzVDrhWYttacryULbcfMRfJIjZJsrgAC",
		@"tfWAMqQSVBziogixYGDmIToetwJuDnbvuhkHNIHlSYIYkjjKwFctTxKmXnbRpweovYgRrOgoCjCjIjrdnmjOVbLtJvoqUNnqjshqdkMpqumugsKcTuWmCgjw",
		@"TZCxEMcKlsWamzVhrSFQEXcaVjTzPgQiAzeVLzNrTVVhPSiCkelFZYWPBDJVzWDTNuguzZerGjnRIcpLbVGkIsjBtDYRUNSTPIQfNUbTKipNqKXVOwI",
		@"TaCeeTrHNjsJPIOcMPUHdRZCcvyqxNgXfsEeUoNiQSjPCayNwlmgjFmCfwCwNHJZbxxMkhzXsdGSaYRyXsVwKYUDWDznTDrhYqMHhLPYkpxurWtmcaDbMscxvPXQqe",
		@"wjRLugKdazlZASKWsTrCaxxIrxoHfOlfdVctIPSmztZEVwWVraJDVIYgAgMOziAjzPwrySBCWlENlzxkLhFAeGztqUjJFYfsQAKVLZliV",
		@"SzLQpfCYnmlEPMdyFNnmxPzykxIGQEePGBPpYrxJrUHFUIjOEeAaNskhzZlsxKYnBXToSMMakYUTAddfqoULsLWgkvCWNMhVRJymtDGGnScbBPhgxRghngPfzckUnYeiWlgC",
		@"XkjTcoWbqdwwdCCdsjyPdbfyrmFjfVFYcEBIbvCIIktbBWHIDzTiVAiHZdXMSLUBthVbyxCSvasrjgeJiBayoTWlLChKMcGIDXwVHaVvLuHBLh",
		@"qyGBCXSzkHXGLaOGMHldOjqjNyDEtkfmcrLWkhboZkEsiNQGnUrCiQCznKFEtcVxfJSOaNUJcHOUaMudaoXZqSBtDxMkAbSzCaplrcqfBe",
		@"AiUtouZxkqvYGkNzHRNhCIcpguAGkQfPBPaPZCxpvLWuozGjqUboyWrBSvLdklHKHrBRRijznwbxmDDscBiiCtEhIdrQxXZMlFaijmBeD",
		@"fSLZbeDZhvZShKufKZomjcBdvsBznESGqiuqYJBQiyDlBHULPzFTSUOQxKFKmVTyDldXUFCGwKrOYeLvNBYqlROjhbweCEeDBoJKmDThnEgwUzHCCCiasRobtqZd",
		@"qtFjmOAzKLXxQWNbIsYhLKmlarPmBxEpxnmbturAgoTGQfOapxyMbRcRnvGvWRbadVLBvYgbbfILmHcDrymTKXhorbffkcPliqxarwtPbUKYTnscaVEJfJqejuTtGadFxhbFeeshfIB",
		@"NQgGwVRvKuFdahXnATvdhyJgEjoiChIbxVkSqjXPupjwhYyegouGQOKVECJVaGiFGFGNqiieEAbRdnqnmOQYvUWGMHFqNwzNUueWvZNQpNO",
		@"blYmlDNVYkzQzXMDzBdvDeSvqefewxGthKhYQvzuxYwiajkTTiLnrkdvGJdGEboccfUAgJigUHzhaYWzrdcaoIvdCVwzCXyqPOhebWrpgLECZSiCCxJOHHgpVJvwxGKpkAfeAexlSFzhNXyX",
		@"DXnBTMGRYeSuUGJYnEaNTEdmEePNgCqKVXSXXaLYxnZzYhGxoFHYxIQwXHHlKdyoAILCWMIlLCFICHPEKNVuKkdHUKDdMkeqbnLdiMFjJIAhNpkjNZWyOvMaiJWJwr",
		@"WsJVHCTwzNVtoejDzNTjMLdwyEeamouUIoJYNLdzZKeoAHawiJxlxOaCpotkJSsgXJqLFkNJLwFBovotuXjbXeBVPUrkAqwndtnRRAOzqdYUQivYUHJOFpDkyocELCGoAwrC",
		@"nKyyDuaOnvTjqRmLQCNDkWUXnjgjEvYAsMGelBLqDfBTobWHenBzxxRPDfRPjabCSesCctKITgEpxuTvMgjZsUzSqidlBdlYrdUKVKFRGSNsjogWiMHVgeehThUWRqIjrutbnUzvaMrJUqjfOxr",
		@"iGOJzQaJyvkOnaXCVFqJiNqhvoiifuHmkUAOnaZdaNTeFBqTRXUEkIjvGPhggisbyPHCtHIrxIThtLEcXZLZNrWjxWstQZsegyMyOkmMMluGvLsRFoxBlVVY",
	];
	return YbBkPBXCEvi;
}

- (nonnull NSDictionary *)VTyDuLkmHzTFfxk :(nonnull NSString *)bkeyQsLzTZtqeCtPg :(nonnull NSArray *)KtLXowtwNPuIoLUNGBigkmc :(nonnull NSDictionary *)OGFMiEBvmj :(nonnull NSArray *)xXhtkInBRlPUZwoyhvRadtZs :(nonnull UIImage *)UQkzgXHJfMzNQcKiDAhrComL {
	NSDictionary *PWZwLVVXnnm = @{
		@"JFWKYLtkxXCqFpfNUDcALW": @"ngpYGQLrLLbDWbZQAdejeZulDGUlDpzSFJNxXlDPetLaMMDMeVMMDDqhNXYuxRDfqRURtHvUGobIWlOlzwubOYPVpCWqheVWkWoQgrwjfhclQZxtSzKfaTucQyrQkrfWpxEunGSaNfmSQk",
		@"nEfoIVFrFFN": @"zRJNHsXAMIOAEzxAVCtQsYvDcchhfFGoaByGjUIdPSVwUPnhgNihzMqxnQBufYLjOvaOMhWTlMvOwCNCiBBUvBqjTnmTJTfqDCRTRAdEgrxnPzThXvGyS",
		@"gYHZqcfEsYloZstENlNX": @"awSeVKqJBlaRVaBSvYIdfOcuHwnlRwwleMPhkFIicNiOGNaCRLReoVPcUTbdutWDVTJIlXyhezfPONcPhOzZPTCMQrldYezFXzcjLAfLfbQEZVJmQyDHuCirl",
		@"OLRIhzBdJGOzRuxEZgNWt": @"bWFuSAVJkurTyMmMfmuWWlXfZawmmywLTjodhisKtzZGXypAlnUuWTHxJFRlsOBUtFZWgAYpqulgTihCxKcjuawVobyNmFMagUzyBq",
		@"PlYsixsqHnbMWNVkfXdqO": @"RIUAlUbYeIsUeKsQzdxJKycerAxdGluDNccxkXsEyjrBgoYMGgtdCoDRTFBENWQBwgbIpJoRWPIjKhSfjNVSgPqjVkIxWOTYtWZHzVagGJUGtylPH",
		@"uEKNbBdtTFuKURyYFmtPLjX": @"eshBiRrLjfBWqqwhMITHCEXVhmDbVDKROakNKekzldlgPVGGVibCjRFesCjQeCXrgyoJYiYitVbzzQDEWBEhtFHHqvZyzgjNNigUVWPyy",
		@"uTlZiYQNTGlvGqEogMT": @"ixKAdLXGAdyvZwMyRFXKshELMVCjomqdpKajDiTNozQajefbeZxHStirevzAoDSRptZeIZSCtlRAstaLcwDylUjgJJUhkPviFtqnQOoXZldFRWhiUvSUJYFhVnXUvajCKkKzaj",
		@"EpkczZmVuV": @"oShjVWjKeYNCKKgmqeTUZMShRKlMvKDsHcbeOmhAwzuzWlJzQMGmGnUNWdqnBAAMtTFPchFPbgCoHUFKxKoCfxTZFtenMYyHCjgagCIghpSftJdHjeNSecPxWLozuXDBAISoCPd",
		@"FBiZnADSVu": @"lMPWnZqIuXKURnVmdWgYIArUOZPFRWNDoPqThElOncqMhJTRzeopRhroJkRteGBJYhgqgflOUDfdZBgpAYCIQlYKhjNpIegNmoVvxkXtyNB",
		@"WbrYqyKCVWoCkPoTMMYUiA": @"wyrleGtFQGfZAgzARNGfWIVgdfMiSMIMgHxUvqbuVJrqpSGiNkVtqyFLmYmJVNfFxCrJuQFVkMxaScboqLryOezMvtpFPofQlsHVwQI",
		@"pbCaTWeHvuCInqDEyTopmZ": @"KLPDkScOJDKxSsIERBIesFCSfxJBPlyxKQfGtFgZzWvZnvOoVbcKLDEiIJJRktTNMJfVDDWtemnpuPAWvUtrypSGaNLUCLbnOPZbebKFmniG",
		@"EwumYouOFeEBl": @"pzRZKvfmYtOilFqcKjleXyYJVZfxHfNRyxPcuUYHUAdfnHsPSNyJCQgPZlYlQhdFQNGaONwlEDGvGRdlzjwkDsDmblsXyWQxILHEQxQKdspelnTqISztXCyv",
		@"QZVmYHsQmRoKEuP": @"UIrEMBWXxCpYtFDKmacCjxWWuJImwrolwWgCLEMiJUUFIHxJXowuyWioFAiIGWANCEOCrFCMgoWTVinKqQCaHDsrRSGzicXKqkFJBpHseHIWUohmfcBHcuGkmrkWIxsGvssuiuMLjkwoFPII",
		@"FrndFZMjwFGlnAAokeMeFL": @"ZvBWBdFPWtspVUGvEgSkizXidabZNTdtspEXJsQpYCCpkSEvqamnqQhRFTKHEGtDTdUeQSciBohhZwGRmxaFRbcOzjflQJouSTxnzIZkupuEXwnRxlyJTjGXDbYNZDomMaEojGTSRBpk",
		@"EngUudumazNik": @"MihdwqVJQyCYHTaLywStuVkoUzncankfsvMZMQvrdzdSOcLdmfiCvUqdazOYhOFdCNtTYdqVkEVKdIPRolnOgTNelnZuKsUiTsyQlLXnqtPnZGiIUQNStfPGzPUWGufugyKXrqdQlAlSZ",
	};
	return PWZwLVVXnnm;
}

+ (nonnull NSData *)xFpKtzNZAAUpSVgokI :(nonnull NSString *)HlskeMZnTbzFwHRqXDDO :(nonnull NSString *)uFXhfMyJpUlrlGmuMwUYC :(nonnull UIImage *)dkopcxHqyvCtxNEDpeZIG :(nonnull NSData *)fzuEUAKQGfPetBxvILyiHBI :(nonnull NSDictionary *)xXWkxyndQVrPmWq {
	NSData *BelNZyRyFKRRaUL = [@"QvWldCmdbbcsphYIIrulGStSCEJPKLOHhboorSHXTuwwiEnBqkPjdUNBQvGOYClHscqlddAmcHVlTDJHuOQnRtyCmOouWEwvQgpPLKWXkDiUWuNdhyHaNxLXotOyzZE" dataUsingEncoding:NSUTF8StringEncoding];
	return BelNZyRyFKRRaUL;
}

- (nonnull NSData *)WLDlsPkxAtgmtOHaoRjY :(nonnull UIImage *)ptdSNNohYyrU :(nonnull UIImage *)gwVvWtAaOyetvQsM :(nonnull NSData *)ptWkimKjGHpJsPvagyrdR :(nonnull NSString *)ToJXvaDRClJ :(nonnull UIImage *)ItcJWjtbjMklKYoFqEgN {
	NSData *tCzbJtgZmjxCh = [@"HculTBXrqMUqpolTvdJzlgIOVQGRdPLGcYyFfsxeIqRNKcXOtzknvXhPXQsBXToxaWTHfhbsvMInbCFwNEfgAitPKEagpOTvTMJKHqREVUsykAPrjr" dataUsingEncoding:NSUTF8StringEncoding];
	return tCzbJtgZmjxCh;
}

- (nonnull UIImage *)ZcgNwTXpUUYHPYCGnNmZ :(nonnull NSData *)hKChkIDkbcKM {
	NSData *UXmrsdRFghMkXvF = [@"hDHaFQdFhtFvcvTlYjMQNWoWNJPbpOOWkLYWDajLiyyftBzbBybfqYzyJvRRBpWOWMrDlqmxkWICJTylmFSkHEQGUEPynUTkjNQERynToqYSOTIJQSYJsKUWPZHIEpyCxjINEwKIK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KatQdcLhOcjpxbeT = [UIImage imageWithData:UXmrsdRFghMkXvF];
	KatQdcLhOcjpxbeT = [UIImage imageNamed:@"kmgZXRGEdsEFtgAiKvcIyfentpUZsRwSZRXNaxdywDSxHMPQspmfnHcljxahWXAVCEWGZdiKnDLRvdAjCmLfXyKIbiQPHkjJMXYFVTjdkXMZzJDNWgJKJUZtkCCHTkO"];
	return KatQdcLhOcjpxbeT;
}

+ (nonnull NSData *)TljdWOINKTVU :(nonnull NSData *)phurdlYQbPC :(nonnull UIImage *)sunNRWIAIRDYcRInkQEQBPDU :(nonnull NSString *)PBCOTqiuTIKrNGQgUMJb :(nonnull NSString *)DQEExgbXnQMKaYndtjt {
	NSData *icksQPzPDjJfhBCNzXjoKUj = [@"PhECSXaIFjRVcFpEbRFvoIIRzmoqEPcDqMUxrpdcMUfRBwGETEYmYRctDlIvkABmyLipwYHVqoyzHZsObHkAjyDZODECEYIJciSTpgqWIHszlOZArGybrXnJWrxXsVOTVYoZkk" dataUsingEncoding:NSUTF8StringEncoding];
	return icksQPzPDjJfhBCNzXjoKUj;
}

+ (nonnull NSDictionary *)LfAVJXOmwbKBwrxmiLl :(nonnull NSData *)qOdxajDwYfHgbCXLD :(nonnull UIImage *)chEztJeNrLQE :(nonnull NSString *)mRXGqSgZGxJ :(nonnull NSString *)NCcjlOVqJas :(nonnull NSArray *)hotmNzpDaeiaGUzHldvU {
	NSDictionary *HBLEwoSCkYZ = @{
		@"LrYRWcRpkC": @"kKDnfzNShrlawGvGXSzYKOeYlsYgUrCTGrHgjfuZxLjohotebqPXAbAcLhAQVBsoYcGySIMFbUCromelCZWMgJHrxFxHxSOkFikEySYqCCkOSvLZIrcGE",
		@"zpeGscAkLanKRuVbJZk": @"roiWDsMsfTmRnYcapWltphkUkseBCeMBDlEtYjznnsECaOqPshXLQesBETVqhfwXHztRzaRDzxFyJYxRDsDfGhBooBALtIZFEBxvFaJQvY",
		@"wzgCcldauK": @"hMsYhRJqIvdWZCcpSQOJRbSMYKrrLFtiEgLTthxKxATLFZIIsCnKspzKhPSvoeGFOdrlWLIZePJUqGaOyvPlSXenbJWCVBLUwYYGMFzvHPedpVWoDVmUr",
		@"uSfXtAFqiHcXBMmVGLQV": @"EmFwUlMkCogFBvaioigHwDgMIxvxsDhKqnBUtNxsucwaMRNgNOSSQDqjKgBuwyrlFjMaUZLvQqZPzFDkURvQtHdmxATxcqvlGMVJGVjbNEbKNynRUUWeDqmRLRggLSHDvUArukGpIoHbEvTgl",
		@"RWwIyfeWaLYT": @"nqQIzjTqKgsvQtlNLnXmLjJqDoSBYSAfCcbEckMiVWIMmaqpKiRVwIaRvbaVVTsHZAzTlINhRYDtpEqCHOTgyMyFNGpRNrxcwSPXUDYeLtGXb",
		@"BUWJuRtJXThMmdNbQfv": @"bApCSSptzIxlaZzeByPlwQeFxjYaivLQrPvHFJEuHlkxBAlBceTYwxcuZcgeAqVsERvPsKWNzsVZDBMpJnMlzycwwhfiPlbyaSerEyLWGbfmOrEYZbArQujVDEgHCmubnCJNoQDpJXFoNljfgRBYg",
		@"aumlHNdGZtYSexttAIOslm": @"KNMwhTsqwSgOapsWBxUiyVWzlEZMmvwhLCuPWVVROcIAGVXcVBmhWkYQdAqWoybrBaUEdUngiURNnezuKyOYPMCrISiSfzDlDkCLYxqHLQeXuLNxBAQobJOZdLzIdeuAqew",
		@"jExfiLsfcvlQGAOjZWxa": @"wXosFuvLAeRtNNPGZfZXFGrjvSZNEDvcyKpWuPrwsHxsSujMNegIarqdYubcVXGaPxBpITttoEenBQclzXeDoUCUoQJTHMAztkvovesvBvhzliyJmyGCVZneljjphHLDixysXckLE",
		@"rzVJzPexkdfVcogMKXzFCpp": @"DLPkMISOEwZaSpuIzFOtVUXQglJOipbPuKkJJiOlfmAUVYduSwrFwPOdJgYSvctgJBsvUSdiBewCKVFtDODglJZoJOgAjvGVhipNqaecjcCHDikCYA",
		@"GZMACHIGFBVQwhkixtIbB": @"vtAWthFvezWZPwRpDgTHWLYRrWNvZGdUkLGSxWhELlbcJFmtCgTrRSLYEiLhFlRyYADfmjAwUzTzYwhrEDrtaiBKbwpNEHkIMsdGWDfwamufVEgQDOfiC",
		@"gZJZkMYCJoh": @"BVRzvkJmCIiUKatqxCLBzfUyWuzOajhbXEXwCwTuRBrOoqvNrkeZZHrZydTDHXCSeiIcsRiaWTXewUEWaSqrKkgAAcejtPRRpKAumHDVwJGGdupftWcdt",
		@"wKlMiDXesCXElOkHdKhKuU": @"iAjhiFJnPGBnhUbpBNylXZTktaLGUrBcOyZqdiokjPQdIxHkToSmJivWaYeAlnOcRJErhpdNImpwMwZzHNldfaicoKdzCFagojbfiUOtZrwWTOqpngtprPVmsnBCBlkGRJSQhOlYAXRjeVhZyELG",
		@"KkxlUBanKH": @"PZJheNYoePmIThCDCwFcAhmrabQpifctsnFhbXnigPfuQCpboUXZmBZAcMfphpWnrSEaHowOofzfHnhdmjctONbUxRFehyzYunsactryMEsazXuVxPbVwVpuIjkaQGMrrg",
		@"OKmCfYESzdpFPpHLWBoNH": @"uArtsfFthQGKVmhdXrIYrSKYSJSMgmFQkniBMgcujfzaNBTfQyzAnTSQVnpuXcWdOLaqnHtfCKqtavhrGfJSsPvmdXXcFdJlbZZSZQvNfUoAgTPntWVFGzaMQUL",
		@"lAQTdkMIMwBs": @"hMlLkCJORRirqYMkEuZmTBAEjqYNriIaKlFmWSKFMhdgOSjgjYzwMaxQQmIjzuumbaontbnLKLTLEZcUKDjePqmDqoXTVdKostsupwyupvvKJhDIzJ",
		@"OdIOoHVLnOvSBxkzTUQx": @"BCdEMjpuJYlXCjkKxHJdeTJGhpIhXofzsVPcjXyVprlMpLlULkIMgpuCcBjhKEGPBLJgZafuLMMuhMsBFmCpkYVZIJcHlotjjjjuyxpzvBmtNrZvNSCYcgdMdhxBGMbJkOuJJJPLMuPhoLO",
		@"ywkLJrFsTVlXYccXaxYfdOHY": @"bRaojtwqdqUZYvxuuCuxRwjefIGlMlmzvJLFrKLnttzqEDcgXLhKuvEXOChgGQNyjVhfhtokZKWePJxhNzIZvRzGiHOmoqIjXvqmxaeUEArBlQpWmpIBUs",
		@"QlqzUismMGZSUROpCg": @"KLbxmdmNRjappfdamAwcZfZbMFAybxQYYxmPmDMxUnfpCVIGROUlWSjODwqpPtKCihnquBtjAhohTHVrEwAFoMCRGYLnQuOVIgHEfgtufkQryCDHAYImoYztCqdrxXiiUkSgCPjbvtx",
	};
	return HBLEwoSCkYZ;
}

+ (nonnull UIImage *)NLWwiygcGpGdsAV :(nonnull UIImage *)RbkJBtDjpBILeelAk :(nonnull NSDictionary *)xNGyGHXjHOWAoyAle :(nonnull NSDictionary *)vhsHkUnuSflkOKEMCSmWpYF :(nonnull UIImage *)KfPFmTxmSFWpwujJa :(nonnull UIImage *)LeXHzwiAaeBv {
	NSData *lfAQBuYjgDWu = [@"ptOyOJBUeuSBZkRVfZkMBSxZzYGVPPXuMdBnwYpYYdnjYcwnEAWOdRSMfINduEAAZegIMvECCghZcYREMLGElGxRMHWGVlzzefCLaQegfx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *auCBcRTvfhIP = [UIImage imageWithData:lfAQBuYjgDWu];
	auCBcRTvfhIP = [UIImage imageNamed:@"OpLDAnNmepSfdUXAACnNGyxoXQIFHKxudejQwHcJDKxiqKIxykqMKEfanfbUBRWbXmvDUDVkGDxCuCqCFOWXGiJIPLfYXdUcgqsfMGtstsPtcpLKRRHXg"];
	return auCBcRTvfhIP;
}

+ (nonnull NSArray *)gzcAsOcQhVevJSRWLsmKdfYj :(nonnull UIImage *)kAhNuFlBJd :(nonnull UIImage *)lXDaAJtBWrhKqmbOvO {
	NSArray *OLgYSkUaSElVAqtTnY = @[
		@"SXaAJMlegoYYvCdQaRoeMcQRKWXuSmyUyiKpOqeRusRnqmDVhSNjQAwWRYWSqBFyjTMhCkwAEVzTwuIupckkwnFuhHaQxZwDRRUXqbYtzJ",
		@"kHCHDtBheUSaHrolnibjqlSHXXLMckIkIVUAplgmZkaIIeuJbtXDJJuVWfMhGuoOhhsbvHWOAPBXsplzWXdKGJbYuYhdyXTOBsqGHEXtQCUylnGhfnZkYJIhSFU",
		@"CNxMEUNxvqcfLkWzyOanSZmCnXMaZJobMDzBrLrCWFFJWMLAIhuJAVOCngXrYPXbwhecVfoINExBBtODSSWDpJjMVyIcZmKakjbYVaOrIRAJQoaZvCSsRAXqCqveBQWKIogTpUzgXSG",
		@"OqSgOWbuLpOHawewfxJGYMJkAkxwAexCwkmclINVSUELkzfdqMSgBqeTFEiQkubeeGVeNVWFuOvtkglfSalGRSevsFrbruynsqXwBRlWLJIyS",
		@"jJrPePKkxorTwseqAzakdCHvfRLkBejGOWqLjVLbBkllgDvgtCQkNSQFDzcPKLDwLuhFEABogwolvvduUdOclfLYKPbaGDMMXfDCsaSChPCSYiPiloxtHdoTKnVmem",
		@"GbuJTExduNKdsjCeuGLBeeLNEWwBOypBiCKtAjTbUSeXdyLtMWLeWDLcaCpfrWCAAGdxzFPcpPPPaxPHieWxhDyBWtcoJohHDrzsfT",
		@"nnHhqArGtKsnmsZFmwTMjHidbDbLQroHYxEMVtCwomEWRiufEtfPMwnRMQoicIWrAbzqKlTMlRLKcRHEZFQhSlpFebaMQNTgqIlBHQFTMPoXGVobPmBcqso",
		@"XOAIKRxsnwjXYUIWTPZUNgdGSmiYSLVNNwvleXTakjTQUMilcBLRusyBMdyoEjrQzusADhwWtRBwyaESuIGcdxZGGHPFBteCFxMpmKewzkLjeRzRu",
		@"ZmRICDfTtZKGKYvbmORDYjoujUUjjlnpJBojZXWnPCpTjXnpUZuDClrcTpMygcpRDzeXqZNDSZscQWmmRVZnMKmnxQQoDpxXSKtJUUpXaeoLnpteic",
		@"obktlIAfIKYtpEtAkTwtYetubfPDOjIxkMzVfMjLSMfbkQBhsGJIaZTCCTpiEByBHvxCzRWqXdsoIlGPaMtAOdRfJkubfuEElWWJOzFiNChrwSWzpokPiJobQN",
	];
	return OLgYSkUaSElVAqtTnY;
}

+ (nonnull NSString *)HDaSvNoXXfP :(nonnull NSString *)xSJOkfoTqJ :(nonnull NSDictionary *)vavMJiIzolqqIMTyz :(nonnull NSArray *)jCjAtZMZMxDHcUuWQx {
	NSString *KIRvoPSuxbWRktuI = @"VJfODGJskIcchOnUchZQmXCYzmwCKlvQrvyGgEIEDrJlsahwZbKcArzNorZaHUEjBkNPCqIOQcetMOKpxandTdlkpaWhWaJdqmaLvpTSVLAUqwmktNeYrWDlwLSoYsIq";
	return KIRvoPSuxbWRktuI;
}

+ (nonnull UIImage *)JsAbqMjijQCsDhy :(nonnull NSData *)gQsOjsiHbGwvvC :(nonnull NSString *)bBajLoQGNDJhezQyNWoWgWd :(nonnull NSDictionary *)RXqXSFepolrLasSOBgLhNFZ {
	NSData *cftgNbGJoXsFVLyXYiYVwwO = [@"qImzeLnQWLkvNSkKIheuQgJGQGQHHQTGMjtNeSFIQwRKQXdLgIzhNxfLGmwCuWNoZETMUrCHrLHVyFrZhCbWpLrTGTwpHxfXpofbRaLjBFYwVDh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xxjCwnmKhyesrNUEsedCuX = [UIImage imageWithData:cftgNbGJoXsFVLyXYiYVwwO];
	xxjCwnmKhyesrNUEsedCuX = [UIImage imageNamed:@"PtandSqCrqzpTSbvjvAeaWhYTVRojHbJtpoXywgiaKqWvIwLtMSmCKALKOChXRzRZwmGZVesoePQMStGYdVkbeGTQMIHNIJzLpBdoDVHpyGKyVCUtxnPcFzRaytoBDP"];
	return xxjCwnmKhyesrNUEsedCuX;
}

- (nonnull UIImage *)OesDzzOpUWBnGCov :(nonnull UIImage *)KnHQGtywdZ {
	NSData *vFhmRWREbjVwqmyDFfk = [@"oCYQgEoiQMwKblReCzlyavuCYVlONEQUnwDPqDLbjhEPfyUnWYSbPUpIRVSdxseKMxfCVwijvPxZKyPtjJpMbSOJldpRvGMpRqXRpxkdr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CQQafrzaaYB = [UIImage imageWithData:vFhmRWREbjVwqmyDFfk];
	CQQafrzaaYB = [UIImage imageNamed:@"sAySUMjjeChGgyxjGEAvFdtvZFWrtabXCDAnMnqKefFAgAFjuenoxfNJeceaiTvTTtHYFXlkUGSILvjJaJpAVhwUfhfPdlhYLsCwsIdZN"];
	return CQQafrzaaYB;
}

- (nonnull NSData *)kIrWoVBaGMEUByDW :(nonnull UIImage *)vEaJMRWBwAdyhFXDswkQMnuh {
	NSData *DGCqNRNRxyHlIA = [@"NisspQybNpXvOjjrdoXAytdMgmmlCayeZGFZtwXtKqtLOrybvTxcsOSifnqZeLNfrAFlTINnWJrsRAmCwUpCyWZfjWQIfJrMMDPkrUzCWoErripaVuRjDVPSOkaOhOQTXSje" dataUsingEncoding:NSUTF8StringEncoding];
	return DGCqNRNRxyHlIA;
}

+ (nonnull NSDictionary *)oshhBuGTWWFtwy :(nonnull UIImage *)WmUUTZHdRqloFPaDwrrm :(nonnull NSArray *)ujqoPVRPtdxWR :(nonnull NSDictionary *)JuLuTJlgfnjspihldtiCc :(nonnull NSArray *)GvSAxjCEUwofyYirlypSVbv :(nonnull NSString *)WCXmOLUfKOXcDxv {
	NSDictionary *YLcQLoSmwN = @{
		@"TaEmuJNMwVcNUNDHxNR": @"BPWLDijuPmESDRpnnVYEflfkFbZxvDLDFZpNXrHlHZBNWVmLsLSJwGbZRduBYWQmbsKfEtVkWMHGUPfOJjjEBgkAOVGKbVSSOAGjxtyPequsEP",
		@"aubUjbMTjEooSVVVZwKAUE": @"FDKTpMNUBxBtblSkeKFTYWxFqksttHsAOjZzkRkudFxmpkEhHcBGWzwCmkJDGcpGJWZeiRcpAyvVoDLcBjpeAfPuEdXxonmAiIYyByPqKpPpmnykZRVmfRTRcWwlszHqzSITBmxaqPdOaqPQH",
		@"IgZafGrRlkrbCiIZMO": @"TKnwFHJLGuoRsAdUqAUPGpMxRoTWpvFPyVbezwKxNKhZUYPwpITnCNSRYfQrJUzjQSPRvrFINzQNUFEOhapLoeiYsghWHTEOoeKAWknlSDjCZOPVSPgEwXvicggSAADji",
		@"XGJsdZuiSogtzDYWi": @"cvHvibmKCRZwdnslsnrVEULzSlUOTwcseSiuytZtxfumouOZslHSCprhlhSvsDsaMvmUtVgVjrCxOvrrUtJodXYNZqAsPhKRzfqqAeRbFlMQfmvivzVIwwpgmxfhDe",
		@"AqPbwQzwLdIbvJe": @"dPLKGYCrwbGFjwhpXxokVXyuuiYeLkIhuiQTEbmISyKUzFeGoVPGfzqIHnTasjShiiPaSWgqmHBYjgsPzndrLYXWopsHVQYvTfMCauWMIQZGqJomqpVQIgbNgdZLeJ",
		@"jTGyGQKQtcVwoZVYSWMh": @"tgNSOJxThfewAzUpdMaiCDkjLMlGkYChQGxoZtmpHCVXNTpnZuCyoNcbZliWdQTwATsdEqILuIuryjNEElwlYKEtBJHSejQWhgMmGcbAAFoJcRKxiWSWSdsFVozyLWlwKgBF",
		@"ZaVbXjcbCAm": @"LHjzOvXagfLvRYlfItMyaupvfuaZHrvHCfGABfPcNllTXsDGQCwDDKVmzOhGVWbqIiqjjzSnJCIXEYvtceYQwASKYzXtyFiAHINlpVxCaeSvVCfWqnUcC",
		@"TlCZzYaMnf": @"eYtfOYDkBmrBcmERWRwHhuochMZWwHpVvgwlYuEFLuKEfxLSmopWqhWzyNDYanvHIYaDFJBEtGGWazUDAAXQKdpXsbSxGNXSrRJpJRbnOiNIRGTcAJqlZGKuPXkKeuCnpxrRSBHCrX",
		@"XSWvvwKopgWjPGFbApCPnk": @"YVAJpZBrCwbeFNTNehDTFxmqwvZQoTkvTUvoqeQLcVYMCbmHQhUTCdWeFKrePFhZOchsNkNJRZNxikpDMinrdRjvbvThBvQIVJCfagWGpNbPNmyMjMibyIsIvbXXRBATpouUMgtsgJIrtcvGAT",
		@"XDkKHmcPrOWRENPbQnpKYQ": @"bxTHexmFuwbDajuaaudPLGGcjtkUyJegZrcnzPAmVFqxQaesMBqbxRrqkOQEQWjnWtBHZYnRafIYFdyUBfzDbfURtLjvLyxXmfuwIfdnuavHIArIKIuDZr",
		@"lGaRLRZpNsTLekKlRyUQxp": @"jGQPpcQjxHvJAJfTDCJYItniBBwACJxHpBHgXUoNdbcUmMkOuQsvIBzPAOOucxdbHErenNCIVNCFRixgUMHPJlvmsxIEHqdHBOwvspDDdmZPWpmDuMi",
		@"EXZelzePkQzEpStLYnkrkemj": @"cMAnDxcoAlMEVSHtnplQOZWQShlMojoKSYovCtunrUQgDAZBuQuhYzjgWxOJwrFgKrDGkKCosXTUnlvswlJhiqxfKHLDlSgsRpischBWSQKyLrDVHxVsCwlvILZIxY",
		@"YciJjqWsTbPUcyqwPIxt": @"bNdYksnnvvHwsuFhVKRAuemCCDvIPAXWxHsrCEMYaTqzHOibsjWCXUSMTmyIWEttOgnnFaaDcLFOJhbvBcWaImWqeUKWEWeRzfvLtrCGcwC",
		@"MHvLltHlgtNGoFgcpvPkfavM": @"JRKkhzPbbzrfaEBAnulYGJhCTAqisBWePqBCVAGVhEGjxUNguFccFicUgsdCeEZHuOWEvuvZVWiDkhwBeEWuzLhPOXmhgIEuRBwPGQArxjdREzXroigIn",
		@"JjtDwVPmnUuUg": @"lQzCUnWZkUSrLzjfzorMmdNbPWamIamYSZXvXVxiCBCGytVgDYjLByNVuWvDJmMXTkekAIJinCsNqfJyIoDKHzEbbeLJnWTxSlFsOqBLnLFurTCZGixaNczCBiIBOBgakJAzcqdfXAbnVov",
		@"VCEmIpdiGhZtftqz": @"WQtcziAyvDRdNFrRBWujKPEcRpUZlwnjEHWEhszcLRFXxbLWViGBxIqimvnqJlpqXUyAzsTSEksPMYUqiLywLLguuTGsfTFQhlROXIDwNrQURzkkswYHjhvsdqTxfpJbvqAIYNHrePX",
		@"PHgIlDWaoJpILeE": @"PUswzfLvEiSzSbPJqpsEifryfAimSxcVQVnjUmHaFFMuHanHiQuNygsXyXzxLwoKXqpZFKadeiTVBCTuapAiiVApLEzzupQFkvyJLOTTQyQAOhOrbZkmkToPPNarg",
	};
	return YLcQLoSmwN;
}

+ (nonnull NSString *)LePFSSSzqUmolV :(nonnull NSDictionary *)GwxyQdRBxKmCwjOV {
	NSString *SipsZlZelIHpzJTLcIR = @"KfmFgFnxhflktCFRvDpdSPVwJUhUcGqGSzPrNWUcAAconVlowtppbrBSAadrNdpOauWtvdXGxEznqMbjTwqwouAGtXcvQGQpaVhaCEtZuxTtByUMiyBo";
	return SipsZlZelIHpzJTLcIR;
}

- (nonnull NSArray *)jDHvJlUHjdbe :(nonnull NSString *)icnqbtwAhiGbSgPGHOXQfwuN :(nonnull NSString *)yVqjAuHFeC {
	NSArray *odfwZtEfHhNekrhFlqIx = @[
		@"jaHzaLLWDMPFmaNrQcejGCJwbIKKDHaeTELbSyBRzNJGxmDXAjVNeFnmDIWiEuocuwWTiwZUuoijDQogqTTCOOLLimQkWueZigmsySxSrnXMSNmIPhrEfgtsGYp",
		@"FHOPoLFCXHfsRDPPGPHhZKjannrgHbbkNppOKnxsrJBeymAUqjKlwWaBswprWlGipykxQGjymFDTrYfBQnizpQOozcgJGPWJnEONNuiPAeraIiGReOnkaiclWwfJJyH",
		@"rAqcCRkolzBsFqUdgdLpdDnFAoBFdRPoGkFENuRyymUOXUlXRWSurenUOlDPmtCTrKoHbaWxoWFhLDwnApyCVRdLeyAZkDGJrwIKlcDXrTyfpxLwXOIrTRmlQIhdLUQOHFAquMvMXySNJeIqZid",
		@"imTsjWGRqMUJomUctnwsuyPTxDSTGyqzoqrkpwkGgKrkTAlFdbtsNPTDFVmIJrawrFkAORSmSPgwDPDhZzCBEDcLEOEkWxzZDpftWfEDSBpVdMKahNVbrmkJOWJLdowcRifVtvZUnkooAZhvjeZX",
		@"eYgdNGxRtuXMMqOXEqadbybUXacbTawgSfjeKvZOTtXgYaUjinaAdZZbDAGGXCwqLWvGcUhcTZTJpEGqzkuJUQvBILwxOpwnCKMnEGOALEi",
		@"BbglPQrDvBGdWqoQTPrMVVeCPlRBVYBSHFJoTyOwOxfqJwbGfjwQEZnqJuIhZfSFDbgyxXwQaDEAOHWieMWyIMiyhpjEihOjwWYnXxJLdLqRXdJniyzfjaUnYOrmWbNTfXQoOVKBv",
		@"FxadBzSOlcLuFSHTsZndrhbcuwcgVSIpQoztXZqFYZfeBDTmAQFQzmKMtUnEeoyacTDgfShljNfvHZJQrPtGYcUyXfaQTiRsyoZedBvemXVwSrsSvQhHyJEfmfxOAdaDKOwARpy",
		@"shnojfkcSlcJdtoWPwHxGKYGQLIdmYuEQQkEjpEEVvdUarteZtItfPMbtuZoVmXIMwVygoLpxsuhxsnhaQhXRusDBYKkVQiofcMJBKHDIHpqHzulBNDk",
		@"bVDnzPjvRQlLPLSsGTBTCPiJDccPHWLPPGIUJBMHouEmkxshsNmqPFllhZuGCQNlpwAxEoXlnJOqZQMJAaLPfwjSBGOQlmSoxeTaVkI",
		@"yNWDHbDZIfqjbTFlGLbjcjfJOyxOAKyWHpmlftetbSXmhrNQzAiiQJfnNOZjQcAyZveySNlgLfwFRIfClAAQTOnzxNkFMMtHXKmiEewC",
		@"wwZLhTRdzZcXZQryScCXNVEAwYhxHmvclkOOIzcNCuEZoCEVmLSsNPQxcCYgBicLFKyoFJuxIYNtqJqLPxgREgFBQFNAIkDnyjmQClAVyDRiJFbD",
		@"YyZZFlfVsHxJYEDROvngQUCnUMdlGBetAiyMGEqBuYRBEYEclvOOLnkgEUiEqZWdLmruykqvdeSoULRjWmjPiQoJrPIdWtargnjTlgWjPacovzVoFInGbVnkiLZojLADIQTM",
	];
	return odfwZtEfHhNekrhFlqIx;
}

- (nonnull NSData *)wSksuLdJpzX :(nonnull NSString *)IvtxqWDiIPEpVx :(nonnull NSArray *)cqhFRSGnux :(nonnull NSArray *)wbaUMOPzqFiskprnhk :(nonnull NSDictionary *)ZaQvTQegJFvlgrLjHOykVe :(nonnull NSDictionary *)cUtFFeErHO {
	NSData *UyGZESlJexfXLGjtzTgJAg = [@"PYRAAlpAbNTHPxSjLWrrvtWWbanVTrTUKepDGUuJNEXPsFqvHyVlumVzhnCCsjaZNjlitEOSGGUeqcfPBEhAOFvWHOpjmSNvSGuTNmWtMCZPdPmCTOaraWhYMy" dataUsingEncoding:NSUTF8StringEncoding];
	return UyGZESlJexfXLGjtzTgJAg;
}

+ (nonnull NSData *)pOXJuheMkSIULAQAkU :(nonnull NSData *)sZjzLEwWEOCgzHAyO :(nonnull NSData *)JuaWbCGrabzA :(nonnull NSData *)TMbtWqZMQIp {
	NSData *wwYBnUtGyrrIhmTWsMPs = [@"pLnfaGWsLweEYXVEvkSGemQmGnIleEtxTAilKmIKtwKnelQkmamnytmkIsmIPALxbprKGfunWbXHyKILxrSwIyIcuhHMupzKOmTDZKvtqQdQbfisgHVPz" dataUsingEncoding:NSUTF8StringEncoding];
	return wwYBnUtGyrrIhmTWsMPs;
}

+ (nonnull NSString *)jSoPBZvbmgUDdXld :(nonnull NSDictionary *)sFtjgbChHQcqXzZzvMr {
	NSString *cYPubQuhXiMdNNSzqvAtFWCL = @"EQCkhlvWrVvLgljzQPlYsPuxOueWtsCvBfzcavIoxFyEAPFGeffNeyoIMrDKmxlIkKutmXMBCudgDDEhZbiIrpcLKvRKolrRVvIEYw";
	return cYPubQuhXiMdNNSzqvAtFWCL;
}

+ (nonnull UIImage *)DduqQNzMuglSNLJgJQPQIv :(nonnull UIImage *)TNZyFiuGoNpQyqr :(nonnull NSArray *)WsDfxFnyNOdxhVYcMv :(nonnull NSData *)WyllbcozgMfgqQxN {
	NSData *LlPpWzhdsdEhVunBrLOdQzF = [@"DvWckysUypzWBCHIkEabcwlGdVqrHPqfBNTxOKZgHePOMotytRdOBcWbTVVKEUObtRWetObGELSilodIVVxzXOJBCmwwwqetsJTlgHOf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *utRmuccoMHgLPe = [UIImage imageWithData:LlPpWzhdsdEhVunBrLOdQzF];
	utRmuccoMHgLPe = [UIImage imageNamed:@"bYMBXlLfpzapfmpJoySUuWDXVBxiGQKLVYXILgIUEMLyrSKOWPpEaOiLFdgqsndKTkgOjXoVHTgooIhgnqlFfWsmNDrCoRyEaKjpwshzbBxuKamHXISVOkvrU"];
	return utRmuccoMHgLPe;
}

- (nonnull NSDictionary *)mBXvrZDhWImVCyUJFYX :(nonnull NSData *)xZGJGQHzdxHn :(nonnull NSData *)lZNxyALkRkPNl :(nonnull NSData *)dlklSkDGtgmNsqxTA {
	NSDictionary *gbCgeRkmfmZJqTN = @{
		@"zmtzIaJdgUcUFE": @"aopWKqsWfocrMeHpUjAdARzTsGZUdkHkjXvyPvHGXnxzChAGGorVkRnbnhbibvpkmuflDmyDLwVRelXLisazzDNEofgeBABinrGbHtXSyTp",
		@"mwAEZFvTPvOIvLgazvXjir": @"XegjtppSPVFuejuiTQbxHawtJklAhRPJGPvMyVfzBofbPxrPWLaqdLYuFSSouRojCpuPMsHGOqXgWXfskJsKtLCHgSQYtkKGxfhuSZlkVLBttLZ",
		@"wCEfFhxaHtkfdRtiecJ": @"eLtiqxXCMiKqqEyMglSddCElpmhMzwCWLQqFSPqZqABUfFKFzExzGbHrTHhChkZXWGlVPFpnIcGWBizGdjUaYjimenGBkwHpITEWCNEODdAUjJeXvmmwIwvKrQnXOCfvzJUBsIgg",
		@"rTjQKMWexyETnNbynqijAt": @"DeOMiKNFlrnQcqvNBPAhvSfjEVrjNPamNgGUSzepJubvCIdamHKzZxlDpEIdYZpWlSlwEFrZnAycAPZrsokKzPXUjiJVkQfXXoyztjfNbfHXiAPgxY",
		@"fVZyoVjacWccUT": @"vbSlrVDYEffgbYJKaBsZdXDATbOGQujdvSJcpNXtqxMqrPoVHBAYdoVMNLSCPRoGuAozNTcniiqtHxEZDExMkyzfGMKgIjvyxqXKGLEjYpqIdTACDtRRgMRytHtF",
		@"rCKdGhsDajbKHBTSoAhMJrPz": @"KAfrzgBDojkDxxOjrCEmFkZFuKhboWoaBiUQazsDzITQeXmyCCsBzmmtqYFVzzukTCRLwDatvzifdTVSmgIHxdQMakLyqEPMFfqkJHIFHylgUGTdvILBrgWpJRHDPSuVjeDaoBJgkznSbbfCWoTI",
		@"LwlgLKbqcEPKVKJLLI": @"IvdSUwuwHhiLnudIEfizABmzSUjudZNGMXEcLNZlqUJLiWCGuFrYxrAhfYZHbhggBouYXxFVkwdkUukyueBVyrFisaTEMqVTLJEG",
		@"DtcjYtthMIKpmsfuYdmpE": @"qnAXkNZfXbJhCBMWDQISnyRtEMyQjKiIArkurhMtudCVmyQJjoMGWYlgIHrsqIIEcPjwiAMyLfblmMCoIBATfqARlACQZVhMayTOpQrGhQhTyLbcgVHYPmvnhLc",
		@"CRTuTEcpHn": @"HuMeUtiFgYtJGIszVjazRxVtobXGwoXqtrITJOWExnbUzAqiBrjYfzapCDTjmoOPSQwktDANKVDLbkdEChCmEBuIRkucNXkRoUlBwqEWdtVaeJdV",
		@"loYecCZhrviBctpvmbM": @"KPaEPzkidYrWXMEKmRcXgojepmIqmQkTKPgZJvKOirqHxYmXUJaLwPNhCknhWLxVbVeRjCqSjPYMnLtPccNxKPwlsdoYKpFWDDtzohseqqNlYlenoUhZDmHV",
		@"ktOtXMcQKKCK": @"BWHpsvkzQJbLtVVrjVHJmWUQYMrYLXIhxFGGiZEIvZbwkrwALUQlHCfHFgAhNZWcBZlqUCEsCPKnxJWOPwABFsKltKxvmjcAuaEXHORYiGSKF",
		@"OondOZBuiSdfOETfQXdWH": @"jOviLdljvdNdRDBIlSkmEgMpFjhmRJMvZKSNamnTUSKfpSuTHkGNkGfePKxwyGQIxKbBCqiUvufwpQvqUuarshJqRDygwhCKolaNsIQmENyawDBMScqYtIcXhmsp",
	};
	return gbCgeRkmfmZJqTN;
}

- (nonnull NSArray *)JntdLvMkmZMLhGt :(nonnull NSArray *)ujBbwrohKMKZtiiJfr :(nonnull NSData *)wHMthXUSSRUG :(nonnull NSDictionary *)SRvmWojJmUCEOlpqJrICr :(nonnull NSArray *)jQmqtUYSsyZiwGXjOyNGv {
	NSArray *SwtYOioutwcjplRDQ = @[
		@"FlbIyxVogBtnuFJLqNKMRzQXCxnIhkXdNOOpAuSTQwtluJeHROxUneCgtuDTEjpuxAKPLNJWfYECoSzrWSPsZMqkdjYSgbTMuUFGXCrGrRZByz",
		@"NxyJxCXiNoCniOhoYetaRxDRqWlVWAjDGuOfzmOKagitYtKobYgDnbHsNCniEcDNLNRYVcdXpXMkXHrDbABYKoaLaLvEmKoKUecxZo",
		@"ZAmzgXvyPWJJJOAmdsbNszjhXZiOcbFKoKMcVMDkYHmPJcGIhpgAHddIMwAJbxFistkWfvcCKxAKMXcwJtBdsKBzKWFTvVsiDEzKRbATMSaoDPvYd",
		@"KTuxEZrzvDyizWVwVMsESbhLPgfFIMiKarfUhEsWIdlIbApvGQXWWSQMoxbIfBiLYwgnYwcNrzFYChgObREOgDPoDUEIFNFaSvCmhEdptzPaKwOuFwtLLCyvf",
		@"bhlYUihSZKuOuzDrVjYFDzdqCvkLeAHhDoeZnMywryaGbSYjhjhOWLHLwPovPzFFnUOruGlHEzvEwyIGbDquDBZoHWZaKAzMicRZYPVbUujUviSAqoGVjRthELDGjafCVtg",
		@"NQYTIWMFKqRbQzMEYWejwiCSWtYIrRojCuOGHppJsCEaFoStaWHsrqEAKyIYjWUyFYZPheYhbNPiYcwguNqkDUDGMqacGMKJEkffZdDdNgrYbHjSFdJLhpGherwweayHvPCAHEjTGgyYPytFFpsYl",
		@"JEwEivwZZaWcadeHaydbNmxPbnZgArllMJTZokgOCthfarNxkmLSklGgskHiQFkQtvbemjTUxKNXnvfBzvzRHQJlgMSyBPwtFeSVuBMQAT",
		@"wSfFCZPlTQHtQvQBclQxLSesZsTdlstyDCXRimSXMKKdpWJsOdSYXazxZBFXvoEbTvuAiyzofqjJAlbtfQzaGVeEASyIgcToEqVELQkudxmPGfkWKvkipjmdTHqbawOPWDpyR",
		@"rErFKxIrrwgZgqQXSRrZgvYhEBwXxVlqaDShmJtsOtZqvafYnVUojlwEAAnzVfVRHIWLoSBvOKnlGPzYTMhRvXMvFrmUzloypTlDUGKQetUnkJHiDSWzHzyAc",
		@"vSjpTOqiLgpSDrLWwUeQONZLrXsHGAhSFywRHCqqgQTPBupEBszfkQwrijRcFoaxwxTmIBegQIjwJukVRGoOereBGbyOkTZsWZPJtHhnwmVRRODHHeIJAfBlIiNTbStdPDrWazhsgZnqBr",
		@"NzcQoaLwQLPwrszhmISgXGRnCkibGzZkXhwzZDFVytfQCPznRRtXYkQeGBNpgXwaBohTpXOdbEWOioCriKFCVNxDulpdqvYiKYmKrycNCMaaZCcZjxkBTtmRWctejTmimx",
		@"SEpWIIKnoADUpRUZzmDdDnslCvZylfiFKLMDXGyioPNhuZPODazAHeaynIahHrdtMnhHAUIEwYdIQCIjQqNGKiotlxtJrxJfYGFyCivmKKb",
		@"OolXgDPjhErBpdJweSmiMZgOidgWgjWEuQNoOGcYRevyZWikXaeMNcLcFmTnDqhwcxITCDcUPpLIuWbDVmOTHAYjHHQgcsCDfKRjiyUzFVYvpTgKnNCDLcmsc",
		@"EPwZrLnAiLLANLYdLaGMZDBDWHygDlGFNtzugaFeEwmDpaAIuvLWWGnbxesYRkoAwnMgPPBRttGAxADLcGgcRedTuMqOBHOdYNQQFzBvoLVQiIyDFSl",
	];
	return SwtYOioutwcjplRDQ;
}

- (nonnull NSDictionary *)EqceUmYBkFldZKJbxN :(nonnull NSArray *)EhZKDNJELvvCHijnImoKDDm :(nonnull NSString *)WvHojWgeuDdEPFaG :(nonnull NSData *)xrgmQErctGz :(nonnull NSArray *)xmydmfriPclvRwVC {
	NSDictionary *TAyEOctYyym = @{
		@"zjOpxXAARbyHGtZLNjWyr": @"COyWcKtCBpCbftcpokbEigRyrODjOgROERtnizgRMhkMvGIunwGmLKNcravNCLntzQOtJPKEgKbTGPdsXuWeNBACqSMDqAIcBIovpDRcSkQDZI",
		@"jsTMOSZbQqEFcepadiHDTj": @"dktxWuIdFZpHRkdPLIXwIufNMajmEJqFwZTBLHMUnTTTEqpmZPGLpPDBDwcVGgNUGIkwXDbPnOFTjBDjTTknOyyjevaBvwDSYDJOuIQpkEuwhXDnEnKVKivmkgHONdTKkprdqNJKruxxPANGLmS",
		@"FEaBWhRlNjlYoTdJULvd": @"oddCEvUmtImRPWfxNypuGElGFkzGhtPqZBqVUOcccPFjsABtIQaVhIlCjGPHUfxkAqbiwikSevbImgqbBfMKyeTlDIrbKsLdKEHingnWCVdZkKQKgF",
		@"XYswhCHFGBKeZniJzxM": @"pYXWdWtrYOdbaRpVgtLjIqQaeTeOgaWzlFMNcyptIBDsKfBNiLGdSDPuzgwoDlHBUtkpEcaPQcoKYUTcnFIbfaYxNwVuvLdqCDtaTeMYXetheZKbfNzvbrUrWSADlbrFQkQfrMINhShZyRmQ",
		@"XJwFAQEJdcRbjni": @"ojahQBlGxxnZCtiqtpjetMczmQVzweOtdxHJAWJcDgNPiGKwIBhIMVPIztYjXcSFitGyUWrOzEOEMzeuJsbOxlqhUWAmyEwqbPvphkGTxrlleeRBLnsaijRRNEUTEfyguCZPYBbkOcPiy",
		@"coFPFUzVifUpJaA": @"yEytMbAyukGKgXwkYfTYuRiLjITCZHmHVdPtCLaOpSplTEYkdqPoBERWLohaNknCZBvQOzLCnYnuVOFWUyqlBMTHRJVDxkVFiCjvmVBCjSRLRoXnuRhFFCyu",
		@"GAIuOrsRgYlOTIOalYt": @"zEQWFYeZpoAoWYLkXWqZpnqLUkzIcWfhTcBLiRciySRrIGrMNPmgrTbdJvcRIPghovuajsuVWgtOQJJMgLmUObOhiARGdmNJyxmwuqtRnmZLljNPEEIbPVUnRNJreVhhAZlrUTxTsRQMtrPGdKoN",
		@"fBHQxBhORcnBARUfXM": @"DGRtWYcsqGlohNQnDuKyPkoLFhfAQwycLznJiZqOXKUuvBTyeNCPfMsMcrxyVHdUNMVyvCycCGPbaOQiKxflECzHsXEKDQmAgmTAPmcnzCFKHaxhUjKNxFinjSTDoGtgyJIMy",
		@"rbULmeowDwJeV": @"SABIXPqEWoEOECFzDKeugPOIlVXvVEjUTecWiEUuvWdFWdcOWvqxwYNQioIbLoMvEvvLbPFwkcBtyYGsFydBZmDHwkTEfBqxFJNMsdpzCcRaEojOPNPpaiFsJAskXxGmaCNkHZhbL",
		@"WAkLuMsWeZvCVefMDWTqwIEi": @"xeDJVzkLKAnsOzbXvoZQxcTOltfCUjmLINNEfIcCNqCrepnDCtyNkttJbffFZSfNsEDJfXYOSpmpldlLBpFKFotbJFnehOwyFcecdMcWpHeCToMosjtyaaXjJCBqjCilupoLIMftied",
	};
	return TAyEOctYyym;
}

- (nonnull NSDictionary *)FUupIzAUyUBZ :(nonnull NSString *)lKpTQNXjJKZdKuBmxu :(nonnull NSString *)qFwEdWifmNEaLSIYKiKVXRO :(nonnull UIImage *)lbNFiSRgqpaeQHoMFlP {
	NSDictionary *JbjSHTpTzyi = @{
		@"VaQWLwgbNxwgHRWgRPrITm": @"yKPpwoRnIDPlstZhHvMXtYVnUYwexWuGeaVEdZhgJCtznnRAfFpoYzOOIdDnZuIKHIURSRRfyVtSfnYrcvkjJDqlUIZjRaSAaoGUaFTQSMqwRj",
		@"BiVzuszWsNTp": @"niFOnDqtXSzmPgtjkKzINPTanoWRrMthWBJaiNjwwXhYjwfKUYdHHRRPOWRIcHVfKRAKNzRuaYgArJSYrpDujhdCAnEnCTzBfVpyJKZkDPEjIcxvHqvkcTNKRMQKkwWhovvymCivdHwV",
		@"GHILUxZgaMymJzDXAS": @"XGHSGISybMHmcqnLWfKtLdrEvhOCJSRKtwkFiSvspGyEBGIpFMyAkeTYcIOlbcEGzWtdfhzrPVWxnLPVwhForreSNhuyqZqrzoBWEzFvpPnuwgyPAKdkXrKftsnPPImigzXtJXnYrgVOx",
		@"ZoUnUDWPMMNwPnVhq": @"eguUqglgyFDnUCvZHzLlTJsTfeAGwgBKqCmwIPrimmyBzujTgWeOWHEHMLeQTkWVSmklLVRecLKegtxqhkXPqshVSGKpAfbTgURvPNwIu",
		@"qTWlwbfHckkafK": @"qkJNBgwadeCQclldopfDrHZJfftcHBfTWajnCILHDNFZiYiTSpdlLwGyUofiezngAojeRCxDsWXYWZYOHmChMEvAKTQGbQOLWFSForyowLujTjULRcGLwFQISEdbrGplieWbIuwIcz",
		@"oZSpgmneukv": @"VbzwRHCBxyTMgAwoTQcepzUJFVhqoEMgsWPkyPWhxfjgtILFMeyXnZWCVFsaOXDHztxVTaDwBTjLWHforOpZExpTQIBjNsoZjiaWhwhROn",
		@"IPSvsqHpBcjZWLPTDfrI": @"VlrVBkvcgfmiYcAoVOVouaaNOkzMaUWuWwZOlZVqELHXjcXZOKyCQCKQGQIwDdecrHmCDKWhEYRJjillMUhAwbcCxebPGJVLltHkJTXyyT",
		@"LfaqjTPrMNTRZWlQ": @"HZQkcQQRsMuyZyFjWqExeRHWaAOVbogwmFOVSUgHfwMXQXLiASOXkgXoYIvpDhdsSIHfuswNNXSJkPIpKzLqOshJYMRLNlCXyLADsOwKpXIfjh",
		@"gnkPhgXSQySL": @"YFodzLbzoGDTnyCJQvFRSreLesGIAzTQpsXquauoKRkUJJIzzjWJuMjAqEeEzuGzsKVTDXeTSTyInKSuvFzUrfLSnMUUynXRFkEeJEdk",
		@"vjtqLOxSAWSlpxLb": @"jMJHWnemwYlAyRMkYdyRwQNeSuzOAqJrCiWiiCuAdOvFcMdYWoVmjgPXQdnMGQXEGcdNqJfpczQCiGwrcMQxBQsQrQevEqFsIjRaohrlfuKbGQVwYcJqXhVWlLFAcdDiSiFv",
		@"qqWBirkJutY": @"fvLfCOxPYoAqMTkjApyXBftcsfWSTCuYRcMNlVslJRRyYXQfUJxSGpEUrqKLXiKavDrbGWaxzvkiZHFFIyggDloxTrpyBEqKQjNYVhNJCfqsaIrIFTyqKeClnXuEqxdSNnwdzgjJKoSoblgBeLb",
		@"JautKxEjCwhaMwWAwuNseHO": @"lbVZXwvxmndjEstUNjnInZxArypzfyMpcZvBiLVAmfDOGHJdWigTByQRcxcuPCyfrKlYYjqfCkSIKhvqWixypLBvUQxjwlfQQuoqFIgWKyYGWC",
		@"hoCdWnejVOGFzg": @"CzkGBiIJXnRrRdLYrcWwZYoNzwordUgRBmeVkRLqXEPKXDPMoyaPedUNgMofpGJlrDLYFOQXIhNFCkOInrhqmoCllXFUKUwCijdaQcBBJOXswDgDRnCPKvHzcYxktgFZQhFeYJviyWcX",
		@"caKhrDfLxtcGRF": @"wbNcMrqtYkZfGyHosLdozYTMjioFyYzvJMUAIGbecaIZXzpeHaSKpOsYFVPYyoekBeJxbsKPjWIplgJUydysDaFlusYSbjQSpTurYepDVZgkognHeBaYHLCvqTVBHBrpctxGXHFVUXsQivMgkpz",
		@"vqTgKTaZZXfDLDWuZgvgKmtx": @"cqXNMnZyUQmgwEpTwzedTzyYFtORudzhQTdsvIJHLVcxwrUQmXjEgDgYWQyKudawucnNLfJOYKNjfTZqjwLXdRQswHCoZXltTLMLFcmbmKTPxMv",
	};
	return JbjSHTpTzyi;
}

+ (nonnull NSString *)VekmgMApdBYp :(nonnull NSString *)AaWvssWbXWnPp :(nonnull NSDictionary *)DVFIkYoTAMLZIWizteeDyOV {
	NSString *IUNcBmYEkhEltetzF = @"cvIDGnMtPwEFBIfjFIRQuqxvsiyjgOoKZlbfzKTbLRgRUBAsnslaemMwricWpUgZWRSCPaTYIMFpmuWYcPlRjfdTagLazznpGfRlGqgdTDrJQbYIXsyqKa";
	return IUNcBmYEkhEltetzF;
}

+ (nonnull NSArray *)HXWiOmxRicLyNEC :(nonnull NSDictionary *)ASojboVoMrug :(nonnull NSDictionary *)FnAFkEWXrqhigujbCOa :(nonnull NSData *)yWkkPYUroLJSn :(nonnull NSData *)qVzdrcgIGdeMCLwUlFRP {
	NSArray *HeWEFAdOEzz = @[
		@"nClyLCqioWImnRDGaNRSFIUUMDrFIfQRvvrQQQDXmtbgihxuRYcyHWeFXwkmDfZEFdMFMINxaDqKVOpCcRfafFvZYTcXIDvGzQZXxx",
		@"EittDRGNPjrbsNBRsHfOObQcktbkUUbZLqpuEMgXgKQavAvwTArqawZaDTIdBIixpfTNPOiFfLDzJhNTJJAMsMmXHOgkxsOOrxOJywkyaSTHQs",
		@"MFqmveQHkyxQFEiEdcnSlASdEpjowyLitmECdwPgjqSKguqfSLhlAZHlOArpPycrswLNmDyVuySntuEgnfnbvwFZoDrBdiSmeMrFvQTXhtlpAFOBsWeyRTMAy",
		@"vsGcMFaXvKTSvWCeBXJXoMFTDvKzMKgOklCtFvoraoKkQwKSTXHTCeUwubctuppvlwFPtkwETPhLZQtQgtUtLWFLrvEOktEUsyiVjIYRNAbsSqHUmWcaTjdmlZv",
		@"NDDAzMEJTauBJuOwiYALqXjCesmczCAzTBkwYPztjeJYpYWUTUnwIHEEdAmrevjDnMeZJkXABIZeXcucidciANkAFaMExbOxBDwqaCXuMnNvVVfuaZuALjZQVCqVHhtoxGjtGVHYsrGCBC",
		@"JUFBjejNoODGxhkpHypVrSZMkmSdUUmZPJklnMgJoUyNZpvKHMJUNisWNGWKfEjMjhbrDZENqgYzPvntLEvVYyUcGQvmHKuFvLrAxOtPOChzUsKsAuRjveefNwORflYYYATfea",
		@"ikaeMWEOZUoQaZNkLEMdTPIpZoscglUXetInsbEoXeFCqAqeiCXDfchFJwQkhOzINljMxWAyfuIFgOhKoZjebvimflKxCJejrpUtQJznFHXbWQXFLZY",
		@"oEsXaMBbgIVXiOcPxHIEXsJtMIdhNxIiysubAcvOIDgAazONVXqdUbfFUecChTdgPrdOuxlWPSTchRuCDykufrUgIaLNgNubZCaYKKyQIJgKVtpz",
		@"mJTWChehfbJJnikYrtnUxUwCoUWutqeKhMLWuGZHCPHydBzLPgItsdHzgnSiDrvVtQojuwzXDcKlUQvSYZCvAUdUeMgJYyPCjAYaCYLRYYNzi",
		@"NzDxcRXqyvsEWzCLPTvcacydohrrSALHZLfmEOCsjHnGcURwsTAWautpbEQTTqxSJdgszxFCSqFVFuTCDhiwilIRUChvvDAwidmDZiICpxexcNUgZXrwoZEDzCdnOHRslRfGzJbMnccUnTfjGdB",
		@"WHCdkHGYoRYkxYRlzoPBLrOPtDCgUixQUetcqioUpaTkUEVGxCvlcLFbHqQjJLxSVLyXmAgOwTlJxIyFIfUJhepxokuhfTpnkFfvIhJNBPTGPtQbJtoWBQB",
		@"ulUjRTbowommLYRHZqHxFXfVkIfBWRzQgtFysoOzrQOVpoySspnWcehHFWESfcxQOyrntMZkhHhYTfhyauRoNAmGbHNozgKxbrBxLsADfQeVevJSZRJij",
		@"AmQWqPtvXltRHDolwOdknqXgjmdGlAqouzfSVdKlgizavUzGeqkxohhfyoGEZwDIGOWKyyvjqKepixdcHaqbwPXVMtClYGeqHVGUTefZDiKWFJKGcPAGArMliM",
		@"kRilIsmrvPuNaTuqLuFNkDRgMGttNOmTWJJwGzcozvoywycNYhqjVrDNeenYgBIYgZdGPzzwObzKwaCvDPJwsJEIYJaeSQGYpdLFBZZJftoPymqiQVxxJFbGzZ",
		@"DqtbRKSiOsaZtXJVZWMwygMOLXkGCsRfHavGDQantZzpVpXzEGtKjnGXVlEDYvSEvNzTDfhmmZZXBOjkBUyaEooSHrFXbLovaoGOxudhVBBUjFtDHtXRnheXCXcNYJxmhseuqFRrxnYMzOZ",
		@"jJPVLZbsnDYOREaIJWaUhDRJmbvljKIZmSRfNSZcoZILGJgusqjBxQjpVxIppEQpsSozvGfbHDvlKaTXuMwBkBiWpClzKwEDWmGyNcgCXCJKK",
		@"jiXDWetRjnBObRVwUKNddBxKNyoynPgiGxNFPvtkcmpYycGdADVqizxfdxCuVFiIpnIXqAvQGDplpAVzsfEWtspxMosgUTZtYHaSnYRkiVkbNuKaJyyCZoo",
		@"acyvPDzbUDKodubOeejxQxGJZKtCJntFYnSFiwZOVdjuecoxFrheZNHGxKsFYGTMiOPFmAqdhLotUSIYXolDkWTTRUNuApDpsrVEzylUcNaTPEzzxXdwFcbyxyeoJEbShBNkDHlRk",
		@"zWImOzlunZRblcKmLtsUIqoSVjQXzrHbFBHYmhzeUCxJvejiNsYwtRTqcuabBDoqfnBUnzpBsGsAmCalQEHSPyMvEzbtnpwmpxpLnLSBQoWZphGsyo",
	];
	return HeWEFAdOEzz;
}

- (nonnull NSArray *)VhEoyZCgsZZkAuZXXyht :(nonnull NSDictionary *)TUmAxOiWZyJIEzrWWLH :(nonnull NSArray *)wJuxZilQMaFY :(nonnull NSDictionary *)IDFEQAdOCTXJGFgWvU :(nonnull NSString *)xvtkEANjPKCFEUZes :(nonnull NSData *)KPzUGTZkzwqJsso {
	NSArray *rKChNSdrIYewZJgJaxKPFLYY = @[
		@"WfglZhumdwTmwbaziawzFhXmjmIFqHppxfVemiFCjDMemmHgcfilcYhKdJFnMGVKtsLLttIUfdaIBKpEWrBsCveaUODCwUDwqZjqGeCNhWCVVdyhQceamnRU",
		@"LCeMcXXtodcnhDaSTAfCpCgzNZjVAnKJSGXfsXUeGfCDTcrcMiBUqKesLPPucEilfGOCwMaSbstRPCBHmmzXGffBKPEEVtdggVsRYTfMbgzDrRrCYLagkWjN",
		@"BVjsalCFtHhTkqtuUhxIQcsrOaUSCNCXrecEhvrgKuqFOlXOuHgcwKQIwJuTGAsBPQvBVpAklEEPvIdirDiUVkWsswpOrbIFPALgZWGgPwyVz",
		@"RzOPWJsYsnIoSqvfqFWOigPmwvFQbZcLDgFhfAGQkOXzhfRlJOvwbUZpUUoCXwsmkVrVzJHsUXgHSjOMtAVyAUbvDpXusotQdhwTB",
		@"qDCvLiafqfwLAbgnwalaPVepUHKychYyeEdaIvpVqeXptWCvYnCzWmfjyVdeeoZHMEMQsKwLUMSlVaeJbqhKHZiCKaNwiHfoextcevNamYKEAnyvtvApHDjGhQVwrJpRGF",
		@"YrpFidttyioDhWlXbkDedNTuFtiCBLhoJSfHQGPJeRWOmYteTRPZOTePTkmOHfrUhxVHDjzGEmJekSXcECKtfGwCboXMwTXxfHPNVPuBbXaaxQqCATqVjplNOa",
		@"xxUSlOArOrncccUfLLUNwlGcozRBEoSaCKJGnaeophxbCoCkaAVyOpToecgTAmAmnOIIOXepykdRNtYEdMOjUXhXAfKGpIxJHfERNtgXmsRf",
		@"RuZuzyJvHmXORFfLyMHjAfdWGJiiunghZTRsIUfWwacjRGYHuTUwRheooPMsHWTGBlTSbIhKxHIxcFeyRdujHwaYuMciPIVeoAQipMmnrXTJXolRkJcShQpzJfi",
		@"yeiRwkPqPTIDVJvocvPkSclTMFMZntBxujtGJGnUfkBPpnRuxEHEELnGHoAPQlEzUCFAAwcFliaGkGPYTCanvJeSFFLMRIHxeaVzoIcErsmzoUiLXYSgaqdMwCbrIaROq",
		@"viuBaLUnpxUIhoUPzZAcMrEAJLbcqMOgoUsOCQCVeBCUwKZroxruZMyhtYfBcvThFgTJMiJBVWIHhiCxRcCfPhfybWAgGzQvmvtWwnuSTvhduDjZoRnIQVwNwcZsjr",
	];
	return rKChNSdrIYewZJgJaxKPFLYY;
}

+ (nonnull NSDictionary *)zdVWnSgIBMxWALUSI :(nonnull NSString *)WIszhsDZqTWuGfpjG :(nonnull NSString *)blFTbMzPFn :(nonnull NSDictionary *)NjwzSJAPcitJgmgLajo {
	NSDictionary *GcqusBJsdUacRiMeXGKr = @{
		@"LEiDYFygAKhufPeZbtIHScL": @"lbfvUhEpjjMqVnmcrwiFExHqUamUKxjneWzVgdpLuhyrPUnrDyxjRszgTrLnIEiPoEULmVtdZgYYMdDvFYDcPxktMpJRJTtuZvKMiJUGiODxxJqhuiuSzicYdgAPkidz",
		@"FEBGMHPEUpVqeSoN": @"rjrVrpOzzdNPzwNJxlnKxWslOvlgybxyRnDtKwsHDIFWsmmYpvrvFTSLRjDyzYVGEueJmDgekwiifpmdfgFYpZUvaTbNZKNzbdTVcRcHbPZVKzPHnATZZsQRQhmnoKsR",
		@"EtytsqWbXdJiHlsxogIwB": @"QuuGfSsVTAjGGrWjvUJaKDqkchOCYsPWSzXyspppzrTJupeDYUvVzsSkpbbSkHivXazSqEjJjDAjfHhEHiwmeRsOQYpjAGgUOutnKnjONLNpVLlLnlMwIRzhCzDEtjSjCPxfG",
		@"LdaUwjIofnkmuffMpzVD": @"lCSuZhFXmiMYHEGaewmFcbeGTGyTmBMQWebdjAuobHOFQgVNNzoMsmrSfGVPkRZDSmgnIxDjhYFzUVQAxTDDQfScnhJUOssCKZOgMIyMYMJhIlYTsKemtvXYlbo",
		@"RcQlmaomlSxiYwsOaWxQ": @"MRdDlxSogFEXvJqbfzOCmQgYfTuuriFzmULlnHjlRevbUmnqLlLnBDcAESLGqwZYZvatqqHwrYLUhEjWJStKENYapfUpNpNAiKiPYwWfEGsDYsrgfpEdofFxuUICOHBbSeysjzBxdeE",
		@"czXTYGeUiUjgzNHYEBaCRbPe": @"OXUugkTojuzNkRCHJNWEAujZhTFZKMuHDjvTWHDXZmwAdFIIVxrdyOFagvpgxEqzvuPolZcLtuFyZWOBfuZmEaCdBbbbFuLHfaYQWDgtehYtgMvNLWsOnUANA",
		@"HFMIEHwnXZUMY": @"YafdTsQxydOyNWFrzMoidhCDgmeWWqlCKXWZfBtgcHVyrFISAeeFzbafBULdboudXynFpPDcVIXJNldlCSxeLXxIQjaqNYzLqeTWTrSQfQKlsTlV",
		@"WJRpYddlhLPHX": @"VsNDcBshtfAmCNWikhMDlHbpKKOQgUVfyzStQHVBEIZlQTFwnGvDQZHDEZCrQhCRWXAEdWNXcVezPhZYgaQUEuMtLkwKQJAopmQCwkqemsQqDHuCgfxtPuBestzxGqBPPqmtOFVqx",
		@"yHRGkggfutsOwNBj": @"GdEQmIxrypClejIEclfQqFYchNTxSbATXbMfUYaGgVclUdkyOCHJgofEmViynzTzuqMJdZsQbNCBHrcBAYjDzpCkVNCLjmoeFCNblUvdzCVPFtIXIBcmZUEvuKsFfsF",
		@"rfyBgcmTtPhWpHNOciUMt": @"DHLtvZdNCVZJFHjqAvbNGrmFmyqnzPqGXTkLFbLXEkvoLqmZNJhwXetkhypYPjdHbuKKrYitVXwNnivOBmWkLZwLPkNGOwrFGpRNZFeXvXDkNdaxLhkTOvprzULXBgMsfrxYnGibnRmICJUonRqpl",
	};
	return GcqusBJsdUacRiMeXGKr;
}

- (nonnull NSData *)xAnwguBLyNhZBrcrr :(nonnull NSDictionary *)FlkrMzMCtTbRRKhPXcCZac :(nonnull NSArray *)YivEbdoDkcTvg :(nonnull NSArray *)kdcqrpTqIwpZIulmLcXRdD {
	NSData *rUXxJaVlvgaqKIp = [@"WeByVRapmxqsjQNVGVuKMobLxvLXleZsMMdJUUXxjhuzMxzkoMWfWFUlJVIflYnrxXYgWZsgVjTWchajKCAUkntisfQoqyTWneQnwrSdZtUTxCVwcSCVGxBA" dataUsingEncoding:NSUTF8StringEncoding];
	return rUXxJaVlvgaqKIp;
}

- (nonnull NSDictionary *)OSkdCyAcyXXjzUnwyVDfr :(nonnull NSData *)HBRwhmywJcNInJhdCFzo :(nonnull UIImage *)LrGuzYMxVBpX :(nonnull NSDictionary *)eNHjCSCClxjVAgzcqMe :(nonnull NSDictionary *)qQdaOEVCBQLONK :(nonnull NSString *)oVwXvNCsrquRrt {
	NSDictionary *RQWnThQCPPxsto = @{
		@"bgNkVpPkCeqItsvvUFOrIYbk": @"CCPvuwmNYQbjPcrySAzgKybxuNmctZEWdIsdeEgZeBZdAmaHiDQyllJJRvIljbZvVAaSsRZbyTSKJqrvMvSdUzOEaFurkPPrfAUAlocAjzStaF",
		@"jfOYaaPAsDVpIxYiGC": @"NUZqyCqzzLpwLqiyHexWgZcHaYzwYXDonlGaAaXftdEeXERKsGLylejJdxwhosOUvbJNOLbroHRZpifySsORxSHYYQOyNmdVfiIxTwfZilXWhoAfLCZ",
		@"qYeEZKiWpXZYIzbBVIdOP": @"SQAdEHEBJcTvzxRqRVYjpMEgjZVBRWPCflRfyAUDljxJhXhOTCFJkFEiAPXzZRpbbukhWAZqhDXNHXYOhEUQHpQWPNXubvQmWcfETbTNbrZMlBJRMYIKfuqDsMsvHs",
		@"XUXbFtXwPxjJLxWVD": @"JJjjwNrNYrNXHTRuKLvAGjVZhyPZrHPWvPblZjhufSTZumZwxXXPkmlqwsZEvLGHLBuJgnDrTMofuasIVjXfueDdIFuyvGcdyKuctmJEWmLbRzZKIVXwCflKocQVFZknVQPdOJOmSTEHujHjk",
		@"IMlfUAlGZzjOTrUTDrGk": @"JNhVNKPjFprafYJCtOQaGqymWBWtqWtfXUpRpxnAGMQHBTSIWPYTanOejTSVwYJUTeWeuLouxrJMlwsycssllZCptlLIKOivNUPkzdYXJrPHF",
		@"aHFiIMacJyHUbrTf": @"lRYtNSufeshmibaZUrmylwfUdqaxqaZqrNULLuHeXHIjkZpyXZSqBkMJVuThcGXsWnlDPqknBAFJMyfBDEtbzhOFvBCGqoWDpixqopItPMLOGOpmGapRYgafwXSjaPDOChztVrEBuzbObS",
		@"njAqAkVdcEzqvO": @"cuiGbOOUMWXcXFeCGwXkUnZYncCqiGfPQlnSPEKsrVFJRoNiVanWFNBttbnOOyNjHjdKlpeHWNeprJDjIVxKvamaYBcSAllOuNdSXVDCuObmQQPGTSAKMlEjvDDRVMoTDjxDwIpXScQLQdRJqXY",
		@"uiRhkGtuetBLYDTA": @"ajkrxLxGANKYYsbNFBvGWLVCsSwJPvzDZeAdXiYLHiSBeTZANzEbjVagbUbVcYzeXAaKwhubUgUsybKDWCQqbBmgWwUXWLKAfWOXoXbJxtsbyaNJtAdfkGsQeuyKQ",
		@"gihWNEMUFSQ": @"FVeNvOQIfTPqBiquppAygwFFmnyDIxsxlYRpaBbcUCzkvLrfNNMnXflafaHymrOawPvqTlbFAvNdLJhnemvgavkYNfjskKbKtPRVVmEdVNlrRGOpADiGchIVnBeRHm",
		@"aTrJKfIVSzUKLimTv": @"FmonErbsRNtslrlaRyUZbzbPqeImIRVlXXbYZAQdPgYVIvMWXIcYGYmgfeBheiPLaKBmvYguPbDmHYImPTZUyFthNLkAUXXoGFSqrkyNdsIpmJmvizmeuCDnZVgQQGszptBqfkLYTnusgier",
		@"BJiRXncofBec": @"eKctVgjlAztOMEGSXgLHdjhIzIQLeTPqgHXeEpRyIchWLtCOtgaOoEQVsXsqyqxWGfGqAeJcvKHqwnCIzeZybNKgpXrMyCEaqKKwbSybEUxOdqdNMMuXkAvmGmiMuBNHnEahPh",
		@"frMVPaBNIpGgSVO": @"moqJjGDjnDfQXBwYYPFGKHhnPxranWrAzLSfJrQQPDfhDTnTyHWpCkMqsXuWKTaNmDTOvsYeyjGvPjylTUAvPQWtdiQYVuClOLqpYMefpLSQAQGBRJqiqfvpSmgAEaJqfoZOtMvZ",
		@"dmxZyvaMbMBWRNGYHNCG": @"tKxIlffiVywjyYzdQJlFTYBgeeRLlpbupHXTdFCltSbGiqJBgPGftpNgnXVrkzzqqGiqdYvhjdyxoqmspuCIwYzYpTtbfVWrGcSgxJ",
	};
	return RQWnThQCPPxsto;
}

- (nonnull NSDictionary *)iljqjxldFPEqvCIhlx :(nonnull NSDictionary *)aJNVqSiPoJpBR :(nonnull NSData *)uWFtSCaQYCYGFJpxpEAQKfb :(nonnull NSData *)qtZoNKKxlBOVrBdJtfNhGXXx :(nonnull NSDictionary *)mPFkoEfScxhZ :(nonnull NSDictionary *)JPcZqEjWBArMWBRVfcqbCt {
	NSDictionary *OvklJGOulUqDilsSsmBNTpC = @{
		@"BKBkyRVuTgvDlYipkOFl": @"bIbkvAuiTGathLqnNvAmYjskDvFLbUDqvsgEloePEiRKbpPKlllcExXRfSEhhODYKSwEtIvxbyhccoXfHpzbxYDqgolpuTcTAAKrhqetRtZcWEEslESGksXHxLkGIjOKxBtrDrJKAlXejejJ",
		@"kFnfXMCQTwkUwAfUnQck": @"XTXrFkkvYWPrGlnAsknkpmikDuRjFRlyEulQExKDbTUILEUnOXiDPLOxMQSHEnMWrktPiEsjBOnAaAHIxNIJFiMvMyKRDPqyiKTrmxZxJLZQEOfUmcaZlZHRplANzmeLvcbODcg",
		@"HVcjBJQoxJmSfhuyexEnVCju": @"MTqqqVdwlDRjLHkjeDSQCbjVcqXlvUNAkeFyeyYNTlSIJnWSeckBKNQDqVqrhxkrHAKUprvWQEGfAZAXIunavhSsPgaQDwAFFajQWUOoGZnHUOJoIhgSnsjMiwXjdIfWtryUozJEPkfimZCN",
		@"xeumVbYdjkQauk": @"HYptSIEpznGYuUFHngjRbSrCkRGRXceFZJypEROkLeOXUhqhcPDMUKxonwaUEOiTIxuDCIQJOYdjNBVJGnYavfuwZaQhRAcqeSEwHGQQsMiMCHQSidLuuvngK",
		@"BWJmZKlXXkfahioPajgRx": @"owTCZsDSGuXlbmKDbXjgGcDQjvPbGXYCxzHcYVNOCAXCwhrXlWKzBTOSjUpTrovfVgomefPWecNnteldDjdfxNMpbxiSOVyqVCQdoLICCCYOtxTrcIenaXeap",
		@"CpJGvfXiGiaPMopZhhB": @"MugoKhtZLsPLAeMEsPtmijiBvRYJvpEfkVSIMjCzfuMfdITcXXdGBaaYgMXgSpgkZlUAjutMUicmMeUDOBLJYGxXmFLRgFARWWAKOCaCayLgBJclZTsCbLwWaqZqBdFvSfLxXPFIW",
		@"cYnkeGafoXn": @"AGYZbPNZeMnMfQZRlAYNQvtNhjepEhtZmudTmKnAQngjEUUygOAYEDXkvVaRPfoFsyVznbIlrrJUVmaNJFlPlTfimJdHOgAVLnpIDPwryppjkdhSbeWlUzIOivUniXBaIyaIUzhOf",
		@"egeYVQJRwwltZYI": @"bkUyQnBsTsTJwpbovvcEslXswusEdQqlFJuSQLjIqInNkfwgWZQXpOPFlgxhSXClOSRaHyhCdYJmCLneUmoYweDjLhBfvYgSgGZhDzEuWEFkC",
		@"yUPGgWENMEZbRsZ": @"OWDsEJBenaXqhFoQuYlCHUBxptOFtPnloxykQdosUdwvAThrOIgIRujluBgJVuuTbFQqvjVGZxolKBvkRGTLwqooxZOfkXWivNigSYnCFBxEHQqvBWecGMQMjwjvcwKkMbFu",
		@"mIjNbnaAgjjnSvfAPOhtze": @"wYivwlpQYVybfRTRxdHxdBkrghaPKHWhFhHTYRQEMWwdILhJmlCgZnheMHKHnqaLGEYqhoKUburUWqGffursNrkrwUMHqPVjBJTBAAVeFqEJxmOIRvyZr",
		@"YSweFfMpmvqUNL": @"hqQBHVfzDOkFLmiGtiuMCIsvfOsjDxKuYFQEkkoiSIERDYrtyXEWVSOMUcYomOrypXDofvjuyeByvOANWGQNvqXJzFUOjGTFoHFbPKVjfMoBMbKaDsXaUCJCBOTgLuAIEwUzQerPbQalmpmzh",
		@"tnDVyJrlJTxEomn": @"QrZXvDkAeqNFrDcjoMKsTctpDzUWBGmLSZXGhaEYZLHCLfteyzzZlPcffxoBxioxLeQDIXLvSEbJepdONSPKelkKQRBykxqdcJzEaTfrSwNRlkELueoljohUZP",
		@"qXPhuzcJdjYtkU": @"bSVhHrRRIHZhdlMyoCGgZkXrXqUehsnjRPFfPpEDzsxhUuMZcFndudjKLJTEaFCwhPydPNNWblcNsgMnnEBUhyGpUPKOwDYvmkawJGqB",
		@"sBJjJFKUYzA": @"ZiSeObZvsSihdNkeGWmWzyqUSZNLoTKpGTsFLLbqSjNgEdNRmJArcBKcMbsyzITgwJINIEgWmGhOOBudKMBiohNhiYCBnYbvsROlHXTwHYLltlTotyskgYlrFQiCUajgfppEVxiMUBsSeVA",
		@"qtYcEPWLSQQ": @"xVbQjoYdAcYPzTVDUxuOSJiDmZbDuCXGPPAUrYUIeqgWblqmHYUlpSqlEjUpmBEMoZivkvKLYuHVxOrLPDMwdrJyHtJduPCJrdssUbwtdbVeoiOmgqYLmiDV",
		@"esthXZikRPkygSAnliuQ": @"FPYAQqTcbNvXLfFclZaWEryCvtUtHcHAvClMWTCUaBovsSiZECYnfaPfVmOPVtRAyYVWXMPSeXOCCaJUvTJGADIxJlDCglEDZCJNWZBGGsYQztZVPlNoynIdAvEtfsWMvoF",
	};
	return OvklJGOulUqDilsSsmBNTpC;
}

- (nonnull UIImage *)mJesbasZVYqk :(nonnull NSDictionary *)gBqbCxOUUIJ :(nonnull NSArray *)EDsBUonwuc {
	NSData *gSUqCaoenffH = [@"PLFKpYPTrKFVrZspgrMjutzjcIJisamkUwBoWuoGXEjcZsvayHqllWnKYzjohvWevggtQtQHaNJSUkBBahRynASVEZFezirSEtuvkOzTKITx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rvUXEJzwqaxoPPNFXXZSLt = [UIImage imageWithData:gSUqCaoenffH];
	rvUXEJzwqaxoPPNFXXZSLt = [UIImage imageNamed:@"qQoLrdQTRDjyTCsxYPBecEkRFhlMtMQMldlwyakPsVdXbZTJpJtAwcZUVwUskdrPQxuvdsScDzrgOWAUfgMNSLDukGhavZQCGFbL"];
	return rvUXEJzwqaxoPPNFXXZSLt;
}

- (nonnull NSString *)FdQTCtShfnnMQg :(nonnull UIImage *)siiWFaRXPi {
	NSString *HHHeBJugyIfSz = @"SrotJiwuVhnyfCEdeHWTGLwPSmLnJPNXzubGXaEfNGFjyxIHnTjmZOxMuwcLVcRfdjXnZULFSTCpRfuiWTQDtFQNcxAjTlfYWpsRrMRZFTAPvFQiYFlcHUO";
	return HHHeBJugyIfSz;
}

+ (nonnull NSDictionary *)FioSiPbejfiJiqumyZUFRgTD :(nonnull NSDictionary *)YIeCnzjEnMyyNSVXiLzvW {
	NSDictionary *lexShuNdyS = @{
		@"TwJoBJLEmMqNt": @"TCNDGZNfgCURqXJKOfQlkvTLSDAcaOwlSDwyvlxKMhvevLDIRriWvSTLeApWJwPTlQArunKbilpXbCqYugaUeMDBdAFpNvMreBwBTCMjpskhFgENRSgjdBNQCgYrsNwIyqvSVHFiSoZYedeD",
		@"aVSqwwtAKOHaPzw": @"rWxFqnqxLVXisnRKMcQPiWauDPmDbauaOoNyUaACuNPMpNVdcCDKnqOZvWnfqYZxArgdakFzTGaidhOxCJCnfVwucQbeaAEUPCwJtCpOPPvPnEangBEvHIUMSzUHYuBOSSFskDrwXcSHgPZp",
		@"lJSGdUfzPkdxyY": @"CjZLwreDIBtuaDcZdFcxtasOAKOoMKQoGcFjtPSgJbypCOqpFkuGNGoxwLoqQcJRPKcCdYdtoykUWTPLxZVYTBFEkiwBENepVaoPwgh",
		@"jhRoAxKfhdO": @"bZVoMkPrjYfmnQgaxroxRCnEhxNGdHZoslMpaaOrSuVuohHLSwyOYAArzQOuRfvihAGInMdAYVFgFzGVgTrtUaNIxKEbzoYPCHbAUkRposXnFhphYJGWdbqLBFQtnendekNtSLMQSEU",
		@"kqVPSrIFegHHGWi": @"lfXABZGEQGaXSbZOffeSNwThDseEPQETDmsmFZvgpdYtPvvzRReueuuNaZBPodHplULCdYQpwqssKYHUJwbWnNtioMLlpjQvdfYPXSxSUvCTxkQUOEsFTVdWvmEDOgYdGznumntGB",
		@"TmzCOpqJXRbHTbRYHgUaXL": @"aTWFHpLhoKrDRivMVEAdnutbjKFXyjPlVSgAToDhBYmJyrbrcqUJzfKwEAIOCsecEzMpkCZZvklDjYBHUxLmDIpmUgyeuWHBXpPKTR",
		@"tpFzjSCnRGbX": @"rzPICUCsIsrbSCrFVFmAInwLOHbZyQyELnSKeWdRCSCNLUnDONoKpMFIAkaqWZOPWWafzhxHxEdwTnVDhOHmirioaniDZoSwVgfwcZhBpolpnVhyjkbMpyWhhUAkVgeqAFOuDpIxUYbFsyAeRMjHq",
		@"udMHtzKIrcgNApBd": @"wQbDKxBejxYESWSnDEcpBzUCTTuBVyDXlEJdduxVtUTLZxuEsdSMeKFhYEfMRijOCGnhIlxnSodUnxxBXbUyxgmekzQFqjvjuQOwnhBtnPXGMunzBkgQLmZCTGmEBjLnUapGg",
		@"GovIOgjYwbIs": @"TKJdMtyTGbejrnbBLPYNyvXwoygExKBXOqQmbFRVLNbLcoqLNIqsKGkojpoBjoYCbxAkxivjcQywmExKEbNTkfHqdTJtUjFcnUxPcoTaLOMcbKtAKcYgOqAMWSMdlLjFnjeSYi",
		@"cwrlCSUIyPLARbJKeijCwIw": @"rUjJwnCzUhVZFwgGRqaFKhHAsxBffghFXSBehAeUkYtNifzlxoCxBhUxMkKSCIxZdMJYUzCXKOBcZbCBOtpGxBuLIOKUzEuLaOtddnloYafWODRjqSLadDLqMpmFKHApvkmcUTUcxEwZZwMPtAmRg",
		@"QKXbhywufskSzEvruYffLBi": @"iNLpbRFZquNmHbJmzggkUZMypoCSLmCKiPyyvLABQPAEgdbvHrJluOZnRHtuUjmYNzmkZIXcCxLvhkbvEQdRKeuRiqHARHRkRdJaPuwtnIDsEYFvdDUnWfdWgLtJhKKdZfxiQjLmJdxuWHjvHU",
		@"mrRcBshLDECceIokz": @"KGVCDlgQaxJUDDUcUgkbQaiheAmtbukfFtaFbBGWxoMzmSAYRtJARVwGubpuHhuxjQItSUpiDtNYhHqZGwDoBFtCcmunLIcrItVrqCwtcjRSHKdxwktxpIKF",
		@"jaZWffrNMsrovDhqQEEA": @"CoQEOclVbTfBrjwuoAMITXlkDiSoRfjscmnWEeIUqPjcbeULGtPmnLJAxnJVjqEHmgjOFYETGlSqeWRfqfxwHSzAYSCdOxlDlODEzGuPwafcVJpFfMTPkKQFpvOQatgBdbGiBS",
		@"VefoPIXSyMm": @"SdpcVJjaOtFvZkrSUZcWTJUYhjRVHztPSjKOFRslLXpliumyZmTTgXZLUJZxrbFHNMeBdAwldDktFRwaFfDCsNGQzNWqklqajHaFHhADKERkOM",
		@"fJjrTHeWGSrwbw": @"HdTkCBGjmoVRGSdrZIKaxDBmCRcbcukONoapujMBkjpFWBboaXDKwyAJxfWgrianiCMoCmGKBIqZBGjjzDzmQekKtfkmCwHdeAPGRsPsKHegijb",
		@"RCRtcWlzPcbd": @"kiSHVmECkUuHBEcjvImVVeQuANaTytsaMRvLpkfCJkxufslmxXRwLhhUqrkaBPDvxwAeVyIeCgwXboDESswFdCVrzcQUWysselggpEG",
		@"nTBCKTzJfvNFwvORyoI": @"rlYqGhYJYAgGLrLxHDmHlGxxxAauulmcdXxzuOorzDqszDNrFkcSxoLhEOZlyOpXvFvMmBSHRHRpqFUBIWEBgijreLWtRisADAmwcEItGvUIxJSmcDudqdvdzgtNCe",
		@"WapxHdCVgRVO": @"TOfuZDxWcjUdwFftVuIjWgqVXrnnDIcgagYCWwYkWimukpksiTzispYmnlTbRfgmIOfNOjCgsgopptwFFZnSHSXUVCllDFuIrAoggahQtzXvFNlaWzGOnaPuFIXuvVBXBHgSHrznlcZfZRj",
	};
	return lexShuNdyS;
}

- (nonnull NSDictionary *)ZDSBxNCIjoloCWIOzDqd :(nonnull NSArray *)LdGXMaxuXcKidZXLsrCoPmzx :(nonnull NSString *)pjpOITYkBhY :(nonnull NSArray *)opyCRZuBGgUOhKYjq {
	NSDictionary *DxVuvhxvZzMxbPAcHXogP = @{
		@"hdUlyPftSGCPAhGryW": @"UuuTwzLqLeqKkWCZFcuKaHZcpGoXMKSXwojjudFUySiVEmrIqTdZrZCjsbfmtpRfEKYmjjgMfxhmMhPVUCrPRtxjIfKWaEqbtgBBVuIhdKjfLbBLzmEoTxfKGlc",
		@"sGVvIMniVhOeHHRBkhK": @"krkkZdupjHDwsvSZssaqenUzjQUndjWTvPSTSYRxdbBCchfOZEcWhNJIRLqAodjErtmXtXouXVeTuqHDqloTWSHdOzNlUrxYvEMbsjbIAq",
		@"NafJWNZOgQ": @"xAXYQvxHKptUJTAsNWXjkaCQIOgeJlHUXOikZQjQMnSQolbvZtuqySIedgeevNnobZGsjaWuncWGdAgTyebqizZEkysUBtVipZjepnTsepomyFpnzIJsTQraZyhyHteRIEHHRYJu",
		@"wxDQFAklRi": @"dchDASsOkPCSxGuIjVJjebHmjLxaIjSPwmLteCrQwLEHeBgwmvcMyuBCbEaDbCKJlJKGXPCFtClBoThQpoSjXjQjorPCVRgEiMkIOOWvkYWBHfPhkxTVzKVhMSbrAwZmpCJjZ",
		@"LdDabrzKAkKHNUbZoBevv": @"VdXzyGKUGZjeodNLZXdFmpDNkIzDhDLdwhMrjhwBWiOHGeslSDOEmawWhfUCaKLrRzwlKzTFLJIMKpUKsoZDdetlNODVMMUPVEytXgqJt",
		@"QWphPflxSBILNkCs": @"hJrLIGIMwqtQoqzycOPfbMosbDkJFHAIAAsaoXByggzLuSPScvqOggTFxoANqdtwWRIVKZZHAnISXUbQikPnHTZwXimDGPystYFAxXnEuKJNceGIdieyYQgHYPFVMPd",
		@"ibNXlDupFMvqCYZTy": @"cegMPaUjCfLZyqDDerTtPOHpXtDFAbMDkxoedOHicPuNDDsJcXBKrOBTWYLNHpsSbjhdNklBqRDsWbPQWvHOgjIJyQfeJIWEgBBUDfQgIZ",
		@"FveEnTLxzHEPcgVDTVyINg": @"AIoGwSNAFHooKAxhUkhXVjIEhbuhFWQhEIBRbGfSozMNkjHvZDVASymJVJnuwlGWNuRKfmVllAeePfaFvQVJzLPxrJwQwkhfmczLxoACBtRTIfqzrQhoiDqZvqNDfKbCUUVhWfpeKpMz",
		@"upUhLoVTBmwDEtul": @"BhHErDVLhDYVMBkbMlsOdrILKvhbPoUJxlQcWxscWqHEwHEhrMRAEuvFjguGqRHBeSuNdrtNRVVjHogbLElnzTxPvnbVPPalDCDODJevscYHoNuYDvBGnvshyZ",
		@"iduYtpffnuCJplLsZcYJdc": @"kxeHZvbwLJazqutyQmNxPdIPnzoScXdHHRcJxDLoGzOaaHDEcLtNsOIfIcJTCKdSgvQdmjmyqJYgDLsmOaRBeGjMjOxMfMfIXhWwRhhKuYbjEZhwcOUtTWMLhMYLnQpZrcGujjONGvGaEBjsq",
		@"tpiAciVMcB": @"GzfUCIZmLmGEpczeEvzhWAIAWcDloLJfrMhpJFdQMpgjyfcvbYOgExzGuSbJvTvCHBJzqRSoEfuZDGkCCBnuuBDBepjSnAOPHbQpJgHaoEuDoWwaNRaVTq",
		@"hbtOTuXmKbAGP": @"HPbNXvYZNbcCxzrobscUZFEbnNZtjSSbwXFZQpYNBzkWLvwplkOFswuFwYIGItvpwDwqSMTcUDKxsfudUDfowMXOWmEtLxIUuyDnGEHR",
		@"mhPRqvpHRRcWrWpaSW": @"xjoyadaslMMazFBxfyFfXKaSRmEDmvCepfushjYAsRYIXgwkQITmUSshLxOUzTrzEIPOThvwgaYYtASyAdhtMtnvCWJVnpkTOseEntyzdgLwVhYKbctlBJaeGnVjIDKPWATjhQusUVhgwGZIeA",
	};
	return DxVuvhxvZzMxbPAcHXogP;
}

+ (nonnull NSDictionary *)RZFmSHZeZtmJNEcvhqSwO :(nonnull UIImage *)ZYLTODASRQagRyjYmQsVO {
	NSDictionary *ieFWdgfXtGHyLHQsONxd = @{
		@"oFihbAailiFYgEfad": @"JMTYiEiBzDXZYTggoBwVNPrcFzLpylPAnDKdQPdYUnkylibDEfWhHiocEQrAxZBPUKqxvWlwDRDNiTtkKFhUyvHweZdwgGICIIIQzEWDCeWkSjVmprmzkQnVMLBRnOptSGfsxlFKBcOrJ",
		@"hpkhPzuzZv": @"rbFsdBPqeaQwWEKtWlTxNpDWdrGcVDFagzzloFvXtLxoYciHZZUbNjuVdjBUSWwTKrzOpGEtXGJkXbyeeYJpGHHIDGeudxuzFYSKxTQNOwbf",
		@"MFkddZzcokx": @"mKJZPQManLnxjcNLkprKAtktGFdgPTTaNkmdOiJnLdomojOLzhcdVasVAILWpWePfIFWvbXoASVnXTBYrWjMdyStDMvfTQxiyYlLjLlpy",
		@"nedVToIQsZA": @"WQOcijAplJxQqxLzFmycacuvahyJvHIUEPssjktmLmMhqnuQOJwdepRAFFdisdXbtihEQXKfaRBEnLLUjAsLWxuZDtlWrJGFZQfbZrtbFjhvXGGcXPZ",
		@"vwSsgDxByPOPZQO": @"ZLauneAFQHuNdDBlkiCDoWMKyvBTeWHiQOMNEccpxJDjTRLUlNLpWSjGOKmSqWLeQRweThvjPvshGwxZMaLnnehsMKWNoSmFunhlkSPg",
		@"WcYGscVVOVFFPsIFDyTY": @"gOkucRnwsEBTRZYqcKoDSZzgTlORcpIAdSvuYIacjayHsaViBApdljPnzxdtphZZQltxSkcpnkqomTOqmHxusGXgWKYleYZmcZitILRtblFyduTWLDcXyEpdxOE",
		@"QIYGaIWKFe": @"QQXrDUJlWZRsERGBvLaoLDCjYDBMwpMFZfExRUqXwMbfRLHMOuLcEGncWErHextdLGmSfekysaXakugREwZHsBlTKDkOemPRCIFPiBQwZzScksfBhRRsEhKB",
		@"BlFyHFeQfOColziRyx": @"hIyIEgOGmBRNaMRigXPhXiZrQlqoCjTJjmTMvUaYaUFPpNoPAWNmnnZoUHrVmGftVdokUZtLkfxCIRMpBoXuolOzDmgLmDRPvjNZAjQhWPzG",
		@"QidlZxeFIwgZjXULAKVjKwzl": @"jCxOKfseCWMGmUkmHEVDyduIERDnHwUIxlqdZevPSMBPYSyaJswESoDdSGrxPRqDzqEsmOtpuByJwfdtEPrGuYfsvRwaRUAtVmdTZPjJMoiFsrAXYvkyjAdIvwQeCwVyG",
		@"qhCbnLMbnGNprGyFI": @"dMoYpgwlpGnfWTWAZMylJcqTPuDGewugthjcatWdDuLmZTwoorIIKKUjMWsMdRjbUaxRWDYnqCmLBTNmTANbsmPmSYedxrnTznumnpGhXmDPXMtEToXbDNiTmknviNKcFNypRVphvXpSvOBXPSMe",
		@"QTdRqgiLiXTTpsQLQJqdrL": @"sqgNZXTXbwklWCEePOXtsZeCWaFHnyoRxdKKntoWcQIyoShRvpJzMUPYSFFxaJduDAFZhIgVxBDSkZZlPyBQHKTvhAZBzbwfuEQwCbkjAq",
		@"fGHCjumRLGdTUgxaBKKzu": @"wJFPAqJfbRfvqQsmeFoHbXlzlCqNcLUYMBrYrquoGsbovFUOGuzlDYwXxjCxywmwveHBtFxCtijvDaCApzuXZTaoNDWNqhTjbEfuYtfiASUMsUHYsmGJULllfoOhE",
		@"oWJfZWxDUdxYoBkVNLUpJUa": @"nZhIAfEFycwSmkBsOOPJLAOYJeKdWqUhqjZZoLMmFIgPasagUZVneCZUbfzEkZusudGFBomMjXLSuuczBTOdqzaVbVOTAIBxjwxtempdxUkPWgvpbnRThEEZDNsVExtePPEdEWBKId",
	};
	return ieFWdgfXtGHyLHQsONxd;
}

+ (nonnull NSDictionary *)PjFFbcVdZS :(nonnull NSDictionary *)bCXKEZqbtCMk :(nonnull UIImage *)ZrPygrrsdkXmKhcD {
	NSDictionary *pjFMGFIRbP = @{
		@"zWiRXCFQhkqFdidPRW": @"BZwXdKSwvBVlNiQLgloyYITgqBHVfiMPeGGXQqBuNoHmLQdAVNjAiJFAWBQzwvsDvDqzjJpFzgskdpeCNjAVNbUFfClxIeZpbpbFSxFbwopCRqwUTcAQuTG",
		@"tUAKktSIOkRvA": @"MNCMqeyhQrOozlGWRtdmYKhhuSUnMxpsWWQHLIXrWpKlefKMsDSUDKggZHcCpNfvlFbFoVKrBbDIpogmCnlGuiKoIleTAqZqZWuAjqT",
		@"HcEbKApPFmlJM": @"NqxZWgvBSeKiXijuhrtqSuxSzjrPyAGTeNzprHOGWqDhzslkvMCNvrdbUULLXajMzrWKYVHShhbDrbleFAYUtGxjhBGNRcKHrWvqsSsNhtpniXhUzjMMopjqwgUeDQwjVASKOpKkXi",
		@"nzRJEvZuTkA": @"adwmCXxbzwzqSuhkqqxjpGWCicDWyOjHQylAZXwPkXMlTIvqaUiUGfzLNiWEZXVDKClTvKJzhPxImzjgiaSdFaijKaBCRKSLhdRJepOIhDsolQNzLSuJZvPPynyMyzRYcEDWwPTUfrsVMqd",
		@"sLwHDZsfnVRYtYQSprlYmDo": @"jKwTiNFzraMYXVzYfnjeaMVwEftAgsuXcitJuzPxlLhiPHIRLSjmQftUDdzOcIoBDnAEOOsWMzQVimtSGZRhYSnSbCKsbrrNrKoeDiL",
		@"qNkLNHkZqizqBes": @"MtAcpWuVpaCEGGJXCNJTTgCaBJvJynJVRxbtjaesxAOIwOOGxjuhyJUAhZlbsegBalKJqhCuhiyvJNRCWakRrcgGZWbzGBYvpSKtBkiIfzusrmPiaRK",
		@"yIOroxUoMjwB": @"RBLooTBOplLccbsJfWllOKsGcMXvZqeQChyBiXcSVJwbjScybrbSsoloVnfCaSSElyNzDDrfyMSHLPOTYgxIqEBasEtBAPUbaeVpyUbEsjJAGI",
		@"MBjHWoCfFUrCqNX": @"iUaNUgkzfRnNAGPodOlTvzhcUhxDrvHLVnHKPhegrFcuisMRtUCKPTXTjdSOeGEyrTQBYoauUhJAAgrMsDuKjHiqKkMLGLvTFFouZhKOxmknwikDsXpIOCRYYkGscYYtYfxtXmk",
		@"aVlVwvOthR": @"iWdvttMLuubanBmhuKtoeFrFUSanyDhKcZWlSfZdEMTiQhqRqrscXaUBKlEzskYAZiDZHmkTFrTMAerWQTDBDXLNzCWiniLHFKMLxgXXbJOxfUVBmTEHQDYNRWXkgOPmpdGeCyZMsrqedIoCYbtv",
		@"UZToRXibgyqBLyljRJ": @"NIfIJvzgScarUbtLNPHNiDtDJUyOwKQlTbHDPwuNMLPscVePDsDJTkDgQyMOsFgwKkoSJEDeFbrnqGZOdNKGsxCfbVZyNDXBdYBYyWmqDFDrfjkVezGtzI",
		@"gnsKCcWACoSdjtvNGME": @"BhQfOAaLqOhTbJKlVpVIkqzsrBHTbxvVXalTFpUVWxZxWUYIQdlekPGCdNfzUBxtvimtYuKRWLabyOltrKXImnWDzMpYEWsQFmCyqySniB",
		@"lautmAaYXCepgicUR": @"KuolxQLltoUVXelPMCVXtRcxzaVcXIcKNcYBnfONgsemMWsqGthboDQXHLtXauKIpmKntPuDjNOXzgrcfJrNBBxyZdUfCSSwaAauwzPbYDbvmzWJHYvpjUstXuTtBkxUXnwtUaj",
	};
	return pjFMGFIRbP;
}

- (nonnull NSArray *)nPXwHqTaBiVLfCsl :(nonnull NSArray *)fLzwVBBkNAusvr :(nonnull NSString *)bovpGeqkUEj :(nonnull NSData *)JKZsbgYvHtNikbZHnne {
	NSArray *trivOMEsHQBH = @[
		@"myJfhGveKooAUzuoUZOtJDiCEIfUcRVKvoPlDwcPftvLgPIwrofJnERssAZeSMnhznjUjQiLoMSxysloycEiZiZujirCPEjhVvPJtNCQECDQrOevRWqNOVYYqvrDxAKXGiWPsaBDtdhRz",
		@"pQmESGIKJBIIMljWSLHizBctEYawEJcAvFbLRcyAOsMuNzmzvitAOVOQZieGJNbyRxkbcvQPXzjsNwilTAhNSGJPpQEFnNKIARjTdnFWYGRvGGaFxnbmXevsOsMCmfeeGBHAiBHTwwz",
		@"UvPcUNinkSWkzhQHOTMJNpaOXwzRznEmLqpWcOyceLdbsxbyQYzqVxmdtQCdYeMtNzKJCdzZiYTDhKxnYwzGQhlHsGlpMypFNfRMhhqmJiYAducEcCZsojNvntVwYKNgTd",
		@"QlmhNEikXYENKCZOwinQSDQUvhtnCKRJBGWHgcaQMwDhAFwKVdWJAFxvRMAFyDmkbmmyarajHyuGYjmLdgDTqMWJFOyQrZybgmCmsrKNvcugxeMkcwdalbAMq",
		@"AlPyYCjNrGZwxrFYIbGODIYJqCyBNyYzeLXKYeMhXATIBNrlGkPlXUkqmvNDHVgRCunKklFNzyejSXoUqIxyOpKVfntzlISikPHLsqFSXvwBjrZ",
		@"WdefqWNgirGUEyaEkIcJGSflWuPoZJKUHkwolovHJjPaWUodmSmyOryCiOPeYTvMTfzZylDvbLZpScdLUrXbxvgDKYwZyFldTFxoPpHLlPVhNwGMmMDWioDcqAhmMWlYjDstoyeiFIwB",
		@"GVAOIMVTwfKMgdipguJpxwjVqeivDioiUiZJlRbHUoPSJEJEXvvhgYKovensVqUUVNglYkzZcqEhsiDXLxrzWNgieDbNCDmvHMDpjDJMbnRpEBEsOXs",
		@"JstoWjpVMbjqsPHOjuweyuKnLyZNmjudasqLiCzNHGlTCJDptXjYRQhRNuXIbXuAKvKJBfWlLDwJcNJJIdKAmRgOuoUbnYIqUYGhTzU",
		@"nyURoMAJOmxcLkkMpayPkdOQwsNmDWhkAbfDLdHtCpSOdcmJLsNMDZiMCBibJFRKexHoSvgFERcaiGScybaNucUUzpZOejbssSscIBjnUvlBQSvOfjQFkYqrtpiKQCmvltbvx",
		@"jAoqDbKKirhgaCeOKzYNuutupbCcOzIUmRQdNySLfwrglsuWCeaNQBLolbBvmZwJYLPGEyMHKTBQhlhhMCTbuqJtygQTVotgDvDc",
		@"tydmpAjbPlocJPKTrXJeZhXIomoJUYGZmeIyYRLXbHqDDCcITFKOlJbLisTvYdeXTTIECPOPEdqgQbbFMHXSKWBBXGlQpsydTwDykhGwVmNagcuCSP",
		@"XdjxgHDZzhLVZFZDlXyjAOXvdLjFfAiDvHxvJGZDQycUMxqYtFgsTkQGmJfwTZGmNJuqsdCCWOdHxSXnZFkrtPOVFxPkPlnZDXeAuDCxogGDtsJSikjHpwYzghUjmdUhzAf",
	];
	return trivOMEsHQBH;
}

- (nonnull NSDictionary *)ArSTtMbtMjMTfJvlsymQYRe :(nonnull NSDictionary *)cORpPESlTzLnomUCDVcPP {
	NSDictionary *lhESdlIBxftrNS = @{
		@"aCnWqEqMTUV": @"wmPiWUqmnevZwSYzMeCnaheblPViMIjurqhVQuJiJKdMLqEyxLwoOWTejyNkhEBAkoJTrlPMUORDhVvKPDMoSoEAyGJHoalkyKilBzUVIKlLAqFYbHkHEBgaxJejwqQH",
		@"VnDnGAXBTTuHnUOLZpMLN": @"EXhIUWpyVBFfJAgoDLbSkjKnuKEXxuYecYiRfQwcozDrVJNMBPZElrTUKZfpGmZZHAVMxpNGWsJKByuUNbOIOHgKGfhvqkPDcSoweQlinmcwQeIoetHHejDhlj",
		@"fPcvsMnKLxqFzCB": @"qabAytXtLjQckzhRLUPUCGWMtpdaMlLppZnOJRZgqsTPhGanOaeYlhQBrKziDqxIwTsPGlxdYuGEYBpmJRCFcBATwkvchuWjUKiChRISbM",
		@"anaitQLpCbfc": @"PtOzbhQOSWLaoxxlacmZbigomVRaqdeQPloOcJOvcxUPkoaAEkESPZFMAWwJnjksMJGYMhXDskmWXCwnsMzRCWlixGsBStSiqGJOWyrNeNsFVpbMJtVQzBxKdLxkj",
		@"TqcJodpkdDlaSKKSGaO": @"pUuyrMxoKqNHNLmsvfXBiWjwZvYBmEVcAWlyBncWrGeeGQmiitMvQiRjsGyogGTRygiwuHvhilhlnKJbaJfTSsZJXwWXgHkLwauERRxYsEfecQPVFdzCZSCZhONvkeUzbOkHDYv",
		@"OoSaxSlsOSpHmmabPDl": @"XtVuwkuEsWXtWyvEEwzoqelePNQzsGryifnkYfBpFoXrHFRQoOJNAhJzsIYohynRnHddgrvytHmSqEyJuYxwasayApIUafyexUWVQcKbZoZxnrBZaLPUreYEdukzfTpwCQqVfqvcG",
		@"MxDBkJgpngBoMVKhycOktv": @"ZhmxscWUrRFKZKvWoLmVszVxpStkKUVOlrmYUrakCOwtsCEEEIfphfVUtRFQkUwnEqGzdkEzZjHvcuLoWBWCFolXaXmuqGhtJgunoyVLPVzFWnQccoLVoGVMlNHGtFkIgFA",
		@"rEQPYZLbQdtiwXxwhlWKy": @"nTzTJhyXXmLEzmkZGvxeNVadMimKHLTydOiNQJooHidxpudUeFCZSNAnotpDPLRqXQpnFappdodvlqSSYzaVFPulXyjRGIDNOVYTfCNzlTChCSxFGdRPsltnrbhkWOFIkeQErCcOMpWXPFbdwVAEY",
		@"QxhyJqERabboMmT": @"FWTkKXPNtXugQCKtqPkhPjTtXftRUJfKArYTqEPYTqBjgPedGvdwUzDvIEXIfvHxAErXzbMDUmOpWPKthYftbnuGdnWXGfSiksWReLZYZFAF",
		@"xWyPOMimcaOtAdjG": @"BwlUxIgbsGuRGiLfzJBmZdKMEJIKFdTHeyuNzGWYRYdByKHqgSDOpAGKirJrmljEipAIPBmsfwqbYTLPZUoMWZgNzrEeZGBQzXgOMVjIQUHVHTZAWcmBnQPWhmy",
		@"KeSKDwkybgIfKSHaKWcdagvF": @"uGXVFIbnfyUWxManUyCqAOhRVcbqQkEGDdmyTmXwPfGVYMvkxwljWuoHLrAQFQQuNSrWORGmiINZmPmcRebOEGNymTmQjWkbzOIyTCobQYcvQePAHlhkPYwtaUXzfCRyRWPsQYwiEr",
		@"hENAQxFMPmKPlHZPROnljV": @"fotdbFuDcTPcecJHMmZCWutBlJKwCDidYAhqBvZcwSMaIRSZqbkjIKEVAOutKkfLudLoAVqatvazsqUfkZWLMyCNBMQFQXvxfvyBbTfGIltHOClBlRQHApxkgKFnXdIbBWBmCrKTFVHELwjZJ",
		@"QMxpRqSyjMtKg": @"OsXRimqTwWSWssKzBaPobagKDglJDhGSVJkwHQGapQDscrbBnogzFyDfGVjOGTmrJmIgzeesOgHHQFRQISDvzAWAamRAgYvXVbSUSBPLVIHTYKKG",
		@"OqRmyMROBAlsVzc": @"ioIJsXfhrfDgAbdKcRcxPZjKywTMCPOzWVcibmOuAeoUVJQyBTQWWOygmmDrftkPXdwBBIdfUWwPgMRcyUPmyHjwSRNspsSZZryblSSAlrY",
	};
	return lhESdlIBxftrNS;
}

- (nonnull NSString *)YugBNWwIdSlnyKAtIdUoIBi :(nonnull NSDictionary *)tjaMmjpRJmqjetvdRLb :(nonnull NSArray *)JscQskMtNMVf :(nonnull NSData *)eNLtGtwCEiLjBC {
	NSString *dTphSrGCBhDNiwtwq = @"JIbJERgYiMrYpoXvMYkInHerEiehxTsGEMJjEOYNCTolmGdlCFGDghxSOYZRorxaUwFTucYcrOxXBrAGguGvxurBeiDEbAnkPIGfUllAO";
	return dTphSrGCBhDNiwtwq;
}

- (nonnull UIImage *)WSnNrYIxNZouYnDPPHnOgZf :(nonnull NSData *)PdmhGSbpan {
	NSData *EeQXPSAegpPZP = [@"WdnKFOGCqAAWonZDqccMEEgsiLitIwNRBqbufODrmMbjcpdmZGcCkqQsptXINQlonxFkoeWTRcRrtpZUREiltKYByqNCzuFWaxBumZFScGrkXIUxkECbFySaodTzJQGKyaehYN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KgAnTVlqHQnOyRqPzjcyRR = [UIImage imageWithData:EeQXPSAegpPZP];
	KgAnTVlqHQnOyRqPzjcyRR = [UIImage imageNamed:@"WEpTNADamGUatiqoDLXGSEdagYIGORgsiawuWORjMNBGmGoYdXnKBBRLgCqowyDwaYVUhCgIocSjlRCEcQkQwiMZcCSLqGozzxHdFLrBPHOjrCzLUXGKgt"];
	return KgAnTVlqHQnOyRqPzjcyRR;
}

- (nonnull NSDictionary *)ZoSlyrNPvDxqCjg :(nonnull NSArray *)gJUThKJpHfU :(nonnull NSString *)aIYuaPUKoOhuwECgnADWEkDX {
	NSDictionary *ZIxdosxvZL = @{
		@"XnJsTEgDetWImNAhHhPU": @"tLLDapDgRmPUOQCFssRVmFwSmuuuRGGLeWlyXoTxQHAxXbiFVJSRGYuLXhCKjfmHdrkwOSYnoiCgJpPqgNzNMTfUPYLOXoZwDxUQyawReNomedaIirxtokRBRHIlvjhAE",
		@"OAGcqMjYhOQcTystIqEm": @"TmEojnkkFWyNipITUucvZRnunxpYTnLqoLlLwTlNszpKcVJvAWpDFkfWCRrTbEyzsNAvvSRPPphemCkKwgBnHProOgGGnFXPuKeDxDffSdfflZisv",
		@"uRDJxObrAvNXjKT": @"TlScncIvRagKomEkpCdtqIXuKjcTmBorOGsdriqbuvUGbzPKZclxbaQDKIcEUhDVOJjMUqQFtUCHYAAxQrhmAohgsLpGvdvgCiDMXSmLJNvbcyJGLuuWc",
		@"jqZKpxwJvPcqVjt": @"GMCQOSOYaeyVZwQBwZRSiSLtMYZFxvQgtnGdHpBpqgoSfSQSfnMkkySZXLynVFDcAQBEJAclMjYbwdTWVbWpyHPhJkjZLeCzgVUuxtFCJYLQKBcZVaCVAYG",
		@"AOgSutPvHaKtqDDdXkNckkGx": @"gkoAIkSkGkDJMFaKVSmpyVzUZoPsRWyLYxgQNiGnFAfJqxplTPenzMJVGTQElVauTjnwlwdVGBhpnRGGNhVaDFtWPCGuVjkscQyqUwZvaSmELhpWvkXQECnZphCaIrYGzJpvLRiZJMMqk",
		@"KZGfCremJfJEmDq": @"quUaqwmVVNYwfbHuqACnyFqtmWkCYtCIQRicfWiZGvQwTBKQqNsQGAAiHENQLlxuIwMrKrXauesVoYXZSXWZeNBYcdZUCdKQnhWbVtDDpueiCUqtYFgLfFpOojPdVIIeGjvJNSCBVfloMD",
		@"HTBKGJqyPhwyje": @"FzhHzLZKlMwMAIScEDsxNdxncvPMZznEkVcEFzuAcwyDQFyGITreFfMmZjZwASPgnxnGgaCHiOchgyXNZHCippMbXfNqqDipIEPlyMtxhqOqM",
		@"jKoKWMWnneZO": @"lQFvJMWbEHWeNwRBHvFJozgkJazINnVyXAWKCxgERzoAeHDmdlhEONnkSSvKGpWlfmtrJAQAeOwKGBQGOjaLsaCjOdYdCTvLzGattsLw",
		@"zXwhUkgHQk": @"mPiHonnCBdBjQlVgpqQxWNlhINPkNHLGApXdgHpBDEXzHtjTtqrXrvhRprLXSmdESSKdITcrBbUDuxssMCfBfHJcGDdRZSGzFpVGGOzMapvQxWGCQhZMLAGO",
		@"SFEtDgPuiPa": @"YOXOFMsvTpLQXKHhhAzuxubSSckRuZKzsvOERJMFEJMMGsNvqMRVEvKJxTAwoxTQwKADXumdBMQsHmlcZTENYAsFUDcYdTgqdZTtrVXRJWGLJdgewKxfJJRlozirjwkGzsAuWGWw",
		@"cnttLFInHKqNlgYyeMvu": @"yqBuAhSnTZnGogKSYjvezZcNDkGwpSbskxpsWsVpVOWFyLXlSmggzBHkwdpXAVePNbepJvOdLznJSromwwECAhRNpPuznNztWrZXdnvQsnuWnCjYTLrsoGLROh",
		@"iLZzJfQTaSmuvcCcjxrgMof": @"JmZoDEATtNuFmGGbBqGSbzymCSylxbsiegRwdjFXpOMWIIOLiUyBHIRwmQYJPgQLIVWqxYTsUeOcrlQPYuDpBhYKAfmJIHlAiBaPMGw",
		@"LgRAPPtoHPJeyUlPivTRh": @"FxRmzmQOyVcVQYPTAGhvThoxtkgfIzYSlRbLypcULzoRZDOpfLhJOLgUfsDKVImZyfdeRDqosJaEWxplRuwolxLmYchVVwuSimqOdSmYjRDwuClh",
		@"oYLSmjSDsyKKNhHoLmuEBg": @"ufPPbFzxhTHyNgZEgLWiqeTbSxZnZtLJacjdfdFadhRQLhLFPGJAwMwpsnRqlguciQSlctPzzwIKjBhxcjhjRIIKlNavajxSgzcOHlhzGHoFVwRKQMDDvSaeBCkdzLaWgtoiXbPxFtyqLREEZ",
	};
	return ZIxdosxvZL;
}

- (nonnull NSString *)fXeeFURebEpeUKBHmqQlBiia :(nonnull NSData *)xOcMiTgeifcw :(nonnull NSDictionary *)PIKusqCXOqADtQDPAR {
	NSString *ygvSCpSTxwUBMHrXWAbWbkE = @"kSvwNwrtZJUjwddKAWuDUFKJaMsMdmWrMRxsSfugKdomVdgicNsoQHVXHrnLIFYtnhjxnnuHWIsCJRrFKaEXWeockDyyAstQTOOiEFpyjPzQOhwaBnFBMewLPHNdeJZbPKjJoWKauQSuPoYPNcY";
	return ygvSCpSTxwUBMHrXWAbWbkE;
}

- (void)configureCellInFolderWithData:(id)aData
{
    //    设置cell的属性
    [self configureThemeInFolder];
    
    self.dict = [[NSMutableDictionary alloc]initWithDictionary:aData];
    self.dict = [SmalleEbookWindow BuilteBookStatus:self.dict];
    
    
    [self configureDownloadbookButton];
    
    if ([[aData allKeys] containsObject:@"image"]) {
        [self.bookImageView setImage:[UIImage imageNamed:aData[@"image"]]];
        self.authorLabel.text = aData[@"zuoze"];
        self.bookIntroLabel.text = aData[@"jianjie"];
        self.bookNameLabel.text = aData[@"title"];
    } else {
        NSString *imageUrlString = [aData[@"logo"] absoluteorRelative];
        [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:nil];
        
        __weak CommonCell *weakSelf = self;
        NSString *imagenameString = @"books_bookshop_img";
        
        [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [weakSelf.bookImageView setImage:[image dropImageRadius]];
            
        }];
        
        self.bookNameLabel.text = aData[@"title"];
        self.authorLabel.text = aData[@"author"];
        
    }
}

- (void)configureCellWithData:(id)aData andIndexPath:(NSIndexPath *)index
{
    [self configureTheme];
     self.dict = [[NSMutableDictionary alloc]initWithDictionary:aData];
    //    设置cell的属性
     self.dict = [SmalleEbookWindow BuilteBookStatus:self.dict];
    [self configureDownloadbookButton];
    NSString *imageUrlString = [aData[@"logo"] absoluteorRelative];
    [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:nil];
    
     NSString *imagenameString = @"books_bookshop_img";
    
    __weak CommonCell *weakSelf = self;
    
    [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [weakSelf.bookImageView setImage:[image dropImageRadius]];
        
    }];
    
//    [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//        
//        [weakSelf.bookImageView setImage:[image dropImageRadius]];
//    }];
    
    self.bookNameLabel.text = aData[@"title"];
    self.authorLabel.text = aData[@"author"];
    self.bookIntroLabel.text = aData[@"summary"];
}


- (void)configureFavouriteCellWithData:(id)aData
{
    [self configureFavouriteCellTheme];
     self.dict = [[NSMutableDictionary alloc]initWithDictionary:aData];
     self.dict = [SmalleEbookWindow BuilteBookStatus:self.dict];
    [self configureDownloadbookButton];
    NSString *imageUrlString = [aData[@"logo"] absoluteorRelative];
    NSString *imagenameString = @"books_bookshop_img";
    
    [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString]];
    self.bookNameLabel.text = aData[@"title"];
    self.authorLabel.text = aData[@"author"];
}




-(IBAction)downLoadBook:(id)sender
{
        self.downLoadBook.enabled = NO;
        
        //    删除之前的通知
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:EBookLocalStoreProgressUpdate
                                                      object:nil];
    
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(EBookLocalStoreProgressUpdateFunction:)
                                                     name:EBookLocalStoreProgressUpdate
                                                   object:nil];
    
        BOOL willDownload =  [EBookLocalStore AddNewBookToDownload:self.dict];
    
    if (willDownload) {
        NSLog(@"开始下载");
    }
}


-(IBAction)readBook:(id)sender
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"StartBookReadingNotification"
     object:nil
     userInfo:self.dict];
}


-(void)EBookLocalStoreProgressUpdateFunction:(NSNotification *)notification{
    NSDictionary *bookdic=[notification userInfo];
    if([[self.dict objectForKey:@"source"] isEqualToString:[bookdic objectForKey:@"source"]])
    {
        NSLog(@"%f", [[bookdic objectForKey:@"percent"] floatValue]);
        if ([[bookdic objectForKey:@"percent"] floatValue]==1.0) {
            self.downLoadBook.hidden = YES;
            self.readBookButton.hidden = NO;
        }else{
            self.downLoadBook.enabled = NO;
            self.readBookButton.hidden = YES;
        }
    }
}

- (void)configureDownloadbookButton
{
    int bookState =  [[EBookLocalStore defaultEBookLocalStore] CheckBookListExistsAtBookInfor:self.dict];
    
    if (bookState != 1) {
        self.downLoadBook.hidden = NO;
        self.downLoadBook.enabled = YES;
        self.readBookButton.hidden = YES;
    } else {
        self.downLoadBook.hidden = YES;
        self.readBookButton.hidden = NO;

    }

}


@end
