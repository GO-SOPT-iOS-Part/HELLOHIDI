//
//  TvingTopBarCollectionViewCell.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

final class TvingTopBarCollectionViewCell: UICollectionViewCell {
    
    lazy var titleButton = UIButton()
    lazy var underLineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        target()
        
        cellStyle()
        hierarchy()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        configCellUI()
    }
    
    func target() {
    }
    
    func cellStyle() {
        titleButton.do {
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.textAlignment = .center
            $0.backgroundColor = .green
        }
        
        underLineView.do {
            $0.backgroundColor = .clear
        }
    }
    
    func hierarchy() {
        contentView.addSubviews(titleButton, underLineView)
    }
    
    func layout() {
        titleButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(3)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(self.titleButton.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(5)
        }
    }
}

extension TvingTopBarCollectionViewCell {
    func configCellUI() {
        titleButton.setTitleColor(.black, for: .normal)
        underLineView.backgroundColor = .black
    }
    
    func dataBind(_ topBar: TopBar) {
        titleButton.setTitle(topBar.title, for: .normal)
        underLineView.isHidden = !topBar.isTapped
    }
}

