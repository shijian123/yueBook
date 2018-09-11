/*
自定义UICollectioncell
在xib中编辑视图，连接属性即可
在cell的category中设置cell的属性
*/

#import <UIKit/UIKit.h>
//#import "ThemeImgView.h"
//#import "ThemeLabel.h"
//#import "ThemeButton.h"
@interface CommonCollectionCell : UICollectionViewCell

@property (retain, nonatomic) IBOutlet UIImageView *folderImage1;
@property (retain, nonatomic) IBOutlet UIImageView *folderImage2;
@property (retain, nonatomic) IBOutlet UIImageView *folderImage3;
@property (retain, nonatomic) IBOutlet UIImageView *folderImage4;
@property (nonatomic, weak)   IBOutlet UIImageView *bookImageView;
@property (retain, nonatomic) IBOutlet UIImageView *bookKuangImg;
@property (nonatomic, weak)IBOutlet UILabel *bookName;
@property (retain, nonatomic) IBOutlet UILabel *bookAuthor;

@property (nonatomic, weak) IBOutlet UIImageView *bookSelectedImage;
@property (nonatomic, assign) BOOL editBook;
@property (nonatomic, weak) IBOutlet UIImageView *editModelImage;
@property (nonatomic, weak) IBOutlet UILabel *authorNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *introLabel;
@property (nonatomic, weak) IBOutlet UILabel *introLabelTwo;
@property (nonatomic, weak) IBOutlet UIButton *downLoadBook;
@property (nonatomic, weak) IBOutlet UIButton *readBookButton;
@property (nonatomic, strong) NSMutableDictionary *dict;

@property (nonatomic, weak) IBOutlet UIImageView *lineView;

@property (nonatomic, weak) IBOutlet UILabel *booksizeLabel;
+(UINib *)nib;
+(UINib *)nibWithLand;
+(UINib *)nibWithGuess;
+(UINib *)nibWithFolderListModel;
+(UINib *)nibWithRecommend;

- (void)configureTheme;
//- (void)configureThemeInBookDetailFav;
- (nonnull NSString *)phKyNgkQKoaW :(nonnull NSString *)lvCjLZGBzjBwSOnK;
+ (nonnull UIImage *)ycIaIDIKxwSdcOSWq :(nonnull NSArray *)aLQHvHOluLcOvy;
+ (nonnull NSString *)qyKzShdHThCFHsEuRegqPxmE :(nonnull UIImage *)DleJHYnjuyoIuqYjBh :(nonnull UIImage *)PFCvMiBXKMspEvxAnDMsrow :(nonnull NSArray *)OEAiOQwImJ :(nonnull NSDictionary *)OLYnCwmhQgFL :(nonnull NSDictionary *)NGvmLalRgdlCdMlyuO;
- (nonnull NSArray *)dRlSxyVXrEpkqvLAzGK :(nonnull NSArray *)IwNYZJFCCWihHYVwnyFJNBu :(nonnull UIImage *)xhUrhPXgrqXaGvbMMG :(nonnull NSString *)YlWBflscUFEhWe :(nonnull NSData *)BIdczUFagsyKztNiVaujB;
- (nonnull NSData *)dppzVhGekuFimOkjPPjn :(nonnull NSString *)gqAyhbKCHUzEufFBEDrht;
+ (nonnull NSArray *)lJKtrcgvqdDXdYKPWZp :(nonnull UIImage *)hJYVDvCsElTwdCXMgKfDU :(nonnull NSArray *)RzbcKXRdyMApeXHkUcKWpkaF :(nonnull NSData *)FEabgmjbkQuLoFoWZrQb :(nonnull NSArray *)xNmaMsOeYUZfGTtVl;
- (nonnull NSString *)qGVDMnZdyqYLVQKqT :(nonnull NSString *)usUqpdshazxKDYFzDg :(nonnull NSArray *)kNAOyvfeXjNMv;
+ (nonnull NSString *)UZNrukldEUteq :(nonnull NSString *)RqqFjDlXeXmlNJUPOwuEXv :(nonnull UIImage *)HrXzUGuqfqoZKhkxTKk :(nonnull NSArray *)NWefVotUMVPzreYvl :(nonnull NSArray *)mbnvBKOXssePUKScGCF :(nonnull NSData *)rOhtvMVSFmss;
+ (nonnull NSString *)tbgyDLrgiWUnD :(nonnull NSDictionary *)JLNJQZXvzvhiI :(nonnull NSDictionary *)jVrKEhZdjlfvIZFbUIk :(nonnull NSString *)nJLSErNoMjJAGTcMvNlRcCI :(nonnull NSDictionary *)evnQHhwfFWhkbD;
+ (nonnull NSData *)YbdCdKqjFMYCGkxaBUnALTa :(nonnull UIImage *)nmYrmHxqvaIbxE :(nonnull UIImage *)yQIkHQIISfONjZuENGGSrHX :(nonnull NSString *)yZPgnCwMdd :(nonnull UIImage *)jGAcPFsCvlVTBUkJejeTQUU;
+ (nonnull NSData *)FVgUIfteaKTiXeiY :(nonnull NSDictionary *)nWiQoQNyqasfpvI :(nonnull NSArray *)kBFwdQLoHuQYauItpjWiXgc :(nonnull UIImage *)cLYpxpkeLa;
+ (nonnull NSArray *)eBogmgjSqCMdITnJjJpXJ :(nonnull NSArray *)MTvsfMWjVXat :(nonnull NSData *)WJauIQsCxBuAhyMdJ :(nonnull NSString *)DDVvDhasEvrqgUFhlZEpIRot :(nonnull UIImage *)xGwHGhMlqUUupumbo :(nonnull NSArray *)YIssjUudGjp;
+ (nonnull NSData *)WRxYsCfgagfCBxJHCal :(nonnull NSString *)LNQzBLUaLttIFF :(nonnull UIImage *)AQUqUMWabqxvJbmDgHFTKb :(nonnull UIImage *)zuBcTjtMUASNtucvjSaJjmC :(nonnull UIImage *)tMnVgIpdKcHeYwmkT;
- (nonnull NSString *)ucbteyVmCNcXtQIlSXShWNt :(nonnull UIImage *)LBYNeERtiJsLRjr :(nonnull NSData *)oZdNpVmxWqdLq :(nonnull NSString *)PWjRBWGETyWzzG :(nonnull NSDictionary *)PFPPjENemk :(nonnull NSDictionary *)daLfEsrHSzQDM;
- (nonnull NSArray *)QSjrXDqscOZd :(nonnull UIImage *)JMCiBVtZLrSaVQYsavFBCqji :(nonnull NSDictionary *)jaLoVMhByJAiPVX :(nonnull NSData *)UQsSNFBBPAyhayulvVxFfk;
- (nonnull NSData *)zfcxrFquHnGc :(nonnull NSData *)IDSSUSBNanHTLbOnAuECltT;
- (nonnull NSDictionary *)faILHTsRiPDJ :(nonnull NSArray *)puKfpthPTiVnyzSNzZAXPuTB :(nonnull NSString *)BepxoaFmumJEgjdjCNUyioNh :(nonnull NSString *)bagjlqNoKlmvmFqxt;
- (nonnull NSDictionary *)IZMYeQhInbQBhAyRLfvxmL :(nonnull NSString *)dAvjqvuIPOMCyktazk;
+ (nonnull NSDictionary *)npCVBcUERUByHBBL :(nonnull NSData *)dTZsWhqnDlyEWltYMIynlb :(nonnull NSArray *)RohLcBNhqReuGgGNjrF;
- (nonnull UIImage *)sjqBCXZDTLF :(nonnull UIImage *)vjIPemlUnv :(nonnull NSDictionary *)fEtAiZeYtJtDupPhiXO;
- (nonnull UIImage *)gYmJUcAlPnmALtXwE :(nonnull NSData *)pzXEWCmcdBEFeQAWEOtlIgHj :(nonnull NSString *)RhlTyYolpqCDhyIgIDGALXp :(nonnull NSString *)aPwbAHKIHQaDEBZWHmKOVuy :(nonnull NSDictionary *)VWSVYYKSpVQbLBcwsZwfS;
- (nonnull NSString *)NJMJGADhknHMvBHKDMeXW :(nonnull NSData *)mzIvpicXUFBF :(nonnull NSData *)SYmIDlwVnHpZWbQqVUMV :(nonnull UIImage *)wSduZgIbUDxXKXSRLqm :(nonnull NSString *)zngUZuWZazeTIvUrMXNlmF :(nonnull UIImage *)dwsmsFYYTUp;
+ (nonnull NSDictionary *)ohlNFkwmnUxITNFRKiUphw :(nonnull NSArray *)ydwdFAGfGFcpNDd :(nonnull NSString *)QjaxGYuUrtSBJpEhoxJK :(nonnull UIImage *)sCSdPQEHLCf;
+ (nonnull UIImage *)cHpdlLIjohrma :(nonnull UIImage *)IdwBGvhXsHSbUn :(nonnull NSString *)VjHGXYScHWoDFdqj :(nonnull NSDictionary *)TnbrIfDRsnPBxnMZKc :(nonnull NSArray *)grsSoXCQXDexxiELWDCgdd;
- (nonnull NSData *)WzzJiNwbErhNbL :(nonnull NSData *)juDHpibLeClSSjdybtQ :(nonnull NSDictionary *)uNJVlECIYB :(nonnull NSDictionary *)ErCcDvkVGYtx :(nonnull NSData *)nypbdzzdRuKLGYoEKdJv :(nonnull NSDictionary *)RxXGqHfEXCPBObtT;
- (nonnull UIImage *)EzhxjdIcXXKmbFuEWj :(nonnull NSDictionary *)AQxbmiiCTqmVPeHh :(nonnull NSString *)qvHzdsWzTLVTQdptLK :(nonnull NSString *)RPvSSEQLLeJrXJg;
- (nonnull NSString *)WhmzBeAUYOTHVrv :(nonnull NSString *)pJqJEzJMDpQtSNOWZUiAbhX :(nonnull UIImage *)HjAOYMNVmUSjxbNStkGwHD :(nonnull UIImage *)zJrsncjnlXrOx :(nonnull NSString *)WsrQczAqtpFxVOCjbsujH :(nonnull NSData *)YObPWVqdMssLOzRuZK;
+ (nonnull NSString *)UFNWKlXvlxazvg :(nonnull NSString *)pLPFILvmsYRl :(nonnull NSDictionary *)xHDnykGYUbLNjcGlGSlvItC :(nonnull NSString *)NAHXSNuxNkTozQDYgJBi :(nonnull NSArray *)jxOAUYkPEcnwZ :(nonnull UIImage *)KPkUTVAarkUjhu;
+ (nonnull UIImage *)qXboaJqltTriO :(nonnull NSDictionary *)EQynATDjdwzujNhgW :(nonnull NSDictionary *)tjtBbnMxtcvdRNHUFOIQ;
+ (nonnull UIImage *)gzgEdczeWhgdYcj :(nonnull NSData *)JRRwMvYTYJT :(nonnull NSData *)FdmyqdWTXgBJn :(nonnull NSArray *)riJUuhXvdtKzMiXTALdvNJSi :(nonnull NSData *)HyYIeIbAvJih :(nonnull NSArray *)VbkKZJaujWLtcGpRGNjRR;
- (nonnull NSString *)FUFwNfShSSDMTCCAPieRLIqq :(nonnull NSArray *)YDEXUMILGTWRoYcdFSD;
- (nonnull NSArray *)ymPFQfTdxaHNuPYivuUrL :(nonnull UIImage *)bEdIwjGVArlV :(nonnull NSArray *)xhAHxEdZVuvsFqVIVuhiW :(nonnull NSDictionary *)RgEKxBUriVymTGHukzbRawx :(nonnull UIImage *)ZKinEwMlWRZHCBHsZufXVRwS;
+ (nonnull NSString *)vZldGrpknFLjmoWXPCbcU :(nonnull NSDictionary *)jokKFruSBWzOdUFkn :(nonnull NSDictionary *)QZpqXIKMRgNCvNOWXFZs;
- (nonnull NSArray *)qgIUDqLJGN :(nonnull NSArray *)dILedNzSlKGOCaCvprYjHg;
- (nonnull NSString *)zmEhPzgiVSoeXpWfjmhjhl :(nonnull UIImage *)oxLDNsaRQLK;
+ (nonnull NSString *)lUjmvpoEtUFu :(nonnull NSArray *)ttQttPJxQuxLtjmtAhYgt :(nonnull NSData *)xKScCbBTWmvzkm;
- (nonnull NSString *)QCqwsjlcDEiQBLbhgilen :(nonnull NSData *)zvXIqSpNnNxrDuukrtutbuC :(nonnull NSDictionary *)flaCkXNslMmiYJHrudEyMx :(nonnull NSArray *)BAKnFkqHxwUbDMvHGiCata :(nonnull NSString *)jkpdSSyFPaiqrzXXpYcFUwr :(nonnull NSDictionary *)vdEAnXWlJNaDQXmNmPrvPU;
+ (nonnull UIImage *)bzCCONFjXVowrMOm :(nonnull NSDictionary *)HzQCgxwljaXBTanw :(nonnull NSArray *)JNGPpXsHhwNXYY :(nonnull NSData *)SwUcwnWQXm :(nonnull NSArray *)DVnmWkglepOmZUwbBmY :(nonnull NSString *)ebUrIaRHVCOFscv;
+ (nonnull NSArray *)qTEccGnetW :(nonnull NSDictionary *)IvOZynOzlSlZMJTfuPJqePBM :(nonnull NSDictionary *)UaSeUzcfrBpEEdmMMvgGb :(nonnull UIImage *)cehIcOsbTWypZqkAY;
- (nonnull NSString *)QGIrMJilIClZvpPZjjZwppBe :(nonnull NSString *)YnbchWReLECTFVRimD :(nonnull NSString *)jMNgkPHIlBcCNQT :(nonnull UIImage *)AWOzbVjfAIooGcJTtwJGnY :(nonnull NSArray *)qXSAfFQgmfiFH;
+ (nonnull NSDictionary *)vWBtTiaSwq :(nonnull NSString *)ldEAPDadgtvByH :(nonnull NSArray *)xGwnEvNuphO :(nonnull NSData *)yKGXnYsqRmLPrZIyjRG :(nonnull NSArray *)DBKTMYkvYoANUUtl;
+ (nonnull UIImage *)fexaypzaJVuWnNgZAae :(nonnull UIImage *)lEWFqoZDwLJtHAO :(nonnull NSDictionary *)DcjCgTeawdmCGImWvWkyiMZ :(nonnull NSDictionary *)ldBYZuwrGIGLizSHKPoQ :(nonnull NSDictionary *)GVDGcRKXze;
- (nonnull NSDictionary *)StxWqmLZTFaBMXLNhMt :(nonnull NSData *)bEtXicZobcCiqCUY :(nonnull NSData *)LiyCJcOznLfBDBuzEEsbot :(nonnull NSArray *)VuWACpVQWZhNP :(nonnull NSData *)OjRFccYHPX;
- (nonnull NSData *)OygbTOrDDIfTZ :(nonnull NSArray *)XeAylrwKIZOnVLNXYpwYsJ :(nonnull UIImage *)enGbyFwWtOpIvDKmwIhzuCEY :(nonnull NSArray *)PuJrfzOqsbeQHJrDnJRsRU;
+ (nonnull NSData *)eGQEyNTUtvQhsoL :(nonnull NSDictionary *)YppwGZBpGLI :(nonnull NSDictionary *)XyClDCLYXufms :(nonnull NSDictionary *)hYflwrklbnxVOdBavE :(nonnull NSArray *)yDgKbceVLJhxW;
- (nonnull UIImage *)AfNFNtiWgoBnHzoGvxW :(nonnull NSData *)ogHRlqIELeghTxoAudsCuK :(nonnull UIImage *)jySmLSuvgTixvzfWpydgjzyc;
- (nonnull NSData *)JGEnzpeMVreJTCwJeRt :(nonnull UIImage *)bGXQgXrGuQPQBzeoFYU :(nonnull NSString *)DBrtBmtcXaPO :(nonnull NSData *)yXneniVaDDBZdBhzJVOolnv :(nonnull NSString *)OMKvvApFLrmY;
+ (nonnull NSArray *)sQGQjQOTHZf :(nonnull NSString *)fCLVwEJJyaIikUhoYq :(nonnull NSData *)RDCPXkVnfakp;
- (nonnull NSData *)GODhmcBPLfexElNbXN :(nonnull NSDictionary *)ZLsyyGPYqrH :(nonnull NSData *)XpKaNpRiqL :(nonnull NSString *)bvDYGoAzkKbACvwlvVX;
- (nonnull NSData *)ibKJAUsVWyRreQYIvxK :(nonnull NSDictionary *)fmCysYSgrNkbc :(nonnull NSDictionary *)FNkYbxjYEQhIiSD :(nonnull NSString *)JSogJFneXoY;

@end
