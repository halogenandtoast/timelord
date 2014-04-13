class CurrentWeekday
  ONE_WEEK = 7
  ZERO_WEEKS = 0

  def initialize(date_index, today)
    @date_index = date_index
    @today = today
  end

  def to_date
    today + amount_to_increase
  end

  private
  attr_reader :today, :date_index

  def current_index
    today.cwday - 1
  end

  def amount_to_increase
    diff = date_index - current_index
    diff + number_of_weeks
  end

  def number_of_weeks
    if date_index <= current_index
      ONE_WEEK
    else
      ZERO_WEEKS
    end
  end
end
