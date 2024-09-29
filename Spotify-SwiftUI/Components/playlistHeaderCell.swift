//
//  playlistHeaderCell.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 28/09/24.
//

import SwiftUI
import SwiftfulUI

struct playlistHeaderCell: View {
    
    var title : String = "Some Title"
    var subtitle : String = "Some Sub title"
    var imageName : String = constants.randomImage
    var shadowColor : Color = Color.spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(content: {
                imageLoaderView(urlString: imageName)
            })
            .overlay(alignment: .bottomLeading, content:  {
                VStack(alignment: .leading, spacing: 8){
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom))
               
                
            })
            .asStretchyHeader(startingHeight: 300)
            .frame(height: 300)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        ScrollView{
            playlistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
