//
//  LocationDescriptionView.swift
//  SwiftUIMapApp
//
//  Created by Mac on 4/7/23.
//

import SwiftUI
import MapKit

struct LocationDescriptionView: View {
    
    let location : Location
    var body: some View {
        ScrollView{
            VStack {
                imageSection
                VStack {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

struct LocationDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDescriptionView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}

extension LocationDescriptionView {
    
    private var imageSection : some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width:UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection : some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth : .infinity,alignment: .leading)
    }
    private var descriptionSection : some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(location.description)
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(8)
                
            if let url = URL(string: location.link) {
                Link("To Learn More go to Wiki..", destination: url)
                    .padding(8)
            }
        }
        .multilineTextAlignment(.leading)
    }
    
    private var mapLayer : some View {
        Map(
            coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))) ,
            annotationItems: [location],
            annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationPinView()
                        .shadow(radius: 10)
                }
            })
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
}
