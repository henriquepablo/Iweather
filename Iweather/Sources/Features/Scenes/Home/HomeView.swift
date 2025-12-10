//
//  HomeView.swift
//  Iweather
//
//  Created by pablo henrique on 07/12/25.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Background"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Logo"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        let fullText = "Boas vindas ao IWeather"
        let attributed = NSMutableAttributedString(string: fullText)
        label.textColor = Colors.white
        label.textAlignment = .center
        
        attributed.addAttribute(.font, value: Typography.headingMD, range: NSRange(location: 0, length: attributed.length))

        
        if let range = fullText.range(of: "IWeather") {
            let nsRange = NSRange(range, in: fullText)
            attributed.addAttribute(.foregroundColor, value: Colors.blueLight, range: nsRange)
        }

        label.attributedText = attributed

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Escolha um local para ver a previsão do tempo."
        label.textColor = Colors.gray200
        label.font = Typography.textSM
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let input: UITextField = {
        let input = UITextField()
        let redPlaceholderText = NSAttributedString(string: "Buscar local",
                                                    attributes: [NSAttributedString.Key.foregroundColor: Colors.gray400])
        input.font = Typography.textMD
        input.attributedPlaceholder = redPlaceholderText
        input.layer.cornerRadius = 8
        input.backgroundColor = Colors.gray600
        input.textColor = Colors.white
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 56))
        input.leftView = paddingView
        input.leftViewMode = .always
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = Colors.gray900
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(backgroundImage)
        addSubview(logoImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(input)
        addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 48),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 162),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
            input.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            input.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            input.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            input.heightAnchor.constraint(equalToConstant: 56),
            
            tableView.topAnchor.constraint(equalTo: input.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
