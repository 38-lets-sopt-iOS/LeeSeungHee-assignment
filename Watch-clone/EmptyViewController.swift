//
//  EmptyViewController.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 4/30/26.
//

import UIKit

import SnapKit
import Then

class EmptyViewController : UIViewController {
    
    let emptyLabel = UILabel().then {
        $0.text = " . . 텅 ~"
        $0.font = .pretendard(size: 30, weight: .bold)
        $0.textColor = .WATCHA_GREEN
    }
    
    let mandoo = UIImageView().then {
        $0.image = .mandoo
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    func setUI() {
        view.backgroundColor = .WATCHA_BLACK
        view.addSubviews(emptyLabel,mandoo)
    }
    
    func setLayout(){
        emptyLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(300)
            $0.leading.equalToSuperview().offset(50)
        }
        
        mandoo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
    }
}
