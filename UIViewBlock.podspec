#
#  Be sure to run `pod spec lint UIViewBlock.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "UIViewBlock"
  s.version      = "1.0.0"
  s.ios.deployment_target = '9.0'
  s.summary      = "A short description of UIViewBlock."

  s.homepage     = "https://github.com/DuceShen/UIViewBlock"


  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author       = { "DuceShen" => "duce.zju@gmail.com" }

  s.source       = { :git => "https://github.com/DuceShen/UIViewBlock.git", :tag => s.version }

  s.source_files = "UIViewBlock/*.{h,m}"

  s.requires_arc = true

end
