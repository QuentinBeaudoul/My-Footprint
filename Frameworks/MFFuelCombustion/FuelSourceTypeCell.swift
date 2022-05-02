//
//  FuelSourceTypeCell.swift
//  MFFuelCombustion
//
//  Created by Quentin on 02/05/2022.
//

import UIKit

class FuelSourceTypeCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shortNameLabel: UILabel!

    func fillView(_ fuelSource: FuelEnergySource) {
        titleLabel.text = fuelSource.name
        shortNameLabel.text = fuelSource.apiName
    }
}
