//
//  ViewController.swift
//  YiLinkerOnlineBuyer
//
//  Created by Alvin John Tandoc on 7/28/15.
//  Copyright (c) 2015 yiLinker-online-buyer. All rights reserved.
//

import UIKit

class HomeContainerViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBar: UITabBar!
    
    
    var homePageCollectionViewController: HomePageCollectionViewController?
    var searchViewContoller: SearchViewController?
    var circularMenuViewController: CircularMenuViewController?
    var wishlisViewController: WishlistViewController?
    var cartViewController: CartViewController?
    
    var viewControllers = [UIViewController]()
    
    var selectedChildViewController: UIViewController?
    var contentViewFrame: CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.delegate = self
        
        initViewControllers()
        circularDraweView()
        setSelectedViewControllerWithIndex(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        contentViewFrame = contentView.bounds
    }
    
    // This function is for executing child view logic code
    func setSelectedViewControllerWithIndex(index: Int) {
        let viewController: UIViewController = viewControllers[index]
        setSelectedViewController(viewController)
    }
    
    func setSelectedViewController(viewController: UIViewController) {
        if !(selectedChildViewController == viewController) {
            if self.isViewLoaded() {
                selectedChildViewController?.willMoveToParentViewController(self)
                selectedChildViewController?.view.removeFromSuperview()
                selectedChildViewController?.removeFromParentViewController()
            }
        }
        self.view.layoutIfNeeded()
        self.addChildViewController(viewController)
        viewController.view.frame = contentViewFrame!
        contentView.addSubview(viewController.view)
        viewController.didMoveToParentViewController(self)
        selectedChildViewController = viewController
    }
    
    func initViewControllers() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "HomeStoryBoard", bundle: nil)
        homePageCollectionViewController = storyBoard.instantiateViewControllerWithIdentifier("HomePageCollectionViewController") as? HomePageCollectionViewController
        searchViewContoller = storyBoard.instantiateViewControllerWithIdentifier("SearchViewController") as? SearchViewController
        circularMenuViewController = storyBoard.instantiateViewControllerWithIdentifier("CircularMenuViewController") as? CircularMenuViewController
        wishlisViewController = storyBoard.instantiateViewControllerWithIdentifier("WishlistViewController") as? WishlistViewController
        cartViewController = storyBoard.instantiateViewControllerWithIdentifier("CartViewController") as? CartViewController
        
        viewControllers.append(homePageCollectionViewController!)
        viewControllers.append(searchViewContoller!)
        viewControllers.append(circularMenuViewController!)
        viewControllers.append(wishlisViewController!)
        viewControllers.append(cartViewController!)
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        if item.tag != 2 {
            setSelectedViewControllerWithIndex(item.tag)
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "HomeStoryBoard", bundle: nil)
            var animatedViewController: CircularMenuViewController?
            
            if IphoneType.isIphone4() {
                animatedViewController  = storyBoard.instantiateViewControllerWithIdentifier("CircularMenuViewController4s") as? CircularMenuViewController

            } else {
                animatedViewController  = storyBoard.instantiateViewControllerWithIdentifier("CircularMenuViewController") as? CircularMenuViewController
            }
            
            animatedViewController!.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
            animatedViewController!.providesPresentationContextTransitionStyle = true
            animatedViewController!.definesPresentationContext = true
            animatedViewController!.view.backgroundColor = UIColor.clearColor()
            
            self.presentViewController(animatedViewController!, animated: false, completion: nil)
        }
    }
    
    func circularDraweView() {
        self.tabBar.selectedItem = self.tabBar.items![0] as? UITabBarItem
        let unselectedImage: UIImage = UIImage(named: "circular-drawer")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let item2: UITabBarItem = self.tabBar.items![2] as! UITabBarItem
        item2.selectedImage = unselectedImage
        item2.image = unselectedImage
        item2.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
    
}