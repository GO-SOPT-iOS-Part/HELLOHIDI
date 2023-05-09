//
//  TvingPopularChannelView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class TvingPopularChannelSectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private let channelDummy = Channel.dummy()
    
    //MARK: - UI Components
    
    public lazy var tvingPopularChannelCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        register()
        target()
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func register() {
        tvingPopularChannelCollectionView.register(TvingPopularChannelViewCell.self, forCellWithReuseIdentifier: TvingPopularChannelViewCell.cellIdentifier)
        tvingPopularChannelCollectionView.register(TvingPopularChannelHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TvingPopularChannelHeaderView.identifier)
    }
    
    private func target() {
        tvingPopularChannelCollectionView.dataSource = self
    }
    
    private func style() {
        tvingPopularChannelCollectionView.do{
            $0.backgroundColor = .tvingBlack
            $0.isScrollEnabled = false
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    private func hierarchy() {
        self.addSubview(tvingPopularChannelCollectionView)
    }
    
    private func layout() {
        tvingPopularChannelCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func createLayout() ->  UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(160),
            heightDimension: .absolute(155)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(30)
        )
        
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: headerSize,
          elementKind: UICollectionView.elementKindSectionHeader,
          alignment: .top)
        
        headerSupplementary.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0)
        
        section.boundarySupplementaryItems = [headerSupplementary]
        section.supplementariesFollowContentInsets = false
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension TvingPopularChannelSectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channelDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingPopularChannelViewCell.cellIdentifier, for: indexPath) as? TvingPopularChannelViewCell else { return UICollectionViewCell() }
        cell.dataBind(channelDummy[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TvingPopularChannelHeaderView.identifier, for: indexPath)
                as? TvingPopularChannelHeaderView else { return UICollectionReusableView() }
        return header
    }
}
