class Future
  def initialize(date)
    @current_date = date.dup
  end

  def to_date
    if current_date < today
      current_date.next_year
    else
      current_date
    end
  end

  private
  attr_reader :current_date

  def today
    Date.today
  end
end
