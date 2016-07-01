module Timelord
  class LongMonthDayMatcher < FutureMatcher
    REGEX = /\b(#{LONG_MATCHER})\s+(\d{1,2})\b/i

    private

    def parse_date
      Date.civil(today.year, LONG_MONTHS.index(strings[1].downcase) + 1, ints[2])
    end
  end
end
