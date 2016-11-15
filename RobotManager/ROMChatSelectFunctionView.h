//
//  ROMChatSelectFunctionView.h
//  
//
//  Created by  on 15/7/20.
//  Copyright © 2015年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ROMChatSelectFunctionView : UIView

@property (nonnull, nonatomic, copy) ROMIntegerBlock btnBlock;

- (nonnull instancetype)initWithInputView:(UITextView *__nonnull)inputView;
- (void)showFunctionView;

@end
