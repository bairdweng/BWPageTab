//
//  ViewController.swift
//  BWPageTab
//
//  Created by bairdweng on 09/22/2020.
//  Copyright (c) 2020 bairdweng. All rights reserved.
//

import UIKit
import BWPageTab
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPageTab()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initPageTab() {
        let pageTabManage = BWPageTab.singleManage
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 500))
        headerView.backgroundColor = .red
        pageTabManage.headerView = headerView
        
        
        let firstVc = FirstViewController()
        let secondVc = SecondViewController()
        let thirdVc = ThirdViewController()
        let vc = pageTabManage.register(controllers: [firstVc,secondVc,thirdVc])
        self.addChildViewController(vc)
        view.addSubview(vc.view)
        vc.view.frame = self.view.bounds
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

