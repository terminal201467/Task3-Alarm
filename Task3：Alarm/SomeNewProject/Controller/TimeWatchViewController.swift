//
//  TimeWatchViewController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/3.
//

import UIKit

class TimeWatchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarInTWVC()
        // Do any additional setup after loading the view.
    }
    //MARK:-
    func setNavigationBarInTWVC(){
        view.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = false
    }

}
