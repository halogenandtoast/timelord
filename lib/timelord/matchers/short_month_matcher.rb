module Timelord
  class ShortMonthMatcher < Matcher
    REGEX = /\b(#{SHORT_MATCHER})\b/i

    def to_date
      future
    end

    private

    def parse_date
      Date.civil(today.year, SHORT_MONTHS.index(match[1].downcase) + 1)
    end
  end
end
