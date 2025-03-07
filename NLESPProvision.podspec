#
# Be sure to run `pod lib lint NLESPProvision.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NLESPProvision'
  s.version          = '0.9.0'
  s.summary          = 'MMT Local Provision SDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  MMT Local Provision SDK. For more information, please visit
                       DESC

  s.homepage         = 'https://github.com/NealWills/NLESPProvision'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Neal' => 'nealwills93@gmail.com' }
  s.source           = { :git => 'https://github.com/NealWills/NLESPProvision.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'NLESPProvision/Classes/**/*'
  s.platform = :ios, "13.0"

  s.subspec 'Core' do |cs|
      cs.dependency "SwiftProtobuf", "~> 1.22.0"
      cs.dependency 'XCGLogger'
  end

  s.swift_versions = ['5.1', '5.2']
  
  # s.resource_bundles = {
  #   'NLESPProvision' => ['NLESPProvision/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
