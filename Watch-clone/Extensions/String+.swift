//
//  String+.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/25/26.
//

import UIKit

extension String {
    func isValidEmail() -> Bool {
        let regularExpression = "^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
}
