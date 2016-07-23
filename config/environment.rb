# Load the Rails application.
require File.expand_path('../application', __FILE__)
Dir[File.join(Rails.root, "lib", "core_ext", "*.rb")].each {|l| require l }
# Initialize the Rails application.
Rails.application.initialize!