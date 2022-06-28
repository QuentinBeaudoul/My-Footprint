//
//  AirportCell.swift
//  MFFlight
//
//  Created by Quentin on 10/06/2022.
//

import Foundation
import UIKit

class AirportCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iataLabel: UILabel!

    func fillCell(_ airport: Airport) {
        titleLabel.text = airport.name
        iataLabel.text = airport.iataCode
    }
}
