//
//  ViewController.swift
//  Avaliacao2
//
//  Created by RENATA on 15/04/21.
//

import UIKit

class ViewController: UIViewController {
    private var pages = Page.allCases
    private var currentIndex = 0

    private lazy var pageController: UIPageViewController = {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return pageController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decoratePageController()
        setupPageController()
        addInitialPage()
    }
    
    private func decoratePageController() {
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [ViewController.self])
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        
        print(pageControl.currentPage)
    }
    
    private func setupPageController() {
        pageController.dataSource = self
        pageController.delegate = self
        pageController.view.backgroundColor = .white
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(pageController)
        view.addSubview(pageController.view)
        
        NSLayoutConstraint(item: pageController.view!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: pageController.view!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: pageController.view!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: pageController.view!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        
        pageController.didMove(toParent: self)
    }
    private func addInitialPage() {
        let initialPage = PageViewController(with: pages[0])
        pageController.setViewControllers([initialPage], direction: .forward, animated: false, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Segue") {
            let vc = segue.destination as! MainViewController
        }
    }
}

extension ViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = (viewController as? PageViewController)?.page.index,
              index > 0 else {
            return nil
        }
        
        currentIndex = index - 1
        
        return PageViewController(with: pages[currentIndex])
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = (viewController as? PageViewController)?.page.index,
              index < pages.count - 1 else {
            return nil
        }
        currentIndex = index + 1
        
        return PageViewController(with: pages[currentIndex])
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        currentIndex
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        if completed {
            if currentIndex == 2 {
                UserDefaultsOK.shared.defaults.set(true, forKey: "onboardingDone")
            }
        }
    }
}
