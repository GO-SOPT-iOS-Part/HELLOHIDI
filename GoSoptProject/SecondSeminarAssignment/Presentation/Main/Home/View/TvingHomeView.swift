//
//  TvingHomeView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

final class TvingHomeView: UIView {
    
    //MARK: - UI Components
    
    public lazy var tvingHomeView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let tvingContentSectionCell = TvingContentSectionCell()
    
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
        tvingHomeView.register(TvingHomePosterSectionCell.self, forCellWithReuseIdentifier: TvingHomePosterSectionCell.cellIdentifier)
        tvingHomeView.register(TvingContentSectionCell.self, forCellWithReuseIdentifier: TvingContentSectionCell.cellIdentifier)
        tvingHomeView.register(TvingPopularChannelSectionCell.self, forCellWithReuseIdentifier: TvingPopularChannelSectionCell.cellIdentifier)
    }
    
    private func style() {
        tvingHomeView.do{
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 0 // 상하간격
            layout.scrollDirection = .vertical
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = true
            $0.collectionViewLayout = layout
            $0.contentInsetAdjustmentBehavior = .never
            $0.backgroundColor = .tvingBlack
        }
    }
    
    private func hierarchy() {
        self.addSubview(tvingHomeView)
    }
    
    private func layout() {
        tvingHomeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
