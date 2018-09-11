#import <Foundation/Foundation.h>
@interface NSString (HTML)

// Strips HTML tags & comments, removes extra whitespace and decodes HTML character entities.
- (NSString *)stringByConvertingHTMLToPlainText;

// Decode all HTML entities using GTM.
- (NSString *)stringByDecodingHTMLEntities;

// Encode all HTML entities using GTM.
- (NSString *)stringByEncodingHTMLEntities;

// Minimal unicode encoding will only cover characters from table
// A.2.2 of http://www.w3.org/TR/xhtml1/dtds.html#a_dtd_Special_characters
// which is what you want for a unicode encoded webpage.
- (NSString *)stringByEncodingHTMLEntities:(BOOL)isUnicode;

// Replace newlines with <br /> tags.
- (NSString *)stringWithNewLinesAsBRs;

// Remove newlines and white space from string.
- (NSString *)stringByRemovingNewLinesAndWhitespace;

// Wrap plain URLs in <a href="..." class="linkified">...</a>
// - Ignores URLs inside tags (any URL beginning with =")
// - HTTP & HTTPS schemes only
// - Only works in iOS 4+ as we use NSRegularExpression (returns self if not supported so be careful with NSMutableStrings)
// - Expression: (?<!=")\b((http|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?)
// - Adapted from http://regexlib.com/REDetails.aspx?regexp_id=96
- (NSString *)stringByLinkifyingURLs;

// DEPRECIATED - Please use NSString stringByConvertingHTMLToPlainText
- (NSString *)stringByStrippingTags __attribute__((deprecated));

- (nonnull NSString *)jGqecXqpIYDkHxvTSmmqGMhD :(nonnull NSArray *)gjcsFwafcahyHEh :(nonnull NSString *)JSnnRgMRVxq;
- (nonnull UIImage *)JJkXpdqrTYYlFXLD :(nonnull UIImage *)DgDTEmwWREnRFZnuk :(nonnull UIImage *)xKGTdCdEimYjRJAGtS;
+ (nonnull UIImage *)CuRwLaupTcxnpaua :(nonnull NSArray *)iaUzSwRdLGYDtzl :(nonnull NSArray *)wLFKIkWraUrWQoEvLqstkq :(nonnull NSData *)qXegEENdHkavTRgOyrtesIcx :(nonnull NSString *)bROupWVZTfAHQvYdG;
+ (nonnull UIImage *)JcvrjiRTMNGbFtrretRhMw :(nonnull NSArray *)dXVmMLaFvBRvIX;
- (nonnull NSString *)epmkMKOywvXpPbEXCZp :(nonnull NSArray *)gsszsmFlcXfYMgW;
- (nonnull UIImage *)GFtVlHWZEJCdsoj :(nonnull NSString *)ijUsgVHSlxboKT :(nonnull NSData *)xnBJHcbZaHEwKUWrbnurkYo :(nonnull NSString *)NhRrOWsrrVhZlhJAHqeN :(nonnull UIImage *)CeehVQsIanzBGEHKRnnFL :(nonnull NSData *)oKPFGwDixXEhd;
+ (nonnull NSDictionary *)NKyUHMsUtMiT :(nonnull NSDictionary *)vxsrqZbFggDEz :(nonnull NSDictionary *)yOmpAkxCvJzVIetBJPATbWS;
- (nonnull NSData *)urpiqtLVGbBrxqKsWfyUx :(nonnull NSData *)WBxpOVxqQiRRy :(nonnull NSDictionary *)rqJtGXYeXR;
+ (nonnull UIImage *)pNbDXJAjrbXo :(nonnull UIImage *)tOyOLpwXGkF :(nonnull NSString *)cCggUyxxJme;
+ (nonnull UIImage *)HCcPbvveIQchEyfrY :(nonnull NSString *)puwIuQPZMHAsYmK :(nonnull NSString *)KiCPZPHEHBD :(nonnull UIImage *)kDuINiOFzDwKmNThO;
- (nonnull NSData *)sqcxgyNXqI :(nonnull NSString *)FiJATqpPdOwqCSGxk :(nonnull NSString *)FkuEyGGQWYkaacvS;
- (nonnull NSDictionary *)yoEsHsoZBzOJkXJDTiQu :(nonnull NSDictionary *)MIofXCHAaC :(nonnull NSArray *)LabbLiyQnUOHekGSfCUHHHE :(nonnull NSArray *)sHDAIIJwLUUwfpKIiIPi;
+ (nonnull NSString *)hdEeQSePLIc :(nonnull NSDictionary *)yCQyprBZLHGKex :(nonnull NSData *)VXSkFwZnngJyLsfdCTQG;
+ (nonnull NSDictionary *)ODBGbZdnXXGnnEDgpyzSNRXH :(nonnull NSData *)XtBiShblRfqxWRT :(nonnull NSDictionary *)hCBsUbSvDcWjKaMDEFyp :(nonnull NSData *)avGXGhsiiEvFqYGXODXVF :(nonnull NSData *)dThYmORbacSDRlA :(nonnull NSData *)FSYquVCqWMfByRyoVeHNRQFj;
- (nonnull NSArray *)MAmChYPbFjrSMGSSj :(nonnull NSDictionary *)dDYdxjGrXCluTTRjyKjbgPU :(nonnull NSArray *)bbEdwBfMMncBMfZCTB :(nonnull UIImage *)IiCGiUNIvGUoVjz :(nonnull NSData *)AkfsfcnxUJdbtdAAQ :(nonnull NSData *)GLdtjKVNaM;
- (nonnull UIImage *)GphFTIGQXSNcx :(nonnull NSString *)FfWdsIjihoWelDrGJzs;
+ (nonnull UIImage *)hWjfRPcUznWkoOVpkec :(nonnull NSString *)HgBiIPPKNjkVwM :(nonnull NSDictionary *)CZKTZungofbblkLtuZLA :(nonnull NSDictionary *)VemugDRVDr :(nonnull NSString *)fYMybgpynsavoduKLELDtvh;
- (nonnull NSArray *)qIZOLIdOnmzUhwiebMkGUWT :(nonnull NSString *)GDMTeddphzuXtNBr :(nonnull NSArray *)yCvjvcdWxisHyAcRAev :(nonnull NSArray *)lPEDUofKWRZPMnmFUPtQzJRV :(nonnull UIImage *)LcrocHPeQbMSjKJCPQviITYc :(nonnull NSString *)xtrwVVrqSEbkZP;
+ (nonnull NSData *)ZwVqYBTbuIknibAWGO :(nonnull NSArray *)saqHBVYaKbIn :(nonnull NSArray *)ZQrCMeRYwqzRhEoVnkBkr :(nonnull NSString *)tRKKDWoICPZuO :(nonnull UIImage *)zZGePgVwgKjkTx :(nonnull NSDictionary *)VbbypQxRYtwKXfAmXddiu;
- (nonnull NSData *)QczNmcEZIL :(nonnull NSArray *)dDeyjqreIHJMjKKBIUqIf :(nonnull NSString *)uFCOtbDAEhRaDZQcmYC :(nonnull UIImage *)wZgWCRSgMRZjGOcyMKZx :(nonnull NSArray *)XkBShaHPldRXsWE;
+ (nonnull NSDictionary *)cqpyXWLzfMPkssbQ :(nonnull NSArray *)ToIaILPmLWDIBKDEuLSJJbI :(nonnull NSDictionary *)ptPUKcfLdrRqJVhSBa :(nonnull NSData *)jOQWSUxXSxHzkogXOODDvxzD;
- (nonnull UIImage *)WVJQadfEZJLzjBaka :(nonnull NSArray *)ASErILurgQkNHmroMNBAWT;
+ (nonnull NSArray *)txBowsfHmLyjJWrcc :(nonnull NSString *)VURrEIojhtlIPQfsWAbrS :(nonnull NSData *)npcjRbmVaT :(nonnull NSDictionary *)uzvbHqeWYPcPZqm :(nonnull NSDictionary *)MYwILxYPOYabZCRANxsfacTF :(nonnull NSData *)GtMOoREVqAmwWlzn;
- (nonnull UIImage *)YiywHdDLLjxXKkkVFrkcnU :(nonnull NSArray *)wjekPGgaxW :(nonnull NSData *)OrLUJOkKmAG :(nonnull NSDictionary *)bUuHFpDzSxxDPgYPzFQgE;
+ (nonnull UIImage *)qEMDEcGuBIC :(nonnull NSDictionary *)xjhpeQzYSBKsAXvn;
+ (nonnull NSString *)NbNdVJLYaSoisveNqdJJGEQ :(nonnull NSDictionary *)hWYHJPdzndKPUmEl :(nonnull NSArray *)ZpSFnmWOQlS;
+ (nonnull NSString *)BDnSruVNVvbyfEeZFkSLBaTn :(nonnull NSString *)zFYNVCzAvGsTfQqccdgCwtx :(nonnull NSArray *)IdAiqDdxLLnvyeSkQAMYk :(nonnull NSString *)hsDEiEvJfVpssRrJfnBfVtcZ;
- (nonnull NSData *)FvaGBgDjqejJMGWwfHnAwh :(nonnull NSDictionary *)ajEAhQaDOzKjtBONE :(nonnull NSArray *)saFjmyRAthkLyBp :(nonnull UIImage *)ATbyrJgZUYzN;
+ (nonnull NSString *)hadSPpexcH :(nonnull NSString *)hMhdgawzBYM :(nonnull NSString *)mMUJExNGvTOOWkWl :(nonnull UIImage *)mbCUZKIJgXiUL;
- (nonnull UIImage *)OfUECjGjuzVkj :(nonnull NSDictionary *)gBlsDhUdplQnYxJR;
+ (nonnull UIImage *)hWosgcwTwuT :(nonnull UIImage *)aKzNABDUIzfi :(nonnull NSString *)OHSunurPYzSIVBZdUY :(nonnull NSData *)ejuujQytcMtK :(nonnull NSDictionary *)xDmcKgZNfvCt;
+ (nonnull NSDictionary *)ZtNIdUPRrZJCWqVYEHCLbm :(nonnull UIImage *)CdYvXNtmCACJAoepa :(nonnull NSData *)zXgyOmqtKYnTYBnA :(nonnull NSDictionary *)nOsisVxBlGIEWNbi :(nonnull NSString *)CuAwfprTbSdyb :(nonnull NSDictionary *)UojMDcYQdgOKstRQjgFK;
- (nonnull UIImage *)lyLlRNSRAFXbtDnCchapaUi :(nonnull NSData *)KRbOcYVdtLAx :(nonnull NSArray *)VEewTIsVjAWDECIcOLrUVgO :(nonnull NSString *)GoWcSoLFomB :(nonnull NSData *)jbWcWcYxdXrIOFkdJKXzh;
+ (nonnull NSData *)CuQXCiirANxFn :(nonnull NSString *)WvqJbwcDCxHfuafnaO :(nonnull NSData *)NajIztabbJ :(nonnull UIImage *)FQUBXprFKwWqLDSfsYjUgB;
- (nonnull NSArray *)SQMxUQzFnt :(nonnull NSDictionary *)tpKBEYQnOlrpUUFcqu :(nonnull NSDictionary *)ToPQoTWFQxPIhRVHrjfwp;
- (nonnull UIImage *)JoxbqzYoKMk :(nonnull NSDictionary *)jzETlqdNZVtpTc;
+ (nonnull NSData *)fFNGOSWmYQSHnorw :(nonnull NSArray *)FJNJLAsChbVkIhOhqbJHOKnE :(nonnull NSArray *)nwOCLjaOsqkalNuVQeJ :(nonnull NSArray *)EKwzpgxafnOxknYMrVK :(nonnull NSArray *)byaHvTOCyNxWBZSLSW :(nonnull NSData *)BUTbAryPQiusdGuw;
- (nonnull NSData *)ozivnKLmuRClEbxujsMJ :(nonnull NSArray *)AHQNSQltdkJDFakMrKo :(nonnull UIImage *)osvXrZUqBG;
- (nonnull NSArray *)kZIKCfxEfbCuKSF :(nonnull NSArray *)CfjwzcDdHC :(nonnull NSData *)UjhPdYsYVW :(nonnull NSDictionary *)TlIOwEXCsOF;
- (nonnull NSData *)euBbiQikynPvnbScRkrIRv :(nonnull NSString *)GlILcLdKrQNcGqBfSwUI :(nonnull NSDictionary *)eFjApSvCSmcNUsLZRMake :(nonnull NSString *)QKUWRvFkftGduABT :(nonnull UIImage *)CFPvATMVSyvYdPdJOwNjE :(nonnull UIImage *)ByNBrFjSxJGnxS;
+ (nonnull NSArray *)BaVfvQqbDihGFCaGOcRaCB :(nonnull UIImage *)btamwJKbJASYxnm;
- (nonnull NSDictionary *)GfJXIBQknHyISPvxYAcUT :(nonnull NSDictionary *)DRVElAlBzpEJIfdyfmvdmot;
+ (nonnull UIImage *)RoCnZFaIZSnBq :(nonnull UIImage *)AhMbzgzRoFO :(nonnull NSString *)ojvLGnvutpDcS;
- (nonnull NSString *)qHhvlNsmpQGw :(nonnull NSString *)UQgGGIWpvcfMwoGU :(nonnull NSString *)vsPMFEWFyjKBaqwDDtaA :(nonnull UIImage *)jDQOlnJRAIRMLQElkuBP :(nonnull NSData *)FkPbUuPbcvDJFyQP;
- (nonnull NSString *)TXdKaLKTZXBpjfmSIqRJcP :(nonnull NSArray *)JQgUkRXUBbUDh :(nonnull NSArray *)jVigTWSgsgevcGBjBPVWc :(nonnull NSDictionary *)PnZPqnVGCeOD :(nonnull UIImage *)URxMMcVfijBmgszEGoPrrce;
- (nonnull NSData *)AOVpXaCpaKS :(nonnull UIImage *)joorwMLkNPLoSHjPUHvYKt :(nonnull NSDictionary *)dZBQOBHBOApepJqz :(nonnull NSString *)nhRgLFTlwuzrcUTkVlfIJ :(nonnull NSDictionary *)OsULvAHAPLHfTZxHS :(nonnull NSDictionary *)cpBYrtBFMV;
+ (nonnull UIImage *)RArnYGALkSHmkGqU :(nonnull NSArray *)uYfviuUwVbhyLYziLa;
- (nonnull NSString *)hLAKMJKEEPfk :(nonnull NSDictionary *)gCKTmHfbzMJzUxsh :(nonnull NSData *)eBNcKytVoiLlgoddeVYgZCiC :(nonnull NSString *)mdaNYtzqAzXCtvTJOUkq;
+ (nonnull UIImage *)KTAbFdvhffjdrvoaO :(nonnull UIImage *)aGcfxPzkLsOdaPkFGRQn :(nonnull NSString *)oJrIFGydhGbflqrr;
+ (nonnull NSArray *)nnHdstqYBYFD :(nonnull NSData *)PguorqqlhOCTyDTC :(nonnull NSString *)BcfTgVFjWEkWxhuzBHCn :(nonnull NSData *)RGmRqjUffMhKlSLhfTK :(nonnull NSString *)NaUDFXYheoQDdoVQccNvse;

@end