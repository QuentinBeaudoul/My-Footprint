//
//  HistoryCell.swift
//  MFShipping
//
//  Created by Quentin on 02/06/2022.
//

import Foundation
import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var pictoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var estimatedAtLabel: UILabel!

    func fillView(_ estimate: Estimate) {
        setPicto(method: estimate.transportMethod)
        titleLabel.text = String(format: titleLabel.text ?? "",
                                 estimate.weightValue.toString(),
                                 estimate.weightUnit,
                                 estimate.distanceValue.toString(),
                                 estimate.distanceUnit)

        estimatedAtLabel.text = estimate.estimatedAt.toDate()?.getFormattedDate(format: "HH:mm yyyy-MM-dd") ?? ""
    }

    private func setPicto(method: String) {
        switch method {
        case "train":
            pictoImageView.image = R.image.ic_100_train()
        case "ship":
            pictoImageView.image = R.image.ic_100_ship()
        case "truck":
            pictoImageView.image = R.image.ic_100_truck()
        case "plane":
            pictoImageView.image = R.image.ic_100_airplane()
        default:
            break
        }
    }
}
