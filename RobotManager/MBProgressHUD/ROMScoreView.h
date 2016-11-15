//
//  ROMScoreView.h
//  
//
//  Created by wangxiaofeng on 16/6/17.
//  Copyright © 2016年 . All rights reserved.
//
typedef NS_ENUM(NSUInteger, ROMScoreType) {
    ROMScoreTypeCancel = 0,
    ROMScoreTypeConfirm = 1,
    ROMScoreTypeOnther = 2
};

typedef void(^ROMScoreViewBlock)(ROMScoreType type);
#import <UIKit/UIKit.h>

@interface ROMScoreView : UIView
@property (nonatomic, strong) ROMScoreViewBlock block;
- (instancetype)initWithcancelButtonTitle:(NSString *)cancelButtonTitle confirmButtonTitle:( NSString*)confirmButtonTitle   ontherButtonTitle:( NSString*)ontherButtonTitle   imageName:(NSString *)imageName selectPayBlock:(void(^)(ROMScoreType type))block;
@end
