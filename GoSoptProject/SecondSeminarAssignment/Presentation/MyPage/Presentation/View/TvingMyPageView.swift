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
    private let tvingSettingTableView = TvingSettingTableView()
    private let separtor = UIView()
    private let tvingInfoTableView = TvingInfoTableView()
    
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
        separtor.do {
            $0.backgroundColor = .tvingGray1
        }
    }
    
    private func hierarchy() {
        self.addSubviews(
            tvingNavigationView,
            tvingProfileView,
            tvingTicketView,
            tvingSettingTableView,
            separtor,
            tvingInfoTableView
        )
    }
    
    private func layout() {
        tvingNavigationView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
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
            $0.height.equalTo(92)
        }
        
        tvingSettingTableView.snp.makeConstraints {
            $0.top.equalTo(self.tvingTicketView.snp.bottom).offset(12)
            $0.width.equalToSuperview()
            $0.height.equalTo(354)
        }
        
        separtor.snp.makeConstraints {
            $0.top.equalTo(self.tvingSettingTableView.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(359)
            $0.height.equalTo(1)
        }
        
        tvingInfoTableView.snp.makeConstraints {
            $0.top.equalTo(self.separtor.snp.bottom).offset(16)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
    }
}
    



