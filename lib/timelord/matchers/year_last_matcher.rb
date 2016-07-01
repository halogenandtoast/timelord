module Timelord
  class YearLastMatcher < Matcher
    REGEX = /\b(\d{1,2})\/(\d{1,2})\/(\d{2}(\d{2})?)\b/i
    CURRENT_MILLENIUM = 2000
    MILLENIUM_THRESHOLD = 1000

    def to_date
      Date.civil(year, month, day)
    end

    private

    def month
      format == :american ? ints[1] : ints[2]
    end

    def day
      format == :american ? ints[2] : ints[1]
    end

    def year
      if ints[3] < MILLENIUM_THRESHOLD
        CURRENT_MILLENIUM + ints[3]
      else
        ints[3]
      end
    end
  end
end
