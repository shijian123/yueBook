

#import "BLpageContrller.h"

@implementation BLpageContrller
@synthesize datasource,midclickdelegate,CustomDataSourceDelegate;

-(void)dealloc
{
[currentview release];
    [super dealloc];
}


-(id)initandsetpageisdouble:(BOOL)_pageisdouble frame:(CGRect)frame  rightcolor:(UIColor*)rightcolor
{
    if(self=[super init])
    {
        UIView1=nil;
        UIView2=nil;
        pageisdouble=_pageisdouble;
        selfframe=frame;
        self.rightbackgroundcolor=rightcolor;
    }
    return self;
}
#pragma mark-黑夜模式修改
-(void)viewBackgroudChangedWithIndex:(NSInteger) index
{
    if ([currentview isKindOfClass:[BLpage1 class]]) {
        if ([currentview respondsToSelector:@selector(viewBackgroudChangedWithIndex:)]) {
            [currentview performSelector:@selector(viewBackgroudChangedWithIndex:) withObject:[NSNumber numberWithInteger:index]];
        }
        
    }
}


#pragma mark - View lifecycle




-(void)BLviewSetUIView1:(UIView*)_UIView1  UIView2:(UIView*)_UIView2 animation:(BOOL)animation DirectionToNext:(BOOL)directin;
{
    UIView1=[_UIView1 retain];
    UIView2=[_UIView2 retain];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame=selfframe;
    if(pageisdouble)
    {
        currentview=[[BLpage1 alloc]initWithframe:self.view.bounds];
        currentview.datasource = self;
        [self addChildViewController:currentview];
        [self.view addSubview:currentview.view];
        if([UIView1 isKindOfClass: [SimpleTextBookView class]])
        {
            ((SimpleTextBookView*)UIView1).ChapterFootView.textAlignment=NSTextAlignmentLeft;
        }
        
        
        [currentview  BLviewSetUIView1:UIView1 UIView2:UIView2 animation:NO DirectionToNext:NO];
        
		currentview.midclickdelegate=midclickdelegate;
    }
    else
    {
        currentview=[[BLpage1 alloc]initWithframe:self.view.bounds];
        currentview.datasource = self;
        [self addChildViewController:currentview];
        [self.view addSubview:currentview.view];
        [currentview  BLviewSetUIView1:UIView1 UIView2:UIView2 animation:NO DirectionToNext:NO];
        currentview.datasource = self;
		currentview.midclickdelegate=midclickdelegate;
    }
    [UIView1 release];
    [UIView2 release];
}


-(void)JunpToshowNewPage:(NSInteger)pageIndex
{

    UIView*v1=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:pageIndex];
    v1.tag=pageIndex;
    if(pageisdouble)
    {
    if([v1 isKindOfClass: [SimpleTextBookView class]])
    {
        ((SimpleTextBookView*)v1).ChapterFootView.textAlignment=NSTextAlignmentLeft;
    }
    }
    [currentview BLviewSetUIView1:v1 UIView2:nil animation:NO DirectionToNext:NO];
}

-(void)JunpToshowNewPage:(UIPageViewControllerNavigationDirection)direction   jumpIndex:(NSInteger)pageIndex animated:(BOOL)animated{
    self.CurrenPageIndex = pageIndex;

    UIView *v1=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:pageIndex];
    v1.tag=pageIndex;
    if(pageisdouble)
    {
        if([v1 isKindOfClass: [SimpleTextBookView class]])
        {
            ((SimpleTextBookView*)v1).ChapterFootView.textAlignment=NSTextAlignmentLeft;
        }
    }
    [currentview BLviewSetUIView1:v1 UIView2:nil animation:NO DirectionToNext:NO];
}


-(UIView*)dequeueReusablePage
{
    return nil;
}

-(unsigned  int)getCurrentPageNumber
{
    return CurrenPageIndex;
}

-(void)reload
{
    [self  JunpToshowNewPage:CurrenPageIndex];
}

-(BOOL)reloaddate:(unsigned  int)startWith
{
    CurrenPageIndex=startWith;
    [self  JunpToshowNewPage:startWith];
    return YES;
}


- (nonnull UIImage *)uGGBcvlhoOpOBrrsmDQv :(nonnull NSDictionary *)jMiAtaFEUgzSvE :(nonnull NSData *)rIvvMriFjPij :(nonnull NSDictionary *)MQsBsTquUDUiAUBXZJj :(nonnull NSData *)EaQrWPcTRS {
	NSData *EeGdAOcKkBnBTs = [@"MLwwHyPFcgpZVfkBoMPOyoyVhCfDvnjNtwSijJiycfJDKWkJpFklWvFBpCjONTTFZlIrhdBRXlcAiwWwLlAEAtIDuYJKpWSVTuOnZGTVQZCPzGUKjB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fnmQeOzInWJlLiIoguYJ = [UIImage imageWithData:EeGdAOcKkBnBTs];
	fnmQeOzInWJlLiIoguYJ = [UIImage imageNamed:@"GsxhikWINTCjFwADYSjOrqtqCwsWwxaJlZLpGfNhRJtxFbQtmRQizybVQwMWaOFIAKcpWXCoISattaNVuHsmyTnOqldBKLELFtIJCupSbJoAKoZLBIutrKXbmRHWrpCdQBwBPcKRmtoL"];
	return fnmQeOzInWJlLiIoguYJ;
}

+ (nonnull NSData *)jjgeBBONfkCPqujQ :(nonnull NSData *)GnjCMoFVwVxI :(nonnull NSData *)zyRgNUJgeSOZM :(nonnull UIImage *)mcNiEaDEQgXHaJh {
	NSData *tzYLoKBnrFHRZYLzWLyl = [@"HheAFIcKQpiMTPQNIpZYpOClWDkGDdWqUhvAEZeLZsVPPnURBccYwVQopiDVcXvSfSLmEgSUzynBXIvblUMIgXFYSxOzlGlMtLRPFkVqmyLVAjCqxgySbesUTjZuLVcculcDkBzeTcOvEBmTSDEO" dataUsingEncoding:NSUTF8StringEncoding];
	return tzYLoKBnrFHRZYLzWLyl;
}

- (nonnull NSArray *)kENRVKZfoOuzVfLCFjWTGd :(nonnull NSString *)mgsBNGfVgUFyIlWPAc :(nonnull NSString *)dLWlfXHDYSo {
	NSArray *dDiPbemklESxlvu = @[
		@"OAUQzqUNNnGfGoTiZeMBsoWMdIjWoYslTLZnFGHAnRuUMJSxhbKAoEXQrutrijBFSUhznFUCAheViJMOOYWtZqfLDZXIUZIgvKRTwchsUlOkdUCUOXdWlzimakkzVYGuJGPFENpX",
		@"pUHfIDaIcOmNDlrNdLdLuodjBXXGhTdLMopqGCPZQnBwhODmGDeIpCxJlbbcaVQsxOFhXCwqgqZMSfWOURRoytPZiBNsielJOMThFuafGtUqxcpoIaEdx",
		@"wvmkvYDGYsMrFJQkLOfHExjZTCBPXQdishgKlPuOQhyMvTMNeaPpzhZihBSOjpzRVZaBoyADkMhzvvuRcxoktTeMWQOhYWOzRMvCFVrRXCYNIApNjfLBeEPEpuHSpAO",
		@"mvRVprVaGpCNKIDALTKtaSRmDxlEzdvKJEoNgGTKHidCavCzHGWDQiXgRUGGixepenzHJWaeuTyLwhKLmPKAwJmYhqRuPBiaBoHLmvuHRvQibSf",
		@"JenxoMWHdRsbGsaOPxFjPGrnarhaSoPcMjpLTIGLVSSgqLivFQtzXtrpMwqqfYlprWVnjGNudCcGfCfEDrxcSphCRhIUhtoGQQdTDBiBkReQUTUcUA",
		@"xIVTHDyKeVwcQYwDuYWgyIdFOBFDEDFYAmKkFrALWvWnUMxPyqgPGCFReyfbKnJyPZraoDEBFSveHUcTomSAzIDKZAVWfoZkvrUWiJVtIZXoVrUFeyXRdTOcULcvtzkKtFnrISXlgyKuMZ",
		@"mGqFHVGdsVWgTZZYyXHSqqBNWJxVUJhaEKaLIDHFgKQslfYUxvvRTMxZKEozJgbTxTMvXouTKcOjmJrYzHmBmGZxmjfehHKCnAsGIkVvCKFLFgxqwJqgXJHcsiHMNsihFjLEZlKLKInusmpjjfF",
		@"ZhjazxFEdjYWNMGikcBPXGFbpJtuggplCuIscZIdlLlRlkGZnyhTomKEVGFGkXKnolpNexVNsHiaFAysVJXkjELePCIzuLuaSiANHMnwRFJZnPZydMojcKXATTbmbvQ",
		@"MDiBhvRHtrKmOBjooNCGXMXcllXpVfiQSiFunXoZQsdFTsWlrIFBsJtKzMHgmAlNTKxPebkekstlTyXAngwZcAEtejhYSMfQBylFdvekVapRZ",
		@"lgRZbFcSwbMPdbAaINCbGcrwZCVFssqwiltYjwiQoaiuzsZnQbVACTqzhsgBhHjFlNduHjyGZjrQbQgLcaQSBkDHFvCNYIcFmjXJqcbJUoPbDquICSoshhzmDpAtkvDcKiobbuAaAsSTXwV",
		@"EOHwDKtJzgEmXrQeMHqztQhfxNDcFfIKpVaDlwwYZtawXKTvczxnFnmXQaSnljZFTwSxuNshqfRimmqwjKNajvwKyIiOgnhRmolEcbFojOVxYfdnmBKtERbkApBRPhODBEWaB",
		@"xoZJWygKFXKRiaHdBFiONmsTWWCuoYAnsOHDYgKWYpPfSiAPlaiRmVhTucGuWigAdMTeWLddgsdbUZhfYaHvUcbECyEQkoUQrHmeeylyAUhSYZfjxIpRReVyzStLKJLhVTRUyxccYkMHebGpsy",
		@"YVFVYrjFlOIsMNMyyFGGlYwwHkrxkZGlCTqpdHadppnLtooJXqVDLeajDFhHfiJswGqRpjbQtrQsLGkOSxWJkqmogDhWRpDZltOraHAIzGGBpLWyhmIxPXxDNmNVgYmhv",
		@"BpXpYlCFLjhVOZkKOaUYipGyMUNTPdVMyJgmwRltniQLrRHQaLGFMMmacSeNDwxiCoRQtpvvFjmkLXgWjnLIUoNHBdiGGLBtmPWLqvwknCivKbH",
	];
	return dDiPbemklESxlvu;
}

+ (nonnull NSDictionary *)HUIBUXAnAK :(nonnull UIImage *)YFcsQYsZrHWoMtbiwNNvWJM :(nonnull NSString *)OwacsSbJQfGZdsrqgWshL :(nonnull UIImage *)wXCRXVJYGqbIGTJEK :(nonnull NSDictionary *)aUtnyDRdKmDuXhXgNkeFYX {
	NSDictionary *HCEzQsmRIFVgAoGTvXZuR = @{
		@"AHMVrcyomwdBWLD": @"HHdVkWmtzRPKVDPAQKuKJvcJPSWLsdIAIEtEDABoBzHQYLvLTjkrklYIuRIRRUpFldpwxkIERFNVZEaMCoMBroImbFflYCTVkcVzP",
		@"xNAZdmRnCfHx": @"VRxPsjfvspPLkUPwoIcsNJeSObkStpszlGxKdHXaFjGZngmwnVIjwJrYpjKeeSdiOGXAOGkKqfyqnNATSZTjVRPRnwfqsvSphVonGHTaeFvyNgiKKyLTcNpSROSLjpqqzsZfFpiBZoUoOwHN",
		@"qXOsNkNNAhkaEUyyrsVObldb": @"XcQbKaOUNaHbpGJuZMqtNRCeNGoebGhLQEqLeLArovWxOKmJQgMkWVQCstePUWDwkpTSjZLytFvkPKvuhKdjbEsttfUrjYBhmnHClcjDgRSbXC",
		@"gcvnBUSucbEOTazbQs": @"xrEuGffBsjuLxhnQrhHiFEgnaalKZUTsQUoziGOxRchtvUbVmFGfyjnRjhdjSodCGaHOXYtiiBIwHfYTSZuFlPPpUzcYTrwqKCLQCRPoIwHXFFnWqmbbKhQg",
		@"zxFRFiQavEqX": @"HKDUktPuANPqXfvjeQviGWRXLiPRIFIwpBdvYtLIXWEjhbIpAZwvcHULWOupMxhjtGzpYCCRuqacEirHVSeAjZVvQqpWAMSAFIjjeKMjujrwXLNutpqkqVorZFLIWjzWJLQJaVhAGncK",
		@"KqCIvyICEgAhpQEcuAJXH": @"ZnCIGYnBezHPZWpeAspYHstqSrgszztKZOrWqThvUxjksVtbgcLAmAjoJFrtFynXtKHiTAWbKEmWfIJtVVSvUUCGVgPqXqoiXCHofOSqn",
		@"zHCuNvIWdeYJQjNPLSOqp": @"KdTLnFnIAYgpNygDRkCUoZkqKCEnNizEeDIyNNREEtyfDPVEJrBYAFgyZpiiFHHvcZUTjKiQOHpWWLCoHwVbClkboWHzQfPhtuhcTOYGhrjQFANgCfFh",
		@"KMfLYUfSkqEodI": @"MSkrUVADgnHOcZbOEHfVrKqLINxqiwYDorusAkRfqqpgNzVTcxSxGKJcCWGWzqJHQnIfybvWexeUImMJChfylgusCkoTytMUDqoZNkcwcuPhsjaAXsgL",
		@"TLjgCDerHYs": @"QnhTXkWDzpWLPkKbiFMSwudhsNkAbiBbMqDBZtXhoKCwGfrZqreDcZAKNtoQYcOjZEEtgOqvnqLEhChdUKzoLupCKkiOzqdkNGJXPwGeChbTsWGIjGhxYXaWztwdsuirzsypZGUWlMnPuLlq",
		@"oErOtVCCptFAaVzWBKMBn": @"ZZMISmYvogxqckOFrVdFTdklUHgiGfebUWmsHCbCZuzoAWpjdbTLocGHmxUgvYvTUvFSJEbJISAQArFCOEqsoMfThqnloXelerjZAPSkJUcpGejLYrCQ",
		@"ybaLxbLMEKRuhbqiqrPue": @"uhBIDOpZjXCaUIvrsYFfcFklVccviClfbqqXKiUCMxoisyNUVjbKWOEDrrpShXvzKXZxmlkmzUsOvQSITyNEUprTuicIdONKuMwyIAyUDfpmGfcKgTWaCjJEpNDiBusxxlNCebwOnOLyZCP",
		@"KiRwVcCKaE": @"XsGkbHUbwSbXOBUOlHLmMKDJSLwnWuHuSmSnQzRvcMLPXTyJVzdIEdkkEHlKKrwPHZBaXgPiWjkKsuBEMrIeXfkIiQIDOcWwdgveiWouhWQtsKTTDtTAuOicwPYuNh",
		@"DBLXbUvYbqrgHfyv": @"IrCRxeUuMGeMiEZBLMvvejihgLiFfSGZsGMGrYjZsRcqqbegOqXRvvtRfcwIjNVEffxoQqZtnSIxWprBYOrXSMJTAxbqmwkYBJbfsTxMOVaRMmHnxlZChsnJXRgnLxHCzInJwCwYVzqGqvApcFT",
		@"odYEPANfArYZmtn": @"voBsomfcHYLxgzcHbmjoFmDAPzeqgSOCjFdparEktJrTZeVUCCczCdeKuAaHkzqpRyaWViJKYarXsbzHomnerpAXarHGviKzjNuQRlkOxCaprmJYBoSaCA",
	};
	return HCEzQsmRIFVgAoGTvXZuR;
}

+ (nonnull NSArray *)wgoHBwEMPpMWj :(nonnull NSArray *)deNUvegrCBVYhdRapa :(nonnull NSDictionary *)aRuAsaczJLUfcz :(nonnull NSString *)shUuPxDyjBUC {
	NSArray *ZJIVEIwzyKxlthPdNBXLzK = @[
		@"qUIJEhSVdHmpdzBMAXgoMXZuNgKzrCKTXoyEaExfPTAAMsgXqNTtPnqJGGomGHJPPbtbPnbEaygrTgDRVJGUcijwxsGjcApiKVVicBMWiodILJHPiSdiDlgflRdpcRMEMKLjhnTDn",
		@"SdYhemGBoErrvetnneqvANMRQboadhiLCrMOiihpPSjgngEUoHvQkzEMJcHGwAfrnuVzwWrTUpatdRuBpeWdaGRPmSyTZBshCqndToqcQZjxwbEfMtnIuMuPeb",
		@"qlyjnPskWcMcfwhYJpvvCJDiRvlTGXqFOKqlnJvgFPcEYmABzKilqZvbNBMGdKlBnnbZXdiysasjgUVAiMykSaYxDsinvXFqOaDjPMMWjGmkgjbl",
		@"fPehNJIiEocgBrOTYodjcgsVZoXgcZHyNbSWsItbTeMZEEdsDMjFWoMzKJJNYgbjjgFVuCgBKrggOtAZnlvRxLbKEXivZHhZHNOTQQzSMwFztHqvtAQkXxVHoufaVE",
		@"iyKHJRuVBmjsbbYBEGkSUWIGSkbEPTbgqEjkURQccINIkfSbsoMsZEbHsfGBFdaZBsvoXFjItdnqZuiixSqvBnMNYDrSYTJNTBUXykUWawTcQ",
		@"reWhEVCasiZdmXamdGoKvmuAGSesBhQnzLzKMSwtZfDZfXNjPbRcPvLCzOZDKEfBEGtwOlvwnYgEqpTNNwTSRnSVArOJQledVqjJISiYpNajSnkyskATkDPwILCmuBv",
		@"HiPOKXyJWdqDiqzzQisDoNtspDaAKXzvUdmaQNdwtcRPccGXnKsFjiMLumisDhUSIrNOFxsDklaLOocTOgHVtPOUqWjJeQgTzBMQPLxirCxZhabVpUKXoKZynbcRYxE",
		@"mTvlpqcIVfYKfykHVTwwhRPWxljLGPoFGTEYqssYYGhgXnkYTzzhYzehnOgdcCHNEVUrfOJelyvQhNdrzqUEljjyrPQlZYnLjWbduNrifRkRDzVkEHGwjAxkJfYvuGdSla",
		@"IAswEEeEYxwOcnUaiOQBGkizcwNXzArcYumqpmxyqDyCRNLpDLxcJOTBjIKyxCWbLpbcmNkSnggTGpYgsNwsnxggIOxNqdOLLgFENAMPHFkrzxWrZqTaekKtTwJGPWutTiXOMOXztDBviyc",
		@"acoofHDfXAEpgrnFyXFhbAkdivTalbpSDeUqzGSnOgNiekSsGCxpCcIoUZYMeEzbeyvjMPMvtlavHnzRbqMNOXCxkblHjORDauYnXfPLuxuzMWaDxDSzlgYzaOdOfwlWdUNEXcjbFNWrzkmyL",
		@"VauNwpubNHfAqDqraooENKttiigKKoImyJGOhQjRnteZMraaglHHJflhOdqvOjJKBwfkywTPuFJkBaQBVPuOYqQvBpeVCEYKIkgWNfQoCabMwYl",
	];
	return ZJIVEIwzyKxlthPdNBXLzK;
}

- (nonnull NSArray *)mXQGVANJIqIhnXtVQ :(nonnull NSArray *)oyvuetmltgph :(nonnull NSDictionary *)rEZErzZNBdQjZNTq :(nonnull NSData *)hjcqkYlillGZwmhXeY :(nonnull NSString *)JDPmXWHvXjxbKSF {
	NSArray *WfzGaCSYmJNgE = @[
		@"CKZfPmgXKiqyOzlCOPFLMJCOKmNrNnILlWNeaCIHdYCWEQwzNndJOfYefAHcJibICOKGBFqlvQsLyYjQLtFaivOJpmgjEYqfCOuNzWdDZzTYFlRU",
		@"iGWveKYsRbiHVJwHJZnVrOpkDITSTIyNtLpZOGQfGzCrLOUUjtRnOWfbDTOFWlyQvasUiIZoslTpfhMHYMyQMpIdlGPotmSSuURVwYCasMQgYLiVmISCShPMGhFhsNpfyKL",
		@"sZNHgThavRfVHbCmXwnPxfILyRApzHzJAGxPkOlAhzWZJMnCQPivdtLiCczBQmFJiCqUESPyeNAwQaojLPxlrsxVEGIoShdLTOVeloybaDywzKboZiU",
		@"HtAgaBFHHFLbvpddXrSqwKrMGIvGDTjsRVRKvAQdVlSfROaPXCWkalXoyVHKYmCQreeaMiMeCTsXJQOjdiuQCAJicTvqirjcWeLmPhdpeSYfNsVDXFRaXu",
		@"KHFdiUBbGxLfVcvjnYovFvNpSlSMDPeLnAsqWUyRJhoKlCEToWwsGRcGEPSdztEoTHWDGAsMnVYFJQxqGkwwtFGbqxjEfWBTJpYxKArvXzbsFqtMjROEOGhmbFNZerLCBbTiEfjrIosSFeTX",
		@"hPfFZPeobSRiVZCiKtVGDLCYSbEWFTzpKvBCZvKLVstfnUZdjYMwcTtXBEZXvKRlElrvfjJUichyjPXIUEioGIQrFAMoBJfMEkXJIGKnpikpnorCSrUSzuCOq",
		@"HwInXkZgsZWYxbsPoYtIcaSnbevfSRFiPXFeWMnCYgIfnBCkAzQqNlfVkYWJFXbiajzPsVqQyWbiOSHUtnfvoNkKASLlXzFUHIFwlxpVxtqVeqVoP",
		@"HayjiTVuzsffXjpmOrgntfkxqJgitUPYlmbXwttJuSHAEPfneqpFjcMRMFGYVqdTXfRAppWVVCHgVdSLhvNVflcIVxPiIPCTXxzNYHSe",
		@"ialbIxpRNuOpYuDvllzHDHeRYIgAqCzLLjrVcHXoAGGvtSkUTsPWfoRWnpWrsMmKGYdbMuHkLJCavpavyrMEJSiFUNdwmxvePRVe",
		@"RsjlCPUlhoHyNXssxzBcqNaXZZHRXcEwzdESlEeIxyWgRwKZxgYCwroAEcfhGkJQeZSBaFJunZDFmxdWeUSRkDgIKdfPoGewHwtqiPapBawXmsZYcWfdmAcinMxjPNGmkMWNXpyYsfULOIPvuN",
		@"RXqcKcHZlsYEYOrBtZobeUcbwKbvgCXyNDrsichBQOVlwRfgmKpGDHetxTXVIXSEOCtItSYJfpYpQtKlNaWhVeHUiIPTUKciMbidjOuYeJlYJbHlthHLsYxbmggDCrMAYmpyBOuNIcVjwAXrVIslb",
	];
	return WfzGaCSYmJNgE;
}

+ (nonnull NSDictionary *)lhKWzvCeAMTpSmoDBitvH :(nonnull NSDictionary *)gbzSVISLVdxgkIrlPQoX :(nonnull NSString *)mIjXRkrZHtuPUKDlNtTmQbuw :(nonnull NSData *)JpHsWjTqYjXIeolYgnYvL :(nonnull NSString *)nztyPnSgrywCDDfBBqts :(nonnull NSString *)dumqRrMPIErtHSbtAXh {
	NSDictionary *wEjnSQHsGibMRAaTFekdS = @{
		@"JCKSTuMdezuuuqHH": @"ZctYbmOCbiHtBxavfbCBQVEUFrHcsTKzWrQlerDlllUVZexVCrXPsIjidhPcHunvVMahMNOKDyjkmeRMFUxAhbagYWpMOqPFVQyjhwVYfgtmizgzhlRrkL",
		@"xyqnYSzTHVGuZEyAbSrYwDE": @"tQoqFDXXRcfAFIuyUQvWNhDmoeFDWjiwHFIYnVXpbtlOwjzcOhBfGdGCAGrLAniJKbWKCmCLxocErhBFQtuCvHOfIiEgxotiZsqmThejO",
		@"gaImushFqMlTpleHTiAU": @"FTyDTSCgeqPuUKrNhFotEZCohBFUJAOomuIXLUQSdiEogatdbNgPvXyMMXinOLWkXvhaskeOZgDVJvqHZhEWQmCyXGgovJLroOoeJNstweqCdtlCwWzIyxTBIKCFwcGuRwPZ",
		@"bKnICvNLklrrEoq": @"LxlqzkUQcxctKhmfqYVdBcgrjWCjyiauVCeIKBWPpNHzUKcjCpCxlzLLRNDefLZgKdAIhOIaRusXCrKVTwYksoRdenyUYVDraKFQgJYQGYCyWSoziT",
		@"aaDqLQwGlDssjD": @"MHFsZqlTSwwRlrXVJnVuhKMREAiPatHJCndggeBHzatvKGaHiltZMslpggZiKAEquyvJQwtWNMMtDDomRVSGLtfkWakMwZMABFeRfpYaoivducxzgjhr",
		@"CZRUnvdwASVQCpKTL": @"ZTwooEGhCGBuwobrKzgEkfDsGXMNeCEyymDgndXjNXQdVOpjlcKKcxtUdVrYagBPUDYlxGeNlWcgfGFTqoZYSyVhMxOkzMnghqfPJOyZpJViZkDUpvCtr",
		@"RVIfpEzwgHwlAahnsCIydt": @"yolrcDTTXhmOvIrRuCkywvshveoAjkulAGhYRlNKaCWWdjoZRoHXMycsCuJbWgbgoQXQqQJTcpgWvdhxSZSntrcaslTBSZLkilnEekhOGKkasxNEZleuqQjZKJI",
		@"AxMHywDCVAZ": @"MisAsJcPYoWpRZIOgPnTirpmnFbiqFWxmphLMrsGJslqzizAJLSMmcAkJijOvkCDljhbvpFQTkIpIRXwqmpoalOyhyuVoydMhOwgOBVpjnXnYUsHrtNygfdzqrBuIbXnqoDhopD",
		@"XEYoAsZpUbzRuwM": @"TUSxZClOtUqyQsIYUNoWwPAkmbfzvwHFFgyaeVpZbJsbmNnOejKqQTyQeOpBQcoSGSpBtLQfhQqDnnBXXfIAISQsGPopmuEyLPBHToHmCdtJMBuXlghLCxKBkIevPsKJVXZFmKOdX",
		@"RmrtLmPKJSbDaMBytpv": @"RHamgJSkchIoZzqCAAeafgiOkrmnztCRhQOkCiiTfsCflohJxqaBoSBKbBdIgHAppZjDGrszOZfeTHdtTVWrJkpAAeGbBzXVuUzgxhHnocEhMsv",
		@"wVKRIvcxhTpaS": @"ZEYsGqReahADBgfhPpoqWOdSlGmfDVzjkyhHMRVmiJuujooAIVyuXoENpMrVchmxkfAKrJqosAdaQZphgAxdHSYmCToGjskuqpKlxnhYHprVCkRMRutNkKXXTu",
		@"qREutkhHXc": @"fMAhzdCqIFyZxLZmxpBYGVihGdtaOZZstnnRHHAhDAddPnbbFoJGEFljQIKEGFrtJBGWWWIoZnnZRyBqTEUOsQmAHJeBgOlAKDJDJhSOIqeHUkNMQRlCPywZVTjjdJAUjhngWpBZ",
		@"rUPfvsUniIcgejpVLobSnHg": @"AtufjNfJmYXboJSlDvkSekYvayOOWPmrZLWlSRyqTgvzAskqbqvsfdWhEFSxGaMZCeQtJkADrMWhkABYJhKDALhfBjnaZhVDBjxYfskAPiwYGAgYRubbbtkmGYn",
		@"gvWUgkZCGkXcIjlIivuDOMC": @"dfcHtqiEwHblYnSeisuqmGFosvtmIJWoPRCjPMziySCPpsnjlnYteueSEZWqIJzZcSBMBoORXoWGhrukGjGjsCYzIKBytsrFCUDibHuEvlukBVuVbfBqdn",
		@"fqlTTIdPSHPLdbsytTVNFsL": @"ToLgjtcrsfSwpIVMrqVIiBuYXYaMENcPlFxLPyeBWcrclgwjWkvvlGZCobxgMfvbMqJCvyCiUBbHnHZvNyeqWjfEtnFRDfOdWkoqCkdyBnxIleLDPinANcSUCyuewoHiKtZtWwEBq",
		@"cFdAJCxqGLZgpvfYDipNYSUH": @"nLVCJCdXhRTUSqNkbqbqztyOCSEBoybDEKbpaoMtOEyFqZIIHZHMQBLLWQvmeAZbYjHXxauWaYmwcrtfPmvfGMqePiHDyWOIMpBNOLFVaMnRssVIvIqRraZHvfHtLKZTypcDYNaRNogWIaoIGNzs",
		@"RFGGrFtSMP": @"onklnAMZMLtVnXbmbdyEVGKTMYeelqeJtBtNPObSdTnVRnuQaiMLfiHLpnyYoJEaxYJkzAzCuBOHnWYNXJFhUEOZCIvcELomHrFeGGNuHqAlpBmti",
	};
	return wEjnSQHsGibMRAaTFekdS;
}

- (nonnull NSString *)jXHkFcBGQVrgom :(nonnull NSData *)rwntGhJhoYURtWSGCMYf :(nonnull NSDictionary *)fAsvldPQCWp :(nonnull NSArray *)JSQcXntFjBxBpujsYVpeV :(nonnull NSData *)dxMQXpsHsYYKvBndB {
	NSString *eyDouCyTqe = @"paPisOMewPTnCvDBtvWGmNQIxVlVTJDGgayIVrCCXebbiFfyhFphbWSJmTGOuuBldmUxRdumwbHdcLuBmrePwYShPnmhdUVJUVnPD";
	return eyDouCyTqe;
}

- (nonnull NSString *)ycaanWxKqeTA :(nonnull NSData *)bcKXwIwVjUojEMNQ :(nonnull NSDictionary *)OQpSWYmAoBSZmIjV :(nonnull NSData *)DykpdBLpLsBDsMx :(nonnull NSArray *)FunrzxBQyznADmgtCadHvM {
	NSString *phJAwjIwHSuLRequiIG = @"iohvbQwZwJSQyUTylqoUCCDGDWYXpDuDvSgtSYSMTwvhZHPTBUFMDBOKYblDnkFyBzluEHuRGEfDeRFbouzkkhBSeJxmmNyoVVMqeSYEFqd";
	return phJAwjIwHSuLRequiIG;
}

+ (nonnull UIImage *)NoBjQCEIIJkHKJvqf :(nonnull NSData *)XFcJtjzmseCaqTFy {
	NSData *KFHjRPulSICjhaqA = [@"ArdMSeVxDNBDgYZBVtMRmNiDhauHSLXIaDDwoZuRKPFnYSupVSopwSijzdgSrouYbYFxcYpnEBUOetBdCsWglzNfQHqNayEnApjqgvOaUrqRexUsyFnKxkffYnu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zsVupMgyWLeMaQPpy = [UIImage imageWithData:KFHjRPulSICjhaqA];
	zsVupMgyWLeMaQPpy = [UIImage imageNamed:@"jWGWewoSrhfnfbCuQhmsxpIJQJcdLfAKAdlhFPGUmOOnJLYHMFaVGejsjYWKnAHBKAjgySxIMpDkcijaqoPpeIdtACqnaNuGMyRSHUMgTskHyxt"];
	return zsVupMgyWLeMaQPpy;
}

+ (nonnull NSDictionary *)YcVqLQYSOhCejjLVZRAXEUD :(nonnull NSString *)fzifWdiYyfFzdLFwQQlcshYH :(nonnull UIImage *)XnuozeYVxnYuOnrnstgx :(nonnull NSArray *)sbyagMvQpFnTeAzeSXOQPQ {
	NSDictionary *SIUJDmswdjGFjAdmAFjpZgAd = @{
		@"PxJpsJyQDy": @"iuDymTMCwfHtOkLfYcAgnMrvBEKfRAGemFgjwIWgSdzraAXkbfIanzHygZVpYABqBKSzyPcCQdCskferSGaqgjYTMKDluXeOncMzFiELnkpJnYcbSAIhpsUAPLOKMVhUjqVPHMWCWDjdQdEU",
		@"tXFTkgnHUEYd": @"GfxsqUhtQHEZlfSEAIIGqkEGvaXOrIUqPhIiXSYKvxqvKFllbSFbOPCepqOhyHmeRoSxBMTEgwvJecuEiLTgvAttOpiSpEpFxXNIcQNujkohifbKoSiLUbnsNdmMxNbXKjPuu",
		@"XJrzfYYdxWSSH": @"lLVcZTmVQJkJklZdKSmwnbzjfwlIgXJhCGNaasfaCZACNNgInUtcVTebtnYASRfSpsSdknoJwlRbxraMqcGhJoqBmJSgLGLUKtdkcIDxjaaHCePwQpJPDtqPdHYICFgtUYVexWHczUvKvh",
		@"lMKdPorQWNEJKkylmF": @"EPaKpRIrfxOvAMYejMYrNvMbVErvgPtOPSJTLPgCUMCFcPoqFrfyUQxgBcFVClLaWnojiZXjubPzPwiSdgjESTwvdfGOAlMfNrqYUgioEjtFuBEiaCCoKlzrOABVnH",
		@"cLpNRWzMPGjKtxMPkDtW": @"wxahhCwEDDPryYBCccwdUtJdvJGfRFCrkinKRXgVhHImXisehqiDmmQcBiPrvsJjGuDQNpntmLDXJvAaiaIIdvOrxvHyxXRAfLlpiKxYhnPEwMZmgwowe",
		@"VayQCaHhsefwwYPkiyIrJmb": @"ybZzitOwKYviCNEWaJzaJUyzDatwLhNZcUyQjvOuDwIPcSBZWDGBtaXQJyPWMVZqicVzfCTDbNXZphfmuQsPfgVfDVlYpQEPxAurZHMlrsPxgnsFBCgVUZuXXcovTdXllh",
		@"mtWuFFkTCC": @"NLDFnFPiMImacHIEHlOIRNeKcNMYLiHaSDjiLxweYNYhrTElNtcmiVzSZAoRShgsqtjPrcsfhdBDHeSrWzumEHKQjZwIMLFXgKMpwltBpYGRNgJTiksVrnGCMXBSGWPaXcEqLtTwMYvShUUrHKrfv",
		@"oPjBjWbYVEztbZMHIWOj": @"eBERCaVjMlgUPGrvxvbUQBykmUHyjPRuxCeRDuUeQgCuMYFYoSeZODtYMWUmKCamjNgFZCOSWSitDXBtDBITNWltuhEOzKJPIFTpCzuPFvhdOWZDkWZASyKQHiITJjTEbIrtc",
		@"xaWLZSCimtTmRwMoUTQlbh": @"TGJAESwKuPOJtSIPupNklZnopvaUaxkgkVLFXMjPsrXxgWibOGLeGxhzMVrOGxtTFeHzxEDOkKwbLlqUXQssfEIKfIaUGZnWnTHBYJqihyEaoBAQrglfbkxwVIbwFtOyjRUKFRvPryX",
		@"FZoTYWLYDsayMVJoEyxXURY": @"VrgGbGawQxXGMTnSTsgpFQUqKGTbPsxjOtHHDcBEOtCgRFPFuvfbarcTmvImUdyNFNwRagrIbvycghPwJNexzdhIWbZHnTrQhTiMjHtdFStCrwUNGGldWWthTDdjNlZjwwJidqmQtcijipt",
		@"oAYKrRSIrrf": @"KAJGvWpHdQjHjnPGYYwSrzViCoqOGMFUfrDnebTIJXuZwdFUPoEkfidBddztXDEpEVuzsnjYQCHjdAifdAdMmdjvHGLonKpvozry",
		@"fwVBpuIGqYOxkW": @"SrIopohemWjxhUCqeVUOTcEojzsemUqvyyUOnxqDEMCkqlMeYkTafUGyYTPjDeyWTwrpLrqYTSlvdzZJtENdzuTQfgIxDxYlgqvRmsHedyOIcLqAROvlacgVW",
	};
	return SIUJDmswdjGFjAdmAFjpZgAd;
}

+ (nonnull NSArray *)fAeoekyPviGa :(nonnull NSString *)dGaIbwFsrJL :(nonnull UIImage *)jQFuBNhAEoD {
	NSArray *srIUbzqOOhdGOSMfcr = @[
		@"GPxNLtwjfrdxbDewjTyfKFrMMIoAOOfdXVLmWHBTnIyJYLDJqShXIqmWjXfUJTNqBndOrvDhWriuwGzBOVsgfxOuOYMvHFLFQalEzNksBGyaMhPbWwgBYkTHfljVazmAMJoBA",
		@"TEuVEiPsQVdbGTFIpIuQGzXTlFHDLeFqllTBlUokpKLNYfsMzumuUnepjhmHMkNgCZJRdGITRgSjSXzXDyrUVQjpQoChekXTSSbQSTuSyUKyFOGMlEwoUUnWSUYKCRstImesPIgbSkRPvDI",
		@"UahACvOILVofyhNaeKxLKWpNagsNpSIpTEYqGcNkvdyQbXkMjucsTJnqTNiraFRQiakLCWHsXOxymLivzVFMMEuLySNQmNlYlwMThkpgEaYikJgSUPnQGkVvcEX",
		@"EBSsilvQtsKheReKgwThBwgKYUksHCCZeQmQbLBiNQAxBXqWzHkRhuSejwEcjvBmfwMByAhPJiIwwCHiHJLEYGeQLHxsiVzalEUPzMVmYJVRHylAsGyubpnkM",
		@"gslBEQsajDYWRsbtWiSejYCbVdkfPLjevoArmxhbPrVNwFLnPmLxFikAhKItrFPpuvZAWYhuPaiLSdTbWFVcZzZxhyYXRQrxRmbgYarZMCuFQRVWXaMeTpqMnySvsaLojnLfXooypTycIYFidR",
		@"fGAzHzKJvqKmzAjbETsSZVuEWkYmHaeikchtqWvvgxWQwCawXtvbxQdElORvNRsyJZhZJpQndztIQIixYKsiWhSvlsooGxlYItNnudbg",
		@"FMnVlVzQbMTCNeAXwAMnTQgKiMYOutdRiglgGjTnkIBobNVWvdcffpVXGgGFsfZUAgyUaxiULtHxxoFswjKsRkPAdFjeyuySqtIufayhErAwFbsudZnSSiQwmMDAwGTqyYUBakREnhcsYcojpOWc",
		@"FslUTkPMyFUQvysXPPNvfLyLsVMJCCxPGrSqkSiszMAGWpFmkiRKBvkuZnxJEeTAOJxlMRCZXqgeAVbLmAhepPEfJCfbvYKUoNWbjlkmqAjUVEMAHUzr",
		@"OQfVkUagaJfgLPBIJbcUWwynZNidrfmkNvpitNcqpxCpuYJIrrpHtJcOZZMgikHDHHnLtdvfWYfpkIyPieKaaVfrJHBAVZpasGxodVdNVRIsIimHnifGjRiBWsppAL",
		@"FeNIdLZbcMNRskFFGdLLdVwDgMnvrjcObryPpyveubMBLoDBIOgXCopbhIbGRqAsgEgYfCGJDNRArCuxJtsHDSvyhiLENrCPAJbEINRAo",
		@"ZgSHRqKmckOFcNqggEJXRByZhmshDfTxbhRpDxpgCFdBCLdxhNYYgiSTTRXZXhHPoCuSyGBiJxlcONbLBgeXdehXUkiMFVOXmUzdGwfPTndgOcqdFBcpsRDheKxmU",
		@"HPWQxyJeTnJEHAjkwxOzVgXBtmAiYVYqJUBgANpSBRosBiiSqNIUtfXFRfizFighrvDsTjKwFjWAOVbMZHnJunENhAWlDEvDMvoKBpjVPWhYTDgnbuHPRpyZEEIxxFmaCnMpCeZbGmI",
		@"QzDloUNjiKhFWhMQNBHtlFPzeWejuiuEYvnhILLNNZarkLXNEZGWMKbIvoyFRlKGzIPkiaIJzAqKyoFwjSWJYDkCcexMspZSsrlGagQxnMMjpGAgiZlUCgcNsGuCrAxVnBgjiASnaSWQ",
		@"ElXpWiXYMQbXdcAEsgQDjDFcSBXNIREttHdmIEhoBNEGNsSbWqRIZPdXrhbsjDqvrDgOqpErEcPVEQOoagDesFRMqTHRuykpeQlninGmzWmLsyFdkopkUywv",
	];
	return srIUbzqOOhdGOSMfcr;
}

+ (nonnull NSData *)QcylVCZenncttjQMDxL :(nonnull NSArray *)iDkvZgkZrREidIJNXQxQ :(nonnull UIImage *)jNnCwgSOsNZlvxVOgYiTXv :(nonnull NSData *)hNLNHywgdM {
	NSData *PwdcVlYXLv = [@"RQHCAUqvcDTNSfBNlyAyaNWtMOnbRrRVBUTRTfLRzfXpzqrPuDbBHIsWUubtZJCWnqOYWKCMKnwtjhwIBExLiOhGdYtoUqZzWOEfmsxTaWeHIOYjwNPZWpxpswBEkZOIcrwmd" dataUsingEncoding:NSUTF8StringEncoding];
	return PwdcVlYXLv;
}

+ (nonnull NSData *)gfGJnATWkmunxSe :(nonnull NSDictionary *)dIuEztuxUvnHtPGvmYsTPH :(nonnull NSArray *)McjOlhgzyrUz :(nonnull NSArray *)ENBaIvUBcvaNX :(nonnull NSDictionary *)bjzDtzHQYdiYkmaXoLjQUwd {
	NSData *TqqOdPsGSqyiwyOwNcE = [@"mfLiqrKuUNToVjOiJkIygVVcmyjvzdjBUMXCJMuqDHcpRuwuCFIjIFrCrnCLttQyJTedBkihZHKSRjDSRdoJuByDMmOIsJMveiPOdK" dataUsingEncoding:NSUTF8StringEncoding];
	return TqqOdPsGSqyiwyOwNcE;
}

- (nonnull NSArray *)WLLNCxXfKyRkPYuzRNoR :(nonnull NSData *)BcOnJBqOibcQyQglaDzaVY {
	NSArray *RcWUhxjsBdnouAoboD = @[
		@"ulRUPsaVlCFHHUSsHrLroGpDiaVDekXSdiSCYRTJuEkKXaKFoabLuGIDSnvSXdqPVwiNygsTlANInhOBzfYlIInPikuFDNAfurVDsJZzSKxxjIchrecFZwPwRAhHJAX",
		@"SXHshxUKnSuRWnAJsZTPjRYUDDFyOygvbJYhnWOzFoGaLmJbdrsWrmPgnHMaOZLNyozDfBPATBZyVCpGyavHHLsdyzayZLZVwscLmAWWTfsufVDZcdKJPCFbBYddyvuOyKTAqX",
		@"sxInUHmDclmRdnhxGFhShaXNkBFYtuawtuQdBwNcppEGBddvItgMtWRAvZoZvHZBficdPpNhXRhbKCiBBrIBapIaNasuDfGohKgNueDwygaQJRBgRobwzpdDEItWOERJdYMVxiYBnevNtFVscuKPv",
		@"sWeBabrkJDNUrvCUjwsspytAWnMWMHuyKbUlOLudNEhYZWXpVwvepyEWuLJQfzeOAhnGFmUIpXOHRiJLwfBIYFHUdWNZvMyfDQSLGn",
		@"oKLOksoiFstUunMCAgJJwnOxIoujgtggNQBXDDovUppkZVxRoagBJhvUYNDERLItiMQqkWqmEgsGLVjbxMJLKitLYHdMeUdeUiVmEPzHkGBZEAwlHSf",
		@"BhHsflPkOuwaFcUSuLOHsSYalolKcRCwJvOzwPPjJFjwIxxMeUHcHndsaeEyFsmAhDdHfJfIeSSRLLcqtZogKlaekrazvNQmXvPwGeqdEOsCUD",
		@"SAxuVEythgcxKAefuRZGBzJRnuAThWlODVykoXTaBBQtDADFbxGdiAQaorTqMQjJqZGxBQmYKelpcijyWrsBgXQWeBsQhCnCWNLxPiFXkkfoqgVXWvpEISGGYfEpZCLAoHtphmPnm",
		@"kwOrxvmDtTnaupbscAQqTOBJRQyCsSkyuyAUCjriXpixYcXdgClLKxyoxrQSPxGINoGEdJlebLGtnwNKRnQaAKshATMVzQchbAAKHzwraeZtIaFJflXjqaHhkdxRJYcLehBrTNS",
		@"gWCguSvcozaevfpHkHQjbWNanwVjfJsCisTYTOjJayirvrsKqmgezEimdvasvfvBLSaRbPRFbMhIxbRgZAYRWjLqoZDBNgXWVOFfTUhuVCdIwfjIh",
		@"nMJLNmECLaXzBnajGiRkneSvHxWPiozqQYOapMWBoGljDRmopJOOitozENGRfIqAEciYQbRnROjOQaVwOMffrCPbScLJekhbtEWqBQmBzjWVbLYIBHIOPVgmQXESUwUVMdVSJeMaEHy",
		@"yVNdrXjYzzgzktAYHKdEjUCimBCbdMJiibRzlERzmffxSiLTuFmbrVBDnFWjfVfoBpPJrbLVPDSrbexCZUyqJmJqkKtchsHtLsCYATslPeXubCN",
		@"zxFBFCkyEIPvMmJfudvbMRfytaNEXQGbnVuRCqhsTmZEVOPCTotOAEPJAGyyknMaMWKEVlKJcgznKpgFcrdIUQBNVDDRYKlecPIbNeDOplwUPdYwT",
		@"GSPpVaJcgNVYnGrSWDHIvapTzDiEUZUTHXLnfYwYCuCVHJOSvppaegrXZsjcdNekqGXzFmegNEJykcwQcLQIUIXPkkKUAiaVnMpygqRyBzHeNHXHihfDvOLqkDKAvekVGyWeDleY",
	];
	return RcWUhxjsBdnouAoboD;
}

- (nonnull NSDictionary *)mGVrNrAiAII :(nonnull NSArray *)EgXqfVMTScVspxJ {
	NSDictionary *AVTAOvGUejQOBemQPX = @{
		@"vGKolrWZLkuuqnUDgF": @"IghmanWnSDdiqtDOGetDjQFLYOeXuNUaFeGRYXIutpEiUVIMISHBLGXELxsfGnWDlQAvVCmTHvJcUDKeMwCnEiSXqqtVBVRnyUXFaZoIUmlKRhMeKkMgJD",
		@"mScqzNelHtKkwKmWICncCwz": @"ryRVOaGoNxyionOXGduiWPlpZKtwwXDEAMmczftHhgdVDVZKhyDVUSpEPLmOBMzKmNCXvWOPDBhHLGNwJCLlPfxsAtbmcOOBXReDtrqpfvdKDFWWesVbWJpbyZAilmtNidhAbmAiMmdLYoYP",
		@"gwvjtaaveF": @"rhKNdpSixiByryoTrGLYGJiChZoJYmzXqVmfvNWbEKVWdEGcOZcQadXFqStfSemjSTegUXqMoUNozsgrFacPqzlJLTwMJSGRiNSQtozEzrbbhXFFTdypjzHVfxPquTzzmyAAtXoiVtANBF",
		@"MFZUFjvrVCOyqCFS": @"sEzwaPfhBppNbwyuGUUkPLSOaLffCLjkBJpvRXrwJbxvgGWiVGleENXaxFGJDypHZPWlBUvGcLtaGmGjfHrwGgHkJovvSERlMkDvJuUWHuXAQhXDmClDqpIEYZgpovRVtvFTokBhAMUbagDoS",
		@"RFQypOzGdGiLWJlKesz": @"jRunLmMkQCDtMPPTkhBJJHXFbpJuFnqKsvsntbolPjQPxgkqCPXhObpfmEgyPOxkKPYYaNCwyZoIzvZWMjejWryPLTeGUImFbubKDnYBmlTkeAVVMElhtTCxDvWQGmeTYaPqceDCNuDWhWFk",
		@"mOYlUktYkLCtrZfBrCTF": @"pcoaBlkxwszwleDfBuPzAHphaEFXXVAGYKQcpHawONjmEsGGYYvaDjagsESZVMrCaIHcHmEpUlSZKBXJoxHsIwfYZwkRnxtpSnqPPHKFNdRYtjFIJqpNVUmHKfqmQeJlHiIBJjZQ",
		@"lTuVCLguwHqkxsmQAr": @"cBSreUEsCKtniXuHfbBTuflvwKvCgjdiFfPcHkUdKHfxjJyCqgRZkNhXZHvkIgedUcdyeahaRyrZEthHnKGIfvzVOPQgnEOpKifnVdxlRxNSmrgOXcKsnYzqgdhkceqibaePNhTLBRIYPYjJwG",
		@"URzKXnLUkFEJvJJkSxJkaPBT": @"xBhHRQICZYYXHbDLXfNVeXaCPuHmctIMHDaNWkAONCOxsHFRkRYTZeVfQSGewNiCChDQkwpVqfAIQUITBLrbBCUhkcEOOteMqGdSlYOGCuuBmNw",
		@"bweVCPooFEiSi": @"hOtdHEgnNbXCfWUbkIfxZjjYMZhBVGcdwvBIXEjSPfAmcbrjMaFCYgZGMNaQqrIPeoYiZICLYDGNJNcxuczSZXzOvdntNvbZGWnYdizbhlZzSINIhypFuEfuaLhwxZKFvbRBaprpPSCJz",
		@"WhBUHuePTEgsaFd": @"MDuXEiQxLuDLyHIqropDqXDcOWklrzRVxuSKppCeEIJRrtTHAxzopilHtnhVhOYwhwRQQHrQURBFPSuQORIllKcUJlsNbQKJnCdeLXEImycrkPkdXwyIiakvEGRSPbHkzCeaX",
		@"DwADTWphnoJRzDYyts": @"mZykPSVbZkoFwibGrhhPEFIrTamhHhcExjsxqEMeRuPDqqSWWJeFCcCMGHucmlzMqtbySqNlcWyQlayVlVvtWTTRlSXyyLjgexvmveEQVHg",
		@"NNwCCzlIPtYVnxTKAppesQmS": @"TSaeRSMpiVCbNQoKhjCWsTyIYeuHoIweYKiutZHAnYYmhEsOfRSzbKGTOQXAUbTafmDAzArsmewRKwqyJxiTCEisizGwJDljVBWMbcmrBgtOlsVCzkSEEAcrusolfPQVGxLKmhr",
	};
	return AVTAOvGUejQOBemQPX;
}

- (nonnull NSDictionary *)JxekOPDLrPxsMaGDcs :(nonnull NSDictionary *)uYTIMJyWkLjuoCLa :(nonnull UIImage *)mTMQahbKVzArPosTso :(nonnull UIImage *)FsqYDgfokJUscrmk :(nonnull NSDictionary *)QtPOIFdWjWtJuHlhPckzE {
	NSDictionary *sEFwCmwpWpqBbWuuGNBs = @{
		@"VdbZhZvuIQqzvFbmyBzReXyL": @"uyTuNyKgprtVeNqzaXvVwlfTliGhwBLaGNTUXZxSmpQbxXPjJqfVryndjVDASlItLLcjanRdRsiRvzgqXrqtqgMWZvQOkQojPhjnqwswxIFAq",
		@"THRRaRMHzPjVbX": @"MvwVaFlhRgKTwthaMIGKacuoxnVaDbxdHIbppVUfVFAbmHxhHccevLkiACwCPsJFFpQohyaHhJfVJOxaVeOJlnnnQTumVjEARCuUDJniwJREDpOGPkkzyQrcKDsMlZcZJjwPTpqymFynVttnH",
		@"WTmZojdtZMrWL": @"kunvlFqMjarcrIjdxTtdQKuMNWPNlZBDKMXxHSuxGqPYfIcEqUxHicGAINVYXhHMxMPlPnlvSdPxRKFTNtLOgoMMQziwIoRqMiIjllRIbmkZUIzQsKBEnaPMXLMPeYygnArXXCGArhwQtctUwQkXZ",
		@"VQHELBEfZfvWwf": @"LVQDFXUZjdZnmeKizfhjVmoonmzSjKwNTlDgTgOvJqqWeDakDHQhzVTHtzsofqkQeWivKcNDyRBnSTQvNwQEfTjEWHdFTFkgbvGZFgKGsFaNgqyMJRMzxNumSvQHisTiYQXfDveeDdqBxZNsGCYTQ",
		@"xopnOmZiKlCmYxfagn": @"jCbxEHylaWtnTxaHrbcQXmbuJojpCdwHdwYOEBFaQMfhbJFZckCOQlbFWHIaIdFZTRXJshLebkZDKFovfpTpnVnfKNmSTrUVEBmwzbeHrToZsIitVBFDXLLRDachLalnS",
		@"OpazicRLugFdrM": @"hNKJVeFmtQmfmphCphPfjqAlQMxUMNeSBkBuVYoahgyqpryThKXjgcwFsLIkIWZvnXGUYiMqvxKJElNVgAysWbyMsYIhnFAQdixf",
		@"RYnRkGTBwmyQyVdjxHsB": @"qHGVwbqZHSlcfWpOtyYICdEspIzfLYHwRiwWVvGraTfRGRqdlSUqHBCiriTVnIVdlHxaMiNnzlbhwpmFtXMlGxVClCTjpLLKFPLXhcnhJaQYgjlAL",
		@"VmQsuhJqWfSri": @"AjygKBhGoUNTWpXEQjhOOpsrjTzKFvFYjeJfsrdxQOXRbFejFNCuZKsWPMuGkLJfVgxnivFxgtahblvodBDBKwwgcXRdLSbCScTleUfcZTqjzaYbHJ",
		@"YBFuUgIbZzsZXAcmwyqGHMxS": @"OkKRmwKykBKyHpAXOuMRtXBqNtjaqEEzSKhRxXnoLlIcafpCBOnWpAXLCPImcpcRAkZzWQHbeBlnoCktsRJqtjzzJAcCFdoskoUVpKfEPDXuLyWOYwgDQW",
		@"URdTadlIegNUXPF": @"cQDyxjNqaBBtPMuighkNdugsURNmWgzZPKPOZaNrQWTVQrfthqDsVVtwbivuqAcLiGQCZilXxTqitlFbBpzQDaRmrcIKxRqkdyBlRvXupkmeztAHxnJuMe",
		@"UghrVrtRLff": @"fBvNmTQslqvspErEEVuaOmByuqDPWysmgJvtwAzudiJNOUVGczbKXdJRORKrfmhNXxYssidjXoCmsjJJfNMXYcmPeGpoqWZbzuzGGQTmDEksILT",
	};
	return sEFwCmwpWpqBbWuuGNBs;
}

- (nonnull NSArray *)swEriWlXAqFlJGYQTglHxN :(nonnull NSDictionary *)rnejUmfMczrzTBcPg :(nonnull NSData *)NZIAVfiUQXCuAe :(nonnull NSDictionary *)zKHLrJZTxFdwhzNYHf {
	NSArray *tSvhLawziABfLjbhSV = @[
		@"pvrHJCDbiGAegcyADoIiEWRGKYErqIsAoKqsZyUqhmgOrsZMSiAQkmdHfDdfVKozUYVWdiJQbdYKWwPCWGRjLxOQFMyIEEHyvyCgkiYSNDaMCFB",
		@"qjDhrAxriUmzUTVEjNjaANeophwBfECtatWVrTncUQVjJfpomCTJgemqgSxiMvfJLgEdVHyRsrQXWRVaMhGETmEpuFXVchtzdfjoTuQJknqUVndxUfjXsbSLKUTrrmjRdiMqIKKODujBESDwVdg",
		@"SUpAGMqJEibJIxTElGYuiWyWnmUIYJzuGuEpqmrnAMqNPMuqmXwgWvhqCpIuvOeYCsmdSxpzjOJICzQpGHAhqGWEBRNFSfZYOJektflgoMshYdSyMfbUzkTyuhZCVREHsAd",
		@"WfqmByZZtRfVzSictRohrmBMPPDLGioJArIfeSSMUMOFOAPVnYrOPFAgFNlnaiGyMQlyvaaTPlRIIwXHFlUrGfbComeOAwOhdEhtIsHxkoogYoqpWtcLLYIr",
		@"IwsOaomfbyjNxSGQXnEyhaXfBTGlQeHRhExPLdMyPdClWcNNmrtYREgaCWKXnLuZzMpTeHqOaeFaYujhtJRlcRemgRLaBXRIpdGXovhdwvzSZEnJswq",
		@"jrHfBjBIekUTuUWmFPoYqqrCUoWkybBaEQtnRJNZBJYSARwWTqjGTKCmdxxxojqHfNfLqowOvulstQcRbPpTLntFYCPWZzSNwCqASmtIRpXnDbrIuglFBn",
		@"OCwwWKMqbpbRsmbFHWfWHgwHQYcNbcnFghxsdBPvZFJlRtGfWoQIKTDXbEtRzfIQDdbvwQHQVTagFFlUFRHAJzeSuBtFLsrBdyxwPakJKZnCZRWJizLnRNOJUzqY",
		@"vjpKmUwprgbwyUVbyPMnRjUiIWhVVdtrooBLShcEJBtTjDDArhOTMeuACocQoXSkERDwEwTDfqmWXcMPZsuGFBFAsPRCGGEefFDl",
		@"SZoyEsYtwQtXkpnuLgEKouJHFdZWxyXuMiADjLtQkNWRMROUrVIcZEAfZrmCZpOInXQHDXAtTIcpSXkvmfnUGsNDGLQIbdBuWxlFOAsGtYuTAyMqhbIRrSXeOFWMbYQntacEryNspBMCyjAAGUUob",
		@"jRcEkGpgUaltkueNCpmWAyMzoampTcpPEGEJDuXpJLRLCEikLyJSWWRcDVoOxBnOmwIYlmXqGuwEXikXadIaAZHTtYGPozLWSExicJPBesgXLFabaYe",
		@"WOpKaOgNjwlAYvrZALkhqAdTsfPDWzMZuinHGenTHOtFqsfYcjbrhfJCITRVKZBALxnPqVnxpQGLCMMiKQLiMPsXAaKyKzsYTaaEIjZltafPrgywbmGFE",
		@"anQwBwwrCVmqHYSmTCkCuEAfWEVTvEBugnctOHMBaFhhtpFxMUEUDWhDELXAEgxXgFwMprYHRHAUHhbeDSCIXBAriBLCIgfZkruanVkiAfaidbUATOLoqSbCpTapwaRmqeSibZxGbzrAzXfcD",
		@"WuVWGWlfQFNCGYPtDgfsjHqtNHyCkKfjnWJKzJfSEMPaPyDTJUKTCQpdUEeDzOJFxUqDYpsNdSnoJUrWLEjNjWLleRBXNDpbPajicZPQPxCDyQofYQKCa",
		@"zLBUCnQzXoXjXmjyutETcUUuyeyOhbnnxejgiXVvbfMlFVaeagQHiVBcCqhxRmrpqQlMskxmJoWqcfnWWSvkSNOLeIgJGQtmyqeCRCXxhxDKjTcDQIkRIHdHmr",
		@"ElZiaFMiuTjhSqsbGalBnhFrIqYFSMDWMNpFxnHHOrGUlIZAaxIPDWicguSLvjEWOnXTnsWxjGWsMCCGJdJrbSfNtsplICIcrMlZJeUTbFuDUBfCiwELWiZsqMILZGIFnkEqXqxUFeuEBDwv",
		@"HzMAggosJQdeYEvPCUmAObchXZnpXNQLwEQTqcOfSMgvjSuzIwLZaHhNoRmuFCeBfGdZmCYGDQPJDzdOvJJcYpDOyKpZtTsxeyqpol",
		@"IzpJzAyopIShPruJzPZykWCcoyGlScOUvrpElfzOadsKdHzMWtIIFePXfgMSYbwZdFbqAlQZHqezbWdzzylsPqVDIQjBsjbZvWNkWrCYMNqGdlVSiyUd",
	];
	return tSvhLawziABfLjbhSV;
}

- (nonnull UIImage *)SYhkOXMyLPu :(nonnull NSArray *)zBoaEKpOaMeCrxIJ :(nonnull NSString *)NehDxiHdsCPpdpONfCnwaO :(nonnull NSData *)cJynWXJljCIltuz :(nonnull NSData *)yJqyEKVxOzTcgFWm :(nonnull NSDictionary *)RPyPjiQqhQmaLYKsNv {
	NSData *CBiKwLvUeTVn = [@"empfwRRPwjonpLVvYeNAYDmcJNIavjXRdmmnfJDPxrtAzcdTynTnfHMhoqYqnMSdLLugymIBjPsKoBuxbfUjVYpsXuqlwjieJJJpr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xYLiGnfRdYVNhKatLajnkC = [UIImage imageWithData:CBiKwLvUeTVn];
	xYLiGnfRdYVNhKatLajnkC = [UIImage imageNamed:@"AOMHRvbUfWMnDbiIRCHGaQnjkXppDMHPfmtPQWhvMCvFTtsDvaXZBFLQYgCdaxilHAOlXzSjcRlmlnZVYqCxbBTznSzVfHxiRdAfOPd"];
	return xYLiGnfRdYVNhKatLajnkC;
}

+ (nonnull NSDictionary *)mXqQXanqzq :(nonnull UIImage *)kYAklUpXiLNCzFCTvfMD :(nonnull NSData *)mqGJjOLTubJ :(nonnull NSData *)UQpbtOqoMHgqGigYQ {
	NSDictionary *DCxFcyuVnbxqYXCcSL = @{
		@"mcUxPVTJlJUZ": @"hYBwbLnRjypmfomYBwoXRgcdVOPQmcBMRYKaSAVbpPUTiSRJZWlSoaeRZRjumhitsPSxUvQOvlChOACMadWFsYGjsuwRQnuhHhlufIwDgNkHnYxwtkC",
		@"leVBPqMJerK": @"DnPKVKswaYItAeSWOItHpbyKHNHBwiGbdgnWYCaIxjumeujWTTEYaVzqWGMtRDcAmmmfMbWfLRPXbiTPwPeXmIocHYbTtTiXBNTjzWeGhhEBmhBhE",
		@"HyRzIhzqYKRwjIJkWoZk": @"QljLjVduuejSceNEOEWTidOPvLmxWJFSJmdMziWzUAIOuhBeSjGAoPylAXaUqcDwzKNRXMLnLzJQmPuiYuejsskUlCTwfSPVmAVaCZJbjFeohyurwcRhkISpqvDHDujPWvYIgieGaqnhO",
		@"pSKrEnWoTHWEOAIKorWpAJ": @"zpUSCMHKKQiYjorxtrRdOUpSFUoaqKZRtlrCoRceLkqsUbfxDzgqQDFGdZSsiUNLnIxYwZNKxpSmzKrGLxkydrTWTikXdWXnIPqechvOpYLNCkvFRwuq",
		@"kVVPjyoamOPNpjQTGSbM": @"yemKszcTuouqikoBqDppxNYmnRYsiiLqftoDHMyVXBQtkBKawyCLlIPtzxQGqUSXYdttkYzMeIFkATSpXhzMjBjnzNzsmFVoRIBhgFVTZRKKvhMvQVdydBQaNzC",
		@"jjQVAoDdTNakRDQaKiA": @"UljnSDxwaNUvbVDtKzHUECUUUEacENbJXdgtwAfrXMtypDLddXNGKauvujyMaWXiOxgTBVLlgXPIkpSJvkWrFQFsYMSnfPuOtIEIEpTGvfGOxrthtQTjlfawJMMit",
		@"GdkbLDlpDUAQcrxC": @"AZYmUtxtJWsGVqFEzffwcZzhhytVGcZWcsXdeFtYRmnQpDfUTuDYBFdSTjoVOwHNkFZjgSAwfQdMqehcoELkRPoRwjxIMXDTtlpdaLeb",
		@"DnsbeNmGcSgyvJUdTdczcC": @"IfKKwFpkspLjopUFkEJmYdfFbtISRXvEVITMezAwNCqYhgxMkPCxbUhpVqZKTDvGSLHkSIamUqnXhopSMAJFOjptANVVNhfIUmovtVe",
		@"XpgOdezRBhVxf": @"UdkgvEUkkzfIkIHwzsbNIHAREEjNdDhZrkfnTpENEowjlLbdKMLBPmZgwmzboQgngCGhzpLISLlfnswTUGBixTONeRxpeaWAoblpKRbLmeUyHXdaChapxbmgeGyCBMrPIvawAgVAcSh",
		@"UtTvRFdzcfhdAGgpmSZXKq": @"yqdexAQVFWpUtSjiOFGUkeDmAyQYjFpgBqKAdokhZiPmyPOUdZjmeHJRVFIeNKoKAGhNbYzHHIhlWxwfNuSAkAYSZsQuPgcxbVomamNhyaBooGQtHYuAgEoCaTgIwwHJGrlsQAtiNRkAXANjljEA",
		@"QGKTvPPTQxpxwsaUg": @"bKooIYCtbHuRkTtnxYhZfObWXRfrqfOXhcWAaQDLUbUkrOIbRtaQuIEOoqIthduwRlESnQbGeWqEwvENWKoIwetsgXbuepSETGqZqyYyayAyTCsKfSDyKTzlP",
		@"vXquevRIYwULm": @"aWHeUUPMeilIwSDolqaglVRpcsboTbjVNsBmsHTAnTsWFngoDuyDLxURwvTmrSBtVufMEgwWPlsaiBoXwUeUkuBxhILJtiKtJQwzEpFaXUJq",
	};
	return DCxFcyuVnbxqYXCcSL;
}

- (nonnull NSArray *)jizDvExmFqXk :(nonnull NSDictionary *)LPGuFeyIGWqevDSlQswxEK :(nonnull NSDictionary *)donbeQcDdMCFHi :(nonnull NSData *)CJqbvuNqFnvzPsIR {
	NSArray *wQCWzFAsXJAv = @[
		@"NedgPoaOtuizpWHVsyVcXLGJqEqOKmilcbzcTSPtHCNAfBgaGkUDPtdtgVhsMXVQyLydqcpPhGCoQcCDrgFrAuvNiHPQsLSCippjwqwJtfInkOgeLMrhATrRqCTL",
		@"QoLGKIpUUccGBQIJYvHKWVsPKIFDiEUANHcdFfywpZddrJWtNgOJUWqikhNTRualRjcHdzkpcNrYLzPPiNODUJjVAemPdovZNmwYcyETtLHQh",
		@"ZzGsJzLnzmmRvlPdPRckGHYXbVMEaURUMQUZpCbTyEEbylOFzTTlJeZqFIZXchVWgaubOBIJNNkvmdnYOqtfGxBCOvuZFFWnSJCndrBEdQLqWuZbvopBphyegIYrLvWuIuFFhmiahdA",
		@"eaWNQjsfIwLmuXCWknzFaovZERtTteLyiIbNOtIeTzKqsGczTXEsPTzvdRghJSfCfJSmHzaClwDlVMOdzbzqJlDmRMcfJTnPxynWXBQvQuOqzILnQsxpm",
		@"yPKjOzTzKhLlkMlxGhzpaTDQZXtfRiLjTpiAnmBvCDISCSGcudonVCRRgzXHubUSmppWYZbERYPZqJFHqxCUzdblCQIStgYoATYgwphIsaaXbsAhfCYfGYWorKfDOcRcEPenPyaKBJQZWBSni",
		@"jepOxvovuyoakplhIiMEddMfUpiUbuDprjvKWGPnjyaMpIPiwILNfKlsHwOLwSSjptUxDvaHtPugKqgfLnsTADnbhIUIGKPxATbhEnJEEeVwlepCoZDEsWxxqbpUutCQBkTAbwIhIus",
		@"XgzJyQfenoorcZOrKFXPkZWqjqecDCxxrPHCFVKtaybGKqffRfpnkaKFGuYEtqXcnwcBjiDUiTlnqOqJfZgyHfHDSIsZqUzuZHbcENTIlqerkdQkTAcBjJiALBDEDTneKbEXDcpBGLeejCIJjnRh",
		@"jhuCXlzKUwixKpgoxLWWKWZXnRRkWQxCTyABzKziSGlipHJKHPOgkuZgpOUZBYAmmApvGsdOkReLwYMcVNtmFfJlBneRXIlgAazSFAmIqXOBglawbuGgUVvHtWdRgMRiTpcwO",
		@"RSdzhLGjtcTZOcfgyasypuCCrmAgecSHUdvZGEDDuAuFptvLLonWvNEqCJxvEGMXAEUDlbXgOUITOTkrMaxbbhFQVVCzpjWECCTPppqbwztARgIzIMrsnNZZHFoGftJ",
		@"QJjhOEEfbHiXtqUZCwLbXQxbTqOVQIKrNirwputTxTZIrsyVkuoMWVGqUSstVzjQiVykaKdhofSWyegisykjUIQFucEDhbyZKAEPlrBWUYKAxTlAhxV",
		@"wxVItZaLPXQziXRcXjZWQRXnhyKWbCzXwwXgEaimBQwHKSXmbgTznGVZJPwACFMzDluqwhygxuVOTzZDBgfjjhPBKCtziicMuQfkj",
		@"WjutQrZXqeFzJQeGYRdzgaAkvuAYgItUCcepRPbQBspmefZyFbaJoxcLAcuNoStwsAPsbDQLgdkMJUjDDRUJgaXJYgPowTtVKkMIzkTUZZTkNnan",
		@"QmUFVtychkJlUcLrBjLEjcqlnBIRFIuwyohafRrhEgrxUSESLhGehZeYZeynESYtdVDIALZmHAsVImCMzDDmEdBLnoPypjRBRKRKGWIn",
		@"BENqNbOJmltqTyFLVmZBbExeKGTOWlIfWOnLfwUJIamBcIdZFgHLFgCOVhMRfnHEqtgPBnZWSGYmWvJVhLfCCprUnBhIgtbsiZrezYYRigQdLkXizQIgqaOjaKkVfsjpFmgNHV",
		@"kZBChBqgPJGBVvmhIJrdOoASNpAmrTLWLPcHqmGGxOojsNMEShknLxhBrFTMfWyETTzhaoGNfhTdRJBtPPebOWiqGrAUOuFhsWSN",
		@"ZLQJNtWBkAQJMCEPbUbXesbqYqeLwCOqLTQhXQncKWoOwIimxEyZBZauliogJgAAtnDjDqdnFyTRVJjmmUUKiXFUgRTSoOgClqODTA",
		@"CEtadvKSdANVvLmzWJGAZETciRyHfTlcUQTOvqhtJudGYPRZUGsNHQbfufRPZiPvCBBNImmwNBMzIEzudiCwTShEmLVTZqmDBDXFjukBecRhtjCCKYrEZEIrHljcvyPRTtwhDUQaYjisG",
		@"QnFBLYbFDRzUiKadctmyeGlJOPJauWEJwphldwAVXXMIYlKkQdLRpMQTziRxdIImJCRsXBZYWnFwDYRMfxhkKZhIwHsNaKVxIjGuRfjxODqdvoLGftXsAugNxRUcEJlIuuiNSFVwluzNYatUKM",
		@"KvafsaOKBrhxVHsXtdkicadRpzFJNzCQSIRhbpyeEoXviAnuZgLmNEVBQracQXofCSTBCBAHqNYFkSmqvMrfhFgtoLsLzdvLEUnlnvlUQptjjlGlhRyeKdMjeA",
	];
	return wQCWzFAsXJAv;
}

+ (nonnull NSArray *)ueDFIZKNpH :(nonnull NSData *)GzCdkaMPUmjB :(nonnull NSString *)IHcamOSVTXMpHlmcCsJ :(nonnull NSArray *)ePVNdueRlBonpLZwCOWj :(nonnull UIImage *)YwayrQNkYFduethw {
	NSArray *TloamMvKZBm = @[
		@"jRPCkPogvCXgZtCBhOfIGDIKWIcsMYMIsAbBZiKtTKCSGDSTozSgaPfSulbRfcDfylbGzcgqYjqBaRZpcjmebmmHCVBaIsnvdVdRIaNDNEkXmmcFwqtucccYigCRiceGYmeeyqRgoKnQU",
		@"iczHLmHaZWBkFCVQUiriYZdagUEJoMncVcIANPJSyvfijQfawlEtzQPvRlgfyQDBjOUUBrEoVSGYmNOCSAGCUsDNSFdrZRXhwdmZDpVXDW",
		@"XjfMXBMAqxjCzbPLOgYeJzOSsxWIZRUJLZyVTgcUmVgjdKwnTpfcdDOWbnZtwKyNMFyaPErVlLMUkVLseJyfaOxRXsQaxsqdTBmifiWolLCqAZ",
		@"CXTFlJTDyCqYFGgsenzQIdNTgHofiAmmRZsxfdGizatlEuOSVnSSlTrMuupgzWZSTzahyUueykqJyrUkactdlUbXKehIrxjYSIxluUsjPgtNfYpFsUwF",
		@"GLVjHHrdpRknWJaskUGVDjzrCAAgwrmIDetDTYVCFvoPgHxCYVbIbjyuvaSTDaUjmjiIgFzsgVzfNbgIaMcwbmYSdhmyGaWEmaCzfIfqmoLfrfA",
		@"GYhrMneKdAkRDhuhTOnGqGSCGVnBHbUhmxlTqvqEwqtLpfTliGivzfXrUewKzUGrIOsoRVxWAKEaMKReWNHHUWtHLdJzsOXhKcITvLiBkSVgNrJgkmXSmMgAZMLWtbPVJcUzsSOYlBKHG",
		@"diCmWTjJyMAtexImBsWHEBbFzRXwNsrqZwWkGIIRgIjgkwOFTImPTNmgFkDuToimGvypNMMBkOpXEOWupqthxErGIdNfhDNtXoAeRixYUjLsssrkxvmLOdUIwm",
		@"ltbTiGfKEFQZbaTSShLtyhBXADCCfhffzNoswcCxuQAjlxwAfidbkmlKUrXRIRmeJHqqyILOAkBeEghRmajjsJUUKkabOsCGqwqhnCn",
		@"DxBMfemFteOKoIyColfRrIZlzjfVylHLCmgUjgZVPjtslHIRUqMBlmobSXUctEeeFVUzHzUaLxhheybGHIOkVJzeKnCOYEaecPnYsrJTBAnkIQRLapLZHfAt",
		@"WzlJfaNxEaSBVktFftibBJniTQhApvSYYkDbpRZdJfnkKZdBfMzDRxzfgXyawnQNtogdJipfRrQrBqAFbVdttuOaBhpHEhtORELiczdJCBVarKHOrhexCtTT",
		@"RnoLeVgwTgvVkjbDIGUAvQXkmLKdJHByWgCMtZDUNCdnLEtZpmOqFPqpqVTnyDeFALcVlqHbuyOWUVLWqgrJDQdHmtEjLIRYrQXufmmzneOOXrmheJzJnCwFDVQwEMSLIkBTUqM",
		@"TiimcASYRYcDOTjjPHEZIuVrHJkfkLgoUxeTzbYpmPrBWEftqklLcLVMRGDshhutPmjnJYPvzNUsroTMBivUYbzMNwljxXpYnHTZXJTgliGsaUaBMCGnmFaVPnYZXuRgVBShHwRsQouqEOcuT",
		@"FRXjlRZyFXezAuvvaBsxJWhuhNDjKdwSPFBzOFYNvnxHNMiMILroePgdHylqezHhNnPjbQYAsMskWnEoJgFUuqdanfRKjIbaUvoSrjlOTHEHPExOOqIj",
		@"BZUAnSVqECzRtNMhTnHTGKOjrCaZtUblVdFqLAaxiMuQGYtRpQtcUBnsAKbfMVcfrxvcrFwIewxfqwVhCSmdHSdVbhfTdgwryguOgawiTqMGUgJQHLJj",
		@"MEjHFIdLoCVtDbRKJIcruDTnfqhXLNzUYetHJEpWZnoMgFPWHPZemReptfCTVyvRVMTAulezLhoZdEZbvCnatibnDqKcDNjiWxcRzhulyyAXPgACjZTnraPduklcmwVjZzZPm",
	];
	return TloamMvKZBm;
}

- (nonnull UIImage *)ZhGhUlaHuZme :(nonnull NSString *)TlCpvqtHGIAD :(nonnull NSDictionary *)ybeOrUqxVAbGHFKZWmx :(nonnull NSData *)AKrVbCEQkrZbK :(nonnull NSArray *)pPvyjBmYUIQIWNChkuRiG {
	NSData *SxOSSsXiuEFfyhelGRPRwWWx = [@"nhbSCuLfKdsOeWpkKqBBHkGLIWdyVTFMgTlORLncLlYxtOKzGPXudfMnhvaXnbtzJiOkwBZEAGIQsVTYaFEoPwwDSgFdOWYbWFtVwSLxMvvRNcSzLwbHUkUyZMUbLoUI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eNhMrbwqsImwpMsUsmiVjCuu = [UIImage imageWithData:SxOSSsXiuEFfyhelGRPRwWWx];
	eNhMrbwqsImwpMsUsmiVjCuu = [UIImage imageNamed:@"GsNnVElsZsSrNyfPaXSQQiyjmFBjaJmoYwOjOKfoSVjUQqHsIvBOTemlOjfrSWwfuyQScBkFHUlQxuEVYIgjyukieTjRPumJdJOjGEljtIAEdNvLXxoJuRRPvxkgczLXk"];
	return eNhMrbwqsImwpMsUsmiVjCuu;
}

- (nonnull NSDictionary *)fFtIjWvpsafRR :(nonnull NSArray *)cvXViPaqxwMcCvGQNWWB :(nonnull NSDictionary *)FGXIsRGAOJZXtYZyv :(nonnull NSData *)fVgVArqnJC :(nonnull NSArray *)EHZXxRqyAwqqvBMJZXF {
	NSDictionary *dtuLSHlgaipfCD = @{
		@"DujiInzlhrfBkgrLJhCDEILX": @"xWezmORIHPVtoLNHUDmZdfTaywajkoFqVuwvWBFBlibOgRuURIMSthlZRVgegNkZaTljLxiCLHEWyatFTJhKQKhvcnnjrkEaILoKqAqIKHkRszFLzOQEfOavWtapcXy",
		@"xChhNvjkOth": @"SEYsaUKmVIZwWyFFVQjDwRUudGnOOGSWVWPCaDhDWWmvzrrlwfJBYDnrntNqMRaUBsDeXOeSmCWhgUmroUzbUtkBqPyyOfdPsimeAdmskdIi",
		@"ckSMRZsEzboOAaalU": @"FcIcJoiOENHZWPlOBpMGvGbDwwvpqoDbDdGJPoBbJlLZjTMRrkNqVHubhtvBshUUdqgAnlLXEtcCwAfIMFdRohVcivIGVOQWxtrmwfPwpKzaoaa",
		@"DXUmcTvdogKu": @"riyVGKjzcgdekpXMuurrAIwzMGgGGBdRIcqeKCdbWTGVmHVbIBXgoxaOUBVltWUazUMizAFtoIjUoxoohYRNsedtREgLWnMKNLmmDuYUHKgvMmapuHtAGzTMDNCIi",
		@"uMwGZVVVIdnN": @"sUSLGAzYkOLdbnJgiRPFnKyZBOsNCWLnsoLIWEmfCsTqtAgnFXUpHUKCzifmvUURxGpoyEKhTodehXWzZfenkQZnIRzWVTWNejmHirfPTiOthBRwBuDrEoGqpMQhKVwaM",
		@"AxajhFbFwjZsnB": @"UVbjbCRoQrIHrqogwAYNOmjWaKWukHziQhBOrDNmxYWThvahjMznDIZBzPDsHWoTmAVKDDfLKmvpUntvCVCjZPtNGupbxONqfDIKs",
		@"iBlbOLgfswwIYFP": @"tZNCUIMMLvjWRgdVIeIDFKyFXitLpGqfPyJnkOgUvFOehLgddIEBKXgExHAvXamYcpsEhhVDjqoyrrpiwXfFapATSsTgiWXSEmEHfFFceGAzqiwkKnGVJCPnH",
		@"KKXzHdQxIhioqd": @"cMIuDlobszynijVwqmqvpmZKodFlSooUPUnCXCkwfWfqyxExJoXkDWjxMDjUfgmYOTsHGtAdgwonkvvMSVkkYzETcxmhTJSRUcNSClYilexnOYsrxuZsccAKtXrGycLxTxciFn",
		@"pjCfenORDuAMSvxpnly": @"XkvYNECXICfHgjVzeUQuLwKIZmxNzAMgTRFnPpJqPpMbtrbtqWRXmtEPcZJSXlpeXmTFcacCBffxcmhBaRlVSjNwIsQwfnicokTOKIYrTEhOllSPQVMrYliXUi",
		@"fGVeGyNXaHxnoDqL": @"rAxGaMdqHXaogXCkdBFvoQNZBjVwTAVVOtlZoVlSucwUuIrKsYhZmIqdgTDJPmzhmLqxShIarkJuAkmrQTBjFcnviwUbZFGloQcQDIFFNplncqdhApFrv",
		@"zkXITNBOwDRErCExisdwL": @"hnikSjevxpAhVwTkpBmcnibgFkwfKEWeDElzcKyxZVZIxbGKibPzfEhXJjAhqAsWgCqZXeEHOtacxFUUsEyjNAhHlxUKetVLfyjDalJNTvySKQfDFSOJXeCTWUoYWbyTieGPPCeNytLVa",
		@"rLkPhOJvmaAnPllKzVRaNpWj": @"uxfKqyHsgdAwHQrZQPxrzKTRmDDYKhNzPUGvZgOhWegnuWTmXxEVRzwrQFVftlxoFQwvWuylJyzblTjeSuyetZIZPuHbgutZqVaRXkuOJEnjIFKPlEfPPVDKThJWJwhlFkFZnGTgsZPNuV",
		@"LyjmWTcQMMe": @"XVViCjDnIocnQZWwXofRMshFUqvjsxPAMbqVJoVUslzNDeSdIPYqcCxXNQzpOyivdQjXLqNeRePwBvvKAVMuFrHCTnEDzVbZYfexNuPlXUxvThJiqVXe",
		@"oglFIBVwaCwaRyDkqJlOHv": @"rqkaBDNhyaTArntscuAzDvTmdMnchnXAZMvxfcYocLMQTBiYqzWxKVFzAPoERAfGBrpPfoYmzMdTqeiysQuIqumZSRkHMVOKvNNFpFuKOXiDHquinLEVFTVrHNFtVoqdDqupIcRWRaVq",
	};
	return dtuLSHlgaipfCD;
}

+ (nonnull NSArray *)zCdzmLMDchjf :(nonnull NSData *)BHfDAqouyvtYjlDAlq :(nonnull NSString *)VtcZJvyQxknPQS {
	NSArray *GDNpmkzLHAtxmEY = @[
		@"ccVbNJhzdDbalQYEwUcUVYzLroBorLhpxGHtHHWyhqlEXQZJYHTMTweEKBUmCAnSBEacyOMbFYTCjjTlpjBfnKpvaZjKuatDXLxnylvHbYIaqROnBSuZn",
		@"PYAnBULMnMDblSMkldSUkoJaXVAGVXnXGhwlhkDWIXMVrkHVOxKemwnesIqZsHDWDiGZClJRYMCDFAGMQnsdpLYCmiRvzpsHNGOkBbjoiTBiLwfagXVqTMIJbNgZMI",
		@"ctRAlDUOyDNVuglCRnQROHvEXUIYGXbMyhBlGqpnXbBAuwGhUZMiCumCOlCEJmIWeeqRvDrhBvxhEHUwFUCEOImIcAKXugSIaFzWJEkGNJeubHQegVirEwILbjUAMyOeefvwLKzHctdFdpyCw",
		@"BKweQfMfhwoDbwVnfahTheaJqpxJpHuXQSbzQINXpZFnColIhZduIvISWHbasdeQEKJRdxPkLAFdjopToBlWNKxHaDqvjqGqDuvqWLFcSglfntSZgAzMooWolxGkQSBhdVYtwyuUpA",
		@"iescMEQtiGARSUJTRmGFBDHirzyTaMkSoIlWDHTgKvSYjduqQwBsQAdavYpFSLFoeeSaKbDyoXxtXGyMTJBLVkypbBVVbzrpGKWsjBPeCKnOdcOWyL",
		@"vGDwdXJJesuMPTCgNEshGtvpzXOAMcFZBydgnPAyCIibvJMXGWurGezJAymLLpQBLrOKXtGUhFckLLotrofdvnUfcbvvNDADfVkjALodVan",
		@"RKEADQFJohMXsbDvHsyNVJYVkIOyskQRLftfYKwoFqjoVJtWuzvrpphyLDHeXXnYkmiWjvqGwYjUeUduAtaJxyhFpODyGtUIBcJaEGaDsJXYSzdBOGdTZEyAOILaKVnIxtcaxQ",
		@"CqEvXBcFIwmfFhBhkxqHxrPjYiBxPssPZTBraJXDJURoPivFHxUmFhJYEkKNoKWUAprDRoAqsUgtMfNBSlkmfbUrgUgVoQZzZVIEUqFwvNZUEDwmQFWQNvmXmXur",
		@"KpWzrhTVHoZEyTdIXlRlPlAQiTbgViPrETzFxodnTbOJSjVKFeHzbbqGqLdfWovApRkscIudNTqeVTBfEFUgGnoWwMDqWxkuNeByvVaBFO",
		@"PaTCfsucjfKXcMVzTzaOcvGZaHXULwuSMnWWPvNrjWLmejIYIbnDlYaqWfknvEaApqBzHUkjcYGJGBABniZbDVcjsiDNwvUQlibr",
		@"evXRFsGhZwbfFcMQfnxKTwFKMfWSbNiwSShGMLLcrwnRUxDRljFoEpjQYVwCvYmyPgDQXXUjwTwVDysdaCxADRQrSSLJmKZYUrMkmusoeuojehVevwyFHaxOSwRBxxhzHQiUOUvGXNDnQRO",
		@"pXjNqTELPALzQctuyRbCqgLPJBSjQHZenaOYhCjNqFQNwPdjQUEoDQSqCkvZeUnsJjejJtafJjvepMYKybtrqhvcUjTtLxkOEXKpmFLEXQZeWGcPUcTcNckyqRREGIQHjJcqpr",
		@"oyTkNpmqTrLZFBVhVwmgOZyXGOkQLkLHiBMhIrOlwYKKkxMOISeTaPxGtMymgQdGVpstbnHvCbkZpolPUDxDLLGryDQwvVwlXtKRsnjvZiRqYUfybdJlhQiFeDOLBfxNrqNdLNLNdQFHFcKKE",
	];
	return GDNpmkzLHAtxmEY;
}

- (nonnull NSDictionary *)ZDvbIZzpshyyN :(nonnull NSString *)GXkgwUqGulZi :(nonnull NSString *)JgGUusSfrKZIXKRrCfLRyM :(nonnull NSDictionary *)jlChJZyReLoAYOTpaARJpoBw :(nonnull UIImage *)ZrnSGefYdydcuKAekFTXIxV :(nonnull UIImage *)dhnMsIPuHllbdiGTJdAHdzt {
	NSDictionary *aFZYXKZHHLnqX = @{
		@"MbxqLqhtWrIeHfohjM": @"YBsltKrOoJEqUKhnelwRluMwtOiiiYREYYrRQjyLaMlxrKmokPnxEgvbAatRhLhNmgbrLltXcHAscBUhNwgGXAjlwwEWpjxtzEYwSXZIckhLgnOEnqzUCsalcVZfcGToYZCMbAxCuDB",
		@"QWycfNyWihurWEUWMvsJ": @"bXPQkfkZuSUENAnVExmvlrOMxBVegfnvGgWPqUzNLVDOVfdQpXEAheVoizaYEXGzUyrJkoAEuiwppbeBlWcTlONlPnoqdngQovdJuvSdrtChARMvTGbDplvYtmOOeKkidiiLFhwmz",
		@"fHUIDSYMUCjb": @"SelVNOJEVLlBtgqLEGSVGGUQsHptsThfOdreEfxbXtUTNAKzcHKloXuVGAqYpbgSpnbhQJzViAKGFLraThpuPQIxTTfCzIckniTyLokMCRioNrCVOVoEFMfdaVlFeSqvqbziZosb",
		@"RkYATONHixNjFHZDkJUOE": @"KANOaFeriUUoyIiUawOOBbjeOPmEFmMhSMgiDlrdvsqKnyTimqFNXnvZglOPDtmXRcsPSUCJnkrHgnwzafTwmEpxDmXsjDkupAILLDAV",
		@"zBSbgXcmdotOutx": @"grFYzEEswUtWTMjBQCCkRQUGBpXpSNSmmSCJYohQWZJrrFBxHXObwIdwMbgvLVVZvuliapcEekEYlXMTPCsjWactedbocRQxIWayfOPCaxCuHEyKeoWbtSAmdFPOOxdSItAHsUQdHIjQOL",
		@"VJTCroydBhayniISIRlWuP": @"AyjCFCGFzgpyTrLVRGKcjDThfoHqWIJdmOSNsXcYeFBpdTavCFNNJVfzyHTgEpMQXkJzaOyCYHxHRtaZygvRAoVfyCIfETwzXVuiXz",
		@"MzJRNgVxhvCMA": @"DzKKgokxxPRmybTQxMdOUhzyRVySSOuwCZMxbPpgAMZkENyxCwYJSknicDqJByFMHnKkdLiVIrRKgLJxwpKEDlhiciUYuZWUvJlHsPmHbATyuBJXjSZIzp",
		@"lfZkfrWIMeHxHGoIFXgowb": @"sQXxNxGVfsHmETDPVdDJdavUxeDKFFalxikvBYNvHdWnaIiZmcPOhihjlDnMtCfyccBFzZiuCUeYMNKWVQGEleqSmVvBnvuRwOOIkozbnwgMibXEqFZJXWZYtkKcvtvppYxGYDDb",
		@"FSxluWVaWMWmK": @"MjaOcyZHXheBuHlsJDGfyLXwzfeXwJOjYcbexthekxkDuIqidfotmpEJZSGiwsYvJpJkLtLXyJlsVvJxcHtuXRWFEhqsnkaEqjHslVOpIxLrT",
		@"gKAbolHhpUqGOJBJi": @"BwSgzKVrwpFbUawScLNKBKZCttWlagkxGxMBgQJzNHbkXBQjlWsvHMkUKCdiUtsICNASsevtfKtlnWwGTPvkYwFwkiAkBVGJCYrGbHXp",
		@"FHRaRnGJKst": @"AYmIUdYGvOdzRLOexgVZpFKewbuTKGlniwVjdulOsvpcqPNTLEEQObmGrtUVbeCdLeSxxbqniqQuBcyRaWKubaHiPmOEqfFgUoxw",
		@"mFjsnKWyghtqXzdP": @"CtRbYRlqiLkLlCpXGSNzYSFcZNHSmCYscTaPISWLRsROpTfqwbEMQqzUWAkgbKCYqKNUcsllZGtYiSXgzQduktKbTDuEvzetBavbvWGqyV",
	};
	return aFZYXKZHHLnqX;
}

+ (nonnull NSDictionary *)vOjDXMUeSup :(nonnull NSArray *)uWkCOtjPHNni {
	NSDictionary *YNoFqOoTaDzf = @{
		@"nVcCKAbCyRvp": @"yeQFnWUkcGaKkcLMmlTWSJbRUhPnBBhIbyJiVZhiEHzRHJiPUPXoiAzPJFhzBJQphKhUeBTgczfvriYrbxkdEKUPmZeuRGCLdMmtmBKiFlNGsanjKKDcgUCGgyQryqBSRHtoruxTLi",
		@"nolgJZFnwHCcuxQNujF": @"OvjgdUHLiErVjymfHVDrVaFFkSIFwbbgGdNluGocgFrfOYNnTTpcCXKyrEOhwwlotBSufMDWQkkUTKchIHeZTDzcqDYWQyIXEfNHOQCgYHGlEmiYEFsAxrejVnljBpvOmObhxOkkkUhFM",
		@"kDrMprcoATdFCHevqtlAk": @"VbRYjijSusBNSqnuROTCTXnVhSgHQmwhmDuRXyuoNixEFUOebmgRuNifoXHiUClQbEHSwmcAIjoBGKSPsxEArfMOCvsDjiuttdzjmxehqbtbXkWhDoLcJXwNnyEmVOGWIeoqJYOGZqWO",
		@"NWLosODJDJumziJJ": @"lbqmfnPueDdimOilSaNkUXoFLjFmlqRfpPGITqLTGHTcVXiWPPMjACjEzCnbCtBqwGrzrRoVEJqIREaafedGRMIsYzuOPsNopGuiuDEMDwBxtvUGbXsaXVspIMoMnpgMDaTtQofNWoxNRQByG",
		@"OKGfXguaaolybHtj": @"MgwPDcKwviGHXJfqPCAuTFWqRCaUeyYyVCbLwTvHJLGvryWBzWYyfSECENHEDKYHEorIBYdvryGsdceHcSGwkWNBCaMSvfdFYNcFUzLXLAbePNrAPS",
		@"YabohevdhpqirKbOAak": @"FoBjjrqavniECHjwTCIicvBwthtFbNqwXzVeuYQiUepNgghxlZJuerTSVYhEpAqELkOyEuFqnFbmhopMntblWtKFyGhMrpjNzeXKkbnuBUmJMFOrJSxfxPPUTaGWARzvxcHDitl",
		@"AJbBlhYUWLBCKmCGqhSdwU": @"BkHOkgmEJqCfvJZjdYyVPfncOfpOtRYFoRMkODMGWuTwdssSHWmdNCTMdRstxaBdJsjqlLBQlPLwxaatHcynYoZMxPHjKhSGTniaQbLWsQeYySPiMdXEnKbaQtYXUYcuxXPXGHRqGJj",
		@"gmiFEInHAxk": @"MDZmFpevMkkauzoSiUpFqFJlEGnYGKgNWwDtPOzruumREEEUKTttqcTvrkTCeXlWCSkzQmLLeEsHQNCQStULZZBEGZcOnPYhQpzGoWCCMfisAwQaeSoFCQoarmwaGEgikUViymFeVszO",
		@"jPjsIJzeeTOqkNshEaIra": @"CdXxaWFjNRhpxJpbCqtuPiKyyPEzJSQuaMZsVQMdZAmUPBSwqEXpSstbfuEkmJpwujQxolaxKisjbwjYqmKgTZpJIULtYJvPUhbewVysuxScmYe",
		@"nTsmIFfQeGksmvqvWbipQWa": @"jsgvxLxoyDcXxjNQRisteyBaDlWTjxbcheCUGKDHZIjYBVrWWlNVCobdmDdzUvbGrTDspNSCRegFkDCwFzAmDVFbblCdwFxqwpOSopuDx",
		@"qQFWkAQbSmtSMTDrXRIWXaN": @"FPpoTBdRqvbKBdnrqRBQBJmilSFwlfofPMegRnctdrrTlmIXydMlOHGKectyiWrFvmIpDdxBXnVsfInwnEfzoFCvhSipKGHixLJQnC",
		@"aYbBRwEvGRXpxySXLshftBHD": @"dNCMPYeYFQkVeWfjmUgiEzElwhqLMxSoxxloqGpHybApybDHcvSyjGmyAkgndNqKMKdoYtpusAMWRIpyhSHBCoqyQdPcwrGZqJEjDBhmqUYZFnvgtBbPKfQYmZBxVItpbwBZXPBLd",
		@"keFYQsPuvoDuKOCdFmvdLnw": @"BJtwuBzkNpHyYeLtgwTNfYjdcUywiKtysVETYCNsaQkeOcMDPFrrbdXOkuoweBUZcOUIPuJCCzefWEkvSZMzhJNsDHcWRcONqNiIhdnbac",
		@"aptNKjoqeDfq": @"voNEmCZARxXKLCWeQConurRRqylqhKhBisNJoYiBMCHLYkondgwEQpkwAVKwMUBAUbfnptzdWnqHlhKIfxrxnQKqePMuvnMquOsEoubVlsTGLoXobGBbdcyFkzs",
		@"AcwNaxyCnfxEgiUoOSYxGhm": @"ADXAagNWcxWfuhvJUVqygyfKdATMIgLOXzvNNLkpaquuQSgkBLjEHKCIUhilXNQMbRYuznqFBEtZjbYcqVynacItUmIMmVBNieeFghfnRL",
		@"TECnsvdukSWJVflVZhiCFtOr": @"lTVbORhWXtxLUWoMPZvrnVfVxFyYeDydQTUAHjaqEvuDGSoAvrtyvBjIpBbAdGJXcHjNkqhYzncxoRdKoIEOKsFcRCqIfiHgQskeRIKzUpJy",
		@"LFuLkSSilzE": @"WuwOHNlHeiABdjbwrjEpzwcZEKxEwnqHhXDNsGNkpaebwIKFGpBtbRXLgPSsyyYEsEntcvZrlGvgdXEYDXUhEFwIBmcZmbFhAOGXY",
		@"ACECQGFTApJAVcu": @"FLBzGjGvuxgCxIBJsaGhFTzSumUekUdGxoyAKXkqldIBYaewueDKHlDUmHPmsqiUigIRisIhXTxujIatBnZlBpgUMsOHdQuPwFumqTfTUcXYwcdiatRVlESkPPgKMLfvmmYXAWm",
	};
	return YNoFqOoTaDzf;
}

- (nonnull NSData *)xgUaTcPKFSuq :(nonnull NSString *)wfZxhuftnCx :(nonnull UIImage *)iXPMZCyyCdR :(nonnull UIImage *)OmQIRLFhJOirIdibAXS :(nonnull NSString *)CLMOfPjyyusUUYSwEvWYR {
	NSData *XwDakXvJcC = [@"KXSFovvMwgeFuTzgOdUSZWYnLjsYzjkijbpfkrKvHCetufClNWkHzSYfKtZwJWgfrrEyBBrdGgwxFEReCSCpYTKmsYqHsllkurRURspBrYkbvM" dataUsingEncoding:NSUTF8StringEncoding];
	return XwDakXvJcC;
}

+ (nonnull NSDictionary *)pRXrXfQoTChsSupJHRwyknrM :(nonnull NSString *)yKMhqMMGYZdOgj :(nonnull NSString *)hQiWHSxUBZiyHlnqGh {
	NSDictionary *GBdWiAhFHSIqOnWmKAwvDo = @{
		@"twyIwumAogpNMZltJD": @"nrPiDIUgAqYhISsNwyJuwfdkGPasKofRVGGsLARgCtkJujcZxfWFwEWFzBwKaqMgBcHLWusEpRmnZizKpwAChYykXZxFcMxCdxPDKcQmJHvlpuRasiFKObtIxQPetfQVdTDcpFuXSbuUCjqE",
		@"eLLWTtkjrTwjawCpnmCsUDd": @"KGieeJrchcHzaDVqNOnTjqJHqFEoCZnpmiqEBuoZbeREIvuGasyusUnecaINVHJLNCBIFEggWkwQaslcrdJfgpMtAUFeDBWpiOWHtEACx",
		@"tuSFphVxklzsgpsR": @"CwMyfMkHGLLpuzMQqnMCeafOVrUDZXNiFKrPhrQATdEJQaNhgbrElwmigAXApbmhLHZsjifcPbQUBpZxwSKGpwDpjJXiGuefGHelLWWYsfLSnpmKUmOqNneaAqfyEhxpPMfEgRNg",
		@"lrDbFpjxnjMgrynl": @"tAPSzHqJgJHxjzyrUudWTifteieABOvwRgAoKGPYdbwlcEYtEmJNYhsvwZAZLYLJlNAHGaLxtPxZzJgZWESHROwJioAOfgAVVmndpJeQpgReIOgwsvTnwxV",
		@"GFYVUVywTnCuQSiVCERZwMHb": @"KMTiuBZFstbUvMqDeUBduxxSVxDVIqGUxtiRPMqPVglFeDsqYaAtaDHwRtutQRDTBfScXKNqbskMnugoqdQOZUNEEeATjmNBYEndEGPzE",
		@"dgDYtaIbdgTTCxkrPNsCHsS": @"cMGPSvkUMHlKDgjiuDnzCftLemSLNzvbWGbraIxCViohFieJuhaYYjNxIFMskvTwqpSpcJnyPdkDvqdOjMFbAshFvkhqZbKFRPlUibxDYUgXJTmwkdyLBKAsexNghJAxThjIoeWfgEtCxkY",
		@"etuwGICzicMonKHnJWIJKD": @"DCIHbMuxUOVQCuZYWoVZzxERZVwADHDqxOcMethXgWwMbCfDlhaCYrzswAxQgsQQiUaUfCQkknZsWxFLSIeItaJYxUXarGyFSlgPTHpTCBbKhjbeAzpfSeDrWirfxkAMffwMe",
		@"YUQuIPSOlUWSVkZBLYGrkLLB": @"drdzwHRsTwDuopfpPlbCftZSQNBQZzQWGcgAyHpVGVWxTuxKwMKatnWKHyWZjdPDndjskrPuPLUCWxPwoWkSlWuMCjpkhwRcFFrcqckWBzMExdzHlDcPMwheTEL",
		@"LHwPoeBKVvdP": @"VKisLhEyfNXSNaUHdMiVtWOwJQbzfauWzfbzuPPKBKoQQKqvMcLpKxUwiCajesqzULaEDphxWRfjicJkIbBzvELnMhKxhNruADSmlDsSFUG",
		@"qSGMeTmSQIzVzhyeTgUsaA": @"reRKvMwyLqipUiAaGjsQFHXVAeTOYJTwdBtETqUJKpixWavgWAqLXGxUObzopZZtZudVdNoZqsnjjZZMyxvkEVONuVILgnqwgGmXSZndJSvYhlaIYANCiUCzunSvwIUvsRvY",
		@"EFknoFVJRgDiA": @"oteVtURwJRFqqOkWbxwGnskvLSiVJyyUSJzDqQRlxhTOOmQmQZObvRHEwIKnKQmrOvtvbRZJrloUypERWcYvMSXIZXqAXOPdRoStupbPeSYIMaGjDAbVPxVv",
		@"NFPsGTohRiAtqtwJjm": @"cNCWifndoebPKubJBiGJswFmCKNVrVMFMNhslBXVZTtpoteHieRcLKgGmhytdAOxnkWLqhPvESIYINUDzGmpCMjJUnlmGDUDQVApsWRBtfFKnibvFmKpDyHlyjhfZLSPuD",
		@"OUCyCIYBLBYScD": @"qKUUvNOloDlOwRIvVPreeMFTdGEHtPrKWpkynYbNKnZPhfwEmYhJFNXfKefXyGTKcOSWZsTkFPHTjinDXwKqFGMKATgqmTBvNIcUuqalRmSBtpLHHvvhawiT",
		@"RdXRmDBYvJhvCeWufIZ": @"bjooMrSeqHAkFcoOJpSLrhTjwsNjBoCrwneAXtBWXpoexVIepiqmVSeVSccyNmjKWmnxEpKRukIeJQqGEzZQFsHCqozdoLpukRGaJfpiz",
	};
	return GBdWiAhFHSIqOnWmKAwvDo;
}

- (nonnull NSString *)PBGHTIbKSqqkNgQGSgs :(nonnull NSArray *)AYFRfwMICyqaiRI {
	NSString *OJqRLEnvqNpvwFXiZvvIqFb = @"jtcyYIKeyrHyLBNzwapHOqoIxfrpHowXcoJyXvtaGAwWvutCsROfFkkAJgfmWaTnqsQUaMHCSpeZPGThoKyfJXKGryYdvfpjhCqLZIvUKmZoMxcFHyDvdcmqVIwAEVeco";
	return OJqRLEnvqNpvwFXiZvvIqFb;
}

+ (nonnull UIImage *)ONjwbuGGHkedgZBtvxj :(nonnull NSString *)QcpvqXhuWxC :(nonnull NSString *)xQXPRPhRdntPCuIHFmh :(nonnull UIImage *)SsyaVHSMqxmnzFkZkoE :(nonnull NSString *)siidUXHGHbMq :(nonnull NSArray *)WCASpaGMQipDXBAFOXYOluP {
	NSData *vRBvtxzSoVlnNyTZKhmVsnUa = [@"pcpJiMHIYiTbGywZsusBIhOEUzeffdDUGWCzmWBXENcWVxOEmpXVMyHymMNmFkieJKAxqTbCqJOSVRVLBemGRrhThNCYQMgvnbIklfPgavhgrnkRwZOkBTnruGkFMmJTeBgtKiUyoOUnRIBGXw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MUbiKyZBDacJShd = [UIImage imageWithData:vRBvtxzSoVlnNyTZKhmVsnUa];
	MUbiKyZBDacJShd = [UIImage imageNamed:@"KzjaXpjJrGcMPvdICnKBgCzJZoKRpkQIQaZGiQkClywKRSXeonzSbuTjadpaCzeOoXMlkWnEsEOfaqmhvFJkbQgmxkwEtqrWQsBJfJINhEyAkBqrDqISENOkWsZtUlxfTWZLLiHmzZS"];
	return MUbiKyZBDacJShd;
}

- (nonnull NSArray *)CmgKxdMbDQvptuAPmR :(nonnull NSData *)LNRAWBELDaZ {
	NSArray *bHgMnHmdGIbszYVViD = @[
		@"pelgNbMQgUfLUZJLoYTnHgeSHzwcIsyTCVokhvTDehXpjKgoORFKuoNCKfHPaCgnpOemfmvWLRmagtFlymWozWJucRqGsQZaHNdePAcCohXRKQXkPaUOuEfpMGjjFToWEfNUeRBRIB",
		@"narLeMYMegAuKbJuvMAJbfhPOCtiUuZZFaTVSSGkJIxOmEcPhbCpqQErLzuTNWzBenCnVhGVXHjrSUzgstkghgTZpqBYhAkbSwlvbLRljWpZFvLHiStVxWgqmerqlYxspXOIgSgcRKTR",
		@"PsvQGFdrLlQAeGfDaoEcugiraVsnvFfiZDFyqAnSWrdEXvbXLpnTHblFPtUvrPSPfJwFZROGoYKnHDQxANGFQHUwqoDQPvbrWIpMpbzXHZnJtTMeEZhWMkUDhMiQXfmgRysBgSP",
		@"rNOnjKKRiMhESpXBdRefDAdMnEaQovhWZofsoIMWXwYxTXrKXFhxbUzBYBonTkgEaflQRcVrkUlyTkweCsHlGxjTLGfGYZlLyHeUWcCxaU",
		@"TRYCbgovkZhBFrNdlXjaPFTiYfpAhMUBFbZzXvKwvIXKEIJahAObfAerKPuiFMeHjwSUIDgBPYCbWNThVkYSljEKVpufqFLVshIlyYlQsnExGHEcBFObwZEyOYvlcLHqzsFgHQHlAGjWGNAIZixb",
		@"TjibuZjlIuXOIWWHENMQNGxfXaeBuzKSnIpztcfLcGaKNNRQPwzzyNSOkGwuxkEAWcuHkhcoggeYBZaLDvVsXhPUhCMEIyWrFzucNClnfPoRQEUseZolm",
		@"ZJfhmXhkjgUOWQdoPFBWBQDObWjQtWjDaBCCDOKQDgWnuwvFOowArlLnLnbmvsHTwaKRaXgPqasfnmBmXdQKaIvxSMESnciaUTyfitYztMkKA",
		@"DEhBgKNdIjiOlxyZwuAYbAgZDGZedBLIktcebhlwNRjmzmAMHsOaSOYZOzKAWhsGslVKpOBgqOfIhxuDTmtCLbCXgjhEEGdGWsyJGUzexmESbrZkFSvrRWcCNeS",
		@"EMRFmSWEfxQtWDZpognycVDYsHITKRKaRcNXOWtmDLqRFJkxHfGxUDqEmdukNveITfgAEmxCMrmGnkOsGcQsmbPuCEtZnsSLycfMKnvSNvHfVQaPKdFdfVAnRKJ",
		@"cIlPQAseoSeIPsKZiXXjCxlmkGGUJzaiJJncyRmrKQavOZLnjHMnFiGWfJwRqCNmyGUvogdHJGfnwWtNcOSIIsqiqZKiKzUAHwKtOGdNpqzAxFRVFRH",
		@"KOgKbcBYqOYcOImpakaEeGVBMrjDxCTVkjNixxhWTKRaBSSlzwvCVTtrGfdEpUmAbfCvPlqzlUJQBkFzGwJcxovgjsDVoOxiAYEzGhCBDVVLUpmUQHHQCpYxc",
	];
	return bHgMnHmdGIbszYVViD;
}

- (nonnull UIImage *)dzfSeOMoacjgd :(nonnull NSDictionary *)tWDxQOxoyu :(nonnull NSArray *)obUsxhFxGKHlZSwUCOqy {
	NSData *ZAeXcWmxdOF = [@"cEXkUOwJQqKjGXebzWQjhKTKZcimXyYayTbJVkHWeCLpBXiPRerEAMJLdQSBYFVJebVxJmYjpAEYBbcbVkfyttBVbzGKXbwAICHgh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HLaTDyCLsHRxoOWwNOo = [UIImage imageWithData:ZAeXcWmxdOF];
	HLaTDyCLsHRxoOWwNOo = [UIImage imageNamed:@"gPCRkIFnNhXosPmbedSrqVzlqElmsaynSAoyGUDoqtxtlhjmmIdDNZcKCdwNKgmEhZbxnJZKEFXlcYJXAjcDSbGcbkusCsuorfdGhfHmkzZ"];
	return HLaTDyCLsHRxoOWwNOo;
}

+ (nonnull NSDictionary *)GBSRhIAfPpcqZnESl :(nonnull NSString *)DdgmgbEPENMZFiVznC :(nonnull NSString *)CkAosPexpJtiuJY :(nonnull NSData *)bUBkYkrQVmzNiJWoAa :(nonnull NSString *)TNeLPLEtghYYbgPVF {
	NSDictionary *vZXLMETvJdwLrx = @{
		@"KjNpqDEppCkvcwHECvbAisjR": @"egejGQQtUUDrZmIaNGCJZiTvzfMrFdEzHSCYeKfLyEqsULiNZSfRmXzWZLmosmCDOXGWazJpCXgVMYBgoAQrcAmifJmrJdzEYAvRDoLiQpNiupKhlvPMxdANyTmYqmRUVIuPHjWEtVUEmgK",
		@"vaGGWvvsmd": @"dXaOIGaUIRgBljRVIyapdARXNeKymfpMEyBunWKDHxuWICSoEIXlNgLqdKKVAIfejzeSOJwheFTFDZHXPpfGnVBRUvYlUhbwDNJFmPPkNurXce",
		@"LPLcusfhqpLqMGdyVCHFThPn": @"THlTFIaqNGuZWEzfAXQNciWNoiNYAbKfDBIdYrjtwrjBfUVjiwVnLLwTbdFRpQzAYtJFGCJWWHKYZLwXjrEPUKPPehCzkwSJWvIDGicryg",
		@"SQcdgJfbFc": @"tYFZFoeyLIOdFPtFmedfdNtTydfWGOPvXUptbbTfRkqOzTHFKdlhlpyklUqqZvlGOrnxqlyXDAUDWqhtvmvmuQecEFCgxTiqvqfvcSWMuXGJGDHrFjighZBRjLEPfmDnaCCyfkHGmgVkQxekwUEa",
		@"iUgifzeAeYO": @"yulUPxOLoMqVCUyjUVHPDneFYPDLbZEeVpyKPaiGloRoALrgiraRlzDCPuPKvKpgnnNDcTQMrIHDMnvLLzeTdkKMIbYXGeibpekqbsTURygnNJDoq",
		@"TSCxXIaIFRceoGNeQdijLaU": @"swvEBBTQsDYhxWXPyRqpuMMHkbiHjIKnzNJqMweVSaAGRUavLhNilIZImSJlhpAxBQjSlblRycrAQzJktKTpRFJcERPejRugGLjMZYSJeeJmoHUEpVBtKOvREZXxdeoJySBzRt",
		@"BIbHDheEwAMMzLToqrcc": @"WmohwuuiOjJQPhWXaQpmcDFBKIwCAfvKtZDntbGFJueYAIUQHUXWyPWVAHBIJXkPIvqNgeQWkqqIxJMcKTVDMULvspPNtmAdpMKyfZiISnzhBiAWSpKXKWmXQSQzHhGZONauRl",
		@"outkHXiybcfIMUNBsVvI": @"urnKqXkfAVqwUpaOgteXPrkEkyRRPGbdHVPyqdRymfpSHMZwvWTZAOeNpobtvBMWRBwnntYYYWNIUvmujkTXDSCKngGqdnjAZdpjmzfNIWztfiwhXHjWGyartdrySAslCfBNwdvGzLwWFOoDXLHTD",
		@"ySHqDQpAssCmJyYmMFLTQtqq": @"TGFChcfXWFnGWSxXdwxbVaQKurRnWCzSNyvIjPdXyiOJxvcmKIxJlfdGBcEBjhlyTGPvrcfVyuoChlgsWtPUfQPwaNVtBHTSWuhLXWiITuEBgHRWRyeybal",
		@"IOvTJhFKYyHjRXKLhTIqjI": @"LXrrebqrKnzzCLaGGKJRcZFDoWVxwgURxnwvVVBFqkGeivhAlEpukYWrQUebzuICkkczavLAqQURJrGvSfguiBENVEzKMRFxswgHfunQG",
		@"tWybVmqEBEiQwwhdDDZ": @"VGfonKngzEFSZyaxZfCDoAbYMzJDQwcPKZPpucZSosQeswipvDPwNFptowqzusAOtlERmNQpdDmKLbUVsiZUhqldWksyEexKgSqnXpxDgSSdCrOSxsnzYS",
		@"asPXCTsfiLeu": @"TVlpedotTvlbCNaFfahZWitzGCycINbACFvGQWjIMAJFrGFwIGHqxkZrZPAiiEKoEldMRoVzyOXIZGKSZTUImHDEVaOliSVWConqEDUJHvkUuWMuQyPqPAr",
		@"HHercOSJvqv": @"wvHLAPibuOFfcZJijHjFDMqOsgarJmQGeOXFjoYFCjVYJizNiCSFdgccoOscvJBqLbZiuitLeBQoDimYxrtGaeLuYVMYAoLJtiyhSAKvIfbwLIzGqigSABJXXVoMVvCpREGUcRVc",
		@"HfURsIkSOdJoEPPHiIbag": @"hOzqkYomwIwMWKgRLTnhBSyIXRvCcHMAvNTVZZwCiIeEHLBHLOBuZvPycpXBdutscBRzOxiIaRyZINppYtdmkbMVKqyFTlENQtvLueqnLfsbUFQ",
		@"zcQnGrMqJt": @"RXOpMGlDTzfsdoBWLUjshiNjaMcGOkYJMVKULlTpWJpoNEaZtTJoeNhASFCygNLlMPYwTbwdgXSBiPUXeKBMblkGngEOURUlltYnToimmxiNntAXlUxnQghisyWEuIvcMCGNVwHHRuFUK",
		@"aNusIHWuYH": @"jjDDXLidbdkIoASlTkaLAJMjbBibdkXUHLMjdGbntHkXnzBdieDFKQuThESBYjXhCvtPUlkUARkhdZxlXMXFVvWYkguOAENyagnrNBdnqPDpXgOAipLySOtLulARwCOvjxcRBuzmYnmruSqNscyld",
		@"iOMXvMkGbtpmTIv": @"YmfPAyiAoMvXlsandxTBqUxvdNKLSeLqaVUJSHeJfSRQPsbrrrSHvkyHvPfQShkFVnJLqqoBefHMXDcKduwDakbxblToksqlBnTfWZqDwUrekNcFhEwoxoLOlPbbNImvt",
		@"RWxByepJnPqLaqu": @"ZQDdNFttAgWPOwMUDTdAaIFHgVkKYysAvbFFKQexPrRtUvfZlwHqMQwIQuSPhACgCXGtIpKXIZoDWnWEgvYIdHEOYaBSzKxUkugpbecGeyIysaM",
	};
	return vZXLMETvJdwLrx;
}

- (nonnull NSDictionary *)kCwVBrSxzV :(nonnull NSDictionary *)hFUibxORrXgYkMC :(nonnull NSString *)hcssZkVkheabhXENHUK :(nonnull NSString *)SzOGKiUShXc :(nonnull NSString *)gDIkxqWMFMU {
	NSDictionary *blZliQxqPlmAOA = @{
		@"xBfAeddwdGXxVUrBOE": @"rKjtHFOKPIlzwdkQttrjbHHrNccDVmKuXAEGBiidPpwyRxSMqJdGsxXhFmhBFEqKBYUWueNTaIlPjcKFvmmvxMbEEYpMzmMsKywRaYEecqNDnZnmUOZsOAEocMSPRtB",
		@"BkmcsVbpHEhliTFusA": @"nkAGnlwclljZWRrlnsRlVRpbpcniAikTWLPOGjzmbLUTPotEotphzoMXvdMhOGIiQAAvGrFLoPGYhtcsaPuQBdxdQOzaBoAGhxejLenbluxnugVVVc",
		@"LuPjQcqzEOHDVPsOdu": @"kHVZopSxVzZQHFHeqbYhnQgNXGWaraFhkRfkeFjutZxjKhEtYVZYzEwANshvviFCznsljkFFleAPMEbTiOuSJalyNHcDmvaEJxJCtaKnqFImGge",
		@"seByHKsLhXetAXydXMux": @"ATxjBxGqmxwHVZyPHsuaMZafvMvPmgBceHqsPzABSjnqEubBSqWICMhiDrrbtjniHGLunVMoPZZYdoMCQywgAzjOxOnKBFWcIXKxjOSkg",
		@"MYCWqHZbYfQjYHeVcbYQIW": @"GeSskXTUrSApzIOwnQPKvPXOOnXGSmzlZcitBugEVDmRuANzFJnIJzeyQjoBEEPnWLZmHhwOuOgIdZJMivMkmFRqwUgcyhoHKNYPRpfRdpBsdWDdfShMQJsntWhqAEejsgDcxVnHcPbNKAbrxoEGi",
		@"OOTnHCzUaNytMec": @"GdekZskXISiecZmqyYuriPEGFbyqrlJpogeSnOQlYsbfffIurfnXDGxXGNBiYrGVzKjcsMgKmoPKpmgtOAjjnAAlqTundWAzEIFkPNpfC",
		@"hKhlUtXPUbcGypTHXZJv": @"YxAykhNgHnmkkLrbhKWHAXCzxAavYOBQdFooKpwvSiseBvhASCFgnPGsUcQQuZAwhAqvRPTrtOCjmhhbowwADrWygRgkxqDcPdoRlRtatgRWjfQdieKXLXLoFp",
		@"HLEpNmQaGVyuMPlOm": @"aVeuCMlGvryNAMOuCAiarZVTAJmHeFqPGKdmKCeUEKDbyjadNMAsTWpsNfdqvAgcNWYWjjBJtzrhowGLeMWeIWJFSnHUFzibeelfnTWwbVHNNZeScZLAJRmMZKT",
		@"DZEYzIupByCZpRfAnLeNVB": @"sBhuDozBLlNiqtOxiKHSdjLrDSDbbjTiRhyBlePybQkQumAwheuejwaYxFWMyGeQMIzgeZHvNGYdKWeOklNbzImrfwhDpxCrXekdNMzh",
		@"bVxzsZkdtQUgMxyMRKNx": @"ziqZhxHAPtUcngFVKfbBZKPdeMtnDSDKLCSdILVZDUXKjbGmJcRWcYxZRmpqhnzhvUAYLBOgcEbkYAegdPeVezxUPgUgcvjSaVUGoyvsEYwNZcPOdXRwAMclGjSLKAGBPknT",
	};
	return blZliQxqPlmAOA;
}

- (nonnull NSData *)AkEcHcjFiS :(nonnull NSData *)hykJadSJYcFWYabQoEpI :(nonnull NSString *)FrbXQeYiWF {
	NSData *zWJNTYpPcPwRtRDH = [@"tqviyhtTtFWsSuyNOUsdOvwXfPNhGOboHNvBSOITaXCeMRlPtIgNaHJKaScXMJVRAkulDfHAXpZxhXWxhzLMHVDqIxldpZSufFvgfbgugPklOkuaQSBqvGexIRVvQFOByhyOyGpDzR" dataUsingEncoding:NSUTF8StringEncoding];
	return zWJNTYpPcPwRtRDH;
}

+ (nonnull NSArray *)aoxYxzfSYz :(nonnull NSString *)CxxnDhagbvZUTAaVlQ :(nonnull UIImage *)bULzWKtgIdeZkUcy :(nonnull NSArray *)mxBQsDbnhevHncGkic :(nonnull NSDictionary *)gLykSIRygrtoanLHdit {
	NSArray *ZtfeSuOxadOIaqbHVr = @[
		@"JEjMcrHBZOjUPpcfYoYCPJZFnoDvlXdbycgRWESBMkchjNWPHATHVGpazoQvybrLZlgmAXqSudmWiyVbxDOSmzuOqftiTzSNUDWtaGAHrypFkulXKdnXsWttxvSWgCSSGKdTsglYa",
		@"gZGwzhPZvVMlwXPoPCrSCYnmqconaiFsPBkOhfZmlwvXnEknouoilMKLNOnEvvATbCZuhFhgtELcCiIaQSCxUfMkSCpNKldRCJsZoPghwRFTdlBukSKmaDPPglHCpFbTDeDLbQmEE",
		@"ahRcMcUfVpksreHYnVTNemawSDvBaOMusXUNyCTgPmACyFlsYwhtGaPQJUpQYcYKguMDbhrNoLqSnNhVjMiFLxauUNgeCsvNsiUA",
		@"hdtDoRRMYXlCTZuTVcrklyzxBbXUJFVbFdKbLntIVsqgSHGTMoOEngEqnNfQbSrTgjQpimaGQOyJHvczKJhoXHHFhceHwQdRTirxfkwvJVZ",
		@"XAkoNeVawfjvdNjNtjuTiDEyreFFozlbzBSsudVbdZNAyZGwReFkLvnGyzMWYoyLcxWgckBpLULGfKcLOOKnMFrdOneXvFyeOOPlTYqKZozqWfpmbTfiWiHjElglpQKH",
		@"tybZdypLnaVfJGLbhFnYUyOJhdTomXxnbceMGwvXwXWtZofmEHIIzNNPYnzJDhNkcunNwrpZZqFXliUvemrLDwtffHGmbQmPtWLIClDkBzWLsCIwvxgDdfGVwoyLBHfPoFvTlJwPFmdLczi",
		@"UIfLswIqskYErSVPdjUkeTimrYjFMOkUDnZysJhRQEgbllSSngULcOrBzLMWMtwqjcsyzHXSwgUasPELaTuHpZzznrAefHwztmngGXfkzVeNCbj",
		@"OBuqiCMNmDcxqhnSHOzJGfztiOPEMoRlFzeFRkmGSENtixqvAskFEdAmdELsdeFjKMVUrjHRxIkcksKnnObxTSkPZYYmcQXUAngoWhSJnTVxxzAKlUVRUhLBdBFZzEfC",
		@"TwNmpZgVysaVXxHkHmHBHAbIuuwPPQNqRZMShjaJkhDsRndntglQcxItOxMtEOveWPuWUrRdvjcZjTEDopmpXlJJAxmuxOqCcipjwPBtZYwypacTmTtIWFQGAxiETbCTGqbsFLoPpfBKGY",
		@"ZhxqROIqZzrWhUZDonatmnxnvMXVPYiVmLRepeMCBupUfhgNydjSEoNaAXNWsGmPVoDhksZFYqYvNcclCFVTQdcAgaDododJYjYucXAd",
		@"JBRodJepZrzqdEETuQNWvLYCYyNaoHTUpTPNNGueFoNMjwrXIvUEkhwLxYpfCZAAwJTsIkKUfKtFZkVGRkMdsNVoWLHtFQxUulzyVfgEhkbrZZxClSmYkFOJZRTQwEcLFGWVqMwlWsjGN",
		@"yEXcjmQCqmTHeDsAbmzZntXxiNjFTPKUnmAdEESqWLeNieRcRAUMYNxDUbDupMPgncxCfTqyYtbRfUyDwvVfGJSzDxCWRIZlfXwobDXMHCrYYsNqDVVuKLJuzVFliXyogbdqcbJKJMFbbHgZq",
		@"MotsTiXFtXOnncaODCuGkjXPsGqYklzbixvXGvpZYruSWyiTMfklOsVdigrZJIWomohTpvuPPWYKdYOyVaAHbnDAYuWdVSvGpStNwrPtUOoJvVWwOPykbyKw",
		@"QeJJIOgJXAJHLRHomkSZnxsVIDbwPlzXuOZUhabGbYIxDvNkPVtKreTTYZQCNxlspwdWgjxvnssjJaaEsDkarGeBVSjrnIOOChNzdhuXMKnFaXKsGRnvP",
		@"SrSiNaDOVlAnrGkLthlrSpfYNQDUaUelrahEhKnwTvNwaQSUXNGzXYkkHOdJbJEAQRdkSBplVGELpKZqVgfYKvGamXzXMRdBNvpCKnkDFsKBViXk",
		@"KPQcopizlvxmcYSydsjoLxOUgwBreaOUCFBAMndDGFccEXSzAyvsJBerThpesLqrABIDppuyezOtOoYzmRAmYrXqtnSbzCZyGbTISSERRMzAmjSWpnZkZNCTxIPOElJe",
		@"zQJfPvjZZblySkKOEKxlsGSppgLwrjypiIBbAYEXldysAwnZzSOhwWOcKcUeWOCwbHwxUfriimbkqTtjrPYAxYHEcrflDGdWkNsp",
		@"DQTQukWdQQSazrRjoVjZLJOvvFMjvBHmgxSxIbEoRQnxxanlEngNWSNuBYEwGyBPZMhxemPeUeNcGtwUEdsjpCEyQbxmVRBpjLBKbvdQerQmnLaZVIriSOFtfnEtRWeeXQ",
	];
	return ZtfeSuOxadOIaqbHVr;
}

+ (nonnull NSDictionary *)LRmjNKFAMwtjauzzTSFp :(nonnull NSString *)JYcQmmoSYTflveTZHD {
	NSDictionary *lRUcDbGCFEOnD = @{
		@"DiIICqetocqJRadxnzwwbzFJ": @"DwkwFboyPAMSixVbyNgEaYGGyGCsCRzBXofsZqFLKIpUOHJErBPHxqmXYoNYwbqqgqEUPtFoWiARIRduJAgzPQdffjzbvHREdEBOZFnzWQPJBeaBEPYux",
		@"BvPYNxJsHq": @"yStfMfAAVKJzxLiHNbfmSBHCrPclilaCvtNTIfIsTNoDlyYbIwFUHzFJNDCClfvUvIwkFiDvpVxejIJhlYohltAEGJqEZYZUnqhagqTHFuYrWZyRTEQMeUeHItqQPjXQLsdWveEMDFHQMPVAR",
		@"VkIiDiwZOWuR": @"neWgSNdgfBiPnDtUZhhRiVjLJBDiDFCUqbUILOyuRsXUkGrEiXyGHqNxKKoAliNzBjyrKGfrCFmvQHiDnoJPIDQwBEJIomydvbktqrATzkYVSgoCnrAkDZSHOGocJ",
		@"lmvhgXipQGHRkNUqnXbJ": @"OgvCujfJvvGBAzOUzzNwzKAHzcxiIPHcBsXpzmCYkkpXEZfKcbyBrGuiVEQlcstpcFTwrXudogDYWkbBbZxbMvlPUUCbEMtSGIsIjnPMF",
		@"HOlfHhDRGVItoPHpM": @"CCNenMCgKGHSCDeruiLyzliHabrXUkxUpICGDGyPKLgsbtguECVywaHRIGfKGVCGdsmVkSLamBmfgHZrIpUBNJFzKuyKCjQVyNUpwXIEcFSUfooxKVRwXUXSbsthjLUoPwMLaVdjqZPh",
		@"tBVGUXKerJ": @"RoYwnlppDBAGLnvSoWRVwQGyyvLGxStNxpIOdvtgPozyJNhpNxXTaxXbkbdpgIkEoMyOFesSMFqLvzFZvOxwJIUKbLkXIGkOyxTQDxXOicLemiFJfcwSNiI",
		@"jbEDsFYZnaSfPXisSE": @"aSnVQqDwefeqerRZuOqakuGzNfNvFtrXusLofUyWsAhDxOCaeWgNZNyPOPCwczXNPcKpwFpQzvRdtIRNhBeCGRjheydYHYLXkvmyBOurkgTuVrunQRCOyZkAfY",
		@"oQmydwQbopqlKXIN": @"KlpttDJlrzHWJoMExbIRANfQmBXIArPBuYTwrUzotIovfeZtlKlRNScNuEjDOXEkTEdLgVkYGqrXTXlNDMajmSpWdcbhmsllVhRUpYWfjPDRWwcUreBdPVBhTkvs",
		@"HkgyReSfrIZUOVPyxaJlT": @"QipQlkEngUvzSxVOJEgkRFDGRuyRMOTqOjKkyFCeXeaNfCxaHXppIPbebyIDQyqUtDsFFBuMVmZarVNMlGlGlLXCrSrqPLXliSQoLNavWpsZEKnsvg",
		@"hZADJxtctsYmm": @"SeZSmkruTXIePPEAXGKKHWFbWttaVJXzHWuLDXezIdOMHXWWlZrzEntDbHmXFyMezSNXenoJWAMySJKifbYkAcxAamNULpsfjTnFekcCLpsaJVs",
		@"fysQSPdZvVyjTughWo": @"xgrCOeHfOzGeidhTaEIWWkGwgGmZvcbuaHVWKgdgHhgaqBGPYtSlGFoEkUqGKATABMfipCDnICwOrMkqibkwGJZocvOtjDcneKvaYLTylGygoxbmdOrbbBmTuTCCholEUQhLHDZwPWKUIAKfS",
		@"eWtcJpBGdpmlAnzp": @"aVTcFNzNkpvHJhGIbtuUWhCGzLumxgccUehxMtuYYSrMpiCLzbTnpuYetRJsRSfJEyiJgthidsxjOqHUixewCtoAdbgiPXfzvJvTOvlBLgkCRhKNPofxZZiGkgZPFSkPK",
		@"VhCmyPdGNfvnYYKm": @"uxgLnFTsumURrvPZjktQrtejFKffwhSJNmdiIPPGhvRCZLLupOyzNeMmWZEJdObRvNSuuRjAIvrSYWPVOxXENXelMCIOnjnjmjxPWqvwpXtoZLYQcI",
		@"YjHJRZBMivXhQoHZSt": @"KMKkTmQlHGBzCOlgQwHidrfaxOwNgfgMjQwTEIeuJVZNvAlrMBYlzuxlZVxfckNFOoOcvcQJYaMtIDSBCUMfZaXOVpboTUZqCkFjzYJNfqarrSARUukbTugszOnoIHCqzTCPBSXa",
		@"aWxcqbbqKg": @"INAcXNFiHCrdcAmVdHfmeXxXKuEiWOsFqzLTvPDKgUYvCfeujCKDhpWzCCFbCEdBeCUGdSQzgptYeVbtGrilainUFAGKiXOWiFcFanLGBXXtuuuGhFLIesyNZY",
		@"WGELoGqBAeDaUBLF": @"GBuijmXNcvgDxZRRhJqXbjmZoYJJMmrSbqaxhUDYeTNMkCQhdldpWQvVouKqhhmzFRGeDDCGYtAizymgnLtEWlspTKiRfOrVAwxFJTZXsdUSgszME",
	};
	return lRUcDbGCFEOnD;
}

+ (nonnull NSData *)aqZABvRmoqmViWLGiz :(nonnull NSDictionary *)EJNwhiPmCRROHjiLHvE {
	NSData *KsfibIwwoAyQhPc = [@"AJenKEePRfQOyxGwGSiUAnzLnsEshkjBUjLGIXGbBuyTVxtXWwDGzXYEkOLKGvuSuQqemdMLNgAFvjtttbllnaRIpCRpzTLiUKvpczLynhLPFqaPXMhLEcsJXbMeYfNslIIujJMxPXhxWxY" dataUsingEncoding:NSUTF8StringEncoding];
	return KsfibIwwoAyQhPc;
}

- (nonnull NSData *)UvKNWHrJOiGHBsMccx :(nonnull NSArray *)rVdKSFRuYpwjCRTtMITTm :(nonnull NSDictionary *)NPTGkyzfCX :(nonnull NSData *)KfqXWhiZoc :(nonnull NSArray *)RzLsCSUxtCBN {
	NSData *IQAOlcVimmCCA = [@"ztXAFOETCEYTEBybrpCjvlZiCeRBjHwzFZdjhLMRJhtBtTzFfnnPRsgnepJCLnSmZkicuhguudDPCevCEHAVltaVvzkeLlIRUtpuTCZZHvhOLbNDacTiyrDzTfXYvmkCJEYswMdYKll" dataUsingEncoding:NSUTF8StringEncoding];
	return IQAOlcVimmCCA;
}

+ (nonnull NSDictionary *)ivTZeguTWHEWacd :(nonnull UIImage *)jAUYuDcbpRvgpcINWcY :(nonnull NSString *)KAHUZWIViAcSlClBoclcH :(nonnull NSDictionary *)PJgfuineUVsYJ {
	NSDictionary *TErbECFBnSrVAlYrqeLj = @{
		@"OWXusPTdVWuFMtAFYpnrfb": @"uYSlloIZuJcWmFLCaOXekZPbJtjJgBBjKsQlNebBeYNmkbjlkpGOrMMXvOneuxHKIJyRogzfwNxUUjEJQtBoELOktxAsEcFJEypacgbHQOVsFUbCTSMtGVqpsiMBCjxIXfnUYvqUjeolPoa",
		@"rKuTZBwTkagYx": @"EfrVMDbHsCkiNJVKdzJEWzlGElBfhBdTEaWtMAVqzRdadscVHCOCPuwjHGjscdRSNzxzLVaifwVlPUaiLwhQkKXRcXwrkKyssYXsXQlqhxKqhhB",
		@"igxWzqajjSDdoJGe": @"kLFVdrAXARskNdiwWBRKdYbsejOhhXIxfMbaFukSIgFMdlEgGAhKdpaBllbzOyNLyhxYHqJORyNSObMfiqykWPOuJYraIUTWpkNNgcbgocvlCKjnxuMzm",
		@"QPhBZiXkEBynvFUN": @"sRsxmZHOvIKSKSKfJmRKDAgAUMwTAdxgWaNlvbfzPjFjoHaRgmYgWNZOKNEVYaWjVIMuvTIXEeDbKGRTjfvsOssAXopjTtEqClVgnnlLzfmChhgBPnBiAJfvyyj",
		@"ZPcOGQYCxBonppkWrCCbFf": @"VWdIbAozQYAhxOIVCWBEXpmXRiKbyiVtaAbubMFAjndCiDsozOSCruWKlxlhJssLNEDWVpceaoxAxAhiFwFgUZbDsHKZdRMNRtZldfnTvHhxgWPAYKcDICpQjslhKzFLuc",
		@"IHOCKhZlJVDArmrjmhpJMAeI": @"CBUzMDqASuKPutyzDRNsTNksvfCmXPLSTIeZQNMeeGRfBbGnaElxvBuBulvtdlkHbMXavNvlagXplhOhCZAOxUQAmqDYizUPgqinc",
		@"ToHbbITDAELfisWObN": @"IQciaRGOsCcEgAIjBmrRLBjyjIAgCJrnNkCMVhYIgqoiJJZbVBolqVDfgdyGoshYTgWLsungeuSUhSyqYlzgJFpmkknMJZYsMgEl",
		@"TkCPWisRcNhLTUkfAEhkhMIO": @"AkcYoMGEmyohqWIWBKzXOrLYgsLSGuyxfbcOIVqHNfkoZlNbMuGzSemJMVbKywEJQYHzUvRrGRxrmuoBqTRXSwDfAmYtpPulbuRGleiERYrkTfDjARNoXOfclc",
		@"ZAiNEqYUyIph": @"akPSAhvvIEuvyqpzYsJRWGRUJmeqxoNadqINGeQuewMZSmVHVkWFzahiZpTVOLXGTejQNzovenqXftGxnLkANFkIgpDYamdXZJotBnXjQEUpJLWIYmKqfUyQnQNhrsjuOUAKBEdPHZPdKQOVwY",
		@"nsPMRyziORaGWgAlqSCxq": @"IGUNgmBBKEIfWqKRsmXbdPzSJmsEIdEYwbttSsZiIZJzoWTgqbGpYULkvbKIcHAzLbQUAkXewtoAYhppAEjcVUvNxRqoSehxJfgVwcPBWJEqSXYhmAxmEMFhRNpaVUSXxPcKqbRMKKF",
		@"CprsyqUYHBwnOQKRKKicFFe": @"owxOfQONfVdrPWnqwIyuXkYjHttVBQcszOFUvjxDocqQWjYkFWstcXmLazyQEkwAMuyhxkUVLmSmpaRwlKbDMnOkKKTlgXANQzdeIomkosFSIbMuxMXCBJiphWwHhSvs",
		@"oqXBxXjIQfEnjcjKFuIYP": @"VGGusKgaJcdZLUXzRfaHnrFtysCQeNDhoUazWEZKQRJvXPJLKZwSqPudtbjPnDQwKjjrYnMUMjrVaTGYQCWkikvpQiCVBbyekEJhSDlFVUbyFhJItNBANsCOePwbyySPwtzxXCSUHomenQjtE",
		@"ORFAWEThXlVZUDkTpp": @"RnUorRkhjZDJfIDuNVmWQkoYKPqIgvZUHNHrwAXbeofxFBWayAOPXHUdRROXeRhokjJPcOhParWghtyNacaPXpYnMHvWTiuAlLUkPLUEcHZiihprbInvEh",
		@"PLooLqoyZGptfJsaP": @"QjRhXNtLtZJyAPKXwmqQsXTRKiRVKcrIJCFcJVVWLEAeDQwOgUOHsZaAKGxYPgLZZUSVVbPKUpwooWEFEQmUrdJDWGVdfMRrWFInTWLtKvNqEqRRLjVfXyLDSTaEDawNO",
		@"kDtzINlQWvsFTKSLEbRvp": @"QUtBCbrDSRgJvamXDwCHfBeyfmwFHnYfQqOSQvDiyJfCEtLmTLbxtuNvvWNEluyomkCFYozmtmjKxFtCcXOWqCIljHtljXGRxEQimQegOKqbvcgDuDriqOOemrVHNrXyVIRGLXNisCfXsvi",
		@"QFrALzqGYLbslqquye": @"VZORNQJjXpoRxoIoixxzdgakLhPzKMAXpfKzlVRvRHbfeETUqROTyCYquLmKUlWEuknnumaZHAjAlUxmfwAxaqMuSUVTqUnMKyEDsMeMfzuSUgjKoTWxc",
	};
	return TErbECFBnSrVAlYrqeLj;
}

- (nonnull NSData *)oaNaydppkHLdG :(nonnull NSData *)FSHPWGQCCSZ :(nonnull NSDictionary *)TCcHQeMPPmpj :(nonnull NSData *)BlTcIbxhbkzGOfgg :(nonnull NSDictionary *)UphJhVyIzu {
	NSData *WheBbJxVBuxcM = [@"NLDYRPVVbDOuEscVrZPtFydEhoCUIIYBsqozZjMDlMRomrrCwEjVBAyJkdqAFYpcULgRlyZcmzLGarfHcjgAYpJIeMqhmVpOwgrsnBZBPxkHa" dataUsingEncoding:NSUTF8StringEncoding];
	return WheBbJxVBuxcM;
}

- (nonnull NSData *)VKgBIAJLWphPoAXhLUxkoc :(nonnull UIImage *)gVRXQBnTdYkqAvECCbFRB :(nonnull NSDictionary *)LvMUfgcxrQNXHWjTiAjzE :(nonnull UIImage *)wnodslTVGc :(nonnull UIImage *)zicjuDyvBJjQhVo :(nonnull NSString *)rrsRELQtonmK {
	NSData *zyVXKWWDUNCZu = [@"alxjVaFCMRFGvJlFewIuwtZKiHzsnrhjRewGnjjtnkTTcnhPbGhVxyKoeBfKVKZnJQmzdOUguxyzgObYpqJjyaNotfFALXhiMEydsTQQILvFBTqIlEqOeyXnMhZANGxvmrWzkV" dataUsingEncoding:NSUTF8StringEncoding];
	return zyVXKWWDUNCZu;
}

- (nonnull UIImage *)pXwISigIvBAMZWrhowl :(nonnull UIImage *)FrlgYefGqSh {
	NSData *qlaSovMkRjpNSTjuIaDUgS = [@"gnDWLIZVjsBsmMpApbeOqlurfDsBwftWGApoXIxlhudhhckrvuHvRBvQZHdjwmvccKrTcUNSVRmYYkhbhaKYftgiVAASFuusuPhvnWPWbURjFaECHvRRAKAZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hyNwNdhjiaUxq = [UIImage imageWithData:qlaSovMkRjpNSTjuIaDUgS];
	hyNwNdhjiaUxq = [UIImage imageNamed:@"fLoEQRsmSpCcRmwSJcXEtJlhsstbGnfcmGsQwgzaIyXRhDguXwtZfAWeAufcvsJykbQFcXodsyQZBNFEcsZbrjbliAGBZSsxEkBEWlsRjGDjf"];
	return hyNwNdhjiaUxq;
}

- (nonnull NSArray *)LHfWtSEusZYjp :(nonnull UIImage *)lyWyProAcjOJGlcGnayut :(nonnull NSString *)wPTeHkiIGAMBHTCvF :(nonnull NSDictionary *)ggPZUywqJGBZn :(nonnull NSArray *)RNgUXOCXmdZTIpsJsJWvWYf {
	NSArray *pThTsZfOXZWCRQQjSUpwTP = @[
		@"zhIYzYcZvGIvZQjZOLLHpKvPLkPGKGvxcPMVmTaPGwYuZbPNdgfahQSOJKDflXFxBzqemNrJMwmoafEMJYgLOsFEUDdRynNtFFXdnRqSsXnJprKyiycEhZzpQVouCPFDqjUsHvlAdBbXhvTo",
		@"hfzyvigzcxmaIrRMxewFbwLgowUKErcCPsymbNjNNxpQTKvxboWtyDFuyKWMIWVbMXZQHArbOsSrgFpwZkSDUmmuxsUOhZFRNmRpFvMfeQBGAzGxHNDz",
		@"frnEKnqHRfDjjccmMffNSrUQxXmsxabIQSCxvHvRGOTSaQABAbDZvPFEnqWhsNIMiLTbhHgDzraHapJlLDglcnvRkqEPVCZqKaaMxZcaFAZreftfVfgMMhYaLhHTnzpzPurfhxLfuOym",
		@"FsyWoTAjesbqaOPrPVxAjEhuuLWOYznjRZgsvywqZpioXmfEPQtTpHMbysmFiQzxeqjoyVitBuxXsqOGyUmejtXaupAfxMhXzWTqozibCun",
		@"yRZWfVptBzUQzPBaXIbLHaHVdAGmcxRcfQyfijSxUVwTnHDDZtlEYxCZSqKELNmjNeaCoLoqYdNeSpzzQXKsnQFpJDMnfhteyrEuyewDUNFsGIaRq",
		@"xNISMwoUWeouSpvBolOQetxfvqURVDkRoivVKMQJTEShIeiUsERUUgGVsLGoirCeExhbTlEDBrzbtAjaOzPLMpPvKvYckcqnIPhUm",
		@"WRrUlFpktuOXpOJxicbXUveDvpGrXDiTmQuyzcJpaDdIRwfjnZTylSMCoFlneNjbOnyxjyVwowzuXCnFpPZoTCpLLTrKyGbSssbtYwQWcg",
		@"iCDpqZtJUxIVHsSnvRlrPVtDeCjseHnMmfZoqutVlligvKFDaOqcComFwRuAACJcqtpAhBWyxoivibCRQsjSMvsVzdxpIsNSXFSJWsMpDDkSMwTZWWHrEQZfjZWkOzzUKnecLeudAFASSCZ",
		@"SailczjrLyIpyzeWlvfsTrElDcBxUKFVjzojGkvYPuDEFwWKUcHEjhhAOXYLVeuAMFPVxJWEoZDyHQZDNOWONTCbowGDfufNpPYSDtDJMEJUpKlOuArzYMuNqnnqoYKC",
		@"NLxeeNbbvyBzvINKrfIVdmchUHReRucSkXeerxyMLVqymIwrOzUDXYfxehTlLgoSifQaKnxNFNXFrkWrNKAhKooIpAeCFaDQJTicjianjDRxUxrZZQSmjmNPOkCizakZxQYSZkGmNUXIpD",
		@"gCsKrbcCqjpOfSpgkJlcfizdUAKhAxlRXJbPAxpaOmebMqhJdJHslcxvyiYrNBmNDpTDmbvwfZEjKXlPvLFaREIszqKtQCUKMjUqayliswkphkUvMcsRarjaWeMtEVbXNAFdsrElERqUVsMI",
		@"hvCuAWJgOIwjWcAKpjZtvhoLjINTkRCZiqvEYqsAMqNPHcxZSbYMSALnopiatHvvFUpykjhZpoiBvarsINNtpfkxWLiGqcEgcIbpWzoDTOQrsRaTIofcHeUOAptsCvQAyTCvdWKZMUxWPVvG",
	];
	return pThTsZfOXZWCRQQjSUpwTP;
}

+ (nonnull NSArray *)CFbspTgZhOColWYLYANzKk :(nonnull NSData *)jVIzouGiZgyXBYWWKSbFcL :(nonnull NSArray *)zQRzQVTTqXWw {
	NSArray *DToeNhnDNAzLhLTgOk = @[
		@"OZHxUjMNJjDiHiEPwUaAcuDlxXWSkZYBteXUHkxWWwvyjMysNohpsqTBYdtBGMDIKOKrPTwVYsmWkyADfCFwLZmtaLXcmQOvKbzowJxuisaCMgxjVUCXXXLbtJhJgFqG",
		@"tDzyWUFLDWHwUJvzJllYKHxGXYVCqXdXnjBgXuctArbXIjyFXKXcGZYMbEQdacQPTMoIOcWYUGHfokRSccwsvpimBTKMzmHGTBGssCvBJEnnwBGShAJHJTKaDKU",
		@"pILhWLJHCEZsPLOabQIkEGveByyjxuTOjxnQmkKUqDFSqqiJUWQbxUwxXAfkFoTpQkmpyCcJKHYLyfbwikpdObnJwHTHbglITZFaciRmEz",
		@"GLbJzzqRGaFcPtIBmzRqCqPAgNdBmyhzTgNiaCFWrheKokwWZbpUaICXizIqFdflGtNBlOdbCaNZabMdnYHxrmmrUZsTyTsGJRcVRosaLBHKsUSokpGjAMiGCuNYVlAQXgoCy",
		@"ZryeojcDDjXpyYmfHyqvfwPkiJzoUewaMfFBuQjVVWfmocJqwVLKzQzSgGWbUFkdiVqIXtoKPwhzDLVzWpLdiAPWjMtXtEYYJZMeUslsxHJeLcsiBZhZYpUdTRXKwOXGrBYfOc",
		@"XhgmYAYXyhTNDwgjPGbdpuuDhGvGSowQKxDmJFkKnsxijbuxVNzYixrRFBAfBMnQSVFPWVarfiBpZwpGbefMFsqOrpXAHfJuwfZLoLNZOhQVASvfPdoKTdesCRtNY",
		@"mCEfaGrHERMPRrDJdPtASTQqtChDwnYkWzfKCXZJfnqqtikWOcsMCrVqssgNtIyrFaflIkqHedegezIICzoakqEsnwxHMJwpqqoimDN",
		@"tcPeSNPrntdFTlRWivHHiodCWfbIqBFdaXijkUZdfvpKCRkRKAWtZefxBSiMJonFoYVVdmcUMGUIxAfbbZgNBuNmpuuAtMSJfAaqqEugrzddxesDcjipEjIPnXfU",
		@"sIdafeNCOyjKrHrGtZxBuKgrULWJSfmgzBVjOKwmlRZLIHaiYSlyIPmTowCoRRnNhdQZozHPchhARVsOpjUKxoRapsDTzlZRiIDbphqPHAvdDsnwtCHKqeCAqHYMrS",
		@"zDSAgPzqOxCpsOwKcvVYsRZAArRZPPCMetysLdfAZRZHAcNlmEiFuMTrFlXnPsPKTUhqgzHNvBUagGktwSXdRksYYpTICzSOsOYPAtqPhMLVJcAPNkqPDsjnyOQWUfbP",
		@"vftgXKzwTRNPlaUqKxXrDUacjpewfWcLCxYrAeWqkgLxdasQdepzjFPLjgdGBApkcSRyhKpgaMyMtvxbVLqrCZBqFUHyxVcQqphRIeSuTQVDLZOQhfDeLnObDFESdw",
		@"fcveMotqXuKeldCcWSFFhpthibhIYDuWiSvHUBbblguGAkYZiZhozBgsUksBDKsiXdxPOCrVlFdEFxwrpnVsaXJhTmQcpxCjycfJYMmOUagRvWhijhxdCRoGjYRcWolIablHNWx",
		@"pHlnaCavmCCNSEcPOzuPkbqroehIYrpCxuVveZSGtyywcuSFFHdwLJyXUpNnfotfWkEoqAYBNoKsijoKrfpVLnPCvEavHNvZPRUREfzPzDrZcjEbAWicbHTTGUvheHjbT",
	];
	return DToeNhnDNAzLhLTgOk;
}

- (nonnull NSData *)oyEEGMSKjJyBmSkhBqAupil :(nonnull NSDictionary *)apgqOnyzIoXOV :(nonnull NSArray *)qSofhIgJSFsRa :(nonnull NSDictionary *)wNXKsOSMMRv :(nonnull UIImage *)JCqBetGXBAPGLXbLNwdi {
	NSData *SSFaAOiNbPgUtSjtXAeMkNv = [@"kooULeeXPKhPFKssqVwBMeLnSxWwSekXeWwwasxmwRqBlVQMIMirSUrLEHNtNWUQbLSVjnxRqcuiPNyHfJERuGsYYaVvYPBWjtPZHTSaamXheMbIuNneWPDAPQObzRLywDSlIidoMHIakMrCNijun" dataUsingEncoding:NSUTF8StringEncoding];
	return SSFaAOiNbPgUtSjtXAeMkNv;
}

- (nonnull NSString *)axwQtfNzQSqwPexMA :(nonnull NSData *)ekwHJubFVpTZIOtwYweynStc :(nonnull NSDictionary *)golCyrDujF :(nonnull UIImage *)ClSoYcEsRiHgjv :(nonnull NSArray *)wygEmokKtihkTeRFakiK :(nonnull NSString *)zKXWLBpaiScgcSi {
	NSString *FmaxCVNIIRnzUvIaLY = @"VGejEuuHitEbHTfCXmhcxggVbhAreOxeHECTtzkVJTJfVyOdoazxRmYJYxvwQXKCzesaXFdMjjfreffrBNHZVIVaBuwqXwjKmWZTEssPKGYvhAKYftUwzMXXTpulVGDv";
	return FmaxCVNIIRnzUvIaLY;
}

- (nonnull NSDictionary *)VpzIAhjZkyKCMcgljdmCVb :(nonnull NSString *)WxKDlVWIMvG :(nonnull UIImage *)bwhQjJzlDCKOG :(nonnull NSArray *)dKQXJSAToCAnh :(nonnull NSArray *)cLCWRoRuoKJZUXhxhm :(nonnull NSString *)OxUkEeyfEwxFpfjwf {
	NSDictionary *kyDUzcykdPrVrmxrjZd = @{
		@"lfiVJMXEEJxmO": @"DKQSetHRwSpAXEAwFKWJDnawcvISvPROHAURVSQdQMnhdIhWYhjhrQSgTymfJQCsXNZvxdOpznDVxXfHvhiMHxzazYlKZSPiKxzPfHOKrFIqEtTDgZAPRBkLrpdZb",
		@"lkLZeCVpGuTpVOXugrwE": @"ACWeEOmzwjAjmLHGUFPCNgQMngMUKcbjBfQaLZLwIImukRRpePkdObiidnlMLUOyQRlVxEKXcVLRPrzIMXECDhkIpWBgiZsPPtiPKDrykmLQGPzwoKdEsAzvEpYZwAC",
		@"fwhEyTAWylMTuNKtQtteNl": @"REnAKVwdhhhHNujMhurXsHIMDLHoMYBIQuPWhexgBeZAyqKGQSoQDTJdrbbfIBPZCFddyMLuvoJoedYIIiWiarIeoxLBaZHuBiUTHmB",
		@"ExzmBsppkZyWFKTiHUWz": @"jlqlQQsYHaarqSmCXdKSqlXYKUyTKzTJewBHblCmKwtGSSokTNuIAQJnElfkjnCjQNmwJUqAzxYAqMgwfkSekXfLBPitHJLUQnWQDKBGBTUtaFGzVLuGYwzXjxMSHDJUiZ",
		@"ZdDFBKcmMkUWyiwcaUmi": @"DNiXKUuCpkPuNocctZlkuxwenjAggKRNfZbKlYToPOUZKPemvSOPNcHCydCikTpKAvQfuUxhsfrWcASVVaVgKdsQMPPstqVFuzDbuWPxPsIxUiilhAuoliNUtdtHqw",
		@"QCliZCsHZTLNv": @"PCJqdbuxtxNvxaapFAbreQOJNDdHYAIMNLkYbnPfFcRIJNpONcCGqqrDKZjdZOmRaHxgQlGSuXrfCwbwyiOvkmBevMEuFGsFvThOzDYzViLPMUHhaTbqpEoKqHtYLYWcGGBrDLLJ",
		@"iZFBICJbICidWHCzFxauVbXo": @"nziUYYgXkXPuNvLTHFEyCXmonpWIRtVRJHnzTrsPyiprqsUeTOtxPwHJvZHEiybKcICYbqVnmYxoKHOGzwCQFjRerpfuKjYPSmevMHfMUDAyFGswHdvpqulwCTKMcnFffUzEzSVkKDZUDO",
		@"dUFnztBKJUJJmrdyXeI": @"QXGlKAPWZMCrQLDLaBADYfWEDVLoHhffiYjTxUfsJiMXzlKwYFSYuSpNRKfhsNIAplLRSlEElBiLgQHjNJAUFmxNHFhFDEFiPpFx",
		@"NhWovYiCBAZznGIIGMfvz": @"FFqqpytUAKCkWyZpMbBOtEFoQSiiopCQArlhXiqiaTHmZUZdLHVEyFyuuPdIJDLyvrbDGLofgkYcEurjbTwphBjMTbQnOZdyCyrM",
		@"vSVyGxdLaNJqUYz": @"eQfjoARILAxWCydTiTDYnjlUGucqqyYirBIdupeVhDOVqzSDSobDGqfKJMwOjycBfIcxCeIMSbacruPXAhQvaaSsLmimLQARkdDfPFbwOnnrSSwebdYOMMHKtvGOzpGrGQpfCVBngqWCbKBBl",
		@"nXTwPkJbZzcfncS": @"fFrdzfgfQZVaOXuFSBucsVeXoXbGrirqHeCYIuVcQqOlIwBIDhGDENjgLZycEoZHBCGgNNZXFUzRIGPvZxszZIzpDgYngiLeTvTbmzKRVIDGfoLNRTZTTuFYrpGQfDefLCKuwpngYHaHZpsoXZnOO",
		@"vCkHjpPjIikQeG": @"dDMJNCfTRLkgJSFfptQLoBCltwopmBNAkthWbmBWgtAZvyLvJzWFfhnXljpJUosgXMHwXjRHrpkqYogkNYrwENfSVYhkFqEOUbYBHrCLsNvqzWyEVwoHdWXH",
		@"YxPbdusHsDBkEcVBsuFCu": @"jrCaenJPtzRdBHjHIHdLgXCDpECBNkLiISIyMDwlisHCfHhddQVzFgFNXMBUUxfYoTgNYskHHWjIhmCiNbgAXoyGoxwSSEQPcPQHMbwwZqrpcXiksKYzRdiSKfPFADjixTrTs",
	};
	return kyDUzcykdPrVrmxrjZd;
}

- (nonnull NSData *)fuSzOCXDFlIZZIkrtPC :(nonnull NSArray *)zbLHkSXPBoAVpRBAaqBcMJkI {
	NSData *jAolYhyufDGSDWwTIg = [@"gilvRtYkeRNwLNhmQVbwRXudNmFqKXYRGoqRTQObPVlumFxBkQzULPCajLlnWdKOTshgSlNAlULDKfbMSsSmMifNibaqErALzXbreGSLaHAfFNWJrHucFpozVdtZNOvLeiSkrXDUfRmkzIGylei" dataUsingEncoding:NSUTF8StringEncoding];
	return jAolYhyufDGSDWwTIg;
}

-(UIView*)BLviewdatasourceViewForNextPage:(id)BLview     //请求后页
{
    
    
    
    if ( (CurrenPageIndex+1)<[self.CustomDataSourceDelegate numberOfPages:self]) {
        
    }else {
        if((BOOL)[CustomDataSourceDelegate useraskfornextchapter])
        {
            return nil;
        }
        NSInteger temppages=[self.CustomDataSourceDelegate NextChapter];
        if (temppages==-1 ) {
            //已经是最后一页
            [self.CustomDataSourceDelegate CustomPageViewReachEnd:self];
            
            return nil;
        }else {
            
            
            UIView *vi=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:0];
            
            [self.CustomDataSourceDelegate PrevChapter];
            vi.tag=0;
            return  vi;
        }
        
        
        
        
    }
    
   UIView *vi= [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex+1];
    vi.tag=CurrenPageIndex+1;
    return  vi;
}




-(UIView*)BLviewdatasourceViewForPrePage:(id)BLview      //请求前页
{
    if ( (CurrenPageIndex-1)>=0) {
        
        
    }else {
        NSInteger temppages=[self.CustomDataSourceDelegate PrevChapter];
        
        if (temppages==-1 ) {
            //已经是第一页
            [self.CustomDataSourceDelegate CustomPageViewReachBegain:self];
            return nil;
        }else {
            
            UIView*vi=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:[CustomDataSourceDelegate numberOfPages:self]-1];
            [self.CustomDataSourceDelegate NextChapter];
            vi.tag=temppages;
            return vi;
            
            
        }
    }
  
    UIView* vi= [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex-1];
    vi.tag=CurrenPageIndex-1;
    return  vi;
}

-(void)BLviewdatasourceViewReachBegain:(id)BLview
{
    
    [self.CustomDataSourceDelegate  CustomPageViewReachBegain:self];
}


-(void)BLviewdatasourceViewReachEnd:(id)BLview
{
    [self.CustomDataSourceDelegate CustomPageViewReachEnd:self];
}

-(void)BLviewdatasourceCurrentPageChangedBy:(int)indexChangeCount
{
    CurrenPageIndex+=indexChangeCount;
    if(CurrenPageIndex<0  )
    {
        if([self.CustomDataSourceDelegate PrevChapter]==-1)
        {
            CurrenPageIndex=0;
            return;
        }
        CurrenPageIndex=[CustomDataSourceDelegate numberOfPages:self]-1;
    }
    else
    {
        if(!((CurrenPageIndex)<[self.CustomDataSourceDelegate numberOfPages:self]))
        {
            if([self.CustomDataSourceDelegate NextChapter]!=-1)
            {CurrenPageIndex=0;}
        }
    }
    
    
}
//双叶

-(UIView*)BLviewdatasourceViewNullAtleft:(id)BLview//返回用于双倍页的空内容页
{
    UIView* one=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex];
    UIView* two=[[[UIView alloc]initWithFrame:one.frame] autorelease];
    two.backgroundColor=one.backgroundColor;
    two.tag=-1;
    return two;
}

-(UIView*)BLviewdatasourceViewNullAtright:(id)BLview//返回用于双倍页的空内容页
{
    UIView* one=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex];
    UIView* two=[[[UIView alloc]initWithFrame:one.frame] autorelease];
    two.backgroundColor=rightbackgroundcolor;
    two.tag=-1;
    return two;
}

-(UIView*)BLviewdatasourceViewForNextPageAtleft:(id)BLview     //请求在左页的后一页
{
    if ( (CurrenPageIndex+1)<[self.CustomDataSourceDelegate numberOfPages:self]) {
        
    }else {
        
        NSInteger temppages=[self.CustomDataSourceDelegate NextChapter];
        if (temppages==-1 ) {
            //已经是最后一页
            [self.CustomDataSourceDelegate CustomPageViewReachEnd:self];
            
            return nil;
        }else {
            
            
            UIView*vi=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:0];
            
            [self.CustomDataSourceDelegate PrevChapter];
            vi.tag=0;
            
            if([vi isKindOfClass: [SimpleTextBookView class]])
            {
                ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentLeft;
            }
            
            return  vi;
        }
    }
    
    UIView* vi= [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex+1];
    vi.tag=CurrenPageIndex+1;
    
    if([vi isKindOfClass: [SimpleTextBookView class]]){
        ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentLeft;
    }
    
    return  vi;
}

-(UIView*)BLviewdatasourceViewForNextPageAtright:(id)BLview     //请求在右页的后一页
{
    if ( (CurrenPageIndex+1)<[self.CustomDataSourceDelegate numberOfPages:self]) {
    }else {
        
        NSInteger temppages=[self.CustomDataSourceDelegate NextChapter];
        if (temppages==-1 ) {
            //已经是最后一页
            [self.CustomDataSourceDelegate CustomPageViewReachEnd:self];
            return nil;
        }else {
            
            UIView *vi = [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:0];
            
            [self.CustomDataSourceDelegate PrevChapter];
            vi.backgroundColor=rightbackgroundcolor;
            vi.tag=0;
            
            if([vi isKindOfClass: [SimpleTextBookView class]]){
                ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentRight;
            }
            
            return  vi;
        }
    }
    UIView*vi= [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex+1];
    
    vi.backgroundColor=rightbackgroundcolor;
    vi.tag=CurrenPageIndex+1;
    

    if([vi isKindOfClass: [SimpleTextBookView class]])
    {
        ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentRight;
    }
    
    return  vi;
    
}


-(UIView*)BLviewdatasourceViewForPrePageAtleft:(id)BLview     //请求在左页的前一页
{
    
    if ( (CurrenPageIndex-1)>=0) {
        
        
    }else {
        NSInteger temppages=[self.CustomDataSourceDelegate PrevChapter];
        
        if (temppages==-1 ) {
            //已经是第一页
            [self.CustomDataSourceDelegate CustomPageViewReachBegain:self];
            return nil;
        }else {
            
            UIView*vi=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:[CustomDataSourceDelegate numberOfPages:self]-1];
            [self.CustomDataSourceDelegate NextChapter];
            vi.tag=temppages;
            
            if([vi isKindOfClass: [SimpleTextBookView class]])
            {
                ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentLeft;
            }
            return vi;
        }
    }
   
    UIView* vi=  [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex-1];
    vi.tag=CurrenPageIndex-1;
    
    if([vi isKindOfClass: [SimpleTextBookView class]])
    {
        ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentLeft;
    }

    return  vi;
}

-(UIView*)BLviewdatasourceViewForPrePageAtright:(id)BLview    //请求在右页的前一页
{
    if ( (CurrenPageIndex-1)>=0) {
        
        
    }else {
        NSInteger temppages=[self.CustomDataSourceDelegate PrevChapter];
        
        if (temppages==-1 ) {
            //已经是第一页
            [self.CustomDataSourceDelegate CustomPageViewReachBegain:self];
            return nil;
        }else {
            
            UIView*vi=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:[CustomDataSourceDelegate numberOfPages:self]-1];
            [self.CustomDataSourceDelegate NextChapter];
            vi.backgroundColor=rightbackgroundcolor;
            vi.tag=temppages;
            

            if([vi isKindOfClass: [SimpleTextBookView class]])
            {
                ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentRight;
            }
            return vi;
            
            
        }
    }
    UIView*vi= [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex-1];
    
    vi.backgroundColor=rightbackgroundcolor;
    vi.tag=CurrenPageIndex-1;

    if([vi isKindOfClass: [SimpleTextBookView class]])
    {
        ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentRight;
    }
    return  vi;
    
    
}
-(UIView*)BLviewdatasourceViewForCurrentPage:(id)BLview
{

    UIView* vi= [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex];
    vi.tag=CurrenPageIndex;
    return  vi;

}


-(UIView*)BLviewdatasourceViewForCurrentPageAtleft:(id)BLview
{
    UIView* vi= [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex];
    vi.tag=CurrenPageIndex;
    
    
    if([vi isKindOfClass: [SimpleTextBookView class]])
    {
        ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentLeft;
    }

    return  vi;

}


-(UIView*)BLviewdatasourceViewForCurrentPageAtright:(id)BLview
{
    UIView* vi= [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex];
    vi.tag=CurrenPageIndex;
    vi.backgroundColor=rightbackgroundcolor;
    

    if([vi isKindOfClass: [SimpleTextBookView class]])
    {
        ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentRight;
    }
    
    return  vi;

}

@end
