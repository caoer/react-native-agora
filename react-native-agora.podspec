#
#  Be sure to run `pod spec lint react-native-agora.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#
require 'json'

package = JSON.parse File.read File.join __dir__, "package.json"
Pod::Spec.new do |s|
  s.name         = "react-native-agora"
  s.version      = package["version"]
  s.summary      = package["summary"]
  s.description  = package["description"]

  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["authors"]
  s.platform     = :ios, "9.0"
  s.source        = { :git => package["repository"]["url"], :tag => "#{s.version}" }

  s.source_files  = "ios/**/*.{h,m}"

  s.requires_arc = true
  s.subspec 'AgoraRtcCryptoLoader' do |sp|
    sp.source_files = './ios/RCTAgora/libs/AgoraRtcCryptoLoader.framework/**/*.{c,h,m,mm,S,cpp}'
    sp.vendored_libraries = 'libcrypto.a'
  end

  s.dependency "AgoraRtcEngine_iOS", "2.4.0.1"
  s.dependency 'React'
end
