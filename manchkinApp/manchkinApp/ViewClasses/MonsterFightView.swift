//
//  MonsterFightView.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 29.08.22.
//

import UIKit

class MonsterFightView: UIView {

    var updateFunc: (() -> Void)?
    
    private let monsterNameLabel: UILabel = {
        let monsterNameLabel = UILabel()
        monsterNameLabel.text = "Монстр"
        monsterNameLabel.textColor = .black
        monsterNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        monsterNameLabel.adjustsFontSizeToFitWidth = true
        monsterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        monsterNameLabel.textAlignment = .center
        return monsterNameLabel
    }()

    
    public lazy var levelCharacteristics: atributeWork = {
        let levelCharacteristic = atributeWork(frame: CGRect.zero, minusFunc: {self.updateFunc!()}, plusFunc: {self.updateFunc!()}, atributeName: "Уровень")
        levelCharacteristic.atributeValueLabel.text = "0"
        return levelCharacteristic
    }()
    
    public lazy var modificatorCharacteristics: atributeWork = {
        let modificatorCharacteristic = atributeWork(frame: CGRect.zero, minusFunc: {self.updateFunc!()},plusFunc: {self.updateFunc!()}, atributeName: "Бонус")
        modificatorCharacteristic.atributeValueLabel.text = "0"
        return modificatorCharacteristic
    }()
    
    init(frame: CGRect, updateFunc: @escaping () -> Void) {
        self.updateFunc = updateFunc
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addElementsAndAnchors()
    }
    
    required init?(coder: NSCoder) {
        updateFunc = nil
        super.init(coder: coder)
        addElementsAndAnchors()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addElementsAndAnchors() {
        self.addSubview(monsterNameLabel)
        monsterNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        monsterNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        monsterNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        monsterNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        self.addSubview(levelCharacteristics)
        levelCharacteristics.topAnchor.constraint(equalTo: monsterNameLabel.bottomAnchor, constant: 5).isActive = true
        levelCharacteristics.rightAnchor.constraint(equalTo: self.centerXAnchor, constant: -10).isActive = true
        levelCharacteristics.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        levelCharacteristics.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        self.addSubview(modificatorCharacteristics)
        modificatorCharacteristics.topAnchor.constraint(equalTo: monsterNameLabel.bottomAnchor, constant: 5).isActive = true
        modificatorCharacteristics.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: 10).isActive = true
        modificatorCharacteristics.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        modificatorCharacteristics.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
    }
}
