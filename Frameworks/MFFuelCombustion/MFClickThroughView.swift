//
//  MFClickThroughScrollView.swift
//  MFFuelCombustion
//
//  Created by Quentin on 29/04/2022.
//

import UIKit

class MFClickThroughView: UIView {

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews {
            if !subview.isHidden &&
                subview.isUserInteractionEnabled &&
                subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }
}
