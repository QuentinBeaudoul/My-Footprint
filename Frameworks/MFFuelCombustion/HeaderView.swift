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
    @IBOutlet weak var backButtonView: UIView!

    var delegate: HeaderViewDelegate?

    func fillView(title: String?, back: String? = "back", isBackButtonHidden: Bool = true) {
        titleLabel.text = title
        backLabel.text = back
        backButtonView.isHidden = isBackButtonHidden
    }

    @IBAction func onBackButtonTapped() {
        delegate?.onBackButtonTapped()
    }
}