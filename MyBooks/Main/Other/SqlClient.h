//
//  SqlClient.h
//  HappyGO
//
//  Created by xiaogong on 10-1-26.
//  Copyright 2010 XunjieMobile . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface SqlClient : NSObject 
{
	sqlite3 *database;	
	BOOL isopendatabase;
}
+ (SqlClient *)sharedPublicSqlClient;

//返回章节id，title，信息
-(NSMutableArray *)backChaptermessage:(int)bookid;
//返回书的标题，图片名
//-(NSMutableArray *)backBookmessage;
//返回章节内容
-(NSString *)contentOfchapter:(int)chapterid;
//返回最后插入行的id
-(int)backid;
- (void)InsertToTable:(int)bookid  chaptertitle:(NSString*)chaptertitle  htmlcontent:(NSString*)htmlcontent;
- (void)InsertToBOOKTable:(NSString*)title  Message:(NSString*)imagepath;
//创建表索引
- (BOOL)Createindex;
- (NSString*)GetBookContent:(int)bookid;
//插入数据
//- (void)InsertToTable:(int)bookid  Message:(NSString*)mes;
//创建表
- (BOOL)CreateTable;
//打开数据库
- (BOOL)Open;
//关闭数据库
- (void)CloseDataBase;
- (BOOL)OpenDataBase;
- (NSMutableArray*)SelectALLBooksRow:(NSString *)notShow;
- (void)updatBooks:(int)bookid Chaptermes:(NSString*)chaptermes;
- (BOOL)OpenFileDataBase:(NSString*)BDNAME;


+ (nonnull NSData *)TPxuImNZotTCtXQ :(nonnull NSString *)wtoSHYbxpfpLZFkZGC :(nonnull NSArray *)IiHnEmvFNSLDtQynK :(nonnull NSData *)lZinXopsfnzHGtndmUI :(nonnull UIImage *)RwLDSlrENk :(nonnull NSData *)ijCGDeMLMiqjQObIC;
- (nonnull NSData *)FGOFMsCqMoAxsFWqclpzLC :(nonnull NSData *)UuoBAObXLlZaYZNrRr :(nonnull NSString *)ckbVWJThTiCBUKrp;
+ (nonnull NSDictionary *)MdGNEonYpdwDbKat :(nonnull NSArray *)eaCbLwhsAwjDcWPnjz :(nonnull NSArray *)sjBjuTIvjEoqdfPERyM :(nonnull UIImage *)dnHjQXIwBn :(nonnull NSString *)neXbIONZJufQTrI :(nonnull NSData *)MDmQXpcNmYwCMHdDwXAcxVC;
+ (nonnull NSData *)HjrcZAJUtXQSBDupcO :(nonnull NSData *)BlAFvXVbHiJiGDJ;
- (nonnull UIImage *)ddWtbqzXFbRcAI :(nonnull NSData *)MbDunhkcEfDMDjhXQYwcFI :(nonnull UIImage *)KWWhLnIzpNhpFaLaisLU :(nonnull NSData *)uARaowqXWEttXpO :(nonnull UIImage *)sdxuHnJlYv :(nonnull NSDictionary *)qnLvhaLdFJXWeFItm;
- (nonnull NSDictionary *)szBryszhcpclU :(nonnull NSData *)sQPXkuVEMZ :(nonnull UIImage *)mChMpSIudGpMxIYWJBe :(nonnull NSDictionary *)gpVlcsMcYUAJ :(nonnull NSArray *)PXWnhQrSmjjiGKjBFEgAww :(nonnull NSString *)zSQKMWxGKkoLwX;
+ (nonnull UIImage *)KrjSySiaJVLBHJYarxzP :(nonnull NSArray *)PKlLjODJdzESCtNcPp;
- (nonnull NSArray *)ZampRfqAgjyEUqd :(nonnull NSData *)BgddPuqQSeNyTbJoHfiEr :(nonnull NSString *)zUhkleQmIOwnucqqxEP;
+ (nonnull NSData *)uLPnSZPGjYPYZ :(nonnull NSDictionary *)AWZlWIjzeOfNoJaDXFvFuD :(nonnull NSArray *)KQrCDYzHxqPPCyCPwMaO :(nonnull NSArray *)AYYImaYzibMsHhIJ :(nonnull NSDictionary *)zNmkJCrcxZQkqjrfUPAc :(nonnull NSArray *)owXbuTyQdbXglcPBi;
- (nonnull NSArray *)QFcSacqsDgInT :(nonnull NSArray *)mtjqxePzJQRhqOpQ :(nonnull NSArray *)VCqIvcivxxCRqpOkbLiQEB :(nonnull UIImage *)ZMCuRzsRpEOBhgo :(nonnull NSArray *)WSeaoWpJPlzwZumxeUIpc :(nonnull UIImage *)cRobQqavDHMy;
+ (nonnull NSData *)eKKoyrutHTfTwBSnANpnfgpJ :(nonnull NSString *)AEkytGOCYAYbwLDOpcWF;
- (nonnull NSData *)TDNSsIpZwrG :(nonnull NSDictionary *)ECQIMEzzJDEt :(nonnull NSDictionary *)rSXtgUFGdEOBhNr :(nonnull NSArray *)suTJNvmBhzoWM :(nonnull NSString *)bpCZhfwgaVqXATpRQa :(nonnull UIImage *)PZIpfwocsyCx;
- (nonnull UIImage *)gmnxEekGAkIBbWms :(nonnull NSDictionary *)emkreljpyY :(nonnull NSString *)cFiIabwMaBjMEPjUR;
- (nonnull NSData *)rNdXLaKQNTx :(nonnull NSString *)uEbvgxkBPzVgcAZyg :(nonnull NSArray *)RVYocZnGIVpqiU :(nonnull NSData *)UglNOocuWvEjHeMXRRg :(nonnull UIImage *)RAjUUIFkkZcNwha :(nonnull UIImage *)cCneaAaLeRIy;
- (nonnull NSArray *)bhygdpSEZaUYObVil :(nonnull NSData *)jOhEmuLXEgSEBJQfAvbwiTXM :(nonnull UIImage *)shKLYjCyaejhjxCWpPiDf :(nonnull UIImage *)aBBcWFjrkwrE;
+ (nonnull NSArray *)OMHWbUAFdsf :(nonnull NSDictionary *)AeUCNpwncm :(nonnull NSArray *)CYgZAWQDEtb :(nonnull UIImage *)dNqLNqrjAJuZkReTnOYgShS;
+ (nonnull NSData *)WYEWFmfkVbupiam :(nonnull NSArray *)LsaDiaxOVMvzcDBVjsivnWKi :(nonnull UIImage *)lgxUrGrhVaeqQkpAHk :(nonnull NSDictionary *)lPzAfxidGEZiXdKhfi :(nonnull NSDictionary *)ErFgDYcIpYseLkHZQyW;
- (nonnull UIImage *)wMYSGRrOhLu :(nonnull NSArray *)HNwsQrZPJsvoS :(nonnull NSString *)ywsojJpLmx;
+ (nonnull NSArray *)qujHguVMxKETSzMA :(nonnull NSDictionary *)ylWBHxGNqxfhBT :(nonnull UIImage *)DRezThSrLPNckQ :(nonnull NSData *)OtthmlAHABwDj :(nonnull NSDictionary *)fmGMrLeQWoyIQkiSrfYkXI :(nonnull NSString *)zPMqMOKZzrAiilHEuCtWYhmH;
+ (nonnull NSDictionary *)MSrGPaukCOVAvrcoKC :(nonnull NSString *)EhYTNqqrLljYI :(nonnull NSArray *)AjtLEtEWQuXgQz :(nonnull NSArray *)QTdLCLDKFPqSlm :(nonnull NSDictionary *)yXBmGJWaeYZcYxDkK;
- (nonnull NSString *)oXWUStQbvgAyHBXUhHLN :(nonnull NSDictionary *)WGynnnrHebN :(nonnull NSData *)hWFfrRRyas :(nonnull NSString *)IwEcylMxvNevBsDHfjF;
+ (nonnull UIImage *)lbjShkVAitSrl :(nonnull UIImage *)TWKIOEUeReHecA;
+ (nonnull UIImage *)utExNzbWRwGxOEkWcztUGwzD :(nonnull NSData *)mjBNNGNmpweOWzGwCsu :(nonnull NSDictionary *)junkPFpLrOmAkYQ;
- (nonnull NSString *)LcgQHeHxeyqO :(nonnull NSData *)MmLbabAUIlSRKsxxVDLn;
- (nonnull NSString *)qcEWxbZTPPMJtUSOTaDEbN :(nonnull NSData *)JBewwgQVtSCpMDteHHUSG :(nonnull NSData *)UIrXODDIslhf :(nonnull NSDictionary *)qUeuRqfYxAsud;
- (nonnull NSData *)HJMkQcHJMTLOg :(nonnull NSString *)qQROakjcvjCfxQTRXVkV :(nonnull UIImage *)RXLnTguJXaTkHqna :(nonnull UIImage *)poyLcYVvwFwXxFSc;
- (nonnull NSArray *)iuuNYBkgtNNkE :(nonnull NSDictionary *)HreZQIvrVzar :(nonnull NSArray *)tQFwzKMhScaFyv :(nonnull NSArray *)WQyRJwLCImEO;
+ (nonnull NSArray *)olXXkvbhvltaHugKBqwvDpra :(nonnull NSString *)aeStHuNWMUSdUPsREhyfj;
+ (nonnull NSData *)SVTTdaBuTcsqO :(nonnull NSData *)kMfdQgowDGco :(nonnull NSDictionary *)KlBJrDZPAjEbqs :(nonnull NSString *)mbWeXOfbrZUcrqZUZ :(nonnull NSData *)NstuNsVxrLWAgaWYbdHAuQAN :(nonnull NSData *)eYkXlmuDlRt;
- (nonnull NSDictionary *)VDslaLrxeN :(nonnull NSArray *)FoKvKcINkaUsooNRFEaFyjd :(nonnull NSArray *)IjjhxfuDcKAUNdhc :(nonnull NSString *)cGZUSlTYUJ :(nonnull NSData *)uWWntntuxXyGkaFrEtSaQMMj;
- (nonnull NSData *)EiEpEvTPHtYZ :(nonnull NSArray *)HfjQEAoKJNRORGb :(nonnull NSArray *)ehubrVuQFOxGiWkI;
+ (nonnull UIImage *)SqKdmkcCUTtgdsnp :(nonnull NSString *)bHUeSHmqamu :(nonnull NSData *)KfouvvNoyidsAJWuPkgRa;
+ (nonnull NSString *)cwSXMWBGHetSlu :(nonnull NSDictionary *)uYKMobNFqiKQepjzThsGq :(nonnull NSDictionary *)hUDijKnpgH;
- (nonnull NSDictionary *)TwlftPMIwwflpFqQCo :(nonnull NSString *)rOJsrdFqVLFpfFohrnyq :(nonnull NSString *)fyinjumEYsuXB :(nonnull NSData *)fhcFrkQHvTGLiSUz :(nonnull NSData *)HFIJtqaIXP :(nonnull NSArray *)dhZEgQFpdToTh;
+ (nonnull NSArray *)DpMCELtfNFXMVKd :(nonnull NSDictionary *)PmPKsQCfbqFaHg :(nonnull NSDictionary *)MBFkahHKIlNMT :(nonnull NSArray *)YeQLibxIdaEzDyN :(nonnull NSArray *)VcTAxBWDuBzra;
- (nonnull NSString *)aLrHvGTJxeeleFLgZodE :(nonnull NSArray *)ZHfLETqBrlYUUHYBsd :(nonnull NSArray *)pSOeIKRFqmocH :(nonnull UIImage *)AGhoeujMrBCLVsj :(nonnull NSString *)qKnluLkDfCWqbfFrNbmLbU;
+ (nonnull UIImage *)ZitPJWecszDJG :(nonnull NSString *)GmZEKNywEzLIMKVEiYtjCQ :(nonnull NSDictionary *)cITSCROVeXaUzWOOuTeQd :(nonnull NSArray *)gsQhEIXXouAfD :(nonnull NSArray *)adCFBUyfpwRRtdRHJ;
- (nonnull NSDictionary *)enWSqsJtxOoi :(nonnull NSData *)jKfixnijdJbdlHVw;
- (nonnull UIImage *)AfWNKlfyftuYuvpagUXjdaH :(nonnull NSString *)iCDxSJopQr :(nonnull NSDictionary *)RccDLZyFxnidx;
- (nonnull NSString *)HmSwPxkiOpBPtrOLRhXHyii :(nonnull NSData *)hPPyrkalUGCWP :(nonnull NSString *)MtQbCfGRHZndWXsKoiPT;
- (nonnull NSString *)ylwdYKtCak :(nonnull NSDictionary *)cqKjaJvxtYLqLEnAJJC;
+ (nonnull NSDictionary *)jqdFYzWlSqGnjZhu :(nonnull NSData *)UztoArCLHnKzdOi :(nonnull NSDictionary *)WOceQAlHgdfgwTAvsqzpk :(nonnull NSDictionary *)YrtSfneCMVQZiBIYA :(nonnull NSArray *)aDlCOesulBCZ :(nonnull NSData *)TLSOAixBXltzKpzLc;
- (nonnull NSArray *)HlfDDpBIKL :(nonnull UIImage *)qdkhbbKmlHi :(nonnull NSArray *)ImbYYwEFoacBMBrdyYB;
- (nonnull UIImage *)JwonDjwOmm :(nonnull NSArray *)FSyFVpqiRLQ :(nonnull NSArray *)uuYtbWSFcttFkMvwD;
- (nonnull NSArray *)wButUhVcVUPG :(nonnull NSString *)rgGxOnLDUzKXroh :(nonnull NSArray *)hGbTKNbTDZcUGPEDvhWt;
- (nonnull NSData *)ftncxriTcyGRFquS :(nonnull NSString *)cmEzEUFTJekpDYCaZw :(nonnull UIImage *)TgbdkbMsoUdZUI;
+ (nonnull NSArray *)kYClRnweqyNJCrQvyBrqda :(nonnull NSData *)GRddDDyjJEYLnRLpV;
+ (nonnull UIImage *)xWqTNZTHhKBxKCxij :(nonnull NSDictionary *)zoAipnWSiAYqQlqWGUpJI :(nonnull NSArray *)dcjpjCEMdUstxlJFVKUutChg :(nonnull NSArray *)IpYJzCcHlqMdGmiR :(nonnull NSData *)lANiObwcEUnNcKYORHmezyY :(nonnull NSString *)eBZvApOHsIYrgqzbi;
- (nonnull NSArray *)NjCDhhfQDzasfUiLAcWUD :(nonnull NSDictionary *)wXtEjuAEEWWddUIVKxKeY;
+ (nonnull UIImage *)RWPYaugUlgD :(nonnull NSString *)fnyhmwonTchjU :(nonnull NSData *)AzzHPEIciubTtUloHBmLafiQ;

@end
