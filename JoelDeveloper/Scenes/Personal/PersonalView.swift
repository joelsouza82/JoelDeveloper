//
//  PersonalView.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//

import SwiftUI

struct PersonalView: View {
    @ObservedObject var viewModel: PersonalViewModel
    @Environment(\.openURL) private var openURL

    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView("Carregando...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let errorMessage = viewModel.errorMessage {
                ContentUnavailableView {
                    Label("Erro ao carregar", systemImage: "exclamationmark.triangle")
                } description: {
                    Text(errorMessage)
                } actions: {
                    Button("Tentar novamente") {
                        viewModel.loadData()
                    }
                }
            } else {
                personalContent
            }
        }
        .navigationTitle("🏠 Dados Pessoais")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(AppColors.primaryBlue, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }

    private var personalContent: some View {
        List {
            Section(header: Text("Endereço")) {
                HStack {
                    Image(systemName: "house.fill")
                        .foregroundStyle(AppColors.primaryBlue)
                    VStack(alignment: .leading) {
                        Text(viewModel.personal?.address ?? "-")
                            .font(.body)
                        Text("\(viewModel.personal?.neighborhood ?? "-") — \(viewModel.personal?.city ?? "-") / \(viewModel.personal?.state ?? "-")")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text(viewModel.personal?.cep ?? "-")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            Section(header: Text("Contatos")) {
                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundStyle(AppColors.primaryBlue)
                    Text(viewModel.personal?.phone ?? "-")
                }

                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundStyle(AppColors.primaryBlue)
                    Text(viewModel.personal?.email ?? "-")
                }
            }

            Section(header: Text("Linkedin")) {
                if let linkedin = viewModel.personal?.linkedin, !linkedin.isEmpty {
                    Button {
                        if let url = URL(string: linkedin) { openURL(url) }
                    } label: {
                        HStack {
                            Image(systemName: "person.crop.circle.badge.checkmark")
                                .foregroundStyle(AppColors.primaryBlue)
                            Text(linkedin)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        }
                    }
                }
            }

            Section(header: Text("Github")) {
                if let github = viewModel.personal?.github, !github.isEmpty {
                    Button {
                        if let url = URL(string: github) { openURL(url) }
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left.slash.chevron.right")
                                .foregroundStyle(AppColors.primaryBlue)
                            Text(github)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        }
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    NavigationStack {
        PersonalView(viewModel: PersonalViewModel())
    }
}
