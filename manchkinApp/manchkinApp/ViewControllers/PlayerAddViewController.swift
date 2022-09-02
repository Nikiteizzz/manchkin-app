//
//  PlayerAddViewController.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 2.09.22.
//

import UIKit

class PlayerAddViewController: UIViewController {
    
    var newPlayer: Player?
    
    public var addPlayerLabel: UILabel = {
        let addPlayerLabel = UILabel()
        addPlayerLabel.text = "Добавление игрока"
        addPlayerLabel.textColor = .black
        addPlayerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        addPlayerLabel.adjustsFontSizeToFitWidth = true
        addPlayerLabel.translatesAutoresizingMaskIntoConstraints = false
        addPlayerLabel.textAlignment = .center
        return addPlayerLabel
    }()
    
    public var nameOfPlayerTextField: UITextField = {
        let nameOfPlayerTextField = UITextField()
        nameOfPlayerTextField.placeholder = "Введите имя"
        nameOfPlayerTextField.clearButtonMode = .whileEditing
        nameOfPlayerTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameOfPlayerTextField
    }()
    
    public lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.layer.borderWidth = 0
        addButton.layer.cornerRadius = 10
        addButton.backgroundColor = .blue
        addButton.setTitleColor(UIColor.white, for: .normal)
        nameOfPlayerTextField.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    public lazy var playerIcon: UIImageView = {
        let playerIcon = UIImageView()
        let icon = newPlayer?.playerPicture
        playerIcon.image = icon
        nameOfPlayerTextField.translatesAutoresizingMaskIntoConstraints = false
        return playerIcon
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        newPlayer = Player(name: "")
        self.view.backgroundColor = .white
        self.view.addSubview(addPlayerLabel)
        addPlayerLabel.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        addPlayerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addPlayerLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15).isActive = true
        addPlayerLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
    }
}
