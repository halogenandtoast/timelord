require 'spec_helper'

describe Timelord::Recurring do
  before do
    Timecop.freeze(Time.local(2011,2,17,0,0,1))
  end
  context "Date that recurs forever" do
    subject { Timelord::Recurring.new(:freq => :daily, :interval => 2) }
    it "returns the next recurring date" do
      subject.next.should == Date.today+3
    end
  end
  after do
    Timecop.return
  end
end

