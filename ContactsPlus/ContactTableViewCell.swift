//
//  ContactTableViewCell.swift
//  ContactsPlus
//
//  Created by iYezan on 22/02/2022.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    let customLabel = CustomLabels()
    
    var contact: Contact? {
        didSet {
            guard let contactItem = contact else {return}
            if let name = contactItem.name {
                customLabel.profileImageView.image = UIImage(named: name)
                customLabel.nameLabel.text = name
            }
            if let jobTitle = contactItem.jobTitle {
                customLabel.jobTitleDetailedLabel.text = " \(jobTitle) "
            }
            
            if let country = contactItem.country {
                customLabel.countryImageView.image = UIImage(named: country)
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(customLabel.profileImageView)
        customLabel.containerView.addSubview(customLabel.nameLabel)
        customLabel.containerView.addSubview(customLabel.jobTitleDetailedLabel)
        contentView.addSubview(customLabel.containerView)
        contentView.addSubview(customLabel.countryImageView)
        
        
        configureprofileImageView()
        configureContainerView()
        configureNameLabel()
        configureJobTitleDetailedLabel()
        configureCountryImageView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }

    func configureprofileImageView() {
        NSLayoutConstraint.activate([
            customLabel.profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            customLabel.profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10),
            customLabel.profileImageView.widthAnchor.constraint(equalToConstant:70),
            customLabel.profileImageView.heightAnchor.constraint(equalToConstant:70)
        ])
    }
    
    func configureContainerView() {
        NSLayoutConstraint.activate([
            customLabel.containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            customLabel.containerView.leadingAnchor.constraint(equalTo:self.customLabel.profileImageView.trailingAnchor, constant:10),
            customLabel.containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10),
            customLabel.containerView.heightAnchor.constraint(equalToConstant:40)
        ])
    }
    
    func configureNameLabel() {
        
        NSLayoutConstraint.activate([
            customLabel.nameLabel.topAnchor.constraint(equalTo:self.customLabel.containerView.topAnchor),
            customLabel.nameLabel.leadingAnchor.constraint(equalTo:self.customLabel.containerView.leadingAnchor),
            customLabel.nameLabel.trailingAnchor.constraint(equalTo:self.customLabel.containerView.trailingAnchor)
        ])
    }
    
    func configureJobTitleDetailedLabel() {
        NSLayoutConstraint.activate([
            customLabel.jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.customLabel.nameLabel.bottomAnchor),
            customLabel.jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.customLabel.containerView.leadingAnchor),
            customLabel.jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.customLabel.nameLabel.bottomAnchor),
            customLabel.jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.customLabel.containerView.leadingAnchor)
        ])
    }
    
    func configureCountryImageView() {
        NSLayoutConstraint.activate([
            customLabel.countryImageView.widthAnchor.constraint(equalToConstant:26),
            customLabel.countryImageView.heightAnchor.constraint(equalToConstant:26),
            customLabel.countryImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20),
            customLabel.countryImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor)
        ])
    }
}
