# ContactsPlus programmatically

## UILabel

``` swift
class CustomLabels {
    
    let containerView: UIView = {
        let view            = UIView()
        view.clipsToBounds  = true // this will make sure its children do not go out of the boundary
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode         = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.layer.cornerRadius  = 35
        img.clipsToBounds        = true
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        return img
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
