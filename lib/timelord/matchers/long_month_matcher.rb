module Timelord
  class LongMonthMatcher < FutureMatcher
    REGEX = /\b(#{LONG_MATCHER})\b/i

    private

    def parse_date
      Date.civil(today.year, LONG_MONTHS.index(match[1].downcase) + 1)
    end
  end
end
