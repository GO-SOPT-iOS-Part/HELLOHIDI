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
    
    private var topBarDummy = TopBar.dummy() {
        didSet {
            tvingTopBar.topBarCollectionView.reloadData()
        }
    }
    private var preIndex = 0
    private var direction: UIPageViewController.NavigationDirection = .forward
    
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
            $0.height.equalTo(120)
        }
        
        tvingPageViewController.view.snp.makeConstraints {
            $0.top.equalTo(self.tvingTopBar.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    func setControllers(index: Int = 0, direction: UIPageViewController.NavigationDirection = .forward) {
        let firstTvingPageViewController = tvingMainViewControllers[index]
        
        tvingPageViewController.setViewControllers(
            [firstTvingPageViewController],
            direction: direction,
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

extension TvingPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topBarDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingTopBarCollectionViewCell.cellIdentifier, for: indexPath) as? TvingTopBarCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(topBarDummy[indexPath.item])
        
        cell.handler = { [weak self] in
            guard let self else { return }
            
            for i in 0..<5 {
                if i == indexPath.item {
                    self.topBarDummy[i].isTapped = true
                } else {
                    self.topBarDummy[i].isTapped = false
                }
            }
            
            if indexPath.item < self.preIndex {
                self.direction = .reverse
            } else {
                self.direction = .forward
            }
            self.preIndex = indexPath.item
            self.setControllers(index: indexPath.item, direction:  self.direction)
            self.tvingTopBar.topBarCollectionView.reloadData()
        }

        return cell
    }
}
