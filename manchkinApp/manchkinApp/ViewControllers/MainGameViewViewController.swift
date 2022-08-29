//
//  MainGameViewViewController.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 29.08.22.
//

import UIKit

class MainGameViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Storyboardable {

    weak var coordinator: AppCoordinator?
    
    var currentPlayer:Player = Player(name: "NONE")
    var playersArr:[Player] = [Player(name: "Никита", level: 1, itemsBoost: 1), Player(name: "Паша", level: 2, itemsBoost: 3)]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private lazy var levelStatistic: atributeWork = {
        let levelStatistics = atributeWork(frame: CGRect.zero, minusFunc: minusPointToLevel , plusFunc: plusPointToLevel, atributeName: "Уровень")
        levelStatistics.translatesAutoresizingMaskIntoConstraints = false
        return levelStatistics
    }()
    
    private lazy var itemsBoostStatistics: atributeWork = {
        let itemsBoostStatistics = atributeWork(frame: CGRect.zero, minusFunc: minusPointToItems, plusFunc: plusPointToItems, atributeName: "Вещи")
        itemsBoostStatistics.translatesAutoresizingMaskIntoConstraints = false
        return itemsBoostStatistics
    }()
    
    private var gameStartedView: UIView = {
        let gameStartedView = UIView()
        gameStartedView.backgroundColor = UIColor(cgColor: CGColor(red: 243 / 255, green: 95 / 255, blue: 75 / 255, alpha: 1.0))
        let gameStartedLabel = UILabel()
        gameStartedLabel.text = "Игра началась!"
        gameStartedLabel.textColor = .white
        gameStartedLabel.textAlignment = .center
        gameStartedLabel.font = UIFont.boldSystemFont(ofSize: 25)
        gameStartedLabel.translatesAutoresizingMaskIntoConstraints = false
        gameStartedView.translatesAutoresizingMaskIntoConstraints = false
        gameStartedView.addSubview(gameStartedLabel)
        gameStartedLabel.bottomAnchor.constraint(equalTo: gameStartedView.bottomAnchor, constant: -15).isActive = true
        gameStartedLabel.leftAnchor.constraint(equalTo: gameStartedView.leftAnchor).isActive = true
        gameStartedLabel.widthAnchor.constraint(equalTo: gameStartedView.widthAnchor).isActive = true
        gameStartedLabel.heightAnchor.constraint(equalTo: gameStartedView.heightAnchor, multiplier: 0.3).isActive = true
        return gameStartedView
    }()
    
    private lazy var playersTable: UITableView = {
        let playersTable = UITableView.init(frame: CGRect.zero, style: UITableView.Style.plain)
        playersTable.backgroundColor = .white
        playersTable.register(PlayerInfoView.self, forCellReuseIdentifier: "PlayerCell")
        playersTable.rowHeight = 70
        playersTable.translatesAutoresizingMaskIntoConstraints = false
        return playersTable
    }()
    
    private var playerNameLabel: UILabel = {
        let playerNameLabel = UILabel()
        playerNameLabel.text = "Выберите игрока!"
        playerNameLabel.textColor = .black
        playerNameLabel.textAlignment = .center
        playerNameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        playerNameLabel.adjustsFontSizeToFitWidth = true
        playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return playerNameLabel
    }()
    
    private var currentStrengthLabel: UILabel = {
        let currentStrengthLabel = UILabel()
        currentStrengthLabel.text = "0"
        currentStrengthLabel.font = UIFont.boldSystemFont(ofSize: 50)
        currentStrengthLabel.adjustsFontSizeToFitWidth = true
        currentStrengthLabel.textColor = .black
        currentStrengthLabel.textAlignment = .center
        currentStrengthLabel.translatesAutoresizingMaskIntoConstraints = false
        return currentStrengthLabel
    }()
    
    private var workWithLevelCharacteristic: UIView = {
        let parametrDescription = UIView()
        let parametrName = UILabel()
        parametrName.text = "Уровень"
        parametrName.textColor = .black
        parametrName.textAlignment = .center
        parametrName.font = UIFont.systemFont(ofSize: 15)
        parametrName.adjustsFontSizeToFitWidth = true
        parametrName.translatesAutoresizingMaskIntoConstraints = false
        parametrDescription.addSubview(parametrName)
        parametrName.leftAnchor.constraint(equalTo: parametrDescription.leftAnchor).isActive = true
        parametrName.topAnchor.constraint(equalTo: parametrDescription.topAnchor).isActive = true
        parametrName.widthAnchor.constraint(equalTo: parametrDescription.widthAnchor, multiplier: 0.8).isActive = true
        parametrName.heightAnchor.constraint(equalTo: parametrDescription.heightAnchor, multiplier: 0.15).isActive = true
        return parametrDescription
    }()
    
    private let startFightingButton: UIButton = {
        let fightingButton = UIButton()
        fightingButton.setImage(UIImage(named: "fightButtonIcon"), for: .normal)
        fightingButton.addTarget(nil, action: #selector(startFighting), for: .touchUpInside)
        fightingButton.translatesAutoresizingMaskIntoConstraints = false
        return fightingButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Игра началась!"
        self.view.addSubview(gameStartedView)
        gameStartedView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        gameStartedView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        gameStartedView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        gameStartedView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.13).isActive = true
        self.view.addSubview(playerNameLabel)
        playerNameLabel.topAnchor.constraint(equalTo: gameStartedView.bottomAnchor).isActive = true
        playerNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        playerNameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        playerNameLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        self.view.addSubview(currentStrengthLabel)
        currentStrengthLabel.topAnchor.constraint(equalTo: playerNameLabel.bottomAnchor).isActive = true
        currentStrengthLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        currentStrengthLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        currentStrengthLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        self.view.addSubview(levelStatistic)
        levelStatistic.topAnchor.constraint(equalTo: currentStrengthLabel.bottomAnchor).isActive = true
        levelStatistic.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        levelStatistic.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        levelStatistic.widthAnchor.constraint(equalTo: levelStatistic.heightAnchor).isActive = true
        self.view.addSubview(itemsBoostStatistics)
        itemsBoostStatistics.topAnchor.constraint(equalTo: currentStrengthLabel.bottomAnchor).isActive = true
        itemsBoostStatistics.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        itemsBoostStatistics.heightAnchor.constraint(equalTo: levelStatistic.heightAnchor).isActive = true
        itemsBoostStatistics.widthAnchor.constraint(equalTo: itemsBoostStatistics.heightAnchor).isActive = true
        self.view.addSubview(playersTable)
        playersTable.dataSource = self
        playersTable.delegate = self
        playersTable.topAnchor.constraint(equalTo: itemsBoostStatistics.bottomAnchor).isActive = true
        playersTable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        playersTable.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        playersTable.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
        self.view.addSubview(startFightingButton)
        startFightingButton.rightAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        startFightingButton.topAnchor.constraint(equalTo: playersTable.bottomAnchor, constant: -15).isActive = true
        startFightingButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.15).isActive = true
        startFightingButton.heightAnchor.constraint(equalTo: startFightingButton.widthAnchor).isActive = true
    }
    
    func updateCharacteristics() {
        levelStatistic.atributeValueLabel.text = String(currentPlayer.level)
        itemsBoostStatistics.atributeValueLabel.text = String(currentPlayer.itemsBoost)
        currentStrengthLabel.text = String(currentPlayer.level + currentPlayer.itemsBoost)
    }
    
    func plusPointToLevel() {
        currentPlayer.level += 1
        currentStrengthLabel.text = String(Int(currentStrengthLabel.text!)! + 1)
    }
    
    func minusPointToLevel() {
        currentPlayer.level -= 1
        currentStrengthLabel.text = String(Int(currentStrengthLabel.text!)! - 1)
    }
    
    func plusPointToItems() {
        currentPlayer.itemsBoost += 1
        currentStrengthLabel.text = String(Int(currentStrengthLabel.text!)! + 1)
    }
    
    func minusPointToItems() {
        currentPlayer.itemsBoost -= 1
        currentStrengthLabel.text = String(Int(currentStrengthLabel.text!)! - 1)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentPlayer = playersArr[indexPath.row]
        playerNameLabel.text = currentPlayer.name
        levelStatistic.atributeValueLabel.text = String(currentPlayer.level)
        itemsBoostStatistics.atributeValueLabel.text = String(currentPlayer.itemsBoost)
        currentStrengthLabel.text = String(Int(levelStatistic.atributeValueLabel.text!)! + Int(itemsBoostStatistics.atributeValueLabel.text!)!)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return playersArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerInfoView
        cell.playerNameLabel.text = playersArr[indexPath.row].name
        cell.playerPictureView.image = playersArr[indexPath.row].playerPicture
        let backgroundView = UIView()
        backgroundView.backgroundColor = .lightGray
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    @objc func startFighting() {
        let fightView = FightViewController()
        fightView.updateFunc = updateCharacteristics
        fightView.playersArr = playersArr
        fightView.currentPlayer = currentPlayer
        currentPlayer.modificationPoins = 0
        present(fightView, animated: true)
    }

}