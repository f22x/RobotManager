

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (ROMKeyValue)

/*!
 *  向当前字典中添加非空键值对
 *
 *  @param obj 需要设置的对象
 *  @param key 需要设置的键值
 */
- (void)ROM_setSafeObject:(id)obj forKey:(NSString *)key;

/*!
 *  向当前字典中添加键值对，如果要添加的指定对象为空，则删除其在当前字典中的key和value。
 *
 *  @param obj 需要设置的对象
 *  @param key 需要设置的键值
 */
- (void)ROM_setObject:(id)obj forKey:(NSString*)key;

@end

@interface NSDictionary (ROMKeyValue)

- (NSDictionary *)ROM_safeDictionaryForKey:(id)aKey;
- (NSNumber *)ROM_safeNumberForKey:(id)aKey;
- (NSString *)ROM_safeStringForKey:(id)aKey;
- (int)ROM_safeIntForKey:(id)aKey;
- (NSString *)ROM_JSONString;
- (NSData *)ROM_JSONData;

@end

@interface NSArray (ROMKeyValue)

- (NSString *)ROM_JSONString;
- (NSData *)ROM_JSONData;

@end