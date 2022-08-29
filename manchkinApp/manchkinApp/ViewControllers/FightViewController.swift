//
//  FightViewController.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 29.08.22.
//

import UIKit

class FightViewController: UIViewController {

    var currentPlayer: Player?
    var secondHerro: Player?
    var updateFunc: (() -> Void)?
    var playersArr: [Player]?
    
    private let actionNameLabel: UILabel = {
        let actionNameLabel = UILabel()
        actionNameLabel.text = "Битва началась!"
        actionNameLabel.textColor = .black
        actionNameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        actionNameLabel.adjustsFontSizeToFitWidth = true
        actionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        actionNameLabel.textAlignment = .center
        return actionNameLabel
    }()
    
    private lazy var VSLabel: UILabel = {
        let VSLabel = UILabel()
        VSLabel.font = UIFont.boldSystemFont(ofSize: 40)
        VSLabel.text = "VS"
        VSLabel.textAlignment = .center
        VSLabel.textColor = .black
        VSLabel.adjustsFontSizeToFitWidth = true
        VSLabel.translatesAutoresizingMaskIntoConstraints = false
        return VSLabel
    }()
    
    private lazy var heroesStrengthLabel: UILabel = {
        let heroStrengthLabel = UILabel()
        heroStrengthLabel.font = UIFont.boldSystemFont(ofSize: 40)
        heroStrengthLabel.text = String (currentPlayer!.level + currentPlayer!.itemsBoost + currentPlayer!.modificationPoins)
        heroStrengthLabel.textColor = .green
        heroStrengthLabel.textAlignment = .center
        heroStrengthLabel.adjustsFontSizeToFitWidth = true
        heroStrengthLabel.translatesAutoresizingMaskIntoConstraints = false
        return heroStrengthLabel
    }()
    
    private lazy var monstersStrengthLabel: UILabel = {
        let monstersStrengthLabel = UILabel()
        monstersStrengthLabel.font = UIFont.boldSystemFont(ofSize: 40)
        monstersStrengthLabel.text = String (Int(monsterView.levelCharacteristics.atributeValueLabel.text!)! + Int(monsterView.modificatorCharacteristics.atributeValueLabel.text!)!)
        monstersStrengthLabel.textColor = .red
        monstersStrengthLabel.textAlignment = .center
        monstersStrengthLabel.adjustsFontSizeToFitWidth = true
        monstersStrengthLabel.translatesAutoresizingMaskIntoConstraints = false
        return monstersStrengthLabel
    }()
    
    private lazy var playerView: PlayerFightView = {
        let playerView = PlayerFightView(frame: CGRect.zero, updateFunc: {self.updateFunc!(); self.updateCurrentHeroesStrength()}, player: currentPlayer!)
        return playerView
    }()
    
    private lazy var secondPlayerView: PlayerFightView = {
        let playerView = PlayerFightView(frame: CGRect.zero, updateFunc: {self.updateFunc!(); self.updateCurrentHeroesStrength()}, player: currentPlayer!)
        playerView.isHidden = true
        return playerView
    }()
    
    private lazy var monsterView: MonsterFightView = {
        let monsterView = MonsterFightView(frame: CGRect.zero, updateFunc: {self.updateCurrentMonstersStrength()})
        return monsterView
    }()
    
    private lazy var secondMonsterView: MonsterFightView = {
        let monsterView = MonsterFightView(frame: CGRect.zero, updateFunc: {self.updateCurrentMonstersStrength()})
        monsterView.isHidden = true
        return monsterView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(actionNameLabel)
        actionNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        actionNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        actionNameLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15).isActive = true
        actionNameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        self.view.addSubview(playerView)
        playerView.topAnchor.constraint(equalTo: actionNameLabel.bottomAnchor).isActive = true
        playerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        playerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        playerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        self.view.addSubview(VSLabel)
        VSLabel.topAnchor.constraint(equalTo: playerView.bottomAnchor).isActive = true
        VSLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        VSLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        VSLabel.widthAnchor.constraint(equalTo: VSLabel.heightAnchor).isActive = true
        self.view.addSubview(heroesStrengthLabel)
        heroesStrengthLabel.topAnchor.constraint(equalTo: playerView.bottomAnchor).isActive = true
        heroesStrengthLabel.rightAnchor.constraint(equalTo: VSLabel.leftAnchor).isActive = true
        heroesStrengthLabel.heightAnchor.constraint(equalTo: VSLabel.heightAnchor).isActive = true
        heroesStrengthLabel.widthAnchor.constraint(equalTo: heroesStrengthLabel.heightAnchor).isActive = true
        self.view.addSubview(monstersStrengthLabel)
        monstersStrengthLabel.topAnchor.constraint(equalTo: playerView.bottomAnchor).isActive = true
        monstersStrengthLabel.leftAnchor.constraint(equalTo: VSLabel.rightAnchor).isActive = true
        monstersStrengthLabel.heightAnchor.constraint(equalTo: VSLabel.heightAnchor).isActive = true
        monstersStrengthLabel.widthAnchor.constraint(equalTo: monstersStrengthLabel.heightAnchor).isActive = true
        self.view.addSubview(monsterView)
        monsterView.topAnchor.constraint(equalTo: VSLabel.bottomAnchor, constant: 10).isActive = true
        monsterView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        monsterView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        monsterView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
    }
    
    func updateCurrentHeroesStrength() {
        var heroesStrength = currentPlayer!.modificationPoins + currentPlayer!.itemsBoost + currentPlayer!.level
        if secondHerro != nil {
            heroesStrength += secondHerro!.level + secondHerro!.modificationPoins + secondHerro!.itemsBoost
        }
        heroesStrengthLabel.text = String(heroesStrength)
    }
    
    func updateCurrentMonstersStrength() {
        var monstersStrength = Int(monsterView.levelCharacteristics.atributeValueLabel.text!)! + Int(monsterView.modificatorCharacteristics.atributeValueLabel.text!)!
        monstersStrength += Int(secondMonsterView.levelCharacteristics.atributeValueLabel.text!)! + Int(secondMonsterView.modificatorCharacteristics.atributeValueLabel.text!)!
        monstersStrengthLabel.text = String(monstersStrength)
    }
}
