//
//  BodyCell.swift
//  RH
//
//  Created by Ellen Diana Guissoni on 20/11/19.
//  Copyright © 2019 Ellen Diana Guissoni. All rights reserved.
//

import UIKit

class BodyCell: UITableViewCell {
    var title: String?
    var subtitle: String?
    var imageBody: UIImage?
    
    var imageBodyView: UIImageView = {
        var imageBodyView = UIImageView()
        imageBodyView .translatesAutoresizingMaskIntoConstraints = false
        
        return imageBodyView
    }()
    
    var titleLabelView: UILabel = {
        var titleLabelView = UILabel()
        titleLabelView.translatesAutoresizingMaskIntoConstraints = false
        titleLabelView.font = UIFont(name: "Copperplate-Light", size: 15)
        titleLabelView.textColor = .gray
        
        return titleLabelView
    }()
    
    var subtitleLabelView: UILabel = {
        var subtitleLabelView = UILabel()
        subtitleLabelView.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabelView.font = UIFont(name: "ArialHebrew", size: 18)
        subtitleLabelView.numberOfLines = 0
        
        return subtitleLabelView
    }()
    
    var lineView: UIView = {
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .gray
        
        return lineView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setupView() {
        self.addSubview(imageBodyView)
        self.addSubview(titleLabelView)
        self.addSubview(subtitleLabelView)
        self.addSubview(lineView)

        dataSubView()

        let constraints = [
        imageBodyView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        imageBodyView.widthAnchor.constraint(equalToConstant: 50),
        imageBodyView.heightAnchor.constraint(equalToConstant: 50),
        imageBodyView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),

        titleLabelView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        titleLabelView.leftAnchor.constraint(equalTo: self.imageBodyView.rightAnchor, constant: 10),
        titleLabelView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),

        subtitleLabelView.topAnchor.constraint(equalTo: self.titleLabelView.bottomAnchor, constant: 10),
        subtitleLabelView.leftAnchor.constraint(equalTo: self.imageBodyView.rightAnchor, constant: 10),
        subtitleLabelView.rightAnchor.constraint(equalTo: self.rightAnchor),

        lineView.topAnchor.constraint(equalTo: self.subtitleLabelView.bottomAnchor, constant: 5),
        lineView.leftAnchor.constraint(equalTo: self.imageBodyView.rightAnchor, constant: 10),
        lineView.heightAnchor.constraint(equalToConstant: 1),
        lineView.rightAnchor.constraint(equalTo: self.rightAnchor),
        lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)

        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    func dataSubView() {
        if let image = imageBody {
            imageBodyView.image = image
        }
        
        if let title = title {
            titleLabelView.text = title
        }
        
        if let subtitle = subtitle {
            subtitleLabelView.text = subtitle
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
