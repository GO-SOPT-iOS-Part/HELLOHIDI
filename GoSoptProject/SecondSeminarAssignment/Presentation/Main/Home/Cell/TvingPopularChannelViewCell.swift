////
////  Tving.swift
////  GoSoptProject
////
////  Created by 류희재 on 2023/04/27.
////
//
//import UIKit
//
//import SnapKit
//import Then
//
//final class TvingPopularChannelViewCell: UICollectionViewCell {
//    
//    //MARK: - Properties
//    
//    //MARK: - UI Components
//    
//    private let channelImageView = UIImageView()
//    private let channelTitleLabel = UILabel()
//    private let contentTitleLabel = UILabel()
//    private let ratingLabel = UILabel()
//    
//    //MARK: - Life Cycle
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        style()
//        hierarchy()
//        layout()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    //MARK: - Custom Method
//    
//    private func style() {}
//    
//    private func hierarchy() {
//        contentView.addSubviews(
//            channelImageView,
//            channelTitleLabel,
//            contentTitleLabel,
//            ratingLabel
//        )
//    }
//    
//    private func layout() {
//        contentImageView.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.width.equalToSuperview()
//            $0.height.equalTo(146)
//        }
//        
//        contentTitleLabel.snp.makeConstraints {
//            $0.top.equalTo(self.contentImageView.snp.bottom).offset(3)
//            $0.width.equalToSuperview()
//        }
//    }
//    
//    func dataBind(_ cotent: Content) {
//        contentImageView.image = cotent.image
//        contentTitleLabel.text = cotent.title
//    }
//    //MARK: - Action Method
//    
//}
//
