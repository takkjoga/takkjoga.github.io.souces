---
title: middleman server のオプション
date: 2015-12-19 20:59 +0900
tags: Middleman
---

```middleman help server``` としても

```
Usage:
  middleman server [options]
```
としか出ないし、
ググッてもなかなか見つからないので、自分でソースコードを見てみることにしました。
　
※ソースコードを深く追えていないので、起動時にオプションを指定して確認できたものは説明を記載しています。
　
確認した Middleman の情報は以下です。

* version: 3.4.0
* ファイルパス: middleman-core-3.4.0/lib/middleman-core/cli/server.rb

## --environment または -e
* 説明: The environment Middleman will run under
* デフォルト値: 'development'

## --port または -p
* 説明: The port Middleman will listen on
* デフォルト値: 書いてないけど、多分 4567
* 待機ポート番号を指定できます。

## --server_name または -s
* 説明: The server name name Middleman will use

## --bind_address または -b
* 説明: The bind address Middleman will listen on

## --https
* 説明: Serve the preview server over SSL/TLS

## --ssl_certificate
* 説明: Path to an X.509 certificate to use for the preview server

## --ssl_private_key
* 説明: Path to an RSA private key for the preview server's certificate

## --verbose
* 説明: Print debug messages
* サーバーを起動すると、詳細なデバッグメッセージが出力されます。

## --instrument
* 説明: Print instrument messages

## --disable_watcher
* 説明: Disable the file change and delete watcher process
* ファイルを保存したり、ファイルを削除したときに自動でサーバーを再読み込みする処理を無効にします。

## --profile
* 説明: Generate profiling report for server startup
* このオプションを使用するためには、Gemfile に ```gem 'ruby-prof' と記述して、install する必要があります。
* このオプションを指定してサーバーを起動すると、MiddlemanRoot 以下に ```profile/server_start.html``` というファイルを生成します。
* ruby-profの説明は [ここ](https://kaihar4.com/2015/04/12/ruby-prof.html) に説明が詳しく載っていますが、サーバープロセスをプロファイルした結果がHTMLファイルとして出力されるようです。

## --reload_paths
* 説明: Additional paths to auto-reload when files change
* MiddlemanRoot 以外のディレクトリ以下でファイルが更新や削除されたのを検知して再読み込みをする。のかなと思って試してみたけど、MiddlemanRootより上の階層のディレクトリを指定してもファイルを指定しても、自動では再読み込みされませんでした。。

## --force_polling
* 説明: Force file watcher into polling mode

## --latency または -l
* 説明: Set file watcher latency, in seconds
* デフォルト値: 0.25
* ファイル更新検知の間隔を秒で指定します。


以上 14 個のオプションがあるようです。
https オプションや、ssl_* オプションがあるので、ローカルのプレビューサーバー以外でも、
ホスティングされたサーバー上での利用も考えられているのかもしれません。

