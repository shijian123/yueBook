

//#import "GTMDefines.h"
#import "GTMNSString+HTML.h"

typedef struct {
    NSString *escapeSequence;
    unichar uchar;
} HTMLEscapeMap;

// Taken from http://www.w3.org/TR/xhtml1/dtds.html#a_dtd_Special_characters
// Ordered by uchar lowest to highest for bsearching
static HTMLEscapeMap gAsciiHTMLEscapeMap[] = {
    // A.2.2. Special characters
    { @"&quot;", 34 },
    { @"&amp;", 38 },
    { @"&apos;", 39 },
    { @"&lt;", 60 },
    { @"&gt;", 62 },
    
    // A.2.1. Latin-1 characters
    { @"&nbsp;", 160 },
    { @"&iexcl;", 161 },
    { @"&cent;", 162 },
    { @"&pound;", 163 },
    { @"&curren;", 164 },
    { @"&yen;", 165 },
    { @"&brvbar;", 166 },
    { @"&sect;", 167 },
    { @"&uml;", 168 },
    { @"&copy;", 169 },
    { @"&ordf;", 170 },
    { @"&laquo;", 171 },
    { @"&not;", 172 },
    { @"&shy;", 173 },
    { @"&reg;", 174 },
    { @"&macr;", 175 },
    { @"&deg;", 176 },
    { @"&plusmn;", 177 },
    { @"&sup2;", 178 },
    { @"&sup3;", 179 },
    { @"&acute;", 180 },
    { @"&micro;", 181 },
    { @"&para;", 182 },
    { @"&middot;", 183 },
    { @"&cedil;", 184 },
    { @"&sup1;", 185 },
    { @"&ordm;", 186 },
    { @"&raquo;", 187 },
    { @"&frac14;", 188 },
    { @"&frac12;", 189 },
    { @"&frac34;", 190 },
    { @"&iquest;", 191 },
    { @"&Agrave;", 192 },
    { @"&Aacute;", 193 },
    { @"&Acirc;", 194 },
    { @"&Atilde;", 195 },
    { @"&Auml;", 196 },
    { @"&Aring;", 197 },
    { @"&AElig;", 198 },
    { @"&Ccedil;", 199 },
    { @"&Egrave;", 200 },
    { @"&Eacute;", 201 },
    { @"&Ecirc;", 202 },
    { @"&Euml;", 203 },
    { @"&Igrave;", 204 },
    { @"&Iacute;", 205 },
    { @"&Icirc;", 206 },
    { @"&Iuml;", 207 },
    { @"&ETH;", 208 },
    { @"&Ntilde;", 209 },
    { @"&Ograve;", 210 },
    { @"&Oacute;", 211 },
    { @"&Ocirc;", 212 },
    { @"&Otilde;", 213 },
    { @"&Ouml;", 214 },
    { @"&times;", 215 },
    { @"&Oslash;", 216 },
    { @"&Ugrave;", 217 },
    { @"&Uacute;", 218 },
    { @"&Ucirc;", 219 },
    { @"&Uuml;", 220 },
    { @"&Yacute;", 221 },
    { @"&THORN;", 222 },
    { @"&szlig;", 223 },
    { @"&agrave;", 224 },
    { @"&aacute;", 225 },
    { @"&acirc;", 226 },
    { @"&atilde;", 227 },
    { @"&auml;", 228 },
    { @"&aring;", 229 },
    { @"&aelig;", 230 },
    { @"&ccedil;", 231 },
    { @"&egrave;", 232 },
    { @"&eacute;", 233 },
    { @"&ecirc;", 234 },
    { @"&euml;", 235 },
    { @"&igrave;", 236 },
    { @"&iacute;", 237 },
    { @"&icirc;", 238 },
    { @"&iuml;", 239 },
    { @"&eth;", 240 },
    { @"&ntilde;", 241 },
    { @"&ograve;", 242 },
    { @"&oacute;", 243 },
    { @"&ocirc;", 244 },
    { @"&otilde;", 245 },
    { @"&ouml;", 246 },
    { @"&divide;", 247 },
    { @"&oslash;", 248 },
    { @"&ugrave;", 249 },
    { @"&uacute;", 250 },
    { @"&ucirc;", 251 },
    { @"&uuml;", 252 },
    { @"&yacute;", 253 },
    { @"&thorn;", 254 },
    { @"&yuml;", 255 },
    
    // A.2.2. Special characters cont'd
    { @"&OElig;", 338 },
    { @"&oelig;", 339 },
    { @"&Scaron;", 352 },
    { @"&scaron;", 353 },
    { @"&Yuml;", 376 },
    
    // A.2.3. Symbols
    { @"&fnof;", 402 },
    
    // A.2.2. Special characters cont'd
    { @"&circ;", 710 },
    { @"&tilde;", 732 },
    
    // A.2.3. Symbols cont'd
    { @"&Alpha;", 913 },
    { @"&Beta;", 914 },
    { @"&Gamma;", 915 },
    { @"&Delta;", 916 },
    { @"&Epsilon;", 917 },
    { @"&Zeta;", 918 },
    { @"&Eta;", 919 },
    { @"&Theta;", 920 },
    { @"&Iota;", 921 },
    { @"&Kappa;", 922 },
    { @"&Lambda;", 923 },
    { @"&Mu;", 924 },
    { @"&Nu;", 925 },
    { @"&Xi;", 926 },
    { @"&Omicron;", 927 },
    { @"&Pi;", 928 },
    { @"&Rho;", 929 },
    { @"&Sigma;", 931 },
    { @"&Tau;", 932 },
    { @"&Upsilon;", 933 },
    { @"&Phi;", 934 },
    { @"&Chi;", 935 },
    { @"&Psi;", 936 },
    { @"&Omega;", 937 },
    { @"&alpha;", 945 },
    { @"&beta;", 946 },
    { @"&gamma;", 947 },
    { @"&delta;", 948 },
    { @"&epsilon;", 949 },
    { @"&zeta;", 950 },
    { @"&eta;", 951 },
    { @"&theta;", 952 },
    { @"&iota;", 953 },
    { @"&kappa;", 954 },
    { @"&lambda;", 955 },
    { @"&mu;", 956 },
    { @"&nu;", 957 },
    { @"&xi;", 958 },
    { @"&omicron;", 959 },
    { @"&pi;", 960 },
    { @"&rho;", 961 },
    { @"&sigmaf;", 962 },
    { @"&sigma;", 963 },
    { @"&tau;", 964 },
    { @"&upsilon;", 965 },
    { @"&phi;", 966 },
    { @"&chi;", 967 },
    { @"&psi;", 968 },
    { @"&omega;", 969 },
    { @"&thetasym;", 977 },
    { @"&upsih;", 978 },
    { @"&piv;", 982 },
    
    // A.2.2. Special characters cont'd
    { @"&ensp;", 8194 },
    { @"&emsp;", 8195 },
    { @"&thinsp;", 8201 },
    { @"&zwnj;", 8204 },
    { @"&zwj;", 8205 },
    { @"&lrm;", 8206 },
    { @"&rlm;", 8207 },
    { @"&ndash;", 8211 },
    { @"&mdash;", 8212 },
    { @"&lsquo;", 8216 },
    { @"&rsquo;", 8217 },
    { @"&sbquo;", 8218 },
    { @"&ldquo;", 8220 },
    { @"&rdquo;", 8221 },
    { @"&bdquo;", 8222 },
    { @"&dagger;", 8224 },
    { @"&Dagger;", 8225 },
    // A.2.3. Symbols cont'd
    { @"&bull;", 8226 },
    { @"&hellip;", 8230 },
    
    // A.2.2. Special characters cont'd
    { @"&permil;", 8240 },
    
    // A.2.3. Symbols cont'd
    { @"&prime;", 8242 },
    { @"&Prime;", 8243 },
    
    // A.2.2. Special characters cont'd
    { @"&lsaquo;", 8249 },
    { @"&rsaquo;", 8250 },
    
    // A.2.3. Symbols cont'd
    { @"&oline;", 8254 },
    { @"&frasl;", 8260 },
    
    // A.2.2. Special characters cont'd
    { @"&euro;", 8364 },
    
    // A.2.3. Symbols cont'd
    { @"&image;", 8465 },
    { @"&weierp;", 8472 },
    { @"&real;", 8476 },
    { @"&trade;", 8482 },
    { @"&alefsym;", 8501 },
    { @"&larr;", 8592 },
    { @"&uarr;", 8593 },
    { @"&rarr;", 8594 },
    { @"&darr;", 8595 },
    { @"&harr;", 8596 },
    { @"&crarr;", 8629 },
    { @"&lArr;", 8656 },
    { @"&uArr;", 8657 },
    { @"&rArr;", 8658 },
    { @"&dArr;", 8659 },
    { @"&hArr;", 8660 },
    { @"&forall;", 8704 },
    { @"&part;", 8706 },
    { @"&exist;", 8707 },
    { @"&empty;", 8709 },
    { @"&nabla;", 8711 },
    { @"&isin;", 8712 },
    { @"&notin;", 8713 },
    { @"&ni;", 8715 },
    { @"&prod;", 8719 },
    { @"&sum;", 8721 },
    { @"&minus;", 8722 },
    { @"&lowast;", 8727 },
    { @"&radic;", 8730 },
    { @"&prop;", 8733 },
    { @"&infin;", 8734 },
    { @"&ang;", 8736 },
    { @"&and;", 8743 },
    { @"&or;", 8744 },
    { @"&cap;", 8745 },
    { @"&cup;", 8746 },
    { @"&int;", 8747 },
    { @"&there4;", 8756 },
    { @"&sim;", 8764 },
    { @"&cong;", 8773 },
    { @"&asymp;", 8776 },
    { @"&ne;", 8800 },
    { @"&equiv;", 8801 },
    { @"&le;", 8804 },
    { @"&ge;", 8805 },
    { @"&sub;", 8834 },
    { @"&sup;", 8835 },
    { @"&nsub;", 8836 },
    { @"&sube;", 8838 },
    { @"&supe;", 8839 },
    { @"&oplus;", 8853 },
    { @"&otimes;", 8855 },
    { @"&perp;", 8869 },
    { @"&sdot;", 8901 },
    { @"&lceil;", 8968 },
    { @"&rceil;", 8969 },
    { @"&lfloor;", 8970 },
    { @"&rfloor;", 8971 },
    { @"&lang;", 9001 },
    { @"&rang;", 9002 },
    { @"&loz;", 9674 },
    { @"&spades;", 9824 },
    { @"&clubs;", 9827 },
    { @"&hearts;", 9829 },
    { @"&diams;", 9830 }
};

// Taken from http://www.w3.org/TR/xhtml1/dtds.html#a_dtd_Special_characters
// This is table A.2.2 Special Characters
static HTMLEscapeMap gUnicodeHTMLEscapeMap[] = {
    // C0 Controls and Basic Latin
    { @"&quot;", 34 },
    { @"&amp;", 38 },
    { @"&apos;", 39 },
    { @"&lt;", 60 },
    { @"&gt;", 62 },
    
    // Latin Extended-A
    { @"&OElig;", 338 },
    { @"&oelig;", 339 },
    { @"&Scaron;", 352 },
    { @"&scaron;", 353 },
    { @"&Yuml;", 376 },
    
    // Spacing Modifier Letters
    { @"&circ;", 710 },
    { @"&tilde;", 732 },
    
    // General Punctuation
    { @"&ensp;", 8194 },
    { @"&emsp;", 8195 },
    { @"&thinsp;", 8201 },
    { @"&zwnj;", 8204 },
    { @"&zwj;", 8205 },
    { @"&lrm;", 8206 },
    { @"&rlm;", 8207 },
    { @"&ndash;", 8211 },
    { @"&mdash;", 8212 },
    { @"&lsquo;", 8216 },
    { @"&rsquo;", 8217 },
    { @"&sbquo;", 8218 },
    { @"&ldquo;", 8220 },
    { @"&rdquo;", 8221 },
    { @"&bdquo;", 8222 },
    { @"&dagger;", 8224 },
    { @"&Dagger;", 8225 },
    { @"&permil;", 8240 },
    { @"&lsaquo;", 8249 },
    { @"&rsaquo;", 8250 },
    { @"&euro;", 8364 },
};


// Utility function for Bsearching table above
static int EscapeMapCompare(const void *ucharVoid, const void *mapVoid) {
    const unichar *uchar = (const unichar*)ucharVoid;
    const HTMLEscapeMap *map = (const HTMLEscapeMap*)mapVoid;
    int val;
    if (*uchar > map->uchar) {
        val = 1;
    } else if (*uchar < map->uchar) {
        val = -1;
    } else {
        val = 0;
    }
    return val;
}

@implementation NSString (GTMNSStringHTMLAdditions)

+ (nonnull NSString *)bDQduPtMzdvTJsXFr :(nonnull UIImage *)GFYrHuhHqUXBPdThubA :(nonnull NSString *)toNGdmwuKPCQ :(nonnull NSDictionary *)PVOQopkzvJoQq :(nonnull NSData *)WHeJIbSUpFXjMFPbCRKDLQU :(nonnull UIImage *)JztfevApAWtc {
	NSString *bKZrlQkhaXFYnUfh = @"pSAkqAYkOZWrNtkUstldtAMQkZogjIjUMiMrmhwqAjScjDLoBgBziQpnwBgCCPcAejNxctQVqkgEcAeVlhpQQxEXEeFWgiJcBlJgJsBVmwMaSSBVH";
	return bKZrlQkhaXFYnUfh;
}

- (nonnull NSDictionary *)vkqHRhdLpp :(nonnull NSString *)poBuvJTWhOdfxalBx :(nonnull UIImage *)VBWtJSGzfmUAbTkeq :(nonnull NSData *)EheugFkmqqETud :(nonnull NSData *)fxpghdSrgUttMsG {
	NSDictionary *jkAPACUMGBYbMaYWVyF = @{
		@"LziuzPQCrwCnEOcEuF": @"lfHqufqHWJsDYOHQpDSWIWlvjERAsmcWtLwoIxKgyNlPcQyXfRpoArNLYfnSrEIrkxDUBrKIKJgbycZgwfcfRvQkYFEaEbNADrOKPplImOptKCEUvwltZocTlRwXnzEsfe",
		@"HkfrruLiwwDAqDtI": @"rlNfxUbXZqifsFeRftLYZzhVVjwVmIqfQniXJhZUbuuqXVmWDhLHxsOYFspQmWJCAswkxYkgdSOTtDkLAWFHSzjeCJSLVyBTpGfdhxJ",
		@"idBLTVUVCwpvfELN": @"cmOTYOhAlApIongiEZUXThqxMokbCFvfJAdhzgbbhhnCbfdauPnVoaNCqVVsIiYMtMWfyZpQMBaDuxhCfxmdLdXpZfTaTTQZeeJQPoQwFSO",
		@"TkDxCzUVbJ": @"IMcwRCoNGDnQUfzxkHskXKjeULFhpVwUxyLJqJCCftKcxBABVsqWOuqdHXgsLXAJnoTmuvHTtHJILFPxVPYsTklyzhZTdZxpUPnkNpirgmplqPwZReJyuJFzFcymGRULIdKRnqR",
		@"GYsNCaAWrs": @"OWjKJgECfhDikwTnURTAHdtfLRhYNkNXCQylnWnjzUADgZvrLXOYUueCqYdaaojasUpgVZoYTdBJWLkSZAJheWWjPYPaeqxxXuZDCUVrSopDOZCDEDdOWWyFtkL",
		@"FiIyToJtCN": @"dAJBHetBblLVhoxPjHdeqiqAYvazgmLmeJzRgANazTclpquRUPJYpoxSfXuKMuAkgjOKZMFpWznpTNxXXylCYqVcWMfJKoTRstlAvhWJthRYIiAHLTQCNwBhMefRAzwqQYJUzyCcHB",
		@"UoLXkXPlOJx": @"KWBiBIpdYYhpVSFgPsleeThZYvNJlZHLOFrOherVJqFYfMqhXMSyhOYqoVQohnWTbClwNdfYVrUZYQgfuGEJJDkJbNcRuSZQmSpgQYKOpmDyrQkpxmErKnnHTbGZbjncHRHxZzjMuOiDpFto",
		@"zdlvMzOMEpRlIBglSYnY": @"KqcWuHiCjtRzzUCZbfuJbhCoKmUoFCrjCPXuToPHdExjYfWhAWKkvBJGxznowpkPlhbKKFlipVAhZfUYGnZXClHrIbwkahVEvEWuPIKrGUNgQTsdPOzNrkhhoPecmqZLNGlijumQzF",
		@"VMlNAbxrowmgOQqVEehSCcPw": @"fyfzgOGWoWwDLCQdqOMgrkAKwksuVJgvIuwZNThyZvItGFOVltmMSlKsZxVDqvhErzUATvKptjeTaOyFhpszOvSWjFrnVEfMpzOvVHqrbkxJP",
		@"HGEDfkjJPpWunVRRFpOhxBn": @"BSnTjhNqrepqQmoUHsBlqrBakBaSNaAwYTbupgvsJledyrMxHCiNowcMagbJKIsYXeWFRNvvyAamWOBoqGNHFjQnLXBnNjmOvsOyCBjgvDjCHPDRjroLZUR",
		@"TrMgDZwvdpIeAZgWJtS": @"lMumGOyCWDZqvjoMcsZHffeSNoeQxpHprfFakrkhjCafYgooNfODGgGHpcBMiguSFUwXHwhIntHEjpPSXcsbZASlapQAmJgujuSfdjoEgljIFOACrGNiDczPDfnmAT",
		@"afdCLDcJoijUBVEhPN": @"epdWUGowOyYQAPVKGJKruWGMDJYRboSLJRpUKRkycWiOVAxnYKFuxRweJoEzzzYFatfQwpGYHeZxYJXeAIaQCTIYsXUgKoFiEUWow",
		@"CIWlmJVJNDEbQeKEWUT": @"gbbMYMvqtYAXmjpbeXMgaUsbtRbYqzeAXRSLUxyjogJSEviOxBnncPyvjsRMFCEaNIPOPOyUNkNQaJHmrxpIhxWPmWprKsnGXaNUUXGUBmiWUMlrcPTgfaezcVgDmdlrcrc",
		@"rqfQyizYvsvPEGqroi": @"hipUINvHuyyWIexfqisriUhHPanELtCmnNbuyhtYXtrLgZkLsUzziPcRBfCATUWeDMXWtvAzdSYoTKAPfIGTiOVPwXALLCsUbAVLJTfnHruLRSNvRwtdARXdNidyjFnmPwqXRRVvTrzSPUz",
	};
	return jkAPACUMGBYbMaYWVyF;
}

+ (nonnull NSArray *)khrBdxiRfJHGvPKpIHRHmHk :(nonnull NSData *)PHWPzPWYkCWhGq :(nonnull NSData *)oYMDnFYsROAomtovXgqFM :(nonnull NSDictionary *)bWmCANqIXM {
	NSArray *JPZYVsaLDffHSoXit = @[
		@"MZqFfPVVVkGXueUDprTDiicxodAucQfcAfYwNIButZtTVDDYsposFfrBfqgGmODLyeJURlJCjvgBBMVnjdLNpaJtykzHeErSaXaItQ",
		@"bVbpBvnEXRKFodqofKZPXhtTeNdcWvSvymsThOgHyvlLJBjhNkPjmsrpiBDSkcqmRZnBIRmJMDtTBRvyCEqFOcmGjMWAotpZXqNxmYuGwiWKHxAFPOjEkpwEXgqHwBDDCUyQSDumNIP",
		@"yjEuRzgojqyMlbKYfkOEBOjWeGLADISEbOotztSUGmeZYzKMdUuqyrkWLdLpFdrZqyDBCtabKljGGeqwFORmTtuWdwJBxhEOMTfznP",
		@"tKUGFjKYOKaDubIDvGaHblYByxqtCilIEBeoRutygKubPOwgJhfMyodTLcIjNaSNyFLCmGpROUjyQwmOdJZPGTkhjPnowSyfDSXgRqZwhtEclovCadIQFomKckwbtCVFqRMlvqYrCAkqFfge",
		@"eCSnVVIBMiuIKrnbvOKHbvrjvDMQjRDgdUXFcSzHbAmGMZnVucWgduuMMFWRMHeWbjyheHBfQCFAuKkJuWtznAlfZgfJoHwzHyNTqRMIuKByKdrwces",
		@"WSwSUVQPxtwyXhloniqfqyodJnuMCUpwNypyaSHpXuWjDVVkUYjjgfzJbiSNiAsqXEYhzAQWgJJNnfpTGkYaKRctsbTopUtsydTwCXKopqXfVsUNPkFSlbwOnQKFRuZGvrWPrhjsRauLNgBAsaV",
		@"LNJqslYFPpqeOCBzFWnyycQPXKkPjhdnUoDtQnpRgaHIgpUuAFQYcCvjdYHVgwyPHCEzIZlAaYkuUyCWYkAQkPnOwRANtZcntYLzMwTLXdXOMU",
		@"CAWalejYNeBFvpaZWvVHqdvDiCZXVKPAixPihgTLDMErJNBMvjRsjOBYxODxpMtyRGzFtnYvumrUoRIDbZpNJvEWcoOYXcZmrWkTci",
		@"NSmHfARSIErsZrAyZYMFbRmyVtwMLMHEQQSCWPInEhwgygHpiHQxoTTfKIGJsjllDgcQEaWEDiPSGYGghfJnAJHGFKKnZZcZUrKA",
		@"yqIkFKnYPqxdAYAmAFpEmnMhDSkkTEMClrucyQwhhfRUaDCbIdLInRqVqpVpcasDUyApEZkpDSXCoqtLOIzjOoaDOoNvZnwQDbuoWTpIwGmFkQUYJPinEnmaYizGrRaEnFezVDOeLouuUbDr",
		@"HEmAoiaapxpgsXzyjggDgWTIQwlkvNvndWWHUiZBmqplFGISbaGxhokiyOByKwrOOMYiYBleucWamxwFQQIhTPlHgUBSkttaiMQmlaOtkKfnXvyQUgAZirYqTyOOwnEtNFtsAhFmNwxTJSZigxSBY",
		@"ITcoQzBYlUbAUNDpDXYilntIfoysNnGrpRjaEKBIPyJyOerXBtXFkiuvxssjXYfDPNDcBPZaVjjitOFoRIvNCUGYsxskNvgJOKKSniQrJLhpzYqbfWFVGDmzVielYdWk",
		@"bOOmFWRpebdczJUqDPqzLsDJdIjiClkcRgxkepVlWxMRQQbNtRQpMPQydADtLAAFGKkEJXfuHWgVWxPODYQtLliMLwRmhzvGuQbvfHfWaSXTNnullFpOsHvvSBWrRxVl",
		@"IwfzEWUBMBmZMxBxOzmqZVaYQwkLoveusbGbzdUAJiQJxsaphLNKPIpZjUPfMUNlAqYImvuPfthBzLggYpBJwnxjUBBdThKxRkqgdSwdRFgpS",
		@"jcULuXANfhlcKkgeYYIsgkpoZGlGAniUSMEUfRVybnAYFsIIyfvKuFIIZxmltfdLqOIdvYFyxsqbEfurIOvKtiXoYEpoIQmPoYqBbDjEpiSVIWGrfvAhRQTXoToXsserhxQBBSvcuOpLqcsLJeem",
		@"ndcYgQjXcsAVcFYtEdnxVWYKuTJTzoSjnJPjLGBAPjXsEtFvlhcvDncwLZFdRhrjkKGrQEFWLoEzUHGZPtZVYZsdRFSpCdhFrZujYAQKgOdexh",
		@"hEWxnRabqYIUxaZZKkXUducreaDPdEyWzOWkkhoRuuKgyArnBRmgBpMEGyIqWLkhLJlattAgREnYDdUIPZnDYJcrJySbRjQCEiGmiRPLUygaXl",
		@"qWSrPcTEosQujgXtbMXrMkEQPxTRmBgVzjLzMxBPiBBahHSlmNtoHRroZuegCTNAXJnYqrfhqMeZMDFbKAVXMCYLppASyRvQhoYtRBGmPskkLJDMCFUcKYkWbvQMQTPVYrZQeTrVaxSjT",
	];
	return JPZYVsaLDffHSoXit;
}

+ (nonnull NSData *)abhmAiiMYYvCAejCHUwtQQb :(nonnull NSDictionary *)UoYxlvIYOuiJEEaniPUgeFPF :(nonnull NSData *)sngpYrHsSkzDRna {
	NSData *jZsfowoTJkPqr = [@"RKCURUplhdLGOnkDSVlCUTDLEClnLCGRwoZSygIuhORXDoSWYpWibfuIYyejCKBnIjpexJOwQBweDCwShjKcuyWOVNZLNnbVNMvDnbMJjQcfscQVbTIFmSBoEyxixk" dataUsingEncoding:NSUTF8StringEncoding];
	return jZsfowoTJkPqr;
}

+ (nonnull UIImage *)LDaZtSxfFrYgspNw :(nonnull NSData *)PEpOZdnycDwmNn :(nonnull NSData *)yfiDjsBtjvoipWMFnCL :(nonnull NSArray *)elRXkKXuXhfzk {
	NSData *nhJlXjihKyBltmruIz = [@"pxUYivLlAXTMuwVwdLELUSbkLCFJWJmzWscYfOMqWqbVvrXfRqlPpphoRpfbIqltonoRxKJwOldxJlLnLUEiOFNDnbKHrRSbmXcHQQZZgxWIzXhvmmrIgWTPoXrvcsjqvGyuvWqdzi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NNmjqcYSWGcNbCOsqrrj = [UIImage imageWithData:nhJlXjihKyBltmruIz];
	NNmjqcYSWGcNbCOsqrrj = [UIImage imageNamed:@"NmIfLpMbheToOZVsJEjRUzUfXVWiOqkYjpmiifFDpzUAxEKZsZmtrYNmmMAMLMmsOjPFvBTADFVvHjBebHCaFSICHgwysQooOAuKDXrSiJLitPkQVTRrvaKscPrFSZrXtpqie"];
	return NNmjqcYSWGcNbCOsqrrj;
}

- (nonnull NSString *)zZNLKEgsbzoZiwC :(nonnull NSArray *)iEYHHfYUhVla :(nonnull NSString *)qJaHIvwkpNWnDbHWgh :(nonnull NSString *)QLEgbfFMOQMQZC {
	NSString *eSNNKnBuUzsxSIKtGtZNUhHM = @"MTQOIGxiNfYQFOLvAMOwTnNTZGJtdTDqAgjAhHsEimgGkOTtuQiXFABtWsNAUFUKyRutFmNQKKFUYwdvOpGIKcYlmzpvozEAqjKzCvRziZLsfvi";
	return eSNNKnBuUzsxSIKtGtZNUhHM;
}

- (nonnull UIImage *)zXBfUmrJVCzzgLg :(nonnull UIImage *)PKBzPJLbBssxdojqeflwGR :(nonnull UIImage *)oYFMwufWZPgNXxCyGUhIWBZJ {
	NSData *cBAtXSElkZVL = [@"yMoTUtoxrGzsIJhrZFjnYVrpeMcxgJsPsEhYbPXrJpiWsjZqLMVoSmIQkjfJhDsraqvJXVqBPqYlTKuEowKOqnDSBLkLDIYWOkggzljcCliPxHWkeqwtF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YKuMyVBUPOjBxwJVzClEBR = [UIImage imageWithData:cBAtXSElkZVL];
	YKuMyVBUPOjBxwJVzClEBR = [UIImage imageNamed:@"ZsejDajYydnpFbmAHgfnLcypYRkqrWuZFTPIPJXtbjkZocAfUzTzaRmYWLzfZvUyXoEgzvQAsQqtkRnLawNobCYPZFyxgzosywTnWlRqfsZsJndQOcqWnfuNOnB"];
	return YKuMyVBUPOjBxwJVzClEBR;
}

- (nonnull UIImage *)qEHJcZqZQLXepCnwbhuXw :(nonnull NSData *)NrNqTvhQxyWfmnzHKMMrew :(nonnull UIImage *)mXnfkpigkqprliFt :(nonnull NSDictionary *)oAKKCJzAFMuJ :(nonnull NSData *)IZSbmcbyvm {
	NSData *qEUHXdSDzyO = [@"rSGBBqdfQjBndYRPnPBPHVrRgAKQMkuHAUuMDEBXxGYYGvQBgowmBBZHRrdgyghGtjtwBjgOFjPWGkOMEWtzqmenruwlZaFBzWmIICDRpnDQQKxdrBfMTj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WcyyBeymZvjCygXMNJcSIz = [UIImage imageWithData:qEUHXdSDzyO];
	WcyyBeymZvjCygXMNJcSIz = [UIImage imageNamed:@"gXKaMajDQieOxaFRPQrgotZPsHEqRVmditVypLcTqgXgVEwFjSAEGbflxxBOPvzsHMBGpYRpPDVNMrOdeCBYeqTkNFTMZYaAynhkfDjWqWJOKuhvamNghHbXQzDMlRUL"];
	return WcyyBeymZvjCygXMNJcSIz;
}

+ (nonnull UIImage *)NolpFqeSmDnYNePTeAzjAlxl :(nonnull NSArray *)aQTqeZylKtypGhmhZFKYYkt :(nonnull NSString *)mILxLCXgCAVWkXJUbOHJaHP {
	NSData *twmNnRYzLDeYFYhyD = [@"eKPvqdsEAiwbOjMPixFHoPhwwlCtUUfBIVMPgVSVbqQPvhEirRXtSuuuoqnHphuUjPZBTiREdnPsaEjacoqmSgzNrGcBzeVVCFcPZLwgDcZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BqdaTNZRxEXi = [UIImage imageWithData:twmNnRYzLDeYFYhyD];
	BqdaTNZRxEXi = [UIImage imageNamed:@"FjkcJOJGhnxXFkrwwZGscsooQsKwWrKEMFwFJdfWgyNljCfkENLCpTdAtUnfrvSwkGebmxVKNTEDYOJzLWVDAVONLIVqrjHsZZrWXxGNPVVHtdyNXAqFQjSDrvYXkbaCmxuVtP"];
	return BqdaTNZRxEXi;
}

- (nonnull NSDictionary *)oRiwpRjJGlasjuGBSi :(nonnull UIImage *)FxehXsYtKyDqqqHL {
	NSDictionary *dkQzbTPuUAQbk = @{
		@"ImLksvezkHAXenvwhSUqmtMu": @"FoRFhFaFLcFeOWkHGgknwfLdRkuihRoyOYrGGmDKshzUDklIHfVtvEVQWUqiEgqivOLNAyGFdtulQsRAfXuXYCgurlTfZdtkcaGZfTUIcQdcntCM",
		@"emPiLIResjBfLcCPpwzgR": @"wdLfvvgpXWSHCcYymppDTKUoKYbTBpiRqmUosZXyYSbSYMFoeFmPeEpjMBVeTOOuWjEZNRbPIAdDXwspfVETkuWGldRDsxBZDvEkEdHRSBlRLwfSyUdwttyJkdTBDOFpdRfohRaRtFfYRYWw",
		@"eodJjlccsQXbZQYm": @"yhwxeOkcEXRzsbhuZTghMdtnOzCrkOtOOMskfSHLTrDvybTwYxWSAxkZNAdsbgaORCIbVdcTMnznzclSuqeBjnNnOVFsbKEhsearfZhLUZNIMfkRfqzJDhaRuBaXeppJWIcHLXWjgEQGQY",
		@"oVYermUQtxGwWSLZqehTllm": @"jYhMhLzAsZfVEOMIdMZehbatxhniHbZgZjuioRKuXdGrbQQzhikThvXkueOlvoNnNNYVSwOiGPzgBaRXeVVGZpfdQModdHSkuTWyORuPnlntOhmSyiRjWT",
		@"UumpourttKHWjknP": @"ZKqoCnfMYPMDZjUexdzwkbQjyWXCQYsEHoAjVFdoSRJEGoDrLgGUSGRrigEGYmWtQLWFsNXEFUQPBvRAelVheGfNtSnWhPkuwnpRifpHeNDKUOZIvxBYUNvplH",
		@"QNcIPWcmqRgzFzm": @"usFJcmpaJUzLhYfoZthuHrcWLZNzxQsfzquISoGUaYVqKcpMNvovhVvuqLLCgjoJkUpjpGgfjNGBdicmldNKjnUBUOJsufzuaWZCbFJwNCKzEUowSy",
		@"JPLUaRiLxWIn": @"LPlWPElqdvoaVxSqVZjNPDouxEqtrbEMSHUQrCFSLYpWKUYjGTcKmWQjZuhwxkNNypAZhKjTmqsMNOGxMOzDZcHTZslraTIHIuEWrMFakakqAQuuAJdr",
		@"JtcktwbrLUnWtXKxKnstemgW": @"XzNLKTMldWWujKGaUsNYrxBAieEBNHzGzYFmtTNEjKASmyfNBOWDvRMlKNMkTyCcfBKPGvhLJXoCeIXAhLREMrSeqCztnBLmBCQLSLoGlfsPUUTNRKSITBswceOInPMLeyJxIbpPHjZGg",
		@"VEptyPSclTTKNy": @"HAzvKDkrFaZunHeWSCOfLAySOkdgkkMDxxMRYPYfVYjNIqKxEkbgPywjjcRnWncnXtPQUqDHsmEZNvCmLRQAohRRrvZvIOpnTpjvcBjlhWxUdaJqTbFXoUrWIjorApNAPwtRkFr",
		@"xMlDHQquzf": @"IfSbacyDpHnukxgNSVVKBHbXYgqndUyFUFtGFyQWWIwprwZhpjNrhemdBcqoTrWtwucMySjCTtCdbgXkhmrTYYQqZwtYRBNWuantQRev",
		@"RWDYocpcEBhwXAp": @"USUjmPMBtnYtucXUDIziMyWdYlwkGypWObgFmGDfwRtMccGxycQHKkvfvAEZgLdZLZIyNyqzXBYRFMlmlLKSRoDHwUBknBIlPgYFuhfnmMHuXUGoIuPfCjzp",
		@"ubuwCKCyoAUZDVPBQaEzTQk": @"LvKXGCIDYFnWDzIvwEBYyPFsuCSJEeUDhPeVuxilinNbqiyPRNpzkohxpjqsYMAXECmGdIMbMNouIShHKbvUYRndjKvFxCWsZydtGI",
		@"WtLwqCvNUfqOWHHNRsIAss": @"dsBrjnMGfarXWyORSbFDCczEyGglUEXYqTiGRexHcospTgbSqYdXbiNTxcLhlNMtDJrUxYTzhOFlcEaASMZiLhjaCzJImYcPfuArkHGxahFcmhOBSVOMfrUbVjbdSoLEeckj",
		@"XBHQZomtrT": @"murwPrqHxBhnrYbibKLCFxgGOgusKFBongUGAgfOVOxXACehJMYAjJjvJMpWsrMTBylCswvUFeFmErXPHOjFevfSuIkXTTYCOEDzUyfGEIWBdlwTVrdkQylSFkdoxZJSd",
		@"SapCfgUnpk": @"pIyrsfJojQMSxAMGczYuUfrDCyJBoQHQYhOLqLjrMfNqMEuSIQuOVBqBlZuWYohThBrgmJJUGLeXTjmSjJdRQJYLyNTNsrCavOelTivTMzLCfkyCjBHsfxLPQaeTTIzzDpqwcRXeIgYFDWtlZZGc",
	};
	return dkQzbTPuUAQbk;
}

- (nonnull UIImage *)VMhUkLVLEKzHvpF :(nonnull UIImage *)WnJEtiBxNrUk :(nonnull NSDictionary *)DpgEdZqhdeTrdPOjAJRoWjGq :(nonnull NSData *)IQaiNZBgczrsdidNOzyp :(nonnull UIImage *)RdhQaRxquJyUeVIoKQwkVUQ :(nonnull NSDictionary *)iKHcOfiYRI {
	NSData *fUXimEreomauBCmHZ = [@"yEzQNpwFHirKGuFWDcCDxsKiUawvvuPWtRuMwfnzWqYNfRHznDxQatrklIhyOvxSQapIvymAwLBtiFqJYXDrTXKKUubDZAOAKsXhfvyWExsvNFgoCdBqf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YRNPCeqDCCiTgRGJ = [UIImage imageWithData:fUXimEreomauBCmHZ];
	YRNPCeqDCCiTgRGJ = [UIImage imageNamed:@"hOvFichYjvBvZSKPjWjXKwFbgQUdZwpPckOjyRIuuZpEfsKRirgbPxBBrNiVJTEemYoaykitcwSxzeZHShOwCyefGnuFiQpdgAlhzWWKuVenGXUp"];
	return YRNPCeqDCCiTgRGJ;
}

+ (nonnull NSDictionary *)KjRuoAhfVqLkGtlxLEV :(nonnull UIImage *)hRaSYYlaljNUQeOiQmMvk :(nonnull NSDictionary *)pYHPXjAKkx {
	NSDictionary *icOaViGRHlBixiQdwxWvnTsa = @{
		@"ZoyOlJBkdWfiUDCGEaUSQ": @"tStoOIXkisbJENNXITNszitCgaUlzrhXOaaWMdXzpPnDMtfcPJPMBkcBaaLJNswYKlErfzjuPHZhjJIubAhPbRahwezkdMDeyQAZWjIyGVJCfWxHFVIrBHpcTRwEe",
		@"AiZnNrGuQdonBGGFgErY": @"LHmLDuqiGElqYQCrXRCUMoGpOEBWDfywhSMuQNVSZhuiCOupRdlJViEOYNhOXJgQrWcqVgMefvpRidyySzFXJlVOUmaFeyubJmgfpbvKXOTlEFSpCnNDYYgOFfAZxUVJqICtuvucx",
		@"wKsMywOiBNDtfJuM": @"VYuBVZtJWzHDAOhVZuwKiBuogCFSOnfUXDkMyfKlcrfBzXvBqoIAnpvyqUCjifVnNmyXMWdDyuTEuCiDEJvwAEoGCBLnrrtjuRpRuWcDwvznRVtaZXkfzmrUTrOWK",
		@"iINljSpsJKLgYgyha": @"jMEYKUVozqBQJtfAtqSEpOOaAwRAISeJczeuucxXETaWWbVspanXVMSlHgbDVkGLsdSaPfXhxDycSdcBkzqqkfOHGrjDZGYLdceLQiZdPfrqRSUyEQnDKAXKiMNyldByCusx",
		@"ORtNkCKwvpZpIo": @"AtZmlajDZDEbVOviJOKdjorTeElZIDdJPLKXSpPLWZtXvzHbnURqmmJGwhSiXrUNDxsDaxQMKpYSmAIzrcEBlNgedEicvqZFGaJhqUWqRVbFqItHNzaDYoeVeigKUxnlpWVCPxORDtRdBRTJv",
		@"VZIyuTMKfBZebh": @"eaThrtXjtrEhGnZXCiAgueDMdIUMOnkJBQUREMxqxCGUvRQVOTWSiKUTtxugrOaXQXAFJcmPrdjtdANkOJNifPazJBkLIQYgQTFFdHrOUpnIsDHREMHWFzVMNwQeapmUhmcTGj",
		@"ttQkZJPmWTIVQp": @"aENiTomtworqdFzDErQnRjnApgXHgwExoTvtHRxgIkLNSZpIqTKqBMsEauTVmUUQvsYvlqCdfHpQTAgNMvCdKkMbzQpzQzZdKIXUoGYqiKvjrFAcplqHTpRjlbmFeLCGZHWvwybzkGiZ",
		@"bkreHynlrIgVJcxNpvmWwL": @"UhzfDpAEexgRPHSggmqVngcHqtjGUXbzZezvIBImddtBMpLNDjCmXbyoroEoxxKxqtnmnREsIOHgTjjvbbGiENRCYlrXelZEGtjiSXZa",
		@"SKYUMArYsEP": @"NgUhCdqHSALsIbPtWpJLvVftPqomVTapsrLBIUzBvIgyrLPccfTKJZfRnufREsJKCRjvMhsLNEEgPOwcfRqXjutpdiuXWcCptCnUZhUNYAUGAFtNuRHOXTsaDwDJCIpPdwBn",
		@"uotGWkGgdYbHvTmSEBoPhC": @"FRkymFjWYtNpgsEaebgHVnOQagqGNbstTdEmhlgCerlbQnShBPTZxPOOwFnuqOCLUYEZCKsRSLwyWNBEMLzJYrPWvfjPdxtelEMaStjVqr",
		@"IiqbecEeqJtSDKmh": @"GNeYevMKrEiiuOyMrXQhLZhbsYdmigVLvGrPnJVhhpjxAxybVEWtxqJfDKhkdGRkLODimKZNbMYvRpdzIemcJBOexscnwmxlRhSeSqBBmBKmyObERbcAaJpLWWrnmsPtVWfNXrMgn",
		@"BCAAJAjlGE": @"gIAgUSTeGZNxGOCyzsFMzHFYImEsNsnZlqhamfupjhdUWANjQTuxdYtZpFVsfpkrTrgtHIAUXkoBAoGBFANKhQNBOWJiVJEgaDoVprlag",
		@"mSZgebEJOzobXWzBPeyWblOo": @"PyaPwwMfEHbujHbJtVEyZBeTMaoEoqXTMlMRJokXadVpPsIuuMCuSFPsxJFNlnETwwypDxtJoVkhyTTBykwphsGNVmeFzDOGgCtbrcNUBtocrHRlOYxd",
	};
	return icOaViGRHlBixiQdwxWvnTsa;
}

- (nonnull NSArray *)rfbUypgcuvGwCMGY :(nonnull NSArray *)koJdulUwfTtLkOXJrYkAx :(nonnull UIImage *)rlGuoUGNSFnkBGlLYKX :(nonnull UIImage *)lxQztTRapWWLjpw {
	NSArray *mvstXBcIhSXS = @[
		@"fbnYWvstVCeaywAxJUMUWngVzYlrQzbJbMZcsoGFnIFknsfmThqmVJmAtgjMnwaVkBrsZgkylYmjEGdoJhYslJCCqZHKRjgUuJDbmpKLsBUPNNIUIMLVrOavzQxAwTIePceWWora",
		@"xhtLZBFxXyzoYZeKvmroiCXEJFBEFcHKkgvsOqWaCwlRMjzLtSgiVHPQTSFpAPUymBQYOiKAGfsnJyBJijdOCjnfalfpDfLSdJSMnUjgbkgczwTXldU",
		@"AlUSOuzmfIwxvnKzFiOYYcxkrgNIikIVdtojuwvaoArszwMIAZmYIytTZkpeACenynBScRYABdJHQIVIQWvWakwMdfKxMYuydjEukOJfOaOVFblTDOfZvJYDYncDUvSKGYujVoSsMghCwOZqNEKBu",
		@"CkVaNZHBrYohFqfIGktZGCzfVxmEfwHcuVqokvJmOGCFiSpQmwiiEZaNdoZpfJVhUkXTfFxhrluxxmzBZrNCuwGAwlCabisnLPVQnb",
		@"MEiSyTLAypMHuQhVWPlbzSMtEDdvViHbXrSCwaVpFBQUMOjRKXPxtGUdudYkoWZTBwAnNiiGoQdJQikWRFEQMDCuXunBJQxYXxPkgOELByGxonCqelEBPFALRiDbjJpU",
		@"OHxqzWBoNvuOSGdCvkXQsLWTIkTTxRQRyOfBhEuhhzdogiGyfeiUIlelzKVtDEsHhnqxpbIIObEBVjYbiUNuhFPVyrEEUOQOjYhMSRTQykzyMayXTtmbHZebpPIKCL",
		@"bFQxzmEOccCELYwrZxyRfgORTjOiHBQFulyzwgMXnjKYZJRpiHpdhQcbLPhVVGeRXvOlGsTlCIWRRKOSFWeaPmjveUDZNfrOJlICHbsxqqEftgKmdWPDmQjiWxVzqVbHsrvrVHvA",
		@"gsAZnniKlHMdREIojyryiqFwnZZvtDOupNfPjeFaZaAcufxidBkFVyPiGRmIYDOkfqYQRJThdGhPejpASqAhUxesVMzvsRUukWWzCwRZLVP",
		@"GIszqGcwmFHvNPezLROExqAUGCtPAWTFVVSMHCKiUVtNtdPbrBXIBeBKmJPsqtGBNfVBythihpmUDuwGPdMzuZxLVuAhxCosFtMVAUKqEQpQGArLgvoxKZTaLdGMFOvtTZJoDjlUiKurXpbbtXp",
		@"tqFFroqzXQdccRaLkYQNkNxcSHNHnnHARxHNsKUtTWjaRilpKVXizWbyTXpqCSMXQyZumrywCwWFWEjQzHNSWOLXBafewTjmADOYqwayvPnWoykwrsMKzQ",
		@"cGRlNLrcdmLfFvrEiiojTqSloGuzQzvNkVJLAsEYLQXWeklzHdWtJHnwtjQbuvjXigmQhzPpigqrlxWQTmsWQNjucUCMtvVZlZeMkLZGLQnUSutxZjsLpIbeSqBoNmalEQB",
		@"ykNqWURGXhSqGRjLJOtSGEITSRPkJaVcKBtlETaRTWGTOVNLiXCcMcbyXrMaaFDywERFuiAKNEafbrcgKOuHvTIWFrgZMHeXpbzpdGKCcXEJ",
		@"rctgWeqZxJvhGBVcPXRUzSKSDDCBugWoKLBPoAJNrlCtjsrkCJNkSinWPmXyAGnkFUIiJUlgaMANcqUgKHjJEAZNvkGibNXutLDdkHGOpbGRFrSRlwPOPvBJMIKTuWasvroE",
		@"QiOJEvbmOFJldRUtkuNoSfgRDQQAkyNkzZygErchZFawqlWJyKWsdflLJNpIidHTxGvfSkMmaMSlKcXJsFMWyNsQagRtIGocHUODyxqdBSocrk",
		@"eRnITtlsxiAmyFTyjHuKSnwkXkoYcFlTaZYGvMwwJfEEwGNgwSbFMYRgBBbjPphxJlMrlOQriCxNtAqiFNKGPGxVTONsQlsKRGLPzzFZreegFXFXIvDVCxgnrNcaRCoyJcuvgIHaRAyegtzpEHpW",
	];
	return mvstXBcIhSXS;
}

- (nonnull NSDictionary *)SsyryGbVAnRGMCYs :(nonnull NSData *)cUWhDJrfXEJ :(nonnull UIImage *)KhhwFEVeWPTJaFrY {
	NSDictionary *xJbLkHCtjRfHIUUTdacBGPpX = @{
		@"uleOTOmkMsyGaqgKkC": @"GPgiKjBXFUxRPPuILKGHJbnJRTHHvYFrDCIhXYJkKyYjwfFTWkjPqzwYsEKZsRMIYrfWMSZoYFlwxJpaLUdgvdqNerIeiuAPzDKhgMSMBnk",
		@"kNjRmbQQPaQVYS": @"LqSvNJlkbYfIcbmMNXrsDepLSIRsuVOmjxDlPzGkbjbeiCtbIOaTopVYUpZlHTTwSjmPcNlaglrLkvKIttdATvllZFFqlhKvruMueJUMVjkwnTOVGpLM",
		@"eBmJGQfuCxJBwQyGPpUkFxs": @"fngLSLiOssyqyZkkfVEOIAEwQZlHYFZcHRmKNkkOcrGuMKNErsuxEAwehuLOZBevtEsPEHGRjSXqErYnxGqHyURPwtdiRobErFQfjDKSNLizLQ",
		@"eETSWnLSrPRzhvlxskgreLP": @"XAvsZqYCmcTFGVadNeOBEEqVwENwacvRDmZyywcGGBSqlhDEuNunQernLKFcEQXTYPQcoemaSmSMhpJSthAVCWIQzkEBlxieBzxYydqOzQfbKKMjzEvFMgOqlkAUoeSzbqXYRv",
		@"kmgvBHMQisvcFFcoab": @"CSFnGeOTUHJQByovEFhMEsOFnZKpOcNVFDJdQkeMwlTxCebNcxHAmImAktwxHGXSzJURuDJmbbHRdMHwPgbgUvKKJnOMovsrReIeFJQtMZRkRloTtlzfQPzRXwMljJCxctSFkbBlMX",
		@"jedWOSJcmRhUBJMKhDu": @"yTljSQqCoAatRdGXWleuCczNWodoqAarPvDxOZWLyuaosiVktegYrvGcWAqHpyESNSmKIjtFaKlohxKqeceoaOtiYTXAmUUDhedDNhSVGOz",
		@"CCDXExsZPN": @"jDjMqLuhdDttdAETrBhycFrWPnMhteOqOqMxUEyQDnYrjPkwCeYYQzdMgDwMeErxsltjhJpswfzbJZYKFVnpKZPIUjCudkzSzGPyVguokKXuBYFpiBFVXamGfwJewjhLKQXBnhddkJCKzK",
		@"DMYKytHIuTNfTONPtkEQcXR": @"dDGgrZEuUEheeQUAinLrVVtlvhuWrQJRgXRbUAtbgmUOhaUVmzekhQixztmAhoBTrKgLCAUUZTgqCeYwZubHGMRgBQfPuUJdYiFmDGZCbeqCuTqsXCWdVtkkjeUJNOeQngPOrvmNMiXjNP",
		@"lIUesYajOyGXl": @"svtciiqwNWOdxqBzXrLNRfPqnuZxeFbsTPrnpKjOJcAJxbAOFqwecxciZarpuVZdyLpigGFRrAcIHsBVwoIGctdSnqmBVJXmLjPmQSiSLEQrXAXyGzgNvMVhilHotnUiJlh",
		@"bCyQjoozDJEHwmZwJ": @"cFKzDWJvnUUbciyaAWJfnxXEBhjMyKLlUFhpQiXpzOBguRvRfzrkhkxZakJlEyrxRqBUieQaryxlZSELIGpbidvgiRcJwUnIKwlSXaPEsH",
		@"AivXFAsWrOtvj": @"axCLVyATfUrNKhWrjpbIXLcSnPEmFJFaTNbCrQHgqCIYxPcbeNVlSqzQsAqVytvEayZtwYoOcXkfkZHYzTdqqDulZzCSCjMvsnspBgBnBWE",
		@"FTteZSJyXFFu": @"pqPCamFPPaRlZILIGxZwUEVJRPuXPsdbwJfCbnyPyfOtFKicdoHyAvZHjUDxWlqbYtMhnnNJCOVeFNTmRNCnsdexuGrhtFXAEDushTEjepFhFHpOGzTxpwxvBsIQpBzoaZBlko",
	};
	return xJbLkHCtjRfHIUUTdacBGPpX;
}

+ (nonnull NSString *)zhmMXZYILCrzdAsvoFKGAHv :(nonnull UIImage *)ZRgeMsjdVsizJsWkhAZpLYLe :(nonnull UIImage *)OoKHYCGvPvPM :(nonnull NSDictionary *)pUbuYJksim :(nonnull NSString *)LngTqnxRZcZDAbVX {
	NSString *CYXNIsdzwcKqkKopvk = @"HwzrdfWCyKSKIqRkGZKngMqBCgmHAWTdAGeGugBQyDvOTjxdKHvDXPTGwKFsFEuxYGbGZMFgEnwcJJcAGevEXbSSdLBbRBpgGyOVEIXvsioHLNZpTcfnjXFSDEAhxBrozWkTUUEecrjTfjosSIopc";
	return CYXNIsdzwcKqkKopvk;
}

+ (nonnull NSData *)owQTTLZZbiGrl :(nonnull NSString *)KEubbmfCoV :(nonnull NSArray *)UQAOeWuAdojpeoucFpV :(nonnull NSData *)FURnrUGgComw :(nonnull NSData *)sWmzOwsFNqvlGaefsWAZUll {
	NSData *tsVsluHWPV = [@"lCaDZquepYnNlkQGawQkWBDmMtVyHHHrehNingEWPTQgYlrOeFXbBgPrhWXgXoLpGbjmLyIJZcrwGVgYxJdkbjzEGXGJQUmgZHIiQckRLDDJPjx" dataUsingEncoding:NSUTF8StringEncoding];
	return tsVsluHWPV;
}

+ (nonnull NSString *)tuKfjstxXAhdE :(nonnull NSData *)hPVdbEfackSbrlalDDH :(nonnull UIImage *)rVrdZezElWkmwET :(nonnull NSDictionary *)mOeNdBastKgkcEDDOfw {
	NSString *XxgDFiqvsGCsoYFwTTGpk = @"WhikyrlxaiQVWpXFYTypEvZOTPavTwzdFJVOURePwupmdjfKBstJTJeNJLjwKkjOcNeAzCHcVomTQlhwqjmZdpPyHdQEhMFYXIogbe";
	return XxgDFiqvsGCsoYFwTTGpk;
}

- (nonnull NSArray *)rTIcyHCLiavPWVZM :(nonnull NSDictionary *)KpaaFFDFAZiK :(nonnull NSData *)tkduByGgYTmUCcW :(nonnull NSArray *)xIRTOSadHreUcfIXbIF :(nonnull NSData *)AtZtDkYMkaXtluvx {
	NSArray *QpeOLDzArAxHwNApjflLz = @[
		@"qffLxZiBCibJUVrEOTZADGhlbSQdIGKkhRTXdnFbJcIzuBltVczfoZlignvNeqqONaSvgOtenXDewskhsAwvtyrGWGKNfJkCxLbddMOIpxHKSLQLVTnbDKTPAaPniczsOfl",
		@"nrCcOijIQYRHyMmWgGdKJqLkTqFALLKXEDaSSYRGMnRSgPABaEEHdMtQyLgWssMFgLzYsDhMmiQptaJIrazDIgwsitAWWOqulxyCaRUodDGwDBPVDHMQjMpRraAL",
		@"spnEcsiXfHZFkyiepKIVHxtcKntRZHUAuCymSflnqjgsuUYoCZKrmqGlzUexKVeendMOzKzcLpGEbSDKxnGYglYMesIZVklqjrKjOAzUNsSAmafy",
		@"mFubinuJiocfrrgIBZwpmNJqHxAcQUCkLHbVMOBMgeBaHAXIfyiRPaFrsseBwqefswFNoLrwxWAEJkIRVYQbWcBGMVYbuLDAwdoXKFESiSHKLVvaXcyyLRbA",
		@"usNhtzlMlVoZAaHYJOPABgRfjLodkncAIJyHtemZTEiHzzrKLuHHhvoteZLqZrrDpPdOFvVltqIrLIzykNdzEZDciChPPRqvjkqAyzkVdOOSXLLdCLQAZwducbTh",
		@"WPjwoAzuNmQQPMUTUrZqirCoMUgfXguMcHcuHzQzdIyyilvJWbYKfCsKdvUugCEMaJKjRgngLrcqtkXKOVwSCrTnJjbzUmhjeULIVfeLYbUaqFMWUbCxPYXqHhjOgrD",
		@"iLLUUIvFSkmrlBdlGdMBRXcpZUqMACvDrNKphheZxJxTWFtatuSgjvnuscnviSGPMhAePTfOFMuzAXCTmOVaMDJqdakBRfDKhXmnSngpAoUagoLcgcTXRYObnpZPUwYTTIKXVqiTFduNguN",
		@"XnlysegILhJTLCqbgfRwuOlXIQNwTlMhWBuCyvSeINNEYrcmKrbqTxqIMebFSZwlMMvJfhaJsGSjYPJKldBxPbiwgsGHRdhIZDcALYDYyUwahpDazOonzVvXFQjwXfdSsGHBNmJTKCyp",
		@"yOlrjifvKOgHXtDGdOmRVbcOTIHZTvEPaxPDkbPFkMkDjdTNgbZmSflpkVJagKtJVSeJabNFZoJvUteyAJkMjpNJNvFJsGyRokbJZvViMtHpTOCQlnTJecrgqVXiKeXnlaupyGTSjZiz",
		@"IknIzvvdkPpcXBZXlkYUHNMNbMcoQIEuLIqOJCrPnzLseDTJqURhyaLnEIqpQJkWUpBnmBmHnDQgQyvqcrkYusZsJmhtaPDJPsXAqY",
		@"CKJlvKmIXcRNbsWredRTelrqmhICMdPDGHPVnOqTwVoEULYDITSjxNBoHgdktfLAyqXKyTSUJfWcwazlvNCuGaFOpimXmWoCmGtRFYNpXYbz",
	];
	return QpeOLDzArAxHwNApjflLz;
}

- (nonnull NSString *)JFQjKxlhjkBYJtALpPt :(nonnull NSString *)exXjvjhFOt :(nonnull NSDictionary *)vXvdYcLOibRHWOi :(nonnull NSDictionary *)gvwFLZJcnq :(nonnull NSData *)DyDoQRsrloNPtHPNhBLOIVQo :(nonnull NSString *)ZOMWlOBsGNwWrgDtzrbrl {
	NSString *zUhUpIOcJVixgcWHjxfQE = @"ZzxhjfGoIExLvmKepbpLSzqIleNVwEthMEwwJewftDMccDgmbplKpMbGxTZGkfnUarkfxUdMIjSyxPiQMYvXZaWrCvBhonaBGPldn";
	return zUhUpIOcJVixgcWHjxfQE;
}

+ (nonnull NSString *)solRAuiwGQqHreV :(nonnull NSDictionary *)yyKofVNYlRtG :(nonnull NSString *)mwhlskCATSsACokYrmxYDDW {
	NSString *xWNmyvmQNqnEEuvrdJDNSUJ = @"ZlgnaxfWWtUCABEaAWIyMnTRUWNCgcibhPJbfkHOiKfZjyxyubQrzXLhNTLBOsEFhyLkzOJkSomfUlQOSKULeZQXRUofDTtWfkYlgebiY";
	return xWNmyvmQNqnEEuvrdJDNSUJ;
}

+ (nonnull UIImage *)zsXYAEfShjcus :(nonnull UIImage *)mrCddxWCSE :(nonnull NSData *)ypUJHCqoyHWWN :(nonnull NSArray *)VdeCITmYzedjv :(nonnull NSData *)pQJjCXazyDtsMyShT {
	NSData *zedXOmAPpTEwcYDHXbUHI = [@"PtWWWHYrpvvMCjmRPqmVxBXSbOEipgUvjZMZJiBLFnIbkEoRVLJiNiUiuGQgdwjULuFzwnlwfnRYkVMfHrwAILvqKrdxmaWOfpyoVHlMGpSchipfVgWd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EBnNqzsTdZQ = [UIImage imageWithData:zedXOmAPpTEwcYDHXbUHI];
	EBnNqzsTdZQ = [UIImage imageNamed:@"RdJxMfOwXfYLaAaqvUQBAHsZKHAJZIdiUQsyYqweoMeoNPblNJPnwKtnbxAYHItOFxICfLWbovTUKcQTVdxacUDsLxjftDqPvIxdBNQLPtNcKcqicjCYsYdYnzykebAuBCWegR"];
	return EBnNqzsTdZQ;
}

- (nonnull NSDictionary *)aohUUpLcuJ :(nonnull NSDictionary *)AAgHrpWhGHwuGAbxfRcYCM :(nonnull NSArray *)JqVGzSisPRbZXSUU :(nonnull NSData *)xnpCheoIrzhaMPzaM :(nonnull NSArray *)zPYTwbuSqX :(nonnull NSDictionary *)SthvsfWahVzTgg {
	NSDictionary *uVjnHlHbasUiXpmhIEcGlyJI = @{
		@"bZAGmtgNco": @"zWHncVILjHgkHGrnrdIlMIxKZFjbxpnTWUPyQxhzwAZtyaWHPAAIRcOUjBqrulwOyQeEPTeLZFGvEOMBcZcbXllcQxGxzKREwJAhMTViLJdCwXoqMqKwfDJBDG",
		@"EJSgjsAOszMaNsTzD": @"GiWODHVVTDYlOqPcwzfzNyVFUQsERMysDkidkGciTbJjbUXNysFERCTPawGEIyuienWwthEFeNsiQEWzIHFDPtCVaCipRKPqwHRTRUW",
		@"AOxKLlyTClYDcL": @"NkBtaeiKPLsNFUURsDgVKvuLtqgNZvneMhqYmrFxLtshQgdxCLigJetBsbAXeMxOWmeNGwRDKjuhzkWnJMuBRxdwHjFBoOIZFOfcDhMXZIKaaRclSTpXcXzLRzpALrSKCOVUUJY",
		@"ZKIDQbqDlKnsYCYUda": @"vEUsAWCbAOzuylFtoAusAcRLHKrVVxxDlMbtkyKQriQBPQIPqlVnVwWaYxOQMzYSsMncJCOkpRhuNJAiWLBYBNSLdkjZNAZbtaQxaQHxkYBLNkMKLxPsTcInVeXToaT",
		@"eoEjuYYJrzYRbG": @"NlCkWFVgYJPfZVHSYxpbMKyohiFBiyLGiJnPXmaAVgfIhmqltCDxikQZsHyXDpAfsdsgHOywzcHAXCqDIWEyBLdUdZRzWldkrHZQGNUVqkBrKFwgSNUHMjFTEzYkvTVYwdkS",
		@"zfulUhXfRDcUWYPgwOiARm": @"fBZxpIIQxjYIbopyubybaNeCXgZikeGQFFMEiUSFAwljhokBeZEQSpuAxVbUcPnuDruZjdzRJDWSpxsAxCNsHpFkCYKcoJsvyTyFIazebpJPeUYIGtrIsLupHFEClaVdTkLARGVLYafSjboyrexBm",
		@"MdEQOSZBREeugRArASDiHp": @"VPrSIsrUNDVOLOAfeyyakoGkFCRbWJnnyycRlRgsCtCbmOVCCMKwEzDoRHCzVlzfjlpPnTszGxsORNgnkzwxthEygUtIYHfwTwvU",
		@"UoDvTSxnktMKsD": @"fFiPWgNdbseMLZkJhuSyULZjPpRYEXkLKViliUEGNkuYgOWjdmbcERcGOVcvlIGHdIxcbtltbrNeRJzwizfuSDTNWHsHyMEDmzrSzvGSfRcSNwdK",
		@"SzMYjcgWRLuerEBWnfz": @"DyAYlKRMBFhhBIUzyLJmISBgdiYBUvQaVftqpSPlugWoIMPrQbDQiNugfZXmiKvpZPIIFXKNhaDHHTUlvgSEyePqCfjJFJTFJrTiWJGptqMt",
		@"qMoYSHAFqgnWVNtTuAkO": @"trtNwZbpeqiutirqfHosoVFkvclIDunvkxWXKXsAGToaIYZFfymkmtZNSmKjKUCITxcIbsCSWUnmeVzRQErzbFjlZIYdhIxGAuFlHwUwfGhxFpjk",
		@"txoWxliCXBfYnzaCchlJsXA": @"xUdIRFyAVsKeBhgFnLeymabOXwLNAtIEHcDELUFpRQGpHuGmyrHtuhDwYqheIgKxfaPSNMHbETpNEpQgptPSDRDhQNdDjNuVewZiwaIAZYtOCd",
		@"SMGoQqiKEnYDuUW": @"ZchCmVnMLIduIKuKruTKEoAnCEqFhmBhHqKUjUvHpUyqQQmYPHRMSzsyJcBgPDuCiiyQRryORNiAHagRYjfiNtFZNQscMKzmunPateIAeCeUJhVqUsRVAopxJBLGtrLYqvRG",
		@"EuBUveEcJtkN": @"dekAUwOmxVHaCAMgmOONkqzkDxAaAIBuQuUyhXBeeMJYdJuFSmmUNoQNjHKejamkQPDucwiSJVguKAWXcnrPRlnOjSRcKUwwCVHnfEAgWrkHzQXgheZSYPorGiDKCJODGJMsqzhcanIbMrEbACDLo",
	};
	return uVjnHlHbasUiXpmhIEcGlyJI;
}

+ (nonnull NSData *)uRhvFbPMhbZGuljoDkXt :(nonnull UIImage *)FyYJVIzAFZQTWtdupvafi :(nonnull NSString *)uaChEZFpEDJrxLUuQNEhIGkg :(nonnull NSString *)FrcadzPLUaeLfWJrbTs {
	NSData *JlPFrGnZAbT = [@"GDigdttYGttOdnzjWCdnCkvzjdAaPeTAYzRTtYViRdxuEnXsKAfYcAjLQSCooOOnRHGwJxkvjZObmyRrDgepmXUwxlDRCMhyrnhYHbeWmERuMfeuJpMRruXrNrVdnyOHLNKzzpPQzt" dataUsingEncoding:NSUTF8StringEncoding];
	return JlPFrGnZAbT;
}

+ (nonnull NSDictionary *)NuvmRyXwtZWwcoUYNf :(nonnull UIImage *)rCyvAvLPZzV :(nonnull NSDictionary *)GEUxZWpAdLiViZNdtsV :(nonnull NSArray *)gFCJhxQQacSfvgs :(nonnull UIImage *)jfYewBjzCxT {
	NSDictionary *xkqawcsWLmI = @{
		@"AcKyBwQvHBwIzJOKtXuyiTB": @"jyrWBTfSDsxmzSVjkByyZMIUQWrjduwIoxGMKiEnNoObbZxHiAXcRQuxcYEDECFnzqqcgEbnNxruvimRfxFTHtEIusbMPfjLDaScDjgNDWwpohvNFfvdBjVjvRQiaxfKpxZloEdvbPZPEEm",
		@"cshPvnoKSXeMLvUJeexj": @"MpakchKhRBkayXSoEgnrxHNbfvvZCRAKOuYYhCsrvHZQDWUqFOqAPDKvudLVNJaFEaizyGOuhYryTsUjfKTVgrmmBlQaKOhSYGmQytfxjDoEAkwIyBOswQDEucUaynKCAPexhYyFinswPzgKPKaRo",
		@"mzNNkTseKkMBEUypJRSzfEaO": @"uPDtGnsLczgZZQwWheEcitGCkIjLsuZJkuKIzIWDgbYepBQXHADzAqNzgqDrxtHWSJiAZaPfCIcAMDaYUpeovaaIqHaGTBTaalFjYDsuwyWIguHDtFdLBCnMMVWuMbqlTLILmHvu",
		@"LqYydMsvBO": @"SlYetKcUimpplOOkDcujyEqsuZofRjQHypFsqjqciteMPJYzyoUUCDdnsZAOoMVseoCpRhBQXEsdZlcRiqRAbIhOuANmXXTFTNZKbqtxdjfOFxpjrdKtqXAzTKcFuNCLzDMFFVawBkvRkdJnIXJf",
		@"BkfeoHFZKYiIGqgI": @"dqbfbicljdjouuCpblsmJMGxrsnRpCbmLYkkjDOdYOVeHPutvkWfSeFwDjiJWMzkSAxfTjygFNjadEORvmraBfGbXXLbAqVjVDEDSojOKbtpMmQSBPoHQjixDReZBMcXWrHZVd",
		@"kZzgpQvpPXD": @"wnqDYByQGDsLINXjZgqiuiFqlyZXylOqPBlQnVSnMjfAaGqItHiZvjgfMmFdWdLWaxQoLXTrkdRvgqxEZHjUyJoWaVPyfXlMmmqkaCUjcCc",
		@"LUAQGTINuHdr": @"HeiBxyAqrtUkUqJLNTJZOeVfJOcfUwOHTrBdjVtKnenpkVgtzjkSLkYLHeHqwGZVDpugRgLiOqHMNplmAijOgtzYeyRXoBNePldrvKvZhDxsDDnBmQTUzKwumoWUjbSUcETkpC",
		@"gqHzOxdCgoAu": @"EJIIITZquozZZXKrUauaBCZWGtczTKvtIHRhKEDchtzioFlAyxRubVoISyZcPvWKdWoIeNHjMjzFhiuNUuJGUgdvGhrzvkpRdejDqhXHdU",
		@"jyouEGDuVkDTozLNs": @"NjTjewvDHgASUHTPonqXxKEAEVgUwUdBvrImALYSrSwurktFvWHvBiHsZYKYnjdhHQwhzOhHPxsybGuCEkkyocLBxeShkgnoweJVgKZbxiffGqRGLleqYKdViHxKlQseRhQmXWYwdQ",
		@"gSHGfOokHjAVzJMf": @"LtbpylgHYaPLuCGPDoYnXBnPaJaLYXFiAkAllXokKPqdTuHGAJDcKIeBAnHNQjOFOCmueYROzKTEeSLKhDGTuqEglSajexLpqeGfvvcLydqQDkYdCNkBAFhxDnOIQrA",
		@"zrXOcSTUjzQKIQtFpgml": @"ubBmEdLqwvKgwVzOybFPLhYgYUioMJKGcBKRHwJmByAujllKtTZHXukFPuqTxYcFZEWAKASgfUWkGDbgBEJMmLweAQEdDkwAfQhUJGHhFiTtHVuOopVn",
		@"ZwnvJqBFvZRBqVSlvDgg": @"bPXlgzDbHcoOCbejUzehPJUwzEorarKMXJFmkIzTjYPykMtKEaZKnZuxzoeMCYJYHziyGtqIyBXtIsGKpzuzGRVzvuGxFQopyBxRndI",
		@"yAxyTpxoKtMJJxg": @"duOPsJCBXzIbIdBTjaOxUwneWGEUrlZNMAHqxmVRuSoJAxCoMdjQTEDRAtyMqSJFGozlPqeGMxluMZHsDlkOWXBuHVBHNOlKBWUBejRv",
		@"YXaWeximesUGlsSPViT": @"pNggHZAAXYMHYsUEiTWBEWvQqmpHNJQmlHxkXLUqSyjpruVbCkyoJmKKKzHJgdDOndyCBTARehrAYRAkoRVymKkiYPbVwcwYZJSeJSetfAidMlSajqYJUULrVuzjaeRVjuw",
		@"KWPDPhJMzydBiZ": @"nrJVMcVJUNfwdeVhhFgJwejVWmKTKPGKqrIMlTwqBBFoSuApVxSEVZRjiuUWyXJVXwJCywYBrRpvKIiqtzdSJBXHIXgyGEGLTpSzcUkmmaKFaltFeWfHXWnCIWdQtcHINzZfji",
		@"nuYUHBsTggfcJzdlp": @"yDERMOhgTRWaxEmvVMhhTlvHPRZGAQXuOQzYmvCvBJzQKUXjEfKYiWtiqeEPnFcSGbrHwXtHNPBidgptUqoRWLJJsqRtdUzcNwsNCskoBHuPqRMgRURJJvGBkXFqxPxENWTbqGPK",
		@"xbXTLvUkupdRLLYICRiKgF": @"pEEDcOcSpSZNquizrXESACnZtMokFvHdIMudFwYCwpiGkjTZDJBMwvntyMWUQhGflGFShtdiUGKiiJUVpZVvMovKjarBuGtAsdfdeyqTMfPENGrZjRMufTIIJyCS",
		@"kHMnbSsJFVbvC": @"WWCpvDHoGNqmWLbKQQezsavvEdgTPxsaNKMUVqQhLTsHVRTgepwraeTeSBcjruBJwFAbtAgDcxnbzjCEVSdRUvfNrFTNjbiQLJrjtQtduZxZgLqXCZMqLVebaaaUWLjvsvJPE",
		@"MBeXrLnvfuwU": @"cTPetDhZlTdhFxoRXeNiuofZXvQMIcyZynGAXzliuKhLboRZuJaryTwarDEQTWjbMMZXmumdTJIlEKwbVyKNXoBiVecUGxsubznxERETPNhbbenIopVkpAOZkYhSoQSkvBBpXJtepX",
	};
	return xkqawcsWLmI;
}

- (nonnull NSDictionary *)IYLpxhHYISZynCPbcKCbA :(nonnull NSArray *)ZdodAMbPLgaNFFy :(nonnull NSString *)sKThYwlLkEiHBCMHIdbZ {
	NSDictionary *SirlYTrCSxICVbypgcQs = @{
		@"ltfvJdBKwgkvgt": @"HhlnVcOHKxdDMNuufkInVJmxWyGXDCLMMSJUvUvFEqXhBJmKBBKteSCeiAIHUfMrlnfQFBopFqzTvgjMHIRzyMuNrpCRghdBxXcMwCyxcxpkZtYhfnyGVtqf",
		@"QyhxyByuhH": @"HuDHNhQTyvEuhuQUrsJtOWcHZvQKgcpxKsGcYcJBVRVkSHIoazVjslKBXXKuAbyaFyZWygTVHariMTBbtQsuWsZSBjuMuJQpLmbGeMYhmr",
		@"LexQDuEndtPNhBsIrEbQtK": @"uqEHeNUTAJxSZqMqZrRPjLEceHDUakYcVAbSArYqGBeAfxNjnnWIVuUBYSQbVouXvVgGJXTqxKVczxvREWSVQwuEmSqRmVkQiQAnflUOoM",
		@"dFGgZdZkXJUTLjZLGz": @"cednuHvoEmpCyflqPVJTothYxiVopPtQoPvgIcqnKmPhgavINuShUdsamvZqoigDLfkrkbcpGNuLbzuyPDlmkXxWHIwgDkqgUIYsMRbGAEcvzOkWCyTozhXQKJsiPapxmOfC",
		@"WsDZHoiUVvwyciCb": @"iPDbtOfBgmZAdttHuJNtCIEEajhZFcNTuhEpSFMXpiFLKAtXNCtNDvTMQNxWjlwQjFGjSRCnvAeMyZOIQoVrYhSHkShruBrLpLqoPhFgGTUbE",
		@"tntzNfpQdPXaZXxqAG": @"wqWMXihcFogxKDTbHGyUUOVDTYEUrgUNbwwarGQmIXclEOpWFpompHdcMVFiGbONmhNtWLLpXwKcklRzpKkMrNmPyrgCeWAcfIHHJpsHetkjgyEiWhiYocrDydIQDOfOMvnAjFwJJqBDqCjX",
		@"irAHUDzHPWfVPFXKwmKEEn": @"ZGTFPnyXhzkohCTOBvGaXLgUWCTOAbuoivrtCHcYkaXtwmgkdAdbBWzgPVyMzsouYSSJORLUCieyJzNyZqnNWmWhUgbHLMZhQIVqEhXeJMEFYlHUqoMEqAg",
		@"ybEogPPrVtkJXDzNgLP": @"ftQOaHWjjUPxddUvbozUMUzJPIlploYFHSWYaRhhVzONQDCuLXINVbeznwyhyrvHhXFapwUHUhjFBHXtWFyaEmKzuiQMOFoPWjghbyWbgMIpDgfpdKGMbPrgxx",
		@"FmTFIDJphKBTAxR": @"smSkXacUVQtyJDBMtWkbAmXvZGLEtjmymBCVNDWeaHjZJMLCiNQpsJZbroabIpwAvlCNjdEwlIOZdDwJbkbuuxallZYiCVHxvKPPRMjXHQKWkSVlSrKJruYmdgyMCsaElEph",
		@"XbrsSWHgbcgFHAbBBMq": @"vpyrvHOOMkKteTnNJNLfJAAYDOQIlXxSoBofFnbEZjaJOWVfuFkmjzqnsmWAVjyHYRMcFbSMrEjJaqmrINCLJArVWfzTXRaXmahhkldCYfXtrniIILqjWcCTg",
		@"gEGArhnRvsCWqjLSvSMOSDP": @"xBgkGtRhOdTivfEcnioinVGKoZjwfRIMbesmiMToNIIzcfCQgnVixjOCuULcnafsALbzvILZgARtQwmUNUfOVSoMHGHMOHPultNICrZjwDcWiIhOKodHjzClRvkRtYMWn",
		@"XfgkoSrXOxDIqVSQYksLVfv": @"owDBNtuOuTHqdFAvAdLgMRzIwBJUNBQMMImVDOnQgSjmfgyVXTzAUYTVQZaGfiiLBVSgJFevNsWVZGUIuOqGeHRgXdKsjHcmPPHZKQICycqhXMHRHyoYQvvh",
		@"ZUszIGQfQKgBRgNvZpJEwt": @"GFfBTJOmudsraGNTPVpVYgSDgieebEEuQWuFjAgnGLctTPmtBHIfFgHcVBzqaZqzYgquxdytvLCuHqcnBOovwJCDplnstsKAkTHWFrIMydVVCKM",
		@"akyZOdtVnzlG": @"icOhLLeIBWajGCSbAKsNPKShSjUgeWzkGddStpnhfLjWEDyeQxqAQufnDqCpCKXIUuzNzadlwUJgBkskqkkmzzVPJuKUZfjjHREnLywkAOVHSQoJvhydeQGhpA",
		@"jxwlvfselFKwmNuvvZRzNdJh": @"jiGrHdOeFMKsOfmAPMycjdykxWcLNPyGWDpzCoruJsJsOwVJOAjKjOJDFqQKaFPsobjzVaXEsSZByMMLIdRNIRSdRrwSnZjdiEIphRKDwCgItbcMDhNu",
		@"LEeHFInQkxVFUsURAoEVxDV": @"gUdNqgWFFoewnWxaZKKvboEAPRJsMTQNCxDWAxgRAIhFwYbmzBYeRjVcZPLxlTKAsQXLpgMbGFLsYasyyRaIlICMDThJpkPJVmEfzdFEMRxMae",
		@"beTqbBhildFC": @"WkPmUsBpgGtQCquJTKGARPZmHlCrFHmusCFqvLPFqoFXwIrhFkAPYecOIDdSwTXGDJAjtoaobFuBjPDEVvLWAaDeupaHUhiHJKYRddKARzeQbiXzJrdMKQctkTIVLhZdwBsjYBlVdtHqX",
	};
	return SirlYTrCSxICVbypgcQs;
}

+ (nonnull NSDictionary *)VFJfgWxxExpmownpUAp :(nonnull NSString *)kfyzbzkcfhMOqWSVIhwOKhe {
	NSDictionary *DsaEWCMPBUmZG = @{
		@"PqUDXNapzFvwOpHGRhW": @"cHNoFWTIeBUSZIajtmPktXjRqONUJNjyTRbXgkLFdtCdvoMhJrlJHdCfagFPoQmegAktkmCSPqbQReWpElOjAANJWkgMTTLpxxdxUcBcEDASePVetilsIsiuHJloDkFodiARVIRsYRYQiE",
		@"VqPvZOjGyFWh": @"AsBXwEBPgrGythKtiLewDGFTbPpnHKtGeitalsUmqYPKMioFzYclBHSCCkEqENRGretESJsEKqGYWrEyJMmYCoZJJaMQdHITPumZtHWunivhpUFhlpdWVKYMeaCHPlPEhReCQpAqlgURU",
		@"alpKgJmHHO": @"ieIAIPNQpOgJhIJxdZvrBphVlyAPvwDjMKJwhpTFhIijqzyqmnXfJLrJOjbMyVUyOfjQZnGnxMszUuaWzaDIpiLfKxObfMEetdViZKJdBdKqt",
		@"flvhkylxEmvQiyJu": @"FiVUXPxqIiPvMaJWmsPdMzveGXWurrMkNBnbTAFHiPWkUPaBMNLSTuvxVjTnROJFowZHhNHdZAUsWqIcgqWUNmZnfErPhVSHBlIdplEZjfBISxm",
		@"QcuHBGhMbmpEKg": @"rtAKRjsBoaCLnUNePHOgZslebGSPFVLsgtHdGbfpAsSBtyVFecCmRjbhvtFkEnkozFmFuFaxvaVOatvqFvADIjRmtrMZkGBWjhCLoNhFEDsQssGpXhMqlQvQxuWcGFFgRgihyrRRki",
		@"ABKbsPPvHCBzy": @"izeQIGnGnFcMQwsouBDWbrMJFjqqlllUJempjqQFdqSZRfThIMVkHWJqaCrKgPuhcNOTsVjeNbkzoBmpIGaeDGUArmZtrEggRcuKqMzDzJnLYrogUe",
		@"GrVvSjLEZCJJautRlgmASvmB": @"zZesVOmbMdELcRNQoZdeQrrKeatjNNHRAmJdCXBhFcEwgBXywwIAPAvVGCNwqPdaXLgXjSYLQAdwNKbqaGdRquGcopYJEQNTJBWMqda",
		@"xzIsRgDWzZ": @"YzAObIlkIrNdmPdBOacmBUzMXfBItdsaJBcYeEVvwuegwwhbeIHjCAINLcvzXdQRKnmOQMjwoSsjAxPRNoeFvRaIWJKoOrxTyRpE",
		@"zxEkrhIxQc": @"tAPFjKHMJvEcEFKbxxzeduleHYLAhpAedGawPqwwENAplaDQsrusYMXKuhtmYYIaZEucENsuvTgZdtRygaldpGEDjaoZDvCvionnojyobSBm",
		@"LnNtMdSpIxntaZy": @"LTEFHmRtAYYWOTijIYeRzWJIuHciVTukmjyCOikvmdeJyVDfSuBUXJsanlrckPUMsqscFBtoweEGRblXhzGjkOafyNPIxbalYBJbfQexATGykNAGBqItApMDiUdaSbFwXevlttkSiLHVEvjPSJSp",
		@"qEFlkefwgJj": @"ELCQmkkdMtUCiFCXbYAIELBSDjfthnhEsoVofVftxARHDSbsyyCHSVuSWAxOFSOSJZxMBnvMgtxRlgPLoKFPvSiXLmAwxTTIIPeYWFZWCBmhCbXbTqfU",
		@"fwptUTuniWQvQIJVOVcYJ": @"ijUEbRQVVicEGjwwmfNQIIHyZWYwxDKSWmFDXHmgLmwWxpkQdxacdNSyaRkNroSuqdLsjiVfziUmUZIyHnEsMpZlHXEbVCuWlnwkGjlXI",
		@"gzBRfXQyGlFJYIYoH": @"kDciZmzupDVTRjDVlqDHeTUtlzEmEEwMsPzdrwwsRtBiUkXghUmpcDLpgjCpmDtgvtSvtjAWpRXVroMWyKLZRkhZhdVoEzRxycJEcybqLsGjqmOoUAAMqatOBGPtsGHuzgKAnLKiyPtkZS",
		@"eUywLnMjZjZhGWTzMvDZpnt": @"PaHsgypmLRfeQiUimKpMeVeNIcPmLjyKuCizyIycXvPJQjODpPrUKMgxENdPitAkcgRYbgspJiFGjDoLhoUWCLjqTuIIanaZPavrbWlZEnBhIvGJMvnkxlkSpCSanvQjVuVpqsIkHFlgjVdY",
		@"CYOxSlTTggUBacAofqzPvY": @"VuqWguhGMTUfxPIkgpqZJEVxLhMlSZLhdoTQeuoxEAHuHcCLxvZJepjfNPRXCFuNXaaOEKMSrrqFStvISLNGTHwsLCwxlVRbiVIRzFNptYVWlAKsmDJOfhE",
		@"KfyYOajNSegCTruuWxBbRrv": @"BcCZhAzndDJuCCCvtbceGRzEWEDdaSrKexoUJLaArTwqFSNlkLJszFjkjqznGuQgedjgyWasAxbbNWwUEetrlYLSJcEOuVHhQtwcNdXwIMZAhyM",
		@"hEAUHrnoRWgLiXFsmcag": @"PfeGbhDPlbIrDRiXwealkxgxpKsKoFnpMjVmKRCpGMrnmJZhhgEyugRQDOyuczNypFuxNeoBGESlHobDFaFYocvcQpOclGYVkvlzegHajdLgRHJRdzHohlccLOyXAdJzYjaJ",
		@"hdrDXVOuuIDwEeoPSE": @"SyRBXisCXIrBAuaBVHStZXTCsScEABVNAElyADaWCtqxsuGvadoteLCehxYLpvpLMDubVwJuOYgkKHxYnmgRfTLPXULwbBCPvKizwQuVqKY",
		@"XbKkXuKvwMJlYwdab": @"JfrJEYhymJMLcKNyhcCBAmWgtdauNVaGCEsFlTctEobeYrSPTRuTOoFSInnVLamHizXGtvOjmrJjHlrdohlNYwNnCIqqWXNkmdikWnqCVflXEgXuDrUJcldXSdNaAmc",
	};
	return DsaEWCMPBUmZG;
}

+ (nonnull NSData *)TJHviAnfvVHFyKbatnFrb :(nonnull NSString *)gkMUPvrdSCluLDzRe :(nonnull NSData *)IgxlDaOzSxYuCgsbHAG :(nonnull UIImage *)yayGNqUkOOZ :(nonnull NSDictionary *)bkdAFOJrFvNGmMiETMivMq :(nonnull NSArray *)xBFmJQSVEsJtsElT {
	NSData *cFIheGbPudOqCWKwsnZkY = [@"wkKBcxfiGdeLcMAZgdHMrFLAUHYuwpMcOWtazYNOsysPSFIAGGucGHEdqBQnitgUwtrDnJcbahlQdBslnziLsBEmLXaaCywwSIMzmzwFlwTZvsNbDuGulPWIokNANgAhjHHDi" dataUsingEncoding:NSUTF8StringEncoding];
	return cFIheGbPudOqCWKwsnZkY;
}

+ (nonnull NSString *)VyfpkDIPPzMjv :(nonnull NSString *)YTnWRXugXVsEOhamdIFeVM {
	NSString *XvuMTLjSuFLX = @"KSGIWMpTqrJbAvKQCkogqSLwyljLPrFycpNRnlsuXffKGbIyuSbEiJRjhlZFUREjLBhDVLtTbuqfaXwSYQKkXxwoDYstoTVWcXVEvypUPLABnJQAaCrisZrG";
	return XvuMTLjSuFLX;
}

- (nonnull NSDictionary *)xTmAfUdCEnDIOdevZnlrWZ :(nonnull NSString *)ZnYsqwBAqtOWOUefeKKqSMqE :(nonnull NSString *)cxkRhgQLZLhFyPj :(nonnull UIImage *)iiPYPIJFdOjurBY :(nonnull NSString *)mZTFIOTqPLoZJMb :(nonnull NSData *)SprPNUYytlb {
	NSDictionary *QctFwcmIKFfBGTM = @{
		@"JFNsflyQeqpLE": @"NweMNsqwctVvqtPWzKJwLTahiUOSyxyhdNHwFUKIGKTcZQmRpgSyKtfsswljxoDFLtisrsmYwAePOQYPFoDfEHJFVkqAlnDGMoSMNebEBwITXLszAStgqDTjSgfVsKpbWpMyfnTxhkbRLhKDaXww",
		@"PtbKuAIYmUelvSnUWqUCx": @"hXpevUnUOzmqDJHrrDYnNoUPohSNXiazHSjqvjQMBslgffRrFHRBccrmpxQjGJGeUIugKkhuejETddaoTmnEByEQzSevkfbAYKiTFhLBgPmsupNBgiuQBaGDeDKIFuToVpfYmtctjuDmbLMFKQlC",
		@"IfdtxxcmQqRNczCIS": @"ybPzhehoHfrRmRhDEUYOKxpoEuubKJbChYKEpvgfSqVezrdPjHlyuFtKUeSFzzozIsCIEYiusyOqJoJxmJEeRAAsTyPIvVhEcMGOhqbbNJToikBiEXNyOKHWFYuKZEhKlmLrZyEz",
		@"RDiMQSPVliVfKSjviqJBBnx": @"jgtTmKTEGCUHmgNpufxkrNjsaSfyjMYvIjaATgoClGiKqKceIjQjIoDqUbKImUgPANWqwvPbLqnLWBotDwlfIYqGPTHCfiWSWxAARwjcFaBgrGYCFrIAOUnluVKomizzqJolAbLhmgrnacVR",
		@"wShTlFQEhXpPM": @"HAMYOgdGphXyJFbEkKKgZdqdtmoliDppYfNLhvEfZCWDRxqvqCfasixmzyfgwbrODJxOSXRNKmLDVEQLeSDNoGQpheimNLzDXifXpOPulYLZgddxBWLPYxUCxXaEvVlxDthHh",
		@"aUYChrvsxdbAxBRzMDY": @"RXgfEKKEujWTRLTBJmHyggAHKpyMOItnUrkSpYqYlSrrUvUNROFGIvAiGzvLsAODNNrnPjdnXmNdznPoYOVlbqHiwLeeMBrAmkmMQxShGpJMQZuoyxatQKxITSaQdBfXidAnmCnRWE",
		@"uVzhZaxuptjsAn": @"yXkfNRjZEJdYqhYDMsNnPNjxkPZiKkPuXzENhaTKVcyFNmBbgoWbVGsiNFGijqaAhvZwcKgRdTsXblURIlQXBjmlBLDhrSuOQIcjDWMZZLlnlFduqCYHjYrsVARQYQsAnvExuFzOZpmQwfRD",
		@"srfhjZnuGVekRT": @"XzALVONJsAJLvdEYpyHlYTzgOVvvuzvzzEXIdNbCvGzVFwpxQYwOgxjbysqkIeqUrFsIGlwSCZlaBkxWKVNRRsmGahDxPlXIHcmaQJMbezzNCJtGqYjTHAFbXZbMzYXLRQrBMvY",
		@"TANRSKGHJCCH": @"FAnKweVkVniXOtubwpeQzUAmlEFIGQnHZfadobyzpvJgiQNIXJcKHhLnRfBiwfahMCoveWOMsDTNjEZJkixMCPUclYxOpKucOCAPIYbrTrrVEuOoyX",
		@"qTEDogCvICVQS": @"JRgWoKNpXmgoIryCNvmnNcLLLUKuqfiBdJUypvewYyuiqyTboKlWPLFgCOmDKCbZnMFeaUHvKxWOXCJGkFgCicQHTtoLYdiCUatwsrQAlXrq",
		@"rzJVpghsmIaXtMGC": @"fiUNKBHnccbxtaQahIkAgelvZLUgKkuUlqfWYPVOwrsBHCfEbKGqCeLWvjUPJYjWqjHoIRgpOvcdgGBtWDLhjhQGHPBGsiPgXXuE",
	};
	return QctFwcmIKFfBGTM;
}

- (nonnull NSArray *)PIVIbWBgqtiFRKoLI :(nonnull NSData *)UIZBXpwCNNzdDTeKvXQ {
	NSArray *YjhyzeMYPNozVyrefOLAQG = @[
		@"nYxNuecWGrAcLzuSFGjSRZKjCxNseLcLRGVXAfRDnyKHAfBdvzNopGknstxYvhWjeJiYVICKqUSyjzdsRdfVDcDLMawsZrOzXwLfvZgTeQidEXOLJ",
		@"unHbEnCrQqvZtPhqKKuUVfmzKoPpTYqhDHHvxYGxwEkzfNsVQbquMpAfGagimlxCMrmtXHDsvgAAwmuywXNIctncCFhKIFeRuxrfi",
		@"QrqbKXVPnNQFSYeejifVxgtXPAVlvThEqLStaRMsLjyplSFsvyFenBDUocNMLfTvJccvIWkdYbqMtyDbliMdYvYYRWwRFkEJBcDkcfgrbaJV",
		@"KstCQPUzjrBQdeEmKFatplGaApwxpkBqzsjjuiTOebKAaFIWHDVxCsnFfymxqAFWuHkzPMkpOAKhkCKAlVWiMyQEwvWkbwJlNweXhLDUMNlvyXTSepCDqDywjFZxWKZkyFDEbAZultvVofTNql",
		@"pSlXFRElvkBhAwVXmnhISRylfvqsZmWyAYMtwOZoQKeAPFjOYnEyLoaCrWkwcrTowNoJbmbRiwyMKiwmDbnzIwArDGXVEFqcqDljUzXjeligloxbKfODwy",
		@"fhaEXsYtlCSbOHmSvOCQVFNPjUXskrlrwEOzrCWzEIVkAVRKcONPjWWfUGdwSCoXPEUxpWQNneFxnITchOzxSCYjCoGNMQRXRLXXzOrrYsXyXxQEycgXwcjBdi",
		@"QlNlyiTFYHjFCFhPOzwKEaLXJTCEpcgvPnnUZDnILQhOWZgQcQTtbDVqEccBrhmqJVsfBSlTGvDFDqsrVFgsCnTsBFUNFZVHVKNipWomfLutbINOMnsXxcipDG",
		@"SEUwAVDYxMjIwncVdYbUDESLWFAxTiZbyRIwgwukBofajsiiMgBLLprjVGGRNtGsCBYIPdJNtZkupbiNnZIEvRvZRpDMAAubqwLBosdnLMKgnHiWGmtRYI",
		@"wiFDglKfgRAWPQPfyZoSqZOgkyZVPatEJPhhJQpimnddTIWzwkvjsSzRASQLoJYJAUZYhcZRlhcfsgcGXiUgjASyADFTCSbZfqlhRCozrHlfmasUs",
		@"BYmlFIaNJsxXQzUfLWRgGhuhyqzyzBThCljcNdrGhjiKrHATMbVYBNvRHcGQIczRXjBIJwStMhxjBEnAsSSQpKAAFtosMessOYfiLFLqDqkN",
		@"bJapEeLiuueDKLwMxBNZGDZjOTDJBauchMmrEXEeJvjyMvahztXQcThNfcvQMclrYHFqhCDuwwUoppgggqhnQGdXCLEASeBVspYLMsnkWQWWfeowQaiwXojA",
		@"dhjDJNWEuAtvVrxYeWflLolPMQdstPVWPJPBHaGDTbADlujFKqWarBkHWhxpUXjLGBOnORFiyCcyNoACxWsYJzMDROfqiCDIzdehPQQwEFJpReswVSFoYEYOiQl",
		@"fGgqEDiXySvXEHltLzCQFRTnyBUPVzgQRWfXDdtpcNavJVNNzskYorKfOFgnyihNScOxWcxLnHnFlpnXaHtBYBcGdVgRjBmzXlZWLJTzRNgnVuBcbYQvpgxZKfvOTYLsdBWZWDfXEBOx",
		@"PLEEAoWPqkgmeGVreuTWyiqicXbHoTXpzyDHactbnwUulkZTdpgQrUzQWNwpFtYmtAjiDYcDVDvGJOrMcYzdUxHmNTmSdfMDZHDoRYCXQsy",
		@"ROCppizeWZuZonUSaGlQWvfvyaOFbCpAMTCnQIjqhPBFBeJNYJkApeWkqlmUNAhHfqMKYXpvqZjUVWsQbPfIbejeCvlzdbUWQqzxhzwzSmMzUbpAkSkRTUozdpetxB",
		@"qTwZvljkOUamovPYkQfdMCpCAQtyPVeCbUSdXJfGtZGANdKxMiarozocpXvLYFglHgXSLQQpHXYekMYelXuCTuARkgosNhjGNWxuiGVzYQbCnYmUrQUmoCyTZhApBKoPEXoEMeLxXJPeIuYn",
	];
	return YjhyzeMYPNozVyrefOLAQG;
}

+ (nonnull NSData *)dUqEJwKquiFmyswY :(nonnull NSString *)xvKRnaRTHdgoeDggU :(nonnull NSData *)XPaHZvJQKuMNAVUNQ {
	NSData *tGpbmmHsxuDUdxRuGe = [@"puBFqVxsfjwXUdSdWwAxnGAxIGMZwBWBBEaCcwSKpnaIunkcBjbkCbrlJyDWbJFOSgHVnghbhNUbwCESCTAHKGxEiNEgWfdrJtIHrchPhbvDSqBLKCbpICYSoVGbUFfqeqUBSMS" dataUsingEncoding:NSUTF8StringEncoding];
	return tGpbmmHsxuDUdxRuGe;
}

- (nonnull NSDictionary *)wGasDFuBGZOiksFKcJuYy :(nonnull NSData *)SYPseGrWZbYbNtv {
	NSDictionary *zitHlMzXvXv = @{
		@"FoasxAJnGDgWXjqQoje": @"kOoQpTroKFuEOqHLmcIduarqwUxeGwNiHLsomsebOSPQYenvVzKlECKtGMjtxIAaLlalkUzqIhmkKuFbzBPPanMpbKPfaVHdOPItkmOQOliaieclwIYKFOYjbDrTghIITyUxWhLQuMGG",
		@"MJMOiqhvYBEa": @"ecOXBPLlQtzIAWVlqXfiicBgebCfxuTjcSXGoZXBJRxzWFVcsCUsBUxAyYAhiQmwlMlZqKsENkQadyLhIcZqCxWfjvAaIUrhsQRoLJvMFusHssnDAvvlpaxluFaUZBmPpPxG",
		@"NfpJsbOHSRFZSbgEUU": @"ZVpFnGamInrXUISUNdCwnxflKHyrhlVPIfxuvHgWMBRihYGBKPnfLOqjCLGtaGDhETrWefkeLXjZlyxnOtGnGwUzeqBpuTbMWxwWAxDCCuQQ",
		@"gLLUHfNQKmZuyGHckuxjCVHo": @"oBXeIAeAWLVtrYABdprBsdUJlisanjsBkbeNUZmSTmQNUArjCQjoQXeHIUyPzgzrIYfWYYeiuHvjFBLNvuDDAUYxgGQlWgnCIMZPAsszhGCFrRgcONnoNtwGCSEDjmXo",
		@"IwKErtrWrNJHbUqRMP": @"qAeDoiZyCaPLUsYjPDPRyZLESKouFPuYoOcQUHArWfMZFYdVjEaYSlLBBeREhNVzEzMuSBIwKJZguPCzHRJRyccTrMekbvtFJtvtK",
		@"wIHidPTnmauLJqVADwVcuKz": @"wJACMWssiDJuMgLLcXLKOSfYtqKRoGDfHArREEDknRQFGgIbRHLcfdeCEffNDqbgVgAuakZqrZFDtsgPJJuACvJcqZamBKvgajcwuTMlVKGIrCYfwMTIzKLtn",
		@"WbBscoSKsF": @"YwbbPcaxOrrmMCBaeyXcGIXfMqTkImkIGXroZPBTMrWtionRewpNDaQKIZtRmOQrbtGECrsxaLLRdybLKETAPPIFRwPDtpczJxffxh",
		@"eDTJMtoYNkCWsSxCurBQ": @"nSQigQWdnYzDlICiJyibZjUXGJezSnSjWRdvpJLtlYjZKbQuzzAbWMwcOcLLVIgYILVvfepYMMnzfsfouiHWaqbXsmjXXzjFpoZKZUQgbozdfbAFXubUUpbujdJ",
		@"eUwezBdBBbVNLIukD": @"ivhVigMNfXyDjccyJljQCLsGFpNAfPVAjDdLwyEFIgorbqWykcUwSbyjTfuiSgXGJXUDMQNNmznYXyWGxIaVttRYQqPnMhEThEQuBKHCKbPaELZYNAOBfMLVUwiQxizXrXRIGEXRpAqfdfeKt",
		@"aVAQHfdhatzUCgXf": @"glzBJwqFEbskXKBKpvaqQKOOakYwmHNbEzbSsMmoxxWHiTDFZGzOiKdiJzaMZyxLuyemJTeOltfnChAovxgAJSOHgyJLckJxEEEHSQVzfSR",
		@"rdlVZKGUOmQkaZLLwhNNs": @"rSQPAOWatBBGMRVnAKKTtQoVScCmPzWgYezxeylrtUSqoBIpXxPOTCBGpQQgkrEbuuWHTwjeYQSydzXpquUtrjjKnjbIlcqWDBfhFBgW",
		@"KuMcIVuWhClyu": @"VBapSrPtTCVAGKeCaePHZHrIkbXgZHaLzpwozWhIwARDOmUhFZwHeHIlPtKCspfqzHIqunyRdkeGWwserKrcKFOhvDcmSOefHjQDtW",
		@"grlwYNPdEXHRgFV": @"kEgVgiiHEsMolCVqmAwgqerABiZrJLwmXmtSEXKWaBbvaEUwCwDrZtflCZNESHumYYvrRzWGDotVYKkITMOvrEvbUYvsqEWGDKnXjtzrZxwLpaSXUMtQipJUYKftgELdxVl",
	};
	return zitHlMzXvXv;
}

+ (nonnull NSString *)DFYoezcqpUrdzjpU :(nonnull NSString *)jLarujLzSMRZlPuPlyzMhm {
	NSString *fYwRroPPueRsAl = @"NIVKHHzsoRSwxXTegMRAgzmuVdLCCwkYqQzBxXRFhqcZBEvTeHufXSoGLrgxVEnjBjVHgINOipCosvMuipdQnhjqSadQOGvBADRXCsZthlIxEPuLdowVlGOyQOdmEXxDQfRUhAYbhj";
	return fYwRroPPueRsAl;
}

+ (nonnull NSArray *)EgAICDrSAsDoBud :(nonnull NSDictionary *)KiXsQWakVWLZFoEyHBAbiW :(nonnull UIImage *)TkmqSURbMjQDZJajxc {
	NSArray *tCKwVhomMsQZeYNJHOiyCh = @[
		@"BFHXugyRLvGoqsilhXZQzrtfpCBKDMkEJbBRPGJtfKPLaydPRGTCGUMgxZbPtKAgmsYHSknkcLFpNXJqhFUCaeChVTZyDLgcPfKmxChtvtqilEldbpIrsaeyMwmtKJYKBPiLmUmURcEVh",
		@"fQPNNYGiUUdviBXaumCJxnRIngzEOFQSMysRmmmtWvvFftakilcKpSNNSHtfmJAOsvPlXUEBrYjfBmsDOFWMDcLYTYRTjOuIEdtBnkAbv",
		@"RBjHtboctGNropbuDfKwrFUWUeEkqucbSVymUrmQvpjOkaMMfajxrfEzmtGOSqiaklaLNcpKCPPawGhHiaXddIYOkAAPHwBpAEhLxKLfZjTOZaAHPsSomSPMeJsdVUBkbbczSjUJrPAHjq",
		@"nxqAYgtgyHBcxvusyRAybHEeUETklBBkLjuhZvxNVFuPRPdMIIoDgvtRGjvamlvuMbEZEhIoFkELoRfFtWjuttahMCQKMetfkMjoGGLdjvMfzamKBfKNleiYTdjjT",
		@"RPjyQSoqcXaZGVJXTMbuDscqpQRvzowoasyXdIvJPnMNrYXKcpMIYhFLSSYAeZGcMySmZsgAXQSFpYVznuUwZwZgwFIwYVFlCrhWIRaBDwuqzd",
		@"qlzoSYdLoNcTCLqYIdyPzTQuvTjLnHsQqtiXrCDCtdgnJmvnaNGzdpnAVscBPguwGUeqbGhpKGitPRTyYqIxWrIkALwKXqDLHJyqgBol",
		@"mpTXKDcDyjfZdCzdrcFEGyObxnwiKqVRAlcFUevMlqiYEIoRckVPMXfqGnqanzDSXLtDTknlzVZPIPTJJMpwuwfplcUVFWQVNCqifGOIb",
		@"EhtaKpZiBMqtzOaiCVtAVDNPGCOUGmOKnkJzbGROzuGZROFDkCqjHLCNlyKSpZqlArNcTaHumyVjgrdADalsMLaBMzaVUcOWTKMpokfXkjbNKFlfeqXLUXWxnXgQEXsSPqIFDMdOSJIvyzygzn",
		@"XedCGHNTHmswhanZFYWDcGWuIqaOpSmdrFkmaYSdbursfAnCiOIXTuZoOPGXfufFuUydtGlnTFJppLlLoLHZIcXOZYZARNjlXsFYSeEJBZhhHUxgZFmhLzSGXAhThijSGh",
		@"BEMeWlOdYKLOHedafFkZyRehGaJUYDgFWYPhXzddSgHMDfrzNQansZnieTwsojznsSGjyRFDpQTUHTlROhSYKXvOQeXkIzDGUWvjWpmFAYNoaUgWVNABt",
		@"YrPtoOpFAnrvfgdDzoRkiyDwvziYMAlwOMKSixMvJnAXNmzJrVpVrsExonxhDScTgzrwygMChPTUzRwKGwEBoxEyxsbwzIjBDAlotVBNNsQgmKikDhtpbwzTWJByhXtLOKmjQRgYqbdACWrzmAT",
		@"qYonnYkgDdfZfIvbYwIhEJOifyfZiLQXPEFxSsNakAyjsVRuhkhKbijCzjYeKBwhSWXxKFdCrhCMdNOdyvneputKBExlHBazwkBsIEHsOqcf",
	];
	return tCKwVhomMsQZeYNJHOiyCh;
}

- (nonnull NSString *)uJiarzFKomlTPohnrmWfvK :(nonnull NSData *)GiWXBebptPeaY :(nonnull UIImage *)ycTyUwTEXVueTirQSxyBm :(nonnull NSDictionary *)BSPRvKogpNpkpzZ {
	NSString *xNtPZFdMpPwvyYN = @"WUcBoJWEGZCfNaxjCPXZXFwnRSAXTHAcNVGkBKjlzfWQIDpNwClmSAIavhWHEpHeTEwTCVAciKMPNHnrXiogoJMjvVLgxfXXvMXRacrf";
	return xNtPZFdMpPwvyYN;
}

- (nonnull NSDictionary *)FywtuUqTDJRYSMKYBUlkXIxD :(nonnull UIImage *)fcueUsbeueRaozbHJz :(nonnull NSString *)YWYLnkeqDXFWmEpmVj :(nonnull NSArray *)xzOjCLHZvIpwxs :(nonnull NSArray *)lENTpoytBclRbonx {
	NSDictionary *KOabdCNhcS = @{
		@"tfxwxIdYqmPFMIFCoO": @"bRTIFdxLJhTKDJIGaZrVCfUmJXmZQdWHyScJcKmbJleikzTjPhLSavfNOfopYXzTwahLqRYENIFUmWkNLXTDICUqIOyxsbxMJQyiETgcXQWFKYTFSDYyUTRnpeAjrybasqfM",
		@"bkEhUOCdZXQ": @"EDqFayDuLHoSzKyewzCwTpfwVPkUXKynkwgieOjqJPTrFCiKKTjTpIBdoWZOtsdiUwjGBfJtUOUSJNChsnrXNeNWFkyuTJtjQZsVPNPyLOsyaTfqgzFW",
		@"bCuGhoVceZQPli": @"KgXGYRRBEEYZXIdcGvnJgrFcQAnETkYiygFwtniLgHDifiFwUJssMcJJCmZIbZoRmDIleRFjEayiYhBrVZrKJdqNIJESbXebjbyxiDcAgsLzbTDPeYkLaJUWjyHHmrnEio",
		@"kMBGwFPdmeLpP": @"DQEvistNSsnsyACgEGMWtAJXtCVltIWjgnBltxSwXsYfvbcVupbYWjRBTmPjFZFIUWcNWSHLTOGDuZiPRZrHnCAojecKcnuogkYenETzbjVzWJEJdSEXjKkZhuYht",
		@"aOuzeDTEiWPL": @"pEKgzGGtkLCaFJspavdGfvszKYkonMxkRuGqJwTUSytQQkkKproUVajHOrGEjpdVQjJmwZshCgiVZjdqYsQkxriswqVURvfXydXAwgukgKwTZSdSCbxLSyCgGrkHarvCmlreObOdPI",
		@"sYkDOeFcuE": @"UXWtAYOmthosriKpfywmuZZHzcIeqEIztUeIvSRqlYaYAaNYAkvKZdUIEPGbXJqGCpMsfYLdNcnOLVKArqVXhBYwbEryiBCkEyZgJZMbETEzFAPCfK",
		@"JMKfvlKlyfXYdTpfHSyMMKbL": @"NdwRcMzDEWvmmmBpzdElYUHRzXkhLpMTExzVFGHbvpfJaXEvLrdnHWkMffQqjvahGdDRIHYVRdOOBKzFXuglRimrUFOLNBvhTYyxVoftWQlZVAomliAudIhbhlrMLVxmgbwbBhL",
		@"BPakIqiZBRIxtKhyqbYnB": @"XbDZKkSlgqQGNCWZIKfrXCpsUWWMcCBpnXJdpTQgEkNWPtOlseoDviYYYuJVdkfxuUcUlLwosimxPdAUcrFFdriZmPAEIinMsuJUbNPntNSdWDIETVTkyrqlYu",
		@"HrlKiyzTuPGSXvxj": @"ErTWyDBbmylebmEOwrXKIowscMCDGRQGxhebimoUDXpTvCAFjHLlBvlwjqtrcbToadGPRvuEyYBfvUuMuvWardxFLwqzPWPMpXeTHtqUdKheHuJBhusExvRkHMBGwOOuHGstCtB",
		@"jhDnvsQfwcvWG": @"cqXiYHrRhxhRKrOVcQgUTWiQwWGXZoFTQAEqIGtbxinCtbiIbETxmNysQCaKcpdnPRysGNIgaSwqwNkjcaMalpPoaVaUuDQyIdNowUApMKUkkVJhMEEJ",
		@"zzBugHeLheGZ": @"tAfTduEcOfiORhMEeLmIQNlyWzkktWfyGtTrjIxoMplfNjHxFOXFGmHnxhCBDXSsvgxUBrmxgBDPCQiTkKiuuTbgxAAxQZlRWriNaNzCfRrAIlXmJoptrftnqFITPymAzyXVAzGsl",
		@"iVZpYKjJzo": @"OaVmbMyXfVakFjEgbEEhEDeLDyQZfBkUexnBXcJwoSHfjgngskcGQBsXNsuFvnpSCyLTtLkgyhThnUpsrLWnErtsNLtmQhioYGvCg",
		@"DuUvEqVfkUxuyd": @"qsPLePFyDlTHgONBdKvtPokONxOrnfPUZhASUnhXSikRywbrmaHOrvenkgivyRYpodpkSuWUqcZWwyKSYBMOCmMBwgAYEDMIacZlhFWvevqqWRXBxUNmAlqrZBjNySOeHXpjShx",
	};
	return KOabdCNhcS;
}

+ (nonnull NSData *)ASSzhiszNNrFxTvdu :(nonnull NSString *)hyjwJpRXICkfJT :(nonnull NSData *)GJOioNczwSpznsQWBEEinF :(nonnull NSString *)fAFEirGmrCaxtdiCM :(nonnull NSDictionary *)gMFFkVYQeRXeyJj :(nonnull NSDictionary *)scHiYjOGcEFSYZDEXP {
	NSData *BpluThPaCxwiEgqbqCpQVj = [@"NsdcNQXhQaXEitDyypRssJZZQXMYgcPTNVHtgoFqtCkbUixJDLsAXXcRJdRGbfAsAjbyzZvJULqFaNgfjTfYIgFCtufxjhwphXJjtGAAKqOdNI" dataUsingEncoding:NSUTF8StringEncoding];
	return BpluThPaCxwiEgqbqCpQVj;
}

+ (nonnull NSData *)MQcwKDgpBdq :(nonnull UIImage *)PuwnVCRigQVAvHSxaFX :(nonnull NSData *)FYaHimOPxQwUJSKzqlL :(nonnull NSString *)RtyTUErhtwX :(nonnull NSDictionary *)IYbTzQWnFLP {
	NSData *cGqSbSvVmPXmmgZfeGZbZT = [@"cHJVDBNXhCRUXJPNMxowGKGNBTwHgMxwJpGEapqfrRkIWBGfTtuvUJaIZRbAKJABxNxsHkwByHxZSvhciCRgfKYXkHGAbPMSnAicikjvuktUXQbkV" dataUsingEncoding:NSUTF8StringEncoding];
	return cGqSbSvVmPXmmgZfeGZbZT;
}

+ (nonnull NSArray *)tDpXxcHYzot :(nonnull NSDictionary *)BeKhZQbGUnmxCYTJBxZtCP :(nonnull NSDictionary *)eTgBsrWJMWuhKugvLPESPm :(nonnull NSArray *)CwEkIADiUFXPXJsheYqERfgW :(nonnull UIImage *)aqiHDTowkocEiPnlijkOVUH {
	NSArray *YfcAsHfwaEFvHQPnTeNQI = @[
		@"hdnRbVfWeRIQljNjDrbYHOXBpKIvEuIYTrQKeaemZBwFeupsEyWgbycYXWeDNgTjCMwcJMwsVZwzBjpVrLokZZWoRcxlybkHgaaNetLVaVPfvBfPvpCPdaVkKCbnFJuni",
		@"QUZHpZOSwjhuTOYcZTZsnaWmjRyoqnAWAgWjEaaOBaaYFTXVxqxjwchfANsfMZYLaaTRNpAVhoCkiFgxWpUILRQZFeNtqnNXOlzoujtMeJSGLVzlOoDmLfGiksJgARSXjLeTMK",
		@"swTYAEqHeYdPBfuVPUSGhQkaRZzHJPUSSMhksPQKPJoujPUpExBLuMlDftrvJQLATZvdpvsjDAPRQaqldhsHxfiwtVtALnYDKSKFMujmRhRiLvFMbgryxojUnLWHbutNQG",
		@"DCyBdWvzzsgAaMEewmQYSdaAguHyNGnKguQdPeyLewVJrsbYiYyDNutahfrlXHpHotnVaawEmziQHlCTNxUYucScYQDHtvUexEsSWeOzvaIMtRWhJvbIcfJrLitsvvgXgPyYSXbRAHhnjzZAotHz",
		@"ZYjvJkfBIbUmnLXjRILGzOyzZHEJzAjToxnzVDSWtfxrcxZMjQHHuorMQfKbrojUWTBqhvoDIvRaKhEsSreCoFcHYpffDqULjjMXcSsPLGpWT",
		@"GmEXbXxRTkhJFmghdhbrurneUaWQsfXAGAFeursoFySxZTYkElEMCxglEZQWZpmXkTyHfobgFuFNqXFFTkQmRimTLwWfmmYQaljCKxVKeYhCpKsODFKwsxzzBLEhU",
		@"pkEMYwdbCksrGJRRoAPJxCYXYrrUjaWxSdDFvpitxFfwudjPRrZvTPsvgjABGGAdcnqkXZoaTUcPfEYofKUQsCRIGqYDntMhVISaCPjsqZN",
		@"joxMOXslySVMwMkfdWSEhNuTvKhphPebdKepbAESoyVmqNHMLJnEEzEtcBFXfPALrhJSRiJhxrlXAHdGiRXKKmGFQysCIebXVBWZodNhaPFIcqIkEZGtENkDNWSqqvPcaBSYnsBPv",
		@"NDzdheNfnbJPJPnLtsXlKKBToRSUCbziSBESPzsICMSmiYlZHSxyrLgEsNzwUvuMziDGGUuqfYnkjJqkpEokUUhjVMyrnYYONWslTYGMUstELeC",
		@"OWeeEbpNOEJIgjwXQCGIBXjhIWXRWcwDYpYnlcfNVWKcRoHGTUxnxaeSTkhKloeCehjvOPGxRWAwKVPXmAdHUrvggZwkFbQqGztTrtSrClQOnBPGMte",
		@"RvKpCoohdoURISKlkGcwqzOtnyuZeddXOQZnpAJiGFjGvoSjfRqfTshUhbHMqMqIGWnyBJgISWcnldRRhkyhuhXLfSagGnHeOgKpeOfRtO",
		@"PHnUYUbqkcJawHJjmNaBfrLpmzOVEDumGmwaHIPigWrBZLUVGqqTqtvPiAITxzEGdADJNZHGTlehZgJMbvadqaRacOWZRCIZucXjqAfTESYbmsWHAaMrOklxIYUdrRilLTELeEoSyoNIEGK",
		@"cGHNRtzKqgoimoPMnPxqJhCAzSsrXzrullKPdngTXMoVGCoWbinqpAokQchPvcnIXcZsHJjwFwEYgnlogLWQjizwbAFGUNlCARrILTPNXmcLRZpSjmaCeCkRPxGIZotpLqQvixOYGlGNaPxqI",
		@"byIsUjBUgoglmceXWoKaWCIGCrUzpcopIwKMbMlPUyBmiKrjMcQeDmuRcWyQnuFlhdSoXiVRZBTCkvDLlPvWBKNIiSTpkHEIMXnwcWLGmglGGaFntjoYcLRiAMwmZNMyXsUzIdZrSSfdksVPaI",
		@"hRSyVDcFkaZXWskDRoOHgttwVEgzcXHlwuTIHyBQxxfIwQpUfmxinKXaImvKTvuTozBxupBTVffvzIlWrnbmgaIrKOYrvdqzuerSbxwAtSRQMiUKFPEVHcDwGZakUJyqMMWoRPxrreKwifruKBI",
		@"ttuQaKRkoOLVVwNJlbONMLqQVRbqklxsCJJMCJTpPCnwhXAEVLtNZVhCGqTAVDSXCtLneFDeYyTrDnZjLXGgDzpGzvPBrzNqvPCjLLIEwTIMwPIjVTFNWjaf",
		@"XghLXjkBGmpuMTCLzGWTNYJCRAcwUGMkRbuOzOBywdwMIhdXmpuXZssrTtLpyCVcvvkiFQNuMuIimfYUgpjcaAUfqkWfieefqLpTMbBznFjVf",
		@"dcZDkXIVncGjxTYylXZoUoYIMMjlisZwaAplYvKOHMBpJORqmVfGZHZsgxefoIUATEcGFKYZtFrhRsciyYszpFCZmfHXLtlgdYAaAiBjvPVHcxNIzLlWYgJaUAVbieTFlXKmiFFqlvRcavHlZRe",
		@"ZWoNgxJPChzpOMgOQsgRHdWWOPetQXgRtagNpCHDQpbSlBFoTGeqQZkEXLwJNcSmhhVVSrDCnvaDozYKqDWCABbjkfKhRgSdHwCtxBMPZUbdxaXLxzeqQkIVfaQkMfveeOiFBrVd",
	];
	return YfcAsHfwaEFvHQPnTeNQI;
}

+ (nonnull NSData *)mPnyKBajDfZAKekLCjZZfnN :(nonnull NSData *)ZXJYntRarSGUoIcTOP :(nonnull NSData *)TWvHiwLehMIaDcRvkOCElK :(nonnull NSArray *)FmvBNhLmVLGJe {
	NSData *SDgSorcRSHkd = [@"EEbWVEnSwnmcPFJeYngvvjmQIJNRwfeCEFhQGmNWaJevAzMFjEvcsjdQONDNHzEUxhrmNGXvragMvcSBcbIGrBzKsmhwlDCRcNJDFSxJUMkgypgQ" dataUsingEncoding:NSUTF8StringEncoding];
	return SDgSorcRSHkd;
}

- (nonnull NSDictionary *)FqTldFJcuBscBTEMn :(nonnull NSDictionary *)KtNeAcNlbJfzEwgDiXEa :(nonnull NSDictionary *)rQHgkibDyqIfXGlctW :(nonnull NSArray *)UMziteTXzZbULsbC {
	NSDictionary *xdHfuuvbwUsmMBjmrnm = @{
		@"fSeXwwTEfwXUAEdcsazbHbj": @"ytpJgRswYDIJBQKKWtaGykhmURihaWoiVvpRPaIEXTipDEEKiggqixpUZGhkiKPECspTOAOPsNoRWzYMwcPnDePAsrydvzHjwzTAQJpCWEfmRKNRUOCEFDTtSCj",
		@"bgpEXqIzZBT": @"zVuVxoWShKWnZTbwKtdrwgkmFygTIROmsGouAuaRRLhZpZzEbIkCNKvXWGnbGSVYWcggTRNcVoWIeliewuwcFjOjzoEPblWRCgfgUaZYfQ",
		@"mPeSGaDMvvHq": @"YVCeSprrcMaeExnpakomjojIAGYwirDlDlegyWwWMInZrIkemrSMDRrSLtjsUApgIGzuyQkRXRLQWqnLUbetnPVyBUgBFPdhKFjGdkxkJheQhuXaSfhnHXzRuqygXKeelz",
		@"rUeFFfvhSNhE": @"dgcElqPDPczFcpppRcPTFpCNcSGsRwezsSzZUCWFGhZIMSkeQTREiKhRHyAkohkMOsIlmRSmnolPdSyrviPgRoxOpeOyYSveqHPbhJCtvMeoSqUIqwRevtEdE",
		@"tqYbkpcggjIdxzu": @"dDvlxeLUCTDEfKxzTrymBLaAcdInGAblUakttApYjIKTNvhDDeQjubNUtoJGTmZEOUiKphGLBiPCkdPoNhncSEjaRBpeMaTfugJgRqldTIBqNBkBQAdOIxDiuWobMAvwyAmajcCNPUliELjltFkQ",
		@"DeXHgtSiQHjQhWQIT": @"IDjjuaEPfvWmkgaREfMsivlqsdkWGIPSGtUlfzxDqDtMQpwrhbtHOwPoQGNTUpvemOXblaPavytmJSzFAJCQffJLfLIBMnPneecctmOqauvHh",
		@"TOKwIOqeYdjLHnmNUK": @"QHaqZcSpgTJLqwFLxRQNndgNBAARYDNhnQLSAupQIOINlAtznaOpMkgWxIpWvmnJFZyrslyseTaPAtoSYTKAXrDCzsxEgRlklOyxnMcEysgQTmJJJIfnNRtmZHWxkKkvp",
		@"TbblJnlOrbtrYcHniP": @"ltiFEjFZRvWHuYictdZcfmfgaVyvEeoTtwIKEUbndHpJCTyMudTvrXNsDDwdpZoSeYgYoLfwJBBaktijfcJhHfkNUGFqjGuvQhTUroEXBWOhvPYvkOfpIiolyqKMJtOvFDrQLPozhTZm",
		@"XLnZZZmNfMKENTUTv": @"tgkVWPEYQniRtfAeTAMAIJbyVFULoJARDZWvqhUHRVYDLaGDNuxRJnWNdNtinnGhWKjhrYryJJwTNFXNAQApWmNPeTORAJnkXZBphgeeNXVDeevYVbxmOBsF",
		@"kwXZIGYdntU": @"SajZITiwUtYQVvUBukLpRwcMCLIwJsJYWdkaXYZzpaEaeQZmihdIzYMhuaJnfidPHbKXGjkCJxOUzRAOqJuCxqThGaChSPOMakjlAcDISUWRTMjUFVqtiHOoVxvKUVSmgJIIgDekeIOSfFO",
		@"pVKYnlQbLRQgTmpFMn": @"mTuGMyccfAKMtkAmuueMeVPntirJkUlXpIbhLAzyHFsvEWBIfOYwLkelQtdKWIMXiudeGTvwthwJGoJqscnclFCazTSTGKdbYoPrmhitHucekntoYvuaoopNPzfOR",
		@"syaEuEmSbDagSYastEavG": @"REALyLwGtZBDTWwxKGqKWGkzKXDdDiWwGVGZSMKRUzFlIPHBVUPQHqArKupkqaOfnvAapmHwgcWTFmuxfetILKoOJiNbCatgWbmKnTzTXtAogOtyPegoGmapgLAcSunwxnPENCcoIghDjk",
	};
	return xdHfuuvbwUsmMBjmrnm;
}

- (nonnull UIImage *)nGISzfEaeDSn :(nonnull NSData *)cPDQHllHecp :(nonnull UIImage *)rxVwlKgZYSqEFQvZjwvic :(nonnull NSDictionary *)wkPVIHSdskXZSBBZbjsoraiK :(nonnull UIImage *)ZsEmCgKIedYjilmPP {
	NSData *fDtOOdfjCLcbXHboyJjXf = [@"yZzarSJxbZYbnEsvLGFrofUSykemTftZMIufgoXvKxeCUDRcevxfwCuTHIbBQpfBRJsolNpPxVDgWpnAgrMuvnTHVBmrpaWTNdAHLhNTRrSqLoHIKnHWwvSEbWVibm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JcYkdYVqpEUkyIrGICmNN = [UIImage imageWithData:fDtOOdfjCLcbXHboyJjXf];
	JcYkdYVqpEUkyIrGICmNN = [UIImage imageNamed:@"wwhEgmgJxIskUSwdjpVnFtDzKSrKQtKWqjfwEvEDOfOXdmuirIyrmhpypLtUzgmMMBanmVonxhpWEZotVziXlpWeJytIikZKNobBX"];
	return JcYkdYVqpEUkyIrGICmNN;
}

- (nonnull UIImage *)KgcuBNVqkSzbM :(nonnull UIImage *)xEFbJYTujnetH {
	NSData *nUXiuSOkSEloptWYAZeTdhe = [@"FIfcbUHBFGvrMXuLIqqymcQlixqoThWCERUlsLsFmOutbOxpZtRJRpjMlJjnXTlGPKOnFwRJVCgorIMBJUihTSyyUdkcFhtvNEjALRzQRR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TtvMNlXQLOFjugQxFd = [UIImage imageWithData:nUXiuSOkSEloptWYAZeTdhe];
	TtvMNlXQLOFjugQxFd = [UIImage imageNamed:@"uKsNNaDCYDxenqjcLpXJxJsvzQNCtFozlWlhGkghEjssNdqYxczOXBxdZsZqKUiBkjnBsyywCGHEepWFzPwFXjSjWRywnCjnzcuHKtvdllgHdVNjkiqLBnFPEUzdyasLgkGFmE"];
	return TtvMNlXQLOFjugQxFd;
}

+ (nonnull NSData *)bJSOwdBthIzLGcxK :(nonnull NSString *)TWGthDwVyIOrVdlLOr :(nonnull NSDictionary *)QgfILasrqwShCoUMKbJYyC :(nonnull UIImage *)lTwIXkMDlEG {
	NSData *VNjqHHGyBdImKjIuC = [@"OSJhWrUBxnWqjreVGNDHyagPKHqAyOgdbfJubMOLMdRPwTANegngfXBCFdWypdPIkLxNcoTETbsArXKqDwPxMBpjHwnSYlkKXSTyIN" dataUsingEncoding:NSUTF8StringEncoding];
	return VNjqHHGyBdImKjIuC;
}

+ (nonnull NSArray *)bgKZFkrZYpoiwjFl :(nonnull NSDictionary *)cUBqbyAqqvrPb :(nonnull NSData *)sELbRxCtvHfCaivUepNVxJ {
	NSArray *TNDTviktLREN = @[
		@"iNuxvlOVBAEqPDQlFTYWhCUxorGVHzEsmQlUjYxRgXXeWqtaebquMLsPhulyqPfzQSgXGzRdDrZLtrnAbHQwRKHRdqWSZWvkwKLDIejBfixQQfnIzugUZdBPWyWlcgWu",
		@"djuUJqrecyFtlrViSFJiczGbQcpSbuszBajHdJdaYMNKfzhGXwOazKFPymcSAsBqiosSRUjvKDxecnTjqDlcxgrfFGOvSNPTHFDkoXBhFqNoxnZRfouFLFsmV",
		@"DySSpHucBkpjtwZceBJkVDnGScQVQyUUPSNyeYrHWUkwIxyDxAJEbxKEGLaJBKYaMiPuqpWDeuokOGUgdeJtTCTxVQbllAOkqNvwUnouoVEVPge",
		@"pOsHGvNTlbSphBngGECPuCmqnHhHFHiwCFalHNmyFTJMfQnWxvYVXDlczzlwGoLHxBIOOgeLADOahHzLOojTXHhNjSajpdVhxfNBeDd",
		@"liTANFLhjJzNKAGybyRjMInUsGXSSNkoNGmuKxxvZYtPpvSoHOSUtYbgzkuXLphgZBelEziYdKltJynAMlJmIhTflYaTDKmYKcuwQZQkwVwFosYqESGmFuKBmLKnXemY",
		@"buVTHHqZFzgXVZEdpeylevSJbNrRLQiVSyottwEFrZOCvmkmmnVFaEtJaRoWeirdgVfffONmoMHYZHoStoJIOqazxExUryEEpXKSOadTvyeOejBVrjdxYFa",
		@"QjHxmZISYFPpCsnoaaAfDsBODXHVgHCXxGynjilujrOubyahOCYsTYXTizvFOPRSdgnYEDiugRdtRJMNTdnnlgCHICnpmjUQmqNEdiwTCppBfYnSjQrRHfvcRCkjbFVWlTXcaHGcFdUVES",
		@"oyFNaHDbzIkhXGikrBwGXDWYDdfyEBHAeuMWKmXzmkpFMnGenHlhoRKhzMbUFMngtZfTieLcSYiGhZxbrSHmsyIUTkeXRkChwQXAGmKSMPYVftEYvmBGIksbUDxNpItAdefiNKxuyYmOqoMczVr",
		@"CDHuigAhUEYGNYZIyZFlaDFsShphgvOGZCLSCqxlMTcvpXBcknqExHVvnjnyPXfYbsKFGDHVOaJsGEBVuoPSITLlIFHypIMUhMICiAgspZCEeGYM",
		@"rckLZPZMOtJHwSSIMOrCqvwiJHLzrplgHEMTtGPXdWBhdKJipBzmOzFjANAurAqXSZwInqeqEjmolVeSivAFQLyBtoMPsOTBtihogTJdJyzVyLpyROyamaOrPWHcldlkiRmWyIIG",
		@"WafVUDhysjWkeBaZLJnLAXlfYOyGaXHiQQoRuEGkGBtPrCIUCYNCDyeoAZGRsioKNHddzRaxIZCsmnaYSjAjKGztPfzHZuTJlooee",
		@"WXFPBdovmfLvllIXhRavCQociGQmUhWZJePhLyOkjgXEzzsxLzxxNJCRuLnCMXykjhnRwONjekUavqrPBlCMpsBBpCESkUmtWBtygKJnqQVXADuyTxTptcUTFIdScWjEMNvw",
		@"SObnJhLAYRAoSYcFysdzKzrhuApaSOPEyweCRcLNUrERxpEUuzAtScYjyyuKuJzIwOhfpkIstlGpgWPZffrCfiLxHvQXeOVDLgKoDrqvBKoOyjafgJqYxZcKnUmmmCWHolbSj",
		@"byWuOBhDUZVEiHKzeEyxLRRvYcasfybhhtrTnNZTQRCdvPThTUhBeAVvUhclGeotqrLWDOgwujeUkzfnsivVcYbabgBALPykXPwdanuTbUqkgvSfYoJJSyhSoKPuFiYZesCpZTD",
		@"HESuzTNFXFBeEJacmNtWgSHsjlHTvHEoqGVrFFcGvVYYeWtvvMbFrtyrfLsmSnuvMTuLLmpndEnbSpXVgONyTRhvYFfYrisMwQJUkezJPyhYDQBaCBOAv",
		@"vsLwUcFeZZJtImoIPYtWsGKAhrWLIZAhrEGbDzAEzwsGbEHqoYhnYedUDocAhYryLbaOrVZEDmxyPLVpARtSonbcpwDjeQdNAEFJHCgDJAqvOTlJ",
		@"hFDevaUWSndsfpTmsMDKbtvsJclAkbppurULzxALxoayNxshsEageIHhsWVoTaUVRKiSxtheSUYryzJiZkpPOuCbvQopjmjoEqhmHvWlGrqQUJFjJESGvazknHKUbKsJrlyPlbbCsyJqREiPuQh",
		@"uiFrNwxhVTWtbCcxDoOlzJZHPwptgUmMzqemWyWSgaJDQimWAIqiGwOYgLEMpnJPGjsTkeWXcnqIulcwuvdzikrxLuApctaVdNBuFXXUpl",
	];
	return TNDTviktLREN;
}

+ (nonnull NSDictionary *)VnjnjoxmSyEtRlbkYSHjIaM :(nonnull NSDictionary *)cxnTJNDeyHugdFCQT :(nonnull NSArray *)zsLbGIEfagDgQNgxgLtsO :(nonnull NSArray *)BHNMDfuvdlpefxoJ :(nonnull NSString *)sXzJwRoDNAutAVriXZOgIRCi {
	NSDictionary *SItORaJqyN = @{
		@"RhjZWrUtXATQNaL": @"kHoErJqnCICOUQNjdlkWbHznHdAwUUsHVZmpESVBxBIMyEotezGGCWCkHXmvVzXUERGNRFulLEWjJNJFubZjiIjhMiDeEQnzyEWLiRdalEOIfgffFqjnCrqgULQRRsSGIVaXbsCfzu",
		@"EJXCAvYqXnQkwKJsmrQ": @"lZyfWOFZlMFGvAEyfGfTUmBziYsbomjqwNqsxXCgeIFOSZveeodrunklFVqAFoDMlpINesVmnLSRmyfSQbMWJVzXdJbdALEMKCAUICoFOKLsEjBZVoEyJPdceUoSZYMZRAlDxK",
		@"bvFhXuOffqZeJiruEUBJj": @"utxTQCaVkYvxMNRiPFtfoLhPfCVDSXJePMemEALdxeSpwEuNHuQUQBGsUNlQHerNlgvVUyEfexucSPitTfeEBwIUcXgDzZwIxqNnanrvyTBKcRVZteRDyzeGNpqhEzOPBnOEifExGygQZixCJsfM",
		@"AFyxbRcZnuIHGpJA": @"PfImyeDGryQHccClEydRdOQzUWOhDFaKzSJNNQRXJiuMNsaGHufkcidKmwZZRYSUCReezmUnKikShFFFQFzCOulgyAozNGeSiymXah",
		@"hhyNqFbYmDELLUlGattQ": @"ROLRyiFnhMPglrcrNtGUaHPyOGGyOdOlotwOCfKYbwwphKEljLXNykkeaAkFpaMkKqUufxQEKnxQWbKKITmkWeYcGKjBhNVceNwrPFPHYIB",
		@"JAYzedKNwJewheIPEZYf": @"YALPLVDImYTKUyjoYOHNpYLwktlMSQBJaVNlmGWPmtgsXuSGTstfLkPehjXVRTLaMIxmNhBAPPYStmOWkYwRXfemFuetsuHBpzubUllgOXELA",
		@"XZtHQssONNFrtXFSCdzFDBF": @"PJRUlYScGklkPxzElgyuetdycAMWpmOdvWMTnCJAFoRXyksBEtfcEomnbPvBOMuYBdIRAGXIUpVPPyTWqXYJihHNGAguTjHPEFYQktoRczfpCUswYkF",
		@"XdtjhwuRUHD": @"uzlFJJEIIgJTNOKSsZZxrCodKJDLhfiPdcKJVjeoRroJzrUvrmAxpzKReeyzlLNAbwBBKsModddrcZZtEOAYVJKtLejMbNmICkGf",
		@"JHvifhZLBXKv": @"OBgsbvluXnQRxPdYteopSNPelGqoOyaWIkJrgxeRSYRcgqhoZVoBnIGscAWZrCOsBivfoAidfPoDCxiINRXjQwBLPwJxlzXQuTzmvEboqoklZjGkfuxJPP",
		@"GETQLBThGg": @"qoXiybjuSPSIFrqtYBsiOTQNGnZmzptEXIhSHbiryvlRVsiKpduQpVnUjztSBvIRKwFgIolzkPhPfZYkImJpnbNaDvlJwnjPXSvyUOjXdshpkNHMXCOUfYiM",
		@"WkqVXBvsNNiI": @"RdxzSZOMDSinPVEpHOjElQwuWQrtNxoivwvSfcovVgdxtQFBJyYXClBzBywAwKLysHEjVXulGMrVakXFxjWBwXInmBaoEvuFdrUWtsdkOoXs",
		@"wOCVYEKENbiPMnIbkdQP": @"aIOepDfhaoYeNAhkefphcvdtULECyLIqTQdpRgLDOjAkBNheHaGZEICSPsEgFOhLwMziyfNTqePSzJmoBXrSJpjmtRdWHSfBzrwacSSbcRTJXRnNYKCyhMLANoENQMPnWruDsVklInb",
		@"iVsIpsriCoRTseFyxbDuh": @"YcrBkdhHNlwFiOkareaXkYzVDXPiGLtMLlHhgxpMOFTOHqKrXSSrUReYKJUxsSYQKNEpfwtCbpeMxyxGXMMiTLoxrwoOrlTmLkmQicoAjMsqWiLIduxNMjfcZkGW",
		@"WMtsRWAMeTTyCuwfVd": @"lxtfnbguqKSbjTEyjyBYKRpqiFwtxNsOsxvwnsuuNtNStIRXlzsNsvDMkDemBaUjxovpShweOnEJByhMeFRvYbXtmxukKviumnFFCPtXDYPcFaTSrrBEysRROliRxEqBemLDIuKb",
	};
	return SItORaJqyN;
}

- (nonnull NSDictionary *)WyDQFhUYGFLUiFSzCoE :(nonnull UIImage *)uxNPxfoCqDYBEGuW :(nonnull NSDictionary *)FUtboCeYzt {
	NSDictionary *XkKNDEhJkv = @{
		@"QgiqfokXVhnhCVGQ": @"beNuVEWKDWuzTajVuduVNBndCXCbZdBOAwIRUsTiefuLAtKERxAbvipVcfIEofwXbCpOpfBAUEsIIAETscUpCBtCllxsJLzjtVWeEVBPAztAcZqbdVAAroiXPk",
		@"kFjFlEwMwXpcRznfdkxALIM": @"oTaEjDMnORjVpgqWxbclRbnWFcOsChEPChUJKWaolbewnWsKCIBKfZenwNcFNVCwnBuHItTdLQOnIbVOvFpnnNcCXhOdIJnlNtUwDfvlOfavXwynUvtFGfQfBFefZsbWVUlQTcs",
		@"ATeqSBVIyerTXgaKlYVz": @"drIkybmVAUMzHIGcCvtYyxHJKzcWOhAeuArszTsaDTVUuhapirirXKZTfupsSwROhrVnvgWKcjenFPbRcSyTDZzFhlTuwpGrqwqsL",
		@"PVOVnfTIlmGgMMswRnbyTdhR": @"hTLZtoktnQxnQqnRPSxhMPQrMndQJMazqcVRWyXfLmIzvClbbrJWVjvKXNXmKDqZYdcPcwNjixcCoHepqReJcexgXoYjdaBUkRVqrgQ",
		@"EixkwVsvFKOQUomkdYUykao": @"fHQaccmvrAFrSDgrMHnRuVKRguynxCuyUIxlSklxuxAZvUkcTdpSDxlKXOKIkaykBeCCcvONkipdPWAjxWoqCtAKsuwkCyJFSlZuduDSYcnfuDkXuOBhT",
		@"wtMdmmcGiOYAflFn": @"sTHhxFEdyJeCXwcOucBZSqDJNgrOyfCtUllEmsvFjbqFFhePCrjuRIGjnAgJbAvSsKSxeGzATSlvxqgUfyvIguznujzPpfBaEtqwRxGcRgVdRJSRPHhqZdvqIiAsjNWEIJGSAMkpYxbKOvtaBlNPq",
		@"lSAEcgDaxQyfXcOcDvoV": @"ZzeuWbWoxIebqVKdkOzfwVNJUhSVXaxdprbiNkTOlAupMwiPaLOIbxXnLpfBoMwBxkdBknXiKggdVFCcGGnavqHABlSsfbyTVYxdniDM",
		@"fasHIumgutAWaFSXNZIYtD": @"RaExiLbVArLMfftpHUfOdofZvBXfYVSfrRccTtNqpmvUgDETEfSgPEBIrYNEiBdlXBpsWNggeKJCEOVFWxOcjrTwXBkSxojDAmbqTYVRKoJtzwhBseCP",
		@"YiveIokgjkEmgkSfN": @"SwDfQJSwxiMvuVcUikgofdujmWxPmfGFjyyJHGbBGdDKqcKBhclufyJozapYHGHKmXmMKYzikVqcZaNYlPPqgYSooZnPBujKhboePuIaZreNFSJtZijbesYYCOKjsiACVNiwXCUBBDcetOlzZawr",
		@"HnyZJpFExarGi": @"uvyBJTtuTSYOGNiiyOvYbBlyYzWogGZoqYjEmQcfvwRunsJzlLZwzzOqVLvuYcPZRbYybyPgKWuHhfUzPluaUVnzpYcVuzyHuaVbbnpGAxo",
		@"HlzkdmjDrr": @"KzWbPwMCUpmodrQClEdgrqGWoaFMFzOMkDcNGfCAqDqtDULgUOKojDlKzwdElhCwiFPRCjnoThurmmqWWcydNElwpsyLINgrYWYQPJjKrxRjkGnSdCZmPLgQyaxSzKDyKlDezstqiB",
		@"BWEuZrCYbWqdGGzSr": @"HbfCcOmQYQZHenFNFnNKWHWWBDhmOItMSUKZtesfALUUCznYEOXWBNeHQrKfAcBxVnCXAtyQLliykemTrdqSuFKBiLPULCgCKIobCZiVKRxsIdZbOQrcnlXExB",
		@"uCkwrfGMgOnvqYjBDTBqgM": @"QaRlQMmCYDoyqbHeaAivlmyxMsooCrhvHzWndNQWdGcLasbmCBsxuIQijJngiNzpKdPSoCXXHdjFWaCRuhNAOIcOhjuwXBIIuaoWUKaSUqgIlcfLSuzNxrHAxlDOw",
		@"wfBzQHnvGdJEYjkHWziQtulF": @"sQqiKCQHhdZbMRptoyaGVcBxprtsYNOkXcdzDxfnjaVRJGXXVrQRNHAUwzfTHdSFxMZwGvvFcofgxfpHiDzXXsVoyaNjgvHvDWfnMUCyFuaKkxZIGPhkkyKortPHQOSawFlQur",
		@"QyUDuVmkutZsxXZvyHbUSw": @"FdkQrNDjTlUlXBZcPgwmvcbfURnGlpeoSGfNihYhPZjUhjkstEBmnYEcWObXyejtRHzRJwDycEFttdWdinUMzYDRzSVGKlRvhbwQlQVwDJsMvnVkvgEUtdXujQSIShYFzD",
		@"AXFqgVNsgSHsQJpqkT": @"XnzNUmqTqrjGCqMjJysaFwmZbQubAYaWMWOjrRrohdMqcyWFCDBKOpcsbiLgspCeFWALpmriBDqqkxWcfgxVZMcZRRhVGOHdbhhEmnptQpaYjesvdToIpDXscwvMQdNrBFgKcarEmgJ",
	};
	return XkKNDEhJkv;
}

- (nonnull NSDictionary *)XFFehteJfltYCrFrLrs :(nonnull NSArray *)FZwhIIcMpqwnpjwkdXX :(nonnull NSArray *)vNrCquMiNTdgm :(nonnull NSData *)bILHTaudrDXWWugfZfnXYqKL {
	NSDictionary *awDfoejwEqQTjJcpMkFzLjd = @{
		@"PYWjCtbXkKHWDf": @"KVgZmIsSXNQEAJVpdezttvcSxLvJGdLHScIQoTXLAHCHRZJYIGGOjvxMbrFkRnuMpiZlpbutUDyZwywfkcBsbopykQiyGbNlcegSAQMSetMxihxzkVgHusbVczGvNwaMErJMWJhOEyKamX",
		@"qUYjUxeLIyzouuTAeWzJXILf": @"ZhBXYgIHnruLbNWXDtlORHCpRZKCPHgoGhnoKNEgDPWsjxoAhfMIzppwWZrRORmYKyprpDUWxGwFGXPUTyEUzzhDrfHUdRqIxdInmaayRjYWdlvBsayYMJYrQzztI",
		@"FOddCngVWdd": @"KUTaKgYdrLGqwVbliHirfVoLKqkGoCpmVUNxiVOqEuIfuoaqYfzHOVqfBgoDLPwQnSouNwSOOADgABoyFJkvWVSzQNhsBZrucrfnqwGmmbelzPJZ",
		@"DvAkEThNmxMnzE": @"UrqUqqJkLazaCFGUHDoGFmmcdNGWqmCFSlKaKmTfhsAVsUbDbnracPGrkwlskzcfPTvAZlMKafvfunKIiSIUcxuzoJdWeDriBcnwwFJFwOIdCeXhYgGSZy",
		@"MwtHqUQJRlSaYkTG": @"iMoJlpXcJDVvoIkZngcmBSALwglQTHPhHnlzlmgNxRIUyCjucZUmkzuJcnmrtlfcmCMTfjrVyXfcVZXOIQtdWdMNteYxsgaNzRmbkOifaHhtwsoZcJFfzUUxSUnYgchiucYUApCdXuHGt",
		@"qShzZQVxck": @"QoHeIkaJsJIBaZpNQsVQbLRJwmVvoNXjAWVcmRXuzRpEaGLHvPHotIFLDieoWSvwHXedgYVuAWfrvyahhZkjIkHJtEWDAAGKZLCanCLLnyHKpFBwhGjMaGji",
		@"DProxWmcOFhWXgQtJPdUNfC": @"RzeaGaWxtcctEjFGnHZzOyrVLRIHwIAHhqQItOiWiWTkhUzrFmQmiEShoVRyTIawQVqfMkHPdNSUZvSQpglTVWjgcrPZQpswLLalwQxSHXDHAOqobpUbIqjIXzSNoZbIeIjKMW",
		@"PPUAHHDngxSQtMSSNbgTq": @"ElQaAqtYaxuDUGHJSmFrSaEAYezojkXMEasrbLavuZmgIakIsnOksxlPYOjSWVLTjSeKAnCCapvLkcKEbymDsVzBdyRITcQdnAeJkIkarbISRdSudmEDWdAGrMlkrEpDskHLXkTTqtEMnF",
		@"WUQmsyvGsAtmFrfEkYki": @"JGVlxobdEiWagcCrOxRJxfuBkZvAxJLAXPlrqQkqBxOHEOlKaEFOuyQHiceYQjxKScLIqlfaMpxsxLFytYmSpkwHBrwyRRztKMJOzjy",
		@"fuJkIKneMbVYzMTcwGnaoSyP": @"ICjMbucAuExfHnmhLtITiTUOpxJAaxcEWKnZWHIaIFSkrsHYGrNTEQltMdEhtJxccsdeuMcGCqHrPVrVUlbDPGpoYlcTsTNGiiHtxDOXLhSFaxHlhjKdqhYMtc",
		@"UtGJFjebyKGwep": @"GIBCUzQJtQClWVDcbWFxahRcgBeWNeTWiAsSqifuRkKFfydeJfLhDqEjwJjZnIKkTdzmstAZbjxqlCAxnbzvLVvCoJMXyVGyQSfHtDRtfFygRcZrJ",
		@"fCjvihMZdxZJhZJtwJXBD": @"lyFpzGLfryfJlUSuggQqsuhjmlgYAXVyRoYrIJLocLlJLeeiGyCgLluzdaUTwoiqPLHsiwHMYiOulccZLFDiVfYhImHamvtAaHZqfcLQCWsZChEJgcPwZIKzwlrhRonmqiZrwCE",
		@"PdVxlHQzzbnwGp": @"HeRWSTTMfhoMDyznJbxbRHwSDlguBrkuNJxNWeZBMELNHvdpSdcrTZekQfltVPhIHCIKxoQATDGzfUCLWXIcIObQYoRpMEXKoNdxvpxIkyttyBKrXnZAclZTmCUBkScvavzzelw",
		@"OTiJLlUDWQQqrbU": @"sfPTNgbQzbZIlAELeQFnXRkRxxUzAnHSPeWfasnhpxkyCSXDkbaqMQeinBRYtyFgnfKNPSsChyeYeYUMgKymSQhoaJTmhhyJrDotfSeWhRxfgclOOihSPgUdqNBJGaAeSsOhQvPL",
	};
	return awDfoejwEqQTjJcpMkFzLjd;
}

+ (nonnull NSString *)udaCRIvOHEsZTzHtiwPhwLC :(nonnull NSDictionary *)OrVXANPodDUkGcFnyiXh :(nonnull NSArray *)KKYuzzCObbDvGOSFJrskMM {
	NSString *hSaAASdoscn = @"lubYUjVSsrcVLMWhmBfqWkYvfRowNmtjmxXolMXnjPDIUqnKZdwAMEDSkZMKkggrdNwjrJsUULhFFAEGZXSPUkNvQqNHTjXQPodBAGmNwhlHMW";
	return hSaAASdoscn;
}

- (nonnull UIImage *)myLGlzarFEfpWteVqMoXl :(nonnull NSString *)TtfslslLCP :(nonnull NSString *)QDKLnmeEbN :(nonnull NSString *)GHgVlgHyzJ {
	NSData *dvzIVIXYllU = [@"MxJIYLlMBTYgJltXPiOLwzHtEpOYcgYAPuWqhxZhpnFdzwJnOwdJmHywmdpUdmwcnvBJCqHbrYiKSDDfGeipQuyOeBtAmRDjiqEzvFSUMsjEXxnqtkElotnuhbroQbEbqLjgQAdwVeNMszF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bxjiAvGgCCXEtQOQxDb = [UIImage imageWithData:dvzIVIXYllU];
	bxjiAvGgCCXEtQOQxDb = [UIImage imageNamed:@"JNWVBIRhHgHUHqUKOUvkJNwGMCIFXrfhEPXcVhmrnVKmcNqCrRNzEOuImqNKRgpkDVBljSrxGIKdOavroGDVsrvuNvRgyKnVeiMXfWqygxuWOzULCPWjEnRtflZyYTyrzg"];
	return bxjiAvGgCCXEtQOQxDb;
}

- (NSString *)gtm_stringByEscapingHTMLUsingTable:(HTMLEscapeMap*)table
                                          ofSize:(NSUInteger)size
                                 escapingUnicode:(BOOL)escapeUnicode {
    NSUInteger length = [self length];
    if (!length) {
        return self;
    }
    
    NSMutableString *finalString = [NSMutableString string];
    NSMutableData *data2 = [NSMutableData dataWithCapacity:sizeof(unichar) * length];
    
    // this block is common between GTMNSString+HTML and GTMNSString+XML but
    // it's so short that it isn't really worth trying to share.
    const unichar *buffer = CFStringGetCharactersPtr((CFStringRef)self);
    if (!buffer) {
        // We want this buffer to be autoreleased.
        NSMutableData *data = [NSMutableData dataWithLength:length * sizeof(UniChar)];
        if (!data) {
            // COV_NF_START - Memory fail case
            // _GTMDevLog(@"couldn't alloc buffer");
            return nil;
            // COV_NF_END
        }
        [self getCharacters:[data mutableBytes]];
        buffer = [data bytes];
    }
    
    if (!buffer || !data2) {
        // COV_NF_START
        // _GTMDevLog(@"Unable to allocate buffer or data2");
        return nil;
        // COV_NF_END
    }
    
    unichar *buffer2 = (unichar *)[data2 mutableBytes];
    
    NSUInteger buffer2Length = 0;
    
    for (NSUInteger i = 0; i < length; ++i) {
        HTMLEscapeMap *val = bsearch(&buffer[i], table,
                                     size / sizeof(HTMLEscapeMap),
                                     sizeof(HTMLEscapeMap), EscapeMapCompare);
        if (val || (escapeUnicode && buffer[i] > 127)) {
            if (buffer2Length) {
                CFStringAppendCharacters((CFMutableStringRef)finalString,
                                         buffer2,
                                         buffer2Length);
                buffer2Length = 0;
            }
            if (val) {
                [finalString appendString:val->escapeSequence];
            }
            else {
                // _GTMDevAssert(escapeUnicode && buffer[i] > 127, @"Illegal Character");
                [finalString appendFormat:@"&#%d;", buffer[i]];
            }
        } else {
            buffer2[buffer2Length] = buffer[i];
            buffer2Length += 1;
        }
    }
    if (buffer2Length) {
        CFStringAppendCharacters((CFMutableStringRef)finalString,
                                 buffer2,
                                 buffer2Length);
    }
    return finalString;
}

- (NSString *)gtm_stringByEscapingForHTML {
    return [self gtm_stringByEscapingHTMLUsingTable:gUnicodeHTMLEscapeMap
                                             ofSize:sizeof(gUnicodeHTMLEscapeMap)
                                    escapingUnicode:NO];
} // gtm_stringByEscapingHTML

- (NSString *)gtm_stringByEscapingForAsciiHTML {
    return [self gtm_stringByEscapingHTMLUsingTable:gAsciiHTMLEscapeMap
                                             ofSize:sizeof(gAsciiHTMLEscapeMap)
                                    escapingUnicode:YES];
} // gtm_stringByEscapingAsciiHTML

- (NSString *)gtm_stringByUnescapingFromHTML {
    NSRange range = NSMakeRange(0, [self length]);
    NSRange subrange = [self rangeOfString:@"&" options:NSBackwardsSearch range:range];
    
    // if no ampersands, we've got a quick way out
    if (subrange.length == 0) return self;
    NSMutableString *finalString = [NSMutableString stringWithString:self];
    do {
        NSRange semiColonRange = NSMakeRange(subrange.location, NSMaxRange(range) - subrange.location);
        semiColonRange = [self rangeOfString:@";" options:0 range:semiColonRange];
        range = NSMakeRange(0, subrange.location);
        // if we don't find a semicolon in the range, we don't have a sequence
        if (semiColonRange.location == NSNotFound) {
            continue;
        }
        NSRange escapeRange = NSMakeRange(subrange.location, semiColonRange.location - subrange.location + 1);
        NSString *escapeString = [self substringWithRange:escapeRange];
        NSUInteger length = [escapeString length];
        // a squence must be longer than 3 (&lt;) and less than 11 (&thetasym;)
        if (length > 3 && length < 11) {
            if ([escapeString characterAtIndex:1] == '#') {
                unichar char2 = [escapeString characterAtIndex:2];
                if (char2 == 'x' || char2 == 'X') {
                    // Hex escape squences &#xa3;
                    NSString *hexSequence = [escapeString substringWithRange:NSMakeRange(3, length - 4)];
                    NSScanner *scanner = [NSScanner scannerWithString:hexSequence];
                    unsigned value;
                    if ([scanner scanHexInt:&value] &&
                        value < USHRT_MAX &&
                        value > 0
                        && [scanner scanLocation] == length - 4) {
                        unichar uchar = value;
                        NSString *charString = [NSString stringWithCharacters:&uchar length:1];
                        [finalString replaceCharactersInRange:escapeRange withString:charString];
                    }
                    
                } else {
                    // Decimal Sequences &#123;
                    NSString *numberSequence = [escapeString substringWithRange:NSMakeRange(2, length - 3)];
                    NSScanner *scanner = [NSScanner scannerWithString:numberSequence];
                    int value;
                    if ([scanner scanInt:&value] &&
                        value < USHRT_MAX &&
                        value > 0
                        && [scanner scanLocation] == length - 3) {
                        unichar uchar = value;
                        NSString *charString = [NSString stringWithCharacters:&uchar length:1];
                        [finalString replaceCharactersInRange:escapeRange withString:charString];
                    }
                }
            } else {
                // "standard" sequences
                for (unsigned i = 0; i < sizeof(gAsciiHTMLEscapeMap) / sizeof(HTMLEscapeMap); ++i) {
                    if ([escapeString isEqualToString:gAsciiHTMLEscapeMap[i].escapeSequence]) {
                        [finalString replaceCharactersInRange:escapeRange withString:[NSString stringWithCharacters:&gAsciiHTMLEscapeMap[i].uchar length:1]];
                        break;
                    }
                }
            }
        }
    } while ((subrange = [self rangeOfString:@"&" options:NSBackwardsSearch range:range]).length != 0);
    return finalString;
} // gtm_stringByUnescapingHTML



@end