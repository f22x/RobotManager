
#import <UIKit/UIKit.h>
#import "ROMTextField.h"

typedef NS_ENUM(NSUInteger, ROMChatType) {
    ROMChatText,
    ROMChatTenSecondImage,
    ROMChatCamera,
    ROMChatImage
};

typedef void(^ROMSendChatMessage)(NSString *content, ROMChatType type);
typedef void(^ROMJustblock)();

@interface ROMChatInputBar : UIView

@property (nonatomic, strong) ROMTextField *contentText;
@property (nonatomic, strong) UIButton *emojBtn;

@property (nonatomic, copy) ROMJustblock showFunctionViewBLock;
@property (nonatomic, copy) ROMJustblock hideFunctionViewBlock;

- (void)setSendChatMessageBlock:(ROMSendChatMessage)block;

@end
