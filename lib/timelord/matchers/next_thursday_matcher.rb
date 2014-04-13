class NextThursdayMatcher < Matcher
  REGEX = /\bnext (thur|thurs)\b/

  def to_date
    NextWeekday.new(DAY_NAMES.index("thursday"), today).to_date
  end
end
