//
//  IntroViewController.swift
//  IntroDemo
//
//  Created by Alex Truong on 4/17/17.
//  Copyright © 2017 Alex Truong. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?
    weak var pageController: UIPageViewController?
    var endIntro: Bool = false

    @IBOutlet weak var endButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = image
        endButton.isHidden = !endIntro
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func endIntro(_ sender: UIButton) {
        pageController?.view.removeFromSuperview()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
