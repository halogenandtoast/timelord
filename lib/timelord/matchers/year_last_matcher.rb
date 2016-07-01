module Timelord
  class YearLastMatcher < Matcher
    REGEX = /\b(\d{1,2})\/(\d{1,2})\/(\d{2}(\d{2})?)\b/i
    CURRENT_MILLENIUM = 2000
    MILLENIUM_THRESHOLD = 1000

    def to_date
      if format == :american
        Date.civil(to_year(ints[3]), ints[1], ints[2])
      else
        Date.civil(to_year(ints[3]), ints[2], ints[1])
      end
    end

    private

    def to_year(year_number)
      if year_number < MILLENIUM_THRESHOLD
        CURRENT_MILLENIUM + year_number
      else
        year_number
      end
    end
  end
end
