module Timelord
  class DayNumericMonthMatcher < Matcher
    REGEX = /\b(\d{1,2})\/(\d{1,2})\b/i

    def to_date
      future
    end

    private

    def parse_date
      if format == :american
        Date.civil(today.year, ints[1], ints[2])
      else
        Date.civil(today.year, ints[2], ints[1])
      end
    end
  end
end
