

#import <UIKit/UIKit.h>

@interface ROMTextField : UITextField <UITextFieldDelegate>

@property (nonatomic, assign) double rigthInset;
- (instancetype)initWithFrame:(CGRect)frame;

@end
