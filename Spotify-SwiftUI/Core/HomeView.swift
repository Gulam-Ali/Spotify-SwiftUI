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
    @State private var productRows : [ProductRow] = []
    
    var body: some View {
        ZStack{
            Color
                .spotifyBlack
                .ignoresSafeArea()
            ScrollView(.vertical){
                LazyVStack(spacing: 5,
                           pinnedViews: [.sectionHeaders],
                           content: {
                    Section {
                        VStack{
                            recentSections
                            if let firstProduct = products.first{
                                newReleaseView(firstProduct: firstProduct)
                            }
                           listRows

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
            
            var titles = Set(products.map({$0.category}))
            for product in products{
                let pro = products.filter({$0.category == product.category})
                productRows.append(ProductRow(title: product.category, products: pro))
            }
        }catch{
            print("catched error")
        }
    }
    
    private var recentSections: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                RecentCell(recentCellImage: product.firstImage, titleLabel: product.title)
                    .asButton(.press, action: {
                        print("recent sec tapped")
                    })
            }
        }
       
        .padding()
    }
    
    private func newReleaseView(firstProduct:Product) -> some View {
        NewReleaseCell(
            imageName: firstProduct.firstImage,
            heading: firstProduct.category,
            subHeading: firstProduct.category,
            title: firstProduct.title,
            subTitle: firstProduct.description) {
                print("Add to playlist tapped")
            } onTapPlayTapped: {
                print("play tapped")
            }
            .padding()
    }
    
    private var listRows : some View {
        ForEach(productRows) { product in
            VStack(spacing: 12){
                Text(product.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.spotifyLightGrey)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing:4){
                        ForEach(product.products) { product in
                            RowCellView(image: product.firstImage, title: product.title)
                                .asButton(.press, action: {
                                    print("img tapped")
                                })
                        }
                    }
                    .padding(.horizontal, 20)
                    
                }
                .scrollIndicators(.never)
            }
            
        }
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
