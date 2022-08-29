//
//  PlayerFightView.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 29.08.22.
//

import UIKit

class PlayerFightView: UIView {

    var currentPlayer: Player?
    var updateFunc: (() -> Void)?
    
    private lazy var playerNameLabel: UILabel = {
        let playerNameLabel = UILabel()
        playerNameLabel.text = currentPlayer!.name
        playerNameLabel.textColor = .black
        playerNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        playerNameLabel.adjustsFontSizeToFitWidth = true
        playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        playerNameLabel.textAlignment = .center
        return playerNameLabel
    }()
    
    public lazy var levelCharacteristics: atributeWork = {
        let levelCharacteristic = atributeWork(frame: CGRect.zero,
                                               minusFunc:   { self.currentPlayer!.level -= 1
                                                            self.updateFunc!()
                                                            },
                                               plusFunc:    { self.currentPlayer!.level += 1
                                                            self.updateFunc!()
                                                            },
                                               atributeName: "Уровень")
        levelCharacteristic.atributeValueLabel.text = String(currentPlayer!.level)
        return levelCharacteristic
    }()
    
    public lazy var itemsBoostCharacteristics: atributeWork = {
        let itemsBoostCharacteristic = atributeWork(frame: CGRect.zero,
                                                    minusFunc:   { self.currentPlayer!.itemsBoost -= 1
                                                            self.updateFunc!()
                                                            },
                                                    plusFunc:    { self.currentPlayer!.itemsBoost += 1
                                                            self.updateFunc!()
                                                            },
                                               atributeName: "Вещи")
        itemsBoostCharacteristic.atributeValueLabel.text = String(currentPlayer!.itemsBoost)
        return itemsBoostCharacteristic
    }()
    
    public lazy var modificatorCharacteristics: atributeWork = {
        let modificatorCharacteristic = atributeWork(frame: CGRect.zero,
                                                    minusFunc:   { self.currentPlayer!.modificationPoins -= 1
                                                            self.updateFunc!()
                                                            },
                                                    plusFunc:    { self.currentPlayer!.modificationPoins += 1
                                                            self.updateFunc!()
                                                            },
                                               atributeName: "Бонус")
        modificatorCharacteristic.atributeValueLabel.text = String(currentPlayer!.modificationPoins)
        return modificatorCharacteristic
    }()
    
    init(frame: CGRect, updateFunc: @escaping () -> Void, player: Player) {
        self.updateFunc = updateFunc
        self.currentPlayer = player
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addElementsAndAnchors()
    }
    
    required init?(coder: NSCoder) {
        updateFunc = nil
        super.init(coder: coder)
    }
    
    func addElementsAndAnchors() {
        self.addSubview(playerNameLabel)
        playerNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        playerNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        playerNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        playerNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        self.addSubview(levelCharacteristics)
        levelCharacteristics.topAnchor.constraint(equalTo: playerNameLabel.bottomAnchor, constant: 5).isActive = true
        levelCharacteristics.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        levelCharacteristics.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        levelCharacteristics.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        self.addSubview(itemsBoostCharacteristics)
        itemsBoostCharacteristics.topAnchor.constraint(equalTo: playerNameLabel.bottomAnchor, constant: 5).isActive = true
        itemsBoostCharacteristics.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        itemsBoostCharacteristics.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        itemsBoostCharacteristics.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        self.addSubview(modificatorCharacteristics)
        modificatorCharacteristics.topAnchor.constraint(equalTo: playerNameLabel.bottomAnchor, constant: 5).isActive = true
        modificatorCharacteristics.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        modificatorCharacteristics.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        modificatorCharacteristics.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
    }
}
