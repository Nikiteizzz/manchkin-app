//
//  PlayerinfoView.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 29.08.22.
//
import UIKit


class PlayerInfoView : UITableViewCell {
    public let playerPictureView: UIImageView = {
        let playerPictureView = UIImageView()
        playerPictureView.translatesAutoresizingMaskIntoConstraints = false
        return playerPictureView
    }()
    
    public let playerNameLabel: UILabel = {
        let playerNameLabel = UILabel()
        playerNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        playerNameLabel.adjustsFontSizeToFitWidth = true
        playerNameLabel.textAlignment = .left
        playerNameLabel.textColor = .black
        playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return playerNameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.addSubview(playerPictureView)
        playerPictureView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        playerPictureView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        playerPictureView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        playerPictureView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.addSubview(playerNameLabel)
        playerNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        playerNameLabel.leftAnchor.constraint(equalTo: playerPictureView.rightAnchor, constant: 10).isActive = true
        playerNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        playerNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
