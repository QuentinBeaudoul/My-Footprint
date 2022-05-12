//
//  ProcessKeyboardToolbarView.swift
//  MFFuelCombustion
//
//  Created by Quentin on 05/05/2022.
//

import LoadableViews

protocol ProcessKeyboardToobarDelegate: AnyObject {
    func onToolbarButtonTapped()
}

class ProcessKeyboardToolbarView: LoadableView {

    @IBOutlet weak var button: MFButton!

    var delegate: ProcessKeyboardToobarDelegate?

    @IBAction func didToolBarButtonTapped() {
        delegate?.onToolbarButtonTapped()
    }

    func disable() {
        button.isEnabled = false
        button.alpha = 0.5
    }

    func enable() {
        button.isEnabled = true
        button.alpha = 1
    }
}
