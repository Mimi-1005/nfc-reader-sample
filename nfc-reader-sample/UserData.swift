//
//  UserData.swift
//  nfc-reader-sample
//
//  Created by takumi mito on 2020/12/05.
//

import Foundation
import TRETJapanNFCReader

final class UserData: NSObject, ObservableObject, FeliCaReaderSessionDelegate {
    @Published var userName: String? = nil
    @Published var scanDate: String? = nil
    @Published var primaryIDm: String? = nil
    var reader: TransitICReader!
    /*
     サンプルのためデータをソースコードに記載しています。
     製品向けには適切にデータを管理してください。
     */
    let nameList = [
        [
            "primaryIDm": "test",
            "employeeName": "test user"
        ]
    ]

    override init() {
        super.init()
        self.reader = TransitICReader(delegate: self)
        self.reader.get(itemTypes: [.balance])
    }

    func feliCaReaderSession(didRead feliCaCard: FeliCaCard) {
        let transitICCard = feliCaCard as! TransitICCard
        print(transitICCard)
        DispatchQueue.main.async {
            self.primaryIDm = transitICCard.data.primaryIDm // ID
            self.nameList.forEach {
                if $0["primaryIDm"] == self.primaryIDm {
                    self.userName = $0["employeeName"]
                }
            }
            
            // Dateのフォーマット準備
            let format = DateFormatter()
            format.timeStyle = .medium
            format.dateStyle = .full
            format.locale = Locale(identifier: "ja_JP")
            
            self.scanDate =  format.string(from: Date())
            // transitICCardの中身確認
//            NSLog("********")
//            NSLog(String.init(data: transitICCard.data.toJSONData()!, encoding: .utf8)!)
//            NSLog("********")
        }
    }

    // ライブラリを使う上で、FelicaReaderSessionDelegate の要求する型に合わせる為、記述しております。
    func japanNFCReaderSession(didInvalidateWithError error: Error) {
    }
}
