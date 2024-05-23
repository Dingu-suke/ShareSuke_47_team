#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
yarn install
yarn build # jsファイルをesbuildでバンドルしている
yarn build:css
bundle exec rails db:migrate
bundle exec ridgepole -c config/database.yml -E production --apply -f db/schemas/Schemafile
# ridgepole ツールを使用して、Schemafile に記述されたデータベーススキーマ定義をデータベースに適用
# -c config/database.yml はデータベースの設定ファイルを指定し、-E production はプロダクション環境を対象とすることを明示 => DBスキーマが最新の状態に保、デプロイ時にスキーマの変更が反映される
