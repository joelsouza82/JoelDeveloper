//
//  HomeView.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        let columns = [GridItem(.flexible()), GridItem(.flexible())]
        
        return ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.sections) { section in
                    Button {
                        coordinator.navigate(to: section.route)
                    } label: {
                        VStack(spacing: 12) {
                            Image(systemName: section.icon)
                                .font(.system(size: 32))
                                .foregroundStyle(.tint)
                            Text(section.title)
                                .font(.headline)
                                .foregroundStyle(AppColors.whiteText)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 120)
                        .background(AppColors.cardBackground)
                        .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .navigationTitle("🧑🏽‍💻 Joel de Almeida Souza")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(AppColors.primaryBlue, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
    }
}

#Preview {
    NavigationStack {
        HomeView(viewModel: HomeViewModel())
    }
}
