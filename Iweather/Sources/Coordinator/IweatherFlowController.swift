//
//  IweatherFlowController.swift
//  Iweather
//
//  Created by pablo henrique on 07/12/25.
//

import Foundation
import UIKit

class IweatherFlowController {
    
    private var navigationController: UINavigationController?
    
    public init() {
        
    }
    
    func start() -> UINavigationController? {
        let startViewController = SplashViewController(contentView: SplashView(), flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }
}

extension IweatherFlowController: SplashFlowDelegate {
    func navigateToHome() {
        let homeView = HomeViewController(contentView: HomeView(), flowDelegate: self)
        self.navigationController?.pushViewController(homeView, animated: true)
    }
    
}

extension IweatherFlowController: HomeFlowDelegate {
    func navigateToWeatherDetails(nameCitty: String, lat: Double, lon: Double) {
        let details = WeatherDetailsViewController(contentView: WeatherDetailsView(), cityName: nameCitty, lat: lat, lon: lon)
        self.navigationController?.pushViewController(details, animated: true)
    }
}
