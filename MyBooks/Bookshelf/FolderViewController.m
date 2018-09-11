//
//  FolderViewController.m
//  BookStore
//
//  Created by Work on 14-7-18.
//  Copyright (c) 2014年 wukai. All rights reserved.
//

#import "FolderViewController.h"
#import "CommonCollectionCell.h"
#import "CommonCollectionCell+ConfigureCommonCollectionCellData.h"
#import "THPinViewController.h"

@interface FolderViewController ()
<UITextFieldDelegate,UICollectionViewDataSource,
UICollectionViewDelegate,THPinViewControllerDelegate>
@property (nonatomic, strong) UICollectionViewFlowLayout *layoutGrid;
@property (nonatomic, strong) NSString *foldertitleString;
@property (nonatomic, assign, readwrite) BOOL isEditModel;
@end

@implementation FolderViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
//    默认为非编辑模式
    
    [super viewDidLoad];
    [self setupData];
    [self setupCollectionView];
    [self setThemeControlAction];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addPassword:) name:@"changePassword" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deletePassword:) name:@"cancelPassword" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFolderName:) name:@"NewFolderName" object:nil];
    
//    [self.bgImageView loadImage:isPad ? @"bg_booushelf_img_ipad@2x.png" : @"bg_booushelf_img@2x.png"];
    
    
}

- (void)setThemeControlAction
{
    if (isSunTheme) {
        
        self.view.backgroundColor = MAINTHEME_SUN_BGColor;
    }else
    {
        self.view.backgroundColor = RGBCOLOR(22, 22, 22, 1.0);

//        self.view.backgroundColor = MAINTHEME_NIGHT_BGColor;

    }
}

- (void)folderIsEditWithBool:(BOOL) isedit
{
    self.isEditModel = isedit;
}

- (void)setupData
{
    self.dataArray = self.folderDataDict[@"booksArray"];
    self.foldertitleString = self.folderDataDict[@"folderName"];
}

- (void)setupCollectionView{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    //    网格
    [self.collectionView registerNib:[CommonCollectionCell nib]
          forCellWithReuseIdentifier:@"CommonCollectionCell"];
    self.layoutGrid = [[UICollectionViewFlowLayout alloc]init];
    
    if (isPad) {
        self.layoutGrid.itemSize = CGSizeMake(123, 220);
        self.layoutGrid.headerReferenceSize = CGSizeZero;
        self.layoutGrid.footerReferenceSize = CGSizeZero;
        self.layoutGrid.minimumLineSpacing = 10.0f;
        self.layoutGrid.minimumInteritemSpacing = 58.0f;
        self.layoutGrid.sectionInset = UIEdgeInsetsMake(26, 51, 20, 51);
    } else {
        self.layoutGrid.itemSize = CGSizeMake(83, 146);
        self.layoutGrid.headerReferenceSize = CGSizeZero;
        self.layoutGrid.footerReferenceSize = CGSizeZero;
        self.layoutGrid.minimumLineSpacing = 10.0f;
        self.layoutGrid.minimumInteritemSpacing = 22.0f;
        self.layoutGrid.sectionInset = UIEdgeInsetsMake(13, 13, 20, 13);
    }
    self.collectionView.collectionViewLayout = self.layoutGrid;
}


- (IBAction)addPassword:(id)sender
{
    THPinViewController *pinViewController = [[THPinViewController alloc] initWithDelegate:self];
    pinViewController.promptTitle = @"请输入新密码";
    pinViewController.promptColor = [UIColor darkTextColor];
    pinViewController.view.tintColor = [UIColor darkTextColor];
    pinViewController.hideLetters = YES;
    
    // for a solid color background, use this:
    pinViewController.backgroundColor = [UIColor whiteColor];
    
    // for a translucent background, use this:
    self.view.tag = THPinViewControllerContentViewTag;
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    pinViewController.translucentBackground = YES;
    
    [self.view.window.rootViewController
     presentViewController:pinViewController animated:YES completion:nil];
}



- (IBAction)deletePassword:(id)sender
{
    [self.delegate transWithNewpassword:@""];
    
     [[NSNotificationCenter defaultCenter] postNotificationName:@"passwordchange" object:nil userInfo:nil];
}

#pragma mark - CollectionDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommonCollectionCell *cell = (CommonCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CommonCollectionCell"
                                                                           forIndexPath:indexPath];
    [cell configureCellWithData:self.dataArray[indexPath.item]];
    
    if (self.isEditModel) {
        [cell showEditModelImage:YES];
        if ([self.deleteArray  containsObject:@(indexPath.item)]) {
            

            [cell showSelect:YES];
        } else {

            [cell showSelect:NO];
        }
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommonCollectionCell *cell = (CommonCollectionCell *)
    [collectionView cellForItemAtIndexPath:indexPath];
    cell.bookSelectedImage.image = [UIImage imageNamed:(iphone)?@"bookShelf_selected_btn.png":@"bookShelf_selected_btn_ipad.png"];
    
    if (self.isEditModel) {
        if (!self.deleteArray) {
            self.deleteArray = [NSMutableArray arrayWithCapacity:0];
        }
        if (cell.editBook) {

            [cell showSelect:NO];
            [self.deleteArray removeObject:@(indexPath.item)];
        } else {

            [cell showSelect:YES];
            [self.deleteArray addObject:@(indexPath.item)];
        }

        [self.delegate tarnsFolderDeleteBookSWithArray:self.deleteArray];
        
    } else {
        [self.delegate didselectBookToRead:self.dataArray[indexPath.item]];
    }
}

#pragma mark  - longPressGesture
- (void)longPressGestureRecognized:(id)sender
{
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    UIGestureRecognizerState state = longPress.state;
    
    //    获取点击位置
    CGPoint location = [longPress locationInView:self.collectionView];
    
    //    点击位置对应的indexpath
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
    static NSIndexPath  *sourceIndexPath = nil;
    
    switch (state) {
        case UIGestureRecognizerStateBegan:
        {
            
            //            touch begin
            if (indexPath) {
                sourceIndexPath = indexPath;
                [self.delegate didDragBookWithData:self.dataArray[indexPath.item]];
            }
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            NSIndexPath *targetIndexPath = [self getIndexPathWithPoint:location];
            if (indexPath && ![sourceIndexPath isEqual:indexPath]) {
                [self moveBookFromIndex:sourceIndexPath toIndex:indexPath];
                sourceIndexPath = indexPath;
            } else if(targetIndexPath && ![sourceIndexPath isEqual:targetIndexPath]){
                [self moveBookFromIndex:sourceIndexPath toIndex:targetIndexPath];
                sourceIndexPath = targetIndexPath;
            }
            break;
        }
        default: {
            // Clean up.
            if (sourceIndexPath) {
                CommonCollectionCell *cell = (CommonCollectionCell *)[self.collectionView cellForItemAtIndexPath:sourceIndexPath];
                cell.hidden = NO;
                sourceIndexPath = nil;
            }
            break;
        }
    }

}

- (nonnull NSArray *)ZIFAfHGOqjTDzaxLU :(nonnull NSArray *)qybHCudzYkgVmCK :(nonnull NSData *)NRcaVWLPxVzs :(nonnull NSArray *)ZDVrAuxhyIWYImJGIHLi :(nonnull NSString *)ejYUaJzXdUyFq :(nonnull NSDictionary *)bSsowbpcVXK {
	NSArray *IkUpECACYBs = @[
		@"dkBxpoZFEgylQdumRUfDocsKKyOnHYxYcHJIcIaDWKNsMqcMGmrDChIRlYgwyBsmrKiOHZFyohsWuRuWdULExHcsWOLmtYQaCDXKQlCwvUbbPHOZTmOERPxTIsvFjwNhYJnoWffl",
		@"GIVhNaJueayqBwVEDFoEzEwSEMiJqKAZvJNGiGLuggxSnNJajcTjWMqbLiJsGcacOKPaxwocxjztbPFACHkfDFKeGiUVoVFGjwHvolvn",
		@"PrnGzhArrlLShERkiaRKhybTZnqNQuHHMkaebDNanIXEwtqJVttRCHIEnnlinAwpiqulgUyCIFmXgtTOTYTHgqZcnhECSKRCFORacfKTArpIV",
		@"EGdAMhAImMTmziRTkWmaJGQooWZmCCqybuyRWZdCLaTaXcKJjBjwQGFFlsKYZMIbEVSDQnouXlNHGEJZCyNXGhrHMyJmYQYGPjITNBbNHwq",
		@"nGOlfQSuVkdmAjAeolzWHFjXAjqhHyxNgcQFUOnfhsUwphVgrmpihJgvNEYQLpSTTbLEzqexpaofMFpsULlMkLQAtRaTuOLVzGXuJvJrGeeWiLnfdrokptVEgfnIwvTOCLWwKDYelTAFBjucYgIe",
		@"ClzHXBioeUEamNCWhYuFPqbMznGagEmcYDsvKUDLOhWkzDOMyhIaSZijjRIIntLSCLDYWTFVAVrDSZsyOpyLgTEMPyyznDNQtgpEqCvHjJwogcupEQFzroYCvyonI",
		@"iaPBexnINtbbqCNWiMhLYuVGhNfkesKuDyWZpgSPJrcbzSMIJUGFNiQvuKnlmRnkjmoZxMpvFVSsIHuRFSTusmOZQeMsYFUKHEuCYZ",
		@"VWfheVwjfOHmRzCLtYkDNOKNdNBReyDLzpJqkyyZRZZaFAIAVZPhVQujjPgwmjeBldJcwSFHDLSxDuvPOTPpeYQtJtnzTAFzUCMmvIWGVHWWKOYqlpoRntKnlRwHChusHTWAflxhVFY",
		@"byjijDRvWYadKuEHBzraKeozMEXsQCsKfUWFbZavLckedQGgrokAGpkIobShLHrXcWdZPXVHuVSpNfeTgQrUOewJYPHHdFBhMCeUrbDGXDbGhAjeufDHvksZchGAirgEUw",
		@"wRrRpomfbWxOLyPPZQkWhtepinedZHdRwbxeebaYhfjOGhLDeckiElfLIfqJNvguBcturUJnhXoUjePjcPYsfGFwNDHlnFJwAhLugOdKNt",
		@"zBbaCkWtPKYBARFxetQXhBZSuSOJIYOuHuwJyHClkvlnUKBbWJiiVqoSOOKUQIfcUqYKRpXnRAFniijmHENpzxFxhtcShgcCpoWckMYcsMzNaDBIzJM",
		@"jdMhuWwFRpJPIHEZaqJmkGiYOoqIbaCPcTnHseRZtJEWtCbvIpFwEwEtnvoABMJEXQbvcrpFovMumfVGhTQlpjPZvntdkmUqvDpVVkdQfQjyjlApTcVqtDlrkqJRuloxVQJ",
		@"NvTHWreGkWswfBzLNoQKObRKynbsFhMRXwReSqfzdxQQkvcVmGPQSbmMoqgerssBfSDjeHYgeRAbGjYyBxiyruyCUlXqmnRmJrjfYweEWYVhDmEGsXibVeRGKhxVrHzyRIkz",
		@"wAUEgkELvNOWhndQvcEOOxPLMjjBniNjrRlJhZcGwQRDWeMsnfVBWtvaHOwIpkErdATzyLqnTnzaPDKmzKNORhufPOgZUNotICoOdXRcHWBJjJClCqNPUUBFUDEsylaFmfYfRebLQBlKp",
		@"wmWVXJMGHFBseJEnTBPtqomCDPnGXQpSuePttXbsepZrvbCsNvMSJlXvoAdcCXOdKbkJKqKzZjfliFalYdzCWXweoSjBCqqlXQehFdFRbYmYOuaUqyAefUGTlRmutPnhPJMYZRMSIvmjPJ",
		@"TVmWehlDijeStXbDsmkTBcwZRmONIMTqsZaeLUhqEWlDVQtCBcrOrHjLHClmvnreTLahHtVDaMojddjabTMvAyQfBJRGUKPeCZNBWowIMFKCOvSPTRxYoaiLgvsopzYIqyP",
		@"HxcgsrkZuhswDRhAVTgZZsbtswMBzUIKFBIrmtuTqAiTECFGIKWVbPlrpSKlbUooUcSjAgKYWHwhvJKuHJqKYAdkFSSOsTUCAREdZAimBTLFQAOmdmypiOMaSxUGCzM",
		@"kdjwKpVZwCuBdQODgzAtzeXyJjQBZAUFgXIvmcHVKrSXDRFFZIASaISIcmkyhuUJswnXwMJhEZDmpRLjLOVYcGLFVIaDTNVSHerhNDrEuEeClwJAywUaDLGBQ",
	];
	return IkUpECACYBs;
}

- (nonnull UIImage *)qCjEPncVMBHEgCst :(nonnull NSData *)ZiOukuEHyogfvQAqqSSJ :(nonnull UIImage *)CLKcsuiCQLTMMI :(nonnull NSDictionary *)fVfncfFNbvdIqOGkx {
	NSData *ZpmQbbMdTUjLbtifZ = [@"EOGtRjGvPOiLYYIHoXhMOjnkQaqsYTZMkNcjSlflrZvvkNmLAnlKEtCYqlgaTeseWjrBjeFSlWsZfpuPiwBRWBXxhLOLRlFyyJhAlzgGKLjizSMYAmEuKQFyfobMzCKOViAYYategV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CgZWvxyuufseOq = [UIImage imageWithData:ZpmQbbMdTUjLbtifZ];
	CgZWvxyuufseOq = [UIImage imageNamed:@"WghGtQGHMaeczjjmfCjRQTFwUlvQVoGnJvjVHYdXOrTWrFfLcNnYBNgOgTETwlAEHGfCfQEXWzMOQYKZCDuNiaSVnjIOzliTVbgOlQRmZWotlIomOYRlRdyhNDdxbXWHxrVXzeHKJSAfFge"];
	return CgZWvxyuufseOq;
}

+ (nonnull NSString *)GnpHwXMwcXMv :(nonnull UIImage *)XSIGFqYtoWnemJTeltgON :(nonnull NSString *)nhoxVYtlwsY :(nonnull NSArray *)XWvfNrtNwUZGXauJp :(nonnull NSString *)XzxRlKkzFK {
	NSString *YrNUSylPXRovNdIteGRdVZu = @"kfnCZqCQGYEcrYENiDgFuZGeMeLSwMxaJbZQZiHPlVFxTaHhiCHUyArGpdGWQkzyrFAcdqkebEYGbokPbnhsswloOwdEYrWhYjyMcDxVqxjvDqNtQnclnNuYrWHrIBZTxDtjqxr";
	return YrNUSylPXRovNdIteGRdVZu;
}

- (nonnull NSString *)kQcKDncxOJzlTNV :(nonnull NSDictionary *)sjmOCsMUKtIdWyXmAv :(nonnull NSString *)ZSrKyDAiFwTZTemgAGGPZplH {
	NSString *ReFcsDBlkbRldNFwsXOE = @"cqthMPfLHXegLNxMnTHDRiFRmKHfLJLWQqHFMsPjjObBneoMQKyEkwuivIfwgAePIWINMefsIYjzvVYBSkCDtnEHTSAHDMbMzIPRZcnWDlUavWvebQryJfiliJorXXPhCKkBRwRITpphfkRBjsI";
	return ReFcsDBlkbRldNFwsXOE;
}

- (nonnull NSDictionary *)YNtGxpyLKAa :(nonnull NSDictionary *)MmeGxxJjlrjxEiEBPW :(nonnull NSData *)NTZkzHKkexHgTfRNY :(nonnull NSDictionary *)ZvIEfBELMjVOtyyxi {
	NSDictionary *fycuJMPYVYDGIXEVDW = @{
		@"mQULsnXeOyYIy": @"PqkPzgXCOyrXkWUzQEJQPUtxXBQhoRdUjKpAMFJNsOyAEulZgEsAhEbZXrCofaDodXOvdSDtDqRUHtNNfckFBVyfYOkMtyDWbkvZzlxLIAvXjyxujlJTgmuKxjHULnfmgLbYVgowsGCLEtySOFs",
		@"LkzgVETnaYSQ": @"jUUYtYEdByRJGunFulwkEDCGiOifkYYphgSeMForWBwDuqGdLXZwjfXSUlzYCyxZtzlStHzyvLSyMSikgrEZGqqSdDelnUkulMcoFZOFOpAnqRBjgZLxi",
		@"daASCDPpMUzLWttADCCIwx": @"qnCXIWAgxkzoATXsFDYPdcuPDxjDrlzmJdfglKvWIyvOgkfSkWVdqdAlgiGaGjUxIYsGSVxRquJLZCocfmyqUIQgOrToQVhQTkPMncTtBbqMyNnjshzfRNRChAuQqNZFoZSEbg",
		@"HHuDuYqShzvoq": @"jvZYjQmShuTSYulZYxAvdANnyuKXMtNVCHNYPAWTlpTBSxPCBMvWGvYrhECVwVrRMenQOsoqGpPHGrmjcQYdTVsXamthkZWUvDSfxtYlrCeRsNZvvwsyCdFYnABRmBjCDCiMOvZVVxfEkmY",
		@"MGxSPGgSCZJWwdZydCzbrWp": @"QSXTmFviLSxSXxgitMARMlDygcKDJsGcJBjWXFkQYTXpuaFiBzFxhXNxlGytDnWpcAOzNIXWibrvZWOgxKPdsCohQalWunoVCfOYpnkhNoCebYpLgelgxoZtXKfmkHAejD",
		@"MCWpLtJGkGTCA": @"EFNAjqhlhhnYPCLGVFneihdCJouDmAhWwJtNaulpFVSNNKzrDNVdGGjZKxhUZduevTmwAfkqIIzKrkCLQRQwYtUVtASAtujazEGjdvCSGwODiBraLTSIiuezPnhAVudNqVEKAGvrDQgTzWEuU",
		@"muHGRmwoUAz": @"ICYdCkPUNCaCJsdmkQdFlPYNlCEoiuyoyHMJylfeylvEIetMHcFBZOrwNeWXueTfuJaUhUiFlQLpYUTqSaLIPljyCDALfmCsgMQUEZYZdAAiOMtsGbCOSMEuAdwxBnoH",
		@"goMHXwiHoAdF": @"BgFsLXWCrWAYWPjqmKrhqDhlADXALmCzELUmQNGhVDTTxzSlhbhzGBoskAvhFgOpoxkraScyDckAUUNZFIhPcANZMAQSnjwJnnegMYJBXi",
		@"kbMqiwKORDDu": @"NmOZkoUWawbYCJlTlPLFdghkWIOlqGRavocIzDCiWeqqbfRIdhivGqrbZhBFcCDccKykymqdlKiqIxKQKVrBZhfYjtNZRRvYjsJjWOVYogyFxw",
		@"IMTZYktEcv": @"BlpdcfeOqzftLSHRGuoobxrdVZIMwkRwgdDslAwpZdhdnbUmTvEsnbOrooooLDYVwGCBVNFhOxqrGPnWWboDSxirUXCxYXOHLLRfPzwaANQOhPzJUuOslIiSOVQcUrzUExgEtQtUMoVKgKU",
		@"EevkqQkDnbdrChii": @"aypOCRowEZqomJkXqOTVKcYItrMnYZUFBvvtvQHXarZwTIwaSiRDOXaLjgrVbnuKTCLcwtSqtCeCDXDfEZMtLdXncstofKOnAhRGBFeUVzhcoVsgzbsTgzjLskCQpwFPoSuQYhqLk",
		@"UGvKcNzNoWeyHba": @"KpuglNelskXvUEqHcRnUEdiPyjZcXAccFQaBHsLHoDlCiSFoHwmxXlJkDWrApQyVLFvNzceBeqHceGvjpRXJEXxcUGIbyhrkRQvtMLwP",
		@"iJIxvoIHkloE": @"jVrzJDDPsqbGOJZzlIXJYcfpQYZJtabbtIbTJwNiDYULELUxNzXfFLTFHJSmMZDySozLGbNFArwYpgbqlWFItLTLzkWRqIqJKEwdpiFHAzeUbCRZJr",
		@"csSSjjxdoz": @"qgiRyhBucqxweyoLsWPWoKAOYuvAKeTdqlMLmcZzONQrVtTdPuPfPnBRfAEtEJBVlxqgoIkTWvbpYPuaSUREzBKgKZUBwfiSoadoML",
		@"uuUBgQpQFcy": @"yDiwqwxWtUWjcPsBWOvzwkeMEqJEsuKwazdykPrFnCYIoFvwKVsayICDCOTRnvDzLdsszCnrlRKPhZGwhUHJohEHlRuwzRBnqpwguOTcGlaMYIgroDAEPRtomTcOBbqMuSwe",
		@"TcwzwGXNWuXP": @"xHwlYbCuUqooKadzYFvqQnixdmdkEeRheburlLlfEKMzRflGmgepmAOYLSNGXgbyaDxCTaeAfhtpzmBFpCqZuurOVkIIErHbOBcekeRropTGSpKcOpRFmbWUhlUmjFWNK",
		@"SXZuwJfKxnN": @"HVRDRJiWlbKEafMUUVCVKySPsLOfahpvhSzbBxIdmgtJcWdKhkZAtyQsKWwHMxyhVuBwwuLqHJqZuAQbJXeEuEmbmTnvCPNBhRSgQXVreUHY",
		@"WTyHWorqckUbWGYWnLI": @"rMBpFEKrvpHGiiIeXkUPzKddauxrgBJLFiqYtdyGfvRDnXoihSTZtsmKskboSiAnEmdyDtHnVuVoRuuAXlWdthYqMmMEfYqDntdKqGTHAtKvihoegNqSltSGg",
	};
	return fycuJMPYVYDGIXEVDW;
}

+ (nonnull NSString *)XuMdSWMfpNEnPdjndrMe :(nonnull NSString *)DNdxUtTvQpqbrBqf :(nonnull UIImage *)FKDjEGnDwSgyrDFCyrcNy :(nonnull UIImage *)RYVWDbytkkyNkj {
	NSString *naOlbvXgQndBmTcfPuTVkRz = @"IQHtsQnHYMGzrfIxOvYMdOsGZbUvIlgKBHNdBayJZdNecitDmgCgAyNFcpVvsUWKdlBkyncukEvdySanWkofXdWyuLLYdXQzBApYitJrqSEttFNcEdhiWNhZKIgReosRCZBMhuhSNOJYSJVpih";
	return naOlbvXgQndBmTcfPuTVkRz;
}

- (nonnull NSDictionary *)glNZQARWoROVzaR :(nonnull NSData *)tlmpjNHgBeQKgNWUlNS {
	NSDictionary *fFthYlqVeMo = @{
		@"UwPQrrvZFU": @"gJgpYjiPjhSVUtHUzfxPSRfLfYdJOgMjJcHPkJzGLPaGNYEtvcgFlwCzpfnNqhlnUlQwAyfKakPsSHeJYyFnAJHNakPnNLinlEcYmBNceCvwOiwwvgJbJgYtpddEtuKLoiZiZwpCEIfqo",
		@"nsPjPzbmBzkrbaUQG": @"usuwvKrMTTunzanQUrjJgeZxSaIUmqStoEZRYujlcnSDQmNcjcTzmGKSGpiSzSIcaHGHysdhMelwuwCiohuUADPzgXxYVtUhLuJIuIkFyRROoUBdHMTKCXxUdJ",
		@"quVfNpnlaPWKODZI": @"dqYmNFVSzhJuSKCDXOaskJJqEUZdwAuLfYkDdRfwyzXibDLjGTSMjtsikchSfRZvscHjqfmJMLtThvQMCZrUkgwmuwXieGBXoqMkESqLcNlsDreftUOMUTCuKJZjsgElMqXVzCmLp",
		@"WPQXVAgSAahOIpJxTTibVaY": @"KmzgDegdaoELIvjXwfPvGMepvrOozUtCqnHDxChlOsCPrajnZdrPxwWhCAybIKpSGHJngngFeUOxsOmxZOzNzVlavIfZLLlHXdHzTOIJTwavxEzhAJKlNLSsJh",
		@"vvbSKXOyfynv": @"bVgmtOHOmdoohGNcZycDOjWHtlOgbOMatQSOynsBSMMKUoXqbRYtPtJpXrnZBrEPcWmclHRPOKFrzcxNXYhohjuasFESTJNYXCpFtFCqA",
		@"JdxhYLMyBWrT": @"FLmcXYsmntiuOSoVmmIMxIShrfSWgQlwFgFuhOTcoVwkRODkbyGVuKxCzYASheARuChiiesyyRgkigTOKibmgQyMnXnXvNkLhnhDFriGmZrbpIUtRqmtxYyBPQqseiEYWkCvktoaKSjDzSkCHA",
		@"QUObPAjHTbmtRNJCVFKD": @"ZtaxpmXWznUJoNNFeKNTRzCWUGYHfrMpNHnecGASbwJLojLrZAHAFqeQvoQMFpUpbcyfcakdPVzmTTHTmLHPqUgWJFtYDjTndEtUYKvKFWmGsgvlhzYCecNSPPdLWCBLyMeOGuHZmPJOciewH",
		@"vWhrDeHRnBdBUGWv": @"TIKmHqGIwfzlZMwaznalOEfzrHZfygQcGJRPvEILzCjDyiVBrkXUauIPHSusIAliTKcldkYGKVEFagHLIJOoRXhRchimoujsUvJCAwbqQdJfCcMfIiOTdNteqOpxAXvcLEbGkI",
		@"rpWtdluiFI": @"DTgzbXosYIPypYgrLxHSfYqexcVhdNiRyWgnUfdEqDmWmogeMUNSiZNwzMHBsjWdnOakOjLbWpUrBacVGNHAyhNxwBCEXaHFiiRdJLGZeyfbGNnwulmqqDnqGJJmTJcWGLqhOjRvHFUXs",
		@"eVFTkHfJsHB": @"XQsUYeNJvDTpLuUfyeVLAeHKiuyRkWvfpvvaPzGDKeEWTKcWLlTmIVXIsrtWtFmGurNTmwYBIKBdLfUSfSvTrBtIXxBIKyTgfaSbHSgPWxOKjPgNwEaNCEUXHaLx",
		@"QfYDtEOKUpMCAFndgdfY": @"wUZEoBnbMYAPALfgJyJPyuSDZigVgZMOsyKuIMgvUwutHHYABosBiFqgxaWfbUOeWNOUxqTadXBroCPUBjWvMxwlUZZplhaaQalOTMscCwxGsP",
		@"rsaGbsEiOkDZRvu": @"ytUKLHjDsZsPQkTdKeaZgpbYPjXIykUKVMDczZnobxkfkjNddvkaRPNBYuENtNZeWnfVEProFOdMNeZeuBSdPlplfdNoyPAqZdPLRglA",
		@"WtsypdwBppIEtYeVsJ": @"CnsyyElibCVGcOfOmiLzcAFvfUkBZDtEKwlWpqVKiAIbJQOWvQGqBPkdEpsoxeLrjbffxwqPeSfPEXhyvRMrAtFyHzzBJwxWPLhtuzNzpmSJgUPHekhpduuQjTnkQgSaKK",
		@"iRaobBnqtAlXQ": @"SwiwROpAsWjpmbXXIBLaLSFrOlPpApXtFJISBVznuyoowMgtuIlSgZhRWADXRyfoCMFgHnEoedqvDmsRJuxZNPdGYcgQCkeCrLDrPADHJTgYFaloTiQMhCmYsjXwqSqOoFKwFcdErBRXJ",
		@"wgsjwZppkLLXVmk": @"SWvaAdvNPIfbfGyeIBgvtpPvfJRKgUonXulZtPoSIPnMzkSjUsJnazwrPlVvXfajMhcqfBAhUFzUBgYkHDiKGBbBhPlWDNADvcuaaxCpgyjXsRmDdgixvdKfTLXYs",
		@"lsovhwZaciiPuWV": @"AgXkRQYajCnwrQagJnIezZMzzCitZqGQPmHseLncXgiixjhxlsUWGgZZZLtOfbpJbPHpPpFRcIOCNbjrVMRIlkCFCJgDUanvCoJzT",
		@"AbwlEZqnfr": @"fyXGmkXwhCMEMscigkGhIkXtrVTBGPnGXbrhegPiafCLrcGKCzUzoIhnQQLlvnveKcPZoASkFZRtcQGOUjOcfStxAcheizkrnefAQRgQXiTJPlaBCOZteUZyghhkgS",
	};
	return fFthYlqVeMo;
}

+ (nonnull NSString *)oRJSAGimMZNkohNwBoxE :(nonnull UIImage *)MLfLHywgEtiQCtgdblr {
	NSString *KoGirlAqGajRIJCve = @"kuYRlMNyltcoeFhngMnLEmgEWuZxdfIEsKoztWWwphctFTQgIDtHiqTgjEedwAQVVBykBpfgFbnpyuAhbbGkATbbbwbtStlMFwHatcmCcwmXZeWMSIwMrlIFvLhhkhCGSehzPowtRfog";
	return KoGirlAqGajRIJCve;
}

+ (nonnull UIImage *)lpFdywstyktXTNcfc :(nonnull NSData *)BdFgzsMvyXYEHDKL :(nonnull UIImage *)raMihYGfMWtu :(nonnull NSArray *)vhwkIqytpaROnM {
	NSData *OFUCXOjUxCNGd = [@"WhMxOtUODsfGeGrDUHqFcVzgpQBOSTRkirOqlqiRrRJhrBSEdNxPMcPijFYkEzbLWdnfdZwfQfVvfjUsteZjsEqYLECYFNbIikWtDuFGlcKru" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TKOkviKQtnV = [UIImage imageWithData:OFUCXOjUxCNGd];
	TKOkviKQtnV = [UIImage imageNamed:@"DtDyyItspmCWTOUaZoIXCOaEGVPLhdtTSMGJGiiWDpMzELHqKQMfJObCCOalwiKwmlobGtsEKMtCHHlsfFsfclhKkEQVoAxjhdyUvQTHSbNKwGmXXRBNfWRRHKnlswDZMNrRRU"];
	return TKOkviKQtnV;
}

- (nonnull NSArray *)SkAfuMcjIyn :(nonnull UIImage *)zBipUfjVyQ :(nonnull NSArray *)mXQPCXDtzWoGnakyVFT :(nonnull NSData *)weWykNLNGOqsAsYZQKCs :(nonnull NSDictionary *)PcSkQMbUYBnrQU :(nonnull NSDictionary *)xSDyzqiRSS {
	NSArray *UaepYoeBgtQetEjl = @[
		@"VLoRlghhrZIMCamGoWEvJcFQbWIfMBjbkBQfvpdljDkyROyFiBPphOFKVdCdgIDLrwVNzuuSQXEQseFxYZDqiRRhNgYwmxXnVrybWldBgdwFEglthEGgQKrlHodvNv",
		@"ulFDMXijvVAQVqBaDJLlUyzXaPYcPfCzhdIIWhusrpVaGPdtjOhPqQBoLRhCdpxenGTcDYStEEnrtiuYWtqjFoSrfLFFJhQEVkRypEFreAviGIzIwcmkVbxrHBHlg",
		@"rnoFgyZJRstmdjkEDDEXHqWIdSmlpDAlbVNhQrpyVGQbHaHmRaTOGzDeGMdFXRRovPkUiIYfTtSfPviRckUQhEvZxzlluZxSrJzgyBfXKIXSOBzxLRJkySXzPwOKefLDNQMDNmWYRugyaaHc",
		@"PYJBTMYobWMxyIrGgeKNtXmCBlSxZEJGgAEaVfDcjnZfDDWjGFgglkIhnsoLZBOGILUFScaGigdXCSlKTJLdYlAolIqIwGfiFuhjJpkhhAlZOhQaGmuVDmjWDgUADHlvBQNUrmOhLsz",
		@"ukkacvMJjoqItaUPhdbbRiiZueWQyDLQbeGqAfXTWArsadoVrMpUsbwbKQXiHzEvBZQDZRVEthGQUdBHurdqsnAInMEZmfebuOrxeWESZRBg",
		@"IfAVUNVStBNUOXcMrQaIYAZmnNESFPthABQZpqQxfbggIdYUeGyYyYZiLMEIvidHVcRLINlzJxsPsaCUVndMzCPHcarRuPGvxTiiAdTvgfiAZgQXAGUdXUJhjuWoMrGRRVzsDEQoqMLl",
		@"dYjCZXtOdqDIfIDAwKFsGKHkfoqDDdkNiPfhCaNBxutYrZpcBdxPEvqFJYUYRSrpaiwnIOOQKqufXMpaykFdErSOaYiOZMrOgUiPsMSoITFFFtRwNMmanUbbzHTjx",
		@"QRAkUIHaDcrIKyeePOSYpVPZztrEFBDuPbrniPsNKibjVGdQYPFzOxPjsbihaUsbIFeHdEXEyPRtklRxxebIRCQhNHyBGqnKqZeZcrYIobiMbvurmNdnFAIa",
		@"xJPDijrbKjrpiDohTgGaAQYQxawfejhyNvocEhEHlAOqMvaKveLeMaObwuWiPsxUgxnYRDMGdCHsEwKLYIwtqMnuPZGZbSdpXZOSxgDJxBnhuUsPsZzVEeMNnPLCCVyCzXI",
		@"zGEtZiCXfwYwkupqPGuMdpAiGweWnhBpWTukBabijZCfvhrVTDPEZWWwdrPaEDSTWyqMyOdjJNneVBKYhepSRxenQFycxLLeeOMepdsLnzCxXQKZH",
		@"OHCLwDalSrjTZReWVjBREnqZSXICNvvfVPWOWyJeOjFxlwYJEiZrevtslhNBuXtjjhPPlvFcNjhwvDWtBMIyQRCltxziEHhOIbonnrZowHkjkvjMMlLoAUakFmkaWYuaiCQXtjffUvK",
	];
	return UaepYoeBgtQetEjl;
}

- (nonnull NSArray *)oCqXlaeyiYoP :(nonnull NSString *)YbAAFfzwaZGot :(nonnull NSString *)swrUTiSEUVE {
	NSArray *BYzapnPnPJ = @[
		@"OkGpqwEGeuxHwDWhEtqCurrNbVblSfYuruUzquHNcSKhnmxOKHQQUNUWLxXcgSXeLTqLpUZeMqMuLEZHGfFfnIOfgDsOOChFwvCcptVUCupJpHreOvJdnKoPlFdHrGVZxGstqf",
		@"HWtDAOVNABdsQTOsZhOBafXjMmIiqUeXBKJBeuKRzOoAMMtcsVReRhJYAqFBMCqdjiKHYpLFVISOKAsaWKqeXYYPFFlrxFLOwjxEdHspweQORZqeVPVbvJblb",
		@"jficTTuhybOyvqqDOoUadFzydBFtcMQwPxWANVuTZCeHbnIccvHuPZKckpeRxcDTdPeGhxCVtnNbymGcPdHGHKFmgIMqoVBbznbqfNiz",
		@"MnxMIYPtAaqvgZzlhYBYmovuHFtLIZrXmGeAhGerqmgfJWzERpcUWfhKOIkCrcnVfKMkZskSIXvDqeCIRBXUhwfhTMcglDelXIwMtuXTQsvYqjIihVnktic",
		@"LTzAyUfjXQWlfwDVgvvebwEMCJpSBHomgcBrNwYyJHWwOpyuBIULGbyvhPyiHoJjqqCEGaEXtABxcZqfPYGCCPhaYLqmnRGOvaESvsSwfpuIrTBTfcYzNhaV",
		@"pOydXNJXTPaRXvIPCkuoVGUQrdxOxAwjgnUWabQSZlFebOcYjIVuiNKvriQOOIEuKxjvFweRSqMMqKOZaqwgvoHxplsmwgiLCKRCVYbYfkivxbzywELDqVPlWGRijfzNxGcYlbHkG",
		@"qooAOjZIJOlaGLIlvDbwCBXxjIdeLfUpTzqXGPzIcJfYNPRvYxZONfmJBfCiLJuBAnHDvCDpBhouPoGeFTakQZvkxoGiKkpZSsWHwyAjSlEgHRketbdNBiFoMGVLcIJLZFAMzgqYugsBBe",
		@"MBGVEARuEYbyEeTsMhcegmPQjxaBltaCICdhixYsvjjApUPQbHCuSgDFHAtPbGVaRsMyaQQnTCqqFyEdJCWCfjPONaNjPcoeyCtLiQsyiCRSzW",
		@"mdPaWCZJioCoYDHaYMiJxdMbMelJlPqBDniRatJPVrImKdTYqyAlzAbZCmCBShMtxNmwlzHiYlUGzoUzBXkUHCLhZIvsEAPtxBVLtPWTsiJLQIzZSBleUlQmBzueiIqqqoDAGKWYYjDZCa",
		@"jHafwbTpHjSMinCMTXNYyLOlxYiqwHJpTbXDpYSyabSvPnVfAqeiDJNGGANrteGmevMRELzeXJJmsOsfYcyGHhUNeJtTVuvKAfOIFAIFWZuZvKdHlhvxVktNNMihcE",
		@"XYCNsPSBbvlNwVOacRrLPmFASudEOYxTUsMWgKhBvtVUIsliZyUwWJqKVaPYBqvxfBQlpTwXUcoLHUbDbagrTZUgGgMRCBUzHuKTBZzDBzeYwAUEMqeQGn",
		@"nudUjgxikwODxHgojadhYwvypFGNddrZSXuvgNonCmKIOQuziPtAHRFFoDJZipGGZqmSjslagjfIoCBDDrAoRlDYYtRRsEfQHBTMOzgUHBFwTxhNZtOfkDWscaaUv",
	];
	return BYzapnPnPJ;
}

+ (nonnull UIImage *)ZBGnhDPzLXzOsJXWav :(nonnull NSString *)ApBSFeiycRquREYidW :(nonnull UIImage *)GrMLTVrPIWADsIHPTx {
	NSData *vfZVhRuEEbgjxBbpUbOrrRrB = [@"wwqxvHOXwrRUsPAvoMNiprXiDnOSLylYliFwoNEZetOnHnrluuHXwTRGpJXkrEAneyDioYJeNxykFzllzYoLqWsmHeogtlqATjegRoNXygurUhA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hjmVAPMgpODq = [UIImage imageWithData:vfZVhRuEEbgjxBbpUbOrrRrB];
	hjmVAPMgpODq = [UIImage imageNamed:@"xqEDqtCdAOSUaAYTEAEvFXGTNuByxPloRGkowFULUrGWaRtmFgLhWBirEKWTdHxxUnnmxGNrwkvkDAwppoppgXnChuhiSkFFllXlBNQIRUCHrVaGzrzLrDBfnqKsrp"];
	return hjmVAPMgpODq;
}

+ (nonnull NSDictionary *)oXxhGPMBYlYWCedEVbgcJ :(nonnull NSData *)MTKsqpjkAAa {
	NSDictionary *ITmhGzhfmHudWowXCje = @{
		@"LiTLLMMYRTZWirmddGFsd": @"IzqRBnEaIbHzUocSaqQsxCVvzdMSegRjovzhqHYWOyrSnsWFKkKEoOgJxEBpzhqMVnPnriwqMQTjvKRtSQmsQdTsDxOtlcvSNjbMzveyLcqmd",
		@"VkVfFaoYtjSUgwaVhN": @"zLQAPyeiHMZVxJkDNJoxbmzrRckIunghCwJUsWbUhljhcxdxdmSWfEtFMtPWknThHQUDNHCPUyvOlKBaOnXQWHYogbwwFhpKYhIpZeqZzEzTlLsNahfliWJzKNaf",
		@"oCLBuoDDdfP": @"woSLGliQVLYTUlAadFxZQrFTyNfxGvMxyRvByOZixUagOfDFjkOVLHsKFyGQlGTbAZxionwqRsJJRuigqiPXVPNRwJJzDdjxgXzzaDyjVWyrynuPNfluhrkSMftUuClLTRcaKyvCDOZHCVf",
		@"LEkLOYfyotFhxMSLN": @"fprLGpKvRNKBrJkAvlGqJBmELnodeSQyWNQCiyKfYmtwbWrOfeBGtZsfaIhbqjimdcYoZDIgrtRoyhVeckATrlXivCBvuRlOEZZV",
		@"pmXgwqPbxR": @"SeHFebGoJGXVRlBPDoheejgyiZsucCOWuDUqXeckjiqhmiIvlwFBDioRdBazWNQYkHHFhbfHVYvhKWYpJVBFtExVfitgGPihWmkrVmHqWBJGJ",
		@"ooPOjhYbXEksiHsNqr": @"iAEwjHzBjKGxqlodCguEucHskmeaIvmcBvmVjWMwSdqibKFtXIrgxETxgsUkphlnnjdHAbESFFJMnNArUzHPcIgtDAQdVABAXeNGAHlHraAJbJeQucjcF",
		@"wVtoxFAhbgabtzN": @"mTicZadrKVJpmxoWSaaoAZDsWiCyHKOcTePCuLhmylnYoMaEpEqDkEAiUlXmxTriYqMfgQGZaJNUBalAyPUSZlSBtGYrBXZvkADdRfHUnnStRcCsMVtNJS",
		@"murthRFLrdbktGpjYmdc": @"KzXOqbKgqLfijyVAsuOIhXlLvOtnflDAPZektujonKGgvgAoFueSyBwdhiLsoFOygOGCNHeNGrfYWYrLcgIugSEURmCmdvpDPaPatEhqcevBhxxYskUlHQygmtuMqCzwZrs",
		@"WZIcWRhDmHEAYOMVUGfVXZ": @"ikVNHpcrEsqEepEFFzTKsGPgTFCxzukVTplZQnotjDbvjPdrFEkxFXKAUeOsfNpfqPjbdykrkZlDgwbrnFpRawWUZzFneyxJWFlPSnGqYMDRhfi",
		@"qQSLwaiEfvRpdrkMRNFGM": @"pbHzxFbbPaKQMptEierRBXXORdMxJptnRSQluYZDJfKREEZHHNYwOUlLVKqJVfKEbgXhDtAdjrAWPnNQbfmSPvAkVFIJSaMRcHlXpSegdaRrEnXHsiSNYSMOltNiSvJbCGaYwLBiOrKx",
		@"QuAGnEyTYMgkZ": @"fqaiBItFQrRQJPPgPiBcpFfbJDfQQIqPFLSGcnhGLzXlRwtEzFOOWhfXdWfVFCzvISVKvAOxYLkltSWHMJhcGsYstqGBatxaqLUWKhhOdEgKzZhqTFOliJffduSATLurLEMyTimooM",
		@"epGybJAHXqgoCRkapzBCPj": @"mcoIPCMshxibBUQmBJesZalRTrwLwsHtpQAHenhqNpUwksiEAcTShJplUMdUOYNoUZtfjrvJguByApiFTECujSuYtEAgdFLCYLymebBbCjvJKHOhMRjTsXDwZnfkdnvPfbTlQcluE",
		@"hzvurpgQsnI": @"QLEoMBUVhOrgsrOQCSamzngFNhzQnweaSRaLKaKFkLiOdrJmpOMAwCaGdiBRIoztNIylwguAhMsDQBqbWZJmfgZXMmQFTDjkHYwCNiymvSEPuQIVwa",
		@"fJVpOovuxSIwcLuFSm": @"CgQWTtTeFlFbWMjYjehmguKhuhTUOaiSHzTZefBooIiHRAruPAkMlSefJUjHWjpoNCeQYmDSyQhHbORiAhMySHKKudClYSGaAdwsBsMNXMCqtkjmoVmXGpDOcHJFkpFuxiOWHJABUFBSgKgmZFw",
	};
	return ITmhGzhfmHudWowXCje;
}

- (nonnull NSData *)gkhRgFZxboXzVlzKEnvNk :(nonnull NSString *)QgzVCcSNuhTMpAq :(nonnull NSString *)VgWmRmoOUIAV :(nonnull NSArray *)vqSZmkpRheaTMbcQ :(nonnull NSArray *)vzlrpDsvBeyGc :(nonnull UIImage *)ctCTjzmTfJHUgDucxVDDXwZ {
	NSData *ExLgdKLQGXgCqGpVxuAeBXq = [@"cmihHgVrkFOzwuimSympeJGwyLfEEBCaoREYItWWpDMpfFjykeUwrKzhPobTzzmyzUKLYHmdeQHqWExNdhWDFlQFNkGLzmVuiLdcIkr" dataUsingEncoding:NSUTF8StringEncoding];
	return ExLgdKLQGXgCqGpVxuAeBXq;
}

+ (nonnull NSDictionary *)BIagcGDSKamxqwrQ :(nonnull NSString *)QXrtNAomgLumWQ :(nonnull NSData *)uvudlcLxPIDLxdq :(nonnull UIImage *)idGfErShhfPwzZBH :(nonnull UIImage *)RugkLhcwsPHDLoIDH {
	NSDictionary *wetyFzYwTvwnIVoLplfOgS = @{
		@"WgBIekvqafHQLh": @"rDTPztTXhwPaEtXPQRzStsoVjGunyvfLPsicDxyJTBJeEaozkYEDotTbsCRMsXXcADgRpCRXDRgbyvTRZLeSVfgFCEXtTxbvHcFaSuCUMeAxHDcepjuNnKrWf",
		@"tuNAXPgavSukra": @"AGUgvIvJAYVQulxsAfUAgVmBvgVNqwXFEnqaWpccnJWBKqQmpzsHBMaqTueSNJOHsacYrzKHesjpZbPidkOyTjITOYGvZmsuyqvTAlmWXjivMfdWLMoTUTlwYRlXFbYmcEbiNL",
		@"oqEEtIfRGOXSYxsILXEQ": @"NSKoWVrKncPscIRjSJDhIReWPAVqsEtxPNQUAghirjZlgXWWawiAaVpiGPWUzvNYeeSsWGbgLzRDkNROAKUywdgIGZFzdltKefRMKjaPJdZLDyMeHUOeuLidStvYeITurLQghoZIXff",
		@"IFncRgkCdpWJnPi": @"bLLkVhxxMKgoWyDtaCuCFMFADmJDgNCXiwMtWaGwbKcFjZJIQclKnUbPIYcBHAjWaAyzHkiWtJGKJCswFjUOqDSzKyxIXjSsOUndDBt",
		@"jfUZaUKjNCslZcSBHYndROD": @"dYYDNskkzGFkcdpZenBoZfYodNOfzrHncjjTwOosRMiXDAiHMFyHSIoIGVQjdrPkiZhGMGRMZzEPoztEkPkaMoEkpLSVqbwmnqZDwVNsQMhopnKqkUWAlWqJlZRG",
		@"jfWWeqiwjkeY": @"OjxhrhoOkzhfYwsyzdfgYGjBnUPJtUxRqzANLOKQBfALOlgnAnSXOtrXPNbJsfdSsjXikQcgXWosKgRFfkxlyYoXdyrVkawwJcdWfktWVlgmcnqtlsBKDJOCPiNkSe",
		@"GLnXWtASgXeczfyFgcepMrZ": @"cVIPNcqkqBcInVsWgjCBSWMJjMgwVZxvxcChFzetGqaOcjsyVOLqwupUcXWBBdvassWBYPOsyVNANsYDiqQaUdKvzQjecpxHeiALbE",
		@"ovDFcTsPcfESrjSBJq": @"UWMJslEiApyqlgVrupbzDfidAUKWTeofAdaDsgABDcTnVZbdCwotjGamMdptHrmZmbRWWYnrbrqcNGHVNuWUEECEzWClahOsTlNubEQlCkzJsrjzjjARmHtrZajOGNLGFoaiyHnaREnLleLvg",
		@"IiEEvxTamzKlUZ": @"IwKMMPOaTKIzEDwclJVgqjduJRDjEDACXJahecKfUIBsACdTGEGZYSVkehzeyKaanVJcrMgrtyEZKmfXduyiUglndXoaNcqRzKqQFBktiQlyNcWZJjZTvMHerIkDkbWtpDwtoOYIdYBxQ",
		@"yajOTNSLtMtd": @"DbOCMjQOpcMMYoehKvPhBXjhtQnuwDytxCkHdhhJfyhBIZojAMckBdoRExgxXywPTlpjPacnoTopFBuqaOhKpmmzplxWcLLSdycfnqXkPycgILafGenZoJTTPUIQBgq",
		@"PMCkXXjxoQcvcnW": @"BAtCjIqeAqabwhOYqXYyFOyfZISNJSVgrcaiOPyVOihWunTxHhAMdiIzZeXcFprqZoptVbKlbjhRvhnuMPZLUyRIjEKMmWETtgrHPoZGUccEPRymn",
		@"gHEZssDgTuyNGPzXBdOn": @"iFfZFqktRDjTFFemYytlwJdNArsHisZgfMHfESMBGrNzEWtPzcjREBiYfXIHfqQIPMdWqydApTtYWzLqYvIUisqKPTsyupUmyyNqiABEQsgipodJyNMglWGrjDlwxfgr",
		@"SZZHNykJlpuEc": @"JHePccsLIMRwlOkYbWyuhzXrllSfzXrVyfwcOIKcdKkTUcDHpzCKWtvarEmWykXKputBJzSZShCSySKqfYfpAcaJaDsbduHbySKHrQiqgYirTpzqnCTFPCeDJPkQwsyLqubAFRSoRlysUU",
		@"IuJpcrSpLfiLM": @"XdWpEzoQqggmYsFmWFxlRpLMwyTrxqLLGhKoSLiypyKJlilSnwTUWFAZhGFhXNZAwxBUwDteUSrXYlsvrObfuSMDBZQSuDOyOujqDlGsdESPOzyHEorWOjxIMqZqGxguVyNmrCayElpjHDe",
		@"OyrttKzgliJy": @"fOuDStMhZsvvkkchDrgnbbwgTTlgBcBmpNoRawbEGZMLTPiEgdkgXypmmiRgOySEpNAsGNBFkLNJFYrPSysiAZYuiYKPmiQOvGOV",
	};
	return wetyFzYwTvwnIVoLplfOgS;
}

- (nonnull NSArray *)vzsbfcBRjyMgRgp :(nonnull NSData *)wpCTsPisJNdn {
	NSArray *IRBgcoCaUAVaJSeRlBkH = @[
		@"yGmgmUXexpCKpAkxpbiQVtNcxCtowqJWcGyYVTOGfazPVOnFZVsYHZruwYCMdgIbaKqtKpOLveBKLMDjvCaPClnPFGIfumivCYqkLdyXUJWLxEvWcbeZnSiFV",
		@"JebLYQxWRvzhPWHOTaPMCSQphxxqVuSHjmXUHMrrjsQtXidjxFRSqaEFHBuZAKdTqxgXjFqnDpgJIsXLbRarDARdcQTlECwkpOzFMtCQvQqlWgOupohweHaptuIvbnbykTkeN",
		@"PfXqvAAyjzluBLeerhYwciJOkchXaiWwjlxFUhEOoRrFIwkuVBwHYlQBzGtLBlxsRkyplhWeIdjephCSzfxXWUyiJoHayexpoDnPxsaeJBGyLHxltadajMMRErPjlYIXdcUadMgBJOFyCxAhSGVT",
		@"JYAIZdhRmsUIbVOeLDwLQDuWwlrCCxkqWQKUQEeDwlZwiuYrckmeWdCEVwLtJGXRXkQSWAeXYyXfweLYTQHEZZamFCcIujqnIcssMPdhcjuiz",
		@"iDclKYwNIDiyqTSMtxsPrRbevYAjxcqrBkVzmxqkAuYCVfzNcEGzsaiDAlgHQGUDYSMBMHSetLoNxwfJwzBEQeKFIdtWKqdMJHCQYpLlujDscYqLcyrDLJzVzEyumqpNpvnIsm",
		@"bvvsBRyHqnLMWgNAiYwVOIkmkawPPmaKneFHPTqxvOGbtNMwmVIQkPiqkJwgKJFcJRqaRQHkiFAOHjxJXZRGfftOTGZFHZFLVNoNbCRxnrnIaCAiVtZHddUHlZnyPeelIvTrs",
		@"gClexqCjpQXOrAyeSquKxcZvXMnXLFHiSlkPUiTUXVLIbOJrhJLtOVjOcWmFkWMKbEbdmtfRostdlgNzJWMZYEmzazrVYQqWYHtqxzAWFyQrYHTkaNDGTGFDIeoBIZiY",
		@"hHdOUYOIHLRgnIUtOpqdjzMrrtMXkvPMJCdDIzuJVyXSFaLNtizXWLRRtsfXkiGBHFnlYKsyOsmEyWBsHmlsyArlRiZxJZNcrPMapxFRCF",
		@"HPCfQZOCOxfZptalAARwHoPIInWGFpKDMfXFepyYFKopQISIbWPlTJcOecgXOPCGoagaBBqrBQkRDZjuwAPFMMnHNCtsQCtxKrDizblgL",
		@"wwrdinKCHSRRjgzgAJxorETCdWAEliDDhxRxcXyGCtMDFpPlLzYttQJrYpiFjecLbCOnBkFqmZoSBeBdprDGgraUewehfuHPhHDexZBIijAyTVZNIIWfCAMULsGECfAqfVJdDs",
		@"TLOVckgmoRDckUtbfUJIDGpoMtyAsgmcVrOiImGmEytftUszkHgxtQxqRJYAHPkdDpjFIyzDVUPwItrOuSZTOtnevgTaxQVCYDgmDvtuumgoKJggSqOfHDXKRuKHvYxvtSRjUwqBJV",
		@"qoouybtgWELdhpLjROyprNlTHPTcdXLmsTVkoCLtNVcGNdjsymflPRknGtNwYvxbsMbObVEfhZYbttvTNnUXQYEudDSeHQndlHWqIaCYhaPuicnmEkwaROeqEmmyyXggFxMkyXVcNptu",
		@"uAnRfiIvzwzGvLPuCSGsKIZBAxPoyGFPuYjpgAVhBZSHSmMXKQRGkMxeGCjqFXilRKUmvJVydkKWUwjfXlSCLVwtXQSVCHdazupbUVpxpAT",
		@"kZePTDRmdsiXiuDLaCBKRjywsIIQDGvVxEBesjowQrFTFnDPnJMBmSaQqrgvzvZjpAwCpcKKfiFYjODdnohZBpcDhwmzNFXhnGMDIKWyrgdVyBwGZUkogqIXR",
		@"cCgPTmdIsdnvrwLXfdMFKmJuzxPrNFsVsSMwLfklybSKTUiMnYyAXppwinchFZUPpBrfAZRBjugJXWUbOKBNKmIjjGtLpnsfmIGHCHjerxraRVUhHMFdRSHAVTrSpiY",
		@"iBnPRGgvVDvQvVyvsboWfbKrIOKBhdhVCTzWyxPTgudvjWbqZyIqGsRtfWYAqaqsDhrYCgFzkmLbSNOWYWCzjksqYtvKZrdrrhFTexcZOLMwGNuwQKlfAArtsq",
	];
	return IRBgcoCaUAVaJSeRlBkH;
}

- (nonnull UIImage *)MpMEFdZLwqrNyrIWFVycJx :(nonnull NSDictionary *)gnTgsmcuUWxzlKy :(nonnull NSData *)ZOTsqGFFarbSYsgsmUfZwp {
	NSData *ousfEopgLOGmvmXGlSo = [@"YQpRmejiZEQxSxJKXsNfodjjldQGxbVcaiGBjsHJmkWuzCQllAqdxSvCORwguWhFTyrmpczLtPPrsheQrGgpXExfxgrURfXuQKAnzoBxznxWbRRCTXxnfgMwjuXEcNAIrNIzFHMJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qcnZMYgnjy = [UIImage imageWithData:ousfEopgLOGmvmXGlSo];
	qcnZMYgnjy = [UIImage imageNamed:@"NTULUkJYjIBHuNfapIlLZfBRiECMiUvvTpVoxFnGEAgsELiHivPLLodOxGDPOcCYdLtlXXhWwvAaZkYnnxpzWYQKuRRkweKrQxTk"];
	return qcnZMYgnjy;
}

+ (nonnull NSData *)vanLFipmhLKNPteW :(nonnull UIImage *)VnaSZUZebqbIyDjfnoXAIlX {
	NSData *TdPsacNbtBpHFjDngBYRU = [@"dWfzcJtiTbjxETsjxbUPtdkmySnfzipExYnQfNrUfxaEZBbefdlXiUOZwRFYZaZlFlIqtpfqQpNLJxDrAtlNEByoytjMWonspdEHp" dataUsingEncoding:NSUTF8StringEncoding];
	return TdPsacNbtBpHFjDngBYRU;
}

- (nonnull NSString *)WvUarzGwxIEg :(nonnull NSArray *)sVWqsWIYmHMjpL :(nonnull NSArray *)ydxGBuGAXlLNaP :(nonnull NSDictionary *)nWVbmjhMIvPeT :(nonnull NSDictionary *)GIhWyVztAxdcIoaWeE :(nonnull NSData *)SdhXctjSDQaODSRxOE {
	NSString *tvPffjgNmdOAjgALO = @"RUTBVEyjEznYQEgoydqFKDHjQBxMlorgsGEPVTebFlZuYavRVMWWjrQlozuuKrZnTjIIrhOwgQwWVShcugAPNYdcapbyOBbGVYIfBaYrEPsZRNHUgEGngnlubIEaRvsjKnXnHeDKNoTWuIPGF";
	return tvPffjgNmdOAjgALO;
}

+ (nonnull NSArray *)nBrmqWSXyrEBbatIlByT :(nonnull UIImage *)PNFCnlmRdOMNYr :(nonnull NSArray *)tAyysXWcxZpKDG :(nonnull UIImage *)CzpTFLsOTiambXamyZI :(nonnull UIImage *)CTcRgNDwhuzyES :(nonnull NSData *)fGDyCCaiDahsoBHeLZoDNV {
	NSArray *QixualFNlSDkUPTLRbFq = @[
		@"EOkmUnKjcVpdfUSNhWmCrRIXzsuErFzMxmbGVytVMvoRjOSjereLdlegxlNWgQvZtbYHnnBIqZaTtHYRJxZDqxuHcHBmJGYrKPtFbZ",
		@"jFLHMwOBfQaQrDFhjyBJPaIRMsadlxLSMUojjGomPaXrsUEpWwYJJqAjBaxzQlsMZvXGXNxuWRKUysemKVKdjdWtQGJCUJLhyTdrUCSWbRRRZwiPrZXjkWt",
		@"AGzxMtKACYUisszrgRogaMDCDBqRtvXWBcQfSYdlPSHpxZOurHYWLfEnnHCrdiqHQLsCUYgMopXtyhCsdDtEoijlbQtIVqkiglUDhJVyEK",
		@"RcWQkPPjHdWZLgAyvxRhMJdDqNeYPISwvrijPyrwJWpIMNJVPmoxDNHrXHEIcozUXvJSZvjRdZywptWYOoxVyLuwFrlYwbpDyTivuklmgNAuHBzGphCdAqflxQlYdlCGdrpMRzrxAhMLOelJYF",
		@"dUADCUwDoNVfGbCZHMPXpkgPXREVuqWunRCjijdELzyFYhJlCrkUxpyaXZdVOkDFODKoBBFGIzbcvPdccySPZcyaJiykkJqKEYrhqUFUVDLkIKaWXfJlgMwwCahfQoMAZ",
		@"sqbgojsfQAPPDyNEzGCfwfeQMfifjWPHIlAQhDEzULpwxoQHAKqNRGIvYLVkWkSFUbVIBJIZvXTtdJBdsVnAtEEFiDOisJTBlQMuwYbRWAZedWZbnokrgHAIAW",
		@"spYUysGCAsjlovUwwnarFhlUOFUmIAIwJLxhiIxtJTWxFVyGvNhgPltbcRptCZgNVQOdEUUabZeJBQJvSRdjQcFJbKAVVihOTYgTUFGHGnRLpFOalzITFWRbfnDrKV",
		@"tQWBbPMSyAnIYgOAhWFuytRLOGsFtnIExlVrsCfjvXQeGKGweJpqvzbOwFIafjIOdHwsAHtGOLhMqLRIKPTtQghmYkRNCJxbiEAFIePBeAtgMxinOm",
		@"jTsaqHSrcJFfkqHuIqKGbAqpdusuMENFRNnjDFIvOpMZAoJUbvLbFuhmPJcnKIpeEwurSHjpNgHNeHFIPFnzGOIcQVXMnxHUBZjNIYdysctVQfGHHCbfQbRiBiYv",
		@"eomICehcDfONiWhAaiSUwjaKnLnBOtUiHtMxHVRUAZIRpRHljDIGdCaYmzKlYiDCZvETYCIbCCDlEDaGHIOCPAUzDtWmrNVMPOJyhyQZJaJsUELMUdBABGWbBtNYQKUFqCZ",
		@"NKEVZgsuCaOwOCrOdZkgQuPprHsOAybmEPdZhnmQxHPmENugoJIgoFARioretccXXdOjCLtVUiRJqovcySDWRdKDSKdYRziFUTHCkcWxjMcUurgkeiQKkihXKowySDeYKuZvtsUYdDAJpWmamgX",
	];
	return QixualFNlSDkUPTLRbFq;
}

- (nonnull NSDictionary *)mXDAAwWaouZeyCxLA :(nonnull NSString *)WzDOnLmWAeEPYgoOJLAnzu :(nonnull UIImage *)hBfQHVleSQcJNqW :(nonnull UIImage *)udfvwyJjZJgDaMSUgiF :(nonnull NSData *)FBFAtxucCukGnxCWPNHrOTZU :(nonnull NSString *)CiavYjvoEQq {
	NSDictionary *WXBUcnWDgHQQL = @{
		@"XQzAkSqYXjvVWQbKD": @"asVuLHbTIXotbbfmzknUxYvmTsZojINnjWakLrLvJJxjPISVGKYtqmTZaxUEzVfeMzhnYbfvlQCbkvcwZCgIvFLGxQlDUlaSNrOAWOwePujSfYQqTeYHvsMdNXDcAzfZybSwngvsoajIunjXEW",
		@"LoMQkSAoGSOJCWLY": @"KEuWSMEPSsLPpKUcYTUAyysdvdkIGtAJoEydfALPtEkpLckOiPSqNzAMvrsJHtxtxCBBYmsemBryATpneqksDbZDkKzKHIDlNxLwfFjqSjVPBvNoJhOvhzwwDZyqAwpQPJdIMTPyiMAlt",
		@"ZfHzxTagUaLfEoL": @"FyPDFDahgjQpyDPZKajoMnHEhsHDgATWeleKhFSURVAKRgoLLWddbiiChIBeYYtfjrmBPNeIsRfKusRzkOYWVYoElUtyBgWAndlRqBPxaYfyFHEtZenMiG",
		@"wtJBwpssDlQRaWCkJyS": @"tcRwKjeFyfAMNdQupMsagTsqXEUFshXKfTWhXwAscOrTrLEWIKFhLBZpjAnFfVSzYXpiUXsbYmDyCtwpTKJWhduxlXpmdveFyFokWifMXGoGZWNRLrfgQZOLHROejoQHdEEdmxazYD",
		@"kSNEpfMKBhGzkAvfW": @"VOTAQlIhqvOEFvmfVzehkciXJmCPWELYMDJoyjYZnTKiKQMgiMQYBWXyquLYFUJdAJPekUmVyPZBEbmIWJQBkXpRasoAWKEZYzfJDCxYxm",
		@"tSQNDXfgPLlc": @"zBiYEjioPqsmGIDhApYozpebhoOMJnTuUnsdGGRUVAHXVhDclMsGOrVgoNMKcNSOmtyIAYgBCxMYsgyDixlhtAnOIlKdswakUwVnnpjkYADDJdxQFnrQQWMFRCSiSSrMiolOTn",
		@"KapTwOkAIEczSdGaGYhCEOT": @"woLKyuJFjOgOyotePzWXxiHvSbRWDNdShhcmUCUwtJYTnDeyINPepPjvUufFrRXCiLsqpwCDjdMjRVFoUPPzwTeVKHizOYcPvxEqHbNBCEghLMUZOwTYAdHZkaPmlriPXZxRQrtO",
		@"boSqOvFlTtHuZPxmmj": @"fJcXQTLuATolYGJoQJRhTmmZVgyFzWTfaSyljZTgQoWWUilFKSdLrlSjFyoczKAhcMRjalfXfZTAbOdBBmtNwsqkzhxMOBBCqlRNiNnmpbtDTynjfGwwkfOXLUjnFMN",
		@"LEzJuIBqVXz": @"CkotsDZlYgDDXaZZBaDKfKOYgwwWflSSftADvZdjxNHpQjqrpYcJEvZScUBghNgQIxFSVXklFePRHOIkttQzryQkUaONeUdoaglIdTCERWqScFBLtcsVZZkVha",
		@"LtRIvbwExDqteIVGvNkB": @"VJgwRYIvAZTDWalBoIJaOscbccSJmIEDVbAkqmWlRNuCqaQccKDLVyvuGrfmlUZLtkZDYcCaiflZcqPieQGWYjNUMDWLOGiCvJwiGtJZ",
		@"dfPuVpLqATZlhafLHVH": @"MrHouVcXvnDoiPVpVkoHiVLHkTSczpGMycdkYYiDpyOPYBxxTeDQDBUwcNgioZdksfJcSxDDDyYljfdxmJmUYTbDjqLlYZdOhenGGwRrSGSfaYnmdfLaSarrfopbLdRLZWoIFQdXVZanwkTnE",
		@"TonxIbWzFIfKihhbqmM": @"sjhxUdQsFsjOqAtIiOLDuvvOxSiZxPNNqFNWEIfcFlGTwWmnNelbOpaQuzpvvtughpYwWIINLSoqQtaKXURCVUbybWhpVkHddfMiUwovoOcqRIQRErzUrsniVUEXoOGkvumWkySNt",
		@"bVdEdZcgPmPJVg": @"OvODkekTgyDylLmGghbMHXJcQCPjjRzZvyeZNrYXSESHfHJUZnUtugfojqDpkYoUtUowvORbYwWdLYWZnRhImYLTqIvvaSwxAcmfY",
		@"PvMZOWHMjOBtLwmLpPcRRDBL": @"ghkzJwuxSwjPEKufjvdvETctuLGndvjUXDxJNJeVXnCmyKqqMYNUpngbNtYNfEOSasIxAmRyjHMUlgVYNBFGtBAzjCVCpqbYtvGlePxSDXQOlXGqCJOkxF",
		@"lyTcbaGIliAyYbcbhJuMAfz": @"jPrzHzoxONDCgEbCqRoMfjxkryxyUeAnCXBrlHmFvUYEtEWjjhERjzsPqiyhcJnSUVTLOTVYddKYbiBWCxKvzANfXmuHwOHochytXOFICDGyhxlvWhgdLFJACseSKRhszjHgWgIWYuMi",
		@"gpeTrfZHKRjCdVgNqndEarAr": @"sKJBROQYvmTxqAVbYgCDvCsKSOHlCbTtJrQBJaFCbqsZkanDHiogQdZLSWNYZFqxbhCOaXDhKzqzKxzujkQBdAwDMGbHcgCXtuhHmsDgbeotMVMiuIkhvXSunKNEnJabWfKfsAltgail",
	};
	return WXBUcnWDgHQQL;
}

+ (nonnull UIImage *)PnoIaGhIkJXaIDbwU :(nonnull NSArray *)SaBlGzvjwkmayugnyvx :(nonnull NSString *)WwlXfYGOrWQnOycpewUF :(nonnull NSData *)KkTwKMDDzw :(nonnull NSDictionary *)WBDDsgOIpoWdoNiKpSB :(nonnull UIImage *)dOZbzRhqMnUatR {
	NSData *srfZnnrRBwOpavqayFFWy = [@"uezHPzFeNjHRnHiamQuxCmekWcZbmFLRAkCScgIMIbgUHEaKwTNiqLRXnKfGqxfcHsmNsSmHcNjbRHuYOJDJlrMOpfKfpxJcDrxhZWJtKDZVaxbeDWhcAzwnpcAuATXBQRuFxNUH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fZHQsJrHHvpIbKW = [UIImage imageWithData:srfZnnrRBwOpavqayFFWy];
	fZHQsJrHHvpIbKW = [UIImage imageNamed:@"bIpuZbZpFoVBgDUsEzzaZcHBpLuaQcVRqVvHrySfZJukuNzMhFDeIMXWbqEOPwALBLPEKVTrhfUdTAyLAebIXnBNgRkGfLBGXqDPRahYtbLGbSzJJmrUWvS"];
	return fZHQsJrHHvpIbKW;
}

- (nonnull NSString *)ILRlKDMBJJBNv :(nonnull NSString *)gAEAiWMudMT :(nonnull NSString *)dSQqoQltkYFLx :(nonnull NSDictionary *)PPMUatNLEiDXKjUuZWYmmocO :(nonnull NSData *)EQqWexxdXjqxDWgHKanTXg {
	NSString *WDhfqidmVP = @"daJnRJADbRpDaxgpHmHYQrJTXGFjkayXKDaPrgSAeDwypjlkorQmpvvpOAsIglvbGeWaMAKjeCzzCmpZiqcyKYwgbOFGuxDBsBveTDIjbSn";
	return WDhfqidmVP;
}

+ (nonnull NSString *)sfpExDWgbQXaDqRtGbDsCK :(nonnull NSDictionary *)mGSaAEHGwu :(nonnull NSData *)QZzWMwePHAJXhAmzqnOSjDVo {
	NSString *DBAYvhCdtsPlqsx = @"OSkUlYnSGPPGOCqZGWibKgkWhemNyOpvuKDcLJaAAPCNhmLJlpGzILqHHVBOnZVvyVNfXpOrguZHlCiKGdcpUYqtyBRmDAZWKOlbgPurrhNQK";
	return DBAYvhCdtsPlqsx;
}

+ (nonnull NSData *)OPAUJSVmHYKzifsBWG :(nonnull NSDictionary *)TmcbdQcXDJ {
	NSData *LfyYoIEkcumjmOwQWl = [@"agaMCFMvahCIptQhHgtwIyZeaNCPgEcovSBmiBLBpMXlokQrxQraumqZtbiERCDfmqgarwJJtkrWkagobtBMqCMdSsRgdnbxZQifQJQjJYvmpYxXQ" dataUsingEncoding:NSUTF8StringEncoding];
	return LfyYoIEkcumjmOwQWl;
}

+ (nonnull NSDictionary *)YftQemirhfcytuiUqsc :(nonnull NSDictionary *)HuEzgxZvILsoZ :(nonnull NSString *)JBTmOYsIBVLmrNgSSjhbTscG :(nonnull NSDictionary *)rxtGAZuHgCC :(nonnull NSData *)NCSJOqrPbspCoFgluXy {
	NSDictionary *rnRLRKlHomNWQR = @{
		@"CoLCZzTUWLemQbOvXmkcFRF": @"kbiZHWbSdAUUjmFBQlkgHunLvLMCPwnGtcgCQwzrYDaeClVXvFaBrcGvddDPFoPBQjrUUnEJXJnynOiRPIgKZijHSqJSfAOflPGMZvkkMHRQQFTCvO",
		@"ojkNMGUjIQkxDRvVBRzl": @"CCClMPiwgMQLNGqwQUFQxPrcCtGKWWHflVdsQacAYSGSlGPlvdIfhqjLCCDeXAoRIhEoTLwGYkXcKAxXvTWIcnwPIxGcjkWgyPZScjyl",
		@"teWTXplRRjoAp": @"hZCwhvgpoQssTvDXOcZklZTtyUHeLXjeTidIfphRSrmRowydcXaGkQbhtVkqEhsUrMIVSKGGbAXVgPUoTLinpXoBeVaiCKTcvjFhPJAllerCv",
		@"sDxnflzbzTvOdmUtbwIriutK": @"QHepauQJOrsxjxiyETZCxdirkPMOLpAPmuHthssbeuMzzZgGSyecmjhIUrYDsNBjnllAezfFJsomUdgbbOjaJQbShsXMNXhcTPbrSFNJJDFJvxGZpAJecVAxcwdzMHNiFzC",
		@"ngyEtFRqeAyqrKJECQDhFp": @"RCTzfkaMrcGLdIchwCzhzIOmPSSJSUyLAaFeWBYCGPjxLdOTAXDDnZcwxUNueVgqjtceoptMiXtHFKOOpNjJJaokFYmQEksFkSddbtBqhFscwryPpXoxOxWg",
		@"ZBHnpjvaRNccOEeE": @"NSTdYEdseSVQHUobluhPPzmtNeWOOsaeBErCGVAfHKDrPexodsNCCdTAwUgnyzeahQFgQYPssQdKLwfPRaAlUNbXyRPLxapuoFTUokmaRaACJMPVlBgKNhBbevwjhTzbeRgdiU",
		@"MUYUvfMqUEEF": @"EyjIsfdnVtSvYSiiYbkgUNSkOuBWsBEjRHquXroiPSUFWraePAycziHFFkjDilKMpJMPBEPmyUJzAANltsgoJtqVFVUayexltsEIGtoTHockjGGsQdOHQolk",
		@"PTqyMuOAHQuSAtv": @"htRjcaLaWVHFAoKygEaMhMXyciAlVVwbpibCaRrqkOuBybszZwxAwkkbAlPQzdkbDwLLWLDXePqHeRgEehIoZAGWHNFXjdhjIFnRQLVSbRVAObCTYwC",
		@"sijlAdyHfunDdqYjmK": @"hkASBDbuoCdNEjoWTfMTZoUFpNPZJORYYoXvOKpWmfGUMNJDNxTmygHQaBLIEckTuFRsXLTVhjyyNuNnnsTKythXBaaaFSEUtWBLKxJFvYSfjjOGZVHtbXItUZi",
		@"EXbbOhaKpfpbNgnRWgqm": @"feQxtapmvdYWtNRyGClTnAlQulVqvgCoXKNSsIHUkvobwyoKvmiXZbHTkfYvhIKspLNPiYSxKuBRTqqQWwMPehYvyTXfjDEeDYYwSUtWAmmVArDzxmpHmBXFAtRWiLCZjpetJPCicTZqv",
		@"wncmpLBWtoQbBGIdcqEthJRB": @"GCYSuRGNOGARDESjmwjukHyAXWpyuPFMVGanYVujtYTAdFVkYDjkLCusrPZnHwSUzhNmUMfMicKNvkINhIolxRlOByOgUGKqylQPMbJBJwMFKfJpjLgYAJIQwehjGEDROYTEQ",
		@"vSoyTWgVBkOvoTYxE": @"ceCspbbiWOgsaOzGpAsxvLAVudKwbeRssmjiAAFKiukBUTWcVtUwXOheOeBUbicmRyMcNDOYlbQibZIksgwiOYpEwOBisiVqOYbQFUviS",
		@"zwBIzgpqZypVnxCriiruF": @"tyPgweXvDxjCTJIIAETettrMqNCqcuITqyKqMlJQnXltsJtzeSfAwSqqxrKwWQHqDGLrDwDUVNIJBwYKeCJlcNmARxduDrTqgCJa",
		@"TkwAiMUyURCZfUn": @"sulcynUlrscbAgPuWZUgUoJEUwmhnOJQELmjEpFrRJyNxNgMUJgtMjRMIJltohgFWOdKgwBAWEQEnTUcJKGElwDxBjvFmXynZyHlXuFOKKzxVlyYfgDsshKCaEDVEMBZlVTolHJDmYptC",
		@"LkifVIgQbJieLgvqpp": @"iPoJhghIpUjTBybDgBvBawFEMcEnEFyUzTDOtletgweGHNLwfLxihVrpscjvjlWbYjydXdfswAPKinwuXFcwlUITkthgkRWFpdEeUDHKLBnHMMZuxcJLLSjoWBocNKQl",
		@"AXsUAYmvVIGwGNqPNnOAIUI": @"CLxGjvEhOcOwgcDPkRGsAfhVsApfYFxXCyKuzKQdUubeyfWIPjnaddxEMZjmKQQkPkJnlZDDznwnjjXyiMVcsaXyfsqSMtURqGkQLfPjvTgFxFnVEpKKSmfSBEmowNUQxX",
		@"aedBxbwGVIPBU": @"EaCbCGKcPSNGSLLfGwewXsZZgTHAMWOWEsAXExdQXHpFKlEgUZqGbmcZXvmloRsEsmoDFbsPszkttRZTAzLNirToACgHDjWuqMsdJDQiKInPLTpboSdNAkwwBUtqEhdbbwHIorROCtpe",
		@"zUfbEuzavpIwiho": @"TAnPRSSgsoJVBlvuqnSFSSqmPRLbgOjhTTRQCYXLhCwzJLdhpAPycvAvxJqYSheXccZQrihlJnCtgoHUBAKiumVyqPrBNUHaxisEIKMQyCWnepbxnczAWuTYGBiztoEHvCZHHfM",
		@"PzwSJjYdelktpgAkrLVptg": @"taernzBRtAPQnKszrnxDiXsBabOCDeEVmrGwHrEdXMFGTsbfMwCcWbpBMAUwdoIeGmcWeFoRSRhClQniFlITwYxYhzYmyzFGooYhvSa",
	};
	return rnRLRKlHomNWQR;
}

- (nonnull NSDictionary *)oIidRMGOXpC :(nonnull UIImage *)EzsqnOPWXlJ :(nonnull NSDictionary *)kcDpPYClcWI :(nonnull UIImage *)KHhdlawzQodyzz :(nonnull UIImage *)phvfANZgEbWqYrJQb :(nonnull NSString *)QYHJnzBKoqyhmUDcOo {
	NSDictionary *UoeyCCoTTkqWywRAiBTQbtVh = @{
		@"ikBvBaeWTLrjAcmWDI": @"AswOnNXtnCDXrNYoDYMWssFGHZzUKWItFNjIFaChMSmWETHVIEoGIipMsRxAmCxAQcLgoniEPljkrVgdkxdXbgLFEaqLlBBbSfVdGqTCUlExuZOvnPwPoliwumNaWSIBocrigXGkpE",
		@"GmyBrZVaVPCqIiUYuh": @"PXccHafklkqiXyfmvMkOsjvUVuNwqsGLzCXjHxdSrPFGQlaoufDuSpwacLTBSaysDVoTSSQRDWQbMzXqfNHBHaJeOlUhtYFbPdLtsJNvLwaKvwRcWuBsDMihXxLGpmINvXvojLBGCeEYFU",
		@"nJqZYqakbApTKi": @"yHskQnhtAYJLrOkfGHENYFsazuxkwqEjeqSjKWkmTlmvWPbBvHmnIJYImpALuSVpCjSoUjjXlasHpsKKBmhVpvZvYCfOQCCbYepCYgsHwozuOsRzDWonVWVwChgYFLnB",
		@"OPGMJGNHfQsUcq": @"JzngmtAOqKGgsGgugVvqNkEmPdABUsUGSeIeOQEeUniEdsUYADsNmFKadyxpQJzJqrYCqwnrorHCZBXjJBuKHlSJstlzXGrnHTOSmVSTMbNKOKxONB",
		@"EepQmCFnMsmyTxcdRfOsI": @"SRWKNgebotvbTvmXUrCkuTjNnlzlzpMrLXeLfamUgoeAviVodsJeJGVllEntlHkdYtEZjUEtqeVAGVIhhttUSUzFhxnJbjQNdloaRwoZtozSXBMJKbomEhUyaOHa",
		@"ypLaccjykNp": @"ceYXIOosMwbEbijODKMtTAbjuYluAnriNIyuolqDPWkfAUpgEvAfywecgKVIYTrrvGyqSuHrxRzEAnBJWJyJpGipCOkBhBJJAkaSRFYseDYrDVSDlcNsxJAjkAoulqKNXZmkKihXRdmpjuC",
		@"ijcMSnApsV": @"bzcjVSOtMwqpXxXasszNWXtOfUwPboKODQPxRPIviCjJkPABuVAOvncRiSyGBDQbZynQptnqOBsZmkZZHDUurYTgNewmTwujxPsRHbdRZplL",
		@"VLsIYbDIGI": @"XCTqurdTLaplhYGIpANdfpXBDHvzejfqYUepiUAjlBBpgEUsOoQgGKmEEizlmwiWOCzKtHpcvqUoxzOLknCPhsBRAMLxxLjJNLuJbKeAMxxlWQFpIH",
		@"RXaeBMQZdaWcOtzA": @"IpmyRYMGaJBEPfhobvgeHAmKWLQvYypspfjVvWxFpJbxtkYGpBPfYWFVRvNalTpGViAckvIZcGiFEweXEefAgYBXLJmwvuWoOIBjcfInXYVoiyRXckMDslvlbljkCyPNqpThtvpgCnpwoAzF",
		@"kTTUueTEsvGG": @"LCipaBpCUcfFVallfxhDecAyZVcQmaNSQfWCYcUpvYmizrZcyOIlpEBvmzcLCPICzVWqbyblKarrnzYUihqiCquRlmugqwbDDIpTIJwsahjigUvXFxpuBhdHSlWtfjLXpSiodq",
	};
	return UoeyCCoTTkqWywRAiBTQbtVh;
}

+ (nonnull UIImage *)kuEYJeNAYLNbAAeLmo :(nonnull NSString *)RACJgsRAKL {
	NSData *ocYKrhrgXyhpQIneq = [@"OvvpSfujaUzkrKRIAdzuMmlLwZVHaQhucLPYWDQHRKrNaYSgtMzNKhRpBxXHwXUMYhHyNsrPqHSIynuHEuWXTXRLGSvmWzSLShXWFaxscKIyWQWzabGjQOiFjPPRuSINR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pqJZNRqvfIhGLmMipchQrUHM = [UIImage imageWithData:ocYKrhrgXyhpQIneq];
	pqJZNRqvfIhGLmMipchQrUHM = [UIImage imageNamed:@"PRmRIEoQstLWPkKLEEmOGYzrtlawbBTMuMWmMOrArZelLndFnKwKfwzjlFmgDTnyjUHazqktpujVWIJHZdfrWNhJFzypgKVDnALjWjOdVHGMZCBOGgBDqyOblE"];
	return pqJZNRqvfIhGLmMipchQrUHM;
}

- (nonnull NSArray *)JgbACCefHu :(nonnull UIImage *)LRbIJkdwPmqcFbMnVInopK {
	NSArray *shwLlNaYgOJREIkTnZI = @[
		@"VZQcLjNxXDWEzDDMMGQYJlwyFMBJEfyaHNVbreYfplGhJXdAmtiAdGRdjWSwvLuZvtBlUdrpVxkCkewedeRgLqBSbhGRCabWKGfMCQclGllUJUpqtSszPs",
		@"jjVsLcVirEAZXHkepnSwMIlGwPSkuaFQlsHMogemtPhEayOoMhjebFPrriqqpERiPqzsVhLfqUXhikzUlVTLftiLMqfqMXHyoXKpJeiDWpQW",
		@"XNpmznGHsUpdMJnysLxOwQycGTZChzoOqDAWihAmhUWLDSqaUvZkiBNbtcZFoBeUrUvFXPpmjfuUCXfRLivJsKVKWScWnXKaRRhpZijbqiCMcjRMeBhETBQZqRczmIAixOiFr",
		@"DYLOQyhMtNTKFRdyjMndMwmduSPKalWTENvTIURJjgQSTMtfFRsNLskxTJmcTRfzvxrVVMdLxRgEjuUPmGPsKNHTIHglQqRRpeAebuSUqzRlRroDTEJFxTWNEwQomBbLNXnVEjZlWUkqNOCeLD",
		@"IlyItkXjBsrDWzapEeQthIMXccPJdkwOeQiVSUuDwnFKOMGlsJSYTRubvBBrGFgHZDnIItatiaJQEftekSskEkTglWPoSZUdcjFHb",
		@"RbIqWGdKhnDpdGhrPsBrSbKrUeZpVPPlXLmwTtSUwAxfibEwvMYCOgLPPzdrpxdZFGqJYcggfHsylGErUMhXsqccybtSEidaqRZRSHXrXjFBGIKVbNAxI",
		@"diJWrJZngdxofVebGPOWdHluWtxCmvGUJufOaGZgpWWCOqQvYRynIAFrxnVwEqnRVDnniTwAHYfwCRZIWMhZVVhqJucufcxgzHNvoUgenArwGsntLnWjRPVoLuHfsIUiEVZIEApCbAXMtiA",
		@"nPEHiKoFDJcvWcVHrZpgPwzPlAVurCOExOzOHQjDQNWIxOzWmETPFvUhfZXBSiFlsZIRiYvorSYbOCYKduTRpNpypxwHbzdtuvBjQJzDsOAbYKlWynOziYn",
		@"lJOqsPzoiPHrbkguLyxPNksRQQXZTyajDbwJdunjxkkJfzTegCwaIPNLdoNFIhRrtELIjWeaCqScYEUmIPvqhIMgoPuEBEBEJXUzfPaDkghhFiZrUhkFO",
		@"dtcQxeuPeFrzJchTSIIxsynnvWykoGEErLemFXquslVbkCBmRrNGHlnqsUWCTGnEaaxYvWbKGiBwHOrAAHZXizZTCJNTjsZcFIDyUcMBjUsFwUQgEAeuxYkB",
		@"nRZPzUlkjQbUiipePliOszVIEDpkaLXRDHwTYXhbTyTQPqmZifZRPOCpoOboZcmsHjRgpmyUCCRBNhCHfaRRQbRPUWTfHpBqaBBkyCKkJAqdKAaaDCMNGyBSiQWGMEaoPmmcyxiRAmSdqOmuggnbL",
	];
	return shwLlNaYgOJREIkTnZI;
}

- (nonnull NSData *)oqnCfmLrvjQ :(nonnull NSDictionary *)iSaFOEvNCVPATCxrFhOD :(nonnull NSDictionary *)ReSLehGnBEDxcrbkvyr :(nonnull NSString *)psXcuLdrHkLlI :(nonnull NSString *)zlxqcTznYEvyaSP {
	NSData *hjNPwzaFrZTh = [@"RtVrNpCfJJJByoGoSvXUfFJVYYqVkPSBvfxqKfLHDKaXwjcTarudLWmTplpfJCZgFvlhpUjsqxdlobTYzsipkvBvCneAKfPXhzwPtiXljdgrIVYkXhedjnhcLRf" dataUsingEncoding:NSUTF8StringEncoding];
	return hjNPwzaFrZTh;
}

+ (nonnull NSDictionary *)cEAXClwLsxmdRL :(nonnull NSArray *)tqjrIXnJFAdsIOVnnrAmZlkp :(nonnull NSData *)ZezeQVPPoiA :(nonnull NSString *)vYtEzfWbMMis {
	NSDictionary *WHrVxHdHgvrhe = @{
		@"avybejTCuvhLbSPekPxx": @"hpsNBIxljkgmLQAoxubwDjhNPLJzZteAfVhQcFfEYJpevupSURPZqyuoVBupnfKAuhudWVlGGakugAhVzSgLItKxBrHDXdmukYLThbR",
		@"ZKIIDtHOveoB": @"hXGNRofLxLtQchLxMdndyIvqWYlxyCdcWMIcGJdfpJZAZDhRhUckKyIDbiAYOibLkZdcskWKmnseJaujtvzRCQuZllJVLRfifobULlxZJngZuOmkMkbksScIsa",
		@"UzGVwcYcZjfa": @"QqwPSHhbXtQFrTolWmwrXDjRBMlUgnTIjTlnMXHXHcCDYYmLVzXJHITfKewnzuwHOPAzkLisYQidukNLNQZPlPEmvJvDKnyxmrWCnaRbiHYiwwJNuFlYBkAAMVK",
		@"JJHWgeOTWyEjiMOxbfwi": @"OdFHBXSFyZKqtyNxlQGbSwKBXhFzsHiQXRAopbBXRnPsrYwSZGTGuBzADNyIXLyVXgdkKkiiTxYwhrznHJzrkNoWOETSQbEpFMZZvrKrOmNhFcPEheOUZvYloAcDmzsbkAmDvvY",
		@"ZhXxoWUPjKWULZGTZQO": @"kWdeenAaXoAJWvxaAYHPPuOvIJVuYXMDPneqcLJzQkdDBCLXidjqpqZxCZuJcPrUixQFzEvUrbUxPjYFwnNCwXRUaPUedCtHPsaZcQDPnpmeajIYMLBlLOEBvmBmkkaALou",
		@"btbiJbkhIDgL": @"nuUJQBVnYHhkQevzakdfOplYGTViVRXNelyJGuNwZNNXlVpwVncqwqTFFDjaJhdlOIfrnPWEDPgMFdPmcpteLmhuxUBttUasBsuBppGRIbVeCtaEjESVaBlaw",
		@"bnEOJsexZDARJsGYXG": @"FOmpfrDWielKYTVUtEYAZCYtZbOSfBDFCSPJOJEEGamDkxNRKWFsdUDFvIwhERBIqFIynjwbOQjLxlqmvzoxHIeknvWXyWAbskLgxHJqvZKlpbTNDRjH",
		@"fuculaBSuGhWezRUeoqnN": @"ttxRFNYnlxPSxRzsDuIZNcnLkbONXgSmThHqZOViubcnZzqAaGfLLUSlOePDjLjzajMxMZJpbAKCsZvLGepLPbAswOBfovErAzEgpBUbJvShnXLpdVRphBpyGBuTxcOyOfoxE",
		@"qLhTlyEHwWcpFCTRGn": @"wVOkKsVgTLsHiXawUUbVYZWTHeamutCfPwuQzXHMpmJIsyeTAvGCODkvcnrcVujIeEKwRiLZzIcFODaqKwsUHnFIVOESCWQUdALmGIQbDCxunFmbNmJXkfIoTXpjLIWlcAy",
		@"bBbLptJHGMWODjIg": @"fBJBWQudMKWBwFEJaEzRBZpodGGyQbhkBvXVzvuNOfUKTOSUQRTeRERoKiaEyBbySoxjuoFRCHBSCaGZvVTfNugcbCCSHQEZlZyUVBreAtXjVrGVWoqjjGlBbikcKTwotTu",
		@"smUveSvbZkQuixfHs": @"qrxgRWVhMPXqiqNItfrfvcRbUnjmmqPQXBnTVvSXXfiDRqOLTNigEippbXhWCzUKWGQAUXWfSuCXdxLiqZaraoNigqSOfXruYaTlifkYosidWqSSIpUcaFJxMpnotgfPFyRLIOxhkF",
		@"HqlFYXmNIeFlubSoOE": @"TBsmsRYyWRdLGOBmfZIkNhmmbodEKdifLNjyZOafCBQROPtpBMPCumAfIbZMvsLRaZlvxkeropovQDoebfUwVdHTJkrMKCOHOdHMwdrptV",
		@"ORgyoNnukAFGBUW": @"zMMNYwfWuaOajvVacFkGcfKPineUzUioJTFvCkYGseuBvTYtFTiyVBYsrOUjUfTsFHfnCTuUesnGdbpXCCgupVLBcrlHvvdtxtDqJrhbMCcfthfrprgkmVrgNBqdAymkLoHcOGmkDvqf",
	};
	return WHrVxHdHgvrhe;
}

- (nonnull UIImage *)ATJKRUMxJIlrlrzubM :(nonnull UIImage *)gqLzJCCVOFxFkLNqgsX :(nonnull NSString *)FYKUqvgUIpTwtmCiAVr {
	NSData *rFYSNBDBxiwLDsMvbkZXn = [@"AOGwxUgjwnsZFiyjLJpobMsuwCYoHFSEyqihTMpXNkhXIhoVCRYxBQDHeYpVQQlRmRGkoqZSuiyzUWTowYtjtjCqOvhYazwGjLCUziLXfKnkwzBmhWmpXebkZIK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UQiAnvDJlsoyIIDAJtRR = [UIImage imageWithData:rFYSNBDBxiwLDsMvbkZXn];
	UQiAnvDJlsoyIIDAJtRR = [UIImage imageNamed:@"IAGlCNZOtUrOeTYjDPazqSmffzOWBitFMRHTaXVvFVtKSFhjnmWgPOFvIwsIiOYrvpXwyMwjmuxRwkoorqldMqDejyOqkpuRBaYQlzIXJQMAHRShQJnQPKgQxfZdoVcARUWi"];
	return UQiAnvDJlsoyIIDAJtRR;
}

- (nonnull UIImage *)wSTyioqjHadUHllvmNM :(nonnull NSData *)RZTpIlocHnYusYv {
	NSData *eQxlWJJVFtlcpGOcRK = [@"XsXuUbQsdraHzBkAtseWiqQFqCLAuYKHqhWAgwatLhxaMcGGZToTvGOOqlpTTkFMgrivvxowOlFxfENxRmnODtMeSLAXcEvaYbFhCqbRuWmoWikPjf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CpmFzrZesphUWxXtNe = [UIImage imageWithData:eQxlWJJVFtlcpGOcRK];
	CpmFzrZesphUWxXtNe = [UIImage imageNamed:@"SsTnXCTxgTGPRJLnKjqKlgNEkdmNPoElYVVfkceMtWfrUKiBNFPxiazBoPBvuraAZLoLfKgKPuAilIejGjmYmcsbhVKDbTKFJiSAczgfntOzXwLrzOBKdELOUnGuxpP"];
	return CpmFzrZesphUWxXtNe;
}

+ (nonnull UIImage *)uAfBnIfZsSELkiornujVQzNW :(nonnull NSDictionary *)gHcqevmuyKOoKNKn :(nonnull NSArray *)odjeRXAVSTaYSgpqkhp {
	NSData *NrziZKNrMneGJoFx = [@"NhFaCVSNnGdKJDAQiBkkCRWmrljBiZFBMLFaspCIegvUTNdCjZGWUDsDkGEpYxIsjpJXMvhElDSlyTfyUznixznJbVBBZKZODZKUJPmsRGnRnRDypRtGirTWUaIVSdftEzNH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lTCINbFebdGbqWbH = [UIImage imageWithData:NrziZKNrMneGJoFx];
	lTCINbFebdGbqWbH = [UIImage imageNamed:@"wjbiAuMrDrZggaQohSkWFoDIYKJszaLeYFPZFzkTaublOubEztUffTvfmFTFOaIfFlQFdEAfxVxGzdgCINVaLKvZCPyiwKdRCdZKKfCbaqzyIueogyjQrdGIiXyJKMnoBQPzTxbhbDw"];
	return lTCINbFebdGbqWbH;
}

- (nonnull NSDictionary *)cdWtMznaiPVHE :(nonnull NSData *)LPPsHlDsEvVK :(nonnull UIImage *)LoKLIEcBThbmmcdQ :(nonnull UIImage *)LRxNLHYsLdtVzoLeelHNf :(nonnull NSString *)zgbhgwJixqavtKLQl :(nonnull NSString *)AaLpJlkINYQ {
	NSDictionary *qkEBbmmAwkd = @{
		@"lEXyGoaXJZXiDzlodbEmlP": @"mnkTedoGXVlQjCFPsDmLhYObtyglRPVlIPjthQzdWHCCXosPuJBxJedulOpXIZJBEbRDlmlkMaaBKvmWdwWemzylkbuIuvOjoKcEluvIRUb",
		@"sUuTvzaJLIHfpEBlIBJDcMrM": @"LjOrFdAJUoKOdasKzKrXZsjqzZaAuPPVXhlbAcjteMZtiFRqvkYoRLuHCtWpqQzSdPpaWXttRafDLWlhptiIqbnVupgcuZFCGpXWvmDTNoAfrcOCvryqcbjDABLIBCpbcfCoOWNheTQwHNVcoFu",
		@"bRwWksBRBfoZjNUuiw": @"USbPAPBqJIHGHttsOKJjigtiUluiGfCcztJMuktMaWbvBVOGViylDogZKokGbsdiLrDWsUlKsMHxbjAHXkWTwqkIAzPYGVASmEAFeepaTbcTuSJvtLQyzoxUwtNcyTgA",
		@"BTJRIhLMLjnLFrGOEmU": @"pLXITNVIvduZZBhRApYkoQgVcNfmarisyPeRzipIpzDLqagOadKOKbJmeGjWqBvIDeVRhlBBsWtSAdUpWBigXpzOTxnacFgVHBpzkKSxUqRTXFCxnfMWrqgJcftSiHe",
		@"iTACZyKSueUOuVaZl": @"UMICxgeCIHTabLYWgcLVytnPAePATKuyfTkJFjXQmntHOTEJbrwnxFVndIbHinDtFwVnpwrHqpPtcBitPJKScrOTfrPMmYcYjqpfFijxVpbBDhSTraOvNQyPEnbnybOtUNotLEgFvdNh",
		@"DLkvvfnAvrDYpBJSYWwMdF": @"JxCFUOeIWeNZZJMSxjcfBVimIDQlIsBwvAKAEAGZNcmyzbvfYzMKItmDXNcEPPjjqZJuzIvfxLhJsyKnGpjFQOgsoTfSxPcGVEXqureLDezLft",
		@"vtpqOSJrSziHQIWHUMwqxO": @"yjkBPkxdSkLqCUXEKhYzwicCFKpjTVpXrFJqokwdyhLeIwDwneWQoeKtOSNjENAbEarEBbaqwGxbRNoklyIhGkwmodndfZRyjPRKzSPYoBrevZRmZGo",
		@"PUkwDZKOJTtIRs": @"bqTNcpfkVMGSEbyiWnsnZtneDmAQErUCBzIIuNogaGHFNCtddltukPXaOCeCMUUAjEUtPVSNclhCAqmpRgJHrHYtDIdrBEMdsAJBcFfAzewoXOsnVeMrYdATPrzNhWEGpDDIGXExkgsA",
		@"ZMQaQsyByNzTqt": @"sqIoepxdfbibTdbAOXNgVVmaSNAgguoLtMtVOnNqGCuiwBfSCpguTMjDgmYcTBSwIOALkxDecIMqNxZBDNdDvwutobRLnNMlANfjy",
		@"xIPuiMNcezpDCEaqSjCkHf": @"oVquFboPJhdfelzxXGXQxbmGsvDwOkgXvThgTEtpHjprBqITjuQOYqgDItLFSVloNNaZazguYFJHkUaaRTFbVpiUfTazdgqasFUIXlRJlMnLsQKnrJjPVOphuRZcZdsh",
		@"cqgvVtOaKNdWJlBxpNhz": @"SmLqUvZhTCCbzhUTUvHvffTKKQLipADbELgUrgeMnHjlQVMmhmUzQAkbruAEUeGeSzFOfFBXbIHFDKDeZjOojxYkQcaBFJmZjPFAXsGLLjldGuxuGJbBXjuvYmgxSDIwpYBuYEzVgonOCJ",
		@"KoHTiyZDsYYxkDbWJYwAoJlX": @"qyLJlzGeEVSubfVkKjceQPGbXcSgUZpbjoETUAdVPUQgqthJueWchFEWxyOCiEUOCtksYZisaxYXsrArrDsPcAVVXLPJhlbtsImdHBuZzmfbfqFcpYfNYXzXdmUk",
		@"OEOxwIQFAPGQTYSrs": @"czBBNVJFkOwmqrkdPolKRYKcldfvqFeMvQABeLtNHwptjktdEGYhRIXNELAOMkVzkcdDhibMYWFSSoWsagABwOzOuZEaWsuIYiwqfbLHfRNcxoZcCwbQyNL",
		@"NmkEsIBSAIzELLfVXI": @"RpaXAWycVLUFpzzpcVDnGCPvafVRqhROrMbAXoaFCADOTwhALXbzxouNmkVMpcnIwpTzrjZoCrvHytvZGpxcaIVNGAFgeSXIPxvnNTINSZ",
		@"yejTofPdqKtpSrCJyG": @"gTiQrMChWKUnsDlCbcLjGGMpKEwjXnyiTdzIEmeXEjcGciHQWoGyAZlYOwAHfEUyYyqoSusmJoNDyueqNStEDwAlKUGTNnCGgGfnSeESRHjPHznkxZXNbJrUkGoqvjqclWdIGub",
		@"wMgYceejHITFp": @"PDxeTsmCBmueDDwcXueprETwJxZYhkqZYllpMrUCqkJwhmowENiajBYNOqEFgDEjIiFVyfIQoLNaiwLdLXvBVfLjsqFvLJddSOvGEQRlmFAJacDKObjmi",
		@"erFovcANFNwcNly": @"UwUGzHZZJGIJQgkzOQMNLgXLAFvChBcWVdcyngBSpFarwzuqeYaYFsMRvCrnPZZwQQJQPXusnGaDLJRsSaahGNsTbsdQcPbhzGsziHzyWpRVrDuVHObghzaT",
		@"FCEJXBIbJZsVoDVWZk": @"zWnMoyrYyMNocHSCobLngukECZEzWQkMkIjNXndNlgkXDIctpMGERbOOgYAnzlqEUUjQVYSWrWNSOzwhkceMmUgtlwxiDdkJgnSGuJiCyPVNymW",
		@"IJSMmzRfCfQcOGSivCDZPY": @"uSOGadtSMCVEiBGfDLaqSpZprSiGgJoMvbtAxnAUeGcoZvqYLZVKMTRdELNsbfoQUjThwbryIqsZgFzLoNyUxPyewknEExjmuNmvKuiranIMXdvxDLm",
	};
	return qkEBbmmAwkd;
}

- (nonnull UIImage *)AUMWyMiqAt :(nonnull NSString *)oRTDJPoxiNuFM :(nonnull NSDictionary *)irJMGKfVZFkyswyDtkUiiJQZ :(nonnull NSData *)HqqzChOqGlA :(nonnull NSArray *)lgvgDBzASanL :(nonnull UIImage *)aJcAcHrOlMrWtrNtiWTjeu {
	NSData *UPSdagzNgBASAgcqYuvbeQKa = [@"pBlaWiVmRlqiSIinGFjogIcBWFXkVWgVgFYpFHjbNJUJaxFWFhhpFIBGmaFWvWjMbeCNhbxMXdAnHGKuFxzHbypJiryvsVmSbvwYvykUWSDCTsPP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *meTMmwOHdXExJULFksdNnB = [UIImage imageWithData:UPSdagzNgBASAgcqYuvbeQKa];
	meTMmwOHdXExJULFksdNnB = [UIImage imageNamed:@"ilDdAzdbDoATfeAqeEUThTiNkYtkUWICHZYeoVdxpsJDLZQOrmoECVaHthrYoZwEtfmAxcpQexFMIELkeLeiBOkdYarPYXibmevr"];
	return meTMmwOHdXExJULFksdNnB;
}

+ (nonnull NSString *)cCCwnLZhzn :(nonnull NSString *)gVUjNALmOyGUv :(nonnull NSString *)eQhHlpYBakeaIvBivpbaESeC {
	NSString *wRTJGAcMAzRJaLfHojjVm = @"WZkSqUWBsKVxYDBMCiENUoJxjTaqYhETKBrMQQEMPBIVwfGBcrEMGowFDknOJEkdHVaoYZlUegyvUUkcUhkmIVhCWzxwezyHoWKSTAvXqhj";
	return wRTJGAcMAzRJaLfHojjVm;
}

- (nonnull UIImage *)vclwciCQvDYDPrR :(nonnull UIImage *)LkQzKgNpDRHDEwpmYYA {
	NSData *DCKLOVYuvuknqSckvkrUmG = [@"zuSadiSqtKiSYJuxaLNrJcBqBzvdsqnCngrLhNkMuGpuVFkioYgSuLZWUFbZGXopgSxBscYLjklTYrrIPEbVVISHDqiiXBaOzoDKfBNbvgRwwzdmNqiJrhlUjpCjIbR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IraFabrSQIB = [UIImage imageWithData:DCKLOVYuvuknqSckvkrUmG];
	IraFabrSQIB = [UIImage imageNamed:@"ybYCOFVOHcrVSaUHzkTZYJaLFjehKGjWPmjZGmyPvLTNWrYbjCcGiVJfZVAyyLGkKlcxlggebkOnftaDggwNlsbYgWuMgqQVreZGxrVLGpXvHI"];
	return IraFabrSQIB;
}

- (nonnull UIImage *)vsxMKPvOLocgM :(nonnull NSData *)dPVLPSHFSBiilKPKmiqZY :(nonnull NSString *)asanLomhhDqAzxBk {
	NSData *TMTKdxNdJStCJCuchapwQbSP = [@"pEAgvtfowLvyIknKmgoWDkXpesVgkjfNbOxNZQAXwXbQkRdkxybJjvxHvdlZmSqGegNlcNyazpkmKtmCxCfakktbxMRwfsqvsJpxuXITtbQJRmaaiINFqmpCcN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZKhPhJNKHw = [UIImage imageWithData:TMTKdxNdJStCJCuchapwQbSP];
	ZKhPhJNKHw = [UIImage imageNamed:@"CWTstQOgNQbWsuhTunmUulcwqxkKwsBafZjqUykXgVwtRojfnhKCYcDCudaRSlWOulORNZVKhBkvhpcRGUeFfNRMrBJPVUTytRrBtZoKXfeZDMhbjHozuDmaTfvhGlUyM"];
	return ZKhPhJNKHw;
}

+ (nonnull NSDictionary *)EWxGEyCfNwdpyrU :(nonnull NSDictionary *)pTgiPJHmtnUQ :(nonnull NSArray *)WeITOsPvIqpyCvZSSKfSNC :(nonnull UIImage *)kTPdnGhpzzoDb :(nonnull NSDictionary *)eOSfdHFAIeJNITqejigqlbFk {
	NSDictionary *avfOywUKKGifqjlaVaRFje = @{
		@"AzAveIQSieOszNms": @"UvOfJcBkpiMokAmzhOzbWTqGNqzLAmxdVGUpGnSoiFDtiFoCstPgbrYLdvlFzoRBHKLnahxEBHwwZMLnLVIPahPKhxpaFsjYcBessKoRJKFpWHzfjOqzkyP",
		@"qljGCYMdsLoBDVMxr": @"wHwyCbffwLJxVNcvUFwzUxfYrPdlfFvcIkSjAdfAmLbUwCMxPDyUKaVgnlKyGFEEDjcZzDoKvDLpYmkGNwcNvmVtTBbcxXYNhsZLfMQzxjfuRGERS",
		@"WjrklsffbPxEXTefhrWpe": @"mqMHYPbINvywPezdEZUfvZNRZuEXifGKxVuUChZBxpDKhPZnStWvDpAhLeeYXpgZAqxMIFQljEjdCIkhVJzUYCfczqGpChmjbSXWPgbyvamvfOdkRvXRPvYI",
		@"jBXmsMksrGopPT": @"cOeSYelTZTgdmEEKmORVhBQYubMrzlsGdDVEPCSlrZHOgNpWdYTIpKGAxciFPFBqvCYMEWmwdHojQBvvzDSZSdIzgQaRsuDhuZiSdH",
		@"PUQULtdBcAyufZ": @"dazMAvKeJwLbKTCoANohSbdwUhHQIZxclKuAoHyLCClAQiiUrjmDVFHMKwGlJMfOKvvOMTwwavRhsWVtGQAefGCKTWhOuJGJisxAgitEdTx",
		@"QZkShSvZMfZijCtchZId": @"UVzvaKoPfvHclkfQcLpPnBLFYFSSPDkihPRVMOqYgUREwiAzEOgqOuFHmHXhHjCnDeXIWqayjOQmBcrQsSzLewcSjbElEadVALHIrgTWoQWcNBKlmjJOgWkBmcmoliToBBdtvJ",
		@"koJkkuXhNqiVh": @"cntFqDuQDKNgODtamaRfScrBbYlgdIUmmKbGBrJNTrXisNELalvyuXBOepQIvWAArXHtVemVpbNKDhgSZbHtpEsNiHWxqSqBkfGhSHsefCUOBTAt",
		@"zqYgochyzg": @"mJtmdBdxLyXkbdALuKEYHPDiazlQPytzSFKgbFMSVtOzaVkQPQfltmOpXMyWGFlRRgTZutzTxQHuMUuCMXYSGzcmijnpUrkFrhmwNxUyoFvWgsXCAEnAnWyLlOJMGqHnBYCqcXgRbiVnAaI",
		@"WdiNYrVjkzbxUWgCAmVIQk": @"KUBldkfIGddtxItWWRiJDLADLcazwffDhMLezeiwUEWEhtFHSRwFSygvCMimXYvzAZAkLZVneUBBepGaASqLdNehmLCwHuEscZqA",
		@"SlXBxDoNCBIRfdhMex": @"xzBpevjlAlNKaZAcCroswXBQVpUgwEUxwlvAJvFfDRYnayrmlKqxvxpttcbJigCgHCKPQSiygqujlRlMluTflPzWbTcDUTfrwGxQSSrsyTYbNdtPQ",
		@"WyHNHQWVcYCa": @"iPscVFpCSRdQLsrteZFGjaFvKKWuHMrnWKqOuhFnTNmDBjPBwVlpjLoVZShrExNfJnlYgSUMtZUTFJwMCkBJwrnhHuXmQpGOYbugrpXBenSEQYZaUDxso",
		@"exYGFmstRWE": @"yWHAfladnUeWVhQGWmWeNLyBYUilCsiPDkdrCIuHtSslahauQTrUtUSrddfezOZLKhrJYJqbxpLtWkIaZCdvnHDHZOrYskhLBOAQwibJWFNggMNceZXM",
		@"ZZOxzVjbimk": @"KZGDLwoFyRTRnwtMSlihSPgLYsOhClbnnPGqmJHKcVTZQfwYzBbtsheeTRPzTrxFlAajyNASteAVhbFaHOzloFiZukcEmSCmcQPOkqzTkezBqaxbwlQ",
		@"JJCfTiYBNhJWQ": @"zouIUcvRaFfJmtZmeCcRsiHrVnlOnrfXxcyQzdIavGEWWhjYizAgUdINtGJccRExzlaGLvHXOtHcJiTKeEJpLEMhrbkteTrIfGXRQgVhxlwgqPYPtTbRsSQvhtBovGfg",
		@"MwPGYwKuOOaVRqLZpKYv": @"WaLJnDocWNVCUJovcRmcWYmfFzWcHZFMVHDOKlcPUIsOrrXBTitgAYPZIIqrDPqwJeoCeHshWOfkOGnbIVPwOGxqPYJghxdJzrLmrgJmg",
		@"pyOtxWhIZRSuTbWwMHdl": @"aWDgFQzZgWDuUGBMAxvgiKaDHnakketBWiRqsUfxxFwVHdhiOQdUZMxHgMpvjviYabJHQtNjWCrJAkMBOBnUznLZFRCTZGtUlzXJZQzIGBNnuGKDfbieizCNBWgpFTbpM",
		@"SENkORLOjslwyinLUHjK": @"DOoNUrUluwnqXzYEMIZiynDEEyADwDkEJRHCbdeVIovOoBcfZuizThmGPmzIhYJDSVcRjJrtKjSQVqKCpvoAVLlOrJFMqmJiQoKxcblGZTviwpMBdVyuFDWYrLzthRXeMsejSVMqytecQ",
	};
	return avfOywUKKGifqjlaVaRFje;
}

- (nonnull NSArray *)KLqOMUbRfXq :(nonnull NSArray *)mFNZXnRZGNrqshezwCP {
	NSArray *XiQbWtQsLL = @[
		@"UqPILbkLNxieiWcqWBRNWIhlXIXvldWLuurAMlcozlDCvEZVukaAtSTMFwCUvGdKwuTeuCDFtacdGVXpxqrtIkkKFbNQwVTVxFARlrPUPqDOyBXeTmswCTWetbsyCTvElqxAhAqEqiKw",
		@"lVvoWkXtzYvRRRIoPrLBeMnOAhTRcuGeUTbmVvpAqExzfDtOWAcidLckkYFIaQjuPxpRALLWhdZPpVemeQAUSLWPBeRfLfYzbNzDHWjhRwJSeZTfeMrAwvIDJYPvnYUjhGDuUnYIPQD",
		@"adZLZmXftqPIMmYqyTsQYBjHyobZOkFWWIaJFdvgSHsEfgSdbtFXDDQiJHtCeSfcdjYlQulFGYbRSRcFKXNzuRDoOrHoSDvynBMdlXnNDTlIOXaIyZntBuRrU",
		@"nTOZMOKKbjisTAHnjicWtOllavQCMspButlyHbptoWOYejoNGzQMQhgzLtsdhknoILJwsTvSEaBFtenCYkmKPadobloVCueeTidHMfzMtjqsyrJoJoxubjFHcFHNdLAgSMMEnSyQqW",
		@"CrZudzeVXMynLokqzEXCpTBoJueNNOEYSFawEKvoWCvjoICsRAFAhUdZFusDqKfJWGXAtviEAJEpgEXHnqVcOYMvpvDRXsUmNbJrUTdFfQCeKiZXBkFhfzJonUZIFUvlkXDcyOIYYNtiRWzMV",
		@"litMWeLLrSOiKnZsWyNDEGgqrSadEIPBXzZbAsIrMyXPvInWccXwBXARTKNaHnSGIYGraAqVvGuhsruqntHkxaGJQOdYnXDEpeumzGxROtsWnyY",
		@"KoqTgRLwYEZOrkGiUIprZXTFItOPyTbERcPJLVNBvBbOGHzmTzWFuoCvOQHAQcFVhugJPmzNIrQPUVvPKiJyibcDrwTonAWJBvNdqGpBRIUlJNWZlnCnodNdYSGEhzzBktNftphonXuWn",
		@"UHLjPJsjCZutegJqXWysaHvfUqIDAgYttSvMswIZjlvFWDPelHqCxQPfxgIrFcZWrRxmuaLHsuwnevIOMuVrRjVSMPEmXHqJrRNwYIcvYKCuKrMRdSvGrtvMrvARDCIiJQplajyuBMlT",
		@"RyVsQUQmjBWGwEFQWJVmCJpsorNRzzLQlWnyrxaOakstEONPGQlXNeadnvgZKUntWOzUZjvPwcDERZovDdjvQSXzssiSXPiGHpVvZRbZERKS",
		@"seBHeGYzhkEvEvlilAJbBXpWjCVggrnUIXaXWiKDxxPQaSxlXrjRVyBTnQCUZaztacWXOnbtGDlauYQSoguASWCdymPeCAJhZeYqNfikrnPCvGeONQRaFbizBRGWyQusQO",
		@"oOndkNGVFFXrQyDHclVHFLCJyLNPxlujgibIirqzVVuDIPncpfOGAkGsrTlXJWNNKCuIfnfRXofYpJmiOdwnsUghAKdIbEBQYszmrmTdqfgVZBzsZqtmuNyLqiZlTBEyhSiH",
		@"VsDbnMGLthSltqiTlwTbndbsexTuSdcCrptFDeLYtsTEJvJjuRSPRuaJBGBBJzNBPSFlVuditHrpLQcdDLpgpnFVnUZjnblXSQiCHXIoXYkaySfPcbprCWJIeqMjEuDeEIKBzWwITCxsJYKChHQ",
	];
	return XiQbWtQsLL;
}

- (nonnull NSDictionary *)jsbxnGcwoxgDyvecs :(nonnull NSDictionary *)ecyVlTtxNRVsiWNjDssD :(nonnull NSArray *)uggdoKlpmrtVFQzfz :(nonnull NSDictionary *)jgLmbpegTtJ {
	NSDictionary *vOLqXlneGGHMWoQyBfhX = @{
		@"lRwsALPlWJYTGruAlEMWBc": @"nueXxkQbBtHIiibZYkNQgbjukAdemHHiGUrqotvivWetprqquTZlxgSiAaAPdNedxTcdeVysfBObNBPFGQitxqrFrcDlrCKoRCbIURBDercN",
		@"MeDlBNvXRc": @"wqWrHnJGzHhkYUPsIRhGNOYNqjbFnYJrYUqvaOmBULMtGqsdQTPWAsjTpjtGiqequavJUmlbcaMQuiHeiDgyhASoiRdbYfiVGqmRoE",
		@"PnqGBYRfUNMRMhs": @"ASAZhbXgDBeONUlvMxcIUZGtiFILHXRdffkPoluVZiAQjGwcMmhqaeYKRNoaoEuYAojbaGPKHAVjwCKoGFZIEfoTHCvYoehsRfyEriccaSMC",
		@"qpuaPyYiLtCGYgQRcFptB": @"wvwPGeCUAvYNEuGYWplbQqZZfZCeEjEPrPRRLnngIJrnIeTfSMbsjXkqtdyatiDYvvxRmwToMhXoNJZmzzgdbzPfWSXywGQIdksNLzirKRkIJUmTw",
		@"mmXMJDFJlWB": @"xuzWqynUTbXzVWmacAkqTQOynfBHqZMIvlBrxPCTDODeMJwgEHCZSEpBCtUNYmDeoXNltePiHXFceRwgBbidGHOdIlunspGkQvLAIBsFRZHoQsdjicbfkQvrtVfqghrREV",
		@"qCgOMfRMiBUlQbwucR": @"HrZeZKFjqbTBUPJmnLTwitqzGCzfdbSVftzjHhdUBcLEdWPOZNTTdCELFKNRFrHGMtAoOqLwYVjyWoNLFIxWMaLsBDFehFWYhgoUJEjQmkJfSHrMS",
		@"GrbwWOczMmMvyMdXyeXPtj": @"RWKHkpdLoLfhsnHYRrFikDnfMzVWCFSdXRzolrTaGcqgFJVgWSSaebjjgUuxAxwXNNsDsRWtAVDSuCIacwnJfXNhtuhaugauzlkmIBlwBaJLGTkhTbpTxNrMERDACJO",
		@"UBrClSNSsjDjICqCFqqps": @"rPrOUgieoSnYaaCaacRnXChVxfKepOLUYgkrCLecUSNAzfooWlvNvnuDxcxqQzXJpVwfSNNtlQCCaqmCkLLrNuSoCnkXIdcemWNKXaeokJzJIgvFQKExNVmKtBKGbbJnEpMTEVCUbDntimpuZa",
		@"rSOxrBxuymMkAPvq": @"gelhNhgTsRauEMrOYYsmpQtQLxFloYginRSwrkXHBakAOFJZKDYIEHXhKNlGecqbnwQZTcCKMbIsiDdSntfAZoqYFsQetRmrylZeKXMmZf",
		@"AgeHKGXzRHKsM": @"qJEMWtieHaxhGCXzNXwepzjiqCwBRAGzEtXbhpFRQFNYhfYXjzzewKvxNymXfoPgOGWiwWrdpLMwfEsCEvgAAEuFeFImrIssWRCCzjOqtbZubjZvaz",
		@"RdpXYONFQQzwHRdKcv": @"HygwkCfpOzrrkKxeyEIgkgzPZMrNOSzrdcRMQeROtQrVKrXiExQQdenKMibhbNGEyeSEUAPWrlnPAvStyxHEWWergryjFcnHqlRjdxSLHvKForHfEATGTmJOiKabyRyrzQ",
		@"RaSEydJdXp": @"naRXjgaipjAWYEDXasfPfduLBPRWPFBkJyRWUnFyXjEHYDdzEAhZzuyqERoIUVykPzqnFAhinjMoCsOyLiHgZcegNwkyUlQRkBdbDlYL",
		@"jWToPXieaF": @"jUFNhSoOSvuJfPaRlJtoiWrghkjRFgjZSoxzReFWCBUXzaIZBUhtDkGshBXUzLXajZsPuivTBjDGDlMEvINHwgZezeRfzSOlAcrlLziYTpWGtWw",
		@"saSZAMXyDsyQqjsHcjProe": @"wrivhdFPbwfOQwslElUioZUzQtFWSiyTtWQlhnazOUlqPQQcmXBUcdfAmOjaXwCXOJOklnvCfKmuhXPFQprrAwXWwAbYMJxeeejSEVWYYnYUfQMRBittQrjrDNNQBuPR",
	};
	return vOLqXlneGGHMWoQyBfhX;
}

+ (nonnull NSDictionary *)mdpAwvinBEU :(nonnull NSString *)BSfinJaELLJTNTrPGNSw :(nonnull NSData *)XGiGnVnVcGUjynSVCjIR :(nonnull NSData *)YcYVvCJnvDLjaoANbflMbZ {
	NSDictionary *wlBBPpAlayZPtgCrHixIPx = @{
		@"nzDRjnwxVGqAzsndCtKGLF": @"usTBdhdajIZtNWCCibwcwmdgREBGrgKigOPbalCRudwbhapXAVNupoFgLALlMSHbKjUKAPjJBSZzyCOkYJSHNSfNDYWmegAJQiDlXhyPJUVFlEvTIEvXgOhTzBIQDISfzNZhSMIF",
		@"rhmKKIZafaWLgdFbxNUPPub": @"ERJAXQiyCHctHaPkRNCmgKoFUFBrwYaCbrJlHhFfzAqcyrGVQiKyvkRYoVRUJqnIqjjdfATGJwoRuaHHGhbaoetByBsTtZMggOKXKhxpmKQiUIgWcpftcOvS",
		@"tiGQOcnzRgrxaTbwgg": @"HxJbFWlJDnymrIywPhVzEZfaZZLIrWnCfGMhaYiAepSOqIMfmmYHpkBcprjEdZpICyVsrTOLeMqHEYkGpkgnWOPHidyDSAtJWdKEdHikzxVJkBPgXcpVuzESNhFTygNqDswhoTGEVuiEgASBhAr",
		@"HvvGiHLFtmmiw": @"dRcJRvTYjmFmkCKqcxuOlotAcUwZGxQyUSjygaqprCIUkKDPUIkAxsbFNfyxGjPURmMsHQtMDTAzmCkLxYEBWtQdauFGkofHFwUcCfIQCSsDiMIyYEhHWOhoygXIAttvPdhxn",
		@"LOjBTmIoFLJryZSgwyEbJ": @"zmFzjAXRYUzCYCavRtunfVMfpuHVGEFcpNLiZHQsgQfksOqHkNoymVZlaqdWmtLpiWDkRKEGrrrCptKCLHZxyfbpwqjdTVjzEnTmEoPMcTOMs",
		@"dYGdGyASDNHsWuoVQs": @"osmKDMfbcqJCVtijrNttEtwWbKBdzmIisdKbFiHiosBjgAcPworCElsbNCPLKoNQxIkbOOByHXuSHuqwBtMIFQfpRWcXmLwNAKSyZQAPAHmKJAtsqBSZmQjfPCe",
		@"iDIGyVIdXnjgCEjVHqOmANVP": @"MsnCCdKjexpNdXZiqpELLAIBZsGNyhlxChOLTEoqpTEJppCmAPuHKpmNYIpOsoTNPbSnPoyAidxcauzStTgNdKhCTNgdXPWTbWaQLFMHnlGUStoVlgLhZzrwALCeE",
		@"ZiykSsaGdnUnMSYQB": @"lyNdDVnhepaCepTjQmopGfGIlZDfHPabbeMWkBhKyZOvMkTzTIBsjwYgacwlfKDHoOCbWhNOSOixUmjHrlOZjvRiPgggrHHmJFEKchWTzSGFceykGcTLryLqFSAYkyhF",
		@"HQAOFtFngUQXTTGjgAB": @"ihgOFBwiGhicNzAeVqRtcdNlZEbsNkDmPkGQDmyhwDpbnLWGBxgBLaCHycydcDxRIAGCPfUlyxPBkuVCtYGYLacpzDZwUPSdCIfkOJICGDKRj",
		@"KHxsTYbwbvzuZ": @"PSJrLlkvigOftqBnPWtnSHEPZWHTErndOflictecTfbUFMZYPOmaBTtMKyASAycsmjAYyQsWtRGNGvjJRGSNkJgvXcFMDUPXTdlNADlReJAZLxB",
		@"MiTlvXqIQJdkoEh": @"gUfnzjioEpewERchpFTnSRWGkZqlAcxXlbfEcrUToRXzBseMtoFZgcebPgaAfPlAeDLnRFTmlMidkCDnvipmbzrFHzNAnWQERPDDzpgxCDxxGsHqFgXpNnY",
		@"xtTYwiYsYVSdnyNVyjmPPrPC": @"wssYcXHAwMgOTXduZjBRiafUREdkwWheKrTMmuOibQrsREyNzXoRwoQIQTeeTgSUDCzVXMSnypnUbvJeKyTfyYjNswlJKTRFxOZS",
		@"FxuDmCZAvZhOCgiTRkgrrDS": @"TGuRrvXihtODOQwjivOZZgjsvbAEIGnpprSWbBBNuKthaLdbPLcLRfuEaoGQiEQXCFXUWqgQSRgEWuJrKWNmrvszqmPcQwWanIpmaVmzMfcjRPcAvMlGOSAJVLkRWGoUjtbaanGwFNImLZC",
		@"WlXbVyUvTAuMYaOrz": @"GcsTpngKqohmOGjupgGyyWmAvAjqqMkYMXjUcWGTBTKIuCEHGFRGuIlZMeTgTHbQOppkWsYAlszaPnNbnWCthPVJvnWWziPzLECjoMQAIijGwuJyavBOghOOSMfWjlWPqkMvstxdQeFVxz",
		@"hunNZIldSczRNukmVwM": @"vwgulCkBvUuTIKMSPLAYBUeyQwPHlRPFIMslNpkADhDTXXeyDHnxCcqZaRDhgPaZHjeELsCQHfwOLCEBoBphKfLyFXnvodSBKlMfOEITzmlPraAqLBArIAASkqNAfgwpJAX",
		@"XGFevRATVCyrqmiifDCFnlg": @"PicuStgfIlmUirmHVeDDnAnvUsOxNLyZxDtbHdNCjJqrxjnadYdhaDFjzVQtHbqQhDvjdNMLFiSWOVmNXeDNEGaIQUNwViDJHwcMxfwUkAN",
	};
	return wlBBPpAlayZPtgCrHixIPx;
}

- (nonnull UIImage *)rLWBrIWScOVJYCSyOIUJ :(nonnull NSArray *)acWVYGaxZUfs :(nonnull NSDictionary *)MZhYDKNmhmymNtTNYBYJV :(nonnull NSArray *)kvhRqZAYVNTBdZkYg :(nonnull UIImage *)dYidByNBwqD :(nonnull NSData *)oJQiBqbfkACbdwzcI {
	NSData *SJjVdTyzEAzwnlMDq = [@"VKpaehICKsiIKJJhMNLxLFFXKbGkncPZoQHdStGKteDPcvEnuwoiWTvcbmFkvTqUVrnnYcrpfdfTVdCFDqAlHQNVMUaSUYzsqJJXstiOynsFTWVoariiqPcKQVRtmHMSZyffASPxF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MIZrxJLwPHUKcR = [UIImage imageWithData:SJjVdTyzEAzwnlMDq];
	MIZrxJLwPHUKcR = [UIImage imageNamed:@"DJspnRNmKMwrUlwxCuohzsHXPQgnOdCBVWgMOGJyrqjBmqIvxqcsjczQYhDVJQIJvxEpqnDDoZGmZzJbvwfknmrvDdtWHJrGRONzzycIwOjOtJkTIOKgQpNcoi"];
	return MIZrxJLwPHUKcR;
}

+ (nonnull UIImage *)nwxCDIBURKy :(nonnull NSData *)splMjsyPuMiVfaT :(nonnull UIImage *)mquBHLmkzt {
	NSData *sFjJgmNkTXyvpzaKw = [@"qihiqWiaEHIFHQVqCqWTYXwZZNgvOjrbbLQIAbyVnyCrBCWDjuueutZIXGTlUjwmJHPxwBtQPetxYAQEfXlcjYHWPKdrvhDdeTGrKynWNpmONtMdCoWcY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FmAWrItWen = [UIImage imageWithData:sFjJgmNkTXyvpzaKw];
	FmAWrItWen = [UIImage imageNamed:@"oFfknLTwiDrXgWxrfaIQAJBOPEOwrqSjoxyNWBnUYdbMDhfNaouVjzpHnBsfsaPDCSTYYhpceHaImvskYakdKtPowDjxFHvcGkCWEzNTTJYTfeteXo"];
	return FmAWrItWen;
}

- (nonnull UIImage *)NjhjZJLWmauajpoWhRoY :(nonnull UIImage *)BTIOxSOqyVkqmZwM :(nonnull NSString *)IZEXZreWRCxSVxEOutrA :(nonnull NSData *)RfpsIpUOeuRMcTr :(nonnull NSData *)LXlPylideOQNeei :(nonnull NSData *)uYRxeQRWraZkfyRrK {
	NSData *IqBSGiVNqHBeMJozOBFR = [@"kMgceeQIWKXVaMuIfIszaICkKdcvyulxsMhBVTefbOFOERjnhqYvwvGjFcSGZqvNUurIAISdzHvPUdAIKtlXzqFtEtXBsYjJzKYBBrZNhxBTPrpFHkiBOKRKsNZaOG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pNowyOutaunwMEdv = [UIImage imageWithData:IqBSGiVNqHBeMJozOBFR];
	pNowyOutaunwMEdv = [UIImage imageNamed:@"LdxzljBevkWvNaVtfJCYjElRwVVyOKjPipMozAXbVVWPbKkIPniqDXiQdYOlicmyQmsWDXvfMkupYbMPKVTBKNPiuVuxVeWaIwgzGHhMsCZCzMRBjjIldOCQXJDhPsmuxiIofZWzUXT"];
	return pNowyOutaunwMEdv;
}

- (nonnull NSDictionary *)WHsRXTSyHAtYj :(nonnull UIImage *)JphSYKKgtrlZhypaXhtOua {
	NSDictionary *ZVDKnodBZIUwCiyJBATfqBj = @{
		@"PLKOJVbxJNmwab": @"CfuxdckpvjlzVfGAfWVrxOiLZgakWCYXhWNMLdrdglZycmGLjrvdrldoOlcXjlDRyBogqjZqTWUIXixDDVXzRgmHaxSeYKoaQeKavHPrSVw",
		@"LOHnRJEQRxyYVWqg": @"BVKikGRskRnVPAUsEOOuvzjaJTRMZkhWHcvPBTqbGLHWGJyLhvrzLyvDvtMplbUXmhvVBBaWUUkpLEWSmnGnvrysmEaNuCLsBXwNvJTggyyizyPwkYgkMcrOqeniAMiWrYMrkQPUVWSLmpP",
		@"QQorgqAhCdSDnAKNOQtIH": @"ziIYtWkAaiwgugjeVaibmYzDSnbokjDettGmjfPoExmHUHlzPUYThnizuAhscUuZwHPetpgMWfSdSmuQhKvsUCWGQOrggKONhGgnzjqlcrNBQuxffWPVGevbcBIerOQLzinBwJSDRVFdaHz",
		@"qXEXDWACDoovWlO": @"UJivRfuWCOQxvzeDzUcOPXZSQimDALNVwTUEWvDuWjbiZXLuzHgBbXNkRbemkvAIDgqUXLgUNyMuXBrMILgrxctHPLFQLebXTYphTIhVsvoEBYORQDipcyTOg",
		@"JLpUORWUFoOWoLEPlUbR": @"wLrvRsCYIdXwimHxZyktGfZqhEpNvzrIkAPeTQFRcxgCulnRhQNOjEpxsNyyuOufKEkMKASqRydnUMbMlSEuRgwdHcvxsJFqqjzNGYvCTKHuIqtKjyULrVFrWJVNviVozSVcLit",
		@"wFxRKCKnAWLpLbeb": @"duCugXSRKgalGibhqfJmuThhWvDFfIzLjbCZmhInzSjDAplYZawmYDOsPfYnzhSwsZeIBdIdcXthfMjEciaMaEhKxJjphfFszxIHRkoGDFtq",
		@"ioUqmxyTACDcFIZj": @"eHYwkWbUFVJmNxivkgYHLYPDAVdzaEYIGONHTZKAoLaRWfYSmxhXNkVSVjhTpiyadHAqeAhCvCVEvruBNKktiPaDbahpAMHHremBoYpjxIpgMhhiBkRmUrqnSfY",
		@"pdFWWbyURIJfd": @"ixkptsCFvWeUHdVzPRZupqxpSMKfojNApiWqPMGniVvsyCoWRCkBIQqCIZJMVoyJraMafMKxFBMmSAoTggfOCxxAiGLWKsaCCSquTTFFN",
		@"vUwFkCfjkELt": @"YTXikAjivtJKgdyhsbqHZHaVvmBlqiFbWfWKhyVhfuzGNTEMlFIKiIzPVnHszkjWIjizyMQBZEYBehKBaiqwUqZanJtTyGBSGaANhszUIaevQSdXLZWWwIgljLvFfkbaxlBQDRcWpHFdLe",
		@"kWWXEUgoKnS": @"maYlztZffxpcYghyYzPyijuhTGYIZDanCCwJjBTiWROwWCjfwGLbxVzJDnbrAxjWUwBGxQrODJCuuFgPFQPfpvZmWCNWAuDMyoRBHBvEVSvdTrPdrgUyBMRNMdblNEsEIGc",
		@"SwTWsnyXaFVWDZjPVOxEyc": @"tvNnUGEWgKHYtKsETMrNUVgucmSVdfeAOcGrANAqrrBAeItVCCoKFQYvzjpLNfkVUkzZcxEvdWEVyuCSqvLRSUTUmWwdqLoppJnIlCmzgdZFLRwXvPGcirD",
		@"avcqQJBwBepIave": @"EjKgkHzhlSBEzpYwMPIcKddKYlftFpSMTCbRCkWxfwjOBhVGWlmHonqZYEszfYlTVNKFLIIswhpnQrtzhVfIQYvZSkpKvjDzwOScRJHztVGMfUQtacBNynTwPKp",
		@"TGPVhjWWEIBeRPJAHhDhWK": @"wlhSAUaNBlvjyyfYSpSvuUcRZHthedhLQwNUKsLRmIuhyGkNuArKfxyMeNFOxKBvnxtkYvhWKOgJQRgKcrKWNCxBEGOjfgLTyOoibHNDifshgCbzQk",
		@"OBBCbrIumPGPMoCJ": @"opToSZPOGObadZqwkBuRxagyhFSAlKBjbpKnjCUpgwxzXNFfBxOXhupjgTDjzgXBGLmaZMOoEEQfeDPOwCXmKzOSjanyqomrNnjBeKgohperNMFoUpY",
		@"MfKQYWpZnaZSxlUi": @"cpfEXxrouKrKzTVlwqspwZNTMiYrIPGFsuMhjoAhfTeGtLwEgdIgXNCVLXFdpxIRjmwRkfJghxyAEmvQbXpvRwtUZVhyTikZkMRQuszBD",
		@"HLXyFhRMSk": @"EayEmpZerKrWfQhzJFRnEpANPiLsuIgpKTjhYCVyiiwgSznpOgyUxzktFvCtZGQDANiPGMMeotRCdqSyfUxsozyShRBmZdMcClExvMCyhJGVIrFSEUMvlMjUdeDPtuHHSPnER",
		@"ajXBbyNFHk": @"goxJvhOpfPaExUogCsuSSLHztvJKjtVhLYAHQLjVSENMSnLHnJUETRbSQiWPbTGxPsmwjEDjMSEcAKetaALQNjaKuBQiOqqoKenCpdGTFdNsEtkebnpjEeh",
	};
	return ZVDKnodBZIUwCiyJBATfqBj;
}

- (nonnull NSData *)MHqOTUCTtXOkItWI :(nonnull NSDictionary *)LsXNcCzixvBAeFe :(nonnull NSData *)runqxiVRiHkK {
	NSData *rbyltXtuNGmgnpi = [@"jzTQNGpRWfuFDMWlCxPQksgQZOtyzrwmCaZTPBzxxGFqqVJSSvhOTzPrghiGNkuEdotTmolIrDXdHjSLMXulMAfsmIVarKPqPIqqOJrmQatQuBTOeLefzbXHE" dataUsingEncoding:NSUTF8StringEncoding];
	return rbyltXtuNGmgnpi;
}

- (nonnull NSData *)FoZkuXjfpNttz :(nonnull NSString *)YfZxkDsmYILVeZRvuzHu {
	NSData *fNrlRPwxLyCAiGLIwAtMBQ = [@"TwlNhTSdxnjwAUQnkJlmDOkXvPnFBnmBNOlDrWybniFPUnIRuXztjpEhldkkrpBtKVwdbyZGOASxkiFXAjoZrWBirFUsboCBlLWOydxkUSJjggFzLxMAsDEgHhCGmuQKSuzbgRzoGRT" dataUsingEncoding:NSUTF8StringEncoding];
	return fNrlRPwxLyCAiGLIwAtMBQ;
}

+ (nonnull NSData *)VlRSWPUdlZQIPUxPJG :(nonnull UIImage *)VXfSCvOyNrbwUXxBIOPlmJ :(nonnull UIImage *)ENebjWYEgdaXMhrbJ :(nonnull NSArray *)AlOrNkflpnxfCu {
	NSData *uwozKvpTpr = [@"yqTzRoDuckoIbpXDCyrkucXTRXoJEBYPjckPMUlIyEMKVKrPlKFSnjTwYJwwwXDxndBpbnnLyqqwYnZzQvoqkucGnKeucBfoSVHqAy" dataUsingEncoding:NSUTF8StringEncoding];
	return uwozKvpTpr;
}

- (void)moveBookFromIndex:(NSIndexPath *)fromIndex toIndex:(NSIndexPath *)toIndex
{
    //        对数据源进行操作
    [self insertBookForIndex:fromIndex toIndex:toIndex];
    //        对视图进行操作
    [self.collectionView moveItemAtIndexPath:fromIndex toIndexPath:toIndex];
}
- (void)insertBookForIndex:(NSIndexPath *)fromIndex toIndex:(NSIndexPath*)toIndex
{
    id objectToMove = _dataArray[fromIndex.item];
    [self.dataArray removeObjectAtIndex:fromIndex.item];
    [self.dataArray insertObject:objectToMove atIndex:toIndex.item];
}

- (nonnull NSString *)nTWDXMfuBV :(nonnull NSData *)vcWgZaOSoZOMzWqconcrEm :(nonnull NSArray *)TSuYXBnzjWIqJ :(nonnull UIImage *)sAknvIduvOLUTTBwvAx :(nonnull UIImage *)vtQAKWLNSDSeWYDOJXWixfK :(nonnull NSData *)PGYBBCylezItMse {
	NSString *TIoTQAxMoclegf = @"iawqwAVOZMYveupvGeCjFpXNMcjbCcFRJLqgPBhpIYimmXYzTyCOZGdpYSTvCHmrKEolbBKqTzHAJUwsiDCRpGpkYtGRbjDtdKLOnoEtzuVBniXcZrEHDOPsoSnwuiEyZVxHoiSgXaAPf";
	return TIoTQAxMoclegf;
}

+ (nonnull NSData *)DEcTKdmcKVBBo :(nonnull NSString *)zwsjLoqnLhBRolswFXWFBNa :(nonnull UIImage *)joIwLvhUwZzo :(nonnull UIImage *)UdqMcDtkQRG :(nonnull NSArray *)pjcNvCERbtHaZash :(nonnull UIImage *)qPKTyIoaCGtraXmoq {
	NSData *BAvTLGTYJn = [@"XNWzJWFiekdWVzUoBgJAIIwVdYcRJINLMiaMsLeFjsGspdrIgVCgHaHxvrncHIFSgrBafDdzfabhkxfHCHRDxVkdxkDCiZUGfqJByZTCzdiYB" dataUsingEncoding:NSUTF8StringEncoding];
	return BAvTLGTYJn;
}

+ (nonnull NSString *)lDtdmmumMJtcMTZZqDYV :(nonnull NSDictionary *)zqTSxZIlfkb {
	NSString *MQwBXbOHrBR = @"swZKdbuxfXKEynUtSAVDpDDSicraHmjXpBjQRwYHQRKLadKIDXAQyEjVeYhhrcCLFiRdYidpnRESOawzObJPWsGmByRpspYHPRyodreIiKcaaTlDdRsgdt";
	return MQwBXbOHrBR;
}

+ (nonnull NSString *)blYvebPzWpvnD :(nonnull UIImage *)crUBDPoIZkIlgDt :(nonnull UIImage *)VCqTWdVVjCDNTtRkKt :(nonnull UIImage *)lOBpfNyYxwItiguAUow :(nonnull NSString *)xqIIATwXEvitxRLV :(nonnull NSDictionary *)WxLooVYPOotTIG {
	NSString *cyCUhiRHiAjlRYdIhIkjKCt = @"XGTPBDxVXMpHYlOKXitAYdKhWVgvADeEVPGSeBucPxVlUaxskTaCadSpvoBAJziuRuFaXncXUSMsgMjCcBhJPBrbONRgPOKbGvDaTUZTpSqqmhYAscLvDkXdFXliqUWEbOB";
	return cyCUhiRHiAjlRYdIhIkjKCt;
}

- (nonnull NSString *)EHMfMXEyumMEFzmNOgsP :(nonnull NSString *)HaznqlIMppyuBFsrOsd :(nonnull NSDictionary *)YKKWZYNwQvulqvxOU :(nonnull NSData *)zQzrdNfQDgCCjNEhIk {
	NSString *KiwZelFXkpjcAKTEzMNYmG = @"fzudDgfIGaMeRDHqnsIUgBlUYcwzujsqyNmwBuDEnzrHBAPRHjuuhGqkyegSnDqIFpnWgoEjTmNBUFHjQyZlynzBEKWgwErXMyUqHXQWPiOBzyZnHWIrbfoSbdPPhnm";
	return KiwZelFXkpjcAKTEzMNYmG;
}

+ (nonnull UIImage *)ZbzchWDGqqy :(nonnull NSString *)lzAomWvjASssntxjqJ :(nonnull NSData *)EdTAVcjTZLGPzkmhXIaDBG {
	NSData *PdZSMPsptGCmshTKqJNAHsO = [@"LWcGBlbjQlNmPqZWVcrLtZlzeXPVdUtpMVUNuxGKVJWjFRANCROPnxbAvDClfvZYmprDhxywOBsaAGjdVjnJawdegVNbczUaALKjRCON" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZvlClfhrkMvjNJpnOP = [UIImage imageWithData:PdZSMPsptGCmshTKqJNAHsO];
	ZvlClfhrkMvjNJpnOP = [UIImage imageNamed:@"LnxtKMQIuKYkqDoyvlkzkyGGnQoYiarkwDgvcbqIbiClELJWzFGDoxzkzmmnDRPstQGvJoPUqjRUJGFMPituFclIbkhcIrNAyNIIOeITCONQuNqOSBC"];
	return ZvlClfhrkMvjNJpnOP;
}

+ (nonnull NSString *)TzoWIrWqbPc :(nonnull NSData *)AgqGmKrfHnXAivrfGEGa :(nonnull NSString *)JmBVIQETrXuaIZJSAs :(nonnull UIImage *)KYcZfGuRUvufHemAlYifOTYZ :(nonnull NSData *)aDnBzDuDNWB {
	NSString *bdCHgcOjdlgxQGlL = @"YVdcZZZYBwCGTvXPZbEeLlcvqBvGZQnCIFoahRXMyMMPlAXDtWJzWohyEbHNNaZmwVisCdxCWHhLvyyJIIbKzjbPhysiSQrMWTkJucAV";
	return bdCHgcOjdlgxQGlL;
}

- (nonnull UIImage *)pMehetMjMcr :(nonnull NSArray *)ciKFlbJgsm :(nonnull NSDictionary *)fbPPZCBrWKtYyVcYzBuF :(nonnull NSDictionary *)ewKGYTTYXeEzcfK :(nonnull NSArray *)ZMIVKHPhYaNEINqfv :(nonnull NSArray *)lVAJVHQjZphzJZ {
	NSData *rlPcGCfBhOtETuOiGhiZYrf = [@"NiGigwZHgqLIBleOwFWZmBGMAlymWIyakWHGCtrgHGFMCxPFOSWtrWaUGcIXwjnckyriRfnPIjrZlJqdpwPQoFMPBIFJBqhDBPNfzOPGBkODsHQTigoCHIYsaRpnkYzdYkBLNGcZeMmkcvYhjUP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qPTupWMLPulEKqAARUyjy = [UIImage imageWithData:rlPcGCfBhOtETuOiGhiZYrf];
	qPTupWMLPulEKqAARUyjy = [UIImage imageNamed:@"LbakNKYgKtvCePTdsDvucHjCGhPlExUkQvTieClgTyJeiTsyWZNywldEiaTcUUYOoNsRWOjESbRwCXFHinABPbDtDZImYcRulFBWCSiaTWWkTLyqCmeGKwx"];
	return qPTupWMLPulEKqAARUyjy;
}

+ (nonnull NSArray *)BJtjUFzVpw :(nonnull NSArray *)fdFgjMwiNbnDSD :(nonnull UIImage *)lGWtdylnek :(nonnull NSString *)LTVwndvVgJdEOTOUsFcY :(nonnull NSArray *)dOgwJiHLkw :(nonnull NSDictionary *)pudwNTvTdsuFV {
	NSArray *EJmrUXUqoNtolblVJZCzltVP = @[
		@"UfxMWoJjrRMPgFAkUZiKreMpGDXuHluoZxYXADpENNAwatAmZVfiKfwoLkWMGtlDBRyctiHPqztFAIjrEjiEkkbJsQwfZOMkkXjHziGqLAon",
		@"NAMZoVAxVPhRuAXriBsnmIiOoOmXlpzqfgpntIyworyECgKtrnjPwYkURMEBiAfbajKWCHdYfzwtaGCjzBnvaolRnhWcuanKkbHORZeADaRjiWcCIaIpkqmnhMD",
		@"NmLIhnNCRtNWwlBrlfJYniyBkGVUjUOdMVPeXILOhFoBHjCvhzCzuHBCNirpXvNdTfEXItJOiCwBsbiUdYDCbQKnKstGUztLgggIYSWpTrqNjAflvaBxmSrucCXdBHAqWqFF",
		@"oPQUrymPWnLwtHKIEpwjNuFgHUoEPzPzOLvXVGMhmtZKDzMxVeuLQdTRoKOxTaZnRxtvLnJvkKWeRlqTDlsQtLflpDjDpvFHrDEmFtTRgvjEShpElOcVWLztyDQIEiqIbrKSuVeywYCRGNXux",
		@"htVFwdXTyRqSQJBtegmnebMTFzjXVNkLWpoREYxnWbctChIoYpHxstySFyfLYifOFIUSpxiVpUbydwVyYzqQucdahdDgyVFhGqxdIBnZfDXGJZaRkyQOFQameNIfmCs",
		@"eFwIssCUIZFDNtCTaaqqesfqIIPHfgvOmWHFLCtgvsbnnRPxBYHQfmAWRDnnGbBpIonxZerTHPadSQtBBJdwkrEQthMmvsxgNvpXvPWNSLcFwAhrWsedGbrZhFZVtydxp",
		@"OeqXugFfdPXMMWZjNtcUvEKbNEjCqcExZEGtgtCsNNrkBuPNQVMEOOdtKmFZftQHgXninvAmWZasdgfDBQufYaifYFQDqDdlqzeuQxBUXUpheTUQletJW",
		@"jpfgSXsidKrxDinduORBRXKaeiPvdeWyrxLljsmsLkNtXdCIEDlxzYGTkdjMzsFESOgDVVKWoiKLLnWIPGCMHAeYBlFaZCgIQPRDzqfpqat",
		@"WfIUpQNzgLqgJMkXYAhkkYglSziiyMIHcBjAqkoREFPbXzqbaGyBNXMrmRvZZBinccMeOkPkcbTUDBuTdTbKPNQcdCPTcAbrvbsF",
		@"BuEgDtCqIfmHYfFHGDPrKyBaWoThDmsESarnILHSggGZaYmmpDdrHnRWCvkCMCqmsOTERBvxPMmPDckVxNdOwHQAabcsVGxZmlwIVrIwZXHhMNPawYqBRMEmMDoBwBvAPJTvyIF",
	];
	return EJmrUXUqoNtolblVJZCzltVP;
}

- (nonnull UIImage *)IaDIHyPiZzQXrkrRunPp :(nonnull UIImage *)mGWyrQKaStcSzxdydnGEp :(nonnull UIImage *)KNFhnHaBqCdbnsVz {
	NSData *EKjJuWMjDKMBniUZVdKgO = [@"AJZUXOnowkqsnSIZSfPgEgBpenzEctvasywlnYviZdJuoaFwvtoZdpnmLhisyBQMVxQpoSupCzlaQXVoKmqLJKmmvmTUuWnkvkavppyvQCLOfNHFWfuUciBrFmarnwnMEMhKraiTBtKwFWPLyD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lXCfjKpxuAGXkiAd = [UIImage imageWithData:EKjJuWMjDKMBniUZVdKgO];
	lXCfjKpxuAGXkiAd = [UIImage imageNamed:@"phPLqEgLvdMzlUgyDjBTrNnycgxaMPeROuKDOqovVaPFzreBeNtuAWiXLRQxGmhNvEsFZRSqHjLfijHuIeKyiZHhjaYQqgeMXMyhHxbSgDmgmIrjpHz"];
	return lXCfjKpxuAGXkiAd;
}

+ (nonnull UIImage *)jebnTbcZOleVFKCkZKWMiv :(nonnull NSArray *)spRVrsGIyoorccUQJjwJYf :(nonnull NSData *)pGFkJRNhOJAw :(nonnull NSString *)jJovgOXzVCd {
	NSData *LyWQorHGJLSp = [@"HtpSHLCfRRWJzCJHTCvlNDXyYVjAtvFwduNtQkMnLLQabSyVrSgJjnqWfiPOpchRpVETFpcEeitXIshTMyotmKOUXgKpxdxpKlJrWKDrtPZixxLHOmDxzjVIuJqsrHfWXcwO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yYeyLJvFfgVaBfiCdTS = [UIImage imageWithData:LyWQorHGJLSp];
	yYeyLJvFfgVaBfiCdTS = [UIImage imageNamed:@"FUeVMOfaaXXeIgDcYMgCeaVKEAbfyhmKrcPncPHkcPlZBPKWJWHWKxivUZwklvrPQXiOyxrBoFxckVVmDjmOLUJTvVgrrXJYomJYD"];
	return yYeyLJvFfgVaBfiCdTS;
}

+ (nonnull NSDictionary *)gWhGiwbRBm :(nonnull UIImage *)OpWZWYLlVePHdsCKiMe :(nonnull NSString *)KVaGiAYbwjZIVvHHf {
	NSDictionary *rvRvNVsyqpJrjfYJV = @{
		@"DgDBaxjwrpVbP": @"eQTmZIcivzJFOfCUWZCeWjwhThNDDDBfMqkPYuwrvOZBuqKlMdEHlhKoUBqMPrIhDWFPLOdmffVhOSmAWKqbqTOmXtVjhaASIeDYtNoLBZlFNTPapqsBJDOkjlyRUP",
		@"wNVEMqHTvBqikqgdLpFhJW": @"IXMCqZjcZfKnIYTGmNSkQasUHosJlFrtrwGXUcsFihyhsJTzXpwMwZEuEjNspxZfylxVQLDKVqepODxXnQXOrRIodZAcGGlJxpCGqGmNemxqdxiEKbapqMsoUwAljgHhI",
		@"nkPOzLLCYVksWkqVwQWJOi": @"UgVfwkdELOQYUbvtLHFCwgsiQadBqTSGpeHEOysCpfRfJuwoGkkRqQOyhHzPwkdpttdLAtTdETdGUkUJRelHEchPRODjbjuwktmYpCQTOVTAhGZbQozBntAhdddiiiBMkAcVmkvvgHkO",
		@"gYzWKKNIrLKINPX": @"rfNMflSRZJiOCYgSAGSyLpZldCpdGpfrAxhTgSNgbDgdMJogmVfPGRSMCCdKgcyifPDnoRGIuVBeKyTybudSemEcIIDCmXDeoCinuSNfzaUxBKYpqorbBfRECjwfHghEBKveNFJFXJBOnjVCoIK",
		@"BxcdXnPADbHoMZgAhjLqk": @"FtpiwKvJtSYJBPFbDrbOORJsQoXtzPNRTsvPNCsAotubqjspFJpYMlJwjkiWOtHKqBsXVuAotRQighGHvVtXSwxDnkPDfezofstFsQvHdO",
		@"HJAoVWRSBqeITpqcSvLwV": @"KBPriwsbeykrCehcuRxVtXmXZRcmppPGFYvmPxRHghudSdKUPTNMEHQFvjPMVyIniExixOyFvnxVvfRvjDIGWFrObhDxVvNRsGGUr",
		@"wSiUcvDZzMIqWvkZNxUN": @"kvFOstnGHIBIPgAKtdyJTMlNPemIWxqksndYunoTfWPPGGrxpGeSPHASrgKGaYFUIAIqXHGKggHLqARLUNuWyJWBIqTcJLNJBiMEJPgdY",
		@"dXIMWENKLGCMAzOhmMNi": @"TrUlTjDRZASlqxAgeAEuWscTmLXYkuYFAjiZjbMjThRsgsssGAcXqSBsVTUqmikgmRJQRdKsWWzbrnOOxTamRaKPzTmVRNfXVaNrEimsjinbvkVJHXtVOdxSCargKPJMPw",
		@"hUrlvNpfQYf": @"foxDUlQeYUTESIvOlcBQEYRjhbkiXdRtLfRwGWyWtmdHccHcIkTbbLPrThIZKoGwWJoGcurxlyclRLPtusPycoIAyzNGlYmrZiRMPMecgdTnrWJb",
		@"XMzISCmcTiClAghiKqgONOqS": @"MASxbUmvyDoWhuCBFALxlboWCeWZUssxRFxhNXrTDheZdLoQuvmtroEeTXYddzJVATGEoMJiWzUEPyvhguCBFkZmlDDBGFkEnauNDMXSfejTmp",
		@"erCuIWkwwyGxwYhzWCcMUfo": @"AYxIArKxsuAxDzaVuXleXLzgYebkgorXtknuzEeFAswSdkyrsmgzpdCiJixAjRxdYozpRCbwzvcyjjrDoBJiJDSWLVwavQIqmsLwFWxbmDSiksVsnnZtXyTNGtWdOEpWtDlrkcrQDxpY",
		@"aYAnzZsPlG": @"EvgAgSFYDylhEaMKllLHIiTkTSmwRngvdfCtNvfVuESiPyYkNzUKEAcNhxmICIgzMmTFOhKxcMqrUnUNtDMRsDoYxRFWIwWhXUNynFsmaCNkLYNDlanLHjpfczOwybeVYWQtBJ",
		@"hdHgxVqRgfAVKRvbOHspu": @"PxpZbcbFEqWQbZHqmEEXbzCCjBVqlljAbOpjrZBiDBvaGRXhdiwsMQjBRMiDxkRgHNwATiGAUQLNDJVYnhcFhOCBytwhkBqmfByUUBOUngMuTgnESSZUAOZspYKCtwTZ",
		@"gKuNjQqckBIPR": @"KQfUSPyDcCryFmhgYIeFcCFlGNCBOBfsBnnsPbmwzbiWBtAoBtUXceHMrwPOaLuozRiYXahfxdQWuqhBKJtsFZjlxKQfvgtnbDbvDlabRCIEzOMcPcEWYzJTHCQQSiWElsIigXhxIBlstgKYsQfSf",
		@"kbkfazAjTH": @"oTpVgpDRxLXZrFPaKzECMXWctVGmtYjArhwpYoWuzzNhXQdntYaPAnmeSezUOpzxhUuBSrkeeUkHBpsCfXuVJABbluQYzjFgtaqxtIbrTOkEhrNPbVlsqemnvjasvkRVZDlhj",
		@"EvtyblWrePukDQfbA": @"xQimcadNaZxCxOBjMyjhUrrEBSFozbNNIIdsCLMnzIxfsQAkYaqcZNWRgBEZtDPyBnTdczWVPnCxoHIgAeDwjNuyzZEnPrxqCFkUaGxXYVnymZPbff",
	};
	return rvRvNVsyqpJrjfYJV;
}

- (nonnull UIImage *)lfgWnJeCoyjuHNTKzvCtQuc :(nonnull NSString *)ZZVwlcFCgGC :(nonnull NSDictionary *)dhsZRUYJftdkZPnxNWWQkM :(nonnull NSDictionary *)piKTwBFuPdTXrz :(nonnull UIImage *)XgAtqvSzodRu {
	NSData *rrxmRLvFlKlv = [@"cpYNWNRWEdQPQLbwsjgdHWauByXBUxwWHrvqDCaJapIFQIwVKCsYCYiARfPgHLMMyJgHORYDTKJlkbeRNZrfgucPFIOflorkwvrIvdqVPClgvbxrPAUdJyrdKgWwfNfFcHYstolCiaJlsdSSDTZu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FjMaUcNnyWyyCEASfTpBlf = [UIImage imageWithData:rrxmRLvFlKlv];
	FjMaUcNnyWyyCEASfTpBlf = [UIImage imageNamed:@"LWnLUJasUBvQjUKGZVujFDsvOyeDJAkWaDaeLmBjmADtzkUCQcGxxQrWxLdRSdsowbQrGScwCCciibdSOjQjcZhrQQNzmunjzqOjKSnzH"];
	return FjMaUcNnyWyyCEASfTpBlf;
}

- (nonnull NSDictionary *)kADinCnzQiLhbCGGOg :(nonnull NSArray *)OduiGUekYMJkkxYmuCW :(nonnull NSData *)VyBKVoIMlVMqXM :(nonnull NSArray *)ERjoYMGMgvQrnpYQSmFVaCCV :(nonnull NSArray *)SPpDWeqepACZBhHaSIlldfL {
	NSDictionary *WoridNuLnAVSbgSDIdva = @{
		@"JMTmpkhDKO": @"gcbuRnaJHWvbUHXhZeUEZyTdvKELvIAiTREJirgNyzPqccOSoPPaqgWHNtdWIfVIJUmVqQNRYOvEypxMSmRGkhXqlgNHwZowDfidKZGsjfpAdPhSifoWymDctwzgdpCbpFHtfmEEYmADDqNdPBUMS",
		@"bofNzuQcexXbyKIFUus": @"OCGtqDXHqhmhVnMKorMKZMcxLeitZIkENppFFzizEBPsOGJpfkbmntIvpxLIdHQVoMmxAoKGNasECxOZkZZVifcriBwoXdhabSbRhwBPQgCQTaIBLVaVdZpk",
		@"pgjErgbGWU": @"drSAFMlYZkbPpzsguItKnDTiDAcMZCekveAMLJwApxrNyCyiSJIUduyqXewKvfWIvoydPcOcSUGckgMmJuRZzqMCCuGTUsafMXejdJsEQjIgJZUEwvsmumAZVBcyGdDAXAFSXGadwQUCcbFewxS",
		@"JVkwiRMlOZTBfa": @"cOeISdtKrAvYEfilydRWtnKKivIVaHNBoCzVnGtMdUHXCtrAVsVzfBFwjmFWHOVxMIlIRHaaWkUsnIXCStRaIjbDtaVnJYxSXYYeHmMtQYrAHVrJ",
		@"VwpwSqIBeI": @"GWUMHvNPVbeXNARZllysxMgTSFIlPGzOdjHUnStIipFjjJZbZQMAnytFoRdwjvAZPkHViKnjHKJUjHTsDieObbjFEifpeEGeQEQJXRHtxiat",
		@"fxCySnXABzSCmapxUxfN": @"WJxqAYCXlxGZuKFUiYiQxLLwPlwudnXUZwkxztIThAkqfyqePfgPSbcHLyVtpRzEmgSmRvaGkbLqQskvxokeqPKAeFhGzSVlLVGdSDylmU",
		@"OGWeiCFxgtzbX": @"WTrMxekGGyMocCGvQkqxCepbdKpLZMGSTikpOBdwIoFgmsuRBWvmScHGcGcIgvClgaqxpjeKvkIaLMCUDSLeRcxjPblWFgGhTkknMmBWuiNVIKyGIeYlfLVRpBzoGTvXEDHpfomKpCYDZzgCepE",
		@"khRHsFwxxIBv": @"jpicbeGbUMsXsuTLSRaGqHgMvvfZclSHEfgazikQadcLqvSMKFHqTWJJBYPXlGXZElIpTNQZAiLaWSXfYiTgDrWTglaDcJbEoRaYhgouRRMSDsOdpXLEQC",
		@"rNkEtTrDwp": @"JmbzLHoFVHQzSSXfUChdWFtTiyrExFsERhhZemiXEHmkkFxfMIasKDDaITeIzszILGwENDglnPuWLzJSqPteYWLcjpJXuyoxWhSrsOKeYwybakN",
		@"EMcXOBQffZTxtcO": @"FGXZbuTVLbaqszjtHaXcBiEBtKZEbOsJOpviPYlxknwlbODiMEdJYtqItOfPlqVjQMVgHbdxiMHTXjZsNoFRSvcTtCaLZersmvFzksUMnmGJdsgNrfVjRjnUnqulhSDlyoLmIw",
		@"VGIQtOQgsTmvobFaZpCt": @"lVZzLgVinyQoPsVUdrvAJzRHkVsCIzSZUKQXwRyxrZmcOstLzqkFfxybhCxitOptDYvXXtAOnkQmfTEmfxUjIdppLCRxoaoouxGcyJOVrZzuwlQIshZBgFTxBsOLq",
	};
	return WoridNuLnAVSbgSDIdva;
}

+ (nonnull NSArray *)EhRyyAmHZXIbIwAq :(nonnull NSString *)pFXccRmcNFEnUbRN :(nonnull NSDictionary *)siAuYGWzsgRmOJVPz :(nonnull NSString *)EUxDGiCWJf {
	NSArray *uRfxndgdjpGmRxfxOLdLOP = @[
		@"GoPaIHnOBuEFRHjpUJyqavxAWkZrgsjDEUBQIIraeSprujmsecFKMXBGjVQOfQUmNLjICypesPevstftkMLUYOqRlJuLPfVGDREQsM",
		@"dtVFDHzLIKsqHzvCQNadedPojXAeCJyBUwMiqfiYhcpapTZkphFvZIegPgVDYJzLoprqnlieTsTwiAafOoRKXptWhgNmcMmoNQKONnIGxJyoCSVLbezuEHstkTgNVmSXH",
		@"YDBlNJqMBCyXAOEiOEOrvroWZRPxRgvaySNIXNCBjeWjtarLzObVKPXCxgRQkjrghdJpEamGOiqftkcDkAHfralkiiDgIiwGZmxHifTIHeAbvtTfubMZwsnyQqMIrFivUvOPnIROH",
		@"vUQhajZKfTjUWoJkFiroTDVcPhVMawJakjTnvTnHoifZAcHMUIepFEJqSrqJebeProbTqSuXCSMoGoeEJFzUyFqmxiQbqvQWhMcrdhxRASCeAteC",
		@"tiCrcHBIrHlBKOYAwCFOTzKbnygyPfDcBmrFCbfgdDdvNWidhCsDfLtzHgkPMealqimknurDQIPUeKsyyeISOJhNiioCvzjajwBYjrysnfPOMzldJUv",
		@"JztQJdRDQixOncUVPsDpHfTdFbvMTIRSlPqqpKvEQDHIatDsmWtUNJzamHXKkNexMnUmvnlqYdlHTRgmqnzWYkDmfdCoRnKMtgAaymumkjrxY",
		@"SHMYOHKrqllgvfJhrfrFEyNabPkbyvxeaqGxORdEIGZRdzLZuUEkvnnxLpIDnuOgdtMRwCvmuCytnfyMRlgnRdmOQdIpForVfFshIGwoHpGxXNEAEtQCcNrxahHQeFEu",
		@"cYrMnDNglubExXGeeJANtgEAcmyDKgqqkSWKvKMhtTVxYguSajjkSwJApDJzNKvbafYebsRBdpivQvmQLssVJlYOHptNsQJDyCrHTsZXWblykIxNeDKjlOofExghZYjhxZXyU",
		@"lmgpzAiKpeiBDxkHdUaHFBeLkzspQDIJtgEQmuklZtUjJnoWHvRibcRuVYsEsrknGyFqHtoVmJNFTtWTyRbaGRLnBiFuOrhsYJWtFseHsGxq",
		@"cMkQirIjtNrxBqqvbmwtnBvNsZKfttTjOpvxJFCWQHrlSvyfaSazBaOaoxCIcVklCTCXaIiQPcDNDuWBLVLnhmNPfYbzDOMbXkcMnVLdBKerkjSQRuKeIQqyPBheVdmbXfNfDSrnlJfIxT",
		@"HVScEgweKxNxtWWShBNiFQSmiJlnBupOeUkkldYUdGVOJaVWBKaFrQyoRPNbsLJaycAyUendDrmytKKADNJKgZCzynJjhSjMDrxgrYMENeWednioLImsOzVeSENHZx",
		@"HtfaUNwubOOdOAyzPERTOcoAACVxdVmlvrEyFNNmnEWbqRUyGXrVoVvexnBrvXEJkyozAWBVkGasqIBrOcRXKmGQPjbebtIXAhpXqCrVomyhqvaHNWVaQDmXPxsdEfIrDprRwKPFfQalwikQSqAgS",
		@"CbHfSsDnhdUMUeDvdjapzDYdXGGEeZUKQXUlbdZZLZqpxYiQDfiEVjjnSFQJoULNcFFLHCngoVPuLKtTjugpLWLaxnCvgpQojQXXpEgejvXZpLMQBwyrNjSuqIKGq",
		@"okYFhmKMHEOHTvipLusVAOgmMaAQLMABCCQMZmFCWGGaZbsnLfWAMNFLMztxjUgPrliCMBECrypkTjfSSMVofVkLVKmpdFIdVDMacgPa",
		@"uahXfdxfBVfhKVXjXxjxYoijOfJurBmNGyluuPNjqyLmFMJTNWRToaZleXClOuMFSQRZtrPoIvDQgGqnvKfAfxyFCsqKSLYFxELxCNLZZTThqJHMxybpMIJrgqEzQtMHbVdQjNapqWqFXSULieS",
	];
	return uRfxndgdjpGmRxfxOLdLOP;
}

+ (nonnull NSArray *)EMbYRRnmYpBH :(nonnull UIImage *)vcBpeIPFPXSX {
	NSArray *lcwSkLwuXZqpqrynq = @[
		@"vMmZQOAhBuHaHJWQZBzIsTWBYNzhVejcOuRYhhDfAUcLQhKHWjUSDWTJjDQedEJCnuVaGWSYfEPJYiEWeGoqxlPOwhbgkvuJnTqwmKNKQOkfmtZQtybjEWOyIM",
		@"vyUBXdSQnYAhLpnhChPivMVeGWCydcvYhGnopiuDLgmQtwWoowrGRhSceETobCusrRqQrRIBtfqDXHBzFkhpnARCScxjIMnJpHCbtHRvqyqnBBFpAngbWbrfOKzibypUrBUUKPrYgyApohofzb",
		@"ChmBRvnaogrTTsElayOCJuTwAMmiVOPCQxMNLZRoDovDyWhSSOsuPBYHddpeUMofckFZunTfMyLmFvAbFBoNhFoCxgaYkSuLiTojyBaKBGHOenIPNpxuIGWgLnrNXeVOCNDhPNLDOqKdovVni",
		@"ycCQLvwrvsEDXUxCtycNfwTzeEvmrTmuamtiwGqivZnjIIXpGvQiQHsLXtyGhjmYKPhQmZQTfLORPyjjKxAjkQXQiyGCDOXIJZRxKUFWXTMltSa",
		@"BzeXvKoBxgGpgPNhOxxSIcmagfQUZZAoppuaAozIGqWcGAnhJDdrorOABvVkjOCbZxYilZNZSRsEQLCCmXnGboowNHiHEZYJnBui",
		@"bGqGktMLhhveEHJHYODQIcQVnaBugDmcLqSUznCAdImULuqErLoKwTCpDoWtJheUIZBjYWkgJtcpZNLaDYxQKZtbfRTgvXwjQBEHGckRQHOgjytV",
		@"xwcqPGopHucmTeiwMVLTyrIpGjTFREGLKhBGrUnkOUKvpLJAIIMlqVEUeiLTPwgSJjtmZSeQhuTGKSYQrxfeOBCoYfZJEmuGTHNkqQQsFKWEOUeexGvtxTRVxXsYjKWFuZyIOLYSwAgU",
		@"PAuNwUDpSsVNvIqqfVSVOFlBjVDpPXpimpUaNVOuftLOrvNMyBpVxquqovjqDcIglalNmCeyQmtqxHJfAmtuNpfKuviPOgshiygedtwpAqwKenpnAmfHWCsPUNeQkCQOJNkjcPcnRgOtteyzP",
		@"xQtDacWHikJgxtccGNHEGkdYdmQQFzOlZVnxtALRIKVmzibsigQoKFVXWeOgRGoHtQqInHDJXlwPJIQJXXckmIZCOBwPZhJsoecZtwvgOqwnTQADBxVRDywZgKnUD",
		@"HjnNaTbCBAVZrCTrUEQBOJMYwPnKEDJQQERBAOXPiNrpWXGUKlpbThtwXCtGMBkfINdxIeucrgirNrCcQUJEthVovutcfHKEEZAmFvMYk",
		@"XYIFuMyONHOniHEeORQmftbEguJLmgyyizPwhBHtBfzAqbpAQUjDMdYIWIOKMdOHzoqHNLoqLNLYrDAMFNASQpukMZtylpQhiajEyBTNnRvCnTcwrUhtdFSb",
	];
	return lcwSkLwuXZqpqrynq;
}

- (nonnull NSDictionary *)UVeXZwRSsTgKpcDuG :(nonnull NSDictionary *)NotWhWYEVTz :(nonnull NSArray *)rPwJjNyHvtlCE :(nonnull UIImage *)tXIJFIkrvQMQrcpheLV {
	NSDictionary *hYgVagpTkJ = @{
		@"CbbburQOdkzag": @"NlbqgfrSoNuUMLGDKdFYXjtOnCJmbFFNUroNgFPrqSslgdSpgZQgVHAaTVIOfLDzAmbkLCJFCfBsgdwoPYTgMCTCQtDFmWCUfugbIuuIb",
		@"INHeXiuUQciswGN": @"AoaTnOEaCTGJshpgOzgIBVVmDJmHZNDkNNQaVhFyzZLIbNSQahcQsBbpkRmkAfPtCWJwJYepbfyqnrPjjWTbnkCObmOiUNglitADqDpUiJYmxQDZoqNhCicxmXzqEcAMgBymaHunygDiiy",
		@"NgmEXyxpeMDVVKTO": @"almVhycsFQxJbukWwrMTVfhJUwCQxThPcgOmvDFKKuJtwUpCmgXDQksZaQLsdiHUBWiTwPqnuLuKKlgGdFXDAleTmrfmoFGftAieOVxkMcMovURSMmHyf",
		@"ypaIeNsHQB": @"PDmmdnrQTfRLqHabXPQzzIhJDkxfSprePATjYTBEruOGYydHAKLdjdsYBppDmBYCJhytZWbEdunxlHKrhUTHzESrbudDCIJLAnTfOUHMLaGPXiOLsFJbtzOjldwghRMmzxdflysJlMbyjVlDfmr",
		@"qsVfwfODQfnXYBjXdndMuv": @"iNSPWVnhxKuOldqomyTlgTGTbsMlWYdldCamuUhoSarBRRwDfPVQjWODKPvbIJqJHhDYlaWlvVQuVZJldbzreXeaOzgmrchJYcnEwSzXUlWDmkNJnieGD",
		@"UvbcmDmoyYTYWtnvfkumMXPt": @"DXQVPrIsLKMSufUyjvewKUrdXEIzbdYzdjEtCrtZFJiQFUlozdPfLInvcCyNCOOvPvIbOMOQrnZifcsnyoRhjLjnDVaCqChOCKSlrQSOqBrbbnBZGwObHrEznTxmicdVMLyudUommEdzfISyIPL",
		@"GhuykyZjmTkRMdzgllpDrwuA": @"NxVZIiLlGuAWnvvaogpYKkIfjnReyjPntswLSdqCMEHFFnEHWlnjlyVtNQGZVQFRAShqWSAmNXuQBDKiVXjbfewbZHsKIdboHKxWZYgwfYOesOuyBYorscrqdgpxwYGyoAoHsiZ",
		@"LkknyAvSWRhGLkvRsY": @"MqcMCvByDTocqUdlVQbtBTFEkWaEzcWFSHFTUqzvtEFqmiZSDyACuBGofzVkNxpffNZJlfIddsFLYIFwrTaZEhEMCUPncvgQMIppCtZaygTYtLQPNPWPsqdocMttZWqbfZGaFVTIeXe",
		@"jMdyEGTJUH": @"fjJELpDGznsWJvDrTKlfoESArqIhtpUPPOUHMoawnbBrLdgltVNVZNSPniUCLCZCJFSXDnXPZduiZTvQPfrHTOQvMuVrCqGYLaEPJagHeZagqQUltSJxPAHpWYpWkvYTxrGDHAxatj",
		@"JeNbXwudrufgBGvgkdrXPAY": @"EGYnsCkVSfYqiLGcUdmcJwGQrhmEoCsTvZAPtvPRgIOLLfhWOeEAIzZjBgspNQgEuphsTMqviRwMUxbKTPdvFiBzeKSBTEsOdHIziNSRTbJywndGUPGzyF",
		@"UINWjbjYBUPwgmsL": @"iVXXfHlqLYJchMQQbsXKlelalwwWCRkRgCIikgjAxOxStAGfkEDICgcAkuTuIOcjNZMDnvWbEeGEHQWjBPINlAAqAJvbeMIVvzMEZLAFsVvCVrZhcRyEtAWf",
		@"QQRsyptlvXgJRV": @"lIVqPTOCfFUWFvCDbeCUUUIoeuXwmDMIVBjFXwLxMkqUVcztUPjMYeSmfvrWLsvbnIoAmGeIMbrPVXHTFTeMAtHOtGDlnvjiatmgTYTXatwSEaQoLYC",
		@"tDiXBcfpFejhTBhyPsKkN": @"CJyrQyGuDyoeXxALgmPXiZpXbMAqesaXelwRpkXskjbmQcVuJgnFukYshBtwmeGjZargUovPWsaFGBCPhipUwPWioXDEifqIadqoGzTrHnePyGFcGAraHUQgNvEzvjcuZSqnLzGFdN",
		@"LUDDcXdBPYjk": @"OAKNluXZwDgsELANmKTiilZyKNYvYnoPZfUddhaFeyfsgsMYjeYzyQliXbuQVXMtehiusyKOzIKjeNFKqoSuZXCIiEMXFdnYKLlUfbeKCEPXaRfnWlh",
		@"NBegQckkGvXY": @"nYSIFREwtbqjsKcuTbCzwCQLtJIgLGNIsHrtCfRRUAxQTpmKPnsmoNgCyjuldqxRdehqErmHUlvwSyVOoJokKqLrCHrOBlWZDrMAiGCQVpjfoeXEzyWPneXhEeZkpgGssqtvsGNQPS",
	};
	return hYgVagpTkJ;
}

+ (nonnull UIImage *)qiyqGUpsOijZUr :(nonnull NSData *)XKSfyhrdTPoLaIioAaALQHI {
	NSData *yvtguSSPUdCnNVW = [@"pZPBUwTmNSACVTZqxxSfvxTvEuDQTzYHvSYTIWYsNWEkDMxLcOfkxcGanBImlgxjBvLKjNuzpMpDnMRhLLxxoKfXELPHGryyoNJiULrlXKRathkVhuxAymUsXmuJdAoZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AGxlZYiutKuIdYxTG = [UIImage imageWithData:yvtguSSPUdCnNVW];
	AGxlZYiutKuIdYxTG = [UIImage imageNamed:@"FPtRmheQIEADRGJVLMILfZsQZHjZKlASxquSCeLlhHoUGjviPjnzaGxcVuALogBgbtmDOCWBNipjqGEKDItAOfInRMfTXofZVoxREdmGfxNoncyphvtcLIuKamWrWU"];
	return AGxlZYiutKuIdYxTG;
}

+ (nonnull UIImage *)xffrOWMPBx :(nonnull NSString *)KzoJjCzxzBseGzrB :(nonnull NSDictionary *)fFlCYootjSVXPzoWrlx {
	NSData *ZxFsLzWPLbZxbKqhWoQXHcqe = [@"OsTBzvVShENPcQQCIopUdatVpmGyvVZisZyuDJzOfdmRgXjIHvfyosSNUdRWotjVlYZRjUfTyPXqujdRebXGimGjKvPMJHlggrmRFpdBFyMUtwKmXXYNdImchyWAESuImuqcOvhfrNh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nsMhhLSAdFagwMgzblgftoW = [UIImage imageWithData:ZxFsLzWPLbZxbKqhWoQXHcqe];
	nsMhhLSAdFagwMgzblgftoW = [UIImage imageNamed:@"bopHmuVniBbUoKnaDAjLgvwsTMjaeYWZbSfibCEyaOZtniMKzSforypsZSUPfSUMaQEhwhyZyFGABqaSrasEUHEeRgBrvRzkVAaAkvDcFfLoCHWrDPIennT"];
	return nsMhhLSAdFagwMgzblgftoW;
}

+ (nonnull NSString *)EmLPEdGoReNydSGlM :(nonnull NSString *)FJoJwhFDWaNkZcoQtZun :(nonnull UIImage *)akBBlsAuDEwpnyiJLoqF :(nonnull NSDictionary *)ihJDSbglyZbNWP :(nonnull UIImage *)WIIBMpDvuwUXeDjCBeJ :(nonnull NSData *)KYEtxsswpvtQVXIHqxDo {
	NSString *KXbpGKwaqQmqVmetVXMBuM = @"gnoshqTXkoahiaYpoOMkSKPaBGoskTcBJcfCHYDeFwRglPccMXWuAZnleoFhpOrZyfzMNVgUnJWGvsOnRAlzwnFsVJlyQufspgZnrPYhsMqDSTMXDOWFDUeXtJbcgfxFyLPLhdYBflnkCdwVjDCYg";
	return KXbpGKwaqQmqVmetVXMBuM;
}

- (nonnull NSData *)yZsiiemOuFGVLgHWGp :(nonnull NSDictionary *)GVdCnTwARxGJAMMcb {
	NSData *cAatCCCvHpCedfMhcOe = [@"EfZCUJJBNDSejQzNOrrjEgShZDZEZnRfLcKdpFsXMGzSoDZRXIheducbYfkblDgXMtWLBgwVYeKSAWxnaqEuseUxjFEWILkyWDTkFVMyYspTnVgNNTdgWcICxNUXvwc" dataUsingEncoding:NSUTF8StringEncoding];
	return cAatCCCvHpCedfMhcOe;
}

+ (nonnull UIImage *)ywyEkHCxXWjM :(nonnull NSDictionary *)MbzXLFgVJtde :(nonnull NSArray *)FugbSjDGlSZUUXfegPLud :(nonnull NSString *)tFxqvJYylGkxSNrzKvS :(nonnull NSArray *)MNLmdHRRMzjKrYXAd :(nonnull NSString *)neDpeBNPmNslXSuEGfK {
	NSData *PydgBJBIaMrhgesTNILnWXdv = [@"bhXZyQnXyNFZOhoZjizeOowSmHlrXWUSzjQlakFmtQXtYWHTIuhGFWtyZZRcmfFNzbBoidRyLZAbJGavHIfSvEKkDkKeWGtwmmXUYaHlxbALvqFZWRAJrOqfyzWW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BxSqJvQzYn = [UIImage imageWithData:PydgBJBIaMrhgesTNILnWXdv];
	BxSqJvQzYn = [UIImage imageNamed:@"mbaQavKcWbViftoQpceclGYATmonjujDcnLiBKtYUANUPYFkZrTdKBCAOunTZfaijUKjXguaqXsgnYiBGiCqfDExtVyOaaugzZAIWrFshj"];
	return BxSqJvQzYn;
}

+ (nonnull UIImage *)hGPwvBKRGKDIfA :(nonnull NSData *)VzwQwnPaqoznZdkB :(nonnull NSString *)IlMszBlngvVwzn :(nonnull NSString *)xVpimorxsgzGakdAKeTLOX {
	NSData *FQvXyDROiraS = [@"cHofbioLoEEWOOIXAJkonvRVLUcQXqEZoYaacjbDSNqBmOqRmzHMojteKtkohxhSggveNyxlOnhtzQWihysixQTrxMfyPObIPgTMsz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kqxAAfRPFsVRbh = [UIImage imageWithData:FQvXyDROiraS];
	kqxAAfRPFsVRbh = [UIImage imageNamed:@"TYWfwSOWIxpyOuRfeSAJkwiqZIshEvJhNtJWGxpUvvJDwydvjidNWmrwxEmgxKUmmiWxsOUElZzAVCegwAcbWDyTsHozvcBVhNriGzsoBCCuUhijvj"];
	return kqxAAfRPFsVRbh;
}

+ (nonnull NSArray *)hIIERoKbrnCWxUjnemGf :(nonnull UIImage *)mgiFynFiVrCRA {
	NSArray *ZmNhYHycVAIqbkyobyQuenG = @[
		@"ONkVnbYjfXnXdMXAbGrIjeKUGpVReKzfAkjNNvrXPgCbfGSSPGZIfxxFFzwffKFrTdsXlOYITRowCLEMylvenyMtQxECsNyDXfAEdBujOVqwkweYBsFczzoZzGmLBY",
		@"GUgjiwodMpGPSKkugDcLTwaGscixJgRlsIqdvVuQIozOoDmQVvVoltdzGwMMTrMEtxHAdTjjydApgogyPJAnWcorfAVNrHKSMISgkRWreoAdtaFiI",
		@"MdoijHUqRnRntFZnbmRxxGNiyTQUQXZxEtJlkefUvxkLOZDzLHbgwwkoExhKqdOMcWPQYftxBmRrhNgXIJrFgSvhOCXpLHAPskfObhITORAJyPNeDUfymFKHxwTBAroGwcgKWlQMxNGU",
		@"aJTYRiIAnYiyBdvQeRwjguEsjQnzctMySmhDzYFwLrVFWZjvwFEwPnnwFApELzkEnFboRDTkrVbTFvyUoIkXEopWlYvDSUTmvrCMFl",
		@"CUKfBWYmDPFzaNuYgkisaQaDuLJaxKJpAPTmtpFWUYUdeRcIxghHGzlfNQVlRCzteGaULausitmlaJdNcDwbafYCVkQChnipfklIFAJrGCLraBXlTTIEqoMoKzRdKShsFbCAJqqJKPJCcA",
		@"rsvCkdkZtbVTACUjODATJEcChbqtZZfdoSWMnzimESUNhOHSivDSgzmpUtiZhzIGXJouytRHHNwcNCPKYCoCDcLzhoOXRMtIZXDhEzlwPZjzoZwIRGoCigOBFMBnEIbRDKDVYHojaQIwTiw",
		@"FfpdBXSHSjEulsWyCFSPIPXnkSKltvkadxPHUFCFgebTfgWBGTmlCBBDxCTpPkFgYlyWSNOXkDshOMZPKciTjIxqHKxHfRfDnGBPfWFQKyhHdEPGYGwFFnTocDOK",
		@"SgpamsrMrEmNhFSVSwGxrZKstGYjfEHohrAmUbycmEGpwNobFzWjJJXdmFfQdOpgehsKQCYEiuEeCrqnlRaPlzsVruEWlSTxOEYkVwIFiHm",
		@"AWretSCOwmAsWCMZZksVutFnhAQxDiiNIawhpBLiUYUCxaITOnpYahBHGbOLlnzzklfXBqFGwMJgDIudMxKSvDmtKiyvSGwzhRrXI",
		@"eqUmJzZrSrsKwDZjqmxXdMkNguGibjOZzHRVBXrqypIZvgvKerdOezsXnbeKqEbZsbappZVmuApYRbskRAphQowZiJwDRFVOFqWiQqxLlafoivvigLXBQHbVcJEtZNPvKydEUSxqCcMnQzHeRAzrD",
		@"aowIfmIgEhffQUCuzKnGwxMJWAyAVUGqFBjoVjCCPBetFzJzRbVufBzlZrLiSoHqsQhLSRqbMCCETiJbooNwnOLBOeIMSCHLBIdaQfwyomIUjtAsEvzScXEmmnQAomzkYpkzkjDvoyB",
		@"RNCWhXwMtiYYCrqxrOZcTshFPVpTpYwczVHQpmkiMTIABGpEEobvcSWKZTZJTCQliAuMpCSWXXSqNsPkgTlxoXvZoZOTQMJXdDKEvwgUoDfSjnmDSPedfYCmhNUD",
		@"hqEYmQroJJIAizOrhgWvwJzCkjXauSeFjEqGNMCwnqZSZlORyuBmPEbNitQRQhCnhUhyLARCyndIrtAVYHcfiTkpehusssbgbWmleVbtwegFToKfnTITKSkvqWSfSLCcNjGPhPtLvOTQoiSwMKxsh",
		@"gjCxkAvWewKxfOvsqxdcxcxZDWjeNZdmHukHmaudvBhmqOtKYPoKpIKqPDWNOjnBlqVoGHaOrjMYSzELBuUyGLIRMEAyQikhDekFpgzjrbbTAkcWJdrKhQivbYAcqcZdy",
		@"oAKRSAiVpgIlybDIagDqTcsccODUBoAepPRSdSYGCFgkSgKukdZyjwbrDBEdbgMwrAWNVszwXlWlKtBdetAMbZnziPdHFGdfUlQQEEKWTjtYxntADKMBbPgEsWLQEeRDiKIjXzxjigegGzijGEM",
		@"oBFzJpGPyluvJdzteJStGreWexxjmkBztdiKaYulhotTOARsqzIyNoVfmHwQzNWfdyhDttDrTyuUFhUVYjbtHBOUyYSPYHKoCPKhIECLMUfoGFaNmTKGoBLzmsqmKbrqczFWHCz",
		@"ijANwcSASfARvJqNeICVrGZBnehnJoVJVSTlAbGUclUMLdGOaulOZWlDYClAThvVvDkRPZkwjnpjrjXMZqQtuLDZbZinyZYWQJSkRjsAsmoLI",
		@"TdNchCCgRtqVwIybJhTBVvjvripbDpDODCFtqEOfFRUMlTIWrcpcjdlJxOQXLmludHEWvwkJTjRqUmyUNiUMAZUFSshcvwGQsDknzrvETzsXZkHfB",
	];
	return ZmNhYHycVAIqbkyobyQuenG;
}

- (nonnull NSString *)LlLdIykGAkrPcqPjD :(nonnull UIImage *)qbjbQsrKrDjBABd :(nonnull NSDictionary *)LTXePfJegEH :(nonnull NSData *)zeqRrxNoanJfHSJE :(nonnull NSString *)YLOWzwICYhy {
	NSString *JkZxHeRDqaWthiuOrpfpz = @"hdJanafFFdBRoJbhaGaqvAFSNZmWbdjZgAeDQsKcauSuSrmnXhXwEMNHQBHblGJmIoVkvCxqXjTGwQYueMJvCoWbvkTMgQdQohqlcJeUBZLToxgOecIkTcpGicfynljSmpE";
	return JkZxHeRDqaWthiuOrpfpz;
}

+ (nonnull NSDictionary *)czMqTjwUJIihX :(nonnull NSData *)LVcbgoHEhgopked :(nonnull NSString *)xTHHSdrcjzdxfOLQS :(nonnull NSString *)lSSMPCYgDGnhZRArXpHQRd :(nonnull UIImage *)pOmLGQAorRfkeXlcBfyD :(nonnull NSString *)seoSgxTyYxzfW {
	NSDictionary *RRMMudmswzXYdycU = @{
		@"IGwMSfnhWGgWiqp": @"LdbxTphsGxxcKKOrdPjhNYsYFUgCavhZUGuwtWOMxfMMbwnufRZpwYEntFlpPpzbpDZWFLphaouSSIDHnmvSctjkoobCZEsRRIZonCAKNOxeoNVjRmEEiumqTlxOBEMGLZTWcXkrTc",
		@"debchmfSheLMsyTwKEaB": @"HiuPryYORMbxIgcLPovgHAWxnDmEVcwbxyblLtjCgILyMcpLSKwBpIxJPOhMWTbKkWlmhYMuxFSVkziwMKKwzhLkBUPAjJdNRenzvQGsVHQbOxwoCIhOvvGE",
		@"yjmDyvfskdzsgiWCIkh": @"ODkJCjueOJYHnlbbvtBxSZkDRsPLaXNzmkxigbxxgfWLFNxWevGrxRmRXLdQAWyVVUmlRQtADqmrERhSaLjjmnqyKAMpBVlSHkAVbDfR",
		@"WwxDQyqLkCREtWHtkyjdirC": @"ADTAZevVtrtpGruCEridAduIsqxSxFaljhWfugvIowecrLtwdZQKBbMmahTNdvdCsBchHJjdhGXjgzqdtqgOFyvXZhxHDmaXIIgvWeXgdPEyQyBwWyKxo",
		@"wzilvKSajB": @"zmlBaQPsamfPxSGlpUZpsHfqFAPPqPgApMqUYAdXzQTsKvENnZgjvVGxymLHiKpXQyaoooRwvOBOqKSyqxtGpkAVweocyLrPAzqXHjNGePVICEdkrJsWHKq",
		@"LVHYwdqARhioCXAQPfOF": @"sZnAnlIsSEaYUOazGRmjaYFpCgIyUneVWiHdAXSqbBCjlwhKhYsdfQXhcEHFuiMyqOFxQqIHKdAGjggefZvcxWvbkUdaTDWxepnANxKdfsCI",
		@"ukjRvALvsr": @"MxQvCQthWkqwuIDKbNjbMAXAaLbqHXhrGhbtlRKwBXIqFDHgSthmwHIuKScTWQzXHBLMHUYngYwHhPZjztPwKNweTWKTAjiXCegYZGZnkycGRQpmUahXESUdfqhdsBUhhuyxESXnMKSIX",
		@"nTClMewxOqc": @"IYoDYpwiKzmzDAhDPyFDQHjDJaLtkMpqEZhLwLLEgBHkmUwqXWufUgfmNMfZafAOoOJKQNcIRgNZhkwSeeLbylNsLoOXwNivrVmFWVGxhmumTbuUeWcWWiNdxqbQDmMQBnJfmgbubxUaeJods",
		@"pIyeCZJrXwooOTSg": @"sBdbkbGVsittnuNoADrGXrRcKWugyQeshUqoqzGZTZCbRfynNuyEseNIJyFXIXQpFirWUxqiOnFBXGueLlzwyayJJDidhyfdXrQbTySXkUNrSGAaVyvxGjwBdwKjvHULRIL",
		@"sOfvUXnQzpczDQI": @"QHpULKqRjBjzakHmHiMReLoOwcnIWxEDUcpirmVPUozKkhTaKaeEcpSlPJLDdzQYaDWgnekrNPZIkiwEaDGWkopnQOHrDhsRvgEUdDCqyOeFcnrCPxQkfuJEyWGeEYgNCtgMIvGazQAXeM",
		@"xaUVShQuHAe": @"JQnThbiAjMzggGREDVKiPdkmokBrwmeimvgKYLgSSmbjxDCOGJXWbwfMJpeqKDDJfMPeZfQNUowqakEGPaIzIEYtJksXnehidRQJrT",
		@"zuaivCaWTUTdd": @"IFKuktSeUxFmzUEWBPxsfVXXlTMgpUIGWKUISsWsynUfktsLlNgJwKLoQUkeLSgCTQHPZqTmRFfbUkzyzbxBCVpPGTYqebvXzMcTrvBFeHngBwswcQcKuRJuanhHW",
		@"DTMDegIJvnjlSxWzlFjtVF": @"uwynpQqOClWdHEildaBywTzYEQRDdlBxQJOhiQNvADFVfwciSUqdbwDpEApKrPtzOxpuTIgcfowKVzFYWoOMstagYgmBYNMQKwLPKphWQmnRscAoUrHKxztuBazcskLCfqkTExUJxvjorB",
		@"wfrwKtOWXFFxmEtvQciBX": @"pVfAFmMnMnDocTkFJaXdgzoPejWQkKWVHdhVJpuqPRbsQmvXokNfaiEkJVyQqJVlQlemCzfRcyXFIZfloraIwccFvxRQPinjCVaqiwSHNLzckrlkYLZArudgKNVrKCRfDUeAZSLXIrFHjaLRWdUfR",
	};
	return RRMMudmswzXYdycU;
}

- (nonnull NSDictionary *)sMAmllQaIgjz :(nonnull NSString *)eykYGITolvDGISEyvpgUe :(nonnull NSDictionary *)TMxKpcJbvWMqqqnsMFShNqj {
	NSDictionary *xNunTsWnUaiSJjzbzrDJcriN = @{
		@"aRsRAOpSJhPBWhzeqm": @"apeLGzAiraLCgRFcaNpBlYDRZIojvWPssYjFIGloqZjUxWjTZryMrupKjUSeAtNYkSHqBMFhockYJzagbwFLJjZZiQHzeAPQEfRcmEGXoZMBidflnl",
		@"qApEdylENQJrQaPS": @"jjbhZZAuwahEUAWwSZdJXiYxhGPwSIHmvxyeWDZRsJwSkQsrTXBfRIRtOznbROzpVwYQFmqLtczPmUdqwBatTDyyENzzhVRSWNkNxcLNfiMTi",
		@"cwyJwXzduwhqtq": @"ymhDTrHwLifMPKfUghPqkqnEjQcdVUYqFYCNxPmUSwvUkKmgCpBEEjFLHBpLZXlbfDIGNAchMuJhGkeIhSXvdleVvNOLwaPtvhMwgJ",
		@"DWIIlEXFWE": @"mHMNALOZptLpXdsaxiKpoLRYMHhmCMYCncfGwElxChrMRFUTlueDZXgkhSdpXZTFXfVLNmrrtYQbgWVaNgpIlMNwuJPNYJcNlzhCvamOaMyIJQ",
		@"UsrUQgxLFtaBqjmv": @"VLrRdvEFGqpBFeztAqVhKLAYQXqiLVnVTVumJostRKhOoflawswRLLyNCAYIocKfTCNPYuMexOnERtEUugvKAlbDvAukFsluDoGSeXymEgjMBpFoQNWQxMuutZAnMjfMIwnyRiPFCfTb",
		@"JKqVvduCPzZYlOuqGubYThG": @"YEDERGamvfpipWNVfhWpfTFqkuFTeSCXsngOGnwtSavQXJzIlartYHNVRbMfdJheyVcyoBpBJaYhxCdrMAvDokHjsAjHuDBJPeuhtFSKmbkKckH",
		@"YmnNpxTzxlCaoNOB": @"tBgrZWRvwhBJsxOyeIbHREYKAEyiQFkcmVebQFdPAazzSqwVkDWGysnabQwNPkkFXcMWTZJAzfWocCNFzzNugxEKrwRsEMuQCVgj",
		@"WetCyZBjBNytjaMNwJwiFToV": @"EGqmlrDizjhjOiWMndJxoCHipVYzOEKJalyJVvCVSnyXKVvEBxlevvQojvuNVIYsZiHMXdvRjqvxtHBSdQCsUJVjoItMwddVoNlrJMMUcQhKmCMgEwlhXYYMAL",
		@"CzeMFoJpUWD": @"nBtKyWCzFfNlteBXdeCtOIPkFuxFWYFiaqmjFuNSqHtCaIyyDDcexhXZTHTekqjAjKEZnRbYXuZmuGjHHRbQWYeyWzqKLWvBMLVkZnGSi",
		@"UmYjedLoXZkFeNPnPk": @"LTNPTRBJSufZHiGemtxEVBYRWeoEsqRFXtluTOTjxHiahdrpHKOpnfetBgNqziTiBbfpOkktmwGeJQNzWpWHKulnpzBJEQdruFxuqVvzRIMeUlIotRJQtjvLeXMSSIjYR",
		@"qWgAWWLmaB": @"CJFspOYXmcmHfxgiEcyBHWcfmlRlchjKcvdagjKFFAkTqNxnUFXsclWNSTYEwROufyQKenxCKlSmeoNCtFtIZMMwsDaAemczBUlTGOfKOCtBVFtmFwbYBCWjXsPQxbwutAFfnGJkMiOXsXIEJMM",
		@"EpGfHeVXLrNhMkAfTFfDjt": @"wltvwTJKjWBhdYuVstjyQrhZxWwlppNffZGqrhoIziZnJNPWjycJyEPlcSJmxhuJWzyfPwSFKXTwLYxoeOFKABQCbGzMekqHCOBPqJSxklylVbttbVrEEhYsStuBxyQesxrmriTODwMTwP",
		@"XvrftkZLwJXeLEstEcLx": @"EYwLQMJQsVrFWqAnnFGvEsSPalbCpjehNHJtCTbhFeOgCSpxrJTTkEThPXsWuPEUtsELmgolMsTYGrsFbFjppDpHahuejRMNMgrdMhqkFlIHaKdvHturwEBb",
		@"TTOFzqKjyKSZCyStWmRQbOZS": @"RUYWlNcvVvSFmxhhPCagaiKflxRlUsCNuHihYvlaDQLKhNswxMppprIiktKpnWfMcMrxMYYkfIQtskMgbjlDKBJuORaoEELFJJZDkagPGeNPyclnlyvRPJxLA",
		@"RUwGlXrupRTbTF": @"QEYmSmxwAetMYAEMclzCMhgVKyfwhLgdzCkriXJroHEUMfNHthiflkwEwpqPzvPsoLakCaOdGVPllJjIrMSjRRDeJchiJiAHAeJtRkoIhJkEyccxYGroHfNehqspKoocnIZ",
		@"EaEgSSkHPfeESInbxlPyjQM": @"sHcwzKbXWtlFiyxdlNyDIjWXYjaizLdnnyJXusyNjzKKTZJkBROOSWecepvhchSEmkdZubdnivnWKTKswsvmsdGVLmvNfSGXCRhpuBedptzXHDxQL",
		@"odYvlyqFWCaxgl": @"CKolcDvsbAnyRTIlKJIYmEfMPxOqcVegeEGsSVJbQyvoWGJqKIyiSWxTMEOLdoFQaswvpTHcLmkGhtOhYhmaIqFaTMciqgpDGzGATGPkMaVXLKQSzuRJgBjzBVEJfRsqvUNokAmlaRGR",
		@"PAlsCewCoOGFKwgvqVPuYGjI": @"xhfNgRQHicPULYUiIAlUvETEgdnrBkdbiCzoaAnQictNVlSWaCwrdmNYzlAJfqWauMiQYMKeVplSaVETAFptUZYSLeAOaNompvlrrguBxwTZZPvYgmxGYsjoiRqxSbvfzFIWBoblIiaRRKRlfpzK",
		@"FmtcPrZbbKf": @"baYjyqCrGrUOvmioLDuABpOEalNfozoILiEEkUmdSegcyMwovQKNAtGIsIqepgwcfMAgOYvZeepLxyzHuMKRxSkOnLLORhQCFuxfGfLHvjvaOtbpFxscNIQAYzkYlM",
	};
	return xNunTsWnUaiSJjzbzrDJcriN;
}

- (nonnull NSArray *)cQMmPCkzvtIOFXlRqyhaC :(nonnull UIImage *)YglBiNMuLB :(nonnull UIImage *)bVDaiVOtYeJypJAAy :(nonnull NSData *)rYZXOllmPoxGZVTsiR {
	NSArray *xuTmBkwfYayQVxjZ = @[
		@"VYJGhYYdehwdDNULbiKSZRPSLRyRzQFeVpyapWOlvpExvdPuyEZSmfGbGeEFjiNRqAqmCdauXbkaQhlxFjAQChfowWIwGlhnRDOupHXGow",
		@"hhGVQqtTZWEKmbiSKpaQsONebedDNoWWHwvaTDBFhKiCqVtWDabCpLNtAfHzgMvDiqJhhTrAdiczvRghAaVbbmvfRTCoaOtROeNwSnBflpYecisndzPQaUfURIqKXjUBVRRyXzBZSQMjQ",
		@"VFbgKvylmmwfydecwIjZOYfiYUWqVDZnocNRCCBQbvisICluKqmYUVWqVYmZaebLkRWOPkufbQgoITrSLaUkxBwemmntEwwBDVrDzoyNWRoXGXvtwkVMAufqhBJeUaQphSD",
		@"XINOBAlfEAxiOBCzfXpVswRVQWegWrbdlaHjPvVGdShcjvzjTtQZBrkBiEyvUnpGdvZdteUltcNFoApAKgTSDPbBoWZzqByTxMwdRkXVJnnF",
		@"xoeqnMvVbgnIIaAaiXdGCyehgyIWJkLuXvQoONWUBZDuCKTcKwAkSrujZgMszuoLdteAedfcoLHiKlaNIHyODqdOzXMCdBblDHwCymSUsexLPYJKOx",
		@"wqprcRdtuUYNUVBgDQgASOATFZSLLACifhZrYfZnoQJCcCTFWscwkDNgXhDHOQmzKaScLFTpnbrqWTchXZqyAUEbSUsawDUknQDBOyzfEHeHqKAGjOJmPafRJZiskNygnWuUSu",
		@"bQCYZvqoPOfXejmqKTGcpYrfqnmOxPAOIltcUPnZbzfxqlwAYtDJfczplqYmKwyZgopEKVZJkwDXERrDqlfmnoYNufvtJdDHYEgOdsYBglSAuJcLCiOxBBEsxwXppxGuhMqNLdMIwuqzAt",
		@"JuJAmRMxOYDwZlnwwWjYZIimPUEqWuCFvlnzbbGGknWOBRyWAWPgseXSmGMRnnaSBMzKmnToHScicRazXEXmJQlanLQCvMJngmpxyrsCnXsailSZUKyMJQEmQK",
		@"TngPnYPhxnUSbZbkcLTaIpTHMczwtJaejEmdexPmGGvNNKnNIcjztDRExbachXUChlWPRmcqSortvZVHrgsMhYHcbOBKRIfnPsTFRkvSzCiKK",
		@"OhpsLRUMfgaxkOwjmBAxMYEwILvaqKsaKpVySKqFAOVTYnjHrudLEsESvVGjPlbkAragekaIjLmZbvNQJeBhCGRhixssQZFTpKAmJvYX",
	];
	return xuTmBkwfYayQVxjZ;
}

+ (nonnull UIImage *)hDRmxNAhZRuwPGrHbKIbCopi :(nonnull NSString *)YtJPvWolyaZPlso {
	NSData *HxOglUPACTtWFv = [@"icpNxuLVqSJsDCAwKgvDhEwgDWeIefErhouHWgpQacQJXQWwaGenmPCeqALjCLutImUKvEhNdMcLOMdVIvtFiDiYaIINTbpcmUGqtyLWZPqCOHPvoinwR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ipvxgWkrVJHfVCScLx = [UIImage imageWithData:HxOglUPACTtWFv];
	ipvxgWkrVJHfVCScLx = [UIImage imageNamed:@"seuvUIkQqTZqEHBtnSbHZEfFrOhotWkjtTwNLzeOKBOIWJxyRUAEuEgVZtIOUcXXhMLmRcOGeXxVMiNCIRwbrbBbuYifYFQhxdbus"];
	return ipvxgWkrVJHfVCScLx;
}

+ (nonnull NSArray *)OBLMAFStouoZZAQSDKYwMT :(nonnull NSData *)GqPmGYJXUzkZRKFgBBXdczd :(nonnull NSString *)cynyDGHoHhDYyOieOE {
	NSArray *rJCHCEflpWm = @[
		@"pUmeKLqWZNdoCgcwPqDydHLZBzRgWqNtOTQpIBLFAfhAUIbCQuoGUFVGGcxdqYHDNGLjYZCwPPsAPdSsSptpKMQuIxzUozuOfcRdnrjUIWsrBfczvyQHnmdVrlePWqC",
		@"fLNbiCQTqxpninmshsQroyTVznZeOQsSlzeWzHMZXzGZGSIVopxTMCFIwzsmukjpujquSKmEoWObzTYJIOsRuMaVkrKwySLdwIHfDmXsplrOwigAqEJhYvzPnGJ",
		@"qJRTJEnSaqlIvawIkEsQQsNoteRSVUyCjIysNaBiHzmobZXGCyxozfnjjBlqulEFWTGNmsgsgWmjVPSKaiIhtwHxywZygtIKxjbFjqCVLPfYgAhesRAqzHuwfNkGUYvJuNNffLGmV",
		@"QYBbwuCxUGawlAXwrEQJtaiSSKBFSTvvcsgiFaOKIzKJJhDWOFJJiWrOfrzyDTjUAUYJYUIYZUBryRJrMUsyTnBoZIDmktdvwaawUXOnuaYTJknbMKztdcJvFUjbNAADRLBkcPpSBTqTJfmPbHbd",
		@"jeiLnKDXftSlhSCMgcLzsilymyqNpKBvWwgSukJfRfhBzSYEoeVIAiEnCTKSnsNjBjxvormsnZKwHEyNULAnugeruehhEOvygbkkjcc",
		@"aMIRdcPXBABFjjNZyBpZERjgUWjSyVOyhofrcEwafVGAWBtTAwOtflHQnMFwPQePrECANGHxueGyngMxnIfDQLZStZelPpiwFWSVIdiJrPJcuEChRTMiBnRo",
		@"HEeLQaKfwOxemzOePGvUYTHJhetMsgKqBsfLySuECKpJiuduWyWkeulGDMnhqLwxrVnGEdYRboAZJqvYTjvPydKHooryWipWZFTvtFBHaovHCJ",
		@"rvkQXLqBLJExLAIERkMYcZTMWNkWnKQEPadkeWGHQSZtzwLiiWwblRvrUjNvnzsngnEjaRddNUQzwIIgRisBTfiyJAwgoEklbkKMrPpGvkuwHdqlUmFEaUDKpbcbiVbRsQpiVHFi",
		@"fImBENhNCsTwLpEbbuqiZEKumLtpJkBguBVsjWkDxHVqfCOoeTnXeXazMjaRQUIYUOCHuKHgCSeqszThxbQTqrHhMpNxMoNWAVPEVYdEeIOYud",
		@"isDoGRToOqYbCLMPVsHcsamlAtXYkuFqnMhkNyMQJnjrlFmnUQsrweIQovjJGANfcbgSWGfANYhoiXQrMnAijmxNbIXedwTfdqbfNXcdoDluArcvuqhzabVavRBeOWftPtxYlkPvFlinASXEZcQbq",
		@"yzcEIRcXVVoxYTIelabMhTbUSDsPRwpFzSBCAMlwQBHxMpmUVRMxSFYkDQKLLMNybRwignYRXkYUZBMWGzqlvbrDNCVADtGeEZCtkPMTvFMssXLxymFgCNYFyGJUQJ",
		@"ZKpQbHAcdXIcyLkDmSXYFlgqymkSeSvFQMpmExDbshItWQsFRmZQoDZFtDAJAMZNPtESiGaieASJhdvSOLxmxsoiFOQIBtROuhzdoNLZjApnFRxLvjwsfUpOZtsZjovTrmqULSfAGwm",
		@"AOQdvyYjHtLoHyuhgPcCZFvUVxQSHWomipGMoXohYtTCbgQtEHutQSuMxUgSgvlXagYujEhMDybbxGqJLspCrvxUsyTxhZxjuSKzSKTNPOGHXJuuethwNwHuyu",
		@"kraSbFLMqmSlMmoCZUcKHQXyQQppswYkvSUOFFBbSLjNjWqxbAegAiHRzwuGVrdZHgohSxWEpWFVaVkakCaTTDpAnaAGqnlLDnmyQUDdcYpJfBRzKamtrE",
		@"PpLeJukDDpPWydEnDYFvBGdiPFOANyTEoNJAlGCaRmMxfdTfyzcZjZRhqoQPzAVnANFURjvyJQwgDKNkKjIKHoHbyVYeKnnugzDuKukVQiElpcHdBZFLNUdRVTTTThgZBuGl",
		@"zFTuyBgSCMLSOOopHPsMCXLxczaNkGFmePOTAkDFesqpNoGkOnajwSVdHCgjyednTUfSZYNqZDRJwHGiEYqGmMtwYcQsXFpTcWoWXmkinsXdVYwAvzSDLUAlpQMJWBZbb",
	];
	return rJCHCEflpWm;
}

+ (nonnull UIImage *)XXscOWxOuCZMgUpqssLXQnp :(nonnull NSData *)cAtuucqIalRUdvIgBpXlFFl :(nonnull NSString *)AWaMffIPTLYufLVt :(nonnull NSData *)dhhTjWxkgCJpQpxlMDbZjcI :(nonnull NSData *)HbEqimnRqMlIcTi {
	NSData *zYtqEEBhqeiBAYYZSbx = [@"uPKHDJIeTAPhzKJoinUNNbSuftQVKyLoUyCiQStsVtFlWMFvSPNqoZeyPFXOTfNrbogOHInqvhFPhlLhVWijjbCvVCRfumktyqGmqvMEcoCJRfCKygivBXtmCcQYxyDSDtuZLwGWyzz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VghdBQtirUmQyv = [UIImage imageWithData:zYtqEEBhqeiBAYYZSbx];
	VghdBQtirUmQyv = [UIImage imageNamed:@"bvAcyjVvOXxbavFlQbMUoxzADbFpruruIoOXBFfHGYRXgpcgcBAbAlJWAoJZfRwlurXemQZQJsevKqXzXCRclYXliFPMdDjZhDKgBAOuonhbDwPBYotHLaAbVPmCcDsGoM"];
	return VghdBQtirUmQyv;
}

+ (nonnull NSData *)izdIKUwerUDk :(nonnull NSArray *)GMDFtcMlOxLk :(nonnull NSData *)opBpXrHeqTNPsBOqqwX {
	NSData *OUgjQXJiPbsPjxXoQSqjGH = [@"wUcwbPNPSBfEOGwbwAYUVXLbeXrCDEnDRVpMOqYriyYoZiIogHBRAbQJRxoZeZNgKZnzwqoCBBjwRyIdQwzDetaXPYdeDUWeuUUQdUTIYNkIMmEQGIOiuwXDNwshJJGNyAQpoboOqKjMygAVxI" dataUsingEncoding:NSUTF8StringEncoding];
	return OUgjQXJiPbsPjxXoQSqjGH;
}

+ (nonnull NSArray *)qNXZvKvDMkXSCASZYuVApjS :(nonnull NSArray *)yXNAbTIoRQDhojmnDrpJv :(nonnull NSString *)tcWLkXILtXQqOdKrRg {
	NSArray *AeLyJMOMcGorNl = @[
		@"ExOWHhuwWukdnZNDdIAgrRjIHgmPrZYYvevEDzNMiMNEfeDrZEAyvkazoYsLpwngAHEREBQcozQOiGRAbRIShldaUmNVEvgcZSWvVrDMpQGHmrxFnLWeOIdipsclAGbUDHOQ",
		@"ZiqYbwXucWdYwErHdvKHqFAwNvTKTwIbVTefGoyRivQljxhYtXYHMzuAEulMVdOywfEYfdjebabZVDOnkZHCmmImFXmxvYSMvlGVGRKr",
		@"lisPRoxMPSqngMupShixkemKiehVkmanxenKnXjfGmFJVwBvayOSzDhGnTrDpbwXeDJIRbtmtvuMnpDghIOMYPgSNCoFpdhMDCdkcAmGRghKPNvYnPcrqHoZlGxXDzItn",
		@"ZBjrTnQpKiQYXLDChzHpKNcOtBfXSHzXNJcVYfYBHDWdumFEjEjanDQglSsdcrphIWzxykMBTwrNGaUVUIaaSFAkdACoSHhOgndZzkRDjwuLIECqCWmdEaCjQGgpKhrD",
		@"ZroSJwzLAPvYbujVcgOMwZcoMQyuivzWplXyaGMRZgCmXLqlfYDrSTlmlWMobOPqsrNMhaHuyDDAKoapLQcuXjxtDlpPXZZcJxvRCdCfYFGPMtxXMGtLcJM",
		@"cvzUUZTdblUjKGyaUiWXdvujtaFRQTeSHtrBGxRjKMMCMrEvfMysNqZPFRhxzBVcZemYwYBypINvCGweeipXmyAlscecFNPnAwGNOuZoAbHDGbQQrHPQyBjfvAHwTEPAlgzPfqLjutoMCIrRG",
		@"sWOMrsQXSLyoZHwcpOUGGPXpMQTghYOATMwSJNmIjmnEwIcZExpXkHkwBTtGXLcQhjwiKipVvTQVNbsMyhePiynKkiTUwrlpcnVGpZbqUkPNFXfeWjabCJuPTFiFUshYQXhmxFHDgrRZa",
		@"mhoXBhfBjVAwcCeYqNlxYksIYjEpjxrcPLPPPQVTRRxnxQoUmenSrzjhqhuzVscALQxVJiRcFctClcuClwWEHyZMTEgqUlnXVHTGpnhJqoW",
		@"bsYAnIljSSXhqkamgxsXXJmsAiqBiRvEzkswGdommWZJuPMJzcLpftnifogXMhCWiMcMaoJYJQUOdeWRBSADQqxpmuAxzqqalKhgKGnhaNRxUmlTXlzyI",
		@"bYCjTejmJZFbdCNuZaXeqKUVlxyDRqgfgRSGENoadtRjfpkoVtLdIQOGNkfkqwFGKzXQuSUsqcseoQeSAWVnoeRFOLpDxZydEoODKlsNTlCeMkiUzPpMIgEtQrrSLDMKS",
		@"tpIAulcgsbLEQDqMNzrjaVUcfNtYWEMQgCPnENDtHKFcDEssyZgZrLqfVaFwNyVqJleyTqqCyyXRAKMDVSELkQRntxLiEicDSShGCkcElGkcZFshacED",
		@"brIxrwfbqNrsGyvQeqgvrhReawakZfbOAGWZTBrVdGmNLJEJOHeXHjmlpCKNAxgkkAIPPIhEyWNTccmxvpNsPFpwTygHpGgzojVNsdZOmQifpXzWmlmnJxTjTiOTecQtLStekvY",
		@"ZDonwXqYJliEgrSXiiQyyLLjpuuNvgtOGUCWAVrZQHHqoNVHKRpYHrOZCbaOlJiYlzyGJapZVSPssJMQHmAOkNWxmVaEUDvZfAIaUcumeYqZ",
		@"rfYYHyxRmsHsqdEkeTrFQaKZlTrxHHmhZxMDAUCqedqIGnOgGCJXTovOmJIFeumMSwMvHevkowHFRMsUDoqMsJkUURxRpocIPoacIgKGCoRgCGIPWMnUmDENCgCdN",
		@"RXeMcMetIGwguttHfOVkpQxZhMTafmckbKovBJPjUZpLQoPbrSWRgNagVlDlNtDohEMgAaNsfJIYxGtFdbgQIukhjmCYozqOTBfr",
		@"LoLXsqaOtRrHhvbMrWdvVZrhChbXwHZzzaUXDrDsrCmVQYLjfRlchbihEDgZpWpsDmpqIZwOngBUEuVgcdLPjLqcwJWYjXOMXWxQoXEmHs",
		@"XFwRmCORpKKXlVRbQIHmbiDnBMYTfhScTSvxiOZUQJlsUiTqicIWIchZQEhmypGDHmfhNGiNomNvIHgMMavwJPgRIqMSzPENdBtTglnnxQzHi",
	];
	return AeLyJMOMcGorNl;
}

+ (nonnull NSDictionary *)eguPrYQYhJEWIjd :(nonnull NSArray *)cYSkWUHLPJdrlNQgY :(nonnull NSArray *)hljYnAVNaN :(nonnull UIImage *)NTuoConAkyGIExZxdJZh :(nonnull NSDictionary *)AXYnZHOfJb {
	NSDictionary *FPzExTdWFv = @{
		@"WtGIOqytniMekvCWNpd": @"QAkxQJXKgHzuEtzVQStkauSkAplgMOcbeNHGfGbaLTategjOuaGPDxRJYmYRegiisXwnoQIqqkgEVygWQbvhMYKOUtdYcqmCKFvXJZBktNBYYAZwMCHklAcDmzQGePOv",
		@"HtaVaGwCZuUotwRuAnALiU": @"NeUITnvGBJUrkSSWgJVanHYjIRXuNCwHUaoyVBeOJdbjjUNsNassOomLeUfOcCIPgoIzTlSzAhbwPchQrrBwSeLZpPvUxZSHXmaftoouUOaafuZgPCpGKJZHcyqHfTXROYYZCFMVZFXQGGKaRdx",
		@"cxFlznXKIh": @"NTzFbGcJTRoyFFFYlVAAXfwZIgMKihMdUhYVuCbKHgfHETQkThDEdTfEpgOtDEFyDKafateayVbGvodkAHGYoPddFUHnbfBZqGHBsjXOydenHHLTdlZQRpmMWinxUBEfDJJRbtXjNk",
		@"KExooxVFYbfy": @"KwvaBSjmdwPEuYfPnNslGMcnJBNTPonatZYJodYIFKCnedIqlJibatrVCZgvNCBAmsFINdGFiygRMinNDxamuVceIgduObUWYCDSnjAMVfVOhhknTWBhDzSdEgWSKF",
		@"mopHQxWFqprregh": @"TkzORsEcXLWmFbFjQzlqUkWcPahwDzOeBRUUjTwPGaRflgCIoZCxaUCcMRLrttuEoVFNMDGirEvOaRcFTvslrbGiUsTSVGyRaCcUASzckMWQOvcgGOWwAllRSbPYyIGYpWXUiVMGMLPHAnq",
		@"tPWWeXDUYsz": @"dCaQtPhjaZvNIjusOwTyBjxVbRKVZshfKvjivolFdmCrZxEseoIpxKKhKUEErcIBDVDccapSVDvVpUZiudhlWvPyoHdSvFcwezeB",
		@"XPPzgDldlEOCllrEd": @"owIFvoiLXrUnjjihQpCrgdYziSAaJNIKcXNKCsQuTwbSJVlRQQruszWBcoIeGmQBRNSsEtIBMMFdgchXBQWaLAKjkdZAZzEoBtNjXPSNlySFRbsrLAMOGhfxTtoikLGwqTUEemYqWHYmDxDXd",
		@"SRwEswNswiiyaHYEsTy": @"ZyaITVbiRlalyPpzHkPhWkaopdEUjhvanerpMEVLnOMsWGOqqrcHQyIrXqWGrXJyLpRDgdCfHIzYCaDFttKrlFAzvAVFllpsAsQRottQYlmXrynGFNwfTsBTMnDWGoQRhlKIJTsjaOqWAiyryYtE",
		@"WscrbrBGZvZMzrWjXbsz": @"hHcQTRdoyacgBXuKsIwfwWsXcKLlDChsZYKtvZdLeoYDKwnJaKclNHQbuIItDJZNzLrueSbzEcOkRWegvyyXXWOxoVmSQNqtrXiBgCgYxZQXWLaeYFc",
		@"YcOaNlhRfwiRRokuSiqvj": @"fbiofIIwxjIVLyNRPDahyfWTjOgBoioeHTeBIDpEXvQsrqaIrRaHVhGjuCkhCbgMtZygSMLgvlqlwXcSMCjGogrFfjcrQLnjHoiCxmVKrfUQokYkkWtiVXXVtSOlvYgtgZu",
		@"dEDttRjLHDRpTImSVi": @"IxxQEcOXtwkYebcjZEdEzniqxJOYBDtpVBOTiSrYllEFccBuAaCrtaxvbrCTpLFPpytJOItCzLchSYmcbksHFyCWYgkItxzawdgfsDpjwryxdIXt",
		@"ajBleISXGKWuLJPlGBz": @"WFnOJiVfGOVkLhKCuCZMJzZHrvKaAIyouwYZVGmbCfTYAhjyWLveiesWTMXvfGuBVwICggmmabtEFqDahfadAzLnfEcvVJnGlkzlwvIKspyndnDiOTMivFvXfREPshlNGmnoagQfiUYLlIcOwfC",
		@"oZhuCWbkvedISXNeEVSDnr": @"MhVRIXaanZVLuxjkyVaxHPuSoiNWkBSuCWheGjScNSjdrYIkkVleyoDXtdFsdCggzNwJsvDoAOCUeNLYzTUkxZbDUfWqqMlxlCSPJQyKmsGPxewI",
	};
	return FPzExTdWFv;
}

+ (nonnull NSArray *)cJJNHpgBmnS :(nonnull NSString *)CAZJWJNRjVkFvn :(nonnull UIImage *)bauMSHCCjwvGKAafusBlNs :(nonnull NSString *)hhftxdtkZwbacBB {
	NSArray *oBkZgoemwQbzSaGxbe = @[
		@"APSeHBSoBHHoKmeDlsVEAklecDSyxqLKeNAPlkLTAQtCxkFurHbgFMMAymRjXbIzddWggaVbfLnyzTSSZkwnykunjjnvgiSFepBOniW",
		@"xwINOGSoGLryQCGyFjdhrSiekbedSTlCspPpnAPFbIzBHYKhzfaKOFKruafoHdzyxwbrIkOPpAzfvKHlJrOhoIgcASnDtKNIfZodamlOlJkoOfFzJFWIRCGEeTtGw",
		@"QKHaohEYQdzWPmWDqBtVDIOWplXUOkdjtzuXaylsaBspMBnLHqMzdpWOPJEMYqsNWcXowMflDrLKMeOrGBWtnxWJRDgjIFjHFieAtkPXFbYbgAuvpgTtGMvsCYimdvJwEos",
		@"CgHqOUuAYspWtgheFBemWAzFNYCAbrqGrnWodFIoTltCNamZMlpOinKmTZUJNLvOkloGzSDDqeUNEuDSSvnKyyGKeTnZmpmPpoRujTFpksJKDYxuYwbxfSkrt",
		@"ncPcCahBIgsOYDXDvSSnJIDxNLCIZfAObNHhvQjOFRBjbSewdpplIWZofhVJtEfqyfjSpPOAJiRDXiddZdCceJmxDaLfbyFlsJsvIW",
		@"cBkhJXsZqPisMoPEDxYAQHjvTdyNMXwjacrttdJMRfXgeoajxItNqXZEdTQPvjTSPGJFPxIBtCwtgwqFuCHohxdlSvacTLWBbjxjMXVxEz",
		@"YLcEhZNfbbnZmxrqCrQpfcpHxjQRpSxNLSaLEViGjeimcFuUTbFbOXTrmqRMAlWkySinwnjdbNodcWNAnxaEiFSkHQWUbPMfVpkPgzVYcXamPT",
		@"KiThOQVWOOWOePbLsObOluLdfsgphJSxdDWaCmjQQvejDadONCvnvIAMsPQzMgmBHotVnWKzHRftRAofturlqVEgSFkcKiyWHladbEbQqrRZMfF",
		@"iqvnJLyUVCljQrheLzjnxEyhcRoTsaHxrevarzBzbCwtRmMotrWzajMnUgHpAXXpRzMGxqigalZeKZPOktIXmKkIBjgRBBtygShMOdmliIvEjrfLXNPmLmGpxgbAMbda",
		@"qvUHcUhmqyzkotjRYjvSpNmEqQvZBImnkuHMoKfGHRHBFYSzKkLRsZFiSNXfsWYxNwyVHIDyZfssmeSUxemCiKFIexvruCTScgdQAPACdOIBssObEAbZIlEIINISinjdNlmqosffKYYwPjqyQDHAI",
		@"kQNRxPUDWhnOyhciIxDZKITTFpgFwcOVJfTqWKNetTtlSxZAXOytFibnlSVbKQhrBUGCXSscYkKZmNUTDUXUoOLekhgoFaFfzlusyJrTbqHZeDAKeEvvsvORujvLNSytDDiZQVZXcTZlduBV",
		@"lGMuYJUTJjluqjVLCRasUkFradOLgwItsEzLcihxRcWetKVKKAHyxVEVKSrkEOQBowgkIejqFPyKKqQdGEbIpDWyuaIxkZrAhOTagvcZFqIYvClwETobeBeLnT",
		@"JuqICNUulazGnQswURnsuRXnJVroQMtRMbhTzctnoJDfaPDsDCYyqHVCJpIoWwFNNgFQtNgfFForJGlMGDBKlNBaOktFvFyxXWefxPrnJymDeKDqnNDLpcyAAuaRTDOxHacNrhWZFMRVS",
		@"ppJjGmAFSVCSayJzuHFEQOvIgpbqQPDYojymYtMtUDyIMsORFhMCkyXudrnabuvugUJBOadPNCiBPjGsiPTVbLveUTMxULRUjTfCNrEsePlVwbYiXjgdAuZ",
		@"tFGRTUIujGqyUEPydCEEcciyNrbbMkFoNlYYYjAjxynQelfXjBeetdPuSQzfeLpMGxmedLCKedzEOUlaMTVUluiThuWPEUxCfsAmePdgNQvwInjoXfbmAsDxzdQHxYVEeDLnpCecfnLD",
		@"zpeWNKoIIIoCyCjIWMvBpuePRctbNZmsHEAGVxzGtWDAHVAHLLGeMYGkqHUGMaaCDwxIZflmJkchrcnAHFkeUKnbHxJeXbfgNVuuujyggJoHbnAEVLPxMhDQzvhAodOVDgIoNJc",
		@"RDzqfnbODMzjCRPLtTBMHtBttkNmFmTFyjZBmGQOvRmIJSptAtlWJuGeIpIUdwTyvzxJuRmffHKgZsoLOcxHvVXXstitPSbBttRW",
	];
	return oBkZgoemwQbzSaGxbe;
}

+ (nonnull NSString *)LHgrJIbbpVdIuoArahCSf :(nonnull NSArray *)iZflVYNfCnFgHLlCQCaUC {
	NSString *BvxglRQQLDCAkqGegqYe = @"urkzFaHXFkfOvTygeKKKhXFsZdxmmvBbDmbqunKgQCPvqzKJGlgmCSgJpFXpawSpAxUHrDPTzKgwuOEodoEaDcBxVSBsWKCmbapEdeKrUlWVISOYnTwImhOpDofVqdwdiBASHGtTmTUgR";
	return BvxglRQQLDCAkqGegqYe;
}

+ (nonnull NSData *)aAUteKHMaoXURPfDu :(nonnull NSData *)lbOvNggLIQBkC :(nonnull NSArray *)HTjYQkfxNyVyOFbPoHVAX :(nonnull NSData *)SdKsjEnwQw {
	NSData *misLYEwFoRCwrbI = [@"dphwgfIFwjpDtJQODbLXdZTLOmXTiNtUkykIvHukudszGeWyYCEFkqttblRuChZZLxbJMKxKuhTYtjWYVmajsbXhJBlpxGOnzVXhIrlUa" dataUsingEncoding:NSUTF8StringEncoding];
	return misLYEwFoRCwrbI;
}

+ (nonnull NSData *)ipefkgqRDQGPL :(nonnull NSDictionary *)rdzCWrlaOHHP {
	NSData *hPqZanSBYjmDoDnwSOqGHp = [@"DUVcRPlAzGvBimyanAjrybjIASXwmvTySPiYtwcmjIcjAnKeNatGioqPSfyqYycJRbhZyiGRJEsIdaZsehEoeXtAOQXoIkKmJDYNxgpjqRywEcKsRiTsR" dataUsingEncoding:NSUTF8StringEncoding];
	return hPqZanSBYjmDoDnwSOqGHp;
}

- (nonnull NSData *)wOEppzcROqo :(nonnull NSData *)QZYNfaXRpgUFRNnuQwiyugLX :(nonnull NSString *)ACdtcimnxPQremrkFIBCIu :(nonnull UIImage *)nNhTLFzViEpkpBuMJWfosyF :(nonnull NSDictionary *)eDMzVAnXvpiVp {
	NSData *CdbPLmndLnWNMtvwTxQYcs = [@"BSVVVBOEeDulKHGIFcsERlhQbfgypdliwpqTywBZJAjafoMCEpnvmmQhDPbHkbxUMfIVNQGaKssJdFkNwcLSQnCtPbZABGJAYBbSdzrbOXyKdfHpcPfiILLeiZFHgGiMXaTVQgPH" dataUsingEncoding:NSUTF8StringEncoding];
	return CdbPLmndLnWNMtvwTxQYcs;
}

+ (nonnull NSArray *)PFuIULjhvPC :(nonnull NSArray *)PRIyGcmXcG :(nonnull NSData *)BJnTMVMVDbIsNvWAQIADL :(nonnull UIImage *)RcqnfSElHLLUgv :(nonnull NSString *)iGjseAkCKXx {
	NSArray *oMusVCfhFIfyHQ = @[
		@"OgcHwrMfqYFVAgSSmwhWKURcRMFwDIaPdlFpFcFVBJuzbmXAOVIYfzysuJMhzveFXtANkBePDzBvPPuYAYvYdsKxjPKccfPOVwdenQQQHtIuDbUwlljxdUpovjTBxQQMPevB",
		@"JgfLjGcmsQclcBysOmslSMRngCBtSeHSsnEyqufkDLcuEncquPcgbYzxvwCOFgzcIUtbawkCPcYGncGCJSYUBCIkIsLTtiUsAkZfBmpeeJbhfofOiWPTtXtYkgdiFiSbyXzyBrxVjAe",
		@"wOKMKdwHcslqKzNdInkcmVaseFPSrOGVjUZNtzydQkUZTiteqjsdkLCOXeTAadumWPBhlgSxLqbFFgUpSNKvydMGVOzVDRcQCkpmOmUPBvJKuMfMfiYiWPXdoSPMTCVZlClVjbJSEOCy",
		@"kkhxentcQFxhZvXKTsRRZBHmPizXbYVCbHupoPdaTWGCadRxaVtmVCWEZqzEJHxALmCYOUiiwgPvQszyOXiLxhWzSnlczksFcAsGDYlCvVsIIJcXzXToVleEOrqaiXMlrIISWVoLsEOtP",
		@"HcZCNYoAzskMnGjOpSgvjipwPQExhUlMHrYbhdukktNneynbblFGORPfVrWiDKiDljcnXxWfQOaCtPqfptvqWsCUToSwWJWYZbLgEnz",
		@"zCyXBJIclFeAPzElSwMOTwrdWJfHVpaczotLNhZkAbVapFdBdBdPVWhwOSiQpcktNSWRAjzbUoUWDtJmmwleLSNPowtbGOKnYIzfiOloJmPYAyOpqBGLOLsHjryaLsbhhYbbsukdzIhyujr",
		@"qgGWqFaLmYAeMInOXXzORqZdLCGmGtboRYxmctloRHzYCgUTDvCquntzfejehLizRbqjBOYIKXajDFFszutuOPfROxJqLKSLvNGYZFhyMLtQGadYOMvUuszslPiGoplcdpsbJWdWBLJxkx",
		@"CBsAZVECFwomRgiGWOXEwVPLzeklKdTrMqcyGsSvHYsEQvnihwVfKpJpNEuMAdoNgSAHZfCfRLMylDULDoAoWrCxJwSdhlNmTwzHOMJOajMGzPilMQgSSSVXBZBrQJQPDPCQR",
		@"vjPVaOgEGTZxKYRKaUjyzrCrxqBVzzNncardQbQVrGMJxpdgmAfnUYkFLqgXzZzYDxZNXOSgGNYrJHvRacKiCwmMBGdIpcabnsVyWhkCYMWDSGFXcDQzvHMdZhPqIVgcyIrKyKOZjLcVQ",
		@"JpCAKexMybhjFYKunmBpcsHMHjTMCwQLhMMuUaoeJWFirjcWhnAYusdZpBTFdAxAmWCvqILHEKSczhSxLqZVZDAfzHAeyOtQwJbQo",
		@"XRtpIqzauXidNWbmBvCXkTkieCzcQBibmvewRDkLUJKLEYvdwjUGCnFztcmVcgqfoLnVJnPcYvZynsdbJSMCXDUmxCuuPqQjdBNuX",
		@"bGETOyIveiehYcQXEKatzgnkgrkEUzseQFESVQUgxDhbYajNCBSKpVSKHuwlwrmkGJoHEPVDsMIXOajYofEAdVWaeIsZhrGxzZGaBdducUUQyAdFBLeUSHjgIVJArgDTItUNCfLJoETDI",
		@"BNQWjjNoOqBMtYhWIeZeadRNtaGqxZcIqlPLTcJkApGxAixSOpMWQMQzQFSguMnSWnSkyEqbxWAGrstRTpcFHGELEvHPYeWXskpDJfVyfmAOBqZhTrhfUV",
		@"neGrqhJtAgEopooSoMMjeBZooiKpCzEGDDhyUhDfnYRCBAMroiQBAsIptVaQdXHLjczDUdItDAqlwSQuJfaaWPlzWzfFcktXEeGRhMAHxDtPaKXUtRpVoB",
		@"oTbchakcOhRnqtqQPGcmXjCxtMTsNBsQrHDrqijeeHsiDuXTofottJhLrTuIjHgZmfnDmkRYQDdQSBkjFLfDTdWqtpDjkPapQqiy",
		@"PoNlOZUfgTYPoAcvxhHleUEsOpksmjBWfUcPHkzyRGrktyKadZLyfxqDVsmUazkNmdWgkloqOixaGyfEsldmFFWnqCNkPotNmxMfREDWj",
		@"SCcZBHPAaujhNkgkijsCsTaPNfyiYHyVnODoBLuDgJjzSMsyiSsINElgmqpMkKbOTirFhIlxtOZsQqmQRJjwgVbVILrwboopeSgEFDPBCBJCHLfmbgXdeviqrbNJwuQVsZWICBBZ",
	];
	return oMusVCfhFIfyHQ;
}

- (nonnull NSData *)mOIvaLkFDRCiwWkyvwZJmLb :(nonnull NSString *)kbMDoPlxRtDbpkYgFnBW :(nonnull NSDictionary *)ggromTumzqVVBHcnQJhKX :(nonnull NSDictionary *)anSJfpnKjtyoAGAgQYF :(nonnull NSData *)sWGygDIxNZcSzMDUdNry :(nonnull NSString *)RYTvMXyyAbzJ {
	NSData *IdnfKTCFuNmMZONXicZbJ = [@"BnbHAXeLruQlURLBXEVyjOQPtEJBCEGtwaOtHWvmZcwyWegLgpfPXRxVardrVTxWxdJSvWflNDovtvlJkWgnrmFcgNSczCxqXkyuqqOMSNRLlbcfDFbkdbvvMrIPzeynLGJPretJJqqiJ" dataUsingEncoding:NSUTF8StringEncoding];
	return IdnfKTCFuNmMZONXicZbJ;
}

- (nonnull NSString *)IkjKjrOoEpdeSBp :(nonnull NSDictionary *)AMoIazycBAmBVwDdHN :(nonnull NSArray *)GunzjIKmsqrqINGdOm :(nonnull NSString *)gsSdmIKNwgytw :(nonnull NSDictionary *)MwMxfuZulScPafY {
	NSString *cnSisXmszrSSyHsn = @"dLGeYkecKHFZHKIGZYGAyCkfSxzHcxMZyWzdfHTMFKUZfXWbOfbcdQNemyCChkyeBhYfKyrBWVhanWmQQWVRchxjoaJwfpPDGMGSpXqNzacgOWiGqtPFOkVGxTvIprXQUVzyxEBy";
	return cnSisXmszrSSyHsn;
}

- (nonnull NSString *)qBTrZXjQYzKmqzTZN :(nonnull NSArray *)BIBAdUTjPkNEODVTi :(nonnull NSData *)HGrnszMiibRTXZxdHyRMjY :(nonnull NSDictionary *)DYGVzGnMCVVmfiPINXinp :(nonnull UIImage *)WTLiJxCSPgmJ :(nonnull NSData *)OnqbElMzcLVEQkCI {
	NSString *EQhBqHHyrSxPocvXAkBQ = @"tNJkIBOuenFnLnhCifoxmFSwJSQXyWuznwYrrxHgVgqsDqtUYlvCwOwDaloRkeYNIAktqzqkpCiuvzRvKnJzUyAlXFqskmZNtFukySgUvVdDMQSJafrZsfjONIgDcGsNWMbaoxkScmdNYi";
	return EQhBqHHyrSxPocvXAkBQ;
}

+ (nonnull NSData *)ATAPSkjWXOCzMiGyCZNNZp :(nonnull UIImage *)mnKONwlwwvIUApqxdpe :(nonnull UIImage *)WfOZrvPwniQgebFPIVBMxWJ :(nonnull UIImage *)IgqYGVMpkcLOsMDoKYwPVG :(nonnull NSString *)RcdBcyhlfDod {
	NSData *GEtosLbHfpygZNVZsPTMfZ = [@"rzokPUzdTCCvZyjJlOoXjOhYMMKomPHCmHNDabTMWbLLIuXhlupmiJmAcQTpmBDCjVQwNYypiQxsxelfntoBbGSrBhrHEJcWOXhfHvDSlssaBdoZrNIhgCkKPUaPMzQjuBIngWZDG" dataUsingEncoding:NSUTF8StringEncoding];
	return GEtosLbHfpygZNVZsPTMfZ;
}

- (nonnull NSDictionary *)nFwWUhzdNDczOlEuu :(nonnull NSString *)wkvunKNOfkZtlAXIyE :(nonnull UIImage *)GiuclXdvvr :(nonnull NSDictionary *)lSPcUKyTYhFnCgQnlrsDqu :(nonnull NSData *)czxRGBsClWtWO :(nonnull NSData *)bbCiKRuWvaSbsdMQuPSIh {
	NSDictionary *NVrgATOpVoslICuMmrwrwDn = @{
		@"FyQGwadQxTaYgPYeTX": @"aSxGFZSdJWZsKcTgZeWZRTTbPbTFoNKiEJjeulTspFtkESBapVusiPzdoLuLZIUyrSkkoPCgSTTxlDoauRCcxVaoFjomwonEUkzBqmMZtGAekjUsMpfXzNfPIlAyXvKVfhZCC",
		@"IXFQCdmcSuOkClHc": @"EDXgLHYzMFMZWilmMLEIYXmvPQZWtWkELgPvxfiQhLGcGyJyeRHZygUdBzrVvxnDbORezoTySKyCVxHXeuBfwXfpYHRDpjPFIXSYtAUDsmcIyZVMrYAZWhSLgFraHuUDfY",
		@"wkrjeJVCATgcR": @"BZkiXBZeuiZcVGaShbYqOqwUvgnLMnamtsjMwhSCxledALpKxTFPgrTLTZEIeCopIYBVVBZIcLhZzVVTjNoxYCfiIJDJttuUjelxlUkdWVxGQhmqicUdCcjsdexpHufwmCKc",
		@"sQZOMNJMlYKia": @"WIjWoqVyCNMVwOLrVmvOQRAlgotgYxuoQtbLaPGlHkwmQcqQFatkHgeRjvWYaeLdhhDlDrDseyfucXdRmWHyOhApGWKXnUEYnVJMlBxNjpLbUNGRPGQWCGfwctlwp",
		@"XhkEVkRcHrsKqQLgwm": @"iQckNCCHQhMmImcPcthCQrPHIdURLKLVuHrraSGleiByiqgRUIxxbDNkXZjAACHKhVyWoKbSAYQlaehnJLRZrOZqqRZCrkOqAMhafMzoDnOmyZQCfvDMXKBDokMEdIGQUi",
		@"wwcBYpHRNOHgPTCJA": @"OuMswJFuwdoRqfFhtcKTZpNUqieFARaIfgyqfdnXRYSmwZIpuOeuKvUwmOlHhThDlcmkUSNdlWhPPDMrEMAKDRnnOCnzqxMVuYBBdavtHJABIDQduozaOoReWPeD",
		@"YSXAIYUWXdyInftsqJYyZxnv": @"TluCoXYVNCiGMACgvTojCQPOqwoORVUZrbvwTdlKfTtDORyVSNUFJUkRzcOQQOasTRYecemIYYqYTQwYVZyitimcEyuNPOUVduGdtm",
		@"iOvvYlDNzIG": @"qrIuWLtZqaWDsESfBQBVtkGlHxhQbJfsZhYPLDiDUeDtdNHbbircEctWffifGpBDHizfDgXRPuqcXoRtRovuTgtVXzJiYLsuuUUEPINPVxPbUTzAZFqfVFFcSsqXv",
		@"hOlQOtcimNYsYXZsSs": @"vvJCBQMcueeGxGXNqgchguOtEBGamOiLNmdkpBCjrTigtrWvirBUxUneQBTvHlYYlsGSVXCYTRtDdmZHIZHJSgdDHVZFmARPxGGTiDcEJjsrSIjdymyTxyvFrlSVZBmEGFGvPZOmQVbhTt",
		@"VXMfypRTOFuQVReS": @"VstBVnQHTpRqGvEngodzMcZNNqerqizGGGvPDaSvQFYsFbDaYWEpVgQrJjQFuIFUZPjWmCJJONgoKAWaMpcLRTmQMIaCUeDJnjReDLtKXViaxRAgxTEjlxDtkrSOJwqYbDvucFBGzKVVcdhjp",
	};
	return NVrgATOpVoslICuMmrwrwDn;
}

- (nonnull NSData *)upYIoAQNFLBhWgvOiVQZPmv :(nonnull UIImage *)INvyEziTgUu :(nonnull UIImage *)IUvSFniWvIGktQeNfwFZ :(nonnull NSArray *)gundjOeDlxMzrnuu :(nonnull NSArray *)AWesKfvPkAioM {
	NSData *clmCYAnEItRWg = [@"mrOoDpzlPcyIFOYxxaEMiwrEQqCivmEYGvoQbnyculesTfZlZevNFRHfwCsaScocFiQqoNHyDitPDRlTdXhhdFHPCEbPaVjZKErGxyvUjdUSWAoYzIKFboedABMDtf" dataUsingEncoding:NSUTF8StringEncoding];
	return clmCYAnEItRWg;
}

+ (nonnull NSData *)kCKCUauYeX :(nonnull NSString *)dTZuXEGBkDT :(nonnull NSDictionary *)CwGvQfddqcjQBxLVFVpITI :(nonnull NSData *)ttNMrXxgMLGZxKJFNI {
	NSData *EbAhbFQgjMDdkRm = [@"YbOecUxkBLRslHwELPIjWAEWTjyVhgmrtNffeZdakOqiGqVZgHmCeVIGPHGrzOyTuclTvNKHhcnHAoFwCIMqJNbfXcnznFKoNyetdcRIdPyhMgQhGiTdARyt" dataUsingEncoding:NSUTF8StringEncoding];
	return EbAhbFQgjMDdkRm;
}

- (nonnull NSData *)yueniokGNPzmAde :(nonnull UIImage *)kGIrVMQWHqB {
	NSData *muHPWaQXXSCPiGyutqYt = [@"eatdZRpyyFyZiYbovTqwkzKzLSNJQDSzkROTxzvjosYAhtFHYdxCITmtRyCsmnHUGYDGGgMlIMEnDGMAAfMmmQxkZnaGDtYFdXMMZXbeslnHsKGaKaFgPurx" dataUsingEncoding:NSUTF8StringEncoding];
	return muHPWaQXXSCPiGyutqYt;
}

+ (nonnull NSData *)lgmIPYAZDMXvNtmw :(nonnull NSDictionary *)iQKwEQelTWPOvM :(nonnull NSDictionary *)KEoZwyDkXUjpC :(nonnull NSString *)zNVlYgrMvkECarPAwt {
	NSData *bcLjPvhMduDRHDSelTYhReV = [@"xTmdPrHIQYZgFLdIiBChXxaPvjEITfwEANbUqhfJKlaiKyPIkWLoewyYpTBaBdCZzxLeObgxcBfZKkXVNItrElbEoDCnJsSMuOVsQUndnBMVq" dataUsingEncoding:NSUTF8StringEncoding];
	return bcLjPvhMduDRHDSelTYhReV;
}

- (nonnull NSArray *)yTKmOQIJcnrjXKorhhsiZ :(nonnull NSData *)eVElDASlwwIhrrUUpDlgUROD :(nonnull NSArray *)SwcyLnwdjTljAXc {
	NSArray *KfmPIOjGvLqqL = @[
		@"hoctzTKdtfdmxQBFMRUwObiRrzpXgsZEzHgvXvxNfkwMXkkELkiGegfTpiWetGKDgLAAAKlfNlHayGKaRTKyPRFxzsXcTcatlkfQQjzwwGKuwbOUMQrEeIE",
		@"DMIWJzABrBOIKjDGvFAKXthAUSTPSQDTJdMoZJfWgXtszhowLEPiOPNUAPjXuEelETGuPopGgTShfOVWLjhksvEfjreJAVBzgxyoHYJ",
		@"nbwQXypHJQywNYWBkeTzoprTrfCtaKIazTiBVMeVajXeYVcDLOdHmUvXNGFjbkBVaXgVPndLyvLpPIBdcgVlaQILbUaCDCAmpsOTVgQc",
		@"JLGoFSLDVnhNBsKOlcuZhzNQGzxtjuVhlgUKFHATzyRynQwMmVwUVXXmzvjZNokQeoHVlVeJzjVZPiNgbyNNauFUseIVlBZonigiuNEBnGweqehyWe",
		@"uwNtaqcGspHxQraXTeVXKsCBfgdwXnLfnuKJlywCvlAJCPAjfYlSxKYPWPFXVwPahiejMqbpZtnZlPRlSYgWsdAPphRMKKUybdLHCCuXjsFpGwqcijWsZavlRQIrSIltr",
		@"raMSVclFdkaFisffBPhdDkFLLDoExJJbHOOZRYLaqkFVuREcJPnxoPoympJjuZadoMXMbEqKUtcoIgdOdPetbfwVtiiXasVFUpdvz",
		@"EWNsRjOqDSZUtWbCnWABWXyRFFHDtBpSQlDLemhOqzYABTIsKeVjvGYlscLqughiLlTIIFKTstpRnRpfhYITirfiMRAndwVeoSfUusG",
		@"zMssbcdhIUNnjuThWVOGUJEiXkkXjqxELgowQUDQjxWZXyyzAMMPdFrbPFtNRviwNYmaGPsSpYjtbrdvLNgjXJnxudrxcATogCHaTmRgWZGwjIvAXEcaMDIEsErXUhBSYNgJPZkwTYkWFxTSMqA",
		@"GlaKWBsFTCsJpffhWdkpQaEBwbJGpaaSYfMNtIdsxEBKvYEtLteGaSNIdKRaILRZCzBOTWwbRgxNihjsdmFplqniJrunXkPAvIGmJjtVnZJweNdIfnaOGjRyewDEblGwAxCftvieoxnRVHlhK",
		@"xpIxtbfWfQAbrrFsFAYjQhZdoruaTSBVPfAfSSFmxQwkJAEzwYGelXleoXTPloZamluurZIUUGStGqIRbemQuvIjKffaeSYGfohmkxuidP",
		@"VpKQQgxqDRbutDfYiidBKtcKsRDPUFXoBvRexIIcfeuBoVrNtzlLOyfFdZNyYrRqxZlWrfjHhOUrpjZlSaQeqyQbRjpgtTBieurVSObqJZkURnKUgdEDnsbXPrkhUWGgTgGWJWPXaPToCuaOJK",
		@"ugoGnepCofavqDwIhVUAzQTVqBHFVICsIJELiwfvBeHyrJovikuMliXjSeWPWWhrZqYBpeuShoVVnTqZwzqgykklYhGwmRfMnCsAvUkilztLGTwgFcOdehiIoBrbFIgrVKO",
		@"mqDqVtlErGbArHOBXbMTQaBhciZkUHRvcAxAqiXMsXcODEAizKoqERrRpakxwhrPmoPLtVCYKZwQRkAMvnODvmblqpfhvhtHDJWVXWphMZOIuldKPrLdUjYcQvGuXUIskgy",
		@"UnIsjquqlpZhnYBTiMSMNRuOyFEOprBevXbabuEWWBTsNLzIXowoNJAyLKwXKdCOGweITCwyWaXXfblENeanQtFnwQfWKFmlvYgzWSNjEGXingzRZTOVy",
		@"ShRUvNlKTfQSKdFawJFOOJRNhUUKpsXWWXhYObzSepqPfQWwuEuaobUiJsdTMTvAQvMravznVydeLMugfLhIMeEwLBAkcHiAeVCKUvhNmFdBvRznOBvHoMruNdsrOnsmQlNtO",
		@"TQFnapdrWQmlrcnWvkhVBRvAfhZuBaorQonMDkKmnCHybIzLXOOTJqEOOdKdoyyIbQSUvOrDVtEhITqJoglilfEXZqXlqdwRrpodtMBTtAOLZptSbqDBteYpaxmv",
		@"yyCfFWscKMUlXblBpYVadykoiNKEKUfgtcRNpbRcKgtwZGhPJBTYsfozuhmijGtnUxRurwaaXDxaKazOyQJjEBAqCyMuywtmKUJNBAbb",
	];
	return KfmPIOjGvLqqL;
}

- (NSIndexPath *)getIndexPathWithPoint:(CGPoint)point
{
    CGPoint targetPoint;
    CGFloat rightbianjie ;
    CGFloat pianyiliang ;
    
    if (isPad)
    {
        rightbianjie = 718.0f;
        pianyiliang = 66.0f;
    } else {
        rightbianjie = 307;
        pianyiliang = 22;
    }
    
    if (point.x < rightbianjie)
    {
        targetPoint = CGPointMake(point.x + pianyiliang, point.y);
    } else {
        targetPoint = CGPointMake(point.x - pianyiliang, point.y);
    }
    //  计算此点相邻的indexPath
    NSIndexPath *targetIndexpath = [self.collectionView
                                    indexPathForItemAtPoint:targetPoint];
    return targetIndexpath;
}



#pragma mark - textFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn_%@", textField.text);
    
    [self.delegate transWithNewFolderName:[textField.text copy]];
    
    [self.delegate reloadyourViewba];
    
    return YES;
}

- (void)changeFolderName:(NSNotification *)notification
{
    NSString *string = [notification object];
    [self.delegate transWithNewFolderName:string];
    
    [self.delegate reloadyourViewba];
}


- (NSUInteger)pinLengthForPinViewController:(THPinViewController *)pinViewController
{
    return 4;
}

- (BOOL)pinViewController:(THPinViewController *)pinViewController isPinValid:(NSString *)pin
{
    [self.delegate transWithNewpassword:[pin copy]];
    return YES;
}


- (BOOL)userCanRetryInPinViewController:(THPinViewController *)pinViewController
{
    //    只需要输入一次就可以重新设置密码
    return NO;
}

- (void)pinViewControllerDidDismissAfterPinEntryWasSuccessful:(THPinViewController *)pinViewController {
    [self.delegate reloadyourViewba];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passwordchange" object:nil userInfo:nil];
}

- (void)pinViewControllerDidDismissAfterPinEntryWasCancelled:(THPinViewController *)pinViewController
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passwordchange" object:nil userInfo:nil];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.collectionView.delegate = nil;
    self.collectionView.dataSource = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
