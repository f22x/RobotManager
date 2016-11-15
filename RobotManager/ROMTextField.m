

#import "ROMTextField.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+ROMUnity.h"

@implementation ROMTextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.rigthInset = 0;
        [self setBackgroundColor:[UIColor colorWithIntgerRed:242 green:242 blue:242 alpha:1]];
    }
    return self;
}

//控制显示时文本所在位置，左右缩进10
- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect r = CGRectInset(bounds, 10, 0);
    r.size.width -= _rigthInset;
    return r;
}

//控制编辑文本时所在的位置，左右缩10
- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect r = CGRectInset(bounds, 10, 0);
    r.size.width -= _rigthInset;
    return r;
}

@end
