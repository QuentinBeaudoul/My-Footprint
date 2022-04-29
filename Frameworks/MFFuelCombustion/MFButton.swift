//
//  MFButtonView.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import Foundation
import LoadableViews

class MFButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()

        // setUp style
        backgroundColor = R.color.primaryColor()
        borderColor = R.color.secondaryColor()
        tintColor = R.color.onPrimaryColor()
        titleLabel?.font = .demiBoldFont(withSize: 18)

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
