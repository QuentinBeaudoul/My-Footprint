//
//  MFLabel.swift
//  MFFuelCombustion
//
//  Created by Quentin on 29/04/2022.
//

import UIKit

public class MFLabel: UILabel {

    public override func awakeFromNib() {
        super.awakeFromNib()

        // setUp Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 1
        layer.masksToBounds = false
    }
}
