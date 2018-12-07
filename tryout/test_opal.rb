gem 'opal', '~> 0.11.4'
gem 'opal-jquery', '~> 0.4.3'

require 'opal'
require 'opal-jquery'

app_html = <<-HTML
  <html><head>
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="app.js"></script>
  </head><body></body></html>
HTML

app_code = <<-RUBY
  Document.ready? do
    alert('hello world!')
  end
RUBY

builder = Opal::Builder.new
builder.build('opal')
builder.build('opal-jquery')
builder.build_str app_code, 'app.rb'

File.write 'app.js', builder.to_s
File.write 'app.html', app_html
