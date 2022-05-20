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
    @ObservedObject var viewModel: MapViewModel
    let controller: MapController
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
                                withAnimation {
                                    controller.onPlusButtonTapped()
                                }
                            }
                            MapToolBarButtonView(imageName: "location") {
                                controller.getCurrentLocation()
                                withAnimation {
                                    setRegion(lat: viewModel.currentLocation.lat, lng: viewModel.currentLocation.lng)
                                }
                            }
                            MapToolBarButtonView(imageName: "menucard") {
                                controller.onMenuButtonTapped()
                            }
                            Spacer()
                        }
                    }
                    .sheet(isPresented: $viewModel.isShowAddLocationView) {
                        AddLocationView()
                    }
                    .sheet(isPresented: $viewModel.isShowMenuView) {
                        MenuView()
                    }
                    .onAppear {
                        controller.getCurrentLocation()
                        setRegion(
                            lat: viewModel.currentLocation.lat,
                            lng: viewModel.currentLocation.lng
                        )
                    }
                    if viewModel.isShowFocusView {
                        MapFocusView {
                            withAnimation {
                                controller.onCancelAddLocationButtonTapped()
                            }
                        } onAddButtonTapped: {
                            controller.onAddLocationButtonTapped()
                        }
                    }
                }
            }
        }
    }

    private func setRegion(lat: Double, lng: Double) {
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: lat,
                longitude: lng
            ), span: MKCoordinateSpan(
                latitudeDelta: 0.0009,
                longitudeDelta: 0.0009
            )
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapBuilder.shared.build()
            .previewDevice("iPhone 13 Pro")
    }
}
