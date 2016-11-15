

#import "UIView+ROMIQKeyboardToolBar.h"
#import "KeyboardManager.h"

@implementation UIView (ROMIQKeyboardToolBar)

- (void)addEmojiDoneOnKeyboardWithTarget:(id)target emojiAction:(SEL)emojiAction doneAction:(SEL)doneAction titleText:(NSString*)titleText isEmojiShow:(BOOL)isEmojiShow
{
    //  If can't set InputAccessoryView. Then return
    if (![self respondsToSelector:@selector(setInputAccessoryView:)])    return;
    
    //  Creating a toolBar for keyboard
    IQToolbar *toolbar = [[IQToolbar alloc] init];
    toolbar.tintColor = [UIColor colorWithIntgerRed:114 green:99 blue:254 alpha:1];
    if ([self respondsToSelector:@selector(keyboardAppearance)])
    {
        switch ([(UITextField*)self keyboardAppearance])
        {
            case UIKeyboardAppearanceAlert: toolbar.barStyle = UIBarStyleBlack;     break;
            default:                        toolbar.barStyle = UIBarStyleDefault;   break;
        }
    }
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    //  Create a cancel button to show on keyboard to resign it. Adding a selector to resign it.

    UIImage *img = [UIImage imageNamed:@"release_input_expression"];
    if (isEmojiShow) {
        img = [UIImage imageNamed:@"release_input_keyboard"];
    }
    IQBarButtonItem *emojiButton = [[IQBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:target action:emojiAction];
    
    [items addObject:emojiButton];
    
    //  Create a fake button to maintain flexibleSpace between doneButton and nilButton. (Actually it moves done button to right side.
    IQBarButtonItem *nilButton =[[IQBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [items addObject:nilButton];
    
    //  Create a done button to show on keyboard to resign it. Adding a selector to resign it.
    IQBarButtonItem *doneButton =[[IQBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"keyboard_done"] style:UIBarButtonItemStylePlain target:target action:doneAction];
    
    [items addObject:doneButton];
    
    //  Adding button to toolBar.
    [toolbar setItems:items];
    
    //  Setting toolbar to keyboard.
    [(UITextField*)self setInputAccessoryView:toolbar];
}

@end
