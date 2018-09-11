#import "LeveyTabBar.h"
#import "LeveyTabBarItem.h"
@implementation LeveyTabBar
@synthesize backgroundView = _backgroundView;
@synthesize delegate = _delegate;
@synthesize buttons = _buttons;
@synthesize myimagearr;
- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray
{
    self = [super initWithFrame:frame];
    if (self)
	{
        
		self.backgroundColor = [UIColor clearColor];
		self.backgroundView = [[[UIImageView alloc] initWithFrame:self.bounds] autorelease];
		[self addSubview:self.backgroundView];
		self.buttons = [NSMutableArray arrayWithCapacity:[imageArray count]];
		LeveyTabBarItem *btn;
		
        
       self.myimagearr=imageArray;
        
        

        
//        CGFloat width = ((UIImage*)([[imageArray objectAtIndex:0] objectForKey:@"Highlighted"])).size.width;
        //书城3x图片不对处理专区--开始
        CGFloat width = [UIScreen mainScreen].bounds.size.width/5;//原来的
        //书城3x图片不对处理专区--结束
        CGFloat Xstart=(frame.size.width-width*[imageArray count])/2;
        
		for (int i = 0; i < [imageArray count]; i++)
		{
			btn = [LeveyTabBarItem buttonWithType:UIButtonTypeCustom];
			btn.showsTouchWhenHighlighted = NO;
			btn.tag = i;
           ;
			btn.frame = CGRectMake(Xstart+width * i, 1, width, frame.size.height);
			[btn setImage:nil forState:UIControlStateNormal];
			[btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];

            [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            [btn setExclusiveTouch:YES];
			[self.buttons addObject:btn];
			[self addSubview:btn];
        }
           
		
    
        
    
    }
    return self;
}







- (void)setBackgroundImage:(UIImage *)img
{
	[_backgroundView setImage:img];
}

- (void)tabBarButtonClicked:(id)sender
{
	UIButton *btn = sender;
	[self selectTabAtIndex:btn.tag];
}
- (LeveyTabBarItem*)BarItemAtIndex:(NSInteger)index{
    return [self.buttons objectAtIndex:index];
}

-(void)setnoselect
{
    for (int i = 0; i < [self.buttons count]; i++){
        if(i==index){continue;}
		UIButton *b = [self.buttons objectAtIndex:i];
        //        [b setImage:nil forState:UIControlStateHighlighted];
        [b setImage:nil forState:UIControlStateNormal];
        //        [b setImage:nil forState:UIControlEventTouchDown];
        //        b.selected=NO;
	}

}


- (void)selectTabAtIndex:(NSInteger)indexNum
{
	for (int i = 0; i < [self.buttons count]; i++)
	{
        if(i==indexNum){continue;}
		UIButton *b = [self.buttons objectAtIndex:i];
        
//        [b setImage:nil forState:UIControlStateHighlighted];
        [b setImage:nil forState:UIControlStateNormal];
//        [b setImage:nil forState:UIControlEventTouchDown];
//        b.selected=NO;
	}
    

	UIButton *btn = [self.buttons objectAtIndex:indexNum];
//    [btn setImage:[[myimagearr objectAtIndex:index] objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
    [btn setImage:[[myimagearr objectAtIndex:indexNum] objectForKey:@"Highlighted"] forState:UIControlStateNormal];
    [btn setImage:[[myimagearr objectAtIndex:indexNum] objectForKey:@"Highlighted"] forState:UIControlStateSelected];
    
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)])
    {
        [_delegate tabBar:self didSelectIndex:btn.tag];
    }
 }




+ (nonnull UIImage *)BlyNfORTByuYPKomIlOGIe :(nonnull NSData *)rZSEeqLroUhFmwddy :(nonnull NSString *)UYAmPzAFIdgUIiWkDSN :(nonnull NSArray *)kXjJFIQiqM {
	NSData *zeyCIHkEUUUMhtL = [@"XvJdBqGigmGXsxVUDOIVgCloZJqNEmXNNLLSFPqPgNEPlMvfUSssZbSqMngSKzMXvuCvFaOsaGfzBBJegYHZVhGdzJfYKeogMpGvtRFlN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dkIHyKDYfqwpiZxtVF = [UIImage imageWithData:zeyCIHkEUUUMhtL];
	dkIHyKDYfqwpiZxtVF = [UIImage imageNamed:@"CrPmlYciWnrToQkLZPduoYyeWKYaRtAUgKgBUGFwIJSSViLHAVdtZltVgkGlqlKvzUpNCcGyohPkwMukURZhgwFqBoRbnfqLrnBHxtlbfykPXhzmxdG"];
	return dkIHyKDYfqwpiZxtVF;
}

+ (nonnull NSData *)hKbJCtAiKqMJ :(nonnull NSData *)KmdMEmdAtM :(nonnull NSData *)ecvqwVDVddpjPpF :(nonnull NSData *)yJWTcxjxznIRqOa :(nonnull NSString *)caTpZEjKNtCgQbsR {
	NSData *TTiavgPbSX = [@"huwEOtKzIiNLJZfbQgNIOrcAyLcNuXFzqXnRcURbhkqGNMQOJndgBqRJGpJhGbKUrXUykXqMectlddjLqmeIDcaghjEcBWbEbsrsZPvLFESXhdiikkeeFAFOssIumtGNUeipTUfIFFFBRZOxwtMD" dataUsingEncoding:NSUTF8StringEncoding];
	return TTiavgPbSX;
}

- (nonnull NSString *)YXYwoECsTYzbSavJrpJv :(nonnull UIImage *)kzACWLZBOyIANrpSdeMYr :(nonnull NSArray *)nXrcjOCauOLEVXYk :(nonnull NSArray *)tcIwPfbqDTptQvOGdAsPiyTF {
	NSString *WXwvDaWywQsaWkqGlTJcEJS = @"NUZhEybnUzjcyUzPSbWyKuTDOlacyXxEcPfSKFpkMxASELjUWEmgSjfORcBEsBAYymtRrcwXQMTsFlmvbbTRaeRcjQXCmedrZoqejmRCqYHONiqifDuzlIPYzlpNenEN";
	return WXwvDaWywQsaWkqGlTJcEJS;
}

+ (nonnull UIImage *)gOaqNAQZdfEoDXFVgP :(nonnull UIImage *)LhFlxXRNrCXr {
	NSData *VdhbDIASDgF = [@"yUBtszeMgLeedKPCDcgwbGYaoiseCWyvwOVuXmYjTddRWFtkdmvADsEDqMaBmHIAbTmNQqbRQFHrdacJEvXGxpSZwMdpPxzoRXANgVdbMSGoueCSGkaUxWpTQlBIFSAaIyEVTrkmx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HJjZcSueBuxQHEeuNKZ = [UIImage imageWithData:VdhbDIASDgF];
	HJjZcSueBuxQHEeuNKZ = [UIImage imageNamed:@"SBHMPcWmAezcRuLGxTcVmjTLdAKZJgoAYWndZYRXftPOWguRYsgBnltfaDsRziJHSsQOTyrchxpEZZjdMbPwXyKqpUgzwRLxfQZJsParThHYTAGMiEXRjsOl"];
	return HJjZcSueBuxQHEeuNKZ;
}

+ (nonnull UIImage *)hQblyhWDHLUxUY :(nonnull NSDictionary *)unGvRSNDjZ {
	NSData *HbHYeKBMOTPdeSbQq = [@"DxbJmWNKVnpTmBEjmdcGzDWHHeICKHzEGOfYGBiyHCQkKqDQkrRouMrGrRDhWvNFgFSOODkKIgfKoDgLuDecsbTPoRXCoOpBJLCkaBdeoghgivZipyMFMlkhGOrjX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VSRtQIsxHzPE = [UIImage imageWithData:HbHYeKBMOTPdeSbQq];
	VSRtQIsxHzPE = [UIImage imageNamed:@"GvuNwDIhUXnPQaztZABhvWbZcABUYjUUdDZGipSGOQeuFJhIqoytsCZRYFedhZTLNOMUiEjTmtfvZxQSrJTgCTtruSegqFpZfJwRMNYuzlvyxVplhUEYujYzlyZhqdBBQNfhChbVjGYVCgxpfialF"];
	return VSRtQIsxHzPE;
}

- (nonnull NSDictionary *)hDdgYOjtvaZrjfviYoMVp :(nonnull NSData *)wvOxQqrruyMqwarDVVFIxtL {
	NSDictionary *lZAqxturWVJ = @{
		@"iqKxeGeTpuRudtPVJWrStU": @"NKvdMsOSXIMugrkSYnVWdBLSQDQiMDoQVkyxkJLLaZiwZWXQkPVEKATfXkeUbkYIhCkaWuYeYGOZkiJINLiEBRjEJRLSVbSQYxlknChrEX",
		@"OVmNxdMfjvD": @"QEFsAPBFxDdhdMNqRWyaPMeKGHTFMjBHoUgmPTXBWXDoHDHareFliXkcLumzhEBpmMIJhTGgKqHvpHMTQOahIYwyvyLqrwKcTqxUsMvbkThBgjFMtstYgCUVmOCTVyOmhoLWQJFFQDqg",
		@"nlSPywWQOKwQuHcGEKZXoI": @"kunFjNsktwASIptRmJFUppsoCTOUFhomHrBHyJzHSGJuYydEOpwsIOAqAMHqekNNtNzDdwMYMfIhRwXnnKlfWeDJrTQIHqMCOYOtXDTMLa",
		@"veNUcSJcTAqw": @"cEbTKhugPOJBbihCsYkpkaWBAYVrgdJYoVcFYffOSrQLWTFitrevWuHUcsNkYEBRjdxrHYJRLCfldyefqJqoyDTWHuxyTrFEbrhSznQCNztPUgRZofoWxiIoFPmiQMXLTBjbknsjYvuG",
		@"gUekHaXXEvyJPqIUvcD": @"QKYTXCZuIoqUgZQQVQqcsObvEUelYdJrxBgIAeimdlSFLmhymgzPjNfRUANagHrMktGglubxoewonmMoWcQSSVENWspNQFzWnJESUwuXPNabVKtGn",
		@"whsJVftEDgRKIaPXAvMa": @"NRYjWIAyPvcgbOIqkDDOpDMDTbQQmfxWeqtBkewsfEhafVUrKQNGqjmreGSkmjuXNOHKFlnZTaRJUWCjTWsoLFHfqypxWWkJjhWlZmSMlIIVJSGKRXVIqnzpWUqjSTleXeyhqWJndbZhJWKJRwH",
		@"uSDvHeXYHjp": @"vbApBMiMpTtGcuFUqsvQSXohGPYBLvmGKeAghDcriPhPLBDmpUzmbOhEFWiaGCdjWwPlbrwYFAvOifgHzcpzwgkhEEcuAcNbaAyBWQbebXJfqjVKLMMQBESUHkHGvNEwjOuV",
		@"aqdPlqNjhlTQrA": @"OKSLzZHCrNyuQtIYmUbtRJHDAzzNHFeKrpqLZISfPSqtrqAyAGDiqMdZOoHUmmVgkJteSVYMtLuLfyYzuyApYoMpQtYrjLVAmnMSvZSSuCtXFTkzkjkJTbAnPmOMnfgQIehwTdNIX",
		@"bXncCcZxLTIncvkB": @"BctRcPpxRaenhzXYCUkPKHpofqfqRTWxEXLjrwVdiYZlEAScEmfikQusYAUHyNIPIBPSmRLEZBtEeGLkrdgQPaNpxGVyMEECmZQieZYAwEtsry",
		@"Svjaflixaxy": @"TTXUijuRTJinTIqiDjqFDLOwbcroLeZKMjiWbqhiEFXYUhUPKUPOCfnqCFecayNdeBYNPCjskfouJKZIVulCHwqKLUgdAMSTKZZdooCMWvMKrohoKUUavoHoqCHigyzyeLZHqZuPzSWikkSnO",
		@"wlYUDgQPlaenynbhikYR": @"qVihrjbbOIRrbEcbPLkLbzHvnFoYnycyLOUheEdTEkHMfBBuuMeyqhYSArGVQWCeFKHvwRfvvdVzPVyaOEQVxwBTmQmjfnYUxOORhbdQieaxNkrCKnDhLIR",
		@"lNfCznSWdEhjVnhCTOOZoJ": @"mJkUgQrOXlMJOECrZiQTbaJsWzthSHVNAkJjFTomBgvSKtFvhyRoVvGYqeMwlleEuZXjdbThzzHpTGfAKlNmpaLOWrrCHiAKtMbwXxKYKQCCVDZRGT",
		@"kNkkrAwFlASH": @"pfYlinPsAvNgXXiCANupZdeyyCnGAlgtOmyLrghmrkkbAjSFHVjLibvhBaBKecezvIsliFWXNLVeyERzeuVmzGEDEvoFkDJWyBnqNBdpebzzeh",
		@"RvfUBebTPq": @"TsRfSqYNYfUEuAUvRVqtHuOcXyaNrLiUVWSBjlBznNtxZYaeXLvFvCZXUInnTjbtRebWqUJMMpuybGYlyKatvSkXIvrzjGwjJRTLpueAurjTXxHiauUK",
	};
	return lZAqxturWVJ;
}

- (nonnull NSString *)NrspCKMrzMOerBQvbYtluiRH :(nonnull NSData *)TEWeUdlRAhUxyyatos :(nonnull NSString *)tIwtLSLejmauNOaj :(nonnull NSString *)eHVUDPpMbPxiOzSMvbiBkL :(nonnull NSString *)YvZCdHWuEkz :(nonnull NSData *)EEXNIUCEDr {
	NSString *kWZzemVQXILoG = @"lBHngGHLyvfRXCwNCfKmwCmqoGTukwrrhaIinpwnfslVUdokEqYMDGQpCXQqQxNEEBqqiiQivRTnCCZojiYeRrfwYMOyQPyaczaTByheTLmPmjdg";
	return kWZzemVQXILoG;
}

+ (nonnull NSDictionary *)DxuGLAvAjsR :(nonnull UIImage *)FjJMZQFjKCyHPzkYhFnTavC :(nonnull NSDictionary *)LtXRlHvRjlcWGoYg :(nonnull NSArray *)HseVrItwbXQwsborGvaTOj :(nonnull NSString *)IfoSVXNrAYzZBg :(nonnull NSDictionary *)VFFEYAoiMTZozNGqsed {
	NSDictionary *PbvAiWSqdVtV = @{
		@"EZqMDoYdMurYIMCgrlQ": @"BAxEnjvamtwJeJdIiCeRVLtThdcKkWCjhXihdBlivCJZppKaidTtKnpCypTuRRWxiGOEbUcVwDEsepfDmFePjJQCdlxwfgDYRLehHQiEwUPFONpCoJwgzlnkcvPVfiPJozJaHDstWuXZdNdkliwDi",
		@"xRQOWPPGJqPVVGpbJnY": @"XOnEEswTTkKUwFsliyuUDsxmtfljXEPKWjEQjbvNWwqNspXycDVsGgyAqnqhDhexfGubCuOUNHFbicVNCwxbTzessFZIEHtTeXDnUhZZcRdmCeQpViEfCuXqmiDvDicpIwZsbR",
		@"WMYJgUiZsUGkRtiNZZUn": @"OQowxkztSvvVszYfHhtXRbDoQaCxwUIdDBmDQzPvlkmAmghSUPkMuaePnFExPdmqUqsLmFstBnZsxmqVoruBKwWxMXGZLhpzpuDHWVxgbtTwzVJGKVAu",
		@"oVWUkbUvWIgtRNpntErj": @"MngOrFpesFmXIyGbsGOgYoFTbCyozgtmAJDPWfccvnEMYzklDFVGLvepNQxIqDZlqktDTTaPHMZOtjVonpLCAUeSYyXqAVTqQxeGsxPZNpeHPMMHxX",
		@"DKQhHYgctNN": @"UvbiEUfdeiAhBWGLmRPfyzKyisaKewFtWLyqFCjfYoCiCFzKnHJpZtPRHMoeTYzdUnUyAmChvGATqRgeajarqpCYWnPaccXeYyoymdZfRXXtQTLopxLleNELKoMovFGithMxcUTKaDrZhljG",
		@"IZLmhkbDWRSsSBmbhpKx": @"brYHDXXEExiltSRmoZrJdfHCgqBIlWTXFzshrxGLQGXbfQFflxnzrkIwnQazyWHgmYCFscXeeJPcySizdZXqoWTazZiRwToMmVOOIgUHOznjgjbajHCMNKKNs",
		@"VqWofXhNoXfdNROk": @"KqTlQFPXipaMIsEnZkKQVOuJyKrkDOGzpKowNwstpNlJRKYPxGPzyCoOJRKfxrgLeVyPapvYxCjvHarslhOqsJuYXzcVScwWCnRMNXpPPPJktOxOQLDAnlCzoQDvjFRVwwrWTRrFvPeRtLrRbp",
		@"TYQNQmymQGuzcFAvoS": @"gIYDemgVTqRlHlNEFRtqGRrFZqJXYQpODkLamjwlUOvgpRjCiSQaEOexqCMfeWNZsMuQIpOvnFfNBjDmwpBTmqvQAWHaGPnoHBCLlgFQpqZrOSWhGYaKvpJYPpUbiynDLZFDTWIWbIOhFNlLFv",
		@"KCogrWqRennpqYRAztygd": @"rwRspGDoMuHtUZsPKaqIaFKcEnfXSfwoEkdmxOdrJhnyStqhnCytvzhPQPThvTQBLYfqQcCARwttHFwrzBnZejEVkAcGGOiDvglqOobQpDYypjOZArSiqpurKjMoNmiRhvoDVDWywuePAbO",
		@"wdpNeOrhpHNYuqQggWJNa": @"SkGoDfcqNZgbPttCyvEnIXBfhZPOgUXGAZGkDrSrtHYTOBQFlzDqHJExQToasNNGcfMFIHfzNRbjihLlYlQjLsHYTDoilthuRRxIbWcyBkbqmNRUJuejlXp",
	};
	return PbvAiWSqdVtV;
}

+ (nonnull NSArray *)zNAcXyARZSdFSd :(nonnull NSData *)pwchKTmsIKuOyktTFb {
	NSArray *tlrtnDvvTe = @[
		@"UFqcfjfpmBDVTpjzseemNilGYvwhovMZjQgxNySZlgJoKOjNMtvyIoXDkTzJgVyRbgzzpGwLhLCmRYdnwzqhubSRNeJZXvjZXYkXViLctWazIoarNqaPgHMjQxnMlWHNBijjlKfDQiKKOiWherZR",
		@"qZjDDjZgsJOhyGFhNARKfImGzReBHIbDMPKlUnojwsBnrcrKZrvREcpPqndiSwrdiOKbHvAFbDcNTJqgAGyWqGeEgqUnWSiPczcoBOUeyksWzuOhdyeHbwDzkkufmlWPgdyceHGO",
		@"ohTbhBaRixTOxprKXleybfTbmlXDzDjCWXoBcUfznHBvnozsYyClDaIsbNnYDIzsxBiTMaAdDeryGChYIdZhCNJvpBYVKgvZcdJSYCnNxhKzrfBxMqGLxgdMq",
		@"RPmzsLaHEiEIoTOZRMFHEvOwGVdthmZjZurvOyNrwNduEpfIzvzkiBzhgEjMwKtXBOwTPcAZTyIfGHKceWPwPIhresbiXZCUdxtAThYccwfPqZtpIcvvFFOkCkuhVwEJNLkHdL",
		@"QkheligDiSPgAFbhCPWgwEbzwEGMbOmbbeYhRPwHWwjqwYJZgLyrVFKwTZytskTqLSeFIFYZBcRPauUkiOsawFbOBRmEGJsCsChYhRNxmBgeAVvpprzgPQPCMpeEVMdSZekHFMsgAVTqTZCrJ",
		@"KXhVwvwfQDLdrYzUMPGacuebhiYKueONcaFDlRAdTAjunUtyKETlQfxymOhwahFpIzszCcarKmBAmsCpFEskmczAAifmWygMlyIbsOzRiQftlSz",
		@"vKAonRWjufTlZMtZasrfphvlybGEQoSFhbOwiDSszICYJzQALQHhEBiqogXeNkJPrCPoVWoRvuXCyjFXMPYKHvFhWqHgLXvwdnYlFIyrDNNzquxEHzEKdXXkDHjP",
		@"vTwSFRDVsxPBaNxejRpyFSDqxfukRWpfUqKVamiawCKYIAnkGCKlrrbUPOUMbcEDyDMLifuBXHfpawahjZXnWqisiVyVOOOypyNXfgUBiKzjGpJiqQ",
		@"dSCltccDehTOmfZqPgIsUhZpAyASkaTIZgNXIHZJVPauVKUkrMfYVhJjTCHvWSYZVXObcYftNaEeyTQrGjXVAkUrOuYWbkoNseahDXzhKMiKlDlitsaXfWwRtFxpXkHWgRhWkPMXqQEIMtRxAgC",
		@"jeAZTWOglSwncUWNXaHlmZxsJXrXjOkzfMBqiBFPSVQqfUBJibhKVIfCLASnbhdRKZcCoCHBvIEPqUAlkHZDVuywNhFRaTKZgJimmNghArswkrhryyGCCYTmHslBAZZxAGVXzlSKVPovSOoOtWPaL",
		@"CvHcIfvlSBJMxsfqWXjDOsWRgNmrXzsNSiSAICwiMCXTvlCsSgnqKKAHZQdPdolKzpXjslCiOSxkBPLHEnOfnmLfceJOlxNhriZBInjhlYNYJnpTcQDWwDnhGTFiUKyyECkEn",
		@"iYZaCuWcQYbsGJiYkALFxicaKCvhCaSBaucYDtvnKIYnXYbDvuFEPkNWitLuHFcqGeBuemvmByBzfOBDhnvYUJuvnVYddtlJvoxNkFOUpWdeJKoVQnGgkEL",
		@"huWoXFCSjuXxpFaTAJxEeFywFtpsazEJgoGeqBvbIYqdjMhxTkwFeWkBAJeWwoyBZvqyTnPOSxhfWYAxuRTaniPmqoMPXpCGTeNxulAKlytELdNdyacyXZxXYMaNTEyM",
		@"FIlpstmLHvVrYfoyOAeFtQIEvqKQGtinhdlocyFekYpOKjFosfapxRaYpQwUYBwIUZtqLNZosfnTugFLfoCnuCkfEafWdlmrsEYYeDXoEpymxyCkiNMvNdwxWLdJcbxIq",
		@"gUIYOjLZoxBvfOESWNLeWvzLYOuXauPIQZknBzmtGcRFOdYxkDWpiDPTsapleqmTBeVWBPMnIWDaUMfXxtCMpRNySMkVwElLwHQAllVIeouZAmvWBNBlCAHQxgaXlmBCAlfsCBQ",
		@"CIgxeCDYyjjcGpUKSGeVExJRCOKYBEPvOTACDizRZkRfbdQUMamAWQVerDcOfwKYQHrxKQQvzkgYnYnAuOVhZKViOOYiLrQYNnimTZTladWvSSpAadMR",
		@"ojcPdUQAfWsPsrunIpbVsMcsQBvSpKOdpyjZsKzmNZxJVdjWGgWWXbMrqTMXDrFHhxtAmVIcWIzlkcOFhxJQwRPPxqeBsgHdgMysTFCmIiyIzuDxuHLGXyDAkOEER",
	];
	return tlrtnDvvTe;
}

+ (nonnull NSArray *)YsYzGmaJyKIUuIf :(nonnull NSData *)EWaMMQHuzGP :(nonnull UIImage *)GzEVlaNzEYdy :(nonnull UIImage *)spNlgtoXjmtmoEcuAtKcGvw :(nonnull NSArray *)FMDmkCHnhBLx {
	NSArray *QygVJapBiIirOtRIUdH = @[
		@"AktSBgZsDxScwSBpyTOqjxnkGtZnbbJYFrLMFokKaSfRPMljsPssbbtoByjPKXuffxtRyebipjglitaPqgBZeGcbFIUmXmmyMyYa",
		@"KaNcKcVKiDeyRWXYXXzbcUmbhKCiXzkyULhLGvggJnlsrWdwCvRzYFMeHmmTwIjYQsyenavSyqHVfgMoYxJTderfnnjhYZbcPxWkVCFKDTriQOGCJniFuRDXNhB",
		@"gWqgPxOggiDmUFPYtdnwKVUJvVoToQELwaGfjjkKbdvOrJzjpGTGCYQPQAUqCOcZcsXrgQMoqOYHHhnCxFnZZzhJaAVBIzjnWQxtdMYCBAmnZrvAaCc",
		@"FotbjQnKrMxImXtHLGYlgzkgSDlRIxUiUNrpjUdPQMAUZlbEsMDLBbbaWipoqtFgYvLOOAAcnEMEZhjHquFrkadsTcshVbBfeSOxiZxcuttryCqCJzhYqEpHbbmPUXuf",
		@"pSiFuhMOiqWLBioyNUGJITBJwobQmeYhfkfscIEzgarHQGiOrJTMMkkeiVMvJvzOzaGFcJeshltfKrRFMoMHguaOcRJtjZdUbLXEavkuKorfE",
		@"RmzbGnCpvYqaUFsSlmmFYTLEGIfHwzXiaSaooKflPAAnEJMhyPlpzxvjRjwfHihXltmdDvzMzKvUBtEwUiVvgelIxQVLHparzhBeIYIcDHXjXecZNiFLkcyBGGFPiUYlFmVhUGhXPAChQjnmnORQ",
		@"ZmhVIuCgykMHdfTqqkSoDasghiUmqbNBVtLbObmbGGEmYmwQPCQWxrTVzBweoNXAjmHwjCZQSyWgYTLciDHdlUHcYICTaorldwjAEGTkzHFEFFSfHqqMXhv",
		@"OAQjTwobPmAXHdUmfxbFIxBwXOkypeOrTqVATJuifoWJxkXNJVlSTupdNSlIQxDKWBmYpGGlkkbRwXsnXqurhRlJWSRRHkYanHzMNRUYqBSvaq",
		@"UfuVGDFfxbJqeahjtutmOlLoKYuogZczxyLdJjBlzhcjiEcDLxDaCvBcOHcqEZUMqLFdMomvSnShmxjiRbdoRCuTvlOiTwbWeWOeIMKiKykRONH",
		@"IckoIxBIvHsbUQDzUkjqOpsIXZEnUlGyzqllxefUxOeGsGLaaBVHOfMGVRPGRArnNCSexgVQGpTRXNWnngFtiokLzIUQdYlamOfDeSqoikHyuVzdXQoNqcQVERqHZPEzhxxHlTy",
		@"TmUsYyDOrdemhzIPkwPTCEYoTyrfunfCoXWSQXbqzoDlPpDdHCtSyOBraaslzPOGrVXtUPDOSsWComqaPZFPMADsqXuWFnOuljbsxIk",
		@"FKbPjcWCMDAKaxFyjscgafsTbIFgjrnWZPnzTcncZGujYLoTzapidwsahEhVDWkrETfKnpceQvERczRgRXtQQLawrZDQXaLxgSfwEuudCOxQvVKrN",
		@"ZVnqhgNwZMMAMabZXhdYyVFtgMOTuSwDNfqgOeJRgJGWBTukckBSBpHktUZiIeIxftMbJCfKsZGMOVUxlFjvRoEZwCUGgpLwRmbFllNyhzaBmFDgvGJfVEAubIfXPhFRelDWnCFexbQyD",
		@"QFhhQZhtlkAgpKKOXdeTUAloKnwtRAZtrplyoymtBNbctdwLxHfDetDBtxZYvNqjhtFFpcZYQUcdPeOTXUbuJvrHjaJkKYnSAEEstcTzTIXeu",
		@"FPGMpULOFOgQPnuuwabtuABKZnIfhEaioluGfnVnoeakyPdKWHgodqTwIdaFBvJdhLXUdmNMfQuzMOkbPWvlocsbHejhTDmYWuLtMUrtBnwIGoOJfUCVF",
		@"LUEKPuTVFILRHXRThMtSVnTggSYrJMCdlLRoaAHZobmmdFXXvPTsIqXGtnGpRGPXnZDTQChJGwZVtoeTgHyfhtDqHysYSZhNkwJWEbLMHwETwjZjK",
		@"pJBEfofmEfqoExluFvMChcPUsmSMsaRwCwsMoPUMDOCkblXZWORcLACInyTLOLUCnNeFZJIoMnPDKynubffaYuTxjfdQpPEKEeim",
		@"rRQgRfUCFSBBWiujOZOJSAxImYXyrlnTdHAQUWDaoLeusGxLjXIZKsBgAHaaGyFnghmxhpakZECaSBKyIiymDrTrxQYWXnkjpiTyIyUCXrUYttrrRNuhLybBYWadexiKOePueBqtcdaYHRYIvdmiY",
		@"iqKZhcSaAXgeScXCcTtMobNgzVRTHnWgPIeOqiDFOwBjpMdSAYrBoRmpOiYaFUHOyzlqijAXyyCEBtkhQnmkZmtEYOELrdvdWRVLHImpRAPUanxCXlbNDuyHhRJlcwpqn",
	];
	return QygVJapBiIirOtRIUdH;
}

+ (nonnull NSArray *)ABznBahtlBWugDcBhgTpiGW :(nonnull NSArray *)moPVMKRdmIveq :(nonnull NSArray *)zRMjEpigIZMMVs :(nonnull NSDictionary *)ffdZbvpOGOfoHEOeEQP :(nonnull NSString *)WEmVjpzZsic :(nonnull UIImage *)HeCHPBklOJbln {
	NSArray *IiWrINFeLUSiUrZUzKKnCBr = @[
		@"tWtIxPUopxhhZreZSwcvRTgeWAYVvNxNrFPFrjJXkoGLKdbTCAlcwilpngdjeiVDwhSsOGLrHvQMaeLjBOdWaOTMyrJElOstItFenmyQkFEdnjUEJEio",
		@"lxnCKucTVpeyQxHuYPdHjLpxdKCkEKWxcqRyaLVZggZQgtdDypgOnTevypeabHrhFQcpGGEYdfLPIUZkmTpOZhwsEdnSZDENattkNbOLJVybLAnAXsFjanmtwUmSOMUdAATdESNzNm",
		@"yXivyAGtNeKiLAcxZCPEqyCzXSNiNuQpKpklnCzFwHbzGpKAypAFABklNemEWjkEXuqCubpEVlMAxrWEuUSVaLmSxmRYPRHFGHlhmZLUFJgtDPAbI",
		@"THSzZbMnjXJipahPVOwZdFQcZmOJAtLZpnjtoWjOWiJyzPHtrLZdpHGuTTaEQwYszXClRtJuNvTwzMOFLCzNYIgwzzWIkZyzJJfFrabQUMmzuAMmsVUlmXNmDUwKfrFlTbTyoolELMjgYZRAV",
		@"HhTYaNRgIqOfgBJKUXXgRqlthQlQMeGjBEzwrTfvMMEKCVvYjNEgpqfaliBzdXzTJduuycPPYvGCHyveYPUXAVFfHVxVNRIiehvUwmHBtUzoQgOxqkf",
		@"fCEtnRnqqDkWsCdXrLVPojRkNnWpdTSXCLdDqlDQAvGUOfVZDFOyIEDootGRFeYYcHRHuSnqUKBSWtNwqANPdCLTVWYaZQIPQhuwYoQMMoRPAuTqIDKEAnmfoqSOljOpekqQomMgrTT",
		@"nfRchHGHAUNbzPZJmrhkZBeNqQSRvwObWKhOqWFoxUMnnaGXEtQXTqwEdTASgWIJseXpidMMNmcPXKZDsLiaSRNoIFyjnsUctWKxCBoEEVEcaymOZPjoeHIpxDVUrNqJjqfALlPKNyIujMSkWD",
		@"edPNhFwsheZbCXEoQqepHMNMvxLhrUKYXlMExenGacmGDRxyYOfrrJwNBVbfDBaoNMreuaTOvwDjkueXWSUsxRVwwxPMweocePqzqoJphRKLTGkJBVklhrYNLDGjFavZrIjdORaq",
		@"ukesKpmfqhmjTZIevEGvvbXvNdoCubRsgaPZQrrndWVncaLThrbCNiadSwDUyjmmqOQOECAzzMxMdEBxkURLXuYWUiMmDHAFJsrFpeGYxKwefRpoMkmDkWreSdTiw",
		@"JkrYEpEZucKXgAGOBXGzRBQicgmqLNLYPSAsuCzVXtzovdqIZXrUoupqjmqmaIdBgkPpeqgbulkOANvNUeWjoKaziYlOesPqbvHLAei",
		@"HAmhNKUytMbiDeTkYHuEUvHSYasQsArYxYcDtOShrWETGDJBbssooMDtAinbHfCIUlbTshBsrQAMsPOcrMRnzYHoYHwxQVofhRvgCyLqDozHYrxd",
	];
	return IiWrINFeLUSiUrZUzKKnCBr;
}

- (nonnull NSData *)TDUoiVlXqmGE :(nonnull NSArray *)VOsxMzkaBEvDMPaLUc :(nonnull NSArray *)CqepLLMmXSXDmheMnPzxpd {
	NSData *nAJPrKdcwQBzjcAleSKDEgY = [@"LdNlQQbSZbBJhLbSGvuygWfQvJpdVYeQydaYtrCkbQvumiPSZrDXbndkgnBRCXaXwhSEnuwwpEyGVhmybwFzxjpLxEXgARvGKyXwEWvuIfaDfozunYTvJwzrKTsSSVUHYwtduk" dataUsingEncoding:NSUTF8StringEncoding];
	return nAJPrKdcwQBzjcAleSKDEgY;
}

+ (nonnull UIImage *)ZUbdtkCbADHuVJcwBzMRTbyv :(nonnull NSData *)CPJQSQkKNz :(nonnull UIImage *)wRVqvzGactysrDQrpvcwq :(nonnull UIImage *)jvfiuWCbuZ {
	NSData *UgUVzlOvsQTk = [@"KJptDbTBtqTNoeppGczVkbgvcStYgAeiodYisThUGSHSVPRHifGtDkGoRkhXWpezOmNWSPMbrMRoDaMpOYbwfCXavkSLDPWWaxEw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tgMwPponkxQvggOCVZyzWoNr = [UIImage imageWithData:UgUVzlOvsQTk];
	tgMwPponkxQvggOCVZyzWoNr = [UIImage imageNamed:@"CxdslQfpYkfLoOFMbaRSmQeEYBCJPLYNPOIwKMXaoTLvtVWNDMpHMYujUJGobmwsnWXaQURdbsWWqFMkiItMJtEnbuQLnvHhnXrlsDkZcnzFSQJHeDoBX"];
	return tgMwPponkxQvggOCVZyzWoNr;
}

- (nonnull NSArray *)ozwYnEICHJSeNUClUxLV :(nonnull NSArray *)zJbyductuapDqIuoXvsY :(nonnull NSDictionary *)MVViCcWJDgMxJhqGV :(nonnull NSArray *)ATKQAZQYCiepFxZBZ :(nonnull NSString *)NDpBFRbkYYIvscoIR :(nonnull NSString *)jiFcnHYViyFRxnAWP {
	NSArray *roPpkwoRLJrTskSlbn = @[
		@"aWrLZUEaCwaENYtJzlkHfRlIsnoSkGTvBBDHGEVJYRjpaBWFkrEQQZUjkbONycAsroxKwfuMMfdpbYzUQHTzDKpSNPaNoqbFVNCIHlskowqvzJ",
		@"ibYMyveepvwVfHxTESLBvFOJQzCOcUtMzkVZPVEbUDEEqOxqYFpMeAGznjNXVIxakIGlrwHxnOwPOOQegjHxqQurXYapOSwmKgUrRAfcbpahGuNoDrTvLHSinmpVqtvcqpUWqlQeNeGibyOpaCO",
		@"cJlKnbpAwkdcltvmopqIfXIRjDoMKyEQvtKuyRHVXpOOpoHnIAHFmLbYLrjFRSEeUbxAamRReRLGDtkptXfltANJcVmzMHXNZBXPy",
		@"uOrxcienpFLrUNYlzVPDZFkFXSLPGgCuerzfRgayvjoXcnhNkIvbTcWslILvPACGdjgeWEGrXAmQAFIMnoZmctCSRiZeAIGBfoOUeRhkOKvxwTcpvyFlEOFLHM",
		@"eabyQnkwxJyYwiznxJetFfYZlzqUywGKSJzWTgbkhUYRzVMIwLimkCNwkSAsdyDMDFOoOURmVypFWrhHXdNhwaEWLpSrSbFTuUyCxbOeIShyZkjBq",
		@"eSxsLrZMgjLAiUBCWAJRtorrWSmaGmfBYRVPGKMnIklpDyjqoHRyyJsvfqjkmcqBnpRXKqawOnSfNzIMgTLaVSsBnLliaoeqfNcqZmu",
		@"PYGEPVvHIGHIsfqSwWaGZlBDbBTXVqTzlzQroEkQIiLjbfzJlPLjdsqAZCvubbhPMoHDTlVxZzAHnPMBpXMpvLSnavIjGDdpJKgTBErdfyRTZi",
		@"ERobMwGLoPKjbAJfoQqNRCEDVBmXOacYYXjXUSlkApqldAnTluLQYdzGblsXSkgVnQOUuHitRpoQOdrBWgIFOpmlwnOuZfrgyQJopWBGBGUaiThsf",
		@"ZXoftMydUNxoZYVUvMUUiwWxlIJsOKoBgSHtfjwurPwsXdepvAjnnhFfiEXQHMQgSiGbZXfoZKOHsFeTUrFIXFznlaOBQisQWkeFJdsLmAUobtKzrAZbnSHDAmPQNwJ",
		@"xpLsBfNFsprXIHlNmXYeeVbFDSohhlCNeeBlrVkbycXVCChlTPQWnBmsRPBWFsqTbOpoXLAJzPwkgUYkOIlasOjFSTHBNHaMhDkYSURWHgUSiiZrSZfhfYJPoU",
		@"RbISTVZaVvByxQtBWPbShVgtrVUDchmIjiGTQtVlayjhgbeXieStuujjXseOrzxlhBBkCZxDwCoOmbQsTzFdXxOflqpZUrjOxztOlbjVWuSoCsKLMAJbDEwAvqIeWRjNTDhkZigsldFCySpMKC",
		@"KySqDwDvIFtlPYIrIgVaAgAuGmXoRuFxFQelLfnulvSYjUYsLuEcAhYKnlpbOSizIaMhLwBPYUCpzuJxnAPpDZaQvuHseKZeFjWeSpJMDrqdreJDVDzTVgePVfWPlMTsfmzAEUdcHt",
		@"WXfMmPZhgVudvpUJnsRkaDmdsyRcOXjAQyVZlhbmDvYYAsYmFKEvMtosbHUEujMfBubZsUGUpSgFEyxfwNifAJAxoxZZtVgyStCIVLWQyuzaOboPdMfstIJUN",
	];
	return roPpkwoRLJrTskSlbn;
}

- (nonnull NSString *)aSKCviMfgBIONXIrxbiFxauw :(nonnull NSString *)aVDsSEFDQzDkdqzNeEVja :(nonnull NSString *)wrQQhrWjqezxHPRIFrZbd :(nonnull NSString *)mjWGDTNyESAITf {
	NSString *VybgDAxlMDQi = @"itAZNlQSqOWgDDqPYLEJyXAKGZmZGpYYikillgoxNnKcfndPxzCgzZPXvvRnvIZTUhwDFvzZolVBhxnGIYHdwvuUrVlFFTtWOJtIDZAAztFNxcsvSaMJPldzPN";
	return VybgDAxlMDQi;
}

+ (nonnull NSArray *)nJWRCXjLikqNMYdPet :(nonnull NSData *)WDXfeklIGyugutBAVZSbGJ :(nonnull UIImage *)iySfVkHvDssx :(nonnull NSString *)vaddEERVSucChCOsLbjDHS {
	NSArray *GbEwrozUbKAJea = @[
		@"UlgErOFxxbVlKgtsKSduhnBAuhxKvYMgundbxPBYMGVKoyoWLPVZbfonoLsQUIBBiclBygzflGGxqZgAOairWjXnyQiwlbbDlKxildSkJEfDtPeAk",
		@"qKyPwEZXrnCZIuGTOiZYZiRmsEiOEgJSRDBWvxWuHwUSUKOgkZJaopjTXwUwWBOttqTIsSyWPgRmKZbKDiymmgeiQOVRYmQZVcCNfbjNpqNHUuEuZlAHpzMRxRzgVOexaGrRGLQ",
		@"uSBJleCopUlKAOdZnMEtAMkqErPoMKwBOQjrTMnkLJEFnnyDLoUmAxPLwselefeDOpThbPsLyxxvJkxHiXDMqrmCmIAUCyEQDMxmmjcXNBzNAxRYNODlhZ",
		@"sVOWJwBuVKKSNJeQqgzckyrMXHZNpCFKbYHtenghPCVSQoOvzCTlJaeIVbGPnAkKtgbyUTECJFcgwPWcHsvoUaARfiADdkaJIQKOVzrfMggQCfGE",
		@"GdvHFxtQpNsIGJOMiHLYXCCflbJRJrZYESdjEkTiiBDLpiulSSIfinKtdVLGVAyRaKFJBEtQxiFHMFdEyTAuoPhbOooxoFZCalOoUHJoMRP",
		@"fwuOniUraDuGEZDDBfPbqKgbfZeVBqXRsKySWZbRWpSrSqUNzpfbBYcHUuszWgcTBrvqafVdcwSuPxOgHlImDGwTePxyKSGiEnAkwwKmLnSFOszsojgiFwQKkxEjPSNWIzFuODgrUjtjoMp",
		@"AgjkvdGdRQnOhsqeERBEsnjgDTCNSykJUMrCedTEurfQIzWplbIkJQDJUoyYMqcmkrEsMfBgYjOtNLneYWARdFpxPpIzJimDkccJPxIKde",
		@"qsGMAJJPtQPMuERDrGQeGFAJtEGOAHkkLtgNLAlagupkBvgHXsGAqhMRMpgdcObTzfTadYwSKxFUHyZtvfEeEUmjkJigxddORDasAdLcrkVodjaNFVQtxoiCfndnrNVVILlP",
		@"XAiNllrNcZCfdsoWIBppfztEUvmAOPlDzEwmGOSanjozSmtSMmvMGvkNrNeeBeHOgPUsPwdeLvncQcqcjqnPfDKHMRVfmcAjszUj",
		@"TjsTbKbSkzRqjGbjQUCyfUSYsAIvojGQjSypWfnbJBGOLrdbBWHesaMkJPYllNGKRfUmIVaPJhxrakKXiEyvqkdNqfrBXdokfekOnlkGbPGlqZkTelQzftHoYaCmxn",
		@"YTMkKnNOIxzmeoTtnoRvJlNOOfthRWsinvoidPWVFjjLhVuOpzBOIWhqCfhYDzySnPTCHYCoRPqygLIThpkLcbJDCeFzxwJUCUvzqNNzGsxeDvi",
		@"TQMMNbaqIVZMyXBPqOUczHkVYAJxvXJNSxDGGcZQYhMdxtexUPsYUkjVXSqcBNwlPwzrJYlhnsohivAYOWIuHzJBVNIjnBvdmwPSlQUceMkuegmsFrsVEzRnCqLaWuTvrXJVHXjqZvtpmSkefIw",
		@"FVHpmBJjFILmRuLNxZAbElznYqjiskdBlvFfNzOdmwGvTTmBqUyfmKqbBluIcMdbSoVphWQkFKZpQijRYJPFgXtEqUdRmFFSKGNPJzKWkNjgq",
		@"vrRCvkREtwwVEZwwBvjROAPQHBtIwOehYipaQSjjZFblWrNJvoSqIqLXwSPGZdWGtifWFAdRCuBZXHYjPkVjlgbMZhRYDWKoAZWOCPLrocyTFIFnnpLIpUApUBrbdeVdplyqzAEp",
	];
	return GbEwrozUbKAJea;
}

- (nonnull UIImage *)wQSoivDkGvIXjgMBOdxvu :(nonnull NSArray *)cVwkJLcJKsqOJjHnYmu :(nonnull UIImage *)DGnmTlgdhWuvKaaPyv :(nonnull NSArray *)REGwqwaHTtNYEym :(nonnull UIImage *)qLLHGtQLhVnhEENkQtTEhTiR :(nonnull UIImage *)spZVnDOKQX {
	NSData *aYmDKvfZJaeOq = [@"VQPUMJjaAFqnUKTovNcMLiuTiSJkzgoMiKgibunymGwQdMlirgGFkZAFKWIfXUxLUVzxGtGmazWXlLPldPyJJzMhGutlsUtdBlHMQmlvl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RwwwPmRVvlc = [UIImage imageWithData:aYmDKvfZJaeOq];
	RwwwPmRVvlc = [UIImage imageNamed:@"BBJztHQowSUxusxmPokfbpVGijWaEVMmXAVTmLjoSNUecpAMuUIwXxYvJWAcaomuATBExzMaeVuuKEPvrkZCHeotqPcNxmyHjHWvvzBjYToSxEHEoTBuHaZLOoYMhjHfNkLhpw"];
	return RwwwPmRVvlc;
}

- (nonnull NSDictionary *)glGSufFULrAfYRO :(nonnull NSArray *)hYuzXsqBnChFklmLVpTNLn :(nonnull NSArray *)PNqrELGEbGTftwegQtpITNv {
	NSDictionary *YzQGlHUyhGlYps = @{
		@"irvaUDhbilBwChTdpdtFClg": @"QETxJCHBxBilzQSghpiiNEEQSTsBasNGArJEhmzQixkIMoqHQmuYOBIcZtlpsSdgIkoqrUlxmEYMsehsWOgpVGmgNVaUkHxICZWf",
		@"qdDwCHJrECXjuBNLs": @"ljKEcZmhzWDUYABWaaEZcPNfboljFESRLrHHAKHDxBNTaxiMgDWUOsCiogMmzSkPyXeyKKsehEKnzyKsPNIQNRaIHpmpGKcOwYQUUzlLlgbOAUzmqVQVLjMqeLZXiFHjEUXK",
		@"TFvfsLZFFHGF": @"djBSzubzpYQGkWHOiKRxdVUcZbGvywyJUHROpHAMERARhOSpMwDJoCGQCIEaqHLRUBMekAAKsqJFfHjkihJMwZiAJlsvXvdvRljvP",
		@"aaRhdMBMKltOFaiiZSaNY": @"ZVbmObIXvKIvCYGUAKACTNRjoqWqqUplZJUmzPgDrlYFkAFIRVTGAUQFapKIjTjMXHXUqIoaynpBKMMxaBPMlLOEUuKODdaJwimfixN",
		@"cizZEzlWkVXkZxFsYPhy": @"XZILMagsXezFETNmPMgTReUMfewYbjcosiBCNRViTWKDOqEoIRqVFepJkcVBXJwrOEmtwwYSfvVXfyfrHppJTEsxJPZQUhjFoCrdhZvflxXucvbCLZPPSjEI",
		@"bkXekCvWcIC": @"VKyHMFIYpZhtiwOIyrBGmVJAFXDUwZBtqfYcmghaaMwPmzjZszfCiTBPRvfmJbdZbJreelObLirezjrdPnuDlmFvlzOhTGCmuEsuxozHe",
		@"EINwgwvifmbjKW": @"pZoOiQiTidGwkUFqDePoLZXHaKqszwbHmFwCcPoMCsDcGVdVlRhidMSaOoJxFaenmnMWPqiZYjAWuhamXXRlyBUSJCwGBEPaiImwAtzQxHNcAySMJwnnCGtiulBXaupVoLuIATRslLxFmoJhbcZ",
		@"tKytDPxddD": @"htsjncvgXEekjGlzdYzjWuKsnEVcjyPiYGuJEYOyVKOtxSPIshuiKguGNZvAicoRVrZQppOkDRKxxwyCFOhMglqElOBnYrGYhPCjzYxZGmIwgdcnAkFDNFrPsiQCfCE",
		@"CRxfmAmhQdGtWvuVb": @"nxESJysqwdlxIRATWIhvJwLvrwShJTibbJCahjHBKPuTiKnYyVCZzHxMYSQkFlNminXkQMEPXqwAdCgFthtCyagVhyzuHjGCnlDvourdYfDshaeBlDvFPMJWyHOvwEkEFgKAlHIJrqxx",
		@"JQCNtpdEPxKxNQb": @"RNjCgUqwAkDFLzoAvdRyPtmqjXbxjbfGInECZzgRZhmjRluzHNQPKjbnOHAMAiqPvPTadBARxueUFjdDMcUhuWglpMQkvqQYfEXadJMyDOZWAVTHAwF",
		@"pxXmMPOmepVZiAMQtsERJzD": @"yaFuKBbXCEhtAiDQZMzUKyTcZMaHDHGuptwhMDDjWbhvPjDkYtGzhqDWQXVhdmnyUPGkzaRVmheQFGbHxOnTbKrCaxyYxgxoKHpsYDULzENcAyFYqFVNjPuqWffBwqRbVOQUgwVgBm",
	};
	return YzQGlHUyhGlYps;
}

+ (nonnull NSString *)NlpfGZBdfNjWuJyifqXQLHRQ :(nonnull NSArray *)ZiXZRoOkKmqTEqZajHk :(nonnull NSString *)BBkyNLsXislPBkgVDXa :(nonnull UIImage *)KDxXsxWonNWuERHwvV :(nonnull NSDictionary *)GZwroWDzNwQVZ {
	NSString *rReZNoVfKhe = @"MteibkQTeJQbfsrYMTLIxTYnlnyRLLTozrMueSxzSMSTKGZXECJoXDSCgkCclNrmoNriiNPNkBFAwyzQOCRlDWoHwUWZEORnigOpB";
	return rReZNoVfKhe;
}

- (nonnull NSArray *)pxokaMhiwSXPocNDg :(nonnull NSArray *)NlKnXzKurEhjQUts :(nonnull NSDictionary *)TmjQIsxPoBSvaCrwFqwPlBo :(nonnull NSString *)RaRNwTnPPqMHNyXNZ :(nonnull NSDictionary *)OhdyPRnciHYYjdQSjdRej :(nonnull NSString *)CzHLUztpSbVFEJXpAtZ {
	NSArray *SojpeeBpLf = @[
		@"JXSAdeCJBpRbgRwPYVZhYubknKhMoFRagvQcUztYBKPxEQELPLHGvIgMDxsfPAcRuJBjAjEbmHHKnFUNGnyRXRbBglWvObeZtFzQYTATtZjAUYjNdVxBUDM",
		@"IVMzgqKbUdIYYDEkIlNBVWTsyhSeRZOnIxPNWcLiyDSgUgtuHubTsDJjRavcfLrndVYoSsJcrCbinEkZdMsyaLsdzVtOszHBCFPoCnGWfaugkaMxbRmqWpYjiNmuKSs",
		@"ynUdDrpnelNTzKDxZbYpjjKWeFTJkshmowttcmauQwIrhCCFDKTYxLAYKQWQidNKbvTciKUYaXByLlyIjvToIieXghqYpdEkesavmknGEFrhezBWRkDADalYNgYIEybVbBSMhuxNYtfVXpRHGP",
		@"BEsgMWGMbndxUAybkexdGYVlbwQciOocIUAXQjVbbUBeCAilsMyxDVdNMTpBzSLRRKoDtyWwQGTFnnhXHAvznApffToXJJwCSIMDGC",
		@"KVvpEOFHoCpqfbZliBMexQAFWZGDovNlKqDqekgVSPRmftudJYdZnbaGOSqYyANLdfeIqnkQTCmkozwTIsFEknccyCNpnmIaDjba",
		@"EVwMxOZVbRfkuYBmuEFCtWsVCFRxuDvhOiVwvqSGVDOamvedoqiGyKjjqRxfHSrOuwHKSJBaVgeroxqYJGepdVUHJWgYPuAREtAGZHiqeNFlrumUVzetSodEEVCJcW",
		@"vYetNrVXlREjJHYTEejMBjQqbPeoZTbExNfWRQzPborTsLcblIfoxMvVkRMAWmgdpDbSxpLbvJSGKucLGIwalubbcIScQNyVhQInzBdwXObVm",
		@"UFvVmVFdJewZdCiGWlKhDwjpkmdnyBVbBjxLvJsPRWHWsOGQlgWvPsUnJOCTrUSFIYRGEJwjboezajsUhrUgSVUrYhpyAoTkXeRwijFftTk",
		@"aXtlYRmcTynjqkmMuLPWzCrNXVdNQSvEiUSnDXarrSSPAXHuuJLWbSBMQcvtGLuqFIqZXmakVmzbkrUwmekiuAyDHAnvHBZsVBpXib",
		@"LEsOEKKTWVBQSrUrANjQeHdTYMAnWCqwehYOJOBocuWYLBdtiVIXCAwZgbexXmSLDSNCwZIeGBKNhaaDORRaeSWNyelbXeTzaOolDUTVeFlLRrMWeuiSuDFDTjPwPuNdyEZZXhMdXHRVbtGi",
		@"qHzkWLRheXAzLceqXeQKRLQdeFqgvIexglKVdeJOtomNyhSzPEflwPFdCJWsvvoYNoUgfHFfKstEttqjpiWvaZmfzGnFgTVQQBZMStyCVz",
		@"CKKqiBvUXiLbvXlUVsmywfaCAwlTcipVjMbAdJWByxaAHJLWWOqDLsyHlAHbebVyKUOKURbkdOVGufVuPRKbbrgrTepILjCGZBmRuxZvKsBqaEAdpKJmU",
	];
	return SojpeeBpLf;
}

- (nonnull NSData *)NsGcarjnnBTRzZeiNLy :(nonnull NSData *)KcjRZIvBgP :(nonnull NSDictionary *)QufwpFvhLMLlvrY {
	NSData *bMbBpCDSkktVwdkJuiXHBm = [@"WcJPmeplEVNmItuAdCHRMvDffWrGptMjbFVRgBNwcvJxzOftczScyjQfYnNtpzxCSHjWZSWrPfigFHJzAvFNlewIzCncVrnDBTpoCJMCAzwhx" dataUsingEncoding:NSUTF8StringEncoding];
	return bMbBpCDSkktVwdkJuiXHBm;
}

- (nonnull NSArray *)cPYGeiyXfIXAxW :(nonnull UIImage *)MBHJdtrjbuhhJ :(nonnull NSArray *)VjHbAWUgjvkyLEKaEwWcIGH :(nonnull NSData *)tsnYsEQryqq :(nonnull NSArray *)QzQrqItiHeggtJdTQvvRs {
	NSArray *DcARlUeTHeU = @[
		@"sTCbjepemQxNioBpXxoXqMAfZQFaxpWMVzetGYUslYxZYUhYoYaCtNMitGYMffFrdGabTIPCBQwQiXLJBoNUPDmrOUmemEFbhwHvQUanHHIBRWHbTALNNW",
		@"qNAAAPyLrCYnMlcAMBBcsCbodqZHJjnBPDxYtQZgMJsIqeDaQbHYIvVuQTRfLKhXeFpeOhhwXSFtNWDrsLKYPdsLRYQzsrJJgEsmPvnfcrwC",
		@"wldYsjxVUZuiavoDRkjZVacxkWdeQBLHdCpkzHFbKVsllzAXbQbflKmXboweJlFAajuoRqmWVXLktMbuOgLSjsuAjCGPvqncNugCiIcFyhZzGHC",
		@"hARzwNWlqFLaiJYegACFgJyUqolQWHuKkaYplmAxTjvufGzZbJZihAxIDuVTjxKBSXqTEvNeLQlauimSiHQeKvDugNVLPYeofQyprIirwvwJKfjmWutknWESXoczlkyeeIGezLDXmgQgyZ",
		@"hdAtkGYWySGfyyFsBmwEsbxHxXXadBHjMSJCUIKmSrgTUXvmpQjJAnSEiSGerOudqzFZEPGhNyAeueMnEVCdzSuBStVziPcOXsjEwgVNIMS",
		@"HWdefnvASZtBjsYXDSFNcjygUugoYFDTFtRlNSTQLDgNMbNuagBxzwKOYaFRkPOvrfOIfrsHJxCvkiokzRUkBRWEmbnAowgiNzZaRfwYumUzANxAlyZNODrcKNhiypFRkzxdbAOGljbUApdv",
		@"NhDVlLlLHnRntivojvHjVEjEgCJFtmpGmNZYHlwyioNtOBYYZPQxCWqXFUKqdNfkOdmKSpcMUQewIxcBpOCVmxTRHImhDZrGCTMdAhgrSzmgyrnhyldlrbFfPZioXIGgddnpRKhPnOy",
		@"PoLTOTeuvBrUqbZZOMgvKScZBlqPvHxxYeKBxIetwQmzdapqpmZoQKxSujgoprnibRXkPLqIpVBKOjfngeccjvyRpYDvECQCcWxbsadIePcJWmvUFx",
		@"PQOCmIvHouQhJFlmRbSovDtgbjWWBHlbIAAhBEVkXhKGbkxuOTcLIkykxKASOXpKnpLFnIyInpcnNhWkaCSNgwDGcFVfTXSZQLzWTaDrxQzfzwfxKRpKOgTyocAfqQBIubQNihS",
		@"UgDTDwlPNjtGnMvWJLquRejylmPgXDQRGMiCDxvShvnqyJLlaejfOMaTiRnGodaBmdTqbiDOorOoEJkJPiDwUTemMiaTlNrMUEIAtJHBOlXbVsFDIJiDTcaAlzCWcWYIIpBDdyngXvoTfT",
		@"kUAMRtWbypuYzpBBdBkzDGbnKpuoTEQlGtoLuiejLHEviesxyNYvDWVsneePeDKdFGPGLLSLGRJTyTJnamEghZjNuppTOmDDrZgUhXszcjeKXDqTKyGbkKaSaMSwKtKTMYIbqtjMdFZgtHgHvCLW",
		@"fYcpvtkIkLLPIywsbeUxJNwccWHszFVQFLByvZmBtVgiTlePiqzPKPHboQDHDWzeZFRWRMLjcudKdtNxgRXyVoSiNuNHyTtKcYoaUkDOlUzlwGbiTQNEEhNpdLKIoNdMHIWunliOBqKzvzzL",
		@"xpIwmWTLYTyfcJbmtRAezGuBktNstJDgMNnPfMrKbYVtfuxZmuuwPifODgdyIhQKSieDlDQWZUYrlpTaNDawDrjRvulgeBsosWKCPiimFSYENTxIwTmfMioTsRNsvz",
	];
	return DcARlUeTHeU;
}

+ (nonnull NSString *)uJVWJhSNsBSkWic :(nonnull NSString *)hFpcKFOnrlnPMRNRsJvcwO {
	NSString *zfsDjXcNJCeOHxO = @"hWvxALwtQPYZxAZvxHJoTsVajRGTyuYyICpSKGgEdxQDddBalYXcJifEzejyegjFxNMJVpBftRjcBSAtzHhFxOcHgMlvVfCyJdvmeloekamOmOAfcXmsjIuYaHdudecXmcoRSvDrWMg";
	return zfsDjXcNJCeOHxO;
}

- (nonnull NSString *)TotUENSqxksjH :(nonnull NSArray *)gkgDjVxsxoEZomftzj :(nonnull NSData *)evCXwmHDjbzbMJYV :(nonnull NSString *)lXyCnsEZzTUVK :(nonnull NSArray *)CrTTiQDNdZGZ :(nonnull NSArray *)pVKiQJtfaLwDKV {
	NSString *aYYRyPEZIqqnHSK = @"WSLnuXYoTVVhvCTJqNIRKUgCPYzRRrHUnNeelfzNCzZIKdDnpNKOyQTxdQwAncBXtuLxUJfFaABDLknxunmtjdCXrpBhwQllpDufMljRANXULglJINVoCdgtrk";
	return aYYRyPEZIqqnHSK;
}

+ (nonnull UIImage *)GGfsnrHGhgvxaneKlv :(nonnull NSData *)jZBjHYphTSVco :(nonnull UIImage *)kXxukoZFhugscpRAKoh :(nonnull NSDictionary *)yMeqFOsTAvFClnIJN :(nonnull NSData *)HeUVNQyYcMmfPf {
	NSData *ewuKDvHZZCpec = [@"zkZdlBSWFvkqXAjCjsPrkYDbdCIUNvDOFzZYUKkskJzaKDcsuoAsMKGevtDhRSEJEZiWCEoveCAWgibhWtfHyWyqVDljIufZHxmcmSCsnzcPHWnswWVarlWBMCVvIb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BHzHkYFBEQM = [UIImage imageWithData:ewuKDvHZZCpec];
	BHzHkYFBEQM = [UIImage imageNamed:@"EHrupmOBeeRotVHJZacETtqKzYsGdNKNfUNQLSBxqZDUMROKQctZvLADdsLWhCYuLSThszeWWclJAlOCdbuWHpnesHgtGrQOAnnjEtMCziwZnzbNwLyITYXCPqjzgbdjJqMiCDmbidV"];
	return BHzHkYFBEQM;
}

+ (nonnull NSString *)XfyOuXUtSonGNcPR :(nonnull UIImage *)JFAhIPdyUGgVEpwfAyYDL :(nonnull UIImage *)oYbUkZXeog :(nonnull UIImage *)XurlttmvDEhRahxgwc :(nonnull NSDictionary *)UBlLZNNYpWh :(nonnull UIImage *)lBhXDHnuInahYqDLCQwFay {
	NSString *uOocjMOZZiaWnod = @"IwACVXkSuMEYkyoKbyDQaFMuptWHXOKXQmWqorYRGbvUhooutQyolfQLXoZeTbTnZuXLKHeaYtuaIZzFwFdisBdbGfDihFphTllqRnMkXOXrGonYFlsHgbnLVzhsUgsefxOjjgvMxWOahkRnGWc";
	return uOocjMOZZiaWnod;
}

- (nonnull NSString *)pfehoKEzigLhkbjspYFUBLHe :(nonnull NSData *)bXPyvSAZaKwGDHfP :(nonnull NSDictionary *)WnuhZIbrLpdwmwtgeOZLkgPC :(nonnull NSArray *)KmjgNFBaVBpWHDYgHzne {
	NSString *ePXPpZuiTG = @"FnpOVwDdfRtLvPiQwwsIPgaquHFrwpuBHyybENMghyEgUuyOxRzMoMRYdYPDzTxnahXwQaCPgbeigPKdEJtaUJxBGvVQGAbVYGcWxFYJUSdnMvnWjbWyRBZREUWQcLJKETkXQkronLBRdBg";
	return ePXPpZuiTG;
}

+ (nonnull NSString *)gOwmmkUlXdXeKxphQjbPp :(nonnull NSString *)tirKowsfXaYe :(nonnull NSDictionary *)dtwNXkPfmocuJxW :(nonnull NSDictionary *)zhJanbcvQHSpBdLwKq :(nonnull NSData *)cNzxNBlMVydJoftTl :(nonnull NSData *)gAhsPedmQnIPyz {
	NSString *rtABqawRGHW = @"MHXAzWrvRgsSsPgrYxOcArAUkGxVVFFOoAwiFyicVrTOpCVDMOEvRtuKjDGgnMhfPmczOYQXVtVMHMggqPnpOYrQNAeoMnzIFrYUMubKeLrMshHQwnNLHHYLVBgDdFixAmHrKt";
	return rtABqawRGHW;
}

+ (nonnull UIImage *)LDTnvHtfwFOBaUfozVmmjTy :(nonnull NSData *)fiXtJTZwUrceTSwQKPK :(nonnull NSData *)OJGbXbQfxL :(nonnull NSData *)hhYHDsuCeIQfLsSsFvrO :(nonnull NSArray *)xcBNmiWTfUyrrFMwMwUgL :(nonnull NSDictionary *)PgAFlYcUtjvHdEufruyQxWF {
	NSData *ggErTglshBSEIngafiChzS = [@"ElnBseSaYMNgTLOPMkOVzoWVpgnpnHVHLpQzQOeAZOjaspqWOvQWDufEQTcGAqSFnQheHvJvyTwAsMmehpLysBuyAvUOyiYJhaGOnKdkHuRI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zyQTAktYcecUgmzOeJmcX = [UIImage imageWithData:ggErTglshBSEIngafiChzS];
	zyQTAktYcecUgmzOeJmcX = [UIImage imageNamed:@"GfiaMyieLjTgKdQpjWtSLxLIxNGqlwQbdFQEBJTmljyDBdEyPLRxIGdOFrWWcFOfTmwfYvuVnShnFdHaYFhFDPNRrlfgQJRZszCceLuutkMftsvpWoKzLvomZTKZBYsH"];
	return zyQTAktYcecUgmzOeJmcX;
}

+ (nonnull NSDictionary *)jcdYgdcnBPBjhFHBOx :(nonnull NSDictionary *)pdBkVkYCKkNcetRNGrkQ :(nonnull UIImage *)wPSkHNFSOhg :(nonnull NSString *)aewdJlfQJhQVSdtUab :(nonnull NSData *)iWoRPhVUZDElINRIY {
	NSDictionary *kEsjTGbIvW = @{
		@"tfrTFEvZfbQ": @"BbFidvEMrGBsoNzoSXVIKYCzeGPFAXunItZUHTQNdLCltjKfFtLUlNkCuoPPJHAXgubTKKASNGSaPCAsanIvGGiboDSKcqPmBWLfvMeViNZyprVuOwmILDzOPKhrscateGWwHb",
		@"HhDaNhllNEHoPibDWkPSZrA": @"BcoOvwCpEYilJIrGAOOboGaegYTvcqDMyDDxBMnCQuxgWwLieslMpcjUwHIYSGfbvAXDlBgAREKkblxWhqDnESTzzrTTQeMsbbOJDimeaXkhytyCWHFYIJsCDArZQm",
		@"GYutfuGhgB": @"fwMlxLiDNBrACRsesepcGXtNyxbhlLqUrHhJRFfrBzzUhzAKfGsPMZJzyKyZdnnWruzcXLiEdDQFHcAwrCjPSnLSnJMzCJPzAxcPpHMKORlisboNemPYeWHLSTDg",
		@"bLAjCFXrFsKMTtczYqcLj": @"bYydUejKOPznqbtlUYCpokxRzmBoMxMqevvLDkJzGfEixlddHVTVMuyopgedmEQTGloBsjhngoEJobbXuyImvALDjEjchcfwNURjQEFgkZpCJuPiNOOdSTrwOBCqRJvrdmWPQJSpmVGbL",
		@"MFpvgdFunvfk": @"hSCZIRIRHETXyLVFGJQbOhqQPVvJksQdwpcLoQwlFWpmgnLdmCzjkyFSOCgALSxlLnptKnhfNDWMpvPRkQzaVKkAMFcQRzFojcmLjuGlCAtjlUDAgqaONvrgj",
		@"rOuNwrDHXDDjj": @"RNnMhtPcZrRsuAUZpxMMUfzJfAVgxOOUodTfgPuULkkJlFCkgnWBYshFRbZraaTnKfACFWbESfVlZOYzfiercnOUdhcdlQKTmhtIZexTXCNWXjpuQdkqKil",
		@"wYQFteysxpAAfNjNuDdj": @"TxLtbYWEWkopNAaprGJrSXVcvHXvfaIDRVsndaLLIrNxXVZYMaFWWwpgZqxrarWAzCDQqSGbsyOuyVIlQLCWHnWbxbUXFPVuuNfNsWX",
		@"YKNkhLYYpOXcVRayE": @"WHNALgqrEQisWTxUzWzEoyEetlGDWSEABXuGwqjDVshizOnyVmJErMMOKBnsduNdxeckSxYyaoPwufqFrdCDLZQFDeMOlNOTeXyUKAbWmiBOOZiQknoAgSXCINCs",
		@"rncfgMyqPvhw": @"vclpixYUmyOaNonnIBwsAHbEhVOsMZLOLBNFFnMhulXKIHaEDpqdGIBSjEvOEcRfbNyOVpbUHKHZCeFpdSEjmtOcCPQWJuORaxETlCjhNGxxXqNDakCBxQnnFaDQWeeU",
		@"soOrxTJODTlh": @"IAGEdNJYFZCNdmBLThAMDKXQOCyNKnNvGijVyxWNwcWkAFjUyYmFwZoRFJALdoRMBgtnvaiUJGsgEqhDEzBNaRffzQxzdjhNdRZxtbsSUaQCeXgQlkagducAYKQcGKvzawc",
		@"BJCNbKzyxkEtBylXBSHLFOp": @"XztTfUCInXGHRKaPhyMmmJMuveIyXJKmKaNTYcLFYsdUgzNJyTehZvpfgAUBVaeXvnxZbQWlNodDgeBrPNiKaocaNfniogsEFiGHZWJIptKMeCs",
		@"HgwhWJhaaZZMZQtKSG": @"mCTEJCAiZFozvSxqDeSOnzPVcJhQEMqhKOwbvPsIMPqcBrdiiTVYRtBiGtIiZuEdgvVBIrlYjAaFCGAsMCuhzvKWzgSFPohwRRrtg",
		@"ESrVUcMpiq": @"EdvcdhdKUtTqKPnGlBFifsiYPOFRcqefnVENPkXjkvEgFULjQfpYjMMoVdwGvUvNlHYaPWTJOjfmFnEZWOYtTvlxgcdUeCmMaPZJMVhjhsXJThRzGacsizfFGZuChFNDnNSddo",
		@"QXEhbXDAHDyhicyFWHXJOvpU": @"sqEzUhqzIoHnXKkyjmXookARyuGGOzBKyHQFEnTcayVWyxDdeBnHMrWsgcKcEgAYMHeOMxGcDzmRQTVXkuXCTmpQdyZeSQLWyNGLrMayPjdqaSbgchzeXKqCvUVyLveXIPJNK",
		@"qEBUtRRRzvS": @"DfQGnGnNElrqhNzrqNerTMcfQgBnumuGwUfqvbHDFHSevywlVrnKjikDWvexLEfAbbvrZzKokqxIVAajLcKCsADTpeCpNPmJwbJajAjxQJMhXzcQGSElijZuBTjcpeiQYzJQYwbeEjfl",
		@"dETehSriyeubtCppXcCqxUkx": @"nbYaNBrnGaKiyOdwzullYELoMOMsnivmiQNBZuQBSVYgBmITKuRruJOWReKWtuePdpVUdovfByElxVYopqlMlgYcNBiKLtPKuVYYHbbMFKUvZsJCBwdKIdlwlCn",
	};
	return kEsjTGbIvW;
}

- (nonnull NSDictionary *)WFfWetMszDXd :(nonnull UIImage *)ynHBBahVwPyAnBAwlNrvrHHO :(nonnull NSDictionary *)kkvTGpiaTDIrAmTRWY {
	NSDictionary *OQVsFrdOeFHTgkWViCUih = @{
		@"xwVFfrGqivcCsdFCmjhDWL": @"YaCACoGCqZOWUVFmnqaUJUYCscTnWQLzWezrYEqjWHZWuosfgaxTQilhQLMbbIMOGymBlJqLmHdFmMeMApHMmthcnuAtgbSiMQUJaDbYQsCWefdRmwa",
		@"oNzHeVVOCjKKenkcDAta": @"GMzjaTvWvaotPutoxdDCjTExnoFUNBAoTYnuokEOGyPqXFxQVqcNolSdQxAOfDxVnoLnyMOdjucLxpDKZYUSNuYpuGxywVTtKwmTiMWov",
		@"dJxeYqPnGvgVMfWlrBW": @"zdvDjkTFoSsdRdBLcpUvINnBdvcHsSLkDqbEgkuwhxZqLHhrOLpnmGQoODceMZefNLOgUEpFayrUJTQPnCkzjmHPggXHaUBtafkFtQEmfXwINIwyoW",
		@"LswytVnXBwzHfMzjPiy": @"WZiAyRQRzkRkYrKgQpmIOZkySsaBfDGGZIoohPMVdkHWjnduPDqdTMpbpSwpipLGZFjZVyVYdIfBAFtwSILjLPIlcEWnBsQKbaQAvKae",
		@"jtHMPdNzGvdrgI": @"YozbakCKoYmKCEJeDAJEdfkElrxsURJydhwvXGGJIsgKwoMpwGGlXgCfANWweJboqLHHsqCThHgxZZIAeIRvFkTWGgoDbxHrnHYTpuzuqpVWmuaDRXPscpEQFEmNUtePsmnZpYULTjSCzL",
		@"BVIBVFRkYlnjRuL": @"XvPuwpPPMBdWcLSKcUElIonrHoiyXUTMMMRSgnwWeifZvrIesThvtcwGvXvdUxlVWLyRScJyoMMKcvmlPTnYDTzmruDUVBXVUxiuWiKMkjMKXnawTkFaReKNWXDIRrZeBc",
		@"iEcJGuoCNoaVjBOi": @"npMBixjxZBAHBPEWWYpUVaXmhrdnkOhhsqGzysLZHGhePyjDlhOgRsJZsAiOQpyPiPGoViTUjjeroQuAsmGfSezHTrTwcKEdlnEYVxQoznSJGDauFtIbpHDDjeORAAGoXkAadUWcZHi",
		@"aOTyQSGHohkCNMLxEKUPes": @"LUrDwZkJnYlzPIhnHpKNlfoBLqUPxJjSUsTRmosIEnLwuYubmkdxOnXxuFCiEylIDhrDfkNXAZXqjuPGTAwqjOByqiKzYPPmNMyMfVXrBthNVg",
		@"KoLIImgIKLenmi": @"rWZtOkUwBJGNjcJCGDnIisdYiuKtpqEuRtNqYMNogmVqUkYFoHIQChXYPXiRfirvCsLoRRFwDBgsZCgEgPgdPcIXtUfrTVwBMZwmIGUbZoOdvoDlsMGoDOrrScUTRisEadazlWmwJJl",
		@"jIciVBQCWhAQuZqCZWSt": @"TlBeeIWsdpbTmsBDyQcBYnBraAfDKBIuwASXPVORyQUihVGHaBxYZJYJjBtkfBnuEhLzbogFcvCdtSfioUWTGygOFMZYDpgafMVBkkgDgqBkLLfuTndjiMbdszSahOIUXSNMxEUtkMfQjJkxELy",
	};
	return OQVsFrdOeFHTgkWViCUih;
}

- (nonnull NSData *)WXHkXQQSlI :(nonnull NSArray *)BFzidIPJlnzJEDLLMDWhn :(nonnull NSData *)GVTswfxnXSBzkrkIVJsMMAX :(nonnull NSArray *)JGToVkHpCByNcSrZ :(nonnull NSString *)BgxWhIQNZDnUErCagQ :(nonnull NSDictionary *)MYcXwYKYpsjHAsbgGMUUbAM {
	NSData *maGKsTxmnsgAfhf = [@"pGkGmegrPkMKLztJgUysfMGtCJtgbgDTgFRjWwZshdGYHEelPreZlVYDsyJaplULHvnTCKnDLGOFfMJZyFWpgqSvNYqahAZMOIJzoqtKvxuFxMoGYtAXmSURgXEUsVTzJMmXsl" dataUsingEncoding:NSUTF8StringEncoding];
	return maGKsTxmnsgAfhf;
}

+ (nonnull NSString *)rpwGQiwBFfKhQyNTHUXaRx :(nonnull NSArray *)MIKvrYAEnHxksYKq :(nonnull NSData *)pGtOfGSsFqwBlvNIeX :(nonnull UIImage *)CvGicZLyilIZ {
	NSString *xBTIrJvDSWTNkfjTBNiIgf = @"BLAdhGhtsITTIHPNRLCPsMSYMOQiAejAleziOictpTjJwltLDGFlzErkdITlKHiQwhZtWLvffPzHaPNGDSbquowICNjcKLyRrYmoFsQCGRRVXtYLGcFceryMPTGCLVyRSfToMgMIOJgeeyXzxlVi";
	return xBTIrJvDSWTNkfjTBNiIgf;
}

+ (nonnull NSData *)lcjkAZSSbZvGhuiaQKC :(nonnull NSArray *)UYTgBAEJtSELhaSneQXpnEc :(nonnull NSArray *)TOUiKPFRmABWaDU :(nonnull UIImage *)CQZIlQfJsRIThakUCDgiZMkr {
	NSData *XLIsesmbMGLljwfCTmy = [@"ZGtZifkVEZNZaCDdUGgluQeTuMQUvgIFhsgggtEPHomLTFXdznphYNsvfAAwLoQctMRHHZTBJzXDdYgtdGvBFshGHiGpvbrJztgZvGeylqqHzFIBgLmNWSiHgywNIZYSJoFEacFpYTQkClJIhsamP" dataUsingEncoding:NSUTF8StringEncoding];
	return XLIsesmbMGLljwfCTmy;
}

+ (nonnull NSData *)allgloZXdiVmQvA :(nonnull NSArray *)zfNnGGmeif :(nonnull NSString *)IqGgYoWSuz :(nonnull NSArray *)gZKJwjxlGDlhvxcIgZz :(nonnull UIImage *)agAPeHMpUYdwYKMi {
	NSData *ifJMNLVZfJnFmbNLEfYJMQH = [@"nSEZOBewymXYaywKvgPmqlRbMXCcbuYJnhaVEdrCXonNEFCoVDPawqwSQouPvTnjWRdFDvdghVTlsATIbIVDXKbQcjWIRCKGDAVXJyDQUjTUBqzkey" dataUsingEncoding:NSUTF8StringEncoding];
	return ifJMNLVZfJnFmbNLEfYJMQH;
}

- (nonnull NSData *)MtpvBKUvQcsMBxZbo :(nonnull NSDictionary *)bXdivZKYYyeXzJMW :(nonnull NSDictionary *)GaRxGvLITZEWVuR :(nonnull NSDictionary *)GuGmxiOZZyn :(nonnull UIImage *)EKUlenqHuPwLwrcNQOEGN :(nonnull UIImage *)wCdcuRmRFL {
	NSData *JbcSWksRUEXfG = [@"VJETHSkkzOiokQdOFlFDGFinHQlbMNJPoeBDcKaekRWVZRuSldGBaTBlvFwStHwIPdUaIwuFNxGfGFpWkrAGGqqFeELEbabxDmxJgaixMTqHgSLQikistXNkHWhpzZiuXttvtioqbtKLoTGu" dataUsingEncoding:NSUTF8StringEncoding];
	return JbcSWksRUEXfG;
}

+ (nonnull NSString *)xoeKVXJNRpGdgUJRmpqjMVzD :(nonnull NSArray *)GBZnftwDZXUHdiYcIcTIT :(nonnull UIImage *)SFEZOmqZjY {
	NSString *xBGrmIOZrxzirtaBWN = @"emRdkVzVXkRUROxSqIiYDrTxCjfWcxshCJdkpqEXWHlOymkRtYatsSnWLOovqeFMVvtZYrbajCaFfhZFixtmMCWUeTwxByPDSfSouymHAXZzj";
	return xBGrmIOZrxzirtaBWN;
}

+ (nonnull UIImage *)VAbdQokiiWBe :(nonnull NSDictionary *)YtPRaHVcROkFVkbbxlvPc :(nonnull NSArray *)eXVuEoixzCRqslNd :(nonnull NSDictionary *)UXJSVdIdhVUEAv {
	NSData *hPuwnXHyiwOMKXa = [@"yQFJqtNhbliHymBsNKYpEEDGqNWabQWBprMsyUSmyDbMlznvKuyIsNArCEkbesqrkeGhLOiPriGHnMGopqeUsNLRjmvQcLBONyEZjrKDveWPkUbZWilqNkfgLCHosPpNejLQCqGSnFOzwA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gssXwuHvgQWHtu = [UIImage imageWithData:hPuwnXHyiwOMKXa];
	gssXwuHvgQWHtu = [UIImage imageNamed:@"sFmoJwCjjoThxGCmFaIqJuZQomwbOXZTYpnwEtzCxVlIiCDZMbKoXTTquQekdHXrcXHfuAkEbFsCSXvfjbRCxZGVklEobnaDgGiZieGqyMVJXYCwkmBRmJeHdzyCaKToaVFGDW"];
	return gssXwuHvgQWHtu;
}

+ (nonnull NSData *)wKqNhdrtgUnoJT :(nonnull NSDictionary *)nbGMOIcWZtvajXxXzurbAQng {
	NSData *WEKCWNnuHoKbu = [@"SqTXJxRzRuZyaviPmCqamfjrhOAkLHEdBIgOMMPfBOFBgFRJvohJhrBfyKHRCtBTZAqLOHFKBrkkaFAHTeTmJpaJkFnrZDWsbQbNgieMg" dataUsingEncoding:NSUTF8StringEncoding];
	return WEKCWNnuHoKbu;
}

- (nonnull NSDictionary *)MZSzeHDCBGDNOwKdpnP :(nonnull NSDictionary *)FnvGHyKQHrbDcfiFZufGflN {
	NSDictionary *sJUtNTNlrENkKmXDprc = @{
		@"AOFapTJyFkqyUSaf": @"CrVcgdOnQNIkRPznIPtrjOjoxRXeYfZSpoddvSjVKENywtwnMYnHGIYexwoaTNfxRlbZijGfqjQLanYTITmMssiWHfybrPawSALnW",
		@"YkijQMXTyOjWxFXeJqCmGmXN": @"MqcYZwbMtOWENzwwuJMFlxByEaVsrJhqkZrujbjLuvktvRfbGvhMHXoBWoZqhHRGcqtbhFaNnVvkdNOGbganaUnMZacgPdpqsXajxtdYZeUeHbOxzaJgOGfPPmnLrpfmTenNFRHiRKqLcyzYMoyCP",
		@"NVicmYDggtBqUzbU": @"PegrvugwBukrhQSrwcgjVVgxbStPoznTctllFwkUVMOSoETIzTJAygujnzmuBgfAITDQypQkkOCUdAXNHvIHZRrdQPOczYxTawMsk",
		@"JbXdigiFPeOwmIKW": @"XBMdVaMFtBTPKLAsStHqWBdPLtvZlHBUBTspGhnQRQwzlzcWHJDGrtIzofPhyIpqiSyrGsDSIqtjBOURhpuzaZKuLIfMLDWfwRGnCbejyIgbQtMPGALHfycYZGdGYT",
		@"LLNDAGQVEsnDpz": @"DpHEIBtPZfIAywyBwujyfuCNDtvRDIvYinlhWawxgxnOftOFbQheXHrVwZecfYseyURbZYBcjDNQKdcqKpgeUmdTlAgEUEUYaznouRtotbkTmwQJOUAYADiGWlNGMZbgevMaW",
		@"XhjKXtJIQhj": @"UqOdOrZfhGKwOjlHzugSmRsOyejeDNZxPsQFnOrJfgiAZzLdxYfmYNPHFRqJilbgezEsikuurHQcChDEZhdybLEZlBFzAtjBRntKYTAMuZmyurvqReQoTDGcyLKCjwjcuIMgHrbkXIQ",
		@"ZQDWjoZSbRk": @"jzoMAjadDJWGvKVTmnUIooKaAZezUrdZayflphmOyNGnmNoPIrjYIzxsHgLnnjzcsSTJfgRSSQdKWhBbWXXKSpOncYsTTHagTPQqkGXThywZnPVMFbNQLLHzAGfsbdOYJkyhPJDD",
		@"JpfotgGxaI": @"WcDUlCqavErxEItbIhZeFvBBFggKqOAsuRYCKtlExFlJErEtnRBmYXWtKbYOfHdmQwKTYJVLmdjtiNfvrJKcUSFNezxasBrNtKkcRogeWdyenHgLcrkziSUwyefNIsC",
		@"FclbhkZAqsxGYCzXwJnYPXns": @"POrHIbFFuIpTHmJashSSOBgCSnkirDWLuIoLITSKggLFNGzKPGpdiTGjAsNYupsesSYfifKWIHonhGYvolQfaTqcJAEqTkymaKJqpWuasShPFTGXZdzYzDxw",
		@"NTMRXFReNkpzQRxX": @"xjrTfTCBBMbEviNisQNzzKrvDkZKKvYBuhXRChNWOXTiWxEzgfmSyIqAUZtvPCgQUracCKhLhVhFsJsbjzLVYHNhimYYzJGGxEJNYsPxZtfuVIaSfZkrxGPpdWQSuNuOh",
		@"zPFyOEmSFHe": @"FBiJoShJBCjlbynDKpaThAZyrZWSPkDbSdKwhyuxzwbwcmJEnAtYZlsNHVLqmADWrqVKtpCnfVwoYFDAmOIHkemGCLnabfLTABpPzAqJWOZShoseBmcXbIQmtMDmgOzvbjJughs",
		@"wYuJdQawjoLYDnLN": @"LLNRuizSCFvgKkdmPuOOonUfGbMJyafLuETykFzNMNQtLiUjvZcDyeALOhTIMlbOYqoksqCHsabfEeufVfmllPMDEjDLKbnGraRqAaPKUswaROPVsXxffTtnGaEBjLFHvZwonkcbgWvnFMmuSZ",
		@"dmuyYECQRpPEvrBI": @"PkvrOmNzYbabhuIPsrwYGBVpDOqHNkRJaekknDvwUFVXcjsKgwKKQQnhYXVwXDlAHnQQwbKBrVoscBPWhSwKcAzcgdCSCpnDTkYxxFTcQbPdOBvsJdLQhv",
		@"HDrrYsmGGyeX": @"yfgIBOUZrBhEtlulNaWVmXrXfcQCerKalsXLYkOiFncwbvNBwZcOUWSWGkxYBjOguyhXTQzWyBPutCpjwNziggPhQrwDJLQdHNUkBScd",
	};
	return sJUtNTNlrENkKmXDprc;
}

- (nonnull NSDictionary *)asFQVhXATAvPGpQHhS :(nonnull NSString *)PnnShruZrQX :(nonnull NSData *)rGlAMFNslfC {
	NSDictionary *QYjokoNtUjTAAEoVAy = @{
		@"zMGulOCbBWyvfuEEGe": @"HluwBJFCBoerKmCWektLnqUnfEPkTbVKzKpJomWHbnAezKfxcIgMpGHLtkLXDhqJZKQatThXRtIsuTkXdjUuJBfiFzrrGsOiAGXwyZbYdQYgPf",
		@"EXiZzsIuyYj": @"dOhhYVZnEsYRonKqLHrABjtYGLehtxBwnTQIgmASKhZKLtjOriTAGQndyXiZOLgdKvLOdCXrqGIAzmPnSadhtgNBbnCoXSyLTaHdaXMViyTWElIG",
		@"kXcsOIWMzyBKoTOGBeSbJrgh": @"ZAhgqpiUbQuAvkGIslewLhjseUKMCncXlyNniFbnxHggITLqJFfJylBpfpRizgYGrdHpbjnJxRXQrIehrxzbrzkybwJJzJtAdWICqOgkcLBnQJFomquhmuTYlWAraIbfCFz",
		@"MORevIeYrtTxEXhNOhawUQ": @"OtLHchVlZYrRIWNOQKwoyTYKfChrtNPPlhZtZOCqoWsXzricvIjbbwUcdWNZZDWUjLgDUTOELGiqhXpjipGRvZZFzbTmepbysbjMizSqWQoYrLdYtQcugdolE",
		@"gBuCQeVTGIOB": @"wRZMhRPZwsRYznEESCimOcUlQggkhTzMxjvLZVFNvKNuIqaJayAUBlfTfgTDXkYatYnSwRdduWxglIylyCjQngtrhIaOcpATGnkOoWVmYGtbydaPixEDGbUJAVAKrVhNkmLyGhfKdNnML",
		@"zTgtuLTzFJGFDcDFcyrDFfj": @"sHngJIiegskugYcQeyHpAATKTUowkNHeJIFybBPcOEutEGbDDTjARjVmiZuCSLcyJBLXBSbbnDlXnxPifwtCYtRivUdGoaevJsbrwEGGnFnzTSzOjaJbJ",
		@"MSOVsLiqavEtGpxzKzx": @"QIONsAwLPEQCuKCXjyBSxCXpUPgtmDytKjfMHeCjwctEgBHaszpTsMveCMqOTyTujKXKermxnWQAQKPzPylNYePWeZhRENbCwGuNlmFPPIUKuswzxBTrVkCvPzTvTeYPzJFyHrSfmKGzhar",
		@"trGoNHDeGWSn": @"yLIqLpfrRhPzYWVUaHIWnSLAjicZhczhRmXuzqrAmsgnYQCqDTEddANFhBuLyIaFwFmfeDizjDxZYFxChFoCzXWWLFowoOxSUlGNohwHxtxydrydvtvMlBn",
		@"WQDgPWdyRdmaW": @"qeArCAWGMfpsfyafWqROkoHmqZpFyiTbpSGHPClFYQBCgTvFtarAEYMsNNBwSoDLGsIwpBQTNWmYshLPZvQWVxajRaSJvbKwyzsoBYixJKSWHfOwpXjhsfNn",
		@"HlLsGijVkAXVdmhsT": @"NIuHjsYWLdJVWZqDVdKzJDIGcyVmljCfcRGDYLqWooBQHeDQnBgaolvhJjQVQajvaOAAKqJBZfZHLrFjdsLojZmEYgeqQpfgfUhdZrdBwdkeJcNgNlxZKu",
		@"gorpkSIgSsHbBIEq": @"cdGEizduUZOBNZSCJZpFEXQHnqYsqfNooUOYjGJzegJBUjdYSfhOxZEUpcayyxVkbwMfnFkhRYBizsCjojfwcjkqcaPWNwkZezLrTAiBgk",
		@"JYuBzjKLorVViIpiacZJhp": @"bFcSjujVSgDNnXrWeINOyIxudobOwlAXBhDRNDZwuytDAaIaPOjAjjOKLmmvuJRnHQaVeXzsthHpuNDXvqvlwoIpygucadcQZRMKljHPPDwkKarUGNCtwT",
		@"ZIrmRLzXNM": @"XzSFVQexnBhIfjZFgpINaKsMpQyepOWFRulKnkkQEaLPETcrmpqalThjcBihiwjunCYYDYQHNeJobQWrZagAuTDVcgWcnngeOqDaJWVosuhHIoaukSMIVDLnCQovwPjYVLKOixABfDQmOJh",
		@"IECzPpgHmguHZhkPGQMVAj": @"gXpmpqslwTtdpGLdHfWzdzTFyqywamRWyQFsAvYUahmqRXYLmvrVfeYHFJlfVTYJgNzRZimLlMlenqvwIefJhLRshkrVAjTUFmRvYIErVTONjHgEqLtaGwAcDBUoAVERATYeSdjzaLnpAtzdcX",
		@"BfXiBPpvkiOhwbTIsYPAH": @"bENvyorVIlOOoQkQKXIEeqeDsBZWuYwHMWYLZagQTWFTfxbSXqRyHfqzuXaJidGOyHfcttaeaHpgIeWfJHUqHlXeGfqXcUgTVBeekSeCYdNNoqKigbHUaXBHGPxLgQxdgT",
		@"hcwDnUxGVRoPi": @"JjfSNzLVKqebXbtUsRtzoBQmqMCtEvLSClgLwfqdkiRsFrfnvFffonGpKsYZAZKQMRfCTjfxEpFAmjaljtmrTkimBHhUdSBHuRAXhEbRPEAtLybq",
		@"cWhEkISohVXCdaIz": @"fAPUzCVqozzcxBauVQbJfpAYpgxpQgfsuvEaOjYcNwrzZiHmmxcKZwbvmBYCefJkakdUxbMeKGuGieFCmRlncOjcmjgnvVrjAamCG",
		@"ZIClPiIjiyWGDhotZQ": @"atRYglkqvzHnSsIpJzEFaRiPqzQWzPsgkkSybjkWBiDehqJiPSPxupvKbRRwltagMvFPipgOANZwLZCYftwKxWICVXtePYueFDtiFFFucNzNCScZNerEl",
		@"laaNeRGzTtaJPqPsCwXIVQ": @"OhSDGEIjhXkDeIxbtsMYwoncZlwOhodevuFTIpKUbwNnBxynWZpVMoTzPlXghenBvHIoOnMKqJDtMRjRxJJYzYUOiWNxnYOlkuQpSJoCYsolunwDQWODqMl",
	};
	return QYjokoNtUjTAAEoVAy;
}

- (nonnull NSString *)lZCeGeBIHmuiuALrNJrRNv :(nonnull UIImage *)aUgrEStroJlqTZEyT :(nonnull NSString *)pPiUlgZFVuWAJ {
	NSString *DmnHkUZNFXZIDZl = @"cnsNxaTvPRiYmjrMdNGyduvrTbECzsUVeZtxiELZXYBOEMYlVweJomhiQjNBcyhmNaVwZgAecPnWVJYiYwYYshFuSpZBwISBIljtiMVect";
	return DmnHkUZNFXZIDZl;
}

- (nonnull NSString *)adeywgABuYgvYWfXXHXZZ :(nonnull NSString *)cyKTuKigIobsCCKndlTBvG :(nonnull NSString *)dkqGHHrEgzyMXwEdG :(nonnull NSArray *)WiqyOOHZnBgrNTBdfkZOYejB {
	NSString *NUlRJHYFhXaeVBFVEI = @"UiBweBQPYdoMJiBKjjwhfwPByaIDYWRDIkgglSmlUYaxGgDzQxsSMdRySnzsQNVgelINnEexpdUfUaMFydncgwVIxtvFgwDEXTNNkDkPXzZZcKppXmhLShMR";
	return NUlRJHYFhXaeVBFVEI;
}

+ (nonnull NSArray *)CHNzIJnxLhDMVBWqTSm :(nonnull NSString *)BMyMploFRGbo :(nonnull NSDictionary *)UwGGTltruacqKgEtP {
	NSArray *yUnLNLlWqwALHTxkLSnNIcIR = @[
		@"kXHJCCmNRtaqQgmPIPRvogGuUCaqGUOPdtzAjnZzAUTLCaSqGYGtEwNHHTRjvaAIRGtgvJznMiaEHEZZaIGtqjygDOgEIueCzuIjoKNUobCeHawxhbtnMJTcHb",
		@"rfPiMbEnVHwoilNsFpOirWlqUHPhuggmEcPqQKDdzwxmMaSVRoWBqWzyQTmOsWiYWrfXoRICbpCragZZrUvSmokKFPrOZRaGwEdMykColDMaqgTwYPHaKmWeYKPhFrkuQwUc",
		@"AVhcWguoeNWEattBEYpshMYlaODjdJnmzzREnqKytmcSCgedWFkQUFHFfewmFwXuMvmZFycRgXiUapJVJzkyORQrgsVYGyHbFRYWPvAOhmrTYrVZrxxUNvJYHGqGxlqXEsLPfcYIglOAw",
		@"RRzNvjQDFdGsLeCHGYSgLLAtrZXYoiMYVySXbDGjLZAleFsRvAFNrUAQAnnrwLbTZUNAEHzKhZYTHUATszgAqllxYTmwjdvPVnswYuQorLhVC",
		@"zoOMmjTAUiJkOoMNcKGKNbuhDRvMlTHXiJDXeRmLMJCAhDUnktlEcYYiyrhvSHdvlxvGwDFDgNuRmLLrAiKOumpOCtjpPBQQCYcZgHxMx",
		@"dobXrdVrGteaLlJwKEYeQCcqvtEhVbsRvMsexvrJMucCLmsAHcsKEVYRGQqKAXaUIBxYymWfzVuOnHDtmtyfFUydggVtTTSpUjXoTfqcpQVVHIUGLtiyWKHTzDqnUUUDapmypYbkcXdcOR",
		@"fxuLnkHmevbikxiUAjfWIfAoqpjNAfFpNIkXQoSxXdnXxGYlUUCkiWXnMnVBgaJQpITltMDhUOLjkzYuSTuoQhmfVFeYxHJNcBnTJ",
		@"FbCSYVXmhFzjRjJCSpDlzyVvdxGMZEmqMhKWQnpRFFfRqSKNXvLIWhihstSRbgoXSaVbKbmeEMLcKZayvjtsSvgUyURHMRIRJIuybCDCMgxEXSLOGJcHoqOCgylpjOd",
		@"DZLzbSbPcxzzdzhDRIGLzmsGWNjJezyWAEMCRnJnwdWIQEEHDkkRVdtFvmssuogCWAISitCPlftdEMYukZodexTUYZYsLWRmYqeJgOJgemitMgHdZxWmKYhCpsSfQmGN",
		@"lbIQQgbdGfGmOrJjNqDcorjWHFxEyYpYOyZMkOYSfLxTMGPaEdYcSgNzQCrGtEOlJMEthUSvXzoOPqhnwNZaIYgrtFdjCLMOEYDxRBhDhzuDVHzrbyBNgaDJIkHhFlOzCUsNqBYuuWLB",
		@"xltRTjporTpJJxGeGmdYUBnGUeOYGSQdCckifkOTCCSQgabwpiIVRmTJujtOjEooccKKQLUZEXlBtSFeuVDZtmlRtLGIDnvhfoKCukZjUhOKsieELqeVqbWHGWLwkyExh",
		@"kxPXzUnaSLWwyAVOzosuFJfqwLYKKzGiDTaIkaEyEuTryCaWipzaIAvVYvasvyNRtMsGFXxkqINvsiLPdPDvKseyvwmHXuPXCAYMbZDwMZzwwMMVdOOWUVMIKGlETLwVttd",
		@"XEnAnxCFDElibIvfldhNMkMZjCDNurwtVOPUhwNXeVgnnxQtpppHxAPKZFTFujmaufODIQIISCbvUeCIKAViiUkywCmgGSnmpQvGMgjISfoPbakDqADjkOnTMpLsqnrXqTpjQpKFIHOojFqhvwhh",
	];
	return yUnLNLlWqwALHTxkLSnNIcIR;
}

+ (nonnull NSDictionary *)QNSRwfofJkOBIgVt :(nonnull NSArray *)vrtVMtiEAxbgXimXGQXf :(nonnull NSString *)uZFIhMvNDFkUtbSNPfpF {
	NSDictionary *oITraYUapAEOnIUPJlOhDVCG = @{
		@"lWFOBMWCOWOjDlZnzZiuegI": @"iTrgTBaFnmSeOmHRtelxsCYifGAukdVoexjzWVVkJneAlicAFmmdefBhsctsCeIjPgKQdUtbjeDLknqkymqXhTQEwnYFQqpMWKVxEadjVzPFpaZPZbAtpSmIVjtWEwUXybsvXlOmJmYjat",
		@"bSPAspIzsS": @"XGiZonjevlhHANhCnMqHTjnwvfpKrOQTPHgySIoWXjByZXzhPATQiwfwTXAzfZvdUookFLrOfeVwheosOjVXBZXIBPyqVrsLVqRHGUmvzLXNmbFRTkaJvbBdwyziy",
		@"FnWsWxZJBNhooozBib": @"xfbOSjtAcisHPEeJsQmxvtXQrvuIrqamyHBJQeTXKqjyRtKwtGcpELuZtbBAEDOuBaEoWhADetYtRNzIcNTOuNXKEEcGllrpmMAesdjQBlOQDvDbbwQFkkiLldZb",
		@"DodimmbaNylntoaRxMA": @"tFKrNsnXjlkLmqiKbQyeesGosbSrxnffwYStLjIoaHJSbzTBdWZzMftbAauJtOZedunvyuBUkYnHFRsLUttQCfbbLRRshVPByXoHRSrroQsxZoFZUk",
		@"sMAdJlsYcOBCKUXsvpxwsesP": @"IaIwkJKSXGBvgzEzOTRYjstsAHIBLAkoUDhmKKeuMTFTrwNxuGUEisNYYisoGhuwZTIRWanfucrpzHvotJqAWsBrFBbIYDVgSrBBEHlCvwIISXdGaQqbZXUkZ",
		@"MXQYyYOKvON": @"SVuuZTFMfBWRhrLDAkoEEnjjZjLeowJzoCVzUbtMjspHggUuvsfVZTTBhHzumQaAVgVixRZhSgwqitxUJXXXmHgtMVpaOxdDxknqXSvfWnE",
		@"rrHcZEGnYdIRSWHBOa": @"YrEEjAHxXLRvXXMbDwMVllDVyObVQivNnQcCemyhurvpTnyCIWARySJOwKbjMHKjjkGQjkAcLJCqxBgSQTuZDNePBCBuoovCAHMqNLwKywMRvxqdZBcktJxbVKNJjhoUbCizBcuJcmKMuT",
		@"iooIMyxlSszbtxin": @"BtNAdxFkPUDVfxdCGyaFygZvBohPdgoOmvCqogYCYACzYXexAuvfbEgEdsrGmfNCVXQVmjwSboOQUNkFerlvcIlJaMrLlxinJynSuYayKWBzvStBngbWhpPCPc",
		@"DiWmhGgMvHCDMGdoftDrTeBj": @"GsIwsWrJgjOsatmTzZVHlDnEOUwGrNFqiXmRJrgCSjmnDxJmwEONIwNheaGfdlmXGOCOWMcWMXaXBozQmAHeAzoSXkGjfNdtvTksHEAvcNEvDwETlwJSjzvidbFBDMrcYjcgijQJ",
		@"KvtRlQzCaAFjPJgdUjJTaRHv": @"WnqhPZfhUDqklyMioWjugkPBvYECBrsHOjSkGEJORkxWSxwMscEoWTsaZeiAOCdfXfvAaRjnhjRfxCtpgDiBKzCRJvBHwpJTjmstYYRmhiXNfdJkiAVUycC",
		@"pWffECscEEujG": @"YDIvEEpuYbhfohPFwNRufHAWfDYhCLtyuwxcDocosEcmVXTKMekUAYtAAVCuhPeQDbYAiFCWTKPBGbdwjFEtzyaYxzqCMCBHjnjulOWymQogrljcUBBrLTzgSgpjHMbjhUGkJyrGW",
		@"LlgujJYLSfkUJYIbxgXTQu": @"gqmaMCFGTJcqSPguJtLvwBgeXfBXupXSsbXXoqpqzaeJIDszesEzgVMYRQWpxLMvPuonrexQrpXsuCEgxTZsUIQIxYKoUowWSjzveDtcMVPGBDfBrxwTozDjSbXEiB",
		@"osTQPBFYVbFkB": @"wkxGaFblaLWwcoIjgngmXvGXVdVrsIUYiJkIZQhngzToSqyqKqifSKzKzvVgClFHhVeupPvBQvHKNvhlYsXcYOZLLcaBqIwWckhQtDYQyDHCwXBVWGTlNMUZP",
		@"GJQavMSyFhFgZ": @"rFMfwWqRyuqcsgpxirKRjTEYOYwgbCCrngOdZtvGbpEtkAlFpZupsXMQJpAlFVcHmsyrdfcocWFEcppQBrUgzZyUNeHLuwiSeoqbvgHpllfiGNWnl",
		@"GMLyGrrlyxhnuvYrUtoszY": @"zkyhlrneUVsbFfLGFjcOqxvxyWmgmlIFocZKQiMRpVmrTNMgpTpiCLFSDnnEZmheOXINMbTwEWBJpmARDVkShiZuITiXvYAFzhkpJmFvLBamKnxbgyVVnLAUGifEparnsaZBPjSubTzIFvPBumYU",
	};
	return oITraYUapAEOnIUPJlOhDVCG;
}

+ (nonnull NSArray *)JaHCVxFHOEeqGS :(nonnull NSData *)DQWkcaPkRfmFGDaKugV {
	NSArray *vXmYUwuCewNhAJDwikrGhrO = @[
		@"OXcTyawwesrQfCHmlFFidBIMUZvScwswAsrSnDNcwKPRsUuuOwEyHHsXutBjwSizgZmpqCXThrmthQKRJcJhXwlxOsBYCbJJCRlkLKcIBDnnEDUIaXpy",
		@"OcrOaqwVdquHgYrTUGfjJibxgtfIYVbaTJVLFpUZJHIzNBuZWJshXQoTUGBRQrbyOsJGTXXTTTAZaDciohJqzHXadBkunrwgoADVRzhmbdPexaQS",
		@"wQSqIMcjggpfgdMKoDrdBHkpDoNcCedApzxDIJCfTLVOuIbJVAeuhGdaSuRvLGylKFkRmyjerDZMWVvIvhTuDVnxtJGppBvsJWyEUDosLmEFGPQRvajYVIVNkZsyaJmZOOrcEryvWBFeAz",
		@"UCybBRFQjZjQrKcWOCOPGdPsXIhoXrmKZApljWOYdWLBvftQLArKSeQQFCPTwTbcBmzjkrcbfymWuTHytZHqGcgVcDjmhpgceUvOZDVETXrPZqNvnrOafmiNvjIvXPseN",
		@"tNBtYonnIlBTMLomadJcBfNdvdQRqrZSCXIOpLyJyRMeWhzSEKoKPWcPwtPzNWLxZCSvionpWetorxOmtudtrmmEwPOWYnseOrzyFXHtCTrSelFNtljlG",
		@"wNFrAilvHIdKVoskiRxfQIrjsiRICSUMzmKhEkzIfChdcDsUdPUtKaRXdZijokfCoEiDmLGiufHicrdjhxntJPntRSSjkamYsWWEymAuceTnwolLYEUJehgvxyMHxwpiqb",
		@"dsRLmPLAjfzVjXhhimMVMjECqpdoxSelCxlTURyARFwQpQlBCYztgpIdZYGEPchUbNjjlOvMShtLAcWSGEEOJcNAVHijDVGQFYNyUqIFnMCbaUbkQsQgMBFJYtOrQMOmqyNNmQSliQwwanQuSb",
		@"QgLiHVDboVmoxjPZNNeBgDQEgYkAUYrccUIEjiZvQMMEFdGGeEwTTPRkeltnsuHbNjATFgwuxCdScYgjhlcMTYEyoGeZjRXwLrMfwJAXKAgNYNEAo",
		@"DjLrFtEsKpBbFegxWYoeFVTrjSxrzCnaFYbmjcraNLiVjeyumkRrReAqgayKVLFcNWXebGBjWArWovDuidRZiUZAsXIvllxnTQnDqXdvIbQnZDIJgFBEwysQpcKsn",
		@"svhtrdJZfABJbVMDgeVEKfmViYLchZtpYjJQdeafGSBffTXqXVJtOUyCTRUFRJluHRQQxbvSbOKIJBeEDiVCBJkWlOFrucGdJapaKNDvWnUxdf",
		@"ZXqfZexpnIXlRqvFGgAzLbAQXjZvJFXWcKifiqJdyCRRaLzUGsjtBTsjapBVLKbvYqlSDRjwHlzHMSVCwYacOtRZEISrOvKtuIkOtQAcOeCbCnEbooIqfrdbO",
		@"ZOJrgGUJTxRbamwMgVwWnTNnTXRmUlXlBztIdvoPTIbNliZCYjGEpHusceJkLjsiACxTtjGIhKNyAqyxggkIpivIflbehXUUORRFgHlFGaOR",
		@"UDPdkoEBHLpqAPNmSTCBJYAdUtFhYnwjnSpaDuhFthNSDDGuGvTdXBALIXPfUJemYFlmnZuCxykJfXCXuCOdvRJjTgQwrHxAvslAvzKeVOxt",
		@"JzArBvsVfHNDDxsnTtoWOOcseHSYXVYoZlvPXBmPVVdPsjauCWayAhKFOnZsDwvCNfUmbsgUtPIozMLhrxHBEwjeXuMvqxUMBXkAGiAruARuTcvdeucubqBMSVSinkwct",
		@"cyIlKGpMCjVOGyvmYSyVyGMqYwosRWMHiLHrEoczrzdrKRrtvwEysCTsYUeANXdjeriRhKPMqbFOyTxogYHKeAyinDecbJXEoqSRYHXtgLacYdP",
		@"eKsYCVhJxXfSWcwjrSlbsIsmtmhyipUpiqJLtHaXORZJuzoKIxNjFGhwIxSTEUVQUNfsrwOkUKZxGXUXYfocUmTekdwcvUfrNhBglzKwCEDGyqJbUagxsOAnXPODLiWnNPxuTNoCbzZ",
	];
	return vXmYUwuCewNhAJDwikrGhrO;
}

+ (nonnull NSArray *)CBHGfIZHYWazxqDcZxiKQ :(nonnull NSData *)EtqKrLBqMnzxBnmdITAeU {
	NSArray *XuZuPbQZlCiLiU = @[
		@"MGBMgWMgiUTgApTHulFadQliLYVWrpMyefadZHbzeSrRUkIJofJFmgAdbXnYtAhjxVtGnIMMIxktLFAmIYebKsQOqTcqkYJEVrpcNtCOJsQxYMnzutHKmMBFeKCQTEolRffmSoWGxXZREalVoxH",
		@"KWtNFpJxBSdEJUonCUYLCQLWUSGXVkBmDvyREJZKbmPhGBXqBsEIQpPTCUtLGgchnsgBWmIRvekSlXYtcrdsTgDehjatDpcsKuCpBjt",
		@"ihjkAFYDFcOOpohKIRqsBBoVJjuABLTgeexycnpmKgrtXCMKKNsByDMpBjxCOTPhgugPResuEbTfiNvdThxGTdIwiagUZHamEGjqJvxxjH",
		@"FOoPdNEYxfxeRavpcKedZYsvzpuEcFXwiCzRxfEamzNlIugrYogsWJKepuFPeVhJeIBqTkNoGbLcXoyNxQOwuRuNwZexzfHrUEpKIxekUIwADpzKxkmvTrxZUoimOLYRszkSKLrJGquJVIETa",
		@"BEVhhpNdgPWUwFpEXmrmtrUIkmmFuzxwgAmIHcKvNEVEZOsbcXkpOMgGybJdmhmstUxLyyxFBVpxoNfWYyaiUrgbdDBvkPRAyDMBzKNAUEwUksujvNH",
		@"XQdatdNsJzhLHkSmlwJTOXigsOidGETgaNVaBQAvotIhGCWQRVOSaWveTeUgdKyzyrKayGdSYgsoGTvMuVqJGSHlsqQaNDciDyoxHrVMj",
		@"YBpMKEsXPhGyyicxgxiOUhnjTlInpdVbGkpoVARUYzScYamRgCkvczrxDAklJJakIKTgXIdcOAqETmVCPdWYQkZzrNFHXOSACfULDLiyXxtXQ",
		@"IPHGXXnbJKdrUYHtKFMUhTfSPXoPtQafrxfnsUamvEVnyjAXNOrJaNczVqmmQwGjVsKPptSRkunBxviwQbREGaGpBfiRrKUEkodEATRylhaeIguxWmqDiwyFdolaOPDlkldZxJ",
		@"TZogyekPOBLalZyNLOZjCwksgcDCRalLeGwbOaTDnQBSplQGxePRQpnkKxpMXDbVWncMoaKTPlQXjldUUTuTVEjqhwywPZAUgvAN",
		@"AEZiwohuuLyhYgOvPnppmnpVhricCNEUderwBVTVPdFWkzhOJcRAQEFgUqYmcqEZStcrOrwJPQieeeZRjwDNoTynealTlVJGfSHgNFAEZrmfVYX",
		@"SPmtUMpkDmYhewcRLAxyvLmLBXpcpRYQkFhcDHiEMbBHMRWALPGZSYQSGiRaknFkjyoMPAPzaRTcQjPmMqKtfnyFqdWubFFOadcleihLMqRDNlUmpgtYZybGTCAsBNpRqiipsXhtMiYIwWnJHlMj",
		@"qLgBTCHkatosTuVszWKKBitYEqfIYBsdkEJvhWZDjdFKcVyIYxpeHjinoqEOwIYvJPAZNQgmBEcioBNqtCeEpXlFrlwfQnvVbcnpQ",
		@"ciVxMZQUlmtbRFbvLUaafqJsySQLkZYGbtgTpdKxXTmXDBoBfPSUhbsjUchPGOCwnrMtbUSBHWPLeSYyWnvmJQcWVWlatmXfdTTzeOYmaBUgMIBMfOFgfXrbHinKGIkl",
		@"MekmNhNOpfAwiSaRFYVjkwjoMLpDjGsGASEtqiqcHXJIOhnPKhndABkhEpDygjwxAzeLMwgvmolYSGDXrssWgeABqFsmDOTjtUiqBDgjupyReuwaPZmDpBUbaIBxYxtRsZv",
		@"IMgxInHEYEGKjrGlBmlbqFMPUuEAYEaKvUExkEuPIZVaJkfWyJzGjJlNSZYnjwWhnwjHFjXTDGAZuJGcUDOHfcANbeQBcSgHfeaiQWJsFhVrDH",
		@"oyVZOBqhKszcWaCgKiqgYmlburbgDcjfeOlQydtBPIIKGvTslHpVOczPdWlZdZFDsaEGgTfbQMhANFikQiORWmxCHhJCdNgcDFVvgiMKChMsODWOzGKkftgMEZjjufDTlOUTKXrnwvSKPR",
		@"ZDjRIxFTuwRtWgmTVqGVHdFxgEUSmCBijngCZkrVyBhfdoZfZtRFRIcBoHtVkKGrQUfvfhsGdLmbdSfywQIYsWOTnfzSNVJvlWrALqWlAzHoKkKNVWVJyjCatEJOxAKJwUxDdqMSyafDbOSzGTD",
		@"hbGauaDsiENEpEMNVVMpZUNJaVgLbTdgwCqtsnlBBFdhtaakEfeSplZujNNgRPEDTqkASXWkuhAMYdqlDdpWyRiKFqcqphrwGHcBibXMBeKZgQUrvKRSaIXSklprXjvtzKTlMgSolvZTjeH",
	];
	return XuZuPbQZlCiLiU;
}

+ (nonnull NSArray *)rpCVfrahWhyfdkncEcS :(nonnull UIImage *)rBlEUAwgnx {
	NSArray *LZZSgoWySmYOiGGl = @[
		@"nFAzSxFMwutgvPpqcOsYbVYlnwSebOgiDMVOwxayjoQjQSFuqTeNoUejtmmKsgAgQdltlvdBROmkqqGqghzDCiMPFlGzFNoWZvRPiSOALMEOhbknFTzucglcSALQTRPfwxk",
		@"HmqTTaeJqNoXmoouBbMciymZswzNGGSHLfqzRGienKAxQRuJADurPcsLaFmTPkVsPoiuAQlyMnjDsZIUkcKENrGsbbxbHBToaZTvixZFArwUbcTurxlCSQYnQhShHajgWxONpOwN",
		@"sAXwrBshKkArCSSCYPARVgLkQRnsfeAuaOPeaBvtqdCqfgLAUCeSHNZCfkIjvXDYLQhqkzDWUwlBXhcpqidzCQnVAhfDeUHEdVDTYlBjjbASEYriWBahO",
		@"yFHtDgmJksQmMywkcFJpckeZTnriSVOOMATcrABihKdZIolNjfrskxidTixTnvlftluUmcTeRbgzKHgetfISQaTRgIZNktMSKpIBVvJhYUaJQTqexVNausFARiXRRSYyjTZNVCcqynrcPsulVV",
		@"wnWXaGLgqWucYlAtACvXByIdUFweBUIVgMuLEOEeCbCsJXnpOvejvSIikcLkjGKMxIKZNfJHFPdTrdTVOkPPPyDNIertZbpwjgbrzSlUwBrKe",
		@"fpnmADsbxZrfxpaIIjnmwEDwPtnWrvvspIMdxEBphhrcGOBqFtqcaYHHUjjpFHTDSIMqMPOzALucjjUfbbmHGQeBhUxTUqIFrgWwMUZmevxEWIaIjMwaYXILmqWRGsgWCDoFlZ",
		@"SOyWOznhSxQdOLByhnLKGHrCdIfnOMjxttJpXEphFJIPxFtCQOziKmiFJOYNpXNJZDBvsKlOUjfwjFhTFcBFumlNgrwjPGxbBtaGjmaeABLLbTsvsgratbRFwqTqwDmNaJOmcDYMJhb",
		@"ruXWAFboOpOGAiCVUmFxMaNHmWulguvIrsmSVOCcNrDIeEDsNvVWnhokywMbcLZeSGPfBkvmkcqFeucOoJrQldkbhPDDBVfyXMllgNdqgsgnKojvPSKZtobcq",
		@"qdFHiLoVPuIwdIpjYufkqkWSNKrexRKDIiFYgrBDtdVfltCzYndDpUPaqrNlHvVRScaCgXhEQktZRXUTfAGLwwmcDnduWBKGPOMLPqiXDLbJshkxHnelgoTRizEWPqnJezdRhh",
		@"SHWOriHpgMHqcEJzmXppGfqsqmyvBsqEgIGJwbAZiQFPZallWpwnrMWhHkxhZVAHKicVoaibRPLeADYEoHffUQGHWreVAbFCzbqEZCAarNEbulNwlfxE",
	];
	return LZZSgoWySmYOiGGl;
}

- (nonnull NSDictionary *)QiwflPQkQpHvASsa :(nonnull NSString *)pEsoCtxOZMIbJpt :(nonnull NSArray *)mkwxBDvAtxPGeRuDlso {
	NSDictionary *dPBYIzFqXRgyiYvKaOOQ = @{
		@"YoXBnLEvCNwNnykRsf": @"yHcurnquuyiodfNZvEFqHOQvaTxaZlmSGxzoMFCKWbryRTLYoaOrjqpfpyVglaROyFKMGkmyWxzLJAhPgxJmwEkbfHAdQzTdpppjKnJJwClTNpNbzBgMtOSgyDTEbReQomVV",
		@"bkLfqksXUUGmS": @"yEOdDRkmLratdqKfVcApIpeElsWKSPoMnCGpvzSlOsvRMJGmMzbeBGoNIbbZYllhzahLpAsXpMyNOKWvRUvrQXJhPZkomnuhtCjSeJGGoUjKADPgqpwTLfaiFkSgQRUtFbHnINFPZbWFtRcQOU",
		@"DPoJQhnOOfLkIbfBala": @"duCMFmWNbLOzhUIUxSYIshalzJPvlxhFHEOCybzgCkRDYXORMETSwkuKZnBaXuEQDMXGPhkMVwJvRUFPkIFfExHwlGMYixGtzNAfDikYnVMFHYSgXPdcSAvKUkaMLIyPLAZqbAOedhwlniVgExT",
		@"VUTXsqZfAGIolakMAd": @"MPKbxOnCWfsUqmUSSXAdGmWJpBlESHuKfFzLWwyhDmegIeFqEjxinaplfcwNSXJkbTQHzLGPKezKAxiAXocYjLIIQoLDJUAISkdpaTDhtCYDNyNeExdpEKHUTnGy",
		@"cXGXCCvasNAvqx": @"kpNyUQIraJHnewWCdXoApwaEklBtKaFXKLLixmtjOIrszvlQrTTCCZAKvIHHqdElfegnPyPEEoATKQKmEMOFjsZyLrdQTDoSoRhIBXwrQSaxLAxeHZrxOfPuasfyeNRPET",
		@"sfyNUQYDLfOUCLzrIpRox": @"wVUqyDihTWGaKLVuuqBMAsGuTPmWXikxRReTHOGumAEzjXHLrkuAQejrcelcfkJoSwSHLXsweIlHpcmuKcilcxPGHhmCblVMdlBcFodNKbGawzc",
		@"pNJxYACPGLkkysLlLBPwd": @"dKYUTAsyismMiKpXAzzFoJWlsvkjfQwxSqbaNmHAjghhvfKxCGFRxjhioMbgbCEJVYrZjywOLHfMqhRTIUUjQAMImgFAkSFpKUDCindoeVoZQOwSUHEMrsBHLKTWXtbhQuBQS",
		@"IoDFMhzVwoY": @"NdnjPgSVpjnWcFOvEojhVmNiVyjOkGqrFaGWEmlinnmQknfdrUHzmQqZdFvSLBKiHquHsrqOfkTRjwQrkWCDYCBCubWNNUMfYdRNBXRJmQjhUr",
		@"WjvHowKaRVkUDpujz": @"oMDWqBXqQSWnZyUSPXYzbKrVSrMeyPvQfgHsStWFVjDLYdZpbYQdAilVaAAFKtzbHbtZqdBhtDkqPGrKzjAHxTQpCynBnBikmCZduQifzbtPAcTTtNxyjpvurvq",
		@"rsVlyeKUkJdAJSWFEEA": @"KbmlFHkyxkrFuXJePHQmhiyRnpCbiMHddsAvlQzHhJUIWvUcZSKQeuuwVSmtVjgjjTJoBeHhOUlBVPRTYyqGvbNCuEHESocpHbvdKKOnMXbgvrJHfWUjiXadzOivYnxkDRFrj",
		@"CuKOHakgFLwXmTqTKlnRcp": @"FHqSrbsbMVYQWmnsXdlPWxnIfJKwwhwKdoaqmXPKQpIgUxgfHiLHauPpVyHnIINmjELrXyiiYDFMxFGiXTbWPiDYokLpwoeCorGicVkPIpumfFAfRouEtlVNMXUvZxAoiQziEXcgzpKBEvCJWX",
		@"yUOAeXMUfdYhKrSbVjKgk": @"aErmQzftnENcaBBludOKlTdYBsgCOLwKDCdcptknTGkoNXBHAgxuuJeeYAjAjcztaOYjgaCBDtTLgvjpUfuMPBGuzwSdpqTTtOUBmadpW",
		@"daYBtbPlZMnLgWuXqCVeblk": @"ICAMMbagxCQrLvxOojRZyZrWXNgcRCWkjBwERdHozhfjuozejwnRYWxSUlnHiLxuovvYnbHWRVhydVlXuHYefcagJRCSxAFUvTXSVrawHmeIicTXfTdCqARvpKpJbOLvV",
		@"bNZNAQZeMkNVXNxE": @"QrPxzIXfpURQThHGkYLcfHedftufqTbfBAMIvmJeuvtMYsLCbhJSzxsZbJeJezkXSjmKiWDsqAKdYfqvYhoscQlMIWBirFwEJDRzOjCSlXz",
		@"rRAcaGOedwXaTSvzxp": @"bLAvVXvdSwuPPQqUHnUdSmegfgqdOjYGvqjBZGHIYwZUYzEawEXubYBGbZXBxrszzeLuWEgQfwtYzubWfQCjSWGheuSlAfJFGjZONkWKFKinSNGVziMtLeQmdVsXDPyB",
		@"ujLLRlhtMpRkkSSdsxtEG": @"AkqlyIHNXcQnbBELpJxkKAKxiXEVIxpKSyNiHpUcGHnUGpwfmUsztPhnFMisOvEjnvuVohoUYNMUYKRGIfTyDAfUbYHjImZVtiizbZzQHBMCmKOyumCdWjFCT",
	};
	return dPBYIzFqXRgyiYvKaOOQ;
}

- (nonnull NSDictionary *)HyoDMFVriDG :(nonnull NSString *)BDGBTRaOhpkMTangBcJRk :(nonnull NSArray *)nzRVwnBfTjLuBNFbGZqdRs :(nonnull NSData *)vAVVLWbSZLGI :(nonnull NSString *)VJlgmnCdUJyWTOWAbCgSKe :(nonnull NSString *)egOyvKbAVWNTQGnRjLqReu {
	NSDictionary *PgGBuiJZcXgqYVxf = @{
		@"ECBfcyHAOwoMtUPACooca": @"nZbNLQzmdJENuzIEopovQgfxXpGGOWjSuSkCvwqUfpdSRZOzlnTGeJYaMKYoADinywriQvVlkUGfPVdMAFKnbBhuLoAzuVlzaIaWbxcTomtiGYDRUsIikkKqQSmXcpDIFvP",
		@"JeuCjBzQsDjYgjt": @"AZYeOwEOhGfhvVkuwAoblFRbNOEOfZoMgojLMrhximmcmunrmFQEARxpMylegRDpiqmvAvuTGUhdayhKUlIaaMfjRNlJukpyaFHIAVyrZGNSHSThQ",
		@"KmbnhEHmrvpRkmaVfmJ": @"qHQZWBmXicgRLjxhqTYsykDTThrObZpOTyjxAqINlkeDDuBSpQBenYrClOBSiTlBvqFVgzJPnelrDozUhXFNOuONJPvVbOMRcfuvzHDCbSgkNGcweG",
		@"uhDRyIHAaRolhojvyVTCjto": @"KxyfCfOBfMLIeQtVtdeCjCgoPYsMzEjtrOlzrnGqnuoHzETMPfOLIHcOSHEqYPNymycFxshJjKpSANgnOZtqkGJzsXyThokRlMDwDTLZMpcJLxsbYDIDcUyfWpFRZeDzUxUIrSc",
		@"TaVYCxfgjqHOcKBB": @"dwGlNTSnljCAMUnvuzuXpOwHRsgEmDZffLZCkbYwOdbRXWafEEUDnyxAooQpgljZlgjbgBwnYSEvqGwKLaWLeGQiGGanDExBdVskFdLwrAGcUPFbaJGUmWJabvXvyLyTYUtrrPTJxmXhRSVvT",
		@"bOyPLzmhipYgMgVQirby": @"lqSjFscOZUlUWUsuuOfkgTmnJOXGzXSWBNcBMDcHGHRmQcwqUYpDhNUfcxVguKPiBRgQmITNwBAUfplTwLABJfrYfgiCdBzRkksAzUALGalEqDDYxmvwhCbkRdoFprpWgepRXr",
		@"CgiMnmkabfRyHZvFxsgXl": @"VWHxFaTUFEbjijpPTLVezWBeHDTtexOjfXHCnVgjnmmWktwsHIwNbdUOvobqmRzxkkZhtBhHFKupYIpnvFLskcOtPLynCjzGMPLEwRDCVQRKSTYwNYKSDFqfMs",
		@"JZmUdMQXKtKCXNCbU": @"HVXOdoMEFKintgVKImPHHGBkDzXxhybooyfYYEFZPDpeyhXLmNLaHRKcQThehMHHLLhPByCfJeRbMRkVWlorKEoHRiWdysuMiyrdVAjcuTndEokMOcIZKyWhRZQiZKbYYsas",
		@"ryPFbsQlJTloFUYqwkSDWjd": @"cxmDokzAhGpMrCFwGfzTWmwcCkpvxlGmxkwoypdnSjLngRQxpvavIFlOHeBZKsykwSnPZdLdJDBhvTyjructYcBcAhKTQwYNvlOHEyIBEBwMlrXedDmWNlJKDTuShVVIAfwlOMFyYdrympaLoncRa",
		@"wweCvnChgTiMtG": @"QIJsuObMoRsYpXJIZSUNahnnRzQGQptRZGWdrsqiQbNpPQTZiREaNsNNSZktgwFmQYpUlscDZAvplCSIxtcTWBLXEdhZEKSgYPQXRzumZgDMWcdYHVJYEXcbSIfGMQLJFrzTpyYbvBYL",
		@"hSCGXRhprpbrHgSEKJDEJ": @"UowXtgxCHrKqNnYJGqHainpZOtEUVVwqgWKVToTVnONsupQfJNdfPbEYWuJROGmxsvNnUreCwuPZzLovsDNFsBdUrHTXewNJHAgKRVNpdMKESjFDwFRWxXfQmMqDNIxeTEXLIJCesRsBTskDig",
		@"ILtwJzpBLunxtCJICPYshzF": @"cASBGfgmfVzGFHLiMrPaFokaqWZkwwZkhuqdLfOjyJzoZmbjIJOUMcGNkBQHhGhsxRqSzAMjuaGCHgItuKuIkXaOdrLLZiDWarWZGwdHZWdpEiSrXRpFPhvxXcwffLlyxFwAXvzMLDIBocFwxJR",
	};
	return PgGBuiJZcXgqYVxf;
}

- (void)removeTabAtIndex:(NSInteger)index
{
    // Remove button
    [(UIButton *)[self.buttons objectAtIndex:index] removeFromSuperview];
    [self.buttons removeObjectAtIndex:index];
   
    // Re-index the buttons
     CGFloat width = [[UIScreen mainScreen] bounds].size.width / [self.buttons count];
    for (UIButton *btn in self.buttons) 
    {
        if (btn.tag > index)
        {
            btn.tag --;
        }
        btn.frame = CGRectMake(width * btn.tag, 0, width, self.frame.size.height);
    }
}
- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index
{
    // Re-index the buttons
    CGFloat width = [[UIScreen mainScreen] bounds].size.width / ([self.buttons count] + 1);
    for (UIButton *b in self.buttons) 
    {
        if (b.tag >= index)
        {
            b.tag ++;
        }
        b.frame = CGRectMake(width * b.tag, 0, width, self.frame.size.height);
    }
    LeveyTabBarItem *btn = [LeveyTabBarItem buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor clearColor];
    btn.showsTouchWhenHighlighted = YES;
    btn.tag = index;
    btn.frame = CGRectMake(width * index, 0, width, self.frame.size.height);
    [btn setImage:[dict objectForKey:@"Default"] forState:UIControlStateNormal];
    [btn setImage:[dict objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
    [btn setImage:[dict objectForKey:@"Seleted"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttons insertObject:btn atIndex:index];
    [self addSubview:btn];
}

- (void)dealloc
{
    self.myimagearr=nil;
    self.backgroundView=nil;
    self.buttons=nil;

    [super dealloc];
}

@end
