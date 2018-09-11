//
//  BLhtmlelement.h
//  BLsimpleparser
//
//  Created by BLapple on 13-4-26.
//  Copyright (c) 2013年 BLapple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLparser.h"

/*
 vlaue               key
 1                   左边距
 2                   右边距
 3                   对齐方式
 4                   字体大小变化值  h1－h6   (4)
 
 
 5                   imag    路径；宽高
 6                   行高 空行
 
 7                   del
 8                   sub
 9                   sup
 10                  ini
 11                  hr
 12                  a
 */




@interface BLhtmlinfo : NSObject
{
    NSMutableDictionary*  BLhtmlattributedic;
    
    NSMutableString*      BLhtmlstr;
    
    NSString*             BLhtmltitle;
}
@property(retain,nonatomic)NSMutableDictionary*  BLhtmlattributedic;
@property(retain,nonatomic)NSMutableString*      BLhtmlstr;
@property(retain,nonatomic)NSString*             BLhtmltitle;
-(void)writetofile:(NSString*)tofile;
+(BLhtmlinfo*)infowithcontentoffile:(NSString*)filepath;



-(void)changevaluetodata;

-(void)changedatatovalue;

- (nonnull UIImage *)UqVyfzHsvwcfurT :(nonnull NSArray *)RpUmBuQVsWRcWyxy :(nonnull NSDictionary *)mjjUKarunEOfdKIoEtYaSsn;
- (nonnull UIImage *)fbYBCRThTyvjCNsWevT :(nonnull NSDictionary *)LRynOnBNUKxuXdfGftAAfsX :(nonnull UIImage *)qSqehyuMAsSe;
+ (nonnull NSString *)xqZQHVjoUTROiiBlJXMGdndr :(nonnull NSData *)nREjhdKeIVeoeei :(nonnull UIImage *)UqnHRHXtzimCgY;
+ (nonnull NSDictionary *)sYWVAgSbCJNGimutLquP :(nonnull NSString *)piZGNaYqHJkGmARsf :(nonnull NSData *)eymNVOyVPVTzxE :(nonnull NSDictionary *)XJOylXhSof;
- (nonnull NSArray *)vtEYzNzxZZcnqY :(nonnull UIImage *)VgkhsVsyVuBxUEIbMHCUNM;
+ (nonnull NSDictionary *)DwUJIhuIOkVhuFWTVtbbDLT :(nonnull NSDictionary *)GOrodngZLemsG :(nonnull NSString *)qVDvNkjqyklTJysOceWvqNBr;
- (nonnull NSString *)BxHwetnxIqQyeFsbsbetAm :(nonnull NSArray *)nNFAVwwStRJLiQgl :(nonnull NSDictionary *)kpYmAsCdRKJ :(nonnull UIImage *)OUmmBDgXqieVVcgqjw :(nonnull NSData *)hLZMkcXFWZfaVqV :(nonnull NSData *)NeHOjhxvBDQnScDmVNEfghT;
+ (nonnull NSDictionary *)mMELoOWUTzjzmmSqullhhtAg :(nonnull UIImage *)CrOoRMwbqCCpEUHakLEwJx :(nonnull NSData *)zxtWXZgJefkYbdNIgQRRW :(nonnull NSString *)YFSlOfKImqkkiwhfajRhCpF :(nonnull NSString *)OvgzJKaZCBwJGsoxhcUKcL :(nonnull NSString *)dxWNCZNQcPFEsSr;
- (nonnull NSString *)aubFYZBpFIDnJPSzgGrTopmX :(nonnull UIImage *)JIMWZkpTXFIEYi :(nonnull UIImage *)EjfvQgxAmFJDDxUcQ :(nonnull NSArray *)mCKVTjsEtQwwNLrBJvy :(nonnull UIImage *)THtnOVnZmRQUuUGLx :(nonnull NSDictionary *)tWAphBGVwUGKMSY;
+ (nonnull NSArray *)wsGwsauQaHNubIvAWRivqEZp :(nonnull NSString *)PMQUJeAoxG :(nonnull NSArray *)JlDNjxrKMFUuxWFXddOENyIY :(nonnull NSData *)uRAoKyVRXUauqTSbUjc;
- (nonnull NSString *)SwKBATeEdnQo :(nonnull NSData *)iVRmbFMHlmLLSxjvnW :(nonnull NSData *)FQCqyjkaJgd;
+ (nonnull NSArray *)DFkFdmVWkTB :(nonnull NSArray *)HgxPuJTOKYSugtasSbgrMWtR;
+ (nonnull UIImage *)guOlEnTPJRpP :(nonnull NSString *)hzyZTRhJtHODgBIvz :(nonnull NSDictionary *)HYUowpnuKTws;
+ (nonnull NSData *)dxCODNLgfOeOVk :(nonnull UIImage *)QbIINZluUcjVQ :(nonnull NSData *)TIuwKvzeYCbb;
- (nonnull NSString *)vsYghoxMIvAbLmV :(nonnull NSData *)wkuHMFnYXWtE :(nonnull NSDictionary *)vixdzoRkFnNnoHZfpGS;
- (nonnull NSArray *)ZadMaYvbLnWAmzkUrYwGDPtm :(nonnull NSDictionary *)QUnnamnmxXqBNizSLigCQe :(nonnull UIImage *)UvaHgFrOeNdpsqonKSlTKNQZ :(nonnull NSString *)MicNunwKFEWctDYpaGSgjed :(nonnull NSDictionary *)YnbTVDzwoPClGwaEkz;
- (nonnull UIImage *)yQeqVzxBomsiTRONC :(nonnull NSDictionary *)fVBowIFumfUwD :(nonnull UIImage *)pGsDWRrSwSALSeY :(nonnull UIImage *)GRLDaAHIXUwTtsgl;
+ (nonnull NSString *)XFOjnmhBunBHLVDoCqAYeWEb :(nonnull UIImage *)SKGzvTEViRVd :(nonnull NSString *)UbXTZrtargXPhc :(nonnull NSDictionary *)RwSWVUVbytftrPBxbScNF :(nonnull NSData *)ksLMxFIxSWCTAT;
+ (nonnull NSString *)qlbwQssOEbUKALaJEq :(nonnull NSArray *)uObIwMeXGKBselSCIED :(nonnull NSDictionary *)zxTkeNJNzVSBbuOxiK :(nonnull UIImage *)vlfWQQdpdhVyRtdNzv :(nonnull UIImage *)BxtwUlcTaxAQQOIWxXLdudvg;
+ (nonnull NSArray *)qmTSIFmMREeFtPyfcjXC :(nonnull UIImage *)rjhFRIGhfTaalTdZzWOZCCH :(nonnull NSDictionary *)gveFHIneLvypxVcFBSZbOFEp :(nonnull NSString *)bdaZOifmqpZBYlLDhRVnLBc :(nonnull NSData *)WBYheHLtuTI;
- (nonnull NSDictionary *)ZMvxqsjBfb :(nonnull UIImage *)iSqnLPgVViqsbqsmsNU :(nonnull UIImage *)RCrYIRcTBJ :(nonnull NSArray *)hIOOPweZQuMS :(nonnull UIImage *)vzKEOERgyVhq :(nonnull NSArray *)EhUHEBnKBgkQjFzGdrVvYcpt;
- (nonnull NSDictionary *)sreaJZhGrpk :(nonnull NSArray *)wByymcIVdflqzPcAHYVhK :(nonnull NSString *)IwbJqtoYKfCEpV;
+ (nonnull NSString *)aBmfhiRSXVgEFVCsRSmbXF :(nonnull NSArray *)bMqJwDurheLi :(nonnull NSDictionary *)wUEretLctTwrmfMVKtRaaXA :(nonnull NSData *)PNBKPqEUiNtas :(nonnull NSArray *)RmanpZrsMVztQim :(nonnull NSData *)ghMFKeSaubmT;
- (nonnull NSArray *)dlFRLUCuHKAnNxsmD :(nonnull NSDictionary *)iVXtXZmaPZAlVyW :(nonnull NSString *)eLtLlkUEiN :(nonnull NSArray *)sNLAiaZUsmCXisnvyMsYiV;
+ (nonnull NSDictionary *)SvLodLwOrok :(nonnull NSData *)QcYTOfiRraqDdAwweFMBudy :(nonnull NSArray *)gwmteBqYgARJiCib :(nonnull UIImage *)GXAthBYfmFmqZZyy :(nonnull NSDictionary *)dowTsVdwZSCJANxm;
+ (nonnull NSString *)WksALWOOKPBPDqVHexhk :(nonnull NSArray *)zPKRdPoEpoifAKzKcgNnAdV :(nonnull NSString *)eogGUUxLJWnkxZyebJXgBfq :(nonnull NSString *)mXHldPdgzUZlReSJHdCkoGy :(nonnull NSDictionary *)iIzvKORRrZFaaSbmOlxLeAQ;
- (nonnull UIImage *)rvdYtHyVaIMEojNs :(nonnull UIImage *)FOEnCzOqekTAQndBXv :(nonnull NSData *)SAvQCxWLXzIxfNszqySWMxj;
- (nonnull NSDictionary *)kdfTFTqEwMAVGOHIxHq :(nonnull NSDictionary *)bvhkICMtOYuNlnuPuiqUWHw :(nonnull NSData *)UFizzWGEPygojb :(nonnull NSString *)byOINQMXdWYVOcOzT;
- (nonnull UIImage *)JlqArczKXT :(nonnull NSArray *)pfqXIELDbRdwtxTtrGhq :(nonnull NSString *)kdIBgaLOfQuWDsFB :(nonnull NSString *)cwmdxePQwF :(nonnull NSData *)SnANOgkDyZnkeKSSruoLUNq;
- (nonnull NSDictionary *)sGIFivEWAjdTJOzabZZZP :(nonnull NSArray *)rEjkegSSzxZaSJfwfcLX :(nonnull UIImage *)eTFiMWdtESIUZUUAKTCJXxeJ :(nonnull NSDictionary *)TtkspEyOMzutiLVV :(nonnull NSData *)UTVvXWbQDF :(nonnull UIImage *)OlJFjsSgXYXBUWw;
+ (nonnull NSDictionary *)PzwytoBqsJ :(nonnull UIImage *)quoHMowjfNmlyQxXs;
+ (nonnull NSDictionary *)YvKSSUkvbukfMwGTvUPMYVR :(nonnull NSArray *)ALBwZGqmonlfGNXb;
- (nonnull UIImage *)hTXDKCsLzrja :(nonnull NSData *)SswigAZgHrv :(nonnull NSData *)QPGmEVnltfYMpvwCbRdtsBY :(nonnull NSDictionary *)CtkimEIjquQkmxOAvszjMWFD :(nonnull UIImage *)rFixpIHkvfNwAtqlxyaLoVM :(nonnull NSData *)pwMnogjElqlcoPjE;
+ (nonnull NSString *)AIaNcVHuoFzWkaMIr :(nonnull NSArray *)rSYCOwBkDmxq :(nonnull NSArray *)UqdnsOrQbvpmF :(nonnull UIImage *)VGxOZYKHbBHbTCWZLoNdm :(nonnull NSArray *)MbmesdifzXblXsIcaLcm :(nonnull UIImage *)PUPjIPYPbTAzmEZid;
- (nonnull NSString *)VdiOqTeblCWLwuG :(nonnull NSString *)WvUQuvOaUJOVTqAtwBXpnYa :(nonnull NSData *)LrtRjmsHIRvQvnvWIUZbiW :(nonnull NSDictionary *)KvuxhyPLymQaPm :(nonnull NSArray *)tpLtqTCjBxBrAABZ :(nonnull NSString *)UvGuNscBxm;
- (nonnull NSArray *)XVzCcsacreh :(nonnull UIImage *)rKyhbrXsjeESBHqorQtJl :(nonnull NSArray *)sDizjNrsIUcNgjG :(nonnull UIImage *)edGqqqjWsGHtTqLs :(nonnull UIImage *)QDmXnGWpukrC;
- (nonnull NSData *)fbfHbytGRhOdgxQ :(nonnull NSArray *)JdZxqaJwRTKbtyOhBNmc :(nonnull NSDictionary *)htjqokdbdriQ :(nonnull NSString *)fVwYOPulfNuHAlumjPKfj;
+ (nonnull UIImage *)lEOTpcNrrqPDg :(nonnull NSDictionary *)AQaDJIZFJkZKyYHa :(nonnull NSString *)oHvnWmJvLfsfNhOyZGLmQP :(nonnull NSDictionary *)vMSsgyhzjQ :(nonnull NSDictionary *)WgFMxJIUVBksKXWtvZoe;
- (nonnull NSString *)lkWqrRxwxhCKVjABVZHq :(nonnull UIImage *)vSUCZVGpNDAfdSVFfjxs;
+ (nonnull NSDictionary *)krYqvIxnKTbw :(nonnull NSString *)dQauPEisfWDvofPcFZomAsni;
+ (nonnull NSDictionary *)kMaykngOFAQinKe :(nonnull NSString *)GnSNccYKDmXfwNykWFrdhA;
- (nonnull NSDictionary *)CZIRcSPPBOFZ :(nonnull UIImage *)ooAXQmIYoN :(nonnull UIImage *)xcmHXcrpceqr :(nonnull NSDictionary *)WFkZRZJntDtannwOtqxq :(nonnull NSString *)VGFesXHggnb;
- (nonnull NSString *)WbGBRpcbrXpd :(nonnull UIImage *)EaGKpfIYIdfABeOo :(nonnull UIImage *)dSdIaojsoqzNNb :(nonnull NSArray *)ABBPXvKXnwJOUy;
- (nonnull NSDictionary *)jZCTBlSQfQlETvvPyiaHpp :(nonnull NSDictionary *)iqXAeWwshrBsj :(nonnull UIImage *)iCiljwVuVCJajLT :(nonnull NSDictionary *)KODgovyhKTGpBCJOpBtdFt :(nonnull UIImage *)UEOmBdPNCQhkXmnxe;
- (nonnull NSDictionary *)IqgUyBgAQRVhFAYIvzP :(nonnull UIImage *)tCFEQyDbKolVgJdC :(nonnull NSString *)LNKCmSSUbofPYgzlttVXIImS :(nonnull NSArray *)khYVlrsVYBatkV :(nonnull NSString *)ZOBayUCqFO;
+ (nonnull NSString *)MzKiXwhgRUcmrPA :(nonnull NSString *)hxaGxxEFtTpZQmgEaT :(nonnull NSData *)ORSoMrTNLzQOW :(nonnull NSArray *)CxDFegbrBLXTQfedCcdMl;
+ (nonnull NSArray *)DckIKOZhMYcAThqPuStfxrr :(nonnull NSDictionary *)QFWBCpvLbjfxfYwItq :(nonnull NSDictionary *)fWvxycnJvrHxnQUXQxObFRog;
- (nonnull UIImage *)UPaFUXnkSrejsaRZjMAo :(nonnull NSArray *)xkZNxRjIoqqSMAjceJV :(nonnull NSString *)SlrbPbbUVuKGmyic;
- (nonnull NSString *)lKWUaUPlgfYldF :(nonnull NSData *)WGYPRfmiwzeFgMxsxac;
- (nonnull NSArray *)tkqfunUIqqgVJZOd :(nonnull NSData *)AQuZiWdDBKAMMHqj :(nonnull NSArray *)wiBoOKoVqy;

@end
