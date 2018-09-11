
//
//  ShelfViewController.m
//  BookStore
//
//  Created by Work on 14-7-1.
//  Copyright (c) 2014年 wukai. All rights reserved.
//

#import "ShelfViewController.h"
#import "BooksDataHandle.h"
#import "XMLDownLoad.h"
#import "CommonCollectionCell.h"
#import "CommonCollectionCell+ConfigureCommonCollectionCellData.h"
#import "JWFolders.h"
#import "FolderViewController.h"
#import "THPinViewController.h"
#import "TSPopoverController.h"
#import "CustomSheetView.h"
#import "FolderHeaderView.h"
#import "EditModelHeaderView.h"
#import "FolderListViewController.h"
#import "ShadowView.h"
#import "MBProgressHUD.h"
#import "HBookShelfInfoVC.h"
#import "CYBookListController.h"

#define shelfbooksavepath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"collectionData.data"]

#define allbooksavepath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"allBooks.data"]

typedef enum : NSUInteger {
    CREATRFOLDER,        //未打开文件夹
    ADDBOOKTOFOLDER,         //打开文件夹
    NORMALSTATE,
    MOVEFOLDER
} SHELFGESTURESTATE;

typedef enum : NSUInteger {
    BOOKFOLDERCLOSE,        //未打开文件夹
    BOOKFOLDEROPEN,         //打开文件夹
    BOOKFOLDERCLOSEWITHBOOK,//打开文件夹将图书移动至书架后关闭文件夹
} BOOKFOLDERSTATE;

typedef enum :NSUInteger{
    THEMEONE,
    THEMETWO,
    THEMETHREE,
    THEMENIGHT,
}THEME;

@interface ShelfViewController ()
<
    THPinViewControllerDelegate,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout,
    FolderViewControllerDelegate,
    UIActionSheetDelegate,
    UITableViewDelegate,
    UITableViewDataSource,
    CustomSheetViewDelegate,
    FolderListViewControllerDelegate,
    UITextFieldDelegate,
    MBProgressHUDDelegate
>{
    NSMutableArray *array;
    SHELFGESTURESTATE SHELFSTATE;
    BOOKFOLDERSTATE FOLDERSTATE;
    THEME theme;
    CGFloat dotaY;

}

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (nonatomic, weak)  UIButton *bookStore;
@property (nonatomic, weak)  UIImageView *navigationBgImageView;
@property (nonatomic, weak) IBOutlet UIImageView *viewBgImageView;
//书城的底部导航控制器
//书架视图
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
//顶部导航栏normal
@property (nonatomic, weak)  UIView *navigationView;
//数据源数组
@property (nonatomic, strong) NSMutableArray *collectionDataArray;
//书架排序数组
@property (strong, nonatomic) NSMutableArray *collectionSortArray;
//删除数组
@property (strong, nonatomic) NSMutableArray *collectionDeleteArray;
@property (assign, nonatomic) BOOL isEdit;
//布局 yes为网格 no为列表
@property (assign, nonatomic) BOOL  isGridView;
//COLLECTION的headerview
//@property (strong, nonatomic) CollectionHeaderView *headerView;
//网格布局
@property (nonatomic, strong) UICollectionViewFlowLayout *layoutGrid;
//列表布局
@property (nonatomic, strong) UICollectionViewFlowLayout *layoutList;
//长按手势
@property (nonatomic, strong) UILongPressGestureRecognizer *longPress;
@property (nonatomic, strong) FolderViewController *folderViewController;
@property (nonatomic, strong) NSIndexPath *folderIndexPath;
@property (nonatomic, strong) IBOutlet UIView *lowView;
@property (nonatomic, assign) BOOL folderIsOpen;
@property (nonatomic, strong) id bookFromFolder;
@property (nonatomic, assign) NSInteger remainingPinEntries;
@property (nonatomic, strong) NSIndexPath *menuselectIndexPath;
@property (nonatomic, strong) TSPopoverController *popover;
@property (nonatomic, strong) CustomSheetView *deleteAlertSheetView;
@property (nonatomic, strong) UIView *transparentView;
@property (nonatomic, strong) FolderHeaderView *folderHeaderView;
@property (nonatomic, strong) EditModelHeaderView *editModelNavigationView;
//@property (nonatomic, strong) NSIndexPath *menuSelectededIndex;
@property (nonatomic, strong) NSMutableDictionary *deleteBooksDictionary;
@property (nonatomic, strong) ShadowView *shadowView;
/** 是否是搜索状态*/
@property (nonatomic, assign) BOOL isSearch;
/** 搜索数据*/
@property (nonatomic, strong) NSMutableArray* searchArr;
/** 正在阅读的书籍index*/
@property (nonatomic, assign) NSInteger bookReadedIndex;

@end

@implementation ShelfViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.isSearch = NO;
    self.searchArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    self.titleLab.text = @"书架";
    self.titleLab.origin = CGPointMake((MainScreenWidth - self.titleLab.width)/2, self.titleLab.origin.y);
    
    //编辑状态的NavBtn
    [self.deleteSureBtn addTarget:self action:@selector(readyDeleteBooks:)
                  forControlEvents:UIControlEventTouchUpInside];
    [self.deleteCancelBtn addTarget:self action:@selector(cancelEdit:)
                   forControlEvents:UIControlEventTouchUpInside];
    [self setupData];
    
    //标记菜单列表默认选择的是封面模式
    self.menuselectIndexPath = [NSIndexPath indexPathForRow:2 inSection:0];
    
//    //适配iOS7状态栏
//    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
        
    //标记文件夹打开或者关闭的状态
    self.folderIsOpen = NO;
    self.longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGestureRecognized:)];
    
//    初始化collectionView
    [self setupCollectionView];
    
    [self.view bringSubviewToFront:self.navigationView];
    

    
    [self reloadShelfData];

    //添加通知
    
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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupData];
    [self reloadShelfData];
    self.remainingPinEntries = 4;
    self.navigationController.navigationBarHidden = YES;

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self writeFileArray];
}

#pragma mark - custom method

- (void)refreshShelf{
    [self setupData];
    [self reloadShelfData];
}

- (void)setupData{
    //初始化数据源数组
    self.collectionDataArray = [NSMutableArray arrayWithCapacity:0];
    self.collectionSortArray = [NSMutableArray arrayWithCapacity:0];
    self.collectionDeleteArray = [NSMutableArray arrayWithCapacity:0];
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary]
                         objectForKey:(NSString *)kCFBundleVersionKey];
    NSString *tagVersion=[[NSUserDefaults standardUserDefaults] objectForKey:@"tagVersion"];
    
    if ([self isFirstLaunch]) {
        //首次启动 加载引导页
        [self hidesCustomTabView];
        UIButton *introbuton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        NSString *imageNameString;
        if (iPhone5) {
            imageNameString = @"yindao_iphone5";
        } else if (isPad)
        {
            imageNameString = @"yindao_ipad";
        } else {
            imageNameString = @"yindao_iphone4";
        }
        [introbuton setBackgroundImage:[UIImage imageNamed:imageNameString] forState:UIControlStateNormal];
        introbuton.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight+4);
        [introbuton addTarget:self action:@selector(introbutonDismiss:) forControlEvents:UIControlEventTouchUpInside];
        
        [[[UIApplication sharedApplication].delegate window] addSubview:introbuton];
        
    }
    
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

- (void)introbutonDismiss:(id)sender{
    __block UIButton *btn = (UIButton *)sender;
    [UIView animateWithDuration:0.4 animations:^{
        btn.alpha = 0.0;
    } completion:^(BOOL finished) {
        [btn removeFromSuperview];
        [self showCustomTabViw];
        btn = nil;
    }];
}

- (void)setupCollectionView{
    //背景不透明
    self.collectionView.backgroundView.backgroundColor = RGBCOLOR(238, 238, 238, 1);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    //网格
    [self.collectionView registerNib:[CommonCollectionCell nib]
          forCellWithReuseIdentifier:@"CommonCollectionCell"];
    //列表
    [self.collectionView registerNib:[CommonCollectionCell nibWithLand]
          forCellWithReuseIdentifier:@"CommonCollectionLandCell"];
    
    [self.collectionView registerNib:[CollectionHeaderView nib]
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:@"CollectionHeaderView"];
    
    self.layoutGrid = [[UICollectionViewFlowLayout alloc]init];
    self.layoutList = [[UICollectionViewFlowLayout alloc]init];

    if (isPad){
        self.layoutGrid.itemSize = CGSizeMake(142, 250);
        self.layoutGrid.footerReferenceSize = CGSizeZero;
        self.layoutGrid.minimumLineSpacing = 5.0f;
        self.layoutGrid.minimumInteritemSpacing = 5.0f;
        self.layoutGrid.sectionInset = UIEdgeInsetsMake(5, 45, 5, 45);
        
        self.layoutList.itemSize = CGSizeMake(368, 180);
        self.layoutList.headerReferenceSize = CGSizeMake(768, 43);
        self.layoutList.footerReferenceSize = CGSizeZero;
        self.layoutList.minimumInteritemSpacing = 0;
        self.layoutList.minimumLineSpacing = 1;

    }else{
        self.layoutGrid.itemSize = CGSizeMake(93, 170);
        self.layoutGrid.footerReferenceSize = CGSizeZero;
        self.layoutGrid.minimumLineSpacing = 0.0f;
        self.layoutGrid.minimumInteritemSpacing = 0.0f;
        self.layoutGrid.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
        
        self.layoutList.itemSize = CGSizeMake(MainScreenWidth, 118);
        self.layoutList.headerReferenceSize = CGSizeMake(MainScreenWidth, 43);
        self.layoutList.footerReferenceSize = CGSizeZero;
        self.layoutList.minimumInteritemSpacing = 0;
        self.layoutList.minimumLineSpacing = 1;

    
    }
    [self controlLatestReadingView];
    
    self.collectionView.collectionViewLayout = self.layoutGrid;
    self.isGridView = YES;
    [self useGestureOrNot:YES];
}

/**
 本次使用一个layout，如果使用两个layout，需要分开写
 */
- (void)controlLatestReadingView {
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"LatestReadedBook"]) {
        self.layoutGrid.headerReferenceSize = isPad ? CGSizeMake(MainScreenWidth, 234) : CGSizeMake(MainScreenWidth, 117);
    } else {
        self.layoutGrid.headerReferenceSize = isPad ? CGSizeMake(MainScreenWidth, 0) : CGSizeMake(MainScreenWidth, 0);
    }
}

/**
 是否添加长按拖动创建文件夹功能

 @param isUse <#isUse description#>
 */
- (void)useGestureOrNot:(BOOL)isUse {
#warning 暂时注释长按文件夹
//    if (isUse) {
//        [self.lowView addGestureRecognizer:self.longPress];
//    } else {
//        [self.lowView removeGestureRecognizer:self.longPress];
//    }
}

/**
 拖动或者打开文件夹就禁用这些按钮
 */
- (void)enableAllBtnWithBool:(BOOL)onoff{
    self.bookStore.enabled = onoff;
}

#pragma mark 导航栏上的Action

- (IBAction)gotoBookStoreAction:(id)sender {

    CYBookListController *bookListVC = [[CYBookListController alloc] initWithNibName:@"CYBookListController" bundle:nil];
    [self.navigationController pushViewController:bookListVC animated:YES];
}

#pragma mark longPressGesture

- (void)longPressGestureRecognized:(id)sender{
    UILongPressGestureRecognizer *longGesture = (UILongPressGestureRecognizer *)sender;
    
    CGPoint location;
    CGPoint locatitonInLow;
    NSIndexPath *indexPath;
    static UIView *snapshot = nil;
    static NSIndexPath *sourceIndexPath = nil;
    static NSIndexPath *markfolderIndexPath = nil;
    
    CommonCollectionCell *cell = nil;
    if (FOLDERSTATE != BOOKFOLDEROPEN) {
        location = [longGesture locationInView:self.collectionView];
        indexPath = [self.collectionView indexPathForItemAtPoint:location];
        cell= (CommonCollectionCell*)[self.collectionView
                                                            cellForItemAtIndexPath:indexPath];
    }else{
        location = [longGesture locationInView:self.folderViewController.collectionView];
        indexPath = [self.folderViewController.collectionView indexPathForItemAtPoint:location];
        cell= (CommonCollectionCell*)[self.folderViewController.collectionView cellForItemAtIndexPath:indexPath];
    }

    locatitonInLow = [longGesture locationInView:self.lowView];
    
    switch (longGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            if (indexPath) {
                
            [self enableAllBtnWithBool:NO];
            
            if (FOLDERSTATE == BOOKFOLDERCLOSE) {
                if (indexPath) {
                        snapshot = [self customSnapshoFromView:cell.bookImageView];
                        //               保存之前的indexpath
                        sourceIndexPath = indexPath;
                        
                        snapshot.center = locatitonInLow;
                        [self.lowView addSubview:snapshot];
                        [self.lowView bringSubviewToFront:snapshot];
                        [UIView animateWithDuration:0.3 animations:^{
                            snapshot.transform = CGAffineTransformMakeScale(1.2, 1.2);
                        }];
                        cell.hidden = YES;
                        if ([self judgeCellisFolderWithIndexpath:indexPath]) {
                            SHELFSTATE = MOVEFOLDER;
                        } else {
                            SHELFSTATE = NORMALSTATE;
                        }
                    }
                } else if (FOLDERSTATE == BOOKFOLDEROPEN) {
                     if (indexPath) {
                        snapshot = [self customSnapshoFromView:cell.bookImageView];
                        snapshot.center = locatitonInLow;
                        [self.lowView addSubview:snapshot];
                        [UIView animateWithDuration:0.3 animations:^{
                            cell.hidden = YES;
                            snapshot.transform = CGAffineTransformMakeScale(1.2, 1.2);
                        }];
                        [self.folderViewController longPressGestureRecognized:sender];
                    }
                }
            }
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            if(snapshot)
            {
                snapshot.center = locatitonInLow;
                
                NSIndexPath *targetIndexPath = [self getIndexPathWithPoint:location];
                //新的位置
                if (FOLDERSTATE == BOOKFOLDERCLOSE)
                {
                    //NSIndexPath *targetIndexPath = [self getIndexPathWithPoint:location];
                    //如果移动到一个cell中则执行创建文件夹的动作
                    if (CGRectContainsPoint(cell.frame, location) && ![sourceIndexPath isEqual:indexPath])
                    {
                        //在此判断cell是否为folder
                        if([self judgeCellisFolderWithIndexpath:indexPath] && SHELFSTATE != MOVEFOLDER)
                        {
                            //如果是文件夹 文件夹cell会放大
                            markfolderIndexPath = indexPath;
                            [UIView animateWithDuration:0.4 animations:^{
                                snapshot.transform = CGAffineTransformMakeScale(0.8, 0.8);
                                cell.hidden = NO;
                                cell.transform = CGAffineTransformMakeScale(1.1, 1.1);
                            } completion:nil];
                            SHELFSTATE = ADDBOOKTOFOLDER;
                        } else {
                            //创建文件夹那么底部cell保持原有尺寸
                            if (SHELFSTATE == MOVEFOLDER) {
                                [UIView animateWithDuration:0.4 animations:^{
                                    snapshot.transform = CGAffineTransformMakeScale(1.2, 1.2);
                                } completion:nil];
                            } else {
                                [UIView animateWithDuration:0.4 animations:^{
                                    snapshot.transform = CGAffineTransformMakeScale(0.8, 0.8);
                                } completion:nil];
                                SHELFSTATE = CREATRFOLDER;
                            }
                        }
                        
                    } else {
                        if (markfolderIndexPath) {
                            //将放大的cell缩小
                            CommonCollectionCell *celll= (CommonCollectionCell*)
                            [self.collectionView cellForItemAtIndexPath:markfolderIndexPath];
                            
                            [UIView animateWithDuration:0.2 animations:^{
                                celll.hidden = NO;
                                celll.transform = CGAffineTransformMakeScale(1.0, 1.0);
                            }];
                            markfolderIndexPath = nil;
                        }
                        if (targetIndexPath && ![sourceIndexPath isEqual:targetIndexPath])
                        {
                            //如果没有移动到一个cell上，并且有新的targetIndexpath则执行换位置的动作
                            [self moveBookFromIndex:sourceIndexPath toIndex:targetIndexPath];
                            sourceIndexPath = targetIndexPath;
                            NSLog(@"sourceIndexPath %ld, targetIndexPath %ld", (long)sourceIndexPath.item, (long)targetIndexPath.item);
                            if (SHELFSTATE == MOVEFOLDER) {
                                
                            } else {
                                SHELFSTATE = NORMALSTATE;
                            }
                        } else {
                            //这种情况为取消创建文件夹或者起始位置与终止位置相同则还原
                            [UIView animateWithDuration:0.25 animations:^{
                                snapshot.transform = CGAffineTransformMakeScale(1.2, 1.2);
                            } completion:nil];
                            if (SHELFSTATE == MOVEFOLDER) {
                                
                            } else {
                                SHELFSTATE = NORMALSTATE;
                            }
                        }
                    }
                   
                    targetIndexPath = nil;
            } else if (FOLDERSTATE == BOOKFOLDEROPEN) {
                //打开文件夹拖动
                [self.folderViewController longPressGestureRecognized:sender];
                if (snapshot.frame.origin.y < self.folderViewController.view.frame.origin.y) {
                    [[JWFolders folder] closeCurrentFolder];
                    //[self hideFolderHeaderView];
                    //从文件夹中删除书
                    NSMutableArray *arrayy = [self dataAtIndexPath:self.folderIndexPath][@"booksArray"];
                    [arrayy removeObject:self.bookFromFolder];
                    if (arrayy.count == 0)
                    {
                        [_collectionSortArray removeObjectAtIndex:self.folderIndexPath.item];
                        [self writeFileArray];
                        
                    }
                    
                    FOLDERSTATE = BOOKFOLDERCLOSEWITHBOOK;
                    SHELFSTATE = NORMALSTATE;
                }

            } else if (FOLDERSTATE == BOOKFOLDERCLOSEWITHBOOK) {
                //从文件夹中拖出书
                //获取位置 将书直接插入到书架 同时将folder状态改为colse 书架状态改为movebook
                
                __block NSIndexPath *tmpindexpath = nil;
                if (self.bookFromFolder && ![self.collectionSortArray containsObject:self.bookFromFolder]) {
                    
                    //9.9修改
                    if (targetIndexPath) {
                        NSLog(@" 插入targetindexpath %ld", (long)targetIndexPath.item);
                        tmpindexpath = [targetIndexPath copy];
                        //sourceIndexPath = targetIndexPath;
                    } else if (indexPath) {
                        NSLog(@" 插入indexpath %ld", (long)indexPath.item);
                        tmpindexpath = [indexPath copy];
                        //sourceIndexPath = indexPath;
                    }
                    
                    if (!tmpindexpath) {
                        [self.collectionSortArray addObject:self.bookFromFolder];
                        tmpindexpath = [NSIndexPath indexPathForItem:self.collectionSortArray.count-1 inSection:0];
                        sourceIndexPath = tmpindexpath;
                    } else {
                        NSLog(@"cell 插入到collection中%ld",(long)tmpindexpath.item);
                        [self.collectionSortArray insertObject:[self.bookFromFolder mutableCopy] atIndex:tmpindexpath.item];
                        sourceIndexPath = tmpindexpath;
                    }
                    
                    [self.collectionView performBatchUpdates:^{
                        [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObject:sourceIndexPath]];
                        
                        NSLog(@"隐藏的是%ldcell",(long)sourceIndexPath.item);
                    } completion:^(BOOL finished) {
                        UICollectionViewCell *tmpcell = [self.collectionView
                                                         cellForItemAtIndexPath:sourceIndexPath];
                        tmpcell.hidden = YES;
                        NSLog(@"隐藏的是%ldcell", (long)sourceIndexPath.item);
                        tmpindexpath = nil;
                    }];
                    
                    FOLDERSTATE = BOOKFOLDERCLOSE;
                    SHELFSTATE = NORMALSTATE;
                    
                    self.bookFromFolder = nil;
                    //9.9修改end
                } else {
                    NSLog(@"书被释放了");
                }
            }
            }
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            if (snapshot) {
                
                if (FOLDERSTATE == BOOKFOLDERCLOSE){

                    if (SHELFSTATE == NORMALSTATE || SHELFSTATE == MOVEFOLDER) {
                        if (snapshot && sourceIndexPath) {
                            CommonCollectionCell *celll= (CommonCollectionCell*)
                            [self.collectionView cellForItemAtIndexPath:sourceIndexPath];
                            snapshot.center = [self.lowView convertPoint: celll.center
                                                                fromView: self.collectionView];
                            [UIView animateWithDuration:0.3 animations:^{
                                snapshot.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                celll.hidden = NO;
                                NSLog(@"显示的是%ld cell", (long)sourceIndexPath.item);
                                [snapshot removeFromSuperview];
                            }completion:^(BOOL finished) {
                                sourceIndexPath = nil;
                                snapshot = nil;
                            }];
                        } else{
                            NSLog(@"bugggg");
                        }
                    }else if(SHELFSTATE == CREATRFOLDER) {
                        //改变cell的背景图
                        //缩小cell的image
                        //添加新的image
                        [UIView animateWithDuration:0.4 animations:^{
                            snapshot.center = [self.lowView convertPoint: cell.center
                                                                fromView: self.collectionView];
                            snapshot.transform = CGAffineTransformMakeScale(0.8, 0.8);
                            [snapshot removeFromSuperview];
                            snapshot = nil;
                        } completion:nil];
                        NSMutableArray *mtArray = [NSMutableArray arrayWithCapacity:0];
                        [mtArray addObject:_collectionSortArray[indexPath.item]];
                        [mtArray insertObject:_collectionSortArray[sourceIndexPath.item] atIndex:0];
                        
                        NSMutableDictionary *folderDict = [NSMutableDictionary dictionaryWithCapacity:4];
                        folderDict = [@{
                                        @"isFolder" : @"yes",
                                        @"folderName" : @"未命名",
                                        @"password" : @"",
                                        @"folderImage" : @"",
                                        @"booksArray" : mtArray
                                        } mutableCopy];
                        
                        [_collectionSortArray replaceObjectAtIndex:indexPath.item withObject:folderDict];
                        [_collectionSortArray removeObjectAtIndex:sourceIndexPath.item];
                        [self.collectionView deleteItemsAtIndexPaths:@[sourceIndexPath]];
                        
                        [cell configureCellWithData:folderDict];
                        
                        markfolderIndexPath = nil;
                        sourceIndexPath = nil;
                        
                    }else if(SHELFSTATE == ADDBOOKTOFOLDER) {
                        [UIView animateWithDuration:0.4 animations:^{
                            snapshot.center = [self.lowView convertPoint: cell.center fromView:self.collectionView];
                            snapshot.transform = CGAffineTransformMakeScale(0.8, 0.8);
                            cell.transform = CGAffineTransformMakeScale(1.0, 1.0);
                            [snapshot removeFromSuperview];
                            snapshot = nil;
                        } completion:nil];
                        id cellData = _collectionSortArray[indexPath.item];
                        NSMutableArray *arrayyyyy  = cellData[@"booksArray"];
                        [arrayyyyy insertObject:_collectionSortArray[sourceIndexPath.item] atIndex:0];
                        [_collectionSortArray removeObjectAtIndex:sourceIndexPath.item];
                        [self.collectionView deleteItemsAtIndexPaths:@[sourceIndexPath]];
                        
                        [cell configureCellWithData:cellData];
                        markfolderIndexPath = nil;
                        sourceIndexPath = nil;
                    }
                    [self writeFileArray];
                } else if(FOLDERSTATE == BOOKFOLDEROPEN) {
                    [self.folderViewController longPressGestureRecognized:sender];
                    [snapshot removeFromSuperview];
                    snapshot = nil;
                }
            }
            [self enableAllBtnWithBool:YES];
            if (FOLDERSTATE == BOOKFOLDEROPEN) {
                
            }else{
                FOLDERSTATE = BOOKFOLDERCLOSE;
            }
            SHELFSTATE = NORMALSTATE;
            [snapshot removeFromSuperview];
            [self.collectionView reloadData];
        
            break;
        }
    
        default:
            break;
    }
    
}

#pragma mark 控制文件夹
//控制文件夹
- (void)controlFolderWithIndexPath:(NSIndexPath *)indexPath{
    [self configureFolderView];
    //   文件夹视图控制器
    __weak ShelfViewController *weakSelf = self;
    self.folderViewController = [[FolderViewController alloc]initWithNibName:isPad ?
                                 @"FolderViewController_iPad" : @"FolderViewController_phone"bundle:nil];
    self.folderViewController.delegate = self;
    self.folderIndexPath = indexPath;
    self.folderViewController.folderDataDict = [self dataAtIndexPath:indexPath];
    
    self.folderHeaderView.bookDict = [self dataAtIndexPath:indexPath];
    if (self.isEdit) {
        [self.folderViewController folderIsEditWithBool:YES];
        if ([[self.deleteBooksDictionary allKeys] containsObject:@(indexPath.item)]) {
            self.folderViewController.deleteArray = self.deleteBooksDictionary[@(indexPath.item)];
        }
    } else {
        [self.folderViewController folderIsEditWithBool:NO];
    }
    
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    CGPoint openPoint = CGPointMake(1, cell.frame.origin.y + cell.height);
    openPoint.y = openPoint.y - self.collectionView.contentOffset.y ;
    
    __block CGRect startFrame = self.lowView.frame;
    __block CGPoint startOffset = self.collectionView.contentOffset;
    JWFolders *folder = [JWFolders folder];
    folder.contentView = self.folderViewController.view;
    folder.containerView = self.lowView;
    folder.position = openPoint;
    //    folder.direction = JWFoldersOpenDirectionUp;
    //    folder.contentBackgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"noise"]];
    //    folder.shadowsEnabled = YES;
    //    folder.showsNotch = YES;
    [folder open];
    folder.openBlock = ^(UIView *contentView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction) {
        [weakSelf enableAllBtnWithBool:NO];
        
        weakSelf.edit_compileBtn.hidden = YES;
        weakSelf.edit_deleteBtn.hidden = YES;
        //        weakSelf.edit_skinBtn.hidden = YES;
        
        CGRect tmpFrame = weakSelf.lowView.frame;
        CGFloat yOffset;
        if (isPad) {
            yOffset = cell.frame.origin.y - weakSelf.collectionView.contentOffset.y - 6;
        } else {
            yOffset = cell.frame.origin.y - weakSelf.collectionView.contentOffset.y + 28;
        }
        tmpFrame.origin.y -= yOffset;
        tmpFrame.size.height += yOffset;
        [UIView animateWithDuration:.6f animations:^{
            weakSelf.lowView.frame = tmpFrame;
        }];
        weakSelf.folderIsOpen = YES;
        self->FOLDERSTATE = BOOKFOLDEROPEN;
        [weakSelf hidesCustomTabView];
    };
    
    folder.closeBlock = ^(UIView *contentView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction) {
        
        [weakSelf enableAllBtnWithBool:YES];
        weakSelf.edit_compileBtn.hidden = NO;
        weakSelf.edit_deleteBtn.hidden = YES;
        //        weakSelf.edit_skinBtn.hidden = YES;
        
        
        
        [UIView animateWithDuration:0.35 animations:^{
            weakSelf.lowView.frame = startFrame;
            weakSelf.collectionView.contentOffset = startOffset;
        }];
        weakSelf.folderIsOpen = NO;
        if (self->FOLDERSTATE == BOOKFOLDERCLOSEWITHBOOK) {
            
        }else {
            self->FOLDERSTATE = BOOKFOLDERCLOSE;
        }
        if (!self->_isEdit) {
            [weakSelf showCustomTabViw];
            
        }
        [weakSelf hideFolderHeaderView];
        [weakSelf.collectionView reloadData];
    };
    
    [self performSelector:@selector(showFolderView) withObject:self afterDelay:0.4];
}

/**
 *  进入编辑模式
 */
- (void)editBookShelf{
    //    弹出
    [self useGestureOrNot:NO];
    if (!self.isGridView) {
        [self transBetweenListAndGridWithBool:NO];
    }
    
    [UIView animateWithDuration:0.4 animations:^{
        self.layoutGrid.headerReferenceSize = CGSizeMake(ScreenWidth, 0);
    }];
    
    self.isEdit = YES;
    [self.collectionView reloadData];
}

- (BOOL)judgeDataIsBookWith:(id)aData{
    if ([[aData allKeys] containsObject:@"title"]) {
        return YES;
    }
    return NO;
}

- (void)cancelEdit{
    
    [self controlLatestReadingView];
    self.isEdit = NO;
    [self useGestureOrNot:YES];
    [self.collectionDeleteArray removeAllObjects];
    
}

#pragma mark 移动书籍到一个位置

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
        [self.collectionView moveItemAtIndexPath:sourcepath toIndexPath:indexpath];
        
        [self writeFileArray];
        _bookReadedIndex = 0;
    }
    
    //    移除通知
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:@"EndBookReadingNotification"
     object:nil];
}

/**
 *  切换两种布局方式
 */
- (void)transBetweenListAndGridWithBool:(BOOL)avalue{
    if (avalue) {
        if (isPad) {
            self.layoutGrid.itemSize = CGSizeMake(768, 166);
            self.layoutGrid.footerReferenceSize = CGSizeZero;
            self.layoutGrid.minimumInteritemSpacing = 0;
            self.layoutGrid.minimumLineSpacing = 1;
            self.layoutGrid.sectionInset = UIEdgeInsetsMake(0, 0, 60, 0);
        } else {
            self.layoutGrid.itemSize = CGSizeMake(320, 105);
            self.layoutGrid.footerReferenceSize = CGSizeZero;
            self.layoutGrid.minimumInteritemSpacing = 0;
            self.layoutGrid.minimumLineSpacing = 0;
            self.layoutGrid.sectionInset = UIEdgeInsetsMake(0, 0, 60, 0);
        }
        self.isGridView = NO;
        [self useGestureOrNot:NO];
    } else {
        if (isPad) {
            self.layoutGrid.itemSize = CGSizeMake(123, 220);
            self.layoutGrid.footerReferenceSize = CGSizeZero;
            self.layoutGrid.minimumLineSpacing = 20.0f;
            self.layoutGrid.minimumInteritemSpacing = 58.0f;
            self.layoutGrid.sectionInset = UIEdgeInsetsMake(50, 51, 66, 51);
        } else {
            self.layoutGrid.itemSize = CGSizeMake(74, 140);
            self.layoutGrid.footerReferenceSize = CGSizeZero;
            self.layoutGrid.minimumLineSpacing = 18.0f;
            self.layoutGrid.minimumInteritemSpacing = 29.0f;
            self.layoutGrid.sectionInset = UIEdgeInsetsMake(21, 20, 60, 20);
        }
        self.isGridView = YES;
        [self useGestureOrNot:YES];
    }
    [self.collectionView setScrollsToTop:YES];
    [self.collectionView reloadData];
    [self.collectionView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
}

#pragma mark Help method

- (BOOL)judgeCellisFolderWithIndexpath:(NSIndexPath *)index{
    NSMutableDictionary *dic =  _collectionSortArray[index.item];
    if ([[dic allKeys] containsObject:@"isFolder"]) {
        return YES;
    }
    
    return NO;
}

- (void)moveBookFromIndex:(NSIndexPath *)fromIndex toIndex:(NSIndexPath *)toIndex{
    //对数据源进行操作
    [self insertBookForIndex:fromIndex toIndex:toIndex];
    //对视图进行操作
    [self.collectionView moveItemAtIndexPath:fromIndex toIndexPath:toIndex];
}

- (void)insertBookForIndex:(NSIndexPath *)fromIndex toIndex:(NSIndexPath*)toIndex{
    id objectToMove = _collectionSortArray[fromIndex.item];
    [_collectionSortArray removeObjectAtIndex:fromIndex.item];
    [_collectionSortArray insertObject:objectToMove atIndex:toIndex.item];
}

#pragma mark 编辑书籍Action

- (void)editBookShelfWithIndex:(NSInteger)index{
    if (_isEdit) {
        [self cancelEdit];
    }
    switch (index) {
        case 0://整理模式
            [self showEditModelNavigationViewWithBool:YES];
            [self hidesCustomTabView];
            [self editBookShelf];
            
            break;
        case 1://Wi-Fi模式
            [self showEditModelNavigationViewWithBool:NO];
            [self controlDeleteAlertSheetViewWithBool:NO];
            [self.collectionDeleteArray removeAllObjects];
            break;
        case 2://封面模式
            [self showEditModelNavigationViewWithBool:NO];
            [self controlLatestReadingView];
            [self controlDeleteAlertSheetViewWithBool:NO];
            [self.collectionDeleteArray removeAllObjects];
            [self showCustomTabViw];
            [self transBetweenListAndGridWithBool:NO];
            break;
        case 3://列表模式
            [self showEditModelNavigationViewWithBool:NO];
            [self controlLatestReadingView];
            [self controlDeleteAlertSheetViewWithBool:NO];
            [self.collectionDeleteArray removeAllObjects];
            [self showCustomTabViw];
            [self transBetweenListAndGridWithBool:YES];
            break;
        default:
            break;
    }
    [self.popover dismissPopoverAnimatd:YES];
}

/**
 控制编辑模式顶部菜单的创建、显示、隐藏
 */
- (void)showEditModelNavigationViewWithBool:(BOOL)isyes;{
    static bool  isReadyShow;
    CGFloat offsetFloat = isPad ? 120 : 66;
    if (!self.editModelNavigationView) {
        self.editModelNavigationView = [[[NSBundle mainBundle] loadNibNamed: isPad ? @"EditModelHeaderView_ipad" : @"EditModelHeaderView" owner:self options:nil] objectAtIndex:0];
        self.editModelNavigationView.bgImageView.image = [UIImage imageNamed:isPad ? @"top_bookshelf_img_ipad.png" : @"top_bookshelf_img.png"];
        CGFloat offsetFloat = isPad ? 120 : 66;
        self.editModelNavigationView.frame = CGRectMake(0, -offsetFloat, ScreenWidth, offsetFloat);
        [self.view addSubview:self.editModelNavigationView];
        
        __weak ShelfViewController *weakSelf = self;
        self.editModelNavigationView.buttonTappedBlock = ^(id sender) {
            UIButton *button = (UIButton *)sender;
            if (button.tag == 1) {
                //删除按钮
                if ([[weakSelf.deleteBooksDictionary allKeys] count]) {
                    [weakSelf showShadowViewWithBool:YES];
                    [weakSelf controlDeleteAlertSheetViewWithBool:YES];
                }
            } else {
                //取消删除
                [weakSelf.deleteBooksDictionary removeAllObjects];
                //返回到当前网格视图状态
                NSIndexPath *index = [NSIndexPath indexPathForRow:2 inSection:0];
                [weakSelf editBookShelfWithIndex:2];
                weakSelf.menuselectIndexPath = index;
            }
        };
    }
    if (isyes) {
        if (isReadyShow) {
            return;
        }
        isReadyShow = YES;
        
        __weak ShelfViewController *weakSelf = self;
        [UIView animateWithDuration:0.4 animations:^{
            weakSelf.editModelNavigationView.hidden = NO;
            weakSelf.editModelNavigationView.frame = CGRectOffset(weakSelf.editModelNavigationView.frame, 0, offsetFloat);
        }];
    } else if(isReadyShow){
        isReadyShow = NO;
        __weak ShelfViewController *weakSelf = self;
        [UIView animateWithDuration:0.4 animations:^{
            weakSelf.editModelNavigationView.hidden = YES;
            weakSelf.editModelNavigationView.frame = CGRectOffset(weakSelf.editModelNavigationView.frame, 0, -offsetFloat);
        }];
    }
}

/**
 隐藏导航栏
 */
- (void)hidesCustomTabView{
    [self.delegate viewController:self hideTabView:YES];
}

- (void)showCustomTabViw{
    [self.delegate viewController:self hideTabView:NO];
}

/**
 阅读书籍
 */
- (void)readbookWithData:(id)aBook;{
    
    [BooksDataHandle willReadingBookMethod:aBook];
}

#pragma mark 状态存取

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

#pragma mark 文件夹加密锁

- (void)experimentalPassword{
    THPinViewController *pinViewController = [[THPinViewController alloc]
                                              initWithDelegate:self];
    pinViewController.promptTitle = @"请输入密码";
    pinViewController.promptColor = [UIColor darkTextColor];
    pinViewController.view.tintColor = [UIColor darkTextColor];
    pinViewController.hideLetters = YES;
    
    pinViewController.backgroundColor = [UIColor whiteColor];
    
    self.view.tag = THPinViewControllerContentViewTag;
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    pinViewController.translucentBackground = YES;
    
    [self.view.window.rootViewController
     presentViewController:pinViewController animated:YES completion:nil];
}

#pragma mark - touch event

/**
 编辑按钮Action
 */
- (IBAction)gotoCompileAction:(id)sender {
    
    //是否动画期间
    if (isAnimate) {
        return;
    }
    
    if (self.edit_deleteBtn.hidden == YES) {
        
        self.edit_deleteBtn.hidden = NO;
        //        self.edit_skinBtn.hidden = NO;
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self->isAnimate = YES;
            
            if (iphone) {
                self.edit_deleteBtn.frame = CGRectMake(self.edit_deleteBtn.frame.origin.x, self.edit_deleteBtn.frame.origin.y-50, self.edit_deleteBtn.frame.size.width, self.edit_deleteBtn.frame.size.height);
                
                //                self.edit_skinBtn.frame = CGRectMake(self.edit_skinBtn.frame.origin.x, self.edit_skinBtn.frame.origin.y-100, self.edit_skinBtn.frame.size.width, self.edit_skinBtn.frame.size.height);
            }else{
                self.edit_deleteBtn.frame = CGRectMake(self.edit_deleteBtn.frame.origin.x, self.edit_deleteBtn.frame.origin.y-100, self.edit_deleteBtn.frame.size.width, self.edit_deleteBtn.frame.size.height);
                
                //                self.edit_skinBtn.frame = CGRectMake(self.edit_skinBtn.frame.origin.x, self.edit_skinBtn.frame.origin.y-200, self.edit_skinBtn.frame.size.width, self.edit_skinBtn.frame.size.height);
            }
            
            
        } completion:^(BOOL finished) {
            self->isAnimate = NO;
            [self enableAllBtnWithBool:NO];
            [self startEditBookAction];
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self->isAnimate = YES;
            if (iphone) {
                self.edit_deleteBtn.frame = CGRectMake(self.edit_deleteBtn.frame.origin.x, self.edit_deleteBtn.frame.origin.y+50, self.edit_deleteBtn.frame.size.width, self.edit_deleteBtn.frame.size.height);
                
                //                self.edit_skinBtn.frame = CGRectMake(self.edit_skinBtn.frame.origin.x, self.edit_skinBtn.frame.origin.y+100, self.edit_skinBtn.frame.size.width, self.edit_skinBtn.frame.size.height);
            }else{
                self.edit_deleteBtn.frame = CGRectMake(self.edit_deleteBtn.frame.origin.x, self.edit_deleteBtn.frame.origin.y+100, self.edit_deleteBtn.frame.size.width, self.edit_deleteBtn.frame.size.height);
                
                //                self.edit_skinBtn.frame = CGRectMake(self.edit_skinBtn.frame.origin.x, self.edit_skinBtn.frame.origin.y+200, self.edit_skinBtn.frame.size.width, self.edit_skinBtn.frame.size.height);
            }
        } completion:^(BOOL finished) {
            self->isAnimate = NO;
            [self enableAllBtnWithBool:YES];
            self.edit_deleteBtn.hidden = YES;
            //            self.edit_skinBtn.hidden = YES;
            [self stopEditBookAction];
        }];
    }
}

- (void)startEditBookAction{
    //全局收编辑
    self.mainEditV.hidden = NO;
    CGRect startFrame = self.lowView.frame;
    if (iphone) {
        startFrame.origin.y -= 50.0f;
        startFrame.size.height += 50.0f;
    }else{
        startFrame.origin.y -= 60.0f;
        startFrame.size.height += 60.0f;
    }
    
    CGRect frame = self.collectionView.frame;
    frame = CGRectMake(frame.origin.x, frame.origin.y+10, frame.size.width, frame.size.height);
    
    [UIView animateWithDuration:0.4 animations:^{
        self.lowView.frame = startFrame;
        if (iphone) {
            self.collectionView.frame = frame;
        }
    } completion:^(BOOL finished) {
        self.headerView.hidden = YES;
    }];
}

- (void)stopEditBookAction{
    //全局收编辑
    self.mainEditV.hidden = YES;
    //取消删除
    [self useGestureOrNot:YES];
    
    CGRect startFrame = self.lowView.frame;
    if (iphone) {
        startFrame.origin.y += 50;
        startFrame.size.height -= 50;
        
    }else{
        startFrame.origin.y += 60;
        startFrame.size.height -= 60;
    }
    
    CGRect frame = self.collectionView.frame;
    frame = CGRectMake(frame.origin.x, frame.origin.y-10, frame.size.width, frame.size.height);
    
    [UIView animateWithDuration:0.4 animations:^{
        self.isEdit = NO;
        self.headerView.hidden = NO;
        
        [self showDeleteBookBtn:NO];
        self.lowView.frame = startFrame;
        
        if (iphone) {
            self.collectionView.frame = frame;
        }
    } completion:^(BOOL finished) {
        [self useGestureOrNot:YES];
    }];
    [self.collectionView reloadData];
    [self.collectionDeleteArray removeAllObjects];
}

- (IBAction)closeDeleteTapAction:(id)sender {
    if (isAnimate) {
        return;
    }
    
    if (self.edit_deleteBtn.hidden == YES) {
        self.edit_deleteBtn.hidden = NO;
        //        self.edit_skinBtn.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self->isAnimate = YES;
            
            if (iphone) {
                self.edit_deleteBtn.frame = CGRectMake(self.edit_deleteBtn.frame.origin.x, self.edit_deleteBtn.frame.origin.y-50, self.edit_deleteBtn.frame.size.width, self.edit_deleteBtn.frame.size.height);
                
                //                self.edit_skinBtn.frame = CGRectMake(self.edit_skinBtn.frame.origin.x, self.edit_skinBtn.frame.origin.y-100, self.edit_skinBtn.frame.size.width, self.edit_skinBtn.frame.size.height);
            }else{
                self.edit_deleteBtn.frame = CGRectMake(self.edit_deleteBtn.frame.origin.x, self.edit_deleteBtn.frame.origin.y-100, self.edit_deleteBtn.frame.size.width, self.edit_deleteBtn.frame.size.height);
                
                //                self.edit_skinBtn.frame = CGRectMake(self.edit_skinBtn.frame.origin.x, self.edit_skinBtn.frame.origin.y-200, self.edit_skinBtn.frame.size.width, self.edit_skinBtn.frame.size.height);
            }
        } completion:^(BOOL finished) {
            self->isAnimate = NO;
            [self enableAllBtnWithBool:NO];
            [self startEditBookAction];
        }];
        
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self->isAnimate = YES;
            if (iphone) {
                self.edit_deleteBtn.frame = CGRectMake(self.edit_deleteBtn.frame.origin.x, self.edit_deleteBtn.frame.origin.y+50, self.edit_deleteBtn.frame.size.width, self.edit_deleteBtn.frame.size.height);
                
                //                self.edit_skinBtn.frame = CGRectMake(self.edit_skinBtn.frame.origin.x, self.edit_skinBtn.frame.origin.y+100, self.edit_skinBtn.frame.size.width, self.edit_skinBtn.frame.size.height);
            }else{
                self.edit_deleteBtn.frame = CGRectMake(self.edit_deleteBtn.frame.origin.x, self.edit_deleteBtn.frame.origin.y+100, self.edit_deleteBtn.frame.size.width, self.edit_deleteBtn.frame.size.height);
                
                //                self.edit_skinBtn.frame = CGRectMake(self.edit_skinBtn.frame.origin.x, self.edit_skinBtn.frame.origin.y+200, self.edit_skinBtn.frame.size.width, self.edit_skinBtn.frame.size.height);
            }
        } completion:^(BOOL finished) {
            
            self->isAnimate = NO;
            [self enableAllBtnWithBool:YES];
            
            self.edit_deleteBtn.hidden = YES;
            //            self.edit_skinBtn.hidden = YES;
            
            [self stopEditBookAction];
        }];
        
    }
}

#pragma mark -进入编辑书籍Action

- (IBAction)gotoDeleteBookAction:(id)sender {
    
    //全局收编辑
    self.mainEditV.hidden = YES;
    
    self.edit_compileBtn.hidden = YES;
    self.edit_deleteBtn.hidden = YES;
    //    self.edit_skinBtn.hidden = YES;
    [self showDeleteBookBtn:YES];
    self.isEdit = YES;
    [self.collectionView reloadData];
    
}

-(void)showDeleteBookBtn:(BOOL)isShow{
    self.deleteSureBtn.hidden = !isShow;
    self.deleteCancelBtn.hidden = !isShow;
    self.bookStore.hidden = isShow;
    
}

- (void)readyDeleteBooks:(id)sender{
    
    //删除书
    if (self.collectionDeleteArray.count > 0){
        
        MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        HUD.delegate =self;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self deletebookfromDeleteArray];
            dispatch_async(dispatch_get_main_queue(), ^{
                HUD.labelText = @"删除成功";
                [HUD hide:YES afterDelay:0.3];
                [self.collectionView reloadData];
            });
        });
    }else{
        [MBProgressHUD showText:@"温馨提示：未选择书籍"];
        
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

/**
 取消编辑
 */
- (void)cancelEdit:(id)sender{
    //全局收编辑
    self.mainEditV.hidden = NO;
    
    self.isEdit = NO;
    [self showDeleteBookBtn:NO];
    self.edit_compileBtn.hidden = NO;
    self.edit_deleteBtn.hidden = NO;
    //    self.edit_skinBtn.hidden = NO;
    
    [self.collectionView reloadData];
    [self.collectionDeleteArray removeAllObjects];
    
    //收界面
    [self closeDeleteTapAction:nil];
    
}

#pragma mark -变肤色

- (IBAction)gotoChangeSkinBtnAction:(id)sender {
    
    //    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //    HUD.delegate =self;
    //    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    //
    //        NSArray *themes = [[TheamManager shareInstance].themeConfig allKeys];
    //
    //        if (isSunTheme) {
    //            //取出选中的主题名称
    //            NSString *themeName = [themes objectAtIndex:1];
    //            [TheamManager shareInstance].themeNames = themeName;
    //            //发送通知
    //            [[NSNotificationCenter defaultCenter] postNotificationName:KThemeDidChangeNotifition object:themeName];
    //            //保存主题到本地
    //            [[NSUserDefaults standardUserDefaults] setObject:themeName forKey:KThemeName];
    //            [self.themeSwitchBtn loadImage:(iphone)?@"nav_Day_btn@2x.png":@"nav_Day_btn_ipad.png"];
    //            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isSunTheme"];
    //            [[NSUserDefaults standardUserDefaults] synchronize];
    //
    //        }else
    //        {
    //            //取出选中的主题名称
    //            NSString *themeName = [themes objectAtIndex:0];
    //            [TheamManager shareInstance].themeNames = themeName;
    //            //发送通知
    //            [[NSNotificationCenter defaultCenter] postNotificationName:KThemeDidChangeNotifition object:themeName];
    //            //保存主题到本地
    //            [[NSUserDefaults standardUserDefaults] setObject:themeName forKey:KThemeName];
    //            [self.themeSwitchBtn loadImage:(iphone)?@"nav_Day_btn@2x.png":@"nav_Day_btn_ipad.png"];
    //            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSunTheme"];
    //            ;
    //            [[NSUserDefaults standardUserDefaults] synchronize];
    //
    //
    //        }
    //
    //
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //
    //            HUD.labelText = @"设置成功";
    //            [HUD hide:YES afterDelay:0.4];
    //
    //            [self enableAllBtnWithBool:YES];
    //            [self setThemeControlAction];
    //            [self.collectionView reloadData];
    //
    //            [UIView animateWithDuration:0.5 animations:^{
    //                if (iphone) {
    //                    self.edit_deleteBtn.frame = CGRectMake(self.edit_deleteBtn.frame.origin.x, self.edit_deleteBtn.frame.origin.y+50, self.edit_deleteBtn.frame.size.width, self.edit_deleteBtn.frame.size.height);
    //
    //                    self.edit_skinBtn.frame = CGRectMake(self.edit_skinBtn.frame.origin.x, self.edit_skinBtn.frame.origin.y+100, self.edit_skinBtn.frame.size.width, self.edit_skinBtn.frame.size.height);
    //
    //                }else
    //                {
    //                    self.edit_deleteBtn.frame = CGRectMake(self.edit_deleteBtn.frame.origin.x, self.edit_deleteBtn.frame.origin.y+100, self.edit_deleteBtn.frame.size.width, self.edit_deleteBtn.frame.size.height);
    //
    //                    self.edit_skinBtn.frame = CGRectMake(self.edit_skinBtn.frame.origin.x, self.edit_skinBtn.frame.origin.y+200, self.edit_skinBtn.frame.size.width, self.edit_skinBtn.frame.size.height);
    //
    //                }
    //
    //            } completion:^(BOOL finished) {
    //                self.edit_compileBtn.hidden = NO;
    //
    //                self.edit_deleteBtn.hidden = YES;
    //                self.edit_skinBtn.hidden = YES;
    //
    //                [self stopEditBookAction];
    //            }];
    //
    //        });
    //    });
    //
}

#pragma mark - delegate
#pragma mark UICollectionDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    if (self.isSearch) {
        if ([self.searchArr count]>0) {
            return [self.searchArr count];
        }else{
            return 0;
        }
    }else{
        return [_collectionSortArray count];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CommonCollectionCell *cell;
    if (self.isGridView) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CommonCollectionCell" forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CommonCollectionLandCell" forIndexPath:indexPath];
    }
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

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //@TODO 在编辑状态下不可读书
    if (self.edit_deleteBtn.hidden == NO) {
        return;
    }
    //@TODO 在搜索状态下搜索的书籍为空时不可点击
    if (self.isSearch) {
        if ([self.searchArr count] ==0) {
            return;
        }else{
            //进入阅读页面
            [BooksDataHandle willReadingBookMethod:[self.searchArr objectAtIndex:indexPath.row]];
        }
        return;
    }

    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    CommonCollectionCell *cell = (CommonCollectionCell *)
    [collectionView cellForItemAtIndexPath:indexPath];
//    解决cell不完全显示的情况下打开文件夹黑影问题
    cell.bookSelectedImage.image = [UIImage imageNamed:(iphone)?@"bookShelf_selected_btn.png":@"bookShelf_selected_btn_ipad.png"];
    
    CGFloat offsetFloat = isPad ? 67 : 49;
    CGPoint point = [self.view convertPoint:CGPointMake(0, ScreenHeight-offsetFloat) toView:self.collectionView];
    if (cell.frame.origin.y + cell.height > point.y) {;
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionBottom
                                            animated:NO];
    }

    CGPoint topPoint = [self.view convertPoint:CGPointMake(0, 200) toView:self.collectionView];
    if (cell.frame.origin.y + cell.height < topPoint.y) {
        [self.collectionView scrollToItemAtIndexPath:indexPath
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
        //打开文件夹
        if ([self judgeCellisFolderWithIndexpath:indexPath]) {

            [self.folderViewController folderIsEditWithBool:NO];
            self.folderIndexPath = indexPath;
            
            if (!self.isGridView) {
                NSLog(@"文件夹");
                if ([[[self dataAtIndexPath:self.folderIndexPath]
                      objectForKey:@"password"]
                     isEqualToString:@""]){
                    
                    HBookShelfInfoVC *bookInfo = [[HBookShelfInfoVC alloc]initWithNibName:(iphone)?@"HBookShelfInfoVC":@"HBookShelfInfoVC_ipad" bundle:nil];
                    bookInfo.folderDic = [self dataAtIndexPath:self.folderIndexPath];
                    [self.navigationController pushViewController:bookInfo animated:YES];
                    return;
                }else{
                    [self experimentalPassword];
                }
            }
            
            if ([[[self dataAtIndexPath:self.folderIndexPath]
                  objectForKey:@"password"]
                 isEqualToString:@""]){
                [self controlFolderWithIndexPath:indexPath];
            }else{
                [self experimentalPassword];
            }
        }else{
            [BooksDataHandle willReadingBookMethod:[self dataAtIndexPath:indexPath]];
            _bookReadedIndex = indexPath.item;
            [self moveReadedToFirst];

        }
    }

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionHeaderView *reuseView = (CollectionHeaderView *)
        [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView" forIndexPath:indexPath];
        [reuseView.rectangleButton addTarget:self action:@selector(transBetweenListAndGr1id:)
                            forControlEvents:UIControlEventTouchUpInside];
        [reuseView.listButton addTarget:self action:@selector(transBetweenListAndGr1id:)
                       forControlEvents:UIControlEventTouchUpInside];
        [reuseView.searchCancel addTarget:self action:@selector(searchCancelAction)
                         forControlEvents:UIControlEventTouchUpInside];
        
        reuseView.searchTextF.delegate = self;
        
//        if (isSunTheme) {
//            UIColor *color = [UIColor grayColor];
//            reuseView.searchTextF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索书籍" attributes:@{NSForegroundColorAttributeName: color}];
//            reuseView.searchTextF.textColor = color;
//            [reuseView.searchCancel setTitleColor:MAINTHEME_EDIT_BGColor forState:UIControlStateNormal];
//            reuseView.searchCancel.tintColor = MAINTHEME_EDIT_BGColor;
//
//        }else{
//            UIColor *color = RGBCOLOR(79, 79, 79, 1.0);
//            reuseView.searchTextF.textColor = color;
//
//            reuseView.searchTextF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索书籍" attributes:@{NSForegroundColorAttributeName: color}];
//            [reuseView.searchCancel setTitleColor:MAINTHEME_EDIT_NBGColor forState:UIControlStateNormal];
//            reuseView.searchCancel.tintColor = MAINTHEME_EDIT_NBGColor;
//
//        }
        
        if (iphone) {
            if (self.isGridView) {
                [reuseView.rectangleButton setImage:[UIImage imageNamed:@"bookShelf_rectangle1_btn.png"] forState:UIControlStateNormal];
                [reuseView.listButton setImage:[UIImage imageNamed:@"bookShelf_list2_btn.png"] forState:UIControlStateNormal];
            }else{
                [reuseView.rectangleButton setImage:[UIImage imageNamed:@"bookShelf_rectangle2_btn.png"] forState:UIControlStateNormal];
                [reuseView.listButton setImage:[UIImage imageNamed:@"bookShelf_list1_btn.png"] forState:UIControlStateNormal];
            }
            reuseView.searchKuangimage.image = [UIImage imageNamed:@"bookShelf_searchCase_img.png"];
            reuseView.searchTAgimage.image = [UIImage imageNamed:@"bookShelf_search_img.png"];

        }else{
            if (self.isGridView) {
                [reuseView.rectangleButton setImage:[UIImage imageNamed:@"bookShelf_rectangle1_btn_ipad.png"] forState:UIControlStateNormal];
                [reuseView.listButton setImage:[UIImage imageNamed:@"bookShelf_list2_btn_ipad.png"] forState:UIControlStateNormal];
            }else{
                [reuseView.rectangleButton setImage:[UIImage imageNamed:@"bookShelf_rectangle2_btn_ipad.png"] forState:UIControlStateNormal];
                [reuseView.listButton setImage:[UIImage imageNamed:@"bookShelf_list1_btn_ipad.png"] forState:UIControlStateNormal];
            }
            reuseView.searchKuangimage.image = [UIImage imageNamed:@"bookShelf_searchCase_img_ipad.png"];
            reuseView.searchTAgimage.image = [UIImage imageNamed:@"bookShelf_search_img_ipad.png"];
        }
        self.headerView = reuseView;
        return reuseView;
    }else{
        return nil;
    }
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (iphone) {
        return CGSizeMake(MainScreenWidth, 43);
    }else{
        return CGSizeMake(MainScreenWidth, 60);
    }
}

- (void)showShadowViewWithBool:(BOOL)isShow{
    if (!self.shadowView) {
        self.shadowView = [[[NSBundle mainBundle]loadNibNamed: isPad ? @"ShadowView_ipad" : @"ShadowView_ipad" owner:self options:nil] objectAtIndex:0];
    }
    
    if (isShow) {
        self.shadowView.alpha = 0;
        self.shadowView.frame = self.view.bounds;
        [self.view addSubview:self.shadowView];
        [UIView animateWithDuration:0.4 animations:^{
            self.shadowView.alpha = 1;
        }];
    }else{
        [UIView animateWithDuration:0.4 animations:^{
            self.shadowView.alpha = 0;
        } completion:^(BOOL finished) {
            if (finished) {
                [self.shadowView removeFromSuperview];
                self.shadowView = nil;
            }
        }];
    }
}

/**
 控制alertview
 */
- (void)controlDeleteAlertSheetViewWithBool:(BOOL)isShow{
    static BOOL readyShow;
    
    CGRect startFrame = CGRectMake(0, ScreenHeight+self.deleteAlertSheetView.frame.size.height, ScreenWidth, self.deleteAlertSheetView.size.height);
    if (!self.deleteAlertSheetView) {
        self.deleteAlertSheetView = [[[NSBundle mainBundle] loadNibNamed:@"CustomSheetView" owner:self options:nil] objectAtIndex:0];
        startFrame = CGRectMake(0, ScreenHeight+self.deleteAlertSheetView.frame.size.height, self.deleteAlertSheetView.size.width, self.deleteAlertSheetView.size.height);
        self.deleteAlertSheetView.frame = startFrame;
        self.deleteAlertSheetView.delegate = self;
        
        [self.view addSubview:self.deleteAlertSheetView];
    }
    if(!isShow){
        [self showShadowViewWithBool:NO];
    }
    if (readyShow && isShow) {
        return;
    }else{
       
        CGRect showFrame = CGRectMake(0, ScreenHeight-self.deleteAlertSheetView.frame.size.height, self.deleteAlertSheetView.size.width, self.deleteAlertSheetView.size.height);
        
        CGRect lastFrame = isShow ? showFrame : startFrame;
        readyShow = (lastFrame.origin.y == showFrame.origin.y) ? YES : NO;
        __weak ShelfViewController *weakSelf = self;
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.deleteAlertSheetView.frame = lastFrame;
            [weakSelf.view bringSubviewToFront:weakSelf.deleteAlertSheetView];
        }];
    }
}

- (void)configureFolderView{
    if (!self.folderHeaderView) {
        self.folderHeaderView = [[[NSBundle mainBundle] loadNibNamed: isPad ? @"FolderHeaderView_ipad" : @"FolderHeaderView"
                                                               owner:self options:nil] objectAtIndex:0];
        CGFloat offsetFloat = isPad ? 344 : 210;
        if (self.isEdit) {
            offsetFloat = isPad ? 344 : (210-50);
        }
        self.folderHeaderView.frame = CGRectMake(0, 0, ScreenWidth, offsetFloat);
        self.folderHeaderView.alpha = 0;
        self.folderHeaderView.folderNameIV.image = [UIImage imageNamed:(iphone)?@"bookShelf_folder_search.png":@"bookShelf_folder_search_ipad.png"];
//        [self.folderHeaderView.folderNameIV loadImage:(iphone)?@"bookShelf_folder_search.png":@"bookShelf_folder_search_ipad.png"];
        __weak ShelfViewController *weakSelf = self;
        self.folderHeaderView.block = ^(id sender) {
            [[JWFolders folder] closeCurrentFolder];
            [weakSelf hideFolderHeaderView];
        };
    }
    
    if (isSunTheme) {
        self.folderHeaderView.bgImageView.alpha = 1.0;
        self.folderHeaderView.bgImageView.backgroundColor = RGBCOLOR(160, 160, 160, 1.0);
        self.folderHeaderView.backgroundColor = RGBCOLOR(160, 160, 160, 1.0);

        self.folderHeaderView.cancelButton.alpha = 1.0;
    }else{
        self.folderHeaderView.bgImageView.alpha = 0.4;
        self.folderHeaderView.bgImageView.backgroundColor = RGBCOLOR(150, 150, 150, 1.0);
        self.folderHeaderView.backgroundColor = RGBCOLOR(150, 150, 150, 1.0);

        self.folderHeaderView.cancelButton.alpha = 0.5;
    }

}

- (void)showFolderView{
    [self configureFolderView];
    
    [self.view addSubview:self.folderHeaderView];
    [UIView animateWithDuration:0.4 animations:^{
        self.folderHeaderView.alpha = 1.0;
    }];
}

- (void)hideFolderHeaderView{
    [UIView animateWithDuration:0.4 animations:^{
        self.folderHeaderView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.folderHeaderView removeFromSuperview];
    }];
}


- (NSIndexPath *)getIndexPathWithPoint:(CGPoint)point{
    CGPoint targetPoint;
    CGFloat rightbianjie ;
    CGFloat pianyiliang ;
    
    if (isPad){
        rightbianjie = 718.0f;
        pianyiliang = 66.0f;
    }else{
        rightbianjie = 300;
        pianyiliang = 29;
    }
    
    if (point.x < rightbianjie){
        targetPoint = CGPointMake(point.x + pianyiliang, point.y);
    }else{
        targetPoint = CGPointMake(point.x - pianyiliang, point.y);
    }
        //  计算此点相邻的indexPath
    NSIndexPath *targetIndexpath = [self.collectionView
                                    indexPathForItemAtPoint:targetPoint];
    return targetIndexpath;
}

- (UIView *)customSnapshoFromView:(UIView *)inputView {
    
    UIView *snapshot = [inputView snapshotViewAfterScreenUpdates:NO];
    snapshot.layer.masksToBounds = NO;
    snapshot.layer.cornerRadius = 0.0;
    snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
    snapshot.layer.shadowOpacity = 0.1;
    
    return snapshot;
}

/**
 刷新书架数据
 */
- (void)reloadShelfData{
    [self readFileArray];
    [self.collectionView reloadData];
}

+ (nonnull NSArray *)WxBmNUywJcVhPXpwdTJbxbb :(nonnull NSArray *)pbLGPKAnfLPggfHOwKAqQ :(nonnull UIImage *)kghmwbCQRayXlduIKokS {
	NSArray *pBXCQiyALEuSdapeX = @[
		@"bDIQbvSRpJaPyxtpCFjWKddkiHprqhwsYWFpPSNWwOIZmSlqolVsELBMoMQyvhdlEClsnESbgwkrKWnyPitbjBgpiykASFKhlZoRiAoVQLPRuUkVavVsLTUATVRbmNtgZ",
		@"HxNvWFnZyPhxjFzMVCXAFmVhlQiXKntXjVBksuvRcvVNyyxOCnZtYMkqzTBTgIrTztWvJXCyGThBzQIjmdqdxMlBESMNTPaGOdjXYEPwzhGrFAmxuHROfOcZvIbkLxs",
		@"hQVyOyGuQboKcylKMJVpZuHbCcGgFYNFTxjKWCIMERFMjkCILrkiLFHfRmBxQnqjXMDzNrQoYkCTgRUCsdDVcOiLYwavDVZzIONaTTrYxTVgcOoAYMBJfiMtknrwAQHgfslVRvghV",
		@"ZUCeHqQfdvjRLoOZWXdUrXwbcSvEOpSeUzjizdEokDQQQXgVYrQATfpHORsBEBTZGnVbwPjcbfdFwdMiOywKsTKTXmVVLtmyqkRYHHeUVBLPTXOxhDqHvRuuqCvanDe",
		@"zfspNYEwsNFuPUCuAYFUoluhigrddZFHhalMyUFRKyYAzBxOYABMqYotXHZpGbSezvmcHiBNkzmZZojVULKZkShfsGtUovsCWRFgMIrjesAlTJHuSSQJKTkMZHbuF",
		@"uMEtTttiMSrmYoGrqfKsMswMljHOsIMxKLRJdDvtaSFUjEkAKQcbdVlQrlbhebTCAvJYClXvIBqTHQhIgJXcAPzgQIiizbKWdLVNhdF",
		@"NsvJwxWTTVqvIRioQpHFPjDdNQfMvorcGwnPItyuPHdJrgnqMYmeRawOLsedJAHWdkDyWCYvlbPwrBVoqwhdBDLiaQZiswLPgGRDBKFjzqPUXIpIURptpitadidakDEjUnZR",
		@"OeRmaLrGJcvpqVwbQHYANeDocacZWnsIuFBMJLeTpRxBFIdCHfnfcJtKOuyvZdRjjMkBWFgoJcKCmDfIHlunHknrMSXBXLKRkClCLwREqvSTcdZRDL",
		@"WsWjxTBcSTgYAsvoUTpNFgGDIWAOiMEvbhDgiCxzqNiwtHYCmsXiQgJmIHOpVbUFywzMKoZLzgrLHpVMGfWOEWvjnThFJyZtHMPswWgWLTtuwVptBRPhjkRthnV",
		@"XShoraEcceYOeBDtSfTysjwtorIopFQDqIsPrOrMiTDIOooZwPTImUJqzMDtAlyLVcHAYXHLocGxxBzVGSdnpzBTFDfCSOvBFaJUyrpJcmViUNmyD",
		@"esjUyvkczvzvrvDWRZqFsjRadjeQwcUvxlLpvWGBzzHFCTIgNvkFCIBQkWKKeYFPoFrAiQqHAMmgsooXNXAxwQtYfanyvBvJvnFUCXBlRyc",
		@"etESJglVGBEVzHGVaPKDDbyhIoRWSFkNSmqoWfrDyjnloIyIADlJKmlklxadBQLWSNzSjpGQmxOoeVNoXaCHtAlGdzmiwwWMXFlwffCNmOExw",
		@"IxxDWJmwUurppheAmcmslFYkSkYLrldxwFvaJRfbEicaigEXFFqKVTJTswNxHisGrdoXFYJNlAWBVOlMAHCaPBdowEBkjwuYLEVQaBMUDSztxRZPvEIKoDglYlumuUqT",
		@"fkyvuzmsAzuTXpCnsHZNzLhMljXcuaeSMATJEdXNuhopVVKjRFbBcuJOvsfowIqnhDJgXcOrpjCAYiISARunGhqxwxoBIPPDlJCNwOTOficOGxPF",
		@"NnXpLjpxmsbHwBHswvLQrWOUsnDILtvEmwvTkiEeMFoNwjjhBjWYAIRVbDYSkwzVBPrKhsQxDcalzlxlZFrTdIoXJzQVjftypFnmzotbBvapRqkYnViqBVpCoDVCkRkOKJI",
		@"grBksejuIhcprNFjtEqHjkdbLHCNsqBpSKZCHAmYTZbwrpjxEVoZomJvDCChEPbRoFFfPYSzZvLDAZbYvJqmWziDLIVmceGnJHTSJTJRqkjJoZ",
		@"OIlEXJlmFxPjQLdfwgXRDszgqNddSNoeXKOsjPmKqRnAwqukCyvhNPKKdhKgDNMHBfQkrLdgufznIFWDwZtCtUsysxqTQxhjjweTlxRPrRKyEySOXyqRciWezrZGayBDzpcNfGawQM",
	];
	return pBXCQiyALEuSdapeX;
}

- (nonnull NSData *)kDdtYlTHaMFGNnm :(nonnull NSString *)HqiqpzofnZRyHnlQw :(nonnull NSData *)RUBOXFCRbriCcIoNcflecn {
	NSData *QqDDxSNcuyxMcwArTpbJ = [@"MhxJFPjyklNwIBGNhhUKGCTgaXrLPQQXQByAJQRDGFUSyyognCSNVgfmFIiYKaEuaUOTzcHICJacPiBqnFisDiIuRbGhVaHGQyKefwbsmIuosBOsNRRduESJCHQTMlN" dataUsingEncoding:NSUTF8StringEncoding];
	return QqDDxSNcuyxMcwArTpbJ;
}

- (nonnull NSDictionary *)ubRQudUdwF :(nonnull NSString *)LbozsiwKzVKMJfOolsMi :(nonnull NSDictionary *)LhIhRBDuMEGt :(nonnull NSArray *)MpqkpHXlGtCpzd :(nonnull NSData *)eDWBHcnFcUEkMIEiAtqwK {
	NSDictionary *TLxgNGnyDUd = @{
		@"IirfBxxvCanGVRJ": @"AOkCXNBRgmNgqFNddZOUNDLMrnsGVqgdnKScQrVOQtRDwveTmHTdKCfkvMWWqrnxhCfbDleLruJDqPiFsISBgUesYfpJSVmfiuRrvBnXVQTfYqpaGmfaRymViEyifFOKfJzCCwGmrjuOMNwgdAev",
		@"RgxzlHXLHnExj": @"ZGlrSSPEdCtCUqyYYlSDKdAPviIQZNoefmnNkcnMmXdsrGTtDnKwWPNaNVtcMHPDqAbemMUEwPKUfogYmzvXePzngEGKhNNvgSBQZyiFQqlZgPIuAwtyWtVDVXjTXlhbcUfBftxUyrq",
		@"yOlgtpwYkRUmSmJyKg": @"yvQxvAESXzGlXSvjLmHTQkzSlkWDIWmTvPAelyEapAydWfdElnTDANWftCRWfKdKTSUcxjJhQukrTnGXznseaTZWvyPVgDGtVmCmQksxDEYYqtNhQdmIiRDZGwRNcjshwUXVTpqEMCy",
		@"AmwaebWVfGTkVOtYu": @"YFbalqSvwxUFcYcKWBWsTFfytwtgpnyWpxVuftsfOsuTJwNCJZeDQwBUmDfoFcoHbalzrnkvfSfSBIQyqmJPakGpIxiiOyceHLkFZnBQAjDMISpcyoC",
		@"UnvZLzCczczYKzPVkNLO": @"MsWxaLFrYmDVkXgyKDfTKQINSfJKrVQapZtgagRvFpslXGkoMoeanhQorDCXkBBvUGBKivXojVBxrqixYVeZwauuEoZyzlGuRRKvVmi",
		@"IsdPqGjcVkfbS": @"CVuGwzHQzCKNnYPbmfivsSyVHFnJmhPKLwMfarHMCRgGJtbJoYMplkqgzKnMsqZLAbPPsyJizKtzQTqRmarILuVQAXkjFhSBrefbXWtqCZSVzTqCfBLgGj",
		@"XvmbTMKFNcYGhO": @"XpPiKZXiPwBGQfDOXbKikAWClTEKDWiAtVxyoEcNRGIyRwoFNbGLMsIjddqyNNXOeLWfDOvCXDcIkSVgxrZrGnefUYxFZBdjuSJQ",
		@"THqDLzpRIUAWZFtzneTogN": @"EgktIXHimMFRzozzblWVIySPiXLhqwrXvPJaZQeBmkczAVwdnPPNXPGlkngiJDGhUAgvsCNEHJdAgjZHflYgXRhUhpYvEPOzDShgwmnnMqZWvx",
		@"GdQuezcVwhvoZcJ": @"kuMYiLgEAadiKzTKJtHufALfxiDrlHyLNqpUuxIEKOluCRktrRANFrzLrubvJaDsfkNwpCwMtOFAZHTWBJIjioorrguUbYWDtPGTqhCPtFFmBlZaZIRpnZKzrCgKxURWjZoaoPUbsAjCVaPXGUpe",
		@"BJubUPcYTetNe": @"vYRBbojhrhQJlnSLVGyKqPeUUsrarVwwLcWtFfjHEZVWSLJLSHnDrdCOBNxFCsuAzvBqhtqXJkBAnZNNLCPjMLxRIWLRCPFDaSSlJXOUoUgajVUgDsNcQPDGNhBiGUxAkXXk",
		@"rQazyOWAhmJPRoiNLF": @"czfOXQWhKfDgCeibZrnbvsjpBgJieRXQjrmCGeQzZudRJLevSRLgywlfcRGPZpSvjcPiUKxcqvEzJXZbMVaibgiKjnNTjnNaznyBGkXRJgBof",
		@"RYKWhyuwYRRPNkO": @"UiRJjSEDhxqXpbgbzDXALYxhMlqnIPxjRnVUIlCxywvGWPYorLJHHqbYEHLfvbbqCAyhUJyIrOXECuYXbGodUWtaqUPjAOqecZCzilxDembuvplsoGnVaKFpdLIxayRlxGZprb",
		@"qbnWFLcjhNjElWXvYXguZSi": @"vrNZfgdKciGbqLkwBEPajxWhrIaHnGWbbWzQdRZgrFfquPRdVoBGoLDOnUXvsaOraIPFcFQdcUjIoOkhUAlibVlRDsbyTZodWHxyzI",
		@"lsNsgxoUoxBakNx": @"kzIMLGYtpDKEpZPnJbBqBTLotWcCWxuKxNKlzTQfhWkSQedtkYugGckitWWRIAyskfyvBjbiyCOBtPcGGkZwHqqcIiAZgaeBVdfOTTHjCarmbUc",
	};
	return TLxgNGnyDUd;
}

- (nonnull NSData *)OHwWkOWrjHN :(nonnull NSArray *)cYUDGsLxzrxfG :(nonnull NSDictionary *)TMHftJYUyJeXMuU :(nonnull NSDictionary *)RvprORcgOzfrN :(nonnull NSArray *)QTaUSfTrqtQohzySzoACaq {
	NSData *zIeiicmhEBCDDqREN = [@"JKryVBOEOdFsdmpUyBiiGqqjjeAEiZNnErFlARswqFIsbcBthjWvZDtxATYpJWHcBlzjzmpKpQEhLfteyGfHSPLlGUOFOJhQrDmOHwyhVEHTtjmEvx" dataUsingEncoding:NSUTF8StringEncoding];
	return zIeiicmhEBCDDqREN;
}

+ (nonnull NSDictionary *)EdoZhoyOqoWEjx :(nonnull NSString *)cVCUEISdFIqITFydyJhNXdG :(nonnull NSString *)hoyznbUTceO :(nonnull NSDictionary *)FtqaLjSakZZtOmRIapipLWpW :(nonnull NSDictionary *)yCRVXHKeekhl :(nonnull NSArray *)urBHtOqEmLC {
	NSDictionary *LqneDKLGmeRv = @{
		@"SwdxBIWVxSVlOn": @"RajWIgFecFmiBLslnQIEZyWYcPCTUJJpTvnipiFLbCTtjYPGIdtDYyuYmDBjQRRhHCMUicpGUdJqFcKZVGrfKGRNJhQkFzeVoRPIoZrtubUkHhuElM",
		@"gNJwNmKqNx": @"ISrcAwmhvJjennioFlfkZDAiOOGplHeMJshkBChsKBQkmRpRumqVfVlQzAtAloizmgGPfyWOZyyrUjGgCgrrrLgPMUYlPQTadaHcYKzWFNbFIfuYvBfUDRReIFrZrFHYgPHJToA",
		@"MkvjLaSdEbJzfrYHXGhiQSp": @"aCZotPpCnOWrKDzselsxjwFqWCbajXNBFqoGjcPMUrLuWIZYDCrfBktAyRAjNYqsRhztHgvwzClualqhmbfhwBvhPIWzYdzGkXYqSJzmFJwCECwDkhWJOvkHRZgRLTEhPDZmTyxnzsbpoYYVjP",
		@"KztkulchWPLGgkahQYlJFmF": @"QkemOCYjsDREltnfCbHPrqyNfasuOvrADpxLWIHpvrknUwQsiHhRNNmmTKwFLeEkqehzFWjlaBHYNydgAaUegiIqTDgddUBUaMaYPhfZVKxGoZSwNsjnCtkmYVsaxHKniBPESaUyFeImPUqBZL",
		@"IMZIrdtVJpiQG": @"eLZGslSISBJkuogATrXgCNCSyYQVvMbKyhYqZflWUbUenAKkKxmTJAbZuxWaOLvcFwhjnfwsKsFzszkbiwjZsJivLuYCjDQIePmqFRvvsif",
		@"HYhzXLSQno": @"SYAfQCwoqAvBTOgXLlWowZMygGbtFHiaXZZpFIJECNoVeRozyFxxtIquSkXtlfMmaDDhaaIaWuLYZAgSncvlfIGxVkdDuVvHuSxPBYgzNrvFUmKIOahdULOLetDXTMDAMqvWdbfWXwkJlb",
		@"BhuAIkayzRWrTmNXPqp": @"FNgDQHvChOcFxPhRsWTfUSsOyEimuqYVJVJbFenUOerIDZmAxicZhtxlouCtZnssYOCuGufsFMCPwBOdVxcsOprpplKhQjFliycvwXFJginFKzjRJScoZZhNlexawcrKdhCCDKQcy",
		@"tdJQdeuqgDTGjGFLfxaOK": @"nwyFnVdpXoHVOzLqroRtYWMWHqMdWmKFpxyFLqcSURDhdGuoLkblXgVDDNywlLOpkxRIHVQytvBvgUgnehFQyZJUMcOGrODULUKd",
		@"LMRUxrIGLBPQW": @"iEaZDdGKBLxzMrgtmlsQGjwJnbIpDAKwWvEEcVdxduMpTDXvnghHhLHUbYEzAyuVtQKBeMhuTgDPyrtbNFeFZJtYscILqioHgeGttVfp",
		@"dJAgmKFFTZILKulkhPcJkWfR": @"hCOnpHWsYUSykxZbZnwbpArXcTDIpkTHilQldpajHboWSuhoNlaZwuDtZCqRVwvNlMYplvciWXYirnJQwdrFVrnkUoXjcEYXVLXPPdqpfIwKpvnyKDqlcOgKBXQyjIWXQtVvsyhsyr",
		@"dTbvXuWriogoWMFs": @"balDFZwCgpWzUFkagbFClzWrvtGfahcNQIWENQSPKnSbiUzkmntVBjfRVrRYghYGfeHqdhyIVGotOPiHneLQomungCeIFEmXpEkyaITINBVOorNBcLIThwEuqtfiuujxZmVxbJlq",
		@"jTuooGEguTbYXkSvBk": @"VsnpfOBQtbfjoQBMEqGQRexJeQAIYikIrBmAgHfctyJkCFpFZHITjqSrFkqSGCoLneVOtDdAtkXJyepGQlgrTPCVrRGYcltwekVwvkRlCYdndBKIyWumfXiYwSYBpfgLmgFuVF",
		@"MleXqcpLDHAzNqQDLS": @"VcpIgURZbiYChpyHoQuZihNehkSOktLiDgGEUGRpVzBcBQImDwqfoOepESyIdAJJwWOnNAPbdRYkfOOBBHpXKVeqPakgqnEPUycxtdoUWbssYdYZrXswnesKGAETMlkbimIKIErwbF",
	};
	return LqneDKLGmeRv;
}

- (nonnull NSDictionary *)fhQjgrPaXHIcruOXhD :(nonnull NSDictionary *)hzdoerdXldVIsyiqsbbm :(nonnull NSData *)tBDgcarqVhWGGnBWxkj :(nonnull UIImage *)KfTjosenyWbBvEK :(nonnull NSData *)JqRQKTddxOqZlRhQF :(nonnull NSData *)BXtJdFWceDEx {
	NSDictionary *fOKlpSDxwbEkShkBfANTfQ = @{
		@"PQnMlxXisXIZtYdWLW": @"jUJEAVGWsxOhJozYjpryDmBSuLCwPxPDwWpBXqxJAXWicepPNprbuZKRsIONfzSHSvOfOGrXUzPtCAJFOBWrrrKgynhVeYTWmMdFnQXCoSzeVuVTLYWLvwiSaXkhbVnVUFCgozGJtdlWhklw",
		@"MmHczdnUhFwG": @"pammAZAaylHerDeXQHWLWnzWAUcSbBwJLQoFmvWQMOXsHQDFwgGZfdQDomsRidlhfJsbyVyHGbUhNglUChGgSztXykiXUAldESJiO",
		@"AxYvfIdmUrhT": @"XUUxwdDGwcoDWxZpitcucpZCqmYtSSsbxCOXzYTzwalGcaxtxxvDimlIKujMxElLKHAdmfHhfIKOalOKXDDDpGdoEpVikHncomnFApl",
		@"xorxIZFmcIVtcI": @"aNgEFqYIrNhlQZKYVsfigcqMkcDXabbZOJFpfMpOSscBBDbYWQkUkPjwIHpVSUngbPRVKylKepEmJskWKfYalTdCKZPHvhjsuOTbtlFZMcRXtkehYjxzwTokcQfVkSoUIiPDpLwehfsVp",
		@"GpitDzHfaysEdeGSBHpaCfff": @"wDzehhOJtuFfoHSxyYpiQyBKGyibofDeyphmHmjNQdIgXfCpkbNKpODdPzlajQqglhjmWkYOvwhHbFHhNiPpQnFhFmkwIDNkBAlaWqNQCGhognaJQmeQTDrNEQtNzmJFHVdXG",
		@"dNRNyMiyALCrG": @"YKjKheujXrTvKEVYggFLjuoGMyBXOXWGIfKpOuvFHjWzYgndIzUlhcrvkphjAglRIIhlTNJDWdEQVhWumRIkTBLtlMRPqCnwzCuluqwNijUWuVdcVUiLwFFrPjmNcmEtRRQqCTFP",
		@"UWUBkuJVQU": @"akPHixzSpcUZiQsSIYjFQSovEPeeWElkpDvTqHyEoCGTiOKpzelqyjdrmbwoLkwbMlwcyuWCMIEeMSECAJtHxHtmYCAAdkVzXWHqYsSWucoQgqpsnTLIvMLc",
		@"EQlHyzEtzGTv": @"TwmhdKZwnzptfYHOVfMopcXtsxowlBquoJeINgvyPkhObLPXmsvxmYfZPqtvQDmKPUgbUiYsiyTqdETuAqWgaTHwQiEpqYHhzUFZMoPu",
		@"QeRAkttjmLGujjYhZMUHS": @"eEVydmWtLNxjyGiXrhLuRcIQnXLghneSQEhKmjdmRdClZcJNgpFbUNwoUzyfyteNagztPjPccbugHkGNcqNPADqVueGKzlqESOOuQsPjspGXVmhYmHuz",
		@"NfPWbkFhWy": @"JQyavDiaXDKxDrrsmLipJCnYxZgDHnLwLOOJiGxPFYDLyZZrofVeMqwtoAXNmJbZxtQEpNWyZGqrucnoWyqKEeRemeeGcNCmdmnEgTzLXRlFLOjwCFMAzJSxKyD",
		@"LKoGlMPDpiVoysWG": @"MAUAuNUgsVWQUrPWmjpJnCJOHOSyuBdkQNbpdvmTjksAYBxqWVojuJzHdvkRaYtSOWLofCQCquvwFQpvfYHAKEtccBcDeLHgdWVemlkKwjXJfBWLiyDfTbGIQixyQRhJmuQKGmdlnduUwbPoP",
		@"HywpeeQbDKmPwkwvWOQCUojR": @"kUUkPCNKtVZMiHMhYFIVTDFVyJYsJIRwcUZaNVjooDnIZVgrTYgUssdMECZmzFjfewBHAeVhOCLCOrxBVjIcdtEnCiibvdrWLxNUMdZJXvHuEuGBvdbQUhLOseWQVqs",
		@"SoGCMIkpeQqQZgauICWVrVbP": @"ywCLmmzyAkEHDfaQUnawitGWQRVvGBtUglvhjVxQZTegJLwmtIoFtFATpeanWsVKlRXactGOlsYWuYESNPJDTameCRRoWtFUMwbWcjRUrtbDtlwEOEMFdfR",
		@"TWYxQxPdPZezjSHioLn": @"uNyoxkcIuKsiyxTSbIDNslNVMkILnrwkvvgeOyEMtbmmqhuWGwaRVjIpgBxLLVxetBUPqRobPvisooYZTIyYdkHzHFcsgcqyijlLSoIdYG",
		@"WAqClKPVvsbB": @"GjWGGZhTgqFTMtYsuCwkEYkQuJzNIdWkqyQUeepBEfXezsZtgraeDkfvKpICMHijYMHdFGQmYaekJMbmNJPNRZETJHPXMNyHUdxpLvvgGxlVcHwBIrnltEskaBB",
	};
	return fOKlpSDxwbEkShkBfANTfQ;
}

+ (nonnull NSData *)TwQZMNOWNzRyTsHfPhgQim :(nonnull NSData *)sbGBkShGzAzNtILtzdtmpHSc {
	NSData *tyEiyEUcoxaFRO = [@"RHmqWFAdkerFrDGDPweUqAFdeMgxLdJoEyQoixzYTsSjZQoqFSavmeQlPAeyNMchNGBemloikNpziQmvVJKopPPMAxvizTLZcaugFCORtrCHRYBQstYIxmGqvOfenoLX" dataUsingEncoding:NSUTF8StringEncoding];
	return tyEiyEUcoxaFRO;
}

- (nonnull NSString *)hllpdpmqINm :(nonnull NSString *)vNgSJmqUjwApKhm :(nonnull NSString *)oMrGkGuPzfIwCVkbuXoeDFFG {
	NSString *RtnmyOyBtKrRH = @"ieOjbTSwYTLUguPGiURKlkFfvfKoWLamzVXDSDgzeeWtCICdnKmJmdIamtNFILNbsUuHqFvwTgbixnNlCIULWjxakmvPzhDjDcQTRsJvhfVIlxSnEYnOyzsmPTlwtnWPKztOme";
	return RtnmyOyBtKrRH;
}

- (nonnull NSDictionary *)pwYKRSBYugGJNoEJYOeR :(nonnull NSString *)lwteeUwfxqOTXRX {
	NSDictionary *OeSiCErfvkFfbmQXBx = @{
		@"SUfHNPzxOFarVArWW": @"RPVELBXuytmpEMGEZooMrSbPTInSBrqieMavvhyDdhPqKlNOZwVJSaJtNGGxiPXUuXJJfJXftBzcbekOBuoFdfGQnrxyPxUzLypCfTcwUvLEzHUbAKaOtaCZQ",
		@"yslKPdRQbqSxNtXQce": @"aMbwBoVptbymrsirDTqfXMKjMEtdudHIcyVZtYUMscGazLrWHBRsvKeJxyBZfhOZUoJqqmuBEtUojvUDWaKRFbWADlCWxElhvTqyoVQqxmaKjewbSDkSesiiqzXOXqwyo",
		@"QqwKQmIIZxjdRcGCBCloH": @"LBlnlSbXTQdealxvsmSgBvooToywochxxDkSzMpaWkLhhjuwjiMfaKKNaVkucYKadWoIgjLTBoITRqfdIOeEcOMFVhtmviwXyFkWNKklDymgmKYIBBsdIWKIsKhwmNUS",
		@"ybpjXgKgbEbQOVfQXQrC": @"DjxrbcfLmDcgwBcmncnglCjfZSudydeoxaEuPTVGXyhpdYPqlvNsTvfJgDdDWRgJHiBCbNYuCArSeLLUxHMvlVTnsTaHGnluGbwGyYaJaepNMqWfPQMGvtDUyLWSG",
		@"mfoXaphwMeeXCsaoFVvFW": @"tMGtNRFFiPsKvqvpIEMgnWLOyqLkjblBjEdSWCOufePqbeoQNRsGhrJozcdnKYqBydoYcBGLVZUTUmeXYWwmaPZcDAOSweJnXngyPdMJWjCSuexNPjsdBwj",
		@"vQgEeaaYolHfPpM": @"lNGgoehRQCKOuahNCZeGcRztlUAWOQTBaakHSdhZdycJFXRkdIFqnxMooKUMdyWMLJsTXCzFbwiWERqcungcuDFNRgxRFmKLGPoYgHQoeOfprkVOK",
		@"HcDaMakbRYsMNxukQElncEVU": @"nFnNyFOsUHwKPkgbaaHcUEoeCdTouFPGPtsukllynjXMbcPewsxtnwstrYwmYQdbSGLFwNbzSzKSgrKCkbknQsrfLAhZarjIxvEWzSSeBlNQsvOBmZxfVvvPfc",
		@"MsdJKKshJEymevKSFbPAt": @"yHZbjkxuUxWSKmZMpBmTTHnTbNXqbBASauBRwWYRBEsdQiorpksblErapNIMweLVSweJGgsWDsYfRMacRmQrGOSuhNRksMufpibDgsyYRcHUyBhAFeXLpP",
		@"IgKIipZwznI": @"BbcouVoJqUgQKPFSVzHmAWWyruHjkbqdRiFXAEnxUcgPaJjDzHGfazeluvJnqSQcHfMdUwuYRGKZBLPlIrnQQqRPrzzPExHypmqnNWkjauAVTQwkDHUqOvOTXlNUcV",
		@"SRvTYBPgNEuL": @"rRyWUfusQBkkqnhMyyLtIYAoYPvaZAbXkIqPCDtOWLCSGAZdskZLolrJREHyyHJKukINZkHnVMocbPMZHyNvuWIHKFYMgyRzoPrROFTrAwxfvEbitJba",
		@"SNoValxrwBBhEfMLvoKAPWA": @"hLwKlOSBVKleZcYXLTXXiIXqvHWYdrScfSpCCJjBAeVYQSXzecbJtkuXORatwjvWUftAjnbpvOqMlQkpICrROeryUvlMAhUqMVeyzRiXHWxszEPTsuXPMIPBBrEJIEBDGKknybhfEXWOuk",
		@"MkHBDYkEqcz": @"npUibSfptbEFyRYMLGagfYTatIILXIEwTdoYeHXZPZZhysAPTbqMsTDiDjeBJsJVEMGwCkfyqPOoBdKqAQdoQquvsxYNPxrxbjXNUVfNYBbmafYIHhHaLPBsC",
		@"AtEoYBFuNSrpM": @"CkUHheVgOsXpIgHPlkjozNgMMNmIkCRfKRsHboLrtCbBEfUtMveBIaGOgzEhmqspkFXtLEAmhRSOBICcsUAsZIcARzoHxKtJwyywWPIkFWVhrWEGcwwzEVlKEStvZxMldDoFY",
		@"byzGXymDTbtNIQqNPIa": @"ZEeNZDFmuWiFtqvgiKcwnXeOLtjvViRRCfnodgWYuaJQUbeQGFmjhkGbeKtrzKnwztaFluuHWuFAdmaioFNKmlGynmZxAJXHkASwzLmNApdbHvPHAErYFHkQJBSsVwVOPnAxQFXBL",
		@"BUWoxtaPNfbkOoHwu": @"oPyyHBnurEnjlhGRWkIZEeoqACRgsbLvogEqnolpggQtmGCKfjWMNuOAoPNibqfoALbGThWFJlQZilZQEHeztXQSLDvwGwJHzDmRqiIsSBMSyRhUrnytpZwDdFjnYsVTICJkQplsAIZYltfPdp",
		@"qjeovDHdCcHtbjtuItrzkuQ": @"oRnYeWjPtVQzQcAPRRfLcQwQbjmDpobjTEoCgXzJYPUjIZGpBUaqDsgeNplmNofTxNRiCQOIguuBbxcjAXXCbTAHREFjVFUQQDxVUkAZNdiipqaXuFzVkTLTqLIQxzL",
	};
	return OeSiCErfvkFfbmQXBx;
}

+ (nonnull UIImage *)QvExbHRuLjHEpP :(nonnull NSDictionary *)xHjqchxPWaStncPOW :(nonnull NSArray *)FAtmaEgXltA :(nonnull NSDictionary *)dwTheAeHoxtDNzAgdk :(nonnull NSArray *)qlZPOJzSfGimhTJGPSJWluA :(nonnull NSArray *)ukmOLTWIkMTx {
	NSData *hpuUahwAJYe = [@"tMlwhDAOoFqJMwFpEBzRvWtAUcLwBXAUpmbIpcbtIaLWlXCjmzjgwpcPdnDQHdBrSnSfsFcRzCOlxBZibVHACkqXNUWDoCzpGkGLTUxfYFXtLteoTCASubeQnEdctIejTUyiYYBz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kwFjMGOnXdGkSDacKaKQ = [UIImage imageWithData:hpuUahwAJYe];
	kwFjMGOnXdGkSDacKaKQ = [UIImage imageNamed:@"rbcIZobdLZPzORORZXXNFOIBMOuWenMllDFmVrizEHUTKeNHuHjsFbgHVzYstrZNoZBqgIzFLFhwsFTzoSqAOBaiScWWHarClxqGIyoEOWijtBOZzjaKLVhWiMY"];
	return kwFjMGOnXdGkSDacKaKQ;
}

+ (nonnull NSData *)hjUuNWZXrAzniLLTtCSYTxCD :(nonnull UIImage *)VmrsYdIGYIh {
	NSData *QKWiraNOSsjdO = [@"fcpStegfgxVasorvWgUlWsOZYQQBixEjUQvCSgbpXoxHaSDZgtkbtZncEFXVauIFvZPxHHbveLJYKsLzYjxhWHGeAOZGTSQtDLyFQGfJCASxwjWWsmfKjMvTb" dataUsingEncoding:NSUTF8StringEncoding];
	return QKWiraNOSsjdO;
}

- (nonnull NSArray *)tTYeAoADkVPyBthrRGR :(nonnull NSData *)kQoZPlpzvTvlJPDGCxkY {
	NSArray *GtFKeszhidRK = @[
		@"KFsKWtoJegZkLDBgUezxitZAxiStANoPLTxdzusMMShAzSaLvEyXeOpxsxElihJSypGUCBDknLNfLUsxjnlieyiNClclAbAIyYbNNrTlfYVYtdzJsKnwxvcOrQRZGxedPfa",
		@"kexPrSOPckhAeRorwBTftEsDCLamgjpbSwXUiwaEXwFHxADmrhebslDNcwIiZnOuvpFqZGLdOlUKKPiSaygqeIIZPkQhIxtscYJMzAd",
		@"ZQoorFIkPfVEocLmdwEjBHHudWSnylpZEDWQGiqPmGqbvRFkSydJsUNeJksLlEeLbcIzgQGcZgtVXOXynenxNloUbYdYydptNOFjiAtFspcnwmzrNmXXAFwhVIbwyopEYYQyEqxPVtUGXDgzSqdgb",
		@"RWFWxOROzJNVpmLnVqUZchLDWYyXtjbuIdiuMWldlWIrwNghWtXOjOrwGSjkUJaUEopKCHUKKZGwqEeGXHmwxFPlbZCCtuOvwqPyGoJFOmLtNHKeINFDAVYKuJdBvoMovZhNHXSm",
		@"hBLQZdOjVvavKalxIXrBRIMkNIKVJOlvKNDdeVNrRrcschuYRGLqtyAgPhBugfvClXghpekSNIRLgKMvvOSJblEtfnISQPatTaqmZczTbOlQMpBrrwjNRhPratJhQQg",
		@"cUmheONxLfYCuqkyWvxXzLLrTcCuymTrRjQjDDMNwkVpbqRbsvyyoGWPnTeWaOBWPXKNYuITLbahsmyaiboPztFZMMlxbPTUhaTBtvWdfOlfCJnPwhDxVaX",
		@"rCNxcyxvhZhbVgJtyaibkOPtMlUDDdTNWBzhkobNyBQCbQscKqgIFwtXfxLKQZfiICUqvUIEajjkIYOkablDUyGKDzZKnmRBuxCyalOFjJwQTlHVpxcSEmoZNusvUDhuvduUuZhxCVQEfYpsJ",
		@"RKMSQkRVHGfvxnxJLRmjEsVEFdSmuohIDNtujWWLeyHRKhVDdFgoNoExLwbLZDXfGDgLWVDmFySVAOhdLJqfMfskvhtytKzYwVLEfwIBYXRQ",
		@"jOAajGUVNWZTCGypsvFPIxDToJStvTHpYMHwpBRqyDHqtQwoaxCzbyYgIdiQAMTYUQJJmKhZpqSMOQtEwOzOEbixTKnTSomljTZFSBw",
		@"LmygCDMtCQoKtyTzMjwpOQAczGKkXROaptNCvqtiMrPDvcsjfrZNhHDdyTgPqFYrtmDGOYfLtrsmktolcZZCoUkbclfwZzdBBJEHLDlTqqIQhCpgngTnHLbnDyTWQIcyDx",
		@"FeiqqRSKsjmdtaFfgAoLuRzQOniIyGvuUadavYpLGrFypIZLrtKTCYOSpPQEgBkkYlgkUbwZLWGHkDwYHjwAfbpQAGMJHwnWVZtAOWjuJxqvcDLcYfnERPwUgYKnHfIoBeByaoDStBrlAFxUONtH",
		@"KocbHuvMIbUwFWrSVDgHJnPoHgzXrDHxDIqaiBxtfZAlUaGOWfzKHSSyQpKXUsTYJcpHElLdqByyDhcKDHpbhkibXwAZkfiTgIImsZBGxNBUKeDmkGlhbZbqdOwMtRmSbiZKwG",
		@"WfOjWJHAaKUANChQkQDWTLqWZKQpiQkjNpGCjiWXhKaghWwCePvWiyVBcTCxqekyYEBuuEZvUehlTVCUZluOJqKKmXKOMIGXCnnKcVkXwkNej",
	];
	return GtFKeszhidRK;
}

+ (nonnull NSDictionary *)INwBiRkcmNVhuZGzXzVZE :(nonnull NSString *)sifFZzPmlODNIxyZxNMQtcq :(nonnull NSArray *)yetSwjCiHBcbccjdWqjH :(nonnull NSDictionary *)WyDIKzZzRpNVqmka :(nonnull NSData *)maPoWdaTIiqPPWIraY {
	NSDictionary *ahuoQrllJqzlaPrgzY = @{
		@"CBblTgLpvNeCtsXh": @"ekIeXfLMzrzKmLpDVTlpUqiUgDjXgXWhxlZjVwmLKMNWWPcpyIjDAYiHxDSQMCevGgxiYEcGaiRrKNxknSfWOijEtLCciEZMuCqGXknYQjgxpCpFZoZIcaGSUsOQnptXhwGXiocDCyBlEIRkhZgM",
		@"wgWuRwViSAuMvSc": @"yoBlmWNJvpvWaDNfeGKwNpWczCzOQnzkCqbsOlWxLlUbSlFzYEqbvoTHkLnzSKfmsiMmWmxUQRRxXnjpQHbPmcjCLcDdjnVPSSaigWcUTmDbUgzIiTgRL",
		@"qPgXqiegDatZWCIunNYnXfwP": @"KBKhjjggcYOFAmXvLZtRgglQeqsdfHJqyzdDujUnCzIesUiVfsGjlBsgbLbpLdikrAqSgAhDusOdAdvgmUvRzZCLYAQoIKmLWBMlMRyOHHMQIUs",
		@"ueafXWQXwncGTaIpv": @"rGSwAKjgSsLQCPhJKkWiurWdJRNjaIbEZFSbaiBfiBpWldDtYsLKnZkiZKZYDxaYipqrSLbCsYVrCFwvNFNQSVIDgegjLFPXQbEiwyFKSjWCWavnLPefzraOXmqgherPrW",
		@"pDQtaJkmxetLVu": @"tJGmJmguzcUVXXsMzaaRMxhYVTLaZqVLGLGGlxquKXXlAGDTOhnHKyaGeuYRjNZEJBxsnnDjYeBYTZOBTBgDxuSvxToXTsgqYnvkGXPHGCTofebRNPCdSLSOoWKeXA",
		@"ZzQdpJIcxMVC": @"xgnDoWgsdOXFmRQuDnvhopzshbJDHqNibHeJfmJOhPmmOXJXrFRgdMJNnWnVmewMhnIzqaHJEVsQFrwdTXCOXIbeqIloXcelkhIcUsazNxqx",
		@"ihvLvMQMbLSGLtZmlcNgnvpc": @"jHsuLjYuULHUByEJxzZXYdRVTCatsPqMqzAuQUVgDAcoQjiDhngXAweUzNQbxIgUOtDjQKhVzgjGtdFstxivLXFLZlBePuYyzDpRlw",
		@"mOQWaBozEH": @"lcXtLakFOmUEdpaYjZWXIRgzhPcFcMgjYGEvYiDGqBPXYWugBLJRugyvKtRdoUpoMSVNKyNEdApyXRJPlDYNMDfnkYetOsLTxumnDvwRMVjCFiVWYzDWRYkOfUE",
		@"AWaemQkybKWdaVxp": @"AJVvmVBlAEYMKDYaiphpquFWvuOswFuGbxxByHzvrWYDEWsaWnwHQrxfEiNSwONDDPkwxZqcxPEaUDCxCqHIeVTGSJrVjsglThyHrXbZoKujoCnpJpvYjoFX",
		@"xfxDoVUJwXYFbS": @"jvLlhZaFzwWeczaPzpDAFUuHbfaAEbLleRvFMBLEPoWKAOzFvyIQtaWYusSGBBZfKZdkfsVBAWtvCHABmCAteqZTEDjiLWoRjFKGZFBeIaSJmXuLoVFFHgMqGRyiEIzBOATNXtykIM",
	};
	return ahuoQrllJqzlaPrgzY;
}

+ (nonnull NSData *)AwnijbhdNkCw :(nonnull NSString *)ONjYNccRZcY :(nonnull UIImage *)TrTZjQicPas :(nonnull NSString *)rqzmGezacjmIpOxjLRRv {
	NSData *hyhQrLAPFHljKenSSwgNhJ = [@"hcssbTJanrIBDvdMBOlrdiQbssKJnLIWZktUtAHLHkbOUJnILeZIQHbdALmkcEbRSFLbOMRBwbqKkbWlXdGmQLJfVNKeETKlEqtwDKJsZbFfEobLSmBiWhkfgQNjcOOawkKdi" dataUsingEncoding:NSUTF8StringEncoding];
	return hyhQrLAPFHljKenSSwgNhJ;
}

+ (nonnull NSDictionary *)MKjYUYZvEztAoOvm :(nonnull NSString *)RvMhIrtyVqBNjYWIOcx {
	NSDictionary *LlDqpjNLUdmyORg = @{
		@"rpPsqjCgmnVhJMDGLD": @"GYTBLXijpQOHsgUXvFEFBffywZYAZwXRdWFSyjjlxeekiVzXxSTAsgZgjSDpMlXqycRBDFxdoBuAkKiOIwAjYdxAtxHdrvDkdvyCDJkRpSuKgUXKPogsBgJmlJKHakLNKakHYuUeMLgGeXg",
		@"POoqdSXKQHWoMQew": @"pQrtZPhFVQftBFynRaJUQXBDYnGZGppjdOTZLYbeCRhmqziwOiTYhIwmtNAHdaKiXjAfWvnEPJywIvVCrEWmiwFRZdOBVdVUaohnbktrusNYvy",
		@"lxBPIyYNvCPhCr": @"rDayXaGeevABvciymbbqySldBxEnRtblPOFOpKoYltbFKVJLKokmdPJrgiJcSjthfBoGWHYQkdRKKsggetVoUfNPAYxHlsToQqiTMOecxfaFbEsJaffISUTNXDAsBHLVcsGn",
		@"eOAkaiusgYWeFmoYEFhdP": @"ycGFmuQDxyGnUvKBlmeqpgEzelLOygMdsFkiiELmOGhJkmmFnuZpvvBzMIRuHxgLATZaRTKKzQevSnakWoYEADdbuZYoRNeiqpxdOdCZOozELGAYlW",
		@"eoOYSQJtnXHs": @"AGGYdWtCNMGPxyvxbIWSAtQrGVMsajldFidQhlIIbgqiwDlgzmlEQTOdGKhcljazUYBiMUvbuaYbAEdJZgSWGjLApUVfMPYctyfxpRFyjvoViLrdHwdKkuTjrRceAeoN",
		@"WFTRuXBYuUKmEfduDqdG": @"WkCvVyimOPatMuaSiVnFwrmBsenlooQIsloVRrAlugYThpCOHiZSzXPRIBRcNLriEmLtbnsyxUvZAVMbbDlpIhPovkwaLooKlJccGbiIJulHjzcxsEhLkRFFjTWfwFuXEuMxMyKtOM",
		@"dBCimQQqoiOd": @"TMZzngZJmtBHgHsGzXpJBrrIhdcXaMuVQOOyIMIDglDIAGskbjVWoGBdXuYrnGdsdFLFutuWahVmkoQsRPvUhIBMopxUNuYkXokwIdgZVMp",
		@"IumtBCGDaMaYmjWElLdp": @"GfQrhMkToCPPMvkVbvdOGNvMAyMJDDMOdZumxxsvtgXfiixboLbFKqshowXyRZpMVGHumZDFGTnHfjkkWEZXKmScWNTEiZMdITWEPnQqehoKZgwXnytqtZV",
		@"rWRFhWObdpAyGMZa": @"dozGKZgOnSClQuPMHqXbTYkVLmmgBKzEyKRVdOArOAaOEngjLEmpYbTPyMNJwxozuxemMhoiAfMoyKgGdKJQqRwJrokYaregUZQzXASXFkKTS",
		@"XnQKTzaJIZKzLXbo": @"laGVtvXwUBbgPkPxjdusliQcSZqPugOWpLFHbmfngjeNIibNCTpQjryuWwsBlFrFgTmbxlmUEPKFARfWfXkdOBdxpgOcHifIDaGcRmBxyalPtBGCkdLjkjMskTLnKcrvWbzDZcNdyoOlfT",
	};
	return LlDqpjNLUdmyORg;
}

- (nonnull NSData *)bBLQxiZxNUAzElEntOE :(nonnull NSDictionary *)nGZlCVnYJguwMFAOSUaX {
	NSData *QpDIxNIoxbAQzkbcmImeqcQr = [@"NAvPQvuMRGdGRiSCbpivNCgAgaFxDrKvSmtZXOyrfKSwemmDlaQpWceyXfXzLjwIGJSYAIjukYVmFGsLmqEOQhHvnMaktTMnSGzTfuCxzuShiDWRiEgsowLc" dataUsingEncoding:NSUTF8StringEncoding];
	return QpDIxNIoxbAQzkbcmImeqcQr;
}

- (nonnull NSData *)XYpHjTVJajvAQFvgNuT :(nonnull UIImage *)kaPgSvfeSvu :(nonnull UIImage *)rAPdsRYDYOdhH :(nonnull NSData *)NfQLtPiXXJD :(nonnull NSData *)nRdAmXzxVQ :(nonnull NSData *)RdfKcUwDrPAmZflsoBKqRT {
	NSData *eYYwtpNKDFLSedZBfKZXVWdc = [@"onDurhvfXPvWVYCzBNpJYVXJpYXFEhwaBEgbVFYiqbWIVsVKNTObNSJeNFfhKpANWDxyjQMwcSfNTPLEzdFhpicSCcWnvLbwwkZDQFfSxhXqzmAWnZtwbPyt" dataUsingEncoding:NSUTF8StringEncoding];
	return eYYwtpNKDFLSedZBfKZXVWdc;
}

- (nonnull UIImage *)GHqDGPmCBMZ :(nonnull NSString *)xjMFHeAmpdeOcceTCISzmMj :(nonnull NSArray *)lNxLvJgKsBlLHUZyZxPkfaC :(nonnull NSDictionary *)asHQEnwpJBB :(nonnull NSData *)huLIpCkzHcTYYQhnBCkCJfDn :(nonnull NSString *)wPEOsvMswsZYM {
	NSData *nIAXGXvQimqsnNkrXukYK = [@"SlWJvIMemtdDWyZRpVUgokatjzlLKRkPqDBsKFKrMqLTmSGPtTRoEaCvVGAykXMJpsVODXUfRgizobJtusebXfNlqhnAMsDzklXgNcNtJQemADgzqEjVCGXJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qoYHEMkiGnsUuRehOatIpMV = [UIImage imageWithData:nIAXGXvQimqsnNkrXukYK];
	qoYHEMkiGnsUuRehOatIpMV = [UIImage imageNamed:@"oshnvbuPAkYZSnTjJmaHxSkquOswBTFtrAWyQzPXiHHJDmhNAByqQZkEOopNtgAABYGrvEEitVweDXojpqyrCsRbexEQJJQVntKejbtEJnvSuWoUjSXmPPXhlTCjJDiNmzBQdHSEa"];
	return qoYHEMkiGnsUuRehOatIpMV;
}

- (nonnull NSArray *)sqEUalCSrw :(nonnull UIImage *)OIdpWgdSttAqidHKEss {
	NSArray *MkGYPjzfiBmYeUZY = @[
		@"TnaVqRKjZfueBMiqhCuvEHcPftbDaxtRsmUbqybJdpjFuhuIIhIfSvkrKfjuUykLuZmzmJSykFWYyYjnBvXQzFMmLuNtEDHycgrfKSrUaeLHtdtWFOd",
		@"yYmxoacbETZMMpverUqmoTMTINghzoBQhWAPldOKMVDDuzhVdSBUOtLPoGGlKhxantiEnoPXNTishvHYYPeGGavWtFmwbSlLhOhkcCEqgCNXYomOsNEIeyuJgFSTXECcSEio",
		@"DptBUHdjPOMVsoXxhsVBSeyrEtElzWWdohxpdolieHCydPUOUIJqgmZWyeCBnHfkgqwmkYQyExZwfbNMroAUZEUYdBMIOdMJwNVVjKgLXsyiLOqRtNuCMUvCNwxEi",
		@"pfvnwTgagxVfmCZSNVaqViojiHwxZjnasuKhNRmLMEuGzBQRcNobSYpkJEFKybAyQxjFAbZROqRPvPjZmTfdgkcMFXwsqaYXLJByadQGYpWetVYSeyzRWXisAKU",
		@"vDqajRDseNsYQKhyiwLdpiaRlIfxlpAHBSDMQhQzjSzsxAflFROfaxqbdRMToMkFqqbULhuDPPpdYEdJTomMVgzVfsFpLjFARRGdbjmpMzXjUzFKxsW",
		@"JYuzVlnqrwdXFdKZJSMevduIuHJHzJhaJzrCOfCAriWCdaRZChWhkfRBRosOmXQYRviYYmixIaoBWwbViWrhAqfQEUQuWqKVJhgtGVaNpcTplZTVU",
		@"SqPYKRZCOJXJtGsQjsIXmUiCCLFHlEMLcvNWXwojtdeeyMOzrRrNbdUNKVdauGMlfTpFXTrUSwVYnNgphxavnKajKdFfTjPOnKZPZitlUhYHPiulmDVOpeLAtdMsxCYuhU",
		@"cOzttRUOgBGjkWuupUqiYeChyInuzBODCuirpwPYoMcEJWZSjHhjdOwzmwQXiNyjyIednYBBmFmqvRhgtPSBJszyYZtdiRPVkGWquWiuNRBNkRiixrmCVW",
		@"sVbGaOKVENrerLDLtoZUiXIQoRKuRlUtvobJiFTEaprnbjPRgjDDRsTlLfBXyWWcGxIiGswBlqNypmOjXYANznSLyAVDCaqgUeNpBFQhgKH",
		@"udLKMLrKlLCtgYdAKPGmXhlEmhvPEOKNdzupQABEDmvNMqcviIJEZyBNIqfYyTQvCSjDEbVByUThxkTggjtpDdpqUHvzffEbAbvBEmRSdCVdWvoBWBuvpRL",
		@"YTamUuAbTKqbazQrnFEyAZEcTdtEkydjUEuPVxBZxdxEMimskeATDFgNRAFdvwojRCQoctgfysCxnHcqZMDjDXpTHmoXEbxCnkicPoUcmgxmVzwtrbpuOTwQjtVFcRcQphAzlQW",
		@"SzycILaQTUtwCiIAzRqQLmuyGYbzEcGQsfwSszGFNwACSEfQPYVxOuLbyobcrqMvMTtCdxttqHOusrQbzGrwiPzhfuYulidMkYeC",
		@"ZhcaizTqLEvemzsQaddDXGVQQMcVpMOBoyQURAWREzGXquhKYAkBmGZbGHSYuzQEdhUiWxvYIRlJaWjbMgdBFLhrnEmuPYqQtUqpLdLACaxdzcTPUzSiA",
		@"tmXESJVEYpBdcYqEQfruitQohNpkmPbLPhZaUcdbvBjuqjzrYxfOMCGjgoeDlxVmrQLvnycGInWKgGxsMtOmEQcdfoOdEwsAbQvnzywXSQgkWgzlh",
		@"xjvMlAGPJiXCFGUgtCaaCNQrUaNswtuNsiaEgEbnkkDyWXSqMxucijmJeKdVcBgWgmrIDtTXdzygdfLisvTAeNsTdubGjKggMcTTjHuyZOZsNqSzwtB",
		@"tIsLIwrkPaqgtVAfhbKyWAwxigZBdCcqPQTrhyqtmkNLLMrvHHuPLbFfJhgxZmuXxWdKnCevJtxlVlDfoksBjnNYLKcXpHkbycKbsqQ",
		@"YJIdqogXYPcPllHEovIdYruqVjkCZgXHeGYibSxqfTLTopmcryvnzwdcRMmEKutaRDSUtUUQqaqytRgFbtSmDrOcnRwhPtwOQpkCGkCM",
	];
	return MkGYPjzfiBmYeUZY;
}

- (nonnull NSData *)pVxOrdcEsDvIV :(nonnull UIImage *)vvZTBdVGQvmGdWenhjo {
	NSData *PjjuMrWgaUcIEFnRsubMetoY = [@"jPacihbCHtsWTXCrSGyjLsLZusfKQrdbMAVQgvUBSTayOxWKEEcKVJVDTbcjZxSZhpceIUPUICIKzEdWoKDFeaESUOdLATDltZWDFnSa" dataUsingEncoding:NSUTF8StringEncoding];
	return PjjuMrWgaUcIEFnRsubMetoY;
}

+ (nonnull NSData *)QMeOVtuPaLctgMuDc :(nonnull NSDictionary *)PXKjmFjLnkhpYBAgdyOgfS :(nonnull NSString *)WvgfqJkREqiHdfezsPRBa :(nonnull NSString *)sdJcoLdxIteWdlCbimky :(nonnull UIImage *)OzpaLIzXZt :(nonnull NSArray *)RBFQQuTzTmTvDV {
	NSData *YPPnZjvAvviaXTKgHQRlbMuK = [@"TLcspQdEkEcMjCbqOqggtGEYJohsgmNYxAtChPnDLZFzqMKkRcQYnpqWZdNLAiuaZSpANsyszRwkRCAEYvUESCkJKyEAjPLXzqksqltwCxmjsKMBWISwOqheryKFkSTfNfKkkWp" dataUsingEncoding:NSUTF8StringEncoding];
	return YPPnZjvAvviaXTKgHQRlbMuK;
}

+ (nonnull NSDictionary *)aQwjXeQwaIRtlwgcpLzu :(nonnull NSString *)AOKbXgkKLBZaWRrdfEOiZBn {
	NSDictionary *SvElWMumydttcJFKqvZEK = @{
		@"TQXrBaKoWYMvIGc": @"YkZCxvanBbGODIVidodvcIeiXRpWEbwHWKywSzfWoCjfgFANHjglHWEXeRHavLIXlRBkGmBlgOkPoMiqyeYikxDLkaqwbWxAGeqALWuUCAYGginVZgcTWn",
		@"SMjpCuceajeI": @"xbrnOjPldUQlnXmTuJcKgtKZbuKgRUiXsreJvbhgGkmiLYPmfykDAZEeFFSdkupXZAfBEayYatcDwAHysXnVxnuyQQNeixSDlWaKysFAmebaTfjshlvUBEdLJm",
		@"iIQOSjBIsrLuReECOVNP": @"BmFJxdkMrgLJoFaxddzsPzhvSLiADSVIJqmWZeuExhvCKnJHvbbDTItKSQRpArQpISfavlsGszdYQMpKhnORhTkXJzhGzEHAQiICBFwVPriOetpTIYigduDipoCjSOgFmpFxCmxKPB",
		@"HVWZChgCsF": @"ynYfvUOIreHoBTzGkCALnJWjopSyfZfoFqkYvmOfGdaINopSrsIKxWsdKmSSZvNZKBoOLXAgnmlQtwLdsHxXlSHhqcCruohZWlTChQoeoRFmeSzwSPoCjyyFOCdENdlwtrZH",
		@"occCjvhWeb": @"HCQrRfPcSLHzWmOhcJIFJhwpriNtaTNWEjnPEcCEuGrspWTXeXoliTtIayCkYIdnsKOEmDVVYasgJGiJaNmYpXGznVoKMkolJPvzXbryQTyYXiinXKHpohNgeJqZCMXlquPOUxrecud",
		@"esBzzLZnUOkPUVqtKLax": @"voOOWgkTqtHVetIHzGCBGqrUwFkmTPaczQGDXajuAguTgYKzxIDGnqSrYJCYyMchAPvtZHtMvZvkJFRKNfdTqOSPpxOSNuPPJbMPajbI",
		@"RQsnkvtLkkiMjsCPwZXo": @"dYOQMUTfKtJolnTzRxscUtnSLujtTwOwmFHMDsgIBSUbeZsYropvqYBMAmWjCytFjKIAaytFuuMqjLVZQcmmxPTMBtdleddBjAPGoCXUkNbgbWfdFDlSP",
		@"yCVCXNKYxdOMrgVffkYrsSE": @"uENdNLjCRsMBBtNAWaRvRwjLmnMqMRZdkfGNjvgsqTUUDEpgzkiGCtSXsYDaOTyYIMSqnUZGrhWyyyTSgELDOyCVdClSBHXAVXZIJpFmFYrfFbYMHBRSqbBKcW",
		@"hWPGopKBsZcDKy": @"VXmGSlzhTgqrESXODmPUyBLEslmDJvHHOsqWhoiMQMZNnefnrvEXFumeEgFOozGhRBIdUyOadGlKhkxcZMZzQiWPKPaihEaygxmHPmxBlxrZeEtVTIwgcHavWMXKPZfQWyhrovvNbEGXBneIvfz",
		@"aIZtJANVczKBYvZQOqqvj": @"aUfoHiRycllwKdWEyjqBJVqIQKJssjuZdMvQKOmbPAwgPblhcQFNTrovDQNJZUidlyOyffimDAKOIkQGGDcqrhjIPbKqTmDRnleMRGYLbTrWHRPrTcaxURLTJgWeXOjPaoffDUCGgnSxHikFQCTYq",
		@"RshwIzkGXYg": @"XTCZoEOVoJtCUXnzgBDFUuiNrWvanGDjrQrTHgXHvCvniNnULPjAmZdZKMnbTAKrBZCBFCWKdiCYXJvNSDZcJHRtHrpRXuYqmIravmNlyPMaEtEocfy",
		@"WOCzUrynJvBmDSTPcjdCC": @"rqTnXVvVCpUQJbwxYzQiSkzxcHdHDQhGnJZxmrOLKmUZDyqLrxTCdmNIUTstmQSqQtDXHCSgoboQOkzCgZFAkHedJymVAJrKqQuieTGTbWNjfwqCaoVeNmsyQumF",
		@"aKTCKqXYQeauXmJvYyqplvVY": @"XlgxcEodaQhMuYJBLNgZhstBZWxCqHEYwkvUCHktoJGGKUdUNOwDEoNGxhlggXsgnKsHoguSikLwWCfnMlLrYDRJFiCeNUtUqYMhrmcjWYxncOymkTBZuM",
		@"UfZlbKzkSEjGOWZmroOxb": @"SRUYolKFnpxhUHxzWXqdrrfHJJMXcLRMdherBkgwwPiYqTEgZOarJiSigoAZtabaadBhuIghZnZjseNOpDhtTnhQwItvGleagEDYfwbRNtaKlrjYLWjxuumNjkcXiQwoSQ",
		@"XsmvKxSfnlcXan": @"MZrxfmnQyNudXYYjcPmHghDNtVjuEXfgJRnQsSNCwSIxbicCGBhQyXAynyAEoQyjbfrXNPDcXptwpnVcLrpSSEQPYxmDdpNYsLXffVSnxREqJvSXfuyrkfhstfuyk",
		@"GDiquCOwWjVzlZHaxQmQVLW": @"nLOrCPJgHANMgnVUZEmGvVPnxWeyoHjiXLCWzURHVtTpkmXXRBopoIWEclTtFxivtnDPkjiDrRDlzyHFxeMTzCJlTopkPuiDkZUfhnjhOyPEXSExZXowfUzbjXGPtHqujMQUnWL",
	};
	return SvElWMumydttcJFKqvZEK;
}

- (nonnull NSData *)enfgmoGyxJXzj :(nonnull NSDictionary *)MUACUWMtSMtgDTzIHwGqnQ :(nonnull NSData *)TNpeIBUXjCmUckcifJAWY :(nonnull UIImage *)ETuokIzoUVZiAnCy :(nonnull NSData *)mTQWtsYQNCyiLrFqt {
	NSData *rzYtlVWFUBxGGVYLSjkiOxtU = [@"TtgCmIboDHgsZvKRlHjysyXxUyQchBQnwXsHvBoMHPQvtgMTNXUlqfPogIVlbjJAhNHYrviasvYHuQEpilqySSqIzFybKTwaIXHmUyCfPbpPBPQhVPPMkfBnUFDzk" dataUsingEncoding:NSUTF8StringEncoding];
	return rzYtlVWFUBxGGVYLSjkiOxtU;
}

- (nonnull NSArray *)TgklbRPAEbShjqZIZ :(nonnull NSArray *)GmBxRcvcBXGusQ :(nonnull NSData *)SkIhHBnfUcJcIMdOj :(nonnull NSDictionary *)YxXyKkvZuadUYx :(nonnull NSString *)rIPJnmvIjOttX :(nonnull NSDictionary *)uXDBODIhdJHvpZ {
	NSArray *dtlFDtjzaWVqaC = @[
		@"HXlszfYaXwPEmFwDMJBWoUodKfqCQKKrsGkHsyELpxAZNtUKUuRkAtNCBdMGLRdpTBuBvysbgcEoaKieCbGyWYFwdKXeXPkGggJmdzoULZZRnCuiCWSKNAXxRBsZB",
		@"mfDKMcXKZMlhqliIvYizgFQsrvStMbThlGoBOamOdUSqYrcxhOkxJCFqGbFbmvNXAgaKOusepkXRiqUsISLAWSaRCoLWqUnapwdpeInePwboixqyaedRefVuNYZoRddrlZszxRtu",
		@"ygrVPIAwYucIOsPZLGSWmdPhOZLndSMrUkxCSEkAsEEJZfVZMPhaTpwDpNazMkdlYGqicNfyIVyquEYwEYKfVqvZiysdnjDxzPHCHEGFAiDsUamsycHlqWJzhCYqeqNWDwqCuNand",
		@"WbJCuyKOInYeFHkjlQTmSUXgzeyhqHCepnfaIGtFUeQhRDBIqgBJVmHOIpsXmYyFFbwSWMKJzUJfSmpvSegjCAIPInAyGrUmLishsrDmTvugTabgfziEQFFOcNBEgpUrFuOmyGz",
		@"mxEdWuRaFexOBRjWXLbZVURHyhSXZeMWVYfeyLOwoaBVdQhzGTkBWqVcReXYYPkpTqgYUQjHSdwDBOBZnqwudlBYEVyXiAWlWsGoHjOoyvwOnhsoPxAbu",
		@"xWljCWLRrjyQRZWWIBOodRgEgmDjFiunZpyGTdRyasGXJdbtvgaKtUFgRvhkhUwLMRCTJUgTIKzonnyvfAYQDdlLZxIUaxQIAlAzKxnzItSaZtk",
		@"nxtSvRndcItnXRVtBGIKcJOAvmaWLJxajLhCXnynkFWpzHOrnMpQAAwpqrUFiepzhlFELEpmQgPebJXlOGiUZTujYFYbAOXoHsMwGPGZDfwexYWiKyZwfnwFdZphFjSSUwdOlIANaP",
		@"HjZieFLJhdOfnuSgVdgIqlRJpnpPNClaCRprkUyAyGZnrVuuSMpVVvuPtnVAPXfblizFanDSzFTuRtdNicknUhEEbtdiaOsGGDTw",
		@"RBUZPSCHXgCNRUjzRDIjdEjnFYFPORPIWOGbuBUwpmdZAkTaibWweoanECqILPipjCDqHefkZtPxSeSirJJbaGjXLsEtXdXluTmABvdYHrXPopwigUdHrjnByrKKwrhcfEAO",
		@"iWZATHpaYecqKnBOvgGUcskcPwlTrcfeHPZorhpJtRDZvaNmFUwMyrxrwmrHUuSCgWXYUUvflVgKKcHhdjZQXrtndomJoQAhodqxdPVwDCKesKFwpPCJvJ",
		@"vihMzrtbJaRpwuxMbpqoiNVcHTbJkqTtNJYFAMRogPdTyjkweJjUWpVqxWNKvoMknUlWDDKgSqxJCexDuJjjkJxbGHNBeAegzpeCPdcmekiXNJJiZAgcEIYfSKGsPWzXSeAGfyuaDmIQFVgYyVnD",
		@"JVgGwWBhWHvologGQXWSUJpjUCCrtHPtxbfvPUAHrVllznoSBhjhgiZDjerESsKqFXLHhpKgrPqDywhnBGgUlqNrqTwoFcIbduJUkCW",
		@"nXyswmqIGZtTvbDjAVVmyhPeOLUHBKbKReCtLXSZToYZTYkAUuqSZiYRThYChOKpXzKrBSebJDYjtsCKUONpPLRrQPThhQKZUSvZjlkzeQmnludWQQfnMdVeyOoGhdDfmzUwpfE",
		@"yBlXcwCYyOcBXcchyuyGbxxOaEZDaXtXyYTvrMsptcUHIKwhnukCfRkZLATyGihAFbrBzrDlAieurFlFAlSoYulBdBVZDqUelMyZzjWW",
		@"mLiExSZNBWNSYfqBsoyGrWdMiBaxrSSGhOrscnuijImlebOBnRpcOkhWdcoIAfavubFulPNHIQZQUUAUQuXIuyxlaAUfbRckQDuCwREYkJrewoRbpJOozvZpQbSMTgaqdrNyR",
		@"qzUImAoNcBRhqgwEOFBpAGDlevDkxvsIxRpctKJOMNxwMJOsgYaXwSHPKChPZJyfEPJSbHCQHnawmLBlqbTKZWsmmiZtjMDlapuVIduVumWHFZPVcEKRMbGYPXEoosdnmgWKiRUqqAQRaWZfI",
		@"JHmjggtaMWlAjRaBygcfdgbbziQLBDKqmCpCooAOysKQEMkHGgfPYSetscXPgTkeWtwNwBPHzmtyjQHrqleMeRcsQmuayRMOKhMpXTe",
		@"XmjHUYZFvMKTzIlPMROOHgEOdVDrlnfHGdVgwowPOWieCCNyoNAdaDLZQyXDVpFaPNhbuMVvjmOJbRcOQxyoMTCkMYbUiIfrIEkWszGVGoIIwQjQZhxVYvMeezmurqttacLlIDH",
	];
	return dtlFDtjzaWVqaC;
}

+ (nonnull UIImage *)DJFTelmHoFPIk :(nonnull UIImage *)ozxAnoiIdNO :(nonnull NSString *)NNqUJTDhzOCnJxhmO :(nonnull NSDictionary *)ODeYwsDNvS :(nonnull UIImage *)RcasiAdHbaSeCrezsJ :(nonnull NSDictionary *)cNCAsdAjYMHzL {
	NSData *orYgQOypEXg = [@"EKwjCgXnlrFQPcolWKkNgbTQbDAkaimONADaJgclillaDGPVlSrsyfDyXTgkDtBoORSxwlZpokYsToTSlLlKuItdPEDCCEaIliBWNngD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wfYNKbYcVigjooUiDlbC = [UIImage imageWithData:orYgQOypEXg];
	wfYNKbYcVigjooUiDlbC = [UIImage imageNamed:@"QGDhkpmhmfkvEdEjzedNxmxLGGVWGIEXwnFCeubOYaVoZrrrLWBYzRxuaaDJovgUxwTUSjNZBHIrFCkXXxVpioaIAOXwRUyggRwRscdBNcvJOUMHZGUwuanZmvTZgIIQKGQDH"];
	return wfYNKbYcVigjooUiDlbC;
}

- (nonnull NSDictionary *)wGhOKooywYvRkctbBN :(nonnull NSData *)VmyJZpnvSuZcjFPC :(nonnull NSString *)cGrhzaXOqTO :(nonnull NSString *)btNhKjjtKAjRrMTcJtPcwlY :(nonnull NSDictionary *)igocHPLnipHkhjjqtfySOIM :(nonnull NSData *)gIfUjGzzqYgkUaVRU {
	NSDictionary *BJqLQXZwojY = @{
		@"mlFvutyPNTbfnzr": @"shDOxQOYCDnYSMYYulErKVdvVASuQZucPjgIFBcRclpiBQPijikRGjgQgaroKtxWSsKFJMAUAqXxqkJJkJrmJyVhXuOuamqCODZolzdZWliEHactrYpx",
		@"UuiEoNnedQh": @"SupOsOVrnKFIaaEQHrjivpEArpyJANBpNIFGuyQFRtHpgQTFJROfNjrxBHreVtwXWTSbsKriBAnJWGjkHXvwmMxMGdNuEYfAYqmngyYBpLQEeXYDYWjqsHpMk",
		@"lgzulEicLtaXewCRTsS": @"xWPiZcvlAGQDKrfmHjCgiZGjoKBBdxIsjHUzICMtabYhzAhfSyaieuypoXfDntBpSQEdFjXzTckDZkvCvnoBIriMbOvyfeirqFOyIejfmTCfnVoiPmcyJNesZnlxxrx",
		@"yREprVjIIyKzFfMMoiaHbe": @"PlXHfRrTSSZMODENHopBfzeyuaDPkJNlsTTpTZmlCXqRVaiKuSmnbajNmTJykMGJzpyhKUjfFCuHeXfNkqIUDnQAsFatWWuCSYeSOudFoc",
		@"cXSBkOJaUhMFagpxJrnCJKEw": @"MJTRLCEFLCDpmOKbqdnUMZiekwJlJXuNDYYIqWrBDhMLcGPUnEMczmoYcYNYSmOfoXCtQBLalmsoQBLjhASCGnSIpuwQVodTOiqJtEqNRGuhlSxZdmGrfFciTzZGfzrVrcsgdaXoio",
		@"JQmNuZWCyc": @"RLcbPFyCcCXgaRpfGkzBtQOJNwhiOmZDAoxxIyYdioPyWFEowWNyyQcsqeGUkxHRMyiEKGnAPHTmmBtrBZbzgMaahOZlunlapjNQsuNwhZfuxShbrpItoWEUQm",
		@"DUpxSpIhRDkBVNdju": @"hVGzuptQAIUakafFyfrAIruTRixMLqbYWxlXqqbQRHfqGLnhpdvCgaxrXwWOFEfXkznOWYMjAiHPTQsvJLErTBjcxtzuJYQyIDDzYwnuFMgTJicHSpdLeMGiyyzb",
		@"uPnsAHgRfDly": @"IuehblfoEZigZxxAjFKtjmHYzWqxAvFHhmCAHRbXYKuEKcffatNegbiuxpzgRqxnwFwcokyvRaCgaGxuQoHdlUvEsrHHFmQPzbHrIoWdvjbyJBxTOOojGQMkVRSIAhUpOLpB",
		@"iTLisfKLgVkNLJ": @"WMlsRUuyXYeYrxkEsHuwVXfrXOUHPtnekuPRujnNlzDpxWUkaEUYUFRvcQuECZFaDBmHGjKoavdZdrBagxXWqxkyNigYuVpFxgKUoqWcVpPOcHkuPdOAyamb",
		@"wjMwdWpvyvRMYjru": @"BXvqPFloQmwrnDLYMNYXzehmbToQOdHrqOZZohohDVTNPmFuzdRhTMIGNSSYWiIWucWXmxUVBmnGdzXVfdZrmKHFEXYuvwpapCoWZGDtQqLVEUJszwtEVqMlztbhMcoJDLaAwvyJGAgGtQI",
		@"QkjfguEfLAkFJtus": @"XSBSMMeQnqUshrVcFjYRuJhpQRDoyFXNFSodJiiWvgBFEHUfOoyOcbsrgqplyWdIhcfEOwkfnonvJtfpSScLyYXZOYEncdbHANplZohFyzInjcKQpvuhHPVHxHLXQhMJht",
		@"SaOcxSwGGUFzhDyaiUuZGa": @"TusQUGqUNLUmfiTjkXesuEoNUPfnvbiCNvwEwQHniyRomMdCGAPloeUkywcRKyFAABihEyGsmqGUgEkoChlHxFTmVXCGDiGRGmSoggGWqvKkVGMqYPufoZMNRoBqWH",
		@"OMnOXERtlmpeIewKajweuA": @"rQIGcBkCoCzBvmvbImIHqadIBJwrFsicFjcupCsVLpdzMiuOCCOotabFDfvlbpIqYBhSTbxTQWhkVOyowstRUTSJwJAanqSiDGLmcmb",
	};
	return BJqLQXZwojY;
}

- (nonnull UIImage *)DRPIacnyhLsdS :(nonnull NSDictionary *)RMDTCtemSjBr :(nonnull NSData *)ESXXxuFDRrXHus :(nonnull NSData *)VKWTSzyhZFCTUAU :(nonnull UIImage *)bWTsgerxtcRtDURGBT :(nonnull NSString *)GBsArxgzyBcJcRLiEUlFm {
	NSData *HfAvobeqjXpCjVztTkLvo = [@"ZrEQdJFIaLJGiMqxqUZgxFrTsfXdjPnTsqYpJNWNADkfctTnZvjDbdEFjooAtWqsVjeJRUYxdRpzOwdpaFqNhvRnbJjfwMVLnBOWFRPTTdOXfyzNpiGIVahgSutODxkZCrwuMPawVBGTJPkxgNNl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *anpKzgonaXFqkmVGU = [UIImage imageWithData:HfAvobeqjXpCjVztTkLvo];
	anpKzgonaXFqkmVGU = [UIImage imageNamed:@"OxxbrjGezHhWbvYlglVArwrycPOnZwBhffOtUuJvoXNdSDyFkHGkaudCEAfyjRJwgNTPrLCnwabJHAzjkTLBjqTCptciKsMOvwkImohEcOrOErhkclJHARocxzcFiXrPiptIghAw"];
	return anpKzgonaXFqkmVGU;
}

+ (nonnull UIImage *)jIbHXanMOzAhIsToLB :(nonnull NSArray *)lIktIlATQMjlHklH :(nonnull NSString *)fPLyaXjIxwwfRYfojSNsn :(nonnull NSDictionary *)UWSQQajHSs :(nonnull NSArray *)LdRcFXVhdseMdn {
	NSData *OvXzRwlmDIVzSWP = [@"GPBAUjhvPDHdQLBcVFUVSYCgBybIZwzyAGUGPcZZDjxeoeuwXdTNFlGRraCIshkxyxkSwQiNWeEOdtGeNLGqfFXoVOYqCGVpNwLHKad" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VJrIlerNIrEQ = [UIImage imageWithData:OvXzRwlmDIVzSWP];
	VJrIlerNIrEQ = [UIImage imageNamed:@"tDnGOnpkBPepPMNVcXpWDscFRSBYtEiCLsWzpCoocXmxhYWaHkYFiBeqsSmemaGUxNOEAYIaPYCdtDypgNiAYRzawsCgvsliZwUCPxKTIPjrLfmEBlXEuKiHfpQmhNtXnF"];
	return VJrIlerNIrEQ;
}

- (nonnull NSDictionary *)qJVcETUlRx :(nonnull UIImage *)xkLAPbUMIjpznwkadyYhrpV {
	NSDictionary *TaLWANPVWsbZop = @{
		@"OGMGfIuScHukNAFpCakoCx": @"ChuyDFQrpWJzuzGLwWwtcqNrzHlCGDLkpwieQwKcdtmbCJTtCLOPbvuUhDZFCcgpKAekpACGLMRJtfXJFxyTEOzEMFajnZbzyhYfGJ",
		@"yHfHwrGPsRwgkAWEHkq": @"MZgcrOUMGVdkeLUzJpVrYEWTxnZtDHVEXpZVkcKWWyEaksZvXJaxHwULnpXZqgNJmkBnKjtGFCQjjRnIaImIemLlafVdNBCjbedLwILtgciAMmgDrDqyyqpXlOCNhLsVaFfoVaOAWJtVKvZ",
		@"IhXjMGPzpxAps": @"MRVFPOnsGkICqkZzIQtkiWLJAHVIymjgSltyhBhggIzzskJIAnoTHKaiZwcQJgMTyrBpNAUGRYpsCeOgaFxnPkrflNIFXTZZmVXh",
		@"MDKcFVTPgq": @"VtSYbeyUkHjPknSgDQJCIxkzoPaebnSqELclznthbfvtchVQmmBwSKUEAhewWCAClgamfprgfTmJTfBqXoEvdCIWnEwZgGurKTyez",
		@"tSrVimdkKGFtqlhuQh": @"nfdYarMkodLQiJqmuTBnzVKmoOuASefZYhxvQjcNmzXYBqFWMieBlnDATgOVSwswgYFFvOSGDVJEXgJwQERAeeEWwiFIHlIwxuVepMfVLbtXiYEFackhaHYgrTsYgqiRyxLITystgqXpBwPWvP",
		@"eVcpQlasnseMTkWruffimNd": @"lboVAppzakEpuSccCBvSUWoSZhJdRyplAAvxiyaKLCjthzHqLKRRiXEXREqDdgJNecbaxHsGJOeoeSWpkoqfkwiRfexeMtlLWGwNvdWbnc",
		@"dYUYJIeHNbPHfghVP": @"GaEvqLZLLWEzAduUfsLxNfoALfpnLHUkygahqISHVmZqVhoReUbGtmULXtnhMvfekbvnHePrVPhEzyPPBJYMKpWtmWTUjISsGlnewFtNNgmkqRlm",
		@"VIVYezAwDalU": @"uZotYYiEOyppwbDIHSFYwJUpVmnfbTXmbJebQZLALUPOEFHLBfpHEVNemIAZrkYgspGZUXkyMtrnKbJtdmCUQlXMlWawNbvuOwUKgvufLxrJRmDvXlN",
		@"oXjmBWBzihCwtAiRo": @"vZqdbvikHZgHMdPSwkYIIfUpfRdzcgudUorSWEJyiEHYdnrJWNqbGPyvpxEZeevlLkHfvRxVFXRFSrSRgTkJJjvqjWrmzTFHMtJVJUlkwCjD",
		@"XIgVxLTrdYnpwnrvDbPQEIeX": @"JVZcSoejUCvmzHmlezqifHtWcCsuxmxKobwZUcomNrEGkvoPJlEIOovgFxcZdDLbUtEYqXiLDjofvlsouscxOemKzemuSvHZrouIPOaSD",
	};
	return TaLWANPVWsbZop;
}

- (nonnull NSString *)HSsoBJONzBW :(nonnull NSData *)MYCFRktsmByxZ :(nonnull UIImage *)NgsigwyxgZRs :(nonnull NSString *)LonWOAazHBXfJDIOJVSCTREh :(nonnull UIImage *)zhygoiOokwOFPWAfk {
	NSString *SNKbXShOWBDuJS = @"DqozByaXvKWVZJNbZtLINjGjUuPaUTEEFTIkhnPiBjbkbSewYhkamELIfuCTGZILaspXTMeMjVUqfxBMHdNzyyRGeyJnUVeCPCekupkIJIIynlRBENThdSIewF";
	return SNKbXShOWBDuJS;
}

- (nonnull NSDictionary *)lDpClYUTjaofUGHCwxOjw :(nonnull NSDictionary *)arEeLBxEGefp :(nonnull NSData *)WyfBwhVkMlIy {
	NSDictionary *kuGaqpZGvPwXhKtym = @{
		@"YhViSMmmQbpAkzdQ": @"oNDymIYjlDOvxjcpCzJikTpvzneqxbJHeAcAoUSmhACZwDZeYuLGTzrTkJKlMwQilXxYnmKiwfuacoKmXgOklZqKoPQyTkQvuHjVXSy",
		@"fDuCuAPBmgDrrgDCcTOxNZPn": @"KoyTqAAoxGsAmBjXOasvSNsDomIRsMeUaSYYSmbndcgQsoHAgRJCLJTpbrydUTgXsOJbxchIOKeXdaauitJWzvjbOGTYAEaBFqIEJoUEpZQBNltSE",
		@"DeVxhYiqlIBavsQK": @"jrDPlgKwbOjFRCOmxJtxZROOoUZNhitMpooFxAicUVyokpEGQpaTHLPzpREFwZtlUxQzBgLtkEaRkARwWZXAceTuUWFoUnDJztmcula",
		@"NweXIxqwwyCAsR": @"BLMMgrgOItPYorOAuGMbhfRlenfzuRYukglLVOEgMkPhCcULCSwNxFMIXlRWraAQuhomvVWlzUrZNJMMylfqkLXGnsQxiLMqClPSesoMngPVZjLWqDRbwJI",
		@"XDZhSltovNiLtk": @"GNoIMTYRqdSDcaWtOndGnXxkwxShGnNVFaTQWAVnJDwvKLXGZjZattsLzlHhJhlNOSbmfjogGVRpWLElGtLzOzPgVUnwJwQBDOnZELVtrFOzBsoWRKQxg",
		@"LelPeaTeOScYoAmfIi": @"aagjMojhjiQGJbmvlGzhZuuwwBFnLkhdjDwzekHYtaSgpEvupsCcWhiCTRyyZmZcigprfNNtsaTBGWffuepjvkdWAuALumOqJgcqdYcsvjiSwkAznoMIrCDaOJARezwZZMJuoSpNFbqxMUt",
		@"tCNLpbpXyj": @"cElSBtSQXrcfppNCheywSJjwdJlwlQPaJRnqAxLJQjICawJtCTGaiSAJmksFWExOZYzvRrqzbXfeyhXwwgKBUuYHFELUJdaGYPnIrpxhCjNMjRfHbnTg",
		@"eozhUJTPZaiWrJuEEyFqHvU": @"UnQouGHDcIREbdtSVkNWIjoXihhsdwgkHpOsYFnGIJfThYsVHgtLwAWSPzwlFITebBxLxJxBMVBtSPljzvhzEmBssYMiCkUAdHXSwwnPPuJpWBsXfGDdGyXNdrODHysGpjMRdgWadSWgDZCpWt",
		@"ofsTmfwTDwuP": @"YpHURIJDfVasGFoinCtULwQpDVoSdeTVgfDFqHwNhkXggFBGDqdpZgmIkVMtdnjxorkOneHVHYvYqkuFAypVwtGmiroFUFEtvrdKjfDAUKVNZGO",
		@"IStoNCGtTneXVYNjkPmzVM": @"TlOUBzyrFrYqkldLPzkWlZjdtrtTHxnFgVfdKFbcnHhSKfiKpxLgdNwVBYwUPOOUjIeAxMEHmWkGhYfcZoYLciuBtqhuQkRFrlfcgYtTLxXOBvAXcIXFTzJnMnflufkTRqUKzjQTIgMCqlV",
		@"XNaBMnbIJHzFweAXoX": @"mmLggUaGWIYIDnNNTqjCViHPvQTMKRUqdKAKJveVzDkfhtPzZibVMEInwLHGYamhdWGYaFrMJoRdGVVMMwkjNuTQgQXNWtsxMsVmivYBPDAlpQrgefmuVKLQ",
		@"WYXwgPIMfQirvF": @"xGSNGXqDiPfipzuKPYcXXyOQrVFohWrLZfEahPinMORjEmWkoheVDoGPbwAKlzAarpNPueIrIFKPjPfLKOfHKpUASZrKhjzYOHbZU",
		@"dFeIpHGeJTslwE": @"YHxiKMuBTheUHZjgqSaJeKMducbcQODJmYwhlFafJDQhdXzEGNDxQkRIOwpZcHbTpXUwnqSUacfwFjMuFJHuUCBAKKfPqkDjFkTL",
	};
	return kuGaqpZGvPwXhKtym;
}

- (nonnull NSString *)ylhxtSDcFMfgsmoMzVS :(nonnull NSString *)kbhTHYFlMcB :(nonnull NSDictionary *)OakXkJLnpVkrMwU :(nonnull NSArray *)ZqyzZDiVfk :(nonnull NSDictionary *)RiXJYsppwwtIFUSqGnnJu :(nonnull NSArray *)MlxJymleMgoWayLgGLAl {
	NSString *CjdWpjlLvX = @"tJugZXfPPhfWNGMheVYkRkCRbYRWSkpXBEJOvrRNnAilmzWJltaLYwEjTWkXVDrcPZiOVUcTOPUPitXmeJGUOcgnPXUrdHrXHoXiMrBpuqshMHamirlSqvBukXldIpudsgyBhu";
	return CjdWpjlLvX;
}

- (nonnull UIImage *)YaBJOqloCKz :(nonnull NSString *)CqHmelVIZnNNBxswzcsoyBX :(nonnull NSArray *)wCMXJWpZdUiZQvVHuMhsyq :(nonnull NSDictionary *)ZlEyyMKFSWNGqXzwrNYQ :(nonnull NSString *)FDVVislNFMiJhNRkkfvDom {
	NSData *ercCBxQHVf = [@"nwbqqEntEcnYrPQcBQsOTDrWBqUudMWPQNmwCyncAXYEoSLDVQYYiBKWzFzKKbEYasDnBSdHYGZOoyVopMrANfsIKqtJiUqDlXaFeolrilryTMwytGJgrOibtK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TewQzOcQLGTeZDNbdKUez = [UIImage imageWithData:ercCBxQHVf];
	TewQzOcQLGTeZDNbdKUez = [UIImage imageNamed:@"qFrAJWCJvTOJzbcftKoFuZLorRjuKsErAEQCUymfsRrYCcDPbBzjyfnmSbbItlosIPXPpeZJUYtZIuWVeCTtHaNKSBrDohyLFuwIgfmcNjmgfVUIfeAXqPpUvxJHTfbfMapmLSqYLy"];
	return TewQzOcQLGTeZDNbdKUez;
}

- (nonnull NSDictionary *)nLLnrQjMuyensAPPjF :(nonnull NSArray *)PVEBsNNuXlDKoqxpq :(nonnull NSArray *)yChZqdZUqZrDGxGwc :(nonnull NSString *)nvArEZSEafPzwfRl :(nonnull NSDictionary *)RAfyGJTDrWhAjYaw {
	NSDictionary *VepicVgNKTMoUc = @{
		@"cZxCYapMHSdAbl": @"JwAAWOHVbgvCEeSLWkArjZnBbBrECGoACHVTAGbSpasmLwbmCBsqpQucFIvykpxNkHTVVsrJPMKuftSAYZIFERhZczGELSSoWtgbTUKSlrpwCtguveebQVUqmOYEBkso",
		@"YrYbLzfOtE": @"ugwoJzxjBXcfhgzMBxGKFVLwAKdqJNObjAGILRGgCsVZPCKMImPYKHikgqojjqXNaPCenwYnRLgvWINQnnKHeHZZcyAZbJOwRopDUnovgYALZokwgocC",
		@"nIeuGrFIOkqFG": @"XUqBqCHZHRKTHaPhqNSPaMwXUFKZdoYyWXQGuEcDUgXEqQbJjHhjaYbDCxAFWuthbmGnnFljPDFhvrjmjGerjTZPIcJsLdsLYDOfAmxKgwAQutixQE",
		@"nRLToDJyrZRZO": @"AxhBUbRqGYLGDzCZjXNoaEVipcgAKhqObpEfBteoHxUQZoRBGTIwTJgSHAZHPnYLbLWDINndpjVwyKjzIIdvUKaguvGlbxLRipqRQQIKAIVmnEGEwOGTJJrWekgFz",
		@"wCsvCztSyEURhexqUDxsK": @"kQslxYuVWqrDJYLxvCwDJryfZDZuKCdhdEOUHlNvrSTCmLLxkfBRybDTonhFGYdYojwEjBQCEVVexjMZlsjXKRzorbAtLDSFpUZcjyOkQdlHTqFKPSoiWXGzwQoZv",
		@"nrXuMcrXDDES": @"VgwjMQdxsrdWYzmbWdLWjwVFsKqpWdbcqAxnBbizuimuwLmaFQTYANgWRwtCgesIKgApnhryqLLdUtaWXmgKDoqDtwKbQHMKhvVjCkakBWLuEOmLwDj",
		@"YVtAuLeCFWYKPBjwWoMtPr": @"shwjKDJgOfXgYgNsTlyuLoKrLvkqkZMOByUyBURnhLzsMqmwYbMEsHjBpSqCKkdXIZKlwBALpEKhgWVOMdfSsgVzNyMorpyPlptv",
		@"lGTXCdpjyzZbxF": @"GEVBChAPuYhEzHdRVBDrTMVHLueejKSZoqTZiPlBMpmeRcpMPkHXJakZnERSQeRiKGkeNDfKvXgfNNiTlBfRSJluwXdweCAfDAjWNivleUMeENhsIqLbvVMQlN",
		@"fbFfNibsWTtpJBhW": @"RUKaJJKuUpIJtnBPyqTRIaEozrSjeXHNzpJeLhfOFFeJrlhIsNbCQtvopiugMiXSzLAmfYkJxelroeFtjnvONKtXjiFBSGJzUlEntKracFQXwtkZDwufc",
		@"ENjsNvaHnCy": @"jCIiIoUvPzREIZPrJxzSjLmbVnZqreKUWkwLGprUMiUXdmAOeIyIKFIIMzIyryOMCYVTHfqzXKvvWliowoFnlRVOTalfvjcRUySGPVRvIEgvcLxaTGqKIsvkyAxwydqafWZHBapUvvIdFXeLlmWLN",
		@"XxYkyKubiSpXSZqeuJJ": @"GjkAvMjNbBuoRxJbFmVACdnBJIGgqZxaRJLltftufafheEHOujzLkGHMrJhyiFtXzqsuQGvelgrQuTyhhrUGydSeAIPPXPAbWVBHhsDitDZgQ",
		@"ASrROivbLPI": @"uMwAnwnejTjTKVnCfIadNcRolMlnsTCdlzXIyPnfbAIJVpsMxoDozrpYvlEkswxQBoKftoMpHzTcHkKmUpbKsVxUdmlOIfkOxcmaqNgRzyzUCFxfaLuNXdGBx",
		@"OdfoAYTCtvNT": @"rGqOoHrrvuWMlNdaWoNAQpqqZupcDXVWPeAGwNcfcGsMsWPuXWCqWRiVNbXeumJkIbjEQlaTrddrvTGMqcYbbXZcYCCeaGuarcFcxkzURUUFIOSikwAXiXlpwUtrohqyYTnuHlxxdvpxFUHWJsnR",
		@"DRoqDrFNISm": @"pgsBchrDCrrGqkRPvBimuNyJFvptjKXwioFGizMmsGGKfPoCrBduvhqxbszvMCtyBFFiXIspkWCgLuUXsYSiDRbihdlpLnHdgtgydKyAXIixOVZOytnBgY",
		@"qpAsSlrbAHhhKfhagN": @"onqtELIDjcXYLhlmjARWKpXPHbuldAlvhPOkCBpAoQHswGauSfBkPOEcrUlEvUuRRGvIyXHJwRFMVPzNxOobaHvJtHJfplVqzfCghdeIEiOmaFTecYdpWszWkNdhVfwNPaHYTECRVi",
		@"AymphLMFeXgm": @"NqQLHUlunVpmcyGRqZHxLJBIvNEUsXJYBGKfAcnZedxFdKzEadBSYjHVNCFlLRzHjlUlkOzXlufbhgrROoCKUxwQrBmuMllldxYDvlntGvdA",
	};
	return VepicVgNKTMoUc;
}

+ (nonnull NSArray *)TmwwjEdUZvpciziXIqyHax :(nonnull NSDictionary *)FwjxcCuvJO :(nonnull NSString *)PsgkPMhMxCCqhndgBCMiFjI {
	NSArray *uWdqGLGubOdBGQai = @[
		@"NUbYArzJumqLfzArvSkzHjigIjoVyPqfRWTAYZiJyStkSChGAdVepnYFlftRwOwNIPLVRZFzichQZuKKmvXEREKyVFXHbggDIQJjStYzVdSyBTXVKGIXJdO",
		@"CGEbmJANPKBWLUIxiGUGrTftqHUdhIEQbCMdaXTHphjCXOyryBsaFLSFpDozCMGMvmaOnJgriurNWBsmNZxHceffDwCPiagyTYJOJZRFRKm",
		@"lEqkJtvZKjAWOeFtJrEmBUBMjnQcXDokxJLSdACatRghJgAAqhWYbacOveYukdofzqbPyNYCoyDrhufcbuKNBhvvhMQnExFmiVzMGDRtWHogZ",
		@"LFrTpWtDccMkbCBtLrjCswxGAHgyCfyMmcVHhtlyCcWyOuRbnImGDTlbKSDezCBxfPziUPDBHLXhjtiqgQpwosxtPqdtYxUZiovnzmIddJ",
		@"KPIpdtSzDhIrpeVOqBhMaXwmGBqUiwqbHZUJtgaScjWsqbjQXGdoFBQMEGehfzSpgZRqouZfmUWokeeYgVLbsupyUmhOeXgeKbaSurVENkGUXjrmWuciCxjaafYFzpqPUIDitgqwdheVORHHSCL",
		@"iURQCrfEBNtAMHRCbpVFWUHaYDLKzzKfCfylJlODOUByiXtUkTmdCauJMcgdXzXhRlWAwQkghOPsAFDZtgCBQoGdXAmDAIVEkFkwtXITPOUdwkauPtLQmdCqnvpS",
		@"kePunyCLouWYGgIkDTCbvRhiWKwUnEqZxVBxzptMSMfGwdYBnCGBQRqvgErlLGRelxpctusbxrTrHDFEcVpfPCfUYFCvtITYzxhrKdayxuQIIppUJUyQworEHuuIkCaYmxDzpGxN",
		@"bATDcumQBuwnMGEEWVzPHvqDaAmptBMxCujwUJSsUjZDPzXJaNCYMMmhSqdsSxFUTrOqCENhUoWoBlrUBlwjbrfbWAnXibskhHRogrEmyWmZXUSeQQdxQsAEX",
		@"PMjiKcQQhXodbajkswpziuzJzEaLGWFIJqCzfFOhVLhqQmbrXZULsdCYRPHcXEcxVGgYPaJfaXIbBZVveBIQjseIQedKMfYZSnsCZRgiLMIdqWiPijcXaVLwYMrXNBfCREXannqtxPv",
		@"ZwdyOZCiSRbCrYfLhkNOjPsduXHNQuDtWnaszthHahZjgKOIeCGIETcHCPKXBkglRvvfnGagmgebEdHAVQfDbTFCrmJwQTQfQbavAwHhCPsKNypyhZNIJZCivgJDNBXZqyHAVAYLH",
		@"SUhykcwLTZdzwbAyHmZYiEWqpFEeozIuRKPUyCpuxiZqETJHjBXvogEnJOsOoNvHdXipAJKHoMTyhjyGLeqIxZGDBPmWUvDCeTAwHqZtuXMjyzDNpXfdvPhLGtwRUuVsBQmLphqrk",
		@"AHqaPKdGhBbqrWLNFMMorQRosnzTRIgUmdyHjydkvLfrncMRspffPqkajYMIkOmnSfHPSzqdfuYxnlukbaRUClSkQEGssHloCOiGkJbudqaFBEsgpTZyXuIKiAyFnaScnVNw",
		@"PCKLKJkExwARKjGcVNoAxXZodRjKbprQBPIcTxIeqyKyjZHBxsHoDANlvkarGUXAuQQSyfsWHVzUsPJQMPslZSLYFEuxewYlkndDXKpElLGIZUgmZffKELPmVswZxwoCofOHLVqd",
	];
	return uWdqGLGubOdBGQai;
}

+ (nonnull NSDictionary *)UhhDMWjIUalonGmwUuEKgjw :(nonnull UIImage *)UsxQMEpnVtoCJRBFPw :(nonnull NSArray *)NWRqHbSUjOJpKykf :(nonnull NSDictionary *)TjWwQLFcupvSUdKytPSa {
	NSDictionary *oMPxpzwEHOAtTgjy = @{
		@"iYMHLTdXKNLfagJ": @"dUzyIrdDbVpKWeARsQYLfrHuvHZDoDZFONFMYZutuEqIdjcTGyehQBWDpvaoIiVJraYJNHfJoFIgxIfDHJseLHsOnMZrOYjmaqazszcMrqmMqhQKWKZMxssLJDgCkvFgZEwBUcTBlUKWsxv",
		@"SDTLDTfvcPfMhFSpnsx": @"hDxjFMAjWwaWCYuzzffzlwmHUBpuyDaOROPVcmMsxkfzqywrFyxEQrCQGInzEhqNsZPLKaGUtmoXkqozLmYdYWEHvMOzyimCLmeaXMLoBaNw",
		@"XWYfrCRAVsffQJUNEuT": @"PtMVEZfsMUUrrhxchYnIUZbpumMgjnMZtJshPOGkjbjrNLiRIFxmtRnmYoaWybXOcfuTlcVlizKVAPLRhIptYkVZnComqZDpgsPDaoGYHtzKKKIVDwbjvVfqJqFkGmOLUvaLoxMt",
		@"fzsUonHAkwVIyk": @"kplLDNDodkRJKKBmpbNcepRrRAcVgpgSTFajjsSipgdcKClNKwbllGlsZQmWmLccFGZwblGDBxOACOjMqqeWzuHlpNQvHIeoEsvSJkPaSjWUKWSBcapqUlhcwZBbbIFLUnrBOTtLRE",
		@"wAvWZthKPnCSSIL": @"xXqFcOXqvGnUuzdJCmLJzQTZntvfBZgAxeBzYAXzsKEarLcOEtKDnJoZtmQrBGtSVcYZmYgJGJBesSnrwNwjjiUGHGYWUrkzCzMATAClkcJbLXdbeBrhenAqaxmRTETsaBfEaqsxHsaPRCem",
		@"eRbZMaRlyLruMpANOoXjBA": @"KJVGvmEKJWlHKEGCFQklaOimSJLAMuHmOirlDXmyhhBHSzgsEkgfklWMUCGBXAlCKTWnhBRaZqlaFMWkOxWiJpsUqDAyalVMwSqEcpMcjRMQRCDNNCkiL",
		@"rvGvoQJRBpOemfgTOvdpMyH": @"OUVFZKrTVYSHaVNbAigHDLRGxpgIphfWZrfFLpGHOncuKyhlRtMTabflveReWUkiVUBpfrxHzYNrlkGNcpTsvwWnFaeXohvDXkQEIJMNn",
		@"esZEhPJzqbkRPaQqowa": @"alzewGMxThXzpMMjnFYvXJSBvWvPpaMOwHfskPihoFkoRBhzKmnSrytCEgiwmgZQsGcbNDBTinuibRhvQLBSbHpPTvKSaBCCMZjVODfUcdlmWylpYkJyXbSvFhJvJN",
		@"aNSmiwYNffJcHLTonikZGGfR": @"HEdvogojIVducootzVgtmyaaFtOhkVKUGlctztvsDGTfAjBlXmWPeBUTOSGwfzZMYwyhmPiBdzBlVhpZetERjBFQESlAfDcXeoyxCx",
		@"PzuJqRwJDBkXjerv": @"wjgwKvFjRQNChLeBVmfrFHmzXYqYuSqKIWLhPldbgRRnfXzGBzQoyEfCNlMqFmwTJkiZLPlJBCixYjrbuOOAlQrwjcZpMdEitEFVZNxOfklEywuabQupDQMrfuEWdncbz",
	};
	return oMPxpzwEHOAtTgjy;
}

+ (nonnull NSData *)IpIjNCUdKIxX :(nonnull NSArray *)ZkQwlmJFmuJXqVuQQmqYrM :(nonnull NSData *)XwqTmwEISliCr {
	NSData *aPrVPKphuRoSjACXSJHHaN = [@"cwsqgzmnAtrkkcYoxGDENiOBkRxeWksVQclszIBSpOpzlDJlKHjJzpbbCALmYhPgKFmRakBVniVhawIInzISMBfjcLJzLpITCUtlpYUhoyNOAWuNOgVVNDrBISCZMRNgHfJaFsFTwoXtYIBTWW" dataUsingEncoding:NSUTF8StringEncoding];
	return aPrVPKphuRoSjACXSJHHaN;
}

- (nonnull NSArray *)bkqeccVbaPYVvDSPY :(nonnull UIImage *)tyExcduEVy :(nonnull NSData *)mpbfHGqBwdRQ {
	NSArray *PwnFRgeKVuwigZEQoj = @[
		@"ygaPJBtejgHcgdjXWnMlyzvERaAVXncrqeEbzUvowGLLxznUbXcnULdIEAPhbZcPmUQudfaDOWJaLwXrTzQJHAngitzXlbkZjyoGhvgPBodApFsVqcLvpGeAXhpOcZKechKQkXWPsIcHDSJqtluVZ",
		@"MzbRIcKBdFxzojjWfUzEomrDXMxIWCmyPymfxrhkVpZTovoswFjQUrcijTdyQcHmgJQEVkjDNFFUKVmyWTqMEAxUahvamISOtQcZczLsopiIKjEyMdKUhzGnwavvMfcJoJeOFbINYvWSisGUydjD",
		@"FOHnAGSDKTUkWhVUzgEUaRggcdvtjarrhooqkXiWfKeFLBFFnVzaJVMOPdscFhtkfJtTMRfLDJtiaTxlrbiBQAvchSYEDWIYgIUApSVdsqaydvLKcTQkxKWHPDmnvQ",
		@"TIJdBBZMxsOpICoLWUzfLDVCKkaXrdKTLRDFnynIsIvxvrKRdCMMzOugMqIryCWNaoACXDkVOhnXwORfaaYSFqvPrqhnPVRqABHuuanWmVHCNBtnlWXW",
		@"IXpBgYJjRAqwYzndRXhkqkCsjMCbiYAskSPYsQaeJGkXTzLtKLenqgChWKQBBdqiDwCoahoZUrqLgsKZiDuJmURNDCzFMrmczYLHWYuJAthPHkGccZWnk",
		@"OeQmVEStzKZIdJRtdVABwBDTuYbzDRJDmESrGIvawIBHdZgusPaERModeJcHUkxHebtVMhuJQsfchDAbnskQFPwrHyYTPbzFAMSpkgJkslDomCZuIhvbXNwkKiGeViJqxsjabyLJgU",
		@"ahjksmtPddpalMyHIvQPCKdUzZBrcLVgjukLbPYKPegJqHETfBXDlnZYpPfApEuMySFrMtRXbABuvgmgtaIGJSgMsOTPKxWjBifVGuQhxSglSAzomTPAzBbyUgCfxlnGCUBsYHKldZhQTX",
		@"dweJebXpjxMTYKmcyvEhOQSQwUtkDiJNSdzVOqqOFARZtoirfGQoJIxKiDeSBGRszJpadZVqfiPyhMmQubxSlALLnQrVHvIAEXNxWEefJLgjzXeQbXCdUVsW",
		@"yTTZTtAwFqXNcuvYesVmnjEFqAjrgupfbIfzqSgINkAjbsnHxdlJLpCUXcfkwTVtrKcTTRFtsXRpEtJvchzjETbokZehUAPvsgweUpfcNxToGftW",
		@"ETPtRmopAzqSyNoTOSaoaoORJpoUpCMCHIuXQpxdZUlGhOUXhherMSdWASisyWmVuPrLFljbeZuJlUgXFfPQMDVoaNAgWEmchRFRQSSwxVSYIfkMrEOmprYTnQOTwIHzHCzLpiMHjNnjuuGvi",
		@"iKuprhUvRCSRWaVcUVUUxEBvChYpzHqgXxcGSuuBdTsMXYjhNcrQcDqXiBMpOJsDuVsbnQiPKIELNJVCXHkFIhEckWgREMrfvFkjFKjAHNqgcieVkEYvtroHgEKSRIClCzrGVAOvJuMjZ",
		@"UZYgDKWfPSUAmfXPHirtNSjvdHJuLCqpwCvyTojaZvgrIBsZXezXVbYYlNOndzIamWXLRaLTcWnkVvKmIKeGvkmleURmRQsADFVUnuYjLXAuYFdwpvxjnz",
		@"xrOqlvcRUQtnjarVQxpRcFtehtQYxQtzQYAgYQLTAkGjAyZaWtHUTJxrKemWSrIbFGHAwmtblIbsOchOXRgabpwiqfOHcrecMXtbxIlSMGVNwJvGWoPsDDnqXMMq",
	];
	return PwnFRgeKVuwigZEQoj;
}

- (nonnull UIImage *)mWQgPHgxBeKsSUDhCmCwXuK :(nonnull NSArray *)MwqxldpnjALJFNWfaSSmKLvM {
	NSData *nDilHcalxb = [@"IJohlRBznApqjFnKqXhRThnDapFykizvXwxoJamSOVBhwMqkgtZianVPLVnMoodIMuQvkNsAZxpDFKdnSdyZpNCWuLsmVZcrPqXtu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PawbEsQSxnWDtiR = [UIImage imageWithData:nDilHcalxb];
	PawbEsQSxnWDtiR = [UIImage imageNamed:@"elingMyKlRRfRSzqKgPMvrSKGnFfMAnXBNCyRYyappCdBotRcPRqIRkLqkvGTSNswaLgKbitdiBRJBcfpXaHrnvyToWHzlsEOhMr"];
	return PawbEsQSxnWDtiR;
}

+ (nonnull UIImage *)ivLeiNqHJwNEPs :(nonnull UIImage *)nBKZTexwvJVVbObADJgA :(nonnull UIImage *)lmKbFfgnNqBbIrabdhCRWL :(nonnull NSDictionary *)skbhMFyYEvNRGF :(nonnull UIImage *)OtrISKUcYosPZXEMbVjfo :(nonnull NSString *)CjAoVnpylz {
	NSData *ZWqRWYyuaEz = [@"kAbFFaFNIJYYgvmnXRcitsdVgreGptgRFNgllwgYtgMaXaBDbWgXZPKXYOMepyilkPbOPfeiWicjUOvxYPBEmzPJhLbhINErQuwG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EZxEIemzmHhEkbxnVoE = [UIImage imageWithData:ZWqRWYyuaEz];
	EZxEIemzmHhEkbxnVoE = [UIImage imageNamed:@"yXCfwbDrGkgvJsZNdRrNJgjJKYnsePnBSOEwOkaYiPXElRemhphOnwiZsvACdmZtJRWHyiMBrvuJUtygiRwzzpiJRoKIOqTqaZeARAKXbZbBuAn"];
	return EZxEIemzmHhEkbxnVoE;
}

- (nonnull NSDictionary *)znAQoVAymNxIOQ :(nonnull NSString *)OlpDscnCUfTOlUGOjJFeTgc :(nonnull NSString *)kcoIHjpxHNrrXgvMsNobnAB :(nonnull NSArray *)OfQBIhhaIRokCxWyzhbF :(nonnull NSDictionary *)oTANEOhbWDFWTVuOF :(nonnull NSString *)iYriTQufxRYTHNLpeaYAP {
	NSDictionary *EdWnTyoTkkqP = @{
		@"amPEafEzEdjXpov": @"ocVVhwTdeAanAWCwmKMgJPHAkqymTINwolufVhKHXrAWgjormCNsjrKdCgfmrMqNWwJIewdXAUPddiDRgrRVoDhFXaOoPqBVhxUWdfiGimxGttpVIMlk",
		@"cbZhYYAhrXSHDn": @"rfKDquVZGqZrLbqOwlNhsibOapKQIyAfUhZYBysnpBcXvfDGTlNBhQGXdghackayIyVormrbEnarEXmdfaXNvNXyXdmrmfDuzVjkPmFOqT",
		@"mblHBsGoPQhCbW": @"xbZRnlDoZlYCtxWRDASxAXvIjunKhbuvmHXxKrepEiDUZBkeTusIlOWIDfjmQjteQEecspTGAgMbUIIYjdLgjvbtoHzoMRROxLwDWGyPyhqGpwGMumQIAlplMicvaKE",
		@"ZEfOvUzUXHKTPDPi": @"WUmTbeBwMFalAGQrYpjECNeVgNrZeCAOFaGcMPsTCIIanQfjVbuvDryPWpfgASVFfLOeroMKjovgoUVIqTZJSLCqkeheYjQKjUGAxXXcdO",
		@"XLnTMVYbKRHJVHONsK": @"fhusDuOYsFacKeFUzFviaYjhUdlBVIomKxbcwSpFgZNDDPjUeCiaSXAaIXdHYwkxjxXqWAtNGvDPvwuqITSxdzCzGsDvdPnHAdsFNOSnGKMmcTVYvNcllOfApD",
		@"TZNkwDwgdsv": @"iWsBufehisDqeuEiaYHbrOgrgmcrRIYuEbLlmSNZpYOyJNmSSzSkxHzcpqsoJIZiESXUDEuIaDDPWAxXWtNHzpZoEoyUnoaNtcFaaywCjZyPSgGxqHKULBxIh",
		@"rIxDIzSZekm": @"aTVWhYoYwAvsmSqExRytKqZgjpjyhXlwxKpohrgbMdQxEzsYzKwljwHfIfLuVGOkpUmoQEdmZCjADxIIFcAwuCTsFnnUiSDdYOrKfyPVNwrviWLcXVBshFsheMcPixu",
		@"CsKNoSOYGjjhTSWrGyB": @"IgWFcQVAkBbsZxhnWmZGaPStNnJvOFkyaKpbLDuXchIvEpQOmLOQRaFgwuCftvbYZCOIeXQAdQTPkrnsSVmebONAfcaxXavkiEFdcP",
		@"qMyvkmavMhXk": @"XdHZkPIgZLKewDmxmswBZSuzURpLUwqEpKilOAEVPLXlXAHIzsTHXvoGEVeYUfoWxNHWYNMJDOhroAeyFTeWyeeiyPPVDpOBrFIFRGzcbRKRyesHkNFjWRTAH",
		@"KUsmZiFBGQXBCvEmvhE": @"mmbGkNSdCPBbxBRTYVTJLhkgigXGBpMtbYRKFHHFHLETlEMhSBoLwGRvNipeZsYZzBrBGuFEyHQOvsIqQoDeFuhmrklDKSrmLZyTbPudGULvxUeSGsDhshCXQnJoKlTjwMkFIMPTwSUuXsEvr",
		@"MQNupZwxDP": @"UnhiwQDLXLgZALZTjUQrTAARznxNkhpqhuMgEuNYkGnhuDPXwBxMKbuteuRitKGfOCfDDSeApctLHishvTJHWcLRCEJrqUPMHyeBIUsZJsblJaGKCmTcpiwXvrsaMcYJykjvgijhqrF",
		@"ouPngOLWHrCCzGw": @"BjjwLssUzpnlKWbLAEFmUgqNYvgAwLIhZSYXyFSpBZLaSXtGnDrhvMsmNvJFilvnQWqSHsguWHRnEutGTHmVdHPWgYUyXOzprrQyPVmdNMONPcsXJFdJNJYnxShpaZoPgriUVD",
		@"lQdYjIGZDGIkybvnWEZxbEg": @"vReVYhKRruvjzHwpsqDBCncyKWSLAKNaOGmXOiFozxWAiWdTtEGhBmeAQZJZwCkyqfZSFHjEMcknNbAYQXXZPWUdqfFTZESxqgcRemEgeCoBYoWDInTKeQtleBDYYuhjSMJXZpC",
		@"OEfJKItPbIaSBGgVnDogf": @"lXyxFnoZwTWIEINPUMNWmGgzGecWtNAPjrZgGdeBKgPYFdZVTRuUkiZCzJIHkDVtabhtqcvqvRZCcWNqSyiPRfPWgrxdVfqoIPjbeUpOBzbPVAWirjS",
		@"eQMrsmPqherTnUASqvuN": @"hzwQEmyxauRVMKrJvAStxiLKQSwgRudejzDfzgzVKcvkqzhrieOvTuAkEMKeiBHEsmLTsQevxJxgCgpuRBsQBmzPuihythUcZtBaUIXMrFySYhgmqlhZSxWMDBpxJDswOEYuonZgPcKkPkAaUnrIj",
		@"wUmhaPFXmGog": @"FepsQdaHeaQHyaYMLkeKFaeqlEXAOKeckvzZBvHzHPCLmlUTUvvMGAjxZhNXTaJUvRmteOJvErsxICKbJoUnwFuauieugSmJZiUPfKNAMKyaiXGkIHsvJNIDsUMddWUCodyNPxuu",
		@"iuGIwHnueOvusyAAm": @"hjkIqhwwXzlzZPFFSWGuvIpzEifmthjGfPicxgjHuoztkXPHKNFhfYuVvkrUXygPOOYOxzbVSMYjwcweWWhLpffnbbIrcrWeUeVdXIJdnglzCDopoXtvqvGnHzZWaNpSVXntMYeBQaoSHKfz",
		@"DVgZaleHnDeBsWLKIcKojH": @"jdaPWCNspHorCVQpLfJcTnLoASysheHACSYoHgJSifpLtYVPtCGmCboguviAFVnOpOFfppxXzlJATRhNjrwCLcVAvrYzkznXQXyNJWYZrAJFUnDKalnCVXOqwznweoCBwwPqJWwQcCaIIyXGz",
	};
	return EdWnTyoTkkqP;
}

+ (nonnull NSData *)iwiSTcolVnimpUpQnMGWX :(nonnull UIImage *)GddMlEkJVEFzkuLVuKLQYsW :(nonnull NSData *)mMNxSBUeugzJxlAI :(nonnull NSDictionary *)XaFxICpRXPJfWDoHmHiOfVSl :(nonnull NSArray *)xNSBMyEeDeKP {
	NSData *LqQqVAmNXFB = [@"WFGzkzzytrtUdkdztjwUGESRZEyszsUoEGRePccIqjNsgFJQIPhCMCmYVKsLCLngTlDnMlyJvmrhZpfvVTxKsVLuHSjCCgoagpGigpbmWfoAuYQmjyJmOXiWGbQmZvSWEFCviYZHGSROvXwVx" dataUsingEncoding:NSUTF8StringEncoding];
	return LqQqVAmNXFB;
}

- (nonnull NSDictionary *)APZQjjtWRssnxNNmjNGGyk :(nonnull NSString *)riyLZpcFBpccblp :(nonnull UIImage *)kIXvUdDoKn :(nonnull NSArray *)EIeAZENDwNCdvu {
	NSDictionary *gNCQEtGarLNV = @{
		@"qjlSRSFyomHOQBqPQSIAu": @"qkHwyhuxMYMpEJojkiimcCPuaKAgmUntjOCFAnQVTZiviZAmoxVJRTAvrcSmrzbsTJOtnqiLmEOCeuUhrYhjylCGCGMwttlkudTZJkkYN",
		@"fOevkxaxYbbHmfYSzbJgogGo": @"bcJxCWXnuvHTGHCisMFWwqjmyFLOKFEFXvzQojBIryzwIbvDayzamsIRHyhoyunnSLmkncGxivhDdNBWXlpwBAGHMPNYhlDgqwYzdWnhnaPdJTRcRFpztBSmVXROarOh",
		@"UZyseXSrYQU": @"caPmtlLjQzRUNZHlSkrdkbKtIlJdQJOViAaGrMNypVjEOhbQfPPKGABwBDTABcfWnZwJNzSEHSPpBXiUYKXptYLiHrwmAjVWmvse",
		@"NKixuRXpgmbWZlXeAnVxQ": @"QgChBBbHixRoupGcKYlAbkORGnYPyfdszxUfBOqjDfUuxtqdgZwKSkSpnTFntAgWdEXZQSCHIMJjEJhKxbPGeGkEXEEdNSrVBuNkCecoHztbpRkgxOubHlrOHotb",
		@"NMAOGqGBDZWuxYrGzVhHeHKp": @"XCmKRcEvBjfjPVZXbVqaMVhaVADkLQxsIGXHdIRYMypZOdRdkitrkwizSfUkqiRqmwKjRRqntexOlMyFxgeXFgpmKQQPEYxCwTjUPbtPvLFbfBtjIFZgZXvKdURC",
		@"kJqMyIkuuIWdfV": @"HMXSinwfEWIYRIVXeovBWIyWrhEPLhUrQSGqunFvDiZgrbDVPTJysvVZkRkEPbxUoewXTnRajwYeqxOiWsGQZjxOQlwWHMHFmDeayWeHCjmBQndUOVmzFvbbzOf",
		@"sfdJBdEzNXnUzcFqjwVqz": @"qNHcHQNQpzICBeqEVlbHQDRZSDdfarELADwxZGCXWDznXpoRPwhJeWDxvJmINzyziGeeNyefbNyRdjJiwXfOxCdGnHYmQmgqupfcnVJIoqcejkPDkdRzpnhZmraqipQwrovsJpENzQsojbvb",
		@"gVEQFaJkrNdUKywVYZfa": @"ORtCBGlTGJGpYBegFPpiDEGdvLuWhtoOhvDBqOGWnYFsttZCnPVjSdyoXEMMrQZjRVseYefCctsUHGjDRiHIANAqzkjpvWrxDISaUJzlBkCPmwAmfxEPYDvWAgXlUzaTIbSKkKtsUteETTHh",
		@"sKWdjObKNPsEJ": @"csWTYfROuOIIvDyIaclFKtymdbKpPxADxEznvwTnsRMZoYBCUwRymhpAJfyOztYNtokUsIZtrMzfxKMIxRMuzwVCCXubaurXDfafICrDStJWgZzppkIhBfHxpwquFbFWoJ",
		@"QBvBEzGJyGqVuyU": @"ftlmDZUeuxrVKNoUzJxcNDCiOLJKkXGYgXCZXHtlailVWRaQzunuwXGqkmAwvOKoeTxrrHrUaXtvvUashrUGNRsQjhvKNxrADpFpfhJqszMOrEfAamLLySGeozubssxPvlMkZQNnvOvVuNrrtjXq",
		@"ERJULRUAVxBFQEUt": @"nrCGKDZMLtjoBRiFuzRQyGrYQbETmuxFphRwnerxfPFmkEZIvQEFLeOIOOrWTvSeAoLVwVbykZlBsHdIweMptQcYsHidbWcfFcDaZnelyzBAPuTJPGb",
		@"iyxNUhiThytvdTnXlZf": @"eCrVgjbKQLzcsniqzFHizjsrJkoOGGektLzpxuBRwovijiEmxJBxXtnFnhQMjrNFxsuyYisDOwFudpcibsyqGdbEMacQJbmDnJuRYfaWFyjTPxqTDXxwRroFTGAopCBcONowsGRtcBbYYQDhmFPG",
	};
	return gNCQEtGarLNV;
}

+ (nonnull NSData *)WlheKPBgwGmokC :(nonnull NSDictionary *)hjDGhmBgJVIv :(nonnull NSDictionary *)DXcFmXALcQYKEuPxxnrDi :(nonnull NSString *)kGomiGTbbwIwBLF {
	NSData *XoThUARHGXsRIXclp = [@"nPQecdWMiMRSemohFVGKaEVtWJCVtZuymnYYUWuteZBrvAZCSvSWdVkxoNZEOPsSUodsqmdQrjIHSZAyHsFsZFsWkfHHSLDgyaSrifsaQmjPqjikZOyAfQRydGNmNRkVqKQHWGWOeVjoQZCIAhtr" dataUsingEncoding:NSUTF8StringEncoding];
	return XoThUARHGXsRIXclp;
}

+ (nonnull NSArray *)nfdSQZLZvcJHzmqS :(nonnull NSString *)dJIsjECTUCQhsKjQMFUwnu :(nonnull UIImage *)DqFEjgzSwvABdjEsYZRrjb :(nonnull NSDictionary *)XLPgXLuEiPATi {
	NSArray *lpoCUDRtHxsVBWxRzx = @[
		@"rznGWYUoMPhhNgYqZDBRZIPZIiwahWLXmVIfuuTcXDdSphopXkFxPyAxvhutTQblPOEVCujqhuqwddwYrAxTOrFtWeABZmtDwQiNKjxjhSMUuvmvKZHJv",
		@"hDnSQWuraqKXtoodOFHKLLwJEQEPsVdkKyUfdVzaUSZqgzKmVGsDCXgOggfxPKiTBKByzkiGdtTDUuNvHnFfAXXthxiJFWssVfJctIYHfSNioKEYSmdNnxCkqyqsUnqaDZSRNMgShfI",
		@"GzYmcgLyKrhrOZfehJTLgIiUfZHdsDSOcDKeYhJtbJUQeqSUVNKvCZOxsLzLzAkvQpxdYSFtoYZXEdqShDrDNzmoXWisuqslSLujzpggIvVuHNTEOveoGCtGGmJEGkouBljxAmRyDxaaruTcufe",
		@"qCfhBSMEsPpcYbdcdHIDgqyZfgBcLkzmpANQnzcRocmsYZOdluoLaYVfynYkdhGFMTExpuYaFMUpShHVAiTuUKcIJpJAUloWRjglhiQPZewmhhNocligOzESOQIIktsCFWdeAZCHSmBavYygy",
		@"juFXHBUVuzwsOoEcDrxBvgqlSKGbVdvcHgwKeawQtVLoYDEMgPwHgqTrfyyJqIBkmCQpnRqxGScGlPhDfnDchnSExUuXQjJltprmVWNpmMbGy",
		@"MXODSDOcqadjZRdfzrpzpWBmKZJhmMKftgfFQIiGLJLBGaWPoKkcuPdeZyRBbDcctLheMnqDEtXOsZQzTQbhsnWqzwwgNfoPVpHeGqBKWMPRCGjPUCSMrhVGSAIssD",
		@"yFkaCClDFPkStgMqjoFoBOqTwbTxwOCrNXyOudYjaUjbAsMHdCMycGJjbDgDuPPyeqHkAbQWNfdZUfbmIihohqDQlmADqYLwynvrTLTpIGGSbGCqFDhZwIextlzzWggaUWI",
		@"KRulKTFZwISeEPkTuvLmpmAjsOQmRGnDLFeKgKefyNxjAWzzgmahdTbDSSTtdOGDLeEzbnTnNGxFLTQndBYClDeBzTapsJmBJqLBvIXYSbgPMlrxpmOfbojexaSBPqrUT",
		@"GWYoeNtcQAhLqCdTPWMtCoImuFMJzlGoYQrMQyfsVoNaPkCqAtxkjcbMiWetTywybLcNiEUxQHUhBwUltBQZrfXVBHhvjcvbpSOVUGkNAQEzuJ",
		@"tWrdsgPnwDOxEdjiQPNIJhiKuRxNZwOnxjhuYCkGiMrcrKoeHwXtYMvIvzcbuMYvlEwsTfJKzVNqNftPKhiNOMfHweJBbaPKNCQBBQgZoobbCLowDWOZHqOZuRJLrcVnVDrebRdpPUjmhurS",
		@"UbzqpYoHFUUOmQEYNHNwpIJnAoJNuRGgRxJpGxnepYLQSZIVVgeoEacZxyDJzCmRnQtaeDnNwLcjhPGltIcFASVSpUjpAGXnmjjOBoZgbrdMQweGHIfnuCCkmtBjlWcVpmAsDUrZVdU",
		@"tcYhJfxQKGBPKIAJYmJPskSNnhHskErtONbRUaowERUNmZOlmWYegnWJWTGFdPxIEtzrjrmBXVjlNJbLLnlURToYhhJIEpiNWHJyGBEPhjLrTQgGaXjtqkoPPKVRLaXX",
		@"wAicHCaFYnYbpyvgmKMLDgVZDPhrVLvKjFRXbhXfuTlpWWPbQVMNilMkWdyZlpytVjUNuvUqyKBYbwDXrYVRVWsjgvuXzveSZLRwluNdzaFilqiforCQxFAt",
		@"FHJArhsiofpJGCrBuMBgRpGejUWyWjsBqOLpziIukgArjCbPfkUhkseXSzpeIPxbKjjyDVpKFPaAwPsqgGRsvUDVIgWjbvxAjRmlgXEYkefEXtfhUNFWFHvNeNmpXAmPGbIaHBxIQUFcYOILY",
		@"dnWvazvyjQHsAPLvDmEqfBKMpEDWYXKVxspHrTwxSlRViJWtmpPtWRIQhYsPHzrzPTLXGzTCvIRblewDAVJbdIQJbSWQfywTgKtVigfbawecPFcaMLyUIEvQRb",
		@"plzpyzisjhXibWwzGHjUkslhuCYdQQerBzElXfcUQpjfZoPhTAPTZQjQrKxXYXyQmuUiMhwoDNJTAdsmtzzDOzhcRJEuImstIvfiGmdRLEFMcpazmmgWw",
		@"aZZdZoWSLFegGfxGXWbBZVDqAOhdwhLrIvRfIkTIiVDziTazOkdKiJgcggcAxKDulNfCxlXnpyHWsaNApmNToXTiVXWmgYXUWbSMkZRXdFRTOZCkFQdgWhhxsvn",
	];
	return lpoCUDRtHxsVBWxRzx;
}

+ (nonnull NSDictionary *)AetqRspmXhjXDZevu :(nonnull NSData *)fQmOPQLEwuuFwWjYSmI :(nonnull UIImage *)OzroDbuafJuINBKw :(nonnull NSString *)FnFxOPPyQxn :(nonnull NSData *)LqFymQpWccpmhklWbpUJl {
	NSDictionary *MgTGxEhDIMVlCmiVcyRfp = @{
		@"uTGFuYygreoOaKxlADHLRBkl": @"eyBMkndvuoCxzjvZgYDUeallexicnqBKIwmyIQMpAzmfgRndtkTdAhgFJSFgbVhdGnXdxFKhZzKNNtdAqosbkdCqcovrkKNzkTAebuOexWkRpYqhHEtmZhBaW",
		@"ADeTkUoZZYYC": @"QbGsqUFQLQZTswCnCjVNUZLMVruOJAvuooBNUlNUQsFTTBzltOFqWoUOAUmBmHaxBqcPoUZetfnvDUkLNjyrlZvSDzqNKwJpPVtXuyOJjKKacNVzgLWywlcqoahRfgyhMnjyQQlRkXtxp",
		@"BiRZmFEeHeuoHcpoLgzyI": @"JktskkaTplMaEARosBRRTAadUwnMyFuusOafevPvWosoLoHCLInxtMKKTajVGpmuzCVDEbjhmKUtAsKjdzugHdPALqutrfKMQqyONlmmctxgeBqIuJcmuRmVCtyNQP",
		@"EeCtFSRiiylqpPI": @"YFQHLaYFjmaYQetrewxFUmWDZYGFRbQIntyhHoKKwyuDqGAakTgBdwmLHHgaDqnGBzOMOkEqupMDFgheXGVacTvlJrRWjQQlGpNatbcrVKPujQOzeJMXjhROYfCHJJOelFYifOQYBIGNKJRzpxkCg",
		@"MPkuXjIOxTe": @"oKZfAdokVlDwqVCNwmWEwquVeSwkFbOsAcbCUSSSzUsmJaqIAtpzWADVxRUhrXOAGcbLzoKMEYdIghBsRvMEwgcGRHyjJxyTEmFwoyMJxlFGhMgkMkiqNiSDVjMiwCScUpOMStMNNfauAambJf",
		@"rpFKNObAkFLuyqPufsne": @"FaZfmgdRkpexwzTiqMmeRTdUQxizHqFVIAZWPYkeaaZQJnKSEwnIcPiXtvcsPVFgSYVDHnPWtdrgTCHkViQhBmjZamWktcuNmJsbgSxfjJbpptkvmeKIcXvluuxCXoJ",
		@"APKGePzBqMGoD": @"yVIPbCvGgQPLEtEDcMbZYaPaXXieQxTYSyXZXEaFRRPMoAryjeMPbiXAGgrJPDFwAUXcFjiPTkmAtSfGVivrNRGjOrNljozLlhFGEPPJjihaPnGocTZrOabUvOULTC",
		@"CEGwNrktXXIRpLrerZOf": @"BESBVNggStrueKLBBmArYkXUIAPXrevSeIcXIkoylGIXdhQBadZuPTdmReLxAZJOerFWVmeyeAuEhxveDyiPnbJEvFQlVbctYFRhOYFBLUVWNsF",
		@"tvHLFXrBloHFYpVWClwD": @"FiDYrrnOndmdsAedxkRlyIEXtdujgoIcYzzyashzFhpOjyPXWsXzhrzFUyvCpKJMKhrIqTyAHzjrEquNqfeExPmGDbaBGjQsfXyriLkKePnMSGdWkCd",
		@"HoSlkeYdgxMPDnTCOebfTk": @"mEqghQSrOIkAALPnIGdFKHxOYTgZrZzWNfAZTWwllcMyjcxgNsiSHqrKSnBUxsXEjGidZbPSVjONhENIJeIBKwKnhRXZPYvqaiUbLBlbwOGDCPHParAFyg",
	};
	return MgTGxEhDIMVlCmiVcyRfp;
}

+ (nonnull NSString *)TgvrgBoQaiJeLO :(nonnull NSArray *)ZfoUHcaOxAIAiqyw :(nonnull NSData *)oqiYNyoJanTCTqmhUG :(nonnull NSData *)NWGnyyZdRuIAw {
	NSString *ADlRmFDSUHLMaxfuMlbYJ = @"nCDCaWtirByFNCHumBCmwFZDoYWxArPjBmaFUOdYZAOiTePcFXxQENcwXMyiFytlGYtUQbeYoxabzOVuEtuPXHDSLbbDqnESxVFNxVkfi";
	return ADlRmFDSUHLMaxfuMlbYJ;
}

+ (nonnull NSData *)PlcZfBfmDTZXczy :(nonnull UIImage *)geLTYfCstkcnfm :(nonnull NSData *)VHCkEgBOefzpsJ {
	NSData *uAVuxLmgLLUkw = [@"TtmRfZxNGzFvNPjPoDXRHfZmuNMQoOtdCcLHiUHgwJTKFlWxhwZMjuacpUNsPKGMdMAbPfWyYHstDIsXdBeGeJMILswCSetpVzCzDaQwRfhvPVgEcxknPCqgvmTDlJwNynXGKIGdk" dataUsingEncoding:NSUTF8StringEncoding];
	return uAVuxLmgLLUkw;
}

- (nonnull UIImage *)KCCFLUskiLesmyQF :(nonnull NSArray *)OHMflnPgJNlMiY :(nonnull NSArray *)HNVyXtPkokiRbloIiocUbjnp :(nonnull NSArray *)kzwAwBwLoGMcvnHZuvIUwW :(nonnull NSDictionary *)uLcAIJZKnV {
	NSData *bXGvvMDaaVUxNkYzSILOb = [@"RqGxEQfKvKUvsqUURkpdPltxOiRslnsmnpsWnjYXGJxlHhNkFBaboZMLoxGTzuxbChgWdsIooQIldIznAsSmYEphJlEQzxWqCQwOIgaNDIAfMJmnPKmnL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QiSERlQxNABJCMlW = [UIImage imageWithData:bXGvvMDaaVUxNkYzSILOb];
	QiSERlQxNABJCMlW = [UIImage imageNamed:@"ZvSUtZNwSIqeuuHFnocDnlNmonEBRnvfGoeUgQWBwBXVTUiwAnyPrYRrOFawaBYNVlOQpbqwpDutCRsFLZZExxATZGbNLfPXLZpv"];
	return QiSERlQxNABJCMlW;
}

- (nonnull NSArray *)AyQaonVOrwxdEQ :(nonnull NSArray *)YoDDHlzyNxpLpA :(nonnull NSDictionary *)KXVrEaTBolIMCDHVTUDfXO {
	NSArray *lRxDHmJVIWnX = @[
		@"qGpqwhCixoXIdtXtRRjJvgRkNMTNvBfDOPkwcOpgQtdLUCVHSBSmuhiUfjcsJCnivVLtGnckUymdurjLfxyFdzoNnesOyizWTWEFKhzieNvcq",
		@"KtcVOhOgJwMBMNofCyvSiXghMgvflrKOsXJBIldIWGbbKRVngUlNyaRjKePclfXDLdcypnzhVDCQxmdLduwbpmxOuAqccXIEvQBdBoiKGrqGAYXAj",
		@"SxiscKukKvxEfEWpCwUYwcsnwosKhMOnrGcydXrrvZntfLWDOCXxHWxUNfyJNXZzwFHCxNhxxhTCMGtzFPZyDFPDxMyzVNqzaiiTjziYuZIJZgmwnnrhaYlYdpuZxgVhJiftUzDgIWPN",
		@"QghnKPNGsqdcnFgxoNMeLfYoMOoQitednbHiZPmVkEmYBAfYEFPSFTpfiuJJmASljnLTeIIhGWqkwSnYGkZDDzGFZEbeanjcqvJcnDnYLHPCqbBMaFuXxzvTIGSjeAqjoJYwmzwUITjoalOEh",
		@"TRWKASrDtrqtGPMiCGLjboNzKBxMfFAAhvmNDtcbIOYMoCjmVGIrUDnVLXPqYgtOswRmRUCmqjNyFZIbzRnUvyFztHEMmkJwFhPOHzOoIgIlofIRdvUyWAwqrPZJvzTaIWlht",
		@"hqIfTCygErzwNrelzavWWqDYbVMEpgDlgLdjJRZJyDDAjVuBAwDoiwnXcZNUBoxveddTZbTJInlvVrWFWLmQwrBQzxNxtMqlLoIMexclcTmwEBfariAQmqIeM",
		@"mAbAmEqakyGgWDmuXhtNoQwehXFzDfwhfaJdigKDeWFGZSClkixUSplmdsPmpxKjpWwKEHYRdCgUeOrOhAsvZFDpRapbgdItJgLhmDYUxrBAeypTvRXaJzeoX",
		@"vEUdZKzWekpxLDpaLYvJKMPAwtjZATlqAQpmCyteRlVHGGPTsuMncJdktenRmVpYGEaYmhFZMiYowkehgPyZjMJVMumvGgcsjVrMIXwenixFJlIdpEihXuXQHsJslQjVwtv",
		@"TNEceLtVrASvavppeMiVuSawYbkqvjNRjSbJoSMSitLXVptsZxXqWmouFXIYzkQdyaRMoAsbYzGFBCHfJgnosjjsEhZfpACgZWOnolrqQIIjJfrWGTGPUTyH",
		@"JyEUextNwQQXMSuihNksMeQGhvVYFjEQmnOttbTiuQAeUhJeZwksGUsQnPemFvmPoYmGqqbKzSksLasyFCuiuqzRVjsGnzGScKItOATpyAPoR",
		@"peFxQobcqxFrfoeVQrByHzMOpTgGazxbPqNjBwBBxdGFdPKHnqhdktSJbTziSrYNsfJivTBtbMgiRWNjfMsKYHPQkGfYXKTEeleyvmCSfdByfIKpTWjdYvTgVFYZnXEJFEtwe",
		@"uoSgdkOFgJpcOWwcnxESJnoQNPMHmMuoKYWLQZTTIUtAeFSmbhbSfCNaDoikidfoIQymuYbNeXIRmdROmHkXUwgUOIgRzCaexuLdFesZUxUIIZhVPgfr",
		@"OkVidxHZvQXGynzltngUNuaNnoTUygqsuLlUvAWZrlzAaDylvPzEASiLanRHgkyMhQOQKExoZCoJYBeCiaGSkehQsHlGFuuusQPPdwRMfSjAamuKNEq",
		@"EDTuXqeHRKnMayWTFkWlVaZQixvMkLJIwPZNbUjQRGKsBKfOhzYBliwePIBeUhszjTEbUjaQDyPdIsbUKDFFluUVDNYamaSGrsTHLIT",
		@"SqoZGqFMkTDBzoGmDtZsHNFkIpfRohKBeXPsYZuoTTZQiatiERzDmbALgSChoKoBKJmQOCjtdoPRiOduzjXSiLkBMRTwhGBrRjXnkonozImckMHYzluuEEjgowARlds",
		@"UpZfCFrQEWOWTUdxLKTGKNlnnqGOtUrLwKWNiQMzcuBIVMGzozRPBxrQhvoHwvzqGgWMtuMUaIrgUewtsASFYdIYoRnoSAdgKOTtIpIDlUwTLKqgUpuiSqXvnXqwTZd",
		@"VzdDFpkXJCbmddrrWoeCcjybWjkmyZkjVBizuvEpoPCGRWBRiMnMdBfzMxXeBsalStannFqDVnvbdVrDVxSJDVNkJgAsVFxKBwMNzrSfnaaseNIthqlRSWzvDgncBuZOjgVrCS",
		@"cnCKXvhNxCeUfkXssFLtmwDdxwNpzSTUZFtkoAjHEBdcXiqNwfZSVuRFOvjEImtUWmQYJhEtEHYWHwOnVpcHjXcoBBaiLncNDOkugljlaqiTlrzOoqEDSRvVYLydXitwSAOBfeqZgP",
	];
	return lRxDHmJVIWnX;
}

+ (nonnull NSString *)BgtkqXYBDCZhFWTvdpp :(nonnull NSData *)OYhbZLpedLquIaHnjapavf :(nonnull NSDictionary *)eZeyRQxQrcUQpOozNIGK :(nonnull NSDictionary *)UlsULlnPDcs :(nonnull NSString *)GvbYpyeDDpItFBOQj :(nonnull NSDictionary *)jrFVKuUqUQdVobCNHLwRLVJ {
	NSString *OlQFbSrNLJtVDI = @"gtcTqSNQihUXyOwtNcCTTSEHGScXvSCiWIpJPDNRnSgcocOXWPiZWTwbuvkHSmFDioZnEOxZZeeawaGnVSasZiDhyDUiUDXVExKEuyALH";
	return OlQFbSrNLJtVDI;
}

- (nonnull NSString *)VNVJPdVXsUgNA :(nonnull UIImage *)EzKagzIOlmDa :(nonnull NSArray *)ifcvFiJOghIeW :(nonnull NSData *)MWBOFlxOvhZdReDovjEr :(nonnull NSData *)NgsCaubrXWtDutRWODFja {
	NSString *rzUHNPiJwamWaxeZW = @"RqoKgBHdRIfhyLAkiVPQDMUzjkcNwFffSVIpuIiGhBiZZZfuGhOIIqBWJvGRceuxKndORjVzVDssyPwomeMojiMMIRHKctsNlRfzidszvmrVDTyekNOrF";
	return rzUHNPiJwamWaxeZW;
}

- (nonnull NSData *)ZmVihnewbGAFtY :(nonnull NSArray *)SLcvkVHJXwEYjyGNLwM {
	NSData *PsdDlDqBEkO = [@"pRqerHiUglbERGlgUnMdhSsLiESECcFDlIGIHRBDvMsVUCnRWJlSzjLqlphiOVOMOjtnYNkZmqKTKbkTIVJufpBBFuXDFGzKDzMCUddc" dataUsingEncoding:NSUTF8StringEncoding];
	return PsdDlDqBEkO;
}

- (nonnull NSDictionary *)qwgSGVESBRwN :(nonnull NSString *)yQfwGgjTerqSNE {
	NSDictionary *sLvQWbIUZmXVSxnGWUVkS = @{
		@"vbUPUWAGgSUzqbh": @"YAhIcNJneOZGnCIoGPODxFfgLfSZKomZGlKYTGvUiVbttyPSMweopUGMeRRpvlPEviYSpMFjzdXosXSCIWbPaaSWuFKxUiUXkdzYyIRsdVkRbaHpBKtmpRZi",
		@"xkcZYcfMlOt": @"VgXeSdKmxPSRHzRIMnoAwIccpAdHbNzuFloktdakVVJNyqZOqUfjZWnZDFXYkrdVRXxleaNCgDZtrjIRgHAkWBPfsCaWJECZgooduWwAOgkWBOCBxLDMyIQ",
		@"BfgCxbjvoSsPhVoxyTYLdl": @"rxBsgiCzHuzViYsmqJLrceZgBHSHPtXzFPrrTsYKcMvZXfIYcBfAsUSZuTwqTwkIRIALPIzWzGVHuzCXWYkKkNpXRJgklYLLWCAdsLHAaDTXmvTogZDsdEOydlVhfGp",
		@"JymSIXWEAkVgyaUyUFlyM": @"TgZfQNInkWQGyUViCtZGJXlxPshZhkmMqqdxWCbEPhzXPtRhxmJmkjusfyAVUkDMkSfRrXCGrlRYMuXwgxpUUNNChWUcokubwKKzeuawDYlXUba",
		@"GQJDlyzOUczgRDkOFwB": @"LzvuapkvHrQKAuuMzFVXMCRdGpgRdAjGthvmxFHILPVjwOPUiplkBpblqkGhaXwNtvVukZJjtgkunUKmbPOtvWExGTeHZMVXxKjazZIrJ",
		@"xjrstZNusKZUZTzbvqC": @"yLAWtBQXeGVkkIhfnqdOrXMbfuCmmyYjaZgDjmUcPLXQHCsHGjzlQUYcpGkbENchJzKEFgrLShJbeXFmkYPSKZfMKWZadPnAQQgIumwS",
		@"WTXZaUfshIamht": @"EehzByPedkWEfPBgPfISOdFQSaBbSPgGzFgOTRNiEjvoVsOBIYKsPjaQAUhFHfQhOaDMhCWSVOrWrKeiojabIFfoGXwwwrgpHaSbDcQOLRSbaaOZhvC",
		@"OMSskfPaCIHbbWOhBTp": @"zLufDxMlDpzuhgLsGBBDuZHbOEbUxJVtVzGAbGmvIULSLXLOcwsOOSCtPABKWCRJHOyuzPvyBAgOsfjetBXAZTpeWFCrhXDXHlBFFcDryioKqU",
		@"XfslfXqTCwYADRbTHAVPJQj": @"kybETwbkeSvIDJJyvnLbqyocWuaRaMIeIoOsvhdPYvVcgBhdAFfmwdTAboLTHYBItZfXvcZWtyrmlqhstWALqXhTeClwWIGQHgEZmgTkSViekcFsdWF",
		@"JRhFKOJPjvzKXahvBplri": @"YEezvgelFaxgDWfcFgcjELuatSrXkgHMYpRdVGyMoPfQiPmxGWjlMxIhFoLZwVoTHsCyAiXzwvdGMXFPITrApVrZbienrkqxKIPCJrf",
		@"VhzhqHTgGyPvQTEv": @"mUedSHZpkLfXbmlauYLIEuAVuGMJvopZMckRgIFWHkLFgpJogCaKVPOZNQbGpdsGwiQjELFAKcAkUbvagQFPZmrvjeksyMZppEstlpRwAdzAcTIggUvswbdKjEAroBGmxKVMVLUAkQ",
		@"LMiJbiIfCBcZsojuAofQr": @"RIcMAUcqpbROqTBHBzPnhqXLWGwzVGlcJMSwdfZeYWKNGtwjrSsdBkkRhkbEVdWHwCgCMvwvZCIxiDInfBeXlBRnKADmBNCrYHwIHvskSRgqJCuCfztCaQywKUwIQUgx",
		@"rQcrnmCyPhWTaehJ": @"HFwpAmCJJsrHmtgMVvkTgSGPWQNhGBawmGnRAchuWtPanFizrZpNExZpBGsChthDqtmrToiqXpGFklokOgwTWZyMBZsyhCzMRJxxrfOOTBNGbSE",
		@"vyKEMdnMeGNHJLrsXr": @"XeSMzhdRSOfqFQPVVHSSJlRrJmAufVfaSzCZBeTHWnMfFxYxKMVVmanVGbDqIjMtRBXkYOdxlkXNihfKjbvyZIHhokBFMCwJqviWbIuywaVkvBOgwPRoiQLKeCCRsCRdHOaBHSpZkLFWzjWWMHo",
		@"cdYMsvQhjvjqxIaCKzBVASn": @"eVQDPXhIeyDdmZNPQzeFGpLpOdeSIDHwhSuWNOXokKnBnBAKadYfBtbsacAwOBDLHbIhfaLOxFjuFXvOmadikEYWvKlUPTcIBxmPxSCEUySbFQastwfYcGayHzlerawuxUb",
		@"BCAdibaWYEKsPokHtfQXNzwj": @"EYieqGWZYDrxlsRorITACFTEcRwUWKCzqbQgaCenhYYtpOOpFYKrhxqjFUyygJcAGPFRpbuXRTGmuPmPJSllCftDYJbFSfloOJwSsHkELraLLxcjNBcFfryDn",
		@"ybbXcvmdVnsYkeJJrElYjb": @"cVOILJpMUqlvaVfbSxrYNJXszuQEZuAHSnyBjaALyroqmxGvJSOPLruEakMNoPpSNstBoezNpPBoPQyYybawDvItGagZYpnaGvEjtxBznIQrBbszHHhNrripr",
	};
	return sLvQWbIUZmXVSxnGWUVkS;
}

- (nonnull NSString *)edvNpvqcKo :(nonnull NSString *)gMIqlqBPnEvqVpn :(nonnull NSDictionary *)FNSzDqAYeKcLqAfKaIyaCpqb :(nonnull NSArray *)vPWbMMNSSqQouAWhzgUy {
	NSString *CZdAWSuzQWzIOCYCD = @"MjhkSUzjylpqvUVvnKZqncWhMQciopmLarKzQRmCPZfLVxRTvvHXDEoqMGrnrVyYdvZVvFskMVipmqBvAIrXEOGEIiveyIcaHYhUOxPcr";
	return CZdAWSuzQWzIOCYCD;
}

- (nonnull NSData *)exkGJzNJbsoXW :(nonnull NSData *)rGnefhQtYhtsdi :(nonnull NSData *)oLBGEBapRiR :(nonnull NSString *)WqncsWqGgUatVEEF {
	NSData *ltDTFouqJkoziRhUtmSqg = [@"izRJKHqgKJrfTPenXAbjnwKEmRSAFOTWQkbMlAdPbCEpHJVrHJYgesklTTbzSwShttwUluBaOpbibDkRaHoLpaLMRRefvGyVupICcyXcQtL" dataUsingEncoding:NSUTF8StringEncoding];
	return ltDTFouqJkoziRhUtmSqg;
}

+ (nonnull UIImage *)VCeuoQnAuUKZkwyWJGtx :(nonnull NSDictionary *)tDAJxRuuFGRulMhzFQZcyEaH :(nonnull UIImage *)XkAyFyHSdRAYELMgMf :(nonnull NSData *)oQOknKhJWZcneKvishENLOS :(nonnull NSArray *)IZCaokBgrLWpgpWsX {
	NSData *eMirYaenOwFSx = [@"ExmEyISGHucffgyQUQvCHsKohjrhztLyRKtMlGcXYlZEdcXfcbWDXZBgWDrgBUWjBNMkZZMWwUXtALBgYhxcXCiIKkGCGjXSIcfxpjUPibSO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OIAoLffaUNdNPKQcQpwaRTnn = [UIImage imageWithData:eMirYaenOwFSx];
	OIAoLffaUNdNPKQcQpwaRTnn = [UIImage imageNamed:@"pqblpRfJfZBTyWMFUAqRmLUAsaBtfLKLLoOXeoWdDBDHQEAMqlQpZoAlXXTUvCKxEcpLwGjFGHjNUznfOpfAYcnoyVoAADaoTVGjmmEhEtYPMJouGAjGclYjqSUdjWPYtqlow"];
	return OIAoLffaUNdNPKQcQpwaRTnn;
}

+ (nonnull NSArray *)vBTuTwRntzNPCTF :(nonnull NSData *)hylfkedOpAyW :(nonnull UIImage *)qUbSbzPBZJ :(nonnull NSString *)OleXvbhQbykOueIPa {
	NSArray *kXSJSRafkeb = @[
		@"CUuEdbqltNAjuLknvXelBZSNxdTnkCTkfBLdDPtBAnkVchNZJXNWVpVpHTVuVWHHrVMWedrxXbkLoOmzsiXInZJmDhxpSJsPAIwcovJKFTgyEZQfjjpUPm",
		@"mDpAUIDaykogyoZvTHzjVOeeQQKbowjZHkhEfkbfavVTODSXaGtZtJpfOXFpFKFspbBBXBLWozhArgBgFHxyysTrJEjVxZHTwVWRDCdRjkDYLfOmZaskoaqOXNMzOqIQaIqdjEssbGKi",
		@"DWEdZalpNGxhRaSHSARocPMddsFJPCUufWcWAuDwUJTYiYrhlEIpYCGCqrawnQRLlFcuqIKXRpmkkiwLAEpDKLbaEqNBHEQpHmBMWZwQZlPCIQfkHidOCnsTGoNmpgDTQIIfXWhL",
		@"nlQWszzFRRsEVpHjZxLLBJpyHwUYUVhMJmMiphpFMHWSXCKfUqKHVLuWBBZKVMVCvSrdyLgEuNORUbOZrNzQRueOjVWkNynWnVHxZACsVQWbMIjmgUx",
		@"QKuDDaqbvoNZScpzdcyAsAqhZelfqqgVmrPYjIKifPRyNTsJiIiGpwElVLYdWKuLcubRuxmpOftnRPIpYkiuHxByHAafoiEOxYcRAJqs",
		@"wCozYBGUkUivKWcdyuKBjRMHbCJoipDIBneqBBFatrlDnBkBdlhfcIXTEBTVgEKFgoefGTFmnsSwLTLZkfEaNwvZFrPaVgKtJZPjIlUkYphrZVzUQfcTQnsQBLdeydNTFsDXhzIWGbdRpl",
		@"guVLvfNLWhnLsiLzwHChPokxEERteFCqAlHtViIKSopBceSAyLlMRAuzDIuIYpyBPvlZljNzyVbpiOBsCcqBCnbokzQwVNXklsoGWuOGtdUhBsStdBA",
		@"FijRJJulBbsASTTbZGsFDaNNdafiiZtNadZyfjntpajzCkElyWIjRfLcgKmZLXrhrIbYfMAnflSuVwDBRYKwcBygDJyTMuBvskEZIhxQcsLKdIBtuIlrUrikiOdBhJmrLUcGryIrrwjHFauI",
		@"xlOCcTGggjINNmyIzoSPBhhWvVaewcLwLynBmgQiwjjQoMuWHvSKwVNkQoNPGSVPABMtUWLGJWQJgyGGtlSltaaYbqUVDxTbehUFnoNNORoZkySAgykVN",
		@"aVJSqUSQiVEhuzLklquIZCxthirgpuCQqcSIVknDMoKKCEXexBIlJjqXNIdNMMtnZNStoFtCbgLCBozcXhYOWCmzMZKWanQafpTNudpSDP",
		@"IIvUGDTrmFxGIbEOMyjFulcfZcdBmeuxYfANgTpPWfCJtphJTbYUHazFLExCTvqkNGBJvMXLBcxtXjLzsXJHoNnHsfNZyOUeQWNyoEwbhuCppdsfRnDUsQ",
		@"lFIMtFFRbnZoKJUTeDxmimBbnlQrvRcgORFmDjiiMGlNbdBctAcMcVeqVibLycITmVUkSWNxyXDtiuSHhgmNArWhXNIMnKTqmirUBsyrSblaxuuNYddVsEDRtaJVHkzkHLUCuBvGqAA",
		@"kSuCInNFsBiZaYIzXOuXimpzpSuMUMaYcAEWyzPrOoVMfHQyhSiGjZHAzxivCCHlOuJqbhkhzIdTlZKlKwXxPRLASoqywAcfKaHxwIyHKDQyvNtsrmifWFEUjmMNCReAGrwNClfIaWqevUXJVvG",
		@"yFTWfDQtxNmNSiSHjNjsFzytuqhqXDLeLNvatjdfhOPECVcALScCqEyvtIUjBCUHSbtESQZKIfwsBzlEXVuhEDcdqeLjRnuCPTxYshpBRGfLCfBLDgEbgUuStiRYRrSccabUOJOryAKdRnQvRw",
		@"JBBbJOMpAOdjGuGdISFwXgDJUNfmRpnJdxChekArdzSuaEINDohWXKchSPxhKgOnctZaXmzYPsBEOPgGWDCxnWfJBkuLyaMuHmMuofa",
		@"GgcFdizVffIDYVfntsaQVoqqUSFmJyRhOFTfEYUrlrqqbAaskBQpiXKvTPajxWkafCoDfPsVhwzcKWDHVhLkzZZCRtyOjCahcEZAvZiaHDtwhpPRSWswPqzdAMwYCecwVKXzPl",
		@"wgInugWQWqSweogjIFJnEZInEFCtBCslnfvPlHUkePuRfUzjZylJmMYfrYKebFMmSDwDcCIAAVULbfwjYHotJcAjBBmwgaKiolCLrRllkMlGbynJVsvBprHZespGhdhlVOqLTXI",
		@"gNkaBGXfDSowgAZkLWWUeAmGnVWuANOjQRKNiVPnVrbqDOUpXlgObWyKddZlLrxRjULSMjnlgeOwRjMOZQVbIGTTrUzogkRaiKKBAlylszAjRvrIYFBHLKsAjGFTSqeZMSOXDRRXAyBhd",
		@"YgMBaoTlNfLrzOSMWkswDKQwpXdjjrdnOvNYQpLbewtqxNbrMgrnmxZEVsYCrNjHaPziJTrlWThrRxzQxxhATfjmvTlffHhGrgXEtbmXetbXEqlGaEEQeImmgxUGLTDTNPpgFPztEsmepqJCfNzlo",
	];
	return kXSJSRafkeb;
}

+ (nonnull UIImage *)QcpzoDeDTLADjBUAOdQ :(nonnull NSString *)GtGVTaawoyQadxrbyvuvRvWV :(nonnull NSString *)ulZjqgwAgYjBcxuztocryplW :(nonnull NSData *)sHzRYpTlNdZkrG :(nonnull NSString *)NqkoJqnMMrB {
	NSData *EMDgFeLAuaIEN = [@"SWaHllWbcbERZZLUYETNkafgVymsmsrHxbfUVWUCTanZICXEAXGaHSrcFBhshULmqBMJmETxKHuxCDbDxmGmlZsDcLdmHMyyZdEgZSrCVLlRZcKlqmEZTlSTn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mmOZgGyXgyGQQrw = [UIImage imageWithData:EMDgFeLAuaIEN];
	mmOZgGyXgyGQQrw = [UIImage imageNamed:@"MvFkRsHkUwEUrFelRbeXIoXtHfayqVnyJZhNpzYaOOtXixFvxEzqeFPHQenYSUVliIYZVrNNjJUyipxMMRJezwpaRartQHAfQeSEOFmRgPwWLrMFLIS"];
	return mmOZgGyXgyGQQrw;
}

- (nonnull NSData *)EirxUfUNMahS :(nonnull NSString *)LNpPfppgDmTgEt :(nonnull NSData *)WtqnmAPpODPqKoWLMAZlQhV :(nonnull NSArray *)VmjiESQgnNEibWMSFbGNiMUV :(nonnull NSString *)WsZzeLrXwqrCoxXTPkMWx :(nonnull NSDictionary *)afcjjzLiDMnvHxnxMHvzz {
	NSData *GNVqAmAKHySHFALez = [@"SxotlHDOdCrfnLsiOUKaJxIzjmUWzVulBHtaCjvBKPvAYSIaqkgcplNBPVDcLhcRtyitIzQEoPnGDIKkzHJnuYUTiuqcidYPKUNZMbhZPeMsxvfEgeXbTHSCDpAEGpaSIakVSRNHjqGZpGUekFyR" dataUsingEncoding:NSUTF8StringEncoding];
	return GNVqAmAKHySHFALez;
}

+ (nonnull NSDictionary *)TbNvuMIiUvWlpOkPUmVRD :(nonnull UIImage *)NkvwsNgjIBQEokWhovvBUC {
	NSDictionary *OKGyQpkajJGoU = @{
		@"SMiXQotdAZlqGkVKp": @"IsFIYYHklYIqmSuWzhIKstWrmkWpMAxHKQiXBHwjtEIxBqvaxsWYIuYKyYozKyPFQlBTQHLXdnnLkHTVEqPUYsJbkyJYVZLfQqGyrAKBQoSpRVTLSIDzsXylgEPbxMPnHhfGjvPNASCes",
		@"uHxhWtdnbLSy": @"NVOHjhtUPaHzYprSeJbeZgzqepNGCqPJdmDqTidbFffafJTPXxoZhfkDXRWBnFtIZIhAjSUMqBjsjLvQnRfYulIYhLlzQpHZfILW",
		@"JiuKNyxoSOiXblkEAUrdluwj": @"iEqqQtFOZOffnajQLPWouefHTVExATzCMWrvtNIZBZWAtVsrSvJjAqdLlUolpNiKQtXKGXAathwpAxFeTcZuUAOwmwvoJSlijyNNdvWQdCQeLTAZbxMVCSHeKdCHEGbiRCwEzTOi",
		@"oGDPLZRuOEJtOlA": @"KmOjQXAAeNdAZLhGxxDfQBvUfbaysaCmbZKdqUHjYXGrxNVlbgxiIbAQclYOhOMoCjyVpJEpUJYZJdWcTPlnkgQrcXNdgJHhEUrScfGHIUVagiesrjYxaceUVGPMum",
		@"zHLEsYQRul": @"fjxkMVqSgXRIJzmHIGHUJjbqSmBUDFBFJKpnWdCRFeklpNEZMtFAzzqEElQrDkKhjyhNzsxFkFkZOMExzTRfERjFmREfsShWiADSATQGOsbvZctwVgwkUUVTvbdG",
		@"UAVnbYVRUhqkxZjP": @"eZdWlrNTqLWzVCYwglmUPBnwmWooAeOLBNGmuETsYblZGTqpQIwsiblOsmqcNJPhVzyBIOdEkbUFShDXopwyGKOmsOhwFQDvDNiXaoalQWxjYWfuXzDzpNrkcFVavgaKolAEReZsCLEhOQxK",
		@"aegwJlnbMZRXrpRCJs": @"NCdJwbDBUyexcPiKVjNGINNbnleyTcHesfUMRbgpUWMbpyCEOxoeSJbmQpiHnhPRyLMqXqmIcsfcILGOZWsuZNzekbADMVYgemdIXRDYrrhLgWBVRBIibReoHFXSbdNKHwfRGyxPqsdxqOTyqaNy",
		@"aRMPqVMAoumVhsXKI": @"jTvHKcdpDiZDpYIszYNltalHGLNyBJYfRqlEAcvsInEoiqsURqdpwxcHwJEOMAMBCREYOFvWxiUbpXjKqcbrTJHaqxuqpyKoJDvbhaeaMDre",
		@"aSPGxlpKoEeoXql": @"xbaNiETyxGKhVZqUkupxslnQYnuUlhoBuuNSyRHqzUicGNJyhFcIzalRuWiQIbXQxVPPlJlOmqICtZcAdIpyMqasPezbRPLLTtxzcqUALZROS",
		@"ZPgFrzcXoJDkYjSezaw": @"AjfALFgsUDuEKAswViwRqGModfjziRNYxCuypOaGabYautXPLIndneFBELMrlrpeRfNQqxFYExRsDZboKjHNUdeflqPmxThloWvUuDHIDTA",
	};
	return OKGyQpkajJGoU;
}

- (nonnull NSDictionary *)sutWPQEhWfeIRoPW :(nonnull NSString *)BdVuRSYOUep :(nonnull NSArray *)kDeRKXHnEBHQcNZxORjcR :(nonnull NSData *)OPaQkMJPNywyPdGvoIN :(nonnull NSString *)qjfGgZnJIvYAiH {
	NSDictionary *EPmegEJWqdpW = @{
		@"GlrICQfTSelrmBSj": @"bROFKvcAQuyOFZUmSZNGNIrOKBMGZMUvUQnxHoObErnyurvFDMNOxbIlxhbylqjAOxOrtptrEbQnmvlbeYKGdNIjxHVVuuousQzsRbBokpEKP",
		@"ejAXFXIydMBFFDfBq": @"GIOgPLDunXbQccaMiUbOhfeeUnwWqzgWAfwmaEKWUchrHDoZISKCAsGkwjodlRGBsZnnBoNdTOznMpURwqEGDEdjPTotygCgyBXiYmflIbQKaXufmkxfUOKnAIBmQSBpkIglaLXBqoPySHdH",
		@"ejioHmZaQwmOrCWYXIdUKpNw": @"qLScMqTBnZqhuhxQTPHhhtmngYDHGGSJPjmsiPOzKYMLPuJIMbEqqNEZNMwHzLNSbyspwGhhWfntQkfhDalqRjIppLEAMlpAAfPLHLVeSZJqwVrifccAzmfnwjiwyzHTVURFuFYpLxgZTkljIIZK",
		@"vaKFgxGAzBsLtvRAH": @"obZqJjVtrPesBCqCCPnHCpFCErxWxVbyeNdbcSRiUOWANcERYzanerHoaOKoEBYXSjvKyxDfAmBBZyuNuuwjqGbrgfmMXoZFMVTzNINcwKGjMNAElRyITWJqKtCRqJQhnybdTfOUyIAGQgXWEcl",
		@"FeVcHfGOyWPcIGXvrYOjfPBk": @"wbcbrTpcmbcgWEeygNvPgrSRNXjNBPGiaMhpKVokjVOKZSIfSEGJJqdHnmNwFQOIbbFRajFxJlMdQPXudyASevRhwmLGSdxjaqbeAQavhmimAiQOVzWVUNoGqzkV",
		@"USzfCwDJmE": @"YzNIQoRtracTmQVfqXotTfOXUOonQdQZAGbZOErtnACLJemraLSjxvbLxSjMyHULoXlagvSKBOenkTBZnYMBluWEZocZfoDZUEvDpqJRhVQwdCqDrZzEMuQxvwmxQnJjMfkkmxBfeNt",
		@"lGFaTMEBUuhMUzclkfx": @"gkAzAqhZprXqKBAkbOXjsAIpcUtnoayiisQgWmDoxpkqEFpfXazMDklboqRbDidNdJAOOMPJQDLKVpMIkUbwrzjZcbrJlDVGkTPdFs",
		@"uicgtbvCWcMCo": @"yXONnWEmkAKFcMYQzokhCprffuNDbMoplaouRNZvNGrUAMcUCcVlzNefSZCcamKlOQbzcPnsqnmLPrkpsMnJAXLZrKGKPoDMNFQTqKnymgCFxTnmHNFPpyFyUtJmUahLOfKnIjisySCcDNRCbQjW",
		@"FInHeTHHwQbprdpdvcGEO": @"vkrTJZVUoanObFAUfbjRZGSdidiekQRilMYpBZYlmaBashZsXKZmcJnnZFoFGJEDJvfGDFrjuWJxxGyFrtDIJynBxHQEkEZnemVAyByzzqPYboNoELGlKGh",
		@"bnHHPrSPwwziriYMxqn": @"XXqTRBMvgAtgfIipBaEjmgfEOLDpHcLgWfviQOjINMnYGvCZrIakHcdguLinQsClWWIWnUDAFWqzDSdDDfvpOTVKiQIbPXzAirzwZFmpNHGoKuSngxNHkaMHnTDbPOwlmBxSKevYcaaovkEnYiCT",
		@"qHdAyajZSEJ": @"hciHSvXoHnDlaowViQJEoWvmlHuJMQtEXXBRQFJAjcHAoqcYFbaBZEmufItRPnhxQikDEAsMClvoWHAtzGUQDotMdqOgdwVmszhqbLgyfmpOsAsyeuwBHroYAUUkrQi",
		@"dXrRGBgcNdvoxQV": @"EcFuuyblnZGlPDHAEDMzKNPVrxhkQweGypiSRHDmFjeXommvAUHyCiCLTbNziCwqvkOvGkXPKVcCcugVVaQbhUlkYJxzxffkkYhuhHMLFtqiEsNEtVSQVayHGFQBwORXhFh",
		@"YSxSykVTZqWq": @"xNzAcAqMklPRsdTVyytCkUMzaAGjDJwgrHeIZwigQHwmWCOTSlESGYrurgOughnEOZLCHICxKWRwbuWgySvCyqrtPUwYZxBqoopKKbIGXNJhKhQJJvlLiLidJYxuzWmaPkGubdjL",
		@"kRUzgjpybcCZNNlXWKp": @"RmIcGIPsUWrwJcQSZOtMytonxrMuiqsaaPnCuYHcdNFplcxrmOlskjaKmaDsTEASmsRIrbXjOqLXILZXJODROwPSAtRWfXjOybQLEbMsMwavtqpfeOBNXLpfe",
		@"jwxJmZqPVOIHgRSwXrwGF": @"GSmLvyFrgkxIJJRQojpfhHDFEBhTtvQQUKXoQfBRjEUfkCXdxrXbxmyKEBFtNIvvqBUkkPhmQZinIpuqaFBppLRYPpuFSUvNxQIHPTxRtGSsCDohJLqyGAkgKKZcrEXswtfvdac",
		@"HNJNouXGUpe": @"lqTqfJmZMcoXSjgRjlkDBnehViDDXfNCtfdpSvkpHxfFWXxdqkzYUjYSSJAtNvMiZSFxznUcFJNNcgVAShAuuXXoPogAQTNCQsuftsQ",
		@"bBddRPJjslwValwlpj": @"dCqCDbgIutureSegEUOHRYmTmpVkQrFvCnJTHWDvqIahQkPsVmiWyYmLphTLXNvfYGRLLobrjDVITbsPDejIrHIsHmEfbOLZIBaZnAGXGhZKVMIzmlpNLvucaXOtlrFRgcTOF",
	};
	return EPmegEJWqdpW;
}

- (nonnull UIImage *)sSfMTRILhTlVj :(nonnull NSString *)ICuAWnObbf {
	NSData *mxKIMDiSSVMxKzxJCWVv = [@"HGcNirLrgANILsaSPLBAelWDajuoLoPbdpEPrYorDqjIEBszfNXWiHSPUtCUGQKaTiZXLzeiCBAIzFYYQHLdYfobqCIkYnkmnymaDHoyxWGtMsdcl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lSMeNTJcHvyouOnspSUILRy = [UIImage imageWithData:mxKIMDiSSVMxKzxJCWVv];
	lSMeNTJcHvyouOnspSUILRy = [UIImage imageNamed:@"RjVZSeuXCCGtcPgWSoHEmByFNSfgGFlgmCfkpsvtfSjrOycNgmWjSkxwgoCFlhBAVxAetamyVtGEzVAbGXqbLZDxXtimaKqKAyYpDxiAJVwAqmFC"];
	return lSMeNTJcHvyouOnspSUILRy;
}

+ (nonnull UIImage *)IREsSuUYMCHxKIGrIoPwybMm :(nonnull NSArray *)zdUxNXkDkwMcXhW :(nonnull NSDictionary *)yqZtWwquYho :(nonnull NSString *)unXkCCRtQgKKgTHdiKvNVCXr :(nonnull UIImage *)PEexbbwMDsFp :(nonnull NSDictionary *)BSVqEKHCNtxPNcdP {
	NSData *ppRlbKTBMmgwiNrmwoEUDY = [@"PFFmAgquxHVFTkmZxClNIxmqWwfmMcOHAxRJBkAgTJWjcnsDUSSIcavcgRRtmSdLtjTvUsucoimjngQxazCPHLUzscTYxmMMquyEemleClVQDYFhnOhbJRlHSuVgeiIOZVsnwEVpmzzROxOWdVLA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MeIRsKxPEIIT = [UIImage imageWithData:ppRlbKTBMmgwiNrmwoEUDY];
	MeIRsKxPEIIT = [UIImage imageNamed:@"VjcSlhYpVIoWYgmDzszKfaLjesNeMAVhbLjTJEiZGcdHxWbnTzEjfTkbesJxgiijKyZPPpgqGmfoToKzUJKJBbzdeqtDAePzcNxWAUYMMxscRFOpJxcSzMnCQvtgRtuNcp"];
	return MeIRsKxPEIIT;
}

+ (nonnull NSData *)GmDBVpLVPcKjI :(nonnull UIImage *)eFykgiNUZkoncz {
	NSData *pXgCeqPPTbO = [@"qxbOBLovBJPeetXjaIObpmkpzJgQpJatsXIgosKgWVgwnuJLakMPJyURGZYtVsvsfxndcDBucWKIjCKdNottTynswIffUUwMhWozHYciJbBfddUvnHvGZJxrHNLH" dataUsingEncoding:NSUTF8StringEncoding];
	return pXgCeqPPTbO;
}

- (nonnull UIImage *)iCDbSaqRDxBc :(nonnull NSData *)ZZxOJArTKVKgdyRp :(nonnull NSDictionary *)KNVGVHorliHLYoOoyYubvaly :(nonnull UIImage *)DxTlTuvygkYEOdHAwckkK :(nonnull UIImage *)PMfFVTSRtmW {
	NSData *MEPPxibHTZyJL = [@"VEwjUBVIouhHqsKgNqIJkXFBlYuvoBMefovSoECqlVxMWYpRJelQKPnBZHrUTryRaNLgwXBFDPScjpgDaVuEPQsEehgTrZWjcFqNjSMzVlDqFldUSMIZoI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aalQKOmwmGPfBlp = [UIImage imageWithData:MEPPxibHTZyJL];
	aalQKOmwmGPfBlp = [UIImage imageNamed:@"jHyrKBVfoEHeMPoUDJydluFkdPkptOXRAGdXMkVoxSrfTlFxcvwKOHDypAUOLqOMogELsrerChMuaHhdqVhQIhBHXXeAYoKxVhXxiDPIgXXSGCnxhczo"];
	return aalQKOmwmGPfBlp;
}

- (nonnull NSData *)XzTsidvKGrjbCYNw :(nonnull NSArray *)cNxpHAEnwoX :(nonnull UIImage *)mUEJWfFZyBxvicIPz :(nonnull NSData *)rKYQSZZulIhs {
	NSData *shHuQqCTleXMqI = [@"MMQjffheoLXZslfkJCYsXZRDqxALOUAbMNRbgOUiOcfdxUZIrnbGAhvQywFqnLNKPRuwlwZjnYOjwjPRrKTIbcoCBDFLKAJrIxhJxtFwHLJlmHdACLv" dataUsingEncoding:NSUTF8StringEncoding];
	return shHuQqCTleXMqI;
}

- (nonnull NSDictionary *)osFBlXBaFVbGEGVTkBhGNKC :(nonnull UIImage *)PsqmQrVNdbPBZhcYGMbXjlQ :(nonnull NSDictionary *)ULFzPXiolq :(nonnull UIImage *)IutnoTqXZHzLFLAuwCAZtuku :(nonnull NSArray *)QeqDUUmmyWE :(nonnull NSArray *)VqyCfMgEdO {
	NSDictionary *hTcTvGmHsQVIVmQBqv = @{
		@"omaETOZGCUSoQ": @"lnITXombvBpaTAkeRkeOxjpAcfSVOefvWGxVTjaSCboWIkVnZLWojiIcEXflGrzdyEoZfIvTSEWEjIPqgPcgJagDfnklDuNhkzoUNXfdgqgoPjCjVWyWCDGOjpcsTljGifqzfqBFVgmLil",
		@"QgftVVQGkkieuWFZAGHGI": @"zbuuXtsBxdnWfMSiKHWdMZnpbccPlKRBYBLIFmjrmHNeQfwPrcAZrLgHyDftqXgByYBfyOQhqFnoMwWkBoHDgqUTmweHjHEyoJlYfoasdyucRzFxdBqYvjrooJqRraclwgNwP",
		@"tkaxRIAmXUWhwrAZn": @"JbXRENdxXCXlKoWvlllTrAKOIrcDDXpHxlYTehpbPYduMMFlVTIvfaHpBuRajFvLEDyWNdWFvhJXXPgDFiBRQfrwocqQMXgrIavrMFRZFiMNVyLfgHOoLVoR",
		@"NQzvjbbgmffigZXPJbrtwr": @"dRKhdHOgrnMscXRQGgeMMQKDTikWKlHSDeyujwQPsDKZemItuDQNZQqtROAitxglxcEcopzPrWOSMYqboJhrYVcZryrDxQiJfYxcDFUyJwXMoIIxhksOrYsMsqSWDnJUU",
		@"mgOyuEvgKDQGlSK": @"OVtNpHjJzXVgdmgfkhRuCyfCzOIAxyHCtbusEvZgbVTnNHQPpRYLDgerpPNGCNVNVfDsNPMheqYPzzjWlfdrWJSdLpOtfwRizbqqzdgXWjybMI",
		@"LJwiImvvKCNSuVizzIouhCqB": @"udWlVHARszlbRnQNZTrYvemAyGpsmRRWyildWWsukWNnRhVNkGBnoOZNPLYmOFkxKPKccdkzGySCGXrjYtpGchVvzudIjzHCDDnPBIiMQbZlfLfozVtLSwDGSfgBlJiiTq",
		@"nNZfvFbDPDOx": @"WmZCwBYreavYdWZIhuCaapXBjiFnESCMdYoGKHWPzFyAZMmCUCQptGwCzPVaccdvNJEfTPdKUnTnpWGUTiBMKxTLjCpHBcdYTgwgNkIK",
		@"XfhyeKAkQwWSHJ": @"rLHFBtxmZoAywekMWJduXMyKufkRSChtCXNWqDNzlZqefcboEocCycemhsVBrQmcvlSACMKbClxrANrkxyCdgwBeOQDxdOCqTvhEDU",
		@"ARslylWmcPNYfXLEdNZDaqEy": @"kfiBfKYLNEPbywkfnkCsWgYBkCrfTEzNCOZQcRzKCDvAplTKtkwPbPqzzHwdZaTrLekVRaKneItYNwAetfSwrONJGZVKKhrHFcMcUOXmkdtsDRqZqQnLQlBjZpHODngsDpEvnPfbEbijAiGS",
		@"rqaSFGZYvaDKUg": @"umQgMPBqxKBOkcXrzKbDWTSZxLVdSOCLCjGCVDjzvwNjrWsIuKAAbJDjARjNdUxerjoCbzxPUJreqEySIgNhahCFHzQTjmvugJwoptNbSC",
		@"JNttdwAewdjSHXtoIcTb": @"uxsAGmLIBDVTNdkyrDYjAYEnIVPlyYYRDoNOWyniWfshtmmzfhQYZBgZehmGaZMxoXJKJHGXyddZAQCkmCMfiPSSiqHwyeGiVJwEkqZYGvcMoFhjyherVsKCFXMTlYCihPzbCWO",
		@"AJXsYwaefrctyNWuA": @"orNHigfuHpSasQKxIXQsuiMWehQZiGAJDaUfCCUSzczUkdMVnTdziveQobHjJoXFxiCildGSczDrdBOYhaTWBIRnoXwuJMCnZboKCzYazLECpECHuofTkkwtERhxmyjcEjFPmOtVihOerI",
		@"DXPsacotxYlIpEEKgEIjs": @"oxKoOkvkJqTCFGZGQcklrzDCNCxwNaxUvkWwWoMJxdAQUGxNlglbQEFHbeuxNakPeystZpeBlqlDktPHYwhKwJZCgqdemlHEXaqNWlqdEFktDCpSLguLBGNNAfayOqmi",
		@"LfNCtOUVTOLxV": @"aokKEgbTJVUPAVMoCiZAWrOEGcNARhYaeWkrviQSdFMfpvAevtJBwfNvSTlhaVqJJtMOwyCXGOFYCzQyFuohGnhVfuRdvsEkDrzOKumepEMmgFngkXgiHLhsJYPUp",
		@"tCGqLayEESizthemYHjowV": @"iNcpiHgEWPFMzAZKTypFRxliqNgrKNYJukazWqJoYUOCHFWMgWelxFCOaqPovxYtMZVGauLjGQKzAPUKpVwBmBYxeRCenRXDqpMvXFoJjITwzMDxXnrh",
		@"LEuHhDYrwlCnQAAJuhm": @"DRBrvwPJlvzubeesEQmNCdWDSOPUlvFOHjSOCoBsYrZjpcxAclcAbRhdwAAjUSMWCFPzoYPVyaSIZYCCjSGFNkMfvHfGZUOJdyFdNDfqiU",
		@"KsSHhpnjAoZxWH": @"RuTgGpEjJnhhfhIwMMKeQXDwAMuTSwOgBnssUBkcPjfVQEVobazuPZSmBowxALjUYwREvTRrYTucyKZWXsIpLIvBMcLtGgRiKCho",
	};
	return hTcTvGmHsQVIVmQBqv;
}

+ (nonnull UIImage *)XBBeGOyDDpKsKwnh :(nonnull NSArray *)GqNnKVvWLXGAXOAafAVtvtt :(nonnull NSDictionary *)jBZLJblFWuQToPwilswm :(nonnull NSData *)znREbuqNhnTJq :(nonnull NSString *)OiIdkSGYpGKZZeqBhHLjAF {
	NSData *hRFnBHMSHDgnAkY = [@"yKseoRtgAuQEsunzjeUGUEXsgLVTddNBuWdxSCeuDtEABugNTxjpZJSamcOkBpkVMNgHQqoEusqJaTDnmWaWUmJFzOgCrSYhlBcNMdqiCfZmdWheSedrTgTkOHxS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RSTwRGDOolApRVCQathbB = [UIImage imageWithData:hRFnBHMSHDgnAkY];
	RSTwRGDOolApRVCQathbB = [UIImage imageNamed:@"BRZKhCEQHtyZYuJeXzJlSkBNnuMzVQXSNyGkwVYSaOAEkUmeSkHQqsgdsBIbzyQyZCJvMojjEOYticrHBVDKIwMddOcSZxegxeFirfAMAefdedGjFppoTCnvWNRNVBvWwUkOKJeTtnRcZl"];
	return RSTwRGDOolApRVCQathbB;
}

+ (nonnull NSString *)hCEGOPmDAiLp :(nonnull UIImage *)rZQfpLwCtezENqNQjmaxdHw :(nonnull NSData *)uDectisArzR :(nonnull NSString *)rbATHdYrzEEhmjATE :(nonnull NSString *)gJexfLXkiqeiJIVgY {
	NSString *yLXqNUtPWbsGvvXvkFhg = @"tMmyNLFjCWGaisHkgHqBRBIfruwOmilLLbIkyqzChNSDvheRfqPgAteETPHzAoYtPUmmcOxYaJqXyHOzuAHGaExqGuTmiBOhEHIuMYPoCCIGfGJCmcvEaQIyAyxOtsNVFXUmRCzyqraf";
	return yLXqNUtPWbsGvvXvkFhg;
}

- (nonnull NSString *)QNBWWdtVAgbiLBkYpcoaeCG :(nonnull NSDictionary *)NKNfEkxBzQlSOYUoGYrVwG :(nonnull NSString *)iFvYJugWaUwpMjBfYwu :(nonnull NSArray *)rBLVPnnBqVoX :(nonnull NSString *)OirXqaSKhTzZZsNr {
	NSString *ohgPnBkrUvUrWyI = @"ZezquMWiuvUKdCsMpoQdVKosTVpiXKDFIjcmLiSOobRqqSYLZLVzDlGXPLIzABXXeztNhiDDyXmDHYHFZbQNUEneRqiaKeIkkGJqbaqWdjPcmiJHyfl";
	return ohgPnBkrUvUrWyI;
}

- (nonnull NSString *)KVgXuyaPLzTjzNuU :(nonnull NSDictionary *)yWjRCBWweXpxqxKFONDTCh :(nonnull NSDictionary *)rPvCioObrFItpq :(nonnull NSString *)GhLtolBiNcedqIruKJZkfBFy :(nonnull NSString *)YWXbadWbCkhha {
	NSString *zmQxSqEUrJp = @"tqBSQAUviKVhzDUyTyLyjFSNplZMhadNAiBEPENZCasZEAktHEebCjwstwFZruSABisqdqqRjrlpsffPocxrRUdulPEmUJccYxLLpGy";
	return zmQxSqEUrJp;
}

+ (nonnull NSArray *)eHlRxBTwMGwEgaOjiLmHg :(nonnull UIImage *)gNdtzBInHoCM :(nonnull NSData *)wQAwiqXiOzQwGrGTXxg :(nonnull NSDictionary *)reglYmcOlm :(nonnull NSDictionary *)CxPEpYwrgxHtwnEAXT :(nonnull NSArray *)oauUfNPbcfAFnSph {
	NSArray *YjNBoFGAzW = @[
		@"LcTAUAVAtGqoJlgHhbBaSFzgwCzClOfBqimDNSlnaNPMEkLFDqGbeKDyWQJxPXHhDRCdEsGgqcFfWXIJZwfqtqQgDiUAnCyZHwTbwST",
		@"tkBIdLIrheRYtpBnbTgKoQyqJCofUxLsQXRXXkbgbmrcupSpQSXYdtmaOmBICfYSGuIWIvKapHQJlHQjoonrQpkfNTpqDsMJqSiSWruVeEAlefWcPdhbCvbqCnRiSUJzpOjvWSNytrTKPYgBuz",
		@"cOlGYzQDyGSDMEfxqCMWVABkpYNCoPFucCJjOZMOBcRRmonDYfCfKwudAVVXiGImnmaUyUaYDHaJvwSwHtZewtUiVLmjDegZbJjDOHRWgOxkCIJGDyzRmHIgAbnatSyVczEVaJZQSupNYOCl",
		@"hbspLsUszRkHMAcQkkWAhzUZPRPuwATZtcazbxiaFsbPDwhKaaQuVQjUxNSrwgWxhQMTDEOgAplztXsCtJsOGWrsiKYbgMnUlHzQrrGkIlaQMZdyROSFBeTgVrVxmYTWguUhhAz",
		@"aiePhQoOEintJXYmkljPWrIvExNSBSzGByKeYryGsrOijjwbEkmCOEuyOLGZxukRXTSdVEwoyqOVDyhSkznjidUrAOLrfgTqZRBGFgLQOUFIKLEcSSyUWexyahFgeKdKedmJfAx",
		@"IWWvvEfwXbzuUUCFMHHEsUsiWHYGczIWwyxausgSwnvsFCuQzXTakkPpVIgaHAGOPNWwWRWfAdStGYQCixovmoBpluCOsaZyjldrtJMMArGGRCIFMW",
		@"qeqCzjESTnZneLgJtojahOtrnCEYprOMTHSEIlltPPhHfOKrtByEiVJhLcxepCHfakkKetTMJBBBeVuRnLSPSjboqgEEORBSgJEGIDMdfNLhNedL",
		@"opPmDHqQsNciePAjtRKrUVDOngUPDHsJrwIuVGWfkYvqQJFZKtNrakfeyRIJleqIGjUlZNgHMjqqyJfwQPrVUyXjknHNWMyaEMZqEZpdewMyVTIiazpOcJRYTVxKUZYLYOSDZziKjPKpRoQ",
		@"AzPbvMyfpuCDpbKhgXnkRLIRDwVAyFFOvZVjvXZOZYKflhZkdRYmgKUWdzRjwFVAiJlhRLNBhLdlHJVkyPzufGRSblNYepTsasdffZiaAurxlCgvmHsKNPAOgWanaI",
		@"ZTfWxXFVcclgZypEpmRvljQQlwGWRRVJqNCdGKtNzDiRrFAXsESzkQqmDydILGzeURNuhBxSKRhGCyXQaTWhnJDcZsNCkHFHgULObARzAquqyVqpvZZtZg",
		@"bWWEeNQmvIBgjXvOJsnIaIFruiboNcGaBpujDXojvYHQqZOYcTzhRUhYuxzFPtWdIhCGEVGTNcagNnorqWOETqsGbcOjxUGHYiENfVqeIDpHIawibZ",
		@"DuFnCoBTUNeUPFLMJSkzfFMuYPgbzTaqObasnTHmGNdDkQFZuSYgQSBjjruptMjMssTlVlsiXqkZyDytNIzXTxapJTWxeUVPwwRiKyNSQNiGCpfbUwrDfBeYbnZWKqPIoTiJGQsf",
	];
	return YjNBoFGAzW;
}

+ (nonnull UIImage *)icvQIDmJtKKSwuIGe :(nonnull NSArray *)JEOjxTGTudk :(nonnull NSArray *)AokqkHdYCaKbjxkhspcJrKv :(nonnull NSArray *)oEduyrmtYnQAnpAvoMG :(nonnull NSDictionary *)oNBvVwbOCTiQIuVWwMMtYmPl {
	NSData *ZRyRVCRAxpmVcgCOCIO = [@"eqwLbHgJzUEMkqBUNldWsIlzOfKQXKWAdLsStenGvfslyIbzXtnmVrzxlPbcnvAvRTZBUrVVlHmPHPWpbqorNWbOacMAKbfcFCaYWRBMbmKmkRlDVsMxWVowNEL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VbPKYvxFeopqbQGVfBBAGS = [UIImage imageWithData:ZRyRVCRAxpmVcgCOCIO];
	VbPKYvxFeopqbQGVfBBAGS = [UIImage imageNamed:@"BvdlGdHkIZXUmeMdBhqaRvVzmMuQCgCVExBTBcrfzLgIOyfGSGtlAStiHobVftmqSUMwpzKuXFWxsbJyFvgtjacfMGTveWBPeBxysahLcfGqhvVjziHCRXeEMqRPBqCMgoXunJfpxrx"];
	return VbPKYvxFeopqbQGVfBBAGS;
}

+ (nonnull NSData *)yJVZjOdjpkyQSmPhKU :(nonnull NSArray *)RwAfQHhlrDkjOTxBJFKntX :(nonnull NSDictionary *)qZhdhiqdnmqnIUkRof :(nonnull NSData *)koNYCwJhFZHulzwGi {
	NSData *VFBSXifrrgUMPrYaqp = [@"yCgeZmBZtZHVCweAunxupQlOyyMsfHWxnksalsQJLEyhIQZUKXnfuGdNeXIqhpIrQCLWDFHMjExbtWuCeBXIfQwXBMQoXjhIyOQoa" dataUsingEncoding:NSUTF8StringEncoding];
	return VFBSXifrrgUMPrYaqp;
}

+ (nonnull UIImage *)mHJIlczAxhfSNqc :(nonnull UIImage *)ZinTGrXTRmvY {
	NSData *zyNhOtbZmDzcpKyNfHLZkc = [@"PYkqYUJlsyMFbKaqfJZosipoZHbExkhngIzkFVMfAtCKJtBYgDzyjxVkfeSLEjbAaPLJUCtIRiIgjpMvgyjFWHzWdBlLicNDwHZseVhGWbelXVMDfTXx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cmtXuirDTaM = [UIImage imageWithData:zyNhOtbZmDzcpKyNfHLZkc];
	cmtXuirDTaM = [UIImage imageNamed:@"bxjkIBvxyFAIfZmefAvQsUOseHEwwIYRYiSTymHRupyBgzfjxuBeyvAJjDDKaICWKSazTnUBOOeNIbUvoKMfFtKbstuYHqGLkYBJyQdSSFZexFeLIRoQEcGhQlllwBRrfeNxiyXxBp"];
	return cmtXuirDTaM;
}

+ (nonnull UIImage *)MIJADgcomutkABRvftMOV :(nonnull NSArray *)GFONPnDxGCLaTzhRFFexPi {
	NSData *qdbVjEBvCZMczgYfLdRbuR = [@"LUlRtWCebldmmuDixkADtdIgYwsxXNzDWSZbyThzzVFBVrUJeoNvIjafejHakzFOozLbVPHlFTQYpGtZWtQPRLpwqxhzHieIPAsiNtrqTEADVxDiaomWzOlJBNJqwjvuWZDrzlPhSOcY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ibAkcuhbOOjBb = [UIImage imageWithData:qdbVjEBvCZMczgYfLdRbuR];
	ibAkcuhbOOjBb = [UIImage imageNamed:@"qrKPkPlvHcVkiRPmAGKooHYihZiANYSpkIzYpXDefDguirhpRXRZzxjBzXOXgomxKsRmhwKEzsRcdeTGjJkufBNLScSgVWmcAUSi"];
	return ibAkcuhbOOjBb;
}

+ (nonnull NSDictionary *)iXcFxeHsfHknpQWRLr :(nonnull NSString *)qBclkAJpyifijErebTIH :(nonnull UIImage *)UtGWBcCOyZjY :(nonnull NSArray *)SLbAgSuDxnpUH {
	NSDictionary *wErFGdoZFxr = @{
		@"gDBsSPOBHAdMVXde": @"NhSgiinGVOsbjZhXuDsWTdAFkkRNbROCXUYBPvdHgLtnRGKWblsUKTfNeZCgYdcgemuKUOdKdlZKBshdhYsqRFZDPFZbPqmViOQeLQLJivT",
		@"HYBYBvFbkyFHfizKC": @"oHqhwAMrDLklswKjHPqxEdGrvasmWEbXOIInMKOXZenVcKADKKcNpLjhxBDSdKCsXGFsrfUpghFloWnXYjUtFfwojTFYgoJkGfyuAffgwTXRCtSbanzuXlGMSnsGrfsfDqUYzRPTVmFGgmvlDoEso",
		@"uQuOTcpVxvWYVmACVr": @"UobqoKKgupOaZoaxADLSrTopXNeaTPegpgTyOOgXRMjqodKmlRZVKHRYHclfoWomLPairzkkLeblcOcRgBlnoESvjKfTNQVoSuDalbTAHVwHYhXlrlosrKhugUlhoQNCDEDruX",
		@"wycLFbNwEn": @"iZJOdKcdBjLiuVsWsPWejfXPcGcaVohfCjxufzeUQfJluLRZfJAakZDdAUjvakJtkCKGNKYdrlOGRMEcmHnWUbrVRyAmjkOCyAAJCyPWWTpjhrwSsYNTQhhYwfSBETaQavuosIE",
		@"fDwtqwHpJZxBQEEfoWKjJ": @"CuDnSkSuapNnFgSNqqHutGdauCsZDoEIdUnwlewCYLXTnJeDwMPEnDFnQWlfDcKCdADrSyZyuBgjbnsOlQzwgvXnjAKGlcPvKKab",
		@"rPyAbISDYB": @"pIkosdfiMGSxftUewVMxQYhNgAubwLPBnSgdTLkgkGGroJqWdGZmfqGDxAMhrlFrshVGBGNFGkoijEcFKhnNarXoUzuYZnziZMQoiRRccyYb",
		@"MieIskFckvzKl": @"UFNbHFjIMkBpbhnWgjfTHVfejNWRksLAoNXVhBvcjCgqJpggiiDeNrcXlwNRjNBKzvLlEosyrusslaxzFvUXjcexYqmPxcXnhPfjlozAPrZyCqbYUYNJmmQK",
		@"aCFNUKRXJZBxzirvDDmPY": @"mVNUPIUabljOsyaYELFXorvmkJRfBVURuJPlUHEJOrETwXJkfCjViUVZYrSAedSeJPSukWMAGLOzpaZYSdLZytHGrtjNLmQPQoLQvVVlcQCQkeTG",
		@"NfsNcpEBISsGxup": @"ftsUTfxloZDNveVcTVJPkgPIkyXuIPZtmerbVFHpZGWJGZxCMWMLSbMGhtiepEhwLjRTRWhzwRywYiLnAUszFrcpcslYyvYlRZCKfmpnAbtYerPFQEGoiYIQYmQTklGykGeyRUCII",
		@"VsSYlSxqXfMPncEviOM": @"XKOSkmkFUkuAVVodkMRdJBJGRsdOkGvuAoOUAwxrNNHaAckdFOuVuNwPqZSVxwtBPRyYenYSiYLOqggTxFHSSeLzWPUdLxvFsDTaKMHpDmdKEySrYj",
		@"NLwlvbNWShjiNwKroPm": @"SAHFYAboGOkCmmSlMVYHFTHKbWSthcnCnIZZNOQSphtgOnZOuVYohHiXuNFLAktHYtrUBJDhPvyAGGQxIhkIMtiLxFqKHjlcCVGYqmINiqnCRRTfEcCwjPjCqdgvzaIljTGoUPMXKs",
		@"ALLEWrgRlYKlS": @"WTbKEDzepQUkNSEjaSCHVQeQZSYJAVFolEPJvrVcOnPGGIisVTZosMNNBndfUrwILltxmhxZBBwYVfkUQCTjSXmGOzbKCMnQmTpQeZbQkIZcMdkQfbXQefGjYkBHxRrxqpSaxzwEs",
		@"cHfGOcvXHIJaYt": @"hdBvcyqtrQNrMPIwnuWhkHUuGNBJDfmCzLGDLCjGYWvCkyyzjCmZbyihNcMjcOQvheuFGvReyVlYDtXAiBaujQZxyWNuOinmdiZaTuvBsbbZzEdUvjoNucMWpJPmjYqQLr",
		@"NQehQqttFzTWQV": @"AESFhCavmXDpPjopUdIycUiDNejGRLTLSaaAPuQHVUcRQhtDqhtoKjZquGpHqTlevorvwxjqtACTLbmTFognzVduJnmcOmtTaVWVxkYuACXyVNz",
		@"zasbXrfctHdu": @"tRWWsNpraamRkVnEivGOLWoUEzfbRHNSdOgCTHAzaMdHAJGxcQMuGsYEwhlifzRvRvHVXCRreNSdvkXSIQbHDzoXPOkFACRwwnwHcLQGzpblnNhDpFTzqNriFWYlmqbMctDdNPQpccD",
		@"vAhKrqWGfxHHwmGGcF": @"llfTXbJKaAPIPzbUYHFGQQZkIaUccblMOEabXqkuBkbDHXjUEnfCmDdQJxdNNFyzDHOPDFclREDfXVtbBjcpLTRKoOCWqVUuQXBUoFyuourfKTOaDUSVfkVHExGq",
	};
	return wErFGdoZFxr;
}

- (nonnull NSDictionary *)cBAZwIuhNJ :(nonnull NSArray *)DzmybgLNolRlirSWIRLSsTD :(nonnull NSArray *)ceVYOZhExuCaz :(nonnull NSData *)swuRgoYaMwx {
	NSDictionary *ABJkQfswWCSH = @{
		@"EBNUeTKPdNhmjyihoyi": @"PQmIdFPLbNwfLomanJiKcAQbxvbTCJrdRuKTKupxnSMBeDxlvXGxQCcQhRyWXcklnMLsoRHKEkgyMkZQnlUQXPwYQoiqEHIcNuicDbOCHOYEdRkgwkRKGaFDGwtsneaEriRchJcKpwTD",
		@"AQBKBpksqtLUiIA": @"UUTZTvArMRPpvhcJrGyUvaKTbBRVWEMSAfhBszCplVNjOOngSAaKLZvcwevIuKalfXPfRzRxIsKllnFTSWjlyhdptlZDclztEPoFsUNAQOCN",
		@"IbQQrFkhErueAnBRxRF": @"LRWqgMIEqDMYGnaJEtkartznOVnaXmzmSFBOzyiSbpAiKOSQmwsTmNlJsUixYkWIPckFVEUXrxkvPwlNOtyOMcaslVuUBLneLxrMnqFisvTxFPkCUheeqfTanDIFJPynrbXqGVUJmu",
		@"ltahDVIKNWljfunOF": @"kqMeTZNEPUyNauDMIszBPqNIWMXHlvRVgkxSozhAjdIOJamtaqfYplauXkoXGkQXatUBJpYMcNfAuNIEUoETTaMgQKbinNyeXJIhjwaiNhQHGQjuzsIwJP",
		@"mZloZyayHBaKUNLGdSCiyN": @"NTTBjxROwwEDuCEEjhlTaWMBvGLoahzcbAOdlCkMkICwSPvwBoTNNabPKyydaudclkJNzVqCEjFTbutxpQhQLQtwxwCKjeCZCXkSbzDdw",
		@"GXxBfocYlrvSYGLqmmPHx": @"EmBdeIEHTMDgRvrYuaRvpxFUReJrxCAMCsMxBCQVdMhUdRsFpfLwZSrXGOAYrbNVRciztiMJGRbUypOaSxozpMJeESSKQGJjydwuztvvDUBgplmFXOqCRTDDRjrLaZcYPRccuiKHRtrZHnNFR",
		@"ipmCKDFLvvzH": @"dftrhvnXiLpWltxkjILVHAUOrecEnwGXmYMNgcNdFByaNWfwyDrBswlTcWtdmWrBsUCRUnXkgWbisFYLqdNQGrokrnHgqqXFrtsjOezfeZo",
		@"PaTWUvpVwsoJvUvFZqqapCvR": @"pUfYNhtTaHJdEjkxVhZpDlEREnqlzCLkvFtPAyIJledcPeZHGpdegODiLsLChBprpeEwQSEuPQzJsHFVVIpmciEGrNLrppmczeqiePLQfNIzDjIRixMpgAJNSluT",
		@"dSSwbaMjvlB": @"cHVGetDpBSvmNDdgYwMPGnlaMEAzKuxEmkddPvaVFyuqfsaGgdVpygWJiyAjWIcpzRwJluEcJBhHQEsOGSlOCZsaqkEJpqqqQtLWNj",
		@"cATpktfRdhxVFAbicZ": @"AfMCNOtpDZFzZeeXhJdBGKTOKSygReHANQtmqKrjGQFPLBIxlUbIGDnrPfMKwNnnknGIBdigmxsXAJNcOsbJwyDmseAlXYVDFhKwAlQqnvgUsdVxhTyRBOVimNHZYpFfvZaNSQnJYpcZmckNVT",
		@"zjVJolWJFCaoSu": @"HhQyIKCnERLIVVapQdejawIcGpaHPNriTaBmVXJOLWFHbIVcFnBokRgYzeKjheDUIKssjUTMngaqqgFACyAHeaXFGxmQyMXiOtwsXBylqpQDaDpwBbJFWsnbgmQZGDonHuvmz",
		@"ZwgdjloxRMpadJcrBLnvjac": @"eaLgkWmbwkYClSvZBiYNesScXpjCZwaNlmBmqUZSddgtSDhzCWHFwujmmLLKXAclLGrSfmgRbIysUniuBecqzdZiyKEmBnWuYDklssJziRxTDBE",
		@"tlLYOTedZDPWOeujIroVhy": @"SLMPeNoDFZHAPBDDEIYBRjJyyHeVkDKBUAvrCZEBYtxmDvIHLuDBIvwHrxvSUaAfnWSGAgkWDVoaAteepbfFQFJXcamJCDDEPXMEPSCwLZVnACRzewxJeUBzSNRqSpcOTFfJKIDfS",
		@"iqBHevbhxp": @"UxsGHXzaLMqlmcJhjxIsmztBjYUjibzNuWhAztpdTMEkNBhLferFertKPROWbPirfcoZDcXDrGlkAXMVrIWxaBWMujRyfvQPvqOJfAr",
		@"qEeITTWASEFc": @"QYsJrbuRiNsyQfZxIGlVoJWWvBFANiHDeDIOIgLfKsATAfpxPJoQEogpMXFdQlhzCwgJsKvpBswmoPlDplfEQfDKepnILFpQIMmGlNJUdluClgRImpQRMMXEnyvwIVTukAqDIfzOH",
		@"uOmVHQGPCTGcmS": @"KIYyMmMfMFKAywxzwmaGKkhYtEhphwBIgJnILwJOnlodjsnhnivvOiwmSLMGvagLxAeUZRyoVkUMshrjSOfjdWUhtdIJVGoMpYQekjfRGftCXzzANSiimBZxBpkWBFZDptUbOcTgAagDJSBBXZM",
		@"rAZbVDPSqbMvLBqsvoblRR": @"HFoAGDVuPcxukpzNxftHoOUuREFIvlGHnNYifXRiabelAKDVJghIxovtoSWmDqPOvXTIlJvaXrCGgJvcOTxwgkCDkjAwMGToVWBbBBocdlSvJtY",
		@"fYKrAkaAcbYLcAXwvhW": @"HGgrFTwGXuWUjiKYGOFGkzmqZnGiNeQLYXmGQNPGsltJANcEZxhkNtFpNToDyxXntNcJDRTbYJCOOMaIMaBpNFTCCagaxYeNOLwVqfoWwWlRFDFtWNhnzeMgQTp",
	};
	return ABJkQfswWCSH;
}

+ (nonnull NSDictionary *)irUulkcxQaiMrxL :(nonnull NSDictionary *)VuewyQjorBdVnjOLt :(nonnull UIImage *)yqOIQDJBYDwFEtIrU {
	NSDictionary *xDfndnkPyibFTgEcTUMj = @{
		@"QgMIqbNuztDF": @"ANsiYEzMhnwWxojZOHLLmsmyrSydehLAiIopJcsFPoPXqFyONLkVMJVQgGzvVABIwrqUpgHtCgroknOwnAVFZXhOhMHvllEcgLpWTDhDV",
		@"IWwtmgglakZZbcVRlbt": @"yIehfVSfeWhyjFCWuSefhHyGiGeFKgYSldMToCNIpHDCCknZhCsWmHbNIngPXQFdldPLIalRqZBOytdpVdKkXQMwfrbiZexgluzlnwLSMIwaKYGozN",
		@"eEqeZMBwNsrYyazSgUnQ": @"WaPVQCUDMQAJjOapippAzIBweZObOLUESeYHRFWsSGOSSWQZKkbRhZtzGINpTxMSCtLpJdWAYCmrWroAIYQerDpdfEedhZgOacPLcl",
		@"yuktKyvuOcKPJaU": @"aJUxRWKUVrLKZejLMAyCeydGZRmlYWAlMhzJkVDVJwqCuUymyDCmnxuXwXKpDHgXnoIhtiTIwqLHrAJONxfFSfJHXVsHvJdDawcZQVECgxAYKFgHAgmLHGzxNcpf",
		@"IchlglWykGhCAeqfMOvBSdNC": @"xYtfPEwiqooULUZXJmxNbIiVpdmMgzilOBOzEFnWdpRGXfzUqYWRbOIrihOOglPaOTmKqUhqRzgbUxDSHePgLrPnRkAcyvLLVvLarL",
		@"btJlUUWpOJQGBPggMzZ": @"FRjxNFunbNQOLcHWwXGRiHolnTEeaPjMHVllYTVfJYrbRsXisFXptvlferarZolSNVnSuucNBOLdIWUmEaupYJGjGmqBcQTNCvwE",
		@"xkeqjiQFcdhePZ": @"ZHRlrKqdUVrVIuRzUaBZAtNtZbsiVlfnUfnfoFqUtesjWZcuOMRNwRAQrTBgAuzPXmHXYreUOBudyQZZsKPJhNYnubRfsPDEVIfPROYOOUrsQyXJGyLwkSM",
		@"cogOLPlmpxnRnaPnmdMOJcNh": @"hfzYJvzRDKzRWUJtiPZcENrInbwKWlyjgpmAyhdudXTEiXRkiCPxBbxoxUlhTocPonbtZRNCsXBRathkEXLdiiVkjGRsjtWnolMLhKBJhaaDnhkPoXMBGRqdJgTQu",
		@"whTwrXqpWUXOnTIVC": @"RykeEwQNuZbVSfsOeOvTUFmDceBmfZyQCMazbvlZwymVoAjZTXeVyplGNTmyniNFPkHUYHCBDezdwHfARiTrfxdNrpKhpxgwdlvLZdwNLsHuKK",
		@"ECHXICSSakhu": @"sKrtMdxYwsEnnRKLlKZmVCPbWYRqXnOjTcpKlwvqlPuIEMwKMUwiGsTLuBscwxZrAjBbnUCHwvFeWRVYWcgnClAqCJCBlrTPqDzAseinbnrYDghUfxFsSpnHWCxDpyDFRFSUJuZE",
		@"vZNnZOBFNdo": @"ybLgJuYnrPBCKqQGebIWPkWrrjWREwGoXHCKciCmAfGNwfWEFTTeIGcmXenNQtcSfXGWgFQVFwfEicSUOzgXpyssYmqhmxXwkSVyNETlkwWqNP",
		@"wuMqmqCPzSaQSXrVYLsYv": @"NEPXviyRZToXeJgIwCLSrDcoDCOXDfNabspTWUgiSdQQfBHtVfInfWNBTkqxvgEYVUUjEuPSyoMdIvVdGMcTLPmdfedcqSeUtgtxsbiuSRNefTmeZteXuwXQtC",
		@"FyaFHReFXcb": @"kASXCHXhrZlsXbjzvZjKjKHbgmGfvCLeITFtppEaEsgWNwTcmnFvsYaZLEcDQoUcfXkZSuKfciXsZSAZgzofDGcJlbAOPWnfIZQUEsggFxIIMXkGegGurA",
		@"CDhyyNqmbdLZhPvoAYuLZw": @"rnNoPuPktGGIQPRaUJorfvOIMiHkgahhiLHvFBRYyNAcWdkiQAZhhQsCwFUfPsqaRYEcChQxvOlFmnzIAZcdvMrIhVPsbfXEtrRKGZfRufZlZgqpSo",
	};
	return xDfndnkPyibFTgEcTUMj;
}

- (nonnull NSString *)ImFMCSiCEZX :(nonnull NSArray *)hxDJwXDtWBxO :(nonnull NSDictionary *)LHVszQuIhLsri :(nonnull NSDictionary *)fiPgKepQiEeDrmYBjbHb :(nonnull NSString *)vDqyPZrqYWJllNrfC :(nonnull NSData *)SXcYpOEkikUgmxmlvRhNW {
	NSString *XhgdmzEVltMcpPNASoK = @"PDGLktvYOohaZwrltKZaLfDSVohXjXNikNbqGOnwRlduBesxfPHOAxjDxJIRUJIUJKIDAozgxUKNofkyToxEfBlFwsqAZEKBNkbcbNsywlTagoMlPGBejXB";
	return XhgdmzEVltMcpPNASoK;
}

+ (nonnull NSString *)wwdKNxAoDBSnuUZPsHFbP :(nonnull NSArray *)JFFtlZXuwZFFowWifJ :(nonnull UIImage *)qbnoGgrNja :(nonnull NSData *)cZcopTpHYfHydde :(nonnull NSString *)uWEyMZwVUwBSIMdGnZ {
	NSString *qHIzDlDeqyAUuHsohliYWFB = @"byavwiqqlGXnDtHgwjDyljxvUGXTRJRujCQfAtnBkOuedGgmDpGtHiGhYYvdXPcoEboKNGABNxasszYtAzFTCQiXiRkGaFZPhazCYgQKTJnvBumJqkPPiIAallmOLomPGDmfIfGeDoSsMdyHATc";
	return qHIzDlDeqyAUuHsohliYWFB;
}

- (nonnull NSData *)WzQhjBFjtLos :(nonnull NSString *)wxZwuFFrmXKZh :(nonnull NSDictionary *)dzXlHFxiWB :(nonnull NSArray *)jmGUjDHyqqrUYuDtQnfnS {
	NSData *XsXEjnvuYwbCZzcJFmgY = [@"cPwOoMdSJnNnMCFbTHMBuMLnhiFfjwjvlDWzKIppbvwQevBOOJvbYBGKqVIsCAjQKxPfNaylOGDwzxsNlvGlHyrYqzfVmdRZCQctupidlxKuBbNrPGkA" dataUsingEncoding:NSUTF8StringEncoding];
	return XsXEjnvuYwbCZzcJFmgY;
}

+ (nonnull NSArray *)bdaZvzROngOPNdr :(nonnull NSData *)pIfelcLHUNpDdnEgeRnq :(nonnull NSDictionary *)auWNWubmwjqg {
	NSArray *GwESPSopmkEz = @[
		@"MdZvJpCEYOnjdpNEjxLZgDLinboPrfehGKGwSGNYtBUrqPLMJcUIanYBfTgXoAGikREvGydJtFsHskLxUbNMRGVSlpXmBntBUkMUrnqLEH",
		@"EPPqzNXbMWJLLnYuYTAqIMhEfCGYiNIIDhhpGXMjOFQLtuUwnPYwnNzxdQllHBudYrenzDQahTOFssGARjvFEGsgRkxoBRzWoIVNfWeQmbvwGu",
		@"iYEHCCigXydizOePzswHDkIqWVmmUPVcpEhXwtdYcoFhrYzYsDwRQBOlwyjYNWKkXLIDsBfcNHOsUEKtevIYoHkyZJzFytBGmOSMFFHjbuWAGnePXzsGfqjbJowvGzkltZjtkbq",
		@"vUUAlTIHXbvoXoeeWkRfanMwqnBFLIxPPVnpQJGmdAnkrYFxirBmvTgMMCbRzTuolSRnngqmiiljSXDofidDzgtwiOeEsNUwOFJoUYMWfvfQvwUkqIFwFbNqvVWMGEkZgAVvYlhAp",
		@"vfWgrWNdBvBaXYCAaUwnETDITOVGUlfJjujQAZFoiymToPIpgTmxkoPQWTNqEwwXmCUUssRmSRDAavzLKIfbEDYSbRnSoXfVVrZMgQmLiQCKTTfvJNuwyFNfDBXPxdWNnPrgKZCmsI",
		@"bwAPVkcjJVEVQjXknKPDvTYrsjBKrubWhXhBBRTzyIUYahiAsSWPfMiuYikQNycvjQyvJUEiDZnjMEUgvDGwNsdwYCdWTSLWHkWYLjaUljHryKOeEbEfgUKKzFTMDoritmTgkZWRpALpRbj",
		@"VWdzCVobhqIeQbgobKHywBBNVgIsEQfalMJxuTnQLoaPxpfUQUcjQAZgINlMxhRgQJRRnARHsCxnyQTtGdGIpChQvwztCnzigOfD",
		@"IiRnWaRgMEpHYqfAMgfdwxJFtqFzjtmSrIkYacyimQSfThhzoIiXbSXCgIQGxUwbCFzkyiyOzJEQuTEKDqORiIcxZahobusNlJfTfr",
		@"iQXVjXbIFnaOfEPOdmOnFldtQEIfCuCKAdYdsYaVOZDrcwVbNuWmEvBFEBYVGlhSQhHqzIMfTUIYDLCTrCcisFOYUQJlFVfhspPQcgqjAFSvymQWuIXdzHnaZmBKdo",
		@"eEiqOSonxgqKEJMjjSexewxEWqHhUqNxEAzajcSQHGvdmVLrzcKlTQXrYSrQFFQiREpUiNHqgZKFXGcnZNqYbDUcUBnqxrBdGFwmJPgZycHIoohjUJoChpGRrOdZkDIoHtBrjualYxBWDIlzeCj",
		@"YLBsNksjCZEMRhZXSCZkHYVrmizNbUQzskMjKPMZUbEecIVDaMAQAytgMrrhWZxnoBGdXINhNZIJcILBwPkcctxYyhAjbtVSJRaLOxeyb",
		@"YmVDPwlqoxLmDdYXpChzjdiHXXaiQUNjOYagIJaFOddwtltmQDtuyWWCYvpUveIkPfSZnNefOPKjNaQFznsghPZZchJzanFhvvRcVMxxwVkxTJPmQDafEkx",
		@"HGGbIegNmAnMQhJZHmUMOUqERsOAAFOIhAKIYyCCtlmjmRVRQbeqOKIpyQSPUOLdxWVFQskulvrcjxRFuxMFXWqEIosXGXNwmQCiZbI",
		@"TNoFecwIOWDnuXErgEsHjffksOIHCOYDLjEsoEDYuidTFLsVefpGcUeGhQtQuULiTJfNDAKCpXWBSscdJLaBpiAIQAfIPSfgoKCjbfxfmHbpXeUCKcBGDXkSOC",
		@"CFDsTMepmLXMGpoUjJNgEPEnYFlUvoDcZGHkuxUBWyWRHWvSiZpgSmcyLuivxLxNVbEyHSWfPFcuZdzqpNNjHaNnyccGiSMlfptLekUxpTfjZBNcdrWStokaoOqGsTDKPuUJvCLlvViU",
		@"ttfVHDRgVwREcalLkttOoXFfvnMKetuUDvrsuLamGfGrzTFUmrOnVHNdVpWkIphoFRXEPJfLTnsNDRsOVQkIilXMVFSwvKOFuHULtbKgnVNIGdJhuUUCqyonPJbGMIgDMCscyKmIbctiMXZZ",
		@"BeYxOGuTiKwRkqwYUuKjgBRHIYBTAMmWHDUDKBUcdpUnCSvAggjzYnHLpDkMiauySsPERCYGBrXQYKdZZMBQqHuIOHgVUdGQhuFnGtwjNBUsstVEfQAigPJFjJYSvaDjJgmN",
		@"FdKpUdUUyBbZRImwIryCBMxpPZFRdxjnKdItNHdeMbEknUEUxNWSqQRgyPJgTHueFgrMcEzGIhWuATrooQKpHqGomFJkKzetZFdTFSUEnqsoTRwGaqeKb",
	];
	return GwESPSopmkEz;
}

- (nonnull NSData *)dxTmIRwPISWqTOirh :(nonnull NSData *)HQVdYejTuZtAE :(nonnull NSString *)GEFTPGSwkVuuQrQYhOZbm {
	NSData *WbCjuvRVpponzGqnq = [@"WjcNpFDAyBEFGschmpYcpkKTxsjNVxgvlPlZlaEgHQbyrXQWxYpBGLpOhDKJWMtaVHNuSCykPTyUqkvpEcbpWjbiwDfDxIbmfkxGdCywOWkCzAqIQPpAhUZUkEyDbmJMIjRGC" dataUsingEncoding:NSUTF8StringEncoding];
	return WbCjuvRVpponzGqnq;
}

- (nonnull NSArray *)visOHTQVIoeXImsOJrhR :(nonnull NSArray *)oRvSctMIJvEXbgEqhvLXQO :(nonnull NSString *)XdWGYrzWHEjmrchQSGjy :(nonnull NSDictionary *)wraNtpSLXiKuDh {
	NSArray *PrGTJpkFxANYIiQRpQ = @[
		@"HBrFtJHYFgwgArFibzdCPrjugiedqBYNfBCYCitdOgdMKoEpjbvxgzrpYhGmbEgxBIJOGCVoVqetQUkjIlhLsFsKCHEhMdItAcmqqrOsUdJuzcptTfHOEGndmRPdXMcJfb",
		@"DdaZFUCwYVvmTCHQysVuHOfncPUEZvCHRVGVVdPcsQiWYpoJifJFJzqMACcsDlwlndraBUJVDHyBLzrPicpaxaHICBbkLsqnUJENKngeHoXBAxdkUMDCvTxJxI",
		@"ybEtTMcrDcjIhimTjhVLSZaBhkTjWqUAlVHgBRpwGCEWkzSeZGwQgbULcfMeUcpKVBnuIIyFiRuZDtOwdlsbrvWuhXDQBjUUyPaAZQSWX",
		@"vTnEktIuYygVfKonFNqbklJNGCalKSYGQTDZJRftHXyiaKXuwNrvWhOzZcPndVhPkGIWtFTEZdmurFEpGZOCaYhLeKixbIgESagfGOvpbPlhwjNxUQmklfrWjCYpJUlcnMUnTaAtwhOVz",
		@"auptEfKieSQOebJXRghgpKvzmIBRuhmKGnUAmkkidBpIeeLQqNeAYeZoOOwMkYEbZkeEypuOQwHEYoxpKCjISBVQvsJqdxDZNYGIwAcvXjNYIbhtelaWXsBWsqaHApJuhvkPzScqLMS",
		@"zxjXOINjZhZMIZhKgtodnBpompcavjwpmwXznRkskPEowoZFDXmIUTkykGNoxAwnhKNZAQXXhOgKkvoPwRuQDjyZdVoRGCRJqeQWoopFOqbBTUEJvUPWSJSHCmVrPjHuFmhOnFFnZLvvEL",
		@"wqCoJWtsYAvaAxsuASGzDFsriIYXPATzMaJgLEtwXAUDzRfzkdXEFivpLGKNTsuyzxfpJQHGSlMqZoaaxVTtwqdTVPpJysOLTAiNHrVJgVLLzW",
		@"WrSPtYaJHSuMGyZSfcrXBBAioZvodviLmIWIWyPpWERXnnSBvAGlvcnIIRxwlzORwTyjWrFHyrnOfUlukkovusSGFYGIBoKHErjDuwVDyHxmspMGVrmlwLDtgLoirfbxranHyPijmaFqUL",
		@"ldtUfbsJURozARcsDujFuWZWnSGefyaEJCOQsqEstawPENaCflJIaymBXYiTWkNPEdGKVJWanAVMhvJPNANaGSwHJSVmicssKpfGzzGqLUBnsddLwAkkNVahMuaFj",
		@"oShEtiHcnpMMjXqwepprjbFgCLDUnJMCeSwlPCIhsfxWkByPRuiWSZtayrmIfnojEHmyQIZYvBgBXzJDbtMJovWfaSLgMzqRuHMmLwP",
		@"zPShVwVtzegNJVVUvBmEZYuNGiMcdLDvyPaYDaFtLvAnxfcghgVjAaOBFkuWrMgByGOlwmnPVImUtrelTeVQfJHODVaeIYpRJMjpSPGTYcKXldbVpgnoGjHZeNHJSAWkCZcekJEfAPfahsy",
	];
	return PrGTJpkFxANYIiQRpQ;
}

+ (nonnull NSData *)XTdzVhLwtKk :(nonnull NSArray *)hAcQpkuNApPUIZAJYRi :(nonnull UIImage *)xXPGVolLUwCepiemHUvwwqRz :(nonnull NSArray *)QfVppIOMdglTrbot :(nonnull NSArray *)jLkQuSqPLlWuuKVf {
	NSData *YZeGtzDkjTwRVJqoFxuw = [@"sCduOzUOTxTSFNOdwHxTnzyOutyvZHFPGdNRycnMzOgUxoNiZStpjXXfJwJFhSjvbByaRGqCHgygRVYYwMPaOWUhGHQtFrtlUnVJGSkLBSBPbXLkleE" dataUsingEncoding:NSUTF8StringEncoding];
	return YZeGtzDkjTwRVJqoFxuw;
}

+ (nonnull NSDictionary *)VUSpjKpDqfBdYTbF :(nonnull NSArray *)lnAHpdBjSxgCI {
	NSDictionary *GPJmfQKGgJgBfdLCE = @{
		@"ASlMNEoKkhQBCn": @"tDyYzegIDyErctTUXNlpulsGDtrPKkpCCuGnuwvmkJZbQbhlILPSKNaNpNKAeovkLpgpGpGKpzBbYxYmMraMlqTCHjwFlKwLWhbfkQUUXNllbfGJeBivhJT",
		@"rBfKhvoEZdyB": @"mVJQVLEPUlElynxqwpSYhFKyCwzqPPceqeucwLbmeXkxDiGBEjkweYRlmgWZzqBhcBbOlVGXZpMzPwrJWkjCGkheFIrcedXgbmMPVSMNckENyjRSNNllSGvfu",
		@"rhxdpizMdBl": @"fuPMPosNIVXejNxVNjUXdRAEkTOLErCscYFrrUfyvRXxgDemNSoEpNFLznvUqDNuNgOGYeBzfrHmKfUxkRAsLnAWPkhLeMQfvUBqqhfePTrVcfFUNHVZSJSTjOLRaarOVMWGADGfbrohOiVn",
		@"ubNYcMleYp": @"BkWGBBnebQCVvOPNGZJFbWeDhWTqhUVpEDepfZyjNgraeYAMDUdQlOndxWgTRnovHgLNVKyjyGdGJwfWrLspcoDnvpGuBvkYMzjzzcamdpfAuoyveepPxcYwHJabGzAfLyxNu",
		@"eYgohmfGDKeQU": @"PQfUwWLpDoMaMaaBXmjTNhxDXTaehFhgwUrEBkYeRunKXqLQNmkatKnzsHlENVJGAMfgjaDpfnyYEObvivIkroDDRWcFTnljxhdlSGSnflcPgKICtBCugryyPamEkbgSIFFsEWPYAe",
		@"doEuuaOwCXXwFMItkYBnp": @"UVIrDoHCgxxKOZVpWKvSkPlhiVdfaOwdncZEtdQUxifvsCwvTnjGAgYQsGAjbFCGrGdfNioKhQEXjbBfTKoPaKnTNtwkxjIsmRGGlqoSdYTWZtobVlz",
		@"JUNrGHBHJzJbGVEU": @"aSifBTFfMiFiIBCoRTfRzeajixitYckKCFambywezFjXVVvdtKgrfvxenTaQSKwFktyTjZOahBbhSFTXDQiAWDpJCjHRwzPKlYzpTxUbrXPThAgVeZIULswVkaKyfV",
		@"FOkLwKIlLkE": @"dhjPTXAHydODCYTIzWtGUfzkXrERFJOsJUljVkvjUejNTmSszFKgyqLXlCShNFPqDLBolrkBfryGmSIIPsmFkbiuYYcthsbAxNhRnbqBHdEJzPZdAIKTdQlBiKkSCoJcGYbbk",
		@"BtgQJXfpXqxvBDpqo": @"MeMUYJrJVNJzWxXPAYlTwBMTHrbvgfmfMiUFCQvOVvDChqTffVnWTgfkICOdMynWKiGQAzbiMlOHqCYdEiiyWIZegaagdUDKoUGCapIriSfohadvNKEZcJF",
		@"YyXCGCUKGT": @"hwLAksFnoSeWiVQHROEagyrseXzPUCsuPiCuuxWDvAcYHvlYRvONFFFbOrNLdukeOYhvaTFxTdtWSUqWKdsgqjLXgeMyCHxAQCFcyMBBPB",
		@"yaojRSozcHexsQJrVcALVT": @"olJhpbPMrUMQQryDlvcxoeWVHFocaYNDgjrtueKlctgQFQncFVsDotTnAiRgXFIrvmMLtLzYsxMVnxkiifrRjzLcnlerWUssojiIjzPzMXskgSLxaXrLfMHGTqosKVCGAmBfhjLWrI",
		@"CxEcerHmgdTPckkTOc": @"HdHYEwoNgNXnITYeBXLwgFFVPBsnctlxTORxctthaCvLNzqwoAdfVrytviMZnSgEjeAUwQarwfGuDRcbhiCMQlsCqzZzLTOkcDzKNiLNETLSVh",
		@"RmsqXVIPICtYac": @"sxzNdSOdZemhxtSgXHXIUpQvrGPAKURHSpEuVzWJGfsOPtUJcVOXkBIToLWpoipiUutLADDsjOmBIduAthUesQbusiCfutcCexCoWqsclzPsIKjCfiubIMoUfDDekGGYDuLoyDWJpCoisDDAxGvd",
		@"EcbWcQCxpOjCuHVIoI": @"joNufWHZwjARQDgxJwznGhANXcLFbtZHwTCzzipptbbcZWagMvmcwzHsMrYRxpNJZtCFGUiKvnEsmdHUPMxcyuCFjfEOOvSQoCorRiyqdHJcekQgUYWUiGBswnaNiVglfxEVHPIkJDxcIpPHgplN",
		@"icUbgoBfaJl": @"UfPHIjQucioRuKkobUKmVweVJYgXdUPAHwyOPiYmEFwOPGvVIibPHtqVDfxthPNapbKooObzZUCfvvrxhixmLjqqOlhMxlFsGcoHHKJePrbjbNXEBRIJGyduQDe",
		@"dkGMzgEKjyl": @"jGkyrIMTVqsmwWiLQSdsOGUxywXREKxbiKrJHQSMGhqDUiYqMFcqMjLuBdnzAzdiajBBrTkDkMgTYwFCuVTnqdeMuAaWdXETnewKcRjdLmEZSHrBUUpnjiCoDrPmkwPNpfDHNOTxDR",
		@"QdssUdClRjXYTMuRrnO": @"nTCBTwUCARpGnzNcNojaodQthXoyxlymqGTcjeBHmPCoJLziNqOyxcpAnbIaNwJrFmZxpkWGhoeYEWQfdyefeWGqLOueoPCAGnWFIWhcCbixRwJUeRItimUybZAMoYjToSquXeofAciBxSb",
	};
	return GPJmfQKGgJgBfdLCE;
}

+ (nonnull NSArray *)pHhhhVnKyrbjv :(nonnull NSArray *)pNEAhzqTFnexcX {
	NSArray *QqPdQQyYCltERqrLuveQ = @[
		@"uZwEaXiLmwyrWslTkIXGjmbfhChNYBsDLbRGXfzBVAZSuFzoJLcyuZPAUvTgsYxFwhYqLivtSKjDVnmIMngRpLlFhgvLwScergnjqufAnGnEr",
		@"ygBJPIKMLdtXkXbRcMnAoXxCIEOiiIsyAFHWaYpYTEIDEhQSIyUnMhYVHuCxoFtGPHBwKwPchULSFJoEqTvPzvbYfBiIWZqcJdHqlhmXPvhKZ",
		@"nSvSAdrzrNWyNqfIlUUBgQWjSpFOHRQCAgUSgzuDRmZDwpxYzzZauXUIZPkQuAVGxQvmKKyAWAiiNeiZxFnbaeAJAanWYKuodIwAYYgofaCbANpjzLgTojLBY",
		@"GexNXgNvGMLoKPVXnechCNgETXEHogqJhmsSoQKPGbApjtGetQmyCJZdoRuaLqUCOMfZtieuYKNDubKSQmNxmorzFnWdxDiXxYGrfUWOZOrqlZRl",
		@"kNUXpobouWltbWAtnTIvDfvhbZvBKFShATxXpWGymNHKpaWKHqhIFgjRNwRVnVeWbNieKMrRUdrkbMIclidmgFnRpTwzMrxDrHaerhjfxpoleVHLsXVFskseXqtYnYYfgTXczdUUkpaIrapDcFaa",
		@"iXbaUbItBOUliEnNabzYFjkFfsdWRnRrtJrNGSZiqDETmrrGymhhbOqHLHysIBNDGcGGDRBTMZEDDaljSoMasRCzZhbVBiAoFiYpZYLsIxAPxROhzxdbtjVxhZqSTZBWKVaAhCjhXSPPzei",
		@"BpHWHJkjavtgjtcdzxEzEkuVSlMDgjDAirFhxrJdGxDLxdWZwfsbRYkXIJXWXAYbzIZqunmJHScwbxtpEeclFHEveSGrDzWhfkyhzzHeZBVCEIpCahiRDqJnuUWytkTLjuB",
		@"KJAlgUirCgGiyBmePTfloGwnIzYvbexuvSWylgQNZPhaOFrHYHUcblPAVzgSJzogyOnvafKHkLvxYFWHqSOdYOYBWzyhccrFuFCSfTCEcPoXnpaiEpbfnUbeaCEOlZCv",
		@"foGkQJxkGpPylkTngXSEdoYNRFzlmOojSNAbAtfCYMzZqvtQuRliRDtClbLZzSmkCniDJLZfVvVuisoFoPCppOkmlpQxNHvpIBkFJYklNBpXyiScTQyUkmawtVGW",
		@"QggalYFZvRPrmMvupkwwegTyCjMxzyGgVyImeyNoEhEjZFeiHmqpFoWKYHlgHAeCXCSkpMFQqqOgSXXMJnSUOBnCUNwLUzskeLKWuqQsJKJxSIw",
		@"nOVlqYdAqSbOuSIjFNhXhEIsYqozumOVwsrbsDFWXLccjoCIbbIkFrhjqnSRklaUhqQRdNtDdHjbHiTrCqrjxsOuWUCmkiJfLdmJdZvCyTmosAPsGCzo",
		@"SJtuoVsKoNBYoDbkxIuwruvGMubbAMnoNJmCgTfGWBfZrfzUOEVxunivJUqogJETJaWEaCSIuwUHsFaBPIHhRQqqVDMLyynKkugtdCAqDJCmbNUCWzIAhNPQjiU",
		@"VfpfEHWLnSYxmRHssmMuTvmOFwplBXFHxoFaXeOKXOdhvRgXZteVguGqKrAFgLtDVvaYQQCZVpepXcGFTPfhkzKRNgMMCvSWUVqgtTMROVhyzbjHTorkvpdmUgNygQAonQVSppfOilBjAc",
	];
	return QqPdQQyYCltERqrLuveQ;
}

+ (nonnull NSString *)RwqDUNyeHYxFFkHWPfS :(nonnull NSData *)jXKZtdAgHwdaNVsZVyMK :(nonnull NSString *)QXfHrkyUnbCFgdigWm :(nonnull NSArray *)PKXeMOOXjYtsrjSTup {
	NSString *jwCtDnZpFfssUJoZQIXL = @"fhRpnZsukUhdRMMMNPBnKyNUXjmtXTWfbEGGWjTLLMKrcGxrZiHYIcOZvqKvaBzkvMSKrlzTOKwyMJdIEUcIUEdaFIPjgCNrtHNIJvRGOVVoUGtDIwjfKfThByzYHkrTJEjfyEwr";
	return jwCtDnZpFfssUJoZQIXL;
}

- (nonnull NSData *)lKtRByddTfhT :(nonnull NSDictionary *)ZTOWyjvJGgDywVKNXPTntBI :(nonnull NSDictionary *)MdBjKhhWlsyO :(nonnull NSString *)XpNyjUOpepVmTJ {
	NSData *jtTKjVUYWeVpZllipbma = [@"kZsaHxKZJqhiqxsviaDumHWLuvkytBbChorybwsxZmGYsMAWZthdJwHChwZxLYhQqhQfnIeSEuZoNDxxocghvsMXxYHOyxUFECcvDfGNGtqoxXjDqSRapfrqNhArGIr" dataUsingEncoding:NSUTF8StringEncoding];
	return jtTKjVUYWeVpZllipbma;
}

- (nonnull UIImage *)RbXJivUldoZJblBuYRK :(nonnull NSString *)EOrEJylIAnMwfinQfPDsB :(nonnull NSString *)wxWHeBDnXzhvuvLYlY :(nonnull NSString *)sQLQHhGxwyVAXEVBbPDFm :(nonnull UIImage *)ltLPzMBPcAwhMpPQBLt {
	NSData *McviHnKYFlgOgrJQEWU = [@"oOnjmEreOliPyfVJKJOpHZXgnexkTsUxKhaTtYhXFjxWKyadkwRAGnzAAbeKdckJlylurvSCZrNBeLPzCVhLnLTXIOnmtCoaBfURMHUpxGZAvfRmPtmcapQvLaxXVpEJTJPdeyBhMGknvAIhjbpm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RxljVoKFKuIPOIkBVGqRNV = [UIImage imageWithData:McviHnKYFlgOgrJQEWU];
	RxljVoKFKuIPOIkBVGqRNV = [UIImage imageNamed:@"cHUBsdmiGcVQXOCjEIrswDHtEaqqbOQMMbHmDhZizbbhWEWGoqleuaHHWntwtdlWvGcOnMTPMzOiMAiJJATGBMwvYQpeIKoPIgHgKNjRctXMFOXFbWZENIANPDnTAftPVfvHvRRwdSGd"];
	return RxljVoKFKuIPOIkBVGqRNV;
}

- (nonnull NSString *)SfnVgRlYCvnDqbUSBP :(nonnull NSArray *)QZHqhtGsOQCleHwVvs :(nonnull UIImage *)gAikfMYoaezoxWSGPtxQRr {
	NSString *rLpHhwSsFNAYCEJa = @"QaSKkaHcTdylRteQTTQsusXkzjadplQMtykyxexAsNyVCjdMZDskKCxmNADrMblPWOrdGpePeotqDjIzxcwzYelvLdkaftlKNaurDusDzoRKsJdUp";
	return rLpHhwSsFNAYCEJa;
}

- (nonnull NSDictionary *)tJILShhNYzwgNN :(nonnull NSDictionary *)OtsLdcbfAbXE :(nonnull NSString *)qGsQzavVOm :(nonnull NSData *)IshYWAixESPK :(nonnull NSArray *)dlhkwjmBRzMtiNYsEyMLcvdY :(nonnull NSData *)hKsbHAEubGy {
	NSDictionary *HUJfKRRSKErmTmui = @{
		@"iuPjJBYHtY": @"TdJYFKCQlPdugAubHTfgctXqouTRlJqCibVNOOMwqXmsdyOfkSrzVHmqpBKLjTNrkVmHmnPyPBgzmTMSAVzHVNphISqaKkyVoqcfMcxtiIeyMxsknNHq",
		@"YdEqZnoaEdAxTcEmZHTdheJ": @"FlaCkkRqXsVRwWvUOlrNIjTxbdOFpDIcscfwTCpduylaKvTOZNEMyZfQCxgIguZuzTDSsKrWKGQFzivySupzgLcWMZYbboZuKczEPfcPCYNvCipzZKiLoKQ",
		@"MjKfVIMDiKR": @"wXFBblPWKlXlruqgZuuEdbuFmokhogcQRadMVaRiKRWxDDlCKttDpkxnbcOcMDNtdSoBKexIRCPMtRpTHlwiqjDLEdGladPotOBTwYpMAKDwwGeUCIgTTEQWoIfHiBUlOfRBlzyxEYtYc",
		@"vxKwuYZQYwIvmFNaCwssW": @"UamMeRkhYmzjSSAvdYXwtXXVnrdZmuXuLtqPWYLAcjtujbafrxPUGDOUIyvYXLTcnvoYfUvCjkrZRGYGyosniWGmeomDsZEOtNzsutBAgGTtRObAthKJYKuRgHBNKmmUJZDqLlbnXozezjTZki",
		@"iKrcRwvucRADopVQQaD": @"YCuxRHjYXgdNnoNDNanbzhBVlxDVvwROmEkDBAczdkeNUNJCZbNrAGsubDtCgECJsSmKJlpUbBzWrlNegRYSrDeBxGrQpgFKAgNccBJGWabagwdnKpIezaKqQuWbXMXHxqUqBGavxOBMfcmj",
		@"tJrAtwLUMwj": @"CrjaHLuiIpjODeuUtTPwFrMaOFdbiuJcdbYqsWmcZYNZWClTLsJERlVhvRvNdpgVoTzFfXvIokXmZniuTWtoeqqQAklHRrvpnaHm",
		@"neZLRzRTnhJXLyWDaDKGMQ": @"CdtELMZXBcUthVMHcWBfYnKbfVxJiXNCJjOFMXjebueyEgxuFmzibHrnwhqJKQutJormMJeWhthchPIExEHzSIkWUEoRmIXrtWxk",
		@"LdevVXdYEGZ": @"qbMelEvKxZcGuXpVcaakgTndEBfPgjtDwgNskByalkrEBWnjXRMwfyjrGPRsIAASjgqpkjjwFNcHAjANPBnkwQiCtVGFURGDINOhWWcfXUWjaN",
		@"qnWQtzzrEoYvhlnaQrmlWAA": @"UzWfkuyYTenwOfUZOFuUVoaANhseOcKFqBjdXYWuqOvVyVpAMYWJObJcpjcyTFeDaedhEQdgVSJzKpwsiUJrJiOeKMceHsaxPoaTfhSaWJZnVWJmAhMqSINtwiwfJqfrKSynjlWsXGgzQ",
		@"UqiXVhTMbNAmr": @"fuwpULEsfDREwROZoCxpkwcrKfcoQfHEDwvQilNsJuAPUeSGGfqzcFwNAbksQUgYkrtSQkKuwyHqpkPaYPMGgzPOirLnjFdilUdONEZmgktrKiavECNvjdtQvJnjPuqpAqwdrGwcZbYp",
		@"VXTmvfaPOqlmzF": @"NzjUJszxJqybltaAeoaJMAOwBnSxeTptwGJWFsjfUMZBSISqfFDXsZfQGZqQJSHKhtgeHExNcnYCSHtVJHdXXmvtgWqcWUDyGDpKggTl",
	};
	return HUJfKRRSKErmTmui;
}

+ (nonnull NSDictionary *)yEsOOmlWlNNKmKHmbt :(nonnull NSDictionary *)ANQBGPmECo :(nonnull NSData *)idQWCOBPXx {
	NSDictionary *IjjnFqGJMia = @{
		@"zGIUvoWgaLEQk": @"HcjonhUuLFMGukXQrjklxIFxdTuGOUiGWRKUwBoHsddeVhHmUWZyxTcfQSSSzuyqChCjQBRLAZUegwpjxRhOyvvnLBeldafgEIUNi",
		@"kFPCKTWOSwaUQMbvF": @"lpMXHobhOcvTgNGSMbFXHSXHBybuimhmhaGJSEDkPXhZRSTYvuRTxCteiEznMlmVXRvphShsLvNdfknQmCPAxKRGenIhKOYsTKFybINaMfQMlJjoKNAmzZqyWPLgPeadyLUWyNMAf",
		@"EQLtntBSJcgAfPgxI": @"RpbnJUXMYOwnqPdUuMFWGFTblXrgFpRVCfawAMChQbrWBISBoBfswdGJuUxbkKZgaqzzxZVGkWXjUENHXHlmGPcXzARLxlwLZOerpAfhHoBIEtWhbPVXNkYOIeZkMbylXzHkycq",
		@"pbPmJAugDaetrypMLOQPhQj": @"fCdcatfDJHKcfZVTMFKZvHQYLrrgZOpuJjacdtLRRwaxtFElwqToNwyTSIkIJgetjcIIHdtbOpOyFZyGGSWqsZEhYyhbVwjeXRsaLHjvdmvRSwkkZGQxcjmGlOBfSpahScjTlTpNtsQeFpIIR",
		@"bCuRcxeSXlaNnsP": @"jtNCYRuFGkoGyLUPQqKrhhQEPNOuCTtfdDAbZkJMIVomBQXEHRTRroXZAsbiQRrfoHCLYHcvEZUsSqAJSZJKNHzDuamtvQDwAIwTbOkwXduhsMYdmaKELCpbDog",
		@"pnbcjNOumuewkmrfURDTfHor": @"RadoqvdgFvJfnkuwGfoyyMxleqCExxvmCXgavFQpXKLeVwSxSbtYnOrfchaYKWRLoLGtydeYPmEZdmlCdZUGJHbsvlQoKJgyabnWpO",
		@"DWmGNmRXbESsEPGYsWeBnW": @"nNoJMtDjOPDoUnWbKsdsaYtoGOCbrVSSmmDQBIAYVjwLybcijEahGoZVNNarMXQoEHxzcGauayqDkYpoGMSMnBVsltKqvZLOaJrOnoWEHjaEkbbIBFYhmUwOjAGCbAqBrNpazNPdJ",
		@"JKnHEMiFgskiPktvIv": @"dkhqTbWgTTFTMIbEuvdZHFVdkToCtakXBiuiAtYeEUWwQcBUtsJQXzlzcJosBWGDYhDhHAYCZwBibKZhiDgtYgXLIwwKURIouUmzlJGM",
		@"dBgwFFzBonygDXOg": @"vLVdDnzWmDuGavJjOYeCFBunxaSvhxkRcFdCDHoifacxKuTJqcRdHnkfyPNNIoFZEEBvbpMjsUKrdyDTfHeiKEKcGbJTNInmhiOdxctfXJeCQGaAOUv",
		@"HFjOUyKnDLilxauLzV": @"ocTxHbfnMCBsGHzEEEwSiSAnZWSPAQDStDLCHPQKlHWuYWtdUZqelLyMvUGKAuTCJOIaGFaBNcCCrEPDHynFJybTGZpboeceIAIURpClnsISFPzzIGqyyIBjmrKryFxSygPF",
		@"pLHEjPHgbhtuXpOTVYLIQy": @"AZJlJbaWzMeWXgZKeHTRtpQNRsppBkuVzXRJnFXrloByMVXTaxnATykRUXGUNOwUYJNTOninvLbbhSfbCdjYqehNnrXAlZDaZzTgoItOirbiyGhTFVBxZmPqmRaUdcAjrkcPuhETuTCyBhNTu",
		@"mzNQGErefPvCwwce": @"sYspqETRZHuLUlXTyrMtIAHamtwPeaLXpJTZAOCwhvEDQWvsBbFPsJfZsvmUmXuKpRINNPUULfaSBdgAbxpwdIkCgcqMQDiwFRpAJ",
		@"LMMznEjwSZMa": @"clyYplVHGTWCCHYxnLeiGfNiTeKzxpxKxKhPzeVVMCerrsbNTDpHekXFpaBZebLwtQxSVSpGxmaAPuATeRtPPgHKjWghAAXmckMEaNriZZCoJiyLNgmBYCsKWdqHanaHDxfntfsiDrAxw",
		@"lhQeTJtmXfMcOvbpbKxM": @"qxCXkxCBKyexagFKKXkOifGRnofQyuVjJvKyhwGjRmpQjZfbRJTTeYJNUxtcdKzabmxsRvWGjJpPBTdubBhINlpPvVXFgwHlfILREGXhugcpduziIgGYXcFfZcJTzecNjZH",
		@"AoLrSEkUOqgJgYapWfJTNE": @"MVapOolYmQvKyVUPqrRKBYuMiZFYidMkbSogfosdSssLTgmZKpjxApQIWLuGdXkBMnHnkDQyJrOrEHtDSGfEhkRsqWMihynLHToBNabLhFnaOInN",
	};
	return IjjnFqGJMia;
}

- (nonnull NSDictionary *)OABtobYBFYSstOKiMOf :(nonnull NSDictionary *)ufEHsKLdoxdZVep {
	NSDictionary *OhJNAOOVuvMIltQCqaC = @{
		@"ZjcPENRJcvWIHK": @"ydPGFzWZdwojAVDhjfaWfZEkPGXbrurprarmaFvQMzWdFiALhRURpSAhlarTWdfuoapwBIqQYRPbVWioiXMxdWalucWRtrPwQYcQtQdUkdeKuJIyXBGqNxMPUtoBP",
		@"wWloQyirjUEzrgwRsSPMbIo": @"DGDtCeNKkaiTCFLlUdSTfqHrBRkptSwQWIDRAYnGXXoiYzImxSnhtTIcLRfZNBuoMboCXfIxMThyfqjwdJiZSnIceZgWdiihhvepqUzKTbC",
		@"kZhFNZxFPebKhMdvAzWff": @"HQKwmLhzXzwOaWzJsnEorsYmOnNOGlXshHucEbyrlFRItpshEfMJMqXcoNWDzMAQezWmCMXjnMmOwwKDpzFLkpdcQNDuLvTLTSWedCcnCueRIDqfeEmmK",
		@"ueBTYblxiQXawSVC": @"pHyZhumxvbiJVuDEWFKEDHnwMSrOYASYCxQTTSOQswgXZQhWIEmAcxAkCusuMtTCDskNrLgzDewLhiObTDSrhIGNpZCsvWIedkHtDpbDwCyDjSiZXUNNK",
		@"COpkLABdaqHgEHOXrAOVssH": @"ocVdcDHngpSNuUyMRIoktRoLcrQskRelvKoyAeKLCNyupNXhOelFgtMymiNaabicHrAcUxswOgrhjyjgHZwZBiaiFMUaOWPHAkKSuMvHpGCcAeSdGsbzvGLaJwdkkKtqflxyzky",
		@"zfrPlegDVMyHxXNItpEKFuaU": @"AqaEZjpIBlOkpooyxGyFzjkajYEUFOrPzBtWFYnHwByHdNuINNaqHxGZItvGuXncizgcKTgiyOZBclKywTEzFqHszOHhTggxSpEXYRQifoijPXYcyRmzfrYEStyjRVnZrbZFkWUmXKY",
		@"KrOFDRtERYPolkUFkx": @"krMzUhKUzQzPpSQMFTKeJqovBQtNOOmpvuYrfYIVWtusqTqUeyNlFKuJEEwxVAhatgLMUWjewTBngMvAdJouETEMnenTLiQJDvdetaOdiLvHurRAWBhADTfhWay",
		@"YfCXTWfZdhAN": @"gEQXvDPvRNaZTGSIrbkULYcUUtpQLHOEkowXlEiuZqmBfLcMLeyZReexLEelXbWcUBaQIPwZGtMBtOaYlULHTbThbSrQXXLnWzbLLnDq",
		@"zyRPSTFoUsLl": @"YDQVlbOxSvCygMSIITLybInTCmRCdNrCRjdCDBtpOTyVNdcnjSzrvbKqTXPaQYoTulxuEVbXhonYAUZofvEcidtoWZnhdhZtMhky",
		@"kOGHFpBvHDWDpXtwHeyfgf": @"fagQKmeCtoEtmItUIbBzbkknLBwJbQbppDEOywSKaRFzVHMKBpgulBUjFUxVwfrbqZQTCybAAtXLOElSvkdaadkaYUgQuwgdqIkQZTs",
		@"aRAoBJXfWplLjh": @"CeEWwajXRaYOgKYHUydsOqLqyoXIFRzXJjApDoeuvhwhoObzmDMRLTkZxnXDzJpRDZmTaslnOzphpGyIrIUqJMVDpdIWymxuKQXynEwrpmpoLIsHjZgokyeaFnqaXEjsbIuSOBK",
		@"susRYMcQbkSFWxfySXXqy": @"paGoAWplitIUEDbFqQpoikGSsyGnouiUFwRQismDMjiPqfDAllomqbqCmsoWmopgfiPPrgaeoHsLYqkpZWNYFihqVphxLmrPkcJybTgCcYUcsYOn",
	};
	return OhJNAOOVuvMIltQCqaC;
}

+ (nonnull UIImage *)awimPiLJmq :(nonnull NSDictionary *)rFSLnCiEfvJoqDppvxiDfmM :(nonnull NSData *)shgCjehAplpwmCrYIjrZW {
	NSData *bzwgfBvfYMrrVH = [@"hujZMBEKrykVPWzKhFbPvHaLiqePtYtPxnyfrRNNzRvXXDJosKripXtRsgRQOezRPigMBeOedSENEQCsgisDfnVmPOkEQeLUkBdODwleXuOubXCeAcDoQThVFjMX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pzeDhtuUCySEsoXSbRdtO = [UIImage imageWithData:bzwgfBvfYMrrVH];
	pzeDhtuUCySEsoXSbRdtO = [UIImage imageNamed:@"LNuHTOnCJGxvbdrqJZRahDcvNatWJtMgJKmIdoZlMIEJwIJURbqtZjSanOnVzczioBBoLMVkzpjwsYRgjrRkfZXWsIBGzgJaxwmzJIFUIzWSIWYCkTDQvcxldzfzDTrtJxm"];
	return pzeDhtuUCySEsoXSbRdtO;
}

- (nonnull UIImage *)ojyVStyqRDEyulfRVKfY :(nonnull NSDictionary *)zroyMQKmZAIdsiBmCXmmq :(nonnull NSDictionary *)DOrCIXllUDnP {
	NSData *SlJnTuLTclruZP = [@"OkWOUZItUeiZOAZcmVYNDQqGhXgHSWudriZVHWwjgHvfIBkqFNtfJhbVLoCWeckBoFgzkhdgxTVGsSAMBOYqClSNmQRgiZvPlRFVNcBVYJfaDfUdVRiiVHmedYE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *utWuLwRjzGZeSquDVBgCjj = [UIImage imageWithData:SlJnTuLTclruZP];
	utWuLwRjzGZeSquDVBgCjj = [UIImage imageNamed:@"yVJMAsfzIJRNGIKmWhloiXVqQOupyadmdaRBOBhtITwSizDEzOmChbeWdsBSlrGvHxiPmJCwLisBOmSjPVqkZUbZwhZuBMlRVZrBVTcNvied"];
	return utWuLwRjzGZeSquDVBgCjj;
}

- (nonnull NSDictionary *)WqvvSikGplqzi :(nonnull NSData *)NfBHbxarXJIfHmioteXamE :(nonnull UIImage *)gIdNtyHonkAO {
	NSDictionary *miShpAnFHEaKgxX = @{
		@"qdkDowbWguINIPmsDILb": @"vvnDMqIoUBZKdQqrfXldFAlIjaeGdFhndVGYwkWmLpBtCmHhHmmnzkrtFxoYGSlabteimVVMqLzTJTByoOWeArGPTYqLWguLKdiaxxISadfNDSZlVEZoAkocLoYZFOfzXRT",
		@"LvFQHFXitZgaYTN": @"OOvsWZGdtCsyGKkktZwKMxWpxQCXfcXdmnuhcLGoKHSQGyxCZpmxeqvPjtMYnYJyGmLIGXkLFzGLcwsPqvVFtnemaJnoVjtMmRdOfnV",
		@"wiURhOXHPPCZrOUtEVwo": @"dEQCrgegLHFClmBASWItTvxCREPpZajItSCfzBfskfDQxldEqXvQXUEROTwjvxPVxNEeKhcCHPEUegyKkDbChAzFjzJdcVhbHEwNbOqOPNPnPvgVsiYQgyftqdhITAbhFfcc",
		@"aSLBAdHTxrSyHkREH": @"JWvWQAnRQyZNMHsBHjEMXjwGtximTXgadJpuLOxXGdhrFyRhWLjYzrDyQLXDCkFeHSwFxaHQPJcAJxCvieblGcmDeRrlZMozCznufShbfGKtqkvPMnywhTCxHcTxGhjVCORoIQeuRnI",
		@"IPIPVeczmZxkwQMEp": @"JxXhrjoYCTONzpdACFnFsCfghuIoDxglbTKlIRMifIdxMJvGXnVqfviLLfRjSkfYvBUKiQvCiVbgZZzcPMysOvlmknDwuAIkTdbsZOrNgVOwLAjMxmvzocHYWQKoM",
		@"rdDasrnpNnmpxsVrcFzdCRlM": @"fAfQsVOOawxBxsxCeeTPKbQcFiFznVdlZRgVwlvdiYvyziLoyFpsQegcMxtPrKRhrKaWhGQTPMkotAEAfbGhgqXOWZQGQrzDCJmoHvYslzFbPsfwe",
		@"BmyezkbBbOHKZOS": @"huAbhtTnPAJcUkpaCVKsWSlfSEibtAmiLwLkKGNptcCoPJlhEQMZqVtVKGgNxNxSyZvoGSJythZuErowiibSzIZYEJlMImfiviWxQFialZFDvdd",
		@"zSdSflsFhQjPma": @"oHGVsKwPcGTAsMZBcQTeommkklKRzLruzWhgvELqYkjviBuhvgOmzfFmjtivsFIAiBhAuuVxipsJbscZmtHoSwbiUxsRYIUovQPwoYqRGwRJRhWhLiNfGXUKDmGqdUqDnlsONpXV",
		@"npBQYjCiaiO": @"ZbeoPnMMbpNYxHnswVKoRAZFehULdgPpagQeIxABzclCnJhWUiyROmHaYomSltAQMXjQNSHvRPWWQiGZCflcCXHpDlxNBjXPHwtMOlySVtRJAQxypqzfxWGptNfBwAJUVeVYQirxEund",
		@"hFhrGmdlNDDWNBqFgJW": @"qyYmsQXSyUxfmghxQONBWfQlNycmcZerEqjaXDxYWUKmOHwLLGdrfmkZXEkwOlQullJUTjmfuXiNmdEZtOHkGGzkDdbiVEjXcMhhfSbHWxXLZqEgbJHxOEnVJYeGSQYJGJXrRQpuJ",
		@"OCvbMaqhBhTDRYMlnwsp": @"jsrpAjKRcNYBaoLlvGQnjPdpTOqhFQIxLoCgNSnrtYCmixEilYqtDjmKPUwbNtufyeZPiIAEeGvSECliAlHXqvkWyIVagjZyfnelUuJSqyqILUKFGBBfynyw",
		@"JKYPEOrSbsYQVQMgmRvaQ": @"ZoqPhHmnwdPtJhKHbxgrPDFlIPFdRArujJIzDDvZwDpkcmaPYZZHZbrDQsUsJTdqgkkgovaDitDvzcoCiBmXmoVZCuyAwRdyAlRdyojmFLllZbPVdAPiWpnFyLfMIVV",
		@"aijHitMNLVoTA": @"dFBpOlZfwhkHUGhTSHJgShfnkfgrDJXrRwGjEXGAdzblBmMfqOHEDaFTfBowYaibbJVCNQVlqvQkKClLIhXTCEoEokjDaQZKLJrQVaAxOyHbhaCkDrLLbOprvyttflzKvffRmxAkbHHhBa",
		@"cIVzQVUJETOpzfPPszq": @"ysRvwZgOJwVheSBJfHJKpSrguNkgcXaQjjmmBnjtwllGWJCLXRykatZbibFiMPCUXsqgHcOZOTCpbhjfyvLVUDiKnwuJXNrUcSEvDSXZhnxypJwfQECmSaQDPIvmGCLvuNgdNScjdE",
		@"DGCWzQhNYusQECLghsiFRRH": @"QzpXFzsHMjEXAuQycmVfAbrXYTDoVofiKHTHEjTLdChJTnNvsgfSVMcrdPZEOJSRCQYsCDEPQGhyyLOLzZGxxKmBzcpqlnqhgfQwLJrYmnHNLFlNB",
		@"kFOQpjjwqoTZVQGIbZtVr": @"tiYLzBquntElmacluKXmhrvyYUneRSSqsNegShVXUGUyeMoEgaSDOuxgcwxWeHRWcyXYBfPygLamNlpLCkOIfEOutTNfVqKEhNDC",
	};
	return miShpAnFHEaKgxX;
}

- (nonnull NSString *)opemyoMSaXFPmNfPtLYN :(nonnull NSString *)mhJxYGFYdZHMhiegv :(nonnull UIImage *)EioXUvslGKXKZdlfYicPInGV :(nonnull NSDictionary *)fSgPNxRkxxzVgLPTa :(nonnull UIImage *)ItpCGWMEMUlE {
	NSString *nFuKMBpuZpQyCztfbJ = @"naJPjdPSLmHEETmdLcFRHcHRFuyQmXfVsXbYbGCydTuqbBzxaRvLdSIcrlHxcDoSTLxMgKVVEmDEaHotwPomrlUcSWLVdEedVyeJvZVZu";
	return nFuKMBpuZpQyCztfbJ;
}

- (id)dataAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isSearch) {
        if ([_searchArr count]>0) {
            return _searchArr[indexPath.item];
        }
    }
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

#pragma mark UITableViewDataSource Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableviewcell" forIndexPath:indexPath];
    if (!cell) {
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    UIImageView *cellimageiew = [[UIImageView alloc] initWithFrame:cell.bounds];
    [cell.contentView addSubview:cellimageiew];
    NSString *nameString =  (indexPath.row == self.menuselectIndexPath.row) ? [self cellSelectedImageNameWith:indexPath.row]:[self cellImageNameWith:indexPath.row];
    cellimageiew.image = [UIImage imageNamed:nameString];
    
    return cell;
}

- (NSString *)cellImageNameWith:(NSInteger)tag{
    static NSDictionary *mapping = nil;
    
    if(!mapping) {
        if (isPad) {
            mapping = @{
                        @(0) : @"zhengli1_btn_ipad.png",
                        @(1) : @"wifi1_btn_ipad.png",
                        @(2) : @"fengmian1_btn_ipad.png",
                        @(3) : @"list1_btn_ipad.png",
                        };
        }else{
            mapping = @{
                        @(0) : @"shelf_edit_nromal@2x.png",
                        @(1) : @"shelf_wifi_nromal@2x.png",
                        @(2) : @"shelf_pace_normal@2x.png",
                        @(3) : @"shelf_list_normal@2x.png",
                        };
        }
    }
    
    return mapping[@(tag)] ?: @"";
}

- (NSString *)cellSelectedImageNameWith:(NSInteger)tag{
    static NSDictionary *mapping = nil;
    
    if(!mapping) {
        if (isPad) {
            mapping = @{
                        @(0) : @"zhengli2_btn_ipad.png",
                        @(1) : @"wifi2_btn_ipad.png",
                        @(2) : @"fengmian2_btn_ipad.png",
                        @(3) : @"list2_btn_ipad.png",
                        };
        } else {
            mapping = @{
                        @(0) : @"shelf_edit_select@2x.png",
                        @(1) : @"shelf_wifi_select@2x.png",
                        @(2) : @"shelf_pace_select@2x.png",
                        @(3) : @"shelf_list_select@2x.png",
                        };
        }
    }
    
    return mapping[@(tag)] ?: @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return isPad ? 44 : 32;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIImageView *imagevieww =   cell.contentView.subviews[0];
    NSString *imageNameString = [self cellSelectedImageNameWith:indexPath.row];
    [imagevieww setImage:[UIImage imageNamed:imageNameString]];

    
    if ([self.menuselectIndexPath isEqual:indexPath]) {
        return;
    }
    self.menuselectIndexPath = indexPath;
    
    
//    如果是0 整理书籍
//    如果是1打开Wi-Fi传书
//    如果是2封面模式
//    如果是3列表模式
    [self editBookShelfWithIndex:indexPath.item];
    
}

#pragma mark 密码锁Delegate

/**
 *  密码的长度
 */
- (NSUInteger)pinLengthForPinViewController:(THPinViewController *)pinViewController{
    return 4;
}

/**
 *  检测密码
 */
- (BOOL)pinViewController:(THPinViewController *)pinViewController
               isPinValid:(NSString *)pin{
    if ([pin isEqualToString:[[self dataAtIndexPath:self.folderIndexPath]objectForKey:@"password"]]) {
        return YES;
    } else {
        self.remainingPinEntries--;
        return NO;
    }
}

//重新尝试输入
- (BOOL)userCanRetryInPinViewController:(THPinViewController *)pinViewController{
    return (self.remainingPinEntries > 0);
}

//验证成功后退出验证界面然后打开文件夹
- (void)pinViewControllerDidDismissAfterPinEntryWasSuccessful:(THPinViewController *)pinViewController{
    self.remainingPinEntries = 4;
    if (!self.isGridView) {
        HBookShelfInfoVC *bookInfo = [[HBookShelfInfoVC alloc]initWithNibName:(iphone)?@"HBookShelfInfoVC":@"HBookShelfInfoVC_ipad" bundle:nil];
        bookInfo.folderDic = [self dataAtIndexPath:self.folderIndexPath];
        [self.navigationController pushViewController:bookInfo animated:YES];

    } else {
        [self controlFolderWithIndexPath:self.folderIndexPath];
    }
}

#pragma mark FolderViewControllerDelegate

- (void)tarnsFolderDeleteBookSWithArray:(NSMutableArray *)aarray{
    NSArray *tempArray = [aarray mutableCopy];
    if(!self.deleteBooksDictionary){
        self.deleteBooksDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    
    [self.deleteBooksDictionary setObject:tempArray forKey:@(self.folderIndexPath.item)];
    
    if (tempArray.count == 0) {
        [self.deleteBooksDictionary removeObjectForKey:@(self.folderIndexPath.item)];
    }
}

//文件夹内选择阅读
- (void)didselectBookToRead:(id)data{
    [self readbookWithData:data];
}

//文件夹内移出的书
- (void)didDragBookWithData:(id)data{
    self.bookFromFolder = [data mutableCopy];
}

/**
 *  collecitonview刷新数据
 */
- (void)reloadyourViewba{
    [self.collectionView reloadData];
}

/**
 *  获取新的密码并修改保存
 */
- (void)transWithNewpassword:(NSString *)newPassword{
    _collectionSortArray[self.folderIndexPath.item][@"password"] = newPassword;
    [self writeFileArray];
}

/**
 *  获取新的文件夹名字并修改保存
 */
- (void)transWithNewFolderName:(NSString *)newFoldername{
    _collectionSortArray[self.folderIndexPath.item][@"folderName"] = newFoldername;
    [self writeFileArray];
}

#pragma mark UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.isSearch = YES;
    [self enableAllBtnWithBool:NO];
    [self.headerView showSearchBtnMethod:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSArray *arrray = [NSArray arrayWithArray:[BooksDataHandle transferAllBookArr]];
    [_searchArr removeAllObjects];
    NSMutableArray *myArr1 = [_searchArr copy];
    for (id book in arrray) {
        __block  BOOL ishave = NO;
        [myArr1 enumerateObjectsUsingBlock:
         ^(id obj, NSUInteger idx, BOOL *stop) {
             if ([obj[@"title"] isEqualToString:book[@"title"]]) {
                 ishave = YES;
                 *stop = YES;
             };
         }];
        
        NSRange myRange = [book[@"title"] rangeOfString:textField.text];
        if (myRange.length != 0) {
            if (ishave == NO) {
                [_searchArr addObject:book];
            }
        }
    }
    [_collectionView reloadData];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self enableAllBtnWithBool:YES];
}

#pragma mark CustomSheetViewDelegate底部AlertView的Delegate

- (void)sheetView:(CustomSheetView *)view pressedButtonWithIndex:(NSInteger)index{
    NSInteger indexx = index;
    if (indexx == 0) {
        [self readyDeleteBooks:nil];
        [self controlDeleteAlertSheetViewWithBool:NO];
    } else{
        [self.deleteBooksDictionary removeAllObjects];
        [self.collectionView reloadData];
        [self controlDeleteAlertSheetViewWithBool:NO];
    }
}

/**
 退出阅读页面
 */
- (void)reloadReadingBook:(NSNotification *)notification{
    [self controlLatestReadingView];
}


- (IBAction)changetheme:(id)sender{

}

- (NSMutableArray*)getAllBookAction{
    NSMutableArray *bookArr = [NSMutableArray arrayWithArray:[BooksDataHandle transferAllBookArr]];
    return bookArr;
}

#pragma mark - collecHeadAction

- (void)transBetweenListAndGr1id:(id)sender{
    if (self.isGridView) {
        self.collectionView.collectionViewLayout = self.layoutList;
        self.isGridView = NO;
        [self useGestureOrNot:NO];
        self.edit_compileBtn.hidden = YES;
        self.edit_deleteBtn.hidden = YES;
    }else{
        self.collectionView.collectionViewLayout = self.layoutGrid;
        self.isGridView = YES;
        [self useGestureOrNot:YES];
        self.edit_compileBtn.hidden = NO;
        self.edit_deleteBtn.hidden = YES;
    }
    [self.collectionView setScrollsToTop:YES];
    [self.collectionView reloadData];
    [self.collectionView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
}

- (void)searchCancelAction{
    [self.headerView showSearchBtnMethod:NO];
    self.isSearch = NO;
    [_searchArr removeAllObjects];
    [self.headerView.searchTextF resignFirstResponder];
    [self.collectionView reloadData];
    
}

#pragma mark -下载完成时候刷新书架

- (void)EBookLocalStorRequestDoneFunction:(NSNotification *)notification {

    [self writeFileArray];
    [self setupData];
    [self reloadShelfData];

}


@end
