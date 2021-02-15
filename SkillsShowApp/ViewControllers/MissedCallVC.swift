//
//  MissedCallVC.swift
//  SkillsShowApp
//
//  Created by Лена Мырленко on 2021/2/14.
//

import UIKit

class MissedCallVC: UIViewController {
    
    private var backViewHeightConstraint: NSLayoutConstraint!
    
    var duration: String!
    var name: String?
    var number: String?
    var businessType: String?
    var businessNum: String?
    
    //UI Elements:
    let backView = UIView()
    let callImageView = UIImageView()
    let callDurationTV = UITextView()
    let nameTV = UILabel()
    let callNumber = UILabel()
    let businessNumberLabel = UILabel()
    let businessTypeLabel = UILabel()
    let businessNumber = UILabel()
    let swiperView = UIView()
    
    init (duration: String, name: String, number: String, businessType: String, businessNum: String) {
        super.init(nibName: nil, bundle: nil)
        self.duration = duration
        self.name = name
        self.number = number
        self.businessType = businessType
        self.businessNum = businessNum
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupNavigation()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shouldRemoveShadow(true)
        backViewHeightConstraint.constant = 100
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "Missed call"
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.layer.shadowColor = UIColor.white.cgColor
    }
    
    private func setupLayout() {
        setupBackView()
        setupCallImageView()
        setupCallDurationTextView()
        setupNameTV()
        setupCallNumber()
        setupBusinessNumberLabel()
        setupBusinessType()
        setupBusinessNumber()
        setupSwiperElement()
    }
    
    func setupBackView() {
        view.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        backViewHeightConstraint = backView.heightAnchor.constraint(equalToConstant: 1)
        backViewHeightConstraint.constant = 202
        backViewHeightConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            backView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backView.heightAnchor.constraint(equalToConstant: backViewHeightConstraint.constant)
        ])
        
        backView.backgroundColor = .gray
        
        backView.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))
        backView.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
    }
    
    func setupCallImageView() {
        backView.addSubview(callImageView)
        callImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            callImageView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
            callImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            callImageView.widthAnchor.constraint(equalToConstant: 56),
            callImageView.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        callImageView.image = UIImage(systemName: "phone.fill.arrow.down.left")
        callImageView.backgroundColor = .gray
        callImageView.layer.cornerRadius = 56/2
    }
    
    func setupCallDurationTextView() {
        backView.addSubview(callDurationTV)
        callDurationTV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            callDurationTV.topAnchor.constraint(equalTo: callImageView.bottomAnchor, constant: 8),
            callDurationTV.centerXAnchor.constraint(equalTo: callImageView.centerXAnchor),
            callDurationTV.widthAnchor.constraint(equalToConstant: 44),
            callDurationTV.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        callDurationTV.backgroundColor = .systemGray4
        callDurationTV.text = duration.substring(from: 3)
    }
    
    func setupNameTV() {
        backView.addSubview(nameTV)
        nameTV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameTV.leftAnchor.constraint(equalTo: callImageView.rightAnchor, constant: 16),
            nameTV.topAnchor.constraint(equalTo: backView.topAnchor, constant: 29),
            nameTV.heightAnchor.constraint(equalToConstant: 24),
            nameTV.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        nameTV.backgroundColor = .systemGray4
        nameTV.text = name
    }
    
    func setupCallNumber() {
        backView.addSubview(callNumber)
        callNumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            callNumber.leftAnchor.constraint(equalTo: nameTV.leftAnchor),
            callNumber.topAnchor.constraint(equalTo: nameTV.bottomAnchor, constant: 7),
            callNumber.heightAnchor.constraint(equalToConstant: 20),
            callNumber.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        callNumber.backgroundColor = .systemGray4
        callNumber.text = number
    }
    
    func setupBusinessNumberLabel() {
        backView.addSubview(businessNumberLabel)
        businessNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            businessNumberLabel.topAnchor.constraint(equalTo: callNumber.bottomAnchor, constant: 30),
            businessNumberLabel.leftAnchor.constraint(equalTo: callNumber.leftAnchor),
            businessNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            businessNumberLabel.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        //businessNumberLabel.backgroundColor = .systemGray4
        businessNumberLabel.text = ""
    }
    
    func setupBusinessType() {
        backView.addSubview(businessTypeLabel)
        businessTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            businessTypeLabel.topAnchor.constraint(equalTo: businessNumberLabel.bottomAnchor, constant: 8),
            businessTypeLabel.leftAnchor.constraint(equalTo: businessNumberLabel.leftAnchor),
            businessTypeLabel.heightAnchor.constraint(equalToConstant: 24),
            businessTypeLabel.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        businessTypeLabel.text = ""
    }
    
    func setupBusinessNumber() {
        backView.addSubview(businessNumber)
        businessNumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            businessNumber.topAnchor.constraint(equalTo: businessTypeLabel.bottomAnchor, constant: 4),
            businessNumber.leftAnchor.constraint(equalTo: businessTypeLabel.leftAnchor),
            businessNumber.heightAnchor.constraint(equalToConstant: 24),
            businessNumber.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        businessNumber.text = ""
    }
    
    func setupSwiperElement() {
        backView.addSubview(swiperView)
        swiperView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            swiperView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            swiperView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -3),
            swiperView.heightAnchor.constraint(equalToConstant: 4),
            swiperView.widthAnchor.constraint(equalToConstant: 16)
        ])
        
        swiperView.backgroundColor = .systemGray4
    }
    
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGestureRecognizer.direction = direction

        return swipeGestureRecognizer
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
                
        switch sender.direction
        {
        case .up:
            backViewHeightConstraint.constant = 100
            businessNumberLabel.text = ""
            businessTypeLabel.text = ""
            businessNumber.text = ""
            
        case .down:
            backViewHeightConstraint.constant = 202
            businessNumberLabel.text = "Business number"
            businessTypeLabel.text = businessType
            businessNumber.text = businessNum
        
        default: break
        }
        
        UIView.animate(withDuration: 0.13) {
            self.backView.layoutIfNeeded()
        } completion: { (_) in
            print("Animation completed")
        }
    }
}
