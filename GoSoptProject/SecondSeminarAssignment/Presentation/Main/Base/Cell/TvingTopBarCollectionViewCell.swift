//
//  TvingTopBarCollectionViewCell.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

final class TvingTopBarCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var handler: (() -> (Void))?
    
    //MARK: - UI Components
    
    lazy var titleButton = UIButton()
    lazy var underLineView = UIView()
    
    
    //MARK: - Life Cycle
    
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
    
    //MARK: - Custom Method
    
    override func prepareForReuse() {
        configCellUI()
    }
    
    func target() {
        titleButton.addTarget(self, action: #selector(titleButtonDidTap), for: .touchUpInside)
    }
    
    func cellStyle() {
        titleButton.do {
            $0.titleLabel?.textAlignment = .center
            $0.backgroundColor = .clear
            $0.titleLabel?.font = .tvingTopBarDisplay
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
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(self.titleButton.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(self.titleButton)
            $0.height.equalTo(5)
        }
    }
    
    @objc func titleButtonDidTap() {
        handler?()
    }
}

extension TvingTopBarCollectionViewCell {
    func configCellUI() {
        titleButton.setTitleColor(.tvingWhite, for: .normal)
        underLineView.backgroundColor = .clear
    }
    
    func dataBind(_ topBar: TopBar) {
        titleButton.setTitle(topBar.title, for: .normal)
        if topBar.isTapped {
            titleButton.setTitleColor(.tvingWhite, for: .normal)
            underLineView.backgroundColor = .tvingWhite
        }
    }
}

