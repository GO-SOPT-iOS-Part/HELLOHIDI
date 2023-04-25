//
//  TvingHomePageViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

class TvingPageViewController: UIPageViewController {
    
    //MARK: - Properties
    
    private let topBarDummy = TopBar.dummy()
    
    //MARK: - UI Components
    
    private let tvingTopBar = TvingTopBarView()
    private let tvingPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let tvingHomeViewController = TvingHomeViewController()
    private let tvingStreamingViewController = TvingStreamingViewController()
    private let tvingTVProgramViewController = TvingTVProgramViewController()
    private let tvingMovieViewController = TvingMovieViewController()
    private let tvingParamountViewController = TvingParamountViewController()
    
    // 하나의 배열로 묶어준다.
    lazy var tvingMainViewControllers = [
        tvingHomeViewController,
        tvingStreamingViewController,
        tvingTVProgramViewController,
        tvingMovieViewController,
        tvingParamountViewController
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        
        hierarchy()
        layout()
        setControllers()
    }
    
    func target() {
        tvingPageViewController.delegate = self
        tvingPageViewController.dataSource = self
        
        tvingTopBar.topBarCollectionView.delegate = self
        tvingTopBar.topBarCollectionView.dataSource = self
    }
    
    func hierarchy() {
        view.addSubview(tvingTopBar)
        addChild(tvingPageViewController) // 홈 뷰컨에 child 뷰컨으로 페이지 뷰컨을 추가하고
        view.addSubview(tvingPageViewController.view) // 홈뷰에 페이지 뷰컨 뷰를 추가하고
        tvingPageViewController.didMove(toParent: self) // 페이지 뷰컨에게 알려준다
    }
    
    func layout() {
        tvingTopBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        tvingPageViewController.view.snp.makeConstraints {
            $0.top.equalTo(self.tvingTopBar.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    func setControllers() {
        guard let firstTvingPageViewController = tvingMainViewControllers.first else { return }
        
        tvingPageViewController.setViewControllers(
            [firstTvingPageViewController],
            direction: .forward,
            animated: true,
            completion: nil
        )
    }
}

extension TvingPageViewController: UIPageViewControllerDelegate {}
extension TvingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = tvingMainViewControllers.firstIndex(of: viewController as! BaseViewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return tvingMainViewControllers[previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = tvingMainViewControllers.firstIndex(of: viewController as! BaseViewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == tvingMainViewControllers.count {
            return nil
        }
        return tvingMainViewControllers[nextIndex]
    }
}


extension TvingPageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(#function)
        return CGSize(width: 75, height: 100)
    }
}

extension TvingPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#function)
        return topBarDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingTopBarCollectionViewCell.cellIdentifier, for: indexPath) as? TvingTopBarCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(topBarDummy[indexPath.item])
        return cell
    }
    
    
}
