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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        aButton.setBadgeHidden(false)
        aButton.setBadgeStyle(BadgeStyle.Point(CGSizeMake(10, 10)))
        aButton.setBadgeBackgroundColor(UIColor.purpleColor())

        aView.setBadgeHidden(false)
        aView.setBadgeStyle(BadgeStyle.Number(90000))
        aView.setBadgeBackgroundColor(UIColor.redColor())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

