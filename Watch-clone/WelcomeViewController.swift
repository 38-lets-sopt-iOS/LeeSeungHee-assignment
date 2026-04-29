//
//  WelcomeViewController.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/30/26.
//
import UIKit

import SnapKit
import Then

class WelcomeViewController: UIViewController {
    
    var nickname: String?
    
    private let watchaLogo = UIImageView(image: .watcha).then{
        $0.contentMode = .scaleAspectFit
    }
    
    private let welcomeLabel = UILabel().then{
        $0.numberOfLines = 2
        $0.textColor = .WATCHA_WHITE
        $0.font = .head2
        $0.textAlignment = .center
    }
    
    private let toMainButton = BaseButton("메인으로").then{
        $0.isEnabled = true
        $0.backgroundColor = .WATCHA_PINK
        $0.setTitleColor(.WATCHA_WHITE, for: .normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        welcomeLabel.text = "\(nickname ?? "익명의 사용자")님\n가입을 환영합니다!"
        toMainButton.addTarget(self, action: #selector(toMainButtonDidTap), for: .touchUpInside)
    }
    
    func setUI() {
        view.backgroundColor = .WATCHA_BLACK
        view.addSubviews(watchaLogo,welcomeLabel,toMainButton)
    }
    
    func setLayout(){
    
        watchaLogo.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(28)
            $0.top.equalToSuperview().offset(85)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(167)
        }
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(watchaLogo.snp.bottom).offset(54)
            $0.centerX.equalToSuperview()
        }
        toMainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
    }
    
    func pushToMainViewController(){
        let vc = MainViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func toMainButtonDidTap(){
        pushToMainViewController()
    }
}
