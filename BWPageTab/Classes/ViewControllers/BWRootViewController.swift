//
//  BWRootViewController.swift
//  BWPageTab
//
//  Created by bairdweng on 2020/9/22.
//

import UIKit

class BWRootViewController: UIViewController {
    var viewControllers:[UIViewController]?
    
    lazy var scrollView:UIScrollView = { [weak self] in
        let scroView = UIScrollView(frame: self!.view.bounds)
        scroView.bounces = false
        scroView.alwaysBounceHorizontal = true
        scroView.alwaysBounceVertical = false
        scroView.scrollsToTop = false
        scroView.delegate = self
        scroView.showsVerticalScrollIndicator = false
        scroView.showsHorizontalScrollIndicator = false
        scroView.isPagingEnabled = true
        return scroView
    }()
    
    var currentPage = 0
    var tableViewHeaderHeight = CGFloat(0)
    var tableViews:[UITableView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        addVcs()
        setHeaderView()
        lazyAddChirdVc(index: currentPage)
        // Do any additional setup after loading the view.
    }
    
    func setHeaderView() {
        guard let headerView = BWPageTab.singleManage.headerView else {
            return
        }
        self.view.addSubview(headerView)
        tableViewHeaderHeight = headerView.frame.size.height
        
        addHeadViewToVcs()
    }
    
    func addHeadViewToVcs() {
        guard let vcs = viewControllers else {
            return
        }
        for vc in vcs {
            guard let tableView = getTableView(vc: vc) else {
                return
            }
            tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: tableViewHeaderHeight))
            tableView.addObserver(self, forKeyPath: "contentOffset", options: [.new], context: nil)
            tableViews.append(tableView)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentOffset" {
            guard let myTableView:UITableView = object as? UITableView else {
                return
            }
            updateHeaderViewY(y: myTableView.contentOffset.y)
            syncTableViewY(y: myTableView.contentOffset.y)
        }
    }
    
    func updateHeaderViewY(y:CGFloat) {
        guard let headerView = BWPageTab.singleManage.headerView else {
            return
        }
        let headerY = y < tableViewHeaderHeight ? -y : -tableViewHeaderHeight
        var newFrame = headerView.frame
        newFrame.origin.y = headerY < 0 ? headerY : 0
        headerView.frame = newFrame
    }
    
    func syncTableViewY(y:CGFloat) {
        if y > tableViewHeaderHeight { return }
        for (index,tableView) in tableViews.enumerated() {
            if index != currentPage {
                tableView.setContentOffset(CGPoint(x: 0, y: y), animated: false)
            }
        }
    }
    
    func getTableView(vc:UIViewController)->UITableView? {
        let superView = vc.view
        for  view in superView!.subviews {
            if view.isKind(of: UITableView.self) {
                return view as? UITableView
            }
        }
        return nil
    }
    
    func addVcs() {
        guard let vcs = viewControllers else { return }
        for  vc in vcs {
            self.addChildViewController(vc)
        }
        scrollView.contentSize = CGSize(width: view.frame.size.width * CGFloat(vcs.count), height: view.frame.size.height)
    }
    deinit {
        // All listeners need to be deleted here
    }
}

extension BWRootViewController :UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        let pageIndex = Int(page)
        if pageIndex == currentPage {
            return
        }
        lazyAddChirdVc(index: pageIndex)
        currentPage = pageIndex
        print("current page:\(pageIndex)")
    }
    func lazyAddChirdVc(index:Int) {
        guard let vcs = viewControllers else {
            return
        }
        let currentVc = vcs[index]
        let point_x = CGFloat(index) * scrollView.frame.size.width
        currentVc.view.frame = CGRect(x: point_x, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        scrollView.addSubview(currentVc.view)
    }
    
}
