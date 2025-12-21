//
//  HomeViewModel.swift
//  Iweather
//
//  Created by pablo henrique on 13/12/25.
//

import Foundation

class HomeViewModel {
    
    private let url = "https://api.openweathermap.org/data/2.5/weather?appid=b34ddb2bac572c7d57c315df91073134&lang=pt_br&units=metric"
    
    func searchCity(
        title: String,
        completion: @escaping ([Citys]) -> Void
    ) {
        
        guard let url = URL(string: "\(url)&q=\(title)") else { return }
        
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
                let citys = try JSONDecoder().decode(Citys.self, from: data)
                DispatchQueue.main.async {
                    completion([citys])
                }
            } catch {
                print("Deu erro ao pegar categorias de data")
                completion([])
            }
        }.resume()
        
    }
    
}
