import Foundation

class SearchViewModel: ObservableObject {
    @Published var profiles: [Profile] = []
    @Published var locations: [Location] = []
    
    init() {
        getProfiles();
        getLocations()
    }
    
    func getProfiles() {
        if let data = loadJSON(filename: "profiles") {
            do {
                let decoder = JSONDecoder()
                self.profiles = try decoder.decode([Profile].self, from: data)
            } catch {
                print("Error decoding profiles: \(error)")
            }
        }
    }

    func getLocations() {
        if let data = loadJSON(filename: "locations") {
            do {
                let decoder = JSONDecoder()
                self.locations = try decoder.decode([Location].self, from: data)
            } catch {
                print("Error decoding locations: \(error)")
            }
        }
    }

    func getImageString(forIndex index: Int) -> String {
        return profiles[index].image
    }
    
    func getNameString(forIndex index: Int) -> String {
        return profiles[index].name
    }
    
    func getImageStringLocation(forIndex index: Int) -> String {
        return locations[index].image
    }
    
    func getNameStringLocation(forIndex index: Int) -> String {
        return locations[index].name
    }

    func filteredProfiles(searchText: String) -> [Profile] {
        if searchText.isEmpty {
            return profiles
        } else {
            return profiles.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func filteredLocations(searchText: String) -> [Location] {
        if searchText.isEmpty {
            return locations
        } else {
            return locations.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    private func loadJSON(filename: String) -> Data? {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                print("Error loading JSON for \(filename): \(error)")
            }
        }
        return nil
    }

    
}
