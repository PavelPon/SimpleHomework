//
//  MyButtonView.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 05.09.2023.
//

import Foundation
import UIKit
class MyButtonView:UIView{
    
     var hStack:UIStackView = {
         var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 2
        view.alignment = .center
        return view
    }()
    
     var imageView:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "trash")
         view.contentMode = .scaleAspectFit
        return view
    }()
    
     var label:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 15)
        view.text = "Очистить"
        view.textColor = .blue
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
        backgroundColor = .white
        
        addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
        
        hStack.addArrangedSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 35),
        ])
        
        hStack.addArrangedSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
