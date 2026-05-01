//
//  VerticalCollectionViewCell.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 5/1/26.
//

import UIKit

import SnapKit
import Then

final class VerticalCollectionViewCell: UICollectionViewCell {
    static let identifier = "VerticalCollectionViewCell"

    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }

    private func setUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(posterImageView)
    }

    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func dataBind(_ model: Model3) {
        posterImageView.image = model.poster
    }
}
