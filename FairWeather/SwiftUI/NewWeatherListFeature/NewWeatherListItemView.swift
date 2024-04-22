//
//  NewWeatherListItemView.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 20/04/24.
//

import SwiftUI

struct NewWeatherListItemView: View {
    let consolidatedWeatherViewModel: ConsolidatedWeatherViewModel

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Spacer()
                    AsyncImage(url: consolidatedWeatherViewModel.iconURL) { result in
                        result.image?
                            .resizable()
                            .scaledToFill()
                    }
                    .frame(width: 30.0, height: 30.0)
                    Spacer()
                }
                HStack {
                    Text(consolidatedWeatherViewModel.currentWeather)
                }
            }
            .frame(width: 100)
            Spacer()
            VStack {
                Text(consolidatedWeatherViewModel.maximumTemperature)
                Text(consolidatedWeatherViewModel.minimumTemperature)
            }
            Spacer()
            Text(consolidatedWeatherViewModel.currentTemperature)
                .font(.system(size: 32))
        }
    }
}

struct NewWeatherListItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewWeatherListItemView(
            consolidatedWeatherViewModel: ConsolidatedWeatherViewModel(
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
        )
    }
}
