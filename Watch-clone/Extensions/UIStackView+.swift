//
//  UIStackView+.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/29/26.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0)}
    }
}
