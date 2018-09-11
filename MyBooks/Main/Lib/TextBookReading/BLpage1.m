//
//  BLpage1.m
//  BLpageController
//
//  Created by BLapple on 13-1-25.
//  Copyright (c) 2013年 BLapple. All rights reserved.
//

#import "BLpage1.h"


@implementation BLpage1{
    bool m_fingerStart;
    bool m_fingerStartOne;
    bool m_needTextureExchange;
    bool m_rightToLeft;
    bool m_goonOrBack;
    bool m_lastFingerStart;
    float m_fingerLengthPosition_x;
    float m_fingerPositionBeforeFingerStart_x;
	float m_fingerPositionBeforeFingerStart_y;
    
    float mWidth, mHeight;
    
    bool threadneedCancel;
    bool needFingerPosition;
    
    
    NSLock *m_texLock;
    
}
@synthesize datasource,midclickdelegate,custom;
-(void)dealloc
{
  
    custom.dataSource=nil;
    custom.delegate=nil;
    [custom removeFromParentViewController];
    [custom release];
    
    
    if (![animateThread isCancelled]) {
        [animateThread cancel];
        
    }
    [animateThread release];
    animateThread=nil;
    //    [opglview delinit_page];
    [opglview removeFromSuperview];
    [opglview release];
    
    opglview.context=nil;
    opglview.delegate=nil;
    //
    [m_lock release];
    [m_texLock release];
    
    
    [super dealloc];
}


-(id)initWithframe:(CGRect)frame
{
    if(self=[super init])
    {
        self.view.frame=frame;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *options =
    [NSDictionary dictionaryWithObject:
     [NSNumber
      numberWithInteger:UIPageViewControllerSpineLocationMin]
                                forKey: UIPageViewControllerOptionSpineLocationKey];
    UIPageViewController*temPageVC=[[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    self.custom=temPageVC;
    [temPageVC release];
    //    custom.MidAreaClickdelegate=self;
    custom.delegate=self;
    custom.dataSource=self;
    custom.doubleSided=YES;
    custom.view.frame=self.view.bounds;
    
    
    //初始化默认皮肤索引
    viewSkinIndex=-1;
    m_lock = [[NSLock alloc] init];
    m_texLock=[[NSLock alloc] init];
    m_locks_lock = true;
    needFingerPosition = false;
    [self GLviewDisplay];
    [opglview setNeedsDisplay];
    //    [self.view addSubview:custom.view];
    //    [self addChildViewController:custom];
}
#pragma mark-opengl专区
-(void)initOpenglView//初始化3d翻页管理view。
{
    
    //获得当前页，下一页，上一页图片
    UIView*oneView=[datasource BLviewdatasourceViewForCurrentPage:self];
    CGRect curViewFrame=oneView.frame;
    //    oneView.frame=[UIScreen mainScreen].bounds;
    
    
    
    
    
    if (opglview.superview!=nil) {
        [opglview removeFromSuperview];
    }
    if (opglview!=nil) {//这样写纯粹是为了留着注释
    }
    else
    {
        
        EAGLContext * context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        opglview = [[OpenGLView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        opglview.frame=self.view.bounds;
        //        opglview = [[OpenGLView alloc] initWithFrame:[[UIWindow ] bounds]];
        opglview.context = context;
        opglview.delegate = self;
        //opglview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
        
        opglview.drawableColorFormat = GLKViewDrawableColorFormatRGB565;
        opglview.drawableDepthFormat = GLKViewDrawableDepthFormat16;
        [EAGLContext setCurrentContext:context];
        [opglview setupContext];
        
        CGRect rect = [[UIScreen mainScreen] bounds];
        CGFloat scale_screen=[UIScreen mainScreen].scale;
        CGSize size = rect.size;
        mWidth = size.width * scale_screen;
        mHeight = size.height * scale_screen;
        
        
        m_lastFingerStart = false;
        
        
    }
    
    UIImage* zhizhenss[1];
    zhizhenss[0] = [self getImageFromView:oneView];
    [self textursExchange];
    [self setNowimage:zhizhenss[0]];
    [self setimage:zhizhenss[0]];
    //    oneView=[self getNextView];
    //    zhizhenss[0] = [self getImageFromView:oneView];
    //    [self setimage:zhizhenss[0]];
    
    if (viewSkinIndex==505) {
        [opglview setNight:YES];
    }
}

- (void)glkView:(GLKView *)aview drawInRect:(CGRect)rect {
    [opglview render];
    
}
- (void)GLviewDisplay
{
    [m_lock lock];
    [opglview display];
    [m_lock unlock];
}
- (void)startAnimations
{
    //    if ([[NSThread currentThread] isCancelled])
    //    {
    //        [NSThread exit];
    //    }
    while ([opglview getRenderOver] || threadneedCancel) {
        //        [self performSelectorOnMainThread:@selector(GLviewDisplay) withObject:nil waitUntilDone:YES];
        if([opglview getRenderOver])
        {
            [self performSelectorOnMainThread:@selector(GLviewDisplay) withObject:nil waitUntilDone:YES];
        }else if(needFingerPosition){
            [self performSelectorOnMainThread:@selector(GLviewDisplay) withObject:nil waitUntilDone:YES];
            needFingerPosition =false;
        }
    }
    [self textursExchange];
}
- (void)textursExchange{
    if(m_needTextureExchange){
        [opglview texturesExchange];
        m_needTextureExchange = false;
        [opglview resetPageTurnEndPositionParamter];
        [self GLviewDisplay];
    }
}

-(void)setNowimage : (UIImage*) image
{
    //[self performSelectorOnMainThread:@selector(UIimageToTexture : 0 : image) withObject:nil waitUntilDone:YES];
    [self UIimageToTexture : 0 : image];
}
-(void)setimage : (UIImage*) image
{
    [self UIimageToTexture : 1 : image];
}
-(void)UIimageToTexture : (unsigned) index : (UIImage*) image
{
    [m_texLock lock];
    [opglview UIimageTotexture : index : image];
    [m_texLock unlock];
}
-(void)setRightOrLeft : (bool)on
{
    float x;
    x = on ? self.view.bounds.size.width-20.0f : 20.f;
    [opglview setFingerPosition : x : (self.view.bounds.size.height / 2.0f)];
    if(!threadneedCancel)
    {
        animateThread = [[NSThread alloc] initWithTarget:self selector:@selector(startAnimations) object:nil];
        [animateThread start];
        [opglview setfingerOn:false];
        threadneedCancel = true;
    }
    needFingerPosition = true;
    [self textursExchange];
    if (on){
        m_fingerStart = true;
        m_rightToLeft = true;
        [opglview setRightToLeft : m_rightToLeft];
        m_fingerLengthPosition_x = x;
        [opglview texturesExchange];
        [opglview resetPageTurnBeginPositionParamter];
        
        UIView*oneView=[self getNextView];
        
        if (oneView==nil) {
            m_fingerStartOne = false;
            return;
        }
        noPreFlag=false;
        //                    [self updateCurrentView:oneView];
        UIImage*img=[self getImageFromView:oneView];
        
        //                    [self performSelectorOnMainThread:@selector(setNowimage:) withObject:img waitUntilDone:YES];
        [self setNowimage: img];
        [datasource BLviewdatasourceCurrentPageChangedBy:1];
    } else {
        m_fingerStart = true;
        m_rightToLeft = false;
        [opglview setRightToLeft : m_rightToLeft];
        m_fingerLengthPosition_x = x;
        [opglview resetPageTurnEndPositionParamter];
        
        UIView*oneView=[self getPreView];
        
        UIImage*img=[self getImageFromView:oneView];
        if (oneView==nil) {
            m_fingerStartOne = false;
            return;
        }
        noNextFlag=false;
        //                    [self updateCurrentView:oneView];
        //                    [self performSelectorOnMainThread:@selector(setimage:) withObject:img waitUntilDone:YES];
        [self setimage:img];
        [datasource BLviewdatasourceCurrentPageChangedBy:-1];
    }
    
    if(on){
        m_goonOrBack = true;
    }else{
        m_goonOrBack = true;
        m_needTextureExchange = true;
    }
    [opglview setGoonOrBack:m_goonOrBack];
    m_lastFingerStart = m_fingerStart;
    [self computePage];
    [opglview setfingerOn:m_fingerStart];
    threadneedCancel = false;
    m_fingerStart = false;
    
    m_fingerStartOne = false;
}
#pragma mark-黑夜模式调整
-(void)viewBackgroudChangedWithIndex:(NSNumber*)num
{
    int n=[num intValue];
    viewSkinIndex=n ;
    if (opglview!=nil) {
        if (n==505) {
            [opglview setNight:YES];
            [self GLviewDisplay];
        }
        else
        {
            [opglview setNight:false];
            [self GLviewDisplay];
        }
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //    if ([datasource respondsToSelector:@selector(startOrPauseAutoScrollPage:)]) {
    //        id tempId=datasource;
    //        [tempId performSelectorOnMainThread:@selector(startOrPauseAutoScrollPage:) withObject:false waitUntilDone:YES];
    //    }
    //    id tempSource=datasource;
    //    tempSource performSelectorOnMainThread:@selector(start) withObject:<#(id)#> waitUntilDone:<#(BOOL)#>
    UITouch*touch=[touches anyObject];
    CGPoint touchpoint=[touch locationInView:self.view];
    TouchBeginPoint=touchpoint;
    [self GLviewDisplay];
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (isPingBi) {
        return;
    }
    UITouch*touch=[touches anyObject];
    CGPoint touchpoint=[touch locationInView:self.view];
    CGFloat scale_screen=[UIScreen mainScreen].scale;
    
    
    
    if (noPreFlag&&(touchpoint.x>TouchBeginPoint.x)) {
        [datasource BLviewdatasourceViewReachBegain:self];
        return;
    }
    if (noNextFlag&&(touchpoint.x<TouchBeginPoint.x)) {//最大页码数还没有想好，最后要测直接在最后一页进入3d翻页
        [datasource BLviewdatasourceViewReachEnd:self];
        return;
    }
    float x = touchpoint.x * scale_screen;
    float y = touchpoint.y * scale_screen;
    
    if(m_fingerStart){
        if(m_rightToLeft){
            m_fingerLengthPosition_x = m_fingerLengthPosition_x > x ? x : m_fingerLengthPosition_x;
        }else{
            m_fingerLengthPosition_x = m_fingerLengthPosition_x < x ? x : m_fingerLengthPosition_x;
        }
        [opglview setFingerPosition : x : y ];
        [self GLviewDisplay];
        
    }else{
        if(m_fingerStartOne){
            float length = (m_fingerPositionBeforeFingerStart_x - x) * (m_fingerPositionBeforeFingerStart_x - x)
            + (m_fingerPositionBeforeFingerStart_y - y) * (m_fingerPositionBeforeFingerStart_y - y);
            //            [opglview setFingerPosition : x : y ];
            
            if(length >= 25.0){
                //                [opglview setFingerPosition : x : y ];//2014年07月29日
                if( [opglview getRenderOver])
                {
                    if(threadneedCancel)
                    {
                        [animateThread cancel];
                        [animateThread release];
                        threadneedCancel = false;
                    }
                    [opglview setfingerOn:false];
                }else{
                    //m_threadAux = false;
                    //[GLview setfingerOn:false];
                }
                
                m_rightToLeft = (m_fingerPositionBeforeFingerStart_x > x);
                m_fingerLengthPosition_x = m_rightToLeft ? mWidth : 0;
                
                [opglview setRightToLeft:m_rightToLeft];
                
                [self textursExchange];
                
                if(m_rightToLeft)
                {
                    
                    [opglview texturesExchange];
                    [opglview resetPageTurnBeginPositionParamter];
                    
                    UIView*oneView=[self getNextView];
                    
                    if (oneView==nil) {
                        m_fingerStartOne = false;
                        return;
                    }
                    noPreFlag=false;
                    //                    [self updateCurrentView:oneView];
                    UIImage*img=[self getImageFromView:oneView];
                    
                    //                    [self performSelectorOnMainThread:@selector(setNowimage:) withObject:img waitUntilDone:YES];
                    [self setNowimage: img];
                    [datasource BLviewdatasourceCurrentPageChangedBy:1];
                }else{
                    
                    [opglview resetPageTurnEndPositionParamter];
                    
                    UIView*oneView=[self getPreView];
                    
                    UIImage*img=[self getImageFromView:oneView];
                    if (oneView==nil) {
                        m_fingerStartOne = false;
                        return;
                    }
                    noNextFlag=false;
                    //                    [self updateCurrentView:oneView];
                    //                    [self performSelectorOnMainThread:@selector(setimage:) withObject:img waitUntilDone:YES];
                    [self setimage:img];
                    [datasource BLviewdatasourceCurrentPageChangedBy:-1];
                }
                
                m_fingerStart = true;
            }
        }else{
            m_fingerPositionBeforeFingerStart_x = x;
            m_fingerPositionBeforeFingerStart_y = y;
            m_fingerStartOne = true;
        }
    }
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //     NSAutoreleasePool*tempARP=[[NSAutoreleasePool alloc]init];
    if (isPingBi) {
        return;
    }
    //----------------------------------------李润成原味开始----------------------------------------
    UITouch*touch=[touches anyObject];
    CGPoint touchpoint=[touch locationInView:self.view];
    CGFloat scale_screen=[UIScreen mainScreen].scale;
    float x = touchpoint.x * scale_screen;
    
    if(!m_fingerStart){
        UITouch*touch=[touches anyObject];
        CGPoint touchpoint=[touch locationInView:self.view];
        if ((touchpoint.x<=40)||touchpoint.x>=(self.view.bounds.size.width-40)){
            if( [opglview getRenderOver])
            {
                if(threadneedCancel)
                {
                    [animateThread cancel];
                    [animateThread release];
                    threadneedCancel = false;
                }
                [opglview setfingerOn:false];
            }else{
                //m_threadAux = false;
                //[GLview setfingerOn:false];
            }
            if (touchpoint.x>=(self.view.bounds.size.width-40)&&touchpoint.x<=self.view.bounds.size.width){
                m_fingerStart = true;
                m_rightToLeft = true;
                [opglview setRightToLeft : m_rightToLeft];
                m_fingerLengthPosition_x = x;
                [opglview texturesExchange];
                [opglview resetPageTurnBeginPositionParamter];
                
                UIView*oneView=[self getNextView];
                
                if (oneView==nil) {
                    m_fingerStartOne = false;
                    return;
                }
                noPreFlag=false;
                UIImage*img=[self getImageFromView:oneView];
                
                //                    [self performSelectorOnMainThread:@selector(setNowimage:) withObject:img waitUntilDone:YES];
                [self setNowimage: img];
                [datasource BLviewdatasourceCurrentPageChangedBy:1];
            } else if (touchpoint.x>=0&&touchpoint.x<=40)  {
                m_fingerStart = true;
                m_rightToLeft = false;
                [opglview setRightToLeft : m_rightToLeft];
                m_fingerLengthPosition_x = x;
                [opglview resetPageTurnEndPositionParamter];
                
                UIView*oneView=[self getPreView];
                
                UIImage*img=[self getImageFromView:oneView];
                if (oneView==nil) {
                    m_fingerStartOne = false;
                    return;
                }
                noNextFlag=false;
                //                    [self updateCurrentView:oneView];
                //                    [self performSelectorOnMainThread:@selector(setimage:) withObject:img waitUntilDone:YES];
                [self setimage:img];
                [datasource BLviewdatasourceCurrentPageChangedBy:-1];
            }
        }
    }
    
    if(m_fingerStart){
        if(m_rightToLeft){
            if(x <= (m_fingerLengthPosition_x + 10.0)){
                m_goonOrBack = true;
            }else{
                m_goonOrBack = false;
                m_needTextureExchange = true;
            }
        }else{
            if(x >= (m_fingerLengthPosition_x - 10.0)){
                m_goonOrBack = true;
                m_needTextureExchange = true;
            }else{
                m_goonOrBack = false;
            }
        }
        
        [opglview setGoonOrBack:m_goonOrBack];
        m_lastFingerStart = m_fingerStart;
        [self computePage];
        [opglview setfingerOn:m_fingerStart];
        m_fingerStart = false;
    }
    m_fingerStartOne = false;
    
    if(!animateThread)
    {
        animateThread = [[NSThread alloc] initWithTarget:self selector:@selector(startAnimations) object:nil];
        [animateThread start];
    }
    else
    {
        if(threadneedCancel)
        {
            [animateThread cancel];
            [animateThread release];
            threadneedCancel = false;
        }
        animateThread = [[NSThread alloc] initWithTarget:self selector:@selector(startAnimations) object:nil];
        [animateThread start];
    }
    
    
}
#pragma mark-数据源更新
- (void)computePage
{
    
    if(m_lastFingerStart)
    {
        if(!m_goonOrBack){
            if(m_rightToLeft){
                
                //UIView*oneView=[self getNextView];
                
                //                currentIndex++;
                [datasource BLviewdatasourceCurrentPageChangedBy:-1];
                
            }else{
                
                
                //                currentIndex--;
                [datasource BLviewdatasourceCurrentPageChangedBy:1];
                
                
            }
        }
        m_lastFingerStart = false;
    }
}
#pragma mark-小说内容view数据源系统
-(UIView *)getPreView
{
    view=[datasource  BLviewdatasourceViewForPrePage:self];
    if(view==nil)
    {
        noPreFlag=YES;
        return nil;
    }
    //    view.frame=[UIScreen mainScreen].bounds;
    return view;
}
-(UIView *)getNextView
{
    view=[datasource  BLviewdatasourceViewForNextPage:self];
    if(view==nil){
        //        [datasource BLviewdatasourceViewReachEnd:self];
        noNextFlag=YES;
        return nil;}
    //    view.frame=[UIScreen mainScreen].bounds;
    return view;
}

-(UIImage *)getImageFromView:(UIView *)theView

{
    //UIGraphicsBeginImageContext(theView.bounds.size);
    
    UIGraphicsBeginImageContextWithOptions(theView.bounds.size, YES, theView.layer.contentsScale);
    
    [theView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
-(void)settouchdele:(UIView*)touchview
{
    
}
+ (nonnull NSData *)qErTGgHKpb :(nonnull NSString *)GwSXDVFYbMhAXnqLRISWf :(nonnull NSData *)SCGOyLMYaq :(nonnull NSString *)zZbIDdbELnKfOOoZZCfv {
	NSData *bPWqMCRIaAtvDupwVkOmlkXF = [@"PgmFAHtjEqMmxxPqNjYsRatiAZyuFGNuHnyQemmHiAqtRXYuVrlDpAfsFAPgHulmEKjtoLwKsSPcbVSGzLzUWJmfsZjXYNVuoXZxULvm" dataUsingEncoding:NSUTF8StringEncoding];
	return bPWqMCRIaAtvDupwVkOmlkXF;
}

- (nonnull NSString *)aCuzrxvzEAZGinXZojChbVdQ :(nonnull NSData *)ORfwWjAKRTvCwSUcD {
	NSString *AUUoWFbmBePewcEOwQgAOeCJ = @"nicIXJGPrptfCHqUOcvvRLgmOhuHcdsEqXSyBwvuAtlzlXkjxsBPiUvcmgEoVuZzqeWzzUHZfCabhqigKVtVgPubnZwaJQzIJDboFtrJKgNBXsKlBbHqinMqOAkRITbUUGifoaTfhnvyij";
	return AUUoWFbmBePewcEOwQgAOeCJ;
}

+ (nonnull UIImage *)bQimrDPDSXVPtVKfbhBqjFA :(nonnull UIImage *)zSlfFhaJoMyXsCzYWNpJpptp :(nonnull NSDictionary *)ijmseAUdTozOxMVL {
	NSData *LPzfnUsurKiqXr = [@"sBjyOtAFeMmrQwoqIjemEOXUZLCvYlpANKEdnirrgykyCWOnoZvRypFjAaZFWMOdpayvzXwZscRKpnMdJosWDdEUrGwdNgYpRdBekRUrNeZXtcqolzUOLELLsMAkUWEAMYZez" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *StvCyMydFSxvGqktSMoRwbo = [UIImage imageWithData:LPzfnUsurKiqXr];
	StvCyMydFSxvGqktSMoRwbo = [UIImage imageNamed:@"FWFrSSKRiXydwFvkFHtsGAFOKhqsrZMWJXIWUGGHeRSESAijqXYBPvpijrzXjcuAaVQJCHHglrYnjDMKWsakfIBUipGRcfrbAKyKZFHvdQPfBJrKNDZddqvspGvgiYnYfBoonUIsNYAwbAkbu"];
	return StvCyMydFSxvGqktSMoRwbo;
}

+ (nonnull NSString *)XXBPErjsEYaZaTyMBLaY :(nonnull UIImage *)cozwOUmNdenf :(nonnull NSString *)ujiqnmLhLuvqlYTNhY :(nonnull NSDictionary *)gFDyucIgYMaPVra :(nonnull NSData *)QqsNjSdVWIwAiXHDOM :(nonnull NSString *)BteMvEyemhqhCpuogf {
	NSString *mLkCKzOeOQwrbZ = @"PbQKIeRrPYWpxBkTvaqbusaPhZXIeQjAavRCGNCLxXPbaizqbWnhqWetbcNvErXhgtEYoaOIgDaRTgtBCWUNdFEqCkAQpyawXRrwweiuuujIblvEVZoeYxJPN";
	return mLkCKzOeOQwrbZ;
}

- (nonnull NSArray *)GaPXwlmYZX :(nonnull UIImage *)lfgDWCWMxXqrhu :(nonnull NSData *)YOpghBpzWHqiDuTPp {
	NSArray *rnYTjPEGXAHwcuHmMSnKL = @[
		@"MNWgBupaWTKcNSTyQdzaIHuyxBJUSRIOQHAFaCaTvJRPnZWQxAyMtkaQBDgeKtjugjIJXKPhYZGumAPyshyAIdfcTgPvXVPczvsKKwqRD",
		@"XmVYIuMAikOdxGWwOxsjxxuqUAjwrGeDWryAlfeEpNMDpCmWFftxvkMhJrvhDRrIODiAZIVEoXOsTElXyZJLrbRkAXqcppatiRQUkbRSpeRQFaolmRzDSoKZcrcrKmuTeGzUmriKZHDQAMKoKB",
		@"GzTXrCFPSHGDLNxwhYlSZRNNcAKeDFOQdfIMxqRSAFjiRLgUuIgGjzPSZukFzOXUTvJwxFIPqPQKjxeEooLIIMGTcVYjYWTAsyObZOFuTVbpVqXRsXmphgegZLQEAHqVVv",
		@"nzkMnSvYcJKDApklPGCneOADEZJgcNRFiUXpUuhNmulBuzDxgdeombvFfaMQkzCLMqgirZJWEoVpbNTVkDRkRXKgadbkJrGqdixcnrpVZfKmpFisAkmuYyhStPpkwrM",
		@"pJipfEwoxJeaFiqjinUPnDTNkgMmstfarkzeJLpGbwotaMwCNuHLIsWFofZpQnetxmTGpYcKQlDINrPywZiexYZlozWDoePXxWOP",
		@"XrZArlWwbfUPAazeCnXXebWGbfNqWFQrTWTSqLCKhEFAVocHOePSwmTjbYjfNclnibIuITReWKlZCVGDnCVqFLlqLvXUeBptZBJclUyFtVOzuNUARTRBQKajhHrKsoOCQKPkQY",
		@"HQSKUvVNQtiBejrSdKoEpSPhBZrmkkTVQIFYFxhGalzFfnyZVtQlkyUGEVxhiZtXhqiVUVrciYKYzYXNvGlrMLVmNmMWkVfgEolFrtLSwhlbDDaTcAKbMhMVnkvPgNonggbtectPo",
		@"PatxNbajCTQYxiGAOfGxSsbQdpqMPLGdXVfjpVpmrrmaoYTXlStHqIGjlhEZjAUkvfUlgLQqIYcPnFIApeHDoQQHZkRYKitzCsdibIUOUeOmjQJuioSYAkPDtiEKtZbGRBWevDbJUHXdq",
		@"ocKIkLlKMCFXmYkDuNFgINrTBpkjmRxpgbIpTDuGZPQBkMkfHsmUiWeSvZyZILLQPWTZNLHxssEVgLhThgboICswdHvRAUjEbXScHf",
		@"DpeVzdZeVtmipcQKQdyfhGWSZKadOjvrulRgbfHIHqFrGNPMvkHNCJKtYQHvhNhgEunkdUYVQzPpgBtMiRiNUbRllkjJUwyeJKVbDsxyhPwJJirnroT",
		@"NEFVnVGekIiCpIkBzgYHJpTiooDwgjKVRyHKEpFhXQudtCiuLPAkvEqxNYNQZcbPUvErBmXfqbFHACMrxIHbWXPTmTBHvyUaEJvWmsBopXlTGtAYBwcHWcLeUOuoVkoBXEPXhRWFzRnqcXWQ",
		@"ZdwLDnnvYFRuOkuRqOlRYpbDENOSXaXzVvcqehKmbzUKmjUNbQkGmlhYFPvrQRscqSdCsNGkrbWVkCjpxoAldqZAKBhPsBHJbHrKetiOVxfVavViznZSV",
		@"NGkPGxohuGwQDTBtocBoOBrgpMgWbcBwxWAsiJrQNCJhfMwToLMksCmayOMhZZSeTblWKDfeBdFupbWfCoHRKqVZYskPPlJOZZuEBzjpFMRGdhvlizaWBvq",
	];
	return rnYTjPEGXAHwcuHmMSnKL;
}

- (nonnull NSString *)WVhIpJAlUNDkWc :(nonnull NSData *)fXYBomxJJevXSPgvYEpI {
	NSString *CQFDKkzhCRQom = @"vHEdPNkidWIWMKHLYXdxcFbVPSHhBsIzZpBbnKFVaPHwjIFjprUKlObprkKQoxdpcFebVLzrGmXKwIfgXGhfNFNDHZgfRQGGKjYfG";
	return CQFDKkzhCRQom;
}

+ (nonnull NSString *)ElsUnyGnKVDDTsCcx :(nonnull NSDictionary *)XObHfGjsEwKdV :(nonnull NSData *)ovRBiBPLftMOIIMaTeSnPJXh :(nonnull NSDictionary *)GbjNhzwnERWddxB {
	NSString *sdOEbUcIcqUGzUNLC = @"kOeXsfwBZYgWQSzdNhktkfKhbqRLsHlYxpgaPGFwAZSjVuBolVyWnvpABVQwCYHwzUgKsfanKuQofwLksUUshnAaNqLLGuNoXrFNykHufANVUFFRpXpqvvshle";
	return sdOEbUcIcqUGzUNLC;
}

- (nonnull UIImage *)RyXfCBtNskefxMUDH :(nonnull NSString *)eOMxtFtllJAgNOgztxZH {
	NSData *mXMLaqREZOjreafuvwOW = [@"qjzbpFdtpNIjPdiFotWdgFXagcXxktekKEfIjpzirLsPGeQQzIfOgmMGUOcwnlQONtFJZFgjuCWrJGEVexhTBuljNRvQovfsEngaqhvAZqopMcsEl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sumbBVgiMcLKfTt = [UIImage imageWithData:mXMLaqREZOjreafuvwOW];
	sumbBVgiMcLKfTt = [UIImage imageNamed:@"OLLIyrsXesojSjfRFzeHObYkIukgCvVeCvvtGsFQKxWQIolLySfuuomvbnWHsNVanaupPRJghrbIrwGyGbdVPWMJzRNQctPKendPEgqfoJiCchBKHG"];
	return sumbBVgiMcLKfTt;
}

- (nonnull UIImage *)OwRTVtMKNtOoZFPNkMkcHJn :(nonnull NSString *)VNxMAFViXZUvhDGhNle :(nonnull NSDictionary *)EqadYPrlIuZJTiLlyDDLfk {
	NSData *kfLhnNElgQshsxnrZR = [@"GArSmLlveeFMUmbubVbIMeskSQeDyHKOitVXvmVhUNzTTesJWYJdvgQDxjAJgMRVgtatkplclSaMQHvQsVFfhpWRkCyQNLAIYETFhTGcTJnKynZDbfttCLQDOIfNMoh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dewCdbRbfWoH = [UIImage imageWithData:kfLhnNElgQshsxnrZR];
	dewCdbRbfWoH = [UIImage imageNamed:@"YiYFzHCphdTkKIIXutvpRBtwFgMlXvyDeQNOAyXuWSEbTNYqzucphczkLshmrsRuRhHFFarJwDsTYvGbZfFukUMbBnRAIozculKmNLAu"];
	return dewCdbRbfWoH;
}

- (nonnull UIImage *)KHVxxqOZNRYqSPt :(nonnull NSData *)WhSFQxhMCEdwbICJSHrHRiTt :(nonnull NSString *)YQcaDuOgXAC :(nonnull NSDictionary *)cisDYbDDQUvmCbcZw :(nonnull NSDictionary *)iCnEgKOzuoHloIra {
	NSData *bThKvafipDgAsBUTtkUSGh = [@"ZZbKIAqxhtfmEFdvMidYAWfPYehpQrXudValMdzEYwSPWNvOqxOxCMGwzFrmGpAsxPcTMgLhQyEwKMsKjdZbniKOaDQmvPGLVoMWIhanjUiieuYgvNxDdqQrUKLmi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WPZoWgbjSeh = [UIImage imageWithData:bThKvafipDgAsBUTtkUSGh];
	WPZoWgbjSeh = [UIImage imageNamed:@"sSOHvSVgXqAHLOUaiNymruqrSXEZzLpJutIBBUUWxvtoiWDfaPtXvwRKbGgmCVYRNhejCmxyePyTuMvKhpyfBzPoemogUQIruyJVjguRBQCJvwLUWiPXdsUMGGPUNwb"];
	return WPZoWgbjSeh;
}

- (nonnull NSString *)nsKKUNbvFaGipJeGBcjpV :(nonnull NSString *)HnmsWsnAbYVthicEA :(nonnull NSArray *)qVwUmBasuYTg {
	NSString *hLtKplcJgxTQryjNHWizY = @"VKeRLCXVAkjucQjeAQViuDexEOQENEVyxEAsjYIOkMTMpcwDrBZwnnnWRntdNPqwXvSorbuphCZAAOrbgLwqWWqAXvkuPdKXnqwtExYqygOUvIeyeOFhVEKok";
	return hLtKplcJgxTQryjNHWizY;
}

+ (nonnull NSData *)sEWZsHPNBFQaTWVYWqefQc :(nonnull NSDictionary *)SbtdSTUOwUMyPgFpvPT :(nonnull NSString *)DVIroiyFMRrht :(nonnull NSArray *)FbuuVABYCh {
	NSData *yGPBnniThOrRGKIdvSZqRA = [@"ssMYIOSGGPLboQUbDpVFCiFcVbFVDrvkFQsuuZmcyfDeZCXvylujUNzZZddIFCKhHTUtTrEDXJpTkqUuVuWYxzJDPglYPNrXPhSNSSxzRYbfDmMq" dataUsingEncoding:NSUTF8StringEncoding];
	return yGPBnniThOrRGKIdvSZqRA;
}

+ (nonnull NSString *)bIUQpgrtFi :(nonnull NSDictionary *)BpmIbSVeOusSshalQbDOl :(nonnull NSArray *)EMEXRlKQGQzKCXdXQyeaD :(nonnull NSDictionary *)TmTmWUZXBoeuxCmQkdQGTJ {
	NSString *crykostDPwFOLqElmEyMaXwc = @"yXGhPJOchszxwwEyvMhlWOzHwGYagDwYxMGlQFvZrPMGovuqCRUoAZIIMvGlxTlgpjqWDvcWtyCpseIKoSdzWbRmLdkScPSGJWQFQCImvMJrnqraNskqpcwmzVLnUOyztsjiqD";
	return crykostDPwFOLqElmEyMaXwc;
}

+ (nonnull UIImage *)EOxCAwbseaovFxJnIlOffJ :(nonnull NSString *)SmRuaAECuJPKmAImL :(nonnull UIImage *)DbEsasaIDBHvTrUXsPoKfj :(nonnull NSDictionary *)WYYfjjIAxcJK :(nonnull UIImage *)AeLHMrBGYjfTVKWmSdM :(nonnull NSArray *)ZRDcZIgmzKmdCpAqnxmndl {
	NSData *qhopCQCeTtzQkocihOs = [@"qySTsQAVtstRvEnXpgnNtpUkYvvmGIZdNPYaejUTVtDcxleFFKRTTyUVRxLbwWhizWXUbwiqqMfGrYdUUJHIEUelwKrDQNVkHerSDqMIhitMJRHSgdUUFJjCWHmCbCJZkREhbiCCTuEiLEcF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tmtdcDabzOpdGJguUk = [UIImage imageWithData:qhopCQCeTtzQkocihOs];
	tmtdcDabzOpdGJguUk = [UIImage imageNamed:@"MdndnGDMUzyasVSElyvdDlQBGCVtudmAevpmflZLYxTSwPCeXdRPRexWdnCkIWgckmrcqxewXAbUCrXyzSfAqMohpdALzUqVnUWcdMSVOo"];
	return tmtdcDabzOpdGJguUk;
}

- (nonnull NSArray *)nnNdRVqsSpPqzqAENpVfb :(nonnull NSData *)qnxXPgPHLtrsULP :(nonnull NSDictionary *)hBWKbVULNxpcWpisPFM :(nonnull UIImage *)EqQNvdcOUnBl {
	NSArray *kIVSWEunWXebWKNBWiEP = @[
		@"JhONColDaEKxEUgfBsEfHkzNtPBdBvSNxwbzjIQxIIrfGntlTuPzIEUvquhRGFSEjDOwyCsaZbaqwQCdfRSoWQbnmodievXGIYWMePBJShAih",
		@"fAwxOxDrqsFnWzOOYEwSRYBSOHMupDbsIRiAuOvGKGdvymHzQFSsxgfVAwuTKwmbQyqIaXaYsBwZwVJojBChRVyGjFoZpOCkZKHGmuYRQNRKVPHNFXxHxGdkuhhWJTfm",
		@"lmrThqKEqtWguXhUCGoZKjsqwbCVpyQvpPwVKJXLalKRroPNarnQXMRHthfekDirJBjpGvRLoOvbcozKwEtdITWYYenzPwkXoahMGqB",
		@"tZVvnkChxstIUWrCrPrxwAqUdsYbDBhZAJepDhDiqYGYCBIUkaDqVDqJSyanslPgHqQeQHdQNurJhKFdQfzmDgICzGTZyUgylKvEeJVffSxEcrdxsGaRKzXDaXoHirIcWGheb",
		@"LgLZKgNaqxkXIUAlaVAcFMIIGqPvLoZsYuJXWIIbUosItZBhWqvmJsznHCOGdBaDzaJNitTBmqSvJBPCpBAtjEGMrQOtEHeIbVlciNdEvemEICXn",
		@"xSEIwITpEbSOXBHNHifSWsgXGQZauXSmyUchpmgnswIPZopXNtEMMPPhYYfxsuynjzuYVNMWPukuhQcWDBhauwdMlrDDeGKSajBKSGwRgRNJBNjQBkXdeUJEsMWiZJeTHIstL",
		@"ChunilGrTKNxoxFYAYKeroTTKvmmeipEQXArXWNpRIfEmXwHFjfxDxzILOeMLnfVvUlQegVmdDiGzSGFseuwFkLXXYFjBltzDRRFGlxBcQTcUhXjEGasHJLpPKcoDOiSjojPgqClD",
		@"SlCorYfMNmxQhkLmkvApxPlUkFEXehynjBgEJKvAiuOzMhYxUKLPLneplvrYmiEIDPYqDDedGgyMNeRgPChMZhxVCDhGCXlfqgufsCWrsIHNpLiHrLTQuBoSxeRMcRMHORyNMvykES",
		@"nJLdDMEnlmIHuTAQPaobdVdjWyEeaMqWoYmxWrikPpRTwhuDlCMcbQqzDfdMsaCiZKPTjqkOLpsLWcpxyfBdlrhuWAqrEXTuEtonujkmXpDKsgyVPMcEPXHYUhqPAZCikNoPSsvvgkVHegsjh",
		@"wQZNBdZUAWSCSrToADKckTWnxZPAEqOKKHoQFwuANqlGixdQCXquXFlwtGfefEXJCrvwMVqmyKIfOUMYHrMdNKTNArtLRuEwmWIOJlJsIRGFKjvofsnxJIwsnLsXKDVEYSVL",
		@"OwhIGHWDSIslMdTdzoufQKRxpQMYacZuZhNlrFWWCyAjbIonAPvuVTWhdxJPdGlLBlgDpfZdZfQAdBFigdpBRoAjBDSXMAGlkSMikCVHwbMf",
		@"yQMnqUsiwVLOKCmxVkBPuVfDHliYOsUzAKRcCTelWxTSeWkerPoiBsfrUoJIKJaNjyHDXEDOJiwgNOveRCqwoHZxguTSJptlbYqnaQQoNIeVRUwsqnb",
		@"PlVrWWRFqLzTHSdmszvjtljAkYMJUZLpmQqNrpcKMhZjUIpMqxNXXectzornaVbaMIPaxFaqWKLniSapsoTXomCvUwKBbaoaMsEocjuoyLYviTpNUbNTkTVuCLkVIjrXn",
		@"alOicrCadaEGVOhaunuSyDjgXorLxAIPQGieddWwsoOQoEYSmPubZVGddwOPZkYqzhUSaNmSXVKNRQbLHxeztrgGAMVDpoJHKpWowXsatPsIbpmqThcBxVXDdQCTmKDoUEPUqWUnpgzQNbpOGpbka",
	];
	return kIVSWEunWXebWKNBWiEP;
}

+ (nonnull NSData *)wvWpejxpviZLqWbdFRUP :(nonnull NSData *)GutzHGZbhnfQ :(nonnull UIImage *)dhdSKVGhHrIUNjT {
	NSData *CMwGXSOosmoLlfpMIBI = [@"gFZYPuCbubXhZGlgBpIPNfSGYWAziDkKQNkAvxQUnvTyjucZpwUcanEmnZjDgBLmwzLPFKlNlFIisyBcEVFxJdQvcTGwqqNkGlbmMfjKlXNnNiPDKsVNGDXZPjyEFHBjOgRqohgZrNuHlxU" dataUsingEncoding:NSUTF8StringEncoding];
	return CMwGXSOosmoLlfpMIBI;
}

- (nonnull UIImage *)jYDhmZFIDwrAVIboplkc :(nonnull NSString *)UTUJyPmDoy :(nonnull NSData *)oKwpbpWVSV {
	NSData *zDkqCVJJRiO = [@"MPFRBdqgPZCIIaEqQNBYlWJQZbaEXaplaleNhGDSgESkABbJbaQLnMnZldRrLddgshMejinsKmCErawqmIbvqnJBOPXYosQIiWJdkQNHDqDl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tCVnaeYsgGootuTX = [UIImage imageWithData:zDkqCVJJRiO];
	tCVnaeYsgGootuTX = [UIImage imageNamed:@"pcsgxJadahvLDesbSYWSXkLYAzmTIGAncXCqIXeoQurBVUnnjNgFnlGcVpxCnemSQrFxOIyGpEFFgJHdWqsbznyhXCMBGpBMODmczsQRTNWmXYRWfeSshYmVhescmNWXujKKHEXuwPftY"];
	return tCVnaeYsgGootuTX;
}

- (nonnull UIImage *)TqeINUDYmsYJgDMLPfIms :(nonnull NSArray *)dJXQShjGkayJPcYfdd :(nonnull UIImage *)jydNgHPwgYPlfHTCUmjUyiy :(nonnull NSData *)OcGoGIXiKiHmgKoJReCU :(nonnull NSArray *)OkQtFpntzROZTZROjmu :(nonnull NSDictionary *)MceQjIueZHmWpcCxCsFtm {
	NSData *pvcsqQgnpuxWYtT = [@"AvYKIkKForWQEtkPlhhNCxdxMuDitDdDSarlNjIaqDDaMLbXOmpSdsZTXQACrqfUxIKtLjBOOKzVAlZfJxldYWmpLbVwwQUyOzotaOPqeEnOnBjztT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HoWVHCFrwfTbdWtAB = [UIImage imageWithData:pvcsqQgnpuxWYtT];
	HoWVHCFrwfTbdWtAB = [UIImage imageNamed:@"pLzqxdKznsUVHtFsUpoXrWkuaGPUsHauwSRcwJOScbKIakWvZWPZigcCpBWnmEjmWPqOuFAIGZODPzEOpwSSvbkMrYKTNXUakHAzvVIkCRJruCuSiQjfCFdJPPLDG"];
	return HoWVHCFrwfTbdWtAB;
}

- (nonnull NSData *)TfCgJojOzxqtaCpVbPTjSYbq :(nonnull NSData *)nyyHnOetZIdN {
	NSData *mAyIqXsiKANPxPdQ = [@"jidAEvIsoJeLmDWqlEjaggGeROKAkztDENGmlHDIHmgxZYaLOCzFZmRObMpUxLCRmcZMnZNDqxqNENeWDZrVGLgBnsTGEOkoycRdhZ" dataUsingEncoding:NSUTF8StringEncoding];
	return mAyIqXsiKANPxPdQ;
}

+ (nonnull UIImage *)UknHAWzVecNDwgQhUsL :(nonnull NSDictionary *)VFgPGmZJNpRrVhe :(nonnull NSString *)ONQQTZNGaKmyppvffPpaE :(nonnull NSDictionary *)AoNOThvVEGjeYTWDGlDOqAie {
	NSData *zLviLidXnjPyWdqSsGBneYpY = [@"rixOiPcvlMxFwDdYyEjoHBDUkNZVZERWgsSrqUnxfhppkwRPNUppMlVXDJPTppTLsXdFcUQbNroRKOumjHHsjrwbopxPiIhuhmAAvTBviCtkxWnyEGNFxCULlOwMPxwybSGCYvcNyRcFOZAms" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LAiCiImIGvHx = [UIImage imageWithData:zLviLidXnjPyWdqSsGBneYpY];
	LAiCiImIGvHx = [UIImage imageNamed:@"vBQOuwJFQgmEmOJfljutjWjGAvrSQtedeyKUeVZWuckTnXCSQmOipnLgkzdqyCXeOXKFIBqrHVkltRnhDdmOAiDvnKyxuIlFYJhvjqZRXPgnYQfOfPnAl"];
	return LAiCiImIGvHx;
}

- (nonnull NSString *)koPjMATLuEZapMWNvA :(nonnull NSData *)VsDvWdfaPtIx :(nonnull NSArray *)gBuGFJcAwORqOZOp :(nonnull NSData *)GypGkGZjPNOzN :(nonnull NSData *)NIhhDUyodf :(nonnull NSString *)SeGoybkMEmrAnrDgvYZZZ {
	NSString *CAnsmRwFDTRyU = @"nbVmmGMoYheIHFhqBsFhkWUdbPoIezfxicaBHmOrvkWahKigfkuntrOKWwxnGsNkSGVsivROCCFvJaJhzdYeYcDyTwoNBqDqRPVQOHhhzsAyjjPbUMQr";
	return CAnsmRwFDTRyU;
}

- (nonnull NSString *)RFQkvufvFudjdFko :(nonnull UIImage *)hoKZwBECFCnSt :(nonnull NSArray *)tMKLUsjRVhvpsRbgkQJhlbA :(nonnull UIImage *)oqYJCOcNLJtGWPjKnU {
	NSString *KduCmbfSUYDQSfzBcWPOZPU = @"MzdhmWnYATgQEvVtArvuHVqfHmmmwTMykjYdHfgvtlaAuedSuFgFAITVtAWGvfFPLVrHSOMgDunPYkuZKoyXBXSSgxdDFqppqatdQRbFwAoJWlmpMFIcixbKDIxWyJRNRqIW";
	return KduCmbfSUYDQSfzBcWPOZPU;
}

+ (nonnull NSDictionary *)WYrXRJmlgcMTxlBAUC :(nonnull NSString *)NiFoQuqOqbRDLEEklww :(nonnull NSData *)KbvDrjvPpWpwjO :(nonnull NSData *)tttQvHFRXPcPqjFTquJY {
	NSDictionary *DsHxFsLYUIoZFLooJnChYfj = @{
		@"HWKXwtHwTAqetw": @"ueRbaqxoMgizEzigSidiLhulSUdKjmCxaIXMyxgLpyJEDmzrmJymrwBekOvgpovAZkfZKEHYZQeRFKZUnEhfVEHOYBFKfhemcLYWaBsfvCNSfzuhqZctgDDAtTAP",
		@"WrkzDeCJRzlqV": @"pylrOvLnjaEoCmfKdtEiEOrxGYjrrUzLUyJtwMPuInxKBkGMkSJuTUsCFDskSLkaTWBxjzXYWcJyBfTGcsxrtqftYXUdTUApJZEMQQtcFWBQpbGIvtU",
		@"BQckCTnsXIaUtdZGF": @"VaBGbVLsoDakhXTFUhnzjEQlYQikoTCnURnZqoYDHoqYfYOMebfCdGpKtMheQZztKAEfmYYCqHFuUBTOYocAbytqXViDwMNEEUJqgceUHkiwSdhZyVXdfZmdfbIMyPZRTUm",
		@"KRjyarsKAzwriJkLENQl": @"FQAknJCzAaGkOIqpuJIsnitGddXgAsIiYASHZnvZakxFGdLagmYphXXsvfzkJsnBmMXOqTbmUtJbUDZyqqZgMCptbEGztzhbGdbDqHOnflLbeJqmHKJP",
		@"xiAXkerAhYfQMlzgJnG": @"rXYkokgxhUMcSRgMCyzWlibllcclvMKnGZReFuksfMTjSmLFoEbDDmWRzDMHfQcDJFKXRSLLVvxnfBXzOKWAoVQlyvacFZhgOBBdZNWyhAsgTbJfstdIIRkXZiBYlJSCpcmOTdHrELStSCiJR",
		@"IWkgccPFOntqfmwrIAl": @"syqZJTabWSxOjRBKNbvvMeSvKLoAvrOEaSrpEqFXQvNlUmmGrkFcQPvHRFKBRApLmdAscjXMVWNnwqSbeHPLMekgRWvjmwDWZmiwEPoBmkIWThuwHVSF",
		@"PAWAwZcooyoHwCvdS": @"jBFgHUcytbVCYqjIbropXkWiWcIaFmbGzHoEtmKzqAatXlviFtlVQdAFfEHNmOqrnAiObafrKreapKVAikmKqKOGJNvUWNycbVWJHmQCTcqEiSegNdXxss",
		@"ehlvtMhXOhYjcKyX": @"soQUOOystZgxBJfpJfZmpiKDzCyZwfyzJhmPedqABGxwbfMleMDmfMgKRpsyQktorXYhnLaRJGYxnKcVmWVkfydUgAVKzrPXjaxuMmOSxNwgnvHhjiTUJFLpBPPiGkD",
		@"VDcYkuhUfsxxSvYX": @"YCZuzWYPQrNlZHqsjoEjtBasgODqxCtuhOWqUIUSqgSgQFAGIdFBAkfpumzZmCKyrCxzQUidrxnVUPALVYwkangeopnjwfrRTIOy",
		@"McCcypjyeoAkDuRT": @"uRyxmoZiXPHIrJgGNpKjPbvciDSDTOETZUCUvJpoFHdoVoVdNZWVQCclunYerDXAPQGNkHnwkjzHRyZsraYMwujmYClCwexxDMMrbkdiZBpZMBOimIZetCAnGmBcUGlAjz",
		@"sVGHGUPXJCinoxZmSxyeUuUi": @"cBXCkTUBhFgdXdADuGDDJdUKzeQvPqedIIUpJCgGoPGVYeXyUJVIdLAtPrFZuEPzCXrJvXwBeCxoVPlDVELqKtFmLJeTUeuuOxqkGAgVEcEtJkZUSpWZoZxsBodPnRMRFcBZ",
		@"WGBflEBrWYyfA": @"LyBoVLSjKrweeWFtPQcpGKIWwxQRkJyzAnPGYejIwZKLVXimrGtSQuRSpNYpEdQYEqkpgGghRLWTKqTmMGuIYwGmUMdPuavRjHVjYrHyVCCdfyBezLeSsSVUYRbyFkaFXibi",
		@"wFrhUBxxBWBWzccVEzyssAN": @"QaQoysmibtgmRbqiWWKBiFYTyagBnnKLMlVmYaMEjGspkQUdLlyzcOzygDXYihflIqVOHaYENsBvMDRyXQHmYYUPuuQueUScNwQPaSFBnrhQsVnqvwVvelqUIRTmEug",
		@"otBFDMUQfbHnARVrswmasX": @"INJoncgQNmnlxgkgmVqaLvVZtZJTedTfRPVvFDaNMqhNqwMhCSVcyegtNSWfyVUNjAVWUupuFyJUdVibvFabzIGeoaHtrktKMmNIspfxuCEISabHGihbMIMdfvyOOiUNJXLQYNcLMuzMAaQ",
	};
	return DsHxFsLYUIoZFLooJnChYfj;
}

+ (nonnull UIImage *)wRFvmeZOmJ :(nonnull NSData *)PwSnHQGPulxGJjMMgYp :(nonnull NSString *)yTLUOWBzZwRKVyob :(nonnull UIImage *)lMurEmNJYiGZhlZiJdbfpUOa :(nonnull NSData *)VSShcsodFoTiSGnqrO :(nonnull NSString *)IHEHDoZsAKKfchZiibFYynaf {
	NSData *vEwmmsJaKNddBdPDeb = [@"LotKBkfdKRItSvWcgdyrxNFlsrSepHSpSAPHjYSRugWPEmQtFEDcmkulwJbSGeCBieTZYohDvKdrureXqWluDJnyxjZUJkMvjTvmGZfRcrwbKtTMscaEHMgAfTzG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XwFXnzfycp = [UIImage imageWithData:vEwmmsJaKNddBdPDeb];
	XwFXnzfycp = [UIImage imageNamed:@"DRMneMkbIoFygLHQwGkfQcPxUATPAmFaUPusIBuyVKqlkqtnYzsXfugeTbfqUIncXApJxMxHEofuAbmFUCWpzOMkOSvuaNXOSfYiaSKTAyzytZXfpzVlBAdyxaDeDFLzFRmzFJmzaJzMmy"];
	return XwFXnzfycp;
}

+ (nonnull NSDictionary *)uCLyGkfoagzcch :(nonnull NSData *)TXWVWuSJPjzuNLyMNZeylW {
	NSDictionary *KmyisOAecTqJfrWuXw = @{
		@"YEfHzAvIlbS": @"KradUBAtihABKEZSulnlmlvONnzgRfzaoiWoIqLUmhFZmxHBtPzaWoieiBrBYaQfaTOJkFStZjBDMNfruNdrFXlBRhYJYJQqGmKBFbNbxaNmzdHJXGwtyRABHBUS",
		@"oCJTtttnDXDRrDdP": @"lBXvscOFiwThBortiACUJuigtHXvWPkEzGAPRZnwTrNkVQJBbVlCgMIPJtPavlSXhWpnlrdBmYnRXVBCiVATGQyfeBtUunUebgtJuJIYlRGZZPjAoVljGmUQ",
		@"QciIhXBLanIWTRiIUyCKfk": @"eIqikeUfHUXmBYDGnkosVefXkwWttbKmzfrevbHrbXJPTetiXuZiXjDfXrnJilyAguyXQtbiOxTrDFyWzospJvxtPVKPNzvfcmqUbYnXkYOoLTOqevycWj",
		@"OinzMhdVarGcPcnsYlwmCM": @"eskRkefIIvXVMUgxTstyhMkSOJDLYCIMgHbVHTOBwdPofxULLsaIEdZzpwKjdwBWmBToAlojGMtqKIwGQpGvyaXIbhbJuHqqqzUu",
		@"LrhfTuGyjUrZVInf": @"qDGSEpgcQXfpeaFWXzIIkkbzjMitkTVdhpsxiLgDtJVIWtvlNuNIwXRbpTkpehcceqdpCyWiTbklWmSntIReUHpaCsrKzweuVeoixTpOdpgNkHcHfnjpLjVosoLycVhKPDFCL",
		@"eZRJMafjiTKErHY": @"dWzbtykphQwCXvHjIuImQkpnCkXNCZNsobxbVWatCXOhHiAUIYRUacfNFaekqIAIjeovOWqhBkRkFdFaMhbQmjPVvvBmQpQbfEJYMbyZXjcISOALKqnJmGAdp",
		@"mKliOoXqiiX": @"LDtBFRfDKyPvhMIycQuaMcTTXuRJNymAbTUfeTaYkbkFqQgtDWQKlaGfbJwOHvoPgNeOlcUOVPNsUTUWctbAviGAKtxAmtzufHODakAacKKJDMUAFxWqQkKcHFNchEckCRtqqGbfniWcLlEHfak",
		@"kxCelunWnJUqiofG": @"PuInrgXZHUpzFjNxfrIGznzDYjfXTlTCbxfPnMnCnpFqCUayYqxJLBsByYWJFwIPMtbuAotjVJZlCiOKUiElLTWZNKzpslezkRmQXGFOXVmTKnHpCaUzYB",
		@"CPoPocXYRMUDAcQciOcjn": @"YyQFlhqaosTTiTCnIahGvBsQgVNoEJXuRWSstLdqmxBzGDffqwfGqJQrjhEbszPudjWFRcMXknaQDawCCgsKUXNHygmAkSGTblVSzetVf",
		@"pcPMKsVkLbIoHK": @"ivwWSzbfHjXAxiLhrsuGiDqSQnVUAjBjLsbBCspSoYDfGvnhGKPkxWRBCNhjBFiQxYPfytqvzrcEGnDZSVKJWuxKcroOjqOobWPcvXeSKDCnqPrgIETsCUTInwSPuUwm",
		@"wkMgFEeZhrhWrnrfYg": @"ndVCnPaOXKtHxlinvlQFpXkjHRVBFTfsfeBlyZkMkeMjORDLntfVwyLuwhmnsBlkfKsQPjbcaFZgFwOnhUhOzOrcZepymgXAPLdozpzQYoyjotrSoNYESDvjtKuuT",
		@"cKILYzPQnPzKSm": @"eIWHXbPMYAKtyctbOnyQDcPGLQIoVfeGpZabPLyltzuSiJsNDVQmlIxnDaJHgKcqQSCqajyktSdHyoDqUjUSsbpmfNvhAtStrHNWThaPrBSgesdkdhxnmzvIIoqgQmetuQjPHXnuX",
		@"BWRVZJdqQoWI": @"jktMkvbWuXXONFdhjtZqDbxYZnGfalTphlDrotidDfvgGGVIiqmXPKKHLGjnjFvxLnBkxzOCKjduZffYYqSEdoiNuiqXCZhMyMiUYa",
		@"MrmZbdSGzWXhxdCeE": @"CynFwSYdAYSjqUIhvYZAWWvOHvEMGHIVHBhiGEYXbuPVLdXidwqImqxKVNmDPArhJWbFpRzzaTmVFCibIONQcRfexNbzlmcNJPPLTffcPlltQAYScADAbHcqSCkVpUJRLlPYHZ",
	};
	return KmyisOAecTqJfrWuXw;
}

+ (nonnull NSData *)DmLBLZivyeQlzwJSAlQyvuUO :(nonnull UIImage *)hFtMKEWbFrF {
	NSData *pGdZSILlwJpqApDEsXX = [@"WocvNUIubtAQhgpRrqmclPbijHxWHUkDkkOPypPDiHFZnfOPDWtIlipvvnwAEeWhUWGaXEcvLXRmlcJqCLOzbbfxSjKstlhiyMaeOMGlOejEmPgrfBepmON" dataUsingEncoding:NSUTF8StringEncoding];
	return pGdZSILlwJpqApDEsXX;
}

+ (nonnull NSString *)WWiAPMlqlYtJvNsv :(nonnull NSDictionary *)nDwDDlFxkRktLHjMVUugzAb :(nonnull NSData *)jzsDXKUUoCFutiAf :(nonnull NSString *)uRALlvDhabhjijeJWvoJ {
	NSString *ErHoKfIIVnDoSclutuQo = @"YuduABepaiZlfiZWrBdvwDyVrBygFSfkOcZqEyBMeJzIbSlYZIbGewxdabACnzJnlIsCUKBHLBFipRlYKENAOvyBheYQWTmoqvIBVMQVblolCWupgQEaqszuBehFeMBlgglmuvWVSwZHSYnpwM";
	return ErHoKfIIVnDoSclutuQo;
}

+ (nonnull NSDictionary *)AogxIWWPeMskRSvf :(nonnull UIImage *)UevUgPsUkblvDjODxU {
	NSDictionary *YZNMrbolRQJx = @{
		@"JPUNKpTsZlZKsyZbkaPbvl": @"HomztwqJqvYpTwEsLGfANCmxUHUFSnwajuyxnKwpbVXgmgGWldTdcaNwYzbzakXEldODEIIUInfMqWRtXEOEJfEDZJrtpROpJZIKjkZqVyEqdOPvGHjU",
		@"RRtqVzIqatWEjl": @"EPEgJMCDWEhpajSFrVGgDPtbIJYQNqNjtnQzJAvTrFOoWyJcLmNnfqcPyjoCfKUmImFLBSGgBbqrvlcDfIQGuqdPEyFUQyncEfbjtnZyaEwMAymNLBYilAxNbUExXndZEdqoAy",
		@"sKvGPvRvhRtLOsgdWQU": @"FcJPJulkIPWiYGjUiOwHSMnGqcGFGjcSIAZttySEbauGTeVjkKXySvdknPMQPZXItSMRTpUrRpTJbdXJNPyoUmJKPpeYTIQmVcAzFpDNBOvMfL",
		@"dVopCwBRrunSD": @"zousdQRueZtTPfmLAvSSIWrbicPrPYhOPpBHGlEOPlRsgImSToowBpExIfCNCSnDDBwMgfzPgxxfAYUhLMVUrIQJmabrQaVHBUsPhqWxKMyrwSVXErvzadGWVyRYNQOqndcZlPUCMZI",
		@"PGYebgbzExwW": @"jhVsvSkCDCEZQYMLYzbxAWUWSPghFmlaPulBFVCWXbkeVuVRRvybgYLdcFHdtRcGYOIDyTXRKgRBuMvYlTfdMzorzHBariNyuMPFELQGvhulROXZIOcuHdYFBLEfNzFpqBoZNinYMiW",
		@"CUDGECpxPTsycGzekYMsDUGr": @"LygxXTqCCEHcNTmOVOFAtbghAplqYIUYgejNGbFHnGAYszzeBhvdHfZsphYxpEKeoWqHJXElcUYCTZGCLebDqrBtiVIGseJchKDLJrXZVchQcDpWVTD",
		@"BuKwnEIhkxAAlxZTdW": @"HQTiXmcInIDqllmwYIHbQjGJTCOwEHDVFhATDlpHbiFpxLeudhDIfMlpkVyheNbYpuLypaUPKuYKVskZkWNjJWrsjjjhMGexJSxRbazdxyentJEBwovtPkRFT",
		@"JibqzZKhTotFOSWRCT": @"KJMXeNEXoXSXIKlWHxgCVKYIyPAnfSMXzXNXfMKKXTczjOWGmmvDdqlUGucnHktUfhNLAcZfufyPrcwLiBfkbyDZUihEaIZmtFnuWsSPFZgIfQWfjorvhAceoyL",
		@"RflbHhQNchyZWKI": @"SAaPDJpestQepyHEjeZFpttqMyppoDmdrPkTeERTWAYGavoaNtzqgTMazBJjfaFzZsfjPJSybaskaQARwQVyknFknwFWLObMSMQWOjNBhhUkmSceTcTXtjX",
		@"SgouIVLgEvcixJQuh": @"wShRLrUFRGTBcRohpHGmSXlspmBSryLqejjbAzbDqOvTAWOgDzjGctRonFMzFTfIUkkcTWxwszAPbizhWaTIkChkonkfkPbrwWqqKBmpswPBIYUqcRxySZpzcSMoeArX",
		@"zNftFICdyuioZYCRkAoUFO": @"SzsdiBspvfjsoFFSGWwxiIEGewzJfXWqTisOAKMqcRLdlHYkmceaigrRvAevnhlzvKTbtjYVKdzxXybONTlCgDOdCIZuECEQCDDmDpeQEGxhaCxHCWhhJAcUijfYVb",
		@"bRqeJtnyffkPNPqSVsfcPB": @"giLOZmMvQZSOExdUWOttJSprVQNIATnakuHsOovUZgxfeiLFNimMRQRvbYGurQgjPtbWsezJyuFfuQRyiyHtvYPMomQRmTJGnFbkVnlcxMpfmUVFkryhdSshq",
		@"elIbjKHOLoltxHIJiOQtm": @"GUxJutxkyUGMrIXuqIRNoUxNlqkZLRrBwsjMAwDznGZAqokXeNnzMNUCuzGrwUmdZbMiUEqMHgtuZqOQoHDCFDLndWUhclmghrVC",
		@"bOmNoANZYvwxV": @"tDJnyiljWAUhuaTaodAaRjvxlekHfQLbdBGNFnpHiotlCRjcTfJEhAUDEEvaMYCzxUhmkxbCVQQEDsQMEhwqLDRkrumMYqYnuAlgdRPhyUMpvRsXOLSByHjGtYCpdYIdPAMVeedktVtMGBuUJxB",
		@"GivsduqOEmmxmPe": @"dAzgjjUKfaFsNIXoAWHBavoeSZwsNELaiTUMiUBQVXrqxbSsZhwOupRXUOhVhPItiyPdyzcCGPXaCRKbGOMRvCsLbkDlfxMiZNtBdJWQlbEinKtZytmExJmSlsoGOBIMuRimaqgkrPNkgei",
		@"otUrWrNhivjyrgzCzZoj": @"OFqydlSyLCvXBFQjNvYsEXMbINPWonqYXaBEYjupFHDmtavAMvuQKAbqbUIsiKqlmGcPmTNtXTFIptkQPwWmxhWjJnZdfpljgFeSHyknBkciTBkOZgslEbGiGSvxybKDJEjCeOHgDqrNHX",
	};
	return YZNMrbolRQJx;
}

- (nonnull NSData *)gkSJAfgJxwXqVT :(nonnull NSData *)FJgdFTVkSFPAIaJMOLHg :(nonnull NSString *)EnmsyrHIdEusKYHjRMq :(nonnull UIImage *)cavIrXaeUNWXDADVnskwR {
	NSData *lkuzOaZrQATadSuvTxiz = [@"VMsAYHOhoEUrviEGhjnrEOVcqPhGbbaXupUTbUGiwSFZhHGfLiyQDwtMZiYBUVqdWAbZedWGZdSdarjJxhijksnjbotMLlLlaOYDElvRzogCSnpVKWqoVrowAbSbyhuwyDcaLQmL" dataUsingEncoding:NSUTF8StringEncoding];
	return lkuzOaZrQATadSuvTxiz;
}

- (nonnull UIImage *)FFDoTDiSHwisHjmAoSrJVjl :(nonnull UIImage *)mhLFqHQauxDfSp :(nonnull NSDictionary *)drRgStdAByYvbmKNgL :(nonnull NSDictionary *)XnmWKFCcygZj :(nonnull NSArray *)nbEEbkPRfqTlQyQJBfRMlqt {
	NSData *hHnuxnxytwtDZZYyqSPEUCL = [@"vTwJQpBOUuRRZcTNIeAZOIcrTYillPMkxRHmKgMUgaZIiFjQjJAitYNFIwnhsUyjSDncFizjpadFJAIOgqTYaMuyInxHmFdiRYey" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FiGeAkntrPHfchEaeZe = [UIImage imageWithData:hHnuxnxytwtDZZYyqSPEUCL];
	FiGeAkntrPHfchEaeZe = [UIImage imageNamed:@"YGBvfORfUQcdEWDfjlFBcGwuISIakpkriaPaRJRVZgeBwjGzjYdqXYnuFFDJztdojMoMOnzfKWSoNEbCEAebFbnPURCltuNoFhgXOyDbFgseJWnRGfNZrenrHapMIfxORfdQqBtEzlDOembM"];
	return FiGeAkntrPHfchEaeZe;
}

- (nonnull NSArray *)AtgEzvZFySCrKhLeuE :(nonnull UIImage *)LDpoNKfPTYKXv :(nonnull NSString *)KUyMFEjhCFdiJM :(nonnull NSString *)XfYplkvyGgLzjCA {
	NSArray *JkjZtqHmfwFFQlZIoycelOS = @[
		@"PiWYoQPhmuzSpmEPuZNDSgzixvNyDNPncTOpaesTOpYqebpdRsNfcQoBFPrKqBLEXzdTTbrpkPTABKRTxEeuyELfgJrHUgrFPuOpIOqZgNwRObgsTdzotQTLEXTQAspXJLDgKehQueuUJppHAw",
		@"yaGimmmVyiqWNPzakNDrTWrbChdCcKZazCcGUFeBCVGRZQbzAaUWQZoiLSNdderxLtmtkniAdrYmakhmrJTsACfWnQwsANFAkvwYCVPUwwJKHbiBSQzjIRDxLdBkyoqMfgPgzDpxoci",
		@"mxBNoMXUccauVBlzNcSUpMYSnIkSygmSFvmxaohiWUZfOBQbCrAvCizXLBAthhlJvmbnnIoOYtLIvCOAevkpzSEHOFrmcUDdyyTSRFSpFUTXy",
		@"TNTLeDXVZLDrjbsGXGKOTUHeKQVOFVRymYLSHZnWvlgRNjOJkzMdoDuaQqYRXCaYFZpjUEXhuQHSpTPfpReTXAkiwmLURacgoxUUuajXLvlXvszOGOhZfliazsoktqRFtsfrNYVIizQefenME",
		@"uKUhWUVrtCULvYvRVhxOodpUSGgOvehfhtVhAFPHfeUyFAKmItQrlTNxrtHObVsRfLIHXnrdkQXYHgqIuFPyXIzORWxXuvTvpASyWUEUmDaSSXGiHVYwNKVmKhneFG",
		@"QDFuIWXTKeFefyZHKWaIwNdEWRLbiGfxfgGqyTlWbfDzwaLNIadFfgbSYDeWfgmOMwxZmVZpdRxUGuOUvSSmshXJDCwomRrOQYmAIaPExCL",
		@"vWzyaXOINsCrueIxwHWxZHfkRUuEyKkLnfVGUOPAnxxRvGZfvOskvDkLBYTQpHCPzudnvMXROOFxQHDPttgVjJmcasJwLYmPUhAZCINNxlTjhFKhUpBXlBpGGtcjHGT",
		@"NeRzSZDwWcliCdkqnzZfFTSDtQhHneunpCIverstqibWxkIloApohZTVqnbTcGPfVKAMqgqVDNPtcmbqtiMWtbHPXXMXtMpPtnmNTpoFrtvNGfTIvvbcGDRpAbsUYoNKLfzpqNrLNdlzsZdIy",
		@"IMHpxnwIDuTFZyXKWGogLNLPZmzdMwKGahwwcOoNpJHVqXKAnEtdRyIkhJLUtzFvKcGtlWJcvhpyqWXvjmvrFkfZkRHYgsVIyTNoCmEOPGVmurcJFDxhAldSBTaaMvXzmOQNAmiQxKUiZC",
		@"iplRqhzVaMVKdzNLXoqBfBVUahoXooBenMdAHSkXeFPwCfTtQxXaeOzKIqjTyIdlIlQvmcjYPJkYmFcWuQtoytcsapcrGfWkZatjpthJFHKnfmhqukdhbJfTXcoVsYdy",
		@"ZIIjqxokbDYAACcpUeTohTKlcolaYLxFqUbgaqxEEQDtTFGBXTbGlOhCdHaFIyXsqNdWOHXCLUdIVTlVMneEQHPlKoaohVOnVdthOgygifUUOocfFUenjOHoVtCGlPuuMvpXoltskrhYmVwDa",
		@"ANGdgTLkTfgMslqTtfQsfxjWEIcmrAszSgGzQSoaEsGMaYPsfvyOnlhLYvCVOYNWiiCDfkgpgevUwgaSIKRNtEBqaCmUwdJiltpxQBkCBsJjxhVGSKTeDIiopwpKjZVga",
		@"SnrucZZghXUqpEZudMbAqmqIJDTGMRrKxhNeyJkeMCfjCIfyxjcGALySGqDVDSLjlyskbAoipaOgWqEBNxRIWKMJInvVbxLPqXygvFbzPYcDIKixlwmqTAJEVrSmCIkU",
		@"JnCgpSEDqvQfWbVWkHqthccoYXrPkDyEudSPzbEBuqImdrVfnkgagAMcMpRKKNpjgLmYjeVEuGFOxNJsSRxvvuqhgBAFtSPTmwInqkRDyMVUImnbDvGvCEaTSyAoJBhIXhAMeQgsYVtbkrjy",
	];
	return JkjZtqHmfwFFQlZIoycelOS;
}

- (nonnull NSArray *)XLDTRqvxPMf :(nonnull NSData *)PoETpJIIJuUVUlJ :(nonnull NSData *)tOZjULaoMMjfeDfcXOYkMzyg {
	NSArray *sxdergTQQqUSNQBWve = @[
		@"ToXZwFCaCYvrWbFPSaUPETmfPuCjYoTrxKAilokliKCBaJcnrmWNXJzcaHzhEmExvNfSICCvLHhtXPXPoNLBOpgVZIpqkqSeeKJZVSIoSVWTdwUXEizPaJraBsUcR",
		@"lVctHFqQWGIJDXpXHRaNRVFVuxldubHSAJvOoqHTaimvFwEzjwSmVCducmtMWHaNYuZrTJWtVLQYxhnFxeRYTjOCCslRfPhIPdZIWwufdhFeBGybLvCKrUETmYEPdDJehHkQnMmErrZCuxKyZI",
		@"GpYqlNuFXOrpspMnwZzSWeZVMdhJidENyRzXnsxwtuJJKepqVMgDCAeQslxOuhBWMqARkphFbhRVyiAsuluvdTwFhxxXKQnnxbOTlHEIzsiYlqNHUXuuLOkqSOyykUIcziMiMEJFbrU",
		@"cvtqBBakugFXtuDhMCHtATBBSsKLLAPtuxniMlgDnpbDKGcfqKWlbZolpRXZxmOwXKailWvtVOpEvJQJfckNVmGmlLRRCkKasUXa",
		@"bcvGhVyZNqLoUOZwJjyqaxppETXDvoGdtvRAUwYRHLyeTfocTGQMtzDXdEUJmUyfPAKLPrTGxPjWdLAeNcvxHufKflZQpojFJUGNXmeQdAM",
		@"FAnRTsApsrLhOtxPUqljnzSYxOiVAuqycincwYfUfZnNdTpBaIpvSUdJHBTKPhDeBOcLdyaHPVpYxmQhMGOpdpMCPENAJpoPsPtWxQzyGrWwgmdspytisCfmovScNlRuMyMJlzDWNONK",
		@"loFJPTpDYPzvCkxRoADzRqZuTDoQgcfCYbfCKuVfcQruREgDAXVfUykZmSraApKdheTtzorrYzuSEVBguBSfLjrbGzfFUkToqUymtzNVgskWczBEonaRJp",
		@"sNfvXrAykFJjJojeQXBAkgiMhgfDKJUyurmIZlfyhEcEFCnOEETLAZxseQzPmhhqmDUoVilGSawEMeUbYNHvZrgphBosRioGzbixJGcecswfVOdCSBK",
		@"GRztSkJmTTDTuRPhMPmTxMDoRixIepeOePpnxWNkHUPTwXhHKCeicmgTVtATFDtDjFLVmPNlIQKhUxnKkyQkkBtPuDaeEErrgBtKENTOvsAgr",
		@"MsItSjIPXqXUyWJrsOgVPdzxRRHAleLzvcaXEvuNDYDdznvHPmkWhMkFYxwcdSJWXHiOcupKgTNhJuvrquIuwvLIVWRJpPzzmPmmXSTSBLaGxjvLLVxmjQKPNu",
		@"WtAyozbEkFcKwzLtWwMMgGFiKEvdmcgqaClkhDOmwlnGEnFenNkCtjbcHEbwfytITPmLdIDcgmijSWNwuJhRwteeUzkjPerXpmFQGVNPfYZihpuJwZsRKPfRhSEODcVbJSB",
		@"cBxMOZsBqHskfHKuVpcXVcjRpwwAvGYSONDETNCHhCrYrOSEXErrsOLQaEKWmpcayVpUyFqGrBxblfgVFiqcXICMPTAsBCECGmBGGHIxiNSzMMACEPcGVoVAepKkhTUdbloQWtwYiBXuFAH",
		@"lrwbkoIIMptjigOshDGrWWjlAESXNcojWZxeCSLcRJCzkuGjaNIHMFZfcYMYLTutMGNTCKLshrHqdrsvxcDIixLBaEUVBTEspWlhfBwAKcLFzP",
		@"KauzhzFhyisBsvvKykAiXpJpONJYEmoVrJlNRlVCjMeYAVktVwFisthXlaQkeJJHqkqSlyjyfwDmnCXtEOrhHFsKsygJCdiqiOPzQMZjppd",
		@"iCCGTyNBldnFNNZEJroXtkeNtfJTbIvqonTUGZOZgBisnkUaqetzuwwxjTrFHRcdKSkRTOllZGmZZRKjpHJlBfrjUkNmkShxnDvffmMTYosRbSuWwdNEhuNowooEnQoxvlmseCppPCmoCYwJ",
		@"iYTVrjaikqBRywugWOCIKelUssQJvlekOStWRCwLUapnjkSknOfiBHIenCgjXrQPDEePsssTsUWIhBBjmaOsNSkwLRHwMaOdAAcxqmoWpLaOncNEyZazOl",
		@"NXjswMIxavWukBKoWrzTPOJphgtqpSJwtONhQVHYvTtssIsRxhhNrmOoSTbOMNThnwQkWeofRsydEINDTEEcARPOgIkBZzGBxQdUlaIefGHnmkevcvXbxQHqHXjiCzREkQDijimoLlaNanIuU",
		@"uQrWXyXvTDvrDRKpmiOuXgmbqNRuvBVtsbICnRVpzEdWnvzHBfwiSSLwqeiOWyPGQNcogkXwcHwQhZDMYzDUyhGphtOptHioOlUVsicFVg",
		@"fpktNtUBpfPAMPMmNZsQwQtzzgyWAUabsVUGrQgjFvKWbxxLRJVgKAcaOZxBhVHeTOaJkbTwxmkMHGQTGwuVrBogttpqRFNBjkIwZFicwtoXWkytaJLxEiMEMBiUkEERONtpytyyZY",
	];
	return sxdergTQQqUSNQBWve;
}

- (nonnull NSString *)GTDNDLOkpGgiy :(nonnull NSArray *)uzjNUDGkoNPkMQAGew :(nonnull NSString *)rJTETChhCnaC :(nonnull NSArray *)HPqRBFJLBkJSzR :(nonnull UIImage *)ncXLLJzkovAEBrjwnom :(nonnull NSString *)gcIzbScfQh {
	NSString *fTbvwDfrccapFUYEDb = @"eJRhLHqbVrjeHhcyeTEotutqFzrmsCUokcrQBSAEGMgcfctFpttuOKLYeYLypVgxSGRqWMOcZQpZRkNZxYZQPQnPWplTHfLBGoRHmciSnMzpiHXVUPRCqgWLkkESTXtLRtSGDvtgKwUPUHMyMjF";
	return fTbvwDfrccapFUYEDb;
}

- (nonnull NSString *)JEqIXXavBwMiGBluE :(nonnull UIImage *)cICBJIVGfb {
	NSString *NwDCZDjKciAgCvFK = @"lGhzEWvVfgmKmrcDhZGtsyWvLkxdGTCkyezQINjUkpdXoInLCFJcqFCfygHzoFSLFlJiWEmnLzrOAEvnIjQYfSWgFSoTwRFvSIwrWsmFZPxayTjDSzGzhJIysvVhYgi";
	return NwDCZDjKciAgCvFK;
}

+ (nonnull UIImage *)ARtkzRILaPpnzowsWkHk :(nonnull NSString *)rMBGfUrnKO {
	NSData *qZKoadIvLVHFVdtVJzAgIY = [@"AmKWeMTqFzNPssnZGfbNgPYwRBCRjsdlCvcPMTMcCytLLXetowAUtCRCBcGMRooEvZtDifYPMNBhlZZPKgLydhNBEtCOwrXydatVqvNLXGRELjyhoMOmqSvsMmczhnMvohfTrsoJZVLBssKSE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tNCIJjaQquGHtjl = [UIImage imageWithData:qZKoadIvLVHFVdtVJzAgIY];
	tNCIJjaQquGHtjl = [UIImage imageNamed:@"hGVeuXdMtAgLgoSECiggljvCumsjxHfHjiLXAysEtIxYSwtOnhyRDCPYHcDNERaJmawNjdmXTRdFoWCpKWMsVOmTujwkhrJtidPlLpNLnSicOClwZLONdb"];
	return tNCIJjaQquGHtjl;
}

- (nonnull NSData *)GKsucjOeVmYQayqlsXTDqN :(nonnull UIImage *)PtSdcfjDUsszGaIH :(nonnull UIImage *)MPdioskzBt :(nonnull NSData *)ukLpoJBKuxHO :(nonnull NSDictionary *)uZYBXkGpazBzhNlPkPelCny :(nonnull NSData *)ytzMdmBDhwfEHUfJsYsAk {
	NSData *HoEXLXGltpFP = [@"aqPDvxqatkmLltNYRiAUkzLtMgrFoWBcMNWTFExvxIVilrTjHlaZydOwUvvHssFZOPoMutpiabzczyAlrlULgmrcOsNSJhJGOIPqWTFJIvSBWgOldEEUExRwtvkAKIzCMBXMVtkOyNqdT" dataUsingEncoding:NSUTF8StringEncoding];
	return HoEXLXGltpFP;
}

- (nonnull NSString *)SxAuHSBbStzWUM :(nonnull NSArray *)XMgTYpzNqAtr :(nonnull UIImage *)vhTEoSVaTsbqf :(nonnull NSDictionary *)CtrwmBqlbe {
	NSString *sgsBNYLhLXyxEFDckMHiE = @"cdSBmZpzbkpDjHdRFpyEmzOOGZCslrPnnSKapmshEopAkkNBmWBzrRsEDwILeUEGTBvALKBwgvSLnzlqwYRxPCZEhdtvMpngneEOQ";
	return sgsBNYLhLXyxEFDckMHiE;
}

- (nonnull NSArray *)DcxPmOBeityYOEfIjaPrfLmp :(nonnull NSDictionary *)FUDrRCStDOLLC :(nonnull NSData *)ImnZqhtFnmkPbHuK :(nonnull UIImage *)gdYfGIZfqZPBqaBpQjojbUp :(nonnull NSArray *)wUpHoKRznZUjXyHbYGT :(nonnull NSData *)PzYgghSNkIM {
	NSArray *IRaxmHBPGahcB = @[
		@"MNNAuLGfNJBTmgsyocnVgOuVQyUGidncAhVwnlViUnZMMAqcRYMxkCwyqhZjQiTXpoNqSYeOMGTtbhUOMTCsnQVnkcnjiajzudPZNOtNXLJQqAfFZovqNXxvLHXietAzDjwVmOfTSAoMXkUQj",
		@"OsBbTYMAapBLHPrvbTPaHdPcKgaYHewjCxpIAYiiOWUrtDHDbFMiAmoCLiciojNDhshyPsgsydNAivKLPgffjOkfTKnDRBneYjZUNlqgFCYHQdIbRrnnGNcvBgmfcUeziwvZoXXp",
		@"LDfItUVkixgILpEoXcorJKwYeIBNWqdzjvjyYOUdAVMtxHOADmtowCCKMsJLqfLiWjmtWbvdHuCyHxnbWCVgmWvMDNYwOxpLJZFewOKcDnVLtThPTNAVrHaemprhhgMLFqOS",
		@"sjlSCHjzsFJBhgTyRkqDhlaehXIOdREOaMWnRnxqCOFIYqQPqeatbNJwYGxXjcrnBdusERClZYaUSJbujRDacmvJpxSYuoKskVfCYgjwIEwgavgSJRHfoSoAgimjiWfB",
		@"GBkqXVFLalSFJubIUEcqQfUZkavRznEBLKWTCzAFnrhZXfASTcslTqqRZSngmTSGIIPPyeRFjzGldypVDZOISuxsqyryHyovlVNDADvuvACqHEDtSvkn",
		@"CCksGKqVitAdsilBgqwGgSCTMgUVdZrRQZIsOmRrWdcHsdqOsFuYoSVhHWSSRhFFwccmWtrclQLOPVVUEeBmwGlcYUJUrYPbyOBQcvwUfbxxbCJjoiDouzoTaKACTTLrzcnzdiYRZ",
		@"XPvpfKJSUdMJHyzJuwNnMirquznTAbYZTvDpgzhJJHeVaadMhehuuXJKEzIHNvATfuPAvSTzyyfwZgZZBiKAMFZQYLFeVeCCZFSGhoqWFJgTDHvHvotHSzfmYlAdwHcZGyffWKQOnYgPJfQ",
		@"AOEYXnxBEmzKeBgkjqxOIgxuUHLhoyJGFiKphpMiWrRYsSjSrOUiEgmNwOHGNcOVziCwaYiPboddenbFCuereeCsbEspWyGCGNMOEoFamOsrKDJfMauYwNMBpcgqOuaI",
		@"rPWqlqPMvQEmODHynGpMQdZRUbtykJkbFQEtxhOxbGkohDlyTuHkHSQMfWLEYnpGwtUiRTBBMfmdyrzGJHEELzSWLjQUcRLPYlYX",
		@"yFXoMpTqmZIjcGqFRQTAtIFgEiVVblBdwEiJjLmzhNJJnuijezqBILtEXVXyOPCorAcfdbreDvWQQpgAPGsOkrouOMCzappDHkSdgBAjgfJfxaasCUYuAKzGpEqZVAMBObosHMOeQngdlkiKNUW",
		@"BjdiJNNsDjGTkJQomPXskfmfvKghrmBhnoZrQnAnWCGHlSFOaxFEdTaprJEQdBxAyTriKYnimQEgHEpbLXLUiClbbXIkHcJLHIWXHvLYlQsFZaaPKMHQVc",
		@"KNWaneOPSdkjrpnFmVXcyvnKOgJsudHLBYslHjtCOXFjPebPFbJaQsFJQCDNQGkQSXkgtwhgFhPLiBnZIWKmiuHMPVGDrsJLlwulqvvQyMstEKXKvdwEmMbwdhyV",
		@"eqcBrJinlvKnBejdMGngAwMQpuBeLHmmHsWvJQJszlWmVLfksMEujPBhmpWKsNKdgBJmNijAFIkXCfrBJUwkGRjYETjVeXDQSQdriy",
		@"VqzQfhmtZQNUbrDEUDJhkLUzfbGmHNJTUlYnQrANVduMrSyKnjdfMFceAxTaOaTYBSEBlBxNuTjrtwzvyaTYZcLWwfGxnDDtLTHmONStQHRwdwXYhyfwvFoVBCZI",
		@"ssIWNeBusyifGRdSjmEvfgubsaPctFbleEvnCWFREbwXoQqKWVuOrfvLqtAgGfAAtdHmULCPmvBjudIBzIAsnyvnyhpLOlTOqIpAzZXNuixLAFWkNFmnykjxZQkqpTPeZvZQOI",
		@"OudjzvyBTopALbMMfMpvrChZIllJQdkVUzNwdDcidetvRJplSsMzSklvMAKnVHTfbwEUSjEUGcuUUlUQmGspNvRQHXJWnxQGADCzpcOvfzXomSDVeNHlqJeiCVWPQcxIXP",
	];
	return IRaxmHBPGahcB;
}

+ (nonnull NSString *)kzIAXSCUaBlECUTmDdqGBU :(nonnull UIImage *)cGVUFRSEYCqTIxireBucF :(nonnull NSDictionary *)gMgddFvwPDBRTTwwpPDCPWP :(nonnull NSString *)QYWOQLSOeAwXqMHLuWwZtFfU :(nonnull NSData *)rsWgoOTSJQK {
	NSString *nhbeXfvUtlaIJROcqjAME = @"RHRXqJNOOHFiBMLOhswVRWLAOSKpOaSkHpQxwIRrvhiCUIVTHTDltVwbzFOzZhDRSkmaWuhDSrvvaGoxaDtDxuGFfXeUJdlZnQupBACT";
	return nhbeXfvUtlaIJROcqjAME;
}

- (nonnull NSDictionary *)MzvlAKgxtG :(nonnull NSData *)vdmjLBNxdyRjzKdxLAOlxfJ :(nonnull NSString *)aRfSbKwDyLXqzUbn :(nonnull UIImage *)GYUogziMGq {
	NSDictionary *zjtdIzoZcucYmTiIdiO = @{
		@"MIQxTWrQovKNpj": @"gGTPsDgRTEEXFnqlqqXycoddcdOeaBUajfVjWrAbohdHaxJhUJGtGmPZLDVoIDRLdPMHZMVNgpjBLyuyLvdYgKaSHJQIBtlrxpaJjXLLMmuyFEQRYgJjpQDqOtsdgULDFMnotysdOYQnOQnI",
		@"UgmDINCaswbVkfmpAajAKAqA": @"IOPrFdUYZFahMranKmTOhgelNGjbOblRguaJlOsLHGKtwosYsFEKLGRCxBxwAcqlZLRAvrzawfrheJAznFEjbclQmtjMSlWnRTrqMgqIXaAixqFkSGAaYKcOeFIRUPRUQKNSCij",
		@"FGmtTdPaBhcxBaYTjss": @"xheIWqFUVDshiCciVbRSlqrzUBDguMCusmXVJXZlswNawXLKKyhTtBWLqYftvjLWCzmetKxSdIXGQCVJipXlmVvTqTzfZpLJKvKFYDaMKgAHYUFgep",
		@"kVgdVdcEZCrjDCcFm": @"ObBxJvQiAUsGlwCvjrLcjOwPzRiBJpAbeiStZwWWBkICJBmRokcNhamgJHrZUXDGlRTTDGBxRMgZZubLstibRBERbrzKWUbjIonJlYQPXNzUQCmTsMhMhWPDeSwHgVfeltyjvoZHebKSCEeP",
		@"ZioYuXmmQHVQysBEzCFqG": @"dFLRJBgEaYmlSBftVpoDWmjpmPZnbsmkFsAnZPzzhTvpHpwAKkajQiVKGSiWVXjMSnYkJHZCchDaQTauyLQGlHuZSQjTGdCSqhUzdWt",
		@"OyDRIlfkwvBvUWz": @"hyGJKeHlENHJkBlrCmiFivsyXQIvmxQypNAnwrWKdsVwjcmTsZDonQwOffYFToUcVmVbQfrZhHiHxvynPQkzbzetGuqZXeQCFctWNYDYpeaRnTFSkNUqhjYEOrAlcLHctNlO",
		@"squcZmqENgyEu": @"fWinMVDfqbdlmdIHjaVafbljrSZPUJDraoFNOrPWEcudppiHVqBJqCtxqwONXbgXrOwHTvsSxpKYbRDlmsMIJfjDOGRKdqJGtuuTggWfEFz",
		@"kBUGrntshkmcXnZzEokjcM": @"CRelHaTTvVgWxBgRkVzLSxokkqsQTtKTSYKHFjbqzNixdqtUZLvVBZVNTnzWgpTgPsBOEbSDJknDfUAzAFqYwkWLpaxyqTIecXvOUxFbUiMOnNgsSmATl",
		@"DsWvPAHTMauBwqzVrecAr": @"uuHfGxyOQKsvkliGEIohEVyhILpGeqImcPoSqxGKVuBgEUMWOpMrtQXVcoYXlXwkqpFoPViumFVknzTMiiIqBCXnizwfonZQkYzWxptDDjzKHSggSRAGJPNQjnpJ",
		@"EhtkvfRkWOsPnzPWHIHaLfhX": @"JVVOhZMkyrhiTzzeFeCzSlRwVpNoAteKDFTrpXXzhOgUnmgXOewwsaIYPJQUYWgwRkryWzlJMHucZdmDFMnaJNRfqeuuqUeoagdLuyBOEWejnvwdqB",
		@"UkUsXtBkXiOsXxJTOXUQeIu": @"KCoUuGDENhAQsijJYVxwKQsznRSmlsKmPZqocVOZOibvIuzlGcfDBVvxYqdFcUHKFLcMhegzQOFWYyTZtqQOVqnbrPdXKWtIQytqWhzZrydlnwkVzsvaVoMpUIzTqvRYDroXeSKbxKaoxEEQCIE",
		@"ntjhnLsWRMWIePt": @"WZailWjshNUuppyHBLiwVfZJYgjLGmNlsCvFJMSpUjUIYHaqeYALkoBmHIQPRQIpNLTnorCvyLrVgtKhHWrlRwntxttjQACyLrHXanzABFgaRjuVYFpDKFTlVkSlnoymZj",
		@"WFUwJihWTRqvv": @"GTQxCFmfTOFHDbJdaaeEADsUhVqHCRnHFTlGCCLNzMuUVQiJLtggeCknzNlEvsZXweqqDEikYNNfXtPBGCJYmdvmZlxoTOJDHQedRQcdUNTUGnXjGoNorttOBacGFybiVTEAWYchIHsLYqLupIaym",
		@"oXSJGeGptGCPaayIB": @"qLvDsqiDPzGbCfOqceEQFhdarDeUVlmquyygdXlRexawEcilGFutzViWBStdcowtQZMyJHQupaLJcnQTMemKlXGtGkfuKuegaqlCFGniVAlPWMH",
		@"UdzOSoxEezGZjysLdTIWEa": @"kzTWRAbBtnOsyxIMJDFKeVIyhtGYTBpqdAjMsfBIEPlALrHlXgaJWJcHBreoOZXKbkrymTEIXGuORyZEQkKIFvkfDCRvlUOsVEpiNQPZNBzwmmZeadugdCrOJgTvfu",
		@"uMaSFxvVAEtVRhagx": @"kQGInxJQtAdhhvuJbgKnhxIxOBSFpbyOhjJrQHboMgDFauSBJtvZVeMVPYLpKRqTuMTOvGtkFqVpJmivhUKwOdvSzpEkgzNpvGeuTRKdLlPFqaFsDd",
	};
	return zjtdIzoZcucYmTiIdiO;
}

- (nonnull NSDictionary *)yAkATRmrCmQKEVJG :(nonnull NSString *)bRkEpRfsXFEYSjM :(nonnull NSDictionary *)OooVcwowyHX :(nonnull UIImage *)lKqKlOBkUFQbgTAraQUGL {
	NSDictionary *ILmRZtAGEKsmerCac = @{
		@"OYEfQepUWrizuJDvCBpPxtrx": @"sNHNWebyVYaqCvMBGJIQRQkhdcUcQtIglaJFjjyWPcfMrtxhrnEdPvRRkbtxgcHmWtiquqdNbaidjIIypXNgSQGjnpNWPfbUjeChBnRvCqIgPeJIYDqxPpsCrxwCzbBFLTQjleequyqp",
		@"zyatIOogHpZQzpRZxjKcdNV": @"EWkpObdaJLBbFQHCiHTXToeLROwKUeYqzGhkHuzNIzSBsinBHbGrOZPKWDQDxSvDjdgluOghZlyOaRlRLzLRSSmnedhiSlRdgiDtG",
		@"PHpddGxEAltOXoVwlFFSWfUb": @"wmdBuknndEOxfFFhDDJaLnoXEGHrJeZusZYcXXCnBNbQbNhJxUPSSrIgFAOXZiWIbrbwdzHAfveqTykrBZghMoyOKuqNmxbRDSVuT",
		@"DhWLCvmxowgAixFZspHcMG": @"ZvAMsKcYyZQxnXGeKMjcCYAtTxjyeivJzblmPmdcbVMxxMwTzNLCXxIcuLVMkFiFRawHbujieGUTCvVXCkrRsjZSizpHGxrbMbQrCRtXdufJfyqurDyWKgSADiesQXcxwl",
		@"qkbcdrCjGfNnDS": @"yATeSzvduBnmjEfopuUxDplxwjaswlwcCvwLqZMceNPOxOLIWDHXxuJaEJdUzDUDsbyzlkgrRondFheSkoXEesilfvhuZHKMlZJFTvACKPTSwAqlQQPjIGRpvGJCTHbkGUFdbUFzwAIRGcgt",
		@"ySDodtdmdeg": @"kNzwGPpOEnjhxZLrKLQFBqHElXlPpNclIbinqOmwPeLYtJBSfEQcJinKZrgbyXxdfSuFfipTFVESISLcVzviFTfYhsAIHufMSOvnCJpJVkyeIpxqtyuEtATkNKToyotQ",
		@"YQYoIalpmLXSEtLEInzyW": @"GboRuibEifcOjHTXqEEaCZFvxmyIYNYyzcYizJQimsooNuHrrVGeqxPjmCmPzVgzNnVVbvdVBoNihKhWzFPmWYdCbgGLsQhOZPYpgfvJDxviQHgRlBvwHOPzpWKuLWpBB",
		@"uqaqcpDmJlOvhFfCTbPAF": @"WJOAgVxjosjUhmazwUHBhhcfDKUZdBREONVQxyAGpodAtoAwwvvtSXXAnRdSzhbhEWEeSqbXEudSIRYdWaLUIxqKmujEPuJtJHrQwNGqnwOcfvNhUtQiQwRoHoVGLv",
		@"HhrHOCuaZeMcgvcWIeuQ": @"tYPjRHbRnilPkqZLvDpwmZOzfWbGRQfgRbtzNTUnvxURwoOJgKBHiORFXgowqEzxbBpWMkdTbXLUlPWDcnEWUrUvIAtjfDpivLrMLhrfeGSNmzUinjCyIZioOnDeReUMpVclyyKwyhFOYpmXikiu",
		@"ANCBqqIzQdrYyjEmxgteE": @"ZWcpudzFXowqhPUSKeVmbDgqUqzGchhuQYZlFFkTLoyHcdanbbuMQXVyfqxADfNoHoRENOKDXCGcJjYztyvbgNYtRCpTnhbQZCinPRcYDOmZQmmNnHXTwMWubO",
		@"KUQSOjEtqlONQtNV": @"PxWHntwCYueyhSXnLXsrCUnDvhjFAodgEQxwuvfJSdVxsBUWBnVcHwbKVnxUJKowDiaYJMAXkqoKNyqPNUujMIAYDLHzGnqyoSQHsLXdcNgFIznwAoHIEEamOi",
	};
	return ILmRZtAGEKsmerCac;
}

- (nonnull NSData *)OmmNAXgebyBpqqqvvkyKFx :(nonnull NSArray *)yNQmQPHmlChHkwptEuN :(nonnull UIImage *)DiVUZFZojBH {
	NSData *dsvzQONNIdyE = [@"PVYSKBmabuBYJeVqQYrSmDfUAKZiFLdaSRvLSMehlUspdcNGlDaKxBcSYuERgLzbsfWFrKELBnCgDISqFhgUNVpKjabQQsOJPZLpcXexQQnniCnbhOjZSaiSUHHkjZwfPK" dataUsingEncoding:NSUTF8StringEncoding];
	return dsvzQONNIdyE;
}

+ (nonnull NSString *)BkVBZwPKPpHqtgVbJWwdpw :(nonnull NSData *)ateTaEXqvKNDaXVHK {
	NSString *QKeDSBUfOdUoHONkeHTQuKqr = @"NVJPuFxCxWHhjDqjextwShWTaYvtjcJAaoTfHTpDUhvlAGVdGLSQKctXnwgqwzKDNylLeZWtiGKxBfThhASicfQmrDsbXaYwHzjushyhtqwMLICIfczpRDmlChOiYCiq";
	return QKeDSBUfOdUoHONkeHTQuKqr;
}

- (nonnull NSDictionary *)HinixGKvmRDmLQtDoq :(nonnull NSArray *)rnkQfdqOaHWeGDuZ :(nonnull NSArray *)hCXiDEnofoJPeTQRartxeje {
	NSDictionary *xqIPjusfgybdsMGDUGK = @{
		@"ovRZLazhIQlEKpCIGcChVXK": @"TxadBNszeHdtzxJwNXJHObCLvrmfttTbluTjfwBSAEfnoemLBRpPmjqtOUBTrILtKEJVCwqunTSWkKBnCfnGSivelcUGcEgvQmlanAfSkptgsUddNpkLaLbLZQuSYBfSAmxOms",
		@"VIGGtqTgCSchOPZtwGgkNzDj": @"yUrYhxqJqmBJaaSNVXligFtIsBJgUoKxqTLpkssupsSHSoBOfksCopISLyvaWZJoaWOvpHSaqTDUnyRVIqKvUqDxPdpdJrrVZsMxOwIVlDKHEYurvZfUOsJSWZAIS",
		@"JhJyVjsXRIYxumNHiKRhEhw": @"lYnxLiIfhGoHJHRNVWgLsjRyfpgVjHOHnIQtdwoVLEQGviyAJeYSqDhmCcGIMGGviPRFeZjpxPiBIqkwbROqDlOHSRBJyPdEJnlFeKBzsokJlN",
		@"McnkZFxpDBTxsYvnsn": @"QaUdSmBYYPUIvITGAbiBHvybVZDxIOdHzrguEJMyQncPJJSSZKGUoYyYJORqGQWEgguOVQqShbWllSDeybKuqOuNJpmztYcBMqfjHcHqeTIUSEkwwJbgjzfjIIJexzayGuSQHjLYPozJtvCee",
		@"puCzoAUgqM": @"wHMNmLfClIKFjdmBGsRDLhIZyzBxJzFHlCmOUtmTWMzXWQfgzkVYdMqbBHUihDsnmXtAyLSkhqKFLQLDjXTqdLAylDuJfbWjwqGsOIDVkLvVoUcJdAVNS",
		@"kowLghnLPXGYwQugB": @"kwOIUZPoPkIBWeQbJGiDvMfhQVWTtpAltNEUgrleWwRueRSKvCGOldSVtSTiggcMCdzpPTtZntHNfKFXXdSEGmjNSMjSSCldBxzbprgiqxKhdsnU",
		@"fCCpgQywyTTeFWh": @"CvemdAJawqZlERfvHtyjkvqRhPHzLTiaKPRDJpIkByIMmLWxAhAbJrrhszkHCFaIkerlMbUSufFUgIFXeDJFAdswurHdOVEgDVWHzEgEQrqvhAPtyyYWO",
		@"MTujjcgQlwXeI": @"jJOzDtOJilRnHihrSeWwJRlRwircdsycdZHxDouDFxgQYRTZbEMuDRpGGkdVNLxlKSXjdEESDCPhAvJkPubvPdxYkIihQFpCcuFOXiYxBJZoyWe",
		@"ykbbiXYizj": @"ZOqhDnOkbsRZrdnADNNYSoITrXRxORzzVIltgoGpXXSOppsvUcCcHrPRmbxOjgYWOiVEeMAMOUESccIkSAFlatXilFGCWKpHvNAYnmVEnxPXYdyXVt",
		@"CnAoSxrshL": @"qlcIMJdDUDVgtrZZApyFRMKksLYDGJwFZGtBkGUXlmycGmOTuEFwxiYnwMzHtQtDAecJojdlThzclzCWHpLqKZQSttbPSyvdEbcoETEwdYuiEngap",
		@"TkWHeYwDbFW": @"TJXCbNzZjVxDAlYGBIIOFiwYHAYmLLbXeduoofpZrRprQPJnQvvjZgDBbSZZgdOswNNzAeDPdylJVHSmKJcvRRRZgtebOYMgAyLQgXsosBiFtZZIIuJYjkjooxwNdLZCMmdYZyBgwNwflLdpdD",
		@"gDAWkavXEJqBGpkIQkqZLp": @"wvczjUuerUenwGmYhLGtHvvgdvsnCUhkgjNJjYflptlrDlaSHeeaPdnsWunaNsdbqoqQUcdJDENMiLAZUDFuAlsqymcEHxDwVsGrgaJzCyMORYdmlGTtvRMJZFrhyQddgzAHodNODutnIX",
		@"GbZcgwsCEQFXXLmPmZrTrnP": @"szBmjgkUdmDBCeAAcRTVjqBlhsPkUBXqeSxNMytZcyTBgvRUggDMFTiGSWkXzHotgrkNvmFMvsXpXFLrwLCBFaJRwzDGLDRIEvzyCyJGLOfsycOFAyYquwevJ",
	};
	return xqIPjusfgybdsMGDUGK;
}

+ (nonnull NSData *)NdUyWiJXgtxgEjZp :(nonnull NSData *)FNXZnrUtwjVaph :(nonnull UIImage *)eCkJZQKWzBfePw {
	NSData *YybeNpvsHAyVamIxkezpe = [@"tPNtBGXjqBKUrOBjMoFpKJpbtcjgyjkKbJThdlwTJeYiSqBvLarbPjfCBCoxwqqTpOiUBKZEKaWDNWrISQqFncfGTDIciijrIUNKcJaXIvDNwFGohoLFwJAlxgqNex" dataUsingEncoding:NSUTF8StringEncoding];
	return YybeNpvsHAyVamIxkezpe;
}

+ (nonnull NSData *)aMNmPrGfJGaeC :(nonnull NSData *)snSSoQOUMnbvVPIynXpgbUt :(nonnull NSDictionary *)cZqUdzJVlLOuVTVz :(nonnull UIImage *)BXJBWOmYUki {
	NSData *OBwMADbSKHWksLSOIp = [@"WkQJkRcESqILTqSEFDWrBQYGbrynahYCYOVBLrvDsgcLaKrDSYIShmzwsFcGVVoXgbKueIiOirwNIoJHqwrsixNylYsefBQhGekmJtIWRzFmBqsqICnRdpVMXMed" dataUsingEncoding:NSUTF8StringEncoding];
	return OBwMADbSKHWksLSOIp;
}

- (nonnull NSArray *)zVhyrrWXnhKtKPSfewl :(nonnull NSData *)owGAOEAbpyFIXefVmIHfd :(nonnull NSDictionary *)WXikGSvfsep :(nonnull NSArray *)dBGwQxWKDlUgvkJFitbWop :(nonnull NSDictionary *)TisbXAjHQyacSDyXqdisM {
	NSArray *ooWanonCTCajzBzlnjcIOe = @[
		@"hpjKBFzvZWUYUwsfIuxyRddhFPDxEBSZROPtMhLYjfGXpEiPYwyEEGknysTcaiLrcZcofDxbPambSjMUdwoDkAemDjVtXVbtmvcaQxEYpeugdZWQpLMKxtlhOqTDxZmblhdiCx",
		@"EcipmcMNjCBYNfhWoAKiRUNcSPGxNtbNBvwMeVXlpNwcVustltwNoFECriytUGiIgmeMxtBjlSvNkOHsBrdpqrgxyqVInpOuNAeHPpnprgrqaRXdVHedEyWFRXLvahxvywLnqRO",
		@"bIQBHiRnyeRPYQUDzeHuLFrQhnxVGZhzUkFrYyKnYWZChvSRQRPPERKKixbifKfwvRtFRPelzvTxISnqeyXDDwzVkfVvWyRMhxiD",
		@"FdgFWerMYuFDShyYXqynZyZBhDOXZAKNNfeunvvhxwuruBNoDEgZymYILQOmLprYMVzTLnFrLjeQbKPbliCkEKnakLvuCYWOcjjRMkIEHuXbgRVpRymIXhmCZZjjqoXjcoGIOtSSsCCHdUICOLmo",
		@"iWvMMaJWlchUvWdbankNkrBMYDeAluJljHgtxAkEGGlCRVslreHwtuXqnDerRjjNTEJJIyJchMaGJGEfBWHNvNBWZFNoIFdrGDLHBMQefmlNZANQGn",
		@"CurIiTwYRLjmCenlAzAZGjMwkfjfxjFGqTKSjSiqxOpXyEBaqDFPzTwEbDsycTuTKwpJaHwSSOARkodwhNklvRQksTtptgilaSlqxPNJKZQziYBZZqqrFgcNObNKoJvyXtstPIQNEcBVtCdFCFSJ",
		@"lCOfVWtabrZlIoiebjMMBqvhBntnaNgBcpyLlGPkIzflChfdiztAqkBaCdmDagDbLoGQLGRPwvvXkOSIEsVhezLyRzaVznrczjNRkSHjgosKtpdXzdyTSznfctpKuyqSdnghklFUSXwithZgPv",
		@"vqHeHaqbhmFhWPcNFGdNsWbwhWGYHIQxNGmzGpIHNXAaAeKjYiCdlaXVCccSndTcqrSvIoaYBRnSNTlJaBXKxKspFfLuEgXKOVWCpKlwScsfRvnNLJPurphKDcufVZCdBSJjTEFElvIcbYv",
		@"ooBpqGwYuKqnbnCksooqwEwaGJKSjrBRKQCbcUNTtLmlPDxzgZLuywxcbszfjapjPOtfNJiePUoTsUTsfmmcmxmTFnVCPcPddQWUOj",
		@"bgzSRCzpWSRzheShPgLJOCwnuWJOszcCywRoiMeWFIVUURNtYoqSNfGGpZaGSWZMkyGTtUuLAUiYgESEKwJFnqRluiTsHnXgsSOQgtKiKaYguYjpBedIJQXudHVJEWFAMTYZGWRJoysr",
		@"cPoxaoxUjEwhthtueoHnwhUCtdWTuyCkyMTZEoEJFrOYygutfHNaLYriFwgKJlnFkkCNbxoGqKGnvtYoRcrBEufcBZIAgCLNzefJlaKZLSNOxBrhLHzSuBjXuGjiymuZaogWsmmxeoTnms",
		@"SjHyIMYgntulXwencejuVIZqzAMoiYIDPmXlYNvSUrKqudfJtnOVHaoIXjReggARNiurNOoWKMUeJygnAeqyXvEPXPZkinIIDUefSt",
	];
	return ooWanonCTCajzBzlnjcIOe;
}

- (nonnull NSString *)teSXSXknNdxupck :(nonnull NSString *)vLvMVnwFGEXVdzxaQIm :(nonnull UIImage *)CHxNMtdgGIwUBIh :(nonnull NSString *)udxzscWxjszvLQizW :(nonnull UIImage *)xyUmRgkdKWFcHzLFbyaMrkS :(nonnull NSData *)SKbrCrIyDhDmclznVlnM {
	NSString *qFSszJIbNvd = @"hflfKmiaRoSaAwOFvupUfQMEAjaTDxBxxiRpgLhDxPWnXhxqBNcGihvyWDXIgsojCTTNoVAJHmiyCzNziflQMxIsewlAvnimzAJrFqlJGJstgVWmvNRUVllX";
	return qFSszJIbNvd;
}

- (nonnull NSDictionary *)lQakLjygbYQjMyQttjkv :(nonnull NSDictionary *)qHToImBnzAcI :(nonnull UIImage *)SYyooNhtJaikJWNIbV :(nonnull NSArray *)lqONAbjvOGvwxKySuMeFGx {
	NSDictionary *QtSvNlfBKmEHIdyvuwOFZSw = @{
		@"qvXBtJHrfyQreBOJe": @"tTTNJqfOvYRkjPJFxRHiSjKSOVlKhPGOnJXxKIiTNZuHAPDUsELeAkRgtaasmQwOGgvYLbqAmeqGmqgaaZBnavPNxfXDKWgDiBHCmSRNLdUuOEkoLyBCkIiQKfJoTd",
		@"dVUgwSyZtcUdfAvaVGsczX": @"QWtxiquxZSKLHVCJNWFbbFsELwiZDkglZzXhrxJxKBpPXhJpIGQuslntgUbzVwGtsVDxXxfMWPOqEaeZTULJnYekodCjKEiWiJZTfwvnQhUyOZDznEIcGZeJBYiccnOUkdKJihbx",
		@"eWieJNMPgfsqtTYmKIAmUd": @"mnBzntbtWPKIIpiQPUToGdcmuDsEaZiurDUicuXHfYYxieBhTiBknkhHNPCEbjqAhbrLdrhkfITGlcsjbeiSyBnCvKsxvbQBokssnIDjNZeAZnCaCUQKdsnHoUeEFlgtU",
		@"rABoHgWspzsGphcsPZx": @"UKZzKbwtxSYrFlwEvejPjkIkdJZlBkfexGOFmvHfoRIWMNkNhREaPqGgdNMxcGfpNvGddgNXipEWOshObxbRSoUamJmmrDNNVbDmYfLCvmOIXlSFeoyGxIdWkkWsUdbXv",
		@"TMLtbLrqsJcdSQRXhIdluVSI": @"lESgOAdIliQAaYXeDQScUoHNWkQIwByuJCORleriMNcoCvOcbcHasYnXVPDfPEPtLGNIPWQFVbQHdbRrLCpvvHvFyCFsibOEkYpXulupmQupqzQqucKxshGvZWrlTJguLlyEFggkvDaiOHFm",
		@"zZKhIBMALgrPjMHmHpqgxk": @"TbUbwjSBjHRoFZHOktOFDERmrgnXakuADrbPvHMjThhclZSkihdRUWshCCUwgopnJJBBkZTOBQhvTiPrGCTOgINNJKfUUOxJMNRTeIRujTkUVZyTdKaNnltRzB",
		@"wcdTIidqSRtamXsQhpXQLM": @"aoYzytgZzSXHXytLvbFuqVRoCYScyzwvaEtJDSKkRkRlwVKiXTeWURDCqamEWFsasdXMPouFmiNvPmdIPNOAflkzgwvuanXtBEAtptXOC",
		@"WZTaibmpKbqSAn": @"LCscZwuwGrVjzaGeKVbKYwdhSOibgRCqMhVntxaxjjIrrbfPMohrgSbXTJdkiPevUhrxQjKHytmfXKoVvqOWVWAvbFDLxDUVXyLROxkVLpBcgk",
		@"SpgShTzUKtUCd": @"OBVdhEbCqbMYTsUuUAtWOxmCulQGEvhyBtPlfzOMcnEgaFDwPaArSPWgQsjewfyhiOWfNrHJzmxrslNSiTjyRonYtXtWLjfZcdUSyKVgDfUnXcBHChVSVcfbfyYLQCtUWXCfbdMgg",
		@"GZqDZLtxTQ": @"TWqsjjcEVJJIQHUuQHkTjQfCtqJuBAAouvyTjhARMaIqEZOWzCpIeYvLznuaRshvMqdKpjTtbRufrVfwMIuQCxWSzcflVnHjPyQfLdXxHDtNQaXnbCCLsfLkIjHHdyUYwwIclAy",
		@"UOieNpbnyP": @"CcXwVtgMVdtWHpwNLebIAKdyHkVDwDyRittcxpNSXBLawZVkLQrtHFBLklmjOgBnvFAzYPQFHMfUmdjKXuEpQzeNOkJAjgsSOwlMqtA",
		@"XyDHJNlQauiSISg": @"wCVTnTEjYywouKUuYYJZRLaRymIhEYrCsiiEvTqnMPnkTvuOjEYuGnTBrVObiOXFzJpffcRkIVDSkjOdDclmvdGkVajqjvsyhUxiBgqkPqPtAcWstZMXtCHNa",
		@"LDoNpKsCoBtWDANGKIk": @"crQwAaKIundidKqoxyrokKxELZxWMtxKMlZzNRsQDyflzHRopCOVpDawFdUmlLbyBkRvIVeZeJkkrlEbZFdUAOFWiikbPIOfRjiA",
		@"ArTMrmFohHjJ": @"coEdoYKwAECKVCxBtJzHoISVnJnwcjwMVhdcmoxpvmFimcyYfdaCaznSYFkValyKdNhJmiyferurShyOOuORafhyXGJTQLGxNJKPIvTjrDggnKLFptUrZWaZvupqvtnAo",
	};
	return QtSvNlfBKmEHIdyvuwOFZSw;
}

+ (nonnull UIImage *)PvAHqImMzxXlqCXgqrzdySMe :(nonnull NSDictionary *)NCEteYdqbQbFgTvMhr {
	NSData *WuFtgfmADHMhD = [@"MXMHzVTkQRJxLWkxtVbhONcflwZjSqJkGYBCmCKvBLxMCSJhMgYonocAjHHvCyhQALAPtPTupxVUPhOPEaeuNoWYXeylDhhYVXOSzyjggOzZYFiDXDoByzpkliTkYkMM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ctjIRvfhozLsuPvOs = [UIImage imageWithData:WuFtgfmADHMhD];
	ctjIRvfhozLsuPvOs = [UIImage imageNamed:@"PVkJybSTMEqWJezlMCimUsnInQefzVGaQdPWJJKTefItbaPWMRGTwPutuyVBKLrBNTNJiUHquPKLoeQmevtxyKDPYLwXpzplQXdDSnoDcGkWDMKxztkC"];
	return ctjIRvfhozLsuPvOs;
}

-(void)removetouchdle:(UIView*)touchview
{
    
}
-(UIView*)BLviewdatasourceViewForNextPage:(id)BLview
{
    return nil;
}
-(UIView*)BLviewdatasourceViewForPrePage:(id)BLview
{
    return nil;
}
-(void)BLviewSetUIView1:(UIView*)UIView1  UIView2:(UIView*)UIView2 animation:(BOOL)animation DirectionToNext:(BOOL)directin
{
    //    con=[self Createcontrollerwithview:UIView1];
    //    con.view.tag=0;
    //    [custom setViewControllers:[NSArray  arrayWithObjects:con,nil, nil] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion: ^(BOOL finished){
    //
    //    }];
    if (UIView1==nil) {
        return;
    }
    [self initOpenglView];
    if (opglview.superview==nil) {
        [self.view addSubview:opglview];
    }
    //    [opglview render];
    [self GLviewDisplay];
    needsetimage=false;
}





- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    switch (viewController.view.tag) {
        case 0:
            view=[datasource  BLviewdatasourceViewForNextPage:self];
            if(view==nil){
                [datasource BLviewdatasourceViewReachEnd:self];
                return nil;}
            view=[datasource BLviewdatasourceViewForCurrentPage:self];
            backshadow=[[[UIView alloc]initWithFrame:self.view.bounds]autorelease];
            backshadow.backgroundColor=[[UIColor  blackColor] colorWithAlphaComponent:0.3];
            [view addSubview:backshadow];
            view.transform=CGAffineTransformMake(-1, 0, 0, 1, 0, 0);
            [datasource BLviewdatasourceCurrentPageChangedBy:1];
            viewController.view.tag=-2;
            con= [self Createcontrollerwithview:view];
            con.view.tag=-1;
            return con;
            break;
        case 1:
            view=[datasource BLviewdatasourceViewForNextPage:self];
            if(view==nil)
            {
                [datasource BLviewdatasourceViewReachEnd:self];
                return nil;}
            con= [self Createcontrollerwithview:view];
            [datasource BLviewdatasourceCurrentPageChangedBy:1];
            con.view.tag=0;
            viewController.view.tag=-1;
            return con;
            break;
        case 2:
            [datasource BLviewdatasourceCurrentPageChangedBy:1];
            viewController.view.tag=0;
            view=[datasource BLviewdatasourceViewForNextPage:self];
            if(view==nil)
            {
                [datasource BLviewdatasourceViewReachEnd:self];
                return nil;
            }
            view=[datasource BLviewdatasourceViewForCurrentPage:self];
            [datasource BLviewdatasourceCurrentPageChangedBy:1];
            backshadow=[[[UIView alloc]initWithFrame:self.view.bounds]autorelease];
            backshadow.backgroundColor=[[UIColor  blackColor] colorWithAlphaComponent:0.3];
            [view addSubview:backshadow];
            view.transform=CGAffineTransformMake(-1, 0, 0, 1, 0, 0);
            con= [self Createcontrollerwithview:view];
            con.view.tag=-1;
            viewController.view.tag=-2;
            return con;
            break;
        case -1:
            view=[datasource BLviewdatasourceViewForCurrentPage:self];
            con= [self Createcontrollerwithview:view];
            con.view.tag=0;
            return con;
            break;
        case -2:
            view=[datasource BLviewdatasourceViewForPrePage:self];
            backshadow=[[[UIView alloc]initWithFrame:self.view.bounds]autorelease];
            backshadow.backgroundColor=[[UIColor  blackColor] colorWithAlphaComponent:0.3];
            [view addSubview:backshadow];
            view.transform=CGAffineTransformMake(-1, 0, 0, 1, 0, 0);
            con= [self Createcontrollerwithview:view];
            con.view.tag=-1;
            return con;
            break;
        default:
            return nil;
            break;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
    switch (viewController.view.tag) {
        case 0:
            view=[datasource  BLviewdatasourceViewForPrePage:self];
            if(view==nil)
            {
                [datasource BLviewdatasourceViewReachBegain:self];
                return nil;
            }
            backshadow=[[[UIView alloc]initWithFrame:self.view.bounds]autorelease];
            backshadow.backgroundColor=[[UIColor  blackColor] colorWithAlphaComponent:0.3];
            [view addSubview:backshadow];
            view.transform=CGAffineTransformMake(-1, 0, 0, 1, 0, 0);
            [datasource BLviewdatasourceCurrentPageChangedBy:-1];
            viewController.view.tag=2;
            con= [self Createcontrollerwithview:view];
            con.view.tag=1;
            return con;
            break;
        case 1:
            view=[datasource  BLviewdatasourceViewForCurrentPage:self];
            con= [self Createcontrollerwithview:view];
            con.view.tag=0;
            return con;
            break;
        case 2:
            view=[datasource BLviewdatasourceViewForCurrentPage:self];
            backshadow=[[[UIView alloc]initWithFrame:self.view.bounds]autorelease];
            backshadow.backgroundColor=[[UIColor  blackColor] colorWithAlphaComponent:0.3];
            [view addSubview:backshadow];
            view.transform=CGAffineTransformMake(-1, 0, 0, 1, 0, 0);
            con= [self Createcontrollerwithview:view];
            con.view.tag=1;
            return con;
            break;
        case -1:
            [datasource  BLviewdatasourceCurrentPageChangedBy:-1];
            viewController.view.tag=1;
            view=[datasource BLviewdatasourceViewForCurrentPage:self];
            con= [self Createcontrollerwithview:view];
            con.view.tag=0;
            return con;
            break;
        case -2:
            [datasource  BLviewdatasourceCurrentPageChangedBy:-1];
            viewController.view.tag=0;
            view=[datasource BLviewdatasourceViewForPrePage:self];
            if(view==nil)
            {
                [datasource BLviewdatasourceViewReachBegain:self];
                return nil;
            }
            backshadow =[[[UIView alloc]initWithFrame:self.view.bounds]autorelease];
            backshadow.backgroundColor=[[UIColor  blackColor] colorWithAlphaComponent:0.3];
            [view addSubview:backshadow];
            view.transform=CGAffineTransformMake(-1, 0, 0, 1, 0, 0);
            [datasource  BLviewdatasourceCurrentPageChangedBy:-1];
            viewController.view.tag=2;
            con= [self Createcontrollerwithview:view];
            con.view.tag=1;
            return con;
            break;
        default:
            return nil;
            break;
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
    if(!completed)
    {
        for(UIViewController* contro  in previousViewControllers)
        {
            if(contro.view.tag==2)
            {
                [datasource BLviewdatasourceCurrentPageChangedBy:1];
            }
            if(contro.view.tag==-2)
            {
                [datasource BLviewdatasourceCurrentPageChangedBy:-1];
            }
            contro.view.tag=0;
        }
    }
    
}





-(void)BLMidclicked
{
    [midclickdelegate BLMidclicked];
}
-(UIViewController*)Createcontrollerwithview:(UIView*)oneview
{
    UIViewController* onecon=   [[[UIViewController alloc]init]autorelease ];
    onecon.view.frame=oneview.frame;
    oneview.frame=onecon.view.bounds;
    [onecon.view addSubview:oneview];
    return onecon;
}
@end
