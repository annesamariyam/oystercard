require 'oystercard'

describe Oystercard do
  it 'should have a balance of 0' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq(0)
  end

  it "should top up oystercard" do
    expect {subject.top_up(5)}.to change { subject.balance }.by(5)
  end

  it "should throw error if =>£90" do
    max_limit = Oystercard::MAX_LIMIT
    subject.top_up(max_limit)
    expect{ subject.top_up 1 }.to raise_error "Reached max limit of £90"
  end

  it 'should deduct spending' do
    max_limit = Oystercard::MAX_LIMIT
    subject.top_up(max_limit)
    expect(subject.deduct 10).to eq(80)
  end 

  it 'is in journey' do
    expect(subject).not_to be_in_journey
  end 

  it 'can touch in' do
    subject.top_up(1)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'can touch out' do
    subject.top_up(1)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it 'will require £1 to touch in' do
    oystercard = Oystercard.new
    expect{subject.touch_in}.to raise_error "Insufficient funds to touch in"
  end 

end
