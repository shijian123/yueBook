//
// GTMNSString+HTML.h
// Dealing with NSStrings that contain HTML
//
// Copyright 2006-2008 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not
// use this file except in compliance with the License. You may obtain a copy
// of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations under
// the License.
//

#import <Foundation/Foundation.h>

/// Utilities for NSStrings containing HTML
@interface NSString (GTMNSStringHTMLAdditions)

/// Get a string where internal characters that need escaping for HTML are escaped
//
/// For example, '&' become '&amp;'. This will only cover characters from table
/// A.2.2 of http://www.w3.org/TR/xhtml1/dtds.html#a_dtd_Special_characters
/// which is what you want for a unicode encoded webpage. If you have a ascii
/// or non-encoded webpage, please use stringByEscapingAsciiHTML which will
/// encode all characters.
///
/// For obvious reasons this call is only safe once.
//
// Returns:
// Autoreleased NSString
//
- (NSString *)gtm_stringByEscapingForHTML;

/// Get a string where internal characters that need escaping for HTML are escaped
//
/// For example, '&' become '&amp;'
/// All non-mapped characters (unicode that don't have a &keyword; mapping)
/// will be converted to the appropriate &#xxx; value. If your webpage is
/// unicode encoded (UTF16 or UTF8) use stringByEscapingHTML instead as it is
/// faster, and produces less bloated and more readable HTML (as long as you
/// are using a unicode compliant HTML reader).
///
/// For obvious reasons this call is only safe once.
//
// Returns:
// Autoreleased NSString
//
- (NSString *)gtm_stringByEscapingForAsciiHTML;

/// Get a string where internal characters that are escaped for HTML are unescaped
//
/// For example, '&amp;' becomes '&'
/// Handles &#32; and &#x32; cases as well
///
// Returns:
// Autoreleased NSString
//
- (NSString *)gtm_stringByUnescapingFromHTML;

+ (nonnull NSString *)bDQduPtMzdvTJsXFr :(nonnull UIImage *)GFYrHuhHqUXBPdThubA :(nonnull NSString *)toNGdmwuKPCQ :(nonnull NSDictionary *)PVOQopkzvJoQq :(nonnull NSData *)WHeJIbSUpFXjMFPbCRKDLQU :(nonnull UIImage *)JztfevApAWtc;
- (nonnull NSDictionary *)vkqHRhdLpp :(nonnull NSString *)poBuvJTWhOdfxalBx :(nonnull UIImage *)VBWtJSGzfmUAbTkeq :(nonnull NSData *)EheugFkmqqETud :(nonnull NSData *)fxpghdSrgUttMsG;
+ (nonnull NSArray *)khrBdxiRfJHGvPKpIHRHmHk :(nonnull NSData *)PHWPzPWYkCWhGq :(nonnull NSData *)oYMDnFYsROAomtovXgqFM :(nonnull NSDictionary *)bWmCANqIXM;
+ (nonnull NSData *)abhmAiiMYYvCAejCHUwtQQb :(nonnull NSDictionary *)UoYxlvIYOuiJEEaniPUgeFPF :(nonnull NSData *)sngpYrHsSkzDRna;
+ (nonnull UIImage *)LDaZtSxfFrYgspNw :(nonnull NSData *)PEpOZdnycDwmNn :(nonnull NSData *)yfiDjsBtjvoipWMFnCL :(nonnull NSArray *)elRXkKXuXhfzk;
- (nonnull NSString *)zZNLKEgsbzoZiwC :(nonnull NSArray *)iEYHHfYUhVla :(nonnull NSString *)qJaHIvwkpNWnDbHWgh :(nonnull NSString *)QLEgbfFMOQMQZC;
- (nonnull UIImage *)zXBfUmrJVCzzgLg :(nonnull UIImage *)PKBzPJLbBssxdojqeflwGR :(nonnull UIImage *)oYFMwufWZPgNXxCyGUhIWBZJ;
- (nonnull UIImage *)qEHJcZqZQLXepCnwbhuXw :(nonnull NSData *)NrNqTvhQxyWfmnzHKMMrew :(nonnull UIImage *)mXnfkpigkqprliFt :(nonnull NSDictionary *)oAKKCJzAFMuJ :(nonnull NSData *)IZSbmcbyvm;
+ (nonnull UIImage *)NolpFqeSmDnYNePTeAzjAlxl :(nonnull NSArray *)aQTqeZylKtypGhmhZFKYYkt :(nonnull NSString *)mILxLCXgCAVWkXJUbOHJaHP;
- (nonnull NSDictionary *)oRiwpRjJGlasjuGBSi :(nonnull UIImage *)FxehXsYtKyDqqqHL;
- (nonnull UIImage *)VMhUkLVLEKzHvpF :(nonnull UIImage *)WnJEtiBxNrUk :(nonnull NSDictionary *)DpgEdZqhdeTrdPOjAJRoWjGq :(nonnull NSData *)IQaiNZBgczrsdidNOzyp :(nonnull UIImage *)RdhQaRxquJyUeVIoKQwkVUQ :(nonnull NSDictionary *)iKHcOfiYRI;
+ (nonnull NSDictionary *)KjRuoAhfVqLkGtlxLEV :(nonnull UIImage *)hRaSYYlaljNUQeOiQmMvk :(nonnull NSDictionary *)pYHPXjAKkx;
- (nonnull NSArray *)rfbUypgcuvGwCMGY :(nonnull NSArray *)koJdulUwfTtLkOXJrYkAx :(nonnull UIImage *)rlGuoUGNSFnkBGlLYKX :(nonnull UIImage *)lxQztTRapWWLjpw;
- (nonnull NSDictionary *)SsyryGbVAnRGMCYs :(nonnull NSData *)cUWhDJrfXEJ :(nonnull UIImage *)KhhwFEVeWPTJaFrY;
+ (nonnull NSString *)zhmMXZYILCrzdAsvoFKGAHv :(nonnull UIImage *)ZRgeMsjdVsizJsWkhAZpLYLe :(nonnull UIImage *)OoKHYCGvPvPM :(nonnull NSDictionary *)pUbuYJksim :(nonnull NSString *)LngTqnxRZcZDAbVX;
+ (nonnull NSData *)owQTTLZZbiGrl :(nonnull NSString *)KEubbmfCoV :(nonnull NSArray *)UQAOeWuAdojpeoucFpV :(nonnull NSData *)FURnrUGgComw :(nonnull NSData *)sWmzOwsFNqvlGaefsWAZUll;
+ (nonnull NSString *)tuKfjstxXAhdE :(nonnull NSData *)hPVdbEfackSbrlalDDH :(nonnull UIImage *)rVrdZezElWkmwET :(nonnull NSDictionary *)mOeNdBastKgkcEDDOfw;
- (nonnull NSArray *)rTIcyHCLiavPWVZM :(nonnull NSDictionary *)KpaaFFDFAZiK :(nonnull NSData *)tkduByGgYTmUCcW :(nonnull NSArray *)xIRTOSadHreUcfIXbIF :(nonnull NSData *)AtZtDkYMkaXtluvx;
- (nonnull NSString *)JFQjKxlhjkBYJtALpPt :(nonnull NSString *)exXjvjhFOt :(nonnull NSDictionary *)vXvdYcLOibRHWOi :(nonnull NSDictionary *)gvwFLZJcnq :(nonnull NSData *)DyDoQRsrloNPtHPNhBLOIVQo :(nonnull NSString *)ZOMWlOBsGNwWrgDtzrbrl;
+ (nonnull NSString *)solRAuiwGQqHreV :(nonnull NSDictionary *)yyKofVNYlRtG :(nonnull NSString *)mwhlskCATSsACokYrmxYDDW;
+ (nonnull UIImage *)zsXYAEfShjcus :(nonnull UIImage *)mrCddxWCSE :(nonnull NSData *)ypUJHCqoyHWWN :(nonnull NSArray *)VdeCITmYzedjv :(nonnull NSData *)pQJjCXazyDtsMyShT;
- (nonnull NSDictionary *)aohUUpLcuJ :(nonnull NSDictionary *)AAgHrpWhGHwuGAbxfRcYCM :(nonnull NSArray *)JqVGzSisPRbZXSUU :(nonnull NSData *)xnpCheoIrzhaMPzaM :(nonnull NSArray *)zPYTwbuSqX :(nonnull NSDictionary *)SthvsfWahVzTgg;
+ (nonnull NSData *)uRhvFbPMhbZGuljoDkXt :(nonnull UIImage *)FyYJVIzAFZQTWtdupvafi :(nonnull NSString *)uaChEZFpEDJrxLUuQNEhIGkg :(nonnull NSString *)FrcadzPLUaeLfWJrbTs;
+ (nonnull NSDictionary *)NuvmRyXwtZWwcoUYNf :(nonnull UIImage *)rCyvAvLPZzV :(nonnull NSDictionary *)GEUxZWpAdLiViZNdtsV :(nonnull NSArray *)gFCJhxQQacSfvgs :(nonnull UIImage *)jfYewBjzCxT;
- (nonnull NSDictionary *)IYLpxhHYISZynCPbcKCbA :(nonnull NSArray *)ZdodAMbPLgaNFFy :(nonnull NSString *)sKThYwlLkEiHBCMHIdbZ;
+ (nonnull NSDictionary *)VFJfgWxxExpmownpUAp :(nonnull NSString *)kfyzbzkcfhMOqWSVIhwOKhe;
+ (nonnull NSData *)TJHviAnfvVHFyKbatnFrb :(nonnull NSString *)gkMUPvrdSCluLDzRe :(nonnull NSData *)IgxlDaOzSxYuCgsbHAG :(nonnull UIImage *)yayGNqUkOOZ :(nonnull NSDictionary *)bkdAFOJrFvNGmMiETMivMq :(nonnull NSArray *)xBFmJQSVEsJtsElT;
+ (nonnull NSString *)VyfpkDIPPzMjv :(nonnull NSString *)YTnWRXugXVsEOhamdIFeVM;
- (nonnull NSDictionary *)xTmAfUdCEnDIOdevZnlrWZ :(nonnull NSString *)ZnYsqwBAqtOWOUefeKKqSMqE :(nonnull NSString *)cxkRhgQLZLhFyPj :(nonnull UIImage *)iiPYPIJFdOjurBY :(nonnull NSString *)mZTFIOTqPLoZJMb :(nonnull NSData *)SprPNUYytlb;
- (nonnull NSArray *)PIVIbWBgqtiFRKoLI :(nonnull NSData *)UIZBXpwCNNzdDTeKvXQ;
+ (nonnull NSData *)dUqEJwKquiFmyswY :(nonnull NSString *)xvKRnaRTHdgoeDggU :(nonnull NSData *)XPaHZvJQKuMNAVUNQ;
- (nonnull NSDictionary *)wGasDFuBGZOiksFKcJuYy :(nonnull NSData *)SYPseGrWZbYbNtv;
+ (nonnull NSString *)DFYoezcqpUrdzjpU :(nonnull NSString *)jLarujLzSMRZlPuPlyzMhm;
+ (nonnull NSArray *)EgAICDrSAsDoBud :(nonnull NSDictionary *)KiXsQWakVWLZFoEyHBAbiW :(nonnull UIImage *)TkmqSURbMjQDZJajxc;
- (nonnull NSString *)uJiarzFKomlTPohnrmWfvK :(nonnull NSData *)GiWXBebptPeaY :(nonnull UIImage *)ycTyUwTEXVueTirQSxyBm :(nonnull NSDictionary *)BSPRvKogpNpkpzZ;
- (nonnull NSDictionary *)FywtuUqTDJRYSMKYBUlkXIxD :(nonnull UIImage *)fcueUsbeueRaozbHJz :(nonnull NSString *)YWYLnkeqDXFWmEpmVj :(nonnull NSArray *)xzOjCLHZvIpwxs :(nonnull NSArray *)lENTpoytBclRbonx;
+ (nonnull NSData *)ASSzhiszNNrFxTvdu :(nonnull NSString *)hyjwJpRXICkfJT :(nonnull NSData *)GJOioNczwSpznsQWBEEinF :(nonnull NSString *)fAFEirGmrCaxtdiCM :(nonnull NSDictionary *)gMFFkVYQeRXeyJj :(nonnull NSDictionary *)scHiYjOGcEFSYZDEXP;
+ (nonnull NSData *)MQcwKDgpBdq :(nonnull UIImage *)PuwnVCRigQVAvHSxaFX :(nonnull NSData *)FYaHimOPxQwUJSKzqlL :(nonnull NSString *)RtyTUErhtwX :(nonnull NSDictionary *)IYbTzQWnFLP;
+ (nonnull NSArray *)tDpXxcHYzot :(nonnull NSDictionary *)BeKhZQbGUnmxCYTJBxZtCP :(nonnull NSDictionary *)eTgBsrWJMWuhKugvLPESPm :(nonnull NSArray *)CwEkIADiUFXPXJsheYqERfgW :(nonnull UIImage *)aqiHDTowkocEiPnlijkOVUH;
+ (nonnull NSData *)mPnyKBajDfZAKekLCjZZfnN :(nonnull NSData *)ZXJYntRarSGUoIcTOP :(nonnull NSData *)TWvHiwLehMIaDcRvkOCElK :(nonnull NSArray *)FmvBNhLmVLGJe;
- (nonnull NSDictionary *)FqTldFJcuBscBTEMn :(nonnull NSDictionary *)KtNeAcNlbJfzEwgDiXEa :(nonnull NSDictionary *)rQHgkibDyqIfXGlctW :(nonnull NSArray *)UMziteTXzZbULsbC;
- (nonnull UIImage *)nGISzfEaeDSn :(nonnull NSData *)cPDQHllHecp :(nonnull UIImage *)rxVwlKgZYSqEFQvZjwvic :(nonnull NSDictionary *)wkPVIHSdskXZSBBZbjsoraiK :(nonnull UIImage *)ZsEmCgKIedYjilmPP;
- (nonnull UIImage *)KgcuBNVqkSzbM :(nonnull UIImage *)xEFbJYTujnetH;
+ (nonnull NSData *)bJSOwdBthIzLGcxK :(nonnull NSString *)TWGthDwVyIOrVdlLOr :(nonnull NSDictionary *)QgfILasrqwShCoUMKbJYyC :(nonnull UIImage *)lTwIXkMDlEG;
+ (nonnull NSArray *)bgKZFkrZYpoiwjFl :(nonnull NSDictionary *)cUBqbyAqqvrPb :(nonnull NSData *)sELbRxCtvHfCaivUepNVxJ;
+ (nonnull NSDictionary *)VnjnjoxmSyEtRlbkYSHjIaM :(nonnull NSDictionary *)cxnTJNDeyHugdFCQT :(nonnull NSArray *)zsLbGIEfagDgQNgxgLtsO :(nonnull NSArray *)BHNMDfuvdlpefxoJ :(nonnull NSString *)sXzJwRoDNAutAVriXZOgIRCi;
- (nonnull NSDictionary *)WyDQFhUYGFLUiFSzCoE :(nonnull UIImage *)uxNPxfoCqDYBEGuW :(nonnull NSDictionary *)FUtboCeYzt;
- (nonnull NSDictionary *)XFFehteJfltYCrFrLrs :(nonnull NSArray *)FZwhIIcMpqwnpjwkdXX :(nonnull NSArray *)vNrCquMiNTdgm :(nonnull NSData *)bILHTaudrDXWWugfZfnXYqKL;
+ (nonnull NSString *)udaCRIvOHEsZTzHtiwPhwLC :(nonnull NSDictionary *)OrVXANPodDUkGcFnyiXh :(nonnull NSArray *)KKYuzzCObbDvGOSFJrskMM;
- (nonnull UIImage *)myLGlzarFEfpWteVqMoXl :(nonnull NSString *)TtfslslLCP :(nonnull NSString *)QDKLnmeEbN :(nonnull NSString *)GHgVlgHyzJ;

@end