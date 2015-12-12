---
title: middlemanとGitHub Pagesでブログを5分で開設！ほか盛りだくさん！
date: 2015-12-07 12:00 +0900
tags: middleman, GitHub Pages
---

![スクリーンショット 2015-12-03 10.12.07.png](https://qiita-image-store.s3.amazonaws.com/0/32480/cbe49151-d0bc-adad-6e62-aefe40039e79.png "スクリーンショット 2015-12-03 10.12.07.png")


これは [【その2】ドリコム Advent Calendar 2015](http://www.adventar.org/calendars/1044) の7日目の記事です。
　
6日目の記事は、tanaka0000さんの「[UnityのiOSビルドをJenkinsに任せて、ついでにCrashlytics beta配信して結果をChatWorkに知らせる](http://tanaka0000.hatenablog.com/entry/2015/12/06/133246)」です。
　
[【その1】ドリコム Advent Calendar 2015](http://www.adventar.org/calendars/1043) はこちらです。
　
個人的には、[この](http://kakaricho.hatenadiary.jp/entry/2015/12/05/172344)記事がオススメです。熱くて愛のある❤️いい記事です。


# 自己紹介
ドリコムに入ってから Ruby を始めたエンジニアです。
社内ではディレクター職でもないのに「デラD」と呼ばれる、困惑おじさんです。  


# Advent Calendar のために、自分専用のブログを作ろう！
と思い立った方は、是非見て行ってくださいね😊
　
そんな自分も、今年の Advent Calendar をどこで書こうか悩んだので、以前から興味のあった [middleman](https://middlemanapp.com) を使ってみようと思い、これを機にちょっとまとめてみました。

　
　


手元の環境は、以下です。  

* Mac OSX 10.10.5 Yosemite
* ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]
* Bundler version 1.10.6



GitHub のアカウントが無い場合は、早速作っておきましょう。 
 
アカウントが作れたら、[ここ](https://help.github.com/articles/generating-ssh-keys/)を参考に SSH 鍵の登録をしておきましょう。  
　
今回は View テンプレートに [Drops](https://github.com/5t111111/middleman-blog-drops-template) を使ってみます。
View テンプレートのインストール方法は、他のテンプレートでも同様です。

## 最初に ```Drops``` のインストール
ホームディレクトリに ```.middleman``` ディレクトリを作って、その中にインストールしておきます。

```
cd ~/
mkdir .middleman
git clone https://github.com/5t111111/middleman-blog-drops-template.git ~/middleman/blog-drops
```

次に blog 関連のファイルを置くディレクトリを決めて、以下のコマンドで blog プロジェクトを作成 ＆ 初期化します。

```
cd ~/
middleman init my_blog_project --template=blog-drops --skip-bundle
cd my_blog_project
bundle install --path vendor/bundle
```

Drops では以下も実行します。

```
npm install
```

# GitHub Pages
公開するホストには [GitHub Pages](https://pages.github.com) を選択しました。

## まずはリポジトリの作成
GitHub の[新規リポジトリ作成ページ](https://github.com/new) の ```Repository name``` に

```
{username}.github.io
```
 の ```{username}``` に自分のGitHubアカウントの名前を入力します。
 自分の場合は、アカウント名を [takkjoga](https://github.com/takkjoga) にしているので、
 
```
takkjoga.github.io
```
 になります。
 

## リモートリポジトリ
自分の使いやすい git クライアントで、さっき作ったリポジトリを登録します。
自分はターミナルを使用するのが慣れているので、以下のようになります。

```
cd ~/my_blog_project
git init
git remote add origin git@github.com:takkjoga/takkjoga.github.io.git
```

# 早速公開！
何も考えず、以下のコマンドでデフォルトの状態を公開しちゃいます。

```
bundle exec middleman build
bundle exec middleman deploy
```

デプロイが終わったら、```{username}.github.io``` に早速アクセスしてみましょう。

![スクリーンショット 2015-12-03 10.46.46.png](https://qiita-image-store.s3.amazonaws.com/0/32480/ed259585-f1dd-6857-6dc8-7de72972c9c5.png "スクリーンショット 2015-12-03 10.46.46.png")

できたぁっ！！
簡単だなぁ。。



# 記事を書こう
記事を書くためのコマンドが用意されています。
タイトルに空白が含まれる場合は、ダブルクォーテーションが必要です。

```
bundle exec middleman article "middlemanとGitHub Pagesでブログを5分で開設！ほか盛りだくさん！"
```

以下のように、```source/posts/2015-12-07-middlemanとGitHub Pagesでブログを5分で開設！ほか盛りだくさん！.html.md``` というファイルが生成されます。

```
== Blog Sources: posts/{year}-{month}-{day}-{title}.html (:prefix + :sources)
== LiveReload accepting connections from ws://192.168.xxx.xxx:xxxxx
      create  source/posts/2015-12-07-middlemanとGitHub Pagesでブログを5分で開設！ほか盛りだくさん！.html.md
```

このファイルに、マークダウンで記事を書いていきます。
ファイルの上部にある YAML front matter形式 の ```tags:``` には、記事のタグをカンマ区切りで登録しておきます。

```markdown
<!--
source/posts/2015-12-07-middlemanとgithub-pagesでブログを5分で開設!ほか盛りだくさん!.html.md
-->
---
title: middlemanとGitHub Pagesでブログを5分で開設！ほか盛りだくさん！
date: 2015-12-07 12:00 +0900
tags: middleman, GitHub Pages
---

```

## 記事の確認
middleman には Live Reload という機能があって、middleman サーバーをローカルで立ててブラウザでページを開いておくと、記事ファイルを保存したと同時にサーバーの自動更新とページのリロードを自動でやってくれます。

まずはローカルでサーバーを立てます。

```
bundle exec middleman server
```

次に、 http://localhost:4567/ をブラウザで開きます。

何か文章を書いて、保存してみましょう。
勝手にブラウザが更新されて、書いた内容が反映されていると思います。


## 日本語タイトルがビルドできない。。
記事を書き終えて、ビルドしようとしたときに、
ここまでの設定だと、以下のエラーがでると思います。

```
error  build/feed.xml
```

これは、日本語の含まれたタイトルをURIとして feex.xml として出力しようとしたときに、ascii 文字列だけにしてね💢と怒られているようです。

自分が選んだ解決方法は、記事のURIを ```tags:``` に設定したものを利用することです。

```config.rb``` を以下のように修正しました。

```ruby
#config.rb
activate :blog do |blog|
  blog.permalink = '{year}/{month}/{day}/{tags}.html'
  #                                      ^^^^^^
end
```

こうすることによって、出力される記事のURIが

```
/2015/12/07/middleman-github-pages/
```
と出力されて、URIとしても何が書いてあるかわかりやすくていいと思います。
ただし、```tags:``` に日本語が登録できなくなりますが。。💦


## できましたか？
5分では終わらなかったかもしれませんが、結構簡単にブログサイトを作れてしまったのではないかなと思います。
　
以下で、このブログをさらにカスタマイズしていきたいと思います。
お時間のある方はのんびり眺めていってください。



# せっかくだし自分のドメインで公開したい
自分用のサーバーにあてているドメインを持っている人なら、ブログにもそのドメインを使いたい人は少なくないと思います。
GitHub Pagesにはカスタムドメイン設定ができる仕組みがあるようです。
[ここ](https://help.github.com/articles/adding-a-cname-file-to-your-repository/)に説明が書いてありますが、middleman の場合ちょっと手順が変わるので説明します。

## CNAMEファイルをコミット
GitHubの説明ページでは、ルートディレクトリに直接 ```CNAME``` ファイルを配置してありますが、
middleman を使って公開する場合は、```source/``` ディレクトリ以下のファイルがビルドされて配置されます。

というわけで、```source/CNAME``` にファイルを作成して、そのファイルに設定したいドメインを記述します。
自分は ```takumi-onodera.work``` というドメインを持っているので、以下のように記述しました。

```
#source/CNAME
blog.takumi-onodera.work
```

ファイルの編集が終わったらデプロイしておきます。

```
bundle exec middleman deploy
```

## DNSの設定
ドメインを管理しているサービスのDNSレコード管理ページなどで、```CNAME``` を設定します。
```CNAME```のvalueには、```{username}.github.io``` を設定します。
設定が完了したら、DNSの浸透を待つのみ。


# ブログのタイトルなどの設定
middleman で設定を司っているのは、```config.rb``` というファイルです。

Dropsテンプレートでは、[紹介ページ](http://qiita.com/5t111111/items/5e79a169b3162e2eab4c#ブログの構成)があるので、参照しながら以下のような設定にしました。

```ruby
#config.rb
Time.zone = 'Tokyo'

set :site_url, 'http://blog.takumi-onodera.work'
set :site_title, 'いくら寝ても眠たい'
set :site_description, 'いくら寝ても眠たい人のブログ。プログラミングやたまにインフラ、あまり有名ではないミュージシャンのことについてダラダラ書いていきます。'
set :site_author, 'takkjoga'
set :site_author_profile, '株式会社ドリコムでRubyエンジニアをしております。変な音楽が大好きです。'
set :site_author_image, 'profile.png'
set :reverse_title, true
set :social_links,
    twitter: 'https://twitter.com/takkjoga',
    github: 'https://github.com/takkjoga'

```


# 404ページを設定する
存在しない URL にアクセスされたときに表示されるページを設定します。
これにはちょっとファイルをいじる必要があります。
[ここ](https://help.github.com/articles/custom-404-pages/) に説明がありますが、ドキュメントルートに ```404.html``` というファイルが存在すれば、そのファイルが 404 ページとして表示されるようになります。
　
今回は Drops を使用しているので、あらかじめ用意されている 404 ページをちょっと修正します。
```source/404.html.slim``` のファイルの一番上に、[YAML front matter](http://jekyllrb.com/docs/frontmatter/)形式で ```directory_index: false``` を追記します。
デフォルトでは ```directory_index: true``` になっていますが、これだと ```/404``` という URL になってしまい、GitHub Pages では正しく表示してくれません。

```ruby
#source/404.html.slim
---
directory_index: false
---

h1
  | 404
h3
  | Page not found
```

あとは、ビルドアンドデプロイ。

```
bundle exec middleman build
bundle exec middleman deploy
```

デプロイが完了したら、ドメインに適当なパスを入力して確認してみましょう。



# favicon
いざ設定しようと思って調べてみると、様々なデバイス向けに用意しなければならないことに愕然としてしまいます。
　
[こちら](http://www.webcreatorbox.com/tech/favicon/) のサイトでも触れられているように、画像をアップロードするだけで favicon と様々なデバイス向けのタグを生成くれるサービスがあるようです。

自分も早速 [Real Favicon Generator](http://realfavicongenerator.net) を使って作ってみました。

各デバイス用にリサイズされた画像群と HTML のコードが出力されます。
　
Drops テンプレートを使用すると、HTML テンプレートエンジンが自動的に [slim](https://github.com/slim-template/slim) になるので、[ここ](https://html2slim.herokuapp.com) で出力された HTML を slim に変換しましょう。
　
さらに、現状だと favicon だらけのドキュメントルートになってしまってうげーなので、ダウンロードした ```favicons/``` ディレクトリをそのままドキュメントルートに配置して、それに合わせて Slim 化した link, meta タグの ```href``` のパスや、manifest.json や browserconfig.xml 内のパスを書き換えます。
自分が持っている Mac や iPhone では確認しましたが、その他デバイスでは未確認です。。


```ruby
#source/layouts/layout.slim   
    link rel="shortcut icon" type="image/x-icon" href="/favicon.ico"
    link href="/favicons/apple-touch-icon-57x57.png" rel="apple-touch-icon" sizes="57x57" /
    link href="/favicons/apple-touch-icon-60x60.png" rel="apple-touch-icon" sizes="60x60" /
    link href="/favicons/apple-touch-icon-72x72.png" rel="apple-touch-icon" sizes="72x72" /
    link href="/favicons/apple-touch-icon-76x76.png" rel="apple-touch-icon" sizes="76x76" /
    link href="/favicons/apple-touch-icon-114x114.png" rel="apple-touch-icon" sizes="114x114" /
    link href="/favicons/apple-touch-icon-120x120.png" rel="apple-touch-icon" sizes="120x120" /
    link href="/favicons/apple-touch-icon-144x144.png" rel="apple-touch-icon" sizes="144x144" /
    link href="/favicons/apple-touch-icon-152x152.png" rel="apple-touch-icon" sizes="152x152" /
    link href="/favicons/apple-touch-icon-180x180.png" rel="apple-touch-icon" sizes="180x180" /
    link href="/favicons/favicon-32x32.png" rel="icon" sizes="32x32" type="image/png" /
    link href="/favicons/android-chrome-192x192.png" rel="icon" sizes="192x192" type="image/png" /
    link href="/favicons/favicon-96x96.png" rel="icon" sizes="96x96" type="image/png" /
    link href="/favicons/favicon-16x16.png" rel="icon" sizes="16x16" type="image/png" /
    link href="/favicons/manifest.json" rel="manifest" /
    link color="#5bbad5" href="/favicons/safari-pinned-tab.svg" rel="mask-icon" /
    meta content="#da532c" name="msapplication-TileColor" /
    meta content="/mstile-144x144.png" name="msapplication-TileImage" /
    meta content="#ffffff" name="theme-color" /
```

# いいねボタン
Qiita やはてなブログを使っているとあまり気に留めませんが、自前のブログなら自分でソーシャルボタンを設置しなければなりません。
　
今回は、ちょっと適当ですが、middleman 専用のソーシャルボタン View Helper をささーっと作って [Rubygems](https://rubygems.org) に公開してみた(バグも含んでますし他のソーシャルボタンには未対応です。。)ので、それを使います。
　
設置方法は以下のようになります。
Facebook の App ID の取得方法は、[こちら](http://www.tecblo.com/javascript/807.html)を参考にしてみてください。

```
#Gemfile
+gem 'middleman-social_tag_view_helper'
```

```ruby
#config.rb
+set :facebook_app_id, 'Facebook developerサイトで取得したID'
+activate :social_tag_view_helper
```

```ruby
#source/layouts/layout.slim
doctype html
html lang="ja"
  head
+    = facebook_app_id_meta_tag
+    = open_graph_meta_tag(page_title: format_title, page_image: "http://blog.takumi-onodera.work/favicons/mstile-310x310-d3b87fa9.png")  # ブログのメイン画像は、favicon生成時のものを流用しました。。汗
```

```ruby
#source/partials/_social.html.slim
.social
  // Add social sharing buttons here (e.g. Twitter button)
+  ul.buttons
+    li
+      = facebook_share_button
+    li
+      = hatena_bookmark_button
```

```scss
/*
source/stylesheets/partials/_social.css.scss
*/
.social {
  margin: 40px auto 30px;
  padding-left: $content-body-padding;
  padding-right: $content-body-padding;

+  min-height: 190px;
+
+  ul.buttons {
+    list-style-type: none;
+    width: 238px;
+    margin: 24px auto;
+
+    li {
+      float: left;
+      margin: 0 8px;
+    }
+  }
}
```

ちょっとボタンがずれてますが、こんな感じで設置しました！
たぶん、これで動くはず、、


# 他にもいろいろなテンプレート
今回は Drops を使用しましたが、他にもたくさんテンプレートが用意されています。
そのうちの一部を試してみたので、紹介します。

画像はSafariのレスポンシブデザインモードでスクショしました。
５分でできる！をテーマにしているので、デフォルトのデザインのみ貼ってあります。


* [middleman-blog-drops-template](https://github.com/5t111111/middleman-blog-drops-template)
![スクリーンショット 2015-12-01 20.23.47.png](https://qiita-image-store.s3.amazonaws.com/0/32480/dced97fb-3bc8-2eb2-ba7c-cd8fe6a8dd1f.png "スクリーンショット 2015-12-01 20.23.47.png")
![スクリーンショット 2015-12-01 20.24.01.png](https://qiita-image-store.s3.amazonaws.com/0/32480/8864015c-756f-c262-6a6a-c85bfa744c01.png "スクリーンショット 2015-12-01 20.24.01.png")

	* [middleman-blog-bourbon-template](https://github.com/5t111111/middleman-blog-bourbon-template)

```Gemfile``` で読み込んでいる ```slim``` のバージョンを上げないと ```bundle exec middleman server``` したときにエラーが出ました。

```
#Gemfile
-gem 'slim', '~> 2.0.2'
+gem 'slim', '~> 3.0.6'
```

あと、以下を追加。

```scss
/*
source/stylesheets/base/_variables.scss
*/
$base-accent-color: #000000;
```
![スクリーンショット 2015-12-01 21.38.08.png](https://qiita-image-store.s3.amazonaws.com/0/32480/79ee0b5b-5513-82ec-014e-1fee81ca18a9.png "スクリーンショット 2015-12-01 21.38.08.png")
![スクリーンショット 2015-12-01 21.38.22.png](https://qiita-image-store.s3.amazonaws.com/0/32480/2c11ff3e-84f3-fc91-a15e-f36307ea6836.png "スクリーンショット 2015-12-01 21.38.22.png")


* [amicus](https://github.com/nathos/amicus)
	* 要カスタマイズとのこと。

![スクリーンショット 2015-12-01 21.52.35.png](https://qiita-image-store.s3.amazonaws.com/0/32480/82711db6-be7c-817b-1726-c039dade2268.png "スクリーンショット 2015-12-01 21.52.35.png")


* [middleman-basis](https://github.com/pzi/middleman-basis)
	* デフォルトページはめちゃシンプルでションボリ.com。機能モリモリなので ```bundle install``` に時間もかかる。

![スクリーンショット 2015-12-01 22.03.57.png](https://qiita-image-store.s3.amazonaws.com/0/32480/1feda050-c9e6-f089-e9b8-e846082e1fa6.png "スクリーンショット 2015-12-01 22.03.57.png")


* [franklin](https://github.com/bryanbraun/franklin)
	* オンラインブックをイメージしてるようなので、落ち着いてて優しい雰囲気です。

![スクリーンショット 2015-12-01 22.29.44.png](https://qiita-image-store.s3.amazonaws.com/0/32480/240a09b1-43f0-9d4c-b673-47dc1e3adf3c.png "スクリーンショット 2015-12-01 22.29.44.png")
![スクリーンショット 2015-12-01 22.30.03.png](https://qiita-image-store.s3.amazonaws.com/0/32480/258ab21e-adaf-a729-d024-79745ec49139.png "スクリーンショット 2015-12-01 22.30.03.png")


# その他、middleman の雑記

## 拡張子が .html のファイル
```source/``` ディレクトリ以下に存在する .html.slim の拡張子がついたファイルは、middleman によって Slim テンプレートエンジン が自動的に Ruby のコードを解釈し、```source/layouts/layout.slim``` ファイルをテンプレートにした HTML ファイルが出力されるようになっています。
　
.html の拡張子で終わるファイルは、Ruby のコードを解釈せず、``source/layouts/layout.slim``` ファイルをテンプレートとしても使用しないので、.htmlファイルの内容がそのままブラウザに表示されるため、CSS が効いてない！など初めて使う人ならここで混乱してしまうかもしれませんので、ご注意ください。


## 未来の日時を指定したファイルをデプロイしても、反映されない。
「このブログをあらかじめ作っておいて、あとは Advent Calendar に登録するだけやで😁」とズルをしようと思いましたが、未来の日時に設定するとビルドしたときに、```build/``` ディレクトリ以下に記事が作られないようです。



## Rails の ActiveRecord を参照する
Railsアプリの一部静的ページを middleman で作るとなった場合は、以下のことが参考になるかもなと思ったので、残しておきます。

### Gemfile に以下を追加

```
#Gemfile
gem 'activerecord'
gem "mysql2", '~> 0.3.13'
```

このとき、mysql2 のバージョンの指定をしないと、mysql2 が認識されないので注意

### config.rb に以下を追加

```ruby
#config.rb
require 'active_record'
require 'yaml'

config = YAML.load_file('../config/database.yml')

ActiveRecord::Base.establish_connection config['development']
ActiveRecord::Base.logger = Logger.new(STDERR) # ログにSQLを出力

# 各Modelを使えるようにする
Dir.glob("../app/models/**/*.rb").each do |file|
  require_dependency file
end
```

上記を外部ファイルにするとき、自分は最初ファイル名を active_record.rb として保存していましたが、

```
/path/to/project/middleman/active_record.rb:6:in `<top (required)>': uninitialized constant ActiveRecord (NameError)
```
のエラーが出続けて、初歩的なところで悩みました。。

### Modelが使えない場合
以下のようなエラーが出る場合

```
/path/to/project/app/models/hoge.rb:28:in `<class:Hoge>': uninitialized constant Hoge::Rails (NameError)
```

Railsのシガラミに囚われてしまっているので、下記のように書き換えてリレーション周りを再定義します。

```ruby
#config.rb
Dir.glob("../app/models/*.rb") do |file|
  self.class.const_set File.basename(file, '.rb').camelize, Class.new(ActiveRecord::Base)
end

class Hoge < ActiveRecord::Base
  has_many :fugas
end

class Fuga < ActiveRecord::Base
  belongs_to :hoge
end
```

# いろいろやってみた感想
インストールから公開まであっと言う間にできてしまったので、いろいろカスタマイズする心の余裕ができました。
また、普段から Rails で Ruby に触れているため不自由なく使えましたが、Ruby を使っていない人でも言語の壁を感じる前にブログサイトを公開できると思います。これを機に Ruby という言語に触れてファンが増えてくれると嬉しい限りです。
　
自分はブログ無精なので、今後更新していくかは微妙なところですが、Drops テンプレートの見た目もすごく綺麗だし、アウトプットすべきことは山ほどあるので、前向きに今回作ったブログを更新していきたいと思います。
　
あと、タイトル通りいろいろ盛り込みましたが、記事がダラダラとまとまりがなく長くなってしまい、大変お見苦しくてすいません。。🙇
　
　
明日は 8日目 matsusakiさんです。
追記： [記事はこちら](http://misoobu.hatenablog.jp/entry/2015/12/08/180000) です。

