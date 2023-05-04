//
//  TvingHomePageViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

final class TvingMainViewController: BaseViewController {
    
    //MARK: - UI Components
    
    private let tvingMainNavigationView = TvingMainNavigationView()
    private let tvingTopBar = TvingTopBarView()
    private let tvingTopStickyView = TvingTopStickyView()
    
    private let tvingPageViewController = TvingPageViewController(tvingMainViewModel: TvingMainViewModel())
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvingTopStickyView.isHidden = true
        tvingTopStickyView.backgroundColor = .tvingBlack
        target()
        
        hierarchy()
        layout()
    }
    
    //MARK: - Custom Method
    
    func target() {
        tvingPageViewController.delegate = self
        tvingPageViewController.dataSource = self
        tvingTopBar.topBarCollectionView.dataSource = self
        tvingTopStickyView.topBarStickyCollectionView.dataSource = self
        
        tvingMainNavigationView.myPageButton.addTarget(self, action: #selector(myPageButtonDidTap), for: .touchUpInside)
        tvingPageViewController.tvingHomeViewController.delegate = self
    }
    
    func hierarchy() {
        addChild(tvingPageViewController)
        view.addSubviews(tvingPageViewController.view, tvingTopStickyView)
        tvingPageViewController.didMove(toParent: self)
        tvingPageViewController.view.addSubviews(tvingMainNavigationView, tvingTopBar)
        
    }
    
    func layout() {
        tvingPageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tvingMainNavigationView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(58)
            $0.width.equalToSuperview()
            $0.height.equalTo(36)
        }
        
        tvingTopBar.snp.makeConstraints {
            $0.top.equalTo(self.tvingMainNavigationView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(41)
        }
        
        tvingTopStickyView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
    
    //MARK: - Action Method
    
    @objc func myPageButtonDidTap() {
        pushToTvingMyPageView()
    }
}

extension TvingMainViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print(#function)
        if completed {
            guard let index =  tvingPageViewController.tvingMainViewControllers.firstIndex(of: tvingPageViewController.viewControllers?.first as! BaseViewController) else { return }
            self.tvingPageViewController.tvingMainViewModel.updatePageTabbarViewState(index: index)
            self.tvingTopBar.topBarCollectionView.reloadData()
        }
    }
}
extension TvingMainViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = tvingPageViewController.tvingMainViewControllers.firstIndex(of: viewController as! BaseViewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        
        return tvingPageViewController.tvingMainViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = tvingPageViewController.tvingMainViewControllers.firstIndex(of: viewController as! BaseViewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == tvingPageViewController.tvingMainViewControllers.count {
            return nil
        }
        
        return tvingPageViewController.tvingMainViewControllers[nextIndex]
    }
}




extension TvingMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvingPageViewController.tvingMainViewModel.mainPageTabbarList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingTopBarCollectionViewCell.cellIdentifier, for: indexPath) as? TvingTopBarCollectionViewCell else { return UICollectionViewCell() }
        
        
        cell.dataBind(tvingPageViewController.tvingMainViewModel.mainPageTabbarList[indexPath.item])
        
        cell.handler = { [weak self] in
            guard let self else { return }
            
            self.tvingPageViewController.tvingMainViewModel.updatePageTabbarViewState(index: indexPath.item)
            self.tvingPageViewController.setControllers(
                index: self.tvingPageViewController.tvingMainViewModel.tabbarIndex,
                direction:  self.tvingPageViewController.tvingMainViewModel.direction
            )
            self.tvingTopBar.topBarCollectionView.reloadData()
            self.tvingTopStickyView.topBarStickyCollectionView.reloadData()
        }
        
        return cell
    }
}

extension TvingMainViewController {
    func pushToTvingMyPageView() {
        let myPageViewController = TvingMyPageViewController()
        self.navigationController?.pushViewController(myPageViewController, animated: true)
    }
}

extension TvingMainViewController: HomeViewScroll {
    func steakyHeader(_ part: Int) {
        switch part {
        case 0:
            tvingMainNavigationView.isHidden = false
            tvingTopBar.isHidden = false
            tvingTopStickyView.isHidden = true
        case 1:
            tvingMainNavigationView.isHidden = true
            tvingTopBar.isHidden = true
            tvingTopStickyView.isHidden = true
            tvingTopStickyView.backgroundColor = .clear
        case 2:
            tvingMainNavigationView.isHidden = true
            tvingTopBar.isHidden = true
            tvingTopStickyView.isHidden = false
            tvingTopStickyView.backgroundColor = .tvingBlack
            tvingTopStickyView.alpha = 0.7
        case 3:
            tvingMainNavigationView.isHidden = true
            tvingTopBar.isHidden = true
            tvingTopStickyView.isHidden = false
            tvingTopStickyView.alpha = 1
        default:
            break
        }
    }
}
