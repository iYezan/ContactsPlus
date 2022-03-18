<p align="right">
<img width="260" alt="CNFT" src="https://user-images.githubusercontent.com/29463442/155158499-ac60b4c0-eb90-470a-ad74-b375a9683ea8.png">
</p>

## Programmatic views

## UILabel

``` swift
class CustomLabels {
    
    let containerView: UIView = {
        let view            = UIView()
        view.clipsToBounds  = true // this will make sure its children do not go out of the boundary
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()

    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let jobTitleDetailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .white
        label.backgroundColor =  UIColor(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
```

## UIImageview Programmatically in swift

``` swift
class CustomImageView {
    
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode         = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.layer.cornerRadius  = 35
        img.clipsToBounds        = true
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        return img
    }()
    
    let countryImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    }()
}
```

## ContactTableViewCell Programmatically in swift

``` swift
class ContactTableViewCell: UITableViewCell {
    
    let customLabel = CustomLabels()
    let customImage = CustomImageView()
    
    var contact: Contact? {
        didSet {
            guard let contactItem = contact else {return}
            if let name = contactItem.name {
                customImage.profileImageView.image = UIImage(named: name)
                customLabel.nameLabel.text = name
            }
            if let jobTitle = contactItem.jobTitle {
                customLabel.jobTitleDetailedLabel.text = " \(jobTitle) "
            }
            
            if let country = contactItem.country {
                customImage.countryImageView.image = UIImage(named: country)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(customImage.profileImageView)
        customLabel.containerView.addSubview(customLabel.nameLabel)
        customLabel.containerView.addSubview(customLabel.jobTitleDetailedLabel)
        contentView.addSubview(customLabel.containerView)
        contentView.addSubview(customImage.countryImageView)
        
        
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
            customImage.profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            customImage.profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10),
            customImage.profileImageView.widthAnchor.constraint(equalToConstant:70),
            customImage.profileImageView.heightAnchor.constraint(equalToConstant:70)
        ])
    }
    
    func configureContainerView() {
        NSLayoutConstraint.activate([
            customLabel.containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            customLabel.containerView.leadingAnchor.constraint(equalTo:self.customImage.profileImageView.trailingAnchor, constant:10),
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
            customImage.countryImageView.widthAnchor.constraint(equalToConstant:26),
            customImage.countryImageView.heightAnchor.constraint(equalToConstant:26),
            customImage.countryImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20),
            customImage.countryImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor)
        ])
    }
}
```

## Creating a TableView programmatically

``` swift
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

extension ContactsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContactTableViewCell
        
        cell.contact = contacts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}
```
