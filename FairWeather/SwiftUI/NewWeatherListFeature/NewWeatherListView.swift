//
//  NewWeatherListView.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 20/04/24.
//

import SwiftUI

struct NewWeatherListView: View {
    let consolidatedWeatherListViewModel: [ConsolidatedWeatherViewModel]

    var body: some View {
        List {
            ForEach(consolidatedWeatherListViewModel) { consolidatedWeatherViewModel in
                NewWeatherListItemView(consolidatedWeatherViewModel: consolidatedWeatherViewModel)
            }
        }
    }
}

struct NewWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        NewWeatherListView(
            consolidatedWeatherListViewModel: [
                ConsolidatedWeatherViewModel(
                    consolidatedWeather: ConsolidatedWeather(
                        id: 5865000829714432,
                        currentWeather: "Showers",
                        iconName: "s",
                        currentTemperature: 27.72,
                        minimumTemperature: 19.07,
                        maximumTemperature: 26.770000000000003,
                        applicableDate: "2021-09-18"
                    )
                )
            ]
        )
    }
}
