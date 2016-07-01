module Timelord
  class DayShortMonthMatcher < FutureMatcher
    REGEX = /\b(\d{1,2})\s+(#{SHORT_MATCHER})\b/i

    private

    def parse_date
      Date.civil(today.year, SHORT_MONTHS.index(strings[2].downcase) + 1, ints[1])
    end
  end
end
