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
                        annotationItems: viewModel.locationFetchOutputModel,
                        annotationContent: { item in
                            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: item.lat, longitude: item.lng)) {
                                Image(systemName: "mappin.circle.fill")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 28, height: 28)
                                    .onTapGesture {
                                        print("item:", item)
                                        // ここから登録内容表示Viewを開く
                                    }
                            }
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
                                controller.onLocationButtonTapped()
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
                    .sheet(isPresented: $viewModel.isShowAddLocationView, onDismiss: {
                        refrech(region.center.latitude, lng: region.center.longitude)
                    }, content: {
                        LocationAddViewBuilder.shared.build(lat: region.center.latitude, lng: region.center.longitude)
                    })
                    .sheet(isPresented: $viewModel.isShowMenuView) {
                        MenuViewBuilder.shared.build()
                    }
                    .alert("確認", isPresented: $viewModel.isShowLocationAlert) {
                        Button("OK") {}
                    } message: {
                        Text("'設定'から位置情報を許可してください")
                    }
                    .alert("エラー", isPresented: $viewModel.isShowFetchLocationAlert) {
                        Button("もう一度") {
                            firstLaunchRefresh()
                        }
                    } message: {
                        Text("データの取得に失敗しました。\n時間をおいてもう一度お試しください。")
                    }
                    .onAppear {
                        firstLaunchRefresh()
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
                    if viewModel.isShowIndicatorView {
                        withAnimation {
                            IndicatorView()
                        }
                    }
                }
            }
        }
    }


    private func firstLaunchRefresh() {
        controller.getCurrentLocation()
        refrech(viewModel.currentLocation.lat, lng: viewModel.currentLocation.lng)
    }


    private func refrech(_ lat: Double, lng: Double) {
        controller.toggleIndicator()
        controller.fetchLocation()
        setRegion(
            lat: lat,
            lng: lng
        )
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            controller.toggleIndicator()
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
        MapViewBuilder.shared.build()
            .previewDevice("iPhone 13 Pro")
    }
}
