//
//  OriginCollectionViewCell.swift
//  Rick&Morty
//
//  Created by Виталий Канин on 10.10.2024.
//

import UIKit

class OriginCollectionViewCell: UICollectionViewCell {
  
    private let originLabelEpisodes: UILabel = HeaderLabel.init(labelText: "Episodes", color: .white, fontSize: 22, textSide: .left)
    
    private let originLabel: UILabel = HeaderLabel.init(labelText: "Origin", color: .white, fontSize: 22, textSide: .left)
    
    private let eathLabel: UILabel = HeaderLabel.init(labelText: "", color: .white, fontSize: 22, textSide: .left)
    
    private let typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.text = "Planet"
        typeLabel.font = .boldSystemFont(ofSize: 13)
        typeLabel.textColor = UIColor(named: "TextStatus") ?? .green
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.contentMode = .scaleAspectFill
        return typeLabel
    }()
    
    let containerPlanet: UIView = {
            let container = UIView()
            container.backgroundColor = .colorOriginPlanet
            container.layer.cornerRadius = 16
            container.clipsToBounds = true
            container.translatesAutoresizingMaskIntoConstraints = false
            container.contentMode = .scaleAspectFill
            return container
        }()
    
    private let imagePlanet: UIImageView = {
        let imagePlanet = UIImageView(image: .planet)
        imagePlanet.contentMode = .scaleAspectFill
        imagePlanet.translatesAutoresizingMaskIntoConstraints = false
        return imagePlanet
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        for i in [containerPlanet ,imagePlanet, eathLabel, originLabel, typeLabel, originLabelEpisodes] {
            addSubview(i)
        }
    }
    
    func configureCell(typePlanet: String) {
        eathLabel.text = typePlanet
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            originLabelEpisodes.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 110),
            originLabelEpisodes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
        
            originLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -32),
            originLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            
            containerPlanet.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            containerPlanet.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerPlanet.heightAnchor.constraint(equalToConstant: 64),
            containerPlanet.widthAnchor.constraint(equalToConstant: 64),
            
            eathLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            eathLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 88),
            
            
            typeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 46),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 88),
            
//            imagePlanet.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
//            imagePlanet.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant: 25),
            imagePlanet.centerYAnchor.constraint(equalTo: containerPlanet.centerYAnchor),
            imagePlanet.centerXAnchor.constraint(equalTo: containerPlanet.centerXAnchor),
            imagePlanet.heightAnchor.constraint(equalToConstant: 24),
            imagePlanet.widthAnchor.constraint(equalToConstant: 24),
            
            
        ])
    }
}
