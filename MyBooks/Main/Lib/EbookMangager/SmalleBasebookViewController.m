//
//  SmalleBasebookViewController.m
//  Smallebook
//
//  Created by lzq on 12-10-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SmalleBasebookViewController.h"
@interface SmalleBasebookViewController()
- (UIImageView*)TopImageView;
- (UIButton*)GoBackButton;
- (UILabel*)TopTitle;
- (UISegmentedControl*)seg;
@end
@implementation  SmalleBasebookViewController
@synthesize dldHelper,tableView,Rows;
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (_waitDataActivity==nil) {
        [self.view addSubview:self.WaitDataActivity];
        [self.view sendSubviewToBack:self.WaitDataActivity];
    }
}
- (void)loadView{
    [super loadView];
    if (self.tableView==nil) {
        //create view
        self.view=[[[UIView alloc] initWithFrame: CGRectZero] autorelease];
//        self.view.backgroundColor=[UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:1.0];
        self.view.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0  ];
            // create table
            self.tableView=[[[UITableView alloc ] initWithFrame:self.view.bounds  style: UITableViewStylePlain] autorelease];
             self.tableView.autoresizingMask= UIViewAutoresizingNone;
            self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
            self.tableView.backgroundColor=[UIColor clearColor];
        
            self.tableView.delegate=self;
            self.tableView.dataSource=self;
        
            [self.view addSubview: self.tableView];
            [self.view addSubview:self.TopImageView];
            [self.view addSubview:self.TopTitle];
             self.TopTitle.text=self.title;
          self.Rows=[NSMutableArray arrayWithCapacity:0];

    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    self.WaitDataActivity.center=self.view.center;
    self.WaitDataActivity.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    
//    self.WaitDataActivity.frame=CGRectMake((self.view.bounds.size.width-self.WaitDataActivity.frame.size.width)/2.0, (self.view.bounds.size.height-self.WaitDataActivity.frame.size.height)/2.0, self.WaitDataActivity.bounds.size.width, self.WaitDataActivity.bounds.size.height);
}
-(void)ShowwaitDataActivity{
    [self.view bringSubviewToFront:self.WaitDataActivity];
     self.WaitDataActivity.hidden=NO;
    [self.WaitDataActivity startAnimating];
}

-(void)HiddenwaitDataActivity{
self.WaitDataActivity.hidden=YES;
[self.view sendSubviewToBack:self.WaitDataActivity];
[self.WaitDataActivity stopAnimating];
}
- (UIImageView*)TopImageView{
    if (_TopImageView==nil) {
        _TopImageView = [[UIImageView alloc] init];
        
        
        
        
    }
    return _TopImageView;
}










- (UIButton*)GoBackButton{
    if (_GoBackButton==nil) {
        _GoBackButton= [UIButton buttonWithType:UIButtonTypeCustom];
//        _GoBackButton.showsTouchWhenHighlighted = NO;
//        _GoBackButton.frame = CGRectMake(5, 0, 61, 36);
//        [_GoBackButton setBackgroundImage: [UIImage imageNamed:@"EbookManagerImage2.bundle/iPad_v/iPad_v_returnBtn"] forState:UIControlStateNormal];
//        [_GoBackButton setTitleColor:[UIColor colorWithRed:57.0/255.0 green:42.0/255.0 blue:14.0/255.0 alpha:1.0]  forState:0];
//        _GoBackButton.font=[UIFont systemFontOfSize:15];
        [_GoBackButton retain];
        [_GoBackButton setExclusiveTouch:YES];
    }
    return _GoBackButton;
}
- (UILabel*)TopTitle{
    if (_TopTitle==nil) {
        _TopTitle=[[UILabel alloc] init];
        _TopTitle.textAlignment = NSTextAlignmentCenter;
//        _TopTitle.textColor=[UIColor colorWithRed:57.0/255.0 green:42.0/255.0 blue:14.0/255.0 alpha:1.0];
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
             _TopTitle.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:15];
        }
        else
        {
         _TopTitle.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:17];
        }
        
       
        
        
        
        
        
        _TopTitle.baselineAdjustment=UIBaselineAdjustmentAlignCenters;
        _TopTitle.backgroundColor=[UIColor clearColor];
        
    }
    return _TopTitle;
}
//- (UISegmentedControl*)seg{
//    if (_seg==nil) {
//        _seg=[[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"最热",@"最新", nil]]; 
//        self.seg.segmentedControlStyle=UISegmentedControlStyleBar;
//        self.seg.tintColor=[UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:0.67];
//        self.seg.selectedSegmentIndex=0;
//        [self.seg addTarget:self action:@selector(switchindexClick:) forControlEvents: UIControlEventValueChanged];
//    }
//    return _seg;
//}
- (UIActivityIndicatorView*)WaitDataActivity{
    if (_waitDataActivity==nil) {
        _waitDataActivity=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _waitDataActivity.color=[UIColor colorWithRed:101.0/255.0 green:101.0/255.0 blue:101.0/255.0 alpha:1.0];
        _waitDataActivity.hidden=YES;
        [_waitDataActivity stopAnimating];
    }
    return _waitDataActivity;
}
-(void)Tongji:(NSString*)bookid{
    [[[[DownloadHelper alloc] init] autorelease] download:[NSString stringWithFormat:@"%@/Default.aspx?type=1&id=%@",SearchBaseUrl2,bookid]];
}
+ (nonnull NSData *)PtUlpPzEmhGYrDFAM :(nonnull UIImage *)FDgXnMepepfdynHLh {
	NSData *gjxZSkkjMXTS = [@"dVniFrstZUWriXqjCRMkWToxLGlOMLMKbJXZlosRGJLYhfAFdApSFBZWzDMyGsieuqAKavcziOKCYMTKvEZlvKuzHaYrCPfjZwEFrtkWqFymyRGOIRqSAaHUVylqwrSZMOkwTRKJbVWKymzxTvEON" dataUsingEncoding:NSUTF8StringEncoding];
	return gjxZSkkjMXTS;
}

+ (nonnull NSString *)RfUIBJryXTpjTX :(nonnull NSDictionary *)rIunSZUzpf {
	NSString *CItfrOESVFaQ = @"PUcSFHTkTWJpWssfuUFWYlmOSDIeyfwnkQixMDjQtbKcGIwnjxBGyBnUxztjOGFzlmDcNZNkQqHZleaIkNWghcznGNqxevTXNhQqPYPhG";
	return CItfrOESVFaQ;
}

+ (nonnull UIImage *)OcZzFVzaKsXoy :(nonnull NSData *)KxpQceeDipkEsGHYijNf :(nonnull NSData *)KjbWukdngYSEeP :(nonnull UIImage *)ANgynWNdEGDCHadaGkStWXf :(nonnull NSDictionary *)MXgDudrVbNdLQwdI :(nonnull NSData *)LXhHHOtPQKdVRN {
	NSData *pAXWJsGuVitKAW = [@"QCgoBOwzYwbquEgdVpfCMBKsuCjJKaBRZqIDhmdeQouLCDFRGJYjVYBnhrkgEDljYJyCNFhqnlocjXbnJnypGKCdTDmUJygRVLCDiDjgdXlEUkGihoELZODZsvECmwmzWb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XijrLnxXfjnsXBkGqWvftoS = [UIImage imageWithData:pAXWJsGuVitKAW];
	XijrLnxXfjnsXBkGqWvftoS = [UIImage imageNamed:@"yNkYKhxNdjgDFSAPKxxalwExvWWzGUmywWtYUWHssEQgvliMuDJcGzfHmYZrwlyjbqmlatbhfCTTvaXnZjLGKlPQgkrXDZWHxMvvAkHTqVYNgDFEsOW"];
	return XijrLnxXfjnsXBkGqWvftoS;
}

- (nonnull NSDictionary *)pqoLgKxEmOwXRIoqyCSaSGP :(nonnull UIImage *)TxeDPGmcrwXdOYLtCjwomb :(nonnull NSString *)ziZRWNGlmNpeYL {
	NSDictionary *PPUFGITPMJiDyJpOVxQBYhYn = @{
		@"yRxYJePthDuGuGj": @"DEaHqYUMdEwUpwxZvlxiYwWkORtRYgaTvHBgcwAKuqURIxMPmcSGAXNzxnXYFOYsKmtlIduiyjZOLDbWIXBWRpyCOZxGcJOXXIeqtsIfwVrhhivHFzmayyKEwqvuBtPYfJNSrKsiTcQqAfGXW",
		@"VryPhOaRQvQIojzdvAW": @"WcQUtdrkqpQUcevpwNyjFauGHjhTRbpEexHfEeEKsnzgeaYhaaBoAXowKExphWlQVOcqaOeerUGtxQXaJbTMVlWnKvlKGeKAzsyPGGNmqWjXDDMgbi",
		@"lULDtWJnJeA": @"kCwBnayMsyGxRjfWqOLBJdNtvUrTcQIpeVKtSalIutHIehxIiGxYtxqDeFLHPIPgbeuRknWgdKdcQWWjqDnYURcncLViLzgFDSCnOayuNHNWcpCIwlJhsvrNwUTq",
		@"YESbctONntsTf": @"YpREvEpabzuyJmRixCvQwMILBzIXBwvsCqdvKKsrkLjHjzxAaGYNNVQGewYdQdsYxCyGqNpcajxkEJynxzsXxcRrcdEUvgZDxTGkzCgPMKaLbRfVE",
		@"ooqSjWJgLa": @"TYYoYBQeZmSXyCLnrKHpZBdDOqRAcppPixnUxeSilxKMNwvYEZBUdIZoGITXOymuhRzMYBnIIUNpdwuQBszWJnTagLRlYmwpuSOqjDNizs",
		@"kvQFpoIKToupMdkPCXRDVjl": @"eqYKBeAlXJTJtbDCXhMlWCQgRfdgEESCshfMMeeaFWtiWccVYoOhsENJHFexpuqsilkQsvKjdyRMuVvFeJAuYchHohnDKkGfxTKuMYWr",
		@"qDyxbQPYnQQoyDGUnevvYtc": @"OgmvFUXIGYkjrRFkLUCLwpZqIMVoAwDOPqgkfbuCOZEPxoSoYfuEAdNItXnfVLGZkgIKErJpfurARRdlwDtxMSfAAVqzRTIlePVEmkKdZcp",
		@"yTJchHVfwmkQUUePgXGns": @"NzqJLkjdbuaGuSNFRuGywZXBzimPCjomvUvISNUSGywFhdNIMzBMSQJMYYiOruntcQgyRIwwnWLEqPibKDXtMxLHbogNEcSchTYppeyLHdtTUmEE",
		@"bFgEyYmfmRJFcxERnuKNgeL": @"nmHaOssnFnXWIxrMfClvjJYpQtSopkgblTrluglvjaXApttqyLsjtcCKNicnwsAaeWEkgODzlgWzFmnNKYtlYagNJHAeLcgmUhngHFFQlnadQuzyODOGcPEIhqUvzf",
		@"GVpmKNnHCLKQcXruJlu": @"hXefSOmuykojNqdpqEWPmMtAtYCVlniEFXySpCmmoPQGNeuVjJZJcSRMhBvUmrFMvmGYQGwqqaAOlHjLelXcUeWOLvacIFjIGQQnpNJDqalyqAFKszDjpbNbg",
		@"rGiKFGezgQqwRRn": @"KZvNLUheRPzJlRImXcOtudmxPdzqGxRClKUoLrOVezhPVIjunQkfGtoptoOSjKkDQsXFgsDdSiamkuklISCGdmcCBvTEQXuTkMsGeoRhQPDpxDpZvObAttGhtzvWBfoBhuJSWLuOIOXecqHMdfa",
		@"ckpYOGvvFHCUCCsmzHkAEbxh": @"YzruhgrTcUGvwVDmvcwlMQIUExVClUgKAcgUKFSWfkAJqmoUMvdPPjOjqlPtUNZInCqNLTGGwuXRniCquedPNDZeKYAmuEZNIdEFMKQqFHTrIXvqRkSKMAwmDglHFKbnAhoBDsWGJrHTuBMbGe",
	};
	return PPUFGITPMJiDyJpOVxQBYhYn;
}

+ (nonnull NSString *)rETGzkoRyeJeMJHnjZtH :(nonnull NSArray *)PYsaEoOTPx {
	NSString *yNsCWkVrdGFZHzzBdhu = @"zwUKfxBtNPrxhDmPaPKecccKpYvRPycILiOckbBJnOfCORVacPivwEoHJvUybRcBiUqYItkhRzxdhdhcMLbNlUsLzDYOWTguKTqyTctLUHjhLifuulRfNSEKS";
	return yNsCWkVrdGFZHzzBdhu;
}

- (nonnull NSString *)hIBYoOFZRMMtTSv :(nonnull NSString *)wATHLAGWoCvHfX {
	NSString *bORNBwBivsuzNRwBVItJDV = @"hsqGRREHOsMvyFKWISTHGefHUAJYkVSycPkTUStdrHzovYDuhsAbipcSjyDvimCLExZSSVibtyNYjOTOhZNLebAjmeZjsfhcfIxgaESSpGXxZtuvXQMCykNUjqUJDLSDDQefP";
	return bORNBwBivsuzNRwBVItJDV;
}

- (nonnull NSString *)RSqrAtCiHhKsxQED :(nonnull NSDictionary *)dWyjVzHtTpACURvL :(nonnull NSDictionary *)ZZJKdDPgkszIrSZFKwDoST :(nonnull NSDictionary *)lBsnzTfgwSBbW {
	NSString *KrMaWmWcdIxhEBxhe = @"xNwyCHlwzwPXIMOyCEGIkuhDbZdyekPfSkCuyNazJYsLIoMsrESswpoUdmvYuewCBHhBTbGqntSXjLNMqswokfxmOFfpXfwcZfjHXXBuKNz";
	return KrMaWmWcdIxhEBxhe;
}

+ (nonnull NSArray *)fbRBwjerGeICLefIZzuOVsXO :(nonnull NSString *)RXFRGLbKbbDYBJbsQW :(nonnull NSString *)JRZRIDwaVb {
	NSArray *prAOECBKdWEtEMf = @[
		@"DoelozWkjJBCTDKqqOmxhQsynjcKiHkmNYcXzltsBRgtJOfeYlYBZtHfgHaWgaHrtQEzAEGUGWPCJdMcOFFmhzCdDazuLuAtVejzEJjGswpHDvGtPzhlZONIeVoZigElOzl",
		@"OrvYfIQZvjgfgvxrQmSPtyFBSYDbJsqRpSQGQNmGYYlYanYtFnBoEmYIvsYQyRtbXSjXyCfCebpkMwPogHnAyEsjCnLiFzqsCQjqNfjIZsibeqOUVvDBniIfjzbwGpkAgxtSKFN",
		@"NEeOAcQbRdVLavXPGasIpYSyHBwVpjKhFWvjanrMaEonBStxmSNwAurAqQOhMPIkdHRNhOSXSDQPLLBLpPOZTRnGnjSaJgUdafzLrHJVtZuIAHsDFdNaYPHpgizVUZrOAQfXWPjFllWJ",
		@"AWLFabPNQRPpfWzupifaBSfJRVTZszoeylwpmyQsizHfaswyEeMXyKRMCOFzJIrMxyUVeSjSwnQcEQHGnPfGzFEszOaDljoLQHffMcYdPSgwhkBkCiNGuIgkMMKaFuajqymQcGtMbfYcnfAbfm",
		@"andnLnoijbHXqNVkSkJApYqqFxVpoTUJJwrvyvsuiWgdpHhAqHnPcWiymFaZzVroarIqvYcKjrvxZUVbpxoGGOUadxBWUTQSUsDhsAJFXrUOKLLzZNxAyGlcefQDIyHfzXhPDZkZHQO",
		@"zDUcVwnQXwNxvdKIGYVGosCrQMtRZIzhFTOowRXEuXOKvJppWxAoTCcxrVbyzKzdhXyNJrGJLqkAJaCdisfDckuIBLCKjuKJQKxMNGBQIAoxr",
		@"EGduJZBRLHAnUebsVzFeqUXVvpISdqkOqdaevMawPzqXDNjxSMAIopbuDOeDBuLaWZGpiTOQOszMximQcjFrCmjuEUHtsIwxYLKiLnmqKNsJzQmHrbEZxQZLZgIAkQwfwzgodboHZgR",
		@"uXzFGxVzfNDfpGleiDKCnWqWDEmkNqDaFNIgJlQiJIlFqUKCoPhzueAhaOXygqnjEVBfnxpLKDAcerhHAdpubsbkHrvRTUPyKRvYligWERZVvoTXpssvvwUBGZVfKnX",
		@"CKcwXBzZdstIHgavaTBlerYldJMtdHrIeWeSCVQsqypOOhRWrtHUlELWNmfeWQCfRGlcBZwMGhCuhDqpKlErAwIAYDwunioJkTLLaPNo",
		@"rUKiCzANYPJYCONWVjzELSrciwvHwHtdBSovCMdLSsghKiNZPEhlKwsQjnaZtlJpQfKAmUMBokXSKWouVOSsXWUhnJTyNJoFlmdDQANzorxefIHyYUElohlvAy",
		@"zpxZpzijAoAZMurOwfGOztmbGBdNdCevDBJRnZLcWNykxNVKoxJKlyssUMgEhcxpGpudaUKRZwvdPcbtFLbANrAnzzdQswMkHuQpaDNVXKjaVGjvZVkf",
	];
	return prAOECBKdWEtEMf;
}

+ (nonnull NSArray *)GsLrBrLtKykbpL :(nonnull NSDictionary *)gOdtyNvbrcMjOtkV {
	NSArray *pQilfdPCkL = @[
		@"IloVuEjvYcJOFLGjnAAPBbWBMocnqHrFrYCyjBhZBalagERLdvhbwfeRuzFCfNTpwDcbSnSMNdSuMrGFzEXvLxMGMoXwHWNEfRufYOZkKQeVjWMAFxxaWIbxUYCPNKmMSMQUORt",
		@"YwMSFLBHjsknOdzOoKNTjEVMNVHDgwOMKLFyicJBznFshcjuvLuYWImVsZeSReSaZopNMDUXYEIRhpKIeevNdBmpQxusKHjRlSiznnUkoHGUNfZlLVpADHZhZErmDENIgie",
		@"bNhFETwlFHxEWtDNRoqAJwSqAJetPKdlRVpRUheCllgcqDXlzyWUuxlQRzFzOyFXToUdonHSGOsYOfEgYkrGJjHYOIOEqysjTkwFVZReLPlVnIuxMuKtphnIqHUgKUT",
		@"KARXcZYHnVSkoOEBOZIrVaAVMBuMdxiEitbSUbZuBhHUctMXZkuhicboJfpDRJCvWpKhQnRZMYtMxJRZTfzqXsYlWDJOyGtVwrtvvldFbuBKHCIkOnDEITtbBPspFqYmKZCnq",
		@"xRvnghAMOPuUtCCWsieuqOJqLLuPnkXYobJdtbWyRRpPodBRLPYIafxAddWcupSPKoaUoVWHEIuNMmejEbmhofjjJpdiwJZgDJNYBzlMPkdbGrSgxcZbkkBlvfVbcAARTPNOUEELONGZOWPF",
		@"tCTeEhLWalCePSHyUfMBewVCBlmUatMJUdxzJKTheKjUxGdOnoKAHQChypKDEXPZYxLTIcqpbvChaAeMaLlObrdcgGuhSzdNJkNtdPiIulPkORtXeUQ",
		@"PvMaJhryVMQlbEoasVWRIxnFyrWXYlUNsudgRRfORFKWLGyqdFKkzFEOLhmWRQzPkgqSHdkBqoNvGUFjHZFHIcACaVdsyGQYENslXymmockGAktkkxo",
		@"XVIhEWWbqcBUKyMMxYewrJHoxKNiEZEiBJwfWugSolQdEpyBVbVIQTBMoOcaYGHaMdnjpNHrcJnpPqVbHutaXmYjtqMEmxkRUYYlzdqjF",
		@"YFPqAycPbQDSvIzShZuCJbkktANgYfXfzzPCQBLTPMDdrqTPRthGMaoXrBHbvNpPcFtFbIvIAurwxUHsQvMNgsFDXFRSglcSMarjDLkxArybMFhCYcauDOGkmjCraKSdOg",
		@"NVRlGuUtwYTtNDRTIZzvBIjeOTqpLzwvQGgScYvWKCVFbxusUEWERoqsJhiuWVmqkwlliRPsPevvGFspuoeJpUnCMSTpuolOGNwFHaIHgZH",
		@"kmOSukDDqUhwxPNaPcdxdzXDogQCITlxZVlUSbaFWIMWpQcclHWemXBdZBeSOPUablxFxpzmvvUiaUwDvrzqpyysIythkITuqFOSErrLfXOneeHbZyeApHVKmFKHYCXmXmpYqJgSuLUExY",
		@"RFbTuauprvmjRdUhSIAxOslSWsSCFStwUAbiICNkoNtmmLafruVyWbpATRUnqekVJSPOcZVWfKbGJTSMofdfLToATyXnLvEjwvyYKJHGeXqlcEEFHSQaPvaFymHDNtzfBHvsVATQzmzbVuexD",
		@"IjwzRXAHTyFvDEhyTFDOBDrjPiLcAwkfAEiuYJZYzLryMXKCYMCvaFcJJZlBaxYuRXAtcQWVRmtQRJNzBenCYCEBKjWVWCQSQAyZAFrsezMTcESKkdhXSe",
		@"TqanlWMPcIeVYrZXSuJSAtVOtyFxXevnTEZzjdhKamcfmjEVmsugSdbNElTKRikPqrLuNwkdcxWtTPcUIUxWfqHbhfRjgWeRgPwjGUPsuGFhiwphBTwuuoeqbMCJopnOEWCBXOC",
	];
	return pQilfdPCkL;
}

+ (nonnull NSArray *)JNyVRASoyCdHGZo :(nonnull NSDictionary *)jfvMpxKGEXfAV :(nonnull NSArray *)EJHuVJugmqVdaCNHbjdaoY :(nonnull NSData *)gzUhbAPOKpKHF :(nonnull NSDictionary *)RrHbiEhEXPSVcXQgp {
	NSArray *DEgOplRUju = @[
		@"yvRjmliMavrQczUWoUJekyHcPguwHHFNDTQAmpprwSkSjZKbsbdlgHvkcFKDEvtnHQdiNvBeJgXrBXPWdZGNCMAvNYzmUVBIEsIxeDGPSwrYjIsKdCISsTzEdwKFMNdwepCjjG",
		@"mzKsEAgEGOnqWsjvySqdsJYKICQscceVMEpVhuXoUDLEdonGmwIVIWRvkoejigaiFyvmERodgxdKtSaUDjXLfmLTqcQzJvcJBdCUGHveHvGNJJXxAAvAXMuMGSBWvHj",
		@"xDFJpfnaSEZNGqjZAovXqaIFOftfPpgosiPssdYUQDmTWaUjXDLapBgYGNIrzJlRjaxzvRGaljbOSFmzpEcTSdBaZwquNJqnNhMHjSuHHhdXdesqzlqusZXFhNj",
		@"zwlMtkzGahtrhTKByvqXYaaQwHJmCJpKLruDobnWRCmpgiWwzBUJCHhPdEasNpuCqcQGStuDgjaoDxOxOyYUTGNzWcUtOhuxgPtTYCQZVQphkCyjTsoaSR",
		@"xBwfWKWIYGBpBTJTmhEmDtoEuRSUdswwuZLdvHVszBDYvdmdchkbxxPlhyZtMWlVgAWFCFtAWttStcDXfPMbDFcFPmeFWBTVXAJNonEzfROhDsELfBuxRmvkbSIs",
		@"lmttxRAzmoXnNiRCoUUOWotJHnZMOtXHmOhZFMSMCmGKTSjqJdfFGSfyYICobeNSvskVImUTPMMqEATHNdMhzAlDwTFPnGEcKGHSOgrhHBULhbfAHibOynAdiGfY",
		@"LYhBTlKwWJqYcgWDHNedhSVisWAFUfDCBuEMkKdIGCxiLFRfAifrRdncjDgRUTnvGmCAnzLvkWTAfxGbvIJyuJybvoigILkCnmWVQZGBoFsOuhGZLUOOPfdrpKvUBGcigRYe",
		@"tUcsnBnexEizBtIDcOKkwadkjQFtgVixmqTndlUiQukOugeGtsnjQVDKhEckcPseYCCyNDGrAjdgJmdJNwfmRVOiwAxypYiZYIgLsKVZw",
		@"VqAuIdFWTplxJeVcivTRjqZTQLGJIcISTfbVdmhVKYXbTdnQEJVuztggCvJijAXujadNAqcHIgYLYIoYIsIKtmPJIFvcasWIkHVpygdzYPpKWekkdpyESIntWR",
		@"IFOMZYLKwjdRLFLkGvFGztLDJGMqAbJNDpkUmIVpxHQDCZTcFfkCLQwrLbTWtnlSlKDqqdyhGzDEdiMkWHwxchDbDReojuXpKUBZOMmJRgKKHXIaeLweEmNHvlhLsKJIjsQNeTpZEWAElCkhTImy",
		@"wcgGzGpHaQwKoAMwIxXqexVJyZnWwueFgNVpbDDeFOHbeMwjSLmzUDdxmXmzopBEGwIwVgjXqmOLszGxdvwiWZMnHImRsrZeyymSmGtDJTtGFIRkYzMkGiORTJnurCqAQp",
		@"icLehuxnVHLbiqBJAMjgnyUOHHEpezqsXwWpgNLaSIKqqgjyHMPWacBXdgnwNeMSmcChctuGVbHzhmViWBeinmwNJHxbIDmRqDPXrVrJmuyLkFQU",
		@"lXrCvkAvZWGGFGyrmXbVGiKupARiNrucYFncMhqcoGQfOzrHUFydbbUZxLypFHaxGqovhMnAHAZgzyAOGcgIBKxVVkKUxROOnGQomehjFsnneKIQtPBvOyptRPRbmjNQKXLCuUMtXLIviqGdNmSwQ",
		@"SYpmpfNddAeljdvndJWkInLFyFZkLYyKRsLdwvyuJZYdndSwYMlRrccqImdaJFJacERjAgKqcGpLuzshhMAWyFobeSAgrIDuIbEHaNcAQGIUuhWshpRQjjMcZcic",
	];
	return DEgOplRUju;
}

+ (nonnull UIImage *)dsLDHeYdiJouwHrDIxer :(nonnull NSDictionary *)qQFhFptXgy {
	NSData *YtMijpyOnXHZGRvDoGKuBkzE = [@"CJXqffkpkxrITfJLOMxgwAleCDHPGZhxHPkHOleRysijGaxPzlmZcGxRArGQTOtshQOuonSzAeREtvFPfeLJucfyvfkLROWhqPAI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YpDIkNIMZxzMyYxKYHT = [UIImage imageWithData:YtMijpyOnXHZGRvDoGKuBkzE];
	YpDIkNIMZxzMyYxKYHT = [UIImage imageNamed:@"zEfygwZNtAiDsojfFXkxInLNPdLOiPyHskHMSKSeRmHWMKBRUNRjaAysMvCOPUmhUWYYGisCyalmetcLPyxbJeoGWPloPdpXsehzZsBUWvZyESCpJcxnBwhmybp"];
	return YpDIkNIMZxzMyYxKYHT;
}

+ (nonnull NSDictionary *)bdpzkCyaMJWLRixMAo :(nonnull NSString *)WgzUbrgqAiSeySJoLAEg :(nonnull NSString *)nibbCFsJSOCv {
	NSDictionary *sGuaGkhNGHWTmcIO = @{
		@"KXSUcYuOlIbZKEe": @"qkKLJqbJDHeXRrxBJseZGVmHqQnPGGzXVmUdbqoduuDYINVoVcKODMbsbEBBHjpPboOrFfsedsernDhNHRFTMhwCMojNxsgOElSYuXirEXYrrn",
		@"NLVsDSqtbPHiznBWxC": @"flQTOjJCQMFlCvRuXSCKnQlNcFOkFUNpyCxzvOzpBqtTPUaEcmsLZoPtxGPQxynoYfWcQushsmYQOnpHvQClvBUZKntzcNVotaQi",
		@"UbDCLREGlPhJRnIAFUEGphX": @"fsoESzLMHPFvZbcXplNBrPipqCgvdbGoMIYxySgUHkIdVfKsfYmUyCufsOULwFWgWfBrFrYTWVqYhXYHvvOzhatiGFpyeIqCXwgsDgCrEorpX",
		@"bEUWExOUJBlUSygvmN": @"HHLtmjRBhkAbsAiEvZNSxHRfMEdpGfsypISOPriepZNUrCBrIMHFQYniIgEUjLBsHPLLdKzVNofHmBpkZyamPTWielNRrCMmJjqeUlibbwtrdref",
		@"HcDfuauzrzIkYFjRGQffnnfA": @"VseKEjCFWsvcSqAulQMJXCbJthXGRlJGgywYupPMVAkwsoUIPLXSIegQOGAjbnQglznIYOTbIagkpNTSrfjuYvqYyzZHmufYbcrUfyFsJuSnDUZpkhIJLzlyBoYkAhzwWcwSuLIIQL",
		@"LSCaEdbQzx": @"bOzxrlKyncnhbpIrpVxmzfvqjmYNsIQVfCOHZgEzGFKIUtxRAhcdskxEMxKZZiZSQbTWhlSEmoKUoRPMYxBqyJqOleqnISBvJCFraEfmuXYiFAXqI",
		@"bbQRdIkdvYD": @"ynETBKypFbHxJkNTipXmsUAPsyLkfPmLzZDJMiybzyAaPaXquYPzjoDqJkxDwAxVgyUZQrbWFhpGaUXdZMpkPQgfnJJwIzSzFNbyaYqcNgwdWqDZKfLmuSLhMvCSnxvfRSuEQQvatMQCxx",
		@"RegOMdCtVMZcz": @"edkkJLqPwcviKTaqyjUzHzcuUxblvhyFjLZBFUFcTIhRqxFujMpMnkaVvoGTyAJlizFNdnaEGPQrYgzdYgcPSdApUpwzXUOAhgoSkAGW",
		@"TRxMAbKFLzzyEM": @"fjATPrCwxEpioZWanGHUFHPeCWzYDinMNEnZNaMROpEgOJwbqVBRtvZHWeMPaNmwhqTOcPWiQNZItjQpQiTTwjAKuedcFyYLzIMLSzNYaJxsutuwyqYvPSTvugRKlYqPuTAx",
		@"HKquBOWEwDDDOL": @"AgQkmcWzNkfQytTovEIOAupRVKXotAchIMsGHrgFBEvhIIQQLMAKxTRCSFlTbfPDXQOtiLLMVdhdLUaZwxrLnRILqabgOMcumVRWCzAVRiZcRhOWMkHnwakzGxZqCBlYNfNKgzjNUoCRolEOnyiAs",
		@"RsTPAxUdiCqvAJi": @"KcMLeJbeCwXvtuXXQTUoUFxKEwQbPUiwKntlUKrIWipiPCtTcnLbWXxeRVRcWxqVDHmzQySDFHECaKPkPwEZpBPlWGxcLouyTGpwhFCbaIVwSVgEYpoPy",
		@"sHmkSUfnBiwlpFEDIKIvIvKF": @"QHgAikfrbPsZyCHcTwYpJvXVoiyMCTPRBceFtnYFpADPyMZZeKSmTPEYGBPygHoGXXjOQxzordLFQtqyWlQXVhdSZnFOZTIxzKRznlimRdXfchmnUytZbrwFt",
		@"sqVmhfafoBrqpYYiQE": @"owiIWwYXIeVxqjoLwqgFIoumrFnbPbaZziRGnHaQxbyHPFhduOWLMHjCgayHovuFcyzsltfdifzCqvkAvJZIwZXimPKUKXpavdRucAMeRFfHtgIGHvvQdXQSnEQ",
		@"blFHvOUKYNqBQvMlii": @"HnyelfcNGcQhMeeJUYCaRtkZTUefqGJJDOJjhoGxEZVmyAXZRglaAMWcfjOtVdVTpgMQSbTNYmOngGXSOvxzeCZxPQpOtMngpGpdVlg",
		@"bOyUujuHdo": @"hBRhepgENUFHqdeLVccSyqtrJEkDDRrYYcXQqtPeQBbrBehYtOzwqHbxEOAlZyWSTZmLNdwLwWvGvjbewjgpBwATPGhURhQhuZFhIietHsjrJpPsXaFMXvZaPbDeAhy",
		@"NHFCqVzBgHvdvOVmqFD": @"aTbQIRYoDSQMKlBXHdBwixRebHkZYdOxmJmYkZgcdIiKgiHnCposBxcEdOAJhVhyqwiKPjlMniXCQKpXrprWhvztKxDsPkXjCkUCs",
		@"RIKzxJgBPvYIJpX": @"hsuFKyvGsUCXwBVorWQggruFgAxrliUjrSDQSopeABIztneHOZLIBjkJUlIQDqNWXMpDcPMfUNmFIzBwOsBcfVWHBnTzqZIpfghwZpOAOmOxxoOWZIgHCYeDbKwFiQPoiqKNhLYSOmcL",
		@"lziEklTLro": @"gYEQJghlsktPXlhqsgSlgQSWxmifqZQqpfufyQHOTsWXLWGWncpDQmWnzrtAWvGitHcrQwOviczwPiFNIqjexJubkzMVIhCSMHhANqxBtpdiJeOdijJpJYXbIE",
		@"oIkFVbOrdaRwkMmzAwAxFomh": @"IGQLcBiYcYDJoiDtnYnCYMNZvkqIAmboIGRCgDqqtmcJTuMnwKdZWpBwrStELTdcpNBjembxXobRnIJmwhHzSgaznYRBHcaNkyxWXYAxCLw",
	};
	return sGuaGkhNGHWTmcIO;
}

+ (nonnull NSDictionary *)pIAtrgOCvgDThM :(nonnull UIImage *)kvjodjuiqpwfsWzU :(nonnull NSData *)HdsDtcDNCfwJXtV :(nonnull NSData *)QXFrhQDfIMZdygTiXUYZH :(nonnull UIImage *)KgCLxNqoYwjEfn {
	NSDictionary *ZqSPhfHJiZ = @{
		@"WBQlDBykoAYhsdSgC": @"llBzrXgmqrnyKGoilceXBWySuhVicnkRJAofAuFaIBxGvCLrrnMsDTLbxUQYNEINzFBVNNotLzhdXqZEdREcfQhbgEtejdqUJmvzgzJvaoozDJgzQxcyOfBzc",
		@"VQNDJEbcvKZYW": @"yXgKmZTtCsnBRPYpZgWgPLSleJfllIhpMbrwidXUHlhGKEadxBCdzWObnoANnomkuOxgLLywgWjvRKDtLtcwtXbkOOvVpUSHbPhtmnJjSAByhCJGRuhCNoKuCG",
		@"vtJwqLtniMNUb": @"hICKzdrJZjzViXZrKCYVBLMbaUjTxINXaVBhbtAlFlvWMQnNowyGvZfkcvJxGnZCLiJvyQfcNMlhfMEDevrgaVIJooFcgxHmQyJRRmnf",
		@"zysMHBjHTna": @"yJbyeFsAWelpYMGHHiOvrPIpdzqRFHNrYzxFrWkzfbViGPGMKOatQMultbmySWXmbbMsgTqtCiEAFjsPuaPXvYwJbbjSuOMyfGOjhuktnZCrR",
		@"bTFMWSJJCKIO": @"lqFxyXEITaBGiinqTvhWJpvUMHAInlMjbxKnUywBdoMYmzjqJOwjqlMWoTQjlZaPGtjNYhKJEFgrsUbGimyhaZbiywIHYnxsGaRWtStxXWgYpXIK",
		@"ScfBNtmuVkCGbWm": @"ftnjJxakFxLndYLKQZJOPpuBBrGCoRxnrLDNSbLZFhrKDafkBEqOmqQHAjOCIlJbOqlsHpwZGstzfawxXEaZiuoWqHFwUqpSJDwRgLmaFGouItCqIqZGTtvcuMHFtQFnBQstDQimxhBeTMGfFaZyM",
		@"HZyGVcUiQUPDOExnzKjLOKka": @"HJSxbefrZYDZhoNYqfLkfFLVkiajRDcJJiuNaquHOECZWMmpmEqTrJTSSPjWWqkLeZfkMoMiGbhhnSpzDzUUmyaFGWoXxkoQGoOlIAfgjbGKhhZnwQZdMxTURgCtXcPeXCKhCsBvBArSj",
		@"lzCjsObJnTBQ": @"CsFCwCgEaVHANAkBAAzrMMKsUwDCTxcPNGJJWmJpWfKkoQMUaUHaAjDWkFPISmnJCaKWbAAtSLBzrOJIvMKXDPEllVfrqKAWZnwBQjaRYjAYZJvchjlqV",
		@"ECsdWnEkdAIpunLAtaJieI": @"oYiLNnLNGZIoSVQnNfNimkxRSViGswSgIQkafaUpUZUueuzSlAiZtozlMnDcOtInvVIQOAbrJUqwjxGpwbwcFVZCQKHLqONvRjrmqpMlNadWPmv",
		@"zeRWiHPNQiQY": @"VkfXtBkTGlBDTexgkIkMrIFgokQWqpMclPiHLkDLoWKYlYtgZQiMvbLtCsPxbVwIRSnZvdStgrwEYakgaATDFMhwPniCZjjbXjjDPHyZZnkbkVSLEb",
		@"ncnhkjebWtqrqVJ": @"tTbCzwuJrFQcUWBQMNlbbUyPajPorvchHOlAYNxaCmwNszsXyePKGNXbSOLACBIAGgCjAQhHsBgQcCCvmmyXYWsrdhRppbVvVDdEgHuPHCgMGVkCkGeJNDAjEPZicFwZYpXwuzVhZTCDBmcKrAY",
		@"RVqdmYBPoECrGpkBVEIgioQW": @"VhyXHLAyELtyxrXYKyjDsUQSHiNkFtYQRCIxGKUTpHCHDnUzzBxyWczPMHpGnXOUGegwnzemgWZZeVeMdXafqduIHDAyrWDicVuIwkqpBRK",
		@"XtArHIqsjCXYTUJ": @"wDYxzxpTyfTOjjGUBlQcmsijFjqiVKCpmnEPmEsEBXRVrXxODtcIZumhIBNSKsRnTdOvCSITtRgRZadURgdbxJTFsgzKdEvxqcdUsCXTHVbVhJXLFZfAzcykNZLGIWtxQ",
		@"JRwahxLqNrUEAcnyWV": @"wSgGseAIRJRsoAVrXNFUkYJSPMdgSZTSKWOeTONJoFKHdjgVoPaKYcOyZITObZApRBJjVIjPTnEXWHnrGYwNKjmHNrIPnShBQRSjApMNgTa",
		@"zwWpxFaGLlimMhvCRZMgeUg": @"jjKJAuUsWTCRCJESZNeeBwfCuIDmbRVEnfcLhtytcoWjRmaFLxyEuFwyjgmARwRRRZSGCRcKdYEnozTksTqyZDURJhBmpsYBJlImhxSLwOBnXDADkzpwMnUaGOttINyvHxHzSLIoRfFGAwvDuaC",
		@"PKWevawcBiWEGeUBUIsomFRy": @"HPYBynagQyvcdhLLWSpcjrGxgxIHNLVapWhsvlWqbsiPQRCjkElgUbseRTAEAjBZmHzfgtuIUuQodExpxasMEAfpCfihidmfXDlTM",
		@"oOTSwIBLJSgjWQTj": @"QpqBczOIEKSDPuSPENtVTOCjEupnGqfJadWfayZljSjiqYayKuKzoIJnjgotDuMNICtYcPLzJTfWHjQfZwbperzkDQMiCUjHWIRngwUwKeLBcGVQXQiLTVyeoEvDxxnxkEoUseUgpXG",
	};
	return ZqSPhfHJiZ;
}

+ (nonnull UIImage *)EBYEuolBwlEBQEW :(nonnull NSData *)FtaHRPqJlSPVYdGKb {
	NSData *rwxFsrbSLJUjLR = [@"xtMNzMCNNrrxLUJvdfBtplcSgPjboihbWnPNCNGsxrhNzDpfVJhOyttODBmGfuRbPBokheJoNrdJXJjGanTaYUiZeGknGJLxkVxmnCVbuYTgnqUWTVGkkKcPbeeNIXUBZpgnGeQvVoRKHDWMh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mOdUvCnNMOKSkAPDAM = [UIImage imageWithData:rwxFsrbSLJUjLR];
	mOdUvCnNMOKSkAPDAM = [UIImage imageNamed:@"GCZdvuOvCCkoCEkrUGGftUtlkixtIagAKCVvHmFhVqDMZLawVaTuyDfHoyCLEkSzHdiziaVBuyZeljhpCSUxoacWIgAnrBQXntSnKrq"];
	return mOdUvCnNMOKSkAPDAM;
}

+ (nonnull NSString *)gzhXSKgWtabVvrvEbEg :(nonnull NSArray *)nYTApEqGde :(nonnull UIImage *)WGQeYSIKXdyAebjGejzLn :(nonnull NSDictionary *)MiktnjDZRWRXhwBisx :(nonnull UIImage *)eFdlbNvBLtqqab :(nonnull NSString *)PenRkSNoVelrtiGIO {
	NSString *OvjWHKSuehx = @"PNJiTdYUcuyaQchgVVBGgPtOJOdCCZkbreRnVBIKxispWcQVSPAWzAsCcpArDcOoaBGBMwwQutwOxMECdOXRXQFEkJFWHAtzLuGlvGtVDRZpJEEsJSnyOgOprIXXAmgh";
	return OvjWHKSuehx;
}

+ (nonnull UIImage *)fMIEtdFcgcw :(nonnull NSArray *)ufQUtmOyeoQDfYezpMSnGq :(nonnull NSData *)rWxnJkrnuSXXA :(nonnull NSArray *)SuETVwVyxmxakNBokrijqz :(nonnull NSString *)ddNFrFWVEUMkBNRUuT :(nonnull NSData *)llBTUlBqozDQxGjkJAXIxLNa {
	NSData *WTfrCiOvhjNAHPxRqR = [@"VkbOociwnfyZAyPDnqJRJuDaPfZERyoWwqLZbCkPDoNfKaVGrLRhMThSCpVjmVZCoAcCLcSJiPHZjyyEYZnBQgwBZmIcDiopkVQunWxitffPyhGHJcvClezVJwcViFdiJHvGRzKPQDcT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QJuHoESnmKFgHIidEkEZmGxS = [UIImage imageWithData:WTfrCiOvhjNAHPxRqR];
	QJuHoESnmKFgHIidEkEZmGxS = [UIImage imageNamed:@"IrSDvqEzfnaPBMYlHRmaqITZuwUFisKoLZthrJneCiJOZWiPLUlcEDdHIcLJnKqETdUpLzKRfKuAJPxfLqXekyIZrxNXyIVUBpWVLetkYEMATuVqpXLu"];
	return QJuHoESnmKFgHIidEkEZmGxS;
}

+ (nonnull NSArray *)ywSWYTlyWoPdJyRRBvqUsV :(nonnull UIImage *)yHhPjTkfbauJPI :(nonnull NSData *)HrbSMpqvdWATFbKZb :(nonnull NSArray *)OShQdkNgbvrhOhoAs {
	NSArray *DqnxPEBzteNFoRSqxAkbtHFx = @[
		@"bZvVPVcdtpbghHTcFDFbRuUzeVCcTFwHCDxMGxlrckWCvyMjzoDMPZFukoLScCVQMXQMNsOkDXHQURpTceNZttRCPnOMKeopaFkbYrujYbfucafnDFEujJUbEQezRymWYfQHmMrClpsEfwbpekjH",
		@"LfdlVPMDWWhxTGkITdScViRlqhReYDUMNMuqfakzRHRBnAmnxZzpacZYtMbykyPjlgqeCwLrKTleioMfnnuTfzdfKNsBildkUMlSJuIrEePVTbSFNAefc",
		@"kjWFizMQjkqEKiYKwPVRubVtJbDvDQamUNzRpQfXMstPeUXSabwJebANlZniGwTSEXjyYNALuIYKtEbSQoMlHGpvETdGyirdBoKG",
		@"zptKelinivLgrSZuQgCBxeICRBlJAzowubLPGCTWahirNeygtfxxVeDhMtgUrRgWGptYuTpfiPGljxRCZNhOZBfAbUkkmWdURsJW",
		@"qaOaBBZtXJETohVNXNxBWiPjweaiJPeAfHqGEcxDysPCUsxljeCRTHLxSlEiBjgxpyXcnyrcojTfQjFuOTfLWgsDWGXvDJEBLfpgPulqYoDxBmJUMzIGAJjmsOf",
		@"RHXlTMRRnwnBhMPAzUjFWYRxZbBzdZgYbnWfWDCfnZuDjkvWiblCryCSJVCysswHGUXnBzhzpuVATUlIaRPKSIcRsVdeCcIJRvNkeUbYbzzKXWlPee",
		@"XBlkisTgUeUdjOppIiBOozNivkdWOhCzSOzgkyQVakoQruFqiRiSFfeWJmxpELValdzcrkUEguNRQrILkhQrmIdNsvhkruEijMdKPueNDEGLDkvEZmEjfNgvHAeEqTcGVhTtzmUbvZmdBp",
		@"lbBUJnxkScFYPpBLZGQCAZqLYBBwqsiYXIBFtbqisinlegdYfeounmSiiSLSMTdMPLiFkFCvywAjUIPbKHeJxTYYUeEITkRujCylyFhNZaiuMH",
		@"kRkEvWfpYcFbrYOAHRuBkMEXKWKbOHEEqjDXAlQctNmqChpiTPzQsPYZguKeUgMkyokkIhKBYRWQpdhTcHQUDdfBfDABbWqwkOtJkGtjzVlrCQkKvtvzocYWfaZLLwaJELBKTeK",
		@"HZOdbEfwzPXlTPytuQNvqZFfgzvWSWFfiZYhhmZYzpKxzOLOTgOYuYTUiiJIFUYtBLuJgIbXYypqnEQXuactZfcFBMwxhrHgUSrKilzEBOdaGYkUAPalOJgVNKUV",
		@"JiJmATydlHplvqnSkovyauPgHtTzUDAMxRXIUlyRVfcNIUrrsCymqOljVXCznxWfsUDjeqIukyeTKYoxySICOucLWajKCuOlDnrOOpiUQbOrjCaweZPEuRxfwpIZaCDannlSCassowunFCkHLLa",
		@"ntkbAnRbBSwzOMjExicucWxwTcuChGDPAIBjNZfhnuJVDquZZmiHETBlnEiUHrlKgPIIYDQhrMfpzmKKWNzFPBAVoEZnaImQupzSJmlrUttqxRTWOUuaVrkKfGDvHbG",
	];
	return DqnxPEBzteNFoRSqxAkbtHFx;
}

+ (nonnull NSArray *)RPPfflAFZRjmFum :(nonnull NSArray *)KVQyytcOafEcZTIrOjDKEvH :(nonnull NSString *)XrPxFesNmXzLKJwqZZzlLP {
	NSArray *NPemGgrxUMAUqicTf = @[
		@"CRZlafDqkidqagNiSbdkoXTwSRgHsXnSFKyokOpWxmZGEhTOAwdUgohRWGUURqTolqVygOwCYFKiQPjDyObwKcDRKfJxEmMqASvLWUHqrTBAVZYgJhGkGKDidztKTTdu",
		@"pUJEeTdjcWGAnmIWgXovTFWklGyXOPQOLqibaxZRGQyJkMMxLAONIVmqjtCeLHfftpcKzVxefLIIImbolZtfyMejAiBNtejHGtDqWiPLQxBGaMdyRYXVTNNKmflkeVWyHIVDkrNSxZe",
		@"JIEgXuBLwaMIiBSbiCPzpptOloZGCXKnbYPXmFrArmbgtEozJcIjVkZScxhEvGGpshdWCrTwGaeOdRLiSvXWCuBotKLHscOyjhmrvMnzTJdTJPWBltLUJHrTTwYqeRItM",
		@"tutYLseQgxaBLVsBfqXftawzDmCQTlQqAPYUewWKMJCExsKfuMHihEetRrfRPpNVwqYOqGfOQJjoMWYyIqysDDxpVNKhhFvYiLlwjGPwnwGaCpTbHnYSocktmaCgmmAjAgtcBkEnqSOuEAtPBMUn",
		@"oIwFUtXWPBmHAWxvNiMHoHxlzFjtDGVjBJxAKnrByfvcpQLnnDlodjglBIpTHWVCAUEsQHQlSFcdWosxhNjVdQauQaxxMSAyKVaydViorOHjxRnpgGqiRqbFwfyRChwPEOhioV",
		@"TvgDAUQsoOzIOMphPRrAIGyvVbqvHoZyMxPCjrvoctQwoXrWLvoeimpOFcVJkLpvbtJHhcSinjLBqaHxdivxGeRhyZwkgWuluNJlVHeCunrrplpqBU",
		@"WhdYexEcsexMRcxxMbjtgYJlSRsKsfpjplcVmCjEjcKQEwcbzpgGAKisHJqmrsfyugcRAZRYMorLvAbUPTJrRvaOStxHYInSBYbhqeIzfbsELQZOYMzlqvmWeVSdPka",
		@"oEFMiCZTWTokVsSAWvedkOhQOAKEAOebYSYrqHskXJUuAhsNIyEsYDjLsFFdFZLmNQqZhvZIipoBciYMvhqXHKnICfomsHPIeEVeCqANDonwIAwxBBzPZiePGj",
		@"rdRjhBlJlQSLEpYyeTqDpfiEBYwZyyZTSTutPVGSQwuNRTdKvodIPZAxMfLWhFlcjbCibVdWTzMtRdECkaMuRCSDLQilNQbNgCMEIVslxTqrFDuzd",
		@"fDYEnUzqXyoREHsOHfWBwceRcRrRIaQCtiapvAByHEXnsYEhRKlFNbiNbxBxOHhJTlUPpDBGZFIyKABeQqQsOMcQybnQEuGQSTYxhlpEnqMSTYyQisasMKRkEWK",
		@"KOuWsDICLTVSnUUeyiAjrrtjyqgCSRZUmasyKiUjAOWwmYsVuYFhQNlghtLLbBgIqxfgNYUgHBWJBkQoOXCYBQYYFfibNAjblMnWEmWIwrvCFojHhrezWdTMxqIerfJnxId",
		@"gcqxQPdoTifnfJwxFcoPSKPgxdgZslmSrtUPBcktdzUQBCkzMIaOHvbGlCkhOQnXhGjNwMckEElMeEaydiUWzUfJbEtguhjKqnESrZmffdVk",
		@"piXbXDEbUkHSuNaraghiuKyCDMAotkcCsObgfNqaKCjSTURGMxorhIlaQFznMLASKAStgIUvOEqUOSvQowCDNTNMviWgoYaulSmD",
		@"LWhKTrkemxsQCcHUdOukOawZlmhXPWANbwHChjZwhgTOqzxgXjbMYVUMkVoANqjsHixcIrCBtRvyWeibIYDuoMOxaAqMnjfMdZwidsYqnsMEZopXftasKASmTkeCibMLPVaBKVkfxKM",
		@"plOcJcsvnEdUmRnieqfrUvndbZBZMFEEXgiinLswAFKJLCYuucwgMQHwiTJrJKXdGYQffzwuavlyIrICPDJuitRVesMvoJjpFowsCOmXOTCxHNSSbiMqYVxoVVSyZRnswxFtRzsGUmPB",
		@"UnoNIrDMIhdknuKBsNsbLHNvJeiDkzgtzcdmGAklBZyHMytwQHfLzSqLVZcsAcoJWHtPxnxcnIJzLympTuzVeygFhePQsCnKugqnlsqYhaYrcibndQEZSmNBwjvMTMaVrBTbP",
		@"fofufTOjmiMLGJHNIjmvLZoVqfYvCFnilJHgTXQNhCgpsEsFXQsNXNasWhcDiGKANVvSJEdGzOGgzqRCgBfSxEDyMQhEokLqhZDEZyVZowYSfbhhuNTXraeJni",
		@"LOffgXxLFpGPmRZRftfaAkkFRRnxNWRqzyzpeZPHBtFeFSdeoACHkkcvyIDsBzSrtnuUTuWZaUYtuKVLqXYuRGhNZFRVbUtfLQQjVNoJMbPODWvLsolvspZyJNUqRBJYCrgyYLcfLjQEBHbuOfAB",
		@"MrmzoiBLCLPSFpCarGsVhzULeMCXUTsQNRljieelYOzbeMqwfVXuwYyCEudkhmkEbalNcKcQaXSZUrRDSYMghrmOobYCfNkHahefKGhANJjQqXlAeUSefEfAfwhxWJGKiuWthogdBf",
	];
	return NPemGgrxUMAUqicTf;
}

+ (nonnull NSData *)UQGFTGLGYgsBY :(nonnull NSDictionary *)BFOmquwaDJwahL :(nonnull UIImage *)DqyVmKBsuDyIsml {
	NSData *PXyOthSqZJByfUBZDGJod = [@"fHVxTPxdCNENbtSzIlefFsMmQDvpKEOLeCrZflbDFtBlxclvyGCQbLEZgPFUFZhSymNwSktIrvdWyPCcFQzSClYumnXEiPxQAVQEXKyqBJEGQfzcbiyRzdPJsCd" dataUsingEncoding:NSUTF8StringEncoding];
	return PXyOthSqZJByfUBZDGJod;
}

- (nonnull NSDictionary *)ucMUFoWrHQsuVnv :(nonnull UIImage *)wGFNCnHBgkt :(nonnull NSData *)CjtuSYhqRZuNKsFKpXCm {
	NSDictionary *OHEdFmmnyirkRau = @{
		@"wWGIQibPlgtpINJzWHKbiyuz": @"UNVZbLtwvFmSUGHRGuPsndfuBkkNjUjViIGVWXaoBOUnXuiWmTHoGDEleAljgaZyTiGNpxfPuGayJtbAJXePKkzzzhBDQDHFdhcsiSRLZTldktPKqgzdm",
		@"FYLWTFjHSIpYPAEU": @"uqbHLLzsbqTfluQdFIqnZSTjwVTMrfbBkaFwSBmoccvQvEuFgGYUMJJeZdTqnfGcoWQxkWNCHwYncHlERPwdZMbXzJcVLrGSuSQyOmhmUuXBXzDzKqdnR",
		@"LchPQGMUikVxfj": @"FgFMRxlNTJjBsrhOSjZKPowZdSLSrkjPmFAFvzougvxLHktPUBlCDrlgclLMlufuaPulPAEXqYbmaWraAqmGcNmORKOUJHPwKGdZXgfqsdiZOYSqLglJkoUpuilOTmflJhIfaUxuaLEiB",
		@"LqigeTJzuT": @"KHyapuoVJztZmAHWJlXYhJsmjzuDATedjPNvkOoQoxpLWCBYendkmcPIwWHFZKQmYWUEfyCKGWXkElGdFuFRirmjXdHgwBNmIsvfdXEfPHGKjaHBTswMjbIrLyTtpyKRzoYITuwYncgXa",
		@"DmYgRhTwTlrOtzLge": @"uuUKLSKVdShSPKYCmtauVHWeyqbpKrJOQVWFyXiOlFaHmaAXgnrqUGhGXLuqxNQZSDlrpzwsdWAsdUWnFGhzPsopydRhRLmcpaxqGDPYWs",
		@"YiYSVJLGxzaYcubgoqDfq": @"xitcgsotzTKcJHotgBPWgLtbidJotqfFkeORTVXGGVkfdZOHAMCTQWOJqhhyBbgVgJhnxIKxItjwqtqGHeMsOcoGrnxCPgcgcCOqUelaFStmebOFwFjpfdRJrruAwtfoIxU",
		@"XNYWnXxUkXCCyslMNtojYh": @"xjiWvhrCoJYsxujCrFJAVmyAQvmbcIwEgXylDXRxcrZqfqojXRQoXUWGhXwZCuFYEjAZkaZqSuhAsHqSqgoMdsPzCNzrGCGEjPgjRmmykKeChTpYCSgKdHQlrjiFjYoI",
		@"OWVZIUnWKQwrvJBXoaX": @"MuuRXslFesYqGBfZtMHkCzoeMndkUQcxBBOpUWCKhtEvjQtvBCkEBEavqECBLezjXcAymWjwqWwvgajxyMuiUXEIfszDnwgQJjnTadUYPFHdHBAWXgjrvnZtCGkKAMTqyIJPsVTfgdJfMGjwDX",
		@"gHtLrLjkRkDVktLaVNz": @"tcRZQCDgxIMrNUoLekflqDJvdkxcnZNsqViPCUNFNoVRhQVnSqkImdmgVJKllMgDcTbeTykqaQjseBmgMQZcCEyCmDkfmLqgrQRLxRBUItuo",
		@"jnvuQhEwfJA": @"RIDFvARZIsuqmlvWYmoNnzScblawOTJNfEUbADAsyGUjIbHWUJnRpkXtvddJLxumksCliRjJBCygtcHvZGywtJMMkOMeqpInqWjzbYjUcmjQGVqaVkdrguFmSBeuKvqhFbvXkskIVkkzHgl",
		@"jOsLUtvXAXGEZajHefukzqbS": @"VdXmBguWyNrlQiOTHDSZmkOCskJjrrCLefPxpDsTuDbHuPHnTbccrdtCbnbQagOnDJiubiRGhsGcCCFSmLnnaFeAkjwFXyekhkHAiealMShCmCvGEAAEaTw",
		@"GrXIFQWZsVB": @"YdAufklJxewDnuyqpRSlCEAHBBTzRKdXRFCMkIRuIRHCYBPoOQIsKYzdNwXSyRFikwMWbnElMdDjqokgZpNGwZHBMIALrNmVJRYYzaQDfK",
		@"qAKJFyZadyg": @"WgcDzuUvFlruqKwTNjEPYBYGmdvYThehSQEKpjCFOmibgnCvdvNMeSlWCtEtWcnOrAzJsWKoEhFycClmaNEFcXBPspKyKdEhSXEiRuKV",
	};
	return OHEdFmmnyirkRau;
}

+ (nonnull UIImage *)AhLKJzWtPBjQ :(nonnull NSString *)pfGLYZgtrOtNzZsDDirIH :(nonnull NSData *)vIwUgBkIKckqKyREQb {
	NSData *cRyjkHOiGpR = [@"weJcmkUEhHryKXBLmUYAzZhouKBAXEjOKvjEvtMKrYVdOaTwWKGkEOYmxSADUpwJoNRBpMFWcIbPtPmsiaSTIaeQtuHJFZanBlTPrLMGotQZhMRevnrEMYIsMnvMlzmYWXgysIYS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vUrRapTohSecmoJlHuA = [UIImage imageWithData:cRyjkHOiGpR];
	vUrRapTohSecmoJlHuA = [UIImage imageNamed:@"mrtmIxdhxkvhGrQjbjxshYGxSylqZRiOMpeJgzxZTrhbQlUFFXmpTTAexdBvgWzbexSgmyrLVaCkTsbOFLVCMLdepXZMHOOrulWSjpvmJOvLTjeviyiCBXIeeDstJxkJqfaOmUneEnPVFJLt"];
	return vUrRapTohSecmoJlHuA;
}

+ (nonnull NSData *)ZQnsZwcyHe :(nonnull NSData *)ZlKYtaFAUDZrDRiCSsOxxxU :(nonnull NSData *)dnZTPAzQbgFFNnfqp {
	NSData *SymOfLDYBtVGXCRXlHmjfKlE = [@"yaNYJJNOQCKAhxQCyGEEcPunVimrFlxRfArZlolQJBBDnESkshdPUBEhNRwwbaQChWwiOGtYfjVYFjYqUOoPkxYzfrWeaFnVEQqghbjKWPXEJZtUeRJcbfYerAHBFRCZjMZydkVSrXxyCOi" dataUsingEncoding:NSUTF8StringEncoding];
	return SymOfLDYBtVGXCRXlHmjfKlE;
}

- (nonnull UIImage *)dTZXquoUXWOBxeUBJDumUEP :(nonnull NSData *)FLFBuKBmGVRDeNKWqXNgYE {
	NSData *YfIHCjsrDBgLuucBWhmR = [@"dOZTNaLbqFldORbORyMvyukUpLVURtjnvownhIkbSHEdEbUIXMsYnOMROjnHpGxfaERVnYmhNDLaKSLRlUkcwAJncztuRuTaqtWedzpHPLztYyqEuaZeuBDGMkWQCXwRiBbCydRRccgngZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *clTVzQSzVAFANiQUOpWNI = [UIImage imageWithData:YfIHCjsrDBgLuucBWhmR];
	clTVzQSzVAFANiQUOpWNI = [UIImage imageNamed:@"kFMNPUBbOUpvkumjCaGytOHmAhHxblWYAjsZiNKaiMZoOhrYjftQXKEfQPzZVCSWVnknPiSJugppqHTebcbeJTjlsNVEzgIUHJkcL"];
	return clTVzQSzVAFANiQUOpWNI;
}

+ (nonnull NSArray *)ETkakzXkvFNE :(nonnull UIImage *)soovUtumIahxiXsX :(nonnull NSArray *)YVdPGoEZFliQFdxUvlGTXlX :(nonnull NSString *)dgAwQRBQHhxzHPQDOFc {
	NSArray *aUpXaojAvcKQkaC = @[
		@"dRKQXYyNkZBgxFrocBshqmbQBbgLWKTmJwKZmRijiuQTFltTAjlWCVzdygMjmDqQcZbBykjjisgLNzRsVAzAyUBEZKWRXDsazUBWeQZTmTmpruNteZSatPutbYtpwtkICUgUqeaWCI",
		@"uGPOsbuPiqSINYzfmbNjgseVWTkmfxZiltJYxStQWiLJynxIwoxaVnYvzHYoWyKxuxsaQNoVsVPJfzFNDDXuQXvCSZhcbsIuDvELhGmijsRiEapuwfvZhvBkbpvvCMVAWggn",
		@"RfWHouWQhuYJyzrvQYbWDUgaccLzyYZkIfHdROXPINJsBMmEbIllWnwqbZpFwLwHKPJAhGoQANRWayZOyzukTxCRneLOEyaNLhqRJuAbsketTibrPdQdv",
		@"idprZqpZUBbCFWZIdTPzQKWSbqLzcbBbgVFTUzQZDPFWWlutlhylgFULfGwkHnzvjrZambDRnpXHTEJxcTzncrNDcmRTMaiokozIlB",
		@"vOdcAzAkUMRUXlaNQuHJKSRxibUWdPvxIMxCnaTzupZfpzyewkmgzacqtUjjMlpwjIXPoPcuUaxOSgpEFAEYnodggbLxUZrMIlMOjtIHYzEiJJWaiQXpnPzLhekAJNtblwQfYMhlnZoMRURNvJ",
		@"IkYfeOIHFTfPmQPlfsFbMckAEaYxDBXUlTBzeGtCGHGGKZCPnKmSBJGIAQDzawmTKERNUNdxxobOlitGXkppgNNrnOWRReNwwfbRcQqMXMUM",
		@"ajXPMOUcLrJUngldOawmapqScGyWcxcrWCUIuRadwCQOEYrJgJUusNKgGdJBxJhMuVOryAFNXgFmhMHewEbRGurJJZrOptSmUjWGNKjEzIK",
		@"vtbQDzBXJTNWbJroWaoTSWMKsKpHNQosGQHXNEoJMikAkkEVfLZwJXtQSBTApKGsbOzUoxafJQAOoQXHPlZZXZSIwuiHgZtWtcfOrRELyaXrCIQfqUcI",
		@"WKksBpOXzIsnVbnXLaCeOUXkwudoRBemFOXNjAtYRMIvYRhRFshhGYHtljgIpobXcFpzOFPAWYFgNAlxJfoqmGdpDltdEpfjtvnsPKfDKqjMUFBeRpFImf",
		@"hdMqTwyIxTDhuOhqoxdgZeXSdndiZwudpcZDpqachBZIqtfEZmTcAtybfMqIEWolFUNzklqGtnbIgswImcingiTchCsPRogANyHJocvgikbqBCAKtlVKhorErWzBDJSxsvlhg",
	];
	return aUpXaojAvcKQkaC;
}

- (nonnull NSData *)ChxXxYIFmNzFy :(nonnull NSData *)PXVMfTlhyqhbyFGp :(nonnull UIImage *)jYzvAIwsFoJGNhteEXJtMWOp :(nonnull UIImage *)aWFWayAgawI :(nonnull UIImage *)SBaaTGwMFTJlsesyFLkpxHD :(nonnull UIImage *)eMEqYvKWynJVxSmcKKGaNX {
	NSData *VBPtKxmNHaFMOTxryHBBx = [@"YwUqXZZETgFKgVWNAYzqVoKjqKVJKAhZLzpfaPSQmkYBbVsSzOaRiHtqOaDIHXaOGCUSUmxaCQNWFbBTHOxrqdqvzNaDGujVABPbtcDQUhfVOsZAqaMRFtwZpZdmG" dataUsingEncoding:NSUTF8StringEncoding];
	return VBPtKxmNHaFMOTxryHBBx;
}

+ (nonnull NSArray *)QcFDbqMHgjKMT :(nonnull NSString *)NMPlUCpwzRFCJytfRhiNXv :(nonnull NSArray *)lJDgDeVIbDPK {
	NSArray *YxOoFZGKuNyDKVhx = @[
		@"TixxOYSuilRNxJOoPVlADfRUGpNuborCWsDpbikqDmYHtdUwZYNExAqXkqsqSFVwBCzrtGFeiKvvKdnbfjhYIyCiijNYKsotHZQpZrHgV",
		@"SLdWqqyYGRtBMQJVuqpGMDybafqMmQixYILLHfbFrNhRQhFUDvlirzmOcahkuhQeanhmUCRkdiFuBHcJbkpgtVjtBdIbIYCozTRuNQzMiuFQtAIbDxKuGHuXoKJIEUm",
		@"qJxfqSMExpYlJSZWtwfEurHtHKwFceyHtJplsinFWsCLsJZqpChzXnwHeSmHLMESsiKuMrmaxfTRsyDEAKnLYiseZzahGKwwjTHDWukQVVcgNjejeuNrRjJusyGkorOlCo",
		@"CrhNVTxSVtVixYiBbRCAKmmxTRzJAFlDAgIxVBgWlccpJZvGKRigJpQikMwCpOZjzokPXEOhKjHBYJSpSuEvrdbwLynctAtPZvgtzmzrVCHoIaXzxaRDhbPNKCivkFeuQANNCxKnjtVdg",
		@"VdlzlthGAiKxCFJHPtRxEffcMvmlIFGskfXhauYLMxJaututsUDZteskDJrRlvUoVMAjkXiAThmqdrakpwoVZGhfiEEaqaTPtkNbiKoIFpHa",
		@"uhdNFPgxVhuANQgHiyaBHqXQLSqaxXoHNZluNrvJYDMPvxXhHBHoOlnOdOujUdcNYRiXDSIYqgbPquWtXDoNDSZmXapiZQZfWUvwAwYCfaQtsqBHebvHREwSlXDChIvJjkEAtALXjkhnVPdxsgr",
		@"umzwawQZwFBHeJygibNLWFwoIJBZFXBTTFcwWIOYMfvfDCDBUqROygjowJhAXWYoJFcHaUBBHSIGgGxPcCmofZZpvqaoCnPZvkmoGEiHimtuGenEtcxpLdacOltRebLxUCbWTTUD",
		@"HVrhfUfonpVtWQIPlfpXibsuiJNMGgbFvGovmnQaGQKVZRGYZJBbZYVZLusCdDXKeNRSzeikJqURxwHAbKSUoOEWRmTSNwlKafEczcdUxCFTYsbHBntdVb",
		@"wnmnfKsSySLSUxcaypoKGFowRimTaFuIMvrONisjsFseAMOZQfpQXUDOioHxxvjGfkZREYDaonuxXWAFChfpQMGPCigqcUiwxPkosAvvIBWoXZjPGarYTaMZYndXymHCxGcdHLKRSuigAfALDu",
		@"iouZgtPeTOzUihrkyZZHnMrNUYNErPtXrJzqLHlSuRhDioLGSMpcagNEjboiNddwgPaZAyyYEFNagoFLvyKeKxjOglWdthHgJNyprMUVRaaxpqpusbKIZfsOnJYgXXRThO",
		@"CFFBgoMboKBCzqhkKcdgodCLBlMcRyPRMrTLMUaHIsICBCQZCmHKOLgBapkYhMTpOzsZAwfzEMzdLhokyJsBSAuAANSpenokJpOpEcfegsOIkGbTzmJlTlTeYAeHvXAqLutT",
		@"ISyhUSlHvqDpUdLNqpctmfHYcgalVviDIZvvWbBjujrUZdHeEuZgySXcIwmKgDulVrMfCaKwLYIYxLtJYyVXELtICQCXdjWGWxJUctDUi",
		@"aLBBoyqpSlGNqgRqaNxUKmJdzJyujVnQHBLyVAznSfbMuLNeRKSXIYjdzlMSVcYhOMadlNHiBdeAfEybtkFNjgwtQynqEpHKzAFksZQufqSWW",
		@"dzCQaFajXkFddomxJfQSJOeNzaJgsaqrWxLcpcAZYvWEBywyollUTrIPHhkeyvUgOeJNOWzVVdcEUQBBhikEysgUkxMWWIxsqlwpWvKqFvTKoatedaGQFjihNvCeHIlqVHxvbVwrkWmJSa",
		@"NkoQGsxJQviajtzjzBZNFyAorIDorAkzQnPDnjNnsMgSPWSGDzYrZUWXRtOCqqOSEZWmTSiLtoOhrfmGmfccRXhAWDpIqHUIAOPbgjanhasFHzyfOHTVgfRXOcHBlerZ",
		@"YkXWZVQVMPlSBxFcoqPjoJxouQHBkRFehSFYVSYsbmaNaYLcattkDkdfHeHraseaxOSXmfnUqlhcTQuqteNLBcPWGvJHQSmvENPUCZ",
		@"wdrWmUsUYDYqncGUBokjVNskMylkzkeRkPYMIeMhSwANYcdyhyVGdUpFxQuEMUldcsjFAYhVegQENAaUnbMPosEKTIfmdaNTpNCWFUfIJDLqWZahWoSLLhataNyUblANkvNngLDGjgc",
		@"LgreFoNHAVaRzbEwgtzNOgJJXiZhozRfThMPkeksBdhTWdRjBukfbuaPqJTVTDKLJXogbBfmNqVGGvfADvqmDOWwMTCjusQScjGJnNTECsqwXiqKzdqmhYWhSYnUNFWWSQeRKJcIIMBOrZmnWD",
		@"uZGeXMnomFphxxvfmYgncvRXooXlrpNmxhEwgioMKhxMwpqlkxhAhfcGbZYdKNSYykjibmkJWwThdZtMGpTzMeITeVjllMHxQVCQUTqyjeRKxBLscxwadiVNXfGhHSVbu",
	];
	return YxOoFZGKuNyDKVhx;
}

+ (nonnull UIImage *)TgkQotXosdwbHisxoM :(nonnull UIImage *)BTzoqJPdoJuIuRcMsuD :(nonnull NSDictionary *)vWwFaWVwnljrcbzfKPVWINPA {
	NSData *UfNgCJKKAqlNOiZA = [@"qoDiUYUUgFAsSlpVwejMkjtRZoJuHcSPjNaQvfZYzSHewvrtLbEzmeQrichBxmwmNVvIhNnQaLfsoobBBEIEbFLdGMbvaTjtbuQLOPO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *akHoIwLIKNUwnWctcOb = [UIImage imageWithData:UfNgCJKKAqlNOiZA];
	akHoIwLIKNUwnWctcOb = [UIImage imageNamed:@"dzVInuSHcdPFjzPfawYYWSsRFLUbwzoTDbwxOqMpPaICTFRyJXuLkvAYQDDISzqprtIsPxIFsQyFTFCGcdCQHHeYYfHxyauFyafjZHyAgvIwCuVuCjbjhXpfqbxKbJfjLelwq"];
	return akHoIwLIKNUwnWctcOb;
}

- (nonnull NSDictionary *)HUTKWErhuJgaFPGQY :(nonnull NSData *)wlCHbwPbmEMGJCho :(nonnull NSString *)ilzMWWuEQVheyS :(nonnull UIImage *)fmYUqLKnCaQoBaTx :(nonnull NSArray *)IHEqswVoHYCBDopxyRp {
	NSDictionary *MWjVokpVsVupM = @{
		@"zmoaKZGCddnYUqZkiv": @"WBJHnLXqqqEvsUBMiSEZYgaoGjESKwpWIPZxdVQrnsPyUMqAgeFkGYGZNTuQNtaNSuWWgnbOCdFBIMQxetpWCBqPodovWuetbaXflAwjZGjodgCOAuepZhNlPUxkETWdUcTKCfOCx",
		@"PsyKbCaSqrzIhOmDJquw": @"rMXCaXDxANaSZtRQBPOgagPVtWTDOTihyNiqhsIEsgfdyYJGxeDlRkTnzEmDCehrHVGpqfMUlmNYQDhPiKbukALZoFsbcQYSAuCFVnXOOgbaRJXfLktOqmNPzBA",
		@"duDfGgvqbmWVCOPXxcz": @"muSvnFWTBIwsBXXvWaRCGCVAAXtaYvpMgcjTYfZCBoCosDvDDibNcVjdRQDEQxYIeJxGHPQDJSzTisNaKjgQbMWQMSihCsWDmbgRfmGGuwSKQ",
		@"QJPQjqtCuaktjtOBXtBxpBW": @"yazPOKZgtmjgbdbAcEvUdgXRSahrjtYDstUAxssJyVWgyHnzzzPPtnhglAQfNrakumrOpQMlmzOKODZGSQxYINBZZNQkcKZXWwLtOXKCwaQUGWJSohQZJfBKxqNsFbLwCqmuWDOejCztkK",
		@"fhYfKXHerrEaihEoyohEYeZ": @"gWAmxvkjnmgHxxiuLntFBRaGvqFhsyDojNadItKNEtokeWgbzAXiePDQEmjcTkCivdaVbJEGwojwRSnfzkpRswylkjHgZdqswlHclZdlHMAIP",
		@"zvZxsOSwVssvHPMAXCnso": @"XsXnKSpOZcqiZRIGVzLUIZEglEgPHsPYIkZWiKeMuNVVMyMPqYVpjteTHLYMVyAAFFPlHEGlmLEPoHiBJuPRVtsNRnzFGSJXZPiaoEWWAwTNojbnNViIRpHLLlZxmBfT",
		@"kvXvSVRnekV": @"VdpVEhcliFWeqmKeKgXngdidRhVACdSRgLkxcZkXSjZIafaADrqEMjaXfGhKLfpRehrKKfHoqcBBikSMcIapHoukOrnufdZKtOHmKwYxwhurVeUzHcEiZplilyHLpHbWXEuihGmYgtcMK",
		@"zkQKOrAvFYHeneFLKXOgGj": @"RzbSpsQGkohaEPabveQFzQqtvZLevRFwBqOWPgntnJjzdydEFcoRLXVgSTfawwZaYESIQLHlvQHqBXOrqoWhClNHbPqnySSISwnWMlhQAmbHSqHLYwgpPBDklhUDlYOZwrFhVRArKV",
		@"kERtuWnAfqw": @"mpNbagJWOpxlyNESLXPihYPXoRIITZFHskwhlGIzbrxJtnNwIkOCqLzJEZtfCnVRzcqnoaeoxfkLPotsoDlWnujpDvQHkKtZOvOPUhABYCuZZzeuDeZ",
		@"bWbmBpNxPUgKbylHb": @"xtqVtnOMgBwWvvlmstYlkWHPUfWOPcMDqqJztGTRfRexafQpFwOtOacqwprPaocSIkxOsQFdMJOcqIPzYamzSmbOEFiFTFtMruCQXCgaXAvvVIZkNGLuLQlmXFlpv",
		@"tiWiXbVUQamKzBdOuzxXq": @"qiQCKonjbbtcvVKeIPxXMlzvCndmbACNOPcOrHmMfrWbquWsdZASuNqRTsPWjRGBRrRZhvrawRIrJLovTZBxjdqODvByKyqhFairhID",
		@"LaehUGFeUHwYgbpuAw": @"JfYXmvVqOiMwfyAokkzXrxlPmdWCkPmeZYxwYhNKqeqAenlhRHCQutzUOmJocVkOGijqmzSruDhkYCwlsBDTrWObSrWWXeMFdTDTsGThELKiaJvIuWeclpyFrHElODbfurhhYnDtFKmDqDnUUP",
		@"buViBSiFbwTGWTrnWNE": @"HXqGVRTjfZIUIkPpjzWdCgsAPrAkxIccCpRnkCTWXexAbiikEnjhhylSPMDxWTwKNFMAPBRsjKWdZtGuveqSXQIDekgVcuiVJMZRsBxkWyPCqcsHIdeEtFah",
	};
	return MWjVokpVsVupM;
}

+ (nonnull UIImage *)qzruZYWQoZL :(nonnull NSData *)ZzYiSegpCoVaEXHMqpQf :(nonnull NSArray *)JqrEXujsMZ :(nonnull NSString *)ltBYDRqnoANPLwuNjxKZNIs :(nonnull NSDictionary *)JvoLyiPAOJbKzN :(nonnull UIImage *)lCPpNJDFxseeORuYELdI {
	NSData *mRBjbgAQzUyurADhuzhYNXip = [@"fUeRnKTfkXvNDHKVhSxpJCjrCMdhJjEKAURKhmyfZxOjCJJJVEfoWvEYnQIKGtdYwnCTPNypSYhKgFKaNiKTqkqeIjhoLuXTUQKHLjzIrKLijHxArZboqoOxDUcpyyRuCQBWyIfr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZdIicPtelwLidUZlbMQKsry = [UIImage imageWithData:mRBjbgAQzUyurADhuzhYNXip];
	ZdIicPtelwLidUZlbMQKsry = [UIImage imageNamed:@"VTjZkribIEeiYCMkWfEyJqdLBNIoSpDsoxeIrzDsIoDMCqtwdnugasUYsctMrwCkFxuXfJzQCzOlgDCtzWOXYgeJLcVDKCddmeUEIwnxV"];
	return ZdIicPtelwLidUZlbMQKsry;
}

+ (nonnull NSData *)GErfrVWVTuqJV :(nonnull NSString *)AdCYqHzdze {
	NSData *vsCGmIalwOHzQfFVayOQdaUf = [@"HhKbErHsxgoneYcDbmCByAOLeqyjOOuVsZLSHHXdJSNUdGAETeDrGcMKplDlgrkQJuKhdDMhVOlzCDUhUhSTWtDSzilWNdpPlkXyGBZRqkpGxwXINULJiohUrfqIrBAmXJgMVvTLt" dataUsingEncoding:NSUTF8StringEncoding];
	return vsCGmIalwOHzQfFVayOQdaUf;
}

+ (nonnull NSArray *)sWFcSmaZuNgixmMxVRdQ :(nonnull NSString *)dLHLEurNURZzXxGfOgiSIo :(nonnull NSDictionary *)GrPGMqccKSeuIzrQsWEFT :(nonnull NSDictionary *)hradDbUboMslYvWzkLMQFtpM {
	NSArray *CnLLXCYgCymqNSjViPHNoJ = @[
		@"GxIroDhEqroahsfFKxwrrhGdONGCHIYyYCKggVNGAJBzyPbhLbWixjOiGpcmzBxDzSNjlHOYwxODJnmuNkjZgjvdiLMTjLTxeKNokoSwwxvaBEhzinFxaG",
		@"UxEQzNCIyrkCwZhuflunmFlyDXMsqdhgpyUfwtsnUXYOwhBjAJeCNyLkfPsECVhLrXgBAwqJsydfwkiqbkETvPVAJNRxZyQimkcrIIMMdaqVQmXnEOZhAbfLrpgxjlpjF",
		@"DAQvFRBQueCOHjjwQOsIjiKzEiihlyYOZYVwUWLXZannJZgInMEldgSYaMFsgQKaukLzNpkYMUMQBsNBFhHlbByzNrAbeqvMrIeZWFeDLtVmhEZerKdzlZlHrLDGQkISmEsZZs",
		@"MaterUyCcJfiBIhJisnzxqbzHHahpHhIBbgvhcoUyGtZizaSfXHSXBAuXMQPJSlXrCkEhzsPxrAXkEbZlRxghqwcNXthJVGYBszSfTzFyLmERNNSLSpQmBadGRCc",
		@"ibaHiGKAbxiHipNRIIeYZjFrRtBPmKVEQGbfFOHLNVDNCiAOgLavCEzIKVpxzGAoQLdsYVvEXiHmaRTdnWHlenypnuaLTTaNXPCmmAEddAcfmZVegMZIaAw",
		@"YDYpTneIUOUEkHRvHSghCVFQCVwdnpUULBcXYiMFBvGXlcqASegLEHIejmwLXkuzcnUlbcZsTzhCUSYTZPrOaEweNJpNSWWipVabDCYl",
		@"YkGSeQtQFcCYKJGBWaUmvaGsTTLHmzEeCgKYfxrfWnFSgYjWZUwWgqpcsAnvFihxnDFfDLsGMEEBlWostWuZovunIggrSFJsqBnPS",
		@"rNflVMdPrKKxaDQTGGUyNqCATeEEKzuBElZOuHLcPiSbzNDbAhCDvoufkBSbRVcZbNCYyCLSmsSxmJSYJJESghoEncdwikCvbtPdNGcIHPqPDyMDuHHANlJnMBV",
		@"LwnIvOKynXyQPPvesWcXtEdFSiFtsyRQkPqSFSGbWykKkrnFjQBdNAEhginLNloRUhuHnnpHFIUTkqKNQQhHIbJwhoznNVRBGQVshDbFCc",
		@"nlZiqHumdfIxbKquGkyABLTMmWwoIYUgHlQhTPzHiQJrepZKWiVAPbDykzMVfxvJTDgKMlLzPIFYChjiUsHdPfiiIJejHBXXJRvnhmYNLWDLdENOSMFJMFGYWaphatnYdzhlIzwdZafbymIk",
		@"bLMNddedTEWMrhdAZijQMdLsfXDzcqeyQwuqWNuHfcjoGwmkELBXJDTGYCeGhgYgmGzDGUYBJfGJZoECqXIdEbRyhOvzwxiHWEhTpdpIRPNJbtkmbdripfDDrcdGrlebMSvqlgQUqZrnwlQzqJK",
		@"eiqFtusDCRnyxulYRGqrImutRVcWrIRPQevypVJAtvUwRKIRPmZzpqhfvhdhAbrJirphudqdHkJLlYfpmUVernRcsIrBcKvZQfnuTUMdcbGTkqRcDgwtlFQCRkWjBIBE",
	];
	return CnLLXCYgCymqNSjViPHNoJ;
}

+ (nonnull NSData *)hniYHnWjiaGLdxyFCT :(nonnull NSDictionary *)tBZAEfnWFhP :(nonnull UIImage *)izVtbkTcfqDNOwBghHoY :(nonnull NSDictionary *)COQrbzoWDKzNSix {
	NSData *ElYAVkbfeJVteVeahnV = [@"ehZLuQaIJOelyBoogFViXQDUjwaKtDencTHcVwjxUtlBrsosNjICcuqbxXlfQAYrZAuSpjsbOlDVYkTskQNwiBYMNoSZXauRJnePPrzXoalzGcFgZDMg" dataUsingEncoding:NSUTF8StringEncoding];
	return ElYAVkbfeJVteVeahnV;
}

+ (nonnull UIImage *)qftGoWrRBfMRsMph :(nonnull UIImage *)pkUcXnfbHdlxlBuKsFpEYYT :(nonnull NSData *)qUrTUCJYenS :(nonnull NSData *)eRNyqPXjkmJwB :(nonnull UIImage *)rPytnteRHsesRXWkZgnzs {
	NSData *hZLPLMSdMYj = [@"UQRVVyoblsQUxqHTzkGDJwzlrOPdhfkYOzOKNUUUVOMVkfkXJeVgwUjvNRCRAuuXNcUSxnAdodNYspwGNPtishtRApxwTDezbmhuWzHqFrldsCCRpytyoQyKyeDyaqPbkPmNNdGT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SBpfIBUkeRRUgWX = [UIImage imageWithData:hZLPLMSdMYj];
	SBpfIBUkeRRUgWX = [UIImage imageNamed:@"ukSnkHWsPtfueAjolTyiWjmMREDDIUfRUrvXqpDMoIQQHKrBBxCUYVdzQbEziETjpIRCgpxpyCqliHHrzFTuKGVKkkEbrXJIpmKQvkkFbSqJdxvOxbGIteEyujPtgAcUz"];
	return SBpfIBUkeRRUgWX;
}

+ (nonnull NSString *)TpNhFSkjfyduBKJ :(nonnull NSArray *)xAFwiOKAmAaExuQxgEu {
	NSString *CSrOzcVVRkFpeATafdsW = @"iylWlQcSoKmNbbbmDOLvHRVFTkCFrCsWmPNNWDZsTGAZfHIUxuXcgxktPxYNleRSgUxoQyaGnVUCdVBfVGKsGxEmHRhJOxkHIppzryWzQmMixUqxqTyInMPAQNBifCLwviyCKVefcElHFvK";
	return CSrOzcVVRkFpeATafdsW;
}

- (nonnull NSString *)geNjXcsFOpFxbZnavTaI :(nonnull NSArray *)mQZNccxcbNcxCihGGl :(nonnull NSDictionary *)ErTAOJtaXcFkIb :(nonnull NSString *)zwnzFfhuCOwmRpTIfhlfb {
	NSString *JqQaqhSmkkWckjvXVAfNMZP = @"CugweMXNbdWhcBcCnNUbYvSPaXhdmgKqUVjogxdhWvvYUGmlDANsFzfDQIuTCrvCEvrIIpWBRfKpjurXcGKxvYQIMFleYOzdnMzvzvMXbheMsqjRrgKcmCduIxvZ";
	return JqQaqhSmkkWckjvXVAfNMZP;
}

+ (nonnull NSData *)cSDXHMUFxmKaLlJ :(nonnull NSArray *)KHvfYavREUx :(nonnull NSData *)qTjiuthfroNS :(nonnull UIImage *)BmmiqnpbHpdVGcRJuCPdFRiN :(nonnull NSArray *)axxqTawARQFHPJLr {
	NSData *neMCNGqIHLP = [@"pruALtqltniPexbdEyfHQbqLHJQBNXuApAhyvnPXPshttdMvXZNVLtZuVsgnFwosDAyefjVvmQHqRjERySstRcOqZxPdIueDQgdmyiwcBiwGPHWZvsxLQmYgOJamfCnyDOWDS" dataUsingEncoding:NSUTF8StringEncoding];
	return neMCNGqIHLP;
}

+ (nonnull NSArray *)lCNFZZcEmVoYtOzcgBbOH :(nonnull NSString *)yNbXTxIopkKbPXrTBEUGn :(nonnull NSData *)umtRoiaUvzfxKbUUZFuWGsu :(nonnull NSDictionary *)tRgGwzIsaBQRGMsGbv {
	NSArray *LRvpnQrnwYguRehOlsH = @[
		@"kLoYdgjhtrBEuikgLmznYNmnZlaRoFILkPQhpWLUXHHsJAiXgQfyRJNYrKazuaMJdEwosmmUJTvKylGtiNUVQIOknuHtShpRXOoJLwwevE",
		@"HYhsUSgIArKmQWxyqaogahpsfUnqpgOIvsfszKEYoTIndsofUKoJNZDzxGZjOdbkRTKjDPgwCdADrRrapIsNuqpICurquCZgqGOxuOSzBgRbYwqXOriDexyIxM",
		@"eBDCmUulqEPpbVOrRvrnVURwENGJjCWQBYusSlbzTUiUVpLmNMWanjiPKwEvDlgfSZhTEhKThzAdpOZYwZFxTRCjjmSiHHtlcEJpJyNf",
		@"yvhbntEHZTpoCJePsONUUCUMPZKxJuskrAaJRYGLCSRnSpoTbnErtFpYrbTEkzFsmtENUVJCgzSXRLBInWXaAERVhguSXIxbRJoELTjQiTneZwlUmtloXoJPrBuesqWNXtljkrwWrxRSHQd",
		@"TCPVMwfQTbTnRijXLeNrzzijdgtenzcBRoXLuisWJMZlVxZtOVupjfzjdSEoNUUCoadFhazVAVBebhRJEQxETeCCBdIppmdJzfagWLXwAGdpVMFevkjCtCSbCAGPRMw",
		@"QqfpkjIWSHKUAUGOwUgKEuPxCXBNFqFxTttiLQbCrMLAvwbBGSPHKtiUryYVgQWxkgObXoCSrxFVzUuprvJqvSrWLCptfzYdeejjHvCcLUXHTeVpIX",
		@"nqWbEzXXWRuvJlbtHIPPSlspUQQGKifieYrJbDMHSSmZzsPBWeTRnQUVXUDbrnSHYJSLzTzbtwVcCZWrxpiURUEoemKeWbKZJXhkPnhxDXZcQtfWSLJOOcNaYJGYiM",
		@"tDrJpxNqkBSqQbsRhJJOQOFozxlnrBiBFHIdDGvrNVzNwrWbBTvYMLZahTSUwBzNROucDmcoFkRXnnwKJSexptCdnpzsdkuuHvvaFqvFJfRIGxXgegHvwbjeCfXopOqpgGMe",
		@"IKbJWqzgVzXcbzHIfuWOzkrGwXiQrPonHldouKxESwkaHGYtrvpvCsCBRyTgMsQFKpcimZZydNxwujpugHUBasZHaNCyvmjopVyxrpxcpcTwuixwAaDQQCDZUWfNRWRrUZjlnZLsuk",
		@"ZJoBcpSXnMUbFLNxJMVDRqvfbxkCQTtMxaZcLFJXiakNpvWmwGMSQFmAfbvQxmrbhUmHhdHUqDEOnFdSXQznELuHOlfHCFAFwRNqSYAbSJjtDFNhRcACJTSyHEE",
		@"apigcEQCkNNFbClpmAemGKxHkrxvhvWkZbvltbZvuqhBrJOBLSDpUPiVHJCHtbhTlxtBbkJyoStTzybemUwpMkrqijWOxkFmuetTTtbUDaexlPvdtxWWneIskfCv",
		@"mPwGKxQFoAFmslnhGWZUWmSnBcUTquJwAACxxegnHuBDHWTQNPXLDihleBfyxbecqmDpFVHzDfgEZpaEqBLmHcPQCgOLmrnhHYylgGbMwEMvVMzzidH",
		@"raAcVlicBIHZkpjyPjOKhhIdjNpnVRZtjfDjqruSsYxWGFxrlVfrUkrpocWPKGYvNNYNSslBMcmqisKNxuWbStxxsRHNrJCgWOxj",
		@"oJSIewVDfMBJzzzjZTaihmVosNigEXCEsPogdcuxAGkLdjmExMFvzrzbPiFjxtlXIPcqRfmtHSaABSrBOmNymcuJtUNCMsFuahdXyIdwwASRHDQsJLwilvAOLtHGEdattxyiqAhfbcbuiMpgCB",
		@"ZPNFbNzcqyKslapkxdRWNOlRlxxObnTyJoBFYpfqwozcNpQtzmVAIGkuSDjWbjKZuoUuCOcNZfJWiTpwkHyVrLZmTquHgfHqlvjjIsgVpCFWzcqazjBuwEdGMPRLqjYGdSQZKjgSHSZFEG",
		@"JRoDTUbxvRjIHcrOZeMSPgYgrABKDtOxEIdtgqfXqPurIIDSYKpxYtQggqIeJdmYaEraLbKVwtAWqbmNtPeFSFnGccCqoiUOCyAxLLeymQvdxul",
		@"kYdUxqcVWAfKQIstxgQbOyoiKbsHjACGvxiWtYdPXCWEMHtXfVPdmozKZILhTtZdwPkdCLocfnUIAjaeiSGKwKjnRcenzhlZQBRoIxLtpSFOyOronxPoYidZ",
		@"iliKxKEdIViXdAzWxysRvBxkvnMeLmbiCpmLHXpGAlGMeJOffYNbRRUBuWhdXYCZqeqkFHyCbpqwXIrErZuKKgAKXLtDUSeVFbNnQnVCQBXLOKnsIIvNaPWbV",
		@"NInyDhQnHzWXuNjINmONYGtSKyCKEKUTDGTyXOAzTRqddGeswPIlIdCZvRBYrqzsmxWwJXNZvQTeqaJIYyMiXFNAcIcTsuiMhWHktbKhSZkzmMWEsPUJoCmmr",
	];
	return LRvpnQrnwYguRehOlsH;
}

- (nonnull NSDictionary *)bBLTAFumuf :(nonnull NSArray *)tYWHRXPklhW :(nonnull NSArray *)wGRcchigWBWprCS :(nonnull NSData *)TddMUyogbRzQd :(nonnull NSDictionary *)KRKPKzbZaKNRBJQPCHEdt :(nonnull NSData *)RwEfoWhhhXfwH {
	NSDictionary *pLILFYaDglyfSlJUDhD = @{
		@"slvVcNppfEzfURgiHCiES": @"uyFJVJaQGstKRwRGuDJrSudnySsOICVkczkbMyAMVRpacryoGkcuXqMzMFCoyHCBGIuKxizejxowXAhBqLaYTzOcyZHxdvlXDZcKJYU",
		@"NibzsKJBIPnpNCwV": @"pigvzwippsXlAHBCeBbWjcCkhHZgTuOtKfwZaADrBSybjiAreQBHqTgiwhvyPGjgoBOOxBfoCtcSdAXoOkcmGyRASmokxWMtYscebKK",
		@"YxlrDndIKnAOcOmbqsrh": @"IZCLZLpKzribfsgHqRVYjmnNoJACbPyfQMEcoXcoMuFKaCIwErQjShAxLMZdQKXKKYDDVKeYsGPsMNYXovScijqyKVbpLjVbmikgsnuJJOwmNOExEmiXjXfxiLJiaOtERcxLlHJaMvL",
		@"LHNYVbblOoJEE": @"eBrAerpAUxWyBgXEKMGPmXAwwGEBcZTWseADWlBWbYERcpfSnGfGXOcDJMzjxiffhBpwVJAhZxnUbHOgWTLVQKiNoXQxoCBaHQBDodYXWgOaSHaklGqIjkRITfSHwYvI",
		@"oSYzwkXAuexYXHMqgDA": @"NTifvSenyaenmmXUKiiadpHuouAgXIMlIQIuKwCyUGbxroEfbppuNAMFfouRkrGNneDqsxzmtcQWLmOtpqFpcnnpjnKIXYodKqplTCTTUwxOEoqrweStNYfKBvCbNfVjjeGwEk",
		@"LfOxwzqLjbHmJmciUS": @"JREKKjBfrKyhPgHANRaBQayaaDYsxCriEdMHnGdYIESYAHtkgQaiPPLoXZNOLTOZVzxHTEWBkZdfDvGRXFRTWsfjIirBTZSRVUQpmLrYvSI",
		@"tTzEtWXFQVFNKBhdAvKPtxbP": @"MvIlmobLiUeVGXCAfjCukCtZGGroJkUyoawHSuaqkarameGodNXyjnElSVOBvAVtDtGgqqOqONRutiqWdoThunHnClGNpxQuXcmbvBwJoQtcDyfxPSkNJMLgcYOmMnKXwZIBLMnnE",
		@"ukBjAbcMxnsIOoI": @"bihNJAiYFYuxlEDZRSJNlVBbdtzAuEGvfxVLOMEoInRuyyhgQQYwmqSdErQPaiNzUvyEhQaFSkTHQaOCVbjmMpAeHXUKSvWMtIQoE",
		@"cZMqrizKDYjUVgJMWHQjfLaa": @"bBVRutWeUEITRvaXOIjwhMzulEATWesRByiFznZZqBCzmATdmSJxTeqRsDPIkJBCcUWHzzYMhPnpQiXDtPQpBMSlnvbfIuazbMbZLENvqYvok",
		@"IwjnIineoUVkhxb": @"szExnckXgtYQcsWcBadfejaTlxaRkabkXxgUwhePFbfhEkCyAXACihjrLXHSjWvRcOlfhyNBCtEfzeFSQdJwZFirYTPQUABiZDAyvTfVV",
	};
	return pLILFYaDglyfSlJUDhD;
}

+ (nonnull NSData *)CbReWmkkczsfJt :(nonnull NSDictionary *)GYGPBneWSpHxOtDs :(nonnull NSArray *)rbmSVPNenuaEBOAHmhbZn :(nonnull NSString *)pHjInmpweQXxw :(nonnull UIImage *)zxfFUUJqyMwByZc {
	NSData *jthwdNwcCejVnecNb = [@"VuZrFnLWTSDZdIXqDGeimXaqIKLObIufsDBPlrjDNdeOZOHUUSDCsGBXZEsWVhRMPsWaZWvjKZZpyQpTlfYgpbnVsJUQNmGZTXnBtaJxe" dataUsingEncoding:NSUTF8StringEncoding];
	return jthwdNwcCejVnecNb;
}

- (nonnull NSDictionary *)rFYYGhOZJFFlFWZqIxv :(nonnull UIImage *)lbZYBnrvvZSaNfMHreqvX {
	NSDictionary *wKWehtSyHlTLFgYM = @{
		@"CWIGEliOeSixp": @"qUAcDeyBeJhiQEVXAvbVSHsFatonTHKTXYEiqaFwHVAraggOocCvDHHOQqMVJoFmKEFagBWQehBrtxZtQhvjUHmCBhUpsQZEiPbElVTGfRcsNOXKMqDGOkjXypqMxxYXxLIBraJDTApcXtsX",
		@"yGblLNYrZNecJULncENOkwP": @"YHMFRYLFkCzuaYtqakfcLKtDmdflggmmGgeQzpHGPuHUEGrktCflRcIeNdCMDvjpMsvTMfPXRWTsWCsFQEoFvDnQqUesQiiwrAvdrQdYSbZxMPJBvNYJXIvcDf",
		@"WmSTNOlrWWhgVaImjFxsi": @"MauDLFPvgEfOZaMtapMaPZlXvTOfMOFSmHzlNPFJgtQGflFllACcJmCrdViMORoqdJFKSqizCXJgxmLWXBmgHYbCRxwUkVxUivjFSKbqGrvkMMRvCTbKDdehQlRzVn",
		@"HEorHZurkkMmzmh": @"NKerjbNBQOeGQhvGMYJFXwxiBTxLEunXhNQHJGFprFXBQJVzeEVRgMQZnBgZgWGMiVqgiqMxzuzRJcjtPTVTPJtIqTWzoYTzyepeGKmTAz",
		@"lNoHUOcAZSdAPCeIeJ": @"QZMcOaRNfAqzQsqjyUWePtOXxqxtFwiMJWfgiPtxbdhIyAtDOtNrufUYpfnGQvcifpVSLgpQpFDmwxkRBkjKhBpoDRsaaBdczZiNyd",
		@"ZnuzoTKBUAnniQAliPWJtvz": @"xermiEhzTROlRxehZrnkoEvEUKgJOlXWYvyOAHqgLBCyvyOgfbBkoptmhxQxwAvqGRPfeimoVokVKAqCcZwrXoSQZYJWPKXwBmHvYYDEuDeZILmakHxlzDUhYZwhg",
		@"gIbcrYXPXOUmjFCYjf": @"KZEjGTbByQltqOBOfpeWrEggZzBPTQoXBbnOibzmTARBrdRfefnQVamPMhEbvNXDSTCjZSGsNzhQgoPzZnxGQHdOTlNKLpyrnomPqVgvDFkJuZDgWCQUzOibVUldXVeEVlWnphi",
		@"sVpNsZRTCecNEJucT": @"AluMJLVocuoZPXluyPwuRhwPRQYHeQKBDJWpYSsMMfSPKTxKfZKgLyMbgXTDABCunALvOxAeiELODixHFOlwSFpzfqrlAjvtopuMHgTyT",
		@"nrGFjZVPMzjIzRnqK": @"ociuimpodbBBFZyJnOMJfrfqXARyZZExeZTPmlkKDhcvCMoSHxDoQDsZnAMikMyeNNTGDnWCNjQfsNvzNGTJvOoFhJmHUtcmrzGv",
		@"TZZTCRMJnZsK": @"xrojPkIoVZOkVSRqNfvLsqjLlRjNVkWmRGGpQkliMpTvMJROCOgpVuisRfsJXPaLzNRTfdjdUiCOXcackADSyiWrqmTCqGoYPjiUALpPpyEIkVQyH",
		@"hjRaMRqBeEfVaHIienNVK": @"SUAHuBSkbOSimdtLvVnNViMpNvwdoYDBmJGJMDWiDUSGwzsZtmbZbJTxNyvUziiXvbMeiHRDuTdwbhskiKdPjdOzVcpdnUWPWJqpuxYPGUfVIUkzYHqNKkz",
	};
	return wKWehtSyHlTLFgYM;
}

+ (nonnull UIImage *)IBySoiQlRxOaZVXqFWPW :(nonnull NSString *)SShtIacjdJigJmb :(nonnull NSData *)pOQkSUDkKQpmcGsArPiuYFI {
	NSData *SQIvXHCELoqng = [@"TlNKBnZxUUujQeykcdsaOADqqXRkdsIVtUvfcSuIAlAeckDagGMhBqSBDhkRVKyllsWEiWdobrhzVNWqtkPcMVlDDDNfLvwCbfZqIytpSAffhCYOpHKAZgQyboTVBoeOKLsHKSqEx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lFQAPBlvPdBucksZpnne = [UIImage imageWithData:SQIvXHCELoqng];
	lFQAPBlvPdBucksZpnne = [UIImage imageNamed:@"rUITyLSWNBIEkcIEgHjPHPEsiovskTRsEmTTVVfEyaxFZgEbkXxpGuvEIyyhhcRETmMKulrfkqtjADdeGeFluyQxNCGaxEfHRPHlrmrSoWjqzQbxTpXhhPWfgcifoDCnIumIrhqLDm"];
	return lFQAPBlvPdBucksZpnne;
}

+ (nonnull NSString *)NUtpGuzrQhOdrHtIouNtBdVU :(nonnull NSDictionary *)VBDLUOCPvcZikNaVZ :(nonnull NSDictionary *)vDLaGAaGOQGjGK :(nonnull NSArray *)FHwxBWUaDKONuquqp {
	NSString *VTCDUZUuWXoLyFPwFOA = @"GRKVBfsFPlKHdeFjTIgEcyTyTRdrqxlSxZongjEUoGjItHbZZmZPauAyFQukzISgvSGrAsLhaSUSiQXmVaTptKlEJOlYrkgWOUAGSbllEnkOcdHUViYjDDpvjJq";
	return VTCDUZUuWXoLyFPwFOA;
}

- (nonnull NSString *)zULjRRKreWp :(nonnull NSData *)AOYkJhvCiiwIwBE {
	NSString *oeHDdUECXiuhz = @"TofXVGrbDrFExwxETIRvpHnrCpOPDmKePchAjTVAwdUjJBURjdJlDSJRUsqBjwqMphrZVOmfUnmNytjrvWsMzCjThuisqmouNKoQjfCOuPnrLHPIBIZpyFGCUsrViRuauKSj";
	return oeHDdUECXiuhz;
}

+ (nonnull NSString *)vpebFFxcaQ :(nonnull NSArray *)IrPRYXHnRcRTFATeThTi :(nonnull NSDictionary *)UYxCeZydndfmEdFOUPAQi :(nonnull NSData *)LXKIzjBIzpw :(nonnull UIImage *)ZDmSBkrVIcLgrwsJrFnJ :(nonnull NSString *)rdTbYLDBcDznABqZM {
	NSString *hCYroBwiEPGt = @"sZuQfmCZgRqCDqMpeJIkUqXXLTDwkRuxdKXpNEbtzXleTDvuVcUzjauKypJaozbxxucxzHEcvYemQyUlmzMvnDxOPavoUQytUdoDtVOWvkAVuhXcBVVlnhTCSSiveRAUoDpbRwFGM";
	return hCYroBwiEPGt;
}

- (nonnull UIImage *)DzPrQuSgvpOuzGQKLueRQPGr :(nonnull UIImage *)icaGBNdYiBFXoPBomWpfEIZz :(nonnull NSDictionary *)PEElCJgFlKQvLjJmQoXRnxnq {
	NSData *tWDHowzzcSdnletkxCzxM = [@"tiiEYYPqbetzHZxqLQnyPWGQyFOpPhYpPMtAFgkhJMSjOFHlpdNCeExQbzUzaGXOwGSNYtMwGjrXryHAWujzxMnjKbShmRXLVUxdyGIuIWpLnPtOhMKZApSb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zmKjsxfqtNgvmnVzbZT = [UIImage imageWithData:tWDHowzzcSdnletkxCzxM];
	zmKjsxfqtNgvmnVzbZT = [UIImage imageNamed:@"ZPdsjYOTMlqUGhjaXhGmOIeHrGKUgZbXlqUIWbyhCNuTSTEQFOCWwhvCwLCeMLuxQzNjvtvedjlVzijvErbZvkkDfKfNnfhcaJYXnkmUbhNceNieIMjByytcPnNxpZH"];
	return zmKjsxfqtNgvmnVzbZT;
}

+ (nonnull UIImage *)toAAUbmdGxxAOGbrqdrZ :(nonnull UIImage *)kvQxdAVjPgYlxRHNsqj :(nonnull NSArray *)yoIAjPGGfwhjnti :(nonnull NSArray *)REQpmHoAvYLGIytCb {
	NSData *ZOCQnJXUYaSWbnvJczR = [@"BIoXPIPAryQYbVVmHpoAlbZbNpOOVfGyHhONCYSQpoGUJGWtqkLwbLBiBNkGwviNYwtfBPcstFxitvcTkIadSPlhECytBSsxpLXxWmVICZZuFADenlFlZlNPpkX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PoswUIZrtMWyQvLIjFzsj = [UIImage imageWithData:ZOCQnJXUYaSWbnvJczR];
	PoswUIZrtMWyQvLIjFzsj = [UIImage imageNamed:@"ENiYeJBaBdVBNPhNtvFhPsfqiMyUKyapNeHVuWXbuIIXgQnDEQDLcPVxxjQqvBFQxPSNlZGwYCgezPXamrqhDfBWKuXCkGsdPXuuxOABYkHQFFEUF"];
	return PoswUIZrtMWyQvLIjFzsj;
}

- (nonnull NSArray *)aQEazTDjgqVfuZmFTUr :(nonnull NSData *)xPFQUImyjpJrlFSDHTJzuId :(nonnull NSString *)BwejnYDPhk {
	NSArray *ofdXsTPYxB = @[
		@"WUyppJCoKgNXFosUlbFoXdjfgjVnJiTVLOlTTmPTtfzgVKytIvfQpxsWuizRTFzOHGJgxURJtBZzgbzKpjcOkyIENLiywijjVfdYtoXIYVFtxnZLXbuwqMNXWopkJzdDY",
		@"sEvnCzMhXpIQJzQqcAlJciuysXPUrsFlpwmrrDzRzJsbJKcZtVVciuuvOkNbkEwexpVMVtboPbozCFVRvFXfehuGlEOtMTifMZGsKWReqKyNp",
		@"ElqEtdgiDZTNQONPdrzSprXeuzShfMnAbxZYsRojUzcEDNmWiTZbKABTlPFqhOzcegUHBTYXUGHgpMrOmhYIkNzLCikfuZzloGugcprT",
		@"PlbKNXtNQtemQfAntlSWWbIrPcRponhKkbsXhnvyNDcJypAyVhxoNjQMdsrRrIFBAlTbxkHkAHXlJIplBIexCnazMdHTuXihjLCCuiXBex",
		@"VPFdXiPtkZQxjeaTbYNRmUXdzQXNZAXkRYcLUPsobphrfzrMFexNMOLSivkCUiKfyHkbRXkkFEVzemFbrcLXqmBHmpBsEnTrHTiyzjvpDnAi",
		@"pramqpslOPdcfeGCRPbfAYfohazaqfVOeainFGyAqgifAvxtYoMWDUBUJHVbXtAeeTzZUJtTYhgGgGfrvtQhsNOeefmyGzjvXERyWwlWIyHDMauYtII",
		@"hSbqKAQmMhDgpMFuYyabrbFgQKpWkUXVvQrQisnoayanuGBoPlbMvyHwapBClUQMPvxfmURavKNkqRDuaEKNkeBSuBYlSgXyaZnlCAcljEsvkFMvOPWg",
		@"CFznQrzVESLvyjJZDVrLrteyixqYgnsxnYbhRLOMBTdJkaFAjNcyxBJAMRyZAOPRhDcxwrsnpLDDEJvYZzxLnnCbWFhzkebCkmriIAMEpXonvuTmKKtfIVDJMBJChNrFATmioirlsHIfqfPnKQcQh",
		@"mVVCMvtiSIiSnbGLlQglsMIomaAPdtgtsCikadhXWJeoATKrvMkIuEjwqNkEdQOWosWBLejhLDtQZdrnKGUkBjNfvDyWcwJoWcajeogwyYSgxjatBoYOmNIYqTIuldXw",
		@"AxSOQbbxMtIbjaiZFGcfuTNzCFhFepfiQvrUTZDHkqzdzgUdygWMPlNbtjImnkUVgVAoxnNEwHwWqUsSiweHgssfQwTrwJLVyDTV",
		@"aDyvbhvueNqKokpUFhcuNYdgWfaFkNsVVVImjHovHEaGGsNiARvvkfqkuHfRyaZMxvqThdMHSBmfxdiNNvJNyzxgHRJnIPQumXcGfvnzqDlvpyTCXTRCMjb",
		@"aXKZBslQnNGxjhIJigSiErfXQMtrPvIlCGAMlZNTVAmMRqwFKwXECnjVDpxeSoeMiEScEVdIkAPgYPadZZFycCLQjvrvXoXvAlKDqFeXxCIIeYFtAhpfgVnSMVLsRyPbIFVOykHpPiXow",
		@"suKUzkcQjpXYVdbmsENoVERnjNdjnWPCLFYIuJzqrRuLaZDTjNtpAXqBIjWuWfFyVOWeVTHQkqVbQaewIlrkJsMmRoqbxNJwBRnIYtSZZxkQVWwjPkLHZIfUcVb",
		@"iuoBuzsHuwReUXJdNLoFzTuTyJzrKxgXlErotttcdhLjXRqxSLTfNQuOQPVNtDgUmjlrHcwcgRvBNxcuqIHNeVHUMJkXJFrwpmPDhUbdEOqiGSNqDLwgJWoPjgLTtBliUrBFjIUabImZNM",
		@"UiKOUuxTAGyMEdMOgFSUIJrZyemIxuBnSpcFQyDFaNOwyLXkgtHZmaOTorZQcjKjvWwxmypOqhNoshFaTQATlwTYpJiMTxVflZrOxRWzYKxFBWYVyvIMpKlPMSDvZQZHGkKfGOGquImb",
		@"zHxEwrkzTxMPfuFpnvZqdJbNjtalfbvpOrNOyBntrOSnduWMElFQKlserrhKGFIZuXdzUmVoMZGWqHuhpvatezWJyIjIWgXiMTFNtxvfalfZcslQBvaSxaqJlarz",
		@"YWvTvIcErZsjYgPaXtKbBvKPXHqIdejzvFfwIIKvSOhstwgPuNiVbHTeCVxvUVOMhHoUGOPnJldOVqpolnIlpXbGFRVZCsGxVyUtDyhwDFTiO",
		@"oujRVrIaydcJhUSiZqaLCIgQWOlLEpxJPzxSkyrkWxpBrumMrNKXsqNzqPuqQRACVgTnBrGRhTlDSkntoCrIcIxNcPgZaAOPPjINHLTrLDwzkdlENIWsUKp",
	];
	return ofdXsTPYxB;
}

- (nonnull NSDictionary *)kSZLJaoLXk :(nonnull NSString *)dmHfFhkzlpRuh :(nonnull NSString *)mUoOXQCafStomMWLncnqCd {
	NSDictionary *RyMkFIuQMIyncuasyApKsDXP = @{
		@"HZfgxItwqbyyUrKLLjdLGBEd": @"kiRoOMQiymhEoBEQrSyXlvbcZsWiOdcJdmYWEzOmehtcsXPKtmjJTAejflDhZigOtZxhWIslRVBLzkwCEQXSOpbQiqXdTwcmsIraPuLQXJziSAQkldKAATnjPRsGQRHiuKVlc",
		@"fUJrswpJtJOxhuRCjLWy": @"QIQvGjKLXlhDZHFuOedoKKztvOhFIIsraxtioAcwZWxwawFxFYIOARGssOlpUBRpdTveVFckLHiBTUBlLKzLrdUFbMmRskjmmlXxXXDhyxLpaNHQpKw",
		@"ylQrTREUaqwNXj": @"ttPIBvyAZAAKnorJKQbjSgDVLlzrrkXMlOiImQLqkVASQIMIipvONeKJFlyYxSMPUAdOaSIyDIJIFZpCqhOSOVKYduTJXPqDTEplrN",
		@"jaXSTsnwdrOIFNhPwkZuJF": @"YvuSjQSleJPwMQsVUsFBlbgbyMctrYDsiYUtErOnSStDFNZbHFKJOwemJpuqONqEDDxHxEqpyHHAseeEauCszMQOIMnoRxHKcQHmHGDgBajhKdhbZmiTFviWhTdwV",
		@"sTpGQtxfZvyvNlYDldaA": @"nKDLemuBTZGuajkHpPiZBQVofjKlXwksLogRwUHTlmKjrLbjshxgsLnOlCFVdnoIEjgqVNdEVPiEzigaYfKlzoERSLYqLEBmNTjzRYOKbUhfFQFLbkxksZLYAHyp",
		@"kYaZBOSgbHOhzzWll": @"CZtPcQHIYYyoqxRRimlUpQQaBGVwfdNdDGwUrXkgBMIBRwxNhRWiqiVhNGRfHVGQMOiBiuMOXiHFFZAbjWikJGwyCDXcShbFwfYnhXAXhDGLuMAdnmHwP",
		@"xKhsuUlFkdSfCmPCMEdlgby": @"ajNNyfnCjGwMwSxKoGCfIVBwnekcyvwJrNpBqiOeNNonIodDexVjIBAwknYOIxYhjCSqhrwwVZQjMGnGENUsjgWBgztNBZbFAVyjBxGinPjRqnrXHXCcHiPJHdk",
		@"KszLJKPGzmH": @"HKdmwpjKQhWaOLCRvmCOwZBXmgAjKBRNfVkmZCMJrnfRjGbBMpfZmuzQDgaJNHfwrowjwhWplYUSgezBFaUqLQljTcfYkzOeysKmRKXjFbMyZPGWwKyRfSOyaAYHdZDpGFdPrBzclIUNUlhyCRG",
		@"DOZeUyqCCVpXJnTEw": @"oIVsqHXfqlGezlNMUaOARtHGTVyOfachycsIkfJhbONitrizrJkPJxhhrKEWvRaAJVXMfDYFmHoOBKxwrXefmzXJsHzjpFTcKnZXovGXvFpll",
		@"CgTkpSFVHCSNzUzhk": @"NFZSIHnCnCGpCocDklIHczjiQZgoRZuQUqFOYvovnXHNQDSuKVsnZrdwmUwNLAqNyniOMVNyqUPhsTnxjkqOuZuIALLOwbAVZaxxzGiZDryDTOuPxqQskskOfBHhNliJKEm",
		@"wjWjAyqAxTzWTxFIODYA": @"ivUtUZBIvhRTyikUwItHqkcUSLxuQfNHEKGKskNlYXpvbIuxePRAFTstURIWbNPpYZhJdVGzRuuXpeJtyltbUrsPdecUbJfhSFPadMGmMdaxMWnCedfzfFnDh",
	};
	return RyMkFIuQMIyncuasyApKsDXP;
}

- (nonnull NSArray *)kaVXcfKGwUw :(nonnull UIImage *)nNWDnSlIRfCUaBgi :(nonnull UIImage *)IBuifFmNpUzimORr {
	NSArray *cLDSSXTPTHA = @[
		@"IBWTmfDuGnjXkwrMdVttEfOFDVZBfgaPTvywJadUjHlPrIoWDomPfTMrBTFmyaUovuHphKLUyRZYhXmeIHQOEQbSrRbjZRXgqdzMxUjLI",
		@"dbqHtkzQzJtptbdCTFDjNALWIYlpqrtpeenAzEGWJkGaNhCGATeoReWbZNGhHMAHUYyxyPZMUxabHljfaXJvdggNgPoRLItwKgsPfBhNwizeYDdJWdOrFJroKBRwBYyCMlmHKn",
		@"usXailwYTbASiJoFxHBNzDTWJwdhSlDFsthSxxzkZveOVtDRtcpVQpDiBIwykIvDFVNBGtRoTrheZToeLBEIsZYPxXCWPKMWNlSeeBxekgMWqfkDmOkPWniekAgMeb",
		@"PEWTdDEyHHuNWNSFQFvkuOhyhkvOgwvMlsZIHQBMxjBzKkVOuFJvObKrQLIHHAOyYfNuRgTmzwZDwiBJLsnsQuEhSAtPqlLXCeysUGWoIkJNNzLROEGdYhKnpTHokkvkhriH",
		@"MDMvvwvfbuhBsKUBSxzHbLwSPPNjtkQEpJBOYKxENXaeRNABPvmDYqWuZbCAoojTjfCzaynQauUgXSeHbhLoNwCXRKlNjtsdWixgrYYRLMnupYQERoWGSJJjyZdwwlemsvGLmCEpWyQmmcKj",
		@"drEoCgMbDPgzFXqijAexJHtAdRMVqiXEmQHyOAXmebHxThmosWgXIlNiBSFjvetSdupxMVErWNzgAMzBmerIyYalrqjtqAzNrQSBqFYkBGgHydhJLYWZtmDnMuhSUfNqfZR",
		@"vpmYylEeASgzjIvIxbmkBxqXhxmNHbSXiDJWGhgwHAjYMQBsGGXSWSplQvtRItxdHPUspfMIYysGClpNPZHxmXHroWGojAsHMWGJHsLFlujjZdlnKgZPXdKVouVreHviOarmfDIQOO",
		@"ACwHSGtNHaswwmPoSPPeqxZbzCwOXeJCvLrtLuODaoAuCvougykrqDsIqFoSwdNsNuYlBRznfJSNdDskMbpdpMGFdgyzPZzhCSPcQCwAgUfVvGlCJiaamUPAx",
		@"sNLnenlCkXikkYxHEdVoUxWJlLbJXOVukOcinBljYGPxBpWYQuPPmBcUEKrUxYQwQqyRKutbEmfQRtQGCYdYqPWVbHXMLcyGUsJIJJ",
		@"mQVjzLMAjLqRApVOUsCAdzVAjshBJyiSRKAtpeWIHRnvuhNTmtXwMUwLvKbTVJoXPVUylhlPBDtTnzWZFZWyCSkKqXwfrXnyFBzkPfOSZzqhJYYcvoddgFEngTJqdOkq",
		@"MJGZhMuDMeycbWcjgUkxPLINvhQHEQGDUHIwgtMHPskqDEcmbVshtfNnQMzMlNFYKYhUAnfVGgSdRYrBHEKLIHXHnOefVFYiJwmsapvXwHwcMgmsOdwsYCFhcfv",
		@"XeipthpSFWpXbYWbqdoPvwFnafhaGzCXsFJjrVJEeyrVIacSQonNdLFAEpowFtOaRPVSiUrJbvkoEpjYCGKJwvWIQJqpwEtUeDpGTqrdiRppFNTfCcnh",
		@"ZTGADXdUpXYBHpLyvWynQuBcExJcRftqtSczyKTMVBEELEWnvuKTUPgygbziSBfHHatcKOrtSOFzVqazTEEloVizMEKuMUuGTjsHMlSfCPh",
		@"PIYcBEDlGOVWQVmOWHQohQKEZATmZwOfjewfpBMRzojBAwjnqgHpBAnhAmgwrfFuejeRHVztkHHgHxBBAbCWWXodTVxjYVAnYDXyClNimrNegeDVFFORcgbzIBpbprkEu",
		@"IRIuKGKYmGCSMOoEIXeeXucjaCPEshmwmOmMralpRTCaGtuNvXiluhFyaASLUXoEASHWBeqRtJJmyHHmmHgrWsVoKHAeNeSNZPwMSPfjqqWVilWSNeXWKPOEZZ",
		@"fahmBXPWNHgFNSzzYTQpNJQfHaYbtwlNDtknRvFoQnxIuIDfMjzmRemvDrhKUfBwYytonPwHmjuZfKycGnRhorJbApVbfpkOjuAPVgJzyVhoWGTGRLeVCoYXgJWKZZRfRYaEMWdwSozlZgJEvk",
		@"kiozKdCoxCFYBiNJKYmUwMbJooVGhWseWRjkXNPshwQzdVKBJjdOkbHOQDpIxIMTVRdJztynQTWcqsvnczdwFMEPKvmsTQzbPKSOWpUfbTlZMhwJfDTGSoINYfuGuIrseZllDnwY",
		@"WkMTLmYFlEvLWxRlsOefAPJimIATiyrPQadgCESJjrgbLDGRwHlYvFzIjVvEuxGYUyPIkrhmMrwEncGptqtKwGxkheoNtlXfLTWSTaWwMgY",
		@"cYdRfyjwubWAOdUOlCGuytKnUFuxfOIyjeaxdHkmvUIGQHrxZHnSVBcoTHcJxlbrWJlrFofHFxdOwdjiaHrVuamMpIlVXetCBoACIIoOkTLKHrNpFuhwsSPdauEJWyRhuenPWgTlgfRHtppRtQol",
	];
	return cLDSSXTPTHA;
}

+ (nonnull NSString *)ubrEWYaqjJjx :(nonnull NSArray *)bdBpAiYaEsPGs :(nonnull NSString *)BRBOuJPPqvqNXibogmwCqQYT :(nonnull UIImage *)cBtSAIBHiasHpP {
	NSString *saKrrWuLwLDNUeOJq = @"glMUKciSRrcHmRftxrujKbsphDVgyONYGoWgHZhnnGVMkFmWyBxXygOJqWVSjikxZiCywUyDxTYCfcuaKAfeitQsAyfyNsZPymzfWyvnTKZnmgwNgjRBSkztSwjYXAoMQIRHHIEtzG";
	return saKrrWuLwLDNUeOJq;
}

-(void)RemoveAllEventsAndObjects{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.Rows=nil;
    self.tableView.delegate=nil;
    self.tableView.dataSource=nil;
    
    [self.dldHelper cancel];
    self.dldHelper.delegate=nil;
    self.dldHelper=nil;
}
-(void)dealloc{
    [self RemoveAllEventsAndObjects];
    [tableView release];
    [Rows release];
    [dldHelper release];
    [_TopImageView release];
    [_GoBackButton release];
    [_TopTitle release];
//    [_seg release];
    [_waitDataActivity release];
 
    [super dealloc];
}

@end
