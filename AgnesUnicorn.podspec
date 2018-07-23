#
# Be sure to run `pod lib lint AgnesUnicorn.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AgnesUnicorn'
  s.version          = '0.0.1'
  s.summary          = 'To find your unicorn in your all components'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Let your viewModel to call all Signals cross the modules.
You can temporarily save your signal in to the cache, then another viewModel's signal can be binded to it.
The lifecycle of the temp signal will be ended while the original viewModel is denited.
                       DESC

  s.homepage         = 'https://github.com/SpiciedCrab/AgnesUnicorn'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'magic_harly@hotmail.com' => 'hy@mogoroom.com' }
  s.source           = { :git => 'https://github.com/SpiciedCrab/AgnesUnicorn/AgnesUnicorn.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AgnesUnicorn/Classes/**/*'
  
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
end
