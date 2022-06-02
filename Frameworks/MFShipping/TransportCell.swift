//
//  TransportCell.swift
//  MFShipping
//
//  Created by Quentin on 02/06/2022.
//

import Foundation
import UIKit

class TransportCell: UITableViewCell {
    @IBOutlet weak var methodImageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    func fillView(method: String) {
        switch method {
        case "ship":
            methodImageView.image = R.image.ic_100_ship()
        case "train":
            methodImageView.image = R.image.ic_100_train()
        case "truck":
            methodImageView.image = R.image.ic_100_truck()
        case "plane":
            methodImageView.image = R.image.ic_100_airplane()
        default:
            break
        }

        label.text = method.capitalized
    }
}
