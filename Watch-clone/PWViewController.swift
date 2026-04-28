//
//  ViewController.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/24/26.
//
import Then
import UIKit
import SnapKit


class PWViewController: UIViewController {
    
    var email: String?
    
    private let titleLabel = UILabel().then{
        $0.text = "사용할 비밀번호를\n입력해주세요"
        $0.numberOfLines = 2
        $0.textColor = .WATCHA_WHITE
        $0.font = .head2
    }
    
    private let emailLabel = UILabel().then{
        $0.textColor = .GRAY_100
        $0.font = .body1
    }
    
    private let pwTextField = UITextField().then {
        $0.addLeftPadding()
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.leftViewMode = .always
        $0.font = .body2
        $0.backgroundColor = .GRAY_600
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.textColor = .WATCHA_WHITE
        $0.placeholderColor(.GRAY_300)
    }
    
    private let subLabel = UILabel().then {
        $0.text = "영문, 숫자, 특수문자 포함 10글자 이상"
        $0.font = .body2
        $0.textColor = .GRAY_600
    }
    
    lazy var joinButton = UIButton().then {
        
        let Button = UIButton()
        $0.backgroundColor = .GRAY_400
        $0.setTitle("가입하기", for: .normal)
        $0.titleLabel?.font = .medium
        $0.setTitleColor(.white,for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        emailLabel.text = "\(email ?? "")로 가입중"
        setUI()
        setLayout()
    }
    
    
    func setUI() {
        
        view.addSubviews(titleLabel,emailLabel,subLabel,pwTextField,joinButton)
    }
    
    func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(152)
            $0.leading.equalToSuperview().offset(31)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(31)
        }
        joinButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(384)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
    }
    
    
}


