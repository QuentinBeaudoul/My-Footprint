platform :ios, '13.0'
workspace 'MyFootprint.xcworkspace'
use_frameworks!

abstract_target 'Shared' do

	pod 'R.swift'
	pod 'SwiftLint'
	

	target 'MFExtensions' do
		project 'Frameworks/MFExtensions/MFExtensions.xcodeproj'
	end

	target 'MFNetwork' do
		project 'Frameworks/MFNetwork/MFNetwork.xcodeproj'
	
		pod 'Alamofire'
	end

	target 'MFStorage' do
		project 'Frameworks/MFStorage/MFStorage.xcodeproj'
	end

	target 'MFVehicle' do
		project 'Frameworks/MFVehicle/MFVehicle.xcodeproj'
		pod 'lottie-ios'
	end

	target 'MFShipping' do
		project 'Frameworks/MFShipping/MFShipping.xcodeproj'
		pod 'lottie-ios'
	end

	target 'MFFlight' do
		project 'Frameworks/MFFlight/MFFlight.xcodeproj'
		pod 'lottie-ios'
	end

	target 'MFElectricity' do 
		project 'Frameworks/MFElectricity/MFElectricity.xcodeproj'
		pod 'lottie-ios'
	end

	target 'MFFuelCombustion' do
		project 'Frameworks/MFFuelCombustion/MFFuelCombustion.xcodeproj'
		pod 'lottie-ios'
	end

	target 'MyFootprint' do
		project 'MyFootprint/MyFootprint.xcodeproj'
		pod 'lottie-ios'
	end
end

