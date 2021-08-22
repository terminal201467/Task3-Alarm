//
//  ViewController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/1.
//

import UIKit
class ViewController: UITabBarController{
    
    override func loadView() {
        super.loadView()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarInVC()
    
    }
    
    //MARK:-TabBar
    func tabBarInVC(){
        
        UITabBar.appearance().barTintColor = UIColor.black //設定Bar體本身
        UITabBar.appearance().tintColor = UIColor.orange //設定Bar上的字
        tabBarController?.tabBar.isTranslucent = false
        
        let worldTimeVC = UINavigationController(rootViewController: WorldTimeViewController())
        let alarmVC = UINavigationController(rootViewController: AlarmViewController())
        let stopWatchVC = UINavigationController(rootViewController: StopWatchViewController())
        let timeWatchVC = UINavigationController(rootViewController: TimeWatchViewController())
        
        worldTimeVC.tabBarItem = UITabBarItem(title: "世界時間", image: UIImage(named: "globe@2x"),tag: 100)
        alarmVC.tabBarItem = UITabBarItem(title: "鬧鐘", image: UIImage(named: "alarm@2x"), tag: 100)
        timeWatchVC.tabBarItem = UITabBarItem(title: "碼錶", image: UIImage(named: "stopwatch@2x"), tag: 100)
        stopWatchVC.tabBarItem = UITabBarItem(title: "計時器", image: UIImage(named: "timer@2x"), tag: 100)
        
        viewControllers = [worldTimeVC,alarmVC,timeWatchVC,stopWatchVC]
        self.modalPresentationStyle = .fullScreen
    }


}

