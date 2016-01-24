require 'opal'
require 'opal-jquery'

desc "Build our app to conway.js"
task :build do
  File.open("app/blokouderling_lookup.js", "w+") do |out|
    out << Opal.compile(File.read('app/blokouderling_lookup.rb'))
  end
  File.open("resources/js/opal.js", "w+") do |out|
    out << Opal::Builder.build('opal')
  end
  File.open("resources/js/opal-jquery.js", "w+") do |out|
    out << Opal::Builder.build("opal-jquery")
  end
end