//
//  ROMScoreView.m
//  
//
//  Created by wangxiaofeng on 16/6/17.
//  Copyright © 2016年 . All rights reserved.
//

#import "ROMScoreView.h"
#import "ROMButton.h"
@interface ROMScoreView ()

@property (nonatomic, strong) ROMButton *cancelButton;
@property (nonatomic, strong) ROMButton *confirmButton;
@property (nonatomic, strong) ROMButton *ontherButton;
@property (nonatomic, strong) UIImageView *imageView;
@end
@implementation ROMScoreView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithcancelButtonTitle:(NSString *)cancelButtonTitle confirmButtonTitle:( NSString*)confirmButtonTitle   ontherButtonTitle:( NSString*)ontherButtonTitle   imageName:(NSString *)imageName selectPayBlock:(void(^)(ROMScoreType type))block; {
    self = [super initWithFrame:CGRectMake(0, 0, 260, 230)];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
        if (cancelButtonTitle) {
            [self addSubview:self.cancelButton];
            self.cancelButton.title = cancelButtonTitle;
        }
        if (confirmButtonTitle) {
            [self addSubview:self.confirmButton];
            self.confirmButton.title = confirmButtonTitle;
        }
        if (ontherButtonTitle) {
            [self addSubview:self.ontherButton];
            [self.ontherButton addTarget:self action:@selector(onther) forControlEvents:UIControlEventTouchUpInside];
            self.ontherButton.title = ontherButtonTitle;
        }
           _block = block;
        if (imageName) {
            [self addSubview:self.imageView];
            [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@20);
                make.centerX.equalTo(self);
                make.size.mas_equalTo(CGSizeMake(180, 140));
            }];
            self.imageView.image = [UIImage imageNamed:imageName];
        }
        if (cancelButtonTitle && confirmButtonTitle) {
            [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(@-20);
                make.left.equalTo(@20);
                make.height.mas_equalTo(@31);
                make.width.equalTo(self.confirmButton);
            }];
            [self.cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
            [self.confirmButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(@-20);
                make.right.equalTo(@-20);
                make.height.mas_equalTo(@31);
                make.width.equalTo(self.cancelButton);
                make.left.equalTo(self.cancelButton.mas_right).with.offset(20);
            }];
            [self.confirmButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
        } else if(!cancelButtonTitle && confirmButtonTitle) {
            [self.confirmButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo (self);
                make.bottom.equalTo(@-20);
                make.size.mas_equalTo(CGSizeMake(100, 31));
            [self.confirmButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
            }];
        }
        if (ontherButtonTitle) {
            [self.ontherButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(@-10);
                make.right.equalTo(@-15);
                make.size.mas_equalTo(CGSizeMake(30, 31));
            }];
        }
      
        
    }
    return  self;
}

- (void)onther {
    if (self.block) {
        self.block(ROMScoreTypeOnther);
    }
}
- (void)confirm {
    if (self.block) {
        self.block(ROMScoreTypeConfirm);
    }
}

- (void)cancel {
    if (self.block) {
        self.block(ROMScoreTypeCancel);
    }
}


- (ROMButton *)ontherButton {
    if (!_ontherButton) {
        _ontherButton = [[ROMButton alloc] initClearBtnWithFrame:CGRectZero];
        _ontherButton.fontSize = 12;
        _ontherButton.title = @"以后";
        _ontherButton.fontColor = [UIColor blackColor];
    }
    return _ontherButton;
}

- (ROMButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [[ROMButton alloc] initClearBtnWithFrame:CGRectZero];
        _cancelButton.fontSize = 12;
        _cancelButton.fontColor = [UIColor blackColor];
        _cancelButton.backgroundColor = [UIColor colorWithIntgerRed:79 green:188 blue:255 alpha:1];
        _cancelButton.layer.cornerRadius = 15;
    }
    return _cancelButton;
}
- (ROMButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [[ROMButton alloc] initClearBtnWithFrame:CGRectZero];
        _confirmButton.fontSize = 12;
        _confirmButton.fontColor = [UIColor blackColor];
        _confirmButton.backgroundColor = [UIColor colorWithIntgerRed:255 green:219 blue:0 alpha:1];
        _confirmButton.layer.cornerRadius = 15;
    }
    return _confirmButton;
}
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];

    }
    return _imageView;
}
@end
