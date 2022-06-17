//
//  UIView+.swift
//  MFExtensions
//
//  Created by Quentin on 15/04/2022.
//

import UIKit

@IBDesignable public extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else { return UIColor() }
            return UIColor(cgColor: borderColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable
    var localizationKey: String? {
        get {
            return objc_getAssociatedObject(self, "localizationKey") as? String
        } set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, "localizationKey", newValue as String?, .OBJC_ASSOCIATION_COPY_NONATOMIC)
                let split = newValue.split(separator: "_")
                let localizedString = String(split[1]).localized(bundle: Bundle(identifier: "Quentin.Beaudoul." + String(split[0]))!)
                updateLocalization(localizedString)
            }
        }
    }

    func updateLocalization(_ localizedString: String?) {
        guard let string = localizedString else {
            return
        }
        switch self {
        case let label as UILabel:
            label.text = string
        case let button as UIButton:
            button.setTitle(string, for: UIControl.State())
        case let textField as UITextField:
            textField.placeholder = string
        case let textView as UITextView:
            textView.text = string
        default:
            print("Unsupported localizable object: \(self)")
        }
    }

    func shake(_ duration: Double = 1) {
        self.transform = CGAffineTransform(translationX: 3, y: 0)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }

    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds

       layer.insertSublayer(gradientLayer, at: 0)
    }
}
