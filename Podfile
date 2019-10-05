platform :ios, '13.0'
use_frameworks!

target 'rx-swift-example' do
  pod 'Alamofire', '~> 4'
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
end

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
    
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
        end
    end
end
