module Timelord
  class DayLongMonthMatcher < Matcher
    REGEX = /\b(\d{1,2})\s+(#{LONG_MATCHER})\b/i

    def to_date
      future
    end

    private

    def parse_date
      Date.civil(today.year, LONG_MONTHS.index(strings[2].downcase) + 1, ints[1])
    end
  end
end
