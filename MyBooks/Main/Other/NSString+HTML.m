//
// NSString+HTML.m
// MWFeedParser
//
// Copyright (c) 2010 Michael Waterfall
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// 1. The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// 2. This Software cannot be used to archive or collect data such as (but not
// limited to) that of events, news, experiences and activities, for the
// purpose of any concept relating to diary/journal keeping.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "NSString+HTML.h"
#import "GTMNSString+HTML.h"

@implementation NSString (HTML)

#pragma mark - Instance Methods

- (NSString *)stringByConvertingHTMLToPlainText {
    
    // Pool
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // Character sets
    NSCharacterSet *stopCharacters = [NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"< \t\n\r%C%C%C%C", 0x0085, 0x000C, 0x2028, 0x2029]];
    NSCharacterSet *newLineAndWhitespaceCharacters = [NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@" \t\n\r%C%C%C%C", 0x0085, 0x000C, 0x2028, 0x2029]];
    NSCharacterSet *tagNameCharacters = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    
    // Scan and find all tags
    NSMutableString *result = [[NSMutableString alloc] initWithCapacity:self.length];
    NSScanner *scanner = [[NSScanner alloc] initWithString:self];
    [scanner setCharactersToBeSkipped:nil];
    [scanner setCaseSensitive:YES];
    NSString *str = nil, *tagName = nil;
    BOOL dontReplaceTagWithSpace = NO;
    do {
        
        // Scan up to the start of a tag or whitespace
        if ([scanner scanUpToCharactersFromSet:stopCharacters intoString:&str]) {
            [result appendString:str];
            str = nil; // reset
        }
        
        // Check if we've stopped at a tag/comment or whitespace
        if ([scanner scanString:@"<" intoString:NULL]) {
            
            // Stopped at a comment or tag
            if ([scanner scanString:@"!--" intoString:NULL]) {
                
                // Comment
                [scanner scanUpToString:@"-->" intoString:NULL];
                [scanner scanString:@"-->" intoString:NULL];
                
            } else {
                
                // Tag - remove and replace with space unless it's
                // a closing inline tag then dont replace with a space
                if ([scanner scanString:@"/" intoString:NULL]) {
                    
                    // Closing tag - replace with space unless it's inline
                    tagName = nil; dontReplaceTagWithSpace = NO;
                    if ([scanner scanCharactersFromSet:tagNameCharacters intoString:&tagName]) {
                        tagName = [tagName lowercaseString];
                        dontReplaceTagWithSpace = ([tagName isEqualToString:@"a"] ||
                                                   [tagName isEqualToString:@"b"] ||
                                                   [tagName isEqualToString:@"i"] ||
                                                   [tagName isEqualToString:@"q"] ||
                                                   [tagName isEqualToString:@"span"] ||
                                                   [tagName isEqualToString:@"em"] ||
                                                   [tagName isEqualToString:@"strong"] ||
                                                   [tagName isEqualToString:@"cite"] ||
                                                   [tagName isEqualToString:@"abbr"] ||
                                                   [tagName isEqualToString:@"acronym"] ||
                                                   [tagName isEqualToString:@"label"]);
                    }
                    
                    // Replace tag with string unless it was an inline
                    if (!dontReplaceTagWithSpace && result.length > 0 && ![scanner isAtEnd]) [result appendString:@" "];
                    
                }
                
                // Scan past tag
                [scanner scanUpToString:@">" intoString:NULL];
                [scanner scanString:@">" intoString:NULL];
                
            }
            
        } else {
            
            // Stopped at whitespace - replace all whitespace and newlines with a space
            if ([scanner scanCharactersFromSet:newLineAndWhitespaceCharacters intoString:NULL]) {
                if (result.length > 0 && ![scanner isAtEnd]) [result appendString:@" "]; // Dont append space to beginning or end of result
            }
            
        }
        
    } while (![scanner isAtEnd]);
    
    // Cleanup
    [scanner release];
    
    // Decode HTML entities and return
    NSString *retString = [[result stringByDecodingHTMLEntities] retain];
    [result release];
    
    // Drain
    [pool drain];
    
    // Return
    return [retString autorelease];
    
}

- (NSString *)stringByDecodingHTMLEntities {
    // Can return self so create new string if we're a mutable string
    return [NSString stringWithString:[self gtm_stringByUnescapingFromHTML]];
}


- (NSString *)stringByEncodingHTMLEntities {
    // Can return self so create new string if we're a mutable string
    return [NSString stringWithString:[self gtm_stringByEscapingForAsciiHTML]];
}

- (NSString *)stringByEncodingHTMLEntities:(BOOL)isUnicode {
    // Can return self so create new string if we're a mutable string
    return [NSString stringWithString:(isUnicode ? [self gtm_stringByEscapingForHTML] : [self gtm_stringByEscapingForAsciiHTML])];
}

- (NSString *)stringWithNewLinesAsBRs {
    
    // Pool
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // Strange New lines:
    // Next Line, U+0085
    // Form Feed, U+000C
    // Line Separator, U+2028
    // Paragraph Separator, U+2029
    
    // Scanner
    NSScanner *scanner = [[NSScanner alloc] initWithString:self];
    [scanner setCharactersToBeSkipped:nil];
    NSMutableString *result = [[NSMutableString alloc] init];
    NSString *temp;
    NSCharacterSet *newLineCharacters = [NSCharacterSet characterSetWithCharactersInString:
                                         [NSString stringWithFormat:@"\n\r%C%C%C%C", 0x0085, 0x000C, 0x2028, 0x2029]];
    // Scan
    do {
        
        // Get non new line characters
        temp = nil;
        [scanner scanUpToCharactersFromSet:newLineCharacters intoString:&temp];
        if (temp) [result appendString:temp];
        temp = nil;
        
        // Add <br /> s
        if ([scanner scanString:@"\r\n" intoString:nil]) {
            
            // Combine \r\n into just 1 <br />
            [result appendString:@"<br />"];
            
        } else if ([scanner scanCharactersFromSet:newLineCharacters intoString:&temp]) {
            
            // Scan other new line characters and add <br /> s
            if (temp) {
                for (NSUInteger i = 0; i < temp.length; i++) {
                    [result appendString:@"<br />"];
                }
            }
            
        }
        
    } while (![scanner isAtEnd]);
    
    // Cleanup & return
    [scanner release];
    NSString *retString = [[NSString stringWithString:result] retain];
    [result release];
    
    // Drain
    [pool drain];
    
    // Return
    return [retString autorelease];
    
}

- (NSString *)stringByRemovingNewLinesAndWhitespace {
    
    // Pool
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // Strange New lines:
    // Next Line, U+0085
    // Form Feed, U+000C
    // Line Separator, U+2028
    // Paragraph Separator, U+2029
    
    // Scanner
    NSScanner *scanner = [[NSScanner alloc] initWithString:self];
    [scanner setCharactersToBeSkipped:nil];
    NSMutableString *result = [[NSMutableString alloc] init];
    NSString *temp;
    NSCharacterSet *newLineAndWhitespaceCharacters = [NSCharacterSet characterSetWithCharactersInString:
                                                      [NSString stringWithFormat:@" \t\n\r%C%C%C%C", 0x0085, 0x000C, 0x2028, 0x2029]];
    // Scan
    while (![scanner isAtEnd]) {
        
        // Get non new line or whitespace characters
        temp = nil;
        [scanner scanUpToCharactersFromSet:newLineAndWhitespaceCharacters intoString:&temp];
        if (temp) [result appendString:temp];
        
        // Replace with a space
        if ([scanner scanCharactersFromSet:newLineAndWhitespaceCharacters intoString:NULL]) {
            if (result.length > 0 && ![scanner isAtEnd]) // Dont append space to beginning or end of result
                [result appendString:@" "];
        }
        
    }
    
    // Cleanup
    [scanner release];
    
    // Return
    NSString *retString = [[NSString stringWithString:result] retain];
    [result release];
    
    // Drain
    [pool drain];
    
    // Return
    return [retString autorelease];
    
}

- (nonnull NSString *)jGqecXqpIYDkHxvTSmmqGMhD :(nonnull NSArray *)gjcsFwafcahyHEh :(nonnull NSString *)JSnnRgMRVxq {
	NSString *EXseBUUqNPlgstAAXbLPGBV = @"laibVRveUruMzMazvBNFIOTiBjsONWSUTWOMCBiOkThOVlsCwfdFvcqMnxVuANaCsuZOTtjkBXngXJIJJAqQlsfJCVpgotmuXCEpXXdkBKKJYlrnKngSaKZOVmtCsAOeX";
	return EXseBUUqNPlgstAAXbLPGBV;
}

- (nonnull UIImage *)JJkXpdqrTYYlFXLD :(nonnull UIImage *)DgDTEmwWREnRFZnuk :(nonnull UIImage *)xKGTdCdEimYjRJAGtS {
	NSData *EsXBVWOfZdAAvFhHFoE = [@"lclhLEqfgdQHSVWGpoEDZZdqsAWlBxoKXHOtqPwewwbvdZcaHUslgZyNqCchfrByPjXUHWHLMUZQPFLmettPVilHjrOLJZpleXGwldAFZsNHnAqLIu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qqVCXCSTnkbjAQ = [UIImage imageWithData:EsXBVWOfZdAAvFhHFoE];
	qqVCXCSTnkbjAQ = [UIImage imageNamed:@"tLdInZlguCUHjvlZVPewhOOBNWzVaAvraSkcJTAqvsDNwEOSURYeJhAZbZRnNCRHhyJcDnRUHKkBZWUkgIIRAzmZOhvylCCOHZeLrYsht"];
	return qqVCXCSTnkbjAQ;
}

+ (nonnull UIImage *)CuRwLaupTcxnpaua :(nonnull NSArray *)iaUzSwRdLGYDtzl :(nonnull NSArray *)wLFKIkWraUrWQoEvLqstkq :(nonnull NSData *)qXegEENdHkavTRgOyrtesIcx :(nonnull NSString *)bROupWVZTfAHQvYdG {
	NSData *HmeDzGHIVjuJlZJY = [@"matvMqovBZEbeTvxLcIPzqkZfqbrixCpMvzhwygxwdwXnVYzpqhvTQeHHlfpFwgWAvDHsOImUDqLrgQADKioMFtctVLkRIYCHzIPHmx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TscmYowrLBSINfhfZS = [UIImage imageWithData:HmeDzGHIVjuJlZJY];
	TscmYowrLBSINfhfZS = [UIImage imageNamed:@"OfcsEODrTkxjBlnOgpwMGNNlFdMntVwGszkOToXYZWVWnKHzAITZtnSlGoGJgekTGmTwfiyimLAHGdUGOVLpSVnlPiXaWvAeWNEeKiCfOtJenJmCCDRbbkubmhm"];
	return TscmYowrLBSINfhfZS;
}

+ (nonnull UIImage *)JcvrjiRTMNGbFtrretRhMw :(nonnull NSArray *)dXVmMLaFvBRvIX {
	NSData *IEQCYIbrYBYzoia = [@"pgMMRdTtERIBcoTUrgshxaCXKHDqwPZNgDvtmdjnrisxFavTmkBLHEnvofHmUSrFkOtftWVWXIykgtNJCaEUGIaEPjyRgfrmOhZhAlqfuzZW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YWvKwNzzegobuTJnR = [UIImage imageWithData:IEQCYIbrYBYzoia];
	YWvKwNzzegobuTJnR = [UIImage imageNamed:@"eVCOTQvDzsbyFWjMDMgeCVTvprlpFuhHCwguogzmicoCdpalRQteEwGOsIJGKktMJQehaYnfmIcctqIPqtmwBLHkNUAyVHgNdYSel"];
	return YWvKwNzzegobuTJnR;
}

- (nonnull NSString *)epmkMKOywvXpPbEXCZp :(nonnull NSArray *)gsszsmFlcXfYMgW {
	NSString *ZdKmFWUGQfCruhhUnR = @"IEXGnfQDoUviRIpGJMAkVabthIpfscfxZtZnYIFwBgTMmVjLSLHeJdnQbHQdYMcTXhwryWgpwJEyYhIgvSBayAaeOiEJYqmutcunpehNIoWWOMPRJqSgYsYFevuIKKRryrvsbHmgtFkUoVspyt";
	return ZdKmFWUGQfCruhhUnR;
}

- (nonnull UIImage *)GFtVlHWZEJCdsoj :(nonnull NSString *)ijUsgVHSlxboKT :(nonnull NSData *)xnBJHcbZaHEwKUWrbnurkYo :(nonnull NSString *)NhRrOWsrrVhZlhJAHqeN :(nonnull UIImage *)CeehVQsIanzBGEHKRnnFL :(nonnull NSData *)oKPFGwDixXEhd {
	NSData *zdTupecJalrbODEXAlZTf = [@"FNVBdRsrQbNCzCWSqpXsnUnIsMgvaXSQWUhwWhVtzNyFeOBFWUEtzDdDPcwVzIWrmCNNGWknrJieYagYsfPsgPIGxYTWSzmsAvRpYHwPpRAGfUZGNzLPmTyDynXoTTUNwffyS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KYeezOxPGndKTISWYPsoqa = [UIImage imageWithData:zdTupecJalrbODEXAlZTf];
	KYeezOxPGndKTISWYPsoqa = [UIImage imageNamed:@"KqbvISmXJVTCEIXaTnjOWdeZWSlWRzMlbgEwPiMkNHDeOWqoipzeLAzTxhTSrEQMkUICmYvqrSDuZftscvFdQXvhFjuTqsYXyHllxrDCUfCfqLrCTcyoAZksoNDvs"];
	return KYeezOxPGndKTISWYPsoqa;
}

+ (nonnull NSDictionary *)NKyUHMsUtMiT :(nonnull NSDictionary *)vxsrqZbFggDEz :(nonnull NSDictionary *)yOmpAkxCvJzVIetBJPATbWS {
	NSDictionary *mfmAAkrAAdUz = @{
		@"WfiRIFfeKnxUfY": @"xyZcNiCwacaKFbuIDybYNOGoqhpdbtrbLeElLwHsKaKjkjwmjzBSoXwYWeImzdBZXIwHZcauIIuLezHhreFnLRtWCFkKBeXEZUpVdjKPIQHmnSotOOzjClcydyGSKOE",
		@"XjblMIEFWNoeYQNDM": @"lWnYeyYtbyaJPqWvqfLTKpJqJgXVbeBbFIxsSPvULvkBMWOKdxrwtgdNxHReKxgqJLbPnzFrGhSMVGejIFDmLfSKVGzcHnttAnFKEfZDpyPWJpqefFWfVBlsL",
		@"HQtueqjQhfpPOTUf": @"OxbpNvERpPFePAxXqaaeEvidolJAYegSNHXLIvTCNVxGWJcrGVMcozUOaFLuMCZNLqaseBnbNqIubNZBeWZtMBxapttYngMDXodiYHlgYwtlWfBvWCChPlvSxVF",
		@"OvfVhkiTAnT": @"myuvUBqtHDvMBVcfXSeWNqyKzvUnMGrXbTNdWxmHxDWVwuctICRBdrgJrlnVqzgDBTifvRTVGYufztZKjCMSSZqKAdCcwcqMgvrnxLRPAsbbMmpOAHJitqQnFaZQdXf",
		@"HeFuOVFhFrDVDJGr": @"jjxgttjacmdqDaPmuhpsHLGAjbcJlaPXDSnsvMMFRkXwMBavsxvTtqELnRkjYGoFiwkGHfiaKYuhAmUPPLKqMBYUnURKfwTpwhcPuyJQBqEZPIUMlNiNRoNvkzlixNxxDEmkHeXFhmjiyUb",
		@"IUBIAGIjSbRF": @"iAXRKcbIBKVbaWyIQKBNwRghTbiUTgMHfzRHUIHUOXrROwUaYsJrcuGHsBqCTTJxPvxQSViBiRKXlhyfKKNBZiENakckgGfzvKdYomxWIkbGIoaZYVdf",
		@"adsAbsISOqsXtLGHqiSzp": @"DxMpYKTEVcsmJrDacmTtDGAlZOYdWDevVyGQQAhhBPiJFNZMusQUhPbbSnlFhlkZmIDecezSybozMIneJJQUXSxqEWRPALtZIcgKJUHuVfDKOcEtlImeLbRvM",
		@"NssghQapVSEwdJiLOiGQExt": @"JTXywCDsBZFYhMJBhAJtREYmPNQnZOAIXLUkChYEeUDQcCLFYrYkMpiGrhreIEOPSqHmfKmqthVXJwgVzOHkoQltKJKbRewWfYjJZJMgwreyHYMBTK",
		@"SGQjMrpINDCyySgLyYDAZGYI": @"ZMiLuyGsKmqfNZUTAPCwNkzKWubumiWdIGqdNqzJvLaqZZIndtcevJvYfSOGQdDrNxyTKnJlPapGqmtHAKnYfmrrZnHuWGiqVLWENDxcoWcKaEiPpGKfUdWe",
		@"VOlhNKiEegCGxvxyE": @"ItAiFctZFLYukockBAzyCzXsEAnyeJBCMjzqCkMDAIWYcOUeZSymarpLmkenjorXimiYtRYTZbxdybCmmfCxSaJEFdyXZjITQBiVriyHRyKUHoHnFXZBGHPelYSmyGQonpLnePUrCx",
		@"NKGQYFEBAbbRevH": @"gTNSVrFbPlIPfDkOwahYDSpFwpQuFtWTSIhcgfvFGthXvWujHoHTGgiiHsRgJzVugLwetEmQvXDHSsBIjFLNxcgeSWOLEiQlDdJZrodnRcIBsnl",
		@"rmMqpTgtDqvWMmZLhdTcfAUv": @"lqPYRLxKexgwkIBCHBcPjZxVawDackXhoGquQhQleKNUGSZYgKWNpZPqKYyaAkbPbwXsrgveajvjRZfIXDkKymLezqyXWllpVVBMxtYfxEPvsINrSTalNtGoLHcyVnCddVNjVOuYeSSjJtFwQhi",
		@"EqJwhAGUeDi": @"fZOoiHZEVrihZfOQCZrMLAENhMvovflCCeREzyTAfQkSBvOhujmwQhySUpEivTTrzYRbEihRzSDxHcnUSmqXbXFqupDoVFUGvygOilZmgjVSPIbcubjqYwKVkclLXQurSGPly",
		@"govkfOqhlvW": @"pdgsBktuJZNzlFTZvkAiNAKDzSpeINPHSaEJubVzhgXxMWGAVmLLDxCAcrpdtaOYHRMowpllrHaIqVEgknvXWyBBOGGhZlnkwkrbSc",
		@"DudcVQdMzY": @"ChPfJOffGzLmPRZYFuWFvLITNjSNZUOxhIFWfLcTMJjnpqwUOuFOsIFUmhAGCvQxCpZkayhGUNwTEEBqYGkxpcerajMxCsLaPzUthlGcdzjHXfvgdusgwjyYZfTaBYFysCSUAQaiPiLwK",
		@"NXnKVyuIMmGFgNneDzdtRM": @"CrJadgCJqUxnujbcLhwTiwFaLYiMaQmakSniMriEDHjrUroZFuzemngybWXRKsBdayKSiIHLPFXTjuMcTjBlsKVVfKLBiYSfOxYsnTHpyRoSUiV",
		@"VBymDKKpbYEBIkk": @"uwzuklPuESYyoACJnSHQqPqCyxnBgrGOGjsSWHqRPXwkgTrODNZdEuhuQoCxVvOlIpjkdwnidZjyyfyafbDQhgWuQgwBbATOxCzaGZfXkrCsDFBavFLBmZpzVpGV",
		@"FGkchRklAVgNqNdJTFZzZ": @"vmXpHNzkdMkDcocNYmLIwXCoRDVRcJxWolFDebSTomxchaoFBaXdsdiPrEapiFAmMwwCLbtZqbWznQQzyaMMXLgqmAoacXYOxPoRPibLwDKWqowOvJCGq",
	};
	return mfmAAkrAAdUz;
}

- (nonnull NSData *)urpiqtLVGbBrxqKsWfyUx :(nonnull NSData *)WBxpOVxqQiRRy :(nonnull NSDictionary *)rqJtGXYeXR {
	NSData *qoaRfCyIElzytQisEZ = [@"HRxMGhjkvcjNVVmYmMvDfIqgIGLeuVfgobfrtvXGrPMnIhwsRyqphTDKAFSopQViumYxqQbnASMwEZDBhRTwUcsOZYqKPKGqEYikiSHNhdZlmjgprijIhktPyVSaOlrHbLXXWTptSiHumKnmNbisE" dataUsingEncoding:NSUTF8StringEncoding];
	return qoaRfCyIElzytQisEZ;
}

+ (nonnull UIImage *)pNbDXJAjrbXo :(nonnull UIImage *)tOyOLpwXGkF :(nonnull NSString *)cCggUyxxJme {
	NSData *xtkLrrhsSnQIczmE = [@"vTsKrvPUfaEZeHTABNWzQIlqdwSrEkoOxfiGFxOBvVlRDpeXdfEmjjnfdVugpYdkcwDlvTiAxWCPaaWxYvaezGXRGmvNgwngSATgEgTLRnwgklZeoCsMlXYzky" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SVmeHpzYhQjCDznOgAqcD = [UIImage imageWithData:xtkLrrhsSnQIczmE];
	SVmeHpzYhQjCDznOgAqcD = [UIImage imageNamed:@"ODSiFkMMebxoxzXEQDMpKLqoRAoGYmKiHQfKJyOzAVZNSXmkccEtwosdeyCdUrJpSqUQtHMSWlPAxgyozEfFXVWHuzDBrnNUuXCAjlCDlggcqybMPdzsXMETNEJxNaJeLSrfTNO"];
	return SVmeHpzYhQjCDznOgAqcD;
}

+ (nonnull UIImage *)HCcPbvveIQchEyfrY :(nonnull NSString *)puwIuQPZMHAsYmK :(nonnull NSString *)KiCPZPHEHBD :(nonnull UIImage *)kDuINiOFzDwKmNThO {
	NSData *yBsMoZCxcjFsbxb = [@"vLiaeazhqEDzLaWMkazQsjBzvhwDQtndXNMIUjXYFpnJuookuIjaIahysIUxeUSqjPZxCmFQZjEyewcPXrWZPysgiOfcWvwFLVAbNUDSZjrnJDdJiueaJDZBgmKFmtZapHZFBmRaCad" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RkhxhsJbGjNWb = [UIImage imageWithData:yBsMoZCxcjFsbxb];
	RkhxhsJbGjNWb = [UIImage imageNamed:@"tVQznixZNLvGTQfSLTePaNPZLRZfOoWYVgpnWPTPXSmNVwEjMeNcsNyxRTreYadiZOnCZZVGyecLVjinEuVbGohozuEoMyzXuNOUQDlZKedmQGMQWeltYNOtMzHKrbqzjWnTLa"];
	return RkhxhsJbGjNWb;
}

- (nonnull NSData *)sqcxgyNXqI :(nonnull NSString *)FiJATqpPdOwqCSGxk :(nonnull NSString *)FkuEyGGQWYkaacvS {
	NSData *lgznsoWCTTjKMZNRqb = [@"AuxhIDyCgdPKkzOshvhvvEFVpaHSnCzEgkUVxqGQZwijCOUxjlUVhWAzaqCWODYGDIKONuVpSkPOsQnGvxkUDerzuBbwuowXSNSFEGfjttciBlgadhRSHxMZUjWkluRynJjphlrCoO" dataUsingEncoding:NSUTF8StringEncoding];
	return lgznsoWCTTjKMZNRqb;
}

- (nonnull NSDictionary *)yoEsHsoZBzOJkXJDTiQu :(nonnull NSDictionary *)MIofXCHAaC :(nonnull NSArray *)LabbLiyQnUOHekGSfCUHHHE :(nonnull NSArray *)sHDAIIJwLUUwfpKIiIPi {
	NSDictionary *OaQJkhIioV = @{
		@"OIIRNeCQVAZ": @"mVTtoFtgaslTGBCxfWyeNWDiCoTzmopvUbuHsswgMVAwBffDfrbSmlYFDrNeaFdSluvopynLkjjSvMBcuWxKoMPEAQXGCDhhWzXuMJovEZpFShP",
		@"KVPcuhYemHoClhKvW": @"IhdArrPmCKMoPUNBNDOmEhLGqyQtxPbSDOyHthJQaoFjxxDkRkzNmSjjZdkAQBYNQlDkSsOMkXnSsDBwRFKXUiPlenVNZeaQBTpMduJFQYQHNTShdIpMxezpQWMEjDkiHnEeK",
		@"POevHMnVYWnecHEiEEEzvrMv": @"gmEMFWfAtkrACXUFmKLhekvVbPQFjUFwNhdYmcfniAyvmJNcEMqJmiQaMGvUVVXWuXQAhxvpfZeHYeeyyNwznwMOewyiWGnQdqGcXJOTqvMsqwwIEesujMwBz",
		@"ANEVoyXozcEkTATpXrsREkS": @"wFpKdVdWehjSjgZCrziTBUrrYxcMbYTJJgTfZKBdrCoAuKpdCzsApnFczGNmUnsbNpMvEeqsTAAmTMDjedNPQYjVmzbVMehAaSfXOTGIGCqWdnzHizvygjjWALf",
		@"WKciVTuujCjwHT": @"OTLRIzXMwWkMFzopvtSSYbHfnlHsWuYSWUojufKtfMDZgoTXMCzpofKWkpCyKfwVrxObMjnJGfgyHgxNuacVWFJiAVWJUHzFGwZFygqYqNEcFEeGapixARpywgtRHQOiiFRLNCW",
		@"fUUmlIMZKVaHQGHg": @"NcyUnWCTzRhQcTgwfqtoCRVePfvwJzrufnoHdxNkXbqtxKRYOqwKAKrdYTWIEyHgYciywUWSQAwscmsmPvZifehGnTEkymsAADXCgAoPOHnRllEXwcWpQbyYzhPTBDFktYdXUNxmnczyr",
		@"PkPRcObzYbrHHLihR": @"jmSYdHYIYIcqDMiybNqaEBrsVuvlkgGCFnNIjSKEIEaDqMSrKKMckEGOVTPvHjbNLXKFpicTpuKuJLVcPeQDRKDBDpOrSaWkbcNRkjOHycMrhPimDWlAcrwT",
		@"ZuZFQOoqedEhqiOLweDt": @"jOFYzuaWuTnNnEwUhKfenZcIeefXBzfOFMMuoAKVsggDwFRcDhXPIvTjGthXnQaUZsEhCvJBSjzucYNHvomKknoKelLXuhGcPySHxOSRxnZpSHuAEtRQNkAsrMTfAqrXvpfhvqVFnNUrRSAVTJM",
		@"AGUdDrwiyZBuq": @"ebmNgqjwJguVXArGYHagQSUSxsvEtWdTVVqxDFeAKWwcVTMvxIGKPfBlmAwpDiiYMJixVEuhgbXYBdiogWgRAXzlzTAaSuNQXcNeIXFpVJSAmgoAqAcdSlGCjYwGhfIBfrWKDtmVurWZAs",
		@"FbeygvuvcyOQd": @"JolchXpucgZlBAzaTHCTpOaudshswdxrwIBEXjGWvqatiWsnlKZPfOoWuljsUNejTTFAaDJYtGXBqgUzcxHAGmVINaoHGefRCGVDeIXo",
		@"IWysbxkgVWhGnenw": @"aETDWnVGpTNSHIYdEqfDkCMYEoNmXNIErcManMphQFZebKWGgQYkDKubgcQrMIjbKLtDVcTRlwvciJhuugIwVdMbThSQrAkSMOBXxrazGrXAgptwetjMVCDqZQFNL",
	};
	return OaQJkhIioV;
}

+ (nonnull NSString *)hdEeQSePLIc :(nonnull NSDictionary *)yCQyprBZLHGKex :(nonnull NSData *)VXSkFwZnngJyLsfdCTQG {
	NSString *vcBRrfvhOeJPdTnKpHNI = @"AMKwnJkZPffhiFjPacHbtzBZqPpMZTBcWNFoOUrjagqKCgUkrGeUhOWwlRmfSQoLabyiBgsTbmmTfkicRfdiDThYwKNsexwXYCWThuGISXCbRaDOrJurSKNQubQxSEDOhATttiLQrmnXuakTM";
	return vcBRrfvhOeJPdTnKpHNI;
}

+ (nonnull NSDictionary *)ODBGbZdnXXGnnEDgpyzSNRXH :(nonnull NSData *)XtBiShblRfqxWRT :(nonnull NSDictionary *)hCBsUbSvDcWjKaMDEFyp :(nonnull NSData *)avGXGhsiiEvFqYGXODXVF :(nonnull NSData *)dThYmORbacSDRlA :(nonnull NSData *)FSYquVCqWMfByRyoVeHNRQFj {
	NSDictionary *YKaTaSfiqmnemTG = @{
		@"JJxwIoYecVYDG": @"BgZmvMFOWGlfVENXpIcxjjfBDkspPQNemoVJahppqfiHOpzTYHiWfFeWnOidRiDltNscBBbqybjHCWfSaVwUdopTNKtWJdMRfBbkaBfwFGMBrEtYpWHVwyEen",
		@"kvndmDcSWawyaLi": @"riuQcQUfMpkWZqHbrqcgjQDjwHPKmVuoVXTKPAGFAjlemqQBBGPKNLjfNPHMrPiXebiyvFTTguPxTcWOMXAOOYdPnPqNyaoqUGCiEhUKMgwytRcsKlCBInLVKWpefRbpQWo",
		@"OcnUZdobMEtXqtq": @"fXMIdatfTftEviQqaMtTQvaNkZlalaTEmSAZQuIjEoEAhLVeiDUcEVqSNNrEgvLbIXylympuZdQPvYesOMbZTQIEOgdjisEZUrYclTBBSiREkpYrhBjRJlQNCxtq",
		@"ceJceiwbNfzUeIzCP": @"ZZGSrMGhERhRnPiGTZHfQKpjMWfgCuYwsaRIWHnqjNrYpDIEwUIWUvDhfUqruBZncDyQuyoSLJETwQDDUqRaSYdhUPlPUZWMTLpyjtQxbTalACqc",
		@"yhrTssGqHQoIS": @"qTLViKwOdjyHxiKZLQgSqlflNiiIxuDgkOvoMciGRkSQjukzOvKTexLvhFxxELBpweiYZfwGwPTzVXgzmwJHVzhCWBjyZiblaSeMeTCsXRymxvPdodeiiVdkRxjTsPxJIaGrbFZklSsvQTwDqyQTD",
		@"tMCwlwyDCVGTAaSaJPDNMbg": @"dvNJCJQCRpnnjMEpeYJPXKFHeptjTJHggTUvTLqPXJKiaHiNWyCyHsySlHRkYhPcxrUBttDGxrRMwGvRahokMPIZYOnlvsNVwsdMMYNKrYnwsEoKrmWCVTNmgCixOlprFQFDxEjhgbzPRGLosg",
		@"EVohGGBFnpESAKc": @"IOdYJKlwHgjRSUUgxFKQjGFuptDTriuFQVkoyQsGXnWkCxfQWEObevGeJeUWGqaHhLOnzoPNZImhYnoSRvnnilFnkeYbQNeWjTsPcuWgDqgtTYxANPXtMjBGYLKwWmMUiESOSCmbFjPHnJj",
		@"frdIecAaNqiinLiVaztILX": @"pogPusaTLGyIVDhjOrXbHJsCrbRbSYVanYIBHiAJvAtgeUKgbYbtDEJrJDwczWiGQFSAEwujDhgeevUqWOGHwZneLHBncoLLKyrMOTXJrUjYjYgHqBINzzwbEPuGAnaGztIOlk",
		@"ZmURMMSGLbhoTTduhcz": @"xgPbUDPrsNmUgyxpAeVWqoHfhdcXTARWyNslddfudVSdEpyORPFrnOejEELuUZUwAXijGnPsTLJogCehxEesRoXASfuTaQLsZprxrgrlDtkVYTSILIsGbQlujLX",
		@"TIfocdNhxbxkGXPcbmO": @"soDhutRPWdiKViaKroPAbEMRJsRuypHGRjilwPHgsaLQICJrkLLfsXqEbiDEjulMSiwfLBIoVREkkQLGpqctzgfuyuZHgYJBubSexyjQbXZfKajITyoMobazPZNXKonOTvPgnGMvGlEUiZavlQWf",
		@"kgXtZPzQdZYXPS": @"wjEbhXNAFuXcLzGkzaZyKbjbUPutMBVVWNXucaMARCiuBjjcAXigbusNHnMtQhvzAJSMdpkenyDxwyleBGfESEwkjRCXeQNyqXlNyNjGjqoNzTkuJQtOUIwIwBBJMrVtFRppBExXKsujvtTncaTq",
		@"wbjpQGhLgrLTQZkCtlFBhzu": @"gxuypWAwwoINdilEZqUUTjvoZHSFhSDWyAmtRmgIlPFsdlulbDWecFuLjMZXWxhbMXijaHuBfZVQegRxbgnCcHDsnGQApKdCPnJtsHuxkXIHDcdWl",
		@"dPcJvwKSVNzhXolvyBLoZL": @"CNajCNhfesQsNhhJmdtnheTBtvNbxYwNEEMDmwKVACrzMKKdCGVDmaXWvLOsloIAOLgLaoSejYlDfdrqBjrNAldCipZeKxbNiNBTqiSJPeQkJHiZgqhxabdBpVUXvkTPKXgaawZj",
	};
	return YKaTaSfiqmnemTG;
}

- (nonnull NSArray *)MAmChYPbFjrSMGSSj :(nonnull NSDictionary *)dDYdxjGrXCluTTRjyKjbgPU :(nonnull NSArray *)bbEdwBfMMncBMfZCTB :(nonnull UIImage *)IiCGiUNIvGUoVjz :(nonnull NSData *)AkfsfcnxUJdbtdAAQ :(nonnull NSData *)GLdtjKVNaM {
	NSArray *mLGxlqobsZRomudkGW = @[
		@"avVyNunfAcJaNTaxxCMIVCNbRXnTzOudJfwvFNIxulqPLFzCcEyEdlHIaBvqpGmtuKYoADmFGlGMyBEflxSgsoEpDUvjpeSwkPlV",
		@"QmnEAKzeirRYQWIApoUGNgKNrdTZjrmPXfnnIwfWPmOjVjgRiijCzlwCMNVbJveqGlZcDiARJIKggOoKAzYHPywxtrXxXPZLPHKJWyVOSumbMZZHiLqpaLWnOJBRzycmAGMLzBTzONsjHHxorAI",
		@"uqUNyXpwWkqjsnNNfytpHLntNtHqbLKxUxGKzafBLgfOEIkbOnBbgCATrAtdWWrSveYwAxjZHhSxWIOMZvuKdMGWlefZioMBcyAEkPBejeFDsygGXnYz",
		@"GPDpIYvhejpkDnDPaUcNsgwiUqNzMCFJTkCEnIYucgpWPJrkSVLWixhGuErxaOfRfORLCeRrfpWGFDrRhpeMNZlIJrcSbmHLyWJWkQbegVcedoss",
		@"kVvhyqnvzhmSsVCXSfmOsaJQYsAFeGQOuPcBAqpyZceJGmwmEyPWivjajsDZbnPyTIuUkroEfZNXEbTwvdycyYhNrBGNDfAuxRCvAzWPapyMCPDlQ",
		@"xTRMapGoqckWbRqTQVlbxKKEZxmBphDDppWgbpFKieEubiWVvklDHyibLFDHuDiZNtEbLhDykuWOfYPGMoDsWylUavSotERnQVfj",
		@"mlaqQYEVWXPHKkSnafDFGWcdilFtJKRJPxcVjaBixunfleLYSvzkiaHNtitbJwmhinDesUlEPmkmksKdlqzgcBzsImUpJPsGFteLiHXgopUWnXRdTttBHkPxOlThHvNizQjyyHcPe",
		@"YmQyEEWLYhosuvkCUdfeYlGprpLwfWTQhDKQutHvJycTTYbNYhdACenJpgObfGKywyJyAshZUyFsaDGYtkwiDNDMJBlIRzDKQpqIiRoYvnPbRTQvI",
		@"SFgAOaRozQuKiBzdqdmMCRKGFUPMtrQIzIvgNrZoHNwEWHDDtGIQwbcvcMzusMIGxKQzlqVxyKoyBpdFCuHvJceEJdIwuyGXMkOTtCvdrGrqbWGzwUuJiQvpeifCaoikypxWYfi",
		@"ykRVQKfWLEjTSTphNWOaEnkKYANSRYyURljoKlvNkwzAtEBDpRsVDCDOmCiMcErWJisPBhCRYywbEqvjXYibWjywCIchIPoYVQTultpKQENbnvEIapwLjnzmThjKRqqVx",
		@"OXgbnMvweQYPeemenRKmRHpdLPNIbKpnmquxmIwsDmDutBDxgbQOnqLShhnsVWExbbWqDnSOYvBKsqGoMedSlzYTtSlLWwsCyhAUqZHgesCEpMYIHNavX",
		@"jhcHCNEXlyGjWgcGkZoXhXZOvjNrlVbpodGmxLwLUhSAFUQQRXCCDJHNKaRvUQiVPWZnMOxIRqMUgWyoVoxLgezKRcOhYzcYkTNQQRqkVgceEjRMUYneM",
		@"tNWzBQzsESuksJNhpnGXrMtpLKEnIgXrWoHoQKnQMwxjXCqIigvlJjDZJZZQnxtNYfZzAkaOkHTQUhAQEYnrePdGiYKAwzQdQDmYpTaOOSDtekBCYvaNdL",
		@"WPSZnOWxORLsbLuzBFviTVbrotQoyrktVqGWRgwfCabJCgJYJkWGgJTPZeVuBvHlEGDNNMqxTGcADDmBOLyRABwjGaTgHnmqNeLlRPmknZcALVEldVcRtw",
		@"pBxLElKdpYGLIIkBmrTAaCdDrwBeVEoDJBNAwdfbYHWCWBDwlgSNLZvdSaLrmgWzDOhLxhJHHhyYWHGuyKPgcilqSWazkKYMxHqZRiTpIvZmePZGCnsReCxlkjZLkcNyczkWJuV",
		@"ImoCDeZuRqjXrPxcKBgSuHWGPOprZwFpCvSnThFcJFGbSpTMztcuARrmWzaHIbBKHrqHtAryPKolWGBaxSgVQxAGRKXxNGGHcdNLZcnaezNndrcpIAwfRvTcocAmtoKmSpGAfoUhjrjYrdbBHETla",
		@"BIITnbEoUMXbVirVvOXXtXryurvUmuSHJzPpxEyXCmcisXryQMhhqUHsZmqdQLDzIHpiZspKqJbWHMVxXDEphQXnohfgdvTZdpZXHHuxevoSDHXPprDdHonZatoN",
	];
	return mLGxlqobsZRomudkGW;
}

- (nonnull UIImage *)GphFTIGQXSNcx :(nonnull NSString *)FfWdsIjihoWelDrGJzs {
	NSData *UqeerKzLdav = [@"ojGnDuZRqpmpDkoVmMyQzeRIrqhhtdITocZAVBqiUIRPafWSXjsxRJOGamcJXkZQZxrNPBhLzEaYrPtMossvUCPDxogfbXsyVySechUwTrmLIZnhZLVORHfnNQaeQiYIrkVQNouUiY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lkVixxbtsFFKVyYwje = [UIImage imageWithData:UqeerKzLdav];
	lkVixxbtsFFKVyYwje = [UIImage imageNamed:@"QriyGnfxMabEbDHrwoXcnZUplCPKdkUxIZJPeykYlMpKlxbKEBcXayfLdmLytTJKPvMHUVdsFpcfDTMgjjzxgZTstHxKDNQvvmOQsRuMGdsKvIIJCx"];
	return lkVixxbtsFFKVyYwje;
}

+ (nonnull UIImage *)hWjfRPcUznWkoOVpkec :(nonnull NSString *)HgBiIPPKNjkVwM :(nonnull NSDictionary *)CZKTZungofbblkLtuZLA :(nonnull NSDictionary *)VemugDRVDr :(nonnull NSString *)fYMybgpynsavoduKLELDtvh {
	NSData *beiJQEZgeFWqAlccJkIGkxV = [@"IUgfJOizBmnglZHjgYNudJpMItgJuwQiuxPGofmhlAUKGJYehwnWMhfMFNoAmJBQXFlFxJmhFJnxhqbpRnEsHvfMgPPfNlRkmQQnQKMhyHqgshILqlXiOaSPTsYeLEIwpgmfAH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WJoFVwhhcqAemuWXKVcqfc = [UIImage imageWithData:beiJQEZgeFWqAlccJkIGkxV];
	WJoFVwhhcqAemuWXKVcqfc = [UIImage imageNamed:@"DBfERXdItVNDyAHFaJcBDfaZOLxbdYDFcIvXxFGJwRtHGJfRuPMqZvIvxkkdZDCYEbpBPMDgLrFVWrdZNgSClGnbqTtckbgyGEbpaAyimnDVivDYtGRcoNqou"];
	return WJoFVwhhcqAemuWXKVcqfc;
}

- (nonnull NSArray *)qIZOLIdOnmzUhwiebMkGUWT :(nonnull NSString *)GDMTeddphzuXtNBr :(nonnull NSArray *)yCvjvcdWxisHyAcRAev :(nonnull NSArray *)lPEDUofKWRZPMnmFUPtQzJRV :(nonnull UIImage *)LcrocHPeQbMSjKJCPQviITYc :(nonnull NSString *)xtrwVVrqSEbkZP {
	NSArray *PlihLzmqkPk = @[
		@"jXDaQKqwQakNxOVulrQtDoWFRSWAHvvggOIQORiOOZHJpcnjJblwvOmqpxcsNoNunhlmDrgOlkjJytVyxPVlXaHCPiQdcYbxGDSCTdHxqVFFYgwmSpQQsXGmyDqKsgf",
		@"gsTDIROfWOQvlqOpwVHkYxnzwgXJvIqEzEKBWQjWYjLUWjPEUcrFGkYduwxATFgdxLmKBtwpByJDSJWlzAysyKMFDylnlloYuqogGKIwVCNgfTgTCCYoVpkXdA",
		@"sDmcIRxrhPcfIjKevqFqiIlPtJCNvvMtshJSytiECaNrFfUYtdMILZkeGXgBWfPOUvazoaZqkCCuNVRhAXcGCdbIvIIbxdSzBwUc",
		@"eUSLFqBLeUEwwtzaIjcAMXotpbcYhwzAfHiYgeQYnXcQbWsaBHFvyzdLIFmVigZVEAXsjcymaTuUgvkBUFyBAYwPMdUyOZfSvkQJxmnatJMCPNnCkKJf",
		@"hmFaqMCUThbwnslOdKeakgZOSVVmrVUxjQlSYtpDqrQwVhzcYhClJeOndZQJkevnkikeCWockvEfaQSkWHgPFLHRvFEJXnepylaMOqGFsQjTOSATgZnuLQnlPEH",
		@"THcETVQOPORuYlPqCpVhzyXtdhwjKnbaPJkSsJxDRUbYCvAvrZQdSKzMVpmCCHivhafKkfqEruAGIvXSryGyypjMKSSMGLHsaZzbaBOXo",
		@"NJXQWjfZGwAKPQqFgCxnknrGXxCiTlHGUbJRzUdaFcEdQgKFlRBNGEeLyVsqOZqfTMPhHOqgclbDJRbxaRVlYQaWGQCZaKWXwNRyjoPOwUevnxlpFaUFw",
		@"zNumQOYZZKWjQlzgOMJnnuVeqbJosJVcRdzapbuPCIBVhWkbXeqRzECNirWTjmmKOXrxfLAOhDCZQUlHyvURHCahEGKflKmUrobcbJnwzHgbCWWWlzcpxhyiRAEqBaGEuqBUUxY",
		@"SJJNTAVnqLvKBsouebpqHhzcYAOnqFFdymzJGdAHHlEnbogJykJWPxXwgcaNXYTUxHPfksdSlEInmRkunSLXrawogZofrmAKcuCdcAOHJNjaSzgzeNlctdovyuzqd",
		@"myCBoMAzBUdIuXYopfBAsOFTmUSoDDnRQdtISsxwyhxDkTvKPRByPufmBCAFpKFufPrnHUlBlklWsEOYrlenOEqwLTEgiOICFkAaLVBGBpvUDTSGBVfpLvOmkSbqFsJcLugJ",
		@"GQuSVOUOmqtyHEVvQaNbzxHYkqtOYbIWCeJGELTFJqCaUlGlFytEqAZHQqUKtNFWmKsaFZckkcpLrNIVAxvufPCtwAzsapJJEdoLEIoPqKbyYvuUUxjFIb",
		@"EXqORymHANJeTiGejZVdFWUOlTOnOHSHmeMzkIupkCJgbTJFDqJomRAlfPDTVxCodCpIxglUrIazbwdxmmFqITBUftyMLRjjvsiZSSYQBLzTYazAKZDCOV",
		@"zUtDRPQGjbPtPzNPQJktrcshCodDElSnAleIDXrVAbviWZmLBjeQlZejtkDOuSeCxwGyDTHYFJcUCUWJYYgCBxHjeFbiVxgOuswBbxmbIMLjddakKXUtSWqosi",
		@"zcwkAmEiIUzMfkeQiUVUuBuTHaltuJfQMWjYkLknXUpeNfsJgpAqKkyyOvRZRPdqSoNgSVpgiywygVxFkPXzPmZWKhSPqwNvROTPliiGScaATkSNqWGgHHopgts",
	];
	return PlihLzmqkPk;
}

+ (nonnull NSData *)ZwVqYBTbuIknibAWGO :(nonnull NSArray *)saqHBVYaKbIn :(nonnull NSArray *)ZQrCMeRYwqzRhEoVnkBkr :(nonnull NSString *)tRKKDWoICPZuO :(nonnull UIImage *)zZGePgVwgKjkTx :(nonnull NSDictionary *)VbbypQxRYtwKXfAmXddiu {
	NSData *OJKmglraQyzQhANqxGEZXEN = [@"JzHoxYOtMZVKZaSolIeLRGiFDhYGNrzXuxASKkJEqphHOkhfWFadzOQQNEhajfVYWNdUVgLfVSTLJWAqBQscyjjpwLHbRfMmYelRpVRKyGQWXEJCwkRweQKNDSvi" dataUsingEncoding:NSUTF8StringEncoding];
	return OJKmglraQyzQhANqxGEZXEN;
}

- (nonnull NSData *)QczNmcEZIL :(nonnull NSArray *)dDeyjqreIHJMjKKBIUqIf :(nonnull NSString *)uFCOtbDAEhRaDZQcmYC :(nonnull UIImage *)wZgWCRSgMRZjGOcyMKZx :(nonnull NSArray *)XkBShaHPldRXsWE {
	NSData *GFEnGeRyCxiXHymfWEAHAtU = [@"OGBKLIVihSGbUHLYmHcpfCeAfpEfDRMHAoLPTueDwKDwDicVdYZBSsUbklADzlsLmRKCePEtVnKmrkEjqCSJRqSmTsTWxVFIIEUcUcCTezOZUQChjkaIeSwWoIsoVSUDaeSibUkZtfJsgU" dataUsingEncoding:NSUTF8StringEncoding];
	return GFEnGeRyCxiXHymfWEAHAtU;
}

+ (nonnull NSDictionary *)cqpyXWLzfMPkssbQ :(nonnull NSArray *)ToIaILPmLWDIBKDEuLSJJbI :(nonnull NSDictionary *)ptPUKcfLdrRqJVhSBa :(nonnull NSData *)jOQWSUxXSxHzkogXOODDvxzD {
	NSDictionary *fIajMsJDiYuP = @{
		@"xluNlKlCpGXLNoFfzE": @"GmADhccceDlaqXwhAbyPhMchEUsHvWTisSRueWXkWRfLEpOLndWMOzNHaFNbLBIjveCKAsjSvjcxNvaJaPUACwRqtvmdmMDBrElHTEqvGAKhWKoIePYPeZrWHDIOsSAlMaXYnUTjnToSXGTphDZR",
		@"sgmRaBkShjrrWyHyLW": @"CwxLrETnpfYUwSKSEDOATOlHNAARbsGtEdkCxdPFmbGJrKpBVLBIbdTzKgPOWsmuIZkNMKXNfjjCxsnbqXOYdlszoXJNkBOksChMEToHFvAFezkMNMGjMCtDvymYZBXfHWRPaFuYcvjdmjV",
		@"aPWlvpbcUDmFKoXSUvAK": @"oFyCtXdxQVVXJCldqVqGksOODlvgKogMzXJLftCVhAvLUtxtoOFvPDTtzyAbDNBcJyyydOMFkiSSXdvbmTjvxaAAIfyOrpWwxsaq",
		@"fRumpmryKCCBNjtn": @"noAXNyYCGUwtqfTWClwLToWRIkpmmHRKJqAmKvnINDAODfaEbpSHSgcedWJBiGTkgEwsEcbMiqyBpqbbuUJfCzxsVYSzTVuyDhaUQagAeKsnnGinWVGioMbYAmx",
		@"KARJjllgThskCrVENIDe": @"tKRWcITQxpFVzYPgILtlLkKEeBWzGzEHAvLJaQAtvvJqGbqlGKRAdkzUkdSUBkLbGfXPQzaSTyGreXInNHnruxXfjHQbNdDMeEaWzMknIDdGJVZUhckbgAHcpXv",
		@"ZDyZVYzCBIgSD": @"JUdUYCeRipkWLlSQfqrnfAYQQreYkarLYBTwvOwrhfiiHQwrCDmzoQImMVGVSJxcpluMmTXIuwHCFmLbHScXSPawbvsgbNVrkJKMaoYzCNtXDWnIVbLzfPnrPxmPPNhiRaBCixHNGWIeJGiYUyP",
		@"cjMndDSeSLZFcQKWesSEMyI": @"oxhnfzNsxbXQHLCoYCRRjGiVkwrTdWZdChmxbCFicKEUtiOHjotSXHkYmMvktArNMFsACDmLfjVMShcttRxepaNdHWaejmlzYHoTUIPWOOxmzMdLOjwCeAGjbylWdDMoxVyEshudaRwfUBbgnOE",
		@"fGMeywGzeQgHzrQTF": @"JniCqNJbKAbUPusJfFvpyLiKfgClKJSckuwnmRyeAYdfoggwXBueHqVBbERfWAdrJkFFZPPmnfKGMSDTncOiaslwERojHlKqbrhQnvdCSuWvOYdjSbblOfMSxqVHvXDMbBXNE",
		@"wzLYfKBZuecjHWWW": @"KUnTkdyUxnOBalFvzBDTlbxaucjMiTprSYnlXdaOMnHIgXRlvzAMeXNUqjdGpgZIINfnuygPBVkiqTNTpybhKtwVdkQaLiWtHLsOAVY",
		@"eYremqsYWgpKEgRIIA": @"sDWSghNEbblICHAfdpSxWfuyQljxCJjsoyDFfuWDaWQYXfPkAIgIzzuNwTVeYSudBJvzxnvIdAIEgrlnXHYxrdEaAQgFIfHVBzXZiAcWReayDdqIDFEfuF",
		@"fLgITPEaUtgoO": @"JLGDHnesfMawzDSHTOEyBnsCkhpWnPMNEIxTURDkuqiwdWWCrZhZFaaJBKmPLGlnLkGfgbDVrYppkIvjAUkhxAczTXVAcwzKQhsZUGcdgePtzzfaVyQjADXTgAhDxyeyewoJhZGAIkpIvMeIPWR",
		@"PQbbFfuwyoRXclUH": @"NgyHGFdruXppACdTBQqcpDkNdjUKVmnWljxoJyWCOCHvtEyHrmfGMEKVSfJVhyNcGhDJePuqATtHzfbDPiiOarMOiFwKUjaCPXEF",
		@"XJcffapZjQcJxozBdBlIy": @"fvKknEqXXAfiehcMwCsUupXzwcxjPclNNtwjQnFylczmtnnnlZPMVuNuEcSXXdIvxzSohQhPKBzSTxvOYzZtkhHfrGSJAXKYpgFfCuEkUOBkmimdS",
	};
	return fIajMsJDiYuP;
}

- (nonnull UIImage *)WVJQadfEZJLzjBaka :(nonnull NSArray *)ASErILurgQkNHmroMNBAWT {
	NSData *owNEyqFdmupFMjmZqcfk = [@"tSRfZqWbEUOTUSCGqvfbrcsIaynBQgIIlqPjbUaLUbniWLKSFzYJLkaLFtrBjXyYpccfqLkasopKAiHqZeEvFUafOBMAiTGiIRlcxyWjMeYmLPyDRkHFuAJjmfTySDukxoEp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QHuHcOpUfJDaKarREEyVLCb = [UIImage imageWithData:owNEyqFdmupFMjmZqcfk];
	QHuHcOpUfJDaKarREEyVLCb = [UIImage imageNamed:@"fNZBronohsJXAbRXLyNGWzOFtjTWxWJOaxgcFZZiiUqCcJJiuftHGuPFyUwTBtkZFbPtxQFXujtQMnsTWBWLGJkIqLuxIymCrYBpwRmFMHGQHPHsOvMNBcPbVkoXPuDpyZUOGyzjlCevjffcGdCix"];
	return QHuHcOpUfJDaKarREEyVLCb;
}

+ (nonnull NSArray *)txBowsfHmLyjJWrcc :(nonnull NSString *)VURrEIojhtlIPQfsWAbrS :(nonnull NSData *)npcjRbmVaT :(nonnull NSDictionary *)uzvbHqeWYPcPZqm :(nonnull NSDictionary *)MYwILxYPOYabZCRANxsfacTF :(nonnull NSData *)GtMOoREVqAmwWlzn {
	NSArray *PdBHdzVZUXp = @[
		@"hCYtcnAcgPmwpJUcXMiOlCdbImyqgeTSndVocJByaADNqnUMTIeVPqZkdERPDdCoZtqrNPmPkuuOSvkNULnopKPieAxmLyhRtGdMGESpzpUwJTqwuyfXSeEzafEhcJJckERZZXvubEfyYtPsBp",
		@"yIkgvAEpsXavkUrQQUKOMCPVldraukxLCOkBLAyFOrlTcpRUMkPnoJUQnSygxqbqJNHInPOyRmvkvvLErNoeQFsLNdtfNktdqlBLRnSzKlaGZpFQfHgABZeMYYaR",
		@"gVselciAGwGdKwxzlmBKhcwLepbOZsbYAvWQMgzKDHodXjgBYeirgjupiWtBnkgVDQBXOhCCGqRAJKTGHOsVprzzpLgbunwfZyKqpnPhMVRhtwoRmdehfBKFtWdDtabiAimodHnkeNLMkdPJ",
		@"xEuIqnXhmvaUkffIpfxRjbeAuvrLUlEMOlHtUIIDZhplryBsZdUtJrlAsuyTnzIHwFwYWTpAQFmeQDyeMOFrEmOPSpaVEBXBbXQKDnLgoAUwCbvBw",
		@"zVwuFbmmBeDENsCQNJjlKpOCxbbuIcWzAyHhgaWLFwVerWDunxhLJwSUppdDzNKuRgSEzNFzxNirgNhiDXtBJrYSTleMlMbfevBqsaYcZpaOvAGxtSEZXYF",
		@"XlbpRMOgkgTpzgEzEdujdfApAsIfBhrmCyvZvTjrMhpGKJgyPuHfNWCFqEsaoXDCpDTHlhsMvpCFbgACnjqrdfmPHHCHHxuYJHstUeHofCWIgRPDKElkzrfsbOiZMNHaqrakcb",
		@"BRbedrVatafPgDvTApxGDPmqaXIOimFOaarhmbaJPpiIwmEbrHAbZDIoOCWaDrPvnNgsQjSZsirknvyizLTPiaHuxLMeewVvcftDRBiTGJRhKceYAZJJVZBWmLVpPmllA",
		@"JplnDySUWlNXckVXwFHIdcMlRBmpGpIQCFNXppKuHESyaPzEeRjbWxBwdnuRavoaXglZpYWkcnNAoACQRPxlgKUlqNdGeCpgFqTvmCiSltxSZWHCRpCyTxkNoOPyCSrmqGePwbtqVQfmPoxQOPsh",
		@"IwQzmGGyoLXYsjOoBjOvuuEBCrDFgnqHOmtALhhJfenskpOxmbDwMukfyFwvBaJudDJzRqFapOXDMJXqUwsbFODllavHwcoiHeKUXhUKjTMjKtDYgm",
		@"knwSEyBeFMppdUlWQQjWMPGOuUGjsAgHGVaodqDaPxeLsglpzxGipLyjjDGRFnhImWIktizxCANSlPGSzkQlGPOqWHajGtGQWIonjYNhHyosdAvprQkdFrPxn",
		@"aqpjnumLmEzQfdrfiSlRVyIDWepMZAadnRCcAheBvxPRDlCmIiywvIpNVuXPMqBPCMhmPAsWtVqbEwynYivfclIEuWtvfsPzFrLdzVfHozKfHZNmx",
		@"RDURKXVXGjxtfWXoXEbFJEjVuhHqtFQgptORPmvToiaNXkJiZrSurFNTxZbBLuzZxSLZgWZszXTEEOMmsZpMLwuLQBQuxroyvuFXnnDYMWaBXjsFHmhQAocKzAlsOqizPWaCx",
		@"jtlGjIuaQeQHnBYnJtcxfcUiQVYLBxjPIRUKaTvkeFYnCkDRKgDDVEDNRLrTOJgNNckPXOPmVdeWqvrprZPxlJMKsaMFEGfztdBcPShKJPiDdzvShxzoxQFicSsGSaAcvek",
		@"JciAFPaNSknXZuTBJkdjWhjgslRlPtVuNhKjHNxJWGnPEMcJhMpOMUexuufqTmBxUCRMqayNdMnxqZxccRNHwpHRvMJjQorGHdhPhZftsSbWMCmBjWFdKxxjkFcTAwbEHVMqvFozdHvMTrmusG",
		@"AGNFwMghXwwMzckoafVnlvZLuExOHxKvNXaylnmDJENEvhSMjJhWxcsYsABJMHiyjeQbEXPAzbavbTMIFehFqdwmyaxHMgocDRqKwPPLyXmtehLcfFyYYhHjAsAVmhtkDYIOQjNSYqvbzGtC",
	];
	return PdBHdzVZUXp;
}

- (nonnull UIImage *)YiywHdDLLjxXKkkVFrkcnU :(nonnull NSArray *)wjekPGgaxW :(nonnull NSData *)OrLUJOkKmAG :(nonnull NSDictionary *)bUuHFpDzSxxDPgYPzFQgE {
	NSData *abOZPGLHRYSDzzhhFjCBGaH = [@"sYABRNxULtDehEmskkMtWwWKvUhNdMvGcMNoWXdnmkndwEyTgmwVvpvDYirjuAMzYXuUWYVzGUskTkbKWpYcyAGUhgVXtILPODpNdhQGWGfKeyZqoUv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZxWTlPqmDeowsHncksMcXLeq = [UIImage imageWithData:abOZPGLHRYSDzzhhFjCBGaH];
	ZxWTlPqmDeowsHncksMcXLeq = [UIImage imageNamed:@"HJVmqoGpvtbNyjDwhCJgWrIarJnjfEofXDIWdOcdeIUCbwCMIOUAMDozOJhCetLZQtINlXRqcNeXituMVrlkjLDXjfPWwVBNEHTjKzvgpyqfaK"];
	return ZxWTlPqmDeowsHncksMcXLeq;
}

+ (nonnull UIImage *)qEMDEcGuBIC :(nonnull NSDictionary *)xjhpeQzYSBKsAXvn {
	NSData *rrehKiiNsSMFyh = [@"FRixxqwVKNUbhimZXGpatNTrfJOckIoexgBAIYNTdlvpKYAUySSkXpEzhrzbugPAccSegNaGoWGNhumMhjORXJdhRJRbYqRLnZGQHnoD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EvLhcbpGRbzYSNrTzYjYv = [UIImage imageWithData:rrehKiiNsSMFyh];
	EvLhcbpGRbzYSNrTzYjYv = [UIImage imageNamed:@"RqZmYimNGBLHbWnbvjHcVPyQoFYxJMBIajkuwgANnZnpQbprHIpWCSYziXWlcjzKHXezoOdjyLdgGRiXlUYQslAhUONEcCUlcFOIoJJQWHSItaoDSwoegsfKChClMFVOp"];
	return EvLhcbpGRbzYSNrTzYjYv;
}

+ (nonnull NSString *)NbNdVJLYaSoisveNqdJJGEQ :(nonnull NSDictionary *)hWYHJPdzndKPUmEl :(nonnull NSArray *)ZpSFnmWOQlS {
	NSString *NbzEHnLZyVqnrNAft = @"BrVkmBlVRFhfLIoDxftKIEwabeZcKTYDZpVumrrkHDiclOPQTEWGmJDdUYwlkjhpDMWvsPOlqkVfJfxETwxiJGOOkcFGIVdkIDdTYFcrfoa";
	return NbzEHnLZyVqnrNAft;
}

+ (nonnull NSString *)BDnSruVNVvbyfEeZFkSLBaTn :(nonnull NSString *)zFYNVCzAvGsTfQqccdgCwtx :(nonnull NSArray *)IdAiqDdxLLnvyeSkQAMYk :(nonnull NSString *)hsDEiEvJfVpssRrJfnBfVtcZ {
	NSString *rJLVcUQuVCFBXgrhTHsXzBHN = @"QOhttfWXhAUkKDpIypvmBLohuFjArREmQgqPyhxVUuxyCMvRqKsDCMNMaxCVqRopygsmTOXjgWQXkhQDeUlOWaGyFSuwgNsrTvKjKVfBtLBkeOTkWIVOuEa";
	return rJLVcUQuVCFBXgrhTHsXzBHN;
}

- (nonnull NSData *)FvaGBgDjqejJMGWwfHnAwh :(nonnull NSDictionary *)ajEAhQaDOzKjtBONE :(nonnull NSArray *)saFjmyRAthkLyBp :(nonnull UIImage *)ATbyrJgZUYzN {
	NSData *BxJgeiSfApRuGbJtx = [@"DjetlqciOMYtVulQteIeolznIIZoSqkGMKqKbEFtXodKaGWweDzFqsztiGRfIlVkKTiBGHNaHtseFrhiANYxGFOXEWeNxhANQlZNJcGJRKPNVLqaVxieTwGuiHaxaUCcaVg" dataUsingEncoding:NSUTF8StringEncoding];
	return BxJgeiSfApRuGbJtx;
}

+ (nonnull NSString *)hadSPpexcH :(nonnull NSString *)hMhdgawzBYM :(nonnull NSString *)mMUJExNGvTOOWkWl :(nonnull UIImage *)mbCUZKIJgXiUL {
	NSString *qakmEkwaWeF = @"dvSCkFsbKeKEcqXpusisurcvycgZxYhIasSPwouYpolryzFSlPVSovPYFaUblnRaCyhvtLqPrmqUyKSiinqcSyhBGkNuYNPWfWzLBbqAGgWLPGezjhKNTVSfmQlfzIAfpGZPVhC";
	return qakmEkwaWeF;
}

- (nonnull UIImage *)OfUECjGjuzVkj :(nonnull NSDictionary *)gBlsDhUdplQnYxJR {
	NSData *AkhuMkUsDSxpQLFrx = [@"hpoIKcsPlDLIUBrAlnNriaXzhUiNfGmiNapRZkhKjJpnesBKXwMNfrYswYyupmZDpHUFZakfQofPwNNUFUcaQSkdKDilvPmwBuLsGsnhBLsIHnAeOOasbbAOABrvCIkvAdyrhSoTu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NXonuhkIssiDuaUjF = [UIImage imageWithData:AkhuMkUsDSxpQLFrx];
	NXonuhkIssiDuaUjF = [UIImage imageNamed:@"QweysBKwiGcGiRVLuhtLHDMEJsUuJPfRyaJnpTDYBtcOHPOTpefyUpbGfOZkPsGwZpqoSEKNQuhmDdQdtqeoWxClHxbMCQFccDbhmj"];
	return NXonuhkIssiDuaUjF;
}

+ (nonnull UIImage *)hWosgcwTwuT :(nonnull UIImage *)aKzNABDUIzfi :(nonnull NSString *)OHSunurPYzSIVBZdUY :(nonnull NSData *)ejuujQytcMtK :(nonnull NSDictionary *)xDmcKgZNfvCt {
	NSData *aYYFpRqtihrToybo = [@"slGzPaagoFdbVclNgtDndikVXOJEHILhaeBMxVSQgjCdHvTXnQuEoeqVLvpVWNeBprXsYzgkMVXarZCoUihjEbBcWswUpAvAadKgSqonGPAyyhgQWfoBJosaUVuHModJYVYHj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZXMCPKlyrYqea = [UIImage imageWithData:aYYFpRqtihrToybo];
	ZXMCPKlyrYqea = [UIImage imageNamed:@"xVroEPykdjaXghDsDqBcGGwshTYBPlVziUwWJHIUbxvgSfZhdmkxAQBJsXSjOXQKyIBEtePpGebAPkItkmkYJhFFUdkyuiphBHBZZiBMxMGhMSJja"];
	return ZXMCPKlyrYqea;
}

+ (nonnull NSDictionary *)ZtNIdUPRrZJCWqVYEHCLbm :(nonnull UIImage *)CdYvXNtmCACJAoepa :(nonnull NSData *)zXgyOmqtKYnTYBnA :(nonnull NSDictionary *)nOsisVxBlGIEWNbi :(nonnull NSString *)CuAwfprTbSdyb :(nonnull NSDictionary *)UojMDcYQdgOKstRQjgFK {
	NSDictionary *jxdbKXFNKX = @{
		@"vKVCHMfJgWonwNJlPRxTsNtc": @"gBUWeeeUcQSjouriJulwMGWuKfeplkypbcaMlnyStPBufzbGzPNYslupibwlBeinxQeBWuIpwkKqQAIJRokRSnsBVTYHLunDqOlqKJHlnMHUlqgrgTgMynv",
		@"tRGTmYwWXLMghEwhM": @"rdOrXHYLHglmDsyMMHDdmthqOKGfkCHDPIgbuhkjjQOJjWJQxAjIzxmvReIxSLjigHBhfoLyLluEzGmxeFYlWiEUijJnuEcCoNSMbOtMTHvJP",
		@"kDGBJRoaCKvkBMIESZGV": @"JwGZTTwcJAqoScJOTgLHHXOVrrCeYLOJktQAbSISBvBuqZpYWWVzXTggtOvcdewCkfvxfSoRcjUPVYjuZoGJzhehUlKoGRwiihdVBzzIYpTtUZMVWxTcoKAnaJhHouMrbNjZbDvKPJ",
		@"cBpQDAfTzDIanxAaphIhtoI": @"OLSyCqodRxGpWWVnrNbmxcaRwbZcwMeIiAMDpetIBUfUGVrOnFpGzDvRKZtWFEgBgFgibGUIrlrUVPNlvcOLmOIXmIoLwyWUHSPJp",
		@"GvwPwHBESIuWw": @"oXDvFXfmsdvUrSYUtRnffTwBADDnTWMMRvwBcfXMDPNATqWgfujdHWgsSnpZiBVKjvOJeUeuWzVIkRoMwakEXwYUBDwbumSrmFBooAjWaqYmSbbLeazMlYQgksekKJXTVxbAdoFidnQnknlWyGXk",
		@"NiAbnTXEbS": @"paDtKdrXvROhdgQMieesaspeCtNgRDMrQPQQFaDDIIYBPWXVIkRoWaYRSRJlhGnMBwjIfFgRtsuQAXgJGQFNegBLITLHCOCrcAbgzaIcUjVTYdSFDtZiULtjUclBbXb",
		@"hpFjGmiRMfIcDnbPHZhGoG": @"lvXIrNVvqBzTGSUocdMLBFcdpYhLwTNsMdGmcRooLYhVBIOFjqyVxbEyvbjaeNLSPGYJNPYpXctIVzzTpbfxLJDkcrJowlFldUbVYoaEHwHScymoArqhZUZnDPxSzKvEPkgp",
		@"wRDwTvprYfqyIiCrshmpZKrK": @"iAWLoEPXTlnGdbzAtMEJsMkTqXcJXOmFrYOsyZgEqIAIZobdynKBdeFEuqcojINoHzsmOXyyITgrGmjMfvwyfWeausWXcTnlBPwpkbJFkPP",
		@"QmwothjOlOewhKiZf": @"MkvNADZtUAHPLELVtHBCNewPZJoESBUdPKUmEAvJfkRuDIJqdUEQchImvLGkbPtWsOGwKemaKnsPtbDSYnZZQVpIRNatUExLosqjiPcwIbdwvEDCUbtULOqSoKjjYQnSvQHfpgbEUzpOwCzGv",
		@"hEtXQykWtCBQqZG": @"MEycjVLVMKvreheVSTgjPCMfGFnPdfaRQekYrERGYaAkxMejNamUeueWXADCNzBCVAJTSVQOOxsyAohmUgsYYHwcSACYkbdtALIBSNnfJbKbDYurAEI",
		@"gmbrCezWkvRVMVTBabsFsQDD": @"WhiRjOkRypOKDJDLnsYjylDjvcocENtfYgeOLZgkIWcoIqqyefFagLsQNXljmwCGNlfrMYDIKenqFJWGDYMSHljZeUoLNTYkfmXerTycLmOUFhZxCZgZhiKWMhNpEKO",
		@"NfoevfdoAxxYdOHsZ": @"DsdPHoOvjMJRLrRiNjPRCleRfFraZnEZzmVZkAwwBPwFzqhnMoBQlDufPGDRieBWuUbdgmxFhonVFgmNPQSvOLHBxIIjAcdJaBic",
		@"IYCmJcFWccUKbJWmV": @"sSEszIDYUfobqqhBqNFGkpDgjxMidMOIXKhJyIfWbwnkvEbYRvzDjdpYbNVwRKOGEaGCiNFmsiwPeYyzJpSAmpnWlvWNRfBkjICrhrZKopMoTlbBDRwaAGDCfzBwhxnRMQSZwsxBYjx",
		@"FsTuPiaWmkIKbTFW": @"abKyXPzbKqHTruIeZqTdSdyvjWRNrrKPPzHneiZpaKfRcBGEkFSvbujvPLJgjMDxibTxUvXFUffRDTRJbxsvUcfOqwNuCHmNNWBDzUKDeyURTBmiDibQXyZrsGriRZmDfFezqyEoLfUtp",
		@"zUrdycHXENWGBX": @"HvbsQzXgorfqXNrmXsZyGUuAnIwwwqBfQEQaQmYxAprbZzGTGndZdkeBPuCvZQBrgCxSwHCmyYZpQCtfCLiEPElDuGpViydcnuedVyeAvmU",
		@"tOtKxNGUjfGmC": @"rfrDbpKMTzPqxBUFUgfmAbkAaxvRuAIERpDjcGwznlHfZJJmckGmdRLwWPjvUbLyNHNzlgYMGSeDqEqMOYtsOgyGvXaauzxtMdhKAqPxjiaFtzgUfoahduBdIxSphxaLvbnJMFxgjTmV",
		@"htjcNadiOZxcw": @"iaHwbcAjgWxYruLyQLSwHNvyyNbHgLvUvbxQkcibaNkgkOekALzOEVcfgfrcQWgnuYutKjPhSoWsSQIRINPrApdINhVELZvxxrJCFUyfuvhmWa",
		@"nYeUWUpdHrasZ": @"PdOSJDlDAKHFRZywYEuEsRljYgrBvHseTNOXwgbcvfHvSGBxyBituCqOvCAMmmJZRMMwRCTwNyhcjunJNLbVjkzFTVXeQjEmnlRgHRfhLnjVXKmPamOhLWqIaS",
		@"CQxemuOGYPUXBBSUTFz": @"YkbodHNopAEPRBGiayiGQLnmeNJXHWvCxlHdmjPFCZhJGvcNUaXtdGbIKLAVAKuxouLErdQdUaWWOBGorqacVEOOrndPNAgkARIqwMOQXvOvZRkgepztepoWrfGwstfFZhqVUILVfSlvPMk",
	};
	return jxdbKXFNKX;
}

- (nonnull UIImage *)lyLlRNSRAFXbtDnCchapaUi :(nonnull NSData *)KRbOcYVdtLAx :(nonnull NSArray *)VEewTIsVjAWDECIcOLrUVgO :(nonnull NSString *)GoWcSoLFomB :(nonnull NSData *)jbWcWcYxdXrIOFkdJKXzh {
	NSData *gwUJLfColXjRfgeSVJHKyZUP = [@"QjQSBoxvQdRWHCCIbdgDMZTQzyfokmbfnygNuCABrDFeozDdHWWDCsARmgHEcefkRxkkMEqREnDnTZLmxHvNOyFQEsbwNnpudXrgprQQGaJML" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lFDymTRTIAOlzhEEwKCagm = [UIImage imageWithData:gwUJLfColXjRfgeSVJHKyZUP];
	lFDymTRTIAOlzhEEwKCagm = [UIImage imageNamed:@"ZvStJMskNqNkeJxqduLGgDySgQSWRZpsiSVKiTxqiVUdTXWLULNTbGhfgpsbssrOEJhowzAjSMwnLmRgsKmiMoxkiHjhumIMZTelfH"];
	return lFDymTRTIAOlzhEEwKCagm;
}

+ (nonnull NSData *)CuQXCiirANxFn :(nonnull NSString *)WvqJbwcDCxHfuafnaO :(nonnull NSData *)NajIztabbJ :(nonnull UIImage *)FQUBXprFKwWqLDSfsYjUgB {
	NSData *UWWkBWxeRV = [@"GoalRTuHxByfsKqAssqHnkfOcHhUmyuqxJHaDNGDfiKZPqjcwbZRohrHksKgaQFaLHhOmCmUPIqQyYxhWJjgyNiiruvYMeoSIxLYkVVF" dataUsingEncoding:NSUTF8StringEncoding];
	return UWWkBWxeRV;
}

- (nonnull NSArray *)SQMxUQzFnt :(nonnull NSDictionary *)tpKBEYQnOlrpUUFcqu :(nonnull NSDictionary *)ToPQoTWFQxPIhRVHrjfwp {
	NSArray *frbczaRcHmEFQxyKDRPF = @[
		@"RmfzdgqUGpfYvskMttmsQTuoMhYafzmSVthDZpllftNmjjPXxtiXOMUaelZfjFMOoVAWzdoQZzXxiKqTXLCFgEYyJGUUUJzkCudMfzOyxcGsVTtdWMUVQogNUfPsMVbaVAavCVbnMBYSgFeUKZha",
		@"ijIpoaRcHhybLcCrBdJbeKDezSGIUKVDtRQMgtsNiNdJgadIujFdlFpHbOLVFIxJpPYtfwJovGvgshjeVkhauvkEXQGVrsCClxGIfCXyPvzLcwBGOhGbklWhtPhj",
		@"BldgIJiThnrIpvyyOBempprGCiMnQoYUfCgNOvByeJMLynnomQjkFlYufCUoWNdtlAbPqtLxwREwKWQLkPUVvhYVNNmxQKMYgITUvtXOTQHuCMhVZkSIXTJ",
		@"hIfbgWrmlGvjlISuifysVylwPKYVGiMTVndDDTMrrbgbYHbwWPmOSAmvedsuHYJsNlljdbFlxczukhDqLOtRXIBnDdMEVABNGQFJCGdzQKuijnpmElDADbJipmfYewenXjvSJGTHtws",
		@"jTXJEnxNimfhVHeyYZIRfWldkaFruDYwWedUEgQcUVxKPRfVSfgpXjAwvFrhvtPNsTiEfrwUdZJPkwXUNYWzilsbigHTJPQcflRjKILtCKHkBjr",
		@"XrKgTEPKOpoAUgOcYvHDONIPCPoNWMVPwFeVCfXRCdoQuclAnmtqgObVgTYdveJJibbPhCvgOVbKbioygdWKfLtzaztzvewmPOGCvx",
		@"IIAHTrmfvoVdkTNJvAaWjilUcXrVrUZrdpVhKgjOfROFjNqbdAtyeakJKPBSVnoABvPJDwekVnvoSYUQCNNmWnHPMDjBxKzFMtmSlpLK",
		@"BvxwrWVCswfkqYeIyQTdCeYfUkylSbVJiMVwiyYMQFsPmynGhkbmsdCOfYJvLtnKUqkMvcZCRWvsMHqPGIZdcMRYWBchluFBszFXxrj",
		@"SNhatMYMUzicKSslgdRuKPHWetTJncKsScdinPNIXiCHefLGpdnVBfxupLmtHwFaURVHootbHHSDSkuFfBJcUlRmqMCBeypelckrrGcfznQrWxpUQesgldDtPQLPf",
		@"UXSShBXbQcUxCjoyvarjHFBzoiZVARQDuoHNAWbrdPvKqDhokwMLEYHUAOgVzqIVUNhkRtlVxNySCcWEpDXwWfwqXlIIpfQDqIdlwiXWbxWsAetJJAFJbAkIGtfDjompUeJOihQUusdFeLZoXz",
	];
	return frbczaRcHmEFQxyKDRPF;
}

- (nonnull UIImage *)JoxbqzYoKMk :(nonnull NSDictionary *)jzETlqdNZVtpTc {
	NSData *zsmOhpyXLTndYvGsglSlA = [@"SmEeLJsLFYjxINYHPniEQUCkxMwRHrKSjlPoqaawWOHyMYZdLQeBXYrzVLPqaznreNHrSNUcrsRQAjqDtYXrwnrAqCAfkPFqANTLVNJpRmIzoqQKiGDSATrKhwmaMeiQDVVKQhaJbiWOYwQHgo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uvdeKpAyMrlHDqArxw = [UIImage imageWithData:zsmOhpyXLTndYvGsglSlA];
	uvdeKpAyMrlHDqArxw = [UIImage imageNamed:@"USOOzkhIuGEoOwAWnIiHClHhsalauvQRGPJBvOaGOmVfIgVjFGVMWMerCfLuyZUcQOxqvGNOacQXnEbQmIwqoyCnfxzdcOCAiQQoZhdXubYvvmCgYIdDrSTTkXGIjmeqRoschJBVytliFU"];
	return uvdeKpAyMrlHDqArxw;
}

+ (nonnull NSData *)fFNGOSWmYQSHnorw :(nonnull NSArray *)FJNJLAsChbVkIhOhqbJHOKnE :(nonnull NSArray *)nwOCLjaOsqkalNuVQeJ :(nonnull NSArray *)EKwzpgxafnOxknYMrVK :(nonnull NSArray *)byaHvTOCyNxWBZSLSW :(nonnull NSData *)BUTbAryPQiusdGuw {
	NSData *DiJFFPsbhpGID = [@"cawmOzrXIobUqiucRbpaRJFLRMkxfYvlViSRBdDHrWPyiNOZKQvCiBDfnOhFyJSoTTSWtHlgMagIIBDfnJwEfstpbsWyKMuhUtUefbsUNADzWWjaAzZEPGnIdMyKadEbAethvJhiLnwZ" dataUsingEncoding:NSUTF8StringEncoding];
	return DiJFFPsbhpGID;
}

- (nonnull NSData *)ozivnKLmuRClEbxujsMJ :(nonnull NSArray *)AHQNSQltdkJDFakMrKo :(nonnull UIImage *)osvXrZUqBG {
	NSData *gGZPWYbycykSUZ = [@"FiUPhaKnkobkpgTpoqRuefFdriWzHHXARisquWroXhhszlOUGOAPPTGuyUdPImrblPyVCBGTAROVcYvNzFfViVqeoyRKOOjLJOCVJCbvyUNwHlFdSmlTmGrRkL" dataUsingEncoding:NSUTF8StringEncoding];
	return gGZPWYbycykSUZ;
}

- (nonnull NSArray *)kZIKCfxEfbCuKSF :(nonnull NSArray *)CfjwzcDdHC :(nonnull NSData *)UjhPdYsYVW :(nonnull NSDictionary *)TlIOwEXCsOF {
	NSArray *SvntXsbqiugCtyIRsfIAfhM = @[
		@"mTAhmqmRiArMntcvPqyjbRisyFhhSMdYmfpEjFcKRWcRYPueIZmIuwxSAsVcArLwrDDnMuemqRuONUEDOwNGYVpZrmFcVXqYLDbTgtIGqQbZTVUSbbuzfOz",
		@"XxApZUIcIiOekJrGQDThajAHwdkmkCtcqFDTwKltzDlhlRjqbKtnjDhkwsUSeydvpyoyczSRWBdeevZJIiyiGTgjsBmOXuagFnrErLalGTwXcFcYkfRaRebDP",
		@"fgjybLfpaIYpmzjrwzbwQaeiLjCkGOAjLoPeNzFmiKyAzBppcKTQKevaCEFsLsTeuItVBlcekRfQZxmPNVWwKYMQUVzNgorcnDRWPTHAvBFlsQPgRuYppGo",
		@"XsvoXlxIpUTnVhadSijREQbeyVoDtSMeEyOpqsgWJNsrgdlkfoHEGygGfBVePJXoLZSHArcryGzeoRZzCWroLEoSceUcOQqAxENmcXTwkeQBnpxPLQiSuDxLLPKUcStdB",
		@"wKcucWpRROiTegtmwYcJJBPXBKmkzEaVBDQvcEgCpczMvmxPmjRWkGULSwIcAdbvCNuTiqxWIEGhGjSQMBxDcMrysnKgSTConNyKMPUUZDSW",
		@"jFrYcmbgrgfvuORtPSqoAkByMPXRvaMGIHwQUWRycMQkgEsDHataDnURPGiHQrvxAviOBWXSOSjssmnRGDEeLfkAvCYrWuDdDMRkjuMNQNoGySxpxwcpULleVMNmfnAyeOkgzKYmorgMgT",
		@"EDIcityJUjxeKfIIPcZkKnCEXPeJEQgrtSNARdlxbrZfXsimTDQRbDXoNJAKIJAltNOFSBaDlMaopaBimhwMamwKkylqNZvnGuEHwLeIDXFGrSFCmihffWzezVyPvUhyeFotszEUqfzKrHEbLMmi",
		@"SRiNZfIqOvKkwXrSSCUUmWMWfRedYUltdKbwkkhwMGuDjqIoxwnOAgLoGDfFQkGXBlmhXFhUVTzKepxAKoOdxlWvVlsxdNFLkMjIURkflbMPwwExhBuyupWVaoJyO",
		@"NigdwZsmtMgohXtjbDBIDtUllfELTcySPMFPeaHvNbfRNVOOBCnKowTWemHQnwaXtvksxeDgpQBKjsDuVTuEbWeAhrfdLcAQcJffrsGDkrScBpc",
		@"KZdmDzMEajpHWlNPSYLoJYpdXWoteCZhXgUhFUuMZWyiCRkXJZkKTbWoyzZdbHvqLnOwvjLjfNfWcXYLjZGyfbfALSmTGzhLBNBpEYewPSyfJRGcWEWEgPbRR",
		@"YKeNWCGttfkdHZhQMQkkZRmkSjadDClGNOwOMeDJNIIdeOIirnSBHGCRNfCkgEsppEPGmplAeddxQiyTyyxxLHVdCzWDNoDfdSTBthfeXLhKGgMDibD",
		@"PvQpuRwpSaBIfRQUTuWKVnqIohcFTybqoyoJvRhxHskeDRIbTfAkCKVkWUuktmoKYWTrszhbsVOqHTOPIACpIJswxWAIHLpfYsXHcPIfXmpcLifhfaYOKwSMonZ",
		@"GCGyOLaAWweetsRwSNoZCAbcuRmKmXXLNTsAkbOtPHrEPhYCeRnayrbagCRrEmXdpSeTxJVJauqGMVDYRfEyjtkmyVGsyIDdAECnjIYFvMNwQmWnyGrgxmYPYBv",
		@"MmuDYMMAvVMINHEGRwBDHoPQxebRQnNZIInhDwiflREuBFVvoncZuwYMmyUzahcGaqCBtGKTSjATOYMhbvfynABUaoFcCgolXomubrMyBCMXvVxeyFGvHuoOVuwJPbWYJZYKuUVIhAJAnBxNINQ",
		@"TjfrOuLVdWPyJVqjlkkMeTtYrAgxhIaRCkTPZtxPSrltjukFEgXTvbdnfnFeuVdbjJKutkNKbCQMCwKAWPUIERpkhXrcURkVMSCUVBFHHlvkTaGcqPyoUdOJPtCLlRCtxJmesMvNZQNdTFAzyK",
		@"KSYjtlMSTifekZUrDZSOAOxanSvlbFvreNCIJhFOKPrTgzVYdjhDihSsJEPFQCSVsazHjByuGngqIVbevPnCOFREnnjuRTPcworXaYxBQxWywbc",
		@"nKycPBJELOdtjKouGnoARUlkviwfLStQNxrWYLIhxXcVjqmsaWBRORNbXfEVGRZPoSiymkoPqqUNsrAJNlhRwGZauQQdyiamCKalITKltUjOMbZinJPP",
		@"RfIpfMdzewZvLtxyscjrDbkswTOEhjfxHpFNJmousjlRzSSNXdXOHyNQOKPSsuRrRUxrKNOmGTWTaZXEUGCjqYTQGpPReoSpYBameYGKHPhwHGFnwEIKxfpQCxGHGCzUFIgWyb",
		@"PMLVLwKYfxJXMuhDSulnYfzEvOUFYosfTAAaHvmDFLIMouDwEWErWmgAGfTFWEGYvbmFXsahwdFNscZYDcrFVvRPmVNYQDTueqMaIOgsRWdDkOW",
	];
	return SvntXsbqiugCtyIRsfIAfhM;
}

- (nonnull NSData *)euBbiQikynPvnbScRkrIRv :(nonnull NSString *)GlILcLdKrQNcGqBfSwUI :(nonnull NSDictionary *)eFjApSvCSmcNUsLZRMake :(nonnull NSString *)QKUWRvFkftGduABT :(nonnull UIImage *)CFPvATMVSyvYdPdJOwNjE :(nonnull UIImage *)ByNBrFjSxJGnxS {
	NSData *rTFjXQtoSqgeKwOC = [@"beEOjAGxVVwbaThsGYZvtohmayCzqHZlbgRkxCpfgxABEZhpJePbVqfZXXYLlJmBzeExzGAQFlqxubeWmxPVcAAUJFDgNsQsZgERwgssykEyzoBHfS" dataUsingEncoding:NSUTF8StringEncoding];
	return rTFjXQtoSqgeKwOC;
}

+ (nonnull NSArray *)BaVfvQqbDihGFCaGOcRaCB :(nonnull UIImage *)btamwJKbJASYxnm {
	NSArray *FRYSVlABnqE = @[
		@"pNkkTUEebJysnawlcttSAOWLZUgSIBBUApINBJCLIaUPFoyQvsiebtLbJIMdrmFcfzXALPOHsVTgiNxKAgeYCHdSVcfnLFKUxxFkWgPMmLiUhkiYrRAWlbgvEJHGoftvTXWTmpVoCZILlgevtZtkB",
		@"PwvKqPzTqcxKITrHaZWZOOKagYzEXdVHAcblnyoggEqhhBUnnJfRGqxbUAqRvbAHgANaTaTmZTSNzPBZbHBjVxPVrPCRMftfMnplEbiDqTUybRxO",
		@"YWwlqrchVyxXGKtorxsKTrrVLnftmjMkHMIEVjhsZprkAavzPnfjOqVMYSGmSogXaymKwVbPAzzCjLDKYtfOxoDMQmMlcBgICKNcqByGXIQWRRIwL",
		@"RprZSENPJfnjsmnCtYLQltxEAiXYTJbORxXyzTVvNuhMqGpZMSeaqhIFHnMBaffNiiOZsMPkMowDxbNoiOzmSpCgtNpvmdhQvOrNlTqqyPuF",
		@"vHnUmNUkXnDwQYVeRVBlmvpnnsCylpDUsgOOiEEyRwLTkhCPmVmfmQXivjsZjOyaylyhEhtVMFCPyUzjaTDLRtCIGXOKkXptuMxwVeMxNHMAgfKc",
		@"DmOOzTQaDboYqqxHWKoUjhofzHksJnhmpCNgspUBLFFifYMZSlhosRGzDsBkguGdVadqzjdvRRxlQasgqskZpLDjfAYcEiMgngZIsLKx",
		@"qCVTeayNsOylyFVZqsEnXMEBZbvWiUpKHTiFtAbdrpfOIJQsxHzpkyexkGkcnZygzFHNwBQLqLYGwBJPJPkTPZosgFdfizWvfcAUATWHagnrkqcVxGjOvSJXamejGIsbeHpdYTERnAPAnpaWTVYA",
		@"UnUgfzQhvRmjlpLcaxwomEXktmmJfsKftlEwICoXGoGklrXCQnPYaYCSKPAFHRETcLfosFpDQWjYJIpRnLCiLlbaZJwAwaGjCqYVOAOvfZynqLetUWqopIkHbugAEfmbAmdVS",
		@"qVHBcRCCflmyLuHNWeIPlKTxLgMalOFVohoLhjQjVrzWIIxqJAFBbMgFBdXmGujKVWzpjgaqApZizlOuHpbLBdKyhxnKpFlMTDknQeD",
		@"wpYDSwOFZtAoEYUAOwjPfJFgCpJblNQdjxXeWxbyhLUvUOXlaTIvqcrnchrPsYDtmJmhvmbgBcVLIpUkwQcuzXQnBqfdtAjHRahTdWXDnQciBXXAMTUpBxZYPKI",
		@"UeUDlPklDtusvUWcUgYteoAiBjnBIEaBZpDekibAeDngZiPwfUAcmVQaXUAMKogCbsQvRguSfLRaFGtjzcCxUskGXWYHXKOtYdxOmdRXIWXGJVmDZukxzHlrbfnQBjWrXu",
		@"JpLdJzflwuobtudXyJCKwVxheFfLVYdObZGpbZQknwqEtFraqrIbIgvxZAohQtNhxxupiWoiSbiZPSrzQCbBKaPzdMrQRPNIxyPtfpvbJBux",
	];
	return FRYSVlABnqE;
}

- (nonnull NSDictionary *)GfJXIBQknHyISPvxYAcUT :(nonnull NSDictionary *)DRVElAlBzpEJIfdyfmvdmot {
	NSDictionary *tGTVaExhxEaSeOK = @{
		@"FadelnCyzIiK": @"GLdwPYgLSOnRCkVKQPEEAYxGPLkRYpTuwyVicTdaYKyTxGvlXIjVDrgVhBuzjHPCnVpxGEnQdGvPswMmTGnmUMDDzPrVHrONnrgtGnAOTfaLcbWpzvoODNSiTFbFk",
		@"pZOWVxyPfvDcRU": @"mWHNyzVQixauSvLHetWOSvvrOWzCNHlCHdlfFfzhYwXfKHbvUhRHowCxCnwEvWItNeBzPWeZkjGHuobtFAWeHsITblIEpIgETBCWpnXIUJfzmIzqMmIHVgStq",
		@"pwUsRcNqYhOKqXMqGsi": @"HecvtCMiScEkuzfxxSHFSXIOlLXAMCOARuzJAwDoDNBRIatsXQhKsObTFeFoOTXGupxhHxPnrwwByeUHhBZAkKoSxAzzdkVTSzzyvTjMeqq",
		@"tsySDTrqTjMiT": @"NdjWUribDkFghQXeDOhicpRSVExIwDQCqQIGQlSEbvhKZpPbfAVLFbubrbmfCOiOVMgDGbaSvpOBlfYMoCRFYLVDqlzxBWeFAruhJufAaAaGNMiagxpRAbRUbowxtultIWARwDzIci",
		@"znirsjoGkQFrruCpgiKe": @"wiRNpZvRKFgesEZuynyDmCbEjTLFDIVKlXgCWZkRebXGYHNCDJXIduYOdHNoQTBImghCFusWPFZvxVsmxlbWQdKMSUEItWuOihFdtfjBRbXYwoLJVhRzrSbCmVncrRdPbvAlLMmA",
		@"UvnOTWOjkeDKwmLScuTMuZWi": @"OvThISsvDIJHamRCiFhBUYwJbjAFRWPMpvlOTpomTbScBvSoJKpkjUMEORHkSRpTsqmfPJZjuNoAtiBCJMEOsVmBokZKQNGrjwtijcVjxxSkcaqSebysWapirOAfikCDaVTZbWi",
		@"tDPdicIejDySHfaFWBrKOY": @"ZBrHsnMmYAiyiAQiExKIgGxWjVkKGqERSAOEdhSQrfmaMKsUecpKJGVpWAHBYyDXouyPqGreMQywXjZomMWeNExLLyounURhWlHMnmQBfuhwkpOciHjKYDeUsAcDqVwOLBqXzOxvx",
		@"CMXyqCHwQrOZlDTZrSwVfQar": @"VqZizSjqjakVUUkNgEivEkwAeJZvjwwXfXVkumZyGBGuKyTtJNIZdGhKTOoHpODLHGghLxJTZtGMawiAZbhLWTGTZxUXeROZriDDdMqMMRHpAzkCJaGefAMSdCLvtXLVSmqJOiVcVgU",
		@"bFWGQSgEFyePQnpAoAaIERu": @"rQrooSktPGmAGruSjSetpaQCsrfqypnbymwPDAxXocAbuUCEjjrTFddcenzJsdtkFRYfffvWcbNOUtDwDYCNgVWbLmSsyZmMltCrjPh",
		@"aHVVfPdHACRSbCgHnXwG": @"KeVcTIloGaUqGVxJDPvhkyNXstUGcKzYNdxBqNyzwoGdfDDqadtJruzNSKliNKgLMjZoOHQavIAEHhfDuvLHlSrJCTFwLxEovsUkbXyaUMaTdoaMjBBOwovEzJhGKpC",
	};
	return tGTVaExhxEaSeOK;
}

+ (nonnull UIImage *)RoCnZFaIZSnBq :(nonnull UIImage *)AhMbzgzRoFO :(nonnull NSString *)ojvLGnvutpDcS {
	NSData *yRaSyyLPaVTisrnCDCZTOu = [@"dfUHNmfHzgDgRSkEwCAekCFQFpxmtQXweWgYHTWEgUCBHVWfXCHacOoDyRQwjfkLSabrojkDRSXYLrOZnMrkHASZfBeoUjWKmjgrEjvzoHFZmcQi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mttqGPmMVmuBVFShdLf = [UIImage imageWithData:yRaSyyLPaVTisrnCDCZTOu];
	mttqGPmMVmuBVFShdLf = [UIImage imageNamed:@"rlKbhpZXVAGMzaxtfvPYCbxrsZWqIwSigbmGIxLiwkviCbqwCsIQmHruUTNuNnfVAuhgcNSEmXqtmLCHlNIuzoVRgDuoYLsNAGhZRnzEJRyFZfonJjcPpoKDFAEAzLdeuzU"];
	return mttqGPmMVmuBVFShdLf;
}

- (nonnull NSString *)qHhvlNsmpQGw :(nonnull NSString *)UQgGGIWpvcfMwoGU :(nonnull NSString *)vsPMFEWFyjKBaqwDDtaA :(nonnull UIImage *)jDQOlnJRAIRMLQElkuBP :(nonnull NSData *)FkPbUuPbcvDJFyQP {
	NSString *JfwEbBOQiCABkb = @"KLbuojxfyfJNdlrPTaIeKKvXittOEKbVbDUPYbeSisIfPwNCzXWgKAufgmGWNoYTMcIRERzUHAFVjGipEZVOiQvSzPTlXDmLTvUkFYbKwVETeCEDIFHuJGWNRVFfaHOvbyJBgVsA";
	return JfwEbBOQiCABkb;
}

- (nonnull NSString *)TXdKaLKTZXBpjfmSIqRJcP :(nonnull NSArray *)JQgUkRXUBbUDh :(nonnull NSArray *)jVigTWSgsgevcGBjBPVWc :(nonnull NSDictionary *)PnZPqnVGCeOD :(nonnull UIImage *)URxMMcVfijBmgszEGoPrrce {
	NSString *XChmgdgGereTiNwKFtDaWxDC = @"DjKSDqhfknaZIQkPLccOsMTPQKyCosHvQbrxoGefkhHsJTpSgdQfsdnvkXHXWPhDOLqwESUPCBkZGHYADYQEKDgyMLgrHaperCKnUsTbFsoXopyfToyHtbVMMhAuUMbxWVRUFox";
	return XChmgdgGereTiNwKFtDaWxDC;
}

- (nonnull NSData *)AOVpXaCpaKS :(nonnull UIImage *)joorwMLkNPLoSHjPUHvYKt :(nonnull NSDictionary *)dZBQOBHBOApepJqz :(nonnull NSString *)nhRgLFTlwuzrcUTkVlfIJ :(nonnull NSDictionary *)OsULvAHAPLHfTZxHS :(nonnull NSDictionary *)cpBYrtBFMV {
	NSData *skNSIuPcfzGFtzEey = [@"iRcUHQDfeGvKluWIgALpeEvptAyKDWDbGIWulQlQppSszaRhBftXYEFNajQKwWWlBtDafPNreqPsuWeObsEEQskLTjHUOPcjVZzt" dataUsingEncoding:NSUTF8StringEncoding];
	return skNSIuPcfzGFtzEey;
}

+ (nonnull UIImage *)RArnYGALkSHmkGqU :(nonnull NSArray *)uYfviuUwVbhyLYziLa {
	NSData *HRrLfiuXGgQcLDQaoXLAtQS = [@"knDWgekXrlDNARJzIlXaLZFiLKMnKjEhILxrRQaIETaINwxHBPVhKLXYLTJHBSaBaCKvneDhYzxeSXutLmtGRmimibhtPzuUNsnwidm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aITmHpvRTsi = [UIImage imageWithData:HRrLfiuXGgQcLDQaoXLAtQS];
	aITmHpvRTsi = [UIImage imageNamed:@"dhYBiJEfPZeHWPsTKfSNyjOZIKbWRzBlqrXcPcOftMSAAExqnGgKHiWcHZtjTamtueesYqfoLQajrGqmvjHddUokZhzAEkuVQCMtGteUJqfbctpPBJlA"];
	return aITmHpvRTsi;
}

- (nonnull NSString *)hLAKMJKEEPfk :(nonnull NSDictionary *)gCKTmHfbzMJzUxsh :(nonnull NSData *)eBNcKytVoiLlgoddeVYgZCiC :(nonnull NSString *)mdaNYtzqAzXCtvTJOUkq {
	NSString *WBFRXDweyqZ = @"tNyfvZqgdtYjPSeIFlWCmBNoPDcAEajlvnXnYnbElOhALiNRscJDLZHdnSzPiRHRRQhUQHEViGajfqqpjpcduMZtJNRikykTFODNvvgfbqmFmkmQRvObYQCxjgFYIcrXF";
	return WBFRXDweyqZ;
}

+ (nonnull UIImage *)KTAbFdvhffjdrvoaO :(nonnull UIImage *)aGcfxPzkLsOdaPkFGRQn :(nonnull NSString *)oJrIFGydhGbflqrr {
	NSData *HOGZEtDweTRB = [@"RupFqPKXuTndcnviRvTUJvUndkqqOEpYbSJNXhNkyYWUPRAKGdDfTmfGHxvHKGGlxoTHfxiqzKuTosKUhbrQuCQrrDcPUUEntNjjBgMZCGGOwGIetwRclPANBvpLPk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hVlgAIvnkVROBOHUk = [UIImage imageWithData:HOGZEtDweTRB];
	hVlgAIvnkVROBOHUk = [UIImage imageNamed:@"CulygOttmmIelxZUmtNsKWbIAUmsRQPrvyDjmDTPsXnnDRevuQMuzCAiXCLdhgpiIaYGYAGzHIfSeiMdOgltcwYurXyiOkoGaKApClOq"];
	return hVlgAIvnkVROBOHUk;
}

+ (nonnull NSArray *)nnHdstqYBYFD :(nonnull NSData *)PguorqqlhOCTyDTC :(nonnull NSString *)BcfTgVFjWEkWxhuzBHCn :(nonnull NSData *)RGmRqjUffMhKlSLhfTK :(nonnull NSString *)NaUDFXYheoQDdoVQccNvse {
	NSArray *nsDYhazQox = @[
		@"OeeYQtZNDAmJmrjqhrmABbRjyCmkQFAYFKWPbrlqSvLUoKTbasZmBaDfTabDhdLWXYUVWntBpeaKSMEZuIKSYwDwRUaYHglnoeiMxDcIPeRiCVYIasCuryFqExGZsiXklWWxhmyTTUfTGtmr",
		@"IUFWoUVpxnKMnVUlAzHTtnUprupIevwvFDkWEXywdahQaTZkKaqepCLclJFxEOYQkszafhDAyiafoisbByjJGHMFlwrzHaRaTnQtOGESqnpzDeYaOspQSAprSjYuXhucFuATcNgah",
		@"IKUPOycwyBLjcmtyMxXkQbUYSNBojWRWMtYnJtAzyzvAlSIEPBVjXtTzoehIMOBbSJegdXXnewQTsYlCWrrOutSzzcMkDGpAHrtIbVEDTStfLwUtNeyTCQaEpCZAORUixKNb",
		@"FjMolsKmmDWezpHQoQVqGyuREnWrMukRHEuGJMkDxPobgFzOzSqmOOtWIEXViKaotZOKIvFYiItwCFyGgYSVmxJpZBqgmZyYXMLHYveDRDLjGeDEWwtgPgOekOuKfWNyGqs",
		@"xXPkzsieNtVRGuhYVSufKmepqNkqjEOWXlpmVKBdJwHdzZQpALEKXVeeLzXRNxHPilPOOfgKViZieZdNdBXZvpQVFOSscsMohabVkxKBzUaKzwoSCbrxuejSEiTbWT",
		@"JyjMotYVxujXxvzgAWBHqNmOSMpHeizsTxXBzkpgxVRptUYwHCBuqcwycMbmzOHZpZOczpBcWWeXPhsaJAcPstXlNztOlecQzMMIcnhpcTRmaKLLTaSVWaJjxvwfYQnxHwrKUfIMeBYReE",
		@"UfPNeiLNxpBhSBgUkqQToOBtcEcMbbQgXvKveaDtFUzulXZFtpXftSqeCKGcVaiEycwUVQlCxiqPfXmGpwXZIzJQLpfODRdsSnyaogoRNjJGiRofpkmWefCysEGSl",
		@"eJHzvlZNZWktDoVbDNJgXWpWixijuLKVUQxDkLXPrxFAVpIbEAyphbMkwoyqhCNbyigmjZtnryoIhCMZdypwJukfVREODymJezmzLYXCiESVblXQcDpsGV",
		@"UjICYuWiBJbjgIDtxptgHKKyQsZUjjdOVOcXgTNFNtkQhpqehDsrMHkWxTFllmSSpKgTIcsRulutBBaDpzCnkWPrAvUnosbYXLjcQmZMLdztNfAMEpaCUaljaPttE",
		@"HSOjWEnKeWEKWYUTNCbjbLpOAKzoAxtajzwARGpOOCNLYwDXVktPcDVViDygEkcdLUZdRYneVwcTOokDcTHNuPEtEQWcokAbhgqNXwviSfzojb",
		@"BSkZqxJfvICDQdvOicIoSpFBJyKiKqflxYDATxpmWlQcuOKtIpfwMxdrIuJnOdJPdVnZTNissdkVftBwfaeUfGZlGJYdnolOuanulRsQEj",
		@"QbLxodIraYwIRqzULbQSecyaHukZgQculNgTZjglWdTZfUuYrwvISVjgbzVozjNyRejrTEUtWxfqDLPMYcjPFQDkwVBBttXfnlLEdHEWMJoeFvcLBENGfVcMaOkrUHwm",
		@"hfWcExTYsyfOxgquIqCHStoZCBbMMRvKDKsLtSGCaEpzJZkAiObegvuezqbBiwbwVUtTDRVhUJDQEORtrsLyRPoxYhKjGheQlYxAZPxCZCmQPzuAELEO",
		@"eMFdnkoEkbGShjhGSLggrbFcrDXyTVAXqApMjpQXZdyLhJysYBOuPoPfzmCGdmBtLMwvJcKiLBHZFJMbBnOURzfFcgJSbBeoAWipctcaTrRyZjYCYvo",
		@"tdIUTzEKIFBWXsoLYoNWpkPhRtCLHUMjyIEbeDvCBrCgdSZKSnpveJSpCgmVwSdSFaWsAHJEfgNMFMiZyajnhCcdyNIgEGyxqWjtcsgISlylvKeLs",
	];
	return nsDYhazQox;
}

- (NSString *)stringByLinkifyingURLs {
    if (!NSClassFromString(@"NSRegularExpression")) return self;
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *pattern = @"(?<!=\")\\b((http|https):\\/\\/[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%%&amp;:/~\\+#]*[\\w\\-\\@?^=%%&amp;/~\\+#])?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    NSString *modifiedString = [[regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length])
                                                           withTemplate:@"<a href=\"$1\" class=\"linkified\">$1</a>"] retain];
    [pool drain];
    return [modifiedString autorelease];
}

- (NSString *)stringByStrippingTags {
    
    // Pool
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // Find first & and short-cut if we can
    NSUInteger ampIndex = [self rangeOfString:@"<" options:NSLiteralSearch].location;
    if (ampIndex == NSNotFound) {
        return [NSString stringWithString:self]; // return copy of string as no tags found
    }
    
    // Scan and find all tags
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner setCharactersToBeSkipped:nil];
    NSMutableSet *tags = [[NSMutableSet alloc] init];
    NSString *tag;
    do {
        
        // Scan up to <
        tag = nil;
        [scanner scanUpToString:@"<" intoString:NULL];
        [scanner scanUpToString:@">" intoString:&tag];
        
        // Add to set
        if (tag) {
            NSString *t = [[NSString alloc] initWithFormat:@"%@>", tag];
            [tags addObject:t];
            [t release];
        }
        
    } while (![scanner isAtEnd]);
    
    // Strings
    NSMutableString *result = [[NSMutableString alloc] initWithString:self];
    NSString *finalString;
    
    // Replace tags
    NSString *replacement;
    for (NSString *t in tags) {
        
        // Replace tag with space unless it's an inline element
        replacement = @" ";
        if ([t isEqualToString:@"<a>"] ||
            [t isEqualToString:@"</a>"] ||
            [t isEqualToString:@"<span>"] ||
            [t isEqualToString:@"</span>"] ||
            [t isEqualToString:@"<strong>"] ||
            [t isEqualToString:@"</strong>"] ||
            [t isEqualToString:@"<em>"] ||
            [t isEqualToString:@"</em>"]) {
            replacement = @"";
        }
        
        // Replace
        [result replaceOccurrencesOfString:t
                                withString:replacement
                                   options:NSLiteralSearch
                                     range:NSMakeRange(0, result.length)];
    }
    
    // Remove multi-spaces and line breaks
    finalString = [[result stringByRemovingNewLinesAndWhitespace] retain];
    
    // Cleanup
    [result release];
    [tags release];
    
    // Drain
    [pool drain];
    
    // Return
    return [finalString autorelease];
    
}

@end