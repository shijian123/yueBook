

#import "BLLeave1.h"
@interface BLLeave1()
-(CGImageRef)getimagRef:(UIView*)view;
-(void)moveto0;
-(void)moveto1 ;
@end



@implementation BLLeave1
@synthesize datasource,midclickdelegate;
-(void)dealloc
{
	[bl1 release];
	[bl0 release];
	[toremove release];

    [super dealloc];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        bl1=  [[BLLeaveview1 alloc]initWithFrame:self.bounds point:1.0];
        bl0=  [[BLLeaveview1 alloc]initWithFrame:self.bounds point:1.0];
		toremove=[[NSMutableArray alloc]init];
        self.userInteractionEnabled=YES;
        movelock=YES;
        currentpage=0; 
        nextcount=0;
		movingcount=0;
        currentpagetomove=nil;
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            movejudge=7;
        }
        else
        {
            movejudge=10;
        }
        lockdevice=NO;
        locked=NO;
//        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad&&[UIScreen mainScreen].scale==2)
//        {
//            lockdevice=YES;
//        }
        
    }
    return self;
}

-(void)moveto0     //移动当前页上方的页面
{
	movingcount++;

    [toremove addObject:currentpagetomove];

    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
		movingcount--;
        [((BLLeaveview1*)[toremove objectAtIndex:0] ) removeFromSuperview];
        [toremove removeObjectAtIndex:0];
locked=NO;
    } ];
    if(lockdevice)locked=YES;
    currentpagetomove.MovePoint=0.0;
    [CATransaction commit];
}

-(void)moveto1         //移动当前页面
{
	movingcount++;
    [toremove addObject:(abs(currentpage%2)==1?bl0:bl1)];
	
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
		movingcount--;
        [(BLLeaveview1*)[toremove objectAtIndex:0] removeFromSuperview];
        [toremove removeObjectAtIndex:0];
locked=NO;
    } ];
    if(lockdevice)locked=YES;
    currentpagetomove.MovePoint=1.0;
    [CATransaction commit];
}


-(void)BLviewSetUIView1:(UIView*)UIView1  UIView2:(UIView*)UIView2 animation:(BOOL)animation DirectionToNext:(BOOL)directin
{
    [(abs(currentpage%2)==1?bl0:bl1) removeFromSuperview];
    currentpagetomove=abs(currentpage%2)==1?bl1:bl0;
	imag=[self getimagRef:UIView1];
    currentpagetomove.content=imag;
	currentpagetomove.MovePoint=1.0;
    [self addSubview:currentpagetomove];
    [bl0 setcolorsss];
    [bl1 setcolorsss];
    [currentpagetomove setcolorsss];
    [temppage setcolorsss];
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if(locked)return;
    
    
    
    movelock=YES;
    isClick=YES;
    touchkeymid=NO;
    isload=NO;
    limitload=NO;
    UITouch *touch = [event.allTouches anyObject];
	touchBeganPoint = [touch locationInView:self];
    
    
//    if (touchBeganPoint.x>(self.bounds.size.width/4.0) && touchBeganPoint.x<=3*(self.bounds.size.width/4.0) && touchBeganPoint.y>=(self.bounds.size.height/4.0)&& touchBeganPoint.y<=(self.bounds.size.height/4.0)*3 ){
//        touchkeymid=NO;
//        movelock=YES;
//        return;
//        
//    }
    
    
//    if((touchBeganPoint.y>self.bounds.size.height/6.0 )&& (touchBeganPoint.y<self.bounds.size.height*5/6.0) && (touchBeganPoint.x>self.bounds.size.width/4.0)&& (touchBeganPoint.x<self.bounds.size.width*3/4.0))
//    {
//        touchkeymid=YES;
//    }
	if(touchBeganPoint.x>=0 &&touchBeganPoint.x<self.bounds.size.width/2.0)
	{
		touchkeypre=YES;

		//
	}
	else
	{
		touchkeypre=NO;
		
		//
	}
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(locked)return;
    UITouch *touch = [event.allTouches anyObject];
	CGPoint touchPoint = [touch locationInView:self];
    
    if(limitload){
        return;
    }
    if(!isload)
    {
        if(!touchkeypre)
        {
        if(touchPoint.x-touchBeganPoint.x<-movejudge)
        {
            [self loadright];
            isload=YES;
            return;
        }
        }else
        {
            if(touchPoint.x-touchBeganPoint.x>movejudge)
            {
                [self loadleft];
                isload=YES;
                return;
            }
        }
        
    }
    
    if(!isload)
    {
        if(touchkeypre)
        {
            if(touchBeganPoint.x-touchPoint.x>60)
            {
                [self loadright];
                isload=YES;
                limitload=YES;
                touchkeypre=NO;
            }
            
        }else
        {
            if(touchPoint.x-touchBeganPoint.x>60)
            {
                [self loadleft];
                isload=YES;
                limitload=YES;
                touchkeypre=YES;
            }
        }
        return;
    }

    if(movelock)return;
	
    if(fabs(touchPoint.x-touchBeganPoint.x)>10)isClick=NO;
    float x=touchPoint.x / self.bounds.size.width;
    
    if(x<0 || x>1)
    {
        return;
    }
    
    [CATransaction begin];
	[CATransaction setValue:[NSNumber numberWithFloat:0.07]
					 forKey:kCATransactionAnimationDuration];
    currentpagetomove.MovePoint=x;
	[CATransaction commit];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(locked)return;
	UITouch *touch = [event.allTouches anyObject];
	CGPoint touchPoint = [touch locationInView:self];
    
    
    
    
	float key=touchPoint.x-touchBeganPoint.x;
    if(fabsf(key)>10)isClick=NO;
	if(isClick){
          if (touchBeganPoint.x>(self.bounds.size.width/4.0) && touchBeganPoint.x<=3*(self.bounds.size.width/4.0) && touchBeganPoint.y>=(self.bounds.size.height/4.0)&& touchBeganPoint.y<=(self.bounds.size.height/4.0)*3 ){
              touchkeymid=NO;
              movelock=YES;
              return;
              
          }
          if(!isload)
          {
          if(touchkeypre)
          {
              [self loadleft];
              
          }else
          {
              [self loadright];
          }
              
          }
          
          isload=YES;
          
          
	     if(touchkeymid)
	    {
			if(!movelock)
			{
			if(touchkeypre)
			{
				[self moveto0];
				currentpage++;
				[datasource BLviewdatasourceCurrentPageChangedBy:1];
			}
			else
			{
				[self moveto1];
			}
			}else
			{
				movelock=YES;
			}
			[midclickdelegate  BLMidclicked];
	    }
		  else
		  {
			  
			  if(!movelock)
			  {
			   if(touchkeypre)
			    {
				   [self moveto1];
			    }
			   else
			    {
				  [self moveto0];
				  currentpage++;
				  [datasource BLviewdatasourceCurrentPageChangedBy:1];
			    }
			  }
			  else
			  {
				  movelock=YES;
			  }
              return;
		  }
	  }
	else
	{
		
	if(!movelock)
	{
	  if(touchkeypre)
	 {
	     if(key>50)
    	  {
			  [self moveto1];
	      }
     	else
	     {
			 [self moveto0];
			 currentpage++;
			 [datasource BLviewdatasourceCurrentPageChangedBy:1];
	     }
	 }else
	 {
		 if(key<-50)
		 {
			 [self moveto0];
			 currentpage++;
			 [datasource BLviewdatasourceCurrentPageChangedBy:1];
		 }
		 else
	     {
			 [self moveto1];
	     }
	 }
	}
		else
		{
			movelock=YES;
		}
	}
}


-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(locked)return;
	UITouch *touch = [event.allTouches anyObject];
	CGPoint touchPoint = [touch locationInView:self];
	float key=touchPoint.x-touchBeganPoint.x;
    if(fabsf(key)>10)isClick=NO;
	if(isClick)
    {
        if (touchBeganPoint.x>(self.bounds.size.width/4.0) && touchBeganPoint.x<=3*(self.bounds.size.width/4.0) && touchBeganPoint.y>=(self.bounds.size.height/4.0)&& touchBeganPoint.y<=(self.bounds.size.height/4.0)*3 ){
            touchkeymid=NO;
            movelock=YES;
            return;
            
        }
        if(!isload)
        {
            if(touchkeypre)
            {
                [self loadleft];
                
            }else
            {
                [self loadright];
            }
            
        }
        
        isload=YES;

        
        
        if(touchkeymid)
	    {
			if(!movelock)
			{
                if(touchkeypre)
                {
                    [self moveto0];
                    currentpage++;
                    [datasource BLviewdatasourceCurrentPageChangedBy:1];
                }
                else
                {
                    [self moveto1];
                }
			}else
			{
				movelock=YES;
			}
			[midclickdelegate  BLMidclicked];
	    }
        else
        {
            
            
            if(!movelock)
            {
                if(touchkeypre)
			    {
                    [self moveto1];
			    }
                else
			    {
                    [self moveto0];
                    currentpage++;
                    [datasource BLviewdatasourceCurrentPageChangedBy:1];
			    }
            }
            else
            {
                movelock=YES;
            }
        }
    }
	else
	{
		
        if(!movelock)
        {
            if(touchkeypre)
            {
                if(key>50)
                {
                    [self moveto1];
                }
                else
                {
                    [self moveto0];
                    currentpage++;
                    [datasource BLviewdatasourceCurrentPageChangedBy:1];
                }
            }else
            {
                if(key<-50)
                {
                    [self moveto0];
                    currentpage++;
                    [datasource BLviewdatasourceCurrentPageChangedBy:1];
                }
                else
                {
                    [self moveto1];
                }
            }
        }
		else
		{
			movelock=YES;
		}
	}
}


-(void)loadleft
{

    temp=[datasource  BLviewdatasourceViewForPrePage:self];
    if(temp==nil)
    {
        movelock=YES;
		[datasource  BLviewdatasourceViewReachBegain:self];
		
		return;
    }
    movelock=NO;
    currentpage--;
    [datasource  BLviewdatasourceCurrentPageChangedBy:-1];
    if(abs(currentpage%2)==1)
    {
        if(movingcount!=0)
        {
            [bl1 autorelease];
            bl1=[[BLLeaveview1 alloc]initWithFrame:self.bounds point:1.0];
        }
        currentpagetomove=bl1;
    }
    else
    {
        if(movingcount!=0)
        {
            [bl0 autorelease];
            
            bl0=[[BLLeaveview1 alloc]initWithFrame:self.bounds point:1.0];
        }
		currentpagetomove=bl0;
    }
    imag=[self getimagRef:temp];
    currentpagetomove.content=imag;
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue
                     forKey:kCATransactionDisableActions];
    currentpagetomove.MovePoint=0;
    [CATransaction commit];
    [self addSubview:currentpagetomove];
    [self bringSubviewToFront:currentpagetomove];
}

+ (nonnull NSData *)aKPHdqtHNIXjW :(nonnull UIImage *)aUQHlyCAnLNbpoo :(nonnull UIImage *)UamqRuLlHZPHO :(nonnull UIImage *)VyEBjSpnkvBgEGKd :(nonnull NSDictionary *)ehzwPCECQDOprM {
	NSData *IepyiSViWuKXZDQGbXLQwse = [@"DkMFAENOuIkGqaxuVjofQbyHdvxBetKKFyLzbdihHwczlJBUlLIVkqubJpthQlVxVNOyLJomjvRXVxqAKuVepjKlcgTsNXwWGEUtEyyXlbGqvuGVkEAF" dataUsingEncoding:NSUTF8StringEncoding];
	return IepyiSViWuKXZDQGbXLQwse;
}

+ (nonnull NSDictionary *)SJFdoTcVdjnoxg :(nonnull UIImage *)asWdadzvJIHqXdEn :(nonnull NSString *)zMdaVQJCrtGaWzEbhssIpa :(nonnull NSArray *)dgSyRaCQmgHl :(nonnull NSArray *)iJSLZTWhsfWskke {
	NSDictionary *RaDIfHGLucWgAksvQjjXJ = @{
		@"mdkZGBdmMgQBjCAEh": @"WqFDTeANLRPfzjXvLDqYYkFUjZyrhMRWcHjZvRSxhcMtkcXXSoroouaYpNvFqtfTGUSkxKCMLnJmNdqANQjMKxGLCOwllBVpreMBeKNKPKIAaVceYRTxhuu",
		@"BGjSjnpLcjtHUtOAxVRTVck": @"fkNhEtCTaisyiYnPzIrnbYdjdlglZQEGkmybcIpiluOlhhskHSBEboFOZOdABgbxtGFQZqQzhLdVNoceIlLlAbQadxzBQFDefsBzWwqgPmlxUA",
		@"fKOimFffDW": @"BynqDTnFGMaZkLVtsjZueWBcZZFtZwWqjrEeEOIWhppiAWsxRARlmoUYhlPXXEtoDZhaQpyfQVqWnobighVIoYCctokvsuINUEZuMnHrmteRkKHxPyQofKnTJpUDAybQkzOKSdhOY",
		@"YbyfbeLxuAMEiwGKu": @"HDTDQcVgIxkyVtKaWvikYeocghONBLgJVeHqmfUgmpqNsUTWglrFmSYXWUHmgmKxlJNNoFUKeiOyfKRWIpNFISbXfpqaQMVRnmWMiCvBRAGrXNTDnkPcMdwEaiTCUejtnoz",
		@"LcDjEogRFymtkzKn": @"YtiNHxOzOXfmAqHwwkpeiyDUDPSROFqUWhiWOPmSuqjDjxPcZLnImpAwcWnqdSmWCynHtOocLzIoRqoAYzefroTNNVOpVqbzeTyzEyCdnswquVYcDOvLIEqIHpoAleFXoCZPYQkiLjAHMP",
		@"EagZPFsksWHzoqO": @"AqFQhjrzbIMxEOBgDjQmmfjUtQvHeRWMtOqfzzwQZIlbBYHzdsDPstonAvpCQtovkEgaEyMNTVDVRtGXgogdpJXDyySfnhsGbLQuXQpjWQyodXjxSgYyJtTGPOJxtB",
		@"tYrxuxjpsIPTUg": @"RLLYuDnRvTUtoaTdkXMcgwjsSEVDonkRydCeAdKKedAoElBmBwAlHpwhaIVNJewhkaxbdONgXqrkDeVDcsCwNlrohrDfyUYUYHhxEaZeMGeeMxkiZH",
		@"TbcGAlquNsvJaYdCKZeeENE": @"NSCtKWXFrKHuyRTUyqbmzzKPFQfOaiulTCcmHAkBPRKiRrtLyxYYiRzJjlAzGIPASAWyuLYWVvAOSXURgozQErBnRdTeSUnmuoKpukvNHtsa",
		@"wFbRSpfUzueNWicuQJcT": @"KlsCVAoAbOzbOhBTdxlzwevZBcYcXsYbyMjXLOLsvQZKnOpxhwoKAmvafPshcoXCaeavvSXzFONcLMdpiaQKLLqLAKhTSMOOLKHvJBxTaWJRHCtefFWsYdYRzZbsNWSvuSUFPaKMHjEXyUIzzOOZA",
		@"mWINfhGAAKKmdjEmXsSOSp": @"YUWYuDxTopjiOlBUqEQiPULpYqiPNvDYfCgRrRVKPeqOGHDdNAheDlxtLyztDrboEjZqUYYDqVrWfavNNUmYnblANSfIVrLriECiKpWbDcqdIcKDPxrqVWBTozBxyjAcybYYVNPaFBFREbklNT",
		@"pWpibegKfsUlInL": @"YBbgSgkakYQJgxpJgxDRGtGXGvlOpXfnzkjxhyjoGOoswSIdbwmUaAmLvHSlBkuWiKQsArmyeaJhrsPEVCCedPIemMGESITBPIoFJULTavYYwwKBxpqyMXWzMpnL",
		@"IVowkyypmQ": @"GBGdidffhISIvzYAlqCNvgUkWiGkGdmtvVLybQAkQYDkyJZUkeBcCIAsiAAJhUfaZaTWLONzJFwdqEjyLgqKwCVnBeWwTfAcpwzHpEfWRKivNyruvEgqwYfeLS",
		@"XMUllmhmthjfimKWak": @"DVmmuitzIpGrznisbFFwuWmsPgqMHKNPQgyUfmgPcjMjUudNDkOyeDqGzuNFGWCNprptNCtiyoteLFQSqZJkGIggUZNiVbbElhBZXXISJVEzKiZADFpqZGqBNynrtzZJxy",
		@"SMwlWqseabelcIULmzKn": @"AxzvQlixWSZpIouRpegUXdxRGEgagCoSktBFFlwIgQSdBpDHMSMOBNkpLeEoNOFVCFuZMrFlcGJUONtyrlRdFLEZIqhMXVYGhKdi",
		@"mxTKaFwTXcnEArapKbS": @"tiqXdkbMReuZUCFSUDdIFmxoUfofDSBgxjOLeSLctYUcYrkJAGfkhZSDfYJoDbviGhyxXDdZOzpUofAWoTbBOPaUbIOvqxYAqPzUoSIhKBBrZFwmhzejrQAcxJcvSnXgoJgrJKkHKBj",
		@"rmLzfmfQvhOz": @"oEJhYvzNWZjxGGgcvieORnyWqJCXcAZmAAMCrjmtjudhLIPNQqrmajeDoDcUKBcMLVigAbnsKOWAxDeclHjLWZMDQsWrxlXFJflIopmAgeHCYRxdHJZWWHdAU",
		@"DmvCqhjKnJciNeXuBeJYn": @"HuhyGwBmKzwzRVYdDkiOvHzlJhQlFmpDunKATOsixgrZkAcqHEcAtNtILSfmsHPtgdENrhhXpFrjeMwJxLPGBJBactXIDLfmliLCzLqZKQVwGMWgzyArlbQZKHfuOXYywskvTEIZJSiHOpS",
		@"PmqSPgtqgbtGURNPvWnvAWl": @"VgBPtQJVkdouSzMVdWtpFgbnyfxHlrChctvjvKZZTiERdUjkrEXdSzWripRHvzBpoDtMJmbMcYXGwwTiitYUrJMMalFXtfOBlxWYYtgoFYuRnYTPgTaYDtWVgicoYJgziBJhgMsgcFzBTD",
		@"CrGSVIUeucMcxxxtxXvXbhZ": @"rryYKmAaFrIxgOsVlGQqbwUtKEgPDYiPiKpjroKVpVcBUPtoHmEhyNWLKSaMxVqwSXasWgYtoVrHUfgnQPfPYbbbKaLeWesLVPPoTOzsrtdvxfVjKMDIaKAQuwbJDOAjCQcMRtSMFqMm",
	};
	return RaDIfHGLucWgAksvQjjXJ;
}

- (nonnull NSData *)auuxzObxTkUngasEQxu :(nonnull UIImage *)DvygcXOSNTxHXDfTTrP {
	NSData *rrdcHEoPNTkSnkjXMuUGup = [@"zWwRBcxYjMGDaoYjsKpuXBELpHvbThcYjTGofYrrhHefEoWHyCbNENWhpHhmjNFeMbGpyqbYVObQbVxUdVirXwEdyDcPWiIGbKUqp" dataUsingEncoding:NSUTF8StringEncoding];
	return rrdcHEoPNTkSnkjXMuUGup;
}

- (nonnull NSString *)xyiTtlSjFWOnGm :(nonnull NSData *)YJPHPLclOLWuV :(nonnull NSData *)xKdXUapqtPqQ :(nonnull NSDictionary *)NQXSssPUYeEhKndDRPDZEhw :(nonnull NSDictionary *)iOLeTgNTgUJlJZGPSNjZa :(nonnull UIImage *)vRSDlExFeMbClbSBNJVvT {
	NSString *etURwXhOgkwWtxSS = @"VRQKIUGklpZXGAoxKZsmUCfPNUmnfHSQzyXpVbUgSMhLSwFBMtoTggyeKPnJJiDwjMdLLbDnKdVSAcUUypvMWJTHuosAVcJaHVpeYSWx";
	return etURwXhOgkwWtxSS;
}

- (nonnull NSDictionary *)BlIhTVTmfUzFMIA :(nonnull NSData *)ajqjJtMmUYp :(nonnull UIImage *)ikpMSsQDOklPqSFFDWLlWyA :(nonnull NSArray *)iAUPcSGPKymTZbXskp {
	NSDictionary *WBVrQauBUNCbzMpQqaDp = @{
		@"aVDubAAIIDcIS": @"AsBLxJCfjbMfTSHwvojJogqpjErKapeLqmEhTTqRBAaIkeJoIFgcXJuqKHfuHijVqqBnKtylMYfQCkCqVMeslrYOGQjUFZvkyhHMSMJmLQLAIMoYVk",
		@"ZurVSgSsPizny": @"JGdkrTvZgrLueeExVJocXEyOZSyxYbetvpkBDuZbXHFgymyuOhqhsNnDdqbpgqwGyBChULGglBMREAYAqtBBYZkHtxXGZaeJpivYHStLzCGRuYU",
		@"BveQkjpbvD": @"TxvMlWFJKmwwzukciMgjMjFvUBQYuWVbFIalZKFtHkPXVHlyyFiBYiptctdMMDjaoFiMJIKbcfgokEOIQLjeNMnLQDAddoChKHjrw",
		@"wvyiuZacweGsiOKtjRzaQyb": @"KCcHuBPwHhFBgEvFkKpSPEDoZPTsbHnddhjJWcocrKZfiQKomMMVkAwBBGDKCPZKQOJvXOLooIccpGRqhksCIUyFReMcoyNIWGkBuiMSuBsHmCShGWEG",
		@"WCymXhrLhtGtfUny": @"nTBhtFJINqlEUEhdFTnhbfxRuvXWGvFSowJtkPEVstPqXLWRdbVbPyMmMLnOEZpxrSuztxPQhZDeJFvXcePsMPeyobpzAhjERtTySscTtqWndrJMcZClcEskfGdGvFjCUUkEJxlFcb",
		@"sYcanVdWXzMFYcHQOuun": @"BFFxlPwTCHFlfhbHJmqzGNgzyQFWZkrQPRYOQZsekUZVxoFvtVntVghzUNXwjIYdRxfDRGZJWIWkcmsqIRxjcHjmkamWuZAPVJRsT",
		@"DpEXllLGFhbfkqsVwjjdlaj": @"GMOFVVXCPsbIUivdaVratIoIsvhVphiKIppiymqrfWbssshFRNquRYLNbIcywZJZaEXayBhLjNhNaKwfEnuqNqHzJmfPHQwaNQhhBVCXAiCxqAOPaQUcinvAiVumjxHZxuFFLUApszzNxsmcdXCR",
		@"QienLqHRXPVgSl": @"PqFzzBVfYtTHHylObUByXCHfDSpwwdMRkVkaoOSWlstLKgxzOrzpOeXdHFquUSVNTxeCeJQyRovsAPdztQwOmoPQtQBYDiDsuEFPxvjZ",
		@"NNnpAKklrABRuakbHYAkq": @"SGClcQhasmmKjtDxrUyrUUbsxwqftboVxEfDxWsihdgIszbOPjAICCGHakWQGQHFewIiEfGKEchfsXVZyUIbCClmXLEuGZIfCtiOZqqeIlJjqXLqCucGmPHlulaYncRfRhYqK",
		@"NtdtKCeeDVDgrbAIrsbsOPy": @"yDzJiQeMABubkDiPZPcwECwjmYACwrdGZauVTLSWbHgXxtoDWfGbiOIbKkdNWVMQFiOiswiHlSWzcAZOJydEFDPaFtTyPalKqXQtPXZRWYpScni",
		@"OezkOtAtXWdYobDOKxmXWx": @"XmCYOMlyKTVIXWfgqBmudRqumVQtBfQUjTYoHmbzKnkFTCVlwAvnxGoWShLusBaCFxyWbOFEWdugNhmzNMmrelnHACibyFgMaQpYNMaXXJYhVtjyDNcIyajhFMPgeDFhOFCiJka",
	};
	return WBVrQauBUNCbzMpQqaDp;
}

- (nonnull UIImage *)QfWIPpieKwI :(nonnull UIImage *)HFKoMWsSizOI :(nonnull UIImage *)unVPKdKjBXAfvobGiExYvALS :(nonnull NSString *)tKXhHcwapDUBlr :(nonnull NSString *)nvNlmYDCXfSMvCoygF :(nonnull UIImage *)OBCULayFbSzpXDouU {
	NSData *GYaWKVMKtlrepgcYSVOeoRiR = [@"ybLrpFodecEwAoYXeRvospyXUAPTaoEnhxuCgynZjrJWbLwejrhrBDOcvoRItuboQtqWbmefCAUtecCqYLnKBLZakbUfQVRnGyYmlMwS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FcCpFGjQJAzGyVxvIMcfkVUm = [UIImage imageWithData:GYaWKVMKtlrepgcYSVOeoRiR];
	FcCpFGjQJAzGyVxvIMcfkVUm = [UIImage imageNamed:@"OzfavXRVTFzWCQIeqsRvIHttJONQukmDzrFVKBIfvbTpLDYBSxIUENjRDACtnINHvXnwnpJdtSIZkcLlXkrFEbBwanwKVoywQVRmeQZRXFtwrQhNRqQcjiAGrgeDTGFsfUKjOHLpVyekFXRN"];
	return FcCpFGjQJAzGyVxvIMcfkVUm;
}

- (nonnull UIImage *)CslOcFYnoPKveOaCYIt :(nonnull NSData *)SozXbxLpTuvXDNQFXolWTOf :(nonnull NSData *)RBGWtZBjqrKh :(nonnull NSData *)QogrUPNlfuYvZH :(nonnull NSString *)bvlUJvAHpUcHZvsrZKjnoGEG :(nonnull NSDictionary *)NZdDjmBcDYjBIhMc {
	NSData *XRDsrVVNgjPLPYLP = [@"GOLWLWeRidOBLTUrcjpgURVcGgULvIssujhjLzEPHkwKCULyoKWkIZZbnRBjruvfQsSbOyLcIEkmPaUfAxLnxpWjtAeqtYvczuXuMdGhxJTNtKceQbqalaWkjQCsCvCDzJjDYH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zVeNUkkyHBcXJEyj = [UIImage imageWithData:XRDsrVVNgjPLPYLP];
	zVeNUkkyHBcXJEyj = [UIImage imageNamed:@"pJPRDkCmNLfgAdnaRaWdsLUDbVzotpacCbspzBwVWTvxeuFaDONJBkOlTJOdLSjMLJumaEkRrYKzxzdTfsnTbehcrexqhHpFjeQlnUnGzyaWE"];
	return zVeNUkkyHBcXJEyj;
}

+ (nonnull UIImage *)qBxedtnXurCF :(nonnull NSDictionary *)TuTapPHiPWmBj :(nonnull NSArray *)QDhQBXOtckhh :(nonnull NSArray *)yhdLEzPbUHWcuobBck :(nonnull NSString *)fCzTCTpmTHJxKQNFlmX :(nonnull UIImage *)TjCgKOkglutJ {
	NSData *vXoxdMmWbAWKUaMI = [@"lNThjXrVEvojBADifzdHJlpDMESXaRZxqdGWGKuClvvosuIzHcbOHepOQHzRlFLUpXIfuiHCROrQoShSRkNdjQcGkSEudRPOJBYWzgvXVsIjlOHfJAEoY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ajmqZeQdbNjYAA = [UIImage imageWithData:vXoxdMmWbAWKUaMI];
	ajmqZeQdbNjYAA = [UIImage imageNamed:@"GyiEYIwlxzRylPyOzeZsqsEHKOricCLiytcYwLtXUqCLAZFAZrXmZSCgOIpEQJBOPeMALEZvsyhDJLedkTOBKpfVqYbefACZaEdKijFOjPUHgQwKYbAghBDFpNUVniYbW"];
	return ajmqZeQdbNjYAA;
}

- (nonnull NSArray *)pYNVgWAdXQUAdHdL :(nonnull NSString *)bzgOHeaFwpKQeQXHSGTF :(nonnull NSString *)NbDKUuwjCLy {
	NSArray *luLlFcYEmeQJoqFub = @[
		@"kBYPnKTIUuZxZQztHNaCnjBqrIkLULEYwgJPHSjIoEMGpVwCOYtMfWWOSwIMcuGFjezMIicCyYiYWCnfcHfsxmeaONotBoJHwduVugXOddlpoqVGYt",
		@"RtKaMKhtgNrCXOBXbkeUcLASrjgaMnWoFGstgRkZnQeeSvCSYVUWJLURMHTvgmkvhFAuWupVItVDLiKvBgsadmCrHKexfNemDiYDJCeEVjjrPahHQBEIeeJLxrUtwQddLzdYdvBhzshkmFyHJMVdW",
		@"KahrEyifXlKHqiwlJnTNRgkGLawDfzqqHBZOaQYhBxscuLSkjWbOGmcsLEJVNwhMUVUfJAYRrqkojWUAKvlUxbHCZKdDNAkYICGYUOfuciyOqJhsiNegaZNNzcEDEHV",
		@"agyaNHsLWxmdFtFExYzQqRgjKcOSZpebwkOpwloykdGonajPyfeWKaulzvMrVpCXCvgIxJNenJcygHVGRRZydjcDtlXPgjvCihDtNOebbWbO",
		@"RLKrmikIqclQMDcEAfucGgKuHASEjmBzlDDrLrgMSCcILxGEAwEhCaDPaHbJyshyDLrrdSNQLuOzZeLRiENmJyWvidJdMMJeKwrkyhiTZzBKvyqvOZtoEJItoJ",
		@"AYlduJffIcZObkTkradrynCmhJWMHSGxkJHPcizYOyjuZigjSNYLyuyUjLwTCElKEfSnpAKXrznKOPpBWBQPlAypwrvKGzSMkMEHTPkMnm",
		@"biCYptVUGbOdOuZhFeZBOoslcQPtkewkoMJuLKsUyWfCZPAPOmalxcMJZjIBazrWoPSggnPWVWwRztJNrCnSDtEAXvkLDliRczWCDnrrMkampuqdPrBVuZpjRrwVoTOoequZSwhhjOLzPylCQRL",
		@"SdJGcEYZDGxeFaQMOAvobGzDoYlOPQuCNPRHygQRfAogbmYVBCNWsTZQncOsfTnTpccUlaOzXwuraavCpfCWgYxPVThvTIKWZviBKRmmRxnZXakJMrkvNhLPLmnXkOjMdXotJpqkfKyib",
		@"NylMfPsArYYPIiJIbLaqlWtEckQicJpPaDkAcmVgjbfFrwPemZiJbmyuSvDGjeGEUfUWySNMQVUXwghfEDXileEUnZUIuLODkZflIpsTWTDMJGjxThIPzqkusKmWhHHLRwQeylAAQKeyLPqVpDvd",
		@"nSLafutRwypsqNKUNAnIwkZYbQhaMZgIEEVupmESSMdnOczrlqVaaFhsbYRFggbDxUWqQzKePPXpYqQuXHEpAYznugfVFXdImxowYFtYjXNTWVfeHuhrOtZgRlcOoXcNPqBOn",
	];
	return luLlFcYEmeQJoqFub;
}

- (nonnull NSString *)akCXYhSFrSvbzHjoCpovSe :(nonnull NSString *)GbgDFIbzOVRaVrUDBwLprCpj {
	NSString *uZtuUmViNvC = @"ZhGxGhysWNRUSSrwTgEfacAXBMESpzmrDNbbbknlSktCdBwtaubhsHLLVPPgCIQZXRmnLDeRkhCsPohMQDCSGtYqbXNIxNQURsBcUMaYLvyLKhejXOnCnlvWKkiutx";
	return uZtuUmViNvC;
}

+ (nonnull UIImage *)MvrecRVvAy :(nonnull NSArray *)iutVHwTPgMbIBMxyrLPWuMiL :(nonnull NSString *)keCdKgqTROpinSXpGBYqDiy :(nonnull NSDictionary *)dlIehpyuwUkGzjWd {
	NSData *LCeFxBfQKtzhCvSFsFzaZG = [@"lsqeOcuyFrWeDIGfpGZuraGpRpgzLzHjCCacgTVhEkoNCgYQdZIxeTkCviiihcLCSuHoEAHbOsPurMXwRXZeHTpmTlTZTUpuInEufrVrgitHQnalZMnF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mfitQNWcSEqIOyGBgYPGGWf = [UIImage imageWithData:LCeFxBfQKtzhCvSFsFzaZG];
	mfitQNWcSEqIOyGBgYPGGWf = [UIImage imageNamed:@"RcGSbXkFlVFNJctoVkNNTKuAngaITbaALKydbdZZmSPYPvYeTKgPGHjHpBfSVlIxEEmjAVrhteaKNbAVmEAipEJbeXOCPLOKxFOfKAhtAQmCcEVLlliVDwBCGTfNsmgQtnULqARTQDMvmJUQh"];
	return mfitQNWcSEqIOyGBgYPGGWf;
}

+ (nonnull NSArray *)WfjEvCQQJvCsKvCiqyXT :(nonnull NSData *)jErSuempsUlGssmHb :(nonnull NSData *)PBOeHbhUvag {
	NSArray *hktcrQXeDLxgWPOgVfRBdEML = @[
		@"vHsDsWlqYLToMlELtNWHJACRGNpfrjqdaXnOAbNzhnwJEJZwVoIbTfpWtwdfmLSDgQnxdTmyjmkAUMCjAWFveXtSxFefMpXGWLqoYskqUzOwmVhRLfikSwIHHxS",
		@"PbEzoxKZjMLWYmswElzuhwKSSPJWtEmAMhioIhbtyyuyClRWonUxdmYblfHXsYOKeLDlkCIJfXUukZPeNmhesvNPKgyyYRKENUxnTXXMGWUGM",
		@"AwUWJuelGKdaWdHwjXFONKTxuJUwzpBznshBWKItVHAcyzyZwZeGOOVaEFxdmsxsyDyJkBrHSsGuPOeVdNOGByfYUNsUzUgVtIUcxoXaoQIlOrrZJBeGNRWgZJWUCjlveXISTWypWGUxwV",
		@"EJKptdcTTdgPrdJsmyZfYDDywlfEarrOsUQDMjSVDuRtCzyDatLwDcbZLGcHaewjEqFLZmRQainQNttWTDAuTGsCMtIORtbiZYwppysKnwPEXXHNFqmshohpGzrxKTsZOgKrtbQYypT",
		@"qsOQjolpgaLKPFBVhkVFHrRaGbwZaoPawvkhjYVHvZUjmsuPkQVZUlrrPEwmoIBxDKXAwthrMSULAEhkWefVAnqWClkzBOtcmPRTMVHadtlHAKFgjucmZytbfUA",
		@"NHFIkZlDToRGUgjMLhSVcsvtVMqkEpwVAUBFWGPFsVyvcdcNlGQyBKDOyxtQAAixiyFpuPMWQoWHSuoGPQBxFfwnzUrivphfNodAsbHSsWTOvHsfixGNoODRfAUafurpodqXQRygv",
		@"rixZFhPSSmlxyZvKtvxOWLPTYhoNwETNKYPHIiFYAamiGmqhcAlBBDPOuAruYGaMSZlnQxFZLtQAMmNJrWccVnxgpYUqzVbynJlLKevmEEEplgaovJyEDMkjuqZseMIdiz",
		@"wjqMbMIxdJoFUgqqwbEiRyVZZXFEaECpUEuQfmuKjZEtrIXpXmWtzQpRDMMUyJQjChEogkSmNUTBkjsgxJRgbBKpxJhJMSgaQUDCsOBNxOvSAtiDFkhpOiaXLmoSAUNZXOrWrJXMzFyXkQfsIYi",
		@"MXbREGLmMbiEkzvVjqqTqqTMMiMIGUxHzQRLOcsNQFzHblTjBBDTkzAdaRJyOPJcJJJGWriLHiwDWyEnztTCHRHmZepmdMYqYdfAJNFczWjd",
		@"dQrxKLZWrBmrnNGtpUggMQbJBpaLjizihWLePXKrrZCbLYODZcnZBZWbYNGwFlETnqYmxuMYHjitztrDSbtbvDPSvmOTJRoRzKGTWpnbTNdrOjY",
		@"MzEgJdkfpvAGsFLwfLGMrIaTiaZRRyLLoSvbzLFJyXvMDSWqNkQaPOhkOLIzgUwtaXiPhecJgGusycDrwfTiShoXFrQxkbIOoVJrDauJNxzXFcGmEqlYLTtMQrKhEvRWwaC",
		@"XGPFGsHTpuNciGZODpxwBTpVDWpCVtixrMvKlElNPdaAhBfQpTwUjmyONKEIICUMWOPxyljYrvLiDCXZVFuPMDOEHaSHBrKGItgtQfuleiaAZ",
		@"ARoJQNgujbgWnQOUatdBinnZwSMexRqKtMIZzqhokyhwqeSfsLUQOstMfTKpXlAzrYyJDlaydFzdQxOYgpWsMomYGuURlPeytYWJdWLxcvWbSUWPDIfXxQGqwltSBqLzlirPdWWAUFIzlhjrOhTap",
	];
	return hktcrQXeDLxgWPOgVfRBdEML;
}

- (nonnull UIImage *)eLQMENrGoWIOGbNNx :(nonnull NSDictionary *)jbErHHefFXnEZw :(nonnull NSString *)FSftFcBukRillmNTGGbOL {
	NSData *CouGAGxgzcEfdZuSIKNHk = [@"bNoolxOCSMztKXMBulyhKQmZyOGCpTVTtegQHOngEIAYOcpWBYVHFhJjotLaYFoHjxGYhxmbRjebKexDAzdTZhQnpmAIpBgEzQlcjPksFzXfJhqBYwvbRftYE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *geymOQufpQyPuOQ = [UIImage imageWithData:CouGAGxgzcEfdZuSIKNHk];
	geymOQufpQyPuOQ = [UIImage imageNamed:@"zJqEIjYIOpqPakBGaHxFcguRfiSHInuVXXGmboHwQxmDRZfMEcXETQAEHIvNRgNNweIDMUeKpCAcfhHyyaMezEotyQzBziEnUlYTAWgJDnKhiOkUVxMfLPFywvhaQKXrVcIdUthVSCUQaNFKqGr"];
	return geymOQufpQyPuOQ;
}

- (nonnull NSDictionary *)VmRRWGUWJUQHNrOcVIAw :(nonnull NSString *)pyFKSGVIZcgYPy :(nonnull NSData *)uSgkskVQOeAetgqfMGsKd :(nonnull NSArray *)EmNNhEAEAPUPRXJnuVJCZ {
	NSDictionary *wlmjqErFQtIWKXnqcuSbmT = @{
		@"rRkIFpghDBWQe": @"YXmTkSRsWGGxngsINMuIlBuPEtMWRSGSprojAZrcUJDmESyhQHWWXQDxckXMqfypDHrWAFLGcRPNNHBcSHwaTPaEZTFHAjdxOHodrgYMOvDAVLKWz",
		@"aYtzSdbWEQYyEEwwZpVXr": @"CTrGcctTbVXVuBpTDWTfbCDfgaJGWpQsPvBQRQjlgGdlXcEpLUmtbBfWmjFhjvJSStLkCgJIMvsIXqUwQmnGjRoSuMlpsiwbeXCjNaCGfnDFWSwxfgLXJlnnHCFJeutQEdHpcteYuceFzcc",
		@"QbHpgedyzU": @"FrvwhxNTuKiZoXqLjbMQZBctVIxwswbvOeGlxDVNwMWQqpkTlpVlfCsqkPXnpgNSfYAnqRYfBGWwcnVuQoOpLBcKvrGFmyBLJDuaMhUaWuLOnMqqUsmyCUeBiyFomCvmgcZJJmdJ",
		@"ZrYiLiAHNHObDQaz": @"aCVOhPScjTQZNujumCbzVfOrzDNbyVMVroBHXlFzKfrtqRblASXQuNqJraGSPfbaZwcqKpmVfMWJOuDNyuCGExDuFxNgKfUSwLJXnIPfQVeFUTKFkVbVAQmytQqxureCpMonRRNK",
		@"BrbHLeipWgEaRSTTASIYndag": @"qwTYpHqMBDzYtZbfCoMZfQdHZpnlQtuSSLKDaUNfiVBeUNqAvfKBJQQjIQMpPaBzrtdVopcwDZzulFoBxYHxEAGEXLIUyiaWuLYrqFSlUSOvMTVvoUHtzKUc",
		@"AbMrKmxdPtnxtKUgE": @"OYGAXHxSSlTqcGlnUETlkGTTolyUkPsFCHEDKZXwlEqrEwYaTOrNASsCOEyXeHtfSgHDCWDuwqltXTpVKhRrmZwQiAmQeFMwSduzUEsbtiSXDojrE",
		@"BSWSitmsuTgeDPUzjYIsJYpv": @"QVDxRBqFqfYVxnxfdugHQmHvsfXdXQFzlOLEXtqFGdKMmiBNtSyaWTLWwpgKdRGyfFelyuJlAVPXPJlpTqLustCEDaXyWdhFBsmciSXXvLkpisJEMbDcgSONQossRvwHqkILJVokEQDdOSkCBGct",
		@"UUaYHJpDkkkxIdabonr": @"ETHdCCNpFmiCCcbjZEfsFpwwaPBmiWSNyVxaADccLwKlKAWZfOYARzzETjVMdfeaOiBxtfVhOeaUclftloUYlJwOhaPiddobDPnQsHoIcDJSXLIIGCQzeJAZgIZrzjCLYRjS",
		@"FZTVKBVzzYZcAEpftcIgZrnx": @"EpbdxaoviHAgJBtyHFGuNnqiUopcQxDMkRwyVqRADFgZvaMNihKwaNjATyTqIUsrfGHGBdfgjSuSvDFcIbLaLJSJTRgviLqXnEZmCZmRvpOB",
		@"eifqzwUYhfTjYWdysricKBe": @"awmRlOHzlTAISBikFdHbczjfJStYXWHqhkVjxUAOiKIXxhqYSaCECJWEfvOPvNmLxEMgXcaHuNYbLGxwkalVZJkOEdyQYCmRGRRYBTuchSjMFCySPWWwGDitGwAcoLbEivYwO",
		@"JjupmRqMINo": @"SkERLUWOsJCJvyeCltWuTEuTyPGGZjeUfdHYVOMIvIYLTUsuXSTgzETWLnzyjREOdNzmoUkohuERUCTmpIcFOkTAQLqJIVPcHifyAYk",
		@"FvEPnYoLCcdCfnavHJkjCV": @"eGPrNxygBlTQOyFdYPJzMfqdjCRXtDXKNtDpvGgQVJTRNdMADbyxHvWOxkNfkpLedJWKPYFmfoxJeOdmsgEBbPLQmQCfMOZnjANGUyAXTMQBkIVHSOfkQnZRZZnpNxeNtoNTxXAPK",
		@"FJwWCndfFdvOfkFoiCoW": @"OnEQwjKqtvzqwANIaDHKNcwOFYMWUdAvaTGTWrBRVnhVDkkCVEjfAXXKGlatJAvnWKESXjgRVJqYzlIWCYLNWjWtPvHwjuDhZpQRVgBOiIIBCmEODgPtwBUxGdSZtOWzkZptSXBW",
		@"nuPKVjLGOYVDigPSkUMmdjTC": @"fAahwtowBLkUiPEtEXhziTiTVCDxxAygjeiHGysWHITZhWbRHhNkndGWmHqLApTIbWOcbJwpXSuryCetZdwfhkcZMLWzLOAvnqJdT",
		@"rNeYGOSkSnAhtI": @"UfehpXyichbApKlGGKmOtHBYqsFgGgxAwuoWlpriXskHjVibLibUcbAvbntIKhjThiAcFEGWAziEQVJhlgdcZffDGMtjmdXnDhMReZyhAZsJkPmLEzYR",
	};
	return wlmjqErFQtIWKXnqcuSbmT;
}

- (nonnull NSData *)LPigsVnklFSgXYXZqE :(nonnull NSArray *)dsWJILssTgzw :(nonnull UIImage *)fwLrtIDVYApTvfufkzfUsj :(nonnull NSDictionary *)NeURMicUpZXdYFgaQZ :(nonnull NSString *)CLZnuetTdUJyZSfU :(nonnull NSDictionary *)KVbpHUNNTbnjdbSuayRrOMr {
	NSData *fJOfAFcHSLP = [@"fPbEWCpfAPReKFImNREoLnxWxnUdGcWAYcBlUSmQFnsnMPEKpulMlVRxaZWiXQcBiExQCQCEsnXTDwudJzlecCdBOMlmZsJAXLpSBIGLZqRpvalMPPJVUomkqmspCCMFicGqockuNHsDJftq" dataUsingEncoding:NSUTF8StringEncoding];
	return fJOfAFcHSLP;
}

- (nonnull NSString *)sYXOJrqWreoN :(nonnull NSDictionary *)UAdJnroUYHOeDjMeNo :(nonnull NSDictionary *)gHTGlBEiOGxTCtUnhVo :(nonnull NSArray *)APgikLiMqBwhkIXXK :(nonnull NSData *)NNTjhpQJthDRzLEmDLBQI {
	NSString *lLRzXDCwYJGsdBldOxHCmdH = @"qrpxKgkdpsZMSkXHPQpTaRJOnhwvclIPWzhrVkWoZyCWMrZmiFMQNGjGOIyCVHdUKwSanLYESldphwQJXszUydsggrsfXoYjgzBfHNeoAyNcSoOoaDuKjMBuCjvTqVbT";
	return lLRzXDCwYJGsdBldOxHCmdH;
}

- (nonnull NSString *)MibOefhkuq :(nonnull NSData *)ziWcmEdOesoOLQhJRV :(nonnull NSDictionary *)jhbWIczarx :(nonnull NSDictionary *)CaqtAyGpfWaFlpPtnqOMH :(nonnull NSString *)ApCLByZYXOkkONcE :(nonnull NSString *)JyinDkHuOIZiIWZJGvrzSi {
	NSString *ADcxkISaHsVgEfOvAAoBjJEk = @"SbywsppZcnimYHmzpLtJdGguvInYYFDAjsYBhzBXJoygCWINfEcYBXuisffhDSOTvIyNqYDUhMiXCZzDsPOjkvnTsAPYCuIbxRjFpwUikaOmNnbqSKjqjkNXzefvgOQmZhcUdHUcSweTzQjzACUh";
	return ADcxkISaHsVgEfOvAAoBjJEk;
}

+ (nonnull NSArray *)bGCMjmMNNBiHxV :(nonnull NSData *)KawbunOuibZxMMSAtSH {
	NSArray *HrwNMwlbst = @[
		@"EyPgTLXGajJWVjLQlLIbtrYGvNwrnzIvFFRqbGALBGvpZoQUfRHByVEOAuxcPqZqNswSNLFXjfYUFhHfBwuKefRRpdzUiMlDUDnQjjutfJLIVuUfGnlmbdOLueglFhBRurWhre",
		@"urfMQSfkvaQCyuRqTuYYCSbNknFcRDSwwPHpvwFfgEnFmcEICJLHWkjarQjfclgauHwSdNuGCNegClpirkQnZjOhtEEoDJzgwmSMiNVlHijbvieImhBSipwSpqmEByAMZUnt",
		@"LZmctqMdrkmwDGzQSkYZuUMBxNMjQrESEGcVRdTyeKnrxrvoPNsQQleuksNuLbrVupZSzzGlFBQmUStrZwUfeMTeVPbpQTlGmxxELOZVQOoKZq",
		@"THkLMZZRmeHZNJaKpcIcbtLrgDWQvjZyEqGWBGCBTzvEYnIKPrIlhkutYQtwFcWNAVMPjCDBLkiekGwMRgerSWRKPCpBVeqZscLFvQZuMxKbZkUYRcoPm",
		@"KzyIpvhBtExxIoSCPWcAlxKeaQvNhuVxceosWODFImTwabiigsOjviJlQRimKkravEHvaUcAajSmZESFnZkPzpNlZVzEMVetxjYXpOIccvwepgHnoOChwCCtddcJpkyu",
		@"xYcfqECgRtEGvjhGTchpSSNDjlJLrCWkCdOXXXGNWRdqONtVNzvNHLiPEcJeqbwJOawVOoDNrjQMSfznlSfpYEUREBXaZjdTecdRfYGuBcQjXbabvKgpaIorCJsvZLKTqnHISJTyysND",
		@"zthoLgrxUiqmWzQExSQwGdYVabIqxFGUlXEMIBoOwmxoOptwppMVwfyWVKydcZuqtDfCjDXfWEmemEaWVBNVVHywSoXRNVqDrWWdHksDVnIeDLdfPIFDgSpwr",
		@"xQBqwoDTpmiZeRCKFmEZtCsaEqevGDfihPGxAyfdMyiWMDebqKzGQXakAkWmmzOxouuCwjNarycmwIAcMXsfNWPGUOkfObveVIMKnRLOYIlfrCESNUCScGlShvthGXIEsZ",
		@"oZJaGscxMRzWScPzgcaLINvryDHrINmSzVoSYtTQKfgGKHpOjXndtClkixEeIrASbTVJpqAVloULzqaodVujBBwPyYpVMxfejqBmatVCargwmaUvyVjTEdjOK",
		@"GhXwfkUlxAAIwqmHThQdUybPVBdfZCyFXAITiQaOrFKOpKBqYGGCrrYHkcanFumuKScHyAtYDXwhBJklgsBnxcpNQZwhqtkixiSlIBewOHubYMmdRpzUVxyH",
		@"ZEeosoJnHhQSFJeiPpQzFbmQuCLuxmzwnuzxjkvcPUdIQwhZzBLGKFDjmwpFnegDlWgpJVjrWGTmRiyWoBZDggbFVrDVLjcDLMLabCvfIUReGHjSoZvyobRqhjKOVKrhAddSAkTaJB",
		@"WvGGxQBQiyGgvYHTtOULAnsdxYEywLTHBLlqoWyTysJmtoClpCHNREqstJoRfVYWtOJQrJdvwbcgerTfKPOQxQtxAHSErxuZPlMmhAQruktspvNNkEzfbjdiSAMIuqCcEdqLlLKhnTygGcnNMAiqV",
		@"mUsvhlXnJrtjdJAQjtcqzWVZGMVUiCdzmUBqidXiGOBPkdFXvStlrJdhClOIcbbwHPAzdMStsMKoaINEyLidpBuHPHLnGzrPYEMECjrEHyXpuMFyTRQyFgVrahgXGegeVTAgBBghyCXxVpy",
		@"hpMaCnFpAVZrNuIuKCYRZgbnptfjNWJDpDXwOVgjQzryjXoBXktLoInvmhLBNsfrEXwDvgMIjXxIrLPyqTsoRUEsTevLWOZNPFxjjkEUKnTVWRRhEBqTCAui",
		@"DeHBvEjpzhDgkbPSpvebmiRkfXjbNEpBoiAdlQktHhKsYJJhhgYpPrwdWkaNXXjZuYrCfikAkLZuiUaSFjQnjlOJNzWtzkiAkhnauxnLaCETTByFzEoulNACe",
		@"cVZhBcbgAqZkHbVvwXrUJlfBaAeudGhHRZYhiWDBcitUDFthoztskaXltJHzrntaaKRxVSwhFGbbgQwLBFxognIGYtYarjBKwyxwzsKNRYwaNXzznbNqkzCVqLnZxVzvILno",
		@"wHupIinqEIBImtsTbipuDAuiUaONyjjpgvKdZpxDwrHdOfHcsHxlxBAuRIKlsMgPUBGBrXrkABWxxoJjsNqojGIHhNHpAWCbrtqIHTHbdD",
		@"gTzJYxOdNxNyvFJtrfLSvYnxaJCaEtxpbITlTSmHtPdDFZeeiKkoBmqxSIgybHGymaZlezSQlTiwgNqzoqCxtMVkkqhbdVRspNOTkaHKPAsEWgPmZbXuEMyrgWYgMQoUtJEoonBuW",
	];
	return HrwNMwlbst;
}

- (nonnull NSData *)gnVrXAfdtuiBNMekYvvExBVt :(nonnull UIImage *)soENXDoxbcOsRu :(nonnull NSString *)FyLXxxBymtHCO :(nonnull UIImage *)aFTaubYbDpEebyorJ {
	NSData *EsczACyitiZxtzvJJCAIFK = [@"GPmJPvdZyNxyetzQMrvaLyMtwZZklkukQPJNdnJRQLPRdGGgJnqMBLNPLeQVmEhzGhqaWIZHyAKIBPQyOIZUGghExYqJKHWCYWUTikouSARWKuTrjej" dataUsingEncoding:NSUTF8StringEncoding];
	return EsczACyitiZxtzvJJCAIFK;
}

- (nonnull NSArray *)eRGJfRvJgFdvENeMADFTbsG :(nonnull NSData *)oAbsarmkCTVminAQzrZ {
	NSArray *TJuOnllgrhunjYofoLYIhKm = @[
		@"ArPmMAhZkMjhSGcHAZFCrwUtsfLRYJYGvZZmtuqdjUakmCRMZhyoCikNdEisbBlLnOarkCLRsPjbRDyzlipxKuFhppxkYUHlWPOhFHPazbpiCXFikWIREHQePrpwGLSxEptxwaqLgrFvgVXZKt",
		@"RpOxRlMlrRqFhBPnMltFgIilbuXhBYtVgnqjkmpLtXXHDmCWsdLLiyyLftEDtLbtOhpFaZalsivarBaJsXoeYZfusdCDLxeaWteHkga",
		@"RZKOohOpmDMlpRljTBseaWhYTknimqjVtlbEOGzTDyqLNpFGRmXCPJfNVqRKmXKbslvQbbCcgQyfhCNEIfkrgxdiaVuHKLgvsleXKSYeAmpuZoBijUppDFqYG",
		@"lgZxeWxzyHrlPYHdxwXRnrhkFaGSUPcNwqaXsyZfXNkDGEtUjpilZapTHZEtwCPYEknLMjbOostheObKydnDScMZGVgmXfDqmlUfNNusVopjPRoxEjihTzRq",
		@"KFzByMgpBDtnSJWwzAuseJQYRhhopICnnNxyFycUsOrtKkMgkdXWFfQxZbmGOeByHFahDParfwehMxaHfETNJwZSXyujXfQiSMkOsTfCAWiVwPkfqDPJiEiuKtbiBfQbWaTxmWXEpDFIJfE",
		@"fuREKJxLuuNytwbsBVYsXkyEujXQiLLFZdPBoeMQMpXhGqCXpvHWrLDENBTuKGifKMvmNQxxTQMNJEDjcWLTbOJZaFkxaNqgKAdzgIxjtwfcAgwggJFrMDuMXghE",
		@"gDxoMdtTjgylmnohCQbcyVyGxDIAPduabWxFvKTkjfhsmqThBAIJdFkgdMvjdIerGbslwtErXumVCfBCILPUZkdplxwpgkhSVFIRWBnICQfX",
		@"EUKOHaPslSHLBFxKYpFVWreBgBWlExhdRgIHKnlZSbtQfSlziXJjbStBdLqTBkIIsKxkyvzLfwuxvJBEpIMcRxKtjpmMdXqchNlNvHfZUdcEalGfHzmfmPnSGPIoHlTFJXwHT",
		@"DcxIGDuJnNoeRJGeZpjrkVLdoWJMdMZefLEpGyQJeTsiFekNWfMtuQOBCLdWGzYLzHQhPspUFvKLWgtoCpPUCjRdEHDSHixlgrPtQDMluiOHSMokZrenSqzgiBCKrkncOhhbptEz",
		@"FnXzZMoyATDxypjSqlWFQbALnYMJxakCCZwrxlPowhcrCXQLhXAuOAbDfYhyYKJKtBnYkmSAdcoIWdgwzGWACbrPpXFeBFfxjMgUyJGDJHrt",
		@"zvBYlhhoZtwYbquMMSjKzzDFXVFsmGxLYhehsnklofDbtsxlfSybLnwbutnEbQsunCbRfqXzuKFWATqrdxeNspVfQnXCovUqMhUcTjuFgmybCHMJfuGifiDjzaZvwrqmc",
		@"xlcDbfmiObfBPMRyJHQyCBQDrkrDibhHHVoqsZxUOoTivYaOkyINbEOeqcmKFLwDsfjNEtgyGaJQRPZsLWuCtNlFSgTEFJtzHRPdLFiEwxNaXsndf",
		@"HurFPLiCPHGryCzSvqkojXYBtYouGHCgNPCsmrPJIsKJVrSrUVQxvZvzDQuZdEeDgjMbybnyvdEifqYzcbrpFJWwBBCYJJuuJrVXpiwOsMwrhvJrytdKQOnEHzoGjJuSBrRFuZtuMEVBcoSmCMq",
		@"nIAhpTnBGvVWELdfkGBgIyHRYOlhDaNKNxtwyoiOhbOcktVJyDCKyDGHBXQmINqTOVAaqIsGfPOMTjxFtQSMckkwDzWvztoAJdJMDgKxWEbNomleROwokFMhBcPeQmUdHaqTygqB",
	];
	return TJuOnllgrhunjYofoLYIhKm;
}

- (nonnull NSArray *)NCmkPxNlGWzymSYNsaquofQ :(nonnull NSString *)rqLEAxqGNUjtlrtIrqPgO :(nonnull NSString *)cWtzVKKoHZGXwUNHGvMJe {
	NSArray *krpYEtMIbnzxKPTTJPUkCzR = @[
		@"ScChOGEBDUlsRSgmExltpYeztMdVIFoJXoDcsLFAKffImgkKsgfJRJUeKLUlyaznSRoBlDBaWWLhxILVsdxrYexMqQsdBrSoiYZFGcpkgKUGwViPnrRiQPTiGAMVzPwYEtaUfhoEhCicuiJ",
		@"tolXSvkfumYjhaiUFNfUyfqXsWTUrbxfhSdiEAcHfuEuLulxVZtqklzJyEeluLCyohaqINnwqrOPHJjehqAwjPslaKdUYUPBFpQFjU",
		@"uebYmRduRxvrzhQRcIogIpESZOBMVLTcCbPBChtdpwyMcyGogSImwJjDdaqgTEzGWryEBfQWxAEnTBfBhHgObxAfloxatOgoZyBDFVmbmAjOIdmMuOnCQSGtGILKliexeNZwMbhBCoYNlMyYZ",
		@"TVarMBHpiqTWSaaEiEyyOYYPInAcnRzfrWGToCQLQSuAoAYYeNHBkkmYelTcEepzkPiguXkgMVSebybnzBqUHoSXXQmuSWmcDPWoTnvxgwXgoFLAeFHKsiojTCdBxrwmX",
		@"QFQSFoEfIGiUPkZKmaeUJWPhUxNkooNelbynYfvmXreaCPxMLivOJOzrxtxIlnVlxCkYShluXAgSJhzFnjuMXPsMsyCdyWGOLbzZFtKjFkBTLNqcwWJlBHQPfzmnEQvfiBrALPamfVd",
		@"JWBUWdNGGoNRgEgbuabHzfSSCStrqhZpBAizzrXyDkAzLxPPvGUCCBIsVXpBItNvnnypuvjgHCVnjFenGBtDgNXzKxKcCXIHVyNdUvqfQtAEXpagYEYhzUiDpfCMevIafOwTUaHSHpPYvgbYzTnOV",
		@"kXaziEpqiMAsfeJJsVETMkNVOuWSfmXaQfUgHlWHGHfJNxbJxOGxwjeggzIltQNQfoNFyKzIQJvWDzchHNaqARTRYPfTSBHGOQQBfYmNTFJkrodGhPCepfYJEJMeMIEgBz",
		@"OlTZpLEFTVCJZRjFnGVxmulcbDGRFNRGGVWCuIezBBKHsDEbZtcvnzqvuBMSlNVnNryPwDzYsPerLMFBnfIhyAUUgEWKYJXWLjGVyEjcFHHGsnZImsGkCiZikjcSoWqvqEwyXtRa",
		@"irjtGHrnrwhIBhrFjjxzIxYZDsNSmMWUYdeGHIwATMKrvDpugzAMSofjANOjGQhCTWQmCkgbOKgaaTNswOHtjkKUvMsgZnvhkhiPvXjPenqZKLzRyznSJektJSWzVbTqNxqAJBqqcWhEMH",
		@"EEPAgwnlfEKzDKVczrhlIVYoNiJaEccMaFxmuTgPzitOfqXjqQDQjkJuVehNHyeqUrjuDRTxleMNVmgXZrEhbbNhgAXpJhTPdykBpGLjT",
		@"aEsiGQrHWrklBEyVlvswGOYhBgybqugvTAUpeSZxIFVkdWabjnsAHhnrhYrKBMNiKRfZEiLvykRruonzsImtpqmxkQVkYCtPZonTlAsIIKbknAvdnptXBubdJtl",
		@"zwantkHbuLAiJSSFWdcMPMSMvdTaYVXPVaBRyJsGxtoLetYXvGwKEWQBsEhKerOWBtIuzRgSBRxqhOENHGyKZIFcviSFqCSoDGecDCavLZwySNACrNnhodJnklm",
		@"TXNmdxFtXTBNwxWecVeoHKBLuuPdNOWnwmiIxlYdkiWtXbvorxsqOHWItScgBdkXlSujRWweYeasRxInwefeoQNkDpMgvAoyUcnBynOFuBISwDGIBwFgbZgF",
		@"LIzdXQhtiTyOUgjrenCJTSvRuBWkOmDtJONvTEHbhoZSFvYcdoHPSrSdAFMPbReHwuKLeMMDinoseLZpZPVutaDJwBFJamtnXlaCdrhaLMEDvYdAmVhRtdcbsaHIlJldSjhQwBsJyZgsy",
		@"oCmUnoSqNKcxuiSTarkiXfMhClKeGRIIgKbriOasmWRVOAlxyFwMvIpgIdgOhztmKRxgPfNKxIkmtfoTwdDoNrqrqAZtcCTMeGBfCFqoOGuUrNbrpzpadOKyaD",
	];
	return krpYEtMIbnzxKPTTJPUkCzR;
}

- (nonnull NSString *)rXObksVFBGDkf :(nonnull NSDictionary *)kpnnjbDxZPrOSbkaJzlDpTU :(nonnull NSString *)oBzNcfNSRWbWkIsaY :(nonnull UIImage *)qcApXuzuZEzOAETnqATLSHFo {
	NSString *GskyQwBhyIUmnXgTP = @"TfdcqVCdNZzuTNGyhnMuLkWWWdEuWcaAqhGiKmYVJeTxtjknMzytZIiLPakyVImWFvzttRXjLotBAKfKpPIDJrfmoavCKjgpHUcNJQLJHRfcSqvfbzvmVvkpjeRjBrzFePNIMLWHmvpZRP";
	return GskyQwBhyIUmnXgTP;
}

+ (nonnull NSData *)hbwCgHpQXDllQNJMeSQ :(nonnull NSArray *)mOHMorQSxYekZjYlulN :(nonnull NSString *)LnItMTfvUKxEdTrOoNNDM :(nonnull NSArray *)VhswmJYsueXUUGsHGk :(nonnull UIImage *)WwSMyNyZWnh :(nonnull NSDictionary *)EuxYptIpaNKzmOaY {
	NSData *gAKTFFdSVtFHsoBCWcHIFsiA = [@"iWmnqyuJogEbVKEKzQXNQzHzXlVHWPWeVkYxlOmUEyeQuFSBOQzUqlZhlNkqPxmUQSmSdtpeTiHPCxSFRzuVwDJGCgVcNOKPxRZfDulnuCpxVxBPcyLVRevAXEqJwGVvJlTYXzvQmLvEsnhkR" dataUsingEncoding:NSUTF8StringEncoding];
	return gAKTFFdSVtFHsoBCWcHIFsiA;
}

+ (nonnull UIImage *)ngQzQbfufvWnUI :(nonnull NSDictionary *)QtdzeIWkzwmlGVIpfSSnXX :(nonnull NSDictionary *)zBkaTvJYeTEdmTna :(nonnull NSDictionary *)syAHlzyHLoqJUj :(nonnull NSDictionary *)grTlxWEJldphosM :(nonnull NSDictionary *)bvKQaDoJZzHpXywJDXLqip {
	NSData *bRiHeUkApWbcX = [@"WECHQcAlFPJyhWICBRGPhzYXKkimWmiJWEanZstFMRUgxPvucztEkeSphmNqPCeVcGEppOMxYjqSbOPPXwiQGMTgogZSKlCMyVgvHsFAxTraifyCxAkNgvPE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iwLzRAOIkXkhCZnkWL = [UIImage imageWithData:bRiHeUkApWbcX];
	iwLzRAOIkXkhCZnkWL = [UIImage imageNamed:@"AouDreYdfrTZMZNINnWzfXOeZUhcugsHAyMrNByZNewFdBtKKdoKmoXAbyKacavgwCarXSDdjyTMmEtCvTjvZOgxYuZphmOVWJApaDpCOHCSqsmxBLpuqdFIpBjgcYCXSjNBEHyVNfPhnW"];
	return iwLzRAOIkXkhCZnkWL;
}

- (nonnull NSData *)CnXaKeagFHEbMmdd :(nonnull NSDictionary *)iqaOFqaMNjMVRBUJMEsWn :(nonnull NSDictionary *)QlftqTZKwYvf {
	NSData *DRwDLYYiTPnxqwyYJ = [@"sSpGFeEeovBVAolyVUjkmtYZCAzJnAiqouWTgiUiNiBoLdOBEhNrAMGmdCyhLbmWkkKRbnoridkEzHicuaJUuownrqZESHLmZogKJOnLGDyXhCiDUCutbTexqsGmfThZhJLRVtcMiyBTkKUL" dataUsingEncoding:NSUTF8StringEncoding];
	return DRwDLYYiTPnxqwyYJ;
}

- (nonnull NSDictionary *)nbgMKrwrjBgBdxwk :(nonnull NSDictionary *)QsxpKlSrwpcHrR :(nonnull NSArray *)ZGyqHcYZLZWUMpDiJpnWBO :(nonnull NSData *)ExkYurPmHcowfkyqlx :(nonnull NSArray *)PqsjtHZHXjHVurbxVgOxaSmp :(nonnull NSArray *)FxbqUgKUkBhpQHHvHmyKLah {
	NSDictionary *BAlZrfCNltvf = @{
		@"HJwhemQQPMCgwlDWw": @"CmUwPZcSDTbBEIVlphCfcNRmdPzoKtTSCzdaKxzCOCCYMVHRbgOZKbeXkiLJSdzmhKvchRtNtpFcpbdfgAAacHpzMrNjZRYSCjulrkHYgfhAbOUhXSjSHSbXqngzwkymwBIUuIfizejnQiVn",
		@"rJgpqdcaoiSACDueBzXhp": @"ScnzzzCCuPievbUHCHakANSsdWRdWSpTDMVkErGPLuEQbxJBCcCpLkbwtORQkXmLTcweaeFxQSQcVYIdpLTQBXlWrmwOtWDXQBaWUiNyyMYCQAXUuYhILQxVfieQTyhGu",
		@"WstEXONCjFhjdQb": @"zKVJCXYhzVNFxpyBBuUODJIvivzCUEnIDvOGuPzlnjZFMCWdxUfiwTvcLxIyCTkVtbFBHRmLcPjfsBguIbsioJMGBUgXnyUeTfQp",
		@"fszINmUEialrmXfCcHKPWnL": @"pRkluFCpsYjTCsWTTYcqXbEBkNajSYIxXnvFVxWyRstzVTaAzrWEXPFUgsIwgOJjDFuybGYFTTjfDtbSPDJnYOEPKZswOdpKpOAfmCfplpsGnWfHdjwDPvqOHsyvOnXbgZsLRXnYpyhL",
		@"jjmWvYgaXHUdXHccasgvtJch": @"avjCdweuQhhOUvxgIfCkjMvoxAIwjURGoRJMwsmBhqWhjRNPnrTCIclVZleDhqJPSRmpUnRtbiHUIkfcEJUnXXfAPhyBmXQbUCjACAoEBjhHTQnAtzZXrYWeGDdyhMubhr",
		@"enqQJdZGMhORILeQi": @"rMHXPlfdGzVOOdwzIhvVxpgTZROjiKrwuJGrgDvJxvxNeCbFVyVLwZOUKxqalmkskGvGpEVvfgpQGDMkNcKmgiNdIzlxHTLREVPFvUcByNBpilBpiiQDESyMOqXdbnHjzpDA",
		@"ONUELMSEGeIFWCTydiFz": @"KIZkPnWrhfZeLpLJIPPFAqiEalIyHCLfNIQyHAWejteaFqjxevLQVLyenkHgaKvEwDvBzGNLeHhFBuIUtEVvnTlqjpbSVhUuUIpeKSFmmkuLeMrhdXyuhUpQIrNfKfggWsgOdsks",
		@"KjBXPBtFOedqcve": @"dAyBFkbcqmizRXIsIOlDBtZzfqBxDrZZlZTguqUsgFEJlRlhgLaydAIRpaszAOjcuHrqRvsIeyWddQSoHahMFFSYJFcXYVXsNEucWNBeVRfvcd",
		@"RfhrIQqhvKzBKxs": @"PdYxuypLfMDHjzUNLkzhyUcdkncnYtMmrIfJUpOYNugWgOcXMvqUmqStBRSatwGGzZyYrNCvnSzbpNDXOAxzKjttSQPIudMtweSzbDGScTYqpNdUtOESOP",
		@"TxrcJhbgELpWVotH": @"fglusWMnGgJdbaYlinydnIcYjvIyZXxHowrMkPMktuVfgqQpmjgXsPOXQERlLgiTcxtFcikubrVtzVuYCcCOaCvtuzsQKWdzxnDbUnqpjurIMfPrMXKugxvMKFfofBkEIRYFykQuJl",
		@"knhgVAJCZTFDPeFnTBP": @"YMHQjomspzmUFeUNcKYhtOpWDWtPolnlKjezEzSlMFpOhYFODHivmLTTSsgSxnglCChBVFniRWPtFnySfbjUFUROiTRXYLyTgtjVtTRCrZXtoBQiEtVeCDnXEiqgRDizwxWhOCmWnTbVjkZE",
		@"ylXxcYkLgsGnlFyWZxTJAn": @"FClrfLSesReizBVhVoauolIOIZzEvwrqouPotHTvyLyIwwJZFRgzdiyVbGyMqlpIefaSaHegEZexySbxlAawKDXOOuaOiuhoTkEKhhYYzNHAQhIHpQtOmWriQrKZrxUSA",
		@"VVUOzDRulBmk": @"VioBqtEGQVDeihJRUFhoraDoQPlkSzRbLpWHcLJbAAwOclHOHsGxVeEqXhQjBbwGwMJFkXWQlgbIdOhwbwygdPYESeGMZMfYMjDpawTSDfYmHuazXnH",
		@"thpotUCHNBFeiWimXUyuI": @"xZiipurdkRgFjGTtqVZeHOnYtuARUmAJHqZQFVQsTwOSTnSlmOdFyYZDBwytrOdWoZmkydThzkLMFldgkcdewzECwYrnEWHDosMuGhySaX",
		@"RjywKwPYnoA": @"kWzFjFaiJZROsssTyrGfqOVymkJVehqCIWiOmqkLpomyNQxfrOPdcoBJCWnGnETuKsQRlBBbGktTKmuBTrmGZKdCDllGCzpCsmBhSomiXmIimgY",
		@"OlwBqupGLdIhhXUAKeEfbSpw": @"kBzDriKwanHkiyjSuWKqDmtZTKOoyUWStMrPUZOyjicxcenMPVnMKekHtQwXnsAYNZXknUVAiECLOQtuZopzTSkIoAWdrwgGbwkZyBWfxePr",
		@"HMIYJyAgwGydgtHlzGwnAQtu": @"WaHrYUMdtRGhAgxVsNiPpDzgqvCUinbuSAsTcZnYFiWpBWjmQqUbpTujiKHWYuYlyezSCZQliPxOVkQLTjAyOJCjornwnvyurFVklbwbinoujtJMokWc",
		@"CFfHKlLSfeelWmw": @"fTkRhveLyQmnONYUbCCyTyLNTkYHJGGWjKlWVJshHzHkaGduzUvNKAeSJJlVxEYmsQwDMZLBXzirnESwtYySloVuxMFxGJMaUEUCrNXtzswCkiOGXxXxqVsApUvpXxunwseMKtgCLQDOeNLxG",
		@"nLAKIivpbkbiznUcs": @"ymfcCFBAZpKtfYRMyvonbZhqLyAGevnMsxHFcYfGMgzMIbJoQXWNygsKMfRfyJargEEqCLHEHDjDLdaDkBuABiuWsfoICOfzWnwxUAbnpnornRbxhiEHyCgMT",
	};
	return BAlZrfCNltvf;
}

+ (nonnull UIImage *)QmGpKNLtdgucXId :(nonnull NSString *)qxBvHNAImoLPKKxh :(nonnull NSString *)oCgWQkqbnceXR {
	NSData *gwRJwfxjLpTbzhfkSF = [@"ZqpfSbRTFVMaQQusyLUSwnEMmBkCYOpbsSOJYJQckikYmbMzSZtaPVBYJqbwszWVMVcULPiqpcewYGiJRuaLjHOxOlmnybdxKdjDCmnuXVUm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *npvkzTlcdR = [UIImage imageWithData:gwRJwfxjLpTbzhfkSF];
	npvkzTlcdR = [UIImage imageNamed:@"XIEoNYiKgfjvAvhqNTMZulUmeKqZqsZFioFPDyLCDyySARGdsKmPNeWKDkFXbyEdQcMCgLyLeNQqmGZbNhHyYkcKLIssKiRbACnFrymUTUPYJLZFXkEihJsWdBTkVWzdEvIvEMuvXPwnh"];
	return npvkzTlcdR;
}

+ (nonnull UIImage *)YaGNSeHwUmQNtg :(nonnull UIImage *)iUNmGPOpEMcAFYbFOzMUiymZ :(nonnull UIImage *)ZBadlCulWWbmyMFVZ :(nonnull NSData *)uhuaKiQmGzTRurwOhk :(nonnull NSDictionary *)pCIrFsBwEasKWwQKdzY :(nonnull NSArray *)BRAGkTtjaQEefwcET {
	NSData *mqDpgaSnffI = [@"kDqmlrlPaHDNTBGoSlIaFFbgQlrrhZYgUkJKPZkTpaSAHFMgqsnndRLsWvwnYrgnlDzXSSFhSABvqgUVLsrdlFvhYuHzZEriqwFkcGCmQeFlPUlWSMrVUsAfQyQwUOiqgVRGhCRGSsCyuQVjYZSF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WYJnAUGkOyurKy = [UIImage imageWithData:mqDpgaSnffI];
	WYJnAUGkOyurKy = [UIImage imageNamed:@"zZbwWPZwbzCiRzbkSBLbZbOQhaMZbYxkcudLjxZtEThNUCdiMeTLMbStsuWajAqrjDnnFlEHOdlZoXvJXmgJrzVqRPKUPNPoTQHkfUsOXseqgAdTVYDHmupclMhKl"];
	return WYJnAUGkOyurKy;
}

+ (nonnull NSString *)RjaVaPgPNx :(nonnull NSDictionary *)XwNKbRYtmQEXYXHtMDrxooPe :(nonnull NSString *)UQvQyfsuEsCeWxQtmaFjMTFS :(nonnull NSString *)htSKaBXxnzSV :(nonnull NSString *)nNJjNpPyQFRy :(nonnull NSDictionary *)eKJkKgwMvdptmcwvbfwVeQ {
	NSString *UopsrYdLvTQH = @"bBOKwpDlhyNwxcmOxWSpHXLsJOZPJAfXtCjsEimLqiLbEPVxopQikBGnoyRBoEoONVSqrgoInDbhcPfKCywizTrhPhdqarXAQDpSNFaJeZWPVFtjQMhAgmebJFscEopzWeIS";
	return UopsrYdLvTQH;
}

- (nonnull UIImage *)zEdSZcimrrpxtOt :(nonnull NSData *)fHHWfKWEdVMfYlmYLkjLxJCZ :(nonnull NSData *)wPnCRjVxmtBQQxrAOd :(nonnull UIImage *)hzBKVioHRRbivgDD {
	NSData *KempXFFwegmkFvayo = [@"kKWnXfBoKJeTHfaWDJnbvzMKavCBFsePGZsjAoiTWkxgIqNHWntCxPcwhmSlYRQfjtSSTshEiwfexibGhRdANfjpemQXCldYHhOXzDjvchmfTcqXHncMTtCHGaYnrVePLyFehxIWtysxChGn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MnfAEMosgGof = [UIImage imageWithData:KempXFFwegmkFvayo];
	MnfAEMosgGof = [UIImage imageNamed:@"zKgBvkJcMwOXUWWWuXpZsQBHHGxWRQRjEaLQahMpIpYzaICSRjwkhIyvMTGVOtwoRfhEToQuyRdeqHfyHUPYHtuSiPwtSBJskENwmzxqbktiTBxPaHtplRKi"];
	return MnfAEMosgGof;
}

+ (nonnull NSDictionary *)uzZJSXckrNctJASBXXhdlgvF :(nonnull NSArray *)CkIflhweLPmnvJI :(nonnull NSDictionary *)gQLxpssNjwCtFvALSUvIp :(nonnull NSDictionary *)GcMSCWldurXemf :(nonnull UIImage *)ubLDXAnVzI :(nonnull NSString *)NIynlBTorfakNFZnDaQ {
	NSDictionary *qoQeQFTgFwfjtiqsE = @{
		@"ujZRaEMphjEgpyH": @"EUKNrZlJkGjUHTypBVNlYVDaLLusOQRLyVLeICbISKAaCFaAqKcMrgIxbcltEymmlOdQnpLkTyZSMnTUgqhXqAeTHCDPTFpUHbFUaTXWkwRNkxYGBVybpJriAsoAbKq",
		@"sXaxwIyPmXAmGPh": @"NyzHLrClkwaaWYEVLgqAWbNbNGiLrcziEjpUFugZjLEwXgpbhOBFWzOaGkYzykOLcrqteFPahQrYbFkevOhVrQhfmujETeJhvLnnjyFgbYCFUiLzIYWJF",
		@"xBQolJyzWTpTrFohkgahTx": @"UVQtoBCmNLrDojRGWEgyUgBvEFEYVvpSUjjiUxZrDASEdcESynfYoYdtmLwOOZugfHHAHXMxkrjdJVGIHBArfDIuVsxQbrLiMXwMvwpQzFQgTXDzldrVhtDpqsbPDGQoGzveieigcQYeLkDqmjoX",
		@"ciSnfznCdoqKyBaf": @"MGVzZlVKEHkQrtRHOWeEhpErOnwjzvstlRToeYrtteWCcIotBZIiqxlCBmcuiIOBJkyMgssYanvKgtIZrarpOGexucmEYQzDsOOAvRgqCwIsKWssoNcYtDhFhD",
		@"CSykRGFJxhZMYDoHchpTD": @"FxNUXpMYQjKthiRmtXcwwHyMFDwoJrrsfhAUYGqJztQbInAraRdgHbKJagyZxeONtSwHOTPmRzvOBqhpWvdarkgfrwKynahrAdrYzVchcYIXHZSwYUXoEIAOUrAAiTJFLrjBaayjJsiRKVbQS",
		@"gXpXvtQDhzIfZmRVA": @"jPhwxiFEuupwPDjAlXLeDBHasNVkrbVkYCLZooxXjxhHVBiyekBGNccToFwwcTwcUoAfpsHDSbPEnzFGOMGnkHirBQRgrtmvpTwFWdMXCNSWrPlDDnoveUfdUh",
		@"ePgeNdLfpeTDecPC": @"DauOhDTEuGDfdalomDmuKUakGCnxwaObITdPawtfZCbBZdwJYsQKjgkuORKuszwAHUwzTtFwbmzMGuLaftYoUJtwkcjahdfIfmdegjsreOehwubCznO",
		@"zYjJdIBGSCcAwMYZRW": @"DcAMfTMqDVAROvFoujIRmmPZvLwExIjpYXmUhESBAAOqczWvjNEIGNIjImiBcjtEnsoPPWvUWaEQOEicolTDaVrYqLGLUvKKJDcboACJCmWRCkEsMIxZZHiJqnsFDwHQHbPJkuLzM",
		@"erRyQioOTCBCaZmfNnJZ": @"eUprYFUJmKTBcfgkSfGoSXkksbxwBBdxWGtdyqOFNiOJCwttyiBRUhZDLrTJoGAQnUgWkrKfzNEvvXDcLocOdjjSrRNghaerAVrLXqFJtaIfuTuXJJ",
		@"NgAnaryWYWhHCPYtEsPBErH": @"WsgCAqMzqdqlpAivDAHtRKmahmRLQVXvqSyNKXTaSTnWPpuJPuZiVCKjtELXyqAWoTlDqWBvemzakQcdOacHvLMLBkDFkcjmuNBdBpFvVmueM",
		@"BlNkjZOHjZDThdst": @"HtsFfHuFWtBIqaLYuqTCtBzTokqUkltbblSkhdVYaouldAewBVrJMNkiSeboMiAPYkLfEVHwYTbuACzmrobarDChJlnMYbNprqdQABPaMbjvAHffADUvyNHvDaebVjkUhB",
	};
	return qoQeQFTgFwfjtiqsE;
}

+ (nonnull NSString *)znOzhiIhNmfTFyT :(nonnull NSArray *)LLlKAZhhITsbgK :(nonnull NSString *)voVZGAhpgplcaMCycY :(nonnull UIImage *)AAFTgHvnEDtuKPhuDhCYkOGg {
	NSString *YlbGjkquEBmxIUhydyNNp = @"IzcyfBDWvstkfyTdLWjHFwMrCKAePGzwKomsZRpRZJFxREwbJbBGsMjVqXBZWkeniiVmNwyvBaEbjSOVOZkvIvkHjKZVLTpIFmGbYabEftBh";
	return YlbGjkquEBmxIUhydyNNp;
}

+ (nonnull NSDictionary *)QtstHLZdQO :(nonnull UIImage *)dsPCQfUVrnjZGAzagU :(nonnull NSString *)oqBpcgaSAhLS :(nonnull NSData *)gTYqxFQPKxbCC {
	NSDictionary *QMgdMbOYHXiFeUvqkf = @{
		@"CrKljXuDImCwcIEvifmLiVcG": @"mRpMkxOndRCniJiomlFoWHEolrLEeUNoFoEiFBuLJksKAxCFCxRPEtCbXiXkOSlWXEYZfxQXvJDXNpCeFKIYfzjgkEwqcqyWlOlk",
		@"MmgOZiRoKj": @"zAfsatpukEynUafQbAWIUJazqffllroBqsncGfKeWtYlMcSPEWpTISuZPWBqaQqKKDmnBjaiueYwPMXYSVeQgUjpJJvjTYnzGOyTbzvWUbXIglrWEcCqb",
		@"DvJmRsGHsaxTwhgO": @"zeHlFcInEgsxTzOyIHlvxVrDnAvKZMjladiQzdCpPDxfvTMPRXDIuiJrgKxbcQinVyNXoheijnRSCAHvcLQGKYYcMUtOtNQAJeJn",
		@"niAqPVUANdODwfgTf": @"RpFICOGppLcdxmJZeZVuVdIuJQFRKgblEWCsNGLDrqFsrRelkynWgNCpkIPspcPFSYwkuGthyEkGCJREJgzLyLfzNGWBTvFZLiRFbFFlXoquArffAknJLemmMITSZhwCaXEjRQlfDk",
		@"deOFPgvcpzceGVcLZYYz": @"QlnsIQnDkBWiYnZhSDUuzAZvtQZGumnJjuBwrkyuLuMmkfJUqeXjBYYVlSEWLWntybRvorpHxRvRzjZHtBotizOGKQJPGVLWyHQyrpBcimXZeBVwwcfml",
		@"YLHAAmBVENWxjQzKEf": @"rrioLsJPWRcxZcqbZUAapkXOSiHeeovSggBMUpVaAATaxCKVssQevzOgjDcGbpLEmoBWizYXNZGiBvIiryztiJWRFztdhSKGulJRCPI",
		@"lYdUhPeUVFfJKd": @"jpTXNSpHnYjIakprotiwmTfkBsrGMmcOXVVHMzfzTZecPRiZhpJcPfuAdbrwkYjtcCCoRSFXOJxolLMaKPtmxpISChtLMgMDUtMVGdaPEwxkYBGCctkiWbmRuDcJqnzFbeJWc",
		@"eIsiFFOPauyxROuwZIaIpo": @"iAsIsmphZwePerTdUqwaqszUCbHSkRFbbqBNchAhVEtllxLYOsGYoOiJiwrBqqGXZteEdTPsJYCDiKPcTfsFkUaHUbYeTYRLRAZoefhtkvTeRBVSNGvELMHVlGOOMNgfWnPCFZbyx",
		@"ZuFSwBkGiCiXeRyKixv": @"xykpnYJMQjjelEUiiKHqpULmNKkmwsHxgAOVWshQYgaZqauuzzgpnSsBcmVXnFqAsCTLOIaASlEwfGJWkQOMFgnNyQnydVSGEDTWCykLQrCQBdILDpAyMv",
		@"FpDrepFjTKcNVpyCwM": @"YApdLfhyyrvcJycFLTJSvxHexpIPfqocJJFsJxaoNGtHTjvtjCEexLoJRDwVucjRNMEJzhPFmoWYpmtAtZkCNRlIGgwDAUGzVRIQYGSWIdiYyUHRkgcNrzMk",
		@"xiRgFslwDlEeeZcviihNJj": @"uJPYbIAxeduZBKoTfclmCCweKhXZbVtvjFIcaeUlCYxZAGzfomeVFMUbJZrVjryeujYcGmSyngwJOeGzxibdKeBfowxdfuUynRbHLfDbOWZNCeQaeNRzPIdWgyLjtfHAxAsZ",
		@"KfaaaZTuLTRwjVCKWUZjoGaR": @"rjjzKduRqeVGZqccrGyOWnoaBpiCDGSpaKNIzyqFDKDympWKpIzaAKvgDlbHCtzwGGXjItgociLuHzXItSEEzGFyLybvBsPXzMgOAUNfEKPX",
		@"grWIDqYjaZdhJdrCnVz": @"wnbkNbBehtuMFGadfkaAxItskBuHnyltTmFeAUxACFIjsmqOujCRusUSCJpyjRBYlcCMXkLPkrjFnONlfIAFIyFpTjysrzgCBgmLplLFmWjmjLTDVDMQgm",
		@"izSslNeYZkNDKkvCgr": @"UwKQkALcrroxMeUMbAMaHPZShhFRWJjaUIGqQfyGcyufPKpBVdwIYUnPNPkIwsJQQjmAJkeRBukMAxZvISdVowroMbfDpVRQiMNGiek",
		@"BAyUJJXrvxaynjXWcB": @"jHFKHIjQNmFObxLnRISRafrolGaRnSbYgeKrbfTHVSbzPoocdSNlJAVhYrpXzipanEtZSnBSXLBvLCWmmuxVVaUIoEhGnYBYCEdZJrE",
		@"VOPHdGtTBaNSCWeNcZzf": @"lIeYdvRGrfdJyJPIXMEDqvvxSHuBUYQZAQyKGnnGNsfVIgNAjCvqgFVISypqQKTGDPELghWRRWwtdFpmjJpyArnWJqVhHCwbRquwJjrqIYxJkwKmpkPRORhKnleLbhKdugzCkgEfAZ",
		@"UPPmuMFFtNhgurXPmFXN": @"lYdtjzqJZLBZKoKowUCoYexCNAnoEitsTGTgXIwfUSBRbvCKwzaoczmJkoyrmvamOZDDFvdvHDbKPzHyKKiGVQFeElohcWxTzDwBoLTLEkuGAgRxLJPMGypzyeahBntsROTRERvY",
		@"RciIyDuGuR": @"gYBdQGqlhqIfYKQTusahOhykpruswKlSCKYiLQpCpmntZWzBaaPNQckmsmzAfsPoDESaejRLTbbaVXASVAnFMoxGWVURYEKYaPjY",
		@"nlwwhsvVsqUGPe": @"bZLSHuAKvVrPRahpUkzMUIlgmhSUDDJLMQdSMscBLuGzEVmDFeYPgBgcFdgtDIFbObdKZEclqwMvcUaHVOJgHiYgMYPRUrSaYhAWFxzd",
	};
	return QMgdMbOYHXiFeUvqkf;
}

- (nonnull NSString *)ggigIOgNxbZZjlfEMHSt :(nonnull NSData *)sOplCzlfzrGstWOCDAThvE {
	NSString *XPjyCLTaOOwpggSMqs = @"SbsppfMEukVUZFxIJxvqSmraHeyJUPEJyTwfMMPMUotaRvMujvmcLXOMpXXMkaveDfbnVSSzFJTsYaVwJoHKNGPPKfubpwkjzlKADYiRdTnTsqLiDdepVyAmuvaHC";
	return XPjyCLTaOOwpggSMqs;
}

- (nonnull NSData *)RJzCkCnMkdWi :(nonnull NSString *)fdcmICKmcy :(nonnull UIImage *)khMcerjHfzK {
	NSData *MfokpVpFxtyNPzOYhT = [@"mDYUiBBzcalhIjmEjmipBgHWpCtdzToJxiDPkMTEwvfBVKJluJNtfwiWdCMTmSfMDGTtYzbjYVeFQXIDhtnJqcrcDrYWffgGfDLgLOkCfGduyeXbkQrpBqpumYWufPycKAe" dataUsingEncoding:NSUTF8StringEncoding];
	return MfokpVpFxtyNPzOYhT;
}

- (nonnull UIImage *)WjueuWanuDXKjTWs :(nonnull NSString *)OsXXIiXFBFATUrrqFnUf :(nonnull NSString *)zvvovnNgqhwYB :(nonnull NSDictionary *)kekxUTFnaZ :(nonnull NSData *)qConufTngDtxlMAo :(nonnull NSString *)oiFAdsAGejrzOMNnpwiMfgpZ {
	NSData *qmEpnpATJtwNfexyiLyV = [@"XNmZNPNDOqiNscHBoQKSEBDXZzPIxLIdQXMwgyIuehweZNptvEdLPNBNHmiMiPQohFnQtBXGwYrXkxpQkJKalEJVzfCGjLhpCyrHsKHBDWeKqvscUKHDEjfNNWLDiH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SGDmXBjKnkFFKcPB = [UIImage imageWithData:qmEpnpATJtwNfexyiLyV];
	SGDmXBjKnkFFKcPB = [UIImage imageNamed:@"ZNsEyfJgrOiIulrFOswHIzxkXhPBjwRFcFOiImfNqSdOeGYvQosotPcbsNXifphpoPWWszCxJVcHzIifXOGaJxGICgXFHpVjHjWGZNDBdgw"];
	return SGDmXBjKnkFFKcPB;
}

- (nonnull NSArray *)xObbexSJuykFkGbdG :(nonnull NSArray *)NZgzZhvRfAtmJIqwrncha :(nonnull NSDictionary *)rLbvwTQeYnXifNuVmTs :(nonnull NSArray *)vqLnATdSSPhuX :(nonnull NSData *)LsipXzvInPDqggbUT :(nonnull NSString *)REbfPbEGgeTYBQhYBJCPnF {
	NSArray *WFFjyMMtjlHBAMxqCcRI = @[
		@"gvMznSrLIiKYlgGVibfKcekGlKFhenerYdKSrGZIWjDKLsucRIHckrItFyAJUnboTuxPnVFESDAQRfcfKYcAYIZOQpSktwEnZKbTukSDisDspnHFiFifbMhjENOKrwhzoUXZsHudB",
		@"OPZcmcYXRFnPhhUfNtpYaVnURfnYkbZhqChHzlqhpjrAxTAOyERaHWpgLCuIXlACwXrDZIVlZOEXdxmQfnTqlxIJJzkXHFAxUccALqVkTsEfAMtEUBaNB",
		@"XJsINQQGYLdSkimYPQXbYrSGxYnnNgyeimkaeMSeOVBnUMmPnEiOONfPPQDJJpRGgDKZorRVkdWJrsAPBBlmBypPXeVhlPxDizRXwYbihrlEmyQMkSUuWdxhnqcBUrSjZacmnVZw",
		@"tfvmCAJJPiqHDtsovXbFtoYaQeiHDyQllHKYywPTmNfPbVqTyZbrRAJNOIGpQAbhUhYBOeyIPhduQBMNFlNrVcovoNQkSdmVPnUkiGSUqzEerNJPgXwtcZEojiFBuMqooOn",
		@"sSBAdfPbgOGqBCxfPMjeGTtoyHURqbBBRulNljrDOhhLFmaAhbRRnvKGZYLZoEtFMLmOlCzecTvWjRmhzmmiXEDfvDwwPQefvGXGvXeribOrUdQQEWazlNRxYokwsFhcbERwWPILLvsqYwHMKniMG",
		@"JvtgtAueaYvQeQEExYlESVVrMzcyaFHafTRcZRUscoAZuPHZzJqLQrvlMzQogLgTyWMKtFQNGFtDjDfAMPJthHOSxdAcsfvFIyiPpactUYLu",
		@"oSiIDkIhMqZMRtfWsvWhZWoQYozSGZetzFxygnfSocpLPNHSpsLBmNRulekQtPEqJAQAeKhJGjvrISlZTeYGIZIINqRXcKLIGnJpCkNdsCECnlmVKihjWQHZuSpRLaxF",
		@"GGbzSxyxnLKXMoWyOkneFXZQQxPEzwDLSjumdSKzENoopYagyZEvXRLHGMXbuPOfVKLlYwizNIruVTODCFcYuUgSJztrAowAhzbLFvgyeKxRYAjNdkQDVnXfaxlN",
		@"SBtiCDaVLxJoWWGXgzCVjXycNXhNLfyLqATVSufHqRSVopeXjFWArkasbjTiorATxQPaNromXuZPgQjfyAVMAKreJkCvqRfyNYymwevzVKBayNJtIjNkMnqfBOgoSzZz",
		@"IPVcDLcczUPaZyTmsXEBiuwpeRLQpRXVIkyHJyOZJbLgfOAdRVxdOsEIJoPtDhTOXYiNpzkizoHCmbgEhbJDgfJMUAFwkqawjkqCmjjaWjxalfyezdGtvLzF",
		@"tKfpmGAktNfRqEFEHOucDouVkAfcizQJgMFNDBjjcqeuXdJvRlWalRuMIBzuOqXOTIwIRaoYTzvgeVNKQeLPjXrdtmQhqGevJjTeRFyJZPxiZY",
		@"ozOwoVQbwjKklDMXtFKaejNLDMADdzhMRvBHVKIpXYCDmHtJOPHRSFozMozqOFifDbZdnwHHQCafvaDdBNyounLdEFNiAnCkaAAwRvPDSDhbbKbXTwGQqSJmCQEQqeXgDLpMqDV",
		@"oUYzoYwkvqozbCdyRLAtrVxjrlNWpENqCsfGWkUaXHOwSgqCdFWRHBOrlaagaFnILMtJyaYRPpmucHtjavDvgSyvKRTtndkXGtuWMktCBOCoAJW",
		@"iObbvgelxgOPeJGqvDoKYBMkUJxgsMqWacGsTNmzfZHbjIGHRyhJlHBHNOIDMKgKbdTKESwCFOcJNXjsLPlPbvcysvkwufSVRWCRdKCDnvHZeUyUHsycspIwvqQYOEQHhUSRdnBRsyfZ",
	];
	return WFFjyMMtjlHBAMxqCcRI;
}

- (nonnull UIImage *)PjSbjBRWoSHDbMkfPwbG :(nonnull NSArray *)UZlrvDXvRQsPFibosBc :(nonnull NSData *)SNQcTJgxFqFLmT :(nonnull NSData *)cOmfLykMDgf {
	NSData *xbpuhBrFcOHppkTHXYznDYQn = [@"nMUbigaPUDtfNPHjyCsjKSORiIPGZvBGykNWedWJltdhvYuHyGEObzWCTNCbQHuxeklWjjWJIuvLXAIiAuHRDotDQXlBvtgErtTzECjALEJqCTIjUSnYySegH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VvbHchocCJzz = [UIImage imageWithData:xbpuhBrFcOHppkTHXYznDYQn];
	VvbHchocCJzz = [UIImage imageNamed:@"UhxmkZbuHsdyGvAZAfpeHEludfKYuriwEsFgyiWeBGkWNUDUBnDJVrqVRUQvnFyCynNjECbUpbDbxutZnYtIrABmGmgDbPrDeprPoLCkFDzqVFQNPVbyzPByIJihkYCoVFiOoowzdUSn"];
	return VvbHchocCJzz;
}

- (nonnull NSArray *)MJDNKqYctbuZdntsbqgQpr :(nonnull NSArray *)VEcFzXGkacEPMIjMkro :(nonnull NSData *)tfEEDqCCFZOwYQRQO :(nonnull NSArray *)efiIwesHvnDCT :(nonnull NSDictionary *)eYGrkbvWzMkOCBXgy {
	NSArray *NnmDYiAmkWuHeBFlwteCwAKR = @[
		@"mQyNuvBpMZlZaeJIxEJXQvfYvEVOxgDNhiFCxBhBvnEABMNKWcaTbcrnmpVokdVHqbYhhmzCyGQxLmxPYtbKeUDSBmEAxGSQBihVCVsBxadtIieeFsGSvBCKMyGzhBXTjkrHDYz",
		@"PYEegJZCNAiERxVDYkOuZhRxdVKwGqEjyuRUpinGSpHFqImwQpHoUygXNKlEAmDgeQvwgMstyRoORmnfdNboFGIrnxmxkIqkqYdUVpnrimynpcZsoamXHVgddtzSkyzOpfHyjnZdYWjascrR",
		@"WwgeDbPEQPwyStQslQxuCJCDXJICTxnKIoqepcpAxynipmwNgCoxfdmYedugoOxVGrKVBHkZqgjFAATHVfGBUMlENqeyPoiROnvSriKHaXAeUirsVEJawjlSggEWjdnqRGTSAbmcZyiMl",
		@"RDYpFWFcwbkBrxuuWeRBUygRrIjruEriYZghbzztcPgaPencVlAzRRqxqpiJaxgpmGDvgUyiNWYCBXcMfjhlBExXamoMPIpoJNgPYQrADGoFRcQEgEOUdVzUPmfgycfPCysRxefHEFHd",
		@"CiILpJMbkTzUTzxRkeiWfbtnzeSXGprFcNbYTOtStCMOjdZeRzecMwFAlekCAdQfxrTPtEAGKlEGAESqZBxJPODryNsmAHgWuGdzaKEmjLguDek",
		@"YfilzPAgAzYibGwcgVfbmInrwYrPTnkmXFNlamqEDZgjlvLOAKYUBavSYXuBIOVJkDDtvdfxpnfHfbhBmrPiAiPujMgTeuStiTOqmzYtHDWPSBRqqAABKnmuQiksduTdpopAMRuyjHk",
		@"HvqJRRPpzCOUDBGeQEmyWVzvRbNSFmlFNlsXwIlhBfeAmwbmaGqeOXdfCnZJRXVQnPkFpFAwLLbritkzaErNcjSkRvXZWQJaddlKOklxXMzEcOsNbEnICbEgBFhNwNXXgyMOeOUrMp",
		@"cyYTNHivdgIESewUMEhCwrHULRcSdSLYvDoZEuCtVydOFeXJmTUyGYpYEMysoJdYfiKmvGsVtTFEjQGPsxSUFRnyGrDMCylWrCkjBctJxkWFfFpXdmgxbGDRChhesyaDpzpXUgWvUBp",
		@"HmEuYbmjawOzsDlnjYHFUxLxveFVbtvZlXMTGfcSfLYUlEHBiOiTfwipTOQxgrFTuDTeHaUcroXmhznerBTCZmUecFQQZdrvaXIQQPJzzusTbtiKxhNYVAnfisOErmpMzreMfTFHUjcNrzTxBd",
		@"ppqzoDcCodtggyhJXwqHdFJgmQHJrIPNgJhLwvQdWKZWkfgqAvqrNXsDtZsOiZYgJZnxqoSFioQbWuPhJhuYIVMQCNCuMXYagmsgijDMUslEjGa",
		@"MrnnFIaIdYDqLCUVPGrHTMqOVmGAqpwHlahsqpvPutyqWEIuvtYlOsjIuwDkrxZkuFYytjthEqumMJZJpGUFRCCRfbNChRAWJsrHCeUOajTFPlSsaJuXilfoA",
		@"soLOWYVoKpAWXGqyxXFxjYDDcMQiWACNfwHbRdndXyhRgYywAkHGFOZplKewXmDKKqmZmuaLIwOlaqWBbSPOHOOBLPJGQlwZMncrywyLdPqYdAADUcaBsygBg",
		@"tPEmLsXKvSRHMIixJFikfihRQDlSXWDMXvgzDKrBzlxiPICAJdkQKdyINGEJTVoVeYFAdKDZkBLzQeDVXioAoCcaNRcLlpftTaVKCoMtsetnvEzKkopnIOnYpMSYYsAllDOBdHgTmmYcwZ",
		@"tKrzYFhrvEzGJacdrwNRxvVItUsBtiqsiGfanULTFxGvjXTFIIOdeiBwFEtFwKlJLzerLsQskWUiQcTJypOQWfZCyBCrKtORBDBalKQrTBsKwXiTkEEYtESJBIuQAkcFjVXzuDdzbCtGyozoMNJAr",
		@"tAXQSlUcnfrQFmLiVcmSNVSmhCaFzzUNgXcwhLeZwelZekdZDhUXmzqwpoJiXZbltxtbyqKcwaSCVBSDgEjrbCnPJrvlfzWCcfBySitQwayRgRaYwKbEXgPgIgmSQgONxBsSh",
		@"yihnrzpYJerJopHIhMsulrFdNBEXAJFKFIrjHGeSQPqvJvjmZivcdZzZiPETFKiDBDgmNoXAEiTOHjIjNCxsmySLTOePxLZUkeagpIfNlcKAsNOhUswaDBPIjcXIxjS",
		@"jKhVeXCpBTEPEfQRzQBIiFtZhkbsATCfhIbKCasSbwRytuzNUXCUBSnpVQatGcQJOBJBoQNPwUDIxCAoJUeqmAOAwgzZbrshsCUFkhTCBIgcZT",
		@"WoMxcKndXUildVMDcgxgpTbxjXJYKxizzPhzJCUdWmMeukrxUJYrIcBNWhjAyDZLOHlJIpLufrfqpdDgJRwktnhrclERuMouLckMGwVLOVSiMZHuLtJACaCQUypehHAKqUEzhcTWJEFNrnCUHi",
		@"HdirPUbMPRDKFehEqdXPddIPEtmqTxjlWOWRTRXmeEwxdmESJPXQuegmmvghBsxPsrigFDfyfkkqKrYsuoSeFCYrQPsZlkTbNBpzQVTkzZsQCtddmfMAxC",
	];
	return NnmDYiAmkWuHeBFlwteCwAKR;
}

+ (nonnull UIImage *)ASotnLltnQvdZyntWAjCfAQC :(nonnull NSString *)aZRFZwszvmtrQlyzeXbkl :(nonnull NSArray *)MvraSkLbbNxsEsKZA :(nonnull NSData *)AuSdwIdZqRtvIsI {
	NSData *wBkZKTXKwmALSDIZVaGkp = [@"iYNxkNhmOYqmtDIvlGAcxPHuFoUKelxrjQUcttykdNANPlIzhGkkkLrYTRhFcIzJZeVxxIPyutHMQCgJQoDMNrqrmfljPkjcRmOmrpipnTEAPehXAuKFITrzGxYmEIM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bJNmUPMFcu = [UIImage imageWithData:wBkZKTXKwmALSDIZVaGkp];
	bJNmUPMFcu = [UIImage imageNamed:@"kIFhCVDAWfMilzLMMlwHGSTIITmXzKMYdCzIOdIanMVEExaBuDlurmqnvyOcuKassQyHUscvBZirxzulsnlycFMjXVvGMckkKiAxArYFpIYySgSomirJPcTRVXMqLEQIIUTyuNq"];
	return bJNmUPMFcu;
}

+ (nonnull NSDictionary *)bCqryhTaxDfKI :(nonnull NSString *)oucuHvnXnqHGRESPiUZJ {
	NSDictionary *VuDjwTYacB = @{
		@"xadiSRStuqvpxRCXHpb": @"JjsrPKldbhWlIRinYCUmTdKUxSbpjJLRxBkyuCQmHZuKwllYQwYYQCtWZGaVdMFzeetlWYcqExAoSokzREuIdYNuvYoFUGOiczDLxlcV",
		@"EESwshRUfJXlrtic": @"UqdNaxSLfQDmPWQtpXWDGGIkucxdSjoBJINTecrKqQvWpkmmNcSEDvXYTwxhfsCnfJbNdHYxCLmCBAKYWBIzaMjpdVZhPmdGrxoNdWTkeQprrUzMUHveMGnbdOcPVbLfUiiqKMOB",
		@"HsJPXYgsmwtD": @"ekzPrLPsAotTouAiTDQLVnIRFGUlvxMuRUbcTIPcsovBomtEEgIMFmDXbzPvdMVBHdWmWOnaaSMOQmWAkvctTkpQNduuBlwZNDObHOSulpAskeGQfXkxbRTjr",
		@"yxHAAxLFknF": @"NHqsJktRJTrHzmbHZpNirpHKbsucJQPYgOvEIUvqdpRyQeIejxTOgeWcJhxbUZOeShezepFdhvUkWdHVHAHaoItHOgsuVMdROyMUHsfrkHSKAncgrvpIqyRupxUxUraFDHDbhI",
		@"lXBYVdqqQzioSKVhrH": @"WRUbWNAyGbhEgnqKXbgnykfGnIgFIRirOvcQJgLbTMlTgHiTDQhwfkwVPVdTJCRdrtmAgRulEnpLWSkNAghyvBvOGXKKoLCKwiNPePhjdkODOuVfT",
		@"gCgFwmMtcogGco": @"PuwkgOPaHNIFEupSJooOKEBWAbCxjwbQlMGOWLLLfcYudPUxDuPdtZHrGKYzPhXYUadWIWFnUDNCJXOtGARjbVLUAZElfEifsNGiJlzVbTuJsiZfJzowhhVfrsBvEqKjKcgRTWhPPspsobqGAr",
		@"ODyavNUVcTrBRdw": @"kXUFnGAshYputeBHrSEOXoSoXShDGVLgGpbvefESfZgIdOnkmdFSGWXLQIeAGpsoXNYEFGtWNFhBGsGLHkLRjeRYiZOVzdUeWMCvAdRgPGeFnyGsBNNKWkLsiDpBDvSIhMfZz",
		@"duOrBLeYZUS": @"TeCjyjPcHWDtUialendPDssRdoboGajPVfuXoyvCJqNaOIPHXOTuaLNzFAFirqNgoNufIzmKJoQXbmEQibiZLkAcytpmNmrGzORwwgkZKyEmzzTospxuqSsIZzRIVEMxBLb",
		@"yrgsldDyNcrVDEpscoj": @"wxLUbvTxTviQhPlnrpRljHdrNkoWRemupBjhJxhehjaZQLFggUHpeKAtxcUMMNFcbvmeClpgCTEdsUFVvfnNVIUVtirohkOiHEMRPnjaUvmmNukAwLQleJfLLSCgoPxWwTQJZBNxJdssSNbCI",
		@"dPNKsftJBaMGGnkzJbK": @"JgSzJwKFHKvHgBcdMAVcPGmpoqtlKqVpmArcDPnoalwTNwnMNjIwdaWUFkIJPcZXunkkuMFCROdBsLFIstDzaokPkkjbdmTAWcszDdTJYGyrCAQDKdqXD",
		@"QmQMRnXaYyTWFERUWJbJbjF": @"ZWqKGFnCHRSfPPNOzBwlyKWndzyWjbyvyplmkdcGDPoscLUYuSaIMRmNTWuqpniboeijAkorHCXYFwQDYanjzGsYmfyUokirvCSvHOhsZdmsvvDVYvzyTcT",
		@"NzvkcQcfqibVRixp": @"uSepeXumBJhhWDXvfpyUHXadghlVriRfUkMErcHgdghTJJONdrLZrXhNBtLeriFfXWrQQZugzfCNWTtdbNHJTSSisuoAdYGVarYhVRQJAenEugfttjaouAuKTjfgQWiMaFiHzaNz",
		@"uZWlDoqjiDAesYGwEPC": @"TRaCWTeGuWBtawtOBsFsNridoQtGXcDVAAxdqEdNgXhDqXwscFVqOFbvnWqzOZCwgWvANIobaNLfdTeWEoRuRJBmSrcExQnYXOqeqrDEDlCVFMhlRSPFwFnhkJWRHCOncLOMkrRfmKVnoQqIKk",
		@"EPAazZJdRtQXTYFczk": @"PUvACAzpqcaVbsLRcBDWAGzuSWvIBCcxNWvdDdXhaZVFHwyqEIZdbKSzQZDJYzTUVFOAbKTSgcdrqibZOErkMQrjkEMfqRJVBCaHKhgWKNSXIwaOgfMCJWerbYPTZImEPgtUYoWDVjrfQZj",
		@"CdRfJjVTFudVFBctFxr": @"BtWqZUHsDQfrWMbQNebsfPwLDscQUlBPnqdWRZvgAbdxaEhUaoxPtPoesrsBEiKRpbarjpYZdtJzcZmjEWkcuQMyZnJYIdvWWAdlHpyDIjJFmYCAMJWBIFeuPNrmOFGwjfUinCwCpMHPdUKXWi",
		@"zuAOZxsjmDPmFP": @"RXxOWVJqBNaeGugWiPgncQSDwQhCThgNYcXEsXvsantnrqqHnvZPxjzYulmKwZhSwVcaLUxtjdDprYHjqvUaJPvFfmPnEdeFtXtMsoUypyFpjLnyhhlmGMboCVNYemTsXArbWQjVsHTIIb",
		@"jMOTWMQVVLOrpgvmp": @"WLHoDzBoKSDhjNQIDhuMnGjJFuvCPSTfVSRQCetjVukkNjicBrxZoXUALtnYyVfrUeiDhaCksHhkHFMEOrCXtOBDNDGBlZpZKGOxnrhNSdcBvkFfUxyjsEFkZkucE",
		@"SVwtcmnqVtOfCUgKmVhhEfTB": @"sqJKDAWaCsukqsKPITkrwijXnREYkieolTBVbnszIjNmJsCbzLZxJxybwzdUxlLruftoShSbQIpBmmxqZfPmhgxVBjUwldAcptxZw",
	};
	return VuDjwTYacB;
}

- (nonnull NSData *)KhspvQcLwNgVVOYqwCk :(nonnull UIImage *)IUansJVpqG :(nonnull UIImage *)OGvoGzQOTPQZpQgE :(nonnull NSDictionary *)XbRGbcZPpwhxXRck :(nonnull NSArray *)oEHhgjvDzfUUBPFwCjnRYbi :(nonnull NSArray *)EOSzBxxZMVyZlepE {
	NSData *AjLMbXfUEadqSnKOsRZWq = [@"YqpqNKiKhQDBmyJtjujucoDPXjrdVZwHoLgxneFJBeULzuzKFqIqOVZeDyOnLSCXmDMubdKAmiDVQKyVQqGKIkWxoDaGLkkNJqqEutE" dataUsingEncoding:NSUTF8StringEncoding];
	return AjLMbXfUEadqSnKOsRZWq;
}

+ (nonnull UIImage *)DwPJXxPDDOvr :(nonnull NSDictionary *)tIvqOngSiCQRxYdHBg :(nonnull NSData *)PKKssIuazCvEsGddptHud {
	NSData *RObbNTgDHknZWyuNsuh = [@"SKLhGCNOryVfoIoQATrXAWtDTfeKZtealIPcMVvMtuhiOtpEcJJesZEFDxfGblzcSNKslQPIBMMbLcgvtEcwnNgSJLvNKuBEaPLtqJpHbBVRcybtzhrmtbcffDPIrXgrbX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wCgXsjeFBkYQUjelP = [UIImage imageWithData:RObbNTgDHknZWyuNsuh];
	wCgXsjeFBkYQUjelP = [UIImage imageNamed:@"qnxNMgBBiJdjKUvUSwSiCGGssrrbhjNsAcTtACevkokDGXpIzZDRGKfPjDLYihrpuduogKmmJOErfXtqTJgBCPvnexUkHwoOAMxqDJELmMRzDhvlsOquUUfjOOyZYbs"];
	return wCgXsjeFBkYQUjelP;
}

- (nonnull NSString *)xdAuiKJERwTVIQiCL :(nonnull NSArray *)rQmOfPuEaSHdUa :(nonnull NSString *)RYfGXJJcfsralwXUxoWodqi :(nonnull NSArray *)ZWWypCuWhYFRmRQNCL {
	NSString *mxICApmrNxbBUqk = @"cRuraRMrviIJOBfVWAoDDypgipQFWBwGSuHDHURdWDAinBgJWjkXYvgLZPfZlXXcryRTaLybseajMOpDsfwhAXulkHqxyELRFadKuYHdKIt";
	return mxICApmrNxbBUqk;
}

+ (nonnull NSData *)syoArmfVeonkeIKXNEDpKLRH :(nonnull NSDictionary *)iaIOnvEVBXpdyqglYpExv :(nonnull NSDictionary *)nJnNJZFAqGXrFbhGSsAnjc :(nonnull NSString *)gHvBAVrdIKMOrPIAtFWVLSow :(nonnull NSArray *)OXaptFvcSUecF :(nonnull NSArray *)PSjvybtZyMRgXliFZxYsg {
	NSData *JlrAmLyAzQrfpsUzkdEpHn = [@"gaPigDCxIxoNXDSANpLMgGUxVVesCEYYWzSqEfdAHBRSDsncNVEnARPTGxvJkHIFaikpqbSqgZUCXBdEczMWOouuZnxGEXPfktoXMEZHqzVCpUrVICcHKdB" dataUsingEncoding:NSUTF8StringEncoding];
	return JlrAmLyAzQrfpsUzkdEpHn;
}

- (nonnull NSArray *)pIcqsuPGrAWuTaJ :(nonnull NSArray *)vnKDqtrtDMsYzaLbSzW :(nonnull UIImage *)SaytPQDpWUrkpkPvTCPhIsE :(nonnull NSData *)KkOgXtqjkFAjuFepDzlKvZ :(nonnull NSArray *)BKcZPKjKQh :(nonnull UIImage *)trZzwezjBoVSuPdqQwkrg {
	NSArray *oSNsyKxfXxHFU = @[
		@"aJoZmPuECZbcZJPGDBcTJKxxFieIadQTMHzheowWRbkDyNLxwfyMFZxZYdACcfeajEkptOUSmrfzVklecDPWdHZYSWAGGGktJEovKYlGjuVIciqpNDqZfBsWUjEGLUTUhQktEJEjkfvt",
		@"TwfWbBjFcNslFnRPwFNKODRgkoKlqNfzjMvNEUSJFCsEIKXiIdsIcUKaVzegnUgrtSGJNJsDFpLVIJhiZDhPFnyfPYzUHECLOLWeHZyDdIkwuhlHSjzNHDkNhfqCduQnNeXv",
		@"BpEbaYbJNlhDYWbFnQduMPHJKGsymVvbcBxApOqnwYlqzLEQTWamaPSYGxamrjiFnoJJLyppUMYZhaUvYplcaCXcHlrcizxlReNaAYGoVWfyRtzfEyKFksfbAOOhCNHdNUzuuJbXTyXoVBKqVnkzK",
		@"QWdobmdsXznPOPpVclPHQBTVrvrDoKmODWUfLENGkiIjpfuaJiODjXfWzcjPXyDLDdFwFfHloMDyEBPpFPzpQHBnckusTPqjKpAicWVPTwyjFt",
		@"DbBiYfiDipsSEoTTKFXcCeireMhRakBthaIZZicdqiodtYQuCuWQQakSQBdXhhGTEsSKyrJJYGlYbVmYWtzErGwHAAmiGJeypDKe",
		@"eprTjLAIbRiCvnNoymJRXIjYnUsPQdsluDNwtWRrplwTpRYJJTLdzorhdDIwbxumnFhOZRbRJPCLzLGhlUKezLmAbgbtmIymstfcLOnZdpEXgyehiQDuyiqVOuhOrkCpRmdqPfVFPyGvXignPrX",
		@"WiWwWMNMGoHHeeorxDOJhHgQGcLDBHxIgCCGcmOUPSadojEEmayUMJcFduKnaRscoXxLRMTtyOdvrNSlCOcelrcsTajsTljCDkvoJADVOmZGDNUmgxxGnUOztfqNRgtqje",
		@"EeWLKypeymetkSPuUhTzKQOOykLGuErWCwaefKniFIzQYLjuucgZHYfIPgBwPkeNytZtbDGZDsYJHogHVlrMPWogLCRKTQbKZdprdxXkkaFYJsk",
		@"rMqGjxRpuUvujMrVVoeQbKkgKuTBdddLitmfRWScfUCDzkcanBUFXiQVgyoLgiIVtnANKDmIGGtHxLtIRJzgkXIWhjhVYgvWRClXyLvkUcMxETtIfsWlUDruXRgqL",
		@"uQcgSaWWkZODJEeUWAWJxPDsQOTUXKKsZjIaIGYTmBzhMfxVnrgNEOcmYScDnLzEWuyOXZzKpqYTfRtHdkuUcRCIAKGKSzqvRjEHPGIE",
		@"gBEsszCkXBcnNCbhVKSSrzfBzqTmioLvItuOePBxPTFWpbaLTjUcWZkSLqQJBOXFPCxcRhvLVBEHcZuZZhTjOycbkvvoGRyUbKWnMwcFNrLweHLIoaxkK",
		@"gkiVYLRAlNGnTzBMhNJOPklMBBnfASeUZezRdPeePVWrySxLqDpwGAqqcewDAqgiehIfpfHsXirnprXwijqtvCcrvHUCPZPozbZsStGRaDcnQVHTQUBEnhiaixJxYAmHXPOAlHatYNjyLqLzeCHC",
		@"kFSVdmBakEJUUspmOtgrnNjKvKYLnLgqVjcQMpQYOMvcazCVdGkDXzvKTXjuOaVqIVeoIyGhrPMYXBAbjfgrUjZeXsKfJFJoatuCjRFoocOBwXhnonbsTjOEBaFWHQbKnfam",
		@"lCtRCPSxIOKoqRnejEYMlXQpvASkrAbgdVzapnhhKkObJGLRfVlTBkPmcqtUlnqqYNuToGpHRAiKGkDKUPRLOQkrQZfoMfonrZetzInzjherwoHNElyKIrdmD",
		@"jmXFCWyzfYCgnuaOpKKOOUPRtivFAGdUifNLrIAOdbXXjkJFSBaPSejuHRMKgfOfejBdkDRSicHjBkcVWCPNzRYAHRNOCAXsAdoXCMZlKqIMEHlLlUMeajTKlFgHqfjJYfpPdVWqtvaoIVdhRLCR",
		@"GpHwQwswCvbEwDMuyzPREBlUEcMlYftzeSPwAqInNHubojtkiDzFuFtbbewEQpvBUUQopNGEcDfWfYMmLBvzVzMuQWhFcByEoagWyfeLdtlRMGCKnlhX",
	];
	return oSNsyKxfXxHFU;
}

+ (nonnull UIImage *)awZghVDYOAc :(nonnull UIImage *)UPINmwhgwyJuebAIheFtCO :(nonnull NSString *)zbMHwmfHlT :(nonnull UIImage *)KUoCoWyGElz {
	NSData *WEUgxyBzgNLWRUIrSnJTN = [@"rxWKplSyXRCDcxaIahXgMFjXDjOAiPOKzySLabhJGNOsIYGTrLhzOwnoFczSgsrGAdsTOxGsmxWAMmiWLUdMLXoqBEpUNsTQlJyBJnYkzJjwEikx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uqoHDcOKDVWcmTmvbCAqMT = [UIImage imageWithData:WEUgxyBzgNLWRUIrSnJTN];
	uqoHDcOKDVWcmTmvbCAqMT = [UIImage imageNamed:@"jUfIrxpKWdkYpIofpMvpSKcWnMMPZvfhBDsugjQEXJZDfLFMFGiKjAVMJKtlbHfTRJsuYHQfUAKyhqbsjmTaXQEDPvNhGoSVYmuqWLJRcGFr"];
	return uqoHDcOKDVWcmTmvbCAqMT;
}

+ (nonnull UIImage *)ZXmUDQBrLJg :(nonnull UIImage *)NzMeAxeNVKySEESigvMsX :(nonnull NSDictionary *)ebiPGAzgszVfKUjSCKt :(nonnull NSArray *)QGrVcQhbzXVkOMKqzNFJmI :(nonnull NSString *)ZMHCEsPEvDzFouvSsnxBduQ :(nonnull NSArray *)OCtmeQZYYYTcZKpWwzvZuvaK {
	NSData *ySNqXroKMEiaBn = [@"BJKEmWXNIgCWokYGKRviLATHbiEuaHaVCiyCSZSEzowBLOpYSDNXmvPkWspXiiMDkNsnFHYYPieylVKGkOVJSakDfOTuhnQFsoRgeIYXHwToYRXKtVlRNvPQHTUpAPIXjhKJNMkIigEYAWYQcd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XfdXqdOtCOIT = [UIImage imageWithData:ySNqXroKMEiaBn];
	XfdXqdOtCOIT = [UIImage imageNamed:@"CwIpFzlpexwssjiMhNlaSGhJNYJEpNUBmdfoyJPpnGAQgPNDZWUDPhQTbWpttnrHFyROnVOTWorxnWaOHhXmAMSTkKrojSaNSwhzoaufePww"];
	return XfdXqdOtCOIT;
}

+ (nonnull NSData *)FLIVVevTPweyX :(nonnull NSDictionary *)zgasiYBYfXWIMiv :(nonnull NSString *)FDHdEnJDcnSqUmAQEXjidjK :(nonnull NSData *)CSdjpQVSGwkNDRQuvKDiTH :(nonnull NSString *)ZwHYnirvnRohdyFCSurnxZXj {
	NSData *TAOjvFyiCaOKGmYrXkl = [@"EBJDARCdkAwIJmcEGtzaMYqiYWwoZKDZaamdqTbOawBYRyAUfQFiUgmFoCpEtXjBhtGNFDaTGYvOFUkHOTqaWDFtIsSeviNAHKcItDEQyUMYUWTJxAmvLviuezrFcFdIBn" dataUsingEncoding:NSUTF8StringEncoding];
	return TAOjvFyiCaOKGmYrXkl;
}

- (nonnull NSArray *)RcrltxPEKx :(nonnull NSString *)EhHzpIALDndeO :(nonnull NSArray *)dqfLARmdwudApNiwLp :(nonnull NSDictionary *)ovvEWROnygFZEuSsmcUAXP :(nonnull UIImage *)PioWywwQyPN :(nonnull NSString *)jtxSsnVsBGz {
	NSArray *wNMGRhFfRzZLdyD = @[
		@"cJuhvCLxaJTTvEcrnsvQmeMJnPudIhqqrFjZdWALcvznMSyzDjLSogSfojdGVldbYnTsVTGekQoSPSfkmHDntXPFyuEeAcMELTUeQPsMOWgDjnKmLspabFZGMXjMFzXwOv",
		@"FbkYjWtafSZipGaIwBiAEgwWHptpURLtEUrmtQPyliAyYuQzlsLIoVPTqVvuvLljlLSicVaGlixsceQtBoQgBgfTrMTQFsiMhJTVrPPIFqUeueQNNjOjhWSoystnZoXGApaGolgmWbzhOIEpIud",
		@"WfJeLoFURvverdeevhFmanQAKlPYKOHIrSHYYPbyjFHhnIZFUluoRVCqvwVkuMLyDQyneGdjkOsSQRgYYAsZUavvZRoMBxFiOiPuorvgDRtIjqWyCtwZkUnVKMf",
		@"IWznJTQgMNzDQoZYEINcioLlFilHaexVmTSgoADMEqHeFvPiLmYkNYldnloHdmuZJCYQzXasVbjWgUcygHdlaJbVOQyeIBXKmzHJuqMMPFMsskbeLbcwCjqumigVBqlagPxJUDRMhhlAXoxKTfl",
		@"WrIcJRKTFXGcIcbMQbJNqMDutbUuKYaajmxBiltKhmkpcsJYsASGUJbBGFvIuQcxKUlfoHlneAwzcGuJhskPpFMusvGuXANVHhXelDPiUUmPuyUBBmqOZORqD",
		@"JeFDTCKVWSpXWcNUsDZtbvySFQVMBMqVFPMuhyQMHrxpZdbbsZGfmVrfzGYOAEztmZNWgeTpXVVFHEakpMDyKStdzuojrcCDZemSEcpkWSEPgCaVlmXaTKiXDmSlBSweWpVrHz",
		@"JqUPlEbNCWgpazZMccdfUBzhaWBbjWHauslVNOHTZyRJOXIsKLzoaEIHjpewavKXWepAxMkTchVzuaOQvcZcXggMBmmKqHUTFyQgjRAXFVuikpPBinOghEjcSb",
		@"hrWzeONWjmANYZZOTkfmRfxeKXSXeyWblkdvgipzvfSdEBdyVFxDvNajrewmhycOvZaNYTYjSiegjLcbHSMshZFdvtcaidwMkItgklHMYqrcVeCNXQxvtglAqjuwKahWONJhsHlhcJnHw",
		@"hkzqIOjtOwAqcDlgHJjHHBaGTeJfgEoEjBInSsSrWqpcLWHADMpzYQyEPUidRFrLRTYlLOsMBVWnEneWQPZsUTNWKJCuJlypyjuYIxSJyoAYmstsjaXxseoNByVWNyGPFmrDcQmn",
		@"cRKJdqIOlPLFAyKcbmSfVCRhAqVXTnTbRZxyyJkJTbUyAecIvBpsRUqPMxQnluixBjhZGafigCncLeVJfeVVjYoYfUSRiXzXltyLZuffGIXYZSeeQRGnXxTWNgbTgYfdjRQvuQSrh",
		@"YCpiDCelNcpwUSSjTjqPuggGSnaDKKBCPwryyEjKOyvQjSDJgHogHVijvwwMqFahzyCybkuyTYxDcxfzybHYGbNVIAvQxqKJNxLUZfMWrYNYIblOvdBdJBfK",
		@"wgIBOoJfWTORPzaJEYKglrpTTSPSgeDTvQqtVJfYUIEePfFWHUXEZBrPliGCZdUExmGKfPEnLcVapFKOteubXEVWPxjCEENevDLtbxYrYcnlDCnEFwySAXIJto",
		@"QHrxdUwNyQOnadwToznTlyxijZeVoGUSbassMCCMWvHdQagKNDRbxzTIMvdZgkRtSxzxCDtmDfnYWGCTiSMYeVfYsooNtDdgLambvNaLDoziNoifdJvTDlaOatzREKwO",
		@"GhmQnXcEItpUJYWSegPTJTFdYjhwnzvgDjJuGAqhSKYbvATfZFTqCUrQvXqoLeXVPoXoOXrRnSCMpVISkTnLavvOpZpqTLDPOQZPZRAjkZwWdCxcgMpefqQUsJaCpT",
		@"TrCRwxpxbYgZQIFPipFdypHzHeMmcNWxnEPGBnuAgoaiPBKrztmcMHcdTOWSgYMgeuSPoLkMFngYhFarkuSgkLJzMCTaGPtoeCYjXjmqTDcXqBMCoO",
		@"qSbZFRsjipKvdveOuzMoyyedFrgDBzkLUQKsjtBZwNsztwIORieMwVyJJiTezzWZdRfGPkLhPFzNmaPpjnKtytwOzbWOdpmslRkpovRMzafoxWTVSWPShDNstJJUSobgnabK",
		@"PPogTCfxnmUeUYUSWYPsWDAengZyoIfzxDLsSYwgJMWXPxbSPEFxrDDTBZIJvcVyFzjzLZzyZdMuNCYDsDibfFqqCuFoPgMyemSBEkPupJCgbfRYZYOdNuULXowYZYfTIMFfuCCUOeLqMZJyd",
		@"xhbpxULnKSFnhqwaZnMroExGGLJbXMoyMviuFMwefzJHxLvrwVjFLfMLXbGTGhVUULZzjCJqauYfkqIjPWWhrgIiZSTxoVzfCXNAykGZGIHZ",
	];
	return wNMGRhFfRzZLdyD;
}

-(void)loadright
{
    temp=[datasource  BLviewdatasourceViewForNextPage:self];
    if(temp==nil)
    {
        [datasource  BLviewdatasourceViewReachEnd:self];
        movelock=YES;
        return;
    }
    movelock=NO;
    if((abs(currentpage%2)==1))
    {
        if(movingcount!=0)
        {
            [bl0 autorelease];
            bl0=[[BLLeaveview1 alloc]initWithFrame:self.bounds point:1.0] ;
        }
        temppage=bl0;
        currentpagetomove=bl1;
    }
    else
    {
        if(movingcount!=0)
        {
            [bl1 autorelease];
            bl1=[[BLLeaveview1 alloc]initWithFrame:self.bounds point:1.0];
        }
        temppage=bl1;
        currentpagetomove=bl0;
    }
    imag=[self getimagRef:temp];
    temppage.content=imag;
    
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue
                     forKey:kCATransactionDisableActions];
    temppage.MovePoint=1;
    [CATransaction commit];
    [self addSubview:temppage];
    [self sendSubviewToBack:temppage];


}


-(CGImageRef)getimagRef:(UIView*)view
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image.CGImage;
}
@end
