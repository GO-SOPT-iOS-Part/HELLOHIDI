//
//  TvingHomePosterSectionCell.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/27.
//

import UIKit

import SnapKit
import Then

final class TvingHomePosterSectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private let posterDummy = Poster.dummy()
    
    //MARK: - UI Components
    
    private lazy var tvingHomePosterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        tvingHomePosterCollectionView.register(TvingHomePosterCell.self, forCellWithReuseIdentifier: TvingHomePosterCell.cellIdentifier)
    }
    
    private func target() {
        tvingHomePosterCollectionView.delegate = self
        tvingHomePosterCollectionView.dataSource = self
    }
    
    private func style() {
        tvingHomePosterCollectionView.do{
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0 // 상하간격
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.collectionViewLayout = layout
            $0.isPagingEnabled = true
        }
    }
    
    private func hierarchy() {
        self.addSubview(tvingHomePosterCollectionView)
    }
    
    private func layout() {
        tvingHomePosterCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TvingHomePosterSectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 498)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        print(#function)
        
    }
}

extension TvingHomePosterSectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posterDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingHomePosterCell.cellIdentifier, for: indexPath) as? TvingHomePosterCell else { return UICollectionViewCell() }
        cell.dataBind(posterDummy[indexPath.item])
        return cell
    }
}

/*
 
 스크롤뷰: 사용자가 터치를 끝낸 스크롤 뷰 객체.
 
 속도: 터치가 해제된 순간 스크롤 뷰의 속도(밀리초당 포인트).
 
 타겟 콘텐츠 오프셋: 스크롤 동작이 정지로 감속할 때 예상되는 오프셋.
 
 애플리케이션은 targetContentOffset 매개 변수의 값을 변경하여 스크롤뷰가 스크롤 애니메이션을 완료하는 위치를 조정할 수 있습니다.
 
 */
