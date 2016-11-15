

#import "ROMChatInputBar.h"
#import "ROMButton.h"
#import "KeyboardManager.h"
#import "ROMEmojiKeyboardView.h"
#import "ROMChatSelectFunctionView.h"

@interface ROMChatInputBar () <UITextFieldDelegate>

@property (nonatomic, copy) ROMSendChatMessage block;

@property (nonatomic, strong) ROMButton *faceBtn;
@property (nonatomic, strong) ROMButton *moreBtn;
@property (nonatomic, strong) ROMChatSelectFunctionView *functionView;
@property (nonatomic, strong) ROMEmojiKeyboardView *emojiKeyboard;
@property (nonatomic, assign) BOOL isEmojOn;

@end

@implementation ROMChatInputBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _isEmojOn = NO;
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_white_background"]]];

        _contentText = [[ROMTextField alloc] initWithFrame:CGRectMake(10, 7, frame.size.width - 46 * 2 - 10, 30)];
        _contentText.textAlignment = NSTextAlignmentLeft;
        _contentText.font = [UIFont systemFontOfSize:14];
        _contentText.backgroundColor = [ROMConfig colorWith242];
        _contentText.returnKeyType = UIReturnKeySend;
        _contentText.delegate = self;
        _contentText.layer.cornerRadius = 4;
        [_contentText addTarget:self action:@selector(textFieldTaped) forControlEvents:UIControlEventTouchDown];
        [self addSubview:_contentText];
        
        UIImage *img = [UIImage imageNamed:@"release_input_expression"];
        _faceBtn = [[ROMButton alloc] initClearBtnWithFrame:CGRectMake(CGRectGetMaxX(_contentText.frame), 0, 46, 44)];
        [_faceBtn setImage:img forState:UIControlStateNormal];
        [self addSubview:_faceBtn];
        
        _contentText.inputAccessoryView = nil;
        
        _emojiKeyboard = [[ROMEmojiKeyboardView alloc] initWithInputView:(id)_contentText needToolBar:NO];
        [_faceBtn addTarget:self action:@selector(emojBtnClick) forControlEvents:UIControlEventTouchDown];
        
        _moreBtn = [[ROMButton alloc] initClearBtnWithFrame:CGRectMake(CGRectGetMaxX(_faceBtn.frame), 0, 46, 44)];
        [_moreBtn setImage:[UIImage imageNamed:@"tabbar_icon_add"] forState:UIControlStateNormal];
        [self addSubview:_moreBtn];
        [_moreBtn addTarget:self action:@selector(clickMoreBtn:) forControlEvents:UIControlEventTouchDown];
        
        __weak ROMChatInputBar *weakSelf = self;
        _functionView = [[ROMChatSelectFunctionView alloc] initWithInputView:(id)_contentText];
        _functionView.btnBlock = ^ (NSInteger tag) {
            switch (tag) {
                case 0:
                    if (weakSelf.block) {
                        weakSelf.block(nil, ROMChatTenSecondImage);
                    }
                    break;
                case 1:
                    if (weakSelf.block) {
                        weakSelf.block(nil, ROMChatCamera);
                    }
                    break;
                case 2:
                    if (weakSelf.block) {
                        weakSelf.block(nil, ROMChatImage);
                    }
                    break;
            }
        };
    }
    
    return self;
}

- (void)emojBtnClick {
    _isEmojOn = !_isEmojOn;
    if (_isEmojOn) {
        [_faceBtn setImage:[UIImage imageNamed:@"release_input_keyboard"] forState:UIControlStateNormal];
    } else {
        [_faceBtn setImage:[UIImage imageNamed:@"release_input_expression"] forState:UIControlStateNormal];
    }
    [_emojiKeyboard changeKeyBoardAndEmoji];
}

- (void)setSendChatMessageBlock:(ROMSendChatMessage)block {
    self.block = block;
}

- (void)sendChat {
    if (!(self.contentText.text.length > 0)) {
        return;
    }
    
    if ([self isBlankString:self.contentText.text]) {
        [self.contentText resignFirstResponder];
//        [ROMHUDView showError:@"不能发送空内容！"];
        self.contentText.text = @"";
        return;
    }

    if (self.block) {
        self.block(self.contentText.text, ROMChatText);
        [self.contentText setText:nil];
    }
}

- (BOOL)isBlankString:(NSString *)string{
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self sendChat];
    return YES;
}

- (void)clickMoreBtn:(UIButton *)sender {
    _isEmojOn = NO;
    [_faceBtn setImage:[UIImage imageNamed:@"release_input_expression"] forState:UIControlStateNormal];
    [_functionView showFunctionView];
}

- (void)textFieldTaped {
    if (_contentText.inputView) {
        _contentText.inputView = nil;
        _isEmojOn = NO;
        [_faceBtn setImage:[UIImage imageNamed:@"release_input_expression"] forState:UIControlStateNormal];
        [_contentText resignFirstResponder];
        [_contentText becomeFirstResponder];
    }
}

@end
