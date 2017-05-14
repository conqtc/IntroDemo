//
//  PageViewCell.swift
//  IntroDemo
//
//  Created by Alex Truong on 4/17/17.
//  Copyright © 2017 Alex Truong. All rights reserved.
//

import UIKit

class PageViewCell: UITableViewCell {

    @IBOutlet weak var pageControl: UIPageControl!
    
    var pageController: UIPageViewController!
    var pages: [UIViewController]!
    
    var currentPage: Int!
    var pendingPage: Int!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // setup page controller
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.delegate = self

        currentPage = 0

        pageControl.numberOfPages = 5
        pageControl.currentPage = currentPage
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func startPageView() {
        pageController.setViewControllers([pages[currentPage]], direction: .forward, animated: true, completion: nil)
        
        contentView.addSubview(pageController.view)
        contentView.bringSubview(toFront: pageControl)
    }
}

extension PageViewCell: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let introView = pendingViewControllers.first {
            let index = pages.index(of: introView)
            pendingPage = index
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            currentPage = pendingPage
            pageControl.currentPage = currentPage
        }
    }
}

extension PageViewCell: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = pages.index(of: viewController)!
        index = index - 1
        
        if index < 0 {
            return nil
        } else {
            return pages[index]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = pages.index(of: viewController)!
        index = index + 1
        
        if index >= pages.count {
            return nil
        } else {
            return pages[index]
        }
    }
}
