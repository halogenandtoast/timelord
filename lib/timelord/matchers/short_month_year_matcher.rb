module Timelord
  class ShortMonthYearMatcher < Matcher
    REGEX = /\b(#{SHORT_MATCHER})\s+(\d{4})\b/i

    def to_date
      Future.new(parse_date).to_date
    end

    private

    def parse_date
      Date.civil(match[2].to_i, SHORT_MONTHS.index(match[1].downcase) + 1)
    end
  end
end
