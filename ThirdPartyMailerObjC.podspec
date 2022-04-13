#
#  Be sure to run `pod spec lint ThirdPartyMailerObjC.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "ThirdPartyMailerObjC"
  s.version      = "1.0.2"
  s.summary      = "Interact with third-party iOS mail clients, using custom URL schemes. (Object C Version)"
  s.description  = <<-DESC
Enables your app to discover what email apps are installed on an iOS device and provides a uniform interface for requesting an email to be sent to which ever one is selected from the list it provides. Unfortunately, not all email clients offer a URL scheme for 3rd party support. 
                   DESC
  s.homepage     = "https://github.com/Seoras/ThirdPartyMailer"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors            = { "George M. Taylor" => "george@georgetaylor.com", "Vincent Tourraine" => "me@vtourraine.net" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/Seoras/ThirdPartyMailer.git", :tag => s.version }
  s.source_files  = "Source/*.{h,m}"
  s.resource  = "Source/ThirdPartyMailer.plist"
  s.framework  = "UIKit"
  s.requires_arc = true
end
