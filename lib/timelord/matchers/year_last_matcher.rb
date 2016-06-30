module Timelord
  class YearLastMatcher < Matcher
    REGEX = /\b(\d{1,2})\/(\d{1,2})\/(\d{2}(\d{2})?)\b/i
    CURRENT_PREFIX = 2000

    def to_date
      if format == :american
        Date.civil(to_year(match[3]), match[1].to_i, match[2].to_i)
      else
        Date.civil(to_year(match[3]), match[2].to_i, match[1].to_i)
      end
    end

    private

    def to_year(year_number)
      if year_number.length == 2
        CURRENT_PREFIX + year_number.to_i
      else
        year_number.to_i
      end
    end
  end
end
