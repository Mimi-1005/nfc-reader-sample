//
//  UserData.swift
//  nfc-reader-sample
//
//  Created by takumi mito on 2020/12/05.
//

import Foundation
import TRETJapanNFCReader

final class UserData: NSObject, ObservableObject, FeliCaReaderSessionDelegate {
    @Published var balance: Int? = nil
    var reader: TransitICReader!

    override init() {
        super.init()
        self.reader = TransitICReader(delegate: self)
        self.reader.get(itemTypes: [.balance])
    }

    func feliCaReaderSession(didRead feliCaCard: FeliCaCard) {
        let transitICCard = feliCaCard as! TransitICCard
        DispatchQueue.main.async {
            self.balance = transitICCard.data.balance! // カード残高
        }
    }

    // ライブラリを使う上で、FelicaReaderSessionDelegate の要求する型に合わせる為、記述しております。
    func japanNFCReaderSession(didInvalidateWithError error: Error) {
    }
}
