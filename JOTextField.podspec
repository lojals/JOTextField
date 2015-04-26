#
# Be sure to run `pod lib lint JOTextField.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JOTextField"
  s.version          = "0.0.1"
  s.summary          = "A short description of JOTextField."
  s.description      = "JOTextField is a custom version of UITextField that Includes Validations and more"
  s.homepage         = "https://github.com/lojals/JOTextField"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jorge Ovalle" => "jroz9105@gmail.com" }
  s.source           = { :git => "https://github.com/lojals/JOTextField.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'JOTextField' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'pop', '~> 1.0'
end
