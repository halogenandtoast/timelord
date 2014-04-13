class CurrentTuesdayMatcher < Matcher
  REGEX = /\btues\b/

  def to_date
    CurrentWeekday.new(date_index, today).to_date
  end

  private

  def date_index
    DAY_NAMES.index("tuesday")
  end
end
