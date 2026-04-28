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
    
   let emailTextField = BaseTextField(placeholder: "email@address.com")
    
    
    lazy var nextButton = BaseButton(inputLabel: "다음").then{
        $0.addTarget(self,action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
  /*  lazy var nextButton = UIButton().then{
        
        $0.backgroundColor = .GRAY_400
        $0.setTitle("다음", for: .normal)
        $0.titleLabel?.font = .medium
        $0.setTitleColor(.white,for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.isEnabled = false
        $0.addTarget(self,action: #selector(loginButtonDidTap), for: .touchUpInside)
    }*/

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.WATCHA_PINK.cgColor
        textField.layer.borderWidth = 1
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setUI()
        setLayout()
        
      //  emailTextField.placeholderColor(.GRAY_300)
        
        emailTextField.delegate = self
        
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
    
    
    private func pushToPWVC(){
        let PWViewController = PWViewController()
        PWViewController.email = emailTextField.text
        navigationController?.pushViewController(PWViewController, animated: true)
   
    }
   
    
    private func updateRightView(for textField: UITextField) {

        let container = UIStackView()
        container.axis = .horizontal
        container.spacing = 6
        
        let isValid = (textField.text ?? "").isValidEmail()

        let xIcon = UIButton()
        xIcon.setImage(UIImage(named: "x"), for: .normal)
        xIcon.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        
        let checkIcon = UIImageView()
        checkIcon.image = isValid
        ? UIImage(named: "check-on") //조건 만족
        : UIImage(named: "check-off")
        checkIcon.contentMode = .scaleAspectFit
        
        let spacer = UIView()
        
        container.addArrangedSubview(xIcon)
        container.addArrangedSubview(checkIcon)
        container.addArrangedSubview(spacer)

        xIcon.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }

        checkIcon.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }

        spacer.snp.makeConstraints {
            $0.width.equalTo(10)
        }

           textField.rightView = container
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
        pushToPWVC()
    }
    
    @objc
    private func textDidChange(_ textField: UITextField) {
        updateRightView(for: textField)
        let isValid = (textField.text ?? "").isValidEmail()
        updateNextButtonState(isValid: isValid)

        
    }
    
    @objc
    private func clearText() {
        emailTextField.text = ""
        updateRightView(for: emailTextField)
    }
}

