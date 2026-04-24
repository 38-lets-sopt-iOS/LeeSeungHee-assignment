//
//  ViewController.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/24/26.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    
    private let titleLabel: UILabel={
            let label = UILabel()
            label.text = "로그인/가입하려는\n이메일을 입력해주세요"
            label.numberOfLines = 2
            label.textColor = .white
            label.font = .pretendard(size: 23, weight: .semibold)
            label.textAlignment = .left
            return label
        }()
    
    private let subLabel: UILabel={
            let label = UILabel()
            label.text = "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요. \n사용 중인 이메일을 입력해주세요"
            label.textColor = .white
            label.font = .pretendard(size: 12, weight: .medium)
            label.textAlignment = .left
            return label
        }()
    
    private let emailTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "email@address.com"
           textField.backgroundColor = .gray
           textField.font = .pretendard(size: 12, weight: .regular)
           textField.leftViewMode = .always
           return textField
       }()
    
    lazy var nextButton: UIButton = {

           let nextButton = UIButton()
           nextButton.backgroundColor = .systemPink
           nextButton.setTitle("다음", for: .normal)
           nextButton.titleLabel?.font = .pretendard(size: 18, weight: .bold)
           nextButton.setTitleColor(.white,for: .normal)
        
           nextButton.addTarget(self,action: #selector(loginButtonDidTap), for: .touchUpInside)
       
           
           return nextButton
       }()

    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .black
            setUI()
            setLayout()
        }
    
    
    func setUI() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubviews(titleLabel,subLabel,nextButton,emailTextField)
    }
    
    func setLayout(){
        
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
            
        }
        
        subLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        nextButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(169)
        }
        
        emailTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(169)
        }
        
    }
    
    
    private func pushToPWVC(){
        let PWViewController = PWViewController()
        self.navigationController?.pushViewController(PWViewController, animated: true)
    }
    
    
    @objc
       private func loginButtonDidTap() {
           pushToPWVC()
       }
    
    

}
    
    
