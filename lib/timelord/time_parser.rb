module Timelord
  class TimeParser
    def initialize(string, options)
      @string = string
      @options = options
    end

    def to_date
      matchers.
        map { |matcher| matcher.new(string, format: format, today: today) }.
        detect(&:matches?).
        to_date
    end

    private
    attr_reader :string, :options

    def matchers
      @matchers ||= MatcherLoader.new.load_all
    end

    def today
      @today ||= options.fetch(:today) { Date.today }
    end

    def format
      @format||= options.fetch(:format, :international)
    end
  end
end
