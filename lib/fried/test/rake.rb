require "rake"

task :test do
  lib = File.expand_path("../../../", __FILE__)
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

  require "fried/test"

  Fried::Test::CLI.()
end
