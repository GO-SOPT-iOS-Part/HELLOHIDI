//
//  TvingHomePageViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

class TvingPageViewController: BaseViewController {
    
    //MARK: - Properties
    
    private let tvingMainViewModel: TvingMainViewModel
    
    //MARK: - UI Components
    
    private let tvingMainNavigationView = TvingMainNavigationView()
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
    
    //MARK: - Life Cycle
    
    init(tvingMainViewModel: TvingMainViewModel) {
        self.tvingMainViewModel = tvingMainViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        
        hierarchy()
        layout()
        setControllers()
    }
    
    //MARK: - Custom Method
    
    func target() {
        tvingPageViewController.delegate = self
        tvingPageViewController.dataSource = self
        
        tvingTopBar.topBarCollectionView.dataSource = self
        
        tvingMainNavigationView.myPageButton.addTarget(self, action: #selector(myPageButtonDidTap), for: .touchUpInside)
    }
    
    func hierarchy() {
        addChild(tvingPageViewController) // 홈 뷰컨에 child 뷰컨으로 페이지 뷰컨을 추가하고
        view.addSubview(tvingPageViewController.view) // 홈뷰에 페이지 뷰컨 뷰를 추가하고
        tvingPageViewController.didMove(toParent: self) // 페이지 뷰컨에게 알려준다
        view.addSubviews(tvingMainNavigationView, tvingTopBar)
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
    
    //MARK: - Action Method
    
    @objc func myPageButtonDidTap() {
        pushToTvingMyPageView()
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
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            guard let index =  tvingMainViewControllers.firstIndex(of: tvingPageViewController.viewControllers?.first as! BaseViewController) else { return }
            self.tvingMainViewModel.updatePageTabbarViewState(index: index)
            self.tvingTopBar.topBarCollectionView.reloadData()
        }
    }
}

extension TvingPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvingMainViewModel.mainPageTabbarList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvingTopBarCollectionViewCell.cellIdentifier, for: indexPath) as? TvingTopBarCollectionViewCell else { return UICollectionViewCell() }
        
        cell.dataBind(tvingMainViewModel.mainPageTabbarList[indexPath.item])
        
        cell.handler = { [weak self] in
            guard let self else { return }
            
            self.tvingMainViewModel.updatePageTabbarViewState(index: indexPath.item)
            self.setControllers(
                index: self.tvingMainViewModel.tabbarIndex,
                direction:  self.tvingMainViewModel.direction
            )
            self.tvingTopBar.topBarCollectionView.reloadData()
        }

        return cell
    }
}

extension TvingPageViewController {
    func pushToTvingMyPageView() {
        let myPageViewController = TvingMyPageViewController()
        self.navigationController?.pushViewController(myPageViewController, animated: true)
    }
}
