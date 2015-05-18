Warbler::Config.new do |config|
  config.dirs     = %w(views)
  config.includes = FileList["main.rb","ibge_parser.rb","config-sample.yml"]
  config.jar_name = "ibgesearch"
end
