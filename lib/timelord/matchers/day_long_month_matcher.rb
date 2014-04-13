class DayLongMonthMatcher < Matcher
  REGEX = /\b(\d{1,2})\s+(#{LONG_MATCHER})\b/i

  def to_date
    Future.new(parse_date).to_date
  end

  private

  def parse_date
    Date.civil(today.year, LONG_MONTHS.index(match[2].downcase) + 1, match[1].to_i)
  end
end
