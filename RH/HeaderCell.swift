//
//  HeaderCell.swift
//  RH
//
//  Created by Ellen Diana Guissoni on 13/11/19.
//  Copyright © 2019 Ellen Diana Guissoni. All rights reserved.
//

import UIKit
import HCSStarRatingView

class HeaderCell: UITableViewCell {
    var imageProfile: UIImage?
    var name: String?
    var ratting: Int?
    
    var imageProfileView: UIImageView = {
        var imageProfileView = UIImageView()
        imageProfileView.translatesAutoresizingMaskIntoConstraints = false
        imageProfileView.layer.masksToBounds = true
        imageProfileView.layer.cornerRadius = 50
        
        return imageProfileView
    }()
    
    var nameLabelView: UILabel = {
        let nameLabelView = UILabel()
        nameLabelView.translatesAutoresizingMaskIntoConstraints = false
        nameLabelView.font = UIFont(name: "ArialHebrew", size: 27)
        nameLabelView.textColor = .darkGray
        nameLabelView.textAlignment = .center
        
        return nameLabelView
    }()
    
    var rattingLabel: HCSStarRatingView = {
        let rattingLabel = HCSStarRatingView()
        rattingLabel.translatesAutoresizingMaskIntoConstraints = false
        rattingLabel.maximumValue = 5
        rattingLabel.allowsHalfStars = true
        rattingLabel.value = 2.5
        
        return rattingLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setupView() {
        self.addSubview(imageProfileView)
        self.addSubview(nameLabelView)
        self.addSubview(rattingLabel)
        
        dataSubView()
        
        let constraints = [
            imageProfileView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imageProfileView.widthAnchor.constraint(equalToConstant: 100),
            imageProfileView.heightAnchor.constraint(equalToConstant: 100),
            imageProfileView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            nameLabelView.topAnchor.constraint(equalTo: imageProfileView.bottomAnchor, constant: 10),
            nameLabelView.widthAnchor.constraint(equalToConstant: 400),
            nameLabelView.heightAnchor.constraint(equalToConstant: 30),
            nameLabelView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            rattingLabel.topAnchor.constraint(equalTo: nameLabelView.bottomAnchor, constant: 10),
            rattingLabel.widthAnchor.constraint(equalToConstant: 100),
            rattingLabel.heightAnchor.constraint(equalToConstant: 30),
            rattingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.bottomAnchor.constraint(equalTo: rattingLabel.bottomAnchor, constant: 20)
        ]
        
         NSLayoutConstraint.activate(constraints)
    }
    
    func dataSubView() {
        if let imageProfile = imageProfile {
            imageProfileView.image = imageProfile
        }
        
        if let name = name {
            nameLabelView.text = name
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
