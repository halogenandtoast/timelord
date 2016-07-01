module Timelord
  class FutureMatcher < Matcher
    def to_date
      Future.new(parse_date).to_date
    end
  end
end
