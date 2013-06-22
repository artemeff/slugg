require 'slugg/sanitizer'
require 'slugg/version'
require 'slugg/chars'

module Slugg
  class << self
    def new str, options = {}
      Slugg::Sanitizer.new(options).safe str
    end

    alias_method :make, :new
  end
end
