//
//  HeroCollectionViewCell.swift
//  Rick&Morty_Second
//
//  Created by Виталий Канин on 28.09.2024.
//

import UIKit

class HeroCollectionViewCell: UICollectionViewCell {
    
    // Объявление и настройка для изображения
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // Объявление переменной для текста в ячейке
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // Как будет располагаться текст
        label.textAlignment = .center
        // Цвет текста
        // label.backgroundColor = .blue
        label.textColor = .white
        // Размер текста
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func update(stringUrl: String?, title: String?) {
        // Setup Image
        if let stringUrl, let url = URL(string: stringUrl) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: imageData)
                }
            }.resume()
        }
        
        titleLabel.text = title
    }
}

private extension HeroCollectionViewCell {
    
    func commonInit() {
        setupLayout()
        setupConstraints()
    }
    
    func setupLayout() {
        // Определяем ограничены ли представления границам представлений
        self.clipsToBounds = true
        self.backgroundColor = UIColor(named: "FrameColor")
        self.layer.cornerRadius = 16
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -54),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 56),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
    }
}
