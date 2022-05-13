//
//  WelcomeViewController.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-08.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var alm = AutolayouutManager()

    var logoImage = UIImageView()
    var welcomeLabel = UILabel()
    var joinBtn = UIButton()
    var loginBtn = UIButton()
    
    let vc = LoginView()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        deploy()
        setGesture()
        checkStatus()
        
        

    }
    
    func checkStatus() {
        
        
    }
    
    private func setGesture() {
        //UIPanGestureRecognizer
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        downSwipe.direction = .down
        

        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(downSwipe)
        view.addGestureRecognizer(singleTap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        print("Tap")
        disappearLoginView()
    }
    
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer)
    {
        if sender.direction == .left
        {
           print("Swipe left")
            print(sender.location(in: self.view)) //(175.66665649414062, 418.0)
           // show the view from the right side
        }

        if sender.direction == .right
        {
           print("Swipe right")
           // show the view from the left side
        }
        
        if sender.direction == .down
        {
           print("Swipe down")
           // show the view from the left side
        }
    }
    
    private func deploy() {
        self.view.addSubview(logoImage)
        let img = UIImage(named: "logo")
        logoImage.image = img
        logoImage.contentMode = .scaleToFill;
        alm.setAutolayoutWithHeight(view: self.view, object: logoImage, height: self.view.frame.width - 60.0, left: 30, right: 30, top: self.view.frame.size.height * 0.07, hCenter: true)
        
//        self.view.addSubview(welcomeLabel)
//        welcomeLabel.numberOfLines = 0
//        welcomeLabel.text = "Welcome! \nLet's make your life better now with us"
//        welcomeLabel.textAlignment = .center
//        alm.setAutolayoutWithHeight(view: self.view, object: welcomeLabel, height: 50, left: 10, right: 10, top: self.view.frame.width - 20.0, hCenter: true)
  
        self.view.addSubview(joinBtn)
        joinBtn.setTitle("GET STARTED", for: .normal)
        joinBtn.layer.cornerRadius = 5
        joinBtn.layer.borderWidth = 1
        alm.setAutolayoutWithBottom(view: self.view, object: joinBtn, height: 50, left: 20, right: 20, bottom: 110, hCenter: true)
        joinBtn.addTarget(self, action: #selector(moveToNext), for: .touchUpInside)

        self.view.addSubview(loginBtn)
        loginBtn.setTitle("LOG IN", for: .normal)
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.borderWidth = 1
        alm.setAutolayoutWithBottom(view: self.view, object: loginBtn, height: 50, left: 20, right: 20, bottom: 30, hCenter: true)
        loginBtn.addTarget(self, action: #selector(popUpLoginView), for: .touchUpInside)
        
    }

    @objc func moveToNext() {
        let vc = SurveyViewController()
        guard let nc = navigationController else {
            print("fail")
            return
        }

        nc.pushViewController(vc, animated: true)
    }
    
    @objc func popUpLoginView(_ sender: UIButton) {
        self.view.addSubview(vc)
        vc.frame = CGRect(x: 0, y: self.view.frame.height , width: self.view.frame.size.width, height: self.view.frame.size.height / 2.0 )
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {

            self.vc.frame = CGRect(x: 0, y: self.view.frame.height / 2.0 , width: self.view.frame.size.width, height: self.view.frame.size.height / 2.0 )
        })
    }
    
    func disappearLoginView() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.vc.frame = CGRect(x: 0, y: self.view.frame.height  , width: self.view.frame.size.width, height: self.view.frame.size.height / 2.0 )
        })
    }

//https://developer.apple.com/forums/thread/676803
//https://medium.com/macoclock/how-to-create-and-use-custom-dialog-boxes-in-ios-4335be9dac34
//https://ios-development.tistory.com/244
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("aaa")
    }
    

}
