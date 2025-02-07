//
//  HomeTabView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import SwiftUI
import DGCharts

struct HomeTabView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Section 1: User Information
                    HStack(spacing: 12) {
                        Image("userImage")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Good Morning, Ahmed!")
                                .font(.system(size: 16))
                                .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                            
                            Text("Track nutrition, stay healthy!")
                                .font(.system(size: 12))
                                .foregroundColor(Color(hex: Constants.Colors.customGray))
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Section 2: Scan Your Food
                    FoodScanView()
                    
                    // Section 3: Discover Healthy Recipes
                    DiscoverHealthyView()
                    
                    // Section 4: Calories Consumed
                    MacroChartView(macroData: viewModel.macroData)
                    
                    // Section 5: Recommended For You
                    Text("Recommended For You")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                        .padding(.horizontal, 20)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(viewModel.foodItems) { item in
                                RecommendedItemView(item: item)
                                    .frame(minHeight: 200) // Ensure enough height for content
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10) // Add bottom padding to avoid cutting
                    }
                    
                    // Section 6: Health Tip of the Day
                    HealthTipView()
                }
            }
            .navigationBarItems(
                leading: Button(action: {
                    print("Hamburger menu tapped")
                }) {
                    Image("hamburgerImage")
                        .resizable()
                        .frame(width: 24, height: 24)
                },
                trailing: Button(action: {
                    print("Search button tapped")
                }) {
                    Image("searchImage")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("homeNutrakLogo")
                        .resizable()
                        .frame(width: 89, height: 24)
                }
            }
        }
    }
}

