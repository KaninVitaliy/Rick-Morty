//
//  HeroCell.swift
//  Rick&Morty
//
//  Created by Виталий Канин on 26.09.2024.
//

import UIKit

class HeroCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods

    func update(stringUrl: String?, title: String?) {
        
        /// Setup image
        if let stringUrl, let url = URL(string: stringUrl) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: imageData)
                }
            }
            .resume()
        }
        
        ///Setup title
        titleLabel.text = title
    }
}

// MARK: - Common init

private extension HeroCollectionViewCell {
    
    func commonInit() {
        setupLayout()
        setupConstraints()
    }
    
    func setupLayout() {
        self.clipsToBounds = true
        self.backgroundColor =  UIColor(named: "FrameColor")
        self.layer.cornerRadius = 16
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 36),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
    }
}
