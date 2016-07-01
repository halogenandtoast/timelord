module Timelord
  class OrdinalMatcher < FutureMatcher
    REGEX = /\b(\d{1,2})(#{ORDINAL_MATCHER})\b/i

    private

    def parse_date
      Date.civil(today.year, today.month, ints[1])
    end
  end
end
