#  NFC Reader Sample

## 概要

NFCで勤怠打刻的な事をするための技術検証を行います。

*　FeliCaのIDmを読み取り
*　ユーザ名を検索して日時と共に表示
    *　ユーザ名がない場合、IDmを表示

## 参考

FeliCaを利用したいので、ライブラリは[TRETJapanNFCReader](https://github.com/treastrain/TRETJapanNFCReader)を利用させてもらっています。

読み取りコードは、Qiita記事の[30分で爆速開発 交通系ICリーダー‬ 【iOS, SwiftUI】](https://qiita.com/Kewa4/items/2eafd03e83ae6d1afa80)を利用・改変させてもらっています。

DateFormatは、Qiita記事の[【Swift】Dateの王道 【日付】](https://qiita.com/rinov/items/bff12e9ea1251e895306)を利用させてもらっています。
