//
//  PasswordViewController.swift
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
    var tossNickname: String?
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
    
    lazy var pwTextField = BaseTextField("비밀번호 입력")
    
    private let enableImage = UIImageView(image: .enableOff)
    
    private let subLabel = UILabel().then {
        $0.text = "영문, 숫자, 특수문자 포함 10글자 이상"
        $0.font = .body2
        $0.textColor = .GRAY_100
    }
    
    lazy var joinButton = BaseButton("가입하기").then{
        $0.backgroundColor = .GRAY_300
    }
    
    lazy var setNickNameLabel = UILabel().then {
        $0.font = .body2
        $0.textColor = .GRAY_100
        $0.attributedText = NSAttributedString(string: "닉네임 설정",attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(labelTouch)
    }
    
    lazy var labelTouch = UITapGestureRecognizer(target: self, action: #selector(labelDidTouch))
    
//MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .WATCHA_BLACK
        
        emailLabel.text = "\(email ?? "")로 가입중"
        // 이런건 옵셔널바인딩아님 걘값잇을때만쓸거야 이거고 이 nil-coalescing (??) 은 nil이면 대체값넣어서 응무조건쓸거야이러시는
        
        setUI()
        setLayout()
        pwTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        joinButton.addTarget(self, action: #selector(joinDidTap), for: .touchUpInside)
        
    }
    
    
    func setUI() {
        view.backgroundColor = .WATCHA_BLACK
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
            $0.bottom.equalToSuperview().inset(47)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
    }
    

    
    
//MARK: - func
    
    private func presentToNameViewController() {
        let nameViewController = NameViewController()
        nameViewController.closerTypeProperty = { [weak self] data in
            guard let self else {return}
            setNickNameLabel.attributedText = NSAttributedString(string: "Nickname : \(data) ")
            self.tossNickname = data
        }
        if let sheet = nameViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        present(nameViewController, animated: true)
    }
    
    private func updateRightView(_ textField: UITextField) {
        
        let xIcon = ClearTextButton(pwTextField)
        
       let eyeIcon = UIButton().then {
            $0.setImage(.eyeOff, for: .normal)
            $0.setImage(.eyeOn, for: .selected)
            $0.contentMode = .scaleAspectFit
            $0.addTarget(self, action: #selector(eyeDidTap), for: .touchUpInside)
        }
        let spacer = UIView()
        
        let containerView = UIStackView().then{
            $0.axis = .horizontal
            $0.spacing = 4
            $0.addArrangedSubviews(xIcon,eyeIcon,spacer)
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
        textField.rightView = containerView
        textField.rightViewMode = .always
        
    }
    
    
    private func updateStates(_ isValid: Bool) {
        joinButton.isEnabled = isValid
        
        if isValid {
            joinButton.backgroundColor = .WATCHA_PINK
            joinButton.setTitleColor(.WATCHA_WHITE, for: .normal)
            enableImage.image = .enableOn
            subLabel.textColor = .WATCHA_GREEN
            
        } else {
            joinButton.backgroundColor = .GRAY_300
            joinButton.setTitleColor(.GRAY_200, for: .normal)
            enableImage.image = .enableOff
            subLabel.textColor = .GRAY_100
            
        }
    }
    
    func pushToWelcomeViewController() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.nickname = tossNickname
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
//MARK: - @objc
    
    @objc
    func labelDidTouch() {
        presentToNameViewController()
    }
    
  /*
    @objc
    private func clearText() {
        pwTextField.text = ""
        updateRightView(pwTextField)
    }
   */
    
    @objc
    private func textDidChange(_ textField: UITextField) {
        updateRightView(textField)
        let isValid = (textField.text ?? "").isValidPassword()
        updateStates(isValid)
    }
    
    
    @objc
    private func eyeDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        pwTextField.isSecureTextEntry.toggle()
    }
    
    @objc
    private func joinDidTap() {
        pushToWelcomeViewController()
    }
    
//MARK: -endOfClass
}

