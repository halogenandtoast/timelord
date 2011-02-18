module Timelord
  class Recurring
    FREQUENCY = [:secondly, :minutely, :hourly, :daily, :weekly, :monthy, :yearly]

    def initialize(start, options = {})

      @start = start
      @current = start

      @freq = options[:freq]
      @until = nil
      @count = nil
      @interval = nil
      @bysecond = nil #list
      @byminute = nil #list
      @byhour = nil #list
      @byday = nil
      @bymonthday = nil
      @byyearday = nil
      @byweekno = nil
      @bymonth = nil
      @bysetpos = nil
      @wkst = "SU"
    end

    def next
      if @freq == :daily
        @current = Time.local_time(@current.year, @current.month, @current.day) + 86400
      end
      @current
    end
  end
end
