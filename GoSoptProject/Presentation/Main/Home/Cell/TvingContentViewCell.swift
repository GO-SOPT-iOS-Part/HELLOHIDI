//
//  TvingContentViewCell.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class TvingContentViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private lazy var contentImageView = UIImageView()
    private lazy var contentTitleLabel = UILabel()
    
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
        contentTitleLabel.do {
            $0.font = .tvingToastMessage
            $0.textColor = .tvingGray3
        }
    }
    
    private func hierarchy() {
        contentView.addSubviews(
            contentImageView,
            contentTitleLabel
        )
    }
    
    private func layout() {
        contentImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(146)
        }
        
        contentTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.contentImageView.snp.bottom).offset(3)
            $0.width.equalToSuperview()
        }
    }
    
    func dataBind(_ content: Result?) {
        guard let postURL = content?.posterPath else { return }
        contentImageView.kfSetImage(url: "https://image.tmdb.org/t/p/original/\(postURL)")
        contentTitleLabel.text = content?.title
    }
    
    //MARK: - Action Method
    
}
