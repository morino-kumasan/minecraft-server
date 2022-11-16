# minecraft-server

## サーバーの起動

```
docker-compose up -d
```

## サーバーの停止

```
docker-compose stop
```

## 設定ファイル

.env

```
WORLD_NAME=[ワールド名]
LISTEN_PORT=[サーバーのポート]
HEAP_INIT=[javaの初期ヒープサイズ]
HEAP_MAX=[javaの最大ヒープサイズ]
```

## ワールドデータ

worlds/[ワールド名]

プラグインは下に入れる
worlds/[ワールド名]/plugins
