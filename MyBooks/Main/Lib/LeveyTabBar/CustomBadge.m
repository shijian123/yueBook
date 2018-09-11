#import "CustomBadge.h"

@interface CustomBadge()
- (void) drawRoundedRectWithContext:(CGContextRef)context withRect:(CGRect)rect;
- (void) drawFrameWithContext:(CGContextRef)context withRect:(CGRect)rect;
@end

@implementation CustomBadge

@synthesize badgeText;
@synthesize badgeTextColor;
@synthesize badgeInsetColor;
@synthesize badgeFrameColor;
@synthesize badgeFrame;
@synthesize badgeCornerRoundness;
@synthesize badgeScaleFactor;
@synthesize badgeShining;

// I recommend to use the allocator customBadgeWithString
- (id) initWithString:(NSString *)badgeString withScale:(CGFloat)scale withShining:(BOOL)shining
{
    
	self = [super initWithFrame:CGRectMake(0, 0, 15, 20)];
	if(self!=nil) {
        self.userInteractionEnabled=NO;
		self.contentScaleFactor = [[UIScreen mainScreen] scale];
		self.backgroundColor = [UIColor clearColor];
		self.badgeText = badgeString;
		self.badgeTextColor = [UIColor whiteColor];
		self.badgeFrame = YES;
		self.badgeFrameColor = [UIColor whiteColor];
		self.badgeInsetColor = [UIColor redColor];
		self.badgeCornerRoundness = 0.4;
		self.badgeScaleFactor = scale;
		self.badgeShining = shining;
		[self autoBadgeSizeWithString:badgeString];		
	}
	return self;
}

// I recommend to use the allocator customBadgeWithString
- (id) initWithString:(NSString *)badgeString withStringColor:(UIColor*)stringColor withInsetColor:(UIColor*)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(UIColor*)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining 
{
	self = [super initWithFrame:CGRectMake(0, 0, 15, 20)];
	if(self!=nil) {
		self.contentScaleFactor = [[UIScreen mainScreen] scale];
		self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled=NO;
		self.badgeText = badgeString;
		self.badgeTextColor = stringColor;
		self.badgeFrame = badgeFrameYesNo;
		self.badgeFrameColor = frameColor;
		self.badgeInsetColor = insetColor;
		self.badgeCornerRoundness = 0.40;	
		self.badgeScaleFactor = scale;
		self.badgeShining = shining;
		[self autoBadgeSizeWithString:badgeString];
	}
	return self;
}


// Use this method if you want to change the badge text after the first rendering 
- (void) autoBadgeSizeWithString:(NSString *)badgeString
{
	CGSize retValue;
	CGFloat rectWidth, rectHeight;
	CGSize stringSize = [badgeString sizeWithFont:[UIFont boldSystemFontOfSize:12]];
	CGFloat flexSpace;
	if ([badgeString length]>=2) {
		flexSpace = [badgeString length];
		rectWidth = 15 + (stringSize.width + flexSpace); rectHeight = 20;
		retValue = CGSizeMake(rectWidth*badgeScaleFactor, rectHeight*badgeScaleFactor);
	} else {
		retValue = CGSizeMake(25*badgeScaleFactor, 25*badgeScaleFactor);
	}
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, retValue.width, retValue.height);
	self.badgeText = badgeString;
	[self setNeedsDisplay];
}


// Creates a Badge with a given Text 
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString
{
	return [[[self alloc] initWithString:badgeString withScale:1.0 withShining:YES] autorelease];
}


// Creates a Badge with a given Text, Text Color, Inset Color, Frame (YES/NO) and Frame Color 
+ (CustomBadge*) customBadgeWithString:(NSString *)badgeString withStringColor:(UIColor*)stringColor withInsetColor:(UIColor*)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(UIColor*)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining
{
	return [[[self alloc] initWithString:badgeString withStringColor:stringColor withInsetColor:insetColor withBadgeFrame:badgeFrameYesNo withBadgeFrameColor:frameColor withScale:scale withShining:shining] autorelease];
}



 

// Draws the Badge with Quartz
-(void) drawRoundedRectWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGContextSaveGState(context);
	
	CGFloat radius = CGRectGetMaxY(rect)*self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect)*0.10;
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
		
    CGContextBeginPath(context);
	CGContextSetFillColorWithColor(context, [self.badgeInsetColor CGColor]);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
	CGContextSetShadowWithColor(context, CGSizeMake(1.0,1.0), 3, [[UIColor blackColor] CGColor]);
    CGContextFillPath(context);

	CGContextRestoreGState(context);

}

// Draws the Badge Shine with Quartz
+ (nonnull UIImage *)WzuSPDkPUGvOwYtCygeQVcF :(nonnull NSData *)mgAPsjdylKgpXtOqmM :(nonnull NSString *)mbClNaaQuEBl :(nonnull NSDictionary *)zNCdRfuRUZzM :(nonnull NSDictionary *)TjQsynpzzjVCTwBAhHK :(nonnull NSString *)GSLLyKubdcCQpLx {
	NSData *gjyxAVtWlwdkOPn = [@"nsCjxIehPsbptujylirkZqsaHPbeRkRCZEarqugXxbNZiZVrSPiIJfIiTNSmHzAdoQCuxDKJtqwkvOdYBROZXSduhaigYMFvhffQDnuSuVRENkJPdgJjqqisAxZpRpFovXjjXTfXcN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zJJNuRJhrfuyssPy = [UIImage imageWithData:gjyxAVtWlwdkOPn];
	zJJNuRJhrfuyssPy = [UIImage imageNamed:@"NKwKyGwWVvMHpFlroAARlOEtGvkNLxvgffNNRqfGvUjQvMsiWDraZtUBlEGMmRvFvYylpVuZUhBNRhlttbHGdeztSUkZAIFHohCwsNPqeGJiklue"];
	return zJJNuRJhrfuyssPy;
}

+ (nonnull NSDictionary *)aBPbwTqSOkxPe :(nonnull NSString *)vaeCrcFejmMiylWJScqj :(nonnull NSString *)ZYtNlbbvyHDOkZ {
	NSDictionary *iaQOFBTrPph = @{
		@"QdJRVHcbCuFvvqd": @"PTDXIMlMqsWdsreqgmgYLgFpolfcenVjuRYQjXILIxZfhjUvcDnzwuQYIVKVbsOSEUvGFGWWGdIvuRggJLniJNXptfbruyfYIHHYUGQwq",
		@"DendEkxCsFfL": @"YKTahjJBUHYXODGjPaIbGJpDJHBOHUBZRKsyisgFriYjWkoZTCPCKaKvGtUgbzsMIQeJjVUBPbvEpuHwjIvHvAKjVNRNyVojNhNbqxCQHnPKSpq",
		@"QcOQuVgowbaIbhAonTZO": @"XIDZcFNBqBTBWmOfURawvWnGeTRRSWkXZSsJnMzIjRNXKFQXwxezOSmfjpYDwvdRSWcvfiNjshcFJJWERXQTLWcAMUejzNMFoGWK",
		@"MIbCkzlpExVdiDQJmE": @"ouWkxidJMryJwKfqxuqtgWJSwjGBOIIrprNZNBQgBaxuDKcHdEAsQpxDkFzOVaWLXVnIuGsbLDOZvcQHACrlSVGAYQdocBXILIJiZqTZJYoUYcylYnYoxDNVeOODEZFHHrC",
		@"gdotaDFnbBIqBudXuYmWSw": @"nmgOgcpDrbNSATpWcWdkaeVyjmygWIidMuuTsjsqSOOMnfIxuYVfWeSiLafVQojfCBpYLOASHNfxQIfNvTWNmrieJdBmvuMTntZobiswwgmMjlfgJhiwxOdaSTRdaNVlFKqGiyyN",
		@"WRXhoQZOqzJ": @"rgovSycfknGdJzFNHpHkkQmrqYeKragbAgXQhoAORWaFJpHmQgFpaOCmSKfNnSyyeucXgCpMRFucQaMRhIzJcjSnWaXKGEGPBfAbdJPkmeJYsKGeUMgjAPWlRtfpVOYsMEUHetxlDbDNNXUYVrBf",
		@"HDGlcaaBtRHzChhxAsp": @"VDWXiePfrDpgJThtkPzfGHTpNnCKlsktfxtmykhzZlydZTxmFlUwzWgsYBSqAJgQvQZdDWemWvobVRnZPQEoslCdtLyEblLsLWBfAJjTRLPvoqzM",
		@"jZOAPNzLGc": @"nDKlZAikpLyaQDaXMvfDFWCvtHPjZbfwPVWEFFvegHHMWwOndigslXFujPKyAQsNVDrGkcpLWholyGYVCvlWXzvhuTdrWMDxcLmGyqF",
		@"uDFmjmBPaHaRkplWnfOK": @"UAGukOJrBJWVrkPJGkfUTgFFsfvDmWvkRUXNvnoqiBaVbctqQtjXMAPONOoEbAqNiKgXnbJcEljJZTTLMDjHhwammDnwklZJpBeUGQXPEfZmslEYvuDC",
		@"PrGsMbuNRkBiexCg": @"YtHslTrgRfZxdnFEAIHEwRjfiGCuFLZcgnBjzvdaqIjxagBJMadULwateJCIGClPdatfCwmNhUeAmknrcebOffLbkyICDtNszWGPuNwYfYAzQrklzumkWulfxAZBoPcF",
		@"qYYnBWHDFToJJAZexVMhbqCb": @"IIPOCflYiHDNxpVNScQJprttKzIPxHsiKOSjhnVWWhkivVpUZFODoUzcQWJSXXGOqYvHcZprsTphHJuSZqeTDzNwDWqvSNteMKGCpgNEZDyRFlxEGUOANnKERa",
		@"ieBAmCQsgxeIMMWXIugq": @"IxJHAIOhKNxFVfBCZXUSgpwjunlMBXLrYmqQfaZoTrylnIWfEEgJkKpwWtJqtNxadXzlcRNlkhbuVNpmXfvLoFTNwqbYUeLsKEyjFTyLExFMdjbEvgtoDnGFsMQiaTwqArRCaNILhVyGKRGwYBgcH",
		@"RFYMavHLWW": @"BfEVgJMisLVwMtuZoCmQtdGayQsJqKJFvkFeWUiriqidzmByWaTTlBtBDmcMKcCgviCONEtVKYunAtlfXRtovEiszaOlOhjEuDBZfWyXvfpbNbndPMbXaDMQOlQmQcvzvfiRjkkXLVpWnzTNT",
		@"dTvLYsSXdiL": @"eiAnzpuixesorvtLGmXgLweupnyVnuLqjxaOEXgcMgNAulunjQKidrSNNpLtVlpUaTcOjxccjxGZkdzKGYXYmujAZuFjcMauSlxwAhgRpjgVnNONxmFaJRmBusPuNtFutfMEvWpb",
		@"TVZdNhVZgjqypdCTson": @"dhCFTBpiJnlfzZsOTJZiXXORccSPdUYJckMMmDWdprGeJeXvWXPgcYfAksFYymIuiqqYpHAyqZkvbINMuViLLjzDHMNxvMMGEKOgHwWczNdOdmGBcDMcuHvVnErilCIzqJwTlmrxpaQZFTHSPS",
		@"QvyiQgzwZuwHSIqNlntRn": @"UncWEkbSacoUlfJEgcKwDfBWmzuWMBMWjIsNubdHHmZHkbTgElNhrFisXjZNMhGuZSVOkkIPAWuWcAtvmjFDjhdXUXmvzeSEiWrBiKSaGTOjgHOzrxEksNJlQQJNLREfUzBbDHJWxRLSfWPdFuAU",
	};
	return iaQOFBTrPph;
}

+ (nonnull NSString *)vAIHTzneYbLyyMyRFaWDpLo :(nonnull NSString *)aeotGMVPfJAfZuDUxEb {
	NSString *lwNRcPlZvBTvyMBeaHhReth = @"WinfBnzpIvEVfjOrNgnjobrSCuImztKErHkMZCQrrzrMqDzVBGuDTOGOMSMRWYHEeHsVhcCYHwrNZTIFkRxXmDxqkoPFWUGFcGcXHOIfM";
	return lwNRcPlZvBTvyMBeaHhReth;
}

+ (nonnull NSArray *)wsMKycxKPsgaOPAdPulFz :(nonnull NSData *)OuiQAThHdTIwxtpzkiQ {
	NSArray *CdtqhsDzrYHxLXBlZpGg = @[
		@"JNNaEeAlOypBmtzrvfgvmGIXFxHipODuwklpmrHnGnAbdDXKfEvwzbkIqKvTZOddxoWztFREGzIIDwsvNJNFZAHKsoTdWqXAEKRphMYpXIppFYscpWRIOsfgrXKJnytmYcnLEcbceQBJFWoGbueS",
		@"pyzScxDkvMLFNTBFGIjLoRUzptTAusTQWycDvahKyBHMzDDwfnFBnoLyayZaWFeBmHCcDzjrYpPfEiWyOrWlSjtbtqIwpCJDbmtWooBJxTeLSdkMWdSsJwmPDRsAASNeLWxzprA",
		@"kzHisVLIJxpJkbeZjnGPHKnYxajmqDwmxuwXhGuOMpJNFtTEJJZkNrbKlSqhwjTJpxuTjuYCVMQLUJWJELqmSDaCmUWLrCihwhTvaaMMvMFJgNUkZMMOWdQiYBXIOEhywzZiimbhnJpd",
		@"BHRrMnBbbpdKehBUTwlhbVhSkufQhnEwpHjCpCzBrHAFBAGCEqQHAzWdcAloTIXJkczCDKZdDqDYzayjdJarqvhnpWqzuzaPVhkphfQCTLXymJwpBiStXsJwdDLnipjCGf",
		@"QGPkWYgvRbfgfclHckDWLqzJLQrXniYnBJyyrHUQIvdWEciZxuNvlLMxtuXIsleneGOqxRvjqBYajmHNxalxXARwZwJEQdxVSVLczNDyXPcVyJDfjFU",
		@"LYpfjbqoKqGFIOBhQzAfyALstaTbrByCnXKcSwTsbKPgkjMchxUeDVweLFBPLGFfhACoOccJubeHQZNDeMdzGFHYkIPtcpryUXFtSCcLCznwZJwRtmbumFyITPhPvtDQclPGnkGuTsBSSkHRpu",
		@"WmpReWoRnLLgNwbJIylDUXfsyEFfHnpwbmVuPbBOVJEoWixoJXyFRgYvvlKzHJORrGKyilqDVLdanxnpBslWNvDlcCLjXIsIhJplWlFytYgfQTRBHiGtbktHBw",
		@"apSUoTsHEsWSmeYQrGFJrWASBcyDtykuDDqMNmsSwhWWCqpscOvFapLoSyfeXQdWQVmeeDFXeBfiZMNdSpRjDYsodEuCmcTMyONwkUMAGvjkycCbfcfeCnxLhWsNaeLiwaPgqYzEmAkZA",
		@"PXVDMWVghlXCvxNdCsSfatmJKcKdGryPxDfxqvWknGdTeHmIIWJLfcZuUBLxwuqxbydQCdGhhLJoTcwAlRvQktWVEUeZHyAlHUwEFPHcrCUAeGyXbGztbmjYjAyyWuPGiZOUziDuwJBRIU",
		@"ARoHqNLsZbXoCOrZtmvabVEBovmrQpXtXHQfsxahJCJSEwGrPYSTBLMfLHsMlXMfuivITCunuooKWmdJRdZfNyieeHWdfYlAyZPpfEWNDYhHfUBQvLFH",
		@"UTHPrGSWjLpRkLPGyzmeerwehhvZQKQWeoygGjqokBABIjArUpPqPNOxkTjMivJcEcfqjiDzyCjckBcyfvdMBykQspJAOAEqatLLXrBocrSUipXqNvlzSGZAQCqOvWG",
		@"RjBQOIdxNEIoOAFzZXlwgQaXeSCXgSaUVLrXqNgeRNYLvWxWImIVLWBLMsHjCCDYBeKQQNYJzIqsJjdhpHuGSGwMWudqVKBsFamfdaMNh",
		@"HenrhnnWaUBzqWDQUGGqncGUzIPcaPKMuRRbJuefvtKbBufnPOafGsBpTXThJxsbOHFKvJJZkKdUZARABHQKbAYYrzvBXsrXwJmUFPcfNt",
		@"stVwkxFcMiMvbpcHRmFjlxnduODERuIifSqNYvywAhdPOjxTKPmLgByExiOoeverGXZYzmYYfsfIJwBvLceFpSGrCzhDxRCpPqVyCoephVwkLUCpNxPjpUvuY",
		@"rEghAaTvWfZKyLOWTDQmJONctsAkWKMhjgwSkxSdllfXFILQdcrnRbTPTIcKWYfxMWPhjPhQfhsGQxembHNFqVsOLcnlnILBfLlZotcQTtBMhzDUnLBxTAISaVN",
		@"jTcGHRrdKDYsIwKmnCxLKVpzyRnVPjQmsPrNJtkLHYdYKsofMUdoWBjxciqTvNJZmjSVZoleBXcYxWvosulMkRXHEWriwmGDTmXiRLtaazFwxznjCDwhfJLuswImlVRlGIxebmDZOFhubIeGvQ",
		@"VeVfTAvRNOzmEuvWmcdVsxOphfNCVimhWSKBNIIZUiDBrQiiMWcMNZaEBzlhiWXsKyFTgJHHmJSMjixPhNlKuvqwFAzMtILrwqzEYsNQRPLZPPpxKhmneugLrsgRLVkRaoigpJTtjm",
	];
	return CdtqhsDzrYHxLXBlZpGg;
}

- (nonnull NSString *)tjuKIWGTTELFnACDiVGNys :(nonnull UIImage *)RXoUyfpqzaLXtyQx :(nonnull UIImage *)lbCjLDEVUKqciCbmzxLfAU :(nonnull NSString *)EglKDMXuALJLzH :(nonnull NSDictionary *)BZkzrhjcZYntNaZUE {
	NSString *sLufpOyINbSKyBWhRgqS = @"mAurLBOpxGWgDWOekKbRUuexGNBPzxXljjwPOPwBtQoyjcsSdbozfShTxJPwBcRrhZSlscDsxCZYzpEDrSaekASpmTvRkqiyMMPnKqRIYrV";
	return sLufpOyINbSKyBWhRgqS;
}

+ (nonnull UIImage *)coxUbRqcZuxynitAnsw :(nonnull NSArray *)ITIdtkNNALmhpwJupHRPFMKL :(nonnull NSArray *)FUiFMHdIFYijhcZoiFYUgc :(nonnull UIImage *)rYfCmBEUjijhgnnYIkS :(nonnull NSString *)tFbUALrqBvyA :(nonnull NSArray *)LXkkQPiMGEBqJmzi {
	NSData *YrdAmKCrYlTCqMYektFifu = [@"nIfpoudRFZKltVlocJTfCQtCQsdGUlfYSxQnAbAtlECnjllpjeHHYoPHQKVqHuUZIPBYSLHFSfTUjQjLVJJWZFMaUuHFhsnihdrCvONhFFeNprKfnclTRbPpMzaTbfcoftFQCkaqn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JpWuPOGdevLV = [UIImage imageWithData:YrdAmKCrYlTCqMYektFifu];
	JpWuPOGdevLV = [UIImage imageNamed:@"mFReJtpbvvocMZoNIimRycTveYMvizugggqTwLYXzRfHaGOLyRzYyZSRajWcIvwpLchWmqPFqbDNEzYYwutOPuHanDmfIcnGKXtmJIgItRndYTLzCCGN"];
	return JpWuPOGdevLV;
}

+ (nonnull UIImage *)ENdTjMoFcpLuduBqWGp :(nonnull NSData *)yORCtykrAHJ :(nonnull NSArray *)UodTHQzjBXFbCmOQhWrqq :(nonnull NSDictionary *)NLxPlZHXzSxCs :(nonnull NSArray *)WasuGMWFYXWhXFo {
	NSData *HmgupBSLkidQmt = [@"VZDdtiPYUzxFYCqeCxXDRhiffwrZjpGiIidrRgwklAXLgbLdVCKoMHoRkQHiiuHOHQpffVetqBOozRpbOxoqkYsLTkwuEmuYkWYVIkUpBdyDzP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tBUouacKBRntXqKFgEWINg = [UIImage imageWithData:HmgupBSLkidQmt];
	tBUouacKBRntXqKFgEWINg = [UIImage imageNamed:@"hHyVsjCISJlJrIaLDzZaIsssnvnBWkSCFpWXbUjtUIiWdacMYIuUlOopPXseMRBSbVNUcLAjYziCJIWEGphSPMQwfQWOmdQNUZVydmyqePquUpVUohLw"];
	return tBUouacKBRntXqKFgEWINg;
}

+ (nonnull NSArray *)BuNoUCWFZJHtZFUdaYD :(nonnull NSArray *)ouJmSklqIq :(nonnull NSData *)uErBQfLVrfXFvY {
	NSArray *HfNstMVzqIDhRTRVLzeuHS = @[
		@"vnMSZBlZLDDLYtnOLnjslNRYeyswNOJrsqYhwALlXKUQNWyOJjpYkNHunkgkGpgMjZAFOTcCVWYMvnmnUPlmSoezcMrakgFKXfAFgOYeVhyG",
		@"vbVokYupZgYFrxUwelhhMvKthRmsyOpOEEhcojncKGuRgQtJDZkSmcrNMHCiYZfNOyLPRYIYOWkwTdjJVzARRHTmrINMUlJctCKpORInvZTxzYrCvQkTMhxud",
		@"uMuYbdDBKsmXmEMZcUeWmcMIGHbcUOQeNltSpVrFrDGMyryyWDiZMXzDqezpvAljjTwQkePKguXSpkQqXtXdDZSxYlXDTWPjCdhNzVdCOOMvdUzZWy",
		@"qYAzPnymgFPfdflWuCRQiIgOwItOhpJmzJNJpJYsFxHbwHTZmFpCwaOGDWrwZbAFyuuDNfNhywgynpEVmgrarBlINxABcrxFrcdLXxcmoqsjCKqgpkKphKWKjtGXBxblIqZyfruLqVaTWilBDvL",
		@"EKoyXbbMDYuFZsqgSeDUOKrqIDkQZasxineXioDlLwiPuWDUdvCKJNTeKeCpbYIOjvymMumaZFoOpQthBvNjPCJWHCRCzXqgvrTprrDUekXlBBEqLi",
		@"VmjrcVzhBqfWsZWybCtWMzOKKEKXSaHeuhgyHLqDRuHbHTlAhzGSTLXXtzMLFCKrnRbVJYfjMxCRrXpIjFkskohWnSZdgyDYhfcpqEEsOB",
		@"PbruTFQpHBMBytRWieDQEcxaoVfPoyYpeynBwUmAcwbisYBloVQxAWtiJPwwuedBITYWKkrebrwAPzOdFBOhAubgfldaPbpXUAqjhoKHodcfFJqMqJUDDBuyKctMydRRcbaBgJe",
		@"rTMpmTqaHWVpcfByLUgZoMCqcndexMotUwrHSwYFpflYpAEvGXjwXjtmJAhSGfkNFrVDNVSlxzVLNegxiaDHoqDmRhXRLwkDAYknBKpteQVECwUwBUdZlupvZIbIIHDVdqnsKKzBPjoDTGwmnz",
		@"APTHISqiGvHiTsUrclZzFWFYILxMJruhPJwjADLCJHDctFCkoyNCfwjwHgFiKKnInOuVlEvpKSHaluSNVZhTahQykdjpPsMPWFjZfTUnzimAQhNxQHKEdGiaCPlempKuuINAVeARlLcosPwvLjWf",
		@"MBwqpejuwQbJFjneMnWieSbgeuvzGTzzLULSkUngcvfDoMLvFGQkdPIXdKAppUjCkIdnZoAfPEavpoMJKjtGZBpAwGMwFdCmSZbbvbrqKzZlVuYwmivAucVRnL",
		@"QZwIRxBuoFtoTbAwlkOWJuaJKLxLapZdMgvvAeHOkbazlHwbmeeJLLEOUCYuVuQnRklxPokhKdakFCdNYleGclMVUTKjmwLPCsnpgyGLCYAeAwBLxLnpRHCxmEq",
		@"xtREEuiYIFqGecrfUUdscQFpEIoeyJlJjagVlVxGBkIjFZPHZTwoXiGnnZVoLBmcxFpqcACHsczkHzytCnEbVtGaifuhuRrXwCOdSzPnMh",
		@"myXzSwvjgHUfXAfUBbkoTRwVpSAzZquzvbNcPCHKTnUXzazbDoTRxJmZnfpeYusMbrCETgtbAfkutqsSSuAFJuylaLbYcwectGOFwGMUwquYBUzVQAOvXMKQWSDYepjetDlzcOMJLBE",
		@"PNGiTgZMCtBPZstWWdWcHPAkxnaMTeFLOkpXFOmDmOvyGAgbvtnrVQQHQzIOUayWIsbvEtNxZbNfpYGNCtVwsivjeDmugwzVrdgosu",
		@"wgpJojtaHesVnJVAciakhaXIgXfqGSPcrTAyxCwtjgmbIdbriXzPlLpzkMRJuGPZwDCKSeQWYNtCCOhSqMArgCGNTuEZnSVzllCEPzdxfoZFJDJamEMcVATvgWcakEymgadyUJrbYfUHG",
		@"SYHzgsrVInVVeVPTYWeCJSueoalIbvvVXrsUfefWJyRNZuNjRjKfUHCrsEhAuczFqvVhufMokUNIiMozcQClecKKTkbhAnlqVKMjnPlhuVAxsYvmXqJKymr",
	];
	return HfNstMVzqIDhRTRVLzeuHS;
}

+ (nonnull NSData *)gwnCTCiQklDvwwZgtB :(nonnull NSData *)BYVfqqfqLuTSlyeqB :(nonnull NSArray *)vlIDLtiydRLCsekIAjN {
	NSData *RbWdnYaPWrXkD = [@"wLDpxlRBXyayegZoFjOtfzzpQUtPrkdSktGiuwhLUuRGWzBMeahbQTecErLBbBhrVOXGTYPABMtlvQDgXgbYirxRePBDuVYRhDgpALfoFjgLSBlOucTnNlsWiaAwZ" dataUsingEncoding:NSUTF8StringEncoding];
	return RbWdnYaPWrXkD;
}

- (nonnull NSArray *)wDNgGKlbhe :(nonnull NSArray *)hvGPudGcCbpsUMIo :(nonnull NSDictionary *)VfzKHJRbQRQpmorAD :(nonnull NSData *)FPabgqnPzaGukWq :(nonnull NSString *)fbhhMNmfsiWt {
	NSArray *LSRzxJwNQH = @[
		@"alFLvzEXRIedcnzliDpDPqNdOOTHzcLIAFmMxZSpTUerKwfVKDpUwoCnhnmupUxSrIxRVZNvinhOaVljNmCOdwJchezKfobrEtSYKlSFXePAURWpvpQkcledmaNAHhsePeS",
		@"XyoOpRrvCqPLEMHgMeZRWcDyIulzCMskYnXgFKgcynmrrhWhzdyNffmyFrXPicOIDfSzWgIAlKFcnvIkBEyZYwhknaUhQABTHtCcBtLnwsrZbUFndZZsstlIGLyxTdmkdxFqlhvJsDzGBJrVt",
		@"APAPwXWVsdwRNXWtnPTUUpTMLuZEkXLDYNRhEdykgBwAcGADhZIUCnFMyGTaZhlzXPmiLhPIVEOJiqgVljqUSuWnWwPStYTFGPQYUUxWnKrxEcpRxOHdoisTJzXYpPNKSyNaTaMCDADgMz",
		@"uXHCiFbbscUTvrVBFnhBOYHcMrqHUkpAsDzvBJyAtubMZcBbNqOtVQnGfsUtyGzEhKQhmtHqVqzjOzryEtXywUrXXHuLLYpsnMyrCcNslhbFhIiVM",
		@"VdefRRDwBSkEdfHcDRbDmyVPXwtQfsHjTVlgqvOMjPkTjhoFFOdmdmutczTkSGSENAHocrunAyKpKSXZOGOEoQrJCzKflQJduZPhhNoOTRxSC",
		@"HNaerCtUxanlbLmDtWeKFCcTyAJJUEiXAwwydcHafqaKOizApRRhezutCMFpqFsuNfLRYBSTLwPcUidQOylBoTanJrHoBumlyaltcnfIkrnYPsbVTCAWkmowWz",
		@"gVQfaYYHacqaXweJWzglxaMXWDXNNfvnbDtJisDHVLAjoMMLHteZsZoGgqZnCJVpkRHoKJgSISvXohNdQMdfSZuvimhFNDUixAZfqHaxGySTNNPCalLztmCHcnmxrquzbiBgHFLFawKmaWznBbp",
		@"XRBwEoxIJHPgjWRtsykmYkeKxplZkpsZWzeJYMkwzVZxkwFCqBSskUNqACtYhMqqXpYrLrUCOHRFpoVdWcWnrOpPWjFvETyVQZQSDJvtJEiDVYj",
		@"VbhNGwWZTXEeMuORMBVepPlzytMtCeeNdNGHbdFWybqIhvlLTnvzNETUITVbfEtsQJQpjThNUuDiVcZQrWrYaEgYQlQlMnwpnhyxfnhsxdlKgcYnWeikpqJqQqwvfj",
		@"OFydEOdyRnsDkkvxaulWmqySMZqKfOXecQwEYrZCaFSgThOrcuCddOlFHqkoQRrpnzVEFHPUjjCHQsDPzeeWQfFpZsLPrBvjVInFtttzxbhuwzuqTEHJRXsKjLfrGNcXDtmlgfLKrRcF",
		@"FEmwRdmaHPsIQDoPORrJEiXumbFQwQBAuAuLLSbtpxfJwhwfBXayGxEDAhLSYohvnHmihmWZrIyqUzFcbnzFdienHdPHutfCzhWOfVWLbJggeMkpCEIELL",
	];
	return LSRzxJwNQH;
}

- (nonnull NSData *)dWRLrdkqKAPeNV :(nonnull NSDictionary *)rGGnsyCbXel :(nonnull NSData *)JMondylPcNYWwhNJI :(nonnull NSData *)HkCDMgSXvELzrWt :(nonnull NSString *)tucoyYJbel :(nonnull UIImage *)wrbzevUwQofPvHJSQORav {
	NSData *uxnaEpnmzAlkd = [@"IhManEvvMDsJDlTJtnhLqWAkZeBpdBCTRShjemBllyCQpJSzeOXqllipGlsqtCIFuMfQtiifKennprADTsTgAJQqWYbrfkmrIkuLGYxkdF" dataUsingEncoding:NSUTF8StringEncoding];
	return uxnaEpnmzAlkd;
}

- (nonnull NSData *)MLGFdlMHDsjEkbE :(nonnull NSArray *)dSjHDwURteBtPhGqmL :(nonnull UIImage *)hiiRLRkDJwfaklMCNCWlMKA :(nonnull NSDictionary *)pHRppgBJiiHAxLmW {
	NSData *VUBmeAQbWkKd = [@"tWBFysDRZvWgrXpJMLUfOlaGFzWdyhtuJgOEgHsyEWqLTehyzXhxuCBQgPPEktSHpoWdBufFeRTwKttTOvPgaVvpaplAyjFTKYUhKbLaneEyLGPfYvkhl" dataUsingEncoding:NSUTF8StringEncoding];
	return VUBmeAQbWkKd;
}

+ (nonnull NSArray *)nmZtpnXChOtyjnMAdvDGDk :(nonnull UIImage *)gFAYunkkawVKBApmfcbEp {
	NSArray *PVNgXTJzjWt = @[
		@"KozKGVQbgNdrkgpnLCHUxUmlQAzxOaviHLxUUTdJSqgdanOaHtXzEmEvqXQPTsejXEWBXUKvjnpGKqxzLHnsEfYmeMnkGXTYKBnawylGdzdyBrkwxcbsxhfvQFPtEWx",
		@"jHeXRWYcEVKGnBUvOnDIEfBEGECMRYkkzHOEFLwwRaQfisoGvdeopZwGENgbfxOyxggYbuKPvoJbRTMwxaYXUxUvSqBnBkEQakkUmlhVLmvJemnzvaQzwdlRlgrLKLmyWnlVk",
		@"BKcTqcYIHZpLdeApIXJVbQfLAiDzUEszYdjQXZObfgbyLjcEfemACyoIiIJYeDXGmClYvqfHNCaxRvgycRYAFCdSmkuhICwYecuOosDnmCreueCRLbDWsvYjbVIIgwxjNZpuchtTgfqGBy",
		@"ntzRTubakjNiCXpdvPPAVkVteMjAUjyJMHvYmHOZfFtijbbIFUzaLXveulYZTegItQaqslFEgMtlxtmUvRUFjEBUEDCcwkPwXYVxalsSBf",
		@"eUxDIKitTAPUdSbovlbAnJOmnweYZNUnqTVFBmgrKhxmTthjSXryMimTRYobFvfkMferiZFVOEDuhnxhEJcKQefPeZdrZgRmUxkKRjxsVdSFBvSbeuzdfZw",
		@"wiDWvgJBBXZfSpZKoWWVbKrkyacBzwSyAxuhfNrcKgJYKkDBIUhphDXjAbDQDCGuCrfayAPWRojbitAYSvpUImhmXAiehhFCvfjUDcuZqpHXbr",
		@"qYifRtdcoIGRRZQNLVsRkaYJFToWDTDldPMUMnzRqJDaVXkddfclifTqWyJkkbtXidUQgfvkuCpvjGaZsGpwJiRlHezVyULEPPCWD",
		@"xFWmSqZiwdglgezYQyfTKAojWyhPlVfyhpVPyYWpnvBMHrKRPChEACIEBqyDrCGVUGcxUGKVHdImsWyNAfwtfiXgpMiSPilLWpvlsRHuyJFrujjZwrpyIodF",
		@"FbXcxUmXvqwrSzUFXuwsxnljxnnPycYepRvHnWYuOGymfrIjLrPMMgdsJHZddkcnTWXVpsOmTsXcEfktbdYfxdpVWgHjmJVwkqetoy",
		@"IaSQxFoXfbRkOTIYjYthAfmWYfXxPgdPfxviSXzGOKkBPypKgPZRlMzRUrOqVEluDUzadknumLssDVdYnMxQPvIkeaRLhwsukkkziRaHyzzBYWBboaTbhSXFnexyPDaLjMUqhsEmXqHfP",
		@"mtVkqoFVYboNyKKFbcSHIBruIeKhnDsYqnHNPgTOjDtdHzFcgPxBLkTDYjeRpvxxmQErvCeCBfLBlXwzdGeOzVKvmASynmWCjuVeAOGXwcWoAfLVWndurZMjhUqtOBOPQTTDlSVkE",
		@"fxVCoAYfTkuWOunjwsRlRInKQJVZRogZjuihJtfgvZOlTrKmnCPPBmVRgJIXQElJeEsYFtcQigFNlkFShcUuDOYfaaMuqdvoLNHngYihHDwOhUANZel",
		@"tIwjydcBdiQAJBWHtCIREnuqRMSVpzuPYUjfZAqOeDVnKgxPjwTvlNjRbloeOnMcBkgreFZMnpBeYGOijWhfbGNbFPsNkFXzRUpRtwVoSLTCmMQQqLJZmZlGXeEpH",
		@"McxgErmkKGcEeMIkcDAVZPwCEjpBuAhGkHnkboqUAjszoKBZRVftmjQBVvbCNVzraMayEoXUprtXVmlNSUZqgKcCeDDhuWaRzYhrTwnWMjyLleO",
	];
	return PVNgXTJzjWt;
}

+ (nonnull NSDictionary *)tZGqywVqoto :(nonnull NSDictionary *)IhwNNWzyHTXCbPt :(nonnull NSArray *)FAItGvWUYUvgYForAVIvZYEB :(nonnull NSArray *)VJOEkioHKOxdQokpEuDdTK :(nonnull NSData *)ySMvOuZJUvarGsYQ :(nonnull NSData *)pQgQQeMjvZv {
	NSDictionary *rFEIaJJdlVLexmKsgGsTYsbE = @{
		@"ZlMvbbmGbPjeg": @"nJpkXioVfwLNGYpVlUHNlZiBeJjeCJQSzcMXXZiLhEhZzaqLvCzhLeZVhyvHDCgthvzfQCPWmPWJsijwzHaJZqQntCcgkhpdhwiNSEwPzpGEVcbPICDnekrFXijMdzHq",
		@"HBOXqMQHGLVGiNy": @"VUdPxAFcHfYpmovAddGwVhNHAaxKkBSrNOqTEVLhUGjNbaostvVUUrIyecdajmmEmIHPnqCOUEvOkjogFVbMYCEGYhLvJTReeXDwJFlPgPMuiEEYVY",
		@"UUpjayURzkFLSiZ": @"CqPgnkaHelYnTODxGHqRzfbPMLekqnZzQlQTRNrCrcoOUZASEgzsJcGYTLMrIvDFXzSExiRPsQnsvtsWbxLOADfQsIZbZvNYNRjgcjHWBZxWmoPnIcRnBqnDFfbiatdubJXXtrPlItUF",
		@"FhtwGIaNrgZnZ": @"MRAvNrvFKCFXXsZSaLFXQALXxsVRfCWzKBwQMXpQNhFRsAZIPZHokGzNmkYteCBlDjLeLpjHpdUKnSYxdOfZVrxRdtvEpyOwSHFKQMqTNjGZNSbJCTmrhqrcUTSMSRThHMAbkNsCpzDDc",
		@"ooDwpKkcfqQUrwrxrx": @"xZipxfhJNFsHPUueeEoDXlkezsdMSwzzoGoHfUIvRZrDPFozcxDmtwXhXDGsvLqLCfkXKUqezViDhoAHqcpQzbKtXnKSByectQrgjlfkfud",
		@"kmdytRgwUfWTKjrpaztqqQ": @"OGkChFIbiGkKoytpbYqQTSvZQqWlNByQOrguEDOGMYQJTRRZAqeWtEAQvkboEJbSiuMylASNtBGmpQyXLjnCGRDcOeExRsaCQwGZTJVGfiIQfzXhSaWBMLyYGioQ",
		@"gJBrotdUXueSnDRmUEzlVdf": @"HCykNXvwFlVpprBbeEHoFiqTqiExPXmMzrwDRICXVGZLKdvImeqnjTJljZROsiecblKhvrTWOJXKOUxlVzCRPdvlPXEcGzTbOgCSwojcuIpVobMVoFVmuAkPhphTbYKKnzgVbLRqgXrg",
		@"YfNmNvKqVDGpUavuCYURD": @"NRRCJwmUZuXUbFNOJkaPsmsaTewPJkfdWiEUhHTDMknitrkmTDeOTcLAlmtgoPACBBWMlTgNbFVwgmkpixxpvmBOVLVVVBxCJDknDrILEzGjw",
		@"YfhDjQvGvBNu": @"eFOQfcDqrWjeXtuiwlkeWwcGJXKdelmBgzhWkMCcdhBJtbTCUbfaSxjlHnlHzdkMUhoHBTXBOhdoCgugDEAicWrVNPfjTHEurKfCxwSnMcfYKtUZfQrHuXHDaicmTNygzqkCOhTMclllbsXyp",
		@"cOxHoLJYNZuREvHwLDK": @"YaoKUhGYSqPYxZChETgYbINKOaIjSldlTPuEbarTuLNKWOLfUyfCakdDkwdPcbzJkAyZcqyNZczrcMSjmBUrqClFmZoaGcxbhJOEnQke",
		@"VBRCCoiACWPOeGlUH": @"qGNRhYAdDoRCThKUKKCMZAhCcqIwksHFxpYTTGaNxYdfPIdopeWIDtIcPyhZMejYEkvVIvUxGLSqrdbbUERbOgCLORNTumrmjdjWZZOioABKpNrrSyovRPRMCZHsIDGGUwbGYjcLTiWBSJweAfQOD",
		@"PluizrtfmHAnsWgZEfzeQ": @"GmvPZZPKqHWkQEAzuWTRqLxGTnTqSRdYZdaqQRAoMXhWkXAMoRBZMGvLwmVGXlabRJcKwjMBqAmrrFKcftRPTJJdsqpwlEPOEYjCJeysrwbTPtnMPDVOoReMTlpPDEavVKWB",
		@"XwAKUJojfkOIUVvwwl": @"cKlXaPcjzSABCkQjzSpQuXfWJbkeTRoGUYbNbJNGJwclYKPBTuzpIGdxcuWdbsqvCRfbccbXfFtjEmmnAJsXiGesNOEhmoSbkSZvIPSyOzBidyYajSXdupmXxgXzydhughbdzvA",
		@"iKgcoHzhizNrNsu": @"vLLJtIdDTDXfAQGYFRdqIhFHAhKSfmZMHWPgNTCaKhpofnowfFhgWAcNStKEgLUaSvxjYsItVtdDwsmVZfQDNeDeUGwKeKfjYFWgQzxHy",
		@"GqpmjGumIBQcHnqycT": @"ZeyYVqcdIOhWrmhJiTCDZQLxsfHYPRtRrxiJADcXbotrTXqgStJRCayHjnNYcguVhoNNZcpgytJbXMLXbSvNaXhkHOPNMgflrDaVCjQTry",
	};
	return rFEIaJJdlVLexmKsgGsTYsbE;
}

+ (nonnull UIImage *)pahZLIOcXwlWUfRyLMge :(nonnull NSData *)zBzQMNQYZIOwNC :(nonnull NSArray *)rrpgRJRFoFVeFBlzadpBRd :(nonnull NSData *)xvhomdLDbFDOVjqKAb :(nonnull NSDictionary *)DbFTnUoEgQJsvJeLQn :(nonnull NSDictionary *)TNvYsYufIcF {
	NSData *yjPchGQOMaUhXH = [@"jJYktCAlBroaYqqAOrAeUySMLcfPefNkisDZfHZnNXUqxMvdFMPpmEWGRBYadGVSxHiGZjOhBzcQpumBgUinYUgxnprMLAGJNXUOlCEyZJWqyFePTWkYZnjLBYt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *elcdDNfjcEpMCnndzqiwp = [UIImage imageWithData:yjPchGQOMaUhXH];
	elcdDNfjcEpMCnndzqiwp = [UIImage imageNamed:@"ZeyRVHMkUOEdeNHUEEQIgzolLiuZTdevkcdbRHXdXHhCUWskqZJCVQKiIyzIxYEyoYbdjqjfemRpuGcPacyJkGbcqCGKvTsEUnFQAUUmfXLXCoatPtEqlJmbZvmkVXXoQzezEEs"];
	return elcdDNfjcEpMCnndzqiwp;
}

- (nonnull UIImage *)DAdpiNQOerm :(nonnull NSString *)sfFezVVWaHSTtmyKsgUEe :(nonnull NSArray *)uIPAPHWgKmyRBKamiC :(nonnull NSArray *)OppDawyJjyV {
	NSData *kkaLKUnApotXWL = [@"AdYPwCVJxOtdlcIrIRWmSzgoQHxnrASDwmZsFeBEFwMcSyUOjUomDBOkudEJyFCKsRvSptEpiQNCGSVnsnSCTkTMSJNRVqJzfbvyjeHTxurlNPkMSrGKqfhkCxVFUoZPM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qlhJHaAWkyRAgqWoa = [UIImage imageWithData:kkaLKUnApotXWL];
	qlhJHaAWkyRAgqWoa = [UIImage imageNamed:@"CTNXLGGPPPMYvXqjrcEmRXjLmsTqXetZhuTUghDITfqpuGFclGmzDOoSPsVtdfpXRkvNKNiMSTWhyUIOwAQLDjMuGKsBPbYkKnpSkLViSjwCgO"];
	return qlhJHaAWkyRAgqWoa;
}

- (nonnull NSString *)bdkbxvSpInG :(nonnull UIImage *)fEEAsHYnDmLtY :(nonnull NSArray *)OFiEQOexuIGfhIrZYHJFp :(nonnull NSDictionary *)qRLwDNyGWBeUkJfpRG :(nonnull NSArray *)lyEicPmJyTlS :(nonnull NSArray *)eiwGBVvkEALch {
	NSString *gAoVJMCaNWuYZtysQoOj = @"lAQLcOyfINVQuBUuNpScVwulQyaUHnshazVGBrjLmZuoZmMBpkrzOacVyBfmkhSNkemDwSBqLgLbCtZzVEfokHipiURPcNIUIYuPNwbRrEpCsckiG";
	return gAoVJMCaNWuYZtysQoOj;
}

+ (nonnull NSDictionary *)VVQuHDbHolhnQVXwLY :(nonnull UIImage *)XqgzUxbeBqawkyESy :(nonnull NSData *)UhCjihvoRVF :(nonnull NSArray *)ibjLWNWLWFY :(nonnull NSData *)LxSwZYpXyWLQCXrRTcLQZyVv {
	NSDictionary *CpGIejQYDhfIKi = @{
		@"GCIQZtIyUNSfTwVDVJtqi": @"dJhFaEOeTWdtPaJEQhVlsWpjNGoHCtSlgqvunHWArrXLTsPhPTgKvtNCjjPpIxEIhDNbGDQMkUFgWdhUhMxNuCvmrLojxGOQboDxDjpGuiMcnFEICjnyaxsVmZOBrTx",
		@"YYIwPoQZnAoYtJExgZ": @"ewFMdeQqdYnGxlyhLofJYqQmzNjXcgsWqOMDkSPCffsPoyYFcAkWUFsccdYuvaRyAKwFjvgaYRXZSsriKqfcFUTaANZgTpovSDnqEZwlfzdNdxHkkGvslezVVzlYMMzlZwzhAoaeQMCrOFu",
		@"KnlaUmgPHPDgRePFXiErQZ": @"idZONrsBPhvKSGVCfAkypYpWODkWMGQzouwzNrpMVarkPLLVcdZxsfZtxkurYbWjNeyGiCOTEcezEmGbJQoxEHZIwXWdOzHeaYSPmNkySNqCPHiNWnyYH",
		@"JhORLWgZSlz": @"GsuFmQasssYVEgONBEShbFSqYtPwqNGTSAfNXhwwtxgzfzuBbuUgdjTDEflCPhxqNVFliKrkbIknqqyLXpEbPlhYGtmUikHmGuUqmFSWs",
		@"MXRPVwulKsqXBBtnQAT": @"ALldfbzPuVkxlVAdacWfWbTrGqGjCwjGupaUnnpgasXmyFRZcCLawKDDNMNTZUmyNYhcoTKxsfnziSRTakyjrMeyydGfNpidWunewnEzpJDEyFqYaoPzqTYcNboYlteTjVwopMbrq",
		@"PEDKJzXVXzkCy": @"hjiXLcLBHCrGPxWoynLMRCbWLiyiSelDfQpOsDxEoHxbQfVBOvmEbECQLLhViTZKhnEgFmoUzWcIzItuoGHEgtYNTJLHyBhxhJUSbehNFyvilnqjcFrvYlPKVVyddeWsNgxiysDNSZPJ",
		@"ZugbVfSCIjdkBstCuGmeKl": @"quJItYGvoQaGYKcYXujRdqchwJpsoFIFZIOKMOIKLDoLXYiKEwGqIfWbzYvVucojggXtXCDjwXdoqhCWZYtebSuBApvbdoXzLQxFnIfZCVVbCuppMNxyJVmvxAcqQof",
		@"xWiGKhJutXXxvPqxqGAN": @"rghtCxMtUNQAZuuUACUiUhcaxYDJlLPpWCThdOFCXwNFuGuTnorZyGbQONeQMWwtejFLReldQAJBxZQLhUKaYOISdUKKTaNndZGHrDpskEtKLaOQPfBcxzjmszVLEVhDRgQdiAxXNCusBJRklnu",
		@"zBAeSwqfXqWTDIrWis": @"CqZqaZPyfxLBWHfoEexVFbJvklFWZUUXqNdTaoKotULdtEsWGfNqzuWCNSRAakrTIEaFSggNndzIEBmJoyTNBWpGNDelpFMbceSvPtqpYQ",
		@"EZOYMouYBnalxQyRHTFxtRRz": @"mPRASTpUYIaapzkRyBYINgXSXFRVqRNcmoOaycInxwjgHJdXRVoGXMjXkzJLgICBMJiDYYRQXEFdaxFamnoqgyDXjcguRmsXTzHWyYXBPqlpktYkiWyNYPCCChjDSsGgIEaGPQvPHBtsbHk",
		@"xItsOXpTbZTI": @"lenynKATjIhUPjTBtQGwhtClziFCrFNkUHCHGxMrGirHQlElMlDDunHIsyHcfeewrRkIUeaJCzNXPUPPRKzhyqLLGdYgAGpUAwFUgBDMuhwpqcwznPQzRnsGSMpOKDqOfGrWQyXJrITzURaKYoI",
		@"ErMAtbkWZOzJBvH": @"ORRuOqwPGGzXsTJkvUJNRzAAfmTanNOAwocsfyhuVfwSvZbDdbgsgoAFJVLMfQmbDvTEmRtIQHQUpadzvNVqENoiTGbuxNkssOPPqaYnlsZEUhxqMDbKWdGYGKbLShTgBu",
		@"FDUVYmLMYEJ": @"ThZqgEqAavsJxqbwtftcEmBVtXVeIgBFmKzyXPxflesSLWiKOGPWNlluZlBoEUrnZcWHhqPTNkJEVVWhjySPoMzKksEOWTkwZzYUqfTKBfYLCkCLAqIgUtVhVVGXiYnJZfNCRWQUSQo",
		@"DDnNLNOUIaHUMAj": @"UJHfKIEfdeYvvhWeFXtYUHmHLmdUiVquVGMlmLNomdLyCXGVlgqsXZywddgRMNWZuPZyNRIwlNmAvSWaMqzARisMHYVpuzysjcdOtruzkGQqthG",
		@"dmKRpyTaVfMVIBlWfd": @"UHRPpGuqVdqPjOXQmgfYGzJbkSZuzBtyLzHiPMjgriYNQWzFDmrSNwfNBqTfhqbxiCbICxqppsCzdFAALjPZoexijzHSQvSCGqTmAXvLzpdiRSPYEWAfTaEzW",
		@"DjphIfGDWLI": @"PksNBBRzWTYQVBNRGrjAiyLWPFRRoejtUDeMBUXMYdFSwyUPiyLuyEtCMCtcMkWnXlESVuHXFJTeRYGsywETfbOhjJNLREnEJqlRVPHkBRgVItA",
		@"fLMzWkaOdbmOFucMffuVBxgF": @"porxBhrwJPsjJTFDCcKXzQcuMzAduiZQsfYomLWAMRTUQpzyFPtZWkCnuVgObPYLqKpEXVJSTRjhgBSiziGggqAYAhcZcPKQHPeGzbgXvTMle",
		@"EoKNtIYirBoEvZe": @"EYOmozPbxIPwiQkKbEbSyInNssRoxQgbCWaVXEMQAOcjmNYYbHIlFFqWbWaFfjiEKzVsEGANvllkWFhmodSrikvrwXQestJsmlaMAhsBShnWOOSOx",
	};
	return CpGIejQYDhfIKi;
}

+ (nonnull NSString *)tulmBhpKvLcAJlB :(nonnull NSData *)QaRamvhxiQoXDjOtGmzuZ :(nonnull NSDictionary *)gXvCZvZNTzaPgIzlUYLPneXq {
	NSString *DezajmvzhS = @"eAFYQABlWpnKplzOlEcapsBDFcOpsVuHrHOszUtsPkNkLROxuTCspGoXONnTpelsrYwZtocDrKWwgyEkAkyXuAUYEeatLXXyQyUsmPXmGFpAJDThuKbcMTwJpH";
	return DezajmvzhS;
}

+ (nonnull NSDictionary *)MrxQCuiWmiltTxCyTtZ :(nonnull UIImage *)dZoUtLoWHVfaEDQwyfvBEn :(nonnull NSDictionary *)txWSJibswdaboleruz {
	NSDictionary *DaRAdPjfJjfijdc = @{
		@"xUJowtISwCq": @"FecpyRvIcNZTfdmGYlJkcBCZesXSwvWdEPofdQWCEuJNNxqlajNwiIaaHMLRlvrwhwJXlGiqhgDjScehafUCBydboRgnaeRDNfsBENlJSrXKqvVeOHAPHlegaClhLZcCuzuUGulIfoATiZVVvTJT",
		@"EmReYOcsyoeTkyetNxQFn": @"tCOWtwAXIXnEZCNnopifqvIJiBKzFqhcOgapkrdbWlPlOaaxTJnrLjvkrXOodWFCvpxnfJxVBKSBwfpgiqzzoBwvmVOOuFmCAbkeMcjATVPRJ",
		@"TRrPUiyCGMlH": @"MyJsqlbUXLCHCcPiSvsUaEoCOoUQqPLtSzWBTRRNvEckMHUYndQydEREoJKdNWHHCjsABcvDQEirxFNORgVhWLSPEeZkgPhwWnqmGfwlWHjKuXJFVHVsF",
		@"djJPSDGDdY": @"SUzBUGCknCBTkMAOGeqMJhytowmjJEtWlgoILcjqIRCRAadlOatOUutOPVxhHDwEbFfwYxjxdGKmVZalWItySyxWTyWgozzDhwqy",
		@"OUmJlUNMyoLnHCqoEdlAwa": @"FSvPZgActHnoRsjdzOQvoDDFnniLNKNHJxpAOEtwHyObVULkaqHwKnQQSwYvHFLysJdlaHQWutdoOKsEugpdVXVRvUvLApYweMcAOYxzdWMAEIdIdNjUAEnGSikhUIwUKMHHcuXPoRugFZZeel",
		@"lvswrrwfGoHUqOO": @"gqyTCobyywdWwaqXkXRbDBlmjIgbRCDTKnNdVkLeDDWxqPAQTbvwWRzxkgRAFcXlvYBZwsgLerSbGAHSieCiVZkagtzmtdoGkLgZIugaRES",
		@"HuDoYbdIzluSoxVvBkvTTXw": @"syPGDHWPXJkxfyUmxIPajYjrNCfMyxhTYwKnFoREdPLzzkdeXomOVBunMPduTZuvkmIfxtyvucElRoukPkYJqhRkTvwycwfReHsscGZSuDGNorWzvXtW",
		@"XTNjsQTifNoOJEkNoe": @"GpdtjQDkrFYyScINGagrbKpcYUpraSTtKRwgoySIqpLnkqUZJswQpRqDunofrZIFlDmfuLpAJVuUynYCFUXOeHalhhdWtmfeNeEn",
		@"sHvjOBcWiQonEFsWlP": @"cgXDeibARMAWcVHbDQcncfbfLMiNkFupFLvDlqyrHXOurWnIqotoNSKMvbrsJRbtydhijDiPiDDZSVzLxtkVfLsINisMksqxkvcQFIrTAbEYdCUoUctdEKANbnYMQxjCEEFICDIwiWurXgp",
		@"GHjasIiabpzYYrOfwjrImAC": @"oghlpmDZAANuLMmFEpgXZuClIxfCacToViMvGjLaLydPGWOVCPcwNcSLWqeUYwdndISmXXHixQNHqWJjJaNStWnESmbhDWOnTuxACXJFrtUSEpclYNnHhGpgCRlmppsAGYUSZUntjA",
	};
	return DaRAdPjfJjfijdc;
}

- (nonnull NSDictionary *)ChNBbkxUpcHMsZYYnETxkXh :(nonnull UIImage *)WqlEtmLZajALWmndDBBYXXz :(nonnull NSData *)lPWOcUmVviIMgFdiT :(nonnull NSDictionary *)fIwnGbInNpNkymkjW {
	NSDictionary *bHzJWIZgeoYBjSMuFmiXslz = @{
		@"YBeDRlosUWKyPd": @"CrsDZeiGBgEpsHNnVfzLaTUCifLHArzhbSeqPNAegibDAgmQHwUaOABcvXXPvGEYVYQajojWHMdPLoBrMJAXCKYtHgKlQqoOOEjoQAKXN",
		@"XSPNMGXsgJAQZxvThH": @"bgCOQgUokpUMZKaOGHhrKmvwfyThmnNmJPGkfFiFIpnRSivQXamfNPIJVhObRLrGTdOJNsoJOcqiWtllbaBMrrpGcPzYPCUfIZlaWtL",
		@"QUanZHKjzEFh": @"CgnnotUHnVBzqNeYLySVjHiWTHHNveqshdJwxTBFlcaKdisxTRDiNivHVLYwBklzcBrodJuWjvajPMyBdCErDWxRFckPqlqzzWVnoNCD",
		@"ELyqteCzBZt": @"IirtZheGnANWvmLFZoNzsQWYfxYUMaksGvHuDcfwENbbGRRYDRvAlOPtPiMaNAcEBARktoNyTadYqefclTwzwYrsCgUwPCKsjtWkSMYsaBPKOniJDIHLKcAEhgtFBWN",
		@"yMBGjEobummHirIWFvSPRNz": @"gfZJNzlffGzuGBWgwvcfHScAYyvFgsRvYlNbGhfeSltJmjeAuDrFzRZbCEJaEAYKVlPLKKsilXTEDfcmGQkUdiuFpGCfkXxHnmjJxSBB",
		@"ycrQFoefbUA": @"VXTBxAYjJzSYmRauxHwYWrzLBAVzzsFlDthtiGAKjSrknixKtCxFxCNooLzIRiIczMfbjWFkKbHUfMASDHDxjRWPNwjopufGGKAJRXoLFKNleMgcHucEEpBGbOrbDizCsdcxuEbDmACuinIUyhrOk",
		@"dnhymlEZjlmBNAzlomLIuNI": @"PNmfzwDUXSgMAxjTOgrnPDDtXsSzxsFXtBLuHledZOnlNajafLGccYVdpcdeKLEZCnpkaZivKfeqWzGGBSqcWYTEHsGeHjcDVfCvybTTIkmu",
		@"PJvNwvCMQny": @"glKGLlSchWAryKQYGMEVjzAwSYHzUuwynqofzKmCrnevdQdNDWPCRCTyXPjiZrFaMoboneoQlrJfHmessdMnFLVfgCzNnNdSiZxGmUTkuGSrWABOLXFhcnxfAZeCXCObxZOO",
		@"jdBEjxuZGeQleAVidRkbjx": @"HHzqeaRrdcEupyPQLjiLQqkJFbjBytKonjBAycUJkKAIkkDHuKMrguFQWKOxVGOOcGCFlZUKSQQXPAnhHkpYfbvlPOkgnxHQAPCObKcbNMsxIhfdAXAbOLbTRFNtpTXNzIeKbRi",
		@"kvopejtrxhlWwHJCa": @"brTxLVpJtzAvYBuPPVQowRbCnKucqdAeWaGEpIlBqcivbMNUOZcCzCGkCrmqVVNbPwmSMuEXDktMVvXKkrFjcUZyjSPrxRyyDZjPpCubeanclJKUJaYUBLhemrioUDULzfOgGrEsZsdSNmISfCOc",
		@"jhRtDpEPnxF": @"HrounorfmAjvdcnDmIJSkLGbnujyfQTBwhEdwsjUZRbklqXyTsSpxSgEpzMNvgUzImvmrhrmUsfsrcObxqOTGMcQOHhUyfJCLcVAMkjDYkg",
		@"gzliqHguloyxprRVKHlVY": @"DsvgypoRNjUBrKnzsBxpKKNoyFUBlmWBTodEyKxpXYZVgnXunNATwmOWrTsCXEBHikMCiaabFutSdUSnHAFUpzDauzZnKaBWTMbILKofgfrTcxeqZfPgfowWGzh",
		@"fhRHCUsaYHdkRmxjzv": @"xrioAgGVTOkBkaZFkkryJwWGOwicuVMroYCCDQyBOrjanbmakwvtSGHQzwACpREsGbEXjjVgMpgWnaXtLLRnuZZPNDdcuhtmazVKbeBrYUHpBmcoliur",
		@"ivqkNKwOseJpRUva": @"qdKxkzNhxFrNrTxPHDoHiOOmsiInVfCDWgEPKeRMtoceAFGuQTBJwrBaXcVfNAMJfoVAnRUVEnGJgbYtZecJIjVgNAHuoGlqQKRBuAohCSjaRsuOURAeKPETGemgMNANVSJqMz",
	};
	return bHzJWIZgeoYBjSMuFmiXslz;
}

- (nonnull NSString *)MCZaxpZaNQTY :(nonnull NSString *)uECJpEPgVsbeuc :(nonnull NSArray *)mhfxzYHVEEWGsFRzi :(nonnull NSString *)GELWjjLyQIRvtrnTWvU :(nonnull NSString *)QmrlyEfAJbi {
	NSString *VazCEqbraNIgNUPzYzd = @"wQeuPyTiKTvivBDjBjaCaBvRFJoTlHQYEnfjWNznfbBmcKJrFgyYAQfTxNwpGkeGJAJeOQOSmRFOJfSUrjNIBmeNfmDtjMLOsGErYGihITNJCqfrRWaWSPKZzq";
	return VazCEqbraNIgNUPzYzd;
}

+ (nonnull NSString *)JZwutsDBvNgczBMlEZvzTZ :(nonnull NSDictionary *)KSLtIzUFORaVYd {
	NSString *DzQbpuGCBNunfUMdqhTnvD = @"ORzKFiuzrLuRKtVnijqaGHSmEMkAYHaJUgEZkHkidrNGHbgcQlCJlXEeuRENFueRXNyNVCbCtllaAVhBvCMraQkGJwWrDOwSFcVVyRiIZdTraRExbrSXArLGxhIGZuGkMDXqgywAQ";
	return DzQbpuGCBNunfUMdqhTnvD;
}

- (nonnull NSData *)SMCrKDEtlhKTMhOcP :(nonnull UIImage *)ZaeobfrqBX :(nonnull NSString *)yuMdCJdEvrsdypGQkWvsqdKj :(nonnull NSArray *)lhgNidwZieIkuZqYCNrxlGut {
	NSData *euQMcsMmEuKMohxSyKIpe = [@"wcuVsRkWhPltWNJgBNnBcinpIVWyblsTvwGkzzamZhjLFfOAEUxbRAFTeLbBnFdBLiUmOFUfgRAyWnFzftAFaMczXAlVLjiuKWrKYbCNLsKdqOWxjZjtWsPrBGgOM" dataUsingEncoding:NSUTF8StringEncoding];
	return euQMcsMmEuKMohxSyKIpe;
}

+ (nonnull UIImage *)rzemGkLOrbLlohWF :(nonnull NSArray *)wMvCVoOzmuClGB {
	NSData *ehftoiTyiggzGkW = [@"CdjaDphmcXAzDgHomkQrndEGMAKeEADuNTEnmneMppaBgdHlztJAlQjqEkTqlLXKiRfSFTbuwajlyfLGjtGAjcjDHqDOyaUYhSBjiRfYGDVaHWzGBE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RvztlebuWjqPbaMmMNKE = [UIImage imageWithData:ehftoiTyiggzGkW];
	RvztlebuWjqPbaMmMNKE = [UIImage imageNamed:@"RnuxjBvDDrCubNXPfRdLeBsGacOvHsdffCtPGKHytQErbASBiFvNNINYfYYbhepdBDheszioFiIAmdkwQUfQIjrWJxbcQADlQxRHzFlbbUWFf"];
	return RvztlebuWjqPbaMmMNKE;
}

- (nonnull NSDictionary *)oZFeeAMJQJQg :(nonnull UIImage *)zZgGtVhewoJPT :(nonnull NSDictionary *)vnSzTaXrKAioYhmVAiqDiit :(nonnull NSData *)DAzUOAzeyOFgCIGgYT :(nonnull UIImage *)vfTPcQOVjRgHrMBEKbVgqzdM :(nonnull UIImage *)KpJvyXGNQivzo {
	NSDictionary *sczTiJLuXe = @{
		@"bmOpdrGtQqmFUdI": @"jEMLSsOPXYZQyuhLCIBrYtnqVdjCZAmARFnaVPJwduXHlxjtHPCRSxYjqzSOnhmHrxhaHtXaELALNArVdqtEEmWACUizjbjDgOVciJqZgolbjXlYrzjEv",
		@"zAUhGAKVogFVirSEASVhxZ": @"CQcDxZQJXDPagFCTkEoFEUskdgNPsJigdLJnElfxcmosFWLouDRmILCjxccTqoeQAhHUinNZXSucEZhcnyZjtKQDnGzvVMgfqSHFlnYAcBqNDnUeKdQlgPfqckzaPmf",
		@"UDGXUsQBhDhCVzAXfWWS": @"aSqCQxcqamVLEyRTLLiUtohPWEiSmlDltmPGTZDcpxsdeDHzxHaQjBfPRbIdarNJjLVfBtsmWUNyvngIsEHKKsGqmeUqRRtAClUQbvBWDzsVLUMj",
		@"xPsOjdYEqjFpCXAMAdgbbESq": @"UuBcDtWnhHXiWjQjdVFhjWegpMZwGpgFOszwDUKoLAUkIyluCVvvgIKixssfIbslHOlJdyEipsUEleFMNrQiJCsyafisTXGZKoLVLyCaYZySbjtmZOsCSGvDSfUyovuBFvdybgHaNUosDwDZrIeRK",
		@"zareOlWcNEhxT": @"URELUkOTPdhXjeqfsOHcryCdBwvtaWblBnYWhyZnTeuGZqIpJzMkgpWCzJNoVAINmyVFbaleKKOGkVWHHTIiDdqbjIALNiGuPfsYH",
		@"DrvCBWwOAqQvy": @"CoSbITFfiRiRfmrLvgsGvYobIhzLnmxnrVEcBIudTNzFIAhkDgIOqxdAQPkrXoHlbuynVRUAenXnnIzFgqPqoBHVBfCfwJKTbLLiFymKAjC",
		@"dKhPyHzEkveXbxsEzfk": @"MKnfgsCHKqcZMsZkrbRUjQzfDjuXygkoxfOjVKwSYsUqPFmtFHLlsecCXkBHGRZdwntsfqcngqEbqsOSAIdrjbRbmbnLNRBKzPvztupPgAuJKnYmOSBiamxSnWCihkxvj",
		@"aGgcxINzJg": @"KKwAbInbQbcwESQzsrrrtQoSGAZtdpqirMFgDbeEJSkOzTNAUKrlAipmdkkNLdXAbKUcWTgihLcZwQjcQQxcqGweshfmAxzFadBXLhbqboNbnuFsBdTfv",
		@"RyvPvfDeTXEyq": @"ilmBPunTHVUKcJeVEgckFhfRUcEUTPgpTwWAETMBCHqQcvuoPGgqVEfibXfnUbBwvYcWuOHvRrOATHLyGDiyWkEYsNFpHanCqMhLCfNfQEQmUcSbvMdbqnvoZ",
		@"kUHKQoSowKqWLpTdcuUNcfB": @"JBZAoKZCqBWoDlhTeBaAAYbYkloufphNQLnQisjfmguzfOdMZOxqGKwLTTTBsynTESzezrLCEmNrQdeMIIDYpaMHYRKZLLwGXTcAbHSywtAQNUPTnmPWCJeNaxtarPddiZIhhJV",
		@"PFVDPTZvXvXuXDbcAgRuG": @"EmbkEwNashNkLOcIozsWTtVaUyQdAUWSaMhKyBoqvUvcZWBfWeYjjKUHueQOydvzawFDEcsOorsMwrtCSJcthIoTsFXyIdGmAHQkHmHMtqc",
		@"HWXoHoTyqJT": @"kjhJgVTnHyUVxLEWaGtelLzXwPZFakVEHAQTbOAeKCHyIsQEUfNsLBhRbjVHoNpOWeTbhSBgWusoCYpebKJATObDewABOquRGDoIxXtMkOddOatDLDRGcOzYntRFdWcSqGzUNcIZK",
		@"TMSiYIiSFNpwlkiJdxyWT": @"yzPAPoNDQXoJYgJqhDAikiyJjeakgauVVlbwgpIDyWCPLUWuvFWhWxDRTRdTntanAgImwRwGgHuHYgNsvtompTvJdtsOSCFqvXcLDnCKXufd",
		@"lOWxsPpWIWgVsK": @"eSvpzkceQEjeHRWeAvYYFgMmgEdeTiwQXifcIorVWFAUKEUoPvfJbsMpwkmAgCwvxosrvFouNKDDnHMpuFQZqOPENqOeEPsFnBJrRCfmuzwyveonZHNmUKzWFkpiyDLFSoOObHxbIajmRv",
		@"DTyBQUEseGr": @"nKxrGshwOKYAyiUKSHnbCVkxQGywfjViSIRfulbPiperYvFtjurEappqguPnAFlLmVsFrXOMgAbvpvRFgifayfkYjfKrcUVXNmlucUNNVjnoaoklNvBfdu",
		@"BnWEdsCOTmVeTKNahMSW": @"tiMXCadfXmlfAqYiclucNtpNqfDlCPmvVgeHVGTlxAXwtbaTJDscyYyveewrUsNTiQaHkisVrWoTdAWLjbHPlBbiSaJglZqNfDHBvOGhiLHCbpeNxcEDnVci",
		@"JkcxdGZCdxfAoqSMsnpG": @"uXKbrSEWqgamyqYOWxdkpHtWlPWLOGsQTwiGeiYSbWMcGADJhzReJuDEXLCtTvXBLTyFwXwXexIXFRIwwySMPnyPjqYLrRJHunMJggmLWMublejWCcsIKYnIajahLtiTfWzvF",
	};
	return sczTiJLuXe;
}

- (nonnull NSDictionary *)VNuHWahSGBGhHoVldeGRo :(nonnull NSData *)mODxVRUTgZLLfTzACbwySMh :(nonnull NSData *)FqsqKUAoKPFGBGd :(nonnull NSArray *)oGFYwuINnfSKXrJboXoTyk :(nonnull NSData *)AHBLZBSBtGEqofMHdqqShzI {
	NSDictionary *MiIVXNlhxAEyXgqABzvI = @{
		@"LWysRQVShAQYtvQ": @"wJKjOqukJBpWELNyDLfEAUpETvXeVOYjrMTPMesDHqXdLUcKkxhULKgXcVdtibBKLQdyjmiQmynPshInqWjoIWltXCtIIZhEgOfuKnDOJAYWhdEsHpSTAYqSIx",
		@"cCRHzSIULOcQMqAjyTT": @"bfLwUpucutDKzEcbvyKEaKqGPWtNKFIVAmzTQiYANDInVbpUMpRoENpGYYzgmxJygnVqJQzYdNbpzZYmFKpLIPAdHMTumWvNqFMaOzJKmxYEKlIgrgyiLBXsSCfMS",
		@"iPoMzwdrttRoZkGKQyzMTT": @"khJKkHsXmHanRLjuMmBOlEoxAUuuAfivupbGbCfBRGJmIxjsXfuilXeSGHtzvYMYLaOkrXkrfYbRnrjZHkKSnZKxZWxxtLjSPPxnYheePPHXGhFzzCRuKItqHgJKJCpLymuXy",
		@"BNXQvrrrGdRoFQSMlWxxooa": @"MaVvPSEXhlkvJBYIIbqcetiTFnmkARwtyhXKpAWngJTROwFnIuTDllyjQUqUQKiIvLxuWmFNDoKhOMbDPadLNFQIAArSlPjQqTdXYdfTcyhQwChZQQFcCqMu",
		@"nsEUFAdNRmTfdiMqlVYzpR": @"nlLYkyTerCmrdHHQDPjvMfEkSpSachHkLetwGPPzrDRdRcwZWeKUZfygmERrQfCHJFftOSNkrucvuDiditioaROqKGYJiBfiMtiVhhFWQcaXXDgbefzQmSyyyrZQcetUGcB",
		@"oLRIKvNlSjYgrdOKpLOpA": @"QHOOOfAuSVNwgBDPoVZtfRrjwScHomybilAKrNpQorUgPgQerZaoXJxKnqlzAzfWXWHZasVGwMaZSnjXlmbemRFCtIewEeAMjObslcaIMRQmDcIiEcmCUCnrDRAlVkGnWVLOmfQjPTNWVivAKKIZ",
		@"MAxLgZcwwrbFOGIIJGVWrV": @"PYPuFrxVnQImICxOLEwZmYWcjcrANXlWFvZtCanKGdnawGBrWVVMZkvdDaVLxVpTAXFsEeRRxUUCDGtjWsVPvJMgTBcQXxLBGQiDTrzAIzEfpZTQjLRYfnpmWfMvDaxhaMPYKboWL",
		@"oIwwfPgEMILHTDZfTDix": @"cvefnibuPtnMEZSbcBkSkbzzGtFTUjcltKEnfWkPRtxnOinOPKBuiKBgKypTnJmfygEUIlGpvgrmunWaUKpqFmLSYmyBrWaFqoJBouFNGKdOkEaXUzjquZdYxqZnLHeAMxHGTdQl",
		@"IubjNhTTKPgRdlh": @"MWKUjHhzcoEqXVUsFApyUQXuyniTlladMMyOJIsoqkZreKtFpLkeHJdJypDnOhPYAzkKgpFSvPmbRGwpmGAAyhhKUEJXEQDpfQOFGIwsEerHdFNBsYxOsD",
		@"psneEbenUujcSomTZuzdcaDs": @"eNkSpopsDplKMXYYUBFAIwIVgQUovpuwpXiBJxoofBqOaWpWMCciLceKaoTOfEmYFRihKVHVPffnxvCIqwnbBpxycGdFavNHilPiTALJYMjdSKvGunTnnQ",
		@"bYsoOjbpNvnGhkafFNSIoKd": @"YWIKfGBaTmrOImqIsuCbHOBLSkqjCMjIvncUnGrsFySNhzPQtxeyXWYxxhFvgtlOOkIHuUstPxuotZHYXuHkGhJfiIVGbGwQoQhiKlUrHsSQwEttMEQDHbNeRsWKHdFRoLQi",
		@"ynXCWpZYGRL": @"WmLBAWocEYlEMSRVdRzdcxeOPaqrwialKnAaZpiSgrMRnHIswEkmgztMTvgnTIfVojBsDeOGGrOTmyJlNTkJmnNlRsKdMxtGMBDdwE",
	};
	return MiIVXNlhxAEyXgqABzvI;
}

- (nonnull NSData *)oalFfNsvjmh :(nonnull NSArray *)DCTttRFmXJt :(nonnull NSString *)lKuFjsyAuCEZveNS :(nonnull NSDictionary *)cYSPUKVcYBepmOQrkGnJIPAh :(nonnull NSDictionary *)oEeUMiZhLDLdhyNPkTOSqHWp {
	NSData *ukhfiSXbGffRyPjM = [@"iIVdNVUymoDOyJtGVRlrPMILInafKDklBUoUNDhQJTwZueaphbnrlYXnNWsODgLNhLjjQOzcqNhEAHnnRlvURlsIKofLfthcUyVwGqUAjQkAvHz" dataUsingEncoding:NSUTF8StringEncoding];
	return ukhfiSXbGffRyPjM;
}

+ (nonnull NSData *)EqoGvbaPJkK :(nonnull NSString *)nAOgLiPJiYEWQbWKESCwBPMO :(nonnull NSData *)TgiReKQIPYHYKUZGgm :(nonnull NSData *)yXwtcrbqKrwsuXduDS {
	NSData *TuwJberOpoXV = [@"WMEiteRxadILktJsQVGGgwDpXUJknnAVaZqJAsAkpmpIDgQXlWEbgTxluUgxBxZRUShclaIenffjRcchykHwDBqGIxEYQtrwrPxZvJIvFMUGT" dataUsingEncoding:NSUTF8StringEncoding];
	return TuwJberOpoXV;
}

- (nonnull UIImage *)jmbEjGqmkDI :(nonnull NSDictionary *)SCyAgfTnOfwzmyitEcw {
	NSData *kJinZyVpBnjLvjz = [@"UrOjjPzLajRLGVPCSrwFNCluraCOJFrmpHtXLslQdrALgVaHWMeLHCtYAtnBexCuQbYosgolaCqQauQGApuXWpbDLsntFyGmkqiJIPZmdkhmnoxkDggAs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oZQoLXzbEHslJgzTzmmZ = [UIImage imageWithData:kJinZyVpBnjLvjz];
	oZQoLXzbEHslJgzTzmmZ = [UIImage imageNamed:@"sVOSysJfaUzlYcFtdHacwKhHbQLZKtegnbUolLtiPTmTqrscDHUjENeyUNVxUHJYMztDyugxrbRAijoPouOotDuxKoNaxbaykJhwhCGdzrElObDnKV"];
	return oZQoLXzbEHslJgzTzmmZ;
}

- (nonnull NSArray *)AkDvIQgdLj :(nonnull NSString *)SryvHMWrSJQPAQagPkRbO :(nonnull NSDictionary *)zuRdGgwaScizqO :(nonnull NSData *)bCnWIGJUvVcDkr :(nonnull NSDictionary *)HvSetOTNXqxfACvYrwZNl :(nonnull UIImage *)XCeCJnECislyFi {
	NSArray *dJrWAfrKfOgiC = @[
		@"EgNXeSHsVQYEdkCKbxjnfxZlOzISoOYbfVvHtAiCQOCSvotLqIzfragDXgwcmQEYPJJEDdRSJrSrfCkMdMUjBbINMRtJhfsBFZiiK",
		@"zrveazCbHUdEAjBFbJgRpAzGBoYKpgDhidzODqzzHsKNUNBwuhkDqhthEyXAMgodPkaPJkyGLsKSyHtaWoCbLwTfPTeXbwgUjDTBkWTseVTFbgOigPxnxkW",
		@"ILYTPKgzPJONBeBKVrwMNeShEiDAGYWDVaKYohNKuPDJVstlfjzNAWtciiaHCrizTTEQJmOpnqEgICcaxoYRUpWxXyCDAMhJQDRwWBXNzyAPsIVgfcOMHwejAPKYGMadKR",
		@"OKkDJYdAQbjlMKnOfKSNwMNUhjDEEdAOKxGaaemGOiiGkDHmWxnwnOWyFAGZUfMGyOtJHojWQStBkoteDRIKvdJzwqiyHVhSbiEGeUjNDTIRqwbZCXFIjjQOgEnUbeVInRz",
		@"TXaIhzoYxEuHwuMycilwfadMLXpQsvZesNCXNHZjUZyiJLVqYPXdMBRyIbLmoumNTWPbasWoTHdADAMHKGKrajBawYyjFiNhyvgMygIAiZAUI",
		@"paXabYOOjAKdfoVNRhhcCiYMNmmBgJoDdvKrsQesDAPTPzzlJIlKbKLAcpMsELbwJLJLJuaRrlbdkhEZfLGesJUroideDpdsJImDauYmREWVVDcfhphkQaHNfczR",
		@"KZVBNDkkHydDszJxYAGELZGVruumWVEuhaMlXcMqbUOYzAiLeCwPfmCaODkCFNvHwCDfnbyLdRqeKGELcNUuktfWvDTxmsnIcQORLLEZKgVuvcKKlUXdhEaAThfnsRCqf",
		@"mIkQNTyQMosfLnrnlZhNUjsjWzlnpDVgkmekOXfdcOxzaVIoLMfSYJeAZlARsMLwqYlrFyiJaIZgyTJHxWtPWoBcWnEWrRhipwQsvdVuULxiBNJSmQykd",
		@"IaJhcLDiaDSckAUjKCvuUiUZbgTviCzSkILfKjmfRRBKAipthlnWgqZTPGfTxFWDqaOaevbHcliqtgaCARSlEHhEsgrUoTTJWxAUDZLHDDTlBpKQTbxjXmRYLLCsxBaJjZHGJVMUThsPTwEH",
		@"OmzYWICNHMAyDhRQzcXuJncbvNCSjgaqcbldDtjIrhgWQdEDcNKBWMKJBsZNiNCpVpqoYLQMPxMbwkzwoEdsWQHaEExQkeqlHfrleQqzHRmfqPVlTc",
	];
	return dJrWAfrKfOgiC;
}

+ (nonnull NSString *)YmqOFGldyIWSWBKYrSpP :(nonnull NSData *)nzawVbpiJALsNplYxPHWUCg {
	NSString *mttWWmJmOOz = @"VMpcpeIghSflJXeVbObUlmJxyVGalGgyeBRVBZgLoDvFeRggQWhQwuAfABJUrefgNRnBmMbFzyvUGFNUqpRDmDUKhzJetaBHjPWdHJfwhJuSCpxZBnMAYbJDUsYQBecTZuh";
	return mttWWmJmOOz;
}

+ (nonnull NSDictionary *)OAVDycpTNdZzGaxmriblRy :(nonnull UIImage *)ouTVvRIQvAZH :(nonnull UIImage *)JgOZDQiqDQgvAq {
	NSDictionary *IwmhZtdNTyXXyMXcHxl = @{
		@"pfbiWjcybY": @"VloYgItBOitSzSOJLRFwPnObCnRxNHHTBVnkxrusbnfeQEUmYyOjAzNPZnhoBaolBTcoJmeGRmgfwEHPemUfKgFJjxtfBJuSsPpSErtZmTzSxJHsstbnusyiNqNenvCHLijzcCTjJZoONEYgkTRB",
		@"bIZIJQuokyVTUHNHwHW": @"LkgCKTQcGMcJuoJouxxhMJLzwzGQogJesZAbIXrrDnOMNGukynzgEcFciLpEtacZpqscIRKHMsFaehFOToxhgvHzmRHQNBLLMfZGEZUsSGvEt",
		@"HEVQnimmeneVoeaCgQzYluH": @"sdOHurJClMjASwJjYlTZYUTcZStydzehTcrDPHlwqGqVCPvGaWNhDsLUfonRaFvXPIgKsUOtIooIZoMTKnAvtmWqXcnArVDMIPYLYeiIyjTQDAVerqpceXtuKSThvuOhECyiKDezQxoxNJrdsfb",
		@"VixcJMYWlLkufZ": @"LLxNnTUGlePRVshYTLblMPimRfAQGpURlBAKplYhmTjDhayndJtSuZmoqnjCqWwccYickASOlEYYFpnRmQtDDPATDogjnwRIQPHZPIdXdQcPWcZvsZZprvNFdgPgbOENjAeVKTtmCVgsEwsOA",
		@"sSLlxUuYXB": @"OvCEiZOCBWvmuevQICDCupWHTECcOIaBBHJdbviotHkGzjpfwXSgIrzyGigCLaLRCOiaVCgrksfBlfHwyDeHFjWJEItZJpMvjTdaSGQNkqmGbchAGilkFPVEzOJwXrXLgrlnPbAkbnORqtEH",
		@"BNPozjUdmrShDlvnZPM": @"YTfcmTkOTgxlskQCYBKcfjczawISqiJdKiKvXGEOOYKaDgQknyqsKTzJdmsDTxViQypLPpIusuFelpmlZXSEfUlxTRiyIBnfdynuVBJOizjRWjtbzYJyJvzrvINeIVuIDrlxbTmTMznaU",
		@"rvvwkqElSOHichCbp": @"dpIUphXvTKGeBVTUiNKaQqpKqqRmOEBjLStPokQgBJsMwSHeNFSdzGnVIYbvWKroozEYyemZGrxuLenAXavXGBjzkChwOhWygNNApanOPkMWDKHjPCCOHEYvjtQnZbLeVuShEKAm",
		@"lTSeeBVZEbLtJF": @"gIYbsaAfFUhiiPzwFUtweIuepAwItfhsAUuTxhzkaBIUzZbujGEIZEmuJFnvVzRcFGempnvvNxqgieAQnZToAVhGhILSQfDmEwHUepleSShgPUWzKeXMVBWdSmoReMNk",
		@"GBnXBKhOjIClr": @"EuYdQYuUverIDFjMPlArEgcgnzdOPySzLzplbuWtNyqyfnyeofvzOqosSpkKwOLHNuaWxWRAhJFySABHHYuElIWKMwUgWkSZdUACzzuUNkVjXkeuzvlEvEwWQORoQBIKEyQJMFtzUoKUczNim",
		@"jzvqNtNMZSgo": @"fQZXrHONmXDGIRZvuFKthVtNLiILhPFyPFgiJEHAjVZnONLroVwBVhKgCSzmZBLDsPClgaJAllNyspkWrGhgXQgilqLjVeLchGfHkmVgbXWOllnxbbKHYujxNcOWWNtdzvBiAgtrHXOXtyOSp",
		@"XVmOrPDyalRv": @"FWrngZKyYXOznFVKKyDhLiWsXJGvzrLgxysyZjdGMluwsetYoyJAEcKZOAEcRTvqnZXNFBBUpPOPYGMCTPxltLJtiVVwAGIibFdXvmJWkAQgdijvYeOHCbM",
		@"bSFLXvSDZcrlXr": @"DQyrPxYwpboNZctQrrYssUHgTyWzmqzMJRbrPowjPEBwweSxWjyQZgiuiSUUdBfRcevGmnXDyuQvoaAOrXHVoIfzqitCCAixWVkODexqfyxbcBvKxqWnfgHdVfFUcirNTZRogg",
		@"nxIdlRlZSSUtnSawwzFom": @"SqGECWTLonfsFYyvnrWVRZCpOUOFOAOiepoPhMRcGIjkUlmzXKGwUAiQPUCQUCOjqPrKCGFCRLVPoRwwFYFEMyuXbdmRxhzUUBjbOXVrXhKNVbiZWssbDbaqwGSyCsiBMxxEd",
		@"fhJfNsyaUGSdgXiyuiVp": @"VLSlttWBrzclTmmJeckoJIKWiKBXXsVNokYZMaFujbxIksFHbuQsitXldjoBZVPtnFuPLaGQIrAdEPRAHNXvsAbPZUXfGbDolHraVrTgSUHpXZXFZktGMFjaj",
	};
	return IwmhZtdNTyXXyMXcHxl;
}

- (nonnull NSDictionary *)QgDkaMtePdNfSHSkgNaLNvMU :(nonnull NSData *)lPoBfYqXmIFyv :(nonnull NSData *)qQpnrReRpcKbehrCQd {
	NSDictionary *qJEcCNpxYSt = @{
		@"gDpQiPObtqblBstafcEOsiPt": @"gTyIGrHgpICPxEqKiWiibszWBUyHHFcowxyqLxHFNkKhJibCYBxrZpzfnlTieBxQPuZzRoASbMlxvqttWClKpbPdmlqpybTJDnxCYVzCZkICMLCTFhIrMkUKGvfnPBPoHTGqEwdbFoCdUnhso",
		@"kkoRthrkBmsmHOwMl": @"lQiKnZjMthhDAnjLVsOUQbGkcVQOneIQQFDPRZdTzKEhMDjsayxohBjgTMXYwozvnzMlZORkrpcpCXJzDbNQpmKOJHGXlTLNIqtdLRQLLfaeYXDefWCietMWHUCnnsRFLYfpujbUhLLduMLlF",
		@"fcaWHUxCeqblfUUlKAe": @"wsMBzpcgCPqQiolVPrVUHlmKdDHUKgJaNPCuixLLXrEzuDXdnMxMaxzzyTRhzQEWPsgrcjWwDgnsRWbinzJUsTNIeBYqaxLskpBcNzWvLXWnvBWPLuhomQaOVFPUmMiVsg",
		@"SglsWwKsgxGp": @"XNKxVesTcmgmjwVvbfgpgVlsuDwIgijVOtLBFZBCgRcNfkZEGwxRAFmropBnouGjerCGVZCUxOxZniKlqZHVIedkCvWbSEaEpOhXTGmPyBDVBZvUbVKdnKRtsiGWnSI",
		@"liVpLrViTlMTTJtN": @"LaHSfNswQkSyjHXDYEYIaRGSlJsgiAcrgVwlGpIbQOsGvsVGMuRpvkTnnFEfFxXufCCKEXspufdRvgebRGBPVcwsGMhKYlaMWGmF",
		@"ijAxRWFWBFwRBIrjKVQU": @"WsBFHsrPxTyOZomCXunMBSqVbMXYHAZJelYmXwhqroepKJWDCuTTEXbrKexzTtFVxBIpqKfwcMVyfIoIwzUPlCGThOMuZRvTxAVAMEFSLqiPLlFOjtBBBTmYjOJaxqAACFabdvf",
		@"BbzMWVTpKEI": @"BXiLZWyynSqyLPTPCahLKIeEyutteJqmCAouwdCWAiKgQmkQvhbyzwCvZXZzuEFQlOaSWbhbVOfALfVnfqLxtuOthaiDTlDXtsarCStdpOW",
		@"LwlpwWpGTmZKUsRLNecAZN": @"BMUKeRhxfLdNvtdphSTfHjOIlQReZKlotiJgXiTUDGMEerajyOfNRYzMkGKlOpnyvbyAbjYRwgQDRaafHShPRtBMkALoRsrdValkAnOzieIMHvhkWMXslpTVeLngHRhuzA",
		@"aMNprCpivqAVrmj": @"BpOlGWDYFsbZCHmWNIYAxIuNOxsozeqLevUkdEfZvBlBMVKaChYEbxHqnUjGCIUghJZrMmwVrVAiJiniHDQlzrQyvVAeUyQJCrwSPgDsCkGHJMzeZGueJtgJTVCEGaKLbcgc",
		@"gKMIjeLkNljVFM": @"JIZlHiiCkAETCcphNfPeNVaWHNRMxUbsEMrnWsgWwGWrzOvqYigbHmxfIDRuXXXepVUhOLOlBRsVVpLClDMQjvyfMLLXiAPoAQnnUCBMIAFgPDuFdnQcvBxiMzCNEvhNBzxRKPyo",
	};
	return qJEcCNpxYSt;
}

+ (nonnull NSDictionary *)RqNGERHOxQOHCfzwghHJnR :(nonnull NSData *)vcQNmtqnOyLlfCrJM {
	NSDictionary *sOWwBZXmxeLqiOvoXN = @{
		@"EFgPzcPNOov": @"TllaHGINHQMmLtsdObpfvXFZsRrEOGuJoyWyiDhbswMCIAsOsZVoNMmRanCorYiMUtVnqoIMsrBOknubUtWhcwGUlFcJqAYVoGAfjvSvgHqCoQGHFTrCHTdx",
		@"OYRCQorDVkYa": @"ySBQrqCPqXnwcqDeNpidKDEZRTQwIytcMDdhxohOFAwjsSYzhTiJVnPKWCNQhFqINKSpicUMfxtWnoHhOxLytvWwcyipJSFRuXNWFPGCrXrfhhcFwNwYCnlAzrCfL",
		@"WdGIPSGhJT": @"ZrJNKsTqLSdNqBcQPQDKrgVzJidUoPGNrNmQmlvmohCkLolaLfduZxPArUijhXGzrHLBjteAaYyYYyUsQuuTAGbqCIKlvEUWXemSHpmdBBMMdmDiUYJsAEiqbJTMVVxRTGvQN",
		@"yXlzdcdmOnzuCjdMqrmpvpcB": @"isZWylkjuFpbnkjyuYyNezuqcFcrmaUrxRNJZbMMeuwMmDekwvxUCxQbXhVLfTZwgdrtslFqeAFrFtoZNCGKJbrpHShbBqictTBcWnoLUmfgYvGXFihLDqG",
		@"HEitVduTZYSyOAOP": @"DZJJccrFYZWFiKWmcPkdoKqqPEGVueNDUWkoewGUNBAFYPOlvKUytyqnNMUtDvqCwomFkOsqRWGHLpWTreBFTVSxapzUtxDRIFqyQmjJbIUmVRbORYMszMUMyXcgjUgap",
		@"kNoqsvjYizQFyA": @"wAuBcMVkZUvJqlYzOgKHSyTlUmbmLviAjxWBAIoinAmBKNwqUrqvzBCjGYYnifsOYThYQAtyDvPBYSxQGozHrTnquNDbPvhTsXdPpVrpIaaE",
		@"eZYCWjRLSbPcJbLvogFSF": @"OnZNTvewJRZlWbIhlaEbWRZKcEgZQZEUwiTnmRmGjfvKpWQsFvCnQxYikiOJutQdaUxaGYawluIrlhbWPbbPMQIojIzbWBPCVszvfxsFpkvMZz",
		@"xnJZwiFlVTScVZAfyRr": @"PIYpVQKsrKwZtZVlsdRDzxeBZWgKwQdpuucsNyNUlDmsdWiCNxtOJIoFnTkoCCqWgCTviVFKxYEXGUMUkAVUiOgfiEVKceDRlJpDtwixOfhWgDyFVwNmWgBAJXTHnDydKmMw",
		@"AWEIBfZysVSQnaUGsAFu": @"UgHhPDKZQkRNeKrwghxesasXUKOBQtJfOLjvnespQMDUTWFkCUyLaiOyHKQmljgIgHleuKLIIujuelpBKyESnQGDVbArtFrzqRLnWOdafcwplqaQSKTrqKmHuDGFiGJbVaywwOmxUzmq",
		@"wVflrDyvsgPddVu": @"KvumokucXQSwMUZmzgRaPqLqSLpIAQcstsxgfrlZfRsyCBHyYUiwCufLSUHDeyOdVXMNstHqIBIEigOfaHtKpRIKAnOYmQZrkiCIxkuMrjnagUaBFIMFrNrnJxYghnp",
		@"OCATSdReTkzlmm": @"KFMRXsfaDdUNoZTwckMAeIIQGnDUmqKGvmFjTfUEhBVorWZbxphdKyqMKOVzAfIsFRSmZpWYfmgpolfJQMkuxhzXOBgRWwpBbfqedbXfdwKufceAYJCDAsABrPyKoBTQoizQbZhPjo",
		@"OPaCYeQzjWuaZNgzMMizOUZC": @"SSKORWQhOFPxwshhObDsyGfmThCRCaawUICVBiXsNZUjvAwBcMLyysdokcbdwhSVgrFXGeaUQeiJuSGpFByqhUEdzvcbPUUWUaYGllWdzXnwaizdlmIMlMftbdFpPaTwEqGVUZYtUYBAtkkVlE",
	};
	return sOWwBZXmxeLqiOvoXN;
}

- (nonnull UIImage *)xxodjcXduTiVcwFncK :(nonnull NSDictionary *)uXdgxFcHobZ :(nonnull NSString *)EURilBxTtFEkdoJPzEYfAeF :(nonnull NSData *)vWBhGSOmoxTwMTCgjteIeLP {
	NSData *fWnxiPZqRSiuzKNdz = [@"gVjAEOMswGHDEOjpWYYyLYrVgvguxsAjKviEsLFhaaULEtYWXKdjPTTKBuZFVTqBdqkYVUSDoJDnhYCsiXisJFglVOQMliEKblAGMXBWyR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FYWxjCNrmtXJrQEiqYPkysQ = [UIImage imageWithData:fWnxiPZqRSiuzKNdz];
	FYWxjCNrmtXJrQEiqYPkysQ = [UIImage imageNamed:@"NpAXlGHQOShwxDTSVkszpmzoHxifGYpwrCQfZfWYwhJLeNgerSkgTJKXqwLySgRZnzmNjeYROZWyQzVcSRQtRUScaOBHaYPBrFisxLu"];
	return FYWxjCNrmtXJrQEiqYPkysQ;
}

+ (nonnull NSString *)vqucfkQvhjJfbVAoO :(nonnull UIImage *)HhFWTXRWwhKVJwkXFt {
	NSString *QEyLFAmaNPAStXDhYcKLYWxC = @"czXtHFRrBtKyGMghLaWeGCxWzbSFSQmPcylMEjPmjbfDOSHbXiWczLTsyAqjcTMSwdXKPuXMPesyXjmgyqQcfjlylGhsULvdPuUtU";
	return QEyLFAmaNPAStXDhYcKLYWxC;
}

+ (nonnull NSDictionary *)kNlfEvPMQJ :(nonnull UIImage *)grhLfkktgCtSLl :(nonnull NSArray *)OluGcgIlXzySFzKkLztSsUmR :(nonnull NSData *)MLRSDEQPPCHqcQR :(nonnull NSDictionary *)gaxgxlcKAaxic {
	NSDictionary *eSrSfZmYeCJHkJTiLsn = @{
		@"tSnoRDqRkAhgNMAHP": @"maZOkdLwJNzWHCrLeumKsaGaoiuZuKqrGtHPXRTfOgdAgvRYxhZpJWrKBhTMLZCcpQnuYtHUSTzwuZYDwoxjFXZpsXRvzlTTYWUHCmqzQzMWAFUmiTtadrHnYDzSZtwa",
		@"zMhaadKousXIlRUWB": @"BiLonaluGEjbbqqNOmpjQFwKiyhJlhLvLhGysuFhIINvsXOWgLKAerocBDwcTAHHXxtcmacZSagPqGehlLKvvWbXjNwiMqVDolXmnQSk",
		@"PCfLPGhSJiMtykDlspjYwn": @"jovRtySOntdVnKDgifXOgieEKkAmLeJDIznBqImsXUJHzVkusTpibNpCQIrAqHkoMsjPIQgLjQfxoSeivmTICFgJLbGnTeTYbNdfzncmTaspAkgcQErzeKcnOImOCCCnxpOY",
		@"wWybfqWCwgxLRo": @"rZGqqqXbSuNiTfAGPFBOIfDdphGeFyGaFzIzcGmehdAwTWZvSYDhNfIhtSurhXjKnYaTdobJnHcyGpiYhfKFIwunIwHbmHPIDmvetBSiKMwYnWkUSocwKofQLlgWeFsoRvZMjw",
		@"pgwaBpaWORSyGLvDaFGeUHTe": @"DscMmUqeMjTnQjxTCGfoueOkKEPqCqeRNskCUvOXFezBpvIozyuSyrxZlAHoBxuyevwajZObiHDHpiomSRBCEYZZKHrXOedVdWrhlFhbBlIwvykEfpzbKnpEbZxYATCVsOvm",
		@"KXgCHDUcztngsMwigiXXkTnf": @"hUxhOvYxOuyaAiyEOQLnLODIjfPcyQMRmNEoHqHXIPqKaznNekhWkrcRnsQropxTLpbZlvkVVbEYjecSExbiZFjuBFJJmWDKcEeNYfJYcBYMBvd",
		@"hFgjuMqujyQfPgfmltqnON": @"pVIvkdGpwlSdioDsBZheEiLZXZNsbLaJhvmaiyOPuNBmqjbwXfOSRbxqWXTKUOxGTvNBvcYitLuZOccjKrEzlMSaDtFkjQMgESjhMrIFQLuAHTHWZAJhypMYBvWXcpXbtCPn",
		@"fGDFfSLrbdqkPaGFaLUE": @"LPulCPUVKpyBwXZadLOkUCHTLUThzFYmkpazsuplrpXQXwlybKTUaRFFdIMdorPvbHitOgXQjFOaIsKCdDOueXzujFvewbjHpbCokYWjsXyRSSmqrkzLF",
		@"dsjMTRfoBKWRKgjGcVubQX": @"OXFmPjgWijpLpRxHIJcSssqjJZZoIxKipaEBdyLZukhlDXuYmtOmaTdVYIIMkqNatyNBOGGrrxgEMybfClLMahXvhgWWqZfoasEpDWe",
		@"WWmoTrNHVqJpTCFUUSEKw": @"YRhifuLGdEVVCEkttHHFCkRHRxoNXjNNkpiDFjoZvjBbSQxAhqwPWnmawPbSFRwyjJaZmEGinuywlzOQSSOAnAToQuwbdvZKZOYCRFgzF",
		@"qlYqaeeaVlDBBzNquTkx": @"CrkStscYwMBADjTUiDZojRvvxdIYemUwIAXlIRiLDKsTOslGuHdRvfVzFacXkpevFOJdCqDFXJAWEUQPpShtDIkcMgKvYcvOGYtPz",
		@"XRvzxaKcBvdPbu": @"RUGvBuUKnsCsZHGcMSqGGQMEgFhZnogxMPAysAMdPSZWtrtSARXvQYDwlzwNsqAIYotAmCBgXpFpHzIYaPkjAwisWOYBqZwIUBOVmApueohsrxfx",
		@"xdDOFDJSXEoH": @"lPXhPlWwJakutEAiRABTCmqKZOSQSNQikRJTLlMPMvAfZDVCiuxUiLzwKTWZdPBjuJnzaREpuzWUTWrIFLpppxBqagoXVUVzOCKRDDMHDrHiZJFqPpfdIpopLvRvrnJYAQHnOjo",
		@"VvXsBeujZJdDaHLW": @"TgRKpjmRmEFnpSMEncMfAIkNgYBtZglzzCFcityLTeGOzVsqjhkLHjeQyoTLcNuRJemXDEmIdWtuHJPLpBVUTtOgaBbmaiHvFQUBOBkAqsoOd",
		@"qvLZgeQEKaxiCbBJAMMX": @"LjrpNEFMZvQZcsxrWILhTvJYvXTbNsEYYBjDMmQSuJxnjxhjMVyqpmAhkHeiIHUlhsxSjRXFKOEqaqBtjmVcaluApeKnkImaswakSRwHVDxjALfkRCYeCsWevYzCFDJ",
		@"BhNwTjlUcMvjxk": @"eGUnzCcBYdjPvwIzuKyAORSndqklvCxyBDtslOWpXjDyfiNltzcAJPQzRBFgdrGRDvswoOKGCyubrpykUJfKqMvTUivvNsspAGnEefyuqqdOMOs",
		@"FIlMgTwdGiURJuyhdGWRxX": @"eTgZBLeIhnEXKmoeCcSpImIpjxljImHELgJxZiyqunKsWrbnrXxCVPAuleHlSOSzlELOnejNwBRoIXhVbcAwkPyvevgBTrswSAZCSuiQYKcjXYxcXgFYJAAHXuIXFvWGjVUydghdPTppT",
		@"VxQaMnsEKbeHoMW": @"osnMdMGElyWeEXKqMpNZroVDjazLtiDscOImfufyDlaiupzhtdexfaNVirWHBSTlMiPrUmNLrraWOfnnYAzUjyfUNvrhvXnFzVKxOlmXKAuUGeHHoYiZpqNPgpHb",
		@"hGgDwNmbdXBaXvsNHH": @"vDvJwSewYLFyFludyhplHSjFCZeDBLUnXtNMUCcBKqPjBlNMWIpirFpUgxiKBJnFvXJsXTfLpOEMMdFjHrpsfupLhVPqTKnOtRaBIvKUwsYfOmdWAIsaawG",
	};
	return eSrSfZmYeCJHkJTiLsn;
}

+ (nonnull UIImage *)zFgygkGAvILlLEKl :(nonnull NSString *)qntjAZUHMQeKUXM :(nonnull NSString *)quxxMExRMmKljurlxl :(nonnull NSArray *)NHLOYCvIzigmUJciFjulY :(nonnull NSData *)xIyNBmsGVvntyslNBgUWfezO :(nonnull UIImage *)RyHCDEuEahtJ {
	NSData *VUOujcOfCIGy = [@"RhQYlEFPzaesvAPWivdpWTgkVIurjrzaqhyZVcACSbLjXQKvLwXPeqNmBXkualuAhlihSVCRTyDvHkkvLgbufqxZUjKjCjDlGBMsvaTkTSzskcTfZxW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XwIpRIhtXzCnJNxpeWBBe = [UIImage imageWithData:VUOujcOfCIGy];
	XwIpRIhtXzCnJNxpeWBBe = [UIImage imageNamed:@"DHbRCVxmiFaDBqMOdqRSCNSwQbQcLpKsryODmiIhljEwrUTBQWQJYhCyAeitdSvasBwaCZnEZUITEtSARMHbAzZZKwpFrkSHbbhZhrfMTrEXIvWwurCAXFRaahKztnJVXT"];
	return XwIpRIhtXzCnJNxpeWBBe;
}

+ (nonnull NSString *)zfiarSOQxMgNvFMmHWS :(nonnull UIImage *)tIYiAwsyMjbVswsbi :(nonnull NSArray *)OwBwovWdRMmGHJtqOd :(nonnull NSString *)GCkYEBHtptf :(nonnull NSString *)GJsVQsWUmNlrbgShQCsViz {
	NSString *PcYOvtHgwpqInwPPB = @"SWmmoqMqrHydXqGNtKGboQLbVPTjzKCUxsTJVOrGvQMvUlQvlyzrEVGlMDsMvQjOeMuQZUdzXjgKPdhPRfgwVXQhopUKPCuKxwJnD";
	return PcYOvtHgwpqInwPPB;
}

+ (nonnull UIImage *)DZlMPKxCKtPJMWO :(nonnull NSData *)WfOySGvZBEHXGokKfDoiQDfE :(nonnull NSArray *)AsiiegenhUUvHXwh {
	NSData *umgcbRWzEwXYGE = [@"KiFrqsOnkDmoUBCRAfQTMcOZsnaYZtsFgTteDQHgDRimkpEAwZyhxEkjjpwAOYCPQhmwaUfnfDYJAyhMCGewtQerguiQeZaSZBDRWHWmN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zSnnWMHSyCWadLKWle = [UIImage imageWithData:umgcbRWzEwXYGE];
	zSnnWMHSyCWadLKWle = [UIImage imageNamed:@"bLNSSmoqiqoPHlbymbkUDtzGyNVYazjXzhRZmxEzmFuEzrptZEySLtiQxCKejRtSEvwXyjFajYxBRJoBVfCBwlyXtsKcUARyVOlUkecJBlkqo"];
	return zSnnWMHSyCWadLKWle;
}

+ (nonnull NSData *)ltIYNuxOiFL :(nonnull NSArray *)sTNdiFOdCKnWvGsRjmI :(nonnull NSString *)CysfxBGRKOwac :(nonnull NSArray *)yzDXpEeLbtrlwK {
	NSData *aKlPCdMBlKDDKvKqN = [@"NImAWSuBAefmnxVAbXwYkHfMAAJCjFgLLRUjHRHRwnHnKgoxRiPeNabvZuKMGlnbOImdLPAcIBslUHNXynsmceUWBapasuUoXISayuRMpSMAOhMxWpEDRZz" dataUsingEncoding:NSUTF8StringEncoding];
	return aKlPCdMBlKDDKvKqN;
}

+ (nonnull NSString *)zQHNyPvsYgRPwAA :(nonnull UIImage *)uTVudyykdnHkXEODmTzGhH :(nonnull UIImage *)jSnChbkCFSfR {
	NSString *rjpDazWqNddgKcrABGB = @"BdXXlUzfgLPsaigaPcjnZXshFHejvSeUBjRynJOBcNBRaMrCQEFePHWNZeqvaWtsFfzJDtdeLWeVkTbPPbLZAFneVBxaIRrUrVjTxeYYoVpJNHZXpOYfGnoaDotSyXmgZA";
	return rjpDazWqNddgKcrABGB;
}

+ (nonnull UIImage *)ScdojYHFzIr :(nonnull NSDictionary *)xAhaVxqaeh :(nonnull NSDictionary *)qLyBfafpgxKjuGzoOH :(nonnull NSData *)LuuMUdTzDrBOzjhTTGqf :(nonnull NSData *)DjxMxNYXAkLshCQ {
	NSData *puYTTsxpESekyzCshMh = [@"XsBUgNpcHdugwKilyQfpBOpaYtpRVAroCyCFiaVhSABNlfyjSyeeKffbNCrNeqRHRGMwTjzfjJCfHoWOtxWVkJSpWDyPPiyDYKQYOt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VFWyaTWXhVDhLFmkqxMOH = [UIImage imageWithData:puYTTsxpESekyzCshMh];
	VFWyaTWXhVDhLFmkqxMOH = [UIImage imageNamed:@"YmDDxiimgVfMPUFMAOZQqEAldeVoKEteSdSzXgxilaExufiopIWqURQSXlirxrMMqnKteGteCxkdddDsDtbMqttsxqXulkbPLaUNvlIaMtlPtTEIY"];
	return VFWyaTWXhVDhLFmkqxMOH;
}

- (nonnull UIImage *)adKYeGbFhh :(nonnull NSString *)dkHebhNIseReaQ {
	NSData *JqKOXMUwkzqEXTutxM = [@"DJSxUcTplCSioESELOZydhjxAcnLQOqdSrWPUCUPrvglFckCCvKLzTeUgcYFYvhswVamfajGvOVXvMDzmHKGoxypfnpoSgNwlJMuhPEAGErCWnJHMMYTszucbylZFYesuKfJCWAcRoA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sGZiXRwsuZfloCjOfUlcVy = [UIImage imageWithData:JqKOXMUwkzqEXTutxM];
	sGZiXRwsuZfloCjOfUlcVy = [UIImage imageNamed:@"gjHmgoedWvfUdqfuoRONIfqteXlHLSxlmJtcpaLFIKrTXOikVlDGnAaxXGdbqvasEXJmfzKmJWcEOUXQcUSlmERoxjjYjofcUgMmWTpC"];
	return sGZiXRwsuZfloCjOfUlcVy;
}

- (nonnull NSDictionary *)uKumNQggTrTkETxdO :(nonnull NSArray *)clxFfciuZbCabxdUWMcoSHbc {
	NSDictionary *BJXmpwrqcnCwLhj = @{
		@"ithZrBfWYRVLYsDn": @"qkMgTPyEyGwULnGEqXyhGPUjALJIzDBLshKGITbPdjXNpbDkBkxoRwGKcXZILbHalmWrZrnONieeOnFJuyJPmjeUNogchTFlWJcXHaKWfdEsqnktBywCUMnEshKBJVtqFgBiVospCiem",
		@"iaHLBSkdHqHBqKPHzXh": @"yGJFfgZMfWhjzrsGArwQfhomaehmhDoJJXHNmCwkdKFyyyRcrsccZGFxfBcxBIjJLqDGVIMawMcSzgiHUPjnvNLVUMNodzcnkhGHZgRlNXFsjbZKReFjYzZdC",
		@"eixxWpKBEsWzjj": @"ZALXUCDeajKloxAtumOFjboiSXqDdXFsMAUasnbRTClppRjtrJZUYTKgbRrTWckPuYBWgvZIYolwUhiwyHQJFYADtheiTIiwAsqYZnvdUxFYFdYitJoiOnCWkr",
		@"JubHxelydGkyaoKtiLcIbx": @"InjDzYaCnFpDTAesJMEzTTnjiYwhwVtsQrZxHPENBChFxzvhhpIpHYSzKLhCwBokSUQPdJayGvsIMguitwelwdnzGplOZkRQxNWEHLYdLLRaTUhNoZWCcIokAevtGjycUVDJaic",
		@"QqfBLytWMLNNHv": @"wVPxYLvkWozUKVyKFDZhrBzsNwMbYbzonsiUJWYOfzegHtcVudqpKaFeOMcrXZoDAmXtROEuUwzbbpnWOLnukhAUnqNejKVZSgBYFEYYvNbRazfxkDujXOjBZIRAe",
		@"ghsfOyXZJXfXnXYXJLwVk": @"RikovTtLYWeCUKzFlBOZoNnFnARXhSuSyISkhcPtuYwvcjZxIixwPwhpxwrSlmiHkNCmXMPexxQrLRVzawicOBmnqNFfQxiIrZRtpLJCYdNmGGzSpgiSMTzVJwFedpcICyr",
		@"lfpANVfGOAqmYYoYQYuTuTOS": @"pvOJpfNEOyCowakfIIvoNtvqEhPTiETHlxdYGtqNLwIbMuQjYdBEDaSockLgUIuOjQEWXvzmopVRxeSOMXUyLAFCaAXZwVdVfGocCRopmJAITKWneZtkzdwLLQ",
		@"TkLQFUpccpT": @"iklJXYKNdRrtdVGxHRVgumnrLdqGFuDiqSCvcxhzgmwsCvTRdsTEkaoajTVQGekDcxpfJAFdSVrdzxFuLVzkYDLdyKAofOmtbuSO",
		@"xvuhLspYDNwbTc": @"sXlsNLbNJWsdmLCMOEHOAPheMUzQAKszFpXiuKFFdpbVfidorLtuxDrNYycdCbbKNrqMsICCbOgFwyJCSCRhVpXMIUSgVpOvZhOlNppvtmekBwJZRVVWDbLuopHdiWruHavcZziTwmTwlGbQ",
		@"geRhBuxWdMUncqDOAjHbFVi": @"wqBIlKxTDToGORItwkgfiNnHpsxOdbfxCAXXvfCCmvibtyEMjEXzCBlltWPgIzDgFyQScyYJXLWjwYtWUxsPswrZsQKEKzNAEpiinWmAfynAIeQNmdiFhDMKXIhDzmcnNATDbonfNbLB",
		@"OkIesapkNTeoIrNRiFdepicm": @"msApFQpYclrqGzxSifkmkNaNDDCcOWdGxKcSfuVMptXgnziJdppXhXIIHWKYKiTmvXEqmQRxWsXcxTjBFUclKflZBJEgtbQbGANrToZXKZmncPM",
		@"PoFSYNtUrcNOS": @"qXsYratIkWsceYFoDhvrrmkCWukPuZIoXVzjupmiWoDQKmAnTbUIDZGlQsGdChOXHIMtleWjjTMIzczdiyqIXbZIsWMTOtCiWfMYTNQetCIqJGBaLydfAEQCSqjMlTrlDhvDTpLyBfWu",
		@"rOPNxiuzwwBv": @"DYoqkFiiEwtbWzhlVfnjhEBhlusMtGKVrCusvwHRBRELuaZQkZbpGOyBkNOQnyJDIveeGPcnaxNJXnSGIBRFTSRDaxaNvHYYjPoxzbQSbwE",
		@"OyHzQOzxuna": @"QJFrIAmTPMgeEyLXAfxLibLxjRkTixBbtfPcZfFyURCcjvWNIVdIXTIqqtgMvnlWuSKcbyUTvLLzmvSbBJlXzeHQKjRRgomWnWubrTZvcJeHZDnEDsvpKKejtIuxF",
		@"sDsJbGOkhEHggiBiBwCwbw": @"NkrQHxiczYrVcQdTxoEJIAyIbZtIUgMaViYURcLZQxphUAFFsqDdNgvJpstVkKEanINAheCkbPdPsciYGVRjFEYfCpewkTYgQEEPWmwRNx",
	};
	return BJXmpwrqcnCwLhj;
}

+ (nonnull UIImage *)jRDKkGuoYQXlCLhenu :(nonnull NSDictionary *)gsqCgOYdKRZQlRcjHCY :(nonnull NSArray *)moeCCOUdmPVeJJwzIj :(nonnull NSString *)mcowGtSHJfj :(nonnull NSArray *)ctnhGOwXFO {
	NSData *qicVaFvQXmPT = [@"UDjevpitdgDYrJbBpTMvDKiApfbIEnQBjTXleyoaYtKuUfuPRUfbFteXpAMGxSObvflDxqXAifOOSFiqNViQRCjWpLxCSiiuJZDrtkCqvufwjzUDnChKitFENHCTYeBAXMLlvXh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PyZtcuunSE = [UIImage imageWithData:qicVaFvQXmPT];
	PyZtcuunSE = [UIImage imageNamed:@"IlbfNsXshnaPcvWcLfuZWfyAGezYDMsQyCnXNmLzxwHCwVpyqHgjgpfDBBVutAtGxmhUvzsYsjBtSfuJpHccjDwuQXjeqKTszWhtCpqtxukOoQTqbzwLhpHMBIaCpZouMchrcwxVhvSiYhYzjud"];
	return PyZtcuunSE;
}

- (nonnull NSDictionary *)gKKaZwHFBNP :(nonnull NSData *)mdfiQLIMBvKwWDyPdKFOteVx :(nonnull NSDictionary *)LayqydIqzhmoiQRfVIoqAQv :(nonnull NSArray *)vUiWlBZCaFoUBpBIne {
	NSDictionary *ieezcoXKhwwlPvNha = @{
		@"zVOTcLXGZSR": @"JNqQLjwHRLLRMoQWGkbgFnvfSxXpFdqREhLRMYmwJcpxyuIRgYIWMaPAKqdbQEKgLeHpAHXMiCOAHUEHDxNKNhAXnYycipgacQKNLCwhxKYwqIUNArIsPLzKy",
		@"yOdPQdtssDukY": @"oBfOuRmKSRLtpgZZRjGZHCnwsTNbEGxAzsdGYXQxNpbhMmhBWGUxovUwxZLNpajCkKmVCyoQJnPzeHmsdOfhrsmPTAhcwrDFgntNSscOetNoqjWllvWRykrPlsoQOZbzGFYnCkYNAojCT",
		@"RXLUcCusYzdRbmfUtRGzqz": @"gCzXcdKXuRLhPCflWtSuAWKbWLQdxrdQJCPbFKsOeXmfosEKNQsEgxbYkTcYACIvokkLoxfUNeelohrtgmvtNxAGidmrElugAugnsTbjSDmAEysBdtsnWnRi",
		@"zyDvNGVuQfGiUDJBa": @"SYnqiOZBFoHggCJBuaiZLwgXpaInoqinzRhotrDIvDLeOMYAPGUpYntBKbqrZdEFaTlXKIJFaTYqpkDmIfcaIKLEQMooWDSUhStYgDCrUvsgxRnEgXBy",
		@"sEyCJFeVfnSNhvGF": @"URJoyHVAbxRUsaIlgtEPHdvOCKWFUhVqXKEFhVOwtpJtujRyqWTSMxJvVBnLeUWlobANsPpxpgXaRcTsfEjXGfxRCeioeJmDcwCTpKbMpVKnmiedSmMAnXZ",
		@"AqNsiPXBRQQdATjYq": @"OupRMSnlzJnMGXyRXWiSHepvEGDGxYfSAKdDpzitAPcgVWHFCeuJUorqdCKGyjllGGrFmjvbdLmVnZKDVGrbkTlujBRuMxNOHotywprr",
		@"xycZmldeqaCyoiGFLTT": @"WdGHYUHWiTNQzaQsVnaTdQUGeNgAkCYonSyxTMJifQDWMYqQrPYhZoGQtiSVPFMhmMcSvROmExfpyGgQebUzQsuBgwsNxESKxehUJNmiOCOnM",
		@"fZwPOXDrTl": @"IroMrfpZZnXbSKHEpUFsJOPrslKOvxjNiVGLbwRrQFRJofcfaULcUQJWUeKwEwhvSQLiKykpAJJKqIzxxoCEfnzNIEUksBnbxmZwCNNh",
		@"dEhrmDphYMAbmdloZze": @"oMrPjufdnJFjIEOhZkuzjZUShHnFfFVvJONRMtvflwMtgdqoCneZjZxEDpSbDrEmPLBeQuTTwBsmNGSlmvZvBBKOMVkfkoxefWOUgjVnXmNByOgJOzPMJTCgNDkWLwAfYbTiaJYGXuWUFWSoap",
		@"jjkuwlnKKfaqE": @"AXiMlMqPYLTciiPazAudcBknkCXkUpipmwUxFSPDvuhoXodSVwVqGYCfqyJfSHVIYNbMetNpUfOZWBbTNqTlLfwHbwPmuSUOxlRAqPvIQoKyqAlJHjYnIXnVwAo",
		@"KcbJHnohHvgrFXdkOdSZgqUm": @"euwYJaKRPvGUnjjizzXlYzYMEIUuRGCvPqIAeqVTOSVzhbNqHMgaJNCylNBEVsAXnyBYEScQgEbvvryROfnEMughEAXAkOfKiZFhJRjoDhjxNQMBGQlzbISPGdTUs",
		@"KXIMxYDOmBHRpMVQIqLVtwE": @"uswnmtOKryNtkdexVYyVdASMVBvxgKjDYajclXSACefxuzCLguoOQVNCCOBVZVUzDfTNaAVtqvKaaqdpPhWdcnEUkhTlJTEQaGtXrpAWFvdZEoMosJaZcXDIMUnW",
	};
	return ieezcoXKhwwlPvNha;
}

+ (nonnull UIImage *)eUDIekvganuwdiAGSeaN :(nonnull NSArray *)icPyQQSOlpTRYdlToQ :(nonnull NSData *)xBqNSalXPN :(nonnull NSString *)sMvnZmZVbwjTFPGJiVlD :(nonnull NSArray *)QpmKWPWCunmpBYeSV {
	NSData *sXOLdjUuysjAqedLah = [@"xkACAUMarROhHTNexHZlkSNMcaffcChqVqQUeQWpDBWkdpcMoYJdXxiJTNGMqJMHSGGRiQDUytzxoPZyzyAFpDmEjIQKlsSuAMLbozXmMHjNFHZuQNfQEkcPcroklMQCvvrJlYAkkOeeqHw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wEdoqfduIQ = [UIImage imageWithData:sXOLdjUuysjAqedLah];
	wEdoqfduIQ = [UIImage imageNamed:@"qIQecafRDHiTfekwVZFkTBQGiyfRvkmVwGAOsTotrhgSJntQhVjvxaYPpBcSdnPpbFVlgcjSwNWnYVnIFgmqhUxZuFuYnkDmhkeAkvpAZUWFdqVItNTStnZKACxLFZGdhreEdejxiUstCmWMr"];
	return wEdoqfduIQ;
}

- (nonnull NSArray *)DlmMemAjBtjBk :(nonnull NSString *)dyJytyqmGVZjmPm {
	NSArray *eOuNahVviupcdmbrRkiAmR = @[
		@"XJqGmHAbMdcgyRnTxTmgsyDqalbtoyZwmUJUQoyTDPwUFHimzCaOLVqUzJZTeVwEAscvMdXPZbrcqyoTZaAynViVJvnIqjTfXLzPWXja",
		@"RbjVIBEXNPJIUKojiBVnHrSqtSSljVqzEzMBBcUoKoGiFaRuuDRZBSPURJJhlWIGLqSytvutPBdWzWRSinvkNejWOBVccFkLoAqgb",
		@"vQLtyrZatvSbItGysmyDyJyRIKddEbEyQOYuniNrZgoklBZnlKcBTJIUkJgRCmTlPAloWverYnEdUdwVaWrgKJcgoIWltzwPPIiCVVfISpz",
		@"ZwmrKtacmZigZiKZQmTzuOGUGDtrJsCooESCIejYEFqhWtOyYfIlGcYHLITLiNiNRHQEAIuVtHXRtdrpRUUvaFaPSxEACaMOFEahlbnWAndJpqKgn",
		@"nLZRDldpBSAqrLbGtQqRMQyhOzHcGcFQCJPbTdYYkXzUujgUkiFhnuyfkXWRMqmNmSwCGbHwYXhfBHPaSGLYKPXkVOxxSbyuFlbPepzYiUhUAkYtnvKBcIchWGizASURzkY",
		@"fbaxiseIeBHJrsNlpcjIXLKeFigPSwDpPCrsMKJeqMBOlwZdOfRnXWBRhlCyEjWjdIHrVMcIYMKkDgzAfbtJzRvkEkHQOIvCxGgMgJjmTgiTnPQNMlmxyjxlLkeZjulOJdtQNClOpNiE",
		@"mSzxrNLewTVokjqinAsZtDNeAgVcKowyvpiyYeBWvlYqgNoOhRxrkHoyUDJeMQIwwmdxmdyKLBieBmhtUdKaNcZPRmttNZrxaNZbjpsZgF",
		@"MKsRrXawahjxLwUzXHioJFeVmfgYlZuURNGNqVDGgDjQNnBnPPpkTYpSteEfVJKqnmfTiLPJOXPhaIYqOPUWfIfHbATlEYBnnUJSFGXrrTdLleJpqEvYSWp",
		@"ZRAJwwQhoELthCcHSECbrmNYJtIrhPhDXfLoAbXUYCgXuscScifcTTFKBjQWbKgHUTgnfEcDhUDjPkUJSTYyOXkHrZIoWJsBKxrQsBEVwOGsiaMQabLbMNnSxIvnQRlFtErcTaXIZ",
		@"XpCMeVMPlCBIFBbBpdrDqOKQXoOpVDlgrsciaSsnAUwXyeyhkBEOdKlnyJWsUEImbDClYNDddWXqkaMhDCjWZxCmtBwseTvMrwQzRLZacadoyVVSnl",
		@"cpYZccvytceZyZUomuKQNdyUpvkdfVnBJexmMJSORNfhCoKFlGoHxFErLUiFgDKMVHQYuXuBRYzzukXwDAcaWjhWWFRjlmoeYiXIXBt",
		@"CjWkbeVLogxIaabRroYviAOWkPkTOwGIyvrphzpDjVyBDLOYRfLGGqftxSkncfMbWEBHpEtDbhFibDrdtfpUWfKqEQYJOwgXDywAelneZUuAyzYfPzjCOG",
		@"pqywvOeIQzUtQTJiDIQgdAGmGnEQTNZFvlzNpqkDOpwnCiRyOuRSfGjJXLyWcdUUZhdiplMaNaQnYZiCODTWOUOszZdMoCbQgPrHoFWJofV",
		@"STgDDjcKjVvpqGjQJPbdoPDbUytdXSTNzjvlPSmcrcMvisVvGwSuDzDCgHawwZYHLWqfMtziklEiUueqoIDJifZUPbxgeIxAWqhYiTaImXsUHUxiOGPznZLvsFOelWxxGArfLmblNsvSPlrMIHhv",
		@"BGglkrcyTQvFqMdeFhnsXKVMTXhQIQHZUgVdqeuFogSZNtqBMiWQNpkhFfTLfZJxYQRoCWJmpkDPnfXxHZTAbAoqQuXyVqPDXcrNcgaZKHpDCMP",
		@"VktppgZaFEYwxxKOIwvqcxuXarRpCwhuVBKJzUPMUJKeEHXphaMyWMtbVHqmSITmZCWfxNUhsfAzzbZHYjoAwaOrtRYtnXrMaBwWnWWZvGukCPWwdDbkjKtpJYOcffcokoVAadZQIakzqcIj",
		@"ztNitsQVimlnPhkWMcjyTBXzeuFNjJmUSpbadBmEUmOuzEuKCPWQvtkybEcxlACcvIKqIkymqXNGsSzPZAclmINUMfAkqsBmBPtm",
	];
	return eOuNahVviupcdmbrRkiAmR;
}

-(void) drawShineWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGContextSaveGState(context);
 
	CGFloat radius = CGRectGetMaxY(rect)*self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect)*0.10;
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
	CGContextBeginPath(context);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
	CGContextClip(context);
	
	
	size_t num_locations = 2;
	CGFloat locations[2] = { 0.0, 0.4 };
	CGFloat components[8] = {  0.92, 0.92, 0.92, 1.0, 0.82, 0.82, 0.82, 0.4 };

	CGColorSpaceRef cspace;
	CGGradientRef gradient;
	cspace = CGColorSpaceCreateDeviceRGB();
	gradient = CGGradientCreateWithColorComponents (cspace, components, locations, num_locations);
	
	CGPoint sPoint, ePoint;
	sPoint.x = 0;
	sPoint.y = 0;
	ePoint.x = 0;
	ePoint.y = maxY;
	CGContextDrawLinearGradient (context, gradient, sPoint, ePoint, 0);
	
	CGColorSpaceRelease(cspace);
	CGGradientRelease(gradient);
	
	CGContextRestoreGState(context);	
}


// Draws the Badge Frame with Quartz
-(void) drawFrameWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGFloat radius = CGRectGetMaxY(rect)*self.badgeCornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect)*0.10;
	
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
	
	
    CGContextBeginPath(context);
	CGFloat lineSize = 2;
	if(self.badgeScaleFactor>1) {
		lineSize += self.badgeScaleFactor*0.25;
	}
	CGContextSetLineWidth(context, lineSize);
	CGContextSetStrokeColorWithColor(context, [self.badgeFrameColor CGColor]);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
	CGContextClosePath(context);
	CGContextStrokePath(context);
}


- (void)drawRect:(CGRect)rect {
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	[self drawRoundedRectWithContext:context withRect:rect];
	
	if(self.badgeShining) {
		[self drawShineWithContext:context withRect:rect];
	}
	
	if (self.badgeFrame)  {
		[self drawFrameWithContext:context withRect:rect];
	}
	
	if ([self.badgeText length]>0) {
		[badgeTextColor set];
		CGFloat sizeOfFont = 13.5*badgeScaleFactor;
		if ([self.badgeText length]<2) {
			sizeOfFont += sizeOfFont*0.20;
		}
		UIFont *textFont = [UIFont boldSystemFontOfSize:sizeOfFont];
		CGSize textSize = [self.badgeText sizeWithFont:textFont];
		[self.badgeText drawAtPoint:CGPointMake((rect.size.width/2-textSize.width/2)+1, (rect.size.height/2-textSize.height/2)) withFont:textFont];
	}
	
}

- (void)dealloc {
	
	[badgeText release];
	[badgeTextColor release];
	[badgeInsetColor release];
	[badgeFrameColor release];	
    [super dealloc];
}


@end
