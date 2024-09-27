//
//  ViewController.swift
//  Rick&Morty
//
//  Created by Виталий Канин on 25.09.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Поставим цвет сцены
        view.backgroundColor = UIColor(named: "Scene")
        // Добавим функцию для отображения звезд
        createStars()
        // Добавим функцию для отображения портала
        createPortal()
        // Добавим функцию для отображения надписи Rick&Morty
        createName()
    }
    
    // Функция для звезд
    private func createStars() {
        // Создаем константу класса UIImageView() (Нашего изображения звезд)
        let stars = UIImageView()
        // Объявляем ей саму картинку из Asserts
        stars.image = UIImage(named: "Stars")
        // Ставим translatesAutoresizingMaskIntoConstraints false, для того чтобы указать рамку
        stars.translatesAutoresizingMaskIntoConstraints = false
        // ставим параметр чтобы оно отображало верно границы
        stars.contentMode = .scaleToFill
        // Добавляем звезды
        view.addSubview(stars)
        
        // Указываем разметку по 4-м границам
        
        NSLayoutConstraint.activate([
            // От верхней границы safeAreaLayoutGuide
            stars.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 54),
            // От нижней границы safeAreaLayoutGuide
            stars.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            // От левой границы
            stars.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            // От правой границы
            stars.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
    }
    
    // Функция для отображения портала
    private func createPortal() {
        // Создаем константу объекта для портала
        let portal = UIImageView()
        portal.image = UIImage(named: "Portal")
        portal.translatesAutoresizingMaskIntoConstraints = false
        portal.contentMode = .scaleToFill
        view.addSubview(portal)
        
        // Представление от 4-х сторон (Якорей)
        NSLayoutConstraint.activate([
            // От верхней границы safeAreaLayoutGuide
            portal.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 196),
            // От нижней границы safeAreaLayoutGuide
            portal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -310),
            // От левой границы
            portal.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 118),
            // От правой границы
            portal.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -117)
        ])
         
        // Указываем
        portal.isUserInteractionEnabled = true
        // Нам нужно чтобы при нажатии на эту картинку мы переходили на другой экран (SecondViewController)
        // Добавляем эту возможность
        // Создаем константу и определяем метод для жеста
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        portal.addGestureRecognizer(tap)
    }
    
    // Реализуем фунцию нажатия на портал
    @objc
    private func handleTap() {
        let SVC = SecondViewController()
        
        // Указываем как именно он будут появляться , здесь на полный экран
        SVC.modalPresentationStyle = .fullScreen
        // Указываем анимацию для него 
        present(SVC, animated: true)
        
    }
    
    // Функция для отображения надписи
    private func createName() {
        // Создаем константу для надписи Rich&Norty
        let names = UIImageView()
        names.image = UIImage(named: "Rick&Morty")
        names.translatesAutoresizingMaskIntoConstraints = false
        names.contentMode = .scaleToFill
        
        view.addSubview(names)
        
        // Представление от 4-х сторон (Якорея)
        NSLayoutConstraint.activate([
            // От верхней границы safeAreaLayoutGuide
            names.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            // От нижней границы safeAreaLayoutGuide
            names.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -584),
            // От левой границы
            names.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 118),
            // От правой границы
            names.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -117)
        ])
    }

}

