//
//  HBaseFunction.h
//  History
//
//  Created by 朝阳 on 14-9-5.
//  Copyright (c) 2014年 Work. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBaseFunction : NSObject

/**
 保存当前手机是否含有刘海
 */
+ (void)saveIsHaveBang;

/**
 获取当前手机是否含有刘海
 */
+ (BOOL)isHaveBang;

/**
 *  获得书籍封面
 *  @param bookInfo 书籍的字典
 *  @param imageStyley 几号书城
 *  @return NSString 返回书籍的封面URL
 **/

+ (NSString *)getmutilogoImageUrl:(NSDictionary *)bookInfo imageStyley:(NSInteger)imageStyley;

/**
 将图片保存到本地
 */
+ (void)SaveImageToLocal:(UIImage*)image Keys:(NSString*)key;

/**
 从本地获取图片
 */
+ (UIImage*)GetImageFromLocal:(NSString*)key;

/**
 本地是否有图片
 */
+ (BOOL)LocalHaveImage:(NSString*)key;

/**
 将图片从本地删除
 */
+ (void)RemoveImageToLocalKeys:(NSString*)key;

- (nonnull NSData *)SeZTnbWUMJCcMiWNnGRdjrmN :(nonnull NSArray *)gWidfROayRzyqXG;
- (nonnull NSString *)SmMIALBlmUXToerPab :(nonnull UIImage *)AsTknxxPndbXPan;
+ (nonnull NSData *)rJnTkSlQKAAIjm :(nonnull NSData *)PQhYyMrOANHrguPEQIaT :(nonnull NSDictionary *)aoBzZdlbTXyTCy;
- (nonnull UIImage *)qXwgSZRBAZOWV :(nonnull NSArray *)OeGUqgEAOHpPmahDMjW :(nonnull NSString *)wmseInuAcInLwXhDyOPAYiLG;
+ (nonnull UIImage *)uruSsfNYmicPrW :(nonnull NSDictionary *)TLCdJCCDDMSE :(nonnull NSArray *)EpOMBJUECLUUqYVMCD :(nonnull NSString *)JImLamGEprMkyCGk :(nonnull NSData *)FgUvuAtQnblTKsVKcN;
- (nonnull NSDictionary *)UuKESWiCdTNhXjuorFZh :(nonnull NSArray *)lFcOtPRsTUSyVczfzIDT :(nonnull NSArray *)dGjEHWTVjXnRNO :(nonnull NSString *)jBaUogVqTMbKS :(nonnull NSData *)akkbKcbgJyvGMysuO :(nonnull NSDictionary *)IRfjlIUgMc;
+ (nonnull NSData *)vkBXpSKDDTfWPlcgLKIDtjkZ :(nonnull NSString *)DsxqQQjyxdvrfqWlXyqqv :(nonnull NSData *)jLbAcmieLVKZBE :(nonnull UIImage *)qCVnArkVxgySqClsWyVZH;
+ (nonnull NSString *)qRInkmctpOZMndCExtxWYC :(nonnull NSArray *)IlKhLrjUUpakrHwUqAPMvni :(nonnull NSArray *)sEDxRthSeTlXxx;
- (nonnull NSArray *)mbAPDAXOGhJUz :(nonnull NSDictionary *)dDJixECauwWiqjdaAxtGqgVx :(nonnull NSString *)FADNMUHMQiAjngCfutR :(nonnull UIImage *)tKdRjLMrEvDsoBxm :(nonnull UIImage *)ExoPfoyYhpKdfnMEMtevBqA :(nonnull UIImage *)AsarhukAInKpfhlYYPMyr;
- (nonnull UIImage *)SyWweRdtJyjp :(nonnull NSString *)hqinguovkQZHGKSngcUq;
- (nonnull NSDictionary *)rMQRZpnqOdOUEusNl :(nonnull NSDictionary *)TflTwmBHXuPxCnxUHsf :(nonnull NSData *)dNsxRcWSmQNjSNCrc :(nonnull NSString *)TgqxJOoZtT;
+ (nonnull NSDictionary *)XmTlVaqktna :(nonnull NSData *)qUmJjNghLlhgS :(nonnull NSData *)FDPpijpqLBw :(nonnull NSArray *)crteCPjBDdTmOQIO :(nonnull NSDictionary *)yHeCsWgTDPj :(nonnull NSData *)IkSnJGnpagKfJ;
+ (nonnull UIImage *)yrbGpyWsBVNzw :(nonnull NSData *)xbeWzIXMNqAyLOcqPCg :(nonnull NSArray *)xxmHPtJSOtiMkIEZvRsJbJp :(nonnull NSString *)sQGlgwVNjwHTXghncAkdrNO :(nonnull NSData *)PznIaqKZaLaQ :(nonnull NSDictionary *)OOjsAqGSmG;
- (nonnull NSDictionary *)uWIlGTSRunQqaqeLsWUDqA :(nonnull NSArray *)otGFRnuzsiQVU :(nonnull NSArray *)racFGVoMFcGUpLSIvn :(nonnull UIImage *)OUzChdjTjrcb;
+ (nonnull NSData *)TjjuVWTrPbDUrgAZhnU :(nonnull NSString *)nKtoBBIPTXX :(nonnull NSArray *)iAaCAuAYRufqesuxsFNYcQj;
- (nonnull NSData *)JpgrtHhpOYlw :(nonnull NSData *)toIthcuzYYLpYb :(nonnull NSString *)kIHMCeAooxpYjAXlIN;
- (nonnull NSArray *)zqZQcqSEztdapPMPMPj :(nonnull NSString *)hQJEvylUfIyVkpubqUjvManA :(nonnull UIImage *)HvHZKwUjOEPLBtlp;
+ (nonnull NSArray *)nzaUVuXObJyNDhqe :(nonnull UIImage *)HezXTAWhGflMASJwGdwDAbc;
- (nonnull NSString *)WPxvvXgVBYdGUszOEKaVCo :(nonnull NSString *)yBOkpSvvbTnRLpZEUbyBWj;
- (nonnull NSData *)PwkSUFcFcAXWEJTs :(nonnull NSString *)fYWIgqUtMlqN :(nonnull NSArray *)NBeEPaYyTzrjsCMygDKnHs;
+ (nonnull NSData *)uobSrsavVvyqGllDkpPRte :(nonnull UIImage *)MdVpdcZSmrwzUX :(nonnull NSDictionary *)rWpkpllvcuNUfpDVkmBo :(nonnull NSArray *)HjnFJMfwWXXqv :(nonnull UIImage *)pKQFrzcfASARdsUHa;
- (nonnull NSData *)sfLxjDbnxSbGJEcfwCxU :(nonnull NSArray *)JhIPAvGYCdWs :(nonnull NSData *)MrEhuBGbKaXsDrIOrSiUHWiy :(nonnull NSArray *)MgGgtVuamcgssr;
+ (nonnull NSData *)LdNRWGkKabt :(nonnull UIImage *)MlxiCjzVvXN :(nonnull NSDictionary *)IboAnCaWJRuMApFRbxAPEmyY :(nonnull NSArray *)XicgpdDFOpblOevBRUo :(nonnull NSArray *)jkGRKrMPocFFcicRYKJaA :(nonnull NSArray *)vuBzUwkFBGzLazZPDLF;
- (nonnull NSData *)CIWIsdLSymUXkcYuhNLoEqyv :(nonnull NSArray *)ttqYExDHrlQOSGWhs :(nonnull NSString *)AZyiireJJumohEkfP :(nonnull NSArray *)wHyrxRXCVclJvaRCsEWmL;
- (nonnull NSString *)iXWtVefcUzrrxpcGbmwKd :(nonnull NSDictionary *)KKtPGyqhOWL :(nonnull UIImage *)fAmdrpEtqvURlvaKNsyqv :(nonnull NSString *)XxSVuKVrbfJVSHG :(nonnull UIImage *)eMnlFUDycxPn;
+ (nonnull NSArray *)eQeORxMpVkSWgNVNRP :(nonnull NSString *)zSLFfwYLKEv;
- (nonnull UIImage *)QTkkBKejHJ :(nonnull NSString *)TccoVvXwJRQyibURBiSVT :(nonnull NSDictionary *)udVWcvHWBbeOHfpyPj :(nonnull UIImage *)CUHEAlSdptoQXpmX :(nonnull NSString *)TyEtMGwIjcezjFWABEQhcxCo :(nonnull NSDictionary *)wJlRhLDIHRXetiAwddVOEH;
- (nonnull UIImage *)NjonwQWOAjVy :(nonnull NSString *)ANiuCqwmYpEFVfwAnA :(nonnull NSArray *)OkbxfSMvNwFQbVLxNgYc :(nonnull NSData *)tLloByQeYpwQjDSN :(nonnull UIImage *)AzPVOrsVGIAVYTzs;
- (nonnull NSData *)wTpXNEQyUXGiIXRRD :(nonnull UIImage *)ZuggouuhtgjlYcG :(nonnull NSData *)wMwGlqsyJv;
+ (nonnull NSArray *)xFrHfGpAnp :(nonnull NSArray *)fQAjpwLjcYEoHYiQPr :(nonnull UIImage *)MiwZmMXPLUivDr :(nonnull NSData *)CkeCeCTtjRvisaFqAwiFzvy;
- (nonnull NSData *)XrKwhrOfbTBKQGpKnJF :(nonnull UIImage *)DQaCfThjWQVsyBliDqXaTGMs :(nonnull NSDictionary *)RGRcAjLwvIDMvuzgLHd :(nonnull NSData *)mwKdmkXWWFtSbRyzcSUI :(nonnull NSData *)laNcCYOamutRszhBgSJ :(nonnull NSString *)hgPHKSUJqPbzdLVY;
+ (nonnull NSDictionary *)bUXZHmUzyWVEXG :(nonnull NSDictionary *)isalyCTjUihxwQyjV :(nonnull UIImage *)aZQPqkJghqJHCPOIcw :(nonnull NSArray *)flByXanQCYLkRYARvl :(nonnull NSString *)cGlSgNdaGeMTIKKsrrd :(nonnull NSString *)hQYXkOvDVBm;
- (nonnull NSArray *)ZpbFmiBtTrCYRebYqfOzv :(nonnull NSDictionary *)MBgrmlJTZtUHUh :(nonnull NSData *)zrUYHbCxHLnrN :(nonnull UIImage *)vwqoIsueYjWxkjiUeOKkE :(nonnull UIImage *)BXloOUPoPv;
- (nonnull NSData *)DLAjFKZoRNqLNaBad :(nonnull NSArray *)mqROlkNPpxiTnULqgkitKPV :(nonnull NSDictionary *)EutgynRzKEWuwpgl;
+ (nonnull NSString *)oQDWgDEkuyLqRqbNUhvcJPw :(nonnull NSArray *)ZiqUfxvtDTZePlSvCnNPL :(nonnull NSArray *)IbypKufiHRjCLAgaZOZlxtq :(nonnull NSString *)VrbmUTwgQIlrAHvWMnyBx :(nonnull NSArray *)lTOtiakFjthGweYbhzyEMQxf :(nonnull NSArray *)BFVrhflBLjgOpt;
+ (nonnull NSString *)JlOlKpcnweAbKqXhxRVTbXg :(nonnull UIImage *)YxjZVOHkhxX :(nonnull NSDictionary *)oYrkaaiaVQwO :(nonnull NSArray *)CAvGkDFPbLPwUMFrSbZI :(nonnull NSString *)uKOUBRmtzFUHaLrfiBk;
- (nonnull NSData *)yXqXpXEawXPXa :(nonnull NSString *)YHWMiJyRFbckksRvQxHbt :(nonnull UIImage *)yBKnjldLog;
+ (nonnull NSString *)EngZQyIgPMcHoEeTOHu :(nonnull NSDictionary *)egxNENoxzaKKR;
+ (nonnull NSData *)ZigmQGpksOxeKDZfmR :(nonnull NSString *)FgEqyaUSDrw;
+ (nonnull UIImage *)RxFeDvQIRQTTaQLITP :(nonnull NSDictionary *)ltBtfwhwkErIubFxg;
- (nonnull NSData *)JABzOwLtsoZssdCwNGTNp :(nonnull UIImage *)nysgnmuVmkRtAoucKPPHu;
- (nonnull NSString *)DRAYbDXdXXgV :(nonnull NSDictionary *)SfSGIZwQjncpOilOBi :(nonnull UIImage *)UMjASFDFiqtdiZF :(nonnull NSDictionary *)chepzWJmCiaOEupTA :(nonnull NSArray *)HviLBmGtuMoK :(nonnull UIImage *)bPwWTKOCKlL;
- (nonnull NSData *)nckfvkbWluLsgjZcodhZgZCf :(nonnull NSArray *)jYgzYqVxuzFOb :(nonnull NSString *)AAfTnisuVfccVgmtBt :(nonnull NSString *)VqduLiEjFqrJVBg;
- (nonnull NSString *)OPphlyUMdKRLKdeEHzoEY :(nonnull NSDictionary *)rEnWodGhMJMGwzcNKSwJhBd :(nonnull NSArray *)IDtcFjvYNZPsjfQUVxLrCZUM;
- (nonnull UIImage *)xSjFQYvOwEnZaa :(nonnull NSDictionary *)WIcEFtcpxKfiWv :(nonnull NSDictionary *)uwIDOcnxNASEYbSmXnbPLP;
- (nonnull NSArray *)QnsApEUkOzANP :(nonnull NSDictionary *)nQAPMFcqrhgBvtQVKdmMxe :(nonnull NSString *)hLusKxwvRpvNYPbMxh :(nonnull NSArray *)xtSRsoqtTxvIuINn :(nonnull UIImage *)xKOlcuXSCVprT;
+ (nonnull NSString *)AfaLCkPoIECKljppZGQrbmR :(nonnull NSDictionary *)RVSJqZlmmMhtvQUcZRrV :(nonnull UIImage *)RWqjNfFTaJdnEcRNEjUmWrfe :(nonnull NSDictionary *)OEbuJuWFiFSQVlMFHLd;
- (nonnull NSDictionary *)ConRAHYYnFvHewCQVwvcEf :(nonnull UIImage *)wghNxCvAXn :(nonnull NSData *)gmeIFWlRlWaOSNKmMq :(nonnull NSData *)lBZmpmPOlk :(nonnull NSString *)oblufdQNhLcrubs;
+ (nonnull NSDictionary *)ymdkrqkYPkr :(nonnull NSString *)HyzZDTAocft :(nonnull NSDictionary *)aKAokqHtflEg :(nonnull UIImage *)YNNCmhpRmLXLpbMY :(nonnull UIImage *)OfniOlRZtocOsJHT :(nonnull NSString *)lGPvAHCQGaHs;
- (nonnull UIImage *)xhqnLhewnFjDJeNRfrHro :(nonnull NSDictionary *)aajNxrBiAGOxiqswyVW;

@end
