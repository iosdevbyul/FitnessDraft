//
//  MainTabBarViewController.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-11.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true

        let mainViewController = MainViewController()
        let mainViewControllerBarItem = UITabBarItem(title: "Main", image: UIImage(named: "Main.png"), tag: 0)
        mainViewControllerBarItem.imageInsets = UIEdgeInsets(top: 0, left: -10, bottom: -6, right: -10);
        mainViewController.tabBarItem = mainViewControllerBarItem
                
        let workoutViewController = WorkoutViewController()
        let workoutViewControllerBarItem = UITabBarItem(title: "WORKOUT", image: UIImage(named: "Workout.png"), selectedImage: UIImage(named: "Workout.png"))
        workoutViewControllerBarItem.imageInsets = UIEdgeInsets(top: 0, left: -10, bottom: -6, right: -10);
        workoutViewController.tabBarItem = workoutViewControllerBarItem
        
        let bodyViewController = DataViewController()
        let bodyViewControllerBarItem = UITabBarItem(title: "Data", image: UIImage(named: "Body.png"), selectedImage: UIImage(named: "Body.png"))
        bodyViewControllerBarItem.imageInsets = UIEdgeInsets(top: 0, left: -10, bottom: -6, right: -10);
        bodyViewController.tabBarItem = bodyViewControllerBarItem
        
        let infoViewController = InfoViewController()
        let infoViewControllerBarItem = UITabBarItem(title: "INFO", image: UIImage(named: "Info.png"), selectedImage: UIImage(named: "Info.png"))
        infoViewControllerBarItem.imageInsets = UIEdgeInsets(top: 0, left: -10, bottom: -6, right: -10);
        infoViewController.tabBarItem = infoViewControllerBarItem
        
        self.viewControllers = [mainViewController, workoutViewController,bodyViewController,infoViewController]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    
}
