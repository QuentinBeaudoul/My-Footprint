//
//  HistoryCell.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 21/05/2022.
//

import Foundation
import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var estimatedAtLabel: UILabel!

    func fillView(_ estimate: Estimate) {
        titleLabel.text = String(format: titleLabel.text ?? "",
                                 estimate.vehicleMake,
                                 estimate.vehicleModel,
                                 estimate.distanceValue.toString(),
                                 estimate.distanceUnit)

        yearLabel.text = "\(estimate.vehicleYear)"
        estimatedAtLabel.text = estimate.estimatedAt.toDate()?.getFormattedDate(format: "HH:mm yyyy-MM-dd") ?? ""
    }
}
