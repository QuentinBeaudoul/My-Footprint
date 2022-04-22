platform :ios, '13.0'
workspace 'MyFootprint.xcworkspace'

abstract_target 'Shared' do

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

	target 'MFVehicle' do
		project 'Frameworks/MFVehicle/MFVehicle.xcodeproj'
	end

	target 'MFShipping' do
		project 'Frameworks/MFShipping/MFShipping.xcodeproj'
	end

	target 'MFFlight' do
		project 'Frameworks/MFFlight/MFFlight.xcodeproj'
	end

	target 'MFElectricity' do 
		project 'Frameworks/MFElectricity/MFElectricity.xcodeproj'
	end

	target 'MFFuelCombustion' do
		project 'Frameworks/MFFuelCombustion/MFFuelCombustion.xcodeproj'
	end

	target 'MyFootprint' do
		project 'MyFootprint/MyFootprint.xcodeproj'
		pod 'lottie-ios'
	end
end

