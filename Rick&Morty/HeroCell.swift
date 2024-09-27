//
//  HeroCell.swift
//  Rick&Morty
//
//  Created by Виталий Канин on 26.09.2024.
//

import UIKit

class HeroCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    // Настройка ячейки
    func setup() {
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Расположение изображения в ячейке
        imageView.contentMode = .scaleAspectFill
        
        // Обрезка границ
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -54),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
    }
    
    // В случае сториборда
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
