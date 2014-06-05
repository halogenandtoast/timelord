module Timelord
  class Matcher

    SHORT_MONTHS = %w(jan feb mar apr may jun jul aug sep oct nov dec).freeze
    LONG_MONTHS = %w(january febuary march april may june july august september october november december).freeze
    SHORT_MATCHER = SHORT_MONTHS.join('|').freeze
    LONG_MATCHER = LONG_MONTHS.join('|').freeze
    ORDINAL_MATCHER = "st|nd|rd|th".freeze
    DAY_NAMES = %w(monday tuesday wednesday thursday friday saturday sunday).freeze
    SHORT_DAY_NAMES = %w(mon tue wed thu fri sat sun).freeze
    DAY_MATCHER = (DAY_NAMES + SHORT_DAY_NAMES).join('|').freeze

    def initialize(string, options = {})
      @string = string
      @format = options[:format] || :international
      @today = options[:today] || Date.today
    end

    def matches?
      @match ||= self.class::REGEX.match(string)
    end

    private
    attr_reader :string, :match, :format, :today
  end
end
