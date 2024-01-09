//
//  ContentView.swift
//  Conference-A
//
//  Created by hugo on 06/12/2023.
//

import SwiftUI
import MapKit

struct Location : Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.63784066945700, longitude: 6.86289287102771), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    let locations = [
        Location(name: "Bar", coordinate: CLLocationCoordinate2D(latitude: 47.63784066945700, longitude: 6.86289287102771)),
        Location(name: "Bar2", coordinate: CLLocationCoordinate2D(latitude: 47.63684066945700, longitude: 6.86389287102771))
    ]
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Spacer()
                Text("CONFERENCE APP")
                    .font(.headline)
                    .padding()
                Image(systemName: "star")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Spacer()
            }

            // Content
            ZStack {
//                Map(coordinateRegion: $mapRegion, annotationItems: locations) {
//                    location in MapMarker(coordinate: location.coordinate)
//                }
                
                Map(coordinateRegion: $mapRegion, annotationItems: locations) {
                    location in MapAnnotation(coordinate: location.coordinate) {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 22, height: 22)
                            .onTapGesture {
                                let selectedLocation = location
                                print("o")
                            }
                    }
                }
            }

            // Footer
            HStack {
                Spacer()
                Text("Footer")
                    .font(.headline)
                    .padding()
                // Bouton home liste
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
