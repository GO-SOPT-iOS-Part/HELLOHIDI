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
    public lazy var topBarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
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
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(85))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // section
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
