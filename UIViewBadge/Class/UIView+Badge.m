//
//  UIView+WBBadge.m
//  workbench
//
//  Created by yixiaoluo on 16/6/24.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "UIView+Badge.h"
#import "UIFont+WBHelper.h"

static NSInteger kBadgeLabelTag = 10000;
static NSInteger kBadgeImageTag = 9999;

static CGFloat kBadgeSidePaddingX = 3;
static CGFloat kBadgeSidePaddingY = 1;

@interface PaddingLabel: UILabel

@property (nonatomic) CGSize size;

@end

@implementation PaddingLabel

- (CGSize)intrinsicContentSize
{
    CGSize size = (self.size.width == 0) ? CGSizeMake(9, 9) : self.size;
    
    if (self.text.length > 0) {
        size = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
        size.width += kBadgeSidePaddingX*2;
        size.height += kBadgeSidePaddingY*2;
    }
    
    size.width = size.width > size.height ? size.width : size.height;
    
    return size;
}

@end

@implementation BadgeBuilder
@end

@implementation UITabBar (Badge)

- (UIView *)viewInTabbarAtIndex:(NSInteger)index
{
    if (!self.items || index >= self.items.count || self.items.count == 0) {
        return nil;
    }
    
    CGFloat barItemWidth = CGRectGetWidth(self.frame)/self.items.count;
    CGFloat barItemHeight = CGRectGetHeight(self.frame);
    
    CGRect viewFrame = CGRectMake(index*barItemWidth, 0, barItemWidth, barItemHeight);
    
    UIView *itemView = nil;
    for (UIView *view in self.subviews) {
        if (CGRectContainsRect(viewFrame, view.frame)) {
            itemView = view;
            break;
        }
    }
    
    if (itemView == nil) {
        return nil;
    }
    
    return [self imageViewIn:itemView];
}

- (UIImageView *)imageViewIn:(UIView *)view
{
    UIImageView *imgView = nil;

    for (UIView *temp in view.subviews) {
        if ([temp isKindOfClass:[UIImageView class]]) {
            imgView = (UIImageView *)temp;
            break;
        }else{
            imgView = [self imageViewIn:temp];
        }
    }
    return imgView;
}

@end


@implementation UIView (Badge)

- (PaddingLabel *)badgeLabel
{
    PaddingLabel *label = [self viewWithTag:kBadgeLabelTag];
    if (!label) {
        label = [[PaddingLabel alloc] initWithFrame:CGRectMake(0, 0, 2, 2)];
        label.tag = kBadgeLabelTag;
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.masksToBounds = true;
        label.backgroundColor = [UIColor redColor];
        label.textColor = [UIColor whiteColor];
    }
    
    return label;
}

- (UIImageView *)badgeImageView
{
    UIImageView *badgeImageView = [self viewWithTag:kBadgeImageTag];
    if (!badgeImageView) {
        badgeImageView = [[UIImageView alloc] init];
        badgeImageView.contentMode = UIViewContentModeScaleAspectFit;
        badgeImageView.tag = kBadgeImageTag;
    }
    
    return badgeImageView;
}

- (void)setBadgeHidden:(BOOL)hidden
{
    [self setBadge:self.badgeLabel hidden:YES];
    [self setBadge:self.badgeImageView hidden:YES];
}

- (void)setBadge:(UIView *)view hidden:(BOOL)hidden
{
    if (!view.superview) {
        [self addSubview:view];
        [self layoutBadge:view];
    }
    view.hidden = hidden;
}

- (void)layoutBadge:(UIView *)view
{
    view.translatesAutoresizingMaskIntoConstraints = false;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:-3]];
}

- (void)setBadge:(void(^)(BadgeBuilder *builder))buildHandler;
{
    BadgeBuilder *builder = [[BadgeBuilder alloc] init];
    buildHandler(builder);
    
    if (!builder.number && !builder.image) {
        [self setBadgeHidden:YES];
        return;
    }
    
    [self setBadgeHidden:NO];

    if (builder.number) {
        [self setBadge:self.badgeLabel hidden:NO];

        //配置显示
        self.badgeLabel.backgroundColor = builder.backgroundColor ?: [UIColor redColor];
        self.badgeLabel.textColor = builder.textColor ?: [UIColor whiteColor];
        self.badgeLabel.font = builder.font ?: [UIFont systemFontOfSizeWithFontWeightLight:9];
        self.badgeLabel.size = builder.size;
        self.badgeLabel.text = builder.number.integerValue == 0 ? @"" : ((builder.number.integerValue > 99) ? @"99+" : builder.number.stringValue);
        
        [self layoutIfNeeded];
        
        self.badgeLabel.layer.cornerRadius = self.badgeLabel.frame.size.height/2;

    }else if(builder.image){
        [self setBadge:self.badgeImageView hidden:NO];
        self.badgeImageView.image = builder.image;
        
        [self layoutIfNeeded];
    }
}

@end
