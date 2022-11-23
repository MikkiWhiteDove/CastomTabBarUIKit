//
//  MainTabBarController.swift
//  CastomTabBar
//
//  Created by Mishana on 23.11.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateViewController(viewController: HomeViewController(), title: "Home", image: "house.fill"),
            generateViewController(viewController: PersonViewController(), title: "User", image: "person.fill"),
            generateViewController(viewController: SettingsViewController(), title: "Settings", image:"gear.badge")
        ]
    }
    
    private func generateViewController(viewController: UIViewController, title: String, image: String)->UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(systemName: image)
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionX: CGFloat = 10
        let positionY: CGFloat = 11
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + positionY * 2
        
        let roundLayer = CAShapeLayer()
        
        let path = UIBezierPath(
            roundedRect: CGRect(x: positionX, y: tabBar.bounds.minY - positionY, width: width, height: height),
            cornerRadius: height / 2
        )
        
        roundLayer.path = path.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.backgroundF.cgColor
        tabBar.tintColor = .tintColor
        tabBar.unselectedItemTintColor = .tintColorF
    }
}
