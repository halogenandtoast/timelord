module Timelord
  class DayShortMonthMatcher < Matcher
    REGEX = /\b(\d{1,2})\s+(#{SHORT_MATCHER})\b/i

    def to_date
      Future.new(parse_date).to_date
    end

    private

    def parse_date
      Date.civil(today.year, SHORT_MONTHS.index(match[2].downcase) + 1, match[1].to_i)
    end
  end
end
