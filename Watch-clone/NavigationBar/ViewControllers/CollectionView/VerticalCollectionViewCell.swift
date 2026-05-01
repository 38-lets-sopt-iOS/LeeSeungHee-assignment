//
//  VerticalCollectionViewCell.swift
//  Watch-clone
//
//  Wide poster collection view cell.
//

import UIKit

import SnapKit
import Then

// MARK: - VerticalCollectionViewCell

/// b1.png 같은 가로형 포스터 하나를 보여주는 컬렉션뷰 셀입니다.
///
/// 이 셀은 339 x 191 크기로 쓰는 것을 기준으로 만들었습니다.
/// 실제 크기는 이 셀 내부가 아니라 VerticalSectionTableViewCell의
/// collection view layout itemSize에서 결정됩니다.
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

    func dataBind(_ model: Model2) {
        posterImageView.image = model.poster
    }
}
