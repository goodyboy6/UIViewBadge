
Pod::Spec.new do |s|

s.license      = { :type => 'MIT', :file => 'LICENSE' }

s.name         = "UIViewBadge"
s.version      = "2.4"
s.summary      = "A UIView extension for point/number badge, easy and powerfull."

s.homepage     = "https://github.com/goodyboy6/"
s.author       = {"goodyboy6" => "xiaoluo.yxl@alibaba-inc.com"}

s.platform     = :ios, '7.0'
s.ios.deployment_target = '7.0'
s.requires_arc = true

s.source =  { :git => "https://github.com/goodyboy6/UIViewBadge.git" , :tag => s.version}
s.source_files = "UIViewBadge/Class/*.{h,m}"

end
