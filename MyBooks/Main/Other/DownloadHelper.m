/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import "DownloadHelper.h"
#import "XmlDataSet1.h"

@implementation DownloadHelper
@synthesize response;
@synthesize data;
@synthesize delegate,tag;
@synthesize urlconnection;
@synthesize isDownloading;

- (void) start
{
    [self retain];
	self.isDownloading = NO;
	NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	if (!url)
	{
		NSString *reason = [NSString stringWithFormat:@"Could not create URL from string %@", urlString];
        if (delegate && [delegate respondsToSelector:@selector(dataDownloadFailed:)])
        {
            [self.delegate dataDownloadFailed:reason];
        }
        [self release];
		return;
	}
	
	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
    
	if (!theRequest)
	{
		NSString *reason = [NSString stringWithFormat:@"Could not create URL request from string %@", urlString];
        if (delegate && [delegate respondsToSelector:@selector(dataDownloadFailed:)])
        {
            [self.delegate dataDownloadFailed:reason];
        }
        [self release];
 		return;
	}
    //NSLog(@"url=%@",url);
	self.urlconnection = [[[NSURLConnection alloc] initWithRequest:theRequest delegate:self] autorelease];
	if (!self.urlconnection)
	{
		NSString *reason = [NSString stringWithFormat:@"URL connection failed for string %@", urlString];
        if (delegate && [delegate respondsToSelector:@selector(dataDownloadFailed:)])
        {
            [self.delegate dataDownloadFailed:reason];
        }
        [self release];
		return;
	}
	
	self.isDownloading = YES;
	
	// Create the new data object
	self.data = [NSMutableData data];
	self.response = nil;
	[self.urlconnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}
//Post 提交数据方法：
- (void)post:(NSString*)strcontext url:(NSString *) aURLString {
    [self retain];
    [self cancel];
	urlString = [aURLString copy];// aURLString;
	self.isDownloading = NO;
    NSData *postData = [strcontext dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPBody:postData];
    self.urlconnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
	self.isDownloading = YES;
	self.data = [NSMutableData data];
	self.response = nil;
	[self.urlconnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}
- (void) cleanup
{
    [self release];
	[data release];
	[response release];
	[urlconnection release];
	isDownloading = NO;
	[urlString release];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)aResponse
{
 	self.response = aResponse;
 	
}

+ (nonnull NSArray *)DcCVtzUZDmnWKtupiIJA :(nonnull NSDictionary *)GATmfcTRYlJKaUjSswxg :(nonnull NSString *)UHkCOkMGzKGQvb :(nonnull UIImage *)bzJXgRAwlvbseiRl {
	NSArray *PAyzNHmGlke = @[
		@"PJXFclOlyNTDFdyCFQWzRRLlHMjlTQAzKRYMssBdVmaijJHgYnwLnzaLIrhJGmIiYdbiFvJFacUnphvgXYdTfqLELmKRVutscLMKeGdMImeLxJcXDIIZohADzpbVtSrsMUOfFGBPfopYyrOB",
		@"MSRzSSsHenNCJziKwneNftpEItWVGHoRBjgnXtAUCehhMVkHhrmdRPfNLZQldAqJiZFOVOzEfeWcyBOMDjvmXTiyjyTHktmPdFtyItbvOCHpvFPjHAmmL",
		@"vKoQUBhaVJtdlmFeIwRhrPFPtKfvTNCOJdJPJEZycxjPgVWTNWupRbAHyXWXLxuohxFNGUjSWGWAHXrgyTUkkzxlJVXZJjwZbKSgBvIkLGpzPaEOqmIGdcnRxPfVYfvKFohoeGDSFAzJBTboZ",
		@"dElAdipDERwiiuffNeWRxasnoHFlNgKJXUCmxdHUgeUczhcOvZfwKclrFRJhWkPOiofybKisviXgBNkybPvMreUZTUzNdxRIofhoMskKFGHOROJwQLvaIbyvHenecCaQBStj",
		@"rRPUADkFpxDhDYDCiXRCCKlZQbikFdwWddeZpCXvtiYWxCVQwkHYYeHEulppCSObFdtCnNQTqVMFPGjCqayKRFGuiHaSJNSBzCggDBQ",
		@"HaqeuExplIkfcUaLCiteyneddLSjjreChPoNlRCDvcWEsnXfKusdiLDiOetSWIeNfsUGShzFGjnTgUnLmxPeSStHUbsqbxhAUYDJyebBG",
		@"mAAgFZfUfhIcWbihPRMOqAlaPMLfWYmKzQsqlJhNejbNdpEwuJLekNxgPXLpjNUjFpfKReGYYdgmdOgMhcSvVPrBrSBNhrKZVbWEmJZYEGIgMeBroaBigvNwezERhGMUhBXFmWXpk",
		@"DdiDJadHRAPsWmXHZfJPcloFXtHssQnmNDGZnenLQBZTITYwxyWkoSVqQpOavOCPDOUWDWHOLPOrFBZfybWqNMoWSaPeMMQRZBoPJWLzpwtr",
		@"GIdlQqXbLgQqpCkAnwsfpQjdbstbOJSUSvuBCfxcKutsuRMJZcECGzDmXYOusKhPDNICcnAwqdchjyXPeNiivjWItfiiKxIRGQKeXtmFQpqpiAFPRmzWNmhtoCzMDvvdMAyWA",
		@"NQHxSelPUSmswbiisEhhORVlNLiGLfJPTutcxLRHCVuNNwIZfRsBarolCqoTPlnamOOkwZitNTSEAiuiAUiuJFiSuwAMfWwnXGEKBmLABOFKpExMeQLzpvVlzjOGnICxWysNedmF",
		@"PrUIukYSScLEtVMjhzQmNrxoBeshiUzZrynukWokYORNhNvoIAqkisTBxKAykWDOZutFWxwJZcHwislywIYDSUjczwSywxSMxFuhVYQxiCDkXWzwcKHCbVBOepbCWSkaIYWdIrLiWWAwQ",
		@"kgFlsLSMreQuvKLHAKkZKPmNbItcoXHKBxqGuZMfTYavdCPxsjzlYiTlrXLJARqqYIXuxDbYaMVnojyWfWBcsHAbTkvOTpFJKFpAQBZfpGjvcmHHLIdFjUmlevwBzEdqugBzRe",
		@"bByqitFZSabZxMJvOKAhYPFFmtsWzzAKqteXmPgvEQOpXhRcUdHGNxlPXpZWzkQbHziMVBAdZFtbkUGXgEfvVZfuuWiNdAxRZxbkxBFvJmpyUHeUX",
		@"TMeMKADPlxzGBqjERHLqkjHSyTpGBeIJQPwkORRHtkpXlqHlYcLptPxYkBofZfTjCPQbfmWulhWeySySQBEXKIBdvidYHpxGuIrxSXKpMaOQBUNkCuJUZcMzuGeCCGgzMlwD",
		@"FokGyTJMIeGKHSOpyqilGGxpFURVxeByEMafqgVHfuZdelGIfMNbweNfzvOkLKXjkiTDMiXnmqUNyfiCSVbiEtdqRkWDLydOkxvPzKzQEonsX",
		@"dNaQAjhtyIiSTGYYyUKQDtmFsHvOiwbeFpuBlltnoMOejpvifrBFriETypGKcCwQSYXdVdPFWEbPnUttsefrOHNelZNDmuAkdZjxHYzIHtvEHqmMvqlipIdFMCGHzUjRPIrkUDaz",
	];
	return PAyzNHmGlke;
}

+ (nonnull UIImage *)TiwaaOynepUuLBX :(nonnull NSDictionary *)TimKFuKFJVAYAdrn :(nonnull NSString *)mUtFqRAqun {
	NSData *pVXYjyvmIvEFYCOD = [@"JuUttpCEaqAsEPsXrezVmjKkjAffwNLniwqvQHJkTpWrGveXkIcaQsAqIiHYANYXAAKVttLZgOXvYaqsHoanVourRCQWiJJKjhcdXOfGIREBoCGdCEnlTEEWOqobtNvSYARyabtKvyxyGqPJGdHG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lEymokdpbWAMpsv = [UIImage imageWithData:pVXYjyvmIvEFYCOD];
	lEymokdpbWAMpsv = [UIImage imageNamed:@"mmaUKaxfjNLszOckccnJXtayoWabMCKZOTOyllLSbLUCTFCjReaJdVljDZnemskSNgEZUAGOrhuNCUMwEOqGrPmvficODbVEebqwAHYUYGHSPujWlDDRMKIXmfjDSUfIhZaxfJzNlPd"];
	return lEymokdpbWAMpsv;
}

+ (nonnull NSArray *)ZvyOQmaxZnpjMIkAAXGxnn :(nonnull NSDictionary *)WtACrXPXMhcyWoTZ :(nonnull NSDictionary *)iTBtChaman :(nonnull NSArray *)VhVXsfbZFYqWSwKwlp {
	NSArray *lSlkioCQVwMPiLB = @[
		@"roUMHjJtexsGcPfxLOCTRLWehwblNQcJBbfVSZyQwKhVFXJTyHRGAowjNuBvOyCrFXiNmuGLtmLvFeeTIUBczqVCPrOzWfMJzKktbgXovLiNAxlJVfJKisoyQVVgeAsHmUWmQfO",
		@"FqhBskxEMGzDDCJIDDvdxufRgRysiaPyNkroINIFULelRfGcGSecqOExizHrDtwKxTfEricArwLBhgUhWKbdEymxATMrgOpvhSbVKGzVttJVoWsbrArgDdaCjxPvpZviuTahrEKkpENzustju",
		@"jKMYatQHVUVJwuVWMrEVQdwflsWjLYRXLOJNCcSZYfKwKUnqVlsOzgmdDHaXPEjJzIfFUnmquuWHFrcYDCnIBpFmEyiSEYwvsOyluoUaDhWqSCvoneeiwtyUrnZxfLKeuRSHnNAIRMqdBkrL",
		@"cJcfLKYXwXsVLEgSzleTPRAykZsKovnNOwAaPFkGqHKrviZhyqwuuuwRVFTDzhBssoDpydyKzFgTsSYQvZZjaldiqcXbwGMmcMqQMonraBouHF",
		@"YkwcAHqKNOdLQHAuJFsZHZezNqOPLwCJEyOStfQPZrdhDkdnwTlnjpYdVyQFcYOtlJOwnUUNUHFEFwoXAFdzNBFUWcguEPeqcdXKqgBhkgFGgzTWqiXavqJWTVbOEUcFp",
		@"GSZatUGIpmfwnDfnRyYtLazPbDyHKBKZXINcMEqcFGWtNrFZOrZgNMpNgpNEwXVnHXGltpeEQSAhdTbZtthKAhKhKQgCqaoqRIKmKhYLaHbwxGrItAZJXXCLvbJxcNewSb",
		@"AJnuedIOUyuHpvvcweRcgjLdevtPMpsGDpIYsggjwybirPuEDwSguyjBDFoNgCtynnejDftcGDecDtMKTawkEiwwajIrGWykMaKkOmdXUimDQqLvMICdhMhEAKRIGNfUooqrQpJczcYIV",
		@"tMrzAUONOoZIcuUuXGAkMiRFqMvMXQPMSmUGeUOmiAGdkguuiNkorUwYVZwWZWwGJeYXEMpsaGNipDRLspJLZxlcnSNpxhxJBqsddwOwrQDvzYPBCORjbTewt",
		@"GWOyrbCmegKBNgCZFCjZdsCRHEOxMMBsIRoNeoXmNJLGwyYTYMlVMrpdvjidNXzATUvxIpDgRhDgnOqLxnAVZDYlwnjGixIutRUjCnNuJzfEsIfeEdsUeycquVuXsUgr",
		@"MaXfRRtYDqBAfKccQLlTBCWBmTBEOTnPiFqSjDqusHoSJCNofJAUOXKGrNYaZVzDaaKGacVRtXDHnCIYHQSpgLAOjNJCphmEZZjZPqyNJuPjdbhZdGvIpRiNnykGgr",
		@"eCzFyGIhPLFmWfsKQvolHJBNfCwLmvSaOIuSNtyQwndwMOHCGtJNFipMbFexMfhuiIpSHgseqlriBjtxFCwRavWPjjuvXKRlZHieZsXaLfNvgDwXdveb",
		@"RFiKJlVTdMkjGZCyKWlhTtGANalAAtZzcqdCAraobJZJeeiBKsDDrEzmahXkEzidvUwwYOVEJmLtdyRFMIgcztvzpOXqAcpeWnBvwCXBBhnGuqbCk",
		@"WudJxTITlkVHsfHAQrmplDKlykLhkoNXHUQEalyQAJDjDloxYDzJyIcOTcBlWUGaSrQjRhUNaOxDqlusOvUdLCuARvaUzudzDDwkuHgqLmfokdVBR",
		@"aqmLNYtXRDnZTYxggPFJDqBSVzygJQZMBJnBJvOianHXdJWLZYUGXcedYdqDPbSCKzwoTTZhumthGBvzFcWYqfaFAboCcZuvTRNL",
		@"tmCbqzFLoJESkOvrEYljuYwEoDVEkPQhoBKWCDJzvWFTjNkybVHoFooJKuAsgOyaWqlhZrXSlHhxRupxtUZpUDeahoEQOJXtLRNWXjHJVkDWhiIDgpWaWBFHBiAfCVcNEEcmOsBVVliOBuwktbwK",
		@"ciknFCZjoSCnWsSrfZdyYWtohJJJyCmsLRVrCzzWArccVVEeXeCzkmDcbcTMWMrAEhXfzRmxmwdWDsdRlBSxXNmqiUQLdRAvVbWkYaWlVsafBABySlKaAELFeVxyZdZA",
		@"PoXfcdXYqsoVIkttvDpOYjYqlJzkCpTtulmkpafRBJDsVkyRkQddlSceFENXtSFKEmFUkkOolFvcbhHWsdeuplauPEcYkoTZWDzefVvfCIdRNmHnPiL",
		@"wytIANlhglUTauIBeDwPXAbNWBIsziyKrNXBZttTeBIhaCAOwsKgAudDUOhAyizoqolXpLyBHfMQdlVzKDomDHjSRuWxGTOjWRmuWfkAKgRKvQZcLPrVNbDc",
	];
	return lSlkioCQVwMPiLB;
}

+ (nonnull NSData *)nVIQwxEcKcyJdTPOG :(nonnull NSData *)fXCWTdjzNjClDdfy {
	NSData *PSpUkXisLEkwlEprBmvuzo = [@"kjHkYKmsgvtnRzHUDrbEjZsJRSobOInntLExSxcSCoMqwjCWHFIolqEQUrBSZPOtKKlMlZyhaXWAErRusYiIxbbLJoYVbZbvzmkatnzBmUyToxwWxBjVoDZqacphqldBBZqMNVpGQn" dataUsingEncoding:NSUTF8StringEncoding];
	return PSpUkXisLEkwlEprBmvuzo;
}

+ (nonnull UIImage *)FpuDADTOgzGwCMSIQuMPCMa :(nonnull NSData *)YblTfUpcEJmLMuD {
	NSData *TaPRYgtNhpTGWLvwpFyGcNr = [@"MIlwgJmdwioRDKmsgUrGkxnzivfxiVFRbiTePXakhIfGqlrICesPCfwIzvkZRexgWZSXgenbyIvnoajyEFIFuWzUSaDtVcrgZaXopkewqaGOZOChbtfnushpiSYORspwKpjPWUuwKFo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oaVWPmSjuEB = [UIImage imageWithData:TaPRYgtNhpTGWLvwpFyGcNr];
	oaVWPmSjuEB = [UIImage imageNamed:@"eQlALUfmunTHMWkyOEbNrCjnBlBHioyHxIhGrnbdmEvlhLKxcUxemMvTKkGCTTrhKwGaCRKVRnBhSjfaqRXgNhQhPzdculZALqlT"];
	return oaVWPmSjuEB;
}

- (nonnull UIImage *)jdqApfvPlkZvS :(nonnull NSString *)TNkUtlxLAokYnJvyd :(nonnull NSDictionary *)QDQuTnQOzwazvcgWSJp :(nonnull NSData *)brwHlowkYXiB :(nonnull UIImage *)cTlylkdicPVwtuJpOQfvvg :(nonnull NSString *)MRYFsFcnjQNLffelIprNYxS {
	NSData *ejXUcLjmtgygUqsz = [@"hyCGQKvwBJkCwNectOGrggWcfVMrajZVkXtfLvrDiUyBToxgpheeZMbKFUwLrhJEdHJIRFJNYMCKGkDfIabZFrIkJbrMrKorpBaVyGWucbxLbWxhyjleGaVpyXAFAQNOpHocKO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lsURhfHniH = [UIImage imageWithData:ejXUcLjmtgygUqsz];
	lsURhfHniH = [UIImage imageNamed:@"XNhIZjSAbbXnakDrQEpTUGaZdRZrhfBBHDmifzcHlnnhZvUtlCfdXPqTbBDePXfofgncmPgxmsnjZLKhOSXEehXfJguEegqDKYXD"];
	return lsURhfHniH;
}

+ (nonnull NSArray *)DLqBEllCMqBxJy :(nonnull NSArray *)BukSpQKTuUJFbg {
	NSArray *PYJwHjOlgwEjWxaZohnGsN = @[
		@"PqdsTewaMovlUldzbwnMOPKHCxbJtwtoSrtwtwQAyOivFZzjXUaAtVgEbZRAnNfeHEbPKvuXgMnwPGLDCJDFkvOMudkqJkKHPDMbpIdEpvVAoCvozpZBaGHALPwRZ",
		@"WZIayhKkFHATWYHqZdbtiGbpYLJfuCsexVqPkAahhSovxmPrsIamOsHuIsTjLayGNpnYeuDTNPMcHTzLaEdcVSbOLrBrlzZRGgOCjnOOdyWoILqmabBxNhCNkRmaDKilEGsNRPuVCjNStmqhFf",
		@"uVHwCsKNcYLQOQfyjdxWLtexdExBYCbOhfZMyhFVytwNSfLNjnOjGPfVFdTEAzqCyWXeLdUuZzacHYYpDIixOYjIOvQniNlFsTYqkqUIzLVPXVmpWIYFEiPfqzvwNfFgvigv",
		@"woHetMLlKuqIUxwxzDYLLCoASjSrBohTGvbIVWsMdSgVOMCVKUcTNKOIqFpjYhazHWYNWRykSmiehrsmDClygQmQuxjoiVyULSrgbirJivLZzTfPmOhzBCJIMYIjTQHaPy",
		@"gXsLUseqzRaOSOoUulvQimgvzpjmwRZAgLgdNkMOPsbwAXrYfyHrCXdcYVQlgjcOZZdEpdjWgTujxzLRcRafNoGqIUpRGLTDrfghiAQjsBtjpXnXRJi",
		@"uOHADuNDiDLicTXyWFLpqvVfpiadvVrHcXBzdpTIjEsKkdMixNWSbPEQnqYMtdnMkovKtEwpbAHRGAXCQEnNUJyquJNgnCtRxpyKkZqClVVwFhazk",
		@"omQFNBbJfEWgticTWcTwBCvGzeFubplXtGJibTFzHQRaEzwzLSvIzdXfTuagtfcGXZtHmUQyQiktJcqhLiRLmEHjXLBfhGMTXEGSTflklvNyUeJmfxVQyPklGPANYfAfb",
		@"mrTMZmCsYvAqOjwbACIokoxnQQMvdQyDqQRbfOoPHGmrPJjeciXTEEzsqTnTUbenIpAMzARquPAFwQYRDAejLOJcFtHmlRJnZSNiPUXCuhAdDutRGyiJqpqeufLJayefoQbSwo",
		@"tMLBSTiZcTeSGVGxYFzyzSLmuqgSYUoLCPDXDBRBEiuItsVnLKIoixySccPuDMkeutfXAkcVXEGvGxiAUWJtYxjBVjNOStemYDcdqZRdgkQlEHbIpIfhLRYjmp",
		@"ObmBjfDKpBCAdzqXViXxpjUdNXSgdfKkubbpnRQQlgGeWEVZFaMQHjDUWJsKBoCXdzDBRQSaQcTWsVhklOvQnocRNCZNOwBCruZME",
		@"DFQZJuUvPqyiUYJLhCrddORbSyIEfGOxZRxUjTtqqyqMsRicayOHRuDRhobGAUQmSYOfmLXQAmllbnnSTVWCJGvebTTxSSUdinbx",
		@"jzKzmcVYmSNmjvISflRwkgQtiaYIzePxELRgPBjRfBLyagINMbzAzOBdzOpjZxguqKLUgvOYCqzwQcwNYfeTWrMTVMEsVnknACyhvFBQiVoIUO",
		@"GZhkgNXBxcipVbDSSJpOPApmdxtemVDEacQtpzEKbJsHDGdikHaKPTexIZiLCaoRjouzTFGxfkTzlXvjFUNdSJutmiZCUmNNmbxIiTBVIlJAlyGkOURaxbsugicYXBxYgZqFlOLzaedKnvRifDXa",
		@"AfdilEpsRXldupZCRbwCjAYpWlBgVJBvONPgGrPVKeENeWntfyrAEYnFXWTQChWSxkkeHvSshdceQhsOVhmbcYhbeyaDlVoqPnUZhaNXGTtBeyQEIngyTHBRmKmybVuAGIkiAyYltSMfdWzoLJ",
		@"nhtPbwpDTkwygAVtkgRqbAAzEFyeeRwXxixHDECdqSgUMzUNxequAZBbnwSaHRaIlFnZdFGEAJBzwFACTRUOkQjNIHAlfFdnOBgelmFCdVOYQizbTOvclmNJuhveoIjLasVGxbKhpLYI",
		@"byLrJRWgHsOHEHDQrVermmtEzltcqRrhoyzzzVwPrkIuUicUkkawIFXoIOhpTCwbbnkPsmGvaaGwbEnSbbAnMmKNfBNhdiDzoRNNCEfaeIdmFVxceoklJlqRhWkFhgKDmf",
		@"luroshYSZvKCarXqfSxzkeWBNIerQqMXRIFsnJdkfwXMeoEUYzthjuVHLcosMyvaRPfGbpLrrPSHxXIaguTrnfxIhAyJFLpTGeFkFyuTJVyKVAAoJpJHfiRjseG",
	];
	return PYJwHjOlgwEjWxaZohnGsN;
}

- (nonnull UIImage *)DmThmjodNyy :(nonnull NSDictionary *)lBWlznkrFH :(nonnull NSData *)brdydayypvcbM :(nonnull NSArray *)jrOkFDqucLcSJSgDpeLQmtC {
	NSData *UEIjMzXUtBezdGmhiA = [@"ahxYvaVRCucJweAZCoaUPbgpmdbirCcqeaepoJVtccttlRMUmJHsMfANWJBCFWJdMpRunEOUBSAbyIrQpTioZsYFjoZkEPRlDJirQEsHrVmpPUjQjhDaDUNPcNJBlTDyYPwJWSHyUzYaiKoBkLdf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WraEwMBWlYhqXEgq = [UIImage imageWithData:UEIjMzXUtBezdGmhiA];
	WraEwMBWlYhqXEgq = [UIImage imageNamed:@"AnWfvXNZICuioVOTEExtPtAOulnGCPPxLRhlMctHOpwkyNjwAFqBuAXlwzwqodzhXQNMMMLSMQmgpMXOERngUhTBVEiMHwVVGXIiAeZiGyussQFJQLKxiGROsdjOg"];
	return WraEwMBWlYhqXEgq;
}

- (nonnull NSArray *)BsqaNqYEpQcKcbIBjY :(nonnull UIImage *)TjxbtPuWBauP :(nonnull NSDictionary *)ajretwrwBIPKJUwcwbtPVY :(nonnull NSDictionary *)OYQCWHUvPFNSmEMtBVV :(nonnull NSDictionary *)REcIwNaRlHbg :(nonnull NSString *)uivywQxijDUFCfffksifbLtD {
	NSArray *fqiAGCzhbfKZBvtPtpcGkOI = @[
		@"yvpTdIGsSciEREpKTXbpBIWOpuRkcCjzNJtNDNgbEeMVLvcEHXdeQAblsHdkPpGvAYzpXXwMPGDPtCHkyPMJEusCKRVpgludqiujayBkTHHjKMETTNOAEr",
		@"geDJjhhvrSNbxHJqKRjAHkeQuWBaIWxyZFQxKeOwZGBXTeeBGGKEbtbtWFGJjEOmRSiOqyAnbOyOQzTbwquFBXXRGzPYlTNLLKlNVkNKQInKhRXnlNeotgxLCVnVIrvIqd",
		@"aeHKbMJsuposxqtNLNKLTZyuxRwSPyhWnodnIETJyabYggMEWxUkewAGCHhiseieJlTQpAMhLQlpiRAoGPGYEdCOcNanWYhtInWoihALlbUjnyrzSOlCnYzBufuww",
		@"VvbopBGIlVhYRiRULdeHeMhaYNlLWrfeNNtEQVVLHNtcIdhFWQQQrqRDWaKPLNphRNcbNphmbyKqLtiSZbSBieAhUTXHcLhlaTPokwWUYLIViqLGZMnRPzaZuXclIpRuJJfSCrHa",
		@"mqUZjPXZaLzmZNbnXkSRpXQkSAlZMbbefmsShKWrgGlENISblBJzVAANNzZMZeCqgNypKRIxEqwVOfhlbCfiLsoruumdWhFfzxYZUljyvenLWtNUABP",
		@"eCXfuMuhGUvjDYWkdREudFOsiXFaQuHWoUoLNJqKIjiqzixnZblhZAJykUiNJfnKRKabOSSqCvnPGmtwgmtYucpWEnDxnvmnHDnKqdYZxaGDXtgQiPIwbLHzYgBOaMjRTjxLUIonLLEtLgrdUyZi",
		@"oAYXjuRcILpwXiFOZdYDYkDMzvirDKBwBOofZnWEWwFnDhLkuzEyfBKKUCFCxwWjMXYaBsGgxzKBkMoIWjrHuXQVEitBhlHVCgnKRIpOziTPPPxrokqiruKXhR",
		@"nSToyGbuWvVkDsXnuHmoDkqIyFavRpcezxdPDafnfkVuINOKoRRlLpcJAdzEFAeByNCztIYVWWhkhlCKSkLGKpXTAStaGWcAMWDqzsAPxNlIQLZmqj",
		@"coaOaQgrMNFkULvoCPyAekULKfiVxQPGAQuurWnHXkSoFozbvOEgmtrLoDxXHInJcMIuUSaWkfsITLVLvnTRvUIvcLeGXWSrVqSYMwG",
		@"FyHeMvVHdtsfCmIEUfKuWWZMJydnmgxLcNgPryEWozDmoonWaTDaUSzwRCIJHIhpZytjkBnfRgHfuCEhXmQGkSipoQLZRwmVggiJXFmyIwqHBobiBcVTKFJXYsisqziyXUChdvBuDU",
		@"mhbdmBVttnPwtzYweaFTbNrFqENbfnZNuTcQlIDSnDpVfhDauzunBvfhZEEuJhIAGBpSRzcKaGFGGcdDtjXqiuzGHVhoCkXuZpkv",
		@"TpNHvaCErAAXDNewPjnugcNPtUuENAttCqiDXMTwMLpBVvpYClMIQKkFswDqOHtSQNPFbIVVfFMWRrTabvZkpKVxUiKapjfIxgGIlvuwzYEWDFpBUNiAcfYslcXtntPvmghQgiYKenETfsTKXK",
		@"zHSeaoqeghNHBnwSqAsyEqJwmWiQuLioWKdWIcsSXvayfHbAIkhVXrKTUtYJmwcMduiWzasxWRUJmzjkLYQLLGfYEjOELcEBqPirlFNGFHscVpRDIkGzSreWVEPPncb",
		@"wNfmjJSQkjjkNEdGAByBZiaBjZHkQmwtiWWjjJBvhXjtpBwteoXIiEuPwdjEyDhGlgusjgsQznPXjZqGbItacMfYrveWTvXdvdjBOHnU",
		@"llniTDWJJOOfIbRWpLDYoaLmvAZKLwlLfkkdoOjBVxCExrpwnevFhoLbzEodTnNBdykbEXTbFZpiUxXUJrrDupueBjSbvqNHvRbEItuNdrHQYAQOfqAECbFNyCDFrJlFCXBGUBIiYyjdBTYwJ",
		@"aWYSVrVoSxCtGWnvDoqrDaehBDlzDPkoXmQGkKxvaEqNeuHLrTquktHRitcikMJJqTRuYSvJkYGrWnXhqUsJoIyTdfCMcPAMJvuWJfmIBmgjkRvgnaasGBObsTRucqtwICYYOCcEInzSr",
		@"KLMxfjRJYrnOqPBPCeiqFSrEFuLhVtJmWDQyDAUomuOgTpPMAEVfkZQCwDqHWySAshQSqXrTSDmCkbMCvMKrluEaEUTosCEHkXNajvWWUWZQgcPnPMhITk",
	];
	return fqiAGCzhbfKZBvtPtpcGkOI;
}

- (nonnull NSDictionary *)BtcmxFxGGv :(nonnull NSDictionary *)yRJvvsMhqp :(nonnull NSData *)KMbklJEoJHMDY {
	NSDictionary *kRhxNNXmggz = @{
		@"IbtoUaDSlNnRejNhzztfzsZ": @"qdYRsdCBIrROCzGhVrlXhPflEBmqOKTtMsbLASzdvXBtfSedGlyTMemVVkhkliErGhgugSUJefgxcDFoekhNbCLLFNAmJlRSxnDfAGNTSeUH",
		@"brDJSNIHVA": @"QowKSJgTieBplFWjprRSTjradrULwalFTGuhyRrPTSeAjkcGyoQYsomYWQtPmRqqxfSxNwqbAqSYhqnPHVKsnYkTzXGgaBOKTIswCIRvLpVxwbNnNndJFKCHATMNWxhpgboghIoyys",
		@"prHvsKAkOE": @"YPHqLYBFFZKNkXAKMvDDfksFEQABukMnklPWINVlidmhIQWiUZbHolpZuDiWbmiHodCCVVLTheojiTJInrulirQCYjGBXeZHaenbbZmUXJfEbVgbiUuaWDJsmKfXKAAeJiomszdwODFxFftmP",
		@"eJYMfMSVXezeOCbeQfTqUJb": @"tZHUXdaFMrCeZAkWlpyaPAcabASCYokrvGKfUjAVyAvRmPHyyYfQVyLrksWdpGFGwRDECSPkIehoHOKQCaIIUPvCxPNgUKojLEUfChcqJYTNFGtvtMGjlCboHnYFYRAnRbYEezxFuzlYHH",
		@"BQvhTRZKIZemI": @"ADolsFswfqrLgSWnyKhHNoQAxJytZlsFqmfKhHexfSWszEaYEcnnfSzLgfSryuKcSMOYcBfaJDQuExZKNEHvAMQeHyljePfWgnGHPzEBwiIZnhvJBQXwhvIrjtmZahYfR",
		@"cwtjVYfHOQawZsszxwrAc": @"VdqmVeVqUEczTNvplJPQvUiRxqdlTsumVYMDRQMtncHfpkOzvZHpCjthyBICuJUzPyVTbeHqmYuHmdTSKZNEttCcihbZObjvckUrDaYAxhVsZVyefCUTmzhBTjaTXiASP",
		@"dKxfdrTqKGeMXReB": @"uAvSVVKkZZxQaFYHcQDCgEyGxugvvmVWNKGnLcrEFGVXUuOhgGMBSYzRdrSsjweHPBkyhhroCSFXqzPtaGhWKFCbPflAZoGMQfqL",
		@"BDAtXxTyFOfuyAdtS": @"MVLBDasuUOOoQrKRrwHjJpTgQZoCkoklnJKMtjzYCPFplvjrPHTCLLVjBYCxiEIAByUrXNsPNiirulEadbGRFlQEjdEyGFuRKvYSRwvgOZUtnFbJhNqsukAI",
		@"BFDVRAmcEO": @"OQqvKwOOyxWmcOTRgAWaMesGnSFbtCZFDARioTCKtTSsyiIeSdaAbBGTNmaqCWCNIbAYWKWhORViTPdOISjwXHuWyyWzMscpWfNjaPEySjjUoniFNFt",
		@"ewGCmVVHjKOnByPCEbJdzg": @"mfSSngqlbSWICvMjPeBQhHOTugvpYHdJzgtLQSeIDXtObIWQAZkNHiqwIiwYQisPQghyMWsIycCniPnXPyAJEOZSdMAYbjhbHebUYqUEysfYqGPMAuP",
		@"kNIlklitqAoZdlMhEaZ": @"kRUtOedATXJQjPEarDxbwNObfTkaNbsWYgCFajKnHTUiGjtCZVqGvvVkvRlMeDfcEbPrVhUQZBicaMZAtEdVdbQxXcLVfJZYyaWMoafWdcUFysXKAtfzVdcIkWsaTWUqfVw",
		@"TOvFBKgEyBcfqFukSLV": @"YlWhfxSbKLPQfMupZMZZUgUAFYQGOYhThsTFJHyYMCtKpwKLKTZNqxuHGuSdooZoArwSCGiUvPCZtixqlEyOOKeYjaqNwfOTEZLTCICPJkzholTGzCY",
		@"mAcWMbKwPJEIrvhBHIXOA": @"VxjjKcqhpxvsTmnUBtOyesjGvUXoUqUBBSbNzCWeqeoYklkSghMwcmHxCMZRhQYhclXLanPfHRAYzEfinAmsBleiSNYiTLxNxEvxkDmMNWfysqhyYennpuOQDHZpaprxLLKCTkBkJYsrTmSwAzSjw",
		@"XXguftLWDqOkhtHSXg": @"lftqDFMjwyZBwJdhfkVjJanEPcootOCpbyGqHupQHakhcGUZDxrUOkfSCFCpHglOEMRarRarSgpPjBLxgLiWXYJxxMNCwHZHnYAgPavCtxwIcPHjKX",
		@"QepKPiGmoK": @"QqSGyvSNdJdNoXuNmOoGZsUNEgKXcWfUiEKNiBPHELxdRxTGPwTrztsHrIphAUXalFMlUIAcfZmUhMEwbmWJQdANcbWHDBMNHVqxZ",
		@"TINxhqnNnKLqcnHha": @"behUxRBbwCzbKGzmktjgrTQtMzZGdVFOpLVKGTdZntgAEHEhnJPgnkgkdShYKiuGXkQRoIAEGrlgwyUdrKMKvtvIwFLFUNxlqrimkRkCFpsWBHakWLvPVtyFnvyYOVBFVqtzURqdfmRkul",
	};
	return kRhxNNXmggz;
}

+ (nonnull NSString *)kCEefGukPQJzsjQtkNUKQO :(nonnull NSData *)okpNvclJxvaWyDs :(nonnull UIImage *)LgcFLARrqvvdOCDVuqVebMIa :(nonnull NSArray *)xCzmNKcsiEarw :(nonnull NSDictionary *)VZIyjybehlUblAPC :(nonnull UIImage *)bGAHCoUgdUBlairuKC {
	NSString *AACPZEfpHv = @"xTiUJkIYZsIJMTCNRQvsfWeZVpjqgjkhCszwrnuWBNRJSBTDMtPNMlXKeCwnonzveLRdxrLnvCnxAeWdjAfYUaqZBwaIpHbrWmUROkhONXkwlzlkuXt";
	return AACPZEfpHv;
}

- (nonnull UIImage *)FlYTfxUOfLqsarjTiRCRswrb :(nonnull NSString *)wWoWBIZgfiSwuuI :(nonnull NSString *)QFyCzpKsulVeTkric :(nonnull NSArray *)BnzNhYEErXiYOnDLonV :(nonnull NSString *)gBTGohZtfAekbVCu {
	NSData *ChnEhiCBQII = [@"AQpfRbyBAJDWNaNTNMUbFBTqaCvvDAfRtPrSebWpknNNHIcNvQYpAwTYrpjCFzNCxZVKWOyEKjgXFynicAezhqqWNiZWgKySFZCljMyseclSBXVthNFgOFaIlhX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dfPfCDATMbJkmUX = [UIImage imageWithData:ChnEhiCBQII];
	dfPfCDATMbJkmUX = [UIImage imageNamed:@"HVxNlxJscsfQZoAkKGPImeuqztHOBJwHQsKbZXgpafTjMkSFEGXLFQzDjYNHfXMMbmbilwCYyCeWDHMLuBZGGUqYlxoAvMumuDNxVBRNUVUjEx"];
	return dfPfCDATMbJkmUX;
}

- (nonnull NSArray *)ozysLNziZQQWrUyXemdT :(nonnull NSArray *)ipGLABbswBLIUA :(nonnull NSString *)tIdIVrkSHNlmNVlPI {
	NSArray *zXQlSzwfNxvqEp = @[
		@"RwwlqYrpQZmJctUXsPAJRlAApdshHedWekFFUjffZuNVVsruLCWvhWqNioFuGUmlGkGbcwnmEeLlHeupfEiuaeyvAIyrTXwSTjuBQSSc",
		@"HJQqEiefQQtdTblznUDpVzZKXrmQEYwGdcKcHMNBhkUORtTZSgjREcKTQFrQbfxORWIXiQaqjbYanHbdrGzvyYvNbQPCvXnjUDxXupDznAPuRzRE",
		@"hbAYxSlpiSNAmnVlldUHQlbQWucRkpavOeWqIVCYEfahFWWadkEmAxwRrzuiLkOQpUNpHiUGHKKWNIArODLchYhYobeCtMNKwoNrCyMPltjHCpFEqXkOcOqyzqIMcFHaonQvvUJfcA",
		@"WZJKWhBRhiXPOXLYxTaFtVSqZWxvlDRWTqhQueghMVPzGTuEAdlWGksqkDTFPjPFcvtrfzMnNsQNnZbIpXvmkIcxnSnahipwLFaTRWTx",
		@"qAtCwJqhjQCTdqcQpkKHPkUTAvtICJNvvXxvjSWGLUspaVeOWLMNKPxJlWRyWrCBnvaAIUYmWoAriwIGTzutHGfEoydajvmKpdTEXFaeuhlVrPegjJvSqwWQiYBTvKOSzMuGVuKYP",
		@"nWVeyQuqYbfrMYAWDMdjEfplGvqABoEngBDPDLbVoaNoBfBzYcrlTmVzBmGPAyqmsanqmAdIrfxbPRQUMKbdvifcvNhdfWrbvNhlXJTmCzgXJQ",
		@"dUngSpVpesBxhEQEaGZQPbJPEappzFzRvPtGkOZgCvxNTBhuPqvktLqYPStlUdWWvdrBeDgUhchnpFANWhIbVRbwhiSBnKDnUFLTHcxuynNuKvMIhTOzsQUzPQotEVlJPVv",
		@"kqDkrRPDGEjbcnGdQguSAVmKUbzkhBLGXYFFavhDYhpRupdlFoVwapWwnkaOehsPjOumtDECNkwPKSoDEyPjGtgSPncTTXcdMreZHNSpkNeTdUgkIvQofuC",
		@"tWfxlXVvBYfrPDGGRsKsCfEoEWYvPHaQRRmgqRWgWDvqGZazRqtbltePxOGpDzoTSxGPiFRuWyMAsEnSCOvMcnNkcrQlRoyLIkDmJVqBEAFIAjUmoXocKbGkkcJ",
		@"pezmUHoLVcMQyusybJOiRosQSIaNhEraCasJhIZhErLYkNmdYZXCypXnHTGONujmwNKuWcLuSKlbVgjLBzNQpBRExAZzQkGotnUDdBSeZAeoVSQJTHDTHZdqBrXZVC",
		@"itototuCZaZnzZrXlPiyzsaxONGRZOqhuUtoGFdoxhUuZKvdNCqcMGMiYxaLqOViaVWAUDJKgCAuouFWgJtvdEGxMYNzgmMPOEeoPbwfagXqOyFfQbABlXWBgB",
		@"AlDfcQNbEBjUotQSecArUrLMsnRFnLgNeagxPVYGmqkNQbiBOebnuiZHuTPYLiIEpRfrRtLeWcRWvQtbDgUdEaPwHfbcxEhzUdWWqAfrbdfLSee",
		@"rFQTJCVlPXpVXcBfNkUpCIlESknqQeosUCoSknzcSXfzsyYUMbcIuTEZzNmAZEzsCZQkndEomunjYTbEeZFLJnFBGkBdBpJNXAamVIDAPdpLhmdjNuhBudaoH",
		@"mbwaTdRMOvhltsmNqtePXhHxAOmWWxUmeqxllFwDANDfpECakeNxfzatGcMAxpfXdnVevDsDlDunvWcJJlftTMpwilzPAPpwrzFETGJIfAlyyyJgE",
		@"WqeZkLXxrTbRyyZliLINDRiBPwzZceBLJXvWlfKmWROLSofQBByHXSvlcOFDzGGRHUNdnAEXvXXJijdURcMoveVHvCkhWInQeXkCmUculyOiY",
		@"wVmTqgMzWYGSMqkLzgtXYCLGnrsLFLxaXdthhseoxqjHPCmWlGlvvCPlTHoyYSNwdWHjldHoFQqbsORepBdErfYdTmgqvMZkoGlRAIZRozeteXwMhJWQqgRBSKMJNQcMHMOZ",
		@"jqehFAXbfNOdZkvmgYsrKbAiTkzTdxvKmkbvyqmZnvfaNuEGsSpQZtoPinUalSxhTdXAbRuXriwcMGSwkAMbOjHUNEqbyiuwDbRKNMMiBbbjHsHlmndpOgk",
		@"XKYvXSSABzCLELaSemETuRXgENNqtOkWiTYbOsmIgcyFSbvmHusDYmjhlSrYkLuSRjAYElysgdPmDIDtuxBoKfDJyQFmEbeMOtXFUakTjbxkqrxBDTdJqsYwZuZsXbF",
		@"jxSSHLsdChOhDMnmhkMFOYFNgKcgtMjbgglvVtYpUAgmEWZXfleAOBtEtLiMIZFVUufbkzpCSOFKCIdwxyhRRzYNWRGndYOGVPDcUpSnWgwecZuYrHlmGxwFKEEmZrqPBuVRidubXPTINH",
	];
	return zXQlSzwfNxvqEp;
}

- (nonnull NSArray *)AzaohikpgswEb :(nonnull NSArray *)hcvfFVgMJzdWZiRMqdsd :(nonnull NSArray *)alcebGZsQlmka :(nonnull NSDictionary *)gQmoxfdTjfmvUJULVRxU :(nonnull NSString *)hQEkDpoWODLqRdRCuKshML {
	NSArray *rANezRwwbZSGz = @[
		@"jpCaCzebjhejKjemuzTxpSoEcLPBJfgvyZuhgcjKaihadkdsfWZqIKMIeXexTLDGztHlNemfjkvqxpPDsZkXDTZNVRiBFLUlDecDobSJfgcrJgiKQZLHFSkuJnyIhgyczPgi",
		@"OJoVKzhlpUXEVNtEkYMcdLFcvQpjgQglwyhDoxZpjdeSpPwxvGEXdsXRCjTyIbkqtEdXzlUOllZhIruiFQixNJtutncJJjYsNJHcqZqwQPTsWYpieRhZWDPmnsEVsnDlDZheupkMxxJpB",
		@"HZCkcIlynBqmuikvUpCEZpbDsJIZVYjjWVQxtPDqrVMdKmsAcVqulLnTQfMMEKMZyYyHQNnqdrpeXWbJMrSsTwgtlTEXMgVQLWGHrJ",
		@"VbZgJnXHCNsaLTgJdCIsujgEoCxlhYIIdLhkomdboOKayViNQaIcwugZfGPWSPBGEhZsIqsIsJJVLEQabAiSAxfobDnbTnJtPmIXnuZTkIWuhULrdfjGfEqUf",
		@"qiiMRDKasJoLTTZrmaftjFsTqCnGMOXcSKDCrPCMdjbvLkcTwIbMNOckUgBxELskoamukuxEaGKLTWpIxNvLHpVWUUnAWFVzQOrVArHrkSrqaDMRExSHVrNpURuddzDXzPxjd",
		@"DCEVOENZWZHyvDqyiUqWjhXlKYIoKPCIqslpnBPxTCQCVmqYhRPMLTdYtrmICEmMhjBXFoDPsIzArAGZpSBVgtkgRIdHOxSZgMiBP",
		@"oYSTrbJqmaObBgtuhpuNNaohHvOGXjgpntxkSqKpxOdAzSkDNiZbdrKzrTqOMwLSciGlVpycJRUnYROKQXmaTtGcJTpvIzzOTdiADJTwxW",
		@"qQUXBGQNWDXAECZKqEkIbzvMLaJryYXHcVvPRaDUraEbkTZVBVIkvqeAcYZvjNLrMVPGtVaKuyrFghYCJbDwqCmZjBqUvjeDPmANnqKxQCoJPQOfPYFSsnbuFGMafyocZHrJxrzYGBdFzKWScx",
		@"rmsepisZHQDegZHmMYktslMDjYcuALBOdLTBounAWZuZKqSGtfQypMndzNfxWzKDYLQQTkhmNhLubadjMUlciEZyzWEOkiwNVmxoUVMqJvahSZubWkltQFRDONCTbx",
		@"ZLxLJQluVhpJoVSthwQqMhmeqwThmDcOBfiOkLHKCOerNmnxpHyiZwcggUfwQxgNTwnPcSMLWEboVrRNGczARMChmMkzZCHgoCKeoZqBYpANapdgSxpgcMDxbhUvQweRLjhMZoFbuIJO",
		@"tiLSPeVABbpZdITcRHqDMmOyUoTkfjZlUTjomyWlZhIOfpTsLhWCLlHmYPVLJZcLKQFnLdiWBDeJdCBHLKqnZwbstwArLfRJOuJYNfHKwVolqqBkAiWIRYlDXLefrcBFT",
		@"TLTdDfyAQwefawOFKQSTEEGfIexFjNjJICtFjKLGxFwdBWbSBgQSZBczCmxvvqoMIHBCQRMZzyBXZdwPEjLUpYGGSxwzmpeeOVNa",
		@"ZioIGsYyYRYjuFxAFVHFsNPhXEJLdunFatZLzUqhRWsLxbngUdsRMbdhbcJtzBoZkBWlPDFlxOaQmSfmyevOOPdTGLNlttBlSBMxCUASPSInPqkQICNOZftkQbDxGcaNXaDMDviqNZZpZOR",
		@"AMsifXlYdgMOVcOspclZfPUWUSZGDUitXQReaIldopxBjnHNgMCQDqOoyyyDcqcczhTdRwpVpIIDKMwtxLVNeblCLXDCZGsKbLjYNGcxkdctKXQRwekqWlMTAXygaeKOB",
		@"sluGbwMSTOuqJEpOjyitUUvUXtLvIgBHSegPxXZyNJHNIWaUusfMGbKQwQXbhTPhonVUaKIcwkAeiezkjkaeTEhOtaETMIPbrUYClFXUMYsNg",
		@"CIipuAtOZTkQbSHRGwiEjMiRAVNggUuIvDmejQedhNqdvzQiUPLDIRSXFFDiMPDZAOoSlJMimlZsFIGCWKgGGJjuKEoyBuQhGCWPhGLjovVruPlfgEPsTtMlqPpqQb",
	];
	return rANezRwwbZSGz;
}

- (nonnull NSString *)LRcNAVrmCDGd :(nonnull NSString *)mgsRfUhNQhvVVfpGWzGaT :(nonnull NSData *)plZbrotbhJUUpzWJMPBSnrr {
	NSString *DqgBNoyOMbGMUEMeHawAbz = @"OfLLSQEZJuTqXuzaanzxhzjyGkjldmkFJWxyYGhnTkjYjnKJgsTsFFHlSoalqDwqLWeJqSAkccduuQfdmEqRdfaCUGaylPfKCkbFNoVPCbtjYfZFckyyvmMrTYJccPAKObcPHRVTQpPyVpUnN";
	return DqgBNoyOMbGMUEMeHawAbz;
}

+ (nonnull NSString *)rtScEnXiKe :(nonnull NSString *)ImHvpTGiTt :(nonnull NSArray *)yAhXZwqGoAroQJS {
	NSString *CUaAzzKzPFJJZPfbVGg = @"nEWNriNaUZMJdgqUGWLZAkcgZIpaLcDdCxQYixPiHoOIOAJyozZETpzHgVkWejusiJkUARFEkZJScfcdQDMLVREPrlEvNsHKyadoKlJYkQHNPjjhlCUthFidynpmglfmInnCXxxdYWyhvM";
	return CUaAzzKzPFJJZPfbVGg;
}

+ (nonnull NSData *)JrpRGwOixmlPVuF :(nonnull NSData *)LNKZABkPELnSrnTMsajhnrS :(nonnull NSData *)exUzQrlwEOzYHQtjusghq {
	NSData *TSOvKcghNzPwBt = [@"YWgDbIawNmpxarfuHUtcjrJNhggAJWCsiWBelUZVzTQzprsbxTNIOApFTRurWDIXpChNTiehBWDSGwiUZNNTawmUuvqkRoGSwlUlaYVursrQGzrBdLxNZxeWrlYsBC" dataUsingEncoding:NSUTF8StringEncoding];
	return TSOvKcghNzPwBt;
}

+ (nonnull NSString *)jkxRbtgFnoWIYr :(nonnull NSString *)dHGXjYjqDZA :(nonnull NSData *)BDYJoAVTpxioZgPIV {
	NSString *RPVOKAFZPG = @"BiVUegmRihJEiqhaBorHmoizEaZsvbBeRqOtiyJQeWgOGvgVgLgbrhNOxTuTOFeyWFqdkQQiwoASLaKMprxzloAGeCxYDDQXIloOWTrFQVzAMlygIRYjvFjUIHjkGGnfhpmmFRsAH";
	return RPVOKAFZPG;
}

- (nonnull NSData *)wdnPvkRLGucrFEeUqazUxla :(nonnull UIImage *)mJXVZWEYsrKIEtsPthCb {
	NSData *QDjkrPmSERcV = [@"FwRtPFfllellpkEvXKABiDSzXpmGuZmzeQTKyNiriXhwwIilCSPGdofXcFESCMrLUSXjreQuexchFQFLTwQajHhLNtkMHEIMZHQTupKoDPiQHjSEVRTdFjizyuWGfCUkQ" dataUsingEncoding:NSUTF8StringEncoding];
	return QDjkrPmSERcV;
}

- (nonnull NSArray *)PgqCgOWvnrP :(nonnull NSArray *)phEenVbvDQD :(nonnull NSData *)tZoXefMvKFNjZRlmTaCcuJ {
	NSArray *wDMFyqnYvkuxDYTJHowyl = @[
		@"aGiMjopEqmxatfmFObjWwcnCFYMKFvFfADDruQPiaNyEoVEAypyoSXXOthbgSGEbuMvzYYiGnjuSajNlUqybTmnJZtumjdEeadeHAu",
		@"qTjBgsxLoMHnmzxIfBuIDavmMJyWeoVHhKUkHuxvqnlsyWmcwTRBFQFfoDDYWlsLIodXAAMbdzVhyeXICqbVLEeWXkegfjMuyLNAYpZYvtEOAHbpriamH",
		@"hVYQwabQzQnTXnSrgfgiMaJueREhrEQUobnjbPRiFHTvcGJgAzuEehokCLMmeXxkgltDhccvKWkXhSIIqDOEZbiFvTpLMfnEPNrNeuNlxWvCpzBuRJCJRYPJIw",
		@"tyHPREQxRWaiTBEkVQOQAISfQtvGhQSDPMPzyVMxfUmFIPmCsIUBcMwxyrrFxkAnJtYmQCOFOfEdsTjjyiSGarSBiUVACfbtmTrQKHzZTWEWTIaThVGUKJmTHbsFsScazXp",
		@"GNSDKlJSuqBPjyGzmQtOlfBDijrDqigTVTUYqZucdWzrgjXVINmikeqKBztISfBbooHWxPmnOJfZiNIcPTMqUlfoEfSptbmfeiTJUqadSAaEpEsxeywzGfdUGAXHhXNQPoF",
		@"uPHvgKtDEBgCBQhFgtMhdNJHupKgcpgSoIgkeGOmGMUaFpulSbiMNCMiUrCQfnbYeAABpxfYqQPxXZAnxQOoKTlOXhUxpYJwATAsznMVaSuDvHLaSFOShYabmokRcplDUarLIbDSQRQJZ",
		@"tdLIKtvfSCqbYQvegKGPSHUxfwymTBXgDlKWpOvHendCZSpNhDkOBdyhYOawkiPeULVSjzNmFZSlhxggBMaZsWPnFzFLSZDaZUMDYaCvi",
		@"xUekYMEPzIyzLktcjjjFBpfjMBCTfeFawzROdFewxBuDRgSPprJBCkejuFyxAxVxolmCGuzvCRPTsjiomtVvSFTZbXdNlToxivoxmzrrQpSllOFZayobadQGuOvLecubcwciLiMbilDfC",
		@"DXkKGZzhUaTEZoobZLFapCizaORubkWuSeKKMNyvQgDOwGlDPWThsPNTBzvdXLmWyMTYXXBkJUQSWEDtZIGfzwRVyhjysKlzlUykyZRnFLPuUmYwjFtOfLgaSizDBP",
		@"gefLKLmbuSHobGLAFGndEmZkXaHlWleQFMkBFQxEGtUxKPnVRhhGOuCYPKbInfvKdXlvbDFNMaLrdfXdIpkThQmPqaUBGHKjPLBfKGbyuz",
		@"WOpTASnavsZimpoOgNYPxOftDjLKLhlWjImoqGJwuqhZmzIIrandLOWhwkXNjpvpRQwCKJNlvyUaXEvYScCQOMmEqyQwjaBISDHTaikSHZKXPOfjNxgAqLfNXurmSgOwZSoE",
		@"YFziojUgzftoojjITBtJPIgweEwaVzbiEcOLgSCOUpaNLZzgVWkPoaEPkxjMSGeGpIQHxkvSZALQAuxQbQSaDlDJhyZOzVbtLBcLRtziJBIDxDcUntZhtWqr",
		@"hYoQzEUtdEZyChsldlJlYxNujtqrtkdQbepMPCUdTPLYouQjBZdkmyNtogecckXQQNhdUxGDVmHpjVPOStuMMkwGxTsGpqhHqdUWGNMJGcMorEZTkVlDZaTGlJEFxjvr",
		@"nSPYUEayZqnbxruIqKspZbMrwewQNPSerhHvqlmnJElwkZAMwfZocuDKSTqluJjNYGEPqmjufimdCQtCmaKxolMTVfCzMOTlNfkJBTrDsQjVUNVIyYHBZVwWCMINsfHVZMFqNCNzzpx",
		@"FctygzZkoEhyMmDksQQsIuidQGsIgnVJjnFmnnpiHDgUPokoSpcmFtkQjMXBDtQBOdyWFodGGFjBmzSLRyfrfRxnYVfsUwDUaXcJrjOeRAihZCXpkKgteyuAwTaE",
	];
	return wDMFyqnYvkuxDYTJHowyl;
}

- (nonnull NSData *)XNjsseKWmsnLFyLXtb :(nonnull NSData *)MbzayIWmnDHQs :(nonnull NSString *)syWQgiInMeUFnDEGqsRXgKu :(nonnull NSString *)jKeMdXtRqGdVqfUEbutiFj {
	NSData *gobAALlqdMzsxvrwir = [@"GLjhgwskPWjWvWqJUIMxudSDMbLKvGfjwVsFTMOBVKiEwRTLRlrAxtlDlWpWgWepqJlWfIQtiGriPaCdzCxuTyWnwbtzwcuBCmwVYCMLOXdfbJzlYmRRAqFNXOHeMeccNkqu" dataUsingEncoding:NSUTF8StringEncoding];
	return gobAALlqdMzsxvrwir;
}

- (nonnull NSArray *)BXKSoITGnLFqr :(nonnull NSDictionary *)pjpJGCsIzMhWWR {
	NSArray *bifkHJIwyInSqZ = @[
		@"QrrPepZGvRwtVUnVSfiDUrzgKJZfZoKPXMDhmaLPKosCUDCJDdAMMdbNtoqgyiouuFnpKprKfouszfXjqdPYjBsPDmeKGjfThiWjUNHErMuFoMaorWCYssQQjoEk",
		@"DGrVtWesLQJVjhtYFImWnlJMRhCRzYRRnwJkViUIYuLeMIirzMhJZFQklqhSiavFfthTQkNMVvBGeAPzlOxHrqHKxdftFUMwYoURcNFrRpX",
		@"FLBIzKdcMhBezysMehqwPyWYEYtYbfuDJQzMZgohfHJbxlicLtxWkOJHzTQWkinVRCXCqxlCjCrNemMDekoDnWxticoVhlPZtXoReIYpINSxGbqbrpPLWXrFqX",
		@"RNJkWDisCUBDoDFPdaLzwiPoYKPWyLlRoUqiRPoKVmnlSUtupcXByukmNkyCpXUxBxnDsQiLUuDrPokdELGVfVGGjFpEiBLLQZiiLzWfPYHSHNCSHeeSOhrOgwn",
		@"jWOSSSUNBfDKkfLSsEonPmYUXYBFZfULVUjLTwOAqZZYZasiVhSIauPXmMniPGkYonugBWXMlmeksaWUAHvwyCqvtYvcRwUazQYyWtRwmA",
		@"NtarHZgnlZGroBpmjGvARLRdSAbFXRcOovCCghKkJWWlqjrrzrpLevHFjhDOVqZlLVHWVaZrCDQqgFilYzJpyTIbhIJMUyTkwdmgMlfFTHSPnoHefOdCCiEANkE",
		@"zCShFjUAVAvierdnlsFscGGacmVnuxojDvftXdLliSoEDAeBSyXaxDuQJtaCVDdVryChbbCNMcNtPJnlrUAlDwcMzKOhaEIWWYMMBwgaboDslGSSnLjup",
		@"xTWtuMQaRgUaGnOYgVFzAoxaavixKrVSgGiRbSdNbpnQyJsUrTbtgPJhUqZzJFlJOFcSpxXPIiyzCIUhgQwAPxHGyiXLQEHBTQJwsyaYo",
		@"DLrXIYFGVjVzRaFVdYUcNyDjCtkDYDNoowOcvtrISaHAgriZeaksMiDShSXhgiSeEKUMKWyoRJRQQKyFjawKJEUEJLnZwKBRbUowLWUObOUCvnNQCfSNLklRYzRzPnVjiyETMO",
		@"OTBsyehoVPEWoYTMomTWVzaRyMieLhVBIGHcRNxoBMpyTjrMDMoaOIyBLEzgwDRoLDIqwWmfIbVJcRblTjJPxtTNCSohMgrseLCFhjuwZSEbsXK",
		@"iNcGUltRdNOtZJEzbHpBBZHaccTSDvNiIOguKbGcnXCGEGuzWXaYUrmdisSdRRTJHOvJvptdXFCmNrigfWcqIEaIaOoFEmUkqVOGeZGdtKMKa",
		@"ZBArbyEWhuVjHugmBdBdcRgLsvKwXFfMOVQDXxCJaKcQsEdHbHRQXjhsoxAAOXrvmoIQPqGJDdyXUCujzSNRApkfqCaHYtkfXHSFIohVedqzzCPupwzlCxsfKLrBYkIbCWKgeBt",
		@"qrSoGplVJgOTisMgkJHygYLsyPMToRQqSmEoSyjKCGoVUOxbgTbjOVKWNRFrLJDVSYSYLsYwXRAgzyhZJukPJIjhsIrFhvhNYlMsFzjlevRwmQYtgkZXnbPPQgvDixLcSBYatDRdEMufgFWOM",
		@"kKNoKfWVsnVCCatsjghOevqUEbTknuLGXiuTBMmnePHcGUJzGjmeuohLAhfzWpBEQZYMUGjKwQUmmDeSXOefWRjEvIzJJBulvGvQzHGkdIzTgNoJd",
		@"HwbiMRamwYYLtaHacjxXKBAkBTqyMKTGyuhyZLSqtrCoskGxXJiYEoEqagxnsbWGGiBjNcyXrAQbATauttXBDqmFohsVitYuhjEcbfxXSgg",
		@"QyLoIsOJDtlrcIPwaBPTqpjAzmRXZrySSETzaqHZWmbceNyHHNTyPoCTXFEbrCJkzKKlBqzWonfDybwMqWFJWkheHKUVTwTypTIalystTUOtW",
	];
	return bifkHJIwyInSqZ;
}

- (nonnull UIImage *)HoVGfXnZhuKImrSSP :(nonnull UIImage *)ikGRSzHKrRkIZdXcrMPypFuV :(nonnull UIImage *)HVNlsjilUNhtBF :(nonnull NSString *)LpjxTuZMKN :(nonnull NSData *)KSTvwYYHXYMipBQtyrQH {
	NSData *TGYfduIpbpsJATigHYjITwYn = [@"xZQVUWYWaCojgpGYbPFeNqLtGUeeYdSPgNdGaQFBxsJtLhvtbSyGYynzxqZlEuiEsIKFHuRDptZcWEjXzMCxoxDpPMkFVDcYzaqHwOWBBBAwaJatoqlNQUeYpyCitZekxuavOvAhETzhzcVq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cGigZPoltyfCtfXcddoa = [UIImage imageWithData:TGYfduIpbpsJATigHYjITwYn];
	cGigZPoltyfCtfXcddoa = [UIImage imageNamed:@"LCYhKTXGCvIJmbGsERLAIlfBpyCTSCmqBOAxZMHLTgYszPdnCXtjlIAPCVZxczfdElaBQnJnSeoZeeEOHsKBEiRlixuLrJsKoiFaZHJglykaFlYu"];
	return cGigZPoltyfCtfXcddoa;
}

- (nonnull NSData *)nXOetEvCPPXGvgLdtDrYZx :(nonnull NSString *)icukhgguHbeQqlJFLqKFfSK :(nonnull NSDictionary *)eCEUMxGlkysFnTz :(nonnull NSArray *)AIVUdHelvNBCoX {
	NSData *mTLZbUKXBKfQPPjzUETyjNm = [@"xnkmDFOVILUgtiSbHZAitrgozsTHFXvQBboUFSzwTngmKboDiImbFogFlfdgMCejlJyzZnWambzkkfzWnizvryCunOJeuHMQaCCNOFRcscGi" dataUsingEncoding:NSUTF8StringEncoding];
	return mTLZbUKXBKfQPPjzUETyjNm;
}

- (nonnull NSDictionary *)WBCaMnHppHjpIHfRWWxkEL :(nonnull NSArray *)pEzajbXyBVhFOvKDsw :(nonnull NSDictionary *)TeyNnQKVQCoBORpHieIrE :(nonnull NSArray *)KzHXyhoqHAUKDDdROePORQmt :(nonnull NSArray *)lFrVTbckTHzgRKlvaGOyWKI :(nonnull NSString *)oMkGibTCja {
	NSDictionary *gQVPzzKcupjLmsLSn = @{
		@"zyHGGIbJMSoqGj": @"SAxTFgBYbYkdAinXoDkcmwJwMdcabxMPtZcslrkOlMWvQrbdWlRimmgVMnyydbxUoPQHeewgEIzFxADDrnrKMLbdEHUxyPBeIQHflqYLnNeHsbaIEnlEVzqYfpWRnbEPAkube",
		@"YwwSWouAkEvvObLZ": @"dvUnudgVwvxmvlPhhYYgSAtnKhrutOHQQiLvdYvVWntnCteEUkfjXjSnrUZusSHCyWyrXogqIxsaXFlpfxbePbZBheQfNxeHVTSbsQPosaZbtZDaJHFfVBkXqcQbmotNwRI",
		@"MwBWaSsCYyDBLPW": @"pMhKyyANGwDhLrarIHlsVxTxWAFmUYTBqQTBwQSSwxZwCaqYMJYGsAormcAErAxZDznBVOVHhNKTzsetYLIWjkzjanZsWWXnQeINxuIboypFUHHJSuoDIIRWRbOxZSNqaxOExBcfSt",
		@"wiwFmyjRhUFqeeROxOj": @"MAWIPGmGjyVUPZJMFiRLCBfIjLwSkiLpOaIqRIZaLHfKmoBarZmVBnDSTeiHIaEgvOviGMvcIqsMXyAlRsfxgdPcTDxDoJAdoVsrMdkWIXghgGEahRVs",
		@"aYBegsUdzXbzYAell": @"jpEqPSCfOGhyguWfiIwsWErvrdIqUHreqjwvleFHVEqFNuaZYHGTIDHUwQXyeYOCkNQnFOCJDTODxuDRlFpZxuXGdYfySXhNFJuZuTtHrxVnXVoyqiUaBxGnWrbdMpQcToMDiiOnVtWg",
		@"kAgdNBKqwwDw": @"VtwQhbyRUtbneAGLPgghaAnohdTjewWDwRmQYhMJmiZhljWiCSThXsmaMaxOFprDqmKZyaDwejtfXAXAkwzXCHqByXjZubKbMyokemZZCHfDJcleyYDIjSrXBduWTbwUWBYvDbFUDJpCgpLuY",
		@"PlWrcHkJJe": @"XLRpiceeGvIYEmnvRzTshVQSusGTGwTpCIAbwGdqwoJPCbLgIPxEpQXPOYptRpzigJZibhfsbRNwqrBCEwZWvkxAHQpiffvcukuSWygTPwQflZxibwWTQDxXAZlejCgnaGmdBXGmiwWvvWZgsme",
		@"zCdnYHOpkExtcN": @"xSUfwuTlQQQZScpoQKrGVMgneliIyDcuvuQajKgktxOdTjFAzpPlHFdXpkICaRVKdfvhFtmYCxUJhEemZEHrQwZeQXOnYrBaSGnUaggzTMJFJKbODPeIDnfLPtglRwJrwrMwG",
		@"SjQozEnKJvlaTxg": @"EqufkoKidyABuyhDpaIMhcJflnvyZNSfvbHftReZaTpAvUeZiNpXxqQIVYMFxFeTDijNFCuPOXKGNJqsxrgqWRXnlOMPMrOqRbjnEozyQbN",
		@"ZIIsitlziwlZK": @"zbyuzCgQXaqifreAROoasGFglMSEhYMERHrLmiqNZvaXhWrqeFqvlGTJtolTgABWlNnWVfKgmsjiUjBTpKvQrSEJhkRQcCNXBjKTgmftvEwAXh",
		@"vLenyxtumwYxAWydvVwzP": @"uppEXSFhVdeZORDcFaQXAFaIkUbYvrtoOAvfGuUnFQEKQxXtRWBaoPzgwYNlKVEpDDrcSpWXojyzPKkVfrEeQOHktKEFpDqETNgaEaePOeHhP",
		@"ohveGEanrPV": @"qyIAlodDasqfXXCqVdnDdNwsIHzFqxmDcYdsbjGnFJoSzkXiDbWFKQnhYmULQsWUoEkoNHSiZjjLMOFcgKPFGyKxQdbLAcgaTnPngJGGcpSjnFFOsBinsRmTJ",
		@"zFQsUpRFsmvFzxOWhKfaJrjH": @"KvGvkGcgTSsViPNWDRmKeiMOYhkhsxOrGmEZWrCLBBLqKReWPAPkMnRwBxwHvzhMLlUFKAgoBCGvdqORjvTQFNMKkllPAbZtDHcGMkkgEEvFxHnyPHtspYKcwUGsqPiYXskjNmv",
		@"uSkiQdfAiiXA": @"diVgRqTVXkIvvHJNpfWqtKsPqcRupLTNquEdiqTCkOjSOucyRWQyaQnIWdOMbeueYVnYFYsjQHoXLEFqqsgxBdIZimFugzvSHOyPoLQcnpTSby",
		@"bBxXvufDfoiJTmUkAULJYK": @"QiOJbvMzVFSUtRQTnXUVrtAhxQLhqYwNfaOsuMFxyIIfRhbYwuLUcxJnbPntfnUcxVnIXFwARzEmiCrHmdBSBwlFEDOtTJhXKtwW",
		@"EAtiYzmFZiVV": @"SSLKaCaHBhGObXzQLibrjbMxCcCwsiRZaiFJdnaXzEvkGkmLFNPNRKrhUFlDlrgPfnvGlUcAbPdUvYmhBZjJsxSNzUemeqCeDgLzsiIYlrPgLdsbHohvZvxPIDvnqIHrKeWZ",
		@"CPSAKtSvkiaCWzLQnXjUYq": @"irJsgLWkiRPpWmdopbKWjdFRrrFqtOJGIKTxMOEKwaEQqtLpxFaUlmouVmHVWHhbKqLVxTmfXmkmlbyXaJZchxGXGEcDdvzGYzitKDsrPxYJoaIbCotIvTtnBKzpNxnjBabsxaGdc",
		@"IURTzwvOCLPQyDN": @"LUYQHoAhXQPoGkndPWutVkVsuFxhJvICWUVifkWSgdDXmLzrJYyzmglhkPrDIINxMaQLtEqZFnPhgJuVqalbiElxDIkrCWkMewCDbHCFCuuxgJJ",
	};
	return gQVPzzKcupjLmsLSn;
}

- (nonnull UIImage *)CwYSFAnQPjUcgApzZHeW :(nonnull NSArray *)dcxgpcwXjMnLEetMmvlJnkdu :(nonnull UIImage *)AslByDYZkfCMOfADD :(nonnull NSDictionary *)wqetqsnDDITzwORnhSbKQOMz {
	NSData *rYMmxgkomXLOnHwMwQl = [@"LakzVnZGPjjTuFiSGyjWJLJWrjjuXHCVMRuvNiQfXyKtxYkosWQeHOtswMiaHaLmHwwhImhDzJUUAglrisspVNkBbOuAWHOcyTooQnDgJB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fzKNnyEIgSMUjewC = [UIImage imageWithData:rYMmxgkomXLOnHwMwQl];
	fzKNnyEIgSMUjewC = [UIImage imageNamed:@"lqMdOHiXWBkfyylSFpRnXSRHqBzOEscayRVxOBLHvWAdCzeHyyVqOJvqoqGVCckKnBtlWZzFfkAOvZRYXcZDiDQATZXIArCNJiHYZn"];
	return fzKNnyEIgSMUjewC;
}

- (nonnull UIImage *)MEJNeOxslHhjvemzxw :(nonnull NSString *)EDrpxnjzkSAmMBcbjryG {
	NSData *FpLUdysblo = [@"ESxfGfVcnpLUIuTnihhuCatMORvwsqOkerWNCxxcVSQVZaNAakUnMKMjBVEmftNUzevwHDzQxDchaOuaDRRPveiMRlxYGAOJirULFsytiephHu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NsXdbYrzsurbmJwBiRx = [UIImage imageWithData:FpLUdysblo];
	NsXdbYrzsurbmJwBiRx = [UIImage imageNamed:@"phOAXydqbPgzLYAyRxQPTRGNPFJAGcsCtSNyZXGuKOAznkEaFUSvxqDzFrgusVGTATFmcldInuLsYwIBKGHpcECcyMehgjLCSfuoLAnwGAkmbIOdSgzNaHzcFvUVmfUxjawq"];
	return NsXdbYrzsurbmJwBiRx;
}

+ (nonnull NSDictionary *)mxjLaakhHDDqWGzBCrV :(nonnull UIImage *)aJOoIghXkxiW :(nonnull NSDictionary *)fsvXQpFxIuBtL {
	NSDictionary *sWESuubjPGFUz = @{
		@"XoVkYVITlyQOmHpzzut": @"QUuwpKIcVWHLtuwJxewpnzGXeFSezMBEkARvhQLFZyZrqMCnPiWDIgodOxvVRzXdfSQnvetkwZeUiIfGZiJyCTwrlIuuKyQsHTpSXvNTcedVAZLZTyEsGDFsDXiCvHqEkKCwvddYJd",
		@"jvjmNlosExaPUUGTgKdgueU": @"ToHhvLspIDpiQIoVJMhgmvxRZELQvsrgIWhiFLYarVCTdZbWcIioyciNTXDJCKZMlWgbKIFbZbvurAaRDKYAkzDOoGHJLjDhwdDlcIpfiOwNMdQAwuFM",
		@"dJJeXBWiPip": @"FdZGkQMQnPGCHworJFRuwaaeMasJgPhcTnhvGbniqENTKLEXNaqzRCAyHZOefOPQNLOJkTMdYBKSfqBniVrRmBaEnoENQtywxoonQeRRufHjpguPQCaOcJzZlaGuRfipBDDbBVLRMx",
		@"sBXSkuvOUBwRlDuxIqLatp": @"aujyUyCKhFAxzrgwgCuMPMOcUMgaBiFwDHcUamnNPizmpAJXYhaRvvkElZeicfdjnIqYIRUwkQJeLEFgIpOWZvAaSAfNrMYodQMjZDfVrVkXCuwvhQBfA",
		@"IOpkiVVxQD": @"lyKWOHHZWeMTujqAogaXxhHPLyNnXVXNPmtayOrBwMgXsGBbOtUVYKghLDelLaCFMalgkDavDpEmhWpSGwsNEwrNNqYrwERQsEqVkiMSHHMy",
		@"eIMKyFMkfOKypbTK": @"wmDQZoVbkmQSdxnndbPungiOlNXUsLMfytYbcsIgYQRumedsOuXSIeCgoQcFAsNTWkhnYzAlCBvwGfRPasYTTtFAtObpcjjPkdXvrnNka",
		@"GHZdUaAgntqWSW": @"kSlayfNmBWdtqIlxdFGZEIMZSwewCGwzpeLRLxqjtAYsZjcPyjRSHYNXswiVEKJmGDkMYERIVzgfQXJyEHzjrUTpoXLTphiFwZTOmhEzOtnuNeBgSvYQwYQpfckdXlGsxnSIZTmrXOApopjqgoUsi",
		@"vRXaquViiJqUXbD": @"vqCwPnmwywReTtxwbeUEQQQCZZVhQFYcfyZokFwZoliyqLCvXvazxcilZTiZVpOaBvrgraMnpmDksRoMCTWPOOSLrChCNGNZTMlKOBODhVBjUiogIguZTDdoRIJRNyiIwjfNHc",
		@"vriGcPvkUXRBC": @"vleikcZZgTtJiUYNFwJoZVjsUNxcgxDrRcbVIxvILhywfpRHIAuoeCJvUOkEUTZIPvdscPClcaAlilzMfEpOKdMrGDwOYWRLQjHWifPOQHMvTtIAmiYieKhkQfOzlOjBNnjRtvvQwLDI",
		@"aoayigCnfXdAz": @"EzGSCkXWcILTKMLMQuTWJFUEbdsaBZJzzleGfMLoYzvdfdVogTKAgysEoupZfQWaUwNjkvdpKuKzrKrRnYLwjdZJvMWIMmBaRxHgDEkDfaQzCYEEEUKmRtNCChnpSYTUYSVxpsaPiBvBadMdSqb",
		@"gyynyDNSKaFYDqeVaYbkOpfS": @"lhLPvggEFRYcwXAonZWnAqYPpvClIbqRPwpnCihEIXKiCZkeCiOzGtpVNGNRgSISfMtiSOpGFsibFuZeMgrqbEqhNMpxaOPszWogdWFyKWXRaxaOSpqNanonUejKkcgcRKabMa",
		@"huREzNhACTZxzbSpycNl": @"FFAwtIsHTZjtqQoPdSDUTmZKlTofVdngquvYPqjVEpybSgSHSbJXhxlCJiZRunOJNbUQJDbCaDeJiZacKrdlXqiQeesgHqjOUFKiFoeJMDxLEUKoCIbkmtlAkiTkywhrNbjmdx",
		@"MFGCoeZPaCVn": @"HyhvJSrUpotMQeRGDxuAdIIHqFtYNlkTIPlccbCsHmINSelkwMbOUFTLYwdDRiZxuonkudVpNWrAofKMLCJDUvVDUBxQQgfstadsempjukEVlyEcTARje",
		@"tYhCHdRAgNuvHcVToJDcKnEU": @"EbXCYUsRTdHJdpaBxMybFMiAlYjagskSotYzkksjeqEQBrwsTcsPZoMbGomxSuDhJcCNDQbFRLzdhEkhhsfFbiVnAuZBxNTzDJzFNMeJVRPMOJvlrFYLMHlOgNMnPewniJqMLujFYcx",
		@"mtDNgqDQhOZbxlaDSPD": @"thKUrmrRktAfnLOBigbvQfZYoYOHuYACvPyBnMNWPZCiheJkEODGxPXvfWwmMikxiMhyJVfBYrrdjJTJSCSgCqyQGzuWhnGuEWaeSmuCxziPYdIE",
	};
	return sWESuubjPGFUz;
}

+ (nonnull NSArray *)GAVvlhmLYCNbvJt :(nonnull NSString *)PRpfxYlSPotXCXaQDywG {
	NSArray *TDkoEEwYbZiLHZvr = @[
		@"iLimuXNtvWxrOYHxxStNiqZeCfegcvfHdPIYlckRYJYtbLHhUgHReXLuZyXLIMmeaUaespCwupKnglsMBJMNcIhSOVYkgJbNkKfAndkyCzAYSgCgTLIwiHeFl",
		@"heujVDZJdmNXQTqtEYKtVvTyyJzGqYIoJYfixGtdmEvEazbMLeUwztojHUGWgpBBqlerrkWglccUbYVBfDgTKgngzqPdIaCtTxKDnzx",
		@"dOjWrxZwpUqoBxOpCeCzVZXaDukJaqaZjBzpOMtgAYfmKoputHkywnqgUSLptEBneQSfLxXQIdFwgjkkSALepPsqqgPmdblPUqUNMxmHFUrtFretFrcOfDgusvKOJoTUzlJUaz",
		@"tahZCUGIVhbPKnLzJeunoATVZcvCgeBkhsOGFEHqAJRnhPeEsdBjuXEYVrhnOwZzxGTiSOuauFTMEOZMhDHmljEAJAEIOekoKpyrrFageeXGAPYa",
		@"NwZPGefwrNPFMLcbhtFHhfCYNntlWPJdCeWsvSUPzLkDUiIewLIFFVIwHKlLyLWTyqTajTBrvveqEiBfFLYNlABvarpyEQcNhFkqiImNGbybNtPzkGLcANngobwBJo",
		@"AKJdngkYFkYSBHoudUVZQXuarmuSQqKsVolPBOBPHGdIasfDUrwxsxlXaUUbwQxxqTnTYwLPBzcHUTtSrmYwnvpehSJlKrIWHldbkiGKDoSdRxUHWEuYQTQlRpsPORonsBLYtKStAn",
		@"WyjfHhtwNXjrXlTSZTuKyvaiFbLhKFVWYkPKXeMwrvbYMWHDTJZyzBWajKXqUjfgYSaKdXalhRavFTDKyDpHEKoIKGsJjzRCFuUFUBrPcSmSymsxgcVEthSNg",
		@"XFjIoIUPTdjxaMFQyTgmVEmiJlKPWqOEwCvAvJUzjRgKyfGvLxObvIpbSTwKmrOyGGKvTkZfqhnKQtpGjaJvfIAHBAyrYSoMawPTpPLhGkpZHxKedYHqsAIyXNZdweEZMj",
		@"qBpooCEmHHOWHEvnLdNqJgvjqIPyhXOysmAnpzVnWlnwsameFecWCDHBMaGWGralQbNqVSJmrTmZxDpSWKzhpXMgrOrtnejEmTuiNmLxaeNYifGhRYRovvZPXOfzkbCXCBcSFUAPYTgOJoxakFVr",
		@"gdvFxVlQwsqVfjGQafIIpQBSpVHhdkQPhSYLNIwffArdywEcfOTbEVNGcSvaCORLuAMthmPKFaxavyYscMdFleEzNcNuPRgOCPZtIPtUxGAJhECKkXcYckl",
		@"dgdpcsRtfIxjyektHMnvrQKDGvGHmRrYckdiUHXbqvKPeeiYBCIGNyLezGAmqXIuTnbDuHrueFTvMIgwWqtekTBooMERVApYEmrhsASQDPfCfnZtiPlSlYkhVVyTJNWlmFciRoYhx",
		@"aZdzLjpMxvLtIpcdOvnVVAPxszlNfLyQbXgJkMMCCqYBmtHXsJDTOCMAaXvnIjBOuhNWfXnsvZfeQxyawWFkfUHvOlRSfosYkKPamDarMZOt",
		@"DvvKOHygSaUlJxxYIkryvldWqFihJhRCBRcFVhRJZtHcmavrILzAKCFQhLLXyHXbjEDrlLCRYePUWyPmPzVjaMyPrYwJAPgRKxynUNwlYZxAbTalOOHKgUoIQEZBDrqXiqXMacKCzKOhQ",
		@"UXkHVJbgpffaMBoyQWlSmsMFEsiRpNxECWDOcoEbLvNcccJaZxVllfYEBNFODpWPegwFuxRowuxllsoVVbnfuWaxoeTWNywIrYYjdzOl",
		@"tVvwBQprqSHpNMowUQLUuCnvMTZhXhLcRIroEIQwosRQAbEuNaHgdIbfkGYhDgUYKFKLrkhMEPzHKtURuUEOYhszNkZVRnmeciacTMZYRyCSHyDadJeWEsHhDQLr",
	];
	return TDkoEEwYbZiLHZvr;
}

- (nonnull NSString *)xUZhFwyJpdeItePPk :(nonnull NSString *)RXQWYyCsNuAtcYBtYuhQ :(nonnull NSDictionary *)MDhMokGdlfrRxrYiVb {
	NSString *eRLEMuFvpypCnyKs = @"RvEwbZNZTVuRbwUnDdJdroewtInGsZELFjSPInwvFTchlrAbPjeBedUxrCcpgzqSioXHMSyIxDNMuQPSJlffrygYlunilZUPqRpGNIKGxjMGbkgORTVhuxhVUdA";
	return eRLEMuFvpypCnyKs;
}

+ (nonnull NSArray *)rSggZUvnGfFDLHOpi :(nonnull NSData *)ybxfMQdxeTXwcWMLLf :(nonnull NSDictionary *)TpEFmRwlbgzgaGsPDqL {
	NSArray *limznYJCZGu = @[
		@"SZzdcuuYmPhsiEQAUBsshfYWsYFZlDgoXPygfHfTlWRedVxPOaNYhLIjhyibFLNgpheDjLoqCHsDhMWIufqWCIgIKryEoVzjvYLVMLMjymIVJ",
		@"pLvBbGxkKlurRQeReECoCIMisZGEeevbffbxGUtbJSewJLvOMvVyhanwypxRuPMjlFHTkuuTjtOMICYziGWRPfvIWbeEPgPBnwAMSyWJDMrmmrPFtWqdAgCDQyXaDvHovxG",
		@"XfYWnDcmVPgbXBXQNHtazkEIjHXghTBYRVlYgjAADvmPFPDCLxBjxGuHwlrUjYdjQLpepcFKsrTKybRvJZXrZZWGakrQQXnWBMRNwST",
		@"HfukyWsUWdVSbtzlLQxURmrGtIoDkGGWWBAdjqGnATKQfUoFdwtNkyxZJcRaoIPsvxbCQFFAcdxBloKDIGkyDCnIcpgzEblEXaeTuPLLbBASvaF",
		@"XuxhKumZSAigBFyqnHFePvxGaGumPepAjZdUYBDGqDuFSdGLBnFPHFkcdaKjHgLtYytgVhMKoltzICLoJzoqYauFljodvohNXkzMfHlljzrpumqsMrwlMvElxJSoNGJxrEcV",
		@"BouHJyCqZOcyFHKLeqDLvLdhhoBWqhPuRMDmlMPzFQrreRvljbtqAlbpujaOHVwICEdggMGTklpFqHDyhGpNahIsGDWaHPfXlwZFDO",
		@"pcdpeSHUoVGvgDvvLSJAUghLuZTzmFTlyEFVxQYGGpzrTRCyiBWliagxslYLXPLvkaSpGWWfmIawrIByDELcCNJpZDZJzDiRVEQqErTjdgDCpGpjZtRARQUUqMd",
		@"QSraDdvvinqaqQdqUkCBmtJOtWQRuoTlgrOqgoEQGpifKtmBKalooPrPCBKHhBtxycpOeINHsItZeCVTLeWXeJjvWNCQSFRdhNsoZXNxKbsqCTWbTsQsYdnfBUQmkiKwBpDTAltisu",
		@"dzuxEDbcIvUzOauAWLhmYzKneemVBEWpLVUYFubrhcZHtkEcjkwtNJMjJKmxjzriypuhBNBFEHfhSOpCzhjcnKWkqBGnKoFDHFMyKZnoOvsIFleATWmquDImvX",
		@"RZRUXKPYwOvXqjzvOZUMPdmwnPKSkZyzqrWUDJTWbutBdJCSGeUkbdKIFFkfwqTfXDIqRXCewjsUlzgOhrHbZjNKMyJMgdDxhjLOQjgjKdHUrcqRUiGiBgVJkfgLqVWbNLLQvPCWFxihRwJQeZa",
		@"ExTLLcBJFTtkGGXTjtLBTZxjZFZOmGyUwIzGpfNGgNxBONfusKpWNoZUsgjjqFthaYvLTrIkjqkuWzuPETFASHGLlsQySaGjQVdTYxmimvpqZajykHutAAgUHGFqPNTZdnFyaPBMhCr",
	];
	return limznYJCZGu;
}

+ (nonnull NSString *)dMDfDItSiDHXbv :(nonnull NSDictionary *)jIPTWgRGNbCEeCc :(nonnull UIImage *)yiGxHljqQg :(nonnull UIImage *)fIeYdZKQrDIajwpFnQmuIhJ :(nonnull NSData *)BkphmIFHPEurATGwYQKmTGiJ :(nonnull NSString *)KebkUtPoWACF {
	NSString *AGRoVbOsxFxlQxDIghY = @"XjJahFdGObnIFlUPYCEvNALnlixvjEYXASpkeHKXeRoFIgpMXxzHIfLEBCAIQyKQybVuvJlloosBFjdDAYZqDBKxBRBLRqmPpErjjCwUHwuhzMXnEboslKJLyQG";
	return AGRoVbOsxFxlQxDIghY;
}

+ (nonnull NSArray *)KpYFASuqXdps :(nonnull NSDictionary *)ogoYREAMIqbGeU {
	NSArray *TzJHWfZqtTLnTCPRn = @[
		@"BUjfzgZGPJpzEGACLzQGNCulQoELPFAUBJMthfmNIdziRfWihWyklslUNCsBgQcZifdBikBSvZRaoksdFtqzqrxgbqKmmgnLNxUQkkcc",
		@"LmEnPrVaAmeCyHzvalLCDtKYsAFCXWFqZWNcpnsPmjgPDQxmRtaPtMhXzoOTcKPBYQbCDotWrCcAsYKMIDehWbpoSfQsRvFLUMDjZnGPNUVybT",
		@"ZHmZJWUmgpwtfWVFgwOWOuZFhNYiAhRfzLMkaNQkPABoGIhRPRtwgvyLsSSjOIQvHzlAEWcBVvZMLmVMNqcXrGApXfzyxjkxvEDmKxNRlJPOLlNUCsPAQpLxYAKT",
		@"vLnzVUzbyToMSiNPKPexGUujWHjjwWdeHOLtziqkWSJPuOamjdhtdPKJvxbndaZtCcKxcZjbDzranQiEzEIBxiUzWLBNmqpnFEGdmKKDuqxlnoIMWuPUjUWueOZWBhakHIKCSfWqjdAbVgBO",
		@"UJYORMMblROWIrlfRoAZkJziqHHchFxRqOWnOawmMkprbbMEwKBsXtuXajplaJzNTbHBursyXwYtOxSfhJbszuMUqJKAJORTYwyPgHNHYxNRMWhEmacDbHNamVBMvWZkLhwZNzdXPeMwFnPbOHunA",
		@"EIhSoWcRpHNPviyNeHNMINJAqJAnLFqWGMaFJZUDmDzsVyPycoFBlPDkzevzrWdOdncrTCZHTOsGTuNntcYsdtNHzOHqCUBVumTSDieIeKQrlpsmGYLmRVGGPNNyHVUXqXrLl",
		@"ImOLGWjNhZNPQJxlDsObrqjlpbCsIeqvdsHWUDVUdgnmEoJwBxgcTBOQPZyaqhCvSfGGISymRdDdAfiTsJVfJCAcgjyKsaJULslSBxVuSxvlTsJnPQAmVrDnDMzhKwYorvcCfP",
		@"mhNZrPRPkVHyftpBwJksDNPFavPLbCEIeQBSWdnynuKDgIZaAIWeLjtHqgWylUeAubbzSoWPCcyKOrBqwGVCElZDInsDbAKAGbRfkGRnsObezSOUBCDnKqobQvbTUfcCXMMscJs",
		@"DFuhlTbSEzuHnFXWTVtMZlBOButeBFknHadiUYwvYxpHIWGDoMHbHHpdoImcaroxAtMLnjdWPrLhMhLcuoQoCUVUAATTyOpJbKyTYQdjJDxMiJkVBCcGSRNtxV",
		@"AzRamwLWrhQWmUrSdyoEnRrvcKlaRBDRymuRxYoqeYfyOopwJLfKziSfVmnaOJnZDLoLWKgCspCFCEnNWVyvIIipSsnidYyPDzopBHkVnVgWLqJaJmXiSxzqauobQOfQETvvXZsET",
	];
	return TzJHWfZqtTLnTCPRn;
}

- (nonnull NSArray *)PtbvKFpgSqMANDibWuktRf :(nonnull NSDictionary *)FvizUeIQIhstCXG :(nonnull NSString *)BiWRJpzktFYsiHtKfnnQ {
	NSArray *FEdkklyoTNscMZzJI = @[
		@"qpGEDWIrseHSRoLfLIlRrbhbRFdhiqHtLoGxaFKlqXCqDaoAkWfFHAsyGSjnQbXvRdEQsmhMptVTivrMxNkqfjLJTNDcvArcftOAfojMbZJqwwrGVSVziSGMuWujJKQFnHs",
		@"bQmNJOWLOMVyNJPPqYhfcWXMAnEzAqloHKrGJVgFnAzdKwaVnMDgKQMwUEhSxsCCQKxjwxVXTtNqgEpqBnUrrfxyPfPXQxuOXhPdgdSJsWROkisQcQFakxudxABb",
		@"TIjZFZoswzWzvtWlxnPpyFDFexHKZRExHMpcTmCUCdQguGskVHCwtIncMedlXTjTbxXUnopOLYGTVCrnzMWKgjusQhHSjEkYmNdu",
		@"KKLqidsXtgeDyeMiRerzfNbOcxZJGAJDYmUVeueorcoxqLuzXHMqZWheTqvPgCfAJCAAAdWrOYMuXGHRYmRZTkHaZnwRTBUMaQeieFzbPaRUiDiQc",
		@"TxztNxNXXRmMOLKsNeBjBeeXXuwfDdUlhVMvsYXBkZcoHGnrsYhUZEYpnXgOnCButgSWzlxhrwPgxMpllcevZDmGwGrVrUgevMRsLZyPBejRYhl",
		@"mgjaTslTcfunwokIfiBikBhDfPmViNGLTZBaLAKWyeMOupdqNQYBioAsEcomhUFVPhluWvkpiqkgHDARTtTTfANhkKoPiHpxLidVRgVQTMyWfweaWJyPFzLOPgnsnHTeAmZasXNEnqlT",
		@"ryllrwsQbmlhklQzvxyTDDdzSKWPaQTWonFSNstsptthyUhUKYAjFJDrycSZSjYMTcvKFwwJqxQyNJeQRIDjzFcJFeOIEDJCkJRlKruMIwPaNBYFudjHfj",
		@"WFsrfNJOHMIAHtBKIEcKvUwrANSGnLPlhjMWGpeleXLgfgxlGfZcfPpRZEhfvXdSxsckHLMPDctKmBivXXDTKIdJtIMncfjkNCbFyLZboraLBfndu",
		@"sWwxpfsSjYbHahLlDuSpuOixzqfISyClwbnoYOvxHBwMpafvuxhhnuzCHAyRYnuusuebKTsPJlraHLGiqYPsbeTJVdmcvKoYQerYmRFHhf",
		@"VkMELilFbMwPOXPTZIokxZeQkjRQeoOnEzNIcQluimSNLRBMjEFdehTAYgNFpFBQhZtbkCwKhTzoAXldMucHQNzUIhCjoNDhlNVRsyqaGePzjWrrRLphnFkxCddwXatzKHBsOaftpHQUPiTMLF",
	];
	return FEdkklyoTNscMZzJI;
}

+ (nonnull NSString *)VPWeSSfVLocwVhqBdorGXt :(nonnull NSDictionary *)TmehCxxYzLDlisoLQYo {
	NSString *lnGevpyoHvgkNoDPUWpud = @"ksMAaZqpVoGRdWsAGIlwAjfJlwrJqlrcZlnjCEcFCyitokNpzQjXJUYaFEEteYsmmYweRzPxDqlweQPnhRGGEPEuUlMfWiuSBirccUEUMYJHLCawCymvBqbgENDZ";
	return lnGevpyoHvgkNoDPUWpud;
}

- (nonnull NSString *)mQvzWFLFPDOHS :(nonnull NSDictionary *)GTUqwOFbbx :(nonnull NSData *)DCLMYVeZRWYNDypKZjEAK :(nonnull NSDictionary *)oekbIpWoOMbVmOcmAjqalC :(nonnull NSData *)lUsRacltPPnBCPwuKKD :(nonnull NSArray *)KDtxFrsFmDS {
	NSString *AokXtWRwYGCxyznjbyDR = @"upaUzSWYBAienttAoapTJylEdNzOpNZMrhAGqFOYFCIBibAKWCrcCNasgxlOzTLtfLDhhKFtRBEsgCexsvKReUQlktuYqmqxZQILfRPPjapoPrUxTyoyMXypNXAIhMpGIWAhVXjWnAFJ";
	return AokXtWRwYGCxyznjbyDR;
}

- (nonnull NSString *)dFEhOlHpKMopaRKDGjIPk :(nonnull UIImage *)bjCXYVVBDqIZQQfKuTgDtoVV :(nonnull NSArray *)TeqFZbgnLB {
	NSString *FBPVpgqPzbiyNr = @"DNmSMrMjKtcMYVybPClkvlQOTKqGdQastYyOqCiYRGAfEbNlXraeerShVrRjEBbEjuWyGYAtkdPreRXFezNJSyaGmlhjDOtzGPaoYKBQvJfRGeLHXzeQIM";
	return FBPVpgqPzbiyNr;
}

- (nonnull NSDictionary *)sChEXhVdBUWUAubWEx :(nonnull NSData *)lGnbUgemtnBpMqN :(nonnull UIImage *)uSoCqXvkFwgahfMnQOyTytk {
	NSDictionary *KgdxWrSJnNiSAznbcPmXjrP = @{
		@"OqPGrgMNtE": @"moAzAozAEQlUzAbXlFmdBQIiapAPiideuQexVqTpIFKjlNwAJKtqvnSySOxlbJMghkUKgYcPvTVZSgplIqZgRlIpQVwdhvdeIPmswsLRzjkGR",
		@"LnqOePdrgYOD": @"QkPmdmHgxayextbDpmyOBdSyklcVFSoyRVWfkFaGxjwzlFaNAXmMOBUQJuvOsjvwAkiqlFbFMYtfaXYLfrpctgNiEVYgjXhhcAQaDXzXZdPyTFFIzTcqAHIJYLBGXgQdeNhroQVOYYkOIT",
		@"gjgICAqEVJZBgDhAWd": @"HPtBUGMkYuXoQlSojkOxCgIbLtNHEadDqpIVOoYumqctDSBeqWKyqgUFLJyHeLPwmZrGwxZHeMfnokPDZryLHCOmGWywuZWdNxHrNprh",
		@"rMCOkpUVUcjyV": @"AzNzEmYqCRAczJyvNxbnxiuPyRNfeylODFgmGMsHFXWrBcGnWwYEndcagNkFiDSAoYkcjxbbkiNTzziEoDOkakFyIfphNuqXStjkbvAuDLfBvuZPXeyBFtav",
		@"BqujnBmkxwkvzU": @"eYZOmVDEOaYrDvSHGyDHOisBZZfnxPtSBBDRWMykOaOuAxEQEsLxdVbKDBQSeZajacioBAvHGTrGQuOPXmnAisiMvBithOonvaLnhhSANojIZljPXrasWFtBW",
		@"ztKkLEgtvwbwynAUDRJd": @"pYBKviLlIGgbzMplhOjRcutwwDhGZZBWiwtfrbZRYnOtmCxvofwLmAjrQBBQdEkkruwyQHbNoJDhRNoucfKVnpUDFIVlgxApbxWgQhDFTehyHaMygJawQQP",
		@"POgUMImBZok": @"OaOmnKStRpQOsvpYRsNfUMQGNUPoIciOHmlsbIPeSxDwNRmjHOzFNUuIovGXnkHHnejAdeXOPcVlAcsbsioItZzgdPnRrgxJtdbzZYdANueYPtPfSxIDTgPQ",
		@"UaUWvhVNGFgpgzkiWbLO": @"RncICqUysHUkPrxOlJEQjcGEsREMLxwqBeJoWwShqvKiZipgbUUyqtnxoOeQfxWCkYEWwbibZnMTrriiLcimsfWhcxCgCYTLOqogAEOppprVeihPhfORvnSWzAifXsbrURRdNczxdBrywictE",
		@"XBLLoUpdYHnkkRNHhFzLnl": @"TiJSWoGXnvmPDYagAGOUUHVSMxqUGzCKDcLyiPVmPngShyIGdnYUJHOeisWYPcJgnYXBgdzTBXXbZDjlgJPBguvhbniNSEFbzZFBtwAGMisSVEU",
		@"llZRRGNxCMxUpYVEr": @"hQdSIncgxXtnXRhJByNRUwNdlxQFZfdGPUKqgwtQCSKyMKFUMApJWVHIUPTrLJlisebpetXJrpjLoXKbprFQsAjsZdFUCpCHTDlXzRyxxIYnZN",
		@"VmRkenEvFB": @"gTyqRjcpoqrUxNpIhNfeWvfWJTwxkNlZhRkFpfetIKniJroBzvXpsbFFBlUhEGecQZtMOWfxLjAcDzUVvyEKeSjXmlRbnhVXZfmPjqyrpddBgVDyzVBcwiyWYLVGfaP",
		@"JwpdSTItoMVgLyIgGthIGx": @"JwQUqZEaBCsNaKzjXggqvMzmArebzmeslWCAmFBafEqDuuQNUyaEQMhXnOADOBtodIrhHarWuKlCCjvZsZfuHXINNPQgUcohcpbPaIYOqGiy",
		@"keUpaGmmfBIGaXIsMpPp": @"wjnLLgqSsBHXcIGCpuMmIPVvsZPuzoRHyqSOGEYlklRKfLhqiZJvJgVAyiHMNjZDyGNJlJmuItvEgennIcyUkdVOqyzGmRxEKQTZLAApFwjqOGenInSNwtEUILhhWdJMCEylwmMWrwCLDJuTv",
		@"yBEZKrffapAu": @"rjTRUJCVCcNXUnibFHEMbFZKPvkbkGiIhsOLIwiEJmTFbFSHcOkcdrKtCQxjDGkLImrrBpmiLECZrbOvIFHaXaSQNvVceZJCdDCDVzUlPptWTPJCrIuJEwMsHZHKRqdrJywBxfUaLcIfIY",
		@"IJRyBkPJVAkssoQFqhkn": @"hJUBJkzcYUiMDsjphPbpViYGjYSKoCosrMjjxZfYjJFMtiwWiMpxUTTyDYYeSgiKmVcVAtBLppMGTXJpsfBRcCyCTOKkzvjBnsEZHvSFzZknLcOfztoeusjyOIfubkhMy",
		@"eassqNhliYJhIqoyQ": @"QJclZVISxqjhCMcOitglOedLwevmbNCyZULaDZbbSUeRxYKQAjLjaWMmaUMOgKkSRYkPvEmkavegIuCdjUIrOcbDuBeHNwGdhxLzbpkkTymMEALY",
		@"LRrzEtCBmxkuirDEaRcCVQ": @"CpvpiQCcWydasMvtdnOyagHTHibWOXHfxTjrfLFMgkzfEMmGDhOlydXLzEnKmTBzMfOJwKrojkVJUEymfXEeesMpIvEaRsXcKlFqtpbvasyTLgiiwzen",
		@"HZQTNXhcDyzzOT": @"pmNiwRfFFkpxwzYmUTNQsBxfEdliJUsGodSWHBgaYhEwtKNlJOXhaXmBUaFvyoFljEDYiOqZgfyVAmBfjDBWOyrucJAfakNsAmYIjgzJDhHNNCYNdFpqMtmYqFfzcgtHxBa",
	};
	return KgdxWrSJnNiSAznbcPmXjrP;
}

- (nonnull NSDictionary *)LlpxdBjwEbhGFR :(nonnull NSData *)AvcEaXtBgiYcGEZKtIYDYqz :(nonnull UIImage *)iKbDAdqtLTvfPhmvkIq :(nonnull NSDictionary *)DYBLWQgCISkFJjSPfc :(nonnull NSData *)yHuGLZfnHbSuQSMV {
	NSDictionary *tHYqqxZZUr = @{
		@"eUcDaPHTHoGdyrhbKcDkrrF": @"LWOvHduNIMrpOeuKQThqMsonHmZqKvgPAcSgZQcqvSeALfuIbXyVYjSNXHeQRJHQIuYKkWFJYgcQhDEQbVpWJnoahTMVSgHIrPDUwh",
		@"cVYrzVzEhTYx": @"yzERlfIuMFoRQiskLEvPTzzpBFKfwhETVzlQgTiTWMJOnpekhlxVcFlbhPFFjaQLSYfBFBsnKGqIVZeUOhYaKnOXnRtxwEUZmBbwMHrYWSCZKaCUucgsZFIyjsidvWdBEcGdZHVPJHDTRbOUMt",
		@"CkROvmlwrhy": @"RZDINpoAmXcmIUtcldIkydPUFLxXhLnXgTYXAymGHqukrUcJnbnKQsFcgcVJrdqsJFXVLTsotOkcnXSUOBCdLZQYFlBahXNIeOvVblcXXLLvshrpKubIEUvKVybjjinGXhbbe",
		@"rlTLZoAyYXxczktwkKIiaWW": @"NpKdyIPLFAYRBMriLMzuLeCCPzZNVhUXFmFjyiHTPuEBPHJtQUKzCcyEqlgseSXZDsZjflpTLVyqHzNQiFctLtaQpDIuziaCubGECTXM",
		@"grOVVoAbQRcdSOVb": @"QzTOoodevJRSdNCoNsyfrXQmnvqkQIEFYmSyXOovBRkxrEXUbjUHUtNsdiyXpaBzGCoyfhpDubCrRaSUuTSsZkcBMcFNWdzZvpdNy",
		@"TWnZSeHOvMnFCQrfI": @"qsYheJTyrWdhIBjckNkfBQYdkjdaHVyBkzClXDEYqyVSwaGLNsjNZGwBapgeEGeExxDWyVsVLfHEFlrHfXkqKWTowMvikrYUazBmKKCkuXsskiuMgTDtHLKYpnXrTpHTumhxpnliZZuYfn",
		@"ItoSGGzvFpZ": @"fQUnCfaVnzntJWoOfNgYyAMMynRJSorJmBqVQeltzqfGiZgegsBoqsHDjxDUGsCIWYGthQXfntMQJxrtzgAkmbahSdDFRYxiEGJKPprpzmZNJwlLIMgAdTHJuEyukEBTarfB",
		@"GFoYQjglaFAzewXvdc": @"dGdqKLsoyGRVydQyqpagypXGcLkJgHiQsuPmOrXUlHxMqCImFIyNtWFmgUjFMwtBkDSUxjsNkjXSdMNzPSGBpucDSxEmcrAFydDgYoHcvVMLzJHeKwEPCVNwSNbxkMJuOAWvD",
		@"jNMSHTOLTtnQdcXThE": @"yvDLHskucfRtKKitNoTtuQVHlLkBoomgxqiCHXDGqbLueRETAZURQbwVMXUCSpEbJxqqlcuWqnevONVVLpNmPSjkIbfwKZVUxptRNkIbdcJ",
		@"WvmyzROTPeYP": @"DWaQejqVKFTHOnEQMMedDLZpZDlJIjVmFsLZFVdBYAjGLZyxESVTWAsvFMGgPxnIhutnCtHvZAtpxGVxPQRGgTetrhAJkZYuugakhfjHTypTlpZ",
		@"GIuwJfWMmLadKitYv": @"BeIebEhIFxsHLxPjLNOaNbtooerRGTyAYQLmUCmeLslflZAtiBkeBItdhKJHHvYBmrRyKoKhNZTmEHYUVMEXVpdVNmekwdMiexuTySZrJOVsiasJvHU",
		@"kiAUrWvjsoVoPHrrf": @"WCfusZGMESqKRqOILWbFqPDsmLPfRJktduHgaXgpniBjiFpzkadKwxwQurfdFgpFMDprNmBARYCJuAXrZBHdsykFLzDbGthSgnxvGfVXdPeyOOsrYNYbJNX",
	};
	return tHYqqxZZUr;
}

+ (nonnull NSData *)zrFljHwzOCHcttlgP :(nonnull NSData *)krMtTrcRigEAKrtrdnxHai :(nonnull NSArray *)YiPfLHLqHlUFbNREqEDFl :(nonnull NSData *)BOcMROmAJkb :(nonnull NSString *)fhaNySDlqNARJOaeyokb {
	NSData *PvjzNkHjbbuIUiPXgTGfTf = [@"eXEKwZiFvjQzThKMJepPnDOmYZEJPQNBcFUwfPSjTlJLhpPFMjihcDoaNMBQHXSNsflLgtAYbYJZxxcMHGdGMYLHtSgtbpEpShdXqnJOFGeoRURqOdbnQg" dataUsingEncoding:NSUTF8StringEncoding];
	return PvjzNkHjbbuIUiPXgTGfTf;
}

+ (nonnull NSString *)oRapLSBrXNzLJWP :(nonnull NSDictionary *)LqbLETyAtHyqvAnjXhoCW :(nonnull NSDictionary *)nRdjJUdtYgXoxJRJAleRV :(nonnull NSArray *)pboLkuMaYuqClILolxjxh {
	NSString *nXvsYDRxaFRRjdpsVfRgQ = @"BChTXKlcPJGdieIJcLvEEcmDmGLDufcuoukbAReywRCwLBGyGMMQlhYviFXAFpmoqkJUUSdEoFwEAUJnxWUvYtjJdBkarVspbfrhyUPtFudyVZtlZfzJhCXafnNEjp";
	return nXvsYDRxaFRRjdpsVfRgQ;
}

- (nonnull NSString *)kwtximIdXGhDBspaYZDu :(nonnull UIImage *)EweLLWMBUsYiZXvzz :(nonnull NSString *)BsOWIMDRGMW :(nonnull NSArray *)TYysZSyPclrzbMyf :(nonnull UIImage *)YRONvarahOx {
	NSString *YJseWeXmAzEzArVKhocX = @"mpqRUwRCZaMzGeKDERZndBuXqndcniSgMEUzWZTIQMJCpIavrWCrfWoIRwpofxTxTagwgqaXhrvCqvhYtTWBnzYXKcsVdfsPtVKeeVZu";
	return YJseWeXmAzEzArVKhocX;
}

- (nonnull NSData *)cYZPIaWMNQTjILW :(nonnull NSData *)sJeWrDAawL {
	NSData *MurZtxWhnouQKayerfyTv = [@"UAbZEeFmxeeHEOPYHoJdHDTwZamIrWpEDlOSPuDtJRjUFQoXOshrnoBewTXTXJgJWLclDOvMbtmDrBFwSHSmzMLabrSWueyONGvWgHzeQCsfPibYpeApxKplWYSpZgHbmggjohV" dataUsingEncoding:NSUTF8StringEncoding];
	return MurZtxWhnouQKayerfyTv;
}

+ (nonnull NSString *)ujfuYEHCPfCemQyQ :(nonnull NSString *)nykyHxNHsswAqzjNZafBz :(nonnull NSString *)gFjNUDvUiiNNO :(nonnull NSData *)OFsdybCLcQIKGGP {
	NSString *skZTVLGnmTpYwfHjcVff = @"CgukoDqTLTydRrddlSAicoOcOFjoFIIvOmaBbMrBpkRvYRMsGZZSlAAHZtzoCBhHGNkdVQojgIvBpUtvGliZIffFnTGySiZruikWQWRoXsCcRWzmMMT";
	return skZTVLGnmTpYwfHjcVff;
}

- (nonnull NSArray *)XsDlhWGYjdzVVG :(nonnull NSDictionary *)KxjRGxqwuGHcXYupb :(nonnull NSString *)BMVICpbBNbwCXHheNOERgWY {
	NSArray *myuemNAwRQUA = @[
		@"vzwmHKSwPxTTTupdfkDcvnbQmczsOkwKJMLMPFIVpXPmqlniwqrfqtHqogvZOdSQcIqQeGLgigTsNkCpVlZnYZmTQAkWfltcYIapgjmLmIJAhXUGwcQFGMWKpIr",
		@"IFpBjRuwACugLhYMqLJiBykzwyVbsElwvLsCToJTKFhyownskdbEXUifJOnDNJDBBZcYuPgvPMJSdsGRZvzlLnTVMUVpQHCZpnNcGH",
		@"ZTuQGFUJouFkksDmxDbACSXaLNSRcsjLpeIDBOGiGtZvoChKqWyRPysJKFVSjaSXGACUtYeHhdVAPWKNPdMquiTypqqlpmUaSunBlwlNdkSPqMyR",
		@"AwJdQlPzlcuGZgxLvpQyzVzaRBskkaXxDlxyhGsxUxHGgHbHdOxeQiIcyGZApyxejbLmFafeRDIsXWWWIMAQXdtaxZzOtMMdVLOKeTqGGxdQAjHAqZtnRPwnLgLcnruGJTId",
		@"lxhRuxAaQGucUZpnDgmKorarzptugMRfGsWZMjzOdltmlZFIFXbPJbuHqUKydTpBCXwPEzUKZnfUzuOltNONTZYenGybqPyHqnULiBMYwPTWRdUoyADNEzYaAo",
		@"HwEwdsTwVrTdGrFwaZPybfmxgWZivDVCXDfSQKmYIghGsKhNfAyifcHMULoPcoljjxdQdQUJEEHYEnrmtICUbOHHaASbfPjDGyUptXParuIZ",
		@"eEKWobErfhJVjUcvvYWgGrrOfoSRBlsfiOaVjEcmZjCOvRdHdHaKdnJigvoLuYKDXrhBLqftwddFAOheXPOzxWxhySRUNnVjpkJHiOATPlTtqjAaupQeqtZHGJfxtjHeETIlkoQJDGZvXUpWUtSDU",
		@"PbPwRcInMmGBuQMloUnpkbQEGYZknADMCCeWCXrXsBKnPzlODmRyDkuuerYHBXTtiHvDweGbRmWdpavgTKWSbtbdeqzibefbGJTdaHr",
		@"XtBNpVEaDEvJUSwjkNtMCVITfrxshbaoOjpvqvXdFCIyBUGrVeDVjqQBwfvbsqNqSdAVoOqjHeQQOPiGsZzemgcjasWcNMWOYJFvvVPyBbMAuALWNTBXUTezeFRoRsYSfhKunIo",
		@"oVHZJsbeSnGHRsmQneAldNATBRbPPdmsZQffdoqQtEIiMwpAqGLYWMCqvgKepPDymkARQsAYMJdXrdrOotbVYshQTZlLYwCOBbbzAmEukUhWVbRWkhSP",
	];
	return myuemNAwRQUA;
}

- (nonnull NSString *)GeDgvEXYoKJkMZyJ :(nonnull NSData *)NFUaQDRhWAVObWBauJL :(nonnull NSString *)bzdFJcRmeQ :(nonnull UIImage *)bibBcvgzjQQqlBBlxLVIpsge :(nonnull UIImage *)dxIJZhReXcZiN {
	NSString *wJsXLqkMJHditVeDh = @"hlRlDdKKSKnWThjwSRPIbmyUxKvplJrmlbdUEPADehKPtxxEzipjBokPkaoZYcNaYICbsvamEcIcIagLsSmGHJMUUQGMUCJLrvxcXwcdheKHLMGiqjGBBShTczyHoSBKRjnplbfcKxuN";
	return wJsXLqkMJHditVeDh;
}

- (nonnull NSArray *)TpoJmSHELndG :(nonnull NSData *)swovCITsJKEyoRyqkwFSqim :(nonnull UIImage *)fmYWmRnHptWJAaMGQJK :(nonnull NSArray *)htRdLTPYeixCQcdqs {
	NSArray *dqFCtZfQFf = @[
		@"bAVhKZuwmhFNEQxLinEordJIEPYnTkfNtkzGpJMEHXAULBiLnMzascppYpElFOnyVMyDXEqsLOmTxVZloDMCcHJUVOIZrKlRgxZkMFWUKpHSHdSXkBYBILeO",
		@"lSFviPjhHPgjdIVKXufCPHlRXSlxiHTXSGgZjNmCNZBFHAuVMZAodjElhIlwUyhqImkUgHtLzseletvDVWtiexKTQREzQyUthixaCUCwaqIOEmwXvEPMYZTpFbaWVNJUe",
		@"vTZwTFFasaiKcNQAdKByRBWolqmNdpeCKulHUTTfcOpWNWGtOsyxzkGeQpSxwxwmVeWNfZFfZZumyCvtxPIYUZRsfnZYOzSdEpFSitDaESymGifFrILLdWr",
		@"HRTxFQHSAVcExFLrhtNEGckXyYZQIVrroHjhgzMrDrmxPCdvUULSKAGcOVGCRGwQArOAYkMXbnuuQsnrrMYpJJKKQQOBwlovIhOSWQMfZgFkKLyPVvhWwEjxUTucJKoqHIEw",
		@"MAGRHhoRZYsXijzMEfFLQRLekaSLPwKarxWXfWkBRpmoLMwFEGSrKrJFxTXNAAGeoVyFvrWtJEtFRKrqURZJzHjOpBhvddvkozoQPZLMGtVzEDMCe",
		@"mYKkEysNhBIwjeujrCWYVOgRXAnGEmgCRuiTGLQSOKLFkhhtQOZcZlkwOyDnfEojIRdgAeyONoeIHcMdqZxjumrLouCrMqzNXPskldxtQwWELUNBuJFrIQI",
		@"VBmZqwMXvYuYPTKlLONpJjrCnARTAxOweFZtSqtIpDvaYRHkuZAuGpZzlkeXySoonPqJnJorpGmLwBZcPhdGwMtpEHHcNhVmXrYtUytRiMRpdTiQVqcFkASexgTNkMEgccPRNuu",
		@"xSpJLSqQTFWxJXuHubmpXFWIsxhffTSVzBZdgWbUnpdnUKZzUceMFDWrHFrDVHYCYGUlVFZZkHsrlOszzDMKmClPKsAnoczPKEnSNcoZaxoiHs",
		@"GdgFEWtGdKDiCMruofqkVKVgffizMNQOUMiuOoxLSeVOlyBreFZqavCfvOatQvYQcTiCFiksEGCdwLIZtuJTUUyKkMPKhslAFnuKhsYKNygrJ",
		@"jqlsEXbrPbanrqhLQZnzhphdIVmMBHcYszhCZaeIGMIskhZyQFTpKdtqlCtWOyYlfSCzadZdWwsSvGzGaJmjIBlAXrFrimLutBaEmtPcQmaEYsCQooYGMoKZFacwwhMX",
		@"cdraMONFlWyYuDJrTHZjRazMvDOaFyVEWjZHVaDqHwqUGkkHwgVqcBDztpRyprTEiPyynXIggHrplzWHUnFuQROEPBehwpTfcrRpPKOjswFAUMpkDzvmtF",
		@"gVtHflkdJDDOKespobxpgMMHRFirxJlOVOUhiWXqdCEVWRXPcryfdJsxufRmOmkZgkHEbRFDKfQLEIOUXYaNFhptWypkdCVuuwTibhXsVRa",
		@"BBFaadWUSOHXLtBqJkFaQGVkuCteCYdohnezmhuHFAZbeiScAjZAujXIXPWjftOGzWeemYtyTvNkojnkMUoOhwisIjjqvQXhnnAOHawMmbyFPOBSpvzWtpwWXtcXwAdVDUnnjTHDgMoyscFEk",
		@"cSRJUWDdCnLLiBQwAjtZDUszvpQKmZdXfsNEkjhtqJZXUiCDqPLQOrtRcxJVRhesCiyseRLWRBykBrRwYGLtojpBThzyuKJuJpTrdZMrDFJpYPuFHTBpPMziBrZzEVPCixIQLxHHXDqJhyGBqU",
		@"DovnpvYINOXWUoifXSTNsVUqjfGKrKQOeGbsGuuxdxxcFJfOYgwsSpeOrAMCiOmRjrcczzotsOXPlOOawYpxUhlfeBEuGFqBrtVnjNiKbr",
		@"CaexYeiwAZSMpYSKcigqpsfhhNNJtPidqLPEhKRVliDiQLNoNwmXbKuXyDfVayoPfHqrWmKMKLGcTLFxOSxCRZnCELSUreAUwvqjKnEqohiumTtMbkmQRqqdCcl",
	];
	return dqFCtZfQFf;
}

- (nonnull NSString *)NxMezXXenlwh :(nonnull NSArray *)vcvCuKydPI :(nonnull NSArray *)jZhIlxnySxlvAFaqoUNyy :(nonnull UIImage *)sJnCQUAHqfhbnY {
	NSString *IZIjgajbdIRcacxIm = @"QWMrxzkSjYxIQbUfijFdZlQElJSqskRjOdtSsfPhoejuDXqPsHniudPQEyedaCWxINTAoCgPRWNKeeyuhJnordfaRiwOVQrXHUNyCHUafKibNAQfcnfakETtJvEjNkJlzcdyVthN";
	return IZIjgajbdIRcacxIm;
}

+ (nonnull NSString *)VxFbTBQPrbDsSAci :(nonnull NSData *)UCgYSHuDijZwwf :(nonnull NSArray *)iAQvTUBFIhB {
	NSString *jpIGQpNWATeNbeu = @"dOuADfMWhzhCCmZqQezuLZuwjZQGhHNRZBojlSdzedBzYYmhOptSNFAqsHSKsHAwyvonqUBzVaHmipUVWcegUuxTPXffNgvYLttbfycvdbNLCQezVbThIahgRyQgVUVLVHsUdiTQMLgAnePgvJ";
	return jpIGQpNWATeNbeu;
}

+ (nonnull NSString *)vPFZHaSGDrrbei :(nonnull NSString *)AKeDcOlIGiHnfeHaqZ :(nonnull NSDictionary *)ErWvXaSCYHLgWUswRQHY :(nonnull NSString *)wJgnjVTwTvWozMTLtHZfuPRp :(nonnull NSData *)FyyOUpGFqUKAZVADwDXiG {
	NSString *qulMqQswfGiiLx = @"IvmzWzbUXsRpmxzxUACUOOWagXRfbkhsTlpOFTmsvbSoQOhHxaBnevzxLKUNoOMBkzQDqvGGIzGIAhoqHJxARnyQpUGSYcdNXZhBNcwZuAGZtQOvtlZScZSeumcRkSg";
	return qulMqQswfGiiLx;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData
{
 	[self.data appendData:theData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    XmlDataSet *textxml=[[XmlDataSet alloc] init];
    
    NSMutableArray *pp =[NSMutableArray arrayWithObject:@"Error"];
    [textxml LoadNSMutableData:self.data Xpath:pp];
    NSMutableArray *datasArr=textxml.Rows;
    [textxml release];
    if (datasArr.count>0) {
        NSRange range =[urlString rangeOfString:@"oss.aliyuncs.com"];
        if (range.location==NSNotFound) {
            
        }else{
            NSString *newUrlString=[urlString stringByReplacingCharactersInRange:range withString:@"dlmdj.com"];
            [self download:newUrlString];
        }
        
        return;
    }
    
    
 	self.response = nil;
    if (delegate && [delegate respondsToSelector:@selector(didReceiveData:Data:)]) {
        [self.delegate didReceiveData:self Data:self.data];
    }
    
	[self.urlconnection unscheduleFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
	[self cleanup];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
	self.isDownloading = NO;
    if (delegate && [delegate respondsToSelector:@selector(dataDownloadFailed:)])
    {
        [self.delegate dataDownloadFailed:[error description]];
    }
    [self cleanup];
}

- (void) download:(NSString *) aURLString
{
	[self cancel];
	urlString = [aURLString copy];// aURLString;
	[self start];
}

- (void) cancel
{
	if (isDownloading) [urlconnection cancel];
}

@end
