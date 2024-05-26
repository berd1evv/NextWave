//
//  MainView.swift
//  NextWave
//
//  Created by Eldiiar on 20/5/24.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    var body: some View {
        Text("Hello, Worlddd!")
        
        Button {
            do {
                try Auth.auth().signOut()
                Storage.shared.setActive(false)
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        } label: {
            Text("Log out")
        }

    }
}

#Preview {
    MainView()
}
