//
//  CYBaseController.m
//  MyBooks
//
//  Created by zcy on 2018/7/26.
//  Copyright © 2018年 CY. All rights reserved.
//

#import "CYBaseController.h"
#import "ShelfViewController.h"
#import "CYSearchController.h"

@interface CYBaseController ()

@end

@implementation CYBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHex:0xD89387]];
    
}

#pragma mark - custom method

- (void)backToBookShelfMethod{
    ShelfViewController *shelfVC = [[ShelfViewController alloc] init];
    [self.navigationController pushViewController:shelfVC animated:YES];
    //    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)searchMethod{
    CYSearchController *searchVC = [[CYSearchController alloc] initWithNibName:@"CYSearchController" bundle:nil];
    searchVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVC animated:YES];
}

#pragma mark - setters && getters

- (void)setIsShowBookShelf:(BOOL)isShowBookShelf{
    _isShowBookShelf = isShowBookShelf;
    if (isShowBookShelf) {
        UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [backBtn addTarget:self action:@selector(backToBookShelfMethod) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setTitle:@"书架" forState:UIControlStateNormal];
        backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    }
}

- (void)setIsShowSearchBook:(BOOL)isShowSearchBook{
    _isShowSearchBook = isShowSearchBook;
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [searchBtn addTarget:self action:@selector(searchMethod) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor colorWithHex:0x333333] forState:UIControlStateNormal];
    searchBtn.titleLabel.font = [UIFont fontWithName:@"FZLTHJW--GB1-0" size:14];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
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
