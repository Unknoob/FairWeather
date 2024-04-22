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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherForecastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView(
            viewModel: WeatherForecastViewModel(
                city: City(name: "São Paulo", lat: 23.5558, lon: 46.6396, state: "SP", country: "BR")
            )
        )
    }
}
