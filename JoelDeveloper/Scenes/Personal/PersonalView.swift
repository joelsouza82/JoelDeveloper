//
//  PersonalView.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//

import SwiftUI

struct PersonalView: View {
    @ObservedObject var viewModel: PersonalViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.address)
                .font(.body)
            Spacer()
        }
        .padding()
        .navigationTitle("Dados pessoais")
    }
}

#Preview {
    PersonalView(viewModel: PersonalViewModel())
}
