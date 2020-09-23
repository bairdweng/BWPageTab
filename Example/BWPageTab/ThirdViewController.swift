//
//  ThirdViewController.swift
//  BWPageTab_Example
//
//  Created by bairdweng on 2020/9/22.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    let cellId = "thirdvc_cell"
    lazy var tableView:UITableView = {[weak self] in
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self?.automaticallyAdjustsScrollViewInsets = false
            // Fallback on earlier versions
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tableView
    }()
    
    let dataSources:[Any] = {
        var datas:[String] = []
        for i in 1...20 {
            datas.append("thirdvc_\(i)")
        }
        return datas
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ThirdViewController viewwillAppear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
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
extension ThirdViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath)
        cell.textLabel?.text = dataSources[indexPath.row] as? String ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
