//
//  HomeViewController.swift
//  Iweather
//
//  Created by pablo henrique on 07/12/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let contentView: HomeView
    let flowDelegate: HomeFlowDelegate
    private var viewModel = HomeViewModel()
    private var cityListDataSource: [Citys] = []
    
    init(contentView: HomeView, flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setup() {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        setupConstraints()
        setupTableView()
        contentView.input.addTarget(self, action: #selector(handleTextFieldInput), for: .editingChanged)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        contentView.tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        
    }
    
    @objc
    func handleTextFieldInput() {
        
        guard let text = contentView.input.text else {return}
        
        viewModel.searchCity(title: text) { [weak self] result in
            DispatchQueue.main.async {
                self?.cityListDataSource = result
                self?.contentView.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let city = cityListDataSource[indexPath.row]
        flowDelegate.navigateToWeatherDetails(nameCitty: "\(city.name) - \(city.sys.country)", lat: city.coord.lat, lon: city.coord.lon)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityListDataSource.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as! ListCell
        let city = cityListDataSource[indexPath.row]
        cell.configure(title: "\(city.name) - \(city.sys.country)")
        return cell
    }
    
    
}
