//
//  ContentView.swift
//  nfc-reader-sample
//
//  Created by takumi mito on 2020/12/05.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        VStack {
            Text("FeliCa の残高")
            if (self.userData.balance != nil) {
                Text("¥\(String(self.userData.balance!))")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        userData.balance = 1500 // プレビュー用残高
        return ContentView().environmentObject(userData)
    }
}
