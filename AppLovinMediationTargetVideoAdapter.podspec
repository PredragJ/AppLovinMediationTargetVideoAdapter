Pod::Spec.new do |s|
  s.name         = 'AppLovinMediationTargetVideoAdapter'
  s.version      = '1.0.0'
  s.summary      = 'AppLovin Mediation Adapter for TargetVideo'
  s.description  = <<-DESC
                   This is the AppLovin Mediation Adapter for TargetVideo.
                   AppLovin turns mobile into the medium of choice for advertisers.

                   OUR MISSION

                   Enable advertisers to make ROI-based marketing decisions and deliver relevant content on mobile.

                   Our marketing platform reaches new users and matches them with relevant brands - ensuring you reach the users that are likely to engage.

                   We deliver relevant content to over a billion mobile consumers every month. With AppLovin, advertisers attain their mobile marketing goals.
                   DESC
  s.homepage     = 'https://github.com/PredragJ/AppLovinMediationTargetVideoAdapter'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Predrag Jevtic' => 'predrag.jevtic@target-video.com' }
  s.authors      = 'TargetVideo'
  s.platform     = :ios, '11.0'

  # Korišćenje glavne grane kao source
  s.source       = { :git => 'https://github.com/PredragJ/AppLovinMediationTargetVideoAdapter.git', :tag => 'v1.0.0' }

  s.vendored_frameworks = "#{s.name}-#{s.version}/#{s.name}.xcframework"

  s.dependency 'BridSDK', :http => 'https://brid.s3.amazonaws.com/ios/v1.3.4/BridSDK.xcframework.zip'
  s.dependency 'AppLovinSDK'

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
end
