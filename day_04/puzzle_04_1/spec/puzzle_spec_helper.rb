require "spec_helper"

require "active_support"
require "zeitwerk"

loader = Zeitwerk::Loader.new

loader.push_dir("./lib")
loader.setup
