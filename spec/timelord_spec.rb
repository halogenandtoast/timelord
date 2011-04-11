require 'spec_helper'

describe Timelord, 'parse' do
  before do
    local_time = Time.local(2010,12,1,10,5,0)
    Timecop.freeze(local_time)
  end

  it "returns nil when no time is present" do
    Timelord.parse("No time here").should == nil
  end

  it "parses 'today'" do
    Timelord.parse("I need to do something today.").should == Date.today
  end

  it "parses 'tod'" do
    Timelord.parse("I need to do something tod.").should == Date.today
  end

  it "parses 'tomorrow'" do
    tomorrow = Date.today + 1
    Timelord.parse("I need to do something tomorrow.").should == tomorrow
  end

  it "parses 'tom'" do
    tomorrow = Date.today + 1
    Timelord.parse("I need to do something tom.").should == tomorrow
  end

  it "does not parse 'monster' as monday" do
    Timelord.parse("Monster mash").should == nil
  end

  it "parses '12 Dec'" do
    twelth_of_december = Date.civil(2010,12,12)
    Timelord.parse("On 12 Dec I need to do something.").should == twelth_of_december
  end

  it "parses 'Dec 12'" do
    twelth_of_december = Date.civil(2010,12,12)
    Timelord.parse("On Dec 12 I need to do something.").should == twelth_of_december
  end

  it "parses American style dates" do
    first_of_december = Date.today
    Timelord.parse("On 12/1/2010 I need to do something.", :american).should == first_of_december
  end

  it "parses Internation style dates by default" do
    first_of_december = Date.today
    Timelord.parse("On 1/12/2010 I need to do something.", :international).should == first_of_december
  end

  it "parses yyyy/mm/dd" do
    first_of_december = Date.today
    Timelord.parse("On 2010/12/01 I need to do something.").should == first_of_december
  end

  it "parses yyyy/mm/d" do
    first_of_december = Date.today
    Timelord.parse("On 2010/12/1 I need to do something.").should == first_of_december
  end

  it "parses yyyy/m/d" do
    first_of_january = Date.civil(2010, 1, 1)
    Timelord.parse("On 2010/1/1 I need to do something.").should == first_of_january
  end

  it "parses yyyy-mm-dd" do
    first_of_december = Date.today
    Timelord.parse("On 2010-12-01 I need to do something.").should == first_of_december
  end

  it "parses mm/dd" do
    first_of_december = Date.today
    Timelord.parse("On 12/1 I need to do something.", :american).should == first_of_december
    Timelord.parse("On 12/01 I need to do something.", :american).should == first_of_december
    Timelord.parse("On 1/12 I need to do something.", :international).should == first_of_december
    Timelord.parse("On 01/12 I need to do something.", :international).should == first_of_december
  end

  it "parses formats like 1st,2nd,3rd,4th,25th" do
    first_of_december = Date.today
    second_of_december = Date.today + 1
    third_of_december = Date.today + 2
    forth_of_december = Date.today + 3
    twenty_fifth_of_december = Date.civil(2010,12,25)
    Timelord.parse("On the 1st").should == first_of_december
    Timelord.parse("On the 2nd").should == second_of_december
    Timelord.parse("On the 3rd").should == third_of_december
    Timelord.parse("On the 4th").should == forth_of_december
    Timelord.parse("On the 25th").should == twenty_fifth_of_december
  end

  it "parses the day of the week" do
    friday = Date.today + 2
    monday = Date.today + 5
    tuesday = Date.today + 6
    thursday = Date.today + 1
    Timelord.parse("On friday do something").should == friday
    Timelord.parse("On Monday do something").should == monday
    Timelord.parse("On fri do something").should == friday
    Timelord.parse("On mon do something").should == monday
    Timelord.parse("On tues do something").should == tuesday
    Timelord.parse("On thurs do something").should == thursday
  end

  it "parses the next weekday" do
    friday = Date.today + 9
    monday = Date.today + 12
    Timelord.parse("On next friday do something").should == friday
    Timelord.parse("On next Monday do something").should == monday
  end

  it 'returns a date in the future' do
    first_of_january = Date.civil(2011,1,1)
    Timelord.parse("On 1 Jan I need to do something.").should == first_of_january
  end

  it 'parses month_name day format' do
    first_of_march = Date.civil(2011,3,1)
    Timelord.parse("March 1 I need to do stuff.").should == first_of_march
  end

  after do
    Timecop.return
  end
end

