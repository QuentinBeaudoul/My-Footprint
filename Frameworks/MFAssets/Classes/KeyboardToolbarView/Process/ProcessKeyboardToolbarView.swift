//
//  ProcessKeyboardToolbarView.swift
//  MFFuelCombustion
//
//  Created by Quentin on 05/05/2022.
//

import LoadableViews

public protocol ProcessKeyboardToobarDelegate: AnyObject {
    func onToolbarButtonTapped()
}

public class ProcessKeyboardToolbarView: LoadableView {

    @IBOutlet weak var button: MFButton!

    public var delegate: ProcessKeyboardToobarDelegate?

    @IBAction func didToolBarButtonTapped() {
        delegate?.onToolbarButtonTapped()
    }

    public func disable() {
        button.isEnabled = false
        button.alpha = 0.5
    }

    public func enable() {
        button.isEnabled = true
        button.alpha = 1
    }
}
