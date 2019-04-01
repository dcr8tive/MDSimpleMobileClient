platform :ios, '12.0'
use_frameworks!

def shared_pods
  pod 'RealmSwift', '~> 3.14.0'
end

target 'MDTwitterClient' do
  shared_pods
end

target 'MDTwitterClientTests' do
  inherit! :search_paths
  shared_pods
end
