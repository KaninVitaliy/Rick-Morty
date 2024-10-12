//
//  InfoCollectionViewCell.swift
//  Rick&Morty
//
//  Created by Виталий Канин on 08.10.2024.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
    
    private let infoLabel: UILabel = HeaderLabel(labelText: "Info", color: .white, fontSize: 17, textSide: .left)
    
    private let speciesLabel: UILabel = HeaderLabel(labelText: "Species:", color: UIColor(named: "InfoText") ?? .white, fontSize: 16, textSide: .left)
    
    private let typeLabel: UILabel = HeaderLabel(labelText: "Type:", color: UIColor(named: "InfoText") ?? .white, fontSize: 16, textSide: .left)
    
    private let genderLabel: UILabel = HeaderLabel(labelText: "Gender:", color: UIColor(named: "InfoText") ?? .white, fontSize: 16, textSide: .left)
    
    private let speciesLabelText: UILabel = HeaderLabel(labelText: "", color: .white, fontSize: 16, textSide: .right)
    
    private let typeLabelText: UILabel = HeaderLabel(labelText: "", color: .white, fontSize: 16, textSide: .right)
      
    private let genderLabelText: UILabel = HeaderLabel(labelText: "", color: .white, fontSize: 16, textSide: .right)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraint()
    }
    
    func setupViews() {
        for i in [speciesLabel, typeLabel, genderLabel, speciesLabelText, typeLabelText, genderLabelText, infoLabel] {
            addSubview(i)
        }
    }
    
    func configureCell(species: String, type: String, gender: String){
        speciesLabelText.text = species
        genderLabelText.text = gender
        if type == "" {
            typeLabelText.text = "None"
        } else {
            typeLabelText.text = type
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraint() {
        
        NSLayoutConstraint.activate([
            
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -32),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            
            speciesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            speciesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            speciesLabelText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            speciesLabelText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            typeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                    
            typeLabelText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            typeLabelText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            genderLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 85),
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            genderLabelText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 85),
            genderLabelText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
        ])
        
    }

    
    
}
