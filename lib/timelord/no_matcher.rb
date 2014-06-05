module Timelord
  class NoMatcher
    def initialize(string, options)
    end

    def matches?
      true
    end

    def to_date
      nil
    end
  end
end
