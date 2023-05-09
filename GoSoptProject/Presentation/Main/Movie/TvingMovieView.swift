//
//  TvingMovieView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

final class TvingMovieView: UIView {
    
    //MARK: - UI Components
    
    private var view = UIView()
    
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
        view.do{
            $0.backgroundColor = .orange
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


