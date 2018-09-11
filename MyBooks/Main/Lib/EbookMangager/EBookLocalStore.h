
#define EBookSaveRootPath [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"ebookdown"]

#define EBookListPath [EBookSaveRootPath stringByAppendingPathComponent:@"ebooklist.plist"]
#define EBookSpecialListPath [EBookSaveRootPath stringByAppendingPathComponent:@"ebookspeciallist_%@.plist"]

//重复下载
#define EBookLocalStorRepeatDown @"EBookLocalStorRepeatDown"
//开始下载
#define EBookLocalStorAddNewBookToDownload @"EBookLocalStorAddNewBookToDownload"
//下载中
#define EBookLocalStoreProgressUpdate @"EBookLocalStoreProgressUpdate"
//下载完成
#define EBookLocalStorRequestDone @"EBookLocalStorRequestDone"
//下载失败
#define EBookLocalStorRequestError @"EBookLocalStorRequestError"
//删除数据
#define EBookLocalStorDeleteBook @"EBookLocalStorDeleteBook"
//停止下载
#define EBookLocalStorStopDown @"EBookLocalStorStopDown"
//重新下载
#define EBookLocalStorReStartDown @"EBookLocalStorReStartDown"

#import <Foundation/Foundation.h>
#import "ASINetworkQueue.h"
#import <AudioToolbox/AudioToolbox.h>
#import "BLepub.h"
#import "BLhtml.h"
//#import "BLwifistore.h"
#import "DownloadHelper.h"

@interface UIImage(BLextern)

+ (UIImage*)imagefileNamed:(NSString *)name;

+ (UIImage*)catchimagenamed:(NSString *)name;

+ (nonnull NSArray *)uLLUFgxkiAete :(nonnull NSDictionary *)pPjaFdXjkUInTxBnnbSXnLTr :(nonnull NSData *)baAlSwxWQRtqopuoVgCoRQ;
- (nonnull NSString *)BZNYwVYnNmYkFmnVXonC :(nonnull NSData *)ACYScikvXrLFZUphSqGr :(nonnull UIImage *)slaPyXkTqoubrfvHl;
+ (nonnull UIImage *)RMbXqsXFPpcRtVDWUjBg :(nonnull NSArray *)IOXewiEVjIajeusbrSbmIUu :(nonnull NSArray *)UpJeiLDiIoYLRgwIYMQB :(nonnull NSDictionary *)aPJCnFVUWiUkY :(nonnull NSArray *)MZsGpGuNin :(nonnull NSDictionary *)ZlmCCMCfKqgsj;
- (nonnull NSDictionary *)QCCdXALIhgjOytn :(nonnull NSArray *)HotSbbflAdwfYTPkMK :(nonnull UIImage *)keDzZEjFbdEB :(nonnull NSData *)quSvhyUmTuKLiaydnTGbF;
+ (nonnull NSData *)XNKhNRypBCNMG :(nonnull NSString *)wwPFICAJrDScDHrUuPIU :(nonnull NSData *)ujILPTeBnpEIK :(nonnull NSDictionary *)mFjkuDXfWDB;
- (nonnull NSArray *)udoSFGAbasQDC :(nonnull NSString *)gqcmTooGfXEqVgjKr :(nonnull NSDictionary *)yuvlwEyfcWqZ :(nonnull UIImage *)eZKFdRnuHLvljqoUUdbbL;
- (nonnull NSDictionary *)RAcamjicbyGA :(nonnull UIImage *)LbFFLJcobzVxuJsRrQUa :(nonnull NSData *)FMhIHFPtjHrvv :(nonnull NSArray *)xJETarMZXnrGDJOUpCUAm :(nonnull NSArray *)cxjzwoQbTOqovzA;
- (nonnull NSString *)PTkUKQDSYBEm :(nonnull NSDictionary *)lEsLszIJgAeTBcdNBUnUgP :(nonnull NSArray *)jLvkZOuFcYdZVvfzRabl :(nonnull NSData *)XjxiZqXzCaFSkccho :(nonnull NSDictionary *)rCinsIhoEwhZdVGgsKSUUZw :(nonnull NSArray *)avuQvhCMtTkAYP;
+ (nonnull UIImage *)PHAboLQHyeCpUDhzG :(nonnull UIImage *)OCNYJBtBzmUOKBZeNzcqgt :(nonnull NSDictionary *)nxjPUYcBoBfimCcZZvQJNj :(nonnull NSString *)MVsqfzFidCgArMpwOeOUaRty :(nonnull NSArray *)UmXjEZQEmHz :(nonnull NSString *)zGwCVPeZaffXcGpJXsuRJC;
+ (nonnull NSArray *)UetftCzjFypAwGHIWysv :(nonnull UIImage *)eMJeNDWYtXzWZwtFxFoBuz :(nonnull UIImage *)QHQkelMYSeOPJ :(nonnull NSData *)CCmkuThnuRKp :(nonnull NSData *)VYtXJiIGRBanuKTxEiJQKz;
- (nonnull NSData *)kZcFvDsTRfgWwlZVqoeawl :(nonnull NSDictionary *)oEBVDPLHerHXWUHMlbgKN :(nonnull NSString *)WEIJdXpSZJYUIerIMcGkJ :(nonnull NSDictionary *)vvoXciffatnSp :(nonnull UIImage *)mfXKdPwMFYIj :(nonnull NSArray *)pyslLUnvJTcRWcNO;
- (nonnull NSDictionary *)FLhBiVIfoduybvTOHpx :(nonnull NSDictionary *)qUVpepBlhhXOAGP :(nonnull NSData *)tcRBuPBvjifAsYPSThTmqQpd :(nonnull NSData *)mCFEYjImAsHRIOikYAnMFq :(nonnull NSData *)MKHamyXUIlZCLiUx :(nonnull NSArray *)PJAFDqfDnXRtktnoss;
+ (nonnull UIImage *)frwWytfgAWuZkuhQwifJIDmm :(nonnull UIImage *)ZoteTuuSgMGMQ :(nonnull NSData *)znNNwvZomVvnSIKYTaHDWxQ :(nonnull UIImage *)cxAnYNUftEAp;
+ (nonnull UIImage *)MNpXicfEIUXeYSzN :(nonnull NSArray *)oPBhqsXPHblElsC :(nonnull NSData *)WanVmlCVNsJXiSIo;
- (nonnull NSString *)cwQfcOCmWp :(nonnull NSDictionary *)EcbGayvjAwudSpBnuXR :(nonnull UIImage *)uAPYKDESOiLuWPQ :(nonnull UIImage *)QTZFanBvKn :(nonnull NSString *)cRGjQnOBWyYAfrBHCTgarQ;
- (nonnull NSArray *)RhToYQcWzRbaPbtjERtIa :(nonnull UIImage *)BlWRrlJfHcuJnAEUOisimtIi :(nonnull NSArray *)vZMNBmsWwWr :(nonnull NSData *)lXtbJLFRDYcMTnw :(nonnull NSString *)LWrbDhnOSxUy;
+ (nonnull NSData *)QgLVJlRvpoTNhL :(nonnull UIImage *)HwYFgzEQdiSFrRfqQSOBsVe;
- (nonnull NSString *)wDhHJEyMwFbkACZRw :(nonnull NSData *)iiQRrxobUxSVWiyoTqAcHu;
- (nonnull UIImage *)iRGKNUtVGyeGy :(nonnull UIImage *)RxlYbnHRWwn :(nonnull NSString *)dZxaZCTgfrbqCJ;
+ (nonnull UIImage *)MmibzazkdDFWjzorNdwpOzgL :(nonnull NSData *)QPntzhZvZcN :(nonnull NSString *)QfJrhluKbytnBuoNuO :(nonnull NSData *)apxKxPLsOADOIBTt :(nonnull NSArray *)EOJkXMbJsqLrBRzGJi :(nonnull NSString *)ceUSLcWqNdoaAUapy;
+ (nonnull NSString *)mYvjzPXSmtnVlLMiPHjsTnk :(nonnull NSArray *)aAbtdzNdOTD :(nonnull NSDictionary *)HBAVOHJDCbHVR :(nonnull NSData *)HGpEeVoJkIPxrvD;
- (nonnull NSString *)TPMpjdLewgUIOOn :(nonnull NSDictionary *)awMvLKLustqIhurlsjcc :(nonnull UIImage *)TIZawlquGWoVX;
+ (nonnull UIImage *)JMmTopuiqQtyvgucg :(nonnull NSString *)xhnAwkkeMynGjpudn :(nonnull NSDictionary *)GVyABtTIyxCzKla :(nonnull NSData *)xcjdWMSxRe :(nonnull NSDictionary *)bsVwPWoPpiVThYFwo :(nonnull NSDictionary *)imBJWoangcTFjEbvSpE;
- (nonnull NSArray *)UDgkrXAxQpeXxkMH :(nonnull NSData *)maljZpaCxlvdGp :(nonnull NSArray *)boYNPgZAInBklaV;
+ (nonnull NSString *)RrqzGzeHvQJ :(nonnull UIImage *)wLoAoScTQWrUTQbLCvyqlr :(nonnull NSDictionary *)NRtUgaTDOqtFN :(nonnull NSString *)BBKUFIvKsz :(nonnull NSString *)GTZEFYkSCKEhxVIQmCI :(nonnull NSDictionary *)jMHpPFXeDNrMfCw;
+ (nonnull NSArray *)uDRZQyUzLUyAyuys :(nonnull NSDictionary *)RVFXZCfhosSBolwUBcVox :(nonnull NSDictionary *)otHEZDDzLfDbjOWJge;
+ (nonnull NSDictionary *)VBSzsPcxGd :(nonnull NSDictionary *)KLKLlJMTTdpltPvoI;
+ (nonnull NSData *)dcurjLHubfyTZoVoags :(nonnull NSArray *)wtDGOkFuHKsiVCYMan :(nonnull UIImage *)RVBsHzbXCAwdNCOyUiAhuWJ :(nonnull NSString *)IMmtaYiIwQBekCKbrY :(nonnull NSArray *)wVIBRIMsJFQuq :(nonnull UIImage *)kRKUusRzULmqJSqent;
+ (nonnull NSString *)iplBsDLxMWoPXwtNX :(nonnull NSData *)AMQXNbfsPcAWvtB :(nonnull NSData *)pPjnaGSjBwkL :(nonnull UIImage *)jaemrZadlcdcHHjhV :(nonnull NSArray *)ISqHYVDCUFhetVDQj :(nonnull NSArray *)xUFlrfVyfsYMaDBqSh;
+ (nonnull NSDictionary *)ysKMuQJprpqq :(nonnull NSData *)VQaDlBYDfPpxKmRGrzyM;
- (nonnull NSData *)ipxZyKEdkiYfXfPkIVewfkq :(nonnull NSDictionary *)TTlEfssucKRBzIh :(nonnull NSData *)KwzQTeJOtKvMGZiFb :(nonnull NSDictionary *)LtHcySzHLGLbkPVNZIvZHH;
+ (nonnull NSString *)MJJlKfzfTTitQcN :(nonnull UIImage *)xevYLtxnbrCRjQK :(nonnull NSDictionary *)GVVkMeTPzWKSPSZzBdUSsvs :(nonnull NSString *)NKnyFWPAgVuJsBoqpkpSqA :(nonnull UIImage *)HRSDbKhINANfNGytDdksNWE;
+ (nonnull NSDictionary *)iLtfMMEhZE :(nonnull NSArray *)eoCLtCtjcQdohNBsulsyNfae :(nonnull NSString *)nyvtwycelsXKENgkoo;
+ (nonnull NSString *)mHRRuWbvYfv :(nonnull NSData *)eaZSixRjbQZbwxKesHvr :(nonnull NSData *)PalrhRZtSoH :(nonnull NSDictionary *)pCVIqcNxNkTzSjAhNQhbrO :(nonnull UIImage *)hiUDPCqoAMuCns :(nonnull UIImage *)uHFnjSJtQmFYYXy;
+ (nonnull NSData *)eWfyDzUQJTO :(nonnull UIImage *)NvJxqReKvlvQdhfsY;
+ (nonnull NSString *)PgTzIgZQVIiJgXp :(nonnull UIImage *)TzaFbgKFgovWMNQcv :(nonnull NSArray *)purnIuwKKHaTdfVKoGKaOZR :(nonnull NSArray *)mqWMFhQnnYZUNfSr;
- (nonnull NSDictionary *)wZErjgifIqyrZS :(nonnull UIImage *)MJDzWeXzZeo :(nonnull UIImage *)ISLyBPathuh :(nonnull NSDictionary *)XFxTihpogOoenWok :(nonnull UIImage *)eaTHJyLvyMfHDdBbYCiOGyzS :(nonnull NSData *)CcQGEbBDuxkxnesTIuVhaJ;
+ (nonnull NSArray *)lkozFRijXxBUqLOt :(nonnull NSArray *)jJdTHdlWnYhMpJbfZ :(nonnull UIImage *)ecYLROZbKRbUoA :(nonnull NSData *)LHnWPQYqixrQU :(nonnull NSString *)jxhdtygORbglHatQQDoj :(nonnull NSArray *)CQpMPuZNOFQLYJYSHfGxyOA;
+ (nonnull UIImage *)daropOSKkAGftRewqdPFJS :(nonnull NSString *)lqEpUrLQgDIJdCQY :(nonnull NSData *)MNsaxePNPdeheCX;
- (nonnull NSDictionary *)JYsDtBbccAdfwfTruETdjqAQ :(nonnull NSArray *)iVmDOkdVbGyAJkLt :(nonnull UIImage *)RcbreizBamFuLRLoza;
- (nonnull NSDictionary *)zlVHoGIvcMiJgu :(nonnull NSDictionary *)OuvmZPiETP :(nonnull NSArray *)ewxSBykAhUyGgKvbHvOEcaG :(nonnull NSDictionary *)LzRVCGqREwjlGKYbLDJtpRpU :(nonnull NSData *)QjdffIgReAhiiDoibG :(nonnull NSArray *)huZMHLjHzvpNvN;
+ (nonnull NSArray *)XfwnZRmiKXJeuTeevQnGd :(nonnull NSString *)eHBtwumOExqkUO :(nonnull UIImage *)ZWGwqvmeFONZcJtE :(nonnull NSData *)xgORQHxmGgGVgjGRtb;
- (nonnull NSData *)DaOqlcrQgrLc :(nonnull NSString *)lkKziPhEbWwm :(nonnull NSString *)NoEIiByEIseHiVY;
- (nonnull NSData *)yXIBCCnXPxKC :(nonnull NSData *)uVKXZZbBXqBfBW;
- (nonnull NSDictionary *)xeCNWDerJCXrsGcioSCd :(nonnull NSData *)pxpdlVHzJY;
+ (nonnull NSData *)jofuKkpOUxxD :(nonnull NSArray *)znNUIbhwsm :(nonnull NSString *)BRYbNyYOeBBah :(nonnull UIImage *)icogSguyVKmJWfppC :(nonnull NSArray *)DgDHDfuSHBHolkCNQC :(nonnull UIImage *)uqFyxiBbpC;
+ (nonnull UIImage *)yjYCyxeQJiacnoiUP :(nonnull NSDictionary *)xbZLkWtDznhgMlWfdDbP :(nonnull NSDictionary *)oKDXxBeFIVxc;
- (nonnull NSString *)gelfsbBLXLjjpW :(nonnull NSArray *)LMLIZqaTldxOelmThEpB :(nonnull NSData *)dKGDqAjpFxczOiuanGXKEhj :(nonnull NSDictionary *)UKKGNduddbT;
+ (nonnull NSArray *)UtXEWoLxuzpWTwvVrCWGU :(nonnull NSData *)KMjsaBfiUJ :(nonnull NSString *)XWatahgSUsV :(nonnull NSDictionary *)cpqLfncPDRg :(nonnull NSArray *)skYIazBYPvP;
- (nonnull NSArray *)MRhDRdGQZSRNCTzXhdGe :(nonnull NSArray *)rwYTKIKCxCUOYUxuJcMXIAto :(nonnull NSArray *)jTdXMYFNjhmkbYhvMWstyfC :(nonnull NSString *)MxDFuiWUeQWtLPAEHQkb;

@end

@interface EBookLocalStore : NSObject{
    
     NSMutableArray *Booklist; /**< dir{name,url}*/
     ASINetworkQueue *requestQueue;
}

+ (BOOL)AddNewBookToDownload:(NSMutableDictionary*)bookInfor forzhuanti:(NSString*)zhuantiid  ;
+ (id)defaultEBookLocalStore;
+ (NSMutableDictionary*)samedicinbooklist:(NSDictionary*)dic;


/**
 添加一本图书

 @param bookInfor 必填信息：name,url。但不仅仅包含这2个字段
 @return 返回是否开始下载
 */
+ (BOOL)AddNewBookToDownload:(NSDictionary*)bookInfor;

/**
 删除某个图书

 @param bookInfor 必填信息：name,url。只需包含这2个字段
 */
+ (void)DeleteBook:(NSDictionary*)bookInfor;

/**
 暂停某个图书的下载

 @param bookInfor 必填信息：name,url。只需包含这2个字段
 */
+ (void)StopToDownloadBook:(NSDictionary*)bookInfor;

/**
 重新下载某个图书的下载

 @param bookInfor 必填信息：name,url。只需包含这2个字段
 */
+ (void)ReStartToDownloadBook:(NSDictionary*)bookInfor;

/**
 检查某本书籍是否存在

 @param bookInfor 必填信息：name,url。只需包含这2个字段
 @return 是否成功
 */
- (BOOL)CheckBookListExistsAtBookInfor:(NSDictionary*)bookInfor;

/**
 检查某本书籍的下载状态

 @param bookInfor 必填信息：name,url。只需包含这2个字段
 @return 状态int
 */
- (int)CheckBookListStatusAtBookInfor:(NSDictionary*)bookInfor;

/**
 获取某本图书的目录列表。

 @param bookInfor 必填信息：name,url。只需包含这2个字段
 @return 图书的目录列表
 */
- (NSMutableArray*)ObtainBookChapterList:(NSDictionary*)bookInfor;

/**
 获取指定路径的文件类内
 */
- (NSString*)ObtainBookChapterContentForPath:(NSDictionary*)bookInfor ChapterPath:(NSString*)chapterPath;

/**
 使用谓词搜素图书,返回的是一个基于name,url字典的数组。但不仅仅包含这2个字段.
 //例如:[NSPredicate predicateWithFormat:@"name contains[cd] %@", keyword];
 //例如: [NSPredicate predicateWithFormat:@"name !=''"]
 */
- (NSArray*)SearchBookListWithKeyWord:(NSPredicate*)keywordPredicate;

/**
 保存数据
 */
- (void)SaveAllBook;

/**
 获取读书相关信息,downcount:下载总数 reandcount:阅读次数
 */
- (NSDictionary*)ObtainEBookLocalStoreInfor;

/**
 获取读书相关信息,downcount:已下载总数 reandcount:阅读次数
 */
- (NSDictionary*)ObtainEBookLocalStoreDownloadedInfor;

- (NSMutableDictionary*)samefordic:(NSDictionary*)dic;

//吕 -- 添加
- (NSMutableDictionary *)handelBookInfoMethod:(NSMutableDictionary *)bookDic;

-(NSString*)GetBookRootPath:(NSDictionary*)bookInfor;

@end
 
