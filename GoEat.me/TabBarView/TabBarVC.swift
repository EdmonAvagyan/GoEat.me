//
//  TabBarVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 20.02.23.
//

import UIKit
import Firebase

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
//        tabBar.tintColor = .label
        setupVCs()
    }
    
    func setupVCs() {
        
        if Firebase.Auth.auth().currentUser == nil {
            viewControllers = [
                createNavController(for: createMainPage(), title: NSLocalizedString("Home", comment: "Home"), image: UIImage(systemName: "house.fill")!),
                createNavController(for: createBasketVC(), title: NSLocalizedString("Basket", comment: ""), image: UIImage(systemName: "basket")!),
                createNavController(for: createShoppingVC(), title: NSLocalizedString("Shopping", comment: ""), image: UIImage(systemName: "wallet.pass.fill")!),
                createNavController(for: createLoginVC(), title: NSLocalizedString("Login", comment: ""), image: UIImage(systemName: "person.fill")!)
            ]
        }
        else {
            viewControllers = [
                createNavController(for: createMainPage(), title: NSLocalizedString("Home", comment: "Home"), image: UIImage(systemName: "house.fill")!),
                createNavController(for: createBasketVC(), title: NSLocalizedString("Basket", comment: ""), image: UIImage(systemName: "basket")!),
                createNavController(for: createShoppingVC(), title: NSLocalizedString("Shopping", comment: ""), image: UIImage(systemName: "wallet.pass.fill")!),
                createNavController(for: createAccountVC(), title: NSLocalizedString("Login", comment: ""), image: UIImage(systemName: "person.fill")!)
            ]
        }
    }
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            navController.navigationBar.prefersLargeTitles = true
//            rootViewController.navigationItem.title = title
            return navController
        }
    
    func createMainPage() -> UIViewController {
        let storiboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storiboard.instantiateViewController(withIdentifier: "MainPage") as! MainPage
        return vc
    }
    
    func createBasketVC() -> UIViewController {
        let storiboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storiboard.instantiateViewController(withIdentifier: "BasketVC") as! BasketVC
        return vc
    }
    
    func createShoppingVC() -> UIViewController {
        let storiboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storiboard.instantiateViewController(withIdentifier: "ShoppingVC") as! ShoppingVC
        return vc
    }
    
    func createLoginVC() -> UIViewController {
        let storiboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storiboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        return vc
    }
    
    func createAccountVC() -> UIViewController {
        let storiboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storiboard.instantiateViewController(withIdentifier: "AccountVC") as! AccountVC
        return vc
    }
    
}
