

#import <Foundation/Foundation.h>

@interface NSString (ROMKeyValue)

- (BOOL)isNotEmptyString;
- (BOOL)isFirstIsA_Z;
- (int)numberOfCLines;
- (NSString *)stringByURLEncoding;
- (NSString *)stringByURLDecoding;
- (NSString *)stringByMD5;

- (NSMutableAttributedString *)atAttributeStringWithAttributes:(NSDictionary *)attr atDic:(NSDictionary *)atDic;

- (NSMutableDictionary *)dictionaryFromQueryComponents;

- (NSDictionary *)dictionaryWithJsonString;

+ (NSString *)stringWithLongInt:(long)longInt;

- (NSString *)shortNickNameCustom:(NSUInteger)length;

@end
