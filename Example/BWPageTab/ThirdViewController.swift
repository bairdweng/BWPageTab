//
//  ThirdViewController.swift
//  BWPageTab_Example
//
//  Created by bairdweng on 2020/9/22.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ThirdViewController viewwillAppear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation
     /Users/bairdweng/Desktop/ios_open_source/BWPageTab/ViewControllers
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
