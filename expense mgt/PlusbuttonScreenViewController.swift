//
//  PlusbuttonScreenViewController.swift
//  expense mgt
//
//  Created by Umer Farooq on 16/09/2024.
//

import UIKit

class PlusbuttonScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabBarController = UIApplication.shared.windows.first?.rootViewController as? UITabBarController {
                tabBarController.delegate = self
            }
    }
    
}
extension PlusbuttonScreenViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Dismiss or pop PlusbuttonScreenViewController when switching tabs
        if let navigationController = viewController as? UINavigationController,
           let visibleViewController = navigationController.visibleViewController,
           visibleViewController is PlusbuttonScreenViewController {
            navigationController.popViewController(animated: false)
        }
    }
}

