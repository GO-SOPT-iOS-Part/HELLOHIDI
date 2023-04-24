//
//  TvingTicketView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class TvingTicketView: UIView {
    
    //MARK: - UI Components
    
    private let ticketView = UIView()
    private let ticketIcon = UIImageView()
    private let ticketLabel = UILabel()
    private let ticketStatusLabel = UILabel()
    private let cashIcon = UIImageView()
    private let cashLabel = UILabel()
    private let cashStatusLabel = UILabel()
    
    private let ticketDescribeView = UIView()
    private let ticketDescribeLabel = UILabel()
    private let ticketDescribeButton = UIButton()
    
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
        ticketView.do {
            $0.backgroundColor = .tvingGray5
            $0.makeCornerRadius(ratio: 3)
        }
        
        ticketIcon.do {
            $0.image = Image.ticket
        }
        
        ticketLabel.do {
            $0.text = "나의 이용권"
            $0.textColor = .tvingGray3
            $0.font = .tvingDisplay2
        }
        
        ticketStatusLabel.do {
            $0.text = "사용중인 이용권이 없습니다."
            $0.textColor = .tvingGray3
            $0.font = .tvingDisplay2
        }
        
        cashIcon.do {
            $0.image = Image.cash
        }
        
        cashLabel.do {
            $0.text = "티빙캐시"
            $0.textColor = .tvingGray3
            $0.font = .tvingDisplay2
        }
        
        cashStatusLabel.do {
            $0.text = "0"
            $0.textColor = .tvingGray1
            $0.font = .tvingTitle
        }
        
        ticketDescribeView.do {
            $0.backgroundColor = .tvingGray5
            $0.makeCornerRadius(ratio: 3)
        }
        
        ticketDescribeLabel.do {
            $0.text = "이용권을 구매하고 tvn jtbc 등 인기 TV프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!"
            $0.textColor = .tvingGray3
            $0.font = .tvingDisplay3
            $0.numberOfLines = 2
            $0.setLineSpacing(spacing: 7)
        }
        
        ticketDescribeButton.do {
            $0.setImage(Image.next, for: .normal)
        }
    }
    
    private func hierarchy() {
        self.addSubviews(ticketView, ticketDescribeView)
        
        ticketView.addSubviews(
            ticketIcon,
            ticketLabel,
            ticketStatusLabel,
            cashIcon,
            cashLabel,
            cashStatusLabel
        )
        
        ticketDescribeView.addSubviews(ticketDescribeLabel,ticketDescribeButton)
    }
    
    private func layout() {
        ticketView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(355)
            $0.height.equalTo(92)
        }
        
        ticketIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(11)
            $0.size.equalTo(23)
        }
        
        ticketLabel.snp.makeConstraints {
            $0.top.equalTo(self.ticketIcon)
            $0.leading.equalTo(self.ticketIcon.snp.trailing).offset(5)
            $0.width.equalTo(71)
            $0.height.equalTo(20)
        }
        
        ticketStatusLabel.snp.makeConstraints {
            $0.top.equalTo(self.ticketIcon)
            $0.trailing.equalToSuperview().inset(13)
            $0.width.equalTo(160)
            $0.height.equalTo(20)
        }
        
        cashIcon.snp.makeConstraints {
            $0.top.equalTo(self.ticketIcon.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(11)
            $0.size.equalTo(23)
        }
        
        cashLabel.snp.makeConstraints {
            $0.top.equalTo(self.cashIcon)
            $0.leading.equalTo(self.cashIcon.snp.trailing).offset(5)
            $0.width.equalTo(71)
            $0.height.equalTo(20)
        }
        
        cashStatusLabel.snp.makeConstraints {
            $0.top.equalTo(self.cashIcon)
            $0.trailing.equalToSuperview().inset(13)
            $0.width.equalTo(16)
            $0.height.equalTo(23)
        }
        
        ticketDescribeView.snp.makeConstraints {
            $0.top.equalTo(self.ticketView.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(355)
            $0.height.equalTo(60)
        }
        
        ticketDescribeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalToSuperview().offset(18)
            $0.width.equalTo(250)
            $0.height.equalTo(38)
        }
        
        ticketDescribeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.trailing.equalToSuperview().inset(22)
            $0.width.equalTo(18)
            $0.height.equalTo(16.5)
        }
    }
}
    


