//
//  ROMLoadingView.h
//  
//
//  Created by 22 on 16/1/17.
//  Copyright © 2016年 . All rights reserved.
//
typedef NS_ENUM(NSUInteger, ROMPayType) {
    ROMPayTypeWeixi = 0,
};


#import <UIKit/UIKit.h>
typedef void(^ROMHUDViewPayBlock)(ROMPayType type);

typedef void(^ROMHUDViewTapedBlock)();
@interface ROMLoadingView : UIView  

@property (nonatomic, strong) NSArray *typeArry;
@property (nonatomic, strong) ROMHUDViewTapedBlock block;
@property (nonatomic, strong) ROMHUDViewPayBlock payBlock;
- (instancetype)initWithLoading:(NSString *)title;
- (instancetype)initWithInfo:(NSString *)title text:(NSString *)text;
- (instancetype)initWithError:(NSString *)title;
- (instancetype)initWithTitleLabel:(NSString *)title;
- (instancetype)initWithPayViewMoney:(NSString *)money  andWithTypeArry:(NSArray *)arry selectPayBlock:(void(^)(ROMPayType type))payBlock;


- (void)startAnimation;
- (void)stopAnimation;

@end
