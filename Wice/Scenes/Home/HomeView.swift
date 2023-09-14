//
//  ContentView.swift
//  Wice
//
//  Created by Marcel Felipe Gottardi Anesi on 16/06/23.
//

import SwiftUI
import PencilKit

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            DrawView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading:
                        Button(action: {
                            // TODO: - Implement friends section
                        }, label: {
                            Image(systemName: "person.2.fill")
                                .foregroundColor(Color.gray)
                        }),
                    trailing:
                        Button(action: {
                            print("perfil")
                            // TODO: - Implement profile
                        }, label: {
                            RoundedImage(image: "selfie")
                                .frame(width: 50, height: 50)
                        })
                )
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Wice")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color.black)
                        }
                    }
                }
        }
        .background(Color.orange)
    }
}

#Preview {
    HomeView()
}
