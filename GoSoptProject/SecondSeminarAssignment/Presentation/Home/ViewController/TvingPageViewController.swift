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
        
        hierarchy()
        layout()
        register()
        setControllers()
    }
    
    func register() {
        tvingPageViewController.delegate = self
        tvingPageViewController.dataSource = self
    }
    
    func hierarchy() {
        addChild(tvingPageViewController) // 홈 뷰컨에 child 뷰컨으로 페이지 뷰컨을 추가하고
        view.addSubview(tvingPageViewController.view) // 홈뷰에 페이지 뷰컨 뷰를 추가하고
        tvingPageViewController.didMove(toParent: self) // 페이지 뷰컨에게 알려준다
    }
    
    func layout() {
        tvingPageViewController.view.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    func setControllers() {
        if let firstHomePageViewController = tvingMainViewControllers.first {
            tvingPageViewController.setViewControllers(
                [firstHomePageViewController],
                direction: .forward,
                animated: true,
                completion: nil
            )
        }
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
