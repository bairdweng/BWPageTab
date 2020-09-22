//
//  SecondViewController.swift
//  BWPageTab_Example
//
//  Created by bairdweng on 2020/9/22.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController viewwillAppear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
