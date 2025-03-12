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
$ show databases;

# ⑤ もし存在していなければ新たにDBを作成する
$ create database [.envで設定したDB名];

# ⑥ PrismaでSchema更新処理後に作成されたテーブルを確認する
$ show tables from media_reader_example;
```

### Prismaのセットアップ手順

このリポジトリをクローンする際は下記コマンドを実行します。

```bash
# ① 必要なパッケージをインストールする
$ cd Backend
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

# ⑤ 作成されたschema.prismaを編集し、下記コマンドを実行してMigrationの実行をする
# ※ 今回は一番最初のMigrationとして、データベースの初期化を行うため、名前を「init」にしている。
$ npx prisma migrate dev --name [任意の名前]

# ⑥ GUIでレコードを編集可能なツールを立ち上げる
# （DockerでMySQLが起動している事が前提）Port番号のデフォルトで5555となります。
$ npx prisma studio
```

### Mockサーバー起動

```bash
# ① サーバーを起動する
$ cd Backend
$ npm run start
```

__【参考資料】__

- [Prisma公式Document](https://www.prisma.io/express)
- [ExpressとPrismaでAPIを作ってみた](https://logical-studio.com/develop/backend/20240524-express-prisma-api/)
- [【NodeJS】PrismaやTypeScriptを使ってデータを操作する](https://isub.co.jp/nodejs/getting-started-with-prisma/)
- [Node.js(Express.js)環境でPrisma ORMを使いこなすための基礎](https://reffect.co.jp/node-js/prisma-basic)
