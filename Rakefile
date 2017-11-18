require "bundler/gem_tasks"

task :test do
  lib = File.expand_path("../../test", __FILE__)
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

  Dir.glob("./test/**/*_test.rb").each { |file| require file }
end
