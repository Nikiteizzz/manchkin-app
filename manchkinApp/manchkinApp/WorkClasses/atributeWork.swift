//
//  atributeWork.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 29.08.22.
//

import UIKit

class atributeWork: UIView {
    
    var minusFunc: (() -> Void)?
    var plusFunc: (() -> Void)?
    
    init(frame: CGRect, minusFunc: @escaping () -> Void, plusFunc: @escaping () -> Void, atributeName: String) {
        self.minusFunc = minusFunc
        self.plusFunc = plusFunc
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addViewAnchors()
        atributeNameLabel.text = atributeName
        atributeValueLabel.text = "0"
    }
    
    required init?(coder: NSCoder) {
        minusFunc = nil
        plusFunc = nil
        super.init(coder: coder)
    }
    
    public let plusAtributeButton: UIButton = {
        let plusButton = UIButton()
        plusButton.setBackgroundImage(UIImage(named: "plusIcon"), for: .normal)
        plusButton.addTarget(nil, action: #selector(workPlusFunc), for: .touchUpInside)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        return plusButton
    }()
    
    public let minusAtributeButton: UIButton = {
        let minusButton = UIButton()
        minusButton.setBackgroundImage(UIImage(named: "minusIcon"), for: .normal)
        minusButton.addTarget(nil, action: #selector(workMinusFunc), for: .touchUpInside)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        return minusButton
    }()
    
    public let atributeNameLabel: UILabel = {
        let atributeNameLabel = UILabel()
        atributeNameLabel.textAlignment = .center
        atributeNameLabel.font = UIFont.systemFont(ofSize: 20)
        atributeNameLabel.adjustsFontSizeToFitWidth = true
        atributeNameLabel.textColor = .black
        atributeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return atributeNameLabel
    }()
    
    public let atributeValueLabel: UILabel = {
        let atributeValueLabel = UILabel()
        atributeValueLabel.font = UIFont.systemFont(ofSize: 25)
        atributeValueLabel.textAlignment = .center
        atributeValueLabel.adjustsFontSizeToFitWidth = true
        atributeValueLabel.textColor = .black
        atributeValueLabel.translatesAutoresizingMaskIntoConstraints = false
        return atributeValueLabel
    }()
    
    private func addViewAnchors() {
        self.addSubview(atributeNameLabel)
        atributeNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        atributeNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        atributeNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
        atributeNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.addSubview(atributeValueLabel)
        atributeValueLabel.topAnchor.constraint(equalTo: atributeNameLabel.bottomAnchor).isActive = true
        atributeValueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        atributeValueLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        atributeValueLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.addSubview(minusAtributeButton)
        minusAtributeButton.topAnchor.constraint(equalTo: atributeValueLabel.bottomAnchor).isActive = true
        minusAtributeButton.rightAnchor.constraint(equalTo: self.centerXAnchor, constant: -5).isActive = true
        minusAtributeButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        minusAtributeButton.widthAnchor.constraint(equalTo: minusAtributeButton.heightAnchor).isActive = true
        self.addSubview(plusAtributeButton)
        plusAtributeButton.topAnchor.constraint(equalTo: atributeValueLabel.bottomAnchor).isActive = true
        plusAtributeButton.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: 5).isActive = true
        plusAtributeButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        plusAtributeButton.widthAnchor.constraint(equalTo: plusAtributeButton.heightAnchor).isActive = true
    }
    
    @objc func workPlusFunc() {
        atributeValueLabel.text = String(Int(atributeValueLabel.text!)! + 1)
        plusFunc!()
    }
    
    @objc func workMinusFunc() {
        atributeValueLabel.text = String(Int(atributeValueLabel.text!)! - 1)
        minusFunc!()
    }
}
