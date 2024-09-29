//
//  PlaylistView.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 28/09/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistView: View {
    
    var product : Product = .mock
    @State private var products : [Product] = []
    @State private var showHeader : Bool = false
   
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 12){
                    playlistHeaderCell(
                        title: product.title,
                        subtitle: product.brand ?? "Gulam Ali",
                        imageName: product.firstImage,
                        shadowColor: Color.spotifyBlack
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150 ? true : false
                    }
                    
                    playlistDescCell(
                        descriptionText: product.description,
                        username: "Gulam Ali",
                        subheadline: product.category,
                        onAddToPlaylistTapped: nil,
                        ondownloadTapped: nil,
                        onShareTapped: nil,
                        ondotsTapped: nil,
                        onShuffleTapped: nil,
                        onPlayTapped: nil
                    )
                    
                    ForEach(products) { product in
                        songRowCell(
                            imageSize: 50.0,
                            imageName: product.firstImage,
                            songTitle: product.title,
                            songSubTitle: product.brand ?? "Brand",
                            ellipsisTapped: nil
                        )
                        .padding(.leading, 12)
                    }
                    
                }
            }
            .scrollIndicators(.hidden)
            
            ZStack{
                Text(product.title)
                    .font(.headline)
                    .bold()
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(.spotifyBlack)
                    .offset(y: showHeader ? 0 : -200)
                    .opacity(showHeader ? 1 : 0)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(.spotifyGrey.opacity( showHeader ? 0 : 0.7))
                    .clipShape(Circle())
                    .onTapGesture {
                        
                    }
                    .padding(.leading, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
            .foregroundStyle(.spotifyWhite)
            .animation(.smooth(duration: 0.2), value: showHeader )
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .task {
            await getProducts()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getProducts() async {
        do{
            products = try await databaseManager().getProducts()
        }catch{
            print("catched error")
        }
    }
    
}

#Preview {
    PlaylistView()
}
