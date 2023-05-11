//
//  AlertView.swift
//  Exchanger
//
//  Created by Content Arcade on 11/05/2023.
//

import UIKit
import Foundation

class AlertView: UIAlertController {
    
    var titleLabel: UILabel?
    var descriptionLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the title label
        titleLabel = UILabel()
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel?.textAlignment = .center
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        // Create the description label
        descriptionLabel = UILabel()
        descriptionLabel?.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel?.textAlignment = .center
        descriptionLabel?.numberOfLines = 0
        descriptionLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the title and description labels to the alert controller's view
        view.addSubview(titleLabel!)
        view.addSubview(descriptionLabel!)
        
        // Configure the layout constraints for the labels
        NSLayoutConstraint.activate([
            titleLabel!.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLabel!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel!.topAnchor.constraint(equalTo: titleLabel!.bottomAnchor, constant: 10),
            descriptionLabel!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    func setTitle(_ title: String?) {
        titleLabel?.text = title
    }
    
    func setDescription(_ description: String?) {
        descriptionLabel?.text = description
    }
    
    
}
