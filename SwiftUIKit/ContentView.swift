//
//  ContentView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 15/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("First row")
            Text("Second row")
            NotificationView(type: .info, title: testNotificationsError.title, message: testNotificationsError.message, standalone: false)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
