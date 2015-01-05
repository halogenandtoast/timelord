module Timelord
  class LongMonthYearMatcher < Matcher
    REGEX = /\b(#{LONG_MATCHER})\s+(\d{4})\b/i

    def to_date
      Future.new(parse_date).to_date
    end

    private

    def parse_date
      Date.civil(match[2].to_i, LONG_MONTHS.index(match[1].downcase) + 1)
    end
  end
end
