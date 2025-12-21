//
//  WeatherViewModel.swift
//  Iweather
//
//  Created by pablo henrique on 14/12/25.
//

import Foundation

class WeatherViewModel {
    
    private let url = "https://pro.openweathermap.org/data/2.5/forecast?appid=b34ddb2bac572c7d57c315df91073134&lang=pt_br&units=metric"
    
    func getWeatherOfCity(lat: Double, lon: Double, completion: @escaping ([ForecastItem]) -> Void ) {
        
        guard let url = URL(string: "\(url)&lat=\(lat)&lon=\(lon)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Deu erro")
                return
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let citys = try JSONDecoder().decode(WeatherCity.self, from: data)
                DispatchQueue.main.async {
                    completion(citys.list)
                }
            } catch {
                print("Deu erro ao pegar categorias de data")
                completion([])
            }
        }.resume()
    }
    
}
