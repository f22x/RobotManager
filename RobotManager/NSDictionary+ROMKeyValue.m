

#import "NSDictionary+ROMKeyValue.h"

@implementation NSMutableDictionary (ROMKeyValue)

- (void)ROM_setSafeObject:(id)obj forKey:(NSString *)key {
    if (obj == nil || key == nil)
        return;
    [self setObject:obj forKey:key];
}

- (void)ROM_setObject:(id)obj forKey:(NSString*)key {
    if (!obj)
    {
        [self removeObjectForKey:key];
        return;
    }
    [self setObject:obj forKey:key];
}

@end

@implementation NSDictionary (ROMKeyValue)

- (NSDictionary *)ROM_safeDictionaryForKey:(id)aKey {
    id str = [self objectForKey:aKey];
    if (str && [str isKindOfClass:[NSDictionary class]]) {
        return str;
    } else {
        return nil;
    }
}

- (NSNumber *)ROM_safeNumberForKey:(id)aKey {
    id str = [self objectForKey:aKey];
    if (str && [str isKindOfClass:[NSString class]]) {
        return [[[NSNumberFormatter alloc] init] numberFromString:str];
    }
    if (str && [str isKindOfClass:[NSNumber class]]) {
        return str;
    }
    return @0;
}

- (NSString *)ROM_safeStringForKey:(id)aKey {
    id str = [self objectForKey:aKey];
    if (str && [str isKindOfClass:[NSString class]]) {
        return str;
    } else if ([str respondsToSelector:@selector(stringValue)]){
        return [str stringValue];
    }
    return @"";
}

- (int)ROM_safeIntForKey:(id)aKey {
    id str = [self objectForKey:aKey];
    if ([str respondsToSelector:@selector(intValue)]){
        return [str intValue];
    }
    return -1;
}

- (NSString *)ROM_JSONString {
    if ([NSJSONSerialization isValidJSONObject:self])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return nil;
        }
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSData *)ROM_JSONData {
    if ([NSJSONSerialization isValidJSONObject:self])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return nil;
        }
        return jsonData;
    }
    return nil;
}
@end

@implementation NSArray (ROMKeyValue)

- (NSString *)ROM_JSONString {
    if ([NSJSONSerialization isValidJSONObject:self])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return nil;
        }
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSData *)ROM_JSONData {
    if ([NSJSONSerialization isValidJSONObject:self])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return nil;
        }
        return jsonData;
    }
    return nil;
}

@end