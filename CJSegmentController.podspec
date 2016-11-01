#
# Be sure to run `pod lib lint CJSegmentController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CJSegmentController'
  s.version          = '0.1.0'
  s.summary          = 'As it named, CJSegmentController is a UIViewController with a segmentControl.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
As it named, CJSegmentController is a UIViewController with a segmentControl, you would meet a lot of trouble when this SegmentControl's subviews have different Bar button Item. This pod is create For this Question.
                       DESC

  s.homepage         = 'https://github.com/jzy476731162/CJSegmentController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ji zhongyi' => 'jzy476731162@vip.qq.com' }
  s.source           = { :git => 'https://github.com/jzy476731162/CJSegmentController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'CJSegmentController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CJSegmentController' => ['CJSegmentController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
