

#import "ROMEmojiKeyboardView.h"
#import "UIView+ROMIQKeyboardToolBar.h"

@interface AGEmojiKeyboardView ()
@property (nonatomic) UISegmentedControl *segmentsBar;
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSDictionary *emojis;
@property (nonatomic) NSMutableArray *pageViews;
@property (nonatomic) NSString *category;
@end

@interface ROMEmojiKeyboardView ()<AGEmojiKeyboardViewDataSource, AGEmojiKeyboardViewDelegate>
@property (nonatomic, weak) UITextView *inputView ;

@property (nonatomic, assign) BOOL needToolBar;
@end

@implementation ROMEmojiKeyboardView

- (instancetype)initWithInputView:(UITextView *)inputView {
    return [self initWithInputView:inputView needToolBar:YES];
}

- (instancetype)initWithInputView:(UITextView *)inputView needToolBar:(BOOL)needToolBar {
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    self = [super initWithFrame:CGRectMake(0, 0, w, 220) dataSource:self];
    
    self.needToolBar = needToolBar;
    self.inputView = inputView;
    
    if (needToolBar) {
        [inputView addEmojiDoneOnKeyboardWithTarget:self emojiAction:@selector(changeKeyBoardAndEmoji) doneAction:@selector(finishInput) titleText:@"完成" isEmojiShow:NO];
    }
    
    self.delegate = self;    
    self.segmentsBar.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), 53);
    self.segmentsBar.tintColor = [UIColor colorWithRed:111/255.0 green:115/255.0 blue:117/255.0 alpha:1];
    [self.segmentsBar setDividerImage:[UIImage imageNamed:@"emoji_lower_Line_spacing"]
                  forLeftSegmentState:UIControlStateNormal
                    rightSegmentState:UIControlStateNormal
                           barMetrics:UIBarMetricsDefault];
    [self.segmentsBar setDividerImage:[UIImage imageNamed:@"emoji_lower_Line_spacing"]
                  forLeftSegmentState:UIControlStateNormal
                    rightSegmentState:UIControlStateSelected
                           barMetrics:UIBarMetricsDefault];
    [self.segmentsBar setDividerImage:[UIImage imageNamed:@"emoji_lower_Line_spacing"]
                  forLeftSegmentState:UIControlStateSelected
                    rightSegmentState:UIControlStateNormal
                           barMetrics:UIBarMetricsDefault];
    [self.segmentsBar setBackgroundImage:[UIImage imageNamed:@"emoji_lower_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.segmentsBar setBackgroundImage:[UIImage imageNamed:@"emoji_touming"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    return self;
}

- (void)finishInput {
    [self.inputView resignFirstResponder];
}

- (void)changeKeyBoardAndEmoji {
    if (self.inputView.inputView == self) {
        if (self.needToolBar) {
            
            [self.inputView addEmojiDoneOnKeyboardWithTarget:self emojiAction:@selector(changeKeyBoardAndEmoji) doneAction:@selector(finishInput) titleText:@"完成" isEmojiShow:NO];
        }
        self.inputView.inputView = nil ;
        UITextRange *begin = self.inputView.selectedTextRange;
        [self.inputView resignFirstResponder];
        [self.inputView becomeFirstResponder];
        self.inputView.selectedTextRange = begin;
    } else {
        if (self.needToolBar) {
            [self.inputView addEmojiDoneOnKeyboardWithTarget:self emojiAction:@selector(changeKeyBoardAndEmoji) doneAction:@selector(finishInput) titleText:@"完成" isEmojiShow:YES];
        }
        self.inputView.inputView = self ;
        UITextRange *begin = self.inputView.selectedTextRange;
        [self.inputView resignFirstResponder];
        [self.inputView becomeFirstResponder];
        self.inputView.selectedTextRange = begin;
    }
}

#pragma mark - AGEmojiKeyboardViewDataSource
- (UIImage *)emojiKeyboardView:(AGEmojiKeyboardView *)emojiKeyboardView
   imageForNonSelectedCategory:(AGEmojiKeyboardViewCategoryImage)category {
    switch (category) {
        case AGEmojiKeyboardViewCategoryImageRecent:
            return [UIImage imageNamed:@"recent_n"];
            break;
        case AGEmojiKeyboardViewCategoryImageFace:
            return [UIImage imageNamed:@"face_n"];
            break;
        case AGEmojiKeyboardViewCategoryImageBell:
            return [UIImage imageNamed:@"bell_n"];
            break;
        case AGEmojiKeyboardViewCategoryImageCar:
            return [UIImage imageNamed:@"car_n"];
            break;
        case AGEmojiKeyboardViewCategoryImageCharacters:
            return [UIImage imageNamed:@"characters_n"];
            break;
        case AGEmojiKeyboardViewCategoryImageFlower:
            return [UIImage imageNamed:@"flower_n"];
            break;
        default:
            break;
    }
    return nil;
}

- (UIImage *)emojiKeyboardView:(AGEmojiKeyboardView *)emojiKeyboardView
      imageForSelectedCategory:(AGEmojiKeyboardViewCategoryImage)category {
    switch (category) {
        case AGEmojiKeyboardViewCategoryImageRecent:
            return [UIImage imageNamed:@"recent_s"];
            break;
        case AGEmojiKeyboardViewCategoryImageFace:
            return [UIImage imageNamed:@"face_s"];
            break;
        case AGEmojiKeyboardViewCategoryImageBell:
            return [UIImage imageNamed:@"bell_s"];
            break;
        case AGEmojiKeyboardViewCategoryImageCar:
            return [UIImage imageNamed:@"car_s"];
            break;
        case AGEmojiKeyboardViewCategoryImageCharacters:
            return [UIImage imageNamed:@"characters_s"];
            break;
        case AGEmojiKeyboardViewCategoryImageFlower:
            return [UIImage imageNamed:@"flower_s"];
            break;
        default:
            break;
    }
    return nil;
}

- (UIImage *)backSpaceButtonImageForEmojiKeyboardView:(AGEmojiKeyboardView *)emojiKeyboardView {
    return [UIImage imageNamed:@"backspace_n"];
}

#pragma mark - AGEmojiKeyboardViewDelegat
- (void)emojiKeyBoardView:(AGEmojiKeyboardView *)emojiKeyBoardView
              didUseEmoji:(NSString *)emoji {
    [self.inputView replaceRange:self.inputView.selectedTextRange withText:emoji];
}

- (void)emojiKeyBoardViewDidPressBackSpace:(AGEmojiKeyboardView *)emojiKeyBoardView {
    [self.inputView deleteBackward];
}

- (AGEmojiKeyboardViewCategoryImage)defaultCategoryForEmojiKeyboardView:(AGEmojiKeyboardView *)emojiKeyboardView {
    return AGEmojiKeyboardViewCategoryImageFace;
}

@end
