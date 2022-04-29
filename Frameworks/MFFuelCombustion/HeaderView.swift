//
//  HeaderView.swift
//  MFFuelCombustion
//
//  Created by Quentin on 29/04/2022.
//

import LoadableViews

protocol HeaderViewDelegate: AnyObject {
    func onBackButtonTapped()
}

class HeaderView: LoadableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    var delegate: HeaderViewDelegate?

    @IBAction func onBackButtonTapped() {
        delegate?.onBackButtonTapped()
    }
}
