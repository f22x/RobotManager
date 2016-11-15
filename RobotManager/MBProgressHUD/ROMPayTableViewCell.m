//
//  ROMPayTableViewCell.m
//  
//
//  Created by wangxiaofeng on 16/3/10.
//  Copyright © 2016年 . All rights reserved.
//

#import "ROMPayTableViewCell.h"
@interface ROMPayTableViewCell ()


@property (nonatomic, strong) UIImageView *selectImageView;
@property (nonatomic, strong) UIView *lineView;


@end

@implementation ROMPayTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        
        self.typeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_typeImageView];
        self.selectImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.selectImageView.image = [UIImage imageNamed:@"common_circle"];
        [self.contentView addSubview:_selectImageView];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_titleLabel];
        self.titleLabel.text = @"选择支付方式";
        self.titleLabel.font = [UIFont systemFontOfSize:_ROM_FontSize_small+1];
        self.titleLabel.textColor = [UIColor colorWithIntgerRed:51 green:51 blue:51 alpha:1];
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_detailLabel];
        self.detailLabel.font = [UIFont systemFontOfSize:_ROM_FontSize_tiny];
        self.detailLabel.textColor = [UIColor colorWithIntgerRed:146 green:146 blue:146 alpha:1];
        self.lineView = [[UIView alloc] init];
        self.lineView.backgroundColor = [UIColor colorWithIntgerRed:218 green:218 blue:218 alpha:1];
        [self.contentView addSubview:_lineView];
        [self configLayout];
    }
    return self;
}
- (void)configLayout {
    
    
    [self.typeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(31, 31));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_typeImageView.mas_right).with.offset(7);
        make.right.lessThanOrEqualTo(_selectImageView.mas_left).with.offset(-10);
        make.top.equalTo(self.contentView).with.offset(8);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.right.lessThanOrEqualTo(_selectImageView.mas_left).with.offset(-10);
        make.bottom.equalTo(self.contentView).with.offset(-8);
    }];
    [self.selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-10);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.bottom.equalTo(self);
        make.right.equalTo(self.contentView).with.offset(10);
        make.height.equalTo(@0.5);
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}
- (void)selectChangeImage {
    self.selectImageView.image = [UIImage imageNamed:@"common_circle_right"];
}


@end
