module Timelord
  class LongMonthDayMatcher < Matcher
    REGEX = /\b(#{LONG_MATCHER})\s+(\d{1,2})\b/i

    def to_date
      future
    end

    private

    def parse_date
      Date.civil(today.year, LONG_MONTHS.index(strings[1].downcase) + 1, ints[2])
    end
  end
end
