#
# Be sure to run `pod lib lint FMAutolayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FMAutolayout"
  s.version          = "0.1.0"
s.summary          = "Create NSLayoutConstraints in code with one line of code!"

  s.description      = <<-DESC
FMAutolayout is a category on UIView created for making Auto Layout constraints in code easily. While making constraints from IB is pretty straightforward, if you want to make any changes on the constraints, you need to make a lot of IBOutlets, and sometimes, you just need to create new constraints from code.
                       DESC

  s.homepage         = "https://github.com/franciscojma86/autolayout"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "franciscojma86" => "franciscojma86@gmail.com" }
  s.source           = { :git => "https://github.com/franciscojma86/autolayout.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.2'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'FMAutolayout' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
