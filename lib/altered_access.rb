# frozen_string_literal: true

require "json"
require "faraday"

require_relative "altered_access/version"
require_relative "altered_access/card"
require_relative "altered_access/client"
require_relative "altered_access/faction"
require_relative "altered_access/key_cleaner"

module AlteredAccess
  class Error < StandardError; end
  # Your code goes here...
end
