Pod::Spec.new do |s|
  s.name         = 'AppLovinMediationTargetVideoAdapter'
  s.version      = '1.1.1'
  s.summary      = 'AppLovin Mediation Adapter for TargetVideo'
  s.description  = <<-DESC
                   This is the AppLovin Mediation Adapter for TargetVideo.
                   DESC
  s.homepage     = 'https://github.com/PredragJ/AppLovinMediationTargetVideoAdapter'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Predrag Jevtic' => 'predrag.jevtic@target-video.com' }
  s.platform     = :ios, '14.0'

  s.source       = { :git => 'https://github.com/PredragJ/AppLovinMediationTargetVideoAdapter.git' }

  s.dependency 'BridSDK', '~> 1.4.0'
  s.dependency 'AppLovinSDK', '>= 12.4.1'

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
end
