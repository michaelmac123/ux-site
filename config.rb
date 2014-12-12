activate :directory_indexes

set :relative_links, true

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Standard Page route
data.pages.each do |page|
  proxy "/#{(page.name).parameterize}.html", "/page_template.html",
  :locals => {  :name => page.name, :id => page.id, :page_slogan => page.page_slogan },
  :ignore => true
end

# Works Page route
data.works.each do |work|
  proxy "work/#{(work.name).parameterize}.html", "/work_template.html",
  :locals => {  :name => work.name, :id => work.id },
  :ignore => true
end


###
# Helpers
###
helpers do
  def nav_active(page)
    current_page.url == "#{page}" ? {:class => "active"} : {}
  end

  def render_page_partial(s)
    case s.to_s
    when '1'
      partial "index", :locals => {:id => s }
    when '2'
      partial "pages/work", :locals => {:id => s }
    when '5'
      partial "pages/find-me", :locals => {:id => s }
    else
      partial "pages/work", :locals => {:id => s }
    end
  end

  def inline_svg(path, opts={})
    file = File.open("source/images/#{path}.svg", "r")
    klass = opts[:class] ||= ""
    klass << " #{path}"
    svg = file.read
    svg = content_tag :span, svg, class: klass, title: opts[:title] || ""
  end

end

# Use LiveReload
activate :livereload

# Compass configuration
set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :fonts_dir, 'fonts'

set :haml, { :ugly => true, :format => :html5 }


# Build-specific configuration
configure :build do
  ignore 'images/*.psd'
  ignore 'stylesheets/lib/*'
  ignore 'stylesheets/vendor/*'
  ignore 'javascripts/lib/*'
  ignore 'javascripts/vendor/*'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end