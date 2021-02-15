//
//  Cell.swift
//  SkillsShowApp
//
//  Created by Лена Мырленко on 2021/2/12.
//

import UIKit

class Cell: UITableViewCell {
    private let backView = UIView()
    private let missedCallImage = UIImageView()
    private let callDurationLbl = UILabel()
    private let nameLbl = UILabel()
    private let numberLbl = UILabel()
    private let callTimeLbl = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        backgroundColor = .white
        setupBackView()
        setupMissedCallImg()
        setupCallDurationLbl()
        setupNameLbl()
        setupNumberLbl()
        setupCallTimeTV()
    }
    
    private func setupBackView() {
        addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            backView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            backView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6)
        ])
        
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 8
        
        backView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        backView.layer.shadowOffset = .zero
        backView.layer.shadowOpacity = 0.8
        backView.layer.shadowRadius = 4
    }
    
    private func setupMissedCallImg() {
        backView.addSubview(missedCallImage)
        missedCallImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            missedCallImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 21),
            missedCallImage.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 21),
            missedCallImage.heightAnchor.constraint(equalToConstant: 29),
            missedCallImage.widthAnchor.constraint(equalToConstant: 29)
        ])
        
        let icon = UIImage(systemName: "phone.fill.arrow.down.left")?.withTintColor(UIColor.mightyOrange, renderingMode: .alwaysOriginal)
        
        missedCallImage.image = icon
    }
    
    private func setupCallDurationLbl() {
        backView.addSubview(callDurationLbl)
        callDurationLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            callDurationLbl.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
            callDurationLbl.centerXAnchor.constraint(equalTo: missedCallImage.centerXAnchor),
            callDurationLbl.widthAnchor.constraint(equalToConstant: 40),
            callDurationLbl.heightAnchor.constraint(equalToConstant: 16),
        ])
        
        callDurationLbl.font = UIFont.italicSystemFont(ofSize: 13)
        callDurationLbl.textAlignment = .center
        callDurationLbl.tintColor = UIColor.sixty
    }
    
    private func setupNameLbl() {
        backView.addSubview(nameLbl)
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLbl.topAnchor.constraint(equalTo: backView.topAnchor, constant: 21),
            nameLbl.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 72),
            nameLbl.widthAnchor.constraint(equalToConstant: 160),
            nameLbl.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        nameLbl.textAlignment = .left
        nameLbl.tintColor = UIColor.thirtyThree
        nameLbl.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    private func setupNumberLbl() {
        backView.addSubview(numberLbl)
        numberLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 2),
            numberLbl.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 72),
            numberLbl.heightAnchor.constraint(equalToConstant: 22),
            numberLbl.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        numberLbl.textAlignment = .left
        numberLbl.tintColor = UIColor.thirtyThree
        numberLbl.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    }
    
    private func setupCallTimeTV() {
        backView.addSubview(callTimeLbl)
        callTimeLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            callTimeLbl.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16),
            callTimeLbl.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
            callTimeLbl.widthAnchor.constraint(equalToConstant: 60),
            callTimeLbl.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        callTimeLbl.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        callTimeLbl.textAlignment = .center
        callTimeLbl.tintColor = UIColor.sixty
    }
    
    
    //MARK:- Logic Methods:
    func set(duration: String, name: String?, number: String?, created: String?) {
 
        let createdDate = created!
        print("set -> created = \(created)")
        
        let convertedCreatedDate = convertDateFormater(createdDate)
        print("set -> convertedCreatedDate = \(convertedCreatedDate)")
        
        callDurationLbl.text = duration.substring(from: 3)
        
        if name == nil {
            nameLbl.text = number
            numberLbl.text = ""
        } else {
            nameLbl.text = name
            numberLbl.text = number
        }
  
        callTimeLbl.text = convertedCreatedDate
    }
    
    func convertDateFormater(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "h:mm a"
        return  dateFormatter.string(from: date!)
        
    }
}



