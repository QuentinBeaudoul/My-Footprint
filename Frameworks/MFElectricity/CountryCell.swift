//
//  CountryCell.swift
//  MFElectricity
//
//  Created by Quentin on 03/06/2022.
//

import Foundation
import UIKit
import Kingfisher

class CountryCell: UITableViewCell {
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    func fillCell(_ country: Country) {
        let url = URL(string: String(format: Constants.countryUrl, country.code))
        countryImageView.kf.setImage(with: url)
        label.text = country.name
    }
}
