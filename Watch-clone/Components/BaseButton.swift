//
//  BaseButton.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/29/26.
//

import UIKit

import Then
import SnapKit

final class BaseButton: UIButton {
    
    init(inputLabel: String) {
        super.init(frame: .zero)
        setStyle(buttonLabel: inputLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle(buttonLabel: String){
        self.backgroundColor = .GRAY_400
        self.setTitle(buttonLabel, for: .normal)
        self.titleLabel?.font = .medium
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.isEnabled = false
    }
}
