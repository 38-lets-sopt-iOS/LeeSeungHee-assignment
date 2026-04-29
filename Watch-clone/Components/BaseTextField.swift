//
//  BaseTextField.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/29/26.
//

import UIKit

import Then
import SnapKit

final class BaseTextField: UITextField, UITextFieldDelegate {

    init(_ placeholder: String) {
        super.init(frame: .zero)
        self.delegate = self
        setStyle(placeholder: placeholder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setStyle(placeholder: String) {
        self.addLeftPadding()
        self.font = .body2
        self.backgroundColor = .GRAY_600
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.textColor = .WATCHA_WHITE
        self.placeholder = placeholder
        self.placeholderColor(.GRAY_300)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.WATCHA_PINK.cgColor
        textField.layer.borderWidth = 1
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }

}
