//
//  Nav1ViewController.swift
//  Watch-clone
//
//  Created by 초긍정행운의포춘쿠키 on 5/1/26.
//

import UIKit

import SnapKit
import Then

class SubscribeViewController : UIViewController {
    
    //MARK: - Properties
    private let model1List = Model1.dummy()
    private let model2List = Model2.dummy()
    private let model3List = Model3.dummy()
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .WATCHA_BLACK
    }
    
    private let contentView = UIView().then {
        $0.backgroundColor = .WATCHA_BLACK
    }
    
    private let contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 30
    }
    
    lazy var topBar = UIView().then{
        $0.addSubviews(line,stack)
    }
    
    lazy var stack =  UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 20
        $0.addArrangedSubviews(videoButton,notificationButton,profileButton)
    }
    
    let videoButton = UIButton().then{
        $0.setImage(.video, for: .normal)
    }
    let notificationButton = UIButton().then{
        $0.setImage(.notification, for: .normal)
    }
    let profileButton = UIButton().then{
        $0.setImage(.profile, for: .normal)
    }
    
    private let line = UIView().then {
        $0.backgroundColor = .GRAY_600
    }
    
    private lazy var mainCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeMainLayout()
    ).then {
        $0.backgroundColor = .WATCHA_BLACK
        $0.showsHorizontalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(
            MainCollectionViewCell.self,
            forCellWithReuseIdentifier: MainCollectionViewCell.identifier
        )
    }
    
    private lazy var newContentCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeVerticalLayout()
    ).then {
        $0.backgroundColor = .WATCHA_BLACK
        $0.showsHorizontalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(
            VerticalCollectionViewCell.self,
            forCellWithReuseIdentifier: VerticalCollectionViewCell.identifier
        )
    }
    
    private lazy var watchaCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeHorizontalLayout()
    ).then {
        $0.backgroundColor = .WATCHA_BLACK
        $0.showsHorizontalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(
            HorizontalCollectionViewCell.self,
            forCellWithReuseIdentifier: HorizontalCollectionViewCell.identifier
        )
    }
    
    private lazy var openCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeHorizontalLayout()
    ).then {
        $0.backgroundColor = .WATCHA_BLACK
        $0.showsHorizontalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(
            HorizontalCollectionViewCell.self,
            forCellWithReuseIdentifier: HorizontalCollectionViewCell.identifier
        )
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        
    }
    
    func setUI(){
        view.backgroundColor = .WATCHA_BLACK
        view.addSubviews(topBar, scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(makeScrollTitleView())
        contentStackView.addArrangedSubview(makeSectionView(title: nil, subtitle: nil, cap: nil, collectionView: mainCollectionView, height: 395))
        contentStackView.addArrangedSubview(makeSectionView(title: "방금 막 도착한 신상 콘텐츠", subtitle: "예능부터 드라마까지!",cap: nil, collectionView: newContentCollectionView, height: 191))
        contentStackView.addArrangedSubview(makeWatgorythmSectionView())
        contentStackView.addArrangedSubview(makeSectionView(title: "공개 예정 콘텐츠", subtitle: nil, cap: "더보기", collectionView: openCollectionView, height: 153))
    }
    
    func setLayout(){

        topBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44)
            $0.leading.trailing.equalToSuperview().inset(1)
            $0.height.equalTo(56)
        }
        line.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        stack.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(17)
        }
        videoButton.snp.makeConstraints {
            $0.height.equalTo(24)
        }
        notificationButton.snp.makeConstraints {
            $0.height.equalTo(24)
        }
        profileButton.snp.makeConstraints {
            $0.height.equalTo(24)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(topBar.snp.bottom)
            $0.bottom.equalToSuperview().inset(133)
            $0.leading.trailing.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        contentStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    //MARK: endOfClass
}

extension SubscribeViewController {
    private func makeMainLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 276, height: 395)
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        return layout
    }
    
    private func makeVerticalLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 339, height: 191)
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return layout
    }
    
    private func makeHorizontalLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 103, height: 153)
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return layout
    }
    
    private func makeSectionView(title: String?, subtitle: String?, cap: String?, collectionView: UICollectionView, height: CGFloat) -> UIView {
        let sectionView = UIView().then {
            $0.backgroundColor = .WATCHA_BLACK
        }
        
        let titleLabel = UILabel().then {
            $0.text = title
            $0.textColor = .WATCHA_WHITE
            $0.font = .head3
        }
        
        let subtitleLabel = UILabel().then {
            $0.text = subtitle
            $0.textColor = .GRAY_100
            $0.font = .subhead1
        }
        
        let capLabel = UILabel().then{
            $0.text = cap
            $0.textColor = .GRAY_100
            $0.font = .cap1
        }
        
        sectionView.addSubviews(titleLabel, subtitleLabel, capLabel, collectionView)
        
        if title == nil {
            titleLabel.isHidden = true
            subtitleLabel.isHidden = true
            collectionView.snp.makeConstraints {
                $0.top.bottom.equalToSuperview()
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(height)
            }
        } else {
            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.trailing.equalToSuperview().inset(20)
            }
            subtitleLabel.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(4)
                $0.leading.trailing.equalToSuperview().inset(20)
            }
            capLabel.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(22)
                $0.centerY.equalTo(titleLabel)
                
            }
            collectionView.snp.makeConstraints {
                $0.top.equalTo(subtitleLabel.snp.bottom).offset(14)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(height)
                $0.bottom.equalToSuperview()
            }
        }
        
        return sectionView
    }
    
    private func makeWatgorythmSectionView() -> UIView {
        let sectionView = UIView()
        
        let titleImageView = UIImageView().then {
            $0.image = .watgorythm
            $0.contentMode = .scaleAspectFit
        }
        
        let subtitleLabel = UILabel().then {
            $0.text = "예능부터 드라마까지!"
            $0.textColor = .GRAY_100
            $0.font = .subhead1
        }
        
        let capLabel = UILabel().then {
            $0.text = "더보기"
            $0.textColor = .GRAY_100
            $0.font = .cap1
        }
        
        sectionView.addSubviews(titleImageView, subtitleLabel, capLabel, watchaCollectionView)
        
        titleImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(90)
            $0.height.equalTo(28)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleImageView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        capLabel.snp.makeConstraints {
            $0.bottom.equalTo(subtitleLabel.snp.bottom).offset(-11)
            $0.trailing.equalToSuperview().inset(22)
        }
        watchaCollectionView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(153)
            $0.bottom.equalToSuperview()
        }
        
        return sectionView
    }

    
     private func makeScrollTitleView() -> UIView {
        let titleView = UIView()
    let titleLabel = UILabel().then {
            $0.text = "구독"
           $0.textColor = .WATCHA_WHITE
            $0.font = .head1
         }
        titleView.addSubview(titleLabel)
         titleLabel.snp.makeConstraints {
           $0.top.bottom.equalToSuperview()
             $0.leading.trailing.equalToSuperview().inset(24)
       }
        return titleView
    }
}

extension SubscribeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCollectionView {
            return model1List.count
        }
        if collectionView == newContentCollectionView {
            return model3List.count
        }
        if collectionView == watchaCollectionView {
            return model2List.count
        }
        if collectionView == openCollectionView {
            return model2List.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MainCollectionViewCell.identifier,
                for: indexPath
            ) as? MainCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(model1List[indexPath.item])
            return cell
        }
        
        if collectionView == newContentCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: VerticalCollectionViewCell.identifier,
                for: indexPath
            ) as? VerticalCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(model3List[indexPath.item])
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HorizontalCollectionViewCell.identifier,
            for: indexPath
        ) as? HorizontalCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(model2List[indexPath.item])
        return cell
    }
}
