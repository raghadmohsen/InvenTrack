//
//  AppRouter.swift
//  InvenTrack
//
//  Created by Raghad on 02/09/2025.
//

import SwiftUI

enum AppRoute: Hashable {
    case dashboard
    case stockList(StockStatus)
}

enum SheetRoute: Identifiable {
        case newItemview
        case editItemview(DataItem)

        var id: String {
            switch self {
            case .newItemview: return "newItem"
            case .editItemview(let item): return "edit_\(item.id)"
            }
        }
    }


@MainActor
final class Router: ObservableObject {
    @Published var path = NavigationPath()
    func go(_ route: AppRoute) { path.append(route) }
    func back() { if !path.isEmpty { path.removeLast() } }
    func reset() {path = NavigationPath()}
    func replace(with route: AppRoute) {
        path = NavigationPath()
        path.append(route)
    }
}

struct ContentView: View {
    @EnvironmentObject private var router: Router
    @State private var sheet: SheetRoute?
    
    var body: some View {
        NavigationStack(path: $router.path) {
            DashboardView(onAddItem: { sheet = .newItemview },
                          onEditItem: { item in sheet = .editItemview(item) })
            
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .dashboard:
                    DashboardView(onAddItem: { sheet = .newItemview },
                                  onEditItem: { item in sheet = .editItemview(item) })
                case .stockList(let status):
                    StockListView(filterStatus: status)
                }
            }
            
            .sheet(item: $sheet) { route in
                switch route {
                case .newItemview:
                    NewItemView()
                        .navigationTitle("New Item")
                        .navigationBarTitleDisplayMode(.large)
                case .editItemview(let item):
                    UpdateItem(editdata: item)
                        .navigationTitle("Edit Item")
                        .navigationBarTitleDisplayMode(.large)
                }
            }
        }
    }
}


