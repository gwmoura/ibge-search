Warbler::Config.new do |config|
  config.dirs     = %w(views)
  config.includes = FileList["main.rb","ibge_parser.rb"]
  config.jar_name = "ibgesearch"
end
