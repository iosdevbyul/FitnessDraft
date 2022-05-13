//
//  SurveyViewController.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-08.
//

import UIKit

let views = [SurveyView(), DateOfBirthView(), HeightView(), WeightView(), GymView()]


class SurveyViewController: UIViewController {
    
    @objc func didRecieveTestNotification(_ notification: Notification) {
        let vc = LoginViewController()
        guard let nc = navigationController else {
            print("fail")
            return
        }

        nc.pushViewController(vc, animated: true)
    }

    var thePageVC = SurveyPageViewController()
    
    let myContainerView: UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
    }()

    override func viewDidLoad() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(didRecieveTestNotification(_:)), name: NSNotification.Name("TestNotification"), object: nil)

        
        view.addSubview(myContainerView)
        NSLayoutConstraint.activate([
            myContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0),
            myContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0.0),
            myContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0.0),
            myContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0)
            ])

        addChild(thePageVC)
        thePageVC.view.translatesAutoresizingMaskIntoConstraints = false
        myContainerView.addSubview(thePageVC.view)
        NSLayoutConstraint.activate([
                thePageVC.view.topAnchor.constraint(equalTo: myContainerView.topAnchor, constant: 0.0),
                thePageVC.view.bottomAnchor.constraint(equalTo: myContainerView.bottomAnchor, constant: 0.0),
                thePageVC.view.leadingAnchor.constraint(equalTo: myContainerView.leadingAnchor, constant: 0.0),
                thePageVC.view.trailingAnchor.constraint(equalTo: myContainerView.trailingAnchor, constant: 0.0),
                ])
        thePageVC.didMove(toParent: self)
        navigationController?.isNavigationBarHidden = true

    }
}

class SurveyPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var pageCount = 5;
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return pages.last }
        guard pages.count > previousIndex else { return nil }
        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }

                let nextIndex = viewControllerIndex + 1

                guard nextIndex < pages.count else { return pages.first }

                guard pages.count > nextIndex else { return nil }

                return pages[nextIndex]
    }

    var pages: [UIViewController] = [UIViewController]()

    //Initializes a newly created page view controller.
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
            super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }

        override func viewDidLoad() {
            super.viewDidLoad()

            dataSource = self
            delegate = nil

            // instantiate "pages"
            for i in 0..<pageCount {
                let vc = SubSurveyViewController()
                
                
                pages.append(vc)
                vc.view.addSubview(views[i])
                views[i].frame = vc.view.frame
            }

            setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
        }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstVC = pageViewController.viewControllers?.first else {
            return 0
        }
        guard let firstVCIndex = pages.firstIndex(of: firstVC) else {
            return 0
        }
        return firstVCIndex
    }
}

class SubSurveyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
