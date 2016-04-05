//
//  UIView+Badge.swift
//  UIViewBadge
//
//  Created by yixiaoluo on 16/3/30.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

import UIKit

private let kBadgeLabelTag = 10000
private let kBadgeSidePaddingX:CGFloat = 3
private let kBadgeSidePaddingY:CGFloat = 1

public enum BadgeStyle {
    case Point(CGSize)//the final size that dispaly will be CGSizeMake(size.width+2*3, size.height+1*2)
    case Number(UInt)
}

private class PaddingLabel: UILabel {
    override func intrinsicContentSize() -> CGSize {
        guard let _ = self.text, let text = self.text where text != "" else{
            return self.frame.size;
        }
        
        var size = NSString(UTF8String:text)!.sizeWithAttributes([NSFontAttributeName: self.font])
        size.width += kBadgeSidePaddingX*2
        size.height += kBadgeSidePaddingY*2
        size.width = size.width > size.height ? size.width : size.height
        
        return size
    }
}

public extension UITabBar{
    //index is the item index at self.items
    func viewInTabbarAtIndex(index:NSInteger) -> UIView? {
        guard self.items != nil else{ return nil}
        guard index < self.items!.count else{ return nil  }
        
        let barItemWidth = CGRectGetWidth(self.frame)/CGFloat(self.items!.count)
        let barItemHeight = CGRectGetHeight(self.frame)
        
        let viewFrame = CGRectMake(CGFloat(index)*barItemWidth, 0, barItemWidth, barItemHeight)
        
        var itemView:UIView?
        for view in self.subviews{
            if CGRectContainsRect(viewFrame, view.frame) {
                itemView = view;
                break;
            }
        }
        
        if itemView == nil { return nil }
        
        return self.imageViewIn(itemView!)
    }
    
    private func imageViewIn(view:UIView) -> UIImageView? {
        for v in view.subviews{
            guard let imageView = v as? UIImageView else{
                return self.imageViewIn(v)
            }
            return imageView
        }
        return nil
    }
}

public extension UIView{
    private var badgeLabel:UILabel{
        get{
            guard let lastLabel = self.viewWithTag(kBadgeLabelTag) as? UILabel else {
                let label = PaddingLabel.init(frame: CGRectMake(0, 0, 2, 2))
                label.tag = kBadgeLabelTag
                label.textAlignment = NSTextAlignment.Center;
                label.layer.masksToBounds = true
                label.backgroundColor = UIColor.redColor()
                label.textColor = UIColor.whiteColor()
                return label
            }
            return lastLabel;
        }
    }
    
    ///default is hidden
    public func setBadgeHidden(hidden:Bool){
        guard let view = self.viewWithTag(kBadgeLabelTag) else {
            self.addSubview(self.badgeLabel)
            
            self.badgeLabel.translatesAutoresizingMaskIntoConstraints = false
            self.addConstraint(NSLayoutConstraint.init(item: self.badgeLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
            self.addConstraint(NSLayoutConstraint.init(item: self.badgeLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -3))
            
            self.badgeLabel.hidden = hidden
            return
        }
        
        view.hidden = hidden
    }
    
    ///default is redColor()
    public func setBadgeBackgroundColor(color:UIColor){
        self.badgeLabel.backgroundColor = color
    }
    
    ///default is whiteColor()
    public func setBadgeTextColor(color:UIColor){
        self.badgeLabel.textColor = color
    }

    public func setBadgeFontColor(font:UIFont){
        self.badgeLabel.font = font
    }
    
    @objc public func setPointBadge(size:CGSize){
        self.setBadgeStyle(BadgeStyle.Point(size))
    }
    
    @objc public func setNumberBadge(number:UInt){
        self.setBadgeStyle(BadgeStyle.Number(number))
    }
    
    @nonobjc public func setBadgeStyle(style:BadgeStyle){
        switch style {
        case .Point(let size):
            var f:CGRect = self.badgeLabel.frame; f.size = size;
            self.badgeLabel.frame = f
            self.badgeLabel.text = ""
        case .Number(let number):
            self.badgeLabel.text = "\(number)";
        }
        
        self.badgeLabel.layer.cornerRadius = self.badgeLabel.intrinsicContentSize().height/2
    }
}