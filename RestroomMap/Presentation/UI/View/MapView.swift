//
//  MapView.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/10.
//

import SwiftUI
import MapKit

struct PinItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var region = MKCoordinateRegion() // 座標領域
    @State private var userTrackingMode: MapUserTrackingMode = .none
    @State private var isShowMenuView = false
    var coordinate: CLLocationCoordinate2D?
    var lat: Double
    var lng: Double

    var body: some View {
        GeometryReader { _ in
            NavigationView {
                ZStack {
                    Map(
                        coordinateRegion: $region,
                        interactionModes: .all,
                        showsUserLocation: true,
                        userTrackingMode: $userTrackingMode,
                        annotationItems: [
                            PinItem(coordinate: .init(latitude: lat, longitude: lng))
                        ],
                        annotationContent: { item in
                            MapMarker(coordinate: item.coordinate)
                        }
                    )
                    .edgesIgnoringSafeArea(.all)
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            MapToolBarButtonView(imageName: "plus") {
                                print("On tapped button 1.")
                            }
                            MapToolBarButtonView(imageName: "location") {
                                print("On tapped button 2.")
                            }
                            MapToolBarButtonView(imageName: "menucard") {
                                isShowMenuView.toggle()
                            }
                            .sheet(isPresented: $isShowMenuView) {
                                MenuView()
                            }
                            Spacer()
                        }
                    }
                    .onAppear {
                        setRegion(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng))
                    }
                }
            }
        }
    }

    private func setRegion(coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.0009, longitudeDelta: 0.0009)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(lat: 35.65139, lng: 139.63679)
            .previewDevice("iPhone 13 Pro")
    }
}
