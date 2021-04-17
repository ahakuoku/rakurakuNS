**こちらはbat版らくらくNSのページです。python版らくらくNS（開発中）のページは[こちら](https://github.com/ahakuoku/rakurakuNS-python/blob/main/readme.md)。**

# らくらくNSとは？
SimutransのNSを管理するツールです。
- サーバーがクラッシュした場合に自動で再起動、それに付帯して必要な動作もすべて自動で行います。(一部要nettool)
- 一定の間隔でオートセーブを行います。(要nettool)オートセーブしたファイルはautosaveフォルダに100個まで保存されます。

といった機能があります。

# 導入方法
1. らくらくNSをダウンロードする  
1. zipを解凍し、サーバーの実行ファイルが入っている所と同じディレクトリにbatとmoduleフォルダを入れる
# ダウンロード
ダウンロードはこちらから行えます。**(2021年4月17日　v1.3.2に更新)**  
https://github.com/ahakuoku/rakurakuNS/releases  
1.0.1以前のバージョンはこちら  
https://drive.google.com/drive/folders/1evLJx78f47vGNYuJIuvNgkNfmpygWu_A

# 動作しない場合
らくらくNSが正常に動作しない場合は、セキュリティソフトなどの影響がある場合があります。次の事項をご確認ください。
1. らくらくNSのすべてのファイルのプロパティより下部のこのファイルは～の右にある許可するにチェックを入れる(ない場合はすでに入っています)
1. セキュリティソフトの設定を確認する
# 更新方法
## アップデート元とアップデート先の双方がVersion 1.3.0以降の場合
1. らくらくNSの新バージョンをダウンロードする  
1. zipを解凍し、moduleフォルダを上書きする  
なお、特記のある場合はその指示に従ってください。
## 上記にあてはまらない場合
1. らくらくNSの新バージョンをダウンロードする  
1. らくらくNSを起動している場合は、一旦終了する(サーバーを閉じる必要はありません)  
1. らくらくNS関係のすべてのファイルを上書きする
# 使用条件
著作権は作者であるahakuokuが保有しています。  
改造・再配布(未改造・改造問わず)は自由にしていただいても結構です。(報告は任意)  
ただし、再配布をする場合はどこかに必ず原作者であるahakuokuの名を入れてください。  
改造はノンサポート、自己責任です。改造したことによる損害は一切責任を負いません。 このbatの営利目的での使用はご遠慮ください。

# 内容
autoclose.bat … 自動でセーブしたうえでサーバーを終了します。  
autosave.bat  … 一定の間隔で自動でセーブします。  
autostart.bat … サーバーがクラッシュした場合などに自動で再起動などをします。  
setting.bat   … 設定ファイルです。使用する前にここを弄ってください。

# 使用方法

## setting.bat
各種動作を設定するファイルです。使用する前にこちらを編集してください。具体的な使用方法は下にあります。
### Version 1.3.0以降
1.3.0以降使用している新しい設定ファイルです。1.2.0以前では使用できません。
- use_nettool … nettoolを使用するかどうかを設定します。1の場合に使用します。
- nettool_password … nettoolのパスワードを設定します。usingnettoolが0の場合は使用しません。
- launch_file … サーバーがクラッシュした際に起動するファイルを設定します。-server オプションをつけたショートカットを起動するなどに使用できます。
- server_save … オートセーブでのセーブ先データー(server13353-network.sveなど)を指定します。
- load_save … サーバーで読み込まれるセーブデーターを指定します。
- check_exe … サーバーのファイル名を指定します。サーバーが動いているかのチェックに使用します。
- server_address … サーバーのIPアドレスを指定します。
- topmost_company_password … デフォルト会社のパスワードを指定します。usingnettoolが0の場合は使用しません。
- autosave_interval … オートセーブの間隔を秒で指定します。usingnettoolが0の場合は使用しません。60未満にはできません。
- conflict_error_avoidanc … 自動再起動の後にスペースキーを自動で押すかどうかを指定します。pak重複警告の回避に使用できます。1の場合に有効になります。
- ban_address_1 … BANするIPアドレスを指定します。
- ban_address_2 … 同上
- ban_address_3 … 同上
- ban_address_4 … 同上
- ban_address_5 … 同上
- world_monitor_link … Simutrans world monitorとの連携機能(後述)を使用するかどうか設定します。1の場合に使用します。

### Version 1.2.0以前
1.3.0以前の古い設定ファイルです。1.3.0以降でも引き続き使用できますが、1.3.0以降で使用できる設定と同等の設定があった場合は新しい識別子の方が優先されます。
- usingnettool	 … nettoolを使用するかどうかを設定します。1の場合に使用します。
- nettoolpass	 … nettoolのパスワードを設定します。usingnettoolが0の場合は使用しません。
- startfile	 … サーバーがクラッシュした際に起動するファイルを設定します。-server オプションをつけたショートカットを起動するなどに使用できます。
- serversave	 … オートセーブでのセーブ先データー(server13353-network.sveなど)を指定します。
- autosave	 … サーバーで読み込まれるセーブデーターを指定します。
- exename		 … サーバーのファイル名を指定します。サーバーが動いているかのチェックに使用します。
- serverip	 … サーバーのIPアドレスを指定します。
- 0companypass	 … デフォルト会社のパスワードを指定します。usingnettoolが0の場合は使用しません。
- autosaveinterval … オートセーブの間隔を秒で指定します。usingnettoolが0の場合は使用しません。60未満にはできません。
- pressspacekey	 … 自動再起動の後にスペースキーを自動で押すかどうかを指定します。pak重複警告の回避に使用できます。1の場合に有効になります。
- ban-ip1		 … BANするIPアドレスを指定します。
- ban-ip2		 … 同上
- ban-ip3		 … 同上
- ban-ip4		 … 同上
- ban-ip5		 … 同上

## autostart.bat
サーバーがクラッシュした場合に、自動再起動などの必要な動作を自動で行います。  
具体的には、pak重複警告を回避するためのスペースキー自動押下、自動での操作禁止会社へのパスワード設定、クラッシュによりリセットされたBANリストの再設定を行います。(デフォルトではいずれも無効です)

## autosave.bat
一定の間隔でオートセーブを行います。オートセーブ30秒前に予告メッセージを流します。オートセーブ前のデーターは100までautosaveフォルダにバックアップされます。動作にはnettoolが必要です。

## autoclose.bat
自動的にサーバーを安全な状態で停止します。サーバー停止の前にautostart.batを終了させてください。動作にはnettoolが必要です。

## serverupdate.bat
サーバーの本体をアップデートします。古い本体はserver_old.exeとしてバックアップされます。

# Simutrans world monitorとの連携機能
Version 1.3.0以降では[Simutrans world monitor](https://github.com/teamhimeh/simutrans_world_monitor)との連携機能が使用できます。連携機能を使用する事により
- サーバーがクラッシュしたこと、復旧したことをDiscordで通知できる
- オートセーブの予告をDiscordで自動的に行える  
以上の機能が使用できるようになります。使用するには設定の`world_monitor_link`を1にする必要があります。

# 謝辞
- module/worktime.batはhttps://qiita.com/koryuohproject/items/815a1621bc34a223e4b9 のものを使用させていただきました。

ありがとうございます。

# 更新履歴
- 現在の最新バージョンは、version 1.3.2です。

## Version 1.3.2(2021/04/17)
- セーブデータのバックアップ機能が動作しない問題を修正しました。

## Version 1.3.1(2021/03/31)
- serverupdate.batでのサーバーのバージョンアップができない問題を修正しました。

## Version 1.3.0(2021/03/29)
- [Simutrans world monitor](https://github.com/teamhimeh/simutrans_world_monitor) との連携機能を追加しました。使用するには設定ファイルに追加された`world_monitor_link`を1にする必要があります。
- allstart.batを追加しました。autostart.batとautosave.batを同時起動できます。
- らくらくNSのアップデート時、アップデート元とアップデート先の双方がこのバージョン以降であれば原則らくらくNSの再起動を不要にしました。
- setting.batの設定識別子を変更しました。なお、1.2.0までの設定ファイルも引き続き使用できます。くわしくはreadmeをご覧ください。
- 続行可否を選択する入力時の表示文章を実際に入力する文字と合わせました。

## version 1.2.0(2020/11/19)
- 本体自動置き換え機能を追加しました。serverupdate.batを起動して画面の指示に従ってください。古い本体はserver_old.exeとしてバックアップされます。

## version 1.1.0(2020/11/15)
- オートセーブをするたびにオートセーブの時刻がずれていく現象の軽減をしました。
- module/worktime.batはhttps://qiita.com/koryuohproject/items/815a1621bc34a223e4b9 のコードを引用しました。

## version 1.0.1(2020/11/13)
- autosaveフォルダにコピーするファイルが誤っていた問題を修正しました。

## version 1.0.0(2020/10/16)
- 初の正式版です。