require 'date'
require 'timelord/matcher'
require 'timelord/no_matcher'
require 'timelord/future'
require 'timelord/next_weekday'
require 'timelord/current_weekday'
require 'timelord/matcher_loader'

class Timelord
  VERSION = "0.0.6"


  def self.set_date(date)
    @today = date
  end

  def self.today
    @today ||= Date.today
  end

  def self.reset
    @today = Date.today
  end

  def self.matchers
    @matchers ||= MatcherLoader.new.load_all
  end

  # Parses a date str. Second parameter switches between international and american date formats.
  #
  #   Timelord.parse("Tuesday").to_s # "2011-01-04"
  #   Timelord.parse("11/01").to_s # "2011-01-11"
  #   Timelord.parse("11/01", :american) # "2011-11-01"
  #
  # For more examples, check out the spec[https://github.com/halogenandtoast/timelord/blob/master/spec/timelord_spec.rb]
  def self.parse(str, format = :international)
    matchers.
      map { |matcher| matcher.new(str, format: format, today: today) }.
      detect(&:matches?).
      to_date
  end
end
