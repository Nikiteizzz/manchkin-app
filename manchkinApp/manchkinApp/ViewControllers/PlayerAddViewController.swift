//
//  PlayerAddViewController.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 2.09.22.
//

import UIKit

class PlayerAddViewController: UIViewController {
    
    var newPlayer: Player?
    var addFunc: (() -> Void)?
    
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
        nameOfPlayerTextField.attributedPlaceholder = NSAttributedString(string: "Введите имя", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        nameOfPlayerTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: nameOfPlayerTextField.frame.height))
        nameOfPlayerTextField.leftViewMode = .always
        nameOfPlayerTextField.layer.borderWidth = 1
        nameOfPlayerTextField.textColor = .black
        nameOfPlayerTextField.layer.cornerRadius = 10
        nameOfPlayerTextField.layer.borderColor = CGColor(red: 179 / 255, green: 179 / 255, blue: 179 / 255, alpha: 1)
        nameOfPlayerTextField.clearButtonMode = .whileEditing
        nameOfPlayerTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameOfPlayerTextField
    }()
    
    public lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Добавить!", for: .normal)
        addButton.layer.borderWidth = 0
        addButton.layer.cornerRadius = 10
        addButton.backgroundColor = UIColor(cgColor: CGColor(red: 243 / 255, green: 95 / 255, blue: 75 / 255, alpha: 1.0))
        addButton.setTitleColor(UIColor.white, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(nil, action: #selector(addButtonTapped), for: .touchUpInside)
        return addButton
    }()
    
    public lazy var playerIcon: UIImageView = {
        let playerIcon = UIImageView()
        let icon = newPlayer?.playerPicture
        playerIcon.image = icon
        playerIcon.translatesAutoresizingMaskIntoConstraints = false
        return playerIcon
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(sender:)))
        self.view.addGestureRecognizer(tapScreen)
        self.view.addSubview(addPlayerLabel)
        addPlayerLabel.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        addPlayerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addPlayerLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15).isActive = true
        addPlayerLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        self.view.addSubview(playerIcon)
        playerIcon.topAnchor.constraint(equalTo: addPlayerLabel.bottomAnchor).isActive = true
        playerIcon.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        playerIcon.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        playerIcon.heightAnchor.constraint(equalTo: playerIcon.widthAnchor).isActive = true
        self.view.addSubview(nameOfPlayerTextField)
        nameOfPlayerTextField.leftAnchor.constraint(equalTo: playerIcon.rightAnchor, constant: 15).isActive = true
        nameOfPlayerTextField.centerYAnchor.constraint(equalTo: playerIcon.centerYAnchor).isActive = true
        nameOfPlayerTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.55).isActive = true
        nameOfPlayerTextField.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06).isActive = true
        self.view.addSubview(addButton)
        addButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        addButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        addButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    @objc func addButtonTapped() {
        if nameOfPlayerTextField.text != nil {
            newPlayer!.name = nameOfPlayerTextField.text!
            addFunc!()
            let successAlert = UIAlertController(title: "Успешно!", message: "Игрок был добавлен", preferredStyle: .alert)
            let successAlertAction = UIAlertAction(title: "В бой!", style: .default) { _ in self.dismiss(animated: true) }
            successAlert.addAction(successAlertAction)
            present(successAlert, animated: true)
        } else {
            let failAllert = UIAlertController(title: "Ошибка!", message: "Сначала введите имя", preferredStyle: .alert)
            failAllert.addAction(UIAlertAction(title: "Окей", style: .default))
            present(failAllert, animated: true)
        }
    }
    
    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
