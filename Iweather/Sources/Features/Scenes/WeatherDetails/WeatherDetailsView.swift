//
//  WeatherDetailsView.swift
//  Iweather
//
//  Created by pablo henrique on 10/12/25.
//

import Foundation
import UIKit

class WeatherDetailsView: UIView {
    
    let containerBackgroundImage: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray800
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let containerBackgroundStatics: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray800
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()
    
    let backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "BackgroundToday"))
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.headingMD
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let todayLabel: UILabel = {
        let label = UILabel()
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "EEEE, dd 'de' MMMM 'de' yyyy"
        let formattedDate = formatter.string(from: date)
        label.text = formattedDate
        label.textColor = Colors.gray100
        label.font = Typography.textSM
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currentSituation: UILabel = {
        let label = UILabel()
        label.font = Typography.textSM
        label.textColor = Colors.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempMinLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.white
        label.font = Typography.headingSM
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempMaxLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.white
        label.font = Typography.headingSM
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempCurrent: UILabel = {
        let label = UILabel()
        label.textColor = Colors.white
        label.font = Typography.headingXL
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Icons"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let staticTermic: StaticsView = {
        let staticTermic = StaticsView()
        staticTermic.titleLabel.text = "Sensação térmica"
        staticTermic.iconImage.image = UIImage(named: "thermometer")
        staticTermic.translatesAutoresizingMaskIntoConstraints = false
        return staticTermic
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(containerBackgroundImage)
        containerBackgroundImage.addSubview(backgroundImage)
        containerBackgroundImage.addSubview(titleLabel)
        containerBackgroundImage.addSubview(todayLabel)
        containerBackgroundImage.addSubview(currentSituation)
        containerBackgroundImage.addSubview(tempMinLabel)
        containerBackgroundImage.addSubview(tempMaxLabel)
        containerBackgroundImage.addSubview(tempCurrent)
        containerBackgroundImage.addSubview(tempIcon)
        addSubview(containerBackgroundStatics)
        containerBackgroundStatics.addSubview(staticTermic)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerBackgroundImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            containerBackgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerBackgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            containerBackgroundImage.heightAnchor.constraint(equalToConstant: 328),
            
            backgroundImage.topAnchor.constraint(equalTo: containerBackgroundImage.topAnchor, constant: 12),
            backgroundImage.leadingAnchor.constraint(equalTo: containerBackgroundImage.leadingAnchor, constant: 12),
            backgroundImage.trailingAnchor.constraint(equalTo: containerBackgroundImage.trailingAnchor, constant: -12),
            backgroundImage.heightAnchor.constraint(equalToConstant: 304),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -30),
            
            todayLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            todayLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            todayLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            tempCurrent.bottomAnchor.constraint(equalTo: tempMinLabel.topAnchor, constant: 8),
            tempCurrent.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 30),
            
            tempMinLabel.bottomAnchor.constraint(equalTo: currentSituation.topAnchor, constant: 2),
            tempMinLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 30),
            
            tempMaxLabel.centerYAnchor.constraint(equalTo: tempMinLabel.centerYAnchor),
            tempMaxLabel.leadingAnchor.constraint(equalTo: tempMinLabel.trailingAnchor, constant: 2),
            
            currentSituation.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -20),
            currentSituation.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 30),
        
            tempIcon.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor),
            tempIcon.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 0),
            tempIcon.widthAnchor.constraint(equalToConstant: 160),
            tempIcon.heightAnchor.constraint(equalToConstant: 160),
            
            containerBackgroundStatics.topAnchor.constraint(equalTo: containerBackgroundImage.bottomAnchor, constant: 8),
            containerBackgroundStatics.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerBackgroundStatics.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            containerBackgroundStatics.heightAnchor.constraint(equalToConstant: 292),
            
            staticTermic.topAnchor.constraint(equalTo: containerBackgroundStatics.topAnchor, constant: 4),
            staticTermic.leadingAnchor.constraint(equalTo: containerBackgroundStatics.leadingAnchor, constant: 16),
            staticTermic.trailingAnchor.constraint(equalTo: containerBackgroundStatics.trailingAnchor, constant: -16)

        ])
    }
}
