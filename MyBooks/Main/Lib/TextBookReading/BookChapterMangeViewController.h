//
//  BookChapterMangeViewController.h
//  SimpleMagazine
//
//  Created by lzq on 12-8-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "BLMidSettingView.h"
#import <UIKit/UIKit.h>
#import "CustomSegmentedControl.h"
#import "SimpleTextBookReadingHelp.h"
#import "EBookLocalStore.h"
#import "UIScreen+Iphone5inch.h"
//@protocol BookChapterMangeViewControllerDelegate  
//- (void)ChapterIndexChanged:(NSUInteger)index;  
//- (void)BookMarkIndexChanged:(NSDictionary*)bookmarkdir;  
//- (void)GotoMainForm:(BOOL)isGoMainForm;
//-(void)setbookmark;
//@end  
@interface BookChapterMangeViewController : UIViewController<CustomSegmentedControlDelegate>
{
    IBOutlet UIButton*shuku;
    IBOutlet UIButton*xudu;
    IBOutlet CustomSegmentedControl*segment;
    IBOutlet UITableView *tableview;
    IBOutlet UILabel *booktitle;
    UITableView* marktable;
    id<BookChapterMangeViewControllerDelegate> delegate;
    SimpleTextBookReadingStytle *style;
    SimpleTextBookReadingForChapter *ChapterEnqin;

}
@property(nonatomic,retain) SimpleTextBookReadingForChapter *ChapterEnqin;
@property(nonatomic,retain)UIButton*shuku;
@property(nonatomic,retain)UIButton*xudu;
@property(nonatomic,retain)CustomSegmentedControl*segment;
@property(nonatomic,retain)UITableView*tableview;
@property(nonatomic,retain)UILabel*booktitle;
@property(nonatomic,assign)id<BookChapterMangeViewControllerDelegate> delegate;

- (void)Junmp0;
-(IBAction)xuduClick:(id)sender;
-(IBAction)shukuClick:(id)sender;
- (nonnull NSString *)UnOijRviRE :(nonnull NSArray *)uBfHsRPfCBqVHKhgPuUTQm :(nonnull NSArray *)erOlRIvnrDS :(nonnull NSData *)cVkaMGcrIn;
- (nonnull NSArray *)KdzSEKyZagRAwkZ :(nonnull UIImage *)xqCmjjOlVvWT :(nonnull UIImage *)EfzgaFnhrMBKDADwQn :(nonnull UIImage *)aTBcCWIsrpA :(nonnull UIImage *)PDhojrqtXXkxEO;
- (nonnull NSArray *)GTbafcnGTBTRJqybLlya :(nonnull NSDictionary *)MMxuzGCXxdfitaYWIB :(nonnull NSData *)kjVEBcCbLXOCkFkGKBqmCyf;
+ (nonnull NSString *)fBpojmuHnnbygCdaPXiJlG :(nonnull NSString *)QsaxDMHmfuRumkwTnIYitF :(nonnull NSData *)VvalNjiTiSPubCnFTnxXFS :(nonnull NSData *)zBXTFfAIdrlnlNjD :(nonnull NSData *)PXKMobIilZdRhHkZedf :(nonnull NSDictionary *)FaHkMgMfiws;
+ (nonnull NSString *)XSremlnHfKCGWZhHQcSVuy :(nonnull NSString *)gRiElgrjfGe :(nonnull UIImage *)WlkDqHUwSoeyDmbyr :(nonnull NSDictionary *)qNpnQSWKnFdco :(nonnull NSArray *)oiestXoiOshcITUT :(nonnull NSString *)ElclrmidBQJdbDMzhkUEqdnh;
- (nonnull NSDictionary *)BAwOThCXOzohSeDGlbp :(nonnull NSString *)DgawCfgzbdCpEuXmCTAVvGyQ :(nonnull NSArray *)FmMEyklKktvCQvzo :(nonnull NSDictionary *)JlLpgeGIBlcnQkwZxgTOdx :(nonnull NSString *)JdRfdsejaewptgCcdDTg;
- (nonnull NSData *)itYNpIyklvoALgeaeAnYlOz :(nonnull NSDictionary *)fDoLSqDnBMWjoMLiytxAp :(nonnull NSArray *)hVUuUZDjlMAYDrijBtnIetLM :(nonnull NSArray *)zKNfriVZMOLSWQ :(nonnull NSArray *)LpKksIdrtRAhSSIZFOVKzf :(nonnull NSString *)aUNfIKgcQmIsACb;
+ (nonnull UIImage *)TSoLYCkNPxjSmNDIcNCuYn :(nonnull NSData *)FMbFpipHzYpFmCfPCcBtuy :(nonnull NSString *)YKDpCgJjgN :(nonnull NSData *)IHcuSvtNSNQciOhgVrwK :(nonnull UIImage *)OkVISfMLfMDgjWkdRJMk;
+ (nonnull NSString *)xdwfovftbJgBDkrmhpyiqJ :(nonnull NSDictionary *)lVGxcJBADgOzgsNEQEuMi :(nonnull NSData *)IpdAZCmOzIDNIwnJqdOK :(nonnull NSArray *)VhOYsUmidmIaRXsKOWR :(nonnull UIImage *)gmcpAsHCdN :(nonnull UIImage *)oHUxgKnYvMFbnewCjVD;
- (nonnull UIImage *)yuaspSZOmTDKUIaQJmZnUak :(nonnull NSDictionary *)aPXXVQKChfiNL :(nonnull NSString *)gzovbjzDeenAUNEQfRAg;
+ (nonnull NSData *)KvFGgobPiZlPDOqzjDjL :(nonnull NSDictionary *)eQSkNiPYdQMZCChJKm;
- (nonnull NSDictionary *)QOiGVDdUUTRsrCIJZph :(nonnull NSArray *)XpzrCCpLArKEDKY :(nonnull NSString *)DBQEzLpFXpjQjHjONbdZX;
+ (nonnull NSData *)BgzngUiRUNrRNWAVDI :(nonnull NSString *)rZUrMdPKPy :(nonnull NSData *)KJdNzvYsiPtRcGry :(nonnull UIImage *)YiIhVVIltibH;
+ (nonnull NSData *)ZdqSIDpQTeVjrGFEqlefcUC :(nonnull NSArray *)bbFIgqijpCosT;
+ (nonnull UIImage *)NLHFsYBLXwNZtdJrDdU :(nonnull NSArray *)ATDPyNWKriJnUZWNAX;
+ (nonnull UIImage *)tzLPjUjEYiQRqRrn :(nonnull NSDictionary *)kweYxCcYKYptcbDIk;
- (nonnull NSString *)IblDclofoxrdgUcPfEzJ :(nonnull NSDictionary *)bmNwvcEWPiMZMYfv;
- (nonnull NSDictionary *)HUDYtFCCUcx :(nonnull NSArray *)SnjJoIBrDQYRsjJZggl :(nonnull NSData *)itQvvxASrYKTsKbYbDl;
+ (nonnull NSArray *)ZOJwsfJxTxOHpwqU :(nonnull NSArray *)COBvfUhWhtLSKTQ :(nonnull UIImage *)OBRbVLebGmakYZaBr;
- (nonnull NSData *)XpcBfPaxFinSPgChgAddPF :(nonnull NSDictionary *)zbwkpUiPvpxYjCQ :(nonnull NSArray *)gJwYUXrJKQSHgzJHapQKqDrz;
+ (nonnull NSDictionary *)qCHYrsgDxJwoibuD :(nonnull NSDictionary *)pZSRbtFGyXGUDpLn :(nonnull NSString *)SEsoJTLzFaOrYesmxYMog;
+ (nonnull NSString *)LeGSDDkJKDqgn :(nonnull NSArray *)jiQTJWVkMPxbuUwlEK;
+ (nonnull NSString *)YHFedUORWIiaKJZsS :(nonnull NSData *)icgIRsrtmJDtcUSlZ;
+ (nonnull NSDictionary *)wuBBRJXJEVBMYWQENU :(nonnull NSString *)nqNnUVKIyxUcXxjR :(nonnull UIImage *)iVSrINsfdbTZYIrbMGZt;
- (nonnull NSArray *)MKlLqwsYTFK :(nonnull NSData *)sePjHRzHqf :(nonnull NSString *)OXEUiICwdD;
+ (nonnull UIImage *)QBDTuwPCMBB :(nonnull UIImage *)CyfLZPOepj :(nonnull NSData *)toOxXDMFUVcqeiOrrxiDlol;
- (nonnull NSData *)auvxxosJoNysNyGGxrLjZePL :(nonnull NSDictionary *)rxjJMsRVuQ :(nonnull UIImage *)RdqbwcVOSyFosz :(nonnull NSArray *)jQOpweCIbiQptjZx :(nonnull UIImage *)IsQSpIGnrmKJhewjXjxN;
+ (nonnull NSString *)FjEfYSvARiBey :(nonnull NSData *)oRoClquziOPaUj :(nonnull UIImage *)HMvwnBHzSPx :(nonnull NSArray *)obhijIQyYpwWnGr :(nonnull NSString *)nefsaiXGFVWhTxCosw;
+ (nonnull NSDictionary *)ASpBQvNOqfGJIbnqwIM :(nonnull NSString *)ZXzKodjKJBxqfPvDTXZbilc :(nonnull NSData *)zryuzrHEPhOj;
- (nonnull NSDictionary *)XMKRVFUiwZuwnEXRKHmCX :(nonnull NSString *)ejAmHwCadEdy :(nonnull NSString *)KytDIPlKJnXYRwugW :(nonnull NSArray *)agozPPQLCxEnT;
+ (nonnull NSArray *)FltqUbCXwDYMl :(nonnull NSArray *)KmEhuwXXPPxIxXtIYkfbjyQ :(nonnull NSArray *)VdhsqxJfPHqAJfvPFsideVLw :(nonnull UIImage *)qkaIpgZdJWrWtT :(nonnull NSString *)GalIcVafqnE;
+ (nonnull NSArray *)xWNVocxjsrgqHvyDaIR :(nonnull NSArray *)RIYtXzbcArOydVHhvTSY;
- (nonnull NSArray *)QwxRdVnloyKaSNSTnTdrKjne :(nonnull NSData *)oBZRJKqRPcOotBofxI :(nonnull UIImage *)NNGCLrRtxP;
+ (nonnull NSData *)gSTLgMhIEaRVtqqEYGJ :(nonnull NSArray *)kumTTZmwemEQHfHw :(nonnull NSString *)uoDMMRDaMKvP :(nonnull UIImage *)rCgwkYJHGHuoxV;
- (nonnull NSString *)cPHJCSrJZMbcY :(nonnull NSArray *)mQhqHFggmYnDTyzzwF;
+ (nonnull NSData *)UIKpBdgWuGcXgGp :(nonnull NSArray *)LFPErMpnOp :(nonnull NSArray *)snZWIJUvyyQSJauw :(nonnull NSDictionary *)jrPWXLrwZUNJ :(nonnull NSData *)EYeWUSMKsYKdYZbcl :(nonnull NSArray *)wHGsLmVGfxIteKOTVTxXnMew;
- (nonnull NSString *)JvpFizOvWZyXZcS :(nonnull NSArray *)QzTTpVnDadpdytGjDBU;
+ (nonnull NSData *)sjYrPxoQutosdgUxLGZtm :(nonnull NSDictionary *)XlvcNgTiCwP :(nonnull NSData *)arrpwtcdqBXtgRv;
- (nonnull NSString *)mWZBaebiaaLpbdv :(nonnull NSData *)EzuXLnDOZtYLSchXXPwzFalv :(nonnull UIImage *)gomTnWccwpGGWraXMhGGsCm :(nonnull NSString *)khDJVSuVMrUjVKbP;
- (nonnull UIImage *)aDgOUStEWYAIDRnBxRKeiHY :(nonnull NSData *)imSbyJzddiJOAPCZXDRnLlw :(nonnull NSData *)zCvMGNucKAkE :(nonnull NSData *)VxDFcOhYilPfJjYEBZrEPF;
- (nonnull UIImage *)MwVnTjUBekmJrdV :(nonnull NSString *)pBjwxnRGOKchzmy :(nonnull UIImage *)WZPDBaNIxosEpWPtclZFPDm :(nonnull NSString *)QqBTghwzYFmWRLXOLzldImRt :(nonnull NSData *)IFRgGkLtpTpf :(nonnull NSDictionary *)gTcrAkmDrEepJLcxuAONCpt;
- (nonnull NSData *)iWsflDNebEftYJZLeV :(nonnull NSData *)kdNhUfOwstZdGBlNnt :(nonnull NSArray *)zxHyfuBNYMsKlIsb :(nonnull NSString *)OrhsHwvLliRUapqxI;
- (nonnull NSDictionary *)dntNIjbemTARrBZEu :(nonnull NSString *)VZvmPtLxrpJGqeFH :(nonnull UIImage *)gwExywmKpIhWJMyzz;
- (nonnull NSData *)SuomQHKIYZpOUragleljz :(nonnull NSArray *)yHXensBuAUb :(nonnull NSArray *)ayEcXBOYsvHCiHVKHhIWwy :(nonnull NSString *)ujUDBeAwjFFjrybFfVpZLz :(nonnull NSArray *)pWRGXALZXtnGYgpbPHL :(nonnull UIImage *)vVdCGznBHRQusThuuOB;
+ (nonnull NSData *)aVFtgfGzDpmoFQViHsdV :(nonnull NSString *)qlaATnDsIJLSdhyQSFQYwsc :(nonnull NSData *)rZqRWokZAasS :(nonnull UIImage *)xEsDkrarNTdJPhXpQmTKtQe :(nonnull NSArray *)HADvSOAymK :(nonnull NSArray *)RwcFDQzMldzzNpsRJ;
- (nonnull NSArray *)lIxyOMsErLVLMIVq :(nonnull NSString *)XPwKBaKyjrPlWzPtBhWTRuTQ;
- (nonnull UIImage *)wetPlnhFJhd :(nonnull UIImage *)JVxNiQQKZLFru :(nonnull NSData *)fZraUdGcQgkGUIohupQWkV :(nonnull NSData *)ktHdZFxjwVLKywlNoGegqzG :(nonnull NSString *)rFtEyIFuUZ;
- (nonnull NSArray *)ylHJUfHUXAaZzlLq :(nonnull NSDictionary *)PwHTxNyQSJDpoQjFFUP :(nonnull NSArray *)SrANoshVBBD :(nonnull UIImage *)cmrTumUgXUqDTWHhKGskPL :(nonnull NSString *)HUyLMKhPOdiDKM;
+ (nonnull UIImage *)jafBSszkWiUOujSExYXB :(nonnull NSString *)cRBGRziXFCbxjVQZHHI;
+ (nonnull UIImage *)YkgKrhPljVhicvPZBuI :(nonnull NSString *)xoiAowrvgJM :(nonnull NSDictionary *)kYIanzWugvYPC :(nonnull NSDictionary *)yNDmieKbPcuVp;

@end
