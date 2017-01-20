#
# Be sure to run `pod lib lint IMEHttpMock.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IMEHttpMock'
  s.version          = '1.0.1'
  s.summary          = 'This is a http mock.'
  s.description      = <<-DESC
To the service side, provide service for the HTTP request.
                       DESC

  s.homepage         = 'https://gitmylab.365ime.com:ime-ios/IME-HttpMock'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Liu Xu' => 'liuxu@365ime.com' }
  s.source           = { :git => 'git@gitmylab.365ime.com:ime-ios/IME-HttpMock.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'

  s.source_files = 'IMEHttpMock/Classes/**/*'
  s.dependency 'OHHTTPStubs'
end
