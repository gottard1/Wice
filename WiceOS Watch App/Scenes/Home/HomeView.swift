//
//  ContentView.swift
//  WiceOS Watch App
//
//  Created by Marcel Felipe Gottardi Anesi on 01/09/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var watchOSConnector = WatchOSConnector()
    
    var body: some View {
        VStack(spacing: 10) {
            HStack() {
                Button{
                    watchOSConnector.currentImageIndex = 0
                    watchOSConnector.imageList.removeAll()
                } label: {
                    Image(systemName: "trash")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                
                Button{
                    watchOSConnector.backwardImage()
                } label: {
                    Image(systemName: "arrow.uturn.backward")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                
                Button{
                    watchOSConnector.forwardImage()
                } label: {
                    Image(systemName: "arrow.uturn.forward")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
            }
            
            Image(uiImage: watchOSConnector.getImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
