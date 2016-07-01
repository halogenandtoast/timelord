module Timelord
  class ShortMonthDayMatcher < FutureMatcher
    REGEX = /\b(#{SHORT_MATCHER})\s+(\d{1,2})\b/i

    private

    def parse_date
      Date.civil(today.year, month_by_index(strings[1]), ints[2])
    end
  end
end
