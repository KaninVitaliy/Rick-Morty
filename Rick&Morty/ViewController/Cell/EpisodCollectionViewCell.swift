//
//  EpisodCollectionViewCell.swift
//  Rick&Morty
//
//  Created by Виталий Канин on 10.10.2024.
//

import UIKit

class EpisodCollectionViewCell: UICollectionViewCell {
    
    lazy var episodeName: UILabel = {
        var episodeName = UILabel()
        episodeName.textColor = .white
        episodeName.textAlignment = .left
        episodeName.translatesAutoresizingMaskIntoConstraints = false
        return episodeName
   }()
    
    lazy var episodeItem: UILabel = {
       var season = UILabel()
        season.textColor = UIColor(named: "TextStatus") ?? .green
        season.textAlignment = .left
        season.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .callout), size: 13)
        season.translatesAutoresizingMaskIntoConstraints = false
        return season
    }()
    
    lazy var dateEpisode : UILabel = {
       var dateEpisode = UILabel()
       dateEpisode.textColor = UIColor(named: "DateEpisode")
       dateEpisode.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .callout), size: 13)
       dateEpisode.translatesAutoresizingMaskIntoConstraints = false
       return dateEpisode
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraint()
    }
    
    private func setupViews() {
        addSubview(episodeName)
        addSubview(episodeItem)
        addSubview(dateEpisode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            episodeName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            episodeName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            episodeItem.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            episodeItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            dateEpisode.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            dateEpisode.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 330)
        ])
    }
}
