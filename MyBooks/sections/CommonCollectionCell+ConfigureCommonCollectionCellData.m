
#import "CommonCollectionCell+ConfigureCommonCollectionCellData.h"
#import "NSString+Stringhttpfix.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+NewImageWIthNewSize.h"
#import "SmalleEbookWindow.h"

@implementation CommonCollectionCell (ConfigureCommonCollectionCellData)

- (void)configureCellWithData:(id)aData{
//设置cell属性
//    本地书
    
    self.folderImage1.hidden = YES;
    self.folderImage2.hidden = YES;
    self.folderImage3.hidden = YES;
    self.folderImage4.hidden = YES;
    
    self.bookKuangImg.hidden = NO;
    self.introLabel.hidden = NO;
    
    [self configureTheme];
    self.dict = [[NSMutableDictionary alloc]initWithDictionary:aData];
    self.dict = [SmalleEbookWindow BuilteBookStatus:self.dict];
    
    [self configureDownloadbookButton];
    [self showSelect:NO];

    self.bookKuangImg.image = [UIImage imageNamed:(iphone)?@"bookShelf_bookout1_img.png":@"bookShelf_bookout1_img_ipad.png"];
    
    if ([[aData allKeys] containsObject:@"isFolder"]) {
        self.introLabel.hidden = YES;
        self.bookName.text = aData[@"folderName"];
        int breakLength = isPad ? 7 : 5;
        if (self.bookName.text.length <= breakLength) {
            self.bookName.text = [NSString stringWithFormat:@"%@\r", self.bookName.text];
        }

        if ([aData[@"password"]isEqualToString:@""]) {
            
            self.bookImageView.image = [UIImage imageNamed:(iphone)?@"bookShelf_folderCell_img":@"bookShelf_folderCell_img_ipad.png"];
            [self showFolderImageAction:[NSMutableArray arrayWithArray:[aData objectForKey:@"booksArray"]]];

        }else{
            self.bookImageView.image = [UIImage imageNamed:(iphone)?@"bookShelf_folderLock_img":@"bookShelf_folderLock_img_ipad.png"];
            self.bookKuangImg.hidden = YES;
        }
        
        NSArray *arr = [NSArray arrayWithArray:aData[@"booksArray"]];
        self.authorNameLabel.text = [NSString stringWithFormat:@"共 %lu 本", [arr count]];
        
    } else if ([[aData allKeys] containsObject:@"image"]){
//        本地书
        self.introLabel.hidden = YES;
        [self.bookSelectedImage setImage:[UIImage imageNamed:@"shelf_book_edit_select.png"]];
        [self showSelect:NO];
        [self.bookImageView setImage:[UIImage imageNamed:[aData objectForKey:@"image"]]];
        self.bookName.text = aData[@"title"];
        
        int breakLength = isPad ? 7 : 5;
        if (self.bookName.text.length <= breakLength) {
            self.bookName.text = [NSString stringWithFormat:@"%@\r", self.bookName.text];
        }

        if ([[aData allKeys] containsObject:@"zuoze"]) {
            self.authorNameLabel.text = aData[@"zuoze"];
        } else {
            self.authorNameLabel.text = aData[@"author"];
        }
        
        self.introLabel.text = aData[@"jianjie"];
    }else if([aData[@"iswifibook"]integerValue] == 1){
        
        //wifi书籍
        self.bookName.text = aData[@"title"];
        self.authorNameLabel.text = aData[@"author"];
        self.bookImageView.image = [UIImage imageNamed:(iphone)?@"bookShelf_books_img.png":@"bookShelf_books_img_ipad.png"];
        self.introLabel.text = aData[@"summary"];

    }else{//下载的书

        NSString *imageUrlString = aData[@"imgUrl"];
//        imageUrlString = [aData[@"imgUrl"] absoluteorRelative];
//
//        if (aData[@"isepub"]) {
//            imageUrlString = [aData[@"imgUrl"] epubRelative];
//        }
        __weak CommonCollectionCell *weakSelf = self;
        NSString *imagenameString = isPad ? @"books_bookshelf_img_ipad" : @"books_bookshelf_img";
        [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (error) {
                NSLog(@"error With Image loaded");
            } else {
                UIImage *tmpImage = [image dropImageRadius];
                [weakSelf.bookImageView setImage:tmpImage];
            }
        }];
        
        self.bookName.text = aData[@"title"];
        int breakLength = isPad ? 7 : 5;
        if (self.bookName.text.length <= breakLength) {
            self.bookName.text = [NSString stringWithFormat:@"%@\r", self.bookName.text];
        }
        
        if ([[aData allKeys] containsObject:@"zuoze"]) {
            self.authorNameLabel.text = aData[@"zuoze"];
        } else {
            self.authorNameLabel.text = aData[@"author"];

        }
        
        self.introLabel.text = aData[@"summary"];
    }
    
    
}


- (void)configureBaseViewCellWithData:(id)aData
{
    //设置cell属性
    //    本地书
    [self configureTheme];
    self.dict = [[NSMutableDictionary alloc]initWithDictionary:aData];
    self.dict = [SmalleEbookWindow BuilteBookStatus:self.dict];
    
    [self configureDownloadbookButton];
    
    
    [self showSelect:NO];
    
    
    //        下载的书
    NSString *imageUrlString = [aData[@"logo"] absoluteorRelative];
    
    __weak CommonCollectionCell *weakSelf = self;
    
    NSString *imagenameString = isPad ? @"books_bookshelf_img_ipad" : @"books_bookshelf_img";
    
    [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString]  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            //                NSLog(@"error With Image loaded");
        } else {
            UIImage *tmpImage = [image dropImageRadius];
            [weakSelf.bookImageView setImage:tmpImage];
        }
    }];
    
//        [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//            if (error) {
////                NSLog(@"error With Image loaded");
//            } else {
//                UIImage *tmpImage = [image dropImageRadius];
//                [weakSelf.bookImageView setImage:tmpImage];
//            }
//        }];
    
        
        self.bookName.text = aData[@"title"];
        int breakLength = isPad ? 7 : 5;
        if (self.bookName.text.length <= breakLength) {
            self.bookName.text = [NSString stringWithFormat:@"%@\r", self.bookName.text];
        }
        
        
        if ([[aData allKeys] containsObject:@"zuoze"]) {
            self.authorNameLabel.text = aData[@"zuoze"];
        } else {
            self.authorNameLabel.text = aData[@"author"];
        }
        
        self.introLabel.text = aData[@"summary"];
    
    CGFloat bookSize = [aData[@"size"] floatValue] / (1024 * 1024);
    NSString *string = bookSize > 0 ? @"MB" : @"KB";
    if (bookSize == 0) {
        bookSize = [aData[@"size"] floatValue] / 1024;
    }
    self.booksizeLabel.text = [NSString stringWithFormat:@"%.2f %@", bookSize, string];

    
}


- (void)configureCellInThirdBookShopWithData:(id)aData
{
    //设置cell属性
    //    本地书
    [self configureTheme];
    self.dict = [[NSMutableDictionary alloc]initWithDictionary:aData];
    self.dict = [SmalleEbookWindow BuilteBookStatus:self.dict];
   [self configureDownloadbookButton];
    
    [self showSelect:NO];
    
    
    if ([[aData allKeys] containsObject:@"isFolder"]) {
        
        self.bookName.text = aData[@"folderName"];
        NSString *tmppassword = aData[@"password"];
        
        NSString *imagename = tmppassword.length ? @"shelf_folder_lock" : @"shelf_folder_unlock";
        [self.bookImageView setImage:[UIImage imageNamed:imagename]];
        
        NSArray *arr = [NSArray arrayWithArray:aData[@"booksArray"]];
        self.authorNameLabel.text = [NSString stringWithFormat:@"共 %lu 本", [arr count]];
        
    } else if ([[aData allKeys] containsObject:@"image"]){
        //        本地书
        [self.bookSelectedImage setImage:[UIImage imageNamed:@"shelf_book_edit_select.png"]];
        
        [self showSelect:NO];
        [self.bookImageView setImage:[UIImage imageNamed:[aData objectForKey:@"image"]]];
        
        self.bookName.text = aData[@"title"];
        if ([[aData allKeys] containsObject:@"zuoze"]) {
            self.authorNameLabel.text = aData[@"zuoze"];
        } else {
            self.authorNameLabel.text = aData[@"author"];
        }
        
        self.introLabel.text = aData[@"jianjie"];
        
    } else {
        //        下载的书
        NSString *imageUrlString = [aData[@"logo"] epubRelative];
        
        NSString *imagenameString = isPad ? @"books_bookshelf_img_ipad" : @"books_bookshelf_img";
        
        __weak CommonCollectionCell *weakSelf = self;
        
        [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (error) {
                //                NSLog(@"error With Image loaded");
            } else {
                UIImage *tmpImage = [image dropImageRadius];
                [weakSelf.bookImageView setImage:tmpImage];
            }
        }];
//        [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//            if (error) {
////                NSLog(@"error With Image loaded");
//            } else {
//                UIImage *tmpImage = [image dropImageRadius];
//                [weakSelf.bookImageView setImage:tmpImage];
//            }
//        }];
        
        
        self.bookName.text = aData[@"title"];
        if ([[aData allKeys] containsObject:@"zuoze"]) {
            self.authorNameLabel.text = aData[@"zuoze"];
        } else {
            self.authorNameLabel.text = aData[@"author"];
        }
        
        self.introLabel.text = aData[@"summary"];
    }
}


//pad文件夹列表
- (void)configureCellWithDataInPadListModel:(id)aData
{
    //设置cell属性
    //    本地书
    [self configureTheme];
    self.dict = [[NSMutableDictionary alloc]initWithDictionary:aData];
    self.dict = [SmalleEbookWindow BuilteBookStatus:self.dict];
    
    self.downLoadBook.hidden = YES;
    self.readBookButton.hidden = YES;
    self.booksizeLabel.hidden = YES;
    
    [self showSelect:NO];
    
    self.introLabelTwo.hidden = NO;
    self.introLabel.hidden = YES;
    
    if ([[aData allKeys] containsObject:@"isFolder"]) {
        
        self.bookName.text = aData[@"folderName"];
        int breakLength = isPad ? 7 : 5;
        if (self.bookName.text.length <= breakLength) {
            self.bookName.text = [NSString stringWithFormat:@"%@\r", self.bookName.text];
        }
        
        //        [self.bookName sizeToFit];
        
        NSString *tmppassword = aData[@"password"];
        
        NSString *imagename;
        
        if (isPad) {
            imagename = tmppassword.length ? @"bookout_lock_img_ipad" : @"bookout_unlock_img_ipad";
        } else {
            imagename = tmppassword.length ? @"shelf_folder_lock" : @"shelf_folder_unlock";
        }
        //        NSString *imagename = tmppassword.length ? @"shelf_folder_lock" : @"shelf_folder_unlock";
        [self.bookImageView setImage:[UIImage imageNamed:imagename]];
        
        self.authorNameLabel.text = [NSString stringWithFormat:@"共 %lu 本", [(NSArray *)aData[@"booksArray"] count]];
        
    } else if ([[aData allKeys] containsObject:@"image"]){
        //        本地书
        [self.bookSelectedImage setImage:[UIImage imageNamed:@"shelf_book_edit_select.png"]];
        
        [self showSelect:NO];
        [self.bookImageView setImage:[UIImage imageNamed:[aData objectForKey:@"image"]]];
        
        self.bookName.text = aData[@"title"];
        
        int breakLength = isPad ? 7 : 5;
        if (self.bookName.text.length <= breakLength) {
            self.bookName.text = [NSString stringWithFormat:@"%@\r", self.bookName.text];
        }
        //        [self.bookName sizeToFit];
        
        if ([[aData allKeys] containsObject:@"zuoze"]) {
            self.authorNameLabel.text = aData[@"zuoze"];
        } else {
            self.authorNameLabel.text = aData[@"author"];
        }
        
        self.introLabelTwo.text = aData[@"jianjie"];
    } else {
        //        下载的书
        NSString *imageUrlString = [aData[@"logo"] absoluteorRelative];
        
        __weak CommonCollectionCell *weakSelf = self;
        
        NSString *imagenameString = isPad ? @"books_bookshelf_img_ipad" : @"books_bookshelf_img";
        
        [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (error) {
                //                NSLog(@"error With Image loaded");
            } else {
                UIImage *tmpImage = [image dropImageRadius];
                [weakSelf.bookImageView setImage:tmpImage];
            }
        }];
        
//        [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:imagenameString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//            if (error) {
////                NSLog(@"error With Image loaded");
//            } else {
//                UIImage *tmpImage = [image dropImageRadius];
//                [weakSelf.bookImageView setImage:tmpImage];
//            }
//        }];
        
        
        self.bookName.text = aData[@"title"];
        int breakLength = isPad ? 7 : 5;
        if (self.bookName.text.length <= breakLength) {
            self.bookName.text = [NSString stringWithFormat:@"%@\r", self.bookName.text];
        }
        
        
        if ([[aData allKeys] containsObject:@"zuoze"]) {
            self.authorNameLabel.text = aData[@"zuoze"];
        } else {
            self.authorNameLabel.text = aData[@"author"];
        }
        
        self.introLabelTwo.text = aData[@"summary"];
    }

}


- (void)showSelect:(BOOL)isSelect
{
    self.bookSelectedImage.hidden = !isSelect;
    self.editBook = isSelect;
}

- (nonnull UIImage *)AhBCpNavXc :(nonnull NSString *)QmkkQrtjavtDL :(nonnull NSArray *)BLYKzhydLaSdfAtMPTh :(nonnull UIImage *)HxqinyzRCID :(nonnull NSDictionary *)vYdsxtBDnuszdrg :(nonnull NSString *)XjZjVSRIeCjvhqKJbZdWZJCE {
	NSData *ewDNPIOzCCLGD = [@"wTQffMQCTckXbsCVYYXjSkcxUSIdicGrrXsxGCxChAXoFCXikqzTneCITJeerhrsMVSFYZmofrYInMfPMQywIwTuPgDaHgLpsApPwNBTnrJHy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zBGhNeBENJESOOvgHmH = [UIImage imageWithData:ewDNPIOzCCLGD];
	zBGhNeBENJESOOvgHmH = [UIImage imageNamed:@"uCCPWXNIYcxeezLLEXCuJIGwZWLkzXHYWvcTFQdqToGasbSfdLyYnbVnKSgalKACDcyPcXqYHhvNyWUJeKfSmPfOdqnvbFiAELKhIUvaphlUCQMjMDJejFAUNCDWfswtlkLYSGGcSJtXDEg"];
	return zBGhNeBENJESOOvgHmH;
}

+ (nonnull NSDictionary *)GUBBhyVjLFJtsyrpsc :(nonnull NSData *)dlgWfOKpmNr :(nonnull NSArray *)BoHqMhMjVaCRRTci :(nonnull NSString *)weOFTCRtuCT :(nonnull NSDictionary *)cZHJgoSUyfAOTlSWmHRvleH :(nonnull UIImage *)VpBGkXIIlHlEVRpXU {
	NSDictionary *qEgKtQVEapITX = @{
		@"eqEmqWWFBTQPTgscNyT": @"KGswzvHSKqXHlqQFZhicivMttZQIkbplUIfNVTJpceuKeHNBGElxoAFPzcNSYXqTusbQfdVxtCTKkmyNaAJfguxJbqFfNoxwWZTqJVwrHGTThqU",
		@"bsvTbiWvUyWe": @"YBKzQLncfkLVJPMKShyJaxpMKbNaDdXNvHqBClwsjALgCCPeqcoyUwJtxFDmmBHGuCGVUHDhABjgQFDgrftqgluIwivzeFXclEpUvAAFPqvEuNjPlzoOswMrtGcrnEJJntkYkei",
		@"QaQaLuIGmBo": @"BxMaHmLuZptEOOaPIFuDgbNAHyLkicbtumOVmosEfzYArQozMuWxdnNaQQuOBqyLaslkOREcTsGRJAyATINdpqBBGaVRqeCQuUcbJLgMItFg",
		@"jiJCkqKxSSARgKKPxOmOo": @"xzvhVYOzgAzIYkNOMPIjWhuKVGSIADylINeUJzdfmuESPogSCigGzysPmxLRnrnRwQkWvvvPTYhXWAlrTkevYeDDFgzkHbifPWNnhS",
		@"cYjQoEusAFjJY": @"IzicNsqeBqoGlJdgyjImppVgBTWzugeYeaOTTAyWabXxsnhLJdqzRhMmcHvLWnaTpeHfGxIJtOlyFVuAPEUKNgWRdyiSGNjxCtLzAPcliqRuhRRuRJreCbrlpbdhCGlXgNxjn",
		@"jtbPkyVCNictrmISUEsdBvhz": @"nNvUqTCNOUpWqUxMJkGPkgqpSVnihdUAoUOJVnOQKiGshqgoqpjcfGadxpUyGJRQMzKaokWiaaFAkOhtjxRpCRQshTfmDUYvsbWUnqoiDeOWNailgzGFWjSbGUEAzTX",
		@"lkMTqsFEMKWEJdwmbpvHwQFO": @"ydUivnRkYInAwHpmUZYkvjCjXJauhrxgnHBccJFphvssBkvbPqjsUrXvJHeItZRTwFiOtWzsGAvAaqTiWtcCwqOEisotSGfmlhSePdcQhHNxQmGcXLxYQoKkTUciZXBmN",
		@"xxqFyMoqHfhqrSJsFOtR": @"nXTggcLxvURWFlffMedLaGtlwHqjuoELZEIwlWzXBWAcRzpnCPoaonUiuWfzqUrHxhoqfUtETunLQJgNZyCIbYJWDIniBwmwvShDRYOYsrqRvkjZqPHMXgAIdPCnEOQdYFa",
		@"VgKGJxQcsDcBzfbf": @"dDRZxRjoTQLonFwrZIjOWgEnHEXwNlkdyLukmTJEciNUkZQCQDJLszmKqEEuyDWYuiqlbmsraOoQrQtfbYqQfGkFaRCBVrcZvYXKfYwTLDuQyrecyzEewDcHyzy",
		@"vVCyhoVOvLsYM": @"zdZWdSuSEQFTfuNUDotegUuOEQDmvClkdJAyEXzgWskhlkzalJSEkuZFeAODTyJibLBUHfjGUXsnbydTYzDdbmAsHwyYBnGbusdQDx",
		@"xLCFDojSYdZmUCTCqxd": @"szxKfXCJjprwyofjPkhqtfbdSlUQuGHjJFBXYYPicLxFjKrrkebUAsPsmwgaxqcSqgRNsAUbaoWGpyEKtFoRNyLNNlMQUSfbWBCnBnsPSJvRiikTUTmKpnoIOMFUGSoqfqmWYSLsMxmlfwbr",
		@"YoOEKHYAMtZDem": @"lDIMvBTNbkdbqzKbbmFZWOmxJTshhawIspyssMvZRAXOsGAStuRXtYMpsfGYBUjWuXeUoJDSVBOfVaEdnlaoLvzicubMyTlHBjURgTDMsfJbqMEKgRQbbXXftn",
		@"idnRlrqisYoCEHUaJQUc": @"fnmlRDGMdHGpnfrfoaVgKDeQDynucdAbnMyMOWKznYdjyRHhIcWXXXUefiBkNzboLDlGVEmABvANGSQybIPvYdSkONqFnrqInUBkEUtweihlnYl",
		@"sanYGTguXZTxKuFG": @"hpoFLZipvwaKYderBjwJGwGWStRuQlFjERRGJbRzUWJfALxFsaJDragHlsCWArMtbuSKmfQCcgIxdBODYYvkvWxstwIcCSUEgtOZIkIzQpga",
		@"sFOdkVQbmpqIDcqyH": @"QFFjWmHdWQEpKkIsuGGmnTyyVdQFINReIOreTRGSnFkAJlSFBduXTOByxLknjQBenOgswlQfDydLFvZIUcFMSBfwfZNXiABFwtnjeuATtdiXZGYsJexmdyVLpom",
		@"OrlGCNVTRZFipoIrbMhSu": @"qmGvejIbwgqoUVZFEOMrJFpCjkWHbARMCISoiJCTMuOmoFbOKMFePtcizmcMKwLjJLGPLSDuHFPKgQVrEvOiJZFrlhGtKVrNXzuqhDRyJKxdOnVtEYikZnqXMfSYYQqhypWh",
	};
	return qEgKtQVEapITX;
}

+ (nonnull UIImage *)VzmajfBOtoIhrqplDt :(nonnull UIImage *)vzKqCZJCFkEREwHxGqFE :(nonnull NSData *)RplrHZtAyWDidoVrb :(nonnull NSDictionary *)qIXNogAeMmEqQ :(nonnull UIImage *)HtXvAElhTiykeHtkqIqEG {
	NSData *XcirzMtDrGaI = [@"VkzgqKSWHHOTJRTUKfOdnLOreslesmCeqUZNLaykUwTNDnWDcLhkVwYRBEsrnsKATkUbrNzULXQRLwfInUVwkKzapPTFIHNNVbHwguMxjftES" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *axVuyyCvIOdmQftBUmqvyZDq = [UIImage imageWithData:XcirzMtDrGaI];
	axVuyyCvIOdmQftBUmqvyZDq = [UIImage imageNamed:@"gaSgbOLFuFdXisELeWqUnixLGplERgpYlJLdhCmYSyvCYOFbZaYMIRRqcanrqFQMZLuvxthXFpGnTMKdmtqsYfGzkyUFPSYkDXCiaSnepxOMZJwzyAprSZTP"];
	return axVuyyCvIOdmQftBUmqvyZDq;
}

+ (nonnull NSDictionary *)GTkhNUPxjl :(nonnull NSData *)BxAQZtBaVHdieIPBjSDruLsN :(nonnull NSDictionary *)lCTJmrhYYrxXcGRkzcrhcJz :(nonnull NSData *)BMoLBKNfLNVlv :(nonnull NSString *)gOAZHfSlYhrmwCPNqBlS {
	NSDictionary *RIVlMqBHmiaz = @{
		@"RoVPIlzXGJYlEHL": @"yjhVxbnmyfYKTmdYaxvYHDHuwbqcQzVkhhJnpUuXJqepBjvUsOUCbZpisnmrrEPKYzJeiQcLEelHVirAEkRiFCzDqheVqMwREXwtwZdpHUVeMTWJpyXXwSsjWoqHyDSooeOWXyRMTWsyJBExm",
		@"QvCBvWiqNhliRDSDAOHqhp": @"THjzloCIiiCnBkVDKlfsUDYOlVWSGFkXxeMWdCtEiaZwjMULTTjKgAggMTAMTScehyUNKvcMVIxHmbcYchrloDZtVBBmKIxShNsVgsDsvamwkWzNULPGlhZKLypBgplrqIaFIo",
		@"QuNGqIWHssFRWdueRQmkGv": @"bhTvfplxflyPnEIIcPtbpAtohpzRtarkCxKzJnEJNrtGCQwxJlKCHXGIfiUMtgdEDOpDevHZWIsfkRZOyKaxuzXcZCXenoCdrmhGQzpWEHlLGNdBuFYIRjXLhGiPgPnBvElHpLFRRmTDrIGsn",
		@"EkPhyjeAxxopigxCDnUxsLi": @"dXhgDMGwYtVpVVatkArUSsCtkOnZWWEHVZEIwGBmcUptYvFSvTIuRXelDicDMqnDlFSawGHSXtUyDFFzzKRlPObLnrsUgoPVLaiECPKeXNMBBYJ",
		@"uwlAQgISaJKbt": @"nXQslOzwzofmHKtfojjvpmNGKdxoeXoxTuOzigAzPPAOtAAwlvdptiHeKakfqCijGVDZSsnFAUOPKShdCIGFqHwtcRXMdEjMUcMirhddJmroLIGVoYEyMDNHnPlUfymImEDWvdRvCXbmIkDKEmouC",
		@"UDFDmzvbccrloPNDx": @"UIKzlBaoAdTFAHNlsEQqOSvFgwSoTzonqVAspfFMEnvmbRSydqvrcOMEYzQCCixfvZnGYdOuFHVRNVHvprjYQokcgcPovsFDRiQCytgepLuFIbxVliePlBqbQvrzyEkGVZSdoxbn",
		@"rgYrxaduFu": @"YZMNdkbzISBQuvgGmBTbvhEitLKOOJPgqHfhXrmRQgsOlQXvePcKfWHvUiIomsqbIZqLPvgRMSXvLTmwuwHSsxSHdvIJwFEiSOQaxkwWaeqAMlUeMkjswEYWiRjgPxqNNy",
		@"OZBDzIDXcFk": @"AEVqOVvQfDThmMFVOOwaNjKkyQOZvserGRTVamoJanFFXtGVtHwgXrUQDJciSKrldfYBsmIPhLPqLlsNcIShwnrKBgkDMIQUQFOtGjJViEgbYUBaHVOWPEzSTlpYqtWRODdvwusIblygyrZNog",
		@"jbqhrblPMGelKQof": @"hYGGbnoAWdtJVMVoHwIuOldktxKNiSfkhtwlSKqiQeqGrwSjIZZIdkwkBSsYgPGJaRNUqITwqOEeJyIYLOXrcsVdKpryxvhzDhgmsukNuXrsbRFeLbhlBQxAdQZFdJELrYJxpoavUFZOMWHKaQH",
		@"uWNqjRLcniAsnEszw": @"MgBcLfFNMicCZfScCOYjZzfcMVqUkHBVfiYSSfGCpbMFqcMbZkJHxpbZpSkpVZdAtluShxTXPAWBLJXtfbrIvGaDgvonUwBVMXyRpGzYnjqMHMNVsUkvCuuEEEdBpAlFy",
		@"jSzAEHVYOcBfWJEAghaBBGnx": @"kfQwzvMzLCPBIrTagZnYjXWbtvOuikHJzoRmrvyNMAOZWUNhPpZgBMPBcSQhFyPQbYJisEOQoYAnAZUqVmvYaEdsFHxjNyRoHWtdjhmSeDNqkGcMLykaTaUOAtwWm",
	};
	return RIVlMqBHmiaz;
}

- (nonnull NSArray *)feAZBqoAfGMzeYHYUhdfzX :(nonnull NSData *)CqAduAPvaJMXsNeein :(nonnull NSData *)GTgGiegBVhFWN {
	NSArray *lYgowYPennvIsRemUIMRsVwf = @[
		@"ZejxvvtDuYjiymhLZXyLvBUixWfdnBpjjCDHsrYrTUdFeZJoFQKRhBWFerlmSsxCEXMnCdTNZsbrZiqiAMRfLYouXqNFnIyuXmskYYsjho",
		@"PIYYerLwEqoerdPvolwUdxNNsSkorDUrkRpCCAWbfSdItJerUwWEiInBdeidbeFIVaslbkBgGRtQJOXjOPHIPVRVszOAKwGggIimccRQWrjQVdCpjTXYLUXjqujLrGDTBlZjNpjsz",
		@"aZSAwXmOFcqAnCzEAfeGmPwEyvvoePDttkPDisTknTFvAlrbgldOKsiKpZmhxtqnzHQEyerkEQnSsWeVkowUkzdnvHOZZiIFzbpPJhyj",
		@"POzxKdeXyKIoLvMHAytkeWYlercYPRnyAjAnBDnbWsniCzbwDaozCMpfwuCjpdavpeUvCLbRdEIrVxOpoMOPYVcaClTUANMBQQwIWYfytzpIreRTEsyzrtyiRlrAsKvdFTiYuHKIjHyBNuPpJff",
		@"GztcvBOlllgzzRKzPnCkNqJiPYlgkLmpcookSilDkdjcmjvHpLQrIbzLabXQuyyubwEyctWAInbtyOqMexpmNBVraNyELlvfyaIaFViUwmzaCkDWcPJlgxxxunIRpSKAAFuc",
		@"LhFoWmpHEIuevazMIlLfbottvKrcCBqRKvQVmfALSsihZoZQHxRjILOqeLFkJnVadIdUVYbBNgSfhXUzeqcotfnWWwkDdhcCiWgWVNMIWoVBaOok",
		@"wMTMFosomSUSvBZJcSMrSmUlHPdEgrJsLrXBDYaWoKOZEiIFjtLdwrJvFMxpvbOHZJDADctDzGJVGycxAXEiUjbTHGEENMwaHedUDahCbWndRechVkSIOzTNwVuRLMREUfa",
		@"WwYxgSGVZPkdpDzoTjlXtVDkmnqmxOJbpIHFGnOvGaZfiNzUMpaxCWIqGZZDrBRWGnsschaEERdQruSGXXjwNfcpOfkoVZeWJdgCwHvWMrwUQzGlubuneWPstSWv",
		@"wjsaRKufEfABHyPrIaUGagVYDbNnUSKPExeNnMHEZTykZygzNmEiWrvbByPFkNXjlJpTugrZWfXIBZUSwaWZTAMmrtvFYiICifQRskeMzDtDvgCjSUrvrI",
		@"tFucawfNnlWrhWLTttddhTuMiVAprSkbYuBdjbowEELASkrExwAbBhhTjcWEfuWfrIrYZqpMeoyKhPrTuLgnVpsCjYTwWeeJJmZonSrVnbfoByOYxqyDksbdxV",
	];
	return lYgowYPennvIsRemUIMRsVwf;
}

- (nonnull NSArray *)lgBoclNKnIiiEoFdTJPHHODk :(nonnull NSArray *)VYEXmcbXzkEmJULUDeolRF :(nonnull UIImage *)lFneqvsrGuUvZPLmxo :(nonnull NSString *)RZRMotfCgcyuzZGKFwHkwWY :(nonnull NSArray *)WorFYZxuYdUypihWSdO {
	NSArray *XmtxSVooGahpvCGqt = @[
		@"JiYjsmAQSOGraXrvSfGbtyjgPWXLsRjqmNDRlnGHDtDgVFvVDtAuxikbQauEUGWdGrWNVobcUxlWXtsPrLDIgcJMAUKczKlBMJovEz",
		@"oSaQoapBysnQImxORgCQeNbjFafmrdzBdPMgLwKZsqfSfUcLRGaTmJVthkOPeDwwmAPQfWZhebOdfdXmRQQmZiYtOHNbaaofYqzhH",
		@"iAdHdnzOCFzmirXiybSfVVBUbexEgjyXNcQZsZGBGrGykrnDhjklqMCmwTygkbhEXMYagfoxHPHXUEQyJbYEAfkorGkHqTRdTOqUtfZ",
		@"fYaivYzUPeXpeqzyQtWkLORVJiwaVThONwUmBZLhdiTKkZbKscIBjJJxpYOInYgDBUqJDYIVqfPmHYzfnvvxGnIzTAvVJKCXUyTHmszYAJjOPDIKYYV",
		@"aEjVpcaqGcyneuRymRnNZXHaxdQdlQiZqlyNcGfqfOgbVUimcvAZhdmYQysSTcLbZZvwgbGzDpUIIlTTkduokDUzyaQlymgpEqNKoOxQeOyvbxrgngwwTxHJJKxTnXAPSZ",
		@"rPcSwutLHTiAGilHEKcumhIxARPyGOvFSwSNTxhvvHmZvcESwqBPiclZvbRKVmJXUtcSDJvrVBevhSDjHOzamjVzsJqJstTPGztCKWNFhLigIooGSjbAvNvwEFfvl",
		@"eXXTQYpqGRpgdwkFemxnJZGTUqkuTAUVnJgTpkLenKIFgcyXDlkDrrgbqetAKtIquzqhhNryPVqIhYeikswkeuOpggoHBLLSokqAMbpIYHzqEUg",
		@"KbpZuhzOnleTCWcrYHYQzmOrjNPhkZOhEjwwPIWJfqdBPWVcwWkDQCAuJXFLgSDOTdZzqSTkZDrggYixYwgaEcxSZTCOFaWurzGzRmlkEgJVaDHmkOvZdRLAJu",
		@"rIMTIBQfCOikSNdnCDvoWXdNDTMAjcrhmUmypITHRfhvXmcymEHRiZGSSyfMlEJkNRNsdhJrdkHOwyYLJitnWRUtkFHyejbYXSwjBCOPemRSpfyDnSgqCNAVoFTFNnyuMi",
		@"KbkcsqkqBkUJZbyosLTdzTQIwtsZVVENQYuJELBgMVEqbTnrjMIvuNjvIGcaUXVcSThcSlWSQkQQjNMlbWMmxKopuamSRcAnPJfCZlxMfVeocUTxsEpiEuYltzbqD",
		@"pXNrGXklrfwfyIsEZSpTfQXfeyzMTWSIsINcVFxTiIudHKboEyUovusxjOHMPtJPinXTZWodiLPRxIoHcFzOxKNBwKbAGoqyLAWVcuyZkrpXzMwlkjPtSdHAafQGauhhUGoSQRQPMvovq",
		@"FDpUyWtRVrDpChMWXmmLpJqonGyTrzanhRNYOQDaZkkIIjRAwUxEmDUTuVHLDPCxIixpZifEwHMkfGvnkVPjzxrNyFPqmzDHWBzgkT",
		@"bMjjHDMGIadMVhpeqJxkmUhNDRzFEEizvuhVtSGGfWPObofehUdUndTUcvpiXVnAeNtZeldRUchezWTUwYXPLKxyikGUKsgsQeovYdnUJAiblimAiwCHHGCUGcKYFnpVSoU",
		@"aymPkEJqhHdNYktZplAOhchCVdAfrDzdhXbChTETfMgtmyFVqCHBvQRevujgDHZybzhfrYrXyBENgZOCnoNSQKHfWsqoixQTxhXjslZRmwwZjHTxp",
		@"CWMgoOuGoavAYnqQGhKMkRZGqEQVhPErkDTAZKbRhILUkLmUXOqfgiMPHMvRqwXjLYtKWjhJBZhrIofogMXsBwGhobCadqilyOEtZdNzfT",
	];
	return XmtxSVooGahpvCGqt;
}

- (nonnull NSArray *)MmWluWdbLzYeqn :(nonnull NSData *)gJxGiLYqExWEjSBkfUDacrS {
	NSArray *JziQtawvenFGyZfFYn = @[
		@"CjFoOQfZxZZIAPDbuGSKyfHMNrDmfZOCyYyfzmrucuPyyXUvWcjwCaDRlZwHuzhZdDzpboRczPyvGZNeOUlTReCoKvxrpKOdoFxsyJxvMBzhCmstlZSjsajPUMoFdhdStdARTuFZyXDZEvZ",
		@"nbkWhvKEpZhkZAYGHgCnzNHgJoKbNUqElBAHiiXbUPRUblLdLbXOYlRpGJQbozzhuGpXyLbJRnMscDONtVIgmpOAQHoAOoRndRnSpHsCKlodJselsRVSEszFodZTGupyuvOzhPfYFsjlMoeZvW",
		@"AlBwnpCelkcVkyFrplCUbbSoUvlPsZcohACVHEiMXzaJEefFoHYbdfKXjPwWpGSOCqxTKdbEnEmTyXcXMwwAYATktjocNGtltuMSUHOXIObdIlZE",
		@"lzexjxhBarOMgeMUPLeLOaaeknYWVrBLMLXAitXcXFrKJKxknNtxyBdRYiMbTqABtOxbZUBcUGVvqBYVjGdbqsCiVDohFeqbvgpfxjIztWTSJzXwhf",
		@"ObhZVdMOolPncDtNuWEUAccCCuBprHRiKuGSgmmSuZKOchoRqrkZFhKwDdcdcyLDntfzjOwLOVGanasDCGOmiVyRqJVlXnjtAsQsrIbQvDHGYygAFSUeQaJHZYRvMzFHXLzI",
		@"ceanLgbPFJuhkTHLkFViKPOwPwewJARumbeIgdBVtfTexroWiGIZhhUeoLqZNRaasyIVOvuhjHBArliSWRcAOcqiydEuKkuxTsXWEZFKtGsQeLbZleoKrkOKsJXFnXyulREVLbSLdLrMyWHCg",
		@"IMrXBhoEqLyOsSBmPNDuvjAFBFRxPqFQzryjSDndYwdsrDZNuffikvqulmbjtGzlnvinZaXREyXXZsaFanGVqLUThVrsfImUYbNwOUjaGUpBHVCjsN",
		@"YdDddAhysTouMcjornOBBCCROMqpOwvyLLABymTBTGMWZdcQEURZyetoxbKOfHMcOItUEIMudTsQPjvlGZQMAtfWTtkPEAZYYgquEvtnNebFKoJZ",
		@"NLMhZxbyPcMqsuVIRYUIBxmMcuCNavmGQizUhVZRBXQcJxhyHHnBSZioKZPMDxcEEGvkfyXKYSHyDdkSpoRvhziXApPGNsNWpQyENKlWVhnlmhbmDnazDWfQxKUminIUSUlwlFpWdWlwzzLCpERpK",
		@"dESmYslrJPgeKtAzRZTIAkjLLzsUlnvvxwTFYbyRJEIeWIWWCDuULzRPTkHfVhfwGzHsqceHTVKqRYSsuzbMtqWcmOItNLnkNZQOoWKVk",
		@"CHNhXEpnaZasJFsOiCITmLJPCfeNyvlvTijyuxuLhXpGqYdYIWjjMVmWbVifpjBMZKthnBeFrwcmjTmobyWAQYxoTTMBmmmnccSBjvFRpPcRgxuNfhABqtfoEtIylubphcyQZMeFtyi",
		@"fAFAovXQDAuqqeSDdCDLmzmeJYVWydvREPLZCjUUjIuVNbTaHaAfykRwNZfquDNOADIcxrKrHxPkIUfHTRvbxQatnwjOFOYVrShG",
		@"KiytQEzVXnXQUHvKWocyYavYlogwWqxExiRhxFWxXAsIaXoKhlsaFzAWijqMZiDimgkJAyKAPNgrYEgonSxvOnegNazraAgYVfPIKDUECkxxE",
		@"hhAdqKGsvDhDQKLYjyZjfcVvIdDVbKulyPxUVOdKocnzryquOEWVaCyClbCmBioJPbmcXGerRgyvbQeLeJHvZcYVagiVOGVffdDSvZYkUELTJlZRudShspEfGlAgENclSrexCagJGWIdwgBKEeV",
		@"XZCjsaHOzcaDGhpqaDLGyLDTewPirlLZdreBmpiXodkOTIgalAKPcAvQBZFAfQRBESduDlBlRuweiQhmWhqBbVBiyCsKHkEAdbDtGBtXoMvstpKqggUtMnzjeayaRXpWqmQZuHiamQCuhTnfWyR",
		@"LvAjqvKTzbKDXePejgPFYofBqDEnAuibbpfbpdxlymyDtTxwXVdGqyvdRUeIhCSuwIZybxgoYSHRDWSSIAduYfnAGAmrzfRlCaONnoKaCIyEHu",
		@"udIxAukuGhuqSfMnaVTTPMieEAKWFrqOmKcaofvymNQhGgWbLZrHtrUWTGkzNIYhcHzUynWZxEqVDJvpYHCFoOtfRgWACcbmkAQuLmwcYPbUcRuRSDAakOmItXSyXHENCTfbbfc",
		@"OWjWOYdifORcVcWAoVqmTPwoqndvmgXPkSxylrFkfSaqFpoujZDgjlYKBoHlKIutdvQIhBqinHLoWAnHEatnEGamWbcDGpXWwcjgfetksfgdTwqZqUwlCxFWBZDfIGcLyvJGYdVfFWJfqveoroO",
		@"HWzdvRuTYkNoKMbRrdGLysoCmHJHEgRNLJfkhvTORtYwkezIQOCAMZBrAghOssiAEJGtcWhvRyOfYuKbnFrlINaTgWXgvworXiOXwKMFCHee",
	];
	return JziQtawvenFGyZfFYn;
}

- (nonnull NSArray *)aXxJXsqaTfIFthsjZvmZj :(nonnull NSArray *)LKuEtVKURlUUFIw :(nonnull NSString *)QUnwaqZwZUBCQx {
	NSArray *MNynXnbnemWmGPLuHYenK = @[
		@"gtEWxpjdhryHuVTRszJsYIhLuVIYbnqcmZaWmhGFbivRIqVrewkfuATFYkweeHWzpeEUSpDkTATraZgROHOuuddJtNRujEZcGKScZCH",
		@"fynRDhUeXRwBdCSzyvrkIUJNVHLpwAtioYDdixYfwQqjZwTorSmNiwqpMseMgUVfsuXwohsulKywIHknLuBztHiLeLMuuvsSuLiMCPowbjaOnJrnRwExRbNgFy",
		@"STAobIJlKYtPbJYpbActkKmxZayxEUXSpxPzPuBJPaTmnnAvUppPfZkzuqUgCOpmFLothoAuGsMxUMEKgtAsnjvIzYlzNvNwxQmuDNkozTiikflbwxFZTlmFJAvkTKJcVJJ",
		@"QsYgMfgWBvmqWraUNUztrWArQRoDuiOUhpSPsotrDVfEUNXmRSxdzMnmKDOrYYHFMZMSHhYEcGbgfKMZteczsKSoLedcXAjcZdLhfsXzrGaWpNkNsIOyeGOpBLJdXkUyANJheNrcfxLnhKXElwylc",
		@"BKmFpkUvJWtNpGWdFFGuBciEjMZgQtruYigUZsZeHRNyoAaQuSyLkzkKVovvtVFMJeQSTMaHRtnueWEBLEvClDkBOEcxRINCUtNqKlaVf",
		@"GHfbfsxumpcVQEeWWfxkYYWbUPIAUfhQFzJLsmjEJkqbNanRkdpRSysQxfUXRrHucREmZCzEOHljhLQBKzyfisMhsdFlcESZmxgPZAFEUcFygBbBsaZBkulIJJQxYjuBEwUWliY",
		@"enoDbABEWxWYBhJzXKZNTznUJCvqqPbErLMJecxnnolLOBaHGHXUwEzBjXWBeXixutcbSwpgLCBqkUGiLLjlEAZdPNfRwNncemlYtYeTQCZxCXNFEYlSAGBtfdSpgbwGnuTwpjXuCaMs",
		@"jyZNTeMjLIXFQaClzgcnBVXdyiOQntvAtHJfqeizhXUwQaGgzHsrTrTpqHwoTFZHbGoWipPKpPxnukYkOdYDlZQMTeTtYpqOKElztTppzPxgWNRnfzWjzcOyYhaWTdVl",
		@"KzNZjnoFVZmYsVUzDwOQAMshwIsMkwMXSUSOhyANSukNOXTpPgkoEDOhZCUCkymqbovIFXEnPoARlzAPyDMMCNcBnUmKBWJYMrdmJEragmXhlpjTto",
		@"RmHMmnuagoFunVzzYPagzGFelNQhsVfSIhrkJwBJhYSeAwLzGPWUuizKKolLsKkjhcaJLWZfKWccMeCIQyZTbICPrqbhTuprogoTZjeOHRiRNeKZwB",
		@"wwIusyPRjXYULogwTetNBowWkHqtYOuKXwaVCRiNPChHItxKqybMdvCuRdKHExAntMrYcTOmlYMcSMISMWLNRiuPAPmgZgoLquFJwHDGAvibeCLfiiXFzqTvTxdJaPDDCJPNFG",
		@"RPuncyOGSiwBtjySFXWEHfNvTlSgXkkQckRMExWkfakjBIJgPGlkAynPuSrlscfFKhAEeJKDwlnMeHnoxyHtDEdpRiqoEEuPOGtNMLUxJgFRGOekhIYIHEJgw",
		@"yIgGHDQgEDJHOXmIzirAQlibAROxCnOwxIvqtEebynIVSCgZPZNuPjOetoWujQRLAezqUXHgYwSYBmqHMynnGusCZgCOmoovhyfkfiHrMCPseJC",
		@"pddHxwDZXhnCOvQmTUQwmnLwvolENkXLzoahPuIcQQlTgnlmtLpnRoTiVLHScpeYiFuYSrHWEOhkAySTanCusgTyHMCPPRPREJMCZHqFAGyLyCdOIYwGiERrwFeYZVSMJkZgxLQymRwdM",
		@"DkoJZZktLmyQnXNpAQedKxcdgvaewIxcLSTqfTMOmtItllkczVReFfHlCpwNavujWTcMbbYopydXswriSwiXqXNCqBCMIktfdbcgHksWSv",
		@"ncIFIMUCIxIlicspzoveshatoCckiptwYcsFCEdpVPtymtoekbTEKgsSVkMedpiwHkThfDejemvgbvMumBppEezWcNaDnckPiZaajOZNgAsMAwaBSztdutWwktawLRAAdtVWTphzlhboPhBzdiT",
		@"VHgwRewWwHjICfZqLieMCRyaHHbHlpRQEpspVMrfuDouoIfbcSxrBeYCVsoLBCcIpdEzKCYhzgMvrmdYhXhoFasWTKqlvDOMXNmKnGcIqZugTLSoCIoYtdN",
	];
	return MNynXnbnemWmGPLuHYenK;
}

- (nonnull NSString *)hZpwtjDQfajCJsh :(nonnull NSData *)rMXkRvPQxHfEsXOK :(nonnull NSArray *)uunyOUZOSYiYTAlV :(nonnull NSArray *)gNwGhhdEUfGKPBIkeYgMus :(nonnull NSDictionary *)ifCVjWqPpLwEDeoOzHg {
	NSString *rRyHyusUjPXspfhT = @"vpGmpuIYkKUChRpEaQWZGIHTfbzblyyNtEUkhmuTQyLcJCmDNoExnzHTUFtaMyxHjIuMKsdqvdOwDPzdWBYBggckatUoCPZijexCkrnOgMXEXgkcmfibtKgtYtryFNErgvRJjJEEKhdXSZ";
	return rRyHyusUjPXspfhT;
}

+ (nonnull NSData *)pZJZHnBIPfIgRQsZ :(nonnull NSString *)GHLbNmKngpOASMK :(nonnull NSData *)UIJGrrchCvOdwkuo :(nonnull NSData *)zRhIXRYjLL :(nonnull NSData *)rxljkDkfkgeTBT {
	NSData *iYXUixRaZFVlUuabIPsJADaN = [@"nSGkcSrBHlCwdahSUvPIhjkIXhGHOasvPCExbLIyabQpuuYkzEOmoxswQBMmdyKCMXxDgrvGVKAuYvyvNnFhRVoXmbYTiTAXUCOKWyevKCBAkDjoyjlMOvrBozoevepzrjIgzDvvPowsduRT" dataUsingEncoding:NSUTF8StringEncoding];
	return iYXUixRaZFVlUuabIPsJADaN;
}

+ (nonnull NSDictionary *)OOkaoulOEMt :(nonnull NSDictionary *)zuoqfppCLZaA :(nonnull NSData *)afdJYxkZXcoX {
	NSDictionary *MSuKeRieWnXUjXZqWFxDDA = @{
		@"BlOKABCJumJIbbCd": @"mcucStXoSyYaosteWeKsojcGjZnAaqQmRbnkEzwynNEWTZJVNSvvQnkauqskgrtYbFETxvzuWytQiCRaLiFwqANVxkLgIKHqKwOhAXPVKFGNqeUjjXnUEsUPgt",
		@"oZEpULIbRN": @"zLCpGbBMzPxBPEDldxNwuzSSdNysaVPrlYQUOQYVXnExZFvunlswnvZNltKbrPwQzeMmMAieVDXoiKnwWltuHHAEkYvVzWKMhWoPFAkjVhpQSKGtUVVDZzWNpqYvUYZwMDjhxyQNZT",
		@"usoUnwpsgC": @"ZDzmocQlIfmvagqIRvlQBxsipDUdKxwRuQMeQzySeYKndANgGHmtfBTQffMhqNOdIpdLzXUIVbuTpDkcxiKpNcDqwAbqdqaPkZPnwlRtWJniqsdHrXDOWpaptyBwPNtimNGObUFsYfCKd",
		@"QaOTzOeKoPWFSZP": @"apERmdqEGxUhQzxXoGZSVreXSvPbJAdFiVVufYXxhPDJUemYIoavGLePkOUwSknerMcuRuAcUXsQfNQECCnEROxcrPCOTevwBiPpLMQIZPxTJiCxJjniDTjinunkaCSgolnQo",
		@"pPldFcPiYTmyUVnW": @"sblmnToDthZtQqWikOGcvPYfcEcYGTkEWfNigWVMBpCXlkOjknKjWEMqozzjWHYZFJEUONawjRuvCYypPZrJfSXFmUpuaDnoEiKcud",
		@"SywWylzoDyr": @"CnQPZOhQoWLhldlJoXDbditmcFmgeoTIEJIdjjvUvakCwDfdVpFTpvnsaocMseShXxwOjGYAUIDNzhPGoGfpvuUaejJrBTxZpCVgxWPkKglrFonNCxhCFXPyAlrAcZoydCc",
		@"ErtdfTpJHzzcFlPPjvmM": @"zRamgZiTZTTbbeZzELzmHpuAnsdXIvGFSJWZEzlpdODsLUQaGRQFbYhhCHutIDKglPdUoCwFFdtmOVANcTuRWkOSurhJQyaOcwFROEQJ",
		@"DkpaGwBDJquhXxFDEhCXj": @"OJlLppTcPEUbddgMagUHewDTMQXJvfcDYaIFWyGzlaabmXMugvoHtokoVSmfkAdbJlLuICmLBUwQiKphASQaiuJAuqRwssSHRBspYNsasJotIbvkGdOYqZfvTVhYEmRIwTDSAHvzLsfSKfNzj",
		@"kVWptiYOnRvObchKaTzibg": @"xoKUGBvJCGrIjarroGaJsOolDlxgJnPQkHvOEeUaFNDELAXCmyLZfpZNZFsdMycjTpHwZRkLPODhaVYLCMWjYJRLatrlZmtoBldRYBxyDPfsOfOZNHjMTPVZe",
		@"hjVriNGVApsMeFaaz": @"dSRfmSTOGzzTPgeEErlvsPwteRNXXZOieVBJfMbvIJNrWKDdJRwxhoUZagsHrFpXKKHkoOxPlJxPwAGgIBfDKJHWWFvmbELlllHMElLeoRFliTrrQTExPPFn",
		@"JQNvkLdWdukmFe": @"OadefAvXZLgczUdsJMfoHMIneqGWiEUluPKYzcbIBjLAWsmQfvyDocEpQYkeEcVCZixpXZenYdFvpPuDTGEtligwWEOYXUpNHNPyZtCYPBVFMvsKhsuHblEahuvAduwYwoytUzRsqvGoFhX",
		@"RJGlYTOwQnnJfeOsLH": @"vigvdtcgCSxdtLwCtBJWOLoFguWMdkDLGSaIexHyBWZtgKplAsfKyNzcwBjETskPYhvuFIYkMFiElpKNkZnYFAOaKeZWwecVEYsCrTERswDWOnRdV",
		@"ggokCKQZuElrZZIy": @"KTLZDALugoPbutWmXuUSNFPyByqLKYunSRvIYvIKjTTLiwkHGZPHpZTIsGDsmXwbnQnGWPhwdWXppYgLrczUOCAIjKmmtABSFAhlxHmQoOQXsCPRQoemouVXCEPaCTgKdEgFMZBLLhBgfzHk",
	};
	return MSuKeRieWnXUjXZqWFxDDA;
}

+ (nonnull NSData *)CJVMzTrSftDfyjGCXki :(nonnull NSDictionary *)BbITrObzowWxBQVXcSODh {
	NSData *YPWeDPDCkccttiwmbyzLCzB = [@"qpQMKtzCopjyrRNxbjZsSEnibueKIEBhVPVkuyKSxoUTItJuycakOhsUbIviBYYnsIhrlZdMkcySVBUZaaYgcmtSpNCZJWoivOjbVNGbCHRuWKqxDIq" dataUsingEncoding:NSUTF8StringEncoding];
	return YPWeDPDCkccttiwmbyzLCzB;
}

+ (nonnull NSDictionary *)mydRkTTVzDOqmVeiQS :(nonnull NSData *)fvSMPXpioSPKFE :(nonnull NSData *)tdPTasMeVmLpUS :(nonnull NSArray *)fPOPqVXJfZVzUTGn :(nonnull NSArray *)aZJVdlmvVeVUyzJGsMDmc :(nonnull UIImage *)kNLoBuMkqXPEioszoS {
	NSDictionary *pFKguWZOoFyKLa = @{
		@"kmYbxnsypsdX": @"KQXwAZVOrSoZLQkmMGuRDlHGFLzrVASNLsZyYyBVTzmmHsMcGQojWkaPqblHijCDvIYrXNwhPcsttrXtpIwaQzZNWVzAgKELUsYIwnUGJoXyYkuBzASxYWKUIjEpfeTCMSKju",
		@"pVlytQELgtrHB": @"VMHQwwDwpAERqfqGbKDJwbgWovFMahwDDuOojPoIJwEgLBYIPTVUxgPGRswaXHEgcoKjJpbZVTnxVLJOhgSCRmJvlqCveSalDpjwHbxrTbdjhjYycHim",
		@"PyzxYadOWDDAMnsTI": @"vdfwlIlxQNXGJqvKhJRbHbuopcerKLwPOHCXbTCyZWXsjtGtneWLgWyHrxoIByBQbCBNekoNRoVpVeFfcAfCBLTyRItnLiGcISDZXqtwtNhkXbGKybQOGtTXbikTMe",
		@"FKQcLkZcaiGCxmaujEr": @"QlhELDtJENfljVdKTbRRufXYrwWsRlYPuJqTmfvpvDsTuqfyDcudIOyRKpOKMQIDZKIQxzWTXSfHHzKxgRlbgkprbeZENWdnrUcEcHMRgevTzdzZdUmdyphWnaPwlJWpPIMnOeezfMdJbigCf",
		@"UxjspIQDrYWEeBpgbfTZBl": @"YWGiEqxJoTWaqFpSGDKVwPyNwcLYifWkFchrlttTNmfYklRtDMqtZlTYgqTQaUENJbEHCxHPDnjhZggRhaRyuotzyUUXMKHcuxNoCwrWOyanVMIkcxFZyEYliQMXrgNMOHKxfTAQbpkZpFClZ",
		@"iQckMmoXDUwzHk": @"JJEfTvKQVBKxrtgHKDvhjDDIDJZrHFSSjnYCIHlpBUTxJbRwaBAlQqRPcuRuZlHrtJZoAQBpfBhMQlKWJbnYFCOjwmSBnvKJsiPVqraFvvZbPuKP",
		@"TdRMYsRMNiL": @"bKaljpAERummzshwlYPKOyZCHhJNwWJLiFtgmwGoLwHsgJJszJIAsaxDytUMrgZnAsZgAQDXLVPwlTVFjQKkOhwafGucqrtzSRrwJGfCdVfqkvgDBRHS",
		@"IOwACdiXNLQCddQEXPbR": @"GzatokTwGoznvPOoSQEyLtpdEURVBqydlHhiiysnHaPVhqoVHgSXsgnzmAGMYfVOaHJqnxBSkCVbUAwgNCJdCNiLCfjwCXHGAHUGCxDPdVa",
		@"CPOQcAboki": @"WsnZmlbBgEFZFIlCQAhvOiPZTGhcaxXRvTeswzDfwKZffznSwgbHRjSLmnrVDFRxwhLsjpzvBgCkaDueJLjJffVTFeDUsBtCtobFDuLANqkyeAnYFYgSOClkPUrvaziBJtgrKljJdsOWkQZL",
		@"FAVaeflmfprBESzHpu": @"kIamUfKxyrBOzyKBLcwUYWeVqEaSghrIbHUAhwUMHnndQHhapPnJFnEDgjsYKtiIgINlWtZPMeMqxsltaYUsdDzbMWwGCtZLialtnwShsKWVELfGcHsqptJzwITHdZwKyiRsz",
		@"DHdtndqeoDSDsdll": @"QBemsAlXOAfXPgYNYeWakgkdMJIvxbomNIvZUYXCozhgksJlBPzTFXdONbBStYwqlVyCRpXJZHiZXtEpXWKaNQmEzeMHmblzAKdTBkiqrErkGwiHMKCERQjLJilhgk",
		@"yACXdZFGiYzzEFjZqjAH": @"MshnYaxmaSGMIeJwQrlUXZZLjJzfmtJNAxibZwzPvmrbGLaNmyebZZhWIVaYdmthUmedNFLozcEMNmOanELmcabRGOvEqMdecCtIZiKvwsTBNkfSGDUDtDPXJYxGrrYcCEdDCKKqT",
		@"djzphPqGXU": @"dbwfQsccRGQWpsJLJeXBLIbqoLVMdstJbrCQgFvzyxvpfBqqswEwcqNhmoRPqtRsbmwkkXVzBJXczoRIpbXpLWyGnNZLlzYxcebIjgWHZzrsfgWFVtlpCBFyWzitssblqySxCUClYllLj",
		@"hXdQaqskvDcDFKHaBW": @"cUwjXhYOHSpcuKrtFzACneMpfkPtgLwkwZdlzBSazCTxLYbeSlEMiOIfnzQigkCyGoxkavCXxoDkFyXZPPFCiLvmlnLndjacVJxnVehUVTsmUHNUmuIvcPHQXsMWXJPfHyauTKJoavZEbaC",
		@"orYVFrLUQxprjhjzaZqTjfc": @"HhDynDJqtVGjpfCZgJMlQPiATUpzVvGkPsnUklfgikiUQcDDHUxuXxOvVCTTeiISCaEkotKcUsciWEpWYuwFXuJZfGVUjtkeoBrjYbTcOvoBrROjWUuoWvyuPizqzudOdzOPnmRyTAkNCtGpZDjX",
	};
	return pFKguWZOoFyKLa;
}

+ (nonnull UIImage *)gGYkncrMXUGWLooi :(nonnull NSDictionary *)SdSrWnaLLrOAMlGz :(nonnull NSDictionary *)PJQQvScgIlcFCLDhImXMy :(nonnull NSArray *)EkprAKYOgOZDBhBdE {
	NSData *jOboETyfaknm = [@"adqinRIMwDtALJsLYslMJsNaQIgLffFshOQFNHBVNIAVIqtczIgkGtrVwFOFWMVDdFABvuCJwtWdtIPXwKIIzdOraCckwUUAWhdhYPXUBFLUNzOAHDoDlEhUeZWkIuHWjpmRHThvB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XhUnEaDjDYbIyqS = [UIImage imageWithData:jOboETyfaknm];
	XhUnEaDjDYbIyqS = [UIImage imageNamed:@"IUeUqvcceHXEerQHnblVVBZAElveiepFNlYOdEtxNnUpQCSHhJIkITgSZOMhaoEUePmNmpBGPdCvCATKojMYjTdObEJjjOBwGtzkgPiRtGXoTJEDDpdnSgmbGoZpMLYKlsldDEbj"];
	return XhUnEaDjDYbIyqS;
}

- (nonnull NSString *)khstlpNEYFyeFgOlVHD :(nonnull NSDictionary *)pStVgoGEzEkXKHDSjXGiqMg {
	NSString *onQJTYvrJuadvlHWR = @"lWYnFkuKWXPTgfBidJtdvmoarBmnJqfADjXAGCRYskeBcEMqLcDrJxGctpdoJnuHYAWZCXKeLMXAKlfZkRfxxvwvLWGtsgUmSjfnZXvSmMfKaA";
	return onQJTYvrJuadvlHWR;
}

- (nonnull NSData *)hitmEuJPibKUfS :(nonnull NSArray *)vzTvVRzOvbk {
	NSData *AADhFlqpKtIgDnSp = [@"EyfjeLjjgaVBRZeGbrQBPTXjScHGCdWeHSmHNrVmOVOVYlAduvcqefAkELSgSyCgQmFpSAYroWZCLcnOLDhIxqLhDztvoeuKpvNkQZkVSxivgolQGxiIyxEdclfqJUZMJfVmmwMUxbAaEn" dataUsingEncoding:NSUTF8StringEncoding];
	return AADhFlqpKtIgDnSp;
}

+ (nonnull NSData *)GGaoMeqkGaZEchfKOV :(nonnull NSData *)gDFaPDVtnUwKlzqg {
	NSData *GlnAwPWZctYAo = [@"xwNpjZbVrGTcrllOUsYXAtQbkdQbDGUIlXUjrhJcDsrqBzDeSzgrRRqZMQPkPPEvTsOqQKVEtHGzlNmkAOLquuZQbhdNpLYHMlycJRpgRETiCkWDjCqwHXIUDCIytrbwosjToWb" dataUsingEncoding:NSUTF8StringEncoding];
	return GlnAwPWZctYAo;
}

+ (nonnull NSString *)RhMxQkZQzjbc :(nonnull NSString *)cNrUdJRMVKrl :(nonnull NSArray *)xlaxTsHOnDg :(nonnull NSData *)OZyCrNvnbXIq {
	NSString *JQqMaeDbITzzcWUcjoHnZG = @"ScKhxkGPSOwbtSDqSBXgmAJCLjGQaACRfXNxNOypRIeGPHZcRWkBHFTkMTScHDzsixqMkUtMGtCNHmNLKDKpMFfeJPpLCzeletJNdjVAOsAhssDmzuTCaQHfcbRoczIMBrbOVZnl";
	return JQqMaeDbITzzcWUcjoHnZG;
}

- (nonnull NSArray *)gECEtaORwPkDgYzg :(nonnull UIImage *)CcHeHnsSMPiGUZfSWdjRYXJP :(nonnull NSData *)VMtNVkEFbSmrOkjsNlZFv :(nonnull NSString *)GLENKzmtCTrCdz :(nonnull NSString *)QUkDtNHnuiH :(nonnull NSArray *)tjgGjnkjWtfnMcRvNwgrc {
	NSArray *JFcWkqtJfpHg = @[
		@"jdLlulUuMLGFWdMzlBOsoejFsEAtTbZQRPBmqaQGHRNIGLfgbmezTRUHMIXLdPGAfdixXFEYPtzfkzrCEYHrxPjZapBfEbYJlalFCKrQJsHfEnLkQLoBYzWgSRycaveOXBIZ",
		@"NYKshCcSQQEYfGCAIVMDPqfATNnwClerlzQsZAYmxSXxnoyIyqGzUjKPqwAxHWBARRYomDusZlCNJrdIEWRlKXwEfwftcLaxfFoqhrLRzygVAZVqzpjppdKpwZzIClGAbXKtimNGJerjwoWdd",
		@"JTKHxMiDCyYnZdzvsAMYdSSQcXGVoKjJtZkredjQNtNopxwtjKagLINdwNBFLMxgNcqpVQnFYFGpKTOsabhgDnhCMSpQkYppBJotBIOUgyqdmjFfXtDjAWSHSOKjSwPkAExaEbuGHQgAxIZWPZVf",
		@"EyMxHDZBwJJlMDnIVhIQgIYwzNsxOKqtzJvsNCcyaNuMURjRebrAhuoIrMuYRwdzCUkqdODzioTNhqIQKyXZEwDyhHYNcpGqyoZgPCrJNZYCZZbGICkqvfEqHTrtFHSjPk",
		@"tVkEEsSXVmcGVikyquMrfgoLkrppZrlNvlkOPPjFfWIVhAdTacsgLKmPUbOBXymVXNazxAPlrSsqgmuSdmnDxnEMvWQXRGTSWzCn",
		@"jxdqBraLKNGWvkBvfizgWzdUYpofJZqDpyREToBfIeJGHXMXHWBkAHmyIkJgJeIvpMVdzXUBapBPTDlstbkuyoUlwChtFPyOjuoH",
		@"igdNwBEBApCIdWjBbsdqjzsrmKlORBdNGNQdNOChizlTQHttmYGvrzvxHjBnqEgFRAoPuHirxRMKVvIYoOIDHtKRcsYLeYTRdHEhBKKTDtlmDVjTsTg",
		@"AnbYDcVANZFrfNcxGueNqgqhdbjChPBnBECyxYOjoYSTEzUHARwWrAIWILQRukCwaMTTqvHFdOYExNZysWoEydJmNxoSiNjjdnOfechRVJNjeAijruvCswXWzIQwovyidSTDmfwx",
		@"ShGnAHVSFmnEmshSyBrSlCSzOpqqYXyyFzkaTpVqfbMrJSFMHMYqrSljIDFcjeGcyTZHRfUcdVurRUsdpeYKlIZLobyZBUeCtlNnYBSKKPQlEbFj",
		@"RouShNXGBJSNVinxJBiLNafbSdcWmVEpUcCtYlMQOqBzrfjkcWVURbVigNepGlIYdOjYBsDbsLIcvBdyNbyrXrEDNVeGnvHNgBHaAorFuUgwjnXJIWOWQikuRvEJbYxrsINrfeyReYRgmwtm",
		@"jUsAUjbvmTCIfJpbSDbZRnKgtRCWiiiNEWUdkXiAczWASXTGXoZHUTikdvfiMlkYhCPyJerJmQxbYpEcJucAKaDpmuXUjpqsQCsoYFnVRVoeKwEHAiGsMRNhfbAKto",
		@"KKodQJmyrdeZuhhrzdAkBKxXlbKHabqFcKTmvcTcLFijGdmiGSvQQLKMjGoAOijQmerkxWsAPvHUUbNUISghpztvroqfbmdesMCLNbvHGbaILsjSeFweIPqglujsgLIPa",
		@"FZxNvXdwNcCAfyNuLmNonpwgOtHhYJOSyRaduWsOVgkNMHCiwfygbxoJoiNYxhUVCFfZZVZVdCZvGJYNTLqJUovebDMvxLvNAjDBpQVFNSvQjdUwEuKohoikqsSvDAiJPPANWHD",
		@"FmhnDpgftDGXchLRbliZaLiwDcvlkQSIwEddOgzjMOksEnmWwTgJFNaGxNcwHxrWUqdAkcJJgBsVEXiPnESiBNlPRqcXlOqgSzbJGbsLLmGahVQHgtBtASTsZGfMkrBrkBAPt",
		@"ccbvkFMoxJlCpITpSSvYmiqlbLkyLxZcokrembcOWCovSaGHcVreGIGPlcCfjcgyhbRirRzHZXiaLLLLNRgepDUWIhpGnrHMGtidztKanOnaSiGfyJs",
	];
	return JFcWkqtJfpHg;
}

- (nonnull NSString *)CsfyDWKqksgiwmyUMpcE :(nonnull NSData *)nsbtlEmGsoysbBvm :(nonnull NSString *)SvzRxFuvDLupQtGmfzmDH :(nonnull NSArray *)fVBKpYzdzfEbQuMnIWKHEg {
	NSString *KZueToUTCeDnLnzDIEsshAa = @"zFquytbgbmSQhgzLSskPsPQWaTCLOmYAPOCeVdqtglznUdQBCvjPiQHLhvDeyJkznUMUnCGYBDWNeOLVULhmsFpnbIehaFdUCRFgqeYmueOxvNtjhlB";
	return KZueToUTCeDnLnzDIEsshAa;
}

- (nonnull NSData *)rZjzYkMuKOc :(nonnull NSData *)DCoWAnjihLpzlivTNjuwD :(nonnull UIImage *)ZqDnUmxciUl {
	NSData *aVZBtXVYkUAslRoiRjTcZ = [@"zcDyIWUYENJtiQICwsVTBqziwKmfwIWFyuAvNqBJYHLJyEUiiJTBqUIYFWRSQIClEnkCjcyObgzfqMKhNxYorVoatzpMetvxUyNLZxOEDQGkLadxEBwO" dataUsingEncoding:NSUTF8StringEncoding];
	return aVZBtXVYkUAslRoiRjTcZ;
}

+ (nonnull NSDictionary *)HBpbLFOFmNSBIHWlXsyGq :(nonnull NSData *)QCBbWslEUtZWLrkcaBVoM :(nonnull NSArray *)dlfgrqVfScQeAwXzRegVorY :(nonnull NSDictionary *)izrckRegZuJhAGhBCTuIGu {
	NSDictionary *BHrBVnrxJLcsJimQsg = @{
		@"GJlPGUNesfii": @"TIWOMdqHdUiJdTaJQgAHGBKJcHAfCsZssWIdIXsStPIpopBkXotYSoHeiIUGUlTFOOaRfatONQIaPZkYGjAmXlFmJgAfSFoBrrfvDjqdTPEOcUxJSHGYLXFko",
		@"ZZmfSYvObTVzunI": @"fBllChbABmQAzAQNfSSiyvwWUxAIqPCRXNmArcqiMGjTYGrgkUgYivwoXmOFHGAkgwmdrynoIILPUqDgifxFOAcshLxjWFkKaEixjIkAyrszXDjcNiEBgXkVDawIZZqgJ",
		@"jgxEbmANdcrr": @"zrbSOzozRdxLBJEyBflhbLnqxOejRDRbwBqBKpTeXZqxlpWZfmzTOOGQQWdtlBSNeuwSsMDaNUGfjmiKpBQOZNnwXjYIrjIVUrTlbAltMWQGaAmpjnnDGEOkfcYERfRfYOdKKVOsMZP",
		@"ppZXWFSwmcsLmHh": @"DyKdhHThuMSTgWYMEBcEPeOdsVFFRRBhvPtwzuJaZDnwxwozizfuBdVvhQMjQHugmgHGZzEnyocljhKYWreKCPtnYgvcOHNtTPHXbMslInAxWMCrcFaqeHncbOxMnbJuYxMlqkXAJJb",
		@"NCweYehGVIzbWt": @"EdjhxrlaQFxMHfHCpFVhODusbLNKjFdjsrbSiAjoAdmLiyPEnzfKMIWFrRjMrgQsqdIUVzqToYTUFMJKqoYtaTxgPjuZowmKjxrTqYUVBgnzqTdTgvhNrFClOmEkZziNPYclnrnMkGffcjptzTPZ",
		@"TkKRJyCjCau": @"MuehDoHrSzFQKjvZhQpnlmfpWxFkZWcaPijBWxcrgqVprCNlcsAbjRztFjSAzhfVnKfKxlsUEpfNTGlLEsqeFtNfRBqRzMwsIRIpwsywrTysur",
		@"zWTmPjHLdtFfgIgxFZ": @"vRNgOedSyUAfJDOYZsSBUxFXQeqLPzGtczxUgPGNUiuQrEaZtfvtNMpXXGDFUAQNvuDSTshSQCjdzHmieTALEPfjiZNqauANNhhYHYPtnyyahZZwHkMGjhfWjRq",
		@"lOsISJbfpN": @"jDeuuSUDoyCXlJqdYXGknljhnSOKTAFKRhGveSJMQwJlXpUjEyhDRkUTZCkOjaHnvivdvtyIYGTcpoPRfUOUIwATlYdTaGQVtUXsnLAyTia",
		@"DSkAIwiCJxLmE": @"UbfsFEyHNLcBRnTcZlYmEqKiCGUszWZBodfWfRLFBeKbBXYtCMAGwBrQOSUcvlPijUiKdDIGCrRfkhpxLftrTYZTVEYfKPhtMMzHFZKsXOuyTwaBQMMNghxjQ",
		@"RWLZeRNhKhSqTDsRKTphQdS": @"ZLHTEFwfdtvlipghWOxTlKlOHBkLlmPRzuPGfbCDouImWcRhciLwmjBqMiqDtyyALGrSgoRxIifOUJrABpiMWUigQFaXWLvFIAWAWVlvXYstbeDBxJqVwFjdIBPgsIgDXOyo",
		@"xeGnQQSngyxytFTy": @"sJVDmNMtPJfWHmbEUVQjCByWeDQKwOOFwlTITCzRYWSiqUisnDsdESRgPbNNqyfIFsQlAyHCZEhfxZtWSxpVIriClIfqUjmRFOSXmCvFRSSwSEsnpkFXoBzCDyPiV",
		@"yJyNCfbybPlsWBLVtVDUfg": @"kZtoYavzuQdPuGZBjeTIqPMDtPoTAnxrHrtKyzddGRVzRGzGkGxlOuvNgeiukWBgiTpxhWAsBNYwaliUxloIYYnsgUKgbPjgmBFZVUgucYSgFEFsXPSuIGvHhvCXVUxNMrhzvFAKaRjmiPNIQsy",
		@"stNBYMqDOSGr": @"haEohbQAKdmeRlDhwpcnowJpypCMPAajsUcDlfHuIkNPsYmpVmwsXUVJgLoivVShrfZwYFFbPWWdFIdEPPduOlgNXtGCaEVTDnuqOpUihGFECkBt",
	};
	return BHrBVnrxJLcsJimQsg;
}

- (nonnull NSDictionary *)IbxOXHtteBMDbCHtPLo :(nonnull NSArray *)mcRjNieKBvvvDJbbPY :(nonnull NSArray *)fLvIOMGeIEmsAWMssJrxBXQQ {
	NSDictionary *mYplXwYCmR = @{
		@"SaSfwnFmrwqkdnx": @"nhgFshZFAIYFkUDbFYmjsmpvVMHOyHWctNyUQKJiKwSYjMjGwMyDtJEpNTKLmZsEoafPHCIOXCLUGXQAWLgkzanGLPWwwAjCPmJmoEVuUFkvIgDHRSAEaAgAWpPZRyfhInyjeDHDsGYkf",
		@"HoPkmNrWRFhfYbgffUzAnWP": @"YYNpEiqhEhVlIsIopiXUPcIDupiqyFGjQJeGHuyfSxzdSchndiMhlCesYSOODVtJhGDXJlEXqEGfzYDWekQxGeMMmfCqvWvrDeAPWATgbmQozlvPkblgFOU",
		@"nuzNZisdpHBYOD": @"JqHjYtJCaIQkHyTrcvIwhmkuyyKisbhshaXovAZERsEWXrkpfkqTfLQpcebPTaKnmalWoKERIGPbnGbZgSPHNQUCHAnDyVeMsBUkZtclAyLjQabfenhDTYOUQHhmzXIuYxNyKWYtmkoqYv",
		@"DrvBJkXjfdDCWOiYrOcaC": @"DEhvhOASDaXcstYvSPbNoeMtFpImzxJFBNHsCzutZknxbHOwhGCQUmVKwBlqmiseAoPSuYUvLyGgSvkCzvwshtPkZslRQoRkzZQZBAjNYGQxlSbmbsHeRtoSzCuEfiRrmrXmFhGGZ",
		@"odgqWTIGweSDfkXormMQkoTp": @"iKoFYVDgIBdrADodxphVpHhjKbBWgirRnCPFfMIxAqSMovZFSkdLOKgIMdwiKePSCAgBhCxLTGxvDIxSqtDLzaAlhTIiALBrXCBoKUqhhBipFLBtKaNtZHTRVSaKgDDqMjrsZ",
		@"RENFoKkSbPkTtQpeWlmGT": @"xvkzmvYVEWAfLyPRwxuEpdhcsdLAZeQtRQyuFLhQssPbwKKClpypZAIdQXvMarypkblxCGoKYJtJuYDGouZBFcvSJpyamMAbnjOvcFnQEbIVLfQzlrNFR",
		@"EgNuUJhINVKmOzwbZ": @"SIREBclAgvGlurwnStGNutmGpRBxOWbPxFELmagVQRfFaPhVLXCrtSmbtzxkzBUjGuqQHlYLEfgIlCVuFPPkKxOnGZclsOAIwpzFxTUPRPWdoKNpJyttPssjPuwXqwZRbGOpJ",
		@"LRRaJaRcfijoUxpgxeVK": @"JqkXRXVzjXyTiQqqWfAljvzHxvnuSatsrpaPwMheTALcjJMEhfsAvyUbWIOsXiAaLlNIliatiuPnXVcwsZrRhfpjGbECmihFOHLqCMKRVqGgVYyITKMxNBQztUPMLeSwZSphvmI",
		@"oDQGdVpniylGHJ": @"rLHGbEfxdGyttnCVweoDgrzyebIXvrnYYxwqPJTQPTHGuRcMQGnuRKhQXkBDbPfjitlwkOuzvLQLQCXbWEwXAqXcsTCfsMxWhdwfpBKIsBRKfbulEKyzZWQJJrpiTpyUnPChPAmn",
		@"BxBLqNZYajpWRndHewdSEm": @"fFWNhXxnrNmyKsaAVBiDjVwcLHdOUCJxKAujccMoHSXYkbfJkzWuzTbUfGLIafLcnbHWAOevbsxRdIXCFBBFvNpinJIJjYjUySrbjEMHCuCVGLbAZxVFahPZkikNvLcZGmhdjtznocjGwJou",
		@"CSkIXoNidzMV": @"XZgodcKgmkDaKxpLcnUzlnVRVvUhFnXlePolREatZiIQXqqdyzzvkKoExhHFHYOIerwlVpPUyJILJOwfoEVeRLDGmsGEHErfFxGNurQdhAAxKMdgxUKgdqfDKQWLuTidLgFRKnxxncQhBgVL",
		@"fjPDdovyMFW": @"hBFuRvBWetocMQKGACLnxNEEiahDNxTjjxIdCKylHswrddAkZDknjTCzvrmxTVKvAGeQezmaWZTXWHlUNfbBLcQpiGUMuLSJRZJPMaZvRxBTDzWnmpppnelvucFrbHi",
	};
	return mYplXwYCmR;
}

+ (nonnull NSData *)ZzmnfgiZLZUlyAdnkqxx :(nonnull NSDictionary *)EWvCIbuwRGeohXBgem {
	NSData *oIIqKtZGwjaMLNydQmZbr = [@"HxSkMciqQXSNvZqslTEHUnNtgXWsvtCuHSLbxdDSRAptjqwYCAKAaCFGsOOvtfPMeOBzXAdMWweCVkISTfdIaHluCWhjDzmimStSNWCAVeUrrbMiBsEASNNgeXrV" dataUsingEncoding:NSUTF8StringEncoding];
	return oIIqKtZGwjaMLNydQmZbr;
}

+ (nonnull NSData *)YrphjuEovOiQSfQpc :(nonnull UIImage *)NoHsXkfKqYdOXcKhgUbB {
	NSData *QUeZCGqpHQiBJBbmHQUmWqya = [@"OUSyjhHQrhfywIOGNbgPFAlViklXDzMxxwZZhaRvNZgjYmlUCqUVxAkrzLTIIctnhenQLbGZozTvCoxmihLDLzbpgnSPXlepnePceSDb" dataUsingEncoding:NSUTF8StringEncoding];
	return QUeZCGqpHQiBJBbmHQUmWqya;
}

+ (nonnull NSString *)rWKeEkaXWbiO :(nonnull NSDictionary *)yUhJvzHkcJ :(nonnull NSString *)vswRCATciFKsvDLzOvCN :(nonnull NSString *)ddUGqHZoDJlCwQxJHb {
	NSString *XtqcqiGmkU = @"hGNbjKXrBqJQeVCLsRznTHxdDnFPqxqyRkCWTuZlpSRvQiTirTExenkzCWBFHyihbZaFkKmLEPZOtzmFbgYbwKSuvOjBXVuVVzvRLyIUUQkWxlGXXAMOdkdHkeLYCpGvOAWYdsSvjFakS";
	return XtqcqiGmkU;
}

+ (nonnull NSArray *)NSjDAIvWtv :(nonnull NSData *)lmOPzsxEXJdPw :(nonnull UIImage *)OUnQxbDpLZWMS :(nonnull NSData *)lxDzZoinCrBimBm :(nonnull NSArray *)DZAdvFShANqbsPkjWfi {
	NSArray *sNdDxCDgirVNvDZDNBUrC = @[
		@"vMJpncFxpLIlthMnlkinHgFJRzQCBhZELjwSxMkIgppUXyxOvLzxWSUjIzhhUJdMdwxAtzQSOhuqGEwzFlreltPWWdPPMgnoNFsmiK",
		@"wHXuEUxnpoGnkuAyAvuuImOfhTHYvMVRSZbkXYrBjgUXeIXjPcArUcnPBSbodREKmOLJUHWoPwobgGAXKTNNxJNwObEUVOgNgOTHvpSKMoEVUJsaYdWiuKzFeMFoaVKILzOchpXkOKX",
		@"bwwmJDIkHHcFQPcTOYUystPjzEtwtruGcgaJytBuheqoxbEmIFBMMDQkeMXetEhuXjNkQDVvLrRQjSVSFBDhcylZxVsuFKPXiWCfuNQs",
		@"pSoDzGGmNGduhgdxTTAsOGYgqqNnGSfRaLeVGaADcmrNvawMGEJJMQezBnqDtPwEIhplRTDVJNuFnGqucltcrDssSaTpCMOqwLDyAHYkYYoXCvWoDrwa",
		@"GGdtfPkSaROfXTawbzsKrZXFxDGCdXxmzQtPwaMbFzRvHKPxfRgSzjtdqNXDBCqMDOuHLeMqWsgFebyJlVrRaGqJrEPItpuURtFYzkMuuUusWczrKEAFtNgpSoLLocQpultSQ",
		@"SckFYlUIVenahNqgeQBrBcXPbejRdgrzanbQUmJhGYuvABiCbLwQzuNVbiYEQgAIiQihTomfeipNmtestuonwnYzOjVdJwRHpeYBkWafSlVRjXOCpqpIolGkimFCqQzzpzEotAzcGZwVdXlAmpw",
		@"LsHuDxebuSYkRFdYySIYwzRuUSBKMzQMvVObWQucsdRRBDQLEBgteBfjTtPkBUpHBAJFdkBlCwjPyorjVRhtVgirqHGjfVowdnSiUbXWBkmzSMAmfuIKLFviWauDDVYBnMnoR",
		@"fgwlwfkrCtOjjuUuwKOXvLmmSEyVLpivmojEguajUGgqLkQhgokuELqHBOHAvDywoxalVfxNGGkQSjpOuViUbbQgUWEjqpsspsZjlfniCaVfrBsrfKhQgJFE",
		@"COdTzfmCZurqTUPgweGgmrnyOjjhGbSBidWNdqYreJPkvqpFjaqRgimRhzuCjGDzNOoHDhQZviJXGewimOfDTaxpoksviqyalHtFMOGiRhNJcdwbcnlbDNQVTkxFt",
		@"SGTtzDVwoPaKcGkknkgIKzJUrqAAkTcthKtIVJupbuOkRoPqxUPpoVLmEbthxXzuaeyBKUqBQoDuHxMPoyYpBysthmCqqClcwJMVnJhiUwPQCjaqtYkCKCWqQDptKmgZTiSudK",
		@"ZfAYsFwqioAVramepiuvKzGizxyFViZIBkRvuoBYikUrBlQHHXkzyiOOMnJikOyLvqdQNJmSKPGyILsMMjoDlNaPuCjMTCaPzrYmCALopjvXKEjetcGVnjGQ",
		@"hjQGyLLXFBsFAiYTgJWFCiIJSqSYJvVUfTfigElgfJmNimRyRpRCZOpBVHjoMNHGqcfGCwhSCAHFzzELUEtkEjOpXrFAyodssarYJiPEvpSM",
		@"ZMDaMluIUupOppVxhWcORLIFpomlpXXPejcsdpamgXLsAYxzFiRbwxTbSbOkEFLcfYFzJoWCgCRneoRCTaawKyCPuhHycDppXLdIHxJsAgZWkwxheGNPmzVQpaaklcHmHyVnIajHzLQoJw",
		@"fkNLpIVWuknbilxMLGAQfMFkouEDemHcuPiSCydchViWpXFVdCpKnukBzSUhkjRLTpFrRhtSuzZcZhyWXqmsBOVVtVzTBNiKGkzkqwyzgGocrFdcSdhxUDJW",
		@"kTDsbdavXGgaArQbAgITjajpVtZvPLsapriRzSfPTjPVKNhKqjTmtyihLbuxrwxerTrssYhaOpwrROEedCgWMKprrQyFvnUnPVBtrWjKiwPbooqFKqLNxlcnUaWuGbdHBpbLaDaPJuwOGBNjjVZhZ",
		@"watadJmZXzpwqNlICJIvlAzZkkahJwKgprnabWlDFHoyXaBTkJiRnZHVPbAGNapQnMithwHkeEfFkqqImHduoNUGDlSgTxSMFhJPSBMLAwyQBnLSMwQlmSqEVPqShAnJzXvwZquAQCjLciDiJyv",
		@"lYAXEnSKWUEcdZwUjeAeegWHcsWkbnlqUMuPVOVxEglGcifiqjBcHevDThWfUdsNMuPKKDMcYxTaCjVsOhCmKKlZHVJWpAaxKYYnipCCNuabkdPavRBRWxpy",
		@"BtGRKuuGQFlwHfVejoYzfdpJzDwTUDPNIngTxPBAMzZdbKLmzdlmgrQORqvCyClbEUMbxCkZYUIlAtBQqvmSJSOAfRMqbVGCpfPbpdteibVmgEyULUnbLVHgMyun",
	];
	return sNdDxCDgirVNvDZDNBUrC;
}

+ (nonnull UIImage *)pfpDyGxEfwwqEeQ :(nonnull NSArray *)YNlauDvjXVvvsWK :(nonnull NSString *)tmcDTAxhkUhWRt :(nonnull NSArray *)daSLGZbSKsFrq {
	NSData *nIZEeDiTLEjEUOS = [@"jXBxoWEDxletoegTLyzCOVuskNTijEqafFkzslAUDQnWBSkzrgYflJdFGzBnQaJujNOgxWzOpFPmFFLpJMVhGBzGwuwkJukUFKLRAMGTmAbFvHKVEvMosMABWcZEdKSexgtlGddubHQkfSivLaOO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BOQgYkqVzEVVwr = [UIImage imageWithData:nIZEeDiTLEjEUOS];
	BOQgYkqVzEVVwr = [UIImage imageNamed:@"ZHwSQkMfzjLrLdSNzvlJCnMiYevejCHVMuySpxyuvYUdOQuekimtoBVdAbuBVWyjBEOIIWYGjmocrzjXyVScUrGuhZKFwdpTdJYSncTvaP"];
	return BOQgYkqVzEVVwr;
}

- (nonnull NSData *)yrZBjvCthcNxxnpLfc :(nonnull NSDictionary *)nVTcCEhqjMKprQgoysGoZ {
	NSData *wgYjjRsPhwTtboLEFzZpstH = [@"LWEkeCOnjwyvsmwcqMykataITHbRHBvtJEhNMydIsYkGndgJrMNsTGVrLUYGUAQplZNWZSNiDyzXXZHgwcLRYwlkhNWHjLdIfEehfDovtRbsgvXKgiYWqhuWnpwXjPkJUKoFWtpHLdEMer" dataUsingEncoding:NSUTF8StringEncoding];
	return wgYjjRsPhwTtboLEFzZpstH;
}

- (nonnull NSData *)LCKmqGufZbF :(nonnull NSDictionary *)BTinsFXgQamj :(nonnull NSString *)VhQkvvRnJsCGMZj :(nonnull NSDictionary *)IaXfRLNmGfPltcZ {
	NSData *JecOyzdMLsCMSoeeBRg = [@"pgqkAoXyufrONtqoBLpHTMJRcupAaHjEJsrNDMHTUGyIWFACfoObHubYIQWZKVrOoUiwcHWEQwoScztivFRJVCUnaeRLzRZQcBRdrqrTqcCX" dataUsingEncoding:NSUTF8StringEncoding];
	return JecOyzdMLsCMSoeeBRg;
}

- (nonnull NSArray *)UKYLgtSfKa :(nonnull NSString *)eeDjwnXDDMqhqfujikRJkNiy :(nonnull NSString *)gVDUHqaKcxXDmgUWUdkCKKrN {
	NSArray *qpilRktpmpdZbwGEJTBvJDvs = @[
		@"OnkDxpqHwGFwMysoGdCOIiwwyYTUovZRSHkcScddkMipXojOjYOQvJfNRXUweoFQpsHSoBpHIrEHacFagoZOrRHzmHVGPtUBBYrAfrlupp",
		@"JWbhstSSeiPoadULXQALZZSMlEYaGhcmtvSruhLrtkhluOKcXWxgfzUSuKiqboJiZIXsTROXMEocHRzWACsvZdZzPzLLjOjIKPIJtimVXMBrELIlRHseiLdlpYACEnWBmspjsxoZtQuqDmUFQzPIL",
		@"weClgDqsFtoCDChqJZOJNZzkVgcQIlMnflKBwBnvEklHcOQpJXrxACLGRpbTBqXHvcYGeuvtmMmwnjDgpgFXIQZZIjBzaLaYLvqHWDoUegsIyOGCLeNOUvshqQYi",
		@"AfLSdtRRFOObXVTtXXEDHoNuMppKNViooyLmCdohuokRkDtBxzrUGtlXrDZStleVeAjTvZHOeNOJBOlyGtVtoaytFIrjqZwZYjzkNZquaXuYqKft",
		@"jwYOSistDnrDWPcQSsSlgbjvvnmoAVlrvFDXyzurzYgEbFuKVfeqgXDgAObenEoolFPNbpcYSmTbMstDaHANRXLtMpkMWIlwCrvfPuvTybZdV",
		@"AqRWMJzRvlyiNcLpKAzEmYwfloEPZcOPRNiuQfsfIqpvaLVPDqLCjuBmEYIGwjoYbfMtpyTjmxTWEcaOAcMSCIwhqKUsgEwxSTmk",
		@"PhJOoRTmaPwIGKNvEZEBakTcZsSojHpqurWTkOrvesWKSobOOtSkjfPEVnwzqRLNLuyYWQSHcCidRtzTtIbAQSKXRXetxcyNBAuQvWTkpvENWfxbdjHSLpMadxfSGZ",
		@"KDcswJDAmYgqFlOIweVluOhSgTXfjYDYhoKptzdfSREuzPDhiKZbrIhAbnOscPZxgdhdWPXrurFXFeJPEtloOkCIsklqTMERVLLQGyiDHPjnyHySmDeWyUBEfPTdiXPJIXnzoRZkSzf",
		@"uUWWOtaAXERAhWHaKcOgaGbbfcTKfpsWwCzzznfKIHMXTYrEMPPtUZbyuZmZqexnDzMKDmZwYtenyWvqPVDzygPchzlCfMztctGguDJNPmhywCAlrqCCPOOfTGrhQYXCBapjNy",
		@"bCVVMIVnopYLLmLAfNsOoIyXwxcctFfnVzSRvXxCUjHDwSHsebIeIyNVDJzEVNgHbUtoTHjFzyzWMgJYUKDVArrgmGyOlbYNayKUOa",
		@"NkGlNOAbvdsVPmFVufDOPgiJCMqLNiYgxGnaEuzrwQrWsqYTQxMzLkWHkqHzhOZGHAjZMOXXHkKfNdQSADPljdhhpnjFYMDMrDHMyWDljpsGCaHiviReQnsDVHqzCgLUhTkbZIAgLfLvNVxHkSnV",
		@"jgWJaROfnbxmYOhpgrnGQwTVFwliweoDYZkFRJjQnJslWVDmoSakAPeLABqrQGhiCdUXqLNvcknEexXhBZWzfDyQlHzjZRQtiOgIpnFrpxvmhIaZrbxePBjNTguSCvFzZ",
		@"jdgfSZWsbhZGOMnFchnyIpUgHqdQWFXOxeDDRdWmoYZNhgRBvVkmkrutrNWjKpiONURwbnmBSQhZrtgWhMMzskPloCuLYCOInEufKGikMSvjtYtjtlZud",
	];
	return qpilRktpmpdZbwGEJTBvJDvs;
}

- (nonnull NSString *)MehUbyRrGGUNkTvASzya :(nonnull NSArray *)YDwyedOkfSX :(nonnull UIImage *)bYuOoMpsjtVDfaMWoMBqI {
	NSString *YhhzJMUneshyRceYtsqbNa = @"JLkcHcJmmnJSEbqRAuSbUWjYcLKmzwgOUWhSLJcnOQWSUbwBHkvUsxKCzGDXAahBQWyHPyvdcuyAgMEqNjaliJJceYswJeuGlkTDehfQvhHLjjbKTXNhvgZsrUtZcAZoHYLKf";
	return YhhzJMUneshyRceYtsqbNa;
}

- (nonnull NSArray *)WvrigjzeRz :(nonnull NSDictionary *)mHNFKpLugOhFteYyOKfQcwZ :(nonnull NSDictionary *)ITrRhOLLeSbhMRe :(nonnull NSString *)ktuFSThXsDCTGii {
	NSArray *QZbJDrrhQveUKMjxn = @[
		@"jZbulWHiKSyvnbwdocOGWZcNJqVsygajkPgRoLhxiDOdnoXCiIvVCWUJBDCZMpjKppKKsgXZEdVlHpdHliiyApVVnWxsyIgLioqOVcMrFskhMXGztBqqxnzjlKtjEwtUuY",
		@"DGcQiQPqdFzXHRtMBxfzYxYBKcmBRocUEMtYfCzUtfyAGSTSfJSLXancsgBBenVeXxsUTcgqoegOMEVZQWuSmsCtVkikbdIIItHatVMdAbHWzNyYOURdGMvmMxjYQwOtwfSWj",
		@"AfvcNmIuiitzNZgXSWbXaOWKaAqxGayGuvSxpFsBSXEaMofNvcsPSZArtaAhstgrcKecoubgvogPmvYlCmzflDjSkpycoJcBPXvVPLTNyGtkOPDgiMaiSRthanyVi",
		@"uShlpuUyyMVMQIrJxfDZMtyXBifhgMKruYjhPeyLqwKQoxBeLgpybfrdsJlDsfGpnyriuvqssWVTIUavqlqevWslaHzygZfGlIAjRptLvuECtAXFXmycxdBUAQcasrqnlgushOJxVCKhXBous",
		@"yrcUzpWyLelJJsOCuQrXGnTeCsWWWEycoTHoZMGlQPBKkphwqTGXdeALlUFLBKryuhQZQtBIYOzGVOsFHNEXbjuPxSafVCUNzuXrNqerpgkHArvmPDLnnuCjgJLMgCVwDPTtyKRprwvIUeDx",
		@"OeISDCkwZCdjHqaEOZkwLLaGAxHQYaliSywclkzFQaGgHHFeSXhQUjiUTPPOizPTPpkVpJBsedNgXadCvZPZDVrbPaSmCubdOasjdORVzQhMWKwPBFnFHGhwuSTlmBopBSObWppeWBPnAIkCkTP",
		@"sXnPtbdlONSxurBXNEIOnvpIglNBYNyGokXhmhxZhCBIRNlyiLMuUkskQfntlAGGpanHlyvKdSCBDfmBuYkSSVIUlboXxVpowjvZRpGUBiuyCiWVuufZbwtlE",
		@"IJBDfmkzskONklrNUTjHGYtkBBwyRCNGHXjfDpTdPbcPElZdBWtsRzsqvUoOGMeFdpUixpQXhtxpLAowLySSQXCCWhURZXcimahDoCbBKUEddKeeMrWRTkHaQWrAZQxMkIAFDZrcR",
		@"slKMiuBJzLkWVLjicgiiSFabULtZAKcDaovrlsrwZYruBwrrDKFXhZeeujLaDodbiLdIJHVRIGYiJMbvpRSPlPBEZTiPgLSykShNkp",
		@"WnfLZHXQnPryDBhqnPFYDgsfUPRocTdBoKxFQQRrbuwNFiOwtvAhVFUcnkBnRXPDEJWBSFZFyUsQBjgocTaAiOlhmhuRBbzUArUGkaHWXunJNPXiNlDxjTBRcyYfvGCgEXYCaXCsJeVJs",
		@"IFtvZKltvmZXeIAjezjFuieMvuWDFvJFBnnuhXOpfGAvhoXfbqABIzckGVpwdByGvDSJLGdYcXDFwZTVORxVydCrkTwRGDcAmKlXhDiYHnrwiLXDiY",
		@"tqwXSRtBhVWVrOSuYMiQvQuZmcksLIYNdWqhLwYHPprIOmtLpvbsErrgbVbsjfkTfFMRwxglLrgorZiydZSzKsJELPXmqqdtvxLEfGpRJLnTKVRofPvPIYBjwejblznMTfKogEne",
		@"fKFNZdtdhgxRnLrHjyTqGbKHBXAMFAWTsPRersSLbSkkfLykCdrMXXluKtythtddhwRxSbGIZfdlAYtIFkBLvLTDTnussnElyaKcRNLaVCZMRlSlbQYCfiauAXVvCOjYzMVgI",
		@"jYerowlIbwicLgRyWKvRMKFsIeTpHwSeYKUfvyDDVbNJhSXbdzuUPpSkMeScHbnAEFuRxSbkFIkGcPcRuEgwrNPqSSLtiAmQVFKgaCAkrIzTItlyYNTecVB",
		@"LSFtcLGxCmKTJlRKrIWdVNRVeAGxlPuVqZeIrrsASVjBnAZdIYwhBFrxtHwADBkiNKhxfXNNcrhxvrwoTzvBSnIKPueHPCvhDcHFHechoDwGDcEwVqZPWLIoTc",
		@"GBDpBoMcUCoBZjzvvaXrUbAFQRObjZQxuKLdXqIDuauYWQYzZfucTQXulvnOvFjEgkzdCRsVpgnmtKpMgTGSrTAtaIFnEqIKPgYhThoDGFdtiMptPoeYPfDvtCsBdHOkDHIFFyFUT",
	];
	return QZbJDrrhQveUKMjxn;
}

- (nonnull NSData *)kXpjtsWcqDXgh :(nonnull UIImage *)BhUVqLpnXIGDx :(nonnull NSData *)hvAtfmEGXAYKo :(nonnull NSDictionary *)YZEJzYEBjv :(nonnull NSArray *)ljXgSXXtIMjYwMPadoLg {
	NSData *FmwYSWtYuxHtNJU = [@"ItElQxChsvlcTQdEzecsxfSlXJsftBtdPHNjQDcnCDbrhSUkFojzXeDGZVHJbIWVsKqgJlGDTTmYLkrDWvgMPnPGsPYOqGBeOEhJLoHnLWazIkJDihxtw" dataUsingEncoding:NSUTF8StringEncoding];
	return FmwYSWtYuxHtNJU;
}

- (nonnull UIImage *)IwZCTXoOVqzvuGwVHo :(nonnull UIImage *)pLFfQOUTZozvKEbBqALUKEP :(nonnull UIImage *)btELCiJHBZIVIbp :(nonnull NSData *)ZcWMzVTKjfqYewX :(nonnull NSDictionary *)fQbMLdXMhHtBH {
	NSData *ZUpQXayNDnxmMpPeIgpX = [@"kFeMXQKajlPfpIMKeINrmIkhjYgxRkFlZHCczaZrUEhtpIAqukrZXDSJKLUXmiMJjlZpqHAQLhZeakTdjPKzfQjkBPsOveHhNvzXYFGHsNNYNZsKOtySesuuUulBzsqzeRgGBhvaCQasI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lQLHKDCYoAhcRnCqfWR = [UIImage imageWithData:ZUpQXayNDnxmMpPeIgpX];
	lQLHKDCYoAhcRnCqfWR = [UIImage imageNamed:@"OqNfEYFeZKfffKZaLFzDUUsJOhnHLPQWBumyshZEGHyHQrFWtrJheFOwplgLmtSXrssmbsRqMaEJSdZXBJXEeULKOJikuoVoYKyy"];
	return lQLHKDCYoAhcRnCqfWR;
}

+ (nonnull UIImage *)LdnvqkkCzyeinhDTMkniWDQ :(nonnull NSString *)leAOyhIFcUNLhiuDwW :(nonnull UIImage *)xTNKfTOyhZtSOd {
	NSData *TqretAhalRyzUISZVsIPrF = [@"KZLOXimgpgxgqRGEcLhNHwPzElKoizBWYuSygMkSkfLKPdGnHltmgxbIEKmTByISrPtnMgXEowaStRVljVQcqtQIEEDzyNPSsLqoVAFJFAPIwsW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xNwVvHeEwlshgsUOTGVz = [UIImage imageWithData:TqretAhalRyzUISZVsIPrF];
	xNwVvHeEwlshgsUOTGVz = [UIImage imageNamed:@"thoOSbNoQedDSNROojbMWeONBJdcsIZyskPSiLuefYDrjLxSsGCjXfgKJRTOSFrRcQvNwsCZoiTNrWlGIYVkxscKMxwsMlkvNgDrpMbcHLRh"];
	return xNwVvHeEwlshgsUOTGVz;
}

+ (nonnull NSDictionary *)ChtCDKrQtNevuYtdCk :(nonnull NSDictionary *)jjSJZhAKfExS {
	NSDictionary *nCONMkMKhhjZJmNZpjlcLkrs = @{
		@"XIBOtrGQuQzwbSFpyfRCD": @"gZHzxLUROjbNChwAIGQWoWtiDiILfensQqeCSHBGTOUcuvAIIHxVPcOJsimSZRyNCXpqlUQZuLPzWvyWsXDsYAMkeOCNoOKCPmNmxjbmvzFrivorKsCJWNDwAhryrXgozZHLUWtcQkyStSUPLEw",
		@"XLPsJUbzHOoipdvDnPaLOdvk": @"IDXpmDitkfPvoHzLcEZLFiLsLIBwGeWoBQhfzhEcnxRlGABoOZlyRJHJXelvGMjSQteOaePxwVvFdvWFExqhMxdLwGCAHOLAwzVRpavxJUtiFsqxHIRccNrsLHWf",
		@"fnrQAQbPmlTSAxS": @"bVZzHOLcOmwQEUiuECoqzWqPpjAAoEfFoMQtXImxPCdAbnqAJJOzleiOjEkgQSFYZpXTEJazTaRnuclATfXKolIavCLfopKviIXGKCIRlUa",
		@"kHubULJaHVZnczWz": @"epVISXAPVRgOjkOGuFlsHKYiDsQmpRkkiJTnllCvTBJwlXnZVGrBQbpDxUIQJysrsYXAgwhBNBvpygapZIEHHQdhVnKbDeYGfRpOK",
		@"vigNqhwPJQox": @"mLfcivHKENNTnQAwMhTaFnDzAjxesBUTFNIYtxsewvpiEWxdKFCcHtYzhmabehDSMCtMJJFGbVmXNToDQhyojcqeceVwfVSFInByHoputFNNmKiOSlJtjNcIPACudnWmVAocV",
		@"VLWBKnyFnNedHWA": @"qaCywMOjPmbXHWJtypjxIQmZIWkpZiNjcMTViBNamhPGITHwotHqdaHGDlUPFspxFQNWqcNGiYgbefUOjPwIigQvDLJoSHzrLxjlXvqxsWzkuIBKTes",
		@"RTvaQaPqUvShu": @"HsTezjxzVvWmnjWoutDtANzZPHWcDYXZWsmpahXzHdaGfgSllFGwNLMzqjAJodJHiyDQsLRxCDSCLFsbGQupPunvzhWCPEJzvmaKAAAoVPJgxzAhEvPpTWgNp",
		@"zrqMAMjnNopMglvd": @"WrQkVYkHdXBPymQBeTqnlhpbHKZihDGkYBTftxeXJZPHwylXcRyiImoZCzZfqBmXcZEsOiPCrusWiBdWfEDdZyhupNyuLballccGXAUbr",
		@"yRkilnLVBIBZdOhwqvkCV": @"eVUomCrMCKCVCGmBQIQqTxBIoNDUvQPvlUFpxzCqmGOdUSyVRGLvzieRvxWVZhYXedBhzimbdbwuxxhcVjPaoDnBNQAPagBzAMlzIoCDP",
		@"ggIHQiuuqWnywrofZut": @"fVDLeQdItnqanDwQZeEkyHKrFprutqdTthxqMgtpbDnbnBypGyDtWQHzywtPwJPnptTJgCjLGppajHxbUdFKLPCTDkXckzQjEjClMLGKwFWNrTvDWBErIvGgvkzqDKEcVSaWmDLR",
		@"DcYJUacUwstZUDQKazZnF": @"tLwjHjmdPeKthFgoELLLPVgqrjqRSPkLixRjIfMZCSyptnJaJkYOYosTUJufObkjyidCfDGDphlfoJnmLiboofnGFLytURAxpQpFYCLJRBNSkqcFVglvDcpYxdjamieYqzaKWKoObJ",
		@"uRbgTJpyteSGoOLF": @"UdgpgCAIkaXopMGNmbtMndxgunZBJnINRENbyCnCjInedKhFndvnfhdXSWhDcnUFECBsrZvvFkiznzAVDVOUfeRNqOxnfAvGeByVxWdsJEplXHedxkXyLb",
		@"IVMWdSnjsZC": @"aubPDzMnjqUQdfARNIpyZeVfMjZVmrCcTtzHNaOcZSYjnocAzCmWcyEneSwiJShPWfiAbfCrCXhtoilVdKtmUbUGSIygAkxSAnDHamhSoGSeLemGggdIsvztBTLNnZuqEMTpMyzXlgCRdRwlVIx",
		@"xemKRMmNELltOdqWHTiT": @"PAlHvpBFpAsgswyapjjwnfRNOXGmBtKVEjhwbWGYMUDfmYWitadTvGBuxyEOqJiGaWmoQRawJnMGzYFGyfgkbQOYvWLXxfIYYniNlqGbfcjphBuFLMuyWiVplytzxwtrNHuwGDVIu",
		@"gNfYRDKSofn": @"DVHMZQJjIJZXBbFuoAWLWsOaqlDUUkMoeknMNLElEZBbTgdyTZlvMvelOtoBYpxQlDDFJBEfosvPmlMdvgeTggFfBLIANFhALrVdvjeokVXc",
		@"BsTytoksKhGFftD": @"dklDqCAyiPiXggHpljtWAdKSQDkURotnRylVoWmrcSowkNIZlwPiKqABycYATAeCqMaQtuDHAdKGggeBcdrmQTqAArQKEqVghCsRGmOItopdeRJKr",
		@"NnQJidfZyq": @"NEkKUqFbvfEdytyHpcVJHeBlLwtKUcZEPgGRgDkBZCMisHNcGKZDPdFbLHIytrbwKWILiStyWKiHpjkruJhidKVrwYMSJBSBzLcvbsaBsdhlytSxP",
	};
	return nCONMkMKhhjZJmNZpjlcLkrs;
}

+ (nonnull NSArray *)ktTNSIBAYEfUogJ :(nonnull NSArray *)pbSgucSfkw :(nonnull NSDictionary *)DhYIRWXOIYVRObju :(nonnull NSString *)ZfXTdFLTJXBtcwRkqtRsRcjc {
	NSArray *iKTFuDaRlsyHzFimofWvBxn = @[
		@"FooqLZHrkNtuxUFimVoiJaFgOhHHPfRSQIsZPjfYiBmBlFumyCLEakVZtEEaRtzkYytKLnIhnbTcxHskUbzDZjHnGIpwfLKKFsmPrgWTMOXAjOcAuB",
		@"idiLrxhgXIUurgPpiCWPxXUZfLzKzXXYSSQJRptxHQFRUtxtnBrifpzVFFGhjsJoXqCuVLvAWozDJIESmAxaIWOcYgTFrdvyzANsbWSvRNtiOgiDfXURSGGavtYRtJFIXbfxeK",
		@"SgxKovVjOuFlGpOErgwBLszRbVrOdhCBieDLYCiyBqyuISpCeSFChbyqJuYZnEvCFZlArFmZnJMnKQIgTckuDRhTdsdxlSsJaQmfQYlbqcOjAglrDYNGLrVWZAhavgLdNbWpJhcHA",
		@"PIiFtexVmmvXjCOkuuzaujKGvnAJJJldSiYxiYOdZBmFGQWrwsHeUIIUrStMRNmvibdhXVcjQtEAiCloICTVJxZKbQYchqWYnvWyXXmZLpFvvdfhYgeDfSXxKvtbRwKbegqYs",
		@"AvXulOdUUxinHxnaSwFiXabOmwXFgsJJBQlqQIrEBCdpAUkcOyXKVRzozuUUMkefEBGvNPFkymVEQURmoLXrDUNjlOOgNcybhxnMQoyvfLjoxWTHECRrPxwuGBMMLJRwMlATLlDPVvQWhU",
		@"ZjxidtbFxUyWdCuSqCeFXzGsxgzqhRAojXRwvAPVnzvseXArXqQLbGyncgObZxWrmZQWOaWJWosFWZQzvRWNkFBZMmdQAcbvzmHGzYXknaZAsoleNTPHevamEyYSyWJq",
		@"oFegKWzTJBpzYUhHHTrkJzwWQHGmlpduEkZJFAZFVDKFhdcSdHCJtDxngFvabsypEzPYCRXcbQWgbyypksjphiEPpFsMlpSSVUNpxga",
		@"MzcrHWefGRuUwnDSZmwMMuoZSmyvIvsMcGYazJPQfpkZDZulLiZYvlcrZREJjVPOUGpBKfEKliMFTjwzMCdzKPUojKFiODLrDhEXIQmqIYvElGCjfRvwHGBbltGj",
		@"ppaCAlGeoLGkrFkxFKMKuBxiroRIaNItGRYwrTBvpRJJPnUwskTDlBNPzpPExAwtQKOofCWBBJPelvKphMCFuTblKCcXbnSeXtxAGeIFGITMSvrWCGaUacLBEeebWkWa",
		@"UTExLyhdaKnIRGTCYyCCPVIsQmvqsYoJKWqbcgGUETSFneVXSiSIvmTCKCJjBoPeguZJEzRHtnhmVONahMkBEgLCyAXmkKBinSuROVosFOpSJEKpYGPbk",
		@"hGNgujAsokocyXCytXSIpJmGoVFFtGzLTrrynFRTDMJMJfFzWQjZivjnwWLyjhsZmopvRIbjByrtoQcsbgVMfALLRjgFUUFyNnLYVOnyB",
		@"vZxUoQsCFTCwyFQVozZBjjjdKhPbxYJSAFPiYsnAPAICmlRmXgMAVoSdgOFcMVtvDxRtjglwolzWdcffntixyJtCIFMpVLBDkmSDNUPQSBKRk",
		@"gstHvxpgIpEkYwCRHKUyaKAMSvyasakDJNdCcVSCCSijnuIEeSUInWCWZsrULIQKJBUiehTEYslzJUpWwuQPHoOEPzeGiYLLAklSOlEOeLAwamfswQPLKGJyogFIgDWIzyZhElISA",
		@"wBTVCgTDbNGQfDQRnHMAEVJbKikwcdFkuvwFkQonTnDUWBUrvCjVrCJUOPwBHJnKpXtSEmDKTpoOcxsgHbZkzfCUsWgXaRfwjzcoMeoCWahvejpBVPiKnVmNZevuKDsGXZonkHghymrFSo",
		@"qVWVfWvDFsNxtYjjUcQajMAGfOZikvefdVSOQYnLNPurkFuzKSfUToVrcQTZejvglJoQmOVtkFiGwRIRFRBrrLoERvwOJmMTLqyMHvmBsNNtBbdmBAebyNffKtwZXesyTSQlTBtdkA",
		@"olfMBxWBRLpdYJEpiDBkXWKtRrxpwvprcKBbHcJrwKPdJZkTrarRMzJzrsOtOcLxUJXaWoIEEvTdFQRwpzFYchgBAKwdVZyajhphmugEBsxdwHDXudEkpNZstDSLlnZzqhISGesDwyWBiGeFE",
		@"ZqzBVTQAdLyoeYfDAwRiAHtwQnoogZGtYeAtjuDOlHXpHFNSpLJeygeDYuHlkLpXaeGjJhhhQLlXaSWClUxeVIOPZGunegInskqmCdFIhXYVnbluYTNNcUOeVEnwjFEPeXDJkYZnRzkCMsualBC",
		@"YWyRTfLbGtDvJHIHASpmwtdiUbHnBCmAlmVVqoWeNyWzlkYGMzojBZLvNfkQImjtVzCRKbLKTdYUamRElaOshthdFVyWpcdFzuOOrNRQbkjPVDThdfPfLJfQkTTtbSLrfbZwxNLZEtgUTqkk",
		@"VLLhZjumJqLuOWfsvVvXnezSXdfVQyUatJsBBEEGDMRglsjUiPDCXgscmQxEdENNDhQXKGUDlRvXcilffGppPWckxqdblPXhJAzwhFAwXwIjCnMOOBoLguJipDOQPZFjHFdIdesUKWGMBYCzcd",
	];
	return iKTFuDaRlsyHzFimofWvBxn;
}

- (nonnull NSDictionary *)tEDCicaLktLBFiAkEamORN :(nonnull NSData *)DqJmASxwAEdUF :(nonnull NSString *)XbyvdfgZXXYYtHVE :(nonnull NSString *)utKFZixnqqeZMhIpeHZze {
	NSDictionary *RLUZyaRzaYdm = @{
		@"bNpHbVwUIMxBVJUFy": @"pwjHqkTjRumbqzOVOQyYTwpawUdhifnECkbNvmlqPpEKHBTQputqjAVvAwPkBVmMzRSwtTzxKDqFpKJErcKNaHZswgxuiVqyECzSfFcQPXuLBvGaWwSZpECMQggf",
		@"vAudEhrojKCZAAniux": @"CNQYlCMSnIHJUGvHgPAAUJmuvxYTSplPHixfIjqTmSQcRLZZptPahjuAzHHEorYUEkOHYPAJUscJdHsjfkShpgYDeDBTyxoaXgQhBvpUyzMIZgmAKdOqgMgbDEcEKTNOBVAAklAxcKuKwAtBZR",
		@"QMlShwuBPLmiKrPNUwEjCb": @"aZKJzEgFNcDqrjUSrUrTRkKWmniYaSQNehCFPkrjapBVmOGGvsRjSohPRFWqgqjBSdXRiuZLNyhJLnVjeBFMUqWrlFKPmflweHoHrSHnJOTmQhsZGhSFEFhGUwwaZoeizrajZ",
		@"FhLKGWuBDYQSWimOc": @"jUaJcRUFeDCsPNjLSsvIBKzPUcDDTTuMXTyMxlknUxRlEfbcVtWjXfhNFEkARySkueQQdPAMnzETLhYyhPfJIHmeKIstCXQCIhtYTQvmyjCnYDiRTtX",
		@"YzIsqsIFOpNu": @"hVsRGFmZVuVuBFhcLVYPjJzNXNnmDpSZOPFaPIqHyttedkLuYNYZdaxWfzIWPRzzDNEkHajhWFPtTPHPLniUpqlpKoeISIMBHlDuShKuHn",
		@"SaqRNDWpcxmb": @"UqAMMWZtPYwlPdwzKFwijPnvEJhFSIsPPZRwLRcoVZTtdJSDjTffFzaXFaNotxcdtFuHPmVNbkFdDuvywVUwMtqMdvnOKFYWKCZEPetstut",
		@"ewWHfhwGiNzC": @"TftzEhJjAOBuwNBSXVLekXifTdPGNgCBmXuLCkGSjDuMNIfSQrggXMPuPTQsEhIumdjAjaGoAIGePEfGYosbbkriQruEhOXxNBcbDuVAzuiSfgORAMJgNxZEftKNqNCiDKhqgqQXPnfnyAwj",
		@"rKuENyOMztzrsOZGJOhg": @"YqtyXLeZYARpTGfJoRiwQTHODHZvFFzffWExjEhOiYYWxQMOlapVrEqYCeMynJpnPealvOHbeHlQBmCcrrpdNFTPAMQqUtrWDjAxxDNBPWo",
		@"GAstnRhwgeLdyxTGqPRWxC": @"hOSqDnOZbXMsXbfLKhMdAbbVbbdwlQsqbGMpgjFjnipMVqctZLZSjHUwrwwkVuQcidfuwShJGFrnaKdLNXgfJuCvSWdeRpbuWVWLVfUWBFuonLgJgEAacGoxEPtbAbcLnnbBtrnhIFQzHZu",
		@"WyhSyCLVcnFMiNVi": @"wjpAYcZCkHlmsxaGJzYtgGGvLFrpxHluiHEExoZCZqnTKLVwDdpwNNpIjIFOnhqbYSYvxsQCSEDMEgHtiNjEUIxtxcqjghmIPXidniVtfTuhqiGab",
		@"HTXNcuvBiyEfCowv": @"uROSGEDCDRPEbcMvprNprgOUwcJwPszRdPHHnRsjFwgaeotQRxuaSmRQWTJTyXOGlnSWcnsOITsaqnRAsHPxVaMIjAKeXzBBniyGZafDQvTEYvhNieyIGBHLliDkVngzMaPtPlJ",
		@"ZjHrfDJPOXDil": @"YcJKVkEiqZMODcJfzaPNiHkNSNiDzvJMrHVLbxUsDgUQNWGNEpYQzaSgurLviBHLOOvEAPMjCpyCRduNSXjpaadcWXPDJqzYrVYJhtqTxhZLEjyFVPxSCZjOWcbpJszeVaxInIvfydBhlLD",
	};
	return RLUZyaRzaYdm;
}

+ (nonnull NSDictionary *)kzVbieTiJBTncfDrosUIe :(nonnull NSString *)pBxrAnzQgrEy {
	NSDictionary *VOaDqRLwAbVziStFrA = @{
		@"IWlunDFPCzFdbdqxfd": @"lJyzsCjHaLuiVMrSAhZjjpOoarpiWAjGHbYeuakpQOTLRmDAElNCGDssMUvHRGwHlFfvHkqYakqZBnVWCdjttXzAEbLoVsceZOnkZbgRXlSvoiHDlEUQZ",
		@"PVPDEVHqvqcQ": @"OwFnzEqjIPBeVPEOKOeMIfjhyJrDKPuMTyoacVYeRUfGBoequKkYIsZBsGEovPGWQTRVzvmEaXAgQhfvBmGBgRstSwdLFLPIRKOHbyxDfmXCiXsdjZDuhzvceoqxmhVVoqzZsagyaoPngY",
		@"awWDdjHNYiDIgbBXhM": @"VBWMLOHJQwmMtHRtsdOVJFDdBEejAYFCFKHjsMolUmuUsqRBgfhvNiIXezSILubYDEQIiGCMAnaolAWTuMXiRMTiswsRNcPOvRzNSi",
		@"AwcXRzaDprDGtVLV": @"JZfMwTgTlNKTVkBgSUernMRKwVhizAVNrCTLAcbRQsdSEtNZucYffPFpmDtlsKyEeMDndOYexfShGBbANqshHAwXITqtnzRTbFirjKIGMrcyKdVspXWrDGHfSrdGGU",
		@"jHNnTaOWKHOmM": @"KvqJyeBjBQPkQJTxGpCJyHMflwinqMyWFqnFPdMLIWTIJTGMMLbAZUzRmOUTdSHyHLdURHRAsNnGEUWFjQhjfwvYIInDfwPBEVEORfRBkjHm",
		@"yJDnTSVIecAWSrqlDxezlrH": @"ueWfOMMPSRaKUGBdqZYwidLNNhTLiVUIJtUEwaTVAztONIYWEnBctzjQBKxYRcocOHCOKHSWuiQjbgvwjRABAedBOjfTcuZXWNyzxsMZEplbfbwxNmSaqFmedvKr",
		@"IeDcgktjnfbBVTCH": @"AgAIkbQynfGXqkILMTTKULKDndRsqpdVHbHDxOiNcMJyHyQkzuRmSxebQuLbBLnyMOZxQhHXPqHcefITkkQNjIbAGMZoFnFySweZyiDbYvwybqrpiDoIiphwmMnMVywmPZmHDPbftZLGVFoS",
		@"ybGtBTcSRwRVwLatv": @"inAInsabeRVLPupiSiamiTIFQTSJAslEkCiCKRZhJYiaeYpwrzpBPTMXTwUwQAzAcxMlAqYGCcTiDRDHIFNRbrjEMgPJCtIkkOmcdxbpXbQgPbUCOoWgWLcOlZnODQHDZuuFposglAoaNXXZGF",
		@"MsdTdlVfTcbvNPgkJmo": @"RNRsMbrFNbQoXkfnrPNTlNgAfpljWmizLegjrNkqFlTTuYbMakIshAtwYuNcIQaDuTggZGAyYRCkhjpToHFILLADKOAvfRUTmYwqj",
		@"RXHaLjBpARzWJVKjjUHSZ": @"WgqOYoylAeEUrVrJHlIyORzrJOLkQRwAhxwLalhFoJBayODcUSzrFIEHCgmXibhlOXbjDpySinmLWkeCZCrAANKorZWlzxWYMqMXRoLqviEBAIfHHNChtmgZXQiQaqNcEiXtJIQGlsuNpExZP",
		@"VulQXHaFYDsyXnwCOjAgJLP": @"tuihtPOBZgkYgvFjTzxEkKWxwvvDYXZairmcUMFNRCTGQaGobDkbGvtXKxUjpeeHayQgrvbefzJjmNvsumYCvhUzUxFgeLjMfypefomGAIAVphPSOYSXQaxRjvYoTNCcKJUoW",
		@"RZDiKbLvARQIznlw": @"fACmBXzEIveRVUxQpjNmbETEkCjuGfMTIbFQtuRsygRWNbVlPZDnkMxIYjywfjzNFZzDTCHSnCvbwZwzHAbSOEGUVQJInxBGsDoJuHHYOJLSguinXzZTRMUYhGWGketEDKYYQgoBtnlHgoJNnvJDv",
		@"YJhirLCztiMZLDAiSCLb": @"HrwTRYrJrZligPslEFlECxiFYCnLMqRdpjQGmtsHjiXUEByAENNbPfIhGhAFXRqauUdWxbOoYLsJGVaGjYZhPEBLmGauRNoZaCSzZHP",
		@"EUMekWWrel": @"DvtPcrUOdKFKEqxUaTrcAluLSSglTAqESfRDRZoRlSRmfDNwQbWpbRNhfqyUQhYfVHJjIZwQlaBWRXzDOBFeJqbEXLvnZLHeMJkESJnDDyyYC",
		@"LmGbzBzWDG": @"JBsvIYmDDnmOswVQrWDkBxQjuQjmcnJCNbrEGRLvNGeEdiNWTmpUOYOSfCQAeoSfQEweWMXtTKjnsZPVVEDXpxaaVynWguiGvBnGrsvGlVzupYLXTKAMHwxbLcUscrwRcYwlTRlb",
		@"BKmoJaillCktqRpLjD": @"ApprAiiNkrrYihhDghozJSRptVJtVyZJZMiaXQuwEKkyodMljUfoiNxoAUTmpArGCQWwZlMoMPjWDLoxUOCfkitoFpizyhRYCkOuuBrmSEaOOGcHdYDp",
	};
	return VOaDqRLwAbVziStFrA;
}

+ (nonnull NSString *)WSzhXQQqjzdJaWgX :(nonnull NSDictionary *)sjtCpgJzSCyw :(nonnull NSString *)EIVvvlaZSMFiiceBFRsp :(nonnull NSDictionary *)HbRUQGkLbSMfoDTnQXFgNJIe :(nonnull NSArray *)okuHHBUxcFJaNCfEhxtDuKR {
	NSString *FSFubuIxWfBk = @"NTHAUAdliNMpcyDkrYavpuNKVzGcIIoOOnCDwwHeYXvjiwToGPEOIzMyfDBseRNNALfaKlXblIBmNuyiJOdAAxbVABczyPEYOqUQMrpVVRPfEfgtMGjTKURVsBhip";
	return FSFubuIxWfBk;
}

+ (nonnull NSString *)pNRoowUAsoJLiBhHfCmME :(nonnull NSString *)QRPKUpYLYRXoCDYuvnS {
	NSString *ZeKVqjLiYBfyYMgUYDF = @"BvnnhZKguEwNBfhsaVtCuxZJkNPfBrbPsAlMKmzfeGhrLhSoNSTtoqvEiLQrSYoUuTVsTaDjdLbIzrLhDqMjyeEhDcxofQiNvxaMw";
	return ZeKVqjLiYBfyYMgUYDF;
}

+ (nonnull NSData *)gaMBGhVrHoHfPsxhmglLWNa :(nonnull UIImage *)QDiWindgPCGBae :(nonnull UIImage *)infkLcmIYL :(nonnull NSArray *)APilDcDeqiJ :(nonnull NSString *)OCdhbfJuCwSZ :(nonnull NSDictionary *)YdyTjJglaYuPEwIjcov {
	NSData *dFkKhYvXLs = [@"BaaAJBBnKNMOkGdAnDJNIhYkdBegxiqqxxyVjVbSvjuwRjeSRgnGByWgFmpXFoYsCAhhhbILlyUcQbvXAnIVucTtSbWjBWeYWkUeCGbHRKgmVG" dataUsingEncoding:NSUTF8StringEncoding];
	return dFkKhYvXLs;
}

- (nonnull NSData *)QjYfrHWEnJS :(nonnull UIImage *)XHDsugbBrvpxudumf :(nonnull NSData *)zlVqFblYje :(nonnull NSArray *)OrdcLAOBlPMapGEdcJQHKYAj {
	NSData *WCaYXghBnPn = [@"UUsGTglHTCZGppceOzmSsaTNniYgsQkgrKxDDSANhjIQUlhvnYHMuacAPzXIczSPQTpqpORRAzFgjbHnXMKbTpvlXNWzRhYcwKYeugeBIIdfVdPnvpDYmIk" dataUsingEncoding:NSUTF8StringEncoding];
	return WCaYXghBnPn;
}

+ (nonnull UIImage *)gXsTzESwSTXyz :(nonnull NSString *)MzqYxMjxKxJXcZXNnMRoBAKO :(nonnull NSArray *)hSNOVAnUpCUouYNmqZpUmZ {
	NSData *ZyfVAaRdUEvmEOqaIAuSCZMa = [@"jMHOQDDsoaakJBLmTzNFITMqumJduwNxQriEaofXljecJLAbLlZKnthWbimEkSWrbRkTYnHdJLztitlCfCXOPPGwGVyWzqTHyKyFtdqSeCbDfWxwXyMscVDIlCgYOxuuwcjGaVbDcUNKLqGdF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XalpJFWrXZmbPnJHYoKqNmF = [UIImage imageWithData:ZyfVAaRdUEvmEOqaIAuSCZMa];
	XalpJFWrXZmbPnJHYoKqNmF = [UIImage imageNamed:@"rPvgKPtABSdMlINWwfuQDnOLFzgyBaRpkdOBRVUIVEuWuetWXuoiOXgUqMNZXVHdWgsqnSBIUERGnsjkaoRITLjbqKaqaeyPdfKejlCIdZQuEXU"];
	return XalpJFWrXZmbPnJHYoKqNmF;
}

- (nonnull NSString *)asUzSnguCLvhJyvGzh :(nonnull NSData *)SKhQJXBZNU :(nonnull NSDictionary *)fqGNElCvDi :(nonnull UIImage *)XNYwNVInKBJULYXnPkMH :(nonnull NSArray *)vwIEBDYfHJR {
	NSString *hoGeaJYStRCwHcaWSaRlXYKB = @"vLsoEyHvVKohrZbrktonSWEkotGJsXLwuOprNyZVktwyZPsYwYhUCHVnzQHMsymqWGOYTIZhlymWOQVfzHwoudjDwuLqZEaVxZYM";
	return hoGeaJYStRCwHcaWSaRlXYKB;
}

+ (nonnull NSArray *)eJaAHkosZTjaM :(nonnull NSArray *)yfXQIGtkgDGjaRvgiTEd :(nonnull UIImage *)ccPMBXkXvpNLPzLZeFGy :(nonnull NSArray *)pScFFKhMHYTAIeHv {
	NSArray *lsjXgvBgSOAhlzlOVhmCG = @[
		@"NrgrxFxKAWQxrrBpsjjAZdlWlwiXCoaqfSeGDrgWANfZBeKfFQWEvyecEygxYySZINndwdGlxFYXnINLFqrYiTcMpeHLsOsjaiFxzJwswg",
		@"IXFVfyqlvQwkTvhGVhjPhjrKJAzxVzKfCMCidpAcpoMgSgKznaMdIWJohJLFjdVxPgESfXTLMSwgyZQmEBkCGArWsDTlVVdYMaUgGwvTNlhHXZhFSlJ",
		@"CqqqOoBMqwnvJhwMAttQnNTEWMXttUrgELXYyuSfOPNTyCgjZFgChjTfadgKdfspKaJaPdqxwMVGZwhuqQHChSMpHrCqNlOHLLTDLKWsXjksn",
		@"HOYDHXlBRRlrYjDdGVPnOvsWLCrSVxuNEglIdQQKCnnqgMtQTnaWyvYIbNpcOeeljfbJrULqRiksDORKVzMQzTCaUPSrXDVvkXduwLIdO",
		@"lCpMYdKLqesKTIETAfhEkCkiscSReHTAIIuiVDoRJhjjhDLsDVCGZKdzfOPDLiPNnnRupvtTCivtUNuqcLkYiEnsqFuUfHfKzdHm",
		@"BlNmmsNFMbsHRbQaUNbKmrnKkINAHYnZrEgFIZVmprwABwlkhpQpSmquKLGHUajLNyFNqZPXuopQuaGoRpXMDHAQLdPFDwaSdJoLFdlqGvzjjIbFuLOOPfnotgrCCvkmYOIWc",
		@"tSagdFTdrgYwidIvYaqNzYHNqqUifwVmydOAVhHwAWIpIjxRzzZVBVBeeEhZCSHCyUCSlZjeYirdKTupCAnLvEscbixZeHWZOveLvrO",
		@"SyTCmUlKaqpADwpTikVNlSUzdmULeXOHBsSEuxtftzeopyAjrpHixmLAFYThYITgJXYWpusGJVQiiQuXBgPDIwGGNZaMbGUOwqSkQaFGjTsRGHrfuuxqeqStsDbLPfFrSqKzDPohAEfom",
		@"olxEhNywKFvwIbUpoZHUVZQbTZqRxNVPTaZjoBblLQmBGDWklwTdloLzxEUQlnHooURhQYLpfXrCLIGFJfDQlMXkuqxwJBCVycGXWypGnuPzvZTkBEcsWcalPbHoHIWMVLYPFQzvNSYmV",
		@"KEXQDgufRhKhWtyHEBSzOwNTrrcYoKHeLeeKTnchangoQKzbwQRMsgeHYOoVvXsoPSJOMpHDDdCqjeDDdqvdDDdAvJVoBmcmMULVoYfZqMZwiKBoZmpBMzQAxWnryDHWiHYIyTC",
		@"lXPCqgJTTowLnMSberEoHojJcOoLnGdheqEBzGHxDxFsJAEcfBYRNAnhDbqnfqpdwDnJwIaURjXjvhBkbZZqcKUSlYHyfdGkGubXiCcfODinPHOovMkcHugITbFuasfEbYBGpdN",
		@"IDRZMUjYnVnioRxZUwXzBUEgpoTURIJtICmZwajmAzUTqEWLSBitodMdgnlraEphkjGaGogbHjnQXcmTBQyIvQzQErnsFmnYkwGPdvWQjGzHgrCaRQbcSkwGDoDfxEAzFNhinQCmIyhCsayjhGce",
		@"jDtNhlXNzzCRNyhmiSEwTQiuwIojOdpAIYCeBKzYBwaEMRamaPGlnflsPgYCJqFmJGEtejAzuZdFhcEvowaWhalfMRjhEIyKSCmJiKjTSJKGNqbHAqW",
		@"DwbeeNbaObkGBzDClistEucIkNJHIClIgqmapaFNsMvtcVPjQLjrutOMUqlxiuSTLEKsieZHoYWbmIdCvoyMUMyOqThfWXoFkVbhnuudDXWhjYjWrmqScMPqhbLgaTPzFvpsuhkVPFo",
		@"RpnbtUKvNjQxVoMvUqkwpcNLHybubJoxbxvWnWItHyrwgZFaMTnlwFBYSvkccBJipTxhDrzoNEaSyfgMVfStBHyZBwjLvMaYDBelMcspsjxEbZ",
		@"hfiOdBptYCqdiwGYvnsogSaYySuiJsThDpkLLyLWCGLoddITrCSHepsBRXMphtmynGIIZqDhFvidBpGeGbZomBzhxHSiBcTJoRXYaOYaeweWVlLBjCxRcUlxNzJYDUEdBMeLcoSn",
	];
	return lsjXgvBgSOAhlzlOVhmCG;
}

- (nonnull NSArray *)DnsvpMTdhSM :(nonnull NSData *)GfOIDgRvfRQ :(nonnull NSString *)MJLrnXJHkSBvDiRCJmjNMW {
	NSArray *ITaloMQXGc = @[
		@"KHRkYBVpHDvpIsJqjHHEqGNQYSqSEpIzCaeyJPBdDElaOAWxEPKIvOMeOdmofvxAMkALDvVjUHswFxhdAlFRaPwGugKTnsjRuirMFZxcnJtBWRdyAeJzu",
		@"qAxIfWjWWVXQhPqPiqVIGvMXdActhlcRutLaMLFJLVBlxUneLIzYxniIVtlPoiWdDXnolGzkabDuOAxqaDAlqzrvNIuXMfyAzuajNEgsyRVDmlSP",
		@"QruvuripqrfKtdnkscuvNdwWETTOLfVqneMPpGqfaQvjAtpJZRMQicBmbgYDcGLaNAsKnffHJCXqKMroRHgBZQGzxVWTtTfmENjEvFwPznXVaSWrHKquBmvZelzFRAuAZPDdurl",
		@"bfUYTihCMNZLHESfOcAfQypBZplGwJurEWrxHUVCoGxPslYlRhDunDnApgKXuUJGYoOLqxvmfyFYaPQoIxwxxEzyUDMyzwOKTwOFiBKpRUFoFlxPfIgyJiSTupAxl",
		@"pXNhkKRmILwElzSUdtgQPaaLCvaaOfIuypZURgZLLOYXFDjXlYCbqcklgBncjYMEDwzHnNMXUWIQEuIMNelefjanZZBGRoFNqVzZBlyrzDiHqmgwmGtVgZKTKbw",
		@"lnpIUkJMlITqNDUlJGmLWafrYGstxmzhnaGaUhcZOhxUNqamqtUCGgRcDXzlTnmVdGbMJmPpAWSXTKkvnSuCmutozChNrocUNXxNICjxqKWfxa",
		@"JQlFOdMQaDPdVJrfZZZfOysSNkppOcAPTBTyLdMYPvhhhpadSEgttAePtEejFEgftKLNpYJKeQEFjCEuhzpyijtKrZeSBooygxRCZdTFGzIZehizXVzGBrR",
		@"inWkbLeZCwAebqsDTlBCqmwkxdflaZodKjhBJcvCKFiLkcyOSZpHGZIWzndwrdzjApGfBdBCbwsKYLjwywyYCJvToFThOaftzwLXkVJWESBCOu",
		@"WKNNDhdCMJYTjwKdARfeNrCOdcuIuVQTplPVqRwMCfWBEMqTZOMOnXELynzQxoDnJcKEeIMTGrEJFfJynATkYwZALRVWmWZBLrOpMMkPTOufFoPoTfroOUDLrbXaDhdMVpdiBuKDRiijCq",
		@"NlalDPiMSlAKJVfkxUGiNToSoaiMRHpWkTlZnMlEkahOkGrNdgJHjhSKdfrgoWOygBUTeUwyOTkBqfgxyoPiueOULmiAOpQdtpLT",
	];
	return ITaloMQXGc;
}

- (nonnull NSString *)fSQvPOccHCHfhivxbNZeYnVt :(nonnull NSArray *)dCHepyktmJqdmz {
	NSString *NIjqxieiLxSZCzjvffdvVgn = @"DETJSXTtJPRchflwKWJOTTTluPDtMqlpJDjRfQKBOMqaaApHLsokPjcLaVnpevYJdOmryMUKhhsozkcCYlasJygTXqWVVbqSeZCxRkdEjDHSSiB";
	return NIjqxieiLxSZCzjvffdvVgn;
}

+ (nonnull NSString *)bOvpTVJekcwSIdds :(nonnull NSString *)lWdyGPRCSOUvLTvRyvJskzgu :(nonnull UIImage *)gmIDospyiRhofptuQbAXAToX :(nonnull NSArray *)mDQYWfZWVLVeOLrSdpG {
	NSString *qENatbKvrDVsg = @"gsyrHfzCIeuQTsYqkIDbFvwbfbPwgSuMNumAOvquXesaVArwjLzaRKedosuuqsQWXINpiconTCsanFsVaVnkSlgiwxegruCVZXmchVjjOBrMdqgvMLzypciEL";
	return qENatbKvrDVsg;
}

- (void)showEditModelImage:(BOOL)isShow
{
    self.editModelImage.hidden = !isShow;
}

- (void)configureDownloadbookButton
{
    int bookState =  [[EBookLocalStore defaultEBookLocalStore] CheckBookListExistsAtBookInfor:self.dict];
    
    if (bookState != 1) {
        self.downLoadBook.hidden = NO;
        self.downLoadBook.enabled = YES;
        self.readBookButton.hidden = YES;
    } else {
        self.downLoadBook.hidden = YES;
        self.readBookButton.hidden = NO;
        
    }
    
}

-(IBAction)downLoadBook:(id)sender
{
    self.downLoadBook.enabled = NO;
    
    //    删除之前的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:EBookLocalStoreProgressUpdate
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(EBookLocalStoreProgressUpdateFunction:)
                                                 name:EBookLocalStoreProgressUpdate
                                               object:nil];
    
    BOOL willDownload =  [EBookLocalStore AddNewBookToDownload:self.dict];
    
    if (willDownload) {
        NSLog(@"开始下载");
    }
}


-(IBAction)readBook:(id)sender
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"StartBookReadingNotification"
     object:nil
     userInfo:self.dict];
}


-(void)EBookLocalStoreProgressUpdateFunction:(NSNotification *)notification{
    NSDictionary *bookdic=[notification userInfo];
    if([[self.dict objectForKey:@"source"] isEqualToString:[bookdic objectForKey:@"source"]])
    {
        NSLog(@"%f", [[bookdic objectForKey:@"percent"] floatValue]);
        if ([[bookdic objectForKey:@"percent"] floatValue]==1.0) {
            self.downLoadBook.hidden = YES;
            self.readBookButton.hidden = NO;
        }else{
            self.downLoadBook.enabled = NO;
            self.readBookButton.hidden = YES;
        }
    }
}

-(void)showFolderImageAction:(NSMutableArray *)bookArr
{
    
    
    if ([bookArr count]>=4) {

        self.folderImage1.hidden = NO;
        self.folderImage2.hidden = NO;
        self.folderImage3.hidden = NO;
        self.folderImage4.hidden = NO;
        [self getFoladImage:self.folderImage1 withBookDic:[bookArr  objectAtIndex:0]];
        [self getFoladImage:self.folderImage2 withBookDic:[bookArr  objectAtIndex:1]];
        [self getFoladImage:self.folderImage3 withBookDic:[bookArr  objectAtIndex:2]];
        [self getFoladImage:self.folderImage4 withBookDic:[bookArr  objectAtIndex:3]];
        self.bookKuangImg.image = [UIImage imageNamed:(iphone)?@"bookShelf_folderout4_img.png":@"bookShelf_folderout4_img_ipad.png"];
//        [self.bookKuangImg loadImage:(iphone)?@"bookShelf_folderout4_img.png":@"bookShelf_folderout4_img_ipad.png"];

    }else if ([bookArr count]>=3)
    {

        self.folderImage1.hidden = NO;
        self.folderImage2.hidden = NO;
        self.folderImage3.hidden = NO;
        [self getFoladImage:self.folderImage1 withBookDic:[bookArr  objectAtIndex:0]];
        [self getFoladImage:self.folderImage2 withBookDic:[bookArr  objectAtIndex:1]];
        [self getFoladImage:self.folderImage3 withBookDic:[bookArr  objectAtIndex:2]];
        self.bookKuangImg.image = [UIImage imageNamed:(iphone)?@"bookShelf_folderout3_img.png":@"bookShelf_folderout3_img_ipad.png"];
//        [self.bookKuangImg loadImage:(iphone)?@"bookShelf_folderout3_img.png":@"bookShelf_folderout3_img_ipad.png"];

    }else if ([bookArr count]>=2)
    {

        self.folderImage1.hidden = NO;
        self.folderImage2.hidden = NO;
        [self getFoladImage:self.folderImage1 withBookDic:[bookArr  objectAtIndex:0]];
        [self getFoladImage:self.folderImage2 withBookDic:[bookArr  objectAtIndex:1]];
        self.bookKuangImg.image = [UIImage imageNamed:(iphone)?@"bookShelf_folderout2_img.png":@"bookShelf_folderout2_img_ipad.png"];

//        [self.bookKuangImg loadImage:(iphone)?@"bookShelf_folderout2_img.png":@"bookShelf_folderout2_img_ipad.png"];
   
    }else if ([bookArr count]>=1)
    {

        self.folderImage1.hidden = NO;
        [self getFoladImage:self.folderImage1 withBookDic:[bookArr  objectAtIndex:0]];
        self.bookKuangImg.image = [UIImage imageNamed:(iphone)?@"bookShelf_folderout1_img.png":@"bookShelf_folderout1_img_ipad.png"];

//        [self.bookKuangImg loadImage:(iphone)?@"bookShelf_folderout1_img.png":@"bookShelf_folderout1_img_ipad.png"];

    }else{
        
    }
    
    

}

-(void)getFoladImage:(UIImageView *)myImageV withBookDic:(NSDictionary *)bookDic
{
    if ([[bookDic allKeys] containsObject:@"zuoze"]) {
        [myImageV setImage:[UIImage imageNamed:[bookDic objectForKey:@"image"]]];
    }else
    {
        NSString *imageUrl=[[bookDic objectForKey:@"logo"] absoluteorRelative];
        [myImageV sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"books_bookshelf_img"]];
        
    }
    
}


@end
