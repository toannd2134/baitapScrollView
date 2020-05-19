//
//  ViewController.swift
//  ChuaBaiTapScrollView
//
//  Created by Taof on 5/8/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var topScrollView: UIScrollView!
    @IBOutlet weak var bottomScrollView: UIScrollView!
    
    @IBOutlet weak var offBacground: UIButton!
    @IBOutlet weak var contentView1: UIView!
    @IBOutlet weak var contentView2: UIView!
    
    @IBOutlet weak var heightConstraintView1: NSLayoutConstraint!
    @IBOutlet weak var widthConstraintView1: NSLayoutConstraint!
    
    @IBOutlet weak var heightConstraintView2: NSLayoutConstraint!
    @IBOutlet weak var widthConstraintView2: NSLayoutConstraint!
    var timer :Timer!
    var items = ["😀", "😃", "🤣", "😊", "☺️","😘"]
    let screenWidth = UIScreen.main.bounds.width
    var toogleScreen  = false
    var passdata : ((_ toggle : Bool) -> Void)?
        override func viewDidLoad() {
        super.viewDidLoad()
        topScrollView.delegate = self
        pagecontrol.numberOfPages = items.count
        pagecontrol.currentPage = 0
        pagecontrol.pageIndicatorTintColor = .red
        pagecontrol.currentPageIndicatorTintColor =  .gray
        topScrollView.isPagingEnabled = true
        setupScrollView1(arrays: items)
            
           timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(runTime), userInfo: nil, repeats: true)
    }
    @IBAction func whilteBlack(_ sender: Any) {
        toogleScreen.toggle()
        self.passdata?(toogleScreen)
    }
    @objc func runTime(){
        
        let  imgWidth = contentView1.frame.width / CGFloat(items.count)
        if pagecontrol.currentPage < items.count-1 {
            _ = UIView.animate(withDuration: 1) {
                self.contentView1.frame.origin.x -= imgWidth
                self.pagecontrol.currentPage += 1
               
                
            }
        }else{
            self.timer.invalidate()
            _ = UIView.animate(withDuration: 1) {
               
                self.pagecontrol.currentPage = 0
                
                self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.runTime), userInfo: nil, repeats: true)
                 
              
               
                
            }
            
        }
         self.topScrollView.contentOffset = CGPoint(x: self.screenWidth * CGFloat(self.pagecontrol.currentPage), y: 0)
        
    }
    func setupScrollView1(arrays: [String]){
        for i in 0..<arrays.count{
            let item = CustomView1(frame: CGRect(x: screenWidth * CGFloat(i),
                                                 y: 0,
                                                 width: screenWidth,
                                                 height: 250))
            item.textIcon.text = arrays[i]
            contentView1.addSubview(item)
        }
        
        widthConstraintView1.constant = screenWidth * CGFloat(arrays.count)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupScrollView1(arrays: items)
    }
    
    
}
extension ViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView  == topScrollView{
        let indexpage = round(scrollView.contentOffset.x/screenWidth)
        pagecontrol.currentPage = Int(indexpage)
    }
    }
}

