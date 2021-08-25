//
//  AlarmTableViewCell.swift
//  SomeNewProject
//
//  Created by Jhen Mu on 2021/8/24.
//

import UIKit
import Foundation

class AlarmTableViewCell: UITableViewCell {
    
    let clockLabel:UILabel = {
        var clockLabel = UILabel()
        clockLabel.textColor = .white
        return clockLabel
    }()
    
    let ampmLabel:UILabel = {
        var ampmLabel = UILabel()
        ampmLabel.textColor = .white
        return ampmLabel
    }()
    
    let detailLabel:UILabel = {
        var detailLabel = UILabel()
        detailLabel.textColor = .white
        return detailLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clockLabel.translatesAutoresizingMaskIntoConstraints = false
        ampmLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        clockLabel.font = UIFont.systemFont(ofSize: 20)
        ampmLabel.font = UIFont.systemFont(ofSize: 15)
        detailLabel.font = UIFont.systemFont(ofSize: 10)
        
        contentView.addSubview(clockLabel)
        contentView.addSubview(ampmLabel)
        contentView.addSubview(detailLabel)
        
        NSLayoutConstraint.activate([
            ampmLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            ampmLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            ampmLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            ampmLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
            clockLabel.topAnchor.constraint(equalTo:contentView.topAnchor ,constant:0),
            clockLabel.leadingAnchor.constraint(equalTo: ampmLabel.trailingAnchor, constant: 10),
            clockLabel.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            clockLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            
            detailLabel.topAnchor.constraint(equalTo: ampmLabel.bottomAnchor, constant: 0),
            detailLabel.leadingAnchor.constraint(equalTo: ampmLabel.leadingAnchor, constant: 0),
            detailLabel.trailingAnchor.constraint(equalTo: ampmLabel.trailingAnchor, constant: 0),
            detailLabel.bottomAnchor.constraint(equalTo: ampmLabel.bottomAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


