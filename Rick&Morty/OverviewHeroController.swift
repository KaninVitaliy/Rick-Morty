//
//  OverviewHero.swift
//  Rick&Morty
//
//  Created by Виталий Канин on 27.09.2024.
//

import UIKit

class OverviewHero: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Scene")
    }
    
    // Реализуем фунцию нажатия на ячейку
    @objc
    private func cellTap() {
        let OHC = SecondViewController()
        
        // Указываем как именно он будут появляться , здесь на полный экран
        SVC.modalPresentationStyle = .fullScreen
        // Указываем анимацию для него
        present(SVC, animated: true)
        
    }
}
