//
//  VehicleMakeCell.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 14/05/2022.
//

import UIKit

class VehicleMakeCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countModelsLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!

    func fillView(vehicleMake: VehicleMake) {
        titleLabel.text = vehicleMake.name
        countModelsLabel.text = "\(vehicleMake.numberOfModels)"
        modelLabel.text = vehicleMake.numberOfModels > 0 ? "models" : "model"
    }
}
