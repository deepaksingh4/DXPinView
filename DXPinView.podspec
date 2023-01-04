#
# Be sure to run `pod lib lint DXPinView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DXPinView'
  s.version          = '0.1.1'
  s.summary          = 'A view to get OTP, or ask user for passcode'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description betweexn the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'A view to get OTP, or ask user for passcode'
                       DESC

  s.homepage         = 'https://github.com/deepaksingh4/DXPinView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Deepak' => 'deepak.inbox229@gmail.com' }
  s.source           = { :git => 'https://github.com/deepaksingh4/DXPinView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  s.swift_versions = '5.0'
  s.source_files = '*.{h,swift}'
  # s.resource_bundles = {
  #   'DXPinView' => ['DXPinView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
