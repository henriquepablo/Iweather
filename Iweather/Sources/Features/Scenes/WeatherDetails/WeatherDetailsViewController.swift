//
//  WeatherDetailsViewController.swift
//  Iweather
//
//  Created by pablo henrique on 10/12/25.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    let contentView: WeatherDetailsView
    let viewModel: WeatherViewModel = WeatherViewModel()
    private let lat: Double
    private let lon: Double
    private let cityName: String
    
    init(contentView: WeatherDetailsView, cityName: String, lat: Double, lon: Double) {
        self.contentView = contentView
        self.lat = lat
        self.lon = lon
        self.cityName = cityName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadWeather()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = Colors.gray900
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func loadWeather() {
        viewModel.getWeatherOfCity(lat: lat, lon: lon) { [weak self] result in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.contentView.tempCurrent.text = "\(NSString(format: "%.0f", result[0].main.temp))°c"
                self.contentView.tempMinLabel.text = "\(NSString(format: "%.0f", result[0].main.temp_min))°c - "
                self.contentView.tempMaxLabel.text = "\(NSString(format: "%.0f", result[0].main.temp_max))°c"
                self.contentView.currentSituation.text = "\(result[0].weather[0].description)"
                
                self.contentView.staticTermic.valueLabel.text = "\(NSString(format: "%.0f", result[0].main.feels_like))°c"
                self.contentView.titleLabel.text = self.cityName
            }
        }
    }
}
