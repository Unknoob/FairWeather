//
//  CitySearchView.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import MapKit
import SwiftUI

struct CitySearchView: View {
    @StateObject var viewModel = CitySearchViewModel()

    var body: some View {
        List {
            ForEach(viewModel.searchResults, id: \.name) { city in
                NavigationLink(destination: WeatherForecastView(viewModel: WeatherForecastViewModel(city: city))) {
                    Text([city.name, city.state, city.country].compactMap({$0}).joined(separator: " - "))
                }
            }
        }
        .searchable(text: $viewModel.searchText, prompt: Text("Search text..."))
        .onChange(of: viewModel.debouncedSearchText) { searchText in
            Task {
                await viewModel.fetchCities(searchTerm: searchText)
            }
        }
    }
}

struct WeatherSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CitySearchView()
    }
}
