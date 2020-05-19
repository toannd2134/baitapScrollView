//
//  CustomView1.swift
//  ChuaBaiTapScrollView
//
//  Created by Taof on 5/8/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit

//class CustomView1: UIView {
//
//    let containerView : UIView = {
//        let view = UIView()
//        return view
//    }()
//
//    let textIcon : UILabel = {
//       let label = UILabel()
//        label.text = "🌕"
//        label.textColor = .red
//        label.font = UIFont.systemFont(ofSize: 80)
//        label.textAlignment = .center
//        return label
//    }()
//
//    func setupFrame(){
//        containerView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
//        textIcon.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height)
//
//        textIcon.center = containerView.center
//        self.addSubview(containerView)
//        self.addSubview(textIcon)
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setupFrame()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
class CustomView1: UIView {
    
    let containerView : UIView = {
        let view1 = UIView()
        view1.backgroundColor = .white
        return view1
    }()
    var offSet = true
    let textIcon : UILabel = {
       let label = UILabel()
        label.text = ":full_moon:"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 80)
        label.textAlignment = .center
        return label
    }()
    
    func setupFrame(){
        containerView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        textIcon.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height)
        
        textIcon.center = containerView.center
        self.addSubview(containerView)
        containerView.addSubview(textIcon)
         let vc  = ViewController()
       
        vc.passdata = { [weak self]  data in
            guard let main = self else {
                return
            }
            if data == true {
                
                main.containerView.backgroundColor = .black
                
            }else{
                main.containerView.backgroundColor = .white
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupFrame()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
