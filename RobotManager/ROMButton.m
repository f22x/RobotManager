
#import "ROMButton.h"
#import "UIColor+ROMUnity.h"
#import "ROMConfig.h"

@interface ROMButton ()

@property (nonatomic, assign) BOOL isImageRight;

@end

@implementation ROMButton

- (instancetype)initClearBtnWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.veticalForImageAndTitle = NO;
        self.fontColor = [ROMConfig fontColor146];
        self.verticalSpace = 8;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    UIEdgeInsets ed = {2.0f, 2.0f, 2.0f, 2.0f};
    self.edge = ed;
    [self setButtonImage:@"common_btn_white" highlighted:@"common_btn_white_highlighted" type:ROMButtonImage_stretch];
    self.fontColor = [ROMConfig backgroundColor_purple];
    self.fontSize = _ROM_FontSize_large;
    self.verticalSpace = 8;
    return self;
}

- (void)setButtonImage:(NSString *)normalImage highlighted:(NSString *)highImage type:(ROMButtonImageType)type {
    if (type == ROMButtonImage_normal) {
        [self setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
        [self setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateSelected];
    } else {
        UIEdgeInsets uiEdge = self.edge;
        [self setBackgroundImage:[[UIImage imageNamed:normalImage] resizableImageWithCapInsets:uiEdge] forState:UIControlStateNormal];
        [self setBackgroundImage:[[UIImage imageNamed:highImage] resizableImageWithCapInsets:uiEdge] forState:UIControlStateHighlighted];
        [self setBackgroundImage:[[UIImage imageNamed:highImage] resizableImageWithCapInsets:uiEdge] forState:UIControlStateSelected];
    }
}

- (void)setFontColor:(UIColor *)fontColor {
    _fontColor = fontColor;
    [self setTitleColor:fontColor forState:UIControlStateNormal];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    if (UIEdgeInsetsEqualToEdgeInsets(self.titleEdgeInsets, UIEdgeInsetsZero)) {
        self.titleEdgeInsets = UIEdgeInsetsMake(1, 1, 0, 0);
    }
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setCornerRadiusOn {
    [self.layer setMasksToBounds:YES];
    self.layer.cornerRadius = 3;
}

- (void)setIsBoldText:(BOOL)isBoldText {
    if (isBoldText) {
        self.titleLabel.font = [UIFont boldSystemFontOfSize:self.fontSize];
    } else {
        self.titleLabel.font = [UIFont systemFontOfSize:self.fontSize];
    }
    _isBoldText = isBoldText;
}

- (void)setFontSize:(CGFloat)fontSize {
    if (self.isBoldText) {
        self.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    } else {
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
    _fontSize = fontSize;
}

- (void)setFeedIconHaveSpacing:(BOOL)haveSpacing {
    [self.layer setMasksToBounds:YES];
    self.layer.cornerRadius = 2;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [ROMConfig boardcolor_grey200].CGColor;
    [self setFontSize:_ROM_FontSize_little];
    [self setFontColor:[ROMConfig fontColor93]];
    
    if (haveSpacing) {
        CGFloat spacing = 4;
        [self setSpacing:spacing leftLayout:NO];
    }
}

- (void)setBangPointIcon {
    [self.layer setMasksToBounds:YES];
    self.layer.cornerRadius = 2;
    self.layer.borderWidth = SINGLE_LINE_WIDTH;
    self.layer.borderColor = [ROMConfig boardcolor_grey230].CGColor;
    [self setFontSize:_ROM_FontSize_middle];
    [self setFontColor:[ROMConfig fontColor93]];
}

- (void)setFeedPointIcon {
    [self.layer setMasksToBounds:YES];
    self.layer.cornerRadius = 2;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [ROMConfig boardcolor_grey200].CGColor;
    [self setFontSize:_ROM_FontSize_middle];
    [self setFontColor:[ROMConfig fontColor93]];
    [self setSpacing:6 leftLayout:NO];
}

- (void)setGroupIconHaveSpaceing:(BOOL)haveSpacing {
    [self.layer setMasksToBounds:YES];
    [self setFontSize:_ROM_FontSize_small];
    [self setTitleColor:[ROMConfig fontColor93] forState:UIControlStateNormal];

    if (haveSpacing) {
        CGFloat spacing = 10;
        [self setSpacing:spacing leftLayout:NO];
    }
}

- (void)setCreateGroupIconHaveSpaceing:(BOOL)haveSpacing {
    [self.layer setMasksToBounds:YES];
    self.backgroundColor = [UIColor whiteColor];
    [self setFontSize:_ROM_FontSize_small];
    [self setFontColor:[ROMConfig fontColor51]];
    
    if (haveSpacing) {
        CGFloat spacing = 6;
        [self setSpacing:spacing leftLayout:NO];
    }
}

- (void)setFeedSmallIcon {
    [self setFontSize:_ROM_FontSize_little];
    [self setFontColor:[ROMConfig fontColor153]];
    CGFloat spacing = 4;
    [self setSpacing:spacing leftLayout:YES];
}

- (void)setHotIcon {
    [self setFontSize:_ROM_FontSize_medium];
    [self setFontColor:[UIColor blackColor]];
    CGFloat spacing = 4;
    [self setSpacing:spacing leftLayout:YES];
}

- (void)setEditHomeIcon {
    [self setFontSize:_ROM_FontSize_middle];
    [self setFontColor:[ROMConfig fontColor51]];
    CGFloat spacing = 10;
    [self setSpacing:spacing leftLayout:NO];
}

- (void)setTopTenTimeIcon {
    [self setFontSize:_ROM_FontSize_small];
    [self setFontColor:[UIColor whiteColor]];
    [self setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.4]];
    [self setCornerRadiusOn];
}

- (void)setProfileIcon {
    [self setFontColor:[UIColor whiteColor]];
    [self setFontSize:_ROM_FontSize_small];
    CGFloat spacing = 5;
    [self setSpacing:spacing leftLayout:NO];
}

- (void)setGroupFuncIcon {
    [self setFontColor:[UIColor blackColor]];
    [self setFontSize:_ROM_FontSize_small];
    self.veticalForImageAndTitle = YES;
}

- (void)setSpacing:(CGFloat)spacing leftLayout:(BOOL)isLeft {
    if (isLeft) {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
        self.titleEdgeInsets = UIEdgeInsetsMake(1, spacing, 0, 0);
    } else {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        self.imageEdgeInsets = UIEdgeInsetsMake(1, 0, 0, spacing);
        self.titleEdgeInsets = UIEdgeInsetsMake(1, spacing, 0, 0);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.veticalForImageAndTitle) {
        
        // Center image
        CGPoint center = self.imageView.center;
        center.x = self.frame.size.width/2;
        center.y = self.imageView.frame.size.height/2;
        self.imageView.center = center;
        
        // Center text
        [[self titleLabel] sizeToFit];
        CGRect newFrame = [self titleLabel].frame;
        newFrame.origin.x = 0;
        newFrame.origin.y = self.imageView.frame.size.height + self.verticalSpace;
        newFrame.size.width = self.frame.size.width;
        
        self.titleLabel.frame = newFrame;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    } else {
        if (_isImageRight) {
            CGRect imageFrame = self.imageView.frame;
            imageFrame.origin.x = self.bounds.size.width - imageFrame.size.width;
            imageFrame.origin.y = (self.bounds.size.height - imageFrame.size.height) / 2;
            self.imageView.frame = imageFrame;
            [self.titleLabel sizeToFit];
            CGRect labelFrame = self.titleLabel.frame;
            labelFrame.origin.x = imageFrame.origin.x - labelFrame.size.width - 5;
            self.titleLabel.frame = labelFrame;
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
        } else {
            CGRect r = self.imageView.bounds;
            r.size = CGSizeMake(self.currentImage.size.width, self.currentImage.size.height);
            self.imageView.bounds = r;
        }
    }
}

- (void)setButtonWithImage:(UIImage *)image AndTitle:(NSString *)title {
    self.titleLabel.font = [UIFont systemFontOfSize:_ROM_FontSize_small];
    [self setTitleColor:self.fontColor forState:UIControlStateNormal];
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self setImage:image forState:UIControlStateNormal];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
}

- (void)setTopTenDateButtonWithImage:(UIImage *)image andTitle:(NSString *)title {
    _isImageRight = YES;
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self setImage:image forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal];
    [self setNeedsLayout];
}

- (void)setGiftPanelButtonWithImage:(UIImage *)image andTitle:(NSString *)title {
    _isImageRight = YES;
    [self setImage:image forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal];
    [self setNeedsLayout];
}

@end
