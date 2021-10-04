//
//  SideBarView.swift
//  Cotharticren
//
//  Created by Justin Venable on 8/8/21.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

func toggleSidebar() { NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)}



struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}

