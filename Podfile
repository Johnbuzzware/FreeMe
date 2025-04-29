# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'FreeMe' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FreeMe

  pod 'IQKeyboardManagerSwift'
  pod 'LGSideMenuController','2.1.1'
  
  
 # pod 'Firebase/Firestore'
 # pod 'Firebase/Auth'
 # pod 'Firebase/Storage'
 # pod 'FirebaseFirestoreSwift'

 # pod 'Firebase/Core'
 # pod 'Firebase/Messaging'
  
 # pod 'RangeSeekSlider'
  
  pod 'ImageSlideShowSwift'
  
 # pod 'GoogleMaps','4.2.0'
 # pod 'GooglePlaces'
  
  
 # pod 'GoogleSignIn'
  pod 'Alamofire'
  pod 'AlamofireImage'
  pod 'SwiftyJSON'
  pod 'FlagPhoneNumber'
  pod 'JGProgressHUD'
  
  pod 'NVActivityIndicatorView'
  pod 'ReachabilitySwift'
  pod 'ChameleonFramework/Swift'
  pod 'ImageSlideshow/SDWebImage'
  pod 'iOSDropDown'

  target 'FreeMeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'FreeMeUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  # Set iOS deployment target
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
  
  # Modify compiler flags for BoringSSL-GRPC
  installer.pods_project.targets.each do |target|
    if target.name == 'BoringSSL-GRPC'
      target.source_build_phase.files.each do |file|
        if file.settings && file.settings['COMPILER_FLAGS']
          flags = file.settings['COMPILER_FLAGS'].split
          flags.reject! { |flag| flag == '-GCC_WARN_INHIBIT_ALL_WARNINGS' }
          file.settings['COMPILER_FLAGS'] = flags.join(' ')
        end
      end
    end
  end
end
