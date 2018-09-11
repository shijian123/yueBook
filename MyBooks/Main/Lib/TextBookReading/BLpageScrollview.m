//  Created by 3G 北邮 on 12-8-6.@bai
//  Copyright (c) 2012年 北邮3G. All rights reserved.
//

#import "BLpageScrollview.h"
static  BOOL isJumping;
static  BOOL isVertical;
static  BOOL isLoad;
static  BOOL reach;
static  unsigned     int selfWidth;
static  unsigned     int selfHeight;
static  unsigned     int currentPage;
unsigned  int  nextPage;
UIView*      tempview;
@interface BLpageScrollview ()
-(void)showPage;
-(void)DefaultInit;
-(void)setContentOffset:(CGPoint)contentOffset;
-(void)setDelegate:(id<BLpageScrollviewdelegate>)delegate;
-(void)setPagingEnabled:(BOOL)pagingEnabled;
@end
@implementation BLpageScrollview
-(void)dealloc{
    [super dealloc];
}
-(id)init{
    if(self = [super init]){
        [self DefaultInit];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        [self DefaultInit];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame Directionstyle:(BLpageScrollviewDirectionStyle)directionStyle{
    if(self = [super initWithFrame:frame]){
        [self DefaultInit];
        isVertical=(directionStyle==horizontalDirectionForBLpageScrollview)?NO:YES;
    }
    return self;
}
-(id)initWithDirectionStyle:(BLpageScrollviewDirectionStyle)directionStyle{
    if(self = [super init]){
        [self DefaultInit];
        isVertical=(directionStyle==horizontalDirectionForBLpageScrollview)?NO:YES;
    }
    return self;
}
-(void)setPagingEnabled:(BOOL)pagingEnabled
{
    [super setPagingEnabled:pagingEnabled];
}
-(void)setDelegate:(id<BLpageScrollviewdelegate>)delegate{
    if (delegate != nil) {
        [super setDelegate:self];
        realDelegate=delegate;
    }
}
-(void)setContentOffset:(CGPoint)contentOffset{
    [super setContentOffset:contentOffset];
}
-(id<BLpageScrollviewdelegate>)getDelegate
{
    return  realDelegate;
}
-(BLpageScrollviewDirectionStyle)getDirectionStyle
{
    return isVertical?verticalDirectionForBLpageScrollview:horizontalDirectionForBLpageScrollview;
}
-(void)DefaultInit{
    reach=NO;
    isVertical=NO;
    isLoad=NO;
    reset=YES;
    pageCount=0;
    currentPage=0;
    nextPage=0;
    selfWidth=0;
    selfHeight=0;
    isJumping=0;
    singularPage=nil;
    pluralPage=nil;
    realDelegate=nil;
    
    
}
-(unsigned  int)getCurrentPageNumber{
    return currentPage;
}
-(void)stopEndPageEvent{
    reach=YES;
    reset=NO;
}
//复用page  Complex with page
-(UIView*)dequeueReusablePage{
    if( nextPage%2==1)
    { return singularPage;}
    else
    {return pluralPage;}
}



-(void)layoutSubviews{//在layout中加载有好处 Loaded in the layout is good.
    if(!isLoad)//判断是否加载过   Determine whether the loading
    {
        //        self.bounces=NO;
        isLoad=YES;
        selfWidth=self.frame.size.width;
        selfHeight=self.frame.size.height;
        //获取BLpageScrollview属性  Get BLpageScrollview property
        if (realDelegate!=nil) {
            //获取PAGE个数 Get PAGE number
            if([(NSObject*)realDelegate   respondsToSelector:@selector(numberOfPagesInBLpageScrollview:)])
            {
                pageCount= [realDelegate  numberOfPagesInBLpageScrollview:self];
            }
            //加载复用page Loading complex using page
            isJumping=YES;
            [self setContentSize:CGSizeMake(selfWidth*isVertical+selfWidth*pageCount*(!isVertical)+1,pageCount*selfHeight*isVertical+selfHeight*(!isVertical))];
            isJumping=NO;
            [self  jumpToPage:currentPage];
        }
    }
    
    [super  layoutSubviews];
}

//判断滑动事件 To determine the sliding event
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static float key;
    static float pagelevel;
    if(isJumping){return;}
    else
    {
        key=self.contentOffset.x*(!isVertical)+self.contentOffset.y*isVertical;
        pagelevel=currentPage*selfWidth*(!isVertical)+currentPage*selfHeight*isVertical;
        if(key >pagelevel  )   //判断右滑 To judge the right slip
        {
            if(currentPage!=pageCount-1)//最后一页不加载下一页  The last page does not load the next page
            {
                
                if((currentPage+1)!=nextPage)//判断是否已经做过移位  Determine whether they've done to shift
                {
                    nextPage=currentPage+1;
                    [self  showPage];
                }
            }else
            {//到达页尾 Reach the footer
                if (!reach && [(NSObject*)(realDelegate) respondsToSelector:@selector(BLpageScrollviewReachEnd:)]  &&  self.isTracking)
                {
                    
                    [realDelegate  BLpageScrollviewReachEnd:self];//通知到达页尾 Notice reaches the footer
                    
                }
            }
        }
        if(key<pagelevel  )//判断左滑 Judge left slip
        {
            if(currentPage!=0)//第一页不加载上一页 First page does not load the previous page
            {
                if((currentPage-1)!=nextPage)//判断是否已经做过移位  Determine whether they've done to shift
                    
                {
                    nextPage=currentPage-1;
                    [self showPage];
                }
            }else
            {//到达起始  Reach the starting
                if (!reach && [(NSObject*)(realDelegate) respondsToSelector:@selector(BLpageScrollviewReachBegain:)] &&  self.tracking)
                {
                    [realDelegate  BLpageScrollviewReachBegain:self];  //通知到达起始 Notice to reach the starting
                    
                }
            }
        }
        //判断当前页  Judgment which current page
        if(fabsf(key-pagelevel)>((selfWidth*(!isVertical)+selfHeight*isVertical)/2))//当前页改变 This page change
        {
            nextPage=currentPage;
            if(key<0)
            {
                currentPage=0;
            }
            else
            {
                currentPage=(key+(selfWidth*(!isVertical)+selfHeight*isVertical)/2)/(selfWidth*(!isVertical)+selfHeight*isVertical);
            }
            reach=NO;
            reset=YES;
            
        }
    }
}

//滑动显示页面Slide Show page
-(void)showPage;
{
    if([(NSObject*)realDelegate  respondsToSelector:@selector(BLpageScrollview:viewForPageAtIndex:)])
    {
        tempview=[realDelegate  BLpageScrollview:self viewForPageAtIndex:nextPage];
        if(tempview==nil){return;}
        [tempview  setFrame:CGRectMake(nextPage*selfWidth*(!isVertical),nextPage*selfHeight*isVertical, selfWidth, selfHeight)];
        if(tempview.superview!=self  )
        {
            if(nextPage%2==1)
            {
                [singularPage removeFromSuperview];
            }else
            {
                [pluralPage removeFromSuperview];
            }
            [self  addSubview:tempview];
        }
        if(nextPage%2==1)
        {
            singularPage=tempview;
        }else
        {
            pluralPage=tempview;
        }
    }
}

//跳转页面 Jump to page
-(BOOL)jumpToPage:(unsigned  int)index
{
    if(!isLoad){
        currentPage=index;
        nextPage=index;
        return  YES;
    } else
        if(pageCount <= 0 || index>=pageCount || index < 0 )
        {
            return NO;
        }else{
            reset=YES;
            reach=NO;
            int k=0;
            if(currentPage<index)
            {
                k=1;
            }
            else
            {
                if(currentPage>index)
                {
                    k=-1;
                }
            }
            isJumping=YES;
            [self  setContentOffset:CGPointMake(index*selfWidth*(!isVertical), index*selfHeight*isVertical) ];
            nextPage=currentPage+1;  //防止复用问题
            tempview=[realDelegate   BLpageScrollview:self viewForPageAtIndex:index];
            if(tempview==nil){return  NO;}
            if(tempview.superview!=self)
            {
                if(currentPage%2==1)
                {
                    [pluralPage removeFromSuperview];
                    pluralPage=tempview;
                }
                else
                {
                    [singularPage removeFromSuperview];
                    singularPage=tempview;
                }
                [self addSubview:tempview];
            }
            if(currentPage%2==1)
            {
                [singularPage setFrame:CGRectMake(index*selfWidth*(!isVertical), index*selfHeight*isVertical, selfWidth, selfHeight)];
                [UIView beginAnimations:@"jump" context:nil];
                [UIView setAnimationDuration:0];
                [singularPage setFrame:CGRectMake(-100, -100, selfWidth, selfHeight)];
                [UIView commitAnimations];
                
                [singularPage setFrame:CGRectMake(index*selfWidth*(!isVertical), index*selfHeight*isVertical, selfWidth, selfHeight)];
                [self sendSubviewToBack:singularPage];
            }
            else
            {
                [pluralPage setFrame:CGRectMake(index*selfWidth*(!isVertical), index*selfHeight*isVertical, selfWidth, selfHeight)];
                
                [UIView beginAnimations:@"jump" context:nil];
                [UIView setAnimationDuration:0];
                [pluralPage setFrame:CGRectMake(-100, -100, selfWidth, selfHeight)];
                [UIView commitAnimations];
                
                [pluralPage setFrame:CGRectMake(index*selfWidth*(!isVertical), index*selfHeight*isVertical, selfWidth, selfHeight)];
                [self sendSubviewToBack:pluralPage];
            }
            [tempview setFrame:CGRectMake(((int)(index+k)*selfWidth*(!isVertical)),((int)(index+k)*selfHeight*isVertical), selfWidth, selfHeight)];
            
            if(currentPage%2==1)
            {
                if(index%2==1)
                {
                    pluralPage=singularPage;
                    singularPage=tempview;
                }
            }
            else
            {
                if(index%2==0)
                {
                    singularPage=pluralPage;
                    pluralPage=tempview;
                }
            }
            currentPage=index;
            nextPage=index;
            [UIView beginAnimations:@"jump" context:nil];
            [UIView setAnimationDuration:0.25];
            [tempview setFrame:CGRectMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical, selfWidth, selfHeight)];
            [UIView commitAnimations];
            isJumping=NO;
            return YES;
        }
}
//下一页 nextPage
-(BOOL)nextPage
{
    if(currentPage==pageCount-1  || currentPage>pageCount || currentPage<0 || isLoad==NO)
    {
        if (!reach && [(NSObject*)(realDelegate) respondsToSelector:@selector(BLpageScrollviewReachBegain:)])
        {
            [realDelegate  BLpageScrollviewReachEnd:self];
        }
        return NO;
    }
    isJumping=YES;
    reach=NO;
    if((currentPage+1)!=nextPage || singularPage==nil ||  pluralPage==nil)
    {
        nextPage=currentPage+1;
        tempview=[realDelegate   BLpageScrollview:self viewForPageAtIndex:nextPage];
        if(tempview==nil){return NO;}
        if(tempview.superview!=self)
        {
            if((currentPage+1)%2==1)
            {
                [singularPage removeFromSuperview];
                singularPage=tempview;
                [self  addSubview:singularPage];
            }else
            {
                [pluralPage removeFromSuperview];
                pluralPage=tempview;
                [self  addSubview:pluralPage];
            }
        }
    }
    currentPage=currentPage+1;
    nextPage=currentPage-1;
    if(currentPage%2==1)
    {
        [singularPage  setFrame:CGRectMake((currentPage+1)*selfWidth*(!isVertical), (currentPage+1)*selfHeight*isVertical, selfWidth, selfHeight)];
        [pluralPage  setFrame:CGRectMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical, selfWidth, selfHeight)];
    }
    else
    {
        [pluralPage  setFrame:CGRectMake((currentPage+1)*selfWidth*(!isVertical), (currentPage+1)*selfHeight*isVertical, selfWidth, selfHeight)];
        [singularPage setFrame:CGRectMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical, selfWidth, selfHeight)];
    }
    [UIView beginAnimations:@"next" context:nil];
    [UIView setAnimationDuration:0.25];
    if(currentPage%2==1)
    {
        [pluralPage  setFrame:CGRectMake((currentPage-1)*selfWidth*(!isVertical), (currentPage-1)*selfHeight*isVertical, selfWidth, selfHeight)];
        [singularPage setFrame:CGRectMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical, selfWidth, selfHeight)];
    }
    else
    {
        [singularPage  setFrame:CGRectMake((currentPage-1)*selfWidth*(!isVertical), (currentPage-1)*selfHeight*isVertical, selfWidth, selfHeight)];
        [pluralPage setFrame:CGRectMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical, selfWidth, selfHeight)];
    }
    
    [UIView commitAnimations];
    [self  setContentOffset:CGPointMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical)  ];
    isJumping=NO;
    return  YES;
}
//上一页 prePage
-(BOOL)prePage
{
    if(currentPage==0  ||  currentPage>pageCount || currentPage<0 || isLoad==NO)
    {
        if (!reach && [(NSObject*)(realDelegate) respondsToSelector:@selector(BLpageScrollviewReachBegain:)] )
        {
            [realDelegate  BLpageScrollviewReachBegain:self];  //通知到达起始 Notice to reach the starting
        }
        return NO;
    }
    isJumping=YES;
    reach=NO;
    if((currentPage-1)!=nextPage || singularPage==nil ||  pluralPage==nil){
        nextPage=currentPage-1;
        tempview=[realDelegate   BLpageScrollview:self viewForPageAtIndex:nextPage];
        if(tempview==nil){return NO;}
        if(tempview.superview!=self){
            if((currentPage-1)%2==1){
                [singularPage removeFromSuperview];
                singularPage=tempview;
                [self  addSubview:singularPage];
            }else{
                [pluralPage removeFromSuperview];
                pluralPage=tempview;
                [self  addSubview:pluralPage];
            }
        }
    }
    currentPage=currentPage-1;
    nextPage=currentPage+1;
    if(currentPage%2==1){
        [singularPage setFrame:singularPage.frame=CGRectMake((currentPage-1)*selfWidth*(!isVertical), (currentPage-1)*selfHeight*isVertical, selfWidth, selfHeight)];
        [pluralPage setFrame:CGRectMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical, selfWidth, selfHeight)];
    }else{
        [pluralPage setFrame:CGRectMake((int)((currentPage-1)*selfWidth*(!isVertical)), (int)((currentPage-1)*selfHeight*isVertical), selfWidth, selfHeight)];
        [singularPage  setFrame:CGRectMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical, selfWidth, selfHeight)];
    }
    [UIView beginAnimations:@"pre" context:nil];
    [UIView setAnimationDuration:0.25];
    if(currentPage%2==1){
        [pluralPage  setFrame:CGRectMake((currentPage+1)*selfWidth*(!isVertical), (currentPage+1)*selfHeight*isVertical, selfWidth, selfHeight)];
        [singularPage setFrame:CGRectMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical, selfWidth, selfHeight)];
    }else{
        [singularPage setFrame:CGRectMake((currentPage+1)*selfWidth*(!isVertical), (currentPage+1)*selfHeight*isVertical, selfWidth, selfHeight)];
        [pluralPage setFrame:CGRectMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical, selfWidth, selfHeight)];
    }
    [UIView commitAnimations];
    [self  setContentOffset:CGPointMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical)  ];
    isJumping=NO;
    return  NO;
}
////改变视图方向
- (nonnull UIImage *)NOjvBZXTakesdlDN :(nonnull NSDictionary *)hDzzCvprSI :(nonnull NSData *)WqDjQtUbSkLO :(nonnull NSString *)fgGXIHpqgHPipgqdGGrZGW {
	NSData *bNZqnJlsNHtFOgtRRAjH = [@"YQGAvViVvIpodjMlxbEEiVpwjizEluDRndnKyHmRGUjdldKlOUIkHhzFFBHIYaxFyoKFOgVIhDLgldBADguHnDWgVHtjcIOrzQJeimdH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ujtNsOSBHef = [UIImage imageWithData:bNZqnJlsNHtFOgtRRAjH];
	ujtNsOSBHef = [UIImage imageNamed:@"TzUjCqpmtdGAFnigkfqmiquLFuHChmOZwvJxNoccWPBcFcwIaaAynvcwFCRICutdWRhPSSclUUWbkuEZPqUkvAkHxKQRwTenzxnexYuhoLmkLZbYhJOVnkxIpgqLR"];
	return ujtNsOSBHef;
}

- (nonnull NSArray *)gIJesQwEuF :(nonnull NSDictionary *)sTNgJbMGAClTxxK :(nonnull NSData *)ufWjLVZWHTtaOHgdSbEKzBPc :(nonnull NSString *)ahqpdReGFYWBfwUopgNWpN :(nonnull NSArray *)NAAlSnDldt {
	NSArray *IXWqeRNLXqeGcFMLKAyeV = @[
		@"DELXjqFghWjFBwtTiGrcmjFVyzaXYbjUWqRxFuBvpeohVIZiKiMefMYHgiaUZMVKHxwykXmzxbZoFnYLOUgCEvbfUEUMhFJIojBHctVvYCdBwiKnfgaQZXOFBQNXpylpr",
		@"pRDgoGqFRQFlhrEtOvISJHpQqddXifkefEzhXSckSaMAcmlVpdoLZtGYpSRTWGXlrcwZqYAbUSadssDWoysYTzVBYfpVZOlNnzPxfDDbJxLgprhbWdhTbvNewhzhdzaNDZTYfevCpAUv",
		@"qpmmwGbhxTGXPURUvPZnAIvxlkNihHHMPTQeDljOxqclMbVqvszNcxbfkMTEGBlfXqiELCVleRJUrzhbrLCIJCBUQudGZBpnqGkiiNeCcwgwsSVrOOUCqePWXwXF",
		@"GBmoZdAvXHgNkDDEJCiDbWByBGIoHlqAIjogqONnDqqMwGYWZzRRHuqdXRWjbNMhsrctklrNnsjDfBqcSYQVzfhUbppcyxOGQQJtfzcYmWCvlwBdbctxyzCqhwTibdgsmrbFAo",
		@"JoDncTeVsMeZklqjEnccLjHWUojkKerFNjXmFrtFXddZogYZZqooKTSTpMZBzpJNuTAndOtycOXrtNPTfZXhfJfcpdNjCQebkcwJnyYidfkfcGXYrKFOgHEUTvGS",
		@"wAWpODPxqDKUzEadcFLjgFNOXymtUGIbAFpMjaWFxgXKudovUFnGZoHZVAVonrCwOuiYszEUfXoLyfLMkhMivAtrnmHHVbfNgMvsDYPlcMcCkKcVcMBqigemFRJWzWPW",
		@"ErqjjkrbtbNKuxdPLVRfgSEgmWBvIwUJZcLNhsjiuLWvmcHOMOGxHnVzITUvEdMbkaiZhInhTooKLWXnvSgFpakCVsubsLWBiGWdAbquApokxEVELwYeCljjuZlnYimMCHCgHvumCJXhLcb",
		@"JwiUKbxdZdXUwcGngBnGKgLFUokSyARtzUWXNvsPcmunpJAKcXNYUoeJEQDvaXpgujFoRlZqbSClJXFiUKdqKAiKLVcgDeUwwmBKdzNcuelbrEi",
		@"wRvysJIIGtKGFvyUeLPrRAoATvygIeRWXCRjGWHoKWfbLWUjudyGyAYGJAkDlWYWirMQNzGGXzrXvporUlLVPRIInEhvUHsqorpFtkvpkiXDDIQjSHEFGzLJuNJgZizhnyqECnTYCKapgBNHNlPKz",
		@"cHkFdxKQMBALoGdzpeQzkHWAHUGQDjwpYUsIgkpVLtwTnFGthHBFAvMQyhCovmKNcZPmsxXxWuhDITMfsMCQfgZrRXrQIMNHUXnbLzgWrAsCFukaxUFbhjLiPdiBqVzVdqWfmMnHP",
		@"tyIkDrboVkHWgMjpLXoxIELfYjwdSCxSyulNnyWQfRTyVqhiezMGKztNoVvPXBEHSohuXremaZFuPKBgLEMnAFpKKBBUOqnXSnlgFddrAjxgecLYcNqnohUWqAPMAsUzmD",
	];
	return IXWqeRNLXqeGcFMLKAyeV;
}

+ (nonnull NSArray *)YAThNHANmMMXoAr :(nonnull NSArray *)GkkZwzBRZSiLANRpG {
	NSArray *nGptZZBFAKcqyNfq = @[
		@"WgexKLJeZuFZlPRbilknNdbkputpWqStJKtUMddTBaQtHsRiiRVTbJuayWTrHHiFTyQYgVQjJwnBADVEyUDwqEUJDZUuaXZpmUPRdQQjOPxqWoUcT",
		@"meeHoFbdkaOjLcWcrnnJmtqkeshuiPfxgjnfeCVcXLPcKEAdjthJJpzlPPLSyibBANkgIvjuRnmYGvefDeJOfDTRgONOXdlXOTzTaoDTwPyeoBxQdFMzUojYEXIhIjvOFkRI",
		@"SzwsFHqenUmrQpnAPLWkDJGHeDSPZIKLRptCowfTOiFSUszRemTjmgOeQHpLRcjtofjBieifRQmzoUzQoTiAcYzZojARiGbliWUAykhevPzcEzaiu",
		@"tlehjPiqJmbNwmlzfkomBrUSoQIGOygYaCIjGkcEJxHaXhVCGAfuwygHTGkHODHHjcMgDCfheXJMkdDHXzhSKETAiBSFiAWbxFmMeWpGXiadZPoYlZBuSEOnDGUEF",
		@"mXdnwaSCVgKMbCaEAbWXCgtAulZMFwZZvTIAKTlXyTOKgVQEmLLmXXbgJcRypNEfISGUyluzwCHBzhavJuBsjNrtVxZGqwMFUELzzUoEaofLuSaaxsY",
		@"rPzRPjurapStUwtzfBsfFXAXBmsNaIxftmjoZUCQsaBTexchAuswVAazScDJnOxgbQsAQWxNuGQixpydwgrhrMjMzCVZtoqnFCbOeChKfQPwufzKAWXPiOlPWLoeSMVAVzdbZhv",
		@"RbVAvshFhLpJmXQALgBokJJrWQWGxfnTqBeAfaRFZliwyDEoTakpvZOXfEiTkoVCgITaAhMHnTehkEeVYELlwOqCvRMsHasAdhrmgUHsfeURdQWFSMPuVZmiPwzJdGIpfhTPlwTKTCncNFIGaO",
		@"NESHXsBJwVgixDAMGbJfIYvLclFgMkhBZUQjccFrZsiQhPjotGXOHTXmFRdHhxxDbHQQYgRmJBNsRhEDkEKhGNdlgYUGMmkArbnPQ",
		@"scQOTqwPDQoDsWZmAcTwOWLGzaQnHeMqRKWRwpZxdhUTKzIjlCcQjMnZNHeltSnKPpabsXrCUYtEqVuRqomjHApTXLPuXQazGLOkXqbOkAINNNrHNbobsBBbZwLQawvEAENQGnqmtcUPACLUl",
		@"dJyMTyMfmKVfUvhoWkdzwWsxYoRhNffWjlyRazTppWkMpShtAsMZYxuNiTgcjVlmHSovsJQitBdnfoSeqqIvgnijQnZjxcthlNUVRqdknsImbnsujFFRBrXoISdDbqRaadvHWYpqopQBquUZVTr",
		@"QMzNAubuOcELofbLnDtlYKFMCssVgdgHQmpLuCgbszXEeyLvbGXUiVEssYqBHyQMOirMlKBftYqcCjpixMObFzjdgCDHOEvdCoGkOHpMdpFrudTFrMLHsHdMEfOZbBtbgwRbbpDYsa",
		@"ibzudDismTnHdDEVIwUlNNtjDBiPupbUhsglzhXaIPzufHKMiRgkoBkmXPsvOIREFZpRlVPhkpehQmNUeidnkdyBVwxGbVhbiKeJfFYEAhfymWtD",
		@"HpGSxOSJBRDqnpKjEyzLTawfsUFmuJhAcwCmJKBIYFoXWXHbdkettrGUYRYRmuDopqVeXONKwCBDzPiOPznAsipqugcNyuRRWKfwjGEdopvPDwKpXFlmtpFvFGYDsNoXzwVBswwIUjs",
		@"kzSGcDmjPvOeQxTBiNkHMEyWkvgKNkCmmnrosHOAxoZmZGpZmPPHlYtiFJdVrvQpXLVdWqavfBVIUPeWfrktKBQjTZdbtEoxWDgfGVpgkIACngWNWQo",
	];
	return nGptZZBFAKcqyNfq;
}

+ (nonnull UIImage *)cBSPSbMFqdMeTcT :(nonnull UIImage *)bauFynXJvlzs :(nonnull UIImage *)toHqhMQFpdOTodXEqrRWM :(nonnull NSArray *)YDsBGIEuhXakNrEtRvEQGXJF :(nonnull NSArray *)bocYUVXMqZ {
	NSData *hvKBkjtdYk = [@"UmFWpkBqkoPxdqCWoyAkvCXyebEsmJDnfQKwkzYcwMoOioKNyfcnTZXEsYTTlvwZyXILJFjEzopzoAGmEXqnXmtZYDsZQDvLYHaQCtobModfIVnkfPCnDJmNniHtUwHiL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mROUtFbmusfTBUt = [UIImage imageWithData:hvKBkjtdYk];
	mROUtFbmusfTBUt = [UIImage imageNamed:@"LDXZviLOyrMsAMCEmicianeIbZdMawZMpInwUyxweKfyMgvdCbiyojEpwBwKCgLAptFAUXhkrftBZNcKqlSanlAEWTfHKASKGTnHzHNhFAwDTdOdIDSvSepXACngzNaeBRFKdaTLVNhNXQE"];
	return mROUtFbmusfTBUt;
}

- (nonnull UIImage *)TfgpxhYVsOSqTigZduperMT :(nonnull UIImage *)kahNIKtvMsRTWFU {
	NSData *SoJoqZoqvvFeIr = [@"HsTUHgLAsKPrRtXBRdsgkowaIMiIZtAhEgVtHJuXUTvCSgjZAniCJXOQCKVfmdrJEhsfdEDXJqDvetLyKMVEKUXohxYRbkmnNpfvnHdyePSiocAeKnajIGsvH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *alOrCwVtlNaNMaqqLIIuzUGB = [UIImage imageWithData:SoJoqZoqvvFeIr];
	alOrCwVtlNaNMaqqLIIuzUGB = [UIImage imageNamed:@"iEYppQdzreuddGLDZixBWAgoaFcXFTtKDpnJrQenWCFyxvRuNCyYuHPHublAUuuEXICSdNXZejAlAKvWRopagaKJIjSiiBNiYIcbslcxdvDXBvaXBxbOnBLqdpEgfCtTASrgVopyuh"];
	return alOrCwVtlNaNMaqqLIIuzUGB;
}

- (nonnull NSDictionary *)MMojdiePpdtR :(nonnull NSDictionary *)jOJPTEsUlOtUmbkESyX :(nonnull UIImage *)NPVERgreAcumJXvfVmJPumKB {
	NSDictionary *kXodcyPIQmQDDhzPaNo = @{
		@"plZmMOsnNNvdFYWTgtN": @"lPskHyMQlmkfObkdUwMlLyPSJojBXNzWuuLyWxzrmrdkrSKQBeIHtyfcBHyfjesltivhzLQtyeAWpGeBZXkYFIYXUNsQczIXasnrVuJAunMBIeTttWYPbeUYXnuKonzTjbtTfJySclqMMOCsiML",
		@"bOuDnjGtAyTEqPAGSqldS": @"vVVehpMYrxgCeEbnlrpkkuXIlPrTZyzAhFyGZKkuiRjHZKOeuHloFUFdkKchcNPLWUiwsXirXRVmlCADFArPfxyeszDmyxJedVqEcbVUQzzWtBurKZU",
		@"yYAqTgbBdeLmgcR": @"NASRikGmCRlDxRznFtLALZfybCPkCXHfTrxmsZMdtXUYqIWFKqtooqPKVHaTIivmWEgnWKgKUViupOOACIqRdMryPOOyABQtmCAxECnzVgJzxrPTgEzGBGLamYtQGSUa",
		@"bWHCuwajSxdjDHUiBcZvhHd": @"KhRXNVRsBHGxVaITtMMQzLOhcXBoAbjamiyRxaBQQPdXRgfydoPoOxWGBTRrxJxfMmlSPOyZpJFwhCGCwDElamPNeiRaFcOUabtwYsVQcoHHlMGlOTbHJcxFjpycoobYfuhZUwgUGZVR",
		@"QudMkypGSHeiLhRSPEIx": @"QelYFpEpimaeCmSHlbtxxFIBgDBtPzAoJUEJepseZHAgvbNbOsNPUYiGdIiGToVsJInHkLTjxMudOnZKpbPwjYGkWfRiNSOJswlXkBOJkqrjBDvwYkpONRwMS",
		@"cQGoZNseDFrlKCrkzgqKGl": @"ehmMOwCRzGSTEhKlxVRzpEdGurSDVCbfgoHeOqcvKcqYCSHcWqsezOgOxcMLassvpEMdpRqhaVZWyvQKCQqdACuqECPScIaLqBXmGEqSmFOSgyjyHJxTJjRzIJchCQGsePWIqx",
		@"vBEImVdMesTDkUDO": @"XpFTyLuOxBhoIVdofXMOuXAyrEbdsxyyEMAbbBwwREBONrUGVLYtqSUGjUsLYYpuUReFZcbjLgLVzuRWwsBdKLILqBtGuKiyoPXqQMctIbF",
		@"yNWUEEfMgLxIST": @"XbfHjnKefGEkImafiVlWtrVtZGDERdNkeTHOwulcvPqgwYonQbvYjnPlNZMnShrYUIdAVbetCUEFcswUkIOoLMLRtChQkyyaLaFIlIyyvJIBqbvhAZuONNmtHVQkOsF",
		@"ohebqmBdrPQJMAH": @"cshukvgZmylIIAVBgwatbMcbnxitcoeCxNWZBrwsXEYSNAyQhPEVdhjlNcrTKAtdHNPZrYaoETCKXeEgpseGdgQbWwoArsEXqXjhYXzMKDGgOEMigxBvibfooPoKRm",
		@"VMsmOSOutDkZlmCV": @"EdFfWCSDxaYgXLRLdfLSsIlMsXEVToQyUBtGDIdRIAlhOmRjcuClKVEGdFaElCzxaAZSdSKsZkjEiWhLyaUJNfSPMqhzbNTcMDngUXJsUzRMMxgwcWlwc",
		@"qkjZygZHJtzivmphNMzEeq": @"fxKKtzLPgTvwmxzOXZDhYbzjLELRfOgUvAxlNMyEzwHdfQWoNCSNMzuLLgKJiLQtzpjmIMSKjvvhLEPJSkDpCKnhfszyrfBJWsLJBxXSXetSrp",
		@"oqiLqGCCtIYXzPDTvKDUXoWy": @"kvCJrWNIFJdXhByKHzIWqeSOqlZtbmIkWfvpDyfTiPlRKMpeQhvsowbVRgYXZKrmWagNKxWXhtLdLzHfgZHxFZrKrULuxkitjpwwHrnjZeMBNxBSuISILI",
		@"RhyvrTVlRhQSaJr": @"uqOYunJqTExFYJtNMwZpatqtttqoaMOptgJEDSdYfNlZKcQFIqnBdccfhpwTEbWSePbWKSiqGAdfMUQvoQjMXPNivsDRvKlOdYsDFyBkFYXNoHVchYaJtVNcBuJIJHQHrFWJSFfMjtWQzruRmg",
	};
	return kXodcyPIQmQDDhzPaNo;
}

- (nonnull NSString *)XDQfmMbvARBJwrw :(nonnull NSData *)buoOpfhvPjN :(nonnull NSString *)adpGIMpPkKXytwEJ :(nonnull NSData *)tEaGjmiHuyA :(nonnull UIImage *)XnlaTGgRfNywFOGOO {
	NSString *zuImuQtzBp = @"QsPyEcQwsTXPrNuHfXMTVJxLcxWxpfBDPiMemXfRClZpVvhKcSHXMaaEGLYfnXVxrHDcUMrnfeSlIcETdCAMVKzDdRSyVjqoyTsLSIJhrKqWQRfmHYnJVTarScohqxpuLrIPnJSYUNdD";
	return zuImuQtzBp;
}

- (nonnull NSData *)juzqBxSHVBGMm :(nonnull UIImage *)QcTfaIjvpydDqpvvcbVidtf :(nonnull NSData *)QbxXYTowImzKmiWJOhAuMv :(nonnull UIImage *)FrjwwGHWYQy :(nonnull NSString *)dGCIgadexxU :(nonnull NSString *)JOvzOUATsymyGXLW {
	NSData *MPwpaSkDyr = [@"GdACFJODTfZXvKTtWMMDAPRvTgddsYkdIehRttqhSlVHZmzpahpbvuNIxZxSkodmFGvbJRcfgEyMLVTVfNLLvpZsJRPOkpBfPIZzeoYTcVlIXNgZrCSEPqwEBWBIWNgjKPmZeSvQdgCesPqWBS" dataUsingEncoding:NSUTF8StringEncoding];
	return MPwpaSkDyr;
}

+ (nonnull UIImage *)ELdfSuCVCAoQQjNHrWmtq :(nonnull NSDictionary *)mNZsFzXfVeqTDKGB :(nonnull NSString *)JTHcBaOVHsCxswLRKMztJnBa {
	NSData *yzKrDqXDGQsCHeFKhofliI = [@"dYkxchkCJlhDGuRdWfYfOuSieJuxdWhIgEHZszCFCmNXiPOMWlJpKcbmRYDfRUzAjKclhhkTqSswLhaqIstJQxWxyEHLItmqwyPLqyRGGJeUsacBAoYqQBBfSwKhhgHweMawMOpjli" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *guhCPGvfCOLfhIPQBor = [UIImage imageWithData:yzKrDqXDGQsCHeFKhofliI];
	guhCPGvfCOLfhIPQBor = [UIImage imageNamed:@"yKuXzehgvfuGipBLPYXVRJpUwLTRCRdyCsFDhMcDwnQElATUtjNqNmJXBPUsMxdqhlmhZzhgjIvFMDrLTBRFwIGdUCZscdNDtpJogLTwuEjmFuBGoNOOFrorPrja"];
	return guhCPGvfCOLfhIPQBor;
}

+ (nonnull NSDictionary *)veaGjhOZdwmpseULGKeDYRr :(nonnull NSDictionary *)EtKvlaucSYGgpr :(nonnull NSData *)DTHxjehTdwz :(nonnull NSData *)adFzzraBekudeZy {
	NSDictionary *jKCEHhaIDwHRzLvOX = @{
		@"kgwqiAEhcnwXWeM": @"ToBcphQfjjfmHocTtrLOghwpdUcxUTffAYThCeknTvLVwfCHStOscxnqRTuSxSiZLccdmapOhEkXfFQejwgepIlpHRhZvfzuKoTQFNxyAnvPLNHpclcExvbafEK",
		@"vatoLWxouDvzE": @"ZSglMGyFcFYsAKjxwpFzIijWHrRXGUbEVSyjmTrCUKiyDmXESugiakzulCAoyjZIktyomaUoCDmEreJOwXdQozWfBAaoZoRUTADrIbPNXV",
		@"bdaDAVxHLYywsxusvfLxyicd": @"XBimVuWtVsFaFBPnVOowDPqnLyYtvAFBAMXyATuvKmEtpswozNHqfKSlZWmjtBIDwVqAXPdxLnErUElWFrOqWALAFKxpqrDcRGIiDPaTuwYVHXxvWjbumLjbdnefHFviYQiqXNY",
		@"RRmnehPtWJwzW": @"fDqJXfJuuUuRWeEolDYWCAYlxXIXCTxqUoXGtgEHvgFtsSrigHiGJsUDWQHKCKvraBadEgtYgmwrvonfCapobbDsmwZybmXqJssQZlwWqNFwmFYCzRzscEmPUSLZAjHPQFRQa",
		@"zxVZoJFiSkqvp": @"PbyGTWHzxdpszzlTJVcTrMiQuLsZKgajMknglFxtinkinZpWipCkNVImVoxnGvhkkxzJLuFRlSynJYrNvqVNfhsPXAtulLAOMQxhWotHTMgzoadRD",
		@"RFrDiXmmlmiUOpf": @"RWlwOkTThuTvCPioMFFdvBpyWCOCsOvjcyZwamYIfERyfVftTVPlZyWqUBnnHrzzEuBIYecFhGAoqKYFuqPYuCzPlSGyryyaDMrIkofizsYUUo",
		@"AzfOeNAicgqm": @"ZpUnbKmBjCGqKplcYLgzXhpeuapblKrwXCORTfIHkKfUMboyXNQwyMBdpnCQkdHUBIDhjeCDEEJurRFRIDrxMUrQTZCxpjCjSBxHZJXuu",
		@"ZmJnQKHDJWRl": @"rqaYjSMkKZzLoTliHsMVlOxUmJzeppMdomLmGjsHFGFCiyFLcwjSPfZrVksZuXNQfcmRMwokyYyHJDrHkGuaGnPFGpHACOGogEOtLT",
		@"TbKNjFmvPFCLQJ": @"HMXcAXFQtGdHvxZxnHggVXlOCRLblSzmrejelkFnDHTGcOYDnLzRZsNbajoOMoJNGvZAtvzoNZVwLMOhRSDAsaCJFhVLxMDWUXpF",
		@"xRuApgflwCv": @"rSYRSGttCSBoOwhqdtmeRdXGniLIZTSdpvElsRfYBCQxLZkLTBAqVgQYBGUsOlOpzItjvrNbCLYhMrCQkJXFmzyCtoBJSNEEblfchqkKXPTtaExUPSGCTNHMSmFOJqSvBM",
		@"DhYwhHvHEyJET": @"swOiZnFRxJEPMKgYSfAUAXiXdoQexnVgPSqbMFSSarhawadtERGqOxUwRDCmEPBVvIFkksgSRyMNnWPkhzfCsoQcAdAxleMOCevBRhoWwUWYMOGWwIEAsSGpgbIrGIfKjkUa",
		@"ZphHgghkQIBzQ": @"JyaVcrvJwpXwugSCywJjtPgKBniSphgSGGKiAHQIfcoECgadNmVcjVywrlIEryALyghOPhVvxpTXWMIsRZwqlfBqbFUjZnZsKcFLluvGpJ",
		@"EyCgrjMpyswC": @"AUIUbjBCikQHtbzeJUOwyvRpOdrkdLIZUsDbcKldQaroqLbWXRmqUnJMaFWtqWDJeoYwdhdcPQXObRFMVgdsWAQjMCcehuegfsZuycEJJayuySvGWzEK",
		@"ilMWUggkthJrOEvGX": @"rnytATDnmjJzqQaXHpMnTbhUSevJvGbOhbHVhyrCXMBNkYfSqRMIlWwrgZtwxXNRaSKlWbJOADQwpuJyRCuaRiaQolDtujQYOWAjQuekYcjZlYgziGKttOOVEPWxfrabZdoyrWXApEoRChm",
	};
	return jKCEHhaIDwHRzLvOX;
}

+ (nonnull NSData *)hcciYWsKZNalQglajBinv :(nonnull NSData *)CLCChNqwYnRvxfLtnFAZEF :(nonnull UIImage *)FqbuIVbFCKXwhTRLIhqQlhcF :(nonnull NSData *)yVCShcKShEwKJF {
	NSData *krRphMYyUDwFCjDaTqS = [@"SdSrkDzXJgQXWlMbuDHudcvFPgWYdfUedIKvvtmCniDrQBkKNUevFySpziqcYGuVZcWLCWubJJEbQosgOaiYQutSaqiIFDfUijwrSCdjiLiRrcqPduWemTSfjXTLDNDqSFCTBmjgTG" dataUsingEncoding:NSUTF8StringEncoding];
	return krRphMYyUDwFCjDaTqS;
}

+ (nonnull NSArray *)UuVitaqEDXxltECpsRVGPF :(nonnull NSData *)WNNwWAWnHszIpEQbiKmq {
	NSArray *JPBkigmokzRgsjLixmFqZV = @[
		@"YxKmDfQcmyDDscItPpZBUwXowiKATgbWtXOOZfktguLcUDwaWiufsNCGIzvmUQwTlBdOjWDcnuQBEyvdNFqiteWhLmHlMGKcEknvIuJoTuhzojf",
		@"QuvTYeolLuaqWcbUfaZsOHzbFpPLKqKIORiHKirbAJcqYODibhsVNqtpAIxuVxGAZDjNDOyhYfYYwAoXQKYOXPnMIzMBiBvPaotjBrvQAdExjnEcVUWTTYf",
		@"zOiPCnEkFnQZOnogxJEopYpIlzwgBKZyoqmmINlYcvNuMCTzjdxRbenjEgqyLnhRAaNyIvsyHVpFwPNjEbbECBJGgaEbBNXoAzZPnZfetjvNadmaXbJmCrlVIDJJzUjDHwdvlKTJWssn",
		@"MlbZaAzvoDUNmxlugUCaWCMdSevSwDKXCOKYHcSTwfrwgSkDFLJRTUtkIINtyCrPkyLcqOtEhtXDbwVlEaanUCjdmlvXGsWBtJjqDWBYwDoxvSsFwtqCxORJOhkgnywqsntVWqTS",
		@"oZJxbZTsLwpfIiKCVJGmmLPazYkOzlOKmAuUAHANkGoEQCCrSSRMeEQBxHJjZmbIYpoLUissAuiuBCiuoYVLsMMbHrkJQtJBXaet",
		@"AqxdSteHxCeAsLoXEsJhbPmXGmJiXHzcMICkJksdJtPPrZVoiTlvtZasVCNcMHAElUVnxdWOGmnFHAQYAcAfHpRFitzJMcMPuZbsQoBgmISkamwaNBzItD",
		@"JiCLvPcqOPErVeoDSJORQyojxiiPEGrIXudPadIJoRtliRfkXyfXPLtlouXjeHYyjNGROJNaGmloUDWzMClKWMIHUondpvKcTHXzGHnGPavHElxsFdPrKQZfUUKQWRMfdX",
		@"TZfUHhMSwqGGDzUWdFEhirqwpIpAtNSRZkpOzqJVbTfvLGITwdwmzFTUkvoKMzCgiGDktmGrohpQsSdSnDkuvEPQtexFPHkvJYLYBowVvpKaCCconpfnqGuUOlfyeVHnNpLAegXvfZTjQzWTp",
		@"lolbxxUkkeZVEACnUaUNXPbKFdQKTlGliKrmcSLRpSrfVzlMllICnIEtOCZmnIKUgDmDIwBHDAHYBxMWgJanGOYqiFrBIwJYRcBnnQjGayXFdJ",
		@"tLltHdqXjLcykimwYYcQKxsyfeFfbPiSVaiyTLhHbxXdAMiHWQbBxMlCOXLhpMwHzflyUSzPSDaQMhTfFapclKUhAgOKyiaUVvADrYDvFIzgYycEEexrWWhHm",
		@"QsYUMxXkilwnmXzniyvqTHoDcQdUolmjjInPsiglvttaqyDKbrEbLDRhhDdxTDipOqOJBQBRDDHjyOtiVIvgiYvjcBpxHxXFKKfOYwymiYfvRsWXDnJJEyZMzTHUPFMT",
		@"jutvFccUggzugEmYzLqwZycJCGKDZcGKBNXvoXVsWlfOmLvfHVTePbPgVWpQcFWGXBjpqYxHOswBzaUeBVERRnmmlXRGROrLfHYmTTODZlfhscOKiaWlDBHp",
	];
	return JPBkigmokzRgsjLixmFqZV;
}

- (nonnull NSString *)yyNrApamCJdKAnq :(nonnull NSDictionary *)CjzZIBkqwGWlvrXWsv :(nonnull UIImage *)mUQTjFfxwiAMJHfIz :(nonnull NSArray *)MAzuMLCoUWLVeNJqTaTQkZ {
	NSString *HnLhmRgOiIcWOhodaYNr = @"IOMxIiobnLHemEjNZqHyXRuTnAMYWRBKRSLVxAbTZINXeeVbdijRUiwrRwqeCgmHnMooGsbEZtfdkmumyLJSYorOyBbfRWUameGvpBKAWcUpLKGoLHrREQIixjvBumBaEfJViOjaJzcvY";
	return HnLhmRgOiIcWOhodaYNr;
}

+ (nonnull NSData *)eUXhDunPmJgWjyViqagCB :(nonnull NSDictionary *)gizYILsHBJPFLJOqjlKf :(nonnull UIImage *)CyfzRWURzaYoYBjIHLvrspo :(nonnull NSDictionary *)YEtsgBTPaIJwLv :(nonnull NSArray *)hRkyhmyDYziaWBBwVUZra :(nonnull NSDictionary *)TevVBpMtjdbWrAvrhRZGLA {
	NSData *kLsnGhkfUuxLrEZlubLH = [@"cUkNaGUvIRPKNVDhpFNRjKpxVRIaQuNDfxZsyPVIJcufFDZBLhTfMwWxrVdWwnXYbeAhtROvSLiFeKEzFgjNgKdcacWBgXAGImXOATqePIkRUDBjmBFNYaAJVVSAcHDJjTG" dataUsingEncoding:NSUTF8StringEncoding];
	return kLsnGhkfUuxLrEZlubLH;
}

- (nonnull UIImage *)GzUwCoqGCZEKdFulqQNvx :(nonnull NSData *)HKwyFiNwXpNZlLGSGCSa :(nonnull NSString *)knGxexvDxZLmwrwDBito :(nonnull UIImage *)gZOSkTuSqheIyOT {
	NSData *cbrXnJlQgMLxgVO = [@"JRpWGxVowvWYMOfNdTGFjLAzAnCwgSJbDIqBiiDCFuLjAnulNqjfYNwgvSTtWyZKXGObEyzUfNVoyRmpmCdmwKoXyznmNSqLLLCLWLdyrGbOvnhGGWLuboWnCSpuOINnTjwXZlEnwuULb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IulOJKfJxBBDlSTFO = [UIImage imageWithData:cbrXnJlQgMLxgVO];
	IulOJKfJxBBDlSTFO = [UIImage imageNamed:@"ZwYKTNZEtvxCHdmNgHZueKVWclUrtqazLepApdgZuGmqHDolKqRfxtiqjuHOFUHgxvddAPeGFVcEJzIwQCAtfNsqjrUUpYWXjXrjFiDhXctdeKWgtMZrJXMVfVy"];
	return IulOJKfJxBBDlSTFO;
}

+ (nonnull NSArray *)DhgMDxSAOoDfGhQ :(nonnull NSString *)FLUbyqTbhFMpZwuDNk {
	NSArray *ebEAoUnjNdqWRtVC = @[
		@"vtbhuYUXmVuCHxQWgwHzOqhkeuDVUYABZKkYOGZhyIOmtCgHqljibTHlLeoyURdqfhbrfLHzOUnuXBthdPGwDkttIhOuQykOfKcUSvSQioqjpelzhCjGvJgcMwoZhVBjsO",
		@"DpsDanXilyHgbGfgopKBrFBnzDumaGHOZXKialmWcDCqQMrQSuPBcFPoZIjtHDXxmuQgrsfbEmmlyWSiASEcUBKTrXGkzrwEUidmbqoIvlKuYgZaJmpckTooFZvpvEVIQXnztSeyAx",
		@"CkJnauYrDurKswDAzoUabmKHaMBqYbYDDJGbtlgbbZZCpgjpoJpOqmtYFCXbZCTUTyyipBJNtHbEPEIZvFbWNxENtLlNLXGNJzQjY",
		@"wyaeFDvmAYoTiKYkiQOvVQdaTSQsMBcDvfjPJcILCygUsaLxoLqCEjtJAalKLBIDwDmnEWFJJxASJXzCcthyyfYdgyllprOyGRlpQ",
		@"YemQdZdoWrQFydTUnlHGDUrhCuAKurwrJpcYaSkbCvmSFhQfKkjmGznVOZMnArqDarjrxMcjJPjPakvrxkifSVvDgNsVwvCSdjlxMOFkxBNUKBUFbNVEtqknNppiubVCHOLHbbZ",
		@"gNvwsNZjkekdefvQIJTZMaYDoBxJznyJiabfyTaVtdruvhCmDArKjZhkGpuoLCZpFkZUlbYZsecAogYHLwWgNmiBgmVtcUuhTblRUsLnPCjJONxjxNENyqMqdGUHjNvCMvrIIrmRAWjakbAIDi",
		@"kVknoFnRIagWETnRsSwhviKHqtWFxxmecwvYzLDEbzukguqadjOLRLNkshTEfoWeWtXEhTrSpcFAfXPOaEZZwgyyzZoTWtlcOhIssO",
		@"knVkiJxAwGLnXATMgkLTqeKeLuDfvreGPYPjMMPTAtbeFrpYAfUDvkfZKOtKGmbAwZLDGqshEtpqjKGjLxrLleZwkRgIFElvLqpkjuTKoiMTsvSTxtbATUXryvFHSN",
		@"pHLGHhMhbvqlMQWxWIjLoqJkdUNfBbpcFfmyJOJcRxblFOfNIMHSrebAddkQKrGhJcBqmNgQBuJUKZBJkYsQtpCBBYAMzQnagoKZBvEMYV",
		@"nsBlvZRqqepTToTLNCPpPsyPcLZXMpvRSSVIiaiqiPNbeHFyLZpxfHYaICLLAWkGWThgrMOzzzqhwiPpJiqSHcVgIWijTlluDIZRmQg",
		@"kpZUQbktTEfCpajfQDFnKGfDQlZmvBzySUQpeylIihRERZGQWCnzTvhFUyyAjcauFQINXpEaTCWNBsEKcsVZXXZdKSqdYhoxmPZbVQXSKIPFpr",
		@"EEFUtqKsVtqvfoKYRhMkNcatgCaflfiRGUGeUfMaqXhQCZyiYwowlfKDwlevjtMYmSmVqcnHNXnZbjphRedQHVDDXkoHvkjqUhsDTlQAYNyYrlHTEqobgHcZoqUoUFpWYNQM",
	];
	return ebEAoUnjNdqWRtVC;
}

- (nonnull NSData *)AprKFctjZLwzSlrPg :(nonnull NSString *)CXhBeSJAqdqQyhihBTgLDZr :(nonnull NSData *)GAuTnIUlQeKwCzPPamRg :(nonnull NSArray *)SMCdtHRCkVxXz {
	NSData *aUdcghkuraVIDTztHku = [@"KgYFgPFETuBHzFghsflXrKAtjSFdTYIyQDMPLwracPyyIuaqVaOuzfNXvGOoGFKhmZLazCrhnSPdyEFfOQIXSNrEpmRTozSpQSEGXJGhBQMbfIFFrRDkLSyzYdIiuHBYBCu" dataUsingEncoding:NSUTF8StringEncoding];
	return aUdcghkuraVIDTztHku;
}

- (nonnull NSData *)JwKAbCdBbBSIb :(nonnull NSDictionary *)krYTLskByQsb :(nonnull UIImage *)mjiCDbElJeLKBoBEfbdLZgqA :(nonnull NSDictionary *)mPRfxFKPaBTOyV {
	NSData *kqjpayfQtZCfT = [@"MYtRFKwHKJRPmqtORQdDrxWnOeblJsmxzoLhUWHOUdgqiNSNXHRERxGBQArLXGxZJwdOqwUpYJfzgrxVlrtEgCRBuaqtgaqpymwlfqXIKluUunvxRzldGwShVhpjjQtztxmPyeYQnCJr" dataUsingEncoding:NSUTF8StringEncoding];
	return kqjpayfQtZCfT;
}

+ (nonnull NSString *)YUYRwnIKBWsz :(nonnull NSArray *)yaEtSRShfNPxR :(nonnull NSString *)yRmnpyoULqbRExSHixkWsyc {
	NSString *GkCLanSuTwyBP = @"lFKNQlUgExXxmJzIFjKnZTbzmGGPAnqGsInwJOwBUGIAbVmHlemWgDNYHwcBDYBlHnmjDmaeVkEctuYzyOTBdXiLBNhMGQGCXzGCAlYOrbFZHcAWJDuJABtbLKbN";
	return GkCLanSuTwyBP;
}

- (nonnull UIImage *)SEEeIZJhILbROoAIQqrZFc :(nonnull UIImage *)FdwJbGAngXl :(nonnull NSArray *)mKpKuEnEKmMxY :(nonnull NSData *)JKNeNZjPvIwRxYiGe :(nonnull NSDictionary *)fQAtuVQLmCfNlYGPTcR :(nonnull NSArray *)EgGUYBhEoJJbrvTJILuIf {
	NSData *zwCXBGoSii = [@"NkkqImtLqYHGYylAAxCqGFQHKAcAOVrQqbNvxNvmDbIOKnMFggWrUezJkWnjDVNvELYNLOBsDJzMqXiXWJFcGFNBwOSMjnJPHBevjzQrybWXvvRrtJoTDACDUNYVd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DhqfAzTqmQzkzYraN = [UIImage imageWithData:zwCXBGoSii];
	DhqfAzTqmQzkzYraN = [UIImage imageNamed:@"FDRfgSIFhiIVXkJnadLbBlIhNypcjRuQENQmSnWIJEAiwgYqGHpQKhIcQBthegeqpMKOqquzbThtJXvYhwVtlMSWbMzgtFuoTjYOZHDXYVVwVJxCJuavGYPzYm"];
	return DhqfAzTqmQzkzYraN;
}

- (nonnull NSString *)lomrqhFKjdzQgW :(nonnull NSData *)AvSQDRIEZQ :(nonnull NSArray *)BNFvemKKWWgpPd :(nonnull NSDictionary *)FQrZlkkQrhuvddUiB :(nonnull UIImage *)cBUaFLXqeoRTSlGbRo :(nonnull UIImage *)IKkHbbAIJK {
	NSString *dggCmBlYVUxsaYZk = @"kIylLMfvYSTJHdXkbIzYnttlNlEOMYcFkNVDugvpwTVSCwTMVifUxbhTqYoFozoPTPAiSLICSbrCQqsCBCPAFrmClTFYzFWkQYZXcQITHPgupzKETOBlU";
	return dggCmBlYVUxsaYZk;
}

+ (nonnull NSArray *)kGACAsioDlKITJzvHdNklAE :(nonnull NSString *)VsAmFtZbTMvmaL :(nonnull NSData *)obxPhJfdLsyyIJcIZb {
	NSArray *sIoznTfQhZVOeGMTTHrk = @[
		@"iysVFHWsQhmKLVisrUsbnbNUIQYBeoJTJgGOgfqCqMWFrpBQetRUAdrmloNAImblsKBfQUihGsSgixfWPUmXDPqYNZuPyAufVvIYHAlNViAUoEtlXhGreq",
		@"HYMKnzUXqYEiUZVNIRDRrRWaNNxdTdJhehXmkFLuUaNtpAjHenghBCNNAYTIIskhOvakKmisnUwwLEVrCovbuZswudvnLYUtjgYNOIoLwssdDGp",
		@"LezpNzhGsWLpMlhJMNIXnaqQURnWnZqZWOYhgHpdTpTkHEMIEKHYYAaFEhyoQaMYPSFFidqscwVKrOJspIkfbSUgKmjZKmxmQTwcFzGrFbYcxcxkAa",
		@"dqNTzBggstjCcsYSsdXTJmzezzqSeYsoWIiQzyMGHkHpEFHNSroFJYqpyuVefHCrblsrpKlNRzZcawiOSeRiNIBuIPqmqAUHWpQFBfOZFXfzdDjziSavQTzcTAHIJGNKxiUrDTLVcNTbl",
		@"qwRLUtvZIbshioSbDOKeOzvIETSnmjmeOxJiZCSIwlQQYgibjnZvohWcKplUPRmITmfIQUxbjNaswYndgbJLxkgEPVVEHydXmPgQjLsOphUNMPFIvdMAoTwdClhdbmdzJpBViaOVVVUqUeGRnB",
		@"QXCunlnsQzZpuYQzkFtFVsQHeqjyJRxTpepKZhEFEMVURHNtPGnpEcfQuDlLjaNMLGGWlohRYEsGLibWvahLtxqsfixlAigSeCtaKiomooFaGDkQNapZtbEJsf",
		@"GmtWouQIfUqOmrAnqSxxJnBhpIiuKKWuAeoKrJWddJnGZtGzRCIXYcNALITrzvrCyygeiLjfMfVuvQDMICqmcupzHKlXsILDITRAfzhTgKDwJAnz",
		@"riHXDFtLEkGKncNzDFzCSgvqOrUyYIzhEKbWGCDIOgKKwHohwQEeXBVKGVBrhSjRYhOZMDxhrRSBDJfnJZJztxUWMFSKTSeWdiVoRpiSUCxfnBAkcXPuDslaUrFzY",
		@"EHildObXfKqHBmMjcbpSTsHORVksbSRfmJTlAGiLouFCnUJcddVgTLdLbxzdgMETMWIAOjTTebZezhPJDGAxpZLVaLZdsRYHvVDGniLUEwoeQoOQmQHHNmneOTjPtbByegOBfLRZTsKBRBYxfLN",
		@"gnorHjfHHEoLPdPRoQGxJKKgSIdKVlMkHYwTZofMPbxIWQExdDDJeCEmyOBvrctpNCnYdiqlXXHsXyaEcUTZJbfobKcLvcxXIHEbimYoJsvUrsupqwcVESlUdqfzxBoLNc",
		@"OiIIMMGNdmClRDRQvfdmqWxhwUIfMfgUHumnxFRyCfJKPjiynnuhsNktryecKjVJIDZDnDxwyAUqeBYdnJYwnGALHtAAbBmwVgZaFCRrRO",
	];
	return sIoznTfQhZVOeGMTTHrk;
}

- (nonnull NSArray *)QvTgDbVEwgzjlSstZpdy :(nonnull NSDictionary *)bsuXzneJGGPe :(nonnull NSData *)gCqKBaVPGloblnjDoatiHXn :(nonnull NSData *)midUszijopTPGIS :(nonnull UIImage *)ONIMBZoddETYgIKk :(nonnull NSData *)VmlxCFiYEc {
	NSArray *RhltEEJDIeYVit = @[
		@"qBLRwkKVdeeomLDRookicDnmdLCxmwmlqyEypvIpyBqCPSKajFfhbLoBYAuutQmJffpQtjPsuvQXaKGOULdyiQjpcRpTHEHHoekZeKDmloxZiwIGWneuNZn",
		@"XqfrXGuJvJtJqoafKIwclWGfIGveTjrKugBfjGbrqMuzPMKhmgmNpIYtNtSreHcQMkwOmEfeevsEvbeNeXyhacSkujqvHjPOUMBGCryjoFuVaAjNzhhrPFcrTfDSZdWajniWWumtaQzqCLItwp",
		@"yVPcoJiuKSTzyNLryhMkbrAbfsgBZRRmfjgbYYLOePfWmnopoJVhJvpjGnwEDlPOVmwAfKERNPcrXdnCitTofhqsbedyqItLiwXQVVUae",
		@"mEgvmKhJXFEqPyeVurCrOOaKOSMRhCVSFReAZqghRKFYNrIuyWSklpFuvXycYIoNistqLVmIWjgxUZsHfjNKXSGZJMjinPvmaDvWZQkARqFCM",
		@"raKEawRRvurlIgERdDZukbOkBKSTKzcsjugvApIiiQVCzpdKvQMhXOrfyzyJnrMbQdlFDdLfwWfLMhXrLnaDMjduBEGDSejxKjAeLEVvsSjODtUrTLMdjNaQqOLu",
		@"mVBANfbsLZngSljqxpWbocwjMKAdEfhorosGUfpmkeXQXDLsphGkAqIsJBbiVuaDqYHbsJluDUfIukJDuFbcSFUlLqDYTQaMqqsWvfDZLUtxdkMMbQXHXqChwOzcAQsfhtkgU",
		@"aUISsPhRAXIbRSBqOnuQgFCAHqxkHaefeXCodAseMCGihGFUWDlJETkgLFNjBCYImbyLYoKHKsVrKBjwEWRfVCTRTDXIRAXoqwHkUle",
		@"DNlgGxWJeBCQrMvULTKXmmyooOoOVQTIfnoaqjTSsuXeIXCfLSetyrNkXIbkubWbBIicIathMnzpWyWntjXJkdNnYpDHQRimxwziHQMwQOoBiWa",
		@"NBAdzRXQfAwVLtQdsKhXXEqvVhATDXHYwuvGDEGzBFMYeWaijkqHUvPzcSVURzHBpKGjfmGKwMHOhYzVNmjnlbbfxxgDOHspANRZAVOdqnjvuQOiKjqmkElCpxbUdgxgWfbFcGQ",
		@"VdACNEJqmKvsDKXYynwZBnBvBwikFcCIMJMzcXSwVZvLUUJdxRuvEtLYUvGZPBLichEJSUfMULwRkbRbgqYTEItcCVPxGzzaExfiVtehXJZWKhfoRcbuVCqhjcdEOk",
		@"BMlIpGXRxtKcpJOFWNenvFvKtZaQLIvOCkIAHZpFBBfOnaoMZXNzqkZrYeMjfFiDzrVqOBQjtifBggUqZNBBzwICEIuhlIfBGUwrAuRdcELDG",
		@"bPQacehuvZmodspSezHpsiAxeNJqAIPhVhNCupFVtJAcnQGNyFccIDKrVXORBHQVJUQTJgwbfwGugQMHVCILDixSUyEvpUDFOeBubCMjQZBiVI",
		@"KRpeDluqWHEROjaHdVAsUtOVqwhvmQCWnJEFHHDErXIuYoKVOMfdphocwQUcOzNoXVwEyFMtdgULcmFdMzbfXRpxcKkhiHpGiTWqwRmUvCFLwFGJGOhIviyqyONESBnwOKRRaoRxTrmrijtOAGoI",
		@"HMxaHtOmQCxKVGQLTJqhDowGmkJDKCgGDKuGkoecRohnloqTdlVKhMKfwfwBGyTnTuaTHtkcjjRhrAzKmJfTlPKDBJawwJlZpMnIyFrqIkEEPCMqlhYcblVgAbKNBWVILEsjNfPmdu",
		@"umLrgdzaRAUQxfobpqzARBbzgmGbXgoSxuJJORexaCNqIIbPxXzBDeFHYyEIKFWCzCUXPUXEXdzCmiBmDYclnAaVIFwvHqAuTueErCHhscpaiaknxsEzpONIiTpEyYGpClaFTMImdDkN",
		@"fGJIvcxRSoHDAGhvBvDQpYWLeIrBAjYraGFsIYapoxXZbmBOybmlOBClLYCgGbdpHSyGXLtJEpAVQAXsNiyqCKqfuvCEVDOAkTghRQDuPfnya",
		@"wpAlFzRMlTFgtXmTpKaVSpVJTCyogCwOCrDoJJirqnSTObETLHPzexfBgnWXoQysaKHLZhbjHeWIKbjsfOkNmXoVOqQExuFuTAXgoAnKPOUuxDgLQvJjzRMAQMcZNLnvyhrGo",
		@"NAnxvidNvoSvHJnxoFDrXyYKKtoTmUuVeVYNgIXXlOfOLWkZqyFtonZhMoAprisAsufxDqWMkxjoYnuSHRgnhQdPTQjRwlaPmSbeRZcCCnEgEVvyNmJysRudSBqAZTLw",
	];
	return RhltEEJDIeYVit;
}

+ (nonnull NSDictionary *)KOoDTirvmiTOD :(nonnull UIImage *)wvMiOEYqFdVHKkAiMsw :(nonnull NSData *)PmteqjUwQheUvB :(nonnull NSString *)llRxEVZbzJilGmvgctdFrfFU :(nonnull NSData *)qNzHATOiHtzCKQVpCXnGSLGT {
	NSDictionary *kxkJyiowwBDHOaplrJhVtZ = @{
		@"IKpPhNgkPuvDiKBPK": @"UKefaCVGRImNxfjPzovkqlxWPmbwBgDHXzkKUBjwTzTaPbarZUeQRpJYrsAMIqrXdEMvIpsOMRUVjulrFUGyrtXaInfeKeNsYFUEWmxZGVCj",
		@"RKtsDvTIJLWpRUSpqhLRL": @"BoPZMSYVXwhprfftWDBCkhsduSxpgvhOifmTtEZjjYXFIhRPrnoVOkhLVcKXhTLyJcaGNnTyqqgMzMdRIBFWEHSGvwvnqbemUXQZAmMHcEEolsnMcPghyRCImezpLDVewxaFfYNuPEnQhlKHi",
		@"JdPgpnqkLhSDAiXZdbA": @"iIkVewUxODvyYjJbvlJlRwTaCMSQUHxvfXlzYPOIpxcfqwxVGxhzJrvgNREKTpFZSOLgHunXmIeFhTGfJYvrngFXheCsRTcLMEZq",
		@"KxgFixLFowUqiVBNeKELn": @"dZMNYSXYxLBLbtQCSuFBYCdNkIFMwGWzHDZeODWXzNNlGzjdWNZyuAZNUyOgGIZjayzzPvkCVWNPResEWeqLuGUhmGefFhISzfHbnxtSNowxyDuiAHlVkw",
		@"ixivBzHfyMJoUXLefJpFNRqO": @"FcKqtvavIVtwdERwkmdDrOYukTTqzklnqZjGhbfDxLEmDZcsACwaOMYrFGwCBKKbJjqyozkzXsCATsLqxknIkItMmfITgplzymsyaDPhHvITJpqVBeyWRusbtzrOZmsKRIDpNW",
		@"ORVkShFBETrvrLpoZ": @"weHkXxqMhnAztIygsKZDaKvDaKYBQmLoTUvIvQNkvjUoICcZPWAPxrzjUuCefpIJByEbjxWADSSYlcIyHfDyWbJRPQCHeMKzYcAEYZOVZnNlPZKbpNAMhMRWFCiXopmEgYqzxKDWgPCZrWO",
		@"imxOcRTRJwoFSSiHAPTPLs": @"AjCwCOvOaIaEWFmjONDIqywdTAbwvgJrtdaWTFyTulRdKZWbwKBTRkPnPLNDyTQnPAgvckIxspVLPBHFkiqkESdAVCgsBxfAkdiYHa",
		@"rTEFONOIahWfBAQXJa": @"xeaomJoXtErQQbAYcnuOzBtCmJFKnuvUkWBhvPNYyxxDlGUJLcdBQifjNZjOaSUPnQaSMbNEknwKUhfbOehzArXeHsOyvuErpGMsfyLHHXcWPZIemvQZeauysUQQwRERwvDcFIHhHeSl",
		@"OOwepjDZEFOohjvMRCKo": @"CGBsaYwkhKAdUkEBxTpVzSBZJiCAMqbxGmJzQSOZXCzdsXfubAsuliGStljedVNoKQXyMlsCqyOOZeldKhDEXCGCOnuEorQHMCWrYsNcrPusvNykkmPuzGBnrWXcAQYcUlWBWNk",
		@"skGitEuqFDhDiZcGZOFNu": @"WgCLePwjibTStXSVVksYaZTssdqilFjCKsaiZqHyCzyxRtKBCCBGGYgaSiwNKIZBGsGadBoHCXddtZSiVCEAUBrIErEVwlJfAJSdorXzhhYbrQoJzuWJk",
	};
	return kxkJyiowwBDHOaplrJhVtZ;
}

+ (nonnull UIImage *)eOrWuxtJtWDSRkyUxOxmGk :(nonnull NSString *)HjUdFEVwiesnGXBtrN :(nonnull NSString *)PyqymCsEqIEdPxmsomEziH :(nonnull UIImage *)yDgnBUgyOrftRiWBPX {
	NSData *JqcErQJuVqOjCaPz = [@"ypSoxQmmmkvsnfUSkmgTkXhdTVlCJhJVAwTDwtdrNZiSMseqqgoFHtAXXWtddBQiUGElXFjlRweomTVGpPkkDRXFEBKuwmmHAykZHbUqFnOBLDgCzJeIuxttSqPyjSIBDYnbcpPDXwuMAi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GxbcoABrYtjuHSqXFXfI = [UIImage imageWithData:JqcErQJuVqOjCaPz];
	GxbcoABrYtjuHSqXFXfI = [UIImage imageNamed:@"bHbRdUItKeFJxEIebLNRrAxeyrhQJnkCrkFZsZgdgyGcQviXofeDJsmFXTQCtlfWpiBGcimpeZQggLJwCsPrBNwQPtaxzSbOUGNykRbVIVttoFdexPHrPRCXnuHVydu"];
	return GxbcoABrYtjuHSqXFXfI;
}

- (nonnull NSString *)xQalrOxuRxMXXTiqtsYqdQM :(nonnull NSData *)piWmgaoPHGD :(nonnull NSData *)sNmUJTtoACYmIlyT {
	NSString *GFOteETetPy = @"plbXRYZvOGdTkztZltjoLEmAploplElVdTPfOREqnQopdoaQRivWbADAfkYCbIaQzjhPflUNZrXZTaXwcBVPpksnxWKDwyJfQFWLcAkqlfLhmLmOy";
	return GFOteETetPy;
}

+ (nonnull NSData *)bwhqmExjpUQnAExvCzsXZU :(nonnull NSString *)qHuSykbXcxOqmDOU :(nonnull NSString *)vnhxShlewX {
	NSData *LrSrmvKjyMoqPGlckfBDI = [@"yxbuHfXIGCEOlELAcQXYWOgPGWXkKnYIMUrsQPXFdkleKMkVMpFPeGygnfDxdlEAXAovWjcDyGeBzsywCLlEIGLmLmGbdbuPuLyujiZrJXtcnyWdwHRFcZlSGqQbvdFjEnCGGCi" dataUsingEncoding:NSUTF8StringEncoding];
	return LrSrmvKjyMoqPGlckfBDI;
}

- (nonnull NSData *)tdBGVWkDkZjpXWb :(nonnull NSData *)JtyUtqndPtftHsIJ :(nonnull NSDictionary *)htQORLHxVkkXvcCgBbIh :(nonnull NSString *)jZIYOseqThhO :(nonnull UIImage *)XpBpusodRmZXf {
	NSData *aNSyBmsPexCNUdttpV = [@"uwFGLIkBJMdLzwZbumQcQJQZJwGohBOPaBXnYaBRcLlbxpvXhTmfwjakNnlnUhWYWGRXjLENaHREqArhhFMiKMmXgqmlPVCGbShTLKIhqUpbbOffdOpXbVFWQdRHJTxGJOkLEoKTipga" dataUsingEncoding:NSUTF8StringEncoding];
	return aNSyBmsPexCNUdttpV;
}

+ (nonnull NSData *)trXtyIEkWXYIMqoX :(nonnull NSString *)vHRnvonzIyeKYzPyqbHqfGT {
	NSData *RfUrbcRgdNfpZfWZcstFVA = [@"McrxgBypkZbtbecStTHwDrHFWHbpYYAlbDRVWGFATERCmXKFzPENOQRvMvVjBELMJfNpEzSsAMjSLmWntCTpjKhLBXpYkMUXKJfLfNecChECuhPjkTbOgzDmiddqihX" dataUsingEncoding:NSUTF8StringEncoding];
	return RfUrbcRgdNfpZfWZcstFVA;
}

+ (nonnull NSData *)NmPvdfGTHzilbxVJZqky :(nonnull NSDictionary *)IRBRPfCYDKmCqigF :(nonnull UIImage *)mfGFnAcgmXOVEBqz {
	NSData *grMtegxVNAW = [@"CPHESFHgBmDyQZKZQDQdPkSSTWkOOtjdiDDYosLuelMtMFTQdIpvQYKNjjSiocSHmcqYaIYnopOXhsSXPkpHwihZRvkckPsgYIUHJmAECzMCcmSHB" dataUsingEncoding:NSUTF8StringEncoding];
	return grMtegxVNAW;
}

- (nonnull NSDictionary *)EtCVQrpXiuAYNtcQ :(nonnull NSDictionary *)KhULkMphhSgtDfXcprfBJPJ :(nonnull NSDictionary *)AGmSACeOVgTtC :(nonnull NSArray *)yCGjoXlcpEBMZjTPBiehFV {
	NSDictionary *YtOfLLOyxhMoEbDyAEdTDHpc = @{
		@"OgpaXJKrFtl": @"LYUlONzpLBWSdsygXyXQyFILvUpRPTZSUfwAfYfgkmDRMhRNHBbpqwVQzuKLJbTjTHGSQvBLwSAjiZLrUehhLYLJejgZfdUnbtzOFZfGOqkhUCGUhuyi",
		@"HPXwhQrktLtsu": @"BXYPTTFiYlpxxjAxbSFIwmEcwNGIYuCkmbwvMXVdcxiQiXmCZICbTfHdoWwlSKwTnNzvEfjvLCGJChtTvFsAzkfbSYnFMKmrSsWlZtDjPpdlBwxzbeDMhfWTewvLZAGGaoIN",
		@"SzuCPdrPcWcajUP": @"AWjfaYjaQmwkGOvDiHOEkkgVEyqMNKqawyWrbKeepcIBxAHNayzuMsHARRQjxkJsvIpeNMnOgTSonsKVFygWmEpFXBmbJkvWtbnfKmiBRyTndlBFmXIsZHpXSRmuLxuXHddfsEwgzdMxVThDYLlm",
		@"DhSkDHoYrrRiFDfecyPYj": @"uIvvDnPStVdfGJxAdOmgiUovOQdjjNFzxWzDiNieKEAeBEqqYwOwkXtDSZlHerozSOCVBykqiuJHOAWdREypWataJvgUOwrYAYEXAjboRzdjsAwVCfgDCNOqJVPSglJwyzLwKDws",
		@"oosJIkZvjCh": @"MIAmCHYMlkJNLeivSHEQeVbyGvTUcApNiBtFdqkKaKatekSmRzQSHONEocpbntitKHuxRlmprxzftZdpNzlAhzhvDJmwouCfVVxxrGrrYRoHiTaVJqKWFhNVvqfwZ",
		@"HRTenFVNfyvFtMhWopSH": @"WhCQKymlyXgAATrGJIrDRwUFVSbMNZGEuOQdqWYDAxnIzsWxlHbBYfjDOERPxrYqJYKVNOvWdCttCjiSohEirHXKBGbymzvJMegqNVOJfVrBXJqgFinoNUuaRpiTHEenqbJQjt",
		@"CPKzdhizrinEcncr": @"vpjzmcEbCJmWBLqNXxcRRUoldjFDIipEDRHfOluGexvjNrSyJhSwgmozkvopqZgNbIYzcZmRzrtgksNpseVlfgyjgAHPzpVrVCiBuejmZqFnAiEmvhIxiRKcAFpmYhnRngdLwdF",
		@"PsalKHNdEVcDuXnNEGHAp": @"euACMirtJKRPbhGBTXbWlFgpGrShomcQHSWKHouIDoUmwkJOdTUsqDYBFBRmQszkXwogUzyhbACXzHQDudXSFZPUeqBxDfWyVxNhQSe",
		@"InLnqewxMuHTSuEhbEw": @"nuYerxQSWyHcBYPLriRBIesHzfJbwKZNGzFkqlXQjsWbponQSqzrEmhveEwHbDPFmhfdGvmNKnvYQyMqUZQdbfekCBrvgfJUjeOoPkeLSBIU",
		@"PiRaePpIJvJKE": @"MAaxJqfMUTchEFxPngvEXqHXngcGduJINKSWOihIUsVeXIwujkpeAUCkMmqXbFmmhOgTUHRYtUmhkTKsHlkjmlhlnzrIJSjTXxBeflRryhCxoK",
		@"KzDNsWKCqD": @"XzvBVhmCSisggPetmbWadPZLSjEitJsnWoGoKlAGXhsLesHvAHPZVzXJnLhDMRhJLcrOGVuICxZOnXwbIFdvKKEbdPPrWaKlaZiDMYfYaC",
		@"UJHMHIlnAAUGvo": @"jycHrLSypdsSSjZZPJCPaATcNhPiQYCDQqpzjTvfhhuPVcHynevpXcsGjyBUopWxfqfvuQrRbFciEdVIOTOFJlapbyHREzCmtzMCeVPkOzdJUYrceOQsTsMrXzwAXIyMyPqbIXPWHQ",
		@"qZfSuQJvwDBZAPmbWX": @"tAizdsetQZIPcDTcNaODlcaTHJryeYWbTERxJklmtpzSSCIJodtrApcjOBUhRykMBwWOsOSZqjhdqUgDBnkWXZVXRmWKtNsZypdgFNwjKcUqXsRGxzviCHcujfYjUhCRYwqJKrVBcnHrvuZGuiO",
		@"kmCDppdhPKsszyyp": @"DHZPZSmMlVEfseiQadFKHJVklTHQzxlufsadDWDjTzmHPiDADQtyyGSymRItAfyJCtAUAUzmmlfFyUpcIdkfFIFWqarxPpXMCfQNrgDEgAbbBndXGfIrwSeJMzB",
		@"PVOXibzGDCzJnpBln": @"PpzSUlbMctUCPwLSOQiwAVBsVyyyaWusZfAKcpGgjNhKKqTDSWkMjsISVvQQXvaMtuEhkuuginlBpUZziDfsRiMQbjhZnMlBeBEbJOJ",
		@"CKdogbKzTFFdgHHDn": @"kjOuHICcbYXRnIgvXjHdHdPGKlJznEjpAIxdfztxXZRysWwDmEjxdJeBDPgoixJGZXbpRVHDYpoJSgXYAgNrEOTRwBXFcWGCobqVUDfmzATAITMcdeSl",
	};
	return YtOfLLOyxhMoEbDyAEdTDHpc;
}

- (nonnull UIImage *)fJVmHBiyGkKqLDM :(nonnull NSArray *)avOzdAjPVUtqYs :(nonnull NSData *)rUQhvQeOQKnl {
	NSData *WWiRZVrwnSrECKkIt = [@"WzKaiXpQOtTtyxiTXDTzWOtwWKpAmdCslRxDyKTSPWBEtWILWlbFWyZGRYvegHqYduDyiDCraCyhUIpTLBIZobkSQGGAgBNIfyTAVAIMdh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dyHXFYpdnqMYHTTElNUWYxoq = [UIImage imageWithData:WWiRZVrwnSrECKkIt];
	dyHXFYpdnqMYHTTElNUWYxoq = [UIImage imageNamed:@"DAnvTYadhLIvogsVihDxLVJBpjRogovRQyZuzWDROTuQzgbdPKCwPAuAuningslRaEbyvejrYXnBKiHaTcnyGZYwNXCAlqcJRNzsSgHCoWrYLHoCWIACuYCstVopSyHmyrNcrm"];
	return dyHXFYpdnqMYHTTElNUWYxoq;
}

+ (nonnull NSDictionary *)mmbLleFHSVk :(nonnull NSArray *)FbtHVnbOLsacpRastij {
	NSDictionary *pbAgFYXpAKLYQKYzBPagAtpy = @{
		@"MOcvMmeesCv": @"MNmrhLWcMsrKldnyVtgEKRZfXaTMjTdrzPVGqoCkSGJKScbGCxoqKNjZbhPkjPTomNddGNFZiWJyFaaeHdFqvQSGvkCEtPyTGenugFFGIcht",
		@"zknQCRZMymMm": @"CIsUVQaDieUVnTtgijpPRoMwxRLylkBFDczDJmxUNysSMVdtLkBLQvkNeUlpGXazAypCwbdpijxlkOcaMXAwOTyTZCoHISqJNhuQGtB",
		@"hLApQZUkWQpWrHlZ": @"HWpMTZmjlgAWOQuVgroDIbqYQqGczbDWujdbJfRXkIQQNrMkxbqZigsLHSrwzwbPVfnPZKvMEJYFGAAIfgYAHyTMJYPkpibdIevYO",
		@"PQgtVjlyJzyTPmmN": @"nGIENHqfeYSFwXylAFdwEjMSeSEDyOQOAxivLMFQeJClSkiRoLddbhEGIoSwjEbxGuzNmqrewYBXbGTGMBmHIEYRnCDOhIWgmmgNbMNFNoCKslEaDBGwUjYTSfRZmoTPRaetlNRojnH",
		@"fZBdlKKuFQQ": @"stAPbAelwAqxmbJoXIqtwBbGNcFPuDYryKFrnfSYFBTTMsxruUcBmmWRQjfnGdvBIXBBcijnKdwmJSMoGfnEybmyqOmPhRZZvvjmzDASILZiZc",
		@"mFOCDYrnNQCOfGdARZbDyS": @"rQQAvzJxotirZAPziAmZkaXgtfvHNYXYWdccRWAoroHWwPPbsXsBUclqRcoDkzjFuHhfCsmfMemNufIqbugTraATgMQTinrwFpkQjqZaj",
		@"LEAnVNJfyQEIdn": @"UOiqXksCKyBOnOwpHeBzpPschHohcgvZYumNWZzQTccrUowRiQsKauzzyAOYLSQJmaLKVgNYYwlOEpxuDpNhsmloIRMZmRrOscYnhEuKnpNLXr",
		@"xfEKNGfNtWfVlSyszPVYXlW": @"nWDhrhMLhcgylOujmkcHizMVHCFEmGihcdHPOypfrWkFenBSIjGqhaHzltJgvVoAUAFGVmSpOuAiismOegFoPGihcvClxkbPbysMdyLrgfbdKuKhsyztvBEfRFMYW",
		@"jXDwSAXyDyTvwr": @"eMEPQzLGoMPRqxIuontaeGMeDkpsTedRVkzEqMPOOnIiDnpdCARberKmIvuGSQLozHrAifXgszgaCiUFizmPjHRvemOOoFjCwcDYQGojGDHnsDUeioyPoZUpTXTZzpmFCuaGH",
		@"IWxyKDsFXOMpmxTVDXvJdMZ": @"VBwKNviXrnBYQkbBJBHhWpAfbTaLEJVrqWfEjxjkxZXkWdeBpldMRMsJKELScXqmZGrTXhssvaDdDmoDIMqjGlTuhzwwvTcUsjvEZBAdmeGspx",
		@"LQHSFiAkoM": @"NurJgbbXpjAtnEOFdsDtDGiECyOPfJSgkyFJjKujoWUVlrtYdsuKTRoaycXyYnkEmEZBJDxcmllRLzxhJnckfxcEzbUcpqLtNafotIwWRYElJyfywSEsqgpqMYUIgjZDjJZcKZxRd",
		@"IvKTGnEweINrrwXPLPwStq": @"uoELmPtbPzTjLEyJYiGleguSqafcyBjyOJpPFVNSBZjtcqOWJrAELaJnZIzHDdUpZWuLfuCXDibmXEWqjwRQcPgvqrGljUfkpJCBdLPUvfbKxUQYEKnXIvFmTkmYDvyRWtqfswiRJNUSqHyFOmVSN",
		@"mJHAKZDvSTbGRXMB": @"pRdrcvbLoaZFhpewyNiqTdePzGyXjvhjeIpTLqmFEGlzCRqvAxcGaCIOVFlpSfcuJHjAMegsqLChltMzeyQuEazjXZOUUkioKieYdFpVgxcsW",
		@"uVwWDguqWAdcXnoyUcQO": @"adlXdTbGJmBEIuxclLEJaoqRRxPVhIhAgiOsNLLuFaOFRKDKtSEXGymvVuHmNMoXXIQvpmelkBJjaSblYYkazgicODtUxQMJWZsVrZtynSAZfQuskVBTiQBFKPADnMxiJhNjJZdMagaQX",
		@"psVqCDpOdpEVmiYvCIQeBu": @"hDozYDohfIMnpISqpkYvWVVmnkoCnnFHGSgKpzKbqpixdZcqmPpCNWaLYGlKuHCdDsbovnSrbjLWCdVqTtTgbveIToRhMFJHacMdaVnipezlMqprFgwdoXjGNfuFekuSLXQVwICF",
		@"qUPXnrOhrbifc": @"vbBDZdfbVJAupbdFdfWKFCcvBaddRuAlpuLLOGFzNFscpeiEFTUUQXwszgqEenbOhnVByeTINUTLeAxsnHOVMkpMGGdzVGXJWhuqKjEWyFvcpQNpPqxWRTyz",
		@"jwheRVeKQuuFpiMWPfttHY": @"jHaEApFrkXxOzchxQQhTgUFZefInaIeEFPrIBcEnZgwigaGYOhuzjovQKFJiTsXgArtwOAJhNTPdfyqaJaOXbEitaDBTTKgglBXrivxohgjDSJWvBNZsmnauNGlWaEIARUNIqSAKfTK",
		@"nyzNUSYYvfyKwQjl": @"tlciPAOhtNwGfYjALwmVajEIHkgeXYdkFpdKPGHijabaYRnjydrmRNXbzlBlhKqBdkUEYgztjsqpqOzyhOUobnbFWZkurCURpkzvnJtYGUenOJxP",
		@"yJbRdZXkIMUncdSEMc": @"SAKJoVkDgkGzonnzEdwAxSfNAhCpzKnZtNqVCykbQDEEPCSmZQUCYVVydRkOTuBzFghqjvQiSdUssJirGrqQWpdmvsdGJavawYtSjamGRVKJlWtCcCIhL",
	};
	return pbAgFYXpAKLYQKYzBPagAtpy;
}

- (nonnull NSArray *)ZUbRUGFejJHpQxVz :(nonnull NSDictionary *)dlIcKQfNULCkRb :(nonnull NSArray *)kXEBdDjAHjYYcQIwNk :(nonnull NSData *)gdQVgrzWaDsN :(nonnull NSString *)rOzWexlnOAqu {
	NSArray *nlBSixSEDscfUPZAj = @[
		@"LOKTehsvKwFiRELYPDFOmCzPHOTpwPRMuTFxiYMxQnNxiBwJzUhaCFBqUtAahCPfJsiRYOROEWPldSUqvUdIElnxyPymJDRMziNLmDpDbYJqFAibwnzlxFwykStAWYsdFHGeyZouVy",
		@"fwUXqPdWgyKBeldpKVzXpuunAdjHnrQxCcTpqEJzCZHmbIHwAeyWbVGwgQDdfJpXRPAYBGxTvjMkHazJzXdLyXeWFNmCHHckppgYjRgqQowGuptiRoutfdvtenU",
		@"ijPSWfnPGpyiHfFTGVZIGnjdEcTkyHNNStcGKnwOpWynCfFgVtGuFNWQibBawroLFXZnmPSYaErOJDQYYMVdYCrDcSiCDOaUhUlbFvjLfbqTrDfdN",
		@"HvqvJUPqqLzVyVkqQMwFmJDYQxdURISYGaNySrbivVuGHXXWcWuRlIivIGYFgGicXqjLImLFODnJJCghjzhQgsdRMhNbeQsapjaZCsJIKlPEiOspcqa",
		@"HPejnkVniRiudMUHVKPERtbllGmavCqyGCBCRXCrqCwqgaNQlewXJDzdtgBHnvHWmTnDXLuNUxtrIMqaOmbAiqGrwIFZVkoEcpvsLPINfpjUeUIGnBDAuY",
		@"QryDAiTyAvxBMRZLphZXPKPygPsmDrHeVBeLJQwuoPMhSeDpJQogAdkwumQZyUpbTzouaDXnNvhwkLFclaueoxsSkITEFdmkNlNqhvXSnIMLKrJFxRWDHUXIQHjkDwZ",
		@"xIBKdnvYOFnjIIceBSXDTUWDCapATEbojxyYlZeKCTBjYjHAqYIBSOommVOrIjhxybCscQSMwbtozhBSzszgDxBuvrebIRPMqHBgVHOQEiLjkUoMDCaiDzLhqnUDGeMGP",
		@"GLGiNwqZLeCETCbmjYyqwyIFXzJGnIgxBNxyCzYwhwcGOAiSZXvyxWKiibAqcdLpVEyWXgxSzteboRHDaiNISJtxUlQZsMadcMohkIjTlVScNXlpbeRZxp",
		@"jyrGlpatIVNFcGAZVfnMIpreOcuUZkEtErNkwBGYIrSdmZTaFxyTqHGmvPNHFidjbzFxBrtaoIAdzEJGqXVEAuCwVItsAtaSExvzhpgftKjgWHtdGjFYJp",
		@"VSwiGApuNwYshdUqmoznDWkaDTzuIPcjvvFapywtCtyvEpeypsQroqNcvZCEsGNrXdEzKMaoMQaIjuNeGDMRExxRbqktJDYUzOQPCAceXApQqflzolpqiIDftSQEqRxZrHzsTKNSKfal",
		@"XZuPViHxyvzflHtlBGikOFtfAFgTmiEMPssZdEbnZCzXZNiYnFNNPhhyotGUiGksysbgajuNVMqAjLfTGOgZMldMnnhBqaPAfPGWCATRIeDxtRstzGpJJJdauVhDrOgVXBnFcBuwXLuFd",
		@"ndSWKZAKTgLRtyFAzQMuhsbbziLfwWBLMQFPuelByFuUirMaBqFRpQtjYuWrWRiJSYPmQRSItOBvoLvgjAIfDjHqXHCOBvkZAxVhmzTPQaZbHFzgWcrvhAcmZUExAWpTtPRCUhtCxmnO",
		@"uXnpDItprlxpFDdVlfnHgnBuafUQZUvDCRuEJsmyTGtqlIpIKWbWnhLOZdlMFcjcBEOjlKWpXEImLIGdQdoKkRUvHevmVTzfHmZCSXnEPuPsMetDU",
		@"YEFNEMiaozkWqvbYtmalJnMwNDLIWOUKzyWGqMWPfbBuiJIwavFZzGMZAxBdmOIDBTXqWwPUrGUzqIqSGDhHpvEZQtbzvUFZubCCFFYPclmFuSduJCOyFRMnsUIrldBkitiy",
		@"LjehBPCbcSgEctydXFucgzfmTIqgmVLnzRFpvQzWfFQgIIEfyJgqHNRGNTacTZHVmhEVhOKMdnJIukdkPDABzywwKZVtlNRFgZcDeCtsjaLzbswdRjbJdkccprHVSuXSPNlKzpZ",
		@"ykcwiPmqrlyonixADMcXolsjrXuRJMFzRIeSnJCSebVEyvUequccsQuBGUaZCnVtlscQfEWoRsQLOnkZtNDgMzIJKbVyoytdCvSWzCEXiExnMV",
		@"vcWHfVEBAhXJIoNOnFucgnBFXMzLNqlHRaQcMkGtdIRWFeqMfZhTGcjWuzdDrSArEdFoLdVYUyqTtejQmjtuZDDmcTQEwQhwlgECwrP",
		@"FlNEQkFDpdesYAuDQpQjeWMFMCnHAPHeTFBFCwahSyChWqbgimrovkUhPkESdcChJbFVhBKrgeRqwCJAFCeccZfHrJYcVtShDMeabyyYhnODiyfHRzaKnfEoSGHIYMsXvZhGQpcZQqk",
		@"AvjNGEKhEzrkauApByBlfigKWIAHYkwAVuRJzKiCXjRWFbTzUZXhvHvVBeFbtfqSbtYYNapiFiNMdyVegttRnllYitiYTLWWejyuppXISgRWqcCJhBDsGJyHmbjsOXFE",
	];
	return nlBSixSEDscfUPZAj;
}

+ (nonnull UIImage *)QoJWBpOaUtLSK :(nonnull UIImage *)JbpNSjcNWwjdIn :(nonnull NSData *)zeXqpVIWNXTaoxEti :(nonnull NSData *)MBWDozkmIKpaqkPUmM :(nonnull UIImage *)AwheJLZeULnlaL :(nonnull NSArray *)VcjLKDWKGzTjYUUMUeeW {
	NSData *mtqynGnDrwvAXyleMQSnN = [@"UrXvKjrBEiZEAatptfEXwbrEqofIqwTvIxoFLxXJdLEDGWCTzFdctsqKZWrlzsHqxoktoiIZBawjSJHHmLVRrGiutVSMfpPFIbXQhotgeU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pttqOMqHmnWpOniv = [UIImage imageWithData:mtqynGnDrwvAXyleMQSnN];
	pttqOMqHmnWpOniv = [UIImage imageNamed:@"ibPiCLfyBvqbWpfNtCthYNnCclFbPfwPLwjvcrOKFoJHaPrhBiWXjwuDGJJVWZjGGYDKUPZPWKDwVTRzZJEFIxHaPpVwVNbTKSgGZftC"];
	return pttqOMqHmnWpOniv;
}

- (nonnull NSDictionary *)RFXpjachXgFYMTRKTslEkeSB :(nonnull NSArray *)bwItepcwjNJ :(nonnull NSData *)zqSEbDeTwyRDUNtZPAMgDEA {
	NSDictionary *RWVHgbJeOzZRUtMv = @{
		@"ProSTXbHpiX": @"QjwjNNuqNuaRtaEXFTcnkUBnXVmlEpInSKJmJtttmuyhjcYcaqUAicBdKOryIIGWwGuqsxWyoMCwdRrIgAhCjIfBimLGscLQBRsOHpVxklFuZnQeTtPYcCXkuGHhBexYqCrB",
		@"MFNnrozpFXisgiqOLzTkdse": @"cSBPvjlMIbeqAsjRRLTCHBSdUvNfBMJQuNwsFYUKeSOnpmSGsXiqqUlTJpwDzvwUodsHKaIHabaXHIuCzCzUNopDlselmlKsQyEAHNOCWHLGqZPCSRVOieybvxVcWdOHuIuCDPZuzteyGDw",
		@"BnXlwojrUNlIkBmYn": @"TYhojKyfwyMmvbZNDIKLUIIzdPwlhZynLEMndDBWVKdKwnpphIvKDAfUTfqOZVNIyyBzcRCsMiOXTfmgVkdUFbyVjcLdKMvNFFDkbLzMLqPOOoChyGvFQysnJrLJbQYPUxuIfaUdYBhYoClVKANs",
		@"xwIEoykAJNsR": @"CcIqzkmTlMhPRyGoVuzSRciCtzBDMzuIZXSnSsOrbfsZQMZKjZUlOaFWwWldmYKZUzkKdjsJDJasBGfUCdbBHdowkElyJhSHVSXOjWFLlleuv",
		@"FtRDIuHspURXszvUvrYszdPV": @"SBteambtreOeToVXSBkmZzzMPHuSyjlnYrOedFQlAINYrLHUFveZAtoBtiweepRbQJhYjcMDRatTmrgTOHVKPGqMqteJHFzOujgcjkmPSpITgVcVt",
		@"HsaryMbGNyLgkebUuGnBOm": @"TnqjBchhQaBDrrUMgDhnHdOyWhlLDHEInQQJCexCymdPmCRQQEhEeeDRryPjzbKcHrMyCtjCeqikuEzjWkqVHnGbHMPTpwpkoYVKwICEACkOlRviAJZyekjDgjLaINhVlUEjogLyFj",
		@"DichkuswZwfIWbs": @"UbnTvLdKwplXIbjAarJWiKqNmXtklPThUHxFTZMNmsllqbjUiUFdcmNrrnTdLgeENgjUjnWZUvcPrOtrrpMuKvJRPLxVdGDtWJvceJRKdDvGthFddj",
		@"NsyJdPjcyJyD": @"MmIMHlOfmhAvysgsSYOeQvNrHmJOzgVxEZyGyngBgVEQhFHhwDYPFGycbviwehoggoTzENtWNwvRFoNgXIOKDednQpoLjXpuYGlQtoRfzOiriD",
		@"hLcDhsVSQSuuSmUDVQx": @"BOQYCZCSXlYHZbPofgYvdhslKbjeLghNqaFtuOLfeNeBcmVyfBnEzKniXAGqZRMChViUltKdRyfbPqXbtBFlukiCIUvlfWBfhydDegSqK",
		@"ouqRySpHvpf": @"TxJdncmLBowVNpufPahEoWdGxGIcWFPrmmFJfFfLeyMzRfXdnbIhKsmqRljkNPHytnVlUNvStyloVrcGnbzBXMHqSyXGXvFrgLOiNsVPXGaZ",
		@"OTJnShtqIGMdC": @"fPhDjpTDsQbLndoEFdaUZNituVJvugpGhgIAagJeVvZAQaLiUsCociZUDtqBwGpuHZNArxwgyyKegNUVreRRQKAqeKsMNNROjLmKgmrJmeCO",
		@"agiCfHQONQOShYmgXjWsIF": @"aAiRACFRydeLgnjTYJeFLgaxAqEWxMFrBIuNLWLDDecubgbvgBpYjdUPYcMxueUuxVWpWIXsuFVCxYUcuynPBTGgDmLKYiFMNoSKepEzYLu",
		@"TWnppgzjlAhdBi": @"vTmfknmuECbpZkNIhAKJEirRLuXNhXjrIVrbPOlVDPkFDXBijplVDNsCcINoiJPISneAGaChjwxwZxLAwMdVswOgpHTphtmsEAMgkfQaTtRXJGsEBRqJAtEdaActqxTjUrQsXIuPDYJDn",
		@"nhhuXFbDyEHoMUlBMkH": @"ECFRdmbaKRlJLtIzgogHtmIxAPIcUiDtgLbpaAYEHIvGndzHtnyLPHwHWqfXPyqfPirJcqhxDdCpUwDGVuYWsTSsHWWlRjKGQqyYgldBuVOAYwMXQHvYDvpoZNeCopwUNnfI",
		@"AcLXADoAcsHAam": @"xmdFMkabAlnlxMqYnARjaOSuYwqThbPYJcEIgrZIYXFuxcpsmTbexEcvTyvURtbMKlgLuqbvnBERRHFEJacCHEuwrjVZmjERgjvZnthLrjxaAMGvgyYVshIocSoeBYjwp",
		@"MzAzzPWSxaI": @"sQuXEUVpYPQOfScRCbapVKHNsjXTvxiPwQqOQpgODodgxtGkIbxSmlgZjodjNwhJarzNfoCKPjKZLkDllmUunuAzygXjpsWqrXbyGGFaSQEPErBofyaPXlzajTKnmSA",
		@"ynUhxZWkTuDyuuEYUgSt": @"QMPURouCBPiKWZNvPNnQgyCFBelbrTPqsmLVLaPXRIzFzSpwCSSScHzEbxwcRZekyblmlVFnTAhyvDwrdrDAbxswRXrzbKpSszHiTQxcFkwuZywCUiPEpfFn",
	};
	return RWVHgbJeOzZRUtMv;
}

+ (nonnull NSString *)ovDzfeLSKockfMSSdjm :(nonnull NSArray *)EuNgLDpeaRVbVQCqSMts {
	NSString *WdoFYWhnUaWKXHO = @"WFXlLixAFbGiWxkPlNvsayNKMYzUzIrMWADvImiWKogrwvgkHFbCSLBPlMEMPNNnIISPzXUGjVISAquRNFhKReRQJFGOmJqvDqolachnqVWIMSqrQTxwYCLOuzEIFbqfBoQR";
	return WdoFYWhnUaWKXHO;
}

+ (nonnull NSDictionary *)nLyEeAKnSHEreBdlZWMwYlg :(nonnull UIImage *)xuLToLHZFAySWSqX :(nonnull NSData *)EnPTgAkMQtweOAmgxddfCH {
	NSDictionary *CbIvqoRxEcKeHkAhUMxBeMy = @{
		@"tFjqinhsNtPpxdbxFAivPXA": @"XMJIVzRCJTYIvalLLeKWCXnQlgfIUfzCiTGQNcTgOuekUasfXayBuLpIVIxrECiesYpgbAXSmoFQPKWqeDXANiAhITGoRTnNRpBbiKsYmEoRyjSYVZLYL",
		@"bQRBKmMmxDKrMS": @"cxyxGdHAUSMpeFGgkriDnCNAXEmxMomjSpqqJGtCBERsWWgykjwTZEaVwcHecSWbdKmVXyJmWyxPhbZEBdBQggGCfMrstzsrQrKfSUfzsRBMbMGn",
		@"HlwfPTpupY": @"hQpgOFLCoPBXgbVShHBDDXgPywZEiSozPZzUJWYznIHSsWTzqhUqJQfxUDvDTByqMsLFuGfkfUNiPofWYYWnExOHpSZgHUNlvfBBHvqQiVHpldBzoxvOmKszomYHWPCrmYm",
		@"oDlzUZmLDXjiMuHIdwY": @"CUfqMiQzpGpEwPmwdJhSiHahUEGDRFMIXkwMASthaluSIOLlXoGjrYgWqpaVDzaTBWKxvRVmUDkPOSnHXQkSkhGmCYdeBbEVESAGDlFIGcYXWhnEdLSwKOkV",
		@"NaepLXjjzi": @"dlCMGHEsfjDhaxsuUeoqASvIMbTrWCxiBAyfZzPHkLsApqGDlhLNsCzzdSycbXJvnFzElcHZVsKNhnxzPiivknwgZwynZZqweCWhoGAqgVLUAcbxkS",
		@"gssvjcePauPwzACkeuyX": @"DYbCXZFYiTzvnShtlofeSAHLHLuYOYwUWpTzFZVrkOTvsnKtoJTdQcpEdjtNBjbhkNMOHxYMClCTGmatJPDiqdRQIudzLvRcFKwuxCCDwioBBBMJdfZRmEJdwWsHWqhWXqPJQKWpN",
		@"kQROIHbTfGliLcAlDi": @"cQgQLWKxsmehMHJnebBsjjmNtRriszYqVamAZNoyBnOYxuaRNQutMRzbHKyZJCwEjLiozzMVvNQefRSWdNJKwqpzBDGMlIDmdWBoFYssJwFJvvGLtTV",
		@"GUNXdFhHUpLGYXqfPtwFXw": @"JgZeHDNQauFNlbIWSQujkggIxYrXSaEkMARRnZSxoIJeyccOrECZXekiviEZEnkpXFGDUwWGbvKkvBxKLGGBCsqqaimuDTVOCoaTcXqqSuXdmlFljHsFPrYrlAqmuMFyx",
		@"BKUOvNmGzBAq": @"GeounxLEEqiyTRzuebfklCNKernqOURjWpzoVhesEtWRhSPcRlESKXDFvlUSwyCHwEZOxkZtjVDXeehOvtTmeSObxmMJQDNqFZFgIfvpMfDynkrdpGbwqkZLRxUQqMMbjAunpC",
		@"hzVGgoTmpAHsuTu": @"gVsMduiJLcVnTMenhfHdlMulIkDuoRCDeuoiUEnaMNhBgsFLjxRkxFsKyqoLEKsyoxcBYdWPuXnUJWAhKMEcEstCqipiJpqHFTDUlWaplcLvROOwvZcMoPKOLgiQyxvtJxABxHs",
		@"VZvwCPycCTINXmhN": @"qDojAtOQspJDpjKhODCJsEsfrtJNuFsZZEdxEvkficXEYMWpGrfnYxrkfinHmMIdCqSpNsZygEonoVPPOSjcsXFmUoDLnRaChmQHiXwouEubrYRqIXYBtJXrjPmsfYGFCxIEHQFlXuSrsiENrtlg",
	};
	return CbIvqoRxEcKeHkAhUMxBeMy;
}

- (nonnull UIImage *)rDvxZaEVYAeLb :(nonnull NSString *)grEBhrmvlhiNmCNBCon :(nonnull NSData *)AxHEUrZQoNAYCBxfDwisEu :(nonnull NSArray *)VqoHuBnyAst :(nonnull NSDictionary *)CAwxlGTXmMoC :(nonnull NSArray *)nTTqZiiTChJGbjKWmwc {
	NSData *IMSAbmqYwvBz = [@"TAtiOWBGEBpWmvuAZJjovcTwRrdgZyQDvaqVdKlgzsUehxjMDwarzhrOaIcVxupwtvXvkNCVwCUvQNBVXrsmPQLwUSODRfdsEGfzCqbB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fpVunockzAswhCelpCXKXjna = [UIImage imageWithData:IMSAbmqYwvBz];
	fpVunockzAswhCelpCXKXjna = [UIImage imageNamed:@"JPFiJosEWsGuxEhlmIZyOiwMNUSziqGxhrWDbKWKxkeUSOTPsGbqyfITTxgPPfVflhIgtFLYQWDDZpzypefBwOsfgKKqMdkjoAJYluBVZpifoQhFBzYcgUmFnFoJubOMeXKzqYdYRtZ"];
	return fpVunockzAswhCelpCXKXjna;
}

+ (nonnull UIImage *)ahTWlxNBFtN :(nonnull NSString *)nXAffTXrqXFx :(nonnull NSString *)GtpMDJoFHomUFMEDBuPG :(nonnull NSDictionary *)LOsygBnYNHkZmMZj :(nonnull NSDictionary *)ziXraaPXbfKapoClYdOfXUSJ {
	NSData *lGUiOiXPASfIieAZHpDbe = [@"dULgLZNjykXqMPzfDrRVNZwjTYHvDTYrXvDEIMzdRWzPRvEvlePjtAXAUXNWekhnJpkqvJALSDbjmjKLfEcWgTTaYTlxMKZsqcipUejraREGtMEeALocUWoIOGbLHoGALlAlYXkl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wxUqRXjKSuDTWNmo = [UIImage imageWithData:lGUiOiXPASfIieAZHpDbe];
	wxUqRXjKSuDTWNmo = [UIImage imageNamed:@"cmxjyHoFzDxsLkLYaELpCdEdEFfiIujnlEilprEYDxuFLczjbFjYRpuguvrCLMrdHqdeLJPYBlvJzKrxtZOovrAudEUhvOJtPpUDDOJKcXekm"];
	return wxUqRXjKSuDTWNmo;
}

+ (nonnull UIImage *)NHSSAiFEUYFWCQxPglcS :(nonnull NSArray *)ltlwKooFIGLEvSHmQU :(nonnull NSData *)VVmtzhOVVa {
	NSData *sFIIAdIFgAoNDkljzmzmw = [@"yPAJfwuNIRjRQWavtAjWHckujWnvYGppXjRCaPixLPLlIaewtzOaTAueaIHNjWYolBwxIgEbASkSCoCKagTUBmIQkHkIbhqLJnILcsnmBleRVgUbbGmnoEIluYQh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bxTGEhzkILKjaGg = [UIImage imageWithData:sFIIAdIFgAoNDkljzmzmw];
	bxTGEhzkILKjaGg = [UIImage imageNamed:@"mADZZMdMoFlKbxFBYXUUGXKMWiNPdrRcLKAKKSCaXttDzSOrsKvgLCEqSCuzTJOKILxVsWtVfPUfEyLURchppoWMyafjSjsrCQKTrpXfRqFBvrHszxx"];
	return bxTGEhzkILKjaGg;
}

- (nonnull NSString *)kKQQTRfsIVwhrbQa :(nonnull NSDictionary *)TpsMWcKsfZHeRdPLBwaG :(nonnull NSData *)wsCTZXJuOIaNqAfiWV :(nonnull NSDictionary *)IVgDRNAlygBtnIZujATDTZd {
	NSString *BraMDYXPKamsATebOxKBEF = @"cJKvIWBcYbraMsMkWOjNioXbRrusQtoINFFhSyGEMzBjkJGcuCsBcggOQSkxKJMglKmGDNNtJyRfYmojZRZNwPYihhyqCWkPQOpYFFZpKGimIcGNZYVXvmgVzqZiVspcyKYYDmGhHVZFwv";
	return BraMDYXPKamsATebOxKBEF;
}

+ (nonnull NSDictionary *)mPpJcXcUIaPyKhBgzm :(nonnull NSArray *)LbQGFQoYDIhoRBuDbES :(nonnull NSData *)gwGvDWfRkBSzEwpyqVwDYU {
	NSDictionary *umJFRxIQsWFg = @{
		@"NcvRcegxmNuQc": @"YwEIvNFZCEmfBrcpLEHJhWwUOusiOmljFtzpfSEPAzwbAvCNRLvDiHQmKgxfehRAmSuvSNAortygMDHQusbQRbLpuOGJjebJxIeLHxMByPeksmZqgOxNKfyVSmuIsEOkeOvwnNKTHsJCg",
		@"zAhtwzWLkPDCGYknIQzlCF": @"pxbaEuaDkONnONQCpSGCmYCtcmebpxAtjnrCLrstgPGwZoXdxRTwZuwNhadkCddFEokpUBHJQXKpjkASjSMhYZAZlHzyoTNJGzytbngMIfndmajbJFiFZyPbN",
		@"ZUuLuZmeqpXaKUsXLjJqM": @"bBwtojoQUjXVkfZKibBHhoqbGdEXsVLINstzyntzStUyzjAsyQZaaarsFENvBthfNMUjKPxqXVZeuLmHeuItuHoMGsRyttcacLESlRsYlWVjzStLbTukeQkaMzlMhJuUQKMnPORBPqfCuV",
		@"yOZwYZZhOIuQuPcOV": @"OrfQhAeIPDqawmxwoKiNpYEQhgTwdVaQeLdqBoudmMViGlTAwzyTrcjdGWnJiaeNbNpUOxIwgnMqEHZdpEDuleaPFZdTKZjxaMYSsCqgYOfozOxhIJkmLNjrYvQFcKfczrDzdHCsjeIUcBw",
		@"dFhnwsNMJw": @"oTwCUuAqtjCnjOfuRDdfArgGiLsumcbVScFHIiJgwTnqIkcvGeZjnsLJWeGsUsyINfmzeDtNSveAkYhHhWAnKwsEclhhGUvSBYnazPQYhbzqdfKfivEverLlhmnuKPQzHW",
		@"OdPlvEEnTiFYBcFewob": @"yQQneZuUPVQuNnTIcYCioqIqtXGXKbOYNYfbbOgNdAmXqqqfkFGJHizBQqPQrZeWNhPkRtzTxuMuXGOiKQIpFKUVFdVpIIYqMPWwWUAnmBpXYfWVGItp",
		@"CMjmxxLTRhuhpeULlbmoMQ": @"FAbBjqVOFvzRLbAKjujrqtiQNYAUXDxLNbOJAtMiJvUvkaTCREwzakBtuXWuFmZjeBZuPhvbTZiOjaHWCghIsCQHkQHRHBltbbfKMjEVcIAzqKMuQbHBmyuzvzCRnQsU",
		@"gXjWDNtFLlGJIhSnR": @"RUQGpDlAoUPQREmEsKalSfQtjBuwMRQDvxiekSNDYNgzyEPikRLEMvmdWkiswPlbBQStOUdqYtvQWkvpMOVArvwUfpQODsQbAsZoYYHUofWhJvfBUom",
		@"qdHPrXxyrFGstNBp": @"lMUfwQyPVcRRPXfBXgbiBWbMklXutpxvyxTxdULzJbcKUWoMegDzxpVwXcYUYNflmXEicauCoqfHIWKBMuKEaawCHGEghpoLAMnOgtZCywIujbODmVpLZsZtpGeFbMKmnckYAkA",
		@"ekYnWHtqXtmugLeSdB": @"bMQWRXZaUpcrPXYbpfpfBOPMqimBQNMHpPbTScNRjZAcJhsdBvZIfpVEtxJNlXLsZKwLxVcgvWXkFvWMToQMvIfZwvrOHYwFjAaOzvImHHRgDCCMOWIRJrkSenDJzOQJQllcLwCRZN",
		@"ozeLHKkfuVC": @"bYBaSSbnIJbxAIOyIjkxXSPpYtzRHLXbMBpvOHtxPWZglorRSIbVjYFMyCvDqIQSCugSuWNOwXDvvkdPZjoiFJYArLFMyXDxcLuEdFaDyuQCAb",
		@"zpAMcmhWdCqDvWg": @"bovfNFoXcJprdeNzvzUiodPDrtzjEGYhtAPHDVNCVfWpWyvOIpKcSUXbeuVBzgEqOiRyKmGtjayPnAwZPSWaKUnVQHupXkGJradusTYZkGYqbPdvLLSxNaYSpoEqmarSkDyDzlfumG",
		@"tYJllQLsyavJyhPHxGI": @"HCghAhcyCljGUlbxzZaFBwPyhLSNgWHEbYqvOPBXRYHXRYArZckgQYXiKZyCwvSsCDRqemWafWMraWtITCnNjMnPUpxwoYMloTwMlzgLLabyCNeLZkDKewj",
		@"JNpYCoUeacyx": @"GIUuHaeAdwVkuWSZeBLscTZYRLTWMwkGlANGCDXLEXqGQEbSuogyMkGDniSQFHjFycyMvfOZaXbzdfRxZNDryDhKfgZSuFmAAHcytH",
		@"XJqUUuixFiVXx": @"cJlHTMqIXpAztzLLdRahKNGTVSSPzKTRwpDVtMzwhTyssYLXgnbuJyiThiMDXApJWBaNEhzIyYfOLRtIPPrzuGjSMprjpqytWRWKjTCoMuqkFzDtMrLvLvdSxIUaWj",
	};
	return umJFRxIQsWFg;
}

+ (nonnull NSData *)aTjwzboLnxlXlutXrYfTB :(nonnull UIImage *)NCRRoCverDOGaqBLPuYuu :(nonnull NSArray *)rsbJwWVZnZeslzoquBUFSidS :(nonnull NSDictionary *)SbiryGdUsUuhzENnNavGk {
	NSData *DtrpVOYCqrCLazcTbeWh = [@"VtHQGsPZqGpFWBxwiQcqQOWOTgpnpjlGtBLRoGwvlLIzavzDyyTJAQTdlZfdjrFfWEJcVWXCLphXMNzlyBckZGFsMJWWLJHcrwzoCNXTLgSLwthPcUIHBrJLxmLKmfbL" dataUsingEncoding:NSUTF8StringEncoding];
	return DtrpVOYCqrCLazcTbeWh;
}

- (nonnull NSData *)urYqPMcVfxGd :(nonnull NSString *)ZQePqQaTdFtnDmwdZmORt {
	NSData *ojFbizfdRpbcPRjm = [@"nXWGtJIJrLqdFLqNqxExoAywNYAcqAPqdNWMOCIQczLnOgTXzZzQqgwMaBVwHrBBsZfLHGXHbevArQuvSdnmCCUZiXUcygHxkNJJbmweSwsGgRxEkOFgWIZxd" dataUsingEncoding:NSUTF8StringEncoding];
	return ojFbizfdRpbcPRjm;
}

- (nonnull NSArray *)ybLjAeOapVX :(nonnull NSData *)UaZyQvmWFycrFPfWBuiEcP :(nonnull NSArray *)IvdfyZYFWDoabL {
	NSArray *YzMJLJDjZkXPcKMXdQvZHUqm = @[
		@"ftpIzzyTilbOjphgHukkfUNumEWfsqZWAviTiXQrHgVsCSaeIBTajkKfBTZzfMnUrhtZOXMEPUEyzqhtNkjZqiqqScZNhHyKKWpLYePiUXGBKrSuCNAFTXThDPfQBFlRlsq",
		@"JvhpqGdBGpceUpPlLeMTaKReaQBuHFcGvwhPCrTCZnkLlusTxIvELXqktaqaCLYXEifAPtKQivUbUTUvmTIAvCYcmCltgrahyRyNaYsnludQ",
		@"WTFMHaJavcFqWOWGEPZInFOKIuhbDeAyRoFtMCuNXweJGJSPOIPTkblOiekNJUEaucIvJBSJqLSFanPrciFbEEEnrMpKtgQaxnbKTwoyNDxzBzVynX",
		@"rbSVyyqFKWOyeRLAFhMDeBKqdrwuiAVWdbOcGQPOhoEMTQmQDSMRndCRJfseakNClsyArGNJQeUSGYpBfxOdMcqtJtvUjgmoQJtzRZBoAWjVjAxzqFuRbq",
		@"PyfpjvMWLzOIsguYikGaCqxCZGwbhpaAQgFqIxQeNZxKVcQGNWzPllMuRiSnCLqiICOIReImbGuUsXOPYqmViYqdKjcvpywZCejikKkBwimFSLjx",
		@"izoSvqpBkmkwCHbzQEcMvpOehOsbtrnhGxIfNwSpAPlqUfVhRIpymFOOZwYEnuDbdWJOjhnchRgErgNmTjaeCgNINEJhMBNwtSSqTyEpnTAaHSflN",
		@"ECdIDtREOEAuNmfbmOnAeRNGObeNyeuKJYFiCWgLEecWZrtqvIjuVbXQxeBtwtTpVsCNfEyKmweBLrJQUXnbTnefDKMNEzBGiUFhCIwrUkhJCYSTiNLRzUKHpVRZXuyVvMGG",
		@"mmRDfrwEmddMMGZjeFUWjkvYULuQcjoQBAQifSQpLzLbViMcznDmcGBXVMktxeduRLnINowjVTjnexDDCLrOnjSvPltIMhgObGgiSlHtojrHiXLpjdrYjDDNEmsiUi",
		@"YUqKJZZzQoKEwfWXPrlaNVcyLpAauZpXLHrZafXLOhnIJrDvrLITcFhtjJGsMSaTywPlSZRhCMgZgthQJSQpDtKzwLcIPKdwveLkgAwasi",
		@"zexJdXRKeZjBrcgtQyrqHYnAyKdkMVgBnYLLmRUPGaLICOJDbnhTsfmsieXbSvsNCoxlzyQFABOTHHCFYfEAZzogpvGTAVKmcRRqBIjkzvXTuTFjexoStD",
		@"xyltbJsrIziWpPaIisyxIioacCMuQGLyLIKiOtpwGDgWrQcgAkUXzABTxUnlSoKsIsEhQuSCtPzPEJceQlRpaDyebiDvXDqsxvQwSLFuQMUVylOzdyavoeDMzWoYHxZitK",
		@"EySYJYBeXylOgTAVVrGRhtXrlzSMBtxvwVWfDiIhjYqmumzFXAOsvIpcRzzepNuONSqYSbFQYkClKaOFLmxMBCFoLquyLhsmaRUmX",
		@"sqCPtkroLvNmeCIURXXqwlTqmFOpqZjJgpXanXGcoxwyVOfFZbCkIKJuublSzNupeyTfCuAIejBnHLISxFUyownWHlAyHcCsXHqv",
		@"TKZXmTBOKDcyDUKVTjbAcYzQfjBuptGwgVNjTADAzNuMQsaRlDBbQVjNXeJxvQSYKtVNdKMACLDNkNmiWamvdXARcyGOtPEcjJflkghXgSiweeXChiLqTeJDIQjdmUnjsegTuEmhjS",
		@"NCXckikjeXRmaEXHpUlPyWEUFrRWpTdbMmMhDIdWjuABdalAbKnpLNhvwinPkDWnorOsGufmDYXEbffMrhxSwrRxdWiyHTkzTvGJkzJFCUYbmwFNEXWoIZxdKvSfFbs",
		@"wbeqrGuPEfzYEkZJcFJnHxtxZEGUBMVRDetCCNBvFaRTQuogAoSfVOWbVfHxWzOIptgKrxgoeYoDOccspIdKTzqvENvzTAducpFvhJpwxKYmUZzXIPoCSBUCLtOooboxjDSrLF",
		@"nGnMtTXtisdWptGiHXxhbLiXTjJsxKARFdTiVLGxHgGvUKmCXlVKtUBBbTQvijfybQaqnMZiVRFgFRjAsfeZXLAueJtoSljXqlmOjMuinRzMHjVGnnlQIKmchDEYYzcVNQ",
		@"MWdSlLErUQpdEjyfpEReqRLMMJqcevBQdvhrToZbUtQDAiQPQphMeIUUlukDDfwKjkumtCWxQMeQlkuJbalqQgdYNCSeCzieAuBqRpjKghqeaoupTmkOG",
		@"RyHFFGbfcjzLHFVePhzKCIVeOOVSkYTaFTSfqHPFuwbMNEgdkYysClWzgLYTHDefnuVOMaKTxvfKnRhfxTlPsMwxDRjfUffosYzXEhnmLPmUuxppTfZ",
	];
	return YzMJLJDjZkXPcKMXdQvZHUqm;
}

- (nonnull NSString *)RpxgwXpMNZ :(nonnull UIImage *)jFqthFPzFnRty {
	NSString *dzlUSLitrNngHCjq = @"HRXlNZgcKEIxsvALiAqnmmKhRtqXCeUAiPSFuZmFRDwqXmhrDXkCfyTmqhuqTcPPVgVvWocMbizuIkDFgvXnAEjtXqolzBXvHXsjkZlzYT";
	return dzlUSLitrNngHCjq;
}

- (nonnull NSData *)uUUOpmnEDB :(nonnull NSDictionary *)RFqVsUsWTJhBv :(nonnull UIImage *)bcATgmfLaEXdD {
	NSData *LxPqHwHuoMFlJJriai = [@"gEAxUqJNlgLJicSyvVCmswFHhbPKciDICtwwJQfWWFqHJoMFtuixVKVzBOFGpblYhZHvzVvdTwdHoTnCRqDzxrfKzpGrKqAwPhlPWPqhRJQBeaWQQgfqMVEIiLBMsgFUefCHtIsJebQkCEr" dataUsingEncoding:NSUTF8StringEncoding];
	return LxPqHwHuoMFlJJriai;
}

- (nonnull NSDictionary *)TfJTIPoXTLu :(nonnull NSArray *)tIkvSUMELhrPh {
	NSDictionary *gyWTlrMycwKirSgzrnsYWH = @{
		@"oOBHbDpYJrepkgixY": @"uBtiisKRBHpzFWAxlpdpAvloLmtvENgwYyevpXuusFgAtCpovexBPWJiZIqcgdmbdPUhpDMgBpHscuoJEazsgSMmNWOZxvxadiMjFGpCXloAFdNCYQ",
		@"oRxJPXKecEOJ": @"nGEcdzNdUqUnlhcGvOgOVpiUqcJdgxrWphuWMaLSHUtmfvjaTzDRQJwtotXkAyMTzaTOfkZWYTkirsoGCSePDWmEQXYZuBarUPkwSxOpnISdPcVzICRfWWNdwEqnPizxU",
		@"BjkjmnRQNT": @"BokJwwjFYrgDvXxDDEUuRSclTWErwdJOJTZJRQkfzDOAbGcjaKpRuGZVsBDNizMNmmeZppiSSoYFocJmEuLxJHIOGKEndRloLcwVhawIqZUipJoclolAHIemseRxKhzgGWTiOgrfwd",
		@"CzPHVPqzcHMDpMycQidZ": @"nWIKVGdHuACROVOdmXFrJbDplTKpmFxcZRFQqHlDaKgYQeehNgdWzkOfHpIaGVJlvqgzElSwtNNsXdlzhAQRmndErmGFKlqXmAusBVVzQJpvvJYIgtj",
		@"ClgDNmtBgYROSnvOiiRXYBO": @"mZjVhwzVxpiJyeVmwIRlShjyxFhABCqazkZDesXNNmDaBeOnNCLMVZVCmpnBxbTmrLlUQEoBIKwMJNqovfUStVkguSUoFlYmPDHFYXvSLUhSADUoUOFXqaBzFPqf",
		@"JKOFwDkpEgrajNqXEqc": @"DCJHaUVPXFBzxStmAYnwGWQCIaqJFktMmiYSzydoeninZnbBjPNoNBBxDhLlVRpvabTXdGAaVGVVobpDfuwieBCpWQfAeaZUUwsJEyIOTsxOlwgMKYAdLl",
		@"ZdcJjjbwnIkBB": @"dHSGkZNtJRKneSXyoOzoBmeQPTpZNoxNzIdWwPJMiEonvJbyBsGPPWLeHGxgbyVjqBZGULbbGUYaifxvEsGSfEVqtliVDWvlcSUOVbNWcPqfXFziGYcSKXahbknzOugaPXDQb",
		@"eqsmtRGJTUeM": @"kYnOseiWnkRJjttqupfQTQKDDlqWbfITGESYdKitcIlIyNnVBXXlvEurQjPXUcupavKkyEbXZnxTnhRPYDZUrZGdIjaJkrpKyEFxLumtTgptKCaegOBdOxlzSjyeacnySzbOjL",
		@"jSPdOVUkoNbqLmlDwCpK": @"mASfhycPZcfAMcMPGyKqTCplUZMlySEWmPCUsCeqZzChAfmgepICLLXKmBFYnAvgYGjUtzcLKuaGmnZZGrXkMWGaZlQaQwfjMnKgfPuzMhTLxsAeiofLyTbtnBYgTJ",
		@"ERNHezwyKFDGHdMmabdSigmX": @"XyZdskCfBrtocShgwqqaCmlqlnsroyornDuIctGeZXgeqpYRxCdNaXlZuTJDbVEaefHQWvziuriILjnHCaQCVguzMeDTLAsqQRnywTnpNzIVGjEMCwxAwGQHCZiHdSdAtHAIR",
		@"lPTiezALpjmbwkaWyzcWS": @"zaqbObKXsnRTjRiaAdBrDylZJZKVoFkWySZjvITdhJGhrnhxGKKJkflDnWoaiKdbTsmzLZbqkfKOGOmUNfRTcHrzijdIJSvteckAaKCaKbSQZiMcZZYIrEsgcBVdRphCREAcQQomQvK",
		@"hXplfjFTCXzzvMbuLVM": @"KGJWHUYeSlabHektbpPPDnFgxHnnvYLPByPkZdfzKpIEVtiqjIAdMphBGomtdZKNpfrCkzGYPkiCmUHnUhjhlCbbvwUMeyOtXPRNFRHgvjNYKbCnyJ",
		@"AQyaghyonwtvzEj": @"xTuOsGMBBNjJJVnBsYZlMsCUZOtwDIHKtOhYDIVoOsWEyzCzwlZtcMtXMkAQnUCqXVZVlBlkPTgIlzQCltZphZyGwngTdRZoZRdXKfrcQhIpmgqkaxsxqhzSGKGJVteKKplDxYMWpxirbDQSFLt",
	};
	return gyWTlrMycwKirSgzrnsYWH;
}

- (nonnull NSArray *)LlnHYpbVmvW :(nonnull NSString *)OUKicynYuNdTDbdeRCIFfws :(nonnull NSDictionary *)KTBHHwGpqwo :(nonnull NSData *)HcKVzoiqCUiFxnBqi {
	NSArray *rXQDmCvJNJlV = @[
		@"gOdsuvBOegpBNUbbPtgHnfiQTpwkTWiOREftoRpiHoXZuDpFELcEQszEvPldppBNTkrFvpUEtBvnaZQGuCLTVOkqjRNSNcvxPdTOKpfqozUYpoIusBTDseRJnAPRWGDBcumbmdTIX",
		@"vbVECCWuDXVrgdJnBvJfprbjVqsygPSimdSvGqUPLfhfCEFmBDWiFGXVUPeUsXQxhTcTrBdMhVJIaljhQxctPTvMoXDeWmqCvwbkFaYbOdgwWjFdjIxmQOArXJe",
		@"CAQfAXnQyqynmwMCuHGdptQfJEBVoOFMizSgMLMEqWNDobtifXwsoKeAqJoOaZoSVwZwtAILvOMiCGWrifdGedsoLDmbnHxsRwcSgJvqN",
		@"TAFLNjXAEHTaHnQyNGIoNZrwfGGhCgodIqjGvXeVvJfQkwhiOyZCFHFuKYpQJOrWHdcVLXiJTaJLGXYCdbvEpzpQnmIyoCaBEMJcNzHDUottFTIRdHUSiznXrLJrrEAmCZAsANWbFCZXzJSZw",
		@"sKnMBmEAXwdcbKbMKeAaKHaSwAEjDClnyRREyHWGEPXHVbDuzYSCOwpjEdzFhWNtTmTNaMOrLrbfjqLOnWxWePtknAfTpHwGlGoOFDHLwkKjcagMguMYnQgTwvAAIKSNkci",
		@"lrKOTvHirZDCZaYiNHIkqGkxFpEEHOARTDKHITzcNpRHPZmBzkKyrJJzyDGgnEMTAKUoLdirZXECOdQRajGKtlPAHEibzePxGDundqQRyYaoqCebJRFIUzykJSwCCvWJehCMCbLpRdEGqLiUdo",
		@"jAKYfOzHVBDveEPCklflHYSMTNoSPilHdJTomkEVFHCBhlxcfvKdfHfoGshlWgjkYgQhlPLwLAXDsXviHhmJnJXykyiFcEUIclGCJLUHtJfufLHMibFntxFE",
		@"MskhDLrgNxuxUUDZOncHQZVMnbKqrdBjwWCXMhTFzGIVvHwXSWhQVLReNwpiVJoPnHQYPLdYFGFGYROKumICfKkEdRDNaZLGLgIaYeKMVrFICcntRAcKbhx",
		@"buiaaGrwXRaENmRbgPuFgyNcoSWqwyNzORUaXnQChZJouvkQOfucIKARUVeEMfHnKIvJsCGsjlkExKAWjHQizPOxMLiQyXQhqmUbHaHnrsLuqYZjsunsfFVfvF",
		@"JFASMxLufFyWMNLchtHMzBlDdlSsJhZRUdfcDWUrIMhlJpUuWMsLhpZFQhslycKdcHEoKewMjzysnHGAJMvNSIfriUOLVNAvKdIiozdqyKWISlhsTqTQoNGZAlXDBAYDVwxcKjcIXDZZ",
		@"knvnnpFcDeHkXquCqKERmeYyDttPodAvcTNjOTndJmgfAcdBdkSKxVYuseRvAPxeEMAUqFlzxHJSkjVQDXrbbaJqYgESCEuwmLCoQPYLyIuTzIxkwAFBkWVoJfYbMbEef",
	];
	return rXQDmCvJNJlV;
}

-(void)DirectionStyleChangeTo:(BLpageScrollviewDirectionStyle)DirectionStyle
{
    isJumping=YES;
    isVertical=(DirectionStyle==verticalDirectionForBLpageScrollview)?YES:NO;
    [self  setContentSize:CGSizeMake(selfWidth*isVertical+selfWidth*pageCount*(!isVertical)+1,pageCount*selfHeight*isVertical+selfHeight*(!isVertical))];
    [self  setContentOffset:CGPointMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical)  ];
    if(currentPage%2==1){
        [singularPage setFrame:CGRectMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical, selfWidth, selfHeight)];
    }else{
        [pluralPage setFrame:CGRectMake(currentPage*selfWidth*(!isVertical), currentPage*selfHeight*isVertical, selfWidth, selfHeight)];
    }
    nextPage=currentPage;
    isJumping=NO;
}
//重载 Overloaded
-(BOOL)reload
{
    if(realDelegate)
    {
        [self  jumpToPage:currentPage];
        return YES;
    }
    else return NO;
}
//重新加载所有数据，并跳转 reload all date and jump
-(BOOL)reloaddate:(unsigned  int)startWith
{
    if(realDelegate)
    {isLoad=NO;
        currentPage=startWith;
        nextPage=startWith;
        [self layoutSubviews];
        return YES;
    }
    else
        return NO;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(reset)
    {
        reach=NO;
    }
}
-(void)gotoNext
{
    reset=YES;
    reach=NO;
    isJumping=YES;
    self.scrollEnabled=NO;
    if(currentPage%2==0)
    {
        tempview=singularPage;
        singularPage=pluralPage;
        pluralPage=tempview;
    }
    nextPage=0;
    if([(NSObject*)realDelegate   respondsToSelector:@selector(numberOfPagesInBLpageScrollview:)])
    {
        pageCount= [realDelegate  numberOfPagesInBLpageScrollview:self];
    }
    
    [self setContentSize:CGSizeMake(selfWidth*isVertical+selfWidth*pageCount*(!isVertical)+1,pageCount*selfHeight*isVertical+selfHeight*(!isVertical))];
    
    
    
    [self setContentOffset:CGPointMake(0, 0)];
    
    [self  setContentOffset:CGPointMake(0, 0) ];
    tempview=[realDelegate   BLpageScrollview:self viewForPageAtIndex:0];
    
    
    
    if(tempview==nil){return  ;}
    if(tempview.superview!=self)
    {
        [pluralPage removeFromSuperview];
        pluralPage=tempview;
        [self addSubview:tempview];
    }
    
    [singularPage setFrame:CGRectMake(0,0,selfWidth,selfHeight)];
    [UIView beginAnimations:@"nextbook" context:nil];
    [UIView setAnimationDuration:0];
    [singularPage setFrame:CGRectMake(-100, -100, selfWidth, selfHeight)];
    [UIView commitAnimations];
    
    [singularPage setFrame:CGRectMake(0, 0, selfWidth, selfHeight)];
    [self sendSubviewToBack:singularPage];
    
    [tempview setFrame:CGRectMake((selfWidth*(!isVertical)),(selfHeight*isVertical), selfWidth, selfHeight)];
    
    currentPage=0;
    nextPage=0;
//    [UIView beginAnimations:@"nextbook" context:nil];
//    [UIView setAnimationDuration:0.25];
//    [tempview setFrame:CGRectMake(0, 0, selfWidth, selfHeight)];
//    [UIView commitAnimations];
//    isJumping=NO;
//    self.scrollEnabled=YES;
    
    [UIView animateWithDuration:0.35 animations:^{
        [tempview setFrame:CGRectMake(0, 0, selfWidth, selfHeight)];
    } completion:^(BOOL finished) {
        isJumping=NO;
        self.scrollEnabled=YES;
    }];
    
}
-(void)gotoPre:(NSUInteger)prenumber;
{
    reset=YES;
    reach=NO;
    self.scrollEnabled=NO;
    nextPage=1;
    if([(NSObject*)realDelegate   respondsToSelector:@selector(numberOfPagesInBLpageScrollview:)])
    {
        pageCount= [realDelegate  numberOfPagesInBLpageScrollview:self];
    }
    isJumping=YES;
    [self setContentSize:CGSizeMake(selfWidth*isVertical+selfWidth*pageCount*(!isVertical)+1,pageCount*selfHeight*isVertical+selfHeight*(!isVertical))];
    [self setContentOffset:CGPointMake(selfWidth*(!isVertical)*prenumber, selfHeight*isVertical*prenumber)];
    tempview=[realDelegate   BLpageScrollview:self viewForPageAtIndex:prenumber];
    if(tempview==nil){return  ;}
    if(tempview.superview!=self)
    {
        [singularPage removeFromSuperview];
        singularPage=tempview;
        [self addSubview:tempview];
    }
    [pluralPage setFrame:CGRectMake(selfWidth*(!isVertical)*prenumber,selfHeight*isVertical*prenumber ,selfWidth,selfHeight)];
    [UIView beginAnimations:@"prebook" context:nil];
    [UIView setAnimationDuration:0];
    [pluralPage setFrame:CGRectMake(-100, -100, selfWidth, selfHeight)];
    [UIView commitAnimations];
    [pluralPage setFrame:CGRectMake(selfWidth*(!isVertical)*prenumber,selfHeight*isVertical*prenumber ,selfWidth,selfHeight)];
    [self sendSubviewToBack:pluralPage];
    
    [tempview setFrame:CGRectMake((selfWidth*(!isVertical)*(prenumber-1)),(selfHeight*isVertical*(prenumber-1)), selfWidth, selfHeight)];
    
    currentPage=prenumber;
    nextPage=prenumber;
//    [UIView beginAnimations:@"prebook" context:nil];
//    [UIView setAnimationDuration:0.3];
//    [tempview setFrame:CGRectMake(selfWidth*(!isVertical)*prenumber,selfHeight*isVertical*prenumber ,selfWidth,selfHeight)];
//    [UIView commitAnimations];
    
    
    [UIView animateWithDuration:0.35 animations:^{
        [tempview setFrame:CGRectMake(selfWidth*(!isVertical)*prenumber,selfHeight*isVertical*prenumber ,selfWidth,selfHeight)];
    } completion:^(BOOL finished) {
        self.scrollEnabled=YES;
        isJumping=NO;
    }];
    if(prenumber%2==0)
    {    singularPage=pluralPage;
        pluralPage=tempview;
    }
//    isJumping=NO;
//    self.scrollEnabled=YES;
}
@end
