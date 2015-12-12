---
title: middleman-social_tag_view_helperにTwitterボタンを追加しました
date: 2015-12-08 11:20 +0900
tags: middleman, twitter, gem
---

昨日書いた記事の文中で使用している ```middleman-social_tag_view_helper``` gem の
v0.1.3 を公開しました。
　
変更点は Twitter のシェアボタンの追加のみです。
　
使用方法は以下です。

```ruby
#config.rb

# Twitterのユーザー名を設定すると、このユーザー宛のメンション付きのツイートが作成されます。
set :twitter_user_name, 'takkjoga'
```

```ruby
#source/partials/_social.html.slim
# twitter_share_button の引数に Twitter のユーザー名を指定することも可能です。
= twitter_share_button
```

なぜか表示が崩れる。。
どなたかCSS教えて。。！

　
今後も他のソーシャルボタンの追加とバグフィックスを続けていこうと思います。
