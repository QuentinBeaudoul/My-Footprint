//
//  MFTextfield.swift
//  MFFuelCombustion
//
//  Created by Quentin on 02/05/2022.
//

import LoadableViews

public protocol MFTextfieldDelegate: AnyObject {
    func onClearButtonTapped()
    func onTextfieldChanged(_ str: String?)
    func onToolBarButtonTapped()
}

public class MFTextfield: LoadableView {

    @IBOutlet weak var textField: UITextField!

    public var delegate: MFTextfieldDelegate?
    private var accessoryView: ProcessKeyboardToolbarView? {
        didSet {
            textField.inputAccessoryView = accessoryView
        }
    }

    var textfieldValue: String? {
        textField.text
    }

    public override func awakeFromNib() {
        super.awakeFromNib()

        // setUp shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 1.5
        layer.masksToBounds = false

        textField.delegate = self
    }

    public func setAccessoryView(_ accessoryView: ProcessKeyboardToolbarView) {
        self.accessoryView = accessoryView
        self.accessoryView?.delegate = self
    }

    public func disableToolBarButton() {
        accessoryView?.disable()
    }

    public func enableToolBarButton() {
        accessoryView?.enable()
    }

    @IBAction func textfieldValueChanged(_ sender: UITextField) {
        delegate?.onTextfieldChanged(sender.text)
    }
}

extension MFTextfield: UITextFieldDelegate {
    public func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        delegate?.onClearButtonTapped()
        textField.resignFirstResponder()
        return true
    }
}

extension MFTextfield: ProcessKeyboardToobarDelegate {
    public func onToolbarButtonTapped() {
        delegate?.onToolBarButtonTapped()
    }
}
