//
//  LocationsPreviewView.swift
//  SwiftUIMapApp
//
//  Created by Mac on 4/6/23.
//

import SwiftUI

struct LocationsPreviewView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    let location : Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0.0) {
            VStack(alignment: .leading, spacing: 12.0) {
                imageSection
                titleSection
            }
            VStack(spacing: 15.0){
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white.opacity(0.4))
            .offset(y:65)
        )
        .cornerRadius(10)
    }
}

struct LocationsPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            LocationsPreviewView(location: LocationsDataService.locations.first!)
                .padding()
                .environmentObject(LocationsViewModel())
        }
    }
}

extension LocationsPreviewView {
    
    private var imageSection : some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
    
    private var titleSection : some View {
        VStack(alignment: .leading, spacing: 5.0) {
            
            Text(location.name)
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(location.cityName)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var learnMoreButton : some View {
        Button(action: {
            vm.showPreview = location
        }, label: {
            Text("Learn More")
                .frame(width: 125, height: 50)
                .accentColor(.white)
                .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                .cornerRadius(10)
            
        })
    }
    private var nextButton : some View {
        Button(action: {
            vm.nextButtonPressed()
        }, label: {
            Text("Next")
                .frame(width: 125, height: 50)
                .accentColor(.white)
                .background(Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)))
                .cornerRadius(10)
            
        })
    }
}
