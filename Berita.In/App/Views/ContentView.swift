//
//  ContentView.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 22/12/24.
//

import SwiftUI

let backgroundColor = Color.init(white: 0.94)

struct ContentView: View {
    @State var selectedTab: Tab = .home

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    switch selectedTab {
                    case .home:
                        HomeView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .search:
                        SearchView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .favorites:
                        FavoritesView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .aboutme:
                        AboutMeView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }

                VStack {
                    Spacer()

                    HStack {
                        Spacer(minLength: 0)

                        ForEach(Tab.allCases) { tab in
                            TabButton(tab: tab, selectedTab: $selectedTab)
                                .frame(width: 65, height: 65, alignment: .center)

                            Spacer(minLength: 0)
                        }
                    }
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.4), radius: 20, x: 0, y: 20))
                    .padding(.horizontal, 56)
                    .padding(.bottom, 16)
                }
            }
        }
    }
}

enum Tab: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    case home, search, favorites, aboutme

    internal var id: Int { rawValue }

    var icon: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .favorites:
            return "heart"
        case .aboutme:
            return "person.circle"
        }
    }

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .favorites:
            return "Favorites"
        case .aboutme:
            return "About Me"
        }
    }
}

#Preview {
    ContentView()
}
