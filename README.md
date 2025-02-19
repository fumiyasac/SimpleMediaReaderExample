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

