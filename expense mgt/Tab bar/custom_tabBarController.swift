//
//  custom_tabBar.swift
//  expense mgt
//
//  Created by Umer Farooq on 07/09/2024.
//

import UIKit

class custom_tabBar: UITabBarController {

    let plusButton = UIButton()

        override func viewDidLoad() {
            super.viewDidLoad()

            setupPlusButton()
        }

        func setupPlusButton() {
            plusButton.frame.size = CGSize(width: 60, height: 60)
            plusButton.layer.cornerRadius = plusButton.frame.size.width / 2
            plusButton.backgroundColor = UIColor.cyan // Customize the color
            plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
            plusButton.tintColor = .white
            plusButton.layer.shadowRadius = 5
            plusButton.layer.shadowOpacity = 0.7
            plusButton.layer.shadowOffset = CGSize(width: 0, height: 0)
            plusButton.layer.shadowColor = UIColor.black.cgColor
            

            plusButton.center = CGPoint(x: tabBar.center.x, y: tabBar.frame.origin.y - 50)
        
            view.addSubview(plusButton)

            plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        }

        @objc func plusButtonTapped() {
            // Handle the plus button tap
        }
}
