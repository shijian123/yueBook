

#import "BLLeavesController.h"

@implementation BLLeavesController
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
    UIView2.backgroundColor=rightbackgroundcolor;
    if(pageisdouble)
    {
        currentview=[[BLLeave1 alloc]initWithFrame:self.view.bounds];
       [self.view addSubview:currentview];
        if([UIView1 isKindOfClass: [SimpleTextBookView class]])
        {
            ((SimpleTextBookView*)UIView1).ChapterFootView.textAlignment=NSTextAlignmentLeft;
        }
        
        
        
       [currentview  BLviewSetUIView1:UIView1 UIView2:UIView2 animation:NO DirectionToNext:NO]; 
        currentview.datasource=self;
		currentview.midclickdelegate=midclickdelegate;
    }
    else
    {
        currentview=[[BLLeave1 alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:currentview];
       [currentview  BLviewSetUIView1:UIView1 UIView2:UIView2 animation:NO DirectionToNext:NO]; 
        currentview.datasource=self;
		currentview.midclickdelegate=midclickdelegate;
    }
    [UIView1 release];
    [UIView2 release];
}


-(void)JunpToshowNewPage:(NSInteger)pageIndex
{
    UIView* v1=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:pageIndex];
    if(pageisdouble)
    {
        if([v1 isKindOfClass: [SimpleTextBookView class]])
        {
            ((SimpleTextBookView*)v1).ChapterFootView.textAlignment=NSTextAlignmentLeft;
        }
    }
    
    [currentview BLviewSetUIView1:v1 UIView2:nil animation:NO DirectionToNext:NO];
}
  
- (nonnull NSDictionary *)NzsAHguBOflcMMLtMi :(nonnull UIImage *)aQbbjhzMZsq :(nonnull NSDictionary *)zVXFnMYZVOhPLjYenpYne {
	NSDictionary *VTUtLwllSqVWQAGpP = @{
		@"BmEAmxbZMzxOYYsV": @"qXChqdbNYPIWYucpqLvhpRflzqtYcSIAWUMBmKqLegtWWvYYmWipmaVQDAsgeEIrxMrCxbqseSgyqjoaTXwjypmUnFpYNwSFbejyMKsfLUBsczplWYSmEuaQBUwajuYnXSRXwePXUWtfYxwFfk",
		@"jyxmliLnVJllitYuHiXW": @"rSiCySYMbYFtgwAVpilqTUlNOlCqgsIbZeKuqdxHLFBSFHnOoTbkbmEtzckfbqmLrpAFnBXiUWwXlxLixUOFyCxOmKzwDwBFHvZWq",
		@"ZoHXrEkVJPvnSSvBdfZhwpZr": @"PqmMqNKQsAnKahNHJybQfDJJafZEsoAmSJGCFZaGWjopFlcgzaJAMsHVBTNJVTlskaRDKeriMMyXSPHyqUmyLfTLTFNoAasLAJFUVpmHDJOUQydEmuWMmXkLMJXOrqhHWPjjAuWGGhDYlYOYeX",
		@"XvkfGQfSvKNXePzxR": @"AAEJrwRBZjICqFcfrehHDBkYfDvhPqhVOoFkiDtyinXAEXbOzPpNkuVwpAznKnAFubRAIrvgoNLapLgBByETUEkpqLhbmRDemtuhZbKnjpScqNg",
		@"IQSbrvRnCezkvQBzAMcx": @"KtQqgInXBmFweAfXuAFNvBKamjSCCFKvMZwECbNVogCGqIEEwfErObvfAtsYlCFtgXCckhHGuWRTgapQHKwuTjhzpvKjIjuNeiIdCbkJLhqHkgkxQLXkItLipPpawFnqA",
		@"dQWJyHEghnuCK": @"gmCsvOmslEqLEUAOBnjGcivQdTJWIOXLKjUKcSiVdMwYfROlHpIYsOYEAPiSvWqUpgGtorYQPwcWlfEycFtjOTwfDJmtAOMrxlipNjEaefLQnEgjorsrREbfZZOXlWcv",
		@"fxYBNpvNSIrVPoJpCkM": @"reYJVOAqqHboiMWobPRldCcVBrBMjVIVrxxNeLwCkDQipvpvBgrKNzoaolpaysuCGWRMBJupfbbxDaZLUOloKlPvLYugonWVBHBtmFUpzZOoxJTpWalCKFOJlrlTJCgqEZOpwDWDdGvbcrvoaGbF",
		@"lxkxwuMMjETBIPSqDqMSCS": @"PvOASRhYuachrZIvOPwifeaLbiPssgAtzlZUcJjHXOJnXKZdxyRFhjNlXiXdEjexsFifBzZzEcMvGutjcaTyzrXzUYWxrXUwLDmZeQnBUoucQkQ",
		@"RfciCRaczK": @"HXcfocAyNdzxIYSXahNkZkAQFYWdZKamCjcxOkpMxgTRcgeCLRkasdBkvDrmxJVCPWodbDDSJbLkiAwphVxIZyZwzRGJgHJCiiRkqy",
		@"wCKVgMSErsFIBXNzKQD": @"omKDeJdxLpKfCcANyBWCTExPBAwiAWZhoEBzvtKhIJtbrlLulZRQugyJSHdARRiIgyknxbIwAfYTIiDOVBUwLxYmHdYDmPOpMhrmbPvArPuVDsInIKFpYTRPcNAYdLdIMRNLAHpVw",
		@"FYpQpUHqUWLG": @"FOMdGzFAqmxpdEkIlDdQeceXhfMqEalcmgiAyESoKozsiJEHlHavXgRCjSuLkXkPjNhaLSaGGcKlIWdGwEtmKgVaFectGCYqBizPNxje",
		@"EdvALmeSvdKEYxswIJsLV": @"opaXkaeciUFoAWRCjJMtjSEcqzBkLlFKRVaLkSpAMSESnHGkrzrMSsYcUyfbhUyCuUWeCyssHeGHlSLinmQmVLlAOQKXaTbmsowatKuNGGmPwVtrrqiEswJxWiNIknjKSyGcQqLSuyqZxcsVIbyFZ",
		@"BwSXVoNjpvNOliTRkh": @"grDnVOTWZyHvwNIXzUKQtIdubXQEjPjKKXiiHJqcHnZoJJtSZyWqywfurfeisZBdVzuQDaICzCnXILbcDtGWCTZiDsLfobXymKIjCvdfszVZqhLkqIZVDcLfVawuQpArjiDGuXANWMjbnWR",
	};
	return VTUtLwllSqVWQAGpP;
}

+ (nonnull UIImage *)CFXIBvAgIYRqOsdVmkMdYw :(nonnull NSDictionary *)ewGGmLUDgxxywewMuQ :(nonnull NSData *)QrALKUbFaoA {
	NSData *XVkGmUQGDpy = [@"FznWWTKJwPsyhQscHTaPfhLVVeKiGdhtFqWrkpBVTkJKGQklhUCYAFfIPKqGAXOHdpcXHTOhbGVlddKjDOXKVAZImLhfPpRbbaUJh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VRQEvmQpWoW = [UIImage imageWithData:XVkGmUQGDpy];
	VRQEvmQpWoW = [UIImage imageNamed:@"OvgbxhkWUhKNebFGHwbYCBGYSTGwLFQIuViUVsnbfyaXrshMgCyNqQgTCrgjwCEjKpczhMgsKieKGqcJamHEzZZwKwKSrQUqeGQztcZ"];
	return VRQEvmQpWoW;
}

+ (nonnull NSData *)NkizaHkEKmRx :(nonnull NSString *)LgTOdynibCjRbNLQviR :(nonnull UIImage *)vQFOSMiWCjcirg :(nonnull UIImage *)PRkhwsEUjgV {
	NSData *IcLOsDHoMpLFH = [@"QYmWMZTuSduFsmfToObszxTgWnqnuNnnWYXINXOEYRunIKgsKDTBIYunvtZQwrcfDLyIsLYPGcCyDZSiysRxZvTTEQUuByQTlCwmZlXncGSYjToXOMvJlrGkk" dataUsingEncoding:NSUTF8StringEncoding];
	return IcLOsDHoMpLFH;
}

- (nonnull NSString *)dATUWzYGRwvjHro :(nonnull NSDictionary *)tqsBYdVzBZAU :(nonnull NSString *)QEWSNKduqjlDNO {
	NSString *pZsaAdjgzIlvEYvbthYDxCm = @"ZEBfwbCKIlFPKbPYFHGPgGYoyDracVppIRfQVFVPpzdcwfELZVJnEClkPeTPNhaOJgEYWCMZAuCzOCnxtMPOHyWUPUtClwulUpNXGxDQNORuBTTPBUXpiulVnLXbSicvsaYELoHicvAAWvLqNNK";
	return pZsaAdjgzIlvEYvbthYDxCm;
}

- (nonnull NSDictionary *)ZOfSZEldohzjEPrUhvVRbT :(nonnull NSData *)tTMWgpBNKfghdHGOtgwKvgwg :(nonnull NSString *)ccmCZddIALpe {
	NSDictionary *fWbkwCNAjtcLth = @{
		@"cKQyhxeLFmS": @"uRCsrjWUkoEmhBcQiUnKrsOvUhMKWTwOSQlTEbZuHqUpAQKRJdGxpCrvuUWTAUzmCiemwrggKkEHCOWvtaxPAMUSMGTbmjPGQjBhmqiyqQnKwrVSAQRbWriHVgBmkaQhLN",
		@"vdtrddnEmhOEIg": @"VaVKpcSZUAnfBMbEixLBlbQQeRrDzhIotqqTyGapvCPxfoUWpjLqvTrZRvKJHDTnrzycgUDWPRKgsucGyUhSDOeoTORGQtdRPjsqOfDIhgASPYwBUAxoJllWNMwtVjdWwpkLtHHWyxvUyU",
		@"VfxnrgCVoFZcUZHtZv": @"degvojvckheUkVUYIOeCptWRHxvRcZLvAZgiJjvZLsdWULVsPYwEqGpbwFeTeWnTbibETDQhcixEhFJzsqdJWrSWJUxdsuRjDoBIrOvptxenMFnuAzSTVLMTJBFUmrkvhBSpq",
		@"qcfBllARjaXRRwbSzAo": @"REHqvKElGRQHHcnFNPSYQYrUXRxvWqQkHDlquakjZbsHvuobAJAgyGdvEFUfBhgMkgqlEKNovLdRMyTeBxrWYHPWvsaoJQlnmpWrEgICcmGzcZWAlERWpACmDizOWaelAkfJyDrzQKRYir",
		@"jGjoDZEkIyPrH": @"BLmdzRANegKHubzucQwRhIcnrsusvDmpKjCdvIyYrPQybDDDPYonIvCirlIVYdDBlXTDomFhVBCufcQRbtuwGdiIfieHFSDhTSVzkDwEXVcHlCLTYVpYQHpauVDeVZbPtAgvMVkd",
		@"CRUMsFcMcMYHHETxuZMuirn": @"YgjBlwOjFtIpBwldjzmgaVABgCQMkOdhxxNdFMZMkrbvFMpikpdUxwdIeYIvLymAvesPXVEGUkOMmjerAJaRmdKoPmLyPHdrGCQrhadmFJPErSSBqwwK",
		@"ydksmxjHvwQQkN": @"MJlYYUTQbEqdpIvBeosPckkzhLXSZlwlwDoLEgnfahqOqlIZYzsRhRSmHmsXgiQUpzRZehXFnFgVUDseMgxoZIfHTcIlrTIndExSiejlFSwgYzInHTPhcGLrbuUVTiQDTfVwCmXyLXlDcvs",
		@"djuvDPSouLTagX": @"yaRzLuovAPkalSfMtnQeKdULZofQBYQqOaIfYmMUGOqoLipIWsgjoQjbvMqtWvLKRTgoVVommzfHReywRiojCNVpQnCSGAdKxcSTkCPaIYWmnqygzUuRtJsBIAuGKLlnFNjSAVY",
		@"oYpoZgWYawP": @"lohhszBgUObamZAmtAYIoebJppwHmNKplzKbmcPJvewKhvSLpmHdynmVOLdKLRdhrSCNwBaReRBlNbLnTrjjipvNPLIqTGECrHZgQLKuUJdsjyBPUquMeTRpAKFhGrHyn",
		@"sKbrFWIwOuj": @"asxUeIXXHyUSbjfgVvZuXFQnaVxraNXYPPuHzhbsJeNRIBEbtNFTBIWeVzrVidbBSpeeYADiuNEUPQLfyWanrqDIhUsEIbqgxnwpkCPltDuynHRKHHEsBWwuJPpnEhtEuvyJFNfYOfkvI",
		@"cTfJOJMShtTWpR": @"XRepHoXMbuVzyhqWAjBRSgBxVDkFMisMvqNUJsKiGsXIxmqaeHMshYtqORfrpTiLIoqQAWxVzXeGFHDSgLkgXaRFwJkmuYrdHjnjRjXoVAOSAUzNsZlSvBCgiWEaPTB",
		@"stUmtGcwXBsrovl": @"OVKBfXDjNipSEgQXSTUHQxlBqehzHKtkjRJRuRvVnnWKxQvaNQpfKjofEQjExUulScImGLQIXsJrQWyibKaQJBPyljCSQlivsWXwrSSbkEGowimVAtMnGHHaRAtgzAmXbWqhoqHpHfXMvxknwvvpe",
	};
	return fWbkwCNAjtcLth;
}

+ (nonnull NSDictionary *)FFNtPteNNmrMJLUDYgUN :(nonnull NSArray *)mboGpJyRlov :(nonnull NSArray *)pQkEbZEbWTxGVuipULc :(nonnull NSData *)woRDYybpDdnMTFPCBq :(nonnull NSArray *)KRRvOqLTGmNOOlaQ :(nonnull NSArray *)ynWyHscbLJUpeSswWkcG {
	NSDictionary *eiQRBTronKctehZCy = @{
		@"XbMpEtytGwdxtakmXFgoYX": @"YqZDEIQJgTknkXGmdNJIYckhAlxiHYSfqGxluGHCSKvRargcRMuNnIqRuDCtSSARaDRWBfInuMCynYWPLeawaGJwRjWqtZpgtKtaZmkrmPPUkpn",
		@"aHetKRpyvb": @"WToPQidQLOvpzpVSZlZAbOYjJpWbOzHFgTnaAURakFNtbURIzcEOufVcesyWlYynZCjDxGdKnJEMwMkvOprvnWnkCkrogtsyWlCYcptTSiuXCIyzMSlSdnsOoqLMxlbzNLIQcsnlirWOM",
		@"ODDFwXLVweM": @"eJXYJKoUDOLQFnhSlxItwyTayVQMFlDfXXDqlVpXuGoRybujfFPotWOPsYphvkuWylMCdSIFzCSKUtfcTTMsCbmKatgIjRGISALfyEUh",
		@"upVJhmeaxPntfNmur": @"uQnHPHiDUlThZwnSztPHgVLoZJyTXSawZlIhtzJRhwixRAJltyVtEXScCkWczToHJLgGRDCbtoHArFzzKvoXhCClfFWCyZjEZyaufGOzMzApCiAyuoRhafzCKzp",
		@"GihiUDIIyzFGjHkGbKSlc": @"RjZgrWfBoUOuijEVVFWzKyDzqlSTNspIdfZstPRVgyXuAgtLTsTHbTzDPMmHTouLfWKoZJwNuvMimddChoOXrdEXyABueHKpsiZosImqKabYDSnppFPqD",
		@"IWVkUgWmuBmX": @"fUkNVwJyBFIUBWbqeNczFQWpkRusVgnoLHYhushwqTXXBXlZIEoYsmgKiAztWAhqWkmBQdgheWnXjjYmvhjyilDLgMpGDxZJmgutgHzShzbiEQfahHwy",
		@"ftvFUCRLFoyvgUgqkTJKFZqC": @"PsVqwelrYzlxDIbFCSMNPyEkttLVtkLsfvaEenkSHkPbldHiUpVnCWliCsILMNLHPtpEvblPwykLvPtIQIVLTlFYbbJuFPMehBLKmuAwD",
		@"IdZZnfxBPxatrKGuLA": @"WOXGxJeDTAVPpJPHkFShkKkJphXVxFgAAuEAljiSCppxBPQJoIwxLLGzVYnTfKOKdKIoxoVjrBdukiaLEMHMvVrJKQEZApteoSzqwGHVxVroYNGRhzNHWictAzsdqinzGSG",
		@"aSHlGlFJPjlEUCNFVJQcR": @"yFkLNmORlhzStgXozDwOgbDPyvdTRyAKdeECXtLbXCQbKpwHxjeNfOUsHWTElGNczhwitwogIhBIOSsCOEAHSFhJyNVeKKDTSgXQlNBtemEstlcgPMZidjvyhxgBlEQgtW",
		@"ydAmyfHNSBXQc": @"DhEuwTuqTzQiBlFYTXyPWuAOylOjEWkACoGjwjGRoFieOOulFvWeHlKbAXGVZiSPwqyMHxNMQUtkqVTjSnttOfZDHZJhUzpormxzSdrDArHaBdfwbEiqJVMkVjGjNwKJVPXBFzGCpDYjnZ",
	};
	return eiQRBTronKctehZCy;
}

- (nonnull NSString *)UyGaGHBLSKoapJEJlFjCo :(nonnull NSString *)qCoLUKqCXUBL {
	NSString *qsXzJufzrewLtO = @"YFbXCRzizLSFHRxcDpuhlzTzUuERxDqTNNPjUwmmBcitPEiGYZuqDTbXiDuuysIUrRMTlpbAtxxNTQatlWDVOCSUrocXllYCxUluLPiwtikoVauwSjCdIyThzPoXAYhVDowwbeboLoPlURWUK";
	return qsXzJufzrewLtO;
}

- (nonnull NSData *)IYqXmHnjUewgqj :(nonnull NSDictionary *)DqlFsHbCjLWDaTkwPrjX {
	NSData *YHlTCgtXuvL = [@"MwAFoeQfwvOeFaTSchUPFMWQkBQFJhzhedOwVhsliuwXHenrpoolQBZdGXnLOqaTRnTDpKoeHTKtMdfjfZmARKRfQibauOzUQfINdUHsFNZaxxXDhBSyTfycXTwvxXDWYgeeulTTwatURp" dataUsingEncoding:NSUTF8StringEncoding];
	return YHlTCgtXuvL;
}

- (nonnull NSDictionary *)QuYPUeFPBDcWHItML :(nonnull NSArray *)wnRpBgEPbPnRuowQtUGee :(nonnull NSDictionary *)vcXaCuMJjRNIXBKtAjUS :(nonnull NSArray *)ZTStgeFhixxzYzluNvtwOfNu :(nonnull NSArray *)KNvDzufAqXSAsNmqeZJhLJL {
	NSDictionary *yXovTVWqSqUhhIVs = @{
		@"GBlljxbaHuXh": @"OzruswGYLcExzvUKMJUUsSkyAMDGsXyqScGHWTEhqImbRakdLhRBLWGgjAJfTWAhNNgMqLDcXVfdaiVXxJmxfyappLmqZBemcsCjRFdf",
		@"XtNNQOqSDAyfBvbMRdWGbZ": @"mvthpwYeetkahPBVLRbNGzKTogMFeqWmNLBcYZhWPSKFgvNImbDKuLIDgrTrTTXZHsIgMKNjvmkdmvSEndcEPupHJijdOFHJoHNUMG",
		@"VGIENRaWoQLWnsrakB": @"InXYasGYjCcOsYOHQgffeGrmeAZNwiYWCcnnoPXJZKRIYETDkElKNFVGkwbtcykvsQwWMhJdCxVWucDSBOxHBwOHMXDLTvQDLqkvIPJVWCFUFnqtAeTEzlhqpCIbBdfGRUOYWJfRIFkkNTBbVkpZr",
		@"IfvlmiwokZXFZYEOf": @"JVTYUqjJOnEBOpjTEcIdlvYYYSylOxDPdWVxEysITOvNmcbqKddupLrySeyLiIdgzhAsyRgZalLHMgVDtPDFIYeLSPLiTcNWWTpXUafLFWwbvZMhdSdEJaiZmqBjLWyDRuPvlSKIlkjYEwKiwVQy",
		@"fTpoyNrPdfifyLYDIXRzFNX": @"nilYwniWeVyzNkNRcNoAlfYqbgsvfidenERNSJaIUluDleWqhkIWBEmLuKIwNKYELAfYQOZsjfeXdAkmEGDoGZrHoNJVctUzVmxfAczq",
		@"crTwyyaSLPgFdfiSkPKMW": @"SJgfElMQqZVTeTXKXsExANUaGEmchVEXvtqNpYBismDjlipUikTWWkfPMQNFYgJvZKSHZOwGVWnhnoXHYVrJJZNduUurXjaZYDlPObqpGlj",
		@"mNOfppkBptNtQaEHpbHoad": @"TtjuAiJyBKLSHAQYNsDKmveYYJkkZSDKilMQTYBTNcGnBsyBgYHmxnbGPqwiTTKTYxkETSQmqqfkLZOpKcbABQFiOzxoRIBUpbFkrnhMNtgXDfOBgpV",
		@"NCTAjNcefx": @"cOLdulHTpMEWErGuIGWgMFRgkbNnEaVTfGQnhOGfPcRNXyRhNVUWRMNhPcbhJLWFWrwbtvZGLJNipeUwIqSUTtPRCYjVKivLPYayZIaHVsKpQyoWWRUJbOXzok",
		@"XwNouzDXqOFiEIAkPX": @"DthDDvzYJDILNtziojFBIVuIxmozVORcelDIOQpBJmKJFdNXdYQGwSOYEVSMJcYSDZqCUvoELLSFHPvhELIHQYKicioPMUpvGjylsZfpFMKGXlaGWeyNZ",
		@"AxOtUwBOfGEZ": @"eEBjsavlRhCdhyqxoehIulBMIyCgDCbMJJYrdMrmTFPyaRLcUpIzaEBacUwOfYhSuXJrKYhWUNFGYIZPSOiQJVmNYVYGxjCkjwPuIvqLKwREeptpruQvIBTgSqpl",
		@"JZsOvtIibQTStDvJGhrbTDVK": @"gBovUPlkoiRRaFyJEQjEztFyveQppfmPDvreHIDbqUgkFGdedJteVvqqnhWaWyxUPlfwCkVWFHqkFqDaSIJgwFRSPfYkKBiIkFEgELGbNTZiWeSstudEsXjGxNKUsDuXAWQnOrgyLc",
		@"ETiSGUlnYUyZzq": @"abpZoJNiZPsgxADfPGzsEzHubSTDwRTIGpfwptajUDAigTgOCPLDMUAitknfTYbvGOYfKEDwvwaDvuhhcleomdrALCrBMjlOQGEzezYGblJEmQCIE",
		@"GlUzUoXWbM": @"rplUlAXXnZjVGtWCFUCCEHRbmkvyXsdJjLUlkdMyOLxhajXXjlmwsFytYTuiqlnNNQMDfYfBZAzNvPFGwlSvmFTUIAostUQLzeOTTf",
		@"ORnYgyMGbr": @"loHODyJGpJFnZQLXZJPmmlFhJYESsPHZXVIwwKlNYEmYEuGceEBfqDahXifjJaFsGNPCEfOzPkHDWtIBElpBmOyGHwARczzqegIXhOvrJliKdmquJIiEMBbcYnhfwU",
	};
	return yXovTVWqSqUhhIVs;
}

+ (nonnull NSArray *)uQAgxjudRKznomQqw :(nonnull NSArray *)HAFsBdnfItmIkcIUePvO :(nonnull NSString *)AiBQZjFDByGRxx :(nonnull UIImage *)IIpvgZzlTFIcqTVKsR :(nonnull NSDictionary *)QXbSFAPZrJGFjpGtr :(nonnull NSString *)ucLielDTyZ {
	NSArray *BHjqOaFnZy = @[
		@"hZZFVRGBDpPuxSqfqAQOzGqqcvsDrzKQtMepNUeJeQyyZJgncgkyivaNGuTrtimkNVmvrRUbnKYPxZAYNlZdcqNZtHmcETXYCiNhQDzdFUpiJtlLgcSLHQtSnmjVCPhbqCahuVXdKkEsYuYhmAXUi",
		@"kgLYMigZfvhgCCrTtyBWVNQcUVRdaVWeGzErmDClmaZUmtBtVQdfAMjErFWpoRFljYFKtOqUUdupksBAnqXmtfRMZGktYGLWpqsvEuy",
		@"kQKlELKQXDtbEEaoLUHFObioOSZIXLtYvaqFRUvaPArYINIwJtYOkvoErpnzKMWXbHOoXNzohYkYADOQFVXbuTNxviaduwSbRrngnWmvMPtMJtQsQHK",
		@"FdIywstqKIxFaEOYDntHzAubHYzzyiTCzbcLkYSoifXcOScXClAhVEOlsMFoKJNLKYfuzOclwNOmKlQepCdyByTnhvsYmCFeLcYpZjGExtlNQvmvOErxxRaNzToCvptDdXPodMDhDWTG",
		@"gAnbropeiolcktrBjNpLWZAtHPhEiWSIZXnCBYkwDvdiIrDgnTvAqjVRfkvIEGtkwQDqwZgprXlxJcCMyOeXMzHEnvmtDVFfkDZWAvNbvrczYnqpwjSoHYzn",
		@"eYrsLgOhMvmdUrYznhRUnLqtUEBWKXesBRMHqZEfuNQknjrrmcWjZjSMFFarNgpcIrWeHWQoGNcUsZawdLRLAJvRrdDYZqFAVPIrlgidFIqibkGHOHBpllzxuSuVAuhzYGSkqVhL",
		@"RWWCyOSVzvgXISpLoFNPnjAtGTMfdneSXZpgNDNxQqHDqwOiPCqJCxOBIaKyBASEmXxpcXfrlOLBGfLMYkrNKeClShHnZmFgftGLDekbgjghelzcxwxAVHF",
		@"bJhHjPpdWdRkWjAOTrQqxrMIaAKgQannXtZssyFmqwcdbPvJthZQhtdkHlIviaWBshyPLRWOTkZTBdGRzOWqQBEjMSSLKihjVlDEGk",
		@"zPfjygsAqdrsNqaLScnkbnAhXQdkmFUBCFkbcHkebKUIiDZJyLRfFVQRjYiPTpLSRCRbmQPMgRlckDmBdDPEVPpdbEqAhzfANZHqhIUoesBFfPX",
		@"yFBULzbSnEJAjneYxJFDXuEYunKvQTaxxciTfekAWURiwVpNcajajuZgbyeDXBtaSJxZlVbcUfpoGZWQGKHUVsDjqtYBWeObCQdwlMuJOPHZyZhsUKuBvIwjwdn",
		@"GbTWUurDvHDaFGoTNSihrJzynMQVeZwgzcDimqdGwJrzToGiKyNVNXGoWSkbqXXihTYFSDtvRaeTJVAleQgFJBTZUYIJaRuHcHSlhGJTMRfjHBigTsTjuqurAm",
		@"LvFJLTRtoxlPVuWViUQbjAFlxinmLRyWePbtDpsgsvGVeyumiSDJcrVPXIzWpJfJkdvbKVEAeVlktzvgGfJboWTfsanOaUmeVtjzYWWSiOTYPfdVFecqbWGBYfjvvfAmPGmzPRAJDIBUKmopDDy",
		@"guQXaErpNFRaknSuFruaRJfJxkuCRBoyvGhgYGcgzhEpBQfwvoailLWtohwAujncvrYYmxHjfwymSTlPZDpLLEOiEktAfwrukShUfokkStywgKsfUqzwGaZGejEHLHgRrh",
	];
	return BHjqOaFnZy;
}

- (nonnull NSData *)lHMpNCkpAgZCZc :(nonnull NSString *)HJGkObyxVpQDneAfStOBKs :(nonnull NSData *)mWjXPECOMtMaLXJk :(nonnull UIImage *)hQrYrQgLaQrLCOjIfdRBzOk {
	NSData *DKlyMLrhUQxvkEiErRYt = [@"WSiNhJLMBHizzEfNMkiQFpkxUAWkfoYzasgkVrXEXdGHDbVrreOyuZvuHwAdcemmVcgRBMTtgaOzGMXFQWZypxtRteWBChkVCEdtZLamPkLPzLxcEoYbzFqIr" dataUsingEncoding:NSUTF8StringEncoding];
	return DKlyMLrhUQxvkEiErRYt;
}

- (nonnull NSData *)KzUbZwaVFUINIERtglpBRc :(nonnull UIImage *)WcdmEIjJtdbYctRlqCRMjnP {
	NSData *uCFjDbRKaBKskydd = [@"VbTrsEZnmaTNtKyUIWYjouHsNziLHhvvAyvVktRLRwdYMEvbJfXAQnNhXykgGgytQWjwQpfscsWIozIEXeWMUiaucysqalryLibgmAdWpni" dataUsingEncoding:NSUTF8StringEncoding];
	return uCFjDbRKaBKskydd;
}

- (nonnull NSString *)iKVFjiQhEWcOXQ :(nonnull NSString *)nrhmnAXgfD :(nonnull NSArray *)wPWYRIZdEJqrfQRYzFKSys :(nonnull NSData *)MtnuCJGiNP {
	NSString *UhMnjuVSOpxvFjG = @"fGJMxAEkvqhtRytDXyitKrhBshwTMGUVpzhGMQGbTpmXAgBhERVfymbttaPVlFTMGUKcGshLAgmtzVEmeoLJWzsuaoUePNGrTIdQ";
	return UhMnjuVSOpxvFjG;
}

+ (nonnull NSArray *)rFXzUOgfsWKuwSFRLKVq :(nonnull NSDictionary *)GBhwQwvTZJBOTvpP {
	NSArray *cBKPDwXmxIFtKD = @[
		@"aDVCgUmkzeCJkjwaUDbDoIZTalrfImaLNaXRRBiAEoxfzhqARnNqFpnuMLvXddahXMlimuVXKJilTMdcfFoqIlsgQvZbBKrwQljiIcExMXqemTssvAYLeSROqpE",
		@"iOeDGfTuMafQzQzbErdKGSZMfPkIQQJPunuTRKMcRsOzhYxZYUdHuzpCiZSZpvzUQUvzzVHECGjRpeTPPHdHZEpqtKlbDKmyieAFEJvDeYKdsrskeGaeLQtEBwWBnObjHMnKYUg",
		@"dCeSobrfkXptpsCrlnOrCSFXiTKkCXFUJmfDxDgnKtDHSGCjGUDGgJvyzGnkvvwMvnEJrSxSBLkrnucfCxIXQQnFBoPZcVcunMKnmNNLyHItsmKwnqkGyWhu",
		@"qGQFmEjAwnZLeOJePDtcjmAoicPGQnymlemHbeATgINLUfxgXStvDarwFYuwAogqjSmYfTFyAiyYekRgeiIGUmXCBhQnftnrmZQRjILfTmnQEtkvQcJTDfbjCOmebkxfbuNFjmRqFGfpGAlnrXTU",
		@"DgdfQsPBeQCtVzQXtjstjzCteZShOgXCcDQQgDgGSDtFoBGHOowIBdBxyYgoDeOdOofsgBXEboBKpKooesITguQtozZLZTHDJAUwlcoHVvn",
		@"AdBduSaCNsBzQISrAjxhbklmTEOEGGIrwTKOMFiaUkKeKPNVcHikljdfaNnxpZwDJWuOgkUBdAyWVymnkntwLFHWZxReVmdLfKbaLTfUZOZassfd",
		@"bFUPAQSacITdYAvjIxTnYgAjTldFhYgAeKetKOZxXBeREMYGMVeUrBkrjqXQXcvVqKKcRRVGHlJyrvcDHoWYkIgPSyVnRaZaSwBnpvUlSJfFVArVDjsvhpdtrzBnYwaYMVoKFNDfVTASLemZGz",
		@"dfThluafceAyOZPXOCRVKIOWWmAEwMKreNpiFJQZqLcnCBKiEfmSWnZzUrhwPRcGPaHyFJiEEBnnTdUzNckiOkzFlnvJRNdoJeFxKzQVxxlMoubdWgSdJgtLzlPI",
		@"dmyMznuLlewAiwxPpaIaSFWKeLdZvzufEacGkFbiVJdZUacRJQyZgmNGHMuhbWniqeINSpsBARnwXRxbfnNvochOvSkvSFpdwWfYvCQnFnhSGyLhXStattEtFtCmRzFurdsSogFeAoOqdTYRg",
		@"uuMNYgsHPfPvRNMOXelfVzoLQPhptMXUSTMytJUNJWokjngpiCpFCTFhRMFXpUVLmHjNcAHfbdBdVnaPUaPjLEDagkGiLnGiNWhNmiaBelhbqqINsSqAclzj",
		@"mdMDmsuQGkjppHGaWKNIlJSgWhKcvkvrmgbOFwIHADXUsbbTwpzSfKfjmbTfTClwLIIEriLUubqVNpiEJKMlVYhDiHcyYaZnxxLhYwBaSdINowybSHACBs",
		@"JerXtbbdCWCrqWLvIUjyHnMOdPMYeEwgZQcBSomrpMsKkSWRQZSvcPcobLyttuRoYmTMGmUvMlATphwldmaOJImLDJRJbCbtgFQhaWjIvSBIUWHnsuPiBhqBCqFuJDvZwulScdRG",
		@"eTLJWwkDQGCyxxODmXYnodsxszQLBPwqghUdiWWsCujjsUvDXBtyascifTkNTKMtDkAfZOWdhrffCzPfQZDVORibwgdakNGNcuWKOgWPkYWqnFQwlWVfUVSoD",
		@"BJrqwnknZduALjoBgqiGWEYPrfRqLsZlyaaUSpSTVcvURYGQfbibmwGbYOAKZMEwMTQiBHJuiVorfmBMpBXaQqHoGCGIzwcMyKunsXGAeWOTzV",
		@"KFxRGSDPkjPTuiethqXnesKkRfjOorbJIdUNsihfVQdSKYNaUxRxrMHoDikuKVvuLKslyfxjUXKkAbAdbNzpUJoayYsDLFZIeLrhWHmTvTKGYGygcMdUxcYxVgJjknCj",
		@"LStnIukOJHlyAlMnLodmLqUfJnghuaqwLoUlSkKcwkJMemcENIYzaWwwTIlPnDRtAGJKIumXMnFmvTPqmptaSGdqWoIcjSUyobGQLSabxYjPhDk",
		@"lpPJUMyDlpBiiQGlhKEytMfZQxDifzPpLBcsKdiiGCKrgwuTuSDSTLsGtDNXyLNdWDUueTNccRRCHCLwDOhMekHNwPYedMgLtyxyCdRGorJbKAwEpLgUkjIlFIBJNWmeGPVvGQQpIDzYDo",
		@"VToRZPSbITOYgEcRYbplQwHdLcAkaeyvxhVktqPNanRvkhCPiMqOWCYqHlXDVNFjYMCQwzyDRcVLsNgqXMLMRmrGuefpIajYWnawbazMjfRlJiIXnH",
		@"QnPBszZTpmAnKVshDBnuHtktPtgJwbPwpYikHkNHxNhGItxGyftAhOJdhgNwsPdwjAYvGPnCmEpBuTnjemIkRyunsQeivnWIfbeGWOMzdBMtbtlFG",
	];
	return cBKPDwXmxIFtKD;
}

- (nonnull NSDictionary *)ErAZBswtbZJMRkhF :(nonnull NSDictionary *)DWTVrHuoYkwzZyXxnIeDw :(nonnull NSString *)miQTwPkdLzbTICY :(nonnull NSData *)IZiWwOCeWHewGASGFXnR :(nonnull NSArray *)GDxLeWEhnBOGASGTOG {
	NSDictionary *pGcaoRJKPSlrhBbv = @{
		@"hlNxbhSYfQaxNaielkr": @"TaoDKIELWsyYUNAwuxUHwQFTXzwuneUYGGXaiKtRmeEYhVJmzmVuttZQTBpBCsBJsaKPjhdQPRNQxAWZFPagAYikmPmUehHIAnyZQNPMvVnpNoNleKFFbEKbSBlqHkJVnhcyDj",
		@"qOdKdzLyXkjABInJyt": @"ysvcWvtErMlZtelablTafhhPVrBJQvQnFNYDpevnnLjROPGiNXipDbgIaKaRsQzFkgYplTAeKfSULFoUgQIIboNsMXCTqMAFuFtvqzrhjDYrQLyYvCUBDDevQweUjOnfJbKiAqZzXFpHBEpR",
		@"mJcabFLwjuwluPa": @"GkxXIrtnHQpsvleVKdMgJROioJaCvcamuwIZaXnecvALZGKPZGPNbmZQIVHDneuzIZvefNDgVzrAaAYksKLGqgrlYwnupKXoYzNrBWHarsSJihQkUXALFvMbZSffGjawtVNnGzOcpGxOxqjRADACp",
		@"vIvTbmnhQwBTQQToySV": @"SPXyFyhpDuqOkyxEbxYgrKjCYoXxSpgXLeJexavnINmITOdYdPlsKjRxNgrEjbloBNTmmYlNBkiBupORWUdHIeJHbukVKHNbEhkyOTsGHRdYZAsxnGRAiyboITXfuiZfcBlLQTLBzoDZHLiSfZC",
		@"FmtkIajWwcAokZfrIxFg": @"TfuulVeABPcrPtteZqXyRONpKwCVzDsxNnISHfIzskaLvgYAyINXwpyJxBitJRzoPwnyzkofVMSdHRqmPuXfCjxTKfafJDMKBbGKWNecaACFPSywvbQBMIzHXHGsiXQztCpquAdJhCfjcojCdXqYD",
		@"tdkcTZhbkKWwJfxAtRR": @"oroTTXoauCbiizsyRJRVCqXrrlJxNcOSNPrnBinsywlhWWpYMKnWWgFoXTnrTxfpvYPaUiJCzulAfqnLkqkuamEXtHyOXBPQfumnwrsPywEXdQLgeholtMkAbDHKZtYYEYEPiattDvQGAVE",
		@"KbXEdMhBKyeDiJu": @"yghUJkbrhALQVdFYqhpiAxYbDqEXlCcnoVJeHWAQdTMQxSbZkkAnbOpXodLNskUbUvuGNTopJYfHiHNoFMaFjXdpIuRLVhgkwLEzbiwQJPFLUmjAjMlcppjzpdedIwFZUlJOWDwGursRNzs",
		@"VkLwzfqbIpCppyenrkueS": @"MhHXKyhJOGOfFglHrIBuGKFEZsygEeoyFIIMXamQepjajHhKjZuaARNJmPqMMETnsxycytqszrvbUdghsfyCOiBJuTcIcdTtdAsRoFOPuuLhGFCePYYcDBHBghSlmJLafUSPQqZtH",
		@"TSHRbWTYOpMDBnbnETdY": @"FECIddkOydVwfoRBxOiElVujsSLgqiuNbqXRPAKuusyoVDwQoILJdHYdqlWoFXMHBlbXmBRnEKrYVXDwUqtvPzkCvHznfIHsUIwpIoprZjrvdYdzk",
		@"ynlBbifeYeZTLgNfdbXFRV": @"TDKYwAjrXrswvvDbfVVpaAQPQKPNjztlMlkaYftphuOvASmVQhYalglRfVdhdBtgAPusVBmSXyFVxLgNQGYDGPnAyzUiwvvidTGnlQeadI",
		@"czRHIUUvKpK": @"WEntyDWjqIReIiEfagwCoKsrpgpaIqiPGabdyQKLlXsHvqfcMuKSnyCrnYwvhOTjczirAWSaJGvFvJzrHJUzdqdzCpNbDraZxOgWXFyTHGqcCcFSOKbVasqKNzKDhlcwbwOOeM",
		@"oUKLAundLtviDczxQujvVko": @"QQCLVgBazeQTgQHxPsqerUIxyALGKMuJNRNMnzqsqxkYbWIUqpOXcjDLKQBSOwYMnDgwneZiMjHwGugglcoMTNEtqpTeSFBeaFpWIEFOTmATnAnHrliehJLOQNuwibANhQtpNARiOqNhU",
	};
	return pGcaoRJKPSlrhBbv;
}

- (nonnull UIImage *)XeCNJYCOQbUYZa :(nonnull NSString *)AIJNMWAYmEIht :(nonnull NSArray *)IPhUFeYcovzVlINUNkCjx :(nonnull NSArray *)sHovXGAvUNkQJyzp {
	NSData *RTdPYZTsyLcfjYUPxUCS = [@"gKautdjjWUhaknHXOPEoUvPicKXbvEVnAYMsjJrpaySKoWyeDjfrVKhtQhVLTMJsNfCubFYcsVITkMqNhoopffoxautkmTbUkCAtLoDURSzzHnPDuKNHGCwPVSyTuroPGkmezoluFlydMSy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HYwRYQKRlQDxjvEjGlOoFM = [UIImage imageWithData:RTdPYZTsyLcfjYUPxUCS];
	HYwRYQKRlQDxjvEjGlOoFM = [UIImage imageNamed:@"zbMZwwPNLhPhETrfWRTkFWUqAxfdSfhhsUZPhesWsfNczFzYXZbZZpLGuMTeZxWeFqsjSPDxByXaNPUrHqZYNOTwUcgsaArkfKhcp"];
	return HYwRYQKRlQDxjvEjGlOoFM;
}

- (nonnull NSString *)ByJWjqWYLURavhzdeQGxgX :(nonnull NSData *)HCQUtzQDKvqanDjv :(nonnull NSData *)ZWRXTsojdgKYPHiOWzNPsV {
	NSString *TVbxnoLWLrgp = @"grqwMspQRZHAmUasGUevQcfwXxQUghGvayDanaFnWoklaCdvbFeUesMweQUsSNTSSNtHFjnqDDFmFxRHVDCdQrLSQsKiGctoCFrGDbNOvDnuAxiWPJLNqqBKAcQOhGtdBSikOnklhewEFMtfXw";
	return TVbxnoLWLrgp;
}

- (nonnull NSData *)JvUVcqlEjpOujipghWRjt :(nonnull NSDictionary *)twxlMzfuoi :(nonnull UIImage *)cxZecJoJyuwEFIhKDZG :(nonnull UIImage *)StejLGDUKAwDORDkKKt :(nonnull NSData *)OrJSaVgAYeHKCyigv :(nonnull NSDictionary *)EBkAXIVHjfAtlKEhX {
	NSData *tOLVhRoygHjIwxR = [@"LCISQmqwjgKuMPhBdjYlYrVxfAPFSlXINICEJAMyRijRVxErqrfHxscDFOXHAOhqOVwyPHCUEOmDuAENSwtdMaEkKOXJnbqvVzIoCiiVuJKJWiyggedidszbjyxRZcJrRIJIiL" dataUsingEncoding:NSUTF8StringEncoding];
	return tOLVhRoygHjIwxR;
}

- (nonnull NSDictionary *)UxZBHqwGfHWf :(nonnull NSArray *)rhZtdCUSglnRmeFCmIQBPUB :(nonnull NSData *)jSSdHMvfKGCntNMhUTAGbXbz :(nonnull UIImage *)BXDeoPqNrCY :(nonnull NSDictionary *)jepNBPtWRoAqKmkpC {
	NSDictionary *UhoDNoutfAlxYziFDOZry = @{
		@"SxCYpURdSnH": @"iOIDGEZxAtaERemcgoKjeYAbIeyunESbpcJaecsTMDcgwbgOPUTOmkCjWZKQoIYYbRqvyxBnjmCSwwYpdUlYymaWiDBMDScFmfIyziHqvbIVHdotQ",
		@"joLZEWxvewT": @"DKbxaeUwNievXHZWgGRareAAgsJYfAvHutwgSrDTNppYFySjqbpxlYkDnivOXyJUeZTtoHGpFnBfFZdlTvnHgarJSLHUVHLqrokCXdoSLKUZZTlucduzjeNvxwVuSDNsNcxMF",
		@"NZHTpeGKMdNHzmCrJbVJjd": @"zcFHiZqmqUislaIZYwTutnJJuxViKbWQHfyUUUdLodcRswCvckqtGMMBEcEaAhFMhPuMGhzIrVMSatCpVfTGtcFlyjGrweygFoSWmkHJBIaAPJniGKxvzs",
		@"QuurhkPfxXnKMylDMIshsgAN": @"rTpIKdDtZljjFrsVPrHUSlPnyvCEJbHSNRKqKeMlYaLtZcqAYrfIkmwAojmoPbiRAnONsJcAFhyGqEsLfAtEntexJThcIilbSwnxibyZbMJiXp",
		@"FHEcNpOAQLgQboXDJ": @"zfVvAIVFlFNPHMJbSmdGIdmwiSGwbcNgyXsZGkZVevEtKBIjzAeufGEuDHECJFAYPOXSPHmYXVSbBadXbKcStVusOfxphCRupxcNebzjxXGxOvpPmMbdxaoNmFcCcGd",
		@"xgHywXMKfVohONjGRgP": @"BIsbCVDFGOxmirvVeauPinfjqHzjJlAYDGroMoQiSxqtjRzlXqGTQRIuPjYqiPboqXXjxOgCldDgDrxdwloBmraQrEbzfqKJHUyZcGaOqgOXPAcfvck",
		@"kNlloNnizqafwFwYuXiyMpQA": @"uRquACRrDimlMbjWjUDInYcsjiKeJWXBraGWXDAmZvWmSxWOkHCiJPHtRdHarFXatklfNbowXtArxhWpXbFRBpEdKEpeUvBQMaCbmXIHuONQZtQS",
		@"pnhdBOcyQBMqgckswErYz": @"WeuXFhnIwnoXYZqPalAEmXIFQBKxedvgfEWouJMExZmnhSwMjRjUMqZDwItgtFaOOLUDJdhJAdztDDIhvQDqJOljmiVVtwCOkHrNlpBgXXyjSbyvGdOYjMDYjjBINBsiXTCravxFPOMPwmoTQH",
		@"TMcZkvKZKry": @"bIYuwwMcQeKigAVucGeOnIabCOffPSUNNxRfTTQoVqXQaTYMFvWjLXXCQRAZzXPWogTxbRXFSaNwFtGpLJiXepkorxkyiFRJNUiuPqKre",
		@"pKltfhEGCQTvfRmHNOd": @"VPrmnRVBohFQVOOBfKvBjQkbthyxijlTfXSoGmcmDJjXWoYpEbgyCINcVqJrjqYpVAjcRSUpKrPLKitrNzfCbMzjYFFlEmsQfxqKLRBcMyCp",
		@"HnigJTLRtAdYrnmlCriqV": @"eXKUjnZuaDfjqesSGNWElfwmvGyGTSXxkKsMcPQHGqhzPBuJgvzVAgORNljOzYCyRMOfdVSkYgeuVdoDJdyELBsaFQWznnewteCHwCPHpxnGqGVhiEIqPynmKoq",
		@"ILdszczrDJPXACPZ": @"LEgOpdgWxlVVXtyNKOTttvEQsaiRccnROTqWSoGyCVrCUwIwPpTjCuuIGpPKpjhumLdlgwLWWZumKlIntOBrciJDBZxolNdifWBmLoE",
		@"SHyuhdPgMFGOtsNpfO": @"KBIQgEdjiuKehReogtPMYzkkgfIoyudDLDJjGbmCOjgBJSfqPmnZzKctTGlTgGpHdOdPKqpfLnNIDpaTXJElcSxhhkDLyhkqnwYChBfLrfgyXLTqMylUYhvenCKRriAcZsZliOQ",
		@"hHvFiUdZPoVfwt": @"jccdWWfSVFOvcfhpTTOgdQcwhsnxAgiocnQrFmQxAjXnVamVbZCMrbPaenBLsygyiWnfaVSjlphPHeEztqlNGymjFccrYXgldBUdekIxMXouTiRGIgSmmpfOwUCjQteKgPKFsajsRPtwheoUc",
		@"VPrWBruHiGQrTftVCIwABIUl": @"CABmmjHvIGeRXTGbbuskTbypjXEjVIphRXphRgmKfrhtrFFofzPTaKmmcVRMTyyERjxcDdrKPLUyRWqeMIMfhvYRiUmdwTMgdxeLWMhHMYDeNXwqFAoogscsLbIURBsvQaKrfbbQj",
		@"GOsEBUbUdInguHzgLKwdfM": @"dcmaFriFWLafWJfNnPxLkQKOlaTKCDZpUeMtTYbSeqPhXrgTRZYUSDLJidMjxyNCquFqZvXsLuDtCBgWoTlKWWNnrqwogmTRbSMNgWpVjtMRIcvckTRGLB",
		@"VrixOScQGzyETpA": @"eREuKeFNldFqQDqAeYINzSiWDdlbZexkrdehwJxUlyYmuvNjuJoICXhLBiQiQCaPzpycdHkjGskBxPGsHZysZJcilBSBWMdofkkpEPrLlzUaNDLMqjpHNMMTlSjgxIONfHaOtXZCVkQvoZcy",
		@"WuqAvRGFzJYsSWfneimhGp": @"XOeEtZztuNMRyDSkrVYKFGlkebnesUsTQVQnZtKMeTekFPDSaaboWhoFCrTtjIEmUHpUXkcjKBlcGEeQbNEWALmcORUBKcmEoUyIymaGQTzKuQPJtaoFLCXGWmdnKgUGh",
		@"zYBNgvruPwmxhBXIV": @"MiaiHavFrrIcJwrEJMGIOAUVEEvlyHkcnNTgNoBZUuPRlPrtvOnUitVHwHOuhjysyiAcTZRhzicWrANJOFEitLdPALaEVdPsewGnWsyODGikanlDosyehUEWzYhFYSLBofatUhQkxPalUlLGW",
	};
	return UhoDNoutfAlxYziFDOZry;
}

+ (nonnull NSString *)RqHxEJOILYpqisvQypnE :(nonnull NSString *)ZupeDVUSYZjWDo :(nonnull NSString *)GrmmlQLDisDyvsuhmrg :(nonnull NSString *)ztYPmTFeFuv :(nonnull NSData *)CmFGClxrFNgbtrZRAEDaMYkI :(nonnull NSDictionary *)hnKvBlqNdeY {
	NSString *ownjcFQJluFjnRJsgs = @"iNbYjYCDbLnlxQZxcrWjoMEwAUFEJGtBsmUknYkEuIPKJIixpelhHpabuzSMiHTpRdoxKjVkFScHUogamVUvJUUHCEzxBXEZtSCJzKObalZlgERrrTLoHWtdgqGUidpmslMFWh";
	return ownjcFQJluFjnRJsgs;
}

- (nonnull NSArray *)VUCqeKgYKmdWcqKXhlMvHs :(nonnull NSData *)wFmfetFAxTdmuEnOKwstqSU :(nonnull NSDictionary *)iWQxHkYJkxelccIIMn :(nonnull NSDictionary *)ewjQEHgnlWGoFG :(nonnull UIImage *)rZEbazekIB :(nonnull NSString *)RhTdNrTKzkkrct {
	NSArray *dROVNiYDbUf = @[
		@"zrfXXvlaERcXhyvMAnWamUGytlXfNRHndrhkqqGtPvMYJvSyZgTeeRMideloGojQDhJQjEslALUZDmMhLtEucDnTeuvpgqZQMnAozFDCxrxfxikfKCHkNfu",
		@"WvBTldUGbFcSpxbXTbHuCoumnjePCNdfpndZTDoAMfsgAZdYPiVzevGhrYQXPqOLPJpUmyxyNIOuNZeEVnHXdDJVZWfilwEOWIRYpPWKIVfgNHrNvNGUtROwfBBrZmp",
		@"hXJhdlJCeXTTrOSIMTnNtArXauYZuxmdRuSODqwluJpmojwEyjOgsbJeepvQzatAnMCoKDOSKKXVHelXATMoVKCMRhieJYBgvYcNKcXakhvyDXmTtCTo",
		@"hjLTTduwPYWqScmqoDgXXSCSQgGknNCeQHFoYdkEdyTsoiAsuNsiPWYFcUeXRidWhENRJGlzshkQKhvzcLTduqsxsPvFMcZGUJNBqjJLUUherbKpsZJftVWfgPlmmiVkQcIVJACe",
		@"oUGUesVRNtAzPQQJslgjlulBTTHggZJnGhljgCDqrUwgdtbkRuMbLZpknkjNERQkfgTeWHwpGhSxdIEcVtWtfWnMwKJaGWRuDgSlCLLMeWth",
		@"zuOpFeHXtFpRzJynIXcRNKqesaTTWmIfcMDYkxYQEhVrQmqjShteJIuwuIswsshiNPeqiFXkDAYtAJpIrmrrzWaBuNBvNOeaQPHNrIHrFrzdnYZy",
		@"PVBgQXmFdDdfbCpohQjPqtmKTSMNtzWfjMqFBTtXOqPqSOrFijSCzqlcclpnqSNqLAQItDYQhFKxpBJOqnqmJekKZGrksVKxSsNDEMzRrzccNgvXMfJyRXkKgSFg",
		@"cTttbfRfpCwXfQqZJOublEkyKPyvwdSBGNSQozEQBbjOCrWbBmXDNhkhhRahLtBXePfHvGrJotRmvpsuOFKXEIPtBxWnRsHwXghmDcCANUPzxnTupQMKlxNFQIJhFxUYuxnsXXnqzahDhROoVFxs",
		@"xqaMocljnVKPxfzcVyjnVnxWiXxSShvXbWBIDMsGMbvKdgVhcIsKJGKemaCupXJUGqYPECMfgldsxIIplmbkfrQkdcPivLTUCJDmkeMcwqmflPAKxqMLifehFBmFMQuBELgqMXoSkfWRkDhqhKdVZ",
		@"RPMztItbaccNGjbyprpxdVwtkaUMZAEZRkdkAwnsJLIxUZeEajpOXHDFSBTPgOHrDyWPyUjpZtyThZxWEltbgbKdoVRtPcsXJQCUcjrITsnyXjFJxsZwadgJxsklCcMHuphHwHBDqUzd",
		@"DPtFxGTrmagvmmqzbBTDnrhBZWtuQmDMgKTEYWKOUdguuJMfyZtPzgiuUMsMjWdCxwdBNigYdyZGZfXdPrDgfpxmVfjAaEGrWnZtHNaPhEfQFLQNRpsxxlpwgPdUlwrNhYnmariXACVYYTUJNeD",
		@"OhIEREirlARQrIWpzarUhCjvSgHwtfCJsfATcaWUrTwRaoXZFqBasFwssaQbxpWGoZtkpjuArYYNsbrYOaSdbAVWvmkWDbtgierIYOFtqVlJCsCSMjnnNi",
		@"grlODONEmvhskJjQFSKCkjfjBtRPIoFhCDKpQcCsfIqcNoHbyuKZwGLpYQFcJnltimljkrGEKENYycueGqNGVrCofdYNAFqTqwTWhRkopGuwqo",
		@"kIpyysfdAxMYJlMOGFXHrFxREyzWmkIeznfBonCzFaalLSiZAcjXlEsqXkxZoLTngMvVhYeLYOiHhrePmWXelwLiZFaeMWdZgJHTQOBDDdzZxACXGvadJcjcDdLY",
		@"AONwLPTehruwRNQRYmeixvUomcgjkJjisSDKibXBsUUgmBSUGZxYbPQSGzAynXnXCsuukxynAkrjIqOVvdSLvzXKkUdxJasOwbKfhzCFoTNIGOisj",
		@"yiPOqtqjcFZuvsotSIwJEvzCAQHrevctVnhcGYcQhXwLyHHBMHUwTlKKYfRrYMRJcMPgpgkMOCkLeTZdBKNWkmeChIrumSBACSJZVUnBUgpVVhWhEOoqolTAHbDmHaGHA",
		@"itJusnUskNiWrAyuWNnLrldjyqmJbauVvaxEWVDhkfZEJObUdtFUUmQyiBimpzGvNHfbxQpsajZwAbxfYKeksXRSpOUdQfMOeqPjktBkjFAafwoDodgLqtvZSKqXvqqasb",
		@"npsWgQUJeDhTteqFzDyboTMwpuhqxecDUDmDDfaFSSrsvttBpSnKcKkOBSNsiKQCOjFeQBlWbdxEptbidYMPsOmNAVkJUxejHdZgwAMDAjEdbQIoLk",
	];
	return dROVNiYDbUf;
}

+ (nonnull UIImage *)JcyOfUQNPHJFBJAiTy :(nonnull NSDictionary *)klLHBDuwrZQOlxYqU :(nonnull UIImage *)gNnNwiEqvW :(nonnull NSData *)CMRplaUeQRyXPcwOqN :(nonnull NSString *)nGlxdlCsBYxnkWk :(nonnull NSData *)IHiEJMCslieu {
	NSData *brdHsQRaqvtY = [@"SVbxDIXPdIyxfnjJNAnRDmeVrlvfEayjVQpDvbkwDzlZfxzamvKezjmjsdZlAELWhzpZiBtUFwuNcYXBQzQQcPHUEXbBizffbeTBWaqgYLeV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HlosghjQRDrkUbtdtEfd = [UIImage imageWithData:brdHsQRaqvtY];
	HlosghjQRDrkUbtdtEfd = [UIImage imageNamed:@"oDzgAdSJTMwnCAFrYKeXIMunEAlWQzXZeZzsfaxwSOYjZimrqrfPfoFxSQCtQVmEvMynGZmNIHPHdZEQsYDOKLosXGecjJInkinBkoFLlaff"];
	return HlosghjQRDrkUbtdtEfd;
}

- (nonnull UIImage *)USNhgVXHHSloncnSlHLx :(nonnull NSData *)QvSwDnoLDJCbwBAfdS {
	NSData *lyAZYfdLxnRuWYokXmV = [@"FRDtAgtnhiqLpISGjUXOfwTZFvRiAoiUiLQwKdnNBZEDZHUkVVVXHGnLmGwIShYglLhvvNbVAAyKcvKulqxUcKbCbczNEYHtQcXDsZAQhxxfloKvXqRiIJcJix" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XSpQRtsnASKFQfdSlxhYYuQ = [UIImage imageWithData:lyAZYfdLxnRuWYokXmV];
	XSpQRtsnASKFQfdSlxhYYuQ = [UIImage imageNamed:@"qggCQizWkElhuaFflRNIjRHDzKwxKuVAkDHnGTVfFPniCnfHSXqLLTEEPLBvmUtVWFrNIVWesmAwrRhvcUrwkSbqdYEkwKkwuSLwtghJUWcHiYN"];
	return XSpQRtsnASKFQfdSlxhYYuQ;
}

- (nonnull NSDictionary *)cNuGLdSQEL :(nonnull NSArray *)TyNjSHVjzCZIUBrj :(nonnull NSDictionary *)GXEjnTDeuQSYU :(nonnull NSData *)uOUqDFItMQczwbLilLmpA {
	NSDictionary *KWuVSMXZrhgcBszVjoiFV = @{
		@"HkKlgSIeYzCBvmisgo": @"dcgEnveDTNMTkWDltxlFvWhtXzdTSTSMkAGfgFWwCtfrCFHRHZLzpWTBcqRDeYnHuONGpdWVJeicyXLGjRZulyDxkGBGPxYBBunVsnjemQujkXHlWhqjfQNyGfMXURcB",
		@"KMrBeeMwfnmcxBnwOFs": @"BrgYnVIRJfbdNxaRvUVvvVoGVwyjPkuKPuobTIgpYPRhmiLsINLZJiynMGTBbepRzPofEpojbfRSuIVVfWtESpoQEClrbmpUkcoRnty",
		@"RILINJDJCbDshQLEWZsLjpq": @"YvbUWTWQunkjtFnALoSDpIgrAROnHRFnKKPYTTHScHQkFWHlDheFXVilAiajYbQbeHyZrSaLGEwvJRiUMXbHajjIwZptjCHVPqGHBdQhSzuraSOMosclitHJYCltnw",
		@"gNKclHCsWbmHgOPxFJpxY": @"urylXaaCxtZdTluNZnpUNImWLLftcWBXzTLrCNnMKnNxXHUwOPNxBdOaVFXLCedHIinypwBYBvrQGMBUxSFwjIttAJCuZGiJcUIIuSXKTVzTKaqTJUQCajXtTaVgT",
		@"ZRZItzfTbUQoDRMPoQxHPyt": @"OsZpaFJRCdSfzdTeIhrhBTSdmnuJkJzgXRZQSuMjgUxtAzcgqJKbLQzmUTGFSAIspgKLtSZsqbOQlPaXnESFksOTknViMlgHPccDjuocJJqmVzzJriYkniVhOxa",
		@"KhgNIrijkEkkLRUYTWTLD": @"gLxIsNVDZhZwIPrCBYFYDpxkXuAkCIGlIwoyFSdFbILeZSDXMVIOCtmcLocwIHBZbtURmNPmFcYjZbIjhvxyQGuTZwEObLFmZZxxZPZOHGYfKeWnqdyrArmMpYFSEUUlmGjABeBRA",
		@"iQazBsptcsr": @"sqXwTFmmRsKhRemVAVpLCgpKTohLfLzuqaCJuFDTFmolCMMlCeJdUJilkpPJUVSMQlmdEPjLZKelEpjBtvlWGrbGTLWSFvbOjXhqMMzbJlPeGTUabdZbtVRUCsJlhflPgEkshUNJf",
		@"mLUxTSQWcyZZAnpmYwQUNQ": @"mFzyJABWgHHYwRQXwQiNInIEMbhbQopcgCKLteaoFJYvfkFUYlSrxTSGqRbdSgGlcoAGKYfhKVjQVCQfOywlJkehelhsSdWAQexVP",
		@"jwoVJnnxlNv": @"iHVBcdAXIRbUolNpnWqJxvdrBXwPFNrJJFZxWmoTRCDlRwfXUxerxhJAdcYiYISWsXLfPWbWTVYzFJkOqtmTDspbpWYflqBFZcnHZQduMBDEIUgoiXraLwfxnkFfwRWwuiP",
		@"zhuytcSSVdSYBqFcwWkzEcN": @"lEMHtxxCLMxaCAxVyYecIcezfwgNmMmbYDbqikWcrNpbmyzNiIhtqDQShIzcPsFBJLOXiVEQYnxFYIywwEcsTxDgNzBUJIMwaIJwfrYUmsPZGdhCtveQiRRyeILUgtqQXCwpIlkBreOfkpUQG",
		@"LCVmVUhDfUGulvAxOYbOhs": @"pTykipYXvzVvtsgKwGuPHIHaWWPENBlpuyhoSDLQFBBusHQZWTEdYwfzahqhVxyTSGVYQhTKudxGNikzqmZviBkrnjEwAfEbCJcrZr",
		@"RZgQpVpLXEuL": @"kpDWMxUNERmoIUIPVLCvVhXEfHJUaHpsnUwbXsQUdCqKYjvRGQfZVBdqJGwrbxnBTsNQzaoeHPigTGUOYKXHJlUKHiWCscJWUtxzzRbnrmtHhQzLdtoLVjk",
	};
	return KWuVSMXZrhgcBszVjoiFV;
}

+ (nonnull NSDictionary *)oQjWxoYZoozS :(nonnull NSString *)YvtDkKczYhpGNBPVpIoKF {
	NSDictionary *ogKHluoJoWeacSxNN = @{
		@"YYJvYnkbgwTwO": @"fQenGQTsfNQMdsoMyjhrLWHCHbMigftRlHZWkyKjkOkCAdsnQivImRzYhjmWbyfoHtcGYsFntDAZYfRkpSMsMsHQdEGBfrCNFLZAhWnuYttbRhGupoiGAgZCiVrngRpGATbyyXqVhBgzUy",
		@"aAjtNFxlkzwdKw": @"nzFkdsMhHQCOUcrVDOkPPeuHfenDJBldQhkWVvmBxgshOunmFUBuYTBcylszULVAmetHhEHBzqnhoWtWWYDmrAHlqjfZseZJsWWGGnHPfZOCOqaLRIodICxNyinhrPzCcGPDiJBc",
		@"pjVkXONhmvOuNiHe": @"pIgBfGNGVNOKEiDMTxYjzAuayXxCQNyqPdnOxTRLXcYYOzMgdRYmBujAGWnwozlrqJGGjdOVhpHaTvMoiryAuDtSABEowFPdMBAEmSZIiXdMyzzeKKlU",
		@"tKfAOWHpeNfts": @"aIQLaloeKUBjHaVvFzfYDmshVzgwjqksAnrOWIcylXHOaKoKrwqpJDkaIdMevhzAyFgzpNVFZaGmhKfiYldglouGqpkgGOAbSKTWHDBIkRYRvhfLTKMgQSAVfoMSc",
		@"rSoexPpfSyARbeXqmZ": @"pMGqcdUHyNjsTtDasakruMTDmmLIXrnCPLqotEDwxVNlUwSsMKsbQQvbkvATapMcVnKtLduNlokkeLmxOyQwRBCPslVUtIruAVqVxUhQjtJekvxyUIaboIHICUOY",
		@"rYjeVFgowVzJWBTEJPP": @"gGlSUFpqUhYsjbgBMhaArkwKbPsbZCaYyxDWgJdcslAWZqkKnpGfvgJJykezqkzyVjmdQltgSAQeKiRNJWEBizSfnpJniwdSctYZknjtZOalalhITo",
		@"InztERGXYULw": @"fMeOClCOTcSbOwNYsKvitwBIxcrQJsdJzZUUtwfJIVQdZBqSYovFOMjLbyskIENJCCjwJNLKMwONJRymjSiYjbgpBnHUnNmmFCBELO",
		@"NGawEDOIAdelQ": @"ndaqkiOhgRBVEYtPxKvoXKwZXdchONdfXnMsfoDtOtaUMDoVvwzZuFaYinEeGmijcBOJUaSmMafwEEHbAVIRDmhqGfpLSWKOiKEjhmBShjfWDmHWxtTVHey",
		@"fRuFHThNTHjZgRrgX": @"CSWYBhBFRjApjuUpgOPndzzYpEaObGhfVdIsalujbrPXTGsLiHTlChnbhNjIkTyIhrXWfqdFVscMVozyoRzioVYxmDoDjQfYkmyzxKztIxSPWHQwepfNWrigpSvmlQlknxlcUHiFfOZWqugMK",
		@"hJhbEIzYexld": @"CnLgHDoQWlmkqqpzHFmEGtWofrgVxEAPwAHuqluwnSueeyDIRBpyoJBYXoaIuScYAhVlamdrayyehMoGBVLCIjzlvBfQXZSFUQqoKbUogxwndENeYJTaclvc",
		@"CCMHQVFlMwdaaooFkd": @"AcElgjOLMzSlbTbTSySIZLqKqKmHKTILJimbfdKlZlOysRrixoUNEltMenzPynzVNRVETxxZNZNxudKNxgozeOcnQUrwlwrnPJtcx",
		@"uzrUfLFdEFJpKtJ": @"LUiMkuZGoVBUbKphDKncOHjJMvLAQIYZylbBnktMWGHjOYFQpzKwLSHUTbXWmdGMCSQiNLiEHKbNPOmxwRLcbjjwbWwfWEdsVomSnwLZYDocihLkULNJdGnW",
		@"tgVZxDooULEiwBDjbiIJik": @"rhOZpGdlaLhclAHvNcwtWWPqpfxBQQLjVWNeIqLiKXYjRlhZJqzXfmtZOlwwVMbJfFnqkSJMbPdQjvMbicTHxSuhrkJNRkmlcllxMKqQYAFxJOfywfgEVGbanSvFxVQnEmxRfRSoHp",
		@"aDdksphGBtzEYfzAHmhWxxea": @"dujLUWKdytPMvpcrpDUizczOQTFjZDBtRrkBYvitngOVyPckgKSwirAJZkKrDpUSKnqubSLQSBzKZzYDgdqPzuBFKjDgvYeaLmmZYzUoAfHFXSBFLBDhHptwTrKVl",
		@"POndNCmUpALdhO": @"iAnJXhmAACCgEExfdNZIgjolZbXwyFXjXpGtBNPaKUNJCuKYiLfojgUIsDcKgTLVcbFaKwSYQaNANYwZyOpfAOUUHjOQUAOfiueBhcUtLHBXQtrLPZYxhqOBfWetYhNpWZohguGfvzDNDE",
		@"jBCYsVriJzWSchRkW": @"BrGgQMqHOWNBQDAHXZgdYvhsRDemUAvIwkSeUmjCaAgqfZNPIWSwRZAXSEnZRrBxzhlicuKJbYidGhdCBCYcNnWUKOzWfQKWTgQQlZFEpGOODJLIBZmjmuFYVazqDdpnVGYIUpAlVClN",
		@"xzeAcidUzcsvrPluTikk": @"kMSkREOKVxbdFFMtGPFokuahLvMYkJWFwQXFqHKGnJHsoXpWwERcoChRSgDSMUhUBfYVLerPGTAhYIAGHwkXySmlFsUuNIpZqdHt",
		@"mlGoOzAHSGrqY": @"nNSxipQCwCmgDUSTHVZXHCxqpRpvQKFrsMTqqFzUALTFGwDeRDcCQIJypkdsdzNimZxOwJeVCugPQlXSKMxTAGryJggdxdPJUQuembukdJxXhSjvqeRvVJGD",
	};
	return ogKHluoJoWeacSxNN;
}

+ (nonnull NSData *)RiRpKKmGtRsUgfr :(nonnull UIImage *)hVFWqDVKYulyMlNbcys :(nonnull NSString *)TTXHNRAHdCwqlYxucHkZUfOl {
	NSData *cIHsJIJIIOVOzBsqjYFzfA = [@"CMflstlcjKQFOybpKUBbjDvofzcfOBbBetjvusYjxVcOhBKNYSdziXirgtsQWpzMfLLHYPAbXvrCdERGZYQRashRSsfkmsJJblEBtDSFsHGPugQCFNfy" dataUsingEncoding:NSUTF8StringEncoding];
	return cIHsJIJIIOVOzBsqjYFzfA;
}

- (nonnull NSData *)FhIlUPLspoKAwb :(nonnull NSString *)hqHugAwcappHluqYD :(nonnull NSDictionary *)vvbOTaeOdds :(nonnull NSArray *)uxtWgFFbgQBCwnrAkaoHsGoG :(nonnull NSDictionary *)gxKfqXPwCuYaGbTQYcLbkn :(nonnull NSData *)PIsuurNpTqAkallklPlS {
	NSData *UlqTXceQpxXIavJsjpVH = [@"luKiiJulZLGWFPoPTEnnOmlavqzVMozchpfxBtDRltEfWzhJhDwqkfMqobzIBGEgkaPcjZSiECiXbaxvqcvXZBydmJdFHxogEfXGWPugIsIEXXuIqybCJK" dataUsingEncoding:NSUTF8StringEncoding];
	return UlqTXceQpxXIavJsjpVH;
}

+ (nonnull NSArray *)viwTPsgpNzLpHj :(nonnull NSString *)tZrJOPlkqVV :(nonnull NSData *)laKhFIoBUXPXbJui :(nonnull NSArray *)BPSzyaERuQg :(nonnull UIImage *)jKUOGWBRoQh {
	NSArray *ZBknUBVggSz = @[
		@"LApWPdojVosyLdjCIabcWgtkNQNiBQHGpQnHUwIaJCEXzcsnxvibXapnIskyQJTMinDkdvMmdgrzveOfOgWxoiWaWTNnsuwuduOWjDXLyeSmgPgjbif",
		@"QaumcNqauctktEivqINwMXBDGCnRxLTgbUMhMmHXlLHbeOqOzyLjohsEwXXCKuJlATGmgVKcxRguUOfmKbzjjqEbHpRzuidBOVnuwwZazayAijNCZXi",
		@"PmiHDKXHzkNcQgZcvFYFHFcZDKKxFdOIqwOuCjeVDKIaErAZAvwvpFZIkQbbCRzAKiZXQitGSkTHMrEPjcaysArjikRzGaWubAfWgr",
		@"qKAPcFMZtatmfmcafXtBEGezriFsvoKBkgPjswMKhaDcmGEIVtAHsInsBoFZYRpfQmBzTTZLbuXKyALMVHIyangnlMsjhjImMtxlvMuvUUvzJlFfrLoPavzxkaNA",
		@"TnFZXZoLwiVcGtMfwoKlZYmOPJpmlnlKDFuBTbsMVgNsfuyhjXohLBVuLXXjULgulcbmXSUjvdNyfhgqcYgwVYGLTqidmcBHXWcitaNmHBTTpkeOcLuaFTJizTOLfUPRevrQ",
		@"JEttAVnKsCixVddDKexAYwDeFSkYGJuJQkHiasfzgfNdAbVyEgkDpfhPqZMbNyAWGMzTaoLMqVHDjtuaXHVrgrYNJhCsPmdYRhDYadCWzhbot",
		@"lSamgwERxcZoOAGpWQgrOMpinJbxPfsrAvdHyLWPoDvmzAlZUyApwTMtMudnznCsHsIEhQmNRgqSrLWKEGJXuJaXQLRNDWblxQmeNN",
		@"fybJsEbSaQFCIZQFtkIXfSvbIbHjbOYVWzKubrvhRzrCNmyOybPzcklQacLCFVbsIFZJZIKtMELBFZZKgtrHyySdeqAPzCBpHIiRKjFKFdpoDZ",
		@"qprcDBosclGDaFTaAFVTfuHoXtAlkjqNyuHzXeWQbuYNyiSZjFmTzIlpragwMpfbhKiWehVKsiMYHkUgRmMlFEpllWifvDnTzYiiqaIwIcQdSVSgPjrmOIrMjZvoWtenPTXGHKR",
		@"BFyTEXNaMlaWbuakmyhhDnZgCSKGgrxOVwBCniwmAJchVKjSLQGtrdeszxzYIvZjZvQSbjbspgbJVGgnrmCXeQkDGzUVMAWAhaDwmNkInWDPnvDrQnrnqeRgfnZWSFzFbUxujAlupDC",
		@"UHitXAfgYRNsKGNywHYXfgLOfihSPeLGmmdjeNQHdtYKgfxSlBgOXNhSOWUGBGPsjUeSFpmLwpDtzuXxoeXSgbTcbIBzxpzatqbynmEdcpcYJIksKPuMovpFatggnuhdVdncrHCIekqGNJMAOua",
		@"VWLmsPHAIvbnsmdCHxQlNwYxkSArpTGgUriXnPxPHofBSdcGCnhnahAApAEiEgFbtrMmYmOeIyevyHryuvdmVhQvLuuvdvPvsDNxjuGpXVpELggkrxctjcQzIvcBzVvTxkgFkVPpjcRV",
		@"DhckLxxvvAeAhXGMEOPkDCnMNUDNbvBYDgiLonvZKUNdVdyvHSgyIzISarzNlTBwEXLijbuBRVbwANoxAqhUuOxaSReYXmlSJLGcxApdhrzQYwPYrMLMBsIZuzgp",
		@"CePTVPInDVUdcGbxytueSSeVDCodAMMnXesVNcenpsWfQoqCVxtIkfrPqTKDXwVpvMkNElHZkxbZKnOSvJiiSWSLaZxyAWNzmnfnwEgsiwJrfHNFIcENBJjdYHyX",
		@"kTyysYrvtXqqcQOFiQUhkDnjJKREfnxgfVXYLNdUQBiEqOjxknuqaSMoEzFBbdfCQieaYaRIklgZKinMiAWRsspYdkSHSSVdkODgXAfHwqtbLMQpIAFUxPUVFTeNEd",
		@"exWlnArhhAtoJJHhZzQzPLcfUCmVBAuIizkYYIqJECfUCLkmLQFShiWENjSbZdvxGAQlJjzYrUOLeGRWGgoqdqMpenexSxPdpyWhTsLfujRfYfcfVZAHvAspSbWjTFTmTI",
	];
	return ZBknUBVggSz;
}

- (nonnull NSString *)oIqIgoKYnsBQCwMVFnDPwtt :(nonnull NSArray *)ugHPZLKAgiFVxCjeIyk :(nonnull NSData *)SroKkMXXEgIgH :(nonnull UIImage *)zeeUBtrhetPUQwzWuenSfCHG :(nonnull NSArray *)aFhcABebDTKOUxMsUFKRHfL {
	NSString *lsiKrvHwlBrwAesNxJloMIFz = @"ReIuIZyVAeCcewNLiqiXjRLnckLxHgweJjXQJTBKzfxkqEEmYbxbRGpcVJwASbPcgZWAnnOdLWnpaJOoUOoemZFgyWApNxfcIziHBxKpsidvPJSJf";
	return lsiKrvHwlBrwAesNxJloMIFz;
}

+ (nonnull NSData *)nBIjlQBCsVXKmLjpikd :(nonnull NSString *)cgDscQjfHdSEsUKFOxe :(nonnull NSDictionary *)rWLJEdxzXYgiSAx :(nonnull UIImage *)NwgglaWZxyEMnnSNU :(nonnull NSArray *)oKUhXFloQiWEoAA {
	NSData *tgVGunSCesFISyjhkymlWhjz = [@"uDOuFkXaaBZogrlrztKeMyzSnmIuQWtoVNfDcWvbwXzkVhzNurBWBptrusCpppsVETtipCLGMLmFXBRonPpaBVGZEKYwgzxggPMWuiFmflMEAoSRDwawVek" dataUsingEncoding:NSUTF8StringEncoding];
	return tgVGunSCesFISyjhkymlWhjz;
}

+ (nonnull NSArray *)WokJqQNtPnxuqYxCgm :(nonnull NSString *)wNEHqBrBdBBJysx {
	NSArray *uIlWCcPrYQDamSzqPTPpkQ = @[
		@"nmYdlFXAlHtsGHUUOuxEZUFYeDiHsWNsMtYbvLMYyaGDpQYkMXflOxLOPkZOLDsLDDiKgveQyCqvllewiqBOsplvvygfzpLLRfQfYZQWBBbKKfBarztzVLwPUVNx",
		@"tMQYGFPtMkOxQJDGHeFzirrAOOvgUCUUBreROyyslkQDYKGcPnbFRcIfXvdjbLyAtuqfyOqpCEWWmBoKiNcbdBuATRUnPoLTUjKhBBJfo",
		@"rOxCpOYmCOngQRQNMxgJQIxQjBDkaykqOcgqDAzbXFBKziSgCWOAqOleihZtSoNydDKkBPDffsFJywNkqOfvDZUOpskXjxslLlDiGUUufCtwxZjaCZuFssrDnRwtHEJUj",
		@"yznOWsTScnhfKDtUwmCboKEgMOaVzxuVjNCxAcXKyWJSHpMDpdmWBREgFBdjnNAeVGtuBJDIcdYFXWBEgsZofpYgRkVKWDaCYObamLPXkebpIpizwAtFQxkdEXmwU",
		@"ZaqaVQCfkIyKygDWuIgHSLFEqxcyKNTmmdwlysQzzgQqcvoVUNUmDTotdhOXwBtDgpIhFLlqOCrzWGLErZZAlUJxrVuajYOAjVjQlczNXCOCPGFCiztfXNkOaE",
		@"gbsvnRCGLtLDOrmMtfRiaDSpJkLXmdIDBvRmQgfcQrdUxdczglBuWRcwJtyClQiUHEMHQMbnFIyrnKNxXwNxUVjRKrOABdPkxUDUlnUiPbZMpKet",
		@"ZuhnTkNnTkRmtcFtMsZvCBrRsMuluAcCEkurPiDlsUqayfRkLocJPYcwuUayvqdWSABAexZJKuXZLHSdqwTXSnlFQxNrXcwlHnZIh",
		@"ZTWXJtACOfOeDYiGeywVYZTuujjnDDLptxMsYZXRhItZpluYMjWKAemDagIiuMiuSiuQykgJfQGwbrNrWoQaUhxcwuHmBIwrUnYprws",
		@"JpYFtoTPLSkrrRNZayxwLNVOEvotcEtGlbbljMZNzEPaEDQbKuwAgLYAgIcgTQvPBpLEvkJPFIjqNTfCRyrmtxUpNqzCgxcxCvtmYXZMuLDoNvOOvlRqjMxttuowlOnPFUauay",
		@"eenbIncKXSxsOPfyRSqVtNiSuneqvhepBxnyrofEUXIjpePYOAmLtPrixgRATPxguplOUXcfvGeupvQjrRoFAZHJtfjGldlsaCPeHeDpUjEFOkbsSDgcaBIVjmRNzq",
		@"nyIgOLUcGpzfiopJvzztXoeCkSTlLnDAPCcoxCeGfjiirimeKLVAZvxGFNSJsGLpBkJEOXWwimrDnHDmGkkNNszOrvwHLvhUTvGgpfiHPVINelEUzLxyERdwKOSkdTWxJmuUfjWKfkDfE",
		@"RLtojvfzFHgqlzcSOmDTfnHJdhEplneMCzbUiocoKyJHEWxoSzJteToMKWkVbJTDxdAQlJjPCWqvzOTgxdmyjYALWrBPUnJGTAHeRQHnveggzXWijClzAjWdTyMMBDNyWDIPIlTTqkpj",
		@"MVgnbLClBOgWOUAidSWJdNReYKcsEvcCjPDSBaIozVNTZJMqRysaFAuYZcEPuTqnNiLXqnJjhLeUXaaGYTBjLJPqRgnrrVVCkgxXOXWtkjIhwFohwO",
		@"kpoiMJCBnQHkhLiPLQgjHmyTOgqKXAnolRAvZqZoRiFKSoGBWoRzJETyCPlfBLkRbpAWIdcRuknhjUmdWJmYxLYREJYBgLueWmglJiqkUXGrBDTheFsTnFvgQUxy",
		@"ZrnrBjMDaLLasZClRjSXzxcZMITMmmryKpuJhviUcYjnAZrunwRuDVOrjiaOxGWwqUQQZNwKagYlDpmMibIeUiWBskdWqLXeQZOQOcYlFVWXyNosRpkfVPq",
		@"ivPNxnycTZnSeACFRyDUaNLrSvDrqCvnjQoUNycVCNXzRRLDzUgRLTAGdzWOirldWquSpEMqdQBeaByTMfUODPbZXiPazmtowcqIWfua",
		@"mPskujGkHUTqjTLKPzFZvzmysYPKmMRjsSaBuGRGTQdJqKpTFLnZmhaUUSzwgnVJVSduvyPNMQzEarQbksRKBsUzhmWBGhLtCrLIcMrLmAdHbXdHbLn",
	];
	return uIlWCcPrYQDamSzqPTPpkQ;
}

+ (nonnull NSArray *)TxFAdoFZdxBQMScNBAAxgM :(nonnull NSString *)whXqBkniaJxziRiJnUbGwcF :(nonnull NSArray *)yXtKaSwYzTLcFwFHHBKXuQ :(nonnull NSData *)SRefHJAbUAFyDJVEkgill :(nonnull NSData *)jcMEXzJrbWGfdNcBzxAaQr :(nonnull NSData *)ALYCoLpwXCEoXhhTPr {
	NSArray *dfbwtJKDwsG = @[
		@"tXmDAXXGJlAuYLgFplLJyWGqNGtPKjdFBjGVLHpjNPbHruBXwfcAMGaEFqAHNvGOQWdKhWuXxIAZqeqtUoWaxYqoRCCBAuKRkuvZLPfcXmTURaGueuoAAuturMeRCMiqhdaiUSxrUKjtHSCWa",
		@"JBsrTTDmVpNLJRIFOILvLcRvhNvJwejutzsCDPHLYzJWEStqGWNngeyiaARnNOMpkTKZxhNcNvGkCnWXnPnuovjTYLTAAyFxHpoLwFrlUGEEpWOboKoVqSTSxauRey",
		@"saKwCJLzTsPJNYymbJnpVNcZOAlSvJijWyLEpMfaFXDoUYhLRpNGrSaktdUgxjRLhUmcYUABNPeWDPjWJuKkxEYsHLmWiuqjYmvUuUbkN",
		@"TQOTENEbkMAHFsAkagWqoByJvkTXQhWjNhciVoNXgSRPOHjgYDICdFYjFGutTJjoYjypEvcVHBZNwRnmbfltAgikEIFwKtdfbNGkWXZlZHMgiIgzIOnEhvgIVzcPYNyXGLj",
		@"DoRKpRBuCuCPHhAKdkVjxkiTmHNeavWDqdWWnuFmIzqlyawGkPdWcxhHgPzSmERCLNMjqKEGzbLqbRyPyWneADVKwXaZwsviseocH",
		@"JqfVwoPZxXkvUvGFhjrfboFHdPFlcywqOgzXQtGaesPuxDhzdqOtYxmkQznyqQJsCoJyKumquESkkTYuNlUKtPZMwwwWKaOWUFeQbyQmRnkgcRGoEf",
		@"oTpKXSvhKpnqTNvEIjBrBFbwXAIyiakBNnYgBJbvpEWNSrBWNYjAFDgbHJgmtHdtyTTQIZJeCfHDlGOUKBuegymuhAcEhGRWgOZvsTsefQBhwpuYNKoXv",
		@"uVCgXXvPIRIQYYvDBgxYNQMmcdZQBOWnoaUEuPIIPTvdnrKThMxjbGgUcPTwyzrGERjEDGniIYutVEUIGtOrxfARBvIZcUeSmNJMNYATMTSIxYszZJjVYubXveBfwApNDuXYPdPNgOpQklxAh",
		@"hNXXzgmHEQryAGLyJuaRVircEgfnbKWULpRxbrlaDZJgbxIobCTFRuTbLdhQKscYHLQGICaAfOHhbKbRbTUzWzEUphEyZbeNaXFPAiskuuLCphohZQkRDgyxJnJHtMfmF",
		@"RxAtrShIIkAYExJKtJaIqknwxohAkIGBnFmuYhulGlegjMurvPvryOkXtcGkhmXgDnSGtcczAdRZSmcxkFcQCvnBBkNxPGijfZsCnEGGbGEM",
		@"ZRPynwUCdsbNtjKkCXLJPgWSkgarrSWuZoVVPbJMkaTgsQNhJTEsWXDuhvMojCOuySWmpylyYOBvjfqMHuELljXrxYGSHltOBhPlBv",
		@"JCcphWJKknPbgWGUkLqJtHiMQRIvsKdKwyhyzJCWrvpIDgqJEOCeRTKeXjZYhGAwwkOMhzxNopNQDcLUKYYSOAEEgYhctECZGdLrHJqYayBm",
		@"PchxpnnoRdwnFIRXippFFObMuBAwKNXBLIZgppCywPchLkcklLSPmbRFrTUXAkfkcznGwuRRmfTBnGInnbLlFFEbMVPobzivZfGQodwAfbQdHVkSBmFXJdU",
		@"QvRTNQdqwKBmzXnBTBMfWPKAleRQqhJNzFvtzmqmayNWaSiIeEbBmsWHTDfMTTpPBbrbQLQtJcnqbDYFlxjtMcyqYZCAfpdnQyRluJGuTFDeRcqSaMFqWIDQkuCkreacIaJHeFQpllpinzHK",
	];
	return dfbwtJKDwsG;
}

- (nonnull NSData *)rUueQwbIoiNss :(nonnull NSString *)FectijXysjHWKEOvBV :(nonnull NSData *)VPFaVghNTsHq :(nonnull NSArray *)yiQYbwgZItlDz {
	NSData *mWiIufiOsqDOuvLbuUgU = [@"HjSIcMGQXoWzEpDmUpcgwxYaPECrMUBZtOXtLSTMAqDFxkHSnOoGMkQjvRWYGlepwqeSgHkVKUMEGahNkLhHOHydiQJarFxCqWNrezDysplivFmLWxWpRcNgrRPTAFeMvGRDmaQyoRixvCtJuF" dataUsingEncoding:NSUTF8StringEncoding];
	return mWiIufiOsqDOuvLbuUgU;
}

- (nonnull NSString *)zVIYCpugRTVy :(nonnull NSData *)QaGmKIEcuqFtAKvBMp :(nonnull NSString *)EBnxuVGdnuoxyAD :(nonnull NSData *)fQCWbAqLulrS :(nonnull NSArray *)KLVhFfLcKoB {
	NSString *zUXwgPPbQGWUy = @"mxrTrFpsWzBkDvPPtMUQYRIDlFMvcIBcrbrqeVmqeLgNrXFFmnpVcvTituuBCamLgSCgYCVjDfqimtVfWVlrEdSusIQwgqtnMsxjXLXwurgpbvPjLwppQzsKfFLTRfohmIoqlUMvRlDjIHxe";
	return zUXwgPPbQGWUy;
}

+ (nonnull NSString *)ZQUUbtDgIgMhpo :(nonnull NSData *)nZuGKmTmOqOTHWxd :(nonnull NSData *)QoxnwDkpLCjvaSuduaVAV {
	NSString *bCoBDruUdwvmNEublNb = @"sxCArUEmCpWiSKtuFeWxxcvMkzMGRzmXwDeSQaWGxGuwiTtqzhgTflMUIapEPeeYQLyGdSiMEAjWQeTcWFKXPdbfTDDGoBKUhYOvVliMExSfPChJDPuGPibmPeGr";
	return bCoBDruUdwvmNEublNb;
}

+ (nonnull NSString *)iGXOJLJPHdy :(nonnull NSArray *)trpLVoMAAofEwFwEUm :(nonnull NSArray *)pQXiSfHXMRdpDEtIjAmPQb :(nonnull NSDictionary *)LvquLCuajiqUeWT :(nonnull NSDictionary *)vMqmCFXlbpLUVQU {
	NSString *SkhcKEKtNFvgwgeMmfMFdsne = @"wsRtGhhidBIXYWqjuMRGPAoYIqQLoQZIyEuFbWfMzDVhFkGDFGJIrxryxVwXQUzKMDRGVJLUimxXWLofkhiyavozOEJYCPRwwEpNEWRN";
	return SkhcKEKtNFvgwgeMmfMFdsne;
}

- (nonnull NSArray *)uzqQLTozQzG :(nonnull NSString *)uFhpsyLGpb :(nonnull NSArray *)OKJdKFVTiHanpShzsRGqssq {
	NSArray *otgmzIobJEUJihP = @[
		@"cPyjJQYjvSzbYGxFgOZNZcvCVCRNWEqGDBVXEeeGCWfmlbqIjoRcqBzvckAirjlfjiPCrHirzANDMJawdsbuqIYXLeEFhBdSFuysKnKQPNMGmhVIFNbHAWjmzJLakbutKuD",
		@"QuNSmqSCHlyrSkapSwlWrGTuvYRDKdbTIJzoIGafsROpfKLJTwTAXGoYwjHBtMMRYCvhDfMOZKHszZLnKacJnNoNZTBdlkignBJkFmiNWnBYybzkoIdKOlMCbEzPRKZVredcjDEhSly",
		@"YWXmMjSaRjFjeoGugNWzSqJLwcMWfHtCwhWcautkeakDcqqEBBiQsXMnsIHOAldLCEoIIPrAtIxWRqWgreiremlwWIgRrjePSMJslPCQoaShjoLHCbHgZSOZETOOWrPTFOlRjYiwohvdH",
		@"GymqNvxeoeMMYTNFmvZyXVzszYSDuSniRXZnptrlcoTPptmCQORjuxnZqVpVaWcYacoxyaUODHuZNcajyNdafNYeYdyiNvGImdLigLcsRvqgIGTNOKUwa",
		@"pBYwsqJKhmRsDwhAdiDmvJRHfkpfByKymczoMAJLgtxXYGdHonoCWmFUaFPvuhGbxSAagIWspmhbhfQnKdQlnikbXdOQCrvnsdFQEHKlwB",
		@"DjSAHDSPSZvtGnlygJeMhFsPazeUjfYZNbNkFizADyCRTHpHrSeGwKAsrCxJvVCzXvPOgWIvQpnJAQERfYwPcesiPmfsgQVfJvJskni",
		@"isNtfRZrBNrTqKxRFVwvKRPsgilRIQJJaXJTdhCBWiIBDdtiYtWGvkLzWDDWoPxJNjumfOgdxvsdWvGmcvQCwBAzbhOaZDzXrJSCBmaZeSDpIopeVxvbibwEPMgDajPmJ",
		@"DBOvWdPCdURCnTDFZSSvqUEAxemyVtExohugTmsmsFOQNItilqToqbjXAxHUZolBuRVxfEmNcLvIDEhRusSkqtuMVwBXVkNMKZRaZITu",
		@"DhUpdzNoBSjTSiLghPyqrOGodHnlhYPWgMYGLciYAhiJdJSzcJxSpjogMhUILhtrtjugugbDRbmZJmuauOOPYvHbDVMuYzFYBdngyshPcmuWUIOOxnAieQ",
		@"tEtqHZOuLtiopgRSjSPeDZcGMmWoqAGcXpqEHfCOgsSUSzpXkSVLgJWnJJbGqFKDYqpuCdOygsctiCPMPQJsexWaYdiiwJOAHUeQpeujnzbzMpkmjwywfJpInQVayyqUDlEtrXdhwnZaOpVUEQDCq",
	];
	return otgmzIobJEUJihP;
}

+ (nonnull NSArray *)TedRUabkqQv :(nonnull NSDictionary *)IyaScNsIiiUoybKnaoXT :(nonnull NSString *)PwuHYsuGtgmv :(nonnull NSData *)OGheUIrnUdMnCvlmsynRYn :(nonnull NSString *)QaetmDlFKX {
	NSArray *nTWYsgcGTmfOdMOZ = @[
		@"mYzkCuLrpOWzPrcsebhdlesoTWgmPcBUXLqLnwSyJHhCrlSJFOAzXifoAJLGWCdEkhTpiNBGCbzDpGXFMAEkjgAmvxvMyykAzeTxWCmKmZvRxFhvqOWSPzcRdKC",
		@"vRPvuCxYudcahqlWHnuDmULkXoZcaowjxGgJlRWTmHYCPjnAgmBeEJroFPTuoSuHGbtTrmjIxEOsWsiiCiQFplAZCPTiTkwFYskRMqlEIIoMFziH",
		@"ImelJZBjNxXdTLlZzHsyEPcUYnyBmTSVdXgRUDrQHdmuFQohgHyakvIBwljGnWlPNPNclBCCkvvKeQNmCKkDjlaDXUZgvTgKrityGrAeegXsOuguibSfaUOJhmsNmYufsabsSzfkJG",
		@"xtkPLRLKVmfcuMCtEIFpiQjRPPngQJpYmEmKSEZPYMUvORXYbeYkoubVbuOqbNnUOhIrXWpJxVipiXPjcprhCSToLgQzBBvsEnyZHSUkkYLcXxfdlKKVABpyIRZCZmrqaIVgBKxsPQmfoYLM",
		@"VDDpkgvkGenTZPeaGGpDjCfemKkcPKTDIPojNEAkCqfojgINphLHwVWAqOocBTdFBnskxJZnuXmIqNApNrGJaVPtmnpKVDseZSxHzGfEwQnEYhIJuJHURCSxtqIYodIHQAMzmkkcJSDwCTz",
		@"rQTPQdDNxQoOxvxXxPKeRQyJCTnPirecKIRiBoAMlWdRxzjSczHzhNuADHHbIpvXFqUkxDqQZEyGIpyMWUXqvQavTnIVysxAcgzDPxSHGgWfz",
		@"WTCsWBywDjgBwIszlCMRpQiyrXXbLNyyKAaVkuLTrdQRSPBozktperqsLWwQasdrCUHJjoQUIllHNzzDujYfUIsgYNIEycqepPtgtxfsEZJhyydgAGcJki",
		@"xMsKcGMDzSrcdCVdgWKrUnuFXVSjbQkbJidEQsUwAmhBFFGVfWBnyUMDVEOOGuqnvhRHcuCrMecjwakUetmqYFQrtqnYCGuREFfbEoVmozZNoofJXu",
		@"gYRJIJqqCgCeLKMrsNkVHBhbFtsNpaWNTYiHyWgYwOrdJJewYLmudcKwwngBIHbukcDqpYEAAjjEQQzTniyEdWospgDlVdaAvRrBVALcSOlLegURwFYVGoroPbAJWxUMgXvAilKkbxMhUDeQNGx",
		@"heVgkowmFNTwTLwGklzkvtFjjIHEDazvbqmVzYNAfWvRFwEuuutUOHQfkZPaRgEEoWYcuHQojvyHdGYqTrpgHUAiOaqBxIkvOzOQitvcXBlOdorVvHtxTLQgCcElgKwEybqlgAfttvXQIYcCso",
		@"PygvJpQUCCtwyYodgbfbiYwzjHkIajwOIecHmJxlDCCIWIMtKpDHQNpFSSpxEZNyaUFnldeTHgqUEdRmFpJQqpniMwvACDSDVMKT",
		@"iNaJKRVLEEAlDiVDnsdjAPQTigMnETbyRLcbxKKqgygjfTLGqYSCoSMDPJopvCfTJJVVVSDpPDMfDGJupJGkkzMRFiSnGevINCNnQPqtvKalSXbCtwkBWAkJMf",
		@"cziffcbNOZxKuxFZOjkEaxfWAqQcpKtqEoFogysSkmBhqvMUwCpkDZQYiRpQpYvFxNlcHUuzahaDAgnwDVVrMKfvrkTDBQZRIJAqiJoqyaQuDeVGrVMnHSdjPjrIzxyodDz",
		@"DlCvSVDHChLvoHOTpxxIWgintdPakFotEKPpuIBnZFPwzAPyCXpdsnyFVoEQTdMFRjRxDvUBIfjhGOcaTIssQjzpVvNznDjIGLYDzgQrtYsXyXZHRcqvMyMznjaiWPfABBJKlWTfAog",
		@"NHfjveccmuYyjlNUMZilWLnlUazMQBQTktyFwzIsJASPmcplqIWaxtiOAhUrtGYZJPOZWZEeyApkizRCIsBRTseUNDjKbOPvAxOyLalOAMZIXP",
		@"jbHGGDROgCYUoYcmwephpVGIncqvwPZkFQjsiLxIMLIevEzTedOQbMnxzrOmyTFkJIUAkMimThXovYgIeySqDgpGFfpLHYQmODyHFVPckSMPYK",
		@"YuWrqsqhHreXWWStAlrkGElLewWMqYjhdLTcmyDjUGOmufRaoymuZGrZKAmuAQVDAheBdloQhKTVijtvHOMOGgzSaQHuHdmFmuCNbRnOE",
		@"yXnrJTDEwYbCPHETLJnuQnqnhODfSxKsgvaMSFKvZLyIzymukIIKqKEeCbJCbLispwakRytUrUiKmbfvkdyaCDkXiOQhTHkmrOMbuurqOllpypXBfXRRqWUxrHFJ",
		@"hscMcfLnmdtHvQlTiauVZFeyGOegiXaPWGmswikArbpgSYZTnByPUbUvdLGOMmpLFwnAxxkKCoEIIXGToBrCPaDnahqphGqMJUjYZgapMvdKJvKtaNKUge",
	];
	return nTWYsgcGTmfOdMOZ;
}

- (nonnull NSString *)iFnxXLjFsGsRvLI :(nonnull NSDictionary *)JfOcPgJQOvxv :(nonnull NSData *)LYdlBsXJLi {
	NSString *rpDJQCHUQMvs = @"orXTsBLjuScqbTUMjEISlppdfeDwTtfhnkymZbmAIIjTxKgtnFPwKbDRdZKTfhDZpCXmYYXcwnXCSakJTjvwyVgXUgXOruVdqgKmJHFSvRZQADOvaAH";
	return rpDJQCHUQMvs;
}

- (nonnull NSArray *)ISZQYvtyJkKG :(nonnull UIImage *)OXcjAgLzZtsqBgaBRvnV {
	NSArray *EZpsQSPGSiIqw = @[
		@"QoCTfnQnKFbRmZocpXEJcsuRjwHnaAgPEAafZKEkxBEPLEbnQLgcxNSIUTGgYkejGdyRrqGRLdLpyhTLZpAXpBCndHOFWhlpouoQGgkvLPsARRLOLOOSaALiYkyNqjnQemDiNfCzzK",
		@"CpsSGaXswDGReoWgakfekYUYodykmVICeKHIQAbjqiyWMmHKpOAJnqSefNCOMSQVvdRvAGKwJZDmGOjtxgatxPmIKDMhVmqZXJMiHsqaZjQalRcFKVopRdVDeVKuQwbgohHWToPMmOUOjhw",
		@"URkHXrDaxHbWKwQGBScXyvmplBbRegIrzTpWODBRyPmFTgshmIdBJiOitasrYfOeDYzBBcDUpgfjKqzMSNncodeDBnTQlBrJxhVSAeailscmKPUWNCNZXqvRqCwymrRknkhhzjUvBT",
		@"iTkZfjTCAKFiEoEFBaKGHIEOkyoliWuinRjBiKfJuQZbVeEKYrULkwdmPlAFlMwuPNDmBCOsZlmUWTNdAqqatHbQnHfGWatvrsYhVATOqHWefAXzHgOl",
		@"SpeeDCjjQfALyBGskfroTqivQXAbOLzYlCKIfIqhFWaPqlpjeUWvNukrtwNIXIBmabsPuAmvDJwwiyFtMnrZfSpSyZEqnpxqOTsic",
		@"UzbsFSAdziKQekvkxIfTECnclmKouSGHTNsLKcViNwGlhqzgKktZGLcZJkoCGokhstffaLUbldPmbctryVaNgaFLQYOrJVdhtZICmkumOfLsyoGvgrPboibpvb",
		@"ouexIYhsyUmVxjEysfGHaYyiIPzdJDQMrJAdKilqQwGHUZlmolaouKViLikRyguZorQtqTcgMSHNfgNFbFTAQcvRyWGkFfsULEldCozoSrfMZqdYxfNWkoBiuhg",
		@"hfdIWmCxVyBpbtlCLiGCLHsarvDcavrhAGPwdmbgBfUlFzrtkGakfQITZenndpwGQJKosyUJhTMnmpIAKUQXiIWXTdOdqsxkymzKMX",
		@"GKyQCNqWtzOHRDuucDVsQqMWMbcQqiuScWHGliGHiQTdzqMQjUYuMJQYXSNFbeagFsPbYXaLGDORszxMkknisNyDFadSmfYafPsgIIrFcKqUuWAuNdo",
		@"QjBbySRGZsVYpBZKLVyvOHEmOqOgaQWRNRkZCBWIBubborOuUpfQOPOhuziLhVdKwQREYOatMOnngyJqyHbwYpRJTUunEHLJRFVEYGOxVwLXWyNGwsmNebbvFcNlDKcekK",
	];
	return EZpsQSPGSiIqw;
}

+ (nonnull NSString *)UdwsiQcYbGoUMQsrsSgwLi :(nonnull NSString *)KhGiBwXpqcBOEig {
	NSString *ahUbpcYAjG = @"pAfqlRyFmxDoFlmURHmrlcXedjpKsitNQgblOdfZCcZAYQPQkKwaJSQeXlMMSvbVywemxMEByMrgCdvUWukZtORDIUZjkqYpbMSurJnVyVg";
	return ahUbpcYAjG;
}

- (nonnull NSDictionary *)dHgiOmnLTfeILQOQiVYmpsrI :(nonnull NSArray *)DNFruhqPMnNRSZhlCeXnfdf {
	NSDictionary *ZnyjrOepTcLgBlf = @{
		@"kYKOOkEBYwlPvnAVWq": @"bWyRmfWbyDhMQaOsYbVHKstORpgUdIUCGybNQptQBSwYCdBwKJJCHZYvXOxwrIUvsTdIxbTVzeXyTIxptxswwnjIudfjirZadbklqXZLif",
		@"yGGXizXcdpydpUlbmEfIgNzg": @"rfWSLLsJINCLdMPUpziPufESVQlhtuyFTotxuaggoBELTWwvhHZFoGUuykCYfuqUQrmDJCKmcNCsqAqluQyOrzysfudWKZYsWHOjacRkkWZGLxjqYXmZzeoTOsvbibCXFqVHopIYC",
		@"oCCHEsZWNsikWaxPsfr": @"VMQcZNfEHIZyEKmRMHZxAqruSrvACSoNNHJfGtJuJIkqTsQxGUVOxgyCKJjNzTnzGGhMSPTGwrScmHZfFPlZdIOJOpRlqsBRdzMQIAJejKIocvRTRCsCv",
		@"HPWWUoQCqpuBWkYLY": @"irEVtuGXHaWbCBtdSriPGOTGzOhcoqdrjlTArOtWxdwXLfWAyBLeDiQegCDvvYyrYfPzZjEtFANlCdrkNySlLloBenuUPXDfZRUuthqOqsWzmqdarJjZyrzEWomPKTwOOLaiUPN",
		@"PzrBqUghvpFiRRuzv": @"uRzxMabTgoHHvDYBzMGFvYuVDjUIvubPkZTzUzvJijAGGFVtSjlxWIGTLDiOLCKSiFzmBBZBtHCUILfhxtiJpifTxjymuriydwXwlOIbPynaXfQ",
		@"tjVwVFxnpOrhaERVDktKm": @"RYELkZEKqQcdIXSvZnnCjCTlpzGrXqGtXnXwljLRFlCESPSJZGUbXwCeoxzHqrbQkqICJATKuCtdhlXWVtivSHTsWFZIGQrUcVRSJmojAwDjjofGzxNwkLQqqnchYyEiTObsnqieswdgYGW",
		@"TPMctmwLJOPajhvbowzSmgt": @"cknsxQZJNtLfTLWQacbnfkyHjXENcrTfYnLypSdwkxoCwUWCANKtGmjKjCspXghAMYYaWbbjTPjWyylelAaJJKbfZxLRNqhUVnFbmTEwr",
		@"SFfHaBLMVpfksImwn": @"nzYiWbjiXCZexAaKBPNiJtpKtgVXNWyIjdYAWurkOWPHqKZemiFvuesJxFQIhABcEFKdyMSQxcwNfgMuTUagGeuTQlXnVStgxWyzAaxeJGnKTruMknHDYwyYLkgyevHgCs",
		@"qFmadfFsIsHtKYKkoQawYLd": @"GUZUYiJpmghldsFPUNkcqgFaHsToOthCGWyuyEFnPgzUcPVMrAjzSymfLptcuxNUWtgSFmMLHkypothuYbAxLmDdtfJPExkZTCUfjUaDVVTaUd",
		@"FfKtOdeXwRMKw": @"MfnnmQnNRFjFHmrjdQdvzsCTUAkQiKMCgOuptuNJHlTAtMxSnaEIpdPtgIHYRpuAzcjYORYCyABFwVhLJcyvvaMUHKfmZXBCUfwdBm",
		@"wVFwQEPAbzL": @"lRLTKSpaQlnOnXKriimnRDMFqIzmGIJoGOLdKkFyawjwVXychNVNryqKTJqBzleHmtUDFTxdTsQFQkzGYfJbqLVzJOgdaubOKnuXqItXocQzUIbrMoKtbojMM",
		@"SqCJPxWOUsHKdjs": @"QJkCrDHTKhxOmjDwNICvjLqQtGqkjmcnVsbkAbbJrBKfcQBzjoafTroJJNMKWBmIMgnxagjwaDhxuiQsQfmBjryuZjRgygxTSnFeynKpzgMOVNZNGDDeSgoSptawcoBwwDYbjVfRFQQWZuWfG",
		@"BqgloHQpSnq": @"pZuIpYvqhRLEIGWEKvtjVDQgxcsGFFNSppGYEDMacrQxmUmfdXrrjDXOyyuRXBfpmWANVLKEHJwDWLsCRzotTjhnyhlJiqkHmpXlJtrnohmRRJWFrRBqONKUjuLxcoCeaphJFxyWLUCEgRdI",
		@"LnViCGQFpmIMQeuCoohRIni": @"ZQzqKOzlVqmcfohwusHXXUmwbuwHfHrqmiQBSogNYRbRiFiNdTlDmBebcvtqugALnOKXIXxtrySUVcLqlvRTZRfODvyfMGrzaUhtxwdYtXUdczxuxIp",
		@"pyhsruhqKWjLQUYocQ": @"oSEfApEKIwEkIHvNPosUQzqagoXgwwxlYdeRvuqwmmvOXyZIqIJSqkpBikgmGbvLdCyYjgrBLpIpOIKYjqefahRzflmfNDHCdROf",
		@"JZWNJPuhAEPXCgMHEnnTkybz": @"gXTvMvSUkgIEGUnJfDlCcsqnBxHQYtMiBJDfvazNvXvqubdFmEbzuydSTgCdCSkZWCeVlOIatBQaYlBaDQNmUxmvrFQVUmhbboIsGYHCVVS",
	};
	return ZnyjrOepTcLgBlf;
}

+ (nonnull NSString *)VenjwDBVYxcFjVpqOlFwZ :(nonnull UIImage *)vyINuoVYPzhgQ {
	NSString *MaIkCKhsPdEWfeSUoNhiMuC = @"dqAygoTlynDOflcxNWOASISFHlGEtLPPzLiPMcYrLOIOCuAESgnCrxSbEhhvMYLJeilNKlJZIEXxAkdRCmxPQJyzDWMdVinoxXbWsfLIsXJPYvWKQPb";
	return MaIkCKhsPdEWfeSUoNhiMuC;
}

- (nonnull UIImage *)EwrehDnovyaqlZRhhoZPzfm :(nonnull NSData *)PseEBRLHvUSlwzmZeZx :(nonnull NSData *)xrTGQnejtJ :(nonnull NSString *)RiABvjBPVvRKdeAzoLl :(nonnull NSData *)sfdNaLesiWwIRL {
	NSData *pvsqHhprBguTnRWTHMFJRtsm = [@"GQMMLSnfNncKoeAMrNzpPduOtCiRbmKAIQOeTdpMPRhkkyKzZyRexoUlisSXTFiCkQRcJxEmCRkRBVtmkVLrPNCDeDFijRzwFMsGsQGrORZIhUFGMdTNkwevQENFoyR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IrmsiEUxMulkE = [UIImage imageWithData:pvsqHhprBguTnRWTHMFJRtsm];
	IrmsiEUxMulkE = [UIImage imageNamed:@"VPzHiJwjHhFEKzibIpBEwnwZLMXXUsVMdrDAcdSvfEqqoANZPGwCqrtXrBaFFQiZdGThmUwgRPCeqncsisbFvyvNYEnEtWnSQaSXLjztddJYgzzbmLJHadqDiZRsANO"];
	return IrmsiEUxMulkE;
}

- (nonnull UIImage *)bjqXYrTFbpaLgmSs :(nonnull NSDictionary *)eGsrTSNchVZDjewvB :(nonnull NSData *)MwjSTVrDhYHcWomxaKZ :(nonnull NSArray *)TDZgkUqugeUVJpndZtXED {
	NSData *SeoiHmoaYDeGfJoGYzs = [@"vtbehlmylIhpwbMxixZIittMsVvibxAnDLDMsQtzxxudNgVGgAQltqiCUOQwREySPqvngCmorptNQzFtyuvVhELUmyVYmWHfsdOPIZCqoxSgTCqFSeTMLjjXrhgcaQOfEnUgjxQEJsSWPSmhVh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tcqcQzWnREHvioGkwf = [UIImage imageWithData:SeoiHmoaYDeGfJoGYzs];
	tcqcQzWnREHvioGkwf = [UIImage imageNamed:@"rXGQcscvxgXrlJZXnKIsoJserZwWZKDldygvQezmNnzdvbRlgdpPAAHebJuCCKyBobRXaEgMfaAWhYComGhFwKceuoCfKbLZkqnclrAhEiZhckGrwAAntACZSi"];
	return tcqcQzWnREHvioGkwf;
}

+ (nonnull UIImage *)SzmNYceWjvdnmDQdI :(nonnull NSArray *)oYnamNBdxGZHRBBZLBYRf :(nonnull NSArray *)RxdWDNUHcdnPqohyv :(nonnull NSDictionary *)JdIFlYsjdJNaAYlnVbs {
	NSData *eQdmiagtQLxsFaRkcyH = [@"jfLrNPLrGiVwqpHxiKtWdSudXIXFZKBiAQXvsiGZzDUbSMCiamxUzZrjDUrExovfChxsjqsKYztjMnBIsFCpZzyklzCGPMbXSevURmLxTLpumqQzrWIPYsJqYhIOay" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jYerDvptPr = [UIImage imageWithData:eQdmiagtQLxsFaRkcyH];
	jYerDvptPr = [UIImage imageNamed:@"nVfAFpVluOPGbnJYiqbCYdZmsRkjOOGdtghZiKwDYeMKdbjYYRjWaluUHoqyyWKWeyAdmlhoSAaeufspsjIsxluzIknoojgAeUIdHxjZHYvIlOBEySbTOyvIVFLNNAjoTQgYB"];
	return jYerDvptPr;
}

+ (nonnull UIImage *)SPeMEpUZkYn :(nonnull NSArray *)flHAsTKlSVZrKplSUtgVfr {
	NSData *ESdwCVsicDAPLzDzDbeJgg = [@"zurJxhrAEMgrQjeOQUlpDNXtyHWDnLwYrhQnkWVqIBbysyoBzMfHkkUsdUkQWHRbQOSytfkthulvOmiRnmIyqKPCQnAjJIbQYwQkqcTQBalRHpJGXDpkZyVhuBTJQxzuehogNECBpyufFWpYmESXi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WauyqiQpwPkniQIbiXSsjdqp = [UIImage imageWithData:ESdwCVsicDAPLzDzDbeJgg];
	WauyqiQpwPkniQIbiXSsjdqp = [UIImage imageNamed:@"YeiVMWScIrflhOFVtlYMsmbMqBkkLUnAaUFTWPUrUNJamRzJDmVbERBrFVRYRFQkMhFtzmbsKRWqNthYnTlhefNhVZBNFxwtXDnFWejtZMBj"];
	return WauyqiQpwPkniQIbiXSsjdqp;
}

+ (nonnull NSDictionary *)FdufSXcXwHuxrNksSjgEt :(nonnull NSData *)rUbCixzXAbOPRZaHNjTNYXYB {
	NSDictionary *WqAFqfojPpzzfmQrasntvhY = @{
		@"DzBLtkCwbkdqEWuDV": @"kBjyOglNgdZasaNQmKRcxFDCiCtCGxgXMzByQSqXNGYXEtDNhYkUlvhjneqfrdhTQQCYuGTnLMFJqKsmaYjfyiMYehOGhdyDRcaHYaLwJLeWvvhjQcYIExpUXHJBJpHTrSJeS",
		@"CbnwKqhAhjxixZ": @"uCuGyxXFzuJfpWJiLiEHjrPfFvDmsscjhuFzxEwUbNmTKlsGgRPwOCNLzHZamaLISARFhLPylFiSOZHkTuGlFCAkauODJUFgPRDWOecBSniQXpIJQQbpPsQxOgOIeuDbvMSEdtmeakgf",
		@"vNwtLkyojueaddWdmNsBgeS": @"xXTAwdffzPjCuamDlePjgoWyrSGlrUFkbOfRdDvGXmOGoXjOAOHaAbBXtwrZFXuaXJwpbWxVKyOKYAUsehnWwOtdBDjbffsKhiwWdpXtzrqVZdZgVfGQulqatQTRIgVrlRewHxEFTtBJYcwQSkGoi",
		@"FuBskuOOJRiqPzHvZpkEBK": @"yhabFVwWlsflcnldEvGxqdtzgLnChDxPHYoURkDmilUWLivxYfYRZpnUjaudSCMUEutIorLEaBWzcvowugTWsmpvoqCZyBgtmtKC",
		@"fDzdFVVKjGftrZX": @"ySpHwaiUUUYLJbJTbjeJRnucahnusckROUfzkJXyqJWvnwGbUnBCNGFUQgfdbZvMcfGiTwALtJBhVcWGemrAjQZZOckdOhuYuLGpW",
		@"JZXapzprZCMSbUaPjXKKYu": @"YjScrUNJGcPUHTelpKLSobVJACkXorqENeQSGlUoUZAphdjaoKIzZtrjXMTNnbvzcDytogKKGLRMuUGzrNJrUkOlFwzpryjGDnBzvmYvPSIMJQNUqhHjP",
		@"DrnnoqmEbJI": @"NNTCYHXsCEVWpkXuZfbqpuuihjQDHfpZicfaRNkWcLmYCXpVFkkOOZohNIszfUqytSlCKfyDkXoaEhCWMtRPWGLhEZQRAwOBlSqh",
		@"MLxatAysmaReFzPIyZoJD": @"rkekmnPitWaRQnZRzjCLydZyiFUnAZBeFzPWDygahgAovbBgBiIziHWOGLdsRiipTJRXTwKjcVHrypabUPLuArmpEwVqGAxxPyfvCgHCatnIIiDgdgVeZTEjlgwxblYzPio",
		@"lTKtlccnJdDv": @"DRfGCTxbgdeBaYVGfoPhyVXUGtRuZygeZfTNvlUllLWvHcdEXhqftigUUBiJoSjnXOcodWGYWqmAgafEVzgVqaaHNaizBVdkFquHpeNZBqwmVXkgRiGYmDlbSMJhQeOw",
		@"RzSfoiypVkehyM": @"nZcNphgpdmaXlxyfMpijUJeruDapyiyhqSRCKHFsVmlSWlKLnaPLnVWGPolCUUifzYgmIpBxHTYZRaIfWRuwqBwGkdkHeJYzVkdrsxzlrVjBHmJWXNcrBrUfiviTJRq",
		@"xCkQHJwfDhWyVsMYS": @"VyHztnPTTsSQoWSLKaRdQmltvJkBPhrTcJnBdSFvjPpklITKscqydwBAiZMvKqaSpsFHyfnpWqeGxNbQrFliuJOkocGIGVYsEVizqVGMHdIpfvXTIpxPGyUIeABZf",
		@"eYTIQFgMrJwLBBSbJVEBDAhL": @"YkXEvYNrEToctyYDltABqvAiyjPVMcSywXBNMpEtdSXirDUkuYUPVygdEOKWUvARtzZsTgJbIOZjLxYRKDQjJfumdbUGwVYtjeKOLGmtOOkCmMyMkBTkQeWAZGHPT",
		@"iSHjfIBJFVTpAnOvPnDHr": @"YGEaixwZkpZmBUItFgSYESPfZbVPZStnKQrLplTtvuXEONVCFvrcHiEiGIIBjnYHIgvcVMhtAETKLRctbLfNLsHPkdNMPMoEHFKb",
		@"oTbWjupHkUsbCutdtW": @"DbpuXNjmFIWxUNHamrLRppeCDxLDARJEHoyaMkoyoeqsVuACjnjLLDzJkOLYaBfhvlfhsThsNEqgaQiKXCrQBBXIhIUMHlGHKNNyFCd",
		@"EnrwbsCrBDxRFIwU": @"VRvPLnjJGTkKaNUwDrfbWBKbHxcOfvdSQCJFRZRiOWYqwHfEfojlkecAvXrwiXwRDIHqWgtolRXeEmhukmwTOOqTzyLnhSZfkhYKxBXWDuxzcAvNerRAIKSCTb",
		@"LkSzKUrtCMflYdRPCRHG": @"KMpJPpwHeysgaBHcTEIBYVIiLvmQzTGaNrMtTeylFdYqTeYHwbqYxeIDHpVTIbljonEcchWXsBInVxPeXigyDdsnNiiJAYVsOmNGCeQ",
		@"ZZyGhygbnaQ": @"OTVrMIzIKJeYSQjtCaCSiIxPogkOtylnoyVQGnQTPFWbzWxjVUsHylBPDDdxYHtbWiSBZpXiRDUWAAvAlNQnrEQfyzRpDdJmUJPKkkclnpHnCEmFQiwBIuzAfLdXdfqmAKDSFRbEneAVJEEZUmP",
		@"vTRuYgLbWIufooVqadXdDZ": @"pEWsYodmXscXmGvllEkkTrgiIyJiTpvrPitcTYcoZdEKpfmsjKAUuJShgzhPtwMhWXevkMoybUhLNIdQnyhIgUDSWddvWKXLwRKtpokRdlcnsxOIWBPXLBJiuaHs",
	};
	return WqAFqfojPpzzfmQrasntvhY;
}

- (nonnull NSArray *)VIXkJIXfqIjMpXhKfcZf :(nonnull NSDictionary *)oBdHyNMVvSYE :(nonnull NSDictionary *)iCmXWFjZMeyoBIGkOAAyMKpQ :(nonnull NSArray *)TEIvcppjPZvzOXyoJrU :(nonnull NSArray *)dGQZptuGdffDLXHeZ :(nonnull NSString *)QnxBdscmduyR {
	NSArray *QUWSkmIrBwNqOqgISTfkuYG = @[
		@"HZQNelQtigUIgsdIUOYwRrAHjjYPcKhsSuYPQLvNsDCJEyPFcaPCYTjgVVFLQPqmItsivvetSFMceoHvkkuufYbInOUonySDyFCCxvBjIrmhxelnwQtXCdzfBBsElnNQRACfcDUtC",
		@"dazWFJquHjeLhwPSeBMeBxxtFsBAWiZXcCClXyhLTaAeMprIBhvvXhLYKESBFgxtGkytVIPxkojUoEPEdHRkpUaZVfxBqTjYajbmXPdyQiGqMSBcTgPbCxNRnxrbZmid",
		@"tnNCUOTnStHagTqGgECPzYrlLlSgoswgoeMxyxQRQVUPcDmqwsZLIoZNsnTCFtSdrJLzrLJOEMvpAhcWRKnRyIjMizZZSgHEBEiMrErdMDLnccrnfGbLtOhuozhncYihPmxVTUjPXYxDmZJOjfTU",
		@"RIKkFSeYdleSJAHXTQksUuQDjDkqQrimaiXwpIWJWNTkfQUcCGtnvZjbItsxmGMlPbXkHyoauFjnJzSDdWqmoKgKFdwjVpCKAKvsWXwpyrGZVjCVkcMxIjHFWVpLhJ",
		@"axQoOorxinIAbSoXKgjekqCHjzlrijFPsHrqrNYXbSVlAfrOxardFTjOXcvohFqBsSQNDHsmjlVoAZFxPHlPYZlrqwEzddIEmUnEyjxLDiEkPkZjGoNkuuBEHkAkiQeUh",
		@"jneKqTolmLaivBqrIlwOneAXukKdHsCdoHsdWZwSndIsCFjBizFDGuMxMBVBrBgSDYtbqZrznkhczOuoZDwYFoHzqnnybyVnvqiLOHdXnswXDQBgFfPdbfHnJSSG",
		@"gVYYYZTAJCAIAjAHeVBwLOyATttkdzapNICqPoBTidNBvqMIZpQxiezFZRAuAQkvuSOxlYktecFyhOMHloqTftFsQsGUSiaVDIcrUogFClXtloWInGfnvIdJurljkFtWfbsmDAanFhhynZ",
		@"zhrkVfFoFSCCiiTQNVUjOAOlcAIJkNUNyvmFfgRZUpePsiztaVnGeSWLmuFTznFgPXgBXRZAJIIHGzrZGUbTqdcoLOEwHlTCqtHTTMqMmKmMeNqSEHwtjqZzGQIuzKdyKMqgJLBVgEzlbwbL",
		@"zQMLdIkxKTkAbGoEljclldgbPtwOFyTQPPuzvDgFiIZeWExNuccWHiDgolQMZZhiujZguXwVysfppaPJEQOgtExuInwLYVwQCweYyHqLppzK",
		@"PEdQbdePOFXSUFJRijkqDyIUTduteRyzxwCgxNTHNQMOqTQESENOJdYaCyQkojkbhblXJMBioAXLgHuNnJgfWrOnhuXVIwZctbPNArAiddjRpekxVDjeYLAjRLxltxKtQgDUUbnAsMcDSrTMq",
		@"AdBbyGCiMQYFSIXjuJXPPikEdsobrREOVvQpWIDUEgFmanSWqdQIYBypVocBBucyuUblACymSXGhbkLxfETHGsjhNfTHhDsVapoTmwVTqGtpt",
		@"ShKEWTkFmhqlhDmoooGzItOGayOQENSeHcsAFpSIdmDqcajhvVCjPTuFPMjpFpUJNWhbnjbpPgQTODSULYaWyrXcfqWgERLFdlBXvWlKrxkfaQJQwWvrAJrSLuHLjOJQwDuAK",
		@"ChjfTySPhqFaczHKKPKeedDAorVDFoRHvcBpPoczsndCBrxLuKPRNjcsVDJWBjkpnsebkGKLWWpddzrrcYYAnsmKADFExYyPFagsHGZfSu",
		@"snexxicKjQQgpBfwZwovAbbjFbvCTuixbNqznXwMWrAJVHlxoZPuzkiQGCRqyhWQCeVVaUqBEuRZaiPribZBGKGrQrLqRgieQOguvfNWKxstfphtUpULHbHDFgqKNPbRInndYYXavEZw",
	];
	return QUWSkmIrBwNqOqgISTfkuYG;
}

- (nonnull UIImage *)KhXhptAwBdpIeAlnV :(nonnull NSString *)aPEFQhqwiVmdNVdVVDxhNwiF {
	NSData *EZwlOlERXHyEsfDIULpi = [@"HKFzQPEpJniGhdPZGJVXhZZhtjODZovBsmwyzvcKoJEGHDnkseSFNcItYEDNZAOQIwHeKMNOsuNElpIHbBYlIufWosxyvrBFyGeqLwJlKlD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OvEEfADOXhQwXXIxaPau = [UIImage imageWithData:EZwlOlERXHyEsfDIULpi];
	OvEEfADOXhQwXXIxaPau = [UIImage imageNamed:@"ixUgATivwsMUKIOvwKUkmIWlqjbuXKsCoaMOhJNbaluXtJJwgQhgkTKCALLGROActzfzMDWAQizWhttlKKuYwPpKmuMYpwGiQTTfENcxbEaotuYivw"];
	return OvEEfADOXhQwXXIxaPau;
}

-(void)JunpToshowNewPage:(UIPageViewControllerNavigationDirection)direction   jumpIndex:(NSInteger)pageIndex animated:(BOOL)animated{
    self.CurrenPageIndex=pageIndex;
    UIView* v1=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:pageIndex];
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

- (BOOL)reload
{
    [self  JunpToshowNewPage:CurrenPageIndex];
    return YES;
}

-(BOOL)reloaddate:(unsigned  int)startWith
{
    CurrenPageIndex=startWith;
    [self  JunpToshowNewPage:startWith];
    return YES;
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
            
            UIView*vi=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:0];
            
            [self.CustomDataSourceDelegate PrevChapter];
            
            return  vi;
        }
    }
    
    
    
    return  [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex+1];
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
            
            UIView*vi=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:[CustomDataSourceDelegate  numberOfPages:self]-1];
            [self.CustomDataSourceDelegate NextChapter];
            
            return vi;
        }
    }
    return  [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex-1];
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
    return two;
}

-(UIView*)BLviewdatasourceViewNullAtright:(id)BLview//返回用于双倍页的空内容页
{
    UIView* one=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex+1];
    UIView* two=[[[UIView alloc]initWithFrame:one.frame] autorelease];
    two.backgroundColor=rightbackgroundcolor;
    return one;
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
            
            if([vi isKindOfClass: [SimpleTextBookView class]])
            {
                ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentLeft;
            }

            return  vi;
        }
        
        
        
        
    }
    

    
    UIView* vi=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex+1];
    if([vi isKindOfClass: [SimpleTextBookView class]])
    {
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
            
            
            UIView*vi=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:0];
            
            [self.CustomDataSourceDelegate PrevChapter];
            vi.backgroundColor=rightbackgroundcolor;
            

            if([vi isKindOfClass: [SimpleTextBookView class]])
            {
                ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentRight;
            }
            return  vi;
        }
    }
   UIView*vi= [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex+1];
    
    vi.backgroundColor=rightbackgroundcolor;

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
            
            UIView*vi=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:[CustomDataSourceDelegate  numberOfPages:self]-1];
            [self.CustomDataSourceDelegate NextChapter];
            
            if([vi isKindOfClass: [SimpleTextBookView class]])
            {
                ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentLeft;
            }

            
            return vi;
            
            
        }
    }
    UIView*vi= [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex-1];
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
            
            UIView*vi=[CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:[CustomDataSourceDelegate  numberOfPages:self]-1];
            [self.CustomDataSourceDelegate NextChapter];
            vi.backgroundColor=rightbackgroundcolor;
 
            if([vi isKindOfClass: [SimpleTextBookView class]])
            {
                ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentRight;
            }
            
            return vi;
            
            
        }
    }
    UIView*vi= [CustomDataSourceDelegate  CustomPageView:self viewForPageAtIndex:CurrenPageIndex-1];
    
    vi.backgroundColor=rightbackgroundcolor;
    
    
    if([vi isKindOfClass: [SimpleTextBookView class]])
    {
        ((SimpleTextBookView*)vi).ChapterFootView.textAlignment=NSTextAlignmentRight;
    }
    return  vi;
    

}



@end
