//
//  OnboardingViewController.swift
//  BiblioLand
//
//  Created by Feidora Nadia Putri on 22/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UIScrollViewDelegate {
   
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
//  data for onboarding slides
    var titles = ["Find the book you\nwant to read", "Borrowing is now\neasy and safe", "Lend your books to\nsomeone else"]
    var descriptions = ["Find the book you want to borrow based on\nthe book title, author's name, book genre or\nbook location.", "Find the best book lender, easy-to-borrow\nand also the convenience of borrowing.", "Have a book that has finished reading and\nwants to lend it to be useful? This is the\nplatform."]
    var images = ["onboarding_1", "onboarding_2", "onboarding_3"]
    var buttonText = ["Next", "Next", "Get Started"]
    
//  dynamic width and height of scrollview
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    
    @IBAction func onBtnNext(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Signup", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.navigationController?.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
//      to call viewDidLayoutSubViews() and get dynamic width and height of scrollview
        
        self.scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
//      create the slides and add them
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)

            
        let slide = UIView(frame: frame)
            
//      subviews
        let onboardingImage = UIImageView.init(image: UIImage.init(named: images[index]))
        onboardingImage.frame = CGRect(x: 0, y: 0, width: 300, height: 316)
        onboardingImage.contentMode = .scaleAspectFit
        onboardingImage.center = CGPoint(x: scrollWidth/2, y: scrollHeight/2 - 50)
                        
//      onboarding title
        let onboardingTitle = UILabel.init(frame: CGRect(x: 20, y: onboardingImage.frame.maxY+50, width: scrollWidth-64, height: 85))
        onboardingTitle.textAlignment = .left
        onboardingTitle.numberOfLines = 2
        onboardingTitle.font = UIFont.boldSystemFont(ofSize: 34.0)
        onboardingTitle.textColor = UIColor(red: 37.0/255.0, green: 126.0/255.0, blue: 121.0/255.0, alpha: 100.0/100.0)
        onboardingTitle.text = titles[index]
                        
//      onboarding description
        let onboardingDescription = UILabel.init(frame: CGRect(x: 20, y: onboardingTitle.frame.maxY+15, width: scrollWidth-64, height: 70))
        onboardingDescription.textAlignment = .left
        onboardingDescription.numberOfLines = 3
        onboardingDescription.font = UIFont.systemFont(ofSize: 17.0)
        onboardingDescription.textColor = UIColor(red: 60.0/255.0, green: 60.0/255.0, blue: 67.0/255.0, alpha: 60.0/100.0)
        onboardingDescription.text = descriptions[index]
            
//      Create skip button
        if index != 2 {
            let skipButton = UIButton(type: .system)
        

//      Button position
            skipButton.frame = CGRect(x: 340, y: 50, width: 54, height: 44)
                            
//      Set text on button
            skipButton.setTitle("Skip", for: .normal)
                        
//      Set custom font
            skipButton.titleLabel!.font = UIFont(name: "SystemFont", size: 17.0)
            skipButton.setTitleColor(UIColor(red: 37.0/255.0, green: 125.0/255.0, blue: 121.0/255.0, alpha: 100.0/100.0), for: .normal)
            slide.addSubview(skipButton)

        }
//      Set back button
        if index != 0 {
            let backButton = UIButton(type: .custom)
            backButton.setImage(#imageLiteral(resourceName: "back_button"), for: .normal)
            backButton.frame = CGRect(x: 20, y: 60, width: 25, height: 25)
            slide.addSubview(backButton)

        }
            
        slide.addSubview(onboardingImage)
        slide.addSubview(onboardingTitle)
        slide.addSubview(onboardingDescription)
        scrollView.addSubview(slide)
        }
        
        
//      set width of scrollview to accomodate all the slides
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
                
//      disable vertical scroll/bounce
        self.scrollView.contentSize.height = 1.0
                
//      initial state
        pageControl.numberOfPages = titles.count
        pageControl.currentPage = 0
    }
            
//      indicator
        @IBAction func pageChanged(_sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
            
        }
            
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
         setIndicatorForCurrentPage()
            }
            
    func setIndicatorForCurrentPage() {
         let page = (scrollView?.contentOffset.x)!/scrollWidth
                pageControl?.currentPage = Int(page)
    }
    
    
}
