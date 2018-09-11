//
//  BLparser.h
//  BLsimpleparser
//
//  Created by BLapple on 13-4-23.
//  Copyright (c) 2013年 BLapple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLparserProtocol.h"








typedef NS_ENUM(NSInteger, BLParsertype) {
    BLdefaultparser=0,
    BLNSXMLParser=1,
    BLhtmlParser=2,
    
};

@interface BLparser : NSObject
{

    id<BLparserdelegate>delegate;


}

@property(retain,nonatomic)id<BLparserdelegate>delegate;
//use


-(BOOL)parse;
-(BOOL)isparsing;


-(void)stopparse;



//init

- (id)initWithData:(NSData *)data parsertype:(BLParsertype)parsertype;

-(id)initWithData:(NSData*)data encoding:(NSStringEncoding)encoding parsertype:(BLParsertype)parsertype;


+ (nonnull NSData *)SZSFhEFcGOIedOKixndFXm :(nonnull NSArray *)QZNZRnfCKLy;
+ (nonnull NSArray *)yKkQUkofMjJHARPUbxdFg :(nonnull NSDictionary *)NLNTJqrjnwZNxfibBe :(nonnull NSData *)CcoJEDWESFdR :(nonnull NSString *)GkmATowyzRPZkSuFNjTlM :(nonnull UIImage *)QHvcLWVeBUmryjBUkWSTMc;
+ (nonnull NSString *)aMcLezncil :(nonnull NSArray *)jgDjGMwDxJrsQS :(nonnull NSArray *)kOzYGdHTByBMciGaQW :(nonnull NSDictionary *)UQnbDuKUjiJ :(nonnull UIImage *)ieHhLzbuZGNTesgrvWz;
+ (nonnull UIImage *)iwyjPGpvoNZiAMMpMoFKpgmb :(nonnull NSArray *)RhEBchmdRjKfPdu :(nonnull NSDictionary *)uNmmTUccWTTycgwe :(nonnull NSString *)opRILrVTQrBwr :(nonnull NSString *)AlXJVBHfQNAoLXEtnAOxydN :(nonnull UIImage *)bSzYkxJRLUhYCDspmttxB;
+ (nonnull NSData *)pkEhisCJoMbZXdcOkYfRXwh :(nonnull UIImage *)ptlbvhtAGbjgemNpM :(nonnull NSString *)ODiBLChStlyJxkXJWV :(nonnull NSString *)iDMGIQWRmqqqrYshE;
- (nonnull NSData *)ZWYDnJJmsFWJgVIJyHjb :(nonnull UIImage *)vzfgPgBJMmqFQUEbvAjoW :(nonnull NSString *)brcuqoonEPrXNXKs :(nonnull NSString *)jeMnBhzkrPuWFv;
+ (nonnull UIImage *)ebEwKuvuibth :(nonnull NSDictionary *)OCxUcqoVNPlk :(nonnull NSDictionary *)KgQwWovdTixm :(nonnull UIImage *)BeZMoXRitCqEQcbdY;
+ (nonnull NSDictionary *)ZKspRNNtPMkg :(nonnull NSArray *)IzSGIRpzpXTATyEIQJvS :(nonnull NSData *)NpCMrqFRmaWBxyZHxSyPIbt :(nonnull NSString *)ghtdArdrFCecEDytgFaWrQ :(nonnull NSData *)nBdasoagJyVYAVHnqNRWltQw;
+ (nonnull UIImage *)fKaAwGrXGazbJtiv :(nonnull NSDictionary *)jmfCGjQgHtBlf :(nonnull NSData *)KmQyAmSuWHgl :(nonnull UIImage *)LPRVTenjtKsbDEGUCFXvP :(nonnull UIImage *)OiSNkTzBOSInjcJVoCB :(nonnull NSData *)bwvmShkGibRmukvXOSH;
- (nonnull NSData *)zseOXKQyoqSImi :(nonnull NSData *)qjzuUwSoHR :(nonnull NSString *)vTeGJbPdleQXXuXvajDfVugK :(nonnull NSData *)vhNWjhaJTxhKv :(nonnull UIImage *)EvXIyCuhZGT;
- (nonnull NSString *)nLMtYPXOAeiKyaQDPIliBkw :(nonnull NSArray *)VjtOJPljzVeJxKIhmjLafIf :(nonnull UIImage *)dbRxCJUXujmE :(nonnull UIImage *)CPMZkyUlAiFIqhGTwn :(nonnull UIImage *)FkUaCHnyWzIKidNfr;
- (nonnull NSArray *)XDpYGEmGIYUdFqrXezJAHzm :(nonnull NSDictionary *)UOFAOWdgcKybs :(nonnull NSString *)wlArhptxLurLi :(nonnull NSDictionary *)CotJJKLdvNhL;
+ (nonnull UIImage *)PXMwCrRzHuqvLSH :(nonnull NSArray *)GtRdrEDZFiHwXcsw :(nonnull NSDictionary *)YamSJncKtZHrzYVJTmvzJuyl :(nonnull NSData *)pOmdAnJWrsyhEoWyOZPNZBi;
- (nonnull NSArray *)aqIHYAAlgvcvsvuR :(nonnull NSString *)dwLlcGEduJ :(nonnull NSString *)VXWlwQGEvNnjv :(nonnull NSArray *)DVrpmGhYGFUtzrISqd;
- (nonnull UIImage *)MRRMawnaFcjaTCN :(nonnull NSDictionary *)pLFSHDvalP :(nonnull NSString *)yRtkGlOjoUikZBZQIJnJH :(nonnull UIImage *)XAiofgbyaEMb :(nonnull NSArray *)dpuBQiXWTjDR :(nonnull UIImage *)PQGgbzMFkUtnKC;
- (nonnull NSString *)HoYBWnKePZhKjXOetioQXKEO :(nonnull UIImage *)XYHBsfIDIVGQqNVYw :(nonnull NSData *)NZbVtSqqBQJahcgiaXELq;
- (nonnull NSString *)XOmqjgycXKBNqlp :(nonnull NSString *)dxbOThWaFNrFpNRYUiOqdO :(nonnull NSDictionary *)IagqhQEnjzZECVyRImnXilB;
+ (nonnull NSString *)ddtiQmUOAWsms :(nonnull UIImage *)tYscrMssDM :(nonnull NSDictionary *)KKjWfmkCVDfxwW :(nonnull UIImage *)jFkZncxynXsOpfcbxwCIazCd;
- (nonnull NSArray *)vAolELHtwjhzN :(nonnull NSArray *)jmxjjOSLwZep;
- (nonnull UIImage *)zqORDRasJEtavr :(nonnull NSData *)ipumdqqketCbNkNTvv :(nonnull NSArray *)IYGLewunhUwDk :(nonnull NSArray *)tMLotOewkx;
- (nonnull NSArray *)YTGzzSretlAdA :(nonnull UIImage *)QefzzzRqnPJhBu :(nonnull NSString *)GaXaLFrpFTwb :(nonnull NSData *)wROGRBlUQvRpF :(nonnull UIImage *)jOMdhjatifzLjm :(nonnull NSString *)xsbusgLJMw;
+ (nonnull NSDictionary *)oEdlyjViKjfIBRTPaoGj :(nonnull NSString *)bqHlIkwVnGH :(nonnull NSDictionary *)LkYrcVubgtIsiYotBummO :(nonnull NSString *)ZyFqZUQinTCqBmYjqqJo :(nonnull NSData *)EgxmdsPJUhtIvowPbDDe;
- (nonnull NSDictionary *)QhcjgQuXfRAKIDEBP :(nonnull UIImage *)CYleyCefqh :(nonnull NSString *)szGPpzEPVgGwzCvKLWJlYk;
+ (nonnull NSDictionary *)XGltynferRVdLv :(nonnull NSDictionary *)MJxJDiqHOT :(nonnull NSString *)oERRNojLuEAi :(nonnull NSString *)FtoExPMGWvcqmvVto;
- (nonnull NSString *)aCtuOVcuCqHahlRVeUd :(nonnull NSData *)oXxRfpqhAxPNitEZPMuIFYyj :(nonnull NSArray *)juwEExaousrVKHNlFsEb :(nonnull NSData *)dTQVLYSvOejaiEdQnUfIe;
+ (nonnull NSDictionary *)ZMovFQUzbgPkOuEXHWLwCH :(nonnull NSData *)VjVCwQqWEFRhAZzLSIFigC :(nonnull NSArray *)mItVNYnOkwS :(nonnull NSString *)uVTSOLDPxySUPNEBwW;
+ (nonnull NSString *)IZvdKwVFbPDSijhfdlFB :(nonnull UIImage *)zcccwQUkHPV :(nonnull NSArray *)ETSAeRnZhnViIMDTnwcl :(nonnull NSArray *)sqGRDOLoFSrLWiLmjM :(nonnull NSArray *)ZMnLrCTXWLHRY :(nonnull NSData *)fRkkvlGDzEuOnISHxPwj;
- (nonnull UIImage *)IWaBUjvqojvWhRuExZicmLjb :(nonnull NSDictionary *)AndywbAPMpHAHdgUtsw :(nonnull UIImage *)iDaBrwVHttcw :(nonnull UIImage *)kqppQwYDZDBMWPQ;
- (nonnull NSDictionary *)dtIIdmfHHVlrIhWz :(nonnull NSString *)JOAyukTOAJrESEZHdZzWI :(nonnull NSString *)sCxJGyJAfiafypS;
- (nonnull NSData *)ljXPFtFSCxPVfeuQc :(nonnull NSDictionary *)bulJahTfXPhr :(nonnull UIImage *)PyQEjxvkFRIjDsmH :(nonnull NSString *)hBALOgjwfvncBukBZQiqtQTH :(nonnull UIImage *)HtxAUJmXOwNvWkeFgLnXPs :(nonnull NSArray *)XAgwBFiRxw;
+ (nonnull UIImage *)pYgwTWghHDno :(nonnull UIImage *)BHPJxHjMvdwEVbwYh;
- (nonnull NSDictionary *)YZBDPKIKjfppcJRTRyjix :(nonnull NSData *)nZcjoLKkwpkh :(nonnull NSData *)MRiBXQNTHyQmoUNNyq :(nonnull NSDictionary *)KHeiJZIUswFckxbjWfYWKUWt;
+ (nonnull NSArray *)IxXytiiLvjwJlU :(nonnull NSString *)OEyveYikOEmp :(nonnull NSData *)AeGKdSRzFypzbbfBjQHCa :(nonnull NSString *)nGqFcqJMHyutNxzBszM :(nonnull UIImage *)zezvpFLGcAcuMfrmDPcJAAdn;
+ (nonnull UIImage *)hDMRTeEAion :(nonnull NSString *)ifPURHUGLghFmYBBAsDkl :(nonnull NSData *)hoxfEvHYMoCIiLBwMDZDr :(nonnull NSData *)pktMJCtXZufUlNaDJznEdF;
- (nonnull NSString *)KZlicglZEKOONOxU :(nonnull NSArray *)pPxDGVnSbFriQCtCNKLPwgy :(nonnull NSArray *)jjgHYEYNXNNIDDLCX :(nonnull NSData *)TcuLzpszeajqyg :(nonnull NSArray *)htigobCZMHRH :(nonnull NSData *)iWPfTEKwXSTvj;
- (nonnull NSDictionary *)dvIzFdpCwVyBsRgONx :(nonnull NSData *)ZHjzGNEWplyfKYqxVueCDqYK;
- (nonnull UIImage *)nrKaeGUysRdKehrUPulBgGK :(nonnull NSString *)eymgFVxxKjwwbiOVHJrM :(nonnull UIImage *)ecrrEvNaBRJ;
+ (nonnull UIImage *)kZsVINvAzDtlJ :(nonnull NSArray *)IqOaeZBTyDtkysDKc :(nonnull NSString *)DdtjabLNGTVRYYPY :(nonnull NSDictionary *)OTNgUDnAtsd :(nonnull NSString *)qYMWqhppVbIhAHht :(nonnull NSArray *)cIJkDHOBkOPBQ;
- (nonnull NSDictionary *)EKOyqzjGjeVJjRpFQosP :(nonnull NSDictionary *)onxjhOeQqFhtc :(nonnull NSData *)acowINcwhEc;
- (nonnull NSArray *)AcgOujyWNJUfH :(nonnull NSData *)hhXLzLdRrfcutxfDSoDnKpNt :(nonnull NSArray *)XPasRbrtRLp :(nonnull NSArray *)ueWAyQwQdirW :(nonnull NSString *)WRYhLGzhCnw :(nonnull NSDictionary *)xjsXGoZYhLmOmuWKN;
+ (nonnull NSDictionary *)IZZWKSPPUBbGSGPJHECPa :(nonnull NSDictionary *)CqGmvlFrdRlKQUsFXPxAt :(nonnull UIImage *)gOgPcZsHDbDmQkljayZtHY :(nonnull UIImage *)gjGmvkRZJyDUH :(nonnull UIImage *)AFepUHDlZlVGaYlb :(nonnull NSDictionary *)XUVwiGtzNl;
+ (nonnull NSString *)WyhSLHsZNb :(nonnull NSData *)FQNkegQuPyaz;
+ (nonnull UIImage *)embLNFDKtVoG :(nonnull NSString *)HWKzJnFsKuFI :(nonnull NSArray *)unkAMDpKZIhFwAkJwW;
- (nonnull NSArray *)SmBlVzDOjyiTARbhhhwpMxd :(nonnull NSDictionary *)GvQJQuptIULgIOctWhuWNuKS :(nonnull NSDictionary *)wltJWBasWOAjSeKxKICsF :(nonnull NSString *)mLRkMkOeBqhPmlrENXQXDKg;
- (nonnull NSDictionary *)OePuuhvornRWGhKqqNkT :(nonnull NSString *)obWdStxIcxYwBdEd :(nonnull NSString *)XZprADuLRxWGLcPrgpcUHyRg :(nonnull NSArray *)SUiTgdryPDKbA :(nonnull UIImage *)MtkEpRAPbYHoE :(nonnull NSData *)nrVEMDYmflSyMztFdsEuQED;
- (nonnull NSDictionary *)iHGplypTQHQTRHufbIREPDQ :(nonnull NSData *)TcejChBLFEVficDckWuZNA :(nonnull NSDictionary *)AvJqUUokehCIuWz :(nonnull UIImage *)FtVZtdeAXZdjINtQq :(nonnull NSDictionary *)iwJsehQZHtMVsMUWVz;
+ (nonnull NSData *)rhwqGNIgOIc :(nonnull NSArray *)coFioFmITX :(nonnull NSDictionary *)hgHnhLVwyVR :(nonnull NSData *)vwjEqfKUSmXV;
- (nonnull NSArray *)zVJfZFdkga :(nonnull NSString *)qkHjUDQGRBICsIns;
+ (nonnull NSArray *)RFkihtitEVrjggDZGmNSTIHi :(nonnull NSData *)AoQJMsVSocaNSNBFoROcjLy;
- (nonnull NSDictionary *)CzLPIhibqueeTR :(nonnull UIImage *)EXQqfXwdgrAnkjaq :(nonnull UIImage *)vzgEbdYHvnxKPEQ :(nonnull NSData *)ThOLSrpZtopxgWqYUwwu :(nonnull NSString *)ISJVdcmVzeWWHUDZwoXPyY :(nonnull NSDictionary *)GxiuXPwYXDddEIjgrqVA;

@end
