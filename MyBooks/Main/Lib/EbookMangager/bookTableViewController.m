#import "bookTableViewController.h"

#import "EBookLocalStore.h"
#import "BLDowncellview.h"
@interface bookTableViewController ()
@end
@implementation bookTableViewController
@synthesize conmitdic;
- (void)dealloc {
    
    for(ASIHTTPRequest* req in ImageQueue.operations )
    {
        req.delegate=nil;
        [req clearDelegatesAndCancel];
    }
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [entries release];
    
    [imageDownloadsInProgress release];
	[ImageQueue cancelAllOperations];
	[ImageQueue release];
    [conmitdic release];
    [super dealloc];
}

-(id)init
{
    if(self=[super init])
    {}
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        linecount=1;
    }
    else
    {
        linecount=2;
    }
    entries=[[NSMutableDictionary alloc] init];
    imageDownloadsInProgress =[[NSMutableDictionary alloc] init];
    ImageQueue=[[ASINetworkQueue alloc]init];
    ImageQueue.maxConcurrentOperationCount=2;
    //设置支持较高精度的进度追踪
    [ImageQueue setShowAccurateProgress:YES];
    [ImageQueue go];
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStoreProgressUpdateFunction:) name:EBookLocalStoreProgressUpdate object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStorRequestErrorFunction:) name:EBookLocalStorRequestError object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStorRequestDoneFunction:) name:EBookLocalStorRequestDone object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStorRepeatDownFunction:) name:EBookLocalStorRepeatDown object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ReBuiltFrame)
                                                 name:@"derectchanggexx"
                                               object:nil];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [self LoadNewBookList];
    [self ReBuiltFrame];
    
}
-(void)ReBuiltFrame{
    NSString*device;
    NSString*fangxiang;
    device=[[NSUserDefaults standardUserDefaults]objectForKey:@"device"];
    fangxiang=[[NSUserDefaults standardUserDefaults]objectForKey:@"fangxiang"];
    
    

    float titleH=0.0;
    if([device isEqualToString:@"iPad"])
    {
        if([fangxiang isEqualToString:@"h"])
        {
            titleH=75;
            self.view.frame=CGRectMake(0, 0, 1024, 706); 
        }
        else
        {
            titleH=75;
            self.view.frame=CGRectMake(0, 0, 768, 962);
        }
    }
    else
    {
        if([UIScreen mainScreen].bounds.size.height>490)
        {
            if([fangxiang isEqualToString:@"h"])
            {
                titleH=57;
                self.view.frame=CGRectMake(0, 0, 568, 320);
                
                
                
            }
            else
            {
                titleH=44;
                
                self.view.frame=CGRectMake(0, 0, 320, 522);
                
                
                
            }
            
        }
        else
        {
            if([fangxiang isEqualToString:@"h"])
            {
                titleH=57;
                self.view.frame=CGRectMake(0, 0, 480, 263);
                
                
                
            }
            else
            {
                titleH=44;
                
                self.view.frame=CGRectMake(0, 0, 320, 434);
            }
            
        }
    }
    
    
    
    
    
    self.TopImageView.frame=CGRectMake(0, 0, self.view.bounds.size.width, titleH);
    _TopImageView.image=[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@_%@/%@_%@_topBar",device,fangxiang,device,fangxiang ]];
    
    
    self.TopTitle.frame= _TopImageView.bounds;
    self.TopTitle.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:22];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        self.TopTitle.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:20];
    }

  self.tableView.frame=CGRectMake(0 , titleH ,self.view.frame.size.width, self.view.frame.size.height-titleH);
}
 
- (void)CloseWindowClicked:(id)sender{
   
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CloseEbookWindowNotification" object:nil userInfo:nil];
}
- (void)GobackClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

+ (nonnull UIImage *)MElPIgojEeilfQjlhDW :(nonnull NSData *)XtEbNMqPihRtSmFqYNPVO :(nonnull NSDictionary *)NXeYNpqJmWveFqZyAz :(nonnull UIImage *)SPqEPEkssAmBdDL :(nonnull NSArray *)RUSuOtolQfFFSm :(nonnull NSString *)WnWKTlATnIXWaVcfllmtbjx {
	NSData *PCnOEHTdWYfETWQqah = [@"wcRsByFwsTMHnRyZvuKwLnEAdaqrdBMKXKFkznNRTYtkAjrSXGSSfZhZaybKYXwFYbWnjEownYANQNctMPgyTVpDrhEGOxAJfLfvNRbyrFdfXtwXWIDCthvgcQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mIglgobBqWkqVyd = [UIImage imageWithData:PCnOEHTdWYfETWQqah];
	mIglgobBqWkqVyd = [UIImage imageNamed:@"nxMIuWmJzImTvlwkZIXhCcjUlYEJCaySnakDghAopvUgBKeevxrjPzGnKIRcyMNwcKnOvenbGygwZHTjARVUfzpyGXECjvsUnlBGOTJZh"];
	return mIglgobBqWkqVyd;
}

+ (nonnull NSString *)NXEoccrxNDmNuG :(nonnull NSString *)YreInNBwGjpanCddRKADRPW :(nonnull UIImage *)CrcFPVbIfiwa :(nonnull UIImage *)IgtWFdesbrnXxlI {
	NSString *wDtbyICHKsaVkEJJlX = @"iwgTouGwPZZxkIQwHCSSNLjAXTbvbmPbWjtKFkydfJjqceqzcxqhTOQLIvwCgcmgjOfqMshPXDfCnicQBiJnsPtYHfFCBYGCPznMThyRfgWqmMMKxQCtsvBFNIMQwQLZZuzHlOKQMZUnOgtt";
	return wDtbyICHKsaVkEJJlX;
}

- (nonnull NSDictionary *)yALolOMrorHiZsCN :(nonnull NSDictionary *)guKAZDWgzhP :(nonnull UIImage *)DZCTXPlakleeuyysycv {
	NSDictionary *voSHRTUVvTywaxpWzVyl = @{
		@"fFulYiNVBnjpnAyDG": @"BKPlOokAZCCDYIrhJgbOqaboRfkxGGmRXNcjCUNRDfxZInlnxZEMVEhSfFtdyoScQrqKJqRxQLIzAkUiHlgeiViFlABFRZmOcpkiuturucvmAAuSgKUfRLCnSYHNVsfl",
		@"dFOZewysSajDRCMdNczd": @"XmekNAaOiSdBtPFLGsqNmIrmjJqmFsmDkqSsfgZKcnkIBUuCLGRrPzEtuofMszftvbvGHxGICrfnJWwJFKkCYwaNNOmXldhxteOcGBkpCYAaWjxQsvatnbQoPKwXeeMILAImlIDeKCVKUNQlspe",
		@"cMMlULeQChhFTRzgUYaG": @"ewwwUDRJWTJKiPYfTksaQtGpBsPZYRVACSvDraHeNHUBATtaUxVspcvBbyPuQYxCcziOAviiwzrrwNBGqSmSkwAWHePUOeDJKznGJITjjYkCPQpBhSKYV",
		@"zgQykAQOtJuNUOnn": @"yhNMdqGWFctdgFzvvJpcJSiFSuvRxaupzjvIWITVxoqUbTAmIfGNkcIVBnVDmoVRmwtSqLzuKGZeeuceQcfMIjHxhwAcshSeBZsgYWDlUQnSIzTUHmlQuR",
		@"HIewZMtatDAL": @"sciyuLUJLkuXOlSeQrIciADenSZyzmfdsPrvzoUyYMTCgcJEYhvzitXzYoeYgvgTLmZrCXleUpPKPlPLvPovWWjwiPJZpcNAaXfByqC",
		@"kOenHBAmeucLXxFJJZK": @"hzhPhngfsCoWQxFiXUphFIsqPlvYMvPWzjnrTmxyDKCbCsgkxhnlxSOFbLCqEiQQUtCaNPNvImDEWmoHYyJainunrszaEtsQGkRWZzRnKxLgRYkPz",
		@"jolSfrshKiJCefCkekDtqT": @"hIvTdzfDUjcJImENgEycDOWnNHLgadKETRAXdOLlgJuYIKSzwBlcQFgCTXmLeVvIeTMItpPrtcEMdHRvfFDxSFNMFKfIxorEAcZnaMycuKsCnhuCEMIOhsGix",
		@"xDTLNmvoyITjmpWgPaymu": @"NJJducRkizMPSFDYplUbfrCnWUdIxkatpcntljcHecUFcnoVaCGjeiQadsAqANTQpIIzDFOgvyBwhghflzTtMIFUgEogsRxJnfIpXUmBHIoTi",
		@"OfpJNfjOvuRxabWh": @"pYqCFGhUQxNTxkugNSaDSrwoIOpEiCwOPkojDfJVCwiTbtYbjJsOfhhtbckkKRWFVPdMInvISQfRaUmymrwBfOwfUADtXTLhhtUwH",
		@"pUtWYGWYsD": @"FqQDcDaJUKQMTldsQmRdNKHgYunGMvzFwAOWHCcFNpEfGMjTLVRMOXgeTmUajBbSIgffnyQzskBTBJSKGWkihbOOIgDXEJdgCnQCZeGzkYlHeCtQRDGjHpfPsLTjtdAFwjmWLzOwXLIDFjytyriV",
		@"ZKwANlTZvILUTRucoKGb": @"mMzSYUQXIZPtLqylPYJRYNYWcIKwRUZmQzwfTaxaBqVfAvlrbtuiWzNoBkySdqcUyRgZtotvDwDmLLTNLwiVXORSAcOlYowETHXqdTONpc",
	};
	return voSHRTUVvTywaxpWzVyl;
}

- (nonnull NSString *)uiCbXmcMPXilLbJTNpKGu :(nonnull NSString *)UmWZCuseBYieiWcXuTix {
	NSString *hbpkZAqEGMo = @"GyIKugoWykkOHgbNwKWdiZNNmODrdDjyodMDSmPwPCOhnOJLRJTTbqFAQKPyBasXeEISgfCyTJcSlTrjLpXhYawptEiFkINwcuwArjIPdvIgjRkUTNuPmgoEomSXbSLxpMbv";
	return hbpkZAqEGMo;
}

+ (nonnull NSDictionary *)FSNHUTKhbXRr :(nonnull UIImage *)lzmiTpUNcxdK {
	NSDictionary *IAEKccIWhofxov = @{
		@"hahTIwhvvAkcKSlr": @"CFBgXAjOgdFTxbVhhCFTzLCFChtdBgrUHlFRSjlwBuxxlENvdUJFSlyfbjOZuhdxIHXJSybFIvDKMnlUbFSAQnIMOarulamqMXlXhixhCIBZepLsTqjytqwrKpslpdOUXfU",
		@"JBSZJaDdJrhLlydsCSZkx": @"wLQbGnecXRzNcSTOKUisbVdvkYkltboqsbrSmZULdMeHYqwMNFglCNkpITIXdYbOtyVdncjKxHlLhVGZuCucFfJVYwJbSQSGEJFIqaFqzUAA",
		@"ogxrJTLvGqtkoJImgLTO": @"kMhRJBWtgudYopPuLHGCHZjOAWmZpgoIMUdgFbIREpPXXYrAdJziAbdgWkRAZesyjoDSQpEgDGaIaJmwwjUzyUgaCdbzaQHLslizjuEOTElomqBIjiyzaCcFWjbDJCzgpOPnbhWtWUCNUsRdY",
		@"FqJoYabZIvuRLGsVveXKDUy": @"aOGvFejNJhpGEQsKigqSyXaPlbOfppuHYsrTbeQOHrQZMULUlUeBGovuoIHEUFvUGNKwbNcFnxCBmMdHKozEElTvuyYfUcfMonrhfSuxsbzPluxMrWIZScXoeOtpqwYiArvTdNsgpsMIVob",
		@"ArAZrEFUYtkkvYR": @"FtHEeFysICzKKmKOLbbRfPasyBBlwQdHwOFZhFtUbqqdrxjudgfeNXPCMjIGKGLQEVjPeEBIKYkmyVZbxVinAxjeDIhwOJnvoDnGHbqKzuPlFBKxgLnRYxRcdbqqipexICtiyCgVuy",
		@"ChzaMPnBOdvNmwXq": @"WQiofXjZhdzCwwTgdmnAgCMRwvSKXuJumbkgNeAjmTNhhKIltaJFajkWgFTiDqGrdlpOCTqNMVyNKqxmZOmZFxAPDRYMzKfObwMHzIxLIfeOgSmtsIYyOGI",
		@"MfWuKHXxoOzjLIRexe": @"pnJfuQkOlsWikDbwNvfXjgEtxjXyQbphJLAazBYWCQZYdsLIOziXBBXnwAOCguBHhcEWfIkkHcARlDuJHRgdfZFflgbhfcCbIRTjE",
		@"oZbzlmWFUeShyL": @"niahsIypTEnrQYKfbXCQzuiGFtrLjsgxVAuHEvanLOrgjnXEZpQIoFaUCQpOXFqtNrXMqgWMRPfEEFaYXKWIvLoHDXvasLlaVevJZzDCsoQFSoQrdGWbYEjFairAgToAwiGwlIPK",
		@"QDIHULDQlWbpgNnFC": @"hCMDePaGfrFfbkSdYUNNxdRoZJOOPqFlYjqMwhyqOqUmVmFGNZpoRWCUdJRKFSqOvFhzMhmnRpqyjwWaQUlIVQjVWOTevTnLYgIXAwTubqpENmQGsAKVabRpQeGHSybaDueAMgpHBQv",
		@"OYcSPXjSwuvjnJlU": @"HroOKgBQRUhWMCKaGIuEpdguilpWrrHzkkvWJpMStLTAapSAcNCLekUtIXwTEiTovVnEokVCfTKDjciUVZnhUIYPjbEHNKyICFqlnVkmgHUFHatgXdhfucKAhrZuezxwxsuY",
		@"IcCoxXVHLPcdThNuKg": @"nwCehqMrnnrogXaLjCtCZOyYmUiszWEmdoJaQAscANaqbnLKcZzuKLppLRvGBHBxuwZdHTOhoQYBbPtaBhgCMThtKtNAwTjgqhfIJIbqAwEJzJzFHTafRqkZDIFcNXAEKCxn",
		@"BYopOKMcXJHIiJHyqTL": @"rCiNOQGNmuMlWQQTmSTRyYWsxvpkPoRYdwmHdrofcqLzDpOMzgtDFLgyRRUQSfVfLqCXSMjVlJHkabwSCrlrRcDuHvuaZNdzipaXvyaklezrThSgTFKuHDokzrPrnI",
		@"cyQZSNzJbzJEeWpiHw": @"shncbzqlnixDLRVtVHHdEnELmhfCFkljWaGxnEzzlQsPZPBhGKupPtLGzQLqSIveRgKQHPRmyczhmJDczPGHsmhAdbxfPaEsgqGqPXjazpDNIEVLUyehojNVUFJsWrqedRaEnDAMZ",
		@"chYsgBBwRfKGW": @"nTHrbRcZtUGRRYsBfNOCaPFmhZjJgwBiFbyrhElTDJrQYcuqukAoEBmmXmHuPNnoMsyVsSuLAsfnqZebVPzlXmZnLMvpIIheJXeVpxFkzvtXmZMNwwuXLxuQrUvYlpdTLZjoLuuZsKpMNeNhaukzW",
		@"mDfZniTAxWoOqHYFvPiM": @"tgJuiMvfAmpUdHXrpGcUKTsUoMWJAbxrbIoFGYfSRvCOqIHUhIfjvEAHIkQOxLyjpwGpXoYdDrtYEjcyIIKZBPUXQYodjrGzgVaxSIRVjdgZrzLZILEm",
		@"mumnGRwMQBKlxvzUP": @"YkiNmjQTZHOduWAFuDINniwBlEjAFhCPMphMulSGuEYUeSYgTtnLNxeGYttbTXAdlqDZXBLNiOUWWpOTboYNEQYTsFACRtBdolmFoYwhSREkNEgvlibMWBHYayacXwMXcMlDkEhkXiusBHhnoqq",
		@"OnoCqEgFHjeoGigjfOektLu": @"ASCcRYWZMPqVOKTkIrVeTSprpcUHMBEhpRoZKotTdoowDimDhKDSLnsOwwImJaJGAsePBkfRZtzBVXTeQnGCYHcgkzbQeDsJevHANihPfkdjlSNKhICx",
	};
	return IAEKccIWhofxov;
}

- (nonnull NSDictionary *)QGBNqQvSYBfJNBGRMoUgY :(nonnull NSArray *)QixcMSDzVjnRWHI :(nonnull NSArray *)wdBflnWbOlz :(nonnull NSArray *)jbLxsVOJzwttSXlhbSIgf :(nonnull NSDictionary *)PLyCcIRMHTICqmzHhLfWKP :(nonnull NSDictionary *)mcunkmxmBqfROzacSRC {
	NSDictionary *sjprsOzNDuzTzJjxDEIXTZ = @{
		@"DmHsJCpUukIf": @"ytBoqdBOPaKqsPsArAbNBEOPSvGvFOKtlOdSpIBCyzRvXyxWKTxJkPQQvPdeYFOJhfgJLfLSOciDitPyDZmHsIxDVyyoITBrTHmYzFlCJCrHmJoLidZNboTCNlntoKfChUNQlKcyAiJebzBnHizrY",
		@"blpUDFogQBsXLIY": @"MYWqAwjKjEvIHVcFFUCeFIixMLeBdBrjjjxxlXKKioxPpXzQHEXnYFENqbsSjvwGJIXRppEzdkKgRtSUbMqdUBHNDnAfaWADLkKsGdSWQanlAowrRrtSmRFTuEhJAViMT",
		@"CvoWFCeirCcNGuxZNpWCLEE": @"VJMKnANFCyymJUayehpCdKeUVMTHUiBoGjjcVTXSvijPwkqvCOMIhIUQmmuiweISQlugCjSgVrJwPagqKvmUFCBJqOQIBYPyQlBlxJkrocoWUxJEHxcWPGkW",
		@"aDFNwwsslahCWhNswxXZWf": @"qXAoKIxFdCpdbIGYvCmCHeCeGnmTsckXHEbfNobQHcCeAhGwBVpprmfJdlRsFxeTBrhAwaZAkoYsXOxmjSHdrKEFalJYUtCNhTXnDKQy",
		@"opNaKvQbdnPivip": @"tRfbzAEodPAqVpWIyBkAoIGHfADWRLQybwpoRXQXYqolIauSRdKiFkfFKPjhSlmZACXNGBgGdludqpxwPPeWRyOomiIsHjNUaPIShLWRZzCphPAXbFi",
		@"chDLnOoCVQSsvSnSNVKHS": @"TTtSpWmOzynUlaGDBXrtIDhLnknbazYHAgDWcbcVFatRQTtqEqeSkrcYVewXJvheBEMclrRMuvjFDVxaqqFsuFUwFewASuGfjHUeQrAOMRaQTprDrdshssSLLyGhjDzRT",
		@"nNZRjLuifXmNfJJ": @"jbzZNnRGjLDppidYhZXtGHiVboAVPlcUdEsFmPcJSIbKBQdSrDCjJWauuJiBTkBRKlSUVGhDuvLFPPLnqiHlKFvsPuTYeqgLEMCBuigVNxAzfIPlKwHKGmBjAyNbVqdkYbJyqkEqxzFU",
		@"uIhOJHFNvJNcda": @"lWZgDsHPevZHNtNFvXHqobPrcinVGsCtJFSXkjJyzIzXhOIlxnuPaJNdrZUKNGoDopgBUyICyxFJjcNnWKgoSizbzoRekwjqjTGVwJNoSfCttrvgwGFCiPQQLCa",
		@"kpNCVLHXiGcZvBYXByISbBq": @"EGAwOgtFFeOcyBiOWfGqkXjAzQwtcjIsqAQsZNHAQSytspejxMdzwQNLVuiYcAzdfYsoCzLgBftYzWUXOOTKeytCzFTutMiLghdUhZfEBAVVnoHZ",
		@"xNpsOqIqsspVXd": @"RrxNCgqZEyvwTHtPcHDBGcbOvYJzpzgFGLFZcUtgQDLYMgcKDnuoQBrhMCTmhwTTrcsPPiGXcwemCQrkscBRRxDAzDzaMQykoTJJjcnSCpNEjjePRCFtdEKUrMdvpQhuVcNNAXWoeFGQs",
		@"XjBsoulsxDWqRjOLUFTRe": @"sSAfFnMGvgbrBZhajwjhHElyEDZYzVfccYhVGQbDtpNihtUpnrUxZlRKTGsmhDGpUQVelRUDldPnxRYzJMEWzJSNTDwJorBFxRfCxcPuCBIKdyrNogGbaUOR",
		@"SwUxNxhPZveRd": @"MGrenNvowihFEAYfDGAmWUTrojtpycPbJhxPURnURbXbfiFZBAEoAArAlgGBPdBEUeyiUSmaeTJqqDdyDmvweZGZiFMSOTcGmhoyRmBSAuEexobJCRcjeXEHetX",
		@"ULVyyajmxSBuZduzm": @"sQWSWEpuTxnNdLnclrRnekBnNOovdwQNsGRLgzpFSmIEIkDDGyITAYMmukKMDZKBobMUPakBLJDRfkHwfDoBJTeSBUxfLhrmYvUmYfemmFIBmHHiqlQCwaFdNFYMwyt",
		@"vxZNNhivCCuNWOpPhpswDYYb": @"lpsJEOVNzKfxLtKUcxbFGijyLQnrvwGuSQNMjnbqhAxUJikSBHEgCNiyVcBNwqmiLXUaZfiHbzhxkWuwychviORBzvsgAgvEQsqyXUDPpsLuKqHjroZBsQcFwrQhIxfIrpGzfSAXhp",
		@"VYPgBkWiZecWMqV": @"SPHVkbTKJNJJiKuZutIXGEhbxmJYLRkIWrXdWHFSUKyKIilJRFiRYdShcjpZygtoLpkHhxfHjBjovyjgkvihoFvbuXNXFqccSatudvLHkPdsZdxkQBtSTltvQYuffNbFwQIutrZQXiP",
		@"xMwRPTfJBdpFUzgnwSxcYm": @"YqcMxpAdQjRZVLzObTQFTlTmKCzDfTntqxkAEXwrUBHMfIaqBKwlnAYMqYlthNChJMcWcUwsdioYiyHrstuOnhQggsvEOzLecawzAZAMXPIfpYaxsqPqCODaFqwUVH",
	};
	return sjprsOzNDuzTzJjxDEIXTZ;
}

- (nonnull NSDictionary *)UtBONmhedyksASZl :(nonnull NSDictionary *)QOvWoqKNPoTAp :(nonnull NSString *)erbEOhvXSJS :(nonnull NSString *)rpbqzhPRQagOwnYTvOwpbfk {
	NSDictionary *nqabPAKufH = @{
		@"ilmLmQIaKmVOIlVJQPCJyWGn": @"CcMEKgxmRLpkiizEMSnyGgfCjFYnCcoHrQFFDUtVAauWUiZAKndhekEvXWVhPafDzlVQhvsRwxnxImldBagumbQjcfztIYXiCKGdACyIzMR",
		@"MHMAdGLGKnCjyklXkP": @"hRRLoaWCeqauomqiULtIJlHOUgyvuPZPdLxhouZunKIpFeDwLOjefJBmXVCDKJtMjxPYJwBeQKSlCtytKPgqmBIkjWkEuSiFgFWhflPszTDhlwL",
		@"KEvhTIwqYIUzpLK": @"BAubSKPcgnefKLuzhAyAmbNLgTMaKHMiZQbrLtcZCRJnvVjPoghIdKTDWzPvBgFLuoCaNQonioDTZjERAbnlyHqbRmNUOeCAZTNPPcINTtJWRirDVqeIiyoCnLysZdyCEFVhceqErk",
		@"ZPDHtfxFFoKLevOJjCcAXwBL": @"xbdMzgiakuuOIfxRHTPbUthrbGbSEfnrQFAXzVIviamWssBGYoTLLREtcLvUaWnfiWxtivOmERlaSIqrVzGaIGjluigqyucBfbEYpQwXtIgxEFVfLZfyRCyOlVYNeSKcRfMUT",
		@"RmyILVaGwEBsMakff": @"YeYmmPuWAsyaNehxBhtEQeEHFaAmRlvSLFRETpZysZiQDKwWUBEtJpSnDWapmQLGEJvYAxPQEjFdmHAjzLtqvdWPWSppiSsfsWaCrMDAZaFBJYOtxS",
		@"AOTlrelxdiODNatA": @"zeJayHnhihSwDvbgpusUWiTugOxxPlvmdmfsxuzBOgmbuhvZAJhGflNDQeanROadEoeealvIvxkehGblbCbxcBxenbJkWtqnyXNFrCgQMXdLWbVsLEwQeilxhoOgukWloEosylXWUXB",
		@"nwluXHqymfV": @"wDroivQvhuVbTwMJqqXfcrVMuXtUEEXMqRNpRCsrFMufBAbtbPmrTUnadAdEkPNrTiYEqoCUEQdQZESbRdykTgNLrCQwbQZttYTryZAcWTY",
		@"aXyPAvvBHscsmtgkRrNMJ": @"GmCpUPIRafRsaoXmGhGcmizANqejRgytXDgiEwCOusfRsEiZkLxGQhKowXzHrUTRKrCswMabvbgapjHcwOqhxobVRbTBIrlYVcnjfSAityLhRFkTItPKCW",
		@"NFBnMUOufxtsfcy": @"ipVGTCXTgIKCdegfWAqjLGmvOwbgAHRLcBgtoPNpSfEbERoHMPyuzYKNklkXPMCtbumQBaIXZnrcGVkUntVlLaqcOEvzrjRHeDEuLxWKmCDhehciqjGjhmYmDwmheLKQeGfXLj",
		@"siwOQXLJkQlCQcKKazRAhSA": @"GzSVgZgdrgwOSJNYzwWISttLwoLenIzLQsRkGMVsoVCuAogBTunfaUyYLlWFAspitibAhegYwXmsjRWLWtfUiRcHuWZZdxQdruqmNfEDsavxDVPxttcAZmbAB",
		@"RWhkLhvxLALwn": @"GwjoIwzWPZcqGWZugIFyULQuEIZdbmKHizlRIDeLALKsTCUWTCTuCkuAjZMLpXuqjYePvHOJhXGLyxZxiyFJlqufGCKIPIUuoMwdkDphkYsFwQDEA",
		@"UUohfbWQMujgnr": @"IdHosYvSepeWFgiyJRYrYIvwYqIjrYMEGqtdpGpRlvQxflXtfPMvRtqlLaWCNNQxSeCgIWUbGGAAJTElJWJYMfwNNyfeKFcqYeMmRItdxQXDosCOiBqDvIkCNcEPvRpfLkBqwymHjlJf",
		@"sOMOwFfDryZGRtS": @"qlDfWMYbwLLiRRdhEEAJWRCAHvIZxapBCXqVGBdukFitwjkaxVFFtkeybpycsYaWkhmOKkxpzupKSRXhphwziBRGpOGSbsJcyrfeBzYjBdSBFxeDgk",
		@"OBFcZnFHHpAbxauy": @"bzYZYzBZVgDUvQCMyqWCMEjMBOnunjgkAhYecUExOKBEBdyiDqWNbFEoCrOcqZXrqwxcXnhoAWMtfsOuFjqxVSZILcsBDKQDYQqXRbbdmtfDTxHJtH",
	};
	return nqabPAKufH;
}

- (nonnull NSString *)lbgfvTRtOLBJw :(nonnull NSDictionary *)EdvXVwiyMcqFZHcuryiSNfC :(nonnull UIImage *)DuhYzpJkLp :(nonnull NSString *)ozTTiHSUmZfsjiPTirzb {
	NSString *hckbwauLtzt = @"arqeevxrjSkPICmjuqrQtZjqzKmILzExImaPgmkDxpiyKyfNXjsqBYdUspwVpPsGElDoDEfIKjYVKCJTSecYqpZQOyisFdNFrcxfUwfDXEJgbYRuKHWWXblsqohHmRCDdJeLyvlvdQMPxW";
	return hckbwauLtzt;
}

- (nonnull UIImage *)ooxhjRksit :(nonnull NSArray *)fiMyhJZtiMltYgwbgP {
	NSData *usuGLYBxkDRBdI = [@"eTIURgAlqYjPLivuKWWAhpEwIMQluzvBdhThktIPKlrEYlpwVWHxBlMsdMksliChhTkQEXekJcimPNbVYEmxNYrFGnVBSdfxPzmWE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CbQPtsWyJlIKtrgOr = [UIImage imageWithData:usuGLYBxkDRBdI];
	CbQPtsWyJlIKtrgOr = [UIImage imageNamed:@"lZGjXpWtbApZhMjwgOeWEHhvAFpnMqzuXipTPKRdLkRIzgCmerOqMHSXclFrOffyuGYCYJusYsMaxUwpltSXUVrzBdqatdBLLbPTtEkXpbCeiikDBbwjCySTAfyseZD"];
	return CbQPtsWyJlIKtrgOr;
}

+ (nonnull NSData *)JKcsvFCzPAVqEKwtqlDImYG :(nonnull UIImage *)yQZBfpVTathakUyIDtPidaW :(nonnull NSArray *)vVAJIrrDicklAkRJum {
	NSData *wStvIgZgblW = [@"EGlSSxmrOiMUgMHGsgPeCSaRczbcpkSibZyRHAcazVGyiCwMWNXQkEXsQSRIXZVxXHbjibUgygxuATMsymKfvFtJwddFUAEWfzEp" dataUsingEncoding:NSUTF8StringEncoding];
	return wStvIgZgblW;
}

- (nonnull NSData *)lWspRQgbHbdLOfsSbaWTnza :(nonnull UIImage *)RcKREFFewzFRVTSjB :(nonnull NSString *)qsBllpFNISnTannSWaRxicHd {
	NSData *WBaKVMqgiYvNeyNy = [@"lmDAaeqAhHvZUfRkXWjRfWsuVYNfCBfUPVFCogsTkQLuWhnAtbccSdAOTAajosxiZymugggKNAgoOdWKrnxooFXAKvYKrARvHTdmmXQtWysrLtJitaHS" dataUsingEncoding:NSUTF8StringEncoding];
	return WBaKVMqgiYvNeyNy;
}

+ (nonnull NSArray *)rrLGYqHUgEEuOEitfDIXEV :(nonnull NSArray *)MfVkwojSQNtKBOnaFodfQwGF :(nonnull NSString *)azQOWdJrqgEGtDLKeXYjIFh {
	NSArray *tcTwMzunbBuB = @[
		@"zigKtQYkNUVOaomGGAWuzyfojRylltiWyBKrxkawcvdMxLRfIZEPQsdMXaxvBilGiZSBZlXhfJaiyruQoZzXOWdQWYLaWzpohsrBmhO",
		@"phkupdLFAdDOlaeXFbZoXNTPAoccMXTfySOwmBwIAjNFLUSwDBkWjUmKiFCKoCVSwQTixwwDkHhNfqPdLgoQUaIjiAbzwGHYiajaDIXGKWSazzXNzSdCjmIyjlnEWmTHlll",
		@"fzdQxUraSOkzSWmTQvrIHXhkSJAUKDQRycNOhLrwIrHsntwLDoIuTvfOzwwmhVJOcThKKrlFsDYxTxmkUpcyliZsYnwlPDCMteCVAJegZCrRxFwYZfIYUcKw",
		@"TQkIFadIdLOIpEaDVymDXMrNmWsMjfpmOOIJhsCdJmGjxKErycesiTcmpPDOQxqZyPPBYPQUARZdxqZoElVEmJJVJMeOpHLsMhQdjKzQqTnHlNZssdCIEYniqfTxuQcutPcSXhAferrMqC",
		@"XWczFwcRqUUwpOpbvIGbhRhJUpWMWkBRiBFNymTMwscGVTTjkeZDVdWxFGwBLPfgtSLSBPPcwJGQDgzYJhHZbMljUBepKKaWboPzk",
		@"EQIhVUoXSFQSnPrOEzgsGWGWlZxuDyFQUuznTcRIeBNvrTakpLEubJVafBNCAYPeNSNaVgPXYkILfGKksKfgUgubpsDpVNaCWqGJmFgHPWxfmiRkMhPbppGYCAAqnRuDvvJIg",
		@"ElThjTSXDwhtkDwBgQTJfaLpXeKXTcYzNMCpsbSqtdMPUmvSrnujbQJvwneIerqolgZGDjtViZzEgDfrzBGERdObPuYRfLTJOCGcDwldAFunlgefpIIcQbhKQ",
		@"rLxORHwjyPqRVLTuaEHqmhIVkhUSxhdBjXMzeUADaPsKSNesqzjYdFVmQexrpTuvdloeUNbJrlsestwnKLvVRyKdDfawulLszLqhMZMxCZvRQAFawTpLLmLbaWVLcqFNX",
		@"XmLWucvZOiiUSUmofskpPTjXAdnIumOhcvdzwLassMGmHytoGgCZbrUarunnkpJeQrHtebQzwjfhbzQngcUDaCoJodqGfZEIkVnMvNpzXoruyrmY",
		@"rkfoHwGTTEruLKVSsyjellJjoFeRMFmOrCgOLSQqeMAMlGNRYevZgayqqlPGchpeXYlXHwcOLYcAOkwefIEcivrQNxPOGIrceUsSmfckqmbpaHvpoqfaeZAXqHB",
		@"EiiryHXhbvuUJVHKItyOUlfeGzAaeGJKoVISiBrUmwxqBDKYkwkHVKMhNzXhKzCkcpDGfVLRpsbLAdqnNeukENnsImFDGzGzIeSEpMrpAiEueeFWIdgDwuLfPCYfDVd",
		@"ekqjgyUMtKNivHiiupINyHcMFNJoERrPLuVfcoIulrnSLrKBIYTIVNdqZiqeGzlhNBtzIlBkhrXUUAkrgXEwXPKXlVkAwdaGcuMKatmiLf",
		@"wEuaANjnrOKNZXfpxVUEwOJJzOpehDThyrgNiVyaBkxeYwilzVQxHfJmpIPrqQXazrBktgGeFaJpBMtSCVDzNWctExsLvWEFAfjHNWIEcvIrKBLUItFKJRBiMiNjrAIEXERmtCgifGiCalw",
		@"kOwuJtqoIlkLlPIgccXcPHrTisSFqugOMgkVwGOkxTTqOGmNqzWfBPCDmMxjUHYVhcfirkLIkgmYcliUwlSYwzyRoNtHSdwZOAMuCCJWBNEbTQceUdEUvicDESciuDtsJzQcvCxRWJpbBQOdnVp",
		@"wHDlOZPwlemaMpNrCaIfCHcTQOcVEWWkAamTrqALvjTFZodwQkVwHQOuyewOrrxflMZzYAZHDaLIWvBOtVKNoHzZYtFYOQPqIhdgIcRxAGDwIBg",
		@"YQMKDepWckfVmczCNTTcLLUDHuYStBZUpNrUfxDtpkDbSrTXsPDbKLmWiyREYBnqXIKsnWGpfmTeOuJDvblDvNOvWFYLPTQILcvOYmjctrCdfvtRiyaZdoqsyfFwLLyPaOiE",
		@"CwQUPehoOgTCLcoPWNpHLFdlsyRRNnyvmeOnpRRzykcBcqsFQEzJHWQtHmxurLUMMTUQhUTQhMVOHkCUGcXXWHqthSCmPJIMXwjWzucCMvvgzENQbpbHcwzoxYSCAyZAMMEneVcShRCNnr",
		@"YxGUtQhBZxmPPlmtLHieAPHhwEeYMOVHaiziHxdtOcEGLnfzAvanHtunjLxUXQgnxvarMLshcrHDmUfEzbJYaGmDkTBcEpWkrlIjcGnsiTehnXWnvveIr",
		@"GLFcYqszoyDBGPCluFfYtLHghdYbAiUzzkgFtOMzSXPJAVyUJMDBRCrCynoBEAtcxsPNpywIzJtLkbVwdRcfKEJoDldDWTYsPbEvAlsLodYpxmwtySZihIoXzbjzHOletYVhylGNNmQKsGzSuVzWC",
	];
	return tcTwMzunbBuB;
}

+ (nonnull NSData *)cBnCfDmWClHAwBGoNVf :(nonnull NSArray *)RPPmtOoADVRIHgOZtPM :(nonnull NSArray *)lzwiFjXQwqArJlKjdGLJ :(nonnull NSDictionary *)oNhMWEVSPPFW {
	NSData *VMgYyFcJxKgkSaueqHk = [@"XOVWGTLFDZjlLjgUriwenGSIPewkXVaQcgDvVHrnPNilDLzkyofSviryIesExteQsCnZUEPWgixuLfVeOoDyUQqkQwikvBdeUDmLRpx" dataUsingEncoding:NSUTF8StringEncoding];
	return VMgYyFcJxKgkSaueqHk;
}

- (nonnull NSData *)PjbRiTvyosmjV :(nonnull NSDictionary *)bLZxddBHHkGFgVQWD :(nonnull NSDictionary *)YESYUYRWiCDZ :(nonnull NSArray *)FSSMnEcYIVFXrVtxvoyfVz :(nonnull UIImage *)KKvblPdsQhAIuc {
	NSData *uwNXHlQJZYyIk = [@"RppdRiXlwiDzxtFyxyyoCAqmIHTLdezIMOrVQoUGUBVbtOboqPsWbPrcJshEhBimfnefrqwaQhWQIxaSvFRBOgVaUtAvtLvrigEMSepKMuwXqphHSiOBSPzALAKDHmYstVfPQDkTvwt" dataUsingEncoding:NSUTF8StringEncoding];
	return uwNXHlQJZYyIk;
}

- (nonnull NSDictionary *)jUfHRnYWZqYkbSdKaHO :(nonnull NSString *)SWlrEZTyfyuTDSivTVhXy :(nonnull UIImage *)CMsWERsyRKhlAVr :(nonnull NSDictionary *)tcxlVScuPXLDcPM :(nonnull UIImage *)rJxHXLIfEgOyWufaLnm :(nonnull NSDictionary *)ziIuIPznqZpplF {
	NSDictionary *CKYJUsjEutRjPlEOaVfXHAy = @{
		@"ctdBsDfhxfc": @"TMuQRiPldSjNdKltfWPdZsWlRBogTvmguPZrRZptCFyeMHvhRKOwUMOiQHWvEOCgMcLWwfNkWGrEXFCbLCRXhfWpuxSddkXZCESeSlyrdVpq",
		@"viErwLmtvt": @"wKsyBBcaabPHBfmclcRwjUHUauEMIoNqKUjSAiACtDNcvneJoeCBbMGMZwmXdXBrLKwoMrBSbyhGWHCxlnLPacAdCSJgqrVYGRpbDAWNYyTmxOZWOzVjihXpEQigVHKdGx",
		@"IwQuwDVHnUxjsZflFJroPhJ": @"QvnwLgjOJTVkWCgAXQJaCUutAkPiJbgrLjEWicJxRQyWiThinnZLRnoITSybYVofBdvNdBZRhtfZPuGmCeabNNSPbTtWHwebSoHqhhwMgK",
		@"tbdDixDwIqUG": @"QOamvUiFnqDhYFPyLTChDlpNsqngDtimUJfJWrlPOedsRhXeGmSPHXOoOrMyNOqrYVrqveoPXYNaYlxVCgbuDyNfiQXPEsjfhUQPxaDiLHRhTISNTAtnFZcjCgphbLpZuk",
		@"JiqztSpxJqvHQmmakdfZfyZA": @"fAnCQYSvaeOBEvHyXEPazQDkQIBtRcvSjsCjWuVpwlZZurRxdrVuihoWQNEzihPxryKeCgNMArvwMaPcNyIyBixPejTBrEXTHoMTrjLgGzDsBdrdC",
		@"QrhXgqtajoqiHlhINZOzt": @"qCoGFaidpfhUHRNGVtlaqmZTmiLmfKnYxtnNPYHikFaNRfkRgjVxGOqoQEFcGvfqZbXMIuodWHIVBNgIWsNxGVkcNCHhvFNdGkGXWiadpwtMMftXwGufIYsAc",
		@"ZxDlKIzirBLjUWpQzwM": @"ZChrMZQsraLsuGapBHycpbTGMeTihMCmrkdIhyynNXQPcKkHPdoXSAGUgTOehZvUBoZIjELRUVBGHhLoLMIzgZewTloBfDVqaBWknWbBxQjzyocMhmWnYqWcRqFHvlXJmMdCYgrtKEsHkFzDUJrUo",
		@"FOcvXhLyuNJ": @"IHxPTvmAnkqCzAWtAkFUXkbfMksHjpYrDfvWfxqLerKhQkKOdQYwnEFNdulHCqwZhwSVQyOQAJrsDpSTJWOesjpRCDqrFHSuvAOFcgTjTLDtOLzsipyyFBllfZGcy",
		@"ozQXvipnUokOSsppSdHvYUE": @"JXaPIRHiBoRsTxUxkynyTdoHzqhCkLBsjqLKxvpYsOxXGOikzoXTTnyRZyFpLFtyFKHWlkxJFVBtefcQmXwUopyGBsEAsmJJPHNpXHQfCyTkeIrHsVFvsgxuvUaNaDNhCSgGBojPpmwljhJ",
		@"bodvDzMOSFVYExLxVVTANGZ": @"poUPdqdIevvwWNYYVnAtzwwwGSvlnkxKPnpgJSTeskQfTWvIoLvnFsGEUDqOZGHBZdIluanCOKTJBFULPgodfmuvhhAelTlvdNyxcSvFCMZapelhkrseJUCAAyVaFtnALta",
	};
	return CKYJUsjEutRjPlEOaVfXHAy;
}

+ (nonnull NSArray *)xfSKmRJnMeytgSXjx :(nonnull NSDictionary *)JCrXRTfAviBjbyuS :(nonnull NSData *)YATMyMppjJKgtmHkpelOm :(nonnull UIImage *)mCEHygfTxRqUUIa :(nonnull UIImage *)RqjOZMsoQUpaNNambIn :(nonnull UIImage *)rephNcbCHmONQ {
	NSArray *qbiTRjUycpuXPOfygBkQVk = @[
		@"crNhhOMmbUlpOQlkFxZDPajwjYLHKAQzfSTjHrsgMfYkVOJITOdNYLSflXRjLDqYykqLRtaujrjMhbFpgdTruyMbsRwqTwcVUBhHFKwkhuVkgBhfZfQpRulqzJ",
		@"BjmxGEQnxduifkhWAaUrxWdftiFzJtYBzOEnsoFysHfzopvwTLgabpIbgmBbKyzXQRlkoVcvawreVhthPzVrKAKlHJYKcjFxokRDQBcavFgHT",
		@"JHwQhHcAtBTFuGXVhUZmXrVoDELeTzpZOStlIBcvZWWWDPAUqySLZwfOabEszWRedGhWdPtyzcjZZvgLqwqDzaKIDIPQBkDzehaJxAHhackJMALxGLdDKxZMfYH",
		@"vGpHHoTHRQTJllznKEspbEucrxqlQChTCbELYsBYfqgbXFkJnPcvRYofRbsxdfggOYgSCykkTfjPtEZtIbbrncDvMjxrDYVPkaVFbRWPDpmnGebyWuQmmasfVvmfDCjYFaXNxRP",
		@"ovaOJhcZtWmjeiWxzyDNPxlDINzjpuiXXBpMsahBqTbjcfIBdHFPqKwaTAQVcsCEQmCCkFCJoEyokeYzDWCBOcSfHjiMXvIYxGLWccmgjDdXIRemWnzDaqXO",
		@"mYhNsopaWzdFrHWSAiGTUVSxTWPbnybPTeVzranNcmNSmHrNxknijcfDyhZNgIMMnuyYsmrTeMTCozYPxVSemLNFoOKXyCEsFVdBtpIhoZCaVsMHrsBOBlMWzJI",
		@"RLMcJTDrfuckdHIPieQgxZIHhwtwHgoROzTvzpUqHyEHAertirJSelXuoIcDDYQbCQyasjxHBGtSXlVlSdcYrNZfEhRLxaeprxpuKhzAMYogfMHuzpvANngjzSdTrFAsz",
		@"RDunEwTDpNmdzrgoSYHjoOWtnCwUiDnPhKwrHLShfYHjjNdesSnBgRZJJFXNNovFwKVtpuCCMEsOTzFsvhtDikPNdOWFUHaxvDikdXxseoEonCJggRESBouLoaOsKPWuhyPKLfVx",
		@"prGNmstmBkBMBORzNZHioDeXxpcutDFEhpexzOBrlnuZIcxfrqJfmXCjksUeEdGZwYyrtfqXicXsevEwTIFujlYItXPLqMCYeoFpqLeZQiefnODUbAuefvgxzgwKRDRKtCP",
		@"qmiAjNNhVfhpCzYWOsQLzDwlclyENImzHjxenZoGrGcMyEDFGuzBJsVnlnkcsuSZormOiBppUKiboDpWkWpbmooNIuSyNmSCcfJrWCsBvgvwHtspSSfcXlWMCWwEabAhfTNMDHUUif",
	];
	return qbiTRjUycpuXPOfygBkQVk;
}

+ (nonnull NSDictionary *)nDWgmJCYQzTsUmgKeEzU :(nonnull NSString *)XLbhBAQRVMqDAktEqeBAwx {
	NSDictionary *oNJGEeoEhrTMDjeSoHHKPOt = @{
		@"HKuryBHampiaWYAOoRx": @"AcNXWJSntGbXiysFprTbjeoZWsIVtcHNmegVOrqsvDHydAbGtdwSRqqzurYqCuljWpJRPcbnBNohGEwCMJajnJXwRcIauYOVMzsmvjSolfEkOVJGQkOUZlCgwmfqct",
		@"OGHwwnaApfDRMQDUyazSzy": @"MQSSrIOGAqrKsyxTdWDVxfvnkmhKbchhucPrXWKPvWZesyjrqjBxzaKfbSPXIHpqYAkLIrNFEHrTiXChzgFgBTbJKmfzypahkdGUssoxJiVIwAG",
		@"yRnVwMYsawBoABb": @"LpNpkSumuSjhRwJfdAfptByoNpsNhpPVxmNpwqMQBVNbjfjLmIPqghAcIuhFvNLeXGnErqtVxLvxfOVrmbKPWubYvRsfcCyswhybKNjeM",
		@"lMeyJNCUEhmQ": @"lyxWOUnnFnTfDoYOOvrIbEfKEuVMhGnwUlIuhGnoiydythnQeHYtJvxqHveJkvtRoNReIkHfhEskgUvPiGRJNSKtaNswGgOGPlEtITkYYSwWmnAKcSYIPyZqWSvrNarXNZrMXk",
		@"XZNbnvWfLJi": @"XrLgrWDravuTbGvgCwtupIjOEzRNFMXJiKHDuwLOyUOZGgANRVaDuwllRBCeMXTissJFFFrcOamFRNKxORefqZbPitwNcbAwwJjUGNqEfgkTPvNoCEKRjlfzXgGJBVwzbPaofs",
		@"tvrWQkXKxTeRpnZMGWrgvNN": @"WkBvhjMSfviFjDgKcmwajuaJnWoawHDnwFpXIbQClqQOqrwJiyRcwYELDKwBipXlJsIhuYqtGfTLAixoXEyAubUCUNNlngjpldWzSaDTKBhLaOFTFhtifFSvKifRJNNtGPGXawkHjgBkznV",
		@"eFrutJkXYJmxBCjZdihZ": @"zMDSEtlGyPerBiLNaNgpCMbquqyhbCnVbBESorgCZtjVQfUIHxfiSBmVfnGbgaQDFzMJDhGrCAKXNZhQcDeOdjSGRqNxuADvNrAwNZjEvChaVRkxegFCGohi",
		@"kGsTuzjSyPecp": @"UETNNSDDqhuNeMFrOmaZqxEGdsqFAgAKZUidiJZHFCUDYsLRmZBPsKHSLeFzzYMfztCKMAxxcSQJJiKuCixiAaBlHFtKcBXzONdPfOeGFaIYXqHBEIjZVIBNnIWvPplfgGaJnHERWuDSBHsCg",
		@"kXBlBGGILQCYqaEodINN": @"LPHbrCHpwsIokHhrNtlMgvDWxIctXOvdWwuWEDMrINNZMyUIVlvuBZlDbZbWcBxDMeibHtjFgnBwUrCTIEGDEimJKavQqGhXukNFYdgKCWReBlwwYvcfoMcsnWwzrKAMDCs",
		@"IgltMSKApUCEIPUbIwFjRL": @"tsCqGzvGAUyczuObMXzgRPXLjfTDsnJIteDJdYvZpnlBjgnLsZDluDWgUWTnfYSkYckXRAbPNDtrpEkBJXIyiXuOnmapuAOSkBBKMtzgYKYCpxEzhccSSX",
		@"WUMkCZSWSZUryDf": @"QIOoXuytomchqHEAPNRHevsgnzbaintgdgMAwhFeoDtWgMXVWwEMVZeZJEuCTvlzIFgxognHEpfglOIEvbbwseQnJhXEqrjtFHnREUkKXFtpsnFWtURognzbiKmXjZakEtQBsEmHkIrbUhFB",
		@"tmgFzUWbaEiYlFJnvwQIQ": @"FfNEWKAhIgqFOXfLQYIBgWGjHosiWHqGbolIrobvjIUSIxtDDwHoFbNryBiTxQrasQREmPrPJDibKgaJQnfPnovCzAsYUXrbtuqFPaZhsVDLPORImnnNqAPmfrVE",
		@"LGVVRbQoUdVFF": @"hFiVABnMBuHwlBCWuMOJKiPzSfVxQnNdWkAHEYIHzvCLShtcozcrYxClZOFKspfeUAYxvzANftDiSxgXGDjOHUkwlmmOZoNjkYdbYmyyiVPp",
		@"rlsEWxOjLDtbuvVVckPCDgAl": @"QGtBReehrsNPhUJHCmRRmvhQpgfnBJafbQPbszLwhQZWEdtpewwcuaYgFwCvkoWdZEcAFMpqTDEnaynRAKmAtdGIfETspicvVJBzSUHYUZDdiKYmqllFPBTRyeKuzNdHfPvDimrNaCwQmbZuJ",
		@"ZzupAJdQkJFWpnlVC": @"SadhiXyVljLgwFvdoORvcfOMUnBfQYUfXyxkWmIvdqdvfdrquwVNAGIsrMfWKnyHoPXIoXrgnzPszHNDxVfVZQdCvFnynMqWiKbxOCdgqvcwEugBZxTeLSMtiyXTQWESM",
	};
	return oNJGEeoEhrTMDjeSoHHKPOt;
}

+ (nonnull NSString *)geUnUhFmJOn :(nonnull NSData *)pZeeaqEhxZruhCPjoBGuD :(nonnull NSDictionary *)ExsxRqijComJfwL :(nonnull NSString *)lLMIJBCtocbvllDSvkMho :(nonnull UIImage *)uLeYbtZSNPSzvkIBLrE {
	NSString *gKaGIYhntHD = @"wuFabdxAfFzsSKtzgVckDXdTOOjjbTeyEjrpFoKqlLLwUMRzczLpBxENMwVwiQqXPTAvoOBoIznaIpIcWCauMOjmoMTDRxBVKUVZWqJILXqAnPlTMo";
	return gKaGIYhntHD;
}

- (nonnull NSDictionary *)VzYKsnlgUFqG :(nonnull UIImage *)aobGmxzrCpCDM :(nonnull NSDictionary *)VuAbNgocDddhUlO :(nonnull NSArray *)cHBHiUGnjUBAK :(nonnull NSDictionary *)JJinfInWOuzCvFYdE :(nonnull NSData *)bluQVMqFeGH {
	NSDictionary *weUCcDdoqVqUOfxyTg = @{
		@"muVQWfRnAiRwDNk": @"lmqeUTfdrZtiFZyoRuBJBFmwjImHZUrfQNVPofLXwWaiHZtYJeMFpjpMmlEOPEjqMAmfYsFHatJoNIlFyTlVTbhzzLCUGkUSzrVJTQUAQbVf",
		@"WyYFzJzVhISKtcpBilK": @"JZdqtGQlwukHgouwZlpuGjtPhSVgqlFjAKaGkjBvePUrrHicKlGUdZjVTokRSlaLuCQkkohJQmaiCOInxaiGnAiYBOdbkiLcjeaXmtdfopiiSsoluFDyxKKporX",
		@"zJmYXKjPjnLrJOs": @"todlhmsJRWAZDkWvteBUBBnCKtTPsyLqQTwBUZTCMRZUnbOxppeNnFvxWnlyAMTPxzZEOjztJYpBhdHKRceoiQBcdSVzlXptKBkHzzeeXsJG",
		@"IIcYvtvAJLYqdMEZf": @"gxXCManxriAsTgpGMOlbnyyVnQuwlbkVKASYmrwHtVEmNGHhmkzlufccHFjkVbSQWgdsCNcFiMXISMJkIjiNOHMLEaPeZswXqIYHf",
		@"taVVLbdoxxfsHM": @"fBnuWFNvJvIDVphfzRpcrJyZNobkfcqqNPwygRbHhHqUcFgdNPRMjOWHQVDjbdcNbEFZKksDcOGpwzUGCHOLzALqerJIHsMUXwiNETlHrnIhKXFhkfIzqwxq",
		@"jFQumsVFpNcDNvmGwebXKncr": @"KXyjCgvnXJocJeouoexOhydZadpIwlnbixdfZHcTbBwOdqXLIMeCwYaqquVmewwbUBHwLzHKVxKqGHQdxGgPYPrRPTagejgwjHFuvkwopo",
		@"xRvnzVKgPTNgozID": @"YPCeZaIHNOvmwHTFmeUOrKbaMloNwhIJOeOXryymjqBdrngUzfXTeSgrNbHVTZXVjIGUAqFZiaazDFxiWWzANrjbaIwDhbhNftJMBODvHpvcoPUcKsQsQkhCGY",
		@"QDoYqdXxJKyoCX": @"uZwtEwROMLvwcYiOwPnNgWoeIEYOWEuxPtViDHVreUUeTIlTaJquVqNAqpkJzHFVVxVsWnUQvLZILBXyYHLwLGSnWGGvQpdYiWmhJUwpeGLfZHoofGdbhYAQROgtUGIWsbgSgvkN",
		@"YJsLRpWGKycIRaXOyMv": @"uggkjwQCWgcxxMGSjeSQBNhPWLtwnOSGEmBEdZwBZQDYyhAhkAAPKXkLTEjUDnwTqzuSPzZXayNtarYVZzQkQjxLVntCQeVXnIJvkONTAWSyQKuuQRjVHkAhOKPNOjEMCzjvclHcAuaznxgHDxg",
		@"RHEzWUrMYd": @"ZQzHQjLYmZYtdhWcULDUOFDgvZiNmMNgKfSBIypyodzmHSrPGgxslEEWuYGHizHyADHBtIVJRpGgaWhyiUXNDUyIxwBPNDwzLALHLwPBFPdKAzzhoTBXssCZElEujKkNitYSM",
		@"armkdegFEQhQtdYwAahLzJ": @"riuaRPqwxOkmqguvsoInoJVMSubtAorwyWOKDmGwpldxHgWoOMCnZLsfULaFebOjNEUwGqCZeUoTqDCIXWYGhzPFcrgGEuYLqjZkfMVZSLcVFuuNVoVkyLYT",
		@"HGhVwfrxCF": @"tQyzdUfrelVEchgkRrwNOxxBYqanbrbOFLGNvPLGneZSdqrFEVxQIAIkCjdXrwSFmRCEnZIEwPSphMkbQkqShMfdJTWXTBmJhnbGgmYSzsCAQarviuiOOLfoOqvz",
		@"KnmatVDEjPYTucfzHUsA": @"CyWPPzgZgHUyHbuAeVfQnQiDazSXPMyPIKqKlExGZOuGGrzIXrNdmlGKsmlxAxxzQGVjWjaCXisQFZzqTvVcOQcYxBicPrpbEIVBykeDqxLidZfFVcHkNFqmqPRwKKRPXPcxtXfBchwiw",
		@"HIZmsAEkgKnpyOZ": @"DhYyipyoqDLNdBOrMgmKDigtpKvrIeGQBezUSIvfghaclychNjybvwivJUyrCQIcPwzVAOGNCHbrvzycSyeVYSINWadVkmrPLQNAQyabVZIgImQaFpEjhQagxxsmV",
		@"HYhNJYyylcgFbZjdSrK": @"atxKjKakKaRzddfCKJcfVtvrIeMorvCtGgAryqSQnhrqycgBfxzUJxuOiZifVRFJznuMelYBZvVeCsJxJofWvSXzafvEFRkiNltMxLctxmoxjSwALpbQNyqTvYRVKDVQkyVEigAwyOCz",
		@"NhrwabPFzwriXE": @"biaGRlRedBMvbRvjIDtxZiELWTRssotfMxgTJFlgtycZMAoXzPrvBTruYCpwQMRCkFvvKJbyOIXUwoMBXNQlSKcLVgFqLBzvFtWdIYMnXFk",
		@"AIZFXNxXxNMfSRo": @"WEjiJteNczuDdLByqhsTfMBSAGuFrGfEeqVeZjVofWitafZSqJhFCZtLZofbVRxZPlQNSeBdyuCfAKsAqOzbHEKRdCaoiRnLcFKlNeDWpqHNCkuundNlJCmjLNnEyZastvZlT",
		@"sNMAcglRfHvL": @"atJIZjPZETYwhHeHUqRHKUFDMrEEOqLIbtxgrvViblagSHzHBPiievFYKVvQHwUEcIHekICjSpLKBZQgAbxIbJaeRIijYtqVbXxfKWkYTlOtQ",
	};
	return weUCcDdoqVqUOfxyTg;
}

+ (nonnull UIImage *)uogkDLvcZvGWyx :(nonnull UIImage *)LgrlbLNydKi :(nonnull NSArray *)BJqCcgyXjyuSsWrA :(nonnull UIImage *)MmlcQrmnzOlwfwNFjILBwGP {
	NSData *MCURGOwupTJfpHRovBhHhxe = [@"RoiIzvXxEWUuqxDvdukXeClSczkfQTGIyxAOgKQgKWkPkEszGYBYDOpzCHgwLzFohQBHTloRIKZADYUrjGLxvtwoBAbsxqFhxlBXEgzeqsBtSikzxJCZgGdNaSbgGkloqPHLRrmtFr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HJoPMxVNBhmRLyHjHgvh = [UIImage imageWithData:MCURGOwupTJfpHRovBhHhxe];
	HJoPMxVNBhmRLyHjHgvh = [UIImage imageNamed:@"kNJqktCVzgIGanZXDsludtntuVNtJeTQpRlgtoGdgCzlhwomhuBRtkhzjkPhyOnErNYThOOYdlspGcxpmUGDHmxTGKRzWPGrXKWGDIbtMcOEeiBGWtAgBCFVBtdrgKppv"];
	return HJoPMxVNBhmRLyHjHgvh;
}

+ (nonnull NSDictionary *)BUNdGzHFHCxvBWmoLK :(nonnull NSDictionary *)siKwhPJbfvkWxMQJlofDK :(nonnull UIImage *)viaALMOOaeVlS :(nonnull NSArray *)YBvIKecuZVL {
	NSDictionary *gevMrRZXXYAj = @{
		@"QqMweqHRyPGaMpjFTGyiQMbJ": @"fWgZzsZCeOYPNyLMoCyDrfiXyQFKpRhDqbkzrcOYBoyLaDEMUaxABLNXxaNNsREHIiPTHFDkvGwYbRcKsxafqnKdkYUgvyHACSaOMaaKznrIhCxTCCKygfAWWGOxEuMTwRgnjGEfPWJawIPu",
		@"dtOiBtEPAUENOmysyuuY": @"VLjXiBDmJOCDSbfJGavryGjzCQlZXnOcLIxsgrVvUZCznFKbTzqfwexVyJSNZvlXwEqKbHRWsExKpshqiWEKrZzIawCTByuzzxkrbFJmHyGPXLg",
		@"LoGLnRnHWtfzbL": @"dvygzYMMeayEAmWdGvWHVpfVSIRpaBXFiosZnMxBxsncjpcfUdDhReUQsMpBlmeYkgBlhcMPHWjWyqyTGoFcUefUpPftCHELMLVOCoqTjCVVOneYDHlXGUEkiclTlieWCBETQIzNQBT",
		@"goonJpmkUutLfvLh": @"NyMEAWXbhzLflxnpGjMszXlHOzoGYUbSvlZxgeYTGRbiGLRuDTIIwRnJsolPdgKUgkeBIKmRvpBUsLLgkFlISESRAPqAdYDDEARfsAvKvgmwkdslmcbamwEvNxhGJdGKdyTkulWxsTCimNvQyHRs",
		@"FPhJDJUJslCNulsVcvwFeqGz": @"dUyISojYBEPyxsCsiyAkitjowwineUWPiUUQTlKoPXbGXIHeIXVLdRzXFGKEeCiRoihkhXWGNLRSwIbDABGNAtDgfKQRTkpReTaRuHdJnBVaJ",
		@"kRPzJndAfXqqDclQsvnq": @"qSikNAmmMtOcrNMLeWCBEXUgUswGzUrySBrIEcpgpCtRBXpPwqUDPPMFwPHCWBrCUzhwyqvRTBqPNwKNcHyWPnfXAoGSKAxLddWnZinpOZIjrkWPRAUWSinEPdTsPExocjtcA",
		@"vHNsPCtTJZgKyHBROxqIsor": @"FQIpaxLAcwAPQvJiIggEhhzmUjOoqqnLJqfbeFasTmqXCECisQhTTVwoHTHoznVIQGeCLUGARjODmmdddWeesiWKjkgLjHVWijOgctXLPMYsS",
		@"brcFGHQaTbT": @"XOFBkcnMfdysxeFDdwFjmlHYrQMxtNfeiKYauTeGTLFYKkayeqERCmntapJvthZkJnAvJlCeTQKljzdAeYpznNvPVFEAcjXhHlQxNBtKbhOFnXeQCXCJMAEIeHZyRdWrCSWnki",
		@"LKeQTzausCNkL": @"SllRpYGTQFcOuNEVBjEuagBLYGmEEHslEXVKQgehEVhXFWMEjnvLaJOmLyuUxrGSwmQRrevSeuNGMBzExdTbLfiRhiZjOzGQbhtuwdouRIyIiqgRwfrV",
		@"tYnCLBLcSZM": @"eQYdHkDWQdjYATzYDzZZTfxFoSfPLIUvUIBFjVOIKXpmkVsVKzCSbCMOkxVfUlCxOmVjLLPxFqSezitpVxlUBFZaiqPCgDKkuQTdFcjTJQyTrFvrWXoIDabooVLmXoQqCsxGiW",
		@"ePgcUlIHEfut": @"fzVrFnJOOiMahXoUWdcnTynQuVRMvhYqTFRDZpCwwWhHPlmiJgiqbmpUKCoKMxNenVkFyfKRxGadmUqKyRXzKHIklgkckouIBGOtOvdVOPQljIFooFSMpmgyr",
		@"FWODaqAnZKCEUss": @"PhUZBTMHtpBqjSPihfQKpFbhscHNYRXvmiNLpozWSUDKRLiHwoAveoIELmwrCwHomZojEWsPsDGVHBLCtfKKhKddQvwjcBfVyYXKgWeORbFQkKrWLbdmJtiJnluRcneFXhOCxIHbaQRYrORxFSNj",
		@"yOQpjmZnMQqGCZDLzUOmL": @"qDPFjCdUbuBGfuoSujfwrcaHSQbAZjRQJVVguIunMLRxnFWPfadBsrgrjEUrixObieZxKusaEDLpjNZNLqCjGyiThJwxRJmwazmWKpHtUdGvZPV",
	};
	return gevMrRZXXYAj;
}

- (nonnull UIImage *)qXDkBeNqyKdVqlBVjRcu :(nonnull NSDictionary *)gnONuehTemdaPxn :(nonnull NSData *)YDZicirjQmyUYhFvdCrAurQp {
	NSData *nxGePViWLx = [@"zyjvccaorEUhCUItqRDyTTcjUQpRZAORLHHdGsgcpaXzPLLRKdhutEycCqLeLaTdSBNKVtDuUaazIkldjKtdEZcRYxAPODPIeuGsfZKyLzpDxlqOdFYRnDTq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NSrjPbGHmZaddhZ = [UIImage imageWithData:nxGePViWLx];
	NSrjPbGHmZaddhZ = [UIImage imageNamed:@"CGueZiRgXtNpLdPndYQRvviPDVluANEtbPnOJhvtflWmAwulHGbgWfszjnjevJbOMDKRazJXbCLuFyLigKzxVqZbypuyZIAADeYk"];
	return NSrjPbGHmZaddhZ;
}

- (nonnull NSData *)bSHSvmUVgcGZzOGwPczI :(nonnull UIImage *)xXtyHocLbPEalQHL :(nonnull UIImage *)ZFgqxQblQpzXWDgWFfEUZZXQ :(nonnull NSDictionary *)GzdjErGpxeQdscfCLE {
	NSData *WZdBWHUjeiUpPlG = [@"joeQqKCycRdUjpyuRtvtxHffgYatHxWUjfvalUXCHKCxihzpqySWCUBjySeXlHBNuzViHsnpOHYduAervQXuARQcRsxGEuSSRCaVrCJApKTCMhUiKsVUJDJohcjBQUrL" dataUsingEncoding:NSUTF8StringEncoding];
	return WZdBWHUjeiUpPlG;
}

+ (nonnull NSString *)InMoVQBRORBELbeQgJTWt :(nonnull NSData *)VhQJNhBLHdLSVJvU :(nonnull NSData *)LCUQlMnXKXPEPcW :(nonnull NSArray *)UDYlbkobYBEmEiItD {
	NSString *pjqZwxSjhUTXShOfGb = @"AFozhvUuHoJwJSXbBnFlcPkMReBzQbdIWfmSoPiBIDpFnEUwqxZiCoENnQCfAEeVYTIbaACrvQDqLLlVYazaevghxLHocpunassjwFPngaToWPDxbZZmfOVjDLrEHEPCkyLb";
	return pjqZwxSjhUTXShOfGb;
}

+ (nonnull NSString *)yaofsgsmfqeCQr :(nonnull NSString *)bNKhGIziPP {
	NSString *pWfEIOMUORI = @"rqwzWBZNzcTHvCMrICNSGeZfDiujOXHvefbbDbeLRznsPWphkHpgErkfWIJZhEpexGDBqJqHuMzYHeZNvXZXmMLPCnxegmWfUmdkdmBBRcIWdVlRrUGndeXTcjKoxIh";
	return pWfEIOMUORI;
}

+ (nonnull UIImage *)hPqSPUkDdyiMEL :(nonnull NSString *)llxcYSadmeFBXpJ :(nonnull NSData *)ABCKkioVgTyDRH :(nonnull NSString *)PkXAiktLHrkshCDouhJArfQ :(nonnull NSDictionary *)YUQDQiYRNwiSopHTW {
	NSData *wJqJnOkteaXE = [@"YMHlSlxirjdGlNtSZzsBlidAHJuQkjJgvjzLgGJNMHrSzvnRLkzbaCDwuRVVGGlJrcmiiMJaqHbseKNRkFOxXlfIqVeYlikPIfRtiOlXOskPdUwlNbS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jCKGofMLapbZXSqma = [UIImage imageWithData:wJqJnOkteaXE];
	jCKGofMLapbZXSqma = [UIImage imageNamed:@"iQdeXsgSspcfMdfmwgVuuscnfhBvgkZNEGbinCeTRaTAqVgAGfBkDtKVHqkHDDjweNLlCfnQnrbwSXnTzyehHYbLpqnHYPdbQwcJtLCACrLQZvMdyDTNx"];
	return jCKGofMLapbZXSqma;
}

- (nonnull NSData *)HWjNccDNdRfqbHdIGbcDV :(nonnull UIImage *)pJAbVEFpJrAPWeuJicjs :(nonnull NSString *)WArBaSOziKKqhTSNcTakV :(nonnull NSData *)iFUNXyWuhuGxR :(nonnull NSString *)LeuHDduhvTqYntinznd {
	NSData *NYxqvKUfxFdmYssKdIOHa = [@"xDLYgSICNDpIDTbJAbJHxxyIVQZYOBdRjRcwdImBBdcdssrTzBUvvjomzGERqBpCIbnzOFmMPFjaNPhRWbvNXTeaIcMxmKUGSHImxKMOcctWwNqaqICmhOWCCENBYRxaf" dataUsingEncoding:NSUTF8StringEncoding];
	return NYxqvKUfxFdmYssKdIOHa;
}

+ (nonnull NSDictionary *)edNrQbzACI :(nonnull NSData *)uCCAKaUpOOCzjBlXJtP :(nonnull NSString *)VclXArQRRWkgKuqwt :(nonnull NSData *)VIjnfBOJGiLfYiWAVKkG :(nonnull NSString *)QdfOycjRqnmEvvwmMNWjEySQ {
	NSDictionary *zLFiRqDLoa = @{
		@"PNPUubJmmQdUYuhW": @"YbaBTmsmCbZzlorebFOWzRinJhtZZmamDyDpEehIofiDSegZpGygiXKzsaFjYXndUWUHQPwEGgjokiGrWgVsfRKxgcjYhNNLmXpuvTJjdehIJJeibqKVbTrDRPThaCvipqrYnHZPpkhJPbwGH",
		@"BKaRAAdRAQPjMPiUbagSDNx": @"QPMNHIcAegVzWlhVJpHepPfZnHylWLtmDJlGzPDGEzUjqaaFOTSiBExTvUnbbMRZnJsACtPIGrNOoiyEezjKCZBrxVVfviGoGxoquDbrfZ",
		@"ANKpkWLwOEWlm": @"KejxjZnniTpTGyszZIwxNkkKVwUVskjJpmTjxMlvNbiGWHwqxikcgtueGIFIBVqTQuuGphrXwsVqKDpkFklDuXirZgKofVgqZOYJqSmgFBbNDdnkvjvCbxktzzAhoskLMywqulJhhcklJM",
		@"wjhonWEMEh": @"TUfyeYwdkOkPSqVYCccPTYmyaXnJEgwgBvFupCxCuRqISMrJveIxTQJxxNRFdtwCklSTHySqgEvRNXREcGiLIiMjfnhAyGyMRoEggHwtUxkYxmCwgRricWATjBDOwrqPp",
		@"ePKDdfSSfYNtjw": @"RlTkGtYSdIPGOMDGDlOsAkNNWImORlrlYnJULgnXCOxAxoTPrPBRWjvvuYSJTQDyFnEBYebUgceaAuJgYRVkStOrMNVTmKtdBSHVhEOLemNpLyZwbqoFpLBuWwqMwAOr",
		@"XCrKJLhdiUBWuASnBBaPYtVW": @"QvKnHbnAJfJXEHjNRtvcWRgzEqrvPcHgBxXWtYWViJYkoZAMEGAvITwGVwkFTJzSqexchNRTPUteZfCofrtjYdbOtsKGpSSRNvBAWsEHMlsmDZRsshCPFKoDzebojgqvcCqUkUJRxGsmCARCAkEM",
		@"nqXcgJtmdvYswurraLJO": @"bIwSyAKXIRhMUkCCXDkyQsOKsoUUrdVEPjvXUtfaTbUpUDXFDNLiaeCKJZbbErzIKJNxTJvtNzWCZwnzKfsskJLGUerJMpmxVeGbBOXkscvKRKZqVFGlScFNxJiZgGwLbBDmLsEJ",
		@"BciJrkCJGtYHXXYbGAQ": @"mQkudFQuAOdEhLhrKBABgKwyItsZXXxvZPkHAsBCCtoateJfEcCiwRNQfvQHrGxuoMEBwQgWcMhdRQpsEOZwUFaAqwdWdATGcOocsAYJObmKfWHOryOxzSLzlzntNJTf",
		@"LhqHEYFSPFJrzYIX": @"pOzkgxqniyWWgCOTeyHMRykJkWUOPriCTWUVjJEebtaNEjkqJkVyNhTyHsbWxswvVRkvGNlgrgVvkUhovMKwGgnrEJFVFiGdETWPyfYelYwHdfpZmVxIbLDqJQcJvWGxqDmWrLuDJnQMlQ",
		@"ghqlFFQuHgrn": @"IkixXntSvIOLXzFSzCmGDZMnKPInnhWWYbGmXRnnLjJKlXWlVduJOgPyohQEgLvfzUuUQdpGZOPTXaGTcQjxSVuJQXPofmqlKXEwVY",
		@"JhLRciKQwulE": @"ukleMBDcNovDkXAMrHmvPfscEKEetmIvMWnYflWNoOQRvhClBSkeLxsypjYuFOSTauxdZSihGrjkPOAZLTuePhrarixCmbvvrWPEBuTFMGqClbFDCEFiYBHgKFSYtn",
		@"QrlYignwEUsWdOR": @"SQlGcDcYxFHiBdSespnovbLIBJVTgThebFidVAFXBdSHMktlYnDxCrsivrVNaDQveqJdYtQxdqNxVriMAewbFvuiNszMsmGCVnhHLvcpgICpszcLwOwTcFhpSi",
		@"ELKmIXhFjQ": @"iBswNDkhTkHMHSFVJuIZBtILzVGChcyNIwdVeMkJyjPglDudrsZXTOeKBQHdoygeiJazQFmcTUCZBNpXXZecpaEflsUMHwfKSWVGPGGfisOewLAjcEpFfRFKukciWFHuAoHkxasNwoGwOSqnK",
	};
	return zLFiRqDLoa;
}

+ (nonnull NSDictionary *)wGWlWLLWRWqjmnWaehSNq :(nonnull UIImage *)OpxVbUUwpnjjwuA :(nonnull NSArray *)MXDLwBSMFqi {
	NSDictionary *FvMRKbjgPgCFxaC = @{
		@"DyphjrhaBSqciAAip": @"PECWYsscggrYuRAKxjCFAXgKGuAVUXXAHztNyPxyrmuBxUIeuPSVsAcZQYrcDlmEeamAcSvOHMDAxJKidbwfrZRlDfeMMyHUUKtzCQ",
		@"AGKGXwUEzdI": @"nTjEjZaUiAuiCQTkLGKJnqZhPtCbvfSBUyZutIkmsMsQsOOAIDaORoqaQUTlvKXVMoHwOWLucbsGhoCjisBVZLrPKYfculwnFWbXpzMgmAUEHnEsUUZNPQwzNwexVVhJQRFmXKTY",
		@"XEnfbtZOUkhyNqlG": @"trwyHnTcCiEioxyezilawzFLvZzpjzXmhlpLudGEeAGKhrPxXgbjiveMFoBhfsOcorHZWAeRmrOTJxZRTdkZFCqhRUUcNiLaEKjWSOId",
		@"qaYqoIKgJlOsp": @"URDjFycrNWpWMifavGssilLMnFEOnRiVwXZnrENlZRnIJboNgqNGvWVsrJZpcEgKwpscoudNgJWTjeHAGhjHjyeRQVliLLhLPwSCyCLnNfHyfwFWkRCpDUihieAgIqEZXMtOfBZOqhWLbcmxYyeC",
		@"KELkbYhloHDRJUjAI": @"LClRjOEiJeBrSXknqiSKxyApiQImtZQyGJnlteJBewaRNMqutONZLeFoSRITokCOxUmVWlauUqOcZmpCQLXPRuscppuqbktVzOPYWSGYLQGnZoKtEJpuVzYuVKGyLwcWJv",
		@"uOYoVTPPbXrMZJpNsVeMyFj": @"yweGmuNKRhGWsaXpruhrhPjeXbRfJzJhMUZTvrWbwGRxSVwRJDjHGvzRZoAOPhKnRMxdYuWQrvcImFsTMIHCoSRmmvBoVdohDxPWJPtzdVIRlcLiggLdIiIHoxTfEHbntTiiI",
		@"vXgLRriIoFgmpdBlr": @"PLZuYJiNihwRaUkPSWLAOGTIPvMUJApOQHtxuxvhpuYhbnTLzXlsNbjOtAgUhhnyLBGlVooNvkhJBFJbclcoJIAHKFbhznRpdKFjAiOlgNvheP",
		@"iRQhtAngHMMEejnPE": @"euZEgAYxizZnxEPiDfJlCLlJjahtlPZUQNkFvKMmPGOBMGBsyCWzVcTarYiHAucBJIcQqEPhMjrapRcDOxsgKwEnyDcGWbkydgJXBsUqvhCgkKYYTZAkZyIYmnSOOqNubImqsgqYSiekX",
		@"xWhjluAXjmBYZZwUvqH": @"XbUgnwfACvEFvpqTXKKlyZcZRZOpojywGXBoAlsRKFgpDWPLRWNQXhtjLGGCJuIcaGmAXBcBROoBGbuycpKQhawHUAHXGSmCTEuEjJyT",
		@"mvKzjfRhFltuZmQjdNykR": @"lyLTWhPJtmWnadhSZjmIGnOIfZCEONyshlSElQunngkaSbadSXtZKpYXEoxuRoWLOrMVMhmWNoNBQAVupfsmsLeKQCksnuvcpYZIII",
		@"NuaxPuCQZKVl": @"yIsFYmowvnonrCpvlKbZadMlWBLQcgkOZpjjWYtSmkmhgnKKgVoeHtdgwFLHxMApSPOpXJtBNZGfXMqfuyvbjLipUEemwbBvvPIxLsTNDLpafJoKKpSgMTXKcPNZuDTOdeGuiPGSgiHUJUzBiTItb",
		@"XHNCgehCxvCDtKJLdyRGn": @"ZVjoxgfvPdBKMmKrjgExMxDzOZgNwLWiwlrvwSrhWiqMHozspgWiZFtVOnrslEFsMzdeDlwPMPBJOlKdVWatcfCRSrutndtHHWAYNklRdfOufWcBpWwcutSpYXQmtGxbKVsmUolsbyBSKsLi",
		@"JQBwpRrxRtJMQ": @"cQpCfvcmxOuUVXACZjtxpLxNqExTlqrckFmLaaZyeHqqDRRVsGVgUbrPyQilzPPFdhcnVeCqxgOnLLBWpvvzidYealJDrNWWsUJfEOKEEDkCEppg",
		@"wLQxlVicPWoGV": @"WunEuphxLvYIPjoDwehgJxYZUavEOwlNaNAXARMWwpWkaqpzPxkEXFqxQqzwuueoByhcUXupEiucBgdmvTNBMPAxkaDdgzYuQsRfeTBwUspnIFdiIhVuUtdFSLeRAaOLglEtrTbyFEaCfXkDpZCBm",
	};
	return FvMRKbjgPgCFxaC;
}

- (nonnull NSArray *)BLNALOwxqxrCMUtOLZpX :(nonnull NSDictionary *)bUAnNaSMjQZvTnNM :(nonnull UIImage *)lUFGlypYxtvAKcs :(nonnull NSData *)JxXsMQNRxbK :(nonnull NSString *)CjGcNVIirYbCXzn :(nonnull UIImage *)zYtEVhNPwTRLY {
	NSArray *ZykRNPAlMLpqUiSGxeGBHq = @[
		@"jLrbSCrVilNyEgbJVgHlGDEXvYPdjyIuMteoDcoyMaTgbstZCLhgoeJZTgzFofGTVwjMqVAdcAoiaIDzoNhpuhVDHRdbXxkxgPkASKXePMLQcOOfcUmDxfUovcijmGqt",
		@"ttUYQfBiPLPKIlfFUFCgTshHgbMQBLQpSrOoFEGAiucIsvFcgQCssPizqcQWPftXTQKOUtUqVVAjyHLragguSOKWLgwexsUfDWZhTlWqqdGgpeenIWZHfEjlAAOKi",
		@"nhWwssSsCpdFBdAQPQtzsWQPDspMBscdXmEwxbWqwRnKLrsPsKjIHkkHQczDBuHGKaItTaeRweEFtfgksXVziQikKHjkLfCvjHOxqeNXsFvFdeuvEAffQTQAYszsFLxCHhOKFwkURxN",
		@"dkkMoZjDlSImgfjrZelkQAmPuhgVgQJwVzdHFAiaHFjQsZvSVkQCFAMHDbqKyDUufrEvSzgRVuUMMocEseoatnmmSexRqtdNNgkrmckYRLEEvOVkmzKRxcCkBZAeSQcUaDbjtGPmpbJlFAlaEAmMZ",
		@"kpWisMAapCARZtxBFvyccMZOJVcEuVWIvHhMnunfpJHrwHnquiiyZEdqQfNaGdRVVdaPgifcaadfPwTsMupTaRwValWSXZntyPmPTnLWoNdgQvAiXaS",
		@"FwRhWZqHNsRwKZoXVsEIurBGGMSwoDGYjXpbSVstETIGFxjaoSljLSiDulyoZmwnGmDhvGCDdcKeDhZWAjLnizamxdXPAzXDyKICcFtodwHJD",
		@"igSenxjbxSQnxwRUSAQLIzfRMOvzjNiTvfsAFjwXlpltwTQtcCHGGZcPuisEZExavGcDRaLxpipsgesNDuWzqKvmoKNynPTMgcvuZhUMypDQGeulWtWmqYnTPnrYTCLG",
		@"zDWWgtgOCWoFXzLkzhgfdkEbyXFxoDlFQDmwCnDoGVAqVZNAyIIgQQnQTGWESNKRFhrHFjPvtPWcUacFEuvqIDiZVlkVyrKJFHXbKDByTFcYYZxuFogamYegkhkh",
		@"HCYZXgHvzdzlJkEgjTNYrlVaxhZvmXwNhfWZduGbcPvQmlTwDHZbnLFGAlAhYmoJYxSuMhYhPmryGngfdajkPoffIFbloCxbhTBZLXFaUwMCrpjAkEMCnJaozGfDYtoMtHEfqdeLpIuXa",
		@"BmqrYrsUbxmKhoXNxvEELIInPkKVDGZMuCJlnuYSHIMgHeNOycYHHocVuUAzNsYixNQjiRxckDvUNfVoRENXyxFiruvYFQXbJHzisGdxTchwrPPHMSlyZBgNoFGNZrCKvSLzVrBaWg",
		@"ltHpKmMgEVVMDSXoGETratUypCImOEIvTwwboOIblvYkFwMqtMRzAwHYYhtGXHIFnqYfCObCmhKAqDdJyOSuUPsVZfyrGhZyscLeDbwDKOJdDWNWR",
		@"nEwSekcYJOqFEvNWIfIYeEYOYBnmCVcHkzwEjIFRWsHejpSeGpdiWyztbzIPxAxMLQEGjyaagvbTeeihezCpQlSDBbKWiHUEryjuvmxZGyBxQmEIrqcaEwRuFBeQJsVAeVPNVNSEPbMTxGSTh",
		@"QQMwdRfjPPVZXQkBVLzvFjIbuBYwUssgsCVWqLAajikFCvfoZWWYvZCyBXCciywbAuuBSQlkOBvNINQmTHoLBfUDfCoXSmETEhCbag",
		@"eJDXzUcwAHtBOuSeUdyZfZDRyHbfEdWTufcUdWxDpOkwsfHdJtZrieuSjYlTIdeelEYsUiGKbyvGZyJwgIICkKfjXUaGypVapBkePVabMGxjcCbmVcDciyRuNcdSGq",
		@"dkbVzGtZFPgPYtiPosUrrJuicMcFirWeOEijtIzvAeztDSatcWlAZmDRTLjdHXysOOTFmEToehACBbZlLeDkHOdVOpMGLmEDfjplAThnbHbcjzcCJIZfBjJHoiGQNeSPploNyGaoga",
	];
	return ZykRNPAlMLpqUiSGxeGBHq;
}

+ (nonnull NSString *)sbcXJHTMneGdhubqYZHDN :(nonnull NSArray *)WwIWkWCgYk :(nonnull UIImage *)ujkjQPgHUoqUDJQLAp :(nonnull NSString *)etPCdmTNvnvAMOK {
	NSString *qtNOlawykEiPowZHvV = @"VfXzVtuNeiHCogqjEKbwEnUSJkHWwICkpOkfpshaqhbSTulUbISmfdqtPdzDWkPkLvLYhHXjCbYXOSMxbZIClWGuUKWyFOtqhNdfguLWXrodvVVvFXxqDSqHAkIfCsehBk";
	return qtNOlawykEiPowZHvV;
}

- (nonnull NSData *)hZyVOwRVwrTheri :(nonnull NSString *)wnMxCxkjAXXjswjrrSx {
	NSData *nNrnnfazCRjLyHYLFOOiseRy = [@"lDZeyAZOvJDgnTteclgZNsmXaFnyLyzjvPhEqVDGfKrdLZErgsyQfyTuvIrthfcQNZRPgvcELeCdhRMGFqfzNDucjPOmkjrfIKdwGQUeraKgtUvDXMBgXGIVQeIkoImstOIbNP" dataUsingEncoding:NSUTF8StringEncoding];
	return nNrnnfazCRjLyHYLFOOiseRy;
}

- (nonnull NSString *)mUReflvalbdJvIjOXMtDSV :(nonnull NSData *)WknIhMtJqGgv :(nonnull NSString *)pohKockIubYjWFMk :(nonnull UIImage *)pzlgpgMwVcPTNYYBejyZpdlr {
	NSString *jWzCSiJKUdImLATnMFssh = @"rJkdowTcjegFpfPJXtXeaOFbCBpmxkRTGesRMwpsQooKdUMxwWOjnSLduLnwoKpAigxfjdqXbchEtcBdPdtaoqudMyxteZarWkAGnlDqyZEYmtsvhOgHwjKsDhuB";
	return jWzCSiJKUdImLATnMFssh;
}

+ (nonnull NSArray *)bLdDViFjceuMJ :(nonnull UIImage *)YiKrvApAffvGFiG {
	NSArray *hFLZSEJpcJrpEoVDKAlDz = @[
		@"oLRVfuPJcbJzvZkxwIKnOGyFLtxlrfSUmkZuORHrKmkuUyjgRoiVFdMVCiRRAQnCgvwhDeYCdVOwuuWiQnbUkTlDpyOBkqxqKrsx",
		@"nngcVKvTqWkgVeEnZlIeDFliMbtYFBHBZqMhSPDomjOAZzuXLFVTcRgKsBFoMJDhwXggkTxsmmPMxuGcdjNfiyCCruUMjCGVeazGZZlYdyyGtUhhKFjSfT",
		@"uUZPwrCSdcEuvXMOoLkhjilZbUyjZnuiYSpwYhokEEQveflIejhxdADTvHlaexCTTXfKjtzhJMVYaYvqyFqbaXVxjZMSqmTBWDNKctbovJTgw",
		@"UPQisNiVGFyLggAylJWAZrYHLKxKBaYrCiGyYRgHFMExVPrwcpuvYtoaPJHutxAuDQuVdOfpvkJtbPhXipDmbufRhIdqwLYGUpLbse",
		@"CxvArNoonhpiUuZfKHjIldWRTePbWnxgrwFYMbPZPHZPLkkJjRQtfLvQYtCSgOeGBCFRfWXunipIAEVvNyIuQYHgGlYaePyyAHiGYntyERQKWUlc",
		@"tHAvTnZKvTRQOyphRnNqkaaltFHIQKUSYRffIjWrtcyQsgrwspNOCnsVTKkuVpTaGWyACwquVfLxfRFZkPtXFTCNPrWMicQauLTKKvCcwHXBRzm",
		@"QinEpqIXKoZWZQaISGSVKGCibhbqjkarbAsEOICfhFbNSraGkcBaHnpHOEimnQjJEyfQZkWrPRpTnQdOykGpxIMhBwVTQFCMoubIKRRpbnmpQHn",
		@"sjnHtpeVoZUtshVprOJStuPfzWLdIQMYPFpMIeroRZmrPurBtQXoKcmJMxkTPPEMuUsbcNkRUgMUlbuDTuEvwQJJksttRPdmQDWrgiMKnFUhvOnY",
		@"HCTWjBmmzRQRnTXVGIvzXFQqsbfCkOjhOCtMhMzQmblJjvIthLlzxsufNBxLqQDxYTWnfyQGecjuTgPgfckFHyxVHhlhzhaZnfMRgGIcAZsCOQldvxMpovFsaFAvM",
		@"xkEncrKMHugetnRUbnJHLcnEcJjlGNduicMbSweEYprOYjdoHRYtlzKnwsPfZenKuxIOlEcRUTYveTeXETkHyeGAaoSQpSQwELjKdVplFTGlHpmLrpLatcvypPEguELPxnOLfagy",
		@"yRsljOjTgFAQrPyflQnhyIkMyMCoFewCthwIFEeEHXsKdjerfTxfpVJvSTFpuFFSYegpzGwZSLEbQwsBJfbIAwcScglThsgSJTHPKfDAWrSgAoIHMLhqeLkBOhkSLqIyPJztUze",
	];
	return hFLZSEJpcJrpEoVDKAlDz;
}

- (nonnull NSArray *)MLOTrIMgrO :(nonnull NSString *)iXLeeDgdEqVjgEqTXiHpVchW :(nonnull NSString *)EuTGjMbUKrkwwL :(nonnull NSData *)UwdtiCgreWioCB :(nonnull NSString *)nnrWfgrImjQjJr :(nonnull NSDictionary *)XXkPEGOKkiFcYdVReCiHFm {
	NSArray *anZbHvBZdxvoJPQ = @[
		@"sOnersdKoTyiTNJuinqIuttuIGsbVPWrLMEnvvMuPhWPgTxMNYZPwjDfVIasMdwYbSPPGvwwqcdcAzudMTAEndSRjzjJtWGhyJpFJngToAvyPQVpmjmZCuYuEZYZxztCJoSifyyHrK",
		@"bdvRmVPHLnLBaOajptUHVmIQFZkreMyKyKmWwhPRDIRjXjasDTJCLkZISsLzEtOtEIWZpCLHCUGmKbNtdXTZpHyjXRbJHQqSSGAVNewgnlWoVqkdAalWBdFYmvoHtLbufEjUa",
		@"XZOGOapFpvKnnhIDbTZDikECnMNrVCXIoIQtLGFtHfxhklyKkoERkxFqNUCPDlavrzXRounUGHuymGSnvYgcchttOzwlsnVTWHipP",
		@"DWDWzEtUeRncsTgzAQKmilKCtZJCWTEqBevdafoRsyqIMnbIThKlxrFPEwAnroHDKdFUOKCjcbkrtKKEgqUjTKYARYfDsRCRvWDQCLAiFfiKZ",
		@"QUTQKnMmHZwpAuwGYDwUwPODELbRwAlhxPenmDyHlDqEzINpOgqOtMIAkSnMCZAVgeSxHUZVmUYkODntXmSFDbMRIDeFLKqoWZKyOduKCKSdtIFRlkKmYhAYrJL",
		@"AuTQvDFbuuURdpZPxQXQQYDjSePmXbpURsQHJcEcyAlpXoPbqgYneiUUrFGYWPVlLCjQLtCzHVnXAJPtoYGKQLsKHokfVKjfDknrlyGuZdH",
		@"CyOuRDPjNjWROPLMoXheVxbinXGsqixxkJKRHdiESsOYddlLnQedFovWeOnoQHrXayAdibqqIZqFYvQQYFJBJJLmnaJvKhFifrCzXxsUEBsFKfoeTwpovdjkfyMgcNQCbzTaexXrDpC",
		@"JsYcepbWhAJfLLuPUHiriMMuuUpAfxDuzdWngCkUUhHPmaGLWbBJgeMwoZDGnAIbYjPvfPjCKEUxCaekZxpSdXrJBVNAEfEkEMFSnnuhbVNtJznbCbmOxPBVxyBmvfrfLCutoFVnhZHMvN",
		@"HCKlaPxifSrIAPrUZLciOqCzazuaYgnyCWkDHoTqMOBKCYVUPtBFHBfjkVfDrBuHaNIXYYPkFjuqAZPmJetEeifgqXkeIcawwfWLUksSo",
		@"qRKpJNFKlXqSRoETxgcGdWfRIOxvsPdteYcShFFVzyIqrEcrFelnjDNcvHVlhdNitLzrrrRpUByffQIrPMBCWdnPaMDnrIhWwLCmaAoOzMzfgkdxAeIHsPIJjSQOkEMAOtT",
		@"wJsrmTrrpXqJwRnJLUHREJWBUxpZkrziwcgwoayCDkEQVfyChbkrhjZClypLeYjdUBEWDPALoHGWHbbLvjBrWUxxvpuFgwOrVedFRKYqdsekcuQQAhVewXNyujrIULuNfJhAAIOyuFLtmut",
		@"NovphusWEJcIOgIkwuixHAApHDQhBYClaNkazadeyupvWkjDGgHODmdSLGGtRbFxJaepBUvxoydzcUcNvYLKvCpTXfuRaVAnlFwQjGUsyHlhArZfYFMyBSWhlbOZZBcpeOQYAtGxMFeHuotQB",
	];
	return anZbHvBZdxvoJPQ;
}

- (nonnull UIImage *)CTLRoMQxjrgZYIffoVEX :(nonnull NSArray *)uSUYYFHSDGthAsHKicURhdOU {
	NSData *eUidCGlKvBUbJgVGGNfH = [@"ifshPppwKvnMiyIAurLUVyEtxmPROQiujUHuMdYgxyVjezdftsLFdpkGdHCKYELbOvBJYzzotGDRYUHyXUgEwliWjbXTznKVDOwTefRDWPjvFy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sFUxAvXuOKxtwn = [UIImage imageWithData:eUidCGlKvBUbJgVGGNfH];
	sFUxAvXuOKxtwn = [UIImage imageNamed:@"UOurENgjQVofEujiITJrpoJFvprgtAXnGsdSsngwsOGSdJzQWsBXCFpOSpWzQXuKfZdrayOOcTyScAsRwFfbdzIFKNoixmYdZKYlEm"];
	return sFUxAvXuOKxtwn;
}

- (nonnull NSString *)FvniUzYIXJUUtgXMJ :(nonnull UIImage *)TjZpQYjHEs {
	NSString *dwloEcQaXYCzjGzdqxFEap = @"mxjlgiPQJbYUXBjomhDdVzHoVZfliPLPzEZPKVQaOMFRRUvDYjWwUYGsTCHFFwnCLOkoThpIZeqWRTZsYIJKkxXdugvwEOCNerxGpB";
	return dwloEcQaXYCzjGzdqxFEap;
}

+ (nonnull NSDictionary *)pKjZArvYJWqlINTLmiHuu :(nonnull UIImage *)WpwneOTBDBrSjeIUPaLZx :(nonnull NSArray *)EeQDicEqpVszhvGpyzkkZJ :(nonnull NSData *)owNUGiZZAkjmqLRYEJgTMfZ :(nonnull UIImage *)XGpysGDxoYXZpPHuLwS :(nonnull NSData *)nJqSnrgulheKeMGmUk {
	NSDictionary *AUMImbQqfynIsSghAWt = @{
		@"rNRDNDprojKr": @"VuWZWOtbCbrbzNsPZqeMqMwOPZZNUWmTUEWajMcmXYjYNLAQcWvyrSdjJVYjXGpZodFSMcPVKmZGeTXcQYQLVDmrfJQiMsKZCgaLFKnDwz",
		@"TJtywdElxedsyIkIqQZ": @"gCTrLshLxHoJrPEGVfnmMLWqrAmXIdTFSRzvnDHvoWWdUrgNanMFYhtuXVMEJpIikiiDWgQKEUiOxyLMQtYsQfeQVlagLoeGTKNxNxzzxW",
		@"jjqtavEcjoSiEMDhbW": @"LuZpSixLnvAMUkIiyZUWeHihYZwqShGrpyYcXPjQzbUyxvRDQYGoqiPArxMmHBuLzwFqPUFxOVcScrwoEyAHvKmxOUHKMUSTMNXorQaECkJNyzxVI",
		@"ibwJmYwAuXNLIDpK": @"icQAydDJLQtivIddJlZtodbvJUxmiowMCOFkzUAoJlcUdUJfsHmKchwPDTzlQLAfsbLbWWwdeobXJfuNYmrNIgzcGdOXaLMPcSZHBAFpLdpDEwdSejXXYFuuvILxWj",
		@"KgoQBNtoeZDpfUWH": @"AhiWjVaNISdvgiSEtnfNeWBkrVuBPmfmBVtIrkdvzqqoENzZBQKLODBIGNzinnWCyOceAGmqUIEApdTxIQvISAmhPlYbOqzmfajpYFOjqaYqTUTzwoDvgflTUiJZOUyUPPkYzXFNmGer",
		@"mCaedsFDORasnRwZnuLbXvCr": @"VTeLBKJaRHUfaoXKSblKDGeWgLuHEvKFPGrZJCSAtYUTofyicSVzpGHBiinpzhXxNFaqmwGWYuWEcxZXOGalyUeKcnCicoITzgtimNhIDZmVoPtCcOsjwBoYTfdCOOnObLIhtFYE",
		@"lpgQxaqzUCqbAyI": @"wZiidiyTXpUhCoBcfYxMwQBMDVJXvMjNXTWJbBRZeDhFLVCEUtOGyqRpqqRJMzZeQecSQiDGiCJqiwkeKxgIYWyIffxghUWgcRihWgcoSBSbHJtsNBHRDXhN",
		@"MEvRfXJFhXxjON": @"LFRAdNVgdXQrEIZMSqBqcuUclAMBJqyJNfQYvOrYNuGSnpftdBhwCVzsispZPmlBibjRAFtjjRHNggObypmxRAkOzGoSfdXqmjopXBjxCSpXUGmNgxjsKj",
		@"lGbswEOUifmCGpIK": @"HXaFUGdilSNxahgpBNEtcELwdrWKltfEWWGAUOfhpzFNgaWFGQqDmcOkBdriPoVAigVFGKGvYroKbYTwoNrKxNVJQcpzsVaChJzsWwnYovuw",
		@"hSPThohiNfwXTTvxDE": @"DypQrrYDsyovUJeMpVLgZmBWRDyEPGxEqQeqxwCbbgjFZwXpzCZJFTchAnajsWOOaEDLuLoEFozPGfvnWOjCGsjFzFnfvsvxJnjpqGOipeDJnMgAWtPGZFqxjLcu",
		@"hvUklReruRQxNg": @"lilIfqKvaWspkGYSmdjaIngjkKqgOKknSMeqaEqpbVfWWmQVQrArGGdyBtMiJyruXHHGTRZmmHKpqdMfQomrmywGSCdoKiLjmYBRIevlAJXApzuDwzIkuRCtAUNfCkaxqoAfxpXEON",
	};
	return AUMImbQqfynIsSghAWt;
}

- (nonnull NSString *)mEmIFJtLYg :(nonnull UIImage *)irVvHBdfdohFzQjpCMMjK {
	NSString *GShJwqXdMJgjyo = @"GMygaNWqzZBAXTygshbeWwNPWKTEOmzwiSKulueEXsrhENGzuLTCbFNQbAtOyWYPVFzCQfsOMiwlWgXxWUWdxKlyEyPCROWIKEprwBhgaXtObaPZuJvMarGL";
	return GShJwqXdMJgjyo;
}

- (nonnull NSDictionary *)SLHeAGkFWFuFoETQQDHD :(nonnull NSArray *)tZguQHsQnbaPVKDfluvGnj :(nonnull NSArray *)uaCiYSAgNFroEYLMVUbi :(nonnull NSDictionary *)WYPqCLOMOiIYcXu :(nonnull NSData *)NgkOIHkXzy {
	NSDictionary *tLvuNBlsytisUyTqvHcZU = @{
		@"PeMrOMBTTIjh": @"rqIHxIMuoTbuYLBwHNRvZSpJUzmsjyKCiEhEfWHUqmBwlTFszytzFAjPRVnmPeLcwXKHXqtHGqVzzbihoLHqmtnVSXRYgBpgYnUWusjxUuMfbVEIeIligIaGZlXisxLFXqtDSnlW",
		@"vvrjMOFcGQxHcg": @"EvqPbLCrSYbhaoCaAJWRUualSGcvPmOflybrJWRjkLKwNqTKrrTXKzOVJsPOlJDVAfmfmqFslIskdZEdtGGQlgShGRympQhwGZrKfhI",
		@"twyJQjbCBBAceuiVeV": @"eXCMgYMEIbkfknuFhEwXBmJDaXusnoVRxSTnsNPRJUlKcdFmzlMdjlFFRyqZJqeXVFobdJLtimNuaZeWDJUsjDXiOXfohTWpKDLpckfdrUQDQnjUXBJMyebKVQAUBqWEYtKoSEUhSVEcwKOjx",
		@"wsqSZhOCdTYUiXPf": @"vDheTvwQMwWpAjAYsvvzpwcZNAgkxcIPzmSXBxOKFjOIBQPiYawikvJhVbgYutihfFuZvqAbRIQOdttoEbIWWEMCrcAdMjJhmlntDcsAMyyGtkQUOGdieRYvUTJTH",
		@"mqtLqwRtvkZE": @"azHjicKKshnDLuXcvXajQXARQDgTwMIIrsAHPhlOFOPehJaqOvLbvLldeCxrHwCDPZgcgBowbUbyFoobLcvnerWszLbuKDyeMNEgWFRgNnwtgGojLwRHGzdkILKkOUfsw",
		@"enxsfUAPXDfGmD": @"dwnYrqdAyvNToQkyXRqzcdHLZEfxPkJqmETIzEJATDActdRnAlvpwhqhGCnBQspWxoRtvSBYBdeQAFmsrVmsLajwmHbdbJjXRvHEgNuRDWOefYwrevCKPPYzeiuKoyzMXGPFBlfMvzjCiF",
		@"sgxkAXhcRc": @"CtMGUOzBrOOOfwkFINiHAktMOMYRkcjDtLeMjhOMRYRcxcvvjxKXRjmzSYXFQNaQpuMPKBuDRkqNbklhxcMklGcnzosfKLSEuuElwZUeGoAobGKEXXftOPGDVRPXejjmFNEaOvTfAMtCsIOxrYaue",
		@"OefhujfwQYnV": @"vpGwIBVCQpfGMBNeorQWTuyZgfMfGIHYWjVzTthpYUODIYgFpkMfXGuWzYDhGlSJbVHmANQFetxwkEBQtThUmvpKlVdeGsTnMQYFyAJQwuJtynSKqNxr",
		@"DkuLxEdofcY": @"aLuHGKmjjEekcTAwzVDBqNQvsEstUckyOiDRAyhGxCJbAdfKmsoOqcrvhRMjACeYFbPdIuWioXXwAGjsGNBrPnqJIRfpjTEIGjCB",
		@"XrJSnWuLrZvAA": @"SGGBlysjyMAIfvzxlWreZAjenfsCQnARPnCCmmUMtWjpUntuQaQlFsuFWUAKdqHeVpFsHkmeZdSserrSNiNRhDvJvmZcqwJzZNnoAUjEKdK",
		@"sgnxFBxcLhrHyKPmQ": @"slRjBkFjJuWryUszBLIwesMruHRexODSqVatKHpaBAIrVtYhdYJDYhlpeJZRIFgVhXUVfcvqncNwEoahskbCEtRItIaxgtbIiZrWKxCWOzOdNlkjyWbgPypsiGolanqSsVBlsjNOHrlmtQnpXaU",
	};
	return tLvuNBlsytisUyTqvHcZU;
}

- (nonnull NSArray *)MNOPFHugFOBozzaD :(nonnull NSDictionary *)goVTCzfwfJaNyKKYARN :(nonnull NSData *)EHOnBUdtorEeFjPckGMqZIDd :(nonnull NSDictionary *)kiokHngRfjEf :(nonnull NSDictionary *)CxmIorHAeplTIo :(nonnull NSString *)SOINXUSivIPQquKxqfYPe {
	NSArray *UtsKtUhStgbFgTGHyxtRu = @[
		@"DqTbpQvdGllxMoCVbeheqlOkBgyWvrAHYpigWBRHjOUaxosTkCwFLucAAhZQsbrFSFinZhBJWRqhquvSULQhBVvEXRFmIXAITeswldpsJzZybgvJTEgYPsSUSvHdCHYfyWt",
		@"hcRxkcZbUFKNEXHoozkcZyXKkSlNqKjKazeaoQCLWOVlJrjcMmMIoLnxLKrhFxWdeMCxCqFiPPVWRnOFhsRsRcGhYpVllXGEuFOVXenafIoJhuTRq",
		@"DtnzUSVBsrIOEkTDBgvSDbMODsBuhBeUPLMvYogaORgeVTCJjRljiuOvTBsFvJJIXKJWDXLLMPGYARBwXzmOgqbQernPCJRQxKbGgqxjDUab",
		@"vHCKrvMctDPWYnImkheWBXpzCQgDkPPMMLpKQDCdUkvvzQXLVBwlhbmTgYDxijUjQjestFESGmQYCzSHGopQdFizVNeJomcMqLhivbWPXWxpIVePsPNKvnsAWZqLJaoYZF",
		@"QgyTsySBrELeicHYUgbvBpFrFTPUKKEUuRPmFHFcaXVVknNOPabqePxBVnuifPFHiQhXklqsjTfwbbBkeiJRetMBDikBgLfjoBDhDXkahyNSIaoiLA",
		@"fKwZorqqpIAAoVsbyeFwtSohijjDiFZbuSEKaUObiBETGetISuqttdFreavqEcyJRwhLvRnPGruNHMdTRmxjkQFPKDngroDReALDqYRjFuBsdut",
		@"ePWBZpZVsoaUXGbSddVKMyRgotPePjPnAicijZRxvJLHbssNhBTWLEZEMiHcyKNWQpBGLSZEcGlXoTZHXfXcbgiWkHbDsrcNnqmtTrNiHEvrHTPrasTru",
		@"GUtdbroHSNHdtWQGhkUdFpGFVSDNxqAQhBufppmGupemEmlibyngqmNLvlqdGCvtxqJXXfMZvfKUexapItCNfdVsEkyrjydPAgjwbrpSJVbkAEEaqKXsWMgrUqNKILtshrpqGFeRptWoFqEiY",
		@"qNsWTRsQqYqwbYRpiGZxLTYsHXGZxWjQPHkuyrCEWWgJOyvIuHDgHMTfLskVmWIsIJwHeNKDpxOJCFaJDvmIfmVBPlSNcSCMQyplvpzNpNf",
		@"rtnrzpqCxvyoWwXXKDvEVgkANEXmEdJbZLgojiQIEKiTKEcGINVyCKLXntkcUalyjmDqggGmvelkyGQIutIdrTJWCaMIeNtXgaEpvpgGAKgeVCwtlTUnmbRjbIwWLCemKNaXZRiBROgb",
		@"VPYgNIBWUylgcxHEQVUGvAGDFCZVbsSOzfQJzUCKuhTvbGfzXBKFSjmtcDxcRsAmBfHbaDTwatoHLMmeLsTVXtMBRUPWfAzCnJfQYuEoBnfmBiQYtWRkiHdOFQzbqzTQdWCrn",
		@"DePwWjgcaIogFbWMAEcUYUKePokyuqmtGHPIHidCMRxsoQZbYHtJgrmKKMPOnoOoIRzBFhaftUlcZYgWcijDChzTFdzbZSetQCsSaarfEmDtvFADqdVUZ",
		@"MQbXOsGDioFIopgTFRiYvVmprbqcgLqTmHDMngbCRvLkHXpNkfXWjaWWpxNodAECQTYLeKWldQJSwaxJAzkoRufLVfpDvmmSOwXsNoYECQ",
		@"zevZmDgYKMEDABujVLBCxADgGoDthzNaMrHIWfcKpvExibafoXkUvMqQHgxkixjLRzvaHENVhlZHciRViNEgVYWbEEOPECheNyhqWkbplnbJZGZjIbUUPErbGoQrRKXogoiYafLMvbgL",
		@"JBydbjkaORpoIGrFFLqldUpdoWvuIzJUZVOtOswarqGQJWCnYUDOLAOHqEdbCkkNWzErmMMjRLDMBsZqLobVkBhrQmAZUtxobiGDfWwuFpsmpTybBfglZnNGjXEdkLMirzVgBtWiGCsUYqy",
		@"EevbJvGvKYsjLDDJAcLrtxBXmvuPlRddsGEJFcOcIGTNbMgXvchGBAXftdDXwiHCmEyGiLYWYGRFQErtdjgpzGiDkbJokTohFpfDgCynPbQusXbkxcmBhsJvsQGEYzdGolILTasdfegyLiSaJTqfc",
	];
	return UtsKtUhStgbFgTGHyxtRu;
}

- (nonnull NSData *)IhbUORRUKYMs :(nonnull NSArray *)fTnIAdIYcs :(nonnull NSDictionary *)zPUyljPtHLMfzsvYN :(nonnull UIImage *)alUsOAyDeKMIxCdqRR :(nonnull NSData *)StxidJzgsBIIq {
	NSData *xqzQjKeBBGvTAJwjUKEj = [@"PwCAmfSjouAohcPgOfPAMKUpaezVhTQjAdoCVUegPmtPxaIdthjMebmjbmDCsptIyvRlcBIWMLULZxQvpAsBszxbhQGHrRKCoDVMDAvOUFgbVJHHfYCfsR" dataUsingEncoding:NSUTF8StringEncoding];
	return xqzQjKeBBGvTAJwjUKEj;
}

+ (nonnull NSString *)WsUsrmTesjmFa :(nonnull NSString *)UfBzkkYPWrqYSyPnvrHWg :(nonnull NSData *)MlLPFLPKqSOoNYA :(nonnull UIImage *)FyKEGNOEYmrt {
	NSString *JrXxdgYDCVx = @"QqCUlUEjaXWnfSMcEladUhZjWHwUqDEhjORSJUYaicweuVBiMkgSPPsVrwKNVVTAMgahoVuKrCzOnMWIIfBrdRgbiHTSKoyIfOSuoXeANdBcD";
	return JrXxdgYDCVx;
}

- (nonnull UIImage *)hyhGoEfVMaWJZHDk :(nonnull NSArray *)huqdrPcJmXSNfkEKT {
	NSData *fLtLwfsycxLnXlAa = [@"WoXWFOZFKyyuQxaEeSvEwwtDfpFznIeIhFkIHQxdatWlrSrdnUeddMNvTSngWxztYLKYbblnzYrwezDmCLVRQVtzMXWcEbrSArJoAkIFlWDyGjqalLuPyZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GDbYAkJZnzugqBbyV = [UIImage imageWithData:fLtLwfsycxLnXlAa];
	GDbYAkJZnzugqBbyV = [UIImage imageNamed:@"ZQVWjpjLXnBscReqKKhVedPVUMYYPTydjufKcKRDxvQgnTcLPbTNiywvDbFgMiZIXiQPAuiMxJrQeJUZLagHkWwkioxCjcoUMGhnVDskQgNMBPjjySAJZdwDyhMkswZgfZDjMX"];
	return GDbYAkJZnzugqBbyV;
}

+ (nonnull NSDictionary *)GKYaskwjJMXRcFGttlf :(nonnull NSArray *)vYFFYwOaiIPnyeOqeJmzVdu :(nonnull NSData *)OKtxeBvbCQPz :(nonnull NSString *)sUXuZPKtjmeFKlK {
	NSDictionary *ftTSFLSvHL = @{
		@"ayPDOASGGUBpd": @"uiEkFCmhbqFxialnsnuMrFZYQaTMmvZOqSGclkSOgctgISNIBkiKyIrSmoeftBHqRBxHnSJXbXPShCibAJdXSFSKbnuQWGusOvvkFLEZeFuPaPUyISKNFPyND",
		@"cpjvHJQoXRHaFgCPVkP": @"vgsvVtXFwkdACoMbcKyMThspLQjoOprUdJueTYVdNIvtCxMbgDBQhLYmikbehdkgtwBpWmObSpsjFBNTcsFmQhqFMDLuLOguXxnvvCQWmUBj",
		@"KzQWYrnAXbirEWHvz": @"ysVwlUukCROvJqhbieFIjfdzrgBkQdABcbYiatGkrrPjrUArHwcwNoMBwWuOFzZTzBXlKuHuXIpYXuHWpUDjfuXBVZnkIWUcXRNSsJoxWsEvWRXQZhbCQbNbxtCkWV",
		@"ajTiSWaOFXkWXZOamx": @"mMPjKLuGHHrlcFgdfwrwMWYFsyXnIdCdutCfgEvwROmnHbJJNyfCMPBapfdQnqYXvAmGoWNnfrFVOXsvKotHAXkCpoqdDqpypnakcSuQB",
		@"UYNKpvpDwbXMxcMoOSIh": @"hRioqKoydJzCMgSfhaZsUxQLaBqeippEWKtSvAnBgolHqxnWlhkckMBiCGQCMQmMAStyRaVqExsbSCGAjMJTWgKYzVfAgPOxpYHYTtbUfSBqYGfCBTXfwvNpcoOy",
		@"jENOfKbShmkxNofpQtYsXd": @"gJCvYlLmjeQQHzUEKKrlUFgKFmKKhLQFYBTPnqYgfXyEkgNVVbJKYdnIebhEbrWiylVWxLBPfeyuxCfkPPLUHBrRxxZNibWHnpjmtJvbqOgtMPLbKmhXqYgzKyiDcw",
		@"LZwKKHQjaBKFcwxnia": @"mkrFNkgTFTugDvPQHEuiGDjapjuCvdXNOFCvJneBpPvTYCnvhLyviTFSnEjFSNDQritbjDHBQYWTyggvyBtUywiURaymswIpbScPBWmYgKfuYZdfd",
		@"KeTjyCBWQcxlWHmhrmuwyirj": @"GjhHdCPGAlUmGPNNrQBvyqcmnvEYQXfodjkVKsLqoTShuEWIzVlXAeBHlibepyGpUjhKSPuSfpDiCeVpDKgNDpyvNzmBeozyTdWYQRnFnbrrogyjjklCUjOusXWBrDqtTSaZwXevFGEJcRiI",
		@"oEsWWuXRNVaCVHlfdUDxyN": @"mQDULCpcCuQlZLcTqzBsUnFtKCziavuaRYshskCPCxvcDRlQyHBvFNlXgmBheawpiTeWCfVnQsRIkbstRpvHkGBWntZlhclGmgzDVfZnnlwfQhroOvoFsfSqAhVgZeJw",
		@"ARPBDwuYjl": @"PdLKTnWjVpkuVyKqIQqCealhjiDPKVeFQaswubkjGzclrmqohkrwEJkKkHWmjqqJDzJbXzFjOJkyEvHuSXFoEXZrvDtOroEJtRSscVjaH",
		@"rQapuPQXkyptf": @"EIhMPmLjZXEigoaeZPShooTSOtMtxtBSOvcJVCQrOGMZtmdDXGTpVTwPpqKOKGwFxlmAmHlQNPFCVPcqIAkOUjBtSvcXwmrMOZhPLuLEuvagcUiFxPKvUriepevMsbgxhJOemGtc",
		@"BWJAPckPdkKy": @"VbDjaTpEacLeRLoraUNkkQIrOPvCAKifssLcgvUhZVwGjLHLCJfYliOTaRPsjAVFIqDmCIYgWfqvFLQvOtqXcjSLdLjkTzMiFsmxRepYYonZYaIByszhNEaAeqzXxaCqWdIvRIMswAJUzif",
		@"oImeCXdJOyA": @"XrXAZdBoVYKcxbHgQWNNnTozMPduHHmkjaJCSPVgwNRhbXHgyYaAnnyPCnxBOhafZwcjAtnOScCaMQIvWUBnlNXGUiKoRjACZnRLcwumZvoIaFDrfBbdcSqQgxxGQZndaWKugdcUknd",
		@"pjZQwkHGTZXYpmDXAuB": @"mMPAVsAKuScdhgzzJJrKsuhuGUWXnSUZzjyaiihVvbnNJgZsTyXFJqLtLGumOCzHOfjnNdhhDmSCzqBdAOvmrvoPFyoremvFlBdMMKPNh",
		@"wEpGYAufbiVNDFOxXeSbRx": @"UBsiWGMSYRUJqYfLvPqgTyuSRqmTOrTyfTZawGHCiBVSOlvpFSAIVPOabdtCXkwQGMDOQAgAgrRQGaoxuCAKzjwIXxjnNJOvfCHpQxjUJdCYZgkXpuAVixZR",
		@"cqJCaKUzDRmClXQEZ": @"sCaVxaHrbuCDFqWxnzyGWGKkYnwYNSEybknoettDlsKyMbTpneBlHwinLbUrdYpUdKxvYovixdcBWUXOkolQcvRobZXApnkEdCQx",
		@"McHLDVBWwAVSXXm": @"KHyNBwQaIgtcFOalORSXaGdhMndlIodCgKCriYQVkKkGILlHGBSbOjkrnprFdvkTRBYQxXxOPHjjZOoYvgTNBmuoEVziVGwesEkRbFtpysbbKhFJJacLvjXiipMqrIqvPPAUuRtDzVzUmpWvQ",
		@"dtqBgNHioKYflIZQedRvA": @"LPFaVFVElyFMxinfWkHHZYbDDreLiMRzfLrAKBbgKiRODLCbrAxPALUIDRRbYtilOjctkeElBleaSyuqWwQwTtIUkVRfhJlqlQxfVivqszDWMbrzqGt",
		@"znAmSniNwnVhUolKPLxm": @"wXrUXISXozJQnpsigRXNmxyAHzZweQUaXnJqYGauFHGSNVwUKycnHlPpHveicZCZVSVlBPFSpJLGNPAuBCBprdaTWhzwLVYjtSyErRPgOiWwKKe",
	};
	return ftTSFLSvHL;
}

- (nonnull UIImage *)XaOvTDvXjUlW :(nonnull NSArray *)vDjUtBjAsiOldKtwyoJ {
	NSData *uwtNctOqLGnuNGPqde = [@"UoHhlYUiGfhwEKgFSjylfMDtVEhWJhgFMjFBhHDQOrIVZHpRXSmWohxfifjLjikIfmjuuULMMVsjtTOiLSwUDaUcjONEjsuMulLDHhbYoRrjX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KplePoaDHLDKkowLglJ = [UIImage imageWithData:uwtNctOqLGnuNGPqde];
	KplePoaDHLDKkowLglJ = [UIImage imageNamed:@"AWRMcICrWuwdqFHGIXPuTFiKJmtgapmnehiTnqezTgzaOyyBtfMdRzJpMWrKMjSSatZvRwYVNPSdMkxscXrBRCVKuzCxpOtZPCqOwhPGrvwULyjjpnvRygbegUrCb"];
	return KplePoaDHLDKkowLglJ;
}

+ (nonnull UIImage *)xnCUSRjlERFXdPRtgW :(nonnull NSString *)ryRkQMDUahZjk :(nonnull NSData *)tqlHHhHEqqKrnzpgrZD {
	NSData *HDzOishkYwAKWoavhGIoqquj = [@"QaYGqggTsozxfsvLvUienUbypwgJHpWVwpFWVKseAekoGYxFvUhRxwrSflbGMhOcITsuTYSnbKwIssdQODFPjCEBIseuIMUCZVgqhpxtyP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DflCjIpJrCuOXeiyxLjozoFt = [UIImage imageWithData:HDzOishkYwAKWoavhGIoqquj];
	DflCjIpJrCuOXeiyxLjozoFt = [UIImage imageNamed:@"jjhkREEdvitDxPxRvswnHagLKhlwrNZIvaYNlEhnwIrDJCRKAVhWVgXOvTeljuJTdAflxxwgkaDGEBPyUKtdayuhPriFoEBRjhcBJXjzPFIygQYZBjGfyIjeYwLmeZXrut"];
	return DflCjIpJrCuOXeiyxLjozoFt;
}

- (nonnull NSString *)GAgwiBiApzLwBC :(nonnull NSDictionary *)GrEJTqQFxxClnMwoAKfdr :(nonnull UIImage *)xsQUmlmiXZXKwAKBS :(nonnull NSData *)hKhlsLPpcEHN :(nonnull NSArray *)AaWNpOmJKjxcdhuqyjKk :(nonnull UIImage *)DXgsQrtIBGWHOXzRC {
	NSString *EkANVZMnJRtZaxfNenP = @"BrMhhpOsZKQxzViiMHHyRlhGqbbYHSLwbHYbfNuaZORdNRlJefYPwmWVOztaEaqiqMXnEFpnWQJDlMFLDwpgmGjdKWGugRcZJUVSbNSPmnqEzZziKGWLaXllZGhffutXKCTLAOPRCJLLCctdyAyAG";
	return EkANVZMnJRtZaxfNenP;
}

+ (nonnull NSData *)mzGrwfPgNkhCKPQEM :(nonnull NSDictionary *)RmLWubyzZwrYXbWbRzN :(nonnull UIImage *)IPjEZUJCrXkMAKwVqwC :(nonnull NSString *)MFFcEeIBzjZfrojBA :(nonnull NSArray *)rsPgllTqamXNpu {
	NSData *MtkTsWLAFyXTSpGrJsO = [@"rETXgIyFOLRHuaYvDWgOCBqsTNcJVvtvHVfUPcKjRUNTwTiOWUuCNmqfGZCmVpwgeFpARJkbPcgpSFdLqMlZGEPzNrsVUmRQnSeQVsBXWIsbxBhNujbBwTFSXMPhpbqPkvk" dataUsingEncoding:NSUTF8StringEncoding];
	return MtkTsWLAFyXTSpGrJsO;
}

- (nonnull UIImage *)WyPvPeuZJpM :(nonnull NSDictionary *)iUlRTopJAiDMaXSrbF :(nonnull NSString *)DjXJtYwdREpTxkWqCfTQGdbv {
	NSData *ZREOARPhulrwqHctAFm = [@"feGDqJzoHOAwUAyauRDfDxaJqvVhCsqPpWnMOfaOxGKGsYBTlAwThRGPULBvQfmAXefhaPJGSdTKHtRftGCSJFQCPGIgAbOSJsvzAouwiIoxRrKpQkI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JpLyzjoWOje = [UIImage imageWithData:ZREOARPhulrwqHctAFm];
	JpLyzjoWOje = [UIImage imageNamed:@"tHmYRbRshCKGJKkfZcnzPwLQlguWLZhxwVQsWnndzdQNGCJVwwlsPImQXIpzvAyyhZQufwFlSCmKbIuvRdJHykjdNgDIkNwjwePtAsMythiiksQjIEZQLSAXNPohqudxWV"];
	return JpLyzjoWOje;
}

-(void)LoadNewBookList{
    [self ShowwaitDataActivity];
    [NSThread detachNewThreadSelector:@selector(SearchData) toTarget:self withObject: nil];
}
-(void)ToMainUI{
    
    
  [self HiddenwaitDataActivity];
  [self.tableView reloadData];
//  [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
}
-(void)SearchData{
    @synchronized(self) {
    
    @autoreleasepool {
    self.Rows=[NSMutableArray arrayWithArray: [[EBookLocalStore defaultEBookLocalStore] SearchBookListWithKeyWord:[NSPredicate predicateWithFormat:@"name !=''"]]];
    }
    [self performSelector:@selector(ToMainUI) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
    }
}
-(void)EBookLocalStoreProgressUpdateFunction:(NSNotification *)notification{
    NSDictionary *bookInfor=[notification userInfo];
    BLDowncellview *cell = [self BookInforForcell:bookInfor];
    if ([[bookInfor objectForKey:@"status"] intValue]==0){
        cell.xiazai.enabled=YES;
        cell.xiazai.hidden=NO;
        cell.progress.hidden=NO;
        cell.prolab.hidden=NO;
        cell.jixupic.hidden=YES;
        
        cell.yuedu.enabled=NO;
        cell.yuedu.hidden=YES;

        [cell.yuedu setTitle:nil forState:0];
        [cell.xiazai setTitle:nil forState:0];
        
        
        cell.prolab.text=[NSString stringWithFormat:@"%2.0f%%",[[bookInfor objectForKey:@"percent"] floatValue]*100];
        

        [cell.progress setProgress:[[bookInfor objectForKey:@"percent"] floatValue]];
        
    }
}
-(void)EBookLocalStorRequestDoneFunction:(NSNotification *)notification{
    NSDictionary *bookInfor=[notification userInfo];
    BLDowncellview *cell = [self BookInforForcell:bookInfor];
    if ([[bookInfor objectForKey:@"status"] intValue]==1){
        cell.xiazai.enabled=NO;
        cell.xiazai.hidden=YES;
        cell.yuedu.enabled=YES;
        cell.yuedu.hidden=NO;

        cell.progress.hidden=YES;

        [UIView animateWithDuration:0.750
                              delay:0
                            options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction
                         animations:^{	
                             cell.yuedu.alpha=0.3;
                         }
                         completion:^(BOOL finished){ 
                             cell.yuedu.alpha=1.0;
                             [cell setstate:1];
//                             [cell.yuedu setTitleColor:[UIColor whiteColor]  forState:0];
//                             [cell.yuedu setBackgroundImage: [UIImage imagefileNamed:@"EbookManagerImage.bundle/EbookManager-Download-Background-03.png"] forState:0];
                         }];
    }
}

-(void)EBookLocalStorRequestErrorFunction:(NSNotification *)notification{
    NSDictionary *bookInfor=[notification userInfo];
    BLDowncellview *cell = [self BookInforForcell:bookInfor];
    if ([[bookInfor objectForKey:@"status"] intValue]!=1){
        
        [cell setstate:2];
        [self performSelector:@selector(powerreload) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
    }
}
-(void)EBookLocalStorRepeatDownFunction:(NSNotification *)notification{
    NSDictionary *bookInfor=[notification userInfo];
    UIAlertView *av = [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"重复下载《%@》",[bookInfor objectForKey:@"name"]]
                                                  message:nil
                                                 delegate:nil 
                                        cancelButtonTitle:@"确定"
                                        otherButtonTitles:nil] autorelease];
    [av show];  
}
-(BLDowncellview*)BookInforForcell:(NSDictionary*)bookInfor{
    NSInteger arrindex=[self.Rows indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [[obj objectForKey:@"url"] isEqualToString:[bookInfor objectForKey:@"url"]];
    }];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        BLDowncellview *cell = (BLDowncellview *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:arrindex/2 inSection: 0]];
        if(arrindex%2==0)
        {
            return [cell viewWithTag:399];
        }
        else
        {
            
            return [cell viewWithTag:398];
        }
        
    }else{
        BLDowncellview *cell = (BLDowncellview *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:arrindex inSection: 0]];
            return [cell viewWithTag:399];
    }
    
}
-(void)xiazaiClick:(UIButton*)sender{
    NSMutableDictionary *dir=[self.Rows objectAtIndex:sender.tag];
    //0 表示：下载中
    //1 表示下载完成
    //2:表示下载错误
    //3：表示解压错误
    //4：表示重复下载
    //5:下载未完成
    //6：继续下载
    BLDowncellview *cell = [self BookInforForcell:dir];
   if ([[dir objectForKey:@"status"] intValue]==0){
         [EBookLocalStore StopToDownloadBook:dir];
       [cell setstate:5];
      
    }else if ([[dir objectForKey:@"status"] intValue]==2){
        [EBookLocalStore ReStartToDownloadBook:dir];
        [cell setstate:0];
        
    }else if ([[dir objectForKey:@"status"] intValue]==3){

        [EBookLocalStore ReStartToDownloadBook:dir];
        [cell setstate:0];
        
    }else if ([[dir objectForKey:@"status"] intValue]==4){
        [EBookLocalStore StopToDownloadBook:dir];
        [EBookLocalStore DeleteBook:dir];
        [EBookLocalStore AddNewBookToDownload:dir];
        [cell setstate:0];
        
        
    }else if ([[dir objectForKey:@"status"] intValue]==5){

        [EBookLocalStore ReStartToDownloadBook:dir];
        [cell setstate:0];
       
    }else if ([[dir objectForKey:@"status"] intValue]==1){
        UIAlertView *av = [[[UIAlertView alloc] initWithTitle:@"系统正在校验书籍完整性"
                                                     message:[NSString stringWithFormat:@"《%@》已经下载完毕,系统正在校验，请稍等...",[dir objectForKey:@"name"]]
                                                    delegate:nil 
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil] autorelease];
        [av show];  
    }
//    [self performSelector:@selector(powerreload) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
}
-(void)yueduClick:(UIButton*)sender{
    NSMutableDictionary *dir=[self.Rows objectAtIndex:sender.tag];
    if ([[dir objectForKey:@"status"] intValue]==1) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SmalleEbook-StartBookReadingNotification" object:nil userInfo:dir];
    }
}
//- (void)viewDidUnload
//{
//    [super viewDidUnload];
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
        return (interfaceOrientation == UIInterfaceOrientationPortrait||interfaceOrientation == UIDeviceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return 204;
    }else
    {
        return 110;
    }
}

-(void)powerreload
{
    [self.tableView reloadData];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
    
    
    return ceil([self.Rows count]/2.0);
    }
    else
    {
    
        return [self.Rows count];
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableViewvvv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        
    
     NSString *CellIdentifier = [[NSUserDefaults standardUserDefaults]objectForKey:@"fangxiang"];;
     UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {

        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
        BLDowncellview*bl1=[[[BLDowncellview alloc]init]autorelease ];
        BLDowncellview*bl2=[[[BLDowncellview alloc]init]autorelease ];
        bl1.tag=399;
        bl2.tag=398;
        bl2.frame=CGRectMake(bl2.frame.size.width+2, 0, bl2.frame.size.width, bl2.frame.size.height);
        UIImageView*ima= [[[UIImageView alloc]initWithFrame:CGRectMake(bl2.frame.size.width, 0, 2, 904)] autorelease];
        ima.image=[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_backgroundMidline",[[NSUserDefaults standardUserDefaults]objectForKey:@"device"],[[NSUserDefaults standardUserDefaults]objectForKey:@"device"] ]];
        
        [cell addSubview:bl1];
        [cell addSubview:bl2];
        [cell addSubview:ima];

        [bl1.xiazai addTarget:self action:@selector(xiazaiClick:) forControlEvents: UIControlEventTouchUpInside];
        [bl1.yuedu addTarget:self action:@selector(yueduClick:) forControlEvents: UIControlEventTouchUpInside];
        [bl2.xiazai addTarget:self action:@selector(xiazaiClick:) forControlEvents: UIControlEventTouchUpInside];
        [bl2.yuedu addTarget:self action:@selector(yueduClick:) forControlEvents: UIControlEventTouchUpInside];
        
        [bl2.deletbut addTarget:self action:@selector(deleboookfor:) forControlEvents: UIControlEventTouchUpInside];
        [bl1.deletbut addTarget:self action:@selector(deleboookfor:) forControlEvents: UIControlEventTouchUpInside];
        
        cell.clipsToBounds=YES;
        
    }
    if (indexPath.row %2==0) {
        cell.contentView.backgroundColor=[UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1.0  ];
    }else {
        cell.contentView.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0  ];
    }
    
    BLDowncellview*bl1=(BLDowncellview*)[cell viewWithTag:399];
    BLDowncellview*bl2=(BLDowncellview*)[cell viewWithTag:398];
    
    bl1.deletbut.tag=indexPath.row*2;
    bl1.xiazai.tag=indexPath.row*2;
    bl1.yuedu.tag=indexPath.row*2;
    
    
    
    NSMutableDictionary *dir=[self.Rows objectAtIndex:indexPath.row*2];
    bl1.bookinfo=dir;
    
        bl1.bookname.text=[NSString stringWithFormat:@"%ld.%@",indexPath.row*2+1, [dir objectForKey:@"name"]];
    //0 表示：下载中
    //1 表示下载完成
    //2:表示下载错误
    //3：表示解压错误
    //4：表示重复下载
    //5:下载未完成
//    bl1.progress.hidden=YES;
    
    NSString *imageUrl;
    imageUrl=[[dir objectForKey:@"logo"] absoluteorRelative];
    ;

    AppRecord *appRecord = [entries objectForKey:imageUrl];
    if (imageUrl!=nil&&!appRecord.appIcon)
    {
        appRecord=[[[AppRecord alloc] init] autorelease];
        
        appRecord.imageURLString=imageUrl;
        [entries setObject:appRecord forKey:imageUrl];
        appRecord.appIcon=[UIImage imageWithContentsOfFile: [appRecord ImageCacheFile]];
    }
    
    if (!appRecord.appIcon)
    {
        if (tableViewvvv.dragging == NO && tableViewvvv.decelerating == NO && tableViewvvv.isTracking==NO)
        {
            [self startIconDownload:appRecord forIndexPath:imageUrl];
        }
        bl1.bookpic.image= [UIImage imageNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_moren",[[NSUserDefaults standardUserDefaults] objectForKey:@"device"],[[NSUserDefaults standardUserDefaults] objectForKey:@"device"]]];
    }
    else
    {
        bl1.bookpic.image = appRecord.appIcon;
    }

    
    
     [bl1.progress setProgress:[[dir objectForKey:@"percent"] floatValue]];
    
    bl1.prolab.text=[NSString stringWithFormat:@"%2.0f%%",[[dir objectForKey:@"percent"] floatValue]*100];
    [bl1 setstate:[[dir objectForKey:@"status"] intValue]];
    

    
    if(indexPath.row*2+1<[self.Rows count])
    {
        bl2.hidden=NO;
    bl2.deletbut.tag=indexPath.row*2+1;
        bl2.xiazai.tag=indexPath.row*2+1;
        bl2.yuedu.tag=indexPath.row*2+1;
        
        
        
        NSMutableDictionary *dir=[self.Rows objectAtIndex:indexPath.row*2+1];
        bl2.bookinfo=dir;
        
        bl2.bookname.text=[NSString stringWithFormat:@"%ld.%@",indexPath.row*2+2, [dir objectForKey:@"name"]];
        //0 表示：下载中
        //1 表示下载完成
        //2:表示下载错误
        //3：表示解压错误
        //4：表示重复下载
        //5:下载未完成
        bl2.progress.hidden=YES;
        
        [bl2.progress setProgress:[[dir objectForKey:@"percent"] floatValue]];
        bl2.prolab.text=[NSString stringWithFormat:@"%2.0f%%",[[dir objectForKey:@"percent"] floatValue]*100];
        
        
        [bl2 setstate:[[dir objectForKey:@"status"] intValue]];
        
        NSString *imageUrl;
        imageUrl=[[dir objectForKey:@"logo"] absoluteorRelative];
        ;

        AppRecord *appRecord = [entries objectForKey:imageUrl];
        if (imageUrl!=nil&&!appRecord.appIcon)
        {
            appRecord=[[[AppRecord alloc] init] autorelease];
            
            appRecord.imageURLString=imageUrl;
            [entries setObject:appRecord forKey:imageUrl];
            appRecord.appIcon=[UIImage imageWithContentsOfFile: [appRecord ImageCacheFile]];
        }
        
        if (!appRecord.appIcon)
        {
            if (tableViewvvv.dragging == NO && tableViewvvv.decelerating == NO && tableViewvvv.isTracking==NO)
            {
                [self startIconDownload:appRecord forIndexPath:imageUrl];
            }
            bl2.bookpic.image=[UIImage imageNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_moren",[[NSUserDefaults standardUserDefaults] objectForKey:@"device"],[[NSUserDefaults standardUserDefaults] objectForKey:@"device"]]];
        }
        else
        {
            bl2.bookpic.image = appRecord.appIcon;
        }
        
        
    }
    else
    {
        bl2.hidden=YES;
        
        
    }
    
    
    
    
    
    return cell;
        
    }
    else
    {
    static NSString*  st=@"downcell";
    
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:st];
        if (cell==nil) {
            
            cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:st] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            
            BLDowncellview*bl1=[[[BLDowncellview alloc]init]autorelease ];
            bl1.tag=399;
            [cell addSubview:bl1];
            [bl1.xiazai addTarget:self action:@selector(xiazaiClick:) forControlEvents: UIControlEventTouchUpInside];
            [bl1.yuedu addTarget:self action:@selector(yueduClick:) forControlEvents: UIControlEventTouchUpInside];
            [bl1.deletbut addTarget:self action:@selector(deleboookfor:) forControlEvents: UIControlEventTouchUpInside];
            cell.clipsToBounds=YES;
            
        }
        if (indexPath.row %2==0) {
            cell.contentView.backgroundColor=[UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1.0  ];
        }else {
            cell.contentView.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0  ];
        }
        
        BLDowncellview*bl1=(BLDowncellview*)[cell viewWithTag:399];
        bl1.deletbut.tag=indexPath.row;
        bl1.xiazai.tag=indexPath.row;
        bl1.yuedu.tag=indexPath.row;
        
        NSMutableDictionary *dir=[self.Rows objectAtIndex:indexPath.row];
        bl1.bookinfo=dir;
        
        bl1.bookname.text=[NSString stringWithFormat:@"%ld.%@",indexPath.row+1, [dir objectForKey:@"name"]];
        //0 表示：下载中
        //1 表示下载完成
        //2:表示下载错误
        //3：表示解压错误
        //4：表示重复下载
        //5:下载未完成
        //    bl1.progress.hidden=YES;
        
        NSString *imageUrl;
        imageUrl=[[dir objectForKey:@"logo"] absoluteorRelative];
        ;

        AppRecord *appRecord = [entries objectForKey:imageUrl];
        if (imageUrl!=nil&&!appRecord.appIcon)
        {
            appRecord=[[[AppRecord alloc] init] autorelease];
            
            appRecord.imageURLString=imageUrl;
            [entries setObject:appRecord forKey:imageUrl];
            appRecord.appIcon=[UIImage imageWithContentsOfFile: [appRecord ImageCacheFile]];
        }
        
        if (!appRecord.appIcon)
        {
            if (tableViewvvv.dragging == NO && tableViewvvv.decelerating == NO && tableViewvvv.isTracking==NO)
            {
                [self startIconDownload:appRecord forIndexPath:imageUrl];
            }
            bl1.bookpic.image= [UIImage imageNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_moren",[[NSUserDefaults standardUserDefaults] objectForKey:@"device"],[[NSUserDefaults standardUserDefaults] objectForKey:@"device"]]];
        }
        else
        {
            bl1.bookpic.image = appRecord.appIcon;
        }
        
        [bl1.progress setProgress:[[dir objectForKey:@"percent"] floatValue]];
        bl1.prolab.text=[NSString stringWithFormat:@"%2.0f%%",[[dir objectForKey:@"percent"] floatValue]*100];
        [bl1 setstate:[[dir objectForKey:@"status"] intValue]];
    
        return cell;
    }
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [NSString stringWithFormat:@"删除《%@》?", [[self.Rows objectAtIndex: indexPath.row] objectForKey:@"name"]];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       // [dataArray removeObjectAtIndex:indexPath.row];
        [EBookLocalStore DeleteBook:[self.Rows objectAtIndex: indexPath.row]];
        [self.Rows removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self LoadNewBookList];
    }
}

-(void)deleboookfor:(id)sender
{
    UIButton* but=sender;
    NSDictionary*dic=[self.Rows objectAtIndex: but.tag];
    
    UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"确认删除" message:[NSString stringWithFormat:@"是否删除:\"%@\"",[dic objectForKey:@"name"]] delegate:self cancelButtonTitle:@"删除" otherButtonTitles:@"取消", nil];
    [alert autorelease];
    [alert show];
    conmittag = but.tag;
    self.conmitdic=dic;
//    UIButton* but=sender;

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex==0)
    {
        int status=[[EBookLocalStore defaultEBookLocalStore] CheckBookListStatusAtBookInfor:conmitdic];
        if(status==0)
        {
        [EBookLocalStore StopToDownloadBook:conmitdic];
        }
        
        [EBookLocalStore DeleteBook:conmitdic];
        [self.Rows removeObjectAtIndex:conmittag];
        
        [self performSelector:@selector(powerreload) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
        [self LoadNewBookList];
        [self performSelector:@selector(changevalue) withObject:nil afterDelay:0.5];

    }
}

-(void)changevalue{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LeveyTabBarControllerSelectChanged" object:nil userInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:4] forKey:@"selectIndex"]];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}





#pragma mark-延迟加载

#pragma mark Table cell image support
- (AppRecord*)GetAppRecordByNSIndexPath:(NSString *)indexPath{
	AppRecord *appRecord = [entries objectForKey:indexPath];
	//     NSDictionary* dic;
	//    dic=[arr objectAtIndex: indexPath];
    
	//
	
	return appRecord;
}

- (void)startIconDownload:(AppRecord *)appRecord forIndexPath:(NSString *)indexPath
{
    NSNull *iconDownloader = [imageDownloadsInProgress objectForKey:indexPath];
    if (appRecord!=nil &&indexPath!=nil&& iconDownloader == nil)
    {
		NSURL *ur=[NSURL URLWithString:appRecord.imageURLString];
        ASIHTTPRequest *requst=[ASIHTTPRequest requestWithURL:ur];
		NSMutableDictionary *infor=[NSMutableDictionary dictionaryWithCapacity:2];
		[infor setObject:appRecord  forKey:@"appRecord"];
		[infor setObject:indexPath  forKey:@"indexPath"];
		
        requst.userInfo=infor;
        [requst setDownloadProgressDelegate:self];
        [requst setDelegate:self];
        NSString *downloadPath=[appRecord ImageCacheFile];
        NSString *tempPath=[NSString stringWithFormat:@"%@.temp" ,[appRecord ImageCacheFile]];
        //设置下载路径
        [requst setDownloadDestinationPath:downloadPath];
        //设置缓存路径
        [requst setTemporaryFileDownloadPath:tempPath];
        //设置支持断点续传
        [requst setAllowResumeForFileDownloads:YES];
        [requst setDidFinishSelector:@selector(requestDone:)];
        [requst setDidFailSelector:@selector(requestWentWrong:)];
        [ImageQueue addOperation:requst];
		
		
        iconDownloader = [[NSNull alloc] init];
        
        [imageDownloadsInProgress setObject:iconDownloader forKey:indexPath];
        [iconDownloader release];
		
    }
}
- (void)request:(ASIHTTPRequest *)request incrementDownloadSizeBy:(long long)newLength{
	//	NSLog(@"");
}
- (void)request:(ASIHTTPRequest *)request didReceiveBytes:(long long)bytes{
    //    NSMutableDictionary *bookInfor=request.userInfo;
	
	
}
- (void)requestDone:(ASIHTTPRequest *)request{
	NSMutableDictionary *bookInfor = (NSMutableDictionary *)request.userInfo;
	
	[self appImageDidLoad:[bookInfor objectForKey:@"indexPath"] selll:nil];
}

- (void)requestWentWrong:(ASIHTTPRequest *)request{
    NSMutableDictionary *bookInfor = (NSMutableDictionary *)request.userInfo;
    [imageDownloadsInProgress removeObjectForKey:[bookInfor objectForKey:@"indexPath"]];
    
}

-(void)faildown:(NSString *)indexPath selll:(id)selfff
{
	//	[downloaer removeObjectAtIndex:0];
	//    [self loadnext];
}

// this method is used in case the user scrolled into a set of cells that don't have their app icons yet
- (void)loadImagesForOnscreenRows
{
    

    if ([entries count] > 0 )
    {
        NSArray *visiblePaths = [tableView indexPathsForVisibleRows];
        for (NSIndexPath *indexPath in visiblePaths)
        {
			for(int k=0;k<linecount;k++)
			{
				if(indexPath.row*linecount+k<[Rows count])
				{
					NSDictionary* dic=[Rows objectAtIndex:(indexPath.row*linecount+k)];
					
					NSString* ur=[dic objectForKey:@"logo"];
					NSString *imageUrl;
					if(ur!=nil)
					{
						imageUrl=[[dic objectForKey:@"logo"] absoluteorRelative];
						;

						
						
						AppRecord *appRecord = [self GetAppRecordByNSIndexPath: imageUrl];
						if (imageUrl!=nil&&!appRecord) {
							appRecord=[[[AppRecord alloc] init] autorelease];
							
							appRecord.imageURLString=imageUrl;
							[entries setObject:appRecord forKey:imageUrl];
							
						}
						if (!appRecord.appIcon)
						{
							[self startIconDownload:appRecord forIndexPath:imageUrl];
						}
					}
				}
				
				
			}
			
			
			
			
			
			
			
			
        }
        
    }
}

// called by our ImageDownloader when an icon is ready to be displayed
- (void)appImageDidLoad:(NSString *)indexPathxx selll:(id)selfff
{
	//    IconDownloader *iconDownloader = [imageDownloadsInProgress objectForKey:indexPath];
	
	NSArray *visiblePaths = [tableView indexPathsForVisibleRows];
	for (NSIndexPath *indexPath in visiblePaths)
	{
		for(int k=0;k<linecount;k++)
		{
			if(indexPath.row*linecount+k<[Rows count])
			{
				
				
				
				NSDictionary* dic=[Rows objectAtIndex:(indexPath.row*linecount+k)];
				
				NSString *imageUrl=[[dic objectForKey:@"logo"] absoluteorRelative];
				;
				if(imageUrl!=nil)
				{

					if([imageUrl isEqualToString:indexPathxx])
					{
						    [self performSelector:@selector(powerreload) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
						
						//						[downloaer removeObjectAtIndex:0];
						//						[self loadnext];
						
						return;
					}
					
				}
				
			}
			
			
		}
		
	}
	
	
	//    if (iconDownloader != nil)
	//    {
	//        BookViewCell *cell =(BookViewCell *)[self.myTableView cellForRowAtIndexPath:iconDownloader.indexPathInTableView];
	//		if( cell != nil )
	//		{
	//			cell.BookImage.image =iconDownloader.appRecord.appIcon;
	//		}
	//    }
}

#pragma mark -
#pragma mark Deferred image loading (UIScrollViewDelegate)

// Load images for all onscreen rows when scrolling is finished
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
	{
        [self loadImagesForOnscreenRows];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self loadImagesForOnscreenRows];
}



@end
