require 'spec_helper'

describe Timelord, 'parse' do
  before do
    local_time = Time.local(2010,12,1,10,5,0)
    Timecop.freeze(local_time)
  end

  it "can set today to a different value" do
    actual_date = Time.local(2010,12,5,10,5,0)
    expect(Timelord.parse("today", today: actual_date)).to eq actual_date
  end

  it "returns nil when no time is present" do
    expect(Timelord.parse("No time here")).to eq nil
  end

  it "parses 'today'" do
    expect(Timelord.parse("I need to do something today.")).to eq Date.today
  end

  it "parses 'tod'" do
    expect(Timelord.parse("I need to do something tod.")).to eq Date.today
  end

  it "parses 'tomorrow'" do
    tomorrow = Date.today + 1
    expect(Timelord.parse("I need to do something tomorrow.")).to eq tomorrow
  end

  it "parses 'tom'" do
    tomorrow = Date.today + 1
    expect(Timelord.parse("I need to do something tom.")).to eq tomorrow
  end

  it "does not parse 'monster' as monday" do
    expect(Timelord.parse("Monster mash")).to eq nil
  end

  it "parses '12 Dec'" do
    twelth_of_december = Date.civil(2010,12,12)
    expect(Timelord.parse("On 12 Dec I need to do something.")).to eq twelth_of_december
  end

  it "parses 'Dec 12'" do
    twelth_of_december = Date.civil(2010,12,12)
    expect(Timelord.parse("On Dec 12 I need to do something.")).to eq twelth_of_december
  end

  it "parses American style dates" do
    first_of_december = Date.today
    expect(Timelord.parse("On 12/1/2010 I need to do something.", format: :american)).to eq first_of_december
  end

  it "parses Internation style dates by default" do
    first_of_december = Date.today
    expect(Timelord.parse("On 1/12/2010 I need to do something.", format: :international)).to eq first_of_december
  end

  it "parses yyyy/mm/dd" do
    first_of_december = Date.today
    expect(Timelord.parse("On 2010/12/01 I need to do something.")).to eq first_of_december
  end

  it "parses yyyy/mm/d" do
    first_of_december = Date.today
    expect(Timelord.parse("On 2010/12/1 I need to do something.")).to eq first_of_december
  end

  it "parses yyyy/m/d" do
    first_of_january = Date.civil(2010, 1, 1)
    expect(Timelord.parse("On 2010/1/1 I need to do something.")).to eq first_of_january
  end

  it "parses yyyy-mm-dd" do
    first_of_december = Date.today
    expect(Timelord.parse("On 2010-12-01 I need to do something.")).to eq first_of_december
  end

  it "parses mm/dd" do
    first_of_december = Date.today
    expect(Timelord.parse("On 12/1 I need to do something.", format: :american)).to eq first_of_december
    expect(Timelord.parse("On 12/01 I need to do something.", format: :american)).to eq first_of_december
    expect(Timelord.parse("On 1/12 I need to do something.", format: :international)).to eq first_of_december
    expect(Timelord.parse("On 01/12 I need to do something.", format: :international)).to eq first_of_december
  end

  it "parses formats like 1st,2nd,3rd,4th,25th" do
    first_of_december = Date.today
    second_of_december = Date.today + 1
    third_of_december = Date.today + 2
    forth_of_december = Date.today + 3
    twenty_fifth_of_december = Date.civil(2010,12,25)
    expect(Timelord.parse("On the 1st")).to eq first_of_december
    expect(Timelord.parse("On the 2nd")).to eq second_of_december
    expect(Timelord.parse("On the 3rd")).to eq third_of_december
    expect(Timelord.parse("On the 4th")).to eq forth_of_december
    expect(Timelord.parse("On the 25th")).to eq twenty_fifth_of_december
  end

  it "parses the day of the week" do
    friday = Date.today + 2
    monday = Date.today + 5
    tuesday = Date.today + 6
    thursday = Date.today + 1
    expect(Timelord.parse("On friday do something")).to eq friday
    expect(Timelord.parse("On Monday do something")).to eq monday
    expect(Timelord.parse("On fri do something")).to eq friday
    expect(Timelord.parse("On mon do something")).to eq monday
    expect(Timelord.parse("On tues do something")).to eq tuesday
    expect(Timelord.parse("On thurs do something")).to eq thursday
  end

  it "parses the next weekday" do
    friday = Date.today + 9
    monday = Date.today + 12
    expect(Timelord.parse("On next friday do something")).to eq friday
    expect(Timelord.parse("On next Monday do something")).to eq monday
  end

  it 'returns a date in the future' do
    first_of_january = Date.civil(2011,1,1)
    expect(Timelord.parse("On 1 Jan I need to do something.")).to eq first_of_january
  end

  it 'parses month_name day format' do
    first_of_march = Date.civil(2011,3,1)
    expect(Timelord.parse("March 1 I need to do stuff.")).to eq first_of_march
  end

  it 'parses mm/dd/yy correctly' do
    oct_12 = Date.civil(2015, 10, 12)
    expect(Timelord.parse("Stuff 10/12/15", format: :american)).to eq oct_12
  end

  after do
    Timecop.return
  end
end

