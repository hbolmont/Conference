import Foundation

class SearchViewModel: ObservableObject {
    @Published var search: [Profile] = []
    
    init() {
        getSearch()
    }
    
    func getSearch() {
        let newSearch = [
            Profile(image: "profile", name: "Jean Miche"),
            Profile(image: "profile", name: "Gerard Pignon"),
            Profile(image: "profile", name: "Christophe Merlu"),
            Profile(image: "profile", name: "Gerard Ardu"),
            Profile(image: "profile", name: "Michel P")
        ]
        
        self.search += newSearch
    }
    
    func getImageString(forIndex index: Int) -> String {
        return search[index].image
    }
    
    func getNameString(forIndex index: Int) -> String {
        return search[index].name
    }

    func filteredProfiles(searchText: String) -> [Profile] {
        if searchText.isEmpty {
            return search
        } else {
            return search.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
