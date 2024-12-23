//
//  AboutMeView.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 16/12/24.
//

import SwiftUI
import Common

struct AboutMeView: View {
    var body: some View {
        VStack {
            Image(.fakhrirasyids)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)

            Text("Fakhri Rasyid Saputro")
                .font(.title)
                .padding(.top, 20)

            Text("fakhrirasyids@gmail.com")
                .font(.body)
                .padding(.top, 10)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    AboutMeView()
}
