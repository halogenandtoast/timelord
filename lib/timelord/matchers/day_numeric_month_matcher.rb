module Timelord
  class DayNumericMonthMatcher < Matcher
    REGEX = /\b(\d{1,2})\/(\d{1,2})\b/i

    def to_date
      Future.new(parse_date).to_date
    end

    private

    def parse_date
      if format == :american
        Date.civil(today.year, match[1].to_i, match[2].to_i)
      else
        Date.civil(today.year, match[2].to_i, match[1].to_i)
      end
    end
  end
end
