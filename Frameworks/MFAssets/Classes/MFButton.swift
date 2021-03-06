//
//  MFButtonView.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import Foundation
import LoadableViews
import MFExtensions

public class MFButton: UIButton {

    public override func awakeFromNib() {
        super.awakeFromNib()

        // setUp style
        backgroundColor = R.color.primaryColor()
        borderColor = R.color.secondaryColor()
        tintColor = R.color.onPrimaryColor()
        titleLabel?.font = .demiBoldFont(withSize: 18)
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.5

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
