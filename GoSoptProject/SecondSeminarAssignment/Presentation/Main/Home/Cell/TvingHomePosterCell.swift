//
//  TvingHomePosterCell.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/27.
//

import UIKit

import SnapKit
import Then

final class TvingHomePosterCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private lazy var posterImage = UIImageView()
    
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
    
    private func style() {}
    
    private func hierarchy() {
        contentView.addSubview(posterImage)
    }
    
    private func layout() {
        posterImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(498)
        }
    }
    
    func dataBind(_ poster: Poster) {
        posterImage.image = poster.image
    }
    //MARK: - Action Method
    
}

