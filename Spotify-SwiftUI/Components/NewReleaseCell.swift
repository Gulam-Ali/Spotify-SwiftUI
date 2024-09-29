//
//  NewReleaseCell.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 03/09/24.
//

import SwiftUI

struct NewReleaseCell: View {
    
    var imageName : String = constants.randomImage
    var heading : String? = "Apple"
    var subHeading : String? = "New Release"
    var title : String? = "Some Title"
    var subTitle : String? = "Single - Title"
    var onTapAddtoPlaylistTapped : (() -> Void)? = nil
    var onTapPlayTapped : (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 10) {
                imageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                .clipShape(.circle)
                VStack(alignment: .leading,spacing: 2){
                    if let heading{
                        Text(heading)
                            .foregroundStyle(.spotifyLightGrey)
                            .font(.callout)
                    }
                    if let subHeading{
                        Text(subHeading)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                imageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                VStack(alignment: .leading, spacing: 32){
                    VStack(alignment: .leading, spacing: 4){
                        if let title{
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                        
                        if let subTitle{
                            Text(subTitle)
                                .foregroundStyle(.spotifyLightGrey)
                        }
                    }
                    .font(.callout)
                    .offset(y: 12)
                    
                    
                    HStack(spacing: 0){
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGrey)
                            .font(.title)
                            .padding(4)
                            .onTapGesture {
                                onTapAddtoPlaylistTapped?()
                            }
                            .offset(x: -4)
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                            .padding(4)
                            
                    }
                    .offset(y: -4)
                }
   
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .themeColor(isSelected: false)
            .cornerRadius(12.0)
//            .clipShape(.buttonBorder)
            .onTapGesture {
              onTapPlayTapped?()
            }
        
        }
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        NewReleaseCell()
            .padding()
    }
}
