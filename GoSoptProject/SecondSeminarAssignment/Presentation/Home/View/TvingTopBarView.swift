//
//  TvingTopBarView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

final class TvingTopBarView: UIView {
    
    //MARK: - UI Components
    
    public let topBarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        register()
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func register() {
        topBarCollectionView.register(TvingTopBarCollectionViewCell.self, forCellWithReuseIdentifier: TvingTopBarCollectionViewCell.cellIdentifier)
    }
    
    private func style() {
        topBarCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isScrollEnabled = false
            $0.showsVerticalScrollIndicator = false
            $0.alwaysBounceVertical = true
            $0.backgroundColor = .purple
        }
    }
    
    private func hierarchy() {
        self.addSubview(topBarCollectionView)
    }
    
    private func layout() {
        topBarCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
