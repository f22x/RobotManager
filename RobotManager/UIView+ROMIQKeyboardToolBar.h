

#import <UIKit/UIKit.h>

@interface UIView (ROMIQKeyboardToolBar)

- (void)addEmojiDoneOnKeyboardWithTarget:(id)target emojiAction:(SEL)emojiAction doneAction:(SEL)doneAction titleText:(NSString*)titleText isEmojiShow:(BOOL)isEmojiShow;

@end
