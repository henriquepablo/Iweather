//
//  StaticsView.swift
//  Iweather
//
//  Created by pablo henrique on 10/12/25.
//

import Foundation
import UIKit

class StaticsView: UIView {
    
    let iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.gray200
        label.font = Typography.headingXS
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.gray100
        label.font = Typography.headingSM
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.layer.borderColor = Colors.gray700.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(iconImage)
        addSubview(titleLabel)
        addSubview(valueLabel)
        addSubview(lineView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            valueLabel.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
            
            lineView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 16),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    private func configure(icon: UIImage, title: String, value: String) {
        iconImage.image = icon
        titleLabel.text = title
        valueLabel.text = value
    }
}
