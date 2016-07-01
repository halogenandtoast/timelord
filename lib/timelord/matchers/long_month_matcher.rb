module Timelord
  class LongMonthMatcher < Matcher
    REGEX = /\b(#{LONG_MATCHER})\b/i

    def to_date
      future
    end

    private

    def parse_date
      Date.civil(today.year, LONG_MONTHS.index(match[1].downcase) + 1)
    end
  end
end
