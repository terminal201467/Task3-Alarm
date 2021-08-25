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
    weak var editNameDelegate:EditAlarmNameViewDelegate!

    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = editAlarmName
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        UIView.animate(withDuration: 0.2) {
            self.editAlarmName.textField.frame = CGRect(x: 0, y: 355, width: 414, height: 34)
        }
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
    override func viewWillDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 0.4) {
            self.editAlarmName.textField.frame = CGRect(x: 400, y: 500, width: 414, height: 34)
        }
        if let label = editAlarmName.textField.text{
            if label == ""{
                editNameDelegate?.receiveEditNameData(data: "鬧鐘")
            }else{
                editNameDelegate?.receiveEditNameData(data: label)
            }
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
    }
    //MARK:-setNavigationBar
    func setNavigationBar(){
        title = "標籤"
        view.backgroundColor = .black
        let backButton = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(back))
        navigationController?.navigationBar.tintColor = .orange
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
//MARK:-setTextFieldDelegate
extension EditAlarmNameViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true 
    }
}

