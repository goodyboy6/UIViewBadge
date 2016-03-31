//
//  ViewController.swift
//  UIViewBadge
//
//  Created by yixiaoluo on 16/3/30.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var aToolBar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //red point/number in UIButton
        aButton.setBadgeHidden(false)
        aButton.setBadgeStyle(BadgeStyle.Point(CGSizeMake(10, 10)))
        aButton.setBadgeBackgroundColor(UIColor.purpleColor())

        //red point/number in UIView
        aView.setBadgeHidden(false)
        aView.setBadgeBackgroundColor(UIColor.redColor())
        aView.setBadgeFontColor(UIFont.systemFontOfSize(10))
        aView.setBadgeStyle(BadgeStyle.Number(90000))
        
        //red point/number in UITabBar
        //    self.tabBarItem.badgeValue = "2";
        let view = self.tabBarController?.tabBar.viewInTabbarAtIndex(0)
        view?.backgroundColor = UIColor.yellowColor()
        view?.setBadgeHidden(false)
        view?.setBadgeStyle(BadgeStyle.Point(CGSizeMake(12, 12)))
        view?.setBadgeBackgroundColor(UIColor.purpleColor())
        
        //red point/number in UIBarButtonItem in UINavigationBar
        let navigationItem = self.tabBarController?.navigationItem
        navigationItem?.rightBarButtonItem = UIBarButtonItem(customView: self.buildACustomButton())
        navigationItem?.rightBarButtonItem?.customView?.setBadgeHidden(false)
        navigationItem?.rightBarButtonItem?.customView?.setBadgeStyle(BadgeStyle.Point(CGSizeMake(10, 10)))
        navigationItem?.rightBarButtonItem?.customView?.setBadgeBackgroundColor(UIColor.purpleColor())
        
        //red point/number in UIBarButtonItem in UITabBar
        let item:UIBarButtonItem = UIBarButtonItem(customView: self.buildACustomButton())
        aToolBar.items = [item]
        item.customView?.setBadgeHidden(false)
        item.customView?.setBadgeStyle(BadgeStyle.Point(CGSizeMake(10, 10)))
        item.customView?.setBadgeBackgroundColor(UIColor.purpleColor())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buildACustomButton() -> UIButton {
        let button = UIButton(type: UIButtonType.InfoDark)
        button.frame = CGRectMake(0, 0, 24, 24);
        button.backgroundColor = UIColor.blueColor();
        return button;
    }
}

