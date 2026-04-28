//
//  BaseTextField.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/29/26.
//

import UIKit

import Then
import SnapKit

final class BaseTextField: UITextField {

    init(placeholder: String) {
        super.init(frame: .zero)
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
}
