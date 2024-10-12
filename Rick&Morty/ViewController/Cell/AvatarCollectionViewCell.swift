//
//  AvatarCollectionViewCell.swift
//  Rick&Morty
//
//  Created by Виталий Канин on 08.10.2024.
//

import UIKit

class AvatarCollectionViewCell: UICollectionViewCell {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameView: UILabel = HeaderLabel.init(labelText: "", color: .white, fontSize: 22, textSide: .center)
    
    private let statusHeroView: UILabel = HeaderLabel.init(labelText: "", color: UIColor(named: "TextStatus") ?? .green, fontSize: 16, textSide: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(avatarImageView)
        addSubview(nameView)
        addSubview(statusHeroView)
    }
    
    func configureCell(imageName: String?, nameHero: String, statusHero: String) {
        nameView.text = nameHero
        statusHeroView.text = statusHero
        if let imageName, let url = URL(string: imageName) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                print("URLSESSION.shared")
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self?.avatarImageView.image = UIImage(data: imageData)
                }
            }.resume()
        }
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -105),
            avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            nameView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 24),
            nameView.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            
            statusHeroView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 8),
            statusHeroView.centerXAnchor.constraint(equalTo: nameView.centerXAnchor),
            
        ])
        
    }
}
