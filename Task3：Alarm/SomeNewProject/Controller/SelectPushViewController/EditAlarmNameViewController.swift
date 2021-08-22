//
//  editAlarmViewController.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/21.
//

import UIKit

class EditAlarmNameViewController: UIViewController {
    //MARK:-Properties
    let editAlarmName:EditAlarmNameView = .init()
    var name:[Clock] = [Clock]()
    
    var label:String?
    weak var getLabelDelegate:LabelDataPass?
//    var name:[String] = [String]()
//    var alarmName = String?()

    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = editAlarmName
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
//        setTableView()
    }
    //進到畫面後鍵盤彈出
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        editAlarmName.textField.becomeFirstResponder()
        if editAlarmName.textField.text == ""{
            label = "鬧鐘"
            editAlarmName.textField.text = label
        }
    }
    
    //離開畫面時動作：傳值到上一頁
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if editAlarmName.textField.text?.count == 0{
            getLabelDelegate?.receiveLabelData(data: "鬧鐘")
        }else{
            getLabelDelegate?.receiveLabelData(data: editAlarmName.textField.text!)
        }
    }
    //MARK:-MethodForNavigationBar
    @objc func back(){
        let createAlarmVC = CreatAlarmViewController()
        navigationController?.pushViewController(createAlarmVC, animated: true)
    }
    //MARK:-setTextField
    func setTextField(){
        editAlarmName.textField.delegate = self
        //if
    }
    //MARK:-setNavigationBar
    func setNavigationBar(){
        title = "標籤"
        view.backgroundColor = .black
        let backButton = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(EditAlarmNameViewController.back))
        backButton.tintColor = .orange
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
//MARK:-setTextFieldDelegate
extension EditAlarmNameViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true 
    }
}

