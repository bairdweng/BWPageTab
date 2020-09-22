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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        addVcs()
        lazyAddChirdVc(index: currentPage)
        // Do any additional setup after loading the view.
    }
    
    func addVcs() {
        guard let vcs = viewControllers else { return }
        for  vc in vcs {
            self.addChildViewController(vc)
        }
        scrollView.contentSize = CGSize(width: view.frame.size.width * CGFloat(vcs.count), height: view.frame.size.height)
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
