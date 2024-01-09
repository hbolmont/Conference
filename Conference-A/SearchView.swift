import SwiftUI

struct SearchView: View {
    @StateObject var searchViewModel: SearchViewModel = SearchViewModel()
    @State private var searchText = ""
    @State private var searchMode: SearchMode = .profile
    
    enum SearchMode: String, CaseIterable {
        case profile = "Profile"
        case location = "Location"
    }
    
    var body: some View {
        ZStack {
            Color.blue
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Picker("Search Mode", selection: $searchMode) {
                    ForEach(SearchMode.allCases, id: \.self) { mode in
                        Text(mode.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                TextField("Look for something", text: $searchText)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .keyboardType(.alphabet)
                
                List {
                    if searchMode == .profile {
                        ForEach(filteredResults) { result in
                            SingleProfileView(image: result.image, name: result.name)
                        }
                    } else {
                        ForEach(filteredResultsLocations) { result in
                            SingleLocationView(image: result.image, name: result.name)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
    }
    
    private var filteredResults: [Profile] {
        return searchViewModel.filteredProfiles(searchText: searchText)
    }
    
    private var filteredResultsLocations: [Location] {
        return searchViewModel.filteredLocations(searchText: searchText)
    }
    
    struct SingleProfileView: View {
        var image: String
        var name: String
        
        var body: some View {
            HStack(spacing: 10) {
                Image(image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text(name)
            }
        }
    }
    
    struct SingleLocationView: View {
        var image: String
        var name: String
        
        var body: some View {
            HStack(spacing: 10) {
                Image(image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text(name)
            }
        }
    }
    
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }
    
}
