//
//  WorldTimeViewController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/3.
//

import UIKit

class WorldTimeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNaviagationBarInWTVC()

        // Do any additional setup after loading the view.
    }
    //MARK:-Methods
    @objc func createTime(){
        
    }
    @objc func editTime(){
        
    }
    
    //MARK:-setNavigationBarInWorldTime
    func setNaviagationBarInWTVC(){
        title = "世界時鐘"
        view.backgroundColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]//字體改為白色
        navigationController?.navigationBar.prefersLargeTitles = true
        let createButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(WorldTimeViewController.createTime))
        self.editButtonItem.tintColor = UIColor.orange
        createButton.tintColor = UIColor.orange
        navigationItem.rightBarButtonItem = createButton
        navigationItem.leftBarButtonItem = editButtonItem
    }
}
