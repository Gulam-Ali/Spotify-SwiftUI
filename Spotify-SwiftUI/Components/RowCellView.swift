//
//  RowCellView.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 03/09/24.
//

import SwiftUI

struct RowCellView: View {
    var image : String = constants.randomImage
    var title : String = "Product"
    var body: some View {
        VStack(spacing: 8){
            imageLoaderView(urlString: image)
                .frame(width: 100, height: 100)
            Text(title)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(.spotifyLightGrey)
                .lineLimit(2)
                .padding(4)
                
            
        }
        .frame(width: 100)
 
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        RowCellView()
    }
    
}
