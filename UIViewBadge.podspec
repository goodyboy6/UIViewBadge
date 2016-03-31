
Pod::Spec.new do |s|

s.license      = { :type => 'MIT', :file => 'LICENSE' }

s.name         = "UIViewBadge"
s.version      = "1.0.0"
s.summary      = "A UIView extension for point/number badge, easy and powerfull. We already offered a nice demo for usage in Objective-c or Swift"

s.homepage     = "https://github.com/goodyboy6/"
s.author       = {"goodyboy6" => "xiaoluo.yxl@alibaba-inc.com"}

s.platform     = :ios, '8.0'
s.ios.deployment_target = '8.0'
s.requires_arc = true

s.source =  { :git => "https://github.com/goodyboy6/UIViewBadge.git" , :tag => "1.0.0"}
s.source_files = "UIViewBadge/Class/*.swift"

end