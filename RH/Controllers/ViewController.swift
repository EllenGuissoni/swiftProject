//
//  ViewController.swift
//  RH
//
//  Created by Ellen Diana Guissoni on 12/11/19.
//  Copyright © 2019 Ellen Diana Guissoni. All rights reserved.
//

import UIKit

enum ComponentType {
    case HEADER
    case BODY
}

class Component {
    let type: ComponentType
    
    init(type: ComponentType) {
        self.type = type
    }
}

class Header: Component {
    let image: UIImage
    let name: String
    let ratting: Int
    
    init(image: UIImage, name: String, ratting: Int) {
        self.image = image
        self.name = name
        self.ratting = ratting
        
        super.init(type: ComponentType.HEADER)
    }
}

class Body: Component {
    let image: UIImage
    let title: String
    let subtitle: String
    
    init(image: UIImage, title: String, subtitle: String) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        
        super.init(type: ComponentType.BODY)
    }
}

class ViewController: UIViewController {
    let cellId = "id123"
    var data = [Component]()
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        
        tableView.alwaysBounceVertical = true
        tableView.alwaysBounceHorizontal = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Perfil"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let header = Header.init(image: UIImage(named: "helmet")!, name: "Astronauta Viajado", ratting: 5)
        let body = Body.init(image: UIImage(named: "mars")!, title: "Planeta", subtitle: "Marsh")
        let body2 = Body.init(image: UIImage(named: "moon")!, title: "Lua", subtitle: "Lassh")
        let body3 = Body.init(image: UIImage(named: "telescope")!, title: "Especialidade", subtitle: "Ver mundos")
    
        data = [
           header,
           body,
           body2,
           body3,
           body,
           body2, 
           body3,
           body,
           body2,
           body3,
           body,
           body2,
           body3
        ]
        
        setupView()
        tableView.separatorStyle = .none
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       switch data[indexPath.row].type {
       case ComponentType.HEADER:
           let cell = HeaderCell()
           cell.selectionStyle = UITableViewCell.SelectionStyle.none
           cell.imageProfile = (data[indexPath.row] as! Header).image
           cell.ratting = (data[indexPath.row] as! Header).ratting
           cell.name = (data[indexPath.row] as! Header).name
           cell.setupView()
                   
           return cell
       default:
           let cell = BodyCell()
           cell.selectionStyle = UITableViewCell.SelectionStyle.none
           cell.imageBody = (data[indexPath.row] as! Body).image
           cell.title = (data[indexPath.row] as! Body).title
           cell.subtitle = (data[indexPath.row] as! Body).subtitle
           cell.setupView()
           
           return cell
       }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func setupView() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
