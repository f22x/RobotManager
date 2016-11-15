//
//  ROMHUDView.h
//  
//
//  Created by iMac15 on 16/1/14.
//  Copyright © 2016年 . All rights reserved.
//

#import "MBProgressHUD.h"
#import "ROMLoadingView.h"
#import "ROMScoreView.h"
@interface ROMHUDView : MBProgressHUD

+ (ROMHUDView *)sharedHUD;

+ (void)showMessage:(NSString *)text dText:(NSString *)str;
+ (void)showError:(NSString *)error;
+ (void)showMessage:(NSString *)message;
+ (void)showLoadingMessage:(NSString *)title;
+ (void)showTitle:(NSString *)title;
+ (void)showTitleAutoHide:(NSString *)message;

+ (void)showPayWithMoney:(NSString *)money andWithTypeArry:(NSArray *)arry selectPayBlock:(void(^)(ROMPayType type))payBlock;
+ (void)showScoreWithcancelButtonTitle:(NSString *)cancelButtonTitle confirmButtonTitle:( NSString*)confirmButtonTitle   ontherButtonTitle:( NSString*)ontherButtonTitle   imageName:(NSString *)imageName selectPayBlock:(void(^)(ROMScoreType type))block;
- (void)show;
- (void)hide;
- (void)hideWithOutAni;

@end
