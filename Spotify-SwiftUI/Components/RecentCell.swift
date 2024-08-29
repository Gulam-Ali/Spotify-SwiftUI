//
//  RecentCell.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 07/08/24.
//

import SwiftUI

struct RecentCell: View {
    
    var recentCellImage : String = constants.randomImage
    var titleLabel : String = "Some random title jdjfhhrrhje ehrewhr rhjewhr ehre rewhrj"
    
    var body: some View {
        HStack{
            imageLoaderView(urlString: recentCellImage)
                .frame(width: 55, height: 55)
            Text(titleLabel)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
                .padding(.trailing, 8)
                
        }
        
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColor(isSelected: false)
        .foregroundColor(.white)
        .background(Color.spotifyDarkGrey)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        VStack{
            HStack{
                RecentCell()
                RecentCell()
            }
            HStack{
                RecentCell()
                RecentCell()
            }
        }
    }
    
}
