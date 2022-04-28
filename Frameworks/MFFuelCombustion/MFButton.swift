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

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        layer.masksToBounds = false
    }

}
