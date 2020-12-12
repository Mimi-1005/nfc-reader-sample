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
            Text("スキャン結果")
            if (self.userData.userName != nil) {
                Text(self.userData.userName! + " : " + self.userData.scanDate!)
            } else if(self.userData.primaryIDm != nil) {
                Text("データが見つかりませんでした。")
                Text("このカードのprimaryIDmは、「" + self.userData.primaryIDm! + "」です。")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        userData.userName = "test"
        return ContentView().environmentObject(userData)
    }
}
