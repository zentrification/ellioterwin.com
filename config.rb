# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# activate :autoprefixer do |prefix|
#  prefix.browsers = "last 2 versions"
# end

#activate :livereload

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

ignore 'stylesheets/bulma-0.8.0/*'

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/
helpers do

  # <% image '/path/to/image.jpg' %>
  # <% image '/path/to/image.jpg', class: 'is-16by9' %>
  # <% image '/path/to/image.jpg', hover: '/path/to/hover-image.jpg' %>
  # <% image '/path/to/image.jpg', class: 'is-16by9', hover: '/path/to/hover-image.jpg' %>
  #
  # <% image '/path/to/image.jpg' do %>
  #   <p>text that appears on hover</p>
  # <% end %>
  #
  # <% image '/path/to/image.jpg', class: 'is-16by9' do %>
  #   <p>text that appears on hover</p>
  # <% end %>
  def image(filename, options = {}, &block)
    figure_classes = ['image']
    image = image_tag(filename)

    if options[:class]
      figure_classes << options[:class]
    end

    if options[:hover]
      hover_image = image_tag(options[:hover], class: 'hover-image')
    end

    if block_given?
      hover_html = content_tag :div, class: 'hover-text' do
        capture_html(&block)
      end
      figure_classes << 'has-hover-background'
    end

    content = content_tag :figure, class: figure_classes.join(' ') do
      image + hover_image + hover_html
    end

    concat_content content
  end

end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
