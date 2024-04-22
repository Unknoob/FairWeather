//
//  CitySearchViewModel.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Combine
import SwiftUI

@MainActor class CitySearchViewModel: ObservableObject {
    @Published var searchResults: [City] = []

    @Published var searchText: String = ""
    @Published var debouncedSearchText: String = ""
    @Published var isLoading: Bool = false

    let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService() ) {
        self.networkService = networkService
        $searchText
            .debounce(for: .seconds(0.75), scheduler: RunLoop.main)
            .assign(to: &$debouncedSearchText)

    }

    func fetchCities(searchTerm: String) async {
        guard !searchTerm.isEmpty else {
            searchResults = []
            return
        }
        isLoading = true
        let request = CitySearchRequest.searchByName(name: searchTerm)
        do {
            let result: Result<[City], RequestError> = try await networkService.executeRequest(request: request)
            isLoading = false
            switch result {
            case let .success(cityList):
                searchResults = cityList
            case let .failure(error):
                print(error)
            }
        } catch {
            isLoading = false
            print(error)
        }
    }
}
