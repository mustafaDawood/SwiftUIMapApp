//
//  LocationsView.swift
//  SwiftUIMapApp
//
//  Created by Mac on 4/4/23.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm : LocationsViewModel
    var body: some View {
        ZStack {
           mapLayer
                .ignoresSafeArea()
            VStack (spacing : 0) {
                header
                    .padding()
                Spacer()
                locationPreview
            }
        }
        .sheet(item: $vm.showPreview) { location  in
            LocationDescriptionView(location: location)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    private var header : some View {
        VStack {
            Button(action: {
                vm.showLocationsList()
            }, label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .italic()
                    .foregroundColor(.primary)
                    .frame(height : 55)
                    .frame(maxWidth : .infinity)
                    .overlay(
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.locationsList ? 180 : 0 )),
                        alignment: .leading)
            })
            if vm.locationsList {
                LocationListView()
            }
        }
        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)).opacity(0.9))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer : some View {
        Map(coordinateRegion: $vm.mapregion,
            annotationItems: vm.locations,
            annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationPinView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.6)
                        .shadow(radius : 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            })
    }
    
    private var locationPreview : some View {
        ZStack {
            ForEach(vm.locations) { location  in
                if vm.mapLocation == location {
                    LocationsPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
