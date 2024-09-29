//
//  playlistDescCell.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 28/09/24.
//

import SwiftUI

struct playlistDescCell: View {
    
    var descriptionText : String = Product.mock.description
    var username : String = "Gulam Ali"
    var subheadline : String = "Product subheadline"
    var onAddToPlaylistTapped : (() -> Void)? = nil
    var ondownloadTapped : (() -> Void)? = nil
    var onShareTapped : (() -> Void)? = nil
    var ondotsTapped : (() -> Void)? = nil
    var onShuffleTapped : (() -> Void)? = nil
    var onPlayTapped : (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(descriptionText)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 8){
                Image(systemName: "applelogo")
                    .font(.title3)
                    .foregroundStyle(Color.spotifyGreen)
                Text("Made for ")
                +
                Text(username)
                    .bold()
                    .foregroundStyle(Color.spotifyWhite)
            }
            
            Text(subheadline)
                
            HStack(spacing: 0){
                HStack(spacing: 0){
                    Image(systemName: "plus.circle")
                        .padding(8)
                        .onTapGesture {
                            
                        }
                    
                    Image(systemName: "arrow.down.circle")
                        .padding(8)
                        .onTapGesture {
                            
                        }
                    
                    Image(systemName: "square.and.arrow.up")
                        .padding(8)
                        .onTapGesture {
                            
                        }
                    
                    Image(systemName: "ellipsis")
                        .padding(8)
                        .onTapGesture {
                            
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 8){
                    Image(systemName: "shuffle")
                        .font(.system(size: 24))
                        .onTapGesture {
                            
                        }
                    
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 46))
                        .onTapGesture {
                            
                        }
                    
                }
                .foregroundStyle(Color.spotifyGreen)
                
            }
            .font(.title2)
            .offset(x: -8)
        }
        .font(.callout)
        .foregroundStyle(Color.spotifyLightGrey)
        .padding()
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        playlistDescCell()
    }
}
