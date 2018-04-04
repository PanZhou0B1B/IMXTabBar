Pod::Spec.new do |s|
  s.name         = "IMXTabBar"
  s.version      = "1.0.0"
  s.summary      = "custom TabBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = "https://github.com/PanZhow/IMXTabBar.git"
  s.author             = { "zhoupanpan" => "2331838272@qq.com" }
  s.source       = { :git => "https://github.com/PanZhow/IMXTabBar.git", :tag => "#{s.version}" }
  s.requires_arc = true
  s.platform     = :ios, '8.0'

  s.source_files  = 'IMXTabBar/IMXTabBarKit/*.{h,m}'
  s.public_header_files = [
    'IMXTabBar/IMXTabBarKit/*.{h}'
  ]
  s.dependency 'Masonry' ,'~> 1.1.0'

end
