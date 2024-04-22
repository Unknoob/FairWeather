//
//  WeatherForecastItemView.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import SwiftUI

struct WeatherForecastItemView: View {
    let weatherForecast: WeatherForecast
    
    var body: some View {
        VStack {
            Text(weatherForecast.date.formattedDate)
                .fontWeight(.bold)
            HStack {
                VStack {
                    HStack {
                        Spacer()
                        AsyncImage(url: weatherForecast.iconURL) { result in
                            result.image?
                                .resizable()
                                .scaledToFill()
                        }
                        .frame(width: 40.0, height: 40.0)
                        Spacer()
                    }
                    HStack {
                        Text(weatherForecast.weatherList.first?.description ?? "")
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(width: 100)
                Spacer()
                VStack {
                    Text("Max: \(weatherForecast.mainInformation.maximumTemperature.formattedAsCelsiusTemperature)")
                    Text("Min: \(weatherForecast.mainInformation.minimumTemperature.formattedAsCelsiusTemperature)")
                }
                Spacer()
                Text(weatherForecast.mainInformation.currentTemperature.formattedAsCelsiusTemperature)
                    .font(.system(size: 24))
            }
        }
    }
}

struct WeatherForecastItemView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastItemView(
            weatherForecast: WeatherForecast(
                mainInformation: MainInformation(
                    currentTemperature: 22.0,
                    airPressure: 1016,
                    airHumidity: 60,
                    minimumTemperature: 15.0,
                    maximumTemperature: 25.0
                ),
                date: Date(),
                weatherList: [
                    Weather(
                        id: 804,
                        name: "Clouds",
                        description: "nublado",
                        icon: "04n"
                    )
                ],
                windInformation: Wind(
                    speed: 2.51,
                    degrees: 152
                ),
                cloudInformation: CloudInformation(
                    allCloudsPercentage: 93
                )
            )
        )
    }
}
