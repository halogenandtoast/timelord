require 'date'
require 'timelord/parser'
require 'timelord/recurring'

module Timelord
  def self.parse(str, format = :international)
    Timelord::Parser.parse(str, format)
  end
end
