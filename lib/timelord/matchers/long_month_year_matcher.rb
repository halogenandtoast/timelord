module Timelord
  class LongMonthYearMatcher < Matcher
    REGEX = /\b(#{LONG_MATCHER})\s+(\d{4})\b/i

    def to_date
      future
    end

    private

    def parse_date
      Date.civil(ints[2], LONG_MONTHS.index(strings[1].downcase) + 1)
    end
  end
end
