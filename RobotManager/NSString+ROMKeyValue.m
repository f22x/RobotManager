

#import "NSString+ROMKeyValue.h"
#import "NSDictionary+ROMKeyValue.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (ROMKeyValue)

- (BOOL)isNotEmptyString {
    if (!self) {
        return NO;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return NO;
    }
    return YES;
}

- (BOOL)isFirstIsA_Z {
    if ([self isNotEmptyString]) {
        if ([self characterAtIndex:0] >= 'A' && [self characterAtIndex:0] <= 'Z') {
            return YES;
        }
    }
    return NO;
}

- (int)numberOfCLines {
    int sum = 0;
    for (int i = 0 ; i < self.length; i++) {
        unichar char_s = [self characterAtIndex:i];
        if (char_s == '\n') {
            sum++;
        }
    }
    return sum;
}

- (NSString *)stringByURLEncoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,  (__bridge CFStringRef)self,  NULL,  (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
}

- (NSString *)stringByURLDecoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                 (__bridge CFStringRef)self,
                                                                                                 CFSTR(""),
                                                                                                 CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
}

- (NSString *)stringByMD5 {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr,(CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSMutableAttributedString *)atAttributeStringWithAttributes:(NSDictionary *)attr atDic:(NSDictionary *)atDic {
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self attributes:attr];
    
    for (NSString *key in [atDic allKeys]) {
        NSString *findKey = [NSString stringWithFormat:@"@%@",key];
        NSNumber *uid = [atDic ROM_safeNumberForKey:key];
        NSRange range = [self rangeOfString:findKey];
        while (range.length > 0) {
            NSString *result = [NSString stringWithFormat:@"://user/profile?nickname=%@&uid=%@",[[self substringWithRange:range] stringByURLEncoding], uid];
            [attrStr addAttribute:NSLinkAttributeName value:result range:range];
            range = [self rangeOfString:findKey options:NSLiteralSearch range:NSMakeRange(range.location + range.length, self.length - range.location - range.length)];
        }
    }
    return attrStr;
}

- (NSMutableDictionary *)dictionaryFromQueryComponents {
    NSMutableDictionary *queryComponents = [NSMutableDictionary dictionary];
    for(NSString *keyValuePairString in [self componentsSeparatedByString:@"&"])
    {
        NSArray *keyValuePairArray = [keyValuePairString componentsSeparatedByString:@"="];
        if ([keyValuePairArray count] < 2) continue; // Verify that there is at least one key, and at least one value.  Ignore extra = signs
        NSString *key = [[keyValuePairArray objectAtIndex:0] stringByURLDecoding];
        NSString *value = [[keyValuePairArray objectAtIndex:1] stringByURLDecoding];
//        NSMutableArray *results = [queryComponents objectForKey:key]; // URL spec says that multiple values are allowed per key
//        if(!results) // First object
//        {
//            results = [NSMutableArray arrayWithCapacity:1];
            [queryComponents setObject:value forKey:key];
//        }
//        [results addObject:value];
    }
    return queryComponents;
}

- (NSDictionary *)dictionaryWithJsonString {
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        return nil;
    }
    return dic;
}

+ (NSString *)stringWithLongInt:(long)longInt {
    if (longInt > 100000000) {//一亿
        double strNum = longInt / 100000000.0;
        return [NSString stringWithFormat:@"%.1lf亿+",strNum];
    }
    if (longInt > 10000) {//一万
        double strNum = longInt / 10000.0;
        return [NSString stringWithFormat:@"%.1lf万+",strNum];
    }
    return [NSString stringWithFormat:@"%ld",longInt];
}
- (NSString *)shortNickNameCustom:(NSUInteger)length {
    if ((![self isEqualToString:@""]) && [self isKindOfClass:[NSString class]]) {
        if (self.length > length) {
            return [[self substringWithRange:NSMakeRange(0,length)] stringByAppendingString:@"..."];
        } else {
            return self;
        }
    }
    return @"";
}

@end
