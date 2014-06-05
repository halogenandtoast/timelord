module Timelord
  class NextTuesdayMatcher < Matcher
    REGEX = /\bnext tues\b/

      def to_date
        NextWeekday.new(DAY_NAMES.index("tuesday"), today).to_date
      end
  end
end
