//
//  UIView+WBBadge.h
//  workbench
//
//  Created by yixiaoluo on 16/6/24.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface BadgeBuilder: NSObject

//显示图片  与显示text互斥
@property (nonatomic, nullable) UIImage *image;//角标为图片


//显示text 与显示图片互斥
@property (nonatomic, nullable) NSNumber *number;//number为nil, 不显示角标；number==0显示红点；number>0 显示数字
@property (nonatomic, nullable) UIColor *backgroundColor;//默认红色
@property (nonatomic, nullable) UIFont *font;//默认9号字体
@property (nonatomic, nullable) UIColor *textColor;//默认白色

//布局
@property (nonatomic) CGSize size;//默认9*9
@property (nonatomic) CGPoint offset;//在当前显示位置上的偏移量，默认为zero。  {-3, 3}表示向左偏移3、向下偏移3

@end

@interface UITabBar (Badge)

- (UIView *)viewInTabbarAtIndex:(NSInteger)index;

@end

@interface UIView (Badge)

- (void)setBadge:(void(^)(BadgeBuilder *builder))buildHandler;

@end

NS_ASSUME_NONNULL_END
