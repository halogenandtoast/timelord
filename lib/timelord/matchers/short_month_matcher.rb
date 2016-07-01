module Timelord
  class ShortMonthMatcher < FutureMatcher
    REGEX = /\b(#{SHORT_MATCHER})\b/i

    private

    def parse_date
      Date.civil(today.year, month_by_index(strings[1]))
    end
  end
end
