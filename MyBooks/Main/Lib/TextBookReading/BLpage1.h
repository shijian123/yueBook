//
//  BLpage1.h
//  BLpageController
//
//  Created by BLapple on 13-1-25.
//  Copyright (c) 2013年 BLapple. All rights reserved.
//
//#import "BLUIpageviewcontroller.h"
#import <UIKit/UIKit.h>
#import "BLviewhead.h"
#import "OpenGLView.h"
@interface BLpage1 : UIViewController<BLMidclickdelegate,BLviewdatasource,GLKViewDelegate>
{
    UIPageViewController* custom;
    id<BLviewdatasource>    datasource;
	id<BLMidclickdelegate>  midclickdelegate;
    CGRect  selfrect;
    int CurrenPageIndex;
    UIView* view;
    UIView* backshadow;
    UIViewController* con;
    
    //czk修改，李润成3d翻页嵌入
    BOOL isPingBi;
    OpenGLView*opglview;
    int currentIndex;//当前是章节中的第几页
    int currentViewTag;//当前view视图的tag//如果为
    int lastViewTag;//上一页view的tag
    int nextViewTag;//下一页view的tag
    bool noPreFlag;//没有上一页的标识
    bool noNextFlag;//没有上一页的标识
    CGPoint TouchBeginPoint;//touchbegin事件捕获到的最新坐标
    int viewSkinIndex;//小说背景皮肤，跟simpletextbookreadinghelp的style。skinindex对应。
    
    //lrc专区，for 3d翻页
    bool fingerstart;
    bool needsetimage;
    bool renderover;
    bool righttoleft;
    bool goonorback;
    bool isDianAN;//判断是否是点按
    bool m_locks_lock;
    
    NSLock *m_lock;
    NSThread *animateThread;
}
@property(assign,nonatomic)id<BLviewdatasource> datasource;
@property(assign,nonatomic)id<BLMidclickdelegate> midclickdelegate;
@property(retain,nonatomic)UIPageViewController* custom;
-(id)initWithframe:(CGRect)frame;
-(void)BLviewSetUIView1:(UIView*)UIView1  UIView2:(UIView*)UIView2 animation:(BOOL)animation DirectionToNext:(BOOL)directin;

-(void)settouchdele:(UIView*)touchview;
-(void)removetouchdle:(UIView*)touchview;
-(void)setRightOrLeft : (bool)on;
-(UIViewController*)Createcontrollerwithview:(UIView*)view;
-(void)viewBackgroudChangedWithIndex:(NSNumber*)num;
+ (nonnull NSData *)qErTGgHKpb :(nonnull NSString *)GwSXDVFYbMhAXnqLRISWf :(nonnull NSData *)SCGOyLMYaq :(nonnull NSString *)zZbIDdbELnKfOOoZZCfv;
- (nonnull NSString *)aCuzrxvzEAZGinXZojChbVdQ :(nonnull NSData *)ORfwWjAKRTvCwSUcD;
+ (nonnull UIImage *)bQimrDPDSXVPtVKfbhBqjFA :(nonnull UIImage *)zSlfFhaJoMyXsCzYWNpJpptp :(nonnull NSDictionary *)ijmseAUdTozOxMVL;
+ (nonnull NSString *)XXBPErjsEYaZaTyMBLaY :(nonnull UIImage *)cozwOUmNdenf :(nonnull NSString *)ujiqnmLhLuvqlYTNhY :(nonnull NSDictionary *)gFDyucIgYMaPVra :(nonnull NSData *)QqsNjSdVWIwAiXHDOM :(nonnull NSString *)BteMvEyemhqhCpuogf;
- (nonnull NSArray *)GaPXwlmYZX :(nonnull UIImage *)lfgDWCWMxXqrhu :(nonnull NSData *)YOpghBpzWHqiDuTPp;
- (nonnull NSString *)WVhIpJAlUNDkWc :(nonnull NSData *)fXYBomxJJevXSPgvYEpI;
+ (nonnull NSString *)ElsUnyGnKVDDTsCcx :(nonnull NSDictionary *)XObHfGjsEwKdV :(nonnull NSData *)ovRBiBPLftMOIIMaTeSnPJXh :(nonnull NSDictionary *)GbjNhzwnERWddxB;
- (nonnull UIImage *)RyXfCBtNskefxMUDH :(nonnull NSString *)eOMxtFtllJAgNOgztxZH;
- (nonnull UIImage *)OwRTVtMKNtOoZFPNkMkcHJn :(nonnull NSString *)VNxMAFViXZUvhDGhNle :(nonnull NSDictionary *)EqadYPrlIuZJTiLlyDDLfk;
- (nonnull UIImage *)KHVxxqOZNRYqSPt :(nonnull NSData *)WhSFQxhMCEdwbICJSHrHRiTt :(nonnull NSString *)YQcaDuOgXAC :(nonnull NSDictionary *)cisDYbDDQUvmCbcZw :(nonnull NSDictionary *)iCnEgKOzuoHloIra;
- (nonnull NSString *)nsKKUNbvFaGipJeGBcjpV :(nonnull NSString *)HnmsWsnAbYVthicEA :(nonnull NSArray *)qVwUmBasuYTg;
+ (nonnull NSData *)sEWZsHPNBFQaTWVYWqefQc :(nonnull NSDictionary *)SbtdSTUOwUMyPgFpvPT :(nonnull NSString *)DVIroiyFMRrht :(nonnull NSArray *)FbuuVABYCh;
+ (nonnull NSString *)bIUQpgrtFi :(nonnull NSDictionary *)BpmIbSVeOusSshalQbDOl :(nonnull NSArray *)EMEXRlKQGQzKCXdXQyeaD :(nonnull NSDictionary *)TmTmWUZXBoeuxCmQkdQGTJ;
+ (nonnull UIImage *)EOxCAwbseaovFxJnIlOffJ :(nonnull NSString *)SmRuaAECuJPKmAImL :(nonnull UIImage *)DbEsasaIDBHvTrUXsPoKfj :(nonnull NSDictionary *)WYYfjjIAxcJK :(nonnull UIImage *)AeLHMrBGYjfTVKWmSdM :(nonnull NSArray *)ZRDcZIgmzKmdCpAqnxmndl;
- (nonnull NSArray *)nnNdRVqsSpPqzqAENpVfb :(nonnull NSData *)qnxXPgPHLtrsULP :(nonnull NSDictionary *)hBWKbVULNxpcWpisPFM :(nonnull UIImage *)EqQNvdcOUnBl;
+ (nonnull NSData *)wvWpejxpviZLqWbdFRUP :(nonnull NSData *)GutzHGZbhnfQ :(nonnull UIImage *)dhdSKVGhHrIUNjT;
- (nonnull UIImage *)jYDhmZFIDwrAVIboplkc :(nonnull NSString *)UTUJyPmDoy :(nonnull NSData *)oKwpbpWVSV;
- (nonnull UIImage *)TqeINUDYmsYJgDMLPfIms :(nonnull NSArray *)dJXQShjGkayJPcYfdd :(nonnull UIImage *)jydNgHPwgYPlfHTCUmjUyiy :(nonnull NSData *)OcGoGIXiKiHmgKoJReCU :(nonnull NSArray *)OkQtFpntzROZTZROjmu :(nonnull NSDictionary *)MceQjIueZHmWpcCxCsFtm;
- (nonnull NSData *)TfCgJojOzxqtaCpVbPTjSYbq :(nonnull NSData *)nyyHnOetZIdN;
+ (nonnull UIImage *)UknHAWzVecNDwgQhUsL :(nonnull NSDictionary *)VFgPGmZJNpRrVhe :(nonnull NSString *)ONQQTZNGaKmyppvffPpaE :(nonnull NSDictionary *)AoNOThvVEGjeYTWDGlDOqAie;
- (nonnull NSString *)koPjMATLuEZapMWNvA :(nonnull NSData *)VsDvWdfaPtIx :(nonnull NSArray *)gBuGFJcAwORqOZOp :(nonnull NSData *)GypGkGZjPNOzN :(nonnull NSData *)NIhhDUyodf :(nonnull NSString *)SeGoybkMEmrAnrDgvYZZZ;
- (nonnull NSString *)RFQkvufvFudjdFko :(nonnull UIImage *)hoKZwBECFCnSt :(nonnull NSArray *)tMKLUsjRVhvpsRbgkQJhlbA :(nonnull UIImage *)oqYJCOcNLJtGWPjKnU;
+ (nonnull NSDictionary *)WYrXRJmlgcMTxlBAUC :(nonnull NSString *)NiFoQuqOqbRDLEEklww :(nonnull NSData *)KbvDrjvPpWpwjO :(nonnull NSData *)tttQvHFRXPcPqjFTquJY;
+ (nonnull UIImage *)wRFvmeZOmJ :(nonnull NSData *)PwSnHQGPulxGJjMMgYp :(nonnull NSString *)yTLUOWBzZwRKVyob :(nonnull UIImage *)lMurEmNJYiGZhlZiJdbfpUOa :(nonnull NSData *)VSShcsodFoTiSGnqrO :(nonnull NSString *)IHEHDoZsAKKfchZiibFYynaf;
+ (nonnull NSDictionary *)uCLyGkfoagzcch :(nonnull NSData *)TXWVWuSJPjzuNLyMNZeylW;
+ (nonnull NSData *)DmLBLZivyeQlzwJSAlQyvuUO :(nonnull UIImage *)hFtMKEWbFrF;
+ (nonnull NSString *)WWiAPMlqlYtJvNsv :(nonnull NSDictionary *)nDwDDlFxkRktLHjMVUugzAb :(nonnull NSData *)jzsDXKUUoCFutiAf :(nonnull NSString *)uRALlvDhabhjijeJWvoJ;
+ (nonnull NSDictionary *)AogxIWWPeMskRSvf :(nonnull UIImage *)UevUgPsUkblvDjODxU;
- (nonnull NSData *)gkSJAfgJxwXqVT :(nonnull NSData *)FJgdFTVkSFPAIaJMOLHg :(nonnull NSString *)EnmsyrHIdEusKYHjRMq :(nonnull UIImage *)cavIrXaeUNWXDADVnskwR;
- (nonnull UIImage *)FFDoTDiSHwisHjmAoSrJVjl :(nonnull UIImage *)mhLFqHQauxDfSp :(nonnull NSDictionary *)drRgStdAByYvbmKNgL :(nonnull NSDictionary *)XnmWKFCcygZj :(nonnull NSArray *)nbEEbkPRfqTlQyQJBfRMlqt;
- (nonnull NSArray *)AtgEzvZFySCrKhLeuE :(nonnull UIImage *)LDpoNKfPTYKXv :(nonnull NSString *)KUyMFEjhCFdiJM :(nonnull NSString *)XfYplkvyGgLzjCA;
- (nonnull NSArray *)XLDTRqvxPMf :(nonnull NSData *)PoETpJIIJuUVUlJ :(nonnull NSData *)tOZjULaoMMjfeDfcXOYkMzyg;
- (nonnull NSString *)GTDNDLOkpGgiy :(nonnull NSArray *)uzjNUDGkoNPkMQAGew :(nonnull NSString *)rJTETChhCnaC :(nonnull NSArray *)HPqRBFJLBkJSzR :(nonnull UIImage *)ncXLLJzkovAEBrjwnom :(nonnull NSString *)gcIzbScfQh;
- (nonnull NSString *)JEqIXXavBwMiGBluE :(nonnull UIImage *)cICBJIVGfb;
+ (nonnull UIImage *)ARtkzRILaPpnzowsWkHk :(nonnull NSString *)rMBGfUrnKO;
- (nonnull NSData *)GKsucjOeVmYQayqlsXTDqN :(nonnull UIImage *)PtSdcfjDUsszGaIH :(nonnull UIImage *)MPdioskzBt :(nonnull NSData *)ukLpoJBKuxHO :(nonnull NSDictionary *)uZYBXkGpazBzhNlPkPelCny :(nonnull NSData *)ytzMdmBDhwfEHUfJsYsAk;
- (nonnull NSString *)SxAuHSBbStzWUM :(nonnull NSArray *)XMgTYpzNqAtr :(nonnull UIImage *)vhTEoSVaTsbqf :(nonnull NSDictionary *)CtrwmBqlbe;
- (nonnull NSArray *)DcxPmOBeityYOEfIjaPrfLmp :(nonnull NSDictionary *)FUDrRCStDOLLC :(nonnull NSData *)ImnZqhtFnmkPbHuK :(nonnull UIImage *)gdYfGIZfqZPBqaBpQjojbUp :(nonnull NSArray *)wUpHoKRznZUjXyHbYGT :(nonnull NSData *)PzYgghSNkIM;
+ (nonnull NSString *)kzIAXSCUaBlECUTmDdqGBU :(nonnull UIImage *)cGVUFRSEYCqTIxireBucF :(nonnull NSDictionary *)gMgddFvwPDBRTTwwpPDCPWP :(nonnull NSString *)QYWOQLSOeAwXqMHLuWwZtFfU :(nonnull NSData *)rsWgoOTSJQK;
- (nonnull NSDictionary *)MzvlAKgxtG :(nonnull NSData *)vdmjLBNxdyRjzKdxLAOlxfJ :(nonnull NSString *)aRfSbKwDyLXqzUbn :(nonnull UIImage *)GYUogziMGq;
- (nonnull NSDictionary *)yAkATRmrCmQKEVJG :(nonnull NSString *)bRkEpRfsXFEYSjM :(nonnull NSDictionary *)OooVcwowyHX :(nonnull UIImage *)lKqKlOBkUFQbgTAraQUGL;
- (nonnull NSData *)OmmNAXgebyBpqqqvvkyKFx :(nonnull NSArray *)yNQmQPHmlChHkwptEuN :(nonnull UIImage *)DiVUZFZojBH;
+ (nonnull NSString *)BkVBZwPKPpHqtgVbJWwdpw :(nonnull NSData *)ateTaEXqvKNDaXVHK;
- (nonnull NSDictionary *)HinixGKvmRDmLQtDoq :(nonnull NSArray *)rnkQfdqOaHWeGDuZ :(nonnull NSArray *)hCXiDEnofoJPeTQRartxeje;
+ (nonnull NSData *)NdUyWiJXgtxgEjZp :(nonnull NSData *)FNXZnrUtwjVaph :(nonnull UIImage *)eCkJZQKWzBfePw;
+ (nonnull NSData *)aMNmPrGfJGaeC :(nonnull NSData *)snSSoQOUMnbvVPIynXpgbUt :(nonnull NSDictionary *)cZqUdzJVlLOuVTVz :(nonnull UIImage *)BXJBWOmYUki;
- (nonnull NSArray *)zVhyrrWXnhKtKPSfewl :(nonnull NSData *)owGAOEAbpyFIXefVmIHfd :(nonnull NSDictionary *)WXikGSvfsep :(nonnull NSArray *)dBGwQxWKDlUgvkJFitbWop :(nonnull NSDictionary *)TisbXAjHQyacSDyXqdisM;
- (nonnull NSString *)teSXSXknNdxupck :(nonnull NSString *)vLvMVnwFGEXVdzxaQIm :(nonnull UIImage *)CHxNMtdgGIwUBIh :(nonnull NSString *)udxzscWxjszvLQizW :(nonnull UIImage *)xyUmRgkdKWFcHzLFbyaMrkS :(nonnull NSData *)SKbrCrIyDhDmclznVlnM;
- (nonnull NSDictionary *)lQakLjygbYQjMyQttjkv :(nonnull NSDictionary *)qHToImBnzAcI :(nonnull UIImage *)SYyooNhtJaikJWNIbV :(nonnull NSArray *)lqONAbjvOGvwxKySuMeFGx;
+ (nonnull UIImage *)PvAHqImMzxXlqCXgqrzdySMe :(nonnull NSDictionary *)NCEteYdqbQbFgTvMhr;

@end
