activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.name = "blog"
  blog.prefix = "blog"

  blog.permalink = "{title}.html"
  # Matcher for blog source files
  blog.sources = "posts/{day}-{month}-{year}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "blog_layout"
  # blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"
  blog.new_article_template = "source/templates/blog_template.erb"
  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end
activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.name = "produtos"
  blog.prefix = "produtos"
  blog.custom_collections = {
      categoria: {
      link: '/categorias/{categoria}.html',
      template: '/categoria.html'
    }
  }

  blog.permalink = "{categoria}/{title}.html"
  # Matcher for blog source files
  blog.sources = "data/{day}-{month}-{year}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "produto_layout"
  # blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"
  blog.new_article_template = "source/templates/product_template.erb"
  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end
page "/feed.xml", layout: false
page '/sitemap.xml', layout: false
page '/robots.txt', layout: false

activate :directory_indexes

activate :dragonfly_thumbnailer
###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

# Auto-prefixing of CSS code with vendor prefix
activate :autoprefixer

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# # With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir  , 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true
  # set :http_prefix, "/sweet-joy"

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
  #
  require_relative "./lib/build_cleaner"
  activate :build_cleaner
end

# Deployment
activate :deploy do |deploy|
  deploy.method = :git
  # deploy.build_before = true

  # Optional Settings
  # deploy.remote = 'custom-remote' # remote name or git url, default: origin
  deploy.branch = 'teste' # default: gh-pages
  # deploy.strategy = :submodule # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message' # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end

# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
