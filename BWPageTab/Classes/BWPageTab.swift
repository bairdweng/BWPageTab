//
//  BWPageTab.swift
//  BWPageTab
//
//  Created by bairdweng on 2020/9/22.
//

import UIKit

open class BWPageTab: NSObject {
    public static let singleManage = BWPageTab()
    
    public func register(controllers:[UIViewController])->UIViewController {
        let vc = BWRootViewController()
        vc.viewControllers = controllers
        return vc
    }
}
