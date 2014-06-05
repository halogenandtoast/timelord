module Timelord
  class OrdinalMatcher < Matcher
    REGEX = /\b(\d{1,2})(#{ORDINAL_MATCHER})\b/i

    def to_date
      Future.new(parse_date).to_date
    end

    private

    def parse_date
      Date.civil(today.year, today.month, match[1].to_i)
    end
  end
end
