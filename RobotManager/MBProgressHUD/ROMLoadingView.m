//
//  ROMLoadingView.m
//  
//
//  Created by 22 on 16/1/17.
//  Copyright © 2016年 . All rights reserved.
//

#import "ROMLoadingView.h"
#import "ROMButton.h"
#import "ROMPayTableViewCell.h"

#define CELL_HEIGHT 50

@interface ROMLoadingView ()

@property (nonatomic, strong) NSArray *imgArr;
@property (nonatomic, assign) BOOL isAni;
@property (nonatomic, assign) ROMPayType selectType;
@property (nonatomic, strong) UITableView *payView;


@end

@implementation ROMLoadingView

- (instancetype)initWithLoading:(NSString *)title {
    self = [super initWithFrame:CGRectMake(0, 0, 170, 170)];
    if (self) {
        self.backgroundColor = [ROMConfig hudColorBlackAlpha06];
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
        
        UIImageView *img2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popover_loading"]];
        [self addSubview:img2];
        [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(35);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(14, 18));
        }];
        
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popover_loading"]];
        [self addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(35);
            make.right.equalTo(img2.mas_left).with.offset(-8);
            make.size.mas_equalTo(CGSizeMake(14, 18));
        }];
        
        UIImageView *img3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popover_loading"]];
        [self addSubview:img3];
        [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(35);
            make.left.equalTo(img2.mas_right).with.offset(8);
            make.size.mas_equalTo(CGSizeMake(14, 18));
        }];
        
        img.alpha = 1.0;
        img2.alpha = 0.8;
        img3.alpha = 0.6;
        _imgArr = @[img, img2, img3];
        
        UILabel *textlabel = [[UILabel alloc] init];
        textlabel.text = title;
        textlabel.textColor = [UIColor whiteColor];
        textlabel.textAlignment = NSTextAlignmentCenter;
        textlabel.font = [UIFont systemFontOfSize:_ROM_FontSize_middle+1];
        [textlabel sizeToFit];
        textlabel.numberOfLines = 0;
        [self addSubview:textlabel];
        CGSize size = [title boundingRectWithSize:CGSizeMake(150, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_ROM_FontSize_middle+1]} context:nil].size;
        size.height += 2 * 5;
        size.width += 5;
        [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(img2.mas_bottom).with.offset(8);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(size.width, size.height));
        }];
        //计算大小
        self.frame = CGRectMake(0, 0, 170,(35)*2+18+size.height);
        return self;
    }
    return self;
}

- (void)animation {
    if (!self.isAni) {
        return;
    }
    UIImageView *img1 = self.imgArr[0];
    UIImageView *img2 = self.imgArr[1];
    UIImageView *img3 = self.imgArr[2];

    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        img1.transform = CGAffineTransformMakeScale(1.2, 1.2);
        img1.alpha = 1.0;
        
        img2.transform = CGAffineTransformIdentity;
        img2.alpha = 0.8;
        
        img3.transform = CGAffineTransformIdentity;
        img3.alpha = 0.6;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            img2.transform = CGAffineTransformMakeScale(1.2, 1.2);
            img2.alpha = 1.0;
            
            img1.transform = CGAffineTransformIdentity;
            img1.alpha = 0.8;
            
            img3.transform = CGAffineTransformIdentity;
            img3.alpha = 0.6;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                img3.transform = CGAffineTransformMakeScale(1.2, 1.2);
                img3.alpha = 1.0;
                
                img2.transform = CGAffineTransformIdentity;
                img2.alpha = 0.8;
                
                img1.transform = CGAffineTransformIdentity;
                img1.alpha = 0.6;
            } completion:^(BOOL finished) {
                [self animation];
            }];
        }];;
    }];
}

- (void)startAnimation {
    self.isAni = YES;
    [self animation];
}

- (void)stopAnimation {
    self.isAni = NO;
    [self.layer removeAllAnimations];
}


- (instancetype)initWithInfo:(NSString *)title text:(NSString *)text {
    self = [super initWithFrame:CGRectMake(0, 0, 170, 170)];
    self.backgroundColor = [ROMConfig hudColorBlackAlpha06];
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.font = [UIFont systemFontOfSize:_ROM_FontSize_middle];
    label.textColor = [UIColor whiteColor];
    [label sizeToFit];
    [self addSubview:label];
    
    if (text) {
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(17);
            make.centerX.equalTo(self);
        }];
    } else {
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.centerX.equalTo(self);
        }];
    }
    
    UILabel *textlabel = [[UILabel alloc] init];
    textlabel.textAlignment = NSTextAlignmentCenter;
    textlabel.numberOfLines = 0;
    textlabel.text = text;
    textlabel.textColor = [UIColor whiteColor];
    textlabel.font = [UIFont systemFontOfSize:_ROM_FontSize_middle];
    CGSize size = [text boundingRectWithSize:CGSizeMake(150, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_ROM_FontSize_middle]} context:nil].size;
    size.height += 2 * 5;
    size.width += 5;
    [self addSubview:textlabel];
    [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).with.offset(10);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(size);
    }];
    
    //计算大小
    self.frame = CGRectMake(0, 0, 170,(17)*2+10+label.bounds.size.height + size.height);
    return self;
}
- (instancetype)initWithError:(NSString *)title {
    self = [super initWithFrame:CGRectMake(0, 0, 170, 170)];
    self.backgroundColor = [ROMConfig hudColorBlackAlpha06];
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popover_error"]];
    [self addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    UILabel *textlabel = [[UILabel alloc] init];
    textlabel.text = title;
    textlabel.textColor = [UIColor whiteColor];
    textlabel.font = [UIFont systemFontOfSize:_ROM_FontSize_middle+1];
    textlabel.numberOfLines = 0;
    [textlabel sizeToFit];
    [self addSubview:textlabel];
    [textlabel setTextAlignment:NSTextAlignmentCenter];
    CGSize size = [title boundingRectWithSize:CGSizeMake(150, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_ROM_FontSize_medium]} context:nil].size;
    size.height += 10;
    size.width += 5;
    [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(img.mas_bottom).with.offset(8);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(size.width, size.height));
    }];
    
    //计算大小
    self.frame = CGRectMake(0, 0, 170,(10)+8+30+70+size.height);
    return self;
}

- (instancetype)initWithTitleLabel:(NSString *)title {
    self = [super initWithFrame:CGRectMake(0, 0, 240, 50)];
    self.backgroundColor = [ROMConfig hudColorBlackAlpha06];
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.text = title;
    label.font = [UIFont systemFontOfSize:_ROM_FontSize_middle];
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
    }];
  
    self.frame = CGRectMake(0, 0, 240,50);
    return self;
}

- (instancetype)initWithPayViewMoney:(NSString *)money  andWithTypeArry:(NSArray *)arry selectPayBlock:(void(^)(ROMPayType type))payBlock {

    self = [super initWithFrame:CGRectMake(0, 0, 240,117+CELL_HEIGHT*arry.count)];
//    self.layer.cornerRadius = 5;
//    self.layer.masksToBounds = YES;
//    self.backgroundColor=[UIColor whiteColor];
//    self.typeArry = [NSArray arrayWithArray:arry];
////    self.payView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 240,267) style:UITableViewStylePlain];
////    self.payView.delegate = self;
//    self.payView.scrollEnabled = NO;
//    self.payView.dataSource = self;
//    [self addSubview:self.payView];
//    _payBlock = payBlock;
//    NSNumber *paytype =[[NSUserDefaults standardUserDefaults] objectForKey:@"PayType"];
//    self.selectType = [paytype intValue];
//    self.payView.separatorStyle = UITableViewCellSeparatorStyleNone;
//
//    UIView *headerView =[[UIView alloc] initWithFrame:CGRectMake(0, 0,  self.payView.frame.size.width, 60)];
//    self.payView.tableHeaderView = headerView;
//    UIButton *closeBtn =[UIButton buttonWithType:UIButtonTypeCustom];
//    closeBtn.frame =CGRectMake(self.payView.frame.size.width-50, 10, 40, 30);
//    [closeBtn setImage:[UIImage imageNamed:@"live_compose_close"] forState:UIControlStateNormal];
//    [headerView addSubview:closeBtn];
//    [closeBtn addTarget:self action:@selector(closePayView) forControlEvents:UIControlEventTouchUpInside];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 14,self.payView.frame.size.width, 20)];
//    label.text = @"选择支付方式";
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont systemFontOfSize:_ROM_FontSize_middle];
//    label.textColor = [UIColor colorWithIntgerRed:93 green:93 blue:93 alpha:1];
//    [headerView addSubview:label];
//    UIView *line = [[UIView alloc] init];
//    line.frame = CGRectMake(10, 60-1, 240-20, 1);
//    line.backgroundColor = [UIColor colorWithIntgerRed:218 green:218 blue:218 alpha:1];
//    [headerView addSubview:line];
//    UILabel *moneylabel = [[UILabel alloc] initWithFrame:CGRectMake(0,40,  self.payView.frame.size.width, 10)];
//    moneylabel.textAlignment = NSTextAlignmentCenter;
//    moneylabel.text = [NSString stringWithFormat:@"需支付:￥%@",money];
//    moneylabel.font = [UIFont systemFontOfSize:_ROM_FontSize_small];
//    moneylabel.textColor = [UIColor colorWithIntgerRed:117 green:117 blue:255 alpha:1];
//    [headerView addSubview:moneylabel];
//    UIView *footView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.payView.frame.size.width,60)];
//    self.payView.tableFooterView = footView;
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(10,5 ,  self.payView.frame.size.width-20, 35);
//    btn.layer.cornerRadius = 4;
//    btn.layer.masksToBounds = YES;
//    [btn setTitleColor:[UIColor colorWithIntgerRed:117 green:117 blue:255 alpha:1] forState:UIControlStateNormal];
//    [btn setTitle:@"确认支付" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(pay) forControlEvents:UIControlEventTouchUpInside];
//    [footView addSubview:btn];
//    btn.layer.borderColor = [UIColor colorWithIntgerRed:117 green:117 blue:255 alpha:1].CGColor;
//    btn.layer.borderWidth = 1.0f;
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.typeArry.count;
}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    ROMPayTableViewCell *cell=[[ROMPayTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[ROMPayTableViewCell cellId]];
//    ROMPayType type =[[self.typeArry objectAtIndex:indexPath.row] intValue];
//    switch (type) {
//        case ROMPayTypeWeixi:{
//            cell.typeImageView.image = [UIImage imageNamed:@"pay_weichat"];
//            cell.titleLabel.text = @"微信支付";
//            cell.detailLabel.text = @"推荐安装微信5.0及以上版本使用";
//        }
//            break;
//        default:
//            break;
//    }
//    if (type == self.selectType) {
//        [cell selectChangeImage];
//    }
//    
//    return cell;
//}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ROMPayType type =[[self.typeArry objectAtIndex:indexPath.row] intValue];
    self.selectType = type;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:self.selectType] forKey:@"PayType"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.payView reloadData];;
    
}


- (void)buttonPress:(id)sender {
    if (self.block) {
        self.block();
    }
}

- (void)pay {
    if (self.payBlock) {
        self.payBlock(self.selectType);
    }
}
- (void)closePayView {
    [[ROMHUDView sharedHUD] hide];
}

@end
