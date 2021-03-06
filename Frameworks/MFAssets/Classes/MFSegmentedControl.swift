//
//  MFSegmentedControl.swift
//  MFAssets
//
//  Created by Quentin on 09/06/2022.
//

import UIKit
import MFExtensions

public class MFSegmentedControl: UISegmentedControl {

    public override func awakeFromNib() {
        super.awakeFromNib()
        
        // setUp style
        backgroundColor = .white
        borderColor = R.color.secondaryColor()
        tintColor = R.color.onPrimaryColor()

        selectedSegmentTintColor = R.color.primaryColor()

        let font = UIFont.demiBoldFont(withSize: 12)
        let selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: R.color.onPrimaryColor() ?? .white,
                                           NSAttributedString.Key.font: font]
        setTitleTextAttributes(selectedTitleTextAttributes, for: .selected)

        let normalTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                         NSAttributedString.Key.font: font]
        setTitleTextAttributes(normalTitleTextAttributes, for: .normal)

        // setUp corners
        cornerRadius = 4
        borderWidth = 2

        // setUp shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 1.5
        layer.masksToBounds = false
    }

}
