//
//  ViewController.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/24/26.
//
import Then
import UIKit
import SnapKit


class PasswordViewController: UIViewController {
    
    //MARK: - Properties
    
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
    
    private lazy var pwTextField = BaseTextField("비밀번호 입력").then {
        $0.rightView = containerView
        $0.rightViewMode = .always
    }
    
    private let enableImage = UIImageView(image: .enableOff)
    
    //let isValid = (pwTextField.text ?? "").isValidPassword()
    
    //let enableImage = UIImageView().then{
    //    $0.image = isValid ? .enableOn : .enableOff
    //      $0.contentMode = .scaleAspectFit
    //   }
    
    private let subLabel = UILabel().then {
        $0.text = "영문, 숫자, 특수문자 포함 10글자 이상"
        $0.font = .body2
        $0.textColor = .GRAY_100
    }
    
    lazy var joinButton = BaseButton("가입하기")
    
    lazy var setNickNameLabel = UILabel().then {
        $0.font = .body2
        $0.textColor = .GRAY_100
        $0.attributedText = NSAttributedString(string: "닉네임 설정",attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(labelTouch)
    }
    
    lazy var containerView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 4
        $0.addArrangedSubviews(xIcon,eyeIcon,spacer)
    }
    lazy var xIcon = UIButton().then{
        $0.setImage(.x, for: .normal)
        $0.addTarget(self, action: #selector(clearText), for: .touchUpInside)
    }
    
    var eyeIcon = UIImageView().then{
        $0.image = .eyeOn
    }
    let spacer = UIView()
    
    
    
    
    //MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        emailLabel.text = "\(email ?? "")로 가입중"
        
        setUI()
        setLayout()
        
    }
    
    
    func setUI() {
        
        view.addSubviews(titleLabel,emailLabel,enableImage,subLabel,pwTextField,joinButton,setNickNameLabel)
    }
    
    func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(152)
            $0.leading.equalToSuperview().offset(31)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(30)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        
        enableImage.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(35)
            $0.width.height.equalTo(13)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(13)
            $0.leading.equalTo(enableImage.snp.trailing).offset(6)
        }
        setNickNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(subLabel.snp.bottom).offset(40)
        }
        joinButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(384)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
        
        xIcon.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        eyeIcon.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        spacer.snp.makeConstraints {
            $0.width.equalTo(12)
        }
    }
    
    
    
    
    //MARK: - func
    
    private func presentToNameViewController() {
        let nameViewController = NameViewController()
        nameViewController.closerTypeProperty = { [weak self] data in
            guard let self else {return}
            setNickNameLabel.attributedText = NSAttributedString(string: "닉네임 : \(data) ")
        }
        
        if let sheet = nameViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        present(nameViewController, animated: true)
    }
    
    @objc
    func labelDidTouch() {
        presentToNameViewController()
    }
    
    
    lazy var labelTouch = UITapGestureRecognizer(target: self, action: #selector(labelDidTouch))
    
    @objc
    private func clearText() {
        pwTextField.text = ""
    }
    
    
}//end

