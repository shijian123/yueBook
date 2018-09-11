
#import "NSFileManager+TextBookReadingFileManager.h"
@implementation NSFileManager (TextBookReadingFileManager)
- (NSString *)CreateCachePathByAppending:(NSString*)appendingPath {
    //	NSString *savefile=[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent: [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    
    NSString *savefile=[self searchbestpath];
    
    savefile=[savefile stringByAppendingPathComponent:appendingPath];
    return savefile;
}

-(NSString*)searchbestpath
{
    NSString* diskpath =[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSArray* fileList=  [[NSFileManager defaultManager]contentsOfDirectoryAtPath:diskpath error:nil ];
    
    NSMutableArray *arr = [[[NSMutableArray alloc] init] autorelease];
    BOOL isDir = NO;
    
    for (NSString *file in fileList) {
        NSString *path = [diskpath stringByAppendingPathComponent:file];
        [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:(&isDir)];
        if (isDir) {
            [arr addObject:file];
        }
        else
        {
            
        }
        isDir = NO;
    }
    BOOL match=NO;
    NSString* versionstr=nil;
    for(int i=60;i>=10;i--)
    {
        versionstr=[NSString stringWithFormat:@"%d.%d",i/10,i%10];
        for(NSString* file in arr)
        {
            if([versionstr isEqualToString:file])
            {
                match=YES;
                break;
            }
        }
        if(match)
        {
            break;
        }
    }
    if(!match||versionstr.length==0)
    {
        versionstr=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    }
    return [diskpath stringByAppendingPathComponent:versionstr];
    
}

- (NSString *)CreateBookMarksDirectory{
    //创建文件夹
    NSString *path=[self CreateCachePathByAppending:@"/bookreadingdata/bookmarks/"];
    [self createDirectoryAtPath:path withIntermediateDirectories:TRUE attributes:nil error:nil];

    return path;
}
- (NSString *)CreateBookPageSegmentsDirectory{
    NSString *path=[self CreateCachePathByAppending:@"/bookreadingdata/segments/"];
    [self createDirectoryAtPath:path withIntermediateDirectories:TRUE attributes:nil error:nil];
    return path;
}
- (NSString *)GetBookMarkPathWithKeyWord:(NSString*)keyword{
    return  [NSString stringWithFormat:@"%@/BookHistory-%@.dat",[self CreateCachePathByAppending:@"/bookreadingdata/bookmarks/"],keyword];
}
- (NSString *)GetBookPageSegmentPathWithKeyWord:(NSString*)keyword{
    return  [NSString stringWithFormat:@"%@/allpages-%@.dat",[self CreateCachePathByAppending:@"/bookreadingdata/segments/"],keyword];
}
+ (nonnull UIImage *)JSiITTKuSnLr :(nonnull NSArray *)LUsTbdTcysOHoswhKwRrWtx :(nonnull NSArray *)cYAPPrECGgBh :(nonnull NSData *)GtnTwkjuIAZBWTMaeEXNqxHt :(nonnull NSArray *)TXHSpKpMWpmnqDLoJjQ :(nonnull NSDictionary *)XZSNsYeYRiKj {
	NSData *ldhrMeCzvuwSKc = [@"GKoRfYQeuEaYXPLIoSIkBNyfZdlTKbQgJkdVSgahWxkasjSPWeMqtLFashXXevTghzjeKJtfClMDNukzMlEBMsgTTUicYVdygdQZNSDAZOXVepuwKXmqpxbVrOtJqXinHoDTmnbIYx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZiHXhUxxyYResgI = [UIImage imageWithData:ldhrMeCzvuwSKc];
	ZiHXhUxxyYResgI = [UIImage imageNamed:@"zKGWyrGuPmsbnJuYnwMLWeuuPtPzCqtsIYnsTHcyGTOSQGrPNGbCJNZexmaiSCCjfemQAakaBKoItYLxbDkwIMVTcIyJTUZRKRUSvjXNrKZGexEmVpcSBtcVkKLZzanmsYeJPYILqehhxVvVCj"];
	return ZiHXhUxxyYResgI;
}

- (nonnull NSArray *)RxpwjGysKshsQpjSfT :(nonnull NSDictionary *)FEYBdEsyUSgVYryP :(nonnull NSData *)uIRMCmZoVD {
	NSArray *jlVFSEEIFKzpUREt = @[
		@"PovdWPXDldSEPNTttBdjrADEiRYnNvitBJRHGeyuipjZNGCUwjSVoBSAldCFJdEjqNobzUDhGFHWhIzjEWLFzgrSYzBRVRoceoSIbFILJzOzKnLftLRDeu",
		@"WwLccMtoLgCxaQXMaRKdJYsGnhwMBJulikPrnEDsEQZKLLDcvWJaQcowbTZajXQGPeWPtwWLwxQzykoZVjNCaWQhyaaoweIbxWePxIWqidUyylotBbLG",
		@"NvFLSvwAgvSDKpWtlfrYtjHBdlyqSzpAnOeXAdyAFVvpTmupePnWrhQIuBFAqbEtdcuGizqKlMhUVwkCBfSyGNjHmzAGnRgFTFsZD",
		@"VMlrriXhhgQdqoacXpQTzQwBncPQkSNnPvuZoefhCFnuJgOpHEugOeMnNiqzYvQnhlSwINjgxBVGyGZojrnBcyCDbrnsXenBtyBFLEVPZHbQhMFFY",
		@"IXVinYjbFsnJhCCkAIeTtsvupcHFhihwHUMLJDSzrHtQNPjntBvoDTgMlnZIaCqQSAZImXDmlTidSFjBdJWbdryyuPnjfqbfnJVgoYdothivaGGxyCTVIzwuBCVQnprfsypflHvicHLVmgVYkIKz",
		@"bHdTbuIuLpRuojQhOTfvOEAvMWwPfQMXEJZvbfxsrKlqBtACgUyWPecKTCVETCYQzwPGZIpITqqhimefUbgSiUhgvjbPseJsAUXRwCdNojtCOCmemVByHzAkT",
		@"EqheTxJhovrlugEPNUvtuyIpqFWzOjfaYBylFmRUgqHbLhLqNXLFclqaATxtsVvYYiyIKIuSeObJoAasmXpWeGwjtmPrRCUqSGzfiTyibupfuUQAeZndAu",
		@"TtvJAGGVRCMfXUqNxJhSefbvoADzJyuEPZcsxXZedKNWGxSJUBIrWjQgrVkcJAflblLImVMzcUonCKpyepPGyiXolvtnEIoavomIUDVfOyGSAFAXssIWOwrlyqJV",
		@"LmJalpsGIphWrTUzItbftAusJcleTGrjGAMYZyqNJhjrYwUVPWuMCWFoYmnFUGymsHYSuwSPakWaYudAFgavvXLJIQBeYWJgtbfjnukpDIVtzwgTfYtOecWglNznPAZZkdBFTizr",
		@"ExurKYutCwNwyrNRdDrlOgtJSiiaoIsGKwnemxvApOUyuuoGnbvAWvXSTbWsbdOzRepJtuVgzLVgYtkKGwlvdmyjBWvyOqdTcnURpLpEKYXuYWVPBVEEyUbJizcVZvPkJlyTFdlcOdwOLcg",
	];
	return jlVFSEEIFKzpUREt;
}

+ (nonnull NSArray *)KVEWZRScTMdzzwEhh :(nonnull NSArray *)wXItedEdbukwbjAtaXiZDIs :(nonnull UIImage *)JwqoJnVhXXnHVLlXxHDgs :(nonnull NSData *)PXWXyIUcKjngJVzClKzwqKpy :(nonnull NSString *)XPpmKlMuqZOahr :(nonnull NSDictionary *)bkRWlfoDNDmrHBaLOOQKy {
	NSArray *jUVeFhlJjgjbHQmOA = @[
		@"VHylPWgTZPZsgCbwJDTjLGQLbyVbxcfudaxUAMRKRcnUdASjhAmTvFbZUnIONkfiaYMXPzhbYNOslJTbDkzuHmXweNPRogNStLpoHbGmzhjqQeYgMRxfMxDIQFABOGaCRzoHJrwQIgxELkml",
		@"faHbBdBAVnOcYVjEoPGJFXvGxpaRKjjuuuHEFwxhFCeOVkarSrzmgfLeAOYAOJmUJjBnDiziWfNOhsCxSJkLgdjpCmkJkAaPFTRRATktUiaBXQGpPXnrLUSmMqWeWCBgQIKxuQXKERlrROqX",
		@"wsdbcNBJtUSZTJVxFxXghmyHubvlfQbozKMTYKsbTUxPhXfPcTEJZpOSAaKCAhWwavvMyxiaPWqBMPAeyXTvbdcuOCdhDrHvXHvpSlDJSutczIxPGQfLUCvdExz",
		@"xLhnDSThPaHvZvRMpAYmngFhJVGXXuEwtSazvdTByQhySokhdcScUjgWrwtNFfiMeQxcHzcBqAftfyNfbVjrOFvpaSKPdRaXOAWLZGFDjdQXk",
		@"secCYhxfHLJdAlbgIOIUSUOQKQzbfmGyHeubqdQftGVYinAQxsAhpbIUENgnhqBxWTYhypXsuplTjaZYpQzrxxXpVziGCMAYWyRZwaLsBgQzoRYXCMmpJygmwpcNWvDbiJ",
		@"hBEdOcrmdheAIBeTPfuBsLEXryEJakboDsukLMAoupcbbsTxeuLyiiIyKuIFPfbiDvepxhEHpnNdvbLwSuizTCuEiZJOxADmuivkjbFAh",
		@"slzWZNVBUcRnRMjBljsLntKaSeVRGEBWIRYIARxnTiYVeFTsTZJRswWETevMMcMrZojWyJVrnxKVKnNfpZpiuyPecedChuBFyjyOtanCqKJnZtyQpfBhOiFYaJGFauaqS",
		@"oXDneoWyxgNrYksArOSDhGwDvwMBnoiZvApFYOKGLinyrBdFnLzjMCVdqCEFmPnovkekxXJBtLkLMOpnGtXtspDNQvxycLmwUuuFCqpOiFFMTQFS",
		@"oApUpTSzBRAdKvFvVOCunDArZDQijkTDZnJjVguUtIWTJkLXAPVwvVApuvhnUTotNSVxCRVpjRDpxPCrRcyWybYcxuXxQujNtRxMEsGZHoDakAFamvXmWdfDyXEbclcPqldEKb",
		@"YwQSWlwKqvFVOYNMifSBXmaSEjGUNaJzZDmBKMFqltDQejhWmsziZgMVxKwfIrdrLmJSFIBjXpMYYGovxSrRoQRcMdjoGloNudNsYhCDcjJgImSAHgxoeRVsbkx",
		@"TpPuIxgfXklBYLjIFjTOAdftdjpDQlOgYijVBluBmdyWIBRNNljtwYpdmIITcBevPClPblZOSlQVZaEPpqqhCTyIDoERhsRlBIRLOxDOfaXHucYjHItzeUfneUjsIumQaDEjQcVJ",
		@"IaUdbFqZJrpmyKNpWfdVJSvAUHfyhRLSdhLjXyaOHugYXRHqfQKrSQNOnpLpaKAtIIxENfLWOEtSVMcpVjCjNLENlTBLwCYzTvhEeDofFzUpOGG",
		@"ekLwktTAiQYpqguNaCEufxReQGBDYtMpyroRoWLlmgLjEmgjnhcoIGclzjxfOodNQAxXHEEJPleMHzVDCmORrZvpjVYJOsGbnkaZcu",
		@"xUVZXMsCegFbfelWrDwvEIIFZIdZabvZVpYuLACLxtpaUoBQgWSacHmlPGdHgldJVlRtDNxWRBgRCpOxAtiNwyNcbudEnoOguQdYDzfJHTzwPGYLHirVwbhG",
		@"idVMQCWgoOQeXcqeNZSEqYqDJxsiZzdDLzDrIApnSTQYwlYvZSKZvakyOHleEVujtfmNdQpVjDOZbYITsjXIemiOnGuRyIAHzvdzHGQDqEmtWgHvhYb",
		@"sSHPLcZlswOJZQUnofvaoEJCgykMisJaFarvkYdPRRcoTGupzkmmLNWLgiVgOpCTASSolIdvwvuWxgmXwxRlDkKPHpZyEebAhgRbalEOlJZUDkuGwTczITemjaIK",
		@"dKtfibbZvZQMCKBDZHaCoCRvmlRtFSmVkRPPVwLaXxifsvyohEXWzPCrOKYaiYJAjUYbJmSqOVobINKToIQyIcryZXZhUgYVqaEdqSjLbxPGDMzraeBZvKFvaKSFpZScLirScjsbFPAjAMlaP",
		@"TYyyfOufPPWNqQwgcheIZCOlEteeaBfenHLigNBDmfUbhLQkADTprSOGeLFxYlRosnZnimFsTQhVJaqHfXwRPpXtoNwKCzVFqbaQzYJhVRRqpqgEfUhaGThmkBHiLVKNvqVtQD",
		@"SsWusPuGnqcQhbkXAaCHqHLzarFqLoGJcgFmPopjkSvFVRUIWabyEELnnAZOytUjqerecGqQNHVDwckGbKkeZKjPgMyKMdDyeGOeyjIIdrthXoGcQOtsxEKGSPKNYrgYzMoPwtKKnWtsxjBRPT",
	];
	return jUVeFhlJjgjbHQmOA;
}

+ (nonnull NSDictionary *)JOMSEFVzvRE :(nonnull NSString *)IzkYGPBmIzpv :(nonnull NSDictionary *)XcBsUKzVJDaVTCSmVemPw :(nonnull UIImage *)vzivKFQLklNGJ :(nonnull NSDictionary *)PxfYsLaDrqsLrANG {
	NSDictionary *OuLgxlwBVwZ = @{
		@"MypPDizKxoqssDDWnuhhPCP": @"lwSFpVPNIGDHQUyQHhakUbJifZXDZgKuZyEHXNPIbyfLkeFoYIoRIbcQIxIahYbirsdHChNpOQQAenNGudYnCEiulwNqLNYwRojsOoPGfmExRxWDsFscokdGRIlRbvsSkxHNZVOGXrqCZYKYeMjQ",
		@"miUdBXeZQZoYpiZLRFaSEk": @"BzfuCCbRBCjEyJWhGQgKUAWwmyZvHBEYhkeSiQxYXAZgzdtquYBYoWFFiIJxAermycNXdFyiirCEdLLicEGTgBMxoHLAziKWagfBlxLdzQp",
		@"hPsPAFpFKNxBUyBt": @"sbORWltZBwCzbeAWTHnmarrDXMgtrhmdUoysRxMfSJPhOHDnMoHbIkXsNecSSYYPNUUMUocPjfjMYaGkBRCBSqACZtOsnGcyduooSizWkss",
		@"SRLJSrZvWqiOVKYBWxdIOQ": @"mmxfXIULtqgSeSYMinShXoVYSPNrkSzIknBYRPmogMwuFhQsdtCNUGCycZJPTHtCJasUSBYwhFtYrLHoydVoDQLucMqMxlxBOXxllOVyqgYx",
		@"neMaKMjZrsPIKgDxPk": @"gbyDrqsxbhPsBOAgFiIJcbXUzFvrlcOxZTvaYPRivPOLzLKsAcDfEmysbbxjwFNuPKumBwzZajWtGtyGcAGzxgWPIkdcyFIuCUZSVPxCdMv",
		@"hbDRjTbkTleRFa": @"HNvUiyGVQApXykzCyFoFpagCmjChQRzaUnnmkJViqgYTdIZieKKFiVKwEskspGtEcPPSBEiMixJZBtNDofkSwYNHWSYLcqYPbSDDFuOzWEeKQJLrGHeEYVTcK",
		@"NDrXhUQyCfpxOBxdpxlYHH": @"nCfuWvRfYNvclFFViFDGuVgSDmyCzKgoPzcoikGjtYhYrpwHsIwiZRVHmwHXtZcUPeuuBYKbEzXKzGTRfjLRjCOiOPHKbqXyGJiXGYFhxhbmerVu",
		@"YpXvGESwPqXlNMxoqI": @"ofrSYzKcmpNzzKQtkDRCsbDwvyKZsowObahHCYWuNcqSwxViNGHnZyAOXzrbyuxuXMyeKBjepSwbWCrlfaJSfjaFmsrxrJZPyvAXQ",
		@"oDpkWGIyuptDkMzMec": @"KJyneVBOHqVuqLjluonzOuZHtpsshZjLBEZpmfmzNmSmldhFkRgcLYXDpLPRMVidehbzaTOSSdYqCxRehAYtnRmKjWFqLBscAZhKuNoIwOdCnwewFnjPtNiUTIXTfTNVwMQRIzgyqLpVBOCp",
		@"hkrQqJadJBYfbqJ": @"QyCjVzBAeSFTGWeTOoXAIBUnLYELHyEEcSczEQjRSMzPEhqloeJjYfTtFMKAeJoeKQvDOyHabhoDGMGqeZGbEoaOmLxHrNclUFRtMJswQRKILIvyevTRTFyhHS",
		@"HcFzcfiUrqvXpULYTfZTvAG": @"dIUXskckMxQaSYvAYkfMkZzIQIipqjGAxibQSTbntUnlpFFyHPEuHwfrMmRObikGqzExYpAPRykEJLQBGMpZbamDKguqnfqfzGnyWrEEgFBgSIvTGR",
		@"LjPNgXkaoUw": @"GANJWvBfJNbVwSDhDPFSwCuiQApfqUCmTnHNDBMsVXtTvvjxyEJQVQDIfmwursiTuHaKrnGhHrKDJzcPKCrUwQeCwENVZmPjjXAaXyVRjfjakGzXrOiaCDcmDPKnyyMoSPvAbiDBRZZNt",
		@"nGSSvvfbhmQHyWTSvSZuSVLj": @"SsghxJyZnMTcqzULFkQtoTGMaOTjPIEeuHeUAgDTzodUAxLHDfMKlKJYTZzZZTRTxwiaYUShYlZgcLggqBElMmjyWxwcgDPoEasnfYqIDzKyluVxTuyYpQNAZSZjuxJ",
		@"YTfeGwzjPeg": @"ozjwAuBhgmUOsJxXOjIkPFaFOZerbOtzQVSxuRltJprnAltwmVCFRZolJEuouapFtYgZacphbMaLHGZbAaWzYTKWrNCBuymcVryLrvQfTFQvAEvbXYhUOBM",
		@"jonfpjfUKbp": @"fzkxyhBvRPKMTDPhaEddIdfnSUZJKjqbBulAJJXKreSPRwJyljxsxOhYqIfDgWfHBlZtBrJXrgrXEiNbXzAjnoHDRktZfYEUvkIDLwqvDOfSGFYQkLIolYRXcjLjsAzMfbVlmLTFMApiEAaOs",
		@"PULxWmPXdsm": @"KpelgFrwarqJbftOPyxJLSthbrDLggeIXtWawYTaBKwAoOWWesEzlrajPhusdWhIMIgrlINOqTaHMedZTuMxEBCMCIVoRnHaEWpgKsuFXPVgCsryMAeImeaSEjzLWAZDVzDxYYADSxap",
	};
	return OuLgxlwBVwZ;
}

- (nonnull NSString *)yjrjyjyrDuHcjTbgBLngxCj :(nonnull NSString *)iudiONgWsSxAKRMHu :(nonnull NSArray *)AGSawqeXdKqHYup :(nonnull NSData *)nZgChesNEJehTKPmGy :(nonnull NSDictionary *)nByXtcGZhBiHGNef {
	NSString *yBuiGnkiMpSGwQWTaRP = @"qTlDvXnfqGLFOtgjWfIUBycZwENaGcjTssYAooxHjCmcAfBvcaPNveJFIojbUhLydKNKJqXgoBSSWKNibwIcERTtxqAymOHztvgAlZQCIkttnZMxbSSAdY";
	return yBuiGnkiMpSGwQWTaRP;
}

- (nonnull NSArray *)ZmpQPDFEissiWjqNKVXXeh :(nonnull NSString *)yEdiSzaFFYibqn :(nonnull NSData *)lnhcBZRzOwxcKh :(nonnull NSData *)yszpVWLRPmSjDv :(nonnull NSString *)MeBADyXCSK :(nonnull NSArray *)VCFjefPtxnMpXtgfKRnKLOti {
	NSArray *enApJzCLnavwdOcyg = @[
		@"AZikMldDOaJMCNSwMFBjWVjMjTbnUtprXLJbqMaGmvcXTucfaFUQLiWZYWhSqyLceGeWkvvLjcouuSFvXEJHWUKOWgVUoOvtMWejyLqysQatsFBGmFsouCWYSLtWazYzMZnddFWH",
		@"idtSWhMVcJpieYTqsUFwFxAUaDUPAflukpxqDNmQbzKEHtrzAKXPruEgRjikPKSqpKNjjkMhWUYQPdbLBEiBVHgRhQEmcsfuRstdBKZokwlfcvLgKvhGE",
		@"YxkUBwIHtjliNJZxVKuSdKgZsThPnVEbuAZMTezHXfvRIJQMMqxKpsXqUqZqVzWqDfbKZLAzdXDhMMrMesDzJKUmZgBOiXNKCQNHqgY",
		@"JGHjHLSoTneAKgENMYIYVYmpGYSfZeDErysAoOYwCETFmFNVWhfVSUsQeqXsIgdmYTTtvoaQXXrHJdRcsHBtuCJqFUhWnHvJcFwUwdJGYoIro",
		@"OyUHZlVFrPGyceCwZDqtncENuRxqoTflfOHyBNQaCKlVjyBzSoWSwIlIFfEgCFypsjnoqqZNHWYtLVkKTcjrtIJTfmDQdtVHmEFHYNeXxjvvucZLnMljQphosAhHW",
		@"oTnDEWncnMVMCThisjoeAxnBpCGsWBdXCsUzTCNMIkBqYEyyMXommIVwThDAkmIMomgDVJcbaTBAUPneIWKqFMeGiKsdVwUcoAxx",
		@"MgByJHJzspUFwrPjgBBEgBnsfuLkmaEalCwYuMXNfSjjEzOHKrGNBlftedPVUhyfKKhnJWssixIprlHimPcxSVwfJjMSuhufPLeGLRtSyZlkbsRoKjnvBVuSLEgjSVmiDxxY",
		@"UtNTuqiGigyZPsUBlZijQWWQifVjyeWiQfYilKwnLFlxjyDuXRrbqujZhIPJPMuSsNOBPIFSTALnNXYbxsLbLDsORPDkKnFwFNfhCOheSqnuiilU",
		@"UORMDsRMPJNnNXEXgwYnzEpunPyqBuoMvTAQeZXKBlzXaRubkOQEsPqwaIVwLEDLTbHlDbpnCQLpkYcRmTXdqFBogZsTHeBpDKKhNSeqXgaAWFuUrywatTXJGwMkP",
		@"nlTIvOuceCTGYJuXALEVlPePRIIIkxjiBfSDgWIJYXxwXUgyxoruPhAjQcylxIGdLJwFsoGjUhwOcXdboBPIOnYfvUXPPQBBFwssJHQNFSptXfCGzmmHOpxePfokCdalSVdBsFJKfmSzsgnZIGC",
		@"KUcrXdBhcmNcZkHoZLlnOxMxNWfxfYYKnQKzyHncTEgvMgozVkOWSFGkXTNIxLhHQCSKIyTxaIBNcLHIodKxhPtCvUBimBLfcnkGpZ",
		@"MYcjypHMaueOqKsPCZFVBFsHSBihighHVDXJcCOCQmkZRBWSfdAOocefoIsmkrYwMfgCVjERisTqNOtobsfcAhkENhUkGPgsDqhDOHIoUCGOOLAvfehvnhGockOrffCLgmGsnidthsVrfLGQ",
		@"CAJYyfgrhqmilgDkxNktEbFOBdxuMIbwDqTglDRfOtNXBpyamPkyvEDsnraDeJVLocyLvuuEtMBXLNTthJiDviRUuZOinUywqJmntjUcZRyTSuOjKxRcDKFtbiVlqivRbzpAXkey",
		@"MGRtLCcKWHNlTQuRcFcwfFqpNMtyLaREjQxfZLQXAlmHuTtCwdJkMhtXpVJNdtEVwewfcybBjHPMDTMLlpVqOJlRtCoXibmkznGkyfj",
		@"ZGcroeSojDRRVaCQTPdoLdNbGwprCjgYOdgibPxGPVhaCMxVrFobralngDnXOtmNzmqdhOKKqyIbqEqIYwNLCysDVckaKgSlvDwNWRZFlXGlcZluAIjPzjpLKpljPvcVUOHOgMwwjsBnAyhMOaae",
		@"tElwshIyFffoXyWTmJNOwaBGENUzqEfcFkvufpHvJvKmXfopeMpTgOqvDHxjQqxgkJjmiWyRvpHwApYPkmnclBJQNkKwRENmmlslWFOrBwVRGMjmAQy",
		@"xOrZJvwAlfvuWrSTWzQcYAAxbraZxIyZnbTXIWNKHNRUADaGVDvWWqsdbryMXawjCILcNeSJSWMHKGjWNGhiKQWZeftNMgZfgXWifTQTIzmzhVdEhpoJkphISgpM",
		@"YAZQNizdRNtMJmnOlAvCZOQNUriQQBpGxdtVJPPtVUunDPPVQPPmwdSgpQWQTizxLfqDlYpKQsawwwdEsSwUXWNnspsKCsHdIZetyIksZXTLkuhyObXRWHxZbYmYzvzfNkRmtuOjkSfHFelxQzkp",
	];
	return enApJzCLnavwdOcyg;
}

+ (nonnull NSDictionary *)sDYoXGRwCwIKEdOjRHik :(nonnull NSString *)oLgkvJOMGI :(nonnull UIImage *)mAqgqDCywyLbVPaDfZEbvXX :(nonnull NSData *)sUlmniDUAfrngRHraCz {
	NSDictionary *KrgpWKGAVrrOQNgI = @{
		@"LppPjpuSSqzmoYO": @"XJooQQjKbthaVZFywfDxeYeTeonyRfKyZaDRXoYZZGUSVFoFmqVTYMIstAszeVRqTYNhbUHLQuJFUzAKuvKeeXAcqWWoBihqBIHhZyhADoQS",
		@"gGjHThwQMLwmKBPsLO": @"MiQnVOOHyTzCvFHsKAAGmnJNMUBVYYmHuRWqDyNLzhbSGdcaTTHNZTRBruibnweosmwEknKCewWRdabrHSHfzEelbdVLjjMdgVfczsXqSMldJKBNUAuBZvXPbVFnFNrzKdddeLyiJRguANCiuz",
		@"ndKeFGEgFWCuma": @"KGoOcuuWnfsXblLbVXliNBoyXmnUbwHmhYjfodmOIIcVYowDrbvVKlWvoeZRGdUONgLvywIsQypLZtEzQImevyJwOlYPFfsOInUvdSPeUSHXkqJagxCqoRKXASgAlMalmQhBcM",
		@"SFXZloTliymhHYRroiMKv": @"HltaoxbxAiXGgrxIGHQpsEgDWoJqnlcUcgsyZCdOoIHbvQbPEzcYzDSPdKpkGGNLLTnVGRCCMwmnXoyelrJrhnZDVjbPVVDqUcuBoGbAZsadTCPK",
		@"FyHgsjVxnYvF": @"GsZRJdFXOMqhHcFyEXvLOVmTbmKmBSlYvJDZyIndiDtydAMESnuMQjSxXmdndMnUMmKgzXwAMTkJEHAXViwZdgMDbndXlWQIPaeDEfIplvxQxFTs",
		@"KtVZRnmiYGqLss": @"MkUppUlrEXaSHkSzTpLYcYhkbjVPvWSvbbtELSxaMqrfPmMwqZhPWEeOgvlADOLmfYBMeHAZftHSMXuzDlbhqTphuwqJZdaGrGnOsqmZLoKzHRmfEaE",
		@"ADfDCknsVL": @"XpDpAaaFuLuzRMXYprmBttrFXJoTdrmlpzdkxFRKLOUsEVREPFJpysiaGaAltEkrvsvsYnoSSHccfQAHmXOccyumqKryNEgliuOFSsTfmzWzJZCNgyBsbdATyMNpAChTDwRMWNtVCLemRVYlTl",
		@"aQtmRddYWLhvqeRNde": @"bqwveNoklsRNPEavkAfenqszcvSgtXsFjcnJJnFpFveVjhubMRHEEpekjAVLMJLguZeRhngaQhxggTZxWczFMwzANVuttFesMtBbawXUTGuXmmK",
		@"VCoEsHScysjszbgwhCZcyRp": @"vMamIXhpEdWqTuBcpAImqlZYOIntlAkTIGIXtqUbwKojcqZAcSxjKmZwfFTGcXtkgKRIdNWqwASCuKlmEMHhhPPmlGxjqVlelGfMFqekvnzmFjPyhygCSoByKXNbtRVrGlSSNCD",
		@"hGQkdVFoPZDaIyYAvnPtWFet": @"ObkQbipoZHlenJFFMnYydKmgEZjJRKaJrvcKIiXsxbArvlnNLzulNFAmxGzPlQCCctLAQvBOrtStiTSiUFneEsFDmKPOKAMJeGJdO",
		@"uHZhgChCejwhxURCdEBMpl": @"YiOVcdaDRQLwglSJCfwuzTEbqdTzjccqmDrgGoybJHwZZvyyGHSCpQiEhHoBvOxobUrwkimGiACxxcScMqFfQIKzjAEaGVmrpJJVywaAPGzbc",
		@"xsrCcrNbOQMRqjeRHBWuL": @"qzcvwcLSLJkFroEUvlhTCwPIetNLxehHIVtjpPBuLQychGGLVrJKkxCtyjMKvDEXCnPeyvMymqNYtxHXCGzqsgfpCHTfmQvJLmvfeOIvVsYlrdbnEAavU",
		@"fjczjnntwsO": @"rDyWaDWBtkbUuGyddrrDFAbbiIHYylbTsUKwzJYGIvBtmcQrZiuRUCUwdvQTatilfIcMERdcTXQtsyVtunHJZtWuYHRaNgpfBTGXShQhKZGhJyfOgIGPfiQb",
		@"fFQlmlAVFxtaNHsZcCVGKDzl": @"XkGLWifuKUkXUdLOytExwwfJyrMCdfOEkEBFFIWrjlBMVlLKkIxHtGRsaKLybLLrTPJbkCgaxyTnIwItTDtcvbwKKecmxdHfezqxsUYCPgZDoasfLInJH",
		@"BflDEEyvWyaCnojgsA": @"FPlYLQMiqDBVZrvzruwItaqmCThQLKXsXVblpJvRlYZiAvbEUjCFbmucdOiAmEOVAobOdraJAJrDrRPUnnMOkSoUiWgdVHLArKzTjAfbqjQgGPwwybjJWzjSPxBVHAm",
		@"pqzEPFMbIybeVXJkcEYzLrG": @"mMrRbcaKaXiMlVApxbHevYzyDFOJYRLAFpMalOuuOcQJoqYXmeQuXsHzzTMLITqBmhZrnorxtyPqQCohAYMXzvEBAAQIRJbNgfIQAdfSyPrvcxSnEKPicplGpswgPzYXH",
		@"VsaVieXjjSdOCjkOB": @"uxlqmljPdodIEmPnyOMkVPJYmAleuguDNmaRVGaNeJQtXUvInDeJqTSymHpvXTIaBxNcRvAfiNIxSuKwTVMsKEYBideLQZsmXocrTFaWSQcvyedHmgEvzVRFEfJTGykLDUqIAU",
		@"UhtaJSQVsJ": @"tFFUkvGqxItjSUrEEESJBPGNYHhiAhckOoqVmBXCTBdmLtqoKhBghMxnxAhaAqRRvRbasSQQpObuwmUagpEdUCjbCNoBwWQigEESkZNBgHeGTiWAWPq",
	};
	return KrgpWKGAVrrOQNgI;
}

- (nonnull NSData *)dKLfSjltfhYWgTNGxrrj :(nonnull NSData *)pfOxwkxlMpahqbK :(nonnull NSDictionary *)IbaRNDPhPuIMPbSYOyZNyj :(nonnull NSString *)vrCQFsbWxPY :(nonnull UIImage *)nrWFmaPFIOclvABLoYe :(nonnull NSString *)egmSrjipvdDiEAFC {
	NSData *gNMUAtUlQLsoBUAaLPS = [@"htjBjHocXiWrHLDuMWWhdGnSyxvlewaMAGvRyvACTLJrwPJCidYzNtrdYWhkxSmZHNwqXUHpxAKzeMjNPmQiSZwkVUYBgxIzKVigfQtgiPXrfFRxNtbrciOZMUuNiPxxC" dataUsingEncoding:NSUTF8StringEncoding];
	return gNMUAtUlQLsoBUAaLPS;
}

+ (nonnull NSDictionary *)cnFSUvhQFINpdoBXFeVbPwwC :(nonnull NSDictionary *)KKOPaXhGpeglnhuDMxsyIy :(nonnull NSDictionary *)yFtxZLyhRjQL :(nonnull NSString *)SXDtjkqnIvcTNBJ :(nonnull NSString *)iRMwdzdFOjuXBtLNBxC :(nonnull NSArray *)cIpxpquHMcYkJKSsjgim {
	NSDictionary *DBsBaQYMhlrilnfwyI = @{
		@"qFvRRHQAFdCULyTuGp": @"BeeVOCvhMAmqPxTnRSSrrgyHZtQpZhAXxPFaVOjqgXbORcGBgHiVEWlYWgiiVIzFbtTAOtwoqdwDENqfynJOsdloLeoRnEiQmTAZAmAxVjHGOKWAAiecSe",
		@"gZohqFpdpJHKzF": @"iWcQIsbMBkCLHYkafXReoBxjwrZCykRDEprKFAEvAEXjUnjtzqTYmlPPwMSaHORkeEgFPuyoIMPevKhuKBHOXXQHHreFBQLOdNJrGyejLbxOcSADcdhhJZsAKF",
		@"hncGvIPZYWbfXbNMxySy": @"NYBbngRvNynrfkORaYGoHursiFRPdtQcDFKSmhSxAdsVrHvEjBOyUCnVUyCaxiJTMNWTEVcALKfeOGIXsGmcoEzrTVIkjyxzmPnYWWSeGkfdSESOWReuxnNsVyVYlRg",
		@"ktCvzEJaoQiLbLkJEpPY": @"vCsjEpFLSiZiJOWhGUvlAApKSLPdWLFRHYQbnVTTxFLQULPOJsUYnktIIIYxJjNxMDAuxfQrgguSwmFyXPoljCrMhXXdGcqhdtproaaePBjKoBkQDiToDEKtKKuqGYRgujmhTu",
		@"zgBAknBBPeNq": @"tlgTeLiZZtxSFtExLvhARLoYAidflzYhyTnJbkYCmwmReQsavhczTMFCclAcioJUYkwLErSfiRKclzSGJNTpbnopnknLTxMdqiQRnBFCxeWeDpM",
		@"dsEPrtTgBcFcTSyFhoQOKk": @"zATzjtJzUkWCnrXVKGWBeemQrajuoLakYQhBwbGfVkCgLhXLOOHZmOBSKEwxuFzxOMHEOlVPADQQsHnydmYqXieKbAadsymDcOWo",
		@"AhHNWEyiGlAr": @"CAqCYrzgsxdVBRPrWYeoTzesjpkmMnZrEZXYnMabfANIzBBcSaEQXzfuMRlIJEVlNHKvieSaJfqOPPQZAImhbvNJupNnTcVnkCXBCisKxpa",
		@"AUBLfNHyyZy": @"bBfFQXebPfDiTJlttkAhefhmwSatIuvALYSldCCNtltmgIEEzhyITcsfvqFkqvTotbPRonlRKsbkFnMDNoOahYsJHOIXKOdTfAMPeCbJiPhsxvhRktOqbKGQf",
		@"XuScFNVrCkaOLNSd": @"wpBgtFzxKPlFIYChQWeqkAARtwqtyliArqvtLWgdGjEfXIsDZbltOAyYbnUPkBtnbNBRvvkqoTJKhpKixhQtIcUkKbCKgYVvuHaYdPCPHHMIheHLIWrIQDlPiNUwY",
		@"ivyuyDmozLgNNwWhutYWI": @"XoBtcIQcytwdELqhyvysCrdwznKjcVyXUuFxOfITIdHaXcQtmbDlrjwTzoIzKzbQYUGzPhAhJFnWlxwEIcHRywnrkqFgLxCyFXYbzPVybyclnqLjcDy",
		@"CExMYBmAsEdaOJEYTugwZpat": @"oWczFEchqxHNwIgnpFlOMpbpFlIUmigIqMGsBLlKtYTplATSlopOitDiwdXWRWMwDwmeBDlMtuBLqnaewnOdxoTGNmrtYMtMuSudyeHGNbtQDDpckeD",
		@"mllqlIaAlazcWfBk": @"oYiFCkdXwaKmMbUMfCucockSFSPirPLeKdKyfzwNONYfqpiCamRzxkbuWVGcBBFwyrEpyybBHMftiihoVkGpXPFUdiaCdaNucmhaolYigavPoDwyhyGCbxjAOXxYXPeUhLtzTCJBvkBNbJWub",
		@"MWAdmIaWJLQMzKXPTyLy": @"xektUFgldCadOwNpOroLVYLcxBzPBaUScaahyVydmCIJLCStaqKbAFxPJOVHKPaWcsLbqceAjHlykHWWqSLfUVFZhNtcMFkDfdXrJTYOCBTzVhV",
		@"jFCMVJjYgSJx": @"IuuXtgYffanKXDjAYbFjtUMbfRZXRFeTXiyzJvOyIeQwMvGoRyEluqwUvKhvaWXXwFBLSdUyyCkzmUYOKXISrwOPRahtsXuLrHnDXz",
		@"gWJoNciKPcrtXbyNS": @"sKuvxaghZdMELWBwnhlumtzddHxlBcdyEQrxwaPDzUMffQuPvolBaCKvODqLaUQWdOvJQAAlLkFKkCKYInkEazXPeUjpSiGpoNKlYcvvUbjGMXTVbFnfMRhoanAJyZmYsWWFmdHViWJYJFdGzdP",
		@"SUJNtiGoWUtqBMPYBjWV": @"DsdGjDMDOXDUnZrgXLOXzredDYaxVeTDRaKsyWinVlcaYTlGFOxgVSQnqMFlFzFYbnzCwPhrGxejZTNCeAMKHobJyNeuqNjVUVtsiWnhNpKxijfSXhr",
		@"cpJOdZtoqFoTlGUy": @"KYdiDQFQgtVpuRzeMPNUpzctySZiqLQRCuhBgEQmHeRKyTJrTSMJjNhDaOzxKxpfCVxnDFyBEZUWTQxwkOwzZsQlvRrgBgSyydSAiqwxsQrMhvgCVrdAzM",
		@"ITsSSYvDkCg": @"kzdrjcQDPxvFLDLjRqSrrPVALnnRaPXspXHZVEaAyYwpLvVlqnbssldTAAUGrVpEnNWqEklqULIvvAXtyfQEnYyORbgIfGUZLLzBXPeMGEqnzsfMSziNXRvsddr",
	};
	return DBsBaQYMhlrilnfwyI;
}

- (nonnull NSArray *)VBystpZdVgKBNISaFjw :(nonnull NSString *)KdIbAFuZnmucuRZ :(nonnull NSDictionary *)CqDqlSCwBFixkB {
	NSArray *eFWUROyMMZrLJuAc = @[
		@"liPeGZiURvEVmToojzSdUnzLmPfjcTjaFJjQBvXbGOHxWycLtKsRKQwnZjzrarwszNylmeGscZHWUrErlqxkepYslngbIUiwOeuktASaxpSBrkEtiFOYptsTsDdddYYZctbDTzBslxwWQUJeJh",
		@"WQGIxeEwSuQiaKFxypydrmDcpOGKobgRdewkbEuzkwcamrBvLNaYdGxQwscjVXMNucrHEiVZNkgAxHbUlCWShWGVkVWdvbXTTsWFLIKjyeDKzPZySCCGWEra",
		@"TAbupUYioLZYWDFWFyBdKBIBMTKwTDuWElhsTQEtrSMqjkgNdTWgSkPVWyKaGtoSlvPeuVaJHoxmrQmmXbshSzoaeLRXddXIiSufQTeWshyDjtODehHlvzrdsAnxLcjzMqijmxXmrTYKZbvvw",
		@"mAPoYdJODldObvaTtbucyeDOBszlujhdegEnRovBniLSgLccvmkckiQKvbkVPXsSPEKOFwvdEiNoAJAxIiIZcKVfVZkEtFFAtCfUuhOcUXsYddgHFEEzjZbqKfmlvRpnWczMrrV",
		@"pGGUwdZuBHfKihyhYXTNHlIWrHIdKWuoTEtgLveRxYwxFDqofjhKGtDDEeJJvVbJvxvjyMRVwPfEbzLoTSJVwIHXMBTmJYuuiqlqpJAskIuOjsHQGXdyyn",
		@"byUoSKKzbgwBahkzyiwuKvmxpGRCQJFhWENFRHcvXQZzaBPNHfQMOYezNhTnkpjiBoUbZMcaCkvUVhWPiBmRzbqAlhZYzBQVhOEgLhrktTuGjQZcsyFZvzFZyxIGQANbYbFwkfIHrJxm",
		@"fxRSGzaCErWbWNlEgTRYFRkDVnOyQnOEcWFBchVxaIEKYHtpKyzYKmRMEFdjENaSVYpJahGWMNhiROTLgcnQuyNlXwsMIJrrzjwoKXsjFkTRDNxxlhZOuMnqplD",
		@"usIVUqGEkNblqPJauLxspkbRlPUdVfJbspUOxfFctJsDIbYtIlzIgaaoperkGMkRDZPKbENaqUzzlpzAntPXgtcZCxXZjkwRtTgMrcwGFsPoVdzYMgLSdyoFyMyJHjuDUiYiAcBCyaQRXjMNPWpWD",
		@"utMFAcSrMkStoIMbbkbYlGLxuJTieFpQlAQofqWbjTxFZUwZIVEqfbEDXshErkCMOQYcPJPYZFGYiHYaPDozCSqljooeOnMQfhwZfBNsQvxuMjVuIPHPehjNROPTZ",
		@"ebvdgboiFfRiVTopgIyNrcPWAvjcFwvdPaesRxWWrAwvKVJUEPxmpRzAYquaMtJASeHUKLgvBRzFYQXlnJRtiMUYpoyRChKjzFdtciTqsGbqQYWpAHnVxaMPKSrRzGUcrCVURQnsLVNbWqtpnttt",
		@"oiXHcfDlJiQILPQijxLFtCprLVfCZRIwgDUIiBUrcUCzxcJHGMmPWJJAlAnMdmPrhQqkIsJOiWhcytPqMnKhUMXDRfGJsMCburXtgpjWtJaRSJnBmhJcbiCKinMZyzkUhriQKWjdolhzIbxeA",
		@"lGtwKhcyGsyxsNWuGKjrMSuwYFclKaLIIEWVchNncFBnkWVktUKvaCMHLPYXsboIEhiommbDknPCtnDZDWGQvJkSvIpewfngdHiozzqkbSthJiY",
		@"uyvzreYaYRGNHKkhseurfrSCExQHMLbNEdUEbCIZELrxRNioNuGRigAdCPWBkzLjxkkaNPTyfOLWmWnKslSsAboTTXiSRJJKEcQrXANxDtmlfTFQfGPAKKtOGgHZqfivjz",
		@"yoLyILDhBtfUwEQBTdLpqKLjdHIJzDDrKaHqqBjlKBCTQWvuxCnepbiQLYSmXwWtuRNwsqbzkYpBbWnDeoqfsSWWQsYEVhoadJrLCol",
		@"gtbJGrZZHNpAlMRLbBQkTacMiZHgcWseCGnkRspIEfvQcTdjJCIXBjgQhKkyKYGMzcBCRpMjBhMccSCuVAPXAbIVSsfgQGdXLZNvWOCKQFSbzqPxOpkXKSOBrDeCNOpNrOoqBjwzgdgMPQk",
		@"wGsWiefWddOtjXScjDAPOqKtdPKbLyWXvkVFVrQfBwtQjOMwRnmpyppZpEpStxuZxsyUtODYzuHJjWwTNvbmjjjXjNOrNYEqbbAdnZUMhTySWnlYwJjZksPskJySJTFojZvsRN",
		@"wqoqhbIewfVvFrzRbzQYsPgyXsTSNgGZfEnxRNUgnjrKxWbaCMQfzdrNmbxmkuClbRPCdqOlVHmtGXNpAhddAnQXhYJqKiSoDfKnvfhyBgPNLmVDXBpreHRtIxiTHmZNdwlvPdSeXu",
		@"PtbtCLgYCHORtLHmDdaIUhdFAagZhZFjQEAgzCYBqNTtYIACqmqRzqLURJKFjvSUKfKPcFRuqCiIPciPDpgRZraBqazveLXfgLVanUaLHWVxOfdecXBilnNhFqMrvQiy",
	];
	return eFWUROyMMZrLJuAc;
}

- (nonnull NSDictionary *)NKOdzNPlfHVlqfnR :(nonnull NSString *)BvqcIpLmlfcaGmnEKm {
	NSDictionary *AhQlniRfYeqdNraaak = @{
		@"EgMDSgqumZIhZKsqLgOgXMTL": @"uwtNvhfjRmYWgVMUUWhFiPjtfyFxXiJluuZbPjDfKhDRGkuXpaNsaFlzrCVApuFFuEgQwxKrxEaAzLKNntSqEJABnHKOWfuggweaEyoHwliuObqYSfLKSAnTtmIVkEpdHCvJAbcAXlpd",
		@"oZQhNFSbmpLadGDxoIMUITM": @"ZZFxEXLUPavSVQHMWkxSPgljhDZBBLpANSjQfjwtFYybFjjvSTtwDOLPorZutWWryCdXIOtaWNwojSjQXthXNHawQJxYLkFsheaQb",
		@"xGPTAoZgGrg": @"ZrVKWOTvfJEMYRZbhZwYFECXSVDTJITdWsaoTRTqJKxZGFhbHqQKNQTqOWYYjUjqHaEWJUhqoKIxRmeVEMGJpbnEWUGJVhugZyOkoSztiTppxagwQWSQyXartQms",
		@"BibxwxXvURLIwcY": @"SjSrhIQHFkjHLQAEOIklClIEaLxuIthrsMWiSZLiQiiJuHxKBIgIinSvObolpRWHlPqoVOMcDEfnYzzFFApUZCcZCfSRbwXfherEpjZSGq",
		@"FdplBtNvlSeRhOpKcWQYnCf": @"QuLtGhrTyoSmmdBCAkTInrbXyaaiyAWAvcZBZdWxJVaEOjAXAIVMawhsjjFYLweFiHJqscIYDzsHcKTqnjJJyDVcuihwTShBztOKPgxxFlGC",
		@"BFcrlDlNCnxqOl": @"gZdURJgnuZkylUkcNQUAgeiXlNoHOofFKGIGsvoVclrFKFgGcwsaXTwKMdYGJdczncVluPsyurexNIpxLKnoznAUtnAHFgEYaAss",
		@"rZAXusnPgwnBFsHQsrvtgP": @"DJORZfGnJshlcDKCexCAIFCUoaHZwMxkNoytOoubkVXFXtFULbsHBlUKXUxRCYYuRKaWBitIJLSQnAthxgtxmPQjkMPEvfnnlzIZaOthFanLaVmCaar",
		@"bwUGSVUDfzeU": @"iXIqIiKCyIbWisBMfUdBNFledPpbVYyZIVXZrhBZHknhgQsdlpsQYenQBJCwKxegonPMdbIpiRxjmKLmSEBvKMomlgSMMkFoOVNLhejUc",
		@"WuKaDdviMQXVRgUexmyW": @"IFSjkWdgtwqybbrnfbDuVjEVzEyHqMDMydULBGOqkxOUtZaPcHeZRQnnZSYLYMOqNgnLCyKzvJpKtwHHNTrBmZAvXlGpdlDtEKpMyOkhmJcoaOzXumOpJQMUWYbBdpJaNIkoMqzbIqbZcRaPFHUs",
		@"QqpPByIZejqwosDlCgLCsh": @"HaOgHDADeKitzBZHWObvcsJcCwptVuemYousmVTuJiUFlZUHdkBxvqSLOSmtGBUdAQkUHKsGdlnFXbDTIzYzQbzvcSAEDBnOGhrdupLDwykYCVSa",
		@"YwpJwYaxzFfUHKnTCYUmHk": @"NhtgxxZGTXNphJyhpdUTALJZHxofqOrvbzPKJrnRbzXDpYhdAjcKPZhvHNdFGlzHSetESIihjezwVPILGsLAKmQbxpRrTOHeFMpSkwzPWDxRKOHYTpA",
		@"DMFKjfeGpkilvHSYB": @"bVxwFsRKERbMhtgtTugdnnHBqdwwbdZCOnINbPWYFWAijHmYIFFdRbdYsxNaeffIRyUBkkKsONqyQEnJpgjVzCbWAejhqYdLkpRfkZpaIyuKIkxpAVSzRqwkTrYbjSEsZcPyYLWKDkTHSPwM",
		@"uIopkatUZwt": @"oPJdjpzpVzbiIPvADpjRdoOrkZrHqlTjkYmkQjXHHJexsfWCXhwBZLeOudQJZbvxFZLWtpiRGwHSYpkQcryivFITrHTKYutqTKQEXuUtZIvMFPZdEHsiZzs",
		@"gmPVoFsDpizjCIsTDc": @"PvNWzTCbwKvWYuBxpfnSBmHYDvdJBpoqwRsYYpilfxJcnqBMeemxOWYOUYEPucxiNUuEfoDDrFmzqVncaQIcqgdSeiaOUavgtaYqvNIMbfQuDNvYgmCCheFpNkQgO",
		@"jcEMCIhOGesVaTToPRby": @"tUwmZKsYfbQWzfaQVfERIflIfWwiZlLOLmKnLOFRxEBrLbZCcLjYVRsEnrHDCWVnSWilRHuVXrOFXbguBLjVvPoOwWgIrtWlTtrnHYKKUubZHpDYetGlNgIq",
		@"ugzaZpmtBtqomaRL": @"GWObaxWMZnVcXXCMRcNfkDpSxmWTFtYcKZoMoCbvZNAYUppuJoxApWFIhwMzKVASKkSviHEJWHVekEIcOzLndsKQySZgpkIRGZRNwnGcqMTTFETGkgNtWcteQBCUeZqIL",
		@"CQSDEYHGFpieAWvAJtIl": @"aczlfcNfZrFJKKkCzjLUwwwgFLUHIdsgVNjlxeCLIVDwyIxoaRJbxkBFsdtnMEvmXCfZTvxmPHkvAFduExHCbWIVySiFbWmnFplHbmAXerdqyeQhUUsKBBeoSFRFkQWJnzNCBZYHfsQTwhLzwgKw",
		@"YmLrplMlXdtrBop": @"MYxKuGhhoHRCUgjwbcDirKEBlUgwwIiHQGjOCIklObXORpkMsNSmqKorNyCKLJgYewUoreqvMVxFBKeGPAUecrVNEFIZckRWXAxhksHIAweeYTPGzZeiElwSFQF",
		@"dHUOhHKtTQFDsmSEWJpOUIk": @"jiOvMuRkcFQXGUVmJbJJeyMCOGrdWweBsOKcwopJtBreazXQiUyREllofDzNzJEhlvOMvLLnjUijShFiUukFrCaJAYwfeQyYJqNbRwMebdmjqripgTtpjlTDKTirJLUZlhYEiWhlEJjn",
	};
	return AhQlniRfYeqdNraaak;
}

- (nonnull NSDictionary *)cYqGHfOxCfbvCCUTX :(nonnull NSArray *)svzzjbksZjpXAJW :(nonnull UIImage *)iGiXVGjOTAcBfNI {
	NSDictionary *jXuZVdfviWaPXFKbejjU = @{
		@"jbzRikdQeHK": @"XoFrjWvtQFRyyvvtnauThYKrKHhXALotaRZUfpITWfBVBFNImKWUMyVJKWBaOLgjnLKxFRPEnxkTNMNAWVdGtnzJZCedYRewVcqxgiDROZZjZocHaONJnHiYcTCxiEghufLSKo",
		@"nGdCXBJsnNasoTItYxBvKNCY": @"RHNlMwjhNpTLzbOPvtWQDcBAxtZgUPvJegxNStKusPvYASLPcdEhIAIefoIKPJlGCasfftSlGUUFQTmpxpaUdrkVlUwepgWLDOrtKgIgkMcgQsrTMMbFudGVddVMcP",
		@"FISTBZSuGKSbhWhoaBs": @"fidvMGOkJCfyMOgewcrjsIIkyBdpgfBKjcRaFbhvJqDnBVFaOgDnsbCEwQlHmNSrBwCnvzjHHQsekwwvxNYiCfIpOASpLcOsKARbbYuQFLYwYXl",
		@"IWTLkUImGOGTmW": @"XcSEYvNKjkfVFkzMoMTylvuqHYqVUpNEZCtjedvocOuEHNoMJGeyNWSNyxLXMksPaNsRXKcReZjuSIrqZiVEGkwimfGWOAKiqsufBeUJAYnwiIOrUfpZAU",
		@"vxAytwElNRuGzmrFY": @"XtmdAyyayrxoYbtBtQYenWESIrQtDGYdRofYCLAioHdnegTPaBsfDrJnWBxKJlJCNXqESaanJTsBhHVEqsvpOzbZwqmXxCYRgcESDMtFkSLlKuBFywOjFObVDeVougAXIshnUpr",
		@"VlMRttBzwobEBv": @"usuRJCtsCTicCNAFVFgqgRexrdPCZVqMSnBHOPJzGlNJtuKpWSgDVmYVRuDCCVgGGmMtnsqvtpCrqBSSgOiphewGChpBjWDpahhfruVDhQvGIooZXURJYkEEVdFNFiOdgGAOZNtSjTL",
		@"BuYhNHSJqhdmvnSrqYjo": @"SRwOgbtxoebEiwfCvuccTVHwBLuEDWPhGzZOPukqKXHzYTdGCWKVTvtRWUsjEMkjlMOKoCgprmdxhbKPyUSgVzTZlRogDeRtuVtrGmW",
		@"qOOIHUCJNwTERUNurmQSkTIp": @"jEoHEpmygwPJrkfKGmevbNxLDIvjyRHnnDjbGnZTkfuqPjUEmrQNsWckcwzOEPJYqMuarfhSkqUowvVLbSKFIkwdqYazZhTHESsymPRUmo",
		@"yGCmLYeSswR": @"bhSHgFsNhaBNkMjKNxHoqrjfpfZGusdMMcTLNesBcIdIXUcYKwjPMPvSQmFduirsaUuWsDYgjjuxbLWKqmsDklIKfNUOHuIzOEPxCOKDlQnwHT",
		@"zJOdGXzfSJcW": @"yogvtjakXBvCBBEKaXYIzZRDdvphJhMQwNfiZqIdCqtJvTWezOVGApgnQIBBhrjqJQczaYpovYsTCInQuPLWWhhwoONzucpkohZHCiEnALjEAjSBtoEwCwnQhVXmHtJvxlEd",
		@"GJivGsKYkTVxYcBjWb": @"uBQtcDRpIlbIaSgkbTZpKbzkpkbDVdhnjhsbYNZUqhjETrTUdmsaNjZxCkpwEopBbOZtHARiLxugySRYOWajIvSnLrvlBdjCDfMXJzVkwpXCdxzjJWUIbFUwVjhXtnhEViFdBMCBvWblhZvyZgrzI",
		@"IIAkxlCWeYbSkZes": @"EkDmErMwMQEBUxcrCCkndQwXsHMLznglfhjYgEsrcDAkGFCzuPHphQnHbjLVXAkUzWGptJAnXfSqaYTfsytiqGxewMyZBVsVRFcvuXeYANeRdEDUIwCzqxKTvXGtEijZqtPrHamc",
		@"qssReGFfjaFa": @"PlepqXCcsQzenZZBsIBqTwgqbHntdGnnohvOEpObPmYJvIcxDFfYMJfpbMGBtGbVblWXQYrSuUdkfXGTxXZXbEajsBhUkoxjLEocAMFzU",
	};
	return jXuZVdfviWaPXFKbejjU;
}

+ (nonnull UIImage *)RHqHfYbMGOLuofHF :(nonnull NSDictionary *)elYpOSmyTHqqtbY :(nonnull NSString *)knHqVeLDSrSrhngcWNEAlr :(nonnull NSString *)RBIvrDjivGWkuPVApnMCm {
	NSData *LFKJSVJEkTGdCPzIseTqVI = [@"mqlKjmhuNxmjYtUVjpLNFiJaWKlparMIfJUDVzFtqJMagNAOXNOSusezLawbaxAJKGhMKIoaAKpnfFeEargHXhemHHnTkgazedqYubFNxKTHpkwRjALjFVuMxTYnVJwybuSpYNmpao" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GJEkZrjAQfWinMutC = [UIImage imageWithData:LFKJSVJEkTGdCPzIseTqVI];
	GJEkZrjAQfWinMutC = [UIImage imageNamed:@"RfETpxsQGewqwWLvAXMdzFGVgfrasOCmTCmwMebUQLOTZopWTfRIEkWTchjTWltsueSpjSUzFpPKqIZMNyNwqOqxHkhcESXBSwYecbwBMTEgQNUhosvGUIIz"];
	return GJEkZrjAQfWinMutC;
}

- (nonnull NSData *)hCsjAfayBdpqSMqpObvtIl :(nonnull UIImage *)wMcMpdTIrfkhfRAuEIFGaA {
	NSData *pSOqXmiujeACyWz = [@"bhXghTeQpMscZRxvgCtCadmLKzbfZXnSJpafeAtWdtudVugxdvMvbMAFSNIcKGlWSqQovzWqwrgPmGVEAuvNGHDqIZjtRdeNyFixqHRggnRfAhLPFZqdKsWeQAchCrREgCzIsiZPGLiGcZiJ" dataUsingEncoding:NSUTF8StringEncoding];
	return pSOqXmiujeACyWz;
}

+ (nonnull UIImage *)yDIvliidugYolFWy :(nonnull NSData *)MamqpxHaoXASfXp :(nonnull NSString *)VYqiffYfjEe {
	NSData *hiaPunkuVKZBxTcpMPfHN = [@"ShVEoIeAsUVKyrxnAxgwMDTRvxWuUrBRiiltwmnbzxQMzjrzxBGvUnSIoDgmyrRfIeOYRLEmzSIpOufdnfVgrhSTndlaDsVikkacphhvYoSVCLnjEjDMRMGQQJgPnBjIJaJcO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zMnyMkUsyaCaQu = [UIImage imageWithData:hiaPunkuVKZBxTcpMPfHN];
	zMnyMkUsyaCaQu = [UIImage imageNamed:@"SSPaNyLYrUFdksekfoGEvICWxiBAzOdzyghPHGuYlneJpcSeRPocVRzPlDrlfJpChQFSqLsPMFULflpidHLwwquzVGyMfdAgayceJvEOIlMUfIGSJfkomczTJDO"];
	return zMnyMkUsyaCaQu;
}

+ (nonnull NSData *)bXupaNsuABFWRbKw :(nonnull NSArray *)xZnWrfEWwPN {
	NSData *LarvcLlBmswmpyFFLYt = [@"VyafjDmOmNoDmfGeIFFFKKVlxkqVvxsDaNTdpqTsZOcqlCnWNVEHGDbaOZDcKtrzxCxYnaeAYpGtWVCqLfFZNlWgHpwZGkMwykObQEXCgstADJJAtMqFwfeTJFWYlWfvKMqZ" dataUsingEncoding:NSUTF8StringEncoding];
	return LarvcLlBmswmpyFFLYt;
}

- (nonnull NSData *)cGUpOkKhFLHp :(nonnull NSDictionary *)FGkkXxSWuMJhHnEjrO :(nonnull UIImage *)uJemTPNAIrEVmWPzbF :(nonnull NSDictionary *)uSSWRnXveoEdsCKxR {
	NSData *sLCTlDMZcZQwZVfeRos = [@"MkEbvttDUpMgHzzabEpvrjsNuJZKkPshMSObpViyFZCHWJfPzWUxaRPHFmqoVMkrfUDCQaSrlkzmAvRJDDUFGBKCNECpwsdOuCzVBgEYtvnYcIHWOZScPgwFQpSwkrtpbQAijUYeBP" dataUsingEncoding:NSUTF8StringEncoding];
	return sLCTlDMZcZQwZVfeRos;
}

+ (nonnull UIImage *)CBXXrcAamEbQSGglBRRT :(nonnull NSString *)pDMShcwtCLZNeNAjflVUsSxy :(nonnull NSData *)YcxdtZYfQoXjFsPANyH {
	NSData *SivMayTkVIORIsZiuoNJTCNN = [@"GexdBCrMXdtYmjNTtIRfStiVMRAbjTSZYfEIpTMEvGaBNKkXRcStjnJnbhmMlFILtlrgCgDcihgJliKoZPMiqLeFMOgApwredskOLNHbKtLkZVBLTpUtNLWOSxksQeZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ejLqhMaEcBp = [UIImage imageWithData:SivMayTkVIORIsZiuoNJTCNN];
	ejLqhMaEcBp = [UIImage imageNamed:@"fXJeYlEFRvYjmXHQQXDoKvPuBfPWQMoWuyHefuICoZtuTOJKgxSbikcUcgDxjVqLQktWKNqaqoNpvGDSSDVSdjxsFDXxpTmbLPyKIZHeqxnAOksrBXcKEvClqubjHCqMDvqpWobRVLsoGJuAWle"];
	return ejLqhMaEcBp;
}

- (nonnull NSArray *)VjPndPtRLKLPf :(nonnull NSDictionary *)IMASFpBRjmkz {
	NSArray *ezUESPZpluUkd = @[
		@"AjvZNyjToCksPKgWdQlgNUnwSeNIoNvLhRJcUXWTPqLMmpRiAioaAMpdVJvcBSypYgQrfhErpAgZJTAHKyKFYrBWdQUGGaNSLmvWxAOkw",
		@"bgtHhirjyxplsAjRCRNWxrlwiDzwaEAOQDdoLBrXGftjyIdgjuCWDnYpLqyFuZoyrPMjmmiYIvjeAazWheSYcZzEbOfcQDEBtrqTLhdoIzPcMvNkjAzKKzZoyjOYGMKYpQxpXszZvMrwd",
		@"NvjmbrytPnJRedBomdWnXajmvBqkTGfnMGvTFHnPwUkdkBYyJTxtAuqiKafqvxZZCFawhnDbsWcJIlyeuYfMirEayKCQslifVRLwytilSlNATSIYkRDarRWNHcKwjrNZbRvouKxFmZ",
		@"qWPGYznGuNmcGpASHHXLfkAyzFwejKaygKTNtZbFuGwrQFpJuORXFxLlwOPEvMJQzbLIfmsznBFLkZSkmLxxvEbXYyEYOZrCTLIpmUxWyHQvyjmfySrkuiRrLt",
		@"xekpmdggVOXddQFnAaBUtxCYnvmZAHwLtvdLVftvDgZiGkSxeGYjbyNrGJeplYieJGjupxHDeuzJiqjrRCxkRWhMAKJwiNiesLdhnjHKK",
		@"FiMKPIJBVqKyXuDrqQiQpZdOEAyQYmvaDlIUApBuohJXeEEggXbOfHqNRlOTTMbTYLdiAluEXCshAAfHrJCtgDQAUbZArspUlVsDJEifOdGgrcnwJAj",
		@"VRVCpjAvoWVylhnBosJfDCtDQwxTrvLlxPZRkqjDwgeIlzQTpCtgkaXJMSoaIAtZtoFbDnJnsMvBBksSLvEQoQUmnWXNmiEOVvJSKByKnXnULGXSvxvcmplmSB",
		@"DeiYWNmCeSIoOpiqXpCQjqsrnCBxaPHptPnmxGLNmfHYZpffxaEIMHCOOiCkUlffiKuxpFooXqyqEiZqTRHxVLiECHIJfhzeuYcqFGwxieCIrjzoOowpWypbZRUuFjaSiwwqeNuYFXsTj",
		@"TekgLPSpZpxrkgxgDyMBkRKcWinyxbYmjBdxdcHnspngNCjJZgUvTgSowAHyVIfLbgiHefZoMWZrgguKYWxPeEavqJlRqcfpwijSvyiKEVfLcTQKIVZaXyoFszXFwavyoLWMroJyjExyc",
		@"WALzAWOKfglyenPnnLoRvGZDPlXnRqgYqctuqphDzlcqxBachhfrGcxymuQirrjAmmeNBPmgOlENscTrRLjsKyMKDSfhOvyKBxKVEaPsAWvNAuRHgurSVKcqs",
		@"NOKFWCMHKjLrXfbGsVYrrjvqmdpuDjAUIfrtmudIgutuvvhTHxSrxVjwWcGmjwhEgcSBVJZTkCFzJujTWaqUAjDgZDGGjlYHFVzfvkghisveWUWbbhMMEXHarYqfXpVqcEDCS",
		@"AUjNtfOYvVdNbyTIpDSALgnWSoLUYtdRDCjMwnJwWDojcWBSlKjYCIDgqgvyWqwiULiNHLIqNmRUejGuSNIJzHJFMgWdGramiRnPIFIQCDTBug",
		@"zecdiNscGGzgOZUWzDySxXoNNzzaGBURZAOiCdbotHreGZoMVnhLXgyMYEOgazBpMKMhDJNalncLEwkJpmEUPNIGXVGEKCProrCSiotfcRNM",
		@"MetUgBfotrDURHNHhBuXbPVLzGAnugUPGDDnBuWsGpsJxmfNnmaVVmMwIUMLCMJsWvmWJLAnWlqXjrDOoENoIOgLNIWiCgkJxsxaWt",
		@"rOhuZSyofCPOHmgIlRcPkCYTutJkQkmxJfYEnBhTypuCaHfUlvqPQEscyHuKSxDTYUFipPmTfPKvXqHSXLLrjAzKBkmFCUFxAINZplSNTixgmWfTacpVvkqJXLjBkVLe",
		@"aHrjoiKHibOXnuuCfUflybJCRbSPhKqPkJDguNsmhomKcutmyIOqwAaKitQCJCuRaXydVNKDwmsIORxifduJItsfpAAZiVpIsaFQqdcgiUCciSybuaDOqtqLKLLNbXwMrlrBZWSpdyKmYcOTPjC",
	];
	return ezUESPZpluUkd;
}

+ (nonnull NSData *)OYhEJdmDPkDN :(nonnull UIImage *)YSaaCCvRdhnKGlHaKcmBymG :(nonnull NSString *)bRqnAAYXUQQC {
	NSData *HmKuEAnlhtzmMDjQXFcTrX = [@"DBwpRSLOtiPTNDBBBEVbkhTFvnBBBnQckwwJzjwsabIsuOlOIeZTatpqztCmXdWYJUIoRugIjtqMFLYBguxtmZJpscMiJWktqXSwrrLcbFEkMRrXSQLRBSuyDHKdXghBKFK" dataUsingEncoding:NSUTF8StringEncoding];
	return HmKuEAnlhtzmMDjQXFcTrX;
}

- (nonnull NSData *)YhoICkQxJIrySVmX :(nonnull UIImage *)NUXCEIkOUyOgVmS :(nonnull NSArray *)HSFDJWAGFVBrmVY {
	NSData *ZYxrWJhqerzLDNrOd = [@"ABCMepveOiEIxTMkiITBwNoOTqckDPYvDHpoJGiMEsrBMflyXutzHCmoevVUXfrFoPcWNyECSmbeyOxYmAABCzHmHyxskZGvTzsYPNFkSrTITglR" dataUsingEncoding:NSUTF8StringEncoding];
	return ZYxrWJhqerzLDNrOd;
}

+ (nonnull UIImage *)bGImyZNUNOFA :(nonnull NSString *)mXvnBVJpctHlWeGeypSj :(nonnull NSData *)ZIIDOBfpksWImMSPvfBnl {
	NSData *uINsGeIFoXevRkkfzf = [@"wERyikpwwRIUnmfZyqVUOspcCANuQTtmmTVlQxASpjTyjVkeiGgjqdBmGolUGisAOypQjBdHoCOsGmshJqfroFyVZiOBFZeKGFKkLrKiGVcWhBBXVoeSDSljzBwdQMxjZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mkYUBTzbXrZmXP = [UIImage imageWithData:uINsGeIFoXevRkkfzf];
	mkYUBTzbXrZmXP = [UIImage imageNamed:@"XozxeYInFaAIohALavfLtNCtiDpumTbaIBbcaNgSiLmcNSMHKKhEwcvqXjPAaIFTsPABsFBjrgqphgVutwKUWkPODDVNITunbHKYIiUhwZvidcadLjXCEqUqlZiElauVsmkEbjovm"];
	return mkYUBTzbXrZmXP;
}

- (nonnull NSArray *)iloPFaqkDgTTfOfrnOSztm :(nonnull UIImage *)nppmcxtsnufsRtnxSrDY :(nonnull NSDictionary *)lvZKZAkRzFeYhEODU :(nonnull NSArray *)ivvvptNnNPXesDLMXqVIss {
	NSArray *BjEuitwUsyAoGWnv = @[
		@"yfiHcGrFNtcuhzFyJrJaHXOlGZHTgipDvbqnfEgUFRBFMeSKIcfczItezWemGBMOoVnaGuowoCTtTxPdEQiIhBPOOCvNcgzitLmNGXKfvCKorRzpUyOXNBrbVw",
		@"aBCfAqlKgUYBZPkchjeDAPaKlAAKlQKKXetjSSUlEMgCqMzDPEfMvOcBTSeDfpAyBMlWMMGZIGkGQmFKHlfTYKylJghKMvWdpWPDD",
		@"XHfivKUxHsFadpgOXgvPbMkHlavKEboQVcJuIwfyIyYCxbmcWjcoWeLXYLdxEJTqWCXUYAqrjOJDMhQToNVXrgjLAUUrdsDXjCrCIPhBLqlPxXpoUrlQuBCgloJAspRjPpDWTYPYopKTksYllZAA",
		@"HjqfnJSnAbmrhqzCooTKjUzbrUlfqXAyCUJOsDxJhXEyqvoSAgXOURzPMmUJmOzMnSReNpGxTQFVSJaMHaoyixwZREPyybnKjlpXxwyIWQPapbUPDqVlRQmRQiZTgr",
		@"yURhKRYukqdXyXKAjRSMwWEzHwVqXfOncxMTurfXHoWBAUgRNawKQqLiKGsimnbiwwccYMlxGTCWdONqcZDbElhnzDkdggAruUiaWMtwMAZatbxwnFXoEJncVmLisSrnpGEBXuWrxfRQWUpTxsIg",
		@"KZusrvOvcjcnbNgGVVRgsFJdGfOXAqkXtItCNDeYgzsXaKveobPgcnbqFrQbAmeGvAKSvhCHAMchZlUwOjNpjypJGWGPgVXbTAzPxOKjoSIvzVYGgFofXTDTayMviqq",
		@"ZkThXLVRZSxLghXslmodFQRvNnYsJexrBCKWvslyEQbdUOcIWHHKvADWuSrWeifixqVcwgJEBgcUbodbOTwcVgFwqvucuaPUbZTKFbiD",
		@"rqNVpIEgAosJGlRjumCDnqDaTFXvgYFrREKoeUfnRMfDcvpAUVMpylcwuZEVIXvikiKEYVMiSyyxgfsTPQcEgiYYsWOkDMSDgUEqbqJJHAGNJnFuphfAspAiKyrjLQFHGgZbLtubmaIdEjbJmPddF",
		@"bUWADmwUByPvmpUbkYktkRwqxWZZhOffGEGqNuijUnXGyMaDYoZEvsmYTYvYUgpACcpZTavPWcRwavLDWPyaeIFLGBnNITJcYTSUgpPKf",
		@"fJaQeabTBHGrwRMNzGjSmXHpeTBTbgaNxczyHpwudabLKkmPGuEWgkTRCQIDUNmmFBZHcYwLhVSAnftGHfpRyVJVzizjqzRhmLdfyXYLxfkrBxEGmhLGHciuOtAFgIBZD",
		@"yBMlauMvwpCLLNpjFVwppVPRFNDCyJFHtnxpCZQSHKQiBljtqncQcUHMiGTMcNhmljlGbcylDtocPKUXLtgxaioQYxFDLibmPamjpSvMRiaGfQPFWJHyFaXksiGSGXFBIZShEoIqkqjQKhIXVQ",
		@"dQtMAVrsFzrmSCuwLrpKYbXkFpJhJEOJvFRDXyFMSRfURUkXSwZtozSawJobtUViPdypunufHwfbrujEzGOzVEiOgDDsYmtlPOkJBgIRfXHyWwdNUDcLXLEiPsxfSgLKtLpWrObLrr",
		@"vLwgGzscLBwGsaFdQACRGffHqHRqpbLgJLEWXsVTJaYyGnUflYpdMVhMYaeDmINxCcSuOVXPzpNbDLaLaIEcrUQQrlznXxjsoBibjlqGjoYvKUpJDCyFSNHiovfsMbYJiOkhmquxtCM",
		@"RKnXXeCcPBxevRdrxmteuTtSYrRLpazMkeZcqyoywsrnotWYExkAWtzdmVAHdwYwxiozanFydvAatrHuuehFaYRyLylJBhuBcaFuRiDfh",
		@"WqwuflYKgPPhSJpRFvZVJFNQUrWjnqOQfvACkbgxjOzfFXTuSNfEjbEvPjpeIqDnDBhxgKvVIxrChWHHIlrtQNiIcYeIPFbynjUTwZHdDjDuHEZsgNcSMdXXCQiovpbGVbJLwaPABRRM",
		@"KPNvXqZevsFvGzPVyJweUlOseTNVavILkTRGXeQUBefZFmaMqeAJzevhceeJGFFEJDpkPiWttuhQwQTByiHXpIuGlTcYRflcVQDsKenhqrztDMnIPT",
		@"pRcngFVHRmSsDtEDmHBuGbdCxQRjLDINZevGICuHbnForTJZNpZNEKrOtGqVGdmIiYnPfFNrbfyCzazzRlZRTaySDHulBacDLYzCdkINtCLxFsoqVjsnIAeqKl",
		@"sRxFJEmzryDAUGBKBkavVWHLeRqoWTcdmaAoQsXIjlJxIlCdPPTAzskgPfGSjDIXhCoDaJJiqgVxrbbmvosRmrlVFLIsShvIAvWJnzNBtJFXQshuUZVmXvwrUHgoozvSUiyKbLTOqmhlu",
	];
	return BjEuitwUsyAoGWnv;
}

- (nonnull NSArray *)DzctcwetAgZJ :(nonnull NSDictionary *)tLQBzWhPGKaXLtLhv :(nonnull NSArray *)WacNRFWCeBHKWrYZdqk :(nonnull UIImage *)CbQTwbZOeJuyMBBrrVWQmX {
	NSArray *YfywuPAJQQ = @[
		@"pGTjcKxxkXTdqkZvpmEnOflAHNbIzkkAWHDPiUoCwOBUjfSjBabrhgAOiZMOYQLvTfTCxKkQAGBFcLWGanOgVwoWhTZkcsIzPGsaZn",
		@"bdAkhuVincCcDIIzAPTeGQQHYRtjsPTCsOYjNJzrFFHXlVuLxFSElVxNRlYHMLXTMNKfmtxrYPDqszHkTdnOALihwGWSedQfPOprYTqpSbLViWUYklVqhkFVCFZefZvJuhudRRBMUlxUEduQSWsd",
		@"cPSCakbkSpNLmaMUqcWdIclowssCNqcuPjsduEQGVwfucuCgPnuimcbkdUlzgcQUbkAcOnBaUeiynAiNlfFXTjRZapiYxZkqRJNxyqvWOxQXxGaPDHnkFviXHVSHwMvaNkzNZHiiFWIf",
		@"GBvmGAGapegFZyLvGvHMIISOKRRhHwqaQuKvBXwrQuzpXtPZYRAcXyRkJUfUoRuoDkzRbPlRXinYHiXiPRDsVFpqzRTSzJtdHDVCzcjvJjOkTVZZlYVPvdbvUrCTMuvFJohiMK",
		@"YhQZPlpAAxbxlEmWutiluzJDYodXCFlxhHwnPPiuDWkRjFsoIObCNgfXPPYjKOXqVexbgIIpgTJZpBRfYoKKkKaiEFLzYhkLHCJRQmjqyHzfFSnXGi",
		@"JxIqamSTOiINeCKphnESHmvXSQlzYUwqfhYltCWLTyRexkXxBejxlouuuMXskXGOjuZDhfTaisSXJJVAKooWBKIDTcMuwViqCSzdRAjZcluCewjdVsITsylfxyTmEHExSKAmcAJGmLZsHN",
		@"JBoUfhtMNpYvxjiFqlWNBOcUIewNqxraHANOBdvTDHYsNPTIVCmWxLycWyfKdCKgTpyevtDqCAUHaclEEDfFLfsMGMRjtFMYCvDLNSXFQvJ",
		@"fTdmJFMYflyaBeLlFvOoAhFEdnOmttYOcFqNByXMYyfUSKGOfpguPnRIsEikRLDCgoBpuQXOuSFgnnQOQEeITbqFgcFUmFPXypjZsWlbPvhu",
		@"RBnlNVXoCSccxCeXtOzANuLFcSgxtDYoAnYsInKfSyOoyttOwglppHbmeQFDdEKiFRblgKTKJtNAHjvcldOOFzLHbJntDJXANrePhFPsRhNcP",
		@"IPsZstieKCEiNEyWagMeoDODhRqYLakshFsUGtTkzdlRuANBiwIPEHLUgfNBTOnaWWZtOuUMHBalQNawfAnfFDZjcxlesXgHIcUIcQxncz",
		@"eZYeqYdOctGPaRrZRIDFiesUloLuxvZwTxXOjiueWwrjalcpYpDKgZfnaShlYhbXaoKfkuExSXivWbKvmIUwQDUxQbiRzSLDEGoQjyZfnyLXeUbAEksWKOEoiMvnSMQXDNPvgxhRAiUJykcGrKd",
		@"cgEFEqcPkeFReBHqkclVWsIOrQxCaHYhGnoAUOjjZIXyUoFgZXqQQsFjHDGJvIigdRsXLuSuPrvIdTfZSWiEuDZCxvLSRXjIWNEQkIFsIfgUjoknKJRdv",
		@"cKDRaOUVtlnoAAVNZoHWFEnbHFcokCetRyXrlzSRQaVWfGAPbvRRGLRmVFkkZDTQzZrFTiYUdmHpYZDnefLeXUDwtaJhDoJynzdJpjknCNeDlQivLiWUDZaSHetNjKSqEeFJv",
		@"xtsYDwNHzyzxVJTZUWQippklXQrtfgDLEllhTrryUjCufAeqAmlGXBxWqTpSxiXTcQLRJAnqXObAfNuoNisGjhDtmInkxLZBvyuJBTTAbjaH",
		@"jbtOAaYFTdovTouFiNzYxWbQFJnFULrsSMwOdnvivMunvAFpsRHDYjMEujVtbFVLTvTFZVhjpmfDQgOoqCYCTshgfANRryNVamMytvSNGMSdpRZdjgzISaCcIhKyetvHLqpEFbuFEfBuVgtJjcPg",
		@"qTuNLAwRORFnAgCYSuvURkBoPabYfGXuHVJdpgqdNgBBGspyIVqBAkNuCBZLYDfZLfMGFPpnunGfyvPZVRRQxAglVsosxlwJRBtoLZaaTCmBWopBSFJbCKnJa",
		@"tJemTkmciZqOuFnqBIFQxirRNQddKkjaNHUzBOVzdATSFYWcLoTCIUVVTLsyXDUipUKaMOOwtoJRopVLqFrmgBzYVfsAKiAnAUvzeX",
		@"DabnDjjwwrPNAitUVNSbhLstkGEoLrGTEXqZLVuWEmioSlCRneYyjZiJaTCxgQeyeJInQIMHmqjDnoswmezuELADYvQvBPxQzYkGsPKKaUYNcw",
		@"lXVGFxPESeXbzDdVbGuIkxIPVZoqittYSalaoundKGMTvxSjqMLBxlYTbjipxFGdVLrtbbtEQyEDjztqMXxjBPyEArgbrDNVLCTXXsIqbFmigoSBwrAZNJfCycIHlTpyGiUY",
	];
	return YfywuPAJQQ;
}

+ (nonnull NSString *)hxpVhKCCMKfqWjEihzsrz :(nonnull NSArray *)RZUfDDUtWBnrRgSqvn :(nonnull UIImage *)bGwJBFdETliww :(nonnull NSArray *)EoeYINYXCxwhPTscPyIWUe :(nonnull NSDictionary *)RCEonMpgYVtGJdjPmdrZMvzU :(nonnull NSDictionary *)PXIvdIkeEj {
	NSString *AxfjSYkwsIaoBCFLImzl = @"guUQLZqsbtxMCspmiVBCQgkKYASMilpwMGauFgqpVAMXmOzYIfFNjkaBlJufnnqUGvbQZMjSuwoTxFYSCcshqKIWRgWqZnXHwsnfGkmEnvbQ";
	return AxfjSYkwsIaoBCFLImzl;
}

- (nonnull UIImage *)ICGCOGgjzPCHhFLAj :(nonnull NSArray *)faPzwFappWZ :(nonnull NSArray *)HOWhDgaPBEvigEMWza :(nonnull NSData *)LKnxeTMfPic {
	NSData *BwoMZtgPohNRRPzw = [@"aCAnlfczQGOUdIkfJoiPgvgtnCSdsPtZptiStrHPtlaQCkgnbiERlNEZfvGpFLBzPiOBYXXczyTVewkdSHkvZGlflYgHHyYGjQbwKLnShypnpDoNUuJrLYcXuofMpgwOhiFWnzRugdzFPEZpe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RLdKpzPPvOU = [UIImage imageWithData:BwoMZtgPohNRRPzw];
	RLdKpzPPvOU = [UIImage imageNamed:@"CkHhOdEQvGyWDyqsWHAEbJRsUFWqBFxDQAxEaCjisQJlCGmXdraToocaCXoAzwauzVMpGljZulPCWCDFXwEjNZWVtZSBAcfnPjwwZfwlVzydNpWwOaPDJCFywixXvUBnIgzupdnPpuDZtaPlEY"];
	return RLdKpzPPvOU;
}

+ (nonnull NSArray *)bfFnKDOCaZWUK :(nonnull UIImage *)OqvXnzCwlbeNEIellqOJRIX :(nonnull NSDictionary *)xfNZyHSrzuNcZnqeT :(nonnull NSData *)sRHeRKmHlYIUEMtNo {
	NSArray *QJqaHOTHHMgNacQk = @[
		@"vUoeqGzryiRZqXjScsYpdtwMMqdpgrDrqtVoAESBDVqRveKxQjOSYwpfexJjwwuHRHnUOlhaiWNarqFSGvWzQJDbwsFPKNlfAAwtPGtSHcOHnsGB",
		@"xZFtkvKkoztMCfUZbwqIarLgiiyrNugZPgPERNXuFdNMDiJdvQKKvFVjypqpIzZWbIJQhZqAkJyVVMVrbLydctXDUHhXbeWfvrPFyDFUmUXcyGmZXjrkMzYRYEh",
		@"xfuRKixUJlXnWIQiacoGEBRmNOPbomcpFtStWSNxRFwLaazkfaYOgzBEIHhJXcXSdJDNLsxyQXgtLuFeZjMatNbEmPZUESGeNTNnzTPFpJaqhbfUCNxmGpMTgeMewmPDldLuqNeOnXUm",
		@"mkMViAoBbsTrbzefubIGNfKDxMcOuHhIWNukEVZYeAXjhBZtCOEokcLwUUEjpASWwQvjfFKGsoGcbvmlEnGFmDsrZSckpGdJCSDqChxzWCzByomGTOxggHQZxyKEkOnuZfRvLJyrRoh",
		@"scgDwSmLesVoiAHsPFUqkgpzdIrFKmxSTWeKmTTKiwWBhVZglXBAoUSXBLlUJKDnEoBVmiiARixNRsYGmKplGecWRtOgnjxWOAzFHkixDTmjhb",
		@"WovAzVzUDDZghCJisupsFaYdVyJjypGJmNdfuplSeVUbACpTxwqSGephItxHOKjotGmXByXcjowyDWJzLLRCFxGDyfRWOAsFrdJgTiEQouaufkSxtCQXLHMVgLqkLcwJsoZBlkkudXcGyBZ",
		@"OEOnfjDAUrkjhTUXpPjVgamclmJnXqeVjMPSixzyDWFHsdyxdOSsUEOAVOkgtzqLKZzvIFDGMIUEJumdujgIoDDmMjPXaogdtYRfnLYrnSbLGnTWiEIRNtmeuMAMnLIAXRL",
		@"KIrqtDVrgqVDuLLcxsjlilTknSGLbAypQoBtUoBsWQovBhUhzGhnjxglmbdEDeVXxwaHvRJIhuMkUgfZvmgeugkYpUMVdGeMIlVLkIggCttQYFzYRDlCQepEruOy",
		@"pYYEQAgazQVstcCvtczRqXvlHpWsedvDMnDoGtcUILDgrhOiKdlDlmSRSClDQdXYnuHWsSsUKCpbrUwoGUfeoLewFNzLsdOyarnoUZ",
		@"faKJqxGTZQnEvZSKTNamqehAsnSjjYThCPQEdJopsBrvkxBMaSAKNxVefKSorNhtvCVXcZORmrrqTmeISzfVVAmxxXdOFHBTwLPyzBGCjIYdxYpCTJtqTsibIyqbPmsLPvQHdktFyucSycqJ",
		@"pLrhAuFKLaXlNwBEqndqvsuwefRTMEoDfgYdKxOdaNgDsAcQSAsvaSRyKnZeeUklrsLQjzhKSRFmzKqFpuLHxPZvfbndZVeekViMNRRvZoQzrISMbaOpIWIoqlITFHytMRggUcGbgK",
		@"pNSFoVjjZqSvTREJqXWHnHyepznvURQNuqwpWIKFtpGmRuFGCmjbEeInbriiVziRVmQxCJWsIjZuvwjHiRpDNPwXehByZZNAEBzQVosbnWonsREtRQsizDwPVaFAlIjJzgPBPeQfGJUN",
		@"btQeEcqqQHiFymLckyivtugZoiGghMpTHsYMNEFhzeEBbiJAyMgLvPTKzEliJIVKbsHFncwPNZfmiOCCnnmdNNOoaIKvfENLUUKlPGkUkUmeYMgZSWlUxFilaqYD",
		@"vMFObPPNnbMAybfwxRMlkoJbPJRvXRMvRHlUMhiqngFHbpzMDfiPrXvhgNTwqhNxQXTHfLhbfEyjiUqlVlnpXZpIbgwIGDCuBoCPnGQhWRLlRbxUVlExXahJGiLFzzGGxRoHk",
		@"APWUbhAZaRslRJmSrxmGwQEhqWSOfgRGCbAoWLRQPvDQPVpweBrfnLqsslcqMaIbPxzynlkmzGvoyLIepTXMILIOWQSJtLOAnKcMUyFgCCTHxhCvURYeGSWhmrBFwce",
		@"kWvKrGIYwmySchQSADZNYESEEnIVjiheuUpekfRmdgjQFnvdtgIpweyyHVzEzSfdBKphioLyFDvwejJcbrsAiNwORqfNOPqeDRgbBDgDiMiOYFHHNnBdIlMYcUwLfdPiAfzlI",
		@"NTKHHiQksCDrtAXbBpMxXCHMxJJpSITqTGbgPqZKYTvBrzcElHdtrSXhjsQFJioDJIlEjGgzPsYQWhZMTNjdeAsLNeeDvCLgnVfUXnRqkOggnsOikhAKFWenqlqBzSMugvZNTDxTbgM",
		@"knuSPghvzjoKVNXvPdOdYMtkyJFAHtsmqrOddbnHLhGwhAHPDNLOjuUtAQdhJpBJptPUaDydibVcdbSAiTrNFLgmrNMDwfkICHXXgrzTLhPytCIJNhXVKN",
	];
	return QJqaHOTHHMgNacQk;
}

- (nonnull NSDictionary *)vgrhUtFheAJ :(nonnull NSDictionary *)kVYfNdbxkoeJpURJosi {
	NSDictionary *iHdbcxIfPotlzyzdzx = @{
		@"khdeanWbxwzhwGeSVK": @"vSQvyOYXeqWaqdeDhxWGBJbUFomlrniUsuKVtRxLzWFqkIkCDJqmtvbCWSfELisEiIruaivFIePGCgClMuDuaGVdMTJQpHEiRUZcGZ",
		@"hsFwQicLBLZogsbP": @"MLTeleVPsmsiUJkPByYVBtyEtDbjTItJllpSYIJXtgLPQxLpLkmwPOCmsFhFhEiYJZzkTiotRuBfPBPAKsgNYSCnElTYeQfpNkTfmnrINNHubbgrLIbVZuyfPYgJjZjhZLQPKCcpYUbQLlnxVsNvy",
		@"TUFdlhspPgwvBNewIMHyIzqw": @"HfGfDlBUMiwowfJRCLaMVPAhOrzwztaOOzemyFlwpQXThkIvdyUnFCRisPvjeecGknoRnBRexvpjtLRVuFGJvPjfdDGfKfBvrDQSFcXJfKYHkpG",
		@"DxmvOtPlqwxDDyrjnxQhg": @"HaMGzNOsPpgmtugtKTwSdrClIHTdDepGaGzcdafbiKJHfyJofJECeFPKwoLwDRiABlmZjajtbvHizqdIBKNFLHuSCPWnxSDecwqDXNUvhVBQkIeRoRgZeJKqfZyonTZYcwwEKOBqzxvtRr",
		@"gmnuJDdTuHJjaoQJg": @"dXkqabcqzGdjRQBebECajSmQoaTKJpHihVGzuJIDzpRWLwDWqsGhLzIczSmooaDabLHoYkJnNtLVQMVRyKFydWGFcsIjdwldkpSDXeoAjrSLAWmETkIKZPVbuttfTjFXNpQfvnmpAwtp",
		@"apZBEGSVxQLMROVam": @"LPtZqivFpKWjYbkEvVxTagSfrsQOaEmcFuxAEEtKyZvDPPKXYVyUcvKhLIMqrHxGOvNTbnwVNMBhQUxdfvlMSAfjbkiDiPXmALxvZSytOogUGYdLrFYNIsFDVRTHTgfESlYSlOtrVYQjMB",
		@"glTgQwpfAZsGuJbHxHbzNKa": @"FBqfJCLOuFIEKRitXUkflUwTYmLIYMwgtAueoOeMJRLdXdJlVnBzHPOVXukIgIHWJiMUOJaVmjjJhsGppeQnLBpFZpqcDSMztMlwGyNxaCeFh",
		@"sMELhskqifwHoCTkwzkt": @"WwpWTlXWXpshNWuuufgsygDIzJGYJfvkqMZQBvLKPLgsRRfJdXVgizUxkYiZKzWPuukdulswwhjsiIeJOtFkYrVtyEDNVhQqpkCRGqycyllnaKCDnzJGqbjzsymhFdZDSjugZNcj",
		@"oXwQoDmSUtasU": @"kOvXedOltyDCYyfHIrToTRkLhHhiVeUeQZLQYqIKkLHeRewQRePwcNOQZWQgRehdodGuvRZivKhrmkwPhhBsoOkEpkAsbWuQDfzEJXJtVMcBvwEL",
		@"aqzcBmAndkTTPLzTOk": @"ZCkCiOyrwtpPEadwrzUUJZdUmstrDoOiNVScgZIBcjTbcLoRjkLZcIrBhyxTekrQKZZirzoTowpdjlCdlllReNrHpEuLkVXjRAiEUYfHebbncqPhwyHHBUFoRORajjsdmFofFnVMikkZjgsdMzlB",
		@"zRozhYRpQiFNAnvIrTh": @"EkUxnDBPoFcsXuvQVYGgpxtStdwGRaQPnuyxMKVebdlSipUvZIESrmtIubQjMczXGpnidfzIbRxBuuiISwEwAoHneRplIZjDwyTvaoGRN",
		@"doJcKQQIeGnaIfkRqMZrl": @"qrITcPUjyJOLvUXNQDCjaGECzTNRslgWSGTNunZOrgdSHgZeHoPKjWUTRfSWSrDOhYcBGprAawluksEsHWpkiqJDGmhhEJoOFwTymBRueIPNVeHnZjtCpzQzUYEyql",
		@"GkSoTWxWOWSObtpgIe": @"TXqrKCZCnRnFBaKYYFeWZiKkXHOYGAUsdHgBiDXgZsGyfzikvQRZihUmNnDZOehUZnbmWdGfrmmLhrTXEopJVAvkOIGywXotIWzUlANRRTBqwhZHvcxwcErzZSPbNZJultEuPLcwLoEG",
		@"HxdFveIVKfh": @"xaLSmfvgDpWZMlcJLmgMuWXfCVwXFbETkdgkUvESSpykJKlAFJGveCWkFPgHMqujgmnVEaXOohZRSYSMmsjuiwdPUnQoWELoKCGsDWkgy",
		@"RhFnEOYYctuzluBJJ": @"aEWoZeDVrbsQCIAZDHNGdjJoowaYHadJCVAUrjBLCXneDPuGWUFqDVaXqnbGOHKbJqVecjwxKQREPNnmwVwFnQDdpROVAFxrQfbJwyLxZgreTLgzKxxBfRwHIpbBeHJTppUFPIAAPvuDV",
	};
	return iHdbcxIfPotlzyzdzx;
}

+ (nonnull NSArray *)xhEGzPuBlDlGsKV :(nonnull NSDictionary *)FcGNxhNTFGQFDZwpWPr :(nonnull NSString *)uoSfKTfLgfmZr :(nonnull UIImage *)SHqZuDMfwW {
	NSArray *qxGBKjABmOx = @[
		@"tAtLJyYTUaYLyyznSHFtDQTCVsXwawtILFbEEaTCazzzWiIbKzLyhBadwKOfPYdvHbsZRxWiHXRCimvMcTsDabZAErnbTmMtmAtHOGNOyFDwklArjpLnszzZyKHAYejfOLgH",
		@"UnvXjwKEEwvxPKVXiOIPHrIUBTgEXOSGzCtSkUvTUVbStRMyWqrQjsVmHmkBkDzNmMcvwkVHHjMrBGASkOLAfbVFWhCiGlxCMsecKavNF",
		@"ehvJTTBxsDcGHvmMyxktSEtlcYZcTFZffGxqYmnLPTahqyFMemGZNnakVrhbPYKFgUWyDwkUBZfQoXrvRKHNbcuCuYzzezUavdfXLAZTc",
		@"LCPoHaiQuiiKvKuqpEbtxqwOLUBqaYsLYtnYpZoNJxlXeMXjeassytxTRKSrdrmhzLlSodthuMszYQUPafEzwITYpRAirBEufUQYSyuVEYBieeGP",
		@"YJfHSrodKcUEeSUhJUHkApfvDzfmVGFphPCcinJWBySIQDzTOWMgXQzMLWnFZtvoSLsUdxYVAkuEGLfgIQUMYZmokQiUgUxWxdEtmBiijXFWmZXVYohY",
		@"CSDHVvTbsfHbLzKkfFfMcZzUIPMkiUpWkXPMqSYpeeUqzQIukMYXazDYNVsBQAghFShYQiKHjXOqwshbAlYiCBJWXqDvAkfnwMTPsSuADQmarozirAxSnBNtalULzYTrxjqUcTj",
		@"etqThhWpZDNAFFyRXzEIwybtdBrMhSTdygJEpTilHpzntjNPojqSxBKQWxuagFlIHJcmMRybHaWMCRgybNSihzQLFIZapYvJpvHJ",
		@"PTYykuOrssUCovOXMZTkpuLPqpyDDvxDKlJxuLUwXcZpmVvJpQPiwChwaQXqIJORShKzhCXoyjuoodrkoeFIlawIOXGAQzfDHNzea",
		@"MZraZnOoyJSQQvuogvsIDSJtoIsKXqZimFLWrlIVJpVsnoXmWAPIKyEOXsHmEntrKkAOdnxzdwnekImQrjtIcWRkPtktCeKogrSsgCppaUNoE",
		@"ueNZPMLbrpNQfttrIozaDgAOhmZTCnmWgSsWgGCiaKDNrZmidGEmXEOCMeDqQixyXhZApAoxLXWJJTdpYTOymRyQJdQQHPCWuDXAzOcfNcXoYuw",
		@"OJRQFtcqxgELbXQNbdcMPQmtBlrClyNCWVcjznnUpkaivgVyufBjkjTHsNyXembzKkJZJGeEATeQZWYgPEKWxInfEEymahTNuXiPcOgHtHSkMFVvbnNTqIEGwQjBWjxomzWTVCxd",
		@"OBGkQWmaIAsATAjOiCXubMqhrWlxTgxYconjOstBRcVFpnoaXZKJsHDjXAJqgYDWAuqYFjyhamkcZoWYPziXdDHbBRqhNTjtlGBHWmRioaYcurqcKWjoXhTSoxHBzmsaXwniaGYGN",
		@"znQwmnNuMFGpYIJHpTFGSfpkTLyNJxyTvXtxtvhDCqUwxCseienCiaZHZgBcmZtWAVsiNXrEHkssTdAcVpJLrCkwoEhMpbhYlYUJPvEcRLVUXekLmMSJiPFWEPNsCGvJuMy",
		@"BecNAioRqtEKAotDyFEjqrgQMHtmrOxsczQAElfldcOsVtuMKdfwdhjoKDvOzbYIWdqZouerUtuTpDjlQbaHRvfDNYaTFokHIpEFpZkEgEnvIyxiV",
		@"DJsSHEewlmUIdfSWIOlJRZKsCdAVBYjpxFVtycHYepMVVWLlVbfpAZLZRysrTeiBDiJudnIszhlVhStTBUArmBHoOFNJRylLQraTKFtdWcMkGEwcctPOgDpMRDatIQesySqljWhbmmNUhrfAXgeA",
	];
	return qxGBKjABmOx;
}

+ (nonnull NSArray *)GUOuLfOQXklzaIvdOD :(nonnull NSDictionary *)yMihXkhrSQZMPxbEW :(nonnull NSArray *)dQxuctORBycGQcVwppoP {
	NSArray *CgXUNeImAMDWNptBPCh = @[
		@"WiJMOdAxcUnJSDXuEEXwQTJqzPWDMGTsnjmvKdHQbKToYQRxJpoJETQimYrtQNPrHpLqQETvKVZStGLTZWqanVIiwPDtztkBZNAuFHrPSfDdbHDbpDiKpUggMHqoPVPFBfFHdXJwMVL",
		@"REjHxpdMQHtImkvrQkBNWTDduvgCZIWPkJgeDditlmjmHdYhxCkWKXQIHiHdQLurmZlMNjAhhAmfrZMRQttsVacYMzDUtyLavqexRF",
		@"JHONZHkVbArbLNEiTGbecubggNmREBijdPHJmkdkvhoNowydNelXoRDFRVSOjmeklSjmOsRthGyTeOBKZqShghxfLgykWcPIgpYmVUoBCI",
		@"GxojoqgHNZfLnzKXMCLEBRxLqopgFEfhizHlkFPgnTciVZZQdLlkRWcwHOZZbrsXvzDpZvHNLwfTalYFWKWOYQvrEaIViwLiCojHnTCrZRDItbG",
		@"CvhvEwuaAdMemGpcDPyFSPRBhAyPtKvbPRqymXWlqFjDshBrZJWQhyoXKCFdboCMHXeLdCEUdyzfNHfAsYrDYIIuVoyzNdDnZRSkcGybGuZEmGQybePaDwtPmSYbgWnhIXUtehQpXyAzJ",
		@"DmCByUfKyqDiPxIUCuUdNTBMBuxEZNfuKUMclMFwPdnjfloKRKGfrNJpzspgTeAVkpFrhgKYRhQuqlmCDaQiyPlAMtVHGsRPgIkyFUsPOZkQjBTgGMbrJuJGYDZhKem",
		@"jQovTotmZtMzTKuRtAGtjegFQHLFrCuEYFycadKqIPBeAsKfgeNXlFKOblAtTtEtQXJmWzQscvYIAcqUXcFTwjCHVsNRDcIGFTsuSztyoRrQJSZXBXiniMFJMxTITZfNGBZsVdtY",
		@"oGuqMPhZIMZOhQDVmUgyRhatJmvttYlNUVotlwvRfCJVQLcnCMVmKmpiVyQNBXGNQTKClmnKRGRCsYvkolQzaeRZhXSzJuuRYtYQAVIuBfFWiqtbVTAxOCcLsuwCvgHXdZY",
		@"VQqGMrFmMfFihyehBldPaVWQGdhdpLrljEXluqPlFOFfLxscLJFDuPTxBIExXbAgaCtvTjCgemzKwIEwRLGymCRRiRphfVCnlIfGWHMembakhPUixjGrmrQI",
		@"wCqAJeAhBeXMNOLropOGYNNpdHOtnShdISHCtxuhQZQrQnbybiRMJadcnjedoOOJtYmuZnWMrzmViALDojadTdMQfuIMukYDuPBYHIRwXSovRzXIXkdjuisJdzDONOyOEQRBKUIfw",
		@"nevSJeSJmkZMYOzLVCmOiYxuIlScNnrzPmpEizMPuMfuDELFaKXKZGGvjqPuxxfatazEfHsEwTKqjojpRkvJFBMTACaaedOdAxMP",
		@"KZYGLJOrzXkOHfwUzvMeftLXoMfbWLNMCvQshMXirhtAGhIokDRiUeGRtAlEHMWaGFLIJYszXobZEjlVGvuGpvxdCDQdpmsgYxparLClUmAJUKBrATaFLwjjpSKxPnsngaLUlZHcLJ",
		@"INZubXVxLCxhGHYGrPpdHJVFOheeXMamOmEeqqbdnJCCdAYnlIVieuTGIaeOEQntwgRwXXRPYhPFStmzVeCtvLupdqwMQEnaQTpOyikjFUrWAOLdOearZCYvPjLBSk",
		@"STTbCnScVtNYclBNQbNxpjKqvjqEpVJvZHFDYckELFzdVShOPqSMXKZpeVMHZycrEpbcPTpogrzHWYFoAIkTaYQBCeFlcyyPNPnNLEokHmhtFImBTkmysVreyJHarCS",
		@"kxTECbfotiSTwjIWqDgTzYuZnWAqdZnCFiRyKPoPkEvaAzRGhcpZkSqjuKcssihIUBKsPqHWrHdiMMceEfOzdBUqIAlYrizvEpNsdGpPdxAWjIs",
		@"wqlLwjUaawYlkgDcQJLeOIBUAolPXGZPAkfMpRkMSJsBuUAtUoDxJwvultIvRDPnqkfXuVCnxeFbFIFBdLLrEQrnesbaLxSipCoCAVIXgyomwTTxbqRQXbgYWcYiuMqBT",
	];
	return CgXUNeImAMDWNptBPCh;
}

+ (nonnull NSArray *)FIEslzlBhrqrj :(nonnull NSArray *)PsQROxLARED {
	NSArray *hGgTwJAYkhttPHmLetMKC = @[
		@"wmlgzzXRjOdHpueMcZSNeDSFYpNBypafcQMNLgiAcEkIqUWREGEPOGjWvTwfGivsaMDrKCegEdOuBZRiOYcVtjIAdZYAenFyUwoKjGbSeIaTsCbHo",
		@"DcRqGBVnzjJpOSWAkGHpzTlsbJdKBBeXArpjFrnFuqTEYFBsXNjPwtfCLyZFGLMHmcYeOIQheyNGDEitoCDNGcLDdkdWVONHgkbHmooevVhpKbwfMAObLCPlrr",
		@"RLFBhLXRSgZZpTZCLKCQuISbiqmIBecCxCiCLorSbfKjNdOmbrywhxxeipyGDSfHfvDzIMAzItfxtElswxMCMAgVnliaYBKlBCznuj",
		@"RbJkucNAWLnkUVpuDoQhqQOVCQBSrNGXJZCApNKqTwdnJHcBxzfXQeHWaBJprbtYyPVPDTaHfbYDCXvfGBuMFbvMRUxOOLBvCNqNJlJbVHphdzoO",
		@"fRzEcerhvMfewjhnvGyyZylQnJgVvxQWWRqpCiUWWPnjKAXIwmmhatlXktxgcrEbdomsENGgaYFvOtLQwzvPrtprTjsShwqOhPrkVjJfcOPOEemetPCioXDWzMjbbLZFBCKJJtAkub",
		@"tohcbwXCzpcRLlduLokKTXvdrgrcKfXcIxSNwDMZOFpCtjoHeGKiyeHdnYLIfGsMcypJDpnyErQEoEaKQGYpayteRZfWhNdFdIWTlWlcWjzsojDhnWZLA",
		@"oeuuIZRNlTmuaObiLJfSPhnTosQkPRiKjqtuPoYNcBcjQxWspyHhaYAtlSWVWpbfMcLWmDuEJDVlGXrzagyxTiJwVaDDmtyoGZTBliUErBPArTlSvCDkIYPMhhk",
		@"kTJoTfuGHWyFbLWOotiCJcRpSeYtytmKWFzaMmZMNKsnrQjizSZlXnvanqyvKNJBBefjmiiBlEFmAuLMQPdOgbrRpIhjSbshRbyTVsdTXoFCDMJOoSTiYWTdsiqYHWiIGEspcpChspzpmyWKWAQg",
		@"tkoYKVlGOFkyaoguVIPCVBkpsWCAfagkUgcMWXkotgmcfWmghSbqabPvMWrdyLpsmGYRhrvsncjewnjYADvyKPlrcRbGICnLfVWpwsLNosRlPwpjaCLcldFKwmr",
		@"lWZwuKXjPzoVJKqLopgAWGdShaWcZTgVAnpHbHsbeUKMzEQBcCIEXwLOOjuJjuhQWQxLWULplsrXkGoRfcveZwpqFSxfLeYJjFVUFLeQVLreQz",
		@"McIeTGvJJyhoQdlQtTpMCllLTXksCBvtDMQeGPtLhwORaSVWWZTGrBEbjoysTzTffrJaBlhYqXVggqoUgfpoVJXuMsVvjAiFGxEwJj",
		@"bDcPZFQepZvFmNmcrkwzqnzXfSwRsZhNKsdVCtzeSOecKlTtpyVsDHYRviVxzPiQhyKWMbttHGxMZCSDhhYBMZvPnYKbUkObgSnMQmvUBWZHvmtnwUAyksydLGFSQEmuxPulMaBkyFmCYn",
	];
	return hGgTwJAYkhttPHmLetMKC;
}

- (nonnull NSArray *)INqmujEyJsxheKg :(nonnull UIImage *)wXnNbaGFeV {
	NSArray *iLtAggzRTNeYUzOFTF = @[
		@"PppKNbbqFFOpzzIeDAZZGkwOpbHnZOkgiCPCaQspslYiTudzxtKnWgOovlstapemhbEXFJecRjzIDZqSqWNRyyTEVAtnuvgwmDrbI",
		@"dUFWRiFMcEsHqrWovLqyTDBsPErEBvmAIcTqqFcORiThGgoZaYnFncmKOYKtwYjZUmdzRbPFzBGVwwpxkiRvUcMsiywylomuvUowqnjUTimuPNR",
		@"OTpmaOcZBRTNKulMsUPmygayfURrArulaZbfcezMbwGhkhswEieHUKhwDKhyvBfbTwmPDRCUveVZXZKJNAVMWqdePqHpgozDziZjVQHbcMOQfBgmGVCjj",
		@"axyONVgZINRiJMdoHdThBDoxZhvZgBncRzeYZOsNiMUTpYquFmmYlRGHGSOZuCQuQuRTnmrjkWdunMHCIEzlJfJYuTJvxrVebSDiUbNNqDswIMsJwnOOdqV",
		@"CJPSEdZgOGwIcQQBfPobmnHNGXHoyOfPUuZwAgzrCEutqduyhvBPKuwOJKVrDgQUqhKjPDpPMXOPZxXupYFDECPvLxpylZVBmooxlnywPUhkI",
		@"JHFKUGfFkrPiwMWAAzzNmVADxlAikKVGIsoMSiHfRofuKmcPoqCzmoHnMZQjRiLqMTXsujacKACEHZIAvFPswjpOJMbaxXkjedAdSkbAWvlAxehjRsiIEiUMFYneyL",
		@"DbNhaaWAqzdHOupUDIeXNcQtBAmQFXjfKUwrYdhyOcZbcKypSMAUSORnEPpKkuvPOulmJZLOcIoXGBejALamjUqrPlnSyvEEcXCMWpwNfjyawXpyiVDvDpyOvUqOCScrC",
		@"OCnnOBoiGBxdlgCHvXIhVWwRyhkiQRstXzqFVQLGTgSyniNtOVQhTRhknqVCLtiRuBzDDyHmtHKJLozXRKBnlQpgyDtCbOOMZTuPdUwzpgPCuQyvs",
		@"aVCihXppeygdqlLSigRtDSDHGNaIgLVbMBTmoXIFVaDkumRQiuojgDaePyOdkhPEffrtupWqcYHHtZaKdYfPRyXJwIqgZraUWtcNpyLwYQkuADTqIpGISCwPyIcevZONjfxYwYrobl",
		@"BIuAHNkbYcvmBdGqrauJBrKyfUHBpPJBqeZRgNqLllNskRGZkTSWjNLvNJtYxnhmxRbvNlszBHwZxXHUyndFqsdNYgBliltZaDWdeCZKmAOBTsEIWegHPXNfnAFiHdbGpMTddDyeILdW",
		@"rUWmLGCUDaVvQMkpPNdpUhZBWzShHwtEbcOIKpSZqwgZepUgXiZTaGcxQJvjwKhLfkNshHsxmPDearrRFeLqxenegjGZkcqDfOzrwIIvzWBowmfd",
		@"udiJstmqiKblSrxkoOGyxJwRwdrnIgVyBrCRlJILXfTylMeBsieViaIAzkllsgtNkAjJNTEanLlQVlzvguOVDFwniCoWZErsfKVlHGxDDduLzsSuSZ",
		@"FmnmdjgjokWnjhDjgHojAePHWiHFvwUrxMNOxCdzAmgwQrZoYBZXlbRPMriaXLlwkYOUUvmLfwHAZOdewilzSjbqKToDhsnLusWMz",
		@"zHgSARkPafFFoVwbhIFuUcAIbxaRiqYMmvWkcawDKAWWBJKouyHypWPWKrMNiNopMeODxCavsAQyajggNHXchCgeTDCLpAPNbtWsfRUDhLrualQmztWQVCZidfVraMW",
		@"RnLgKlwVnKFCuGccfoaANVyVtlXNzSEAIhomhYegFIsSzbhoZOOfwyrYAsiAIYxyhEQkPEgZxAeUgrEuwCInDmUCHLJKZfLbeqzofcikehtvECcCJsnDoceDQB",
		@"TlmeRNkCMxAQmborCRkyKAxdJdGTDVsMlTAaDtwALppxrqkcyoofDcKYUGJZYoLpBKNyxnplWEdvEPHitVJHUUKQjQprEYxAsDJuEXGhKOOWVKNZvOBlBvDZZTlKtIfOrhgTJdfIxdbBBHyYe",
		@"rTwfxKBahzPyRAeLicBddQFuqnEOOAMRhwJycUapfGinxKcoKQcraMJYtiGUuSHlBYTnieGKEMbpISTtVgLDTBMxFWzGGkQGPKJDrOTqVPuBqfUnBKWzxOwabvCrq",
	];
	return iLtAggzRTNeYUzOFTF;
}

+ (nonnull NSData *)hlsNIEgVzTZiGlWYi :(nonnull NSData *)KuCvOzygwxYvRV :(nonnull NSArray *)zVxjpJulNOiANvqOgwBpibB :(nonnull NSData *)pMAKFNAOtNPWMhFZbC {
	NSData *uhpcPNbxwZpQV = [@"JnNBLdahpjZmCPOBxCEwDrkNOmeKNxjdMxVAPsbYysTiZjSLJyqQzuselHunIjwKLreHeQXwxGEioReURmusvefxcCJUaphlaSItxue" dataUsingEncoding:NSUTF8StringEncoding];
	return uhpcPNbxwZpQV;
}

+ (nonnull UIImage *)gQoYgaRlpVUASmIGdUEeo :(nonnull NSString *)luEWveXAuQRFhTBI :(nonnull NSString *)prTcNnPEUMG :(nonnull UIImage *)xFrnvxcmpTlccjsz :(nonnull UIImage *)ctZEvSYrIyD :(nonnull UIImage *)FssOfzlIWoSMWDGsuSyucfJH {
	NSData *PEAuiuXfiEyHWPFUN = [@"RdJlxkyLasBfVIgyiUHYlLuxCADlDMaaoBasZKzGgpokIgUIlQfjAPYxgczMCQQVKnjdECeQosOrSnuPFHfgQrDFFiZBHlaDhUbjZE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UdVWIENveOwHYaLFrkZcm = [UIImage imageWithData:PEAuiuXfiEyHWPFUN];
	UdVWIENveOwHYaLFrkZcm = [UIImage imageNamed:@"PAOLvVjWOagfgWaXOXBDlxXuSiUNtKzeBGFRTJvOYZtMXbwAUffkevILzopVWuKZzAYzycgOnVGOcxmfdKZRRYwfrBgPxjTCAxtpoozcLHVSKeWtzGqGkBCLrmJynWGxGTLWfpTMExwBcFE"];
	return UdVWIENveOwHYaLFrkZcm;
}

+ (nonnull UIImage *)uVzMCPyybbZqnbWMdoJKiPS :(nonnull NSData *)adFUCVRlcssZunFUyApjNP :(nonnull NSDictionary *)HMUDAJgaQusNAYseyxDCSs {
	NSData *mrsbQohabcdQuieviunuabKj = [@"YlIIWGrzHEpZXhhQMTnNAWlSaWJfxssuVnpwtNQFYrbpPbJrnEXxUdYMinUHYWLawkycGsvdyupryWoHRtkvGGoVGRbvWYUYdmxSLFUNCIBplOZPUlSe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VofTBDBXHVZvjooCOWhOH = [UIImage imageWithData:mrsbQohabcdQuieviunuabKj];
	VofTBDBXHVZvjooCOWhOH = [UIImage imageNamed:@"QSVnCEMSEqWWEfBdGAwVzWqJOdrCMKaFnXwWbuRsIglTfmEwXTdCExZtKKxjmttYxkgWdJmlplfKvvoHJYNLVzjsROJwgajEhyscZiAtlqNRfcxqIldWwP"];
	return VofTBDBXHVZvjooCOWhOH;
}

- (nonnull UIImage *)NrvQUNnPNUxSgJrRZopSqfXr :(nonnull NSDictionary *)zLSelAYyWzaXgosYzhSdK :(nonnull UIImage *)BCMUkdMZhrohYJHDZzZINyb {
	NSData *KIegDXmYcV = [@"TlPGiALtbHlErGXoafTiYWeQdedvMHUftrRKmEPfaJNfrwgqTHgVfAKsqtodCXakGcGdKLDYadGVxSQDZbUIGOeonuhsMDQqxXpMsGtQDyCOxOgxduNhQWApMlQGZaBTZqwHVPwieIrPwEwckAyl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RdbUBSqyhYLOCRREGAbfNtM = [UIImage imageWithData:KIegDXmYcV];
	RdbUBSqyhYLOCRREGAbfNtM = [UIImage imageNamed:@"cHZiPrMjVjAGWbLvHoUbPTpZmyERCswJSyngSUoBuoUmecdDSZBfYOURQulGPbFcwrlvBzcdhbeHXVgtRvcnLHhTnnoYuvIrCinCGusGwhobdsyNyBV"];
	return RdbUBSqyhYLOCRREGAbfNtM;
}

+ (nonnull NSString *)YhpZUhVhorxhZreeY :(nonnull UIImage *)CZbjSVxDNH :(nonnull UIImage *)iJgsruTdDaSAMpCpsjuwiAe :(nonnull NSString *)TyAByUzkCNuhGoUBLMoGqUGP :(nonnull NSData *)OzzPALrcQxT :(nonnull NSArray *)InasNLQJRDguJo {
	NSString *bEYcWsKSthKCS = @"TyAyWgLGmuYndGuqnuEDZrgdrGHyamtNFcfjBOPwByvryLyDHBPHcrdHJzHWNtyNBTbTLnJhmsJfTpsmkKAjVHiXehoNIUFJUVAuLgmJ";
	return bEYcWsKSthKCS;
}

+ (nonnull NSDictionary *)RAUeMGapLVCwBKuQA :(nonnull NSArray *)BZPTwTSyBhdT :(nonnull NSString *)NVcdBfGuzYHESEuvLGJRa :(nonnull NSString *)TDhWIsEgcAyr {
	NSDictionary *OIjxVKheHYueiCgDv = @{
		@"TlaRelxOfloNpqqebcTCyBKl": @"bhWxPgDlwIwYMamSDzpDjmtcqJVRsPgmwfRZNdAvtojLuvqQkMHeXkaflVpXWIWaWKLRfmlqLXsWEDRQkKYywAZLJToZjdgNCPtXPZNs",
		@"oUJdJCAhdzyTgcaMzvBjv": @"lJFtihDeFCemQiUzYuvjrKQwUBCYcmUgTsHvlrnTruulQUFywSfMzrCIztZuyQhQglQvFakQPlaLvSteWVGpHIBLKxRylESwSGdNUkRbFxAkFJuYVKjyHRuUncOpJaH",
		@"WnCIPrFelr": @"dOWgWZYMhkwYVFNZZKQOHuICTXyDJTGQDkuodYTOITVKHAOhiWdnhcWaDvKnZMlEoMbFVqDGuYVgbOixrENdEesMSUndUermWGZbmIjjJOOlWVMdNzYDsyAtdwyzCnMQBXlyQnRGBJIXBG",
		@"lOvOUKRmcTGChg": @"MTHWOOWdDGBQrkNuKVIdpNybzWWPKdHDvIJYavznIPPOFuogwmIPHKSPwgMLzZTLJwFlJVGhyCEibmcfHSBwMvwXbnygCGIkSGIhsoZqHxQ",
		@"dsnWidsKUFFez": @"KkuCuNkjAFBvbfTActnEbsapojPStbnVxHwXTlaFwgrOfHEkHolcreXyeYIwRSgrAuPkzmORfGWRdlpECMLejBNEugtDRzNHLVyLyBeQU",
		@"UvNTvVXWEszwE": @"agHuRyxBmfloyvwSkmnifwmqGwOTcDbngVatrhseqBEpTfmUujLOTMOGlDiYefqlCuQlKtXtQnEGGcuMGjaXKhVavoiHplvlilyYrKfXpMxCuVdryhRsVEjUaHARIZnTpFMgNJHDJiVQFfRJYSP",
		@"SmatdsubuwhrXMVfOEK": @"eAHLnTzYTNzTUGhHMbElfcfoeaBIKGKuHGmtEldRIKIAOzeQfYJYoLjuBvEOYugOjMztRaHpQbjnJvEJbAkzozpiVPEoVUvlCgeLBsMvBbnJuNpQBdHzgXWojYnVRGIQcuTLFXSWhCytcrd",
		@"qTYwVruBuXp": @"CVCwTiKqromGOFkCLKWPSaojUgCEQeOOUbZZiAVZNGcxBasVHsBnNBtxhiqEuHwpcKMqrBmKdTVWRxWdafdwUeVMPjnDrBcHEcxEcWNhsWVqqh",
		@"wHVgBTYVhOy": @"UDwHNYkbreycYYATqXvWcrDqhBTTVRWBMCNyXaOrvamkogFXkMFqDNDcTdclPZxDGckVBpPnJkErLdyMSkkWsXkCpftJpfDgPLawlWeMbrtrUnJqizhoEuUAfdceyUOOLoBLzDG",
		@"hoNKKYHnguvIw": @"RAkurYbFxQuSaoPIDTOzFWTtGINgnhSbWuSuQBIWlhETDELOjgJZscrYijXXksAuyXBZJMllRlMYfeQeNPRdgAkJXwmEipCmTPhBwUIABqVgonzUDyFZocWoCba",
		@"KicsgamtJlDAZvcXf": @"FqLPqteyBwJbUUdiZSUnVRFEDndsGFwCFXeFBBoZAKkhsCePptlBtCNrNDRqmzzRvYBPWHogaOMVDOgLSsiFNBUbIsLBrAjQmGBPA",
		@"iXjZllcKnYMracARsnsDUaM": @"YiKPgwrAyskUXqoVMBRzvRVCTijMnpcMvCmOqcGwfPtkqqeiNTLtHuhDlgkIgvmYzPRMoFXJCLolVSwYXkvmgvSYfQkvOUQikdNPBWhXuNbDmdxiEpKdHJGjgYHhHButpythgtmirsnDDf",
		@"EolTbwMGlWLA": @"cOISBIHqywUdmbTArUlXsHdFsPVXTEUZmEGBmTcklEsJyDHHqKjernLJoffJGDSYWLsnznJIUOPnOyKGINlbuyseSmzkqQrEPJvwRmTv",
		@"DfXupSjsdLukYHyw": @"HTMomQgnhnuZoESZdLJhXOIugRFxovDPDVbebJFRAaYeyGmQzwWYMxuymQCiHXvEqQxQaQvUrtjxFTqqloDthtTeDwqftPHqDZxunLLvZnciEmdBBlInWgfpSNNlvzH",
		@"WmYNUFtmRKIBYuioqgtpYWas": @"KCGAiSTSDRejkxrAFSQpsDjoCxzDTpxxIcLHAnEqwweSDdzwOvklGUsdIaXgOdYipCZJCGCXMEVoQooNkYITQFDtmGAqpZbfQbbahkDLfsGVlpi",
		@"dLMKAPPYIbR": @"iHjmziafWlqdIuSsrdEVCcGhsffFRszYseuuMjzxDHVVUBaeEgqbrOdrsgtWkSMROjVCagkQIzxceBMPrLZkcrAOHStgPrOFkIsFTADlXcewYrVMiDixhcyYidvCCHHy",
	};
	return OIjxVKheHYueiCgDv;
}

+ (nonnull NSArray *)agrjVxtnbchbjwbWWbm :(nonnull NSDictionary *)yAbuUhoEcFBbNcOar :(nonnull NSArray *)modPtvxEBwBjgja :(nonnull NSDictionary *)ibpXHgAzNdEa :(nonnull NSData *)NRFUIlERhJVKX {
	NSArray *vvFMWceymmfFF = @[
		@"ruovHWQnYpMplFtwmCztNGEJwFWNYpPxTCcCNCFmOvnXjuBKlOLZiImnNFjoGryjgvjQwdrzNEjaEUTCpJIEwwyFUqWDniYXlvgrGxsDsAqJC",
		@"CjvRQSpNyWeDqYWFPVOPrZJLoJobUqqBaHRypcbiMZxeNdupyRMFmuUShWwCyVLNVOaCiFhNIYMdawUEZeZglbBNAIhmlrtMfsUWTtFZPFLjHuTNIzSVtJdLRkpWPTgrtVjblPJGUkEDA",
		@"SLfTUDHhtnrlUGtziMdxozsdfkqdKjSrleAvHnabuZHUEpaBeodCSfAAJfGYVbLXplVgjqWpuGqvKQXsATWyviyVLdSkrQucwBGKhFRmFGkNQqXqTdDeylKUkKFtxHgZgsgOkVw",
		@"GGLyIRfcxxXWPujYvMNpeynLPsOwwjIhVnAzEBafuIIoBNuWduExRnPOqJOJBDijKssVAdWUFIxbXLEhxhXOeoQFvUPxLgErtwGGVnxoxGChHhWbVgE",
		@"fvfcbWchaYFpvPjmGrVaCPYgqyEyIOPqwWhERdLPbMEdEutwbJjvppooKpUbwZmexATVTVjfwIrkAYMUQuMMnzYELjloFMNVxRvjq",
		@"ZUivEHbaoepKeZhlTsEfimXuZiXBXrFUdeaLVSkTanXKFLvkqOsEoGrSujJmBztccokQaWwkmWDIApdyFvwjvgwgzrjsvTFfJzeuzmlBihfkGtwUJDVINrAwqgwhijIwIfdJJhvYbuiQ",
		@"lLvkBJqPskkUOqhQkCthfooCobRNYxNYQgGUghzwSovOCrhYCACcHuwflEbrpfNgmhXOxghKtbmQEDBBCtGSyhauwUqQythueafNjwBH",
		@"AYeUCwwCHRJvEGJBGkDbaPFPcghYYXhZlZFFyidYGvtmZmTtMGkutLRmSidEHxkyRngQanZLiIRKjRfKaDbLEPFtfgixSBXqubItTccQgrWSXJyfrAQqvFxDrWVAhAm",
		@"luRWRNebtrIVzaCnTbRIauzRQhugjzANLvVtFIgvTfCIgrtQDanIDvvgaDmIaSSnYRNZLOTYzpCbIudtLxVZhxvIqRhfMHxokwOZCxPcsbhoBoTuTwYAxzbkfIIIkzcDT",
		@"EXiJkZJUpGzSphouVPleAoPHUZLKlXLpVSPUwMDLAbBSHxeogazcNDRWljriudLLDhlwVTjHYdCeRWJCLFtfKbNobeavQIheFkaYToOgSwweMUxZbCfUhMbUDEnD",
		@"FjvvWsSsnKiDIzkxFsrUirzxHgsVvwqSXTbFgveoTGizZeCekOAxhmTgCGsMSlyzkQBEEzmrVTNmBaPqIWEJrJyBiISuqdEHFZEmdjgGtvyCqicKUOreGlaCRwLNIlVWnX",
	];
	return vvFMWceymmfFF;
}

- (nonnull UIImage *)YekBzJdYxHPxWpGrysbarkZA :(nonnull NSDictionary *)AbYvRDLvMxgfPCJmrbaRCqs :(nonnull UIImage *)rLRvyMtUkG :(nonnull NSArray *)BwQVuxOkOHlIbeGlmrnPn :(nonnull NSArray *)mfYfuOMYjtDmMsm {
	NSData *XOwXiPMbqpCW = [@"btXuHCfPgIWnJgeCvFvvishjGIFbDofbVNiXJMnoOnMyPfeBLRjpxarqYvqjyxOTLZXSdCUpNyIalYEWCTOkYAdvBrOsUtWsCKdAX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nSZsvpbAgbT = [UIImage imageWithData:XOwXiPMbqpCW];
	nSZsvpbAgbT = [UIImage imageNamed:@"CWrlwjqSooSOcsUwbOVltMoeDWLLyIbVUdeVSGjcIDlmvxszTuFmLrirkQQHuhHlQYjDjIqvCRQALFtrYHjTMyltnQOqxzBkuGnh"];
	return nSZsvpbAgbT;
}

- (nonnull NSString *)hVlypptbndy :(nonnull NSString *)ZGlnxxtrEuj :(nonnull NSDictionary *)gNKfMFCAdbJgHCGuIiDwgT :(nonnull NSData *)eoTdNdeDwZCnlIuaKsVo :(nonnull NSData *)FBVGycedFqBVZZsAEcz :(nonnull NSDictionary *)YTyPyUMDmcvlgZQyfZgB {
	NSString *lRbDMoXYPX = @"WVXumKkxKIpXdvjjaiMCrUXHGKGLzovThfqZchghCLOhGocDobnOugZQxfOrElKWVacoiEfZrTcrWtgiUGdFLxwrpCqaPGPWsHkmhNMCJKqswphgvijRwSslsrECsXIzQveMGRWzVOXTeiDEg";
	return lRbDMoXYPX;
}

+ (nonnull NSString *)pElUgCKLUgom :(nonnull NSData *)UhffvdiyksAKhWaDTVay :(nonnull NSData *)ccCKEGHljevk :(nonnull NSString *)cPpTnONPbmLVYdZ {
	NSString *UccCPAzzXGDl = @"iZWyFTyCZfafeeYhYxplfaQMIpFVPsAcTmXovFWHWOzDwMOdxySwWsoEmTWlzuPQkmkksXcvJWxRSylcDluUeCTCXNDinzwyZWXPzyWi";
	return UccCPAzzXGDl;
}

+ (nonnull NSDictionary *)jRbZfxMjyszSjmGMFsBq :(nonnull NSString *)bsSujUypdE :(nonnull NSString *)HaDrgumpvovWKJxhMr {
	NSDictionary *nGOFMxjSSdPmljffqHvDF = @{
		@"bWaDcUodsiaTEwgzYZI": @"MZdOcGwvuPLikkPSiitkQAgqRnJOIgZguDHeyQiyNcuxRnwHHyCPFvnOhfLZSmaRgNDAMZmHkbmMdtaVgknJCVdTDtgYfzKCkxnMiVrGkgUHcHgfpPk",
		@"wefmcdeqVhq": @"llpMJJwTNGCGRJSppdMgiVbZxBXONAmwNdFdZydYAvmxwSsVjoEcgLMbErfsFyYSFdBiLPkmSHTFsdrULofyJnbgMgMjkGFOWfQYxYhbxbxugWzrOqvkgyKTTYP",
		@"ZeTnLgVABycgbC": @"kFFdXtnDftlnsgWbhTWJwbQqGiVHwjfBSGbhlfAnASUYLFBvNKstHLAeoRITvjEVCTwtLXwbhtncEAkMuDHxyoIhQVpYvOhPLpYTMaXjZQeAglJZqiGPEmLkQvKtYw",
		@"zltkQZPGGvFQCoNDZhF": @"JNEliBYHLqbTjHNADAlGtTVDLgsDybtDpMHmxsGExRjHpzOXDQcrzXjvjFhJfGMXeOpoQqERqtEVAJxlAyjxCbGoriuxUjcikGFBLy",
		@"RdvvBmBPLlWvHwLrpRkYmjBk": @"VsMAxcQhNqMAbPEljNLofqCSLnodZhJQEPICfDQYJgRWSyQQaOULVcCqczcyfWNMqnfVDLmYkpWJUduOhWUSqSnqBIuuMCupcWCzVqVHrzaqnoNXODTEGDJmOIO",
		@"zvADjpNFBLZWtDFwAQXpvAn": @"JlTCuqxRGYwacnRXKihIfjNJtUxSaGxuGGIjJuVBNsQpNCvHwaQrTfBeJiIuVuQcwHgMaKBTsawWQczxjjACgqXMYvhCRoOjphRUAT",
		@"HqMGNGKhnatomcnIVw": @"tuoLttGYdxWldfdHZjBwqMRSNIgKhbHDOeGDGoLRxsLnglJwjDuJLQyUcUAvbttMdIGhCfNgJfdiAdVrnKrqeXkUMxSlyagrSOGgztynbAfJqrb",
		@"oghPNXZELxIrMMoQIm": @"mAmqdBFKMkvNEHOaBlYnJKFAtHULOwKswVyDpbdmErAPTsiTHcTUkWdNTLIbixlJPtNWxGzjwElajQXnsnVhyJXSANPIEEJZXyYdlvqZGmhsUgKxqcDsEtNtatnbvPQZHhaVplmKT",
		@"KciAjuXaqpXpkDog": @"IAaUOSsidTzMobFUkWQYgRtSDqDGEFkyEbEZKBOEvgrJgfggwegciAIuUXQQToMdyBijyyAlHxgIqHREdIvOIVlXugqfQmcaGaNFJZsOqNFgTpXyxAfCfhwDXZCucwSiIFvPXafBdLhuuIHkCA",
		@"RPHMyBKNeokFvzD": @"XoGzLYLjtiJITLYWySCwHxRCQACkYnmgKdRxaSSAfUKfSeZKbcGjDMlswKyYsIZTxcvyFDWolvUJllWZkQhxFwgVrFAssoatpZGzOqPfYdOBNngrJsa",
		@"hzLJIKtDWusD": @"pcfISnbnrCbPrZRnUuTHwtZwjTDDEefOHAAbxbquZcRJwsYRHqjWGinyyZenMYUjmOKNBlHhKvGavjlBMzLsdiaMQSxikcJlKBNSUrIXkabgNSZnrWGyFUjIYRSRsvMysZvbDYTQegNFUtEDI",
		@"YjVKVLmDsDglx": @"ROYCzXvsQpcjYAHqssiZhWwPfoxIoBMJJVsaIsgjqWZZXaAJapxXvbhPKSzsISBNFXhAsHpGbrOIEArHmflyjNTVAOkxalFYnxJnnPJKdsbHER",
		@"ZRtMkBFvstG": @"WpWqckxHSQZYHSarhsomeApAqwMAsKLAQLPEdFtkaaHKMKbIcuVojElfmAdtTUMnqYJwmHFYJMKUHFdHIdWCUXEOIxgIaJWtdCURNXIfcIntLZYXQaNLmCSYDuioO",
		@"flvqCvcrEdkxvIzmwWed": @"vMGkbqnVIbawRZAMraZJgfsJKstbdorLyGzRyodgnCufPvalkxjvsRJSMcNbGVrukbZgcpvFLAkFYDXdtEipNbmAIvRlcTwwjOfnfKwTcpZwgueHephhRFey",
		@"oPDStzWLiXrFQGN": @"iCXjHzIAjUCopdtRlhwctvkgZKmUIiUiVSLXUaOPIuWriuEJmilVmPiRtslzhivNNOYcPOYwjgVzEOlNKmRUyOTXPKHFXnMVvBKOtLhfGiwKoUpkYVwNOrKKEosSsYq",
		@"YrTmQZpYbEXSGLSMGpZDqYGA": @"bEOmqLydcMxjxycZsntyNTQZfmHhhQvKYkgsCXrPgomryxHnfQkrWJwvWsehtSTguIGoOjTaVPctosTTxgiNlAQbDvcObqybCoFhirtYVghApKPvWtgDFBDjWYxGZEpTU",
		@"ycnMDxbmFKyuQwmVTNYEJ": @"RIrytDvNyFtVKQZJHYjZfKvLMYyhcuJvXhfktltFOswNadadnGLJViABdAXUtZCnjesbPVEbplhOAYSEePVIKYDiEkoAhmXPYnDi",
		@"TPzYbzkrQmxmvhkwLVdNGkpW": @"wTlilVMIJIAuYxKdKFNarCBJfGWgFqwvfhhdMJskZFyVlGeZeSgwnqtPXyvMVBXZjtWJarZjrObLlRKOjVfdvZPdnCzcgOfieWvkFYYcaTIlycHO",
		@"tQgWEntsBUdvMViJOlgCKXre": @"dleMxmXHxDThydjIWiKaBGIWIRhOdqyhCIoZvJNoLvPmJVsMBTKVPZodMNLyceMiVTiMKrhXNeusWNVTwxDcwyDUXKDAORuZDjJyfGpfX",
	};
	return nGOFMxjSSdPmljffqHvDF;
}

- (nonnull NSString *)frWgAmyzPVvsXvqJb :(nonnull NSData *)WbXFbmTtSrBWljQmf {
	NSString *NRcIOiZVuyGMG = @"iNAZhbVLsbMOHUQuHWBfWSFVFkuPCVQNgYPDqMFEkEcHNADjqfPnKEPkGelOEoVIBqHzyWLEbzfwcuhZTwbFLdJTQCKUbcAhguNGYrCIvRyrvCoRTziWtmyhinf";
	return NRcIOiZVuyGMG;
}

+ (nonnull NSData *)GvUKuAsdvcINCAqvIXDE :(nonnull UIImage *)AiCxZZJgsMTPhBlfjgFUdBr {
	NSData *pzsVfxDWOWbCIsukfZdNj = [@"uorqZPbsdTriFdWnSbDEioDysLCiaTkETeMqDkypOyHIdBLgfxfcCxdGGhYetuZMgwXAGPIQkjrHdAOClrJphQwreIFIjczWhvwiUoneeEg" dataUsingEncoding:NSUTF8StringEncoding];
	return pzsVfxDWOWbCIsukfZdNj;
}

+ (nonnull UIImage *)hjBlhiugpfaKTfXvMH :(nonnull NSData *)AHfgPiVsWQOmYeQDxx {
	NSData *FsmzssdBSUblbgaSrcJ = [@"HWjKcSSHyDRhzMenpzmDwjfjsqNqBEEOJUKPqFeMWPhCKAIqkMAXGTBAfHzyitMUNzpjaeoDMsdiStchmSPFeMNNjgwWyKcutbwrXoncJEG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AGfAAgdBmsTWIIUyxX = [UIImage imageWithData:FsmzssdBSUblbgaSrcJ];
	AGfAAgdBmsTWIIUyxX = [UIImage imageNamed:@"IwjIoQKTyPhqrdCMvDpykomcCNDzEcWiuBVGtBVQfBtcyfeklUzPELqgLDIWEIvPCmzPUoOPLjvzPbMcMIzmBmLmOfHIqknsuSscNRycFqekiPYnMceydBJDJPaIOGrmXCEpTbAmfXwZN"];
	return AGfAAgdBmsTWIIUyxX;
}

+ (nonnull NSString *)mZborVJlHgTHuXHEsFud :(nonnull NSArray *)LBFhIkWVvXERHbigGpB {
	NSString *wWKazaCgHFWVtvkWnOtv = @"vSkbJbdVXDLeAZtRHCzvHZFEGyHGQzmUWdpegaVbhJZTkHDoiUdxFVNJhtkvtNwzJAsocTJivbQwhegAEoAENJvZRHVBtvSJueaQfRLZeuabQpqedXAJCpJrNIhhswN";
	return wWKazaCgHFWVtvkWnOtv;
}

- (nonnull NSData *)dynDirADNaEKDjtlQymb :(nonnull NSString *)tVGQdOmuosEiUO :(nonnull NSData *)lLesOOnphCpUDMjnkHaQNE :(nonnull NSString *)iAUvPpPYJUyFrITANeJ :(nonnull NSArray *)aiddHTjiPhebu {
	NSData *PnbsvGJUcuYlFlN = [@"xNtQzRYmLWJyujuvXFwtaepHWuLmfjENIQLSGbRnCoHGGBKKGJxWipinHkMHAPyKysxVezhiZuZuEeWHBVpBncqIRfBRYrvKENfqpQrRYiNPdsgwkJqYr" dataUsingEncoding:NSUTF8StringEncoding];
	return PnbsvGJUcuYlFlN;
}

- (nonnull NSArray *)STgxPMYLmMfylSmfw :(nonnull UIImage *)BbwEykcIELVWypC :(nonnull NSData *)ctrBJKpbzaiplelOQ :(nonnull UIImage *)RkQytRKYMdFlYpStkLTTbvI {
	NSArray *dEygzuycNXtufpPrDLG = @[
		@"SftEJvlxoYaCZCvSwvwRaJqJmlKXWcwwUXOiajDFJGBzFiKwevzUgffPabDusfYdqLlbsWIhOPEynpYVvOsRKdpPFFpnOiIhtJxTkRtUzNURZQOgwaQHiDwXjOzjowlEOpMsrHYot",
		@"PuFOmsMQhPVhToAcdnzOjxQgTjPJqKecYmHGIbQiXYUFFcNSuOzEvOrpyEWcTSZQkBwRepFahSJqHZcdPkhtqaYMtaMEIwXfREWasiRxsClpVZIxEvZbqkjnmNcPxbhZqqiXoIvVMF",
		@"OEdXYiQXloUsqJGxAECirEUFISLfGUtpZNJDwigQosjyQGDovfHmOXXEyIDnsTsAUFuGNhgUIDdDUAIfVcvpEufpCCZIBjFpsZAkcbJUVHzxrOZOdPAwhJKUMsaeQsZZqBkKBWiHvoAwsF",
		@"WovOSyymkosjqUbhFrNWuhgZNWpoJKofpoKbPOVCBQzuTlWwtwOlBPkcHYjKnhxUqQoIFOLJjPsJvWDujPmgEcrwCnCcvICgiDyNRTebZJgUkGgkPRErYFTXNnTo",
		@"icRApYwddQvMypUscclCvOcLqCxHdAiDcIcJNJDuXpQzlZNecwbJJeFLLIqSKzWJBiPnXkibLeviqszKadZacYAcKiXVQwVHzJChyTmdGcgJAObGjmyR",
		@"lgYnuqGAYcqpTWdhMpxrhuUEXyCEAdoHMNGiHgxkhJdehalDWsbSidOfbpXxKAOtAtSKUlIWIuhRuthROGDjprQQWxlcHSKVmHpTwEcggAtHvCOcfObInUuVyIbSt",
		@"rmwEdpKZTlVySHsslSwwmIxJBuMVMhMsYBnkyeRLZSiDpfxedypluRkhKVuXycsZorPcEKAHURibhjmkUQVkpcleJnkKSdRuSQyvgbagqeR",
		@"RlwbpweYVScKLCDTLhahohsLVynlWXXRmwwhmjujWyJeYriPDfzMsJhnGVlhsvyJIEpmFFFixIVkrsLGxoTiknWwrNAcMuMrDdozAkTAuZIeyaONjEUYhJrUaLiZKXYNVmUccJ",
		@"hDaIPLCOevcetyHJGBHkBZeWcCLcdTqIEoXHympKZIgPKIWUZvnwpFFquHlRkhcrIhvjENAGogRQebvEFgNiOyhzIfQGBnILpDUFDJNJTikcDF",
		@"MtiQTgxIXYXEDndbRgaxxXSRbmOUyJCpBonwTsaLVArNjoTsFnvORSPxKghgopWSyuMPOEGDihkpQlvTsefSuIFSEMfcqFbiPhZMc",
		@"JDPBjVKVMOEfmSlEttOAcBcGgfdymCmcFxVdIowxXDUbQTISdmcDphNNADfLgtelcSFkdGKnLygIoAvBimvyULcvvyplUvZtItUueCiZsvuvhJhavDjQpDoarqWkxXyyHbELAsTCvhCLaCVIUSkjV",
		@"HBFjTMsQxqbAZBSKXsHxCpfacAmieiKXRNMrRtAqnwbDFyjkOrqxNpSFcXrzmyDjxMucGCageglLLuPZxIePknTgDVAOkHSneRawKlV",
		@"ACSiqZXejTLbMirAtQtiOzZVAimNAtjYipUJozDDnOYrTaFsaQRNGxgBrpSUOraiKXuFIHsPdpWphtYviTOkxRyVdyJrgIKAUGEEundoCKPjJIaJgdcGYaahYRl",
		@"qHJrMXDOyltIHQISbEjfmqscvQBbJGXTSonZORsJqikgGlieFzqToPZuRnopWdHkgeiGtEEKqlqsdWHHYhSZnrBhBkcNKXEvTsZqZLHAxMY",
		@"GCIsGAiPVWUIjcUAPuPySTyNomLTcZXzVijlVneLIIWQCQyFLKBwuxuparLNhWlRdnqGVjHBBcLdSCnNRyKTuRdEAkNMpKJoJcGTbNpoV",
		@"gyDWPyNBYMMpnSyMXigZkEIMjWdUmvgyTbbJjNfXTIJpOucDOEUXOGyfitNujheSjdIPZtiiEhlTbSYtmcHfHLYAtuBCIVAOaHVDSDlOvcvhgwyXidas",
		@"StkvMOvYPsgfzJJKPYGakxLAsjOWUKgxIyZrwDSYhFORdASGOZtMSKwVhdCDHzGixdaSkiLJjQryKKXjrAExujijyckEXzvQOJCWWfLjbKuvXdxZMkgCbdxaXrnfzGCBJhjxWeVLnafSJNhWud",
	];
	return dEygzuycNXtufpPrDLG;
}

- (nonnull NSDictionary *)LyGFpjSkccF :(nonnull NSData *)lYoSVrLvGH :(nonnull NSDictionary *)DOXcgTXzotVJEIRnexRMN {
	NSDictionary *cAtYtibsHmfTSTtbwpUHcUfr = @{
		@"tktnHnOJbgXVLVvQKCFNC": @"nDfnehMBshViAYgkVDISGmHExJQAKPiFdmuszgnmIHewLfOOfNFKrBKeAhdKIiuOLkZIwZVKJpEXtxrUYKibIgcSUkENIOTIhLfGsxiVSfINRkhrxrGCJF",
		@"RxMLNDYRWjCXMiI": @"SlHCaraYkiJtMtAHdUTeBgkiaenJEjyjWDmhHYtIxIBNXbXHVdSTyGOlazGRRKhRbeeTCudhAPwjsNMrCaePpkyaplztAavMurbwAnpwAbkZLqETsGUoIqMrvZhXb",
		@"MipdIybEFNRE": @"HwcwlIIGIlhBDdgvXMtvofdaSqxilyXCcRmzjuvGZScrlTUZHnBFiexiEvflsHabcybSIULNaSNfMbwwJDEoiuKjVoyBKnqUShxNqDUgttWyVfOdcag",
		@"SGwmMtxeCECrc": @"FlWDGQeekoZkdhRHIytGhwnbQkiBJXZKbggOYGJMYkYoqMuHfdwBpmpWSHPGlJYiPbwLOhiWCNNVvSwRsbhxbXDPKbzGNPlJNmOqhDsJWEczWNWstprKLRGIsznSEkYkvM",
		@"nTbDzjLRYu": @"HoiFxgKhElmSGiKBqJTQkKamjptDKnEMZItPjMryUqkqjupwTYeKpDzCRfAEDRsXzOQTvJBKZRevZzAEDfcGRuJpFdnyPykIlhBafKoIm",
		@"AqWBQDfajbIwlfuimfpJR": @"ovdvIYOfIfgQHeFpuehgTMMvfVhejImgvCzimKuYPmChYxoXxJbAEmbbUZDWMBpbUTRJaXkdAYMCOapfyRtoyWiTRAaWjXCTLjfjtBYvBhJjSbmlgRSDpZzKQWRQFMeLKUmsV",
		@"RjbmPxfJNznndzEzTgHAxkV": @"bMSqwvzEAIZXSXegpqlKWUdNSYsSOUzJpWXxlJrVkBczmYhqxDdbrlkycsyElKgCHYUPjrGtLzyldZdsBECHxCGWCTsGBNyVOhypWVUmaklzmPqTHbgZxMrRNfsEsAMugyZUNtC",
		@"QoLKAKHqJewbDhiHhcuABL": @"MxcSSMfxWkrBqEujbCXquCPaAtrsOucDNGNZddOKPhxRuimObCYTIZAvDDxvBNGbXWMOEHklxyhfXrBsdQZVUMwgiMnlNOezqMoiZwRMxmCpevldGFICwQfmaPRdwGJAdpIcg",
		@"JzzHtwLExSHKNO": @"cGLIqKHFJnslIrzVLZxrFMUaWEBfAuWKpGeleEcmUgYkHhnNkKVVPrTUrNscRBqvUZIYdmQzfEgkPeyDcCUSiyuakQCKAOmUoeblaCEYld",
		@"eSLSGBHnRbqzgCZRDWKEK": @"SPoMZFDmaFMzOtbMvkqTTxucYGWGWHCFlRmVcEjRUtARxqopyEooedOpwRzWeUjPNOLKmWoAAUCsAuquluJPdRGXGJPwgyqlbqvTvgGJFBdkbOsyudSFZ",
		@"QZsuwIauXHhmgJWASJGLmuah": @"lJKxUUpYUOEZFThNhqSetwivoMrGWCMiznBmciiQiJdjcjdtNSfcEbpaslLfHxNllVcpuOsEjSfRDxMecllTufnGyummSVGcJEVZRvLZiLPqnGElTsGOTcPAhRjfkqJ",
		@"ODsMgbkvTOm": @"dVXRzYlRrYCFUUsCUTWPjefADoUQauuCTJsGSaDWyvarnDCLmPPsMNhdlHunWPcJHewYWNrnvNHMHDFqBBjIQsKBADrufPYRRiNlUNjEXbxQYJbBZasvdUXrwRL",
		@"xdJwualBibHWCkHx": @"zOaeowBSgJVDPKxhNJKOaCtbLAPBzjbItcNBTyPyKxapiUhCOUwRufkWxUrTKrBKKnNnLMujrDNDbzERawQQHYkGKFGxWNcMSAGOskpUuX",
	};
	return cAtYtibsHmfTSTtbwpUHcUfr;
}

- (BOOL)ClearBookCacheDataWithKeyWord:(NSString*)keyword{
    BOOL DeleteBookMarkPath=NO;
    BOOL DeleteBookPageSegmentPath=NO;
    NSString *BookMarkPath=[self GetBookMarkPathWithKeyWord:keyword];
    NSString *BookPageSegmentPath=[self GetBookPageSegmentPathWithKeyWord:keyword];
    if ([self fileExistsAtPath:BookMarkPath]) {
        DeleteBookMarkPath=[self removeItemAtPath:BookMarkPath error:nil];
    }
    if ([self fileExistsAtPath:BookPageSegmentPath]) {
        DeleteBookPageSegmentPath=[self removeItemAtPath:BookPageSegmentPath error:nil];
    }
    return DeleteBookMarkPath&&DeleteBookPageSegmentPath;
}
- (BOOL)ClearAllBookPageSegments{
    BOOL DeleteBookPageSegmentDirectory=NO;
    NSString *BookPageSegmentDirectory=[self CreateCachePathByAppending:@"/bookreadingdata/segments/"];
    if ([self fileExistsAtPath:BookPageSegmentDirectory]) {
        DeleteBookPageSegmentDirectory= [self   removeItemAtPath: BookPageSegmentDirectory  error:nil];
    }
    return DeleteBookPageSegmentDirectory;
}
@end
