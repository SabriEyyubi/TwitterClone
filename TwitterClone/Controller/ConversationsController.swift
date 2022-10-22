//
//  ConversationsController.swift
//  TwitterClone
//
//  Created by Sabri Eyyubi on 22.10.2022.
//

import Foundation
import UIKit

class ConversationsController: UIViewController {
    
    // MARK: Properties
    
    // MARK: Lifecyles

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        //view.backgroundColor = .systemGray

        
    }
    
// MARK: Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Messages"
        
        
    }
    
}
