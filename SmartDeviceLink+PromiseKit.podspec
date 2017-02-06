Pod::Spec.new do |spec|

  spec.name         = 'SmartDeviceLink+PromiseKit'
  spec.version      = '0.1'
  spec.license      = { :type => "New BSD", :file => "LICENSE" }
  spec.summary      = 'PromiseKit extensions for SmartDeviceLink'
  spec.author       = 'Joel Fischer'
  spec.source       = { :git => 'git://github.com/livio/SmartDeviceLink+PromiseKit.git', :tag => spec.version }
  spec.source_files = 'SmartDeviceLink-PromiseKit/*'
  spec.requires_arc = true
  spec.dependency 'PromiseKit', '~> 4.0'
  spec.dependency 'SmartDeviceLink-iOS', '~> 4.3'

end

