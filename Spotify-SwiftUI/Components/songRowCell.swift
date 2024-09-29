//
//  songRowCell.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 29/09/24.
//

import SwiftUI

struct songRowCell: View {
    
    var imageSize : CGFloat = 50.0
    var imageName : String = constants.randomImage
    var songTitle : String = "Song Title"
    var songSubTitle : String = "Song Sub Title"
    var ellipsisTapped :( () -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 8){
            imageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading, spacing: 4){
                Text(songTitle)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.spotifyWhite)
                Text(songSubTitle)
                    .font(.callout)
                    .foregroundStyle(Color.spotifyLightGrey)
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.title3)
                .foregroundStyle(.spotifyLightGrey)
                .padding(15)
                .onTapGesture {
                    ellipsisTapped?()
                }
        }
       // .padding()
       
        
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        VStack{
            songRowCell()
            songRowCell()
            songRowCell()
            songRowCell()
        }
    }
}
