//
//  ObjCViewController.m
//  UIViewBadge
//
//  Created by yixiaoluo on 16/3/30.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

#import "ObjCViewController.h"
#import "UIViewBadge-Swift.h"

@interface ObjCViewController ()

@property (weak, nonatomic) IBOutlet UIButton *aButton;
@property (weak, nonatomic) IBOutlet UIView *aView;

@end

@implementation ObjCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_aButton setBadgeHidden:NO];
    [_aButton setPointBadge:CGSizeMake(10, 10)];
    [_aButton setBadgeBackgroundColor:[UIColor purpleColor]];
    
    [_aView setBadgeHidden:NO];
    [_aView setNumberBadge:9000];
    [_aView setBadgeBackgroundColor:[UIColor purpleColor]];
    
    self.tabBarItem.badgeValue = @"2";
    
    UINavigationItem *navigationItem = self.tabBarController.navigationItem;
    navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self buildACustomButton]];
    [navigationItem.rightBarButtonItem.customView setBadgeHidden:NO];
    [navigationItem.rightBarButtonItem.customView setPointBadge:CGSizeMake(10, 10)];
    [navigationItem.rightBarButtonItem.customView setBadgeBackgroundColor:[UIColor purpleColor]];
}

- (UIButton *)buildACustomButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoDark];
    button.frame = CGRectMake(0, 0, 24, 24);
    button.backgroundColor = [UIColor blueColor];
    return button;
}

@end
