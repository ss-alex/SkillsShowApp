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
    let callImageViewSub = UIImageView()
    let callImageView = UIImageView()
    let callDurationLbl = UILabel()
    let nameLbl = UILabel()
    let callNumberLbl = UILabel()
    let businessNumberLbl = UILabel()
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
        view.backgroundColor = .white
        setupNavigation()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shouldRemoveShadow(true)
        backViewHeightConstraint.constant = 126
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "Missed call"
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.layer.shadowColor = UIColor.white.cgColor
    }
    
    private func setupLayout() {
        setupBackView()
        setupCallImageView()
        setupCallDurationLbl()
        setupNameLbl()
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
            backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backView.heightAnchor.constraint(equalToConstant: backViewHeightConstraint.constant)
        ])
        
        //Gesture recognizers:
        backView.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))
        backView.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
        
        backView.backgroundColor = .white
        backView.roundCorners([.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 18)
        
        backView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        backView.layer.shadowOffset = .zero
        backView.layer.shadowOpacity = 0.8
        backView.layer.shadowRadius = 16
        
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
        
        callImageView.addSubview(callImageViewSub)
        callImageViewSub.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            callImageViewSub.centerXAnchor.constraint(equalTo: callImageView.centerXAnchor),
            callImageViewSub.centerYAnchor.constraint(equalTo: callImageView.centerYAnchor),
            callImageViewSub.widthAnchor.constraint(equalToConstant: 40),
            callImageViewSub.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let icon = UIImage(systemName: "phone.fill.arrow.down.left")?
            .withTintColor(UIColor.mightyOrange,
                           renderingMode: .alwaysOriginal)
        
        callImageViewSub.image = icon
        
        callImageView.backgroundColor = .white
        callImageView.layer.cornerRadius = 56/2
        callImageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        callImageView.layer.shadowOffset = .zero
        callImageView.layer.shadowOpacity = 0.8
        callImageView.layer.shadowRadius = 4
    }
    
    func setupCallDurationLbl() {
        backView.addSubview(callDurationLbl)
        callDurationLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            callDurationLbl.topAnchor.constraint(equalTo: callImageView.bottomAnchor, constant: 8),
            callDurationLbl.centerXAnchor.constraint(equalTo: callImageView.centerXAnchor),
            callDurationLbl.widthAnchor.constraint(equalToConstant: 40),
            callDurationLbl.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        callDurationLbl.text = duration.substring(from: 3)
        callDurationLbl.font = UIFont.systemFont(ofSize: 13, weight: .light)
        callDurationLbl.textAlignment = .center
        callDurationLbl.tintColor = UIColor.sixty
        
    }
    
    func setupNameLbl() {
        backView.addSubview(nameLbl)
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLbl.leftAnchor.constraint(equalTo: callImageView.rightAnchor, constant: 16),
            nameLbl.topAnchor.constraint(equalTo: backView.topAnchor, constant: 29),
            nameLbl.heightAnchor.constraint(equalToConstant: 24),
            nameLbl.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        nameLbl.text = name
        nameLbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLbl.textAlignment = .left
        nameLbl.tintColor = UIColor.thirtyThree
    }
    
    func setupCallNumber() {
        backView.addSubview(callNumberLbl)
        callNumberLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            callNumberLbl.leftAnchor.constraint(equalTo: nameLbl.leftAnchor),
            callNumberLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 7),
            callNumberLbl.heightAnchor.constraint(equalToConstant: 17),
            callNumberLbl.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        callNumberLbl.text = number
        callNumberLbl.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        callNumberLbl.tintColor = UIColor.sixty
    }
    
    func setupBusinessNumberLabel() {
        backView.addSubview(businessNumberLbl)
        businessNumberLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            businessNumberLbl.topAnchor.constraint(equalTo: callNumberLbl.bottomAnchor, constant: 30),
            businessNumberLbl.leftAnchor.constraint(equalTo: callNumberLbl.leftAnchor),
            businessNumberLbl.heightAnchor.constraint(equalToConstant: 16),
            businessNumberLbl.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        businessNumberLbl.text = ""
        businessNumberLbl.font = UIFont.systemFont(ofSize: 13, weight: .light)
        businessNumberLbl.tintColor = UIColor.ao
    }
    
    func setupBusinessType() {
        backView.addSubview(businessTypeLabel)
        businessTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            businessTypeLabel.topAnchor.constraint(equalTo: businessNumberLbl.bottomAnchor, constant: 8),
            businessTypeLabel.leftAnchor.constraint(equalTo: businessNumberLbl.leftAnchor),
            businessTypeLabel.heightAnchor.constraint(equalToConstant: 22),
            businessTypeLabel.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        businessTypeLabel.text = ""
        businessTypeLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        businessTypeLabel.tintColor = UIColor.thirtyThree
    }
    
    func setupBusinessNumber() {
        backView.addSubview(businessNumber)
        businessNumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            businessNumber.topAnchor.constraint(equalTo: businessTypeLabel.bottomAnchor, constant: 4),
            businessNumber.leftAnchor.constraint(equalTo: businessTypeLabel.leftAnchor),
            businessNumber.heightAnchor.constraint(equalToConstant: 17),
            businessNumber.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        businessNumber.text = ""
        businessNumber.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        businessNumber.tintColor = UIColor.sixty
        
    }
    
    func setupSwiperElement() {
        backView.addSubview(swiperView)
        swiperView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            swiperView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            swiperView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -11),
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
            backViewHeightConstraint.constant = 126
            businessNumberLbl.text = ""
            businessTypeLabel.text = ""
            businessNumber.text = ""
            
        case .down:
            backViewHeightConstraint.constant = 202
            businessNumberLbl.text = "Business number"
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

extension UIView {

  func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
      self.layer.maskedCorners = corners
      self.layer.cornerRadius = radius
      //self.layer.borderWidth = borderWidth
      //self.layer.borderColor = borderColor.cgColor

  }

}
