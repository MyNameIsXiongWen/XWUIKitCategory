
Pod::Spec.new do |s|
  s.name             = 'XWUIKitCategory'
  s.version          = '0.0.3'
  s.summary          = 'An uikit+category that create ui fast.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MyNameIsXiongWen/XWUIKitCategory'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MyNameIsXiongWen' => 'xiaobu@mankuhome.com' }
  s.source           = { :git => 'https://github.com/MyNameIsXiongWen/XWUIKitCategory.git', :tag => '0.0.3' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'XWUIKitCategory/Classes/**/*'
  
  # s.resource_bundles = {
  #   'XWUIKitCategory' => ['XWUIKitCategory/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
