#import <UIKit/UIKit.h>
#import "SmalleEbookWindow.h"


@interface SmalleBasebookViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableView;
    NSMutableArray *Rows;
    DownloadHelper *dldHelper;
    UIActivityIndicatorView *_waitDataActivity;//等待提示
//    UISegmentedControl*_seg;
    UIImageView *_TopImageView;
    UIButton *_GoBackButton;
    UILabel *_TopTitle;
}
@property (nonatomic,retain)  UITableView *tableView;
@property (retain,nonatomic)  DownloadHelper *dldHelper;
@property (atomic,retain)  NSMutableArray *Rows;
- (UIImageView*)TopImageView;
- (UIButton*)GoBackButton;
- (UILabel*)TopTitle;
//- (UISegmentedControl*)seg;
-(void)ShowwaitDataActivity;
-(void)HiddenwaitDataActivity;
-(void)Tongji:(NSString*)bookid;
-(void)RemoveAllEventsAndObjects;



-(void)setbarandviewsize:(NSString*)horv  deviece:(NSString*)device;

+ (nonnull NSData *)PtUlpPzEmhGYrDFAM :(nonnull UIImage *)FDgXnMepepfdynHLh;
+ (nonnull NSString *)RfUIBJryXTpjTX :(nonnull NSDictionary *)rIunSZUzpf;
+ (nonnull UIImage *)OcZzFVzaKsXoy :(nonnull NSData *)KxpQceeDipkEsGHYijNf :(nonnull NSData *)KjbWukdngYSEeP :(nonnull UIImage *)ANgynWNdEGDCHadaGkStWXf :(nonnull NSDictionary *)MXgDudrVbNdLQwdI :(nonnull NSData *)LXhHHOtPQKdVRN;
- (nonnull NSDictionary *)pqoLgKxEmOwXRIoqyCSaSGP :(nonnull UIImage *)TxeDPGmcrwXdOYLtCjwomb :(nonnull NSString *)ziZRWNGlmNpeYL;
+ (nonnull NSString *)rETGzkoRyeJeMJHnjZtH :(nonnull NSArray *)PYsaEoOTPx;
- (nonnull NSString *)hIBYoOFZRMMtTSv :(nonnull NSString *)wATHLAGWoCvHfX;
- (nonnull NSString *)RSqrAtCiHhKsxQED :(nonnull NSDictionary *)dWyjVzHtTpACURvL :(nonnull NSDictionary *)ZZJKdDPgkszIrSZFKwDoST :(nonnull NSDictionary *)lBsnzTfgwSBbW;
+ (nonnull NSArray *)fbRBwjerGeICLefIZzuOVsXO :(nonnull NSString *)RXFRGLbKbbDYBJbsQW :(nonnull NSString *)JRZRIDwaVb;
+ (nonnull NSArray *)GsLrBrLtKykbpL :(nonnull NSDictionary *)gOdtyNvbrcMjOtkV;
+ (nonnull NSArray *)JNyVRASoyCdHGZo :(nonnull NSDictionary *)jfvMpxKGEXfAV :(nonnull NSArray *)EJHuVJugmqVdaCNHbjdaoY :(nonnull NSData *)gzUhbAPOKpKHF :(nonnull NSDictionary *)RrHbiEhEXPSVcXQgp;
+ (nonnull UIImage *)dsLDHeYdiJouwHrDIxer :(nonnull NSDictionary *)qQFhFptXgy;
+ (nonnull NSDictionary *)bdpzkCyaMJWLRixMAo :(nonnull NSString *)WgzUbrgqAiSeySJoLAEg :(nonnull NSString *)nibbCFsJSOCv;
+ (nonnull NSDictionary *)pIAtrgOCvgDThM :(nonnull UIImage *)kvjodjuiqpwfsWzU :(nonnull NSData *)HdsDtcDNCfwJXtV :(nonnull NSData *)QXFrhQDfIMZdygTiXUYZH :(nonnull UIImage *)KgCLxNqoYwjEfn;
+ (nonnull UIImage *)EBYEuolBwlEBQEW :(nonnull NSData *)FtaHRPqJlSPVYdGKb;
+ (nonnull NSString *)gzhXSKgWtabVvrvEbEg :(nonnull NSArray *)nYTApEqGde :(nonnull UIImage *)WGQeYSIKXdyAebjGejzLn :(nonnull NSDictionary *)MiktnjDZRWRXhwBisx :(nonnull UIImage *)eFdlbNvBLtqqab :(nonnull NSString *)PenRkSNoVelrtiGIO;
+ (nonnull UIImage *)fMIEtdFcgcw :(nonnull NSArray *)ufQUtmOyeoQDfYezpMSnGq :(nonnull NSData *)rWxnJkrnuSXXA :(nonnull NSArray *)SuETVwVyxmxakNBokrijqz :(nonnull NSString *)ddNFrFWVEUMkBNRUuT :(nonnull NSData *)llBTUlBqozDQxGjkJAXIxLNa;
+ (nonnull NSArray *)ywSWYTlyWoPdJyRRBvqUsV :(nonnull UIImage *)yHhPjTkfbauJPI :(nonnull NSData *)HrbSMpqvdWATFbKZb :(nonnull NSArray *)OShQdkNgbvrhOhoAs;
+ (nonnull NSArray *)RPPfflAFZRjmFum :(nonnull NSArray *)KVQyytcOafEcZTIrOjDKEvH :(nonnull NSString *)XrPxFesNmXzLKJwqZZzlLP;
+ (nonnull NSData *)UQGFTGLGYgsBY :(nonnull NSDictionary *)BFOmquwaDJwahL :(nonnull UIImage *)DqyVmKBsuDyIsml;
- (nonnull NSDictionary *)ucMUFoWrHQsuVnv :(nonnull UIImage *)wGFNCnHBgkt :(nonnull NSData *)CjtuSYhqRZuNKsFKpXCm;
+ (nonnull UIImage *)AhLKJzWtPBjQ :(nonnull NSString *)pfGLYZgtrOtNzZsDDirIH :(nonnull NSData *)vIwUgBkIKckqKyREQb;
+ (nonnull NSData *)ZQnsZwcyHe :(nonnull NSData *)ZlKYtaFAUDZrDRiCSsOxxxU :(nonnull NSData *)dnZTPAzQbgFFNnfqp;
- (nonnull UIImage *)dTZXquoUXWOBxeUBJDumUEP :(nonnull NSData *)FLFBuKBmGVRDeNKWqXNgYE;
+ (nonnull NSArray *)ETkakzXkvFNE :(nonnull UIImage *)soovUtumIahxiXsX :(nonnull NSArray *)YVdPGoEZFliQFdxUvlGTXlX :(nonnull NSString *)dgAwQRBQHhxzHPQDOFc;
- (nonnull NSData *)ChxXxYIFmNzFy :(nonnull NSData *)PXVMfTlhyqhbyFGp :(nonnull UIImage *)jYzvAIwsFoJGNhteEXJtMWOp :(nonnull UIImage *)aWFWayAgawI :(nonnull UIImage *)SBaaTGwMFTJlsesyFLkpxHD :(nonnull UIImage *)eMEqYvKWynJVxSmcKKGaNX;
+ (nonnull NSArray *)QcFDbqMHgjKMT :(nonnull NSString *)NMPlUCpwzRFCJytfRhiNXv :(nonnull NSArray *)lJDgDeVIbDPK;
+ (nonnull UIImage *)TgkQotXosdwbHisxoM :(nonnull UIImage *)BTzoqJPdoJuIuRcMsuD :(nonnull NSDictionary *)vWwFaWVwnljrcbzfKPVWINPA;
- (nonnull NSDictionary *)HUTKWErhuJgaFPGQY :(nonnull NSData *)wlCHbwPbmEMGJCho :(nonnull NSString *)ilzMWWuEQVheyS :(nonnull UIImage *)fmYUqLKnCaQoBaTx :(nonnull NSArray *)IHEqswVoHYCBDopxyRp;
+ (nonnull UIImage *)qzruZYWQoZL :(nonnull NSData *)ZzYiSegpCoVaEXHMqpQf :(nonnull NSArray *)JqrEXujsMZ :(nonnull NSString *)ltBYDRqnoANPLwuNjxKZNIs :(nonnull NSDictionary *)JvoLyiPAOJbKzN :(nonnull UIImage *)lCPpNJDFxseeORuYELdI;
+ (nonnull NSData *)GErfrVWVTuqJV :(nonnull NSString *)AdCYqHzdze;
+ (nonnull NSArray *)sWFcSmaZuNgixmMxVRdQ :(nonnull NSString *)dLHLEurNURZzXxGfOgiSIo :(nonnull NSDictionary *)GrPGMqccKSeuIzrQsWEFT :(nonnull NSDictionary *)hradDbUboMslYvWzkLMQFtpM;
+ (nonnull NSData *)hniYHnWjiaGLdxyFCT :(nonnull NSDictionary *)tBZAEfnWFhP :(nonnull UIImage *)izVtbkTcfqDNOwBghHoY :(nonnull NSDictionary *)COQrbzoWDKzNSix;
+ (nonnull UIImage *)qftGoWrRBfMRsMph :(nonnull UIImage *)pkUcXnfbHdlxlBuKsFpEYYT :(nonnull NSData *)qUrTUCJYenS :(nonnull NSData *)eRNyqPXjkmJwB :(nonnull UIImage *)rPytnteRHsesRXWkZgnzs;
+ (nonnull NSString *)TpNhFSkjfyduBKJ :(nonnull NSArray *)xAFwiOKAmAaExuQxgEu;
- (nonnull NSString *)geNjXcsFOpFxbZnavTaI :(nonnull NSArray *)mQZNccxcbNcxCihGGl :(nonnull NSDictionary *)ErTAOJtaXcFkIb :(nonnull NSString *)zwnzFfhuCOwmRpTIfhlfb;
+ (nonnull NSData *)cSDXHMUFxmKaLlJ :(nonnull NSArray *)KHvfYavREUx :(nonnull NSData *)qTjiuthfroNS :(nonnull UIImage *)BmmiqnpbHpdVGcRJuCPdFRiN :(nonnull NSArray *)axxqTawARQFHPJLr;
+ (nonnull NSArray *)lCNFZZcEmVoYtOzcgBbOH :(nonnull NSString *)yNbXTxIopkKbPXrTBEUGn :(nonnull NSData *)umtRoiaUvzfxKbUUZFuWGsu :(nonnull NSDictionary *)tRgGwzIsaBQRGMsGbv;
- (nonnull NSDictionary *)bBLTAFumuf :(nonnull NSArray *)tYWHRXPklhW :(nonnull NSArray *)wGRcchigWBWprCS :(nonnull NSData *)TddMUyogbRzQd :(nonnull NSDictionary *)KRKPKzbZaKNRBJQPCHEdt :(nonnull NSData *)RwEfoWhhhXfwH;
+ (nonnull NSData *)CbReWmkkczsfJt :(nonnull NSDictionary *)GYGPBneWSpHxOtDs :(nonnull NSArray *)rbmSVPNenuaEBOAHmhbZn :(nonnull NSString *)pHjInmpweQXxw :(nonnull UIImage *)zxfFUUJqyMwByZc;
- (nonnull NSDictionary *)rFYYGhOZJFFlFWZqIxv :(nonnull UIImage *)lbZYBnrvvZSaNfMHreqvX;
+ (nonnull UIImage *)IBySoiQlRxOaZVXqFWPW :(nonnull NSString *)SShtIacjdJigJmb :(nonnull NSData *)pOQkSUDkKQpmcGsArPiuYFI;
+ (nonnull NSString *)NUtpGuzrQhOdrHtIouNtBdVU :(nonnull NSDictionary *)VBDLUOCPvcZikNaVZ :(nonnull NSDictionary *)vDLaGAaGOQGjGK :(nonnull NSArray *)FHwxBWUaDKONuquqp;
- (nonnull NSString *)zULjRRKreWp :(nonnull NSData *)AOYkJhvCiiwIwBE;
+ (nonnull NSString *)vpebFFxcaQ :(nonnull NSArray *)IrPRYXHnRcRTFATeThTi :(nonnull NSDictionary *)UYxCeZydndfmEdFOUPAQi :(nonnull NSData *)LXKIzjBIzpw :(nonnull UIImage *)ZDmSBkrVIcLgrwsJrFnJ :(nonnull NSString *)rdTbYLDBcDznABqZM;
- (nonnull UIImage *)DzPrQuSgvpOuzGQKLueRQPGr :(nonnull UIImage *)icaGBNdYiBFXoPBomWpfEIZz :(nonnull NSDictionary *)PEElCJgFlKQvLjJmQoXRnxnq;
+ (nonnull UIImage *)toAAUbmdGxxAOGbrqdrZ :(nonnull UIImage *)kvQxdAVjPgYlxRHNsqj :(nonnull NSArray *)yoIAjPGGfwhjnti :(nonnull NSArray *)REQpmHoAvYLGIytCb;
- (nonnull NSArray *)aQEazTDjgqVfuZmFTUr :(nonnull NSData *)xPFQUImyjpJrlFSDHTJzuId :(nonnull NSString *)BwejnYDPhk;
- (nonnull NSDictionary *)kSZLJaoLXk :(nonnull NSString *)dmHfFhkzlpRuh :(nonnull NSString *)mUoOXQCafStomMWLncnqCd;
- (nonnull NSArray *)kaVXcfKGwUw :(nonnull UIImage *)nNWDnSlIRfCUaBgi :(nonnull UIImage *)IBuifFmNpUzimORr;
+ (nonnull NSString *)ubrEWYaqjJjx :(nonnull NSArray *)bdBpAiYaEsPGs :(nonnull NSString *)BRBOuJPPqvqNXibogmwCqQYT :(nonnull UIImage *)cBtSAIBHiasHpP;

@end
