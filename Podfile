platform :ios, "11.0"
use_frameworks!
inhibit_all_warnings!

target 'RWRC' do
  pod 'MessageKit'
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
  pod 'Firebase/Firestore'
  pod 'Sentry', :git => 'https://github.com/getsentry/sentry-cocoa.git', :tag => '4.1.0'
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          if target.name == 'MessageKit'
              target.build_configurations.each do |config|
                  config.build_settings['SWIFT_VERSION'] = '4.0'
              end
          end
      end
  end
end

target 'RWRCTests' do
    # Pods for testing
end

target 'RWRCUITests' do
    # Pods for testing
end