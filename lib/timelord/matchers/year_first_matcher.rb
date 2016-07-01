module Timelord
  class YearFirstMatcher < Matcher
    REGEX = /\b(\d{4})[\/\-](\d{1,2})[\/\-](\d{1,2})\b/i

    def to_date
      Date.civil(ints[1], ints[2], ints[3])
    end
  end
end
