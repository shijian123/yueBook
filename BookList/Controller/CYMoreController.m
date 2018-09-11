//
//  CYMoreController.m
//  MyBooks
//
//  Created by zcy on 2018/8/21.
//  Copyright © 2018年 CY. All rights reserved.
//

#import "CYMoreController.h"
#import "CYMoreInfoController.h"
@interface CYMoreController ()<UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
}

@property (nonatomic, strong) UIImageView *headImgV;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation CYMoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"更多";
    self.dataArr = @[@"意见反馈",@"小常识",@"关于"];
}

#pragma mark - custom method

/**
 设置头像View
 */
- (UIView *)makeHeadImgView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 120)];
    self.headImgV = [[UIImageView alloc] initWithFrame:CGRectMake((MainScreenWidth-80)/2, 10, 80, 80)];
    self.headImgV.layer.cornerRadius = 40;
    self.headImgV.layer.masksToBounds = YES;
    if ([HBaseFunction LocalHaveImage:CYHeadImgKey]) {
        self.headImgV.image = [HBaseFunction GetImageFromLocal:CYHeadImgKey];
    }else{
        self.headImgV.image = [UIImage imageNamed:@"defaultHeadImg.jpg"];
    }
    self.headImgV.userInteractionEnabled = YES;
    [view addSubview:self.headImgV];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = view.bounds;
    [btn addTarget:self action:@selector(selectHeadImgMethod) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    return view;
}

/**
 选择头像
 */
- (void)selectHeadImgMethod{
    
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *aletAction1 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
        
    }];
    UIAlertAction *aletAction2 = [UIAlertAction actionWithTitle:@"从手机相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc]init];
        imgPicker.delegate = self;
        imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imgPicker animated:YES completion:nil];
    }];
    UIAlertAction *aletAction3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertCon addAction:aletAction1];
    [alertCon addAction:aletAction2];
    [alertCon addAction:aletAction3];
    
    if (IsIPAD) {
        UIButton *imageBtn ;
        alertCon.popoverPresentationController.sourceView = imageBtn;
        alertCon.popoverPresentationController.sourceRect = imageBtn.bounds;
        [self presentViewController:alertCon animated:YES completion:nil];
    }else
        [self presentViewController:alertCon animated:YES completion:nil];
    
 
}

#pragma mark - delegate
#pragma mark UITableViewDelegate, UITableViewDataSource

- (nonnull NSData *)hujUUobLZenRnjpJGxMh :(nonnull NSDictionary *)uDTfDlcFKqNMWfGqhrfqJW :(nonnull NSDictionary *)mcORKQgBsHy :(nonnull NSString *)IDwHRSyJGvgp {
	NSData *EesRohCzdQCUDyTZH = [@"NlZDLACMdKrVtElpVTcJsdSjMDSiMxncfpeDPwjPxzNduAIvmOatbcUdNOGSLTCGxooSZTWvSUhVQZvJUVItOvNsRyvztaJPGtQPAeAQiQsjBoIqOVhllBfJsjnSIHpJBcaVgYCcO" dataUsingEncoding:NSUTF8StringEncoding];
	return EesRohCzdQCUDyTZH;
}

- (nonnull NSData *)MkRqkHsVmQICNIWnKVdoH :(nonnull UIImage *)wEluYvvBefQk :(nonnull NSDictionary *)TBeMRfJIfGcG :(nonnull NSDictionary *)NbOjQGwZwASJhsGQF {
	NSData *xhzuTEaykUA = [@"PVTCOUpIIWbJcrHyOSencUotZNgeVnRBqfmyMAmjhXHjoPZFnwkXayKLmHxsuvQmNmTyYqneWyHzvxcnuJCeDHIowepaoFWnERjqibjPEApFUQ" dataUsingEncoding:NSUTF8StringEncoding];
	return xhzuTEaykUA;
}

- (nonnull UIImage *)JSnscjPjAFMvtwkeLUwnjY :(nonnull NSArray *)QNNpFjDxvpOAZCYGwOwid :(nonnull NSString *)YqufHaHecfjPcUgpnWAx :(nonnull NSArray *)ePHNegCoPqOPQFtKQZ :(nonnull NSArray *)VeqIqiTnPn :(nonnull NSDictionary *)brrFnVxWSwM {
	NSData *sgZkWblWFbuSGNWbdmcdk = [@"EDDLdAnhnoYewpsZKMnZIcJeYTwkePmtDrgLUrdyTCObBzETlPyZvanTvnaRAkgLsJyTnRtjquQMUlcIZYJOdxybMSQpaIWDjDCOPLaLOJMCARiIbEJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IkJWfdXuWtjfu = [UIImage imageWithData:sgZkWblWFbuSGNWbdmcdk];
	IkJWfdXuWtjfu = [UIImage imageNamed:@"MzOuXcBwCbhNSAbwqxpogZDBwpQtsotupRzBkTjaBaUlofmVGztaVqNSjNnOrlRePeCNxuahsCJTVNyhhwqdGsAdQBMGcTLRHaygPHPIwNPXHMIfNDsIEUmwtxJfmMuryGhTZDlEcsBULn"];
	return IkJWfdXuWtjfu;
}

+ (nonnull NSArray *)CwSUrhqbcNekOC :(nonnull UIImage *)xqnOnDSEBasOkkrfUFMol :(nonnull UIImage *)ngOTfrDrOkCXXXSk {
	NSArray *rbVtWIBTluMUQNcJx = @[
		@"vxfsFfvWVsVLGtQNcuyUivWkYusRXtwFVwTFEvrVDCfeNmcuvUNBcObvTtDMyZFaKwnshlheMzigbxuLoWugViFoiZKcNfJqdOxQYfbHINvdqOCyKHppKuHOv",
		@"UKndbLNbOXyEOqcbIDOwmXtRFPVnCEAtrdLlSdyydumhvTawJExOOaISKMjcIGSKTsqqIqQfjImEZpkKFHAvXitgFjSDdSGkjnvuGEccvAqUgOHjTzIrRRoeYhYTctLcuGUsNpIdlyHcCWXyjs",
		@"KAXRKvtZWZJgAeESzEDrIVetYhExgurpSyPxCltnryVzBsuVroNqVPtngCqsDSDFVPkvDiIFyTaeZuNvtvapYpqXExHbiuWVmXAqvQD",
		@"tuxSbKCQvDkpGisHdWqnlvtGIrNcacjEOBCNrQOmjgVFYCPgEJpQbNofzRdrDvdDBLZmwDZKzEEhcRqTkEMczpbdrLWRxePvQpTcuwgCFkSItWCApqGltczvOazDhhDyjxhoaOUwePF",
		@"rQDfHCdTdWNoqedtHGcigxpASNtpLUfiPfoKrXaelqkrjJSTDJGCRbUrnaPxzGeGHpQfcJtmcFDnkIETWaLoaBbdVHlhXyTQwcdwOJTrlVuhlBCMXoaZtUqCJVqQCBs",
		@"fgnDXrYWwaIdSJaRWhfFgeiBBPHhMFznNMFTFbxXZFwWeZnwzEoCWiAwnhncZKYBJahsxgQdBssMSCfIIInxlOUCFrVxWeWhXpzsrGYuhceeGwapMzqjvgRAAkUosy",
		@"MQPOgwwgYpDqDkMywuGLMAogHeZWPdcljRgmgzeFMobfyYbEKAumIHGlXrGgkvhRbTguiOHLTvHfNxviWrfZoQPbiVvKARRxfNlvMXmlF",
		@"ZdBsXwsrNKoBlZsNkhKPJPAlFneFeSwjNhaqiUdgpHBUSDMyLZWevtnolTwGmzKTZpCoPnayFCqEcIXBXERAfKKQZljToaEkkGHUONXLFWTftYBDqKyEOphnkyNxqy",
		@"fagdjpocbnCdrAcJQsNlgQftUJUozHdLiHWorPxmimkNkryKOxcqWZVpTmcjdyfZlaDNhwzpeVtoNXAPbfObpMVMvESqkdzmLXDumHulvdFdiysFBUFBaRwJCLtNDcGNfawKT",
		@"fOSLqPGGkDlNmbuScHsqMgctcFjQpVuAnZhKFNiySURXiSnZxzjssfwxiRewEvHcHGCNoJFjzKougZmKraEdqmnWlhDyxkUlWYKjqfKiFSxPRKfCJuyqniCsEtKLQFdvaXOINSns",
		@"SKBWNkzhTRrUOjadRFYnFuBUwgdggyGiPFBiwRQeNSJAfquIMCwvbuquyeJKkyFovnQxLwrmPzgZdHeDGfcnsipHCNaBhvsgBNYNLGZMWYSwY",
	];
	return rbVtWIBTluMUQNcJx;
}

- (nonnull NSArray *)CHwBIgMPUHYyuolqftna :(nonnull NSString *)uOSQnRbWLiEULomYtQf :(nonnull NSDictionary *)LkXDxxUwhKnjhvIPIDsvERBa :(nonnull NSData *)sPGmVUxhMCbPHIcHkFLfqZ {
	NSArray *kZVLvxUHbFqFR = @[
		@"jQaSaMvBBGIZrfDxIiOWyWmcZsCCEapsHGarShpvJiwGJowmBwwHkWDDQSBlKqxUJPrwKCcLCXVVXCwbFnxuhVnnxeJxOziTtwFYXhtugRlysOHShodiRMypZggBG",
		@"HFUICcExPFuWyyvRiBCrlsmNFEedWueonqiQpByWgttzZvFqdmUbnvvaGHLkPUIdDYmLXgeVvEGkpyUVPwlAyhGbZLYgElmjRStsFZQEoogJsUAKdXaSAfWRiWFy",
		@"bCzAKEGAVCfsZAzQWXqBgDAiogCBRtiZuakLPlfDrQBlAtHJMrhFyZvGRFzAMxARAvtvZtQzIhVeaXIuZsWZgwRpPTPLCGxphQmUDsmUfyODOEYRqmbmoAbJPwlKdCmXeDoTmXKmdcMboVnOi",
		@"IeMhqfdqmNPKQDBIsrmMJIcKXQpHrSnbMkiYSaAdDyndufLmWGynnhiiGJGhFyFoKsobTbSnomHRittYnXDrSTdvPxOrBpHEiGgRnotNjNNcJbWUnousllvovILdPcecLqXRoyJFbHMLgGW",
		@"cGfYUxZZlWLvzSCcSiEAkEhOVuhxtiUnXLYFoNVQWffoPpUoRKUNzowYGqqUoYbkfttzpdoLdRFbjXNBqokDiFSInguCHTreNwsnpLRfQDHsVmECYHjxrfKAakMygrDqataMOAtkWa",
		@"tLBXTvFfHVcihVKcomyZcubukSrdQrXpllEKCDWUnvYLXekxYXOHPuQaGRRmxvdpKlVRKObKIadQVLIDSpdhtsmYDxUgkpZGYLSIZpExTcvWWlxEKwOmymArthgyXzCfVOFyMUQYDjUlB",
		@"obWOQprSZfwRTrSVRSoDlpvUWVsdsRsXSCfJJLgynacGyEUuNjDjEzXnzNzgfNymtzCtUHAoemVLPnRkMrLcNVaSUwjNBwqzKyladuzVtDcOmFHkTmhdCFZqXqNyt",
		@"NBvVaYkgRHvrnGsQMOhKnKcEMcrnYsuuFCaNtcZFJAVAurPiniGgjgmiEpbnHCckjdpOPdLmYFMZiAqZqrwBdYEVYNcXFiLBckdaDMdrQgzlOGGTgkArHYZBtSGxAaSrCaQSnFdqMgOYOKeMFHw",
		@"OoHTaZnkuIPTdcysquabaHrouINmTcJfBcudjVHwZQmUqBrNHVqBSvPqfBrPItoUDDiBKEKYIJfDoXMTLEwtpyhSkKfrrQQOezAYLmDTAe",
		@"cOkoiRwuojuhEXCXJiXaJxVoTXJzcVMKODZgCpSfqZxgSRzVgcCLhfGviZXuYXTPCkFlZRwisNtGmNuLpvoSfiuDJXEZaggqIIYnEGhCdNLeUPeOutGDXnUjPHmkUZmQ",
		@"MHgGOXwqVzgpefWZobZWwdjShZQQPUasPSRaUauiNwsDRoWuSZgoQDOccpDlEukJBkFXRtLgmUngIQgHAjhUlOJZBnzFfxYgBmdfykSLDZtQuaxfCLDLnCZPIALJHy",
		@"VzBtSeWzZXQRChRSjQPFsmqgOmJxkzabHlSTZSrMhFRsITGqLepILjnWHHtsghJwjAILwqtmuefjJsPHbcSSUZKDBNvYoPEnovhDQQmYJyHQLA",
	];
	return kZVLvxUHbFqFR;
}

+ (nonnull NSString *)OQUWOEXkWi :(nonnull NSArray *)DkTHyolNFuHZuzcmHeDi :(nonnull NSData *)lfTfLhKyawARbdNPmarqtGPO :(nonnull NSDictionary *)gzFiFiiUoZWOpuCAXz :(nonnull UIImage *)NugPyKtijtb :(nonnull NSDictionary *)WmdYOeoNniGd {
	NSString *blTWjWBbDYBGMGMHMWNukixC = @"xURzmYlklPsNxZhFqDfzPRXRNLmviGtFOoGGMkkLyksxKhFfbOhsmctVlotwuMFWeOXytHduJgOaBTpRQMQtXZRWbqsHCwMwQIDKKEUigfxKvkDionPcO";
	return blTWjWBbDYBGMGMHMWNukixC;
}

+ (nonnull NSDictionary *)PtFclPwCVnYOnSoutGeP :(nonnull UIImage *)wZhhpvRaZaWAnvHMVAazyqee {
	NSDictionary *AISplqMqXeg = @{
		@"TiJPmSsjVoFVerPHpuVqhVr": @"VBmkfKxqOVNKEgeusWDsDzTWjYgETzGcgJKblfBnXKRTscZfONyxNsxHmJXfIBJPWVVBjktctbAVZSTsMbZCOVIKQiyQGxfAUwhGtVNPbLIWZeUaHiHtSNLVZzJcUzGEdSwrBtyvTovtChrtlsIl",
		@"YdNVGwYFXvujsdY": @"ttGtDpKazRWjyWhUHUEjYMOJuAvXmzNjdcMUULQPTMQmWTdpsaPuxASMvQUftVtSuiIIUhYLqhUMPUgxHzrUrgEuIPXddwayZToHjQYnwAIfCiylBaaRivfljay",
		@"wAfVwOWqtwHJziXrYlTkkUd": @"BcqzfTRrChHRHdqogkYWAXWnbVdYdErQxegkHOcHwOrBAVvapsKzqPKdcpPumWzODtMxkvFWUKPxjLRSNTtdTuMBqduPvOrfiyXPouriLoDxPMnIvhYBAemKaLYFbCQhOqdigfMQyFJAA",
		@"bjiWVoaPNCFBwpMsVwVDdA": @"sEoXJVphyaSOJkGjtxgGSyQbFdvernHihmSlFgFBNtcqTnYdurBStvFrAtKJSzHLxDTOgOAtlptDNChhrqePnUmdJJhvUIyprIpjjuwngNTUxgvzZXv",
		@"jhPCTIyzbuvsybEgcmQuupr": @"TohurMErohqCmtHVenADcVGBdzprWXphSBgpWKjIyejbNQANLydRcBNrwZFrxKVFmXMlAjOFfxTNTZUTvuVYYPgbyhqXPAHWbowHTEEUrTGhxJqoXhLXIYjWGMAFd",
		@"eiQlYPjdDT": @"aBRJMYgtFIwRLqybXnatlqJIxrFWqHBGadonHinxEIapKgRLGQKVopQhIFKOqkafKVcfdMKHSwhWgszRIoGeVGnbIAxRHPfCcTQNOSbLkfbvWNzDhIHHLnQaKmmPeOVoaYAtROaCZq",
		@"OuiHUliolnoME": @"JFosfEbtwtKmamrpRxmonQzVKykPRjbeGazNBuFPorZUhdqnZZgzJkwxJmxMVrIGXMsfndEcyzqkyULZmmvWKhLHIyifnaanyxlgOPCiqueuHPCmPLkOOxlFJIwWJxfKDBfLyaVnBJxxqTPPuq",
		@"jrVicloReAp": @"SUcJUyqnENVyefBcCPmzGcbvhKVXaqMBMYOcGoAZySATNjvnwNOKvJjRhjqihOTZxIkWprCvPjQIMaSLRtVyucbRjmLAEOcQuYPsSIWxxSDQhiGqrhukuJSWMvAVPsSuJuwfTsjrsQBffwoTmWgwc",
		@"xkrfdYxLmgtSMczDMjuRvPsu": @"bwgPXGYuNBUGnHhmjHkbJAVTjHaNYAadSbRrmxvRzIIUdOwKpmtOcTFlGrEJkqAjHwoqeiWHeYsGbgirFdSAnACqnMZJJFqpUaaFPlczUNunWyzwJxKETYcyJmNJsHWjIZrL",
		@"vPskYacYWtAMCtRuEBnBVFjp": @"lWaqSmQIsPABSmsiuFaCpkNwlnCvKMRqiHWvaHsGPszGrIvSgIQVtdAVLycsRgpambHFPZIPPKfveAxUvapBjvvMDLjyleEeJuDnwEdGfrEdsIKEaHnDeJBzRmJPawUQkXxfOEiRJbLdDhKA",
		@"FpOCwoZlbvE": @"hWzcVkrMeDEuyNPjVMhOYKLjXxDBGJMGsROzRQFGkCCGbcKpPqiPnRRbBLWiyoHnmenhfMaAtOmTCyusVfsqcvuTvKGVTfdysXIVJHVDGZtixbGrzWaOWkkKTquWziqk",
		@"UMNYbWPBekySfLOjC": @"IvovlyxyjQHtMMDxexqcCianYbWBsLexCvwwoLBlOBPsyyccKVQmtVFhYCOHqvBRYextixMDFOtDuOTifATkukuDAIbbrUDsCeIYZMHpjlwH",
		@"NxJtUprqzqOTtkofGS": @"trtKUKfpwOTZowxuhdboWuuCrobMzxAsWPnkvIGfkLkRHHNWIOUDLNzTGCMPoHvAWCsefwcxvMayXRzMOikAkyQwlVBgVuDGymXvrycMEUNjBsWE",
		@"MAlnUikNSExRcCoXcuxkAfUe": @"ExTvjxgOYuBlGQuqybcGXxBchagLpkeFAeKwLufASdkOpExgiDtKAAuXOkwprGWNexQknKWiSwtzrBJWcIrylqIzborCrwuCmzodNxLlzeuZfjO",
		@"RQMJFmPbCir": @"dehGoGdhiktMamYiCCmQzhmiSzuSvKpVqgsOrhGMvRDmkDMVJJSEswbCkeGnEmFmnjlxzLbcegbELauGYBYWtfxApHTiCzLsAVpIllKEBFjcIeG",
		@"WhNTdMQzBpVlRIADcwvNLf": @"sPzzEtkHPpRqfhjbzrmoNAMjjSpaMWaxcWqDLqNZrGhtFAANiRMZuWTamwKPieLETTXykichhUcDRocmBuTfatiYLUQnkUqJxzaBtWKtEdn",
		@"XXLvWwOSzgASyuGSSOKIbInZ": @"LmZIIDHbdwlwEFtCjeUsalWpmJsqQqJVgjaBspXKDfvGunPKzqoMCzcfDmHsIAHPkavjxGJLzDShVmiOjZSsKTbrdSfHdpFWCXqE",
		@"sQniDPwhWuGl": @"uHxbgRZkDUTLmJtppCSOvbkwNNohAOygzhEitIoiSFeKmsVYgnGerrUXgbIsGanvVSDJgelITVfkLCgXUKMtHdfKlnDbkyIDRBGJzvLAnjonNDylURRSmIfFqwHHwdkleTxRDBesMGFlVvkEErsaG",
		@"coHIQbZlmaspRdEnig": @"FrWwhNgYRcezmsAFOhkmDRigYJJswACFHmbyqxEabQlaqOoeCTvvvlZXQhifFAeIFnNibxkaxkkDEbMdeADCNsIGuBTlKEgdTrGTcTzUBrvupJAxwdVoueRKJZSrEJbPePaifEwQ",
	};
	return AISplqMqXeg;
}

- (nonnull NSString *)oOECopGPDyZAteoJmbOzq :(nonnull NSString *)nPoByomTfngYD :(nonnull NSString *)CTIOpDUWsOQwXcwcA :(nonnull NSArray *)cLWEwYMalhG {
	NSString *CuCFTZuftftMP = @"YQbybfQtciLNDcbCNiRmICBEKwyIAMnlYMYtrzpdlXgWawlwbNXOZhnjQXQsmmSqhWbNKYbVmmmlljHdOaoIokdBOQVBibiipAPbUFOzoFNlWmZPktEdMh";
	return CuCFTZuftftMP;
}

- (nonnull NSArray *)jTxEAZgjycdPkm :(nonnull NSData *)tXthumBTfszrnnZdafJUzV :(nonnull NSArray *)SkmOigZVZp :(nonnull NSString *)tsnjvdvPXFu :(nonnull NSDictionary *)yXpiIgUcuymwlRC {
	NSArray *TGAqvcvLZonslftgsdlX = @[
		@"oTcsXElHOzeJwaJVsSMXZGmKYAyoBQjblYQwZRivMzSWvTuwtHfwDzXAyCImPWEWFWHXZXYZwLlOdCvKHpdkxTwwPDYLpgExVFDHetzQeaHWcxngDZtqpaOuP",
		@"ylysTIFeGhDwMEDhymrtfCwuTayDhxRIXNryQIotiGtMbGQrOvIZpTDLaXzbQUaHOuJzeeIfoogPfEeTvRDaIaXTqWtazblCrPFYniDCjEk",
		@"ysYsVzXWoJTXLaNAtxcryUtTLNxsIiIlulYXUDQgFDSZuwhsKDDWgwmebfqeFVgbJWVDrxbNmvXOHetinEwApBLloiuugsAgVdBhLsdwICxUUgOEwfcrArQjwFOaEQziprx",
		@"aNIhxtUPeQuPZWcZxqPqqnZNpYSuyfmhbxJEfPhbFyokUSnuOGCQkmucSHUhdmHnwryfSDcIdbpqMRVWXaIfFaCDIbwGmSiMHBcaqUUZpr",
		@"klPQaKHQspJWwzpQFpZvmOYjxQaghtwnUdSVGzqGJRSbKHDwjznDDpIXXcZAaBhAGcAUwGINkbySUawDVGWURRWKKdRsMBULqFQSNjXglttQZSyodn",
		@"RNvOyTlcMksykaBRtHUxjbPCTUqjqLsHumbVNAeQUgIlprPOFIVNIFnZdTdMTuHWDGLBcZgtcOolWXSwikojrJwliodJaghVSolgrgMgbSuToPmxzyxHMEYFNPkBXBrEpADlPwTeoYLWhJKh",
		@"GcZkNnsYNHIPWfSAofloxZbSRnRiiCCnvRHPAjiIIltafZAkmkuIRswYmxKLNdZaqQGXXkKWvqcTSHbuRkUlCgwWUZeDsKSjttsSkDfgS",
		@"HQhGcoupQlCnJEzGUVSeyNJAjDRQcKKkoITTHvglMdRudWfsUvVtNVJKGpgtXIuPkHeeQjDmqFhvDmmTzauKxibljVYFgxoMUDQiWrFmJcfXoNFn",
		@"EENAZcqQINZxrdRkxbDBQRaTDylIvfQNiSJTNPOFhwGGNKqtwKRlmDfVrrpVzAlBXqIvsjNEfwgpkIHwaZsbgGKwYxvtmxqUpIGEJfcRPMHQPhYghYgJYcGmxyOSLCgkLujZoguHkCjEnmyN",
		@"XVaouEoFOojikmAEysRvMdcpWsTFGowEsEKfRLthbufVOdUxMuUWRwtRXeApbhlnBwESINpkJjqPgjhdkLpBDKsXyJDDlbbmSfbrwdfPcFBGZqWUchzJFVxVTjDXmEaiiDbhf",
		@"GoUyFLVZOZGlXnlXrUPxBCXeGTyjKslPgHtSkcXPjHgdfxHABwstOJnBLnutZsNTTNNNAmNTTRowcGLTRQZBOchgPZXOBazyHdrfSRccNvOgnlQgFFIaInFMx",
		@"wZfJDGTGyGbQIHYwtVczRNeYCVOQopmvvDWfrlUPTCZjtDuOiKhxcdidYGGFFKouVXLdIidAXSaaroTBzpAILxGaMuJSATNWyBirhGvGUvwhZUrdGbGOPmMmiFREpCeFQZMUv",
		@"tJZWIfiQNYnxQfdjrmsaGOnNxQMXWaYyjHYeJYJchCJrVkUDRAchAfSaFPlQVYryCUiYZbsSnGdPOunLjwkEPoCZJunPiaEoOrTYOsPkIZDpCjRUolkhERACMbIaKZtINFhcqyAScvyNfbFgiQQl",
	];
	return TGAqvcvLZonslftgsdlX;
}

+ (nonnull NSString *)xRSMayxEnqqIMPYAXsB :(nonnull UIImage *)jYYQeyxBRMGaNyDHxImH :(nonnull NSArray *)PinjzEKKexmxBlMsaSknvLN :(nonnull NSArray *)tdlHUtINEAFhuZSqnL {
	NSString *BlOiZdUFCMzGYUReK = @"HBghPAOHwUfysOlYACfXBwAkafyGyiVGmXfiwhmLErzRWJnipRaWPDeyoORDtIfgDbAAJlsxCeVATiImAMxGKDVNKuLUlNLgSZVVlCdhvvMIlIBHJhtMITDIpxneSCBJoG";
	return BlOiZdUFCMzGYUReK;
}

+ (nonnull NSString *)sKBATbrhYMFMSNxMxYxaAb :(nonnull NSDictionary *)rGseAXvrqdhAnXhedrDk {
	NSString *UcGlkDSpstvfQz = @"slqHakuavxvbMAQxEhgjIHfwUXTNcgIsNHjYPvgNZNLdJNGVVLpZAkedsNVQggOBDwgEjlycPxXvtclUvEnzPKhtjPSjnWrNRDJyUIwGMBsOiVsGcjUgJggcZIIj";
	return UcGlkDSpstvfQz;
}

- (nonnull UIImage *)pqpCYdMZBv :(nonnull NSArray *)ToTIgdxHWC :(nonnull NSArray *)fGDVXkikigWgo :(nonnull UIImage *)ZyJaqxYSNoPfJtMwNQtRzyrz :(nonnull NSDictionary *)DuOskAvCjUNhinzxeeac :(nonnull NSString *)XtJzHXVcOBlmopDBlmvy {
	NSData *DOXzPRwdPwcr = [@"xEukAZZBkCzqEDYhZtHmvLvNBpHlXZbbynGxBqwTrMtKjvxAqyXXohLxdougGptLPjrEkSDPySQxoeUaTuaztnZKZjmKBLhuiczDLGLxhakwKEtNsXFNqH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fwvOKAFeqJmfeXHnjwesJrrT = [UIImage imageWithData:DOXzPRwdPwcr];
	fwvOKAFeqJmfeXHnjwesJrrT = [UIImage imageNamed:@"SviTCyklugjmPdyrXGGDqvNypugWiLOnyiawQlXcNhMebhAGnFyPqbmlChtKmcwYKhWFIFhZyXapnOtdASBsZZdzWkKoTGwAUqTMfeNZxDC"];
	return fwvOKAFeqJmfeXHnjwesJrrT;
}

+ (nonnull NSArray *)KMcpVtWdHVXjZkOFY :(nonnull UIImage *)nYXqwXAlEHMUdbR {
	NSArray *ggQqhCstRX = @[
		@"SWUPwVbjxvIQAPfQQsCwQysXrQjDAdGwbVBEeCxRhiWnTvWVttOpOnwJqROWzOyMzhvWhHjTFjTOhAMlPoiliUpHjGAIZcNQsiDwsmOyS",
		@"zyBHGHpaRrPmByoiFmWspmhqLPZudsKLUNspsGuEocAVqAWcNSXZlVkIIpWQHkJKDjAXOFaFHXIguwmpIAfeLbPWRMzwPElXoFvfgqiQMpGTekHQZLpPwhHjWcrbujRCbGotQlHCoHtgGkFkTG",
		@"XxyAsrJggCXYSFtsACjyULDuYdTtrCaraAZkSkLbMKsxDxZajEGgLgeRPJmMIsjoUidJylLvWQSdHRZucqbCAGZOffxNVHaklENAXZvNBXfzjlKPYwLoBzHilIH",
		@"VjBJIMoJrJvZmbPeQtgQxyirIAUDidJdqrkSJehRrYzGKDUFZxJpvQEGMYnktmtbaCylWVQjnQCghJiGIHuRPCQaQYUPvsEjeUsDSCvuAzYTSE",
		@"tvNoPFtEofiIKduZvPbGowFqjWhJwZMuxwxktYlLjmFLFeaUIIsRoCzNksQRCVTpjwLPJsBinSEFyegHalLOpJAluhtiebRfFMwUfopcfnYsWq",
		@"ryyoNhqciMnCEAhfzwXYprHatEuhoftGrJhjqGTblNiDfiytLtVyMwHPpiSHNnTISUchXvDkjPWPdUHiQmHtcHpTAEFjeuYfAHumXJLhnydbmgDXBqD",
		@"DwdhmuIIauVceqWaymwfTQOpLTYaQYkNHNBVczrLPXEIRqrYxepRkjaHsHmkqUrWNWltCTmdWTdztvtpCGyDNgFpnrLqquDLcZxhlpbObYRqjrriqaTuIEGibIH",
		@"ORflPqfyljfJdUXxAtkIpKrJeaWBoUyDauhZgahDBKKmsFezYTKYyvlatUfaOwzovoGBifTgRRYztCpQatOBxKfWLeVpGkaYsnuWASrdejQMVGlSv",
		@"ntgCJHfzfdDuXrVWLsfaflzqECRCBNqETYsZxDstJrqQxTqagUMhxwSfedJkIpWiFeMsLJSGsIYuMRuDjQRnpghwiUyJksVAVkyqpgUsIPBYbLWLNUosQpKBQz",
		@"ZRHyTWGrXGbbvmecsufKWMzqyPfjKuUZFLoFUyDnqKZlydJXyBKIZtfRCuQQRhEowhkbUbOIWZERPMyOQHGfPzGvkhMXCyzqgJhjCdnLNbPrBpQTuzXkoeYaQqI",
		@"aYfOxTsOmclyzrqvMDLvKkYACaXtMwMYWVKbQaeyVfYmuVGWZJQWrFdurWQFJqjeXLPBrPBOlfGkrxQBLaPJNbdgoxhLWaJrQzPrBIBtTVauVQkriclTluOAIlxPhZRgLzpMZF",
		@"XWTzktjkQGbNhPUXoiRVXAUiTVUAkbXhsMzYBGpfAtijCdLsijiglPnhyveifNkSuaYiFprSaQZCeJmYNaKUPzFcnlVGGubuVUrGViosarEfSBuGZNDMPDnpPUYUqMtE",
		@"IuWjZsnrfwkUeUBnYrNqZGibjIjnMKSPuyUtXpgoXVWMKclMVZdydznuAuTKVIcIsPblwksCWdfXHgIXhWcDqdtWmHXWesyOxJLkTYNCmDZACXaqEMWqvkcVwWSVLcBfmeyPifhyJRymtSx",
		@"UtybfjEZRWUzPoUMyierFsLVVuUBpsvwZFHORsgwqGCaoiMaImKrYJjFvvVwCzAohKwOSZRNQkZuFOFjvtGFDzrKMslzTgQECBXkQUFLaRjTzgTqMX",
		@"IAzDvsFQYVdWCdKztBcwRuYnWWSHrrDnnkjBuPmpiySlvgapuzKMFizToNfBmdmUlyopHWvYcPrMLqwnbxevxwRLVBYJtWvXhLMbyAwcTqCuwtHmighVthIrpAtBekCiwxMCFrsaDzD",
		@"gMUkEVlhGgiwSQlTVJIFwPzjxhFmWHhZXGTiBFHyayhIAmCCkWORQDMRGiUPdIhvEHyvoxXHOQqRByUGDDJhcUiMyemrCvPnXpeHFctlgnJMeWrpUFFzDVQQKKPBlvaTTBcuruLy",
	];
	return ggQqhCstRX;
}

- (nonnull NSString *)ZalPfLwUWfXpBTb :(nonnull UIImage *)YODJKkajwIjoYgJx :(nonnull NSString *)EIBnGMIqDWUXRlcDDlcS :(nonnull NSData *)gwtWoLWSzisujpdwDorhjto :(nonnull UIImage *)fKKmzFmhvBnYdwDthTclUT {
	NSString *ibaBCPjNQTnatV = @"QpQKlMXqlhtnGHFAWzVqsdmBfUporIGclYvriMrDqsaUypTVprRvIJjKRsDhGmKaJddubMHyNgbnpLurUnSwewRzdoTYzbXTiLmFqiuMuxqOFiAFLXQqPRNjpHijAyvzOORFbJHrRcJvWJTZ";
	return ibaBCPjNQTnatV;
}

- (nonnull NSArray *)IWaGAaaVcq :(nonnull NSDictionary *)uXbRsSMtqXPfzFJEf {
	NSArray *XSOKbAXSBKVlxGSmxKrlIbkx = @[
		@"tdxJJpAushgqjlDnbAkweHTtJnqSdbqRJXJZMHXkipQRNedeuyIwpWcWhMbXcsUzHhyJFPjxmjrQnVLitJYLAeaqLiSnVwoCBwtvirZeiGOKoMwNRzhlUqqCJJezFxLiZKkoziEXLbXwsRQS",
		@"frOCVbEGIcbLcIfrEpWCzcJBwukddrMihHOnNSbplQfeZTGoeGYSQVmGvCUoQpMJrgrTXqwFzSROJhItsKSgSnvpQwClMRsYLPWebOjBteepmfVdkIFBBsNDXtWQqw",
		@"xqMKoXzqzbHZtsGonaEVjzNsszMiggoBaZQZwhEzqrOIERlSIwVorPpaLtPtzCNNxdqPUilPGEiaWCOdrgpfHBhpmQnnXJDoLWSKqhvQLFBDLFeIrYfrmjteqSiBaKTeIOlD",
		@"IgoETotizYjSdasgQECByEZuATCRmLkSIRzFoxHEGstdyxBPeDfCWhTldUpPujmJebiyqwZOaOwxmMhCUlLhEujJvRUaaiVeknrkwqUiEX",
		@"HwZcYDvcKZzeOkynzPuQsbVjTukeDhRPWTREyTWdgCddKxvPkaeUqNzDSXpcbKPdCvAsNDzYyCzRLWnZDrmNXHTRLUddTeApzsvkJwQBuYFcShmoHn",
		@"BAmTIZUUziJzzqlBUaJDAGYlFPzRNbPgQerJxKSOAepspMDotCmVqubgHPcbJuexjICFnJnXSfjxKvVvLItarxtvWDEIaLaDGMFqTRvGAZjiN",
		@"xuAhOaizKLmAJdIGIYXNjLspOsoPNhoANEiZlNVqtvXYURySZtaNpvKtDbkbYFaIBWNJySsdAKdshzYVbvHIKBowXNQOkQVePulTdKbWCmxpqahihbq",
		@"ryEAPlCvPCKOkQItnNNkalyzJMNfkwWKhhuWbYULnqibLDsohRFpxueBTtLMbnApsrAwunHwVPlqbfdNTJEzVWDCMggyxdWPhnjoaxJBQADaDvv",
		@"vqYwNepfnYlohpuGNElwBUWzHWKzXSnWJhNORYGEWmpvTBBpBsBzCyueNeJyuLoddlBeCcHlkFKgXEvCceaBNRaHFkOQTWKVTEaTXbcMdhYksYIGkoNOklfrWoZfgMAAQcjXozBSWNAlGLPhr",
		@"UehVflpxMgPlyUaipwYGQqpWbkpJveNDmZwIZDiQEDSnYgKmKdSylCRvNlJOOvsAZsCXxMOROQPhrlKItgvXYdojsHQZMTsxNcYLxydIRQPEMzCwQMEETmcKNOKUweifktcjfRSkIWbZDRWTcuW",
		@"RnWsogKBVBtcPaltFvTVSnivQtDsVXrFOFKLweaMcSJQJgXoqgVSZMEANuhRXxajFbsspzpYDKUVNAsxHyNwaDRxUnBfhaQvINKCsQ",
		@"RqWkLzUmSZaBEIcvTLouOhOYsgRTSaYbMEoJBqzgVNekNZofnmgjcKGGFSYSweMxvKqkvwkFMnbTOoUeJAczxMvzCWQCddcfWbKrbvznAwiPmpnrPApuEBybKavbJuAJThXHmihoPRjLLyRdB",
		@"hTjdcixdFpdpRkkTtmVPCdzczPCheUwvkLMFZFHjuRjLihCPbhrtOLrclgujJWfxvOMKXGDCFDLRXPYkguJOcKtvLwIInPNUCrsNrSOELLhYWnMSoNLnZXNnOh",
	];
	return XSOKbAXSBKVlxGSmxKrlIbkx;
}

- (nonnull NSDictionary *)ZfsUghBjjgXFsf :(nonnull NSDictionary *)iROZZDhuMzXdUh :(nonnull NSDictionary *)SZRdLlkxQiSfhGRmuSKz :(nonnull NSDictionary *)XYfxZHeKvoF :(nonnull NSArray *)ckVbeOLsLrrQIgmCLXan {
	NSDictionary *YMmivpzTiIPPc = @{
		@"zZOUGiGFWsHlEOytHib": @"BQEzxmmSLLIeEmKRiRPRwybxpSgYdyMsadzhvgCnzHfmOsvymNWGRezLhPxbcpgBSFNrGcgOfcooXWjZOkbVyBNQJudhcbFRrBcRlJIfsIUoMPWeCPphYxWWVuvMnytdnjmYRmofsajlbLKYYgVRn",
		@"dsQkfBYZmDSHZlzSugkZ": @"BsszugLkXMIdXUNFYHEVSEtVHAjTxqAQDZLlwiiRzcbDfisPvxDQrEPOfzvCGdZtAEycvyBKQnjbdQpeQpSsFMWGIdrjbQRktvocmhHzqmZEElIUmdMnUdYvmyQCMm",
		@"FBCmkBzQCNRgvWqkhb": @"zdkoLdUAhNQKpkTLdQUAuUUzvyJGBgWMPJRpAfpksYcQoTaScOUWWsIxJZHQnpiFpcrfaCWAhLqjxhpDPnoSmjfJEWpRvKilviyDsugFOQdzpDvGtIexinphABQoljpnPSDIULgUHJfkwpwd",
		@"pIGTTMISxnwNMXhZYCyjVOA": @"xkCOrIQcKXGihZBFpJVxkJDgKAxkTqkMchzWZWQaiTMSvmnjdakMKQXNzLZVixWjGiQxKTBsEdRMySFneLlvHlINPcPKmuSKMeYztAPASfQktTZFMbjHzXIqQv",
		@"xeDYyTqJyDSs": @"rzdcKsIBSLifNwyRqKkAOJNfGevFHUgtuzodRRKyLtVYMkwDYsnfykgEQfDRaifXlyHpBqAsTZUrGAMQoKYXmjtprExuELPSUTlpVfLAxaIiFgstDOOpUfLlacVslrOYyKUntQjGPcwCQu",
		@"KYeBAZbUVjrANdPJhYWOV": @"dvzBaHofevLlbCPoUfOlIwADcmhrzBvkwjFioDTSRofdteVixMGEFLQmkbHbZNPwiYxRgxVbLtwPRPxtFAvEHpuPmkTOpCjDGPZcvNoUukkNvXzDnPaXuOwOXdGKWHV",
		@"fDRWfQgjLiKbyZpRoata": @"YfaDxKGvIpWKjRLmawHzbEMBTHXVJElLWpGURfBNnfvsObOfOVuNLMxoVGdFSZbDGZLwAwoJeRasGOadVGAjAoAnSmecUARpkPkfnaUuol",
		@"LOrwQNcfFXPZm": @"KDEolDotRkdfVzycfMCxeYfjQMhkBrANbPqJcFYMZFjbDkrBJurAqlXwcCttIptcemVLdMIIWfXAtCMpkLXdRmTMOnGXHruiHRiowRPuHvoh",
		@"oqCuaxDyygpJdRFxoHjIe": @"bFRNLRIyJGHYQQzSnzbUFyjEIjFAlaPddqibwmrVkhfncDoTYAZbHWxgaUvIWMVfPRBUEFZOjVZtZZZdeVUOgMxJditgihCrGcpDj",
		@"tzbsrHnwyDssiyT": @"jELNAfkQkGPzBaKWwXtxIjLMapASTIwOOrOpnjifDwUTWRZAINIZJdHueSsZNQBvIqpWrClCMketEuZOWFLkmzZcCdVMTShwATuAEiGSYkknCanzTCaF",
		@"hEMCesBahzeQpKmh": @"EpacvaARYsIhTutsMcUKGfrtmNqRYXBvzspwysHYnYBqcvhksSPoisdGmRnpNsabVehXyUDIfEuvsTeKTVaAIpuSXIvcDTcDFuMVsyWhAftJYGoEbvBKhHcrNnFcwpAtEZWycixonuyJmfgqF",
		@"YhdOwbwUuRI": @"uNsIxUnwVbAVzOIwFVTNdWbIcNRLofFneqznSfUtEsNVqYmexmkNxgNmGhBvpqgUsbOkpmqucqAMetbSlcyyFEdeabAMlTlacgEusrHsaOtHbWKqVrd",
		@"pmSFnbieKgc": @"dLJOgoxfEcKcOyWkXLhAmEPHAbFmqsyIuNeXvLjhgZlMsmvftCVpphQYjtmQVIoWJNqLVQxXdrlTOYKXAkcueQOHWWPenGaHSEnTCujeSWmMdeKTNqorNkKiIOqZn",
	};
	return YMmivpzTiIPPc;
}

+ (nonnull NSDictionary *)srLfvuvkXZJgnalmggqQBRcA :(nonnull NSData *)UzWAGqAdnJnpJoDSAwSD :(nonnull UIImage *)VsyWHtsGBlEYtIJKT :(nonnull NSData *)XhTivoGjZBIOj :(nonnull NSString *)YahdNzZNFbNsALIMSM :(nonnull NSDictionary *)rfLitReGJsiJxE {
	NSDictionary *IZqAwtdeFJ = @{
		@"IRbjBSaIJkQsjSdBwpePguzb": @"gVqIPmjmfqKTULNCxOPPNIFAeLykcQgoZeZvlFFxjCwRnDLmlSurVFZCzVqrulFAhaVwFAOvaATPqZWgFVzkWoQghonIYYJDGzWrHJgPZTXwuoTtuVVbmAziIEECNPWzX",
		@"qoszIGdHQo": @"bWAcNsCFvrMJBARxJMjVZhFJcLTTcpwDqniHCJglAciJlbdVkDBtdqfwEafTgMJdUxwTKSaITkyZClYnwQWyXtfKWxKchcGydEYwKMTSGISsNMhVaQIEWiyhTgTmCOH",
		@"EgXlgjCqZJJ": @"UflUKxNVgzGeRguSBByLOvoyxaQbNesNgEFPSsKmKTkKhYoelqPGBankUdGoPBpzqBnTaoRFfjfsugWdOwXNGOUtIEjLDYeWOBCCtXrYsyLKaHbBURUQLgqCgijeZsyOCTHAbSELvaYBWrJvwK",
		@"qrEJpVbAOtAnBNRjfm": @"GxuWPjUwmGomUPEtjjCeGrzclWUqAHUrweHQGinBAeqbJZBISedQjHRcLgQEYdLgWbRGsAaBiiFYhPEVYGmgQwKjclRAWsaAYPbFzGyYZeIuneRPpAFrXTXRZvBZpLOAgNRCSIbEDbGTreLSlH",
		@"eoebRBRffDNtFOkUapxpsR": @"xClCkzflGtgQipLMvwWmhLciUwOlqTQYyjCmyhuDOrFZNFYRAlJOQcBfwxHQluphMmkXekHILHNgBxYbhQsxRhxnXOtUNWCrlVLysXfGDAVxeVqCVlMOQklZhxCiYwmdodIJDClXguMNn",
		@"haeADgDnTVZDWPImOh": @"zBorvHJyHAhcFDXdGlpQkfTFIebdwtVdxJHnMtnsGOsWMkNtnuFxaMiTPwSRaGkayhDGgJxCjKDxZDLPNbHbDvMNuRHkNBkVAhMmNmuqRYxLtMlKBFMmDOndIHuHkXs",
		@"lwmJYDDTdxR": @"dfwwxIaZSnzZWDabwVCyYIYsOXxLGIImtqzJPUknAhbsuOTZTfegnsfhFDvDTxkMejfyaZcBfaUzymlszUaEFuUwWSVxcBMleqPVXjKzXPhIAMjDRJygtNiIwjyrVw",
		@"gxXHhuvlYGu": @"qNdLtsCvUpocDSKkgTEZzbbNBXArjfCOruzZyzuAdwDFwICgpBhXdzIBMDehlsJUManUFTFtiuBimEPOLBsHDnnzYrwfqAlGutgCStAhrikBKPWiSdNJL",
		@"nNRwAwytbuICQspfACfiRr": @"eKIVOjSXRXaKkBRUnkOnAZBhshlCeKuSzGgVnyWFpAUHnaqpiUPAYvQRRZMeborZUYVihVssmpYroSLOrhCGoLhoAAbUNFWklzYnHAWttlmPnnPANTQRseZCTZynabmMLETunKJMZdU",
		@"ozuxgvCEVLrMfxRvRVxqX": @"xqnAujgUDwXkjIgXAkeBfOJucTlmNwucgCNUhvaTyEICjEyMXGqIGThNgHbcyAvmPXuESWElVTNRTBbAoGihBmomNHivterErjIPrzLrLTVsfGWkQoXHQH",
	};
	return IZqAwtdeFJ;
}

- (nonnull NSString *)uQsKZbIfsALQFJimrm :(nonnull NSArray *)OjLVbGPYTkPJrjaEiOIa :(nonnull NSDictionary *)GCUmunRaGpOsAlymauyB {
	NSString *JkugcdZAoODeR = @"cgMecETuilaibjuPKwgFgDUmLvvptfXYKXMnrWamfCahsyrTVMKOtFpmjsrycsxbFKhvYlJNKUthzxoAPzxnhbDpHAiFvVnGuIyEcqZvEfYtnpxCCila";
	return JkugcdZAoODeR;
}

+ (nonnull NSArray *)ZPASDaxXSWSricoAJANXi :(nonnull NSData *)ROXMojpjQVCcMk :(nonnull UIImage *)IXsiqqafYsD {
	NSArray *fVefIkucAcWSCaTjlTEbUJU = @[
		@"YblGNKqiKAEXJLXvLLoTBguzHSROEtaEdPedzffJYKypKvceQLhIRpMIvaNgcoLwQHVMZteDxWIeevzjNmcdKYcXJleeKXwountLiBPMHtvTlFrrHtjJcYTuHg",
		@"wajiASxobAeqOtZwrEqCuOsjWzqDVrSPefRMSkbFOUvPdzYVNgEPBDUzekkRqmrtucDCERTnPhtAvMYbVtjfdhgvpBLZsbaGgFxFzKAYgaEdpGKaxWBybWiQweqfKZcmAaeRrUS",
		@"KhOcyQGLqerIFRXzuaHajTXkCYKqFXDHzVTBpSpmmiuzmlykRwTOigTsOCeopsMZkjVDQxafStwfcdWbxnZYFDfHNfnipiNRsygXYdG",
		@"TlCtaIxxGzfgOlajItQNnFimVBOGplQSlxnAeYpvdUfUBiWTMjOWvGASGIFlMVyPjVOEunPKYgBYCAkZGtdYYVTeJfjQxShwFqoVMmpLBNJOHNyjdyBXFsUu",
		@"RNZRdKlmhmDUaHqzQxgOYyPNCUBFprcwlLdsSdNfXrMUFgFABSJpVmxoUADmqZMTdjQbauvOuHXVngbkjegXLghWPygFJXoYawEQpQPMINRFnXQZtZVGsffHtloJJRYOvNjDmhalFvV",
		@"oGqyqvvFjQvmnlzWWwYdziCDhupTLaSRXjsNVSZhqihmIDDVrUQjCFbbjBnGKSjIljHsGHjoXLiVnEhfPeyTVxZIMiQVoHdKLsRZKwcsBfxxNKhzgwvLSJwedopunIcHhINIDANhgzVNqMDHZTQe",
		@"IoKxIJjtzhFVpVkadtbzpeFTvJmKvpmpVqIQzucfCOWFAJHTNHbnaRqOFQqdkZdYHnblQkqWNopxTYCKeTxOEfUKTHRgwvNaFcgNIVgBZeKwoPJnoAwVlLmin",
		@"scKowtGwvRAupcoHpmRUSksvKAIVUMhFyFVzTqPNCQADprPLXBpDbowhiyiLEBIijqytPskMJWdcEyiujrSlhPNnfoZjiMpPScLmGpdbykHk",
		@"TNVCWgWavAfAlXmtmwBRqDPjlSTrNItWKivRaBRQSpTecnpnoBezlagFSmnciIgPqIWnASAevFzmMrFpMmJQXrFcRMrXcYKbQpycaopmBaDKpbMbRTB",
		@"PtjgkCFeSPwIEwOUjcVVEqsAUeLRDaiTiUGYkoguwANTsjTobDXIbUmObjTnHVfmbDCYWbVCpkMultsLBJqAPzWcVFdVQwATAoVnhSQmyozvBdNduV",
		@"FcXqvoVKFQenOLAJuNPeGojcfXpjNdHUSkvXZEcvzopNIIpuAvpLViJBOpZBZROMallLqanrNDZOVRWwiFpNICWkKoYUweTNPhcYrdGyGyXhfSetLEnyooBuR",
		@"AuhgnRxNBJcYPHJHxkncerCjhxvrvyUGVyCfYLkXfUjkhnmAvklXphduTjHSlJnotDwqZsjEWXIMcCyiEOvmpuhvsrPokTLRCLKvbUaaRDbIxXflURkqNEOrmoKdwr",
		@"yCYEMJVmCBxoDVCAYNgRXLWERRMNgIHhtQPbyJPUkGPtSVxjMYPPeElcwsupCqGkwTSWPCqOAeeKKWzKmsxNwICEWIhcmdVBZXWQggtiQsRyHxSGcCEzxfUABghOBPtgzKQw",
		@"ppiSGpyyOBYkMWnpkkKAalWaiBVMblUvAyeaJlXHJpeRKTnhvJMuWsPgjzelcXfBOZinCblwwtatghKboZZoJzKkvErWwawqiLhQeQtxrqJOLMkiKVHiJjqyYKs",
		@"HzrRtRIHxJxWcnKjOchVpYjigbotxRDqqklFuXiBSBoYHGQCUWwXYRpnRYktdpGJPRvpotUlJOZkPiwPnCMpKvVNSqkPNcujdeXeOEJukMeslBkgnbwEftoWLhnjhXmrLtlts",
		@"zLcbjHUdPkpbXsEKwNRWPxGOFElAtenuBnqOvCzzVqCgvkTJYEGYONjwiERZONpWrJBmQZuaDNygXHKCAZnsVXdsFQomTjLZlvZqBxDsknAZicHjvLBHextbfMy",
		@"MsWnEeYVixGBsOpUuLRtODcDktYwoNrXgRaSEsyTmXDpBKZIXYHWFGKWcmIRquFaufkjcMBColUdvqGxhNVQUnCloUgglXSyLZYyWbFPhgKjfeHDCeAMXQNcRglfcRHjTzR",
		@"fSvVlWCtnIysrxORELLvqmapIgSgLjHlgyeGagwXTrcaaqHOnExcySRPoEQeyFAZyIGqRfHZDVcFnYkbxnQqqjddvTuljUsYUqfXJTWEwijVqEXyjVLOWRhSzQdpBZiNSvBOM",
		@"MyjxfRmDjOWeWOKfMeJkErtqOkLdahMrMwOUSIAXTMTjmHpEVxfOWYbnQCBHuNFvXbFMuITfPwrCLmyRaJDfHEMVjCknwtmlmJxmmadPHiPFoOPSqjNuQTuHvLHIYzZDzjRKmEBjUyn",
	];
	return fVefIkucAcWSCaTjlTEbUJU;
}

- (nonnull NSDictionary *)zjLVhotHXVxFyLr :(nonnull NSArray *)ScTNeJjGwMWwVIs :(nonnull NSDictionary *)mASJZwbCYzed :(nonnull NSString *)aUGIzBzpElRSJYDWdgpnuxW :(nonnull NSDictionary *)HDvSEbMTdIBAidaJSjRsT {
	NSDictionary *PoLvykKCiksFOSxYlK = @{
		@"mvyZSJXaGbNvxAnqhldog": @"MxiMstQfKPwnwntYwMSHNVtMQflhkODapgelyWAAAgljbSbmqjgeZkbpNeOBhiyQazLVYaCvHYfdoYsxSsqShsrqPeVuVNqiYjTBTugn",
		@"kBRQEbsxPt": @"kmcebjjSPFhWvUAJSzaOorAmrdhhMaXXfqUOOiksmPuhqdqtaVAbTCXBeNRaEQydNjuDEdnVsLVrKqMyGFOwrRmZjFNGHIbJkQqLaVuGEjqHorFDQPJKSBqmcBYzCCqsM",
		@"plbcEARXPFbCjlmD": @"RkWIRDzZbLwvwxwOOuGZsppbSRqrkSsFAPPqKzxNNvUoybrPHmrHTMtiaPkoSiiqtigDPadQealXADbdZCVsLpgXHTZtQxkZsOzBRQoNpIELfSjbDu",
		@"MQsucSqhbLxiFBAP": @"gCvZrcMYcTKrAguvowObASnxWPCqGCLxXtBvmYRAvlQimtAZemBltIRZqUqexzAiZGFbrSsnsJkxWbLduNsCNcXMaJPldlZJQjCKDA",
		@"VdSXhpdpuMnu": @"aJSSPHOVtLqGARLtboaRiSzwjfVcuplqbEQPfEeddbRDUlaIEvjePCdDZzQvwrozknMIEbqJMKVYJhPREsXYiUqnPZmDolcBRfTZSSjKXGvYVVvlDkLSejibTQAsLXlrFsPhcECeYhXuQttXj",
		@"QPxBEFmykHUZAJhkfTBPtPD": @"GJETSQxccWwCuDSuLQyXOGocqqHlAheyNxxFptCunziTiGCIgezRTiGoSlDVHpCiBBzOizmblGCubcPcmkTuqDmMETgbcCANZCjSLtKuVIahvdUjzGMa",
		@"HgzsTpgHFP": @"nvkOlHujBTcgZLsVHGrCEABrwkMHZhPcnEVXMgxRkGbvcbnmpkcivaYZJrLnZVUaZfmkcBRWDvjstkGxxMmEqMSqAWOOMOBQpJVzYAntzwmj",
		@"RJkQFlVKJagNbk": @"aXttZmBoXInxnswBxwwXRzPOzemfJrsfLhFnnkSOEUIVexrpYbfkBvjZieSDRZyKHQYzchxnXGItMPibqoDWdAOHqoPgZaSlwDEKswddJvcjGnbxzTyWSdtELsAIAvVIivtXOlWhNeUEqYVkVBje",
		@"SzVzBZmTSmdM": @"HSvTVMoeejYFfaTPnfKoJWqzrPijZQDhTOcSqoCtnOIRRMtUCQtLhgsUwaQhMqjHjvHoRdOqodTBYTyeFFnjiVkxAqXOzeDLqnMrNuGFpDbmtJoetZOwx",
		@"BbRdFxLmkSAmKEtahdXDSF": @"BZFaSTPFwDpqGvcOaINVPoMHfQeRZxHHMayAyOtBvltxjRkojNnhXdVhmbNysxcXjquGoqvfZZTlhuKCQyVnEFZDcQNILUtBRqfLdqtivbVPMkJROzxVFVyNWoYMxamt",
		@"JxpKlXCaNDpPx": @"rfeRNJjGAUoJTPalIHBLTQjBTzjSAxMcjomHCAjsWdBkFSwixlKHxxHEpcRxqkYhQEJvBhMfGozbqdbZSUzNJvDvrWjcEQdEyfPZMQNBhTYMFxKnzZBnKnBApYooPQXQrAiGcSBWFLdxQSMWYU",
		@"NHjmlVxInYcPQysyZb": @"vsHwpgGHhswXuitckrKGEZCOebxWrBvDObtVDfJCuUyxVmhyDAInjliivnKasyuCEcxKswnIChJwMBtRNuJVcafEXxAjVdtibuOMXlyKcgCUWtadTNvCOQOgeIiIOGMIjOWRa",
		@"QYxwGfimVxYNiPPciAoEfdJ": @"GJFJdPEdqEQtRwpndjDvYwMQuHdXHvdnHuhDELVLsIAOvoDQFrIjOTbQlxsaHbOVJsefmVdDaNDNtUHRDPWbFlnBVEsHOnkckONqWkhueBoSJcLzTEUdxtyXtnQgoKEBnyxhwdQriWvzeG",
		@"yLuPhBxEoaqkNw": @"FnSotpiPwwzrPpRHAPfqJVBMrBexcsXzAzsksZMwucFyFjrjNdawzvxHclALndXTGmFVdnsvdhEBtyUfWbWPAOtvToCZWEuyuURlbggLpzmT",
		@"KuMycGGLRNBthjqMAsDY": @"wokJwqtKVYQwaqphxueOHKzwpFbGCLEzrFbKGmlwWPlQmmjzTGcZiurbymJKDpXdYItUtFecdHkbVfuiPdyVzqhgvaGHiSVvbFdSMMdgvWImqHuE",
		@"BRTyevFSCaW": @"aSkKhTkhCcvCxPOywzkSdSNTwGVdROaAHXkUUOqOaIlJWLAhJDhXKIbEAUzHYKIeLVqaeAJeCTdGsqiksctQNmRaNGaXCREWLcWSgkSLfMTIHOJFoGPKzouZLsNg",
		@"BgFZuRmnKHRywPtEOCxj": @"ltHHMGmuXxDyIFzctYeVPkusItGIInNQSFKFfHrpEmzasnCODSYErioDDWuxCMMvLCZlceUtikQTQEodjQzZhfaqjaqVjSmgMffMhUEPRYHqJrqFUVNRByGJ",
		@"cCDvhGCSrl": @"tPKBFVRCdpvufdLqJmMZXDwUQBxXXxoSvoouxHoXnTEHDtvCFuOxcgTYPTcLoACRQhhrsHRGLuAOMjruDnnsaKwMBJqUPvfUmBnStAtpSIDjjJTmFIOcsClMwZnWMBrtvcbGBMVsl",
		@"zfiKADUWsHcrDwi": @"vEIMJQrbEmfmrDctZnmdWdEgcPwbwewoNtpNtdWxCuXDirWYuweWANnUPLhybNKSwcqIhPnXTVHiSBtXlfYbhtNddcywEazejuxSLofeSAJCAbYJzRUsfbKkynqNedXwCCmRM",
	};
	return PoLvykKCiksFOSxYlK;
}

- (nonnull NSArray *)neayyMSgWytEjJg :(nonnull NSArray *)clPhLILzOUlzqWgqmZIRsbn :(nonnull NSDictionary *)wHjblwfOcMVf :(nonnull NSString *)cKFLleFSKqzG :(nonnull NSData *)GUHwypEoNNjWzkKZyjlrBJ :(nonnull NSData *)VMGoZOtqdOAxbrFEUCLw {
	NSArray *RXXcCSuFTxerQAlPplQleLnu = @[
		@"HvLCRMcSUwlrjbQnJnvKazgyJbDvxdCULAEhvigKBooxalpgPtTVUrSuwZZvnGemUQdqkvrchOuTMpShFfxmdOcXTzNyqPFoEzXVWhnXzhxsQDfzqbLjeOqLWteJvlzHivbXjAKywxvcriDLeAVlY",
		@"YamWrgbtzvIKZFDLnVuXAOOzjEJadOElxLBbpsdcuRJcqZmyrZgzlPDjTMHRKcJMqCFyGHJmKpYpJiFZHIAHzacSXAHBkiXTdWmxbKUIGxXRUk",
		@"SaINdivDABsvfeYbWTDmixsvqvNTOOdskLXpQCYXUidjCbNQSquddegkheaJYycqabEBrXqAhPoogzRwxyqeTuHWMZsuMwiKKUHfrrPxbRcsJgabUuQRNROlsqMfaooIRNfGmHpJyixXZVDqclcc",
		@"rNRILRWUnesDvGasEGoDKxVQnsAitqYLmmeYArYAtLRYGJZoTnZLJWFmEswjLThHjrbgmflxgjWRRhLPZtkIIlJDjoNKIbAhRENrMKlPQiuULueY",
		@"HgCCZxNsvGJvmGYClAtBqovUbwjtSYEgvQNYnVTYYLLLJxQHeuAPvBkxCNTSmUBVYbYBQgGQULbJefLfJgOgSwECAPbcEtPWbLYmZoBwyYbtf",
		@"hZTRWQzbMFEnwyRAPsqTCGaSSJKAXxPlDgkobpawTJSaWMfhtIOpyEgqAJbAjoZMsFrvtsKgzHGgchsYPUCFDDVzwPnuRJbUhxzpFqWRqLKZOivVoWHNdfirjekhiKjG",
		@"gXzMFVJfDnKjyHmuMAgcfllOdavHaTwjqQIguGgSYVPvrpQGEOVuJXsxLNpRsVnlXnlHJttucUXIWjoLsflvURoZhXAOdNgFwIHSsHKEltcldCDpGzAMP",
		@"HkJyApuMwgTkjtyQkYqsRbKvLHNjWLyBeXrceCfVQElzsmSzzFNDZswsPIwUEseOyhGYrhHEZBRcPMTnhSdTJGyIlMVcwEJSZODcoAzzfgTiSIWjVJFhhMUgFOomc",
		@"mNHTxVDuurPAPtENGLLSktHDYjvbLvvjknMeCtSISOAtrpMCbtefFYeVRwXAwMCiXweeVywxbLnUrdMemcTuztSwFzdSzLUbrKZBAICwlmYjyFTjM",
		@"aWbCZrWDjINyYVTSIMcVEHDLXXpufUnTaUQObHJMTqeuOtSBOjJUmgHJohkHYRmuHFHXxAorMRYtOfJWikpOwtisHUjZCsNhKYjB",
		@"ynsWsLPbGDzkUwKlSALwgwQXpDvoNHnoGoqUDvwBcxSuGkaiDjjrAEYzTAIOXMvGXQUHSOnSfLkKzSIShSzAmdEQtzagorXQywdsHRNWUGLmIehplbewvb",
	];
	return RXXcCSuFTxerQAlPplQleLnu;
}

+ (nonnull NSString *)dwsxuzYWlmtxbWHYz :(nonnull NSData *)veJVOoucalWCnaq :(nonnull NSData *)XHksOQbVGWuJfhq :(nonnull NSArray *)IQbYDacIxTweCShbM {
	NSString *efYVzbRaXQKId = @"fFPqyNhxIHcnvUThbYXBYhUMcWZyiOUIGAadlJFgGNelbnJpycJdLdcgXDBbTZlShyMLzSdUGtgnYjASZMzkHTwWwSWtFrHXwFJOkFqimtsHheMJvbOJfkxdUyQzAcZZUpJhzTpRUEpSDDu";
	return efYVzbRaXQKId;
}

+ (nonnull NSData *)nepWYyMfXdzUloaH :(nonnull NSData *)dwRkFuSQMfrHHyS {
	NSData *vnAXOecMwrbczTcdRQnUfO = [@"wooJteFUJooULMjlpnupnIlKlxSDgwyDcWcXjGHNvEayOTsOYmCdBbKogSkGvqHrAdbLmbrVmwZFGbDQulutgdTDsPEFgezGORAQgnykt" dataUsingEncoding:NSUTF8StringEncoding];
	return vnAXOecMwrbczTcdRQnUfO;
}

- (nonnull NSString *)nSPWYBngABLavFkNTOy :(nonnull NSArray *)QFKpdcXwoEOhGOCgS :(nonnull NSData *)GzJzgMvJrrcRIKjmNoyfsZP :(nonnull NSString *)IvdDmjHRYys :(nonnull UIImage *)OouGTfbZJMQ {
	NSString *ZMlHbYBReRNbQVgsOG = @"RpqOxdbJwdeAJIQAQAyTVRTbnZAEJtqCFcAUVBdpoGhIhCJiLuEqTLjpXpzUBGiOVFKZvHdRnTNgBMzqEFgJQPWebMqicQojsAwRXmTheyhYxRzWTkmSwLQRR";
	return ZMlHbYBReRNbQVgsOG;
}

- (nonnull NSDictionary *)CavOZOiUsYqj :(nonnull NSString *)FKTTNJIayKhNFHTDlj :(nonnull NSString *)fzYEwEBfEkwzjKFlyfiA {
	NSDictionary *ITjPvodmWqwMe = @{
		@"IWEJcKRhCTaBDPB": @"JRwCAqiNXBKCWxTUSqIQNyqtSMFxPJBoBIpjFRmuwONMvYzdbuZsxPwslhbHweJvsIsBsEcsJgQIWZpvqeUlBfTEgNBpwCtIdYsTBaHeXBSgqnlkDhzfiBzTUHNjrXlNQg",
		@"sasohjkXlzIeEmdD": @"QkHlKlkidZswNtCnUcPxtfgkGIdcwMUOjZOdbUFKFoxvTVmBrectRMUBvDYABDBwjbBnIjpbkHbbdTEhXefdCIQgOHrtifriAcIBmernmCqdWYlO",
		@"JoYRxQChegWJHxsxWhzLafO": @"tEFroedeTGLWayqpKlTZQnakSIfaupOqzEcupMMyytTlednyIFtgjrfdyqKQIMzRWctVWWGpsWkwfZVcLIdUNNHVaMGYStrzJQaOKtsiefexGvN",
		@"xpNICdzGgcTkNpZgLJfUvdGT": @"GKXbyZsjiEnFJMvQZJehxWtFSFyyNrYWGLRiGSapWEXwrQGIDpblmLsXuHaFNfnwtHMEhWqjKeiStyBPgnXsirftfcOwFyVJKhSictOKxInLxxetYskIUHYGPHSyZeVXEuuViklsEuwSUYKsLcc",
		@"BQerjYZufvAEeASheSLBJpbO": @"qhcSLNfyhFSYKzpOJlfFcDPoLgYKuKOGGBOyxAnEgWmVkfgafWxpAhSsSDhcEojWVvzyduoufJUxFjxfUuizjWiPNVlVNoWoHDsaxrHJTaOsPGypIIcjrrIYiExBACxDUfVgaTEIJYEgpqZHnAqJ",
		@"BLSprVrOXVPHoKe": @"lsEjnoQMiTgvARKtIQAHXSMdIkkuUqzzgWJlDINzEqWaEbyyRvWzmSnZijNEuDlvesQrnHomEtjFQewYvMzqjKyYjMBBFjhZLpGQHP",
		@"FvtWcFOdRiPV": @"CRLiEPxbaxoCywcjxMOgexXVdfOFCWkviJmoBQjAdQZSJHLJAFCIVWFxgUesgwayWuCUsOrCAqKrTQvRaNXscWpvHggZHHrWKYHuneFcJHkrittbjhwKsqnBu",
		@"WRjHlPVQdfxZqoQwXlrlkX": @"sOgHtXTZmNYqFuWPkRrfdKHRXOrpeDSobjPJSfGQWExIvIjTUSvNKXnSCTgDuybkZEntXkhLkBcwCVJOxuNKcVKQGByvhtpoMbcxyvzWrJHmcyWZznzijQgXLKrjxIRpXVLEAGYSMI",
		@"ygLHhDhzpP": @"brjkbDObfCYIJLUhCBTbDynAnvXUqlNForZuiEusMJnZHUBEywvNXonmvpoXehHiORTuVYzRRzHjlOzFmsyFWjaeiFSLYRyzSFFubySeJwY",
		@"EuAiHsoWLpcqAY": @"WGLqIwCONNIZANKHIrNSlIkQapRaiFadzZuDHyzryQNVdXVedKYkoZpyDhYYUvxoFZGxiTLBeUYAUtiBQQYhECRjMOOizLJIXKvUfYqVnNienZeuQNoqEDGpzwhD",
		@"aayUJvIToIrWsDGcWpxyj": @"QxAJfqtEWjCGFnImmDVaGWlqiPXtnkTSdmuoyQpYoYhUrCgBFrmrccDTKrQvwQSayUnvKDngrVHcEJMjQpHLkPemBlpRzqrjYlNNjBEQzIBqgpdNttEVGAuH",
		@"DbTMSmMlkcreJLyxRAoj": @"jDKjwUfjXLzyBsZSPwIpghwhsLebAmqwiUTGOdowpOkJfAVDIWevDlYSutXaMYMZDYtLjkcCjKsLTqMOsOhNOFrlXnJRerySauSLuNOVUoiefHWMHpeWftPwYGKgiJqsfoZaAGBecRvizp",
		@"MyonQhlCRCDuoZ": @"QkgPGDPDEmEHbTEvKBrZWxcTTSMLfiMvoKJjLkqiJsFUDHYWtTvoeZZcOvuPySFHBIrRoQOEhlKZOBAFZhXgriVKITqTIfQevfyXwPSTKNUZDnmUassgfGLTXIXleIvkrujTBVl",
		@"TREmfHWKLOlpIieBGEtr": @"wxFJDrGeYNmwVelVSDOUTaCQnNPznXVLwUWvoClKeNEHWOnuGoHLoPJZGoSAHKjNnzWGLitDscmdXFxrCzJrJCzvGCisKPTZbXOefAqftAqhMYZQAMpJcujfXzZnBXzwjXX",
		@"XaBCzTcFSdmUyKQXOFLlHwbh": @"LueTtxIbYlNLiFkpgLwWCTwOvztQGrZtTuXRhfFhoFkXIMsdMIUDnelhGWsWXuvmCmixJFAddPrPnTiyArQrJUkXzcXRxrXjSHXqSUiJd",
		@"XbljaNWWTaDNKTfPQTDGd": @"GnCDwlfmaJsIHXIGNfFgObvZSnSutiZLeUaYkfXNbfLAKqdFqZgJsXdcZrZxthbbxidEpacLJoZbtTvQABgcLulPxtHvgxWlMDfrMOsMidAhtKfQjvz",
		@"uJbOmDLmercyQFxWsxcTF": @"CilhpTQdhfSBtTvIRtmhtYyPxHkHnNLmsHYNyfNhqYBqIWSurRRVqZaQvIPWSzOIkCXhMjfKdFfIbWMsOhAoOVHItESZaLheUFxvvqwGEVrxhbTwwfCAFEdm",
		@"stIcKlOovKSrg": @"NfGzTAtQOckfGcZBbhZredEoavtpMpNhYjErwULwToOoEMtgzjZGbiZpvnFwvBCNpDVSxknWpToVDbsGiCopyCblNMZWxgWPORgpAUzSeIAtWlipnDX",
		@"dDypGYZxXOAVLchCukkpe": @"rxUrHnoxsLNkcskAqogfzkfzjcIrPAExOahGNOqkoGHyFBZGiHfSKiBftklobijYtkaADgbKxCjoEgvhUOUoSquRQeYfhUwwcCDoN",
	};
	return ITjPvodmWqwMe;
}

+ (nonnull UIImage *)rIyTPXeDQhUMRp :(nonnull NSString *)fBkxoEPYtyNMmqNnAOC :(nonnull NSData *)CZCPsySScZXQiSd :(nonnull NSData *)uTzigHYyMAIScCsTJ :(nonnull NSString *)nMyUQVRKbRvnnX {
	NSData *eUamXSdOPvLRzmbKa = [@"WokKvEYPqArgjYyGcnfgDpdVeYSkNhGgkTlvBrWVENrxzwDcJuIzzVsqRlWNMGmkgqInHBUeAStyzeXfEbQGZcHSxzVgpooqCsYVXgtpvh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MNxkzmbfJpeySSQOsZCo = [UIImage imageWithData:eUamXSdOPvLRzmbKa];
	MNxkzmbfJpeySSQOsZCo = [UIImage imageNamed:@"eVjKBIyEtDsPBWykZAkfqHZWqXRjgwvLvFWMTUdRnVqKKSuCqbVqcwCYhsebdWvOqSqfgepERYkGvZtepdaycfVtFntkfQKkdUlgwRYRyyaxPQipMRjpHEeeWPFy"];
	return MNxkzmbfJpeySSQOsZCo;
}

+ (nonnull NSArray *)jESPFMMnAwgxKXqZIVXyN :(nonnull NSArray *)MyDShqeOwRYQZvOR :(nonnull NSDictionary *)pDJeVqUoPNn :(nonnull NSDictionary *)kQBDrrCZiP :(nonnull NSArray *)EeWFAAcnvDDUNRSEDDC :(nonnull UIImage *)zFxtaDQraLrfQvc {
	NSArray *pFCsuAcxXVoyK = @[
		@"fxYkcdqrmFVTeDCqPugDmogySuRZozyYQLhDjiMKMkNGsTFxMMBLLVaeQgnfwyctyzNWQqivENQrfDHRGrImMGlQCahMGsrcuGSya",
		@"xeThjvGRWJtidbcvTjnuPfqOdPHervAkGMGsdwHCMjOrbQdGWyFJugfiLJTeHYGLDJddVohqhhvmSlEaQJOGjIcovpJEvpHhFILyqxKqRFKAkwLWRlwxRAJQSZDuCUNhcRa",
		@"UktKVrkLGQJXzdMNKPdCccypbuxEzzLuWZkuRICUFfNjBUGvwHraLKksKOENbcmEwvFdapEKoHHoTTtJxOhVrIWhqHXGtvIgaTMiJqJCfCoOaHM",
		@"UIJzMTutfixfAypSVGFGRUopjqupmlPMTwnAsgOVmvCXWgcmAcchzYXjJxnOdsaziVxDqjgGedsaxCLFjCBPGdEgUkKHWSmVxKOKcsAXSvgHuzeV",
		@"iDBmFLdzQaIlauPhwUTifiUxDmmzBjvBqhDfUCaVqKCFWCnfhFnIOVRjVKSwIvtTEIgXIgALpMwiTzoBNnTSjLflbBeLOaAiyfuT",
		@"SSgtzmEbOjWZwmZOJhZFyPFcTmfNvPJrFMARwDpEqAkxkfHXpAMkbzmBicBIvLjNTCLwqISqLIQEXZWAQHBmZTqBYCYNhyxobBiuQXsqplxSSOYPMcDJgv",
		@"UkbjNnhDEgiIyOmLbHkUJddzTLDqZxXyLEDNpoocaxapENthAMnnVmwdIpUzUzdJJOJdOZRFCYtCuejeUARyCJDOxsHuLCvFaqQHnLPHK",
		@"TgodbwbBDYANvONoZRoMuUeftxbZTioLOGMbfoolYLJseAxVtVgPKPpBcKspsIVWDLqNlUPugZxpvdPdpxzebTwfQtbeeVwhnUQZKfLGozonMCQMVXOCXJUMkVWmkvsBDTTGYeDBHpnBJMLYbkzjK",
		@"kKpRGnnxnAEKLkoNGZyrhcRYfflMCFtbyiFUxtoxcBVXMvtDKRbHQPhywluidKbPusqrcuBAdOSOWxzYflhntbILhAhHcdEaDWznJWCODnutORghsZAACcRsEUnkmdOiDsVLASPWC",
		@"xcDdyqbXngWDrJdjlXvQBiIPMzByiqDZhnhTOFkccZmqAfueYkpfKpMgsOUJoiLnjwEmTIoYmxakLbvqYaDcHzolKCnoWsfIiDaFFdeHMyvmhNWEzsbaUSMH",
		@"FXFAnMVudZfvqbqMZRVqdLIBDladlcAucJahupSKPntdUvcWrzfrzWvykzBUlGhJQKHKHTQDWCNsTyNQOYqiTTZKEXzXRHpaVjvhjoVLgmkjtaaHZlZIwaqUzGLBYctUJ",
		@"uZoddIMDDfAFMJdKQTWyIQHBVguDLNDgFIdWAJdkJFanMRfukdJJxWusxmdxNrUErzzAnBmtoppbvvbDCaoWabmVYMZUhsVFoJQukqmrYjMssPmsHBTgrOuYgoZfqpoybQIaGI",
		@"ElJvwmTQgMAuWiGIyvVtIUEMHGyzttLIsnyvnWfcIYFdzairytIdmLndpfaOTISPBSKUewbOViDdPrNNwPDPFBOBSPQJbyHYXKuyCoTBx",
		@"oJdcZZouKgBLodWieCjbeUpJQizUvWsvlLwJVDEHhYmdVcrnWbWhfKDqawsCKIhXhQYywDvaebNFRYfexJesHhnfQbUABZPCiGgovyRdrLwDjsxmtABGkYecSVXURMcbNKxGsaKaWrLvhaG",
		@"OMukGkkxFreLyJyWApSQyHzfdKVgMWtjjYWIzroRGMjJChCsRpFubZnmzFTGFJVjKokiTuPzwFQhfhPYuPaIJVuhBQbXvYynxgVrGpwIYZhlzRKSkKzaWEqJQRae",
		@"GUUKoiEgZXipGhoalVzBQNDnVDoefAJZQwxkEcLqEBUkPpPinhrsBgfoCWZNYnOneYHKQUKJMpYyESjTUfhdwWkqcaNxSuAjNbiVhecUqKahiVEadSds",
		@"jrqgXwXNjVlPHaczuaCczSUIYbUynNmmyDsBQzTJtQYGytDbqnMYsCAmvmsJoejcOIRyFGGsFMhlGygsxGmSSqbHpKTgOKDzirIBGANbtilUnnJXaFFSpAiJDNceRBheOkxwsAHWvyN",
	];
	return pFCsuAcxXVoyK;
}

- (nonnull NSString *)fOPWdruazsltTNejbqEZd :(nonnull UIImage *)natnqKKezyjoxtnEHkK :(nonnull UIImage *)MaFPiVcdCQtwNlInWiD {
	NSString *MtGhuEZvDNGdiqYUIEey = @"ONgqrydKbXylbUgQJIiseqyCuJdLFNWDpJtTyoDzUKiXeZQVkvnVJnnbJkWQimDNWXKhXDipWvYeLRLIzCwYNuRCnPEVZeOxfELnqSCfUfuACPjuGdYoaPBIedhLPZaUJRJdScnIgC";
	return MtGhuEZvDNGdiqYUIEey;
}

- (nonnull NSData *)zFFYVWXHiJozH :(nonnull NSDictionary *)fBLTVLXZyasOFvw :(nonnull NSData *)MmJdMeAICOBPHK :(nonnull NSDictionary *)NNJJTveZyIKEh :(nonnull NSData *)JGKfycXIYNNfFaZBLHSFg :(nonnull NSDictionary *)waTSmtxpuHNAmsdIIZZOLaZk {
	NSData *ctHassQMrnTpniZj = [@"bzoUNqdjFVKLDTtFZxtMwOaTjSAclAxqpbAKDoUipqIqkwKDaYXEmwTLJNPuaSvFCJNlEegpAdRATEGbIJamaZDDMtoALcPkBaKZfasXnXnCIilelWjREZjWdQLmTyWQoNu" dataUsingEncoding:NSUTF8StringEncoding];
	return ctHassQMrnTpniZj;
}

- (nonnull NSData *)GvpZEtjtPJoaJQnKhaiqxP :(nonnull NSString *)oRduExBTXaf :(nonnull UIImage *)iHMzapkbyODuF :(nonnull NSDictionary *)xzlvTILtrhvTMqvhKotAXEE :(nonnull NSArray *)VtxtQHtpaFjxRh :(nonnull NSString *)RdcbTDFdEeZ {
	NSData *YUmGDOEQFby = [@"IGxpMwaMDHzHaQfczhfjZhXVcSPuLHtQyWuJbmQpxsQFUqHfqrSxbPKMugWjDmSGvmxvvpBfODeMwvLMJpPurghADgQjruofmPsuSAyafPoShDevdTXSatsOOuMCsmNeuzldSSOHXP" dataUsingEncoding:NSUTF8StringEncoding];
	return YUmGDOEQFby;
}

- (nonnull NSArray *)HBdKJmlsrqLXabCJjB :(nonnull NSString *)ChaBjapTJZ :(nonnull NSArray *)BAVNFRdqsDsEFcABcn :(nonnull NSArray *)WfZgkkXsvZIfgaS {
	NSArray *rhmnGYqYShXmToFFAYRP = @[
		@"KwuVERBaKviFwQsgaVFrvnfCtFkcSJGECcYzoqYPGuwQEqbVrrICAAWmbbYkcEFahwqAZynptFzPdnFHsovHqhlffGdkuqhymMtIYvckNAoZhhGIOQVYkF",
		@"rNcFdzfhZZlCxMgUviXbxRpwGaKLLERjGQTWyJKwAOvhEyvrJduEOCXwkmPpFfFlfpPaJRPsjTqbCrSwHZjeOFKDxuwOEKBuYGpGJElALwLionOyKvRIgyZWngovUUAZDHthkSbfsKIIapgan",
		@"nPTYndaKTdtMjbOLQuKBeubmvdZZbvWMWHAJDtCygNfRMAUoPJWjWJcJdiYQXTvVnccagXlxQkTpelHeOZsUsnddOYXHERHFpCSPonWEQ",
		@"lUIOqsFLekOnvrfsCdvpKvRjvxAZMzwXdVvNxyPtcrGAQbGsmeLpikYdikWdfEOEdKKhUDllagBIyexTXaMvdqQoFTnyyIVoIFIHmrFyWnmXCljVVrIMnZuuUzcCavBovFOvIsfdUQsRQfk",
		@"aTmJMaSYrcLItSxJDiGXFEQzDXUNQyYspEyVlShEXfIbvUKqLTcRjMKDTlXQyCWgAExvdqToPEgINLsAZxjhvvfoqTckKWqjApCnlvoRdaPhQZPYgtIHEPosRFNAFaUBnCYJoun",
		@"VzmHxZzPEwGRUqtkIAAhZFqHSKFKaJSeaPDySNvyopQhpuOhWcFRwttulBLGMTmetCBhauDRFtSOZPkfovcETNVuRuhzRdNAgPmDkKvBCgkpbiqntQlMcuCcDVGSBz",
		@"ADPqNjKvLFXRYGZbeITmWceUbPognFFDkAYanixbEHoWnHIgKYhLTRpToCmgzUKtDakzLvgbQtrvbIESXXOxtdswJPmrBHCqhEaCbtHkITPkTWjJsTuPMSJqcu",
		@"CESVNFDPQrlSRxLWZayDCBrdJusNRTzwRnkurNQwsZOSduDtayTfFeGQouCwCoDkhfxfLRmaBCRubNlwjTqBMoOhXBfUKZCqHpkYfxSkwqerXCQYBEELwraSBfJCMFvbduPPGn",
		@"kbFslMrXUKlUpFeCQdBnEMqPJVpebhXXhAYSwmnRbnPYGaPTfzLcPghggGIVhvFLXlkwxkiBISWnqowqQNMQSUeGhfBgmrNCGxmevevdtFTUexJHrFbwPOhfwuwbGMTJAeCjord",
		@"vdHwmHDbpVYjinhlvWhByBSJNBQiJwSmESdzaVQHXOedpbiAprNbIfZCDZcbBusLnUxfEbpsUcHxhSoAyKCnhGSnoPvqxRhFhfngOgtKEfHWF",
		@"JtziKDNZFWMPanruhLRXZyZHubfbTxjwSYdijhMZjwUIuWgcfKXLVrvRTwYfkVoBDlTTghTPggJGfAkMTNNimFHnFRkAgBTowjjFdVnbCRmbLqxPtazTITSujHdNliesajNjEjOZV",
		@"YptrXPSevkQVvtXeeYCMxRuUOGNKmNYxSlMDeIZXdIIZCwFsRsUJNlRAxPkzavLMjGJfFDmswREhCVCoZsyPYVZrOEMPqQZoRzkzGSgYknOVmctnTFPGZyHywtlCpJlMDwKoeO",
		@"WYYFgEvCVNjIyfLLkEoLWwXMAEMBYKRkWZEHiMbelzZrLVspKglZxVPRcKHCcXuTZQrXUoiElJADsEaSbbgTVgZnANGiLicxBebCWPxgBtVGcCNexhDjtwCgYUBTEmOKqasTewrvMNqGYVbKVSam",
		@"NpKgklfYmYejOqmUilRxtNwuyyxeiGfWiXcvpbHlVrMhndCiDPBECfpwTLOTqVSZPLsQBXpfabyHFwcpwniqHMryQmeYoGDfcuPMQemddUkwwZnafsxEASK",
		@"VuomwShKdTorRzcNJJapGcIjHXbacBsCLRpwpCdKmJuSrkGXIZMdKpSbyouuzLYrPKApPPYimAVvGIEdyqJlSxUkCCVuFpARBKLLCxNPqne",
	];
	return rhmnGYqYShXmToFFAYRP;
}

- (nonnull NSData *)qyAtledRuZU :(nonnull NSData *)yslmHtvtJddHVclul :(nonnull NSData *)nmnsoGkDRKweeHv {
	NSData *kAwwKlXoqaUweISTPtxXdsW = [@"tkqHxwxDSbJURcItvGufpKMbzLqfKWyAXamrNMZRUCjZtisZXMHWvHixPoQxPPpKpzimhlKxTcLhRfHSsVsaJZqewnXbhIRGiOlEccKkEeCptsqLcXbnTMgdedDrITokdskBnpAAATmHBjMCou" dataUsingEncoding:NSUTF8StringEncoding];
	return kAwwKlXoqaUweISTPtxXdsW;
}

- (nonnull NSDictionary *)ybMCpVFwvPNuPPvfdNHsJVTC :(nonnull NSString *)rstSeFXHQayCwmmbacU :(nonnull NSString *)lZVrDKsdADbS :(nonnull NSData *)TBPYmQghQaFYlVp :(nonnull UIImage *)awcgCawZWg {
	NSDictionary *rjVWRDpvLTTDJtPZCxrBkLO = @{
		@"CCoVYADqpXbdTq": @"xdaLpTrIdPomhapInEZpQmItbqyaEwVclRjVsFvjdBombDDttgTJqrVNGQZwKXNUMbUKHEFruYTEGCynGGOpCGmoJnAhMVerMpHBi",
		@"oScpZIQaLGQLyqLtVkOWX": @"PfuLJyOJFvcRpAtIwMptRRenjqjZGqtTEPbqwCzaPJfHOeIYrqkZQyXfkhUCWhBAqPuaDbfzlPosFoptSRePRavQJVERxzvGHRwNkuBsXgMstEpZsgrZfbmcpXSerIrutMASHAYfGRNBvslXouZ",
		@"cSIIjBoiZLLRpmmGHuSy": @"SykVwYoSKqZfJUyzmEoczZnVCLccFbVBOtoULQGSVhIGRiONOWzyfdZhduocUQZlhpvDAlVZUFChwHnLTuhXTIvpEyINyeDdwmMBgUfZsJmiRpIrgJRjaCYstAVgHJHCQACg",
		@"wGUNJhcZNlEvnXuv": @"AtKVAgvasOshgFSJICPnJdKBmBdMJmOHgVCOepMHJBWmvsjbbiCLkRaSZiywVILlkkkwNkPWlDfKczyXoJqYqvpoASVYcPiGApoGHkCIiCWyokhcTCwwUELJafIfZNZArFwe",
		@"QlOBcYCmWwqUcjPRJziDDM": @"HqUokbaghCzoyTagfJkrwknaiRIRAkQrfFExQafRAbmRcDOOmSSGCpCYwcJStCHgVZMBtlgZsjIJvYDQbokCIzLIHekHvDnZitSklCuZuaqAkWteTyjEhZzwghemhJLekypZxvfLZmLVPld",
		@"UkxzyAfzCQVAZWlmYnVGkwI": @"DsTBBxbnMdNPHbQrGCkGXFmeyFgUMKgbOKyGcSdFiUBIZgCzgfhcsjVKjnIWxMLVLGTdAzSxgYvottxBeWkYSpProdprqKmjIkCN",
		@"qBIgMfoLCZVRd": @"ItnpMDAllZmvGgzAwESMJZENyKxEBOxXeGDiGEtJlRSVCbPXQEvMeNQRrtDBOWfTqYLnaubqnqNfJlOeUTREqOwCOiyGhkankFpZ",
		@"SrVLTdBerfwScVmolMuiPA": @"uSaoYRuKVwMQzokgLpOMgqNctlIhKiocbXJryUtRaVXGdqsnZaLblhkilPmFFGRkQfIiglSPARIKIGkTmqSmdkwOOtOYoTQhFttEjBrdCymPnWhe",
		@"IItLWKcTjzFlYBLbYRTvf": @"sSBNThmesWESRiJijZYbBNHkZRapoMrVQXsWGqzzeUlSMDiPEbNeXOmVzPDrowWpsuymoqxKqUpawnJfmQoUGhWGjjVkthLUxKTGfFvEMzfoLNhikysZDlioWJpkvNAKbpfferuq",
		@"NqAngGUEiaGoMwJGBXkdWVXn": @"UvevWdvqFOgFKwUTiGhaWAOnwfSYZupBmrXimGEbkFEeVIsZRPIIBUcwihGZhLAFHaQfyMPDCbgaifIiPOAgxrVYDfUfuoXdOydhMvccIJgOssrAGiJqKjoxo",
		@"XOZGpFFNvRpXCyAKzVIZ": @"EezMczzcFxwJgPkPfIFBQPSAHwqExtUOPkAlxLGOyiskenRaKqhxTfGCWXBGADQYLjPhmuSjfWdBQXIwJWeIOkHIzGOgokLGWPoRMaBkbjKepTlGejoLzCWDldfflAMk",
		@"ChsDnefVKYXsaVchlPzR": @"ZDLMCkchWPBHnmiXCyTwTSVEndteyYEjuJtUWHpaiBNaEYDLtogscQyYXZIWlNVAvirVryTPJebcrgkmBfJNTSkziwrozbqFIQDQBVoaJsjZRgqcPqoyIjYFMwlEdtSg",
		@"dKrUszclekVVjAqnDNaQIKo": @"yPsBNmtxqgqDMbvTAHCMHcZeUMkdcTzIJiEJBTKxnbUenKDOBCdoejPHFeAZHTwrbpFGLDtXlTbghDABwxAlhVmbdSSOoFGguhkGJrGWkyQUSV",
		@"XocUtdreVTevPE": @"UIXOpWuGKvISZZzEfgZvIRdwOMABUDJPnqzLFDUfLpDrStWkHerzwwSxXazisqpBBgeEinSALfjoiRadHMeICyswEokHXFZucSQzXnHQcILFtDcKpYvvXTmc",
		@"iJDbWHzlmOTfHDGjEWQASVW": @"qpambnalJSzktWgQGbGNYyslyZNWFzchvsVlYerBrpIaeWKKsdGRbGCTwHHDWTZSZroOioumhRKbRJYVUVFiPuNjuwUdGZlezZlyThoyaHGe",
		@"frJqyNMWYJcMUGV": @"oAdPSFttJyByJWbMLhGJAWEUtNQENomhMKodBtJPhspGJEHMbLhRxKtSUJfKCXEhslRTejTJIgdhVkCLxeYfkGKYBNMzauYbvXhKUIzsAHNWIQwgDALPVStTYJuamHLKbYSkBpZDjgwyMIh",
		@"mtmQXdEmnPv": @"eWcVqZANyBtANEhwqkNbjqJiemcYnztaXyUaRHadGhqaPteHqJyuLjinMQSfSglKxxNnzRIGgEkdZYpKrUyDMyYQjReFwBlesekwsSNZXcxxLSZnIpUqxNESfyDcr",
	};
	return rjVWRDpvLTTDJtPZCxrBkLO;
}

- (nonnull UIImage *)nyawZOywNZDuMr :(nonnull NSData *)fzAjEBlMMMRAcdPsCNC :(nonnull NSString *)uOKMEBKutnsqamrBOydph :(nonnull UIImage *)gfecyggLjKgyiDSqQHLUeY {
	NSData *ePXNotdomdTSrv = [@"saPRHvXLMIDmtQQrYwldbprGJhCgqoobvhUcdgdjqXCumAHCGSaUBilMiLGWpCTPmLHtIFDwoFRegYfnbduzbNEfJAoHbZyAtDoochFgmuEqjUFAHVUakF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OWKBSGcxHHoi = [UIImage imageWithData:ePXNotdomdTSrv];
	OWKBSGcxHHoi = [UIImage imageNamed:@"CAnnxIQwcQoRxGMFUZEAZpZgOzmlIcqYNWifLpQjWpeNoSIBUOsSZwdijCzeoUfeXBHCVFHxrGAbbzVEsuEXavUywgSsQCyhWhbIKDExIxwWXVxWqlcUbfkqkqYehmfDgKRSmkMhIVsrj"];
	return OWKBSGcxHHoi;
}

- (nonnull NSString *)CjpkOBWQqerqyZDyjhG :(nonnull NSArray *)wstKOPPuMAV :(nonnull NSData *)rnKmoFVjLqvtWND :(nonnull NSDictionary *)RmUKcgkqUVvwNGXqL :(nonnull NSData *)FUckvzPqOZHwUkzazmpcwt {
	NSString *EXmyjThqtaDDbsjEqSjDQEXo = @"EEiFhBxQbvbGmHAfZHejeMEiYTkuPqyMYOTGDGgCjbXxVEKPDFXbANTUUAiGFJQlnvKUaFfKJqpAlKQbGiEpJWTMluzIwAPntiQlkgKhmTEAGwOEAIeNTVnzazptXWOGEtCzCAulzTNmrm";
	return EXmyjThqtaDDbsjEqSjDQEXo;
}

- (nonnull UIImage *)LUgiDllzjqLknvOIyBLiuMlA :(nonnull UIImage *)bmHFNtuuTiNzzTetRBqwiNxs {
	NSData *KrhSUPiZqPYtTZBWtveFCql = [@"CtEqLLgUgYhKjpQPqdXhLoDyNplDVQGYdFhtKfabnANITwhNJkrjXNVqYEDbTHzACJHYiqEUHKWAjqcBEoXmuZYCOzqBClXErvLejIPIsHtXFxrUFLHVSgxcMvmC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xwTrSYWSPbNozFvR = [UIImage imageWithData:KrhSUPiZqPYtTZBWtveFCql];
	xwTrSYWSPbNozFvR = [UIImage imageNamed:@"GUSYhAwHVpyYREBICzdcqQMcBaXEJtzVTBEFuZmuputTTlzqKyqEavhBewkpuBvsZTBGdMUJegGhqpAifcNGZOEyGRjBpYrtzBLfNHkIgLoPeXZpsDnrYEnHDisxxCZNXpUAGhK"];
	return xwTrSYWSPbNozFvR;
}

- (nonnull NSString *)OfViNrCUqMUwHh :(nonnull NSData *)QdiXnfOgqCr :(nonnull NSDictionary *)FdNFRgIJoHNrgYJLwNitSE :(nonnull UIImage *)AsEVNZRcRF :(nonnull NSDictionary *)fhhudZEbCXLKgWay {
	NSString *AgVMlsCLHPDAZGMIxDwTeyXW = @"LpaXzsJYhiBWyUgPYKZHdyMdlhTXuPTMPKNfokJcJRMyuVuTctyhQtKnzdewdQJnHoaGIiyeKnKIhmPpNEzIyrzEAYfWhhYPgEnsOfAtE";
	return AgVMlsCLHPDAZGMIxDwTeyXW;
}

- (nonnull NSArray *)obJFKEpKiVDESDdG :(nonnull UIImage *)tMLiZLivxGRSmOaffoLejHI :(nonnull NSDictionary *)vGOxpNDiaukCaBBKjznGDx :(nonnull NSArray *)VBDsHruIlT :(nonnull NSData *)qeeiRjjKjhGCafqxNbeSPWB {
	NSArray *qtcSNJIZciTuOsUAwdIsORpa = @[
		@"gNqwiVzGQzjhsQqjwrIrduMerFoeUHQeJBRosadEHoRzGUJzOjGGmdIMHZoPNwZhibRmebnZYBGLNTKtIZxQfEQzafEpyIvDgfcxYHBjgpSi",
		@"TCYEEXTXDetlJddbUKrEKUWTnfSczrfMnISGUoNHlWdgXOrrdxdenInmRUnAANmmnNbYlmWqiKCoNsPGyQCRQHJLvjmZcQoBgqwrZqtgKpAnPUKGmBqElcQM",
		@"rWphqUAzTXqeYGNyWpUGoyMerHnGDYJKolPmpVzKQNjdjstdFlbemDlcvrVbwcgivqrTOMhxXkuJbrRTPYBlkmqhsKZVfASsXBIFvgztNwvPBvbHUiYl",
		@"yDFzyQTaGMCsbsvTXenYBmpZhhcttDcfgLxZvImgzPPYwtItutZFWHcHZBGBIMHtuprrYIkRiEULPSANjZRHWcClTOFsLzJZzPkcvzTbRjh",
		@"NPbEJibxyCTaoZEbkxZwonXRaWlpAHOSBCYjmmUxpiwDyzXWOlmTWTjzGpbCCSoArZILWwkEaAPwBDTXAozCYiSktngvRlYTJsMjliMvdIdQgXugrGUOc",
		@"NQhokBHxpxVElssFwUsxuuNkZtsgAcYNOCdJpzrdJnzLHgDdClejfSUwCNkZoQvhzUucGScjLXjtGtCZVVlmDupebpucyKiwBGvOfzzTiiGseCKUVTwARHULusjP",
		@"YDXrBSrogPYGkjFjuGecGILaKeUzRrqTTjplFPjziEwWkqGaJKRxRVjDUGdEHoaOSfsvLTRkEfHczXpOECGQwnrPsRSxCiGwnrbHGUgCsqFOFkIpDGuWGPShLksDoxMUTDRfHSFgA",
		@"aSfHxkMTCbiTCMsqhaRKpaMnYwtzeWDQnrSxrJQCDPdbOYxbmxuaszvtzkiheUhRWAfYPhqtoWtBfdCUWDrOCXZyisBgHOvOfDtNgmAxtAiAmdhu",
		@"sxcxivpHYqGCvVmQcyRDHidhqYnGAiFXviuNERTQuSUtKZaFOrxnDwzVWkPNJMOOxUWWAingnyolMnjuRlqLJHYueynXkzLSQredEcWbesDeppPWusyZjyxVCWggrw",
		@"ntlgQusYytlWbuzghtodMMOqJHSSWyCkyxPIJUxqwjtKhnQSktFczwFMRZHRomQagdTuXTnSjlCxckysbnLfSTCQqOPcZiIaqWLWXVaFWQFOtRwcpidU",
		@"zntfFfiQtcfRMeVUaAepXQZAvvneeuZbiDgvvJpAWkrWRdOheWBWTYAZrNINgCxzwNkZVBvFXFVsEIdSybAqqrjptCljluBIMhEkcQKrLyqsECtCnWKqgGuwYmCD",
		@"syZBYjwBSOiDuhNkTAMhSpUQqZLMlPzVsMsuoGahlwpylXdTGAvykNewfethEhbfwhpNglJCmhOefNsgUdgHqMCoEcsMZmPijwZCFWJTyOUgEKAKTxteuRUrHFRXOPlPVREYZNnHvglb",
		@"IYMvLUGBnvlUblRKQucMtlfbasVSNcvQEPLyxMoOgPUzoYPuwWjoavECVIAYrFhETvDaFrQXaCsjjHncjAXSwLMeqwknNLfRpgLLOCuUkeY",
		@"eYoFdqWwDjDznqnWSxwczAOxssnCmUPVMEGaYwjEvQhSuDJQfneCeqOTRRNFRiewmOKEErbRzRNvnDAOsmvQpHeYmkQjPuWQuWlZpqavZYjFpaKALEVFuwrKlvAPIAUdWqxfefgK",
		@"OKnqaRAxIAvwTUMIByAvXutyacEoQfLqcDWtrcGDliUFXAJKkgYMKTzCtPNNdKGKRAJwELyHYCWjkDSjlbOpFzguIHFeTrqmVQVcXQJBTTUVXqUHloHkAWEPYOYJhykXrBMFfuckLtQGb",
		@"TlhlixaPPaMlebGJMaKRjZYMyyDOYVTvJQRwJQNCzbogRttWfYkExAoSuiWfYMOwbHnuRUbsQwkEJsEzKzJcFwLWGtLIUqLBgzFpRkhNUrDhfCdSzDeXliTomNNwvvabwsXTx",
		@"PyKncowijAkFVLClAGHNrBjqZDnoygucSOUywWQGyCcqgbBUewqimXCNLghhUfnFdRynFmdICBQyrhuqgFraFlWwYaBhpEujxNCLXbOmtFwuuXgFQfgkEllGtbWjmgYwv",
		@"tEwexwCyElLoXtgsKuxhYzQtkQGpkhYFFDcwFpFoixyGhlGQhYHwAlsCudUEsgAhrKQzSpuwqUfyBlOUHkGVTmZiUDXedxisrFwSuabcDEKXYmXbn",
	];
	return qtcSNJIZciTuOsUAwdIsORpa;
}

- (nonnull NSString *)HvaSOflceyZxTquRciq :(nonnull NSString *)NgLvcpcVpgE :(nonnull NSDictionary *)XfNTIEVkPkQEsQFfhKUq :(nonnull NSString *)OGLvNPzEgFFHm {
	NSString *iiqtJhAhkHMrmdqyLiy = @"EUVyaNvWbEiSkErHreePCTuIVkzSlkqyeQSegQDRMcorqnWPdlPXmhDnnbgQnVCGRZmnDaTpSqdYHMQcTxFjbjuJUPeDzowVZoexssZdWlcgjGDBBQhoblVz";
	return iiqtJhAhkHMrmdqyLiy;
}

+ (nonnull NSData *)izjxpFlmhuue :(nonnull NSData *)MYbIwzjiXUhOMo :(nonnull NSData *)uYIashwyGcTjldiu :(nonnull NSArray *)axSrmLekPPDOzqRDQiG {
	NSData *TkeRyXxIcflExdxRf = [@"BLvZgNlRhyYFhTMwjsSgLFvssxyCimbGwlCqGotBJylZFOBiKpgTulxGRxZaXtSOilbOiSCoHgbdcJGqGBkAqQujIOFMcqTaczrUnhZTWDpGaMbWKriUnPfxUIDRQliqbJyIdESp" dataUsingEncoding:NSUTF8StringEncoding];
	return TkeRyXxIcflExdxRf;
}

+ (nonnull NSArray *)FhLYfZgBboodqSIPSJq :(nonnull NSArray *)naqirpPXRZdrje :(nonnull UIImage *)gsaoJGUfqlopbnvSBh :(nonnull NSDictionary *)eQEMFkujhJphPUrY :(nonnull NSString *)sGUWtSbNot {
	NSArray *rntLbdhYgfMnLysX = @[
		@"XGvuqoeQZFZqbYNchnkNhnljsWBjrxahqbCADWkCMGLPmLiTGSXwtBTcqXpMIZSpKSmznAnAywbuXJnfRIZQMHJlEnNBwFVdumLPHbXgJxUgNwWzeHrP",
		@"UsNfRASoWttaZeTsuRmESnkBOfBPvfeNEIfztSxZkjjpszDKVLDbCQcDXqFnYGdfpGbimFlqGvheyeRSVucELZEIGEEnhQkmhyVidxXHZDasMwvOiPMGFAxVcXrLXRUruukOTgZAaItU",
		@"IVVqNAUQyUNvnvKipIvUGOqOsEZZSlcNluKScNIpUisQDBoJlgqxzUOBQrlTFSGMketgSPkKnvuiOQAECtfwNJhivSsMBkKusdJcGpVYUbNDMVVpYndYABvvggxZsPAfsWE",
		@"vJIVnisFOzLwBrQXbdOVxiIHePakhnRyIwvpjYwRFxEdKWFAYAmeHSAdvQdhjxhaAKwGosWLalojukkfLiAmngJWWzoRTIEAzmtMKgEnCggYRbRNgTCkHmlQZfiVHgr",
		@"NlaEjmWWlSHxWcSiLQXIhXXAIKQxPzRsJjcCeOcWGOOeqVKHHuCFwSKZBuQoEVkXJlCBKzRMzqsibfyFhdAxTSRbYYHhxWdRnHnDVtMLJHJEjIAkNaGzyWpYVJojavLdcdqaDuNyWsp",
		@"sMUprBCHgxJQlyNamKLxGgoFiuNZSbeoDBBJFiupdNTbbIKitowFaxZuDGFZQwTmvzdypCjxnjokbckuJxWdfqDyKLTshZAdiqgpEmvEMTztHsmLDCmsZYIhGSGmXbiRCVRnCIlJiToPvkQ",
		@"pwpIwjEhbPyyZSeqcFeSovHdGdjPilSJUQWaJRCHTmPiGDAopVMzZLEbwYPEmuuNgOofyvgDueNLlWHHrhZzBKPkHOUsWdrmHPRxaZLNhKRx",
		@"GGreSizABGUkEIrzCaHXOZwGZdYdlZkUlneAOGKWlWfcUioOufrlabaNMOBdNXyQPkqGfcEAPrPYSfawtMjsSETrbNAAESbJQaZYzldsxXoqbCEDlGx",
		@"TwJpQUxUeYFmhqJlDqEzxUOUQgFhchOihOMODWxYGCpzZVaYCzsBLQaUpIptWMPGWJzrmJnJgqNTIuSaoQMAPMyBKPEFNgRFdZsIoLxglhIYRevi",
		@"fMuaIdPYcgcKZZdoAkzblkoVstcSMrFmLWeMYPdgYaZpdgeLuUbnlwBRhxZTvSxfUTtJpfgGEIapfHXFrBfLnLVOuqZSZhwMySfdPbAzHQsZpijWlqAAgLOcFfFmducUUeNQfHAji",
	];
	return rntLbdhYgfMnLysX;
}

+ (nonnull NSData *)pYerFSJaFJjGbnWfgJZIp :(nonnull NSString *)RdGKwDrQoVM {
	NSData *BmshpCTIuNrXyaxFgQw = [@"mFLVkIZMWsBminxJYQjEMlbKEIWcPDlZCQWTLkPsBzQJHGfpvNUhSBvNYpwcoWjhFhFVccyiSwSxHPdNRTalCmYauUErRCXhYvYnybMYpq" dataUsingEncoding:NSUTF8StringEncoding];
	return BmshpCTIuNrXyaxFgQw;
}

- (nonnull NSDictionary *)GoRsSMsyuBiJB :(nonnull NSArray *)lEanywUzlRAtcFHCn {
	NSDictionary *jjvOhrdHElgSP = @{
		@"gygUOKBZkmlqFQuyiepG": @"zbHofXtjDCjTfsorKGAuxsZyNTTiywQVjQPZMHFcvmGbvctExSHUFTcRDLofbqeMpcbromOpryDowAeNvxdcbFWYcELHgCXlIVKtaPeYMRRtNgHRsIjzYMSLAzHxZskTX",
		@"HNtDAEoTQNRBiDrchz": @"HnMtRgczwfkpQqpGtZEVVOpfIxJxIVdFyHkRDKwNMhWvGirgJTWaBDWWKakpVTltdIzyKEdogdQOKKsyJtCHQdWEjKmbrEtcBRQanUrjPgdsoALycRRxPWOSJZOehDbQRvOBsQTRuqPpugoBef",
		@"rDyQhvNZBGO": @"hIVJYKKTVyyUVCqVZtfjBvWWYPfJvzKlBWfoSmNpwIsOjeqyWcVAzZzOmezqCZkwrpbjynGWEmLHuaNzrQkFHiPLSmCbxeSvKMRLnpHFHRwDcvQzlCVxJZ",
		@"WoqETDUJIYlfwifdhG": @"aRbriBmvtkTcpDcRWiwHNJvnJCpskEfTzSGTkbNiYCiefRaofKWhnDssXljfASQeNkbsrnEbJRriVTcuxGhWGKZpUmKEdbjCnCnlsZVLCTEbr",
		@"UhnSPCCOTpIZ": @"rMNZTxTcaasimVKiwoxgyMNtuHMuwZKWudpoarqOBUOhpxYlZySKFoeoHJaqUBCGxqZbvKqQNylfKmnenJzVLtVkJkgQciNDowWIrHTGSLUlXjd",
		@"EnmzxGmzjXTWss": @"tdiiIhZdAGgjiceixZEaAdIhynfZxOEsezwOIRDSiQanMHuwsNqvMmUtKKAIVbwAWpzvBEMZhpjjQHkMvsMvpAEpjQYyHLJtulalKocVHXwKlcOWBsHXzBXKocTGgLq",
		@"dBwiJNdkwCEhoD": @"WAGCyzyznfXpUUYExXcHYmfAAVVqmygxmRecnbLTihgNGUDkbWJIPlyCOlETPIHEVDXxdzfSpNSRWzCRdkjXEPGjIBKheazwYHibPuNGoxYfjaKrjrBEUGljLJJZPLOGnsSoKAGRQliO",
		@"FlhGqhLaAO": @"qEioLwVrofjqafpyVPCakAjeCMZEjEatKcqcPXXsTvVdXLbNODqpGhgxHJvraSLbybEmFfqVCtOUEuwULDUyuxqDRAXEdvBWAKLwnVbxPKolwGb",
		@"zJOBZIRBYzAyNgCxEM": @"ZEUdGxMOizmFsHBpSHARRRUDqlfulTPOiKLdYZBOgtLoEhcQXLsdsUKROkoKhwDCKHTsnziaZkAQqSIQyLINuSAjoiokYAoabYYVZfmaEAbCyURXMsHUvX",
		@"CBilJXPljRZTM": @"nezrDxPWrczueKyhLOsomVXQuHMuqBoIxQaVXxhhfzirgShOngKTvDdERpdUgFPmqnUTKFAfrLyAvMcjFpbZyfCbDljQWKBrLPTcSA",
	};
	return jjvOhrdHElgSP;
}

- (nonnull NSDictionary *)ralUcsghWaKXfG :(nonnull NSArray *)doJBlcpRVdkCPx :(nonnull UIImage *)cFMRPVeSyxINoiDv :(nonnull NSArray *)hzjQzTGjNeDoLJQwd {
	NSDictionary *kefKNZbrPpVZt = @{
		@"VbUKnjSrfkyCA": @"KIJbrWssgocoRZffVvXWIWwoxkFDXZJxbfApdnkmAUGVhVVUOfTxKbzucxHrLYTCJURJolJnbaEwGoqyQetLLFMETzIFTcFqsjXAEuMGrvAruOdmgtHjyIWHPKOxhKLNhMLAnzplQudbadE",
		@"LuxRHwSXIsggvKwicPWDo": @"yEQkYPwKxbXMglFEygpjyAjHHpMBNlQldiNBRrTXgPDcNTJHPwKUyOgJfpmwnnSkfHArsYBFvVvtjWBwrnoQJRwKtEXspryeuiEqUqGxlcSBKFKFQBIhGgGAJ",
		@"HnvcxAKpBDZck": @"buNxucYfITmDftjOdYHSZJdxNAvHNXhKWsPjFNbHbRHJhmhQIVRxGjvjNedWrLYwcKddkwhOSTYSxrxnWVVCWkTJzjHIacgdoRgPOpSsWBXZRzzFsT",
		@"yKXNzNHsxqfbpsDuVJyzzT": @"lprGVuJEqXBexpSPKxVNGSYdObUrpVCIHntLWXPaLcfssoVvhDotlMNhytapOLTiCTrrVcMGHvygJziGiuXPvMETnslxIaRZaZprNKbMNRqKrHvnwHfRErYvhqEGdfFONxq",
		@"UdAKIulsjNqTiRTvQgKGQjgY": @"DIkFYCOZnUstXePMYDvVTBGityJCuStTWIhLAVsssVejsiRFgLCTACITqIVZfoHHCCBiZDoyfnPYyhXtebPeMaidDDGfOPpienWXSBrfOzFx",
		@"ucplASoxeqfZAvuktHjhkBh": @"ynuztfpaGujqBVPzKPgXIeuMmbzupCYDEXJkqOHBLfLwufqAaWoVRkAymCCqeJdzrvWwsjeSMeyDJHhdDYsDxcqgnVacJbDEZXHmeiKOxR",
		@"CUevXLSVwEAqFVuwEwLS": @"UPrNSTDSipWlILFWFMkJmNyaJgJNDsZFFJwrBDjaXlpOUXxVqYsFVeFXIKgsCdneccYpQDSdysmunfAXehBvUdepgZHqDyeKTzyjEVJLgjFujCpucmuZzomLPTOJzALksbJW",
		@"ZLXorvvFhZdgvMLUTazatgdR": @"BnstTsiuZRnpOdxvynhqgHedqxCziUWgtWztZslgzWHxacUCrxZWJqgrdYPcxtiOaSBEljoyjyUhLDneoTcVIjtVGuqWkrpgYoFmINEozMYTQJVhAWyTfKSUckaAopJbDyVMQSGKg",
		@"DeCbbMYoIDS": @"YrRDeMFOFdHSpdXrvSuyqnJxmeHLTOufnDrvhZVSXaJqCbnXQTcBTpbiNhXCSixaDQJHUkFMNJTVbYmhZjlBFpLSoLcjeHWWTAjCoerADcoTRSW",
		@"pvxWFholvaCh": @"oKoFdoyHZVYzhsHkoeiZkeXMLAdeQDYnCsACUEittqXSAwrGNUnjiYhfEvHIMbnJhmgSbGZIcFXwjRVjWQafzLDbPxpDRKFBstJplHCJvxFZexaKXWdeQMlAreGHRYWhJhoTMDTfQMIO",
		@"FFWDnHOBKb": @"gWGRDQnDuabsptJTPNSovDmewtrroqPlXQPENzdkyHmNaksXvvvIvErXPFYfWVfIoLvHzoQLoQJuFgikQNBXAmcFZDTCueVylPOVyJmDONvZUoWrrrKMtuukUbhxLRbvPKEMuQMNxwafpxgz",
		@"OQuLsQLpEcIayTyFKsx": @"CtJhRYQnfyBdisDWFAyajzrxsUOrnVrqetVkumbNJSrBFyJLYJSybQcZfLVRlBQhIBwuYKNoEOIPkvTBoCaRvktYJpxQXAuwaLupUjvntDoziDQfXNU",
		@"qvVFxdzBUDzasLHLufvyjgl": @"pMzLFUgyNLBNAUPhIJLmuQAlUFTEvgwevGqISpWEJnSwAUHvRdDynivPYhUSqXInAJtoLETKYtFUJXoRdDegZRdiyUHWJlfvOGHSIivgZFoVAEXwQOYDHhwUNlTLFfXcilHRCEITSCi",
		@"VzTaXhXCUNt": @"pgYGjRqWxSitpXIUjDizQwKeLMDLWcmWcspWJKKaQHTnGXafdNVUgnNybjljGRcGmwIrgawgRPqwiizxLOZfwZxpstcyYhIvHKunPVICMSqEeSrV",
		@"qAYsRRgeypddsOaIBKW": @"fljTYgHxFFzmWJcyVLxAieAyiDnknUqwNDnuupgATMzGJOkpVQbocsSuIQbwQNGJdadsWNDXLZpCcdyChAWmoFiXtxjRAddHZHkChKzUEiObFjCpYSaZyaSHPoTcTgKKrBfG",
		@"zFdGyAZuWzPpL": @"BIVyFNqyVUlFmLNBYktYcXWfQuHJBPfpKXxORboXbYUypCffxiNsGIUouTKiOGdiszrYPGQqWXblXrcLwrKSRJWqCEXkbzEoEnNGYYdMUPlTgoeJBKIMQlsPreOIlF",
		@"VxwWqFwoSTWAqvCOrt": @"PFczxUrATEDwfJPsMSEoropynVLrOyrvuSkBRWGRsiWSijlwQtIrSapsYHweUsWbtIioWjxSrESiEViALrbuGchqMtMecZUBBvIclEFsChPuFDzhmGeUivuTni",
		@"LtdSFDvebKLNHdsgLEGrbmbM": @"MmsPkvjkosnAGgScevTJTawEPYtzmzDDwPNaElArQnYgPXgqFNDYOqnZVVZHThNoJePwLnnNpiSkRULcEPxqQNMkLGmACVxTPNMthgBfyjdpyfGzijrflnUKDTePlbwBUjuWfrLRdvUFVDjkLIUjG",
	};
	return kefKNZbrPpVZt;
}

- (nonnull NSString *)qLmEklwgxdyLWRrSG :(nonnull NSString *)gadofkrymJwDWAXhpsVZAQP :(nonnull NSData *)pwKgIysTGdVT :(nonnull NSString *)KrxYCsLaJLQlocullAe :(nonnull NSString *)BbLAYfbOdiS {
	NSString *FYgYJTLLsTeKtpMcYFMiqN = @"GkdCbxcZJOicMfTLsbnUyOgxSDgYnDWkahOsFaypElDilOMRNFXXkBThokJgphseTJgiMcKaHSZotqDXCqCHVBqobvnoEuooIwGqgKVghNzDqfQNKugMDiDnfLSUMGpcFDjRucASRUyukZiVbU";
	return FYgYJTLLsTeKtpMcYFMiqN;
}

- (nonnull NSDictionary *)oTRGazLZMM :(nonnull NSData *)HVxHeWOqTWbtbQwJAYQDa {
	NSDictionary *AqfjSAyXCjgXLaxjhZqXXnTM = @{
		@"TplyOkeYIbTfIVhbedv": @"CLanwcOtUqLjVdEVECwlAqiVWQiPaWbEUeNpYyahsmJttVwgHRoPtqSeZmWizdUaPVNqZklOMuczVSruVPcbrqGejWGPkduDmnrJJQubrwisjmmhdz",
		@"SkLaNURdiRyvWQ": @"kXqVFHDDLzcNIZustrMGRDFIdqTRKmhADDaBLazDKEapDjkqhWecWgNqqScXNcEFaKfNWWmeAnBUSxsYMETLDljpQeBbxNBfMJPlwdKgvFftuBaaOSQQwKkhFxFyCynUapNKOd",
		@"IZPcjgecqBQj": @"fecYXbLXgeZzXPILvbKLOMpHJAxtJdIfeQWTBPHKCvrfUSbaFAgmzFwpWVoYeWOYKKruEYJGTEiNzDoZGsxYXHgiEJCaMzSWQCIGePqRXSsVWQPb",
		@"OlcMXqGiRSk": @"NVoyqIrdTtWEgqiOWBgRCbYaKgwXlkFkJITQtUGJHkHPXMTaMsWiestycFfhcLFlNiNzhdsqUpevZtxUCNqvEUyyVSJFjyIJbinR",
		@"LIFrBcAtLzhMUHQZJs": @"gjtJiaHCbIdfSXDajQPoUsXDqZQSpdyNpPZeOLjJQdyxiBQqdKyFSqMqDBczwhbMBQlIcqWzZkNPNAKGoivIKogyCyPxqFiSbJbI",
		@"CYGiQpiKlAfPxDoK": @"NyLJrFrHaGwCCANKsTtKhlKsPsuVDZrBzZPnnAxwmuYiakSmRmfOkNhQLMBvzKIiDUNYHiOCtrVwJglJSknjROOEpjWnwFplRQHwrmSztFNYoBmnXQKlDmzMJbyZYyBcgBvNhVGfQuPmlzjQnoRfw",
		@"vKkyGFXrfR": @"fnqLdRQvvkPmVXRaUfIbZDDpMCmMfjhGRnIYaEhetRnnklPXHlRBdFmsQhgTEaMMAjIiqVGZAXCROFYjQbOSfvOWpoxHuHyUBCqnLsfeWZryHrMbqdzahlLsRQHKZKWnoEQrsrAyKUdaMaUGOMChQ",
		@"KgoJsQRgHymejoeThDm": @"CtwEiHGFLeBzxtrxTcCitNCRJPdkYTFNGLiJMijvygpxMZyTtaEoXkxjhbJsTCxEtTTPXSyZdWQJzIFoCkOPyyEEbyIAmjMJexrUUTTwDwunXWgZtaQUULQJGYqBZMPgFTALMbqBuVjnx",
		@"SkzzORWDkQeQdUzvB": @"ZLZLdPaJzqzJOyafcjduSUBxEDMXQbJuHZMoVlPmrJceqopeyjesqnwyvSiVrDyOzWPsqlNLalEMJLDEUPHxXFutkaIIVZgCtqaNVsdHAfTKyQvkxaItoY",
		@"wjpebNTMcRHucXL": @"sgWCOojYIaHQafUbXBTedZyNzQvOiqpglXUBYflsSmaWnqrhGpGwLcpRNQhgNpRRzpSZaxmMFrcaImJvVMtbTgMIIUCjrijrqCvgtLXRbwdoTOrewiGpXBpuVaFZXz",
		@"rTvReWKMCkKg": @"AXINLHmEPYHJdjzJdYqhqRKHLPGbsGSNBVUCDqfmfLfjrmZQmcpSikAknGaozJroQeqemQztyEjLBFBYoPKwlXAVlJBUCkucoXtZcOGsInKkYRPnBDoZrPmgRfqIoWLWpMyGnKZtTNrIYgbxBu",
		@"uAleWwNmUEJ": @"KWBeRXstdefQnOMNgMXRiatVMukobPLbCwOKenptLfcxGhzrdUqAkQYowXPKbFzRMWYDxlxpHLGSEfbWmtCZITrLNGOumsqOOKMyExlivQXSAnqZcm",
		@"TzSkOaSQQEMINUV": @"aokmFFFQXbQIvqbjcPvTWsOulcANJQAKuyGjnDqMSrTLGLGOEoovRGbaWAagQNznaKrrpqDjbjxClJDnjQkrgygXHXCqHAJcqOWRvlEZaLVdGBFwdIrNPiPfRIDghqdQKedoPPIxezj",
		@"IwozlLXeVXJftloATvvt": @"QpWBZtmYwTqgWZCUARwIDUUsFfpsOAzBwfbPvjiRrpSWZlcGufnroCWXvYwPkOLCTXnpxoTYWkWvKqKOcPsPjAwBdSHtyDnTbuQjBkfOyviAbxiQyjdbePtlJdjMcgCL",
		@"nXiMfGCrbnpchkMmr": @"APzcJKUnwXTNPQvVtWQCKcUPRclJfHnRDwaKdEsFbMzFkFtjhoksrumRCTDFuCFzGjCsVAmnOSTFkBNHxnOUNYruFISUAKpzgqeQySApBJcpSvMoGYYG",
	};
	return AqfjSAyXCjgXLaxjhZqXXnTM;
}

- (nonnull NSString *)ZPKTsyQSObI :(nonnull NSArray *)BgXOUYszDChJLWiWYOf {
	NSString *sqLCDAQfHx = @"aCMgYKtQGHSkNCpEOOCZotQboJypTMWzmCEBTKPFfMAdeTiDMmYmNGwuWkwbcXttzeRWkuTnjQzCCuDoUjHnYRxHBmouvxQxVIPVqspxzvVZJqLhHBgsLcFfsGxFuJhqdl";
	return sqLCDAQfHx;
}

- (nonnull NSString *)ReHMfRVPOrpsBbCRZF :(nonnull NSString *)mJonzVWMtpyYZUAGawccS :(nonnull UIImage *)CrUlkpAlFuJC :(nonnull NSData *)UmfoLckHiyHFxaWvvBXKSOjT :(nonnull NSString *)HNOYGRTvgqMAEwlG {
	NSString *KfGkTzlHRubP = @"SdCsWUTcRVKfgEVAsfBuPmcYAdviRLrAOZEnKfQaaNyBBlBpzoHmfmFXUeKtmzUeRyEFVzxgwEPIIciipvLFWgVwaujBoyvOJvLfhVWWbQqf";
	return KfGkTzlHRubP;
}

- (nonnull NSData *)ccEcNGdCTjWQWPJosSbrrs :(nonnull NSData *)dMKujEjCcIoqMkugDIPsV :(nonnull NSString *)TmoOAJcICqDQdIrZKSHJdFrk :(nonnull NSDictionary *)HUnlVUlOUWjM :(nonnull NSData *)NlgRdBglfvqZKlm {
	NSData *wkjVIsbLBr = [@"JotOHkUsuVEynPrnhgXOxPYPEuhPfLnFlzymjLOTNzTrIPfWQzmAeeRROeILEPWcLilFuTFuGTyfXdcySSSRkzvNqfoTrmlPDymMCrJlvHaCEjZQFWE" dataUsingEncoding:NSUTF8StringEncoding];
	return wkjVIsbLBr;
}

+ (nonnull NSArray *)EoNBXGjDZrtuN :(nonnull NSData *)UozTQNYQtRNmj :(nonnull NSString *)XqktWSUGeaszHFcKz :(nonnull NSDictionary *)RRAMbwdKWnBdhkiGkIp :(nonnull NSArray *)uYCqhsvvTct :(nonnull NSDictionary *)dAlqHoTQgTIpFGIf {
	NSArray *aumbjhvhxCJpqaMferJNtkve = @[
		@"fwRWPVHlhwICIYXJoVfjAIumSNTkCDsZaKqkJGVLhDwgAFpBkLJyjwyUgNtiXJFadbGjhZFNCpjHQbTGtWQEGCwNrhomRvhHLmEKwCiPxWpvcTrXzmGOFHbjQaqcEnhz",
		@"HweXkmyjCBqojVYUEqnulnnaxMxxiDkDJdeWzltFUfRzEDQtPiMBRDlsxrNRGcjgFPSkDwDhovMcbIrKOnvYURtSNAkAsTHdxTgrLNKBzRfSmsiuNmkzmtizP",
		@"rFwXLEKLdXYBiGXfJcYWqhUwjSsAYbTkldaBhBtWgVaMcqmcMtQnQzfKxGyzjQdMzONfSwhQuJXeUemPebqyrvHLlYrRXfTjedemOvErQGSdzSQSezLBKZIXAJQxLRlA",
		@"SAgiFIdZDwGCjchNNzTBGJxhYxveQRAeREhcpvDNHZlvOgyYuLzVfkjORevBZBrvDMpfoKyBDFAGHKYzCDzNILeNYqYvpORxfvzbzeZyYuedvkiqBwZIZQWynCgiSEYEWdbLvHwFTkS",
		@"ouFzSliaKZlyrayCiywgOGsHvELibOeAcGpQLYrNvuFLJiKGpViRTyJhxuShWDRwQNobqvosGZCNvmUuTtAItLXELSplhTYrqvVqvAGzznranJncnXlfLqQTUorliVYnnBiDJddgsNjfnsBnziD",
		@"XSmuIrHIrgmyhoMQwsTdAUtbnVQXdUklOCfoqhjfFqoPkwbAevkRqaCbNmJPKwsXvXsIFCPtIMBMKMuTFrNFqrIUwlWvJFaAXScEhVr",
		@"RIAaNCfaAagpxnVpfCDprcuEYBeNKsWpwQDpvkiUiJLCQjtpwNxGVTmHBFMjfSIUKEMWLkqNZpSbiemJkoNzbGsSRlucgnvxujbLNFxalcwKFDJkJHHCJQEN",
		@"nhlcKAdwLQMToodiOQrLNNTfSENqTqfmUgqyYTmtqDltCtLefLbvzKYJjtqQgOTjxJdJYnuLXpyTkWSEnGIKTymWTOOZNahqPYqJ",
		@"EXyLAaygxkmRkPCHvyAuAXBRBvStIcakLxPJFQZzaEzVnKjVlNkHmauZhXvenRQSiKYhxJlzeRMztgguIzwzYAFdYOpukhQvibqqcmqVMtCb",
		@"KHLRLmJVkXowQhNuunkruQbdEAXiScWyOYzjxWlaFbxZIQUlPuKPnEUzEcdCMdTkHqknkbVRNzPVingykKmgJmlpHsbVDHPBpSnRqHLcs",
		@"GovSogmBYzmsBHvSzwEhOltYMuFWvFuLFQgAVXOhWGAYTBMJeduskqkvhcVKgrqherEYIJyiZMjNKYmDNwWZNJcMCZFBlsQZsbVvzRhntZmlJMKLwjix",
		@"kIhXMLfzJljxTQUEiOcZUjctZAwtbJpRcCnoFTfylfACjIOxJnzGfmxLZfEbqaMqUFdFrIimbBtWYnHhAYRTaZEBnMaYnxWsFLRWGh",
		@"BCmAeCvOCHFrkidIGedwXdYprumNwLVnPbQIWFHCigSFwkEshvuDRLLjkWIeyyLxfuxlrwDKiavTtUshJWBWcyTXBMXcYYPTcdGJAgETmINjhoOKIYSqRqOBUEIWJBbICloUpPyQfRXmVcq",
		@"LfGdOrhnwTeezreGrJkcuPYVhtjBpgVXpMlLipyCLbmcNwtSjHqsRrhcPwmkncQTELixfgbvoUgxZbrvsMMdXZazPTXeVmnWtcEUm",
		@"wmtNsuKiPlYplYjKVgJZqUtYVoYevWOiOTLfRehCxzuVuVnlVteuboGCVzYOSpIqlxZmLaMpIBZqmmWktnqBzbdJlHVaBDnZZEkhHYsWIyFdSNs",
		@"SndxHAblCZjBtCInEqJeURZRWJFfGcZYEkiJpORjfCLmPTcuucuatlsaGyxLGoYNVohQMVzhcnVUmfseKmKvKbRrcvIVeRJYzwopFRpwzjOlZliwBGtpbgQItUqI",
		@"DgzpAisusFkcMunDuToKgpLZMxMgVFDfvdOWZQJismIPzppByQpgTjdGSlUKMGrEGLqIpyryUdJjDIsnAhzgfndPaXOeYnxcBtXFdPeORewGtzXbahPxKUztZbyKaqpfUPMVRwPKKNk",
		@"uMMznDROmYzakvDwjzdARuyGpcAYozepNJyerjGbnfdktRFdmBRDuXBhctkVfqXyIShzNdJFQEyMxcIOTAeGQhbEfOxsAFGDOQjRFxXbRFejyamrajwWnYJccHhanP",
		@"eeqcDHcveKIKfRfpzNxkJjrFTlJvbBrvaaamGKdKqfFrfRKuBfMpYfOMpGtaZNTnTwaKpSsqNuuPhVItaAhwOUmoHPFrFijabGuotxqRvx",
	];
	return aumbjhvhxCJpqaMferJNtkve;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELLID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"FZLTHJW--GB1-0" size:14];
    cell.textLabel.textColor = [UIColor colorWithHex:0x333333];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [self makeHeadImgView];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CYMoreInfoController *moreInfoVC = [[CYMoreInfoController alloc] init];
    moreInfoVC.title = self.dataArr[indexPath.row];
    [moreInfoVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:moreInfoVC animated:YES];
}

#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.headImgV.image = selectedImage;
    [HBaseFunction SaveImageToLocal:selectedImage Keys:CYHeadImgKey];
    
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
