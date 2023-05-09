//
//  TvingMainViewModel.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/25.
//

import UIKit

final class TvingMainViewModel {
    
    var mainPageTabbarList: [TopBar] = TopBar.dummy()
    
    // 현재 인덱스
    var preIndex: Int = 0
    var tabbarIndex: Int = 0
    var direction: UIPageViewController.NavigationDirection = .forward
    
    func updatePageViewControllerState() {
        mainPageTabbarList[preIndex].isTapped = false
        mainPageTabbarList[tabbarIndex].isTapped = true
    }
    
    func updatePageTabbarViewState(index: Int) {
        tabbarIndex = index
        mainPageTabbarList[preIndex].isTapped = false
        mainPageTabbarList[tabbarIndex].isTapped = true
        direction = preIndex < tabbarIndex ? .forward : .reverse
        preIndex = tabbarIndex
        print(tabbarIndex, preIndex)
    }
}


