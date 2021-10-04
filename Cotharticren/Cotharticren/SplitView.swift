import Foundation
import SwiftUI
import CoreData
import Combine
import PDFKit

struct LabTable: Identifiable, Hashable {
    let id = UUID()
    let date: Date
    let subject: String
    let body: String
    var isFavorited = false
}

final class LabTableShelf: ObservableObject {
    @Published var allLabTables: [String: [LabTable]] = [
        "Inbox": [ .init(date: Date(), subject: "Subject1", body: "Very long body...") ],
        "Sent": [ .init(date: Date(), subject: "Subject2", body: "Very long body...") ],
    ]
}

struct Sidebar: View {
    @ObservedObject var store: LabTableShelf
    @Binding var selectedFolder: String?
    @Binding var selectedLabTable: LabTable?

    var body: some View {
        List {
            ForEach(Array(store.allLabTables.keys), id: \.self) { folder in
                NavigationLink(
                    destination: FolderView(
                        title: folder,
                        labtables: store.allLabTables[folder, default: []],
                        selectedLabTable: $selectedLabTable
                    ),
                    tag: folder,
                    selection: $selectedFolder
                ) {
                    Text(folder).font(.headline)
                }
            }
        }.listStyle(SidebarListStyle())
    }
}

struct FolderView: View {
    let title: String
    let labtables: [LabTable]
    @Binding var selectedLabTable: LabTable?

    var body: some View {
        List {
            ForEach(labtables) { labtable in
                NavigationLink(
                    destination: LabTableView(labtable: labtable),
                    tag: labtable,
                    selection: $selectedLabTable
                ) {
                    VStack(alignment: .leading) {
                        Text(labtable.subject)
                        Text(labtable.date, style: .date)
                    }
                }
            }
        }.navigationTitle(title)
    }
}

struct Lab: View {
    let labtable: LabTable

    var body: some View {
        VStack(alignment: .leading) {
            Text(labtable.subject)
                .font(.headline)
            Text(labtable.date, style: .date)
            Text(labtable.body)
        }
    }
}

