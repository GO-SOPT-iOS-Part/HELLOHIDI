//
//  TvingHomeViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

final class TvingHomeViewController: BaseViewController {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let rootView = TvingHomeView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
    
    //MARK: - Custom Method
    
    private func target() {
        rootView.tvingHomeView.delegate = self
        rootView.tvingHomeView.dataSource = self
    }
    
    //MARK: - Action Method
    
}
extension TvingHomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 498)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 202)
//        case 2:
//            return CGSize(width: 0, height: 0)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}
extension TvingHomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
            //        case 2:
            //            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingHomePosterSectionCell.cellIdentifier, for: indexPath) as? TvingHomePosterSectionCell else { return UICollectionViewCell() }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingContentSectionCell.cellIdentifier, for: indexPath) as? TvingContentSectionCell else { return UICollectionViewCell() }
            return cell
            //        case 2:
            //            return UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
    }
}


