//
//  ViewController.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/24/26.
//

import UIKit

import Then
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Properties
    
    private let titleLabel = UILabel().then{
        $0.text = "로그인/가입하려는\n이메일을 입력해주세요"
        $0.numberOfLines = 2
        $0.textColor = .WATCHA_WHITE
        $0.font = .head2
    }
    
    private let subLabel = UILabel().then{
        $0.text = "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요"
        $0.numberOfLines = 2
        $0.textColor = .GRAY_200
        $0.font = .body1
    }
    
    let emailTextField = BaseTextField("email@address.com")
    
    
    lazy var nextButton = BaseButton("다음").then{
        $0.addTarget(self,action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    //MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .WATCHA_BLACK
        
        setUI()
        setLayout()
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
    }
    
    
    func setUI() {
        view.addSubviews(titleLabel,subLabel,nextButton,emailTextField)
    }
    
    func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(152)
            $0.leading.equalToSuperview().offset(31)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(subLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(384)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
    }
    
    //MARK: - func
    private func pushToPasswordViewController(){
        let passwordViewController = PasswordViewController()
        passwordViewController.email = emailTextField.text
        navigationController?.pushViewController(passwordViewController, animated: true)
    }
    
    
    private func updateRightView(_ textField: UITextField) {
        
        let xIcon = UIButton().then{
            $0.setImage(.x, for: .normal)
            $0.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        }
        let isValid = (textField.text ?? "").isValidEmail()
        
        let checkIcon = UIImageView().then{
            $0.image = isValid ? .checkOn : .checkOff
            $0.contentMode = .scaleAspectFit
        }
        let spacer = UIView()
        
        let containerView = UIStackView().then{
            $0.axis = .horizontal
            $0.spacing = 4
            $0.addArrangedSubviews(xIcon,checkIcon,spacer)
        }
        
        xIcon.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        checkIcon.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        spacer.snp.makeConstraints {
            $0.width.equalTo(12)
        }
        textField.rightView = containerView
        textField.rightViewMode = .always
    }
    
    
    private func updateNextButtonState(isValid: Bool) {
        nextButton.isEnabled = isValid
        
        if isValid {
            nextButton.backgroundColor = .WATCHA_PINK
            nextButton.setTitleColor(.WATCHA_WHITE, for: .normal)
        } else {
            nextButton.backgroundColor = .GRAY_400
            nextButton.setTitleColor(.GRAY_200, for: .normal)
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        pushToPasswordViewController()
    }
    
    @objc
    private func textDidChange(_ textField: UITextField) {
        updateRightView(textField)
        let isValid = (textField.text ?? "").isValidEmail()
        updateNextButtonState(isValid: isValid)
    }
    
    @objc
    private func clearText() {
        emailTextField.text = ""
        updateRightView(emailTextField)
    }
}

