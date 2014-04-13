class YearLastMatcher < Matcher
  REGEX = /\b(\d{1,2})\/(\d{1,2})\/(\d{2}(\d{2})?)\b/i

  def to_date
    if format == :american
      Date.civil(match[3].to_i, match[1].to_i, match[2].to_i)
    else
      Date.civil(match[3].to_i, match[2].to_i, match[1].to_i)
    end
  end
end
