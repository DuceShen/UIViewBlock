

Pod::Spec.new do |s|

  s.name         = "UIViewBlock"
  s.version      = "1.0.3"
  s.ios.deployment_target = '9.0'
  s.summary      = "A short description of UIViewBlock."

  s.homepage     = "https://github.com/DuceShen/UIViewBlock"


  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "DuceShen" => "duce.zju@gmail.com" }

  s.source       = { :git => "https://github.com/DuceShen/UIViewBlock.git", :tag => "v#{s.version}" }

  s.source_files = 'UIViewBlock/*.{h,m}'

  s.requires_arc = true

end
