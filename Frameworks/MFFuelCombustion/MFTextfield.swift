//
//  MFTextfield.swift
//  MFFuelCombustion
//
//  Created by Quentin on 02/05/2022.
//

import LoadableViews

protocol MFTextfieldDelegate: AnyObject {
    func onClearButtonTapped()
    func onTextfieldChanged(_ str: String?)
}

class MFTextfield: LoadableView {

    @IBOutlet weak var textField: UITextField!

    var delegate: MFTextfieldDelegate?
    var textfieldValue: String? {
        textField.text
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        // setUp shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 1.5
        layer.masksToBounds = false

        textField.delegate = self
    }
    @IBAction func textfieldChanged(_ sender: UITextField) {
        delegate?.onTextfieldChanged(sender.text)
    }
}

extension MFTextfield: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        delegate?.onClearButtonTapped()
        textField.resignFirstResponder()
        return true
    }
}
