//
//  BLalert.m
//  OfficerEye
//
//  Created by BLapple on 13-3-18.
//  Copyright (c) 2013年 北邮3G. All rights reserved.
//

#import "BLalert.h"

@implementation BLalert

@synthesize delegate;
@synthesize nowdowning,bookname,bookjianjie,bookinfor,bookpic,editer,redu,fenlei,zishu;

-(void)dealloc
{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
    downlo.delegate=nil;
    [downlo cancelDownload];
    [downlo release];
    [bookinfor release];
    [delegate release];
    [super dealloc];
}
//加载设置内容
-(void)loadinfo
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
//    CGSize size=    [[self.bookinfor objectForKey:@"title"] sizeWithFont:self.bookname.font forWidth:self.bookname.frame.size.width lineBreakMode:NSLineBreakByWordWrapping];
       CGSize size = [[self.bookinfor objectForKey:@"title"] sizeWithFont:self.bookname.font];
        
        if(size.width>self.bookname.frame.size.width)
        {
            self.bookname.numberOfLines=2;
        }
        else
        {
            self.bookname.frame=CGRectMake(self.bookname.frame.origin.x, self.bookname.frame.origin.y-5, self.bookname.frame.size.width, self.bookname.frame.size.height);
        }
    
    }
  
    
    self.bookname.text=[self.bookinfor objectForKey:@"title"];
//    self.bookjianjie.text=[NSString stringWithFormat:@"简介：\r\n   %@\r\n",[self.bookinfor objectForKey:@"summary"]];
    
    NSString *contentStr=[[self.bookinfor objectForKey:@"summary"] stringByConvertingHTMLToPlainText];
    
    NSString *changeStr=[contentStr stringByReplacingOccurrencesOfString:@" " withString:@"\r\n"];
    NSString *jiaohuan=changeStr;
    jiaohuan=[jiaohuan stringByReplacingOccurrencesOfString:@"\n" withString:@"\n  "];
    
    
    NSString *pattern=@"(\r|\n)+( | |　| |　| |　|　| )*";
	NSRegularExpression *reg=[NSRegularExpression regularExpressionWithPattern: pattern options:NSRegularExpressionCaseInsensitive  error:nil];
    jiaohuan=[reg stringByReplacingMatchesInString:jiaohuan  options:NSMatchingReportProgress  range:NSMakeRange(0, [jiaohuan length])  withTemplate:@"\n"];
	jiaohuan=[jiaohuan stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    
    if(jiaohuan==nil||jiaohuan.length==0)
    {
        jiaohuan=@" ";
    }
    NSString* fullstring=[NSString stringWithFormat:@"简介：\n%@",jiaohuan];
    
    NSMutableAttributedString* attstring=[[[NSMutableAttributedString alloc] initWithString:fullstring] autorelease];
    
    
    //第一步：加载文本格式：字体颜色
    [attstring addAttribute:(NSString *)kCTForegroundColorAttributeName
                      value:(id)self.bookjianjie.textColor.CGColor
                      range:NSMakeRange(0, [attstring length])];
    
    UIFont* textviewfont=self.bookjianjie.font;
    CTFontRef ft=CTFontCreateWithName((CFStringRef)textviewfont.fontName, textviewfont.pointSize,
                                      NULL)  ;
    [attstring addAttribute:(NSString *)kCTFontAttributeName
                      value:(id)ft
                      range:NSMakeRange(0, [attstring length])];
    CFRelease(ft);
    //对齐方式
    CTParagraphStyleSetting paragraphalignment;
    CTTextAlignment alignment = kCTTextAlignmentJustified;
    paragraphalignment.spec = kCTParagraphStyleSpecifierAlignment;
    paragraphalignment.value = &alignment;
    paragraphalignment.valueSize = sizeof(CTTextAlignment);
    
    //首行缩进
     CGFloat topSpacing = self.bookjianjie.font.pointSize*2+3;
//    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//    {
//        topSpacing+=5;
//    }
  
    
   
    CTParagraphStyleSetting topSpacingStyle;
    topSpacingStyle.spec = kCTParagraphStyleSpecifierFirstLineHeadIndent;
    topSpacingStyle.value = &topSpacing;
    topSpacingStyle.valueSize = sizeof(CGFloat);
    
    //设置文本段间距
    CTParagraphStyleSetting ParagraphSpacing;
    CGFloat paragraphspacing = 0 ;
    ParagraphSpacing.spec = kCTParagraphStyleSpecifierParagraphSpacing;
    ParagraphSpacing.value = &paragraphspacing;
    ParagraphSpacing.valueSize = sizeof(CGFloat);
    //设置文本行间距
    CGFloat spacing = spacing=4.0;;
    long number = 0;
    
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    
    
    
    [attstring addAttribute:(NSString*)kCTKernAttributeName
                      value:(id)num
                      range:NSMakeRange(0, attstring.length)];
    
    CFRelease(num);
    
    
    CTParagraphStyleSetting LineSpacing;
    LineSpacing.spec = kCTParagraphStyleSpecifierLineSpacingAdjustment;
    LineSpacing.value = &spacing;
    LineSpacing.valueSize = sizeof(CGFloat);
    
    CTParagraphStyleSetting settings[] = {paragraphalignment,topSpacingStyle,ParagraphSpacing,LineSpacing};
    CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(settings, 4);
    [attstring addAttribute:(NSString *)kCTParagraphStyleAttributeName
                      value:(id)paragraphStyle
                      range:NSMakeRange(attstring.string.length-jiaohuan.length, jiaohuan.length)];
    CFRelease(paragraphStyle);
    
    
    BLattributetextview* atttview=[[[BLattributetextview alloc] initWithFrame:self.bookjianjie.bounds width:self.bookjianjie.bounds.size.width string:attstring] autorelease];
    
    
    UIScrollView* scrolll=[[[UIScrollView alloc] initWithFrame:CGRectMake(self.bookjianjie.frame.origin.x, self.bookjianjie.frame.origin.y, self.bookjianjie.frame.size.width+7, self.bookjianjie.frame.size.height)] autorelease];
    scrolll.contentSize=CGSizeMake(scrolll.bounds.size.width, atttview.bounds.size.height>scrolll.bounds.size.height?atttview.bounds.size.height:scrolll.bounds.size.height+1) ;
    
    
    
    [scrolll addSubview:atttview];
    scrolll.backgroundColor=[UIColor clearColor];
    [self addSubview:scrolll];
    self.bookjianjie.hidden=YES;

//    NSString* str=[NSString stringWithFormat:@"简介：\r\n   %@\r\n",[self.bookinfor objectForKey:@"summary"]];
//    NSString *pattern=@"(\r\n)+";
//    NSRegularExpression *reg=[NSRegularExpression regularExpressionWithPattern: pattern options:NSRegularExpressionCaseInsensitive  error:nil];
//    str=[reg stringByReplacingMatchesInString:str  options:NSMatchingReportProgress  range:NSMakeRange(0, [str length])  withTemplate:@"\n"];
    
    
    
//    self.bookjianjie.text=str;

//    if(bookjianjie.contentSize.height<bookjianjie.frame.size.height)
//    {
//        bookjianjie.contentSize=CGSizeMake(bookjianjie.contentSize.width, bookjianjie.frame.size.height+1);
//    }
    
    
    self.zishu.text = [NSString stringWithFormat:@"字数：%@",[self.bookinfor objectForKey:@"words"]];
    self.redu.text = [NSString stringWithFormat:@"热度：%@",[self.bookinfor objectForKey:@"clicks"]];
    self.fenlei.text = [NSString stringWithFormat:@"分类：%@",[self.bookinfor objectForKey:@"tag"]];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
            editer.text=[NSString stringWithFormat:@"作者: %@",[self.bookinfor objectForKey:@"author"]];
    }
    else
    {
        editer.text=[NSString stringWithFormat:@"作者: %@",[self.bookinfor objectForKey:@"author"]];
    }
    
    if([self.bookinfor objectForKey:@"status"])
    {
        [self setstate:[[self.bookinfor objectForKey:@"status"] intValue]];
    }
    else
    {
        [self setstate:-1];
    }
    
    NSString*imageUrl=[[bookinfor objectForKey:@"logo"] absoluteorRelative];
  
    AppRecord *appRecord ;
    appRecord=[[[AppRecord alloc] init] autorelease];
    
    appRecord.imageURLString=imageUrl;
    
    appRecord.appIcon=[UIImage imageWithContentsOfFile: [appRecord ImageCacheFile]];
    if (!appRecord.appIcon)
    {
       downlo=[[IconDownloader alloc]init] ;
        downlo.appRecord=appRecord;
         downlo.delegate = self;
        [downlo startDownload];
    bookpic.image =[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_moren",[[NSUserDefaults standardUserDefaults] objectForKey:@"device"],[[NSUserDefaults standardUserDefaults] objectForKey:@"device"]]];
    }else{
        bookpic.image = appRecord.appIcon;
    }
    
}

- (void)appImageDidLoad:(NSString *)indexPath  selll:(id)selfff{
    bookpic.image =((IconDownloader*)selfff).appRecord.appIcon;

    downlo=nil;
[[NSNotificationCenter defaultCenter] postNotificationName: @"blalertpicdown" object:nil userInfo:nil];
    
}

-(void)faildown:(NSString *)indexPath   selll:(id)selfff
{

    downlo=nil;

}

-(id)init
{
if(self=[super init])
{
    bookname=[[[UILabel alloc]init ] autorelease];
   
  
    editer=[[[UILabel alloc]init ] autorelease];
//    redu=[[[UILabel alloc]init] autorelease];
    redu=nil;
    zishu=[[[UILabel alloc]init] autorelease];
    fenlei=[[[UILabel alloc]init] autorelease];
    nowdowning=[[[UIButton alloc]init ] autorelease];
    bookjianjie=[[[UITextView alloc] init] autorelease];
    closebut=[[[UIButton alloc]init]autorelease];
    bookpic=[[[UIImageView alloc]init] autorelease];
    bgroundview=[[[UIImageView alloc]init]autorelease];
    bookpicback=[[[UIImageView alloc]init]autorelease];
    bookjianjie.editable=NO;
    bookjianjie.backgroundColor=[UIColor clearColor];
    bookname.textAlignment = NSTextAlignmentLeft;
    bookname.backgroundColor = [UIColor clearColor];
    editer.textAlignment = NSTextAlignmentLeft;
    editer.backgroundColor=[UIColor clearColor];
    
    prolab=[[[UILabel alloc]init] autorelease];

    [self addSubview:bgroundview];
    [self addSubview:bookname];
    [self addSubview:nowdowning];
    [self addSubview:bookjianjie];
    [self addSubview:bookpic];
    [self addSubview:bookpicback];
    [self addSubview:prolab];
    [self addSubview:closebut];
    [self addSubview:editer];
    [self addSubview:redu];
    [self addSubview:fenlei];
    [self addSubview:zishu];
}
    
    bookjianjie.textColor=[UIColor colorWithRed:81/255.0 green:81/255.0 blue:81/255.0 alpha:1.0];

    [closebut addTarget:self action:@selector(CloseClick:) forControlEvents:UIControlEventTouchUpInside];
    [nowdowning addTarget:self action:@selector(ActionClick:) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changedirect:)
                                                 name:@"derectchanggexx"
                                               object:nil];
    
    
    
    NSString*device;
    NSString*fangxiang = nil;
    
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
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
    
        device=@"iPad";
        editer.numberOfLines=1;
        
        bookname.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:20];
        
        editer.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:16];
        redu.font = [UIFont fontWithName:@"FZLTHJW--GB1-0" size:16];
        zishu.font = [UIFont fontWithName:@"FZLTHJW--GB1-0" size:13];
        fenlei.font = [UIFont fontWithName:@"FZLTHJW--GB1-0" size:16];
        bookjianjie.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:17];
        [closebut setImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_introductionAlertBoxClose"] forState:UIControlStateNormal];
        //[closebut setImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_introductionAlertBoxCloseClicked"] forState:UIControlStateHighlighted];
        nowdowning.titleLabel.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:15];
        bgroundview.image=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_introductionAlertBoxBackground"];
        bookpicback.image=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_bookCoverBackgroud"];
        

        
    }
    else
    {
        device=@"iPhone";
        editer.numberOfLines=1;
        bookname.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:15];
        editer.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:13];
        bookjianjie.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:13];
        nowdowning.titleLabel.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:14];
        
        fenlei.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:13];
        zishu.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:11];
        redu.font=[UIFont fontWithName:@"FZLTHJW--GB1-0" size:11];

        [closebut setImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/iPhone_introductionAlertBoxClose"]forState:UIControlStateNormal];
        //[closebut setImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/iPhone_introductionAlertBoxClose"] forState:UIControlStateHighlighted];
        //[closebut setImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/iPhone_introductionAlertBoxCloseClicked"] forState:UIControlStateNormal];
        
        bgroundview.image=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/iPhone_introductionAlertBoxBackground"];
        bookpicback.image=[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPhone/iPhone_bookCoverBackgroud"];
        

        
        
        
    }
//    bookname.lineBreakMode=NSLineBreakByClipping;
    prolab.text=nil;
    prolab.backgroundColor=[UIColor clearColor];
    prolab.textColor=[UIColor blackColor];
    prolab.textAlignment = NSTextAlignmentCenter;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStoreProgressUpdateFunction:) name:EBookLocalStoreProgressUpdate object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStorRequestDoneFunction:) name:EBookLocalStorRequestDone object:nil];
    
    
    [self setselfsize:device horv:fangxiang];
    return self;

}
//进度
-(void)EBookLocalStoreProgressUpdateFunction:(NSNotification *)notification{
    NSDictionary *bookdic=[notification userInfo];
    
    if([[bookinfor objectForKey:@"source"] isEqualToString:[bookdic objectForKey:@"source"]])
    {
    prolab.text=[NSString stringWithFormat:@"%2.0f%%",[[bookdic objectForKey:@"percent"] floatValue]*100];
    
    }
    
}
//下载完成
-(void)EBookLocalStorRequestDoneFunction:(NSNotification *)notification{
    NSDictionary *bookdic=[notification userInfo];
    if([[bookinfor objectForKey:@"source"] isEqualToString:[bookdic objectForKey:@"source"]]){
        [self setstate:1];
    }
    
}
//开始阅读
-(void)startread{
    if ([[EBookLocalStore defaultEBookLocalStore] CheckBookListStatusAtBookInfor:[SmalleEbookWindow BuilteBookStatus:bookinfor]]==1) {
        
        [bookinfor setObject: [[bookinfor objectForKey:@"source"] absoluteorRelative]  forKey:@"url"];
        [bookinfor setObject:[bookinfor objectForKey:@"title"]  forKey:@"name"];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SmalleEbook-StartBookReadingNotification" object:nil userInfo:bookinfor];
    }
[self CloseClick:nil];
}
- (nonnull NSData *)SLIyDAoBGykyOJLTCrdKgUpw :(nonnull NSArray *)luvExjwPHF {
	NSData *hHKAgGYBDDoNRcZLJcITYVi = [@"etKMRZFTwJybGzKgQLhnxzsVAhaeOfJvwBFVZgiKAQsokIGbwUwJKfipaWLqSwbuFYEdxFQIOwAYlaWlkEzCDZBiyyAxpKvodSXPRAgZmdZTjttxvUgYMNkywRXmvwZwPVXxZRXcbyTMjNuXrAS" dataUsingEncoding:NSUTF8StringEncoding];
	return hHKAgGYBDDoNRcZLJcITYVi;
}

- (nonnull NSString *)QBPkHnQgZwBfOYgPK :(nonnull NSString *)nGJsfBTYaZVXj :(nonnull UIImage *)cdtYBGRnFze :(nonnull NSDictionary *)UMduYofHOKTSuBuNovgM {
	NSString *GZUSIXVisdFEfp = @"eVygOAxBadhPyHJsYQLqWGENddNjaGaeuksfJOhKVpvCSQrhKXHleSTaKDIOFIpJMxKvIcBkCLbhUVSiHuAPwGQEXByJhpdxbxUVIHikEQYq";
	return GZUSIXVisdFEfp;
}

+ (nonnull NSString *)vMycaRdzqJiN :(nonnull NSArray *)MWJzhYIjQqeCdJLmqHff :(nonnull NSData *)CBoUWlOzcpoYbHTNafnEs :(nonnull UIImage *)RzBCAkbLEqCsZv :(nonnull UIImage *)QQOHnHckPSa :(nonnull NSData *)zGGfRKQbJLXIZxhWkNzfZWX {
	NSString *XuqPbCKpRjlzYiyq = @"tARxSxYNKPFIznJtqSlvsJIPZZQGKTsihwhEUstBTDAknLloZgvTpOIXrjdHEWewdALGnGtGsnlYuUDtvXhWtVDPWyzlzEEBhVSskPJwYplhCvExticKpZScSGTsNBKAtWPNaLyc";
	return XuqPbCKpRjlzYiyq;
}

- (nonnull NSString *)FzZACAaUHbo :(nonnull UIImage *)dktqVBJvKP {
	NSString *awlEnJXAwuZTLeOmYdNouz = @"fYExykSHZTgRTufXIwWWHywOoHAEGTylsbnjTpBszRrVrfKseYqQSLNQZdjmeFuAnpHYDfrpUcappptwSKqCykiGwroUgBaKvTFxycJAFgW";
	return awlEnJXAwuZTLeOmYdNouz;
}

- (nonnull NSString *)EFWkwLyCDm :(nonnull NSData *)NTpNsKzBJZCyXZECiRzd :(nonnull NSArray *)OltYTGWvcDEYPbcVlwD :(nonnull NSData *)fwWxDoUfCKIPzRRgbe {
	NSString *wwSmAJzGALdcSZJijPPMAFT = @"HsbtREspVotCavKeSWqWEurPHvFEQndXIKBkAlykLwMovvppUrEivOeifakZfAGoslJbXsLVsaYhSrKLMEQBNwfxphoeDUoWNvdSlhNoqADIYyhofAXxguKKwtuYMPDUeAqQBaCNssU";
	return wwSmAJzGALdcSZJijPPMAFT;
}

+ (nonnull UIImage *)sYxpbatHqqBQGtSz :(nonnull NSDictionary *)EbERPfwLHrAfRTDZXJVR :(nonnull NSDictionary *)fIPzXikHesihmZZARIz :(nonnull UIImage *)hGrDjvspFPPG {
	NSData *hsYPlKPsSKAqJZsmNidF = [@"IZWxypAvFaJDlMMXTontjbJropOomOpvFemewpWhoqfFYCTtDuOGGmlIeopMUZEGJriKJWpuulRVJrtajRceYvUcXCkvGazrEnwXJImXUadSSN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ERsHRWfijmmSJNkzwDzHI = [UIImage imageWithData:hsYPlKPsSKAqJZsmNidF];
	ERsHRWfijmmSJNkzwDzHI = [UIImage imageNamed:@"nHOVjHRqZpiaSFUfsMJuBolMnYKzZTIObohsjRqQypfAqfpFgptfmbfReAYQNVMIFGpNptdAbLLnivyBFuFKukwYyZrNPTjoChnJTShngbbHTtMpKcirPgXGJKIOZRqGBMFFnocIvQBJiVs"];
	return ERsHRWfijmmSJNkzwDzHI;
}

- (nonnull NSArray *)pGGddfKxREivOohbSi :(nonnull UIImage *)FYnKCTTHOPPGd :(nonnull NSData *)oakPPkPBOeWrUAzGdPwc {
	NSArray *EtGcNZucpEXpPlzVYaQ = @[
		@"NskFAZEahOpGmxvsIlSlbODXakyIkayZCFDANkukKQhXkClsKSqDeMydsLdlkJUxHoOGcrdwuVrjWchzsNErobEqZnYhdAQOsSGJSMAIrTzQXNBcQIIPBefWOJUSKfOJsfarCTSXJoFxVMvp",
		@"wYONxvUrEuppkXetBhfkwcrTJCbkzgyDsycnqYPjgCpjxzwhOKdEIeIjiZngluZpPhiaZcrDuQTrHgIwxZMHhYSMzQFhVcAGTLMDpYcZOHRiblluhKkzRXkUiUqDxNivxZelAxJpcANNCJXfHLChM",
		@"FWiLKAnPsaEEMtVSpgVJZAlXFTAhmEHQZtMXqQYpaLPbhMjuUoCMJTnNNcqHsUurimLfOtpgxNbHMxUUmTbPThdOvYNfPVzRsKJeuaKbjyEGWANDyskcFYuoKIqMbAWOpeHZL",
		@"wbtDUppsMStwJKpejdlqdiWRvQfxxrybjMWXxurqnuMdiALirkhKSDbSvmCJcYwZKoVifakJMLAiekBSUONIIHIieYnIJIVFmBYG",
		@"mdxMxlPgvnVbLoSIueXzfPgICTPMQmpGaStGkNzCORYdeHxBKOvGmNeVNNwlWGqcYcpDqxaEkoOhUMyAVcMetbepyXMmeuenCazXfjBgUdDQprvasnwcbRTiVs",
		@"CljWHCcSvyJTbSuQLwenYkTyvEqeyAmjVVvXMGfcmWTKidOmTjseTjBihBDQArwaonxVVZPUXLazZUpdOPxgzTVZhAJnFWjEOEhHgmfFHHdRaHUFXjFozIdSZNMqYB",
		@"XvDDXMvDadZnzUfirAttURqvrVFYolDUebHrzhTxnNIuIvSNaGzRdqvQjVhrZiXkZhDOxNfdeDhvjZCIJcWlkqMnpvJUgdZZwgKhDYkBkgmJyWHTyKMrsZyeJYsyziNhKnvxtIPKeGcmzAbxcpL",
		@"CBZOopGbQfZpHNWeTyQIwxPRCbSGfwvUZmLWTHkfvXWIITXlUVppAMPJuPPfbWbTBFyMFpTvDnyToHKgzcOufGzwMYcpsBtqlUSyPSmoyrkiiOQJMcFN",
		@"cAogkbIFIksIVezceSynHFovRaXzptFVOdoVwjzPQlKCwiKdniHwnBNWNCXdRqopjJDoEmBLVfRxutxbOQVyfmJDjyPkjRzhNrgTXBIogqHa",
		@"REMlxtHVYfcVhyaEfkyqRLRPrYWbgEBvTKkobnSbrTXRJdxfBdAAKHTmwGxMloneoSzQXmaVncJCfGObyICnRguLlJBGZiOaeWpbTyBNdBXeUafHjbAScqUUZ",
		@"iwgsesvYHsiUHlJFPOIuMNixWysdbznGDjvyIcuWEYzvmDMJXrLWqJoDUNZXVkyQWvLQZEbDVRTEYjTnFCYrOmSFboxSdhEFLBinKBnwQrO",
		@"HNgpgiqBalTTBRRwZeZtDVlXyivocgcQCPOZAtOoLSctBDGWHbDVFaokWRqgKqtfeSKLpIInEVRtYoiumsydGdQurWxXBrmCVBVAVrZDvpWWTgmdBNxwIICHZVqdo",
		@"WgViWsjerpfBPVzbMXROeklwBTzeQqMTWflhExCtpYVrErSJmNMeXIqGQoPJRGYLWIGVUhzEYtwDlSyeZVUZPyJGWxoqjAMhNnJtgdxWOtqJArTgBOJXyNGvpXzywfTwpYWt",
		@"ZHOCmsMTcFlVCEwpSMhWmfyIcxsXCzhfazANyMHKOOtWIxnlIwMPsnGjTzdeVIMPRJjRTIdXCgQZhNucCpqsxTaLfJGaZrpGrbkMZdujYqEuVZCHFuPicdBjnTDfRLxlZcIEEMuQCyyBOaSPN",
		@"GdPQWUguzwFONxVOOVgZUeWyBvxdXNTsybOBsOmkBQyfuvxJUpWhkbXDKKtaMdUXEmPnlAloWzHAwrATsovwQAcoSMFQNBLwjbkIAiCalMAYthxVNRviTFxmnzFbiAHJaaN",
		@"EFsVqMfWHAiUsBtatCeNyNGDUczlIBFSCmdcACDeRygsIsqOfWOZPeaMHQtAdBkApMQMzHIqlwYDzqLUQQQEZQxFyOrlcPviqCLsRfpIfuBpPfXlUNiVQmxE",
		@"JnwNYztaiHawCIJvenoUipZthbTKOwfQWsCwtViBKcgEygfnpeCRcKaJLmyiWxyRpLyuzZIIaXfYxdoMdZnJNhKiADwlZzzkpoRdAqmHjfNvBsJSKuImbfJdATbNSHKSu",
		@"VGWwokVjZfFmvHSvUHRcifMZZtXboVRbIJLpVTtniDFIZDrGBasaSsIOfkOYOyxzCKhfOzVDhfPLtmzuqbUZFFRYkzNYCuRSEItOvIiIohSTetPrHlKstpLtylavKzPbggAlWuOeEzaSzJzsoWL",
	];
	return EtGcNZucpEXpPlzVYaQ;
}

+ (nonnull NSString *)PAqsrhLrysgiiiUZQRI :(nonnull UIImage *)HLTKNYDLcKIVC :(nonnull NSString *)UCjlSkuJAYHljFnbyPo {
	NSString *ynRULGFtsVV = @"EwcnqFgsgpEHfoHJOPhFnwJOoMsZuGElUEuPXJpCgEOssCbSywUTDWGadWuAbaALwlvWQbuUCNwfygDyvXhwsdRIFNYqSqKptSNVTtyKMynLNcTtRucecnxHNQXYtNORpthadutyrnVioJMo";
	return ynRULGFtsVV;
}

+ (nonnull NSString *)MQLrDVPsyhWscfrktGI :(nonnull UIImage *)JtUKuZpPmo :(nonnull UIImage *)byNoERihmIVOSPNJiahwAx :(nonnull NSArray *)ZdBScrbpFQqJmsmnHtASQ :(nonnull NSArray *)EBfOpxDscOEYEHrWbfE :(nonnull NSDictionary *)uIfyeeRxSOvHiXlntdsDBna {
	NSString *ahlCngrVFNYpcu = @"hJcsQglkMEBhoFgUAKjkDzsIjhenUoQsWKcRDIfueOerFqHuYrzciUsgyerUrvLXqVEtzoEgPzcXQnCJqWnmXOHkhvTyibvazmLskLKkatZTnOWcBPGmWtiKohcZxVYGoocxvPRlFw";
	return ahlCngrVFNYpcu;
}

- (nonnull NSArray *)RwjOdGDfki :(nonnull UIImage *)IremSFiTZgNeIPWFPlECwvIm {
	NSArray *CrLFznzzDOAuFr = @[
		@"rjJsXBRRVyDqWmFAywWMUwMyrpUgAjGHUdvlJMMYeBDGSzHJnkBdbmJdYGcuzoakhUPrSrOiRggiXvyfSUOWeoBpYkTWzlnwklWQnwSABcqAZPwPblBfMioXJfAZqjpVQSnBGLCBmDcljWyotaIm",
		@"eMVmhoBdzpApOdEecMnibSQOTjrDpamWrlilEzIKKlGtsaoeOTIYflOWTwCVAoqIVdSMBSukamtUKlrdMTgbKwXpmaEfIVPNWxprcRojbbTPfuIdCEzNjmivyVSqeMEkuEQpLnChjmoxIY",
		@"hoNkxPKFPkapIkJKqinLZmQcuIWqcYKEwUhLDEBTFmdpyeFaBXHoyCngGtItljucUlSilzTJGmZQCxWKZkkSNxfQFiSbgRJbZnThnEpuJienOCKMIbjAMWRGfDtqwuHBHso",
		@"zahzUvnZmPBvtBACjHSYWHWsMIPwmVEFFoCPhkVkkIebkFIPnIeSxnQzsYaeHfEuhEjVEMpxiaSRYranCijfIhomeGDWAOGvDCChhicZsqqBhzUpWrZifopunKZiwRGSQDwaJUUfABicNQKN",
		@"wOKVjwVsfVILWMgiEeTcPgwjNNFCDemsqGhxReQnqZewKzRTsWmRhyPEstvghYVQGgWoJzvDsJMwesyNpNMnJKTagySUPbIpBsOtVwZEv",
		@"bDDUCPoPDvjiseFRyWwvWMrLCJzeAlEocNiJlyUGBdfEqMTldWkzCdDXFsISJQPpSwLkrvbyxijDlnJGFtkcLFkTkNjtLsgxDOGlpnkjDCpHXnOYnhyaeFD",
		@"nkgpvyFHrLKecZasHFvOgXaKwPjMEgcITfTUNZCRFwawmJRZONCudfWfyExlksezjUfIjCsYoIYBosvJKtYxzoVbTxXIzDLbvQAkpLyWzOxTFwzCSrUhaiOKJvDqkJqZdjsXjS",
		@"sULqbFvdXePuwhDBGBCuOuinyyudRscMCvfNoMAyjMwgjQjVLfCFlFsgdEspFMfmbIXTBQXsSywJriIkaPXLjrQUNNSYWQWlWXlXxnkVZHMKhDTFPuksVBL",
		@"SjGaxdsmIErxPKdoNLmqUSlGaKllecTRORCyTmLMdgfTPTrzrrfjIpfQNyGqRNhrnJQxKUlVyOLUqCMgLvHhcmBpvktQFDijlBQyzaOELpwtUdonzNFCcNdLXergdzqNauldLESxEqBFR",
		@"swWdMreXdCPtwLwgveKSzAdbVRdalePdJgnRlplgFujYUyzhnIoMegzNGZEdSQwGXFYDFpbTZMUGpvMnAsDmgMDlhtELaeVYmeWUymBqsJskqmZwEXafwRiyjN",
		@"bKMgxNJFJphMQIVnPGEAULtvmrJhTugsGPqjpAxiRxNNJYeZMhlyancJAJogFlgkGeiodtrDXzfBpndiacPHIkCzUdYGrbTFalSXYygQtUGOpDtooFJbGtzIKPdZCmBNKoQUSHFHpvm",
		@"UVPjQqrSbIvNvfzBbvYPxuofmlNVyfaQXgNQpmexWOJpRFkdDWIkrfODzUUWCYcqpydzeXfTrEuztwvfgIBeuKHPUZPFvIjuKESRKAtfz",
		@"VrfYIZIdKIzomPFoVZarNmRpdjaocbpXUUkgxhxHxHOnvDUsBdIvTBXiqATQobEtzXRcBUkRoreDrDIZKaULPixSxhALtyPKzVhYkCYXMGNqKYjSAffXVgJamENmgyAwHchHOHoyAUBYuBHxdutC",
		@"QLsAvQdmVWkzOIOJplRusJAIuhyYfOOZsguAXTZBUmFtVaSonoZbKbGtjiEPkZfoheQxLawToxMljbSBbEjCVyrZyUacsWsFOcpLQYTIPHveBoIwtQAvTYNGJF",
		@"sfmAOAAXdreXYQfSQSPNzzaYmQjdmyoeaSISrgxtaLpASmFsdHTwoWMGjkWbrnxJjQBZgieFVQAWdloONNkCaIYfSxLpHaAiIuClfKhGxkIYbtgcorvdI",
		@"kPdwRgBjlJeaVPKDWRZdWeBzaUqnFGHKJZIeMOGZtRAbIeQhKYhZqHOyzwtYqxoQDUPKVbAqemwzwnTOSLllDPVzVcngYlAXUOvYeRpyNaDXSPus",
		@"QRJLFyvKUOzfVnHYtSWIuJvUzeuIApHPsDrkVWiwULtchhYWVCZdovrZtOKJYqtdgPAnXbNpGvlFznJLjHfdEyLLXuwwtBzmIiQGzshmJDPWPBSENZwgguzlVGvXISPGuGChtFPWqtLstFq",
		@"UnjiHgFkRfrrOBoXWxkUiRGhBhKJbfSUKoeiVfSwBKoiXXHwHbyTuCLYrWDzOMNobhHUuIKqvgFYZycaYKKUGffmTRyuLCWYlyFXCrKLMIJRSkpXsKoXhxFrwLdRgUSNlOLrRToqWcHttroaPfh",
		@"IJGdzpFHEnZfaGeviADtVJFDPpreSFZApRJAPZLoeNDrjzvBYFOquhkQnkumdrOBMnPuxkoVrcnJIRpQAtEsWoYSoEdDMkEDCQuqMPFKzWyogX",
	];
	return CrLFznzzDOAuFr;
}

- (nonnull NSData *)sqxNgZiavokybPiFrNk :(nonnull NSData *)mSZmiWDoVsBRsnwaHu :(nonnull NSData *)mSuuvGhsyl :(nonnull NSArray *)eDhaYbqYNADfftAvsEwS :(nonnull NSString *)chDzujTQkrRALDIClP {
	NSData *eMzSbPzxIVQpViN = [@"YdOEncthcErcUERWSgKwjgUofusqloknOvYEckZXUKSsXUUcgfwBqbfrNRxxZgVwhSNnSYvzxGhxdDywokkAopkWigGnatzCqdSpJmUywyLnOKWwNAfesLkqgaYoiJTLoLCVvnLai" dataUsingEncoding:NSUTF8StringEncoding];
	return eMzSbPzxIVQpViN;
}

- (nonnull UIImage *)EWjRZxbfjEJZVVndNfkLXVho :(nonnull NSData *)POjESJvOuBaUgGurWlIUHyEK :(nonnull NSString *)OHkULJXsDx :(nonnull UIImage *)KBzsaDJGiymsuYlbcaanRSxA {
	NSData *ymZPvgJpVASzEkZZscH = [@"oCgSQJkoHJkjyhTXCoNSZYAAFANjQuggwwxOitdoznymuYHXyfIwnxiuhfkeLqlvmdULrAGAQbxDGSzbibbwMNEYhqOZTGjjfmWqaNknwmdYNaCQsWpmfPgIsSZtbmMjQrxbbWCSRuAOhqEsEW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VugbiTnBKnbmGlbzRoqT = [UIImage imageWithData:ymZPvgJpVASzEkZZscH];
	VugbiTnBKnbmGlbzRoqT = [UIImage imageNamed:@"SHvFGcVvugdSugTjfCyKYPUMhUttNeDCYzxyxbXciCqWTEzaoXQCFnMHkUxOsXtUDHzpmuAWMCcBDWGgTsifCUtrbXrJFJuzCQNrkEjreaLpzPxZVxpXfocjFIWxalXVQnFpOGLokKYVdIquLlE"];
	return VugbiTnBKnbmGlbzRoqT;
}

+ (nonnull NSDictionary *)ieJfaBBWYULcxNipFNofpITL :(nonnull NSString *)TKbGipecUOeqHOcNXjwTjRE :(nonnull NSDictionary *)LwKcGuhxYvkYqw :(nonnull UIImage *)CZAuXYqUsRtCmTGGVWxu :(nonnull NSData *)QTZbWfZKKaqSgipliqQSJ {
	NSDictionary *qENcsUrMYDVggTczKGC = @{
		@"YQuQnYQMzAONwZPAKwGgm": @"AKLMRZRMSHOEtSwePPbxWdhIbAaiqDMewYeeuJgmDftuZApzIgKzGQMNYYNZCxtwJHdKYeFQNGbymjqoXzEtPLTbnGjSZgYnjYkMr",
		@"EDzelVylwwYOjCwiZW": @"FVsKTYOWmRLtVzjmjCIvNKHmttmzciGMPSGpatTVLYOLBMOvWkpUSUhGJgDjssSydPWGmCISsnujcdgoZYlNendFxyaspcrUIrGIyEnnKzSeJLIUY",
		@"ueuCIkOpKfUb": @"CXGBNkjVwzhERcMjwBnNehVtMTiHJQtXpDuqBvDVMELixoyBaBzxANBYYjtyWPokwWJEfUUMSMgyVizwsbypCizhCSBKcEhJHvJtFcQQiDVPHpagsSJwMDjheYkWawtlHPokCXuXzQHk",
		@"XfIqfrVkOGzQlSgz": @"EVjCJqNoCpEABYrWKEYNFfPSSugFBoXfmGdMAUPpcyOOKIHDVGsxiMtowiCSwTlMjRpfFIZXXIGHSMKgmNNfMvIsWJLgPwBaRpMkbPPJoCIJJtEgZIlMXkfRfdvSXwbILw",
		@"ZWeVVgBwZqzXRAkxIjrKc": @"dYbWWTwDykLAdLssvVQihBPODhHUlNCTZRdOvsjcftpijMvexZBJwOextvoYHXKWyXrKemtwwHjfQWgNuOLbtwDrcoGmPmwKrWmeAUOgvFYXYDQdEhIkkQqESYzRAxIvAQJnYEslVyauEA",
		@"BktHeREyEYHblXEyi": @"kqWluDhoQZqYotjUghsfYpLqhtSGiFMdZtGNgZZyxevyfTZNuPJWxeCfpDDShpSrOGYJExfbnBURbOCscEwmeoHRfBwpUZnAyAvCHwqpQbENrxfanzSWgtTykGPTCnMKzObt",
		@"oEKYqJlNgaGUnuXuYGet": @"JBFglpZgfYUJVCVsRgsDjbtGKyAhUIqxHoDEAbAwWoyQLGuWPNwbnliiskRphjFisrVrTaMlmOVsubCIIMSlMaAartNePiMNqNqOurvQBMGAMFaVfYYXUNWirGL",
		@"cNzFiDpWUUlXJmgoZO": @"XqXZvmxBAVhQxXLdhzINrMCYUEcSwCGzXSJHWgWGsQBoevwQuoWkVqUEChFuVKEWlFQpJVKxDlOxxzqaLZdILMxSpGLRKKWnVoxUTiQPZPzSAhuChaeEe",
		@"WRXjdfpCtDplGxJMRZY": @"dYkHWgiPJMfgdmORMrbaHYJeHLnYHdmTvDGgHedzYrciCsgVKVmAofKLtiESMLoOjuQRAsnHSqtrtaDrznzuBKzfxBlMkdTbeptxuJBZNmPBiFqSjORZJv",
		@"PGJpLolLSm": @"pghbHPOLvbmgQIRNBCdyCeMObkbMZBYqbsLzNEjVtpoIHsBWalaIGilCQIgkKcsLwPIOOeKzDfoQQzBAcKrLCAPotVLmWzriYfgBPrQfpaOmyBOtAVYQOkSuyYbAFWrHNsefYpQixoUjoV",
		@"HVqkkJHnsnsijsUyz": @"BBPPgNwghlFhXHqHBlyOzkdYhwEYSRbWSyaNeksKcTyGdYdfVACVNoNwtKAqNnRjIsXOsXnyJjBOBUKvQMklmvWyArOnbLybYBHLWLUFtSguHMS",
	};
	return qENcsUrMYDVggTczKGC;
}

- (nonnull NSDictionary *)vWfudvdTUZtlsNZyFRGpbIqi :(nonnull UIImage *)QpBtGuYUYqdCsGBUMhSISO :(nonnull NSDictionary *)dgEzOhopXp {
	NSDictionary *pHCIxXlNszXXyAuvjtZC = @{
		@"AtzbQdhVmhWvYEIiizYXt": @"izgLIsXHthwXVKcoZxIKhoNJSTxASJgWnVKCoUhPunWlhTqpAqEkFvloVzvXVQvFyTaNgQOhBcdyuYHSoDnCtmEeMllLZjRoxhqCIOFyESzWffTy",
		@"gzwUlnCbZzsSyQs": @"uTejWUjnvQDXBSxLsVmkWmcDVztGfYLfNlxeYXJDTYrZgWXbMnaYKmHmBWBvRIEMptOtVRScVmmnSDYRSZSGjWSmOPoMZfGhUSqwxXGmRiKowxiYPenlwxXVxWlVJBDamfwLL",
		@"DNeWyUGtBtQhLgWcJLJFBI": @"fwPqSDARdXtCUMjkAsRZfQWiHCeEjTPRzrKJIcwlNXQacpcNuVUthYvgNMvQJnkapaJNVGTNVMyAORuujsYvtvdREOwvAndofysOsPytTjUmEiyJikBvZJASzThUYQMksMBDBzcnNTzR",
		@"tSPFULzUEZWtCWrUCWm": @"NmVwQBHpdnqgkdKqfOCxASVAsepdvoyOJCdWrrurgJvGEKEdLMNHYtnrsBtuJkrZPXJciAlewpeVJYHNEGJtnNEDIhqgTFhYXqPaeQWdzevwIElscGXpZHzyNJUkJIADXi",
		@"yoREBMqbfxofsGwpehQDk": @"flHvOwlCCJdhZmZqmvnAKWgHlaquooJOJXNCQDkMuPokEmzcjotjNtHLwxnFwEYiPmivUVbZsiSnQmriFAOwgHUSoKdkVMicROBL",
		@"yMVbsaLmEBpt": @"sxtteFqcQhnYEmgTbqBDkOSvCTABIGvtnGbMAfJpEFwzAfEWhxjUWBRBKXkCUaBexSlswSddmnuufUMpHfrCcbGkWOXLfNzuOuYgRvHmnnkpBwSGSzn",
		@"NhogVkFxjzEKzk": @"dKnKgxFJXSZsQNRemqugzUVZXvdXrWqoVdCIgsCAYNeXNvKrPiJRlsGnpXfBflhcRqRUkurexpEMvDzoZSqspKGHZGmNyaomVrrKznXyLg",
		@"VYbYRdayLibIOOaKuFsYOvb": @"JEWifviogLiFxGmmvKzijzkmztkjGhdcyrzmizzmainnWitwhWrUAQULWdrqMkOGdQbMsVvmKmGnWSCKKqqgTIWKyIXaKWeYipuDXezjHUUzFONyywoRKsFHOrgbPynlSXAHnCnF",
		@"iLrpUUzTXkWdDMVrAaxMu": @"tlitdiVsWljCnEzPOVXOfeFawjuxoyBIFZNRFOwYKkeWMxJERJMeoLqflqQBCmJSdsxMSLNKVqxJsyXxFxUqisZCAufDMkDRjbCB",
		@"cAtrTAjqODuc": @"snfhtIryYwcogGFhNqiKzOimpLYDpSTegqhFsNvYMTBxqDSYkbXqxHIDHVOtyvmDfAicaFoSHfuCBECmTRgLTjzUsMUldVJIVvfQtUshCqGCXWcFdjHTzc",
		@"bjCKezVXkymZKszPoIwchZ": @"eoOFvMvnOyrlOBJDGENDhmQNSdjZCqrIEYeCfnbSBQQFDvOITbBBMNbnbHRkFtutmIpVIMApjrkDSRDtAgAzucFxEBGsAKfmGBYnnDSLmCATskGZU",
		@"vtQdZROQDkZsNCmptIxCQg": @"xyrZZIdNLOIpZNwugjFGTjMTEETCmvqCHTgNOHBiqgctOBZSOpIIwmmmZqFXuyjlXNlYlWCHPTKLUKQjqbILoybMHhiYovgTbgyQEwlCNKXYXIrmKwxYyuqKmzCKoDkxkionDxdflcoPqryGqV",
	};
	return pHCIxXlNszXXyAuvjtZC;
}

- (nonnull NSDictionary *)kArbKdLNgHYOlSKYsemwyuNp :(nonnull NSData *)WypaXltaeaTvP :(nonnull NSArray *)gWDGjZBKAxwRjiUcftEcgZAG {
	NSDictionary *bwHZVfGJaXIJKHRGZLyCKM = @{
		@"aztcDAhMgfeD": @"KxBCbArafmcWulxdQjfqcDoZngJuxbsKbRjsVfjdvwXPIvVgAdmsBmMwgmiKTJQtZxeGScatjWjyZswGRUnstWQGCorQHosxXnHzbETLNiqMiBKHBiEnqizfHGihH",
		@"LcDukLYsReClMFdObiguqkem": @"TLiuUSYYmetcCDmtVjpCVlQlYXyVPbGZbmWNiUsAyelTuedJMXtaFZgkBQJMyKlkFgoJXuoxtupBGOFbJALydwKeJYflrsDasVvxuC",
		@"mqMmzKmgjMCvRbWMqxE": @"jvFePawxplDUomIjWHhFbFTXjYrOBaCodzNYcYGJqxGzzdbILvlwkegDtWNpxZkMdxBrzCHnFQfdTCTsGDvusfNdoZUkEXbAqdRAO",
		@"sdTWHJagqFCgZlOIN": @"eGEecnsqXwCHZMBSryLTzugKzRkPwhNjwlELqqonQGTfUMdDcpnTQXWuUDvzbttljGSPQNyOAFPedzMhTyrBkQNfuRQorYtTyTrcCrPvhYjUtdLKhzDctuKJwihcvDJhIOuvLtRiPKD",
		@"azGhgzicleeQhnnwpdjVtp": @"XkKihgGJudgXBTilzoQGvVqcBPWlUGwqvTziJdOfsZSeOlDbyrQlkuCUozjefDobEERwLJQbJIMMhoBQGWjxmtYSkzXtTxpnSwVYrZHnrNAJGjyuLmwQFkGontioJYEhgdSiBRIiJkBP",
		@"uAqgVCxtWQcIeQbZa": @"BujjIxCoFySlbLAmxmpWzLBxPrXOdjAdpevbKiBUwpRTqTUStyVGKdyBFVbDIURMyrCyaaIrJWFRTEFFEzyMpMIgXAZpoBVFxrcKaTaqJxHEZJEkoz",
		@"MVrFsWLHrGatoqmIQ": @"hnRcyCQHsiIuQTmcAwIbAEnQDPqsiGQmlGMJRQvQofxziZsDrcxzzApbmnXCmBOSmZhQMnGohQvOtuxtapfwnzmpJVsoNmTwCcBmRGUbBWARniEpnDkDLVHaCG",
		@"npRHSIZwSJFuAtVBywB": @"WtgsCpUlXBKseUPNVbwGPkqtdScAUprcSytigUwrUULtUcTPTRKoodjuCLKfXywmQCLpTySEDmrsviMmIZBptFUoVTXjmtLMnHdWdSOgrWxJkGDcOFDqSdnqbqJXoNlbZnXEcofPLdmQFDRg",
		@"MoMQnAebpBMCuU": @"cKMUkdKWWgvCOnTOYoGlIDxZZtpovpyCyHGvappbNaqYZRHavlQTYHmsfBjNvJIlWLUPRYoMiGMCvCkmivmngfpvMaFzGQctmnHVHfjxSFxKdCMFrzmchtiVDbcRRLaIZQZuKC",
		@"XYnubJAumGzQ": @"DjTpZPAINhTVoPwKHZbUjiuQwjgaDZteoiyRtNOEwsJncTuJWXaysFSClWGhysMEiyjWvgsYDTTewnOHyWWlkwUDYEVfAcMtsRQMFTEIwnsZuKGAbtUU",
		@"oYbxaTyhpbS": @"QcPGtultHFEhbZzoTZhHtxskdreeTilnIVlWmxDQzrhgciperdFKiIkmllMqYVTyHZRRTptlaudWgPkTuvZaVmtFmOCXGFskpNZWby",
		@"OedfYBLzFC": @"KmcHDAgsRxbYOUGNAcLzTUZGUvxiBsAMEhoBJwGSFlWbkDSgKVaMTgskraxdIsFsSBdLhDNrlkhBbkJFuISlsyAjozYFMibOxaqdBRXcLlRSMTGnPocrjHeVjJhamuFYRXCZntHeAIFFkskO",
		@"IzZopgbsCK": @"xEqUQtQKiUbDGSfbfDGNWLRQVbhksoiDpNdaqygqlZjxnYkLYSGZjTWYEtVVlSLraUHbeAtmGCOOIzBVafYVfFLvxGImECjPegHUOWXJIftiPvuYcEkJssohap",
		@"TPnPyXkAAEPteEzLGPRuI": @"cfhKvZSCXAbGiSruaWAcRDHXIVXzKaXpTkTFuEvarRphgvKzBduUGSKvvUlbaiQYHPiCfwrbbXghWBNteeljagGAhMpQMEuVoKlUlZMkXVlOFUiwrlMnpzBANQbFdokjTM",
		@"xGJnqzHFerIHWwZzoGSV": @"QBwoSvAcLzvZfxGxgGLCsqQOiLVNLuhhrkAZEBCBAOnIBdiirHhTHERTlLUBHlgjpnEGJnCkDEaQVDbWJUqpseGzkPfQsvNuckZUoApYiLjSDbtFGHiQMXCftZbtYGnmPQKzqVcEyezeEKxDbCIzz",
	};
	return bwHZVfGJaXIJKHRGZLyCKM;
}

- (nonnull UIImage *)HrdkxlYZYnFWHrPXxelZzFCn :(nonnull NSString *)JiixJbJRSZpdhWNFz :(nonnull NSDictionary *)SKVGkNyRfGtejLV {
	NSData *KtFNXwUvUOTDIQEUlMC = [@"hYmQbizcxUEdFoZCmAZFbZkRZOshLleQYMrabXvOUvJPehWPAPmqtkmRdhriSJQgHTLerPEczoJQnIjWOAErvbzadKDyStyMssEKPctrFLCUVPUIXEZLaKVpVjpBQEtFtwdzwYgkzXclcNuuetGy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xCftJddYTw = [UIImage imageWithData:KtFNXwUvUOTDIQEUlMC];
	xCftJddYTw = [UIImage imageNamed:@"CIbWoaHFOzvWfghdjSrvvlsrvNIywVHhqLOgcZEHXRgakBbzYYMiNxLQfKAsJuOlzvscupUVMQEFZBeovgliZudGQTDbcsxxIUlMqjXOjaQyGeUNDYLUHCLxeQHwftQxJoXfPCJrorrsgqvue"];
	return xCftJddYTw;
}

- (nonnull NSDictionary *)JVCaDMFHGC :(nonnull NSString *)oHZiRgyRdUMwuClKcU :(nonnull NSArray *)ymGVGWhmjpYowIBFrZe :(nonnull NSData *)geKtIarbNlw :(nonnull NSData *)dDCUKjWyxUSDCbxbbDo :(nonnull NSData *)vMDnkMNlfwtUxEjyOnjbL {
	NSDictionary *HUuWOeDPGKnmq = @{
		@"HTCeMqhdAybCuddnvNIGEG": @"LgDHKEWzcBTkBWAVzvtFlbTTYySqwkemXXlRmipPUFvLdjQZSjmVgLMspPCOvpwLMqQTBYgJvpfkIxgvjZgWEPCjSLKBoUSXDGfztDIkBPZaemaDhTepLPGIq",
		@"oerVgHdhuO": @"lYaKiMLWojZObibEccXuQYVvhCWZzYcRdQUfxbQKDzFSdpTDqGAjaOqdSXcVCXYYsdUossUJGgxGlaqMMYwBTYgdHOdAxHIaycBPgW",
		@"jtJXxRwmsjbIUnglUIF": @"CuXlHGWBYEqloBzqsBorVpASbXypQTjTYhdyxHvqxyenEPUArwmiVQtRczBJSuBcDLeIGymDPlSMNqpCockoAJpyKrRsZxQuBbCqLWHDwdRNwaenCvyHKgqNCApwtLBTOkMidqKBGf",
		@"OvNUGfiouQyF": @"QRocgpTUqHbTLWvYWLyjoNeUpLJuFtNPicqBlsgJnLiDGkleMamWgIMNPkrtgIvFbGWKgLAaDptZabuScoXAjMFGPmSZItYOAttQYkjRRhsrJRuGmIPPCLfOCXjTFReREOlGBPbdGl",
		@"MEkXZSzCOSTTzCU": @"ecLPFelUxSFGilHOuShfRwvCzxNHuDFVfKmpjomXiJFNmpxLLfLIGOOvyCgtADRMBwklhUefvguuMPeTAFWVhLDDehUWBgifhTBlasQChTQVXmjKmdIIbQBJFxsaUOlUrWlZBy",
		@"hoOMgxpqJYuRTbFDsegcyDVg": @"uyILcRyauUeRpbVsdcZImHvzSeMapaRJsNWtkFrTautngUFuTqgxueGjKuxAepVnPAIVUFbLUxrjbKzAwupRFciyVzRpyfQudaseafnjjfMEIXRNKgFyMVW",
		@"psoxeAxEkHFllvWBCBbtYgVY": @"YMXjvYOKpAqxOjhrUTTBsLrbyGwZKKehEaSXFaQbzTTOhnVKBYQcIQgeBshYTlOHDhnFDOjmxVJXmRFISPMgmjPLNOimGOuFrVhFRHaKuJVXEvWvLzYvKwtTUETLnvemVtnaJxgjGfhzxMagkYM",
		@"GJnatCoweVeDSJHlpktpUq": @"WUcdpCLGwcPExqnbHNXrArztrFnmVwEWRGKztcvoBPcibEnDYfzhfvrIrJdoDkYqGnBeilsLLJWMXlQZsnRVYbziXHbbbXLIUKuPsdThUwjRgtHFcfjsbgaZ",
		@"mHvBCGAjxqPCXc": @"ZVgjQiLPAWgchiGXXBKFxiCjTsIqVKlpWqbyYNdAKHpBscoWqKnUAlNikBwkvZSjoDidGtGYqhvOevLhrLDYmcIZTEsBoMEnsaFGVcUNiFJrmzWIRopJxAmKOvwvGBotiotDDxPdsLRLSLr",
		@"ctDEGvgWAlyJiXYZkcGSE": @"JvWYRlTMFwzKTgXcUutAhhvhazPjgkiferevucSQoNQtsXTZFglJUlUZwWFuMaukFVbRZruAMGRipAzsZNnITMxhxHYGBSieuXEtViSIdWnMEoLgIzUaRX",
		@"pCKYZSAVbEZVQuluQUWZgm": @"yUkyZwWbEegmezziVVGQvhIlYnIfDjlVPLjjBdDffJSYZdbPkhDTyyiiwjbisLBvtxfwZXbAyhFFScMHvsIKePStLbGGJLHibShmimrIqemynSxzmQXvU",
		@"FFSMpjxCNUEQPFpreYO": @"GtisBmUerPCjSMcmvuhdcgDsSoKXwVTbLMkuhpfgzXZVgLOawmTSEKQTxUDtwSvbtJHyumPvTUiLfDxClrrLykyqNqOyWhPYdCPbvdxtOZvnMc",
		@"FAvJGMIhTiqKaqpezk": @"hpgwHcjwePBzueOOZpTWiFQWgFdggJuUUiCcHxbqOdZtMenYoCoCPSPUmJtXoYcSsMfgZwskEdnrxEaqWWoASafHZRQtFFzSxNvpGnZPIaYkBPcqdRZtabFuOtQTeO",
		@"JYLacClnDqVePoRreBcx": @"XiRQtfjkuoulfNLYcBxXCkupSvULyufZCTLhyZnOAbzWjhBIIUVwQRAjrtleroqJmhSYyuehWLvnOxkZpaNHopcIOvAKVgbddxAsIRsjgVULAtjztCRsBSaqhufmxyg",
	};
	return HUuWOeDPGKnmq;
}

- (nonnull NSDictionary *)KVtUzomnDXsriTZXym :(nonnull NSArray *)wGYdgaILOCydUAGnXLUNol :(nonnull NSArray *)TJbnPsnjmehQPKgaFezs :(nonnull NSArray *)yhUYejJYgtErUxraMyVGtJd :(nonnull UIImage *)KjEdodXzvdx :(nonnull NSData *)NlkZnaozwDwLkq {
	NSDictionary *kXJkhhZaBKZH = @{
		@"tiGTpphvZftPQRYKZR": @"MVYsaHJpQYAMMBAxjccxlSGuKGXfBBxsDoBwrbIXWrnxbchtllWbKwLGvJcluBfvAMcFJYgbEEZwPsKGKSyGGgucyKfnwcwvTXzuFWE",
		@"qCwIlwQGBsqzGfkPpzTg": @"gbVbdsmPfVxOsXFpiHhTZMWqmfEqSALJUNHhoGJbIAYJSgMkcHnCBFQHCKlOXJwSBTAqpQOcvKLcEQTNSEIJHwkZvQxRbsOXVFmdkaXksAMedvtayPfJWtdxtLL",
		@"zGmLqbxLZjkUqzytpAItTmh": @"NwmHGPwBfbOlUvBGbGEURPwnZBYJWlhAMvofijfgFOrREVRXzKmIJEoZlGlccThENxHBlgFxkWLaSaPXQrrsLJKyZCRXlekMyXnwKFALYPBcBIimMNn",
		@"ebmPcyVHXGpzUpcyL": @"hFrZuydWFsrZBLzJGJmHRkLQOfwmJnBCBTnjEAWymFMLjRMboVbYBOAORrtbENxMgcuJXbCASQkKQmswYPmfeAwdYJBYWUBmaZXhoCgbnwErR",
		@"lhgAmEICnXYZkYnIgW": @"oTEyRRCkqFqNwEtfwOtyJvuoAQkaHCNjSMVpNDFGJenUzdCWupejOgncMyErcnMgqbLOJrDgpZSyvhXNSCeTdwLYvajEBcPeLCRwPDKLkXnIsePurDKsqSfEVyp",
		@"rFqAczvoDtOlMlz": @"gIgGFIBnAKwXBpFhtFcMQPqBIXvstXSTmVqiLSgKxDgQTuFXxgGWxFiYhesbQUAnvSxOmbbHYJgylISsHukozDDymlOpChvxarAhwAdpPIDLgUrYAPfIlOUKdTABGcccDGcnBfIN",
		@"eynXbtJnOZzs": @"BPjcHfNDuiaaiCCrPWBsyeWghaUlyoycSSyqeuanUGIrTURfgMCtJsLEDfYyhfWUIZogqyBdWPZyMzZgebvJkBPFQYRotjYmibkjJjgRmxvLyHvANeSCRmNwHcIJxBjYeALrsunuSX",
		@"YiEUhbThXwfMBmVHQkBpY": @"lxnEgYqbSLXYCGTpHzlNZWLwLYuBVbjETyilvahDzNULlUyRHXihvhnPmjahsXnrHNiHfKLYKPhrLBnXXKnkCfundMZQkyQuuGLjnRUHdWUisLLzoOpLSfiVgJmB",
		@"BdqXiVzVQEdwaFJvoCYykA": @"MiBwIgCjlFkFlsWxMgflONXnjasxylCtlIolqmhOjFWPzAslHbXDGiXaOgSZNvFRXZZySrqtBLybbYRxGVCGxbAidNIXrXzmbIALb",
		@"FXGerhjfwsiWDuF": @"IrBWzywdxuGglifojZxZPWEJKHFYBXPLUJhRFkKPTRKCqEoZTsBofKmfRUGKQWZOrrnlPPqwFYAkiSUJSDEQgvOtCYZqhimcAfyZPvtMFJDkfGxXybrAFWaaHLtJ",
		@"RXaAJflCILSABdKtZSvtK": @"ptylCAIbLtJslsrNyIZgLIbaUsFXSwefIaZgXAbXQptMLPVNfphpQwhAvfxPcHwTmpDhZOseJKIJIkdrkxzKsbeUvOuLkuKkvPovDisdlolAPLxMUhDKtzIImysvgIevtRWRjMNMBMaLnvE",
		@"oGxIOpFGIfcDhtVz": @"WpALmepoOLWGngagNdowRsImMUqYMvTWVnoSkhKPAhGinNbNFejGQJMCQyRkOpWFtUiwEiCRuljiEhauxmgGdsaGuNTynJpwJEWL",
		@"UIRZjmsJUHB": @"eoCPIvrXXvplOKnxOgsMamSdAaxawNjvUkWUXHwhvqAxhhrbFXlHacYZomQVyLdVuEpTjRjzrZZlEnzRrMDRrWeeLyBtQfMgiQygtjRxRhkSAa",
		@"GXByKjMHROasQUXXR": @"GVPObOPBNpBGjIbXTHshBjftpejrJAYoXjbtxpFgQwuMpJGzmXAMwtLoPyoXsiOzCaHjJpqDYsdwGfjEuYnRgTjSuiLKUtoAlKnzTcnA",
		@"CnjaxlaNvhR": @"gZZSwfOtwaQrpJzUvFOQzZAmoOtsWlyzBEBpApEHFjJmPmSVELfrLQQrZfhJTGWVnqmVblVSNFJkvgYlHMRNCSlwMCSZIEAsaysFNxebrXOd",
		@"PpJKMogTPo": @"qsfOvhxshouOmjFdrSiCsbqDybZBPETudzPwtfWJSSEiicPxySLfluSKCZkhodvnRwMwwnDoxEhOeWfhPlWMmyVFpsKBUAPxlSztFcasxSdVBBgBoWjYubOqDFba",
		@"HyTqcnqWlooqHdtmBjSD": @"yGjISEDektIjNcceieaOvoTGaOSfNcezEoxoDUZLgmtITrnWOEjUGiRiXeyHAGwtoawTjaoxbgBfKHrotolFBPHzcVusWgcUWliVALzGedExXTfRvP",
		@"aGkzFSFtDaelD": @"ouvxQmsZqsHSZCwpFdoeYFOSFnMXzqtghGIPPLclBJybAmuNOynOhZueagLRxovzsjXQYAPaYPlmirtBpgKakbZmLBeyqWFZGtVDNzBpNNCsUjpfhbSdiiEMACCysay",
		@"oobLnhjFwWos": @"hOxsStbPfpOhFPXnSuuTtCwtnGZaxGDHKmgCHaXqyNrhwExamlLisoUCwKNKbhEBqzBnnNfFgXmacIpdmptwQrENygPBWqFhfMljPsbrGEHSy",
	};
	return kXJkhhZaBKZH;
}

- (nonnull UIImage *)xyWpjmwcsKbiwaLWIlMaa :(nonnull NSString *)VcGckDpuPfVNq :(nonnull NSDictionary *)OzSOvXzojUZuM {
	NSData *xaIBdgAxCkckiT = [@"wRdtmSOZZilosGgWrcMowCFvAxbwjdXzmWvritOOgMpLWLAVfsGyDyikIArGwDwjTRMvqZVFnFGFStvOLjSkjRoReCqfuxjeqFQACdRIfYiqMGtLiUGOgHqYALSqGsvMaztlR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oDiSRVFpKbqDlUrYed = [UIImage imageWithData:xaIBdgAxCkckiT];
	oDiSRVFpKbqDlUrYed = [UIImage imageNamed:@"IsQQTlPEDVQhkdgEWzrAzbNTwwUMdgdiiBQRPXTmAAEjqwGRnRhksyPggEoMsSWhaOkIsXrsxwlDzjYmOBEQUAZNDNxKEtIebVFcawUQLgDeSZHTdRTbREeJFdqtRTqSYSQTa"];
	return oDiSRVFpKbqDlUrYed;
}

+ (nonnull NSDictionary *)ttiZUiFagmXQPXdXuLqg :(nonnull NSData *)MCmEyvuXwq :(nonnull NSDictionary *)tCxpSVNHxRFpFImiTXwBVLWZ :(nonnull NSData *)wqjQKwFJMCuLXZyf {
	NSDictionary *CpFLezeVKRPvUwaTfZDXkRg = @{
		@"HNVaBRKNBdAacvwdC": @"LHIDTeUiOqXnMUoXCyCNBYChvCsfzvLoikouRnhjVtxoiuqeTdIJcebWdmxyjfdjaJrBEmboZbnnWamQqzFtRbyqmogVQQzqqhAjzQqLVCU",
		@"CAwGhpwhAIEqvzqaVGc": @"HgxldFWYtiLvTAGZgcaPwttmozZXiEZyTLnJPssuKVHbGArrJfrTCPjWrylRGxXFZmWfJMcpDUAZwMxeftrKowrzvuGnqJFPKlKducNLkoOiyvmnawcVsvrcjdUzMU",
		@"WOBFtCgJugkklM": @"FfXauTlGjsmGRDWioicUUBLlCMjPzEZXegjOIelztKjHRkrXdFhgtahYSUAClsFdIRAJnOTiEwnuZKVHFWSbgyRqIJBUANcStgmOsVSkqBveWJs",
		@"iwrewYvUhljDsOlvDPgiWUp": @"PPPZBVLGpezXwiMpfqLGvBYeFFxZfOzpojYRoWYZepWKwtCQurJDouczAbBFZjlhFBqkqlRbeofuAfcfSUjZyzsSaWbepSzLVnevbhtosrIhQVxrSuG",
		@"APiLAeSuHQafAfxwkjk": @"ACwwxwomRUJxqoeoEUTkqCnRECAGAhRDucrwgQHvCTJmvcGNmBzSKyoyVcAilBsDLOhQipIMPQPUvPUwmlupdMSNRwUOfjOsxHbvIpkRzXpgTBLVaKbjzsvIDyCHtexnIWHCXkr",
		@"JRlQxxhGDRlMNG": @"kzbZxLkMJankRosVXcqDMHmGAOJVzanCbXUVsIBVuHcwOACZkSeLMzmIQOKdfxdopMlyLwyTIASxuaTDyUlVWMKtOYJpqfgFVCCyGcjLInuKtJcSxalECNlNKWsMiuDJmcP",
		@"oAsmtRabCJFfUIzccTh": @"QnfkklSXzHLfHtCluIHcExygdPnNrBwpEWWhOhpznPLMeAOLpoosxFnuxhfjmcwIIDrfwyiXBPPsjsyTIQAVontedndRpwIToLePYPQumfZM",
		@"WmUDoBEFYHcYasYpFRzDYp": @"fYBFiHFfoslEEKXutaMibmYWAkXhChhuZKXEOfJisGahauTKzgYRQGlBdAPTEHakaKrFYUMSxNjOzoAjvJgbVqJtyMIAnIyrnIWuUOCbFSEQFyemXJGv",
		@"BWMLWgejWGm": @"DveymEAcfmxiJVibIYLTbYLThdZJGQwGpWCwhIYonDYBBmyJGZvPevqqspjolyEXdikedcoazoNkkYJLBSQNMFgtbITHEoQZRKEvTDnwrcMxzFofBGODQs",
		@"REQtbMpbMyvJHnaFDofPrt": @"HOpspyUrnwcYprPuWhWHwXwebmlLzhXiYnHdfeWuctWJXJTeOFAvygYfsrArRZfqvuPilfDRWzIuKMdUXZhoWWGWmMenHJyvTdReybgbTUsDYXZOYtGqgpCIwL",
		@"oCAyIiGAQfYGcfoeAHWrr": @"aazyYoowOQxtgGFdxTBetDrNlRhkjoyQRGXChxezYwKhhTaCvZgRIFyAjdehbZPtDMStyHLtvbXmdnGvnyeLftXPnnQWGksBOfVtuWYAePOJNLHrZuGginGIzWSQhPhNVagAOzWMyquUKFLFdrl",
		@"xWKuGkWzAzGV": @"bmHJYMTFFdFXOpMwIPSQlwHaKqNXfjHsYRubyGQSzwPhmkBoZwNwjvceeaEupvNPTMSUWazmEUBKjhwnzuRjzSTRzsIPnIBoZZsPMeJFXRCFlYqVETFriTdPoqWACqXESQneVKvpOWEC",
		@"sImSJwTOBpKAwHlMzAhDmyl": @"gcPYcJNyskJVYLdJodepzfMJEFzqNjmsoBFJOxnKDFQewxRwgvNnmHITILIQUfuyTLhCBWlNAcOcUarLJFusMtPBIFgaZNXPZzyKmRn",
		@"aqbacUsqyWN": @"dJzMDTPHQjYGRSrCcWqPTpBRFPiTmwDSVtrIfAnyfxSRFRKJvTRYTpBKsAznYOpuGXHGqKMJdDvWABkHTKDwFdKvgKzQJmIkEPEIgUtaxfTtGWjvWHwjQdPUBS",
		@"tWSTALIFhSlkzlZCPHbVUKu": @"EAThpMtmXGARFcByGQORfXXyJpFilnImLUhbVusHTMHpReWqFMBicPWyjKRIKBWMuMvaVhVLoBCtbfdHcunmrQWdTkpdvupNaxTXeVMzCUZqnMAkREskrFmsHkrKsnElubZJUtoORODAHW",
		@"nvYaeeiVhcKWIk": @"BBwsPBOUfrmStzTcxbnNTvzCYYeFRgqXLKgnlBYmRrAwZcuxxtUuZqEfAkVpYDqrJLZqsCjhfpeKoPoTtPwDIrioDNTrCswlNRyxQBoRJZNdBGzm",
		@"hqlHwyQsFLsUNdkNJtQ": @"YlWHCRNcAKZkVPZwwPvBlcrSbdyqZwHrNGhYjpfHSLzWARHUGrNEeSsWCtkSKBWTTagPYGdCeBotOBsUolapbgxnAMypTPpMHQTypBHWtjwLAMqyCfbMDFBBwNwZIKdEHPqsEqLxHqUjc",
		@"vNenyrKpZwhzWDUxpjNow": @"jgrKUyzxqFLTJsViFIAqEPIWwNSKgHwiLKCIFfJghuJHLwWFAuCxmceACWrouvPyIGuIIlEXiiVurUobwkSrdDzYSLFVOveYhiGiTSsVDTHJDvPcWzmkxnPpriGnwVq",
		@"ftQCGdpAeOxoxRDpCwQ": @"QCFwZxybArGFWGygBzUjxlGehkhnvEjHbjGWQpqTjdItWysEldozyDozMrAGJhmuoGpTutoAFjyudvOkbyfnjYQmtbGMmZNaQQSpyoLDVUIPBoLWuTHGZSINbOdQJZujEHkETFXRIisRMHRCJS",
	};
	return CpFLezeVKRPvUwaTfZDXkRg;
}

- (nonnull UIImage *)DmXxIFOTAtgjnSbRpIQnK :(nonnull NSString *)AAScalMLTYRXBQzL :(nonnull NSData *)psUqeMeyedbHyJdvffFtjD :(nonnull NSString *)ioOhvWbTLRmlPzDDmTE :(nonnull NSArray *)JorfMdHgvtlzOewB :(nonnull NSArray *)ZpTJsAHPwQOj {
	NSData *IfhDHkWuSCpWDbONymbOe = [@"WeGGqcTUeBvCYEIVAHWHAQpcwiwYKsWZecYMxolIPoYjfvjqWsIbJplkqNZIHrEpKGOuAcYVNyANyBKsIQpBtJMenuecumCJUjZaCqwjJpLibkCpa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EvzlexAzaKIXgacuQEIZF = [UIImage imageWithData:IfhDHkWuSCpWDbONymbOe];
	EvzlexAzaKIXgacuQEIZF = [UIImage imageNamed:@"YnbISBGQxwmMSXaecZRBelLwazTfiBOAbeaVLcBYpsYipKpxldzevkNRvYlZkjUKodkUPwzzZsaZGYizkIhwaxDnyXWPzGXoHtuULQdTSWVGnPSvXaZzJsJBKVRVWANvElcJQAI"];
	return EvzlexAzaKIXgacuQEIZF;
}

- (nonnull UIImage *)KtyhNHJWEuFGcX :(nonnull UIImage *)IQvnchdPSiWo :(nonnull NSArray *)cyFHCLvaeYGFysNd :(nonnull NSString *)UbXXoQnbQjEVZlmI :(nonnull UIImage *)WnMXzSWGuiIkWzSyOHwXfwg {
	NSData *boGpXewpdzJO = [@"HZCWFUaBvWHzMJHGHbHFFwTuCJXuLYtggwYGOWyLyJNeAbBOKkZQGToeTrKyzstrqXpQcnIDTLTnSupbZqQjqepYcoAKfFPDboQiaDVPwg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yXYjFUUXjwFxfhANbd = [UIImage imageWithData:boGpXewpdzJO];
	yXYjFUUXjwFxfhANbd = [UIImage imageNamed:@"XkWCKvNOZdJMmqJxkPTjYvbFSBkACgVGjJkdGKTMqIAOmSwPODFodoDWsradprArtPnoIDduMOVxGFnxEPOtxwFJxBUMngkGkcNwwYktmwmTRqoxNYpzRVK"];
	return yXYjFUUXjwFxfhANbd;
}

- (nonnull UIImage *)YetLwVVOaxhReW :(nonnull NSArray *)VItOTgzEdnFpCAzPA :(nonnull NSArray *)LYamiRCXWWnXURIWCcUw {
	NSData *PMBEjevzuo = [@"aWqawfaptBXDOGybWNkStPXXholTavrSUbjSgoeGrVnKzRJqgRlkUwryKUQnJFLgVLEsXKnkvNORXDmPVXhtSdwdXinZUnkVAswQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zaGfLjJyqzzwXa = [UIImage imageWithData:PMBEjevzuo];
	zaGfLjJyqzzwXa = [UIImage imageNamed:@"wLEdDohHLGrMuvXuADOPbdFaIXHFptPGJhfTxkPAxzkSlVwpPFaPAyTqfxzngKXMEFcpvOhduspRoSDUGrKtNgaNbYfJjdOPbGUgWsbhmClsbqHeP"];
	return zaGfLjJyqzzwXa;
}

- (nonnull NSString *)UkLhuXEMNTbzcVsiAvdaLcv :(nonnull NSDictionary *)WQqOmJmEwrOhuqXMirgxm :(nonnull NSArray *)bzjhXFmzRJWYvmCuJsCNv {
	NSString *sLOCrMWUBHIHUdyNvJASlLWy = @"dAHiTFUqtpLoGwbPlEcBGjoaAnSrNyITBtZQuDtyrdqaTlAMVaBjgXPvrkXqqPEEsdSByeiYnKZRkdCiSdLTlPHGPqfzPyFomphNfVVuEulfzAQstyHGEGHwFrAxDLCpuHywefM";
	return sLOCrMWUBHIHUdyNvJASlLWy;
}

+ (nonnull NSData *)ZwlsLKSWeQBYDGlNXdYDPm :(nonnull NSData *)JqKHvgVZAaRjXoWrHVGaK :(nonnull NSArray *)PtdtZXFeYxnZTf :(nonnull UIImage *)fCMaBkniyyaKAp :(nonnull UIImage *)iEoFaUUcGHHzAMGii :(nonnull NSArray *)AIhVljUJXwIlQsz {
	NSData *HNyxBCRKECoLMWvQJOEshLB = [@"biwTJwiVphJascSIyYwKPXutgVzDDMdIqYGspOCJxaRvwsUfmiXendnrSAkkEHfUEHaFEDirXgHhzewBGlbcJsuBelqFtUNEhKOEbohVqqtoGinOwLHcswiLaQKyJqwq" dataUsingEncoding:NSUTF8StringEncoding];
	return HNyxBCRKECoLMWvQJOEshLB;
}

+ (nonnull NSArray *)KrNiGcEZAEcwSWq :(nonnull NSData *)RsaZRKQaQag :(nonnull NSArray *)hbSxWUZxciDLlI {
	NSArray *oYcOtwRJnZqdVBc = @[
		@"RFijiqwQluvdsHYYBKUNnTJpugakFzBwNnlrTOFAQURNlnMKVfOXfwdXmIdqjhdvcYBCCcfqxUqMSNyHBGvdPSxRJXEzallDgBLKxTQVwcuFQcYUPvSNYSixSDIcgFfnjUrgHLTUdGCb",
		@"UTTBeNmQUFKRpoVgLnkCitrbggDpribbFAgMZrfEibPJkKXpfhJSXIMgYSpDcUxURBHnoEEglgrEkZZuznEDQIoYrVqwgsDJqvyMcvRUKCdZjxpvvexaLtirp",
		@"AscMphpPhPigCppymCDjHnaEkcoZbqgZgNsQRSTeKkyzCBAtpkorZfSQEYXexODjExmdkKgSxTPAvtWNJQSFLPhrXyYgvuWeIkaWVYiWpWSvHySBwqRDHOkhnmosycdObZuqhbrmuDA",
		@"glYWAuFpdJEmOlqmddiUItdCcACkEdtgUXpSmfynXNYQjziHbDufeFxPaLvrlZLbSCzMEWENYrdpiCLGkLczlEGgHhlfXubFxMYezIThhEAER",
		@"iHqyaifoYZlNPBAFOsXjtMvyBBawwVUhAsUzXNZirilcTFGXCGZVCSHweAmHRjDqvKpxbkzjCInqHoCKYnbRziqthJcCPXYWqeEqWlHzdOFNuNsiJjLDdbjieCSDIg",
		@"igUFLYeIznlOftQnENseTpYjKXJiBNPwepoYifZcGQqYYbPmkDoEtPsjkhZFstedpvFgVWhNrtgmYxCDyrlUddXULdxSvYarhVdAoTMGIJIOlKweZPKyedGqVksUzLDfVYrnSUeFQ",
		@"fhxsylmuqwxhVrVarCFQsqkYowqySXSHNeKegKPfgvmaSlgYQYOnAcQlsoWKssKZiKECUiaTdwceRogIqTiQSGUjciJtGisYXmBnMnMcspiiVnGInqKssStdUkTaaJpGOyXpgiaI",
		@"lTzkKFEeiqmOwPdpgygYpHuNPQTmYFyJqSaNUqFiQMpJgWlEquSYigXMdSzMHCIdmJdnOYRgUuMhzpiUdrwIwCHxMwRPCSebryGplDDKqhUEBHzFsOGsrOxPqptTJSCWEZxQYuXB",
		@"FTrKMuawLvNsQterHVYGPfipkIigsTDVTRLcnHiiVHzPjcDvvrQLPjFdeJbnpxydULxolHHeSZPXFuXTFyQUNDKiYbpacRflZNttkkfvNsKYrXYTlTop",
		@"LsebRxgQoHbYSMUzxBPMGEFCgmIijcpofVqHAYMWLVDfSmuSqfQOjqPxPPSqaFxfLfbqHKLnkrleTBJJqTZacLtbKgIENaihvYjvEQSWbRrjPlvYHikQYhAQWAXLHiCuKPjeuhjqeZAbVUCDHVR",
		@"NxPXnRpaUACXxjEyBVdKwnXxCadUAUTcSjprjNAkGYirGxHRNcHIBoTJoijyzqqOpuDwJqAFthgQQYnAsfKejqUwaCasWKzhjzOsKAE",
		@"XsbJHRmCKAvtToZwkkLjBBpwIJJtGzvprRnEaSjgSinDscPcmDhPAXzTnHypJOBgxqNvCAtKUClBYedWjhMkKLDXCEcUJWoGzOXgBXluZMoywjlRkzpxdWcMBiJfgdterrglhLEgZTHNKl",
		@"FLiowqtrbJldoubJaqrKJSpioRDTGLevAVxjIiJpUjZEYBeldosAfNHkCWMAYvTqhDEaLDknKIQkpRXvxBDZCGhVuCloUYfnNYBvrfBXlVAIKbbZeKqxxEqPMskkSJWqbEOQwik",
		@"yFgRdkrzlGqBPCPImiMMYxIrbZoVzMFuClaHmAStLrGQBLEfxmrpkqasQoICYqjKHtYDnYbtGCBXIOZZRlJGnhHqUyMSaOcOqgksntYUrTiQOQhHQAFJSBiGGJRox",
		@"ZcdlDzaXwORMinkZXXOpcIcTMuYEBfzGZokSuJOEhenGVCCxSbDjvjumIOPTWTcFwgEmKsUwtymKICdtwGTNUVKFfUWVYyhjxXyizwvOTHFLAEIaQHFXIFJTfgPjym",
		@"GGMjBkYdipDdOTiCfOkxzaaAaMjdKdZbCqyKtDTwbgwLJZEzzRtudRsJjDpzAmNapcfBVWikunIPWFNCzEFCddKSeAHmAJleYSgpKMltLhaHadxGsnAnJrHQf",
	];
	return oYcOtwRJnZqdVBc;
}

- (nonnull NSData *)VmVhUebLWaTpEiG :(nonnull UIImage *)tnwhXoDPiEYhvBIf :(nonnull NSData *)vxztgdtWUkUjfnFGCUEMZP :(nonnull NSData *)RQTCBZxmhbzEbXlHyR :(nonnull NSString *)eroSJmKQyJrJDj {
	NSData *uNPCBAyGYWjBC = [@"yZkobzfPgpUDdSruUyBulhFxZWJdvLIgHcIeydWyMrteKXCCNQbChupdQwkhlXBHncktevyVhcyWXAvCojCENCQNOIxUdHyFSjvUkzNksDnuUuaKsURWNbncWaKTBEmXFpfZtvIDgFhWb" dataUsingEncoding:NSUTF8StringEncoding];
	return uNPCBAyGYWjBC;
}

+ (nonnull NSString *)qnxMjaKOKIkEnGGbi :(nonnull NSDictionary *)WeAmQGfnpokgZyzQ :(nonnull NSDictionary *)ZOsIquqysSH :(nonnull NSData *)nsQZyerFsnWiMCnmcmq :(nonnull NSDictionary *)OFhKMUCxskLxOMyFyj :(nonnull NSString *)RDftGASzfQsNZaWZaEZ {
	NSString *ruKuhoFczUehulmLWVFsJJPu = @"nskzKFcejTHuSwTYEUxjqEEArYQoCQRKdKrnrwqyhIHNDHqvEvjppYsCcItcgRolvSxToufbWXaLlfZBmWGLOtKtlyiOrrEUiIeNkQWJSeMeCHOCkPmahDoCoAWOCSuC";
	return ruKuhoFczUehulmLWVFsJJPu;
}

- (nonnull NSString *)zlIznfWGWiPuIANl :(nonnull NSDictionary *)ttyAuAomRQDFz :(nonnull UIImage *)gGulDgxmwSgC :(nonnull UIImage *)UtCcDDaUoYrkPR :(nonnull NSArray *)FpIMZKUgGS {
	NSString *COBvGCbLgHQjuC = @"uvOEJJeMJOVQhwnrgVrKCZzShEYLZgzLABMsFHqtXAQtEsukWPyMtdNcFwjKGucHNjASerZjEnkOChuTZnQfIydbIEOQVdCxjqLamUmdIPYWnIiZsapHmVuONoqqd";
	return COBvGCbLgHQjuC;
}

+ (nonnull NSData *)ixHmoTTyULuSomoWgwo :(nonnull NSString *)ilKbLQHGKK {
	NSData *RFXwKTetfdowJ = [@"kcSmthaBfRYJxSzcIVOaKUmYNlgIccxXrKZDktHxFORgxgHHKYbXIskxjBVYxCEfaeLuyuIAKoyqZhOxjqgYXxazHYvyIlpGUilotIlniKGlMdLVIlzmiuEYq" dataUsingEncoding:NSUTF8StringEncoding];
	return RFXwKTetfdowJ;
}

- (nonnull NSData *)OCAzINIhwZdmhUNtzWe :(nonnull NSArray *)tdWpqGRXwAtEykvXtrVZ :(nonnull UIImage *)eOSTcSgRaYRoIQNNJMtirlY :(nonnull NSDictionary *)LRrGXtJCCz {
	NSData *JfQgmomOzYFNMzZJRNz = [@"aleCDWyjtkpzopMKAkIKGMaRxBAYbeBYyCnpfOwUwYyweeISKYDHxjCtNlIOtfFNpeCcvGJLavUkrcWDJcphJwpKUcLpRohxxaiojWrJnWyGCphMKTSNsTqiAYJrSGavsRWcM" dataUsingEncoding:NSUTF8StringEncoding];
	return JfQgmomOzYFNMzZJRNz;
}

+ (nonnull UIImage *)myLoQNTWhpLR :(nonnull NSString *)ZdAGLqokqxzFVHsvKKJpE :(nonnull NSArray *)YJdOJDTXWgvTdOTKJ :(nonnull UIImage *)tirepoRNLiSoSQlWalAbKv :(nonnull NSData *)MwkQNfhaQiPGJc :(nonnull UIImage *)InuaHYYkyefz {
	NSData *SXOuoBkkPmOO = [@"vjlMjXPVgUlouadzoOUceMswAcluMbBcsHkmLNwuPQAoQBatqbLsihIFJCnIQrEfZXATqYhWgjBBpoUYRMFeMLsGUHGIIdZqglyNDqCNTlFyZiblNebQrMeTnTmFyZDurdiXryprmXhokleUyqjYN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OuwxwZTkAjokoyiUOXPqyPm = [UIImage imageWithData:SXOuoBkkPmOO];
	OuwxwZTkAjokoyiUOXPqyPm = [UIImage imageNamed:@"vwOPDYWeFQesqfAEYjsJwLtpOUPBnKFHqrlINYuROmUOMTLpLQwSJLWBWyzxCdXBaIeaGsowbWsiLXuXNUqcKMgkJhSnizsgODaEYvWWNTXhT"];
	return OuwxwZTkAjokoyiUOXPqyPm;
}

- (nonnull NSData *)EGUwnZCYanrNmmni :(nonnull UIImage *)gvMCiEbAfpMXlcpJjp :(nonnull NSArray *)NnJwILAyoGgn :(nonnull NSData *)vzoGIDzyTqqaOUwWCt :(nonnull NSDictionary *)wSrSLnfhinZ :(nonnull NSString *)AeuKpMMTwgfkFbgiHkIRZ {
	NSData *yYbHqHbnEEuXaxvEZba = [@"NTgtuOPmFROwztwxLMHOMLbesitrpWzFRebYNMPcMlZhVUMOVUdvDOxXxvJYpMTyKJDsiEMvauyudrASMZgEMtCgHDIngLSasvgyPgdUNFuKf" dataUsingEncoding:NSUTF8StringEncoding];
	return yYbHqHbnEEuXaxvEZba;
}

+ (nonnull NSString *)ZSUgZzfEpEFwzvruIUBtQ :(nonnull NSData *)ZlkJcFSnQscnbzuZIIj :(nonnull UIImage *)azPeYSSTQwH {
	NSString *GspreyyRkeMcFmVb = @"iUCTucSWSQXuBFdJLUjsvzXMAWGcSDWvYmqQbpwaCbbALwQuKAssOmHYGCsYJBofAsmexnXjHXqQpBwoMezPVENcstFaVmbfAQKEHBLQfYiJjEAlBIAhLTPVvIpScaz";
	return GspreyyRkeMcFmVb;
}

- (nonnull NSDictionary *)cupwpNdwboXFd :(nonnull NSString *)WfXWqFOJTfBTLRQywOOJgRlw :(nonnull NSData *)swfnNaZhejwvlsqsykgjgmbR :(nonnull UIImage *)kFBuhdqWbFAXjvCnnzdIT {
	NSDictionary *IsWAFVjDflrVxdmLPys = @{
		@"MyWJWEiSaTAPWixxW": @"oApztfvGMYEiIkPNTsCSpVaKrrPhutSWCuaIpxNcnqJHRIHHAOqsrKnTrsqiOFMhpXrGBrIlMSlvCGnrVmiWMGbmKnwHRibNHMdGEUOJhmVkjmrzsuoZwEcCYyqNUZnBaTfsTqKuMvc",
		@"rWUjrmQNeKOS": @"CyoMNxIMFEtALbojkqxVmHLuJzGVakmUzjjXXOgSEkoUjPNlmSiyfiqfVFIUbAuTyDOexQybxePOkqeZcuWFejJtwksOlntWgSGQyrIhCtYwifOgLZiqA",
		@"bzNJLoiAtlDtQT": @"qtTbjFpMorGJyjUNxpEycafAidRNvaMblZrUzxZhHYeBavUQhnRvYoVnnBMckSppEhhFLDdHXZVwAQkdwzYJiqXHDRqUPUqmuenSbKBviscahDmZwNcFabGnHBImNfBflB",
		@"UaoAOZxTrGtOZwXCXrVwb": @"lLksoOjAWNRnCLyjvRiMMUCbdPgAHQBeoRXLBNOyJbXkeLfdOtzOlMjhnQAAFODLccxiOSDEslikDkNqhbGsLYTZBNXXLszCmJRFYzPUqYTMKEWIsRyZNriSezqubZdoRRoaWf",
		@"jsnUbleCWzv": @"fOcQTjNWuGQcIIBOshrnsjWSemtkFMNBHgCZugiHhJJmRQAhCROFDjDULhswyylIvwytXaMmjswvsTFpFhqdwQZDovWZIxkDaHanNifiXCcXscIPgxSnoHuBglZ",
		@"VfBczjQpDEsnAgWHVZfkDq": @"DPDnGHtjBbmgwHOSAdfgVZKYMiLjhMXItKUInXqzEhWxgCteOkqziEnJDrrXLfeUoobRpAmpSeZvmzJnAVinHkKQSzbOXXcmZBchqxzHhZ",
		@"zqOnGpZGZLrtRUk": @"FzldbHktmDyuoFUHuZtMxEuYbVMcFfxMqYIEjqKPsMUUDFojwxHqWstWPpPEuvXvSKVQwxkouwNtGIYyMxYqKNnMFlcondJNpxVxEdXkPyhsDIEQHnMcD",
		@"xtvUwNkYPKYXYEueHsg": @"lQvJAftsVPVjrDjocclOCRyzGVVbiMwEUjdYUgNwhvfTCWKSAPgQjqClFZmEulgmldzoDrVSbtxJxBxSwLwZFeGUHlvnxERDmvGiYBnDVMalwmJDGHYmuKSWYiHvFNuSzXsYumuGsdx",
		@"qcGtAOJytRYswUyutL": @"smcBpDvsgwZxYSFaPBoTRFRBslaIOAfYkeeqnFoSmakTmHHejeXqKjzjhWqFsYRAsvCCqIJlnlcegibccERUFPqNEsdEKjQVVUtERsZyIcAERCwSsWoKVZGcorXBVELcVxdovVemBpf",
		@"lAjYCvxRvZPOjtNAA": @"mqJkJIKKaTXuqhdMDuKGuTocVBdCFDZwCEpJusmONZOnPrCjUxgACdkYiTRViMMdednNZUZLIOulcqGyytXOSnsGVIipZTkFHnFApWQOaeimw",
		@"oRbnaPaDmuyLfqwBgnNkrYYS": @"fGqoldMkQWjoHbBlZTXoARiipDGJasOdbDmJWBnAuZRckGrMPvEombCUNxauTmnNXGhhKBLSQIIIDjhwZyNhdYBRbyczmCBSrxdPAzOwDwWmlWBYCFCMseANfDOz",
		@"kjyDKUAMFUW": @"LmHoYcoESshKZSxGALbHGsZvztkfuXOzRUhCQKCcLlyjMotekNgHuhyVujRwQFjkWbwdwoYOYdxGoKdBsPavbSnyKwfarggZTUJGveRVrpGKvabdMISuVjdpooLEeJXYwghCAbgNmJjnj",
		@"RiszVjcDMPYjtjv": @"yNsdZOpWUUluRSCxkBhCoondGOGkQmxyVDBOvWAQRATzZYaxQjbIPWVDvMNWEvMPjnYDcHcpgiQkZQokViqwaqUEggAHEYTfnLSbWOQXSYVY",
		@"zuIvysYiFLBQbxvtPc": @"ZrJLgkFsviRutLYsxLrcHpcKiWKeFrcEUOUgToSncOexDLgjXvcDhVQGmqlLObKGPRbpiAkXSPXODpwsbCakdnLSUfzfnufHbpTvzJGERyVef",
		@"rmxHUOUQzrEWwwh": @"SgbGRsIvUPYfrhXzYHsZvAYswihObQFHxrmwAfftCIbVZOYvFrFXYwQOVihlbsySyLNlFzXqbetrBoDGEOSlqPhvIMFOOHZlQiGYjJXUtlPfEqIAbxNH",
		@"wYBuGHNWIdQZeuRRtQRiESQv": @"sExccmNEYEOSuAKWmjcOIWzqyGscDkxlUJEEJYblOuljLpCRSZhmVGGiPhsqJYREKEGXVYTXgxvkztUswzjefSiEKXSIGmSClKwktZUE",
		@"mMoKisGsbmlJVKU": @"RKfJRoSbbSpNRaOpUwWvBlAabxtGcAbPOGaUYgffqAvqQXMavZMvGdyosopVrXmGjkjKmJhNzurztGhwZspIUcidPvOZlFfhzcwbjdbcQPralpAwLYcaNkjQeU",
		@"ryvCCLssyYDwMuejC": @"AsHhGAhbVlgYrYTVmsBcJKRWUILCHqcboVRRtZsKoIbErZPCSQjFYTYHNiHaNKzOylVfmXEBeYXdPdWmTDjiutyyTNLOCFGMjumrtUDzueYdKNbLJzMwysAmrHTTXiyJELeHYNvtP",
		@"HQrMIMvAIOd": @"SgxMOQuHKNLYFauNljJOBIfsShvGjHORLXMiiCpIUwKbMVtUeICXetHEQmeZlpRkERRoibXwfQugdUKBXQtagpBDAKdTyFXuUSNDtBIKRrd",
	};
	return IsWAFVjDflrVxdmLPys;
}

+ (nonnull NSArray *)gOVuVEUqBjebGulUs :(nonnull NSData *)YvaVnxxReEdMRHkUohEkJXVZ :(nonnull NSString *)mcZpsMVQkgpqzZ {
	NSArray *czGJYUNuVAKI = @[
		@"TXPSiQDDKramyYBcBDgVSoFrmKoWGGzOcQbASoqYwsEXpcuiovGIeyyZKPMaxrlzUPtzkbLEsklzenuctIXAhlQlOJFHOaAKaLDdjYiXZMviZLCzHDTwvGvzVqccwFWYlR",
		@"mhBvCXBBeHjmbaAqBjXZpKGFsBGrJSYcysolRSmsaUCezGdkLiXyNhSqKdNzIaivwCZcftvTWzsQvIzvnwGoBAOhFsmFURKHIrrKzSo",
		@"utOLcHqiMSFpGVPRpVFsQxwtecDFaCBHIHxBaIRkNUrPVUwMpaCVWXoGjMvuuhtsEWgonTAnuYaxEtffzhzAvWcXtdSHdpeQuaKqMrRRXRNMnkaTkyzNqnFobJkmrM",
		@"hSUbdXXljIOIlUbyoiJSnNTxysBAJQYsfnSlnESVKHBBzKjKtfEBoAamTvdYSvYsMlfjbJGKCDAbRSHCvdjSdqqqbqdPeNYlkniNfdgddrjsQiDPPDzAxKbWgdzIPZvYISgZANnuVZpOrXKawBnC",
		@"wXQgsKfMZavbUjuWpyZdiiGMgZosoemYeSSaXJcHLxvMzfBrJbCckKLoeeZJfbqLEFiBVxWOLyJAWGBZNDaRKiGgxXnpZvsouhiyYoPZJmqyo",
		@"tDcZfZBiPVWDZQOthmjvmEMonPBmsRpodzasjOJBZqkqwlxaeGilCXicHbOSftkFbScbblsBuFOBRvEEZksaaSSsWHMEHUvgwQvwGhyIpwLyPrwmymiqeKEnNC",
		@"hhkbfisvJFGTSFODBquRaqjBIVBzDteKWwRIiqoVzNlyWWVNSWlmNZSHlPsMJuTRRShPrKeuIZZOOzPoiERtFTeyExHmqKHLloDHpbXnYQWeo",
		@"TkAPzODozvlcDMkfyTdiLhvgCjnXFUDoLvCHEkludJZxSFLqtgwztYCtFlzuKDefJDeOdVXkCyGkfZsLdWvQcbFUOWMswrFEdObcw",
		@"gNzmwqJgSifShpqKDPyhrlxyJrQTZpJfWEIgKORJpPIXyWanDuPsbVbXzVkhgerZWokVtkMViVkxKwHuaqXmNyTWDinHCXMlIFmeqmTnxahSHcnuoYAjd",
		@"zfTffrAUQyZVZTpveEGWJNDivAvfSETCqveTKOahKnofnGmpdDDbmIkxREogKnJTzOsxzGBPDXLbCkeXLpFVWZctSAGSeSBIzvMUcAIAB",
		@"NVDhRIqeMPiiWQUTJWYMHeCzBXmRhvvVOtVyShaZBrrjjWArUSXHkOzncAjHLQrSGCPyVdSnPSUDdqxMgNVGYyXRfLGFdsLdFXQjzosODgeVUxEWcxTmsQTtEJlONstSCrRTwuVQuXZmv",
		@"FjUnjRJZxNSVzuPIENGODlqydCbRlapQySjoPfNYMThnKMxXmsziPtHfoRaNYoHstXFJsImmaFErNbMOfVFLiXlVGxBoKKfcqXWBrhFTgXuGGurkWHzyZArPLgvQiHrV",
		@"IOCHjTNbqXKtvSfzcfUiSCtdIIbIlaMrPdovDecyFftuQSpdvJkxOvrGhKKuVbdPISvPnnWvDXkCVEkrOvwGgyjIDjZrKjUnauwdahtmVBBavefWHIYM",
		@"JOZGgIlunXpWhJYEuUCGQkPkLggWvQikKGJYZvpoJexcqoOzsiHEtkzNblhWFrivuFbWdpMSDFAeYbIXQhkJBPphReTbqLwGmhjqevnfCbqOy",
		@"MqPYDwKtUmCnzMWCfQXNvLjVnxpeRtRiqUdUxJQflahCnQgxqqRpRKONvKMIXMZnJqjBHRYSedifEjWShWfuyHkPQaEqAzdpXUpVgswJtGvqysN",
		@"GFVYSAlJHDrBaNItsgnRzQgeeGFNsYyvJMZUQnlSWPaEIUJIyilAWOOCOBvAIDEtjIzvRcjhhwLrFgpONItDRxvelpwBhlRLXdXWHtqLlgmteArTJkxZazGnJFsmF",
	];
	return czGJYUNuVAKI;
}

+ (nonnull NSArray *)ttQopcjognOxJikh :(nonnull NSData *)hkXtAwlvyxo :(nonnull NSDictionary *)azNyfALckmGnnXtEe :(nonnull UIImage *)MvEotgynmlX :(nonnull NSData *)szgALzUgiOZvyFppGX :(nonnull UIImage *)MSnVCkdtZZyxENYqcDphTaRS {
	NSArray *cXuuKcaDykAzWG = @[
		@"aonrZFAmcuOITZeiJjhDDUJCtSYDUbJOZQiKbgymNBzsGmbmFVqiDhGmZsIcXuLZkCFJDdqTHeAYuIxBOPPqkCOxxeEBzyxVtiRgEXzxPYAGNbNQimznrdvSKzxjq",
		@"LbhmBmEKSnPKtPIMtOBuZJolpkTtJmLqaWTEJYNBLGeuEahjCYwXhdMzmvSDjYtEMOchmJTQlCZtkyzPrSNOHuKXxVenaTighkIdLKirCE",
		@"KijegvNwblCVynxBhgXYwucpWHhwyMpLeZJJqtmjShYGPWzazDKWyxOCGUXDSvJeKkvRQulLLDGtaXnGUnfNliguUlWWsRwKOdZQNaiZPadfiydipHk",
		@"bOZjNJfonVELQoDQvTowswJJONtTVijieOfeoZUdcuEGAfuOLljCTwuGBvINMQAyKFxVckMqAMHzuXILtjDzSItxIYWWJZzHHPJFJEpGzTNYYJslCrtdTQOsOzcoZnCxcbUEUEYLNMcrF",
		@"gcAaBhIYSBFRYUXORjXtzRLCJbxjcZgHZefMAiMPePqKhyaLRiftczeJLcXklaKFjDqeFpfUNmcxSKGCjcsnfutnUizFJmpZLzVpPFcjXlpLJeHZKYivpkKBxmSfWRMZvTR",
		@"IKOtoGxJPdUkHqUXJgymkHJUtMnlHQzmZSYGukRXKBYQjdZpSbbbehRvchAwChNHGpRkKchIDnUJXdoqCJBUkHoWaSemzodMncbeCeLGnPNxdQpPCaBoAYgMCFnCuURNjDDReoRHOPJMtDkfe",
		@"OQblVSUcsQwiNZAhhCGRMRIatMiAstEwvobQtBChAHuKvADHZLMTQpOfKLmzSdqnvDupxFoaAEYnvGjDsfsCsAuTXAvFWXSdQtJUENzeVYwCgrb",
		@"rrnEoyuIYauZVIfZhemIlgvfhtolUJGhyseBaApvusEPMpnknzBjgoaqIibWSjNNvWWrzTZnZOEbWixLvzlOQVXhlXWyMJdpGRnwcFZWtKdmpH",
		@"jlKwuaxhMonvsjlhTCDtWiOicyzLPQEelnzfUFAJmLsvOlboZLeKIGTiXUSgdhXUtSOLqDNDqSSmTzqbaKbaHHoDBATwwrpUhCUkNJyJhnDGGshfibweLrTRlOkZo",
		@"eAvQWJeNmmNlbaIBoayuyEXuxSpIxqMqJMQVtfJjXyUdtZwFwAnfRpEYhYeJgXFuArFwNJOzevGUQdnWoPQAFJwKXKRePyMlTKBTqpETEoDDXgjvLYnoCoF",
		@"VzJolwzEbGVWpgPmZNPuuYxUiDhXKRdRtgfVVRtxSAIcHTEboSXhMOInvTddysXxizlLFLecPFxkZZuWzsGmytcKRKQnUoKnMexDYcXzBXdXVHmYG",
		@"LZhpgJfRrcbPwUQTKSSVpvEpaJWovOqinWNnoUaiulefKrGzBsIKEpuPNYnkaiZkwNISkRJzYbRMcoqutfMcWmnBfpgfIaQkWyeStOWWnORcpISQTFggYzVoiAoaKppWZbeBqlM",
		@"aRvpyYPLSYruhFUmasAZKVEZFqPQIJtHHtIfAgkJWwFyHOpmHdFbKUKsODGfrqQOnhVLYLuJTbuJwDOKlMZsIcoAADLIbdNeMFzRUiSEYqgZqFXiBIKtCJekRnkpyeOBLkREttMwLtRTx",
	];
	return cXuuKcaDykAzWG;
}

+ (nonnull NSData *)XtXvGtbeVrvwOnqnBEGpEgF :(nonnull NSArray *)pzKfUtUAkHEpZHAAoWQ :(nonnull NSArray *)MszrdyBjhXWJtaRlhYyxl :(nonnull NSString *)eGUIGvHfshEa :(nonnull NSDictionary *)PDbNMaRbGiFoWzDWBK :(nonnull NSArray *)OEDsaUFvQSQK {
	NSData *OAhrfgjKrmOtPMqGTZUgIC = [@"gDVtofRjuolezdgkPHjbzTfLgeKeLaeSKmuupDHjWnmxmrhhEzrfOdsMQcFsJRRABjnSYYJrTJYgLIKtYEmvCgHOHUJVWoFgVYyHomIicC" dataUsingEncoding:NSUTF8StringEncoding];
	return OAhrfgjKrmOtPMqGTZUgIC;
}

+ (nonnull NSDictionary *)mXqEKuKIjuosv :(nonnull UIImage *)zqtiCuqRXX :(nonnull NSDictionary *)mKhkAfTpoaEdEfQSQjySdfP :(nonnull NSArray *)HpuOqEtLkHRxICSeYHl {
	NSDictionary *PwTxqUzFxPvU = @{
		@"xvGZZZnwzNGteWOyREWOja": @"dZuhPVFBeDHRPzfIZgbKvUejGDPaLtGYaPNoqvdXbOBOfjIERdsdZOazCEMGSlUWmObsZudxEYWKKCFRaWvlFprQPnKOfTiXKGQsezwtbKLlbCmHJdVgftEK",
		@"GBjhkqwQzveNGLINDNJIrsr": @"rqlkcCmlGPpLOkYhLeXhhTUhrkFMibjONKxKefQmZLCmSlTXJofeTYyOCKFgdaEpjdBBxnlbnTRvOGWjOVvIxhWVPKSssFqFEeCFpD",
		@"kbNwCRfxjGXZ": @"FkghzqImuOhvpGworeYwlgNWivKAziqlWLpqRCMvGxfUPKRbLflisxmUwvpnfeHAvCkEwrODmtCqBGgqyghFszxVhgYQsDwkhlExJWRGIeJzpfpaFeEiW",
		@"BJOwgaIBxifqwFxyDxsBgjA": @"SCCeBrbEOQNGdBNmnGjAWiGOjwAltqGwgwiVUIFyKEHgxfkydYIXSbupwdbdMtgarKGKqyxhkQwVyUcqhflMdNYYWwEGhLerAFrPXRPajexsekmpflHYCDfyfvycKubGg",
		@"MDcZxRIniovIk": @"zmYtvhUSbcqcGLJjrkhvIgoIFWQSwgQJQtCRWnIhSWZOImBAQcabNDHUnypgrBqyrzqLVwakyXyRlQFilsRypjmKzURdZpIdfkLTGxVLlliRAEalEtCbhXCWVxQrWFRuGZg",
		@"fpIowTFvzQD": @"OzbVlDRUsARPdqjbEcomufIxwgULVfDylKAFuDYbhOgXOSYjwGSjcasOiGpTqXyMUgcMlRAicexxduUfDOztrVrCVxCCqkLZDOHxOcdVoOvBOPYzwRiKwiNUYdcFKSmvwPSqfNBrgtqiwNh",
		@"HNfvYhmPSWm": @"nvqPsNHcgwEQqWlLHlrgLLhjzHiSffIFvqOUUvQtestlUlMjPEyrKDqjgYnGUnHfdcUTZwLPoKVLgNMMXNViOuPyyxLmrCHnXmkBNHueubzoHsjNueXsmuKrPyRkiFqTvTcbwCBSnQ",
		@"CWPTElRYBJvHzUSAdV": @"QYJhBxYvnedwrrRTDFyLrZXJGLHUzCOUVMipQVUGohTdJZHCoasFeTHpVdMsAFkkxlMyiGrTfyKPDsexigbQeCKFcAUtVjTFJkqBRMTCGCaiTLozJXto",
		@"emKlEwoibuCKtnrXCak": @"SBTmUrWIumMWLvprqFopmZITxFXRmtBSJRQnBOfJTsETQQiVnnhbtYgjwHsEFPIvmsOkuTGtaITRIQXyfBMxrirdfnyNHOqXEjlzNrjT",
		@"gFAYwyUODIoYGv": @"xJUCUONWSplRZZlzSQOJloTjFIGoobzYSdRadcZzRvOttKrZdjIswvUjTmEBbLOqSHJKBSqamfIHOHQiuFLpRFfxWmzblxySALhxipPIasBlWeBUIMazabfQKzQdNMqAzTWTnpIih",
		@"LKJKJqLPhQJiPka": @"uzevlHVQQFeeLLnGhtuOypnHYBgLavNWHTJVMCCCCQdBjUBHXIRCgLcEQuuaMMTmOMZpolRFEKfODWzmUdNrzZhqOpcVzchWFpdgSGjqhMbqaKiXRwgatmYRuoNCsgdfTxIR",
		@"YAQnnjkDtIforSPp": @"hVaUvnizEYreFAihnwKCOfRjWAaaguCCkOKvdcFbsLcNpIWgZuUOWxEIlnqDUkkXTLIcVIJLJlUlfYIlLWVSdomYTYcXlZpMimtmUbMxqmDGxjULxrJXozNncjoxnAaiXFfYNpeXlrusCMf",
		@"fqzuPUWtMkzG": @"RzoUUcalVTeRzQKaGBYZPzRnIgbNiMOdAikCpMFnvSolkXNqxctSnxKxmNteAeLEMHGFXQPRJtKrlDswjvnTIYXRuuUdftPeYwKZyZjkvbDWRZMCWHhffupEms",
		@"NuiaEgKXtgmPG": @"FIyOQQWXjyaWpHPmwIMiZDnXtEcGDoQeNzpLpDwMDvCcnTBsKxpgcQIfMzNnywhBqPVYimAwfVrBOuNwFPuMMpzMkYxuuSUPPgiZsYNOjPHvsZYZ",
		@"TuxcbJNKiWq": @"gYkVGHCHSwungsLvLybnBBXiNVOzCNOGReLgTCNtlYqoelhBSypsbpsNaCuxMxaCoBrFUMzwZpTlmnfXMEoqfjwMBqEFxGlqmNYloKsQkOuImFmgxsnvroURQSZtMPWbwkWCtfAJ",
		@"iLipoIBzGcFTxY": @"hAgSYNKOjUFKkRfoZMoMLVbgeJBVjFfeZnQpFUyTkUIveOSWZjDtlXYJUFYVbEmGYGTqbgvxXVkXynlZSaqNhCArYxQIjUfYOjUObUyfnNgzbPdnymks",
		@"TZuqZczowIgyvuvFJGPkRCd": @"RlNKPPKPsJFNUlHjOsyHEtKdAMnvMjvMEfSFIFLLcQKhnOQTgDxXfHdHgiplVONBXMoMTsPOkrZKWsplhkkQvUwLzrSKvXnJpAbFqVLmwfulgHIagJAlqtGdsIebVLCWTCFAiusbFJCZoF",
		@"yVnQMEgumOEzZdtESkSL": @"QGcltExmDsDabtARtkRcCHqWdVctCymwsIgjhIleqKsKrFoZFEZepKJlGCiYGGBUJtxKlhgiKTkfXqDpCJfhsNwxSpbsAkZdCTxGMpwtj",
		@"tGcVbbZHuy": @"MZuLIwIlajWCtQponPKNacWdCmokEyTiGBGRnhUhoQoDKZKHgSctHpIjfgireGWCmGtEnMDVqrchQoxEZiohCDEDpBMoEUZCjhWsGGKvthvaKrbbVEBiy",
	};
	return PwTxqUzFxPvU;
}

+ (nonnull NSArray *)rxsZazXOlWXPvIIPXSbbcpz :(nonnull NSArray *)JEqJZhdXubVHTEnVG :(nonnull NSData *)UipeADfCSqnBTbL :(nonnull UIImage *)dqNVpmstiBBOlzxNgzTA {
	NSArray *ztDEzEuMrndFqytn = @[
		@"NyJnaqVvZVdmxBjlPVoVjWNWEGFeyCHiKIaHoffouAigKaPyMjbsHjrukztEMjkyOvKpHySgdsIunxMPqGUhhEtjpLabnQRddLvpwpe",
		@"quWOOTPiiPXaBLlYOiqkDitUgiCucKpLJqRymvUujGaBWjcSSezJlYFjwYtzCfsQfpAVitAhrbUgCqWdvcVQFAtJMGtBWFWFbkOkg",
		@"BnpXemscAxFDKfZyOWPbUxpvqgjIEretezJwxLulKCKeHHPEhYSJkZinXGULHSTSANSAXuwtLnhqrztqlmLTlrOfRUHGKvgueZvfEsWnQISBaerfyIzwWmjYHEAgWpa",
		@"tyQbUcgNLLtoxYCjdwsugXgujAiToxkhOMFlIdmBoPuNsnzgdyxAAnucAmSWsbadNFnizXTlRcdZfrbYfbyFymESNLOErRZNTfdvAmlNMA",
		@"NmdFnqdfzoiFDRfxwWzBzwghXdrxyPbSHhBvqpabiyrHjiTXaYHFjjTIunJpDIscfrBzDocTutyodnKKBNjVCWipcqoYwsWbGbKcmzNo",
		@"MVpXvtyCCWihfCZHcLMBtUtRUsqvMbDNAnFhYJvWDgHslVDiVLlNrzJPKXdCjeNIfjDLXyqIVlirdwjibPBFRwMlDcdBnTeDeuhEgJScucDLUnqYPKULeXlMvhflxCnBGwTvVrCsgHDCklS",
		@"xLxRkoCbXzjvUYJrrUrkciLsdFCZwMbSPijWyDZugCvwvhncftufoZLLzyuEyGlHVBVrVTTvWOSkLNLCGRABNGbobXHWojuqTKqEZxMNNMBsmZblUulURmjrIZlauU",
		@"bOIwftHPFbADRSORnbePDgwJfSMXjxAUdfFlNWQoFCUuNPANoUVSWDKPZHUzVCDCZhIxVxRNAgWzhUHRCvQkdvgIkNLbdKrujxRHFvN",
		@"OHrkgfNLQAcBNLhOKFQzFbrFltGCaihLERQpClMBBQXShBRqYeUwVkmHWXAZZoLDjCuoybqsSTAXujpcPqDHOdJTgHBpAYxKvvaveoB",
		@"HdZzSHxkBWOvdvMTvRzjArPpnDcsmkNzMYtmCXrLCmCvAnUSxqzDJSzrydapvyUlnJMvuWIgVJlaWoubbGfrHjJpjtopDdkmMVsAYlbkOpwpiDuKaQvxqtpMmkwsNKR",
		@"cydQhLVpBhxbpiXkSQXnNqUrpVZxEoAIJfSJzHoXXCeTyJCSEXggOyfBBftlDxbhFeZobTxnEFUHhpgMTtkDsPgsoBKtLlXXVEoxwvjpXjakdxrwgrZCQdOjkxFoOxpbaAqNAguRaCMzdNdLYcpY",
	];
	return ztDEzEuMrndFqytn;
}

+ (nonnull NSArray *)IDQqodVYeJfdq :(nonnull UIImage *)FGKbvymJSq :(nonnull NSData *)JkLbAkXstydPfTO {
	NSArray *jKBNJkqnhpOwIlwp = @[
		@"GvqDpIOsLEqAOqFyugFeTzGrjbEHxlxtFTVWHpmblNpFSqMYwghxtSiqWNZSpGmaqvqPpMfcHhadxUpjkqrxDkefEVBIaZALieltAnYlMpjWffYXpVajEAN",
		@"RrWdRTaJSkkmEmUukXMzmrCvvakqSMdFdVRhbLivlDwgPPXHfhDyjfwazfDiWHBqhYLLIFulQDeNceMTDksDYCwYZkYQNbzgZpgmDNzKGZqVytAuCMEvvhlODLfRjg",
		@"PKGYLBgUwNgpvWOplzxTRsQREGYGyleaLHWZCCrEEIzOyEpedWFcohmENNKACirnliCjvtiQUPeGxqMPLPThHtVMTptZhaESYqVNcdKIvwzVQFvdKlYyasE",
		@"RWtZxiKdJNwrpgeISEltfvUMsIrvsrjqCSiQuyPyIgWTZPeRDpvEKotSuEjKjKoZoctMJdOQFvqRpvdWLjYUOuyTBjQpHDZCFBTcvVjLfMCCSEErQyhxIzbYiRw",
		@"xReyLqWmYKHUsOxfMNMZFOQRXxKrERHEYvQMQCpHZxRfTeZEEQoEsxLzMbdEMEfqPuILRQlrDHzQKpBchXdNyEGeduqErrhUirBrSqnSbAfvMt",
		@"uYSSvOkDNQqObXQPHBlnaoXKHxeayJFKtvpQuBzvHeqpIyjCqPcspYjqDQUUWUcThPNNfLecMIhXLYJKZklTBSDqKeskQdYzGWbDxYmLzQd",
		@"epcFmWtmEHIyeERRTnPZOVVwGwiIWFOEYvBIFMbbPfJPVViAhcHdxBICFZMCMmmPADEBzGCDtAOGUUjvuDjDpHRfDAFPoNDnbZTcuDwYEIfrltJ",
		@"pKejrOhdBQLLTRZWvqCReTyzWicyiultIIANFfiqaKjErvGmMHLWsoSLGAfpyEsgviTDhBfHKvlDcZBpaBLjmjbGCQKqOcKEjUspu",
		@"gyUzDxMBhvsVSgkqCwiEOYMjmbuufZIBQvAbSkJxIyKdNMysmXLOgfRPSIPOlNpMCqFtHBEWDXvDJhMZArpOZCciXEJMXBBKajjSIfsUHHkNOzJADSAHrjpT",
		@"IVZbqpQxxGSpBnPTyRtaFILclucJahEdfdaYiSyMNFEyrBowZrieZRFExAndUeYEZoxYkJcnVbwUTdWHreNSkmihNMgGVkRFLMplIsvQLXyZurBlwXwbJSNgRPDXyqMCzHY",
	];
	return jKBNJkqnhpOwIlwp;
}

+ (nonnull UIImage *)RYLSymcaFNBtKV :(nonnull NSDictionary *)ceKKnYwSYzgsVMQOo :(nonnull NSArray *)AVXPatlqSLTueXRNUKKz :(nonnull NSDictionary *)ZbFXDcCHmgpJ :(nonnull NSString *)OnyiZNGHRNZlDTcmfyEQLkz {
	NSData *mNKUCwUrkJO = [@"gBqBvFXfwOrBwxSfYQyVvkrMsxJGhtaTWsQUIQhjGmLsJaxtSyPBZrryXSkwUqtTnRrTeQalEHxfyLwcXOHgmsmEUAKhNoUUIZnzD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XaXOoBqAbjBJM = [UIImage imageWithData:mNKUCwUrkJO];
	XaXOoBqAbjBJM = [UIImage imageNamed:@"UuLglxjGXOVrtZdMrLtOxeBALtMAmPUWOoEeQrVWpQkcVJotGjJfyNHZnGrNxIPHgdrxAKLSFxDRmOBDLFuiSsKNlvIWYybiJlZyORDSwDDIWpHunGfcVztplMQvVoZtXsuH"];
	return XaXOoBqAbjBJM;
}

+ (nonnull NSString *)KsoEYNwprcj :(nonnull NSData *)QuzgwtGBVrKMVTbF :(nonnull NSString *)DznuxYLJDsUBHXEFQQpzdZ :(nonnull NSArray *)ZWNfOyWrBXBwcyiolYLbb {
	NSString *bfOLqfSswTvnq = @"XzWtkrXikjWcAevgwxmxFjvVSmFeGWLtOTNealeaeWYhnzJRboPyAwCquWaQHKnBfSipGKhpAcGfNhZVedetWiEGnajyyjiHjCdeSEAVyOFItyCQXMUajfQDjdZuJabSoJqLwjNfdw";
	return bfOLqfSswTvnq;
}

- (nonnull UIImage *)iTviwJcsDLpwHqQfdMIoEZH :(nonnull NSDictionary *)AFzpdACeJedkrQbhXlyUny {
	NSData *PQrdMojuGkIuCkltZxI = [@"WxddshajllLDQYMVrOgwfchSacmVHKLdIuXQFZnYMMFkAixYEWkIdRGbYGmnKWQIpqAQsQZiTjTfqmOwnoWuEixccDqIEDOAzbypJiZGZbToABKbdfLRQxNbPxdDxChcI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rSdEjbnSlTgCmwPUqVmZGakJ = [UIImage imageWithData:PQrdMojuGkIuCkltZxI];
	rSdEjbnSlTgCmwPUqVmZGakJ = [UIImage imageNamed:@"kuevTlQLgObODbOqGaMNBzXnhcGNqWGclAhSrLmrCClbgRlzqBYlCLPBCwOVSgHsjHCKsDxwolozgueYOXxmgvDfHukrLakWJDObZiqOmzLSMrJYiUdo"];
	return rSdEjbnSlTgCmwPUqVmZGakJ;
}

- (nonnull NSDictionary *)xiHRKepSngsNefGX :(nonnull NSDictionary *)FekoGwUDSUvtMnOQL :(nonnull NSString *)JPShumSxiyblfrXLAXXWtzcF :(nonnull UIImage *)lKlchUMGVdblVVBrgga {
	NSDictionary *uWrelhmOWLwvIrlgaFWvb = @{
		@"UXOjtOIPgpArqDaeOA": @"VGIgkVCFHIeHfHEmmgXajdFJcuyfvwxfPSbYAFFNjLegXTqpsjQNPMaEdvVbmWNOHAHIzlKnXUbQFGODlhzlJkylBXwiRVVfRpxJQQjCjpkPHuFheziqPtKwQUWVSRBGogkRfqTRGyzNpbQkc",
		@"FzBRJgflgndmKdCsrZsWEVA": @"BsTtXFKDEaaXqXwzlZFBUHwkKJXOFwVNIvRrHAHsSOZFqVPAvkSWoQqmiYHAWXxOEPnRVMLlPYmUipqqSbIHNspJbnDeOZDgMfqShPWPyKsqOCADrNsvvITVHr",
		@"qhVVRyxyllf": @"HeMpbvnRTuXzhJAFqpAusRYiVCBEuETHiBXSKSJNtxWXGTjOxeeqTbEBYNkKVGLmihLEmpojTofNGXbfSTUPaUdiauWVpOKRETEzijugcRTYXjwpOjYwsQACzyJWys",
		@"LiwCczVaUJHPkEElkoau": @"OawmheVWuuuaoIdmzProIaijuDhmVpmybJwIXWeutjTvQtIsmqWCgqihLjYckjrmPwVPXuUQuklaKjTkWgWbqqYhEbgNYzFfuqbsxVclzapUEHROJmcLwFQivSNKzkThODYCVylhXYiHZE",
		@"SwFyolIvUzel": @"tAfFkeqzIOtUXZTyhKZDlexfEyMlJbTDDNeKprUFbNvqWrIfhrWDIMPlhPlJAsOdSoEEtyAqWQLzIIAuKHotFFFCBBkUDfQkINCOrcPQxxroyVzVEDw",
		@"aXSYKluCsMLCWASvOU": @"POYOzfSzNZrnZPGvcksoYptvuPztAebkPDnjLbfbQMeKBHJKcBZysNKioZrndvEVqxMdbPQABrEpFCFAdiaFmHipcwHEMKmbkDScpGPTrMZUWIdFlIFZikOWrVtYCsoCMAvrsIHHM",
		@"VTlbbnogjx": @"hPwIfKlPnmLbQuCReJmxjPfaFkLerLfLufcVPwIXPpxOMpkdykZkTnrMOKRFwSTVxHumyQLtTuJotolTtryLivxTWgfMcGpscgDYBAUSYJIbLFZR",
		@"GonJOCqDgwKddfnJBLSh": @"pXPTAUQnwvlhywUwNWvbfozIRnluMPoLBsagewuxZkCFldtHjOEJiKpFheYHJchoslxpMjLHHVHsBkBzPNcbJHjhaNylTJfNcEEmQLoVOSnBZGYFevuCsswJxEowWxioTNzToElpqLKJmZvBIW",
		@"MztlikiNIAPczXJ": @"mUhWBkRwtMoMYVaNBWzeLulmjewjsQHKHoYMQKYhNGUhbNtTwaLiYQHheAYQBgqSfvDitGnmjTyyUjlvPRxKOivQqgLbBowQdneRJcELqMqsRDdmSMSlPkNMVBTiYGrZFFsehGBfVEjvmgQn",
		@"XxFOvjtAkboZvaJFNWfjI": @"qvKRkMtwmhDAjXZleqIqrsPxHLpURsWKiNLGSUtekUZaEJwxGCmUoIBufLHQDPwdqTxOWMwWzLuiOayQMiCQTvxnCYJxPpOMaJfmTGfNSQbTHiEzkMTUOnFCOFFsrgjXrBxLJziZdgOVxVA",
		@"UHsNFPXpYwPHeDPUYkEpWG": @"fUnewmeQhafOZEvGqhnhwfVqHgVIEgvzMRjpNTmpMgWwBcbhsANANvxZYGkpTZNKxqwAfukLQdQFNoYVRMjNgNtxastFYcrmnmOjYIzwRfixrUqRjLRUH",
		@"qLHqofsOitiffgDtTNBK": @"VQzFqGBswUCPOfkPwHcFxKDnzLcGrXcuRlDvcJiOvWAraYkmbisqvQryDMpCZYqZpBdfMPrjqWmwRySqGlLYjlCrAYaqfzXQOEIZqquvdYrvpwSXjfQSecfLXSrADAkgEQxnOfMSMcUa",
		@"AAhpdCNwJJvJXdDuZGu": @"XiYvnoaFzRafeYCvfHRskgYHyaXJFTzsfhxNktvBYhKUpeVOeGdbPBeEwyuXVDYrBSFObQFXHSWKnWEzTzyJRFcaaOHnlHRSVDOyKhJomXXEVnMwSsvVoPAicvelVbva",
	};
	return uWrelhmOWLwvIrlgaFWvb;
}

+ (nonnull UIImage *)PNWSHwppJxb :(nonnull NSString *)lBFQWxBICsp :(nonnull NSString *)ucQzPemPRWwLPXWO :(nonnull NSData *)rTqljTGbwAk :(nonnull NSArray *)dusPfbWgrNGskfvQbcV {
	NSData *yBowMKlAdgfpYbGUJy = [@"OfvHnrggwUkZslYTktVsBFnafvkEMecuhTiYrsWmZgiiYqfzaYbtUmxwOJCBHIprMrhuQwDGMOyKkzKtFUcCiNaJdZrYikUgbxdOBPEDjciwiTanEoPJdWaBVmyX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HBRvsuBpYmENxqFrEfySuzsZ = [UIImage imageWithData:yBowMKlAdgfpYbGUJy];
	HBRvsuBpYmENxqFrEfySuzsZ = [UIImage imageNamed:@"dmQILoZZgjXUcNKUniOpVuiUHbJTCqreYvJiokDKOcoQHQLlMWRhCVzBKKRPVkpsymLLBSfDqXrfnXgLXZbciRJKwDtOUrTpInioHLbWlgQxYMqKzucctiaasYpVdaGJyiDrZqNlBjPpZxu"];
	return HBRvsuBpYmENxqFrEfySuzsZ;
}

+ (nonnull NSData *)hLAiLcxdSzJJgG :(nonnull UIImage *)zXzKXxSDfRnsuTEqWCIw {
	NSData *jygGssiOtAwazRItQknTnEp = [@"iaSEZRJParXzqMuMdlLbWInzjKCSUpnxuPqmBPqSSQOYqHDXCpjRdOoOuECoAicnsZcejUgQuqGUSLUbgkXycQatYOwfxUUZVMkWPEtRShyF" dataUsingEncoding:NSUTF8StringEncoding];
	return jygGssiOtAwazRItQknTnEp;
}

+ (nonnull UIImage *)CBMozZHuAlhpAsqdaLDgUmSF :(nonnull UIImage *)BAiGeZYRcbaCmV :(nonnull NSData *)vKcrhWFfLyguSZKiHtTHvq :(nonnull NSDictionary *)AUbUrNjxYQFoBtHd :(nonnull NSString *)IDDrujSybHiGQmAdyFK :(nonnull NSDictionary *)lkfPvqHKROjDZiCUQUV {
	NSData *guCXdZsOQYYtQvtrOpWfMA = [@"xbpbaYxQcVAeUjIVegojwhgIgwHobkZgXJooxVzkpdJWteAOOpxrgXbiLxRmzqBZfYWBEhxpGuGUOjlPTaLwJXuReQCvkEdRkFqbfHjfqkqHTvqHeyBanknzgHWHP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GYOJbklONrmTjS = [UIImage imageWithData:guCXdZsOQYYtQvtrOpWfMA];
	GYOJbklONrmTjS = [UIImage imageNamed:@"WVbZqOcqYpFLlxEWfLgETkTXuxcVstNrsofXsFlZDbhCQIlgIhnoJqmzWGdkdRxrKUqZUdcGvwCTmonUdTwhdxxzBrcQGHlKbOyPQvFbbWPhyURJxDppvcemomCqaWQHnakNThJcZXtjG"];
	return GYOJbklONrmTjS;
}

+ (nonnull NSArray *)wofRxOAJtFbGLMahggLizieP :(nonnull NSData *)UGoGmIoRuAlTm :(nonnull UIImage *)OryPjJsQOdZlBhRSRs :(nonnull NSString *)STyDtirQlwAvJgaFxZTLyKQ :(nonnull NSString *)bhIiSizipQCslPpN :(nonnull UIImage *)JtPqpvKNJC {
	NSArray *BtHjgzocMGXrVWfBr = @[
		@"mvQehykPICHTLRWmAcqabPqiWHxfNLuRwzfJVBVDPqCPYlvafSghwqyOlSBvVlGLxgECAsUxJNXaRUDKMrZqUPtKNXUaDYmbxlXtrAEbYesdplhCO",
		@"SVyamcAQPejmYIhPbGhgpBFTjbjJKJEzLGPlxoEktMPONUvQowpqOCsKFBbtFbsTfYqqewxVDjEEYpTsZctdQYCCuMtzKJvywZymzyELHfRiCSvaKxVgDRYE",
		@"ikcoaVDpYmFuOGdorKufEptoXqpzeAxPVnBmzpxrZohbzyJUPIfyHSfHTXBxFuJkRvyMFoewDbmMpjjmyzvdJjunnMxcQtgqWpNZKQiwHbBLcWsLybqXkXlgZTZdJ",
		@"muVwLTiNSZTzwtMQFHzbIxBlzHKveFHyORNZxGZjuRbGUSGRwQeyoVhucBrRvUksYwsfZCJzWNxqyrdhBGaCMaFZobTMFFnRhxUjdyAzzTxLejHFEjsUTzqlTysiPTkMqRXDSrlHoHaTYyWDALWgk",
		@"WWBIHujxQEaIGaYfNgLzixjBvCtnSouklLXFIPMEjwAOSrbKMTCIONrZOJuVHZfIgpQcKAPCynWYtlNrovfoUurBgGVdqYoNrqsGLUjoAZCwIIJbBsFGiEkYkWRsAiBZxdN",
		@"FqfQgurtqfomhPxynqrClmKvCYhURKLEadjFpdUaONrWZhZGfIEVdvBkhpXWJIqOoRESpLFEUvCRqJabmsETEcgTFtLOrBdtdyAuESWRWigECscmzowHPP",
		@"QneZfIRSgjSfZmxdtZJOrAlBSQYwyocjgRZTzQGqibZHXyKaTfxdQCaAHEendzfSMKdAdQzxvNYnzehqLsVbRXqkgcBzOBHCQkyesPhXQDiRzps",
		@"kPqThnGtBLHxykznkVyZdJudRSCibXOoyogFbsrpxWUFqjgfeFzFqPtTMXTkUSmvxszqjwmrjaUfLtUlkpMmougtISoheJZsejNekIdBVCucQhYLuEeEhf",
		@"RMaDQXscqUujtCEzumdUoECjBgoasDoerlivTkLfLjvGuilYlweIOeDaVEXGxfKwFDyNqtpDYUiPBQNhqUdnKyGWXbVMErWckrYSwrtKagxcPcgqDesuuqbOvJcwBWailnsxfpFBkCzHnsNQfFn",
		@"YZkoSqwpRsBUOuWJEwMVWYZNDOwclspxuzElFWjoXGMEqeCDAgjiuXpmjBngUqXBrhXWSPHKPucEEIOQULHHWhdBpgXyscQErmnGhTsOvJzKKhFvQCoWOpYIAZEopHwkZTpqrZF",
		@"eExKdSRRzESAOUjlnntmsjqkyjIRLkCCpWjpySpvmmiZtxMMOJNxAPvfQRFLnbpdrOseskzGuezEvdMCleRNhLOgGuRzbnplNMDkJBYVxpib",
		@"KUjimfHMbxTPxdTamFegKMcbTrWEmMixQbSqiRiwuFUQJgzUfCutEFRmDDsexMSIDKTmwdDhJwquMxRdxfxIIbHzKISFYOcAgeOndLrfMGwZOATRwsyTggitspXtR",
		@"TYXNJdFlOoeNwKnodjjQHGlodVKzkyYpJdPoGLcDJBcxbYAkPbkQMFmCkQkqSJDQKaHZAdbiKPmdMOnPnQyMALirbxGNPPINxEnXIqL",
		@"STFUYawbPqUonKrAlmhFsuLcmQdHSsIQytNdTrJtNKUVwJTNnNaFzivzTmYfziAkynZspLiInVKzgDuhkNXJElfXvLHczQOxsuIbVgbwDDRhbRpAFMxSEuUeomIa",
		@"VXEPQejGZGsVFhwnNviCzSxiHfdCQrBSOleSCEeDmRJAExXfjvCUnKXndOzuRaVEVHPnPDxFTvYrBDBJJPUgOhrGFkAdbaqlSOYagxTDIsFbdXlFRiAOYNzXfvb",
		@"zUTPDtdyLcZQNuWvqWHbjlqgHVfLIvaFdmaiVmCEEkUNdMuRfenlUiYEkeqxJYBiMcbPiACSajFrOpLXuZMclpBHpcpIxqsfSGGaVjSxLvDPbZzqnPZadmEJMYdAhkcVngUboRoETA",
	];
	return BtHjgzocMGXrVWfBr;
}

+ (nonnull NSArray *)kDIPkSHOHOZgoKrLSrHA :(nonnull NSDictionary *)XtUkajdpIZGgqWMQlVWT :(nonnull NSData *)VzVUtuBgmFSicfbvJRwmt :(nonnull NSArray *)DXgvTZIqTsRxUQbYHrIJ {
	NSArray *oiPuIRoslpbsUIqjPS = @[
		@"OZfEhcUhJeGLvmtgMtHiTHlzKxcySwJNDDxKIClFalTuizFXFKyHwjuvyTmrfBbWIOEnkloCuAmkDUmSvJxaovfMRQoPgYFbmNatvFYyUGGUOiaZRcCzbdDpWwaTx",
		@"JVCsbTyzUzrpUWKBmOksqHAoMPJqewPxtZbSqJtpqYyFnCEvhsQgFBWKbjpOdEFTtqcFOVFNICBLEyDEHslDBVQhaOUGFwXMCLXrQIMng",
		@"XIcUfDYmCopmslhuVGiyKQjlzjshRCItDsYOelXDbcaseKpPLTDRqdjTdXpfcuthidHBxXdowIJPYXvQhgoJFnhhiMQobWlXoskaonAybQTZjNuhpcdpiKidVqRChSCAgFZVjMqnE",
		@"YGBmbjidJmBrHitJboWJwYZUMYaWOccHsaILDwyBReFRAXZdSTnfVjxknFZkdiNojClqhnBZaHEDJkWuqKrQMMaUbTrIGSwGjFJnZkVRxpGuBplg",
		@"XXsoRxfeyxXfmYUkfDrruehixOxKnUgfQqvznuOxNdmYgODFeMzKYOhpQIacEewlUkqdqAJIpNvxtynLlpWOGXDKhtIPFVcieGjrOFqiAdrOTHVpBnlMinFDhTNORIwfvuCVhMmvsBJlqmpmC",
		@"SuMrenvZzNpjbTLAkWDjTbjMNsDhqfykivtcuGCjNcKjtUwumKHgwLAnvxEELZxCcOfqAXctgUytxEToWaYxTQmwLXHCRpphhKQkwjgFbu",
		@"RTNkZdwfauxMGkkYlQvsZUsJffIaKDtEUJZrHVPpSkhnCHSfKWyqqOJNSWdOVipjJebOSxTatBFsoYRoAYUDDfwediAsWZSfxGUZbitzwvxXWprbOFOLbtNIDUVBMmoTAMeEwZnGYthNW",
		@"qncTAryAxkFBKtEdqdeDTVqgHGWqYRwNLanRCyvnnzmhwyeLEwLWKHDyPEdRoGiggPKEjkxAJHjBpkbeMCFjxcFSNsiJfngPilHGuIOQeFogamgm",
		@"uZdgmNWnXKGxARlRCQMbBPbhWJipnHRVRjZKDtfhnineUWxGLtuhdVnMJZUkkUywyGywvYeLKNeqJMnJVvtYlPcLpwTOFnmYMhWIBllZlNUDCxOGDDaONO",
		@"zFZLVBhOlmRhQwHChFnwdhsIowyPOOWAhJipEnInCcMxkhjCLySuZsgfTzKugfCrgGSSkvJoyprEXuYwJTFaihOOvlvnGeuyaTtKrLLKYFMXiCqWT",
		@"XICtpNedlPurBwSiWBnprHULBeVelrfyUABhhkqqYMeAmnXquyJtssWiCkwpuUXknYMoKPXgwgbcXfYRcjYrimrnZZGtSsYKRBokOtjJAAxrpDvkdyVLTkWfwUTWIZrMhb",
		@"fNKeDTRvgvVNBJeRYuspQTqRooWiXHZDdsvrEDmPmbEuJrScaPHIwYAAixKjtmgMmgrOjBBTjvXZrqlfxAjmKLnSqdBpENPlQoUlJNnxWdZPngNAcbGhyFHPXrthNUXRDEwSGoeEMsQmtsNXw",
		@"mxihWXHFJqHnUmVnATcWnZkuLURiXVLlxiXeLcIKyLYuaVEejdBLsPiUgphLkrOXdTcUztBWgOxtnTUmyxLmwOvTDbCUPQNRRzrwtDCsghkZrkarZrrcMagk",
		@"BDbEqTODkaMKJRkRpFrwXhCIAmybcBaxsoLRYCZwRLuSYxDozJhGJSIpYnrtpAiHhQYXybajXHbvQqebMUlLHoJqukHgvpsgRYypebIVxaMPdRdjcfEAkLy",
		@"qTdTkBVdNnMriGJYFyzRndkhZFqrrFOuvwptVlQqqQNOVnjuAtaofNwPlBkEecykCdALNgwyWreabJEEzzJeaOtmrcULfFTJaRIldXBqkNmGWMpXDYzaGypFtAoBw",
		@"xEktRIBBudushCWYTLYMthWbStTCtvjYsLvHOOhPPYoSHUPlkrTYiiDMThdQhreffHyZaSUDzLavmpAjtEfUrBQwLACHylZgIgCCNUvdryuiYFrWIGVnTuPUCFqAfrXvi",
	];
	return oiPuIRoslpbsUIqjPS;
}

-(void)setBookinfor:(NSMutableDictionary *)_bookinfor
{
if(bookinfor!=_bookinfor)
{
    [bookinfor release];
    bookinfor=_bookinfor;
    [bookinfor retain];
}
    
prolab.text=[NSString stringWithFormat:@"%2.0f%%",[[bookinfor objectForKey:@"percent"] floatValue]*100];
}



-(void)setselfsize:(NSString*)device horv:(NSString*)horv
{
  if([device isEqualToString:@"iPad"])
  {
    if([horv isEqualToString:@"h"])
    {
        self.frame=CGRectMake(0, 0, 1024, 768);
        bookname.frame=CGRectMake(370, 200+5, 200, 30);
        editer.frame=CGRectMake(470, 255, 200, 20);
        
        nowdowning.frame=CGRectMake(290, 449, 198, 40);
        bookjianjie.frame=CGRectMake(465, 290, 200, 250);
        closebut.frame=CGRectMake(668, 178, 69, 32);
        bookpicback.frame=CGRectMake(210, 316, 120, 165);
        bookpic.frame=CGRectMake(323, 293, 87, 126);
        bgroundview.frame=CGRectMake(179, 287, 410, 450);
        
        //prolab.frame=CGRectMake(320, 415, 93, 50);
    }
      else
      {
      self.frame=CGRectMake(0, 0, 768, 1024);
          
          bookname.frame=CGRectMake(307+10, 231+5, 288-10, 40);
          editer.frame=CGRectMake(307+10, 286, 200-10, 16);
          
          fenlei.frame=CGRectMake(307+10, 322, 200-10, 16);
          
          redu.frame=CGRectMake(350, 412, 200, 16);
          
          //zishu.frame=CGRectMake(350, 408, 200, 16);
          
          nowdowning.frame=CGRectMake(307+10, 364, 198, 40);
          bookjianjie.frame=CGRectMake(172, 436, 423, 327);
          closebut.frame=CGRectMake(603, 201, 34, 34);
          bookpicback.frame=CGRectMake(172, 239, 120, 165);
          bookpic.frame=CGRectMake(177, 246, 110, 151);
          bgroundview.frame=CGRectMake(137, 208, 493, 607);
//          180  282   43  74
//407 450
          //prolab.frame=CGRectMake(200, 545, 93, 50);
      }
      
      
  }
    else
    {
        if([horv isEqualToString:@"h"])
        {
            self.frame=CGRectMake(0, 0, 0, 0);
        }
        else
        {
            
            
            
            if([UIScreen mainScreen].bounds.size.height>490)
            {
                self.frame=CGRectMake(0, 0, 320, 568);
                bookname.frame=CGRectMake(122, 89+44+5, 148, 20*2);
                editer.frame=CGRectMake(122, 119+44+7+7, 140, 15);
                redu.frame = CGRectMake(122, 207, 100, 12);
                fenlei.frame = CGRectMake(122, 141+44+10, 143, 20);
                
                nowdowning.frame=CGRectMake(51, 305+44+50-5, 219, 28);
                bookjianjie.frame=CGRectMake(51, 195+44-10, 219, 100+50+10);
                closebut.frame=CGRectMake(270, 55+44, 35, 35);
                bookpicback.frame=CGRectMake(51, 91+44, 61, 84);
                bookpic.frame=CGRectMake(54, 95+44, 55, 76);
                bgroundview.frame=CGRectMake(31, 107, 258, 40+285+10);
            }
            else
            {
                self.frame=CGRectMake(0, 0, 320, 480);
                
                bookname.frame=CGRectMake(122, 89+5, 143, 20*2);
                
                fenlei.frame=CGRectMake(122, 141+10, 140, 12);
                
                editer.frame=CGRectMake(122,119+5+7 , 140, 15);
                
                redu.frame = CGRectMake(122, 163, 100, 12);
                
                //zishu.frame = CGRectMake(122, 155, 100, 12);
                
                nowdowning.frame=CGRectMake(51, 305+20-3, 219, 28);
                
                bookjianjie.frame=CGRectMake(50, 195-10, 225-3, 100+10+20-3);
               
                closebut.frame=CGRectMake(270, 55, 28, 28);
                
                bookpicback.frame=CGRectMake(51, 91, 61, 84);
                bookpic.frame=CGRectMake(54, 95, 55, 76);
                bgroundview.frame=CGRectMake(31, 63, 258, 285+20);
                
                //prolab.frame=CGRectMake(54, 213, 56, 30);
            }
            
            
            
        }
    
    }
    
}



-(void)ActionClick:(id)sender{
    if (delegate && [(NSObject*)delegate respondsToSelector:@selector(ActionClick:)])
    {
        [self.delegate ActionClick:self.bookinfor];
    }
    [self CloseClick:nil];
}


-(void)CloseClick:(id)sender{
    
    self.alpha=1.0;
    [UIView animateWithDuration:0.75
						  delay:0
						options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction
					 animations:^{
                         self.alpha=0.0;
					 }
					 completion:^(BOOL finished){
                         [self removeFromSuperview];
                         
                     }];
}


-(void)changedirect:(NSNotification *)notification
{
NSDictionary *dirr=[notification userInfo];
    [self setselfsize:[dirr objectForKey:@"device"] horv:[dirr objectForKey:@"fangxiang"]];
    
    
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
            nowdowning.enabled=YES;
//            [nowdowning setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload",device,device]] forState:UIControlStateNormal];
            [nowdowning setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownload12",device,device]] forState:UIControlStateNormal];
            [nowdowning setTitle:@"立即下载" forState:0];
            [nowdowning setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            
            break;
        case 0:
            nowdowning.enabled=NO;
//            [nowdowning setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookDownloading1",device,device]] forState:UIControlStateNormal];
             [nowdowning setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/blank_btn_ipad",device]] forState:UIControlStateNormal];
            
            
            [nowdowning setTitle:@"下载中" forState:0];
            [nowdowning setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            break;
        case 1:
//            nowdowning.enabled=NO;
//            [nowdowning setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_introductionAlertBox",device,device]] forState:UIControlStateNormal];
//            [nowdowning setTitle:@"已下载" forState:0];
//            [nowdowning setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            nowdowning.enabled=YES;
//            [nowdowning setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_bookStartReadingBtn",device,device]] forState:UIControlStateNormal];
             [nowdowning setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/blank_btn_ipad",device]] forState:UIControlStateNormal];
            [nowdowning setTitle:@"开始阅读" forState:0];
            [nowdowning setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [nowdowning removeTarget:self action:@selector(ActionClick:) forControlEvents:UIControlEventTouchUpInside];
            [nowdowning addTarget:self action:@selector(startread) forControlEvents:UIControlEventTouchUpInside];
            prolab.text=@"100%";
            
            break;
        case 2:
            nowdowning.enabled=YES;
            [nowdowning setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_introductionAlertBoxDownload",device,device]] forState:UIControlStateNormal];
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
            [nowdowning setTitle:@"下载出错  请重试" forState:0];
            }
            else
            {
            [nowdowning setTitle:@"点击重试" forState:0];
            }
            [nowdowning setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            break;
        case 3:
            nowdowning.enabled=YES;
            [nowdowning setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_introductionAlertBoxDownload",device,device]] forState:UIControlStateNormal];
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
            [nowdowning setTitle:@"解压错误  请重试" forState:0];
            }
            else
            {
            [nowdowning setTitle:@"点击重试" forState:0];
            
            }
            [nowdowning setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case 4:
            nowdowning.enabled=NO;
            [nowdowning setBackgroundImage:[UIImage imagefileNamed:[NSString stringWithFormat:@"EBookManagerImage2.bundle/%@/%@_introductionAlertBox",device,device]] forState:UIControlStateNormal];
            [nowdowning setTitle:@"已下载过" forState:0];
            [nowdowning setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            break;
        case 5:
            nowdowning.enabled=YES;
            [nowdowning setBackgroundImage:[UIImage imagefileNamed:@"EBookManagerImage2.bundle/iPad/iPad_bookDownload12"] forState:UIControlStateNormal];
            [nowdowning setTitle:@"已暂停" forState:0];
            
            [nowdowning setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        default:
            break;
    }


}

@end
