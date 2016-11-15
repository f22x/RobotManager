
#import "AGEmojiKeyBoardView.h"
#import "ROMTextField.h"

@interface ROMEmojiKeyboardView : AGEmojiKeyboardView

- (instancetype)initWithInputView:(id<UITextInput>)inputView needToolBar:(BOOL)needToolBar;

- (instancetype)initWithInputView:(id<UITextInput>)inputView;

- (void)changeKeyBoardAndEmoji;

@end
