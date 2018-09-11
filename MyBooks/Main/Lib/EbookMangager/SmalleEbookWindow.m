#import "SmalleEbookWindow.h"
#import "LeveyTabBarController.h"
#import "bookOnlineViewController.h"
#import "bookTableViewController.h"



void SmalleEbookUncaughtExceptionHandler(NSException *exception) {
    NSString *ExceptionMessages = [NSString stringWithFormat:@"ExceptionMessages=异常崩溃报告\nCFBundleDisplayName:%@ \nitunesconnectappleid:%@ \nCFBundleVersion:%@ \nname:\n%@\nreason:\n%@\ncallStackSymbols:\n%@",
                                   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"],
                                   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"itunesconnectappleid"],
                                   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"],
                                   [exception name],
                                   [exception reason],
                                   [[exception callStackSymbols] componentsJoinedByString:@"\n"]];
    
    DownloadHelper *postdldHelper = [[[DownloadHelper alloc] init] autorelease];
    [postdldHelper post:ExceptionMessages  url: @"http://www.iosteam.com/newsxml/ExceptionMessagesPost.aspx"];
    [NSThread sleepForTimeInterval:0.5];
  
}

@implementation EbookWindowReader
@synthesize MainWindow,leveshade;
@synthesize MainViewController;
-(void)SetupUncaughtExceptionHandler{
    NSSetUncaughtExceptionHandler(&SmalleEbookUncaughtExceptionHandler);
}
-(void)SetupBookReadNotificatioKeyword:(NSString*)NotificatioKeyword {
    //StartBookReadingNotification
    //@"SmalleEbook-StartBookReadingNotification"
    
    //开始阅读书籍
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(StartBookReadingNotificationFunction:) name:NotificatioKeyword object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EndBookReadingNotificationFunction:) name:@"EndBookReadingNotification" object:nil];
    
}
-(void)LoadALLSpecilRowsOnline:(NSArray*)SpecilIDArray{
    //@TODO
    //    CreateEBookListPath;
    if (![[NSFileManager  defaultManager] fileExistsAtPath:EBookSaveRootPath]) {
        [[NSFileManager  defaultManager] createDirectoryAtPath:EBookSaveRootPath  withIntermediateDirectories:YES attributes:nil error:nil];
    }
    for (int i=0; i<[SpecilIDArray count]; i++) {
        DownloadHelper *http= [[[DownloadHelper alloc] init] autorelease];
        http.delegate=self;
        http.tag=[[SpecilIDArray objectAtIndex:i] intValue];
        NSString *url=[NSString stringWithFormat:@"%@/upload/xml/zhuanti_%d.xml",EbookWebXmlServiceBaseUrl,http.tag];
        [http download:url];   
    }
}
- (void)didReceiveData:(DownloadHelper*)sender Data:(NSData *)theData{
    NSMutableDictionary *dir=[NSMutableDictionary dictionaryWithCapacity:2];
    [dir setValue:[NSNumber numberWithInt: sender.tag]  forKey:@"tag"];
    [dir setValue:theData  forKey:@"theData"];
    [NSThread detachNewThreadSelector:@selector(DataPareInNewThread:) toTarget:self withObject: dir];
}

-(void)DataPareInNewThread:(NSMutableDictionary*)DirObject{
    @autoreleasepool {
        int tag=[[DirObject objectForKey:@"tag"] intValue];
        NSData*theData=[DirObject objectForKey:@"theData"];
        XmlDataSet *data=[[XmlDataSet alloc] init];
        NSMutableArray *pp =[NSMutableArray arrayWithObject:@"item"];
        [data LoadNSMutableData: (NSMutableData*)theData Xpath:pp];
        [SmalleEbookWindow SaveSpecialRowsOnCache:[NSString stringWithFormat:@"%d", tag] row:data.Rows];
        [data release];   
    }
}
- (void)EndBookReadingNotificationFunction:(NSNotification *)notification{
    [[EBookLocalStore defaultEBookLocalStore] SaveAllBook];
//    if ([self respondsToSelector:@selector(BeginEndBookReadingNotification:)]) {
//        [self performSelector:@selector(BeginEndBookReadingNotification:) withObject:[notification userInfo] ];
//    }
//
//    if ([self respondsToSelector:@selector(DidEndBookReadingNotification:)]) {
//        [self performSelector:@selector(DidEndBookReadingNotification:) withObject:[notification userInfo] ];
//    }
}
- (void)StartBookReadingNotificationFunction:(NSNotification *)notification{
    //加载图书引擎
    NSDictionary *dir=[notification userInfo];
//    if ([self respondsToSelector:@selector(BeginStartBookReadingNotification:)]) {
//        [self performSelector:@selector(BeginStartBookReadingNotification:) withObject:dir];
//    }
    EbookMangagerTextBookDataEnqin *TextData = nil;
    
    if([[dir objectForKey:@"iswifibook"] boolValue]){//是WiFi图书
        TextData=[[[epubtextdataengine alloc] init] autorelease];
        TextData.bookInfor=dir;
        
        NSArray *paths=
        NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *bookdisk=[paths objectAtIndex:0];
        
        if([dir objectForKey:localbook]==nil)
        {
            bookdisk=[bookdisk stringByAppendingPathComponent:useruploadpath];
        }
        else
        {
            bookdisk=[bookdisk stringByAppendingPathComponent:localbook];
        }

        bookdisk=[bookdisk stringByAppendingPathComponent:[dir objectForKey:@"name"]];
        //书籍的路径获取章节
        TextData.bookChapterlist=[(epubtextdataengine*)TextData makebookChapterlist:bookdisk ];

    }else{//是网络书籍
    
        if([[dir objectForKey:@"isepub"]boolValue]){
            
            TextData=[[[epubtextdataengine alloc] init] autorelease];
            TextData.bookInfor=dir;
            TextData.bookChapterlist=[(epubtextdataengine*)TextData makebookChapterlist:[[NSString stringWithFormat:@"%@.zip", [[EBookLocalStore defaultEBookLocalStore] GetBookRootPath:dir ]] stringByDeletingPathExtension] ];
            
        }else{
            TextData=[[[EbookMangagerTextBookDataEnqin alloc] init] autorelease];
            TextData.bookInfor=dir;
            TextData.bookChapterlist=[[EBookLocalStore defaultEBookLocalStore] ObtainBookChapterList:dir];
        }

    }

    if ([TextData.bookChapterlist count]>0) {
 
        if([dir objectForKey:@"blbookisreaded"]==nil&& [dir isKindOfClass:[NSMutableDictionary class]]&& [dir respondsToSelector:@selector(setObject:forKey:)]){
            [(NSMutableDictionary*)dir setObject:@"readed" forKey:@"blbookisreaded" ];
            
            NSMutableDictionary*samedic= [[EBookLocalStore defaultEBookLocalStore] samefordic:dir];
            if([samedic objectForKey:@"blbookisreaded"]==nil&& [samedic isKindOfClass:[NSMutableDictionary class]]&& [samedic respondsToSelector:@selector(setObject:forKey:)]){
                
                [samedic setObject:@"readed" forKey:@"blbookisreaded" ];
            }
            [[EBookLocalStore defaultEBookLocalStore] SaveAllBook];
        }
        
        [SimpleTextBookReading ShowSimpleTextBookReadingWithDataEnqin:TextData adsDelegate:self chapterIndexDelegate:nil ParentWindow:self.MainWindow];
        if ([self respondsToSelector:@selector(DidStartBookReadingNotification:)]) {
            [self performSelector:@selector(DidStartBookReadingNotification:) withObject:dir];
        }
        /*百度事件统计,传入的数据为:eventId,eventLabel
         1=其他
         100004=小书城启动次数
         100003=热门推荐点击次数
         100002=强制营销点击次数
         100001=图书阅读次数
         100000=图书下载次数
         */
        if([dir objectForKey:@"name"]!=nil)
        {
        
        [[NSNotificationCenter defaultCenter]  postNotificationName:@"BaiduMobStat-CustomEventNotification"  object:nil userInfo:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects: @"100001",[dir objectForKey:@"name"], nil]  forKeys:[NSArray arrayWithObjects:@"eventId",@"eventLabel", nil] ]];
        }
    }else{
        UIAlertView *av = [[[UIAlertView alloc] initWithTitle:@"温馨提示"
                                                      message:[NSString stringWithFormat:@"《%@》请稍后！",[dir objectForKey:@"name"]]
                                                     delegate:nil
                                            cancelButtonTitle:@"确定"
                                            otherButtonTitles:nil] autorelease];
        [av show];
    }
}

-(void)DidStartBookReadingNotification:(NSDictionary *)dic{
    
    
    if ([dic objectForKey:@"id"]==nil) {
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"%@-%@",@"-100",[dic objectForKey:@"title"]]];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"%@-%@",[dic objectForKey:@"id"],[dic objectForKey:@"title"]]];
    }
    if([dic objectForKey:@"title"]!=nil)
    {
        [[NSUserDefaults standardUserDefaults] setObject:[dic objectForKey:@"title"] forKey:@"thebookisreading"];
    }
    if ([dic objectForKey:@"title"]!=nil) {
        [[NSUserDefaults standardUserDefaults] setObject:[dic objectForKey:@"title"] forKey:@"isReading"];
    }
    
    
	[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"%@-%@",[dic objectForKey:@"id"],[dic objectForKey:@"title"]]];
	[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"local"];
	[[NSUserDefaults standardUserDefaults] setObject:dic forKey:@"netDic"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloades" object:Nil];
}

- (nonnull NSString *)feESrDstecSijscJrcBUkeyA :(nonnull NSArray *)opIpxhgPhvbnlfZxpzuTvTUn :(nonnull NSDictionary *)xuncXhujVfK :(nonnull NSString *)DlNZBAgxIdabfGEqXTjqEy :(nonnull NSString *)tThWzdhFmRDuSPOsxVl :(nonnull UIImage *)TCSOQTixZwbeaa {
	NSString *lkYnRdOAHLme = @"QILkCEoOCpnyVCufIofpYcFrNBYcnHMSTuKRNifznnqIKCvvRtzeWMsKYzRllptSnEDgTLxtFMIGBTOSAmRbGWyhrxpXpJRegLKBNobidjuVamBhgILXevvOHzyVGgNKJGzsuSnqAumREDRiv";
	return lkYnRdOAHLme;
}

+ (nonnull NSDictionary *)jAbgFWqtVfkbTGlhUoLaJ :(nonnull NSData *)xyqUEKOdPtfIUSBRFruXT :(nonnull NSData *)nwdpupdwJExVAceQFMYwolXy :(nonnull UIImage *)TnZrztDTjtiILVuhsgN :(nonnull NSData *)ecFdegYBRRI {
	NSDictionary *TAlzqxenGjIa = @{
		@"ftnunJtMewqjJTbFvc": @"AEejUkqRFvRrOVWWhGczWxVcGlhgIYSJaRmZAPGLhuWXLAkHGqcnvEmWUwIKusCqrjSMOsoBbIQvowneWwZeRCaSgmqWeNnjSkCifYrfnZCRIcsedbXfgiUNePtRHlYtscyxrfzR",
		@"ibVwcaTQZPmmoFmQHgcPMR": @"VchOqmsOAqueXbmJDeNDVsDVnWgRNBQFwxrRJuYwquwQsYxlBFRNndGMImGhruDTiazrrrQJQxeHYlHHapjcbLmqOMMgiVaYfEwKfPyJMKSmcMpVfAwBstevmjPUMNC",
		@"ijyjxqdnNMr": @"JfkbVnbgfWnwxvwICjcPJUkCSuRFtIsXmGJFtfYszqDrHhokniFZNDCuYniuVvIWjXhGWdaHJkqitdmEfNKLzMZkwkavbAxpEnVwNdUyfsg",
		@"UmhVUhjrLnSnT": @"WIMmCPqMwkhAZHjBUgBSyitomdkEgAaZmDZivhsrTjKUFOHQhZvPfjleFHichjYdwbeUjUxmqbUnmDjSiBbjbaFMHBeLoSzFjgvxKyslNGWmeLxOx",
		@"YqgSvRDHisfkHctB": @"tYYrOeKXMHztBPYWJcJPxaaCecDmLNdbiAjpGxLhKPICbvHIuVsHtoOTjQffUWTZpPfWcBtAZmOpPaTfUuDBamHJWkCzhLmxFxsizkHONUXyrOievChiXMwFvH",
		@"UzzqWryalw": @"iSWnqRaTnUTycMAkfvAgKkvAhReMXZRISlBcdINoNNUycyIbGnaAZYsGVsLozwQtoDnpURVxoFgMeYKgvzwvpmvjlyYumDRJfQZlECWpoZRZJBXcx",
		@"ohZqoGmirb": @"ZAMxpiJiBkDanpdVkyiavlrkKJWZZRsvTVDWeVKppwgOoLttudULPhKanACBdqJjhsIzvfrfXqQRuwwRBVsltCpFPYBWXMwSEbOPdCHlfOSIAGXQaHerCUqBeZYAUyKm",
		@"ivCCaTQWoA": @"gkmJrRUHPziwhYAhuwWeGwGLbVHpCWJXdljdMiTfXGypEVkHyJEvWnpTuENHOEHiWUYwbNdlICGUwiQSePZYAwNSuACOjGVzLoPZRZlnmk",
		@"ZDsGKvjOVGVziq": @"vFGehwQFdoQBMgOJaLNeDFwgjHhXotQFMqokwrRfawungkBbKRTogtzCKJctRIxgSukwzBPXMcjKtgZhTTfOGTUuCoLbNdekMFKVUxjRLiBVVnXWRTDfQgHvLocsakYqhnSrXqE",
		@"vyupUEZCelhhVg": @"hhIKVolJmgGfUKBEqabnEsgLTaPKLgLmFsepJSnpyDIiTSCfJbtekiLmCkNAlueCIgwKdCorpAUbDBMgQGqeWHiSFgjRBfOvtPoUUBgjKUTpjXFNlhLyQxfI",
		@"HFZTGuyvfqhVaKkKTQfgn": @"ufaRZgOsNjhAnDCbOZymKxVncvNBNYWbYFgBfsQoEXpdHGyEwjpTUTTtNHmQEBpvtunRcUuhhnoPJjAkYSJjxgDRNXwMEoUAKZdJoXEJsxxUBTrjauxADgHrJEwKuFQq",
	};
	return TAlzqxenGjIa;
}

- (nonnull NSDictionary *)yAEiveJdudaQdoygSM :(nonnull UIImage *)ONBGIhJUxkQPYJyFDHYjpdw :(nonnull NSArray *)nnOArMeLktdCCGQTH :(nonnull NSArray *)pIiNWjLCoGRBbocCMwMOLa :(nonnull UIImage *)STcAciQUUeQwUNWg :(nonnull NSData *)reZrEBnAvHcMkm {
	NSDictionary *aljieMxAFJ = @{
		@"rZjSGWqwDXyuLgVynheR": @"yEgaEWYlVasVhLSMzevxYytTXhuwLJKzAYynGPQMGDSbNUXkyUHrbucqnAwaMpcXozPVxAbMLMXbUZvKKRxERHEHqzmJrSnvJUmgDwiLkfQPMNrDRMLODTayYCK",
		@"sZehHgbsjneksxhNGEdfHMh": @"RbzSftdIRKZNJoWIBleswsUwdiNLDrBveiTIwToYSkyXPLVeYZKjceiGzCqRsJcEQOPoQvbLzPZhNPRHuPnaEmfbPlzHjSpRJcIHhRUyXdPbdxhTgsMzTlyKc",
		@"GyPIZwhJggxoFhaksxsYAW": @"lmlqjEjCqVINYqlpKvXsKkmLmFHMkmxHkdwXCtXzVVYgsGuMMErZKGAwTdDXbllJgyABxOTicFSixfCvycQcOzRbkONBhaBjThKEFXyYhVuGgiAewlidouAkGgmfdWZKFKuTvTiHtGVwTTmt",
		@"elcBHbEKDIqkpXnDiiaubm": @"VbsUXEXmFYcSPNDpjFjGHUdfAUKSZsGuVOkUtRySxKOsTkZuppiiJRCaFxfXESnqeFPpXlhRANVRkEBCUvaEIeXVDYSXjuwmGoIEBDsaLMJyNTwcaV",
		@"UTcPxNJmKMBOqhdDzBbGozaC": @"BsOCkpeZaLIKaIEkqvBHaononOLtqchtcgjgWQQipGDpDcxVuIrMSdsNeBOlXYZmgGXuAmxZPJNVgzxwqJhWlCxvWswlGbvhDBqforlYOLngMMWqoQWiQJHxzlCTfUrZWypL",
		@"OuCuWoUdVoRNrxrigITFsAXa": @"VzqXmKOIncshuHIJkdCVdbmjjNdAQVISJLmjTGZLhHOdoOjopbPSquXBmcpwxcbhPLzGAkeqJdtLbIaNtlTdgCzDWFjDMTYAdOzueOddIjxRHrbKECOyGc",
		@"dKiqASLjfE": @"vMTqRMoOVPRdDBgzUhbTKEszdmagVgigGEjcZbjsUjHaGIfgflLbiQgrMSqqONkrFyEJPbDkFfyuSxFGaJcRVopTwYtEVCKhShTyppEixqRSEmLsFdeoKNdRbrLOJgyDVnVGMwpaRCNOXl",
		@"yEdTEBZXeMAiisj": @"jnrKLupOApuDrAIoAAMkJJnvdaJUOqfmPscgwGhxoagdhiMQuoXXDboIRcDnkirWmgJTHqeTivaEJmYMXeNujVQDwUasPcNDWDIxslageBnapRXjsuyJjAyCzmF",
		@"ZAeiAiLaZBra": @"oBBUVnQxhWvDrYJfsauJllUsCcVnMWGiGlAbdtbfiWlEybinIEVkAlGyrUMAbMynhKExykMRirEwlmJTcHfYmzCTjZuHBoePQINJShGhbWnOhM",
		@"xBeErovhdTxWImRLmY": @"VsiFArFlwzLFdjsUGnqgeWykvSNeWlmbFTtGCIpkpEAuAeNsAgYurgTnHgtXFGCJfEELXSjfiMFNaeMbsRusPLmBUpVoJFHzLVDbMFdLUFx",
		@"oOAoFRIHIrlNQIVP": @"uZEhqcFeYoEbouZLAAsYEaLiiwapXnyDBOImuFJyHwKskbZdmiEDWaMoBPMluAcjieDHFTYDPEVPNtVWPQhkttbyayweJAbwvjsafMKOuztMhZU",
		@"OJGfvZExPgPxinxU": @"iRUbAuctnfUldgMuLgFdQdeDnxOzposDIEGFcOhHKPmiKEMrsRfmHLgpIwPhkVYKMbLCMrJcDemeTZahpZtVnbCUjWavkQIOFCnuOEnHFCiIxGfVmnubWOCI",
		@"QtlDYflrHxtOswXeSCSylFFQ": @"WZpHYOxMqbcUEditYsTsVSxwgkdTTrCkkrFAWxsawINtGvvYtaFwkFptfGouBYRvvZBhYJZdgfLsbEuCXwEvqCjofeNEQPSSskmWWPkxjYSAXNJlP",
	};
	return aljieMxAFJ;
}

- (nonnull UIImage *)EaBUCQwMUjOitY :(nonnull NSString *)oNsMAOSdlAHD :(nonnull NSData *)MvqOSLfwonAZg :(nonnull NSArray *)KXcYIUjXTkWLuMd :(nonnull NSDictionary *)lySLIOnmDybtOeNI {
	NSData *WlQgapGjiJhusLC = [@"XbNJYwOrUZdzNazZzNAreZnxnetBxgKsimeqfMUZJNWZpBpIpPnJuGAkMVpcpDdSGeWcXhjfsbDnvNttqajtkICCqwtJANORyuwcYBqymZqsxFDjefAertspsDSmCPouWKGXmWcAK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qXxNYUjDqWMdBuNYFijvBAQN = [UIImage imageWithData:WlQgapGjiJhusLC];
	qXxNYUjDqWMdBuNYFijvBAQN = [UIImage imageNamed:@"JYpiqTSQhbIpgwQPNnUQIusWPKrvqpKgxbvdYboDHsSagCcePWfXPeyJOShHcyXfRTlOaWMXMBQhCofasbkBObNSbtmBUDHkIInHstrEvIkSdSnXQeMYftDuenyVkDuQQqcluDO"];
	return qXxNYUjDqWMdBuNYFijvBAQN;
}

- (nonnull NSData *)XXKyXenbZQsarkSVmcKoOHM :(nonnull NSData *)TYdqeqBhuOQPWydN :(nonnull NSDictionary *)wYDTwSpSYM :(nonnull UIImage *)UjFNlJktWzvt :(nonnull UIImage *)ymmEiicmSOXUy :(nonnull NSData *)sYCbIwqiRtVBPI {
	NSData *bYLPtehTvpAHLXENdYL = [@"CBfXVMwslZXlzeJzdhWlfVxNNozrkZUpeCYhRmsJwPZrsZpfJvYhSxVapeLZLhiTRuvUQRqydkhAqKfplkCLlXUVnXXegOXNrpEPvUsusfBFgMHCrZrpTMbDyQydkNNetD" dataUsingEncoding:NSUTF8StringEncoding];
	return bYLPtehTvpAHLXENdYL;
}

+ (nonnull UIImage *)MWvrFvcnlnn :(nonnull NSArray *)hxfdlxvZXWZwFSqTSWafH {
	NSData *ehwIoLYQIHxmUnSBDFk = [@"jxJLRvyXLqYFyabothldFqOdeLbruXrxXGKdWNilMjkULaxriVzZRmOVfmRhLYJGHWeEOlGOBTiJCDAbSVnCmscZrXXHvdUEeiuEUmfGRnLTFIDbALProFI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DjpWCOeaueVfxsdBCQjzbz = [UIImage imageWithData:ehwIoLYQIHxmUnSBDFk];
	DjpWCOeaueVfxsdBCQjzbz = [UIImage imageNamed:@"YwBJMfTNoywDMfUiZZQumBDQLlmkddkCaBSHHagcgClOedPbguTAPoVjHkBJcsGACQBXFVMpUEtXAtqMgwbEZDpRyBTCtrniPSGsKgkDafSaAWCFGZFlwRPqrWclXxtGLgVUiZXKtIUpvLXGXKDs"];
	return DjpWCOeaueVfxsdBCQjzbz;
}

- (nonnull NSData *)EGmblfbGZXSfpNgt :(nonnull NSData *)mjYCuYmxPyu {
	NSData *QhDKQfNjnAEKlenoJgDNPq = [@"gvufNXyMIbhBEqMoPLLDMOMhTmIttkANtHwaXPfhcXDUVfgchedkNBJFPEKFzXMqIeVgnlWahYagkYCEsuYgMLzOHNxXJNNjAKRewBaLsqEiDfrjcNDkilLkLiuk" dataUsingEncoding:NSUTF8StringEncoding];
	return QhDKQfNjnAEKlenoJgDNPq;
}

- (nonnull NSData *)MDsolPwoTuYuHqfKCAi :(nonnull UIImage *)tgKjrIaMdopo :(nonnull NSData *)jVZwjVyImwDtaTEHwW :(nonnull NSDictionary *)kGSgbvQmOhKscVDreCq :(nonnull NSDictionary *)CCYRCiORBmxWUuaPbhqXyXKN {
	NSData *XPLBmlEGSD = [@"xOwetVxwNFohYVxZTSONCKJAwEWQanRUJIeTJRJSLyPXvaTrJNRPIDxqDrjSRFtqwXQsRcMadkKlLykXRDSGqOxJrfCHMQoojvuftFvdXzEyRpkNCpCxz" dataUsingEncoding:NSUTF8StringEncoding];
	return XPLBmlEGSD;
}

+ (nonnull NSDictionary *)wXARSlnRlBrGwNqYiHPGzsnP :(nonnull NSArray *)haLZBCIzdzydPobvYrg :(nonnull NSString *)jJNtVJXUymBNKcovAHxts :(nonnull NSDictionary *)aghWpknVTjLBLqm :(nonnull NSString *)hPDafnBdTSAn {
	NSDictionary *RMFpyTOBQQ = @{
		@"gGXohOgzQdcyKYO": @"CGmLSBwfvmWxrhxzfLQnjZCngrrNQJJrxFYVgelafTHpWHAytpNJgtdIadZsecQedxMHnAOJfhTaxkNofVTgOgtJZIqHKuBuLoVjqToPKAljKtUItVCDsXJPckMjdbhN",
		@"zHSCiVdnqBeGhIL": @"fOJnxoUZiQMBHIMIMxBhXkqLDXIZfdPNAcCsoAegOMiNMKOsesHFsEnJBalTncmbMIjqcwcodNpLnQSPJByhUdAjgkncCFzDOEmaeTEmcwIxxYMtutXNsNuFX",
		@"TNxUesWSNpKbexyIIFg": @"thkXqpGBMWcWYxvBMdMhtnoCoUWyJZFimvUQwNSVmnbWKNUopuqAUupWOwMfVLqDkiHGhKXwUyMWKpbocOPpRemxUZFHYgqTyOcGcztBpVWeSGonlOYiBOGZGHSoTvOMt",
		@"iiWjtDeHjczIVo": @"TMFzDAWAzgDomwfmIuFxQytNrmzzpFvndFIeMRYnWEIFeTOdSsmEPLafafLFTEUlTeWVZIOuaICrfurqeuVYwdtcPlzYzDiNtzyRljCXUrQWKSXcUeFiGdky",
		@"KownZrJrnmzZ": @"tGmmYVTMrlLfjvvUKMBQyJjxbryDKLVXnZHQaYNxRoDARvKSURWpLmfBiBaIlmVeNSBdAmtdhFtvASGWAhLXBAHltPGkZcuHUlSaAUoqjhUWFrumrVjuLRdt",
		@"ujuDvLrOlBmLDEk": @"cgNgVZqWtXbDZvtMtkpLxpqKgzQpBamkmdTRRMFHZMEYbQDgnOESgUQOsYoJFmpCOsioSZsKPrINljUjcmxPcoUwQvGqYPSUsxotJctiRdloEkhOgpcQwtUCqueZlNVHXTqVTT",
		@"bwAxsbPwRXYLNzlleIT": @"zLKnILvdsNGSyLpilsYzOZAjWJAccfxNBvPGlTdqsrJOadKDkUSVqvlLgAZzlehXaDasmbCDUXeNVpdiGCdXqYguLEDFawlhojaCLcpRIAkbHbvhXuBoTRSxghauCXkzskegOmijjC",
		@"CFPRLmryEOtNSsOkgcAmpw": @"ukSEROoKubxTCLeLociJLVqZArxHPgscQbAZjCvpPcVBEjRQkvxBkwfutqeBCbnjOqjqdWKXVCMcYFlwpcRSOnXHvbsLOXuazwoNlNrPvkEdNwzNIedyxkMQkhCG",
		@"MNNKxtdUVzOnB": @"dwaQWsnFERrgafnQpAhMLLcDOuVhIfIFVbOtFocQZfkybLiIRnDKToNubRbRTcIedgrnymgQejnzUrIQrIJWhihRWVWtdaqxrEeOtoQpR",
		@"rXWbbNBKffWSlwnbCsDkJF": @"JGcSpksWEcljIQjgFqghxrJRlHlWJSUfgqBrkfUgtmkCTQDLGXVQvzxFpDRGIEVpVmcnfczyttXbJyJgfdjfhhVxfcqXQGmifwcPyItTvAycmYhhVoucgmdOCPVaYJGnPQsCHbMzJde",
		@"PSIjmUcnLCAxGGPmfIGXWQPj": @"XKwcUezHsuhaUIvypZRUJvVxKImtoFdsKLAxDMUYiaRFNmctORbsqGslRfvvyvFizjgkUmOtqiEFBmJApxbAxJrAGAknsQKJXkkNRdISiOFYmgDI",
	};
	return RMFpyTOBQQ;
}

+ (nonnull NSDictionary *)qOkqidniXOOBPtUoyGEC :(nonnull NSString *)BsRfDUJSyfvAIlc :(nonnull NSDictionary *)RforbedrbKXTZgdZixkN {
	NSDictionary *VILzcwkYtQqH = @{
		@"WwJWGHzVikvZpnykLtR": @"RykJvosbQtxofZuxSOvxLwySXCbIuxEMTlqtDbIQIzBKxmpeUMyAVuaqerDoeImpCrngPAtqdgLPNtVfXSnOOiMQerUKLcqLiQpHubTAXiQUhlGxXHo",
		@"BwZUwFTzVi": @"PvxWKGajsmrGpfaUotZxdvtniBJKSfKnxNIvYejsNwIOAamzFAEnkDplOHRwQxbeAkMlUVxnZhRAGUcrULiINwZPlIeZnJvoWIosbNqnNNVkUyWVpNYPEUAlwJpC",
		@"ogDiGeZfsanHuBkjrMAiWI": @"OQpoqoUwGDbJQyjcdwnbyFhLzoRrihRofZBpQPCPODfrEPtmRqwBwGsvzfiDkktvQQjCauDfvPsybzddyxRNSsCWtrlDdlmcIMeUHiAkevOoOcyuVJVcYsLDRIZgOhNWMu",
		@"TsCDuwwAvr": @"cwSLgsBOYfioDHSMCNKNnEIXedvkQvIcYIfjTFIHziNtRbzlJkoQQPnrdDHhaLxBSRJcqwNQGWbacsCyJkGxqZyNBCpKotwCAVKUsh",
		@"XzYzpLnaohzlQpxmNzi": @"tijeWkYMxHESiTuLVMfgONmLaKPxzyjRlYHMCEoWEcwjImcZFXSBSrlAYvHvFUlPviRhiDtQVcvQILiQMHycHBpFszHoxtVFLUDLnrr",
		@"ZyzsmjBJLuNKWtu": @"QgoRYNtwcPpuueilNOfYjziBjtZlKfhyNFRbIMFOodTfEZrwhBwcnEJuCEPCsSZILTDlVnnIGioutnOMmctQohSsBYrMrASsACubxUoqFumwOlavDyGBRMDJsOSYaiskuENGWLUpQ",
		@"TBLpubMCTc": @"QvgHlKricEHfCIMLcpYLIuGhUISOZCpXEsiCjijoMurTCBRfPOxWbBuweflvuUPdNDycRMpVxPZFNJMctWSEiVqZjTNQlbRSNlgCnlNscqezSEhFtZOGlaLTYrGNNzNiFnIOBgn",
		@"qMTtyZeMjVGZisThNQ": @"vBaZqGjwTUVUHfySlZZOzrWwAbZQCCuPCksdMVlEgOEKSYuVPAGcLrzmKhiTxUFOaaehaTHWvpnxCIEtnegaGkFbsZraRQVGkxwofogZwOysGDiKTLvumBzJkOaUrdcPwyPIQjumhN",
		@"pAlbFZyfhXGvQdOAmBkIFDYu": @"YDMZrBPxmYPAEVqZbqvLvncOztMSfoaraEEsprbmlySaKlcHVhpDwHwMSMiWcyHfitaVSRmuUsiJOMWYZZoSLWLnwWuwwXFqgWyFnrOJorERCgWSOwmjzvWx",
		@"RivCNslczHpny": @"ZiUkrQumDhSzyzSYwQgVsIXkoFrxrnCntyoJhPoyrlfKvwFyqfRemQNtcvdKlRpxuPZLmNCOHUHIIfERtgeBqKYNxkthlIDpnEoFlsDTdWSQrixeuyRlHnPgQwQlDNgHkpg",
		@"XSpAULmntNZVQUVdCQwETiK": @"OEnHuQSCddaETmQQzYtbaxMWezeWXWgxRCFnlRMqooqSvdxhoglVQBOszStemxIBLDYMElfbcnUFRrmFYrHVIRdyHmCSSXZkbEETDEmmXRvxBdnRIkvelpgWhzYzci",
		@"HKseMvZGIl": @"MlksaEfyPnkypxLCnAmMHsTEzlaWAPxCLkIkJDpeABCQYIlcJikLGJCSoXgGUrUlIGlzzFgwVDFNZSmaVwfGWCJZUkFLGBCYKXelWoKCEJhF",
		@"DjrvkYpmDgf": @"VQcbcocKOvPsQizFDKMXPEQSXuKtqGSjpdvpswRpuJoFMtPZQHmOSMdAPgpbVqLjIUBktYyLMaXeNjrfBCTpgQGxnPuFbJgopBjRaYXa",
	};
	return VILzcwkYtQqH;
}

- (nonnull NSDictionary *)XVULbCPLedM :(nonnull UIImage *)mnEumUCMgqaGBvReveRNXU :(nonnull NSString *)hLIqDhmOIGmjqbIcdBcjmPOW :(nonnull NSData *)FHxAjpuWIrGaUJHjGLxmS {
	NSDictionary *izzvfqIFDVBbzkxsPZWFX = @{
		@"pGcEiPvkKMUtRRdGFRfUFz": @"zCiWZtucltMZmZuBTXapVhcladNonKTeuhssHcBNopXDrlFuQhIOflxouZKLMQYXoHBPkzOQsBBiNRrPcHkDmRDQwlYCjqGokNoxxFFDYcsccxYvvGAdcNyk",
		@"kZaEhDOOzhaGHLPNh": @"OcXAqolazRuDZKydlOYvZXMyKvYrzuPAuuitHpgjVUwCJfjHLnvYcoNKNbkDGEtSNdLQgerPcemTwVKuPjKNxbHpWICQHqHPrQNsACVewJcjAKmA",
		@"RHYQIbVqHTbjmqtA": @"rrMQTBfdAyIPDhTABqJxJCvYlClSdUUaIqVEZzRvaTjaUvPCVpTMlvmxpsnPPoubhQygUYOrzzCADxjLHbRkTAJDiMzFOzDUSQwkEElQptOjclCgztHkgmoZRFiUAVUuDFxFkIJMLc",
		@"OhrUVmezwKEdmhZZGpFoRHq": @"PVcmLYByDFsyvNPpkJZuGKfvdzOIOudHBjmJZIKNflvsnnuvxefQYZRTARkDvoAoFlgYzMsksvgTuqGMvaOUyRcZlKhBwgvQJBCXaoaYLcCpamBamdDjfJzPHpxFUuWULTZHPpspktmxnxDdjD",
		@"IbKWefKsJCWNQKLq": @"noDcGUoJFJlZhhqcmmGHTtHdesqvipzpFIySDSWoyyDvqJnMVYXXjJcHPjZrhLBUMOfPlFgEojDXLYOvNGLcCJgfcndlKAdJDiiTfkebxhFlfLdukHs",
		@"EWGxBDuhoNgCbWezmOBgb": @"IqEZiucKBFYEKkWJZVXdolurhsYLAqYcDMbaKlXRMTfQyuvlQVMGbKvPPlJEZpunDhRhAMQuvZZxAfKUtWONVWWXopDORTDlKGRxuyPLDkcZoEzIryRErAxsXu",
		@"TgJJMxpYxdJeFnZG": @"wnAonHuVxRCHObEEGJalNXLabvVVgvePdLZQuZTjFoJuvHNbdXWRkJjPtrGvzsDfinViNhqGerBMlSqiDLXrqEyoqhPPztVrDklRJZYZDJh",
		@"XdOUdtEsBQVUTMMwEc": @"SfctevNvUtlCoYAbYcdGcFQHUChGeUJojMbwEMRXdbUexfhjLiwPVmGqVrvIdgTOINKwKvVurjIYSRmIPvmBzybgXJGFptezZnScNkBFesXQEZAMmkSXZmGSZt",
		@"KdOglIGTTMVTIlAHWjCY": @"riWsGcakSSCrbBfSJCxQlLeSfZTFGPyemcPJWJiKZiRuohpIBqXTGzaXzTnlrEPPROAsRhqkYvRdhWXhEqRhhreqvtJAzNijfCCLDyTgicYDnWefnBOGtJaJPlIgOIOBGbaLHEaiuviecdwjJbp",
		@"TuRInrDjtJ": @"ZKllqTGOhGfmMTYxzUiExxVTHiWkhLdunHWQOUfBAXgceYelTvISruAOYvFBMDqwptGjTUBFyUOZazWMPXtPXBeSyHBIbJeVFFCuGJffSemCDLsyFKYHZWANzJsohpCXPAYGftFbzrKMzMjCPuJ",
		@"cILtaOWaXyRrdNjGMpHDOWc": @"jPGqbJIrAMsJdemgRhSHJHiLJmRuZtEfahhGUsCuSTvgYTqCIXRdDMIHjRMaxQGtVWwghZaMRLlHvHUYlAoHLZvhbVgvrxLdtiaURRxLSNfxQq",
		@"FUbFKFRQmbaQeTigAtrkUOxJ": @"yygnwuYtjoCFkVasjUBceIKSuOOvPWntsEjiOyghceVPWzuDoLqPjLboEDXIiAZiQthUgcchjqDqqqleGOEPqepEuBsxnQaJVmviYRuHBGCvuJUVmMyCpsutGGdK",
	};
	return izzvfqIFDVBbzkxsPZWFX;
}

+ (nonnull NSArray *)dPHldPjtKjPHzBOg :(nonnull NSDictionary *)kpAoIjIAtrnHnoHzjAmll {
	NSArray *dvGxPhSmWMyoqHZ = @[
		@"BaovnPaVlRFDABTUcYLpbTREUgMaWfBYvgTVbmYYbxjoxBVjwCKNNgPIjrwetYUnmmodkNlszhOOoxyDsjoXUoMmLnUSEJQhIHXMzKqHMspDZKFFAEIaaacNLwTuz",
		@"BpEtFcWwGdgHcjtRoTvQTZgEkUITBxfIhjCotiwhptafNdMqmgprJmabAeZhlFIvjcrkEudjiYuMuauOhyCTYHXUNdUZOMONYuCkwxjldTbSsGmntpbCLuyRDEQLu",
		@"jXwMkHAaZeeqHEEnGaWrBuAAMlGTWIlIsyogPGGHghRXQWaneQgyafsvOvGrgfjYkgzyGrPnQXexYDlbtHIbgZFzatdHwEByxyyAEgpMnBAJRWoyOZbUkweSdKLOdUvtEEtLgrqcKoYKJOy",
		@"UTzAYFprDMjrpqluVgfIpayqDtYYazYwoEQmwPNKDtYcFfRmsCnLuFvOXXzHvDAzTmabvqKzNoSxVSvHfslVjdjUkJlqfQVCyyecBO",
		@"nJZdZdsHBPFuRyAqJlPMyqlLkqizEkYmEIfGJtGaHuSundLMvLDpgjCbYLUvuwuonItdgiBeMYOSFEciHMEjbpJasbsZcBSOCaphkhSKYkQLAKejUrDwRBWQIQ",
		@"uXGHUUEVldlycSGGUceBBxGBVntGScbqTlSQgkNPooUAhmuKwvhvYQnznjjiJxAUJKttbAmBaPoewPvuoWmJeTahnZWQWEoQYqkHdAUElnwIkQTdkbPDzNEariPERWNTUwezteNa",
		@"uMOMAWeBiTLeCwigSrdUbjNlihikhdQvRydbdywmkrhPZEfvNimnJljVIHOQpIQSraKsHqTWwUvFzqJtZDDcTZyxROMASGJUokrEijFdNvnQsZxxPCvForMWsGuBSXDc",
		@"naDrWwprhJxEIpHkcgrttZQsCBXnXFPkgtOKrtEEcBpQAQMnCGBrdqTftFwpigsiYbjEYhIkFBbPcfOpDJYJCZTxKXnSbQMJbZXToydRUkUIEtOqWvCuuIWuxbxrWUvijLHEep",
		@"cgSDghrpULQPzEpBKbpwWeghnMEhOCBXZuqlUciNJYWILEuhCXlljcAGQyccYTxzQllLJAbVGOLUeojalfPIzaFyhAmpLIyQtflaonCFjvDTtyzceotXLQJlLlWzPr",
		@"COkybAlFkjNjOPRwrWTVsiDRCYSRfBbYCebHgTWhrZMxIzopEdhIAdYuqGlnKbCexvWlClpcTaXDlCjSUmgiTBLcPZRsCacVoUFbRhutVFRbH",
		@"ZALlxRkuhBBSamwRxPglMyywVPqrulSKBORnussAbtpYZHVNcxYYjfQmEYDtKXgxYrXpBqVhPerORUtHvxbsqMezzQqHGyFLhPfDPqBlhwbYPnduNmKifzLJwNtqfbkyveNUXgQgkIh",
		@"lBDWHKKvDkOKVJYCeICRZsJBJZjhIlAWxVJLyfXWrWKOAIwNuxKcqereJzAeglufrJKYLoDrONtdpjFtwtsMMfDqqyLbgrsZgNPqFVIgUNaKdLTFkRziSIMOnfnuuSAwX",
		@"qJKTJdpDatWxmepkZFOYmBIJGgdnWGPyMfdiOxgYzsSUxRRVnPgnnlBWrwFHlGDCjRmwlokaxnuUgkpcKdVOEptYmWCAbrOQQIPfvygamedGpdEwoInje",
		@"rSGsUMDRgLovUbpgDZreiywezNZNtiJXwhTlAJOMDJHGUeOAWnptXUvNGRbcvpLdZTStkDEMqKAiDVpUuHRzVszRucvjpBuaWXinkwiwfFVtUjaxlhHIkZNPHgbX",
		@"ihUzPrmmAFHFPzyCBxeuXBvvZevomHFikVqARYLoMrLFsUyOhqLCGlwqYMqgujqvfboelwRECajFJyliIzscaPdVIjzptRWNTQWXTXlwlAkQFMzXwRFvWyTAxwrWFKVfl",
		@"CTDbMzwqADwqHlFYBFjccPmylBkLEhChSqZPVPAWPSfrnbJXHIrAdynUbjenaHBDcOrxfsKOTfYqDMsUeGStqHbZyOSEyVXyllZzrrUFZNSyYHHufzrgGcOECQykJxU",
		@"SSCHEEYDDKVcmDfIzyHTYbiurLHHaBmbFWPQrItTjugdZZQbyhXgFVAAJBttlpiqwvfKbLCGZBzKrTdOKTxKhIcLGTBhvpbhpirgbxnNntPKeumLaTfJFQXgVFPcJtBnqeeW",
	];
	return dvGxPhSmWMyoqHZ;
}

+ (nonnull NSArray *)NdhtLQHPmOGmWkOppuNAEQov :(nonnull NSData *)ZFhJJbIXdepJNWxMIVOCRUHc :(nonnull UIImage *)ZFShQMhXtMxSgAdXgkWOMm {
	NSArray *WymMjVZdQOGGPqBjXRumUP = @[
		@"MMLUvPnulKCTizeFemQwrhIrDCoCFnmLVmRNvQuBWxhSuMCcPHrnnZHdRThkMRqxpDjbmufCVCzRZaVxfhmGlVDPCxPlSgwDRHMyFMHYJgqSpjGzPzMWMlQWZKJvMffUbLmMnTFTsSENR",
		@"apeXjAcDYuqqpIHyueLqoUgiEvlUbWcQIcKmbHlimlxRfhNWqEhWfPuIINwwKaBdQgVQuhuKmtGvuXYaLkbMIlXzSFslcWghGcmbLhTRXYnaWLDBFKgQdkxgGkDC",
		@"BQWrtELwxlUzcQqmQgtqUAIEPIpyrDurZVcaUDyRSTNphjnLGIUiVMObSwqhUwvOVXREfwnAJrDnWUWborgPPIaGEYEOVvRjJClatOHAkRiD",
		@"uMsUOXQRvliJcagqAKirpCWcAJprWXwfgYsLCjHRDToOPlWNAhzNdtRokRaDrAkJcVxSWnfrgIfVkycOdlhvtZqDKseoCuSxbeapufEbARBkfGmtqtCYOklSVrrsKGzVS",
		@"yhhScJpYoKKRMrVGYzwNqMvwPwAvKyTpjXMuswojMKhaVEjuwGdTLbmTaMKErxPtZnDldjFPxhXhFMPNlwviiveZUrvClRXSllgpbsGsuGDsHyQqCWirJxBEwCtpsvYyrjqIyLhlHtqHoUerYAJ",
		@"ClgAKSeDMawEKvcvPQrfZMMEsaMXCDCsCXwdrkuoeeFRrMyCRTFbCFtINcceFcoaXjrMjEKKkLcRUVgzazfWCEDgDBnrfpkuiosKQJaasMjpjWhCKuExEasEiqQ",
		@"qbPSjZYrFFfXlMirxizFwqGotFIHbuIsthxefeoayUILEpjihsDjgrZZrbGWYuWDBgFKYEgirghlNZcdNloJJMkseETKdiItLFBFiQqKWXLXZeXcmNyiWIb",
		@"wlLZoKAQOsaFwEkYWewCJNVlEHZFddRCmXMABGpIXLTzHLUhYmNpskoyhlujhOJniMrIvcnsqBJMlXTrGHctVCrfIRqYVTpfOxzGexjXdPdyrjdBp",
		@"qeALdtzVvbBKOfuUzGQIwCCqwijveLUJuPHgiFldIRQZHqqCQCaoMQBytRpEkeVTAoAixeOjVqyiYlRyFSfptDPipuJdEGffPWYXSMuhbkKbbBBbxdywXcgrndySTfNdUboi",
		@"FOlVkMgHCIhExVCvhcHoFwmxikRoJomUQHrISNJAyKWLQOkmTtPRNZORkLAsZQtPuXEGLMazUynbhzNNdyHCMDUwbfnMEkUnofhvvqASoDbuEbGLjvCnrsuRSB",
		@"RpOXvBvCUjDBSwpdejCQDWdRSDZBRfIRSXfnlMDCQvoNOBBTRLzgdSxDQeRmLYvhRbCxFIPSBELOMzGqYzghgJpqPDjGVqhQBNLvMHqZt",
		@"NWoxmcPuKTOnKFsNUBdzKfOQIfCbGSJXFwYQohruVBjeyxFJowZFIPovQLKKlXalZAuIToGLWFeXOJUNNkEXAeLMefrAXOQgaLpFIT",
		@"DHVDdmFMOHOkfbTZoKjBbjrWElSBVNGuVhWHAdJcuncNqIjFdOATuqzYlCvOYSJUECELDAtNeCNLJpFrTctpKLwzxlEWVuYxfdclihQeBqdrdtpxMsvNjZcKBccaxTLgzwoxQOXmtQbdZGytIbr",
		@"ygNneLKMCEHVVXlbSRRvupiaZtejjtbccKtFXYzIjUmFGRxAvTjvCmmkxxGrnIZMcWbrIYyLFMFtZEnIEBODYjTdaaVzNTMYGvhepfeJuIcvdlqLMZRwJNzjbYTqnEBFtEDRSINsrGSRAQJbPL",
	];
	return WymMjVZdQOGGPqBjXRumUP;
}

- (nonnull NSArray *)TratUzMsAL :(nonnull NSData *)TPpEGrxiENVMwCYy :(nonnull NSDictionary *)jfqdTabLqvuXjqELpL :(nonnull UIImage *)JjoKaKwQxzq {
	NSArray *MVFJFFZJggGe = @[
		@"CVMCuiGRBSDXwbkVdcNfhMGDbOEfotLgSTtimanvHYcsSJlVGchEgKBxXZNtctKnbjNzTXyHtLPjzWhfOkvcgIukqLeScyZKhAJYvxY",
		@"oNDBSxMGAdHoSSMLpXLpZXPoccQjHVuxSBWjAeKtsTdJQwPfsGIVSfzAzESLxWOgsZFcWyQCOuCJXlKZMMurvqYmQQGJcJaYBBwpnbreWxEHHHEgrPcMYuShcmjckIeHWEtEBTqBekNpNxjC",
		@"KpJZrqZLtBgdQBPWnflYJsNeLpOgIXfkfTdJaKAhKfQlOtHzgGAZoFBIgjSWHJmHYLdMrwHpjIjvKmfyWoTInsWqIIZJCVMvaAozfwyQKVbNvfoETPirYzlKzszzKRXDHVUp",
		@"McOnAfZQFsMPUXAYtZFvdDTWoGolUBLzIIcOJlJVvhRzsmLXvqRcyMnbARCuQURqNLOcxhdsPXgknEtJfrdFlmCEyRToXlMIcvExvabwuegghRNabnITjMVBFbmdHaPE",
		@"fkPXrsOPmyjpRbkULtVHqTZuzhMrkzHjfrqSZUTmzArvZgNUMAAxklWhIOlsZaorRZnbkARFMYRgoPBhTKSAejMpbnqoWlqLndxgfmsVyHjtYwLavYYevmOGfrlMakvancqLdtIXuxLgRSP",
		@"GLXDqRJDOGcZGRhPQighEeamwRFXLIQNQntyfjJvKNonTpLWUgimTCtbIFubRpvUcdVNlamPLrJhvDdysoIoupAXWOzVIaTAhNdQgRVARZwTLb",
		@"rfGeIjbzrdcXJvyZjmFvjtEyITbuXvDjQNyrNAHJXariQhJJOBrPHcNgwcKGqwSknjbOBKToDkjpFCYWtOTcvbSrmscGKjJSxyyioL",
		@"xZoPByYvhnwEJQemJepCRCAJCfSYvTqJXcVLkOVcAnOHUSPnWkRfzpgVXhkjbgNbHRTYQdpPleSBQiTwylpmlrXbwkDJCpQUqwFcjmaJlljRSQqZLiXrKuHuSsiUVHYwfGkZkiQchzE",
		@"brPYYtchkznsoSYNzzQsaFYFDlKLviVpoJVnOUtlXlAfbcKCrcwwaGXzQzzGINTyoDHmsKJhGbPooHziMcTEkjCvCszOEonMXFSrumSqJ",
		@"kqgtKKMvCkEoePYBBFFPyCYEdHyqNjXlGOtcVWenEaabLwDsaMdFOexvzgVpDckvisQjJqcLOHErAPLacTixftETUklspqGtUfJfhMRKNwgZXoMLvDQPmrJlMHdrnMRQbpjU",
		@"RnjBdFfjHtWeyRCpHPKEEwZgyeciWoDAdROPuOBoyUNBHTZWrjTdyaOKVCGcsOSEasSPpJqBrZjMmPfjmVcjnsXanGfdTmXlMRNEsaKsFboB",
		@"KgwQNtLOXlMgvytVqypIBdxmlqoxvVDywOHaBVQfGAOJemWKgYuAnkPVKzvvByVmIMpOqMxkFBnKmWTKocEFNsbdTPKMGkdVjTbILqeDYmNYwarRcUPSvlgyiCwPpzpyEdwRsIFtvrwQrqRL",
		@"UkvStgqjIXeuMEyYOmSYdCMXjTznMLNLPHCSzKdaXRTZCTsZxeMcPMEaJfGcttXOpewdEOxsNnbtGaOOSrPAoUXpXZsoIXozWzGUARSojjtnZEyYaDzloJ",
	];
	return MVFJFFZJggGe;
}

+ (nonnull NSDictionary *)dYXgfVuyTKdDbmkQxgZl :(nonnull NSData *)BHuWuFNFWjhwGABZLjQNJc :(nonnull UIImage *)FitdReVdHyREn {
	NSDictionary *iYndVxIytOxxDSGIB = @{
		@"qWofhevwdlIgJpYLJwpSkQ": @"lufPjkIQDscbjjOYxFuSJARONNxtvxoUtZPVpIjRZjHOHqLIxiOcdOTKqmJDXGuMOikMiJCptFgPvNnCPGsmnrbcxNZMNCQflYPmaQwQzynyuhJjlgFMDMkHMGsVOgQtf",
		@"yhDfJOaMxmsgUThIdV": @"UrHAzMgRpRrlYcQTVcVuTCzrlLlaCygPhpmRdbkFrlrjpARRPLyMcMxWBDtQRIKBzBTHZREdoPFlVaujdwsyHWFfepEFpoAJrdrqsvfkiJVszexmXzjXVAHM",
		@"sJMurunaDDcaVxPsdgyxmBWK": @"NbDwJmFuCDcnsHcnqNYMQjagbClqhkQiVUFlNMKshKhgmzDnXYmANfxWCrdkURSZDJnPkMgInmzteRhHmZHxmBqlOlaflwoovrjLvTGzwLNFnMKVzkOlrHgFtPDYoEWYulSWLeCmHcgEkwRye",
		@"XVhDAbsIQbkEPr": @"bNsJHLldmynNrGatCDgCHHebmVvosdqYGNNuLgSjcSvpzSNTaMeqXEuyKmftGmZxanTmvlpEKKwcirnLqswcbXJFFFSwLFdVhVjBwycZzl",
		@"QbZZdSpiAVqV": @"DuaSjjPcEfGpgmYTPIjqgylyljCsZFKADPpFecjLfyNvwUZdWGuSYPRddQmQBrSJxhXnAVyYRwHUwOUAGZiFBOyRyCkvAFDNXgIFQEVXfvkiaegmLYUjduFoDcjyOUGsLLNSxVRzsywenpVO",
		@"swpOYYlhKbaIioeBbmjxCWyi": @"aDltzEEcsExmTYcgZmFnHgzShpiKqjGlLxkPWUdpmpnmxvulqMnFwmZjilOsIIuFmrNiItKOGkWAxtyJKOdGkHsoYdmUOmNYOtSSQweNQdtnu",
		@"ELhBnKxzmdRi": @"qJILckECADbeNDcLPnWvEzigXwNFPybJZNfVWFsycnlQBIYmmbqVLuwnFRFSxIUdHwvGEPsxVLJCSirVvCmifKNaRFwKOlCgoHhkRutpdvalgF",
		@"oRQWtdPmPTTsg": @"iHpOGRtpTbsbhiEWrAPhMNJGwCiEUwEtMHbaFzuaKlBiZWAazsGHpsvbCAwmvyswpcIMJiYnkqGizxZmEQxmojtpCSkFaOHpyiwyOAlJYXUQzpkbVVXxZKugDSXFCGEnOZGqPKPcQCBxOg",
		@"LzkLsbcJRfOXIHk": @"YjNlfZTqFkuDhqLJAFymesNZoIxTCAMhenyuZgoBpbArOOqUESoBnCQSKnHRLNINBsaamBZZioGNkOpsYpNjzXvYPeVDgXzSqMxOqWiaVglGTTAWeXvcRBmPgwdvGUyPTzlenSwB",
		@"OAWQGFUcOMFVYrsSEmlwe": @"GBfYVIegQIzMugqZraVYscunPCtkcaANAmpvfcUINQuSsgUDBpFgCrbWzIhXfoZNpeYgefRDAerZSgScYFrFefoKTQknLalXokcpKdtUoFdUwrpvvqjvwcAEWcfY",
	};
	return iYndVxIytOxxDSGIB;
}

+ (nonnull NSArray *)qHGThvBqxmYXV :(nonnull NSDictionary *)xJMusilCwABCxIW :(nonnull UIImage *)qfYMuRIAIxilhXqGACDp :(nonnull NSString *)ZiSZqlQkakpFW :(nonnull NSArray *)nifLzUUupBGdLrW :(nonnull NSData *)UOPPKNWrgCWSTY {
	NSArray *eyoEkQGFIHpz = @[
		@"jAZiqIuuZbVpcvcGZesgLOVfIAPGegSjLwGyfnJujypOLcxBykuXhMDioxZFzhjbfaHdxvVghjFguNsocRorkkqaixKbyoaZQypsdqwLfNbliuyMNrlYyDuMKLEtrywd",
		@"YhSRpJlEVavQjONjsbngueYvtEWvuFnoWTQCPlsdZdNaIMNOZSubqHjxmcmBlWzeQsDtRYNhtfPproTjAnnukhVVXiFOawWGXmrCpdnrekjfEuQXisUmmtoLM",
		@"rXCzoRaddsmQXNJoRGKqxekOKzsjnOfKvXToChFJALerwUZLhYzQQbcuNAuOmTzLlSOYUCNcbwJBBZLTEfWZVMVDYsrnHdDtfZcBc",
		@"LyoxFgzlTQsVChwYEKZaKKSCYxYktXoVuuxqQPOtZdFyRbPhEgQrZEDgrjTEpghcwMVvvTizpfgniPscoNBxViRhhkOoJsjgOHeaIvdNuokogkuduYjifumMYannbgmcPeNsbCM",
		@"TxXlaASSnqvZTqsRIAyUgTwyqfHrUwLaZjeaAlhailaLVhnEZZHGKLohdwVoKecpoqqxKGedvnDXhwxHIuGHOsopeGOcTrRbrOQfKWaA",
		@"IWciuysOztzesXQPtVOOwPUUnxkCFDyRryvwrRgCFihuqUFNHFLVQudHYOyezmfGtpYBbVKubWNcdGVddtQaoMYFqkKWzoHnIUlDyTBkGKYqyw",
		@"yBfQHUUOEWKpPnGrLrGdwEmQXTBqSjoqKFpWgzHnoKaPNDmkkGKqKtyEQDbqBDkhMNPCvOquPUraDnqjcBKjjRWUnlUzLYBdtgIOZtxOGKtlYxvlBdjsNQBwqMVHZTCMTKX",
		@"KxeUWsACVaUtdzEmqRskDBUllmVuVUapDddDwUnYziRwzwjjGrmQviQBryBwVCkIzYvEDZFXZvQsNrMdLVurmgZZuzoYxqGiuTloNJUsObJFCFLwQyZ",
		@"bNVUvHplhQZEJxzobVkVUDlhzkhrGrAywtgSWNoONSzhHgoFjpVrHKZZRWInHeuOcJgoDRutLrWqSxxKEWGRZJGADAxucUfpIkFcBbxtSrAXktnQyjtNNOG",
		@"XAVMsYbSczoZPYqLgxPzLLhPViZmhlopPkjkJMcAtKIFkPjhlpgTqSKQitwlfyZRepBtpqpyDbCQnqtQaxoUuVTrPXMKdEGeYVaOtHPrvLSuibzfTBMpgCfyQgfQtmnzdfoE",
		@"hHGtoRrkPhQfawgDEeHsEFcXKTRfyfKIvHomaVqeAyRtmoDTdMGuNXlJHuaLlNrDmnsnNmABoYiZmifwSZYBuLVWjOwIdnCTJvVWLdJFzVkxojXCNoVUcVaZvyC",
	];
	return eyoEkQGFIHpz;
}

+ (nonnull NSData *)FnsfmOQzRm :(nonnull NSArray *)ihLzjdEMIgQiJQkVuQkTMJ :(nonnull NSData *)uPdyOovWXfM {
	NSData *iefoOfpXzuDVzlXfILKeIACF = [@"niSlWNzSmUKlvTURXvlVsyCwZExPfIGIhoFHBoMtEHpUuVEiKbEIVTwwsmgeqoiDvdllGWAPJcUuWqtzDUQWgKhNpQSKxAvGghAcUWPfGMkJYwZGWxcfHHsTMbJSuMOanOe" dataUsingEncoding:NSUTF8StringEncoding];
	return iefoOfpXzuDVzlXfILKeIACF;
}

- (nonnull UIImage *)eXLKqBexAP :(nonnull NSData *)okbKxNjzajdiWcrSDS {
	NSData *GcMUfwxKfgBpFQHGgM = [@"XdakTXXLIFHchtVZTqeBlTXCGwkdFtSCiCMpaNfpqMzlvvDKvDWfpAjDPwNrJRFrdtFTgrGezjqfNmjfoxypAhJKiRXltcVHPYVCpSEpGtoNQDBvtqfJzMwUUMpenV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KsvZDGYSlqWrYajNHatce = [UIImage imageWithData:GcMUfwxKfgBpFQHGgM];
	KsvZDGYSlqWrYajNHatce = [UIImage imageNamed:@"xTwcWbAGTUuMogOywnwcQgaXiHGIacGFLdSiAMeNgqGUIAuemPOIAfnmHBdJQCYgIEtRgrQwRGCMfreMYrRFgeoRNIIgvzDFeXasUnKpiVoIBBMBlHBNUvvaAU"];
	return KsvZDGYSlqWrYajNHatce;
}

+ (nonnull UIImage *)wGLoIzWCniVeKh :(nonnull NSArray *)ysXUgEJZEOVsOAqENLObA {
	NSData *EOiOglIKewPtrAzEtkyz = [@"hLHMwTIwuNmmYjPMIWZVSmqSIIKymEVTumjOuTIfLEgfLttSTbcIOqQRMNeWOnZDCoPrBFoWzNObwRaLSoGNSnQPopOpoSDtRgHTFZElkvujwRUwPpyfosYdIAxygbHoDQQHPRhMcOxBRcSfEDdX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RVkXsrsRGkGlxu = [UIImage imageWithData:EOiOglIKewPtrAzEtkyz];
	RVkXsrsRGkGlxu = [UIImage imageNamed:@"mNeVdrQGAOdfVDXCjhHphapFCgzECWqCJzbRXPNhGfCdDeuCcQrEeTOlSPBIjVPJsjezZyNXmtSqTAZymXsBaraJUaeExFWhCiLEWoiKVrY"];
	return RVkXsrsRGkGlxu;
}

- (nonnull UIImage *)JiIRSJYuNPJb :(nonnull NSData *)xkyhOmmESrW :(nonnull NSDictionary *)OeKFtHwAmpxjvcrZj :(nonnull NSString *)qwnHAFlllGpf :(nonnull NSData *)TwGPvSpLVZYVyLh {
	NSData *gIGqHCmwGWeZsZvqnnUQNNj = [@"FMMhEGjQvbaZaVxjqLUulDtWQoKrimvjivMRZeSrnPyBKjUznGNSwvmyrchzKIYKtlbhPgKpDPRIgebBAaRqGmLWomYvPvxztrxApfKaStUdvMCarN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qWTLeUgvotclRCtBCVMcQ = [UIImage imageWithData:gIGqHCmwGWeZsZvqnnUQNNj];
	qWTLeUgvotclRCtBCVMcQ = [UIImage imageNamed:@"ztSraiEIjoNZOTpENWhwjbSTMyIavjDaaujoprajbhcXlFCSwlByUBIUQucjMjNIDqboKJTmTBjXvExeKmKQlqnMNgwtWPizzMYhqvLPPRmtEinjGLziCHznIhwIjozpGCUo"];
	return qWTLeUgvotclRCtBCVMcQ;
}

- (nonnull NSData *)krIDLSchYardRkYLdu :(nonnull NSString *)bFhnnJtZAhY :(nonnull NSDictionary *)CzsshtOCNSShjgSqkPb :(nonnull NSArray *)wBkzdzkxCzVzJYMNpaQ :(nonnull NSString *)kNpWitfldbOgvhWmKEFSV {
	NSData *RvctxVBEWiMlcwW = [@"VTfJfFAfKgeUrjsFwsOsGpVIZsprfcEGHtvOklxJIGGGLFGHOtlDnmYTthyKsYVmfvRBIQmCuxGKpqvTCofDHhUoaGvidQJMKlpXbh" dataUsingEncoding:NSUTF8StringEncoding];
	return RvctxVBEWiMlcwW;
}

- (nonnull NSArray *)xEpOYvFRtcGAyaxtopZbq :(nonnull NSArray *)mnBXkMDxUEYRo :(nonnull NSString *)kVgHVvcMfKhY :(nonnull NSDictionary *)uiIKwOqvbsVk {
	NSArray *HEeyXUXDxfQTh = @[
		@"lbRmrffBouFODnSEDqNQQDKkBpfvuAvdMJPFHvvfmGfIOdmzLsHcSghrkBgMpCefUvAgTsOdDMzdNIztBPCEmLbRgLjtAuvvstAalOXxrtnTSBVnKRfAUNbktCQFCVHIERjnsuqfjfitUAH",
		@"xqdZACahugXTuHqYzvJRdFcRpYfBmxjCgDTbkgMXELkShclGSnhjtWKhKdKPdDGGdvedFmAKXkXcXeWelNlQXMZWGtxYxvStNNBvZsTQhj",
		@"cpeZrfOzUViNPIbsRTSemXXQrhZWqppXRgfcLXoTCAGAHAqkBeooStSyxKYzdQEiYXGDqdpImBClJECuTajkkNykijCKpSFEjvESdbCyIgQpWDBiixUdHGDdUFJWMS",
		@"vvnGOeLMLGxIhIBqvuxfwQjxfEfPZnhfHBtkfQTownjzXomNJTfMIjRwoUjVUiXooREgKYLBmSDktZwenmbwgDsLgFYfzucNlslVGkYFrvBDhqwnwFqYABAJGXdEEjeWrqVKDjutzRUpD",
		@"uzZKpIQWPbxJZEKgkhXdTifsTzFvXMskHfVOLaMamdloYXpAAfelicGiFxfbPauSRpAXZBvfLXEtexrasTbwhQJtmTFwxIkTRqIhcbKRr",
		@"YTwmjfpglQbtoSXhNBdAiIirkFdCCirdWaKRSbpnERZBDpqtpfssbAsoFdaQSJpehSrvFmvPUKVfZJbPcSIheHZUPfgWjMEDFgbAArENyONehieYVUaliJpbHDCgKzjoKTsksJrHUmVmGqn",
		@"oaJdOLZldxZoAkJshjhtpxesoIXiadXmFATRFMycGxdbVznPYwbjQjDWgWKoKReExSDrmqmszDkoZOUvfOYPjmleBcekAfpsJldZDjKYEnSalKiec",
		@"RLqiLWpcdZqXgVaJkozHWAAdKanEUTJTtyeYuFPRqzgUfOwTjPIeWCKHnFeUKuIIlYNDoLqUoQhaUXgKBhpCuPnfgtuaaTJMfUNKqcuCjWtndZTPM",
		@"LKfPDsPjNKOSQOwqUfzWyovZshwLzgHuwdhcKBLcychhmhsNwAmLYTjrxFLzkAvkjKUDSGTTPLEivMLXHiBCqzfbHqghNNzlwcdA",
		@"ALuNqzoGnuAgoAEHgOexeQWmNIkMrFmtwENMtKMtHUedOwRhGuUabEtakygQsKEvrPPJCTfKTtpoWdCjbUvtnkzDOXjxFCLAKlvjWjZDRtMpMqgbFvAwxZQVyArNLXPwqeOhjhBXVnAvVuRHAsHjA",
		@"PJnADkDVUmKsPuuZbQiTyanyzbvCrSQzwlWyTRNzHETSGpBikbwSUpalMtQYZJEfFhGeUAQuCcEruAtzYrhFttXlIBBfcKOLGaItIfkzJfoEfmgvYhpLwqIWwTxfdBCZp",
		@"DaRwzlojGdxvrTCwZrPsQVibKzYuquGMMVlXmmLbrpNjTCzmmeuelYlrOEncxtBaWsmFGxCbzqWMWMVieihahYRMYWIwOTEsGjujVWJSPLvz",
		@"SbgHVlqBZeIjldiKUguRGMhcFnujPDfrJYcObvAjopbUhVjCHMRhrldgCmyBbNMUsRrbCmFiVOMRpTlyYNRzFZWsEOmjdulggoiov",
		@"dZwLYRgFRzLOuvNbnlhphgfCHhDiuMEcZHvfcFKhYcciMYEaEYmwrhBjPoKnZmguXNMcoUozUGYcJufdpmgsTQMYOvMuOTRdhVYq",
		@"MEoUfhxbBGTqQVPwWwPzMgXgdnUIPkpjwVHMUFhdnKAlhBmomKLATOcuTBSpZIVoCuukZMAUNRniZSIrOqEjrGhdZDgAYXJOIikvmSctuBIubPJzMhcoDbGGoeTjsyiGowgYzHqvvSPobq",
		@"IipvRoglrXRqLVeTqHaTlDibybxTCgRAxmNkNpUJZMRjWyxfwJpfxqMkiuUAFoVQnNLvXaETVUoolHwLnSJkFCXCOtxzSxzDPaFoFEbFidnjXDkLKjcLfnCiinCjayMYAulElTyEzmeIg",
		@"yMyGEVnLUcORGNpYAueEecPoBvBIFPTGaJIGJcVVAhLBmSKlqOTxaGOIXqRXlwqoGFqcwJDPpwKWasJaNkhRCdRbFjrdENVanwYwjQmF",
		@"AHgQHEHmTWOGKsQzqQJtngjJdkyyMKpQrseZBHOpkPfSGCRiddXKxRiSKqfiDIYrGZWgZqLndUMikzTbDDBSwxckfJDOvQjWizaFXQxxoZzhEpWOjbzzMkcGYbOISiVekCrMQkwKrlWufWrRmXCec",
	];
	return HEeyXUXDxfQTh;
}

+ (nonnull UIImage *)CYRjgZGLEumJdD :(nonnull NSDictionary *)EvAMbfChmJbKNwJHPQwzNRm :(nonnull NSArray *)gTonaDIEPrthIuIahPYCv {
	NSData *ZhSeBpOsRUvsmkcucaKNtB = [@"cjKzcPjvdwLSpSXmSqDnJfRJebhQDqAPHGOPGuUYKdQhqAvFIvULXivqICRWgPVhDVHAMmWwsehMTTzMZSrbkPRRETaqMvKdORRhICGMwcx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xOYPqVNgMywo = [UIImage imageWithData:ZhSeBpOsRUvsmkcucaKNtB];
	xOYPqVNgMywo = [UIImage imageNamed:@"VYKQsSCcpLYnkDrcUkNkplnUsfXUFxUgpqlRoEDeFxduEkjuXTRbfGYVPZrEwlloELqDEuvXFvxjVVODxIoVbQQVcENZeZkBqHIQBVTHmlEuHWjgdeYZOfygudfDzw"];
	return xOYPqVNgMywo;
}

- (nonnull NSArray *)JuyrmktYTs :(nonnull NSDictionary *)PwvwISBDImiicKaemLC :(nonnull NSArray *)ElqtRQEqMEIXVJMM :(nonnull NSArray *)aFTiTdLjhyJpIXSHwtF :(nonnull NSDictionary *)LzQELHcAIcNa {
	NSArray *vERwYqHzieR = @[
		@"UJrFxzeJnAXioZybIWdntbJsVWIDfptvnpyqIhQRIZlOKeXlEDHBLtkQZBJFrYUlveaoEUdsGtaFWNXEQLxVMXQlXcuQHjbzHBmESHTW",
		@"sQJoTPOFKQaxUVLktkcteKldKxjvINAfrwOIfjAdosrGIxCuiMQXuRrXYieLQZouyIXyRsFzcEqBAyPtovfPYgYHUbTEJlfskaDXGCvTQWGOzrRakxpJNbzcZLxSByecouTMeHlxtASaggtPQLVul",
		@"QEkkFgPoCWWKOBnYNVuSoMCbIJkgPTBqlAZzGOIVWwHpwYtnldHAJSXajgNfGCfGlqtmctCGrDcHYbUTYpRpEORQoFaUMactAPBVAILITPIOcYnTRXYcw",
		@"ulKfLIqbHwtVkgwEFjLBbuFWgjgZENWcBDrAvkEqOMnNNjLSxKxNIyaZoGxWohuKPvxoZkPukNMctoLMkMMWbMnHgHpNDafcSNonE",
		@"iQrpfZfNZpsWbcpUCwYjFRJHWgiicVYFqEjBvybTqTDwFRzSeURZyGMhinHlSIjRetMLjYOgsOmjsCBtMZYEpglfONkSifkXrLfDcFZWcKjldfY",
		@"UhDtQbkYXNaCUBbVXhZEzyHjBQuBhGbilzWPfOENyGZabWvFNZFHXoSweVQnMcEkLVaUmlgglDYlvxFzcZXFdILstuudpXSUCQwscVLEZSUCuyjSXxAYDVgNcTyGGorFtQwqNOIQkucfwl",
		@"uDafPxMLEetBeCKFIDtsKLsGlkkHNjJJJRsNcPQQOnJAipyerGIYnuqPwfcNUPDhbzSpgultDBrQvkWTeymTCwFANSWvXbfPKNfSFHNVBAOUT",
		@"QhrRwxydHNtrsSyVBPVKoZUlpVvFTRyMsOIevmBYapPdrUPvICiNauDnNmzmoyLabYMVYgDaWIaRubUqXQAteiwpUZgDJByhdjffXA",
		@"nDuZFBQLbuvEbxtqYRfYJwzGWUiUwlNihWwUnskYkWuzMVcUPARvFuWrYfHixqCzjknxfRCfhvyqlmwXpwyxVrreRElNPqPGJRMVShiXzsoZUsugOkWhIWPM",
		@"jGVVypTvfmumtgiqaSRTakLOlwBwPLuEcXrLtICRepTzjsVWSfekbjJkuMofOpLMiLmTnjMcnJAtdobJaPZICXbFzZbbUfawHvKhEUaciBtKvTuKDExkFjdggKHkkor",
		@"tJdIITiwGhwzKXPYRKuMrHyJLYEsqrlKHpUHyRqNCemsOwomwVIsqcSBkmGaXTxgrBgMKTxLitJGClLXjFzSkhTNjagJjvQknQiZsNKAakPhY",
	];
	return vERwYqHzieR;
}

+ (nonnull NSArray *)mhhfDmBbiyGjzfdazAWVr :(nonnull NSDictionary *)wUcBdBqgqbChaBVcWckExdQy :(nonnull NSString *)vLtbnRUAGfiBRtcLrhuVcum :(nonnull NSArray *)ruertejEatNnegmTOjzDgNHM :(nonnull NSArray *)SfShxLOfxkqrnHazpy {
	NSArray *hvdfTFDhaIxgwMi = @[
		@"qLStQEcSdIlGfrdfXxPGxlotsGIuVJsEIMWATNXPJDevTtdfwWsKzlUTfqweKOsJRxNTFjQzyBNKOqBxUzVzdvOPjOBOgfXypLUizdUPYqOBhlMxRupfBBMPkkK",
		@"mqGqZCFSjJcJDpYumjIwxrkRuUfhqfWPnCKJOOZlgKiODWQyKnwkNiDhDvoHjbNYeuJiObWddqTaYSBZyeVhPDfRsSxdcxAOWYFoUTJNgPSQyqdJiJf",
		@"sPIIJXAMNqUzTVAwGEmsMAjQFXNbltYcnElKjDiAMjnKOIVVVIdKHJmsQEdozCpnkjWaeRAyMFHihBxWuNRAGStVNZwFBPCbHoFkCIntECidSANsUMOXxs",
		@"zicMZybvPlgbEEbZcmDVCEsfmoeVMCHSuCqlgCWNfWgSWZmuzPbrjdInamXASgpTJnMLZjxmxcpcYKtoELUdENOgfnAOAmDpRIUtOfgmMtPtyznPlDqojRwThTTjiPUiTpVkmPPWsrFqsYtfzy",
		@"HkQnSbZvOnWlBNmARnJyBcunsIRolfUDaLajXMrRvyJMvkpBKVHfXbTecBNtfFMqmAhXaKDeVVvbRLKqrxpyYIkOGKSSolgVVScAvufse",
		@"JsYWgegCqyGreyAaoMDyLVbZnisuXssgkKVhvTbXeYNrShkARcAqsEFQdUNiYbnyxJehIrlJDiSCaVitNFQjDoLlrzmYFyNdyFuIDfuzLksnFLubauxzyafDikXPiKmdDud",
		@"JjDmdtmBAOnakRMDdCbNOwbogbKoSuGmFIewBOcPjAKsQLMkqZACOCnfxPAgppkbVoMmHFhvtyLeZlTKIivgCawMPRDpiguKfBZMVQeEUpcPvRhVotzomYYvMlpVnCImIecHvzhiH",
		@"nmuAlhTdplMwSMRcfksiCVVTjsGrHZiFkotdJbtGrNlcWgWIWTsGVWmxUFVHWmTygWLvagtqqjnqqWEoPIxoFNuzCdLjHZybZZDlhaXYyvHyYFSPQqNeGIctNKPktAvHBmAstuxlaqyL",
		@"yxOXPmcaxiuHMGEaJUNHwjlpLdOSSQJdKSkgKiXiItSKZSYjxZaXvMWjwnigtkDXebhtDowyigeHlnlwaQQEviHpBiUYsIJUOYjPURwaIneJsWlzvsNNXKLifgNEgbWKDdKwrKf",
		@"nGUDlOTcBPRCoLzPiSMakOgjukSVMEmQeLBSwAyLsgRfPynpHGSPZeSUZvCRhYAmPeYpCKAWjpwiozJNwRnbTnJluqbiuXcEPJeqhRzC",
		@"HfeTQbJOitcqEhGCvSlUfcSzvEcViVzlkQhRCIhQEyyTtuHNoQdGRkfYjMviStkMxTafENKqqeeadFkmgguipeYLliHWQsXUdIZT",
		@"WGcLPFaHpBpPcyAuyrVugjuvLHtHrxOXQfLSMiUwGvGMMCvdluqniUqwLGzaVlAxfhlArpwHztoNxHCvZAhCaJvxufaTGKHBXjJhjXGLEFVfhCvUCnsbyITMWglskFXPqMy",
	];
	return hvdfTFDhaIxgwMi;
}

+ (nonnull NSArray *)QGKpWyCVZR :(nonnull NSDictionary *)zcEVnquqWi :(nonnull NSData *)WENahwiYNUKf {
	NSArray *pcMVFPtEvAOCKmLmDN = @[
		@"FRxqowQGQjcWdqISQoTjZNkGhiQMbIQJiDjQzwiqcfAevluQRRgvRsrgqPgNCQbzxvTJWzPYJvAZbDPawambAiFxKEBezOSyfTlOLpoEQlryAXjBWj",
		@"mHMELbOLtRWjjTyAsGNDpudWkaWmKfbkkdKBnpeGMlfSmZDKCsWwpplvZAIMcYKiVHCyiRGAJIIhcdjJwTHqhmqBfCgTNeIkCNAPdrNCCYsuqmRhVBnEbQsyuvjjFmrLFBrcioATsWgMkPH",
		@"sAEIRtOvdodFlWvuKHJdwWExYBnuzHpnGVltrCMlpHObndTPtAJkZTVMwfqTlyvUQzkijrxZOCZMenYCKgiEHSdoPZAQQdIqDGwKDtkuauaEEUMvhbpFrACAIObHfA",
		@"svRguKbzqwnXnUXSKOABQeDYmGksCpYEYxTNEYhCtXLbStFtbQhDrINGxAggdHaIugeZTlSdvsohxoPpyVNBTAiVwvGtaZGtGrKOUsrswNcGv",
		@"oNMkGLssAaXbHTDcszxpaLFhplRiqOHcELOEQEEYUcDWAimlncZqEGdzWGrkKIfPSjjNxcauPVZPgwsmXoskNbpHUFxtBiCxDGuvuOHpPHtHDcqysNMoFXLhg",
		@"HJkoDaNVRjELFsJzNYYQVlcrQWTXtToVliXWLbNVcseQUBVaBiFdQKsUXmUmkxCRiGWCvRzcDpjmLporuCtOrnNpqjSEeTtflleIfVagWzQQGmUQVJxAJvjazCtSs",
		@"FIOCaqfZYYEyoXXznysTaBkrdvHkKDOAxVXTXijKpPLUgWAJFOVHMOUSBwpWodELRZLrTigetlYRODXZdKocgcFZBkmpSmNVkuaSHZeMEYKhyyNbNuou",
		@"JpywnGtGUityNSYzoxMgLDcdscXVASSbypvEGUVRlZSvOVeoBDujQYwTMOxytRoANgGVSdkwalQCkjMpqMWsjizwIwAWiLwMzNOLVrzYpmRosMDLwGBPpEFoiFHqpjmPbCwS",
		@"iuajLIFtyORACwOGjqpevUDQcfkbmqWIVxraaGrjeTBwMtgnGxwSjcGbRZDxLdyFfhPIdrpEbyyOHWIKesToRovSfHTLxPJLRXqjYSMVjleoXAfqdyXXYqoydmhvLjDzuizIUoRwwBoTe",
		@"TbjsMFdQYzKPgDffhhnvgqeFqRFdypgrcnpfmzblTrwbRzYxIleNYfcLgOPmizntBZQXVLQpasGBGrweeyAELJPZJhbYbtBMeHfa",
		@"LxRMELCTdMHSwGeyhIPUTamiZPbIsyayzyyZPajZQnaQoSAKJIKLeWMKVhlakOBUtafOPDYrzWMZuxgfZLfDQcqsBaTDhLAYCjocbtfWclylgifljhzRomaSXWfQRDALDdvaBmwGxcXNnqrIM",
		@"WImMapKCFQLRfHnzimdYZJOhlXsXpuyXRyUxjZUOBhMfMVUpFgMJbewLnKDDjfnOpAHwHJxtyMaeCsenDBVgOAvTqMpgxOekKthyZZlMrygRBaLnUtTkwtEndSUF",
		@"hetuGGHaHoveloxIjtzmjEdbWKhtjzDBlNHOHfgRKAOzqRSVMgLYwaVqGyhaAwvdiaItgVhubNiKZbQJSTvVnyADJjWammisZKqsLlzXHDfwFtW",
		@"PaDpUaoHSgfwlbfCgzpjUFPXHGHBaenQqjsaMadDbVJsobMvjYgwiJVcuUNnGooAWXlYRUIQbhGVQvVBGpNaNTPGlVUBAgCOrkuhQpLaCPCVPUhACDtThfnJ",
		@"xApQJBeBCOaSSjKdfzRtBMWiPqZhrDbBblXSmuVepzRHvNAMfmHMLEOWzmgVsZCSJEXTrdrvhLagOJGQZeEHGhaDCqzfgaTgPgGak",
		@"lZbtEufxzhqyQDbmycowkXIozHOrAbORFMvDFQPSFOMBBKodvydZQeVkEuISXjSusrftkTqAjNkVjzpopJfWfLVDGyaPrirwoHPfUnwSVKLnj",
		@"PbwkajsYSfuSOWHwSAZZvXgakmrlBmmsCWcBTPryfUqjDALAFTfAWLRdlpGjbIZzmKiOZBjIShLLUXjwmKxKEsNRkaJCFFxKbnITOWPn",
	];
	return pcMVFPtEvAOCKmLmDN;
}

- (nonnull NSData *)qkLXnVTTKbGAqBX :(nonnull NSString *)EMSWYEusVCfLSoPZxTcQXdAg :(nonnull NSString *)mMTqEsGzbXX :(nonnull NSDictionary *)zFDPsgfYDGfawjmTkwYD :(nonnull NSArray *)TvIeTeutzA :(nonnull NSArray *)VGwxyPwdZkZosLgRAwZUHzn {
	NSData *LzXgEmysijWe = [@"wKBzZkeEaeqcdkVWuLDkSACNQtpvOiYGQUwgrTmGBtOcigwnxavznaRbmcxoEKEgtOpkFSptnlIdtTQFakJWpfDSyhsMeudGkCtSoKiuUBCwqXLloRtyNrDSvDhw" dataUsingEncoding:NSUTF8StringEncoding];
	return LzXgEmysijWe;
}

- (nonnull NSDictionary *)ciiEJkOefQAR :(nonnull UIImage *)rdhWEfMQKfpVzS :(nonnull UIImage *)NNJOhAljmkmXoR :(nonnull NSData *)QKXlQTxUZz :(nonnull NSData *)PsZqTSCacETxMHIpHgA {
	NSDictionary *cobRaNcyAssKeZXQwLl = @{
		@"kVaHBBAfqVzneUbQrsKcV": @"esEiylXkFYydWCUfOdmTGEHVIMjMCCsTHvurtnECwqZJmSIuhTtCcYuczvhAPVzHaJkGXuzuPWpNwbWasrovZgLbYmMoQnukxKQJESNCehXlfImBxKARZkPRqiGFfGpNWsoCzqIfxLedFhWixiFuy",
		@"KVVsUiCrCZHaIyXkNEfCEz": @"gXFzzVsTBpyVjNgaNYGhjKsGWMtsBFwndWtAhQrpHzAlIdKvYjshLdrYGxeNaNTVhxdBGWrxiQSWDygBbrcDGagweyBjBRzXpqgWalYyxOBYQSJmDfDFlfMU",
		@"yxcMiQvEgoTlgg": @"EXPPKXaiuanmSZxAKzkcmzVOLJBxARpMMaLvUvHUruaSNdWaymiBknwmgRYaRszwMSWTvBIwNboGWvtHXGqmOYYHpcaqAmayWELlF",
		@"VBXdNNJNgeuBxg": @"XsysutpWrIwMJJyKanXJBUuaphuJjcvhUtoFyKkfKYjqPhMvTDqaTVRmJYYWxDDYparwtHJTJxFvMdWzscosfXOdbJGwEItlmFmrqoBNxWKuLJQWSQKTxjtvbBYZlsRatMsNojRZy",
		@"ImrKWvEvDIiACWCgFZzZaW": @"JlQWThsmqvoqfHzRmOzFejTEzQlQydHScUxxivEcrsCChpAbIXGnHsnjnHVsbDSJyZBhOANRtXcwvhnmLsqSkwqgYUajobRCgGCiKeLSmKtijeysXlGWaEcuhiyaFKXnxbHclDfWztywsyYUQvb",
		@"AyHImNsxbBbXTHCxDCVuztv": @"NVwxeoibyTbTghWPnawPOzwunbScvTuAYlkUaIZvMYTpyTRJJtUPCVyoMAIqSClGqkAUKNPbXyemmPOrVJKyTOvhMgePcXaFiLxSwZdjjjUqH",
		@"hPhEyajphLIcSISaL": @"XTIjsEdEWospHmibQbFmgWtZhEVuWZQoBLyapDDKKYkFgmqRsGUtkwBxggWkLnFCrpKzksZFhXZMKiTJSjhCmkYrYhyMJibePZMMCuSIxLFjRzucrGdATCunwjaotzhHbtFtU",
		@"LyHkIBlvbRgkOOb": @"MOcMxiESwIiZoLuchGPhwBHuKILSRvPwuJbWFZueBZaJfMAQAArzGTluQfCRCRbAyomzBMOGhBdhBoDXgZyTBbegoJXKalcMtQVZXtJLRQENBgmNeElp",
		@"nazlXfDvKbi": @"tDHKnfvFyKEyNnymjoljlfsmjzXgZNGThAqHlWlmcKSnCNDgNxkAiECzBnsnkgwiVknWubTOoOJRVvHshXYvfrAIIyxQAppCdTusKaprqDJkHCogVJPEwFLfeWZeXyJclEp",
		@"RPvtwXUXUeBjg": @"eggtGchZvfZwdHGIsgpbZJHFhoyViuTmexpVDdYmRjsvAnBPTRHxoWyXCkSZWEyAlYxutTgTZoyKPwRwNIfqfdNwtdNIBrHaaKPndwEPhObonPviSwQN",
		@"TYHfoupgpAoN": @"vtKWhBqmClrNtVzHqdoQBicDaVuANtHkqdAtNlMIUxGaUZqENIxGbohBzAylDaCIbyxvoShCJLDLRAZbZaWJEmDiYkJQJradVyuGUBMpXBZQBoOTNNMpITn",
		@"mBCZXSNqGZDjTNAfouYwZab": @"mndfBSfdEhYgxWxmahIuwuKbolyFwmqiRYwXcNOSpRQurfOIkoezrXWcBGUXXaInkntGblsNpBghxOotLXZhaQnCGejVDfPWmQOLULppqoBFVOwKFMGgHXZClXqUkuCEaySFoIQoSoPoozJObjLli",
		@"LhgQaliTojibTPCQXW": @"IJQnahlnvsfLtSbluQQBElkzKYcFWVqhahPThNutYdiuaoIYHCnlMvDWwxTBpZrmyETQmLADzhukEwXtmUDrAiLKDdBnNztJrKCYQaiqfMUliHgEEqwHjRcvDxTnfnqebfeiUGabCSF",
		@"OBOVFFrRlMatAitxMouErQ": @"SPQXYcJXzPHnDmPCHgJbaTMmCmbEpCUPjydadwKeuSikLCteiwbpkyBefPfbadNtpzRPoWEEAPvetuhGNXvQtvTQRLiISdIkMkfPxIAuPzkwsstFJjAvlOrJtKKYOjGAyCuC",
		@"uDJpYhBNYgBggVIJ": @"HAVlneSGVjZgKyWJUgVxNLoFKOjsGoHXlYUvCeJkYjeYQzGgdGzsrstZYBePhScerNOjTJMjXGzrMCQQVFiNCDBiNbeAxnSJWJmYZfxEqLdzgNBHoBAQxbvLubjgiXHBhrmFitLoIPncMzoEJiU",
		@"CGANrjKyNCSyqyKydYsmDLec": @"OInYALTTXfBcJFvmACFTcrYfuNHnkHXndYEEOztkrlYRDrUkOzxHQMWmEuSHiNDoIbsyyvXutLJfSVdiTMCYbhMiYcJzXChtiFkMptMApWFBobxafofwfrqiJrPVQhIeW",
		@"yojDjazASKknEuSCQvsTB": @"iLFsDjxwdhilYaMaorzmcqeVGvrXPKHEbLFxLbqqTvCEkVMzXNRKBCjCbNYyASUhhDosJUvNBbKkqAoREJFhtMOgVOtrXtkKlsKyRhZhj",
		@"oxVeHryZzhU": @"MANyzdTWSgTggkUOaeWhTEgfyaaFjWIapyHxjCzkJAByoOHNeKMhFosQFoSpycnNXxPrTVUwiNHsfWulWdqGFkVTAQCcGpOtIQQQuTtTrJcbYKOyYxMCiZmhaQxVubczWqt",
		@"zFCBxiZWNKhCpJvVOsBmdIb": @"yhAToyqPSKiBOTsmAuxfYcLeWbbuuYeZPyPNJEqaVvqQkjIstCsZOlxRIADFRSMwYyFVUHKVRgEakBwxZOgqXKfUpZtwLdEgyPQodkT",
	};
	return cobRaNcyAssKeZXQwLl;
}

+ (nonnull NSDictionary *)cPvyPYDofR :(nonnull UIImage *)JOmKILVLUOwidLBpFKO {
	NSDictionary *WnOzJdtETuCxIbkeT = @{
		@"cbPBuXvollTIEmKYHu": @"AGeDNcQvupqIoNhZZcAvYfGOSGzzuCHVhQNXdKYgOFjpwqWTORRbhWTcsRpgKxlADSkfCkcpoFWSCuQjqNpRVYqVWaEMqdaWXTrHsEWaUnARSPHHkvsAlKbuvgkJyMt",
		@"vRauJrBGyHFjXCxpg": @"XghmCodbbWxXXNqMoRbRTuwycMBGZKjimsKDAToHsOCwARNKXzpeXVQxYpDtUmGHkwgSfSCHDhAtrOcjCOTzYaLOSRHuThRyDLSkZflAqquUcTM",
		@"vlWxNKZfgdwUdKvSSQYcUl": @"iUHXSWIThQRfENNuhqNKKLhBVzSfISQmkMwFnXyzraAZoexwHIcwlyWRYfZXBkPuuCEkGrngogrDbBtqXCvQCwUbbzhvDPRAQyunsIXyCRlucKLPKKohBwuVUX",
		@"KwDnbJtnGDaTjcGEbRvKV": @"keGjzYsJHuZVuMhuHUoSUTVISjYjqzMlcqDKwTbtTNMLcuhWugHQxBTButIUPvIpWjoyLpqEDMcsLVawRdTFwzCrArhplSkbKwIoNxhTy",
		@"PnZCofBxldPJXepwJPXthhux": @"bxdRVibyoomVYnosYJgAnihrjRqwnkPAWEhAJLsaLekkkGdyclczFNZozZTEWKXMotfPLEWVrtWMceYJcfJavpZYwCksWpxlfontYrQSDw",
		@"ImeaqbwjasfQEU": @"SNHvVZoqFFkVGEzzbQAKlanSQVvuCTOGdxBMeJGRBLnIeAJCprHAeRgjPSGkrWLREUittxHDZNSthrVXfcMJzIILYIKCBZnbRLcpGkl",
		@"OyoUgVRmRPqWiMUQHkTjU": @"wndnpKSeUcIcfjAmpdLQcaaHTWDhRawazSbTnjVPWFYKwkTvnrKTEajPeMUhBEuOHWrzQLJQyXAfrAdQbOgyuiJYknqEYPcpkNrwKXaqwgb",
		@"tYXKQzKmew": @"MqnXvsaMjQDHXNTuwhdmhfvtfjFHYvCjNACqGvaiSATpTrorPCMggtKDHHKzqLDYhnbkuNlZbGnaaFCBntVtXNVGRnpIVJtFPsXKhaxMprPhbpNrz",
		@"WBqdOZBbYNCXtDR": @"aCIjaooaAFhJvIqiIpfbyKvCvgvvHLhlxzwTWDOyhdSHYiXUAsYYilVvWKaDmwzJjAakSzFpROVUvcwMCZYRYqGbqAqsaGjzhWAdBwoLhVhPdnVdDQArMtatuKMkLBJUULMBo",
		@"xOwPpKjxRaqhJaFWvhHYRdy": @"gZuActnfPOKTNlCbxjmStohiJIMLWKmQybCXjLMDGAbjzjuWwTTtEjxkTJxYNdzpYRzquvXSgchLgQdHjJrxLvBKJEezvDMDhNFQpDKxxsbNERRPXECRTq",
		@"RGRNHKdNfQzgQW": @"IkyIKdcUniqtvhMSUSKikDyUrMkcrJBBieIvmnuYMVBuUZyTfaVJWeLshTnAmENEwSsijanWHrTYVmYNKuTyfPcnmNqkMJitBylDUiANJXoZOhcbze",
		@"UplcFxrhyDjSwNIgVMDmzW": @"ZdOuDumkehKzKMZgXZJxRIYSWKCRtoAxkqibjgmmzZmEZytmvDKzyAfIqnTpThIhEFyaCUaxWGXzKLEYzRhnCvMJbxMZRDZvRfsZFQRPlBqDTUeWoxRrlCJBYePNislwf",
		@"KeORBXiLZJz": @"yLSZiptSyzWnGKEmnufpdiXRuRtHbKZcQrfobNDpYwTWnfFfNWyGyxvyoeqtVFuENHdOYDPGVtdihPfMYhwVEBqWcjtgxAruwqyVMTdsHYNCQaQVjHJWhqpzCwHbJlOabltrdpzhkmliSxSlrXFb",
		@"pJQuWiQhvUmE": @"xuEKNspVoLIfVgctupCVqvfancDoLRCwzxVVGGzmWaDRenhChXXRBULozPwpIcAeMnmdQULvSHAFkwZdJrHkLRrkhOQAXAiPkxtxGTGKa",
	};
	return WnOzJdtETuCxIbkeT;
}

- (nonnull NSString *)VgGGOktJzQLwHRaGnppzA :(nonnull NSData *)sluOcbwACEziRVwk :(nonnull NSArray *)IlRiVzJUpenmIWKLtUKwP :(nonnull NSData *)ipMjteHhadQPZAxtCUoqZtW :(nonnull UIImage *)jhbTPxkZQgdZlcecLaUQDl {
	NSString *GeqiSHHMTCPzcLk = @"nqEpJUUMDbdkZcmrOiaaKJAnZUVrdTwBuFFWbmqlsXVxrMTrLQuvdwDMxBEjUABcPzroCfWpAUHNLZRxsSbpVTHpqIZUJceRVPonYvMUpdIFCAJAe";
	return GeqiSHHMTCPzcLk;
}

+ (nonnull NSArray *)CcIMRaytgWgCcWMFww :(nonnull UIImage *)asNzsnOWwwPgybGucir {
	NSArray *bbmvAzEGsLsaEDzmfBFPze = @[
		@"cjuUPLUBFgKUtSTdCwsEMCesJSOCzxDGgzqJvSiPPpjwPEWyrNaeFdvHSawFSvdTuAlYCpqUiZWeDZSvpVOcSFzNvfnHwhcOKuNf",
		@"HWSODQIgFoSveyqxxvXnJGekIiMzXuKXNQEbqlITDNoacxrPtwCVLJUZiApJEvUTOQEvzxlZnfJBYIAnpLibmgEQxvmtAYMnLivODbTHEcuOMNKwSINYJpZLiNAakYtWPaDYZGuEGRT",
		@"OhrTUmMrgUSzMiNXAWBEOKZYoSduOyPthIAlgvbbgFIeKnNXeMceKgXXsnIkfXfAVVTiddNPOMrMBppgjTDxWrqQlnMHCjrnDPmzeSNPHnpoQLefWiKKYmjQr",
		@"FqjGdXtNDFTbNDELWPFbWVQmLfBOJPFEsonBIjjagiiOjqxcrQXFlGuXxXgDJjqlkyhWPPLVMdgkPQrtNjeENMzKiQcfBKTcfrXfYXiVGlOxHPNHorbAZVTVShiySkXCJnGhutA",
		@"tnHAxEiSyYHMPiTxTYwiThGDAlwcCzpUfUYUfRvSpjYGpxdyqLqwcXbvRTZaLqMQUBPuVsAsmntECJpZwdFQWKUtFSlrUmPqXQpuMPunfvezlOxftShXvgPTvbQvDSLNEI",
		@"DJqaCxpnAfEBkfwuYlqhbuyosFBccRRrClooMCNoReySkpNfFuuteBUPgsiOxMjaOhfujOLzgnuaNGOhVPJMeUEYdhczqtMvvQfcFJzu",
		@"FydDttFAlNzYxTpTiSqbGNrcjSjsfcteEroVdzciwmzhatClcLETRpCUdjoXwJIZNfQZblBmVOmioPtqnOKYBIMmTLBkcfVFelyRmh",
		@"EWSBoVEZDPaXrYBhNFSxTBoLZxCyVymHaIWqfTBVDyJlzBFuqvErrfaMgptgkaJDzPinlYvYPnPnELRSephVYweplGHixHkKnTKeOxGJGF",
		@"AyjFjwyeYfpxmcECAdutHqAEneiyzxbdTcukSTozpTNmXAmzBKXrUnpiRczxUpXnimdTOftqzyGhmxKXrWcXFxJPFnBBYGxESjxx",
		@"QvuuaUgrZglROsyXvFTYTWbtRPteqGbvOSabhGgCHDDZilwHnyxpZifwqjsQPDbavCTHUguFhHOPPWZoFnPOegMeJPChAhCJPppeMKZHlFSDevDBWCv",
		@"ySxOrCHqloUaMMEpQCMBDpcnBFPpXgNTCcUsnvHLegKCYEjPsQwhBLuZRSriexfHjTvUnoVPpEblNiuyONemTZRdAahXnTAzNwrrmrkfWRxTFPxBmwSyBTmaC",
		@"LUuOdlACxFHBoVUOMRHiskHxErTrsPYpIawqPXcWUmtPHspjbNkklBdTMFbROQxGKzZKiWKqLzObiDfvDeftbVfQLdZZqUfXsjDpcGfsNiKWHQAQOakFagooBhfmIiDfzNEwQtZVdqOBugyl",
		@"GGTXjDsHNzkoChmhEddqcSLkrtXHqVpuHygfegRPQjZHqTOrqMYmWPiQSIEbVWJzJPTyBAEdBISSMvArmPzLhnBkCLwsvJOEBczc",
		@"vCuQkqozYftLFQNzmDxLABheYNWOJGGjbCcqkKOmfShPOxTQaJjVkCWrqHHvRmreXauJDwryqgbtfZaAGbSGTsmShBzJEAeZDmeTqUxCPiFBDDnHTglEVeSMuZQtybwcBBvGCVtfOxP",
		@"KQpvcKMemJSGPJCcvYrMWFCWjyLzFTNvsVeewBRJiYUqzuDTYYVzLsySgBQqvlNiVKWIXgqvrSyVLeKdBtfKfKuvQciefkauyWhtncyEnxeJwQVljduybHUFsaUtlBQTktwxhpxakEX",
		@"lHxXWucppHVXuRPPBgFgeZWxXivmgLaaXySxrxEfdroUNzbuPtezppxOGBfDmTKqrsIQCusxETgOoTIBmknGPCtfRmQCzwiWhpHVzUJvXAPBoUQvgxaVRFPNcxxSmAgwT",
		@"OwFbFOOpnDYYxxnsGLQjUqRtZFmzPxHTdcaWafmzqMYiJuUbHrlxblyrUdyWzyJopemZRWNkHpCENmYdvXjvQYUiZFLvZIzsVkJxprKYplTUtBZCnepbcYyaXHAGAVGdFmd",
		@"cPuaJcQAXqDbHIfZiDeHiTLXrdnCsqCVNnGnleOqRSXETelIJNvedBjOLSZghxJqXvMWvEvegkilcegYbCgtQqGGQYKyTeMEYxJVaYhUJdArOedBkEaKDMgLzBfiyUcpnVSZdkrSzD",
	];
	return bbmvAzEGsLsaEDzmfBFPze;
}

+ (nonnull NSDictionary *)UUsRLTLnCPN :(nonnull NSData *)SzpkiePOazVMLZUeKyG :(nonnull NSData *)ZZVnYtbWIaL {
	NSDictionary *OPaaFDgnZLIgO = @{
		@"bNCEczbUeqenfg": @"tcuEPVuxwpxjWCliGDmxanrbZffCaMbkpNSubzEEHRhahaDPqXwPmcdFaMftyRODEMgtrXsbRYofHSeinewhcssUqISKGyzCOWijGXhvFRFhzuKXkNoBLJJYMTytjpFeBHclhOdfCUlO",
		@"OQeFasrdmANznSem": @"qrEpUPZohZYhekcDEbGRFIGXWEEvsSmlDnmuRmbqfUnzOQliXEZnUugWgjNVnTKhZMbRWnQabxtnIJKlicEXxynJoOEKpUnLwfyOO",
		@"JXVbrzbfRxcPNL": @"aLVZIqCqjuJThdxxqysHQEebWJbsWNXHCIFjrGBeBVvaWGTPJfCGPkbAztJtoSTtdMbgCmLKgcdGacdHjZyGQWBSRLKonMfNlQrgfw",
		@"ZLsNZZeQGaGDMnaoaNcp": @"PPyhDISIUygHIPyxAqTqafFbnxoNqqOGqadMnXDZBZfVapFiZlaatNTVMjBraARBYJdBiPOVDkdvsQMgxVbtIPuXRuzwjKMhTNzFjUYjGcqYSbAJEGP",
		@"NNxHtNaBYTDBZTETKNTHK": @"AAcrMwtNVbWNibFMbFAwiSahsyrHkZscGyaOmcecGlctJbteqDipItQdRmcFIhnBugCjHgWGsfifsCNTwUaQfegcuhIUHArDbaFCtIOhOUWueCJrTzAulOuPXRIYKcR",
		@"uDQYvODCspxHtvOrR": @"HiWgzSZkEsJfPEqnVmYMkKlwpEHnhPBaJXNwXSVCUpGPGjcRbkfiypKouluuRuLEqSGNdtgDhbGywVXKKESYAelrNPHsDUdKuIcxWpijVRIUivIXIqvaLJ",
		@"QyMqfnvraMxdpPFv": @"aQWOpfYhwwIlUYJqqUeUnRmbPHPvozMxvXMhsdyjlNoFBXJKFJyZTsbCPSHaOZWaquDdnHyWgoQzwPxwIRajSHdqpeblVuYjopjNxfXdX",
		@"DSlQDgQZBNraBiMwHTPD": @"vyLleobtsqiKtAFWkyVXlawzMGonLHMKxBmBpHrjiNnUZVUlvEtewpLVScCVQgMMkcfBQuqRCCuyxQFUnIthBexwLkHlVVddeEYezlRTrInfOjwszlTdy",
		@"LCrVOFXBfcpSkBGSlPzFhSh": @"QCGOaBthKWucikkBbVTYpgaYSyyMcJKRuvhhJGeXeuwBizImdfBvKKDugCvsxCNCYEhPZAtAPSZiKCwjAHQImMxlsGNUDgGmckoCUTAsgjJuSRnJAkXNkCWOUUcfjkYTGIQvPE",
		@"lgXzNtxKMuMzYwLPf": @"RXlOJcyGpAnlcLGzBtVISnKOEDwUHxNTWsuueqkBoIBJzfwOUqXwDiSyUSbrhIZqWMNuupFDrZJwxqiCslRtttIrubPvxjVYxmmdTPgC",
	};
	return OPaaFDgnZLIgO;
}

+ (nonnull NSData *)CJMQvFryVE :(nonnull NSData *)sNFZqDrcPeC :(nonnull NSString *)NoGBVZwzgdYlRWQjeYqvFVN :(nonnull NSString *)iQdafyHimvMk {
	NSData *wtwkqizcwtpLgxt = [@"GtvwuueZMVBeqeihbmWmZnYtDVUZGpCanDRBLRrkpfbDHRJQlpMFNvTcPAaGgClqIbAYPnHjECVbjRTDabeGLHlwXleLcPZKMaTdmXRpqImiH" dataUsingEncoding:NSUTF8StringEncoding];
	return wtwkqizcwtpLgxt;
}

+ (nonnull NSArray *)XBLEXAonavHxkVmz :(nonnull NSString *)EZQcfXyVEtPMyVuBpzt :(nonnull NSData *)smDedLLgEbsvLZfshjl :(nonnull NSData *)LQXiEchIixVLgvTRiWjqrB {
	NSArray *nHANjUtpoXygATjzKHrDOii = @[
		@"UXRfpdPbTrlIfMsTLGzpGzfJhqQMZaSdoJQHlqAbkKHEmXJPmkWglrCivfgaLfJnkbiSLcKAjbDwiqLcGiKQwCPmMWrePLJjmFEQFVrISFlwCbXc",
		@"MrnzkhSlJdJAuNnmtAqoCmjToLGKULXWKgbCfiPDWHLxABIVOFBmFXaqXlYalyoBjpaVHcqjbylYIkLaqBsEJqPtzBSIVzCKOYMKhmxIkwIBIFT",
		@"zzkqFfwsyFIoqepwSytRlkQQRsNujrRUuIlLXBLeekMseiarVpbxGprMQOiZyptLiWZYNMHLLndLCcnHvMiSYwfCzftvZsezpGIULFtWnaXyzPPvZKvPCGyofssxjkfSzqGWYreRRxdoTNRvj",
		@"sBveiMvMtFaXebSrhsaUIhpXdKUZKrxYyoTKKaUZJYCrDIyUQKudjDJivcnQuRTXaYzhSGhsSMqKaJrHWDvbwAjIfZOwfMhgkIPOUzCbOoGfDdWgGQtuvXkrsZKbElUxZxee",
		@"aavaePDUyrdcyktUfhSrJpgWSImfualAgDTbVcdMApggkOntfyfqPiTvhWVpGaPsItnFOoeNSLejyyZSmrJLNftzFVmySOyfTeKePhyhADlNXHhdmTwzTNEHGaHhRiG",
		@"cMfAFphlWQzHPIbBSfWeADkPmcDFVHSsNYSoyQFoYexDyCHuTrQWzCoDHjVwZcylVPObsSJWNIHOmHcitXvGLuHbpCeJYBgkUmNrhlgLACqzpeBMqqZHaHGxFOrqGeDsdrC",
		@"mzFJPMOmVwgpOAlxKLzhtPydhhaBhhYziUJtwVCNUSAIdQKsZrnLVLXkwHTLUXfUOIlnNjLbDgmkwPfziFbbCRkZApegCNsYJQRkFXU",
		@"dFTIxTCKVOhHrQoPtiwqJIaPsviVHEfocPmNMxFhpqqAzvASvejsdeVNgXXlurFQtzmPnsToGhKSsczXShKcSwawgqLCCKNXYAKCESTDeccblcInpOHziyoksoFZ",
		@"aBFIEZXSAhSrAXGMASXSlSdtykSkumGpKAWzfJAOtCjmrPJKghvLcPTcXKtdKaqvQNNjJyKWUSdFVldIoNijEUzwqHzVnLGTQvZoIYpzlhWhfoInUvwl",
		@"ONCFmgPLVDPrInxlgIFFcLgMORTWODcunIvBQhMJapDlwqADZWqNzfUKgUZVuQXCMcjquIHHQyfNVsUDwazHOClhJpwmMyNiOZfFfNul",
		@"FHPfAnIZjZsoTiWnIYxUMIOrRGSwptuHSRAtqspemtZqJBxslCOpggfFlMTXTrPMQhHxbGnlPSczLPAhmWMHtEMWgGbkVvvhjbAhhNDBoEQZGcaySlfROPsyObZijibGwpVGTMORyyfmtgIw",
		@"grdCAXTEqaIHRdsSOybwdKjIFbNUrHDXUkJCbOAtfzshqoPZPZyHochivBSoPkLCsApFhjpCpAALwOhVNeWqwvoDhTnCurkPgsQHAxtHbeagRydgcYyVvBclewVtS",
		@"yFQuxQUFJIedNQikUCqhHwYhgQCQwtRHzCegejGaXWsoAJyNwQEwBnyhFAKfDhQQgSaoSbumJTjAIBSdpusHJMyRXfNrowDmTjQjSweqcumpTRMSew",
		@"YIikRzqIojsQZKrSgYrQvhPcjEkJXoAdmYQWfaZNzZSTMirqGMQkchSTcjkpdAnxrKEHgfByrogTzufRMTfAMGxCFyQCGdmhDXIfUEQIpZyZPWPue",
		@"yYIHEkBtsEAxYMxDsKzNtkGufaJOCMZIZipHOncLXunberSkkugRoZFwVvGsNbcHWzcXRsQwhTxsjJNkADQoAmBYtWUVLvAduBYlKwAyXJjBi",
		@"qmjwkvpxKKKivnPROoLpWyhIkGtqlEDvcupuanqDQMAQWBzXzKiMIapCirjNbmhVZYjShxdPalgVDMPYnDpepsxGzgwoVpGENugZuJaMSQasmEDrfzQRESeUSjJoTHrfYHSIuAwedJIRIP",
		@"mDpHzDSDBYTbdqdfoGDTpCeGVqKGPUxalXDaUpwhmSlDZZERdYPIcxjXhqTvHCVsbaXdyJsspxEluZigMJtbiCMMtJQbnWNIvFnufAALIakLXTGmDoicKMaqFtsbbHnYHbAgDGLrfkPghRyfr",
	];
	return nHANjUtpoXygATjzKHrDOii;
}

+ (nonnull NSDictionary *)kSvgYfJErMGI :(nonnull NSData *)vVsjQdroqJHJ :(nonnull NSString *)MHzzWNclPHrakfe :(nonnull NSData *)uPmUEJnFCeLJtMaLLWCGoJVD :(nonnull NSString *)YEeKofGKNuUwFd :(nonnull NSString *)PNwaUybseVb {
	NSDictionary *JUiNTecVYzgQp = @{
		@"HFJaqOFZPsuYX": @"QjoyUzJmOhjvQkReJEtngHKFIZvMIKaAVnWMwxvuVYrwafoLGyfWmCVhGEOsjdCqlLmLLuKuGKkLAvYUztbrUZnkcTjEVSgWIlHXEMD",
		@"wabKBHgLGdEKsPDxdyoxLf": @"jfCXYcwkCqRRkcgFgAZDOuHmXQUnlvFhXhXpBozcqJRCuSlkwYjqKtpZrmMlVaFPmjPRsZuaAzquTRozEEHvscfOqOsNINyZZNDumfhw",
		@"RByJSPkldLVXgQonOHTIji": @"vQkAoyxGkpsxGUzhtFmooZDKXquTaFtPurGeZDImLnToDtECIVCiOuplGNjJgTPOQSFXBroDJygaxvjtvJWVqaIFnnyCAgiQexKbURHPwwTdcdJbxZbkCcnxFmGZkz",
		@"aRyNuoKugwTKhuSkYRojU": @"SmMhewhxzqcTmagxtTXpcBLZGWzeetyGnRsVlPRfdVLWxxAnHKTLuSxBzExNcSkRWYxSuvHUjZWWKkHcolwDupYnNLQjuZxDBixTBG",
		@"NPnysdwKqCzRZkU": @"xWXzjGNofySiGPhEItIEZCxlNJhqbKnHvRWymKhxviQwiIByHNaXfdksjogqJPwNNAjCApmakVUaIBpMKieitJVWJiYomzAjMrZjITaXyEJMWwvAlemHn",
		@"vVXcjJfZSHBeMUDe": @"wOkWlVEXlHlqppEQoXENCVqYadsVHsPihsMhkHUBabwKViqdkSaykMUnelEcXXwhsRVCtCVkHUGZRHEbzeaGXeOWJaCeBBinvGegdNlcCysne",
		@"NxFxIxeJQukkLmnYSoVPeoba": @"ftPiHDzFMwYeDkmOjbIUJXggDnbPlRxmjxDPovVwvbnvGjiDLxFQBdxWdrACztXzwvfeFKjDHFHkPccXJiQaVUhBHGMUHHYmKWuYsKxZSqDbmHbbBnoDNVxQDTQlssScGDS",
		@"dLyMzrRozlFZgfVWorQ": @"xlzgbjvFXBMYtBAKBukecSKelTlFZtssVMoIXHInJAsYwpMhrUQqLQlYpwRsQdYSlGfmiTcHstVGFNFVUogyYXsNIOSVAshIqRBEHCGHKIWbDhBMgXmEaYlPhsinciiEVBZnTPRkmmNlyRTc",
		@"VvVZfABrrRNnmojzV": @"gdxDxEOCuLZugMGgJoDiMdWOOZQOKlbTCHBZzCDsCaxjgHfuOYBpPhNLozNTbDQBrQeSyTxxuwjRaSOMdtfrGBoLPmrMJKuSTOEtcsMoCkG",
		@"tljWEkQMju": @"PJHBKlpHelzgWtemLVvAroVGhGBWfroGSeqQaqlOJjjLCBuYVaVpACYVFUoRqsSatYhzupSnGNRTCebnROVNYWroWHqEaQNRuoKBnksTubTrSAIxknIHgNc",
		@"ErhFeiROEsFFc": @"dKZSddokCtcAhAidwEkDHvWLSfXmNdmwmGjplpHqBueAOXsNEJsryyIFJyXpSiPROCKPbDmtyKpxXkkhQyPBRjBSOmBhczdASmMdCxpcuzbBvSbKhfCoBigvtmQp",
		@"CBJdANgGLZrFos": @"keDDUKQXAvKnMRGHqTJdxWahPkQqzAxlRclBfuKRlxjXcqkBsXhPAOvJRIjPdKeoiqXYSYOGSMmunYxeJxSruMRzcdPCQiWqukQHGGU",
		@"PWiXgvQRKZNEUEQrmH": @"dzVVHZZMqsThUxhGEuhPQLkoGcWwKjjGVGVWaVTwNVPGqIXjuMxWqfRBcjqaSKDTaKiHISCEJVwinFzuLWkwkcrynPiGNgsNLOPsRleFsBSv",
		@"qYhvEBMgpqcL": @"KYfmJmLgQjRBVLgVuCytsxRjsRXSmKkycFaKlpZsuEAQQBybLDUjXzornInoHiGLFvakDgWvQLsouyWNjjQeqCiYwWqlyJliMTNEiyKXhGCONCYDIV",
	};
	return JUiNTecVYzgQp;
}

+ (nonnull NSString *)NdbdrakGGlKD :(nonnull NSArray *)BYaPuEljmPBNdokCF {
	NSString *ihwfXYbuAKLTfSHsJjHVGv = @"CpRgulZdGVMAfnhYgKLAHlrdMnFJnfIRvEvRaQoSUVYKYPcosXrZUFtGwwjLHMnfnJIWKUvWhqmJTYOoecBXgNZkRCwAJUUFBqkuUDSSmqEbIBxYGSycHIxfbHcpQuSiSLlJkafJhgbrqQdz";
	return ihwfXYbuAKLTfSHsJjHVGv;
}

+ (nonnull UIImage *)hATeUBofhYaxpKO :(nonnull NSDictionary *)tKSdSOzSBQnWXtCfpseQMluK :(nonnull NSDictionary *)zfnbHoBOipZiFOi :(nonnull NSArray *)ZEpVRrMtNWIqaTTPbG :(nonnull NSData *)ilAndupPJtBOWqPNHJj {
	NSData *xHUfzfnQYVndCLZGjAga = [@"PYwKuxdTrxrAmpwmOChIYVXyuVcfDfwSCxzKSfhQZNVrDnKPpZPJjEyNxjnEQNUHFcucZmYJeUCRtuwRSIywDvnFFbtzDKWprlhpnnkQBTzhFEXmMBngHZrVXpHfeqGwNzRbKwmW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CVPtEEqvRyL = [UIImage imageWithData:xHUfzfnQYVndCLZGjAga];
	CVPtEEqvRyL = [UIImage imageNamed:@"KZIpHgLHkvvQTaRLgaIAYkpRlLelxEeJGGuvwjOcvuXkOsIKcQKTFeLorMlwauCtcjmCjmzrxYGHTQZrBpmbNFumiFcZqfjuJVZBDzKmdzZUXghVnZKXdqHRAtBjoEBbkjesxhvOcMHnPbzbMjNjK"];
	return CVPtEEqvRyL;
}

- (nonnull NSString *)dsazNALteX :(nonnull NSDictionary *)RhaeYEwtmYjJbJkIdBoS :(nonnull NSDictionary *)uvBrbBQYWtVpkpBQii :(nonnull NSString *)JOOuginrPQsWvas :(nonnull NSString *)BgoaUyIPmCeFZgwexL {
	NSString *QjVuuQfxvfnCEaNyiW = @"sVCOjNxpVAfNQLmDbXrMGhNiHXdaGqvZrzvzowgpggZFIcYGKYpgnWZgQowrMVZeODrmkGLOpvAoTrkNRjexodUowoJznLUUwOKKmBfmhpkWPGdZiyyeUjGhiGmLCYmAFuJNYZCPPUy";
	return QjVuuQfxvfnCEaNyiW;
}

+ (nonnull NSData *)qPzGXnHjxFPiZxeQsIiySjMF :(nonnull NSArray *)VvIHqkqDVc :(nonnull NSDictionary *)gvGZDUGMSDoJv :(nonnull NSString *)HzMmeMRxFthJB :(nonnull NSArray *)pCTsFNcDSN :(nonnull NSArray *)TbXIQflRBDhz {
	NSData *iTVORAaJkQtWavQyZ = [@"SyuqnefBnuZPmHXFWmGVJFDolIKlYWKmzinMgEUPnzloJlmWppiibMQTNDOollmpxxZbXTkTUBBpzZbcwrlLTUZUZbucsFHAqnIcqELftQvFHqNnglon" dataUsingEncoding:NSUTF8StringEncoding];
	return iTVORAaJkQtWavQyZ;
}

- (nonnull NSData *)RhMfGtUxeBA :(nonnull NSDictionary *)InqbOhzBFzjZCGXJqcWHg {
	NSData *OkNaihFdpVqjeSEgsuD = [@"ETujCnmVowVjNTmToJCBQZgkkOJnZhkfXElAlRNjkOjtummGfMSrOumyuLKoiGcbkhvbKTaVKalzkhYhmkbuxblzGdJrxWKEjKrYNaNXRfq" dataUsingEncoding:NSUTF8StringEncoding];
	return OkNaihFdpVqjeSEgsuD;
}

- (nonnull NSString *)kaWXyHSeRDYpydDY :(nonnull NSArray *)SFWaPSWiQMspIMT :(nonnull NSArray *)ulFyUBcJlDSasOZhcCp :(nonnull NSData *)kgGhnAaBRCgJPfqOuhUk {
	NSString *aqhXDvutZKdr = @"wMDNobAqmuJOIivocYiMwvBZvQvifaWmXofTotnkqwxrTwswJFLXCfSLvQsafCzTYCWZHyAyhUWnqOwHtfXSpunzRZJeIVzsyuMNfQRNAjF";
	return aqhXDvutZKdr;
}

- (nonnull NSString *)knZmaaLipeggylzARMwpKr :(nonnull NSArray *)oyMprjKvSXP :(nonnull NSString *)KPyLaCkPXhJsakZKxeCaFE :(nonnull UIImage *)mkIXaQSkazYpg {
	NSString *CznwwiXsPMPhseVVXMGXsk = @"jttUjIiYRIbUuIIcmglcQCAgMXfozHjtKtLBKjwHXxdXIooEksMywdlLSdiWLCKgkrwCexDNwzDsERlbdsLBXStrdcLuCXJwIPnY";
	return CznwwiXsPMPhseVVXMGXsk;
}

+ (nonnull UIImage *)YXDVweMGZePqgKszqPUchXpD :(nonnull NSDictionary *)fzyqTRdcnNvFfmcX {
	NSData *iRvZNQmztHWYG = [@"IZlMcPYRpKwjnhnliSvbeLdQjUsFbdhzatLFxSMKabZnjIgFTUzfpqupLxBvicVpLywmsEaeKOBhFfUldnZHkuqtyZWSYZAObPOWJBWOFJbDFVMqJQoRQSoN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hhdQTvfvrLILsrTYXwXJTtv = [UIImage imageWithData:iRvZNQmztHWYG];
	hhdQTvfvrLILsrTYXwXJTtv = [UIImage imageNamed:@"dspyfwiQNmcWXZqyqQUFfzYuGjBpflSnIcNegUFnIsyZQLxMrBYjRipLXcWItROeeVGVDCVHZVUOYYUDHCibHibXWweAAVcmIBkNRJmULehKSoEkmoRXUpKpU"];
	return hhdQTvfvrLILsrTYXwXJTtv;
}

+ (nonnull NSArray *)eFnuptpoSYdLHtVpDs :(nonnull NSArray *)MHnjkSUfikKueQQNowJtb {
	NSArray *WJONYUrggRpWnxbfgiQEgZSG = @[
		@"BinYCXevQKhlgNBBzOHAjLpzfbbDDXcjkqDCrlNPAPZfIFNPJIVMelLqtnzjKRMWcRaIsMDzfPjqwRiXZhkosQORypcPzUTxtfKVgZvrRvkzpNwWEk",
		@"ziJIZICGIOgwyuzBdvBzujTdShPYBOXTunRKTDNQkPdYeyTZDagfaUFRKHDxletfbrklAFLWIuHujaHfxliKeOWuEasmfVSEGjiPXwi",
		@"YDqcmdnyIWgTunbbdYJtGVcNCWnwfylraASzABEUFvBigjxzKZOxUNpqEKbJAzLyyICDdYqMiXZuYTzTwKHlbGzRlFNxOQLDDacMGzVpBccpld",
		@"RILDCrrrMhzervyLbfGpEBSliYSGqnxOdBHqfrubfcTorrZpMaoXrYcQeMdwcanuZsWSrcRgfkWRiJkJBpQAuhBJwQAAdGmyVOQPIRwITn",
		@"zsYDmEMXzLPcAWpaaDiqlRzTpkEqubWbpimcvteoDecJSKgCVvAAYEQSnpgADRybjKYVMaTznkOoQSaoGKrgHDOvuDwfsEZXpCirJCaQnaZGgzr",
		@"rnVhStppBWEwsYbWTZlYEyXgfIoLzyKTHlAlYdhNoTXduzSrfOWMyPuqbuKZAZVnjEeLyqjCiSWVMTxifPAQjcoovuykwsDbjQqPOWudbiMVUCIrDSrLwxdpdNZKz",
		@"QDAXGckwowPVdoJRHGbYQfYPpelfZnvcvDHJvcJBkGUGHfkKwGjGFzwneHzuwXiNcodmBaYqcTTBUjgNAcOecUiaPqUqtgNctwUaBtXiUPFfgxECyKFIgGzzkoZxvDJvfXeNkmToUWmoT",
		@"YdPgQjCqtTNMYTvApbyumFMqQIwGWeiNajvghQsrECllLfRnKPEpGdlaOgFZApQjaEEwgmdqMXcRcgYqVDxQsjlomYDVPQDYoxIIoLQPxeBeFNFjNdgiOEUQQCUrBBdZZyiVxGx",
		@"BAYUwDDPxMOwNPFtGTLcipzbvYqYlDHCmLQvvGNhRMvlYQWFrwReAuyeqkeYcNrhphpwYNBcMcklWsalqnSGFYNpmkLTaraHHtdCTwqSVzBprAHnhdPISZTaJGxcE",
		@"MVtUsFNggfSdIpQmnNPHnvIydFCSRkcBsofkxcNMKgiPmxRDmCyPXxJlAexvjEtUsUqipjvAyiGRaEzEiDIeGWDOwwBvXEDnrZRDbDUvViBehLWHTFyvGibf",
		@"bMWTqjaMvwKtyhobgzMWYNDjhNUYpQjrwYdFrisimvUuwUQtuXtTknEHCCDeKcNRDrvymiUVNqRgwGExfMxpTGXgCPagzrmuylsLDK",
		@"jkfaDdpDcmtyBdwOzrfjwtmhuDddeqpzouaCXpjfouofYsVpoLCTDXAdFTnXGYKUjCGSOahcExPqeNRVTAQmdMQQDQCMIdzXCktbxfdVlMgBvyiMUeoWEEkryJbSUqrWX",
		@"wtQBkmOeegzieCUqZGiPPQGASszUVgjPqIPssCUYsCiEzzxjkOATJKKtQqmloEmTGySuSsGMzfumBSZiKfHOpYyisGzrFctdhLCOErmqeujQbyWsQcORfFvPEazfKkYwqvhMLTk",
	];
	return WJONYUrggRpWnxbfgiQEgZSG;
}

+ (nonnull NSDictionary *)vSrVyIXeXzbSFHnULr :(nonnull NSString *)hkBrRoOZxvwQjMCFUHOx :(nonnull NSArray *)DdrkCkunbcHNMwxuAhZCzUt :(nonnull UIImage *)IVahXtesAEHgoahFbkElRbx :(nonnull NSDictionary *)jWKmiGJhGhWSg :(nonnull UIImage *)kMTlZCrLmdrIJhCiZ {
	NSDictionary *eXVDRPOJRYYesxMKMtqdgjU = @{
		@"zmHjmQXlZwcLlVwHMX": @"llXnfpctJifThlroEhxPzHaWbRdEHvgfpYmWaAJiEJjszLXzxKWdOqCezWxvvoDlrlEOugcCzkpzAPHZbukYdTsXYGyGxHWpKUnhaSWSBwgXNPNbWPfauaQaa",
		@"sREKHrmpODvOVcGLBShZwlI": @"aUCrbvWfwhGfMYjoIVpFCcnPXbnRTAeykatNszSFrdshIbPbnvpqBJItUJcbFOmOFjjZeTSXNNkhfMYPgrxFhheEKtkFhWRwuJbMxqNkX",
		@"ZqJAXrEfHyHkVjAmzGxvpMi": @"DdUqyeeqGTKsiayKYNqJtXqZOBeVYiqpckthFSIqnEiWjTAcQeMDgxFCAUDCgbrpXuojalwcdOhoobeaKXPYaAIoNbQtUeDOQKYIAGyZSHkAiOdxKGztJYBqXlKjQKSYEUxgpaNtXTNYpwDFe",
		@"bTgtxSFUVKl": @"bZzheSyuCxTGUKSMQugVruivkwtkvrFWfFPKvLzjBkScrPtiRdROwwCQQtUPtVcLjXFJGAoyQwwVlUPwlSTEyYUlyIWZnmcRTylgDcycbSEDQOnzhJKrMCuuEvOGSMJQwkNhWHwnEPkaGolv",
		@"rYPZwVILFHvjuiGRLF": @"kBhxkOAsmZxbzBicbbswXoaWrLqvZdRXAVgpSfTWNtwsQacCzGPRVVuNWXeCYMgqXGFMvaLohphVGJYazccqlYrSHcwojBVYpeiWoWIQOeTzjIqXdoimnEimKCnp",
		@"tkSyjDWGfZ": @"HYZLTmxSWKUluuXEcZTXRBGMwlkOutBZQgbFiYDxuNbvMJfYPhBwMOyawpwLWTZmBjvAfXCWuPNvtlyRPEXVbQVylMMpIiVwgBooupG",
		@"aYTVgvInTNCGYIQjCbUgBYJd": @"AroxXFyVjquStGAhnRVWBHIuVOwNybjWZdSCEfCORaqMfDrPsXNheFycTedOeHgwOdvDkDjvSKGdfHniPmbVgDYLhyDzPPPXePuFFOuEPsfgakwwdvrrl",
		@"UimYxYMOWv": @"AEiPxGnsgqeyAqDEzFkYfdfkkhlcXBuQDUoANimZiaTuDiklUfJnXrSWhyLggjHPqIzPnBvwIdpNMaTywnXxSyrljCmgnSbGaTLbGuQRNWMIbgXvqrWOmYt",
		@"mwDAmiidShvgCeSPzRHfYRG": @"eeCISFkobRysfJoqSFWyaMUOlhjAmkKhFtmeegPfdsOtYjBYSjqzpIOVHrATlyFbiqUppQHsvdNYhcAqkaHkcJLXXvaWwslkUBcJMCuPkDeloe",
		@"yjjXLHtrzNSHZ": @"QogllqLXyakGxNSzPIboIfOjmVjWStkHvdMENYScctepqiTAldwKBsuKoMmzRXIwAWKLUZMGYsmHLxcGhQdTmyUFvxNdklIMhMabNHyanRbaTOEdlaZXgJPboVemjCSPPkgNXhZkdwYH",
		@"uNwgTmrwLbub": @"EmXtHBHSmaFQqVLxoMrrUXNTNJglpRcVRfwxgdDDOLACjxfHFSpHPDzLnSTgJsNwpeEKcjCPqvDjRpOnLNFKnsaDMIvNkhffmraYDOQQzbfsRCwlNioIDugjwgo",
		@"hOEGRzWOqShmJMuUNWis": @"rwNLHgYfxBbfCVKUhSLUXaFgbdlMyXyZcrQiYAsLTeaSWLlYzgWRzMeTqHuiRTBoCxnLvmBRQCYGUgLpSeBgFbbVzFoAdPalGSuiJdfFKpgXbQSwzdrimIvPsskfbiyr",
		@"ZrDWSLIhnbTUCECJcGYUoDb": @"PGOaVhuWAvnFfjrfFXEgwJpEmOowkcwbVeTZRxBNNhJsvgQyjuTvBNsuSgAixiPLtUTCiDRhcuZxHWwmMJkbgyUerYkDctYgVMJHMsBxieEuhUsDHnALAkBvyI",
		@"CFlrzSKBFDMKrRdOwvOoXmXF": @"nmjZMzHmawnwUcheSoZSrNemWDPqCYxdPkkIDseLCwkZIPqleHvkkXvAdfqELolLcDwPNdmTAebQkTaSTVgQuvXExDEYbvAYDhutXDxmEsvpVghVCZtTxPs",
		@"IqwGYDGocOte": @"FAObiXZwZEHaFcBChPMlTtpdOLATYnOMcbClqncNnivxMZQwlLYEqyTFeRckyLQBzYmZkLsfYjrzlpCtXADlBTdMzIXdbcBpounEdXKsJuzoNp",
		@"NakkIZqvJFuqyTvLM": @"cVGuEVPJxypEiAGfKGGveqjGFpoxypRoavwmhfMaGPSbHuaGcwInCasfrlzXtZmbOvCmqREsrgTTklWQtjFIhrNxRcXSNeODmVpIurToUWBjKBenxOOFMYTWTbUKCEOVIDdVFFAqtWzn",
		@"OeFcrOJQgfSxwdSbvUTI": @"kEqRwIgWQgnCYfyJUWnTRehNmrGXHBNKLiBmusyQtKahujYWgBKMccVoSOrLlyJtiGoEKNgcPWaagQuPMTkplrBXJjteWJWMgyiPWxxIADBwxVseCgzvFQQjYCNdaszzPE",
	};
	return eXVDRPOJRYYesxMKMtqdgjU;
}

- (nonnull UIImage *)mkueJWwpfwnIZMYEzGbs :(nonnull NSData *)grvSHlCsWQUkkxPdTU {
	NSData *CgTLjWNKqsJu = [@"qcmmVaMfgqKyWdQyuukWGPJSKFythGfAfXrCfhHIGPFCqZxgLvmNwPuyTzUIZGmLbCveqpGrbgxsJuoZkNgDZtxCTFZckALPXXkbvIaAzDCtnORWETjRHnHhGIDPqmquwanLIWWfCC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WanTKnEQSFFWtIiLTjehv = [UIImage imageWithData:CgTLjWNKqsJu];
	WanTKnEQSFFWtIiLTjehv = [UIImage imageNamed:@"OIoGteeuwrMXZZPScylSEYWjxNobLcFMdzmaPupgUatLxOTwrNWCxIArGYTWcpJUdiraacHPRrauzCmfZNMUdbKgNBJYjpRwTFVDdwLRRjkGSRVqqouXLFFNDhISLZztDfudOxaPaw"];
	return WanTKnEQSFFWtIiLTjehv;
}

+ (nonnull NSData *)OzOgoGtukBMtSHMSqnYHcXz :(nonnull NSString *)xyOyiNrixNLOp :(nonnull NSArray *)xAcsTaAdGOd :(nonnull UIImage *)zPahLZxmIJtWuoFVu {
	NSData *nbnxnjEkuzIKrLkWoHUdQ = [@"PGSSMGRSoDkhvZOEfIPoHjonSYEHFUGmUEwzeLpobNLWCWOIlRYBjYsirQtlmHzAYpdXIkjdZqturErOoxzGNkYPpvDUuGnqIYrsOjdLazmKtWZAjNmHSmeqkyEjAIDcIoveQwNtK" dataUsingEncoding:NSUTF8StringEncoding];
	return nbnxnjEkuzIKrLkWoHUdQ;
}

+ (nonnull NSString *)YCaCRKFbfg :(nonnull NSString *)tBoShYFcKzzMWBwXlgoc :(nonnull NSString *)TEIeCyxyOlzIlNqXqhgFLuaP {
	NSString *wRpqrWXdjLZxpLpOOThpSOEr = @"DTRUkcYtFEfxHLXQeFbhaAgYGnrahcJwBLnTkjVLiBQBjvTEvnjLkzWskzIXqyAMGZQotYOhefChKOCNiRTtOHobXPgscGsiFbugTIooTfyZv";
	return wRpqrWXdjLZxpLpOOThpSOEr;
}

+ (nonnull UIImage *)JEWgvfrfMPAtIsKWxyG :(nonnull NSArray *)bqorNvifsYNZqHU :(nonnull UIImage *)eaYlMGvsUxskExTbObhvn {
	NSData *BvKqRKgxJtcEFnOzorLYD = [@"bTLyytuOfGTrxukHJzjOoUOGmuMqStLrgMHfnjyTeundMoPMgdTvJWKsoXLicSztRYGwaZfOIOdmAbJvrhhZwIAbxtpspureimtqiOdEoIpldyOSFtnpWZuJlrRVy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nmAxMYSsIH = [UIImage imageWithData:BvKqRKgxJtcEFnOzorLYD];
	nmAxMYSsIH = [UIImage imageNamed:@"KlkfjmaPfiJEhposlvMkGxStVTbwDlQUNxVlwBqSXLjXgbgCsCULEbrYsKnBQwbiRYDwEdiYrutfrxRhBDZUOlvbbxGeTdEGdIqsTOQtEQpTixZcrrbKStYjrCOQ"];
	return nmAxMYSsIH;
}

- (nonnull UIImage *)FpmVzmopGFLGCCKXog :(nonnull NSArray *)JZNJBOvVBjPCqdiELILFy :(nonnull NSString *)gbEGehvkxiD :(nonnull UIImage *)IrmAFKETZWjncf :(nonnull NSDictionary *)geeJbzXvsMgnvaWdXeOsiVY :(nonnull NSDictionary *)XnRpwupFfnHYcWaPcn {
	NSData *zckqYgnVDAuGUCfmJbPX = [@"UvwiRVWzRiXCfHuEMItnSXxyHTjFnLJQlKrjNWoVDieTGaCgUXPWIxIxKCalVGathslzfemIBkfCnjLmTgoNJcIRdedUaUPDKvWFPlYbOPzGjJDTeYayCINmhRZRZotpIYXmuXcSdpQefm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yDHKNedHOcdgFcwINaxTJ = [UIImage imageWithData:zckqYgnVDAuGUCfmJbPX];
	yDHKNedHOcdgFcwINaxTJ = [UIImage imageNamed:@"tXJkTCyLjGsrizHZPtGCaeiWVNgVjAXhfbaDJMEHOYGkPCSWzLyrgJHezRuochGNWJYAOEYBdQNNovMesvuTfkiwwOPuwhNDxydNRehsYcxIZosYqPewLrhXrzcUQDd"];
	return yDHKNedHOcdgFcwINaxTJ;
}

- (void)dealloc{
    self.MainViewController=nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.leveshade=nil;
    [super dealloc];
}

@end
@implementation SmalleEbookWindow
@synthesize leveyTabBarController,EbookWindow;
+(void)ShowSmallEBook{
     @synchronized(self) {
     @autoreleasepool {
     @try {
    SmalleEbookWindow *NewsView=  [[[SmalleEbookWindow alloc] init] autorelease];
     [NewsView LoadNewWindows];
     }@catch (NSException *exception){}@finally{
         /*百度事件统计,传入的数据为:eventId,eventLabel
          1=其他
          100004=小书城启动次数
          100003=热门推荐点击次数
          100002=强制营销点击次数
          100001=图书阅读次数
          100000=图书下载次数
          */
         [[NSNotificationCenter defaultCenter]  postNotificationName:@"BaiduMobStat-CustomEventNotification"  object:nil userInfo:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects: @"100004",@"小书城启动", nil]  forKeys:[NSArray arrayWithObjects:@"eventId",@"eventLabel", nil] ]];
     
     }}}
}
-(void)CloseEbookWindow:(NSNotification *)notification{
    [self dismissThisWindows];
}
-(void)LeveyTabBarControllerSelectChangedFunction:(NSNotification *)notification{
    [self ChangebadgeValue];
}
-(void)DidBookReadingNotification{
    [self ChangebadgeValue];
}
-(int)ChangebadgeValue{
    LeveyTabBarItem *barItem=[leveyTabBarController.tabBar BarItemAtIndex:3];
    NSDictionary*dir= [[EBookLocalStore defaultEBookLocalStore] ObtainEBookLocalStoreInfor];
    NSString *badgeValue=[NSString stringWithFormat:@"%d",[[dir objectForKey:@"downcount"] intValue]-[[dir objectForKey:@"reandcount"] intValue]];
    if ([badgeValue intValue]>0) {
        barItem.BadgeValue=badgeValue;  
    }else {
        barItem.BadgeValue=@"";
    }
    return [badgeValue intValue];
}
-(void)LoadNewWindows{
    @autoreleasepool {
    [self retain];
        
        preStatusbarstate=[UIApplication sharedApplication].statusBarHidden;
        [UIApplication sharedApplication].statusBarHidden=YES;
        
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CloseEbookWindow:) name:@"CloseEbookWindowNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LeveyTabBarControllerSelectChangedFunction:) name:@"LeveyTabBarControllerSelectChanged" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LeveyTabBarControllerSelectChangedFunction:) name:@"EndBookReadingNotification" object:nil];
        
        NSString* device;
        NSString*fangxiang = nil;
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            device=@"iPad";
        }
        else
        {
            device=@"iPhone";
        }
        switch ([UIApplication sharedApplication].statusBarOrientation) {
            case UIInterfaceOrientationPortrait:
                fangxiang=@"v";
                break;
            case UIInterfaceOrientationPortraitUpsideDown:
                fangxiang=@"v";
                break;
            case UIInterfaceOrientationLandscapeLeft:
                fangxiang=@"h";
                break;
            case UIInterfaceOrientationLandscapeRight:
                fangxiang=@"h";
                break;
                
            default:
                
                break;
        }
        
        [[NSUserDefaults standardUserDefaults]setObject:device forKey:@"device"];
        [[NSUserDefaults standardUserDefaults]setObject:fangxiang forKey:@"fangxiang"];

    self.EbookWindow =  ((EbookWindowReader*)[UIApplication sharedApplication].delegate).MainWindow ;
    self.MainWindow = EbookWindow;
    [self SetupBookReadNotificatioKeyword:@"SmalleEbook-StartBookReadingNotification"];
    NSMutableArray *TabController=[NSMutableArray arrayWithCapacity:5];

    //1:@"精品推荐"
    bookOnlineViewController *GoodBookPageViewController=  [[[bookOnlineViewController alloc] init] autorelease];
    UINavigationController *GoodBookPageNavigationController = [[UINavigationController alloc] initWithRootViewController:GoodBookPageViewController];
    GoodBookPageNavigationController.navigationBarHidden=YES;
    GoodBookPageViewController.title=@"精品推荐";
    GoodBookPageNavigationController.delegate=self;
    GoodBookPageViewController.TypeID=GoodBookPage;
    [TabController addObject: [GoodBookPageNavigationController  autorelease]]; 


 
        //2:@"热门排行榜"
            bookOnlineViewController *BookPageViewController=  [[[bookOnlineViewController alloc] init] autorelease];
        BookPageViewController.TypeID=PaihangBookPage;
        

        BookPageViewController.TagName=@"paihang.xml";
        BookPageViewController.title=@"热门排行榜";

        UINavigationController *PaihangBookPageNavigationController = [[UINavigationController alloc] initWithRootViewController:BookPageViewController];
        
        PaihangBookPageNavigationController.navigationBarHidden=YES;
        
        [TabController addObject: [PaihangBookPageNavigationController  autorelease]];

        
        //3:@"书库分类"
        bookOnlineViewController *BookPageViewController2=  [[[bookOnlineViewController alloc] init] autorelease];
        BookPageViewController2.TypeID=basepage;
    BookPageViewController2.TagName=@"newpaihang";
        BookPageViewController2.title=nil;
        
        UINavigationController *PaihangBookPageNavigationController2 = [[UINavigationController alloc] initWithRootViewController:BookPageViewController2];
        PaihangBookPageNavigationController2.navigationBarHidden=YES;
        
        
        [TabController addObject: [PaihangBookPageNavigationController2  autorelease]];
        //4:@"下载管理"
        bookTableViewController *DownloadNewsView=  [[[bookTableViewController alloc] init] autorelease];
        UINavigationController *DownloadNavigationController = [[UINavigationController alloc] initWithRootViewController:DownloadNewsView];
        DownloadNavigationController.navigationBarHidden=YES;
        DownloadNavigationController.delegate=self;
        DownloadNewsView.title=@"下载管理";
        [TabController addObject: [DownloadNavigationController autorelease]];
        
//    //5:@"搜索"
    bookOnlineViewController *SearchBookPageController=  [[[bookOnlineViewController alloc] init] autorelease];
    UINavigationController *SearchBookPageNavigationController = [[UINavigationController alloc] initWithRootViewController:SearchBookPageController];
    SearchBookPageNavigationController.navigationBarHidden=YES;
    SearchBookPageNavigationController.delegate=self;
    SearchBookPageController.title=@"搜索";
    SearchBookPageController.TypeID=SearchBookPage;
    
    [TabController addObject:[ SearchBookPageNavigationController  autorelease]]; 
    
 
    self.leveyTabBarController = [[[LeveyTabBarController alloc] initWithViewControllers:TabController imageArray:nil] autorelease];
        self.leveshade=[[[UIView alloc] initWithFrame:EbookWindow.rootViewController.view.bounds] autorelease];
        self.leveshade.backgroundColor=[UIColor clearColor];
        leveyTabBarController.view.frame=CGRectMake(0, EbookWindow.rootViewController.view.bounds.size.height, EbookWindow.rootViewController.view.bounds.size.width, EbookWindow.rootViewController.view.bounds.size.height);
        leveshade.opaque=YES;
        [self.EbookWindow.rootViewController.view addSubview:self.leveshade];
        [self.leveshade addSubview:leveyTabBarController.view];
        

        [UIView animateWithDuration:0.75 animations:^{
            leveyTabBarController.view.frame=CGRectMake(0, 0, EbookWindow.rootViewController.view.bounds.size.width, EbookWindow.rootViewController.view.bounds.size.height);
        }];
        

//    if ([self ChangebadgeValue]>0 ) {
//        self.leveyTabBarController.selectedIndex=3;
//     }
        [self ChangebadgeValue];
    }
}

-(NSMutableArray*)CreateTab{
    return nil;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
 
}
- (void)dismissThisWindows{
    @autoreleasepool {
        for (UINavigationController *vtc in self.leveyTabBarController.viewControllers) {
            SmalleBasebookViewController *bookView=(SmalleBasebookViewController *)vtc.visibleViewController;
            if ([bookView respondsToSelector:@selector(RemoveAllEventsAndObjects )] ) {
                [bookView RemoveAllEventsAndObjects];
            }
        }
    [[NSNotificationCenter defaultCenter] removeObserver:self];
        [UIApplication sharedApplication].statusBarHidden=preStatusbarstate;
        [UIView animateWithDuration:0.75 animations:^{
            
           leveyTabBarController.view.frame=CGRectMake(0, EbookWindow.rootViewController.view.bounds.size.height, EbookWindow.rootViewController.view.bounds.size.width, EbookWindow.rootViewController.view.bounds.size.height);
            
        } completion:^(BOOL finished) {
            [self.leveshade removeFromSuperview];
            [leveyTabBarController.view removeFromSuperview];
            [self release];
        }];
        

        

    }
}
+ (NSMutableDictionary*)BuilteBookStatus:(NSDictionary*)bookinfor{
    
    //@TODO iOS8
    bookinfor = [NSMutableDictionary dictionaryWithDictionary:bookinfor];
    
    if([bookinfor objectForKey:@"url"]==nil&&[bookinfor objectForKey:@"source"]!=nil){
        NSString *tempurl=[bookinfor objectForKey:@"source"];
        if ([tempurl hasPrefix:@"http://"]) {
            [bookinfor setValue:tempurl forKey:@"url"];
        }else{
            [bookinfor setValue:[NSString stringWithFormat:@"%@%@",EbookWebXmlServiceBaseUrl,[bookinfor objectForKey:@"source"]] forKey:@"url"];
        }
    }
    
    if([bookinfor objectForKey:@"name"]==nil&&[bookinfor objectForKey:@"title"]!=nil ){
        [bookinfor setValue:[bookinfor objectForKey:@"title"] forKey:@"name"];
    }
    
    return (NSMutableDictionary *)bookinfor;
}

//使用3号epub书城处理书籍字典的方法：吕
+ (NSMutableDictionary*)BuilteEpubBookStatus:(NSMutableDictionary*)bookinfor{
    
    if([bookinfor objectForKey:@"url"]==nil&&[bookinfor objectForKey:@"source"]!=nil)
    {
        NSString *tempurl=[bookinfor objectForKey:@"source"];
        if ([tempurl hasPrefix:@"http://"]) {
            [bookinfor setValue:tempurl forKey:@"url"];
        }else{
            [bookinfor setValue:[NSString stringWithFormat:@"%@%@",epubWebXmlServiceBaseUrl,[bookinfor objectForKey:@"source"]] forKey:@"url"];
        }
    }
    
    if([bookinfor objectForKey:@"name"]==nil&&[bookinfor objectForKey:@"title"]!=nil )
    {
        [bookinfor setValue:[bookinfor objectForKey:@"title"] forKey:@"name"];
    }
    return bookinfor;
}

+ (NSMutableDictionary*)BuilteBookStatusBaseUrlOne:(NSMutableDictionary*)bookinfor{
    if([bookinfor objectForKey:@"url"]==nil&&[bookinfor objectForKey:@"source"]!=nil)
    {
        NSString *tempurl=[bookinfor objectForKey:@"source"];
        if ([tempurl hasPrefix:@"http://"]) {
            [bookinfor setValue:tempurl forKey:@"url"];
        }else{
            [bookinfor setValue:[NSString stringWithFormat:@"%@%@",EbookWebXmlServiceBaseUrlOne,[bookinfor objectForKey:@"source"]] forKey:@"url"];
        }
    }
    
    if([bookinfor objectForKey:@"name"]==nil&&[bookinfor objectForKey:@"title"]!=nil )
    {
        [bookinfor setValue:[bookinfor objectForKey:@"title"] forKey:@"name"];
    }
    return bookinfor;
}

+(void)Tongji:(NSString*)bookid{
  [[[[DownloadHelper alloc] init] autorelease] download:[NSString stringWithFormat:@"%@/Default.aspx?type=1&id=%@",SearchBaseUrl2,bookid]];
}

+(void)LoadSpecilRowsOnline:(NSString*)SpecilID  delegateTarget:(id<DownloadHelperDelegate>)target{
    DownloadHelper *http= [[[DownloadHelper alloc] init] autorelease];
    http.delegate=target;
    [http download:  [NSString stringWithFormat:@"%@/upload/xml/zhuanti_%@.xml",EbookWebXmlServiceBaseUrl,SpecilID]];
}
+(NSMutableArray*)LoadSpecialRowsOnlocal:(NSString*)SpecilID{
     NSFileManager *fm= [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:[NSString stringWithFormat:EBookSpecialListPath,SpecilID]] && [fm fileExistsAtPath:[NSString stringWithFormat:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ebookspeciallist_%@.plist"],SpecilID]]) {
        [fm copyItemAtPath:[NSString stringWithFormat:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ebookspeciallist_%@.plist"],SpecilID]  toPath:[NSString stringWithFormat:EBookSpecialListPath,SpecilID]  error:nil];
    }
   return  [NSMutableArray arrayWithContentsOfFile:[NSString stringWithFormat:EBookSpecialListPath,SpecilID]];
}
+(void)SaveSpecialRowsOnCache:(NSString*)SpecilID row:(NSMutableArray*)Rows{
    if (Rows!=nil && [Rows count]>0) {
     
    [Rows writeToFile:[NSString stringWithFormat:EBookSpecialListPath,SpecilID]  atomically:YES];   
    }
}
- (void)dealloc
{
   [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.leveyTabBarController=nil;
    self.EbookWindow=nil;
    [super dealloc];
}
@end
