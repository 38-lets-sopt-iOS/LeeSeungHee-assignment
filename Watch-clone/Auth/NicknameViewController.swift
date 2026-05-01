//
//  NicknameController.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/28/26.
//

import Then
import UIKit
import SnapKit

class NicknameViewController: UIViewController {
    
    
    var closerTypeProperty: ((String)->Void)?
    
    private let titleLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.textColor = .WATCHA_WHITE
        $0.font = .subhead1
    }
    
    private let nicknameTextField = BaseTextField("nickname")
    
    lazy var doneButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = .medium
        $0.backgroundColor = .GRAY_600
        $0.setTitleColor(.WATCHA_WHITE, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(doneButtonDidTap), for: .touchUpInside)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    func setUI(){
        view.backgroundColor = .WATCHA_BLACK.withAlphaComponent(0.5)
        view.addSubviews(titleLabel,nicknameTextField,doneButton)
    }
    
    func setLayout(){
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalToSuperview().inset(42)
        }
        nicknameTextField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.top.equalTo(titleLabel.snp.bottom).offset(19)
            $0.height.equalTo(47)
        }
        doneButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
    }
    //MARK: - @objc
    @objc
    func doneButtonDidTap(){
        self.dismiss(animated: true)
        guard let ctp = closerTypeProperty else {return}
        if let x = nicknameTextField.text {
            ctp(x)     
        }
    }
    
    //MARK: -endOfClass
}
