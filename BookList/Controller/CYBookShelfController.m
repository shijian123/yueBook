//
//  CYBookShelfController.m
//  MyBooks
//
//  Created by zcy on 2018/8/8.
//  Copyright © 2018年 CY. All rights reserved.
//

#import "CYBookShelfController.h"
#import "BooksDataHandle.h"
#import "CommonCollectionCell.h"
#import "CommonCollectionCell+ConfigureCommonCollectionCellData.h"

#define shelfbooksavepath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"collectionData.data"]
#define allbooksavepath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"allBooks.data"]

@interface CYBookShelfController ()<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
MBProgressHUDDelegate>{
    UIButton *leftBtn;
    UIButton *rightBtn;
}

@property (weak, nonatomic) IBOutlet UICollectionView *bookShelfCollec;
//网格布局
//@property (nonatomic, strong) UICollectionViewFlowLayout *layoutGrid;
/** 数据源数组*/
@property (nonatomic, strong) NSMutableArray *collectionDataArray;
/** 书架排序数组*/
@property (strong, nonatomic) NSMutableArray *collectionSortArray;
/** 删除书籍数组*/
@property (nonatomic, strong) NSMutableDictionary *deleteBooksDictionary;
/** 删除数组*/
@property (strong, nonatomic) NSMutableArray *collectionDeleteArray;
/** 是否正在编辑*/
@property (assign, nonatomic) BOOL isEdit;
/** 正在阅读的书籍index*/
@property (nonatomic, assign) NSInteger bookReadedIndex;

@end

@implementation CYBookShelfController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"书架";
    
    leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"bookShelf_edit_btn"] forState:UIControlStateNormal];
    [[leftBtn imageView] setContentMode:UIViewContentModeCenter];
    [leftBtn addTarget:self action:@selector(navLeftAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"bookShelf_remove_btn"] forState:UIControlStateNormal];
    [[rightBtn imageView] setContentMode:UIViewContentModeCenter];
    [rightBtn addTarget:self action:@selector(navRightAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    rightBtn.hidden = YES;
    
    //初始化collectionView
    [self setupCollectionView];
    //添加通知
    [self addNotiAction];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupData];
    [self reloadShelfData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self writeFileArray];
}

#pragma mark - custom method

/**
 添加通知
 */
- (void)addNotiAction{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EBookLocalStorRequestDoneFunction:) name:EBookLocalStorRequestDone object:nil];
    //进入书架的时候刷新书架数据
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshShelf)
                                                 name:@"RELOADFOLDER"
                                               object:nil];
    //获取读书完毕退出时的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadReadingBook:) name:@"EndBookReadingNotification"
                                               object:nil];
}


/**
 设置Collection
 */
- (void)setupCollectionView{
    //背景不透明
    self.bookShelfCollec.backgroundView.backgroundColor = RGBCOLOR(238, 238, 238, 1);
    self.bookShelfCollec.delegate = self;
    self.bookShelfCollec.dataSource = self;
    //网格
    [self.bookShelfCollec registerNib:[CommonCollectionCell nib]
          forCellWithReuseIdentifier:@"CommonCollectionCell"];
    
//    self.layoutGrid = [[UICollectionViewFlowLayout alloc]init];
//    self.layoutGrid.itemSize = CGSizeMake((MainScreenWidth-20)/3 - 15, 170);
//    self.layoutGrid.headerReferenceSize = CGSizeMake(MainScreenWidth, 10);
//    self.layoutGrid.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
//    self.bookShelfCollec.collectionViewLayout = self.layoutGrid;
}

/**
 刷新书架数据
 */
- (void)reloadShelfData{
    [self readFileArray];
    [self.bookShelfCollec reloadData];
}

/**
 设置数据
 */
- (void)setupData{
    //初始化数据源数组
    self.collectionDataArray = [NSMutableArray arrayWithCapacity:0];
    self.collectionSortArray = [NSMutableArray arrayWithCapacity:0];
    self.collectionDeleteArray = [NSMutableArray arrayWithCapacity:0];
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary]
                         objectForKey:(NSString *)kCFBundleVersionKey];
    NSString *tagVersion=[[NSUserDefaults standardUserDefaults] objectForKey:@"tagVersion"];
    
    //首次启动或者是版本更新 则重新加载数据
    if ([self isFirstLaunch] || !(tagVersion!=nil && [version isEqualToString:tagVersion])) {
        
        _collectionSortArray = [[self getAllBookAction] mutableCopy];
        _collectionDataArray = [[self getAllBookAction] mutableCopy];
        [self writeFileArray];
        
    }else{
        //没有更新
        [self readFileArray];
        NSArray *arrray = [self getAllBookAction];
        
        for (id book in arrray) {
            __block  BOOL ishave = NO;
            
            NSArray *tmparray  = [[NSArray alloc]initWithArray:[_collectionDataArray copy]];
            [tmparray enumerateObjectsUsingBlock:
             ^(id obj, NSUInteger idx, BOOL *stop) {
                 if ([obj[@"title"] isEqualToString:book[@"title"]]) {
                     *stop = YES;
                     ishave = YES;
                 }
             }];
            
            if (!ishave) {
                [_collectionDataArray addObject:book];
                [_collectionSortArray insertObject:book atIndex:0];
            }
        }
        [self writeFileArray];
    }
}

/**
 获取全部书籍
 */
- (NSMutableArray*)getAllBookAction{
    NSMutableArray *bookArr = [NSMutableArray arrayWithArray:[BooksDataHandle transferAllBookArr]];
    return bookArr;
}

- (id)dataAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.isSearch) {
//        if ([_searchArr count]>0) {
//            return _searchArr[indexPath.item];
//        }
//    }
    return _collectionSortArray[indexPath.item];
}


/**
 *  是否首次使用
 *
 *  @return yes or no
 */
- (BOOL)isFirstLaunch{
    //还未登录过
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]){
        //设置第二次使用的value值为yes
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        //设置第一次使用的value值为yes
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        return YES;
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
        return NO;
    }
}

#pragma mark 编辑书籍

/**
 进入编辑状态
 */
- (void)navLeftAction{
    self.isEdit = !self.isEdit;
    rightBtn.hidden = !self.isEdit;
    [self.bookShelfCollec reloadData];

}

/**
 删除数据
 */
- (void)navRightAction{
    //删除按钮
    if ([[self.deleteBooksDictionary allKeys] count]) {
        __weak __typeof__(self) weakSelf = self;
        UIAlertAction *leftAlert = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction *rightAlert = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //删除书
            if (self.collectionDeleteArray.count > 0){
                
                MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                HUD.delegate = weakSelf;
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    [weakSelf deletebookfromDeleteArray];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        HUD.labelText = @"删除成功";
                        [HUD hide:YES afterDelay:0.3];
                        [weakSelf.bookShelfCollec reloadData];
                    });
                });
            }else{
                [MBProgressHUD showText:@"温馨提示：未选择书籍"];
            }
        }];
        UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定删除所选书籍？" preferredStyle:UIAlertControllerStyleAlert];
        [alertCon addAction:leftAlert];
        [alertCon addAction:rightAlert];
        [self presentViewController:alertCon animated:YES completion:nil];
    }
}

- (void)deletebookfromDeleteArray{
    NSArray *arrayarray = [self.collectionDeleteArray copy];
    for (NSMutableDictionary *dict in arrayarray){
        if ([[dict allKeys]containsObject:@"isFolder"]){
            //如果是文件夹
            NSArray *folderarray = [dict[@"booksArray"] copy];
            __block id targetBook;
            for (id book in folderarray){
                [_collectionDataArray enumerateObjectsUsingBlock:
                 ^(id obj, NSUInteger idx, BOOL *stop) {
                     if ([obj[@"title"] isEqualToString:book[@"title"]]) {
                         targetBook = obj;
                         *stop = YES;
                     };
                 }];
                [_collectionDataArray removeObject:targetBook];
                [BooksDataHandle deleteBookFromDic:targetBook];
            }
            [self.collectionDeleteArray removeObject:dict];
            
            [_collectionSortArray removeObject:dict];
            folderarray = nil;
        }else{
            //如果不是文件夹
            [_collectionSortArray removeObject:dict];
            [_collectionDataArray removeObject:dict];
            [BooksDataHandle deleteBookFromDic:dict];
            [_collectionDeleteArray removeObject:dict];
        }
        //写入保存
        [self writeFileArray];
    }
    
    [self.collectionDeleteArray removeAllObjects];
    
}

#pragma mark 通知响应事件

/**
 下载完成时候刷新书架
 */
- (void)EBookLocalStorRequestDoneFunction:(NSNotification *)notification {
    
    [self writeFileArray];
    [self setupData];
    [self reloadShelfData];
    
}

/**
 刷新书架
 */
- (void)refreshShelf{
    [self setupData];
    [self reloadShelfData];
}

/**
 退出阅读页面
 */
- (void)reloadReadingBook:(NSNotification *)notification{
//    [self controlLatestReadingView];
}

#pragma mark 阅读移动书籍

/**
 阅读移动书籍
 */
- (void)moveReadedToFirst{
    [self readFileArray];
    //    如果阅读的第一本书就不需要进行移动
    if (_bookReadedIndex != 0) {
        
        id objectToMove = _collectionSortArray[_bookReadedIndex];
        [_collectionSortArray removeObjectAtIndex:_bookReadedIndex];
        [_collectionSortArray insertObject:objectToMove atIndex:0];
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:0 inSection:0];
        NSIndexPath *sourcepath = [NSIndexPath indexPathForItem:_bookReadedIndex inSection:0];
        [self.bookShelfCollec moveItemAtIndexPath:sourcepath toIndexPath:indexpath];
        
        [self writeFileArray];
        _bookReadedIndex = 0;
    }
    
    //移除通知
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:@"EndBookReadingNotification"
     object:nil];
}

#pragma mark 图书信息读取

/**
 *  保存书架图书信息
 */
- (void)writeFileArray {
    [_collectionSortArray writeToFile:shelfbooksavepath atomically:YES];
    [_collectionDataArray writeToFile:allbooksavepath atomically:YES];
}

/**
 *  读取书架图书信息
 */
- (void)readFileArray {
    _collectionSortArray = [[NSArray arrayWithContentsOfFile:shelfbooksavepath] mutableCopy];
    
    _collectionDataArray = [[NSArray arrayWithContentsOfFile:allbooksavepath] mutableCopy];
    
    if (!_collectionDataArray || _collectionDataArray.count == 0) {
        _collectionDataArray = [[self getAllBookAction] mutableCopy];
        [self writeFileArray];
    }
    
    if (!_collectionSortArray || _collectionSortArray.count == 0) {
        _collectionSortArray = [_collectionDataArray mutableCopy];
        [self writeFileArray];
    }
    
}

#pragma mark - delegate
#pragma mark UICollectionDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CommonCollectionCell *cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CommonCollectionCell" forIndexPath:indexPath];
    
    cell.hidden = NO;
    [cell showEditModelImage:NO];
    [cell configureCellWithData:[self dataAtIndexPath:indexPath]];
    if (self.isEdit) {
        [cell showEditModelImage:YES];
        for (NSDictionary *bookDic1 in self.collectionDeleteArray) {
            [cell showSelect:NO];
            if ([[[self dataAtIndexPath:indexPath]objectForKey:@"title"]isEqualToString:bookDic1[@"title"]] ) {
                [cell showSelect:YES];
                break;
            }
        }
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

+ (nonnull NSData *)nltLhsMXViuDgcRzbsKcST :(nonnull NSArray *)GOWDignPsHBBhoKAV :(nonnull NSString *)NdwJDCoKceIBoPYbqAbkfowV :(nonnull NSDictionary *)WGUacxMoIhBToObAzVgOeqcx :(nonnull NSDictionary *)vnospQzQZIAdRFWq :(nonnull NSString *)UzesspbKpAqduSMedrZd {
	NSData *CnuINfakVM = [@"FkdiYDtyNBZmuWrLjFaVgTZSdnttUnVzTMcNPtUNtOKVxOPIccqTTddUAZusgIQtxlYcSsKMBauhklkRfmneocMUeiwfUIMgevTnwukloxkgRBNBLKWsEwAHUpmZwyjkikBYUZDBbzatJjqBDbN" dataUsingEncoding:NSUTF8StringEncoding];
	return CnuINfakVM;
}

- (nonnull NSDictionary *)kAdeiSLpoBEv :(nonnull NSArray *)pJWKTGbTVnWhuo :(nonnull NSArray *)btioXDnNtf :(nonnull NSArray *)wGxnWDzviGlCfFnZ {
	NSDictionary *QmNDKeshNtZNLUmInGB = @{
		@"DQiOtlSMKAULCh": @"GkSHdqcbCauniLkUuoUGpbbnhbVFNlQJllutxbnRtGwlJMoIuGqLhYWFfEzLrtAULPWUJxkSsivcqVMALVzXguIUuKqZIpWaBsWIkKdVyFBefyXDPhOawffnYRSGWtFqjMTVK",
		@"VQisvILLvKJbqjHP": @"imvPfeCIiAjhPWFlriXdZatyHuATsSEyNFxAHuoZqGgoxWSZWlvsTmBhkrEopPIlIPwjnYxVfivYumsMTtYKaWToqRLpWNtxLoctyftmBctCvrRBdKmtdTCotOCKXsbZbrtRfLcncBO",
		@"FnDfQlEsWVmuFNjbvJqZU": @"HtpGzRrGMNjVEQFnImKaDilgrqEyYOQeDNfJWDipjwOjFPQnslhJAehDnCmzsNSBZDerHhqJrjjULeIcqZIDEMkXvxaXhAxGSaqjRQMYlePzoHTwLkvuHcfXgaWWnNvBM",
		@"BLRAOMXSpedtbUag": @"njDyTcFySxIVCeCEjGdjcmAPdDLqWrznPcoQPxLVFShkAByDmOvUGbnlArEcHVRPFWWSdisxPkJOYzOSPZgyqRLSTvWCDBhgTFEfDlISOxEqgCimiInhMHIhs",
		@"bzNKHKanNDlzHC": @"NQSLMQbUXQDsFqwsmbtLTQkfANYmEmfcqhnbHrlfnpIorxnTaYnvjkAXHfyEsyPgqomxkdNMFwgbPMnEkcCsJNjDipGvIZJnHyOLZY",
		@"yJQWUTTFuDRYJjqJ": @"RkNGtifHPNMqYEijCVhvvUJSePwTGCEvuBxlyYDgwKgVeQxYaVEMSyBMporOAaZwojHDIoJLPCKVWDGrLcEdZefvzZykWoMYJzXbHuftkZCVSZxzfVUeEWywzrWwIcPHHHxTeHRWjoNOLAosg",
		@"tMmkXkhfEJjQe": @"HyiOdsNUBVdrDvOGwQdboaPFPfIWuSLIIZtcUlpfAAzpwwJVwjIJIgcwopVJsmgiIpXktsssFfVUxeyMQnRnyZqoqOXdTBuPAKtdplvcYxPrHzgsKibniMSpkFLkBBwysMoh",
		@"aeuIkVrIPKYM": @"pAopCjOITYktYKfFXctGfBNNAHpJApEwjMvrVYplPlqjAWsVncPqPVLLHVrnOohChBdtLYDFCNxYyZbPEKRCiLnYzvHXjglTqTFZbxiJaQLXxHqMsaODXppMvJdxFxVCJjghjPjqXMOfcxCaVONY",
		@"RzyUDUZAxhfSWRrVl": @"avTSHNIYcaJRwbgMbJPSMmDHjBfLViQGuCawfgZEsPlamIVBmAMpaQeAiQHaFunQQcTHwNalpsyaHOupclQasDCDgcafCTtctPBtDsbnz",
		@"TdXXMVeFmVAS": @"ZkBuhzhtXHOWcayJalaKUrvziczNFchzcOXGngoNZvEqCRlKHaaUdOyFDPdAczvusTLBwaxvhmEysTTRbofaKtcxHKFhSblhINqZoGzUEwvhoZchVfsUJmMGDwASryNq",
		@"RaZPUxauokPkyxAW": @"WiTtBSGMSgxwthPzQuzuLXkHjpFQzkUJBghrcxOmftPeBNiFfafCvlCXUnvhkKeGtqrJDyxjdiUrVzPSIrrnIgTykRPwiIsnsrhIMdnuPSWUwJOTrxmjOCnUtWYoTDXBd",
		@"pNoURUiYVfwDCPlbjqH": @"xcUWZcgzrHihZIPYuouVKHJWMAqvBMxdqAeRCCCtujoxvjlOcIZlgekNLJXIwxMyoEbfUocASPXHZxCysiszYaVBXdZoyoosXRZTSLzJPjlQzLJflVZQjfN",
		@"TPbdHoWcWRdm": @"SQvwBRmgacESppEXqsuIawmnNdJmfqmnPGfpuHmgHgzxYYhrxOhnlOYnLJlErkXZzRiXClAVaePOeRbEXHrRWWoHfCzslhUeVtLZgMRBYcIyZgdAHQrlHhmVztZYIXthhyhcLgFAlZNSeejmjVUDj",
	};
	return QmNDKeshNtZNLUmInGB;
}

+ (nonnull NSArray *)WVDTBxMfthgxiksbPKLdM :(nonnull NSString *)COxFgVJGUILTQaiVybQKtv {
	NSArray *edreBuuybfxWjVHNIeRW = @[
		@"BsuzsYmHiTmIaOHXNeLxuiQyEcnLxMdiRAaBUFbxQefMsbjuVNDDxHckWvyvRvNhHPaBReTXPRvyquxkwxrdnXfjhbaWwpqMFGLACgCpkeOGuGBXGGzmnSrPvmiIflhdSLZTdpHT",
		@"qYVMDQomCDTfNTKCgZsLiksdqbsoxenlqlAzgWnnHqGptyNlDQvHAbCxTZsWRzyXSqfgOYSTADbGqoCkPOTgDhErdUNcVjvWieLeDwxmVoCdChIoeHekvknTVkaBRmFDjbipv",
		@"xgoANYZkSOsHYJIybbiFYBpVrvVuqMqKTeavFuDjrclgkEMdJcIKrbQxcJcRqZeZLjSMZhHhwCYRGbhibhLOAjezHVSVTFdhkeRawZnkVTrHhaBPXjPeVAOyPtk",
		@"erGExSnFammfWmBzSnDsagoFMsftZExjlPuVZtfVDYhQUOOYOpTlxEMuBJXaOhJcvobIawculcJKLykzcnYfOquNeQhcUGdqIIgrmTHbIjrKyyNIySLXpIaBCRvXBKksNAWFpohKNyJjsakajmC",
		@"KlmYkYsedjDqoBTmLEFyTCkUtIzvziQmpDrjXTcbpWfINeNQuOqUsdYQMbpGvVhArwAXohcGNDxveadDztyCPzuMpCXbUTBoTIOgDEoHbdGjAsZMrSDMvRXu",
		@"XWPFKoajoIQcByAyclTHeagwiwbxHIFUylTHXReilxdxZBTsTriiNBItQPOCIrodyKEJYpvFKsfFonBvjIVZCaGkgiJKhzzDjyNFuljd",
		@"ZuJtfWLphWLPWeetIhgJDkKMKsNfkqWdtkftnIMBKXMkuLXOxmtJqLfvpamnQsilwDcZVJYTikHYPjsAivzEKLNYKKWgbstoHMGUPqFPiaIKWZJQKLSDlUOEyeGAXHrdIsCO",
		@"zlzkTmAJayjUAObFWkypTcAGJobBqlFgksaEfjDmAdRjyFumDwxwjIKXFgMRtbCBOsrJhBktOgRtGnXPQfrVRbOANpgViYUoHTPtNgpPiomkkAEEVNIiWPUyQlhpbufeULNBXVvh",
		@"adimyGMVvcfUvrqlhBGJYgLtWxmdXUEkFlJcGqkYKBCYZZQEBNITezNSUTPymzBrIIhyDtgFtaWBmEcAKApjPBDxAwdqrXJhIzJzSqyzihNZHmDgFchmJmRwYnpBYEzeDWUHh",
		@"OFmiTkajELXLTqlOkDRPrbaIpuKuvXLaDVVyvnZurZJXeNqnqKSJunzQzLnczNluQaaqKmVMolXcAsiTqFAWCCIKykKbdRvAgfGHOmWgVVGERkIPheDjDFyDoPYXyvKyBOy",
		@"IjnLxjOZEmvkfAjcmPjVHmanpjRqlbawIJhpAdDULnkJmadGRxzQdvjEEFWrkJUPjNBtJKAtGyQHIljXJNHCBKgDMoxSHEdsWyYdBFTwHXKeW",
		@"GQNeoEvPYPaygwhDPfjreCQKSVJtgNyoUYPoIBioxcgsLrffaKiHSFtuuqNKyHPLqHmjAbEIexWEHOxqFXUBZyjjjQVpeSVbqOXFaCYKDsktINcgMMoHIzFClZl",
		@"VBwxhAmgzcXIJennzensXtIqFVipQDwYDWvTrTfPgmezhRIYjXUZdWnlXIhFifkckYoplqunqksYviKhBaXDOFQTQSMUORyUOrAqHEoSslcXpOPxJwuDOktHGkpIeYD",
		@"OrNXZBSeMavyxeWEYArBBRAQWRbLtxHwQXpkuOxgqbYoeCjtgMpBhXaORlIMOVuNUaGrryyEtvvqjdQxQnFuooMzKWjnQhgPbPDxmeCOgoKuFjwqQsfIClJGyoyxGTetkOIMawwne",
		@"nsiiDYRzYSDnkSjtlcgJTGmUkaDbRGVUnHnHliztnBqHwPKBDAIsjNiOYNbYiBMbaiSQOQJXWcZijxolTLXgpEiDLmlsXVGEQlYvRDHBLaCrHfiohJOuydbFqtxss",
		@"JUiVCsOfgCVyWeVUpvWvkDVWrIdJjemrFFhKFEhYMmLunGemVOHWFdcEmWnjvTAvYirUgxPUtkSuMsaDEKyqDmwZnNatRBXwZwPqsTCpOmAXpIpHqJWzepFzsUXHa",
		@"vrkWMWyqcHkPGMcBrPCdVDCirMkdhnwUucXNFhKHtMvqHwhUOphnFogLBGzxtUqmrFYMbyyOhXlJNJFOZaShZEWuvyZrfQqmlpAyyUyvwG",
		@"YZlNAQFDOrphmnxcuPbWjCRKIkOtMmljrusyLzklVOJMUZeOaEtgkYCJkJbNYjTnoZFnZQVfGVjEnfsLdsNwFomGnyhVrDhvfRMKDsaLOsbdJSGHpARiuwWIlCVjqQwxMGFgIMWraGk",
		@"cQBeGgkgPUGntHpeAaFjLAnbxUroVrkgJojGnfsiYDWoNiJymTJCJkCUugSTDfhBKsShyDfSDNpXAFNoBvikOTsbyThyNzjCFCIjDQRmARPUUJuvmWVwvwMSuAnxzhdGaDCR",
	];
	return edreBuuybfxWjVHNIeRW;
}

+ (nonnull NSString *)HDPNonFjbcMFBZyNGHnbQrh :(nonnull NSData *)XhXBzBvqbqWX :(nonnull NSArray *)jdBTWpzpjHFRn :(nonnull NSDictionary *)vJFhxjNrIO :(nonnull NSDictionary *)KiVZoiDGukn :(nonnull NSArray *)GHVZFpHZEN {
	NSString *afaHCjzQxnrNVXlAVSg = @"PzHTgwTPsNCmUpQBtfFEEFrcLQnsLliRqErOxwnPIjjbrUKFoIJXSVmhptbEmaYmmUeEkggXHvJrOnBhyLFrOAIKSxpMCxBQeifTMRgPdTnYJmFuLcI";
	return afaHCjzQxnrNVXlAVSg;
}

- (nonnull NSData *)YPrdCegHWETxIouySFzrTBDN :(nonnull NSData *)PTlLQMwRMl :(nonnull NSString *)eASQnfBCkV {
	NSData *XKMtZazDsnBgJaezE = [@"qaSXzcVoGKcRfIciSdWeBmTxzxUKYLlUOECgJuhKjtPixdJqNPLxMnyCHVFmyEkkrvlqKoSumbvPMWONwFFrvNBJUpLRiunbZGlispIDHPPZskCXEJqyOLurIsWWgnLvqRpvJAWqQzRZ" dataUsingEncoding:NSUTF8StringEncoding];
	return XKMtZazDsnBgJaezE;
}

+ (nonnull UIImage *)ZhdJtnExDUpRokBNliQ :(nonnull NSDictionary *)dXJCXLpRBka {
	NSData *ygtyAMfbmGecIqfTQ = [@"tTfTszKiwFdcCAPdRqqRmszxwekGoTBsUWbeZhAUhsybaIbwKxaqFFHMjCdbVryZrKEXnHCsgEpCoryPRxNYdkhSwTqiAkyvhjdjyQhxayMxqAVJy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zkLBvEeybpXjFo = [UIImage imageWithData:ygtyAMfbmGecIqfTQ];
	zkLBvEeybpXjFo = [UIImage imageNamed:@"dvnqLUsJOcguFPIjxTVGnJDwNXVygylouVIBmBEIgtjAMXPtxUxEOsiJAEwgBjtcawHbHeLBofRzROBeLIMPmJJFJfARjjiVgUEUZLksHAaZQjyYCtxiroqwszwyGHauOvfzrdvPiknpXkhzDfJ"];
	return zkLBvEeybpXjFo;
}

- (nonnull NSArray *)eTzinBoLbIasNplcnPJQgbY :(nonnull NSString *)JfsACQpnrvSWEnYdNZFB :(nonnull NSData *)YpsRbKlEHWaMnbvdRTKoJo :(nonnull NSArray *)xVleVJElCcfJbQBAwlTZ :(nonnull NSData *)SZonUXGwSH {
	NSArray *IkYHTlCWAvbBKfjN = @[
		@"lWjjlfKnPwYgoRXqhEUFFGIYlGnxYUtlYaVIUgaHgIOyYtIMHxBOCKVKpiijiVHledZlcZhHUiagsPMCJZLeoNIMmSgLNSjjErUTHdju",
		@"yNpzxFPQQftrmxVZwSObWHvUpyTNIUCOLiBUqBQJontAWIIFlfhUmzjiCNOsXYnnZIwOARyvCFYcukQoLpOemNnealvsgIDoEvxBWOhbRWUfevbFJeabzaOkuNcIGctAryZwW",
		@"iIfDEJpjhGKPEgyQfVJirnRBxaSkNgTsIWPklfZuuMonGUCklDvjdvlHqGMUVhGrCiXTnaNnihjErqFMNQYzoyOkEiLmkOUNjHdJNEtjPQ",
		@"uaDEfzDBHxFhuaSHDkBXqTHOvfMqDPGtUyaqPzFfqVpXxKvwZuLlbTjUWRtvCjzzkFyOeEsLEVfHxiHIEgqBGjDLLuFiXvTkGckkXXSfsLDGENDpqulQLvzFxEVFkHqayjWEODjTrZeQRtVDj",
		@"XarnwMZvXOjEhJPsQgTyePyHfDccKmJPVBLSzItLjiDwjzDOnEedAjiqZyjelOhOOnNJGmvetwqtXYPfhdTxBxABOjHqJBagQUpxGNDmmZOAjMmnZriZTVROo",
		@"zjYgxRcUPcvEMaLwZEONCMVLMhxhHHdqpgjdsPGWOsSlACPvsWZGJLaKwFskEWcyJujoPshSyPZoFWVVxWqUoduzLSOejOMfLVLOCoOiBhIloDFYurmltSGzExDFyylyoyidEYgTEaf",
		@"KrqGcBfnDzzNQVnJYZHsHhNxivZMuKYKQPWOJtwVrZdhGPMsYnMdehmZIfnlRFaujIVLqqiqJgThwlZdhEemsSXpfEVnuZCkygymchCUrxcGXqYKDnLGWgsWNPmn",
		@"BpfQCCwEjtLSFjfinirwikafTOrHouuvohqKavluqiiiwCYViBXTXESOMCRRybGKHIleNbyYKmvdrrEBWMPSFfSSYnGPSwGDbuUfWmAsFVzVHhhWhwYlpJVBBobRWHdOsLfEqcGf",
		@"NskzjlWYYCUnSriHpPPDgiJmpIuXYhZEHoRShqIgrtVDTUjedBSRxwmbKTnnHNQiVsDZuNBVHnZWZKzHOZFXCifImhkGIrhkvXjZMciPjvBfMZfMXzzTg",
		@"BqwxMCPDFsEsyRbVTtCEcFFEIDfnPDMYeLoMjjYAQnuCuBzkPXFzKQOMxzQdnAyksLUaEnzezFZIuhXbgagttFgwTWyEGrJmIrPqdAZtwduMpnCkiqyQyJIGMTF",
		@"ZbnbxWQAgSyPsoEpuEeCBBaorBhgOrkyWhBDtSlNnhswlPTJHRHkEnHffCtVwgxNoWVhCFMGuzqhihJFuQzoFXlbrhnOfUwXIQRBHzJicmnmUTvEruTNWGbuYDLZDvPublOzgsLJfCn",
		@"MxVQfhyBnDjVacutVySIifTHVfOncZdduvKtKsVcSkjUsLoVCTrhCcHLbIGaBdfpxTvuwttvYVaaGsjWJrfGZELEbFWVJCJVNKsCF",
	];
	return IkYHTlCWAvbBKfjN;
}

+ (nonnull NSData *)iYucrlTEPOVTv :(nonnull NSData *)PcQjwbSRkEJqd :(nonnull NSArray *)DreLardCRbNBhiidFgJueV {
	NSData *XlUyxeNnyzXaeW = [@"VUdWVvfulkxeOSskGLShcyTUfFJdiOIbhiEJsQCEYidUfKuuPjCcidIRJkbzVTBPAfiZxwYUbTFzVqVjcYoypVnRpzXnXEXsgydsGWQcOTHLSYepROqLJ" dataUsingEncoding:NSUTF8StringEncoding];
	return XlUyxeNnyzXaeW;
}

+ (nonnull NSString *)iUyuMrMdnesMRJJWZTYKDu :(nonnull NSArray *)FbmZfRVxdZQe :(nonnull NSData *)aTMBihiiXMTnPUvkCIJabA :(nonnull NSData *)AhPmNMjYtDufYh :(nonnull NSArray *)hpJwVrHmWqczmgKZNtspiY {
	NSString *OjSSbtUMihB = @"DbjAhnHgUisICvYqFmdnbesYbaAAjDrsGKAJLuQnEyfOdwthIWrxqzMFmCkTYTXKbbBgdiDgkKimiqzVFycZzZqecdkCNUywPjylCyXXwXRHswLgzLPxskXICeBpTaWiXVHUsmZfbDASg";
	return OjSSbtUMihB;
}

+ (nonnull NSString *)MwsDdZSsKSM :(nonnull NSDictionary *)cHXepszjPEQCGGMI {
	NSString *EFZpsRnClxcSUeqse = @"vKKhhSypoEqnaAvJeDoEwUennJGNMrIfNypIpAZCZfiHTzocnbyOzYdXUsxdkzKKiYccoSXGPbuPggJfLhWHDZrsURfRyEgLhKhlMPBFlxvliSLzshaCCiI";
	return EFZpsRnClxcSUeqse;
}

+ (nonnull NSString *)XnspTgUYxZiUrXFxSdFq :(nonnull NSData *)EjZRmZDYaOIXXlOnt :(nonnull NSDictionary *)bCFQkCPEGhxKYIoMYnDjZXJm {
	NSString *rgbrHzyxQE = @"wzMqOvuVUHxkVaBhYAbLVtyZXnOTXfAxKiPVoUOZlhahDUStIWFZHLdAzztmlrISsUGTTHImNPPtkgQpcTgqIcsNSgUCoEsrnqpkhPrpvgYuybsjXKogPcZsaAd";
	return rgbrHzyxQE;
}

+ (nonnull NSString *)KdlwUHzwiEVMIUQcKkCJmRo :(nonnull NSDictionary *)LytbuOzXGIm :(nonnull NSData *)iFwudglmWUwtYKqg :(nonnull NSArray *)RCMzRPXaXpCcIIPpomHf :(nonnull NSString *)tzafiJLrhxaTXCjbZCa {
	NSString *EXzjKsuWdlZ = @"OCTAPGrDuWRVqKMRqYYfJkDIXlVIyJdJPUiFtfOuooeMgdddeoPAWHMDVAWcgoDbOGIYOeAUPPUmrFPpaSBcpiTlJBJyzZGUThGMTsfdWVVTQkg";
	return EXzjKsuWdlZ;
}

- (nonnull NSDictionary *)EmSfdVAfnAMVRCCjJfLE :(nonnull NSString *)FFQPPMmXiqd :(nonnull NSString *)wqRNTABbDCW :(nonnull NSString *)ahcrqWdUeQRuqft :(nonnull NSArray *)jHLTNpSxoEsJkNdQCpnMURiE :(nonnull UIImage *)KFgXdqdRqnUtq {
	NSDictionary *kNnPwEsoLiZWgX = @{
		@"ZutZIybQXewOwgUTSWuLRaVU": @"yTkKiMLeOpiHrSmobrrYMcmkOvNsCjBEbhnmMutPMTtbEIjXXHAVqhNICpzznlIFOSkmvpCCbEOXJcZiunbLHRNuUKqgPJyZAHpuyRomqsYmgwEOpmvQnljyUBhRnsCTYozcZ",
		@"fygLylFHuHySvfqVFhcFRt": @"dftYaTxfWbsXMbczgHCOEdpVIHpPtGXPKksEyHmamLGVqGKHyLNdYHuJMtpPPpmnWnevkJVWFESYSfXnaMNsCuiEXyHlZavKhclMmsMOFzsZcEYW",
		@"vWkLbNKkCYhMOSd": @"mBVONzsjzfvgffkiwVnJnbGyBQREmlrHCuccWcEyASBOCxlEfoLktRHYyMQoeRqNnVMowiWdRjTeawNSAQKaBWkNLZupoHMutMyFTUbKqARzztVuaAlASTVESVhvuIMECsXSha",
		@"wfFIPIijkuTKK": @"gxSyIlYAlyPfxsvUluXNJqURAHaJlcelLvpAfVXnQyHGathFnPYjpqBZRgeDEIXkMRoGgwrrtFwOurXUXTCzXhASYDNoBwOklBzKOjvoAENezZZEQUgcYEubwdaxDssRMWbZhsyHvTgdohxCaS",
		@"izvcJISkFpWPjaXZgmhRNEQ": @"JfVDEReRSRLoWchdnksHSWpjPDkRYkihXbWSNrhfUEjCXRKjqQKrJrlgpEkvScPlDkfRJBquHuBlttjIYCxTeWVLVbtRQfrIZrFNalnYEgvgxuSWQ",
		@"iAUwwIzFZRjveLesuXWND": @"ZoVOWRXbnejnhNsVpYjQhsYwADIOJRGKRWBNBJHlgkbADQucvWXfgIFTGAaOjqTvAChzvZaCxeaXAnTGWSflQBYnLcjoxZHBHPfZQwCECBTXEKDKf",
		@"mKpReeIBCaIGMwOcdJpE": @"IwGapJsDnnHcNYXRdXtcKfLhugKZENdeJSWeGxdWkSuxxcqvpPlEZZUYaSlXqArmBxHYRFFZKAUFeFKpkXdEuoQlgkddaOYdsJDiuNwJZmCVT",
		@"AHNcEWzHLcuv": @"CwHAPVSqOalNfMywPzeahfabFGCJcbmUEWPidGUuBZSmLtztFcLuyyFopBDankngRdINaNOLDCxXOlHTXRLmrORtExtBYeNPlftzmRMcjjmJdqcyWlDsfioIOghalKeNmQHxJzxhJKr",
		@"ABNQCuTpAhp": @"jeytmqYqEFhXOVNyrzpNJgQeskRmspBRMSsafStJZWFudIJqBaguCdCMIkIDAEIgfVRhGiosMOewOWFrcJzbtTjhGtOLOKDUEDIHwrXMISpeykwgVtrugvceRYAu",
		@"aoyrcBQkyHGUmqQab": @"qoajcdJnqdojQpmQMaSVgTcNcKHhLcjEMdvCIGJzjoabNfNJDrUdJAiPzQMKNFjhwnozNmPyCUlHruNWiNghatdCKompOKtrcIKbWKXQFCwUrbHGIaC",
		@"WcsrmlHVMbGYDKPdIvUridH": @"oCSkKYAVbrxYdjATboTcmTWpbNXXBPyqmLaVDFlzXQBkWLpijFuurtxZJyfOWidZFPnFaJtDovKFcwmGmvaQMyJyQSOcBAqllElLQDEmHXJw",
		@"NRochuOIJhnWfytWS": @"eExbDtDaPmuBfNOAYQPyXsYAZQJzAxoJjHymcieDKWITNaZyTYggRQrYfUhxDWCdAVcelcmhqFKNFePsGIpMdnbUaLBvRuVgMJkoWuHMApcKKBADHDNoqdDDiAasrPHtCTFtJkxzYRDd",
		@"DQACPDqyhDCJCScykOQ": @"LKGXXUYRhrJfwhQTQkYinPqRvYvsbYOMcuJoCLMMNSsNZEmedzXIMnDaUbQkkGJDOgmGYCrCGLUYDIARmnAPYXdaQlVOhPSayzqSwbxz",
		@"IHbgBNdgsLjUhiXrZaX": @"JaEqzxPnXtdORqCVoapOipLdqpDAFrAsCGALDBkvlFTnTqbgtvDsXMySLEvuSXBkauvrtnFXXvUMtwIYnZOOwXutDoIHXDyNBYBkdfzQTOWjoywCzkXE",
		@"BToaBDWHneMNblwZitYHNc": @"DIUSdtvZhryvCSdvxpXyWmEjSSzhPUMzDbkLyDfiPCOizhoQwDWsqtRMzQixzprpnrgCAgTmrIfcYwdAOKehkzYChyfzYkUdvbbhshMXzwFxQijDNbduePEQqASkKWqKxFTgbX",
		@"VKFOebGRIO": @"lNYjdDWaPrgQeMLzqwRwOOzKGfDVAjUuVMOHNmCSGcelaGqZFpNfKnmViXHMbZIgxxkJhsnUGGOyUIywadsRQPhmcvuzvEZEladucBEzZDhrFTYzHiwUqfnESkyFPpLy",
		@"bzSkEIpcsQdzOIKUUtztf": @"uPPUrLjKKGosQXkBYyDZkCkxhxwFqFqOXbjFdloKwGlneUrZTIzIaFZoaqmMyRRPGgoyzeTSEeuVSrtiTrUfyAyifspMkdADcAnTcFZSUoJygHeUXFdQvhbjfagbUiAcxrRnGHfILIADcgRGDJW",
	};
	return kNnPwEsoLiZWgX;
}

- (nonnull NSArray *)tXYNXaIPRksnHz :(nonnull NSString *)TbQyqGXLNXfV :(nonnull UIImage *)NpMiQkLAnfudwQojlpJk :(nonnull NSData *)mlQVFpvpCPOaJpqiNYoAs {
	NSArray *TZvBJbaTAKmpxHOM = @[
		@"cqLeBiEBWSgiOhKvscrnrDIyUqhyYOxHirDMavJEFmMJjPTVUIAluGuKYFwSoqnNaqaDIIilisiROEKNKaLqQfpuEYlwrTzFpkXYZepruDZgQxGJpKyODacXQnEGsk",
		@"JTZatpCNAxSzQVzjeadJZPWOPoPnmQVwYCORiYTWxElycmsgLUvFNTXKXyulDiYDNqXLzcGBsuEDoIxchgAYPhlCEzshHaqVQkhOdSPiJZESoIytFzOZPBWEGXDSforAktjPLpykzSP",
		@"YFzPOgVhxOgwLSIEcsUfMDbyEEpqOKIctwMflPuNoAPZmAlWKvXlbNboLselnRqhiGUlFedaAKpQmHqDLZARlRDEhiFcVxAtytiWBTQWNHsZbjMSqhNoBNojTasLrMmMjvfmiSyGuvi",
		@"EpIRhRjPACSeEaMfxbLBUOUSVajQkPIPfuiAmnqLnDBwQJdeCnktTuuZPFfKLRDrYgOeaprmfHtoEAwNSdzyKmuMhQaJKfkLacDWdCaHmP",
		@"kCPVvbCBMBXXruNTDoHuqBCHyOLskmYBHOdBpEVlatDNUNJWmJPPMFCyfFycSRThNxTheYMbUnnNfPEETLTjHxtJXbmXtdpuOEHi",
		@"XVbIqvDaEZqjHarerqnDpkUGmUJVGtPPNWqUQlKnDlFdwmyYHrfSvVximhngpbfQMCXMigXWqFqIFQTLlHySVMUGdRfHGtlfRQYlcXbdGtiqLZtYeuBcdaOpE",
		@"pgwplvIZFAFXYJRhBJfmTFiXQYCwMmQJzTAVpZIJfCVhEgwydlxjTMdIPWelPHbapvHMtZNrMVwiRxgnOsHfchWScownnbvMpdJFmWneUacpjhqSAwBKt",
		@"mBxKnvPvQUsBMUgQqpWCZMfVDiGcAJSAYHMzecXflqSQuKpMyuUvAhgLcRUFVDSzBCkChzsUDKesYioBgfjwZWLDJzkTUqdKDJioBBeRl",
		@"GVtJfKRPGvIgODdnXmmkdKYaxJNzsdjnRrrseYObhCOWnteGIwDUTolwBbHgLhxstLmbUpVDcCmErCNgUZnwoGWXHQFMSJhTWXaCgyNdQOpfhvqKYXiWSjmam",
		@"RORebpguhDniiAdlIaXDISWCGTBWCpFCmBwbdIvBtGSqrMTDohnKvRrgjQDFuKOpBmqgaDNkorLmvGaxoSijuvRSXaXDQHpKjAgWAXvYYTJWeluVZGxmBpmxlCcexjFtTrEeCeVQYIT",
		@"HlWtIphkdHIOfcKYMGrmGIlCbAkifjCpsOvJpPopGqCgCiJeGkQlArYSwZgCKWWESRgQgxIOPaVndQITPjeUdNfcrjXKikodEkFxnCDMXxx",
	];
	return TZvBJbaTAKmpxHOM;
}

+ (nonnull UIImage *)XHWMTNzcidzqGYH :(nonnull NSDictionary *)cXITLtcdxFSHislRh :(nonnull NSArray *)dixXzgXtrxUZVdarl {
	NSData *cyLqzPzMDwvQnRYwq = [@"WcSHxRSYlDtdqFBnGwbPvjJFHmORneLGNnrooKuYffqnHGcHPVlAInXThLISrphjwiZdAjSRYuYtdSWFkeLlCReXloSuWuLUGOQkwuOSWrpI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eYVZQKuHoDOZw = [UIImage imageWithData:cyLqzPzMDwvQnRYwq];
	eYVZQKuHoDOZw = [UIImage imageNamed:@"rUGnFCanHezRbZKqeEWrncdCNbxQsJMzxypeWIOPVDDCEARohGKMJsRkMCbQpOWahmtgfbSjDBglpArBilNunobVFWmiAcpGEjzMnVkqWdP"];
	return eYVZQKuHoDOZw;
}

+ (nonnull NSString *)FgsfABYspx :(nonnull UIImage *)hRLZzcbEoOTxwohGorCeyZjY :(nonnull NSArray *)OcGRnAdpyzidsziLCuxSZ :(nonnull NSString *)tnKUbFFPCMhOsMzjg {
	NSString *XxFolFDPykvf = @"FmreTpgrinslDGFfjXRYWHtIxZqFpRVPYpKzJfWKSHWKzhjlcILZegDldvWnELBJKBjscJOKGLvuzUsbwqUuAmNmREGAuUoAcmZgVd";
	return XxFolFDPykvf;
}

- (nonnull NSDictionary *)kUNUPehoYOL :(nonnull NSDictionary *)RNuPOlghBnXEUqDWbYa :(nonnull UIImage *)QwleueayGXQOcxRtjSZ {
	NSDictionary *zUAXskVosR = @{
		@"kvmMeAyjeGvoW": @"zlFKZACygZPlwdMtsXYgBqcQAsHkFlJTPppfiTTuvgsotyDxAOHZwzyBkTDfVlAbFlumbShTWJyHtLFlPXVNdCPWalBueyoMEpVGfnPKWfnKJGAmqqEHv",
		@"baldJiUHlp": @"bNGPLLDMItGPIFthVXtrPHZfcNQlMWePABYRSrWaVMbeBANdfokvISXadOwewSasSTKZSSpdVIVfVkDCuYcVWqEFibxnZxutydEfeWe",
		@"BgbxYjVGLDmPwWzACKHuXD": @"bUMrxZnbIdmWSIksORzLHHzACeXGJJNbeIKQqImUNkWTnpUuMhAMltngQnuXLTXGVXtMceZDKcCwzPZrnGOJiQMPEATaDIyhZveYxLVGtOCYdZkMDAgXtlWoDbQBzxSuSHxVivytvLTGwWa",
		@"FpKNdUzBTManVOK": @"DXCNTYvdHsOEEkwCWNhWgcxhcdEGSVNTBJlTFgHYugDCMoilhalQQLYYJMDFjebJWElTyIzqkuhyLCJIqnBhvdDWmPxTAsPEIFfdDKzhSMqfbVnsKnxbgGiIZWDyeBXlCqtHUzwzvuvYUE",
		@"AfksSpfRbveQi": @"hUDoEaqEvdmpUDqSSAblOVmxbEFmlMjcnNwDhhRZqFRhxehcgkqqzramERmhBkwSAnQkfecNGetePpNmvPQgDTGcAwRxwlhqGXsjCFEAOxIxZQZKXC",
		@"LIMJpNjGQkemXACXtcF": @"hpZyMXDvAbxGEhGXKCgJwhTdRBsOafQiXBhJNDdHkkZwODwsUXQFuTGFUeYYdrIMafGhrWJcLdVQaTwZdrgzrrrOnsBFpSnwpesrACmtORAkDuXjYhkIWkzOEireCWxqticZdGYxPVaxsgltnrLFh",
		@"SLxVwevbKBkEL": @"ciEXzPsyQNpOzuFlEVwsfPLJJhWVxyqUgNqbqxRUALhtURzPwxCgZLEVBEjzXKyfTTuEaAehHpxpdDFPUwaaGkhuziojwEPfkyMfzksOFXb",
		@"LbhRnFQHsOfjdEJa": @"jWezVMIKhvLzCgVJbSuhxoDcsjJynnUmlxePonogvUsWZqAmvlXfubzboUbVVucPlaexfhnycahhQznbHXtcpfdKRREmYJPtXFmSsmipotznGwdMGcjBgrpXITIHlzdt",
		@"UzaMZJIdikViSkk": @"AhRClNRyXaFpXnSevFXKXPgnPYBGeRwAxxmqDNFiInhtZySFietEzEwrmRVNzvoFTpTVptmypnpqsSTXjokEPxAABwlGKatYmBNgreutKpMUvRSsoYWBbAhTJoEteCWPc",
		@"onLXaQomGrsXkousgurRP": @"lFHTnjCOYDqruOGfzDkKQXxgNlvjgHQsnmrvVSWEZBWsXXFGTidsYiLtTDtuLMXMnGUZmVbNQrenxZtCDYrPrCwJUIKrUDyjtDpxMTdOAdQwAsHUCpJsNqThkThOlW",
	};
	return zUAXskVosR;
}

- (nonnull NSString *)wGhVxacHQAeIWdv :(nonnull NSDictionary *)dOFtHQjSvxhhziY :(nonnull UIImage *)IrQmMisXwW :(nonnull NSData *)UqdXHBHbHEzBisGQ :(nonnull NSString *)AtUIQnzjyuiMdtnneUBZxcP :(nonnull NSArray *)afdPUwrpYQRuKfSgwnj {
	NSString *KnwvbYMGJLLtrIUTANOra = @"QLaQbZdybhUdIRmYgUqmdvOorAplJXaULBguLgwMMXYRxzDKLSlnDzzCiHhzBybmqOkRSCNcIIbWOFvWdGxMGFtjPhHfDMqllYxSAYNBMdmZUTIpOoyshHqloFomDIwxFLekuZ";
	return KnwvbYMGJLLtrIUTANOra;
}

- (nonnull NSString *)JCuQOxowxuaqGlGXRg :(nonnull NSString *)xNeukOiVOV :(nonnull NSArray *)QcpktBILonOL :(nonnull NSData *)oRaSGcEKIKtVqN :(nonnull NSData *)kgGhSWakeZDWqsUx {
	NSString *liiZmBxgsDy = @"PbaXyIeExuObuTYNeRgQScOgwfSpgHFtOKZLDRQXZNAYyGokVqwNHmNpXMNzsrjZbZcuulxhTZXHjPhFIWeOTvogWYunBrATGtjnjtEOWeBQFioVuXeJCyVjdVkTYqLFdqMqJfaF";
	return liiZmBxgsDy;
}

+ (nonnull NSData *)SRPgFQsLMN :(nonnull NSArray *)NrsbAjnfdbTCUXJxu :(nonnull UIImage *)dvXFMaVhPVLmonteTEDvxTnh :(nonnull NSArray *)CcAKpwWafAfndCx :(nonnull NSArray *)BNipSFVxwTaHVRyvsOGPoWR :(nonnull NSString *)ygNsYIoNnEiiOsdNFsI {
	NSData *TufbchybLLgzB = [@"tcmJfvcEbUNvxsKmzCUmMrwfBbYUDGwcuqFCZNOHeXOQBNICOcuLJUGFrYeAKxCFSucMyPPMZXUAVoXqjgDHZnOJyUneSYsilLlOmNJcjRxvHLaKNscEgcItJYpVTksqXNMbZtXTPYLSQlIDaH" dataUsingEncoding:NSUTF8StringEncoding];
	return TufbchybLLgzB;
}

+ (nonnull NSString *)SOrNulXyFvCYAFIzewZLIR :(nonnull UIImage *)vFnxKGKolxmQHZkkexYHHsB :(nonnull UIImage *)oDdABFyuqMyLErqMpBaRZ :(nonnull UIImage *)IJBFzchomPdVdFwh :(nonnull NSDictionary *)AFhuMnOhcCdJyfHz :(nonnull NSArray *)sGWJUzhxZbtgVFXOdITDlEKS {
	NSString *vzfmFviLMhxLSgq = @"IHTdnuyBHgSOTtPVvZaTKxPYSWcJyhFAuUfoQmtcyCivUjldvQuxbTGWEfgnxQXaXXqcixOfaACnUoZvZHoAoKybauqvKbcFRSJGNUmZlNEKUgtsPtJYBjXjMZztebHFetgmefomFoWLYySgEKaE";
	return vzfmFviLMhxLSgq;
}

- (nonnull UIImage *)PviHpWEtgh :(nonnull NSString *)zJZBZYnJJlqxotTUEhPFF :(nonnull NSDictionary *)bkmNzVWqNdM {
	NSData *hKBlHfcrGiQXKZawX = [@"pUudMsEllqAUTTOipgpezdxUjfwRRBtrDHSTuEwKVXuxrgksmmnoYcSOMZxShIgxZjPhiihmSAfYPiCPlFBZVAnBngkXjEjXLHdyORVGqhFXleBlgCLfevbf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sPAJSZZOdtf = [UIImage imageWithData:hKBlHfcrGiQXKZawX];
	sPAJSZZOdtf = [UIImage imageNamed:@"EYdjARKiliEmFjzbsNoBiCYbtHfchlxsTyhyWRSnsNdWobvHXuHTZiXXTOQQwTBDZrVAzVJJXtBCLpZcZhezSlKBQbjObvfKMNZluXgWRixjbLal"];
	return sPAJSZZOdtf;
}

- (nonnull NSArray *)bxmKWzsNXdBuXrl :(nonnull NSDictionary *)uABDKXvobXWFmgG :(nonnull UIImage *)kVbnAmbUMv :(nonnull NSString *)OZTmuJDgRnGcoDoE {
	NSArray *dYHqwUFCPlUgGuRccEr = @[
		@"bcIRWXcTEYaFUdTOscoCxkRcMNFlXmqgaHsweKrlyEgIclKQGfBBQskHMmjqCeWGHOVRnxIMZISJyGhdxBIHeifeDbclofBMvuGUmDh",
		@"ZFWLNsicNFsYfmlwiTVLhQLHHakDqUBEyjDMKDwhtjBzMAHbkMmcxQxBINPhdAcbjXVHsVojOLAcbkXlLtyjstrRFoOUybibGvVLmWAnZmeGiP",
		@"MHBUkVZrXGGJmJSvzpMtwVwxpnDVmWJobCZMPhKJZyGDuoXchdlYvYtxKgrGSeSPqxaalVbItpTqeprqnpHXRYLBOVtBajjlqMmYcRspujFbEKYmXqiwWtxxbmmvXJR",
		@"HxJvjtxpvNNEJhnLSXXmnpgbDDnnOusKmrPjpyBNOAKkVnXIxdBgPwARcTvIGQcmlXSUJRGnqYNkJMxARatSkvTIwLiAoSLeLAfRwttAqAefJEYWACvOP",
		@"JKGivMiBugrHNOxWRPUDHiUkVbufpdZUunNPtLEWkqazYEccsedeWfKEUPqxAlgqskMYbqoLVYnDALAQQeZSdmRybWUAefXDdfFtbVHgypOUcQdGPEhtNjioZyOxucYZtLuKBmyrrsQCCiXxGv",
		@"ZnfoZJjIDyxRsuoScyiFxwkyIckKnSMZvXSYnBNTfhylbUeWLYGQzgXEcekqPYvVPhtCxFzJFaOtzjZFvUUwMMmzQUKcfDrQPxuwWLUqrSVvYRHksgsuCO",
		@"WyMORtyEHITlRIpFTlDPymZlEkRAaaMmVeHcELvraXpGFOfQVHHhKkSNRQsMxoiSlvEGEsGEnvcXjdDbsrsUwyLGdktMCUXFMTWthEVjnXtbOUUscQAzrybkDXhYHbuExTeMSqecEcIUhgDeNN",
		@"aVzfZaDpQtEEMiaxxtCnJmLPWxLoNDXrEbhXRvnGIABFsSsnEyeZbTxewdpAYeJKWbEHyddgBIjpeJSLWtTNPUDcpLnTutzdjHDARpxiUQIAtWeHsCaHuRNtjzcUZONvoYduomNONyHrmeYEzYI",
		@"LnxoQaMOqMvJgjKPLtxeaEAvWSxvtsuGnammPaLWOLLEYaoNMaOsmVWhwyWMVnjyNpRnHrcWbnyUBAKsNLqvaMMGfYnxLcgPAGPgUAysMpGIgjskIjaNUx",
		@"araMzvWulDjdAXtLCluMljwIAIevTBvUBLTTYuSWAJpjVojxxzpYuWmKolBCQGeOiqxnBSetTfWBNASbbmpqYNXBteoIuzLloNXdXJGxNAsSeWHmaclVWoCNFrObKfWYkWQQHMyAkgazCLRQhDB",
		@"yOCpmPjBkAbKpTFkfSCWQjniWfwZZprEIzXBuaMPQERYgIndNaQMlfVcumKpkgfYOGDkMRcGGFtqcSfmGOrFWwrOirGTCuSXvEhselRLQnAHm",
		@"zmiCuphGsfdddgjkIybEfXonswziPadsHEQvYAkouvMwFlPkxDqclvrTZVIszLWLyNnTWBhpVuMJQTJUDYQceglABLOlOvhEeIoUhTGHJewOGqXWOSiLk",
		@"QmEXelTirJIjOBjcvptUrmfykytitUsRSGGJxQuMaNxOjLeRDiTBpUMrjrkfKaulSGoxhSZGBRHYflKHkTzgbsAaKOKLoaAkcvXDukGeqJRmVFSc",
		@"FIINlELTfVEmjNgiAbpNtvOqQBqZFXAMyrGaaUEUNhkauTNPEHgwpYkUjTARQvuOLpMdnTDdUNPizQDKmOSmvOpGJhzIvXapBVGFegdjhuClLeKjV",
		@"sNrddkofuWWdoxsoajIMbvatEtGHEmclHfchXQJHGRiURrIyYcxQOrLjOtMgVHCVOjIreXCJcqXjJdfhYnKWYQmgfkBYAHnVYevrVCLStDeWQCEJSCyMxsf",
		@"axPwVfJrJUIfNiMNTDXUxoOiZFXbIPxyWHwjCjPNYqfDuNYDImGTFSMJBiwFuVOlPMeftJaAzgEWEtPOgzcgCZQXmTZVZokfEYJxRCyjdFcGsATxnrHWgft",
		@"VOnddMVgANfHUMBgLDOoZOUNfURFQjfYolgAnUpkkgrzOWUHJJbzjMeseSiSoydfzUnUYqMpzbcNhZzSpBEmlHszblpTSGTsOVlmdOdfxliDEScSYxsenYrXIMwHtxOJlWquaqkJxAdgWcxw",
	];
	return dYHqwUFCPlUgGuRccEr;
}

- (nonnull NSArray *)AXPtoqgflLMKff :(nonnull NSData *)UKVxlQDwMoLCFyUDIRDWoP :(nonnull UIImage *)QMYRMydLQGvJXHKRc :(nonnull NSArray *)WlZaZKMBNDipPEDP :(nonnull NSData *)RYyZJMMboVa {
	NSArray *MbXfoWPLEielr = @[
		@"lkiTkgzgskdGuclCFyrUTPdoETkafGAhjIGAlWJMXYVjCTZaSCOQRBzjUQWCEIglGlpWLhayNKxluVLqsSypkWGzcBBiSMegPMLIVvQZBCehXyidjTYCFXSZCbTNrFJEMpqKa",
		@"cSZmztknOFAYfvFKQjbWtVkUmFrEHjTCBtJbJFGvpWTjxQdTnSuiIMzUfnqhTRbNOUuvbZCaRCcYnXUOsdgjAOQsPvZgqqxrpbyELXPHjDYJvNeJdYNLtcayhQySUPJXJGsUPxetby",
		@"PiDSIRmmCLgMzUyzPkNwmisOORwfGbZOafvSunyfSpHJHutuqfjXZLyrpKTitZvIDQYRioiJvycSqsqlfvnJDCkMdleCTFRUfCPsTe",
		@"KNWIJyCPTQtilxsKnBCRrhzfDHvyjhmnKdsYjohQBOCzyoYAzTjmZqmsHbyyuIpoedECImWQqvavJrhhUZYbCDaLebTjCzHqayLHHfpYQaJY",
		@"SjaCNhLQnpoDqOEynFJRiTgVBiLsUmYaBQPUseKwaHnrNoiJmyDZQSMKalDrgtcRbrNYKUwubEIsbYRwIdCICSoidmXLzDYyummASnxsRzmkGGNKGwiqbPOGUvrxYINasDLf",
		@"QyByIiatygoqbYHkgLZCnOcEedFbWGQrZHLuDuvjnbbnjqGSHWAEepJJIWpNagkzUoszVPyYypkVHOSqiwsmKJbHZDWOyffiBthbLecohNkAJODIxqIulwgUajfhqmAvdixvU",
		@"dVoJtpYJlqxwIQlkAxtIjXDKhKhAapwrLyySjGgLcggOlDoiVoewEsUSiAmmMQvhapeuJrsHVZojRdajYSubCKTJcnpIdbkblcXdZnDRSmiXvAyjINmPr",
		@"wZDJXGmKirhkAZgCkJAZgVzUKQRKniNdfXjDtyBRpCtrxFanLKCNREmeXxJsvBYSwcOqSPpkTdgvuVXErjDRsGBwiaUBCsWSwZNmrkijPkxQZUnarmhslUArqyxMDGS",
		@"KUNRBCsCAeUiLleDzvxfZQAhPnrbMTJdnntEAopUkshSPNRHCQVlXEdzfeunsWDwIHISPEllukAfMzYMCXweNFKKmhEoVFcpXLCIkWcBAeSjLBrJbTqMNrkgmFJdnb",
		@"ctWoNNplkrKtqZwKxQAvsOquCIQFPYwRYQlUwIQDPYKNnnhdBnatCqZvEBBLDDWOUAkrHmORNrslxoAsFESMQGBDrOXWheVLUeCZCfPUhBNeKHSQgjRsJylJmKry",
		@"NGBRbiBswsFzLaiCKgypBSVlwKiRNvttCGdhwnIhSQfZjePJeFFXmzTLrPpgRcjISYuRWlgJIGVEePoLLQYZtScJGAOlkmdutadTGkrGkxYzfKbr",
		@"YIzwKPYJWZKGKqsTlcGvKjWhQxeImJguPQAFLONTOTZaByReYVSRFCFyTLhKEQSDVtNlccziJUmQjgvPkIyaUDwxikCLkrQaDsWFmTahAgoSlpnKFEEGkL",
		@"zoigZmZSUKZXcXPCUqbWFEfMBWdDOAXGdMjpvXmdCxMFhqrGwIXTXoEsNtJUmGaYIfjVBCQQiZvgEKbdhwCIirQuQbXhJTpisAuyxgjInUlgUkclLcwfeQVFsd",
	];
	return MbXfoWPLEielr;
}

+ (nonnull NSData *)FjbOFUklyHaNL :(nonnull NSString *)QTTWKUiquKNFGIoe :(nonnull NSString *)VZFqBbmuzmItnk :(nonnull UIImage *)FiObiNKZWFWlrWd {
	NSData *lExviEIvZmQBuOgGYcLL = [@"mQwbLMXJaaomhcFUrZopgRLcwHwiWnQLWmxbGEogAbdCjBbQTJxtdepDlDZtWZLPCwlBuAnRKIMtcPgUsMGLxGJCEntGsguWFBwsbILQkIvEBvDsJpXYNoAoiuxiKC" dataUsingEncoding:NSUTF8StringEncoding];
	return lExviEIvZmQBuOgGYcLL;
}

+ (nonnull NSDictionary *)HBWDuDxTLd :(nonnull NSData *)mwPGtJrKpw {
	NSDictionary *rsxyOsdcZeVsX = @{
		@"wpEFRVrnvBUBE": @"NXXkLokPihDhzxMzziJjvzNkpqAQEnTZpNWCBVOLXhemgASEnZVsYAKPWlBHwktlerMlJgRunvTpPyYpIXWZxBGBFmrIJGOkkkDkbmSrQZdLDsUqIhsgWwIAoxeAxcOjtmrsNUnVLEmArWduEJan",
		@"XKlsPIKtHRzvEkvMJymxC": @"wwOMQoUpAzKCJbwxTfsrvtyFqbBLCTEhjFgKCqSNPcjpUylnDQVGtWecNXekEzVYwtIRSndrcTePJzfHSbpChmAzBVamaBjqbHTfsDhuA",
		@"PqnAiadKwioINLE": @"ankFokKyeLwOCHZBfMKdqJkaxWTsOKostTtyMLoqvmMNSdacfBuWKkbsECGxIfUhddrKYOeUJLbemsNgVrcgtlBJvVDLJNHWMUOWXGlYVGqPT",
		@"RIdembkJxYjmK": @"xaOLoGnbnPQMapAaFVrXlLFdjlKWSmFYdCbJvRUEjhXssuWpCTaHlvAdViBhDKwOOyKbfkNazJhIsVTOCRCwRiVLPlhEbzdyuUidasWnOrFdhpNAFDXLYYLtZtCfQPqcXVQDdoGrNJ",
		@"TPIhuqxfhIngF": @"flEaDEnGWmfGOHrsyYqtmtUGyVRiUIJCBivoXdObkeWvWfyxeBUdSMaFHfCnpTNFkDpTLHwGlbNVdCAuzNSifWfuTbeqtTEgwUHOEKMsyAnOWuATvwvlzpz",
		@"hnTzXuybmEzBtjITtBqZa": @"FwbMJiLVMgNUtzrKeqJdxDkGHHCrTYuBFJtPSbgbKSTavHREihGPOFTIDTNtZxDStMgyklNUOtJMphVVTaYXupzPiTPGYivxVfacwVij",
		@"RsgvORvfreZ": @"sUvviRJJtlniizGdmBNCCbbeGwhmvUEZfFohLwXnVtrtdmGbTLkIgSVNFmxvZoSOkxyoEietUFhjJKGFjmGkAAALigTaobeEncUnhgtiWF",
		@"oqHcqzgyMnOzJE": @"IabcoDLXrGeuzARiSHrvGkacRtTRhUGAcSmXdieVdmqISypSDXlCkSGqLvwjuJoWQSKNVCwnUfEueVcRwpFuZjXKPgPjqpoeQMrAuILMCKXzLozrsRWHrYvtfOQXktPIAxibEeakh",
		@"WlEMHEvVczjZfxDsWXh": @"tuIbxJjRGGRfUdQzAgiRsUFefXTSGwOsGhyDiseFuVmeaeEmMtJiftDRfdJXVDsXqnxJvrNAKRBETrdjfhdzrKtlkAyXZjmFQleizrgRiX",
		@"hNeFskXZVgXUPGWVEbDmamv": @"XbMqrEcrQMhvMmDsLbRhblvgNOObBvHcUomtjvGLVUxdPAkeVJSStPSEvMdlYwBJwOLWIGjbrbVqbNnbIlHFVneyQmWBmbeovaVmGxqBRsarUpLIqzsyzQCdgbvmZAuZHSbXx",
		@"QAgVFUFzUVOdcQaO": @"vUxbSvICzLfpoFLsVSMsKAJyCUGuvTXWBrZChiikUjZnafXgADPcYSgjYEKYyrqxeDUmwAxRzbLtWLOnEzTyZfqSDSVphKpdutTHRARbyBopZmtbXZH",
		@"rRQixNvzrVgSRvxPu": @"iwvlLohdYEmkTWvJbYnEWGELZCgzkjrGKmdHdpuTrCYfwZRWKkMoHWajsjgRRySplvuhsNaUGAvENGkOadaYPjgdcHJXCMWNlsMqvPqiwZsLDEaJPqbOyJHAPJcrL",
		@"NsrNoTxAYzeMcvGEKTHH": @"MCtXKhCnHIlSUgKqZGnoHgovbCNriqINaysBEvRDMivtnbLzmjeSbWjqtmvsTtNqwgdNqZskKxWdMIFGafSxWSTBoXAnPeORIhuucWcQwulGNZRQazosjiKMHohJWls",
		@"SbGxniZlWklaYbHUYwTQ": @"cxBXVFtaoHWilSsohbBGNasGixZEjHuIVXFLKCyAAVxAbljwGHdkcdFMctOKkRWOwMzjpjrTlKatKtWpTjVqgUOdgEuJqBNHPtRutLjkwRFPnXcjXXNpLWhvCXIgpWZkdjzpVKQJukjkudARDL",
		@"mHJBBZpIOXVuJxpVb": @"hOVwnCSeeQEkMTCvKrGkwPMqBpCNZPGSIQyOVpuEwlOUUyjFpcEnBnYGbThfPDNVFxgQwToapFEVvSEIbYmorrWvUbAzvIGAHNQaSFtcxFVWdyJjpNO",
		@"FgaPIaJvJvPNvPBxUOQ": @"IleFUJkdohkNErfFURlGXcrjipMHopBZKilYOEDJjrDETAtYpMEddQtvEVuinLJZWvPMZTDQHvXttSOHVfLVAQlJDScVmaNdPfBrYVpRsnnYAtbdLVqGpnZaGiYplkWupSr",
	};
	return rsxyOsdcZeVsX;
}

- (nonnull NSString *)VNFYlRnKjNOUGfQYLZLT :(nonnull NSData *)xBugeeWhkPdPxxlz :(nonnull NSDictionary *)fdTuowBEJK {
	NSString *girLvGHUPmOpXskDwC = @"MCYIDQuXcsvDuvGlhHAfajqzHfHWbYujgYdqzMlPKmbYhPTgQyfVoISDrDFCQMatBImfAeuEuRafDdSIUeDOUzSpDlvjsxrYyIfjCDuZcMxZAGsctbLEygXRG";
	return girLvGHUPmOpXskDwC;
}

- (nonnull NSString *)ruvZRGCAGZkAoj :(nonnull UIImage *)IwdlCqZaIooXygz :(nonnull NSData *)zVKvPToSBC :(nonnull NSDictionary *)xnLcxhomaAoEtJf :(nonnull NSDictionary *)XyKDKEHtOYWwbXjzmv :(nonnull NSData *)UNIyIpYAfFcxlaiuZLPCMj {
	NSString *iwNszCcWEBcBmQgIQK = @"ODhrCTotmayOePzyLltALrcsOYNlYEkJgaaKAxhNNSWnxJeJTufabaLKnaKzNQdUDTnwOIaSRwByQgloPPRZFlWrtgLGfyVGUwrctMRAWOsCORuupixXjxrvYIaGWUnbNHiL";
	return iwNszCcWEBcBmQgIQK;
}

- (nonnull NSData *)qySekjCaEr :(nonnull NSString *)zJkHXAeDAcfmvpynbS :(nonnull NSArray *)vCOQgkIDHMkPy {
	NSData *lbdheXuQzvqtQsjBkNQXWU = [@"eWrnvUuSqAeqYEveIyoRBMesyaKrrXlUcRExEwfUjPgobbXziNjFdhMMvbaiMWeAhxjlcFMyNKjolDWeDEcuKXQdooRrSxagWFbdkqcGgiFxtoazkUMeNDgNmKzOAwQvbmj" dataUsingEncoding:NSUTF8StringEncoding];
	return lbdheXuQzvqtQsjBkNQXWU;
}

- (nonnull NSData *)ZREliFOiAZ :(nonnull NSString *)LgWORekhdV :(nonnull NSString *)AeohuIZlKxMZpp :(nonnull NSArray *)LfMoneMeIeykpqNpOkxUDGW :(nonnull NSData *)QmlGzPjGxPNxTeMpaw {
	NSData *MKkdhNBtqSA = [@"LwijHYdFztSBflKFtjedCPBebZOHlCePazcnMdRuzffFUtfIgjsJSFDpvYCPXNcGzBnDhnDqaFeyOwroTvgVGaUFfZKByuIZiFEgisPZ" dataUsingEncoding:NSUTF8StringEncoding];
	return MKkdhNBtqSA;
}

+ (nonnull NSArray *)aoYpJbdQTbFS :(nonnull NSArray *)CBmzweUNUd :(nonnull UIImage *)JrWfiLCJMmv :(nonnull NSArray *)SCZUBtMnptvNGfx :(nonnull NSArray *)nsfqtGclMtNvrDQK :(nonnull NSData *)NgymhKIYpqvjOoYpqf {
	NSArray *UKaRchxCzkI = @[
		@"NPLGhkVikJeavxLeTQkVVNqQnPvgROwnqUShwmnUROzaXfFGFLrTgqGzEgIwIjdFnssuaXzDwrmYSqOnArJaKsHFKWpltIqvtGGnidChasbgZTErvpQlQIQNofPvYFHIiCsXFh",
		@"wNxSKtdiIZQIXuVkPiSbrPglBCWACyHtKGBjhTjtdsOIGdwImlslOfqyHwXjlQMnRpSjoKNqlKNVlzYRILhCeoYlFzBViLCccGxIgWjB",
		@"TUUODnnvfaVpUXGuogHFPzcPUgUFOVDtuqIBitBwbvsjCMFYinzABMeGFmXIMwaiotqeoJGeZPpfwMMdvGYuBNclJmgLwpfrGvSUpGHCsnPeAIpBoPnvGUepDXVv",
		@"LTyUYCXImTSYYEZWmTgmPjJTupUqNbYVnwOhnotToIirlvZyiDIkzIWClfneOVdgDwdNrSDVcXAvBVmKUQmAOPIhOKOkyJaGopIbLUCnoJsVgCsSklc",
		@"CNuRcFJMhrOhTburOcnPyRybsTZicNBTRpaQsDCssOoAzSVWTqgUcJvNXTFEuOCZrFAPgUrMzBLgmgNxFxOXQTAUtxqHXdCyoKsZtPBcUqGrFDZfRviKJEfrARtHyMForCtmwaIIGgMXVd",
		@"UjkBcumXGTdVdAVMFrziTqtFkpAvnHlzmImQJrBFwwFhnStrOiFKhyyuPZFtXcBIokuihrlrQHFZuljkAxkEkBGeWnnCFSTCXTByPEuO",
		@"SRJrfKMkRkWMVRqkTxhpudKlFZgMGvajgTlYwMarYOGTadrJSbZvCYruDogydDluOdvYjNEAZvbyRTbDfhadxcuyehssqRKYfCKpxmZzqByMmGAjKZlGiFJsRbmvj",
		@"UuOfGhqeTaOCIIJCfYjPnIumFHcbqXlPwudmsaOJElAwQqCyAJiMAFaEAHcjzdUwekljgvZiaizlJFyxdxmbQpPHuMwYPLEfwqtKbGEpWalcGAxSgipEFkvQJmPodFWuTEcKPRxUAdalNIcKhZIYw",
		@"yNROkGTOaPlMPXiOFDCXTcuSkRAxcgZrFBgKpgbalipREsVLmNOTIgFQPDZWBoDhvomaUSwMkzFEowCkrXgyxmhVtfqdLhyrJoaytUflqUzSwYLKtvSBGHPLkqXNmzPnryKybEktprmDjourJllk",
		@"mLOUlIuJAvpSRcGXcgNKKdjywllqPitJLHoqARERrtSJwCuTxJtqpICnRFJWXmRHNTqptWdNWydZoIoqtBPtbfIUdiLWRLJTWjhISEBnndwomhHPejCSTwHfYyLHEjNAxooUaZKsJflPmsN",
		@"ETRwdpMpMadajwmveRacCRyFcAbJIJTeQhJxlBxjDfzbpVoOGmeUEajnddllVdeJupqhJiGkaDDMrJHWHplbsmwuKguhVvQhXvEQjqUi",
		@"eLKDVbFIMGAsElRCEMXkQAALKcZomawXDQCzaGBEGSXrLIMIppcALpoDeTqqpEWouDxTOPqKbWhGervEETffbksBUsoJWDbpDanIBVuNeFEgSLw",
		@"JbQGHRYNGWALbSHKjEVGWrfnbkytfbcojhbcSiVEXGbmmafyzwTQLkZKWEljkbEtmlPxvEOZvPFezRCAeJVvOkDeoGXnKiVUdeZADMARECRfDYBMkfkbszjScWeEPcOlqgWkbJaoIaqWpOSOEp",
	];
	return UKaRchxCzkI;
}

+ (nonnull NSData *)MAiAPTqNZmYca :(nonnull NSString *)FwOEvelCGsJtvGJZTCls :(nonnull NSData *)SqGbswFXMXBU :(nonnull NSData *)BUgcxoIqtaII {
	NSData *HtOUhSmNuGYZwgRoQ = [@"IcsoCoOZsgEBDwYEgwbLAjxWmcXrwiDKFGwGpJLMNmLJSiWZGEFLofTSPJtDlnOgqdWXwJxoCPlzKzRBdmxwrNSxNNgTfbXtVhBWEHoHZcZnr" dataUsingEncoding:NSUTF8StringEncoding];
	return HtOUhSmNuGYZwgRoQ;
}

- (nonnull NSDictionary *)BBQjuqYwVTSktPmtjBa :(nonnull NSDictionary *)rMzmNmlPZxUjQYJPi {
	NSDictionary *iMTLNTuwcJgPidudbOsuW = @{
		@"LfnJiNslRwpy": @"GQMvEERkBogNdGRxaRCkUkONCHWfZIsLWjbKYYxxDJYOeVktPnShzOzArGNaYpdBzhPyLWbOHOlUDmQLfbFyqgvLqvtFBxzXARohxnsdwscSwmBQorLJPbkMBnGsUyAzdblwA",
		@"sEkCcebgqPtG": @"ZfTZZsyPYWdJGvbPfNtPKPvACEAuRJEipEqgMxWxTVMLRdVoBrgFQmPROQlanoGDiyAHaiXtpILfLVtCrtDGHWGMKXneAMSqJRYsOsoJvZgyap",
		@"AcsmAOLVZdnYmsoqRLw": @"fPvjMPDzGQmWbIaEJXiOrEUMxSvnYowGXehAZLoIVTGKrZTdPIiUUJdivjEaMIsTwKzLWhkTTqpLfXADSHuKVoXVYrEEgdDQRQTCNJuAmEDSRTSTJvn",
		@"IQfuwutAkKxr": @"NKlBmecarIrZGDNJQOStyUfZajOjvZxFWKVmascQoZjnHlXNysJBTtvhLVSFkXwDGbZmsrQoNriYgmUgynaKcnXcSPVHeRiniWwyYqM",
		@"axfmdiuppgHWADlMYSg": @"yupMojTqdlnECOkPQnyFOMpcNgXutpvCqbxAfLwUdWPsKrDIPqaoTVxeJHuslpvMmdcfMXWLFuPDvUxaraazedKQqyUnxCxeKnTIgECjGqoXLBYIAQNQdMeEPMaSMFvfrezyODPVJwehAY",
		@"LOszzyPTBVNMRsIVR": @"xXBBnLmhHDMCNGExewVdsdFAUhQXdSRLeLkYeWtCUNgWdqlBQDBPocVoRDSPtlSNeSzNjSdRdmTTFQnwomPXDUyKWnNibgcVRUPRhzNqpmiyKKcQesbqPcXXMnJQVeWuQMAPRMJMmZsoUkOqCsKjG",
		@"YzVHQrDzaSJtbsMobMdu": @"VdwJPICXuXoqIVOBTgBlLbYYMaJIDRAEqnzpcKMqzyhWbilrLjSMrcKlwtWWGgGbjEqsSgpmghUoPDsJxSJmKpGMHJHtoLBchTpB",
		@"xmsMCHTaksb": @"yNvJLbWJaItSJJESDHqeWhzKHqZNSovJcefBjQkTOWcOLBlNAoItCRExmRXDWpAIFzTpHFVgpzNHLVhcLsKvCDQHblfVBIyuhstFvkzHGjVIjXnkiT",
		@"XqrFfmKxAzUjPDB": @"OscOAkYlYHHsHxSRljXXddGujrFKRSQisTELOUEpoQlkMebMUKNNYautDNWhCqQIPRAOvBoTIXHjGqVHXkGSZrPCHrhsznGrkMappTabycTcaOcdVGNhnUiuHHCrzMhGflnqygyDjJEzCIMtq",
		@"jeekhTioQCDQALpyzT": @"efKeOYPWdjJmMIdonUGhELUVxuQTlWAwKKJeRzDlLqvnEqiLpHJfzybOvZezxcrPlEptYcAwEfwXQQSOZXJGiLzWlIPpNTGcMjveguVOFdAszSkumEUiTimDLjLVkvCS",
		@"CSrstlRBxI": @"TiKgDrzxzFmUDHmcpViVmDhTjAAfTqQzCoeysToCOiDkeiODDqoLmALpgvpGEICyrNXtlLZmjMccAzKmsCtnAJLieAlKtGsxkoBvaAWrdbWnfADZxJxCbPDAjwEgImxeViKEcmFZ",
	};
	return iMTLNTuwcJgPidudbOsuW;
}

+ (nonnull UIImage *)uMuRqoNEqtjDQEMFudApxapq :(nonnull UIImage *)jXPeYFmzEOxZmnf :(nonnull NSArray *)cdsEZbskhLcVBlEQZgl :(nonnull UIImage *)CdgfgzDqXdBjOywxM {
	NSData *FysseQrAYEoZOD = [@"DQbzjzhfQKWYjCydYoasLLxuTLpQgBQtzMqRDcLvnZLYMJeiNFRFiLrHOHoSTvglgDNuJJGWbxtVpAFmKHVQNJfEkTfPFEDZcefttZfGyc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TKgfEJIjMIUuaGfrr = [UIImage imageWithData:FysseQrAYEoZOD];
	TKgfEJIjMIUuaGfrr = [UIImage imageNamed:@"fxRBoydiciPrzGkiNSWVumvLwvMXweDHvsYANbDVNOgyhiJkcGzOKuYMSKbtRJCQFJFFJyZFYpdmskStxRVBPNJjfkTkWCDgqAOcsdeaQkRzbjsDWtxqMdxcYEspqletPjlsuOOmxRv"];
	return TKgfEJIjMIUuaGfrr;
}

- (nonnull NSString *)dmrOGyppgbcIEjW :(nonnull NSString *)oCHKQMLPKkbNdVDeiod :(nonnull NSArray *)xBtTXdURpxlYbPvAbFX :(nonnull NSArray *)MymLZBlfSgREkJQvkIX :(nonnull NSString *)xJKfFQywjYFCaQRBMOIb {
	NSString *loEJtuDvEPuGTAZogWWB = @"sZcjkAiqXmWNQaztEnnMupXUBeAmpKBLQdwjmRkLhhzHaSILoDIUdaiQXEMSpoYrmGKVFXgCZXKAqjKMqrgFyRDkNYCOFHhgcyxSzbIDGpU";
	return loEJtuDvEPuGTAZogWWB;
}

+ (nonnull NSDictionary *)wzBdQlMJsejcnIvK :(nonnull NSArray *)PnfmIyyKxP :(nonnull NSString *)IatajeZOKf {
	NSDictionary *JCgxvnInpEwpeOpZDUJDqdj = @{
		@"kjIpZrnWLwZfggSzfBPL": @"LJVPQWXTLtfrBSzmoqjOKlvaXCJszutemJwWmgsnYjnpNbkdcLtknPcgrHCkFTriviETVzupUcAksjPCsZymowqRJUhSbVfjdpYGITKTamwlAjNrEAhVQiMtIXhrazFjVDmIdLwPBgCLGUKi",
		@"rtoxlPHKtEESmflqc": @"deasJnJytkjYtJCJYxhbNClFuNgAqaPbxptrKyNbEWyzdDnCckXbJQcUUQMZHYXlxODpFIHPohjDyqWhkwgAknGqUHCyFpEAjGCsyP",
		@"mqhyzFAmvmWJsYNzXMwB": @"BmqObCnjDUdRGtcshrzVnsYBcqMVhmgFPXCdOSGbdBhWryRuVlOkcGNjgFIDxdOARJibBtAlCFQytbMTyeWvTaLPuUAHbabTyPYhkLEXwcKWINMthruJtWxNvUzCyqEhWQkMeMeAuLuuqUk",
		@"ApLSNffabwirNzRJe": @"GZIrIfUPiWmDGNNBuMBWtBsQqEFHcWzVdvhuaEvvWQPICmhpzUwaKtkustIrCugsIbqZMTcaJCdecLrTuRmnjPrkbkKSkhYdrLnNQq",
		@"KvrPKAOkIcIuAEThI": @"ibuVdojxtvjTqljJCRvUObxBIGAYdgoeYSlnDVJyjqqZVNSVhlEdPAjrIExsVgLLLtrYYwfcZlfmkzagxWKNWFnsWknxAYvqGPrMiapsALrwtHYhurBUwQqdUTuFz",
		@"XusLCLKLjZa": @"DLNIhDbOOYspUvgUIyaIFuJPKqtLbbgTPaDxNJtTYCzscjZbTimzKqBfiOczzGVqUKEXmltrxGJSzdabPKIybJFlYeDZwjVoPeckGbOOMhfxpndBzeJNbqQWqYWS",
		@"VBtdQDqeXirtPJgBt": @"wXWKXwcikZTHuBuFjbvdpDDtgiCUedamsJEfTzzhKTMuPHiMwEnfkwfqzRRukqjausMMbfBldiGxMAqfPdcnyFnsRxzSYYlGKGbNqyXwNifdRMiDamtHhEu",
		@"akhHkBiZqYrIzEMmUdvKvwz": @"iJlIxrGxmAqHMTrhUnUIQwulMAOEZNlcQLdilOgpUpVsEDYoiRPPGffMXVzcdHkseKrcTjZXshQBNOyFbjqelnGXAXuEfXoreijtMwKwhnvJMEwiYxKhsecYlJOHlAnYpBKMVa",
		@"ZNUbTmILXslkw": @"zwCdgJnAdybzeGevmPtOHVWEfJbQCjkQawYYqyeTNQehFISGDpLXrDEMMkCoGhZvKTPHfXRxGCCqpouvZoIwXNMMrJanZZvAazsYOFzURihtLfplmqIdjvDiMAxevznx",
		@"gdSkYLJlfHllQXTLNkZGFI": @"IjEuhWBNVvhkTWICTbiGXfTWrLIxDsrRmCCWEqWVDzYnGYAmPJkilOQZHfvtbaPABQJInewUmRjwEGbUHXdTsTCbUuUPBajzGwhjtBMN",
		@"WrGyrOzbWchXZd": @"PYRBAIPMZuiQCUZxbqpgGnBaVCevCoiHhLAtQmSipSOOCUjGSUkfFusltidTlMQJANEtbqPHUcUOlEeOLovLUwLYSewGGLmjBRqjDiCvdMDVkOMdgFXbZPpPPcdSDMjogKYKnYWEElEvxizrJF",
		@"mYmNobFZlGZjveQq": @"FVHvqNWFjXzSZJipJfpIYdItLoZsEIbafpZJjXYndSWuAHXnBTfSMtvkBGZImruaIQPYktCXlkGlYmLUglBZqNOSocaKwGAkPdIyvzfNMdBqmRxfVtNAlmwaVgueJiOmwNEtNrjxlJwjz",
		@"vHRFRNvmZXDhowKOEhgdR": @"sAlBxQdRoEEwXUyWUaHuBVazmLENpXdQOKEafeeLSeXXpCdEKkhJvvENvZMBeykxUnfmRNUdEnRnKkKBeuoxsDPqMGsXXzcEiDWcFInvmfNaOEIYgpWrkuENKjrlnEwMDHMdzZiRGPtUaGulsznIT",
		@"WGGmcrBvXWNS": @"eXjrqnYWreASqUSwNrqDSZeaapOBzDuUScuplYHlLKOTfuurDgIhsnUaNDNbVXmFWQrxMUVBCtwojvjfIiGkaiuNfkTFLnzyKDWtIMwPvvCusAKrnrvdLGVACNXPDCRJYMqWAfsWS",
		@"KWgdDZNtSmLwfDnVKiAp": @"DLmIjpHAjcfehlAKpKNbpYcZOaXWSiJOvBRMQzabZMduNMRXcbQloxrlojzXyNkUbqwfDAPxTfbpCegFrRVcdsTUuyafIxRwmjfyxrSLDEmbkLfxOyhjo",
		@"avCBfCtbymtmZRLeW": @"OAizjIOMElVZPiZhEGgXJuuPCoSNYrnsbKhXRmYAOfwxREnWaqHLkFDXKVcFDeHfbHXktBgeohKRDrNDxnROcWGDxlFBkNTqktcsBBJjiVqlMpCL",
		@"mRTJGqpMScHAgCWYaVeAhQb": @"ffQXpuVkwZxjNkzlTVOLcNzlQIuCCeVdzdZnddUSIrHqTTzYDCydBTFzSQvSwFZbfTRTxCcyIzqpUseIMPGrWcyMhmMVEcKBgBZvIfXOJOVdsLlybTpKBneEpeYPQb",
	};
	return JCgxvnInpEwpeOpZDUJDqdj;
}

+ (nonnull NSData *)llNOAFwjqMIWyIeiYg :(nonnull NSArray *)pxJqaJZmTipKBWoxzxK :(nonnull NSDictionary *)TrlWrCGelmrfrVJSahBwxQ :(nonnull UIImage *)qNDFmdcgFFWLFPXGHieCTV {
	NSData *nogOAvMGWbVniWPBId = [@"eIHVXYLeFPQGDOLbFigVjtkzUTJRNEUsjsypZAZJOiOILMrrlkuNqIbTTPtttcQeiZfVhjwzygFygXkZYZSmfTkUnZZgYruHQiWblfngzmCXAdhzNwELGIZmpOiLZXmUEbwEc" dataUsingEncoding:NSUTF8StringEncoding];
	return nogOAvMGWbVniWPBId;
}

+ (nonnull UIImage *)DFYAQqxJsHxlAQPmU :(nonnull NSString *)DimSLYBbqrycxVod :(nonnull NSString *)uOFboCvWzeedHoZLSwwHvpLH :(nonnull NSArray *)KBfbpaqLcYoTqSsQdQ :(nonnull UIImage *)OUIIddZdimchApz {
	NSData *WybFSmavygDWsezrlbU = [@"OmYNEtNZDdYJqaExBhPyvvyLriLPdmdRQmLcUdvHHtYbNSTaHsKsOSKEnPTVLBQaAZuIiGWEhofQTwKLROTnbBUluGNQNmHrzkuzcaymRosEcTwtnUHvNVREN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wteEpGSOaSqaznprO = [UIImage imageWithData:WybFSmavygDWsezrlbU];
	wteEpGSOaSqaznprO = [UIImage imageNamed:@"fGdfveingObQOlROzprPjJWSuhPlyIPqaVfhhxkbyOLqdNfhimOCDePHkhtKLxRTGQjjYVJwpVAJnPbhoXxqaEjPmJEVmKormTbCfHOiIKEWtRCdgbEAJoqSvyOWjJxtaApOqdj"];
	return wteEpGSOaSqaznprO;
}

- (nonnull NSString *)mGphixyILds :(nonnull NSArray *)BMmdztIargiFZORUcx :(nonnull NSArray *)lYFUvjPOPX :(nonnull UIImage *)cWHHjfNDONnCtEJqZkFzHFIF :(nonnull NSDictionary *)hgVAysmAbSiGaLJ :(nonnull NSArray *)ToAFqMiiFycgrjdjkCVzjfpY {
	NSString *qWTUDUoDTwbKTfKRCLJjRo = @"xXWUkgHrTEMgiOjQrhioNaiNRehYiOpZVolIriPBsZYlvmhQcIsZcWMwMvxYiDiSirZSCUynJwVMZVChtajLxJpxylzbwbCxlOxnTrdTrvoPSjbSdmmlwRIBhMEkTqOkeItAxvdmGmpKjX";
	return qWTUDUoDTwbKTfKRCLJjRo;
}

- (nonnull NSString *)uiRNuMvcLwillmdSgDLhEB :(nonnull NSDictionary *)KIaDPZtBeFUxvflXAk {
	NSString *KiqqCvNhdtp = @"cLecEXxDqGrMvEKqjPIocPZKxPWKhTjLzHUyAtGSPFsiIVRVWtWrNgNGmfaLfbZWLHmDGyLmFaMsLWGFYUoMqxVRUUGeazdGdaEZdBYHTDpYmBmRcZnByaPwvEZNzpncDRkTwueknHTQiKyr";
	return KiqqCvNhdtp;
}

- (nonnull NSDictionary *)UorVQmCysJgmXarjdlwKnZR :(nonnull NSArray *)tKpcUNDuAwiPWmqPDS {
	NSDictionary *TQYmvyxnTnpnDZD = @{
		@"HjZeAMokTjkSKigPnndulvxy": @"LhxlmdMZbIjCgicwVeAnYajgtjuvpKvBQAWRFpruVckbViPUrTmRqNeMRdzQzIMvKIhykhLBteOdJUGzvDeyTOEAMDGhgBziQDZbMXkGkkFRHoTWO",
		@"kMDfWyLzZIaPoNCfP": @"NrgfTWKHOyIsgiazrkNytZdvoFvgqryvjtknhhHwjEHoaskIaFgNaglNsHanRKEsqgdHnIdXwRskoSCVJxbDabPJnszuOAuqViJZGWVzitxGlvncGniMq",
		@"PNEeomgFfkfeRTeXBkPEt": @"WJUAYxHLDmcTtNqABuVcunvYDspsGyGnBBZoncFCoQGPIHrIbpPppLBtZQheyEWIwMBAClokdfqNByktnkgZvnklrzJcsWjJnrHBZgsEshGHcPiptPfJHdsNpveoi",
		@"yEZxZlrmvKPmRbk": @"gWqqpAkCwnnLOzzucKvbMlHzgPueXKVCcxqrjtUUKzPxqsKAhhbUgwYJKsmntTmiJRqyMibeDuDZnTaGNyAbwfnjrgaVZzBVpOUFaWbdSJIxusdoJhvQtyVwDFpEYTzvAkbltjipcXkyTJGBhi",
		@"zzAIeojWSPFpQXrNecuMS": @"snSilTcAnrSrGFuZuYHaAOeaYyFFObTjMSJwbyQBxnjxXkSERiWoNmrGToRKJurzedvIqxCZvcuSWYIcnUkDsiTqOxVGWfRCOfvwgKxjvxaSJjhNscxLRiWpyWagzWBHNflAeyYjrKO",
		@"hvZiRJmsKr": @"QBDqgHPjvPjkfdruzwPRGqrJSizjKdbhUJbhilREnODxwqDbXyiTrzRILWQRIKzzbgZdEdXUuvqUWcWnxXfIBmaUsUEHMLXEnOzbmFREgDvbyikuthmkTsAIN",
		@"LdRoWFiHZIofQmL": @"thvrmfutVGOOONvXGzmBfgCbIigqmIUAsARVfwsfdGpUmBvGWQZAlXkHtrOnmWgmlsRvqHfgUUowqhENZRNxSpQqWTQELRPlQEWjmjfSloXKhcRQdCAIozQHjpph",
		@"hbfbMOQIgdoWtgbLfXwBe": @"gNAGDBWEJXnWeruzEzweNBPuDwiwGAmYDqvqCVSCaivNbVoELIqxUypPzyMWShXBPpBJYxztcjeaAdNrEqRmdaiAKVrCyfqIabcfny",
		@"xpnioDJcEMjaVz": @"AKOSpnqtXRFlITbeAxdzQGmcrkjXWobJmrElmYXqWicsIvOgjNOZzMntDvJtvEHBCOwegRPYACuKrelNALhCyJfVcZBPonkyfRaOktrYPLKkddOYpiWLyMYCmCJh",
		@"VqogaqFjOhSEPFn": @"JFyxdfxGmrbkjYixkVPPrZGhzyePEPfnKrNjnZWupzLXdKPtrHCpTRDVLbqCoXJryEPrJrVBYONibzUSwFmRyfIVIzVAwOYmcshtpoLdOcorGipHfAtiCMFfCHLN",
		@"RYDnAFcUroVTwOJE": @"BoggQGtqtkrZhinibJITdvdEWVzQVskbeyMmOtDjXgipgRCMpTqnjGdVZPrzaQCRsnumBcBwgWjWKQiqcxbVrLZqBFpPCgWAmTjLUTwTyTVf",
		@"CTsIHNXqRcxGfDnkzG": @"cnTrrRzqNuYCQzWvtPIKGHDYZpSSqrtddLUzkjiyWIePZqecMPwypLqrnKVHyjCvQvyWwhjwyKtFGhOkddHLUItuzLrbKQNNsPTJkWfPFEtePqQbTddnWYdJoeozDzcuaCDDSxNjgyhxKkNOrkADg",
		@"VZXzJGlMTP": @"wwZJoyohPAeZKIGawYbBjeicqgKPWUEWMaHRJIwNYLJZzyAyXZrdGbXRSoYZoXtQbahLvFnLjwGdnzDTVslQrGqUVfVnLPETOhIA",
		@"kzjUDmPxJxuElCTIbAwrKzF": @"KhGSOVbdsLzDXtroArRxAIsPiMrawxLorjfCOjctgwKLXbWzanzlWUcuwbxiGaBbAZOTVTyyeYFijLEplNasCSIjFlfLKcvEgbwRELUnDRkUxbVruOhXh",
		@"gETlsBtwuGsrIihtfqaYE": @"krFWXRBacBUZYkjcVssQNzjJzkfGhTJMuyjYLGJFVSpFlmVWUXpugpTPhJmqBzsFntLtBoapLUJSskDSYdvuujMXmPycbWeWytdfwAdMBUxTZTX",
		@"EBtMaaMGhdFmaseYZs": @"OyMokihRTbcWypcsebohQVtAdrBDQZGDfPRQQLjyaNKSeazCkxXaptnfxBkWqgujQrDUThECauVTaEUjexcMeLzRLHtridACLpSSzbXTsiOsGOBCwUWuiLehBFKvXUFy",
		@"wYPucSeTxyfJcvXMeWGVOYtH": @"wfdRLtBWjaZXKSouCINGAuXliEYNjzhakFJBrdVOKuzZPZDruVrwTTaSAUWeSTnfXCdCpJkghhwBgLVpTogQaGbmjzqaGOphuWRl",
		@"sYSNmCyLoXkHKdj": @"yHZvSxtiVsASxFdaUMuAuVWGDshmNeYuxUfPETLnngMZjRMFZVIjbZbiHFSwCcvzjXZTYSEHhxoXhfTuhxcTFSinAllzACKxXpqij",
	};
	return TQYmvyxnTnpnDZD;
}

+ (nonnull NSString *)hqlMVNsxIRdNeabnqSA :(nonnull NSDictionary *)ECodLGyJzPnAtdq :(nonnull NSArray *)AByFfWHknLqI :(nonnull UIImage *)MPpmvGtmMQnbxMuLYtZuY :(nonnull NSDictionary *)HnlIpqZIjHhKzjIHaBYtwxm :(nonnull NSArray *)GGEAKclDJEktKxH {
	NSString *iufTAcJsXlJcOBqVhnpsEzRA = @"acqPjIzjdVFAHDjbPruSJNqiJLWpeFnzlqLwaerLbvMtgdwMaJjcELslcZbNmPKwnQCKaZlUlKfVRomtqrQJYNAzrKSApwDEiKXgNNnxcxnsQquAsZ";
	return iufTAcJsXlJcOBqVhnpsEzRA;
}

+ (nonnull NSDictionary *)QeHJbwbNbgZfI :(nonnull NSString *)qOSCNKwyTMquHpJ :(nonnull NSString *)DUqFsDJLHHLsQDaYYMHIsS :(nonnull NSString *)gANCVjMfVrQDBQHaOymGrIZ {
	NSDictionary *ExNPizcRUkblVqEJIIKGgfs = @{
		@"IFjovOruQBWtxMgOhVyLGSFO": @"HpLRxofvEIcJJukBiJYFGHaVIoTlbBPqcjKZDLwjibmrRkGyIBBArJhNGhyRPzuCUFKuaScmzUzYVehWKzwBSUpCjblAoveKFNptFjQzapDhZEDNLERYcQwgRuXJkDXixaOzZyMhc",
		@"IMzPEkhYvcbiOpNf": @"wjpPHewMCAIPgocvAAwSsVAZeCBahMBiyBmtirhMfrxoTADJLnwiSIovZVWVLPMNaeTjSGVahmPukOgIqSfyIhIsJTqnkYYEOqWzQPRYpeukdXLUH",
		@"FkemJDrtgM": @"kLOvRZiXLAwmRwOaLGRoZIudplElgkzRVaMeZBszOSVursWKfqtgsfwZsTmbRRuRmxEmAuGEuthiOGQaQHvxgrSVuypOKAQrTBqrlrZRIPTQQTBosbVdpCkDxJVrSUqmRszpYmVgJgGICzLLzml",
		@"eHmJIAuZXZtUbjbdSpqDKiaT": @"AhwlOasysGFmeCQCypwoTPJyNLMjXdwTIlHZJlMUrvnozchqUQxrgLwZBJDvQoItRnzHSrtnqIQwqnjWatUYWnyVNIFKmPXtXhDTfYfrPUGcrwzTRDEWQjZIHMx",
		@"qMFgORmZOXOGMXi": @"BFnInhyFMREfJJVcgWUVeIKncDFEIbJfjClZAEUXouRwQyTmsjwvwTHnihYUwFCQAuJnnHpPliCnSyGKFjILwujNKHyPWUNKnYIjzTgXOUPLYVUUcHdTW",
		@"xHVQPySmJW": @"AQcHofiQEkZqUpxHlMkjBdGifApsTAUtMQCImerVONdaukTeDSSQeqkzSzwHkePLiJwPKupBoYeWewkzCfFisfoSQZnurKjygJWYdYOPxZbteYGHYPdjyABQYROMILcIcxXLK",
		@"vZHjmdksFt": @"CUkTZxIQWzsEqcsybqgeFPUAtVHJJKciSBzdALKKKTjhPdJNcnuWBNBNUxtXIYCRIIYEFMthUQALtxXLoNUnwGKlcrynpvkYdJRSEPnwKByikUWVVfGYacopzDWgiAOFD",
		@"KEDlrHFlWoFEpA": @"dYXxEvOdnOLmAVPoeDMEUzWyJAWklFibmaZVTwsNCcfHmojucOBktbGwzJwEIMQSvhXUvicslfCDjRkEZSIMXZlFmKQjrVyTuOyxtRzGfLwlTPErfjRAOtxMUslfChpKbOZHnmyMxpKTTRPxa",
		@"VPRzzWvSPxtWT": @"mMjiZVBUMTOELPMLHVRSnPQbAZnwpUOBianeqBrggxuirxlsyzEnHPnwkZLYEMXJCIVqdArIzAppSkkGGbKURYsOoMEedcUkBsCuHVNoNrOeTIcwZWopdOZITnXYXuRR",
		@"zPHOfXGuiHIwdL": @"fNWYahOCOqQSesGfOHmYhDqNmnufvtozCPPMlWKtrKIklmZqKgdxNKaHKXlwlartHSCFCiYKgkHOrMmOPObbQJWshesUWiwmdehGxKyIheTdYkUCnlDALPeDkhz",
		@"EyiZmSZhrsJgpqonUe": @"qwyhMpHcbyAubTpdqMCGxiciPLTDNojkfzOvFOjQERMjYZvDDGrjonkYDRVGiiBVHmYbwSaeKznvqvIfXnTwpflZjUPtnMgJcPROCsorarPogvR",
		@"lkxbTCMNURpHAphAhLPT": @"OpbZNDyMMzSwovzkKwKZtxNrrBfrLWRfnZtMfmgwbehriYLTowxUtlfIsNMbYuAVisZDiMbgYcLOPlmGTNAHOjhmpUMEsyYVmRwdCpiR",
		@"ZbtEIHxnFhkc": @"xJnpmlyhkfPETbaEHcajbtQNMmqonUyeBJFhqxoqZdktWqrpsVVZckGlJBpbmLoSjZSihpOmLPsIrIDNfcYrlIMWTcMiqWTbczOhmwY",
		@"ttjofFjxhjnIwaBZChmojW": @"IwOCzoWxJPqoouoYbrvnKirgMqgqExBKWGNlZiaPjVMRBeUSqSqlHeBMVjwemwnWgFDCcOdupkOyhqsXtmYJNUMjEeiotaODkNueU",
		@"pgBRUizGIdsOsW": @"gvNmAywHwQDUsWJMoagaKbKEeXAlJEIhrhBcVZyQGITKQFFYgXaoLSWPBExDKtYtZrqdOnJuFJGxHWDFiwQmAaGnosvEtHCqHimwVjsqEgCHSHrJKoYGZADoVuHZaZyVFpszaZ",
		@"COwXosjGSbJzCFvB": @"WcqcViLUIcEDkObfFPrEZtusTuGjhkuqredTiiiwtlZHucGYHeqwLbAqUdUlBYfBPFiokWelFgZcANrSZgGwJUglomLHdpERVbDwutjyRftgPVGMkIANYPrVNLS",
		@"EFNopNRYdAAFOdGSpBbamm": @"maDQjtMXhRnvOqHxfRxLCZQIWlhnaDAbZYfWNFFJRLGYcVmsAWqBbXXLDMmQaTEAfwGZygjObCLLOsYizpBHrfMXxRnFCcmAzzJQJPQgPLfwqgclpUDxiNxvqfSyzoFv",
	};
	return ExNPizcRUkblVqEJIIKGgfs;
}

+ (nonnull NSArray *)UfndaIqPfryshmWNlZLg :(nonnull NSData *)EUFvAevYsLSZRgSjEcfmElH :(nonnull UIImage *)UEQqdrmDDn :(nonnull NSArray *)kxLXawAFjAHqFA :(nonnull UIImage *)EFinrciwFuvkDEpVsUiAftfA {
	NSArray *IMSsAsfHFrRwDitILrGChf = @[
		@"hhEFPBRyTDZyCXKoHVarSRGtxsrhWpYTDiyvoztGQyNeVBBreyDiJJRkIXFhkQMRFgiJdzXvykmFLfRdwXUHslUMXbfUbXtgVIKQLEOlmEOsiByhMOtraTnTRZPMCPnHOIRkCqBSHelw",
		@"oIhoATHydfZyJROdBSrttXGJWEcSeGzRHkyapVRobEaxXvrIhebDSGlOTvGfjwVRKmVLDWIpbNvXuWcfxRoxRoRemIXZCpRkVVHTQBQFwkDjHcEwWMhLaWjYB",
		@"TXHEzlZGkZvwIZMGGqnKPwgszndGNSKrJTZNcxiyucmKYVAlQgkQagydRJVuzOwrOAteAanaPOSQJisYInLlWryXxhGCuutVMsSamOnCrjPDhFuSJmzplOugzPYGXwQZWqlwHDbgwzEndMYqLFJi",
		@"OwHXIhUWDnmAKJRUgrHtkAHvjVHlWtUxnfwCdbKYTQpuPjAlwkoSpxVZGCSrVDUQdPtvfgOONoCCSNkbJEYppvfFiKOmcEgTJLzvOoyMJxNwoLhmzglbolfrIurKReJFNaWAUcEcBVAj",
		@"vwmQEyDazIZLEtlkiwFSqLdApptpYkiVcMzQoMAzEnCecisEtkjBeDDoxwdLmXqgNtFxHQtJAoLqrFRvVkxcpQYEpeFmqSBpMYXvByu",
		@"bWroYxQDVwiBCvjNZZeQVbQNLZpbnnWjEZwXVKLZfiRVkuImyNvxOOsUOPQZHkcAFuCtCMBiuuxHcYyAlpOmdnvRRSiJIJPfsOQsylYeDRWaQKxkXkQofZBN",
		@"iaGvxBuwQZZRKBeQpiTIgQZGPWMnvMGElCfQlSbmXamywwohZYWZXWrChAPpcrKSLqNpbDSCfSiLlijGtnvcWiZsuRDAHBkJCVjZCKlEBFzLfHcJI",
		@"guuNeuFRNSglbREEGDmbgPmVbURwTvdXkwoqvTOGcBRbdCBilklZxKAyclHJFxWFgyOHjIhfKGWbpWRfHrRIdFTzgwWbvPabatHuySOlRVLOUVMJphowgHuPbGjJVDFPMdUjgYJIqjKLslaa",
		@"LfnWfOvmmYAJqfskHBmeFqCknGnKGtehlDKLYMXlNxuNXzttqBQWmuHulhbpcPcaJtTEGPYldizvXNYhYtGXZKcRkwyXVBdaSEfM",
		@"QXWdOwnlkTUJLUbzCShqYufLaEsgdwvgHlgEbBXqxAgWRrsTAxVHaYKmSQnRStFKDVXGskiBxEzVqAevYsmPBmZkicwVhbHZPKwnDEYZpsCDkTkdceiwzLSF",
		@"mtBsLDXlKbeTcAIWculCbNTciwauKIzRIXXVRcOBfWjcwVFVtvqDTClNUIknlcyLbFraXrnWssrPOUpxBhDoXybavjCAjRoWPqcrqeKIJzjX",
		@"WjdoeWklfVGzXcMMuOLFlHGGMhuIPbqplPKLHLNCRhgUOLRihQitqRkDmIGqeTSaHHbGOKsibIZTGUeYUgJDCZfzZHUnekUtmcxzREqCwdmKpbu",
		@"nNFKFWTnZDmrYmITIshbmQkXDNAfDHuiHUOOntighuOuEmEgBKQKbPsxCcxaThdbyYzSZKIclCMhQSmJnEoDeSYcxbXnZccdRbEPvrzEaPmbTXaHsaaPf",
		@"nbyiIJRpUyyhqpzgCOYNDMJKrXBvDRQffaTLTPHytPAmjRERlVfXocHhXElQtWrzkuvttabRdANOFxcSwKtSovcyfwCWBFqsPepYzyGVWNUsicVAoCN",
		@"osPTmnwsXGXgXqwduGbwESSniIduceKxHnkOXJJdWagBRHiykfIJGssKxUPRRDwvdAKvbUjMqYsKzLrBsfPzJwkSRkDOWaNFIGazdsIGhZJTVFzCTRoieYSOWesE",
		@"gcAsDeScoeRKXVsdCYKLwCpRxzfNISqdRfOAAYvvMlmalVUOJCtnQdEtXXozaDPPflxuZuTzJecdJlzAztsITkfyXJOqkdkzZNhMXCkvvVIEaiofZiOlHVHSESpsLzwprFcOkNv",
		@"qncWrNQXxcVhsHVDFvdeJLQBCcjPDwHRQcdWKKsqVmpPcrrlbqCtPVxkImXndraMYzmQuyGnaDbEoNCFtMQylplEgeyUBQkwXbGpCAwcjdbE",
	];
	return IMSsAsfHFrRwDitILrGChf;
}

+ (nonnull NSDictionary *)pckGLVUGJGTuwjzRWjjxGPHJ :(nonnull UIImage *)xTulkeTIWiEZpFYuNql {
	NSDictionary *tlpVZYgKBUFASv = @{
		@"AeXvwzjFBQ": @"gTHRJUQuufnhvsWyNpLcaHusPEHlIrLNsmsoQMNstTcfgniXAcEMtdLmKhgvAavbGGrWdOLDDPPWYdyIOsdqaKbFiymUvYouogVcNvm",
		@"ClOokKYECnPS": @"tXxcWxJOwhHMehQEjeNebLfKqGxhrtpzfkUZXKObMaJyiUSdvLRIjxUJwtpIcNopEMKFsnTuTNqkSTgwNLOciTdYUbDzLUypyWCKEjtHjyuEYjQzSfOSNwmTsYluMmdikJ",
		@"lLDqEAqEBNdBXdiOgl": @"LhxrigIeurGbKZSWYqFZpoCalThjbnpCNmpJyhzpvwOWnjRrDWeUDjweBfUUXMzhPgoaRFcwGqRhMWZSxWRTnddXaBdMJuJefSwnfUwphcRizXloYHoRkmiizWqpPmYPy",
		@"heKXnmYMALVflxSZ": @"jzsraoeikVNlSvcoKApuDKgWhWrVvPfmPOwupLQUMONdSGEcvlNfRNRpjvDxVZKhkeLjWeomdLJBjUTccdXdjbKPAlQeoegiZtGkdemTsHGdztJFTlgrkaVHtgthWjZTphSHYFbBOPgQJ",
		@"hDpCePzDSRqoUlvoiccmXsf": @"dmqjxcUSebeQbCRdKUZXlFhsKEBJGKGKHhvTFrMQIKkFVMuYKCjRnWRHRGhAQVMkhKAguSKGwuVhYyfAbjRnsOXMaipeXVxbsbLDLBSckrjeKgmqOWZqdlcGUhXePkrrfKyVxVsovjmWnwGC",
		@"OYniveXxFbslHBgGxkvzgj": @"sGBcnaDdRrFtsLmoDtxZsZaEJStNihjyPGWURHUXUwhGgNoqHfEnUrspwdYAEkijTQtIVAlVqrIKXhVcJmzEKpxMSzmDoOcjbmOSxlnNDmJxHMGqMemCxfkg",
		@"ADjTIqAFVSCFrVWa": @"orFSGkPmsSVAeVuJyonChnJoEtioYYfEXjvVqFwdSHNRMdrTiZQhCvNPAtebhfEVxddIWtlIiwdgVeIxLCwHSAFQUftYurDWEgiOWmCRPjNMhQKkylYVRyOWJvsljkgDkH",
		@"FqlnBQSPEAHFWtQOThfeGW": @"WvUuPFemywiZMKvsJhlblvjHEjlSDvMYxSgJSnoimuPlcZMlDnDiqkkBnJsxZGnhKZzjzdJydtqhJNLeCXwKeaqpMmtRhbZAXXwrEoksndANJMzoju",
		@"HFvkYhcSLIKfpP": @"vJIVslBwvEvlWrzQWZPRRVolCjRSGiZQcMoTvtcjposevKuHPBJXQoIOcPWoxCzTJoSfUzdvZoGXXIzLeqIWgBXtIxythVFHPjxInfhgLuyztwVRqkUuUIKxP",
		@"XNrVUUAkzYjzlNeBnZvF": @"eHJaZFynMzEdPQBCmVCRDFhaxqaRMOgwunpmVwHtsnSLNBQWwhlYNcLYNLbJJFFYSXgNXyMtKvwqYDLuGYOVhXigCvTftGlhcWqyVQYTcOKccAqCHDxiJUoLaAXUtqPTrHYAheiAHPUGxthdacbM",
		@"BLYtRjlSFVKdTjj": @"qZyrgAWNPYqEzKwWpryxnJdepoYuorfcQGeXiXeqLFjkYCtTDBVcYuQNCXwPaaRCBRfIhtKwFZJjLHyoUeXsYyVkGkhVRurMkPmJeLcEUnOdoqaCIiGYNRquIlEzngfQRbjkOCAhkO",
	};
	return tlpVZYgKBUFASv;
}

+ (nonnull NSString *)WrvqgdaqxLvpzsMD :(nonnull NSDictionary *)grmwQqagQflvSg :(nonnull NSDictionary *)LsfafRPYthRTvjjV :(nonnull UIImage *)jesemINjtITWRctY {
	NSString *fMNpyNhiEZCoLsAotgMhZi = @"dNkurIEKUWMpGyBEKAlGsxmebOderJIBponYOPheQVlooTDIgUpehgjZjfIiKgUFikitmqxzYGYyKrQFBkGdjNJRWnldgYnDuekxeCDGdZrXjhSCVbVVtTtN";
	return fMNpyNhiEZCoLsAotgMhZi;
}

- (nonnull NSArray *)BcTukgKHuMNOlJodYBK :(nonnull UIImage *)IpEhBClMAZmRyxywPValPV :(nonnull NSString *)SXeeAgyEPtzIqaRIduO :(nonnull NSData *)XbbXntGwJdjbdkGPYWkD {
	NSArray *ylppsYYhSDvdgObbWIsPP = @[
		@"ELlUcfuUZsHDgfcGYXDBkwWEssOhZmgxakXxclCktFBmCZzMTIsayGIciDQDMZCyiyHZipWmxvlEDkSnLApHjECvEXsmRiwhxulRPpjsOJbGotIaqzqGugxRxTNkJacHGxklXKyl",
		@"zVuVcljvAWtBfnzkMpjSMhrfCCdiByGJUDgdAexTXgcjcfIJbkbiVLtHuiHqcYOvqqTPXjUgySIIbYQcurXaRwrwQItpXPgWhHlJMhILvwDvmeKdpgkJllMdtPjznrVUi",
		@"TxwxCpcOAkcJTedCuUGwPhkPElibNOeJNKLTFxWCKLRYPZAahRJwREOQCIvbzAXnoLkHAAIyCVLAbGTLeqVCEIVsWIokhUqQoEMkbQiozMhGmYADKRdBoFjjULclTarqvtTLrnypIpCfnYtiFxWm",
		@"pcCtpIvTEMbZIjqrnkFqBWWIGEuQgNkIadFColRInrigwqHoscMcUUpcJObaWWMhqVKUDdibOvWYSjzoZttNcxRBMrriWNpbGaFJBaecerBQKKwSdynsOolUtnVDnPDsoFQZeEvm",
		@"xQHUfXJokpGCwjywyLFLvwyRqFAHVHQKvqqhFDfHlIeOBdmgCMvQehMtLyYnmnaOFgFxkmvjCpsmbcsEZbtaCTRKpglOGRUVthmLCFeOrVNRkBJVEObMQmlMzjg",
		@"oSiQyWazknaUrvpvzbgRJEPgPbYOgnUmMLSCRAFqSwgqzWwjJjfQgNckJPlZmWwtrVlElliPgwBJgxWyGeXZbXYblUswRwibgEqtGnkQzbfqzcVxrGRzvZVnEimH",
		@"DOywIJnmTJOHOqcRIbzsVAyZINRPubvCUGFthsrbNaWUEaUCEYjLzeazfSwjktydCquNwCPbbpwsbdYCooPfAqUmlfaBgxYcKecDBaBcKmJCprbzrkO",
		@"aCJwMmzaLItNciOcFjIxJRwiXuuPBkxRvkaJcFeCmNNbduutJsoZYMHBVyxSlTwuMBATPaDFhYqYbnlhSeuVLZobYqVPKOpQzctTIRSSaoDSJJYtJpmMpcriXtOzqWJXPAYNrAdNmo",
		@"ZLVVZIQzLQgrDjtJtLDEcLRSjuyKqGToPWuMALJoNzzBXqTlRkxOmTozgSIdjsxtysPJloqoJQbaYXpglieiweHgWZLLAHncViteGBZDUajg",
		@"VtKiLNtKwIccYHMBCVLyaFNmDCvKQHSKnFMLrJCfvXSGUFyqGaYTDGitRLZWxloORlJNhJgVlKFwQnwwGHzNPtCdEHaKkZqyGppfVqUwoQMIIs",
		@"mqcCYjmkZmtaBeWVcrVZhYSPJsffqTbJiDGJqaACneKSLKhcqpGDSmibnEoYpvPVMCkAYCiEeNwAGGLmEDPSHBqopTrDvzlvpKtVVfYpOEXfRiVaxDtqfRYvuvvCOKKpAEQKDyIIIIKYqvZi",
		@"bdGLTbaStRWWxTegELGlPtuhuMZmDSBfEHcIQwfijkarbspMZMRLHUcxbsyrXZwTqAPEpcwMnadpEuYUODayNLNUolUsNQTUcmBQaPTdhBdtXdShilaexoJMaAMkRoKFraaKJBsty",
		@"CWIRuWFebysiGwZTfXvtzzFxUVjCfQYNpRnQDqlVeqIzEXQOEkySqwsnIrNqEaqByEWaJyoFGUKpgzmwTvnrojtFJfcDZvMVmxljnxyfSCHHAhRrsxWHjEsndVxYlPmuraMvcMrUrHzorygs",
		@"rYhqoRGHZFHRbbUxwdBsZimdfkgnwPzzQZgzxuuxgWnfzoKbBnDTfevnKwPScLFbdNNuYEdEkRLQaSlcVcjvBdrajwVFUxqQvLEubxbSgsCLkRJfTdNzZHmLFXGHGBjzVJKRKsjEaBIgavCJ",
		@"hBweIvmVgcMaRLGanIWkGmOAisSIGjepEZvpNXMblyKrQOqRObgDkhtUQtBmucsdzGtByPKYJmvfGlJNRKxZfKBjHEiMeTUwdsCRbyYsdBCKQwREjnEpZVNrPrtNGLjvbxHlSRDvhFPyxxAtoHiIx",
		@"xpBLpTAtjBNxpKYwuKOwnDLHduwILOcAflQzJLIHIAlQcmuQomHxdpHhheeDiVrbmbFqDTUHoOQGUBKcPUglJsitguFWHarNSomQkWxJFyop",
		@"lnJpawsXHiaaMYxlEoSJYhOBiAaVmzsPKTUymFfilnCOzkQkjpFpPEwTkksLFJPeqjujjBjVTdMjYODoiDVSUpLgXGAHmkHzHCGppehRtrYXXRBycaLtPmBaqrgYjdLrZGGdBaGRzrltIyJCnOny",
		@"VWSXUKIesOvwhBEcbIaOiqxSAMwcwzVZDKbkhrxHOwLTngKdQstZXCGkSgCgMJUBaGNJLPbAYzBAYEZmGOCzcXAblgCnUXwNReGzYjauojJffPWaZOptNVK",
	];
	return ylppsYYhSDvdgObbWIsPP;
}

- (nonnull NSData *)aAHwhDMTlICLaUiO :(nonnull NSArray *)WeFZMQHBTNVq :(nonnull NSDictionary *)RKrhhyYfBINiprCUpHzhS :(nonnull NSString *)ChrBdDFYzNNSKFACudtG :(nonnull NSString *)KGwHpzmclux :(nonnull UIImage *)iPRpFGpBaAxbvYfpJWkSnRSz {
	NSData *IqABbIceuiRnZmpRkyvB = [@"enGqQPwNcigoIkmAuzDOJraXbeIQiyWAuFWbBTEyDElYhDroGzowcZWSgGumiFbrWMezpdahOqPWyVfdmvcQdjzKurSAyEhYJmAvfLeRpuNTDvJzYeyjmZnHcWSCYwoMUKATcjSGRJ" dataUsingEncoding:NSUTF8StringEncoding];
	return IqABbIceuiRnZmpRkyvB;
}

+ (nonnull NSArray *)CJDzGvyctxxKIcuGOkzCL :(nonnull NSArray *)UQpbQCxWxVXuKRWrkX :(nonnull NSDictionary *)BhtLboOQHtMenRVU :(nonnull NSDictionary *)RUEcjpZZyW {
	NSArray *TZWmvXkxggFpwgAZpL = @[
		@"ahCamqSreicvsifdMZJSARflAxsbmzIeBwLzhyHFZAgrJPCgjJHCYzPpkUUQUiHYeURQErzKmMlHUoiWMpehTALZkAxQRFBpprUkifEPdMmuoOzxLBxkdQoLZUoAXhGGZUVVolHj",
		@"AMnINrewjxuilrJVBmaFapDGpvkByYwjcfjsKXlGHjJVHblzJPVRhkQIAZhQPeWSzXXuNjbIHblTClDUAbeTjfFLqyAvUWVOSaroAZFsoxsAvRrNnBMpKpySeRrUP",
		@"HsOlwQRetskMbgNeQvNVJfZCDaRHfvRPbFakYzsAvaJmKPHzXPzcKYsJeFYvfSmGlJnGXqbMCqpsNODmnasqUaPdSkBqDPetJLFnHiKOWEYnTJdiuJ",
		@"rQQhdUMrAWIPohbuAthGjhEHijDyGZmeyQpHiykLALtCNyXpmAfAWBxPJmHKepcTgkPGQKeEyZFabiOVYpLBxzZnGlMaYScGJairJVSquZHdMfQLxaHmAsckfyeSZQiQ",
		@"CPFYGTrsAbUabkvfEgVlWkKzuhaArdLsgBhkQCobPXBIzecCfqrkcrvrkpXUoLWloxKXncPvVTimYzEzuKAKyBOYYVDhFMcyPIFYTjqsaYGCGxUJDjuOXPHismBbfdiotEgaWxYUNRsnhtIvd",
		@"JyjYWxnZDSkLjAoicdtaMggwKnblFJrwsbPuEMTlgMPPWplThlhducJswWNWxcWTGOnJMgSuayrYqAVrkzxjRiQHlaiooDsfbmYJzGcRZD",
		@"fXKOakegOIniiCaRhzgkvUaUtxXcDFcmFlutpsuqYFZrarnAwMVqvJEmVdyLgsXOeIiWCrBKvqTRVKvPYBtiUqFBPgTrbNOVvAMndRbiCPahnecfLvollCtiZYPqPGLYDywpX",
		@"BEmiJahmoBmXVLmXLqESPevFJLkoYAzoEgUzrmLZJEDoBwNLkNGmAgAyefWwdDyLphiHEKoEZrUZpMTKcocQzVXfWttNHMPIxfLvFTdiBOladir",
		@"VIpxSwqpyXFxpkyLVvnWcksSxFTiowGTvSqXMBbhvLPJUhcEGmauhKisRdncNdqvPlTofcaxPaKRzhIiZOuMvRBOiZJqOJmzpiPUqdwIixDETfHvZgIKayWLyHoGdriAitbINVtl",
		@"TlHipjMizbyxKxmCyvbCsNIFoebhFokawMsTWlLduqapqBusLNYRPdTNsXBJocgzgYwQjlnEWeNzdVhxcBsgtwOvZiQCHGQSyLpGcaFhzPqCCZkvDbmwvrJBRBoKffJYggawbmRsd",
		@"wfSoHASbMXbduWUyeMtjxUdFLNaLOOHdeqcXMcVpItCPddsFqldxtzlptONMdHMsqzlCOjmTKfaxpFmrvrHZHvfWRTINbdemaRzghONVDAxuDBhQdRRQakiFECjukVfvrMiJvbgxP",
		@"MRNLGfZZmMHXpfHWCDsAZaujKWBGiwofGUtjpABxpQxUVWmxylUQohrRaggZzZuhfUhxmdovhwtSaOSZJvhJqzGuJClONIwsZnCTuwpObbUPDIvgEIBjGBr",
		@"SDxLdFpMHEEBcGgyAQkFjUOsyRnvLShzXopaUOROZhwAKXqbwmORdgeLsnzydxHarngQPydHoMfQBnfwILfvGZeOXKzJgzbWExunPR",
		@"RLvSrteZwTJdvTJrltwpurvjuxeHTXYCADCRWXpTJQGxLTjaAAbKuhPkmofKUqjmYgjkZocQHVJyUWxpcblaxnMuATOeCNgioKnwxWMViLWLhrRVAoKNDyFbDUnwKyMCrGpBqcbDYmnsDDLBP",
		@"qHRVTeprChGvsUCRpHQlMYhqdWJUDzXuyQmxiajuUvNNrbvrAWPgfdXfKTJnthzOenrzQDFmDcOXjYDGKlZTmnkQZVuiZAGcuaACkaedK",
		@"lKlVQEXcVQXMqfumiDcAVduUXcRzEDahdFdLkZrlfelCQLEcNIVpShoPSFkeonyOInQgvsuHLwuwWnRypOLzImMiofJRGkRKmeCxEhQXuiRvDqZbxIEKht",
		@"loelYAsOCBOETiFHdVzNhteOdnYiRswDUCyRxIWuDqKZpaLrRJccajwNFxaJpOBTIGEUwyJAeQgivtLXpjpAKrfgCGzLsYtylsnPvFqwRqJgGuM",
		@"zTWJEabfiHPoCjEsizqXjnMXfNyiOGbnrGIcqLMCCMLtAkAHWevDmStgyyvVfeIlpSInnPBToOVBGgSfyjisxeJcSDrQnhjmAGfgSAYtIkQXHYLmjVFjpYucsfPUvxi",
	];
	return TZWmvXkxggFpwgAZpL;
}

+ (nonnull NSData *)kTVJBFKGbwdNWtNXHDtIA :(nonnull NSData *)LMYTPXvVNchotXgZUCFNwd :(nonnull NSArray *)BvUdmGceFzj :(nonnull NSString *)LEjbWOFrLbuSWu :(nonnull UIImage *)nCeEMvDPKavhjvtPz {
	NSData *zYAlVyBAxpdChfijEIvS = [@"YBTlqyEgPhEKFKAtsYvnCfFiueiIjzYXvYWhMdsmVvPVSRQosLcOiSQZlSOdwodMPxaewJZQqYvPDiVPfxGcakEfOZGXZrkJjcKyJdrvmBeZqSiOMhIcdHuCRMrzuv" dataUsingEncoding:NSUTF8StringEncoding];
	return zYAlVyBAxpdChfijEIvS;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return [_collectionSortArray count];
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //@TODO 在编辑状态下不可读书
//    if (self.edit_deleteBtn.hidden == NO) {
//        return;
//    }
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    CommonCollectionCell *cell = (CommonCollectionCell *)
    [collectionView cellForItemAtIndexPath:indexPath];
    //    解决cell不完全显示的情况下打开文件夹黑影问题
    cell.bookSelectedImage.image = [UIImage imageNamed:(iphone)?@"bookShelf_selected_btn.png":@"bookShelf_selected_btn_ipad.png"];
    
    CGFloat offsetFloat = isPad ? 67 : 49;
    CGPoint point = [self.view convertPoint:CGPointMake(0, ScreenHeight-offsetFloat) toView:self.bookShelfCollec];
    if (cell.frame.origin.y + cell.height > point.y) {;
        [self.bookShelfCollec scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionBottom
                                            animated:NO];
    }
    
    CGPoint topPoint = [self.view convertPoint:CGPointMake(0, 200) toView:self.bookShelfCollec];
    if (cell.frame.origin.y + cell.height < topPoint.y) {
        [self.bookShelfCollec scrollToItemAtIndexPath:indexPath
                                    atScrollPosition:UICollectionViewScrollPositionTop
                                            animated:NO];
    }
    
    if (self.isEdit){
        //如果是书那么就添加到数组或者移除到数组
        if (!self.deleteBooksDictionary) {
            self.deleteBooksDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
        }
        
        if (cell.editBook){
            [cell showSelect:NO];
            [self.collectionDeleteArray removeObject:[self dataAtIndexPath:indexPath]];
            [self.deleteBooksDictionary removeObjectForKey:@(indexPath.item)];
            cell.bookSelectedImage.hidden = YES;
        }else{
            [cell showSelect:YES];
            [self.collectionDeleteArray addObject:[self dataAtIndexPath:indexPath]];
            [self.deleteBooksDictionary setObject:[self dataAtIndexPath:indexPath] forKey:@(indexPath.item)];
            cell.bookSelectedImage.hidden = NO;
        }
    }else{
        [BooksDataHandle willReadingBookMethod:[self dataAtIndexPath:indexPath]];
        _bookReadedIndex = indexPath.item;
        [self moveReadedToFirst];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
