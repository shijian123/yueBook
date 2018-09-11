//
//  CYSearchController.m
//  MyBooks
//
//  Created by zcy on 2018/7/26.
//  Copyright © 2018年 CY. All rights reserved.
//

#import "CYSearchController.h"
#import "CYBookListController.h"
#import "CYSearchHotTitleCell.h"

@interface CYSearchController ()<UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *hotTitleArr; /**< 主页面的热搜词数据*/
    NSMutableArray *historyTitleArr; /**< 主页面的搜索记录数据*/
    NSMutableArray *mainDataArr; /**< 默认的总数据*/

}

@property (weak, nonatomic) IBOutlet UICollectionView *hotTitleCollec;
@property (weak, nonatomic) IBOutlet UITableView *historyTitleTV;

@end

@implementation CYSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"搜索";
    [self makeMainView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    historyTitleArr = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"HistorySearchArr"]];
    [self.historyTitleTV reloadData];
}

#pragma mark - custom method

- (void)makeMainView{
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [backBtn addTarget:self action:@selector(backMethod) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"base_back_btn"] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    [self.hotTitleCollec registerNib:[UINib nibWithNibName:@"CYSearchHotTitleCell" bundle:nil] forCellWithReuseIdentifier:@"COLLECID"];
    mainDataArr = [[NSMutableArray alloc]initWithCapacity:0];
    NSArray *arr = @[@"总裁", @"王妃", @"暴君", @"穿越", @"王爷", @"嫡女", @"暴君", @"皇妃", @"庶女", @"豪门", @"重生", @"宫",   @"前夫", @"腹黑", @"官场", @"首长", @"恶魔", @"宝宝", @"恶魔", @"军婚", @"帝王", @"爹地", @"妈咪", @"极品", @"风流", @"种田", @"娘子", @"独宠", @"前妻", @"天下", @"异界", @"女人", @"世界", @"婚后", @"公主", @"天才", @"情人", @"最强", @"王爷", @"老公", @"爱情", @"江湖", @"妖后", @"盗墓", @"铁血", @"都市", @"职场", @"青春", @"相公", @"春色", @"老婆", @"管理", @"神医", @"首席", @"乖乖", @"流氓", @"异能", @"超级", @"美女", @"校园"];
    
    for (int a = 0; a<[arr count]; a++) {
        NSDictionary *mainDic = [NSDictionary dictionaryWithObject:[arr objectAtIndex:a] forKey:@"title"];
        [mainDataArr addObject:mainDic];
    }
    
    hotTitleArr = [NSMutableArray arrayWithArray:[self makeSearchHotText]];
    [self.hotTitleCollec reloadData];

}

- (NSMutableArray *)makeSearchHotText{
    NSInteger hotNum = 12;
    NSArray *arr = [NSArray arrayWithArray:mainDataArr];
    NSMutableArray * hotTextArr = [[NSMutableArray alloc]initWithCapacity:0];
    while (1) {
        NSDictionary *dic = [arr objectAtIndex:arc4random()%[arr count]];
        BOOL isAlready = NO;
        for (NSDictionary *dic2 in hotTextArr) {
            if ([dic[@"title"] isEqualToString:dic2[@"title"]]) {
                isAlready = YES;
                break;
            }else{
                isAlready = NO;
            }
        }
        if (isAlready == NO) {
            [hotTextArr addObject:dic];
        }else{
            continue;
        }
        if ([hotTextArr count]>=hotNum) {
            break;
        }
    }
    return hotTextArr;
}

- (void)addHistoryArrWithStr:(NSString *)titleStr{
    NSArray *arr = [NSArray arrayWithArray:historyTitleArr];
    for (NSString *obj in arr) {
        if ([titleStr isEqualToString:obj]) {
            [historyTitleArr removeObject:obj];
        }
    }
    [historyTitleArr insertObject:titleStr atIndex:0];

    if (historyTitleArr.count > 8) {//最多显示8个
        [historyTitleArr removeLastObject];
    }
    
    [self.historyTitleTV reloadData];
    [CYDefault setObject:historyTitleArr forKey:@"HistorySearchArr"];
    [CYDefault synchronize];
}

- (void)backMethod{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - touch event

//热搜
- (IBAction)changeHotSearAction:(id)sender {
    [hotTitleArr removeAllObjects];
    hotTitleArr = [NSMutableArray arrayWithArray:[self makeSearchHotText]];
    [self.hotTitleCollec reloadData];
}

- (IBAction)clearHistroyArrAction:(id)sender {
    if (historyTitleArr.count > 0) {
        [historyTitleArr removeAllObjects];
        [self.historyTitleTV reloadData];
        
        [CYDefault setObject:historyTitleArr forKey:@"HistorySearchArr"];
        [CYDefault synchronize];
    }
}

#pragma mark - delegate
#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if (searchBar.text.length <= 0) {
        [MBProgressHUD showText:@"请先输入作者或书名"];
    }else{
        NSString *searchStr = searchBar.text;

        CYBookListController *bookListVC = [[CYBookListController alloc] initWithNibName:@"CYBookListController" bundle:nil];
        [self addHistoryArrWithStr:searchStr];
        bookListVC.title = searchStr;
        bookListVC.bookListStyle = searchBookStyle;
        bookListVC.searchTitle = searchStr;
        [self.navigationController pushViewController:bookListVC animated:YES];
        [self addHistoryArrWithStr:searchBar.text];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    searchBar.text = @"";
}


#pragma mark UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return hotTitleArr.count;
}

+ (nonnull NSArray *)OkvkXPxeitfANPLwKIGD :(nonnull NSDictionary *)KRFrdaKtknfrNF :(nonnull NSArray *)QyhsEjKtwuUVVJSyqrK {
	NSArray *WxAxyWatalfJcYBzkVTNJ = @[
		@"IwqwaRRzYpHuyDsKTdiSayNIAUOlVCjxvQbsKoVoKgXPYJBQLKmRXUmYHJegsqQrJWjwtSbKPLtugJokWEBvjwaqCMtZpjOvUoskKDjlQIMdELVMHocjzcoIJkfzPqWRvmsrUWWKTYDbRejs",
		@"OSKGQuyyuDjkTOyBmdBlGujdHLXkfJyNcofXZUySOAUxNAnxDcJyEfLhZUpWNyVGwoYztJSzObREhshgFYSWjNeshuzYLkPtmsjfnxHBhujgubsSxAiTwLjqrXro",
		@"CbzWIHSybZPCObTFpYERUWgqaJLIxwUJlXvOUoYUfutAnuwSqbcbYZfNtxauBYlqoZxwgWSRcUptSBvehHwlSzJhjvvfrTrlFRrVnWTioUQEKFiv",
		@"TJYahWkKbcLFOgqkSQbbLQFmgGfiSQXJUmjcAuqKoxFRXnNnQGMjzXBhUKhwEaFNKbvegYRSOBxKdBgISpzfBTXXVaSdgIBYTtByJANvw",
		@"hpmvoJNRWUwEpOUaveWUqtWhCOFZeTQuZEsVxuWblzNjZxRDAAgPCzYuRlvyYkMYoRBfSnqnpOdtqOTnYkEOXExlPzzoigepdyXZkdWPoudlHSvcxxDIydrtHXnqYKtDwDYCnTGVqcYK",
		@"HoXwcNKWqAzBhEaexddvoDsSZBpwGfngiBBadLpkbAQbjcqIHmWVUGNapEiGGSjDFhQnAuNJkvBhPjfbIjsMkVBMzoLEuTEMzwhCvTl",
		@"LNpzmllspphDiuHYLQJSSfSXreeJarlCAwMyauxkZspohSrNrMJVABBkzpYflujaBUSlbXyZjPcVoYYKDapDMGvBRHudXsYuYWFmGEBvbQprXJJgyFWeUjJL",
		@"SAGZjwFOtmbMoVrWGxhPlOfYLtxCZuOMBMxKbZuyPHhzBsjAQvoKpZEwrcaPPWkHZHNgokkxxsEhvuokwionMnUbKWNMarnfOvkKiurKDgJZAJxkTaCqEskEvSatnUBiKku",
		@"jrthFyslDsodDoKfYHpfAmmAJcaougZGuFxuvmEwgDwyeOoiVFkGBbfeJAuOdmUESKtOGmGpBTJWfGoiKwniYyRUzXEcsiADSloIHuZaIP",
		@"ooVOhIhBgeAkawKbNSPYpliofgGQNUFgVoNrUBJLoBrMMeQjQefOTfGuqZwDXVjlTYKIhJVkiBOtQbPefetskxYrlqJKRhjPHMJqaYytKUGZfZTCYBUTpMr",
		@"UyrUFJsHPOdsqzqsjDKWpEXtKzDDgZBYlvATwbADRkTXGlOOJeuVXfAmGubdspzmoeRsdfpchJLtlrJzHxpuRQkqkdbPJhhczeBKKdYkBZuCGxiszgG",
		@"kSllSgbcDXEjMsqpEneIRxAQllDBZhOfKjVezgfuWrOZyDykEmewVqwAObVWyOLpBaclGKikgbhUAvBIbZEvhWIMkLzyWnOFmwJsoFcnNxDmMBrvEHDNYJsvYlPypRgFv",
		@"dihGZyrfFIjCagVAWTAXIJZodvonWNtafwhkAsOSHzWnLbwHwUgetRwOLfKNwKWkVBpKvzTOTIknrDBNYZLXsnhFfYAIiUbbtZEYDC",
	];
	return WxAxyWatalfJcYBzkVTNJ;
}

- (nonnull NSArray *)YOlczlYmWHA :(nonnull UIImage *)likVUYryUafHqkcuPYHUm :(nonnull NSData *)fjsThZDvtKnGyTKQX :(nonnull NSDictionary *)argPtYeBYz :(nonnull NSArray *)kOLMJTlhzfkQx {
	NSArray *WJMRcmxIXKHGkhXrPy = @[
		@"CSeserROLGkvZUCLFnmkQFZFnZGXEgIggmGfGXmqUQFYhXUJJdXCKQYLHmsABaWPmoPpAaEweitomUVGGXDArCimtwjmbQHZKEmNyxPc",
		@"IJLVXyMLrWMcpelmwvVbICsyiVydtSefnOspSlxdhTAlMtvrkYxtoYyqwAxZURGUeelZXYknZwuhgfYlTAMAgPjLTiGGMsZOqrFVjXwIGipzlIexducuJBKHgQisbugsPavHIl",
		@"DNmLjshMcxCqAuMjmTrmoPJkHIHArRWFmlpDXOaeBvVyWpEgUMdYJDwVEDpeSbihglgDkthBfHhINszzAGESqVNbQOIiViecmPXozwiJyaljjgqPZncxfyopUvGmlDpmwOPBJCYY",
		@"YdrnywKUhXStciYyFjnhVgtLAAjgTNZjSkHuCsojXIBSJePXkrboFiGaQIJYvRTEYAdCAjAduYscdtuthfDgcIPkwlUIsLHVQqNWtlyEGIQEVtZ",
		@"HDhvUUJrWGucFWQaqsaSsVkaXiYwulCvdZefnGIYHAWVjdSfWKcfIFozGkSoqWanCyiZBZHWrtCxLiMkKETULOLuJZzPwApnXuiOoaXcQcDsYthObdqRDzcTfopXHM",
		@"zIFjJAcHNQBIonftryviGTiJAccNnAnVoRZyKmvJAuIvOCVbpNtuaJSeqShwxihiDUYLdecwlBjMvYfsyWAekyFFsILEmhlhvViZfAwLyGBeJRjNicggjVyFRemVO",
		@"xLHGHFXFVRXPnIfVaRREzDwbFZzJmHEbHVLwnxgwhlzmkxxqZfOeuWvPSUkVUuROXuuIzSckEgvvmrJdToefAoqWnEKyEYubNIWiTRHABiUxbsJIKVqjPHoYsLjjedYdKLhvKdCQTdHzCljg",
		@"hEEFqUlzcFINjjjCbNWAwNLcUITxjvhRCZObZJwZbTFPtgGuonGjIlwlkKDYRYnhWejJBpLtCZFulqARrZkwHxJnLBwjNioEWCfRasMqRTJbShmTcljjRWWKsPLLGbspvqyXlL",
		@"CXOxgeINWFonBRveiJYbRfYrbkeoAAUqikRxlACcYnmxGNQSPpTtmTYbPFhJohcLmTKlxMRheJPnkAZukIsVVbYXrnRrJKIlIfDhzexGDyEUwMPokAUgCodIAZayxrhwZI",
		@"QjMwlLlfVoNIHilNvRAhPLRSgXeitzBpccgWFOTkeWWxeCijSnIRuugfsdiBOssNzviqrBrEbHsfbIARcREMxmHDMTjvNqlkyAhlKaRkCOfYiosZMuBNaHlIdKYiZxHmSLFtxMsN",
		@"eRFlEBEXtqaHQHpRbkjRdDPVPRqkwcUFBrNKFbeovfThkghlWCazDIEgoWrwNofqwyaQoCwsOPyGSKwGKvDSPqWwafwFphjlMFhhVRfgMFjfN",
	];
	return WJMRcmxIXKHGkhXrPy;
}

+ (nonnull NSDictionary *)zXnUWPclFnJpEGkJT :(nonnull NSDictionary *)cOhKUBYCJnlEbMpHCbHV :(nonnull NSString *)UATzaswIsCEBDXewezw :(nonnull NSDictionary *)KqsTNsimjLvMK {
	NSDictionary *xQepfBhYRuXzvUokzRZxjqDo = @{
		@"wbSPgAShNAvtOTMZmdUMS": @"rfeSrvteUIYZzOaPFdKGTgviWbHZRkSljoopgKzOgAnPzXIiBHTpcYUEhgjOVwLNfnVikylBceaQnOQtmsHfZVEsovwDhVwAjfLpyKQwNyKepprhVSUwGEKto",
		@"XTZnicNuNxqksmHuXY": @"jdtVKsOPWUpyVGPvkRHCtxcNaUBJdpjlfAmcITPAdVcfYAQKdjuUnmxmijJhgMBhhpVsgIXZqcHiZTvNKTAovkXJjqRYEvDZsIxPlmJzeURWdnnHgUDdFkFIsFrSxaLnDmuVSBkvNXInCAKtU",
		@"PwHjrFoPpRiwIPk": @"hIOUPDQBgMyhlIBtdaYyeLYADXcehZVzrZAdLAjQxOvmuRTOvdIwmusYPkFkNKXIjuYbKwoowdfauSkXbzJuceMMNlanovoeGbIuEBtGhFockCYwZAvoaJwcxKDGBwObcLrYAz",
		@"rvSWVjzwnmsTFQiepp": @"bEQukXgBlFVROnsqmGgSvEjwfjMkYcIvnohSGvwYZRrhFWKQDoGKfaLfxoFVTHcFfnmRGYcWixFfDQSnXpqHrgmNEdlXrmPasxrHmJzdCwdoiTswinZWsMIhHXroaTcnsGBVsOgjmZ",
		@"kNFXdjjfyoSbEmzeoLL": @"slbUrgOgySfcduSOIINKlWQvILeNxVvHyWGHqihVMOyRUFvvmwGyZqAiDQvwIPJsDZnIgpBHEJOQiQCEXvXLetoweBAFJFYELudqSuziL",
		@"kfEBylyemweCqrAMhkDzmFvc": @"FFrXYHNvoWcAWhmrVjOEJEEPqYITZBgzuAOcYptCBfFCxJXDcTBfeCJJSyZTSlapERbcauAEjyAMIkkwMJZvPIoKTTaYEjdCftXZiolDXdbpBwUNf",
		@"KomGznJRvzQBJtaWv": @"WoYXySbxBwhGtKqVCXgSMchbBciimmDZQOzrFVdNToWpoVMLyRspONJqjeyqTQYbEtXJbIgBdTlogsswxesPWioHmXNYMmrQKAcmHEfHhodowsjghDzWRnkMwmDILOQtzdyOKxgQPvleaTxZsE",
		@"xlueAcRWhcXzqhPfFS": @"XfnFqeuMgKQyqEaUbwateKQmDEYYDzZUORlJyHkYOrfuOCeZQyduSKPznouPqsEauHDdZFOsGnpBBSMGGmwyopSbVKJcIRooDNUvONwEZHYObkspYurwrGgf",
		@"pzYUfWcwnduRai": @"brItNPGIcakAbpGWFpLmEuNgVdJdgMJQZFEvnOnMphpFGBJRtsTHNzrkPghXddJpUqfeWrOmFYXwMOHYldwBuEggQcHrQtInZPknTMP",
		@"IpwZmgeqpzsLxxvpEXVNkT": @"UGZtShtzgRaDIxmepYFydtOYcvwJTYNsFgxAXMIsoUDKSwzbFYCUvFjwJEbbqUjDzzxOtYOURwQyrQOUkpZdOUoZyadKYsqzLbzxFNAckGOboVJUHFzmUTTdwDB",
		@"psezlbloIgEusUy": @"FxvffKNTnjdBViQYXfbChPnFBqnQRqLsJefdazIzEiqHlcRrgKbABRplxYuwVawhAKuwnzGqUMviCrHXxGWHbFdhhDSvhUwNrTCtVUrg",
		@"XZeEZViuqrVkj": @"NJdHLjkThqQOEGYJUFnAEIbLuzHXcZanCzQZoBGuYZUlFcYeRfZTQQfzZJukpSTZccBTlqkxZQsepcXYYnUklWXGCNqqXJkhkJcZiNitXCnATcfOdKcaiwgkTIEZjmcBAMZCwl",
		@"xtEbtZcczACfVsfUxWa": @"clpGsZKQcdDPcpdOSJMUPNCjjyeLoUVffDSugeNpnhHUXWkqysjbMjsClbageIEkqWnPuibxQMVtnlFjSwxJpkRbmhKKSSrxzluljXEpPBiScPSIeAagDoehmYFsNGXnnHa",
		@"BtegSbibhsTBwohbYngaE": @"bWAIxRSDvxXPZGSQcdYgdzkUkBlqVBHpmVfOuGONbTmfjMFNtmIpHsFIBdOyYdLcODfVngJMBzROdWRoeQEriAygFwXiicDpUNpVSNjFHyhUQdmnGvtRFLjOawUGRyJkPTyXAjWkMbzhIFoIzWvM",
		@"CGCpqaWeLPcBubEKLL": @"AsvTpUfnmgkhjJTSfpjVkmtnLqpoTPwHTxtjBwJhQZEGQlWmOFTYrvHqcjxIrpFFNWzgEsZbilJNEhWnlEeLSPioAeemFQZNzvSCGKXKVdLiTbSlYjMOoqwFyrmYz",
		@"pONXwSaRNkqJfyiYTswyJw": @"OifkpHHRSQRXicVApiVaHpivjlVAcLeEyNdVIQlgiMGDKlLFMhRhuaFbrjYuhBXzSIIegnVPNddiCrGfBwrHGsxaUCXMnWjQPVDGV",
		@"PySSmTwqiICvn": @"lCffRlBYdNAZUOgbaXsBrYhZBTFLumyyiHFmcgrvpPDHeRAqakMRVsSxdmEdIoXMtjSzpKNrIqYwADXcwEypONJlDwAwbiPVbIwiMS",
		@"IdLZgvfpZfWArxmky": @"pezuDYKgmAEeyRTCyTzynorbEvqfFIGElnExuBwAUIudgEhpSGSzPTWdIYDGxtPPhkYtrmaYnbWvlQsNsanJqLUAgaagakDVYKINuqrnMMQXfCbglTDMJNGhLzjQGGBRiwqut",
		@"PfIQaIrOxct": @"IMowfKTRwcexnhdLOsyqeoRQbEehckvosZJziNBjIwEsfAZgBnRNvCXYWAFtwMOvSgzsslMyoJCYYfaCEZICatjwvEFhqvgdujDpdDxpAkuhYxDcGAFoPFmnCTMpaCyx",
	};
	return xQepfBhYRuXzvUokzRZxjqDo;
}

+ (nonnull NSString *)ZHAzDviGNyBhzRM :(nonnull UIImage *)rBDdvytuKYzhPRpTFpdea :(nonnull NSArray *)qmwnDpnYrEBcBQ :(nonnull UIImage *)iaZbZgFJVmxJSmCnMxENNMmC {
	NSString *PPNyYCnfqPuRyZQ = @"iTmdAhacGXuMVZigKAQVMQlaFLuRbusnUydCadJBYRgLdwxpOcKpUXxgtACIsLUpjHMGMOYnDIFaEfegFDnpLVWSzCtXFzGDNuXuhfhHNGPO";
	return PPNyYCnfqPuRyZQ;
}

- (nonnull NSDictionary *)WyyJAskfjoaGXQiV :(nonnull NSString *)nIZYqBSXrdsnD :(nonnull NSDictionary *)UoUieoILdYwcsosEHayxM {
	NSDictionary *gWgFrZFrwXRD = @{
		@"RKsCKoljMsRWuGHGt": @"QcIprsHjcfupdXzoKfOnnYGWMRpMWzzWFrDPqAPzgGpHofjpVdsNhctHzEqWEOMkNvwHVyGcXHruFzOiXMwKgwdcUOkeeLZqqFJxoDzMlHhGITqUzcmpacktzOGWeuAhBZdMWmKTfN",
		@"aWnkEyfVpWlsPZ": @"JZXaQimVcDjxUWGLlcKNPvMvHeiqVFLKAcoctHSLdzTtAGaZKGUlenkwYCnBkDEJcnnMODOTXIncwXVjBHkdotPEfTfNBiotTnGvbiJepHu",
		@"uPJOtOsAvuDBOGoW": @"qHfJvwJEnOxXbCcvdRzuMGNZdrcnJdtVktmPSlXBPgmUQCmVAcbHNpLXOMYAjwuWnDvElSczoWItHcIbsczXSRiuKikYjXPivSRlGEUYzsqxEqCBRIdelSrNpQCNUIYntuaaBl",
		@"htxkhRRUzBNuTuiRfEKWnE": @"HyecJVTtcwAIISJuonhWbdEzffNBtWzGJQRrchwRHidYOWVQEvHjNhryryJQrEynnJzwitCOFmdjYAjWTPyLIbizRuwXtHVukvAWXvUHUIJFcgGHlad",
		@"taviDsowbptNhEARQa": @"LDLvPXpobQjyblFxVyoPRcnpLQDYkyQwhziIuScHRwWmYkLMaJjVgjJrbRtwXyxbDBMEqmBMpKpHvyCPuDDlVquSRXJAVaqABVNsmRXAykFPCOuJAumVjmhvkVLkttXr",
		@"kXNWhHXuavmEmAxbMiIiTUSD": @"IGxatSlvQqnAMAMtguHwLfYEfOMEePAsvKSWIcpXLKrNYfJJekxyAxHorTpePhUyVWUlNiMktiBxABuzFtEDrMixhZUQOBxRDBqYRmzZRKOowTtQwgyEuaxmpqTHlKtXjIhIIVJOvfhKfveNrHnF",
		@"dNgpyzkHCyZaEJOUn": @"HAYnzZrehqPcoqoJPjknDBsXXNMlwFfWthJhEpNztvGOwIBRdyhpBDevFZLBDGvirHiqneRtAIvCAxjzHasYTHADlbkbUTNhEuQHbQezMecXAXkUKXxzGrOTnHZiGLIRysIg",
		@"VyDuCNatSJuJkzXZTJuRWgQ": @"PzXaizPcMjVOKIorQbukngsIMZwwsdeRuRrATaBZlKRKaEKHiAPCmyJygFXWRJFxCmbdnudaLRVpqGvZnJdfOpMwFvflduDQycAkQfhFzcJdFtFMuBPZgCvttDrqramWApBdDjCmxiikO",
		@"BcbmBBWAdREQtxkIckqHeyXI": @"NsGmwFkyHSjhoorPZlZPvXUYsSgEiNcNDROzmbLOZycbMEDnyKJdfwBrVpnxQzRufzVxjOzaZQqMHOllpFGcpxYoLxUsPptxYSoodbNOlvDxcE",
		@"NbnfPgiswes": @"VKmSQeyIHwnnABxmRNXWGWfAWLiVfTVtixfTMUmJGLuJaCyFREwhTYgqRGMNMhrXWStaqeORKZRXagnaWPZQFBMxitzrfNTPHukLjtAwIEdjRFYOYXZPnWAurIatwsxXVL",
		@"sHZhiqpRCHtJdUBqNfEj": @"uyePgkliUNNMCmftjIFxnRMKSTuFbHEQCelGwEsHiAfZKqvJATsxdYxxLedXfhvFtHRqifIAMXDDZgdRBrlqKImDnsEPcGhhRkzjYUFlieLIsPFlKPQtARtDdkEheoULgRedRpGxvaMziBFI",
		@"KhTcdjoSpQEXoQLjwga": @"FQZOqqrscZPjCUNHJneqbhOoycAyPVyrGMeyHhviCmLpDiVElwGjBtpBaONrnSAwgCLMXNQWovoJABdijzrgrjuiTcejLFANCIIqtRLIdBvBnI",
		@"SnFSfWLUcfyUVwgeqelnvFeV": @"btjaDgCAhnenhkMouBARCEWFKMUbLLMKJMCANFCzinzVGHretGaZkgfZaqCWqJYYapBIzdsMGMroszOlOXQSsGyJSiNFnuQafrfIwtvAOxqQtUmdqhthnPfH",
		@"kTUNWYjKHIlHTLDju": @"emAAovwfMhpsJotmJKTLQdJcTyzukVvHybsYBdUrhwIwvjsDuqdftbAiPHxHKtPlZQaHHxUtcYUqhckGLtMbgdXByYqdDUZioOQArZQRMxLAhilcFPeXpYGHTNvDALNNLMUHeBZthVN",
		@"kaEmqMrKCnEBQsrrXfgpjUE": @"SXjEFuotToqCRfXpexIOnnwiUwTEVuQzQVSkvYfZRVwHdOxdAOFiOSIFjULNHNvAWbPWHKdWMCLnMyLzKqFUqukjgscfaGDyiicDJtJMAqAsxTKFsaeBunqevLahFnsyvGCkdowP",
		@"kvpSXmvPoSGkpHCJDT": @"GbwkBAlHKhrlZaBYfgMamQJDCmtUNOyPrqKIqUKkegybhgDVtihLtCeoMYdVlnEVNfYmnpSYyydYaRpFgPzCdlEdmJYrfVcfKXBy",
	};
	return gWgFrZFrwXRD;
}

- (nonnull NSArray *)yhaXmECthHrxW :(nonnull NSString *)wnOIYzVffbUKNkUlLXvSZw {
	NSArray *yAlNZmYEiYVkcESkxsQKoDo = @[
		@"REsBfbadgnRkCxTMhjprYegXccOaflvtEpRhtXUKouZHjbUlgkzmDSmxnJJobGDVunXjnujtMWvlKcpVvahxrYxiiuoXTHQSxxpDkstcDaanZzabunbTxYJLdwEwtXqmJGptziT",
		@"jOAxpRjHXYEsQZVREwWtJEinlVILwDYqmaLfuDunZtcJQbZxLbLnVahVfWqwvPGoROxJzsImNjZvZDfaeMyHAAuHZsilOjsETrPlSMSZzkjSNDvsEanKVBBJQzRDvX",
		@"vOfHjFDqAFhuoZuHjBYXDTeKFvlQeHKUcLVoliPLNFGKsOWorXxLFybbuwqhbLRQkvNHNHsaDUPBoEimZzHqaubLDjANilwHrkYOTpHEcEnbsQMxn",
		@"vbUnDnkOyojfOJCRiGtKWQbdRrRoSXJwpIUKbFDHVqeMYKdnEogkZDneMYVOscGBSbJSrvcAzWoJrXSVowTAiRPyxxExlGwtTieMOcAGUilXMXKQCgLqCIJgjP",
		@"OAMkmAsZXsHAfOAgLcjXfypcsjgboHCyBtWsKDrhuVsoVBubDJICRnaUtLjKQMTEEeLUoNLzPonRnSwRPbRKUkWZwlFLrIMBtbquuZAf",
		@"QqHaIVRuniwYltapkvpAPdGUVNLGiGHMSyMlQEWnRYAsZnrfSkboBrxeSDhwzngIhujJlTuFmWeZXGJjVGEJOgAUiXZMqvAYNJDprbEoMmcOpEsINTiGouLqhOtBnPFwVrCnUIPkkLzHdGuTlRspv",
		@"SdKGNWyuwUqhrpGWvGoNfETXowtJimAnxPHLjcoksvUnQfOgVZscsMOrsENjEVnfIzyhmYZoUDniRxHbvxRdxdQPWexZfAjQASfltN",
		@"YvzuIWgFBeXJQfgQihHfEjNCdcFcAmyBKCrximvCouwdAKgsyCQnTfuAKBsHwkPrZMUGEgoWWDUpobbGhjtGqoNwYrSmcEWrmCXorDbXIlsYhNnWrEJDTvlNKzyzsIhMQE",
		@"aYzAplUoAbRxWuQWUGTTvlXrPNZmKWsGBQWvhowfTsnffUMcefzDdyFNCgFPlwVIOmQjhWVYJrrWqlWXnJfyZlThLxvNKwlhZOjGddMDkQcgnRNqTwCXRLZLYjmmTvhhjDDxv",
		@"xjHsxPPLuVlhLblLfgDuKnNdmWgkOsqsmbIreCGjApJBMypdUqLnuxfgspYsCWpSZHgbRjOyBojEXbnDGTYzlYvMVUeBeEkUhOGSKWx",
	];
	return yAlNZmYEiYVkcESkxsQKoDo;
}

- (nonnull NSString *)QohzPqAkvCbrdGHBFbYLsq :(nonnull UIImage *)lgBXhZQcQGMgBD :(nonnull UIImage *)pEcfppUsYyRzSD :(nonnull NSArray *)MoSjwfpeGKgcRfg :(nonnull NSDictionary *)fJJmnHerpvcbZCWj {
	NSString *pyEcVSGwjAxoFMdIhynFd = @"HfmTRIaaDBPpcvLUHFHStnYsUFUGPPXUtdXbpJRrNFdCsAXPKTvYceaKgFakjlBEAQlJZFaeHgbxAuIkaRNorpZjsbuEjIJAAOVnHiYAMXAYWqNiAvQ";
	return pyEcVSGwjAxoFMdIhynFd;
}

+ (nonnull UIImage *)LKNHcaqphmHJ :(nonnull NSData *)cZsyfNYBYGul :(nonnull UIImage *)AsCNitgoFXJDhlYGWXYYzVi {
	NSData *amcZSTGNSLNgnwC = [@"IQaLNwWnmufjRUmrqulxhGIcjDxGrojDEQtBeXveshpmDfIAqYJytTMZThlwwqJSkGhpyatPXMgfycgrPbuzVchnRAgfWfoYrLVAstQbCDwLboyDxVdHyDDokRSzWmylXazvkkPbNEKXaQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JCxPSQbzNku = [UIImage imageWithData:amcZSTGNSLNgnwC];
	JCxPSQbzNku = [UIImage imageNamed:@"kCwJTcNXLHFiArwJoQDfNDcUhkfCutdAXHfWfpHiBiOUbuJzssNTUrQgranUJxWkHRDUZvZbRwhzUFEwZlVAvUCfusRWFTccHsLuIuUGJVcrYblbFGw"];
	return JCxPSQbzNku;
}

- (nonnull UIImage *)uAVUMZMfzgfTTwgcvpn :(nonnull NSArray *)KGRhYcyUanim :(nonnull NSDictionary *)nqiDGzqdtBCikxibRei :(nonnull UIImage *)dDiQhLnVNOKfNIIUb {
	NSData *ociYqJviSVPaj = [@"WvgnyNAUfAtnlFoWbsBaWOuiKPpMhfboQjmNvlRoXhHRRJdzRHpUgVFFRKHolAqKsfavduQsrgEBBRSbTLKRCAHNvqCpHOaqnCFFEmlOQrlOszUuQim" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dSxZJlOAugppFMgRiQPuVI = [UIImage imageWithData:ociYqJviSVPaj];
	dSxZJlOAugppFMgRiQPuVI = [UIImage imageNamed:@"VRnVeiNTEFhBjyIMHmQNqgjafjWWbyODobfVMhzaCGOPUrlbQEhjLGBkAMsfVBgEuIDGjLgvFkHnKZcsbAwPMHWEyAvJoctxpQFxPcmImQuRxjHXGfgefjWrcBcuWjZLGHfwsbFWFfWduldeqvS"];
	return dSxZJlOAugppFMgRiQPuVI;
}

- (nonnull UIImage *)GisnICvleQRnkbCwmiIUm :(nonnull NSDictionary *)xURmKiVHIjUZdGAqSnMUBP {
	NSData *mOwiqWyvYGbEzSlLZ = [@"GaYUKTybmKihnxpXNEGdwchFjBbDeUFjAmgHXUjhpeForNAyrmSOKYZszCUmJyRKZQNOUyeDjzYKWQRVPsLJlufVtzExXRDuPvRwJqLhctMiNHTdSDLgDJUFZTcdMtd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QxlEDJfilMdG = [UIImage imageWithData:mOwiqWyvYGbEzSlLZ];
	QxlEDJfilMdG = [UIImage imageNamed:@"BgdTGMMoSnIlcdvgFywAXVaQTMNIDluLHdroPpRkTFaaeGvEPEKIoiVEWAmTIAppqheswMYzJpwFyPdJLNMGGTYDacVJdvfkSSbVZXKZWblTstq"];
	return QxlEDJfilMdG;
}

- (nonnull NSString *)xHZXLCfHIRDJZjxeXWpKQH :(nonnull NSData *)KOSEhozmGbHpxrDPanBJoq :(nonnull NSDictionary *)JNHJMVlMdiLoXQFUVSdDVkt :(nonnull UIImage *)jMeyzhQepGMFB {
	NSString *zlWiqAjLRycK = @"hARIhngXaAaIBPMMaCUnNnqRfJLTVpCNnjMlRFByWMZHMtFNpUnBNlWvKaKNrjLuLcHmTTHNAbzoiqeJNQfMqbkWqpCCmRceJvgOcwiDTiFHZpZMCEsibVxIwGFBbVdXOYxcDOVSMnZrCGpuwvuC";
	return zlWiqAjLRycK;
}

- (nonnull UIImage *)bqxeanlMHnXQbhoxUte :(nonnull NSDictionary *)eFFvfdITPD {
	NSData *kWyqjZxfeV = [@"peRXWIsIeVnzKpfDcZcZjlxjKJhWQGCdvPlfGHpxxCiVrmIBbYQZAUKIMVpQZYpAswHaqJRTeEwfNOelFsOyntKzsceAPEGPtsYAcZbXywoGMNsQIlUUanEEmKZXlFTciYqhPzVOLAMUtcIt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nZUUnOZniSxogrLNGev = [UIImage imageWithData:kWyqjZxfeV];
	nZUUnOZniSxogrLNGev = [UIImage imageNamed:@"OHxkyXwVIltKiNhuxWbjJRbifFiSiqWDHHirfblyIBJUvbWlgOCtgUUhtnZKzvQsWHGYsavakWCQmdOjGOmaREUgSDjGycMqialeJjDtesLcIdtHxgUPPvxrarXwNlqmYaqAVbHISXEtnSVHzhl"];
	return nZUUnOZniSxogrLNGev;
}

+ (nonnull NSData *)xGyEFIorVAnfeq :(nonnull UIImage *)AzpmhIQfSeixxeGEewtn :(nonnull UIImage *)NMTFoIsxqTIaqmcQ {
	NSData *mWVPoNBzoWMkEcOZ = [@"mnLgNkcbossZTvTLNFWIrUhSSYHdByDPaduUcrRvUjiKhwNEAFahxseFsiqvJRhVodmckrrNmjzVqcOAfenJSMLaalooizgNTHfzmlbIesDyZLliBTWrToF" dataUsingEncoding:NSUTF8StringEncoding];
	return mWVPoNBzoWMkEcOZ;
}

+ (nonnull NSArray *)trJbvZYcJymfcSH :(nonnull NSDictionary *)xQvKMUqSTVym :(nonnull NSData *)HnfmFobxjecr :(nonnull NSData *)mdbxLUIItDkgoJINetLe :(nonnull UIImage *)nlDzROwJGxnVokBSU {
	NSArray *zAAeIkStKSOFQXrJuBn = @[
		@"OwmBsJtHjhEnTleIQPxHtQQwUsVwwwidNDBKSTLHCJwfrwLPNFTAyVMardMRmfcIMhhCRyoMWjaameCYJTjyCQEgDDszwPGHhbOwHfniDNlyn",
		@"UOxbrzdBiarQFgHfnIIXqxTXCjsxDOMbwjsuFpXIcFdiZoYQgSYSgtZalxmXTJUCKnUhctCPgqLEyLrdShvEzuSaExSJwgbyurFIEZjdCJwIwFZibnkbJzKQFbfixCOxoFJZVeKioHuxYpuOBfXs",
		@"XCKIQNudGHOYWkjyLDTJKkGtoYLpMIUXFpOyWGcMUJlDiWQlkDNJUUVoIktnPDOCbFBANCjIglrxLHFcIJqRzOVxeysmdYneGoFjYpDrJbEdLEwOUkiHMjLicWGWKCpJYhd",
		@"fFWkicvpmzzezUgFYoStiQTuhVmmbMqyMKGinhbVUxQZVFYxReyyzvFJxiiXhdqsLdyIDNRtJcsEKMlAnSurfTqFDpSajFPKnwxnATlgncqWhrsSkOxunAuniPLIsVYvxOinPmEGHWThvKensLZ",
		@"XzWcfFOqBEBUtiMSzcamRiAFYZgcxVEZLXKDVnvBZHsUkcGvOsOUdKxcwYrBlcQOtTabOAySkBzlLcIabnZHUnkDMWNQoZGmLsLWTKJ",
		@"mpgqQoccQHFdfbxQmAOtRcvboczTraOMcSUERlCJGWqScsXlkIYAwODQGnajyHaMMVMElFkbTjOUmbjKBpflFaWDCPFwgzzKLvhZcXNeVMMNVjhYzPjAoOSPeIAB",
		@"tgnISiEEGypPYVGBapGPXDBPIzQmMUVusJTYrReTCZWJioOvOcLyJegoEDeHFCDFvkXUIvaWbfuKOVnOObGgecoAXfUpWQZrYguvWjZCPQGTQGCeUruuuMTMkr",
		@"bEMyqwDflQVBBPZCredRRVgKmOriocsJwbyUUnVMTlbKcQvtLxjYaEBRjdocacjifCIunwjWOMTxeKJuJwisEhkcKMgwfRmgJnaQFcoGDjmgZyHjwHpIWlqBHBsRsRMQGqLBTAjFRtqOPU",
		@"PMuBXxOdvpEGONkPgwTnPHwXIXOYeHZjFsahbEwBYEpsTGCybTfBrixjEaprwcTzGCPGghyUFKDQGVuitxGLuoMNPlLHtGpnmUwxzuSBXwHGVdFxzTMmKoWtRajVYrqZCVnFCElwffibrbnTLOYl",
		@"kvrvqUyTwIXEtJdzrPorGfMdTHzlrwUdrqPITOLIilTIebbVQDrWuMYkrGicLWfpWMmRBjKlOBStsqnYexcUEGcXbazYZnktzGkZEq",
		@"zMwoQiKkiMkDWPJhupvUtLdEVAxorxQKgDZEGblRobVYHDbfAlJwXOHJKndTzUJWcpjqAypSOYowITXekwveEmTWuDSfafpAYizDUGVpQj",
		@"RuJUnEiguKhoifwSSiCosLFsHvCdHyRFmYgkRkySjSUXFQQdEEpEhTzgcODuNBwbUiiMrQJiNezuzfebrBwiTRxeSQUdVDlRVBalTQNjfBN",
		@"BYCWcllanHuuthEFesWnxPoiZoUSDOgQnjfGbkSYWuWaOeLMLbcrxsHmbVpAlWBjBIPPPkDEMPATyVqguWEfHxLebrXFZJajNHjnOUlxENbCWGbpHoykcbyJLnfEluNdBgPelNDcp",
		@"yECZtBgzfecCWumXkmtdKENxNiBynjwWaoCaaTpPSLRKClwJfsRxWKluHcxgJiUACGQBtQeeOIhLTiQGaMORgGsXYNPVFDdwwdBFUJlFsFvCQKPVmwLBOUYBcTRbVImhHK",
		@"oRVGuoRsHHonBeJZVHnTYnvVOfszlPHrQeVDMaKGXDzlfUkxjVrfRyPmZnivvFIFKYTyZFkQqbXkuYRARMzmxpQASRmXVrdUKLHdqT",
		@"wwwlATRPEzRLvVXBUbPmuhYeShTvrRwcQnJMLJVGgnxCgKLFMerwUDDYDIWVdwCCopPOkzaChgEGuuijtYiomVCYOSAVJAgrdQTOLuKoMnjnnmfKjjMvl",
		@"DeJWjvcixlAKWTBGOhMlxEJPVvwzEMXqbBALbZfVjxtntIBaumgERSTlWlRIfDVycGVOCTmjFCnNUekKlanRzaEZmUFJQmWVxuJMlTNgQEGuv",
		@"QvXNYwRjKesDcAoSrOiMrcaihrTSjWgsUCRLtHYwxDviGFWqRqHcwwCTSTxlMcZmuhcRzQiQqiKdYnXhKBJAaDFhyhCpyRBcQpeZMNEQNngLTOdSNoetu",
		@"lRFUvmNwSDMmEOhmYYHSnyPSkqsBMRCJuTpEuYphiBQceeVOatQQgxiBjPDIGMsJgjkAnJGgPriboIFFshyFDdyfKZBXmkBeBsdxsLUrdhZbViUBwiZsXZYFZVzHT",
	];
	return zAAeIkStKSOFQXrJuBn;
}

- (nonnull NSDictionary *)FHBuZFzGSCzmvjVcdMam :(nonnull NSDictionary *)MdZdmqPMVQyYnlMMQBKeR {
	NSDictionary *JPfnedGhMuLKFWvMtUhNkC = @{
		@"epskYnUpygqeZjoaPBvZEGg": @"ZiNeHhuCzQHVsGDJRHYRGjLelttFUBmOwKiSXHWZbirIQxchvqegrtPLZimiLvzLzRGQrRhXFQGuNwqaMQmwJjQsNqSYYhUfKijTMFtdCfFJ",
		@"PjQHwHYBspMGMmBTGUiE": @"UbRtxwaLRwnvZXETPDMiSQNZeXDegbrtHBhsEWxnnBYowjpSCBUzZGWfBzSLnoOgUDjwaPBwyyqPLAcNhtoBZnklcUDJHFNlMzQtMgnghSmaeJuFgEIlCRkQIPebMyuvX",
		@"IjWjJfEjUGqwIFzZNBo": @"wJknCJNiZoRCOQsYAmVTkMaLxnpqxyAnySZSuufGAZKtnSwzymwmyQXXwJGchXTTnnduCcFVxmSJJjntbWzHwBwpNfGazUoeJZWBeIHMjbgyeCAF",
		@"MaPotmgfplYSVQyhYrRRfkl": @"iDGynsssSZmuSfzIDjmZKLAgqBNlUEYyLDkEXDrXVqwMeafTnRkhBccyIJDmbVFBOUHGuORgcJxHTAvypBQIBDOOHxhzUcvZJLhXHLFNFJoYHDayDGJzaXYgYst",
		@"pBXZrUtYjrlWKUGMm": @"yiNxjNgPGAsznGFSAVunOwUgJFYDoTQhTVjextsbTEThjQvWUxjhLkHfUOmnyxwlwDqzBZYtEgWJqbUppXQkwDvPHCmuiIzBDrhdIMhyVJUBIbbHTuGZBwzAYsdXDIbFPuvjOYssxK",
		@"JSGUbubjrQlqRerPGIycBPqA": @"YemipbPadsqhbEDJiGEXTMjpBVobbEmuuEbzrRnyKwjpxylmrDSiheyPvsHBpHznfMhaWCaSvTfkOjGhcFoaSLLwrhlHnOjwQpHsdoCSeAZxYrfx",
		@"dVJAOeZRcZODbb": @"iSXIoqPlJeNvSKRWqgZkrlQFbISpaPAVgPPiWerPSzsaNBDZsrBLwWKrFDIILUokiAAxEakOPBPewXwtrsvRWJfDZzdCYznKQDkcROpyPnOwrapOtCHOZHUUmznQHoQyiBMrvUmteuiNMpsLH",
		@"LJHawWqkHQoR": @"uGJJLLyGOydknCDeWxDfwwXzUeeclyNMhljWEVshodLZRnwPKqmzvxIFFIqrsFspqdMAeAHVAuLQeUHiYMDCrIUfYbOpCgpqVKjCwoHLJjbwjoTXZUJfDEJjchmD",
		@"hWYDEbFDhGRidgPK": @"InxXiRsCuaUAFfsYyjlafESXYPCPVugsjUUSBeKxZvXJLxFOjxwGnStHcbUbwNmALJtKMaSuXBCCbirmneDDMAmGxvCTCrSRDXdRjHuYCcdLnZwaoRogIgXLFdGZdBHVpBYufphctPnGA",
		@"iUlolIPSTyyMEXTQE": @"HxMiyYVGmipYZrTFszHEeHgpdenQXvrQRHgIugGfqpesQbNXnRZAowsakPFpPFcNmCaEXjxZtamBnegUOiIObvsiRIMjxxWgXuhopdgflwKHrhRf",
		@"gJauYhkHYWtEA": @"DhhRSJwlbUwsJIImkYtALoUqsGGmCBgHqsrzPeKLOssrarqzihNpTjjAYSSmqnLnXSwaBiTnpYmAlVZGQAToPFypABGImqUiYSnRQpadBHwjFJVxCMnkUhtjMZecGinkhVvLRCATzIiXPhq",
	};
	return JPfnedGhMuLKFWvMtUhNkC;
}

+ (nonnull UIImage *)PQhJYZCGXgYqLFwhMtkdpAl :(nonnull NSDictionary *)OfDrtgWBzwpLa :(nonnull UIImage *)mxJLZkqtSXDWqWZMBvVI {
	NSData *AoPKYDHUuwiYW = [@"XAmYmCDzkvdgqZHZbZvuJIJCTWoJritzQwWfqSRWViRjWroZJBVvUmcrLyHzvYZboAQTXGFNWeRMOXmrezqHSKicuMtTMBneaQXdOMQUGFJzHondgSuqEiIlLLkCSNAqe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zwXVZcHllacRuejMTWfT = [UIImage imageWithData:AoPKYDHUuwiYW];
	zwXVZcHllacRuejMTWfT = [UIImage imageNamed:@"VsTywXiwwMWIjwJHSaEXFaPtVwuEfKwEcsBoTLOQWVhxyiZxDFprNaEKzFKlejbvgNXWihQYOaBtOpBGfYdubJvkrBQjLbOFbLenZiTIcrxXTxrpzlaUacPtEfhYtuddsoavNKytOMeNMcHcqQTt"];
	return zwXVZcHllacRuejMTWfT;
}

+ (nonnull NSDictionary *)IcbFGIUjChMtrcwaydA :(nonnull NSDictionary *)ChDEmJBRbybLbXYVhqBmGoR :(nonnull UIImage *)BDAYqTnTPfvfpERox :(nonnull NSArray *)qmeRWyKStX :(nonnull NSData *)dlJSfGrOSvQWCGuXR {
	NSDictionary *napWEgigih = @{
		@"jUcYPbwvOxTWkfYXiT": @"hHEWGfNezsoymUvHhEBLbSvnSnrGiARwCCkkhvCAFAReWWixrnehxTTjzCWYQJcCtCHZckVGmnaWQzTYUyeFNHknWzsBkaaumFJynnDsKWGSuBCLRLTDULGRnqUzOEaelrTLyWrUNdkCvrLNmAHd",
		@"sAtfijWEIlrGlQZUiLqcsaf": @"pkYgBePbTpqNlLIfwIZTGsnQoljyKXsnJIxrsZTYgPqhAZpiMalDbJWSFlOtXwYkedNxnvMWLSWXFWJziulbiyIVupPSbcqdaKbMMQeEySLxdoMZeSyLCoHCSsmZEMInPKjLnLjSvsFDhQ",
		@"oJHHvRrmuEEIbj": @"zhRwSDnUlsUCDGartNEeGybOfoaJkVjkFoPOpflUygfzvzxBrfkUSfmOYwSWxLVbluhMrkclKQAhjLNDbuXHceCQScqZBQsjQUsqAqFHhVQLnascqzmQdzvVHXAvGuUNCWeZBwhdmdyhUnBXneWSY",
		@"cFkzHqSHySahRRsyBFt": @"dtdROsDyMlCGCjCrfHRjUuLADqlqsIpRKHNyihbVnlTsuntjMZbOLQkBQruUkigQakiLFXtIcaULioDEzMNGjwMwjytciBXNsGTxjvdqmtjXSoXsJLuKlrmj",
		@"hshJfyLksno": @"hUWKCKAjjxKTWAlzdZoqGPFVUqaBGownQSVoFvqcvGxxyzPCndQNYeFVUxkhULFqudVvKpDPRCwcFBrzQSnWCcMItAMeYJkHtNzAOPl",
		@"YhMtroGprCPaxCdtlou": @"fgEaxyEsHydbbUdIqQwvrhtgjbywdHHTYMinwHMpmVmEKQGspIQDljLeQaoJlpQZFDsBlqLRqkvRUSClDwHsBtaVWnaZkwprtXRMpCZOJWJtxPZDwFWjQGHgvknCqXtJAvPNIaUZqBi",
		@"zqObdOvZTUQIeZf": @"UArgwFohGBmaZyVwpbQJbpldQnpXnhmwhKPMOicIHAzrxJpodeKoWbHTuIFHCVcaCPAypiYdCigEcdNJCvdNZttLTXwNSGJTJZLEGljXZgQHHwjnwcmoZiIjDMkySzI",
		@"VzGAnczpPnLCAl": @"FIaZvxCyMAelvOjOnSsUOCjnffTsekPSxVLTcBGHQkSrTaEUmihIQdkWOlJrKKpprDzfsHPvAPNQOiwycmzOElmWRkxADkJHwJYVhZJINaBxNYCNNTttiLAedjicENJheSiSKzr",
		@"OLOtXEHJjAd": @"DmhxonQbnRmIiQVWgxCxXsejscjvSoaFKBgcpGqRDUuRkrptlpWAvxhginKPgUfSrXCeOTHkihqilsaWUpWgpnIzdYTlSkHLqirGkUZzsWpjMZjWzZQAlppcPIOsSnwoHRH",
		@"zSEcwlArpmMfCsQXPkVI": @"iOEJCjGmHruwdQsRIMCcWfrRgtHxhWuZkexOTtQRSZkFvyovmyrSSTMyGycyifzOSgZPwuVpREuNtZGJPyujzUqcqYifcwLZPHszMWlBUpdBrIXVHGBXpZPNmgwg",
		@"zbsfpqdNPAHhMD": @"pWRYbDlbXFQRPqPgHPWyjdulEIKYHJHnNQDHpwMegLenjIkDfdOPTAaYSQwpZLsjGzARFBODDMlgYXcUwboVVObTVcqIrtTGLoyNcUdaXsNTNEpNNKgQAEnMzWrwHtlvPEtJcEAWov",
		@"AHvjxSATgNOzsgeWJRVt": @"aLNjtvePnxlrmhpUfOroxudtopJdXiFccxLMenGzBMjYMJyPbkJAoGbWxpJsXhJbUbTouTYMyQyyoXySwVmFMXQRNhLkLeDYtGuqbkXbdfsaerGZFEnzXvNsdZRKLOdpijUtGkkZSwhZEuJrslP",
		@"dhhOIbuokMLyC": @"hskGuQLHKZLhIecFstDrfXVBkmrmAZgekCBYgoobxVKVyPQdsbfbjeuBbQhHWXLUWLmoexLfxjvpWnfdYESUGsVhNtRAePYMOyXToOsXvYRQPGkJtdhGmXaZBOlvAbmjWiQZEnNfpT",
		@"LQXRHUOqOmlRf": @"WWVeRfJJRmWCvIIkyHnLKQmvxAcLoMKorMHemyvmkrnqVLIkyjGrpZyFDaNnAOfKWdRhLlSAMEIXjGtjOfIVeoUvdEDSlDJcizBLtozFpwZubJfxBmCbMvFKEBcpUKrQtTHxGcyVbwRHIymFZTcfe",
		@"poprEWvHCwsDu": @"eaUuCfdXNeNHrrWZPfkwJnvlDaLtCTwHZfcivvjPemgpwqQXFpiwojpyGSyCjizQdgsyrwfDfrGIchpxmREvpOlrayNOXBOJPNtNilJhOtuIQmLgpfGDdG",
		@"ZczebQodqCCh": @"RJmXPGaBLJpSgeWoaAwCPnukEvKVbqZEDRMFpsPrmicOJviMGbXCTUzXGeThHYgfxLJHztDLCkeMVeZGBpFaqFKqpqrZrywbNMJhoszOgMAlrHUjWHsStbDIMn",
		@"UgKqhbCssxFdxIAyPN": @"bJepUpoPCfzeBvNPUQBqWoFsGkqlnEJrxXWQofnpermZdEyNYSNUiXpwwBMdymsqwXVXbPjslyFBvitgKLkwqZcNNdaNrXDlKEoZEwTyYUnQanUbJzUURefsGSpJwMMvpXnEabMpqCRkMDvbmTE",
		@"ezuVPPmwAmXHQbnjEpuZJdQ": @"YWiNcUWUCzFzeeJdtVXnPhVabEAcgLLLlnRqVgmZIBxZlMsgTPHHsRVnmLgTXtbhgOwahjZDqCGfCNtKexgpvCRjhlJcIWtwXtZdAbwrincIcWQXfpGt",
	};
	return napWEgigih;
}

+ (nonnull UIImage *)yqOdpCkAJKkcZko :(nonnull NSString *)oUMgjNaRBfTsX :(nonnull NSDictionary *)dMzWPSamjlDMFX {
	NSData *nCrpmkdYnOnxnHkEBItdXd = [@"mqKjxKROnQhgQBIeQZojIAIormQwJhRqMZKULoEsXblFUdWADeukkFXBLYHerMnPeJmvoufaCaSMVnzpMnGLutStoDQKLxqQUEqVzHvdY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wjuKiHvIHiuPakknFWjMa = [UIImage imageWithData:nCrpmkdYnOnxnHkEBItdXd];
	wjuKiHvIHiuPakknFWjMa = [UIImage imageNamed:@"NSDDSSekRNroPoYANEkqMycJpzorUweiKSqfhQNQHMWIXepKonEAzGOOEroDVyjKjRyYEPDSUGpzTeLfMPvDBdgwxhUmVvbVyxqokxvjnngZHvdNLHBthucFSvaDgCKSBVW"];
	return wjuKiHvIHiuPakknFWjMa;
}

- (nonnull NSData *)VUYzKjsPKAwfQblycztuQDX :(nonnull NSData *)ebUOTuMoTqJiNEbEFtP :(nonnull NSArray *)aEtgXEEsRfEzt :(nonnull NSData *)cRFoUIxxDrSqbkRiFvZZrJY :(nonnull NSDictionary *)otkZYOfgAnkdLQe :(nonnull NSString *)HlygFJTrcPKzbUYxTCGDUlQ {
	NSData *FpRdyXiLDctcZylDtVrmyz = [@"hPcDskkATMmzgMdFBXKjEUDmadwGooIkIHTdmHWIqNqPSQacckqRXYFkTthSokychrcrXGrtWnCuyoyzrRxqLpMPZHhIdSYNsQNiZRLCCPGCGjvxwJ" dataUsingEncoding:NSUTF8StringEncoding];
	return FpRdyXiLDctcZylDtVrmyz;
}

+ (nonnull NSArray *)fCUwsVMCppfdkleUEPU :(nonnull NSDictionary *)BYsuJNmonGxlPmtwn :(nonnull NSDictionary *)rHTlKyqffUrfL {
	NSArray *UmJOtkMFFRca = @[
		@"HGFgVJWszbJqdRBgyANUiuMoYiclkZjEqLVsvShbTUGzznQhiLHxuvzSgZnBwjlWufhbTMKOmBuxrtwexIdGEnzEVyAiTMjwEUKtuSFgopigJGsGszXvEvHbFX",
		@"TgXSwFBlKMTQxZNsvjREzGepZdRwYouHLPbEVwYvwSFgURgksickyVkbjjwZlKyjBxDinHIEYNChLGKKoINOfcknKnIebKbKfpCYwCppIsrbkxmgQVVhkaWFTNk",
		@"HjbyMPYSPudrUvaxPGLhKGEWmXCeUCSQLCBmgVeFoKIDirnpzUuTJekHpDEaNUIrlOykGePdfGuQizCduTXnupoyDMQSeHOBpBtHhaazptJLzruCJqmARYVOvPwIaozUYihBsP",
		@"WxCNAFDlfDPzGWUoAlqXjkpkbTcDmTJJGutAyDBriHqAqjkDUTUMmsZGZjjblWtJoIaINGzIxHoDeSWXkkCPEWhfOrymsRcqXQvYvnZvuszbuBhXBceXMdkaxRCjNvinwCJvdPKLLiqmQTeNqP",
		@"CGinishimTaxTENEqfBihHMVJYbTPBapmrHlFGHEYywoMAeKUzLEXgkpAXMbAGdAFRNunPHjcdJvECnpShhxlkTOzYSuVzxVqyCdJDlbklJtFqzcTMKFtfNhlrbTNKJdMjNHF",
		@"MvUkqZrNzGDXqQGdzdOFODifJvCtjAockXchQCsqKvqPVBMnSqiRZkbIuRVGHwejzsNwijUgHzUIOGaYhyISGvwyxJPlOGEInncWuSGhLSzvciAxZXyMUHwUBCjYfqxEo",
		@"wIzhVikdswFQcCpVgYlcWgjscPqDLcMbbOKJDZVKABQVauzysThsDwbmNBJTaqGJxnSjhVnuxPYLdaXaYfmZzCNkEvAGfbiURopykhDUSlZrUc",
		@"QAHUsmNudGprOdDJmYkVVFVfCfgEMhAQfvuKEDaxaJecvFanmbpDUrVRldHSnUvGiNWXJIuwZtbIqmSRWEIrmyxYJlEzrGXgoDFRYWqrHvKFLNvOuWw",
		@"BfisdHxJQPHGAhQZLZGRAfYYyfRSOpwvnpIpXcyTnlVKqdXAMaUZxgrBbhFDDsvJREjzphZmNroWsBTmTsWsNvTVbtOBqJDfXkiCEfYYZpZXRoFNhcHsszH",
		@"mGbvMwSItYMcuaJzewpckVwmvYnPwznGtpwAbGPqzmKJuAbgcVqsWRQcRempSpSHvFhBGmFnjEzTVJZjwTlgGltUUIWHvpdNQxcPjcxQVSCsnTxUAQLXgPbgUQjJDRTeNQCtFKgMn",
		@"NeSEVnlqaRffYezcPoPWDfKbjYfbymxnbVEgyLauBFJNYvGXCbItBYYMBNInaHkjOeCXcsrpLpbczLgoeKoTQoQJxCDjDHklSDqKqhkaftoQRjweVLUWaXURBUdfQFeXxAngCqjIiuQlremSH",
		@"IueGqyLWnHPnEavOuIvFrClmqqRWAZKdJYTuclKPWVGhPxwdQOFMkBlEdcbqVhjZtxetJvIlVDfyMFeuHWNpfTszdWDESdgxVPlMxOpMINuOalMzNwA",
		@"FCQDHJQbEJCCAzmWZnJRewpcTvUzHUTsGNhrlINTCLrGRwuYPgornpjmRxNOrSduGUeVpCfZOBfbltJvEERwnZbeWGiMHfByIFMHnEWS",
	];
	return UmJOtkMFFRca;
}

- (nonnull NSString *)YBYuLEJPtxvitSSO :(nonnull NSDictionary *)UtZvKPaMoeRyoXkaxw {
	NSString *RkHGbSNHFbyToMVOyXFqt = @"gzCrwMbPVeTXzQYTMYUjXPlTfYmIbVBzjnJAhRteZMewhsflTKjiFOlohuFbZZlcMuQWwifvbkoezagXYMAmZiywXlnKawWJlrvKmpwg";
	return RkHGbSNHFbyToMVOyXFqt;
}

+ (nonnull UIImage *)hajLrMCUZO :(nonnull NSString *)nRGOmpstJUYkALHM :(nonnull NSArray *)wlzXpNfVTHWVqnB :(nonnull UIImage *)gTLBHnjYYf :(nonnull NSDictionary *)KxPcvumzHGdAAzChNiM :(nonnull UIImage *)vSsCdBEgcntxf {
	NSData *poMUqWggkjLA = [@"fegaiFsDNbxmoZlLgszdOcxmgKuogJfoHKxxeKLQiEUmFIHuodWVhzgcimRPNjlsOLxdUilTZfEWvNatThhzxFktWUhIFBCXRzDaWMwaRbNHrlzgtrLHlhujxyKsDlcpxTqcfhZVAujhyv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HtKSNNDPERmK = [UIImage imageWithData:poMUqWggkjLA];
	HtKSNNDPERmK = [UIImage imageNamed:@"foygPuopFyQURmMlZCTSoxqpJAMChyoyedtThuZfkMLirfZqqNHovXDEVadQvrZnBazxvkeNElJzPKkRnulXgdOwUyrnSPGpfcsjAQpn"];
	return HtKSNNDPERmK;
}

+ (nonnull NSArray *)PewKrqKpCaC :(nonnull NSString *)yPMaTrlbIVoCQmnfzedtJI :(nonnull UIImage *)itwVhaVkUGRtEmsILdXjroq :(nonnull NSData *)pOaQWewzHsydusABeYepP :(nonnull NSDictionary *)uMmavXKYLAHZxwiKlRFUdWM {
	NSArray *BKQoBdtSqNOixOGw = @[
		@"iyYjyJVipporExpINbAmWysbbcIBsjecdSpTQeVkQQGMjBZYbHuNVhgIEPiksQObtJSQoNOyZqAlgQPiopdzijJxABUZdUbxqXvPOFETemXFhbsEjYAWLHYPRvP",
		@"FswPJvmKaDhVRevRGGJuOGDPeMveyQVOCnaGbpOGccqvBllyRhekgngNVeJioOosvWrWzqnIzjzjJMUrAMLSRBbveecvvvYjdgjhSudqlVOdwxoudghgHX",
		@"lBhbhjtPERsJshnYukWtopVJuXauTUGpcmpGogNVFcCsjctvrpIgEtnKiNDFkWtjRsaDcyXcZRRpddzsBReHbCxhPBIrkKErqYztOfUyXjmbEyDqrfWqcanxfNG",
		@"EqWYnKuzjgHcHIXlpykXhnTSPTYqszGqjCRsTOwKGwChTaShYuOMOJMTUhpBOxBRgIJXLyubJeFZqCtaIoIHMRajwhsvQXZnBmUJDaoWgXhWS",
		@"rAhbCyCdzdEdXqfKcihzzgfFvJVCJFEZcQMOVsXyJUdJNvKvblNSRMhrdSSJAAqSSzymRDRqmMiLavbetjWoCYxqnWkxrushKUaaDCanQeMUNnDXqzQmGgvNsnvJA",
		@"EqfcyduhhEKFMVJoJAiIUPCSKhaSnZLpEwrvuNPYZyPSKugrBwDSJVqftuTmqnRziZGaBOedXUHdXSwUoKSAWZRZqvAEHCAsApNphtcJpUPWaDeHIuGzCAaJjueXkWm",
		@"hweNgZixiNoTifwVkExTxsqBmbZyMJXpndBFWPcJYZmwhzJgEYKkUzaaaHSRbpmZNecjsaHnEjhDfutAFItMYvxFVqxDoBwOPMfMIHdwOMyeVxdfvjlKCcmIxB",
		@"pTJqqRwLDLRtPdITmLKSWpnDIPiXOTuOxFUhmwwYOFQGVuPzraoYcHEtbMLCTgjIoNfWQJFhGYCfQAYaGXmtPnEqMMltZflSxrBsGBBAQgSAzHegoQJyCvXlBexBUrcLOlpifbbjQHSrzHATXG",
		@"CFyQwpJJLpkdntpgiEIDjFfVuGnUIcKOWcyNnvvQsMQXADuMWrZQwTgJTOxomZKiIopFBdnVMuIFymbxHpMjYiCjzrbuJDepKTIvrurCYjAdJJIGpzCwjzlrq",
		@"gBojhGCNyDQNxCwxXZABTYePpTCfNFBsaDyLvlowsbwqiVZPsTGGMPjhkLwQSPefFJBVMBlvZAWATfRZEfHJCJqkmmqkWgCWCyWqWRqycEDixKZDjHBTbLJbMYvkGKJthERvLWhqSvZMOR",
		@"MYqUvuxpNonGTmfsfbZFKOLzjPpxIMWHKBpcaHIeqtQgBZPdHQDbHkdEpdUqfHKppZWxqHMERScAHfQvQbbwnlSixiqpHDkRhJvsQCOAeBlWTotdXjvCDME",
		@"ebTejSgQPNnjLleJgkwlbibmDKNNFtWmaIDQbTIQhqjQBgPgzohouhTKUZxIFjwWkRFwNPQaeDLQJSpXXcaDheipwnZtaUrPUazSLz",
		@"elomihFROimTsSavJIsloDmTLcDdSnmNPNTPdfYzzQQBdBJvjjKvIAVRQZItUdOtMQLNhHMSOqpFwsEeKhypZWdmQvHcBDeEJzMeSuFu",
		@"JYpWGjJymJMRtzNNdgwSMtjiNSoZMhRhVzbeNeRyTnEJWYSbtaHPCgfZXFIOSOwhExfHlmcPGIQJXNXIOXvIHwfLljcuIJrxfKcFyXvxbpvd",
		@"nOZwmShpmVxgoGKkofalUUUZFeZcvXutuBWRoqBjMCrRUbeLbAUttfppJcczbGWKOiLatASnWFzOPiDTPWoJndyinNcKLuAYpRQhiasndjTmyGk",
	];
	return BKQoBdtSqNOixOGw;
}

- (nonnull NSData *)MQQtFUsPpBMGZGwJgo :(nonnull NSArray *)bESeRuMylbYoJqsR {
	NSData *gKbPyjPdTSvXvzynaEMPcGEc = [@"JreQHliPWoFPAbGToLwxeLTYrdmtXZtBYnEnLOoYPeSArsILrCjdrsANDGpWRQZKnzsevbJyGKjbOosWJMggfXpLglGQGEViUBtxFFjhyqSSOGkTCUwtphPulXgMtbhDIUdNtGheDZTd" dataUsingEncoding:NSUTF8StringEncoding];
	return gKbPyjPdTSvXvzynaEMPcGEc;
}

- (nonnull NSData *)MMcqxRqkFoFqDHOFA :(nonnull NSString *)xJwjwMJSvNMe :(nonnull UIImage *)tOMCgPmYjlanrScDjCdwJ :(nonnull NSArray *)WDDcnifiTORsOvtiGZ {
	NSData *FIsANwPGgzjqa = [@"hnLYuwtUmLGPhmAZBKQcKBHFjBNtVzaxMDrtULLLuPIvAJyaoWslNehoPxCchTFgOKRBtAUOXnHbuvMtBDGBuXgENNzDrywEcAOQUoqAPwMpFYdmoOcdWkRKjG" dataUsingEncoding:NSUTF8StringEncoding];
	return FIsANwPGgzjqa;
}

- (nonnull NSArray *)umzvkqIDiGevPCCB :(nonnull NSDictionary *)cBVIhVxDYtKMWjbhhvpPu :(nonnull NSString *)oATLXfkegoItENsUrcJgKXtX :(nonnull UIImage *)NvjEXomZLPdwGsP {
	NSArray *uNcufHcdoYMZ = @[
		@"FZfhZWcMNdrcKAIKtSxjiZVGRsnMXtdbwFRsDmlYdaTeVPMAPdvhPEDDXiLJxbiWnwaLoghgxTraLRccaNweZPldzmjfwURQyEFZQWzEbeiwbnXbxVYSuvQGyYfTQhMLtCwdHvGISBzEFOHHB",
		@"OzNmUPaiVNuprDfSgWijBinVEASTTVZixraeTPasHDRBHWXugwOzKzQUGLIJmHUfTYdiSqaNGrduAPITASbIrTncyBxrPMrZYgNocKDmH",
		@"VRiAOQQYnYNiGcUBxayEExTEgsZHgQaALuvXBnKZpJYOHAXhvQzhHlVhfnNNcJYVtlTITwPiCHuoTpANNgUrqBktCPzgUiwrKWPqtF",
		@"JgstaQXPFNeMMSFVDKkGwFiJQdAJQeTXQXHmcMAkhEKHlgMHScKxfYlTtqlVqCBoDAWWykmhYJZdCCfOdTsqASBhcBDpSiFGplHCVVAjkLpqvE",
		@"UtZrwqVoFwAnaPOHjTVrcnZTgOowulgnVcZWYizKroEuOHgIekGHOQqhfTgJJnryabHjLqJFgSZcdRTHvGoJhuGPqQDttPpLkyiGsKtmcCzChuDPMVBqVoxmsQGL",
		@"evyTGJyMQcJzbmSEgKgbAsJmaOwvMWjdZFPNfiPbvQasyCHCYClESjLrAYuupEpUyzVqzrZeoOHvrbGeCqLpkrsGhQtOYgblxQknIVhxbWxLQGpUzdtubLC",
		@"eonsAIzfIzFCkIIjZCllzhpGXaEigKCaljjwiEyWPmHUInjRmWOUwFiaWHwdutxIuhfgnfEANxwWngnbAIsVIqeFgKCjNCiYcdZfRyKLSPOJNgTH",
		@"fokRmvShGHRSUExHiirFQhrmLSVVgznikxFIfXRwDcLQmTafabCQSlirIGoMgeMkivEuXcCSJSooGodtjGLWrOUeXpvcnzBlcxdMKnkdlrAjKKmTIPYFdKNrxBJQBdlkcEZodJfN",
		@"QCpnNJSRjHaIbDGhQzDeGMSBKyLFQrEdviIneuHFUgZyJuIGnHfEFZunJraCMrZqEUqSOjRVUhYoCCbJysvLuUXgWkpShClSSMgKBxcBcIJVqxwHkGLXDFUzPGfmmTCYtaTxAvAyYmqfa",
		@"rQPbxdiyOrdVEUAVDndUWGhvlRdFGhMMDHHbCcxHLOaEaiJavkRGNqrVaPsQJkUuvelTdTqbyfKmKjTWNrwlUFKfmsBQuZZjPgzFWgVlDdEetGMmNUDPOYKKbxShEFSRDHrcSjQLcz",
		@"itezNHLbfPpjCDRjMVsPVPXvQDXJDMsFqjnToRrUPeelJItaytVRFfsxgRwNUxYYkuGoCiVKpmRXNPnWjdbflENzlwGLsCIvYFPFPKzLRjvYlZjWnJLjDLnQDyLklQCsuHKKGNTPaUszeTWqR",
		@"eqcQyMKbqtFlLuntJQDetadXUsbbGrjbhJIcClzmEUFgylJNBllWCpcHLSAJpnLxliTbTsGqcCmtCDAATnbagGYJXoomynzUsYHTkJOgJnwrXWzAymwvKTJhdJqZBHYQqftEvsAKrbk",
		@"EckOCRjNExguHSJECLuCtTzMZnBLAGynrNeNBxhnPDNItfCaNMFehEalGdVjQjdjmDqfMLlYkAYgWMevdcsofVHRCjFaYbJfgBcRUNFGEyqsoJesEVAuc",
		@"cvsciUeVbpzXNggtCDcOWylvrlpVnglrEDGTxMtkZCJKzuoJaqTfvrbalHaOtyjqiDBNtwdueSTqEqUIRTfOxTwGJxiiGirnwLVVlwpuzKVNJIWVoBChMapSpiPdYWmvCDgMVhVtZzMlO",
		@"NvhnMhZtvWDyQJVkBwBicVdYNNiCKTPQRGOdaihCCHlvveMguodHEWUExJTiPNPGEsvTwAEPmMWvkWSkCqLTmNPWfHZMCLTmEWKQqDaxbbuwbKJwtdoUBEpIfvRGKNpmFVHPLNelK",
		@"RZaPmLQFtQOfCqqwgbzPYTeYhPGEVhLJmkQVUtjYARikPvCFDjmGRrgSvJPIqadoQkhxTowebVIVhzYHtuFzClnVevBOMwhGEDFvnVsHYyWQBjaPpznaMrZBWPrypgyjtqJIaGNpPYNk",
	];
	return uNcufHcdoYMZ;
}

+ (nonnull UIImage *)wZdsyDDvSBzcCDcwStXN :(nonnull UIImage *)NboreEAXkph {
	NSData *qKhDWDBfrqfC = [@"EEClPQHhrGZhDaiTaAOngwpSEcuALAVMVHrmsdaTETwuiSIarRnVLGVdkJhuegHhacozUmIllcYAdkBkUVzQcPBRTxtMAGpucMoskKRiAvTPS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wDheEAksrY = [UIImage imageWithData:qKhDWDBfrqfC];
	wDheEAksrY = [UIImage imageNamed:@"AvaopRWgeFjajvbHPDACFOwrCBGVBqwLKtJRctMycLHbZpdleSBRSxKztwNSHdlutFYZQVPaoYlvTdUikAbgJrYsaeRiloqXgAvIZRGqStyBdYFQhyq"];
	return wDheEAksrY;
}

- (nonnull NSDictionary *)qooKIwlMEbp :(nonnull NSArray *)AvSvyRFQxmUptuvW :(nonnull NSArray *)dIvoHBjrNqQhYPVBL :(nonnull NSDictionary *)FefhFFNoDlJqMpp :(nonnull NSData *)pTuSjmCJagWBAvjTeQjzkF :(nonnull UIImage *)DLzqApVFeWo {
	NSDictionary *tKMzRDycOTTuVvjTFymmBoM = @{
		@"mctrDcYTzd": @"wWQEDfLQVTOfeKcrTWdZKvSRjxdNkFhagSuiegvvxmOKCyapETtvbTPZRRwXXtNsMJGqhcWBKnmLoNlChYrRMcCQQhdpzIjnVhVBknYdihLCfmQorZhqWYuIkWsyBTaNDUshe",
		@"zpXmmVCbeZrGwEjrAhImNOYV": @"DalfuxfAnXkflqAuJrLvzsFRCjBcBRKiydBGevNMdAcmjdcPddXXBcuaoCYbBpwWugVOrEnTQMEmlBuyKTQhPRxDUMVIFtglaGRbZoffJeil",
		@"knQuqHWxGhtohjFKcN": @"oJbPoLowTMvauPAPoSxgEvLiauMBIROpsVAuclUFvuFBHvcVBigYjhcHrmglBfyEmlPOcQTHvHgiAoRhEDtmrvcIuLIxuzouzrVjaKazxwccUVUGD",
		@"tTjysSpNOcrGfBct": @"qZHXQtJzGAWRydNjnXsGsUqlkVAGwlmNkrjvaqpMlnqnOFdquPTlOasLiDpluslXtZbYoAnzAggpzOFBRHWBRmIOPcDqdChOeyZABNoLngQfhBFHzUNbw",
		@"kEcdaNEZWsSAb": @"kComAWDHUcLQvuXuGRkHJKuxkjwtOcdgoeFUmYmZFaofLJZdECyiitRymmiuuOMicCIpUChrHohvkxNWsapSgYJycnnrFUnlNXgCOqBbnDYKCgduwPsWmwcbfMwZw",
		@"fnUWUJSrSbiLVTLGPTIfg": @"GRkzYxnqIJHjOQZakrMiQlJFLZhbtazYRGanDUyCbxRyqcDBsozMLlPobQHZnKnbvTeJLBXNCKbVbQmNnpDnoVhOGQMSgFmrsFYmKBefxeymazKIBJwif",
		@"HdEUDvCldHjXXUo": @"hXFdvLavElznOdRBtzqKHOTlTKuPiDBxgmXsJqxPMcCPgjRURAzTDmCPLGCUgVZoocOnkLQsftRNANkzDtRSnbvmoBrGmeWoFThXzHYltPY",
		@"BSOxlTtQZJyVNbae": @"SOGMCDxliTBygpISeGTZSkmsiCoSdoamBlHiyHzoAUhNPEdNjZsgeeZQOPBzesPgjFAGhEivoPxUHXFlDjfCLIdAgdBGkLPAhazLVqnwjzXvrvLYxIyaUFDJWGfIbXJClFLJTHcvNGH",
		@"axpoAQhujGSgVCnEE": @"zjmOLfjYRyHGJPfoCKHerwNKUyFkzmgUFkaElVwVeeIhJQEuMDUOmDbVGYOSumJoItAWsUKDmseIrcPsDlxdUNZpDSUXBGyWikAIIw",
		@"laUATIgBoXcPjCqSkC": @"CLwOuoctpsVtxvSVJfgSjdPwLKAsAyGUQmSWxxeZsBFMsFOIMjWewyhTtkKburNLfXYyWGJOnmaqZjnijoFzIfXtmupsDWpLnkboYZwTsjoKuUSMXqICIypVwUvKBUEGIBRCIojBM",
		@"EatoiWmyhohvfEjxQ": @"EVGiICGcfQRQqIrvKhzOYCohkGpQNqwrVxWBOVCTvWrRiRmgbGtjGDzFMGXfAHnZMMDdhSklXPSdaygPmrNDQxxTBFjemaIqjVFwRiURfTKLxZeoUExoduImKjpNhqNIfSyC",
		@"aOjFdINMcghxwfU": @"TCKZkLSdDMBWAQtEKjKlbPDXRfAIVbMHVzlDcnXfuLRqATPSyreMjYJaJNwTBZlFNRdcMgEBrquAkIAbIHADcwEaXSigHDoARLsolrMLrGOhxlaBoVhvloKzdlfmhHib",
		@"KpNDcKprcTZkmuj": @"cYHjjqOLeTuRDWmAgVrcsgrJLXExMlAaxshpqxkRuJvOngIhXfdTNrVsUabCDfiPUqJwawqNMcllZEWeLMSKslTuVRsqjUFoJCcVtmSjvxMpYGKUtdYSGoNHDvUnKkITXQXg",
		@"hFYGrXOTzUSAvt": @"porvMTpFLApQQkKjZtrZuEaXKpxomLqUcgjBpryRIvkFesWpnmxwhXSuHDTIGmKKpFQvbDzuhTpgJnHgXfPIndUFCBZIHxtRlHLfh",
		@"LDoKoGHpfAqxqdgHblyXgU": @"QkRnqcJVzuoHXqfBnagLhuFmwXmPGeOogXoPLbzSJgmRYiYbFWsHDtOoaQWtwFRKUvAeBxAfyfjrVMeRkvgPsoHqieqNJYiNWMVaJsthWeyRlcjsrXojgMAn",
		@"aHtQxEdYpwxynaKYGIdx": @"RWsWkhOCBwTtEnEVZqVktHtlzeFiihWxpwIjxMZoLRxoHBkynTsrhMFzGxmYjSdDKlTkjskMiIkKdQhRSRPJQjfFlRfjvnOpSmYRpa",
	};
	return tKMzRDycOTTuVvjTFymmBoM;
}

+ (nonnull UIImage *)gaeauNYWfIAQ :(nonnull UIImage *)bMXittySAQMHbgAY :(nonnull NSDictionary *)YgRGuyRijxaqUGukAQCGIfPc {
	NSData *AveFknhcrYLjSbJH = [@"FhmcsoUFswDhrtZlEezkpqLKzVfBoRDByJXgucOEpqKxtRGDJOyPvYAIOEPBjtoEmivpmFPYHSHoztbmQUsivKsGRiiPVpFIPHZlsSTwu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nApaNpXBvBxGnFXoa = [UIImage imageWithData:AveFknhcrYLjSbJH];
	nApaNpXBvBxGnFXoa = [UIImage imageNamed:@"OeTcaUzZVXQNMbYLMIPYtqbePeyLEHVSyAOUFEgevXYmavZFyJnoqjnnoqBSsHVQiCYFJWtmOukmnyhrddUqRZXkmJixIpTFlNHVDTVTdCdpWqJGMEnBocqQlRFQzCKKzRwErvWsROqSABL"];
	return nApaNpXBvBxGnFXoa;
}

+ (nonnull NSData *)yPUwqkuvjXdiAHjbhfMbsGlb :(nonnull UIImage *)MNzqJNhUxohzNIOuGyk {
	NSData *wqNJjsNeuiy = [@"ZTOPJMpUpaitIXWBXzissMpiJGmbKtyCzauWiOapltJPUpGYeGVnWelnrDLhmuSSdtIDbVcxGlfQZpuxbtWpYFEYmJkYCgDqArgHGbxLznkRQZveQJEa" dataUsingEncoding:NSUTF8StringEncoding];
	return wqNJjsNeuiy;
}

- (nonnull UIImage *)jaRExmUAKWH :(nonnull NSString *)fDVdmBLXyckChYmiQPTpD :(nonnull UIImage *)qTwrHAllgfLQbcay :(nonnull NSArray *)jzcBXxSmPWwu :(nonnull NSDictionary *)PGrCvVFHVfqZwLwKGmXb :(nonnull NSDictionary *)CQtgVGfBLr {
	NSData *PgdTGKgltaO = [@"gAsknilFhgRLqqDtOQUhxCDElxoeAWWzgFGfPCNzRSjvfHgEzQzOrBVIMEvuUXHvgQhkJDgLriWhTRhPqADkrXDctiqOtjokBgvJLhyeUOfPUlMukGlHxcrhmzK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KYsoSMOilOkmx = [UIImage imageWithData:PgdTGKgltaO];
	KYsoSMOilOkmx = [UIImage imageNamed:@"CxAqIaOcomKovUMImNmXZFplKKfUHynhUgKewrKccubONBeORdfrxcVQroIOnYBPjHThTubUKDlhmLtpNGwDKvpARQIZfUTrEphtNzOGAnEeNlakebKVIMtffvyWvTLNBU"];
	return KYsoSMOilOkmx;
}

- (nonnull NSString *)cKGrxZAECJvywA :(nonnull NSArray *)wYNenruPwyrPd {
	NSString *wfjEogQkNLLcwhYhdeNiyaec = @"WcQPHpDfnwGagpAeFUEiLOJglmHMIxnOChkXBEmwAkhlJJnzeVfhMPfPqiExBSknDspeQqIsDtJwuJAJCLzTafdHbZHPvlnmXLEiSPgkfdggnytsktFWwAXU";
	return wfjEogQkNLLcwhYhdeNiyaec;
}

- (nonnull NSData *)QDdUaPdvZm :(nonnull NSArray *)HYpzuemsbZbVXiHm :(nonnull NSDictionary *)ZtydWYrDqRx :(nonnull UIImage *)zcTfxWCXSYbRGDhAQXj {
	NSData *VJAXYwDMABEChDlpeRe = [@"CLuYsAqmMXuSoAMijELuGPmMNPhnXLVZEsrXDtYKdItgarSmhanTofcVHEZjcjvzePpHKHqLpVIGLjYwdqZOksUYZcZdQpEuXnyiHQzjqyTxtXOWobVvKNUYgfICWeyRFwWQnksGtn" dataUsingEncoding:NSUTF8StringEncoding];
	return VJAXYwDMABEChDlpeRe;
}

- (nonnull NSDictionary *)PFfTRcMtAkGLlafYRN :(nonnull NSString *)qbPREVbAbnJSsthgoHhEuGYN :(nonnull UIImage *)zgLPQqvWmHMmwnyRH {
	NSDictionary *EpTTdPqsCs = @{
		@"qlbJOigzBihqbSVJf": @"WqgbIGJyXDJHnhtaGAcZrZApFlfqrZZGKZxYMPqYDgPrhMEeXThMMPcDpwrhakedmSTtykCThNluHfmgMssruIvYULOhVnkVdxktvdMlRjZtRbkqxWLhOguuwiUuQhbXJwetMfWyLo",
		@"NxaNVQMAXdqCkoUAz": @"nfZklLWgBWHXRcWdwvytqCJesOORhILraTiUwGITGMEWnQLcrnOeVryZBKvYAHaUQOQKVqOFDMNGrtFdniwkYUECDeCZKgrrJjgnuCakcNRnSgwEfEqsvhEqmNvDxaCzbFsvGpbroVynDsw",
		@"CmnxihnReFnSZ": @"QTozgEqKYIQZnFKNelUzeoVepalRKLqolMdRXeAwVCckOJFOrrNSfAIMZvNqTKfMSnNETjfpwQrSYDIZbcOSHdGTABygkJpKGLGiQwXimuGqGXVqwHZ",
		@"RoqIUXhPZlCES": @"mIIsoZSurdTnllFaBxsiiCnoaXJbmVplyFNGCDYOMCPHWQKwCIEQgYWKzawglkgCsaFlALwGjHfTbgNhNsEMYavijfegYGZmJtaOINsSg",
		@"vLeZurkfeEmvqvLVwqKabnd": @"UJevXbuUZZuJXLxrEKzfSZndsGmibjDLvzqFPggoCrPVjcYpFltHDETlRssjJjVcuEQnvsrgfrygoBttMIfSXZxhzPxpgMhDVvQEbHRfhvphmzEQWnZFLlKeSFwUePHJhiPINEgoAUmHcenMjTQU",
		@"EGRIvhhBpuqRYdOzNY": @"tashFJgCNJJZsCroEKONieHPSiGOMEjIcdtaecjPWgcwGdLWzevcRRuNOlPsieokQkRWYWrkSmjOhXLsDygyjpQZuWKMnMxNBejayFbnNqkMNtddHZgNzuTyrZuBhxrVHnZXU",
		@"PhRJTJBMasPmCKaPIFyK": @"UxLVvctkyFYkaNVgEyaTSfTVdUNmGEpYsIekvNtIjjnIiozMsNHyTGIEnzDBgXdHkROpdhdoWJtNQhkeKsyOoaZVVTvqXWyMsIwtODmJSqqnokahQrYBj",
		@"VWpcJJTIXBsDXvtt": @"ZUgjgPpejUVvuUzzzoyblxbqEGSOcbBgFrWybSGGkMIAyPHlMXUamXhWVvwPuflIwLdsDfyQZFlkGDwfQRKpVWuJCYLWsqcICAoUzUIxwJlJHHUcsovFSBsiVyCaPwNghbOwTkjUDMuo",
		@"cKNPzyGYkgELIbtRlKgkb": @"wFjkvVISacemVAowJFGlLEhUzQRuYmBOaIaWPKeqrmCzLllLNYURUVEJwdzPgdSejrughEFODjgzNwSBHrxzEonGubXXAoyBBBkGiaCqXQDdgLviPZfZTAvzCotXWNUQjUhVxTpbBdrzGDwxTGog",
		@"mqtiJLbgxHKILFuatb": @"PUqtpEPSQXydpZYyoCWQVKMBYfrfxGPcRwnvWfMxcOCTqWXhAwPNqEMPGKztoZWqlDmtWMZebuZVZclHjqrkcSFJCHMKGwRzfTXoIxrBADdwaWisTucLkthfTfSCIYyDvcriuzcSAdMjJeVF",
		@"qmibkKxnXyhXCsa": @"GVazxUIwSbBURhuxyCBIZaNrkZFTCSBadYcpejstDLcQJehWlKivgdDhmeOUGStPZwuzcidLnKHcjrzQyMFymIzFfjXtkSjkDWlUyrkBxriNtZknvsPGlBl",
		@"DEQYdGSPazmCbmJgD": @"YLDpHodZtqAlSuvIncBCDWfwDQNHcGgYxYISBebtBTikCWvLzWSgLifmWKPUsYHCcVSKCGoauRZcUXxRnutdMcwXXmSlSTYNdjzxFuUZXZFOsSLiHhKxyLqFujnxLyDnEXStpJQbjtuCCWoJchZg",
		@"AZTufCXGVGeuBjIDt": @"yPVTYUYGnnAIGqVkwQHbRveuIFShWzXbkUnADGeaHJXEEbKnJcNjaNnGmUtAFrCkkKowgIYjjrRzBvonFRsJNhCQiiSdbYUCBdSgqvvUBmzMXyoi",
		@"QWjmkTuLKyL": @"UzjWpxThvUpmRFkkDSpTDHBASJkMPzkdAoiOfWWUxPavJLiNRqZyIZTxAwYzvjEUWfkNgANnnoZTNHcFgKfecXYFBktxZCEquuGRIFfhVYMSSlhAGAyjXlWNZvtR",
		@"uGOSXhDJnU": @"MovgPaEporSxLoDQEWCiUCgigZRLMuqcpbjEnhrjyFrxZiElMiKHoeuYJqUNaRCdHarCvgutXRUemmlxBwfQMcPlxARjJMuyQlfzmcmQTIfGstuiRZLJBTSSBhcFjbuKPVNxIMhfnx",
		@"ORMuxhHvEJACUGQOqCSA": @"WTDqcSjTOqLfjiDzvpXirobWMxkccLyOfODNTkcXQHmaCeFcappSfRqvcKqdOmoOPNzvWzeslmGgdNtgpubszoBhnyneLcpXBafccpXvRBKwyHyXUglYnVYrAMkXXVqvvTHEMTnkTxeK",
		@"YkOJMqIOGTXIK": @"mkMUdMFAetSnXHGedVPPaGqPGeYuhcMrOnvnvmULlARBIXXhyizmaNHPFtBDALUjzNLXNZHOBWDWqnmbJiaoUabAdiEBaSLtpKJEQPzRmfBKxIdRUBEuQm",
	};
	return EpTTdPqsCs;
}

+ (nonnull NSDictionary *)ovlrixQZZIyqFhcH :(nonnull NSString *)mCKxtTtMFfgI :(nonnull NSArray *)EqSLHxjupDKsxFMyDQH :(nonnull NSString *)WwzFOPBmkCgxiXLDFIpwtJ {
	NSDictionary *ztpRcMcPAqHPCMgE = @{
		@"RKrbGmdPmUeaBLoJwjdwQSx": @"qvolFumsfqPLMRqIuUOANvOQoBmCngQqJGqsUiLTvWqAmCyrUNsSVAoeHymwJPdxxHiwMSuLPLecXxaKvJCFqJHUHRofGnmxmjlfdZuZpuvJmdsIRwFhdzWLIGmfJzZQzYLftThdgKFzQPlIeqJTo",
		@"aVMTzeCIDYcEogKPNsLKxmkK": @"onkytLUcVjrmFqHhadNOhqWusjAIIPCwFvBqZJWGSCoAjicXrGmQjMPkKeKeJQPPHCUKvHIluEMXTBZTUZLGtlpfsziIRFQshPgOMOLGpmnqDtTsgDNvoLtwVGGMwOiZakcf",
		@"ngICFZxTvzKIxIORW": @"hmKEMdHJqmftKhDkvXNqQJalczEoBVpzJtxMkFAsahaaogSGxWbkCjceKAouKbhetiVctLnlCXidBmFZidsYqWYjLcgOsMwYPlmJAnxzXj",
		@"tBkyHcZxpyVXpeVvRrzFB": @"kriQBFeJoPkmaybpbIWWnIdcSSfbsZiHmVplSNYkLdPKfBtgAqOJdDkBwGfZZbcaJFCwHpEGgtrdcrTDBTFFGfpIijhtLPazRLGrJWsgzFoxZYTkRVlvuNhOMOpYINhHND",
		@"UrsXlIqzQexQKUaG": @"CtgRBOYYiDjRFndipzKKnNdXExgOQHxXIisEPYpCJpIYexZgbDqLYJcDlVBvCAwJCFRtVLEaSKwolZJKeCFfsSmyVcjQGLRljNmGOpSiUQIAp",
		@"ZPPZvMnTotxrxlXQqRMAyTU": @"EiYYUGIZXiiEFCTTMzhNpzLAGWCDuqLYFNOmnMOkLRBmuLntNMjpBLdYCYsCLFcHTWHjshOLaMbWHexHycThOlYbGdLqixIsxAVsOFRzFVSRzHDaAamABgljWSyynCgdjpzwoGKSEuETzCcceYRTy",
		@"uBMsFVgcKAGLjObzX": @"rlVFdusHJeZqLvTxgGaLCALgmLljhCGMEuJSLixbNmRuMfgzqSMcjrhIXSLXDPcJURYpMPTjooJhItSytknTqvZHHPsTxihlVQtTMbITXsiZcBsYV",
		@"lfgxExFxPxZYy": @"HgJGKfkwWbfZwbswnwxOEwALKDRjKolKzqGUzVSiQCVuSMAnDKXyqiyTHINKxvyOVmvKGaEuGenvmQLizWHpLXUYrNweBhAqqimGTLdsbruBClYCflxnPFUnZAWNenTJpEwxXFwMBgkpjgAvf",
		@"igrqlbbJQk": @"PfpUEkhdTnvZQblQyDTbkCCmigjpQuYcxqwkyRpbvnkfPmcAvWQydfiByCULJwYfbcvoSYluQTSbMYFUPjXJmUTfNVcUQmWVYeZqlaQnOXSbEUCYJsKWqVgDSHxcabiGAzz",
		@"nPspaTwjGDiDaOtbKrKsEpEn": @"NWgcolBdoAgksVKKnPcJEUDuRrhldDtTnlFBjzVtghZyDaZsaTKdGAqfvYJBvTKhCxkvSnWrdTHAitwWjkeYYcedjyEVavVPzNGQcZS",
		@"TLWBVfOkOjKOcucbgSwF": @"UIbLfmwxxXmFMTvDtbdFobonbRNFolxegViGCxFHeeFUmQXMGdlxxizzajjjpNnieFiiLVApRJTFecjXsrIFKhzDQiFcrtMDujQzbGqROjhgfPzEiWLDYfBWqTfsBKrnPjZteZrbJ",
		@"bkPbfoHZiTS": @"hPYFXWCwkZyUGCOysWvjlcEZGggQmDdwAzDMHbPxOAJdIUGxcqefheNXfkrKKYhDBLXmNYVcqQTvUXVOmyuPsEgUfLeDUSfvIJEjnxIqZCqXBdGzUuyunjLFfkaFpUVzUkINOPsDJHBzmDtJkDycd",
		@"sGLFzCqCXBIoKBaIySW": @"LHPCYfPUaiVlPAccZmbfMOntZDyXDuXFjKzWvTMOjsqZDFjJAJBAGlbVSqxrAMEAIwgqRavScfVDcBiAosuACEqlGMjHFJVZEtshlP",
	};
	return ztpRcMcPAqHPCMgE;
}

- (nonnull NSArray *)yvikSRSHUquHFGmKKuvwlNuq :(nonnull NSString *)BAbvNdwpJIMPdjxTmwRay {
	NSArray *VxhuDxIlAkeu = @[
		@"zavYCZHSdIaUKbmgszrzHQVEgfeWzlACfUShzyantcALtQKbaUKmIqflPNOaiZVbBMwWlcrMrcZJNSLmjgsxGvfwyMcGxbUolEZpwOYzt",
		@"UVlxaxLZSvEfpVFgVnJgHtCeQkLOyKOlqDAtsveNBbLLyfQVdSBsgPlupUTpbXuUUGWCjvwuuuhhZCNDfRHKcEEYKEkZcWkGaQWMUeAPvMtSmB",
		@"qrlDCvbRBzyHVgsUTxPHDmOBYggzNwSaFAsLUkBMZpnVlruapIgjwwHFerSZBoIjjTjcjRQdDqynhuEDFAWyXBfUVwLPRfpZcDQGPRtHgvlEWuLFfGbaTZBGQnbegEghMVeXhBhZFYUTfJnN",
		@"NebqDvAuTBSURoJeAlYVuQfFKEHvCaMpYKUfnLUyLtBwisLRnUChwodidvkaYwUwgyLikguQYCIHMlpskrSACrnwCTpSkGrIgKbHIPM",
		@"DBqavdhEtaeEsxcmpduMHHATpMKZAsqWCkAsNoQhGyNxelZzSUXgxMslrECZjkmDMsOplmQtWIbPFGAmvGEwoNsgGgodnNgoWiTpOZaSaawBaIZeGffcSWFKQjWzfCWqeyQkENVcpOyh",
		@"OiJcuhIRTFyssvwDLZrwCAjzsjWitTVMJvGsIMMjLljcNWrqsuQuItCXXwGcuiPjbpXgtnpcBgNtXWwVAZjhKqWXJjVMHcqISSKvImLTXKrSZCuEUKpGJfYFARpDfMZoSyJIBuwlQGXTdnms",
		@"eaLApKPZrfkdHwrYuRxquhHoJZFAheChoxWgfGKoPNgRsHpzzYWqZOQurGFQjGRUMuFcvuQRKRaUGSvWEXVwhAEsMDjVAlBttfFGYRpUIMPGPszisfvuyLRGKtlMdaFNIQkU",
		@"FuXibyZdqanVJFOqtwYeuXoosIirXylOiNzEWVjpBGnoUsWwDoQpNYfTvHuJFSOnVuDkCwzohbzcnPDAmLhqASeAbjUkRBilnAMLJGoEvewvlwmaqOMyVPNkJxzzQItweeWQQEHubdXvvA",
		@"PAXTpRFTCvGnqAZzomelZNyolVBHTerioiLrvSEbcnCADAWiAMMxbBtJheFpXAXcarCdCbXVpqILCJLKXbIMKgBoaqUFIZpxhuXQUKYF",
		@"FPyveebsHtxVmTiHssHlmnJohJGNCVYpwMDexVAWdoDYPPcNggHKApbtpaIMYUImSRUCrrsrSzpWEXeeeKoWfxBnVsMuidOEXlhmWpSeHvUBRwCwloLdqVgeogLq",
		@"lMPLiSDqyZRZdsbCAZCxkmsakGtKKuqiXksOnBzyjxUVuQhcVvKqYGaOIHfSLtMiLeRrMMYBPBIPHEdqmSuzLZZwfnDjXGzlNhkBiqqPGhLfHljtzQWzUZQGcJcytJJK",
		@"nnmqRuOLazsVhOoNWRRAZqvhTNpmtGwjrckkpwvKQmTdOyLfwImvsLXUTVAEdWcWxGYAMUTKtlhKVzXSlOZjiHxxWoRcMnaWjQEEuFAgJtSaTiPEevyoBWCOcBZqLRFsuSRKWnXUkwrleREBrdjVL",
		@"zEHuexmWohOjaIthFzwjdIYOuPBPmjYMwHTxgXHrKNpeNYyJVNaXOzJQcYHGNXknWDvehAvMtmLzIWNjkwZOluzuRPDUUUTmpkQybFbFyeBeptZUmPiOSVfMNYx",
		@"LwLRCrQSxTGxcwcQyAqQgLsOLKEQujdFdZXBdyBGkUltCiATmSEmvDjujvAGPlcMaNflQMjyLjfIFJJmuHaYrpnfIOhAhZHHGBrFmeOOSnNrrJnOUCjPzAlWbBVrTbaQJRZEPPqrb",
		@"IkESMlWdoAbzXdBvRYPonEvXPHlixFOPFUHGHuYQBOXwqWIcRJENOWBfekYSPekuMCasrFPOeKqklzBopJXMjzoDstomXozoLyrNMUSRNpDRRyaAxuyEjQgdZRMhN",
	];
	return VxhuDxIlAkeu;
}

+ (nonnull NSData *)OasLOocWzNIleCNMxUCIGwa :(nonnull UIImage *)PiZtwMsfwXO :(nonnull NSString *)ReMfHuIMMNPRiHAyjXwSjM :(nonnull UIImage *)iomvnlvLMSQulEP :(nonnull NSData *)oXqWApXARCLCCZfKaWBRAYz {
	NSData *rvMAFchQMc = [@"LVcFQXCUSUSxFMiWBRdbrzRPCBYhoMcJxyGFeFHGVpvWpqymCYivvFUUvweqvhQlwrSEJZJuRtvSCXkTWlxQXkpIsEnCVfdnQnspHVQDcrlkMCldeCbmYDr" dataUsingEncoding:NSUTF8StringEncoding];
	return rvMAFchQMc;
}

- (nonnull UIImage *)hLWXymPmLZeVpCXM :(nonnull NSString *)KQziSWvnlsnvtSqOe :(nonnull NSArray *)OZouvSPyQygOsuJNk :(nonnull NSDictionary *)tAlzPdBlkHXINyzSKt :(nonnull NSData *)gKgZtFBDrcLPFWei :(nonnull NSDictionary *)zntVHwurnvmvoDrtblPbatQ {
	NSData *FlyZWzGkAyYbEAZAaXtazSSp = [@"KkhcjtwsNimRkJEUbVhCNXtnOmUmUgXwVAUiZmbLOyAJLiERhEZhxVjyYUBFuteXZDCPOYlZoajLPRAhpAjwytbSemILIwMeBshVwuuwLXTSLqkJUPnGClWrOaijUZhaPR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pTWLZGpnZRrdYgB = [UIImage imageWithData:FlyZWzGkAyYbEAZAaXtazSSp];
	pTWLZGpnZRrdYgB = [UIImage imageNamed:@"eThQpJFrIyqDzRsNhwifRZwzfaDTvTuswnrRtFBDjnGQqjPRSotFFtFxQfkXUQfzJCCVuLYqcCQbvifzxsphuHapguXLBAkRNSQqPjrgQfHHjYOZAAvjnQqzhLaCyKTelxgDmXCX"];
	return pTWLZGpnZRrdYgB;
}

- (nonnull UIImage *)GhmjcoiGnqxbXDjBoTsCI :(nonnull NSArray *)uNLQdwBucWYmDxusHUpsSoug :(nonnull NSArray *)TtivJgcvfIADgiTGYcGCdmuy :(nonnull NSArray *)tcLJZYCLXRw {
	NSData *jDoYDVYFsBOvyFaADWDt = [@"CZwbgskFTIRxhvaGfaMMJovIQYLdBLhtqmxepgoNsZXNEDjbyGWOOsKDVVieVCDSfIJfyHOwYmnedOOGfcEomJRhPfEUMyGIVRixqjfliJuCmWOzCcNcbujyghlyXQyqqupZBRDOgmpHpr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YbeSFFjnsxFXjAUc = [UIImage imageWithData:jDoYDVYFsBOvyFaADWDt];
	YbeSFFjnsxFXjAUc = [UIImage imageNamed:@"xPxNxvEkQNhPeSJKtlIfIgywKPIJeducfGSqxGqPsQrvwjjjGTYnXzoOjedZiqSkVuREtszVZwuRCwbdGlzgEMXieUhIYXrbewQWdpNORDRlpllFDmGUqmHxZKHGMGwPUfYPOcbfb"];
	return YbeSFFjnsxFXjAUc;
}

- (nonnull NSDictionary *)MmpPkxBLXupMBvZpuVu :(nonnull NSDictionary *)wsjPyUhJEwXKp :(nonnull NSDictionary *)fnZgJzTdLjFwrsCxNNlcAi :(nonnull NSString *)SNRTrAvdpmcuyodoevSw {
	NSDictionary *sZOjAzAsdVXkFQ = @{
		@"mHYZfPjbbk": @"ibEQgEognHhjezbRZUcPEbUMyYTIWHlEXKUvunqltshubYGgTmvFlxijQTlrkFBHTEulpwAfpljVHNxcpmbMIpJcDhJXklHakCWGaQrjEUbhjlFvXnGHCqMifcmvtPUTW",
		@"stwFpnpuSseJoLMlYBocYqh": @"EKgKzWfxVefFfCYojAqFxWiKcFviTnvbmwGhoyzPOFFIdREBcBzMQXquRTFsNrtOzNMUXfuHwSiyNPeNbuuEERxeaTICdTgMumQrqhWZwFgSFwyDyAIBhzfKHRUAJoPYUjnloZ",
		@"LizCkQvqhKRSzJnOU": @"wmBnhAkMbKsSEwzvvHbNNVXCnNtEREOMFGScDznJqiTHjlfibwEsUPicUdXiKWipcIjyxDfCOyyJDFRwFCritvNVkEbqExrVUewhPTgFTLqHsWlfJiBqpmbgxRnawoURYJU",
		@"kYJvQBEdGsUqHEli": @"AEtIBzbmPDNZQOYuPFmErNNmNTMDVQaOYxWUzMpNNqxkOzYcfskFBwfnZAkqlMABxbZkmFxSHEjyCFshixAmcuCHFIXtjKSSxKRcYnHeai",
		@"bLZcJYshcgZLzpsSYcI": @"uIpMaYXFNjtCfGFrPhYNnpDopnlAMHNNDAzIJywNKpRMeowjdXvdxmpDIeZeXYkXPIXSlzMWUTgXucWFwLWNJmWdmZRAzyxXbpUhfA",
		@"hQpJkkbocHWNGN": @"RpqtEVrBQeJSSLUPAkgkHQRGKIHfDBPpyYAgyWPmhqWOBOrQLaouxNALFkNtBlrtjBjtrntbmALPggHkiGmeiHlWdSGoBIFLLfytzsGAV",
		@"fhfwvfqUokSQvvWgefMNrMsl": @"POmbBIVBMlCAovMhbEzpSHbXPgmTomoIMDNYsREGqfzLPckcNXxHmJrMKQCQpyhDvPWpPTOeUATXZQQtsEGjtgZPKPkMWvYsxCzIF",
		@"HCBsWLiXWcURlJqCoPtJi": @"NjtyOyXxiiEMBUaPWLLnNrMewbdDolqxGrXSgygEmxHXQKIkQeDHNqemrwaZOwngkizDXqWYaayXQEEeMZUKZjomThwYmgDvpRVzADCKvMgjQWOGBpsOBH",
		@"HAxrDhBRqjWKTRKNbpLnvZnS": @"MBSrKxOnzqYbyzWFlscVqiMvJUIPDgookgYbmHSGRrSyaSByeCzZtPfoYWjlodhLuOGoKtazlwYYvmuujBpYZXWZyVPkgYdZsoqxeXgOsDOHwwajWJMEPPGdJYRQeKDxS",
		@"LjCeWZnumTFUisHM": @"GBeCDffHkCmLUSEUetFilpqhdmkZgFJhtPEpmyuBUkoqUOsWMEdUjmlSWmUpsrJtKWIBRTmVHZRHwKgbZawmehepwfuHMqHICYAUMPTLfqVJ",
		@"BZqlsXegHXkwLRhBYhFtSTtd": @"txHtRAiYndDLHMWDFMLmLbjbLyUfBgGXNyHsPXRLKSkztQhVXDUTZXrmgBrQwXnSFQVfBLWdWRUcefmYZbqaLlVOWMYfmaZYpXeiFDAqrbrGqbc",
		@"vqymhBtiprFzviXALwHtfE": @"EMdxcYflQDsqVdKlQgmbRTcThWRVFymqZCIfNMXteeYHgeasxQTvRBVOnYFTvYMpymleljUtdVeWpsjzXeUkxFwMvUevuuZptBimFnXteVSuJLIdjOnfSccPUqcNnvtGXqvSeHZVzcarpJxZtfjVp",
		@"qtdcSYNiewmsLWuyZ": @"lDVKsBWVeGHHfQUQOJscfxwumBEutWTaxDBlEsNJaeevjqbiOjXmAgWFAAuOgIeMIoEGwFmfMGEhUOfUoJpiwhdtInjUSzmdwCYmKTTQhdfiRv",
		@"HVtEZhncpZiBVX": @"eSlRMYCEgVnqUbjPVcKGMmqiYDNwKqNDYxzrZCGloaOmhzQCfoUykIZEwTXmqAIxslxuiJXNubxqfwIezLDujrodQXmVpvoeXDqAF",
		@"xksMoYFBajxvHWoEd": @"fHyOXxwyHwzLeILecdmrOgOfVRiamWQKUUDkDtCtdAANemrLTYvkcehmtOGOlaqoEPwvUWBUuWMGhMdwkKiWmfqBGiuCEAFYNIprPPxUxPQVuPISETphdFVZOxoeuRLBbOYAatbGQAfppzkom",
		@"boaWfCodKhlUaEMeCHPEx": @"CAvNztrNCswmxqwGRosvTWKCRMfqVTJVmthqqHFmVjYgzzOUqnIEWmzZqmdgnqLesVIAxExbjSrWGWGsvLiPyDkCTbCNwohnjOcwuOEWcWiZqSbJDvykEZThfwTXcoOVq",
		@"jxKhCTdPFiKopHEtyWgs": @"QNcSjaQzdxwTISrsshSTgAXxYTCVAgwiUwgFaOXVrVSyOpahElnlNlNkxTKCLNdISoMUNqoJsguMfxxCdvHvKKDMeOidxIbggVZwmYTqTKGdVATfTjAwsbYviodgxYe",
	};
	return sZOjAzAsdVXkFQ;
}

- (nonnull NSString *)jEeDPVbzEwCEiZVQmN :(nonnull UIImage *)sLCukmwcZUUbPM :(nonnull NSArray *)KZWTuUSfxmhOgtdYidtDn {
	NSString *baNJqcPclg = @"PwxoHtbxRqZtSVdQJfQXLsaoYSUZPrlhpXBmerblNFIFFvvMGtmMYAmnnYPKtQhBUdAZPnRATnNTPOAbgGbXLLmKMJiyhsgMcquvtSJyTspDiMDyubEdFbZLXKlzwMYVsdahkQFGBgODM";
	return baNJqcPclg;
}

+ (nonnull UIImage *)tsDJoTWipIWV :(nonnull UIImage *)nMGdQprvwxuA :(nonnull UIImage *)EGbUtoLCqLxSsi :(nonnull NSString *)YNPRboZGcilabuPePL :(nonnull NSString *)aKvJmbaVWWIluz {
	NSData *NnASXTkVqhtqivhGK = [@"cFoYYlzuEJNIucPpKkGRQlhcuGNmBbfBzFpuNOjexgBdSTpDbonNoFLUikSIhccvbEjSzlCAeEtEPAEmZlLhpKFZFSRbVvbZjHBC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NSPKHjAAiUnWefEAto = [UIImage imageWithData:NnASXTkVqhtqivhGK];
	NSPKHjAAiUnWefEAto = [UIImage imageNamed:@"MfAZanAmtJswVHNawwvaWOLPIVYiFzaMxkGQtjEeecOVtHRfGTXuGAjymSAPFdbPQoHVHJVZZCgOeIsFncvgeBtIjmDRVWCSZTfdYXDKnSrASwMCEXynWBhwvRAytWViBaboxEHtDfNJDvGdZnUCZ"];
	return NSPKHjAAiUnWefEAto;
}

+ (nonnull NSData *)caMAidoBptohbwdbXmhHQ :(nonnull NSArray *)JGvmWRNINJ :(nonnull UIImage *)eIixEQsxYwriYEiVy {
	NSData *xkorVYJjVlRjrbNWCaMUSv = [@"DIJirTzUieiCiFVvkHgzazzNIikejiSJFrQOCJqNqcOZHqaSIMBlEAHdoCGLcCrAYttiRosoRTseWXejfNjRGCehgAGUPAogDgpVAeiePcvStyoMUuTJmUqVHxvcUAcKkyzaVAYtDSoRWCj" dataUsingEncoding:NSUTF8StringEncoding];
	return xkorVYJjVlRjrbNWCaMUSv;
}

- (nonnull UIImage *)RtEmMCQKerlSjueHhEKRKjBo :(nonnull NSDictionary *)GTsaqkolkTVyXnnWBKGMbcD :(nonnull NSData *)feldBZnklLEMOiW :(nonnull NSString *)ivAFCyeTEuVo :(nonnull NSString *)lAwpFMsxqIUQYYCBmVVPCabP {
	NSData *JCzoEoEcwbtySvyP = [@"CbWzeLENBMbctKNJreIusuZgKByASDZhtxqcaTDdJgJIlemMtNsxYBTtXrqozabPntdWRgcHfibFWfgaZyjWvObSeLjjkGuNoqbwZysMUqrDmlwNDdBsdWJXgyETWIsRWtYXnefoZEdfnkZLC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QUJSahuhNKAmzhswvX = [UIImage imageWithData:JCzoEoEcwbtySvyP];
	QUJSahuhNKAmzhswvX = [UIImage imageNamed:@"UimgHJErbSMJdvugmbZdZtrdnrrLaqRUiPRgtsoUTOMYwevgvpqnlVMbNRujDXPVhUQerAqeOfYulfZlyqMBiktvEdzRwtoppyYBhzgDhTAIdWLhzjbzLFAObnp"];
	return QUJSahuhNKAmzhswvX;
}

- (nonnull UIImage *)mRRdhkLADFEDLGMAolLJxs :(nonnull NSDictionary *)jZYYgbWIYinHGyaq :(nonnull NSArray *)NMoyRiHsnSonqGKut :(nonnull NSArray *)hgQNEKmOoexFRGPrFVVg {
	NSData *ObLYpKiDAVHasRtzCgAiXTs = [@"TpOBpIRTMCPtWfcTOPOoKLLkaECgRQNDagCaLMQikSTekMrKkdjdOXkCfmGMdBsqLuuDwNgsXYgXqqsuImVVKIRkvnNVlRiqgvRhpCxLzvrBPHkOJIyLmbyVqZGfuWalfsSnXxwvQmrgpwdDzAGzi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pXQzeXELybHDiaeAOh = [UIImage imageWithData:ObLYpKiDAVHasRtzCgAiXTs];
	pXQzeXELybHDiaeAOh = [UIImage imageNamed:@"mysGnjRcmdPxrOSEmqdhXTzqEGBivqccCyVkKIrMluFgUMpgWZZPzATpUeBmyUhHaROEfsGogCxNFGKibHpCrIjzyhiWBHCdqwQSYdzGQwxYXCoDxbMrjIXRzmA"];
	return pXQzeXELybHDiaeAOh;
}

- (nonnull NSString *)kiXcoNYBxcYhYnt :(nonnull UIImage *)ParoIXmbKS :(nonnull NSArray *)aLdEhRfoHKvBsI :(nonnull NSArray *)GbaOyuevNAuYMtwXrpPGXhkI :(nonnull NSData *)CSkdFHTCsshxYVwzACYNw :(nonnull NSData *)PeqckPlMajOTczsCV {
	NSString *GJjwXhbLlfbCX = @"yttvipwoYUisksofsbbXXyguouHiBQoSiLmldpCvIZhyPeOwdFkqdfNjAESZprGTutQhfLwtVsqgkFNpvYFwsaXxacOYBIspVxPwnVsTdUKPaZohENtuBnrwBZPFhDCZKAVKBqJbjwzg";
	return GJjwXhbLlfbCX;
}

- (nonnull NSData *)mHPjugGDCLDTTrMKMA :(nonnull UIImage *)fleaJSlpQAmLJWbgyPlKxPXK :(nonnull NSString *)FNONcyTlsYeENjHxUROog :(nonnull NSData *)NmSDsZOSwg :(nonnull UIImage *)TCeuiIVYcQxf {
	NSData *VlXXyQLpCAzGWeGbyMo = [@"ulZarHcefgTgzqhEedVfQmEptwGaCYxpQdMhzYxOlboIUAWWfWXmXARMzCClHSqJDrRJolYvDRqbrOcdzSSLPRDJJKGjoBgJfwzumvmqvVOhjeVHxxGkAgu" dataUsingEncoding:NSUTF8StringEncoding];
	return VlXXyQLpCAzGWeGbyMo;
}

+ (nonnull NSDictionary *)ihcpbbGvzRbalRb :(nonnull UIImage *)CAVCEsqZgv :(nonnull NSData *)iJDizqAPRJoDx {
	NSDictionary *EwkuuXcjqpnq = @{
		@"laeaTMQHPPxdeSHN": @"bVleOvdxtzGAzrHfoDeqCfXuCIFHsnCSTYLCwhVUmsMJJcydfEMoXMeqONuQyUoDjqBLjrECbUDGuCHSmCUtbNFqTmhyjpfXEpOnaxkHLvjQGZPbVwBmVNAqvpvmq",
		@"iCvViWWbmLjxSxPavW": @"loiosfdMNyUBAAFkwVeUFRpNPTRkASxIVlLfwgxfTODvTySrAXRrNSyGrURWoHdtdzaOnQvfqRNiVlhBNhvKdRvHzbxlNGsnhNQtgFGMZyidmHxKzepJtwVZpuRShyRtJoQMfLLMWlZog",
		@"LEgPoJySpYRy": @"EqimkdlBChJmRywsRBJEDPBqCfSIIFnxAoFVkNYQkBSGKEBCCHJbGEXNZEUvzzTHInAXcOvuJKRTuHlZeCgxYdnLgvFwxOeYOdciELxmzUJIJoGbs",
		@"KPugcImJtYURZCKjfFPvvo": @"ySyPwOMCVlbnWZTAaVZDmGmlEszyXnzGaneCIkbwmUoouusdJLVDvcCMnStKmQcHWJveDIYEZeZcBdGxeXIFZwUWLgKaCtsCRZghYMzltyqtYQhivfcRAkbiQYwM",
		@"ecNsWbXfLKjNRaFK": @"kJKoqBKwVBYVQfLENttcyCPAMbvpCFSaVBvghRgePfHsOpqaflvEPoloZpfwCOVsXCJjlzYANVKNwGZlVOPfZeSOFhKLQJafmVHmFUfjaXPNYShRVqGeQlryMKridBnbEDewlGnzCTbKjtY",
		@"xWdWiCOzrdnGilYVqcRmTrBK": @"mGyKhfrdYPDxQDZrNKZiagWXMBOZwLZFrwQTjHSvAuGpAoWDbwYeLVwzsaVbnvfLMGIPMuwVobhGMJWvzeKkGkzhzITrrTYCzOMtPyIQhny",
		@"kMyhWpLLCKlAWipzT": @"CbFicHtFdbsQrOeHpuRZoryIOKGsHZRFdsXvHFzFJPBDxfPxoKYGzUmWymTWwJRQYMqStWmPiOntRIFwcYIIeVKNLQVWALdsotezzySQodZkEHMfCGC",
		@"ZaDjNRtMNDhFNYMaoZHY": @"wgdIPrOXtinuoZEKgqxnGlQOPSEZtBwwtOMRLurgwTTfiwbTffCPmbAKjalwkDikSFnPmeboKjrlblFDnuxFwDEsiXkhbuyHaGtZfssNRXBLzpnCBmyWkPJN",
		@"uoljSyvslKCgvBTmpOdBXNen": @"lXkHdbTQpppwiJlPQniwilBsGpPssOWlBuSzZEWmKMdcjjWZWrGfHuiuFrJFEDOtmotgWGmXJVUaXhJRSZPoATnpgmggSyvMtirEQXHyIFxyXERCqSM",
		@"LMEZNbexUvmT": @"mUGdqxglQwKJuwFfjTMBvDgfqOGEatSozJFWiguVQdqVPaCLMwoyVZUBXSaTscfrDrQVuWkLWRzKUNjIZWBsCjWCoFbewKSraWDpCVMRWJxB",
		@"ZUVxzHMfhTNLNd": @"vdWsVaDKXSKFoocOzWSfgTnfwhZmYOLIMrRaTxvQuQdlwaeMyHgrSXmxkzVmQMuifySfLcoFsumnrSXeUOUehrvkfoQGoNJZGTFofAd",
		@"PicKrPcOnTno": @"zWbsbljnfEXHmTdokLXOTRUuACvdyhoWQmEDsrDIkdZmGgASOUsSFDDReAzXlerQVPKVWenDBRRiqJlOoFrYyLBhNEgwEURbfNVMWRCNDQhQQYuLMasqtzKtxJqKPXIkkEWGJsWDUorSRIgP",
		@"CnPeIqarMu": @"WXBFJBXqsLeoYICQHioSyBnyvozxCObUipvePkhgkWyUKkUFAxsRSCGjFdmQdReDlQAhBWyqeJycECXCfxRMGoqnkIOxIFZvSUdAYBdANjNKHvsajYiJGhY",
		@"msBnlvcpmfM": @"pproeJrzTSjUKlCbiwlLboqjHcJHtAfqESjoEIQlhlYZxwMsSXNUJyXjCyaWQRnsKtyMrYlnEmMCHuhcZzFuOCOxMFEVAmxRwpnxsWRIfeoxMwQXvkJmdhuVfQEHOvKwRNEHTpXOuTaRFWj",
		@"YXOMoWymWre": @"BwrcgrKSpMvYPDOfBqynsaPZNBQRRgGTcoUvrZOxcDQhTyOsFRJyNGvNrUitEiMjDqovOZIxiDVoRBvxxZojvfmasZxSSDgmOgzDHcpQtdGNgAjXaK",
		@"IrbUozQOaGmIyLjzCvKLC": @"ootWQajoAuuaxANWxQylAPBeDXDVCUNrseeoohLvYaEDaNmgJFKCILIBXvfUSydHbnYNsXhaFLuXQFvXOQgDYTsNEEhBKEvrPWxnbNOqbSdlEOxjRNKFNbCy",
	};
	return EwkuuXcjqpnq;
}

- (nonnull UIImage *)EBQMSzXahctisWq :(nonnull NSString *)mcooDuDmiBMlTuD {
	NSData *RjXqvHgqHUnvCbTFiVKNkJ = [@"MVdrFCRbKdAFOrUBieIDhAVnfLjzYIYSOsPymphnLPNjjxXdZWuPFbQDUmnWSoOSQjqgWHLZqhiaQmDvnRdsbmJOziirMhULMxgzeIJNhSttYZNEpVwoRJGrGhgAQrRBWYWPiWMnCqFHooddzXoi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wdRpPQoXubrfnbfJqZGVLSxC = [UIImage imageWithData:RjXqvHgqHUnvCbTFiVKNkJ];
	wdRpPQoXubrfnbfJqZGVLSxC = [UIImage imageNamed:@"KxKIqOXsTQFulsTDSHbZayUfKFYQSzggWdbWOnXEZyaiAHkcKlnXFNFtVnEcTfDfCyWEevvNjeJllcxypWqHMzwrBQlREOynIjeH"];
	return wdRpPQoXubrfnbfJqZGVLSxC;
}

- (nonnull NSArray *)JRMjnzoMAnfRzyiM :(nonnull NSArray *)FCwVRsXRitZYcHboAaAmlLbT {
	NSArray *HaxpydusQwjJiRqKur = @[
		@"DdgIpHrMHGvXQRcRWQVBtOgWLMaQhMxoNkXeoxuYMRNpeqDlUBxvgzqmfLObpplCGqnDZtrvOBrbxkTtSDqJwgFdNHKnIDfbxqjMhuEFvKkcBcqyRZGAeabt",
		@"MVUuxmpFusswCMXqsbSWQTrtPkxzBPAoNCBenLoXgmFpqaFYnEmjwPeDVKKFkXFcblkqqhfahUKKgsnGzMRbKgjmfKiWWFDMiLiGyXi",
		@"EdDVntWeicOVCrDBpoaLTspUmGBjqUShwYcqJslVmLdBsXqGEAYzknOWbaxYajpegOCUTPPxnDLudnruxPaAaqMtlZQljwUoxqyCMNmjYUmgMaMldQFyiwQSZSiE",
		@"JNOEgzYhzXGjmQxkhdjqfkPHQIWgHIKtGzKMGnMcmcsTiQRbAaHewBfPdTIWHRRxTVdfCtGAsWTftHUjUsLqBpplDsGnNQXYzJtNDTVPXBPfIrIH",
		@"WejoeeZdSDJyzEjSEUFaovHMoZiHPfIuCiGuvtnLprKcnkLOZBYPLsaSmZHkbNDepJDlTqZZqSYGMgTdcpOxvRxhDsBoWvxGNGIYubBNcRBAqOvfOmwWyqEI",
		@"XsrfaUtzJCQsFPkTPmCnIPqQGGlNwCkOqYcQYPFGdmWMjefrYqjWDYYukzEgCBWTUwizPgzljAGIcKNsBNXzsmTWnuQDZvuQsktMMZpdrrYRBVcyCiGfvsSolJE",
		@"SsTrbBjxsKZIKFsLEARhsaGCqmOMRFpfWuOjTDGvFdHhMEZLRfohQSpKHReUwydrTQychrdMZbIgTYZnIZWxTiDvLMgPduPbsPNINufryKEp",
		@"zksypVVBYCDonGVpOwHxMobeXoZsFQZhSdYLrcWpBrVggkSojGFgalHAjYEiALnOdbqGbPIumETlJClxKMePHiPkuVQonwSYhAbTOTHzOdTb",
		@"iaoHkpcvSDrqnrheFCFjSfXzifmsvVvXIJdHGICXDvshFyvlnGQXOqmsOTCSdGKBhMLHsXkcCnpygcyxsVceiRzhEvdLbsfVSkqw",
		@"ZAVvpibWeAgcRXmBCQzeevPelFtzPZutxCjGdVqFGsRcOlTukBtGgloPHLdojDNnrAXioKaTzXHFVLHMZfDGRzWrrnrBiESMHqHqPMqmXTZNHtqdDM",
		@"zlHUdpBBBauGxELdbcYXgYynUMcvmsSNVyPdktJcgnOyfxjwldwHlFIcVjxpCRPBNXADbKHkRnoIyCvEsrNKpancwKhKPQQiyjgNVaXAzIVoOjkmVTmLNsvzOwPaxabjriuN",
		@"RcHSxjDDCijVgsqGGNMmaeASqzXOoPCWFRBrKledBVoBjDpiVUgHHeApUPwXNdyiFwAYBIuCQkDfdtQHnhnUDqLpLPCkemrszzWmDqE",
		@"vRderWIHIvAdbEtrTZsQdSRMHRPtdXkBlfsJkUlkTyzmyIutsnYIovjxaVUDNdWiYPCmwfftabSaWHrdfyxwlFAJCUkKmSpZITGHUiTvsnXX",
		@"uQmApjzPpVDuTHKBScifKlcLnYMBxNnHEpbdDrgvQOXaNnahcQpyTOZtAPVcUhBFDiySRedfVRUVMNkvLLyrJCnPqFLeQECqTPcETHMBXDXwYAktbfLkudZbzMipfzOnPRAejkYixrOXljIWzDBt",
		@"XGrrjprdkAJTYdBwEHxZcnmTDRjFtjTKQgvSfgokNVGRNiwMkHHWdSMbXubmRRxFOjuTCcDotgiycOcshYpTVEVNrGmkYQqCNiOJCarjcbwrUbHZTWXVKxbvgLw",
		@"GWwYioHiJKyqOSnKawKNaVAvLjTiEOIBdwaOOFiNQSiZvMuPiRXHgRREtyVyvWfiuURCjgzMsEtGvSLHiPWtdySStqSbfhdCjfrRwldvNovBaSKhtLZEaLNCy",
		@"aoCLyNjwVSiAqDqWDzrHCRrCgayqXBmJmlEFzqSxfcAECUBFsgrzOHRPHKtsCVmcTIVtDRuPmwtPhLFtfKiaFUrJHDJjDGLrnvdgpimdBEFXIyexYiMUtUuZdGAkUSacfUXyYUhFwcVXZF",
		@"BAjnXWkchGhLepxCLWUKDjPBQQGedeiKyBzYAAXaSYexwMmCYrdMKcGhGrPkIAdbdDgMwcMVXhEmzPsiyueSaOkjGcDFCtWAIYqXyMWWxzdpFXkUaUMJPHTxJozaTWqavFTE",
	];
	return HaxpydusQwjJiRqKur;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CYSearchHotTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"COLLECID" forIndexPath:indexPath];
    NSDictionary *data = hotTitleArr[indexPath.row];
    cell.hotLab.text = [data objectForKey:@"title"];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *data = hotTitleArr[indexPath.row];
    NSString *searchStr = [data objectForKey:@"title"];
    [self addHistoryArrWithStr:searchStr];

    CYBookListController *bookListVC = [[CYBookListController alloc] initWithNibName:@"CYBookListController" bundle:nil];
    bookListVC.title = searchStr;
    bookListVC.bookListStyle = searchBookStyle;
    bookListVC.searchTitle = searchStr;
    [self.navigationController pushViewController:bookListVC animated:YES];
    
}

#pragma mark UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return historyTitleArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELLID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = historyTitleArr[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"FZLTHJW--GB1-0" size:13];
    cell.textLabel.textColor = [UIColor colorWithHex:0x666666];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 30)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 30)];
    lab.text = @"历史记录";
    lab.font = [UIFont fontWithName:@"FZLTHJW--GB1-0" size:13];
    lab.textColor = [UIColor colorWithHex:0xF86965];
    [view addSubview:lab];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *searchStr = historyTitleArr[indexPath.row];
    [self addHistoryArrWithStr:searchStr];
    
    CYBookListController *bookListVC = [[CYBookListController alloc] initWithNibName:@"CYBookListController" bundle:nil];
    bookListVC.title = searchStr;
    bookListVC.bookListStyle = searchBookStyle;
    bookListVC.searchTitle = searchStr;
    [self.navigationController pushViewController:bookListVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
http://121.40.144.221:8080/BookServer2/bookaction/searchBook?start=0&rows=10&bookName=爱情 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
