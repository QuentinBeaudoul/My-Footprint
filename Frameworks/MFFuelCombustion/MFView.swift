//
//  MFView.swift
//  MFFuelCombustion
//
//  Created by Quentin on 02/05/2022.
//

import UIKit

class MFView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()

        // setUp style
        borderColor = R.color.backgroundGradientTop()

        // setUp corners
        cornerRadius = 4

        // setUp shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 1.5
        layer.masksToBounds = false
    }
}
