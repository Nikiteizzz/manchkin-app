//
//  StartViewController.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 29.08.22.
//

import UIKit

class StartViewController: UIViewController {

    weak var coordinator: AppCoordinator?
    
    private let gameNameLabel: UILabel = {
        let gameNameLabel = UILabel()
        gameNameLabel.textAlignment = .center
        gameNameLabel.text = "Manchkin помощник"
        gameNameLabel.adjustsFontSizeToFitWidth = true
        gameNameLabel.font = UIFont.boldSystemFont(ofSize: 40)
        gameNameLabel.textColor = .white
        gameNameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameNameLabel.numberOfLines = 2
        return gameNameLabel
    }()
    
    private let backgorundImage: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "backgroundImageForStartWindow")
        return backgroundImageView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator?.navigationController.setNavigationBarHidden(true, animated: true)
        self.view.addSubview(backgorundImage)
        backgorundImage.frame = self.view.bounds
        self.view.addSubview(gameNameLabel)
        gameNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        gameNameLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        gameNameLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        gameNameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        self.perform(#selector(startGame), with: nil, afterDelay: 3)
    }
    
    @objc func startGame() {
        coordinator?.showMainGameView()
    }

}
