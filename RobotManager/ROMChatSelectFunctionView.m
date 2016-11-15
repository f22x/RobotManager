//
//  ROMChatSelectFunctionView.m
//  
//
//  Created by  on 15/7/20.
//  Copyright © 2015年 . All rights reserved.
//

#import "ROMChatSelectFunctionView.h"
#import "ROMButton.h"

@interface ROMChatSelectFunctionView ()

@property (nonatomic, strong) UIButton *tenSecondBtn;
@property (nonatomic, strong) UIButton *cameraBtn;
@property (nonatomic, strong) UIButton *picBtn;
@property (nonatomic, strong) UILabel *tenSecondLabel;
@property (nonatomic, strong) UILabel *cameraLabel;
@property (nonatomic, strong) UILabel *picLabel;
@property (nonatomic, strong) UITextView *inputView;

@end

@implementation ROMChatSelectFunctionView

- (nonnull instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [ROMConfig backgroundColor_grey];
        [self addSubview:self.tenSecondBtn];
        [self addSubview:self.cameraBtn];
        [self addSubview:self.picBtn];
        [self addSubview:self.tenSecondLabel];
        [self addSubview:self.cameraLabel];
        [self addSubview:self.picLabel];
        [self configLayout];
    }
    return self;
}

- (nonnull instancetype)initWithInputView:(UITextView *)inputView {
    self = [self initWithFrame:CGRectMake(0, 0, kScreenWidth, 216)];
    if (self) {
        self.inputView = inputView;
    }
    return self;
}

#pragma mark - Layout

- (void)configLayout {
    [self.tenSecondBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(57, 57));
    }];
    [self.tenSecondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.tenSecondBtn);
        make.top.equalTo(self.tenSecondBtn.mas_bottom).with.offset(5);
    }];
    [self.cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tenSecondBtn.mas_right).with.offset(18);
        make.top.equalTo(self.tenSecondBtn);
        make.size.equalTo(self.tenSecondBtn);
    }];
    [self.cameraLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.cameraBtn);
        make.top.equalTo(self.cameraBtn.mas_bottom).with.offset(5);
    }];
    [self.picBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cameraBtn.mas_right).with.offset(18);
        make.top.equalTo(self.cameraBtn);
        make.size.equalTo(self.cameraBtn);
    }];
    [self.picLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.picBtn);
        make.top.equalTo(self.picBtn.mas_bottom).with.offset(5);
    }];
}

#pragma mark - Public Method

- (void)showFunctionView {
//    if (self.inputView.inputView != self) {
        self.inputView.inputView = self;
        [self.inputView resignFirstResponder];
        [self.inputView becomeFirstResponder];
//    }
}

#pragma mark - Target & Action

- (void)clickBtn:(UIButton *)sender {
    if (self.btnBlock) {
        self.btnBlock(sender.tag);
    }
}

#pragma mark - Getter & Setter

- (UIButton *)tenSecondBtn {
    if (!_tenSecondBtn) {
        _tenSecondBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        _tenSecondBtn.layer.cornerRadius = 4;
        _tenSecondBtn.layer.masksToBounds = YES;
        _tenSecondBtn.layer.borderColor = [ROMConfig boardcolor_grey218].CGColor;
        _tenSecondBtn.layer.borderWidth = 1;
        _tenSecondBtn.tag = 0;
        [_tenSecondBtn setImage:[UIImage imageNamed:@"Chat_choosepanel_10s"] forState:UIControlStateNormal];
        [_tenSecondBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tenSecondBtn;
}

- (UILabel *)tenSecondLabel {
    if (!_tenSecondLabel) {
        _tenSecondLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tenSecondLabel.text = @"10秒图片";
        _tenSecondLabel.textColor = [ROMConfig fontColor93];
        _tenSecondLabel.font = [UIFont systemFontOfSize:12.f];
        _tenSecondLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tenSecondLabel;
}

- (UIButton *)cameraBtn {
    if (!_cameraBtn) {
        _cameraBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        _cameraBtn.layer.cornerRadius = 4;
        _cameraBtn.layer.masksToBounds = YES;
        _cameraBtn.layer.borderColor = [ROMConfig boardcolor_grey218].CGColor;
        _cameraBtn.layer.borderWidth = 1;
        _cameraBtn.tag = 1;
        [_cameraBtn setImage:[UIImage imageNamed:@"Chat_choosepanel_takephoto"] forState:UIControlStateNormal];
        [_cameraBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraBtn;
}

- (UILabel *)cameraLabel {
    if (!_cameraLabel) {
        _cameraLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _cameraLabel.text = @"相机";
        _cameraLabel.textColor = [ROMConfig fontColor93];
        _cameraLabel.font = [UIFont systemFontOfSize:12.f];
        _cameraLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _cameraLabel;
}

- (UIButton *)picBtn {
    if (!_picBtn) {
        _picBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        _picBtn.layer.cornerRadius = 4;
        _picBtn.layer.masksToBounds = YES;
        _picBtn.layer.borderColor = [ROMConfig boardcolor_grey218].CGColor;
        _picBtn.layer.borderWidth = 1;
        _picBtn.tag = 2;
        [_picBtn setImage:[UIImage imageNamed:@"Chat_choosepanel_photo"] forState:UIControlStateNormal];
        [_picBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _picBtn;
}

- (UILabel *)picLabel {
    if (!_picLabel) {
        _picLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _picLabel.text = @"照片";
        _picLabel.textColor = [ROMConfig fontColor93];
        _picLabel.font = [UIFont systemFontOfSize:12.f];
        _picLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _picLabel;
}

@end
