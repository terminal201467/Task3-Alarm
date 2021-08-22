//
//  EditAlarmNameView.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/17.
//

import UIKit

class EditAlarmNameView: UIView {
    //MARK:-Properties
    let textField:UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.borderStyle = .none
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textField.textColor = .white
        textField.tintColor = .orange
        textField.enablesReturnKeyAutomatically = true
        //textField.setImage
        return textField
    }()

    lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textField])
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.isLayoutMarginsRelativeArrangement = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textField)
        addSubview(stackView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    func autoLayout(){
        textField.addConstraint(textField.heightAnchor.constraint(equalToConstant: 45))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -200).isActive = true
    }
}
