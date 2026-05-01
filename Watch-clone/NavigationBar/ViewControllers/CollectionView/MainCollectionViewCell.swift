//
//  MainCollectionViewCell.swift
//  Watch-clone
//

import UIKit

import SnapKit
import Then

final class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"

    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
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

    func dataBind(_ model: Model1) {
        posterImageView.image = model.poster
    }
}
