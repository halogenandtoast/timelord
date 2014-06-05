module Timelord
  class TomorrowMatcher < Matcher
    REGEX = /\b(tomorrow|tom)\b/i

    def to_date
      today + 1
    end
  end
end
