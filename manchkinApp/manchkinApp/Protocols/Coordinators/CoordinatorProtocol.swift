//
//  CoordinatorProtocol.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 16.08.22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
