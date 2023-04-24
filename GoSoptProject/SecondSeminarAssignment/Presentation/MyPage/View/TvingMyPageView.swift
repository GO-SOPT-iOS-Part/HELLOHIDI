//
//  TvingMyPageView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class TvingMyPageView: UIScrollView {
    
    //MARK: - UI Components
    
    private let tvingNavigationView = TvingNavigationView()
    private let tvingProfileView = TvingProfileView()
    private let tvingTicketView = TvingTicketView()
    public let tvingTableView = TvingTableView()
    
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
        self.do {
            $0.isScrollEnabled = true
        }
    }
    
    private func hierarchy() {
        self.addSubviews(
            tvingNavigationView,
            tvingProfileView,
            tvingTicketView,
            tvingTableView
        )
    }
    
    private func layout() {
        tvingNavigationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        tvingProfileView.snp.makeConstraints {
            $0.top.equalTo(self.tvingNavigationView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(103)
        }
        
        tvingTicketView.snp.makeConstraints {
            $0.top.equalTo(self.tvingProfileView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(355)
            $0.height.equalTo(164)
        }
        
        tvingTableView.snp.makeConstraints {
            $0.top.equalTo(self.tvingTicketView.snp.bottom).offset(24)
            $0.width.equalToSuperview()
            $0.height.equalTo(730)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}
    



