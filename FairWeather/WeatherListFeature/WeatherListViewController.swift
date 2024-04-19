//
//  WeatherListViewController.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 12/10/22.
//

import Foundation
import UIKit

class WeatherListViewController: ViewCodeController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    let presenter: WeatherListPresenterInputProtocol
    
    var viewModel: WeatherListViewModel?
    
    init(presenter: WeatherListPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
    }
    
    override func setupView() {
        view.insetsLayoutMarginsFromSafeArea = true
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func setupSubviews() {
        view.addSubview(tableView)
    }
    
    override func setupConstraints() {
        view.addConstraints([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension WeatherListViewController: WeatherListViewControllerProtocol {
    func updateView(_ viewModel: WeatherListViewModel) {
        self.viewModel = viewModel
        title = viewModel.title
        tableView.reloadData()
    }
}

extension WeatherListViewController: UITableViewDelegate {
    
}

extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.forecastList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = viewModel?.forecastList[indexPath.row].title
        
        return cell
        
//        tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
    }
    
    
}
