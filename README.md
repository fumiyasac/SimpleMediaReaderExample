# SimpleMediaReaderExample

[ING] - 簡易的メディア型一覧表示サンプル

## 1. サンプル概要

## 2. Mockサーバー環境構築

### DB起動手順

こちらは、Dockerがインストールされている前提でのコマンド手順です。

```bash
# ① Dockerを起動する
$ docker-compose up -d

# ② Dockerコンテナへアクセスをする
$ docker exec -it [①で表示されたコンテナ名] bash

# ③ Dockerコンテナ内のMySQLアクセスをする
# ※ rootパスワード = .envで設定したパスワード
$ mysql -h localhost -P 3306 -u root -p
Enter password: 

# ④ MySQL内でDBが作成されているか確認する
# ※ DB = .envで設定したDB名
$ SHOW DATABASES;

# ⑤ もし存在していなければ新たにDBを作成する
$ CREATE DATABASE [.envで設定したDB名];
```

### Prismaのセットアップ手順

このリポジトリをクローンする際は下記コマンドを実行します。

```bash
# ① Dockerを起動する
$ npm install
```

Prismaのセットアップ時については、以下のコマンドを実行しています。

```bash
# ① package.jsonを新規作成する
$ npm init -y

# ② Typescriptのインストール
$ npm install typescript ts-node @types/node --save-dev

# ③ Prismaのインストール
$ npm install prisma --save-dev

# ④ Prismaの初期化処理を実施する
# ※ datasource-providerオプションにはMySQLを指定する
$ npx prisma init --datasource-provider mysql
```

__【参考資料】__

- [ExpressとPrismaでAPIを作ってみた](https://logical-studio.com/develop/backend/20240524-express-prisma-api/)
- [【NodeJS】PrismaやTypeScriptを使ってデータを操作する](https://isub.co.jp/nodejs/getting-started-with-prisma/)
- [Node.js(Express.js)環境でPrisma ORMを使いこなすための基礎](https://reffect.co.jp/node-js/prisma-basic)
