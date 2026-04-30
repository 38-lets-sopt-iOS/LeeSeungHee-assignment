//
//  NavigationBarController.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/30/26.
//

import UIKit

import Then
import SnapKit

final class NavigationBarController: UITabBarController {
    private let Navs: [UIImage?] = [.nav1, .nav2, .nav3, .nav4, .nav5]
    
    
    private lazy var Buttons: [UIButton] = {
        
        var result: [UIButton] = []
        for i in Navs.indices {
            let button = UIButton(type: .custom).then {
                $0.tag = i
                $0.setImage(Navs[i]?.withTintColor(.GRAY_500), for: .normal)
                $0.setImage(Navs[i], for: .selected)
                $0.imageView?.contentMode = .scaleAspectFit
                $0.addTarget(self, action: #selector(ButtonDidTap), for: .touchUpInside)
            }
            result.append(button)
        }
        return result
    }()
    
    private func setViewControllers() {
        let viewControllers = [EmptyViewController(),EmptyViewController(),EmptyViewController(),EmptyViewController(),EmptyViewController()]
        
        var result: [UIViewController] = []
        for i in viewControllers {
            let navigate = UINavigationController(rootViewController: i)
            navigate.navigationBar.isHidden = true
            result.append(navigate)
        }
        self.viewControllers = result
    }
    
    private let line = UIView().then {
        $0.backgroundColor = .GRAY_600
    }
    
    private let navigationBar = UIView().then {
        $0.backgroundColor = .WATCHA_BLACK
        $0.layer.cornerRadius = 0
        $0.clipsToBounds = false
    }
    
    private lazy var tabStackView = UIStackView(arrangedSubviews: Buttons).then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navigationBar)
        setViewControllers()
        setTabBar()
        setLayout()
        updateButtonStates(index: 0)
    }
    
    
    private func setTabBar() {
        tabBar.isHidden = true
        view.backgroundColor = .WATCHA_BLACK
        navigationBar.addSubviews(line,tabStackView)
    }
    
    private func setLayout() {
        
        line.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        navigationBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(34)
            $0.height.equalTo(94)
        }
        
        tabStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.top.equalToSuperview().offset(8)
            $0.height.equalTo(56)
        }
        
        Buttons.forEach { $0.snp.makeConstraints {
            $0.width.height.equalTo(50)
            }
        }
    }
    
    @objc
    private func ButtonDidTap(_ sender: UIButton) {
        selectedIndex = sender.tag
        updateButtonStates(index: sender.tag)
    }
    
    private func updateButtonStates(index: Int) {
        for i in Buttons.indices {
            if i == index {
                Buttons[i].isSelected = true
            } else {
                Buttons[i].isSelected = false
            }
        }
    }
    
//MARK: - endOfClass
}
