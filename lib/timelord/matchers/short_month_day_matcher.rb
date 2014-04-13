class ShortMonthDayMatcher < Matcher
  REGEX = /\b(#{SHORT_MATCHER})\s+(\d{1,2})\b/i

  def to_date
    Future.new(parse_date).to_date
  end

  private

  def parse_date
    Date.civil(today.year, SHORT_MONTHS.index(match[1].downcase) + 1, match[2].to_i)
  end
end
