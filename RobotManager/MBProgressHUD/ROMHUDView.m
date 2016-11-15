//
//  ROMHUDView.m
//  
//
//  Created by iMac15 on 16/1/14.
//  Copyright © 2016年 . All rights reserved.
//

#import "ROMHUDView.h"
#import "ROMButton.h"
#import "ROMLoadingView.h"

@interface ROMHUDView ()

@property (nonatomic, strong) ROMLoadingView *loadView;

@end

@implementation ROMHUDView

+ (ROMHUDView *)sharedHUD {
    static ROMHUDView *hud = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        hud = [[ROMHUDView alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
    });
    return hud;
}

+ (void)showMessage:(NSString *)text dText:(NSString *)str {
    [[ROMHUDView sharedHUD] hideWithOutAni];
    
    MBProgressHUD *hud = [ROMHUDView configureHUD];
    hud.customView = [[ROMLoadingView alloc] initWithInfo:text text:str];
    [hud hide:YES afterDelay:1];

}



- (void)hide {
    if(self.loadView) {
        [self.loadView stopAnimation];
    }
    [self hide:YES];
}

- (void)hideWithOutAni {
    
    if(self.loadView) {
        [self.loadView stopAnimation];
    }
    [self hide:NO];
}

- (void)show {
    if(self.loadView) {
        [self.loadView  startAnimation];
    }
    [self show:YES];
}

+ (void)showTitle:(NSString *)title {

    ROMHUDView *hud = [ROMHUDView sharedHUD];
    [hud hide:NO];
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [view addSubview:hud];
    hud.color = [UIColor clearColor];
    hud.loadView = [[ROMLoadingView alloc] initWithTitleLabel:title];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.customView = hud.loadView;
    hud.dimBackground = YES;
    hud.margin = 0;
    [hud show];
}

+ (void)showTitleAutoHide:(NSString *)message {
    ROMHUDView *hud = [ROMHUDView sharedHUD];
    [hud hide:NO];
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [view addSubview:hud];
    hud.color = [UIColor clearColor];
    hud.loadView = [[ROMLoadingView alloc] initWithTitleLabel:message];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.customView = hud.loadView;
    hud.dimBackground = YES;
    hud.margin = 0;
    [hud show];
    [hud hide:YES afterDelay:1];
}


+ (void)showLoadingMessage:(NSString *)title {
    
    [[ROMHUDView sharedHUD] hideWithOutAni];
    ROMHUDView *hud = [ROMHUDView sharedHUD];
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [view addSubview:hud];
    
    hud.color = [UIColor clearColor];
    hud.loadView = [[ROMLoadingView alloc] initWithLoading:title];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.customView = hud.loadView;
    hud.dimBackground = YES;
    hud.margin = 0;
    
    [hud show];
}

+ (void)showPayWithMoney:(NSString *)money andWithTypeArry:(NSArray *)arry selectPayBlock:(void(^)(ROMPayType type))payBlock {
    
    [[ROMHUDView sharedHUD] hideWithOutAni];
    ROMHUDView *hud = [ROMHUDView sharedHUD];
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [view addSubview:hud];
    
    hud.color = [UIColor clearColor];
    hud.loadView = [[ROMLoadingView alloc] initWithPayViewMoney:money andWithTypeArry:arry selectPayBlock:payBlock];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.customView = hud.loadView;
    hud.dimBackground = YES;
    hud.margin = 0;
    
    [hud show];
    
}

+ (void)showScoreWithcancelButtonTitle:(NSString *)cancelButtonTitle confirmButtonTitle:( NSString*)confirmButtonTitle   ontherButtonTitle:( NSString*)ontherButtonTitle   imageName:(NSString *)imageName selectPayBlock:(void(^)(ROMScoreType type))block{
    [[ROMHUDView sharedHUD] hideWithOutAni];
    ROMHUDView *hud = [ROMHUDView sharedHUD];
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [view addSubview:hud];
    
    hud.color = [UIColor clearColor];
    ROMScoreView *score = [[ROMScoreView alloc] initWithcancelButtonTitle:cancelButtonTitle confirmButtonTitle:confirmButtonTitle ontherButtonTitle:ontherButtonTitle imageName:imageName selectPayBlock:block];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.customView = score;
    hud.dimBackground = YES;
    hud.margin = 0;
    
    [hud show];
}
#pragma mark 显示错误信息
+ (void)showError:(NSString *)error {
   [[ROMHUDView sharedHUD] hideWithOutAni];
    MBProgressHUD *hud = [ROMHUDView configureHUD];
    hud.yOffset = -20;
    hud.customView = [[ROMLoadingView alloc] initWithError:error];
    [hud hide:YES afterDelay:1];
}

#pragma mark 

+ (void )showMessage:(NSString *)message {
    [[ROMHUDView sharedHUD] hideWithOutAni];
    MBProgressHUD *hud = [ROMHUDView configureHUD];
    hud.customView = [[ROMLoadingView alloc] initWithInfo:message text:nil];
    hud.dimBackground = NO;
    [hud hide:YES afterDelay:1];
}

+ (MBProgressHUD *)configureHUD {
    
    UIView *view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.color = [UIColor clearColor];
    
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;

    hud.dimBackground = YES;
    hud.margin = 0;
    return hud;
}

@end
