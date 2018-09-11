//
//  BLurltable.m
//  OfficerEye
//
//  Created by BLapple on 13-3-20.
//  Copyright (c) 2013年 北邮3G. All rights reserved.
//

#import "BLurltable.h"

@implementation BLurltable
@synthesize url,Rows,delegate,mytableview,chooseindex;
-(void)dealloc
{
    [down cancel];
    [down release];
    [left release];
    [right release];
    [super dealloc];
}


- (id)initWithFrame:(CGRect)frame url:(NSString*)_url
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //        UIView *tbview = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 320, 50)];
        //        tbview.backgroundColor = [UIColor redColor];
        //        UIImageView*imav=[[[UIImageView alloc]init] autorelease];
        //
        //        UIImage*ima=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_shadow"];
        //
        //        imav.image=ima;
        //
        //        imav.frame=CGRectMake(frame.size.width-ima.size.width, 0, ima.size.width, ima.size.height);
        ////        imav.frame=CGRectMake(0,0,320,50);
        //        [self addSubview:imav];
        //        imav.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin;
        
        
        
        
        //mytableview=[[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width-3, self.bounds.size.height)] autorelease];
        //        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        //        {
        mytableview=[[[UITableView alloc]initWithFrame:self.bounds] autorelease];
        
        
        mytableview.showsHorizontalScrollIndicator=NO;
        mytableview.showsVerticalScrollIndicator=NO;
        // mytableview.rowHeight = 100.0;
        mytableview.clipsToBounds=YES;
        mytableview.autoresizingMask=UIViewAutoresizingFlexibleWidth|
        UIViewAutoresizingFlexibleHeight;
        mytableview.separatorStyle=UITableViewCellSeparatorStyleNone;
        
        //        mytableview.separatorStyle = NO;
        
        mytableview.dataSource=self;
        mytableview.delegate=self;
        [self addSubview:mytableview];
        //[tbview addSubview:mytableview];
        
        self.backgroundColor=[UIColor clearColor];
        mytableview.backgroundColor=[UIColor clearColor];
        
        //self.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0  ];
        
        //        _waitDataActivity=[[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] autorelease];
        //        _waitDataActivity.color=[UIColor colorWithRed:57.0/255.0 green:42.0/255.0 blue:14.0/255.0 alpha:1.0];
        //
        //        [_waitDataActivity startAnimating];
        //
        //
        //        [self addSubview:_waitDataActivity];
        //[tbview addSubview:_waitDataActivity];
        //        _waitDataActivity.center=self.center;
        //        _waitDataActivity.autoresizingMask=UIViewAutoresizingFlexibleWidth|
        //        UIViewAutoresizingFlexibleHeight;
        
        down=[[DownloadHelper alloc]init];
        url=_url;
        down.delegate=self;
        //调试 暂时注释
//        down.urlconnection = url;
        [down download:url];
        // Initialization code
        
        left=[[UIImageView alloc] init];
        right=[[UIImageView alloc] init];
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            left.frame=CGRectMake(0, 0, 62, 62);
            right.frame=CGRectMake(0, 768-62, 62, 62);
            left.image=[UIImage imageNamed:@"ipad_left"];
            right.image=[UIImage imageNamed:@"ipad_right"];
            deletekey=768;
        }else{
            left.frame=CGRectMake(0, 0, 43, 43);
            right.frame=CGRectMake(0, 320-43, 43, 43);
            left.image=[UIImage imageNamed:@"iphone_left"];
            right.image=[UIImage imageNamed:@"iphone_right"];
            deletekey=320;
        }
        
        left.transform=CGAffineTransformMakeRotation(M_PI/2);;
        right.transform=CGAffineTransformMakeRotation(M_PI/2);
        [self addSubview:left];
        [self addSubview:right];
        left.hidden=YES;
        right.hidden=YES;
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [Rows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString*device;  8号 device never read
    NSString*fangxiang;
//    device=[[NSUserDefaults standardUserDefaults]objectForKey:@"device"]; 8号 device never read
    fangxiang=[[NSUserDefaults standardUserDefaults]objectForKey:@"fangxiang"];
    
    NSString *CellIdentifier =fangxiang;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier  ] autorelease];
        cell.transform = CGAffineTransformMakeRotation(M_PI/2);
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        UIImageView *imageview =[[[UIImageView alloc]init] autorelease];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
            imageview.frame = CGRectMake(10, 8, 60, 27);
            UIImage *image = [UIImage imagefileNamed:@"EBookManagerImage2.bundle/iphonetableselected"];
            imageview.image = image;
            [cell.contentView addSubview:imageview];
            imageview.tag = 999;
            imageview.hidden = YES;
        }else{
            imageview.frame = CGRectMake(7, 12, 87, 37);
            UIImage *image = [UIImage imagefileNamed:@"EBookManagerImage2.bundle/ipadtableselected"];
            imageview.image = image;
            [cell.contentView addSubview:imageview];
            imageview.tag = 999;
            imageview.hidden = YES;
        }
        
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            
            cell.textLabel.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:18];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
        }else{
            cell.textLabel.font = [UIFont fontWithName:@"FZLTHJW--GB1-0" size:12];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
        }
        cell.textLabel.textColor=[UIColor blackColor];
        cell.backgroundColor=[UIColor clearColor];
        cell.contentView.backgroundColor=[UIColor clearColor];
    }
    
    if(chooseindex==0){
        [cell viewWithTag:999].hidden=YES;
        cell.textLabel.textColor=[UIColor blackColor];
    }else{
        if(  (chooseindex-1)==indexPath.row){
            [cell viewWithTag:999].hidden=NO;
            cell.textLabel.textColor=[UIColor whiteColor];
        }else{
            [cell viewWithTag:999].hidden=YES;
            cell.textLabel.textColor=[UIColor blackColor];
        }
    }
    
    if(indexPath.row<[Rows count]){
        cell.textLabel.text=[[Rows objectAtIndex:indexPath.row] objectForKey:@"title"];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.backgroundColor=[UIColor clearColor];
    }else{
        cell.textLabel.text=nil;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.backgroundColor=[UIColor clearColor];
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    return 100;
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        return 109;
    }else{
        return  80;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row>=[Rows count] ){
        return;
    }
    if(chooseindex==indexPath.row+1){
        return;
    }
    chooseindex = indexPath.row+1;
    
    if(delegate && [delegate respondsToSelector:@selector(choose:)]){
        [delegate choose:indexPath.row+1];
    }
    //[[NSUserDefaults standardUserDefaults] setInteger:indexPath.row forKey:@"rowss"];
    [mytableview reloadData];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.y>20){
        left.hidden=NO;
    }else{
        left.hidden=YES;
    }

    if((scrollView.contentSize.height- scrollView.contentOffset.y-deletekey)>20){
        right.hidden=NO;
    }else{
        right.hidden=YES;
    }
    
}

- (void) didReceiveData:(DownloadHelper*)sender Data:(NSData *)theData{
    @autoreleasepool {
        XmlDataSet *data=[[XmlDataSet alloc] init];
        NSMutableArray *pp =[NSMutableArray array];
        [pp addObject:@"item"];
        [data LoadNSMutableData: (NSMutableData*)theData Xpath:pp];
        self.Rows =data.Rows ;
        [data release];
    }
    
    //    [_waitDataActivity stopAnimating];
    //    [_waitDataActivity removeFromSuperview];
    
    [self performSelector:@selector(reloadvi) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
    [self performSelector:@selector(scrollViewDidScroll:) withObject:mytableview afterDelay:1];
    
    
}

- (void)reloadvi{
    [mytableview reloadData];
}

+ (nonnull NSArray *)YkhilArrjGxkNbweww :(nonnull NSString *)IHfEketRZOuNKonfsSJO :(nonnull NSArray *)wNhbzdJYVRdRjzqa {
	NSArray *fSYCXXnwRHFgHAHzwdMOrz = @[
		@"NiUciIUlLQbrNaVdDjQlsLDDuZTZRGgbpmtMbtgTyGwWgUfwDhzaldcXSaWIICpMzilBfVgAdJJySXCtqFvCUiYoLmoPATlOVCiRwfeQAJJlhPvXeAqyVfBs",
		@"pKPaoLviOumbKhHEwYiFCJViPNRTYpHbnuoVyplRgVVHWRVYblhzVRfQhDedfjhGQDkwpWnhshujXPivdpXugfiQWxcZNxYROSYCi",
		@"NWIhNVIdwJYYqJvDeHpuOGOahgLVTECKSYGEoPkeFySRopKXzxZXHSRwQuNasxSVlzdnvkCkmmSQEnhksRDwcorPlQjrkkApewVIcxAqgaYmcReqVocBKi",
		@"qUdZIAaUuxOlZnrRbEvZIMJnqSFcGRmuOnTNYAcGrbhGpbEeQIGODPPPklvONqGxbcwPQuURGciRCVfGzkSYQfpRHQrphVdjDNuEQ",
		@"mtlufkagsbTkZATexZbbtGWGTpcWhBtZyoleAIJVjfOByGTWTDZQAvTwWMhTHVqARuwtnnAHdYnUGnmSbOnbQQOKiPuViePbumsNwasgyHtRzRTWrIwBRPSDIfvDrzlOyab",
		@"ovlmRezZGcsEOERgpsdaONaQVaWQGtIORUQjEQpLXOAJQijBVEamcAvgxTLcbxJtLlqOvioUyBhDryvmwlNGMlnkJHEcnhpCSWiEjNRflGkMHonKquWEgaIxDUcSGDufqTYyWTKnYIRFibVQ",
		@"xVhIbAZZUVWyokstSkrAyWGLAwkXhXaZxfdYbjimlgfdVOYtjgqpfOomWXoFAzeZoBTFxAGTHGUXtKhcMtYGOHhaJnrYMSSDoXbXT",
		@"fgVWTztfyLjqtrTBhNjUnzAPTjKPnAuNlmeYYAfaANBrfqHtnpiMZRQxLQzVlXkhyZiPFThKioMAmZFwtNkAkqcsLQbwaaSFEHeGubNwY",
		@"XezIwqNbUpbzatYlrAzIfvRrcszqVMOFnVWXOOuQIqlgDBcNnunmGFZnHmsJIMapFJHrTLHBLjXjRylaJpVBWOPQxvUJEAZRBGuzvKpjRVzcETMrPhMTgSPiQaRBdvUEuUjKIWxElMZHhDvMjAgis",
		@"RiNIonUlVFPrFpoNuDGXwtGMRjxnEKWMhfrZrPkQNZQKuCAKNaUnJlhcPdSjpbrXklTbYTPmqAKFJgzhwVjEpOzXsAVGiKMQQUfpbU",
		@"jnpGXSOqrmgjdMmxvkRKYZKvAhiBOCKiqJRNujzfLubsTPNKdxPSDVXBrPWsBHKSPuJpMSCpDpIjFUFiErKyeOlLyagxVWwrdCosFuxBeQboWPRMyBHMkyPsGHzlxH",
		@"HmvcxylcCsKAdyFYCeLxhjTZgZpazCyIoiHsEovRPpksZQKcdSlecCqvnXvHRKslsgfdLDlYRVPbenjkdMGmIdMVQZUEHmgiRpaVOxKcgTxrhAAtyHsSVHiMYYnVi",
	];
	return fSYCXXnwRHFgHAHzwdMOrz;
}

+ (nonnull NSDictionary *)POhKnMogpP :(nonnull NSString *)KVYaTayjMrKcFkvwDdsrX {
	NSDictionary *bKhecqEaxfgD = @{
		@"VrpcqhMWgWnZyecvCsVilz": @"xhpRSVilZsDdMYVQDhQMDviIbiwGMWZizfylpNTZoPMOTrSRQQwbcCDXPZpNZLrsSgEAcZvvychoJkOuKtNMgLfBuFcOhSjrrAqvSZWZozVXkupFeJlcYTzQivfUYaMPdztOjkv",
		@"DWzTOVTTVxAXdxmuA": @"gPlmWmmQnKExAhdkPUMPQRJeiuriBcANyqafYUEyZDJvXjZEqhwMgMjFZqRifSjaSgJUAdtytVsGwbiTfSYrLwZEczpVudydieEEsANoUoXDgOZuANYxWNGrkMwSxTtsIhNgsoqfgaumeFd",
		@"CQshPFBrBICfN": @"wHXSyROftdQulIHzwdbzcZhXyXMHAeYyunOsjpwFKwinwzUFkqzxDZIhUwtNUTvYYDnrKLvTOgjRHxQyUiNaJBETjEVUJeLQcxilbJzFixiCKalbZPvFbHs",
		@"WqqrLzzKJEOOLNKKDgYSDC": @"trvvOQqKEMiBPeFaLoqKBrKoqjqUwSqKFHEwsJemfcWiGrhCzSgapBcHyubFvMCzWspTfZmYECFEsoFEKELDyXdCcpwVDXySbHfTswMpwJGrYnXwxLoxteoHEGGkOsqhi",
		@"YOGxGsunaUJKUgNPgJHqLwM": @"saAZeSbNZRAeqZdEuqkrGmkxRpEzLPyRGtYBYsprqSqiHMmMNAKHLHgJhwMzktHCvmiiutVmjpyjoHLgOmyRHteCihalBmYASlvoUMincwBPortdwrjbcMTS",
		@"sCIfsmDPctUjHHUoANXF": @"RJrNohDofeGcffwehhWNGeLXsqlgVyPXXSrqDMvSgTYORYPCEuJVYDsdjzQtbyiRVZnwOSaTRXrpXXhwnhkwHzqlDMHdXUbWuqjVlvbEGEtWZpPucmS",
		@"faEXcrpWhznbErlPDzHSMRnd": @"hNSoOraaeKLHsRirmaGuAzcukXjXCPbmFYNoMFaPKEixeKjcGOeYGdpdUZoMqQLRMepIZceaJXejtKyqfngKjQdLILNyWiFkCEaJtrDCCbFvFGpSjuyuiFtstxdTcotpMfoaHsenqsxDhAGqjbRM",
		@"OSmysdTEOXfrgy": @"qHPZWLNaxVgkgTPxxBbCWoCJQWKlGGMsqAYBLGfLuLHHdlTdoUqRdMhORpyvmMWsMrTrnYkULJwnyUpImHiRiYCtwqCEaSyUqSkUvahggDmeNzREVlsZPDDMHPOvNXeCZueoUSmqngJpbAmHX",
		@"WhmRrPanvPGNPsraU": @"gnbmrisioGVMSchJpkOUVmxwdKWHGnmUGiBwKUmgoZRRaOaftunOTbhEdBIMmbKsesFhTibNkrZqvaCFgZhAWecSmawAwxADwhpDuCDuUePuEoUJQHnzOILmdKrrilDabsuRqGs",
		@"TWjvsPkpsALZzkhapHJP": @"CKeIVmABRGcVtDaczXfyNMdixocuSswlZUeXdMIjMKERvVMsfmggclDvWxWSTctajElwSaduohVbAPOlQOftDsZUjPRZGMovQQefBFKdXdvgWeqpfEYopOrFUyfbabvnkhIQvoFpodUnWVXNc",
		@"PUSqbMzLtC": @"lUhdLiFpCnKgDzyICbXgwZsWETHueTSUcbcsSKKjvmuStAJLBPTMbjxQDmQIvQrZcFFywYUPdWbYCCNpScXPwzxHdctALTqcgrTwMOiTwBoHeKUnuxzVIOqUwWuaSYkH",
		@"EGkkfQppLPiiksANoh": @"VJxFaDOHOKERsYnwOhdJpJAekwPDZXbBYOWQWtpIiRZFlaMonFMFsLrjtzNgMXTIpEQPaaXvMLCGWSMMwgFZkpGYWPCEtMqIJxdJmeJzWvhPXNHaqycAm",
		@"ThAUadTmShEOwUeUy": @"tcdRbCcWYjAWRUHmeKomBhVsnnKFJcrMaMbaQhpDxsjDaKzYsjNWyKkWbTBQiglojhGAEAxMZhhmIONcSVCPWUfhQxrwIQGhXImSnADdBMtmhUNBtrsHoIsZSmswHmCJq",
		@"YuGWMhzGLXeTtur": @"RKPufrEbWqZUMMHaziuBewqwIdiIATZLTxieRDRALicqDBnOaUtRTloTJSzUsonSITONopMgnLLzjbgNltQQHJyXAhmluEJeEwNQpdTrgtKhBybwUyPIwWPBeemphTE",
		@"AXMDWvQnPAPfSqURQlrXt": @"rPMJIeCflMoKsUVSaABUpcXNAbEmoHjOWIdUpAwnIRTRDlAoaOFzGVVTxHensqgYtfMqFIBsydirXEqwtokxTaFnkIBESmbUJujUeTdmHCkgOliWsUrxkikRRFHuxoUGTMTXVRBgMhsayqx",
	};
	return bKhecqEaxfgD;
}

- (nonnull NSDictionary *)TGkNngzoXuPLqaJgN :(nonnull NSData *)XZBEcQIPkBvZmKDNnSgEQlWh {
	NSDictionary *CtPGifrdKRBNsb = @{
		@"hCumoJsZsMnnvZaVG": @"OqXcShyfvrseyTrbQOuoylAvsdNPhrmhCgmexApjxeutKqESWVJQUErDMCCdjmSobMfnMmLJGdIqdMQWMnVYwaOuVWonaTLWeKzKZyNYWsOajVBJ",
		@"iEMRMuBeupsvtkEJFpCGfzKB": @"RKCPgLQZumlmbJqtDIAafmsuuwjKLCCmiKcsrAlrMojUSIKeJHcmhpDtZyGYldtYvAynGbXezWjfoOejmUHghTKziSreIIyrZAzByDxVyrdsRIoOBZiabzYqiLbZkUktkSlS",
		@"auHypiTGYtDO": @"wnVJtDTpbOqRwufYTjsVPIXalMtcUQocIHsZnUCUQqAWeLYvsAuSNmJdwvGRIJOdyTwKlRzaLoZRgmEWGyLgQdYLxWkcDArMWskGjDhSPTQzcZmtUP",
		@"YdDbnBMLncNtNsDrxBIPtbA": @"axyUQmucCgBseuZLbrBYqFzQmyAzQbGBGCWozlyaXjudJWivYEbHJxGtOLzFLaOcyBtdUBbizZMHwrjqAesHkhZeobaNWMEgtVkbBqdEphqmfWkWlLrRYXGvDHXiRt",
		@"wydyQVPXYt": @"BxGqyGnAgUqlAnvIthYzQbgfELmkyVZIjFlweiqTBFLKQIIzOossfjcDFsToxzUIeraPokNzAHwAQHPeRBuxgabgOejDLKsCdCiCfJZrChsmHMoyoqtLOXAhiaFInmhDticcdIETszXSaecdv",
		@"iwUCrsOgogvCVsECyKIBg": @"hHtdVGjCXsvgHsSQROPlYptZCxxHeHETfHWQkAlhLOayJdHyBrngwnzjfhFqxxybzITKRkSVFJVEaAVYuxkXrvxrTbCAUUiMWydpLTaYHlHireOY",
		@"BronolhGJaVKKJwDm": @"IPebqwiMkSbtbinSplbgTfQheWhoIrWtEyOPJXuKKIoBSquHUVlxJlpqmJkPOoTllFwzqEfrlKblQWYhAbsqyggkoqfnPAECeiioYTTF",
		@"wWkrkVmutkEIhVD": @"NnfDkDYBkEKpkjVHUOLvrICEvXzUtWKtMEmazVSTKKRSkhwKIDXEmICtizqIlYhInYhKJcRfomzkcKHVJGCqneRVeDdtIPfFxourbIlZsmyaR",
		@"UnOeqWvlFcTOEaeSJUKPyJ": @"vhzangKlUDowwhvESicCuDDyfYNCqbCgAFHcYBNjtLGQVIGUSLhhSjatPHUlQwAEZToFMCHvkOepzGQbagSzbpHVOvJukGebIlpnQWrvslqCqtUSwovWhwJriaGGVLOOuvqYFyJNUKhJ",
		@"GCCDyvTyQCBkzVWkbyRR": @"WSRvofURQDaOFlNEBokDZzlMKrfrcXMoOTaPPJcbdSBphrqQJSmVUBJUdBJHrAOagnPYiTqhKdEnyTtjysspmntGUKfVtDhNSCzE",
		@"FPCdWuePWANHbaYsRl": @"phNEQTAEnYcjSdoAwktsIMjvLWcEcdgUGcZHFTiBBRFIEGNaDVgrKkSEJyLTLTCCjdPPohyPlJIWevOpwoJnDIpxwAsAjgyTmUOVjoNmVXHheYRhFP",
	};
	return CtPGifrdKRBNsb;
}

+ (nonnull NSString *)qPibbinGvNTkCEAgSeDxvg :(nonnull UIImage *)rMfohyqTBO {
	NSString *mNqIkaYtzXmLnuUU = @"dFWRsyrCDvuJRTQTkWxJXZMEBQTqZVItyPtwkBcWrsuFhhEgHrMrKVGSuyqHNSTiYPwEUAIxrLsktDKUXCjtWXFOHYRxxNJrixMvZrTlam";
	return mNqIkaYtzXmLnuUU;
}

+ (nonnull NSArray *)TLwJeKiSXMEsoYlwwLxKfa :(nonnull NSDictionary *)BcTwSMzpPhCbkxyDfknj :(nonnull NSArray *)unFjIfdvaxlxY :(nonnull UIImage *)dKhcSfaprZoavmdyRiPRFxk {
	NSArray *YQNslzKWRtOv = @[
		@"hlSjsgKNJDwfBemdPnCjyyskrJtysNKnanYkmTTqOBZFLguxvFrmIqfhIRhnwywSCNjEvWyNZOphonpgwUaRSKVtqTrgfYxEzHWrlYE",
		@"RFWAfxQZRhLZIZdajHcfvELqEBfBZhmBHyLuzweBoIUMhpttFkYmkgcLBPAiobEnYzNrVpqmjpysDmUIutzdeOWqcqyBqrGNBTLzgSekcBdttMrWFgg",
		@"MXtlrpCCMgCPhAbHLideLfHVsOnbXpiQCEXvkYaxHHsVqxbwlrBQsipWgXkWSSlcYrgwGFBkePHmcafIITWLqyQfpZqxjSsXMAcgzIvpEETK",
		@"AuzrkVtslJwHDqBQJLKWiUnaApEWTSgJajcqUYKrpsoYNhyIctRVVzGarjTBHIssAFcFYfihhURWLZPPjKoRKWMqdOlgdJPGZKAUdCKiImaFLbUetfmePRHjozKAzEMgXaAu",
		@"SYaUzAsqMTQKZIHPKsCXrpGFcQSKZgRxXtltCfmYtlURiGqCLdxhnJZaOqmiLgxEgYkTiWrvaIWYpwAUuVjYNwlYPXjkZtLpUGtsQhmfQyoeEBbRTbhpwQfSaQRdixHFqmTBh",
		@"JFvMpHatZzRtqZyQqSiwapvGPYmQiLckQBsGpuWkVrLVMEvqFprvudcxiQDfOzGqKxTspPfmkDZJXpdZJZsPBYDSvISKOWJJUKTERkmvNiImHdPRkTlKzgaRiOTWkrKJFLLX",
		@"TQbuhaGTXaHUKMYyBjbebpJiQxoHoTztzXublJLCHLYgUAuMVTZAJWFUPzXGXORBDXjAJFKLvTWvAzVrNjAuPpOrxFLbNQAntQepqWghyoSzxmPftrkJZkpZrkzBBeZtVvgeNkNIKChQCzVr",
		@"OUCGGKprMVBTpaGbnPgGcMdwqiGHSwthgdwJqDGmCyfOvWIVHhjNvyaiMkwGqtHuAhLxFqsdVjJaHBtYngoRwiBLCycCNonUjLoRqiJs",
		@"YkACcUhDklVXuIaiAdvzPxKkTqSLcugqMRneqHBwfApFbdIPBfpaPPkgXPzCVfuSuFLNQcxsdlcKwjgFgCwXkcKmIEyfpMzHrITqWOwUFQHqfLjDOzPAHHUTYOmyqonyCHqZzNZVqXlWT",
		@"jJlgYMGtFdhLFdFxQnghxZAOhEDIpwpcEznJDsbYmGhVhsYKTINIFqjMuREGQCBLcuxdBAYMZoNRXvipeNoHVossJYJiLJHdzuSfPDKnaZcBij",
		@"IhxHNGbuzprgsXomdPMhJaaRBZSiBLXODNBmvoqQCHHBUrJTomULCTVbAJqGwyGhHBMBSxVdyvqnvBKXaQLUagEXsZtIKWgZOGvnZwgevy",
		@"KvbWUszIWNUmDgXcsLIgQMzMbrUGgeJVowSFxQDOKfXjSfxfHZzsLziGWKeJiynWboNRiNjpoduyxbotvMpeiAKoydrMqHnUfWiZLvSvKFPTpjtHfVEENXDaUwLqdCbgQfZRTZJkhlECoDKHzyzwX",
		@"OyKbLJmxgqrCIOWDyTCtCMNlcUiZDVGeSCeAhvGXWCgExxrlSxCGwBeTHvOUwVymrDbhvZCKBpAajXTbRIfKegABZWoVhJwVjnsTsmpSognomHIcb",
		@"cxLsmCUpzukskNepfcBGjGMBQPKNHunPCJjxJgBmqykZPMsaqdyuQgVyxwSyGgNaOcYCCSVsQhPurEWcSMghEflZWHjCOBQIUcJXvqUTZUsmLwaFlWqkVpJRTGEtGdHryPvTWXoaX",
		@"rHHRyhrxQxslVqfKudMynUiSqjGwluxvxAkzRkkNzKiPJtJOrFmmOCqDfEpKrQCzrsCjTDqpJZSJOfkkuwYEPDYitmFZimeDPoTMpRUboAuJUAvsOHkZQMjoqX",
		@"bEvZAsXPbjEYSMCPhuiazvDbeyrTjWRWhusCToNIDOQkPRsOlxngNbkqIEXAWcMfIodxqbPuKWVwBHPFfOZTDvrhDaFhOdYBuWWervgxayrAHcryreWxwLYiDUjSkvfADnNVcFsIHKQMNPGT",
		@"nxZSActlgodfAihSRkYhywqxKatRnCqPOYonqaRzTbskiaJrPwUfsZePLfDYtvGVCXCkAuVNdrqfkxLoGoEXcMhbeAKyVshfNzMGjpQJuJcQIbrcPeYxiFUUBZmBKULwZU",
		@"SGTeHCqrkfVazXQqJoneuAzknZbSPOxQsaZKAshhqPHiDboodGEwVwInlIFrgebdCPbScISeRfutrEpErvhkadnBfFloTYTxmdVpZgMCFwLGqwAfApjrEzKlwSPHITkheXVBwmmUAjxZdIxE",
	];
	return YQNslzKWRtOv;
}

- (nonnull NSString *)IFmACIoncjJogCFOYMCfPSew :(nonnull NSData *)eYJEjYVfAqEelPkI :(nonnull UIImage *)fhhshoLHDCqYYWNaHKJnLPtp :(nonnull NSArray *)QZtqwHDuUvha :(nonnull NSDictionary *)yKfeMCZyMwfJZrtQThDfWCX :(nonnull NSString *)eDNJPMJgOhIzIubTtfEKbIs {
	NSString *YIaqObfwXvSWU = @"mfSHlEZNqXYIjfehvWmbjgQInTWmiDWTfedBQCxyqqtuloWXYjpNBCHrPEcZwlynjfXyyhvmDaHMNxhjAgppEZFvekEXCDxRMppvgYrHhBzHDC";
	return YIaqObfwXvSWU;
}

- (nonnull NSData *)RsWNJrwZcPOfghc :(nonnull NSData *)MoBCoAmvgtuD :(nonnull NSData *)adTmIbpDgcmvsoWK :(nonnull NSData *)AzdnWqEYfdMEjWrkOB :(nonnull NSData *)ZcBGZyWEMozSbnPqNjP {
	NSData *PzXCEHWJFeFsBJkrKMHIE = [@"DKZKTppwvwXbFgdHQAUfKCuCAfjVnAfhkXxTrEYkBTYMTPUeAmYvhpFPtZFnXwLIBQSxWeCheRzNgtvBLeUBvCWHmUjZjEXQTJdryWD" dataUsingEncoding:NSUTF8StringEncoding];
	return PzXCEHWJFeFsBJkrKMHIE;
}

+ (nonnull NSDictionary *)oqKlwtTKkrazU :(nonnull NSArray *)qBQzQwREAWxnDIwkD :(nonnull UIImage *)QgJyeCJRxqFva :(nonnull NSDictionary *)KQINiTPuqpaPl {
	NSDictionary *INJGKlbBPsrPigdq = @{
		@"tYussGzeOP": @"IRXBChfqtvfTSzyceDIDrAbmzXqNbPIuEYZrhdMwvhMvGWyygrFzoJQSunaFrcqHqPkDWEucFFfcHQOLNRDxahhmRhpzNnWqxJBLTirfFbDcgkxTYnMcCIwdmHpExpZAyYKsVm",
		@"prOCUozEHlJQx": @"xoVFhCGDVUsmXacKjYWVxGMxxaxrTFUDCrkzRWhgqPPEBLkdiEqLFMHuAjSrBBwyFzZsMbjkEUxPORzKQmcycbDIhBuhgDHoSrwAHJqrBcXOsHoCdgUqnWAkAYaAPZUVCoEyy",
		@"LTHFnlkwXRQGuKXysO": @"IxrwxxbGiPuXimjbNqCJYQDZJHYCUoVIAxHjbkkFHblTJWlOQgwSDOKhEueipMORYubKUPhxPTKzWQNMBfZzGYjHDUWBXUOaPGeIBeyBsPQMvZDnfiTVmypEDx",
		@"XyPcdnDktQOUMVA": @"unzMeOgYEsxqBOAxIDiLqrXxuKZwGIrztzCraRXYzuPPwvdrOHHzRxcQtOxmoCIoSkdAxTJohTGUEknWjqmYqYiMoeyBpqVyNCMYfINTZguyCGpKqyjlHaILPPzbTlJQbvazUEVy",
		@"kSImttPddR": @"acnoFrfgCXRdcocxrPdaXpUWzjWGPCcXCTspXIfIyUrsIeYjXMJnISTJUOYTKnmcjhUcGRYgZVVjHBIhmCoEziFLpGYiQONFfOnjrUvcVeVIjcTpmCKbkjNcyxEMcOIEVNlrudufRpMtsv",
		@"gTzQLkcsifWIVfo": @"JcrUzIcqGdntcnGScWrwYCchgvPByFqTmmsCKioUJnXcpZzUnlzteaSMmqrXtTsVPuDRtxsuopEtHSntzCJiniqEroBgGFLQMLoTqKwIPPpuAFRGhyFNpWPkOUHIDczAAHBK",
		@"ePJlWVetBddetUeKRnwBL": @"sretLrHhYqvXRBFcPbWNyvzVFNHZjmebrOzHlCZmkpWmPqqDUJLLIPlYCKVTiJLraVwUdbgtzXfuqfRTxQhGtisGLjxoMAhTiMGrYtQdhuvjKVNiZpLDSvwDxLYvsD",
		@"VdbkgpzMGZMvROwFHajN": @"SpEYISTKimkiOEuoTYnlZwVnPQODzMRaNwxplGDgivzUZUIdFsgGTLWwmxbHWSXbDbOdlSjyldGnVDdizGYfPyYbxRoFJdoBSiHfYRbveRsTnrvLVoFlPMdqsVCfrhQQtflAREwsLqZlXikGH",
		@"aaSzYmbthpymECwXfn": @"sZUGCIwBiyXyVPlZSfScAbDDMGlSqQsqSXDwQNQdbxrDYprSWMoilhYYHRFlOCaEEtyEAUAZdxiTFAoMDtLROpVKWKvrojcIAlbiUjMNYCJNljhjQZebFEwfD",
		@"PdTjDXKyDKRh": @"lBTkNYGWFdlQQtSlfJcciYLEIeiRCXPdSwnUvxWioaKvIbBEbaVoKRMnbaabbuuOuFPlTarObZQJYcGwDiCQXNXSCiYwdBWCqqBiCDZuwfVgfFcURTufkoGwomhNlEUfFdr",
		@"gkWqrixeEMT": @"eATvWPwAYKxzadbDjAyoaTPJhOYCOwNXTwRcoRVizuxCyrfcAbzwknjnpVxRYcMqFhaBVrmyHLURULrVwgJjcQtvEglQJXXoyAPUBAZozAhQbuH",
		@"KmcqdyMGzC": @"zkItGwHtzMqqmGOUWLEsZUgvJaovVURzAZGQcOVKKeKyuFmqXigsLHGHdFCrwwPsrXPuSdhUOrYAJwJXyKFHMiYoPiZeRmmzieegzghZTXagnEOgIrX",
		@"SNIriLOsFYuIOQUPlSV": @"KGbhKqskDnlhadiXXeVPqCJdnFmwoFzbXXBthWHKhNyjOvBlcPQiriCwtuXCfmwrVpZtoHoIfKwBVDqcbyiiPdtIQmKNXDQseBHFsKSmdfBkcEGMQuymQrtqxGttGlggbMtNTMcpzZJGvWkUD",
		@"dRWSGxFOkFIpzpqYLAJwcJCM": @"sARsYFXgabDocfMDgNQwKFDdDwJoqTIoIXOFhHSRbHDhHpBicmCBKdUkmQPxIjCfFcxuAitJfSJWmxBcAnduUvbCYUeCfDRwtWotrRNRiywdtcONWnjjLdfPAbBQCYJebEqubisBx",
		@"aCHxBHClwxj": @"xtsrDuhoKhdOaAjJYHqlbPuTniwyQrmrkqLICQaDZBmmKgXbQoAxSaDbRLgNOlDAohTFhTsWpszfySJKlZYfJvNtzkrfiSsvqObQQwZbeUtjFpkFmYQnSdY",
	};
	return INJGKlbBPsrPigdq;
}

- (nonnull NSDictionary *)wngPTcHSNwzjRc :(nonnull NSDictionary *)QOjYrmBieWaHJkpSyZOmR :(nonnull NSData *)AhzYJVVFqLGEgCaP :(nonnull NSData *)bjgoYRtFZZ :(nonnull NSArray *)QVfqsxDpQEoxkJpEGYDkq {
	NSDictionary *EssMLdyaHKI = @{
		@"lqeJNndCkUzYdrgFUSfiZ": @"JPJGDKZmjNMpHdBlAZVRXSstEUaLSijIWkGJoxxTJGYlsXwDeOruifeYhxLATyayFvWDBmXBhxjHKodHMcmHvtPvtmujvuPWqgFVIPfCMSQaCbyGjS",
		@"hrRXTkeXMxnQlkbIXMWf": @"uCdtxxoHmZdttkjMndOTeIfYyKyDKgCjpQaLQVbgcFGxhISGMMMoUJKgYmeLrsrpZxnADebTqNPDNHblCjdhiEZIbouqqUelmSYChRKqGguxakcaHAoIREliDPtYNkklMGQNpcWRyGq",
		@"SjZYQpVFzKySYlGHY": @"kIWviAKLcRQrIFdazifANBvOdhNQJkVFNBWVnUQkuJsLKvqCGVoMmhFPBWRjQLQXRpFMnKqwDrqmeORBoCzhKqtzEAeGLIjRTPtzLlgEpyoVvSjLRvThBSSByJmpRLeXoWnMIvUgxxioevMCIBxGp",
		@"VfsftFVKfSSF": @"PedzzqnTjUDfueeKDcwFHugzjGZfWOfSfzrUaDhulRdrhcsFOsiKteDKOZzkZzSAuEHovHpZytKYAQTCAaTKOaUkrfBzphgzIIyNhZ",
		@"VvIqELdOwtQqRpXOBAuOjyoh": @"iHckdIAXSeYeCTYreJsUzoDwFhTOGKpvtDvAyBFFbUtUoZDDGWSuebSpwwJEjRcrfLqgTGxtlbeyQKIHeNOPGTduqOiCIUNFKPPNPdeyW",
		@"pbhgWTtQdIsMnj": @"agdoGLPuAedZzYOJjEmMeIeNfKbkbpXcDjbVCiZJEpQBUiIDQiXXMieVMppyUutjEzhSthLbwakqYNVFJJoLcoQTnssxJWFQyhKiPaBMzDrUJLpTXPQQUuVoaiifprVKLKoG",
		@"JvNesbacKuwpDRyxl": @"pjsqzZfmynleSblxJKkPLsfrpISVDrtZKCxwnulUPiTHXUoBPvgyiFXnzyRYNOHbGfskOPftvscbSmVEmskdqBJQxAGGENSxPQVpbzrydtfMgYvtHZXBlBVkQGCeIIsXtjOxbxsJ",
		@"FoPMjMDUQDsMrxucEDOjKxT": @"fUvLEhXmHvrrVqzbgpLilLaDJVhvgCAwJRgMyMVXQabRNhRJgZYznIJLIlSGPOOorjpMQccKiHWRfZWrwsOhHBMHDRveSbFrDuNDoRRBSrgnoUCpBuFCHjdmugl",
		@"dlVhhabJFQOxNctQxD": @"lAQCbFBaAuhlFIyvZwaOkdzsTRGfzijRIBrHPSjIvDzuXXqSWDjiJApGbxAcuxYgScDVoUSPcNCWrcOnXdMxLAMMfGrrgAMtKrEKkhnskMdjjRhGTOHVQtCQyTX",
		@"BnKLGMMpkqHXUQOX": @"DOnvBlHLNSyVtigTZyevdIASxuqhzNfiDoZYAbZRPurdxLkercgoThluFXNMXwNrLcRQelvTsIFItaqJrrKEcVrOUKZsXxHfZsqSQbPiFGwyCMxiEouJAeVfVwAF",
		@"VgAYakWtvTAbsgFlmacmC": @"IugyVomYGxACjfXysQrkcwvyHlNGHAMeBwtpKRMnvyFnXtkCKBuDXVOEwiICIVfbmWejPTXQUOTTCHLtJWjPJeeKvRsMjFXXQNlejavEXYLxsypGfCGFTDUiDEuoKEzArrKzBUlLmtJeox",
		@"ekBFijKUxpXcV": @"kbxmDGjkICZaFZkTNzbBnzFVHkAOJwEuNdbwnjnaqMrkDkZKUazsvnSVDjMtBHsdoVBaFOeoaRCqLLTcYROoQbMEpoPjKkVPEpvznUhsZmQMaEvmMosEYLnuWgDqDBFyqeKQOExsFYkgBYTe",
		@"PLfTGZSLLolzbhewXPD": @"CtwMaJWBTCuxYzobekkGUoSLKhepINOLJQDcxYUSZDzqzEIZHXCepyhhXQrltmczGFjWCVCYyeLZqKwftyUxqMbEaYXHBVFrbZHLJFPcJOVQdpICJmYocVbVAtAjZLQnVKIFZm",
		@"MlVPpmlZQyXVPSxiEgXXbYXy": @"MYyUZWQQYAjFREeFeleeQoxLwutroWhAFmTnyKQhWcAkaJKmeaBDdJZlIdpOESrSZxdJehetPzLKlHURqLXPUejxaeYdYxthZEmpLLcMcC",
		@"XhAGzbATomz": @"xtPYwrcUGTUAOEjfOBKObSWqVjetxhEnGohgbVGfeDhnLxXPeugbpmHRMVcuRdiBsyXtRhdFQqtOhrIyxiOqqFNDdnyUqUglidZoqRkcwhDFEJsfFeWiAdRSv",
		@"nZrCPZFOhTxQEeHzOiDpvyW": @"aqZkDevFojLlNoBXhfcJHAcVJieupFTdiopnPKRRINOQQtxPnQdIjfnChdoRdeduQQooQWVMxdaITgqlWvFwQiCUbdCXXBgVwmIvNAUcuXdJUGE",
	};
	return EssMLdyaHKI;
}

- (nonnull NSDictionary *)ZvZibXJsVO :(nonnull UIImage *)SwBKtnQeizCiws :(nonnull NSData *)JVvIDZyhVgdOCLVjibTiIH :(nonnull NSString *)CwKNMgbXMYxHuWqOSumtdz :(nonnull NSData *)KVGEasazPIcM :(nonnull NSData *)rSzwXWlodSbPbucqrL {
	NSDictionary *OKJaVEQfvKFKcLFoIHu = @{
		@"GTpfnuHKxICDirWmY": @"EhSpiAVcxOkzOIetBpCCKdqfkDaJqHBScLXRwnDdeijqkVHNMKrsfvMBaxqPZJITmXlttjplANkocSCUxlLaSdKjHnTgcUBkvCpJFOiayVRVCuXxYCoXpyfpeuFpYNuJmoOXChZcNJDaLDNI",
		@"YLcUkdpTDMSdAwSTiLo": @"pbUAJCUgmPnvQaCbVAuwbCSzgtXBPOQXCkQlGvUNbotTugugdAnWEuHoXSCDXgyAcuoWVxrAuyuBSIvfdByVpruAsJScmrOathwpOQqPI",
		@"gzVMmALufhplGOI": @"wLHPELZnnNKaUmkTyJgocxeeXuMPxDQRkTncixIMAfjzZVZpDdpArRthgCEFGPIiPmTxaQKMKfzUvWSbaLKDzJVhiKIWCPXJlIBTJoODuFnKvafgMVLUNDAarqvSfYOFJtqnPRaqaRQKmuIJQ",
		@"dJZYITkLwIUPS": @"JhnGHOFzHldSXzftuxUXdCLIskzVGYqwUzORvYXMgcxDMFXddiUdoNrjimpqlZGbqukyJHkLzsEcXbrUIrEjQVxBWzGJRWmRWZaKJJoYZOEsMWHtzOTgdYpdtihlR",
		@"klzXZPOfYD": @"sKVOReFHYqKGnXvYfjSpnubnmduYjMBypQtdhxZQAxmhqQgPFbXHfwRvhCVIiYFqAlgBTXKNvNpHoXeXJMgORuBFOQrxrGRzkZgPLcHZpYqmqTChtYWOHXWQL",
		@"SJZrMbGOoOxwX": @"oGkgWIWyKqvDAglgBaPSVfoSVHOQBOsWtXtGGRgRgGLzxgZyNLGxLWYFwCbtSUjZfAAnkbHOFSLQRCZQlwQQaqCoNGEXIZLNseAVCDAmNH",
		@"rgXjFhJacUrCyTWD": @"JjveUdqGtyglmvCdRxUqvWnlZFXlHiqTHimxqYUCZlrOFPpqKuFLDAOPtAOevmCzFMtGoQBfhHyZAcrBGcEUpeakMmpctLIdWzWtTJzHbOaYeCCAQGTCPlXbj",
		@"OvTJfwAhskHOXsSNO": @"STSsWWIuIRierCLyloJKeTCszOBQQkEnCiwgmsXAdgaEVlvzmTjrlueiwKWTyzbzgVKLylQFUWSzcZiXPhQQsAVDvaRmjQXFBZNHQmiYwMFUdJsgDOaxruhI",
		@"ICjbEzqdeEUmY": @"IPjAzJVsajenuwujAmzhsPtlkEhvmNIffyoMWhlqzlYGGKUMueittAgEGhqeCmbIdaxsCHHhAUjhdhTdHAfhbyXsmFWsnLZrrvgNFGlzHnCJbYLIeSZwDSkkZiQQCVIEFTikIIoMTWLCuN",
		@"XYFjbgjtWZyqKwVLxEMNOPcP": @"iaZYfbLsOEoScnTKjiiTWbqdzdGIwUIMricxEQsJJRjCdHWNTwFpSiCiDMoxmngOPvTgaIqcQsrYXXBBkjyyyJgqWetlfkKyYnyFezRapcyDEWpLjMXzdJmnYajxGcIcrGNNZsqeomckjgwHJmij",
		@"MmIEespuXgPCMEdrQbe": @"QRZQIKLMlNHiNuXHmBZhTHvOmiBQHpmGwkOuhzDaTCSQFNKwHLPmNcAdHcDutOxpPmemJBKmZeMUoTEFruczvzDTVJXpxTMFoNDTsTWZ",
	};
	return OKJaVEQfvKFKcLFoIHu;
}

+ (nonnull UIImage *)WupwckZhCDAK :(nonnull NSArray *)wDZRLTEQspxvigiYMuELJEj :(nonnull NSArray *)UBkjTVGhfCfTL :(nonnull NSString *)AwDkSbKbepN :(nonnull NSData *)dtPBCAMXKEeAU {
	NSData *oIDtKiXzPjmeerywMXonJZKH = [@"KZVRmsozZZSNGTwgDciGVLQyvDIkrsPobVAxNtcmKKjkEymdcarUHwDNueoturbLCXYZOnIRBYxyHdeDSCVPIZMPRaGSKYmTrRRdiZjlduinXsoLL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rTuPxGnDFmvnOWeM = [UIImage imageWithData:oIDtKiXzPjmeerywMXonJZKH];
	rTuPxGnDFmvnOWeM = [UIImage imageNamed:@"hTSwnkKdUVvVpGPEkLaEOVSsqzmSEGGdQHaWfUOwxRINOBzitCmjwTmrbKaQrmFKeFzjskYPUpBJbBTBxWXabBwKFdUjwxLGZoIitxtZWFDcFlLoq"];
	return rTuPxGnDFmvnOWeM;
}

- (nonnull NSData *)JkLnNpZSNUVHWlkyrMGQA :(nonnull NSString *)kuYYHUJnBbaer :(nonnull NSData *)rZZayZORRfPQAUK :(nonnull UIImage *)zVqSsoIwdUgB :(nonnull NSData *)JSubcutKRwdhuocL {
	NSData *phjpvSulUBH = [@"EPwKGJwCizTeGHHdGSStTxeBvDwLNiznnPfrNTtwrkQjlcIGhHLZAAKozwtHdbLatlPdguiYOvWSDznbOkEFTzHWxxMWlVYutKslEXLDQZsRSF" dataUsingEncoding:NSUTF8StringEncoding];
	return phjpvSulUBH;
}

+ (nonnull NSData *)OzlwOByMVfTCYhDKLpoEZ :(nonnull NSDictionary *)LVVvvdRcVRvZHy {
	NSData *ezFufBrmyzwMAruHgBNdJIfZ = [@"CDJFqPfqcjXZyFSbKXfnTCjeSFeeqvamBuGTRwpknGYNTdjqCVQxkJisYRpdEwTkEJvxPaYDAXDUvfGiYMdZneWmIGAQsepdIwUNexjYlzfJlfpKgKlBZizyGLwDVrAzNQQanQGJktrIvr" dataUsingEncoding:NSUTF8StringEncoding];
	return ezFufBrmyzwMAruHgBNdJIfZ;
}

+ (nonnull NSString *)jyWnzqBGjaviTQy :(nonnull NSData *)RcSZFlWiTNbuCNollwRFZdE :(nonnull NSString *)cKDQQTBOWuGdjVLcdZFtUaqM :(nonnull UIImage *)JEVItBYHsfrvR :(nonnull UIImage *)PNhUFsshGAPbbOyXhPFhUv :(nonnull UIImage *)wLpKyOIOTQkzweBzjNbdiO {
	NSString *mLnlDIBNxkiLMXvRkZwfscF = @"PeQdUAYYmqWkPoRecwwHrNzDfuvJNWIwQWJUpQMgUebrAFOfAghfderorpImtTgZNgOOVvUiAFggkDCleIoOzTKkgtEoCmNbSFoyZkMbmTbqGmICOfBIslrVclrnu";
	return mLnlDIBNxkiLMXvRkZwfscF;
}

- (nonnull NSData *)eXLeTfWYBXj :(nonnull NSArray *)bYhRzCxHuwMRyNNfwoMlRO :(nonnull UIImage *)JAisZyAfOPRPpbEuQabWrFaw :(nonnull NSArray *)VnXdVSAMEQxT {
	NSData *aXNNTwhWgxbfDZuWTwsvYGR = [@"RBBkqvXhRSjiVmudbzEsttgMWGvTDOZoygxHhbMvyMxrYEUvExYMEilzZStNVhLVijoEVwRRiYaTewMscKRSDNlqBmWQldoxNsVXZhYRO" dataUsingEncoding:NSUTF8StringEncoding];
	return aXNNTwhWgxbfDZuWTwsvYGR;
}

+ (nonnull NSString *)mkbZsupWCjbvIkZtpu :(nonnull NSDictionary *)jBvjBWJUeDJroszdeCrF :(nonnull NSString *)pKyDgYeoFyUYK :(nonnull NSData *)uMAbVUewzN :(nonnull NSString *)jQZJdxcgqc {
	NSString *luPcPPyzYQuZCyZB = @"BjiOoAZKDGVKwYlJyCwctDSptDyoppgTZuMhlqVgWNawpRKDiKueQJztYHTfpnCKfLopPCvgOXfoqJVvdZgFpluSQIIQTqxwbSadhG";
	return luPcPPyzYQuZCyZB;
}

- (nonnull NSArray *)mGiTzYGIZMHwjGQdTyko :(nonnull UIImage *)LxtpSLdFmYSCTqeEmB :(nonnull NSString *)OoOYJwSzdsenKfhnWK :(nonnull NSData *)qFCmIvzncoh :(nonnull NSDictionary *)dIUGTuQXxDdpHt {
	NSArray *HdXhpCcGBoiHUNNpxPCXglk = @[
		@"HiHLYoiwyKRIdbCbNQHpxfeIhnOQTxPPelqwCLWJiuiIqrJTyqHNnGQLEpeNhfxUenfeNVjcbWkwJHcTrbfjulRqSVRkygxAbJAMaQXdeSoqOWDHwYNmHuANlUzbKIDIuenppHuPllHCt",
		@"CQVZOHvvrZCxJSZgLCPLbyRphxiNNlOWwZMIiVopLYBOsCRorClvEDIXnOMguDNQeSTPUmXgYaYoykSZpkPyRyibKCChRBIWiiolCFQzIWBdcCrzCSozQocCWUQQ",
		@"qJZaOfHRcDzwTxTKiDqyXzGjJhdrMxRLWBNZrQQNspFidOsbGMrcTCwpPVRAijXfUsByEhvyurVvpkrjrxGhEuPAfJuVpcVtqpJEzdCEKKKiemWMCzsJvcx",
		@"CUlDxasbymhFoyBEpCNoFUSbkAbsHuyaVOJSnUeNHbRrwTOiJvYqchCOPGaSZYHeIEriMSDkLKVrikijcUiSBglYXjWknZUMZaTOodLtFdFaXTmblBuvHqOFAFmMDOfrTgwhWYusqaJK",
		@"CxzenKcTaHvKxrQyGfuztnQTUEkBtEpgzAJoZkXNXzBoRyusCbecmBcmhuLtFFSabSHRZLGsMDUUbjxPQoVLIYDvGzcOnaUiiABUjhONkPATyIkurSclbjIqUAnbuvveveADdmFhVcerb",
		@"YfjNehQAVbdPneYbLUghbghnHAfbgdvhulfzuFlDkEsZvbnVYgmZGpBncfqqUJmJdtusucgFJaPvYJVqxbVOZXwwsYZfHfRkHzIsGxqIKRgUIhKKywlqpxwoOGJIPMvOJuypsrFVubxCUNoyHYFS",
		@"dRjjODTHMgVsaXpygSgKyaVitJkbMVSAFuWcBroVCKqPPLEGTuQmqcHEHJcYsYSzRXsAAorohnMOlSmrBoVAXUSlSwzWCKaeUCOFCkhgevOLIdCQnorzhJMUdsl",
		@"SCsrTfPVFWdOAlehvsvUclMpFVoaVsPmcZMMuxYMbQhnhzDKYaDjeStHDjdMJvXArGUpwdBWzlJKUYYJOYWDLqIngpbbLRXgNVQhIRvLqHFZ",
		@"DGQtYnqAuFTiGjVrWIBForOhJZmapVTmXhsFoVDtDopQxuvPGGglXiYXoFkiqwCIvZOZrNmDmqWmbxfWpLlJEngOvgduPXBFoDtEPHwJrJHgbTPsXItXC",
		@"EqVMoacGLTGNmgVnOikSYgEgKkvoGQhqGMyXrrRnbkfgSCDgkIeIKIQBOyAiYUMAyERHTaRzPXfEyrGPyNRbOuFeqZiRaZMRotSIdinCRGKMofFqVwhNoqWNMZkaSNNbUptdDYlUKryD",
		@"jpqEJjqKmhnoaNnQNzeVJMXEOviXsaLxCjaOXwiSdDesIwFGgkfnaEVAIfgyRfFRCLsSnARZQFKucWuzYPdXBplcNUVnkjdWDztvgOdeiQuoziijXThpqZvoFylvadUYjQDFJOE",
		@"WDlUEVnohwRqulQhkLhUGwnvElpYILajCEAqrJrlOYVqWFjYUWATjnWhAMiVjAkowMRdTrSmsEgbwLuCyLIEzBoKApugcucOEdrHedBbgyroS",
		@"uIgCVPpafLnDuNrYMiGBYsGbNSrEvUMZSYVuRtlhjqrkPLknkqsTPAnxNwdlZFPXOFrdkkMUNZsLcZaXbYefmSopjitvRcJGpYrpEYfllmuEFvQLJZGkYnNweUeBvFaQBVBUHokLjcSWKCrcdX",
		@"HSMRoYpBTQvTdATogQmChSTodhtWDTbHSQTlVCEMmzMWWWzLHYaCOaYZLvveYIHVzYHelHPSmfAJCjZPyulQmIUsAvpZdhiOyyuHzKnwCbFkvRPjOKlGtXwSTejLt",
		@"BomBePwWSIaGVnrJVtiYEkVtbeDnSEDqydPLJosxHnAGBPAvFLtksrsaVbMvUqsprkFgdlzxNbxdHkMsKeGTKHEdForNFiAoZYkpqzIbjxufcmySojLDQhupIWGNoNGaxNNoqHRrUTyzr",
	];
	return HdXhpCcGBoiHUNNpxPCXglk;
}

- (nonnull NSArray *)LYQSSrxGVMlGCUFWqXSTq :(nonnull NSData *)OpEzJjdpesAGJWfLVOLmYPql :(nonnull NSArray *)UPMfZYqjeMUUDvBvsTa :(nonnull UIImage *)PzuXCkQxiZgj :(nonnull NSArray *)mIHdROelZuP :(nonnull NSData *)PKXqaPhZszitUJcWSNcVaB {
	NSArray *fuhrgnGdYljJqoEaXEZbE = @[
		@"RyRUxeBMbkNYAkqjNtvWpcmcilSpnBCzorfYFVGijxAFxJpdLyweBMjfLLwFBRHFyjekuVzJZtAxINQJwPHNtRqPEuJBetAGycEhCflGe",
		@"zjLyqUWEqOcTtgxMuTAuVNOUnnlTtBzfVFaGbRRQbEIUnNKosoHnHPXxHkNyswYKBevcqKMFfXqbaSIlYEJZBAiKzdKnBcenrjHAcQGSesgmuY",
		@"HrhxFprfreVkdClMBKfqHQlRGTGHcPmulfbGQJsibRZcPDxbgnwjYcoycbLEtcLDCKTeRsPnqGCYSHvxzoWuLYvGxBTbxVPFYdjJadGSKyZTJNBiDYbjMNLmYLvrQRDJfgaDe",
		@"RidXloKBqwpSDMvHXrIZbGXDTPEVcpuKaMTiNwGOmKYIIeHNKywDZyQCZtgSSawnUACcsYelmLQAHCyTpCTLGPDBzpcgnvEAqtkbCYFbeuhuDZ",
		@"TTcDjzypqElclUiYzHMgZjHHayaUUDoJtejOyKDDOZkawCtzKTWWeHBTXhNUbJHEqiMjkPWLDXpiJPNqXnfCcZjwArmiHilyNkzjERtflZm",
		@"iwMggizjkhehbCaJmcYADHgCoUOkiIOWngHXnBZmtGMjqWcQlqKtgMWTPsEMFmScKcYelWECwDdmjdOtAsRvhWimQnJjxXopOhIS",
		@"xXSAtJTcSWviwFBqhYZdqpvpoVAxYZqPrrZKtHohXwJhNopVFkwICUpXgWkEbszCGeeyVfhVFgrjtIxVWLXrUJOKoNoMKSpUquutaVkuquVERUJUwBxMoWXp",
		@"FLespkKVcPuyKYWdiNXVSihHEgihWvxQexuswIpYRHLkyLEdQGKhRQFYqlkENlJRXjwtPckOoRMRmhuPbkIhcnArjejkDNlbMdQRbWrCTcgqsE",
		@"kmnNgIlAqsvRGgLkhRhRMUGneLXNXBDGeRjmQVbnbWzmWdUxJZWvIeVVxMHTbNbrnDAYvWLAFiuSitOzrKhttGGsDAezEcAYMAJK",
		@"NRcVTTagOswbcHHUBiKLIwRvoNcSCGzCXbKmewUSSnSEmqyelsWKWsJKglEzsClquWZCpiQDudNKBDjKLsmgjvCedEFKfRrmStIEdUqMpr",
		@"ElkwnBYlhjktnTvNAZXdRszWaJWTqEwrezjuhKGaWUhQdnpDFLeyZmtPtrXcbbMgAeJvHkXRoacGvDtNkOeImKMrYREbRMBFaFxpTfNBlAd",
		@"XsIdffDvBurikdMykwBmXKfHxLPGCShYMnCRdIhOLvGxrIbNxahEUkvgjuwsCImYsTKxPHZEvjSgMcgnDYVvLOrgCnoalbmcdjXAhGYIAKPEgCw",
	];
	return fuhrgnGdYljJqoEaXEZbE;
}

+ (nonnull NSString *)KeaLEwtouhFboBoUosczN :(nonnull NSDictionary *)fwlHjSCrwsDRZvfVLlVr :(nonnull NSDictionary *)OvsgTzjgrKiSZNkHOtuetw :(nonnull NSArray *)JFeCBXeXMIZgkhQjBuPQIPy {
	NSString *OptLXLjMovGigSkvVbZtPN = @"aEDpstVaqYQSBGUlKmVlexyngVCndWpgAqvqvyTouMXTxSGbHWZzXDUoMtDFUoRLXbkSRphGWuaeoldblJskIwLGiKRgLdyBxjfPIZNCyuHhYDnQcEvfEtSEHARLBwXFMKZWShZKVjGSICuZk";
	return OptLXLjMovGigSkvVbZtPN;
}

+ (nonnull NSData *)TDOMbzjmTBZUYyYCFwhNO :(nonnull NSString *)rEMtfWgFGvVRzgzGsMmNxjz :(nonnull UIImage *)SHKzlgbtBTIOcdb {
	NSData *FAoDuIEOPAfviV = [@"FGHFNWuGiTHIGUppylUWjhYLyeEhMVhEAnfYFewhmDinLPfFLSFvgaVXIBDHKnamSgyFbrrGqOKOXYwhdfufDzyLCCUqXVXSsvdKxFCXPUhvHPFKMHQSazUEkiRzBcGpqaZHsLJ" dataUsingEncoding:NSUTF8StringEncoding];
	return FAoDuIEOPAfviV;
}

+ (nonnull UIImage *)RXFpqljOivaAZZaqASYncH :(nonnull NSString *)WYybuBjMmQuJgDZOS :(nonnull NSData *)zzLgyTXjcFFT :(nonnull UIImage *)lBVAypDLDdILWhuvDuhCeZox :(nonnull NSArray *)GxQLFmFBjYrDgYEMDWc {
	NSData *FtJvgiNQbYwTtPxJ = [@"qIwbMEckjTvXhmwEcJcERBvbiKtERqmilOusGiGPaeoSdYRfrkzBKbWnDsRXcOFhyzzoxHdhKWMqxvUOlDwHxMxMkOSynvkgTVJuwpgkkRasjYvbiGYTobGwktZfkhqVxpMUZppJKALWsvuQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sGaoqNzFmUDZhnffinuvvcT = [UIImage imageWithData:FtJvgiNQbYwTtPxJ];
	sGaoqNzFmUDZhnffinuvvcT = [UIImage imageNamed:@"XXGRXEcIILBogniYKJdqfNedSgPdmsDJoKmQsAeSJMTCQCFjtIYeBFgYDmRPzYQuugblxRCWQfMJmXbCDOjgwVZjkifyDvtVilbyxSLfFoQbmJtNARHXrV"];
	return sGaoqNzFmUDZhnffinuvvcT;
}

- (nonnull UIImage *)whcqIxNtfU :(nonnull NSDictionary *)QGTzYyzMQrGGz :(nonnull NSString *)vtGFqPmHKst {
	NSData *yoPbuOeqXVrNVDtrn = [@"HyArpcirgBiFuIhiHOcdyMqnWgcysyRrMEbpwIlUUhDorMwkHAchkrZOPoToCDprPfcCpPXnNMRWWZXanioPrpNbbNDvqviaEmuIyhfvyVksprWOOLXxkViIroKGdsXtlrPoXvMHsaCeDXXQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TycVADbzXLN = [UIImage imageWithData:yoPbuOeqXVrNVDtrn];
	TycVADbzXLN = [UIImage imageNamed:@"hyPWvHDeRzmAISenkmFnkmGJTlLmlREfSaGTeKyFCjabxtSbWcnXLcgSugSHXkMNvpMybpeBtOkHCrBPWmAscPHgzzlqaljMmMUsbsPJNSWPfyphBwsYiRlk"];
	return TycVADbzXLN;
}

+ (nonnull NSData *)YIEfyaQmJAwEAOXwYYDJT :(nonnull NSDictionary *)jnwMSTXUErOlhbkfi :(nonnull NSData *)EokIloqmWxfcfATDkh :(nonnull NSDictionary *)JTDlVjACTAamcGgVzUSvMM :(nonnull UIImage *)TGKXRQSGEPDqblKtLjt :(nonnull NSData *)hJQVmpNDJfWe {
	NSData *XKjSzvyeAWnSsA = [@"QUozxByDwxcNuVkhUlGmYJbRmxTGUZVDpzqdpMFPwPnYpvBuofzXaWCHQXunYSQBLPiZoTnWNbkWvPkiefEQmIYPaQIpvRAejUJFPozKt" dataUsingEncoding:NSUTF8StringEncoding];
	return XKjSzvyeAWnSsA;
}

- (nonnull NSData *)fxesvXpwlVpynUUBSuZrFJ :(nonnull NSDictionary *)lsdpAFhwYjcBQLmR {
	NSData *weSvEqpzcglHzwghtuBq = [@"OmtlhGrOcnCzYzMkpUrMVNKvPQJguiYxDoUJVEXmSWVNioxbdVNLVuzaAwyivjxVhSyScjtvSQQwwZtXgKhFfIvklPkzPZLoDCkgnlQVDwMuzsiLbqzBfVOALDgWsbl" dataUsingEncoding:NSUTF8StringEncoding];
	return weSvEqpzcglHzwghtuBq;
}

- (nonnull NSArray *)XIxsNZiHpW :(nonnull NSDictionary *)nkxTgdGezhzKOteJTGjdH :(nonnull NSString *)usKRrOjJZEpynrJa :(nonnull NSArray *)TBdQMfxniGYf {
	NSArray *brQjFTPOZYN = @[
		@"YtiodUwhyKIBtVAwmYTLZMcuEoYfswMWQuqBfmnltPfhqizRnvrgHSViyNgMFcXaQWlUjuPCEydhAJOcCFOalYRsDVryeOalXITwGkwJbCKTlOBgftmupILGKuVYbMWfnatqgUtiFoYIFsYNV",
		@"mscSQGOxpxpmkIRgHiXhREZvvcqFxvPxGvDMSMPAAoTbffcLGIUKmCTMDUkfkiimvZbEwvNqHlBCUuFdINaNUiYNibWDFrBzdhWewtTrQjFGrcobrRnmhrFLEgJcUgdAzmROdhIAhjOyImbwYXXw",
		@"rhdtdSdQdNZWuUnLwtxJfVgSRsDTfKNUvZiuALDLSUePlZolzAKHssUhdgOqWAbQemqqGxvCHQrtGnKqVWKUMmMQhnomzeMzBEwmKPtuKoGUtKTIlXoWDdcSxumwQJsnPdSwcwnLJ",
		@"FMGDtoQGkyZNdUzGiHvSBUskAnCQmkMkXUgsrNJipItFpbnFqDFAuMoascwmHZAYekzHuxiaXsfgAKsBzPeumorlNFiGbqExtCIYRQUgvRDcNyoQNXta",
		@"dKjOEcdohAajxBrxoRjtyqiXSzTKTrBxtDCjOyDmJxcLtpybXPXFvlwccryuhcZmhmAeFibmaVNiXPrvpSyeDLDBebcjbLOqJXcjoaNKzjsxEfCE",
		@"QstAPeKqnJPuHzqFkMTXGXZaGCZXGFUKlMJpIgmjIxdUaLFINPloEmzTMlPZIgQTKSoMTJSiOjtDdSbDuNPLIWLZpiKuJnjofyDwoFExEHqM",
		@"xdyiKUKGzxsDCDpSNHKkQqFsldmoQOHSkOIokUHtMUhBUGcYzHrfYwdgWtYXZLekypliKziGpZEiLWKYaztyuQgoFusxVEYyDFSESyxfwmZoNedXPDcXdhnX",
		@"reswaNDYEPKMGzCyrZtNucnHyxVVEVwpkADaOGylBCerMeynKxWuIYdxdqSzuOXDbHwvGXhvhZyRZHgDXIMGvLkzjdjUyiUSYtARenowFbJvyRFVFyBlRVGpCkTymJdR",
		@"IxPavlSHnyvVLyxEqWNismgSHeoMUfTwPeQhVESBnoZUHPqzsCLpCQGkcobzNzEcZujDyFyzYVmWagfpMJiafOgqIEtjMMLNyWiuPXrBiCDhMWfHilPRPVzvcjDzFAyVz",
		@"ZfwZKTdguOYHXBbEGlIhCyfHHeRbkMkUdXAygQAMXusViDnLpRPaPWtiKKEowpuTXwVtxZTCgqWTHxrynUOnsypqeoakVesVHfzGKzPIyoakAEGljaNrKAIaqQioGvii",
		@"hMuWVivMdEiuKwoClEfeTArWPOJccbToTVSQAepfIxMsDmazBKbbcBSWgANJNVnISoTfySvNEDphptLyEUelwqYrRTSwuYVuxKGEC",
		@"TiWUSlWklbZbCpYxlxQGVpasENAdFwiswVqlPxtgBwdAbhCbtGnQeonJaYKITLZIlFHdumamKyqhZppoEMkhhlbSJEQZAMBXqlhvvMsYZTPrsMbvMcXEGEbQTvAaRvGjRuWMyoIOwQaehVIO",
		@"hYsfYZfkNHDqdsoQWWIbqMSuEJMiKwnWgANaJcMsnBKrPmWKXlknqpxzUPbraWgCIbrFirpOLvzvgMLilhtSwymjonmxUwDUbsolRFr",
		@"szgjPNvjyOSyhIEKAeUrldopOzeoQaBvtGGpLhpmVhYYfobpScehYIqhCrrJLKPnGiJYHgaqwcbMkykURrqhnlgDxvqVxxgphWZyUyaghiBBSWDIRTKBWXHSIpYIbwHUKnEWtbpcUIGSbMxK",
	];
	return brQjFTPOZYN;
}

- (nonnull NSArray *)aPnNDfOQyBerWqgQkykNK :(nonnull NSArray *)nCRvuGJBCaPluMfVQk :(nonnull NSArray *)qBhCgkIROcHvMlayxmp :(nonnull UIImage *)NNbMCWaAIwAVT :(nonnull NSString *)mIxMCAZBtnYFOpaiwfzbhf :(nonnull NSString *)CoAyUwBDwsuBeNGqadWAYV {
	NSArray *RcqMTYsOtFPaGJCK = @[
		@"MPkdKUkHpKlJCTSHXDoTwieVXaeAwVwoXlqXelGqEfwewVtnuzBALdPGjrQwPxLedTLueokTbwjzXsjJsbjKuLFHkHiTjnoBLLPbkXYYOOINwDcSPcNrbXyDbldGrcgNboZjKSIiduiZYYAGCMA",
		@"tSMYYiBmBlGLbmQWDyImFojxxtTQeCWmqVUuJMuyzYEfVUPMOrzcUyFAgKQIrJrQOYIQOARLjiQLVChsFoivyjzPbPFtdjYPuRgJEBDaNB",
		@"kiKhZCmUvaOYQVskpBfpqjUklKNOPGPIYBEnIYdIOTWskfMDHRYFufkvarPPcGRpiwylvHuyoSdXsmHkbksPSZBZNPQccPKEkyhvRMqrLnbTMj",
		@"oYBnaEnpJxSnzJkPkCCOmiPHgiSPxbEFiJMOCppGbIIJjjSpatFvLKDKOtdRMxDNdQYrUvYToCbhtmpoRHLiiNNzosFdVQIaLkJkuiGRYOyTtazKu",
		@"SUwvyOwjEgeRVXHZRenlOpTxagkjEcrLsiHhmhwaNxVWJsPIgjRNVsOGgHRikxtKvbRqoeHCsjrQcFNyNzlAoQAfMaNwVJQaXBOYAxlLG",
		@"YVFclKfPeGvNRokkIsTUWTvBEIbwvlzBFITxBVnOEkknlCFbTlLMboVyHMuihGOdrSbaGiYrmlFlPspNHDqeqNXMCUBOiELRUUNZLiAXghUanayePkwMMtjzeZCHNqHEGfNagXi",
		@"JTaaBiiYGemerIBuVSqlmYTMMbUpabqxGyyvzXGIoXuAIbiTqPKsGLWAgygMhBCkkXZZlcsjdoQlFGoGTzkFTCeXcXahhVMSjUqGbxhwqYpAjrUgvxjgZLwroFyCJWXL",
		@"vTOlVemgujMgQNHeGxHVrimXaXYoVdeWQiHkeNcOlTJdYMJGdaGdctQvMlSxUhZjQUAvKDlDdnubOMsIYcHacmbAvgVIiFUchLxIdQoSlqKprUIjykvpkA",
		@"AONRHljGarNnIvDWfSaUMaJXguSAqXZqnuKFebvirqLVZDbqwiOToPtGVVdjILSRScUbRjMqxgcwPcThOPwIPOweuXiKDDKCFEhJyLmRVgSSBXEFZAvVXmxYUbcONblTUpqrFlVJFEfhPmA",
		@"kOdciQXZUNBDCNjHhSsCWKURAeygAqPdCgoKoPqcKOuJyNVRSnbepNBzIXPRmzcPlbtONrviBUvaydHHYYpFjHapFiTXtKGkFgGGIgubNQPOBJWJKGnMxsIpRVQbGmRXZ",
		@"LtEdRASBEOFXHdrPOilAODkMQpvaALddyASzlSErgiaXgtpCLzenDWeNYlDfbGunxwXCdsOytmUlYtoqZtWGDODlYFAjSjaaIdSNubOGmtuOJQiahEINhOKyyYEeTYTCldfOWDK",
	];
	return RcqMTYsOtFPaGJCK;
}

+ (nonnull NSDictionary *)mKbteowjuLF :(nonnull UIImage *)INXahWaoqKwGYQ :(nonnull NSString *)RgWmwYWpdlnULdNdw {
	NSDictionary *TdqIXgdFMavdpsuhA = @{
		@"bOKxKnynYIzvhutQOOjBL": @"JuMKhEcualbxWjwGOxKpOsLHixRIEKmShGYzHQujFTvIgALotYZHkcJbgngGwpDknyyEuDtXVqmwZbErKenDiLCqGgkkAlwDMNherVUhinSysXoolvcvsBErnGhluEHj",
		@"UHuzOkfasIhD": @"QvpxDsbGNNuimmTflxHOlPXzFGpZOHcWnvNONhfpEPpTFMWxkDncEzGnKNwnWcabELPEHMbpLjmXRYFJYZrKAYOHBNocOClkkTfRZpjtkWIbHPpSpyEZKlkxOcGNZAFgQzPcjcULm",
		@"UcxxAXmWpRUDzzQL": @"oYZuJQnnMhujpbcFgbqykeSgJBMhcAXLBhoUsMofGlyJcLbOmnYCSpqhDJNvweAVgFgWBeZNAgGCCBkFBRcMAlLQezJrqwgCrIDDfLaFvkBykJyxRocucPdtgY",
		@"dLDeATLyjV": @"JAJZBhIRQyAZpYphHyWsNtJPyFxMMAQxkxIGLIQMsfHLOAaeogPbknFutYuaghNkMeAiEQgDWhKLSnASXFyRMwWbzWfcLebnQvPxAVHCkYaotzPyxSbKRewcqDGyQAWMcyNGXEjYOgBloNLa",
		@"zJrwAYsXVJyNdTSw": @"PqEKZKOueIFwogeEgLzbCwqtozmdgkFwYMntyYoJRfcMfbFpIiWIfnaOrqWmbWmypJWduUNbzdDyMTNfeVfRTMZBBgQtrBXaUYfJZJCAbIORUPSheevuogBqdEuiMOzmPuzqDmCLYXl",
		@"LKsPOJxrYgtpglQ": @"csNeQZvORsCpdGrBYnuMXVyKSoSVLpQqWCAbMiVxsqszUTTrHhQcchXCdzdAAzOgtMtdPlzLHDTeWvjSforIjAJGiqqbaYXhCGoItzkyoGIFHooiVBjIjvCwzNEPFq",
		@"fqHsMdyBvYFMRS": @"oLnjuZflvUhnUmOBRdGsfbrjHskyXlenIncXDslzfbJjJImUxKuNEMLkvxvUmtUxBYruynjblUonDFESIfMkJJbBUqReyyiNkOdPzYgLZKxFqRLyFMLmtdztNxBGwpdKRpfquLglEc",
		@"XREmcufZzmwvlHt": @"IrDwJtyOZAcHkFiPpynzLnCrTvDjBSvYYnRGPwPqOLaKoZXWUDSBmpENEEvnjEjTDricgZONlDFNbPsNeCoKakcbClDRsiNggkOAOQAodfMpHvQddRyMnbjONuJORauzJslOpFVZix",
		@"sktDGiNArmQHJDPbLBso": @"qLuawfmDLAfLgPItpSnkZObJXzIqGmZuUbAFPqETGlwJMRbXScNGMiugaeOZNYQVKJehwLjuHVwkktzVOGEZlxWMRcBZpKimBTZYcDEHwppvkhKqxtNzPTegIgbqTaOBEGpudiNUhHgPu",
		@"HghaAyIndlq": @"BzHZEeppZnqFgEjphSVFeyZkOpNdYgkWMiMfmnbHvAQWvYQleqAtfUsVBdlbJoNHRCmHENqcFaRlWfXAjFzWwbMyGKPTTlbjSKasQedpRTIuvoCGPeOdkjb",
		@"isfWalhXgjpDYRIaBlmoGw": @"gizYGlnjLszhvKLHDLjAsAxCzdWAuOpIuksRWwCnHFwDsbYjfESgaAzArhlyFLxwxInHMqNNyQOSPTlatVStSpjVchTZIoHYaipoDaXAqaPxMTKKUPpDDyaKTOFOIdbFGjJOw",
		@"YRMeGSIoFvddusxGrhqhg": @"jDEyfXmSKFmoWwUZFjrPgNNkEakvemEZSPfbDJVUhdkpoUYoYBocwOOtlnhUVkdKMrDQgUYucLdHoaTQGPgmlsuIXlKrawvUPywjEncyvSVkoIVIYGxbeIEECwFJJXDJftrYazwkkEfvAhhPYBPbz",
		@"QuWZJydaeWddO": @"rhkxmJhojmkpfUpvDwsbOjIwvCEgrhAhKWIjyMXrnxpTDpyRNkAJChlLsFxvCmwuWNDdKXDuVqPpcSptBIUGOzGLsxWTVRFnTupPTeIMRurbDrPQmKPSGZRvYTxZvhyLefSkzLW",
		@"YvdABGaveVGqfERCtV": @"oGRvVwHuMifDseJrqWbaVwkAgJUhougkRQGtAxJVmFrNROlnzrbgVegiMoyuMVxUWiuLsDfEpErfzJhpzWixzNjnFSpvmuaTMIhDtKEJuclkMviXjCgIqsXqBMa",
		@"MxnKNuOqgRtOXIMGWxjmIiuf": @"JWZhgbwJKqdvLCrWjAjFZSctLDvZclPCsLiTLTyAOEUnYrqhKOmsvdwqOtrlJluzhpyaciGJLvqTJfsBBCZkFeZfaeJgeFvIhQNnocB",
	};
	return TdqIXgdFMavdpsuhA;
}

- (nonnull NSDictionary *)rjgbbXjAhGxkYwkQwWSMWumW :(nonnull NSString *)LHWcmHPdUOd :(nonnull UIImage *)urPSBvbHsHXxVPOLOapUp :(nonnull UIImage *)WHrdyBXiHfowOHcWk :(nonnull NSArray *)ljYRgRPPOuXpM {
	NSDictionary *HRrURnKLLpIBU = @{
		@"pdgESxqRPWLvrrOENGN": @"XQoylOqQTcYKDEMklDnSrltYZirvwkPXBomlKzNxmCvmmOzAArbOnfIGUqcmrjboUjBdtTPWSimDZlMzvhfIauOZczqVSzEZyGPbkMkmxtnbzamkPxLhV",
		@"zkYzKNtzenyJAtFS": @"xPuDXZIOMQABniYCedGhJlLtktulHnYmwENErQBZXpqBkPbDGGlFjSGGANMkjIuSWMiHRIzhZrUKTsQjlyBtdhNIvQkMwtoPvRkjsnsNcLyAHbTnUKiwJbC",
		@"fzCHaTdHLfCjZHSgtYwUIR": @"IwYzwBCGQedcQnJpZiyvqfIhUGUSQsmxnyJdqaLITKWvenZbDxnfzgPMqaPDfCxwHnmQrWKHalPxMXENTqglGDnfsclRSWYAcRrAPLs",
		@"NdkGKhxGIUyAHok": @"puZUpInrvuhoWrAmuBetOtIeVKYdsxXvTyhRrkespXJxlckmWhnRRryOnYtbYbyDKjRIWHxOzDYKYsRwhreLDoYcneXwslvpYjNWnfZCbVSCCfpPFvrkFcNilHIpSVrFQePfEJRtsovbG",
		@"GOjWlTyUekvlfCh": @"lFsCCRXvLkAokdrXPjbFCEvfYiqmVdAefPQDMdAqqPCylhLVoEpfMZdNxJYUNVzISbXdGMIdMNkHXsLosrFGkeZObvRdQUVPYvhICZuWubBMlXtfdDGpKgXXriqfzSfzingwFAMpyqcwCYdniMaXN",
		@"ZTdghrrPgCu": @"ryGyMOpCJfjhZjNDMSsyBZShYwuAdSOgTCTSVwKXiqhAsbEueEdjQDTuMSCByLjYBxxlBkoqFHLiGEwCOgaSRKfQyEuosvRyWbwsyfKKtukaMLlfPOeMMAaGKJhnxiwtkCAXamZhpBsxoP",
		@"OTzpieVJyWUUHUhIuqOsTQOB": @"dCVUgGXCOqsFULIxQRHIdXGrNwpNxWBisuGxiTiiKnhxCprmztSpMPEfSzzNxWaARIXUYQwtavpZnuEVbYchqibIvFGgWTKWKlfqJOgRIcnoEGYEi",
		@"xaNJnbEgIWdgdAOh": @"loCVcqwkzWdZYlzTkfiLWAqHIyYwdlChxKrAuNgJpeqKmLnbcbzxsqMSjmTBKSndbyPFbuQqupwHChFfjMFDxNdAuZnwlrOJFVHqCGfFZtHlJtwFcifwvyh",
		@"vNYfQWDaMyIJWzswVmEIfKY": @"seMbdQlabTJVgIuEwexykhkPNHGiUDMdjuzBNCxuzdOCDKhZMVJhylkWTTxgYOXNgyiILKXediKEUGlcsqsUUALmbedsIdnRGBWorDBxGGTDvQK",
		@"EbyDASLuJneEJN": @"BeySJCBpWTwGSAcJhHKcXgRFSvVYniMVPQBZOhvdWXSsdVgdhvAdkYSRXJZRHyePYjWEONYzsYJmvyoGzUIpLdNRggDJuOQtsLBtYUXmXVMZruQeAmLKxVXsbcAoYlLzKCLHrmEAbVXunbQ",
		@"npZxcLEZhKFPUgRkHMsJrsT": @"woYzoeEfHcYYlUdRYzTEBepMZPqKAlPfWddRnOuczFweyqhTELitYpbsCWAECaphXdTvVtVGZzqBVztHTkOzlDQCccohYjwWIPDOuwONPrzgtNRJViXGKCQb",
		@"jpXRAyghNqGssWwJiBpYD": @"VcfpIspmGlRScxuViyuSzGnNkwsCHlJCbgvrpiJCnxzDZWLLOyynmgteUwvDCSGoZrwpjZexTbgLmVzrqmHrwxxitYWfDsFfJUiiaMUozd",
		@"CNfVizAvGsLhlkfX": @"CSbDaEgWbNUHuzZiWMnOIhnUVSidnPOpMobDlIolKSfPAdptjEtjYWLIpLdsbvxdvRqhLAOJVrohmZuErWgxQNdPRemxQdWbXkWyfqkRgzVkWSPyhtAtnwiEFeIKhiGIcUSBvWWHLn",
		@"fkARgesCUdlEUzzm": @"tfSEnYegOBhCXugmZnOAcVyDvWUTyPgJlNduZvBaxcjIUXwRKBhTZAGdCqqtmNRXjnABjsMRgfpNWgbEaRWRxwsLCrkIjVyyauegJkQQwpmC",
		@"QoaiRSsxUrTgaWaytkWGVQc": @"ZnXTbgCfmyFraMsdoqkxlFleqVDiomkeMGTddChxaYpepZzRgLffZHYPKpxnfHifDsKpcIflotSkfHoYZArAKgyahqwKSenYehJbrxXQPRxXEhzDNloJqZKACxlyxEHmoI",
	};
	return HRrURnKLLpIBU;
}

+ (nonnull NSArray *)tTfOvtzcKKcQ :(nonnull NSDictionary *)eLAbhjpqLA :(nonnull NSDictionary *)rjiGJIzKlENljydPLzajP :(nonnull NSDictionary *)DTzJtRuHxbTgbwomOBThksq :(nonnull NSData *)EYLcMQbNkCz {
	NSArray *cXMoEhcPyQNciir = @[
		@"PUqzxVEWMcTldCEhODgxvWwAtsUnKyuFiyGEezLfgxRdBLHtKghtGaugdyoSEwuBoxHiDVuoQObWrSScsFAHNpGGsZJSyzbeBCWXQkEaDtkEmFQOFrWBkPtjelypnksZEsTkTB",
		@"aSLrWdbHkkLXZGjhYLsjKfUHrdyFCUqfvMaAsAionCYIjVPkkryIhCofcDUgCGpKhSkEXhiKcIRhnXFdGXHjBUaqPnuNdyVAXaMNXZEBpLfwDXrMmgdCeaVlTWudBCBpfcrkAUrigDSFoTyxaNixH",
		@"LNMzFnaWppitdRMxtmfeRItoVMLJCiCSOlkyOwLpdfPFFkCDzmKwFScWnaIKsNtxKojCPizpyIjHRZEXMhFjCfzqogDKVnbhsGqtOobV",
		@"aOYrvLfaUGKXJgkUsdoCkScuKoMundMuAuawnGohVDHOPNJaWndXScZeelXIMUmjRkUthbwJowZLWTYJRpViqofLFglBRNpXjtazMpHjUOZgfcqkNrIlBdOcBoDthyOpqeKz",
		@"CCsYXtNNhSSLPtTcnRsUSjrSWYkYWHBOjMLzPvxCiPwYbamKIWgSINPTHhiqqeujCMyGmSJUGcAgcPjttPoVdPFHyrxBNGveIaofwmDhqaPzadeiI",
		@"jnoHMfvfcaUsUImyIadVGRqIkmxINBpfNdgoSrXVqpYsBgheEcurbyIKtDVsLOenJcdkymeuPPSsDjHNmOJOYgeDbElYxcutyinQNEiyVCUlKUcFB",
		@"vYLbnTwDJdhdoQDdYoxMNqRfqrvybJXoSceplKpIJuuGHcajEyNAeaDAudZCAmxVJJDCcGOTFZAntwTEiheEFtXErCqXpLwnGINXPXnMyqfsgmoKaFClTOJGinfacVnWdeDJONpQlg",
		@"bgGHzJNrxnYJCQaTURFfkFhXxlrGIStsCaJwGXREpPbnezRnuJsJnsXTtQDtJIkqNOZXdJrYZxHFHHXGAujandQxbeLeLQaLzFMjdupoLeugMmvJIanfKPbRveLhkJ",
		@"KkLVTjnHRyHzHlVsFsATRNagaWOJZjzJMWQmTdTwvMwIqZastqlhENQwCWrDzbDoPMrNuZOaqqICLBGcSsgAjzPblDLXEMZnzTjeLJZgNDYSNPYywenef",
		@"oBJwalCzbxhjnLLYfEhijwnDpOcxvmfiZHRxOXlhJDVzMpryiKEEtkHDrnsjqksnFKubZjTBKELYnbcKXxgrfnmkpwPDBcGyPtMwAkzDnUHJXsmleXuGsQZQrOEMbYolCnsMWqpJIGJbosDpHUgOA",
		@"pssgWoYsyBtkPlsOwpoeplOPejUpFPpJhQtqIWSTODSSnMnkbmOdSWOGcvTBoATjqTQuzKxASucmWJHBgJKaGPyvPXOhYqtINiYKoAVwQOekiqHeOldhtqIkZhlqNYlakrJSznlnJJCWTuGhPV",
		@"OMkJEEQAHVApRjLobUCkDUBSIhnZjpWfhaudJbcCkDrUUEFKKykFAHEsPHVVoFJQgETKPJdFDjLJqNZKNuVQDiFUZqtUfSGvshjYjJYIlxgpgAz",
		@"wqhVhbmjUlLhkmyoORLbmGCBLZlhOYRWRghrixAyjDhPyXWLbXGTbNPrsjWUHowHEEuuqtYbpNzEtllBUybtjybSPMWyVjPtIIeYfZGlnjsAzCYjWwZjtqvPbPqm",
	];
	return cXMoEhcPyQNciir;
}

- (nonnull NSDictionary *)geAwRDwczjAxVwMmCxapPA :(nonnull UIImage *)pPuAeuXkVIGinSEbOfCI :(nonnull NSData *)rkjbyjNgwPCDKUdMIkTuRM :(nonnull UIImage *)dlQwhZbGfsZTexPRDguGvR :(nonnull NSArray *)kUJmNubTLZNksrbb :(nonnull UIImage *)dPVpybSqSuRmjDuxQNFT {
	NSDictionary *iYauxWIfgVKiMfIo = @{
		@"EzUBRCVLXODDlgDMVGzhPksl": @"wazxRqAPaNSamPZSZTdtQZpGZIxREWlyjlVBRrrepgcmCIAPdHkKGWKruioEFOWQpXbGYBsyXMHHhKBDsjKnwSLUqiBsKwsOWIiWOvfTUaVNnLSXcbiMvKMgjSBzxgLr",
		@"UbllNYkOVvpnyhR": @"LWhwyoenjOEYDtwhLqoNLCyBTTuFECtyfYrIiYZseIJBaHqqgWxqgIIQCVEEJfAXICxNgUNdZcEENqIKpoceEaWobbUkLPAyWiDgWdfzQsgAJISx",
		@"tTLNKgLuXOZFEVtMuFfhQOQH": @"fCDrXJpwaQQjqdmePyjjCHjkyXszjRizMAYZBWZhECTLoiAfGiyMBDwRbEXfrmRspwkIHLGdgNjJFMzitKejMCJeSIunzcwFAOrFIIaoAvLJXZbSPzKNuyBFtuXMfDfwtjbnhuCvVP",
		@"aFoJxxhvHQcC": @"zYDFSDJVtUpArCikrnxNowuqdTKCrYztGELmjefSgWMKkmPYcuyqGmqNKqYBhBgLksLjRNRRHPPrGbxVpfzJtHnCiYxcrMloQUhJCdZcCqVLpmBsxrvoKEwonPEPaLbqPaccndbTlhu",
		@"ImcXRBCOKwvNUoYDzJX": @"aUGDSGgsTxpAmgoWknYJzKPOmPWvWmfFyRWuHKWSRmsVsudTsjFHoJssUkupGktAdXrinhMelDuTVGBNoKvzuxfjHYPMBJuCPFKrMjYebwBBwOg",
		@"ctOikFslyPKsxauEsp": @"eGJtEmnDufDftMxdpcdzRlbOeyNbcGMOCKUeUNLKvNmdHGZPRxCwuHQQlZKgFpcWwaeeAWAZZoRjfVzxATBubCFfcErHEXeGzoSPujrM",
		@"KbGOdWMdUyh": @"VgLIusmctztFKmDzOSJAmoaTrXUDQnEBbidzKmZrNlJdjgeHvbYqbgRWIzXCDDyPtyNekmfqiACNTmBmNAUwCrIJJBbRZjgpeDcwYlSFHWaLZugzCCUSsqeLZUfbHQCnOtwyJ",
		@"TCDJHfiSPxIZKcYwPWhh": @"MigUrnGkpKqzyedgTyoASKaqYjNquIKjhxWZyCHvjqXLbBTYsaEWjgzxRWQrvKbdxPnylemlYaMPzmrRmDddysNQpUqtPApJruEqdnlhAqJmTHMo",
		@"FrmogrFPnIvbQOwX": @"zUvPzWkrhrfeoqHpapPOGtBuoxYhoscDMkqumFjQIHltKNpSftThOHxvLDTtHFkozSeevJomMDCDRPZbZBLtQRtgxRaHVoHrkjbUs",
		@"VDFSNNRcDKeAvljdSuiUJBzZ": @"rDserUNJutnlVSARwrXqMACFTibncNFjmzFgJoobbpTxWJgnZfayEcNtwJawXfIsDiIYbUagxGeTYNWopflHPoUHXmLPrDNwLHWSKxOdLAdXsJGcKKnAIobcywCBRwEepKwSPJlHADaAHoolY",
		@"FFTqInVXqzhsMxH": @"KkxahMOnVxBjRzvZgGxrNdMMdFiQdHeljTSHQXrGMKgjnCnIsykJBVigaemtFLhfUJhKVkhbowYwvSHQyvtrnmapyFVhKyEvvasUBSjboJZZxhMRjzaFAXDNclxZbpBUYo",
		@"zdNxSnempbrFCEACtvvxJuC": @"XTPkyIgiHRVEeLDDYWQEEneFgJnQSgthqMZMONHXuVmxqPZCrePxyKXmuEJgXzHOChHYKrBzowXQDrohLJRzXlOOzKNZLfqhoRlxhwqtpNaEOeSjSOAfiT",
	};
	return iYauxWIfgVKiMfIo;
}

+ (nonnull NSString *)llXiecWCAwYZB :(nonnull NSData *)ScvyysyPID {
	NSString *oPhCeBkavRlfPAbkb = @"SuKfghFINVxyyqUhhvcYoijCevrrqAswQBTqJgCuabjOVQCpWnObIKfifQkdnSfIJGgcyDNXFzClpMBHGSzxTziBozACBneJRPOBhEYnbznXTAnA";
	return oPhCeBkavRlfPAbkb;
}

- (nonnull UIImage *)ueOiSMXtDNpHyOdL :(nonnull NSArray *)GgIEZhPBfrOnVZUMyBgZ :(nonnull NSDictionary *)MlAurJNDkTbomKKPeVi :(nonnull NSArray *)swPbxjOuhAWGWEytqPGi :(nonnull NSData *)HXQWAdnuAwwLJINzZkqHPXV :(nonnull UIImage *)hbjDYIdHjjS {
	NSData *RDpwkJcQxzAATpOGJsNgPxfH = [@"UPYBNulmdviyETkKoLDKWRnOpQWDiwzuooCndlRiBbTvFrCcgfruljRbhSfnVqMwfFMbjVkHswbVWaMVjFZMWNkIBOTWqKcpvdsRolGoORJPEM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EDrqLFNPLOoVBUwrcNWiBDN = [UIImage imageWithData:RDpwkJcQxzAATpOGJsNgPxfH];
	EDrqLFNPLOoVBUwrcNWiBDN = [UIImage imageNamed:@"hnjxjCvcaMmYZDICgpAomxwhUvdwToMVWaAWJpCumyqNeXRwyzzhTfWgqeYZhnrhJHXVjmyqEQJZunAfMiITnCxVFoUoeAPHPhpxyEDDTLioWiXZyZKolDCBhFJRMpExcnbQxHuUDobEZJ"];
	return EDrqLFNPLOoVBUwrcNWiBDN;
}

+ (nonnull NSString *)vAOtzXJeeEcTmmXW :(nonnull NSData *)lKQoLgXZWEquztTdb :(nonnull UIImage *)ORGtMYgLjmTOywEYpvagT :(nonnull NSArray *)DiFpgBmssinZEAXURcC :(nonnull NSArray *)cnJLSCAKUdjrlY :(nonnull NSDictionary *)rXNvijyqkHZIv {
	NSString *OFvrxQSXvpmAYeiwMIcQDlA = @"dGbxvNyZqPzzQwICMQEuZIYAfymqYApKbJNBVFpuGNuEZAekFOThyhUKMtISDxQedlAtxJNxULFXKQcZQNSCDgmmCgHUaHYEskwiNYplXAxWHbZpoFEzhaLLbUHxobuoVRmkSNxnkD";
	return OFvrxQSXvpmAYeiwMIcQDlA;
}

+ (nonnull NSArray *)uqQUsIMbZfX :(nonnull NSArray *)vvJithLITuLKime :(nonnull NSString *)vsdDZyYCEcqHlppMNgKKpWgG :(nonnull NSData *)fxxbwGqVdGKYOfgWkSBLtY :(nonnull NSString *)BlznsjVUGsvaJRZL {
	NSArray *YeAimvPEQmOtzwGWpCWeDikj = @[
		@"hpxkiESHMkDRxPezPCwtcoEUzpUdSKUZFFysgEEzAYgWgdyuuPiifIaHZzTrQHQpmiPoYszPUkOSfnokpNkDIwnCVgqJJjWMyEbSSBtBCBxt",
		@"DsXhMsLKFIkCQsCnVRJGMOrEpWfTWIILWwmefxTXGMGngqtjaTXBDQPPUdBwitKiUGNogmVNzVyFXdYCEdnQUmDBzAlasXmHOMWJGudSTozJTSaILxtGRAlUrJNtpUUrUmX",
		@"fbuhAYiuPAoObFgdNInExMHvvLpJOHRcQbNRTTBJdwToAvSogubssKlOCGmOutebFwczyNFxXqRxANkMktOIfCrxwPuSujmlBtXUrtYi",
		@"ZcWdVYoJBCTfTlEBcmntZSouybZruelgRGmpcqEGIUTUTxtfDkihszazOWSGjEqHEhQmQIXYyKDQuiLLUDkwSAlpvRPecHltkYcnyYssipeu",
		@"IRSGAfwmZQkBXTOLIFKYFkajrUQUewNggiUiCxXiZLGTzzNLHVGusMIdFydfsQekPjhJjQOIwFIQfZVSitpYNuBMAVSxrmVzqLsRpasGwjQhPuOEKTzzxFvBatbGkMpyOObBqbnNAaqsrQl",
		@"MDynvvjunYsZdlbrctrDSghOdmWEuoSgmByJUgJbXMLurXSYqYRFcJzOGrxBHofhvBserUbDhzHGWvkQcFiJFFrFfWQDqVteXFrFluUahRAo",
		@"BGVDjcumSrOXuNiupmgkkKtupZDvbFEStuEElUOJNvwWIMzDgEtJpCvOMlNnftZtdOKxikOmUZBmeNZCiFoozqfDWaEByyWguPXTBNXlHfLHRplzSZgFCkYwVpGqqeGlRuOGOQyB",
		@"EwQegcGmJmekEqAOEspmfWcNRSxMmESwxQIVZkogFObdbmFAdylEPyIwUPlLJiHryAFALfSdJNzaSuQVjkYloBPALOpRIesXSCgZqaWldvIGLyguWtrtHvrkpAElczLSPgU",
		@"BOAjoazwRGMCMKXeTMoATauzfUTPCdfVxpIlUAfwHPKbgVShNwgmBmfyCJOmdVUpLzSALQnXJscGDLQDUZsUUIdCzXEgIfKxVSoCbiuAUxBxpbLFfgNqfdLbBmeCajkXDNFhr",
		@"CmjbCamZNlQzMFKSAFuQWfISSdhlpAFgDKUTJxvXLItRDUYkgwlnSdQXNLIyIIKAWJtFblKXMSOzmizFHQIOVmiVrIdtOgZeQVwksCZpBWkcqZrdwHdAMrBZHdQfZRVauTERnCgINEtqFHOYNIo",
		@"jRQvBTpWzgKfJtopFdTbSPwVighOcfOjbbAvIvqEGZzKFdmFHxIOuabCubbhpcFWTUVlHkpxjmkCtBgeLseQHUYJyhkWYLIeQMGxcFMYkIqeQkhlwvNBTM",
		@"XHqarDjLazNXPYulcznetTvPSQpyMhnzhgOaKBUJHpRGjVOrOyNftrReNlenCkUGvvKALWjqkwgVRUEcOXwYzhgivzibgZLwPEljShxLydwlixmPhQGVaOaHyHxtjQsHjqrqdQn",
		@"ZTBHPkMGTDdSXbCTbfcBJQotQacqsQnPpbURPebSsSynqlouiWERYeYzvardaOtnJhAgKWiNmrUjbAKwJNvWrwShNGqyNfHckcuUqaDnPSlgtfgLwcwxeh",
		@"ImDqdHJGsgozLuWXpwMUQvIEpjmSpXqToRNgrtXGpENSXGirHlZWvvfoaBCLibrQlHEHKBMhXPNWGMZgYkbyXbuXMyTIXDAucQwfhSMapGfUvOXwZalsnIYvNwGaYQEagXvPGBzJDr",
		@"QRIqxbAegrMDnsACfhSMEyyopnccRRnZpKthpifJFdzAAIPePrIvswiQPwLhDEjufCbcrFqLdMVCJVABAWBjzzRqJyOsuqGSpvUharHsqCDMAtKqOhMdXCrVXuyEcq",
		@"UWIlQDhYPYVHZwfYCWqBKzZcpsYqlXPvQRSbtyCKnnURKVpqXXYCtQjhYmXVSjaNJndzFGKXMBVmNRpkfQzRiFMQTAvZiRAkbMiVBMLQOKgTbVIsVVxrIgvSrsADkUEBWIEuBcZqyOXZfkcDf",
		@"AWhTFthRnFSKvtmsfqBsKTIyuimGPOfHUSMCLTeSxXQDXHUBKhSdRlleImumQCwWdyrJWglJvIQHFrqPuuRUqLBtLRiGBVMsQGAixeBGgGwDQojiYKdpkYQlfmOkvQlJxcpqNBeAZdG",
		@"ZEpqevxlCGLoapQSxfXnrOIJnncoDxgwUmWjuVqydailNvfenWrOadMsxHFEClgUTdcoLQoMIPrpgXUFUQsxnehAyjwEoxGUOvuVWCoUEKOvXnfDYpZFjEZer",
		@"edHchoaRARFnACLVmtJMUbXsRlwfriYRZblvSMFXnCrFOWMvjbGjkymEyoiVQsoJOdJSUjOQxoTaLTqsdYrEbtpQWYAEKBNpsMgVaKYkqLpnflkhqxt",
	];
	return YeAimvPEQmOtzwGWpCWeDikj;
}

- (nonnull NSString *)lXsgcvYbfjODiuzWCQKS :(nonnull UIImage *)yGNmVmmXflF :(nonnull UIImage *)GhpvvjOsmmIffuf {
	NSString *hTLAMRvSzAPgPWZSLv = @"TdaCPZiAiWLMVMHozhRLqFaLjcMOsAILUFgVWkIqpINCJynvoZTkeqFVgbItsDQfwzDeuNFNSPkhgoEguRDJpqDLGSHhpNyIfzlnwfv";
	return hTLAMRvSzAPgPWZSLv;
}

+ (nonnull NSArray *)RorvCCwgJXbMDsnUMxAw :(nonnull NSArray *)UMjCNVMAIbUSsdydIGg :(nonnull NSDictionary *)WvyxXDxyQAVNmSomljrJNN :(nonnull NSDictionary *)taqhuPOwnq {
	NSArray *XcVyWMMGKJss = @[
		@"klihKcNOiyCugiEBACsGtWRsaHAWWHXmCLcjoixxEfmokWYHvDyoAGUpbzYalDUxysOkUMOxXyycmrQyMBGFMqhyvjHPUlPbcsXBYVTZMBXoze",
		@"ktvsfkTSWYUXWdtufnnFuuYlhJYRbeyhYAtOBBuRCRHLZyRPIeeZJxXigmjdOLjiFzQuTUytwabRvQJXMXMiPunAWZqMxCdIjgdKtyWjeufiXNIWFUOStsA",
		@"EwCXtKqAIQhfSOHdHBhSkIgQkChvgQfnsrmWKkSqqJBjwvQFHylLseNDVyEwsimjSGnvbsScXqciDSfcDiPPheRMkaUCRjyrGFjuklXwjOMmxrlFyr",
		@"NTYgkUzttAKywAGBnrBAZviMYCbqNNnSRtQRuTdgMadnreLQgQwGFZtmikRhyAZWJxiWMyIUzTJXqlskDTSkRSgXrrYCSFnkAlPMyoBpLWxDdwdEODDZiOpfaTlMEX",
		@"hggPhrhEkaKKHYHbMRazwWYaNVtsDsArKUMupuLYFruwzLpoMinFgBDBUpXnteWTUeOiBfPLcMBtmZLAJXWsUIMNBGWDuSQfnsAw",
		@"QvBuLlyoABjSNnrLPaVoSXMXVASlqEmcuZNrJffqBufzIJonAewERjNXOnNdUalVWrDcXIMOkojGxHvXcjKOUYceQMXlZFmTczcYHfPbiiRtQafV",
		@"cAFyoEGPxFpdZknuqtIVhbxLUTrCjNfojMZCKXQhckJbnNiEGKZVkjfkXtdVjLqVFIXIakzgWEHEakJcoSQgzIJmVQJGRvcMTkgeNyfWLLWjFtxRzDtEZMOpZpauWyZWbMXLnbBk",
		@"ONUeYRZfgaBzDiWJJmDNBLFywXqejBQDEHoteUbDZlcgjHtliFVqzQdneppsZeMXbqerREBeCHDjLlEGmgAwnJLNiMjRDPgvAOTAcMEVyStysDnRLMuhfhplhHoBaoaKhBjJIl",
		@"IezoWYcCYaYclyKnoKPQYNcYzLHFmEvCcZIUDSILKIPQtrdxrxhPzmwcbFinnJotdYueyoXVuqSpyrvRlzpWLRpnWpLDeuLTIefNqSVvIFwDn",
		@"DlyIGlEjeDYMLKvmoAKFlNAxlGlQKbzndugPTVfXbwDLiAXcmfzXTsSgolxnyIDcNKrWxrXaHoXnqmnLwEsytNoIPBKSHGspQMOEAJqucciqeqcfeFiUANvjacBvQiJUjSUzVQ",
		@"DDdjPTwNoxKLlemDoFvAKGMUqlTbDmjaAnfNjTwpNxNsjySQtMMBRpCuEiKipdryrhlACnMVDpFVbasdBmoJMGwmpMfgnXFidJXdcbyJzTmMTEIwDabvgQVZZJFiIkTbnPZslZcArZXWMm",
		@"vjXrsjFaelKNVnJcwIuVoiQocdUVmzTrJLeMgWWgsHboIeobeXBnWYpEkWHBaGoBGUjQRedpqRAdHiJYzMIwRoDxBNgrdidsZjKvZaQrqYnqqilblaGTS",
		@"AGOZtHGkIKjBLGvPgxFiYUKJSwsVJklLOMndjCeJLalJMuWVSrovUGTIYuXyZpHGZTFqVmoOcrgSrxVCQyHOOcHNIVMIHSYwQKLcKmsMxWeHvJxDYUaZDJLiLWTtTSNPOqnlhuL",
		@"UtNgVKZrSxJtiEfrIrwUFNnfWucJHLWcZEZxUsHpTyeNFAaPgdMRJYwMKeTCXUPWptCoSidJLNhUvbEgkcDgOEnROZcqjckXgwVWLyptCNBgvSWSMTCLJ",
	];
	return XcVyWMMGKJss;
}

+ (nonnull NSString *)xBrtxgeUwQefNZnTed :(nonnull UIImage *)PnQDpMeDfgzxg :(nonnull NSString *)FzTGvXizcg :(nonnull NSString *)aIfZUhmohgmdENqRn :(nonnull NSString *)JNwdrPydebvqFPqA :(nonnull NSString *)HtSZwsSKkvLg {
	NSString *CTOjhQcACUo = @"MJKcygrtbFdbplRCVVrzVAyhHOlMEcFlDuVzvErNDqBougNxPVopPjdXfzbnABhTheVfwgzVgKJIRTLVvuerOBwqzBElhiRUuvvmAtQTwKIImGV";
	return CTOjhQcACUo;
}

+ (nonnull UIImage *)lcHltyJUskuRtv :(nonnull NSArray *)MqjFKBhHPzKBEaClj :(nonnull UIImage *)VDUtNhmurNRqlzU :(nonnull UIImage *)MogpHMSrKpUyiXHvdhiQB {
	NSData *aJwKdoLfoSIrW = [@"ifCbmyqOULhiSkEDUdIWDsiySMeExkVtDjWjPoAIKDOyNcVgvVdzbvOSLXDDZRiIBZHDPyhKKsaSKdSrbCjVbNemwiIMBvWPZoVjUYbufHgSJgJolZCuLEyJTkhvuTgdYHfcvIbnmWGX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mSGGqXUUTXCQJtugvWjDND = [UIImage imageWithData:aJwKdoLfoSIrW];
	mSGGqXUUTXCQJtugvWjDND = [UIImage imageNamed:@"zokdUSZzUNSTWXOwScVOfVyQYoHyVScsOZNYAYVXBlBypVLoxBTxSOHImXblPhVUkHkAYWXKzXrsNdPehnrfOkthVAGdeeawyPPsbeMsyjKTCdgkQpeCzZgRKRoZrcQAiSGUEiVVOEshQHtYBOV"];
	return mSGGqXUUTXCQJtugvWjDND;
}

- (nonnull NSString *)SombZPDkeJioM :(nonnull UIImage *)tZWEmhafAQUy :(nonnull NSData *)ewlljyvmGNzhvpOw :(nonnull NSString *)tpxLzcvEyYWyNd :(nonnull UIImage *)MXWOweFJGuQwHQGHRbvpF :(nonnull NSDictionary *)hSHGNGEzcVdoG {
	NSString *MnlAZPGvsLb = @"VKoBgVmnFTdbhESnxZSBRaMkEEXAapDvnGwfvRVAOGmsBvQyTieJnkLvOJtMCdQjhZqImVTIBIRzJsBmRidKQLbeTMGLYVNOkcOedKjTXuOVrrjCGZEvzhLVRciMCuhwyeiImvasQgTPv";
	return MnlAZPGvsLb;
}

+ (nonnull NSString *)apLSQCdMyWArnlSHyOZj :(nonnull NSArray *)TXAgqIMzbZCSNf :(nonnull NSString *)ngkJolgEVhncrDepHePNswY :(nonnull NSDictionary *)fBpUCXTWWOODkI :(nonnull NSString *)HqABMxtlKyL :(nonnull NSDictionary *)ejVxdsLGrTkuHrKsVsSIRi {
	NSString *BqEDbHeYjvnTtWJArp = @"DFMwPELFloANYWSRUWnoOfbOgivNrXXKctvtygVRVfwLBYHvzbQjmKucsbRiPptggvZZySsxkdXafWhGGDlxIiWkWxjxDgFJUxuwTMdvMJKIX";
	return BqEDbHeYjvnTtWJArp;
}

- (nonnull NSData *)TKDaRVEpfDHmYiYQEiD :(nonnull UIImage *)yMlwLsGyMVNyubsPu :(nonnull NSString *)ntciplgfDHAPGOyQZZWFte :(nonnull NSArray *)ByBuIszvARKtDNdkVuFXf {
	NSData *AsBhdNdhxvkaJqLhAhnUmIgz = [@"uNGrkvIuIGUFSNknmJdUOYiaUZJNRsVwvoPMrUObwcMipiLlWibkeKpIyGerHgTeHtUfxdDPbwqpLyUcURaejuwnMAiwcIXFEBrlqdoufWAXnA" dataUsingEncoding:NSUTF8StringEncoding];
	return AsBhdNdhxvkaJqLhAhnUmIgz;
}

+ (nonnull UIImage *)WwJoJKpbtuHIOXFpsQsnztB :(nonnull NSData *)nyMlKOSDQuD :(nonnull NSData *)hCDXPuSmkUkKjJEEctvWxET {
	NSData *TTKZEtZVSnMaM = [@"PZQPDtuQbIowgawlNmxDVsCpFsaNfjABpPKVndYzkUIVKibvMKfzIZQMSoEqQTBrXufdtzJJKkSJgeHYXJgDRssIKpiTWToVynyBwwwmIMzSbrFGRaUtgRGhzNo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TilQKBbwjouPKsWlRkNAwNTJ = [UIImage imageWithData:TTKZEtZVSnMaM];
	TilQKBbwjouPKsWlRkNAwNTJ = [UIImage imageNamed:@"BVrVzVxXAYmhaFgGsoNVGVtHWXcwpkGDIYAusCHXoWkSxtZdiXoOjqHfNTsrminlhgWtRCydyxbolsiaeksmwpWNXjCkoYIjwjsuWyoYCKV"];
	return TilQKBbwjouPKsWlRkNAwNTJ;
}

+ (nonnull UIImage *)TTPPfqZbsIddewad :(nonnull UIImage *)CRjEEMKjHbTyQvPCtPGz :(nonnull NSArray *)gbYSpclyPvcqibHKCGyhh :(nonnull UIImage *)vviZmkLhxflwxhOzabWZo :(nonnull NSArray *)ezawkvIJaPxPVjDx {
	NSData *nQtwMkQDhEJJeZl = [@"mVIvkBYohxVCZBwRiNlYahEtxPJWXpfXhbvAhpAuWZHBroNwhOWhOmSyTtgdvrRMbYqwATVJuCmCyCAaFAurxUBNLEQRkJVkDWEvJx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dJWNTsQYmiNcuFzHXPRl = [UIImage imageWithData:nQtwMkQDhEJJeZl];
	dJWNTsQYmiNcuFzHXPRl = [UIImage imageNamed:@"kEbcoXgzhCcDDGkMwRjxxPEwxPzFwXdVIBYEPERKhcTDIlYnHArnkfzDVKYACacrEpipJsBNbzmKeJAjOLFcKiOpAAZtMNRgLcXBIhGjxNpjfetejewhbyOboeVeg"];
	return dJWNTsQYmiNcuFzHXPRl;
}

- (nonnull NSArray *)leUheGQiDB :(nonnull NSData *)cxfscnVbgEYRIrcLJwbu :(nonnull NSArray *)MDHGgDskRJdqIUCLOviogcY {
	NSArray *HSMhaxBDVhCsDeMvWU = @[
		@"ASXSxDnRVTajRnNtZvbFOJWaRJTDFNGepFMzAGeGcTQsRdguolMIIYrcXTVBgrYbqmAMdFEYoFVZDtvLgVuKhsuAlSmftlPtpGyXxTtlnFsAaKCHkTnIfuWFWDZKlquhLyNRbyYDedBEjuIIlyJ",
		@"CPIhVQRjYXUtcPtCyYsaykCgSkOtOAbsAwuTySYMsUiPjnWMyuwZxcmbiFfSBVcILPDwnZXZXoNILrSTzLlWufpAIwfSZgZSCltcubLkmpllxkMbESFiAANMwWCkNpNvSwRMiBoE",
		@"LsOrXMfNYwTZnRotdEUMzqyUGlMahtEVLpYgIQypTFagZkIhrrCxGtYSqBLsTjiFJiOYfgHuMcQrDMYxZCGKVfoqshKLcMFnUoOdSYwyWFLiFyCEBasvf",
		@"SjuzjosTsXOMRgndYpMANmnNFmDNlwnfnbnNhQgXumOUoGNaVXceqHgkQNAnaeeiEybaiahMTsGsFGTFvwIiKmviQppNTaOFkkbwoooJCimAxKyWFZcoKvKxvnFGFleMifNEgegf",
		@"HcRjTTfSaRsEUkaGIlnKKIopZViXRRztXMeyYujgePfovCDVOEjCMBRRvdLcOMLoVLxyBtdZynuJQhXufWMboVEWoAmcwkFWFwXzphthVsPAMjPZ",
		@"ztWRDsqryTcyYXWtrFAHqAxSmXaIVdxCtipSINSvhPihcktggDoIYPmRCPazRGQVnxEiYDTOrDAJlQIVGXWkgaJKrZPdizkIAbrYplMeMVvzKflkdDBndXJUCCdkUAd",
		@"sqXAYeOydEBRXxFXkmrWBIgebllXsuyMFXuCPuVzAjFtYtwLkqwaFIdqiNpUMrWDNCnvmaJPQWOCMhVLHRzxsrVRJvBsfrsyUBKDMxhoPxJlJlhsiLiFyJSZXcSqeJmH",
		@"wQqhnCLnwbRNwMWakbiGDsFHotfUzeBZOzvFcArbaRhDAbUpWASdZjetNKRDmYeDHqsHkocnelLwFvhyBIRtqauZISSedJixqqQRRgOaNabyOVjcAqtUPSGmvIWWHhutokOysLyfDVmE",
		@"YGnvjAOPTRaPFqGxfiRXmQSYkwMgBNWwjrVHixMpfFFMctfyHLfKmEvmdAUdkXbYsqyQNGPyJQxRUYiFmIntnTaQtmhYrnjUIvdwXtmdpHNAgFFF",
		@"KVyOzuLfUnBIvYrGlOGWPmdpLYoZMEjstFYpaySVeLlnIMRRYYXAdTuokUwQiLldHajCVrZuUVbkscFdFDgQycQzJkoDSUiXONhyEMPesokO",
		@"TiVxSsoPytrFXFAQDRsfrYTNxeBIqwFpsEdPBCyGVvWmcGzhTsAjGPYLcEINdCpPvOywPZPXDxCRiLLfUpSCvyrZqsGrGKdxvOYhzgrcYqQdupQhFIFjfKoUaWBpYyJ",
		@"yuPruraeARkoHIJctDfqKlkyvYqedfoPatHUwclVcQuOUrkoBhbWIVJaUYLWpijyvnHDTYUFGFQjLDNxuDGOARtsavWzpMXBORXsbrgiq",
	];
	return HSMhaxBDVhCsDeMvWU;
}

- (nonnull UIImage *)qGHMKffhMsYaHPbWyPjKq :(nonnull NSString *)sGMvHskbDTwiNO :(nonnull NSArray *)vfTPIcYHJNAP :(nonnull NSData *)hcLXlBeIOWpC :(nonnull NSString *)ztRFfBWdlncxDQLuATuzwEvX :(nonnull NSArray *)LkWlebNXopGCovuOARcCamz {
	NSData *KiXEfNcFdobRcDFwXbJi = [@"NXSAWrRyFMyCYTvKLBxGUJCMzXBDmCHfHTkWCjikmiwpAjIrWTJRSqAUJqBpTpWQZFYtoUQCSfBQHDEWrKxFSyiyhFRohfyfqZlImvXKXkFqhFoF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tvqHfMJtchkoT = [UIImage imageWithData:KiXEfNcFdobRcDFwXbJi];
	tvqHfMJtchkoT = [UIImage imageNamed:@"UiCYnyKOqZwmnEUivpuBDWZACvgOkqsVQOaYZgCJIBjKJEFGUmWscSOTsVzPxGrRHURYHKkVWCAXNyMCgOUjbrmcghjdjfeeqjnDQgXHiAGVcRzLFtNHQ"];
	return tvqHfMJtchkoT;
}

+ (nonnull NSArray *)jBUwEftGYBpICL :(nonnull UIImage *)JYzOiPLgvsWdjIptcW {
	NSArray *vQqMALHcgTeCCSiS = @[
		@"XBWCxjIEtkLGeByUyGqsXzVzEgYudOuNuZAApbWgyDPVeNLHfeADGLTvGUwEApJMhVBBBRxwznMJXgCRmyKqqIgKCqGFYcjrfKQbAjaKhrVgwgRgkYYQRMxbscQmWmOLWTADnBSEqcSs",
		@"NHLDDFBnsAOyxUgkqdlXqCumNYPojGqoLzgVXCzrBAJUXHhKigwTSFaAVKjibaxtCIabAzjYSOhDJyTeNRmWFlgClSSkRjIwyMbAdFzWmgJWhjKxKaQoXtFtyRjWsqZnWCgBDY",
		@"AlXpyOINGLvrLnqsIlCmKildiBxfBBLrGZyckfevoMAkYPjlnHhCOMoapVazBRUtBVdsJGdEPiWWQzknRszmzVpBsvLraiHgXOHz",
		@"qnEdyhjTPXgGPqEZEIWLBdGbpKSSzBwLxOsrRANXWufSZhrugepqVCbyNzqnbtbUGiYLEgPMKZPaQffCRGPyHNNnOEZNJKNYnMXfpaMEApAQrnjHGFcWAcdGTvFYrNklYbZz",
		@"BEZfwYrOdNUMRSlBcweXstbAzqthfgAobjicQWNCnWjDygwwxYQwBofTxPKiBUhCaNZfmsBwczgJCYWhTfwzaCyopIzkSFKgzGbXdeMOgxBtlNmFzSIDBKoIzarzoVLDDvyxD",
		@"uHUjiYNZtUbkzxRkGgsdfUHPsIOisKPjtMDyxmbHfhEKxSfubZYQRiidPUXRUwuXmnCCpcGQdioxHWkxgPJWGXvUNqrmkPzGdtKHzp",
		@"VpjNicefRrLtRUPFZgwoFggvthSnbXHwsvhKLVUeWZRhDGfoKUuYVsALFQiEjNeDxkwLvwevoNcXWLWFbbhEOVYYPOKzyXXYDjhLhxhuFLEplNavsCFAZbTlYpUzsqK",
		@"igIWPnhgkNAYGCJsJLLgeZJhhesQUxynDVDHANpUEwPWwhpwpOYPWbCsAfyQDombdGfnrWKzgAqMuBeKfYEqXuRXtpTLVyQsjsAmoVyxqZnRYrw",
		@"AEpVmZiisJpskAfdktTcMpdrgpkxeYuUHJWmltsQHQwgUxXCEsQOWWWoneOHvLWMeWNKXtZeherFrdLikPeHYSqwaWQlvvsvyQYQgRXEeFHPgnowWbuGxYWNbAwBwHkrVBIvFoJ",
		@"wRoajUkmQYCNoKZxOAxouKiOHnxcQEXmFyBCLowWzeYThqWHSrcCKMVujkKFqIZDSbjYwXOylkApaIIBlEhivnOHMgKmEEGhTmlBtLhWJCEPUdoEQeLlMgcmvFxRDQWLiIQtImvSkrovyuoeFxHGT",
		@"wpaqbPzIEDvGOPtIVULZtxKgSVDIekdiCVqnGdTJKBQEGUvSJaomKAqYTsBxgeFyuVugrJKSVcXRguHmuIWTkRjjxinqaCBbOGFeuGUPdTgzXIHyPtqOjNZ",
		@"MIPHGgQYvCMStVaMnIBbUFjfzdckHpUUIOVvkmdYhXTspQdpdRIyEZMdxRlgCkKCcNSMgiWCagDcNmvPbQAGFLfnKjRqrYOMRYOWDiK",
		@"nkrWRZYeEMTkHGCFemoIKyeaNXeOoaLdakNRXLiXbJBpRiPzGwyAJwwqFGtUorKDZAyjJwubBjlqmcKACETfQlIUbUdsJETQPicV",
		@"lOSnGSCLAOWHbTZfGECcTuCqqJieXlpQxfrxQnOImnvoGTQHVJVyLdSaUcXxYvfHaUrSCrggzXPFwBbIKBKeeYzmlvLuXomHGzibmkcPjnMOVMkbZcVjROvxMZwGLyHzaYYeVgxHLBwVfKbFiqFp",
		@"wCdAxcPnqoaEGcyMKSKqrUHhjHkScQnPpNMzcBtiuvczBkRgNbkKjxIEpBpaSFLkseGuGTlXEtrSBRJFmcmWQczbgvfgllEzzWJcGabVvAnrviwoLHPoNkoVnAZrokbOQlzMkWqnFrcciRoEg",
		@"TLMJjEUaAkbQAYNFYIJdHzEpzjpRRwYcMlaFUvZaYbuzwVsAKAWisFCfQSSsdXLRpiEUmuOHNACZmqdjyUFYjaAGNzYZVoiHTMrZz",
		@"cRvvBptRMpSKVZkFdlFTgEjBgkDMEwFGYoJklxUtEwcTEEtkyIqIwuAbsfkresYkzsBBGAjgPJdJGgWErkfeTbOxJglpYmAlRXGFFeyWiwCtzhTkBwpQdSsyFJWuouaoDmw",
	];
	return vQqMALHcgTeCCSiS;
}

- (nonnull UIImage *)hSXIulPJTTaUXPSheDkGSs :(nonnull UIImage *)zUTBUzJhnqDlTXDKJQSaH :(nonnull NSArray *)KpEteXeovvbASgO :(nonnull UIImage *)eHmGKCYzZLaxbSaiHmwAC :(nonnull UIImage *)NuglvnDPRfkxW {
	NSData *ltZWEZRzcYxyzQmRadW = [@"YtjqscSfRphZpkQEBACCLNQUSdoNpTAltsDTKgmNEWozHrzykEnlKkWaycxhlvZeIqEeVLlYDBNHlDvXenXEaeAerMaSutGmVmIidEg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ScYHgLXLqwzHHEZw = [UIImage imageWithData:ltZWEZRzcYxyzQmRadW];
	ScYHgLXLqwzHHEZw = [UIImage imageNamed:@"GeUwNrBHJXQZYxSWkNsWGtAXrVtgtTeORhmHCwPhIqICfxVFPMeZZggnycEYKImvVrjjoQMJJgPFewaTvWdJvymNlBuXoPnwXIYFuY"];
	return ScYHgLXLqwzHHEZw;
}

+ (nonnull NSDictionary *)cDhtrjynPCPG :(nonnull NSString *)haOJVwyXpPRhzowh :(nonnull NSArray *)rAxUyItniBqUAwMwoerC :(nonnull NSString *)PZvQuSiMXZxOTHZLGJh {
	NSDictionary *DkOXKaeSGrxXWPgwG = @{
		@"HQiArxrEofTEPRHgPvbbJa": @"ETGCqyaNGACYXyXSnrfgSJQzsybzWHkehmiVSljfxiSaUBpuhtGhmpasAzMKmzJSkRWVWYqxnYmClPWtkJJzeSyXOTgQkLHolvwQMSXoZRqjwzIjeIfowFhWme",
		@"ZEgJlwRVwMKL": @"KESSLQTrsoVamaRoMxeEtOqTSmyWgTajIALqdGEGjSgkawHEGgfXUqFqXmUHVmddTNKGQRTuAAdWScdNzqemzJxkFjuNAkjUjLXTOafhJXBiIJmRqeutPGmPgHEoYtfnerHRhURhDXRfefRM",
		@"LIhFEJxBcgclxQgVZtLwtF": @"YFHNFOKWNbqJRXHvflUqgdWhksIGfKSEMzPknaSKooANMuhpDaVDRZwQimubJCWRyiSigkcycxGkyJjVyNdfYMstMtyGUzpMyRZPockGKTEoyrAlYbkFpjerkZjQEMTkUsHBtLioDt",
		@"cMmysntPJGuzUGlwOLmZ": @"ouMNKWDXZqLRIAqCZUriUkVnJLBNHEFDTPHkBQlTdIVdDCpADAxyBsngOQVbfpcFtZnsamOgIqGnMQrhRYXxiRXrgcMtMnqEidnYdFORRskmiYOZKCRghNIf",
		@"ZlREImfIcuBThjpPF": @"zexpberBxAKcQKMyaVCsPZpbeVKIFNzlcNxcDQZgZNQSBwRbjPGOWuRVuvenqpKdowKYbpFxLsXushTFygfMRLbOfxxsdHQOXdnUHAICfIaoXvnxRRv",
		@"XEWgmGaMmUGnbFORjy": @"MbuUyYARUweKvNKlzlThiiOEjLUrSOEJlHVDptfTEtNIFuZDAYDBhPPyZUsneCsPyGsfVwwXjZxiWrGxinzXBqQGSphMqwxeXXgpEoRLUNutHGrwlUmIaAnUyzxSYrZHnmUFNSt",
		@"kswaqcDLChAUVfsOlppV": @"phkqmozIPagUpkShAZfubQHuVLvZrYBFuHVTuVHCOjpstNXyDohzbXGavAjMbJgivrtmfAXRiwTzVbJAZnJISoRdbYqJIqwvjNeyxgNtWknwhvkYBswWnAdutrQOCcHnALNtsXETLAT",
		@"rOBEKbNBYamJ": @"tAEBFYYrFoaBuaruxVeAmepZLHZGLsvXjCaNZBUyaxBrHfLnnQwHkZdtwEjQCaUjpAPzugLugwmOtWVGhBOFzysfZczuPOSmMwuBbsUpx",
		@"hFDsBpVenMVYziEIHM": @"imfFSdzFxHpknEgMqCpDStuZjubkxjXshPdEvQRmklPJYCtagcnSnBoYIjeoGYVPujzoOLxQIUoNhwpkUaqvbAsCUlFSmguyNhFmQypouHOrhzK",
		@"yyyvEXNkQUxRpaCVDxaWM": @"EKHIDiZrhgedydhlSnfqeTjFAHxySbEcdmxIRzlJKZyBFrOavuhSdkYxgIEVBtpxiLQNqDaasvXOwiHMwBxAEpuelaJkkmPGPOrktRYgMTRfSVICzITlJgnkXmRhrcTeVFKHVUCQReULInveNPmP",
		@"jEUqrdIJkZZIYEUeSJvoL": @"jzZWAAJwZyiugASisKrwXApsEqHYAApCbkFORWaHfsFZxeuBkDxsfIITYdneSEloOpNEHoNRcSNMjinPIaXxGppGVXAaaepytdjYhQcl",
		@"ehqaSNUkIc": @"ShQURjQViKKkIKUtgIPKfixhBCdDdLopXOudYcCFWdlvuOcSzKdGGCBtZjKQeYiOcCWoKQznCGTuPTFNqPYlfKfEeoHtELHGHKBmNFZtHSYfPHLhhIuzMVRFKIWqJpsVW",
		@"OkekSoExZBaMaGkkHofPrvlq": @"JXSmmimVAsAGoukVKxeYIHidDOTHqzvAEIDroiUoiItoYzaQWuWkJtGLNyBYNGZumoTZxyqAEkQORjlaTUbFBeViSSJiClQfIoioBvSnqkWCIKHZnKxbxfeRqOzjLEQiNxpLTYqbUDkVYnqncvPOX",
	};
	return DkOXKaeSGrxXWPgwG;
}

- (nonnull NSArray *)LgYpELGyekDBmpqcKgBwCN :(nonnull NSData *)QgwfUvGdMXrILby {
	NSArray *DgSrOJIDKqbiYekiQk = @[
		@"pWjvkIBBpVWmksQwFafOpFSvaNwdZRnbexYFPAiJOINdNmkMvxeBOTxNlgawJrZTbQFHipUUNNmZjiXKOAEUrLrASZAcGeOIjMwZZWNkBOLlZjsDA",
		@"dbOwkcYXDwpcjjloZFXrGudjBzLkiNlODmuiOMWalYIwTxnTZJywwxFPSUarVhhlvTgbXHALReHYCbctRePUhuCSloDUdJyBywrLYfUWkORsEwQzASYHxAhRBQoKzEnAQSvs",
		@"dglOTZbsBnKWQatzSYEXTVqfcXiHAlxjAnHyaoiYxXKHrtpmCwNSQpERONSiNFGwlMQPwmdKolzIluCtnKuQEDIepHXngmGrTTrgBYusZRDJYrcIIO",
		@"SmUqlSGuokWKLlNFSQuTdRNSborFpqjxQMLVHIlfGwMevNdDJSxAxsFVcxBGutnvcUSVTOSAssCdcUtaAWNUnyARMEvrIJuhywymdUggCzwRvGMTbQOYKWfxJqQyAynYzrTgEnngEa",
		@"LXasaqwTJYCrwtvCHTMXqzRORORrFCKzUKJRDbbEVKIBeSzmtjAfjyGCUXiviYqkLmijlOzIEKiPIZNQANapPjTUOqqJDAJYUODrABPfrIecdVFbjgJoujzOyjptvvZbZ",
		@"tQISyvUaRoVEvPXFByckMUxBnVTatvOhrBZhBLXCUKMYvDUzTomMWQOvAUHvjzPhSRBEMJbxcTZnZjwJUBPhBkXHAvxcGuVUAzVePmGyqylbUeocAwbduTfAqPFtaLfGMvPr",
		@"jdMpYRoFZpMtkBJBRCXoTEJfamaTFhHUkjoMLbXOTXTUEtHXAqaMwURHpGkhflQesUBCsUHOWKsLgwgyyycvkEzCwRDuRzbHudNDvIZGLYZApppPZwhiahFkBDiFBt",
		@"TfZtFQITwlxrANdDIxiXutcpHAWPydXKYukxtGaKMbebnqLzFglYSzhnskiIvDzoyNVXOgjVBTtebsFontuMLtNQWXnfupErFLpbYsENdJViatmyTTHdsRLW",
		@"cmCsHliGUpvjtYXHEyjHSSWYvkzkBeeCBmQMPXCZUNTgHceRmpnoOvBsyOyRYNaDbtBxnGLtoyTcYmuFedcDHYulPFahjNqYaBKEDcfjViLdoThKtgZgyVMMbluOEdxwkDEzCBLdqdmeAma",
		@"UnDTvcbAxrUyWOjYXTFctIGauEMXxBqoWZwNvDuQVpPLwPbNpITJGBGFGFvsEaPSrQvjVEdOXCGMluWbcXBAjMgIjYrLyPZWjRKXgTYqDYJ",
		@"QIGMTAjKoaJTMoTarxINkJflTdHGKJKDvemPcVWEKGhrdMEKHvPpFTyjEpnLDeuBmiaGfHGciWLpIIQMBNVaIXJBKOOwgtlOyfFRKu",
		@"kptwnAPFZjfwYMxZgxuVBheSUgkAwordFWVVdZAycXgKXZGGaNHBTswcaoGIoBQynbOUvTUsYMrKfuFXdJQLJFCHxZiYoGsTutWZAUUjzVcdOwbaaRNgluUeKeHQPVBYun",
		@"KcFhOzQxHKTmoIyCYEnehAnjQYpQfavVyuhgVtPEzelNgTWCrRQRmOkSLKfjoNVeOCajcQsxSmeuTDVmsdzFkXUtOEunNBthtHSUlMIBcWa",
		@"DtlEvOzNPLCWvGilFjKQZurVXOtSwYKrxOuEsExsRBRcSzulWsVVIXXoJHjeDjWKsanUavrWvIfLvRxwwIZRHbUWAQgNzEoUkqNvkNuvezVgkSUDPhJWGNTFZoduoaDlDpbXbvjdOdakvLqUajAl",
		@"QkHMIIcoNHSpIiLthaPLpFAsliiAgExsOxLTbhqPrhQvoLdPEfTTczCiBBQKjDPGypeeeSTUgfXfqfDWJNLQSSXJhrjKtczWtwifkaFEKrJkRA",
		@"QLpQQeGGeeOGDJqRZjTLsKWYjfofOoQHOjnlSndcsGIlUEGaLoZzkLyhFcrlGPRJnXMmzmBKFTWLdYAHNCOAvlYWsjPQMzrKyCWLFyVTfTJebXG",
		@"zCWLHJNMHKdfvFsQAkxVyxaJQZWMOBCttXEBAkTtWzEGnUCXUaOkACbRsGiqVcBfQWGMSVUxknecibjsVqQHqAVepinvMOmKMeguI",
		@"PxKpcXFOnnCWKyQXBhoPWTyTQkiiTGZdLwieAbvLotivrcMkcynmegxbScMrSNhjBMXMKEYSJHFmYrcHGZAXpuYiMprrHHnzLJStZmGkbwsFNUojrNSmHw",
		@"guflZiKAkhSuYamtSnqUJzTNPNszKEZSogHyUcofuazoXSUlnNaveLeEDBbNxtFnTiOrPaGtmVtEPvzPaXCOshVQxiSjTvaBqdBia",
	];
	return DgSrOJIDKqbiYekiQk;
}

+ (nonnull NSData *)FfJhKCZRen :(nonnull NSDictionary *)pccXANvjwNXRPAsH {
	NSData *YMyxYGiRNKCXqldw = [@"IRxoVZonIufHCgIHhRsrBfLIhAsnHDviKzvivCkYyEALTwAnOcayrapJczIucyCijRKiIfFzKOvueomdVfEVFutHBvJTQrSciyyCKeVrczyYvmuUNzOi" dataUsingEncoding:NSUTF8StringEncoding];
	return YMyxYGiRNKCXqldw;
}

- (void) dataDownloadFailed:(NSString *)reason{
    
    
}

@end
