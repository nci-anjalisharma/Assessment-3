//
//  PageViewController.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 02/07/26.
//


import UIKit
import SnapKit

class PageViewController: UIViewController {
    
    var movies: [ArticleModel] = []
    
    var pages: [DetailViewController] = []
    
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        
        return pageViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        
        pageViewController.view.snp.makeConstraints { make in 
            make.edges.equalToSuperview()
        }
        pageViewController.didMove(toParent: self)
        
    }
    
    func configure(with movies: [ArticleModel]){
        self.movies = movies
        pages = movies.map {
            let vc = DetailViewController()
            vc.configure(with: $0)
            
            return vc
        }
        
        guard let first = pages.first else { return }
        pageViewController.setViewControllers([first], direction: .forward, animated: true)
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? DetailViewController, let index = pages.firstIndex(of: vc), index > 0 else { return nil }
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? DetailViewController, let index = pages.firstIndex(of: vc), index < pages.count - 1 else { return nil }
        return pages[index + 1]
    }
}
