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
    @ObservedObject var mapViewModel: MapViewModel
    let mapController: MapController
    var coordinate: CLLocationCoordinate2D?
    var lat = 0.0
    var lng = 0.0

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
                                mapController.onPlusButtonTapped()
                            }
                            MapToolBarButtonView(imageName: "location") {
                                mapController.onCurrentLocationButtonTapped()
                            }
                            MapToolBarButtonView(imageName: "menucard") {
                                mapController.onMenuButtonTapped()
                            }
                            Spacer()
                        }
                    }
                    .sheet(isPresented: $mapViewModel.isShowAddLocationView) {
                        AddLocationView()
                    }
                    .sheet(isPresented: $mapViewModel.isShowMenuView) {
                        MenuView()
                    }
                    .onAppear {
                        setRegion(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng))
                    }
                    if mapViewModel.isShowFocusView {
                        MapFocusView {
                            mapController.onCancelAddLocationButtonTapped()
                        } onAddButtonTapped: {
                            mapController.onAddLocationButtonTapped()
                        }
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
        MapBuilder.shared.build()
            .previewDevice("iPhone 13 Pro")
    }
}
