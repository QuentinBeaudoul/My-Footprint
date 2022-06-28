//
//  HeaderView.swift
//  MFFuelCombustion
//
//  Created by Quentin on 29/04/2022.
//

import LoadableViews

public protocol HeaderViewDelegate: AnyObject {
    func onBackButtonTapped()
}

public class HeaderView: LoadableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var backButtonView: UIView!

    @IBOutlet weak var verticalTitleConstrainte: NSLayoutConstraint!

    public var delegate: HeaderViewDelegate?
    private var isBackButtonHidden = true

    public func fillView(title: String?, back: String? = "back", isBackButtonHidden: Bool = true) {
        titleLabel.text = title
        backLabel.text = back

        self.isBackButtonHidden = isBackButtonHidden
        backButtonView.isHidden = isBackButtonHidden
        verticalTitleConstrainte.constant = isBackButtonHidden ? 0.0 : 18
    }

    public func isBackButtonVisible() -> Bool {
        !isBackButtonHidden
    }

    @IBAction func onBackButtonTapped() {
        delegate?.onBackButtonTapped()
    }
}
