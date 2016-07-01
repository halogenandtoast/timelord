module Timelord
  class OrdinalMatcher < Matcher
    REGEX = /\b(\d{1,2})(#{ORDINAL_MATCHER})\b/i

    def to_date
      future
    end

    private

    def parse_date
      Date.civil(today.year, today.month, ints[1])
    end
  end
end
