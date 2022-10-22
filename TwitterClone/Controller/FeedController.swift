//
//  FeedController.swift
//  TwitterClone
//
//  Created by Sabri Eyyubi on 22.10.2022.
//

import Foundation
import UIKit

class FeedController: UIViewController {
    
    // MARK: Properties
    
    // MARK: Lifecyles

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        //view.backgroundColor = .systemRed
        
    }
    
// MARK: Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        
    }
}
