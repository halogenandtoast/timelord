require 'date'

class Timelord
  VERSION = "0.0.6"

  SHORT_MONTHS = %w(jan feb mar apr may jun jul aug sep oct nov dec).freeze
  LONG_MONTHS = %w(january febuary march april may june july august september october november december).freeze
  SHORT_MATCHER = SHORT_MONTHS.join('|').freeze
  LONG_MATCHER = LONG_MONTHS.join('|').freeze
  ORDINAL_MATCHER = "st|nd|rd|th".freeze
  DAY_NAMES = %w(monday tuesday wednesday thursday friday saturday sunday).freeze
  SHORT_DAY_NAMES = %w(mon tue wed thu fri sat sun).freeze
  DAY_MATCHER = (DAY_NAMES + SHORT_DAY_NAMES).join('|').freeze

  def self.set_date(date)
    @today = date
  end

  def self.today
    @today ||= Date.today
  end

  def self.reset
    @today = Date.today
  end

  # Parses a date str. Second parameter switches between international and american date formats.
  #
  #   Timelord.parse("Tuesday").to_s # "2011-01-04"
  #   Timelord.parse("11/01").to_s # "2011-01-11"
  #   Timelord.parse("11/01", :american) # "2011-11-01"
  #
  # For more examples, check out the spec[https://github.com/halogenandtoast/timelord/blob/master/spec/timelord_spec.rb]
  def self.parse(str, format = :international)
    if str =~ /\b(\d{4})\/(\d{1,2})\/(\d{1,2})\b/i
      Date.civil($1.to_i, $2.to_i, $3.to_i)
    elsif str =~ /\b(\d{4})\-(\d{1,2})\-(\d{1,2})\b/i
      Date.civil($1.to_i, $2.to_i, $3.to_i)
    elsif str =~ /\b(\d{1,2})\/(\d{1,2})\/(\d{2}(\d{2})?)\b/i
      if format == :american
        Date.civil($3.to_i, $1.to_i, $2.to_i)
      else
        Date.civil($3.to_i, $2.to_i, $1.to_i)
      end
    elsif str =~ /\b(\d{1,2})\/(\d{1,2})\b/i
      date = if format == :american
        Date.civil(today.year, $1.to_i, $2.to_i)
      else
        Date.civil(today.year, $2.to_i, $1.to_i)
      end
      set_to_future(date)
    elsif str =~ /\b(\d{1,2})\s+(#{SHORT_MATCHER})\b/i
      date = Date.civil(today.year, SHORT_MONTHS.index($2.downcase) + 1, $1.to_i)
      set_to_future(date)
    elsif str =~ /\b(#{SHORT_MATCHER})\s+(\d{1,2})\b/i
      date = Date.civil(today.year, SHORT_MONTHS.index($1.downcase) + 1, $2.to_i)
      set_to_future(date)
    elsif str =~ /\b(\d{1,2})\s+(#{LONG_MATCHER})\b/i
      date = Date.civil(today.year, LONG_MONTHS.index($2.downcase) + 1, $1.to_i)
      set_to_future(date)
    elsif str =~ /\b(#{LONG_MATCHER})\s+(\d{1,2})\b/i
      date = Date.civil(today.year, LONG_MONTHS.index($1.downcase) + 1, $2.to_i)
      set_to_future(date)
    elsif str =~ /\b(\d{1,2})(#{ORDINAL_MATCHER})\b/i
      date = Date.civil(today.year, today.month, $1.to_i)
      set_to_future(date)
    elsif str =~/\bnext (#{DAY_MATCHER})\b/i
      expected_index = DAY_NAMES.index($1.downcase) || SHORT_DAY_NAMES.index($1.downcase)
      next_weekday(expected_index)
    elsif str =~/\bnext tues\b/
      next_weekday(DAY_NAMES.index("tuesday"))
    elsif str =~/\bnext (thur|thurs)\b/
      next_weekday(DAY_NAMES.index("thursday"))
    elsif str =~/\b(#{DAY_MATCHER})\b/i
      expected_index = DAY_NAMES.index($1.downcase) || SHORT_DAY_NAMES.index($1.downcase)
      current_weekday(expected_index)
    elsif str =~/\btues\b/
      current_weekday(DAY_NAMES.index("tuesday"))
    elsif str =~/\b(thur|thurs)\b/
      current_weekday(DAY_NAMES.index("thursday"))
    elsif str =~ /\b(today|tod)\b/i
      today
    elsif str =~ /\b(tomorrow|tom)\b/i
      today + 1
    end
  end

  private

  def self.next_weekday(date_index)
    current_date = today.strftime("%A").downcase
    current_index = DAY_NAMES.index(current_date)
    if date_index <= current_index
      today + (7 - current_index + date_index) + 7
    else
      diff = date_index - current_index
      today + diff + 7
    end
  end

  def self.current_weekday(date_index)
    current_date = today.strftime("%A").downcase
    current_index = DAY_NAMES.index(current_date)
    if date_index <= current_index
      today + (7 - current_index + date_index)
    else
      diff = date_index - current_index
      today + diff
    end
  end

  def self.set_to_future(date)
    today = Date.today
    if date && date < today
      date = Date.civil(date.year + 1, date.month, date.day)
    end
    return date
  end
end
