module Timelord
  class ShortMonthYearMatcher < Matcher
    REGEX = /\b(#{SHORT_MATCHER})\s+(\d{4})\b/i

    def to_date
      future
    end

    private

    def parse_date
      Date.civil(ints[2], month_by_index(strings[1]))
    end
  end
end
