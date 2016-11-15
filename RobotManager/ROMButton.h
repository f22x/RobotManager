

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ROMButtonImageType) {
    ROMButtonImage_normal = 0,
    ROMButtonImage_stretch = 1
};

@interface ROMButton : UIButton

@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, strong) UIColor *fontColor;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) UIEdgeInsets edge;
@property (nonatomic, assign) BOOL isBoldText;

@property (nonatomic, assign) BOOL veticalForImageAndTitle;
@property (nonatomic, assign) CGFloat verticalSpace; // veticalForImageAndTitle 为YES 情况下  image和title的间隔 default  8

- (instancetype)initClearBtnWithFrame:(CGRect)frame;

- (void)setCornerRadiusOn;
- (void)setButtonImage:(NSString *)normalImage highlighted:(NSString *)highImage type:(ROMButtonImageType)type;

- (void)setFeedIconHaveSpacing:(BOOL)haveSpacing;
- (void)setFeedPointIcon;
- (void)setGroupIconHaveSpaceing:(BOOL)haveSpacing;
- (void)setCreateGroupIconHaveSpaceing:(BOOL)haveSpacing;

- (void)setFeedSmallIcon;
- (void)setHotIcon;
- (void)setEditHomeIcon;
- (void)setBangPointIcon;

- (void)setGroupFuncIcon;

- (void)setTopTenTimeIcon;

- (void)setProfileIcon;

- (void)setButtonWithImage:(UIImage *)image AndTitle:(NSString *)title;

- (void)setTopTenDateButtonWithImage:(UIImage *)image andTitle:(NSString *)title;
- (void)setGiftPanelButtonWithImage:(UIImage *)image andTitle:(NSString *)title;

@end
