//
//  TvingPopularChannelHeaderView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/28.
//

import UIKit

import SnapKit
import Then

final class TvingPopularChannelHeaderView: UICollectionReusableView {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let channelSectionTitleLabel = UILabel()
    private lazy var fullButton = UIButton()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func style() {
        channelSectionTitleLabel.do {
            $0.text = "인기 LIVE"
            $0.textColor = .tvingWhite
            $0.font = .tvingDisplay1
        }
        
        fullButton.do {
            $0.setTitle("전체보기", for: .normal)
            $0.setImage(Image.next, for: .normal)
            $0.setTitleColor(.tvingGray3, for: .normal)
            $0.imageView?.contentMode = .scaleAspectFit
            $0.titleLabel?.font = .tvingSubTitle2
            $0.semanticContentAttribute = .forceRightToLeft //<- 중요
        }
    }
    
    private func hierarchy() {
        self.addSubviews(channelSectionTitleLabel, fullButton)
    }
    
    private func layout() {
        channelSectionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(168)
            $0.height.equalTo(30)
        }
        
        fullButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(5)
            $0.width.equalTo(55)
            $0.height.equalTo(25)
        }
    }
    
    //MARK: - Action Method
}

