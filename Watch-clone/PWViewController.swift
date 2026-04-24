//
//  ViewController.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/24/26.
//

import UIKit
import SnapKit

class PWViewController: UIViewController {
    
    
    private let titleLabel: UILabel={
            let label = UILabel()
            label.text = "사용할 비밀번호를\n 입력해주세요"
            label.numberOfLines = 2
            label.textColor = .white
            label.font = .pretendard(size: 23, weight: .semibold)
            label.textAlignment = .left
            return label
        }()

    private let pwTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "비밀번호를 입력해주세요"
           textField.backgroundColor = .gray
           textField.font = .pretendard(size: 12, weight: .regular)
           textField.leftViewMode = .always
           return textField
       }()

    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .black
            setUI()
            setLayout()
        }
    
    
    func setUI() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubviews(titleLabel,pwTextField)
    }
    
    func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().inset(24)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(48)
        }
        
    }
    
    
}
    
    
