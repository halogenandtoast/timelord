module Timelord
  class DayLongMonthMatcher < FutureMatcher
    REGEX = /\b(\d{1,2})\s+(#{LONG_MATCHER})\b/i

    private

    def parse_date
      Date.civil(today.year, LONG_MONTHS.index(strings[2].downcase) + 1, ints[1])
    end
  end
end
