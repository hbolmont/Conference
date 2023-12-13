//
//  SearchView.swift
//  Conference-A
//
//  Created by basquin nicolas on 06/12/2023.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var searchViewModel: SearchViewModel = SearchViewModel()
    @State private var searchText = ""
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.black,.white]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            VStack {
                            TextField("Look for something", text: $searchText)
                                .padding(8)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .padding(.horizontal)
                            
                            List {
                                ForEach(searchViewModel.filteredProfiles(searchText: searchText)) { profile in
                                    ProfileView(image: profile.image, name: profile.name)
                                }
                            }
                            .listStyle(PlainListStyle())
                        }
                        .navigationTitle("Searchable Example")
        }
        
    }
}

struct ProfileView: View{
    
    var image: String
    var name: String
    
    var body: some View {
        HStack(spacing: 10){
            Image(image).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
            Text(name)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
