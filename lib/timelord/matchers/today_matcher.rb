class TodayMatcher < Matcher
  REGEX = /\b(today|tod)\b/i

  def to_date
    today
  end
end
