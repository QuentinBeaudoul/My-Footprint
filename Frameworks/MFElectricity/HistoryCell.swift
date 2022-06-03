//
//  HistoryCell.swift
//  MFElectricity
//
//  Created by Quentin on 03/06/2022.
//

import Foundation
import UIKit
import Kingfisher

class HistoryCell: UITableViewCell {
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var estimatedAtLabel: UILabel!

    func fillCell(_ estimate: Estimate) {
        let url = URL(string: String(format: Constants.countryUrl, estimate.country))
        countryImageView.kf.setImage(with: url)
        titleLabel.text = String(format: titleLabel.text ?? "", estimate.electricityValue.toString(),
                                 estimate.electricityUnit,
                                 estimate.getLiteralCountryName())
        estimatedAtLabel.text = estimate.estimatedAt.toDate()?.getFormattedDate(format: "HH:mm yyyy-MM-dd")
    }
}
