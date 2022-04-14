platform :ios, '13.0'
workspace 'My Footprint.xcworkspace'

abstract_target 'Frameworks' do 

	pod 'R.swift'
	pod 'Alamofire'
	pod 'SwiftLint'	

	target 'MFExtensions' do
		project 'Frameworks/MFExtensions/MFExtensions.xcodeproj'
	end

	target 'MFNetwork' do
		project 'Frameworks/MFNetwork/MFNetwork.xcodeproj'
	end

	target 'MFStorage' do
		project 'Frameworks/MFStorage/MFStorage.xcodeproj'
	end

	target 'My Footprint' do
		project 'My Footprint/My Footprint.xcodeproj'
		use_frameworks!
	end
end
