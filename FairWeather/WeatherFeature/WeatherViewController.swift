//
//  WeatherViewController.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 30/09/22.
//

import UIKit

class WeatherViewController: ViewCodeController {
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .titleFont
        return label
    }()
    
    private lazy var iconTemperatureContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private lazy var currentWeatherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .detailFont
        return label
    }()
    
    private lazy var minimumTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .descriptionFont
        return label
    }()
    
    private lazy var maximumTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .descriptionFont
        return label
    }()
    
    private lazy var minimumMaximumTemperatureContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private let interactor: WeatherInteractorProtocol
    
    init(interactor: WeatherInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadWeather()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func setupView() {
        view.insetsLayoutMarginsFromSafeArea = true
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(
            title: "Forecast",
            style: .plain,
            target: self,
            action: #selector(showForecastList)
        )
    }
    
    @objc func showForecastList() {
        interactor.showForecastList()
    }

    override func setupSubviews() {
        iconTemperatureContainerView.addSubviews([
            weatherIcon,
            currentTemperatureLabel,
        ])

        minimumMaximumTemperatureContainerView.addSubviews([
            minimumTemperatureLabel,
            maximumTemperatureLabel
        ])

        view.addSubviews([
            loadingIndicator,
            iconTemperatureContainerView,
            currentWeatherLabel,
            minimumMaximumTemperatureContainerView,
        ])
    }
    
    override func setupConstraints() {
        view.addConstraints([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            iconTemperatureContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconTemperatureContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Spacing.big),
            
            weatherIcon.heightAnchor.constraint(equalToConstant: 40),
            weatherIcon.widthAnchor.constraint(equalToConstant: 40),
            weatherIcon.bottomAnchor.constraint(equalTo: iconTemperatureContainerView.bottomAnchor),
            weatherIcon.leftAnchor.constraint(equalTo: iconTemperatureContainerView.leftAnchor),
            weatherIcon.topAnchor.constraint(equalTo: iconTemperatureContainerView.topAnchor),
            
            currentTemperatureLabel.topAnchor.constraint(equalTo: iconTemperatureContainerView.topAnchor),
            currentTemperatureLabel.rightAnchor.constraint(equalTo: iconTemperatureContainerView.rightAnchor),
            currentTemperatureLabel.bottomAnchor.constraint(equalTo: iconTemperatureContainerView.bottomAnchor),
            currentTemperatureLabel.leftAnchor.constraint(equalTo: weatherIcon.rightAnchor, constant: Spacing.small),
            
            currentWeatherLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentWeatherLabel.topAnchor.constraint(equalTo: iconTemperatureContainerView.bottomAnchor, constant: Spacing.small),

            minimumMaximumTemperatureContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minimumMaximumTemperatureContainerView.topAnchor.constraint(equalTo: currentWeatherLabel.bottomAnchor, constant: Spacing.small),

            minimumTemperatureLabel.bottomAnchor.constraint(equalTo: minimumMaximumTemperatureContainerView.bottomAnchor),
            minimumTemperatureLabel.leftAnchor.constraint(equalTo: minimumMaximumTemperatureContainerView.leftAnchor),
            minimumTemperatureLabel.topAnchor.constraint(equalTo: minimumMaximumTemperatureContainerView.topAnchor),

            maximumTemperatureLabel.topAnchor.constraint(equalTo: minimumMaximumTemperatureContainerView.topAnchor),
            maximumTemperatureLabel.rightAnchor.constraint(equalTo: minimumMaximumTemperatureContainerView.rightAnchor),
            maximumTemperatureLabel.bottomAnchor.constraint(equalTo: minimumMaximumTemperatureContainerView.bottomAnchor),
            maximumTemperatureLabel.leftAnchor.constraint(equalTo: minimumTemperatureLabel.rightAnchor, constant: Spacing.small),
        ])
    }
}

extension WeatherViewController: WeatherViewControllerProtocol {
    func changeState(_ state: WeatherState) {
        switch state {
        case .loading:
            handleLoading()
        case let .success(weatherViewModel):
            handleSuccess(weatherViewModel)
        case let .error(weatherError):
            handleError(weatherError)
        }
    }
    
    private func handleLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.loadingIndicator.startAnimating()
        }
    }
    
    private func handleSuccess(_ weatherViewModel: WeatherViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.loadingIndicator.stopAnimating()
            self?.title = weatherViewModel.title
            self?.currentWeatherLabel.text = weatherViewModel.currentWeather
            self?.currentTemperatureLabel.text = weatherViewModel.currentTemperature
            self?.currentTemperatureLabel.sizeToFit()
            self?.minimumTemperatureLabel.text = weatherViewModel.minimumTemperature
            self?.maximumTemperatureLabel.text = weatherViewModel.maximumTemperature
            if let iconURL = weatherViewModel.iconURL {
                self?.weatherIcon.loadImage(from: iconURL)
            }
        }
    }
    
    private func handleError(_ weatherError: WeatherError) {
        DispatchQueue.main.async { [weak self] in
            self?.loadingIndicator.stopAnimating()
        }
    }
}
