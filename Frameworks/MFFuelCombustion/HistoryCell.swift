//
//  HistoryCell.swift
//  MFFuelCombustion
//
//  Created by Quentin Beaudoul on 10/05/2022.
//

import Foundation
import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var estimatedLabel: UILabel!

    func fillView(estimate: Estimate) {
        valueLabel.text = estimate.fuelSourceValue.toString()
        unitLabel.text = estimate.fuelSourceUnit
        estimatedLabel.text = estimate.estimatedAt.toDate()?.getFormattedDate(format: "HH:mm yyyy-MM-dd")
    }
}
