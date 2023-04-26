//
//  TvingHomePosterView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class TvingHomePosterSectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private var view = UIView()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        target()
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func target() {
        
    }
    
    private func style() {
        view.do{
            $0.backgroundColor = .systemPink
        }
    }
    
    private func hierarchy() {
        self.addSubview(view)
    }
    
    private func layout() {
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}



