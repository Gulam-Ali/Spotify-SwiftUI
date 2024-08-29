//
//  CategoryCell.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 28/07/24.
//

import SwiftUI

struct CategoryCell: View {
    
    var title = "All"
    var isSelected = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal,10)
//            .background(isSelected ? .spotifyGreen : .spotifyDarkGrey)
//            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .themeColor(isSelected: isSelected)
            .clipShape(.capsule)
    }
}

extension View {
    func themeColor(isSelected:Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGrey)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
    }
}

#Preview {
    ZStack{
        Color.black
            .ignoresSafeArea()
        VStack(spacing:10){
            CategoryCell(title: "A big title", isSelected: false)
            CategoryCell(title: "Rock", isSelected: false)
            CategoryCell(isSelected: true)
        }
    }
}
