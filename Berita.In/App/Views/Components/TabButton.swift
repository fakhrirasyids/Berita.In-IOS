//
//  TabButton.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 16/12/24.
//

import SwiftUI

struct TabButton: View {
    let tab: Tab
    @Binding var selectedTab: Tab

    var body: some View {
        Button {
            withAnimation {
                selectedTab = tab
            }
        } label: {
            ZStack {
                Image(systemName: tab.icon)
                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                    .foregroundColor(isSelected ? .red : .gray)
                    .scaleEffect(isSelected ? 1 : 0.8)
            }
        }
        .buttonStyle(.plain)
    }

    private var isSelected: Bool {
        selectedTab == tab
    }
}
