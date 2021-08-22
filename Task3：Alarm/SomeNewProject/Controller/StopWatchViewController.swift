//
//  StopWatchViewController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/3.
//

import UIKit

class StopWatchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarInSWVC()
        // Do any additional setup after loading the view.
    }
    //MARK:-setNavigationBar
    func setNavigationBarInSWVC(){
        view.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = false
    }

}
