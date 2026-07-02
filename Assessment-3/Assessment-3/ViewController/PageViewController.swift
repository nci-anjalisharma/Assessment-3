//
//  PageViewController.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 02/07/26.
//


import UIKit

class PageViewController: UIViewController {
    
    var pageViewArray: [PageModel] = []
    
    var homeViewModel: HomeViewModel?
    
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return pageViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewController.dataSource = self
        
    }
    
    private func setupPages(){
        
        homeViewModel
        if let first = pageViewArray.first{
            pageViewController.setViewControllers([first], direction: .forward, animated: true)
        }
    }
}


extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pageViewArray.firstIndex(of: viewController as! PageViewController) else { return nil }
        return pageViewArray(index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pageViewArray.firstIndex(of: viewController as! PageViewController) else { return nil }
        return pageViewArray(index + 1)
    }
}
