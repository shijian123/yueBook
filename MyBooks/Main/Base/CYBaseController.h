//
//  CYBaseController.h
//  MyBooks
//
//  Created by zcy on 2018/7/26.
//  Copyright © 2018年 CY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYBookInfoModel.h"

@interface CYBaseController : UIViewController
/** 是否显示跳转到书架入口*/
@property (nonatomic) BOOL isShowBookShelf;
/** 是否显示搜索入口*/
@property (nonatomic) BOOL isShowSearchBook;

@end
