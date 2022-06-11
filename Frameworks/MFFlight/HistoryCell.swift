//
//  HistoryCell.swift
//  MFFlight
//
//  Created by Quentin Beaudoul on 11/06/2022.
//

import Foundation
import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var estimatedAtLabel: UILabel!

    func fillView(_ estimate: Estimate) {
        titleLabel.text = String(format: titleLabel.text ?? "",
                                 estimate.legs.first?.departureAirport ?? "",
                                 estimate.legs.first?.destinationAirport ?? "")

        distanceLabel.text = String(format: distanceLabel.text ?? "",
                                    estimate.distanceValue.toString(),
                                    estimate.distanceUnit)

        estimatedAtLabel.text = estimate.estimatedAt.toDate()?.getFormattedDate(format: "HH:mm yyyy-MM-dd")
    }
}
