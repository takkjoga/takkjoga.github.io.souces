###
# Blog settings
###

require 'extensions/sitemap.rb'

Time.zone = 'Tokyo'

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # Permalink format
  blog.permalink = '{year}/{month}/{day}/{tags}.html'
  # Matcher for blog source files
  blog.sources = 'posts/{year}-{month}-{day}-{title}.html'
  blog.summary_length = 250
  #blog.summary_generator = Qiita::Markdown::SummaryProcessor.new(truncate: { length: 250 })
  blog.default_extension = '.md'
  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = 'page/{num}'
end

page '/feed.xml', layout: false
page '/sitemap.xml', layout: false
page '/robots.txt', layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# Asset directory settings
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Markdown settings
set :markdown_engine, :redcarpet
#set :markdown_engine, :qiita_markdown
set :markdown, hard_wrap: true, \
               no_intra_emphasis: true, \
               fenced_code_blocks: true, \
               gh_blockcode: true, \
               autolink: true, \
               tables: true, \
               with_toc_data: true, \
               strikethrough: true, \
               superscript: true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  activate :gzip
end

# Reload the browser automatically whenever files change
activate :livereload

# Syntax highlight settings
activate :syntax

# Generate sitemap after build
activate :sitemap_generator

# Activate Directory Indexes
activate :directory_indexes

# Activate Deploy
activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
  deploy.build_before = true
end

# Activate S3Sync
activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'my.bucket.com' # The name of the S3 bucket you are targetting. This is globally unique.
  s3_sync.region                     = 'us-west-1'     # The AWS region for your bucket.
  s3_sync.aws_access_key_id          = ENV['AWS_ACCESS_KEY_ID']
  s3_sync.aws_secret_access_key      = ENV['AWS_SECRET_ACCESS_KEY']
  s3_sync.delete                     = true
  s3_sync.after_build                = false
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
  s3_sync.prefix                     = ''
  s3_sync.version_bucket             = false
end

# Add assets path installed via npm
after_configuration do
  sprockets.append_path File.join "#{root}", "node_modules"

  Dir.glob(File.join("#{root}", "node_modules", "*", "fonts", "*")) do |file|
    asset_path = Pathname.new(file).relative_path_from(Pathname.new(File.join(root, "node_modules")))
    sprockets.import_asset asset_path do |path|
      org_path = Pathname.new(path)
      "fonts/#{org_path.basename}"
    end
  end
end

###
# Site Settings
###

# set site URL
set :site_url, 'http://blog.takumi-onodera.work'
# set site title
set :site_title, 'いくら寝ても眠たい'
# set site description (only used for meta description for the moment)
set :site_description, 'いくら寝ても眠たい人のブログ。プログラミングやたまにインフラ、あまり有名ではないミュージシャンのことについてダラダラ書いていきます。'
# set site author name
set :site_author, 'takkjoga'
# set site author profile information
set :site_author_profile, '株式会社ドリコムでRubyエンジニアをしております。変な音楽が大好きです。'
# set site author profile image (should be in images_dir)
set :site_author_image, 'profile.png'
# when true, the page and site titles will be reversed (page title | site title)
set :reverse_title, true
# twitter/facebook/github/linkedin links in author page (otherwise set nil)
set :social_links,
    twitter: 'https://twitter.com/takkjoga',
    #facebook: 'https://facebook.com',
    github: 'https://github.com/takkjoga'
    #linkedin: 'https://linkedin.com'
set :google_analytics_account, 'UA-71142019-1'

set :facebook_app_id, '531634937006239'
set :twitter_user_name, 'takkjoga'

activate :social_tag_view_helper

