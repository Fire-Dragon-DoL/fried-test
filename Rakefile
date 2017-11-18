require "bundler/gem_tasks"

task :test do
  lib = File.expand_path("../lib", __FILE__)
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

  require "fried/test"

  Fried::Test::CLI.()
end
