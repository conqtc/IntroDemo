//
//  ViewController.swift
//  IntroDemo
//
//  Created by Alex Truong on 4/17/17.
//  Copyright © 2017 Alex Truong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    
    var pageController: UIPageViewController!
    var pages = [UIViewController]()
    
    var currentPage: Int!
    var pendingPage: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // setup page controller
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.delegate = self
        
        pageControl.numberOfPages = 5

        // setup pages
        pages = [UIViewController]()
        for index in 0..<5 {
            if let introView = storyboard?.instantiateViewController(withIdentifier: "Intro") as? IntroViewController {
                introView.image = UIImage(named: "I\(index)")
                introView.pageController = pageController
                if index == 4 {
                    introView.endIntro = true
                }
                pages.append(introView)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func startIntro(_ sender: UIButton) {
        currentPage = 0
        pageControl.currentPage = currentPage
        
        pageController.setViewControllers([pages[currentPage]], direction: .forward, animated: true, completion: nil)
        
        view.addSubview(pageController.view)
        view.bringSubview(toFront: pageControl)
    }
}

extension ViewController: UIPageViewControllerDelegate {
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

extension ViewController: UIPageViewControllerDataSource {
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

