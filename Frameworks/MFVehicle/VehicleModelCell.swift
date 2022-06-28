//
//  VehicleModelCell.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import Foundation
import UIKit

class VehicleModelCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!

    func fillCell(_ vehicleModel: VehicleModel) {
        titleLabel.text = vehicleModel.name
        yearLabel.text = "\(vehicleModel.year)"
    }
}
