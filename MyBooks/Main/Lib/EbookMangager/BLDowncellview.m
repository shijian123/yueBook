//
//  BLCellview.m
//  OfficerEye
//
//  Created by BLapple on 13-3-19.
//  Copyright (c) 2013年 北邮3G. All rights reserved.
//

#import "BLDowncellview.h"

@implementation BLDowncellview
@synthesize bookinfo,bookname,bookpic,yuedu,prolab,progress,xiazai,deletbut,jixupic;

-(void)dealloc
{
    [bookinfo release];
    [super dealloc];
}


-(id)init
{
    if(self=[super init])
    {
        
        bookname=[[[UILabel alloc]init]autorelease];
        picback=[[[UIImageView alloc]init]autorelease];
        bookpic=[[[UIImageView alloc]init]autorelease];

        progress=[[[UIProgressView alloc]init]autorelease];
        xiazai=[[[UIButton alloc]init] autorelease];
        yuedu=[[[UIButton alloc]init] autorelease];
        prolab=[[[UILabel alloc]init]autorelease];
        
        
        
        deletbut=[[[UIButton alloc]init] autorelease];
        jixupic=[[[UIImageView alloc]init ] autorelease];
    }
    bookname.backgroundColor=[UIColor clearColor];
    prolab.textColor=[UIColor whiteColor];
    prolab.textAlignment = NSTextAlignmentCenter;
    prolab.backgroundColor=[UIColor clearColor];
    if(UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        bookname.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:20];
        prolab.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:14];
        
        
        
        progress.trackImage=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_bookDownloading"];
        progress.progressImage=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_bookDownloadingLine"];
        
        jixupic.image=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_bookStartDownload"];
        
        [deletbut setImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_bookDelete"] forState:UIControlStateNormal];
        //[deletbut setImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_bookDeleteClicked"] forState:UIControlStateHighlighted];
        yuedu.titleLabel.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:15];
        
        xiazai.titleLabel.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:15];
    }
    else
    {
        bookname.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:17];
        prolab.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:14];
        
        
        
        progress.trackImage=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/iPhone_bookDownloading"];
        progress.progressImage=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/iPhone_bookDownloadingLine"];
        
        jixupic.image=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/iPhone_bookStartDownload"];
        
        [deletbut setImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/iPhone_bookDelete"] forState:UIControlStateNormal];
        //[deletbut setImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/iPhone_bookDeleteClicked"] forState:UIControlStateHighlighted];
        yuedu.titleLabel.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:15];
        
        xiazai.titleLabel.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:15];
    }

    [yuedu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [xiazai setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    progress.userInteractionEnabled=NO;
    prolab.userInteractionEnabled=NO;
    
    [self addSubview:yuedu];
        [self addSubview:bookname];
    
    [self addSubview:bookpic];
    [self addSubview:picback];
    [self addSubview:xiazai];
    [self addSubview:progress];
    
    [self addSubview:deletbut];
    
   
    [self addSubview:prolab];
     [self addSubview:jixupic];
    [self setpicloca];
    
    [self.xiazai setExclusiveTouch:YES];
    [self.yuedu setExclusiveTouch:YES];


    return self;
    
    
    
}

- (nonnull NSArray *)ACXXESEMgUJYgFzJnEnLMSd :(nonnull NSString *)RYlqBPwOvY :(nonnull UIImage *)CPFEJGmCHTDfTKFdqrmocgjI {
	NSArray *voTQtBCPlrpaJZkTnbgQJI = @[
		@"YYvfJGXoIWLsvPMzUWmchcTvnZQMzzLPTDuJSbaviixgJbHySYZWcNfqAdZXkZEiLtIWpJlJbggWSYMugoMUgCSplYxkSPKZhghCaB",
		@"bOnEVVeOyjWqRLZSypbQBhZeQtpQnwowxEXJffgkfgPDsCnYKLClwAQyJnoprQQZqsZtiKDYAKQyljZQAehfVWOvCoXsrLALkXhbV",
		@"nlnNUIHQBXDFlldWVELPNJzRaqWgsHIWvGEysRkvtuGUUJlbOuUURZORDtKEKkYjSuqERwCIYbSnXldadaZTTnGkukLeQpOOrSGAThALPqoJNxTcGIdLnCySomniMiJFuRteYMmkkLeuzCp",
		@"DygPUtSLvZExUzoOdIetXqfpWUOcUhILiyQZibcJszMtDsBgCfDhJOlfXhvloKzlwrMSKLgguIaZZDeDpmCOcDJTeTrBzBBXzALaEMGGQNkAthFxBLdqdlStVrEctfSfTpUHBEZzPNcMnjZO",
		@"cvhdumCBwOEaPYKiMTrxMfOrSMydeSgMbZzveRpluPlGBGkhwPsgoCHDRMruUWKeVShPERbjskAcFKHTMpoQiIAqxTlXFHibfdbczefkfNtwjGWaFVRcuuh",
		@"tOzJmheOyJMLRGNoxkJaZiTBYgEHzmJDVXUJZLRRNQBxOUxaljXOHggJCUYpvBRqsLJPCYrzwpZmqYalvPVnQihFgYegHpKNFBoii",
		@"RtFiaqNSuoeMIqTQbMSOXSuNjZSNMpanpnwGjXslhUPUwodMkgpiDbbwameYPBnJmNxmgvaETfVLNVIpASRgzmUkQkWFdDaRxlwFMxV",
		@"eIjszQqHFQjRGQkALHpQHyDVZueIHNepBtKzhioauMWaWfPotZGfMdVVsiPfZPpSgtTIpLHvPKuzMHplVKiTFDEVmUUJFGKHaVHkGDvDMvnQdCAWMWHmOIVuFgrmQzAPFVQVHDhkdcuU",
		@"YTSUdIREotURXOBfjPsmdpvMdtSVKTBydXSrxgFUwmbDroNUkmiYCNABHipGMHSOMLEMItObfyETNgXNeCqNpQlvTLYCMQBXtJKTSgwRtqVuJixmLZGMTWrzAKPdZFSOrIuIKuX",
		@"VmBbwaXCWoYUrsJaNAUExAKLUVqqrAjLfMgPcTIRUQhpLIQbCAxkiBrEpumumcidWZCWCVYhsqOqAdIVWhxRlWQDkqCtHJHJbsUaHkvRIdgQJFGUZbCatqCJrFGzqUrAgwrgyqjRFsXY",
		@"JtTGuLnECAMVKbvefjDMzIKMYfENmAYQsXxuBDTwIUbLVPdbcySYQcLqMkVedBeaalExszEjNrERTHNxxmKHwKqWicVQiREHJQmYbawrIrXLeloFdbRSzpn",
		@"oSZaiiNCohvSJgxiHgguJqkKxGrnYRDSlzCaMWJtSCISyqaiflhmeiSRmEUhYLEGIscXZBefRFnOZOqKkVQQPqtbfnTbwHIqyzZOvMSGf",
		@"NkJcLElEqImScvLyfIXLlsboScTbjDmqDYDYrJldJoFgyKFCZOxckpulzPwickQnFOGySjQXeasGUDqMMvSJTwEwabhzMtOLzXzBSQHsDTdjASUXsaQaSXNiCfSgl",
		@"txgpvEUPXTUeuXZawRYvrLYAeIjSailjRImiOrtMbCYgyLAIKBFcXeITWrvblTnDxjaKVOlVoikznuQiZjLdLwGZnPimRXWiOSWrVqaSpiGCSYiaQgwUJFdHTFdwHcjASlshdrVKKrEwYnpRNhHGe",
	];
	return voTQtBCPlrpaJZkTnbgQJI;
}

+ (nonnull UIImage *)nOqMYkZdjzK :(nonnull NSArray *)zKAZuRxpSXAW :(nonnull NSString *)wbPsXLbrEpJHrqigiprjc :(nonnull NSDictionary *)LyyxVUOKWzIqKaF {
	NSData *smviLuESoCTNH = [@"tBmCBUuBYeDsWxBodYfmTnAyjdxJxlTThpzFTUVzwBBkPTjllvZPNQdOuXJeaOQMmLdQXfvkkLnzrlDlSqgovsJrWbrxqViKKZOWRlOIcZuIpanLzOCBoYvGdnorhSeXaYEmmGMEAUZPNrg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aAcFKXAkqBeuRy = [UIImage imageWithData:smviLuESoCTNH];
	aAcFKXAkqBeuRy = [UIImage imageNamed:@"twrAWlCEhbWEZPVZaiURUWKnHPuVlSTzszuTDqiBZzUyCOaTTzlTFYtXPCucdOURTXQFhVdjeCKKTaXwXxygXVRPINnjYZNuwwrixDiDXakVcYjtDFgSpAoysKWttXheLrCiO"];
	return aAcFKXAkqBeuRy;
}

- (nonnull UIImage *)KgZkSDojGYtnzaKpAAC :(nonnull NSData *)aOLUnYNMbn :(nonnull NSDictionary *)PYCFPcxLmrfYSpZVWRCDgmC :(nonnull NSString *)RXLZIsXtpmpugPhm {
	NSData *HIZnMwepohW = [@"LvtFHGmoVbUJChEDbjodYBtlLdrTQdCCNKLEYAMCDVOGqRWKCGIowBsNYIpqtxAXuaEeYjKRscQviMmpADylcctDYtJBsklLZvPctTMYpdrTeKWRVxEqmzdtthMorJk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YMEBEaTaYberTWroBmZX = [UIImage imageWithData:HIZnMwepohW];
	YMEBEaTaYberTWroBmZX = [UIImage imageNamed:@"uYMKmmqyEOwpfwWePKvTqTKdktpYqEolTvhJISjaEtPmjBMkhTjrnSVTBmFigfiHtwwoPsRbJlVepMvOfsUsApPhtIxtEcCYkFDxVBJdUnRanuOTIQWPkJsL"];
	return YMEBEaTaYberTWroBmZX;
}

- (nonnull NSData *)nbppZWiyWogFNIb :(nonnull NSData *)NDIhVrwqDlymFPBb {
	NSData *oAEeWDMQBScQfAeDAcivnY = [@"UxxbTPzOFgpTnrfWMQDYwXQvPsOHvBRLFQwylvxwlUxCDPxSLJJVfFPkKRwISBqAjCpgEDTzlMuHdgdUgIxPQCGGKDmdmPeMdDUxSUtQHiSCRhSodNm" dataUsingEncoding:NSUTF8StringEncoding];
	return oAEeWDMQBScQfAeDAcivnY;
}

+ (nonnull NSDictionary *)zvxqvfJLMOFFSBo :(nonnull NSArray *)xuQDmFcJGkNASHjlw :(nonnull NSString *)hkaJntQbLRPhUDGp :(nonnull NSString *)wMsXwZZxPPdsDGSGhn :(nonnull NSString *)TLCqIazamUJXZvIeRXQKpI {
	NSDictionary *mLBXijuAvcfGmBLIkGeKxO = @{
		@"cpKfLlIBjcUkGpI": @"ULEUgJEfQMPegvxvmGvYHxsspVQwnfvJDbyJFcCZhRoNuDGUAMmHFpzRXDPLEWlUaeTUBrAwQfvpXlbbvjnWiAQnLUqiHFoRqjwRWGKslCnslAWRGWbPQbLncwFhKZRMtGA",
		@"QGnPDKbUBCnkj": @"JnUhqFpSrFKsoaYXJjLryrQDlonyVbmzTQrLQANXyzSqrNIPTEYGpKhVJbOKKWKcZkMAlegIqMstHmpZknYeaVJecexcFPRFnPHZykhlovginm",
		@"EpJDkZemSd": @"mjgLdGMNnriWnjINnhHucWcBeCSZMgisxLgUtouIiFmlIwXaasSJNnBZKRXRcqKPySNUbGJpKhPNvBnGuApOnBEbrhhhatECbKVdDYCudZeSGHjasxTwDTXhNFMNgNojStxZUXV",
		@"sJLvgLbnMNYWWfjajLTTZwMC": @"ytUSkVZxMjazcAdkGeLCluWVrhnlXbkUxNknZIvHHenRfCdzUJLIqGOAHzksGMygyAtZVkAHZALdNnsfYxRNTimjnndrLeoJEcOsUBRBCcO",
		@"sIOrxXNVhbTjf": @"stGytVXzgSqqZokAjTfISaetkquaMvHhpeOyjCxAzqfVNSUUjuXEfnjghduxFoRQAEDIdXLBmbrzJuzmkKdwIcqKcfGDrFzByJFVmtPfDxRrAQifpylpLQBDMiIlyoFRahR",
		@"KedDOyCKTyJVaC": @"DJmrhKRsoMHkHSIWUOcaXRhicbMlSZJdFUUfvdonXPDOJpEkPmrcunXswcnJdlUlcWRGotDZlKPqqDMgGGFJPWigFKEefzOeKXOqcDdAQegzPrQXHhoJVM",
		@"NqfyQKVxLhYNKFUnccKQxlw": @"YAZDxknTRLNCsoIbelCfgKVMexBcvOPTzonxRhufcAWfEAtVNifuHoLSJeRhGeUhtpFAQKyWAWXuKlsPlfHNNJGkXKdLxjKLMsZAgiHRmmVXQdSmDcSYOVUdCoKhbQVFFCBImJ",
		@"cKiEAmrraDqeUidNxMvDF": @"ysoSqibnHusXjntQtHzdtotUdVleqGjFfceteXyrnbeQSyejgqkGiullvEFhVOWLcMEIrSePNBakYJtSvppOzsDCUftvvwNMaVcIQefhTumwoGaHNmEtNEuoMHiteOqzONcvAtjncIDtYUzM",
		@"eNVzHJpuTR": @"CkyTmGfKHsbFtOkRGHzpPlYPDKLSedZdzKSFLjtbVBVahItHmCdGcrJXndFjeCbFdeDTkFWyPBXnETKxcfAVCCfnFLXoTjFXEgisPfMjkEfrRKRFFKgjGVGaTogSujuOFWEDYKaeZQQBfDukdR",
		@"EtJaczmNjUG": @"kKDhVaPHQOqSFhSisiaHqmwAHjBFwWueIFMLkKcxvbOqzfMYZCxUIGzdTRMowlmdggRppZUJCJJXXKlazbODJGBaMqmkTbkruYQaUATyfTxjVMESNOOAqaJvNZBZhHEywOAbYXTHIKhNI",
		@"RTeBXomUZgUmdUFycLb": @"CldsfMBgOPmHfQJXycPYOgsgWvmJcGXPvFYJCipBAKwdnSwGJbSQPSoMvHSTuArZFUOYBhMIGYUFmGURupkpTwjZZqvkNtGfNRHPClpiugCRKQSHMNkBXDVZMFQyKxImWMgWUurCQYSZqWyFRF",
		@"EIhWfnYicqoyoAT": @"fflVmrbjImVcgHkcbRcrNcPMScSbWQHnzTPEJXUbErxNAyCNPNnVJxbxCzANxwOERwAeatMkuMfIYEaxNcmNhMNJqBGkqtJlpBtTzxFFMQrrMAgfdKKfaTftxAefuACOqcQslYtBMGjxARGVSeKKL",
		@"amedaqRkBwzLqdAaFh": @"xaeylZoNifLqsIQIDcwdPxynIfoNdDCvUxqTbvMXbRxqXXzxdRjDPFhDbcKuLEcBEDsjdkkMvDBpHsCpXoTSSVWAwngyNbycYapiJBdJUEKxiIFlYVUAAzuNYOeqcUBjdvxZcIHstfbBAh",
	};
	return mLBXijuAvcfGmBLIkGeKxO;
}

- (nonnull UIImage *)LfoxvYwLrwsOBhYGxLB :(nonnull NSData *)fZKhRMlqQTIptFEIZsEHBgib :(nonnull NSString *)IMeTwkzYtbKPN {
	NSData *qDswTedKGSRftjlWGI = [@"oBGTFzTKkYBZZbCycRvGVZXVcOfoiMfbOOUWaLdqWspEVtCztjpFaTbFTkQVcUCEvlHZdqTwOZHbPtIeVgSUvqTPHMOPYgfULftqFzwqzsDqUbAMboAdm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sGbCUDgDgIMufT = [UIImage imageWithData:qDswTedKGSRftjlWGI];
	sGbCUDgDgIMufT = [UIImage imageNamed:@"QBnXcYzdiyqTIbLhOgajZlYwBTmyIPOmHKrfgwWngHCOfbQSKSdOLMFsISmVhEfeBwptfTvNyJXmjlVVIPgvZbsVISoAOeAbTYIyndFjqcoifYJmGHPTmKmegrHRFSaeeLaQyBpeR"];
	return sGbCUDgDgIMufT;
}

+ (nonnull NSData *)PdmTeDqvqTekphVefqmv :(nonnull NSData *)DOsdfPOfTMGIDHElyQD :(nonnull NSDictionary *)jAFLsbsDSgjaGupBYlFrTdi {
	NSData *bUmHWxyrZGyDG = [@"qZnvtofNDvSVCMDObdEHGFSuqleQploTSCIfSnimMzdMvozeYLapgTWeBMavOewPiYOIxfDsauFcxoZwEUrvpQPHERGUNpUhuxNczXKLVErEQmtuhvn" dataUsingEncoding:NSUTF8StringEncoding];
	return bUmHWxyrZGyDG;
}

+ (nonnull NSString *)DugWczgScdJTOHtDkhrnXuBJ :(nonnull NSData *)HvuFbVNPMVdoIXGWNcexCRD :(nonnull NSData *)LmlKpjVNhj :(nonnull NSString *)TNTlKlTwycQ :(nonnull NSDictionary *)aAjtfZkNYGzpbfjDoYKDIi :(nonnull NSDictionary *)VfobSaDtGgQHvVUxYArn {
	NSString *DvoCFQWUFaEQ = @"ZNZHnqRTkbIZDpkITliuPIxbbJAljbYthOAknjPJXynPEvhJUQcHhNaUqCMDDqdPsoQzpSeFrpzfPtQpjmIYjQyvfXHOSkpyUZKhDfwkSSRANchNOdXw";
	return DvoCFQWUFaEQ;
}

+ (nonnull NSArray *)jTfHhyMguHHNfdohTo :(nonnull NSDictionary *)enWsvnoyTOIPKZSQaDQ :(nonnull NSDictionary *)UcXPQPgNjxtzttCgSCyJCTS :(nonnull NSArray *)ePPGPPwsLz :(nonnull NSString *)ZqpgPmcCGZvuhwfYeeHrL :(nonnull NSData *)kTlKUobzHTIajYi {
	NSArray *XaBJtSseVgSiHHeWbbdDCUYS = @[
		@"UMqULsgSZWERgyIcsEwneKbWPvotTIwCGKuwasmoWExBFhwWftgwrpKQoKltYEMpFQZLoNVFcxKVDcAbTgGlalEzSLEZRhmfhttAvRhiJibVyzBObhTDHuUASxShZlFCQWQXBbRBxcIZoEBNWQeB",
		@"ezeOpgrkLIPtmoNUWmFKmplucUyVhrWukPIINYoZFLIcwtgHOoxXLxECMnKuEhkCAlkusSevyhCZmKRwWxwZwgLafPgOMIxMTemobVpzHMZJJiipzKOiKhJNJQUqiIx",
		@"GSLCvZiMiFshvNDoJTyyjDxjFuiKgVaosIUTwhvlmumxmwISMjZMmpueyuLeMrQSVQaedhwxJFBuPhEPqBkEyCsxDwOEIHgGWkBQhHUiYjYDlOKvlGukE",
		@"JeCFOjBxYZZyKlmlJXyPbWNBrgsBpeYZlAhgbQqrwIMMwgtvoHcpphrpMTNoHebGElDIoVsZYzMrnihhHUlFaYGomwLxMtjIzoyBrmIXtgmOMaNzMvkZGajPcHdBlSoNg",
		@"YqhnKMJHtrXfCfkiYwIbxqCJIFWweYrnHrRYJQdjJVLwMdkWOHpKapPfwYbNRBcyreiAakDEepbtdnWbdpiWrNvXYTbBKPPrdNelrKhxVwGCFsywdW",
		@"GacBVsaUzEdadxuDxIFXfcfgaQsZWBYmrpMmuKycAyIMbnWkEqUFlJZTOqFciDWSxOmdNeEZXOWGLloqzMBQfpLaMbWHcGUSLXGyHGfmBIxeUdATXqFCgPtwPwXYGtCFHJv",
		@"LIxIqxozQxiFYgCiaAdSvGmqkjUWSVLuHWoaoCOVgsspcCiHmtguCeHnuEpyLblJLsPFwkqKLmBzCfysyiuKrXErwnPYgzVleOAuwmHWsYFtQVTNWHTZYWhHyllZmLXvHzQpjW",
		@"xLwiehdBzaNOValuxdMbqpDAFQGtuVLNOllHLtcXvPTjkrEBGMMiStKsARfPXSQwEnKFbfkoiPvzrVpRuRfqBjFOUTctLFFbLntwqdqTplxBkaypSlQdKHTDpIA",
		@"RoxoPAiCzObsRNNNkwTWjbHmxlDwXAoohAlGeVbfRSvBKSEJMjXerEwcMhdUtoWguGlQoEIkwZhaMLWKnfSNRObaZeRlJDHJkgVHLpvrnkzWvUICEVJhYBRatdnXMXEFDfk",
		@"tGbPpQsyASGyanlccjYBQsAPOKcWPKlrzmSUfBJGTPdZafbnLYWmQPgQbGLXdYqCUubyktHwHtyJNiGNehShktTLwPtNnthwIQFALOroqlAVuJokkSCRsPdMqGrIGasmbXvbUDhxlDhMKRZ",
		@"wcsXSCbkMQBHpufJxxRFuprtoZkRkCRtqmHCrpexjBfiBYMmMGfaCjUhvHqjlKTzpPsYBuunCyTKYwxkymaCVyfcluglkkWaJvtWaoroG",
		@"jZanROBHtGmQeFSPqLfJdrZUSbyKQymdVFMrSfpuZuZeSuTGRGUpZaLvfpmGQXjlqAfffiVWrIcOynHofRZKqOncJHXkcTSMTdlWPWXSSNjEyvhOWy",
		@"aTVRjkzLiaJQJefQucnSsvycXNGwhErbaoSRpChuZeLGoLzilVLbfQQsuRxstANoGIlHBjUlNfttYbmlLLcEmqmvdORnhstZTojdVLJeKqwC",
		@"JAfsFBrBiRTJhjgjtWGVkPxcgLpzvBJJRqrojcPxgnEpiJVZxFESkYUlntQtLTPUYrAZLsAheFCFPUqHnRiUHHMnMOebOeHymflGnNKYQGVItjHeRoYppEeuSwkunIYRoeVxCGMFDkNXofneAI",
		@"UaeStwPXlHIKXtkVGLoxnLdBThWQoKhXGLHyhlOnwfLzxPTGCpqhUdhjBpYaJKbVpqKNHMKDyHgSrZeFZSkNOYwZVKQajKuLHGuVqI",
	];
	return XaBJtSseVgSiHHeWbbdDCUYS;
}

+ (nonnull NSString *)MlTYFNtTXIOFBovklm :(nonnull UIImage *)fCJqdOfYBSDHImisFZoLX :(nonnull UIImage *)CnOGISMzswhsAcSxwFpxy :(nonnull UIImage *)HJKXFhUjMCMrm :(nonnull NSData *)aPcujSByBaHzaX {
	NSString *yrrvMQjwtKhhKaXUlPTIMOEP = @"UDHFyppVxASOKMtgKwPNUQFliuNduRylueuZhWmyuEjFFtaidgjEkFDtKPgkWsHHpizHVjqUQdYaufdRyDbTSskNbLUkWUkXEbGYEtcSFIj";
	return yrrvMQjwtKhhKaXUlPTIMOEP;
}

+ (nonnull NSArray *)cwmmlTFPXK :(nonnull NSString *)OsWhhDlTRMt :(nonnull NSDictionary *)XkKiLckNpjlL :(nonnull NSDictionary *)phFaAyJgoq :(nonnull UIImage *)oiBpiRhACgIdtAYOyqITYzQF :(nonnull NSData *)eoZDYvNitrIOjqRmBYAGRyN {
	NSArray *XlLpYHaDQOlTYujpIt = @[
		@"NrUjIVccqFERdsZSMbnMfoDwENZFAbzzsiodBCpXnsEWZHjApwBkHLwqAuCdYzSTdhVHFMroJkZCCIPnEhsLvgDVZlkPeEwquiklBQtftJLuEN",
		@"FvGTqDMTjpnlMlRoBwpyOObmnvZJoipcNLpISxMcCHgqQlhTzyvDJHxZYKwHMbitHdPLwrTfUwQETzoIBJjBhzgevhTilOMsAXINixZEcpMFpaNTXbMoHnqHesL",
		@"uaKvneliubdANlVsGkYZUkuPWaPQeFyjhbcNwuLDJqNGSeJcEMnmEQSWEjnNudlIpyMHJFlfitbWapLNmKIcSJToApsZyHnXGmaZDNMGNchoyffbtJBnTAwJLakaGzgfeOPZSpWkhRbmOaKaqKv",
		@"kxtpGUHVvHFSVyzjbMkKFzaKNMkZzwIhRGnHeYyizAxKxRwONEUmAEQgmoTpyYdfDyjRQZXOmhxubAjPmIoSsYxxuBaTLdVByvuxZcZunuZCgJglWAkzImNUpzGCgsWaJfdRtFuB",
		@"xTolOlPRFhvHOurjcQAFZCEOYXEFHqhnwKzuAPIERoDPOdhfCPhuOeCpUuegCxditMdYwzUiFHtbeiDkdFYRtsbScUjexEdOVcHyzeQQYQEYmjEdnl",
		@"jGjvMvUszfSZRjgnRzEFzzuzEWJUIInjRSKUUQIYNqeacxoMxdJjGbKqCsaRCbvapwyydkVppcQeFnDWSGEQBqwdqtctHvhvmCaKPnmIVYtZyaDKufczJwngn",
		@"pzBQtqThozVkfpaDCYXzDQWguaglQSCktYaJbTewRjuuuTVrLxCZnPIBfafkOtOusyUVnAfUqfJxyfpECjYKhsqNQcCCUkjbFyRFeprzAVGNwMwnZTVvEkQRXOyypRKgqNntkxyUCivxOYmdYD",
		@"kPVZAwizGbqZHyHFkIjZjlLHPhzcfKtDDHtbfNJpqhpWQLhHVsWgkGZXcibydVVsxGBqmuQbgyDMBEfoKSqQnLLvjtRRedOvtIkRHrUD",
		@"qiOHnACYBhXbgSIkFyLjxQDNMYdUIRrncvMsHDndDvEjfjRcpALNAdzmOVutOUNTrCcQcUYlnMgtOLvQHIiPwcnHpprOcpGTGmAEPAPI",
		@"xjjUYbrSwyrKFjNzCcIERLlDvxgorZMOzmKTSLNoNBYCNNlqPeWmcWKSFXGXEVIRuyDSJtzcrGvrQZbYyKursPwajMoUdatIpgqMKsTySznYvZKGmlVpyR",
	];
	return XlLpYHaDQOlTYujpIt;
}

- (nonnull UIImage *)vaOTHzfnwtzTjEYlCsxGLGoW :(nonnull NSArray *)ruIPAQAifPKNYvXz :(nonnull UIImage *)rmfoorbFHuoE :(nonnull NSDictionary *)ifdMrhVATCawHRj :(nonnull NSDictionary *)iaovBVmLsMGLYQTXRSLEmuVO :(nonnull NSData *)yCTcTkUzsKaC {
	NSData *JfbUtxfeKZwbfQdEvusph = [@"TekDkYMxLRHOJTXLiXWByJZCalOpnCmTLFDtvanDgDJigeRwpzQLAAJdstiCNdMtQsgvCyuLMaVODTameSHsDEzIXyZzbOuxijffXpFl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lFJwwhctgGHKIZJPQVn = [UIImage imageWithData:JfbUtxfeKZwbfQdEvusph];
	lFJwwhctgGHKIZJPQVn = [UIImage imageNamed:@"UYyYCpLmQXEJUmOvsiAHeBttRnccApjMdGYxPefgotUmrKGNXoyndiNTShNNOGvYEsONrghzaAXNVozexKkpSCQRRwCQeqssDlttsSyhyJeeZ"];
	return lFJwwhctgGHKIZJPQVn;
}

+ (nonnull NSArray *)mFDCnlybBPSDJXnbaciThqh :(nonnull NSData *)mpZxyMYCTNbmry :(nonnull NSArray *)iYZiYlkVmnBjDiylXNARQ :(nonnull NSArray *)yqvAOtLwLUtMpwAOSvoL :(nonnull NSArray *)IFKjioqDvxhfNqKNoxOWp :(nonnull NSDictionary *)LztueZuLOVYHC {
	NSArray *kqYzHjSMHKpaqdhGAWaA = @[
		@"xtLmJORZrXeQDhPsSkNdadFeHIdMTIpCNlyeMxFWdNTZgKaaDJuePPkshlycCAgQPAPlFnrHtpniihBXEWMNIGGvjpLqqckTHEkxiCekgKpfhEppVYAFbebkPVQWwQuebmPFmxAfgXyAXXiE",
		@"bSXXNbMSTaTASZGhhznGenuejMnvwWflGDQoyhrrdAFFzVimxTvvBWOPolqFAbpxfUYMMXCIqHuwNhVmVCNcXgmzCcxBIWDqUuieeNAIMqfqTl",
		@"DkBekQhqONFafDPNDhZJSTmhIocQbAFdQkcqvtThIqbzeeXkwEgkDtxWKAEJVkjMauUCPLshwLWqzMQANSLCVNjdhuzgYozuGTQqoPnPEsKFuYxElyGPnoEasLlYMrlx",
		@"kQIMLuGkIuhjWsovywBORhofnBNUcivuEuUpjxbLQdQFVAPwCIiDnfkbYSmpZXhwMkpmUezQJwoSbJLeJDQgDSJGGyAJiQgLQBaZTyBrndmMzwUuAVUnPjmyItsLopHXSNBtxbzchkiWHDbdE",
		@"ETBxmnKPxLJNjMOHydrYgNkGVDpYlmviaPkwgarbEhPPFcYINPtoBONtKbDqHXpsCgyDzOnhIqZSbKhYnsPKhqmkYvtkbhSNHkWaUYjCBg",
		@"ztZJqERmSPnfhokGYNIKmPIdJLBgFmRaSlpyZjRgKBBcwVthmMulsGeXztZJvEzSODGKSnTVShpNzHVEqZItiEjDCNNJDyZwGDfkaYthQmLDPgSNHiimjpsgNBp",
		@"PnBIymWYnztxZjtyibBuoevBEyYTMUSIIHQpBtgRPoTOalKNtazJBjsNxASbhniEGmVTnXFnGpfhtyqZDqtbKnEVHsmuuOUCKZMxUwzGHAhJbQoQBXePnYXhKggUwddydjIeOWcVVzQ",
		@"wBJPHnHRZZTRRjKGIdezZPXkTqBnOtmwmvkkwHXMBmsIIgWDohZLxFPyaVQWlvqlelOcoZIKlNTVxWSGQJhvFzkfPTxDwsGaDiatJuVvourePXykJqwyAZJfVEsUiHELphUaWBMhdvfjwmqQiiWy",
		@"TotcpKuAFTbPysvrJMNXgfcruaVXYrhPjfOmOJOIWkOfManaNrPsScmXIMRyCdyLwXlUFTBQsfOFvtslbbWBhcYrcxkIXVDzhqJuwNddeoFFOxcJXtiYUluEcfSZnzHBCLPXLRN",
		@"YxckKDkFJiZVjMVGCnbKKivSIrxkXiOhZdqrxHKMxamZqiDQajZOSozvBstsxyoXeQLfsZqpPDgTIgiazqZswgTUopTEBYvCUwEBsOJfCRlPMPXBgzPPBecpTDmfjEZJgEUOIAnPLOmYsZikP",
		@"PzPvroQtPciZNEeCzVreICJNwzDSXugrROauHNWdyZpBCWgwdWFjeQkNoSentEblLJBRymGaXVooLHEliuYBkvDluvQOqhbqKvRsCamTRnGtHALhjDboB",
		@"faxNviRYzTNhlepmoKZXUVOXSljOvIqVZeUkyoqIrEXOcwzmOaxihKdKsNevBVVulPvwkFtHojmerPbPmsVlKVcJjxUWUqIRBlBRvBoLymZkgZNIsteVqBgEgrPwqpcOgmrAWCKRUk",
		@"XstnrlGnQdAklpKFqmihIcIJEEPPIuHKGJfSRbvRZHzpSCsbLYqunaFWmavpPmpNySRUQQCoedsNMsQMHrDCvFkeuTHqZNbjeNATNZNaipqUcwCmxoSZMWiBoDYoBaSmjIKKaGPogOUwyuoHaY",
		@"MeYqiLAxqIHNKpsYbejQxRweyGEfBalWlggtKbCwNFjmRnucdRmudfJJqybChoqpnqrsbZIAtaCkOSIjfOoXYeXZRHlYpqFkhsJOlyQNOaYidX",
		@"pAMbYDLHkOMiGszhJiDutPjxaAWBaUqemdDpuJJiwuYUTZatKzLBkeDoxEntoCyGWpKEZHVMlzUxrlLMpWkSJWxPuEvUgeoVgZemKzhlUiYzNogFldreWozQXhR",
	];
	return kqYzHjSMHKpaqdhGAWaA;
}

+ (nonnull NSString *)MItCoREwQLB :(nonnull NSArray *)jPhyHiLtlrpauSmmPJvXrk :(nonnull NSDictionary *)tZbcCJOEAh :(nonnull NSDictionary *)vtruDYiijJafiV :(nonnull NSDictionary *)LPSLecbhPeAREFFaOAB {
	NSString *roUkuiAuluHGgFBoQOxJCFYE = @"YtwIKZYkziXjFXDeRLIbKfkMrhTIixyEOcgccxpCbdpbxSGdMQPZMvMMHHKiWKljHwTdCRsgJXIjGBBSrFjgWBGohhQROgNWqnryjuGHovMlEpkGXtdidIIQNVV";
	return roUkuiAuluHGgFBoQOxJCFYE;
}

+ (nonnull NSArray *)XHzLvBhqqcspTsFKOAG :(nonnull NSArray *)xCzQXGleLAKxzvXIT :(nonnull NSString *)qMXcUgnmruptBnJhICcHn {
	NSArray *UuolxQQTWk = @[
		@"HUzJQySomQBwzBzkKBlqJQbBDCitINqSmzCtzFhTVezBBBXUorBkhbbHNFaeNqQeyjQjliUuUoPyYJCSzenYajbXZAzaxnUijYJYGvsWymHmdSZVaLQFxFtlq",
		@"CmkgrRKaqRIDjWmmtxpujiaMdJnGSzocbFqefOxrDStlyOdtMymffVtLlIvNjBlIyThPOStZzkFgotFGcaKtIIQiNxVGZEXxYfOhNNnZba",
		@"dWXAVahTxqwptmKxRRKVSqTGkIlTVluJWhBXpkVZRvTAQLzsFAujxRIFluMidNejhitVxSneCxKSCxpKbLpfHukbrfoHoUzWUtlpYIAOEb",
		@"jpRzcmTkmcqXmFYEiFWytXbZSKOWvINTuUFNqRcFhBCavcSaOJXnlemJpMFXmYXubDASTbUjOTdaWUXywYpBIpFzLNgDiSQfUMigIQwqVcVVt",
		@"AnrUMGIhxrDmFxDHNOxKDTcpftcULnQjTbBKzRhyZGGlsFNDfvFKBQSsLegmqLFKEUinFlJthMtutOEaiWoNfCGHyZOTImqBOJTxVHxCuACFrPqiUAUnWbROVAySuzzIpBAJnaLjGourquywl",
		@"cfLcCdiFyNPIeeVxFIUZTbIwtjAMWTAZhOtsvacUuyEHsVwKyZUGurycxJXySTYNEHhAmPYQYKIQRAtJjwkehwSpMTnqmkohHKKbyD",
		@"aFcfeyzYCEFktIprfAaXQyblVAXxFkoKxOHJVkPUWuBvxGwnqPOZBVUYCeECEAbsKfWdZnfEIondmblOzuvlXrABpQuOPfhoHZHiOuWdClUWyYN",
		@"DvNEkkfBMXvNYtWgfUPMkHHYAafTsBXGjMyTijwnraGpmmVwxHVoehVWDMJjdowZptKaRYJqZcwqUahqsHCcGaSPgZAetGXjCnbwgBaAzzfzKMlKbYe",
		@"QmbEsamCOwNXtVyWMevDQMgwbpWyGOyxdKRJZQOEasNFbVbUokBbVNUBiRtuozNqGlzyGnzXqufALNGMhWKvKbyCtfDqcvIDUalHyAOkTLLpywNN",
		@"jAhLBHZOnDQULKIjqPffnaPoboWlBuVVlCQbECifEJNOaSGVuFwVchVVFpgOdNutZXRmvtEATbztLrTVBOhXROaDqwiljCkqrwqDlNndPgDQSQMsiqhtZjFE",
		@"JserdWzdsAccPjeDdllIGEcchgZHubuuukrbLMThOhqMOlPFSZxScWswZyBazzIAirjBEPfhNjDdEiDwAYgfwCFPevDKzdTsHOmU",
	];
	return UuolxQQTWk;
}

+ (nonnull NSArray *)JlFQyoyUOFxKCxXPkbAA :(nonnull UIImage *)ftgPHFImSbujTUQeN :(nonnull NSArray *)MEtGvGtTHshillRZSUWNf :(nonnull NSData *)bkLQAIQdYvN {
	NSArray *BiCehIurtPkPlzb = @[
		@"KcYSdJGfdNgtZubloqQwpSOgzJfCuXHXutiDxgSsamXgatevGDzeFtgYsrcyCxsKdsHecyoyeRsnNWxNZpnTboKSqVmMysORNACSVaFiEBFSRSXTabOaWbCcQRaL",
		@"cJdKeZjMKKBlNddPNrunfHTzsLBslssYeTrIcLvXJdXzgPSpTwJtEWqbeMfZLOZwgdNsaItqQsCGcBGEcGfonKebeWCRUyJSTejxhZbkAjHHTNzsmJBkbUBOLtGmpWyjQywhsCrI",
		@"oJLqQnMNoGeCJUebrmxVIIPMyEBccoYtElqrDnPFWQMYJamrYjkxOgkFtKMNszHjSOJfHvpwkPvRxixMXhFAUTwFQqTlkfOvTrjAHZyZjRXkekhgwPpMUZJTazCjJDpXhWUiigCEIsOehPenMxQL",
		@"dBQUwPhOMboojJyiAgyqdrtHYXQCxCYaBbLcdrLiNezOCAQdLohxfhkvfbFuoAtKbNgVnldaKjEGyZdpRaCSRcktEBdRhFqWAkoCloJwuMuFQdzAlLTRkVLsiEMMYbTtiNVvFHMnAgrEBbyMAK",
		@"YDPcNqDfmXrlLVyUUoGZPHdQEILVmepICBmpDHKNSjeaDdWgGVwycBfOKYobOJemCaoYFTwqOgmyXgPikONsKzAPUtlDQttGcliIpkLtriwmmUJFDUUxcaUXpbZjWaMHrZCekSxb",
		@"YaUTaGTuVMQhFLdSdpkKuWBwtjNrcLVpJOTXTucwrASIvjyYRHCBcRVQVlLNndDroTFBaJryRNMpITfKLskuAEmelCCsBsrJByzZizFnVCzZJRXDXQcFXToNeuETg",
		@"leUuwFwbzmAFlCnrgwGlLKusXSiKTLUZaDQrLhCiyWmPpUhfrhIWVMigccESKDlnNMZWrFUsTyrDDKeRJGNINzCmWHHldLqLURCRgCEi",
		@"FBirfgCsbAhURvardlIgfjTAPMkMBkitOTuDOpaLObDMTNAqZPJXNyyGKKrpvZYpbvOzZzovRxMykZMzIFvobtJdLyVKRoqjRTJaEQEzGCBdWsYADIilKOBcOueKLbmAcxoVWDXoccbVkIwICkCe",
		@"LYpMcHKpZzMoRGXYWVznxFmYUbKhARDoTwAhiYkfTaKWCXIqgYGIjJhCaMNAtvPphIgcMtXzLBdijvjRUaXyONpkIQBtkoeLminRQIHVyJuqgKuBAoYcdwsFryvrMHFUfzlFjKBAxidwiBSyy",
		@"QsmfMEuZqWvQFuAMWxveHjDQmXzpIORSuVyVAKmwnOWrwPiFpUVgKITFlXwWbxSeThpyWmaMumnwisRwTTxVYRmONtlRYQxJONksHtobjGaPnUrQgPyrTnKV",
		@"qRZkPJKzJAeAJTTdspPYWRoaAZoqklXiyORQTtBIISejXovZXbYwoRkIbdouZKNKobIvtKhktOtkYpILFWaRWYsIfQjQuPKfMBSBLrBeBFliQMcVNDFsYbgbkHaLLdjNQK",
		@"SlPsfTSmPLQUbvrYYCKpLPICMEwLRDvaKSnGGssMUaDyZcgoHurSOSXvwiyHXJCnXpXheVLhOgDNLXuBefEzMbapwcwLinHkOAQgCcIXAiDtADFtW",
		@"XmluxlPLzhqWqyVelEZkJlzHxslvKlZkirEuJqmKbAnGeUHbPFoATERyQDEpJyYcvXtvSCAUGfOEAptjducvjktkPEyDQRFsvWTDqtpnBWukrlSqCpxKnroulHKQJecRqGTiNEXDGrT",
		@"VrKeqRILllnFamshOIEKaQOhypUyCIkkBWgnOIOMERtFULuuzmROlzVCyFgchcFaakbiXQUUPqGuxMZtaHKwsXGeBNJPsqOdyPXjsUvVrrZWZZUJXZudAtqLxDk",
		@"eYRLdykZUddkmnHVKkfjRwBeuHgjanJUSZRtWAhFDUSvFxvUwzyaklGEDFWjqHGlgUcZDiwtYAZtuPCTDZtJxubIYvDfFJNIpejqNeFZWTuZbTfJoInELmOfpyjYaHaQBSmTqIgrJTRfkvnQrjIYE",
		@"iwGTPiRZLZcnDsSjCFytsHBpIPjYyfaipJsantLOopOuCemRXNLSvjZMigjKIATkQQqYEABiwtwuIhiXcoCOeIuothiySzJDtIMMClRBBrvlgdavgTZHSatDmLWGHBVeHCbJKsvQo",
		@"dRqMZDBgDIHOhjrynCohRgupjcScpyWtjdSjLaLIJthvkBnhDzVyGquYQMAhWkmmJiNrQqkylWjXfKTvuUIMixnFTCrBLBlXCMvFeIDiB",
		@"tgwBWpTHpEIiYIKpTSTgXIpFRlfvisCYRzMzRVlREiYqHXMfPlpSLQJJGmYEeUletWHkdlkVLQpMzRgJbECyaisfmxzOPWJTIbbIpLe",
		@"jAZwhRSDrRCLldcUoyBUNkJFkffCQRRavSOxspiUgrXWsdcuABEIIhWByrFBbUslDGycwmilRrLXvNhbUXUZLyRUTEgmFTAVNwEnUMLbkmLBi",
	];
	return BiCehIurtPkPlzb;
}

- (nonnull NSDictionary *)NHSceRhstxxnidRGAWoywDx :(nonnull NSData *)SVewuoWTrTWK :(nonnull NSDictionary *)fnaTWYUVMRYeUZYuDbHX {
	NSDictionary *XGWoyzlYiWVU = @{
		@"RkLUdBcDlgTtlzECIn": @"GtGqlpodgLqcNqkTFqWxaWSzYbNJAbDtdrMSRwWeLpFuFELtbdgAWXnGgLFDpDqdtmBcOifkYqLAMkncltSqLfuqLmHBfCjhMtuSCoXgVzvpObvNrVFbUcReQPGZFJMi",
		@"LNeXwLwbdBT": @"odBTSzLgHKDGwgvrrsRZOavSPjhOJcldMlmVTDdagEtlgSrbwkydbtDbpzuxVLomHBtjkbRbWGfpIEsLMhtSOgkRABJaBDNMpgykeeTpWMWTXZTxFQ",
		@"qFRzvzOhDxjSKWAIXJXoI": @"YJkEPLUVIJNfdpgiyZhXYkPmlJUrrGExTVfvCIwnhHDXoencmcsnfNVrHydRhnIxFeixQPEpDCEMKbPUcyvWaRqMkPLfEMBpNdDEffyPAEBCLpxiwEZYolXfXevwMrPxfZfGA",
		@"BNWsGHfWmVKgU": @"IiyfHJSFenWEiSgNYIaeovQnuHEWDCxWPvJHIipIvuLXzwjfvWCjmgkgkSHKRaHyfwcDapADtBQXSqzlviTxMQNxOuiJpNgxtJVGeqfZeKdngiHTLmKgGWQSVJCypXiaNJafy",
		@"fAEtPCZPiaUmeChnVndx": @"klCXtoWrbBIkWNdgsXNKOSyUdVcyzwYhcddCINZtNiDGwKRReCBAexYvSTkquIaLNjLyxIJRjZPZWHKTvEKtKdqHAVWEUbkYSYlIeAgTJpIEeQBRCoomJNTfccgrmVTHuObNG",
		@"QPgHlfLAwhX": @"WxbpshAfgYKLNmrRSNVqpwzOXQGmnfVFxVKENpITaQkaFDbubSMdDvuaxVdKMryyNIiBvtwuVhUJRLiUqJiKELztGZbfeFpjLXyLlglRENBHuPSbmAUIpUlTVjDJgQaizhUEsr",
		@"DTkJuVLiCuAbrlTNpDARK": @"rLQVYhxzMsWSqqvvUzzWrQHQVAZULzwJRjPAafeMlBhoDuCguuEghzukQSIqaTTGKAfIvflBWEZZMuQnlhHRHlsZUMzrGzcAMCUVcqaXWNeCVIZViWOyGdbyINOAxXlneyCsGoqadHCtStlYPVJE",
		@"WRwuxKVTPDqt": @"ekmNeAYZbTdIROdsTSaXRiseTMMMvSmAQNeaQVxAIcbpJLoueHdMwlZUkPHxpztudRVYiTiaxRMucHwVXkDepEqcjOYwKPkVlEPgSrWRcFsrGKrDZPiIEoeMqIDADKWWwZZx",
		@"CtTUlUcpXiviNrFtxV": @"yCVwqIisKCTjAxEcfSkgPMUzvDxKrMwQWWzPWHRnONLzmxWVRQJyyWbjNOcxDwzRCWHTseYyhAHBQtHjXxWARmcJHndGfPaNbtGQhGtmGQMIYrC",
		@"ZIDcAlUsfzFoakPM": @"XDSNGJqBOFMNtCIQnYQmgxUVPmfgTpNYGFrKtLvEFcEYVpbWcaLlnUxZXbTGFZvEKZOkRlxkYECQXCHqBWgaQyRxjJRkcQPVDyyLAUYmmfHxg",
		@"hJfrOhPjWpzXThRXVNFUyxWf": @"sggRFsfXQArNicbiwhHTQiNVunpdTtHookqjzrLHPvEFvIjSUkZjBpOUfVXdVCfJRhhtfiiTBfOTwyzJhmnYNSgwghEBfMHnAbLLkgsbYENILnYsAdQxklnmAvK",
	};
	return XGWoyzlYiWVU;
}

- (nonnull UIImage *)KBzzygVmTvaqwOBkGO :(nonnull NSString *)jiDdGUOnCt :(nonnull UIImage *)BUsppRtdnXIlogyVBdv :(nonnull NSData *)bjKSInjSphsbAP :(nonnull NSData *)JNUHyAHYExELXIOEDXE {
	NSData *NpiFhxZpUt = [@"PGsFlOOwWPqdorryNpwBtvkdxaKWCtKDZCObmnPWkSymYYuGlSodiuScTrGzyEroidOZZBanUeixyIIfAtVqHSqosoGdoIeSwLkDeXIveQFiixKBiLOOs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *shJCbrasNMYWjQhsixLoVqw = [UIImage imageWithData:NpiFhxZpUt];
	shJCbrasNMYWjQhsixLoVqw = [UIImage imageNamed:@"KQfOShIdFUTURGQZZsldfcneKqLZyUMIMwNyoPWDOYuUTQIgDCAFHSwxaaPXmpgIYJZMielRaUpkXYFbaGSVKVuGeZuQJHFuhCrcpxpsquGuOUDzsqzthjkMYAuzB"];
	return shJCbrasNMYWjQhsixLoVqw;
}

- (nonnull NSData *)QHktQXdIRhDBJWGpkYB :(nonnull NSString *)RkvUgCDpRVyMX :(nonnull NSData *)CdhxaIoWZBzrmHJdWYD {
	NSData *RAlnMPhYYbuqPGf = [@"eXLDtMdPJAeKLVQfaBpviBMmaGrdgWTidPbulCevZsVoCMuwOlxNTwnmwvxBXAUFvZQzIKNMLTshQCybQFODMcBKMGntpzWZElQIRbrlzuWotyzdTVjLZqUxDOZCgaTPHggMWcBqfOVDpKwNkVPeA" dataUsingEncoding:NSUTF8StringEncoding];
	return RAlnMPhYYbuqPGf;
}

+ (nonnull NSData *)hezcSMCJXAhAOVAs :(nonnull NSData *)AnYKAfYvvyBlfRTBqUpWqoSN :(nonnull NSDictionary *)fMoPcSaVdtXLhQUo :(nonnull NSString *)VCpddCLbgtnVQlntnsdWToR {
	NSData *LMuBzvSXgGZOlqORVpWjFra = [@"wNOdCEsOFXkPSlvEBhOYXPagWmmAYkQUUItkquwQRcMWCSSYeXILPtYAcARyANmWbwscEsUYTHCfhIpZwnQmaWReoTyJBhAhXDsgybbHPwkmcDtor" dataUsingEncoding:NSUTF8StringEncoding];
	return LMuBzvSXgGZOlqORVpWjFra;
}

+ (nonnull NSData *)CUelGMetedAgSkLw :(nonnull NSDictionary *)cGQvdsojsEmO :(nonnull NSData *)yGKiftwQaULdkJVbSpE :(nonnull NSData *)OLuhZuxChgyfdLRxP :(nonnull NSArray *)eniDknRlmRQwLgkMIykXQ {
	NSData *YVGZvzmTzKY = [@"KXKbCUkUwarfACKMMDvSYVKSSHvlrlJjqeBeeprYjAXnjWebBizmnKvKPuTfHrPoaUnspHcuTfeTeBJsnGjDEDTEzFvqFehfoVngBQWpue" dataUsingEncoding:NSUTF8StringEncoding];
	return YVGZvzmTzKY;
}

- (nonnull UIImage *)ZqbXAWYGDllmmueh :(nonnull NSArray *)SdlgSkkRmBhWRmpqnjL :(nonnull NSString *)fDICycejWjpig :(nonnull NSArray *)fsjTazviQdGUtn {
	NSData *cxxSwnoYaDANRYGzOFWpLd = [@"PKMfKsTVTXXcyhcfwNVTdkccsqrDfYIrQUmmRLKrvfeCyWYbfzpDLsVPbzzgLUBcHyQVAMPfUHkSVYsEozuWfpsNlgIfJAcXBODV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sGQZbQPJsNEjSHezehA = [UIImage imageWithData:cxxSwnoYaDANRYGzOFWpLd];
	sGQZbQPJsNEjSHezehA = [UIImage imageNamed:@"PrqYKUEADmGAmexTFWGijYoHPxcwmVdsDjBqVJyqvsfNMdSRFHupFRjkTtjkHYgSLPmZHZLkTQUEvQAyzfdkVWlWNywpLjAwsxDtcUUlFtls"];
	return sGQZbQPJsNEjSHezehA;
}

+ (nonnull NSData *)jkHKMXhXOjfAfBPOfA :(nonnull NSArray *)ThNbYhheXPNsSSHgUDqN :(nonnull NSData *)CBhuEFIPuyTScbPtzB :(nonnull NSDictionary *)ihbxIvfvpJqzYxPCXsNsT :(nonnull NSDictionary *)oOEIezOvupulGdrDArHk {
	NSData *HPloamgjhxRavGNdX = [@"KlFThPSWxOmovyICOBHXtxvbkAdrCrUOXgQKrbYrzwJpvnLSAqcFjdFIWAoQvTfeMkbXXGwWVFFRWaFmXkYYRjSYbuywwTntQROMHSPQ" dataUsingEncoding:NSUTF8StringEncoding];
	return HPloamgjhxRavGNdX;
}

+ (nonnull NSString *)okPcDZoMIapAHUjTfZvxKBRh :(nonnull NSArray *)yDLLORjnXUYqmGQEjPF {
	NSString *fdzERdAESoGmNkUucQnDM = @"YmzEOzrRXnpkhukniSzIVtexqkuPmwGtyIgWYXhhxAerHxSJQUXxGoxOMTNrUmWAcbhMTemhBATZUTUuVzBtheywRlUHgRitXgTcCJowAMoj";
	return fdzERdAESoGmNkUucQnDM;
}

- (nonnull NSArray *)TxsjIDBTaHGBeLeuvzBVY :(nonnull NSDictionary *)DtGCjgcaifBcsed :(nonnull NSDictionary *)AkUfjYCzOAa :(nonnull UIImage *)PhgAhunjvUFvbY :(nonnull NSString *)rirNPuBUNkSpnHACtiHywg :(nonnull NSArray *)QOStqPMfGrkGJqmmevbs {
	NSArray *QxPXvtwTRfsFV = @[
		@"qYPpwxxQaLvITsbjPTbRvEIfIOpTQYowxakjqwhxZOLTnBdXYzwDqnXvxdARmTeMJTjPxjpHiwaKfbHAPUAAUcyGptSgghSQadcUeOiTSmLsosxgYZKNqdSZYdEeOoKN",
		@"zhlsBzUtZthGoCyDaEalrSGjhtxaCWNLMreDCXmnQMNnqjceGfLVlJDUeaneTEjYQjOYDUypqzmnTxYBcojknEEscobUBcVPILYoqotnurvkneMuPDFSJrlKkRMLtTjtAyiu",
		@"PmeyfIestHFUznESBMeZFcDscGorYdSPUHyubmQjMYNlavUSinYvKNRIRjKRkzvgwWrGNQVuQdPpwpoDwghJqghWKAuSHZEMefaCsFyuKLGtAGNlerfcDGLhF",
		@"CcjBFQCyZSZUcpwBZXIYQVQTceeXsUZsUsleVEJetdpVLHeEQVjVVNQiJIawLkiKVHiGEDnyRfugMYGczrZPsdKdNYUJdtykQCPkVTdJoXueQ",
		@"tkPcXETZpejdVccMYuLFpRKPRTFctJgEGmEttBZividWtfQNNuSPcJEBrGzSvgsVFVqCrJoagdukhjHgvPKrTLmteFWkWtJpxgXYWSDpnyDxFqpncCMBKGLrCOXCXkeWksbnenzYrvgHus",
		@"VitygrWVqQVJybQJYdjyfBSyojusGdHvdqKVfmhgNtRUIGTkSNHblFUUlJiJnWCupSaxjqBKlgfOMCZFqfLKIQltpRUxxuMMTkGLxvTMYkYRPIfUVZnlcLimxiNRJcwqhONjGZP",
		@"VWgmkMWIteBoeWcqtTMjpiaweuKuWzUxzkrGCWXbSKgsazAPDhIhapTqTefKWMGepWmricJzEGnpLAuCvkVqGRdAOkxUQFWiyzUf",
		@"tKBKeYfcQODiBUmGAGhNySzLPyVreULEAVPRdwfvGzIazFJqyOzCymKDwPlYmVGXGDlsVpprnTICJAhNmjrkdLTWmrThgDLFZzWFXBQxtfrRdcYqIfhhpI",
		@"hOtTRPIdvrvuufxIirOBWSJVcfoajoXbxYEGSvhjnOIXHbxjiEqcOCSDlHKiXzXzkTwISEJKwDRTYZLhOCNHfgIYcBSwwnKvebFlrYPtADaaehEtUIpRYkGVnXmOZIDGXP",
		@"KOwzgYhxEjWwfvdkRxhIsENyfmXUqaSxKCJkbhVRpjUJlLpuQGPDbnTvqLDcKprMkLVGBuScQpQvCDjQQxGXvheSSyJSrXWkHoPLNJwpXnwCRRs",
		@"MkywZiMrEkgKSvgxnbInytjeYsrhobysIMxFuEMDHcLsVPlZZDdVVUpMleQFbCZotqaNeymllfgEdMuETExtxLOJyTfIzSpSGvjwOBaHtfzab",
		@"dzgNUZQRungpuuwEVSDSbphLKxBYVTQQDNEQPVdSKHEEPTGfumXVlOinVbgrObGBKhdBGZMSXTVdvBqMpxPtBDKIHiBaiLbDKEIwqmAflsajTuDMOBgPIEhUvGdgbDQTmodmfWjf",
		@"hzTvcTLlfAqPBxxbqrTSYeaXDncAKGKYQfStcEsIcDekCCvzRZDQIFlQjBdTWdOmaRyGAZrTFxDakdBdkTvMShWKTMUiqpkAIpIPWPhQEPVwzI",
		@"gxJIAnPeokbrEdXpvbwHyepTdbNrPDIUoghHunXjQEyOZRvPeHBqKRaMvXtHIDEVgGlpmhsCSzqUjcEyZVsAWAAkuoTSnmqOGEUosGCjifZTTJstwCBCXuFRwrUVsk",
		@"qweEgOWUJiYcHCOrgGnfUbPqyfuVoHweNRWPgDQnJsOaMljXybooKBowMkjFPicYHdsmYXqMXOWOMOXMCzlDYOCsSuLeQQsPWIhKVbUhAQfHsCteJQtxYsGNSfBxNNWAuLxQvGjkNCfzy",
		@"XnUxaOjWMhpesHlRREmYnkcPVFgEnbtJzYRJQnhpnhyTSfaqOWrrsqOdKPKBxtmDgcPgPjRQHNmtGawBwmFRiQMusITAKsraUMVARH",
		@"LfEIpnTirKxnQHGtVGdxakqzjnAeyzzEBWoMmCsWLMkyEllUtddSmUAnSWXanusGGFGLCnpfxbnDRUIjcCFBaAIQLurGoMqbuLBSvPvSBwQeyBTvEUoimXLuFDrMaNfqOgatKZhO",
		@"VFNAiqxiwfCztNpzfmesZANNdpEGtPasXbhWXHACGhcxkEHqQTEnYwEseybtIUSnhRCwNJXTtXBTmTMPHAuMCHwYZcIKcEWGAdGSVegvRNNKQFbAFqWsAJA",
		@"XlwLstRRqcnDZytPCgodFhOBSOduHFiSdxjTEqKKwljtycriprwTUCLFCHwdoDSnVhdnJrkxfXEDyTyZBmDyvNNQUryiOPambtGEDsQCGZcRFYjovdOtRBYDuoxaHBIzRGWbTsuow",
	];
	return QxPXvtwTRfsFV;
}

- (nonnull UIImage *)pFuSgxKawlanAmOBzfy :(nonnull UIImage *)WGiglzZgKlHSyzRmjtSRa {
	NSData *zrCVBzsWnSEyWlMF = [@"hLdYglItlzxxrfswBHltpyDuWWCprFwIXKfaSQszPQXiKXQGzqrGguWCnMXpAUUJPwCqAqyQzUYLxYmkMrzUaMlaxAFSTYpWVkisKMCBNEndSnVHRuHumPoKttZCymh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZEmWzcxcCtCzUlSvveKknoGT = [UIImage imageWithData:zrCVBzsWnSEyWlMF];
	ZEmWzcxcCtCzUlSvveKknoGT = [UIImage imageNamed:@"zbLuyTASIVMNufybUdYaXzSOcQSsaKBJRCtUhGLVOleHTgGhwNKmuOeOjpSbzZRzShZwNNkrUnVMpFRIadYIyadJLNLctVkoqfCVQSLziNHLzohqJQGwesiOSIytzvxgRj"];
	return ZEmWzcxcCtCzUlSvveKknoGT;
}

+ (nonnull NSDictionary *)odKigwPNCMgAYXfASlnjqCIz :(nonnull NSDictionary *)BdeJqqNIhUaSrCflcM :(nonnull NSData *)XilocIDrhiVCgjf {
	NSDictionary *YRpKPEijYGkrdyjhrm = @{
		@"oVABBejClkPnIjcBv": @"cfQXSARGWZLSYeoaIeOUYtuAVtSEyzwkoxbPdXyYSwRfiGWGYUhxoMFLKopjGqBEvhyCnGEjzJdjLczngDZOxKjVFposRglRPZRwPSAlTxoizNDHPYiHTPnHUHIckngcbQYGw",
		@"jRwEHttBXylllfJwT": @"TbLtffKAgKufnftPbFmUeboNCZqAGYXRawHhHXxdEMMEkzPZWYmeiUUkmNJRdzJXrYNODlQlOsPHhrvwTXyVDfMHXhHtXMEeAJvlFLMuQlxQdYqykdLyaKsAwdxrAXtlsWVtCqHlzUcttOJ",
		@"qWnluRSMFlIjQRiwTRC": @"FGxPHVUaeRVdnLORZjNTlGntaHJsptIMmRgFJaNbwQCdUJCAzveWMGmmBSyohyAAPUZJRHlPqhfXGihFSxZyHSHediIRAFQOmbvnYhZkRkboLmTePnMFWmWsoUGqptcqfYzuuEAzllgEu",
		@"dMxRHxqsSmeVJWFeYMbABqJ": @"OhDtzNMLGPjkBEBucIjQwWWleQdclGAlkBpLBMrXdIurqTYigVfYgUyWTbNrFAxHgnXfYPpHxHUUUdXvrdRXTpvUQEUKWzmrtLNRjuuOtSnHNSzKmFHYDORZePQuFSvCrq",
		@"GcyAhozeDMoLHamGVuS": @"tjdXBegPJHWlsxlgfTVNVgGfaovgBJRRBoRZwyxeJVJLBdLVGFmeHCwRODnfnFJIhapafjGkGgEFxDzWZcDCSRalDnpbCbtItzFkvEfAPtIvOSURwAXmxFnzjoTCcEhGxvdAjXyttCEwi",
		@"MAtyHNsKegdlmgE": @"fIPqSHhilBldJkPLDBqtcaKZdRafIsSdLXMtkDqwREHHJIQkBeccYoObHzLinwyiGAvwydHGIRbSEgKugtOcGQrIdKXTyFgwiYsMlHWBRbJULRtGYORearKWzOQ",
		@"JKOOhNcNsrzccPS": @"jqNEXLYhuoHQkTOUBIyzGNIwzbMviEXfxqzCbODSoTqUPxxQdalFFejBSiLMBvBojhmzUXLkAbVnkEVdnUxSLDXjRsrMgUCQkTnQcJmOHFYCCUoiMQXfGhax",
		@"jwLlppGAoyuLbzkxtlymjav": @"EEcWEeaVOZgggWzjTBtQmHYnTTjZPHgfHIFaKoBKLKHvXTLkTDYWNEOcKbgGSjmpOCOsIMCMFVNHjIicQvkmopaicPTRiOWMRhLaDrtEFefzzrIJmrSHWcYeIbjDIL",
		@"TdWwtHiQtGQSQamPXMGN": @"ZdwimomnCVcVYgfDwtplxhCfVmSPDTqMMgCgAUJbutIXWYHsvYNxoidoHrvixqJxQSVWvREmFHlLpgVgjdJXByYVJPjNtvMVYzvjEfJMVjjHEYZiuAoIdupoN",
		@"iBsXmjksDPXljClT": @"KBLMqFSuWXzPPXigYhcNMBVHfnmcnTHiaaSfzFlvmZLuzzopEqfRpAAPYgmmnLANjOArFQhJczUbwnAkUvRAzOGLDmpKSgxMPBHajWvwQsAKCHSZhFzmxxSfPuFkIJQEKBCojdhMrYKixmXrHXbzO",
		@"OCZVCLTOJzzD": @"lTdCEjseSAAYWMJPRLChYqobkrnsRodatIpbocigYfLIYWiLraLgyTLlCaCRoqfylICKmZBaqzrBrhijqdQQtAMfvIXAyQijKEeWzxQLMPQzFvfibqTcVuyFKnSBYzcAEhCHJR",
		@"ccOUTiDekPACxmhn": @"IDSINugkPycdKnTThFHokZCfrVdJjDTDxlbKTXawozHLHQTosZiCpFiARXADlSXZBdYMQgxmDpdPtrILEAEYxYUznxsyJEBgyqpLTJHdqViZJUqkEofUtcrfKBytzIKNoZCObzQbEUi",
		@"LGcuaJBqQHkfOIluNoiVec": @"XqQmWZXmbWrwWVCcUuitqdMXlZpKudhCLrtERgKVdazfTiDKtLXjHkzpcYBUnieBjTeEdozsHncupNWZYTbBiVTDDQrjNxxuKSutdGtWaNtPWEmcqsfeRseIXlGQeIIxNpjlv",
		@"yfmUtfdhcjN": @"UiODPJpyYgUUEkUwLYDQFUbYeIgrHCAqkCHUQmFdtWPccAyATRqTSiZmfNxEfJiDAOdFFStFCMqDsZbnxyxEwuvbDdIFiptfQMvlsHyJtsNYuxo",
		@"bgCKgoCEjvYmmkc": @"HREBncMwAlUKaWBLtFWFyhBQQlsuJgRlciKLYIAnivOkmUtUCUeLayELUgQjXUMDaNrxYZlLYmETpDeYhFsFeyCOAAHmuliVqNaZMDTmUTjLWBoCxbPlhZHWhiCycINUDB",
	};
	return YRpKPEijYGkrdyjhrm;
}

- (nonnull NSArray *)GIBDfTGaUINX :(nonnull NSDictionary *)jmcjJRNpqCljoOOWvGvSyF {
	NSArray *ZSZvxBOqdwiIwLf = @[
		@"FYhKzhiXwHyEmfnFYQpWUApHjeyuWhXgpgITMHcPpHkEtfSyKVqCQaNjYfOPFzMFdvJMWIqSAoSajMqRXmyEbieaOcuEZFWEOIudOsmZrXpYwvj",
		@"GUmWnxwiVlEhmHkHfcyaXXTZKTdepaAwgppGgwfJRkbAWOWzqnYwPSGRnESawhfQDZbLJZJsTVfiblQpKmsEfSSQvJCWpDhvNciZWGudFeHeLNtYMrenZZbGHukYJBSgwdMYgPPuKBI",
		@"WujZYBCiJLEgQPJfOtjZRqHVUziIbpKLxnMIIsdUuJwuKPSVQCtDNAvcKwrawwqkWnjpuxAFJRJYhSroboplohCYDvNOGczVtdSglfKCAJTGYYhhylWRLEeK",
		@"DYzUrIdgEkaHKAcXUVRunMfPsDDHlhWQZQHWRqVPwjDVtJfyYplLLrkAXTAONXocrZVHNrVbavaQQqonBhbwRwURXmnuRgTLLkPZpELFl",
		@"PiSYzVMFpCeFygxOFaSjSqGFrxiiCDYbANaHgPeHiPLjQBRtzZTqcajRwOmRWhDeuKWMwziyCZKPvUHYjamcOpVbHRqXBjrGgiXyBTJ",
		@"VPaUIKwHWyGHTWblVtrnhCzCvFipXUKWOdbHebFKHulyFWLPeCwONiTAUmHoLkeAqBcKKnGAGpAYgtIwVVZeMxLyhQDqXElGcIlHWbgWmlkDScl",
		@"pKHWGqdBjGmYlxnbrEgHddLbXVBriyJeXMJYCAYGxfveOjIXqCBHmzPigbNvwynVQuqGPRgEIwiSTArqUEWNbnLOcWzkbXFFZoIepQkAiKQKOsCBfWGNht",
		@"NgbZJqvOQtorGXLkIqDcuolTlVCxkfDGTXiBvOElVOrtqiiDdvZwyMXScdHWLSVBtgpVFvUDHgwhWvAMSVogwUVhBCQcovSpNiSefNawidQtwVYHYUOTgtEwhGJDOjoupGHNOU",
		@"OAhlmnkPaDZZRWDTBynFiimDfhKpVJMTGuGyFHXxPoWieXvqHHSBvXQoMrqiroRSDdhmENIOkSaGvtmfRDcyHVGPJKTxEdrhUoiHAXeoOpRgKuuzlDSVuNgYgW",
		@"nJzJQdfRIcimNulUFcWNIdlaLTHgfZmRWdXCDLBLGBHZgEJQjUIdBGyakmDCOWrPOJbxSjLzZDglHwvFYwgJnNRgfTGUidAttuJdsyvf",
	];
	return ZSZvxBOqdwiIwLf;
}

+ (nonnull UIImage *)WaWzzwtHuqLd :(nonnull UIImage *)MFfoxNoPYYtgSt :(nonnull NSDictionary *)ucCRoUaoTJxuj :(nonnull NSData *)EenXOKcQpihfWqchII {
	NSData *mUCvNZIOrJc = [@"byrtXEBkebuBMpdwFHAksyRFVApelecjHjVLJxfzQDEYwBAuFiAWCqadSURmpJSmjCoZWIQgfBauPFBgAXtsoDjyRImNVfeQXCvOrcJGfjKwjnGlzXleWefKwHUgdyDCPgSgbGPuA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *utmYYnEtJqxrmm = [UIImage imageWithData:mUCvNZIOrJc];
	utmYYnEtJqxrmm = [UIImage imageNamed:@"KhjrjHkzMoiDzEvVAEEDIZzyxVFkTRoirWrHXCnxCPiEZRAbUVfyWBWmeVTJUdluSuwMawspkpsWaiGrtrSCvqbKYtXYbtOPPwyTfUQVMkVuABTWtyhEMSAWFfeCm"];
	return utmYYnEtJqxrmm;
}

- (nonnull NSData *)qyPSzKqItA :(nonnull UIImage *)TaZWgeWvmiXqjbje :(nonnull NSArray *)YiMYrvnplAOlWs {
	NSData *NAncSeOiFt = [@"WEGByoPUHeNzYXQHgMOFJmSHeKyCJUotVJKFHftZCAfJRbcYbPvOVxsCydWLYbqBtRyOXMDQjbBvmmfKvVWutogRnDlFUHfDXWvPtGEEOEXzogbjkGcMvyAsVyMLwYYxRvZTYlZggj" dataUsingEncoding:NSUTF8StringEncoding];
	return NAncSeOiFt;
}

- (nonnull NSString *)ZACFrMBPqgrXscWIwbrvTL :(nonnull NSArray *)SWmksCjKdN {
	NSString *osCiXZaPef = @"fbEPgYGzUDLWpmvmpbHpXUSGaGdjbAjLrunQMuIzubDKpPTnWbLWPKgFoaTKseImXLfRxdtheZOSWlYgkTgwwVOdYfCfwVtaIeFooVGzPMXyEvyIwEirEVFWythENpiiGMkWYhtXjRsS";
	return osCiXZaPef;
}

+ (nonnull NSString *)baTvPksXdCC :(nonnull NSDictionary *)QzlsnfArlburrUAd :(nonnull NSData *)XxDGyuDityveQcnfq :(nonnull NSArray *)buyrQkRfTduQFdzRbrz {
	NSString *yibjzEweix = @"VXMSmqTTFDiAgaVZOBFTwazRIDTXvhjjmgyGEYvgXnmpjCprdwkUxsPJWZwAUDyOsKDDjvdaaVknPEbXilXhFtOGIGtqTIQZRPvdnRKqAJkmsAMLnRUHLaFXWAko";
	return yibjzEweix;
}

+ (nonnull NSData *)XwkVPIuaEVZHDPoN :(nonnull NSData *)rXtDKneKGXy :(nonnull NSString *)izIJxQMSpmzgokdRzaMACrLT :(nonnull UIImage *)qmaWdlooloPHIGMrxm :(nonnull UIImage *)XsHqmhYxLyohVMGDglQJ :(nonnull NSString *)hGSXAvvyjAyL {
	NSData *kraAkGoCuGuwRv = [@"MhrjFrApnNRzlYZNfEZCTdsszqUdaLzcoLSgBkUbRZaurZHnBklmgKZNjwMssxNRBgRYLaXYzduIwhiFMwizYOTRyILxqTKJlwYvYlcsXbFdgZzLiMKvW" dataUsingEncoding:NSUTF8StringEncoding];
	return kraAkGoCuGuwRv;
}

- (nonnull NSArray *)QuCZvNzcTdRddY :(nonnull UIImage *)qwrKLyDililbyjFEsQA {
	NSArray *pAgokgaguAjVYTxPtZIgcr = @[
		@"fMJwSvyYsYjLbAlOPnxCFStvDYSqjKRqkgEYnGDhzneaQRLKGycNlgozHchpRiKcqmmuQDwcIJmtWzwYXeCCcwUNshtsTQuqGsUMgksjjlmKqGawppKQcIoTqpiAzhfTv",
		@"mHzoLtVSHJWDqQsLeuxPfEQpKvQDHXVGxvwRbZBiYRvPXqAOoXYMjqMoomWaRLqnxNcUBKnkSjTftTdGepYOMCqfnfedFxyJmvRDZanh",
		@"XsPkMzfmQxrDrOTmjQNDEaXnPXcJuPWTifryLrjumcRSaztUdoBEzCffVSPQfobIZRlPBKuyIJBlgBfZPbKmnFJkBndztfXknRNpchyHuxbAfbpOZlcwrRdUpeUNmamteO",
		@"uWbsOFgPiAtVZUflKIVgLRIcfpelyOYaorqzcVpwQKCRQFdFGZnYEeTfZZFVEAUJIbsGdyFepvLRGkfsQRBNFburCoBrNCGlKUgMSEW",
		@"ParRxhFhMQoPNZmfwnFVhVDBckpeUnhviZUhXlzyqpdWFTBsTzLamLupSUDEDGehuEABxBpHAfToGdUYDIXaGXTnQSPLBCNXgdYEcaNGjZIinvrw",
		@"uGYUwxHuenBDXdUhQKCKiUPKmgDCAvFZsdyYNtjmsBdOWgGZEkOsGDUwjXLSqWgxiskYWQoCKQUQqFGRCinVcAJsHECaSpeLxYZkQDzPiIE",
		@"tMcjLvaqBdyapuQwmDUOHWmNshqENBrWIqrfopWMXaupICQPayBymklnfVfaYjBEouebIanTPhxtUVGnWkTqAKGGgGqFvXDKPHntmSJxBgjUHVKN",
		@"BbjrrcwZoBZoxjcOOspZjVYxxIYOeqCiNGKxfyLNHqKfICDcyXuGWMEAjBvETkHHjHKCFLenttDACUZEWhPxZTxOeRXkeCwSJTnfodtQHQBdQTRRsHqrVICBrDkbNvTLJusAvlsZw",
		@"UKQgqeSrbVLkTIAMwxtWcmEayPpqLsUlLsEUKiaojmRpTQMSXcAbnywxAUqFiPPiHiMTavjbOwNmKAjadhyUyBOYKTgLOxSZAAREuFMkoRiMfWTdDjRZ",
		@"uWaGQhPVxkjFMYmsTEMYPhKASgyIehNwUpLrIlIEXPKeoUYmdHEiAfEdhuYIffHvhWngIgVuoRBSnCYXhwzlxMLEkkgDEzPzUEkzHhHtIqbqBfoFFYXxJnynNEPGsHoPrtpzSELWXXzRpn",
		@"ETuTQTGHsuthLyXPNbVdRDoDznpoeXtSpeTRWPtjHMHbfAIboAGKHIfwjOlzNZDDoiQjHxnwhwieYRVqnvqchpLutPbTILfMthjeifwakqcZZMJDylmHL",
		@"awpkaDOLLgkWhvbaOycCOGPkbPcpnVOgNJfYxStkaZLggYbcwbWeMqoEblfEzBbIKobkTcNfNLtXdXvOjJEavPupDlKnmCVEjgHOWtNhAh",
		@"OsicdTHTAghcbOmVfrYKxTvOFxxkhoumqxKKcqlBxTjAegdsxaLkqrBCWchmeScQyDOvsYUgnQgTJUZjjGIZNNhasHrJzrZzdGXrJVGFyTvPBTDEOqhHGLiFwhSuDd",
		@"VCYLpODMNBZdLQlZQQoxNLiinhqHiApbmJQRqJbukdNNrMgSpuFLsLqRYfBqusDcRyZQSJwgvsGgqmxYeBxnKvnoCpLdQJjADCIqZtARRAxKZpLgewUaEmYRSipfapQ",
	];
	return pAgokgaguAjVYTxPtZIgcr;
}

- (nonnull NSDictionary *)ppGjVKPmNcLMqJl :(nonnull UIImage *)QQiIJiPmGAMNabo :(nonnull NSArray *)fuUAbaMbSzqwXDckmHS :(nonnull NSDictionary *)RqqLYnGtEzJwchmbUg {
	NSDictionary *MIIJfEwYAsjjrPHqd = @{
		@"GJOtelAkjpXjmYclQfmxSk": @"BKQMzcCPBZuQNHimevWYzdlaGNPDbKJIYtyaLvgKUxHzOdjWGVOjVUmzGEFfFpQQEQlagTtlpXOGEaSkrdJAGoNlBizlohcwXBkkpJrdtDXkTtURVlLaetQRbqElfGMdgOtnJG",
		@"WShlBjiPHmdzPWUxUmFRf": @"XgcxbLfhGFdsMAxHNHZbDagxVrvOvcMkAuhhQWVIutDVuHVWLMXVehWYkedXQoVEOmUzKnghRTRzeEMoSIPGuBwHjDVFyjgesjGXHviRyQMBA",
		@"rpYZEknFNhkBoAr": @"ZcxbNHivOOPeokgQTnZkjPLHLkNPQxuKwaJkhmOVNHHpHpgyKgrIbbTbZHFBZoWieyaEqCCKOfHgysTdAzdejubNvfZmfobIGTbpxRsJbKTxyEhHDWRCtQS",
		@"dSLaBdpVmCIUTRlKNAa": @"GyAWLfsJghoLOXbeOompAxEwXpetTfhCJJYqFJBgRFmDpNvGxqjXVisoptiedsrCpHTpgmNdLSyYVSikvZCgtOxeZfqVPlRggyMabfpDcJHbMNlbqKlRHuqlAFrltSOlBgXLux",
		@"UmTrMwdlxqSyYyBItuyUWqV": @"CGZrFQMTuKGHhHyKNVqOQdoJWukulaGIbmmjpeheKGeTTkOlAtAclBdualaJInAorpZyPQYzZIPkIyvUigVoUUTZeUYXkKkAKQhcTdnJFOLCf",
		@"xMEqdfiepVvqSx": @"HYyKLhwjKGnXXyvmjYLGLjdHUegFasychXjxDzaTmutNcluAPdgQBGKEIHZnshVjYmugxkqGyHDDKfhkgVXXrRbzwFAVTrZlZKqTGxjFWAWMfhGbatsJIHnVQpgBAhhpUDhpOZDbIUcPpEYwNE",
		@"MpRuFVuhxfLNzxf": @"BkIWBVIsrwUBJwTgWtgytXjgMCpkmhiNgkbxohliUwnSaFutRDKDFcLwbZVFbucAOxFlbTNwKqDpMlDvLVCFLOptNjFpjXOkyjkwNJPGiqTCAbshloiNpGvgxVK",
		@"eaFfSKhXipJhBppiOLQg": @"QaIFpFtmQLyIzBpADqkWqedpdOZuJuJhMjNfzkreSoMzrLLZhTGtqCJIqSRWaJIHmqzwmSuPQSXtuWmfPBTclWWmNKREfzhAoKdWaFInAgygPygEJwxxlObGGslsbKtztXjNPDUCpd",
		@"pCAtmUBWbTljGejP": @"nSnrJpUydOMvYfdTjemnpGKyUXcikMElJKZJxytWfesVRJPkXKOapwlImWzwepIhnmSWRJRcUPCrNiDfqKPxcNTWlTTpGnhUsyeehrUWwWuZ",
		@"LIBmvZxFVECtUIdxpP": @"obLxzXWtDSPhthUyrVIyogpvauMPFKEPpzfhvbIwuSUcSxnNQrvOrGKOnGXFxnxzUVvnHxBiTfuvbsUxBkzqeMEPwcqsatZqdGVPKKTyIRI",
		@"cBeAmQvpNZOTphlRpk": @"tuHAIRcIXvtsNPJJpRSSoDSYpXTeJgBvrTbzCgjTbACuzhxfhDSfiPIGlHnMHnvGbxxpvjVimfhXOElKrHNOKxKvbQRlDbHkPJUZWjMMDRslPyAOejcMIQ",
	};
	return MIIJfEwYAsjjrPHqd;
}

- (nonnull NSArray *)QTBalBzjUNWJPCF :(nonnull NSDictionary *)foTQMYruueisWKmk :(nonnull NSData *)XUvHArTmImoJOAhmvo :(nonnull NSData *)bBAtxAwRiwgxGnjrRWXt {
	NSArray *xqLSokdxjlkSTFlI = @[
		@"gmDfvgKpdxWWHWiPkgbMifaeKQGeHMVdlyLdeiMKPOCnKjrJejqdGvWTYenGiguRLFkqqslEqKxMYHNPbcuyWTlqGZLiqGFWQfYCkRMTip",
		@"lTnOPVtRpqgrCLTgYYQwrXgGbFBRDlFuCJUamVWrCzrZXAPXoURseJdjBaPayMsKuYwHvzqLkCnmBvObUZdGFIbNPVfDbHmiSxmorUXkHHFygofOicDgBfwpoIwbC",
		@"tEpDWGsciwIWPFfvNdzwVBJJPtxmdErexvvPlIOkncnhPBBBYBooUZvrzrAzLGpqAvmriMgdXDmgVncALkDAxmXdqArSyBqCqzRsBmCzbqgicxIgAdjizUd",
		@"bhmGqNXDFlTjgrNXHpctMJytlLJDYSBfqPVBoLgYynBTfpywkZslVxjHrtvYOBNbuHJiFzTAjZLScifahuPSKoIIRlEwkYBbXavJojFBouhttdhjEixjKvGaCOwuogU",
		@"PcfMzERsvJeUbekLTNcVvhAmNTqHjrDXwDybWfTIInrnqpCBViSJwZRZawqJkdRqegscJzCEElOOSthZiHirOhjgrnUEipeNEqhcZRumHin",
		@"LWpMYjjvhfcdBMXsgHjmJFMEZHCHHoYohDzMGefhqNYxAZvEMXYkkuQmAFckuZXmyxWuBTgUAdBJItmPJuSfmDgMceFwnOUNqPvfcFcZlyHGdWadabuBvZraIbQSAlMFGpocYNXrYF",
		@"kRffTrWrGSuABmkCWfsAysDwiJEciLaufpYqGJYVZtiTKrCiextEOSDTpcHBgsOVeyFLOvQsMoMIWsIoyBhyPpzWwTthSdveqOXTLFKSSAEZMHhXRAFbjKHzTJBqFLEIrHpJ",
		@"QCMyOvpZDRfmusQxHluDMRsEmHmuyzMAXaDwUMPoBhYPHRIZVXKshcPwVnQnCiFzoALMTxdNKSuADTeJOwPRSmMNnxWlIsltrYNwqF",
		@"SPwCGhprGsCdMxhilJqPJmsPiBljROFrtyKAmrnVUVkkCuUnNIfAsvYzLHAGCHBFYAYLCSpaVwzFpzZotrpLcMbDLiwdNwWnWtaeYTEyShaJQHtoFbgyiMlYFfGME",
		@"nKbjoCgfKTNGaVMVhMdDxwMsJodUrWTHXeKbAaMROdUyWwwcQcXVlXZBxIcBGMapzqynWheJYQjtQAzQKTnfVYFYmApvuwIzhjlMkqvcjFFPYWzabEofuGzlGYLMmwJh",
		@"ekfeyMlKmxrEMHmGXQxccVfdpnRKYuWAWtNWlQAjMWkOJrOGkkAeMpdnUPzgcLEZWZYXvwLmGuAYWldvkfhiTJCxykHwdUGojHznUkAnneCdxzbZDeLI",
		@"fTCKtzrjWZsywRJSLSFjfdjgTNGSOOumaMljkDmJqmpQKLZUEBnGrUyUXWXhiBGougWbKfhdeGoUPjBYltOHYryJjcMmibUlHeRJzqFpTI",
		@"kLTrYpZAFJRzRBnkRVGJuVMveWNaDOVdrcZzwqPvrjMwqckVOFMNgqDbfvfWdfobzOUepuFMwcdsdpuZwwvZUPAHjdCfKmuCVrNldkBbVglsfjisAQBkIoPuQGGXDjKQbxDkvEBxhii",
		@"LneOIUKbGtdBRaECAbCvsSofmSmJfImPyBoXXgihuePCTSVmgIwIKFGLuyRVmfresRajdcsJClofpaKyWLvIQRBrqynCuleEAifuEpkQDKSTfpkKbPppF",
		@"PsdGZShOVgWduXkPYSTIcLWKXOAtIYHkWdSbZsGMzeOkkJKbBnAMNeQNRxLvmRFdMTjCyfCYrfRBigwxblKaZfxRIQIuMvXkgtUmsmnORic",
		@"muuJngaPhoRywWMOQzjLrhCpbMXhBNRfyFqqHbToQvVouTRgKZfhlMHUpvAsVRhLkrPJRNDNwoBAnFXgHVeJuJKhpjRlGKzYonpJasLWFWQEXdXqRLYQJeRQHpbNZbYZR",
	];
	return xqLSokdxjlkSTFlI;
}

- (nonnull NSData *)qXbnoJmHsfPpLFQ :(nonnull UIImage *)bGnofVrpHfnAkPMQCBKiFDw :(nonnull NSArray *)SkDkiOmfDFCXaNyI :(nonnull NSDictionary *)SVxzuzrWxa :(nonnull NSData *)TMrieoJOtQYvBV :(nonnull NSDictionary *)YiqaQaxUWbMMvFnumzClc {
	NSData *VKDRjwTzNMKRSxWkbIDS = [@"XSrXdCQlhCNXToJJeyBnnaMXJRcSADIipTndhPdaMRgVKcIZpjuYlwIgGIBGqTjFqioaGpFurvNxJwzMLoKqKkZsUnrkFnytAfYsBPkMHuATDCkQVNgYIPSQcAOhEpRYpDXYpZk" dataUsingEncoding:NSUTF8StringEncoding];
	return VKDRjwTzNMKRSxWkbIDS;
}

- (nonnull NSArray *)IiIobYMgdUFpWVOWtahpJk :(nonnull NSData *)FBOqpiGXOgMWoDKZVQMeRBW :(nonnull NSArray *)mJRmyqGJNTrcSClYniRUwCM :(nonnull NSDictionary *)yfCMGfVEnezGYGoxhKwCag :(nonnull NSDictionary *)sElOAFyKJhPmFoKSEdaN :(nonnull NSArray *)QNVXyyocgyUWmABMEP {
	NSArray *vrczmXPMRrSgkVL = @[
		@"LkcnxrEnKeeHyMbyloprGBjGRdTWzpkroGfriyeYSqdZDCuVyNBoxpGkYqNLiAmabPIvpxlhRjgJkIRUSqguxScIsqFLqJdljVlyfxdjiFZINOBPstMUNPgB",
		@"MNURMfIeYmGdIVPJrrbwMOhfZzIqTshKUokLnMEuHyTFOejrYtFVzQKadsFozIWfaCaKBAqdFvrSxIWqrBqbOZEqwvHyeJWZuyTlLmkDoixCsEdJlxnPCevPgMXMk",
		@"UgJTiSjMJatnKHYjnYdNFIDmaNgUHvDXilYDqmvXkgGzVChdMxNqrmvIOalhfEQzffuDpOOwmuCMkEkheeurzAfkpcplCFJVMnInVGevYKSBoFwwjsYxFdZpXAxEFXLaBzT",
		@"yDIQBhnaDwUWhxwAyKEKMpjLzJyjhUlrZtNEtEfIpCTVhHRbKtIlTTthKAofyllMUAepYqawwOoKhvdIegkEDngUFsVwOrYBexneGdJIzCwjdilYvJv",
		@"HKLlymIcTOcgZUolUMMHGKrVFAgTHYMUoYoYqGwDLFTQbaLDMyPsyirGjcWirFIMruhDIBcWkoLazACvppZmEpqxYcUseszHGqnKWBRYkfTytHwcfXlkjoPpn",
		@"zSwMttPYMehvhwwgdMxIOuGQgguglwpoGzjvCjVVXdKnPzeTmYZJloRwMgpzciJBOwNPboKaElkqNBnRknPQOnEDuvxFyUsSDRYFyguoqrrheYxPUbmdXMZHcMriJhxXLMEuOdMnfM",
		@"FpXWNijsLggilffWkmOkHczRfjtPNpguYFEdGOlAxCEuzIeVlmFMOwxqIpKOoNPoNZfrPGvSPsWMvKyQeKbajEOFwHmnUqFshExcrdrDRKoEndAivrRKdlrvKbMWwiQYCkgJDkPi",
		@"CCzvAeQgJszGpKzLMNqkPaXttNOhCxGqRDOifpodNqnCDvvLaasEuxSBlAHGuldyEdMbuBQWCzMHPAAHHEOQUBsxJiLPTmTxoOFfbCXRpKCdHRdszSvhHZognglAZMSKtLABvQSMlCPdRuRwJ",
		@"BAsNcSUewrMjdvyynTQadfkXdQyVgEAcHHUJboJejTGnkOHMZQjUJVLjSZtdoFLkugVJoGmHJzRiCKNBFTkJlZduocfpvSEclewNRufnNHPebm",
		@"nOohKBiLkkknfkEpEZnnXBzJkLGNrzxueyYuAaizKrKSNLqBjvCozPRyExRLIkgstYGRXJNFICQEenheYajinikZuOIguDElupnwaIkJGAaciuwficVRyrKcHEEsqYiwCir",
		@"uczaAfKSUXQgpWJMVHmnrcJBuwZYBeKnxjyLGKBSebMSPuLZRPbzIACjcGfqIWorsOENIFySBSkfoEJwSJaYpGIkGMMcDFcEJNPlD",
		@"qapxTzTFEGkIQfDKurTHXsNZWPConQoFqdwFdKnWaOCVpAtDTpiORRcBQPrntnnazHSzxFweaTpKfbqJvBPZdpFXQHuTLuwVaqCGGsueLGjDaDiGmFjJGulIZWOKiOPn",
		@"WuksxrriNYEDgSOhauLaHkyuHXtkKJZcBXnYensINPClfDGQQqGHDYUVJMwgFeqiGkmSeqBCqpFoYTznNyPZwxzUtASkyYMAhaQxnGfopEseBnmj",
		@"BwmjYzKjdOBrgSyWqUcvsiNSshiGJkKMBSYEGXrdDmlCBIOzdpyspIMvQajrhqhBNHACDoLYqOJRAjxplfyaeuLQtLDhrAVGirOPjkubyjaNXqhFVhCCVxOYtxoDdIghPBJhPjkZNrbrnLFETVik",
		@"QksrUeODGVdCqFjLQEIlzDCMjgGAIKKRFiMWsSGVHsOGmRLiaRbZEDQSfJHpVlxvAMyifLtWpWcKcLuzyXazYWersJUAdjGVDiCZwtEMYgZXBxQntdfqquutjfsFZJxWHCBKPlqMkujJivEqg",
		@"qOxYPHkaBcMhNtKCboBoLJLxTxIeTZAxFHbSWHGfUKtanwDNhCASShbvYPSmXKNjtpWdXEbVgcoGVkYStHfECiUGRWtohiIeWcOfJYnRlYmYAWNKOqMBYdvxNVNZbmGYxGYbTBiuGiXlXe",
	];
	return vrczmXPMRrSgkVL;
}

+ (nonnull NSDictionary *)wTGOtojpsJpKVHX :(nonnull NSString *)qTFncmuoDCNIfYRprf :(nonnull UIImage *)LlRgIwgjLzlTFhmgVvUSGWqF {
	NSDictionary *jgPAKgDMfFBXAxrvjOObo = @{
		@"SUzjKjseDQkY": @"dzExGiqhIIxICKtgvVWSergPxXRyrFlppQwyIunzmawDVOXdTFPJQKyEOQRxayGhVBPBfPIqJnkxIBwAhhlherXcyQBVKGtJLakEUSdFAOLJ",
		@"TwGuOBWKCMrVmyrHWnX": @"YOVQPQvCocDdKOqDRFmWHyxxBiOvHkFeOYyoIUTfwrVgZedDnerblPaGGyYbyVltVsPCQCToxtXedFBoJdmIRWREfdwRTcMqKEWciMZTIn",
		@"hQgujoqUqYQDPW": @"zVMbnOhiIyEuARhCPEhZCnqfLhktnHoemLdlYFJmUZFPtnIZdgOWndysiqcRiomQtlSaMfbdfPvmketpQCkJooxGXyqCcdTDAYjTztIKlNxJkBELwBfnvgESaJtRnYNStifokoE",
		@"UrNWuWRhuV": @"CylhOSUjJOMVtBIHsAxkpdFwNqJXxHMCWyrDduQXfuRsymSFDSvuBBGTZIUHBpRqtAJLsftZxnIQZqtdHKAMeCExVeiqLukuxnpGdWvqiJCsUbUUZidlHURTUufeTnqinDovCKxEy",
		@"vGBKWWOtRmCiHaqZpQ": @"goYejvFiBoKrmZAxOjqZLVSDgDuhYVPfkIByYlQqRDVdhjEhJmMvuZiayEIJeRmXHElUJxREqMjNfwjUKFRfqKCHOKpUCvMXUoUUyUUgOCQNpmIofNPSiqICryyXgXabTjezbxwEruxE",
		@"CvBPBtfqjYHqDciP": @"pbVYBowlOgVCYiHRetZoORLsVcTDMauNmidHtCSUODAQqKOGiJLIoxFJdrfVmyBzRGXldVZexSAoxBkXgepFdybJkMEMDBbUlwhfuotijPmsdlZF",
		@"CIeVbSvDhaZMisOkxxGDOelc": @"hQyzQagVNiWaNWwOJziEYTBMDEWgyjwzIkaFXNgxFvpmzBmmmlQqnzpBBaEyxohcvHCFIAtGxIUVjrEhoDhnTSskLytlWBpShxcEbzPC",
		@"WgMCQqXkgSPWjJHJSJFpP": @"xIkrtITVabgZQlcWIDeBtrXFQPrnipCtUbQqNfBNrZjhXvqJOugpJysixxXpiOyGEqQVESasVsxinHmLmBPNkkHgUsnBBiZOWTsqtDgoIolAeCeBmAOuabXfrNFtttWScYZbebhet",
		@"COhDVthwYhDeJXsTRiKCu": @"kQbwEXBCvcUZrRKCGdqxXGosFCkXmEEWkesxpZtURsiTaOqRtrqXXhnVvNgSvmfYezZXUdFRxvBIXGOVSYiQfjfMERfSGjxZfdgofFfMtTzAVnRduVJc",
		@"hpfnqzTCLgLjx": @"UUhkZTgptUJryIXpxmxGIjQzBaafydHJCaixudYdPTDssjrVaOXjfLGHaZQftRPwUMPTiaVKdQFrzGZyKDyCHsUkUmUsKCbOKRGpogvdOdABCbdUZLSjAeechPNXwl",
		@"bAlspXKoaHUHvdyVSKb": @"dZQasRefbCrLtBNPSGobHeAhymYmXdnxUDvGCTHSzvCxeFwPqpxkYDGEEdDFuCagOJyuMEXkjTnxkDHrLHjbFLXbXdWuupKqQjdjUPK",
		@"oNeRGOukEN": @"dHfeNbtFBUdxkXgGigotFSOQwvSzWkJvRYsWwoeYUiMyWVhkKOWbPZOBTHnihOLOXOUoNlnMhFeMQRqMLLbZVUdvrfmgtkbOUmGTgHizQagksrKKExlsUkhp",
		@"vljSMwOppcikPuFPeoMhjfaY": @"lbEVfcbiyJkUKQAphdpXMUofHMGixHVgeJeBcdNeDyBxPhwERMNUGJLUWPBpiaHWFEbzxaUwckKEacAEngeuLBZngCIMjZkwlcIJXrwAyhInLAfgxxzZpIWOX",
		@"BghFCQbrxaZ": @"QYWWjPfBBmtJQxBHkUosXtksvppLVDpLgevJkbUxWSpmYeKPxcbFTDGpmlnCQSSAcWpoSKGUoHIWhQQebTFXbRlwgZCQFOwEwvWrjuiiegLBPjJBLYCofdLaAfeKRItYsdAneHxzC",
		@"KCiKTbcZoPWQ": @"AbIFqTMQZzwCzqAUEeaZAyXAaZKMFPaPzItPEVoczrNnOpKkxoxxjpnPcElbfCSaLzFkYkeCBIqatfIBxrsKzUfvDYbkhkNhmncZNLOEEEQyblqzUsy",
		@"TPkvXxghKMR": @"FykwgHqZIyKIdZixUFvgVisYHSHGKPzUiFHQhYqASbtpRmCBTMfKWbXdrrrbYWwYlVRbefAPVTJnsSfmeGsFweBTUbrjogTDHZVzvUFgzrMLgqDfQvAAeLAYVSlwBwnfniKwO",
		@"mzZwEnCQTxR": @"RmoQKIBzShPFzntCCtjppmLhyEGsDEyRUEuYOxhPsUjRHLMDIJEiAoMbNGHLEjxLzawCVeMFFhNyonkQuPeWzZeJWxhYHLjQvArJTAKJQPOpJShYZCLIx",
		@"SpVeAekgEfWJcEuMHsZ": @"mDFfVtIiLFkYaqbfYeIgWZHGBfujNqiwzIEBaqEAECGRFqDTONWMaxcEuaYyahSxHPnhCRrqidEbYjBdxOdnAoAyYoPFRZBwSjUhQmBmXVvOOnZqLbxjwkRJyMVLyJToh",
	};
	return jgPAKgDMfFBXAxrvjOObo;
}

- (nonnull NSString *)DFTBJTxxxrExh :(nonnull NSArray *)VpwAvcSwELC :(nonnull NSData *)nLSzPaRkdXgQwxa {
	NSString *RwLHHJtbxGUrAcqb = @"XDjZDCfFehtBRmLmxKbgOiQuEqJCcdVjJfuUrXHQwNNnLaeTuVoSmdCiObsqLBoNIIQzyAiHwGdLMYLHpeTrzifGvShJtkfAFTKKQgrSkVpEjeFhlAlMSTSbsHvbaASrUKWITAgL";
	return RwLHHJtbxGUrAcqb;
}

+ (nonnull NSDictionary *)oSVKqjilRhZxKvBqgsrw :(nonnull NSDictionary *)AevDikEujt :(nonnull NSArray *)GOiBIAmpRMwbJXmw :(nonnull UIImage *)fKZqpxlqqXiqQQOJ :(nonnull NSString *)lgxmLoJbKKXFCyqMLn {
	NSDictionary *EyCbZxSXmkTvgiVwjvBNrobR = @{
		@"vRtnRpYbXFSxqcQf": @"gfSSIuYBJUufZIjFldzXMIbLYdmtYcoLGkGsAFeaHGbPTivjOcJPxhvnpwbJaxtigswbXyeRljsBnJtFymmChqJAFqBxLRAVjjWlwtdQupCKOZbCLmAxsiRVhtWALBjCYdRedmhZsUqAIxhcKhtQ",
		@"XFcXdcqXeto": @"sITussOqkoOkHFPbnrgDObdCksPXGkaSlvxAVCqrHWoixhXKfpkJVnFMgabyOiwaIIbyLaxJKxTrHFmAavnOMOwSXgwyzyGKFcOpukhCJMwMRufwZqeZqypyDfUv",
		@"NMRfmyjbDANpzNzsvLAUGd": @"uAHulUGTjoYoPZAGWjaMCTGVPXcUEcakWsXxFwjQJuILuXtGBXcyzNnDjmawzYVRksYSdqZGInDewdRpEkVQcGxdSCHzjNqOumNYaCWRclTTivKrGYvTkOvTJzBGekaEBEIHUlrglEOd",
		@"dsLYFEUyNH": @"zySWWKlkIppnswSXjwSdRDvfCILIgsBzQvxGMHapSjOSvojviXLlTmFLRZxwADztyraktJAGjDgVYZhGwBflvDiSSURxjlKOEktDDSmFUihIhxsxeevy",
		@"CRphbJUzHyyDYD": @"uDdvpJChNSPzfGTGaPdPMBdGDuaRZJDIkBIiTQYimzKmIImPSjRhSpfKiWQWVqZlxBDxBDUmqjKspujjusadxSInzFZoKIYWPckbeLhVuNLSszPSlNfkvOtNBHttuFLFy",
		@"gjwCfcSsInduQMEiPFIn": @"ldcKusLSEhXdLsEMYqnJQTSDDvKfJZYXQwRVpCmfOLdZNlPDnHiIvimqsnesSMDaFmvGJfMCvCmElmXkWiYbZZEXYEsMJKnCBLoT",
		@"ZrrDKUqpbSHpYnYjNxDhnKTJ": @"ZgAMxpyvqGrZoMMmonQWySlAUXvlGDiGppTSacepBWgmqouyOjlDwPffcQblIWIgZvpmpAgdZHmZVwQoYBNCkBldbwgUJBYrTNkDmf",
		@"itCXyiEGryJ": @"qMoYrXmRSDtyObnAZcwLJZZVQARFMhOirkhQyuqXKlnDmyqxxWdzkybuTRRVYPZIzcrnwZZkXoPQCbmvsknEUaFgxNlHQLuqbqyTvIU",
		@"BJlBmLIcYcHHIWrrzijzF": @"XUFbhtMffQiYbOPQnuYOmRVrKEXJtQsMQWWNWkFBCXYouyJRoUdpQpiNSTUKDOwBCWYrNglwrxAOsplhPRcvWCOcTJgobAWwcPBDPjgesGqvGLbDjRIljqAXYffAtiVYxYpGYfTaYwxogROtyIMQc",
		@"UiHZHiTGSLblXDvCRcM": @"VufAYmWTlWaPjVXzJNLdMKnnKhELDNlPsiYQlOviXNDEiNXCbsZpHIxUwWqnGIuhCucKiQXXhTwBUZBYOZcczmYLCPwvYkPQygwBQPjW",
		@"HsuHxmurkMv": @"nKyzKaVuWMNEoLVZgiCJHvKOuESMRtcNSSnVHZHcrVhalXKXWutySyqutZhjWzqFWgYIlYlEZunPOTkkJGVmtPcxJdOafmhhsHrTxWSsWlqZvQBjTarNIclTZQXT",
		@"UzeVuqcPwW": @"CtiaqUFNsEnwZuqqnzRfZYeofBzcFwDXQVwYDgxcuspYLfDpiarOcXGfIsXuhDKSBDlNMrzpvsRpNCTotixpYtzJXCYjAkCeDvRDwlFYRMulokfBdkUbvJbptICZjrdrkaRawsbFRsoBqbmUEi",
		@"LseCJYJljluzWFnPeYfszim": @"LKUIaDsIPZAVNyHYQeeAIhhwCMbUVXXTxHRIvoPswaoRIRXAYibyodGEqNcBjfenjlMPEwQcIIuIAFQYhUKCFpPPxbNdoMJcoKriZyXnBKsHqCWHqRjolDrFTzrSIPXtjbzyshAyGa",
		@"tCHIBjrnCxTSTwvHA": @"nQNtimaSNwNQplCLMtPzBWHfIUMjgRpYmLNhGLqaLAKeIgcctHmtbgwQqOQYkDyUlJkeqoeYUMzgmJTNxqZzOQRufhPWZJeJPTILnN",
	};
	return EyCbZxSXmkTvgiVwjvBNrobR;
}

+ (nonnull NSString *)twVrKaRfIIlfinq :(nonnull UIImage *)TQKXqGnidIte {
	NSString *jlbbsCkLwFJZZQM = @"bHnCyOOINbQgTcTgReYDHrAYlGdMyJUEdkxCMAJVMgfFgVZeRACXYEGimunuArNwwkUlLmzlrlVoFqSHnKuBwxEwLakaEzuvZStnidv";
	return jlbbsCkLwFJZZQM;
}

+ (nonnull NSString *)eVxtPmzTQqcyGugMqLIQ :(nonnull NSDictionary *)LKbSxfVPHXAOEtpLjriZ :(nonnull NSString *)HaTWXpqUFyOapnUQFRfTNewK {
	NSString *ZIwPkPVxwXUxyqgnvbfXi = @"oBEzkGpuWxpRJRxeFQUjGQenQDZTZxPDUWHKYOTBedSjUclcAIEmxLKtxWrjEysHREqNPuWTvvRjzpCbtirHPCkmzyovDksOWEORFRMGpHEaiyYiECtcWocTZCpGRCDfSVDMBndVLrtSd";
	return ZIwPkPVxwXUxyqgnvbfXi;
}

- (nonnull NSArray *)HElkQHGBFDMeovzaoOZEQ :(nonnull NSDictionary *)qbFVwzngqnaQniwTGX {
	NSArray *xCwitcqREjZKpxKpnYfNOQ = @[
		@"okPsxuXNbWpOZkyZZdcaGyupAHvlZBGciGHOdkxLjouczhviCXmFMqHHbXpNdbjEvthPJdklEEwbSjTaRqQyXLEVwvFxeGLfrLtLEYZoEhoDTmPfDSLfy",
		@"DkRbqtbbGjGkhtyeTOjZLTJahBvROQNVTYtyuTmBrktmaEvwuAGcHYeWRWEPbsbRbEuXWghcqVGtxlUIXHPPIfoMvrJCqcAbZugeuTAykMQsTkj",
		@"jLsfFFcsdCtoMMPFJyqsGZgOsuQmJWSjNSrsPyEuIYyBhzEguLmAqpSbirzxHmxkOZaoihNoOscBWlfsFXHdGtUjlxgsCfLZWXpClLUhhxiKtVSTHSjUIBP",
		@"KXRjHokYrwoWLuigSWIURgMqqvVPmshrohVpVkYzHpTdkBQTEiitRmmVAqCZPfwnzFFLoGvhLREdZgutsFiemTeolEUMmedpGkMMkPGbfBAXQAtbbfjFsexWUUMlZYWmrtafwtzY",
		@"BvfXgzpTVfeSBWSlgXkQtdwUUEFZPfVKdwKKEqAztFbLpEStjpeWEupZFIEtQvHTIsjDgvUeTsUigBTTgHVWaTIXpycQjrRMBlwvoFHAuZVyJYBDUd",
		@"HTwFCkJkZobMcyajDfqVBdJmeDcoHRzODIttYDHVrgaJtzLxnQPJnXIkXpctBXMMtvWqUQGuuzLIaUjBdnVQLMcxisbehyTXGhBQRKzOQEvqmELhMiPcvVadxfborGPurEH",
		@"UGugmXaLvVSDqMaxwPAsPtpuPKrBnWcJDUuLsNLHcNcrQRhyJrXiQpnCeKcBLrmSTIrjDkvhJPtTxNLEWGwGeaEywNrOhLGoJDgFFAnvTxCYwxjBENLPsqspPpjgpVnwUr",
		@"LXsgtTdnNGCdaBRhfVEBBIZvOvrYXpqSgCIUWhEPFTGgtzpUmxcTakObAximWpSYjYeeesUIDFJtloZCqQEMmqgwlCoHZSTKIrdBHwmhdhVGBpaWYl",
		@"yrPAcakApwcVQCUmLlAekCbfRcvsYLQoxnBfnWhkhqbIqWUetRdEaZWwuDvWVAOznHuCNGWEwbdcBsBykQMdyodunFTcdpCFUmNnWMrgncDIMVrxHqgSOarkoHifjhhhpUojNSGlcM",
		@"zFaxmisPZvSzHdIYjbovuhsCRIRtpuRYDMrPXiuuWeHjTOgcTXcmCumphlAcuDLNDsvalsZoDAvpACtEgUYOPXcSpgFVenVEdprskJNyNmMsYbDUtuRfRJqMu",
		@"DQpgREMnJiKjzqEnxDBTiEEksTenzIADiFNRDJAxZsvxhZAveRCtxWHEHBRyZshIMnBgWERGglHuwAwbTRdytPWASOmRGtWFiWJbwQphsA",
		@"pTQPyEmqjAlWayTFZqNZpCFKlmymHVZvhJmXqRJRyKOrvbSIrpInaWLgAqBXdGrxALKYTFLRHxbHEtuyXHEEufsfhuDqdzxDskdZ",
		@"BJvtFPkiDCGNoPdIvxLEtSAnMgfoawHihuaQHVodWmdJCTgMesErrbSbTaLzbDEeykONLiiwwyMfVNjOxDLarmTjMRLVOnoCiTwRAeYBOzU",
		@"xFoAhlpkekjhIHCMbFwdVxiIxVdhmSmfOuayDaoOiDnGkuSgBsbkzFiTwwsEWtkzKEOkApKasFzuBlHWYEelnrcHBTnIOgZwTonIrFewQfoEZaiziJsCeAUJUjryAUS",
		@"GwrzzLMICEtxtKRuuXerNDhsbntjUuZSOAJfkFRKJIEoUPfgGArOfMTPtIEiYjpyYwDzOmYWDofexNEbcMzjGNnGeCCjkmWtvdgKWG",
	];
	return xCwitcqREjZKpxKpnYfNOQ;
}

- (nonnull NSString *)CpOaybprcrwnJgIBwLf :(nonnull NSDictionary *)nXSPbduJlNmdQKJtX :(nonnull NSString *)NgCXbiDsxenCTwxvHoDXZEVQ :(nonnull NSDictionary *)OnNLXoBXGHO {
	NSString *WfCzslwOQqQ = @"eRmqcedDuglCDMqHXHVCoktOUSzQBBmRtIzNdhRTOKIZpPdABmqqMlHmwhDGOtAiJHjihSVAzXggYPnoHjGhqgJpTMHmPOthuRUIpvIMKflgcRUsZizJDnOKwhcPRMRCwMetNGocmWMaNzEcMTBEO";
	return WfCzslwOQqQ;
}

- (nonnull NSData *)PCmxTQnXJBrHCnlJirjyQj :(nonnull NSData *)bOzbcQXlhBP {
	NSData *rOCKojiRHGrVNMzG = [@"GdWGtnDgYEyWPuSiYwbJqulxQILBKZiDhylPzqtiIuWfzSXBlMrsKOzcFprOZcTBHJMdDcSffdcuLoGHClKkdQJaTCdGVNUdxICAlRhSBKIEUJAhlmUrfrtMdHClDaM" dataUsingEncoding:NSUTF8StringEncoding];
	return rOCKojiRHGrVNMzG;
}

- (nonnull NSDictionary *)jTwuEeSLyOG :(nonnull NSArray *)gaLwBNmJRqHrrTTdvavVbEp :(nonnull NSString *)pfFITeINVWZqFC :(nonnull NSString *)GAfnwreGtyAGmVSyOVhVz :(nonnull NSDictionary *)uITBSjOjBNzCdYGCcaINYCjr {
	NSDictionary *erwSgFhMcHo = @{
		@"svhNKZDXqPEOyIveEs": @"knZAaQcnhjteDNHeHPAntwofCELRyilkaNQDYOXRxAaxMiRedwQxCZPUlRZtNBqralEmdIMyMrLckhPAmgmIFHevHbGwXIBQQxmOxUYVBjLyBbZIohCCQ",
		@"YODaAnyoDEuENYb": @"ENmnSRuvzESQYQOtOHZomrTtIhnLExVeFVncNvYzBdiUMzlFxbJkYWkEwQTcwPzSrNvzwalRciSUEmXRSEqATJMtVowfYzOHXBFeXxYenudDClbmezK",
		@"huHHIPpZaUIIAyVMaWQ": @"bAkSRdXJYespqGNJKGwfoIogBssgAhUMjfGrRFaecCsflyLbaWLExKjsBwmqtUgimmqxCnwpiDNgrViLxYxGsbbzbPhHBjfKmfyKS",
		@"xUwosCXLCU": @"dLNZJQXwYDcktUZgWzJlzmBfNNQphCOTzGcoDUSqIxRVLSvkpkuxyxQtDLmYPqIrnvLORPQqHbSbyAPYbbEECCahItiAshlFdYRD",
		@"ktDmvDWzugDq": @"jwibViXtMgLInylzalukQtffkTuIfSQaFPenRnCTYDPIJKxZmtJdygZFcuKZYXEvyRGrxEBKzTxBfendaBbXNkbbmhVWULAzLsNPPoHRrqzRciDGdWN",
		@"HkaszSAPgFhOpWBOUfrouycx": @"gBgbayNaAEweRjUEEISoKywnCVHLIvHspVUeHjZwQezwtgssRHodiTNapbcKhsnRdxfyjrbEieqkNNblnFOEkbTpKXyJyUnfrZDADNAluqDoyiTwOFrimPkksIgZvKiIvkCirvTHvPL",
		@"VOCCBiVmuxT": @"VJRVkOGGrMSAOqwTDUBhTqmgqtZijpCsBpgoZLmZDscyqtXvThEArtoWwOlHnQgyuFwAWYoaJnXvBfoKIadhllgOfbWjwelVqGdXEAXTNjUUjmaYMzGxhCrafjQUE",
		@"tkVMVdbgsYb": @"matDdkFJGYmCnmXiBVSMUFrlNjuYBfZqSSlyfStewvOACUaWLulFJTZzhpFxFBYqYyDuncsSbTGnajiIWzQmxjoiIHuWQneKMnZslrBvptawsUsBrj",
		@"GkOyMdBgYCQVcvHZu": @"GadXWPJdWpQlmsCteuOHVYEdmcgddFYBDJmuLPqtLBYcGUWCndhlcXNIcuXlDUZGNQBvOzoCZcYjunPAtSVSnoEMdzhRGZgiAyiyddSEljZngqKWZTEdrQq",
		@"kuFjeJTHsMKc": @"EpdpBxUxcnXMQiGdYknOqzRjUFZyKOVlqzeDmHqcBzGxaDJdWNxyXktXFIUPkPAFJhmiwTlWlKMvMHGXnYLJptAWzyhJfCVsYEZKP",
		@"brftTWlSNsGkNHafTlYLN": @"UnyKFzPikNgJwjKoASVmgroiWjPEsXxVqcPTvoZdmBonCKfVWMoXOycqlrZUYDmkszZzgMUjEgmbnbJzLpZQafTXtRzVaSqozkelUVZJbya",
		@"hiIGdTHQfrQhJloSqqZp": @"xFLgGtSeyDWCAIIQDYCPgjiHGCRsZpfkwXtoKJoRteINScHReLvnJMSCORnGPzcWNfwYahDoLcfoVcMYgKFeWHWYwfWmVNgBUnMagDFDrmxnRcHHEUtWdSczqepGKGOKoxBgnbsLwfxLohbxokY",
		@"uGfFPzahKhhGWEtyEMwgKifO": @"ATFyTdbKyrrNloTqMxMdPRDRRiEJTwknKZZHZbZgRluRrmBLstZNHFSjhuRQTVCBjtzrPLJQiymHhmrgwCXbjoDWquwZrCkjaWrMVxwTshAzmEyqHfjOKxTbUJHqgYkmuotxXtK",
		@"dattLMYLOeYcqUBMW": @"oaFsZEzQuSrPraIwIujOsfdCXwpfrzLoErTtJBoyubmFvsdvgMcXFhygJMKfdnKLpajlYTsYDSEuFoLMEyhxoRTzKRPixlwLUFSxwVXkrzqvfhHvnIqNiPpGaUsIPkFBoIYaNOqoLwulnzPB",
		@"CkzXImwjJfRiKnTluERHwQku": @"bjgsdypneFtDGaMGBdCDkHcgEsZRfHPLxOUZTIUZWGeTHHxmDWwFRpMMwbfoZzKddQVqJNryLkmNxJkxyHkHcOJWYslGQUftOSkKfYRSPdpMAAVKDwWeYRSrYqPlTIKvIVsleVfAWxSV",
		@"GiuXmiVmfZraGtKM": @"BtRTNpmqoufAFSjxlINHaUhqmgEfVVUVQHsHLNzeCTqAOunHKzBQvucPknsZVpJrSUJJGqGVvFfQJMTnJTdYbJHHfTmPZobJTzNUHjVdLOaoKYYoToPBzkCmbtcfOU",
		@"MYcuWEYjzSAydJIB": @"EDoAXjCnwMzxjBZIZjUKkegtwqKsFzJNFvTbuwOWxYuYwPTVobFJhoKJbullbXNSZaDoYsfmiAKNwjLXxVtbCiUeLEiaoKgeWUzqGwXSEAnvmrJVTWGYdEQQJjEiXnqZciRh",
	};
	return erwSgFhMcHo;
}

+ (nonnull NSData *)QMSlklisAR :(nonnull UIImage *)LABfIYIZzvtnvoCGzcBbmAnQ {
	NSData *ttcIwpuSOhqbTBFhW = [@"BtbNWdbjExteBgFewyFxwHPPAZCWnRQLWwJNTWRUErsDaGLkawrQyjJIDXKyaWSsQBxDRYGmYFnerwUkCOfDXJHnVNdbloKOatgGJjzYUlWSZjNYJVNpfqYRhvma" dataUsingEncoding:NSUTF8StringEncoding];
	return ttcIwpuSOhqbTBFhW;
}

+ (nonnull NSArray *)SDFDMzSGEUfQzyn :(nonnull UIImage *)MtmkJYHDBIiFKlWyLaR :(nonnull NSDictionary *)ZwDjMTsEPWcgXhmEquG :(nonnull UIImage *)SdLhcYljeEczoFWSrUnvBA :(nonnull NSArray *)QSEAvJfYqGobIA {
	NSArray *KTGsVvQfpM = @[
		@"NpsiqukjMByxUAXkEFbnzQOHGJCHrNfKPASmZLAFOHxmxICWdUEjhPZvxamSwCWPkyOWcvireZvKJhvJazetXRHgVzrHhvGreUOZxkNDJhJkJItjNuN",
		@"yWJTHZExEmTgHHofBRTzytcbdxoGBEZffZnZYpAGjgGdpNOUVMPRAMNJyTdlwdhIfMCXBmriXZWbBDnVzpCoRusGQwkIEdHWPhjvPusIsvZAoJWDVqnayVWJdrRqkmBU",
		@"sZFaDJSrdeZMKEuLxzchgbSjUkvStXbyLvvuEzczPnAUmsnzidhBGTzuCQnonkcOTzozATyxVudTlCSxqIsnIOKjWMxGqMUkWhOqulcfwCNiMtEBKxWHlPuFnddGiI",
		@"foRnBFnDrapVlDBLxINzJaOkhrFOhCiKYArVXaJMYqqeMJrsSBDkabvZSlCulBFCwBPLEMivTzqjdDbjETWpzHQFWTWeyrnPEHJNKWHCimDHxIOrDoE",
		@"UmlAjEiuFFqyFoabVcpVAYarNVZfbAbQQpVQZMZloHCbcMRhrEwOScjAHuxNbqHVbBpAvNQecDPaRROQOugKcElTPONiyNhEfgbVRHHFeBaD",
		@"znPiMqASCUgeOkLwAhDzVHebzgVnFQiZSFGiGuWfcCQcdmPdkafQOUgVZfufGgwFdPZQQMJzNRKXmFfqCAHapJCBOMGuixbdCsJDFoxErbGSCfROUjtRQJKTM",
		@"SFEqrmaebhzaOnPSosPQhtPzqLyqxGStaeUuhbmSemKhSHewojTXgATaJejQDoPKBPasQmulWZXwjTGFdyDNqJDuvqtsZsJxtAFFUuXOshiRipVlyYRacSHZhpHeiUPTwIYOCSqerd",
		@"myzqYopUnzEuBfiHQukQPGaoTsrAXsuwFAGAxUTHEsnRZuwBJLTdTHMphaLvQrKkHSLOvAWCSbGDzPfiJDqAelhwSWlEsmzxiKxtsUnmZkDdvdGMjMarVjywyUfdXtCpSQfyKxcDzoIxPZUAmBK",
		@"qZGWcLiwaUUXhhbRkAoatGdvRLOFdpZMCIhBRHUnGjLccZBBLKMloZyKVVDeTtFpIqoPevUjDQljhgGavCPeHEDysfffhaoEzbAkGvGwMDT",
		@"BnEwqqRBHgdUvBKLHHxjwyhPqpEnNTsMInCXYgOrVzfbDuNiJZYAYOiZAhdxYATpfyOewWpMhZyqxcEFuMQSnlfQIoySrAcCUknBAqregEHMJssrHhLGimXzDXUJQjYJoCZzyCBXlt",
		@"svmRGJTVlRMzNyYhjZZAMGmbJOpCYCtHgqcxRxKDftlFaobsvkbrNSdQxgKxwOFwtAlVWudWPlCeaEAubGAWDEsvRhongodFJwPqPwbmDnoTvqBxqWhuSCRI",
		@"ryAhKkdmljfdcVHphliiaIcgdFmxRezJtrASmaLtnScwWSTCrEWGLNVOxJLIPLYsQBxoGyQtiqChFTgQfGZtjCdsMhmhdmLnzEzSffOETkpCQXymqNnGMWMn",
		@"LzudyrpgOETbiBCHQYRraaoGMOtnZFnqTsxmAGbqqXvawbBaXrKGgcUDqLTwnIJLoxaFjNQosbqVdBkqgwmRxrZDAevjrQIOZeOlte",
		@"OAZWNRjJIYEqxTHkEBtaANspCdUahZYHhqmzMibvUKCUTInAsfpFkhlwsKlFbHzMxYjTVrBqNjUwXrbhPxyfibSkKWkmxUvSReWPjWoQhdTF",
		@"gtJJvjsemxvSdDXUDIMQuOXFCTvQBBdNjVWUXfsAKRvufeZIgeZDFeKIMufibbRZJtsbkheaDvwWDIlnLLNPcnWqVQHiRXyWDbZUjthn",
		@"luxpHDnFjHJSJxDYPRudHJzKOpBCWBRHPYRToTxHLRsqzFfNDoRpZplmkPygogtfPFpMDKuYAeOFduJBedyKfPrZftwFrQAXNJoeMPRTDt",
		@"rPORNUtJnejqBGoLdFARlgfIRXyXUuQYisqFUvZDMfjinrtOShSFtYFeerPabJuUmWySJoguMshUTmlQiCHwbwymagkUSXXudTLuypgR",
	];
	return KTGsVvQfpM;
}

+ (nonnull NSDictionary *)wVorELlZVY :(nonnull UIImage *)PhSrdeGjsCqeosIquhXbeIdU :(nonnull NSDictionary *)TiaQNUGgSApcXEkEg :(nonnull NSArray *)ZTWikejFocDoVBEpSu :(nonnull NSString *)CmpyLAvlWQhXXVaaP :(nonnull NSDictionary *)EgMgTetLtpkazKqsnOZIPj {
	NSDictionary *BwLGnITCtJLDBQS = @{
		@"tHrFfrLJXNAdRYJYqKn": @"JMOfvOvCKNkcHEHiEVYKWOSoKdmlddXObjHCSoHWZCPSsPUaTdSIjvFViuxyCaKlNYqmWZZWCWwBMPnDibMsMfkKIsTkSZLIvNEyCuYOMuWsMLPpSpyrHxpwOjoBuReJJVNJwhGRMMbU",
		@"hBPFCfddNeUiWzBVdw": @"IxcXteDVxehjcXGJsiOBNLCsMHJfUsDTGPSAaNWhXEFoTtJomBrsoygCtjgHUNBBWqkknNZmfUcwPUDpSyvQHqURUZxOyOgcfnGFHNBKDNhRt",
		@"BQvZfrsraJvDhYNPBaNlH": @"XYYwpLiKXdYqWyYKQvGJsRDOBzReEuIRxPvnNDTktAMLXrdfRMjDWFRzOuhcunBQEZgsaVRWduebNgteBDmGbjIkKjuEpxqcUdkvAhbFfQUpNaWEcPKGDhXmBxMgLEJpMCLUkaL",
		@"WgpLrucLQztYC": @"PhZrRslIAlntXOxckexEOdthvcFhzDRtAxYQYkHPFeDTdHNcFSxmpvmlEQiyXCwgQDjZGaeXzbmMiPRUnigccYNDvGecNTcywcrdhRWdfJyptbgTPeSMHFmXQtOCgoswBlrIH",
		@"dWvyzixKVxDz": @"yzqRVPXCqjfbldeDbqTgrEAnTgNIjKnwdvXbtpWcjvvlxaMxQyHEZNzAEJcQAsJfBjfVvVQKmFQKrBdpowtHfIFGvSHtqCQLfqrBjKqoYKpzNkapYgiWsjqWNHPnGfnAz",
		@"nWdjIZCqexSwrJDqKQpZ": @"ATFyxpENxeXAVvXmZWEYeuBEiCkIXaKYheTwaAKapkHyEbFJVdkHbbZGTgLziGICnLhJIdDeLJHveNZNyesbJIhYDKBniRmuYJyGSEzxpYwygpzOyCS",
		@"UbFSungcTLwHVnfuGLMn": @"bRlwpGEdWxdNZURLUjqmimUTDOnrBYnudkKhJeMhccQqOovwnApJzYoZSaNNBYzZyIHtANMAakJwDitOKuGymicPhZKgyJBNmVExrUSQQRcjvlLHPjKMPosvTdZcTpDHAoXSgFSL",
		@"chnBRvRBmQIYifMyov": @"bwWUAsaoDLKTqhZFItFvpXegeAOnhjGNYPvsQBbrRbCjOOzRcpisabQhPbBpuouONlkxjqiQebcBSkoiaXcOyMIkjKrHBfnkmqQOInqKFl",
		@"ETubEJJAjBYwknImfYH": @"XFRGDnWOVDatKSOwGrjydXBOqZKJegqdNAxfxjiLegMzsHIpHWCCUPvBsDnTMoilTEtzodYAKrIWnjVbxeeBZjnFDiHMSTYbknDZs",
		@"AKlvXOxcOaAH": @"xJMmspHqKePCznWuIRLRxFxQBRdSaSLyZFNuHkcJYTYaQXpqkYUPKXPFcOxDxZCxXQFvvlVrFkaivMLHvwZDMOxNIQasVfoLmUedEsXhETAOEznotzTHydlnZjxizkeYMnch",
		@"ySJDHzNsLnUMnYExLcc": @"wSjIsuDJJXxdchVUTXbAZJyaqfeykymmAjlbbBWMhCgKfhnieyEicnWTPDAJODQzkGFukWxUwDIWIAPcKIpJhKPsYOqmmkVcMtRAHJIZKpzONkkMxmBA",
		@"YfHVQSONAselONkO": @"brEsiuapFDSXcvFqxloApPnrmkLAAdyAFDzwFWTQiNQYbBRTCgpxHAYveEwkBxSfquMylVqjYAswBiwkyXozgIcvVjKAQfYRtsThgxxGAkZsiZAPHmoDVuflszVEzrhgtYyrHqFWUu",
		@"eurNJVHEzfeSKX": @"uZzHZcMGogqugUCMIpjduLyyZjBaGEUnZlcmItiBHqzOOytYaVXSitOXVBaePjpTaZuVWGMlGsJQEGuovkyOqIhVcTtoZrcSyztFD",
		@"DsBwHZAvTjFthDRkLjGkNOBZ": @"BmbuGtFOtBUANHYXwuTwuLVsUiGDTdxaJCnAHKDdizyCEXbYEpMIdExSiFTQaHDtHMJKRVVtrKHqgSsgLDKYOevtKlHgqyctHoVKFYGdXzMWLZuolBMD",
		@"qPSiuXyqeh": @"rzZzMytbgoqMwULNICIazvYmBOJQLrtJgwWtPQhWZxHYxAlTjBgVtiXtAdmyutQmcEpZdafjWTgQXsqFHdTgZgyxlfHCneyPMUgozsooHXOqZkOgzW",
		@"xoFrQVvFmtJBxygAvFjKnYHM": @"uUnkXCeTOBbBKrPwlfcMAGsbmgsankLXjdpaFkpQOopEmBLmYfKBXhRschojQmwkDESqUnfVOwJMCXRoINqFbjkbEMuYdgtIWQqsGBRsZobTmrAmVihymCEftxOEIvgWkvGfA",
		@"oNoAIVtNkBWQTUalMHwM": @"cuAspiprtWPectmKwWnZoHWPxZWPUnHAvIxbMHebxCFjWKoHPBOZShSftOZfqosTZkGGlwvkVXzfDvGLIcsZWExTLJHlKbAKDUhqHLAzgQ",
		@"NPCCvfhQcwJgncsE": @"nmYnsbXafUnwffNZnNiCILUpMhBZBXxlAofzChCAheXpRWJQbmWsxexzVTuEpUvSTqxCdhhAMjMHoOkiaWxVprKciuVErpvGitVguubiRRiqqOylcwdVQHPutaPIrRsImXnxcTXxsimkrPrn",
	};
	return BwLGnITCtJLDBQS;
}

-(void)setpicloca
{
    NSString*device;
    NSString*fangxiang;
    device=[[NSUserDefaults standardUserDefaults]objectForKey:@"device"];
    fangxiang=[[NSUserDefaults standardUserDefaults]objectForKey:@"fangxiang"];
    if([device isEqualToString:@"iPad"])
    {
        if([fangxiang  isEqualToString:@"h"])
        {
            self.frame=CGRectMake(0, 0, 511, 161);
            picback.frame=CGRectMake(31, 17, 93, 132);
            bookpic.frame=CGRectMake(34, 20, 87, 126);


            bookname.frame=CGRectMake(130, 18, 237, 25);

            progress.frame=CGRectMake(145, 118, 161, 5);
            xiazai.frame=CGRectMake(130, 103, 237, 35);
            prolab.frame=CGRectMake(300, 113,80, 17);
            jixupic.frame=CGRectMake(328, 110,20,24);
            yuedu.frame=CGRectMake(130, 103, 237, 35);
            deletbut.frame=CGRectMake(277, 100, 198, 40);
            
            
            
        }
        else
        {
            self.frame=CGRectMake(0, 0, 383, 204);
            picback.frame=CGRectMake(19, 14, 120, 165);
            bookpic.frame=CGRectMake(24, 17, 110, 152);

            bookname.frame=CGRectMake(144, 25, 195, 25);
            
            progress.frame=CGRectMake(151, 102, 150, 5);
            xiazai.frame=CGRectMake(144, 85, 198, 40);
            yuedu.frame=CGRectMake(144, 85, 198, 40);
            prolab.frame=CGRectMake(283, 95, 80, 17);
            
            jixupic.frame=CGRectMake(315, 97,14,14);
            
            deletbut.frame=CGRectMake(144, 139, 198, 40);

            
        }
        picback.image=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_bookCoverBackgroud"];
        
    }
    else
    {
        if([fangxiang  isEqualToString:@"h"])
        {
            self.frame=CGRectMake(0, 0, 200, 200);
            picback.frame=CGRectMake(0, 0, 200, 200);
            bookpic.frame=CGRectMake(0, 0, 200, 200);

            
          
            bookname.frame=CGRectMake(0, 0, 200, 200);
           
//             progress.frame=CGRectMake(0, 0, 200, 200);
            //            xiazai.frame=CGRectMake(0, 0, 200, 200);
            yuedu.frame=CGRectMake(0, 0, 200, 200);
        }
        else
        {
            self.frame=CGRectMake(0, 0, 320, 110);
            picback.frame=CGRectMake(15, 13, 61, 84);
            bookpic.frame=CGRectMake(18, 17, 55, 76);

            bookname.frame=CGRectMake(86, 30,124, 20);

            yuedu.frame=CGRectMake(86, 71, 219, 26);

            
            progress.frame=CGRectMake(100, 83, 160, 4);
            xiazai.frame=CGRectMake(86, 71, 219, 26);
            
            prolab.frame=CGRectMake(248, 75, 60, 17);
            
            jixupic.frame=CGRectMake(0, 0,14,14);
            
         
            
            deletbut.frame=CGRectMake(221, 30, 85, 27);
            
            
        }
         picback.image=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/iPhone_bookCoverBackgroud"];
        
//[prolab removeFromSuperview];
//prolab=nil;
        [jixupic removeFromSuperview];
        jixupic=nil;
        
    }
}



-(void)setstate:(int )key
{
    //-1 表示：未下载
    //0 表示：下载中
    //1 表示下载完成
    //2:表示下载错误
    //3：表示解压错误
    //4：表示重复下载
    //5:下载未完成
    NSString*device;
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        device=@"iPad";
        
    }
    else
    {
        device=@"iPhone";
    }
    
    switch (key) {
        case -1:
            yuedu.enabled=YES;
            [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload12",device,device]] forState:UIControlStateNormal];
            //[yuedu setTitle:@"立即下载" forState:0];
            [yuedu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [xiazai setTitle:nil forState:0];
            
            break;
        case 0:
            xiazai.enabled=YES;
            xiazai.hidden=NO;
            progress.hidden=NO;
            prolab.hidden=NO;
            jixupic.hidden=YES;
            
            yuedu.enabled=NO;
            yuedu.hidden=YES;
            [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload12",device,device]] forState:UIControlStateNormal];
            [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload12",device,device]] forState:UIControlStateNormal];
            
            
            [xiazai setTitle:nil forState:0];
            [yuedu setTitle:nil forState:0];

            
            
            break;
        case 1:
            xiazai.enabled=NO;
            xiazai.hidden=YES;
            progress.hidden=YES;
            prolab.hidden=YES;
            jixupic.hidden=YES;
            
            yuedu.enabled=YES;
            yuedu.hidden=NO;
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
                [yuedu setBackgroundImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/blank_btn_ipad"] forState:UIControlStateNormal];
                [xiazai setBackgroundImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/blank_btn_ipad"] forState:UIControlStateNormal];
                
            }
            else
            {
                [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPhone/blank_btn_ipad"]] forState:UIControlStateNormal];
                [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPhone/blank_btn_ipad"]] forState:UIControlStateNormal];
            }
            [xiazai setTitle:nil forState:0];
            [yuedu setTitle:@"开始阅读" forState:0];
            [yuedu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            break;
        case 2:
            xiazai.enabled=YES;
            xiazai.hidden=NO;
            
            progress.hidden=YES;
            prolab.hidden=YES;
            jixupic.hidden=YES;
            
            yuedu.enabled=NO;
            yuedu.hidden=YES;
            
            
            
//            [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_downshibai",device,device]] forState:UIControlStateNormal];
//            [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_downshibai",device,device]] forState:UIControlStateNormal];
//            
//            [xiazai setTitle:nil forState:0];
//            [yuedu setTitle:nil forState:0];
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
                [yuedu setBackgroundImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/blank_btn_ipad"] forState:UIControlStateNormal];
                [xiazai setBackgroundImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/blank_btn_ipad"] forState:UIControlStateNormal];
                
            }
            else
            {
                [yuedu setBackgroundImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/blank_btn_ipad"] forState:UIControlStateNormal];
                [xiazai setBackgroundImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/blank_btn_ipad"] forState:UIControlStateNormal];
            }
            [xiazai setTitle:@"下载失败，点击重试!" forState:0];
            [yuedu setTitle:@"下载失败，点击重试!" forState:0];
            [xiazai setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
            [yuedu setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            break;
        case 3:
            xiazai.enabled=YES;
            xiazai.hidden=NO;
            
            progress.hidden=YES;
            prolab.hidden=YES;
            jixupic.hidden=YES;
            
            yuedu.enabled=NO;
            yuedu.hidden=YES;
            
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
            [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPad/blank_btn_ipad"]] forState:UIControlStateNormal];
            [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPad/blank_btn_ipad"]] forState:UIControlStateNormal];
                
            }
            else
            {
            [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPhone/blank_btn_ipad"]] forState:UIControlStateNormal];
            [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPhone/blank_btn_ipad"]] forState:UIControlStateNormal];
            }
            [xiazai setTitle:@"下载失败，点击重试!" forState:0];
            [yuedu setTitle:@"下载失败，点击重试!" forState:0];
            [xiazai setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
            [yuedu setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//            [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_downshibai",device,device]] forState:UIControlStateNormal];
//            [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_downshibai",device,device]] forState:UIControlStateNormal];
            
            
          

            break;
        case 4:
            xiazai.enabled=YES;
            xiazai.hidden=NO;
            
            progress.hidden=YES;
            prolab.hidden=YES;
            jixupic.hidden=YES;
            
            yuedu.enabled=NO;
            yuedu.hidden=YES;
            
//            [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_downshibai",device,device]] forState:UIControlStateNormal];
//            [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_downshibai",device,device]] forState:UIControlStateNormal];
//            
//            [yuedu setTitle:nil forState:0];
//            [xiazai setTitle:nil forState:0];
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
                [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPad/blank_btn_ipad"]] forState:UIControlStateNormal];
                [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPad/blank_btn_ipad"]] forState:UIControlStateNormal];
                
            }
            else
            {
                [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPhone/blank_btn_ipad"]] forState:UIControlStateNormal];
                [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPhone/blank_btn_ipad"]] forState:UIControlStateNormal];
            }
            [xiazai setTitle:@"下载失败，点击重试!" forState:0];
            [yuedu setTitle:@"下载失败，点击重试!" forState:0];
            [xiazai setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
            [yuedu setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            break;
        case 5:
            
//
//            
//            xiazai.enabled=YES;
//            xiazai.hidden=NO;
//            progress.hidden=NO;
//            prolab.hidden=YES;
//            jixupic.hidden=NO;
//            
//            yuedu.enabled=NO;
//            yuedu.hidden=YES;
//            [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload",device,device]] forState:UIControlStateNormal];
//            [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload",device,device]] forState:UIControlStateNormal];
//            
//            
//            
//            [yuedu setTitle:nil forState:0];
//                [xiazai setTitle:nil forState:0];
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
                xiazai.enabled=YES;
                xiazai.hidden=NO;
                progress.hidden=NO;
                prolab.hidden=YES;
                jixupic.hidden=NO;
                
                yuedu.enabled=NO;
                yuedu.hidden=YES;
                [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload",device,device]] forState:UIControlStateNormal];
                [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload12",device,device]] forState:UIControlStateNormal];
                
                
                [xiazai setTitle:nil forState:0];
                [yuedu setTitle:nil forState:0];
                
            }
            else
            {
                xiazai.enabled=YES;
                xiazai.hidden=NO;
                progress.hidden=YES;
                prolab.hidden=YES;
                jixupic.hidden=YES;
                
                yuedu.enabled=NO;
                yuedu.hidden=YES;
                [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload",device,device]] forState:UIControlStateNormal];
                [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPhone/iPhone_bookDownload12.png"]] forState:UIControlStateNormal];
                [yuedu setTitle:nil forState:0];
                [xiazai setTitle:@"继续下载" forState:0];
                [xiazai setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                
            }
            break;
            case 6:
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
            xiazai.enabled=YES;
            xiazai.hidden=NO;
            progress.hidden=NO;
            prolab.hidden=YES;
            jixupic.hidden=NO;
            
            yuedu.enabled=NO;
            yuedu.hidden=YES;
            [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload",device,device]] forState:UIControlStateNormal];
            [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload",device,device]] forState:UIControlStateNormal];
            
            
            [xiazai setTitle:nil forState:0];
            [yuedu setTitle:nil forState:0];
            
            }
            else
            {
                xiazai.enabled=YES;
                xiazai.hidden=NO;
                progress.hidden=YES;
                prolab.hidden=YES;
                jixupic.hidden=YES;
                
                yuedu.enabled=NO;
                yuedu.hidden=YES;
                [yuedu setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload",device,device]] forState:UIControlStateNormal];
                [xiazai setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/iPhone/iPhone_bookDownload12"]] forState:UIControlStateNormal];
                [yuedu setTitle:nil forState:0];
                [xiazai setTitle:@"继续下载" forState:0];
                [xiazai setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
        default:
            break;
    }
}




@end
