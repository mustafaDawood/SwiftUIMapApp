//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by Mac on 4/4/23.
//

import SwiftUI

@main
struct SwiftUIMap: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
