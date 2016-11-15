//
//  ROMConfig.h
//  
//
//  Created by HongTao on 15/1/28.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <Foundation/Foundation.h>

#define _ROM_FontSize_tiny 9
#define _ROM_FontSize_little  10
#define _ROM_FontSize_small  12
#define _ROM_FontSize_middle 14
#define _ROM_FontSize_medium 15
#define _ROM_FontSize_big    16
#define _ROM_FontSize_large  17
#define _ROM_FontSize_title  18
#define _ROM_FontSize_26 26
#define _ROM_FontSize_30 30
#define _ROM_FontSize_40 40

#define _ROM_PublicContent_length 50

@class ROMLabel;

@interface ROMConfig : NSObject

+ (UIColor *)backgroundColor_grey;
+ (UIColor *)backgroundColor_black015;
+ (UIColor *)backgroundColor_grey30;
+ (UIColor *)backgroundColor_grey45;
+ (UIColor *)boardColor_purple;
+ (UIColor *)backgroundColor60;
+ (UIColor *)backgroundColor_purple;
+ (UIColor *)boardcolor_grey200;
+ (UIColor *)boardcolor_grey218;
+ (UIColor *)boardcolor_grey230;
+ (UIColor *)boardcolor_grey255;
+ (UIColor *)colorBlack;
+ (UIColor *)colorGray;
+ (UIColor *)colorBlueLeftButtom;
+ (UIColor *)colorBlueRightTop;
+ (UIColor *)tipsErrorTextColor;
+ (UIColor *)colorPurpleButtonUnderline;
+ (UIColor *)fontColor93;
+ (UIColor *)fontColor153;
+ (UIColor *)fontColor51;
+ (UIColor *)fontColor51Alpha:(CGFloat)alpha;
+ (UIColor *)fontColor51WithAlpha:(CGFloat)alpha;
+ (UIColor *)fontColor90;
+ (UIColor *)fontColor146;
+ (UIColor *)fontColor117;
+ (UIColor *)fontColor117_03;
+ (UIColor *)fontColor170;
+ (UIColor *)fontColor218;
+ (UIColor *)fontColor232;
+ (UIColor *)fontColor237;
+ (UIColor *)fontColor250;
+ (UIColor *)fontColor255Alpha10;
+ (UIColor *)fontColor255Alpha06;
+ (UIColor *)fontColor255Alpha02;
+ (UIColor *)fontColor255Alpha03;
+ (UIColor *)fontColor255Alpha05;
+ (UIColor *)fontColor255Alpha07;
+ (UIColor *)yellowColor255;
+ (UIColor *)modifyNickColor;
+ (UIColor *)fontColor192;
+ (UIColor *)fontColor21;
+ (UIColor *)fontColorPurple146;
+ (UIColor *)fontColor60red;
+ (UIColor *)fontColor245;
+ (UIColor *)colorWith244;
+ (UIColor *)fontColor210yellow;
+ (UIColor *)colorWith240gray;
+ (UIColor *)fontColorRed220;

+ (UIColor *)separatorColor;
+ (UIColor *)separatorColor218;

+ (UIColor *)colorWith242;
+ (UIColor *)colorWith245;

+ (UIColor *)pointColor0_2;
+ (UIColor *)pointColor2_4;
+ (UIColor *)pointColor4_6;
+ (UIColor *)pointColor6_8;
+ (UIColor *)pointColor8_10;

+ (UIColor *)fontColor5_86_132;
+ (UIColor *)fontColor144_33_43;
+ (UIColor *)fontColor57_61_112;
+ (UIColor *)fontColor39_41_65;
+ (UIColor *)fontColor255_234_0;
+ (UIColor *)fontColor255_216_0;
+ (UIColor *)fontColor144_70_0;
+ (UIColor *)fontColorRedWithAlpha:(CGFloat)alpha;
+ (UIColor *)fontColor20_150_70;

+ (UIColor *)fontColotBlackAlpha09;
+ (UIColor *)fontColorBlackAlpha;
+ (UIColor *)fontColorBlackAlpha04;
+ (UIColor *)fontColorBlackAlpha03;
+ (UIColor *)colorwith147;
+ (UIColor *)fontColor225_225_230;

+ (UIColor *)hudColorBlackAlpha06;

+ (UIColor *)colorForR1;
+ (UIColor *)colorForR2;
+ (UIColor *)colorForR3;
+ (UIColor *)colorForR4;
//等级
+ (UIColor *)colorForlevel1;
+ (UIColor *)colorForlevel1EndPoint;
+ (UIColor *)colorForlevel2;
+ (UIColor *)colorForlevel2EndPoint;
+ (UIColor *)colorForlevel3;
+ (UIColor *)colorForlevel3EndPoint;
+ (UIColor *)colorForlevel4;
+ (UIColor *)colorForlevel4EndPoint;
+ (UIColor *)colorForlevel5;
+ (UIColor *)colorForlevel5EndPoint;
+ (UIColor *)colorForlevel6;
+ (UIColor *)colorForlevel6EndPoint;
+ (UIColor *)colorForlevel7;
+ (UIColor *)colorForlevel7EndPoint;
+ (UIColor *)colorForlevel8;
+ (UIColor *)colorForlevel8EndPoint;
+ (UIColor *)colorForlevel9;
+ (UIColor *)colorForlevel9EndPoint;
+ (UIColor *)colorForlevel10;
+ (UIColor *)colorForlevel10EndPoint;
+ (UIColor *)colorForGrade:(int)grade;

// 官方
+ (UIColor *)colorForOfficial;
+ (NSArray *)gradientColorForOfficial;
+ (UIColor *)colorForRed240;

// 签到
+ (UIColor *)colorBrown;
+ (UIColor *)colorOrangeInside;
+ (UIColor *)colorOrangeOutside;
+ (UIColor *)colorYellowInside;

// 皇冠
+ (UIColor *)colorForCrown1;
+ (UIColor *)colorForCrown2;
+ (UIColor *)colorForCrown3;
+ (UIColor *)colorForBooking;

// 首页标签
+ (UIColor *)fontColorRed255;
+ (UIColor *)fontColor230;
+ (UIColor *)colorWith248;
+ (UIColor *)fontColor249;
+ (UIColor *)colorForRed240_60;
+ (UIColor *)colorForBlack150;

// 个人资料
+ (UIColor *)colorWith240redAlpha:(CGFloat)alpha;

// 我的保证金
+ (UIColor *)fontColor156;

@end
