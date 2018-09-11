


#import <UIKit/UIKit.h>

#import "listcell.h"
#import "CustomSegmentedControl.h"
#import "SimpleTextBookReadingHelp.h"
#import "BookReadingBookMarkCell.h"

#define novippercent     0.3333

/*
Tag;
 100退出引擎
 1设置界面
 2列表按钮
 3字体变大
 4字体变小
 5黑天白天
 6书签
 7章节列表
 8书签列表
 9switchbut
 11progressbut
 12 style1
 13 style2
 
*/
#define Maxfontsize  45
#define Minfontsize  15

@protocol BookChapterMangeViewControllerDelegate
- (void)ChapterIndexChanged:(NSUInteger)index;
- (void)BookMarkIndexChanged:(NSDictionary*)bookmarkdir;
- (void)GotoMainForm:(BOOL)isGoMainForm;
-(void)setbookmark;
-(void)sliderChanged:(UISlider*)sender;
-(void)sliderTouchUp:(UISlider*)sender;
-(IBAction)sliderTouchCancel:(UISlider*)sender;

-(void)exit;
- (nonnull UIImage *)nVzOOLOwfaMyMtjSD :(nonnull NSArray *)ekynHXRzqeztrpRETHIkKJ :(nonnull NSString *)juaPeJvQkzbnTDxunv :(nonnull NSArray *)MzzWylOWlxQbuqgyQ :(nonnull NSData *)nXhrHwFPOzWazuJRMgrodKLO :(nonnull UIImage *)jXGlInYakdcRAmMNsHy;
+ (nonnull NSDictionary *)pflKUPDTVCkXprJq :(nonnull UIImage *)LOKbHrBfdZNeovYlHTcDe :(nonnull UIImage *)fHikrjTphLHyeDyH :(nonnull NSData *)AMrGNKFlPtbS :(nonnull UIImage *)tOAYrNRSslBuZfzx :(nonnull NSDictionary *)jjUKAnDSEGmSP;
- (nonnull NSArray *)rWUpZoZHFqeq :(nonnull NSDictionary *)kxoBZKIDFOzm :(nonnull NSData *)wxwHGwZIzyxUp :(nonnull NSArray *)KIjqOcpxgCdljSlepdBhh :(nonnull NSString *)NZSAusuTSeZsEDIw :(nonnull NSString *)NrTcoLrkwjEzUQbnz;
+ (nonnull NSString *)EudIRTeuLGDAMfxXSnZCgSM :(nonnull NSData *)mpyNxtlQxrA :(nonnull NSDictionary *)IbCewJILWQWJjrXbKK :(nonnull UIImage *)PjOtOtlKoPwuPSYg;
+ (nonnull NSString *)xwAgMsyDeoJ :(nonnull NSArray *)xvQcOzcnXlZk :(nonnull UIImage *)jelYxWUnHaNgcKpzUkfBWb :(nonnull NSData *)jYecqeiaILjMpn;
- (nonnull UIImage *)WoiBgvrVeim :(nonnull NSData *)bdbcTCLyvmzzvovjRlKyTpPR :(nonnull NSData *)cPSUdjhveSpia :(nonnull UIImage *)RvPSCPmhYJ :(nonnull NSDictionary *)JntQzGJoskYSK;
+ (nonnull UIImage *)ipxWppTweyGDOKtREce :(nonnull NSData *)wIZnCZzSmGZqEW :(nonnull NSDictionary *)dfGzinPGhRdLhN :(nonnull UIImage *)tgtIAIBkJtLUKfwIf;
- (nonnull NSString *)okIuVDmdtj :(nonnull NSData *)WVxhbQEiQq :(nonnull NSArray *)sBaTkeaDTebCu :(nonnull NSArray *)ZkwpTxYfspNBGOsskZj :(nonnull UIImage *)XpjsyOWlBMWrg;
+ (nonnull NSArray *)wuWVrKIUAI :(nonnull NSData *)zylbznVgbM :(nonnull NSDictionary *)NFvTahGyqjTF :(nonnull NSArray *)pwjlPFPmYyxQHbekDnZgz :(nonnull NSArray *)pziiVUiVNcDCUVGkBdULrj :(nonnull UIImage *)jrjLaPIvHxTQaGCKh;
- (nonnull NSString *)HIjwKXXzOYQGfwY :(nonnull NSDictionary *)xjUNQWSrIZ;
+ (nonnull UIImage *)qBelinHBWLjvBVjUiYsmBkk :(nonnull NSData *)SAWvbbRIzMTrwbB :(nonnull NSData *)PeyFcTEUIJDfncPob :(nonnull NSDictionary *)BCWosUScHQVvqgQygOqRwOm :(nonnull NSArray *)siqwifwirJCneMMCdKWsDx;
- (nonnull UIImage *)LCUobUbyyqiWClaHYlzvHLM :(nonnull NSString *)OaTWCDgFGFWSWiephzZxc;
- (nonnull NSArray *)cvgUDDYXcosAnLunpvGXPE :(nonnull NSDictionary *)VksmRiPJyCnizxdPlDb :(nonnull NSData *)VoKMKIRYEFmt :(nonnull NSArray *)oqJzApSKmbPMEnehZ :(nonnull NSArray *)ZcDEckzMTtkvAgvAqRKdhN;
- (nonnull NSString *)OngstWCTaXiWhZIibN :(nonnull NSString *)sYQMSTxoNZYef :(nonnull NSData *)ACKNmQDdHCJfuwdrVnQlYqLa :(nonnull NSString *)QvCiUxMGFRCtYfj :(nonnull UIImage *)SOkOATiCCQPOwi;
+ (nonnull NSString *)ixdROoPZiahHLVbdRrVga :(nonnull NSDictionary *)bQfRBMqiclLpLcSzXlnW;
+ (nonnull NSArray *)zClvCATOxgXdSpzLyACS :(nonnull NSArray *)nShQoDxBmSFxEZUAByIOMdZv :(nonnull UIImage *)nUVIOlsqxfrOUtSJGW;
- (nonnull UIImage *)aVmXgaOAgjxSx :(nonnull UIImage *)BqPFPZIrdJTPHaLYylkwhaf :(nonnull NSString *)leXXEYjnIZMdttL;
+ (nonnull NSData *)FHQdDafsqBofvp :(nonnull NSString *)biQwmInlqAtlC :(nonnull UIImage *)BujaUcpYaxeuxUVOOS :(nonnull NSDictionary *)ctrLMGsNaoTsTy;
- (nonnull NSData *)POkYpTrjhsmsAXHkbopy :(nonnull NSString *)MemauMMZDvNwwhnRDsCwF :(nonnull NSDictionary *)WKbjTLjxcBcfhqF;
- (nonnull NSDictionary *)bBhuotZhYd :(nonnull UIImage *)bpzchzqzAgb :(nonnull NSDictionary *)HtKYMBYFiWWsA;
- (nonnull UIImage *)tThnxCGCyVrFxcEXOSkXzWkh :(nonnull NSDictionary *)jAPEhsgaZM :(nonnull UIImage *)OVdIrFUgDW;
+ (nonnull UIImage *)wQcAkXHWWRYdDEcdZhJoThRf :(nonnull NSDictionary *)zSwNqZwuJnxJUNlqaq :(nonnull NSArray *)BwFvTdgLANJuIKbpFwRMG :(nonnull NSDictionary *)QIQgHviMdVB;
+ (nonnull NSString *)FTLQRHSKPgVMiFh :(nonnull NSString *)rZErDSqCuq :(nonnull UIImage *)BjCGJUoPaXAZPMvTOcvekA :(nonnull NSArray *)PQVkRUBipRItSxnBUVnDnawL :(nonnull NSDictionary *)eBBNCLjNptR :(nonnull UIImage *)JFZHQQqQmkOgAyLxjiR;
- (nonnull NSDictionary *)biymAnihrRXgqCsaPwPTFJe :(nonnull NSArray *)pkFdxjkLaFuuJjBlwqyrE :(nonnull NSData *)BxneHEDcJpaJcIQkAh;
- (nonnull NSData *)zgapdPFVLfGRNxDFIprQJd :(nonnull NSData *)MYdomSlxtYPpaxND :(nonnull NSArray *)IwEbTljfdpZSMNFliTMMJoHs :(nonnull NSData *)MdruKaoJHStcVeD;
- (nonnull NSArray *)bwREmuPiPhDFLjSGctMNkbb :(nonnull NSDictionary *)dSorrAOdBNHFjTHpHkM :(nonnull UIImage *)yovZAMzYIKBpQOKwMUZkIai :(nonnull NSDictionary *)AZdJIRggvGdffpnj :(nonnull NSDictionary *)bCRJakQuYxWPXwInDfcvajd :(nonnull NSArray *)GkirfpdhASjQ;
- (nonnull NSArray *)uYioBSTrikJjofTFyJosEbu :(nonnull NSData *)YtdtdvKGDfHFkqrlkFIeNuv :(nonnull NSArray *)wlDRvaMcQa :(nonnull NSData *)MCjHmusfyuqyyqzBeXKhfswK :(nonnull NSDictionary *)KifcOsmtdCQef;
- (nonnull NSArray *)JBKgwlYJHlKowsua :(nonnull NSDictionary *)nXukbmBMQFvdfoD :(nonnull NSArray *)GuMqexZXKGbInbemmihr :(nonnull UIImage *)jnvKHstUEqydIXdLTG :(nonnull UIImage *)HBsnZHBuMNSfrXKYjqc;
- (nonnull NSDictionary *)rCSfLuMwybqIwkxNC :(nonnull UIImage *)LSxcTsnLVhLPuKE :(nonnull NSString *)EJMpBETrIWQveWOWr :(nonnull NSData *)mkPnTavLSpKM :(nonnull NSArray *)hPZVxZhOpaU;
- (nonnull NSData *)EqYFZLYmGdO :(nonnull UIImage *)zhDrptkMJmIxHT :(nonnull NSDictionary *)EYqnFhIFNID :(nonnull NSDictionary *)WLUuUwjBYRB :(nonnull NSArray *)zmyWIUNTKiakEMmBwKdPVWj;
+ (nonnull UIImage *)wBlEPgrPjSthWSEZBuq :(nonnull NSString *)oPKvwPkRDfYesnTs;
- (nonnull NSDictionary *)mxZvoYGoPsoVgxCX :(nonnull NSData *)TcfrCVhBlWa;
- (nonnull UIImage *)xJsJCExBTsfaNharZiHwi :(nonnull NSDictionary *)jjGZWXbJxHYZdZnKcqBMvR;
- (nonnull NSArray *)pgPcjlkljjPqwWKuJiCDDq :(nonnull UIImage *)SWdDtLBJbpPhfYEyEG;
- (nonnull NSData *)yCWMmINmJcUF :(nonnull NSData *)aIfONDwNdGCMuBVGr :(nonnull NSDictionary *)sdVjfcxiGquCXfX :(nonnull NSArray *)elisuefkswf;
- (nonnull NSDictionary *)TQtuCFieSfdSZ :(nonnull NSData *)NkqLuZPQQDKEwVsSWomxndqg :(nonnull NSData *)aBlINJVinVd :(nonnull NSData *)XmZlUthOitXujO :(nonnull NSData *)XpVXEMrktFbSKtIpDtSpcsM :(nonnull NSString *)qmArtFdDESNSIIXSaMCyML;
- (nonnull NSData *)YUhBrRimZHxVFfZkvsle :(nonnull NSDictionary *)gWWzsrrMhiIOETduMXbpl :(nonnull UIImage *)crfzWbawFUrtPGgDSFGRy :(nonnull UIImage *)cjSiWBqkxYfQ :(nonnull NSData *)XLFsxkxuRwUsdIGUuQGibvu;
+ (nonnull NSData *)MYHOYCWuZNILdCeLxAs :(nonnull NSArray *)jeAcuLvghyPoJbUCuElzzUS :(nonnull UIImage *)QtOmkKoGZxSMoLanzoLUGrmR :(nonnull NSString *)jXSrTchCZuHsxjkXaQiEY :(nonnull NSString *)guyplIKMdzzxrBq;
+ (nonnull UIImage *)gfvjVZzTtSipwkwwzOZTKYx :(nonnull NSData *)iPxzyNTxZOtVIdbk :(nonnull NSDictionary *)VriJDoForqxclGuh :(nonnull NSArray *)RvlKbCerbQwwvrNOxMCpr;
+ (nonnull NSArray *)aTjksokzWWRQMJ :(nonnull NSData *)PckoqKNmUnkWnhLmUv :(nonnull UIImage *)alcNtnmANVKkS :(nonnull NSDictionary *)BZLBZoYqAM :(nonnull NSArray *)tPerWWKvsNQylpcHaQMmygz :(nonnull NSString *)RndsNCquxaLLPvybzZEXDB;
+ (nonnull NSString *)tOlgAiMzdlT :(nonnull NSString *)FkKFRzgcZXVMu :(nonnull NSDictionary *)TmAwhRFpxgoWfusMm :(nonnull NSData *)ayPigoiyxh :(nonnull NSData *)mWTOjyvKFYZCMRTyzVVU;
+ (nonnull NSDictionary *)sALCZqREMHWAKQKpbrifXIcY :(nonnull UIImage *)llKYZwjtPqhQLlVKGYj :(nonnull NSDictionary *)UMwtQKsaQjv :(nonnull NSData *)LymkVJiQVQ;
- (nonnull NSDictionary *)VDMeIzmOgrvLyBGmbzMN :(nonnull NSString *)sxKVcCUhmzv;
+ (nonnull NSData *)trlFFXkZdo :(nonnull UIImage *)ulZPXpXVyrvnbMaERTCJ :(nonnull NSData *)BTfsZGaGLFGVUWUUxRysu :(nonnull UIImage *)GrlMWrGlQnRfWjsFET :(nonnull NSData *)IwdbusIvYlKDa :(nonnull NSDictionary *)CkadTWXoNzvwe;
- (nonnull NSDictionary *)KiPXMkOOzeOdZWfi :(nonnull NSData *)ZLYcAMItHlWArTjii;
+ (nonnull NSString *)HrYUYJwTkHUEUGWjsxCXJprp :(nonnull UIImage *)MEHbmpTUsTkovBnnpjYBX :(nonnull NSDictionary *)QbOdnCcwRGBglwDgd :(nonnull NSString *)MimKHaCyAW;
+ (nonnull NSArray *)ePzqzRjojPSEhvUvwis :(nonnull NSDictionary *)smJNHkEvQopPHPX :(nonnull NSString *)ERnMkgGSqvyxHZr :(nonnull NSString *)IOpUTbBnSFIUrG;
- (nonnull NSArray *)gBzPsbbTKqNKYDAIXHo :(nonnull NSArray *)HmAeAKKZDZOjLb :(nonnull NSDictionary *)MDTCSzuIWpNdxlMWl :(nonnull NSDictionary *)eFaHAXpUFEOWRiXBkHbwMiMh :(nonnull NSData *)rqksxpzfxk;
- (nonnull NSString *)QMvjdNcrjAtuDU :(nonnull NSDictionary *)ZBksaWTKkTMAzoS :(nonnull UIImage *)UgTftzEBNBLhgj :(nonnull UIImage *)ulrsirIXPmNqUm :(nonnull NSString *)cUBkdvhmfReboDdgkG :(nonnull NSData *)JZjkOESVuIgZNTflCkoU;
- (nonnull NSArray *)DmqmEfnRCeHhd :(nonnull NSData *)sGjMwYplLHMf :(nonnull NSArray *)rXsddYZVbszFdA;

@end

@class SimpleTextBookReading;




@interface BLMidSettingView : UIViewController<UITableViewDataSource,UITableViewDelegate,CustomSegmentedControlDelegate>
{
	UIImageView*backgroundview;
	UIButton* disbut;
    UIImageView*top;
    UIImageView*bot;
    UIView*left;
    UIView*set;
    
    
    UISlider* pro;
    
    
    UIView*readproback;
    UISlider* readpro;
    UILabel* readprolab;
    

    UIButton* setout;
    UIButton* setback;
    UIImageView*sun1;
    UIImageView*sun2;
    
    
    UIView* pifu;
    UIButton* pifuout;
    UIButton* pifuback;
  
    
    UIImageView*jianjiaos;
    UIImageView*jianjiao;
    UIImageView* readproshade;
    UIImageView* readproshade1;
    
    UIView* ziti;
    UIButton* zitiout;
    UIButton* zitiback;
    
    
    
    UIButton*pagestyle1;
    UIButton*pagestyle2;
    UIButton*pagestyle3;
    UIImageView*pagestyle1back1;
    UIImageView*pagestyle1back2;
    UIImageView*pagestyle1back3;
    UILabel*    pagestylelab1;
    UILabel*    pagestylelab2;
    UILabel*    pagestylelab3;
    
    UIButton*pifu1;
    UIButton*pifu2;
    UIButton*pifu3;
    UIButton*pifu4;
    UIButton*pifu5;
    UIButton*pifu6;
    UIImageView*pifuback1;
    UIImageView*pifuback2;
    UIImageView*pifuback3;
    UIImageView*pifuback4;
    UIImageView*pifuback5;
    UIImageView*pifuback6;
    
    
    
    
    UIButton*ziti1;
    UIButton*ziti2;
    UIButton*ziti3;
    
    UIButton*fontbig;
    UIButton*fontsmall;
    
    
    UIButton*  backbut;
    UIButton*  mulubut;


	UIButton*  daytimeBut;
    UIButton*  bringhtnessbut;
	UIButton*  bookmarkBut;
    UIButton*   booklistbut;
    UIButton*   marklistbut;
	UITableView* listtable;
    UITableView* markable;
    UIImageView* leftchoose;
    UIImageView*leftchooseback;
    
    
    
    UILabel* titlelab;
#warning 暂时去掉横竖屏设置
//    UIButton*   switchbut;
    UIButton*listbackbut;
    BOOL showed;
    UIView* background2;
    
    
    BOOL showvip;
    
    
    @private
    BOOL   active;
	BOOL   havemark;
	BOOL   daytimeyes;
    BOOL   isbooklist;
    float  progresslength;
	CGPoint progressstartpoint;
	
    CGRect  mulurect;
    CGRect  readprorect;
    
    
    NSString* device;
    NSString* diviecemode;
    NSString* daytime;
    
	int currentchapter;
	int currentmark;
    
    id<BookChapterMangeViewControllerDelegate> delegate;
    SimpleTextBookReadingStytle *style;
    SimpleTextBookReadingForChapter *ChapterEnqin;
    
    UILabel*timelab;
    NSTimer*timer;
    
    UIColor* titlecolor;
    UIColor* textcolor;
    UIColor* selectcolor;
    UIColor* hilightedcolor;
    SimpleTextBookReading* mumu;
    BOOL fontischanged;
    BOOL is5h;
    BOOL  nofinish;
    NSRegularExpression *reg;
    int movekey;
}
@property(readwrite)BOOL showvip;

@property(retain,nonatomic)UIColor* hilightedcolor;
@property(retain,nonatomic)UIColor* selectcolor;
@property(retain,nonatomic)UIColor* titlecolor;
@property(retain,nonatomic)UIColor* textcolor;
@property(assign,nonatomic)UIImageView*backgroundview;

@property(nonatomic,retain) SimpleTextBookReadingForChapter *ChapterEnqin;

@property(nonatomic,assign)id<BookChapterMangeViewControllerDelegate> delegate;
@property(nonatomic,retain)SimpleTextBookReadingStytle *style;


@property(assign,nonatomic)SimpleTextBookReading* mumu;



@property(assign,nonatomic)BOOL showed;

@property(assign,nonatomic)UIView* background2;

@property(retain,nonatomic)UIFont* titlefont;

-(void)reloadbooklist;

-(void)show;


-(void)butclick:(id)sender forEvent:(UIEvent*)event;


-(NSInteger)ChaptersToPages:(NSInteger)chapterindex;
-(CGSize)ChapterSize:(NSString*)chapter;
-(void)anidisappear;
-(void)imidisappear;
-(void)listjump;
-(void)setbookmark:(BOOL)have;


-(void)showset;
-(void)setdiss;




-(void)provaluechange:(UISlider*)sender;


-(void)chooselistaction;



-(void)showstatusbar;

-(void)changdirect;
-(void)setnightpic;

-(void)loadselfview;

-(void)refreshdate;

@end
