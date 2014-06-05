module Timelord
  class NextWeekdayMatcher < Matcher
    REGEX = /\bnext (#{DAY_MATCHER})\b/i

    def to_date
      NextWeekday.new(date_index, today).to_date
    end

    private

    def date_index
      DAY_NAMES.index(match[1].downcase) || SHORT_DAY_NAMES.index(match[1].downcase)
    end
  end
end
