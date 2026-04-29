//
//  TextClearButton.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/30/26.
//
import UIKit

import Then
import SnapKit

final class ClearTextButton: UIButton {
    
    private weak var targetTextField: UITextField?

    init(_ textField: UITextField) {
        super.init(frame: .zero)
        self.targetTextField = textField
        setStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setStyle() {
        setImage(.x, for: .normal)
        addTarget(self, action: #selector(clearText), for: .touchUpInside)
    }

    @objc private func clearText() {
        targetTextField?.text = ""
    }
}
