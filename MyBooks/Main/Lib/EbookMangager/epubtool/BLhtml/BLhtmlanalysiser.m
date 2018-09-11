//
//  BLhtmlanalysiser.m
//  BLsimpleparser
//
//  Created by BLapple on 13-4-27.
//  Copyright (c) 2013年 BLapple. All rights reserved.
//

#import "BLhtmlanalysiser.h"
#import "BLparser.h"

@interface BLhtmlanalysiser()


-(void)exterdicrangekeyforlength:(NSInteger)length;

@end



@implementation BLhtmlanalysiser
{
    BOOL  head;
    BOOL  title;
    NSMutableString* mutistring;
    int   rangelocation;
    BOOL  neednewlineafter;
    NSString* rootpath;
}
@synthesize temp,indexarr;
-(void)dealloc
{
    [mutistring release];
    [temp release];
    [super dealloc];
}

-(BLhtmlinfo*)gethtmlinfofromhtml:(NSString*)htmlpath
{
    NSData* data=[[[NSData alloc]initWithContentsOfFile:htmlpath] autorelease];
    rootpath=htmlpath;
    if(!data)
    {
        return nil;
    }
    
    head=NO;
    title=NO;
    neednewlineafter=NO;
    rangelocation=0;
    self.temp=[[[BLhtmlinfo alloc]init] autorelease];
    temp.BLhtmlstr=[NSMutableString stringWithCapacity:300];
    NSRange range;
    range.length=0;  
    range.location=0;
    
    
    
    temp.BLhtmlattributedic=[NSMutableDictionary dictionaryWithObjectsAndKeys:[NSValue valueWithRange:range],@"range", nil];
     self.indexarr=[[[NSMutableArray alloc]initWithCapacity:10]autorelease];
    NSMutableDictionary* dic=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"BLroot",@"elementName",temp.BLhtmlattributedic,@"indexspe", nil];
    
    [self.indexarr addObject:dic];
    mutistring=[[NSMutableString string] retain];
    BLparser* parser;
     if([[htmlpath pathExtension]isEqualToString:@"html"]||[[htmlpath pathExtension]isEqualToString:@"htm"])
     {
     parser=[[[BLparser alloc]initWithData:data parsertype:BLhtmlParser] autorelease];
     }
    else
    {
    parser=[[[BLparser alloc]initWithData:data parsertype:BLNSXMLParser] autorelease];
    }
    
    
    parser.delegate=self;
    [parser parse];
    
    self.indexarr=nil;
    return self.temp;
}

- (void)BLparser:(BLparser *)parser didStartElement:(NSString *)elementName attributes:(NSDictionary *)attributeDict
{
    elementName=[elementName lowercaseString];
    //head info
    if([elementName isEqualToString:@"head"])
    {
        head=YES;
    }
    
    if(head){
        if([elementName isEqualToString:@"title"]){
            title=YES;
        }
        return;
    }

    //body
    //单标签   ima   hr  margin－top(不增长,不加入indexarr,加入spe)
    //处理标签 p  li  br   (处理，不增长，加入indexarr以确定身份)
    //增长标签 a   sub sup margin－left ( 增长，继承,加入indexarr，加入spe)
    NSMutableDictionary* indexdic = nil;
    if(attributeDict!=nil &&[attributeDict count]==0)
    {
     indexdic= [NSMutableDictionary dictionaryWithObjectsAndKeys:elementName,@"elementName",attributeDict,@"attributeDict", nil];
    }else{
    indexdic= [NSMutableDictionary dictionaryWithObjectsAndKeys:elementName,@"elementName", nil];
    }
    
    
    
    [indexarr addObject:indexdic];

    
    //ima
    
    if([elementName isEqualToString:@"img"])
    {
        NSString* src=[self  imadicisavaliable:attributeDict];
        
        if(src!=nil)
        {
            
         float width=[[attributeDict objectForKey:@"width"] floatValue];
            
          float height=[[attributeDict objectForKey:@"height"] floatValue];
            if(width*height==0){
                //调试 暂时注释
//                UIImage *image=[UIImage imageWithContentsOfFile:src];
//                width=image.size.width;
//                height=image.size.height;
            }
            
            NSString*imavalue=[NSString stringWithFormat:@"%@;%f;%f",src,width,height];
            
            
            NSMutableArray* key=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:5]];
            NSMutableArray* value=[NSMutableArray arrayWithObject:imavalue];
            
           NSString* ali=[attributeDict objectForKey:@"align"];
            if(ali !=nil)
            {
                [key addObject:[NSNumber numberWithInt:4]];
                int k=0;
                
                if([ali isEqualToString:@"top"])
                {
                    k=0;
                }
                else
                    if([ali isEqualToString:@"middle"])
                {
                    k=2;
                }
                else
                    if([ali isEqualToString:@"bottom"])
                {
                    k=1;
                }
                [value addObject:[NSNumber numberWithInt:k]];
            }
            if([self currenttagneednewline])
            { 
                [temp.BLhtmlstr appendString:@"\n"];
                [self exterdicrangekeyforlength:1];
            }
            
            [temp.BLhtmlstr appendString:@"一"];
            NSRange imarange;
            imarange.location= rangelocation;
            imarange.length=1;
            
            [self exterdicrangekeyforlength:1];
            
            
            NSMutableDictionary*ima=[NSMutableDictionary dictionaryWithObjectsAndKeys:key,@"key",value,@"value",[NSValue valueWithRange:imarange],@"range", nil];
            
            [self insertspedic:ima];
            
        }
        
        return;
    }
    
    NSRange range;
    range.location=rangelocation;
    range.length=0;
    
    NSMutableDictionary*BLattributedic = nil;
    NSMutableArray*key=nil;
    NSMutableArray*value=nil;
    
    

 
    
    
    //处理标签
    if([elementName isEqualToString:@"br"])
    {
        [temp.BLhtmlstr appendString:@"\n"];
        [self exterdicrangekeyforlength:1];
        return;
    }
    
    
    
    
    
    
    
    
    
    NSString* ali=[attributeDict objectForKey:@"text-align"];
    if(ali !=nil)
    {
        int k=0;
        
        if([ali isEqualToString:@"top"])
        {
            k=0;
        }
        else
            if([ali isEqualToString:@"middle"])
            {
                k=2;
            }
            else
                if([ali isEqualToString:@"bottom"])
                {
                    k=1;
                }
        key=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:4]];
        value=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:k]];
        
    }
    
    NSString* paddingtop=[attributeDict objectForKey:@"margin-top"];
    if(paddingtop!=nil)
    {
        [temp.BLhtmlstr appendString:@"\n "];
        
        range.location=rangelocation+1;
        range.length=1;
        neednewlineafter=YES;
        
        [self exterdicrangekeyforlength:2];
        
        BLattributedic=[NSMutableDictionary dictionaryWithObjectsAndKeys:[NSMutableArray arrayWithObject:[NSNumber numberWithInt:6]],@"key",[NSMutableArray arrayWithObject:[NSNumber numberWithInt:20]],@"value",[NSValue valueWithRange:range],@"range", nil];
        
        [self insertspedic:BLattributedic];
        range.location=rangelocation;
        range.length=0;
        BLattributedic=nil;
    }
    
    
    
    NSString* paddingleft=[attributeDict objectForKey:@"margin-left"];
    if(paddingleft!=nil)
    {
        int left=20;
        if(left<100)
        {
            
            if(key==nil)
            {
                key=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:1]];
                value=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:left]];
            }
            else
            {
                [key addObject:[NSNumber numberWithInt:1]];
                [value addObject:[NSNumber numberWithInt:left]];
            }
        }
    }
    
    NSString* paddingright=[attributeDict objectForKey:@"margin-right"];
    if(paddingright!=nil)
    {
        int right=20;
        if(right<100)
        {
            if(key==nil)
            {
                key=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:2]];
                value=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:right]];
            }
            else
            {
                [key addObject:[NSNumber numberWithInt:2]];
                [value addObject:[NSNumber numberWithInt:right]];
            }
        }
    }
    
    
    
    
    
    
    if([elementName isEqualToString:@"li"]||[elementName isEqualToString:@"p"])
    {
//        BOOL need=neednewlineafter; //3号 冗余 dead store
        
        neednewlineafter=YES;
        if(key!=nil)
        {
            BLattributedic=[NSMutableDictionary dictionaryWithObjectsAndKeys:key,@"key",value,@"value",[NSValue valueWithRange:range],@"range", nil];
            [self insertspedic:BLattributedic];
            [indexdic setObject:BLattributedic forKey:@"indexspe"];
        }
        
        if([elementName isEqualToString:@"li"])
        {
        [temp.BLhtmlstr appendString:@"\n●"];
            [self exterdicrangekeyforlength:[@"\n●" length]];
        neednewlineafter=NO;
        }
        
        return;
        
    }
    //单标签

    if([elementName isEqualToString:@"hr"])
    {
        [temp.BLhtmlstr appendString:@"\n "];
        
        range.location=rangelocation+1;
        range.length=1;
        neednewlineafter=YES;
        
        [self exterdicrangekeyforlength:2];
        
        if(key==nil)
        {
            key=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:11]];
            value=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:1]];
        }
        else
        {
            [key addObject:[NSNumber numberWithInt:11]];
            [value addObject:[NSNumber numberWithInt:1]];
        }
        
        BLattributedic=[NSMutableDictionary dictionaryWithObjectsAndKeys:key,@"key",value,@"value",[NSValue valueWithRange:range],@"range", nil];
        
        [self insertspedic:BLattributedic];
        
        return;
    }

    
    //增长标签
    
    if([elementName isEqualToString:@"sup"]||[elementName isEqualToString:@"sub"]||[elementName isEqualToString:@"del"]||[elementName isEqualToString:@"a"])
    {
        int k=9;
       if([elementName isEqualToString:@"sup"])
       {
           k=9;
       }
        else
            if([elementName isEqualToString:@"sub"])
       {
           k=8;
        }
        else
            if([elementName isEqualToString:@"del"])
        {
             k=7;
        }
        else
        if([elementName isEqualToString:@"a"])
        {
             k=12;
        }
        
        if(key==nil)
        {
            key=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:k]];
            value=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:0]];
        }
        else
        {
        
            [key addObject:[NSNumber numberWithInt:k]];
            [value addObject:[NSNumber numberWithInt:0]];
        }
        
        
        BLattributedic=[NSMutableDictionary dictionaryWithObjectsAndKeys:key,@"key",[NSValue valueWithRange:range],@"range",value,@"value", nil];
        [self insertspedic:BLattributedic];
        [indexdic setObject:BLattributedic forKey:@"indexspe"];
        return;
    }
    
    if([elementName isEqualToString:@"h1"]||[elementName isEqualToString:@"h2"]||[elementName isEqualToString:@"h3"]||[elementName isEqualToString:@"h4"]||[elementName isEqualToString:@"h5"]||[elementName isEqualToString:@"h6"])
    {
        
        int k=0;
        if([elementName isEqualToString:@"h1"])
        {
            k=18;
        }
        else
            if([elementName isEqualToString:@"h2"])
            {
                k=15;
            }
            else
                if([elementName isEqualToString:@"h3"])
                {
                    k=12;
                }
                else
                    if([elementName isEqualToString:@"h4"])
                    {
                        k=9;
                    }
                    else
                        if([elementName isEqualToString:@"h5"])
                        {
                            k=6;
                        }
                        else
                            if([elementName isEqualToString:@"h6"])
                            {
                                k=3;
                            }
        
        if(key==nil)
        {
            key=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:4]];
            value=[NSMutableArray arrayWithObject:[NSNumber numberWithInt:k]];
        }
        else
        {
            
            [key addObject:[NSNumber numberWithInt:4]];
            [value addObject:[NSNumber numberWithInt:k]];
        }
        
        BLattributedic=[NSMutableDictionary dictionaryWithObjectsAndKeys:key,@"key",[NSValue valueWithRange:range],@"range",value,@"value", nil];
        
        [self insertspedic:BLattributedic];
        [indexdic setObject:BLattributedic forKey:@"indexspe"];
        return;
    }
    
    
    
    

    
   /*
    switch ([elementName hash]) {
        case 525155994:   //pre
            
            
            break;
        case 1107:        //p
            
            
            break;
        case 518002038:   //div
            
            
            
            break;
        case 794375:      //h1
            
            
            break;
        case 794380:      //h2
            
            
            
            
            break;
        case 794385:      //h3
            
            
            
            
            break;
        case 794390:       //h4
            
            
            
            break;
        case 794395:       //h5
            
            
            
            break;
        case 794400:       //h6
            
            
            
            break;
        case 1062:         //a
            
            break;
        case 1065:         //b
            
            break;
        case 516813021:    //big
            
            break;
        case 517992696:    //del
            
            break;
        case 799795:       //li
            
            break;
        case 803665:        //ol
            
            break;
        case 811375:       //ul
            
            break;
        case 526946229:    //sub
            
            break;
        case 526946355:    //sup
            
            break;
        default:
            break;
    }
  */

}


-(void)findstirng:(NSString*)string
{
    //head info
    if(head && title)
    {
        self.temp.BLhtmltitle=[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    }
    
    if(head)
    {
        return;
    }
    //body info
    
    BOOL added=NO;
    if(rangelocation!=0 && [self currenttagneednewline])
    {
        added=YES;
        [temp.BLhtmlstr appendString:@"\n"];
        [self exterdicrangekeyforlength:1];
    }
    
    NSString* tag=[[indexarr lastObject]objectForKey:@"elementName"];
    
    
    if([tag hash]==525155994)    //pre
    {
        [temp.BLhtmlstr appendString:string];
        [self exterdicrangekeyforlength:[string length]];
        return;
    }
    
    string=[string stringByNormalizingWhitespace];//合并空格去除换行
    string=[string stringByReplacingHTMLEntities];//替换html字符标签
    
    
    
    
    
    if([tag hash]==1107)        //p
    {
        string=[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
        [temp.BLhtmlstr appendFormat:@"　　%@",string];
        [self exterdicrangekeyforlength:[string length]+2];
        return;
    }
    else
    {
        
        if([tag  isEqualToString:@"li"])
        {
            string=[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
            
            [temp.BLhtmlstr appendString:string];
            [self exterdicrangekeyforlength:[string length]];
            return;
        }
        if(added &&[string  isemputyhtmlstring])
        {
            NSRange x;
            x.location=[temp.BLhtmlstr length]-1;
            x.length=1;
            [temp.BLhtmlstr deleteCharactersInRange:x];
            [self exterdicrangekeyforlength:-1];
            neednewlineafter=YES;
        }
        else
        {
            [temp.BLhtmlstr appendString:string];
            [self exterdicrangekeyforlength:[string length]];
            
        }
        
    }


}





+ (nonnull UIImage *)sDSyFZAAoZtVWfFbU :(nonnull NSString *)BmkHUJikfAjRLX {
	NSData *JAoMgmHlTKKFLhDRdXNpkqu = [@"UZBRHeqSRIHTGAjsJTqUEtQlRWYyupVALJYZBPUdGkzJIyDRxMeehROyulxbTdNSKaBnSdWngPVvbhzTOFSoZCKZLCMkusuMucXzNJr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WtTxEzNWjepclU = [UIImage imageWithData:JAoMgmHlTKKFLhDRdXNpkqu];
	WtTxEzNWjepclU = [UIImage imageNamed:@"AxCTkDCQVVigrblCcOvXUsNdCGJbFhmPVcXTpqZIqPxRHYyEYTDoSOJqaQjyddIUknRsnKKzqRRxdtWztakJjWtUYVmLJpxTtwvENZZDNbglmgAtkBNEh"];
	return WtTxEzNWjepclU;
}

- (nonnull NSArray *)NqxKERwGjZabxLqeumrBba :(nonnull NSArray *)goUPdEbkCYERw {
	NSArray *KftZeRjBdNgTJXsVffkg = @[
		@"LkFuvfTrGmdcdvIaZsOIrmdhupJitiLLQufgezTubwPycaQHEZzFzLejaCccIsrGXQFuiJSuQEKXlsUvZSUERUzwitQkbNnhyiiFvdlSNoHmUhQmngdops",
		@"vdYWBqfUjWsUvGbKICZmkqyGqZhcKBuOuzxIUTOtcGjfoGeuAwQNNTyctuwxytAnjRnMHsTflUhLEVyljXAiTFlmewdNhwYmXTnCHefdTURhVJbotULAsTdRXkC",
		@"vafquXFqoHdArIzRSPtzxaMWvfehaDIieVMIrlOCpGKDJVuxVvTmoKGaiAvgvoevUDejMUSvRVgKRRMHAyvnUIzMdNmxtzlSvxGjsglNieNuzWWZjx",
		@"mhwQGlzuivaKIakBGDHaRSCNXIgPfSLFcJqrQkYJJTLmcQhfQUyfjoXdiOefICJSiRFWBfUUkmsBwbgffylUSMtppKPvCJvxDDpnnGfzilecYlvZTEc",
		@"mTalGYQjfqjimUEOsjWNmHRaXLWhAOAQAEJKmdWBidjOtirRBiWRQkpCPvDxhVAjUGBztZHPqgjiKwrRctDysgZbbDcFRpJgOFQANopsAECsDRoMvPqwydDeRaGDZLnBlZOjetOIKyvmcbVt",
		@"bVMowJSQcTIORtKTgMXXpvtZTTPMgwDnggvDTKYuiDmHEFYGqzEWgvsOveNkRGlpOoAJTCjRPhPBoVyGInZwZxlgWZviBYewyubazKW",
		@"MpGhPxIYWkejskcZShevhuLOVLOwoVLbXsMMKiOcAnstXOarpQBzVvvarBCyYZuFpDDQUTJhCPuhOHnfxisQYbqFgjNGsDDvcCsMC",
		@"UUuDRVXZuvfaffjptUxmevUhAMMUvgZYpkJUYctxYjiNKKrGdewDHHLURBXgtddintCyxscYKkyjejCBiCtdxwsxSOciAaEFOFgzjDbiGgoHwunMvPZnOpTlNEzBRRbUPCpJyogezZoV",
		@"zwFgVFjEJVIECsoczkbVrFJiqMpvfaMNUUcCnJmCoxMihORWASQaQZSnjnxZtJrFCkXTLQjZtFsandeVPcJEArBChTdeywSKJZXrg",
		@"ZHcFLuiMEWjkyDTlhKylMthOeHzTDiFIKVXIcjDsfSkzTohpxuttPfNoahFkgLzrDbHrxmmJDnAaGSuNTvgUuzqBKJfRlvorHuDGMDMheeRQl",
		@"mQImvFNHZQZRkYcbjYutppECIZPvWLNbjZjBgxpYXhsvOFGmniWEalGFlMdXkiErlXPPubQYWwrRPrUiBTXacEMRhhEwsxqvTyZMuSMrFAYwCHyTvmBWzntYBtfSnQzKDzCAObd",
		@"vaCMdhaHDqOrHlVokoTjLCWmJNDGHQKNuxvLZqKSiDmqujkXwFdoHpxEtbbxIFlqgBQsOJajkkGBcneRNJvNVAPEmSBpsgPWwgigauoQdZizMYbjSORJJzWFlSJILmlecTdcYiC",
		@"BIpaKpBsTOTPBODmtdmWsjDfEmzmIgTrBpXJtuJbUeIHqlYabHfRzrqVMrOxxflZtovzQUoQikLRZEqcldwtKQWGyteJUPBHJDKmdHwmMhlCKQViw",
		@"abVWutUbWimABveFKnnHFVrvQRbjgkQtFWmXGhYTxQrgSrmzXwlvQCRlkcFbPSiJCWmwLmHOVCuZaLPwQnplRvSnIoNwLfGioisPmmfkDAxwAMz",
		@"fDDrFsDIbNMKfWRttBgczqDviJycAjkkveQSSsVUSfSmHVwHXRyHAHXqXseQzjswcatRVdlAQKkPrbSYxduxPBunCZCxGQMoGqJDwjmbJVIiWTlkRLPURa",
		@"eDHJNqbLknKzBiBTbVtRtvowKsrSfiPHQuuNzvhVKUhOJIpGnqpRMxcXjjszUhCMtropaierfEUykZXMHjYlrIAabKeFSqeWbaantm",
	];
	return KftZeRjBdNgTJXsVffkg;
}

- (nonnull NSDictionary *)OizNNNXDJybONQwaUJev :(nonnull NSDictionary *)RcEVgcpQSxkjGaBKTSbXDgHN {
	NSDictionary *jGbwciPpjqKs = @{
		@"ofOhsmcZQyfFwYIwJeF": @"gUXKHsHxItKEzUqVLDTwNxvJsMHBKhzLAUpbofCOVrHMixSNOOtpRldUeeNcjyPdhCKLqwndDiOaeKZRmXTRjHIJhQvsMXpoyFLS",
		@"NDgdfyydyhqmStFXXSotZZ": @"IBCAJwDQZqmHVFbClgGrctUXtWOOEsSVOIxvLGoUVBLfuCgrKQZVyWgTasPyeFCIhPwcGWmDsRVtRvzVqukaytnBWBmbTPIHwmsilEXlBhEfWEigPqgGYRAneHxXUYFLwTvrVeCVlfDEJhdzXl",
		@"GjAWPcyWtJlQSEOSAIkaN": @"wckZZakeQOZVwFYZswItwFkpxdLoxapqnzzyornNmtzOidQaxttAYrlpBWBlTSmxhoQoCOyqUteiLSfGitoLJiDEpuhyTjfteZMF",
		@"PJnJbwTplxpqhcPwhpZNneEe": @"uYjPsOzEykbqSHosfzWfoeVVEOmfbkXdCUpaagZkcEEBiAvuEjpLZSPjAHpSDJDCvSiPxTRcxKEkCtpYurSETbwzljfATKjkxCefEBfRIvXzjOpeIE",
		@"EsGlmqtklBZVoWjwAqQxU": @"wznoMLrTkTjRDEILDFrsNgpcULwVxqTduLljMhFdKuoIUDzlZzHOeuygTuVlvXLSrHpKNDtzTSdHJOSqsbeGnjzfFcADVskKnRfMpkwIdwBndhoATKjwtfoqIeAGNIRTTAmmqJ",
		@"CSwFEDwlQeTPWjklnrOhBYeh": @"EhkSxGboAZbSBaXGCWSKtIaoVTvszLQvAFqunVJCPpyzVDlFaVMEVwwMdkAAuzymRRDqhjrovliiNbgfbwhECRTCNpXPoFeFpNKDOyPMPSWtFXxltFdVihuHNMOcIuFCFLEWfYHQ",
		@"VfgmoqVPCwyIA": @"nLkuBnZmPpxzQcLEoiJnBPMSGexcUYmvAdWFdkJOeMSvNXkugYfbsyWKNVVZgQhPmNLbJeguTMCiRemLaMGtgPfWRKsQLjIprAbjwWSiWsa",
		@"MOIWDuSIALcosBCQUMUGmYJ": @"PYdAeJCIYrbSveRJswRoZTrDdGRzDdUTzJYzpgQxZsbtrcDSWfSIrUBUpwALdcocNzcPzaCdLxieRBzisJQtEjhsoBuLPbppLlTVnzTbiFqrCCkOQcqMOUUHlfNjEGZbMdlOVytJewmOsZjLJo",
		@"BYzWgqEmKqLSkZg": @"BbxMhDEMPRMijtNGLfbIhJnchdVfnvNPgJQTBWpoMJTSKJwYhDMYCsXbopGwlyViFGenJXaEcUDSuNzobvGUHSmpKnChSZAZsstusmNBhBNpIrAWANMLTJKoSQZOZnGhiUJnPo",
		@"cHATfdNlYPOBLU": @"thWSuEGmUememKHYUpXDUQAkuszZMLIMNHLruomfwrnxGQxqyOEjThbzEYhmYAovTWBJmIsMgxXPVGLSOhMfCmBLoDadqOgmomLRPMXr",
		@"HHEesBeSFXWKAqzydugY": @"JeDGsUkoZjUqrLcOxXfcCGuZlZChFpfdsJLzYwTcdgcDjiIcjTKNUcTSWXiPzsFhkOPiegoxMQCluztktskGNhvPCjXioUdAEGRvVyfB",
		@"cJekFhafhYspALtj": @"SxbJddmZnkCmooFDZwhMjnmsysQxgsPhEtuOrABqnmnsLfnwawvvmxEFRgnaEqUfEqeuWTlcmGGJAZrbDDcyMXiKOPsJNNWYWvPjymQJCuzjzbYFlmJuoNRDGZ",
		@"twLrfDBxmGk": @"oTaGjFmNYNzSZdnGZDSNiylgDiZLqqeelcHrKdztucpIjGerWajPKcobYnhKVjxpzvKBDmFsVnysYmEBHVLFOAmamDJmBWbfynlgToCdTN",
		@"xKuWYmiqaHq": @"OsHfSCbjpoBQmChTmMRAVfMzitwVXiCDpNAaGOgJZvvJjEWXMDOyXufHPFcfXVSAXDHickUAZsQyrVOZsmCrPsFoarVUkdwIEvHbCiqXZjgGHkUGqHnjYdynBLwGpZjATx",
		@"gwwEwalTvekXaJEhlAWLQS": @"rqyvNKJyXRGKNVHAZVVbpZOiRIYshzIIlFbLmKCwnMuVEsBWszFZsfYgjFJwUUXEnnJEUDVDZlTFPOnGwoLQevkQrHXKPyMpAlQpLvxFI",
		@"sEmWxslzByONbXLbhLpKIPXp": @"oJYrHsUIxbHPxGamWcOztaIRXUBWQfsUlNwfvrXkahMNQCmHeXXtodEdbLNHpWORJBZPgVDZrIzWHXienBDRSarYkunzJdmewpGgUufzkiNIPcNdlcJIAilAoKZIvjCKfXdPLVZBWNaoThNBFZQz",
		@"QFDiOlRyjMjsfZqDjECge": @"TpUIFbMlakMADXDPkwJPlOkVFgbbzNSeMGkCWrErtGGsPqxePBHeQTAJXDIYtHnLxRZajiqLosFJfAEMKWeEaBjAHRxnadRlrRtDWFYJnCgwiCihoMtAxMdvMqbaGanCNtLkMMKUMtKihc",
		@"wcYptXxZTrWhzzbpybIwW": @"fxXdECeWxNMqVcrkTxsPrjsrvHAEkkZrHVzqfPIJObFYYOTDpuFevSUoEuoxApXCTjIduPffgVirHwVuMJNsdnMWkVDIlBSFuqJaGFPYecFIPapEmKJNHmv",
	};
	return jGbwciPpjqKs;
}

+ (nonnull NSDictionary *)gqBovJDIgIRal :(nonnull UIImage *)LEvUVSHhaxvCM :(nonnull NSArray *)PPdSQUadCmmzqduV :(nonnull UIImage *)PHYdxgQzgRjQzqmOkv {
	NSDictionary *PxpodYXKeg = @{
		@"NVuqDmEzBkfVNGvMfwsdz": @"SvgKznOxzcyDctsnzAthEuqhSFDESjvmllddywemCPmnPTCtpPEauVMtNGRsQOPYLCFQfwHCMOXxLqmRIWTIhQaxlvjoqhnZTpsPQDrCYzmmh",
		@"bvdKBWGnjY": @"hVvDfoEVoYTsYtsxlTHHFXscJbdUBUWJUEswRDoIcBfMtHRbNbvTTPhsKLUKlCAhfrJWwOhBWCbluyVuPkVdWSCdhuiPbopEubYCWqijjnuiKXJBgjAtGKQXnEouvqhO",
		@"VWDGrRkWnR": @"OvGBuYhnqdiKnsnHNHoymFPlmxbEFzjRBEyjqRyuYFrtzuCdnVGOWtALyKyKjXSuystiMTyOYIsoOrdfVDxuqgFJtHdaRylesNNEpZbdSgRCvmDlEdGTgFDNq",
		@"aXiQnefjkRuISggEELroI": @"NFzSNvOTZtJkvRPahLEAQXshyulTACNdLXpcbbrfDosyKYvbjOpicHMDNcHKXbjJCzizCMwtpQOAuvDGXhStofKOEyxPdbOywOEdfRirEWH",
		@"vQCcqXujMPhtxr": @"jSkTnnKrUutcuLfLAsOQHiojXBvsRTvyUkVeprbvTpRUbHbjFvUDgPndjUADEDPQNnzRYOWSrOxMHyxGwlNZyJQEAPUEjaeAfrLkxKPEmhAwYGDtvdVJUtYWjAWxzNpuh",
		@"vzFGuvidenlhucqz": @"tvrsWNrukrMesVAsHweVrwQVVssISaMwtPCcaAGJlYfbocjEqAvgMIsQXGWpBQkYAbiBXYqSbkGaLhPFrxPpfiyttaLOpYYtMqjOcdoBdxc",
		@"haVfJYQpJNgyKbBbeHgiYHC": @"RivHZqOTuCxlqDzrXaSzFoNkpqxjBepyYsImDgswUupdYWyMHgMGerqPOrSrXNhIQoWexInKYvLumNBvuAXIAZfbzQhWPTeuRmizNEXShDUhwdxQLPcGVBLdTrrUYdofcZC",
		@"cQRMIqYJpDotACMxLT": @"rcdwACiKwxEwDxcfvzDPEJhVNvNlXhieloEzJKttqEuSMBwaFmNhjLvSqQUwRZFfOixlMfkvxDuJqtZIDXRcurpwcDdcatFdocggdcMleFyLFxwgMlYCINHSqopAS",
		@"zhKORjQKGFYD": @"cQnEEHaZuqmqeBdzjmhDZxOlRlALyvBZzrSFINpSPRtnuCOkluLkHSgfNHURAvFzXfasXRGczBTJtIrYCuvzrIKywdkOicxUdSNstEhKvckIhkNUXfHfhTmJNtEPDnBNRAtqfc",
		@"ABRGJdmRIlw": @"PvRwaSdknonflPlJJwYLPThnatGMGZsavtmrJKMsDmYTbhMTAQmFIYlsBpaPMztIhMfqorNIDIkngXupgSiIaOWNqbBVEzgXEsMBaWUlYtGBZpCxbZKRUYjMU",
		@"WLlWHoalNUuiI": @"HcuflwMrpHPJbvvzNgfjUIQbNnKHmgocndKShrzqAYRZYRnBwrKSGivOviLfYtRrJTiRxIDRcSLxwoNnhwvRXlcwkquKoeNhmpOfzkUhnBmIxqsKYEqVHRBynwvpWyrObOq",
	};
	return PxpodYXKeg;
}

+ (nonnull NSArray *)roqqrxroMhBERtRqXtDFzM :(nonnull NSString *)PmRttMPmfZTYmKmYzcoYZO :(nonnull NSData *)uRnLruFWSkti {
	NSArray *ZtVjrYgtoECcyFQl = @[
		@"NCvlROfXjPEwYMSFaxoloDMtxIhdhagkeqeAdYIEwmlZNEbwLAaenJYOluTdnfgzxSnIrGIQWNkzQcvZceSdqgJfnzkZpgOAgKGGGXEzJWnMpZazAU",
		@"OmNMWIeYvbmLXoZkvOyaKbJxhwunJqRSdWknzgSQZUISGjzBoejzummNaaUNcdikSIvEfExsPdDWYJCfXPLZirBwAHhdmlqncsYl",
		@"qpDrRwRdkjseCftkuwDmoqaJZTzUqdlMQcZCGeKXKpQgHSjGUDtryjJDEsWRjPfLptARfZELKYRMYQFmkzHpuXGbXwgBUyYfHPxlxgKnlHZKzjpzsUYsjyTvPtXfWOEldKpnFJOjDjs",
		@"eCsIthXQUqyQwyasahEbLLBfLpsJGvwVqLCehUcLmldSrsbuZdLkxBLBWdslgvAAveRecjkJHEhjTOtNVzPQgDVharqjPjDJBkollJQjvOWFKVkcvqCqiqdGBdpCFyIXZCdsvHVzXabU",
		@"IePNiiVVXVCRlMixeINvDBQAlJSrVnMdRkCnvaSgxiTWIkIZsnJSvfyBYfkLhxrvswdUwrdoewxtBnleXTbygLAIkPkKOunMuwrLEslDPBOHNIF",
		@"AeerjIayvbxOAAjRxtRsSmBrqGVjdMEPNTxQUEsIvTgxBybipWOgQQeZzJbqEVNvMVRxwOglHjeMCadBjMRRsqWYNEHqfZBRhItJuilXufeUPvg",
		@"FQeZRrKNkdcTfbdzmqfefEiHARkLhuPBAJiboVgUKwHJdAxeXvsxLgatLKavZhspaEDuLvgAMOmRkCIZtfIfHlxJguyFVsMSylEQLbPNffFIViSAvpkoYVZbPgERVZniS",
		@"cQMONOLEoNLvsykcqTFIhXNJkmsFBtoWPyVLHnXNQdjpHPvhsRznwktsErNtNKrycFXrkLbyssIdKdQlySwFfWkmlUmpkQZpoNJLKbgcMehyjhFceDjbD",
		@"txnLCiOvTFgUprZwiaXjwMqshaUPzjHMakMreTvxCgOnyuLtFoFOgajxNNcnhICTzlkluWvUbJVtMPKCSNDvfjITEngcAOmsqcInStXTUrJcOzOXetUjJN",
		@"XKEHgTwdAjSJdqbEfGJAMmgorfgfvIZidMaMyjvAhDUosUNZfzobXhkyXTCJaegfvKRjPnTQSrlWNQGvkohmonUtZQUVtmAMKfDsvYcbuHfcABPMNQpwaPtGoBcNHZrWUVxrxZLXWgg",
		@"vbSofZlshLzalfPkioFmqvsZaJEiuFsJhktXDCriNdNBuiCWPwmJshXNQbqrSsEPgMLFkRNDZmuievbqimTliGJSpPLnpDRJPZXUtNwSHEXsbimRFoSBKifNHXHruyafYkuQtL",
		@"kviSOzRXOMznktWxPCeIDUAvZiCvsmrBYmtpkgghIUkTINfebAYRKGdaxiBGMCSOLwhPopmQbyPDaFRhhnqZcsyGuRsgmSnIOTcEFTAmmZRWsqDVhZLpXnqmNtRrrSzeciThIxxMa",
		@"TfUWTGUiGUulLyMDGiBhRrVXIzrpIGJLpQRaXdOXsepiLoBnVtwjdwHnPTvDEOSImVHvESVOvQYkGUwiRfWcqagihhITKpaLHKrULwfDNJFPpLMC",
		@"LMjiTvnhjwUyMEEGMATnbbGFRVIfzQGhoHGWDjQKveNboZNccbNXrzNIGDNtXVQaPvspiaeekMjAUUMPAMIXyaKdbZFHlehkFsHrfINHSJGPNbrLOttDyRkONKLrBNHPhGVDydXvfgEoP",
		@"KbeMFInjeNUWvElqagXgnjxSaakcNmabpaKduhEtqUtSECKMAnyKGwOhQEnDQHQDFYoYTEtrPyRZRaYsoEIUjQGkpboaDMWWETXPeGagVZWtDrtwRaJUpeqnANZPmAe",
		@"BfrbBzMnPJuFClFLcaFPbITJduoBAelWZpmAxIUeUiOdkppHWgMCRVcXSIyuXbxbJclUzjvhuawoRFMAlUHqsMxzKnRBykBAZyGLZWJcpMzLKWtSdyaHrGseIZUJSkJeiILRvydywxw",
		@"mFJaSaVIbkWeZnoRHBSaAiLCUmazjULzZxvzbvsSkFaKaTxVDdbLOLOQXiwAXzWIpqTJjtmFZxRBpNAwzPviePdAVFJoyMOJCLQRBMnGWRbDwaWVouXcCYaWZWZmrg",
		@"sPotuvPdsjuMTriVkZEylyiXImTYVYaTLpriuKeSzoYjuRhEQUdrzcpAjqGAFTKytEJNRgAeuEBSDdOrWekxFjfHurBTHBxjSOCuXdVQBJNgLgJTj",
	];
	return ZtVjrYgtoECcyFQl;
}

+ (nonnull UIImage *)euULdwACRRtwSiCFnQxDKq :(nonnull NSString *)zqEgyHDxinLNzNW {
	NSData *HjtteHOWQaL = [@"UJZfZhxAqLzpBExcZUxtBfjiSQnYDRvRjiySnEqKHDoNoaBaDPgeTbkZCblPzCUOyGyhiEMJXQgstGXphApElYIyVsQCFUGbmqKklwlVtEtBSWUuyrWIXEmgGnDUYNyXtVhhEEzFbhtUB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MViIxUwgEnPcts = [UIImage imageWithData:HjtteHOWQaL];
	MViIxUwgEnPcts = [UIImage imageNamed:@"FCyXhVvhgIYhTTEprctLvmjTogVvKquOzegNybCmrgBkPrtSeQJftUXrGTlGpWKlYZjMrNvElrcXMLgJmsayUXIsQZpalKRdvSXpXdolJojyFMyTliqkcEmH"];
	return MViIxUwgEnPcts;
}

- (nonnull NSString *)eXysUEaFQKEFoRFEVsahHr :(nonnull NSString *)ONVbaQSJZf :(nonnull NSString *)pCOsPRGSkewxDa :(nonnull NSString *)hZfGUXdyckuztVTvT {
	NSString *JNICvrsQgHxpWyS = @"fdNqgMMfkKeJmhZsaezYpgCxCkVuOxmfRWipfRrHvQyORmoGomEPEJDXgoqoEPitWNmiTMYFPEoIoIZRJuWRmwFHzJSCqbuHLhpIfpmY";
	return JNICvrsQgHxpWyS;
}

+ (nonnull NSData *)qDiXYgwPFDSmhrDGiu :(nonnull NSData *)etDriWZpJScp :(nonnull NSDictionary *)tmXdVIiglEWkfzNclb {
	NSData *hGGAwoJByfAgDMxm = [@"VXxGHyvsTtekQYpJViuDDdWnbNiBawRugoAuVobcbVZKAsNrWYunnQvLAmeqbdDSlIpKAafEJdsyWSHgjeUnnPFKvazBIdrERkTwOetiDyHNrNnqpakmJxGechQCF" dataUsingEncoding:NSUTF8StringEncoding];
	return hGGAwoJByfAgDMxm;
}

+ (nonnull NSData *)ZuTpOHqfgghIcI :(nonnull NSData *)YIPjARAzHLkZKBhuZVm {
	NSData *NkIBLXIWCnoGapMntcQUcAob = [@"fmcpuxMJQZPEIDbwfiDkqalIAcMvMcAvHAuzpaTqSfCoyvxqpygZgUjvaupjZdrPsLmQxrZYcFPjuFNaUIQEwEFLOzaxLJKTNXEMciLOTjfxjJIHZfhzBTeBuEiVqaXBTPSj" dataUsingEncoding:NSUTF8StringEncoding];
	return NkIBLXIWCnoGapMntcQUcAob;
}

- (nonnull NSDictionary *)rELruRqlJXSadLUlJm :(nonnull NSString *)FgIUYaoVNkKE {
	NSDictionary *AJuvjoCOniPxRRyKTe = @{
		@"axVSpodMTSUfWatWOPReNh": @"mFQwFcoAQjLePZIVBGXxuCCrbBQDqNXnTkaGuCVlCTibqWkZqzWrFlMjikGBhwfEnNSdmNHbLMgSKCRtLpzAiFQsuyTuWVEyJLqARHXwvNTtSso",
		@"sjfEbHxnhrktc": @"LDioEDwtCpLHeCcnfcXnOasnBneJAZCKyeORygdCCnFMSBtkYZTKXsEOGEhdRxEsPdFgfGVioEqkoInBGKJSGtnWKjMivUHbYpGDVyUCnDqf",
		@"izMOaiUIWFjduTq": @"kTpvmAHTaZVnOsqmnndxQlkKERahUkEuGrgxTTRBVhFkItEWqTVqwOCFvdiAAFGCqvZkhaObGPFegtxAcKCTnJZtiSQCRHRbrKAYUQsJqzhZgiB",
		@"yVBGWjBBbSTeafekKjlkaEAX": @"UcNXjWSWWWJeGunAUtozzjbiAizlNIRKwfTjyJkyblEUBPiEhGuOZXVEyrQDVlnJtwgFBYZVsrDDuAfraeWnZgFKMffSpLxvNuPYcvy",
		@"RmhqYNiwaBNaMsVMriysO": @"InhcKlKcCtixETrnWtzCrRrdzKvLLmxZfxfsqruTIuTCfwCNGFiHMURySeFgqFFLwcHNGvuEoiGkxOEwltLFmYLzEdQzCrRQYpxBfjkcoalJxziOoChHwyNAsqLnriVmIpwGBRDnpQjoCUqSx",
		@"mcOWmXRExqtnc": @"lUQPlGzQlMnryqFOQGIXPGeQVvbqoKWipyDYmeyWKWEqRsyqxZzLRomaxUwxLsNlcIoUgUEFaDSSickzEqHuFqlZUnxORcemxRXWzvydkNPiThxBz",
		@"IEeokCJcEasyVRVOCPUf": @"HxpkNANqBOAoVbzKVNXyLPSpdIuHetZndTMmybwoTDkviPHKzigGBUMKuttRgdeYUTUypttTLiSliPybRXnlNcaacQqTIgmLzljtuejAelwbQHzUINhSc",
		@"geTMTVKKbEcIEUnCdu": @"xmJkFentTautYNeVhMrbdzDQzpbobajFXnyhoVAeMgLxOMaOGRMrmOUBsPtnrBjnGKKhfmsgqGZJfpiLBreOXFNfITJouToVtKWPIbUHoPxqAhJPNFM",
		@"CHjrCoYgIWcOnhfCuDngoo": @"lirKlgxwnpeduXzQyguqOyhUFeGJZZsXBrYYJTsAPYiosSDmJrWCEgXCHYznzdcPxyiAFhWNFXYjUQxFThOPVOImbWZtyVJbVIADkoXqnLYHWnBActloB",
		@"pPnuZdShHMTMGku": @"DbcGvegDPvsgKjRUdWICdwVllRwdpYUmlWmvTAIsuUeHESYotdwZLQPUHRdBeXnCupFBnMyndIRLsSHnCvuFWVHwXDfzLLUnGgzoAekYUZPWoOzYQF",
		@"CIBEsPtcuUjTReXLCW": @"UWyFRJtsFozXkWmjpHfgKgeCVvjdDcOQJPDlLHsWaHdktzgidCkAJxBvcmdBotaerzpQcHvDfrtFmUVFgVmTIsKJvHzjjEklRrMTpwVSZMHjEtlsAzDolrvEDVVsRGBxuPzgcjCNXpTIynTjdu",
		@"FSEJagIXtqLbhq": @"SYRrAFjswRkbdradUPFYXyyMftmdMeOpncndAgLSJQVDlWvNdHEojmclXhegLdeBlzsCmKfHgVWkNksGFrVIDBipwodKTILbUiEBlTmkmAlIRswBtoyJHKWcmKsYyKhBKYwlSEgstMksrksUNAR",
	};
	return AJuvjoCOniPxRRyKTe;
}

- (nonnull UIImage *)IdPxbuKutiVjZDgDKu :(nonnull NSData *)bjzVvugPYbHs :(nonnull NSDictionary *)iVZlrIcEtsSzsPbuTOeQfU :(nonnull NSData *)ocExAPerNkCUoHJpxgvKHIA :(nonnull NSString *)PBBkPSOypXGDCDvcB :(nonnull NSData *)WNRFpDjUyo {
	NSData *KcqnKYEEsDbwaB = [@"DjAyeSfEMhLmkMUOwCzITpgYFKGGqULFITxqnHKxmbSCBaYObCLQoLqTmvIPiUenTWTicIuFkphfUEQnXOauGnDfsJyuRHFDMFHIZm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ApIzViaHwrmlx = [UIImage imageWithData:KcqnKYEEsDbwaB];
	ApIzViaHwrmlx = [UIImage imageNamed:@"RXBlUbgLOWnKASxhGFadjPHqoIFkLwraCdGWbRgDDjNZsMRwkPXksTgDWgtXvmQdxMLOziqbGbWjmvatqJuNGoHbLPWRPVoEWHevnnzfEIwzySEPKtnNEtgHleVS"];
	return ApIzViaHwrmlx;
}

- (nonnull NSString *)xxbvSpyQLiig :(nonnull NSData *)ihyNaZCYyHVTWnZOwiGoh {
	NSString *sbciSQvKFZEbmbhikE = @"SFtTMLwCdQTDDcMZVfMbaggfeRbESizeojbOnLezOjbvsGPkVrdFledTdxMMAGaGDXeJIXsytNeVZNmGKSPLVwPuNdIjVlXwxHAzQJb";
	return sbciSQvKFZEbmbhikE;
}

+ (nonnull NSArray *)duVzPaDsAUTQXl :(nonnull UIImage *)FCeLIgMyIITbzdNDnTyxzJK :(nonnull NSArray *)lUNIDKsMKwYMOuSWSaj {
	NSArray *CPSDYsjOQsZwmlGNHXsfyT = @[
		@"vLIdlqeHuWptBOaIgBZvGMywEybWBWcskbBFSciSAKtCJVQTAwgjPFCXkdadMsSodBfOfdauFtpxKBrAYeRKFXmjgAlUyDkNmFQKinILdFyEuJUxAUhjRewYjVZKzqRhaBi",
		@"DlyiTJoVFXAQmgFUEtpdPjYgZRMYswIvbjaVznzEPMsgTRsSJQsOawRTpKEDXfviAOnGLJoDQBrahAuUNKWtyGfoeLJGujjlnyjvoAALwCLhvuVkaighnHKOWcpThTzq",
		@"MyHGRzqHUAuLKHufbuBIaRWwKyTIQIOgpgmvzHgoCCbKqixOOjNBOAQMcSozKliXrGAhBMDRBlKBiNRCAcsTTpqvJaggagBGSFAV",
		@"FUOSPxkeVDrzuBrqBADPISecojVYGUnJwQQvBtKozEFGtyYBoEtdXMdXuyzwYIzvhMyuHDuEePOvxJdWOwZNYpGnVqUcyVfoLawHwfPikgGhZkHtNZurZMWhUn",
		@"bRJaZUmaqUxFSJBVzSCjNgNGnPLxbfhJsgXDQLeiXTbVuLeIxLYfokhopcNQeTmuNFIeKXaDrFMnmfuNyBxOrLrzriDNXAUZLHzvVRJYHmrlLbKNmXCuvITEpWwmFbfsYdozLRGDcRAbcKgDC",
		@"saBXvJJXsstDNgvxaKwwyaTjkyakwHXGeSevwLmLduGNZsWhTNkRhqgOnZCYUUfSrTnDjKIkvdKuCvBHHRzzdlJJIOtdmywkaqwmLwejNuoWXdhiFZydPLdZfEjZdpj",
		@"EpqIhGBPYZWaQoKqxaeDWBRVsZoeqehzgMLtiXPoPpQluUhNjDXilERYQWvOcDINVjPxRUlAXtPXXipOOraSqySBdYXJYqcfHqXBmNbbGbUIcSyOdaTYGVyMuiRTJwk",
		@"ECnJeiBkMTDLJgSsVzwNbVoTqDuhcvQlgAEeLGEPjnIZxildwbOCwRVkTGFgRwOrabhQiTfTYTMPOaiMjfmVoKfkwJjbYFTwVCLzQDzxWUMbOCguWHGrbNVufIOJYQOLVtAKyteUtzBvZQbe",
		@"jrUbVhkPEfftfBnvWoNhiOTOIIsDGiXjVnvcsyAhCWziKfDlRblTFANXGIrVoIayiAPGXnpaJuWwmKlGbHBfTkVxSERCjkjuhyxt",
		@"nIWQwplfpwfHbBiYdKNudRvyfXlLkyAEFWCRxaCnwasZcDbOJfNvuoDFaPTqUfouKWXGmEMvIPeGxFNntXqNhtvOewuyyAqffqzNQKpjYRlMgGaKpcrP",
		@"FDcsClTEDbUSVbIgnTxydbjNmgQmnaySjveYyUPcVBeXPYgflHsAMrOPFhzFJNEspIYHfXHrjMpGVgCcDQCmsdNiKaigfLEXBXrZyzGCLiGCdulCHh",
		@"ojhgzyiodpDdcUlaEBhfKIeDOBkHgpxBCUTbrnuXksUWzqVNbQrSNPYamaTcALqbLzdixwcJtYJUKbyUqognCTqExEHfzsrpmEFkNRcpfzRYObHbqKZJbSkDWRrZtFuHzgNpoD",
		@"bXNdQKcxGAFvJRdimBrIMLTpAGBuDXwKVUFcPLEQHCinNbQIbTPXgoTIaoYagvKROgTNAKXwqwEFjYBMievqHhytxhGVJesGUdxJAsmZjLwSnBbzdojfDAIOfJIdVmNDqbyPQWlaSHXkiFQOD",
		@"SYPErewpwvQvydoXpajFRqpxApJMiZLIlKfhWpjBCiEoijicahYRLSQHjydhibQAXvisaVnRxNOufGixgpHaBpBLXmGKzfPWodEVhewhCNSMFQwNnLMXYgTbaFcvbdxIdfUJltnzFGhe",
		@"APGVYnmSfDbaeLccnyYtytkmVpEtjVDIzhFtDLqoHARTSAXRBSrGoyRaDWsCobwjPWtVqRblVEeGTovTLcixvNUjrMSeikjluzRMqaJfM",
		@"GZyjUNBclIivKdYDrlAypKPGLPHAuixgkHzPaFVdbOvSeFllycQAHNsNgqVJMjaUQcyjPkfbSPmXRnRJuHJcHbSLOKDTilCogeLAQTZZLlHYbf",
	];
	return CPSDYsjOQsZwmlGNHXsfyT;
}

- (nonnull NSDictionary *)IgfgSGcdWWkZz :(nonnull NSData *)EqtknfgbYLPxkBW :(nonnull UIImage *)fheUURAuDpERDPGxDihkWX :(nonnull NSData *)ffQExsBLRmlf :(nonnull NSArray *)eUoYSRWqlcOZVQlgCJYSw :(nonnull NSArray *)lfrWGSdQjWXthYGu {
	NSDictionary *OpVbaeoYyVePGFqMvBxLnKBa = @{
		@"NtdqMuGrwEUAxDujAZC": @"yORNyAZzqoaaQbzyxeBaLpdhwigCnYsuicKjcEleWQpPSAONDOPvPibqsefFHYAYIotbxbYwHmBGUUYCmMmitgJCQFKQCaFrvXojBEtNeSLhlQORWvOiGCDtCXZud",
		@"yqXQgAILRZlLmKPLPEhmEi": @"NnjaWLkamSXhKOKJDBKXtayGXPrXKcvpxxOWElnaqgWiplAKZSSbomaSnSGoZivYtIAHoPUDgKmNZBFjdIOZUfwMDaHCKozRuwDuRvZLfxgogIvLSzsJxTSmcEWSWcWSeXiQvKpCxtxsZJF",
		@"mILbbNYXpfRjCe": @"JauZtahovZMPsRVyKZBiSiEhBeJxeLfviBKNtXgpweJnidSxtJdLFLrlLIQDflAmpABhdxdLQqtzjlfxLScFodICbbeGykfmGnJMPqvGXuFYcUce",
		@"DuAVtAXdeJbBWPqh": @"RZHSThZUGAFZreGxmrgWKfGQlCnCQYpRUElxxLfNyieyOxSaEqkHZVmgoqDouwEOZaULGrTUZBpXlFsuWgNeBbJLnoeYsYtRGDlYktpzq",
		@"eVVeggyfNXzlgYMLk": @"chWPqYwAguPtkLzxnlCuQgpDWKDiLhwPCZtUKSITwQNegReEQjRritNGAYkkpwNpbeXchheWDqyUQJCYeCNZpMsAoXCwLyOuKnaNwETSqtZZNhhUmKMuYycXYhJBYFNVPuHBgqkxQpgLWh",
		@"xjaiQhEgWPWBNiyHPjtRdz": @"mqDDAmJYTKVMbywJXxkUuJPfGTjAeJBANLoSgzpmtOWaWssDzOHyEjvSUgjbbeeLLDMgKvTGjDOgSvYMqsdUoVWzmhNeNYPCLquLZcUvmXOclqXIrpxRIRHdyFX",
		@"kNspjkruDzGFbFLlbEvk": @"zFarnrPUwpGrrQFYGiexUvIZhgVzmJgikXBRhCYBqbLHhDFWSyClOkPmhOqpwWhRueXLXgIPlpdNTFnGGeUXDeYDLNUyaCHgqAeJRYwtVpLOdKKnuGmCSkfuzJadxtWaUFOtMdLGMfzU",
		@"oDHvyOrhnA": @"dTMQAVrNBxWFKZUoElhZYhMKnqQKLpYzdfFuJElzaFDXhPdLTcosNDVrSFkqaKkhTSKMdmeMqKCyzlOIPSHgKRjvrqmXLavGkdHXgvQgYmpl",
		@"qVwMhHQpzFwtIp": @"uUGNNndLfdoCikqVHTbsjfbTbMxSdFlQJDvhSQuPzEKNGTntYORtzTgeSjsEyfYMsptdDxZsJcNIqXNehWuQKiNoXtIhXVQgfgqy",
		@"sLioctrfEOF": @"pZHfUloTQeYOdZwPwsPhoYTRZKrDHhyUqBjiDOuYAqUIuWITWpiOWijBFyVNQNgpLdyLTCgyZUjwfBAGFWXDJqtSZiUWaWXHDOoujlgsDtpKFsGydprNiULhtlGtlzbhjkdEHDCzPYtSFYJlASd",
		@"KZIFRImuAYu": @"LfOJYEvqJklHfBUoxuXApFvTvhMPimcYPUcTYvAqCEsMWWoIMbbZcJNwQRanBQaBqoTRvYPFsmPuIcqFHldgeYgzdlbEOjsIXMsIxdmbNjWcmNxFFzhXeKRJWknetOnmavloFluPLNJSCgJsqADs",
		@"OUgAgTftHWqIDgoe": @"NWBNsLNmKLHZlORYKOVRYGWkofjUWEkfqmFKzrNUeakJVzGcVqHxFEXocMLIbTrLQcIXHkmtBXKhRapVdVUtuFXayhVQKXfdoXIDpfGoPJkylfolaQybezUQfURwYZbEcKVIxe",
		@"TWkioBfjhEJgaHXt": @"LGRsMFBaZEIVbpCWyDWqZnRsGwqUOQykhzcbWgAlPBXgzeSTFXYuhsyYQKPsBIFCxzVyFuYrAgLxoKAMdbxPleTkRkuFZWIgLVehRDlrYBVqsaFAKHYfZkaeUwhvfvvcZGqhSlsanjhltrj",
		@"fStUgiGFOZNCILBd": @"LIlmmYYtaboFqKxDqfuczsjGfjikihaDdShjnOtXyjwZCjAxPkhQJXuRHtYoNkMjTZbGfAmmqPYxcMKgNmGyMqzfwsdgqSuSYaiYw",
		@"LyKKgeUZscpnMTt": @"ynZpjocQixURkwWNQJzQjQcqVusFDOSZfzoktjBYPIKuvLzlcstzszEFOHMJwmYYqtRSDFgNxCvmJmGmjVyAJZCDlRNyHJgaBMRoHKvahRPuiHfLYj",
		@"DuwFFmYiHOPOzF": @"cRSoXbYWmVftRtueznUlVpNQIUpHKVDTlbYnBSlpbIFcIVeqpGUIvPCCYXubLEhoyCsPQIwJVbFfzaSymsqbkXhrqYfuyVFnddxECglQViApGidwN",
		@"ySVNOkVGmSGiJm": @"oqSghUCTNXibCsccFjWWGHweADbpQRPEZaWNiSPJhFcmiTMalFazbKyDhLqDUAhZtjRlpsloObXQeFWEJJmllPCkyunsjDRHcCLwbaDzayjiRrECQFgcvSBjTdVGXXlQWZI",
		@"xVQfgNAUjGJK": @"aXvvZmwFYHcQiDgPrEYALrloEeoeUlwxrHLtOVVdKnMeXauFjFqNeDigzANMMZEFvVKOqjfOMNNxIkFsREFWRCAVLoVcdTxKQfyCFuDetvVHZnGQxFubuaFJAbVbPxfipIcFZmxoFORYjRqxdw",
		@"OvimMdhNzTpd": @"MTQPEViCAsxLGxJvpxsYDruOsavXFKjyKdPjFzbSAZnmqeyyYoEtCcuLTCpBNtCIllIEpxhjKbdIvbQvYIlNnfVTCqsDvDYdNGaNAJTZWnTKNYyGgERDhNUsaMzmsqBxGuEEGuC",
	};
	return OpVbaeoYyVePGFqMvBxLnKBa;
}

+ (nonnull NSDictionary *)CxplNiEusWuyaLsZrUyHoI :(nonnull NSDictionary *)YvPnghkXNjRevT :(nonnull UIImage *)fQkOwUVektEndlja :(nonnull NSString *)RRGcEjFWQEjCTtDcsOIOnu :(nonnull NSDictionary *)ISGHITgCcnmGajW :(nonnull NSDictionary *)ROAVEnnLknKuo {
	NSDictionary *FYPGNEvPdhWztBWzYGJ = @{
		@"qMWyuelFZhkCMvfvxAuBmCr": @"fZIHwJqGAOcYlfbSQqzJeNwPsGxggWUWPmcUBksBgiDlAGGJUOusnwxTlXpUDraZmQgzLYsQmDRyiVBbSmowmRCUcNYhuvpIGAarRQYyTMGJmKuUKMlXqWROPCNyxYFsU",
		@"GtINmrpIszoluZeiGq": @"hTyCoIHNioDAUjHbFbrrSUoMxdKZDHSwZRATtrTToaheqrzCMIyyvuPftMOHTQkUPwHWYQrtxQHWzAofySTbagxgLGjYPtskojOpNEffZHoosaobEZLSTMydhMeKuaBTQSkE",
		@"GJyBdBViIA": @"ZORVWdGIkFBCVkPpJyquptmimSomGxUmsnQyIGsreeCfcklucIdEGHoIMthGoQoeDfnSppXABNUAvniTnwalAnzXByiDRWDpgzqEDfyQLdMycLamVcuwWmtlRjHBvpdInTAlJtzF",
		@"yRGQCQFwtO": @"OfQVfSXukTXTkUnvatjQzBEArHbxPwHOypKiZYoIfazwsTFHFKVFDqtAooixRFkVfZoXolOKBOLBQpDnzAWSkTecGnGwUCVnrqXqnZRKmVmk",
		@"ECXEhqqkhudkRYGvLbfcIdST": @"FKewfYyOvAyltNKKYRoppFpcEWiJlIRyApYpKcYGRZxVVvtWYsySnPfjqGQhgwwoANxkDHbyiFNfZtpYPzixLNNxwctEWpduJVsSjMuRFgmbqzqMGDFiGGvMWFpuGl",
		@"HHYEfuYzyNcyCGTOVnUHGXKY": @"IjRSBkQUAHYoTbSUPLcXeTLoabHFXeSLPrxHAnFgEINezdvvlppSMuZntTVQMbIDcZSUuyuiTXajsXkdbLiWcxeMHQiOLoVVdzjTTMLQpDEdwaDdeDGaU",
		@"FqsSVwmzPILtqSsV": @"tWKtEkYKqqlatnOWAxWxztnNzCIDNcUQgReroddvHeNQJlTWxVocsjXrwytccQPmtTqvNYOLvCcbcenWpmVgjzRlVJtvUPHEjUCzjsMTincLZiNSmWLSyXNbawddREfgjwbFqvqnOmifDRcoj",
		@"agcenMliGVYHs": @"kaKXFDCtkbLsiYLgtZpeoQnswxCuknodCbvQTarEChkpZDeblfMPbIqAJaPTVHMFrDmjKRQbAEgpdRIEcfwDNGUhPEmpcscsEMUQZymOnfeiMsyyEnaisCaKqw",
		@"YdxqjmeWUxJNRQmwFlh": @"yTkyThuvnMAbsGGswmsLGNwwxCwejpIaNIZFQpSiVbMkYpopKioVeqwKPiKUEryFhEQXQdwFqSpeTAtAYoyQQTXjpYVIuLriBAowWdbAkfiLYfpnaASzxQmhaVBSuKfWfVNtBda",
		@"AMrhhVfvqDEljg": @"WOvYsBORSpvOATgkZmawyeFGoOpePEZZGDpdyPqQLCcVWEiywSCSeXOztsgJeyYTDqxcFTkejZapgssKhDGBAgafJYaeKwuiqZkwmoknDnbcHCud",
	};
	return FYPGNEvPdhWztBWzYGJ;
}

+ (nonnull UIImage *)NEuLTAHEwBHENsnMqeYzq :(nonnull NSData *)wmAoldTmgDL :(nonnull NSArray *)BxUmcwQfvdtFhYehEqpUn :(nonnull NSArray *)TMJnGDllrTjlCqG :(nonnull NSString *)fNgbQDYBBJpQfrYyQhI {
	NSData *dYCdwOvUXLBkxUuePlRZ = [@"aNjjQFdEoQAEtUeFMFQuUQwaCEbevNfxSOObpwTYvEfxxHXwdiUnaiHHYqLTaZuGKKtcotCryWKEgftdBexPuikrhndneTRtaRWKBEIVHphxxxCuSKWmgKIhrHFeJMbXtzwIRPojtjEPdtb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FoVlJzsPSyCGVDjlGwaM = [UIImage imageWithData:dYCdwOvUXLBkxUuePlRZ];
	FoVlJzsPSyCGVDjlGwaM = [UIImage imageNamed:@"oxRkFYfYyFcUPYvYNhOfoLRkAidLwaMxElXIhrCWXJhpFOtgmLuTCMwVuvLxxlbhVMTezkkAXtqmIDNonIYmnSvKrFiYwkhVAbuZqtrIhMrrqLCIhFnCC"];
	return FoVlJzsPSyCGVDjlGwaM;
}

- (nonnull UIImage *)OcoCkfDpWVmLuxQz :(nonnull NSData *)PRTbjtnkTDPSvoBf :(nonnull NSData *)HZnWcdOEbP :(nonnull NSData *)NxXkyhPsmCelzsyzLrxPpNTU :(nonnull NSString *)ATUNewwTcPbOLYTrzRMv :(nonnull UIImage *)GvYzTUqLGSUeV {
	NSData *atpeIamFarYCNfjtiu = [@"vRsoYxcEDgHpMgYmdyrQBqkcXIgCsQdwXvWRRkEkOECychMRRUvzpIfmvEoEgPVULmLdurPukXkTaVkbKmabPjJUukeWeDIjOTKwVJzoKKAuMaIcJuCKvnophYYfvw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HcGPmjHcjxc = [UIImage imageWithData:atpeIamFarYCNfjtiu];
	HcGPmjHcjxc = [UIImage imageNamed:@"GyrMTiYNrJYzqqJuIJgxxdDulqYnyysRrhCoqpmQFYPThaUYEkjeYuDXhAQfzySinNWasPNreJZfygQDDzPkAiuhUneAGFBpnRRjODediFLwCupKIivifaJRosG"];
	return HcGPmjHcjxc;
}

- (nonnull NSData *)JmGaocjFgruOi :(nonnull NSArray *)bdHnALcOZFIiqlo :(nonnull NSDictionary *)IKHVlZpfBawdq :(nonnull UIImage *)uionkwxBeRSbCMQtucl :(nonnull NSString *)RVarxrZBmG :(nonnull NSString *)jYakTAqxbTt {
	NSData *HovMBeVyYbNJUtKrgrVSRdTo = [@"CnYTPhhieoqZFlqkrMqbTAejUCAnxYbmsGPVsGunJdnQGPnunmXFzGwbnsVzLxzMOcEvSvsqHpvdCMyzngNsTcDkIdKJqJonCIIahNUZQCLLYI" dataUsingEncoding:NSUTF8StringEncoding];
	return HovMBeVyYbNJUtKrgrVSRdTo;
}

- (nonnull NSDictionary *)GIPUNqYnHLVRPWH :(nonnull NSData *)SxNnBrorolo :(nonnull UIImage *)cqveRHuxniBmmdmqUwcHLFZ :(nonnull NSDictionary *)zjNQaapLVzpwU :(nonnull NSArray *)jDPUrhzCrQcAcVuc :(nonnull NSDictionary *)iKwuVMVHCONp {
	NSDictionary *txmBlPFrfmuLNRAIrCH = @{
		@"YgLhawDOeyx": @"ZyBISpQmEdufxEaWShufkVatlYvcfFqVTEEvzkoRqTOmlcpeBPwzmmOORUFuiuAPXscIKfkWeXyzEJxulYAonAVkrHcWlmGyEnsruZS",
		@"feZMEagrSJRPtN": @"fPgWBZdDCQFIRhQrnEjcgRLcWTxjTlNHbNYsAgNgfRfOuTOKlrKlexQrqImoLhXDUipeFeCiaXchlALopLGsaLKXyYhLdhHXfUWsTAGecAaKMXjUoiDXkDydnTXRqlQbFDsXkQJYUPeLnKKBwsv",
		@"bZuWPokSveqaVLngkkDX": @"YpOpupOOCARybcpksESUXEozDjmWPMAqHKxCFzKsCEVuAmqxtqvqoPMqvtEpnFxLYmFjCXgaycLdsRfUeWOzzvdyIrVwzwPqrBGNOOzipYo",
		@"BxdZDjyBfxLlYh": @"MsyuJErwKffbtODeFhMibwZCXoTuoyKyozPaiJcAFJmSAIUrhDWLIyKfSDFPYwYphYHmVcokcStlMzBZpqkrLccgmRCVPaNEdBaXqmYQZtQzEOejrO",
		@"hDdsJtbXkpofbGOPCH": @"GNmIQIjdlkKXVzJyYlkrVtJwcxdBYeCxdJdhBUgDdsymbhhgKMpvQUUMBgwUltvtwkjPlzINxSlDTTokIeORbGQMLFEDoVdybJutUzIPGJQDomHPb",
		@"NURegYRssZHB": @"qfWjMoHfbshZrjCnzlpOhgeiZpOvnzTuhVEUMtubsXEbUuTlQPUNrqDpCqvPOQhlKkWJiQPmyeDKSJzDUlJxttlbRVFRbSwzerTQKAuaKUqCjtywZkdWhwYiBWcCkDCQsdp",
		@"npbZeHDGLFPTpqxVTlF": @"tGDnCvnEPQYZIbvsNxrpqPqCLjlFcfiKmzVMOVkDVCGPEYGvteVgVUKvZdTKgdreeDMWPXmKIyAHodJdAnHHllyuDILHlOzHUEUabSdAhvMreNuuAokBgITIvZeAd",
		@"QfQKumLGGoGTRTMy": @"LPUAXlScztpFOaTzMnRyglgRqKWMqjBdJwebZOlsSAuhaHyBRPmPOtmbUOTkNynDVezyuDZQmPoqoWemtyumVopfuuOLrecDAYMlIxLVPDvsGMSB",
		@"SPkzcZVoSOc": @"EBUwBVAddPYhFkqomanJseOOdGGMdXKFJxQrxpRNdGGNlYrrCZHapJYpypOpGhcrZseVQZXmTwqgtBiMrXJeffkNzuOXIVccwZjGJOiSTDfqBNMs",
		@"qfimJzceNjibfaPQQstzx": @"MhLQYdXbNGgvAnYSqixLRIPwNUhmnIWUUpNwagXkZCzanrbWEFMeyeyarmfYOjPmKLCdIFBwSdXfzJvtEzlPHElYHvwboaQvaJTqJSjnRdMcdAjiIrtvKWlQbLbeeXtqOefmuoZdhhS",
		@"FRRLoFvTdpAjT": @"OuFsWQEFkAHAYyaxhBmiAVLSAAiNAQQnDfhDeEOjTzNnflWpxJSuSkvZiDZSdgjdxvFsTSnRqLSJCbXoHJhfFvtcFJatgnLsydJhAKJacxAlpPJTfCOfturapySEXyuvEHtvmDHzWcOjKxK",
		@"EndjMxLYeRKw": @"ODGktyCNFsZvFIEiNzHPaXtBesZAVJBQWJOMGsbNoFZFJiCDzLVWxDUbfrZQNWlCjzrqpKJVcfZwmVPSybAKOCSKxWvwrXeFEZwyPnQHwHJUbwPykrNrWELgaGU",
		@"ojfdqNlSjzCIHVxCxXd": @"KZatAZMgAIXvFIvlRkTplmBVTmELjaMOHnsRsEdDdYXpfCGzrUrxSMqiavopGgOEWCYUjvJgcsWPtLpWWwymgzhTsRjxmkVXAOynpBxlrRCLwlFdcsAugDvrpOvxKQhJdX",
		@"kPkYYfPjFXLFGesKvyKPdGRd": @"dwcSAnNuVhnXOtqhtcCdlRzRkyqcebUoLuQMzURHsZcrcPqqPMBUCxmzaWuivhNVZAAEvesksFswwURUaYIhFLfArbYjDFzgclCChVNlxpOArGzrsxWyCuRHHhDAi",
		@"dHVJHoAGAdspTLwaCJkUUplU": @"apEVDhCXZFGsUhZkYcmJIKfWWfdlGmOcmcOHIkzBvsKHlWowikmFFYiOddYJUWjWSvzEBvVsOdUIWaeCOTXWsVQsvjPKPiIHBjKCcmuwQxinZHsmMFcHyxTRwxASUhOgUctFPkYnJCNq",
		@"SJiIDoNQqdAgMGrnt": @"iAHzFyHfGAzFosAQgxYVXPCDUkMKXtzwBqdjVTQIOMSziTzxAgroSbqrjASaegmcCscArRlPIgECPYFgYjuAGOIDGTnxKMSATQUPVKkvQP",
	};
	return txmBlPFrfmuLNRAIrCH;
}

+ (nonnull UIImage *)CgykSelLIhBJQsYbdrwTbNUs :(nonnull NSData *)jCUsmIXMMAnn :(nonnull NSString *)lbxduSuNUpTcMtqzFuGER :(nonnull NSData *)itotZxEWbLkLtSySQ {
	NSData *LWUfDMCSWjqsAugCGPc = [@"GyEQoultjXEuzItYFboJXUmDMqweDyiSGGeTCMgVqHHDGJIyaRtGQAXAYVTbcaVKlAiYYzJeZjGyPdNKxMYAAZZDzYHLZHtweHxvKBoAKsRBwTzqUtkfYXuHnGCmwuTsrepQD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gkbunXZukdYLferrJduD = [UIImage imageWithData:LWUfDMCSWjqsAugCGPc];
	gkbunXZukdYLferrJduD = [UIImage imageNamed:@"DulNAApjfgKAfnbBgPCDDnEqONATXjjtUXcxyatCRGGuujCwKCRInNdQiFsHAwrUtGviFIpRwNLPFbDzREAGvepGRJtsFQbrTjDndZoyFBJi"];
	return gkbunXZukdYLferrJduD;
}

- (nonnull NSArray *)eTEzyjoaCWWNfCB :(nonnull NSData *)ZHESiaMMRVVnHNtYotDJrpxc :(nonnull NSArray *)bPcfIxxYqNeSglxYOKYO :(nonnull NSString *)HkANqwIAeDSCj :(nonnull NSString *)YRfHLMEplzwxHVxosEq {
	NSArray *ueWwcHRtUIRgM = @[
		@"HxMtNCyYVCAjDVnWGxnHRWTltxdFjjDVHnMESBlmeTSRyCaozNDyELkpJjYFteDRdUrtFwtChgfBZYdqtCxFdkWVcMKYUMKQTOPvFynePBH",
		@"AQlyTRGXyNmAfdJaqlOuCYddMPUaFpqiXScdkQsLKhvuyDRkwPnWWjBWTJVKPFCWTerXKhXHaRjRJQkvmCQnYPtmNHXfVBcPwfamrZloOxnASiBjFLZw",
		@"PaNmxOzCdsIOkABfFuuZOxtVQUwZnMzYdmWhdXuNGskdZymPvaeUJRLYkzOhqUIVsQrGyzKrCsFwuVtWsjdaPgKfEoofbFqONytIOoqNMsxaQeMfPHzNljsZPBhjQbYYPUIGxmUFxgiVQesjnHCKE",
		@"LcRWbYRpoibzBAugUmbGBlYrLnjYqcaQshiaxAJeIcHGhJeyQsINWAACoCjkMtQWNNpcjVRWmxDGuxOCfSCVDSvznhoRypfHmznzxnxjLupUDVdbDMryLmYeUYuROyLfDgUSZxhxpFoUurUAe",
		@"RShhsruAteCenzxvvdPsCGZoIEOHKiXyfCRsQRFJTtEAhSBGLfjpElVhwKIDJPofOWaLuxvfnxanlxGlmGAiIOlJETuwDdlglhHvnsNO",
		@"wmDJvxqSaVSNJgChVbFwbokbFIhdSrvFFaYCnsRABPUadWJcvvbISZfiZDcuCoMQEQMxRMatMkoFjBnmeCDbtUDZfyRaWWbgvVIRm",
		@"XvtSwuKRlxRfoRaFvrVhkTLIQEeNyIYGaeJPPyVKqscJiZqeiTjQTMUdaRKVrwBFNerqQxrIualHaisdOuerPyaarXjSUVHlkeqTJebCvnLbiDKkktkQePcFvhRFYYESJnPtZfqUSkgd",
		@"WovrwoqFwOjLAqXcgajVQVCYtNZAYKCbvfwZvHDExWlOsVwtfCKwglzwIIOBTpbWYSiZZUochEEmPoHjfzVSrkRCaggPpnVLtiHzRWyZaBMQHuehoNOodOOf",
		@"DNIVNgnSavancXVeDZmnNchRrObDOWJGVsQtkVJuXVsygCcVAEvSKzTuDajedMpkYnqhgdRrrxfYoxlSJsSJuAtKBOqYWUqZJLKBueZDGeKJZgkHKTToOncDRVVBG",
		@"makWpkusNEVKnDdDaOhSIPHSTXFfxJXPJyzaJXoPWgLbxpznRraInQDzfjcNLdKiaFAyhSihgRBArrqmpVFzepZlODkIZFZBUDtNQAPECChIFbimsAymdZXWN",
		@"JRvZlXffOxIKCpTGuROungQQsiEtYwmGQncXHHkBMvazutMgZJSmSouSdIoEfhMuFEFjXvfsWacKQfgmRSMVbPYCKGKMRxSgsLILKcEhzUQNECEiZQIrojqennWRwgwZAQNbWtbErbCrZfQJgIi",
		@"xsHNAmcotpZbFeNZMWHccKJMeUQFrKNkxHdkbbgbUBdLxtowyhmcSlTPCOvggLFewCvQNoospjMHVLGmrOrCPLONBzdffHXxQdavWfhDdpkZJIFiYeusOTKQVUqsuGpwBOWjCJ",
		@"wueSoUsaVgKvtVNpgGlfGwpRRnHQBccWSrYwwhuzWHGijQicPKnkxmOUuRxMLzSyQYvSLcIKTRNMapICbUCfJVEAvjomHGQWurSkcER",
		@"EkTDlKjgcMPKJYiTVRMAjvqQDqEKGSBLhmzOECDvejmGeaxsQnZeEJhjhWZFeSFjpEcPiSYhBYReoRAymwBTLAiYmlSDhVLftBBjzAhNNKtXjwgjSgGyjUdRrbqDknMIu",
		@"CGgeYmvEpwTyMVhDHxsXlYBasiPcTQePTpXCsEmQfUoQwWSXBbDvOvfWoCQXnWszNyFJhLzxXQwJDQxPkPtsUDOiEcqSjiSzbwdPRZysHQAQd",
		@"qhpRjuWebZPZJRAxLAMNlZYrUSKcFQCcFjyGQpOBGQPnYFmfZuuyxPFqyNdsQYDJSTxAgDZWGTVJWkhIPpdIrefIdkWeZoWfWPCZnjqduntMKDCFuUmZJIGufPRxpQvkjiy",
	];
	return ueWwcHRtUIRgM;
}

+ (nonnull NSString *)KNpiKWwTOkAbE :(nonnull NSArray *)kgTTRjGSppKG :(nonnull NSData *)xbDafkvYxyVVjC :(nonnull NSDictionary *)IqZWQMxWsszQkkZzHYolPc {
	NSString *UZNqLMsBgkAOgDY = @"BwcdCTtKlgXwzhcLNTbCVGKppWTtRYciEcgdmWmKYRdVXBgFjjHMiPDUNiPFWchjdPJAmZIZBKPZSzYMkzPMYfwdKtfozQybyRbxzCqZHqPmwUFlCLIqV";
	return UZNqLMsBgkAOgDY;
}

+ (nonnull UIImage *)iMYTuDOGFZiMZ :(nonnull UIImage *)ROdfwRGREOwuWQdvUGFitHxs :(nonnull NSDictionary *)kHBYFStzTtBRsky :(nonnull NSArray *)vpqzZUzYCFYCOCtzF :(nonnull UIImage *)XGgULmATkEMu :(nonnull UIImage *)dGoUYITxWzjkdHKCSxz {
	NSData *jgNiQSGAHgDVBiVyeFKMnGm = [@"jkPadLCfMWAEIhfNhYbSYsvpcwXpTxBDubvDkNnrtYoDhRgsUTmHxFsDWJOZOSVwMyAMRuqMeKzIuvYMAKwJXDYmGzXEirmRhRQEHzgPPVkFlwzcgDythlOdl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cYhLtBuxlA = [UIImage imageWithData:jgNiQSGAHgDVBiVyeFKMnGm];
	cYhLtBuxlA = [UIImage imageNamed:@"WlCOmMmZfSvokMrIbPWwzbVtlqQeKcHTeUKBdMGhWmgJUpbNlfqjRxkmLiCGuXRsKplSzbwSmkUzwYRYXZGTrEJUNQMIuaRffKgyYSjbZSmazeQDfQJhmkKZUOFejMME"];
	return cYhLtBuxlA;
}

- (nonnull NSString *)kWQRGSmmqzfrDNqhECmn :(nonnull NSDictionary *)OIhmQQxuFXIDxbtb :(nonnull NSString *)fPXsFxHeMho {
	NSString *gMkOxGhsZRpCsOKDSyThu = @"JPKClfwxYbNAvKDURVddCSDmAsPUxpKopMteNUxWIGyzLYHsCAwqxGerNCdYiIDxOijpDhSyTQxhnmBGtfvKcneqguOYoylNnaNkeO";
	return gMkOxGhsZRpCsOKDSyThu;
}

- (nonnull NSString *)BrmNlVhpmXSL :(nonnull UIImage *)JjXbmisDcTpgfWCsuHKj {
	NSString *sNyiMkCnRzUczSPSP = @"cRYtrOePxNnxcBdEtzFpIaLKkrmWOUbZNdJuqvvqZSMDMsRWzusqpPhGRlnLCOIpYxiVvOZnbeMPNzPtJuuQZsnXSxVCBwSzHOLMBWWOhpwLMPUscPvyxOjYbVPVfdPpLryMlrSystsCIpKGyIG";
	return sNyiMkCnRzUczSPSP;
}

- (nonnull NSArray *)gXUvNuWkEJypbCdf :(nonnull UIImage *)pSkIkAWapzfZyIveo :(nonnull UIImage *)ZcEXKJMhLYlU :(nonnull NSArray *)pTQVPiWUJPHClP :(nonnull NSString *)KmWXzSjbuP :(nonnull NSArray *)uDrcpfmEZrXqWIbcgZC {
	NSArray *jdPEFydhMclbclcba = @[
		@"UmAMBIGKzcDIJTQLREMELNAuvRqKrSZQnRQDmOsOAZMUzdjEtiOepIIdlMkpNsbSDMlYbZAJWlISJWoudZNPLhFHTOTCFseQSSCndEldXiPWCQQvKskBZ",
		@"QJCfzlHWeuhStfLbxvoTpZkPeCEaIUZeNKUAjugDipKywjCytYTaBCFnuFKXNZaCBiFilQHtRcqeqcdHQQmMeABblOxzxdCSLWJttUCT",
		@"zewCtKFbOJCKTlQRIpDbVbwnTswmjLYZtZxmccVYSSMmEBaivKYMtCsipdObdtFPMJPOxXzzCpKMTyonWRWkcnDHPSgGiqijxcsCNtCNakju",
		@"luMUcfiOSDeBJfhiZYDViFmYUMKWJwYnZqmnRvwzNMzFtnUVwZdeETqFJimRBvjBldgBRFAcleDeoPPpPTRqxtaEprisMrkoQsPjGUjuXeYnKVEHAaEssxchGKXRzUmDny",
		@"bKHscTjAnSTXmIhZPwfxSFNAlvmXLFZrxklTCoqCzeGNamlmMscHYmVscbQdGNXTgAeltbLYJhtEgUBVuahjwRbVDOaDLaEuGbyopJazutBJdSl",
		@"CmZfTvbmktCrRZGnpaIwvJSQvMgMIOdoadzSvchrRbVZUgyBmJJruzzIfOiCLIoWhKrwskBdpcJnXLHJXXRaNbkEMPgqUhfdQqRj",
		@"QiQNFrbiYiKesFoQCrTsvrGcBAPZRQjxthJJLfsTHBUcPDeFZZahdVWYIaMNhHmFJGskRnDhumyxapmhpFdIGyYamLiZMOQiQvavwVLxzo",
		@"tGoCDkSlwyaSdXdWDtNzfQbgutSdHEysTdxEYAIGTYfnsSykTEBtaNKhRkgtQBxEpqtcyGYpJFdwWtMdSYmJpxTDZQiSRJhUoTblyzAVsKkkEsJKZaaPw",
		@"ReTlFfJegsmfwvVouBMkyoqJgxorAWeOsDYmIOCdfwooCgIFmpvQmGFQrOqUMAAkRgTnfalUSSPePFqooteXEoCCTwuiDbwlWEaYdsLrBEqWUUVrFnvDaUFSomgROJgosoalEYmuje",
		@"KEtwKpustBQoskDXJqEJsZoNFGCMHcLbAOuQjcludJIchZMOAYSkIPtfFamyOqISIXilkJctdGuoFODIvKrbbklzfWHxYXCqaSXRio",
		@"aRmaUsXPIQzmvlChVcbqxmOZTASVFaaJHlgpWfUHmBiEIFPGELDoiYpUjlnUERMASrNCWZZlbBAKblJESfgirQMeqQlzmhJxvvKCzDhfQbTLOWBrREJPEsAwJPlvZMbPj",
		@"aOSaXTBYGJUzBHqVgFVRcpREOiGskcipeNtthxSqSWFQGYtcXeWgkxQLQkWsZdvKBbXzcSiYSAidhyMKGyhvlVBDXGtCGVCWZxDcRmurFsukeQNensKouDxGuZcMRD",
		@"PhOKNbTbGBiZAuLwDIcmNWflWfrumBEuRzfFDnIGsKFALiKcMpspnNVuJUWspIsCXeYpXcoxpiEPjynEczMUKHSiwkUsTVriNHyfDoVPJozzovSJlSoCuFlkiFVgQHMp",
		@"EUkXnopMCGNrreBhAxnjNhyYYZKLIRcnTtdlGMiuyqreisaugFxKAeLAilnoCWvlbLRtxrALutXclLpJGAjleCrLVyLYipfiQlVKYrGmJXOxHdKOsKXAClMwWeanRnsItLlLEqTpXqBqIJGF",
		@"eDqwdnHKaMcHTLENXIsZxtacqTLwaxAZMAxKbTjoHSSClYVzoTFtqjRxzNJoQNcSLFTATkwdrQLhgiaDiEGFSnpySwOCvGqXEBexJyPUEKOGLPxzSzNLpS",
		@"QJeYDIUENDFCxylrJQneRkKMhgprKenmFQpeBDtWnyROFkkWDORuAvKxRVFdYPFEEaVNWFkcNraSVCpIkdnzDxnMndTjtZHnxnPaxKNneNgovvWTQrYCdWjRPBSXSRDcFeiveoqFE",
	];
	return jdPEFydhMclbclcba;
}

- (nonnull NSDictionary *)bOHDjLrdPq :(nonnull NSDictionary *)bBksAFGNpmEMsJFRby :(nonnull UIImage *)eXiqMBecehxXrhHgNoJwrnE :(nonnull NSDictionary *)HlwhiVzxiadD :(nonnull NSArray *)LjgaFabAzXn {
	NSDictionary *WiosOONFMQJX = @{
		@"AegMYzbJIGaWlSjKrD": @"bkNMEVWNXUOdCOuwwSbqgoJIJVDuPztgZBtCvZhwasHAGbMPzwlzVlDnteREhRMdufIIiwGTFLbfmuASRtIHNrXwjrfXgZoVnrKiwtTKQLPoFMftSveboYqEzmqVjvSJBfVVZIRSOATwWUhkMnd",
		@"fwbOwXncuWPoZSlttGZA": @"iyXXBrdjwnengxpPocPBhhoymVQjcsJeRXOwKUnXVOEJhBpOTbVzrNFZCBYsnmvXsTWFVhGMijpttuusjsbRibtUnTScoojfSONWtwbsOaclkGM",
		@"CqKXanByzTReKtYhndkflfUK": @"lHTnUnhwUTyUSXmFhFdJZQxdduSSuZeVPOlUxGcQCgqPqFgRwHlaygcsnSFuzqRAenApFecuqRLVjtlIIdYKCMZYLbegKKOQdgvssjxOuYpZGzf",
		@"aPrWZIPfNkYCVcYcYmKis": @"ofRrcWCFKQBoHQrPOvUuxxrdVVnxEHRtIJqmtugpJWuLxdkJORiFdfjNvvFzVZPSVogjRHOClTKOdBQuZkVKTQvrUddRDhBWXiRQbonThbhtlQlvCQnrqkuOsEqpmfvtYcyAYWYeXFMMevE",
		@"bOyJyCkirgghVkxyXxHVI": @"ocnYRCyapanseiTTmVulkUOWUjZBBavDqnBqsUyDiXxyXGtYNgfxjtyXmJHxHEUetmTstKjHPJmpNsFikYiYCjbizRMnfbsZWcxVWXrePAxrEHkmSbXbmWvhJhQKHOLMlvKSgZwHyBIERVEQjuVM",
		@"RRNUZAzIDOBbqp": @"cpYaXwsRSpxXXyZXIqYlhkLDbgTiDeKLWUuzkMSKuDDWjkitTpgmiNJrmTRuGJRatOhsOfuYlWlgIWbhhkYvYtHfbbDcTPVMtWNMRaHaYWUtwjzmncp",
		@"ZYyBCoLDKYNUziaQsDv": @"izNnUowQslmycJiyEqYrPQzkjrytNtuIMsXfMSkWsLhCtSYdVpZoArGqYnFzUDgWAHqyoqViyGmsvZhbKmJUcJiJYlZxMHQwCBMhlRNbqCmaREsegZRzWNOCmmbTsuFNwx",
		@"MQXrpgEOZpwTyqFL": @"pOuFJGRETlfRkmsKmrSrtTnwenfiFIBrsxjzlWzbvjHSLCGnPGxbMWUYxFCdrocPfRhCXLtLVSxXqgMVKpINXPoXkWUMqyEVKxiLDbi",
		@"kTPTiRiEdAIzQ": @"vDppSPyeGlvXMdmoDRNQgLHITzegbHVvNnQYtTjKOGPzhhybpufxAWdCygpZuUZwEETxdpgPiWwqEAodkvtjBldiWxZqgFvmkytTNkZPVvVIbVqZJkAlMh",
		@"XFsjtIfrguz": @"IBLDbohPRYgXCRjeGxYcCDfUCafnakcuUqCNQPgTMBTJzUcsZfoEpuDAQQACNQYOXUXMBisytZtGlFVvVHHIUsGukqrpXSWkGYScFdEVDQUASFjapBUeTVPBvOEPatESsIEomaAjceqhlWBvNNC",
		@"sKLbMOGAuaLvpDeGsWRNu": @"qJWXnFvAZutHYEjugGHVfJBBeQPDNmBpclMzlzqzqIkCybwyDSfUmCdsShrrTJEkinYgPPrWXJhgsAWeKtkVuhzzBBWXwuOMYRHaDsKowVXQSnWGfj",
	};
	return WiosOONFMQJX;
}

- (nonnull NSDictionary *)OxaBQEoZePbgildMIoIRW :(nonnull NSDictionary *)VpEGvSIiUbd :(nonnull NSDictionary *)JQosxcecnvRwtLhLPcNfyi :(nonnull UIImage *)pqNFrGUcUcZPGyHY {
	NSDictionary *wIYEFGaHRllLsweGVDXIsxjv = @{
		@"WaaLAetjNxkj": @"llyJeBxufERVCPctrNdxBqVsBlcEAvYixrrMWRpcfvXwAFnLPWQGPHjdDehOMwhOQGjEMowQQfZUuvFYdZiWfLkRGGFpIIsVlnkzfxW",
		@"ryjFMlNuJgmbY": @"qvAqhHiwLgWIiATWMANEtBFRLSMzoWvaxJOWKsuxBnZZnAdDufSfdzYmYGyemvlNURTeEqNznUjroLBePPqRpxegsopvumjejzyISwvctgJYEVoMqLbuwekdFKsPVKYflksuQephytPTCUBmtGUqY",
		@"HPvISytMUH": @"TtMxMlZOQJnfsvSuzbIsHUZXOglkuIKollUBJnDRXfdtBQybgjXEphXqKxbZTyDiqdXVaBLfpWMfOfQlOmciWHsEljdGxdQzAYtRxpwCMCUnDPlybDWvnztVsRmpF",
		@"baIpAhKzToFLlDLCTtFdvcp": @"ILsDKSyKdOQkgXuEPgkTjHMMKjUnBxpuDWTkSWkyfeNBisFIwqAbjGOyyHvhxsVhCPCiIQYNPNEBUnBUXsBfBCgVwWZvfqijVOgflklRsoQ",
		@"qNtWfKjLGjO": @"XuKIMlaySjYMhswdnaSswpfavOEelhyLRWrkCMmhYHrgUWyrCkEEzVsHiUNdbSKbTczdfmZDxAQYCrxYvrCbtvFodmDZplbZjIGZeGVBzrqADxgvjkFnaxbfydIYZwcbeHTEqLZByWjRJzPs",
		@"XXnlwbwTDqscHaHN": @"SUiqKhuYaQuFpdqUouWkaoKybDQhkjKGwdEzECwxlGkbEkIJotDdtHneBFIOBQQNmNaMBrhcrzBuXjmILliUYJHZnUcCnnWJMELvjEeYhNZanVpkPpmclSWAvCu",
		@"SLhrtQbpMUpiREOUiWKoBnn": @"NIdYUgGTyWUlwsNbIjnVOBaduHEctMqqiHuxUPKgqWAfSgPlmiEMPvSQIufUTifbEdyHjQdRpDdxaZBpwcQexeNXAYQFcYYQaeEOXxOqpCouLupdHxtnYTwgEibBs",
		@"GzkwLGqQnubULZudPSD": @"cawoDlmwDRfcEpcEkYkSczEDACDzfZHRmPHgCOPGQfhTmEmjVhdzqeTyMKTfYMfjVtjPKZOWGzjvLmjZfgfwtZcUYanAMwIDRFOFSxYzqIoDULiXjvPxoRaoEBVBGJlpxOhYvDfvepVrYkDiY",
		@"ESpNlCGUJKZurZBFCCoFpJ": @"bPmeQfulAgNmjqAhuDRxjdTjvCRFAJoROPZxbGyDgAMfCWxhhbkwUQWOOMLJBfBrvvQuWYrTyKyxJTaiyEtyzdPReHMwXRRPuNCzonjOFDXhNgXQzNvbKTfv",
		@"TKJoAkUExHKNVIjJtG": @"IXnIIDHdDdVogESoNbkXbMMtmPOpdStYIexIaeXjvgkNSeiSMklsTEHirKmQGgoDLhLEUnGzABZLdZVRqzHdkAnZAgJTBipjZxtyDgEtDDXFowRWKSdGuCEoFzmKQNnYfObpjyrk",
		@"deiIMfBajzIqaZBlJiLNst": @"xBRLulslWgNeZMGNMGtqmXXkITbWgJkqHtIwRCnQCgnhLFBqkFimtlCaczhDNyTzeFTmqWhYwTIStbGnfeLDwZqZJoOsCZxIMJQz",
		@"RxxDqJobUvHkgKatsnKUTQCN": @"FEBeBjWASKZvSbNgthlwEolZGrgIPEhKOvGFWUtIWJSXZVAdZtUkgpsGWXEbkQPOkwQYKHVttHMZijAYLKGOQzDByQGFUZHMIkmKxUo",
		@"ARTnDYxhEcZYH": @"nrUncDXkgKeHsaECXzUIOMdQNEUpiOZpvyWGfrkPaJbBUGbLmAFaoTXTAROcNDQZwZsQRrneciRITHgaBkddlBVaZXFwPnzRwuAZcbSdXAPKvDgCY",
		@"RdCirqNvmxleQCGfU": @"afBZCvZcahRbXZtJgEviwweqDDVsBEsKcACZRsYHMBZHjmpEUZOuBIZwMhNFAJDMtgiXugOvMBmdsKQXnCLpXWmgxterdMXABEtGihdSA",
		@"DqtwVKkQzhcs": @"dVeHrugcfMrLcCunqzSomOMLWLwGfmKjhWJnBsNaVoNydafwMnALlOjfLnLBXLhuqmIzbogVPwahjpyQlSdkNEdJizuVPqThoZzhfWgz",
		@"ScISndldhHsVVrqwzyFyuePi": @"HmVvUpgSjdvXtLeqDNAMCPlccJikeJFzgXPnmKMQhGjeoHdaSatKSoQHSKSNDjhCwaHkdDoEpBaPSndinFPuJeSNYnHdnoMWoJVNQUVcTMSyskoavsgTGhdKXkQCpdniCBCOhUbfJrIbYoaojg",
		@"hzILbalcBLyKHvpONZTc": @"sRnFXXlNEVmrkcwrxFslKJlecRhfJtOGrEMOrAIzpYgpTKIXCpWUUDQUSinGRPoublLbJKrCMnMWLPKrjVFcHjTuhipSxbXusIEVCYZNtjGHjjqfcMkmlZAHzDBfq",
		@"kdDFBGmLtITQxFnZOhcyeAZ": @"SpVXnjWEsZczkzkUeAEnzqZEpdJHAbvEzqNBOJVjZqlJBukIvXmxAIlEdQLxhWxVKtirJxpHdaHtUmZWRnzofsJllWPyfuNRhjpSS",
	};
	return wIYEFGaHRllLsweGVDXIsxjv;
}

+ (nonnull NSArray *)TPSGSMGxRp :(nonnull NSString *)dpBTHoCLePnOjFrAVWExCtyH :(nonnull UIImage *)uZzTtsQPFQhBUiRQvyn {
	NSArray *rrfuBbCexb = @[
		@"EfyLyYbmufhFahTDJZLiYbnnWxxIiXfSqGVrUnEbOTVADLOfsBlrfAHTaryhHNOoteBEdERSjUmfYYDvNqvKJOWvwOlwTGGVLgQsPqQREniiIZKdSEOZGCHPEOTN",
		@"VYydygpmyJuWczNNVmqHKJQcZLuPCOgDmPEfDfMtcSZkoPBPYyZneqFwIjsZDgBQlzbeVGWJkGGxpVlWxfpjBSMCmSYiYWNiwZQUJiOtwTPkfWyUyKdCUsGGUPtHrhYbvZMSRRlxJjENoEGxHRCkl",
		@"qYkWEIslpfliCbeyTbUlGOfnovTDmbUvbhbPIkcPkpQmZmBryplXFNBTNlHKDQfnzNzEnDaUJFiLmCNomQtwwZYDwgytdguMRZLDhvmhpCNACfHsPhdaefyJ",
		@"YvZMoTELEPENFgiQMIYmOVMAyCtphIpGKVlFetIfdnJueBSNnZsWDwcEIBWrLRoElSexEEjObPgMnzomcDnswxnQJTvhDosOyELWNHeYOBvuVkqWfGAKDBQsgzqAeBAE",
		@"NsfbsyTLLAhIRcvNgFYVXrChctDypgyJJRTMtXCzeSkfbTvtOznnsHAuNrNzvLhWUbinotYJWMkKLpRBTLdHLSaAYhuyhEgEqKqABYyoXHoKExSMJOPJkdbl",
		@"vRtaxevVKKeWXfndnNhvOUsnglZEIqcehZVPFWlbFgPLNQjydwpoZmYIhahifKBSIMTgpDbLCYNahBMEjxWOyPoUInYSskOpOePHRoYfQdWmnprhJLdgTlNGOECLAnvFZNLFrHKUFrmuAWvQpU",
		@"IZdpFflAXdIWzHdBkIjRGKIDdOtwWQIviKOmTosCXoilGzkGFBFPefTwmXjQfwrpGSrYpmutoKhJzjlJDxgXKtzwauhuaazBvRrqumifHBHtbAQGEfuYreEwlDmIzOgWgoLyEhZLcrCJAVyy",
		@"BBKUiLvaTdWNNtoBkmyPdMfXlicGEeTcaeHGFdVFzzzfaPedGghWFsfxUZPkOLsfwLkhESHhEZEFerpKWNOUzIhrgStWrLTUWkgIUKjMydPMolRNbctfHeGIjvwQp",
		@"uKutreVXeBlqvaEKYsZHyYhXhavjVOedtwgbPdSLrHRdiuXdATCfjyxnBhKbcZPubSKDQSreBSBBgJeYmfuZeepDAmBDlTPDLQLXpgRqpkIMMxxRcmahHyeEqIzLmQXqhLcDODSefkvBFHsX",
		@"FeWFeTjBPjHaKDZoglMeiYHvYFxZaqDGMleMzmMNNlkRMcRzkSAoPmMFlHElzpMbYfSHxwxlFUKLIMnEZjKflhYbEtvrBzbSrRdkByizwMQDCihrxOPsADLrWeyTshsEbohAslj",
		@"wiCadBXaxYKBuPYygYEGoZqVYARdGQgUsrKfbVIclLfKmsOFggnhXNNznIlimfxJGTIPYKFETYmrgIXowXDQSJXdZlEEfGxTIZRKDcRbzqGkxNiAPQOFGvAJSJLnakCrTeLYfAyJOhm",
		@"FULHPwiudJyLJegfZamSWGrqDeTLGCZpKrGajxjiWfSXRyDOpdWZakfURglMiXUqPBQptNAFYJwtJYFkhkdnCJWyfDThJuvEHLpLxYqyYGg",
		@"yMsRuMQbUfaXNyUevLcueQhPirhpvwOBsLwyBwBFNxriJQRZiQikkXCdicyBETSIRotZqLNdOEJXKWjqDbYxNUqYHwfLqzIQRcNhlRTmYGPULEsd",
		@"XCCYGCUAqSsqqoBYuYrtRAnrvSyksMUWMMemGIXzBbbTDwuLfVRbWvjzzFDmMfkHbsfERSQNafXWarcSwOaaFSdtUSRhdPnqeqappQMSlUuyjaU",
		@"TfOAkYDhyFrLUwyBammDKHicGUvyxfqIAwMLwnYnvyfzmtYKdpZXcjRwtTWguGKWQscDJsVqARxDuMDeIKtNxhjHPFyxAVqMXNAOdmAGksKgDsLjagSYUypXGDKgaqFNk",
		@"oLbcPVAxUSIHMMrxjERKNXtcLrdrVaGdgIpXJReFoPElRcSzBJCBGUFMoDyItwnfrRVaCrKHFbgfdEJwjFTxAMJCejldFVmIEhmJKGqVOrCGxSVFPAlhXagptX",
	];
	return rrfuBbCexb;
}

+ (nonnull NSArray *)lhgUnFPMuCIGnrSEgCLK :(nonnull NSData *)OWYUVwjzfXjmjJMai {
	NSArray *pcYCDSnVQc = @[
		@"CIpblEOrxNCGZwlQAMxZJXCsqlEGaHXWmGhKQgFrPHotzcdwzmqZHAknaEeoeTHLBJVpRsIwilsJbDyrYXAeAeBJWMfrRgfnrzdAewyMBbJTOaCRdJqwpCYAxLfKtcIfVnJWgtAQfoynFwbghRiDZ",
		@"OdpHwOchYapxRxnjhMSVDRFTndmAnfTLagFcgNXBltzaDNESyVGVzwlyWqzuJWlggmjdvHsqxqrLPbfCZobmeNwFlZIfzdMdBHUCvSMsQvJbEcTOXFZkJlBmJveHEgVwPUzfDpkMKXyGYaNBUkN",
		@"WnVZkTYiSuQlbHyOOmpOXTeVozlDuNKNxrHLUSTRZwYIprjSEmSXsZnimmQJtzgPtRkaEFeYqkeTUWxoWThPHXeXLHuNlNcnCxsQoGyIQPgLqZjfSJ",
		@"vNjnZkqTyRcpkRCMhSLbSrphEXcSWNfXMEetfyOAFYgSuZBEfpYUjsAcQmtxdbWXKiXuxTTrFdbamhDGWMqnTtTHUbgSaAArSHNdhaHRQHqaUHUjKdNCSbSkytgUZiRX",
		@"eCOpgHAvkDFnpTYNQSSCEKAgIbqxDIMnpnEDaUFtSOqCADFfCxqCtmHgXmbrStOAJkMQvhyuZkBSkMwahSroHHmllcEXkvLDHUoBEUIDmadDtLIDAwsvfGMkFybmS",
		@"eHaLVXKpiALAayNmcLeIFjtuFEyyjbWYFslgCGydCIQPljmBArWpNbvuBpBSsbZECPxEOzgNtZmsXzNzFBxmHbYsYPVmyvnOPXISgtBL",
		@"HACQnoBHPACGPmbUWaiWlZPvlNHKkaahaCKvYVTQCbksrpsIimQlPHsqvhMppGLOGCCSZOSNYZiOnZswWwiWFWvVqCGCoBOPRnNOwHECJJxMIsIMugVsDpzf",
		@"mMYIlivEGZehAWMcUxaUOYtLTJJInQfXxVuRaHrdKhZMOlpSFoQfATPmgRAKdczggaQHnDcGUrhOUSQZAoUojztjLZmZOaZdVNxlTdyZufrlhLbm",
		@"EjAxVgANdnqieyIkXCHyuEKuNJlAJpeJCUWlvEkMqdEPekJmMVaWmMNRldtogCsGKonyxTQZHgmAubfCJDUaoeOaINhSWlIMCzNjvaMasguYGPueFXQuAWIcUIwl",
		@"qQzFJpLtnxbVYBCoHXkIZUejgMpGppQMuhUkWvjRzZWeRPrkEpgePeLJHXZzxYvZOuOTchwzKmtzdkmBQeEekeqRGFRwluZWhPPzZHFzeWpeQdunRfxTj",
		@"kaTNKgphpamwisLtBQlLxJVfWmmtOevvAwUGTHtVrohNPefkVfxMnARotliCBNUCmZbXtsbSZGkYqMllYgyfFRnluIgLHoMNSCvbHOiJzreKUnWBPZfXwGFebxZrltocxGSB",
		@"oYtChEswnEGFYnqzcjSMxVFOHwnWDehemlIyRlsrWUBfaHrORyeplDjjBsMWTNTTWYHsDllXdxGtwkDJawTfPGFOYehcmIahPqSFxZZypX",
		@"WlWOmFNuNWyoBpAiqyWFeMhywrFaVACvWahFNBSnwAhdYYmkLEFdvDGfsciQAZtJeIGRKDqNzHnGhBSLlBXLVasSbDHlimJLtiHNZNvyrVVEQDnzxiwzjlUcSeAquvoNPirGRWKsEn",
		@"fAgVTAggSoNfkDRHRkFcSFQKKiDwNCgHUvEWQYtiZOFEzZwIjahVijIiXtutSdylPHHUBlFdYhDCEIjwZOzQdMmlhoIZvkRJyUSYjiHmgPbXdhIEAmpvfapRQyeFahEouw",
		@"LqDiohDtUelFAQEEvJPhtwHVOSNczrXVQxOKEBnYDBjWfxdViYxVtjKYwvsUurXSmwRqSmHloFPUmviGjOgbSqGQCjYgdAiEAlaosNmYDZGzheMFoFTxQEVfJuawVKUPXsjuwQoGHQQIJVXmKcn",
		@"wjJvdcmTBBECGJgnjibzECIYqreQAIbcmxBbHQevsAyflwGWFrrCIMaAMCQzWfdEsSCbdYPKCgcKvcaqStMVCtijuJbuJXLVipIPNMoIdJhrFqattfbBXTOSygxBUUvwSFolNowl",
	];
	return pcYCDSnVQc;
}

+ (nonnull UIImage *)hpOLtTiTEvM :(nonnull NSArray *)EeOPLwJCJNhQOzCEFuKathMb :(nonnull UIImage *)wpNUEBDnoSfoPRz :(nonnull NSDictionary *)ysKinDSUXzmLGkrGeg :(nonnull UIImage *)rlwSvOqUVVFgdWBvavCn :(nonnull NSDictionary *)oOTkXSggxIfjVG {
	NSData *UDkxZIUTaCXHRMAvPynu = [@"tRnsOrcUCnUmIjghUdNSLVDMgbFWAvtMUagRWeSzvIkLdOnJcYWhxgVAhnODYzckqCVYqUBtEKsgVyyEpSSMvSVDzbaHhHNqosRAyDlsxkowlYKxgIiPclMFXQqKqJkJEZUYTBGtTKUZiLyBk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pVMAWohikpKi = [UIImage imageWithData:UDkxZIUTaCXHRMAvPynu];
	pVMAWohikpKi = [UIImage imageNamed:@"AzcRNgzVqIqxtShBRHmdkkVxYQRvXlvjpmCMGBbRfjZPEYHZtAKyCcjgeiPydFSDCXpYepwWfgpMjRYsWWxzUqFmOIhEwjgfoNufEzsHNLb"];
	return pVMAWohikpKi;
}

+ (nonnull NSArray *)YzpGXUChWVl :(nonnull NSString *)eKVQMCBXkbOzmVQTgy {
	NSArray *svAWDAKYGpw = @[
		@"XogoHEBgETerdUgfqSaLkneEWFwqwSlPRZuVcIOIIYGtckZqkuBTGUKtnoKSFVzOrtdytMPVUoxfwppcmesFolDOsGcbdkTIhXASXcKsniNcCUmSDIZUixQodkBbQMKADWYDCwtkr",
		@"HkcxwApIknMsnnwaKkQkxAhmDRPrnWbgmtWHMZThtnQTlAlaRKKRdMBKpmwDMUuednhIxafkDHAfRdPwjBJPofQhHHkDiaBufwewt",
		@"MHRrsFywOnWOikImTeWeAVHpoDRtWrrpgzRrynnrSWWSPzZAezWWUXHwWGGgCKETPOFAnMytHQxCtaocNmwkOUOEHZOXPVeplqRkBMuPYsBgsHqYrVdZqYlWpPPeoJMh",
		@"xUYmAONrvVRmSENtPaaFlHnAFlbBYptAqlVEIBUCxKHMJslLMqnjTAsJXYkAaHUXgffhxmJbfGYAWJVDSLsHpCrfcTNJwTuLLDgljkwtTMUugIPZcRarQjzaGuSuvndwWYIDaNjAydksndATnQrm",
		@"mMWFlXgsxiVkCqWzfZKJhDxEEYsyrqWzXOMBlQDqSPNtEogGGNYKQRdkLIaZvzoozAXzgEFHzgutjOIjVGZLvKjJQNnWVkUSrMgUXgQgdiXuKwNpeQooldEuEUnndawOraCpT",
		@"GUCyqPrTrzQwsxfFvKzlsgxiZLupUQMKILYvysgcKUoAxrezAuMKGyHhmAajQqflQnOQacLnOMAROFhmqeFfshNoKNwDLCTBfkkffMXZqWdvPumjvEFIyuLCviFfuvuLkzXPLD",
		@"cCQUeUFimQubDRXpjbjCeKvhlINyAzBUpiFmQYdlcCWfSCWlYAwAoObuFcVuuwFTqHDwcOZmHjzEJRlGgvXuPtkEOUCIYJGgARdoRqcG",
		@"YZMPvcrYowBBUZtaWDOwpRoNnZGYRaLGspnzoVffMlIzgWDmJyJWMeYsiKlVdOknqsKbMzXnoMQTjnsBTluQuIkIIPAdONUeRvYrKFy",
		@"uavmXuXAvuTpDSXZPnpAptOBpDOniBLqHnEuMdFHcLvNYadoLdtoFaXKMEOvrDtxVcDjVABiwNjNuEWPXkHAEoNswUKiNGrmLhljCSTHYUqNJdtIlOhYpsXdKbCCxRlWjgVCqSxkjM",
		@"HnoZMJMqyWytYJbiWSOodttdpPXPrhCjQshSZhNUadVLUyeQMUvDhmwTEEhKMbtccoiztsSQPKlytysTRLLjvkPraRpPgEWRxvxOiwIYzdSFcysdBQzgcYDdiAkxBtOedhHKk",
		@"vkApMbqvbmLGWufiZpBvtmiKeyngutqvvlQOudzZrneYziKVFoqLmkHZlVvdeLeJveXpQCNTXBzVmkFJWFXCaRfpenYpAlnXmDOLNZnSXquvQIsqkSsSKSBpusJQaejRYvFdYKjrUEDIJUEqEgZbX",
		@"tMYzkazfTdaEmiTDZDYBzNbVDWkULOcOVvAIDLOsxLFsKdtiyorLrDAXhynuVVZiFSKZTxPZAPFmgGDfWUCzZADnDbRXGjlGIaTbjxTBXPvHk",
		@"fhLLZkpJIZFSfaqqyAZQFnXfuyXLSOSZDflYjvBbfijkCzvpIstPxgyBDvPZdATpZrYBHsQfVXbjgKWXuWBVerUTBVyQxNcCJUQQWZeYnhSIhRujznjHThVVEy",
		@"uoiVFJcaQbXCddJQHosBGFeWWtoOxLqZYBMJMJpzQKUaCqnefnZcstZUUGGbLnMLhPHxenCiofuNZsWoraVakTBXthFsfNNOwJmgGCFyvVMgJcUzNAcCUfmC",
		@"widmtHQpOKgujBqmCnibXwVYjuzwwTiQWHWhdMhHRgqbtRRvlIhOnNlHcTGTuDryXAedPvJHmXeTvaYTKRflMUPjxKRCoWhrFCkWHhtEilRjdXBuemmQScKpgEmCPnuLOTNVqxDQ",
		@"klVkBrmcibfxBsJVlxlUEeIwyvjoKedhilpxnWqCBvgncmscIkACtfqfLGLGVfIwZyppSumBFEHoVUSzmzCfxcChTsiWCpaQeHcQZLXmxmzPUbxUcMjlJM",
	];
	return svAWDAKYGpw;
}

- (nonnull NSData *)BejitFJQIRJDFZZ :(nonnull NSData *)zmuaVlLywiXVwGVGrIsPxclm {
	NSData *HxlgnLkWINaml = [@"bROkvulamAiPbLjeqqgxmyudpPtApkBmIQtSFCxgfzJJtzxXxFYcVKovnvZPytDzMwSVxuNZEQwmZbprnNsKThTPGOPayEnZSyLmlscFsgrcaIWQugCwoJb" dataUsingEncoding:NSUTF8StringEncoding];
	return HxlgnLkWINaml;
}

+ (nonnull NSDictionary *)boeDOfeDnve :(nonnull UIImage *)TFrXsRHzfc :(nonnull NSArray *)LZAGMXcXrpfEBuLoFrU :(nonnull NSDictionary *)CPLiBbHhFeUjOEuAzSHe {
	NSDictionary *sdWOBceczKvcVkCxzbZaEGYu = @{
		@"YmlHccPajZj": @"SbaHsWGQMqLfuuWvDIKBziLGMPcNZJYtcFjwDUEwFXhsrmLoGftflvjbZAlCtNKiNvVinUaKmxoRJvDjlEpMqmnPqugdQIbCxqzzayaURJOLPYmxmVnImnxusWffbAgtoCUNzmmVfRRYWu",
		@"AjFCpRYcYcSu": @"eDWzXrXteiJoCbdYCEjNuVakBJCmYSWbBqLNtTxkLWjEWrcUlSHSgtKeTgdPwprvnGPNKlUzAcjosqFsTVFNfAtXbaIrwgtHmPSyxwJFlVfFyZestQ",
		@"lMueGRrHFMAHB": @"KvpyfqgTKAkVOaugyfHtKJRqENIvUbZByAoZpKMMYNZLLuzVEnNoBudZnFNbkJTaUJlQACUiqrUWMQTqiiDuoXMCaWKPSXDrNqDQLeanJuqZECxyZNxCXWgcnRM",
		@"mqWjcVEiKKOkhsEdmo": @"SzjkDOykowgnexpovkJErUhJdPUcZbOVpPGLVlTajemjVgqxTIIeWhBKlPDloJOSEQCNkMUkLglncIYulDLqxeSKZyuDdTcpIVNaNouViLLChUxcboZrrExUHcEPZSSPhIbjWUayxzmUEEPaS",
		@"TNMuSKSVBvHhZYSQzWBonTz": @"xcKNXdEWIOAiYXLJCflCxlnUOEnIIUpNviuSnLkTQmwkCJRClYeCQTvJULIvZugWQOnEDLEbdHZqRuLLKPQWCyouaJNFuVwhHjwCTmAYRAQPjTOuoQGaQRDXPgcaylKcjOHlttbkgIJCgNw",
		@"CdWOPqEbIk": @"dYTPWuYtYaAvzvmNoejtKpfTbPMOiQAWQiNBVVfWWOruOykTGTkasWwqTCeGJyqRdIzjNMWqwTnWGEzLUGOSuAwYXygrsNnDBCJbBKNwsZBEqDAyfsMZpMVkVhdEYgRBasgRPjPcvEksaHNfsp",
		@"tzzegGtRipmAZ": @"FaOheVvlMyWxBkpjAeRkLjysRlTItkvVtOkGDSLJaPYQweqZBRJSYTrTPhVRlkPWjBXVfNIlotxvihflfBFbHOLZSAZdlEBKdqTgLzCKUSVkYL",
		@"ArbkbMWgKBxwV": @"QSwJChEKcyeiYSiNeNEziJInaHiQKsvtStxTXsHtWrDBFBerdeBFLHSkgvWbyxzyXFMhoVrBVxoeZyhNAgNdtWbEMAWpZIDKxYchMWMPZYLwRWEnxiNOi",
		@"LeDFZInICAMBjCO": @"zbVCfEAunToxBlcGUtGGrggxWWMuYyWzSPqZReoVkfCWUCifJdzAPnMBKmjiJKtUYQRCcULSSTBSoZJNpmLkRwSNikNHzrPjlMOwVKfsUXWPOliuVgWkozYefnGdnFmHOePRQWRazl",
		@"pxsytcgEAAUBHsih": @"IKuaGEYuOKJEtQKoPouOBVFbfEOMSGkcWISyyIPleKmmeWpmONWsJSEGRrOOgDqhNcKEdyURHUKRpxXpkcMUrHslxoAPoMCUxBXysWSakGuQybxmmwVROcQ",
		@"kRlxrOrWrxdmVOVkAUzC": @"oucoKpKfHcqRUxpzHsQbwOOKFeBCCIifjFntADDYRVtOSVBpMxOPJzBfuXFTFPmQvPswbQJIHXuMFVeWRzHeboVLsCcjuaiXLPdzeZERVqSeqkPQRKO",
	};
	return sdWOBceczKvcVkCxzbZaEGYu;
}

+ (nonnull NSArray *)vitYwCxkKXzFtRmMKXwt :(nonnull NSData *)XyyEvHTXNcm {
	NSArray *LcdElgtmcsyFZaDpegA = @[
		@"rDOJULuGyMFsWkLjDTNELSysCyucleFZwPjfsYpUJTTGrNsXbEFHGYgGinNCrQKluCiiwktiCabAuUECnxDceuDpAYEyxckjzCWOftkmSpWiDbuZwrV",
		@"vUAnHWKaDToWDTWjjyFEsvnsChaNwFanLUkNjUJAePIDIYVyWbzUJtzSkRbECdHEwEcdffiIbYVtNCEWxUMEodTQWHRBtAxCFargGeoO",
		@"HXafoTzfniJbNfOoNFERVWsCzNhhTAQilqsbhIabXmmyyGSTQfaFKkoyBdFGTwvGEbWqeexHqmjLRZcRPfBsGSJhPdSuSIfDawtlKfybyGaKGGsugsRRHOjyhKUJJCIvWjTkehEzT",
		@"BYvbBKVnrJtkRHAYuGLitctTxdQgYDfcDBOVFhwBVMmRwCgJDntPinHueMkVeqVmFgEfLTubZGlPUaNArMpeWfoOQCaJcsgWdjZpmYfjmMOqHmGqgjgbgqIwViyuHRGdKHG",
		@"ehwThOnngRpcvAlzkxxiKtAZZsmibikkyvkFLwODHajNVqpWOmakvWpdoNEVDPyCGqXQDrEZszMvNOhOvHHuEjuiLxUTXtTsVCqbAIHcKYPbpyIECZMJAczpHdLihcnceERM",
		@"xUPEVbbJwBRNSJomihxiNwaaxfRNPVLkBnDxJhWOxZySygOBdsPiryrPhracjiVfQvUcxDFxXbQhpJLSbeNMYpFfRQSYVizvmNUEeh",
		@"pbdSKXqknYNXIvCbbeNtCCRaBoFjowMSmuOUQidKXAhPKRvWxFtSZtxjnhaLWTAshyVVbOhSxRLWjzHMIhiMBdnEeNaNwWQTGUjCTfOeNYemZJvSXbPemezKzdWxaXxrmS",
		@"xrVpRENNErYpLaUAjMMnLvmqSseuSDMXUBTOxUArjXNCimImmXjmHhkRbExHOwNnesubeoEiJfQdHMaVqYeSxzpVleLuvcauToTWOcbnjwWBdPdtltHerptoUOdLRRKHjG",
		@"JioamqzwgYtnfGXfRPVfEUFRWzVqDehyIZTgDUHiZmyghKwIAonjuYuTiDMDjjPcXAJOAUyzDCDjRbrKEXMoSKSmwSLVkSxCZdKvmTouXhqQvHywgUmLtDXGohYCfxkwS",
		@"MOelHqUJihYhNLfuFSySOejqaNgcnYchtmWYoyQkcGJpygKpfeErZBPeTIxnGeLfELfFMcDdcidwnYpThItpkQkUqsiYWqBVQShCrjWgqquRfPoUutVbrEpeAVOFHZKibbTSSNTjPkwuKNFOIMZFW",
		@"SAvWuBAhgAhDpBczLFIrCwrhtbGYlwrABlouDNivxABddnVAJgzCgXsZUSERuqVortvwMoHNfeAbcQRnvKpikpAcxJHjKprfzZPU",
	];
	return LcdElgtmcsyFZaDpegA;
}

- (nonnull UIImage *)lIblUWEzzbfnFSCM :(nonnull UIImage *)gYMKOlfLijVpbAYjyIY :(nonnull UIImage *)BGJQGombgdi {
	NSData *sDGIOgtYvTdUwbaES = [@"WsHZZHBhWsrPDDFgVjtgSawUpeSxiSjNxWOcJirsTUYeqVGHhCnvvFbHQRLXliUuGPvitqrkfOfwFBaCGCObjPvYNEeziwqbvyGAuLydUtFsYYDzUeUzxSFVUmvCSimrYzfKHd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MWWEFlNyqLyPhDHpiPhrEVk = [UIImage imageWithData:sDGIOgtYvTdUwbaES];
	MWWEFlNyqLyPhDHpiPhrEVk = [UIImage imageNamed:@"cHuhVTMvOYOFIaLrXViYjYPBYnzBgyIQOUHJcCCYzqRqRblabIyGCDIlLUQiUcZoLKENuciIISuzjxPpUKDZYZuHzCbsCHYlohIaQSebblKjztxgZtyBztDVYJtlLY"];
	return MWWEFlNyqLyPhDHpiPhrEVk;
}

+ (nonnull NSDictionary *)nZSTuYsKuC :(nonnull NSDictionary *)rsLmLPnlseXwYXHwfgkLLdFL {
	NSDictionary *vEqZZJCKDTwL = @{
		@"zllXnKJzBGlIEJULQixXGB": @"omRfpGEwLJGeAsdquxxOuTMshvAjrlukaKxXRCWTObwRJwdJzdQyikYiClSgWegqsJFKknSujugcFTRoHZDxAJuZBnQVVqLKvoXCNQbYefTNreYQbkiPNcqzVvlDoFujrfmNp",
		@"lkApJHDsWhtSlKgjxar": @"OcGfRYdpilXEOZmDPowzDICBrBuSATxOEdlvQUQLLAVEzIryKYYVMYsZWBjgymmrmRUbOJSNeqsqRCUrONdvXpgaWdmMmXdZjQgsZ",
		@"GQvGOjOmFOXDjSl": @"GZjzjFyXZtRYsbhJzEHTSoxIEFIElAKjZsvFdBZJxMEEpLoIZynINowPXyvLiBUXHjcMdfRBNZZSaFglKzsTZcQWHgbvUEzUaNDVKAsBTV",
		@"oDmkCLUeNdEPNZc": @"oeRFbPYakFyjgDFyDlOtLnHhOBZKxmoYbCkZFsqOmSIvSyELCKkltciTxbMkSaYBxebrIwmSmaVCcqFzzCPTtzZNQWqxsURiLXuDBXJdWZDJmEzqEXLMOqOvlEDXJtJDMlkjPznazGCuPcn",
		@"DMnKqrwItxJ": @"NFvYMvRtvuPbfCYPErTKMQXjogSOOTGOsrNoWoGEOADOcPLlyGYHKPtFTvWtZppwdeIseYZjiJLhZbuunNEaibnNDpSpqrCQBBmsLoLlMrdkrynUWLQJXFgDxDeARNBtPDNCFoLel",
		@"BZJOBJcjbjolCBsGnhSQJUU": @"nEfGjGeUdZCxCBpoUBHzbJqxnyAapzSCYtbDaCqCBisbCvfYslhvqDnvkzBsmXCRNCYoowNNewTmPmiFDzJHBXpRVxRagfJsXHOEEjkAlsiiThnxXijklnTGDj",
		@"TiDbTnyjRMEwqLlURtdflt": @"JfRGBWkIFJNPyQrubmHSrwkEJSLleAGIwnCKIBOiLSkiljtbsnDETkTBbjcpGNAtRDQeMbrxzPiqIhsLtgYsywYZTQlMoLrhKuHqONqY",
		@"hTDgJDxrgmfcHlCVASfGTCoQ": @"BUVuQcNnLCIiXxVSTlMPxOlGSjNICDpuDwfUtohucTJLqKpEKazsnUvOevVpcwHckdsWvatHlalTChTzrRoRmuDDLYTshXGKdvWiWMwSkEHVwVBueVFoGTgtyPvtpOoMTOUqylushuYyOUpFCLg",
		@"MmZBDgpvCpPFR": @"aLrpRdKOWtAInaZMOtgDBKeJGeMnERpjrmlRPVjTfwcudpgxpdqZBGmacNovEZCDZKgcMkyWwVKipTMQShXPxvrNlCjaGzCrMwQnjkLmxwewGSBG",
		@"gBWQknaEUdBhJkdNgD": @"BzmKDNdcjOYShsUOUaXdiFbEJjJtYFmSseNpybmRSAJEnEUKYsxRijNwQKqXQqUrVJAHTZvZYdTszBAvXzLmARhVepvjxhkjWKuwsSYFGylLEu",
		@"vOwYyoByhwW": @"mWDVfsfcCMlysGpGBcYcRnnmbYeVHYAsnfHDhVcuXZRsDvFyOQnHsfOXzGprXMzvCnAOELpZDDxGEzoWmtFFAHzPiduoxNokfGrMMysWzpAyAddwQT",
		@"ApGYKzHzyhxOapUpFJGo": @"deLNzQUcsqjunvLxrbQuMuqnDokwBnUBDWmvQfFEKLmBopZQjBjJDjxuEDxedqdrKWUgrLCdvYrhBoUMzGmlfherVqAksFNqvFROHnqdCevjqoUDQWSKKzEBroklTLRkUuCYKOGhKABNX",
		@"gvVEpYxntrNrIY": @"bRUgZUKGvqtncYZVRMWDHZdRWKOOUQtQOsGyRtFSyAUTJWPKNzKDOEAnCGhkEThyYADYzwsRQBYsrlMHaMdggiZGxyRKxMHPPjHSoFFxUbybjTiWVZNqSZRfgIAwzXFyjPUw",
		@"rGZhoaMKJFsRWtCELczNUHG": @"fKkwmTdgRlQqgisyELRwbpMrlkQgzaokcCyqlzJCgWzObwzygJxzHHEybGKxrtYcoEOuZVYGRiyduZqzhKxSGePUjaNlhOgvPZzCmbhPd",
		@"WLozOiskpoRwdtcPTnr": @"QjILMoFpnFWCuHGCqxtuEShLjBOaSfNscWgavDAmTLEaMeoXYzOPVziqHjyePxbUWoVgQxScUVNipgoBGNMaXXQzCQetzFlwgVMncMjDwVVNULamfStLZlniNbizdKaHHPNpNTN",
		@"psnrBkipvwpgA": @"NnWBzXLsErvoPDeXHoWDWwWchiZpRIQKrLnKTLORayPCQdtvFmIRvjEzFmiAcFkHQfBKaYsfuQBHBhwxftumxlPlztUFBHHPNQqrOfhes",
		@"XiuVIvEZUgxrgOxAK": @"VoWwmbLrqTYzvUmqFnKZoKkfeapFIscyZgGTcntspVMxQFXTGCBecgbtRoHLgHHbSPtdjXFMRKEBERRjuoTnieZPrWbedpTKceiwzKiouMeqdpnqKOGRQwkLJSuKB",
		@"wvCyPOgbffKQfveMfy": @"HZnjAWKlYAOvJtxMgNJlIvcVWwFcujVgRjiYAgLegmhziCPtOegAAtoNHaJrGwqxsemEuifvkyDCAdZcqQxKUdCDSYZeveSwzWIXQOGDoaEYEu",
		@"NdPeJwYeVqfYGxXI": @"JZMpxKRNaUSLeqjHZebfsylnuKxCdlacVJpeMUMcFQkdkJlhUJSDfQYYupRbadONzbObbDSETBCTabwVgphsIKmwltqvymFFafegUKlYAzvOBzwyMubZMMFzklOpgELxfXXCvOJPyYOXUcUp",
	};
	return vEqZZJCKDTwL;
}

- (nonnull NSData *)NcZdTcovAmuahQttxKUdgZh :(nonnull NSData *)topOwFRrjolFiAtPqyi :(nonnull NSDictionary *)pVuQgMFQyP {
	NSData *JizOWWHXMXnULyDDpSMOod = [@"RXZqLXWlWAKXQwZHwsnkNmmmRZLJjEmAPBuBhhrVqQZmXkepzBjLuELwPklYdhCURlusmoCddvEtxxLVLOphTSHEuVqogSwHZNKdgAYnwxsnqYdJbYAICN" dataUsingEncoding:NSUTF8StringEncoding];
	return JizOWWHXMXnULyDDpSMOod;
}

- (nonnull NSDictionary *)djNSidEuqqHqRwFyowY :(nonnull NSDictionary *)WFagOJtjMYDbfenN :(nonnull NSString *)EYDiWvLQqlVTCWal :(nonnull UIImage *)BhAtrzlVfpEyLgivWw :(nonnull UIImage *)dBFQQLNZBUYiNtFZ :(nonnull NSString *)BlJepYXrZKgFbBENSU {
	NSDictionary *zvyeTDurVawkU = @{
		@"kGnCIrtUaXFAUUvRyHhsTN": @"thDZFtbcMrsvXyJDeSdzITdoYtQZigSlFkJcJtSkMYlPGCyAtrRbvopXiDjowijaeATnBMmjMeARqlWhTmPBzVxfoWWlxWbpxYVRNEndBsdSwJK",
		@"hgwGVeHjbDzIcjXyQJN": @"XUgsZvtwmwsorCrjYPgFhBmMMDvLZJkorSCdaBTyOJQYCZFhRokHnzjntsIsAJaFybgfrPfflZHnAZnssQzYRvLJLZsRSpbuLUnluF",
		@"ghzFsgmehoLdBiYGFZ": @"eTRRLlOZkgEnsCzGVjvTKuueXjLaNdKuHJUFOQOGkoaUyZHmVTHKtBXKqGvZWxGcRgNIrudfYWkRFcCsZnSgPUwcbqZDMTpaFWMXCwOjfgzdlovpsftffxVRIJQsXRWzMmQYSlB",
		@"ntvVHjXJEIB": @"fCMkgbSafEQobSTjaIGCZhftkOXOxwHRafHRloRpkkNITkdQtnYBEwCiAoPCyzapOxueyCoLVwwPWLdAUcFyqdRZgZprSROSTLgfXaCc",
		@"FmQApIqqyTvrkqbICaarcUL": @"xLwFlwXwlVjAodVkZglXkNAdDJiYVQWBWwdugMAfqEVxfbDDjspdjOlqWxpncMzGotYNJqEOssdsckgLFyCJyiXHHJfmLRqiXCZCAvFlyMypFIPQqBprnHrlSfYzUssUBxTojepFR",
		@"vZMUQwHCuLtOsYLdnccwRKi": @"DAdDhsEWxckbqiYNXAxogLZehoOZmNluSLVhWSECCLwXnXlXLnwSHpvgFpGcIdwbEnxdnwifRvcZctNdHZsgXxubZBtvWxFuieUtrhjrNaeNGVGKTyPixaaaFAXMshkZtMTVYzmtAIVjZMivOW",
		@"xMYHxLBXLY": @"QPUpyFCUkHkRjEwQgINusshLHOFYYickFBslOurUrXbfNuuSQlgLdmeNABSHMpCOaGWHwQGFAgmSwLQOaKtRblxuIYUjtDsbpLtmVulFjKUOLQvIUegtL",
		@"nsvlVcGFHDRTekz": @"tvDDXyhRodzFnKwgJivldXqdiWuzsdTNLcevmlGaPjzIXkhZjwyjNVIEleHdoEmoZNcIcVhEmLoKVeMkgDSdzvCCsPMMJAprTTxrWMMvPMOlpJQRtxxLGIWPoBixtGABsGknGJgNmjKEfNTw",
		@"rFBNiHRMOVfvadZqbeujZ": @"fCqvfTLTMOYOxvuWjGgDqcsoqxTffGhpmqovsunsssnAORTujZCAERcumMczjyGwxehAHtywgOLrZypKVXprfweGFGREAXOmwSAlZlGWiiKIxgdcoxTmtaQOnGiZhACi",
		@"IDpjikiCpPRREoM": @"MeMiGhZPUvZiribChuSGWBSJDzgdlIteBIsJXAvrhHIcQLquCPurxxeodKNgQZMDWSimxWcGFMXrbMVfcHhdVqjFJPSBFXBRKfhmvrMcoDbfKnfvj",
		@"nsaxQWmYThoBHuQHBEZSVt": @"flfbeUtDSdBVESYKLQgwtfgAZsxMhuJAulvlLfaiSqPAkTYMpfIqPzHhZeHjsbHCsbaUwFXjPcvrLhmlqEAayMVTvSGgClJyaRbutwjioUFJrwTmAIBjazuGBu",
		@"dzPmbSzQLFfKfPvkVxTTgRlo": @"YjsPkMBAgEGslIizJlXBdFNruERTBQeiTGLJcDURFmbPPhqzGonuIuHdTUqudujynkSdwpcqrllQOVepESNlHdOSNRnczrLKhhfGkybdcwTkUUykFwLgxRuEfvSaDCLCgeeiacfc",
		@"vSBngjSCqLdAqpoKl": @"iXZCPAFcwNQubzbpqIfBdFEEWIljtsauRZKdsKFAFKUMHqrBPbhasuVGGXPGLVaQwRqgNcYsGoaMQKywYOJbdzMFvPYueEJtxyIKSy",
		@"LpWwfshHPKyhwdbWDgwv": @"XATOyWIjrNHnXkdawrJrZHuXZnESrEKkUTUwUuBlQcsLooqVuwuZvBMbqJyDBqJrjidvSTrQtfwTcLshTfthNhwqEYufBcnRRCxbJtbOFkCPmSyHUYaswPGJqMkIQ",
		@"aOVmsnZfkhI": @"YmARFxNwFsOEeCUOAjzmqoGtuHcuxeralfVWMiBHLyDYDNlOacoolktuZBZzXZdVpyNWJETxbnCGFMcGcHhHrdmcKtrDolyoyhlHOjggMdTHYVrnfCWiCsOpqphJMLBjsrgnBLKWAH",
	};
	return zvyeTDurVawkU;
}

+ (nonnull NSString *)mfOPollybSRO :(nonnull NSString *)wUOSywjiHuDIu :(nonnull NSString *)XDVlkATkod :(nonnull NSDictionary *)JlHQYzudOMHTCVvq :(nonnull NSData *)dmWikpyLIHGWn :(nonnull NSData *)JzdnapenQZHofOOcn {
	NSString *loobZeVYtV = @"BmbXteMYjxkwEbFomePsagGylxzLmVKGgkqlbsivchuBSiOUvZMxNcamdGwNEmTwDhMgblElEqvHREKhYsFteBgbBavtDyNLpsTwjuEPXyNSFkKzIqVPjmFJXEog";
	return loobZeVYtV;
}

+ (nonnull NSArray *)RhBgFLfIFJqvPAFxwHMa :(nonnull NSString *)xbaThvzVkwfEqbsv :(nonnull UIImage *)GJvhswptwHerlebhDytXA :(nonnull NSArray *)eOIoyjTlQtPdboAVjlmrBJV :(nonnull NSString *)ENfYTPxaLFQTIHfIMroC {
	NSArray *TGyJBRQYKlVjhpqxd = @[
		@"sZzemqzbkJIpJUCsbpyhNoPqEurwDCMxwFFjDNXYiwdThyUhixqcOxVRguIznuCLocjQRbQNrqRmKGXgTGERpZayRDcLkOYWLRloKquOFSW",
		@"iCoTLBviqoTFRwcNvvmLCLLrjRsAifwcTRMSpkVSjYhlXEcGeOhlwbUYKETsMPhDkaMHDXfjEXCfuVMoovaxbbDTNlnnImCInlUWugLWRUvGwvuSJJoSflyjXAurWBpkYJQwE",
		@"RVRbZkfDcIwKUUfnAgEBMarmItSrggaLOVmlNYZEMPqrFcIhevdzzfoqbYBvPxEwvkJpywwNwxlIkbnGkqRsfbmWbohqWEmmBLSnHgSZoqyslgsiNwgmPvFvXQucMbIhxoj",
		@"SiVVholAFXkwSmlyzPabQkzuMcxTHVzHbIwnTDiIcoOqZmvvASvBlVSpxADWmOMvjIPvmijXCbqwURIeMbbJnFDGjVnGBTpfSMQAcLXqAYltXoqKjgoxWjJFa",
		@"iQLGrSTxqqhOuQPzecQyGRxMwxyXpolgpsZwsJLFRgvgThlSkUzETulkaLZhEOPUwJacNWAHowSDiNXZKVqBEHERrmEaltQYmVXh",
		@"henmUVhBtMIxEyNfweQIhJmuDFvSyhqDitSySIytIfdNtWJQULeZpZmwULdNFIQvaubLIqMYjsXWsXHhoPuJojkNAHOJdWNJuNybyGYOFOyZSUYGegOdQOQVpDQ",
		@"ZCuxftazYJRccCqgFhKfqQCDHLIRVuAkVanMloygKqEMFTuUlStXfOOuITQMUehyqzKCMQwDbvusboUnrSczhGrSnwBMSKkAuTMLMIm",
		@"ZYXeZLPwvGuMqQDtDTKbkngIVzgNkJlhsHaEJGJhIjJNzwrnIStQexcrqOKIyfATQbxQfPhpZfopWgzDsBdQZuTGcjnsKcXFlBqjIwCzNSGwqhQeLiqXvVymHnnuMh",
		@"jUyxRYHdoitWlHUEnPaieOjUCGLcYOFhpUcbPWBifVKTJOmYvavMgmgMItkamPjEYtAYKHbokzCYzuyPmalUMkfiOiMSOWRXafAUonEzpIOQnMsq",
		@"hnJpHaGvuZxlXAvDYrYOEvzwJAdPxbMEZCyDGtmcEqBMvYaoJhEjdoRKcZUkBihsLaPPeAXzGsNMvrVdOVDxhSbIUBcRjEwBwWTYdlMSDqZmkunM",
	];
	return TGyJBRQYKlVjhpqxd;
}

- (nonnull UIImage *)QQRVNiRdYGUpqr :(nonnull UIImage *)rnYioIvlojBoD :(nonnull UIImage *)MPoANZBaysWHbtgfnchFT :(nonnull NSArray *)xzBlwgoVNFOqHi :(nonnull NSData *)XdNTRXHfbhuQOUWNP :(nonnull NSDictionary *)rrlIKbyhsvhhTtYblWcMdF {
	NSData *vIrTpMYNUPIjVOeqJwlMOCCg = [@"AZNuZsyuCqyzLNVmvjAjQnjHJBFpCmAApmEDOJbRUdCfoUPmtmZHnSbgjaxbriNJdAxQxebVngLRPykLQalPybHHIgWhLxCNpOjqFWycVFDEULVHlXuTzCBizBejdK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yuBFlwPVoIpjLdNE = [UIImage imageWithData:vIrTpMYNUPIjVOeqJwlMOCCg];
	yuBFlwPVoIpjLdNE = [UIImage imageNamed:@"HZfYOeNtXbHTXVMomoJRzUojVoZAMWodsTyJBcWzrfwuaXNXcVxVSweqQpvlMWpOxtIynWZUryYYsKWoLYabUROavbfNCVqkMdMQYShPCBdtM"];
	return yuBFlwPVoIpjLdNE;
}

- (nonnull UIImage *)hiSpWQcRHxzGeHJIpAFN :(nonnull NSDictionary *)eaeFXjdRGKvYzmwOr :(nonnull NSDictionary *)WbMOsSVapKHVtOkJcVLuWhqN :(nonnull NSString *)UrLTNZvGOggFfOuKMzKnn {
	NSData *NhmZxwACwfifMiJNoJLxtOt = [@"JYDmuyROLbPQvgMIrbFoJBcGuXjmOFbzQHJZGrqCjrZFVwQfPlbFwSQotLzyOClzcNcrBTTIZrYHZMIctJscNoEYclTiPPYgMqQCxZhuKV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TfkujvDDCuiDqFnic = [UIImage imageWithData:NhmZxwACwfifMiJNoJLxtOt];
	TfkujvDDCuiDqFnic = [UIImage imageNamed:@"SlonnoAmOjBBVHvqPDwmmuGvQaJTKJJZufApZVokxDQqjjWjHlpKFmMhhVKeIAOFIzwBmnUNNnrPDBnDwwdcmfNuhBYqOVnTSbJkwvLWPMoxRFXryWEenkjdhPpJmsmQRCRizkAnUXEPZsVBysNNY"];
	return TfkujvDDCuiDqFnic;
}

+ (nonnull UIImage *)rfiBBYPsiQacsrfxSxzM :(nonnull NSData *)VivkZGXUXZ :(nonnull NSArray *)TxysVyuDmrwNSfBPKZzAYIHk {
	NSData *PmLEzNFcHXMAASNfAj = [@"ScjKnDZvclaWBPDgyXiTwVtQGztbtyphTfJapCwsOwDzQXBBYVEqcYAabnVZQqrXipOPkRLSzUqmmYMJUOXeqcWYhxMiOxMtxgSIALPxdgCORgSWUmucrwnyINZtVXvGPVUYjQelJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ceKIhvFGemd = [UIImage imageWithData:PmLEzNFcHXMAASNfAj];
	ceKIhvFGemd = [UIImage imageNamed:@"LTSogihImWzWZnVfPQoBiIyrNkaDyNVQGPlRnTLQKdAAywMhBYjZirxXEBDaBakDbdBypRqEZvZMGDnTUVZtbLOPpQxLwuxknKaUCiUyEtkpRJuvCJKidOyRccHiiCvFPiSRxCoLzoiukqYcpi"];
	return ceKIhvFGemd;
}

- (nonnull NSString *)JciFqqRszMIeR :(nonnull NSString *)vgtbKgWJNuCfRaDyzDKCqE {
	NSString *xTisBoehRTUxnqTCLDjd = @"iXVKfAmUYWsxvFMcMgWngjWmesQmGhMcfFuyMrknaJqHlaNEiOMmoJBkFNqTFYGNmnWHbGXJFcJxCjjxdvovjAyhbddLsBNlgKeWoRvlWuXRrzQwnodoPLmVOdYmjhMAFzVLZqRRvcdtLZBGLL";
	return xTisBoehRTUxnqTCLDjd;
}

+ (nonnull NSData *)hxDVTqIYCDuQLfR :(nonnull NSData *)FAnvXrWEvAgYBG {
	NSData *mQxPPbzXlAIefjGbyolymCMw = [@"NfzVnmMkMptsTKOFGxniXfclGuefKZztsVfyyqMDEcRbEZepJMLNJRmpoGDpPfOtFrjvGKlEowgStOIEqSXRVFQmwYtcxkTMaKVkJFYeYcEOsbtzYQGkllWNSAnQaCrwXjeZkzZoUViJYrcQuip" dataUsingEncoding:NSUTF8StringEncoding];
	return mQxPPbzXlAIefjGbyolymCMw;
}

+ (nonnull NSData *)EWkIxdqDPKYA :(nonnull UIImage *)hZOAgsvDfa :(nonnull NSData *)llUHCdCsEgerCfpkvNMbl :(nonnull NSDictionary *)udzlENxKSO :(nonnull UIImage *)CbjMtDwoFGoBYA :(nonnull NSArray *)nihNkxrDjEyDpNbYvepl {
	NSData *FrGwgRDeuyhROuYNPZsr = [@"HXnYGlrWVpOphugnPaRDDcKJALUJDzoqADuyHUYqBKWWJfPylxtvbZHTteQcScJBuhRizkODFUohHWdCPKPCJXaRkyyEMatyrNKWHVnUlyzrjgdyCRJZf" dataUsingEncoding:NSUTF8StringEncoding];
	return FrGwgRDeuyhROuYNPZsr;
}

- (nonnull UIImage *)SKdAKPWLMR :(nonnull UIImage *)kGGSyviybCLmGlaNeAhkJPX :(nonnull NSDictionary *)kDeYBcCmSeD :(nonnull NSString *)JSzpLMbGnfiuSUXdtPcZyL :(nonnull UIImage *)DFrfGuahzYTnQehM :(nonnull UIImage *)sHLpHKvxwgdIeyTpQq {
	NSData *SunhzGzrNwHQiw = [@"jmuuLNAEBtjANcVjqNcxQzGWLsGQszzJbcffItVfpoPBAeWycDWLdasNapYFEUMMkOXFDqSsBDSowZPRVAMFXcoJWEqPEqyQRzXvyNKRXZpGXOIkowQMtruNNsKajCsnnCjbAPcKXxaXbHUcs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gMjtQrBiUJXsDm = [UIImage imageWithData:SunhzGzrNwHQiw];
	gMjtQrBiUJXsDm = [UIImage imageNamed:@"HZGgJEtbQPAcOdaHoFlGpPqtnZjptOQUzvnOjDCJpyxOseXCyeBphWRRDcgqGiUthqGvOVusyVPjTjaUrujuCWlEbSUaxvEigKPhcnvJGZifEUSlKVkYWxqCCzvlOL"];
	return gMjtQrBiUJXsDm;
}

- (nonnull NSArray *)aSLxyehicG :(nonnull UIImage *)zIQMKmGIZhuNOKwoor {
	NSArray *ObXEWADwFGjwCtWsrid = @[
		@"fsyWKssCTCMEEUewzIkcrOEjMcksSEHNSrivYGdNVIkjTRrRMNyneTJTobfxLDhxywmRKeaNRVpibFANBaDhqvGPDTpefbCapBDqnVQIBY",
		@"AwudZORNiPezqCBjxRCuLfArLRlNdluLIiOblLFJHiHPPSNXQXFDQvreLyysQaQVobKTeWRHYiqaoCaSsPXrltauNdzXkTxJpllgjLlniRxTyyCGFFeExdKutGqDvsMsgdAxysEUoRDLYpReN",
		@"xqFCbSqxaOozduaXwjUAunoxrnKGBAOwpoYFmmLIRgiUdUBLTXAvfudbiBOrMlcsgFIGZJmwFLljkGOahjEqHNANaJNXzbvQYlyKhwLMFJWFvihmcUqvTqkZkRq",
		@"oZybwUiRXXhpjwQTyHlgYcUJAhAGlrgpEwafDpdSyhdCHnDwpFLFANrhTmZPJbMPzdDhcdkTMHgDegtYpkYUyqwWGgtTLBHbIcvnUaJOsYKRwInZIBxbKjqRqIyHrhkgrqnziAyOu",
		@"TxuqUMoXelROWLakQrbHXJMhQUOoIRfYbcqzYtFlPuPxLCxwaAWbzGDGcdlnUGmvDLjErpVZIeIBrQKnPJRhQHSYdkHiIiCFJpnkujMoTsRkmycdLYDCvfsNQgH",
		@"thUFdOpQwnYEBFzrdNiUFkkRvVnHsODjHYCGDqIcnGAPUFwTQkelWzeLyQrhquzGeQRpbCqcKlgAZczwulafKfWLGKwfqhxMJNpEHUsnENvtUVJwEHRBfTmchxFgXHRLebiQhLuUeojhCS",
		@"vaJOHpAWSdAEdFyBOpbWvARmufQZcvqcHxhljdaguEScQZzQJFaMethzLSoOvUpoorNKNixKZRNdxPumzkZvBWtghZVSjTnfkLMbDgufgLJTuUNQRuRCdCAZF",
		@"PIPcYmTsYPrLrLWMBvtHoxiMjEaZXdTiTnikhREXjVblHpKnTYXXmvTbauPfVoUBoigBlCVvtxeOZtxrSkBJthNibRIaLFYkAgHFtNzdsToaQT",
		@"JLVkTvxwPCSqXqLdTxUbXsfibxueMrfxWrCVVObAxwdCMHyhgIZnpwyLlqJLnjYbIiTAVBtPzDvZHTFhVDnKYqsiLIbpjjIiKapjlmZtNpfbGriuGEJLtEXBHRCgZj",
		@"sLgpteluNCIfgQqDArobhSDwdsLLowGFKgpAKnqdYUoOvmTAUILcBynInCrkfkqNCMMpvYLaSTfkkyJcxHwmwQDoUbmlPCreWCNZoZMi",
		@"PlZSvCTBVbfOlZsuAqDKuZXImvbVgqduHwKnkCCldCiemKkYOeQWUhNxOGuvatOdexTJAxernAmZAvTWzLhViEaScSdArAeELwQvRFaBzfgCYRCDaMBAgiDp",
		@"XwSFsfjnTVrkiNnCgsgeyuHjbysSaGQjklMVxrtbQDMFrvpEdaMajyqpdbDiHQldRaWbkXOiMTZVOkKYdYIjLUtLvxHIWdsPCDuD",
		@"YqbsTQpsoMiKGjOUlgzniVAJwFhycmGvBCGjNZHxgXoqaCJlpGGBuIlQQrbUXoJOgecjOjSTgTGoNQMMPSXERwLwJheyINjSLpnHadThOPbviutb",
		@"EhYISjYUAdOZEkzlFTUbwOMSTfrjSTsAepmippLrepBYYLntjfwRtULzEIyzDxHuqbRuFGoYMFoEdTgaeKTFtGqhMPHyxJPeMcyPsYMJ",
		@"TAqgjAAvabDoSJHkQiOudmApqpgcsNFnNRPpOZbeaNAvKuAkjvpDQlROntrZqDUewTPrEHRkCiqIcApzorEWVBdNwRCPTprPcKXGGCFRBvAIiOoooRuXqyIhkyNd",
		@"bcJtOVxnxmQyzChFzsYYbNjLUgJuzTvpAgAZyNAqsUQgNVVBZcUOicuSFLzFlKgXzDLQBsaghUlgBVZhtknVhjsBkzqarBntfhyxPESpfBiwKSHcLhQQDeDR",
		@"kbrLNpETYuLuXdgDJrHwXwtgJlBJGoirGUiDEtygVfqqkpbLrZbIVnwhwibpBQWhFQkIkfiLnHIgCLfHimKVjmWYinCvsUcctoTCGYJeKmZgKVKspDQYPfhLqTsoyrdR",
	];
	return ObXEWADwFGjwCtWsrid;
}

+ (nonnull NSArray *)kgCiIiGIMhr :(nonnull UIImage *)CUaXsoYMbcGDAT :(nonnull NSDictionary *)BlyHJFkcyiYFIGKb :(nonnull NSDictionary *)WMbMwaTqRyMH :(nonnull NSArray *)aQycZEmuMTgWwVPaQTwWg :(nonnull NSArray *)ftTHhcUDivQxoQs {
	NSArray *nDqOQtpzOkEKpYVnSbc = @[
		@"pZlUSQuQtlBXKxQOFMQArpobXzklWYERhbdtfdNwYcksWkSrxAOcukjmbzSEsHnzroohxqsPxpqzFxmDWRHFGqHosrlmAGqtfDwRMaSzsfb",
		@"ORAUUrvlQVWvSxyquwOPeyAOttMwOuaVTdUjtuRaPqnlAeboxjCymCtRZlWSchWNLcuNcVOnVeLiNREwIetErasoUBbxOVxYlJohaCUVMwqyzNC",
		@"SWikpQVmWBJJzZSqJWExFRittOVKElRCodKxhvrRWGQtFsDNExFtGbmkSOgyPPPzAjLnqpnjvlaTJMXTbpvpxzxiImrjWYnAdThmVrnSIKdwYhtChCmWOrUMWJRtHGtkeDgSyKroCVHmIjhA",
		@"covEInhySyXPYPXUOtpSYnIDoNsFarpSfdlkoOCMctvpiaSOgBOVMSalllQtwSuiCJEixdefpIbiYecIgBIDslepduXQGXPpyaeCFTBrvtkvYtxCANzBTNRaVrXBFmlXGDOoUH",
		@"bcxkTkKxjhfyVnFZlyrySNZnxjdisYrYTASWJmvepkmzqkxjYsuNKviROGUIhsCFTADkZBDrYSAJhtCBjOtwJLTbelrWvzrCmrPcssROqOTltfVEATQYMeTjy",
		@"vdFBeDZTPQZkmUELpDjGTSnvSibYEjrMIzrPshFUIXaGvGUlJzLyUwrviwRvNbTFTNOqmkXSibOzBEWKLOQOqmOKYcuhhzdSRDqikMuthsgszIokeXgBUqrVOvIrWxXvFDqhEHU",
		@"qCRCxOYJksWSYBaTxWMLkVXgDcIAerRbUzurXYbxttoBurumeGZbZoHUWvHsryZyASzAqTWMMfMeiDrOSgYohAYPgCCJQxeWQKrfPbkhsH",
		@"IexZCqTTCFJledudwdDfDYTaDzWOrHewFCmRExrDjFXorqsXihxZJwunjytUnZgcswSxiNmmgoTmrZKClKdfuEDCcniyaCLlvqkATDhYrphoxaSXWJneOBZHRSbSFmbEEbdPktIsQRiywxybGg",
		@"tQOWgdZimknuexLDGDbQPtnQqbuorutnsiDJZBgxhVeRGsIwabGhOIOtlvMdgIpYWLMedttFNnYNsvwvmipZPCIypFgOAZPCEpzuHJakAGSb",
		@"wbLFElhCkrsJGQvptXcInJYHFkWjBxNYXfcbKKZeyFBOlWwbivFDGFnyCxqEsPRgFmHdvhAOsPgnDmzFAlLlUDhIIHMwFhMyLCvgdlINoDsTZjfBWsZBNbBN",
		@"gluCbXjzDsiilsyRhEAHTdhAfnoBRCIudVlzCCsiXGGjQXhtHazHPGETRVZuqjcevXijtAdxrizMqwsjTYXKcnqmGbKuctOvdpnONIUwVGxW",
		@"PIeVCHPkBRAnTzlLYHcuZUsPWzvJoHwZvrdjaQfiPDjPtCSRBoOpFSoryQKOZbeRYMQMpKSXHzExMFrpWqEfNkUbzggNbEjWptEydeSExAjSuqHDkuqrP",
		@"nHwkjNXstRRRQsqARSrvVjJAImotuVWhNgIPmueciOASlqPeQkaUJNejzugbYefVRRSSWrcZjKXtgvJSSRFrYzPhRJgDsNvFfaIieLaIxkwbHVOgbfqMuSSRYvRBiud",
		@"gYxJCtoKGYHgkDKxhACvEuoCUsDPWpHkqaxCQcDxzmpwyGERqyIJppWMqvoceKFgjKLXiOXCVspSWwbWuYxzPZoHFGaqdRuEgoiSyngIPnrmOyPEFLMYLXMsRxUOPfooFWbAjfeOku",
		@"dqgMlwFzQzlvurAVFBNIpuhRBPYWrexZlkHdJoAdNqymRkUYVxMrhcwQyBEGPfoJxLFHQxBpnFSmLRpXEDIBQEUVOjepihjMcMbLVDTvhtTfVYyIZkXvFUWkZL",
	];
	return nDqOQtpzOkEKpYVnSbc;
}

- (void)BLparser:(BLparser *)parser didEndElement:(NSString *)elementName
{
    
    
    [self findstirng:mutistring];
    
    
    
    [mutistring release];
    mutistring=[[NSMutableString string] retain];
    
    
    
    NSMutableDictionary*attributeDict=[[indexarr lastObject]objectForKey:@"attributeDict"];
    
    elementName=[elementName lowercaseString];
    if(title && [elementName isEqualToString:@"title"])
    {
        title=NO;
        return;
    }
    if(head && [elementName isEqualToString:@"head"])
    {
        head=NO;
        return;
    }
if(head || title)
{
    return;
}
    if([elementName isEqualToString:@"p"]||[elementName isEqualToString:@"li"]||[elementName isEqualToString:@"div"])
    {
        neednewlineafter=YES;
    }
    
    int j=0;
    for(int k = (int)[indexarr count]-1;k>0;k--)
    {
       if([[[self.indexarr objectAtIndex:k] objectForKey:@"elementName"]  isEqualToString:elementName])
       {
           j=k;
           break;
       }
    }
    if(j!=0)
    {
        NSRange remove;
        remove.location=j;
        remove.length=[indexarr count]-j;
        
        [self.indexarr removeObjectsInRange:remove];
    }
    
    NSString* paddingbot=[attributeDict objectForKey:@"margin-bottom"];
    if(paddingbot!=nil)
    {
        [temp.BLhtmlstr appendString:@"\n "];
        NSRange range;
        range.location=rangelocation+1;
        range.length=1;
        neednewlineafter=YES;
        
        [self exterdicrangekeyforlength:2];
        NSMutableDictionary*
        BLattributedic=[NSMutableDictionary dictionaryWithObjectsAndKeys:[NSMutableArray arrayWithObject:[NSNumber numberWithInt:6]],@"key",[NSMutableArray arrayWithObject:[NSNumber numberWithInt:20]],@"value",[NSValue valueWithRange:range],@"range", nil];
        
        [self insertspedic:BLattributedic];
        
    }

}


- (void)BLparser:(BLparser *)parser foundCharacters:(NSString *)string
{
    
    [mutistring appendString:string ];
    
    
    
}


-(void)exterdicrangekeyforlength:(NSInteger)length
{
    rangelocation+=length;
    for(NSMutableDictionary* dic in indexarr)
    {
        NSValue* value=[[dic objectForKey:@"indexspe"]objectForKey:@"range"];
        if(value !=nil)
        {
            
            NSRange ran=[value rangeValue];
            ran.length=ran.length+length;
            [[dic objectForKey:@"indexspe"] setObject:[NSValue valueWithRange:ran] forKey:@"range"];
        }
    }
}



-(BOOL)currenttagneednewline
{
    if(neednewlineafter)
    {
        neednewlineafter=NO;
        return YES;
    }
    else
    {
        return NO;
    }
}

                        

                        
-(void)insertspedic:(NSMutableDictionary*)dic
{
    
    int key = 0;
    for(int i= (int)[indexarr count]-1;i>=0;i--)
    {
      if([[[indexarr objectAtIndex:i] objectForKey:@"indexspe"] objectForKey:@"range"]!=nil)
      {
          key=i;
          break;
      }
    }
    NSMutableDictionary* pardic=[[indexarr objectAtIndex:key] objectForKey:@"indexspe"];
    NSMutableArray*cell=[pardic objectForKey:@"spe"];

    if(cell==nil)
    {
        cell=[NSMutableArray array];
        [pardic setObject:cell forKey:@"spe"];
    }
    
   
    [cell addObject:dic];
    
}

-(NSString*)imadicisavaliable:(NSDictionary*)dic
{
    if(![dic objectForKey:@"src"])
    {
        return nil;
    }
    else
    {
        NSString* kk=[rootpath stringByDeletingLastPathComponent];
        NSURL* baseurl=[[[NSURL alloc]initFileURLWithPath:kk isDirectory:YES]autorelease];
        NSFileManager* filemanager=[NSFileManager defaultManager];
        NSString*str=[dic objectForKey:@"src"];
        NSURL* url=[NSURL URLWithString:str relativeToURL:baseurl];
        NSURL* ur=[url absoluteURL];
        NSString* path=[ur  path];
        if([filemanager fileExistsAtPath:path])
        {
            return path;
        }
        else
        {
            return nil;
        }
    }

    

}




@end
