//
//  WeatherForecastView.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import SwiftUI

struct WeatherForecastView: View {
    @StateObject var viewModel: WeatherForecastViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            if !viewModel.isLoading {
                List {
                    ForEach(viewModel.forecast?.weatherForecast ?? [], id: \.date) { weatherForecast in
                        WeatherForecastItemView(weatherForecast: weatherForecast)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle(viewModel.city.name)
        .toolbar {
            if viewModel.showSetHomeButton {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Set Home") {
                        viewModel.updateHomeCity()
                    }
                    .alert("Home set!", isPresented: $viewModel.isShowingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                }
            }
        }
    }
}

struct WeatherForecastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView(
            viewModel: WeatherForecastViewModel(
                city: City(
                    name: "São Paulo",
                    lat: 23.5558,
                    lon: 46.6396,
                    state: "SP",
                    country: "BR"
                ),
                showSetHomeButton: true
            )
        )
    }
}
