# UIViewBadge
In many situatio, we need add a "red point" or "number with red background color" as a badge in an icon, to tell user---hey, there's something new here.... <br>
UIViewBadge is to solve this problem. It's an UIView extension in Swift, if you can find a UIView, you can easily add a badge to it. UIViewBadge only supported on iOS > 8 because Swift only support uses dynamic frameworks. As a result,  if you want to support iOS < 8, download the code and copy the file to your project.<br>

Example thunmbnail:
![image](https://github.com/goodyboy6/UIViewBadge/blob/master/ScreenShot.png)

## Install
pod 'UIViewBadge'

## Usage In Swift
<pre>
<code>
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
</code>
</pre>
## Usage In Objective-C
<pre>
<code>
    [_aButton setBadgeHidden:NO];
    [_aButton setPointBadge:CGSizeMake(10, 10)];
    [_aButton setBadgeBackgroundColor:[UIColor purpleColor]];
    
    [_aView setBadgeHidden:NO];
    [_aView setNumberBadge:9000];
    [_aView setBadgeBackgroundColor:[UIColor purpleColor]];
    
    UINavigationItem *navigationItem = self.tabBarController.navigationItem;
    navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self buildACustomButton]];
    [navigationItem.rightBarButtonItem.customView setBadgeHidden:NO];
    [navigationItem.rightBarButtonItem.customView setPointBadge:CGSizeMake(10, 10)];
    [navigationItem.rightBarButtonItem.customView setBadgeBackgroundColor:[UIColor purpleColor]];
</code>
</pre>

##Example Project
An example project is provided. It requires IOS7 and can be run on device or simulator. This will work for any device size. 

##Creator
Goodyboy6

##License
GBSwipeTableViewCell is available under the MIT license. See the LICENSE file for more info.
