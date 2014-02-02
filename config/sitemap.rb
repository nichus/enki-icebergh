# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://icebergh.us"

#if SitemapGenerator.app.rails3?
#	SitemapGenerator::Interpreter.send :include, ::Enki::Application.routes.url_helpers
#end

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
     add Enki::Application.routes.url_helpers.about_me_path, :priority => 0.7, :changefreq => 'monthly'
#     add posts_path, :priority => 0.7, :changefreq => 'weekly'
#     add pages_path, :priority => 0.7, :changefreq => 'monthly'
  #
  # Add all articles:
  #
     Post.find_each do |post|
       add Enki::Application.routes.url_helpers.posts_path(post), :lastmod => post.updated_at
     end
     Page.find_each do |page|
       add Enki::Application.routes.url_helpers.page_path(post), :lastmod => page.updated_at
     end
end
