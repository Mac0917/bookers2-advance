# README

## 概要
私がrailsで初めて作ったアプリケーションです。本の感想を言い合えるSNSアプリです。<br>

## バージョン
ruby・・・2.5.7
rails・・・5.2.4.4
nginx・・・1.19.3
mysql・・・5.7

## ローカル環境での実行手順
dockerを自分のpcにインストール
docker-compose をインストール

好きなディレクトリで<br>
`git clone https://github.com/Mac0917/bookers2-advance.git`

移動<br>
`cd bookers2-advance`

docker-composeを実行<br>
`docker-compose up -d`

bundle installを実行<br>
`docker-compose run app bundle install`

データベース作成<br>
`docker exec -it bookers2-advance_app_1 bash`
`rails db:create`
`rails db:migrate`

アクセス<br>
http://localhost/



