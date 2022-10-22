//
//  MainTabController.swift
//  TwitterClone
//
//  Created by Sabri Eyyubi on 22.10.2022.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: Properties
    
    // MARK: Lifecyles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureViewControllers()

        
    }
    
// MARK: Helpers
    
    func configureViewControllers(){
        
      
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExploreController()
        explore.tabBarItem.image = UIImage(named: "search_unselected")
        let nav2 = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationsController()
        let nav3 = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)
        
        let conversations = ConversationsController()
        let nav4 = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)
        
        
        // tab controller controller array built-in
        viewControllers = [nav1, nav2, nav3, nav4]
        
        
        
    }
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image  = image
        nav.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        
        //nav.view.backgroundColor = .white
       // nav.navigationBar.backgroundColor = .white
        
        return nav
    }

}
