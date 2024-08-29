//
//  HomeView.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 28/07/24.
//

import SwiftUI
import SwiftfulUI

struct HomeView: View {
    
    @State private var currentUser : User? = nil
    @State private var selectedCategory : categories? = nil
    @State private var products : [Product] = []
    
    var body: some View {
        ZStack{
            Color
                .spotifyBlack
                .ignoresSafeArea()
            ScrollView(.vertical){
                LazyVStack(spacing: 5, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        VStack{
                            recentSections
                        }
                        
                        
                        ForEach(0..<10){_ in
                            Rectangle()
                                .frame(width: 200, height: 200)
                                .foregroundColor(.orange)
                                
                        }
                    } header: {
                        headerView
                    }
                })
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getUserData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getUserData() async {
        do{
            currentUser = try await databaseManager().getUsers().first
            products = try await Array(databaseManager().getProducts().prefix(8))
        }catch{
            print("catched error")
        }
    }
    
    private var recentSections: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                RecentCell(recentCellImage: product.firstImage, titleLabel: product.title)
            }
        }
        .padding()
    }
    
    private var headerView : some View{
        HStack(spacing:10){
            ZStack{
                if let currentUser = currentUser{
                    imageLoaderView(urlString: currentUser.image)
                        
                        .clipShape(.circle)
                        .onTapGesture {
                            print("profile tapped")
                        }
                }
            }
            .frame(width: 50, height: 50)
            .padding(.leading, 10)
    
            ScrollView(.horizontal) {
                HStack(spacing:10){
                    ForEach(categories.allCases, id: \.self){ category in
                        CategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)

        }
        .background(Color.spotifyBlack)
    }
}

#Preview {
    HomeView()
}
