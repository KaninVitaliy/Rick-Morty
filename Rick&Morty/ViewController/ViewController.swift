//
//  ViewController.swift
//  Rick&Morty_Second
//
//  Created by Виталий Канин on 28.09.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "Scene")
        
        // Добавляем звезды, портал и имя
        createImage(name: "Stars")
        createImage(name: "Portal")
        createImage(name: "Rick&Morty")
    }
    
    private func createImage(name: String) {
        let value = UIImageView()
        value.image = UIImage(named: "\(name)")
        value.translatesAutoresizingMaskIntoConstraints = false
        value.contentMode = .scaleToFill
        
        var topAncor: Double = 0
        var bottomAncor: Double = 0
        var leadingAncor: Double = 0
        var trailingAncor: Double = 0
        
        view.addSubview(value)
        
        switch name {
        case "Stars":
            topAncor = 98
            bottomAncor = -30
            leadingAncor = 16
            trailingAncor = -25
            
        case "Portal":
            topAncor = 196
            bottomAncor = -310
            leadingAncor = 118
            trailingAncor = -117
            
            value.isUserInteractionEnabled = true
            // Нам нужно чтобы при нажатии на эту картинку мы переходили на другой экран (SecondViewController)
            // Добавляем эту возможность
            // Создаем константу и определяем метод для жеста
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            value.addGestureRecognizer(tap)
            
        case "Rick&Morty":
            topAncor = 120
            bottomAncor = -584
            leadingAncor = 118
            trailingAncor = -117
            
        default: break
        }
        
        NSLayoutConstraint.activate([
            value.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topAncor),
            value.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottomAncor),
            value.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingAncor),
            value.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingAncor)
        ])
        
    }
    
    @objc
    private func handleTap() {
        let secondViewController = SecondViewController()
        secondViewController.title = "Characters"
        let secondNavCon = UINavigationController(rootViewController: secondViewController)
        secondNavCon.navigationBar.prefersLargeTitles = true
        secondNavCon.modalPresentationStyle = .fullScreen
        present(secondNavCon, animated: true)
    }
    
}

