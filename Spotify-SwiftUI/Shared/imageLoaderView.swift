//
//  imageLoaderView.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 27/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct imageLoaderView: View {
    
    var urlString = constants.randomImage
    var resizingMode : ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            }
            .clipped()

    }
}

#Preview {
    imageLoaderView()
        .cornerRadius(20)
        .padding(40)
        .padding(.vertical,60)
}
