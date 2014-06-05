module Timelord
  class YearFirstMatcher < Matcher
    REGEX = /\b(\d{4})[\/\-](\d{1,2})[\/\-](\d{1,2})\b/i

    def to_date
      Date.civil(match[1].to_i, match[2].to_i, match[3].to_i)
    end
  end
end
