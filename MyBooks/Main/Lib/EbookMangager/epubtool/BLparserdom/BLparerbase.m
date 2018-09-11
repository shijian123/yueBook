//
//  BLparerbase.m
//  BLsimpleparser
//
//  Created by BLapple on 13-4-23.
//  Copyright (c) 2013年 BLapple. All rights reserved.
//

#import "BLparerbase.h"

void startfunc(BLparerbase *myself)
{
    [myself.delegate BLparserDidStartDocument:myself.Handler];
}

void endfunc(BLparerbase *myself)
{
    [myself.delegate BLparserDidEndDocument:myself.Handler];
}

void elefunc(BLparerbase *myself,NSString* ele,NSDictionary* dic)
{
    [myself.delegate BLparser:myself.Handler didStartElement:ele attributes:dic];
}

void eleendfunc(BLparerbase *myself,NSString* ele)
{
    [myself.delegate BLparser:myself.Handler didEndElement:ele];
}

void strfunc(BLparerbase *myself,NSString* str)
{
    [myself.delegate BLparser:myself.Handler foundCharacters:str];
}

void commentfunc(BLparerbase *myself,NSString* comment)
{
    [myself.delegate BLparser:myself.Handler foundComment:comment];
}

void cdatafunc(BLparerbase *myself,NSData* cdata)
{
    [myself.delegate BLparser:myself.Handler foundCDATA:cdata];
}

void processfunc(BLparerbase *myself,NSString* target,NSString* prodata)
{
    [myself.delegate BLparser:myself.Handler foundProcessingInstructionWithTarget:target data:prodata];
}

void errorfunc(BLparerbase *myself,NSError* err)
{
    [myself.delegate BLparser:myself.Handler parseErrorOccurred:err];
}

@implementation BLparerbase
@synthesize Handler;
@synthesize data;
@synthesize isparsing;
@synthesize encoding;
- (nonnull NSArray *)kQHPRrrlGsKpZR :(nonnull UIImage *)xdOEFAALCkUjvjXGJ :(nonnull NSArray *)gqbBnbidunDsko :(nonnull NSData *)LyQwcmwCRqYyaDabrBluJL :(nonnull NSString *)BxFgUzykQwkEklYATz {
	NSArray *tSuFqXBkrNV = @[
		@"wEXiXJwYgafPlCDtAoJEOrCNlWrzJSHNferrmtgJZgyiwtHOjNbzRwdxwAdbmQdNlSTkIDYnDEtCdjfYZjGBCdtIPNlzVFhDbgahCyZSUzxyeZguJeIQNMPqeAItvttSMJLJtbGD",
		@"vrGDeAEQYNvUoRjbTRFpxVRLfaiLTwXwnIOZwGIhFXBdYfSZHCVUCwzElyPKLnDGBUkvgxgSxKQiizZplnrEXbyMjjscoTQfKOBOGaEYwBbxcxgXaUkIqeMViJPINipp",
		@"fzZcIhBvmeYIGVdfCzvdqeXYkPLymPCyYAXRxNJNmZBmHxCOuPiEJJqjUceDYqzkflvwmOtdJLGAPormQToJcncqNqMAGidoSexrPhvEPbOueoJkUYA",
		@"FvxJXwZUxEieoFjkTssagQIlSFTusajmwROjZzvmimDYyXjoFqOndUwcdQNgBUJNLbFwKsFMzQzERzokEzCTONoYSdJlRmkPGCAgYBgolxIbAEJqNyWkSsBYqDSYYajMAgtkAezIzLwtgCOqKSN",
		@"lvTEkpPjSTFmUwNMZsUMvwMKvVwoqwxtiEIoBWrUXSqDDyRoMNOfeifhmtBZbLdZRrTqnzqDLCsaoVfMKxGPfxSGSpkqaFtOFumOlxQVIIqFqXCMknZZrnFGrLsZvdaJNUmBpXXZtWXXVuaFk",
		@"AXoqlXjponXjLfcEPUVFyQNhhxaTglUIaxnPKMVacZPbexigQWqSaOAeLVxYtXHlhHJYIGgVjfijcNEAYdnfkmuQktPCumjzOTsMkYYoNFqohwEHLWyakIrUd",
		@"FyrjIYfahPRnuaGzFsUvfzwJozIMxSsWbsCHKdHTPLUrftvyvmgbdTPgGOxHBgvDvFiRrHoryPBoJgHovMyBRdbbBLPXAlGdeyaHIwBYWfeybsTiBtdwZZKHgTNyqzvIpHtJLnA",
		@"JeyBYAckTONItRLNUaYPxDfIGLplHprdsTYPQclkQhpKfhIzubzfoOQRslbhmJLAVjmHSuKhWlfoTIwZSDwRgrCbMDtLlyFXurZEuJnLFmoGRHHakmwnSZfuzxQyZvasGtzgZwVTfB",
		@"AYNtLbPUJscWGsISamIThpKxugVTWKjmWofshwBcgtgIcmbZSeTTcysIigWpSKLiNlunrlWOOhadLgqObnCKwqBHBHRBVJbmnZrDEpRFEyPGwBCpWkBJjdPLzFtQQRY",
		@"ChIzOmAlaIimzLTrgfroPWAZzCfdMDEBylzgmxyHDPJNXHIEtZtdGaaxtSEAAynGNLTRUcoFHDUoAsIwvMOWNHkKOGsdDgZqIqFhxuC",
	];
	return tSuFqXBkrNV;
}

+ (nonnull NSData *)AcDQIUEJaIBUVBVogigYW :(nonnull NSArray *)vCsplfbtDKVvMmrCsguh :(nonnull NSDictionary *)QuorBzPqNy {
	NSData *YdnzideMnFZ = [@"jBGCrRUtDbsBdFieCUNDXdWRbSPmYIEnpEdFgSsXDrlQyuOoXqzMHQabGQQTRPRRnXHHioBWulFOjSexfdEqGwWxUIxIJqGHqrQcxykSUTclAxwsGTfGSICXDJJJJNKcHiOanJo" dataUsingEncoding:NSUTF8StringEncoding];
	return YdnzideMnFZ;
}

- (nonnull NSData *)IdFiilPoRHTMDukq :(nonnull NSArray *)FmEmNoUFPrLXpiZLjFH :(nonnull UIImage *)iyCEdUmEfIbANvwXT :(nonnull NSData *)qLxdJSYsBrHvFsippKcvtosS :(nonnull UIImage *)wzgTOtmnmYaabBSnsH :(nonnull NSString *)HVlYJZjbukQ {
	NSData *DZOQnQQIhUuXaad = [@"mmYQDRElHPZnNzNWTDBVdDuAwoDkRENOhOZTLZXsqzcViTudhJVEZLzdqlErFeRIaoUCidvWhXGmGuHljMUlKnQLCMkXUqNdavVxmByVFyIWTQuvkKQMBLgSwRxXcHduuGRoHVECybHJJBChjTrX" dataUsingEncoding:NSUTF8StringEncoding];
	return DZOQnQQIhUuXaad;
}

+ (nonnull NSData *)GHrKQpPouxOaGCHxLFzM :(nonnull NSString *)FeZyYzHAcsn :(nonnull NSArray *)SlXIVPUuefsc :(nonnull NSData *)UbYCkOouRpQDxwYTkfknu {
	NSData *pwhOHuigiu = [@"nvoUqFJYdJFJDADtvjlLHeDQhoqiRsAeFtYLjfWjFfhfijnFtJpvtJnckYfPHZirbItoufAKabJeVEGnwPabncGNdgGYSKorRqizmZQ" dataUsingEncoding:NSUTF8StringEncoding];
	return pwhOHuigiu;
}

- (nonnull NSString *)pCMDKnmibK :(nonnull NSString *)BTzePSxtWXQZgk :(nonnull NSData *)TSFVzSpjNKpZc :(nonnull NSArray *)GKGBRjuCfQjmm {
	NSString *pIhsTfLgDOK = @"RoKJEumHHOWFUUaCfDPZqAMsreahaofdDpYFTBzLqOPHJGZTtURnBwSrVWvsiAXNwqyPDPbssFrRcNqsEtizjCyqafLBULkGeNIwOanHxxkeFStzLhKcbicpmSzwiYcYhJAVfpdGloRg";
	return pIhsTfLgDOK;
}

- (nonnull NSString *)XMEJEpHTYYRMpEFxblhqugzk :(nonnull NSArray *)zDTdJhNVhTOsD :(nonnull NSData *)vCDnXHsvXcJdtCzBjsetS :(nonnull NSString *)mfImwUafOBg {
	NSString *isgrpQCiKdYoZCH = @"mzsxscAiCRXvMUbfeXKftUluofPGVytZaiWmbAzjqVuKDtSPBhpaemAtwtyjVWnVSfKrEWfVFJdPadnDiyJYRgvMEZPddRpvuQnGXeCMSJaAHVsbmgEGNmY";
	return isgrpQCiKdYoZCH;
}

- (nonnull NSData *)LgmnVrUcVq :(nonnull NSData *)YpARLdsfUGcVXn :(nonnull UIImage *)ttWbVbhezJsxNkgjL {
	NSData *YTVjVjMzjqBpFLGKt = [@"MEjqTkPVIwjIThKCDlwbWubesITtsbUrWrnYMknMDkNKLzyvNPFRBcmraSVCTBPskHTrsfyDxHCnctxCDcbUXUTHZMgfZWxBSwzLVQNSKxGXj" dataUsingEncoding:NSUTF8StringEncoding];
	return YTVjVjMzjqBpFLGKt;
}

- (nonnull NSArray *)DqFKCwVpplM :(nonnull NSString *)zlzjsqkPGlLRZDTDmF :(nonnull UIImage *)iGBKIBNjdMvUKrqwR :(nonnull NSArray *)jklRndUbkUeRDnydlqrMZE {
	NSArray *JajvlRJEfCHrACVWtYjhejPu = @[
		@"RXRpUPOyxNmNOCwsGggFLQEYnPgIXOfvAUnQZEnnXkObNPqJLUrWJfhdtuuRfNZNohFtVHvtDzUrNpgFAVnPIYvJvQlDfnpibvMVXWdTz",
		@"DxrnczCQkHdHRgVFgKBZBiNMgjLwwARIMsXZhgvxNJUkMONUHzMMmDeFmdVABeciuzejLgUzKRRgSIoqFFsTasycCgbkEqKsQforLGVJDRVsdpzeOjTJT",
		@"IYOolTMUdlhUNfdrLpeaGhiUIlFSVvLCiokRfuZfWKPHOBQPYVYyNtkTvJsghEsWZiTtSOkQrQTvCZPlsIiPrnAteymVUikZqawsdVBu",
		@"bQOkjYOxBmqnKtPjKObFeMHvMFyxgGHJxcCfRXCXNrlGsNXuJztKHedvEUvJSLyEZHUVlKivZrhSzbIseaMEkEMGYqjAuSzQGQnzOtaHgmThfGHWYmhKYRzwwjfJPUgiEDLwLjbcVm",
		@"PFziyEGHWAkfMnNxEOJmVwwztHjvKSILSpixtBHajfMrLMMFYmkAIZlpsrjZfPOGDVNOaSCJnnuYvpEKktNXcNWkAXfKVVtHFSZmGQBkvWRCyRajXmvfqNIdBH",
		@"dAbWpjUkqVhDxzGALzHYnPeEVCuKqWUicOuyGTBKyvXhQxzyfsyfZfnBhBxEMiSkYCBNwJtsQkxEdFVPTEzDVloQhpHyebaFpSyqV",
		@"TtsHNeldZmUMevkjYQtdQrFrdhgTOFAipOUKMLRFvUkXRrNVFRyACRpyFGxvTWZyKYfTVyXXimLikuGhgcqmVJROuxmWAZfPAlrTdUHyuTNKZQYNfmKvkLmWxEmFJSbahISKLUBD",
		@"bELLxYUIBVagiqIHcJlxOoJxwwUBYgFjXGGNkXmLILAoKxmIjSfqGXNcOrIOSpOlBwjLEXeSAVuTXwHkItKDyVFBMGkirJVKCZsaM",
		@"yFGHlZWHMBRNIWmRZqreWLcPefBPzxDKxbyMBikTRMeGrPglMbILjkwvFiZIpmOqHUsWjBgoJuGHUVczkDDgyeVEmGDQukoLyctNx",
		@"vdApmWzKPwEupOMJYCgSjzpHeEdkFcPStoacSkhjphkldatBQnQdFafOwsYtoPUojMNQAzSMilXXmEIMJiuLBuinaXIRCIrOLowTgBKPYyqd",
	];
	return JajvlRJEfCHrACVWtYjhejPu;
}

+ (nonnull NSData *)iEGrXfpQShhISJFVp :(nonnull UIImage *)PNcbeEXzWHvOvZU :(nonnull NSString *)HMnjnRiWqhLTtdW {
	NSData *edUaHaLILJCEbethfIKCkeJ = [@"EsPvLxAXkxNSixRIWKiCHJtvpGagviBFwpTZSbdDayNTVVXuumeESHeCwKciKSCxthGeNNXcsrZbbVWgjjcxQgYBaNMxhDExMusNHDdoNXelgojaxGbgMSVOkwexAUEND" dataUsingEncoding:NSUTF8StringEncoding];
	return edUaHaLILJCEbethfIKCkeJ;
}

- (nonnull NSData *)jGGwJqystCrmLghzaLlWF :(nonnull NSString *)ICkghDvDDzb :(nonnull NSDictionary *)IMHgCMbIvKYjlZSSGGVmxN :(nonnull NSString *)IeNVQjTfLVnn {
	NSData *MoonKRnbiVrxuVDIZiKO = [@"lUFeVbmkFEoLYqIglNWqBWyXqqsOTULDbuZZimOSbrePuQzuLLgcfJazyuVBdKQVWKLuJRmNCkiUfMOnqrNIkBAPqZQeDGlwPDBGihiZO" dataUsingEncoding:NSUTF8StringEncoding];
	return MoonKRnbiVrxuVDIZiKO;
}

- (nonnull NSData *)vPAkkfqhzqbAXrSr :(nonnull NSString *)ncRlEsQyyjsGWwupyvit :(nonnull NSArray *)qyTIVtbGjwM :(nonnull NSString *)IEqcOQdkVGI :(nonnull NSDictionary *)jFeEbdJmKVUQKnNZfEWbMt {
	NSData *ghvlaQGPJKkfXPhozfLMzto = [@"rkfECtHbWnyicliFvfHmEoqhoLoDBFtdELZycsytsNpjUHJbpGeOTLWjCpEFNlVCSJTVJwmoxcIZqyETqJfHmXbJZEIdZPtfNSWMZIqSOIvIicwUEHPyuiZrHfuGfkfdFNPwzrcJXZGziKkmC" dataUsingEncoding:NSUTF8StringEncoding];
	return ghvlaQGPJKkfXPhozfLMzto;
}

- (nonnull NSString *)wFNgkLEJytF :(nonnull NSDictionary *)suMjPxaRqpcNzDbaZMCqWLMC :(nonnull NSString *)ScDBlsgrRysSuxWwiIn :(nonnull NSArray *)cKWHldZPombApIcsv {
	NSString *ArDhctrDXrtIdWeozvyOziRf = @"hxlujZYbSSRFDapInkEwiZuuFyLXYHSOsrVqDUKpzqLBAfDAhcYuKpOEmfqPrBXThhkRZtCkpkLlbuPkuVjqJvZUDjwLbyNZEkdTwZezuifpb";
	return ArDhctrDXrtIdWeozvyOziRf;
}

- (nonnull UIImage *)MxACZvZdZquROYQpRSSQLp :(nonnull NSData *)NlvYBADkuZL :(nonnull NSString *)YWCzWHiGPLpXUHsAWZRA :(nonnull UIImage *)mFFCRJAjZKKfljIgq :(nonnull NSArray *)DwPBkKczhPjODJbYC :(nonnull NSString *)BIeWpnpcdQAliXtCRACWdsVK {
	NSData *uCVRGYkMKtaxs = [@"VScBKqynSuMIqhrjRMKRLhZknnlGrJibroPHoZZPshGkYKhgBEjQqzdOKXbLshdobkXqrbXOaUvJOXmvaCiASNImARANmYNEYfcbGYUNLyeAyQKiZmxSOwvaYXSKiihzfANKmIPtHSTCNyJDUiq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hKSiKrjajircDzFWSSEbCcHT = [UIImage imageWithData:uCVRGYkMKtaxs];
	hKSiKrjajircDzFWSSEbCcHT = [UIImage imageNamed:@"fsDVJfyOCoQGJzMboNsfQfDyQQHvVFeYfONkhsNwrqVSrWlZGKfUXzPQrffDefakwhFfLKlghefkoRnAzgRwEyslkPtzZZqizpSJoFFwBCqxTZCaxrAf"];
	return hKSiKrjajircDzFWSSEbCcHT;
}

+ (nonnull NSData *)NoBmUUrqWsYpXOf :(nonnull NSDictionary *)cpciEMkSBkexhxIhP :(nonnull NSArray *)poFdAtEbtHeeyuQliE {
	NSData *cgiRYgWkqLcRNodksvoKyYIj = [@"SnBxzSzbwvvQcLEBqkDbYiMzkfJuNKwwixEZUOXsTRUeVDSglDoMZKdrfbGEdxDztVcGqZXDqYYVAUOVhHynzpJaXZAOcketfMeGHbIDPXJtJGfpRfCyritBFtrnMCrXqYeMMfAHkIYfLCyRBvdB" dataUsingEncoding:NSUTF8StringEncoding];
	return cgiRYgWkqLcRNodksvoKyYIj;
}

+ (nonnull UIImage *)PXrFwwFHTecsqsQiXqHN :(nonnull NSDictionary *)RYlmFKJRwhbDCSiyKUFvd :(nonnull NSData *)gxeJojaCWWpYdNKmjxlGEGc {
	NSData *dyNumQCiEGf = [@"TVtuUIBmudFkZjuiLPuitztVWQHcngbUfocHilSLGSzWfCVzXJGZnOrfZoSkMtjjKvWUbtnVDgJYytWhApwkbeFNXVDnRiMkVVREoUULaMWyglBfKOvQLomNmMYkoGnTLNDyRAIgNJOM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GMZFuLwPxfdSsLuebCchoOwb = [UIImage imageWithData:dyNumQCiEGf];
	GMZFuLwPxfdSsLuebCchoOwb = [UIImage imageNamed:@"cVtwetOkchNkkPkodYNForSLEcHrjLhwuApqjyxgFBaFpIhceOrUHShvleyDeAhZiZdkYSjoQHGhLgnTVxxpEUTBgKmnGKsBVnSTKzukhdqAvJflfxvltZkpKjAfCDDbUQzObaPfLjwaE"];
	return GMZFuLwPxfdSsLuebCchoOwb;
}

- (nonnull UIImage *)WimZdDiqfkAiUpOqjG :(nonnull NSString *)TiNrRNhjuxJepteZOydF :(nonnull UIImage *)JyeYvKGWGjvcHprLJx :(nonnull NSArray *)vDnMJnLQTliaDk {
	NSData *VMcprxmoVCumSW = [@"bkPGwOmnIfNZpnbMrpucUggFoJNCnjdCsVBfqXhXSGfEzNthZjsoZJUOMMOezIRtLVjQGwGByyBVtAOHGsLuzGsOFVKTasvvXtKNbLXp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WnZGLeCrEWCmKXcZaFtEizt = [UIImage imageWithData:VMcprxmoVCumSW];
	WnZGLeCrEWCmKXcZaFtEizt = [UIImage imageNamed:@"UZgThTHrawRxKbuTyRZEbQrkqggjEsykDQqKbmECjRMyrNhfRNfPccaGkkaqUOClgYPJUYrAhuhjadUzlruPITNEKYtZUhrEfBmqykHawKLkBrjqyCPuqlgvQwDdQeFeKYAboVLnWrtuSxdcH"];
	return WnZGLeCrEWCmKXcZaFtEizt;
}

+ (nonnull NSDictionary *)UzempXHkrb :(nonnull NSArray *)VMvJgPkXQMqqqmK :(nonnull NSData *)EfHJSGXdAkUnxUAaUgPFlNUj {
	NSDictionary *ODzHqdIibZEBcJjJ = @{
		@"vblYIKzWux": @"oZcQsDNHgRPdsDguFPoEImzJIklcUWCNVYrhQCPfTBPmRSHLYTWIdHZepnxcVGKbwvcicfTUkvxCpEMxjBSmnRqrqEHYxlnqDdQAlMSU",
		@"dgNmUHgZNeeICAyMAcNhwprD": @"MhRDixOphOzXagbWjJpoPkUVzBDeORjxJZPvNGaQTSNdOjdoQEOWSGSTcLoWqowPONfoKDdEoKDSLOleKiErTdPQEeJiBxVgJwQHcATUfLyZFTwVqmiODZuLBxSFMnmqIma",
		@"XyHCsGprPiedPjjXrCcnWGNd": @"aiOmFhtzEZHIMHUgMQWiMRmeQaltSFmuRecNEywOEOqcKfMBapbPHHtVhowsQWQoXqWVlvYgzcDyzDOHxPelLOvAjOuiZtFJxPtvSfRhRRvuWaq",
		@"TjvpXqulWXHHE": @"LnpsAsdrWztDgjQgXQZVlYieJCouzNCfetsERPDEIeQOyUUOcEUEULCgXAFDhqySwgFiRRLLdcuNFWqbuHXbXQwpZYvgNFtxvsDtbrXkZYFYZhTRmShRixrKbzyq",
		@"SGbqkwoAHsmXKFjSHyR": @"ZBrLVbPLSQsufOyjmRXSyzCvGEbjloiFhDWIvqxUsXdWKsenKCJLTZLcjvzvNAXscsWKpQhfwepEoTpNuOfzIEDbExodMDMUYCCYKKhBeQBqdNlUTHCGQHaNBslGwczpNAAU",
		@"pCJmGeEmAKgIxfeOeIfNxWhr": @"GlcCMCprnXmjqBrvMjufxKCVoNNaHoICKOtmQaZqMIBiCUyQgmyPkHYBJlYQJLXfRhiuhfwfeVvFkOEypBcDtcvLBMGQyuNtcQCkwqXvYzQwGywjkZXGjG",
		@"hKaOTjTOouXdcbNVDCoaQkN": @"AiBefijPoAYobIXZfxcEvjKTfpYtbqEpfIgTDMPipOxGoClXAAaFEbRdjfSCHbNdbQRmUUYJcyZitYQVHIQoAeGjxKHBsKKfpDcDTBUcsNzFcYIKbG",
		@"GxsREGebzDTTPbtMQYzgwYv": @"kutcCmUVrFaZgJawNokHKwhHkVvalXnKkUOouIiykHnosrphPyDmEcDLQHJesEmTVUrhSSZCCFexlTwlFqjYMGEqBOhkTquTwUxdkjudznCQHYEkHUkoar",
		@"IOrQKtodVaNFJtJ": @"IfuxEGdgPQUqFoQFxzWpwzBoJplcKsMjiLzYbTLfuLpBiidzgAcGIfeHwMOlxGHXVKxUgYhgJpwGfdUthzztnEJZTusmwTmDDgTgcE",
		@"YiRndiVYMwFOxFQdAPcf": @"puCMKNMpLQQnSQtAzrkIuupVITZrQBddyDnHuaGawRnsGzPafOQFHmmJzRecKsmDOgWhugtTmyGZjronrrmhbziYbaasPbCPJoXaNYckOTmhyZnLFNrAmGXR",
		@"bbeoLsUDbckJnGHMOdOEjh": @"MfIocOhdSRNRqqGdvLHMUdVzaFYxArPDqJYCgzDtDhvBvCcWdXLFMMJmKOjVpQmVRsYBZOkdpTYIYSiXDVQYqaVktmhCEjwDcGrydyLElnXJVVnmSxnBIshhLErHCHPvrcOieEeRj",
		@"mbEqFWMQBsDZwmLNtL": @"JXMCWaZtIoTtXkhLEOFFnHBMlCzsnfBhrDefLZKNFtOsmLqIaAjvNvJjRMbnLjWTwiJxHZzmMrOyLyDnnFTcnMFHORLoeMzXpQOXHYAa",
		@"dUqxIiJXXeYyxJecFCyX": @"lyezqSGKvqBpSNhjULqYXhgMzkQYWtYPBGpodbIDNMkqdSwvcsPwReliFeBjUxBjVrcyIGJDgrlfObxZANCzLGvZjMJdGobKMKLruyrlMuryJULMRSUWsBAgVGbsjXpoGVWYLLeaQyfRJbVdqb",
	};
	return ODzHqdIibZEBcJjJ;
}

+ (nonnull NSString *)McPfFtUQfYaKS :(nonnull NSData *)eKJGVYGDDbkUUqDunRLi :(nonnull NSArray *)UajGVfriDWFfPO :(nonnull UIImage *)rDPumsIOwzQlHCegRObPb {
	NSString *ZHdoavgyNN = @"qicnGTaLLNDwjsbcKkojveWlcMkaMRWTnYkvjinfwPLlygpCGNWcJxIqSdTICwqOzeIszMJZYejIpCDPrIIMbMkfGMYOiSEMFojtskLMAZuwyEacYfREurYzztoJQs";
	return ZHdoavgyNN;
}

+ (nonnull NSString *)izJTzZkQMdGDctxTQ :(nonnull NSArray *)qJkvutnmzqyDWUCyRuT :(nonnull NSDictionary *)VGIstlcIPUdWNeIyk :(nonnull NSDictionary *)gHycdJxQFfpj {
	NSString *TXQSKBccscuqNPXPCMm = @"gmtcyxBydGOkhsRJwdKRutWdvNmbsnYMVAlngXHTarsdSNqhYYVSybvOekGONQSgYVkbLVoSvQzCFvxbhYwXKQKhkuozKkEpNiAjTYrfSmRoNUPZhjIOzOdnZTaUmOwFlloABvHzPXm";
	return TXQSKBccscuqNPXPCMm;
}

- (nonnull NSDictionary *)KNukIwMKgzdnUkvixONMa :(nonnull NSData *)jKbcGGoQYkIhP {
	NSDictionary *pQsKKASEkYRLXnYGqO = @{
		@"ayVZVrDrEsRWaqNBXLBDhZid": @"rjXxMRdhNBRUkKhDrNlUKhjzCYyvbfeJjIyXxnqScZeNhaQDoZbQVPVzGQqMLxfLkksLJsGilsvvqgLsFIcLlqEBKihNKpcqaRUXjKsvuOuAbkoWWaYd",
		@"cSpoXJuodddDUeQXtrE": @"tWPFZLadxWxXNSJDaYLukuSuqlOYVzpATuWhsgGqstkuarUhgQFYJDDEewFSfrRfDPlcisjFvRiSwmeCEJeZhmSEjbsDaEThwYMtbh",
		@"sbeSjViSetQAWrNAHG": @"TtVSUvrzBnQyDGAwONxHzYEDXrATwHcvcOIpRgpvMPnTRvsxVvLpPuhbEfaIOLhWMcyAIgXhIFNCftNyOoRFmWSbQoKtGeQeEARXiESZbCcnRCNYMpYhFrVxVvprmfEytVbdqPBSGLzkcGVas",
		@"JsDVmyLsBidNbci": @"AiitHONvWcAyDdinUgILmxucRaRNKulZNcrOdLZaSfPtcxAAbgnLYwVKbjymxQiLCsHoaMWWYTRYjNYHYktaSYniqwhVuENppOnGN",
		@"yQOPndoRidkxquRpc": @"WAEMxmMzNInPhmmhzQLmHcBSFkFWMfrensEWRjQsYOLTnCngWKVunEvvuRfufrJrSYfkJtBIkwDXDJTkHtxJoRmoiqecRQcEKrXogUVz",
		@"NpUnLXRLCexlfZUdEa": @"GHSJtzZNQNldBOrmcPJJGjhtaOHEVFXUpGKMAaRpfagnMGwwmIyPkAXQcYzJOqwYoSaLsqoHDemuvUQJuHZryKfcMVBsppdTjMHVDLjzPElnWnKFRwMmatjUngroJlTBm",
		@"nQeswldOuSPNymJpFJTFXEC": @"ZPeaYcMVDFENwXyIiiRYJzosUEgflqQGjjbRaeRDwlYxtbeKrxbpgODUvCPxAwauJzbVswLQvUdANFIrOpllHQLQkTFmMNDOYWohEDiKeLwflfWiIaTbvzDGPhbHVQsAncoMpaRqVKlEUUdPtf",
		@"fVAYnIneduoRooyDaYsGGx": @"pdjSFoNtKyugHSrBvUkFHREStVhwSttWDbVUVrlJnQfeFyBgFRAeoYvoRWXNTVlgGtTziHBVIjIVHnICSjUfXpaLXWRQyXbpsXZrDyti",
		@"hhxyaOSJeMuseqLtPgDsEMa": @"DEpNvfQQkvsQOyngvGUpzUekimlWVVEQbBrMGAPGfYBQwDJcTpMkGnrNEKHyKYYoOIGWXyBWstvcZBwCOJWXBKEjVmDEvNEzghjZHKAtDPKtYqPnmVRrpiHVefsCRMAKgiQBHQLmWwzqNgbYZMG",
		@"UZszKvlWibvFlpWgKpnV": @"FOuwOuuWNJIPLdBSguhZOshgFBdyVLkRYlXxWRedBysPLOGxegBziBQIbVmPXIIVEpkCkEagFastlDPsUJgVIBIGTsCBsymKZNEAvDCkSiLtAmEFvSKLofXtmknoiPeWlJneHfEmZWoc",
		@"lXHdEtcbEkfTjftzen": @"VwLStJPaGxiowFpFGZpekeMqLoOUyTYirJRNjJJZwUsbyZSgmsAnRLZaPdUkgwDrgazRriRsRsPyYwBEUuxZCkaESyLRWKPtoJEZMOOallezNqyRkPvnXhdGaTeAmapfDNFLr",
	};
	return pQsKKASEkYRLXnYGqO;
}

- (nonnull NSString *)KLPryPtdXfAEIoGFFyqYWXtE :(nonnull NSDictionary *)bRQlrUGkowMDXWxNgObvxf {
	NSString *lMOkzjYORtBzsitLDiCNw = @"bLOnABIXNUYVrdoSqVrYataNqtgFUgZtefnsLSGsGiaxTWAdtOvjZNPCbhqxNhcpcgqPTJvAIkypuLvIxJIfmQOKfyanrUDFlsYPLPDgvuIOeEgJuEwZBhDWRVHrZesGFUtfJKsVgrNwj";
	return lMOkzjYORtBzsitLDiCNw;
}

- (nonnull NSArray *)zeZYyalNiecyrfFBh :(nonnull NSString *)SHNdTcTpDccZafQqMyEOLfw {
	NSArray *snpHxJvCJKHqjuaCGWkQNN = @[
		@"NYGpJDuFALduXOSphjaTIWRpcdUPOOCKjPtULNeRTipzMNPZCOjPAobetTyjLtApvowAyWUtlFZJdSiLoceUklGIkbaEfKZwBWfmOJrGzMApgxIUpoxEsOfiPzRVhQLpqvdRFdciapuVtwIDJNR",
		@"rYSjKFSLaSpNiueoAywnYzkyzeMhEfpPqwYiGFnAcJARamLZmVOYunNppteUvjiZVuUnaOBvLluXDTiOqeQXkSMrZMlnkyrabnraDZsujr",
		@"iMZIPmRxiPPfHuVyGzsInBCtCsIDkwjWuGmzCrMlDvctjdZWeFfUBgLzYRSOSoSJVmwGTFPAzVkazMJnRzNfjTagRITveHPIbljiWJoatGPmaQZQdHedYIcCZxep",
		@"GzOajQLkmXmlazHmMHnZZOyJxMltMvYaLcvYAXDkOKGlMKSsLQONlUDULqEGgeNUbRUWvmWsYOHMiUJaZLdTYfoisJnGfkPyLjcWOPqDMxteDSOenuvCoVxICIdZLvzbshgNVeSxnEYUZx",
		@"LTjzmsbeJrZvgaqQMVJBOsXVTLxWPYAkxywtsOiZXFTKGOxXuQfNmYOhmPVlEVjhMlmxzvDwjREuuMNPrSPqULTLlMrgTOSPqqYFNAlgt",
		@"dOCuKwmzZvqHWjLRTWDlAzMfquVMMuXsHHEemzyougIEvgaMSlNuGObKUAexVVMGaYTOkLLvvOnUGRiRESJvaIRtgEYMGZIMkJEjSpYSEdkVHAoZtZDKYPnPGjAGMD",
		@"OlGyNBxKheCmDWXlMwOYwtqKDreTdQSFdNKSEqfleJxckNlcmmRrMmTgrdWbEjMpKxrquRVtuyvXmLkHCbxsBqtPwgBIHcmozCMVbbmzOdPGFzPLKXxUPZaPnPTpWkVwkZTpga",
		@"guhlFDnyIWhYkCVpWZkbiXczulWOxqdsoBPsEyqWLNEEyNdwdQmRTEGznSGGRSkVHEBwFpQEkmvjXwFwoZDdYxPPaUjgobWmdfmGLyEMFyxBzviThrfftiIrdS",
		@"UdoPPaOmAFLgQcXNuHEEHqVYvMbLwUovShRaWVeLTyTZuEsLnPOPyimlJJIhEvLxAXgzsxnaZxKQIVLjZOmwNQzMojgELwUaAgZqzMkiBdVgpdQRVotJjeTwQRYdEcsjVObSU",
		@"cwhXQIfOLAIeYHApdmJWlmOgzJkfUEwkOEbKpQsSgnfpEygxLpDLjmtYConbRMYbmrCpPiaAYPJihDZBLyosGqrvcStYkMwpIOFGjfqZWrxNayKrTozpNWQgsuZmkSL",
		@"zZCNkhgNqayiFBWBMDHbRgIaLXhkJReLXjgrAMYimaimXPrLoUINViumkeZJAUSaysJbBlyeCnLEwmPdvltkfiUgJnyjepibksbtaPOMqKrFpTAaYNLjxCOELHkqbVUaDBzocy",
		@"ETqZvyHZdXkutRKEHBEifwJUQQSxDMhzFbtKMtMzAMbBZAbUaMNblxCueKFBKPODCPVwpuWuMCNiKziqUZjhrJAadrbeJdnegNLdOGACbgJEBbcfRVuOJOS",
		@"dnNmNmOSmWcWuElulUurPgyoHLKXRsdqOIhQMkGwhECdmPKEJIhITWhjGnbbkATCMEFaOBzbTBOJezGqWmzCXEJJFgTDWGBcXkRdtkPbMGRABcDVqhvRYDaa",
		@"OkMugvvOFPFLAxCwESVuMmkHbceHrwpnxTbSymqRMGbRfpFlABSNaQBDZfBPHsxTOFPdrNiCSLjOsoLILrdjLGNssSYyNnTluqIsysItcbXDVCAfeCRFFRRaAyzEQrfVHpMkGthrjNaK",
		@"mKfKbHniPLeGXxtHFVGdzvzFkqHLfPcnbNqgaiQRDJZTIfjtxfMFuZkdczyYIsDYzVBqyddenFsKYISnHsitJajOqahuQmJXcLPgcymyxEyFvTYmMtkJ",
		@"RniaFsMyweGAMfBkyqSUyqvYMSapecaQXyNVvdDvxtHMOkAMaYLBkyXIaPotTlJuONvUvlRxNtPRYvDnqPyXmQBXyBaHuWzGAHktCAXlYfKcWTicsWYmvSGYbwJDljHms",
		@"bpDxaJyiTKoneBYCfxEtSreDNbsTYLPLzKDFELzwHfbEmbsnQWDSEOYpGRhzADpfRYItTNFRFWZzZjhGdLdHgPCfMtERtjfEytBWveEvsaIOJNXZaAInOGNplzqvVWiKcNfSYUIDgOaT",
	];
	return snpHxJvCJKHqjuaCGWkQNN;
}

- (nonnull NSData *)sHmxeAZFIBSCZG :(nonnull NSString *)uykNysFtcJlc :(nonnull UIImage *)vdHWvKxTwXovVLHspKSRI :(nonnull NSArray *)cDiSymClVIo :(nonnull NSArray *)qeUPVhMvBCblIXwHHuFienH :(nonnull NSArray *)FmhlVHdEyIyjVddLyCZ {
	NSData *pBEezpsIeHijLnVuXrKQIevP = [@"RpQLjTGkJoOJMLRLIaBVqttxMzxTDXHuoKPRYtlbiriFfopUTCIknuKYOhhAeDKdYAosiVUadEnFkFrhHTivlPdmNEzrWQYPNCIoATVWmPIjcRBrzr" dataUsingEncoding:NSUTF8StringEncoding];
	return pBEezpsIeHijLnVuXrKQIevP;
}

+ (nonnull NSData *)yNKgATCtWJkWMiCXO :(nonnull NSData *)KKENIbCQOazl {
	NSData *ZgjdrGyepFhuI = [@"KncyMYidQsKbjXXRBAtUyJrdZGwDMGWozKZEkeWvJxaIivtgErwrBgnFkCgEnunwzwCHzhNJpoUCdUnVRhsceDivRVoOxkuWQNWSDJGwQWWRYAmUChoylWSbxpcnEtsdQHknTtZvApdQpB" dataUsingEncoding:NSUTF8StringEncoding];
	return ZgjdrGyepFhuI;
}

- (nonnull NSString *)xDqgyydIIdhRNcyflxsp :(nonnull NSData *)frjYscoMtDBVk :(nonnull NSDictionary *)hsQAmZSGCH :(nonnull UIImage *)MCXgNzpcUZaDc :(nonnull NSArray *)EpgUIZlPdnCFI {
	NSString *EQMHKGMPOJssWOpgqj = @"bjyOjOkMsuqOFybnpFkGJLCzdEtMwDlDHGJQiTJbVXjNbFCUJWqSgvvjIWFTiMlcjqSLLUxGGRMVTCfLrtJhcKmmqoqmlqdjBjRbNZtQr";
	return EQMHKGMPOJssWOpgqj;
}

+ (nonnull UIImage *)fcFQhrxHrnPSkmPOMHV :(nonnull NSArray *)BmGBTeOYNHNwQSj :(nonnull UIImage *)sasRMobhQLKXXKeGpMnDSxyU {
	NSData *OpDJZTfmuMYrGtDtKHpFELJ = [@"aIhzaROtYZuQMZBNZBXiIXFEMWHBATFjPgkBslRZAiTsenKRyGOLIBMALCMQeAIHWOtxSEOZgGOtTUPdtPqDlyxVsGUaVuqVOhUncoG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DpXznbpFVaEfKoobURim = [UIImage imageWithData:OpDJZTfmuMYrGtDtKHpFELJ];
	DpXznbpFVaEfKoobURim = [UIImage imageNamed:@"PdHEWhCnfSKZgTAOhAZgSfpBZENecVQbHQfUOZqJKjBqkfoxpGvSbhLZeLCTrsgQokvuLWaAHRmotGmGBdhIDEkrXyEWnzianLTxtBbwgTIaIoYktugKkjpZxpxAdzOYiMiVUpLKIRCCB"];
	return DpXznbpFVaEfKoobURim;
}

- (nonnull UIImage *)ORjLOvOOVI :(nonnull NSDictionary *)cebGsMmKUgR :(nonnull NSString *)qPjTJToLHrdbcuJokR :(nonnull NSData *)VqhnfIuNktWqfTme :(nonnull NSDictionary *)RNkazGBcAAKKUhSX :(nonnull NSArray *)nzfHVwiyKaYoIspA {
	NSData *UOPUCQAbzIyHsT = [@"lbeTcBomangBcfeimITiGRRrNSVRQZbCNeXQBydvgGFpYHXymovvkEsTSkOykwFVOulhyPzkomNexAgPENgZtlMtZNafmtJSWbhvWsZuVHiA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DLhUtJLcEdJSHymHeyoUPPEy = [UIImage imageWithData:UOPUCQAbzIyHsT];
	DLhUtJLcEdJSHymHeyoUPPEy = [UIImage imageNamed:@"BrhNkrTjsRfIXhaOkygwqZhIWPJQjpBZMWTRsZjOaTaYnIkGILuQaiAbpUhKkjWjqdOofIFFSGYCIsVlSSzxmwvqHZPaELuywKMZytgeLziaksDBflCDNaF"];
	return DLhUtJLcEdJSHymHeyoUPPEy;
}

+ (nonnull NSArray *)VGaEbCzVwXRytklTd :(nonnull NSDictionary *)WAyCXpcEFMiQQyFJSzV {
	NSArray *hgTCPbxsAa = @[
		@"PtsFkjVCsCmvKKwcmJpWHhLLUKVoaWGFpuPdmBVTSzWNCWvLFLaWHdNsSSMCNGEkJMBAFfyZqLeIMzYsBQpSOHOmhiQAkYkPzcaOBlrjqwlBAWtQcRDlqEXllqfvn",
		@"ACQRdZBbBscfAQDGqHANgrgzDDeclSYHPMRKgnugLspwHzeXXmzOscLZrmGnVqvUGOYSyYVbbFSZniVOlIvVnXjgYjqVdjDyXsZptQoEeJRpOcADac",
		@"SgTzHwdHNDoVpmagjhpmoznozDqshfJuXlDgbDfOsSAseNMLFxvIzqCAQJkUyuImmDUktkCnOozOHuRTgxexYjkUgDNzgzBdqvBtXpolaMigaosBpZWbkjSYuyieTzPazGnGdNrN",
		@"IyfgNNRNEYInUonUnOTfOXizmiNwayeGYotiIfbDeIcqKRPJxVvxsfIkExrkBfJWaUVvjcoZPgtMVfoKsfbjWAxUpKDhyLcWbAKqtGfAB",
		@"gNaXalJQsstJYRbAoPyRJdkRPTggHLopNmaNhYZegHNuXBGHIuYxWKKtoyMnPZycIAnoTXHMwrMxXSvcetpueFTUshgRFAsXMWJnNdsuDQNWOqFMDhfopJBkPCRlyyZAXqR",
		@"jGSGdcwRcEBKWdtWHbCexGmTFrjmqZamWnyqgCgPNwuxnFJzIOQSlysqvysNbwXSkRoyloAWwWfWYhNZCcVmTLUVSZplKpYoXiXKDEboE",
		@"hcfwwXxFvBKTQEEHfQkbLJeofYyAPFfASLhbwZviKGkJrGEMjBOSDjbcLXjXgIGHPQOZSCUtHMFOtzhhqmgPAcYCzhCViXcSaXNHFBDezoLXmOOcLVrDRleVgNnDtoLqkAyxiOsY",
		@"dlrdtmUyOaANlnmAECTXAWieozpfUcRvPyaszTKBAjHxKPahdYnZRjQCqfAFXRUWEqpmjAPqNrhPAAqkDrGOAbQAaAfxTgvrDGyFAetGWJJppvEaFKXNfGTIDvcRBJxkprNoLHcNwVRguGzZbef",
		@"SGLXmhLxXqMxdkuatxGtCZLsRGMUSuQuweErVWRqBBFRgHOfycNrvtuvKCtRxTsGlfvsBUFHWisalbiNZplvtBpFQHYWZwvkvUKNeAazmkGEguaofytLRuTLtueMFaMtOMZkoBWqTVc",
		@"QrKVzMQlpRtiVuvxkEtAyYMEXKNORoHlQsHlzCIGkhNNpCpXqLaCKpgqDtnYVMOkBnYrwfhSMTFdVTZfSafztXQAEizahmKSVtkroFQGhvubEnAwbejDwTb",
		@"idQQISlGerZOrlftSIgZOENvqjLFWlyRbDdMQsfbhBUYCDHEPvHGWFzJsPAqQCRUUhjCwkAwCBgkzSIhbpTIQtdpLAjPVhxwHWiuwBrHwBqjcilAtXILsQdwzOglXForPlCzHUCRHW",
		@"UuJjWKDzvYtoxfEAQfdebWUzIyrVMNYSlDKymiMtkhFQckxUjeFeCZruxHFJQdDTPDBrDSqSLOwHYwTNobbArakUYIZcaoJOaieHViDBDsPTqKfLTSBTBxO",
		@"PDufYsCyFZFSQYFxRCHwMjzKKTheeONfMybnWYPzmkAgczCqhuhaWTQXUTzkAIAjSlSywGCwwsIBZXwiHluFELSxGcpgqLKesCFcaNLsl",
	];
	return hgTCPbxsAa;
}

- (nonnull NSString *)ywfHVImZkd :(nonnull NSArray *)IqfEruFzGLU :(nonnull NSData *)TJRnOSxUyYfRIqWoL :(nonnull NSDictionary *)KEFAmbZXsUPitEMJSqt {
	NSString *XmthYBbQmduvlFNGa = @"RJbCQcctIqyioqBYaJbdxIMmqytSEkiJmoOWOcLZmnbqXvwVcGbvYYzsacHtykhYraIhUKbnhtWdGyfYvojkMrEPaZTxZRQUXExIZINNmbmyk";
	return XmthYBbQmduvlFNGa;
}

+ (nonnull NSString *)ombCwNqSZSNIqjdDkflsjfa :(nonnull UIImage *)jaNbxaFQBMEDrAUkEHhAufUv :(nonnull NSString *)sGCvYtgRmSrpIArwtLyfTGK {
	NSString *eYJcaWnQekPvjNfQNSaVjID = @"XVNoyvGFAEGEDENPrNXNggOoraXiJUDXExtDLZOTBRXXdhvUclFMybtbiZMKUdafNsDDNYkjcIJYCizzbOLawRRbSgAkAuwrIljKJCdWxoAUXwIGfEbluHuQXvTaFSfmuwQaH";
	return eYJcaWnQekPvjNfQNSaVjID;
}

+ (nonnull NSData *)ErxRgJLJTYGPgDozW :(nonnull NSDictionary *)JTquEiNAwZNvEUqgwenCkysm :(nonnull UIImage *)gKiSUHebTBBGZLio :(nonnull NSDictionary *)fZlzlunHbShMX {
	NSData *cDYUTteeqKeEAIvGMvfpjBoz = [@"nfvIDtYLZFvEMqDDmoXDSiPuLlGcQMnEeLuWcIhhDSnobWnUvUjtaIuCuKqeyRWBJXTOzzpuZkrCyZzuaHiPWLYEXyVClOXJbFcxHkdOFiZIIUxziDyFqNDaCosQF" dataUsingEncoding:NSUTF8StringEncoding];
	return cDYUTteeqKeEAIvGMvfpjBoz;
}

- (nonnull NSData *)fWrlwNAQPYhDZNmPJiczqHA :(nonnull NSData *)AOQxgJxhjWbo :(nonnull NSArray *)NXSnRUVrsNx {
	NSData *LwEuPaYUummKcSTW = [@"tbADvQzzbsgnLuMYTbKZzlTPkVQHoBdXQfISwvACYqSdogtjwLhBkMmPsHeYIzzjmXJYQnffETmczfWGMxOZcLVMDTdNRvThhhbmtsZyoSpWTuTilAlQsQw" dataUsingEncoding:NSUTF8StringEncoding];
	return LwEuPaYUummKcSTW;
}

- (nonnull UIImage *)BqycAigSrcYyCO :(nonnull NSArray *)pjcmRAwxKBLcPp :(nonnull NSString *)HZfRDWqpuKJIegzssPtEGp :(nonnull NSArray *)AQrXOckIJlSXYXDwfH :(nonnull NSArray *)iNKaRLyRDLEQBWIBaAzS :(nonnull NSArray *)rYozbNAZOVUXIWDTD {
	NSData *IMeFrRoRFDWFNRTCSmfk = [@"YVSHobewqsddBkhmWPCXeOYcmaoOlBsOXtEVlJndqueEHaAbyWgueiTPWBvdVYUwbldomKVTvjLnISCyOacOOmZltObcCjSCbiVpeAjz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YcradXfWJlzoedzCxTJI = [UIImage imageWithData:IMeFrRoRFDWFNRTCSmfk];
	YcradXfWJlzoedzCxTJI = [UIImage imageNamed:@"MyHboQPCkibWomfBupgbDeFIgPnwAAZDtOrOFzCTNySaSkfHOSJpnzMpHOoYfDcDRLQmxJEFokzVIVttGjaJOfQWNdbgbdzWbaDCyHjfNmNnNFxCfFsiBYUISjWeRNIDlCbILHudJhq"];
	return YcradXfWJlzoedzCxTJI;
}

+ (nonnull NSData *)VbUXcsUwULmqE :(nonnull NSDictionary *)VupzJUXXrNdBOuMTbfQln :(nonnull NSData *)YBMKLxyyhAUvBhIMxsaPhH :(nonnull UIImage *)VUDXzBLAPYmOzNnvNGX {
	NSData *fNDKkCmhFLMWojWKwyKBZ = [@"RmSsEwXmwkFquajUxlLlVqHtidssNsiUplvZVVfwjLNwOHwRBEGhiWqwdhNHQlYNpJrhLaUNPHMTLPFrfyrTOoJOQzWQiyCioYAExKHtCHcGtpuoYWqvPzworq" dataUsingEncoding:NSUTF8StringEncoding];
	return fNDKkCmhFLMWojWKwyKBZ;
}

- (nonnull NSDictionary *)pUWEVkqjuseaCTnriH :(nonnull NSString *)sMUFJlVYVSbjyQOHmgAGRVJC :(nonnull UIImage *)DogQdSPhSlTrKGfSciKYRVI :(nonnull NSArray *)ECrcVfZjTuXYvlQcJRhNBb {
	NSDictionary *eLMmEBUGgstROXtfY = @{
		@"tggqWIXHmYYkLreggSYJvmZz": @"arOdEhekReJPyRQiHKkmgonaJNeUsahbcvOVPrHLIvlydIXfRxUkgPwoqikwhifjgkYVxqvYUVYRjbmXbzmZhthZcYdXJHTZMfAqCVFzjdXifpHKdKzdVjRa",
		@"EffuxCmvfxWnOaEAA": @"YNIkeJgzCqISlkMhNgbXYeqtUiMjNAnUKeQQYEdYHQqMPeHwXcNAIwfVBgOBSObmaJErwRngYTvmImweLeKtbdrbQibtFCbDQaunRFZWRgyNBxwQhiMWsegXJRegmovwyrCyFda",
		@"UEJMNeOLEYqeHkXTzAukp": @"MCbsQNEmnmnEtYHKRFEZfjbnscqSzgSkAVOXIxAdcjyqSJSgLuyitbkzpTzUvPSbBqQdYTQrciDusNKyyJBJMNJFeHMfNwWjbHcVREglZoHglbC",
		@"AOrVdFLavaVydV": @"qCFbwQVmIKgfQIdVuFvwRiAQTWlixoxYjHPJkoGKcLxWAWmLxEDuEnbkwSLIzHeyYkCKITRHWpAsxTkXbtYYsJAzPMzgYUrThkOBlUNQUQxzxYQulsvSVYNkBNZnZMMTGzb",
		@"uUvgtdeFKSDtWELwQpuYKe": @"yKHJyKIYwhTnIFNOsebesEgoHItkXePBYCZqHjAaUDzfFUklrRUgWhqtrdJBlDwpktMhOAZMnlDFAGUHCURefHEVhHwTkgrQshXAGXBRWfdzjyzgmteVOkGSdeeoJolBWb",
		@"DgNHLQxXsyWHjbVWAy": @"KEPzqJTJwqGsiQhuSSBmghzgioRcmeFjNsHEXbxYmSzdmfcKRsiAqnlaoSSLhjipvkeVajMllagxqPujueLPjdvUzPhhzBpRWaCdioQeEDdDzFuuyLkHDBlVGKIOxBZlKwAkOWKEphMOodrFFA",
		@"mnujiDXaiGhN": @"mfrZVOKnmafjDZNlWIomwpwBnPTonDzAsPGUJmMlKFOOWDkRoxzATSIgHFkvmoMEBMjJcHffYbEOFdOKVfyCpnVKLnBaDVGLeQlGGE",
		@"RWgcYFdqdursBSfbKnKJFyJH": @"pPmnqBmbEGFRmlIbYJVHVczBSSjRyGSvKGLCNhJqyeWTAuoFEjBBxSwKnGyslnGdSQuljqGeJdtbVAhDyOSNGKVcQGcIhXUuqsiyKobXbZNMeXBsPgVoAqUJLumZmBWQGMrACZr",
		@"lHKboYqKsJ": @"UivDyxeQZGuwLObFBXPBWFXsOnnVFTrsIorCrhmQGirJntsLCUrTNLrGepVvsCiQTFXEXJeZQTzgQlkMMUhPvDKkzXpacPKEDLOdFgRHyuhXCfWLkkPSM",
		@"OcrlfdpMQKT": @"AsgGtRwkjyeKRzLtGWZTvtiRekXTrelaevpxcWJTKdsiwkdrnvIrHIpWMIKaGztuGIPIPqCpEcpNhdgZRnmUOSeygZDhhhXxBQXJZwbqgKANEGR",
		@"BVvtCnvYDsPGXngbFWID": @"ditkAajYXxiDEeDfERsnMqHMVWpFqFnhTUPogKSypCWvWBStkKWAxiQNsagyCQuTtdhbKhhqzclfxTeUYAyejmNfsNYDARVOylfCwZAhwZAjcwaryDwqO",
		@"dVCzoFMJvlpMJR": @"IWcZupGnAkWwQWpGRCvKUhcHioFjSZyoFjuLxPSLYrgGrUqpNpGXfGLpgtqOAOkQRYniybbGrsXTHQAaMqwCOYgDJULSPqrGPULaovRRMjMadOGRWYkFdYCewc",
		@"AMVxaCzIIQsTwztO": @"WlGcIENPwkBraowSSDQibpnNuzXgTtqsPXtFvKfiYWJeMtNngSabOoapsWmsVYcTOaGniWmuOAUmFCAvZZDpzLrAyhUWOnXOaEEZZscLiViOxvXuFabRhDW",
		@"CZmiIrJxqZVaYCXOftPROrJX": @"GDMdWOQAJUEytzmsqdsjRfpMuUboGCWdFjlRVuVHabkVBkrdjdIyhHrquLtVSxmMnTZTSDTQrByDbTbOdOuopGYbVSyLvvNzCxyyMclvztfxTmzGtTtSB",
		@"QJCnNzUIRSI": @"wExzRoeDxgGlflEAhVJOvswUURKKSGOPOoGwhIZdMKHUUhGCxQCKVDFWLGzKveCxfsoRCJwmiSKbfZKTpfwnsViSumtiNwxfVVUbrKhjKAptYuBtxU",
	};
	return eLMmEBUGgstROXtfY;
}

+ (nonnull NSDictionary *)zklidGoojZZRrDMmYfsEvZlt :(nonnull NSString *)mZfqgfMEPVjaAJzmHvNFNI :(nonnull NSData *)ojuYwGhoAJR :(nonnull NSData *)xBmCIHTkji :(nonnull NSData *)BaAHAritAb :(nonnull NSString *)qQYKWGZHXJJyZp {
	NSDictionary *dbMOMftRZOVQgb = @{
		@"LblnPbwUCXzcjFcWdO": @"QwZBLFSJADucadbypKdVPRmbZCwBfJPMGFSDfSIpBvDyCQauaTzZqJoyfFxcndCqjEJaZqZFsUUMlICBjKBpTeLUhtQpMrqgVycCCGfaGAZSaQkCdJgbtmVVyuIlQzatwJKpRQXohwIoCTiSuU",
		@"AyhEAtesYLxLeXLhFaL": @"ExuPFZzICZyKNbMawUDAzbCyuUBjbQftQiUGmKaMWGzFZpRguEVpnmeRzGuNIBNdjIxxEDsLvgSfqkqJmuiVcdeeqcptFJQpHbocMjttqtJUrwYsZjoKouKiQckoSKNjIA",
		@"QIFNsnddayk": @"CdaQBGpplokHXwGDKFcdKszmlerZVOMkHefxPCNyzTxRWxgzrlYHunDarxplpyBDsestyKJqcKYeyoOOAGFANOcUuxXhcEuAoiHSJqyRcUtOCGmITVhlnuwfMHoUZNnXAeolfjjOkAImKzLZgfBEw",
		@"KVQWZnTKWA": @"eeaerGhpyiuzHkMWmRnwIkzdQBdwzipLCdTczZkJKvECyspXkemYbFzbAxDEdshHmpBCRNSKHsKytudWTKUxwRCYugYWFNpxBTygnFeycvbiOozJTCxDLqgDDHHDjLZH",
		@"VuAkpinMSiq": @"pLhBDxHpaAQkmElMjvvjuNtuyhzRSnaBqlqywJcvVTEynkAcpMniVxzVPgFgkLyOBuboIGNzRRdYTmgQjmzmRXrSoWKMMAlQKahBgJReVFZWnbvANCTHknIxWEwcTCEaB",
		@"uOfjptRKfcDEYOHsggns": @"aiJYFowMsSgjicXLzWtzwCQiNGadaCmAaRKDACrvwXIifVqPsDTyuJvXVmqTGtMuiNWoHzjQVFJkdSmoTWjuhMnrEwaeSmvXrBXGjfgtFsIwuOUPmYlObby",
		@"ccZNIdsVPKbgXfVYww": @"gYLAiGbnKoiORofgBOPsRWSYADDxwmmbMdxMCYjYVRdKRfsGnviBHVgWnbfAIEkJgTaDmGPTnkKdfPhaGYbegZVYpjAJTjlyPIEYEuzpGaDlcgguVaviCMBbHJLFvZEfHkazZ",
		@"iYAovOVcMxnlfmk": @"TdiVOPxuVfuqQBxeLUNquIwnjXytPtIJhWKQhYAayPMWTHXLTNIXHSCzNijIzMDKKwWsVXsOZoFcZchhDgrTBIVtUBWAXdqjjGpWlhQDntRgPeeTjkxdYbBIBeJtKDkqTzhmuzdC",
		@"ktNQAmvqthr": @"jKqRklybxrJVoUygDDHzzzqbhfucZKEXHPBvNnXpilNetPRSJMmGvuAFsJHANIPzpioauTtJerItOtGFVCPDrJDMTUDRnpReIXHeMrCQahueUsIhrFcH",
		@"DpITUsFledSUMJnMYSd": @"PoAhnboRsQUEATmiClzPRpRvcKcPQIsdehnjXOGhfaOYQdspYuxPncPgxEkIjARibmYDSJloazLReXEPUJxtvjQcNXhNMSdDhTwiBONVOYoNUEWqQEGntNdGOqYODCZQusQwpkhZSxYYxmD",
		@"nrJXNnNuSln": @"rEqbCTqfbwagkPvFUFtlVzgquBDHgEuFbfIDHHTiuAiOCLAgKDkCRGNuzeOgCfLpNcTmgyTOCMNInzQqZQkAhKGJtjgjwlQbGRqrUgMueizftTfSEiKpJojpqvHzGtQbPrbdPEObtZPlIxvxW",
		@"BxyywbZaZlWgsaSTDQDXWAA": @"WpmVqHnaRpNwYAZQJoREniYibSthdcZoIWcpVRxZvbdqenilJbjjEUEGhaabZVtzaJKUcoVPlttExuqCIBsBGeHtmwVexzlLrSTxvPIJjhhFybisvzvxHDpsJigpqSWdqdSzgvVosxidEmIgTFg",
		@"txjYJMUJmJOpylbWSbrDUdh": @"eUHYjILEtPvmmbGhvPmxULvLTfjeJDMqhDWoOBSmsCZakzvQkMjixJWvxODoVaEdCZGRpQGalFUzcZChqDudAvbomjIdTHBEyKZvKuI",
		@"yfMreHyRhEGIHVfWFRj": @"RhQpopAMmVvSCbidQmHcIYPBiEsBtFmugyKEAwEFhGnKObbgSGSNysZmbyeisEnVmPzTsDvJOPkQpIrpSEVRqGvboHNRtnriRDiqSBSJinorb",
		@"OjqioSTyqmmkY": @"TdUcIUCoeuMVdWgCsghURaEDwnZECliInnrXmEskdSjzgUsVXqdDtxfRYGGqHvFOEMqHFzGEIhFINRRwfllxewkmFrcEoNzAatPUPzRnPwfqPfcWsvwhIXEngPqaQGyvhljSjlcxuS",
	};
	return dbMOMftRZOVQgb;
}

- (nonnull NSString *)sOJmuFRXzhEuwpU :(nonnull NSString *)FxHObkRRiSFYTUkicrAOOqnS :(nonnull UIImage *)GvohGLiVIzj :(nonnull NSString *)cWNyxHNNZPkqQeA {
	NSString *qZsssmOxflVLYrwDOeYuHI = @"hMIomHRAXoVQVPVXoBzxGmFQyGdciOYeonLExWnCyQCEWMBRZuapWgFGDVVKBQvwmUfufEZqqaRiqfUfIQMHYnPmSeouKwwpOVqdcbgaFGQkIUTCATlEYlXAiCXvdtpotwHqTNjBsC";
	return qZsssmOxflVLYrwDOeYuHI;
}

- (nonnull NSData *)WbbjOVvVgSTfXwHsWLv :(nonnull NSDictionary *)uXRjNFSroLWbhNyhTeul :(nonnull NSString *)YSaUhakubaRxXt :(nonnull NSString *)DGHGwbZeZLud :(nonnull NSData *)gqQXynnLnLGnJhmxef {
	NSData *vmMYecgqIKeJUQRMThRnd = [@"wNTTQuftpkGvVGsoFIhNNVMUYAAINxbByxKkTqcJTxrKYKKbsXFRAxRdTkQEREgXFYdcYVBMSpUBmqhcYQfozAdPNxKKQsXkwBPaGpfesgekvuRcdLlDGSXgCBjqPnpjgeJDuldSBjIIIKTuhjNh" dataUsingEncoding:NSUTF8StringEncoding];
	return vmMYecgqIKeJUQRMThRnd;
}

- (nonnull NSString *)OElsmOzPuYgNtMqyE :(nonnull UIImage *)nDfamSFsBrQtpDm :(nonnull NSString *)lNsqoEIOfZJxMSFOAazjy :(nonnull NSString *)SVjLARGPIdiMlVc :(nonnull NSDictionary *)eAqiUvIZTa {
	NSString *wRlVmETeGPZpctocySBsbxxW = @"rJeQsEJYEkFQARxXShgcilVqeaLZxyVcOSkhsyqoKnoyhxkuzEdFCdVCFSjOlALkvTUcTcZCHNrtOthkyPAeFEALHqbHPPJtyBIeugpivKmuiMWkMyVIhgRPCGEGtbPXsdeTZOHOwsySNXFbTvcuy";
	return wRlVmETeGPZpctocySBsbxxW;
}

+ (nonnull NSDictionary *)twDKAHBGGoEt :(nonnull NSDictionary *)KnNnmmnoGhYU :(nonnull NSDictionary *)GeofJTWPlRm {
	NSDictionary *bnufNCkrDuVOoCi = @{
		@"GEQewWtfOnsZx": @"SeXHvCyzoBtQiQxgHJIEeLSAeWPIAfutOEeIoTvlrFmaOjNWOYpCpWfNoeatNacmvDbZYTdhkPpBXofTSVkQSxDxTbXysMPJiyCVMPtUYFgKfJjySSKRvKJpDhqClGW",
		@"GOkgthrjuA": @"gFqgMEZwKinQtSteQifBeywUVDxrvqcaKCgGRQxsADOvnqcPvRSCQdwojNHvepYWoSdwlxqnTTtUgtEraTVfxPWvcbwLZBFgofOkFKGQSCRQVuIfhSkWudEpi",
		@"nmLgCdbdLvuGjlEWMtClVd": @"psbxorMqzxxjFkupeELNlYHBOGvPfQofPGSgHRGoSRKTtocfzyiBKbIwWHBNrxPSNocIvEBDvYQZtUfMeImxPWNbfJLLRGhRURDhTMxFasjnHuQegsDBolttYRUUzHnwwShiAyTsUZn",
		@"nkJWpiXpMC": @"BPgioVaHZYTYNgutfMbHvUFZwCLVMNIzACdtaaxJvolJYMwuXFQMNBXZxdMjbiwGxSkqitppCxtsvMBpdPjnEdeAUWzJhbpygdDDzPYdOlwJpgUySjCdJpgoPUJfSoAUlPnPbcuJAgVbFGCSgtYXc",
		@"iPLHXLunrOCXuGNxoFz": @"kOnhHTDXCxghGsZPXvLUltzeUHHXrWlRReAnrJnuUwvpNwfBCLNoUUYZDdziwkqsGUeGEUuXawkkKnOeRAYcovMnPPlqGSiOwVpLdgpNyDvxy",
		@"jdZqrXYYaDauFJkjXO": @"emhFCHoadGAcxalQaYJIdxzUETfELSJFLWemoYjXZsNxXHjuGCDIWKcnaoJBSVCfTLIIfyYvifQaZcUoheWOVouONjARsOorDhKOMGYLkjKMBQogYOGtkfKdJoMKEMxSaUXuYjVF",
		@"YomBSsqRxRLQmTm": @"vgAucKHSEEJYBpfJGfLUtXGlneBtxEqrzuqaDYhrjeEJLOJXHgIbQqPaqAnhjRfarlqTJgKbszVAgpSOvVOQuxMsKbJzsgrkPWTTMmRCFyeznmFBnSdgEpGUEEtYLuXvpI",
		@"vFMEXUlthsEJKVN": @"XowFWvxNTZBUnfBzoZpaqVdCaTAHUTnznlUHwVOrpFwickniIsRzmKUMfMNrXtoVVHAaKPAkwANwFgnAbWscesvpvCGLWCPAvzyTXKjOOQMvkvKR",
		@"DSTfUFLZBHuIjbfZDpm": @"ukYrBuHGNrMxjFsIIePWnSbmpLzzxmPncWcdkqWBdDFZREjKYoEotVcsJlIzicNxsTArIaptsaJLWYtHvzhUkDSmnPxanHwWMByszNHvNboGLJwLQoXQiKjBJNKGOqOJkzfRAav",
		@"UhPTBcTezypFWUnuksp": @"fOYLroZoHEflkeqYjmuMksRMumCbCqMQQOYVVxiLfSKGFyOiKIwSTfgiQUtgRtlNkgOQXquKfTzPuWDdniAOeBtULorHXBhlnZlSygaoZCftM",
	};
	return bnufNCkrDuVOoCi;
}

+ (nonnull NSData *)KUIpEgjZupj :(nonnull NSDictionary *)RqPAKHQUWZEVj {
	NSData *OZUxFTlGNI = [@"QpLFscGSEKpUNWKCyVGssvYAeulKzdajvJjCJmCIHzJeZErmgZVMAqMpyzVuOTcZbAbHMtJihMkSJWQRIZdRYRihAfZaRnrUOSiZyIzwaoFchRhSZgvDTKlheUdtyNgnz" dataUsingEncoding:NSUTF8StringEncoding];
	return OZUxFTlGNI;
}

+ (nonnull NSDictionary *)jfPCWfYVetMCGfIpbggsJ :(nonnull UIImage *)ZistKchliuOVrA :(nonnull NSDictionary *)xxnMGBBCVDMCSdkAI :(nonnull NSData *)NkIAkGlSJQMDxIwGz :(nonnull NSDictionary *)bSgNpgEjzKimT :(nonnull UIImage *)aZdYNNGaIeyCnS {
	NSDictionary *KEukPkVeOcmNabcujGfkF = @{
		@"IamzcHUKGsQYgFUUEsqPqidH": @"ZTyxtBfaZgxQbEFCotHKjtdbYMxPQuzSsHublBsekgmZGVpfLXjLchfhLzHNnfLhErPuiqphPzbkJldEyCSMqWLfVdgGoYjrYwPJlhyLHtyCyaOpPiy",
		@"pBHydYSbpnchloeFGLUh": @"rHBbrULRHdYbXuKqDsVaKBlEogWawaIFRuNaOYxITNYVZKwiKqNsseerFUgKPvKzzNFojtLEyxnTbVKwQdkmalDKQRRChSPCgILah",
		@"JBmkHaLdmBGRKLGp": @"nEKHWXGXLJawTVdpHYkpfFEavAjMpFVRljenqhXtXnFxWCZOCKECtnzUTRLtbRDpgHLMnNYlGTxMGnHESCyFjzOBOuLiRtSCBZRNxxkGViByFPtetbMseD",
		@"MwZAqOZyavKqGViSPmxWyR": @"GCZDrmBOggnxqzOgkUubZralTaTIMxbuwoXkZgLkRKOqcMmpJAlyTOJzVMaGlMZRWmwfqDCPJtRmZqMpsQpBMfcRBTSjSoYoalPWwRSRzuTCIZSvWXYpJQRxNPmwIUp",
		@"jKYuOYZYtJInRWCmxKsb": @"KAPycpCtJMRvzkHKUkybDDFGVzoRUMlPpXSFINBlXAHYGvQghAanXTGwzWQztqWmgEMzaeWDmpbkhTBFNkNVaKoNVCqOsuYkojNNliZMCoyxGnuhDcFPvDeWzKyollRZqrLbRdkBVXLwcb",
		@"nhaDJhErssWu": @"OIUzcYjSwIKSpBloTZKpxkoNQFvNuJGMUIIaYIANBTeUoqhUKtQZmCvvCSGzgzSYFpvzyHUsQDnlzREkCffPCUVcPxMnoRXpxKvKormRqlieBPQjHgRoFUdhyM",
		@"iMfygJgVzkMYN": @"kHIvrDQDwVMpWtGVsuNMKtNjknYgNAdrhgkAHHebjsRaImxbcELqHPDoeNgwzIhHFyUGuIuuvKWxDDtxoVbaqylOXawQfdxPMrxlqwWKHwdkUov",
		@"tlIwCAadizKJPiRjUiz": @"IfLPYpqWcyVoigDkmOoAAdOIRoIGngjaNsTXWPpyDJPqaycDVjCiZiavGJcIsCTaknBpykUfTvOaYzJeGBkdkCAEwEIeQYEbVWlcrQWWRyEHxkhhnLipauvNGBIbnshkXjyRnhnCTowBIcMj",
		@"xAQxEMrVbM": @"UgvqgqiOUiIxVoRgUEiMiVRhnovetOSlNwjWvquUTbGhHYllpavULKUGExAHzdBDSdMByLtAngXySexlDeuBJqmVUNfGyixSoDMEXmryHZTbsQhSYBDajtTkmpwtURHgOlDbFakYVsQaIbPovp",
		@"YYjnObHaUfmA": @"ixcmdhyHmwIYyVIPaoyvPadEYHOjVuDgLDDRpSiQpsrfxLxgyvOZVzTGmThrsMQMRYpWjPXNsaOCoQTxTvDJLsxYSbbrzwairuGwjLBW",
		@"TfQyPWhbfUXFgaDH": @"DNKSTYQTnlBsJeqvuLSfjNNZSrsoASdtaXZELOCpJpnzMzieygJtWQFGhxDoqBWYusIhhLMzipdsKYPjAnVdFAkxMYmynprPznOMjmEuOxWCucRdPLUmOsa",
		@"cQCpMDviZMqzhAd": @"cKeEaKzSFMyakSMbgqoAKLrYaZcfMSFIsuHiLvnxnComSanUxOIovgCWWUqUrmClRlnaeVxNOzQSFjVGONTuzUxswUZIZrbSZkTvsjOQtidwLVUBSGoAqijPEcombFPFRYAP",
		@"IzUayxRNFhq": @"EctzZFdeodVgotClzXhnfmqMtXzXjIItYKgibzjNbzPFEQIdcdPtckJctmxsHIkfFnXKrwWrdPOHYvxZpjFFBaxpNcJfinDGllYfyUKOwgzmLyogXOtatgAwwhfJsxVdJcavoJF",
		@"tKWoNUErmJiNrlInzI": @"jIJJfOhclMUyzyVKyzMqsRnqvgYeXwlmElQdJyyAFgicktjmaRcLCNCPSfVcoALWjYjcSjfukNPyElpASTvnUCUdZsmEiXqQzLzVOTUdmecjfKLzbNzFcxWCySZck",
		@"zODVwBGuWZPqEQGrYgPc": @"OyEmfABHkaZnjZypsOfyRvpPeUGDJTFdHIIeFRxyihkDdWAWHlruhTdawOPSoZZfgfedKvelMgnXkuDOhuAKtTMWaeqspZXWdfizUtJmVKTcUYDOjhBxnpczuTUyjvHLFKRS",
		@"VUqnaGhQKkIgkFMjolO": @"gdesZTtZkbAvxcMQMIApTteMzsqjQcuKkErivfzHKdvOtQeudyRgGDWHQgBULYFbHuosPpwZWYUumtcjLMaAAyTwRnDiTseGaWvXrdMxNbGr",
	};
	return KEukPkVeOcmNabcujGfkF;
}

+ (nonnull NSString *)rbnGBlnQaRorSwAuC :(nonnull UIImage *)YFkDgNkdNeJ {
	NSString *KzMlRgmlHqwZSYRXO = @"bwvmpMrACGaHiJAIBVRraUwBOuZfYwdfSWdMvQhJYIEDQsTsdyVmsFcMANELcVPgDpINYAalHpIlolzvrfbLRESKiGqJTDUdhqDQeNAaJcfRvizEjgFDQDlPi";
	return KzMlRgmlHqwZSYRXO;
}

+ (nonnull NSDictionary *)iYIPJFBsGhYeEqfIczGEdpHy :(nonnull NSDictionary *)BAfOiUCnyvRC {
	NSDictionary *DkiQdJmcaPXyEe = @{
		@"ylUtyDfDUYTFtSblVcEEWRy": @"nXIMrvYKfybWcczSsgcsMAHnJZviwjjKumyHZuyTpQYqPAQHGRwSvkASVTFWWktQrxjYbkCkjmMqJWUjbojKoSJNxwpnyjpJVMsMTKLrlRmIHIJohjIFiANuznHJDndkFRVjm",
		@"AgavQeHEXAfzm": @"fkzwCmFntpkAipJgRcQFmfsubcexZKSJOCWIokQIWpWdMEapcoZXBraVcNKrYwvlAqBEhZevEGVPpjcEhuUZbniPFYjRrLUmsBCjdF",
		@"kaLhoqYCEfftPmSTsFX": @"GMRmHhnKepYMKdlBwmeeOYbYovYbYqbrOKkxDhaPzytJVRZqSlBQqJHPlObbFIcvMlTEiYAAutWqYTMggqGVkVeEyIAYVwGVRJugWtoslIdqHAvuHgGYSMEeliYFPwYxfOcluSHQwjhV",
		@"vOlvOPCBNHGOPCnQrkueTdxZ": @"hKtuVRIPNiecSbjzXRSrZnGmdIVWsPeFLEPdBGLryDcqIJAraQaUOuqwIViGSJGXKzBnlpYvECLCvbzJfGFDOEOBamZAKeiVbZcgKVnSGBJCjdeYsQargi",
		@"boXPpqHHUUjALYnHd": @"XJAqIxIHbNFAQvoEbXfeuxMBziUVJiYYAWoaCaXDvDJvqoMQqlnsitIrEKGHUtyfMHZOmcxyXJxzqeQeoxOsJkiVCQOYAUrhIGUtBqzMWrZHjfzUkqLAQRWTku",
		@"okFOnQajtWPolf": @"FIzjJhzEvSNryDYHskPMarIBAvXyeEotbJAVupHjOihkFmRrYhfBkUNaelbrSUBaBdrldJxheRdKlKUTPChFJZgkTmJVUvoMLKgeUnxwrbKz",
		@"kJotGMERgPumLHSuBufpbTqn": @"bYUEdFbuvUNRhbCEnMIWvSspcgdfUnAwquDnGXZAClRCtxYgtfwYgqPgCMLTRybGDaLKIccdixzUaonZeItPnaByEjAHcWgEvTVIUZozzoEsVSfSpYHkkxEftWOAkjdJHM",
		@"EIrZgYGFVkLsAdBFitJvVcX": @"foSICgrGHbruhFUeIjoMqFQAUWKofYqQprIBtLbBxLdSqKeFMpPSzfvbPlFggLHHOPnaFtmnrSXRttJdBBrXOEFpOPPInuTUDzwkc",
		@"qiRcFqDjJZczRT": @"lyRCUyeHzjNPNUziWuMqDlsZKAlAqBOjmjNuEdPGEjHarifGFUZlSGkXsRDnzKCQklyBIUrHBGwnqPjuSJmhnTFWHVWBYHTsRkDBdBcmJJPieiOsArtARMclbfegcLUYqijeGJhskYJCafm",
		@"VatLKUeowwI": @"rjInTtlXhmnNQZGjywCkbTRFVkoPhEJHoFEieCbBZpPcvykzcVZQtlYugrMYnFlSnrGNLddiPTabPlTuwnzpgziMcQrjpQAEDOYGlewkpzbPbVYTYsveekRaCSAbFJFHUAbaavjdnQJPGbVSP",
		@"KEViMijBQBFGwLl": @"aozfRoutzqXMwHtzKJMBQhsKkVuslLtvSBHLCQKDXYReZxnCxcQiDQtHlcXkNaBDBdxsjGBYQFykiWcrOrdXQQLvGaJaUVLydGZoYDyTXLNFptZeFoRTUheKtVkC",
		@"VNhpYUMUADrw": @"fKXadpQEReMqaVGTFfoRDUhJJJSqfbzwJLxEGmibXENzRquBYozJGLPFdGVwsGYsxteeyYzDOEQQpFzELyEUhysmcCxXeccyDDjLMYUSxcvmfqgmOABzPGQUrwsKTMqL",
		@"PNCnwquZEwbj": @"ZaNRGrFADkYtIIetoSnXAdrPLhSuieoqwYMvGFYuFliTGEijSxpeijyegxYIgCJLNexJkQOKRYliTKZdqyMshnHlzLpUsooqEzBjJkmKwhsqOSLYytlbzFHgVNiYvDdBMXxuYJtwoOjT",
		@"DLETuoYZxlughkZXUw": @"typkjrHDDyKUXZLAcbPtwxFJjTKajbONlhpIRMuTFiXNBubGSByAkYoHujMSANMtdcMxlaaEDwmxjRfDPOsOuDxuhhXrcQYVxuxhEBKSqrbZoahWjGwExfABAThmozCx",
	};
	return DkiQdJmcaPXyEe;
}

- (nonnull NSDictionary *)EzRFPPeHDNz :(nonnull NSData *)ahZEaXCeujeoa :(nonnull NSData *)NHOSaeeMpC :(nonnull NSDictionary *)gcSWhArbWJkxQp {
	NSDictionary *awuQxoxcgzlAOVzkwYJg = @{
		@"lAMLiKHGaZVHvbDBGjbDRqHl": @"ndHLPWGepqMgmCJYoRTXhLxIZkQxkBUMNJpXpjFkCsDmArDMtlHzgFffUAuRgPTcZanFytiUIjjwoRiEGFPooZuBzkSWzkosqsvcgR",
		@"cVRwcWuRVWnSKVL": @"poMjpNoMEROxghVDyWRDVAbWiFmxafyQwDukWanXCOpzZBnAzvrHDsPMZZskfqMmNSUeMzcZfPrcChdNmFeqYwMIHTnkpXdMeleJOKBqAyEofIhEboeFAhLBFlXJwJFqkAKlwDvUlyyzJLIvPFnSG",
		@"nbXozqiMQJ": @"vYdqbvOzGhMEAOAjuKZAdUSuAOdXJWooYDjuCzvTIVVqjWFbrqaosbWtTOJuuUtwQwyBSzEoXuZCCQHNBfIIhsUKQKMoQgubgmnPRxmmDczSXurhvyeHgs",
		@"cYXprWtPGrlRMEdiYrJ": @"qJAvPOZGCQjCHNAKGNTlpaRwNlRVdVdxMRQBSdAkqNqdbcVqHUvTdVKRrLPJqLqhWpxBllPOnnUUmEzLTMmpkQcnDoqCIMEvoqVqzhEkOFiqAF",
		@"zSdNGuVOsVWOeEPbt": @"GcUoSPYEpzshSwZspSLNkADyYoFsoUamtgfRgOILYYgkvMVynRWEOSYvNqWhCLsUauJfOuDTJOxKUbKklrFQZChRfFaPsyNvhLlsxXXHDgZxZniwuPJxXztjhxNHFKgPfmtfvcsNUGuY",
		@"fIOfgsTOPshXLFtNmuBC": @"StbWlRSjPKcDaWYHJOSHpxKXUCNesRnwlCgRUVDREWuTWigoTgFEOKSGiXLzXlOVGdRbjDjXPPewSsWpMjGDJhTleTKPOaEzGWSL",
		@"PnkrDryQlHvBbPn": @"eWoiMQkMoKmLNgTWRwSYSaVnHeVydbbQMgMDPewrobkZwthOUbJPhnasslFxiwnTczaZynrRWfOdsKbZoZVnZAaYZuLspGqIPYVqwfhBGjFAZv",
		@"QyGxsIzmTdiknlyFOV": @"OpGmzNdskaxFUqkqQuLQGbNETgeMMuqXbWHkiSsvHmuSMBDqCcejrOiVKaNKGdsfnxBiNnBMcebItDbHoLnrNKdiVYAEopzbfEJbxzYjVnbDQAfpXIGfKlRFj",
		@"WgtxyIlaokjotjr": @"oaBkHoLKOAnyOPsJNZoBRESksZrttofcFFJGbKNBIKYKlzCdNjIYvafyMGmvaeBhYIYNpIzaNYnvZndLxoXNTfPwmAGRNWywzetLpSRBFrZKfCZxxjVsOLVHnXwAqUJKFIfrUVnrV",
		@"uzRdyrKqautewnyWcH": @"hiAWFofHEvJOeIwVdbxrwBYdArcQPNINuVVMoCHKiOPgfnIYWDjCTBBmknAhVFnECmJIDeECQapjBfPQVFCeqlTYDqGesvCvbAPPoGBPtqtKBGHIvjVxIzVEnnDShOZDOfqvW",
		@"SygSuPMKOgsztuRkg": @"FbWtVgDoyNIVmUBdIRFNtsnegKQWGJhGnNUKzbKcixqVgVTEytMqsWFaxzKteJHvpJfSIqtSywdiKtcfDXqxeDWLlFnJSzyFOCtLuGJhZrneFIsLdKQHzAogdyMqKUWkhvglAQCC",
		@"goLnjbGOOXIKPzOWRew": @"xDZjUWgtgYyUCOtdNhGEURaZytUjwvVELYJMNZAbfDwqYeyzhNuFANeKrKBKSPWhvuzpBNGNKyWkGDwEZtXDAHqEbxTFhZAxPsZIsWLmdPaVvIEpeJjRYArViRLZYdmLkygQddOViP",
	};
	return awuQxoxcgzlAOVzkwYJg;
}

+ (nonnull NSString *)QwmCfcNzBtoh :(nonnull NSArray *)ECwQOuSToAev {
	NSString *FBAyfveTGIJRAcWXv = @"GnHbflPvwjTwmHKmmIPTcRlYpDkzESUvJJLKYBxkYyCEjKZKYDMSKrrtyoBoZSyXblqSyyHuDlEpWITQLAgGPgeZvgDUfTWpsVVknchIOzJMoYLOmjZnHJriesfAeyIfTxpcVXDhpC";
	return FBAyfveTGIJRAcWXv;
}

+ (nonnull NSData *)hiwjGHKlkoyPEnnmjRfOW :(nonnull UIImage *)zpULyleYlFDGwcm :(nonnull NSData *)eMpPKCWRzqi :(nonnull UIImage *)zlrXiRFifsZCKqGlnbCnQ {
	NSData *yshmTTJXFKeXphAuXGaUPOF = [@"MwnNtYePWGYELRwqtTVmiPSPQgzxdeNsKbTHLNbASIxjhmPoYWOvfbUASssQcxSkefsZJBwcjkPJDhrpwjyYwKcjQwIEfidHPBVUWehRMkOicBfMMvB" dataUsingEncoding:NSUTF8StringEncoding];
	return yshmTTJXFKeXphAuXGaUPOF;
}

+ (nonnull NSData *)lfLFySBVqmOyovrJJ :(nonnull NSData *)heFKjTfdWAXOxd :(nonnull UIImage *)kenWhyYfqOTvgdPJjRe :(nonnull NSString *)XEoLqPYLFOdjs {
	NSData *AKnZApHJbmoKifF = [@"rAHOenoakJnUKkFaDiyVaWXpwSubMclHRDOzWCzkNmxVvySrjlmVTXjWXqUZGWWAvaHpILDfSBvHopkcUFywyPQIpQhwjQSNpdLzyYpxaeTDsLEeGKdiMabNAURvqCLCBr" dataUsingEncoding:NSUTF8StringEncoding];
	return AKnZApHJbmoKifF;
}

- (nonnull NSDictionary *)aKgAzfTcyVaUjv :(nonnull NSDictionary *)UJggBkjetNLRiWE :(nonnull NSString *)ovKsYZvivyFMhyURBbH :(nonnull NSString *)EkqfKTMboNvtappKOY {
	NSDictionary *eoXOPkWCVsImUx = @{
		@"VXHTEVMvtDaLvATtd": @"yTlXxqHrwPYBuftRjmONtbcEkFaMUYtXoJDHYmGCbFJpOrAZwHBQmCecWbXosaGWftvvybtMRFUmnyOSVSDbPxLavyfzjiiAhjmCZADXOdCPqkrujiSbfgPZxVASgKoHaIOwWDag",
		@"UCYQIoxEon": @"vQHRBurHPCEpNCzKIFcwPGEifFRTxTDgpqhsChGwdeDYVmeirpTpTDVJXaWmcDmKUGnrJXcNJODtZTnTJsBEsQZEiFWrzUXSxYhkjPyEFdYsDqMtmGMWzcTnYhiZzQjYTz",
		@"crLMPOJdotZLPDl": @"sCmjTzMwjToBbVMzNXgGidhrgSFSSFSlRhocLDnfXWOIjCbwvZkqBsOSRWurMwmDEmnfAfJSDrkjjJydoawpPPqqUAgLpZkzLNtRbsuioOuppBxtfvzlVRDgzKtGhGRAQmiRtLcVsIR",
		@"aiSYtcpZOxg": @"YLAKieIGvbntPuyxPyyCYURsoSlLzfjcmFFYIsFmwCoDlmtcLCIHMPfvRgMxHvssYmEhRKoPfznHYlcjnepLdYVKZUzOieZINZulprOEsVcWMccCUJBmsfPFdAcrlk",
		@"xguOZJTsVocvSkkXneAtMcWo": @"yFRZfBRFxLTQaVJkQAesmpZvVbMgDUgIKuWVNmffUcfZpqLcTojGAYdCigXvLgFjfcodxzoCmFtSeTuFogxzlmwBSNIZBJZDgjlrVFGkKtSaCMymXZIlXNZpZcBUscvVldorplCuWYjabqFhDZ",
		@"sAtENXUFfcATlbXtKdbe": @"pVDpxWwYbHSQrdrGYyXuWTzhOBalEfdyQvDlSmpcBNasKBcftvpHiDtvMjCeUZPlorRsZRhJnnsunDdKQYwkIxBHfdYBcuGFQPMYzpMJVMXLelHLLLx",
		@"ALLiKQfuLvwJw": @"bscJnYgkmNNxUrpZfvSfLWRMqvRPhlEdbPuJLWokJODPItCgKFxWbUIpKiquppJFtdAjXPdqOnLnHFxqCLptFmmalnvaFzdJhdTNhheMZmuzH",
		@"LZBCyYpheFrGLLyNOy": @"vnISVJdhLGIEwzQBvXFnWWucCxBrPyKVVNOhhvjDKNjdGhMDrwNxMlQgUjbadVgeRXxUPjbKidCvExDseHBgEgUcvyDDadRPOTKLbJuuWwtDeAqjfQzOiPmhseQJYRZjpyeEZJqNzH",
		@"VnUovDKHRkWyMxSdNI": @"yQxCAYmBuUUbzghUcqjMUQzpoqDKGuYwaeqSvSaejguOmWddrEAoywlUFcGyhDVmdHKSvXCoVpjHHEAWtKLzfSGkeHubgbnuweokDrQqdop",
		@"aJVMWeqxribNAMVio": @"perYXGXzjFXphPLIuEgOpFGCjwqeHAHIbfcnvulLUJhHFGCxHGxgmoQGkGnaLWugwLHLtJucMmShGzdQsbYShKbELzhWTOQVDwSRCzTQZmXBybynFeyyNlTjOqD",
		@"yUgqNvuxhW": @"AFmfruEFkEyUenNYkxXqwkGpErORTnWwlfjWCVwTJKXcVSeHKcecaWHHubFTaHFPAZDueIouIISjCSIScTXgWWMvFvWvnwtFmTdSnZcsPjDnPJlXIlTPxiIciVivInFQM",
		@"DVTtgulatEwsc": @"VdIHkxnMkxShqukwDrJECqSYMoCpodtvfczDeBPTuIfiPSMKNNktDIYTdfRygxxCZYSLAicuORyeCUbRTxDYgArpOpdqrQZEUrDzNHKOqzGfFvfrhzgP",
		@"ovIMSGBkVbijgesQ": @"diKeaZCymdoYQMemKALcWduntkOpamutDSHJHuMbuGJwXfQdylosvszgebZlAchynoZszIGYnKdOxjHbXRFIXGDNdSvUGCehHCXrxCFBJALWKKrGT",
		@"kettFdnJdaZlLRKZlC": @"PtvXJvoNaSlochHsDFHnZQrdHeDfKzHCuDPvsyvAMvyzRhbcdYtxQcYIzdCQkxCtKbOrMMCuToEjMvTFErWDBVfjfWGhjNYxhrwMBhfMWaIYSXkpYqWvuFFvlfdi",
		@"LDLdHLbPSjV": @"TQKMWarvqiAdjgpbJxReblWUgbgyIVMhrYaPxAjfKTEgqNhJBWCQygdHfQiDxllFFUDLVnvfuFyfwgtALaykYidJCFKgLUQCUDAfDlqDIrxnhQSeRsSdwHEogHrcF",
	};
	return eoXOPkWCVsImUx;
}

- (nonnull NSDictionary *)xWKZxLBWoSJmTsBPBpsqV :(nonnull NSArray *)PFvnUmHepZGTSGjSFl :(nonnull NSArray *)odIwTKZWGNS :(nonnull UIImage *)DsAwfrrIHsoa {
	NSDictionary *hdKYanxfCmzVJZLZWA = @{
		@"VXgUifvRTrfDXvbIRfiQ": @"TVVVWzmcnvqpObYWjzYRKtDFXllMPovxbzijfDokBTjdQYDMERYrjIapIiFbtVfeFYhsqVFeZJrovEShQJtQyPCsuuRqYoYeTyRAPLqu",
		@"FeqCxhVBVifwkyRM": @"mEuwFjOONzrBnakKLyhItUuaXLuzwLckkXIpPYXSqUkTHWfnwQLCyunVFWgmbLTYYjvCiSqOnYgLuPwMdRoJiVCIFdPnOllbHhVqOBGBnfRee",
		@"fjCEJkqEYlwMjfMnz": @"oOkuEdFdnoWIAJBjjJgLkMHkGukXTNQlzkzdUvwmlOhfQtdpWKoepPplFFJxobgtkXpGLucZOFBDDnKGBzjunQqAzXegdPmjKqApCCEcaCeGcuHQFMeZJhFbcxrHgkujYBXxnPAdiiQWK",
		@"CyZvLxogfcNoiJNrE": @"rEnZtFTmvZlwWPWKzTNhjZsKRAdhiLRxOnnRJALekEeautjHsyhDLeBarczwkiXWUoztexrkdqRJaETOqrsaGPKhesrWENGtiJPhvWfhGCstDoGXiqBaUFyJKFFpHBRIhDgpGLrfGbLy",
		@"kmnvvDcmfGLIEHCLlpPX": @"KVPeIoRHNASnoandiWltiQtCczquSStCClaiWHVvLgcXtmtzUpSKUmivLWchLshgSsxrxkSvSXyIWKnetVzcPBMlqdwmmWUNitaLZDxMKcXFhjb",
		@"CtuptFNmHvttSooyUt": @"uiLpLqixukSTWlTSlvUUpzilYIuuGmvYRYXBXFrmTzkAyTpLOnSrLptxQHMWBZfIuacPMXXcnrxsUzgTRZPqENsBoRVvjdhfmFHsqwXUZmmxtfxbrfROOAIFjbFoAgyWZGGWtdDQoOtErBLlxGE",
		@"MoTjeHDlAoVqqcIscXwWkL": @"NNRanWCvypGtqrZWzCajuvIxZNsiJYTbZMtqNEOMwCUHNKCHfoxBQzRSzrDiHbWhhIZjcwrrasSeuIjuhLSfzyGzWFXzfvoBwYLBRGkcByhwOmllcWbiUNjXDXTFVlbY",
		@"YyasQxqZtAkXN": @"IrxXsrzvvQAPWorEBtKbXWYVfAJkXFKOMGWsGipEQnGFtzfgMnJrSGXvgWYrFIncXpcgHMnHzFWYZiqGMKVNPFcbwnnBzkLtJCADMlGhxuTZnCsAXhyGFUXwPKBMsDPGea",
		@"YhJyAVuPoYAlBAvrdSLyn": @"GgmgCLTAfkPBCpIhghCKcWolimTJhZHHxagyNZETnGHeYRIzsYkMWNyPIkvWQmcSBCsKHiOJPkqeJqyabygHGrhoIISVnDGMwulwCWJxVJmyQfBcsvpvoZRPeHTBqQJFGpzzeBFmDEzXjXDKJIT",
		@"WCFbUrnnCZMPEFcUXxkG": @"hsqfrcazvxZadRvnGsPquxZvAgYQKVgRmEwZdcPRRLnyLuIKxmTDvWeevOkWjcWcDTyKdkIKiKquBNpdUALFHGYYsoAvePrqmRhsPPTEOGqzarHIJntIOQgvGvzVLatFcescJiNwPbaVmaFeac",
	};
	return hdKYanxfCmzVJZLZWA;
}

-(void)dealloc
{
    
    [data release];
    [super dealloc];
}


-(id<BLparserdelegate>)delegate
{
    return delegate;
}

-(void)setDelegate:(id<BLparserdelegate>)_delegate
{
    delegate=_delegate;
    handler_func.startfunc=NULL;
    handler_func.endfunc=NULL;
    handler_func.elefunc=NULL;
    handler_func.eleendfunc=NULL;
    handler_func.strfunc=NULL;
    handler_func.commentfunc=NULL;
    handler_func.cdatafunc=NULL;
    handler_func.processfunc=NULL;
    handler_func.errorfunc=NULL;
    if(!delegate)
    {
        return;
    }
    if([delegate respondsToSelector:@selector(BLparserDidStartDocument:)])
    {
        handler_func.startfunc=startfunc;
    }
    if([delegate respondsToSelector:@selector(BLparserDidEndDocument:)])
    {
        handler_func.endfunc=endfunc;
    }
    if([delegate respondsToSelector:@selector(BLparser:didStartElement:attributes:)])
    {
        handler_func.elefunc=elefunc;
    }
    if([delegate respondsToSelector:@selector(BLparser:didEndElement:)])
    {
        handler_func.eleendfunc=eleendfunc;
    }
    if([delegate respondsToSelector:@selector(BLparser:foundCharacters:)])
    {
        handler_func.strfunc=strfunc;
    }
    if([delegate respondsToSelector:@selector(BLparser:foundComment:)])
    {
        handler_func.commentfunc=commentfunc;
    }
    if([delegate respondsToSelector:@selector(BLparser:foundCDATA:)])
    {
        handler_func.cdatafunc=cdatafunc;
    }
    if([delegate respondsToSelector:@selector(BLparser:foundProcessingInstructionWithTarget:data:)])
    {
        handler_func.processfunc=processfunc;
    }
    if([delegate respondsToSelector:@selector(BLparser:parseErrorOccurred:)])
    {
        handler_func.errorfunc=errorfunc;
    }
}

-(BOOL)parse
{
    return NO;
}


-(void)stopparse
{

}

- (id)initWithData:(NSData *)data
{
    return nil;
}
-(id)initWithData:(NSData*)data encoding:(NSStringEncoding)encoding
{

    return nil;
}

- (NSError *)parserError
{
    return nil;
}






- (NSString *)publicID
{
    return nil;
}
- (NSString *)systemID
{
    return nil;
}
- (NSInteger)lineNumber
{
    return 0;
}
- (NSInteger)columnNumber
{
    return 0;
}
@end
