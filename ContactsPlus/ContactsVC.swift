//
//  ViewController.swift
//  ContactsPlus
//
//  Created by iYezan on 22/02/2022.
//

import UIKit

class ContactsVC: UIViewController {
    
    let contacts = Contact.getContacts
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //      contactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "contactCell")
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "Cell")
        configureContactsTableView()
        setupNavigationController()
    }
    
    func configureContactsTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupNavigationController() {
        title = "CNFT"
        navigationController?.navigationBar.prefersLargeTitles  = true
        view.backgroundColor     = .white
        navigationController?.navigationBar.prefersLargeTitles  = true
        navigationController?.hidesBarsOnSwipe                  = false
    }
}

