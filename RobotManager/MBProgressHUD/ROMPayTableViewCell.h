//
//  ROMPayTableViewCell.h
//  
//
//  Created by wangxiaofeng on 16/3/10.
//  Copyright © 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ROMPayTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *typeImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

- (void)selectChangeImage;

@end
