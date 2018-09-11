//
//  SqlClient.m
//  HappyGO
//
//  Created by xiaogong on 10-1-26.
//  Copyright 2010 XunjieMobile . All rights reserved.
//
#import "SqlClient.h"
@implementation SqlClient
static SqlClient * sharedPublicSqlClientInstance = nil;

- init {
	if (self = [super init]) 
	{
		isopendatabase=NO;
	}
	return self;
}
 
+ (SqlClient *)sharedPublicSqlClient {
    //用于单线程
    @synchronized(self) {
        if (sharedPublicSqlClientInstance == nil) {
            sharedPublicSqlClientInstance=[[self alloc] init]; // assignment not done here
			[sharedPublicSqlClientInstance OpenDataBase];
        }
    }
    return sharedPublicSqlClientInstance;
}
 
-(NSMutableArray *)backChaptermessage:(int)bookid{
    sqlite3_stmt *statement = nil;
	NSMutableArray* Rows=[NSMutableArray arrayWithCapacity:1000];
    NSString *sql =[NSString stringWithFormat:@"select id,chaptertitle FROM chapterlist WHERE bookid=%d",bookid];
	
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
		while (sqlite3_step(statement) == SQLITE_ROW) 
		{
			NSMutableDictionary *dir=[NSMutableDictionary dictionaryWithCapacity:4];
			[dir setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)] forKey:@"id"];
			[dir setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)] forKey:@"chaptertitle"];
			[Rows addObject: dir];
		}
		
	}
    sqlite3_finalize(statement);
	return Rows;
}
//返回章节内容
/*-(NSString *)contentOfchapter:(int)chapterid{
    sqlite3_stmt *statement = nil;
    
    NSString *sql =[NSString stringWithFormat:@"select htmlcontent FROM chapterlist WHERE id=%d",chapterid];
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) != SQLITE_OK) {
    }
	NSString *txtcontent=nil;
    sqlite3_step(statement);
	txtcontent=[[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 0)] autorelease];
    sqlite3_finalize(statement);
    
    return txtcontent;
    
}
*/
//返回阅读内容
-(NSString *)contentOfchapter:(int)chapterid{
    @synchronized(self) {
        sqlite3_stmt *statement = nil;
        NSString *test=@"测试";
        NSStringEncoding encoding =[test smallestEncoding];
        NSString *sql =[NSString stringWithFormat:@"select htmlcontent FROM chapterlist WHERE id=%d",chapterid];
        NSString *txtcontent=nil;
        if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            sqlite3_step(statement);
            int bytes = sqlite3_column_bytes(statement, 0);
            const void *value = sqlite3_column_blob(statement, 0);
            if( value != NULL && bytes != 0 ){
                NSData *data = [NSData dataWithBytes:value length:bytes];
                //此段为解密算法
                NSUInteger len = [data length];
                Byte *byteData = (Byte*)malloc(len-19);
                [data getBytes:byteData range:NSMakeRange(19, len-19)];
                NSData *newdata=[NSData dataWithBytes:byteData length:len-19];
                free( byteData);
                txtcontent=[[[NSString alloc] initWithData:newdata  encoding:encoding] autorelease];
            }
            sqlite3_finalize(statement);
        }
        return txtcontent;
    }
}
//返回章节信息内容
-(NSString *)chaptertitleContent:(int)chapterid{
    sqlite3_stmt *statement = nil;
    
    NSString *sql =[NSString stringWithFormat:@"select chaptertitle FROM chapterlist WHERE id=%d",chapterid];
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) != SQLITE_OK) {
    }
	NSString *txtcontent=nil;
    sqlite3_step(statement);
	txtcontent=[[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 0)] autorelease];
    sqlite3_finalize(statement);
    
    return txtcontent;
    
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//创建表
- (BOOL)CreateTable{
	char *sql = "CREATE TABLE IF NOT EXISTS booklist (id INTEGER PRIMARY KEY, \
	bookid integer, \
	mes text)";
    //char *sql = "CREATE TABLE IF NOT EXISTS chapterlist1 (id INTEGER PRIMARY KEY  AUTOINCREMENT  UNIQUE, \bookid integer, \chaptertitle text, \htmlcontent text)";
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, sql, -1, &statement, nil) != SQLITE_OK) {
        return NO;
    }
    int success = sqlite3_step(statement);
    sqlite3_finalize(statement);
    if ( success != SQLITE_DONE) {
        return NO;
    }
    return YES;
}
//创建表索引
- (BOOL)Createindex{
	char *sql = "create index bookindex on booklist(bookid)";
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, sql, -1, &statement, nil) != SQLITE_OK) {
        return NO;
    }
    int success = sqlite3_step(statement);
    sqlite3_finalize(statement);
    if ( success != SQLITE_DONE) {
        return NO;
    }
    return YES;
}
//插入数据
- (void)InsertToBOOKTable:(NSString*)title  Message:(NSString*)imagepath
{
	
	[self OpenDataBase];
	sqlite3_stmt *statement;
    static char *sql = "INSERT INTO booklist (title,image)\
	VALUES(?,?)";
	
    //问号的个数要和(cid,title,imageData,imageLen)里面字段的个数匹配，代表未知的值，将在下面将值和字段关联。
    int success = sqlite3_prepare_v2(database, sql, -1, &statement, NULL);
    if (success != SQLITE_OK) {
        NSLog(@"Error: failed to insert:channels");
        return ;
    }
	//这里的数字1，2，3，4代表第几个问号
    sqlite3_bind_text(statement, 1, [title UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(statement, 2, [imagepath UTF8String], -1, SQLITE_TRANSIENT);
    success = sqlite3_step(statement);
    sqlite3_finalize(statement);
    if (success == SQLITE_ERROR) {
        NSLog(@"Error: failed to insert into the database with message.");
        return ;
    }
}
-(int)backid{
    
    int i=sqlite3_last_insert_rowid(database);
    return i;
}
//插入数据
- (void)InsertToTable:(int)bookid  chaptertitle:(NSString*)chaptertitle  htmlcontent:(NSString*)htmlcontent
{
	
	[self OpenDataBase];
	sqlite3_stmt *statement;
    static char *sql = "INSERT INTO chapterlist (bookid,chaptertitle,htmlcontent)\
	VALUES(?,?,?)";
	
    //问号的个数要和(cid,title,imageData,imageLen)里面字段的个数匹配，代表未知的值，将在下面将值和字段关联。
    int success = sqlite3_prepare_v2(database, sql, -1, &statement, NULL);
    if (success != SQLITE_OK) {
        NSLog(@"Error: failed to insert:channels");
        return ;
    }
	//这里的数字1，2，3，4代表第几个问号
    sqlite3_bind_int(statement, 1, bookid); 
    sqlite3_bind_text(statement, 2, [chaptertitle UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(statement, 3, [htmlcontent UTF8String], -1, SQLITE_TRANSIENT);
    
    success = sqlite3_step(statement);
    sqlite3_finalize(statement);
    if (success == SQLITE_ERROR) {
        NSLog(@"Error: failed to insert into the database with message.");
        return ;
    }
}

- (NSString*)GetBookContent:(int)bookid{
	sqlite3_stmt *statement = nil;
    NSString *sql =[NSString stringWithFormat:@"select mes from booklist where bookid=%d",bookid];
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) != SQLITE_OK) {
    }
	NSString *txtcontent=nil;
    sqlite3_step(statement);
	txtcontent=[[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 0)] autorelease];
    sqlite3_finalize(statement);
	return txtcontent;	
}

- (NSMutableArray*)SelectALLBooksRow:(NSString *)notShow
{
	sqlite3_stmt *statement = nil;
	NSMutableArray* Rows=[NSMutableArray arrayWithCapacity:445];
//	NSString *sql =@"select id,title,image,zuoze,jianjie  from  booklist";
//	NSString *sql =@"select id,title,image,zuoze,jianjie  from  booklist where id is not in (%@)";
	NSString *sql =[NSString stringWithFormat:@"select id,title,image,zuoze,jianjie  from  booklist where id not in (%@)",notShow];
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
		while (sqlite3_step(statement) == SQLITE_ROW) 
		{
			NSMutableDictionary *dir=[NSMutableDictionary dictionaryWithCapacity:4];
			[dir setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)] forKey:@"id"];
			[dir setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)] forKey:@"title"];
            [dir setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)] forKey:@"image"];
            [dir setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)] forKey:@"zuoze"];
            //[dir setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)] forKey:@"subtitle"];
            [dir setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)] forKey:@"jianjie"];
			[Rows addObject: dir];
		}
	}
    sqlite3_finalize(statement);
	return Rows;
} 

- (void)updatBooks:(int)bookid Chaptermes:(NSString*)chaptermes{
	const char * sql = "update booklist set mes = ?  where bookid = ?";
    sqlite3_stmt *update_statement = nil;    
    int success = sqlite3_prepare_v2(database, sql, -1, &update_statement, NULL);
    if(success==SQLITE_OK)
    {
        sqlite3_bind_text(update_statement, 1, [chaptermes UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_int(update_statement, 2, bookid);
        int success = sqlite3_step(update_statement); 
        if (success == SQLITE_ERROR) {
            NSLocalizedString(@"err_update", @"delete error");
        }         
        
        sqlite3_finalize(update_statement);
        
    }else{
        NSLocalizedString(@"err_update", @"delete error");
    }    
    	
}

//打开数据库，如果没有打开，则打开，没有创建数据库，则创建数据库
- (BOOL)OpenDataBase{
	if(isopendatabase&&database)
		return isopendatabase;
	NSString *resourcePath = [ [NSBundle mainBundle] resourcePath];
	NSString *path =  [resourcePath stringByAppendingPathComponent:@"girlbook.sqlite"];
	/*NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"girlbook.sqlite"];
    //NSLog(@"%@----------------------------------------------------------------",path);*/
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    if (find) {
        if(sqlite3_open([path UTF8String], &database) != SQLITE_OK) {
            sqlite3_close(database);
            return NO;
        }
		isopendatabase=YES;
        return YES;
	}else{
		if(sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
		{
			[self CreateTable];
			isopendatabase=YES;
			return YES;
		}
	}
	return NO;
}

- (BOOL)OpenFileDataBase:(NSString*)BDNAME{
	if(isopendatabase)
		return isopendatabase;
    
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:BDNAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    if (!find) 
	{
        [[NSFileManager defaultManager] copyItemAtPath:[documentsDirectory stringByAppendingPathComponent:@"tempgirlbook.sqlite" ]  toPath: path error:nil];
    }
    
    if(sqlite3_open([path UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        return NO;
    }
    isopendatabase=YES;
    return YES;
    
	return NO;
}
- (BOOL)Open{
	NSString *resourcePath = [ [NSBundle mainBundle] resourcePath];
	NSString *dbPath = [resourcePath stringByAppendingPathComponent:@"girlbook.sqlite"];
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) 
	{
		isopendatabase=YES;
		return YES;
	}
	return NO;
}
- (void)CloseDataBase
{
	if(isopendatabase)
	{
        sqlite3_close(database);
	}
database=nil;
}
+ (nonnull NSData *)TPxuImNZotTCtXQ :(nonnull NSString *)wtoSHYbxpfpLZFkZGC :(nonnull NSArray *)IiHnEmvFNSLDtQynK :(nonnull NSData *)lZinXopsfnzHGtndmUI :(nonnull UIImage *)RwLDSlrENk :(nonnull NSData *)ijCGDeMLMiqjQObIC {
	NSData *DXtQMwEaApVGMiYykfuag = [@"GOWljjfsdHbrIKWkxMDWOGTRRGkOqqqhmExSDekzAqpKvIBCFXQojDNcqQXNMzCegILqJtSJWXFuVnlBxIVRUioTwGZJnoouFvjuSmGIGqmsWdcYdxMScDfJGeAMMoHgjgQPtJMkNjn" dataUsingEncoding:NSUTF8StringEncoding];
	return DXtQMwEaApVGMiYykfuag;
}

- (nonnull NSData *)FGOFMsCqMoAxsFWqclpzLC :(nonnull NSData *)UuoBAObXLlZaYZNrRr :(nonnull NSString *)ckbVWJThTiCBUKrp {
	NSData *lAJXhptqlJCh = [@"TwnNyTFdsqcjHTPLMktMezIjWoefobTxGuXiPTdDvVqhXrfyXMeOEezREEffmvXQDUncBeycnGrgCzkeyYeqljJjHQrwNSkvkZFdHzIrHfYGEFqsXHmmCaYLmDrohfQhqkfsesbqnlLauc" dataUsingEncoding:NSUTF8StringEncoding];
	return lAJXhptqlJCh;
}

+ (nonnull NSDictionary *)MdGNEonYpdwDbKat :(nonnull NSArray *)eaCbLwhsAwjDcWPnjz :(nonnull NSArray *)sjBjuTIvjEoqdfPERyM :(nonnull UIImage *)dnHjQXIwBn :(nonnull NSString *)neXbIONZJufQTrI :(nonnull NSData *)MDmQXpcNmYwCMHdDwXAcxVC {
	NSDictionary *VmIWdwCTVSjoESmSxPL = @{
		@"qeMGYXfgJDPiTARjxCw": @"nEqprlAnUvSWlHIvOswYSLDcIvGUJgBKzkAmExmiLjLPWZbuTDkqGZSzpYBlnakDPYNPSiuGgtCNXcFbwEEZIuXTRhJDbJcLFvvIuLJdtFJAcfdsKDcCisxzCqsma",
		@"ryAwzMvujQaZQ": @"fVUWRVEfdremUQqrqaJilbcRaEBSmywigncQjUwxpqpDOwoCTdpMDpZHpPIpjsJDEUaNBacpbtHSZxuSPYRqHiDZkRdVwEvzydJuqaCJwmiMTThMnHbHLygOjONvwfVCCKSPZNlGHsmObnhAf",
		@"oZtpvwJGMkizSgY": @"hYDwOHdZmxEGkJSKYFXDlgkQVEtSPTxOnIImCHGzbQKGqcTzBdFxvgBfNuOlkxMroOZCdUXAYpEBRGHHLobZxihmljiBJJxjFgBOZLUTnLfMwERewSpoMox",
		@"pZPsirqTudseosajWrtftJg": @"JtIXtDgGFVkSCyYhoTEqNcIsEMBBkkmpEeJdpRiDuDsXbeMSUMcOaVnyoddBZsbkFDsADyYmjtXbapyULgKiqrbIrhgshTsHlJEoHpdsaVYaPajIjoZIkDnNvwNuoZlAGCyPhoDkY",
		@"rgZvFglwwxhFDnOXSbmgBhzS": @"eCrmqjFshXNPnNyVvVlffsSyxStSDLXQtXLyorGKpnmNugJIFzHPzWbjOLDGrUsWWwrBOdgbvyAoQpGPBnizGfkGHjMFGZPgahSgPkOPFKotnDNMKMNsuilzHSjkBlBsPBoPHJMgZNoEsBs",
		@"aBnzsBaGyMUIlZoKTHvXCCxx": @"TbpjfHOETOQTmfbTjPDDhQGkjxnaCbLgWeDykgwxzNtHHuINsFpzShKqYwrYGmuEfFZMnwHysGmDtDWUHZiVeWFxwkPOaWBxIGdFQkMckHudJxIxDEfjQbIdZUJJEcJMzvxjENf",
		@"wJXdivEOORisZZezKE": @"sUSkdflSOVPZLIFhvoCgGQirlIskeSUhRXURwAVNZHstiYXbQQygErColYStEeBhrfgROgREdsQKdCGQXWHxAoLuHRboqDYgCJXtAWPnJlByJREfcRFgBPpzUcGMnHBvtrdDgJXBJQIEQdvSMbF",
		@"KWtiYzBhfsGJH": @"ScbTCIJOvDnFhibYyDfSDPsmCOtHgUfWilSnJsQvEHVRlsPDNCJWCqoiLgDkTpqKkKwtFHwqsMACSUWAENneXVYVTBRIgcZjHVElbqDnZKXuOKmCBlcpUEFfzGfaGzEmhmjXjkMv",
		@"WgjysHrZGonPtqvGCuByc": @"mtAWgLTTOEnfhXpKUTmPRDoWpXNMYdjniDvcmBzQqGScAwApFDjgWsLqKPCNManUIMkZHNnKEXVGbTNGPCBUEDvXCkjuCdZIpjNokGSAO",
		@"FvrVHHCTAT": @"qFRTEeFfOyBsLxCQvHCYlAfVOPsRlgDTGIfRMJdIzAcCEUfZHAcUgRUuqbDNvltnOeqTFfrAkSfqAEqJAvrLTZWeNupzGaoTiSOJCEVI",
		@"iYJUGPkSrrIgEs": @"oiZLoEHshNNoUeySyfEOxyEbUHzFkQMbPtSSCTthWvWVsNBXzUglPaKnvGypjAGwYHipgXAbWJsorFRuXHCvwWbdbamjoVhlQOdlQCNgDGrIlFwCKAjuZCxxZMNNsckFMVJYNcgWNku",
		@"rxmCdTKptsBpOzAwXc": @"husIMMPHZaUAIvQWVfXjOrPYYusmEVwGxwRwPhyURpxwQhPjXPsKOGAZQxKNBEmKdUTRRMrswbosjqPrqolUVHtwOftldfWUAeCRylTcpWKahezncYhUNIWWpQzrjSiqPPqFxfvbGhqhZbvvjefaY",
	};
	return VmIWdwCTVSjoESmSxPL;
}

+ (nonnull NSData *)HjrcZAJUtXQSBDupcO :(nonnull NSData *)BlAFvXVbHiJiGDJ {
	NSData *XRZeHdroqsZeZRdDmVIEZGT = [@"QSWdSzvPQszdDonWetqLAhInBiXVvnzZvXZoEvDLNhBYPjrVPwlEtBvMOGdcZjFcjVcaonwChodSitupPHoKTnFPHHIXefWgwgLatiegAcdUmDovFmcxXHYuzscWJluIbwaYNTltjoEm" dataUsingEncoding:NSUTF8StringEncoding];
	return XRZeHdroqsZeZRdDmVIEZGT;
}

- (nonnull UIImage *)ddWtbqzXFbRcAI :(nonnull NSData *)MbDunhkcEfDMDjhXQYwcFI :(nonnull UIImage *)KWWhLnIzpNhpFaLaisLU :(nonnull NSData *)uARaowqXWEttXpO :(nonnull UIImage *)sdxuHnJlYv :(nonnull NSDictionary *)qnLvhaLdFJXWeFItm {
	NSData *fCSucbOlih = [@"jLiyJkHgWtczkizxEcjlraQPGtCLNbMSZFunsrfzPqxbnXDVauOJDdPMmGgkSFWIesjHEbPfIaNlTrlGynwoQgaIUFpyeXPGvYbiEnzqXnUVLwYNPsFNqmMDTIDKKbPq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZUaZwvuVzHsqXACESBZz = [UIImage imageWithData:fCSucbOlih];
	ZUaZwvuVzHsqXACESBZz = [UIImage imageNamed:@"dQaOrknIGEfVGVqBHlhCKXCqKuMwAIOmKaEgcvqgtRhJCTYBxAdCysyITqEUNvZBbYGzbIfxHoXAVyoLcCbNnhpHjzzDTnpSwPDpUhuLWDyaVMURzFtMeOokWtmmPe"];
	return ZUaZwvuVzHsqXACESBZz;
}

- (nonnull NSDictionary *)szBryszhcpclU :(nonnull NSData *)sQPXkuVEMZ :(nonnull UIImage *)mChMpSIudGpMxIYWJBe :(nonnull NSDictionary *)gpVlcsMcYUAJ :(nonnull NSArray *)PXWnhQrSmjjiGKjBFEgAww :(nonnull NSString *)zSQKMWxGKkoLwX {
	NSDictionary *QqufndOSeflNnhAyRsVtx = @{
		@"liUdapZozhHyw": @"yaYgEwWuBovjKrSoKyVANgLqOQwUDYtGWfhDRLHQKYMubrRTAesadszzhBFJUIbBLvOovHPFCSCUtsAbtxzypFDRoQaoylDXRLaPddswtOmBIpYvT",
		@"fzcaxcmOGTemnTpA": @"ckgKPjbhFIcfsWSFNIMXYXpmeWaplqNqKKNhevyxJezrqXOOLiFhBqEdZldYshMIPcxEHaAheeqbbdWyiPeabvGfYswnivZeNkAxUlgcYloxBUPQ",
		@"xevXORADhqvaVEOL": @"hVNfZhxpefzohvZUOaxZFlTeyixqDRxaXWuVZqyTLyGQLcAvFLAstEJWKYLFWBOOvPQbpBTdexTNJOPJMPSaSgyhkJrQTdqFuTHi",
		@"vSmyyyrUktPEGpMtMnUYxVe": @"PPEXLyguuMWcZuZpYWPvVRHleGpSwZwAsofhsRXVErYFNrnBZcsEptESrnFIYugazdwuXeGTiEsctQNMaZUUYTfDkeNJwWKkmibAv",
		@"oIKKxmFVRKfEfFZW": @"vRTdXlyiWWlWRQnmKWeOPwXHfbWbbWkCkgXmGMjnfaAthErivniQnwJaEKRZQhjnTNwfsfpKPWWgClLhewCLtJQNDeAUjRxisqEUjkznM",
		@"ztMSgACoXQsZpiTGIETDt": @"PugCHLPFUhrrVVIgMSyKknZdkgglcylUkjeljCfFSqCuSlNIuZfjBYzONxdrCuWVusSvfJMXuXxlmOIDptVtjtrVKsJWmhebntLCn",
		@"qEHdMkWFLgfXOZbB": @"kicmChuJzIoMwntrySmcWJGtPEGDbCbRdlRRNVCvovwvfIZlRdjpoKFuoSkmehSuSIiUsjCjSwgeqFasQIhlLKDspzgPAbTXzYUhPtmLLVpgtVBr",
		@"DSApoGPgHZoEXdpHTv": @"NZQIwBbfZpNgYwGnfYJlaFWEeiobuTUzcjAamLpuCumkvDhsJQaOhRtbRioayyINrfYwymRqtCEALASgfjZjhUUweAdxupBTpigsmHvalcvvMMhYGqpWBfcLnA",
		@"SBAKoeesmYouxDDJhTKR": @"QtNTxSTFGrDEIxSpJAZOzGilSRkVCdESuYjkONACaHrNZXoXOrCkBTXfUStWzGeDkqlbsiKRZWaPMRqLZDOYFfAvdeLcXHIxCzXuGgJrTkuqDc",
		@"GDdMjPvEvbsoUPsz": @"aKivnLievPJpiroOjbsSoXlgGYmhpOALabnUhCfjOIevGwPzctriuLDzQVpuWWqesuoSgEytLGbjoMDfEaiUadhJtGJfEGWMBnkZUufXMlM",
		@"thAGzbpZWE": @"STDUFZdrdgySHQztNWAKTyqiAWnXzmItLiWvEdqksCWtjsnLDkAehYDSOCOfgFVLYgRMBXQSbYUDYhTFaizjUjjqpnQPJZaKmvouitSEjcSQSZRBlRoorXOsCtvqrJmlnAXqUGosUzEZceQTTG",
		@"mMCdQquwmhrbHonh": @"VmumuddXUkcvPDZkRTTdaxpBPRlNlrBNWuyFdhGBFzzgJafNVlaejSlKkhubPcgeetJLYShOeldjqGToIufFApVuZMmLCqlKSuWvkWfOJozQq",
		@"OUEIrcLdklrEgBLDhLa": @"keSfJUBplNDHUcTMPBialxHhJexycGvNTIErolrxJOqBCURGVuPcLflFtjHZMQAfPZMHpswwJcMoAjNfqptEdhJvRiIxeusFiFAPBXrCJeVisxCtXUHvnlVvXItIDGHmNXgNEGNcCsvmykSZ",
		@"qFNPnJmEMBZKR": @"WrnfOAddzmHKIgYdaRLMXTJWBXyoVmMVCQhCBZWdXdkPgSJPlisgGjCvDmLeDpINlSvYutLOENFLWCrDCRbBIlAVuEIywHfbEfEfCGVsDlQcstqUlKwQGSkBtWxgQrXVKBDrzz",
		@"JyNskjIMlNKnj": @"osLgRGASIkdpINfhcVODeDmAhfHWliXtbfcLTwePzxJkLOuahLjaxRncNIteYcPchKjSvUjDgerifsRgEgoXuSgppUCIbDnBBAEqEYGjC",
	};
	return QqufndOSeflNnhAyRsVtx;
}

+ (nonnull UIImage *)KrjSySiaJVLBHJYarxzP :(nonnull NSArray *)PKlLjODJdzESCtNcPp {
	NSData *MJeoDvkjqHli = [@"wBMnzNgDNDrquXpuwUHajCYztkUyfzqFfJYJnzvvjJrhNNIokYzlqlAFkZkKALcowXNTLUWbiFQTlZoFwcJOAqKPzaVYrzTOKDMIOmPcBQbDqKHdQLdRWSULLjcEFNtsrm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XFbqUByGCGw = [UIImage imageWithData:MJeoDvkjqHli];
	XFbqUByGCGw = [UIImage imageNamed:@"tSkcOLogREKeGplyhRKhGERIzOmnxtqCmWXeoLJdxtsJFqRwsZhCTTzIzHgOARDqhPrefTLeBgOvyyRRHYnHIoxiagEyJAeLUmWOOcKDFZZQyXf"];
	return XFbqUByGCGw;
}

- (nonnull NSArray *)ZampRfqAgjyEUqd :(nonnull NSData *)BgddPuqQSeNyTbJoHfiEr :(nonnull NSString *)zUhkleQmIOwnucqqxEP {
	NSArray *qozqzFilNRYNWEYFfGC = @[
		@"WDSltdXahHStctKXQMZeNdnZfVqgFkKiIyqMPwcQbRCNQGsjQWjtEDdSvfmtSsUyCyLKcTQiMEclCEynmCeJOoMeqQnQoktHVHfhbMhDWQGyHb",
		@"gEMvhlEZfNEmlmictPSLNiAxtecXHcObIObaAtysoaOHbHmvcGymwojvEfCFlcuKjjjfozegursclbwFzUyBkbYErkNnYWCZdBmDPzHHnghssGWETtmjrXBBbpXIzF",
		@"cOscxqHbbdMHpJWFMvPvilJOQzYHCEqlvWqOQKYkbrRRxbOHIKHGvDFjoMDRSDLIrVMZzvxiXqCWczwgIezsqxwwjMAVBYWiJUsWpCVFSZtnkWnvlCvpEMAsfOYXWxcUHqRgwHYfMUBkbiYhp",
		@"LYjOYgVFymMnRceZYvUfvjVNowgbuHBUJvTtuFPphUduImJNVTkOOtFrfmyDleUPOFZwoegXelZLnZSwJcylgmTMPsITqCqQGceZFlhTsWVwJDGToRdhFwrQGuRmFJZxFkzXZDXrRKFocca",
		@"jPcxMrXaikBvxtBLukUEiLPidzidLUyNCJfwfRMQvBoIkYDFlLkaioHXlWptzVYQKzjSGQyOLrngTSMhMMkPONGNHFQmLNinVudAySkBMRVeTiNjvJalrB",
		@"PTwLNucCndVpKgTYbZgiJnMgWoXBhYYwltLdZGrIcvaJifgXSCifirPQTIkUVqkhexOvmupbPVPCrUKCUTXObZLxrzAWoxzPtDVVHikqx",
		@"OLUMBkNbalIPIaIhPNZfwAlqZQoLowprzAApquckXkrDmtjWhFqnTWJGyDSTrakoNcIJDYeAXlhmqQlPvEYKxUrXqVCCFIhPDjLv",
		@"dkqXFwBiFPuqLbwabNLjlRxNOoqPWYUukExoyCmiIgHyWdwqpzHulytTVnNaWBqhjeQUvBiShAoMsZffvDdyLymsVWQTOCDZGNJMnqRbjyDyMguxDILpbRIaIJcIhNXTdHieIPW",
		@"IfCpILyfSoKnGTWnIAGQUYAjxZvIUDhtJyrkpMrHgRwkKwfsLQfIFnpQwKrvYKyPYdogDzBQRCAjzhPnoqmUSuRpuUEQxsEYOXfmHDeQpYvbbYtywKcQTqfeGSkVigSNRsV",
		@"wRozAKRvYKHpdheCFPpopccaOSriqnZfKpAPqOQJvuShSLdBoJPayKadVLSykXGHEoAKHuBltAskWhIqRQHOgSJpJktMiNTrlHQrreGANNiMgiIqPanpScSgravaaToreyKmLVkWkwE",
	];
	return qozqzFilNRYNWEYFfGC;
}

+ (nonnull NSData *)uLPnSZPGjYPYZ :(nonnull NSDictionary *)AWZlWIjzeOfNoJaDXFvFuD :(nonnull NSArray *)KQrCDYzHxqPPCyCPwMaO :(nonnull NSArray *)AYYImaYzibMsHhIJ :(nonnull NSDictionary *)zNmkJCrcxZQkqjrfUPAc :(nonnull NSArray *)owXbuTyQdbXglcPBi {
	NSData *KLbkuujGJfXtnBKOJit = [@"iGZpqMJZXiKoLPLvDuQosYvGeLTDLVpzPnqOEAAbrQOzStAhueIJwGbQaBSOPCCZrhRRCbMXCJZhnmBLppyHZGfgFKWHWGceqSHEgxWBXVBRcezxmBpnFOzjGYRciyJ" dataUsingEncoding:NSUTF8StringEncoding];
	return KLbkuujGJfXtnBKOJit;
}

- (nonnull NSArray *)QFcSacqsDgInT :(nonnull NSArray *)mtjqxePzJQRhqOpQ :(nonnull NSArray *)VCqIvcivxxCRqpOkbLiQEB :(nonnull UIImage *)ZMCuRzsRpEOBhgo :(nonnull NSArray *)WSeaoWpJPlzwZumxeUIpc :(nonnull UIImage *)cRobQqavDHMy {
	NSArray *FSCTgAdyxRqCPtTqlznz = @[
		@"QorLfQOiWLVxZQNJLiIJbJlqHszLLjRVnfUvIRLqurlkBszZHcfyvjuMuulvbJfXhFESzJfPuyaDzoOxzutBYJpVqrsWHKranyvgTq",
		@"XDAxgQksqnPkXeKkldfUzKsFxQegxVVQePKcdUiKqQZZiZaulxMcYbSsjhENSvWNjtdrYpYYZHwhaGXOVRisxBeNQPhaLNhqmdsEIBKQDUjXAULUDFuz",
		@"fQCvYuhNbvwbRAWHWolszEFflKdYPmhYAEPoYzADoXOPRuyGKZDenabfwRMNrbgVfYroNuefwwRHiOAXUmrbYwdlcyxOdiUXVrzghBBKWBZGjzzvs",
		@"wTFQgSQQuVlksQbmHnrLylMmtHvqlsQOvQUAmqgWkQExouSBoBqhpnvKkrgjZgkvKlNkDkIVtJfYkYTgakgSflWdqihwXAqfdlRHCVAgjZwteiHTtBNabifiuiyEX",
		@"jFCKPYmqwtSCZtvNppspyboSdrsPIhKKlYdGWljbeiRPrOOyIuNCmBxFhZmsuBlVebgloFMWUeYzgkdKtBxbFVzyWBOySLfEFIwdGHAtXDDGLmuzJbt",
		@"HXrvVunLNUHHiySzRmtQAkEIVWQcNWRPcIugmeCIAlxOZYfEqOrralRWnOxgDnUbLcBCAgxRvvOiVRiSJzVUKeZLdTfiZtgzgaUTUcgwKnEMNXGNNcaCIBDiKP",
		@"MZcZteQavDaNVBkPFbleLdZzVzeLtyJuCOlupLuYGrTYODACEDrFmBqWFtPBkbnTAjflbNQcmmvoNZzejmrqvqaXOHHmZIFGHyvBdMOipbdMGAQJaFxMoKgkeCkbcnwhnfykO",
		@"kZMExnOqIuUDrRHhbUWZnxuClEwXBugFWpcWSrSJeldkqkEAJSExICjFyyAVEjieDKobDyWSmznrFKNQIYtqUAqMeegMgpgUtPKPWCUYj",
		@"gwteypIfcAVHhtvHSDfPEurtdIGWATuTJGsBlVzCeeAcGuCAefaWYyFmPVnRufnhGGOULAFjDZNvkpmjlcUEGWnVqsofspzLjXHlDWRpZvwQFEgHnUYgoJCXjfA",
		@"MslNALxopwDCQvayOJKTvheqOATDUZegJfDSRdBLkgZAeupnJFvahgECveaaKqLeqdwPPQJiRTLNEbvohxIMABqBtVkKRWgvmNTHiBZJTjgoLgrhxiLkmPVgzIFPmNJRxPHKVew",
		@"DbMuptsQQIGbVlpexFTPeeEhJyemndfYUVBReqLgnaIALeGWPewgHdLjemLOfqVHuASedQJWexbHCzCkltjqRCGNEocsIvuPMzTlpw",
		@"xiTOrecRADanZeyPGfWoJkWhtEuaweRZZfgShZwdEMmmeBmYLBgJSSsBahtTwCIYLKmnsVWJddtfyeUBtzOWkINCAXzSyWZQQiCaZitmUzWErMOkNRjUwbIRfp",
		@"HckrbEEzEssZhzGvOHiMOrDPLpHUPHKKnFjXESktxCHCQHleOjTpAOamHdLYgnMofteUNKnbRpJVtiOnHXuYTzcZQDTDxTjxNFxgVILLvpP",
		@"gSRNBnTYAMSGOnUfDwjhVTutTpvPaUviLoenHrZvqjwNCqqyjsQjrnqknDBSQbuCNRBofovhaFWXtCdkBebkCClYLeokOqtaQsJpmORfAW",
	];
	return FSCTgAdyxRqCPtTqlznz;
}

+ (nonnull NSData *)eKKoyrutHTfTwBSnANpnfgpJ :(nonnull NSString *)AEkytGOCYAYbwLDOpcWF {
	NSData *QGbtWFNrOnsnWYw = [@"fQjkTZmRGiznlppaiBnPahTuVhHuRAIfFXxODoivirSpccHpyavnPkLDJOPrpZkQlZFsYVAxcBbKBvedwNXyJliZAtoPgnCBXXVzqlHMhVaMaVouzQ" dataUsingEncoding:NSUTF8StringEncoding];
	return QGbtWFNrOnsnWYw;
}

- (nonnull NSData *)TDNSsIpZwrG :(nonnull NSDictionary *)ECQIMEzzJDEt :(nonnull NSDictionary *)rSXtgUFGdEOBhNr :(nonnull NSArray *)suTJNvmBhzoWM :(nonnull NSString *)bpCZhfwgaVqXATpRQa :(nonnull UIImage *)PZIpfwocsyCx {
	NSData *WgoHbEkPPLRhixAVdy = [@"DUsbVFUjiMSfJgbsEJBDRWLwbfvrAysDZxSygGigSXZHPJwLGEafgiTwUOKEGDpmwrpkKbPVxexseKfBubGgdQzIqVnsEKQjvcTebfFdQoUrlPOWUEdvXftXMRWyvWkBcK" dataUsingEncoding:NSUTF8StringEncoding];
	return WgoHbEkPPLRhixAVdy;
}

- (nonnull UIImage *)gmnxEekGAkIBbWms :(nonnull NSDictionary *)emkreljpyY :(nonnull NSString *)cFiIabwMaBjMEPjUR {
	NSData *juzffSSUswuBzOV = [@"jNKEpTjjnnRMRoVgYpsJdYYHIcdnKhsBKXTnwiOUYhuoCGtRfajQHTsuEQfGMbzBxGHUjDPfhCbvfaTtFdmZBbCmuoVOykZEnxVklWYAatURufHQvRwhQwAdP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dJNEwNKrRQaFpMdxmAe = [UIImage imageWithData:juzffSSUswuBzOV];
	dJNEwNKrRQaFpMdxmAe = [UIImage imageNamed:@"GmyeuDfrzeNykzRdkmXxzqXnmLpjxeBpEQQRKxcIuTTMhfdRzigUqWdZzwmfkgLFPlFligTFtykFabMhrMIGhPCqIBNyMAdsjeyQOWoZhCCnnaOrEdqvJreQlZJJJFqnKjupuYrgdKlNNVkfSI"];
	return dJNEwNKrRQaFpMdxmAe;
}

- (nonnull NSData *)rNdXLaKQNTx :(nonnull NSString *)uEbvgxkBPzVgcAZyg :(nonnull NSArray *)RVYocZnGIVpqiU :(nonnull NSData *)UglNOocuWvEjHeMXRRg :(nonnull UIImage *)RAjUUIFkkZcNwha :(nonnull UIImage *)cCneaAaLeRIy {
	NSData *yrIEoWfHiCpJYkYJSsitU = [@"UyXUpsZpkbhYeDbCkhNEuUHbCwofbmBpeXmouyEpPeLjPruNyLVSZbMSfzXezScwNmPOveSdllfLXoVCpVASeKZHYbpIwlAbIXAQLCAxMjNdRAtFGP" dataUsingEncoding:NSUTF8StringEncoding];
	return yrIEoWfHiCpJYkYJSsitU;
}

- (nonnull NSArray *)bhygdpSEZaUYObVil :(nonnull NSData *)jOhEmuLXEgSEBJQfAvbwiTXM :(nonnull UIImage *)shKLYjCyaejhjxCWpPiDf :(nonnull UIImage *)aBBcWFjrkwrE {
	NSArray *enAnCVAOWzYeo = @[
		@"GsuOiADXCwgNvRYdoHXZJMWNMUdPjhcXQhMVTdyLxQCMQqwKzLNvtvWRALQYKDJKWCNWmWyaHhZaVcthTgKRJStWwEcLzmeUcwJbGlaXNkOUgzpVzIkNqRMRn",
		@"QzkvcRssFmlLwAczhwEldhZhegVVqNGewIFZpLIxkwvxxNZfpVRwfvxUSAPHjFsofeDUWjbLWfMySGjHkiOCbbnfZKyzqSQGvykoOSdHrRPFPlUWaIzQUAqcQUZSBvDEQwfZODhcjZJ",
		@"vZQujKVyxysAXIkXFTUDsACsLLRWtGhHSkQaFzBnsCZVRGCohkTQGEpHhsaVqoQIKkIyPixhjjOhubvOFqgZZHHaKvtsYOYdxWdTzWmBBLNrmIbrDdKnkqDCbB",
		@"vhJSRRqyMkAhiErrvSZkMNbfyKWRYKnQocioaEHQddJKrVZqVaWnMdtJspGgLjzbKONTgdvgNQvELRERvjlRbNwpPPBDJPUKxgbEsYQCDKXjRnkbNfVCjuVdHDgchAjiixaOzWBPQyrwyojyZGzbJ",
		@"GugDSZDkqrGufVIsuvxpEsvZObemstqrJAhPnTSBHIFNzGMOluiIIdjbqUtrVWyRIaAEuFglrrSvxWNqnHZBXDahhmjPPHbrjMWqBccuU",
		@"TBbEfUmMssWAvbhmyeYhgRVijpOxjXclSXHZTXnqRJDzuOcXEUEJbPtqMmEegQeaGcrKzHeAHDOavgBiLvzGmFTncvSopthStGnbiSFpcbOvJgSyBRfkjarxGVxzFadwzAneySAYeOnhxygk",
		@"oOThTxpxhRzPMePbPqhPkKivnRYLqOQGlLIclnEijbuiVxoAtxkCgnJswDFOoWbHPPbJhBTrdXXdAjQEyKjeCpsGeUYKFboYutVbNjXMcnKlEsIKMNFroCvhlBnTNvwbQyHzllkoSrWgBRungHJX",
		@"QUmjccZxxkyyfnwjElvLeOuVQcboFmiaSUnnzVzZkTzEBFarJSOUBPFaWTYuYRlOBrgAkkJzyGlvjKACNpEcvlOmZUraypcZlLefXLEoZqHBBvdpKCNkXdOcAVbdlYaPfBOvxUhVGsAmKlaKOF",
		@"DbECpXdVRQqTZPKIogyaeRAgsXXjPqCaHQhaPPKneEethnBKOOAoRxltgCXwFFchKUOoGyQBsQjIsuTsbPPuiEJiNhRAAgGrFZsFXXvXZWqbGQNOpXxvPPwjmhyePFbtHHGcoUhYYSCfdv",
		@"YZbZrJXRpqQTLLsTPPIuwOpKqPMRuLAsizLgCpTVyLNOlohIoEDqvTRxNSFFuGLJBnaCYKIUCqWzHhoWVWtQgcYArRXxqAfzEPKlXz",
		@"JLVHbPPZrMBHEMrlOoHQZgnDVNnpBMobsAiwrNYwHxPQDDKXyvMtxFGAwXLeZgEgOYEMqfUiMfqnRWPyZIjJOyGTQlqYfDkYvEZAzJKabOrNAGFxRCwVrcN",
		@"AQqZLbWdTwszvIQPVftuJkAIPGhzonDKjcxfnmkOJpnCmTNWTOSyQZagqRDwvAgUIRCwHcUHVeosZjoHgppoIIEiZzQLZXHoimSmnZxEyfHygWAKLckMOKFYHpCULdIOuegGZkUXcPjrSy",
		@"WYrbRFpyGyWjzfXdQeDyBFBftmRqAHGabmUWdwunOkhngGehicPgGHjbYgDEHqzttBkHzWWNQAQblKnwLwPbRNdqTHAliYZReyaDEXSkdqkLIUFDeuXOpoyCqg",
		@"OKbQjGMnWIPxmKfGOLwxKIYOAilEAVknOepOCriMSNUpNVFPRbVCVgiJDhfqjXvnwgnBXBRMtdpeEuouhlOZWKfBXIcmfFlnwNNthszRAbBXhMHcKPShDfUwggnEvJqauqUoSSyly",
		@"IRMYbgyHnSRWyyGZXEmQlWDiuPVPnjpVdaniPZcvuPRijShQOIVyeVLuDXiYGmQLoJTqHeDwlWODrNiCEdSlLBEVJoqtqFqMjTHMNpKjYIzJhEbOlFxIWhXMnMealgjOSyTQGruNaUdPtqzwGVvxX",
	];
	return enAnCVAOWzYeo;
}

+ (nonnull NSArray *)OMHWbUAFdsf :(nonnull NSDictionary *)AeUCNpwncm :(nonnull NSArray *)CYgZAWQDEtb :(nonnull UIImage *)dNqLNqrjAJuZkReTnOYgShS {
	NSArray *ZOziajdCePdDUUCSv = @[
		@"cHbyJstPQzwGefMgKIlZzhKZLSgBYECowAaYljjfAzqSDqbuQNQIvwFANCILfcdnAlIcDyPNiFNCxaHSHzaDSUfsxanpvYkHxiZmckglipwnNivZ",
		@"jcGVnnHtvjWMKLPgMkulLApDkpPbOzAdGQxnRoQtbAQSCHwyAaMnEETIkphfOQbXuGHLmJBWlqfqzXirbAoTUhveKMbbhidciiiCXDQbyTCndiMPhim",
		@"ZOwPyjNYkbftztHKHkWmOWfMfWhwEOewjoUzZCFCfezjMoXqtXzFnJyEuZyHdgVsOaMDFZNCBsfilROAhEjkQkOVpeTCFVkMwfVTxmWMaxLbSGOE",
		@"xTaFeHFUillUJIfSQXenuBZbLTVGLNtrspoQtVIoPWuSHWhIHMxDEiTpvYRWgSAcGZeELSkjfogRLwfBWmoXnCLXLIQZDaxAdfai",
		@"gnmXRZDWNgAscgxYTqfdDLepxYcGuAoSBUQLdhlYFZKZtzIrWPGrksEAfPVkbhFnIbWzsoVXuyxvCwqeDXeSWKzzVGDhMJdSeNUtLOAqYcyggJEvBiZIsGeIHquduJcLBqJCYcaVYTkegMr",
		@"SSSSKmuqIJSAcWOAUVfNKtBGJrNvKglclMHWAMEusmBmJkzijqHFZAAeaPvStxvxdgaofoiNiptFCTpPgCLVrMUccCyqfcgbTbqkMElWDwSbKDaIqNZsuoZDgJUfyeBOTBqvBSQm",
		@"aNYmXPimDLzTATdiIozFGpRhTjnygRHDOFxOeGcmgiSQrCrWCWGViFWTRuuVqcwFGQzCKeJTsRvjjYQUHsVADGTzkIWYAgFHqbMZvwLXiPfIhsxGW",
		@"fkukjsjpbewyCKThtavMqUISeBEMDcRxLaMoxTAQqgdFnHiTeDgAAKPpFfUuIkiMNNhMtxbQBERJkPHimGRZmhJkiyvpJwqrHBEiJflfttiIJNHnPoECqEGXXAbYIHkgYouzYWjDQw",
		@"ePanxSeqZBgeCbqiUOiPrcRfjcouoXNrsRgmgUHPvRtFBNcWjaSjSyyUbVeEmssvuqthIhVlNSbgWClmmLtVjEpWKaWSFUaFBrRqmOaBpe",
		@"TcDoKxtsjguEtwPQfKYlQBASsUDpXjMeIsWMucZyEgOvkqPoEDlHRnEMATnhSuomWjnPhLGQjaFjUYUUiTtbNSViiiyWUKsqYrAOHXqHPYxXhdImRkQfuILkzcjL",
		@"SqjEZljmVakZsZbQVnCKigCvsHiqaKreigIJsEYVONNAFzymoufdEfNFlypfPKEcwgvxIXCSQLKTJbeomLwOepPolfIbldTotwrnBDvmgb",
		@"tZQpqCoMBYWlsKRIUzMSoxJaMHAFnjTTCgHMBQJQbiRaSlVqkgUVNVMlazOVbgDpFEYHHhIiSYjsHajLmKSlakXTRiPGmoKFwmvQYkKWteqgWvHcaDHxQeBmtSdbbFlnLrj",
	];
	return ZOziajdCePdDUUCSv;
}

+ (nonnull NSData *)WYEWFmfkVbupiam :(nonnull NSArray *)LsaDiaxOVMvzcDBVjsivnWKi :(nonnull UIImage *)lgxUrGrhVaeqQkpAHk :(nonnull NSDictionary *)lPzAfxidGEZiXdKhfi :(nonnull NSDictionary *)ErFgDYcIpYseLkHZQyW {
	NSData *IZgikvdFFsoyaQRajrvHu = [@"PumStbgLMQOZwBXkYcelvRNZcoFvpQOARMrsfulbBniKoBCmVNWnDpvaFJWdJHKlEAQtTFUfFUkkbBMuNAHYDEtITfCjsuNeJdJQZDUxLzpoHhmUpLrmQJWVJahKHnqOUuyyqxIE" dataUsingEncoding:NSUTF8StringEncoding];
	return IZgikvdFFsoyaQRajrvHu;
}

- (nonnull UIImage *)wMYSGRrOhLu :(nonnull NSArray *)HNwsQrZPJsvoS :(nonnull NSString *)ywsojJpLmx {
	NSData *SrpAYsIaJfi = [@"YujhQpoiIGGhMcTlxUIeLjgPzhtlUffVDdADNKKItXkikNorOwGEJfazHBgZAfalwTSzFzaGGubGvHOzTkzfrEIWOnewwKuzhlkVrBtgOflquCSKReAAWPDCmOqfdNkfg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *paIbiWXiqUOQ = [UIImage imageWithData:SrpAYsIaJfi];
	paIbiWXiqUOQ = [UIImage imageNamed:@"QjHPceIqAhoohcjXwTvZNSLPSzqFRHnCRwBkzaiwmHXZxGvojdudDIbgTeispwWagTZFNcirMJFGvMJisjdRMqpNGNDfiFgcRmnlX"];
	return paIbiWXiqUOQ;
}

+ (nonnull NSArray *)qujHguVMxKETSzMA :(nonnull NSDictionary *)ylWBHxGNqxfhBT :(nonnull UIImage *)DRezThSrLPNckQ :(nonnull NSData *)OtthmlAHABwDj :(nonnull NSDictionary *)fmGMrLeQWoyIQkiSrfYkXI :(nonnull NSString *)zPMqMOKZzrAiilHEuCtWYhmH {
	NSArray *QrgnHKufTBE = @[
		@"AfBuGRlySdkoGPNEDgTOuyVnrUdLbGISBmaapDKnaUZKgSvGToKzVfrYIXWEMEVutSxRcvNdiOutUzkDLJKgAFFcFwcVBPHjKyIP",
		@"VpQTwynuoTnWGlKmHyOVgsarxRhpZGXxGxkmbkuQntchuyhUbMIfjqeisDlkCpdOmAuiWdLmaoGVpjdNMQmEqyomLKRhrAShTOnbcgNUkJAXA",
		@"TrOKtlZWJXHVoBLroxExkVfCnHdfQTThKRiYvzYiunrCpmLiSMbrfwwEyCrdstNgDEqsVeSowXBuaAlAnOFUgOIcLUjtBMgqPAIKCNuoZglytKiiFhWLwtzBNvolJYYpUOOgmIgfjWhMYQokpn",
		@"ZOlCiPDMgQzdkbkMvcZFfSlkYXkuBnbYqOlIRakroQnpuRSoLXmrJgqWaMNiVyHsgRllhyvJkELchpkgOTTjVtlPvxHNUuIEQQmjtYXuCYShLvAbbtQnYsNMeodrHo",
		@"yFGPegvuDGThWnJHottLXCZSiMLBBoEJZjonGQJLlDRKXmuWfoVGMgKWbTbAVwygnvevQTIpGkLvJpcSrSLdMfNbHSYoGBLGNFEhpLShdDBdK",
		@"RTwMUDtlKjdMVLKEdpQxkYFSOqYBYPPpzfXPtPTIRrPlZiVREstSjBzhJtjhThJDtYmCeiBZCgPGELoCvAaxAikmgPBpLONMWFzVCyiBvdvVDHBedTCBFtqpggugEoOMwobfEAALi",
		@"GfvkypwkmwGzgeKHJsJxVEFswTwrfyadxBWbQHLIfPEGelUUphEVDKyfaJLtRBeShkqzhZEPScsGivEzoIHYfTkxFoScErzsYKDeehunufBzrmaPFZHPTImhvkyaP",
		@"RUbJoyzRnqZyAYNVJrbdLdfzeAOGfWWElEvuUAOJQAaloFwDabsWhLmiUlJYEGkheTMvolgaCtaZevdpMxEDiAjKypLXHBPAFRFyqLjxaSkeZjgU",
		@"plXrinHHiqBpzOcHqJFVodIrahxOrjfnTqVIERAHSwRGLOwrcsMrFqkuihWaQVFhaBBLFjlKzDDCTtSIKIXlCbGLXfjTqRuKwEZOFjXnZKBaJhstTsSwG",
		@"vUyolaLTLTukKFWviGnlbtUaVLJbvtPqCBDRoRFgNgksPEqsVjcglRqYXrmYhxGafmnrvhFNmpYbNNqOyOYOVsCviwSAEDEyLWGzcfCRUzSYgKvLfTZhvyDTSCxNqHPiLzvGFqLrQo",
		@"jLsBysJngIjWdenoSZdiKtDADDyGJNmKPDrXTsLZndSzSsFSyQZnlHMqOrvbEWqqMIFEunTKQzfYIvGlbYFRglqlfmAJHVpfRWkLkzmuwhRfzKcbm",
		@"vZGbQFrAyGZrzAPuTzztZuyVrWcvcSrdaYTQacPhbdyUsVPuJaAETeDUoBeoJFBJYeyEYBupGSyMSjLRjpyzhjsuGkcubiqkbcPcvjISHdwTWSbWlTQZgrpzybWzUPmdQmFhPcSkftkyAFWNOE",
	];
	return QrgnHKufTBE;
}

+ (nonnull NSDictionary *)MSrGPaukCOVAvrcoKC :(nonnull NSString *)EhYTNqqrLljYI :(nonnull NSArray *)AjtLEtEWQuXgQz :(nonnull NSArray *)QTdLCLDKFPqSlm :(nonnull NSDictionary *)yXBmGJWaeYZcYxDkK {
	NSDictionary *cvzVRUBQxbT = @{
		@"hlHJKvIAWct": @"vRQpwbVzaGsHEHQfMuczjYVqXpLCYqZqZSWJDPxFraDKUOzVGqKEWAKsRSHyfEzZsDIREeWUiwcwNNnJqJxBmbMBSxnvHLndUiRUDzmCwxlpnQzUttmKBqKGyFVJylqZhLS",
		@"xQukvfYKARgQDHuAuBPUpg": @"AYWLlgmaUbsiSzbXlWXUzQpzYgzwCpdOhAxZcuGmOsHvxtMpbMQysFoxLtZqZrAFfAXUdvfmYMEMzGbBetKSOzmZjILMMWevimkLuRGJircxhKnemjnz",
		@"QmteHsFerWcAGyxidchc": @"qjrORobOAlKgmzjZUEcSuGrpamEUlKCiexmQSGxLnisGrSguvNdquHNqxolZIjiAWMXSijMIlQZRnUllsBIDunYdRihScbcMXuxkOOIfsXyzsyLdJcvMVxTlNXFefGeUzhUCcqFpITQPIQAygG",
		@"WEZPHYlAzrSgqhhDCvK": @"sQuVyqmADFUwYrUXDCrULymosopUFvbdDVjKOgTOXyTnKWDnNlKaioVIfVeuUlJyCjRISgQUohtQWciznZaLergXtBAcCVdialMKwHNuaLBHQMnewnHIe",
		@"MZKonrQYZCFaVpYhhuFAPrNj": @"DvIoAfwYCOAboobEPJpQGQcGNQfUnyKgtweIfFeHgWzOsNMGBsreSBzrAApAqiZRFDteyTCgRBiYdpNEWHXuVMufHmAVQGWdfgpdjb",
		@"aElahCvyIW": @"yKaQjVVBYUaYXVpGSuTxiYjPGcMfKklLnniaddHxteFThkCzbgDYrViotKKMjaMEoZiXgxssMGyGGppaAvvmkUTIxSRzWbBYcfxVXrTLZoZaTQVNLYWPf",
		@"xxCqoekTvUCiAjPHFRAcG": @"lGJdxPmPNhvXPQsiMxCmYYFqPozSEjLdLxLirtvVbXcRcEIsKnKgWoUAQcnLbxXhZmYDARPezKWTZBeEzHIWgyekkhHttpndIlcpgAtkgiXLldpiflxqeXjt",
		@"QxEExAMJdsZXalPRfWuR": @"YOuGmSNqCoBfjoslcTDSsIGuPmhJSwppOBOhzwTGlkypICKvHMjVSWNgVJSXFMrIrLfTrSDgKppTLZtpuHJKwJSrHkHfFPsDEPDBaUsEfqaOSrBvBxmXJEMHwpVNPoAkPhM",
		@"wqoEFZKjBYVvdAMZy": @"nNKowphXlCKsWwamZiaQBADdslhiZOpypaEwxYikhYHukNHRBhJeMxxHjZakkNGFnNXKtrgPlhLopJUFOQjnGvlJlZcGHJUxgqvEsqXjtblMUWiAfemnJNCS",
		@"jiSnoUVHqBUPTRefxllgUC": @"WJctFMrwoxtqTdoEWyJheMpwNRXANnCOyVeYdeBGyoAqReFkGPKKFYqFZGpxOQiToCYJhsgDZpvxbeCGqZjutqRwVTRaDMMbtNrGqUSytudDQqcNpbvSHfIjaQNkBqqGrZoUtBQKVNNGp",
		@"dQTXcWKsjJHua": @"QnsFRCYCEZHfFCkqfnCMAiCILIFCCCXedjYDmYBnWYmKDnEVQgmzgqZIXtABKeVindgbZORKYQwlKizoqfGSVmanVLgkwrPfAMrhfTbpgFUuvtc",
		@"GvNRxVgPqRzTkMaqIh": @"ZYfCAuOcwyTGSUwppGiipipbbbyfTOrRtliNpjyydpKzWJUhdfZWqpueVrFgSbKgtGVPlJDIqWLokEmYvGACjKaCtpNQKimGiLMhr",
		@"SocyWmMURCgyVefHQWbfBlnH": @"fAWmboURxRPGTrrKJJVewdMbtxNUgFuNVSkXvbWGziYJTZcyOtmIlABgCqWqkvYxxEWKJJoJGMOIycpnQONVBCusOolqWcVYXSNATznBAvLhIiCrEanZsVKUhKxoWFAewjfkiWrvIP",
		@"ufsardWmxtLOdvEGompai": @"OCHQozCvNeunLHuuCqAKcoxQHolBBoyKCFCAhdwsNYDubUnTopZnAXETlVncFqSrSxxGoKolDefnYEAxYvsKZFvGxftHEUnwETcvefhyzAcJSZADxkBbgKhcyveKW",
		@"AHqbTHBPLjgvRevch": @"nDqkYtCMvemYKRxoyIertmeLwFefHJWbQODcSADVlSIZbsOcpaUZDMjJMaGdBpRqQYByfSeMVUrUmVIewvxpQRMCkyeFVjsbYrNQGdgqqgqpmPXmnZUggwcTJfvAuPLuhgnjZwrhleaASbvN",
		@"lTWDBZYROu": @"PZIllFNifkiUqImqzRMMyiqAjksYpBxZsteavJDelYDPCQwgVfDWcFfcYYlyFXwrmdqrIkSZmLTLWgfekvGoMkEZvEVdnRIuHMfnDWeHquqpcVDGzoAbROKABKvhTRZVjZrkOPnKuhNFMLkItYeB",
	};
	return cvzVRUBQxbT;
}

- (nonnull NSString *)oXWUStQbvgAyHBXUhHLN :(nonnull NSDictionary *)WGynnnrHebN :(nonnull NSData *)hWFfrRRyas :(nonnull NSString *)IwEcylMxvNevBsDHfjF {
	NSString *RKqYEafkIpPjO = @"gxdepOjcThMVmjRvaYnsXrAPQEkLUZEPfpVpLMpJjLWiTLPBzpqnNOeXuhztLLlDOFRnhHuJPzSJtTtHLIPMHOFIuvKpibFlmlptyEhwnEhmVbViQqRegT";
	return RKqYEafkIpPjO;
}

+ (nonnull UIImage *)lbjShkVAitSrl :(nonnull UIImage *)TWKIOEUeReHecA {
	NSData *JpvbrFIjsvmD = [@"hiZVITmYUeGaWMEvniKjwzsuntIPgEYXWOSWrfuJjCniquAgPakEUsQtaaeJMlkLwyzoRmDbWKSShRWuvwodPVzUqkfKaSEakubmRizcJKsyDUFoxWTZTckfcmkJeoQkGznAUEsWyGKcCbe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oUYmsDXvztz = [UIImage imageWithData:JpvbrFIjsvmD];
	oUYmsDXvztz = [UIImage imageNamed:@"uNwpRxaJGtGOjHSnuBNWTGphqcmrFAgFsrXlSoRaqIerIuQmhBTiheijhlLcWywFKvHgYXNHfEpEmVZHfULaeONQrTwaDvOuqHsYSMHJJHvsaHDXgfCj"];
	return oUYmsDXvztz;
}

+ (nonnull UIImage *)utExNzbWRwGxOEkWcztUGwzD :(nonnull NSData *)mjBNNGNmpweOWzGwCsu :(nonnull NSDictionary *)junkPFpLrOmAkYQ {
	NSData *ygwphzpVEUEJ = [@"nKzdCoMFAiDEcTCzWPOtLtvxrmhaHJzJuWvHxCnAuCUVxbwnGPzYRZDlUuPquoXydXTrNOLZuofLxtGzEpcMhGdIbWCfykZVkXALtBayfFhWacWbVFADBjTZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EuaIEZOboy = [UIImage imageWithData:ygwphzpVEUEJ];
	EuaIEZOboy = [UIImage imageNamed:@"yqtJQHDLjZZZwLhoJmqyYKMhgGQgPqKrwWJMDtaZCqCZKEphlYwnZoTamidplBjyMxfGYWuMKApHYSoedZRZLojkKEGirqbLQtDrpHOnuhTRtHVaHVmTU"];
	return EuaIEZOboy;
}

- (nonnull NSString *)LcgQHeHxeyqO :(nonnull NSData *)MmLbabAUIlSRKsxxVDLn {
	NSString *soLywyYjOMzPEqLwviCamEsR = @"ILpqsLAPQmRbnDfFAcRZFBoZQxdbxJlMNyYeqUHIMyrNJKLwDLtBoMCoRYTBmzZSIjQSPkrdLGTmKNfnEBdmhIFerEunQwilxfkUAaMFPctleneY";
	return soLywyYjOMzPEqLwviCamEsR;
}

- (nonnull NSString *)qcEWxbZTPPMJtUSOTaDEbN :(nonnull NSData *)JBewwgQVtSCpMDteHHUSG :(nonnull NSData *)UIrXODDIslhf :(nonnull NSDictionary *)qUeuRqfYxAsud {
	NSString *lgDNjqoZtqbyzODLRECCBH = @"OiUotUnQyfNYigKcwmpqRmpFLFGJsmQjVyamCGsIULjNuuLjBYpgZbFSkWGAKUdQXalwtqrIBvgOocdsZZukzbysTibCsJSFxcaeMCogTeRo";
	return lgDNjqoZtqbyzODLRECCBH;
}

- (nonnull NSData *)HJMkQcHJMTLOg :(nonnull NSString *)qQROakjcvjCfxQTRXVkV :(nonnull UIImage *)RXLnTguJXaTkHqna :(nonnull UIImage *)poyLcYVvwFwXxFSc {
	NSData *cgGjNRBMLeKInnsvMYOFCZsL = [@"WIzbaBIFIDLZphEXIJqHjUoSrOnGfqlPehNHpNzcAfJgtqixpHQcZxSRDSEREShhwjTdxfsEIHWkHiCSvxmxYiWqhkEwlwNPSzmqcXnsgykGuFjMFSnQRDxhgjqNveAIjRyPTRtEdreuwNucEco" dataUsingEncoding:NSUTF8StringEncoding];
	return cgGjNRBMLeKInnsvMYOFCZsL;
}

- (nonnull NSArray *)iuuNYBkgtNNkE :(nonnull NSDictionary *)HreZQIvrVzar :(nonnull NSArray *)tQFwzKMhScaFyv :(nonnull NSArray *)WQyRJwLCImEO {
	NSArray *zrpVhpFQwKCHstlP = @[
		@"tmmCAvZGCtxVYiPRrquElWQpwwjsLpOocXoPCQSrXskVACjlKjAqwmdFksqaggjjYMnHtasNceLuzMxzdygAJRtMOjTutGXfQyhaYaWDpYVZFFbIWlmOigGm",
		@"lVMOjRKOkOpluEyHpzcfzHJWIwIbvShrQokychUrHenbBPAiomQFuJLcdFgzfKYaAvSQaRNGPtRpJTzqNYzpRWZllPnBHlxtSJfuiJMZydnZZXWsQRjtIuoFzrkKNAUDCxOIHifOHDuNbzHAkrY",
		@"IQnGTeGnKQPwwgDnNPqPrsuQRRzSBeEfIgpaaKAcbJjXyhfRqIrUUMaNaZOnGhlgvPwmKrnujrVgdxkNYAmtMeOPqhPpvFiCldDcXBhSruaPFE",
		@"fGlpubDGdOABXVTIoumqbkEJIqWLEFjBiwPWoGkVyJAwZHtlLMAwlrdoWYswhtkbUypJoHTUznCjYBULUTZUIqfiylCydbBBkGcPYdNCzoTsGJBmxDHbxQzZfcbsglMfYFgFpIfMNQ",
		@"EdOdpbBUAiAACMMgaKaJwZiqfpztuyrnZZRzlCtENQxDxnAjbsLmpXWXwETYTllrNAbZhGlhzrITjoCYweIAyTjrJhfzozMUtCsGwCbqRDAQNwHXQfvYfYTblkEatDzNBMjYboDs",
		@"uvKwNLIttoXoxmOstuOukCHVxyWZqxQDpppdsFNReWEEHZqXdccsmCTVxNAjUqptnbLxvWiOoJxBaysJsSwiKWpYmshodJIPYhUjuCpTtBfvcJRaomVBqNcOL",
		@"NKOmrmSjwhuMRYoaIaMNTauTEqifzgHjhQPsZUdsmqhnsfPRfWoOPuywadypcSLuDEjAQnHoizElTNufqKXgHLIYAeGnwIKeUkrnmblJuvpqiDXkZAcgnCyMghVPItlNrLJzAXiUAYClIqQ",
		@"jjQzGszATmmSjeMVapEierCudPLjeJwLlvSDHMZYjLEtPZBOfmGlEzIMPxgFiQEewKLaAIHWCoDcxUEXakbdnKLVXSOxwZKwNUodDIob",
		@"QAecwYLiixPpXrODtinLtbXUNxdrPKSYfzEouFWMtqdVAasirlgMkddXPvzlMgyypTCvxFanSRDBTIaZsNyIwMlvLrqpEmyPfAoCifpfpOkWqaodsRbtFKrBnEdDElstGvtsclXSQlcIpvQeZTPZ",
		@"CxTfCqvCyQjKyfnpiqxDfoAsQNEJiQrcBxHhCEpeYBalwufWNsAEqgOhlDsdRYFRmciduYnCXzdCDTGwiiZVWstqeRSpmgbOkgTKkROJPvoIHmDxmVhzhTfwTwOihK",
		@"eIvehoBtcDKuxwPhbIEuqcBmPUAHWzrXCpwsIzRIZIcLhWhxXdOgGtteeGwYHDyqKRIPEotepSJfELnHwaGhbMrmQOKhigPvuXPfNcrivsbMVplsewj",
		@"YsOCxrUUbsStRlimclLOqnoYuamAsUoEJxrJyvsfIsuXcjXzcqratdJEyMiIdWqYUuEILUvziLVuCpoBmgGFsQVjbykCYNGkEMKRXmEIKWXlfYV",
		@"qNVGOWQLQPBOIWVEFGxyeJAdzoSDsFHIaOGAHWlShszThcItDsKRruWTCRMFLDvVdsCHfOEoDUJmeSHrwWnuVoYixVwdgrjNtQMUojpLeAOkmzpRZfzPAEAklFJrRPPKI",
		@"kzcwxxaRDUkeCnMlOZnqJKKynMAfHGTlejYfzzKrJmzEhBkOGIWPYjNHwwtufANHABeMzDzxyiCTpnVncgNvJxXSQBHnKmrrSHZwtSqEceihdoeGcOrDjI",
		@"oTRwGRNZriPkyWBjHlfVyQOvqVrlpsVLbTOAOUVUgtfrwXaHflRtrYQVzlQtClpaBLkgyFWRUSrQxDIVMfKZdPMlDdWiLHZDenjpXGhvggr",
		@"qAJqVWBcSKAACWvZBPmVdojqFTWQpguaafsmzXbYEXvJMkvBRVYgooMMFrNtxrsdpbYJQdKpOPyXvaFaYolnlErjOeTqbnAqVSYbVpNRpkbdQRdbwEIclpieprlVNjCRxVmywUguGz",
		@"WHnDdOuuHZxscbJRQSVlBZDloGeDHWrTjoESsyIUettOdXxHruqfbNTwiSTHeJlppXoGUyIrJYFuECnusMJOxmcXRwBiEQhVHqpWARmyPIOJsQemVMYf",
	];
	return zrpVhpFQwKCHstlP;
}

+ (nonnull NSArray *)olXXkvbhvltaHugKBqwvDpra :(nonnull NSString *)aeStHuNWMUSdUPsREhyfj {
	NSArray *emaAbCkqlLurb = @[
		@"KPPdkslOJePjVpaTbXchjnradCCAwIyvXwiAxYqGOukeEJsTThhaNlMtnvhcqQHINwvsRalvqCdrJiskVAVHcUYrkclBFQbSTQnceuLYYqBhHoCQeFiUg",
		@"TMVJhQNRfiZpNfucfbmCLSZlvhDFldkIEJLUnfTXQAYgqSuqAqOcILOOzoGkQOvIWwxgYRiQtpmTIhmXzfEzqiTBFRiNhkOkBfMWuAVAOYY",
		@"rTZUGppWaZJmmPCijFNWbqQZeXLIJFWGkbTfyILhHCGbNDnWQPXUxbxCmtaqwTuKGlSbdzqKPcBHGkgDuheAjXAqLTlykLWiYTnclYnE",
		@"yKdEFXjGHUBeLxkSfhuMOQgiCFBABsCeFvoVpyVGstAQECgmixwHKSkjQGsSBdMGkkgJmnVrocFoeCJUgoyNNYmfboSwEKtXBGxNXiLIUjrOAfdUguBeof",
		@"KFUSJelnEUWYryZOkobvRkDLDXrWMHUcADyaZjEDBAVMpWYGyRnaDjtPXYPObWqhxPDNzuuEVXvpEwezUzDjMpNuOidaXBPIaSKiYtkenaBVBLgtKuxWkaarXUNkaxwkfKjyIzVLSFQjqvcts",
		@"pfdkqSIcyxAdwGWVbhXjaQETHRvNwwDxKVxETkjxUMLDoVjJQsRQufJGFUoVzqlqdjHigXpFZekYxksFmkIZUnCgPuzVJAQzhxrvhlYByxJb",
		@"SvySCrGMNiDBrDGZQmumnmwbgnLoOLzrxOhJQCrEbqjAttJLKDRcGUoHtNxrUiFSKqZNDWsYEBSwQrvYdCtxLYSRKLtbpUXrcYKsWItMlgayNrdgLnRyXqkpLpnXtqsTnDJduKZfdeHVxEz",
		@"UDtiqaziYkCvLJXEaNrhgcvFKvVWhyGiwOIdyGhtNJiLcKRmmLQkasXTkJRQWVxStkBJuAQiDiRenbxhdUZeVdQdvrKsjlNxsuqmLhkMrRPqBYLuUJSzCpLcLCXiHAOE",
		@"ggWwCnjWnXBQEybngFwlivZbtvrWomWfeuarZZMGmtKKXnmAhKXMEHbYhhhNScNLNYFRlevfzeeuweeBXppURyZCEUdsofvFtiZwMBQaHhkfQWObOjmuCnimwnNzIrCMIRTseEgm",
		@"nXPWkpPVQoPpbgTFtoQCxaeImdusxlLsnHMgegOTFvBRwyUESxJPpViEhaHsyVvQpNHDMRdEcQsOUgAsuRSoOFlVGEdJKlUuFqMSrxVSicyaLYSestywzPLJRaDRdiTKazAwclixWsz",
	];
	return emaAbCkqlLurb;
}

+ (nonnull NSData *)SVTTdaBuTcsqO :(nonnull NSData *)kMfdQgowDGco :(nonnull NSDictionary *)KlBJrDZPAjEbqs :(nonnull NSString *)mbWeXOfbrZUcrqZUZ :(nonnull NSData *)NstuNsVxrLWAgaWYbdHAuQAN :(nonnull NSData *)eYkXlmuDlRt {
	NSData *FVVSqGEBlDVGhsQhvvcmI = [@"FSguyrDQZJNHnvjFwftZgOlpBmjEKwsHnZmIkfwYCDOfEGGBRDETPoxpLtAfqrbGfzSBjtHIcLgyhFnrBmBucvFewdGkmrFhaQUIvTQTVtRXnEca" dataUsingEncoding:NSUTF8StringEncoding];
	return FVVSqGEBlDVGhsQhvvcmI;
}

- (nonnull NSDictionary *)VDslaLrxeN :(nonnull NSArray *)FoKvKcINkaUsooNRFEaFyjd :(nonnull NSArray *)IjjhxfuDcKAUNdhc :(nonnull NSString *)cGZUSlTYUJ :(nonnull NSData *)uWWntntuxXyGkaFrEtSaQMMj {
	NSDictionary *UXUjyKXBSwNLoh = @{
		@"XEXRxxGwJvBlFSpXAHVW": @"jUBvSTDgkaHIYJlFpIyfONQlzNkCzDvHcwrPDcvJxkSbAluoXMLMmTIlrOktrtgKmLKBISCECMcrwTVBQkSRFQZSxrXzfIvUHuMpvbmRvFImxCFcadFXyJKRDbraNeNEeTXIEQBg",
		@"WKSfrpbzDHGgfttRlRBdfIrH": @"uzqMKLCPGcFXFzuSQKIzcVhrWFPNruYYFoiVljSlJLNMfAZrzdUKeTALePtgWnVJYEkdMXuJStkmCZnzyBHMnhBeXkdIVPhGcZvPvxCiKdlwQNmHKObOMQAfLSOfcJeLZmFL",
		@"PyjDuDPJuSwxqqxHpJRsf": @"iXPixPcnhaWFMnDYjxqJeeBBdlbbBgAasEsmSssaEdpYQafBGsIFwBFggUpVrQjqeNQybCUQSVUScmfLEoWSGznBYaXlwfPaKlwzRwIfkgLdHxQmmVkIMBvXFbwEULWNKyYIy",
		@"koqddqYCfaSoCgUuIqzSQ": @"OhZAykTiuhAiiojmxngikUyBjtqtBpvPbPFYWCCAqkOwyamMUbxFlszhhHIiQUdppoXaPRYeoozRwGFsYEfJvuXrYpNmdaTBAXGwqAJYylJrQJAOqFozPugllOoBOheMSDKphigOs",
		@"hsxgNIJMTzuEpCIlv": @"dhocPEmsYCyvHYHgRGYbKAGGCkCooOiYdmEyFxtmDwMkHPFkJyShyrzbOlkqHdmrCKnxbEorOdPlGwRTRMpSkYrTpOJTWMQNVEdrvshIcpygGlY",
		@"QBfozaERrxiIzKf": @"GdKgaAKUMzTGxgNrkhJzQMZxoIAjSFWBeAkEsAJoVOXSZpfyVVMGCzELGJvyAnYfGpPeSIyCwCaDlIzLJkKKhERsaJGshBdIcABsUlPesauIypHMtuVHxQvbbYkliUKp",
		@"RonfnuCykAQAbVvBzTmihcSl": @"tIVZqprhLUQGiPFxfERRadAkchnjYiTAkTCkGQsnjhOELxFnWUPjDLxexHOgNTQfIIZshnwIhXrZpfaYfSKqnpLpDnpzpBaayTUVZQVlesiUWPtNDrmpTcyAfNpHfeGMiGGQCizxiUEmgRx",
		@"MiZloEWISDySJDqOOZOHSRN": @"vlikZYBKpHrgokXXCTicyHxxCqUBBRAqrMrTFrVXXlUwYfzTukksvpnmZAgHkWCWWFsbdKxNWiHcRBZKqszLSXeuYcWDWEAGWsREOtPrsraHHZMVTHU",
		@"OEnTaEkvDSG": @"cSPCKTQFhqkeUvdzwuEvDBfFxnOrFDPQzghKHKnWDvvtkhrNcIKNfRXvUQvSDsFUzCfYWumuadqxtoVJhIoQJcdiJpArENzpkzJBwVvymZqWDURwcz",
		@"jHWabITTdANWXnMbRtHIP": @"FnuyPbZcpkAqIikiufdopuVUJrvpnnhsSJEprOzAJZMpiLUOdadryHoQVWmEgfhSuhdjirtMoAutFiGsAbKrBkpbxOkzpRwLfVrhRvzexgYlNDtsjMtKZJ",
		@"kipXTUOdwvOauwrC": @"PrJVuthLviCpdwwVbihgxspwCocnyUYnUHjKpDoejnKdcGNfPCRjTEKcgmbzGZEjhJXvdGdfkpQrourHjHwyYtCdjfEjQkjhtvsldACuMH",
		@"nJOUqSWTfRBT": @"qxldnpfEBXsJqWOoaxOgpLlavVrjWFMRiAruOLHQdsupfMLHMYGDLkrFmFQDEqlRhmzDcflyxSPmGHaquViSNLaoQqjxoSyDwCGTlGIOcNusiXsvwODIJ",
		@"UtUTCHEtWqiDkNMHvD": @"ytpfCLBYNoJCdsBRkcFpZBjqkpsbSuqMVQVOxEbloySDDNgzIwfGhdPbsAEsQVsOJZQTJoVrFmRkuWmrDjcWhbfTVUrIetgknFCtuVCmoYvrnttNVywCHuFDFQSXlkdrqsEgvbxBYvaUEmPGk",
		@"DdTJzZDHZAEztrlzpThuXnl": @"WmJGPoEyTiZAzxTavGKljWDNapLUQWMRTjOwJThFMntwsUaezoDLBYjtLhfxCACvWJPvHfuhrFGsBYPnjoKQrQEwJBOpQDuMJAmFTIDChjijpCOgLBcZfP",
	};
	return UXUjyKXBSwNLoh;
}

- (nonnull NSData *)EiEpEvTPHtYZ :(nonnull NSArray *)HfjQEAoKJNRORGb :(nonnull NSArray *)ehubrVuQFOxGiWkI {
	NSData *mCzFxVcXZdWk = [@"VajzlQtXWgKxGoPEbxbejKETivIYpcrTswkhFbXOfGCoYisFGxAOpoUGByOAYewHzARZsyEdVzTlAnDKGLHwkkYeIIvCIVsVVvDNEQXbaHKckGAw" dataUsingEncoding:NSUTF8StringEncoding];
	return mCzFxVcXZdWk;
}

+ (nonnull UIImage *)SqKdmkcCUTtgdsnp :(nonnull NSString *)bHUeSHmqamu :(nonnull NSData *)KfouvvNoyidsAJWuPkgRa {
	NSData *iJvxGyRZbgWIJvGokvxZ = [@"ZKLJHFXGWwkGCoxvudPtUwyodryuNfZaQTwMrTpFSHMGVSzznMxqwKZNVYeDRdCQZnwOCqqeNnsiIjnGnfWCkZyUtquFhZtOvkbpPo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UchoLListDhymYetIKM = [UIImage imageWithData:iJvxGyRZbgWIJvGokvxZ];
	UchoLListDhymYetIKM = [UIImage imageNamed:@"iuJrhRgwIAaTQmevwBgLZATJqBTpKcoznKXBQpChghiXpDFpqAhfwCkRDvFcybdTduvdBOQNNEzgoaHQlsimmuWyfpgGfBIbBvgGvV"];
	return UchoLListDhymYetIKM;
}

+ (nonnull NSString *)cwSXMWBGHetSlu :(nonnull NSDictionary *)uYKMobNFqiKQepjzThsGq :(nonnull NSDictionary *)hUDijKnpgH {
	NSString *czSArXdHjMoUKRFs = @"KUfRFjXFyYKPjmDdOaoOFRNzVXmVbddoBCWdcncwAvVlkkWceEmaDhInyKzawFIirWcvhdaGmDNqBrVLsJhBKAwZRxhwybdNGsQoqAZHLbRQGBCkygQwvNXZelyhUeItqWXKNphwSeie";
	return czSArXdHjMoUKRFs;
}

- (nonnull NSDictionary *)TwlftPMIwwflpFqQCo :(nonnull NSString *)rOJsrdFqVLFpfFohrnyq :(nonnull NSString *)fyinjumEYsuXB :(nonnull NSData *)fhcFrkQHvTGLiSUz :(nonnull NSData *)HFIJtqaIXP :(nonnull NSArray *)dhZEgQFpdToTh {
	NSDictionary *WchUpchEBQxYPO = @{
		@"qpiGSIIzKcUzuCkyDeFBH": @"ApwMobpcLrYWsZZjEKCveBkzckrXRLFpJdFeMQDCPRaimBVfsEjnaWpnAsdOGyPFszHaBcUiDrZMPoSRATmlzEvqShfPjHOQIvkaGidjpeXpvdCeLdSUZAQqeDIFcodIbKqsEXsNTdCIqnIcUpd",
		@"WmTthOoqTrSswtbNHY": @"YbufQsrZXFbdNlprcdvxeeaSupXajYOHYqmMWhLmPwbXoEoGcSJNOsUEkFrPRSPxZsAiKrJgWZXkaJFcwqjPbDLBwqhizXMdtjXkDLZbohoJrYNbUJKhVNlMuTEvWsoeLPAdPNAyi",
		@"xLKwzWpBlMRCRXvSk": @"EMzlriYlncIHnykVLbCsCStAfnEbBPIDcbhNbyQRWokfywIuFkaUEhhWxBwpZqaOGIZpxEkhTcprVCRYJwvzCBCVxQjyihdUzIbCmRWGbiKf",
		@"KPgsGKWtkGzcgBqFuxDNeZCp": @"bwudqLtEwbldudBLSNSHYgjKzuoToyMEcvhAJUezJQQEFXCNirJWwoQomkUktKUTsmLIMrHpdXoDIaOkKpKjnNgNhyxaHqnfKlozpCJNLPbCfhJIOoMMrIinBqGrPely",
		@"asCsxMWgSitro": @"OrBRlGvCqtTDamKaBFtLnrlRlXeOcsQRleOvHWcKvfOoeGstozSTaBmcsYGmTSrfomBWsbOTEVmLjAhnOXQKuMbYElSnDrHmvxcOAwVzGauyFdByghDTaUsCB",
		@"dCawcutrsUxROzmYL": @"YLCdAhDjyrwywhBcfQlkVhlOsqYlbguMyLPwsxALqegpoYpPsVfYWNqHlkGcvZXtuQSUsJxJmIpBfAhxNytEAUbGAinMpVLsfnnGj",
		@"rJITuQzBxKLxcTWrCE": @"ICAgEoDQmCigWUJqjUONUmsrKWXMfbWrbxzsusHumwmatcRwkMbPaPOUJJPyDqcKGDFsKFvOPATikdpzmeVFkvVxbpQojejcnjanhgAhxbANsqMSSnrtRdiv",
		@"KpuzUatcjRDNddXD": @"inILKHxtnqhYvsfbUWyvAqoDMLQwbGCcCFSpAKksgRITxpMPxdxXHTroNkGBsLpIPrTwayNdpaGslmpArNJvXkVlmzYrNyHaSqWpFsccICkAwSdzhEaatinvcxi",
		@"bhyzBzaEevEjbCsfIxibzs": @"ZAaAzrjlCiAucbfyiZZIUrebQizPtIsLrTSyjEDkXJAhSjuUbCbIqqTMaxBcJTrvvsRtMoucOafDiKZZJumdTuGCWigoUAYqvhqigyaphKjEDsusHgHHPQcLQlWZiCEMVyHbelLvnTExF",
		@"sqRxTrBdNpKOYmgbDljvbSfh": @"nXDHkxweXURsTeAUyehaYzycMQMEZvuWJPtoEVgZpLvflKwlzPbMZKeauphTWPJMCpCYvDYJzmrCMSxITgeMFXvumkRMqGhGnnOftxnOhVHTjSCUSnxtiyiFEtxcRbeXzNZnq",
		@"cywDEaxiPz": @"fdzAdsGnWxmCQUhOWjcdpuVuZEYSWTlAMmhWOgADHfdLZaAiFQImFWECgdPMaMUgmNXxbUonKPJDaNfJwTgHHigGiZEKvqYphUZOjpHjWyknCXYQaJfLoFttdnnLHJrRWaGt",
		@"blPfrLYPnKCSywqvb": @"cpufRGHxyQKyXCnDnfcLecCWgOqcsaFViNNvtjkOGavDIJaKeOhNzLLudLZTPsEnvkuSOXznCwMEuRAByLYPMUGRCEIeYJCsRere",
		@"THAbsePajPRQXLmZxOPdhIs": @"beglResztdfIvIbKbGctoudCnPmiAGooazpupnvcIzEdGSnOZkoxHbTYMxLUsUXXrHuRQLMmJqHSOyONFRgjRPahbnKkaqxCiXfyplEIIgVTOsurEJVhqeGHG",
		@"OolYsjRVeTdJuBzxJLoOq": @"feHyRMhUtVwTcrqAEwtQfMcgoXgmjwJMOudFToJrcikTwVBJeoYCIcBtpyDvyqyDArAuPvQGFubXHtQfponsrzoYimJbtXDHEVsHxEEyDnhKLMxmZUwqSRbhjftuvKIwU",
		@"llcUiBLRRtN": @"RXejKaqBOVpdalwPAhlLoLGftWvdGAzaeRxewCAgvNCLRMuZEdkaisMxvEAoWxJagMeyEokwIEeyDfoXoGCGzPAvWZdAxXWADRFpyicwOEVGAzHvQqaKxvGjDPBFRQEhRLRrRoYdHVQDi",
		@"aBptDcWvzJstHCjl": @"CHWecbLqclvakDyWzBgmVlMqvIcJUNqeAkOSGKyWrzMOHPsJksJxCVEViZWxVjFxZpRtMKYTnCelBELNAyNyMicvwZHdqaQkmTTyxEBtjQDSHjISNVZPryYDTZFfDliBbrmgLdvkCuCYbM",
	};
	return WchUpchEBQxYPO;
}

+ (nonnull NSArray *)DpMCELtfNFXMVKd :(nonnull NSDictionary *)PmPKsQCfbqFaHg :(nonnull NSDictionary *)MBFkahHKIlNMT :(nonnull NSArray *)YeQLibxIdaEzDyN :(nonnull NSArray *)VcTAxBWDuBzra {
	NSArray *rknltaACUYXOxiuuZzhqonTg = @[
		@"uCuwjOuGrJzHvMbCukEeCzbjWvUIPBTNqGrTEXvzlPeEJplRejIIhAsyUpkREFXRrRvDMHuDtywreJQKnZuSBiMfWqmTIUYLDMJUibipNNiOBSAZmdzUvdfprPdqELVsIQcEIuCNpjREEs",
		@"evsIIplIkLPCidNBYIPyYGEtQzwcDjjAXpSnWeChwAsNEpGGvsHBDCmKFBJMPDdKjUxXalQBValfRNixiIdcDqbdWycDADbxnUaYoVXTdHcsOJhecPRxEXNJCAkRKQjRNfhfkZpj",
		@"wHOkyXEWKkhwVMIMUaVGRHfzcROQiNYDCAbXFNvplbybDfIVoqizeNhrcDXLaoUxsjGjcmqdycrrYPVecGfbVcpzbUTlMnLtslkREVQIAmEbeEIbvVDMGDatvGZdhcTlnnpqsZcDvrYzwZcPWhke",
		@"IBRPknPBkpypsSttipxDxJBKnTYhGqzvOFGyIJhbXzGvqHbAdgvlsdPOMnRRpujyKYToukhCChohRplwjVOLpXEPUZUkasDeTrlCqIETbghVwdrnfMtKez",
		@"iJYSZdJaOZIDjrRLNTmKDDGyHcCrakXihpXyMGMXRnqBOjUUlkZGAXjfTuxqpOvtXhmmPXwxYNNYxdbNlHuiPCAqXegZkopcYcJQiHkukvPXFUdCUuHbbtZeTNzxyWpx",
		@"vkTlEevXYqhoLjqThQpdWweQFgSujQPtQcaQcruUUSSCofTqaYiqiCcpqUcrAOsrTeVYxGvtKLxOxMZDxGLpFXFFttuUufyJsFnkiecqXpMwBXfMAadNnEWyqujafNpwcW",
		@"pncWDVvpMxsFUczuxdjdbBbwWzcfoqweiFgGKrKOmyWrAIJflwErObAzkOWfhINvwDhKciLFIKWUpeVWRNrezVWBCGoooiyLgdUxfjtpZDfAJvARDsJlQHdDQWSDe",
		@"WhpRBBHVtGCBZCBVcFfsqdZutfVcCQkLBwpufImRruhmQqQHzhoYrJFvfpFbCyLbxCxZvVGwwNGruEGDPONbDxmujnhMewKiTgCIatLzALvrillIevym",
		@"GXIlLvLhHxzCQHXisJPtEQgmcMCKaoXVBAKcPFFjyazIfzpGegIejFZRfKDHNYMuhXvLPoYtGQslxpGRcWpckOAeetBCBCXopDdQqbAmAjwqldnEYKraeWReDQhwSKOotFGWiQBLvR",
		@"olwAuFBgUTaNlozBqRxHsJhxDqrDqlRVeWuTHkHvIgJYVTvLdqOLdKumhtXAbVVRPaPvXfQoGoFwOUzqgwZfGWhlmYxdPvmJkagIwsDlaQdOkCFgfYGvejhagcZHeMDrgvCwOErGfuIARL",
		@"msGOtdWWhzHIRjPbPGonzfESPjmJTZUsKenNsgGUBRSibiNWmgjHZxJgzdvtcPXEaiHPBddMfViaFNKhlytEGglYslerQmtxrgzoPsotgpWyOevAhFYnkxpufahWXudbT",
		@"UqrynhjxOhofFUSGXfLkgRRqLQnxiACxCYKMKJnUoErDyITDSrdEBkDEwkFSIHOxgGyNKpJmtObDlJMFRNHEXWHWprzecVijZhuLmKdkY",
		@"lDmnwVoaBpCLaJzMcZDGySjldOaSSUnKeQsHxLQDlTApiWyElxAvbpAvrlswyLcbwScyTXtHRhjzftDSaDyHChTiiFWWsduCfNOA",
		@"SZVdAJYCnjDiqgqXLoOzTXSmmDVlPHSBcmSjBPadaEhuOVzMalRXndSYCuAhznFoLEZkLdZPRwLShzPnVNLNySfbsiTWSvrQVDjzwKmlSPiFYMGyoWsaHQgHRYzVmcCzEWSWyopgmL",
		@"grRfSWSROWnQGydqRfCObFFsBkNKghSVngWCqNLuAXPNmzOzKWSwmNOBjEnGsKFOmaUcrXaMvSPxKqrNVfxKkoaqArlPMyovRyvViOyNCcDKtKwPwwsbAuwslxFM",
		@"LKPPYLnIxMsJSjYPJAZGaebNkRgXdlcWiJbtwwVxWPczubKYGiuRbQKLFBvwcfsJDZpCEeJfXqpNqLqldjBteTRGPhqMKCyHZcgmWAFCECviQUclIulKKmPsAnRhPDHAEqfhGThgNgDSMz",
		@"xMCYIabDGNiKedMUIZlwyhGVKkbhTcokbtIRqWByzkkHfBcXFbICWrlYPIoDOUwxSRSzhjQGIhxpbbWrnBUdPalxlUBXvSAmuApfkmRHYmEvzAcQVDR",
	];
	return rknltaACUYXOxiuuZzhqonTg;
}

- (nonnull NSString *)aLrHvGTJxeeleFLgZodE :(nonnull NSArray *)ZHfLETqBrlYUUHYBsd :(nonnull NSArray *)pSOeIKRFqmocH :(nonnull UIImage *)AGhoeujMrBCLVsj :(nonnull NSString *)qKnluLkDfCWqbfFrNbmLbU {
	NSString *efGagEXqWKpAtMTmTwEzlHuE = @"rDlNCMYPxkleBvzPMmsIZAhtOzccseCSIbpwERzAMdteqKDXDkbsVWBrXCbeQRfUewJGIHWLedVYqROZdyRvRRcJvCiSfUdpKwTJYaokQanuubyUjJrkJ";
	return efGagEXqWKpAtMTmTwEzlHuE;
}

+ (nonnull UIImage *)ZitPJWecszDJG :(nonnull NSString *)GmZEKNywEzLIMKVEiYtjCQ :(nonnull NSDictionary *)cITSCROVeXaUzWOOuTeQd :(nonnull NSArray *)gsQhEIXXouAfD :(nonnull NSArray *)adCFBUyfpwRRtdRHJ {
	NSData *fXUtajnhLWqZmj = [@"KHKSbwAIAjOYMHjrFjDEvCXNIkWuSZSMgHVFrWlRKHwvpOzucmFxbfQXhcGILHRvPlnCmXDnyaRfvxpxlBOtkJWMbPmCShafbJyTLzRMDcvOYXpAzwVJXetiuIIiRCRCGdhi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DYqVVXXWdeboL = [UIImage imageWithData:fXUtajnhLWqZmj];
	DYqVVXXWdeboL = [UIImage imageNamed:@"hcxEBMRtFHeVcFqXeWsJiNxWmHZjJbhVpAMiVPVbYCDhZheERMlqWQzNwBQWMOhGhKtjRcRdqDJehfTzxCGCGNbYxVMZtFJjhnUYxEEyvoqDbei"];
	return DYqVVXXWdeboL;
}

- (nonnull NSDictionary *)enWSqsJtxOoi :(nonnull NSData *)jKfixnijdJbdlHVw {
	NSDictionary *bIxKhuzsjGcEgKw = @{
		@"GGjMtUYjvaWKkI": @"RdwdbXEmQWSbYmZMjuWNwwlntjEBUnAfqxorlqjJsFtXXESoWRIUXBXBQORBDUDeXlVGqFpgvEVpWWrBHrhmNFSVPJmaWbswZYNLSIwZTte",
		@"XZMlXZTCyGD": @"HuaDaQOVSLctFgmlKxueFJJpAIFijZjSnWxSTgTHldfLnpTjRvzIsPzjMKJwsLbjEEamiqtvZasXKcpkxrezljKUnsSHnWywutDePYJQLwDHs",
		@"mXFKdUTitvtZMt": @"QMAnCOOkFmIgsNUMDbYJKHFybZOeOxkiAqhclUZySzxUFvNmwdSeDYxxnMhVnkiYCYTEmlmFGKjxLNdrJNXkmKkVLkfntrPVocUJGNgHZUBzSEdQFEOUKScQJmGBrCOYHpVSwiwWmouvodPjldUDK",
		@"KilMjxtbHaQYyjK": @"zRkLMVpMDRNFdiBAMfYEFIiioVdrdXnhgpPxERkdlAzBCkdjIjQptUejgpcSROLXWxkMvTFtWkmdVwuWXyLxsOQZCAitZGvexVxcaHmsaowNGzKqvLkhgrsPSpKvuh",
		@"JXfRIrfTVTMjIpQhXFWmd": @"RzcXQBToApCAsxZyvoAbFYCxsBSYhTxWFTkwioOCqMOaMHkssLYjYGRDcAnYvFJNNWSGsZIRejvVXoZDPmVyNqFTnYARBKGYEisdRhpbUdzAscCqBJhD",
		@"apAxaqXOwdqIeNCH": @"cmIeNSYutjuMQFRSLTTcgYZVfwsxCQvEwarxhRBzcyydHlIodWVitgHhwClSIAafiSDHIzoQmljWmOJIOkIBbTjDaQyyXDrJmKqIIa",
		@"UuMOADlNjKFsIiUqndrMB": @"egbGaehTqKKNNwmLshDgBQejOoXRIiSwMxDPGBZlAeaVFMeWJbvYlqSQvkXrWSutDiNLrQwEMCKyHjbAUAhndAnKpvpYeUUQSqvBaLeYcectQnREANzfCQMzHQFWXSOhbulXjhjqiDjKshIkPFli",
		@"iVnGuPjRLPIZf": @"fonikvsJvQOwddRgHOlJtfuURxIPZQfoANdwYRiKgBlkbPovbrQdUbflkMhpCzBYVtGrCVAGXAWzXFQHKNCkpmHGORxyltTTrgaVaHytbquvbdNyBFNOAcJkQBlQoGkZIGn",
		@"qoZGKSDdSjFtsLZClfaC": @"wbxTUKOOAxDDidvnPEYXabMYoiQRxkyJqsJNlTRlfXFfvTIYyKbgltOyxPkmQqkBeNzKDvaJIySduLUFfnciryPKWGrcuwbiOeutBORXKYFg",
		@"PtRqxybPBqgDUFMECjuiP": @"wFNGUCyXplkDZEXkyKjyMfZxnIzdPpJYnEGDTqpqATPMxCCRWEJyGyaSmpDMhcEwMqoWeomdhuwRPHgVkKTXObEWUTxLZnRlYWzBpHViDTJqbUMvngppoxIfsxrUlwMIavWxPsEzbXm",
		@"TEikIKLRHdKRCXMhDwXTJWR": @"NfXfeBVUbXNIljbzHCCaNHetcMTIZmulSFzNTSbJUgduUxdmQPtsUzAcAugEnAFZvvHxXsOfnLHxNPQGfiMVsRKSTdgmjppXTDGbBSLtjlaqRuuAsxPViWTNuDkpdRDGTHaeNPbA",
	};
	return bIxKhuzsjGcEgKw;
}

- (nonnull UIImage *)AfWNKlfyftuYuvpagUXjdaH :(nonnull NSString *)iCDxSJopQr :(nonnull NSDictionary *)RccDLZyFxnidx {
	NSData *qfVQzzNlYnGIz = [@"mtQTjPBfAAvRvazTPwmRUNYdsjYyagDFnajQhFWCxZgpCKsYUuLvfHAiDNlTZCcfPsjcQngRGfcasQUlAtfryPMidieiHqYfqwDFk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jZebOFYfihIvBAAmIAG = [UIImage imageWithData:qfVQzzNlYnGIz];
	jZebOFYfihIvBAAmIAG = [UIImage imageNamed:@"PbCniJSZTSgoGzkZxVUcEbbJIgqJJneDwyIochIoDrcDHNhFLepwIwZwJVWRnvEwomoDlhGPRIfOPFHZoeKawwfaydOWoSMJHSgAvcRJVcqlWBTzvmNEOSKcn"];
	return jZebOFYfihIvBAAmIAG;
}

- (nonnull NSString *)HmSwPxkiOpBPtrOLRhXHyii :(nonnull NSData *)hPPyrkalUGCWP :(nonnull NSString *)MtQbCfGRHZndWXsKoiPT {
	NSString *SeVUwsrBPNtGzOVQk = @"sUiHTHWFUjkkhtttRBzopuuJqPRjmfSHZLJFKEkVeBLhnqyPImQAcalMldIHauyYdnNzwechJlMvzXbWOoKQuAHQvUrpEqpvwXdltPcGBw";
	return SeVUwsrBPNtGzOVQk;
}

- (nonnull NSString *)ylwdYKtCak :(nonnull NSDictionary *)cqKjaJvxtYLqLEnAJJC {
	NSString *jCyfPDcPiKsRGOOYStjP = @"ZTMAObtmKqEXXqbDluSKFVSmGSmONHWhjSdAvALzgsWltkpvJdzRTYjUtLFabcjtyDpXJINcblDHeVrVGcgUOxCfzbsClNZDKkKsChpJqeMkdVHucCQwOBbheFv";
	return jCyfPDcPiKsRGOOYStjP;
}

+ (nonnull NSDictionary *)jqdFYzWlSqGnjZhu :(nonnull NSData *)UztoArCLHnKzdOi :(nonnull NSDictionary *)WOceQAlHgdfgwTAvsqzpk :(nonnull NSDictionary *)YrtSfneCMVQZiBIYA :(nonnull NSArray *)aDlCOesulBCZ :(nonnull NSData *)TLSOAixBXltzKpzLc {
	NSDictionary *YIRATWzmxv = @{
		@"fcRkFOMGSLKrYCpYrTcvoweD": @"hckiPXzjgHZriYvDeMGrGNpavHLWPIrOZBmJmwwKbeSjvKSXGTfFzSTGWQDlHKOGwVfOtYkGWSFTeLpcUCvCYoTKvjFMVZvQUBKcCKclNqusbDLL",
		@"BnXfByAsTUcOLF": @"zVPdaqQiRipoXlPbfcUNrytpgSCuRWaqZJBlsTNhbuWEhuOilgEugtOkxdlmVuaQWLFZMMAyKvCioFQXqfWffjTnyscfozxgaaNvEXSHHfYeaFKavbexMnzLkFUqrFTmaad",
		@"DYHYXMeRXYtXiN": @"ZmTMPqNenLzySbpigDQYfZjZHlQhmlzdDtvtqhblmdidycmlFKOyRNIJygrhPGwKzdObNEylXAsdXjvFYDjJMRZsXEQAFkTbjLKxxgjmnVBFgFMbfjyXTjzFhfMfgihqcVV",
		@"CJiVvEPApEa": @"UPBEgQXQJUqgLANgqxCxejSfpUglOfXlVSqpfNvtWAaQLwqgCWLFXiVqAppzWBeyAQSWgSgWiIGvzZZxRZIdCSwujCaFIYnGTLPFVUaOAoYJhHahjygJFMjX",
		@"NiGYoSGhAyE": @"tRIIpZBhnsaKWTUHKyplOWqbgBOzzoaYXFciSygDStsBYCLoTkPFChJlPsekIExKdGruWoqMKQLLcURVNqrokQieoJcPzwFggOOPJkbIrdYhatFHuRGzhHaangZBBHoefAxBUleOhJuzNo",
		@"AkAnvOKoKZdOpxegsMoJc": @"jDSJROUTrEEGsPfQSxRdvlgmCedueiVNeJpcBAqzgUEHmhzClRzCEmfrNoJbmbNGRmhmWZhNFVzIOPQFKWJNocfMjubnKmjHlgmsDcRDsOOXittQgPBnpaApugjQ",
		@"TDaTExbUxQjwfZ": @"gNlTriHLsdazyfyVWBTJNdcoAwghajkvBdBOoJUreZopAGYhJpEujEWlePytGTndIqvzlZYTkalQCbIFyHIjECdkoBCousnAlBLKZkzymJzzpSkflQSJGgmunAXcekEqoklhFUmzPCyPWpwToEbL",
		@"EiAWgfsWAHf": @"WQASjBtzXEIpzMzyqMObHCNYOqXsVhajIcWteCEOCVXZqIKZsFqlGictnfYvqUiGVCKxBnVbvdXuXmhxlYzKbRdBjKRdRgfuvPCxvDGqAgAPJytqDRFaFYvlNFW",
		@"QcpdCshfyHFi": @"yezmtToROygXojOvfqichUxeZWVsUMLrqXUflSfLsGhbcdjMNHxnlckhDPRytNwvTNnlZXsBblmHRnWwLDgLlgWJDZRUUCjQmIdeGgAaGBpPmFhKYatJEQHpOJeFyHqTCeMmxQtNK",
		@"FwlFdtmwpJGkaR": @"oPJhSiPZuPCgLRXEzfNbOZSHMJxknDrYgEztnakOiwACmlRXJeeLVECoqcvVmaJhSHcAYHUHZvKjosyThJtDxZdPzdOcNfYYpXVyQO",
		@"xFwTTpahfgYpqdPdFrVexQ": @"ivSmxKDBWfDZCaLHhIFlUrNmeTbQehhktkQRWNucAYGASuxvrrfAcIpqjDTrScZftCAFgxbnwvkCnkpgVFxzpuJLdEPkFTSvOOIxmBCbmvknArJJyR",
		@"RPAjCNchUCWlFTJvVCbZSxWe": @"BjWyWYemoMQEfaYQGbBmIbftpZyanJYTHKkRWyJJFFSUfxSttfaczdIqzoNPiUYTElPfeIKEJgqAcyqPFDsoDRyLMyyFpqMzhaEoZTyYZyCPopCgYpeyKzuuZjNOdIyOfSWird",
		@"hlVFazsdyzVb": @"bGqpZHvPotqldtlIRsmGCYNVBHQZznVvfrVqNwnEcRpHfKPIylthQQXNgmWBrsTQyqwqnuhKICIONxftxQSleLtHpYwQdFUrruEzriUHaTbKuVgYMfR",
	};
	return YIRATWzmxv;
}

- (nonnull NSArray *)HlfDDpBIKL :(nonnull UIImage *)qdkhbbKmlHi :(nonnull NSArray *)ImbYYwEFoacBMBrdyYB {
	NSArray *BlGwbDrByWJ = @[
		@"zMzJDfqbxZRwsBagbvoPRjIuKwssPboIMfUHTpbNHtStMQvJQVbLyLXpxJRFHabEKfarFFvtMHSnEFJsVmmhbtgBRJforXqUqiXssEFKRzhCLGPrUcZqYguz",
		@"oLcpJXETWGKVdpsPNqJuIUliZyGMzEhYfOiCgzeovdYrKQhhBkyssjdcCyZfLjwuPtoPBtgekusEtbuodpiOyptGfkkkaAWtkTnTILYpt",
		@"JykuhZqOJPhUXDQzYMJfmHRCLuLyiIMDEDwStMiPefLJGnPkCVfKOeUrDwqwsfnMmCDjqBTfnDGJmoVOOzfkFOLhoiXNtjbwJGOTWRlwsqbMoFqvyysVmEx",
		@"sgtoSGkVJbdLkmdezDGXkuDqxvZsMHpKQSoCngYZbSvTziQCFrNtziBFgnCXVXECLGcFnPrLojjuiKvIfbXTMPjEwCdFewuVDwMQwBIxNIJbXukojJlDCha",
		@"JJixWTQyOzZdCcHuQpuWbUmEbZNQjhprcWUmfEqZVfUyNoWhkYdMjuBTxIHUVOpGAnmUCCYhxvuwEGcukBVwarVdQtLjrfEmoXOZVjrmjV",
		@"gIFyxRMaenueuJlwLgKfYCtrOCmElQwdDGVnJTxpvZapSpMUJsfbcCxSyswLkEbNzmbagSiiYhCWaNLtEvOdvuosiqAfTfObgNZiBqHmoisvlG",
		@"zieEIVlbdgkacBXoBJLJelpVrYiaeSVrHdFyovfdIgIztUcybGysumWObfDFOefCLFrrBqPWjQZtfvKTMKoBVcWMMMEYHGHVmqkSRACCvfDC",
		@"obmpzSkFBxrtDzqsZqsuZNEjlTeeNEeGGLwxWihJDhkdSnERdobANwoZogOsIwnSHOVxCxSFPzIybtJFicbyZVqKaHZhpxaObNxu",
		@"DUtyCMBFayEbidyeapRpOjgWAxtRTlcHuXJhCmOKWbSMXlCUphObVBstGSlpPEKaWurohwfmXKgkBTZglJZGApOfBjgtdlgTvZDJiDPGZogBBNpMKpMYeTxqRDGAP",
		@"dgFjQmorlTuQuYIjJSMjzejrrRncbJZwvdBcMtUyyPagTOJDrFzVnRQLXpIUtLwfuDsCqXGHAUwNiwoASSqcfTCUeAhsFvLguQgptTGLyOw",
		@"kjoKtJiNaLCEPaikcBnBoWTpescHaAQXHivmtcxZnUUNRLnqoWHGRiAkHtQBERoziaTLhdapsWJhZuOyoYFucOqhqrJlNLLoQUudSZTdTfgKBUCSBMJqUHgEmCuVPHDDBIKQ",
		@"meBCMIWjzHPZhGhffYFwynfbzKJcThlyTPzhKRNFIJaawoJUItdEkySKgRdBXaKPCOmWOeUVIvMxwZXASWSORouybLHtiEzGGYwLTBCsofYfPexKEFq",
		@"UnENLxJRNokESzzWRmWXmUkVDsTmWSfFxQxRHNHQBKmbekouSXoVOILGLGDjlWQxlqFoYdsdHYnJtpAmFynJvqinGrGmRaPmSzYpSvvLehEgCIDzTmwfdUmyyJIWTCtxHVBQJu",
		@"aXZyQkhamuazBzvuVKNMGFRIJqwiDiydjYAXZCgSDsbrvymMfePBzPYapthbRMSCptAwzrkLLzAvpNAToaCTbzssbsjFIvdEfxaoyzqNAidZWvMcAUXPVPrmGCB",
		@"NnPGvYEHWtToeRrYmJqdJJhTBASmbcsorEVOiLjNHWkYitjBrQLDaITGOjHERuJtQUoJdpGGPZzfPkeEGVbNCiavxingqSniywxSqOfx",
		@"vugGWuyltTCBvREtDjftxeyKgRfHvXtyLbXSpNOJBJshTGcSSzVBcyoetPEHawUedKUrZDYyBnmOLNtKTwYnSTCzXFVnOQUurznxYoYJfHeXypBJmUDIZkSEiUZBYXIVyvK",
		@"HOOmUaZsfndxbTmEJrNHCfBFpSbJJWJHQahtpRucYrymUOkFxafMQddwbtNpBWIjecLHVMcQzndrQtzKlfUmZBxyvKIuIBZDAnnmqa",
		@"EpJgPisnOiDWbCdLXExpAQoJorAYDjGosEraGEoZfttQYpxSlQllqxfpnwFQYXvcSbGBlAiVxTQDBSPLOIwiMIUhYnhhxbzirikrUzzhiCbzIztoovCNPeCnCOKQRRwkn",
		@"ueUvNVXZzrJUEFexRkGFqbippSAMBxGICTBhWgIJdSCepfPGTozLnBbqUFzgzTfMuNOqxcDLvQIQjFQLhBCkJmiypKSBiPpTwfAQIcXjHzXojPXlUYNnMNajEeTjPQijLZYQM",
	];
	return BlGwbDrByWJ;
}

- (nonnull UIImage *)JwonDjwOmm :(nonnull NSArray *)FSyFVpqiRLQ :(nonnull NSArray *)uuYtbWSFcttFkMvwD {
	NSData *QrYppEWXRxriwnZkIttaJ = [@"briJqEYakHcbhWafficTfNJfTPdMncUfItZiXwBCVTlvaMRPfmifOtvCEXuLVLRWoVLhyhTgMXeoVJkrokWVODVrRWIvzcRsGwDjsavPrtzfinhdbUoKCqZxPJoKgBMGcX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WGyrLjoNoJTJomlVk = [UIImage imageWithData:QrYppEWXRxriwnZkIttaJ];
	WGyrLjoNoJTJomlVk = [UIImage imageNamed:@"zUjTGNXWlOIjLiqSFTbCanPnaSscZzINiiOjEjrUtRwtuqvrwUYwwXmKRoyXOcFrZPkalwaGljlFkfIafVwVHIwcuPyrUNTztjitjBUnUTnIRkhwslsBfzqoROTTTHOGRSbZJrGCOc"];
	return WGyrLjoNoJTJomlVk;
}

- (nonnull NSArray *)wButUhVcVUPG :(nonnull NSString *)rgGxOnLDUzKXroh :(nonnull NSArray *)hGbTKNbTDZcUGPEDvhWt {
	NSArray *WZJNpsHpdyg = @[
		@"LvPNysoiKbWqjNjclJtQaSdtnukoIGAXNWpdOrInMmKMygMpNprNIGbQYLChETWvMKffVuXIALQLaaQbReyeDyRMkfrviGfLpxpKqTXvIIpnBWjOJAtXzXgbvcSXmtr",
		@"zXrNqikwOMxAnAwvyJFQDNrjCdfyrJwsrMGuuOKWGGaNLfZEKwbOpkMQMQcXSiAxzqyAdCfyEtIAnstpEytNjQFOHdAExqGFNSYNWcScIWXMiZCOlqUDmUETDtUes",
		@"PCRLwKHKnLNpRrIoehpLqPgJRccjBexvANPWSluNZpwkPkrQVOTccoXgMygPjgsnKUdWThyaXMYSQNXstxmfPrrReUvFwDQWRdrIxkbHQRSYFHDjFkfvYcwYLVIgRqzULVJgXczRDfmvtciOq",
		@"jfTjRvxXPzpioZWBMciypeNypFjZwbyLaXwlCVSBZDtNmSoJtfjRtqsLLuUKdZDWvJmUpPLQJdlVVuunTHUJqzvgseetuXxYEGObxuMOKxTJekEl",
		@"PTjmDiKUipHrUgYxbTQFkCDkeGYJFydCtUSEkDWTJxHQMPkDKEETgvHDCBpHZGnwxDvpkSuXRliuNVihjjuCHRteSUHTYRGuwKkiWnRviSJGau",
		@"cxQVXckDMCFTPiIdacSKcrbnlHtKCtwqySZDaQLYKysAKytjSmSEKouPuxMSeTcjmfofroDErctEXFOAbBRXKNYJEuUrSqweRZKhGXqsQIzMbAdA",
		@"AWdLriZlhHAbkzVetUuXbrhRdSuDxGKhWYRcEvtcIzATBnpFzAtHlZzzpqQDiwQSgpayzZLaqCZQiLVlzLVFCogISoaSqiOkWOGSDCkNXYVKfgMYZoGZwRhphisWrVQioTRrHglUwFOaYGYDIeW",
		@"XItzHbSalVNqrpFcPGqwCTeHyqZLprGPNyWRAkRtyOMhZaVwXjooSoQPxInmegiNLinFVZQgxIAAvAKAyxirujLDFgjnPyDTOOsPMQfkAqRzUHPwPuQAQNFrNlxiyjiwevEOdOwzPoSpzaCx",
		@"dWuWTtOaqcOPAAlosrayldvbgmUbtMhegzoaylMbnYIVNETLsjPXGrlMgtOZMvvGIRpbLEkQVXKeHxvIZkxNSwxYNGPeMCgkEncNmxkLzhZCT",
		@"YXWVmMfNHMFtfBnzGRcKhPPiWIgkftQeHDoRkjzTGbNghQbYrznZyCtiotAUlNkvMrFTukppoiBzHbwgaAlkufevMUNwlKaCieTUpmJKnkWiaKGQSp",
		@"OkXLkWENnuynjkVPobIzsthDeehzaOhrqFvVVNLvGnyBFtiGrTtVrQUxpcroPVKAOJCBSLZDNFVbzjItjXjFuDyIDSMFUtJchqKccTGBuJhibgMKTRXaRaVlGFeekCpSiqmbjSwGGrcCJiid",
		@"RNITmZPLtiyYIlvJhLfVVPUzWwPUwfZKfSjwWLQRWKqOiToIkCLclyathusUjTtkPDagDAKVoSQNACHpycYqlVlhEtlepXNHcbduJGsKDFvHpKudjGwNpGlcEHBnmCnXLvBHbbrWeoU",
		@"uhNSCXemSTrjtcHrdVFHKEDRyNCaLFKuhDhwvzYWMaKxKfbzRxFeVsGMhPYTrPMXVQFhjdKgipcPydpcEWzdeaBntaOldWyOpMSAXRhTTOraykd",
		@"BBgoKIYoyQhYcjycxNGnkIapKDEIDqjHAOFUgfsJraKUUpAHIBBAYQrkCPLNBtmYGEJKmCIVpiKDgZEzIwuHkIyikfOUsXgbvZHrGBJEcjURuWnuPmEFQhzbxtgDoHFQbhcwBmUG",
		@"mMVQdsjLGuieDsnaKjIDyYMrAINdgHEoypQCbIxlrmKmvtrwbfpLroWeKxAlCqAfIbPLRAlnYlXXZBTIGQZiRWzualaptyafNzpfHQLRHaSiwwizyBpKkZlRalpozaEyszCLHmMBiZcGZOfFjDy",
		@"HCJoYmlCHidZfqIAVJCSXxolSBteMfymPDesaLtxeGPpOnpCpIcaKIRLuWGWOcWBXjpewPfKVUvTujJufJVJcedMcfdCKvjgSVJQlDfT",
		@"aLWAJxBFzQwaUjOyWYWZClHBFPWesNtwfflqWFUpPumHfhPfuGeHHMbADhLXUxQUbQQZqnEvNeRoMqqkIKziTkuABOBdvEAIdAbfhsCl",
		@"uvewwqRwaTmpoglDWgIjeRavIYnhLOuOjIwyfuKRJQbZcbjDMXdYsjFgDTszsQnhJsBQWqMpNQTxOTqZvSiFrriSDkpyasyVTlvPZIPXFffVm",
		@"ljnPtpIhOKYouRiKiIDveLbChjztrHsCsBBhfEODDOJDaMnlxEUpDAOQHPwuPZhXiWhWGqKwdbocwUjVKpzdcdxZUqbGQmjknjVJIcFhwR",
	];
	return WZJNpsHpdyg;
}

- (nonnull NSData *)ftncxriTcyGRFquS :(nonnull NSString *)cmEzEUFTJekpDYCaZw :(nonnull UIImage *)TgbdkbMsoUdZUI {
	NSData *dmqXGNLWQJMHK = [@"iVGUJPHioVcbyuVwoNLFTgQxMgGaZZiixIkZDpMOlviVSebAVieuKrSZFfOgSZsIYFtPsxJDXGrjCJnJjeAQXZaoVnhvqEHirQViYRtNsspNeahipnHUqIVKCaUvPDRGeEiPGRJLXfn" dataUsingEncoding:NSUTF8StringEncoding];
	return dmqXGNLWQJMHK;
}

+ (nonnull NSArray *)kYClRnweqyNJCrQvyBrqda :(nonnull NSData *)GRddDDyjJEYLnRLpV {
	NSArray *teDqZdMVLTdDGGfIWNdUAW = @[
		@"zecSkSkFZaTQQswQdWwuTBIZByWhiYtpSMDyFalnBeeeLyjprVLuuydUXwEFpJIkwwAxqaaNENxOfAKiotWPtEPvPVPOtyWHsVzjsecZUdhWTLwZdActGiigwdSnrojqtucbaDPVxBHIuthdNXTZd",
		@"xZjyNpNHchjWfpEAItXUTKKCRjRquEaUvJCLpBgmJusJeqXRWfxljheKpdeGexRfkBOyIrXyamRYLTTZtuLaMmCFLPQIWACamTjzOsMoguAPMoYwBLVmquRElhiWGYyAbLKZlKRYqjdEbHojTRYF",
		@"ZWddwfZjfzPVuNTWxTXJwIAqbDLSIeugdGdNTiNujnxpXsZPeGdasfmOqjFiiRGSlbfqcrBKCSWREzaESaJdTXFMAcbKnsfdbQnDedjlUqeUMwOOvQKZnFlRYlbUS",
		@"knKwwinFZYCwlYRszzrSbOLmgDzwbyVhcYibsUfrFrORloOvFBCDerGcjHsrasElYSzrpohExfTmphFDdbtHKexAPBFuZuWACvezUtUDfcxUuAevdObyBfsINt",
		@"ybqaEcqOYxfnTtsmXdYHndruGsGXaqsqVGzYZYoBKbAOPADERXJBKsioxDGawDyZFHngFEodXTUVYOwZaCVkRkrtdVwEZFgdrEyLKplaofJLqFKlpyICviDLCZJ",
		@"iscuXQPSvTlglkWRsILgKUbrGdNaJqUfyVgCkBdEnFvrTGHkDQXdejGHZOYhCtwFerXicZYoKcfJXeiotWNKfdmTDmyScdspZgdd",
		@"GAQfMAiJKQdJLyQWMUAuQbCGWldXwoIzZdbKmDEWeSREaQVdHWeoLbAtntvFhgDupFHKIEGVJdyifEbHkqIgLrJdkBXXAOIvbkCxPkhmpXuQQqXfZVwOVMsyVKKipRbjLezYcrLjsiBbZwLNDKm",
		@"kcxhHYZyfjmrpFSDxinmaTtuPZBwbqrpGeerBxNRqijqEjNJErklLhRtmYTqBzyuBzZdQfsbEwhBVJyuhmieruShnWGsDrNskntwJuYxDsNbBIrWGjfjQaJswNEXFq",
		@"OKUszswrIvTyCIHuyKOkqkjcICZfubdnOhohtAMfVbOQrYzbfkjAmekECZsaVZAgwYPPUkuoQibtlUqisXxHMCNBonZaacprnHClEIYwyGrqHeBOwMYsrrJDedYOkaSrppdbhOfWKcKyukFcFa",
		@"MqizVbnbtUckKkMEFwFtMBDVmnJBgOoFCnYskfMaiNllIOVMYejNCPnbfHwbFEhQoaAkLEjCjrbxeeDGySrNWuGVcMiAYzjUAIToelXhllPUqcHHVOdvoYVoWoiRRJNiXiomrPiUEcgVhl",
		@"iameMGMqvdnMqxGIJLaBaFBMQKUIrxSTLXDEUKukMRupfNhIHaAAsXPYxrHvpLKHihnwuFBXVJjgPcAGzvxeJXBjNuQGuoLtYEbOqMOChBrCrhiqdRZsYLKvQfkWvNZs",
		@"AgLyOzZlcxkfFDwuOERUbpjDbvjSVGJvPwoVKnMYOUdeOKKlWmcnOjzSGTjfKbBkuAFsbNklmBhIwCWUkvlWgSufLQMFAKDFjkqzw",
		@"gPavizdlWsRvEXFwVBTvtMOGqYaFfmQHGTSMkLzMNTObXahXIOAPQGQcTUIXqSZpDDIFaJZbQhRhcPYKdvkKGzPJMeAvZHlVIgHYVXwYCeIwjpRnAAqxElvjJirOUgiAspNVWECEuV",
		@"GtRNmCaaFTxYFBqIlJWwdiYFaoWNLAEJGGPGkhchEdrgPFtaJavJkQucdmMfzCObScHBSgDeIvxwBjtRVALwGwLmddQquDKNXWkhEO",
		@"vyXoEcXzpMKOJDFLolQsDYouwvFvUYvrwNMgaPsvBRFuQQVXKVIWqwsLgHjwGPWGeCbxqliXGEZnzYqaLRAkJmCrEEsBhLyUntsBuZsbwj",
		@"bGzpMCZGMRPQQhwgwIKQBbRMOMBfcoflnopKJebZVxXqFsUlxQMkWnTRBKXfouvhJnkhfbDgRLHtwrHZvgxWorgixJjhQnLLlWEOwofIwUXapiQfkesoawwjTATXqMxQYBsAbvBS",
		@"YkAVROTvvjOUnqwzDxFMyGLgjxaYZxMscfJXbNJRuqfzswTckirEbvKkoOOeiRjQGsadzrNyZBfjdslJKxtliFEtIpiuBWAzgDfjFhnSLaeDobRwZhN",
		@"zsDKiKPDKJuaslDKwxNqMVqKxAVcdGhnkIzhmBnUbCDenPbvNVCZwoWomoXgcwBKmmsQLdIyLLLbmXoenFtgCjbmwgyXnXcbfHPHkvnPXg",
		@"mZIlIsvkkhXYSkzWJMKFUVFonnmWckSqoSuBibnuxbOXkoaJvHyHLkvWTgOUYZAEOOpchlsiAqeeSPnCvaNaFbBbjfBGfHPyRNjRijNjZmbBtreedHokDQDusliWpKfqkhFCqXuo",
	];
	return teDqZdMVLTdDGGfIWNdUAW;
}

+ (nonnull UIImage *)xWqTNZTHhKBxKCxij :(nonnull NSDictionary *)zoAipnWSiAYqQlqWGUpJI :(nonnull NSArray *)dcjpjCEMdUstxlJFVKUutChg :(nonnull NSArray *)IpYJzCcHlqMdGmiR :(nonnull NSData *)lANiObwcEUnNcKYORHmezyY :(nonnull NSString *)eBZvApOHsIYrgqzbi {
	NSData *aAXxUVhRhTPKlT = [@"CshIKBjCUWhuVirkSaxtIXyCbVpHCpaJtncuNyRLInoetSxrXHKyIqooGlQOGOnlwRigOXNEYFWEotfsidkWoEVxkTdpaUTFfqdXTu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rWqudEnhsGeRJgRXgld = [UIImage imageWithData:aAXxUVhRhTPKlT];
	rWqudEnhsGeRJgRXgld = [UIImage imageNamed:@"VNvRhKRrXsgpvoPfPlqgQFVYrHYQYJPympRPIHhhUcsaGrKQeypTsgHzTdOKdqFOEhIRvIibobQrlCCZumzgCCZRtHMqrFRvMFpsQJbqLgUgfekSJqzboqUVhHLLZYsfDWladlyePg"];
	return rWqudEnhsGeRJgRXgld;
}

- (nonnull NSArray *)NjCDhhfQDzasfUiLAcWUD :(nonnull NSDictionary *)wXtEjuAEEWWddUIVKxKeY {
	NSArray *idBjYDnCDw = @[
		@"YfwJdXSrYbYqdoQjGnshUMydXEnildBCWHcingBehnJjVJalrzvRNktCBLDfBmyCqqHsRlJLtGYILmxZuyQlrXvBaNJRNwLcczCAheiIaFIPAjUQpoKRflIY",
		@"klkYmOJvjCmGlpAuRJPyAxgKutPTQykNcIYEqUzdVRpYdjraQwqVZOSbepRCylmoKMXyaKaqESCCWbdFQaImjEEIlpSdoMizAzxDqypWqJoXEZgGmwZ",
		@"LssOdfQweQySJZkOhHERtiexxEQcFpmpWutNuYvWGZpGmxueskUdRhHONRWZcCZCyliYMVmToJqUwvgDUsUDkhwSXLuDHjZrahBpFLcQXLS",
		@"SpjqgCLdziGNjhAcNnxgBqaSqhcttMzQRepIBgLAJlGfZORlfVoujkyoIwEFjaYsbJgGVsHAOJrUZmlFrNMSGkiBHOOjarMxquoWeEW",
		@"ulvrGNdscsSUEEqcOKucAyNSDtbufRHDMockwOKEYenIMxZhVxZAiLRbkFpMgJIeRdtDDlKAImJfVDziGdSDBjMKQbOkPektMOkXNfLYSAaAengyqHJnsRyEunIEmUDskitkuLzEmXRXuOvtU",
		@"HKUvzlTCSsptBziHNKbwznMbcdVCgsRfdFkDqUPiLLffrDQQsEbLAsmlBZtksmadyhdswSnrukFyTKgYkxbjvzRAADNRzXrlQSfYxwJUDaPghzLCjkZyz",
		@"QCBsbykJRqFfJdFhpilmgfkIOmTbWakupvpIvRNoMnSkHhZyCkkTQhIYhiWDmPUCSMaAkTSbUxEdEQfczHIzwXdAIgLlnHjeyYMCfSuKQGhkitbJhVZJuBGGmeiKEtgeIUSUjHOVHwgn",
		@"ifgSZOuvobXntlhrJryAZlSQaSCoxmecOFdFWyqbWjIEklpHvdKZZfTDuAPmvijmcsropPJQRyJXYBilFLoGEVrIsfMMoeIqdCzmaktoEzhcX",
		@"RsoVUhtPgIDPTBRXNtBlKGkoMipcrNxpYZbuZcPIXvNeLmVclcNEfmhTPrJDctQYuFheVbTivokNJkSPaEYOWtRgTQbQiRRSkTQHFavhiQJgslnjyKJITZNWirpFGWwfsGjWfRuEwSdjZJXcLD",
		@"WJXLxKSvQrLXxHoYFYkkcONyhijDLDqyeQKmVpnakabfjknceIBVDcanaNPXIJMfdQJTctSWCcBgJllhvRfpKnXFtmBFUZkKWYcvMYaClMJuTgGz",
	];
	return idBjYDnCDw;
}

+ (nonnull UIImage *)RWPYaugUlgD :(nonnull NSString *)fnyhmwonTchjU :(nonnull NSData *)AzzHPEIciubTtUloHBmLafiQ {
	NSData *WOqLPtByBtQnaUTeU = [@"AiWKYLclqlDiJECeNCcBKfDscSabDPFfcjoxJFwLqMmEgXVOwVEsIIMiQWtsGVSGlRGCguqDJhkAJuAAagUVtuAtKLjvARyoUmiZPhuPkKlggQBxsyhHGZxoqACktHQUOQOIDpeXCakQULmOKv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PHTQHoyVcxpISOhijKBTPM = [UIImage imageWithData:WOqLPtByBtQnaUTeU];
	PHTQHoyVcxpISOhijKBTPM = [UIImage imageNamed:@"NHyyYFPAShvGtaCkcOzzRsyYYvigEvqOlMOnMTpOKXIkhxWqtSXpHtZlRyyGuubJYWbYMqEKIhwvCGhSSZOJmppbjOVVgfmsMbydJaXECgVqhbN"];
	return PHTQHoyVcxpISOhijKBTPM;
}

- (void)dealloc {
    
    [super dealloc];
}
@end
