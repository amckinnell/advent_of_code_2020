require "spec_helper"
require "zeitwerk"

loader = Zeitwerk::Loader.new

loader.push_dir("./lib")
loader.setup
