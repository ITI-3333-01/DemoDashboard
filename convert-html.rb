require 'json'
require 'erb'

loop do
  file = File.read('/home/blaze/Desktop/out.alm')

  @data_hash = JSON.parse(file)

  # render template
  template = File.read('/var/www/html/template.html.erb')
  result = ERB.new(template).result(binding)

  # write result to file
  File.open('/var/www/html/index.html', 'w+') do |f|
    f.write result
    puts "File written to " + f.path
  end
  sleep 10
end
