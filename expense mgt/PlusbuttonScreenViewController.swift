import UIKit

class PlusbuttonScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Optionally set up any other initial configurations
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Deselect the current tab
        if let tabBarController = UIApplication.shared.windows.first?.rootViewController as? UITabBarController {
            tabBarController.selectedIndex = NSNotFound // Set to an invalid index to deselect
        }
    }
    

    
    deinit {
        // Remove delegate when the view controller is deallocated
        if let tabBarController = UIApplication.shared.windows.first?.rootViewController as? UITabBarController {
            tabBarController.delegate = nil
        }
    }
}

extension PlusbuttonScreenViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let navigationController = viewController as? UINavigationController,
           let visibleViewController = navigationController.visibleViewController,
           visibleViewController is PlusbuttonScreenViewController {
            navigationController.popViewController(animated: false)
        }
    }
}
