//
//  HeaderLabel.swift
//  Rick&Morty
//
//  Created by Виталий Канин on 11.10.2024.
//

import UIKit

class HeaderLabel: UILabel {

    var labelText: String
    var color: UIColor
    var fontSize: CGFloat
    var textSide: NSTextAlignment
    var content: UIView.ContentMode = .scaleToFill
    
    
    init(labelText: String, color: UIColor, fontSize: CGFloat, textSide: NSTextAlignment) {
        self.labelText = labelText
        self.color = color
        self.fontSize = fontSize
        self.textSide = textSide
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.content = .scaleAspectFill
        setupLabel()
    }
    
    private func setupLabel() {
//        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold, name:)
        self.font = UIFont(name: "ofont.ru_Gilroy", size: fontSize)
        self.textColor = color
        self.text = labelText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
