require_relative '../lib/station.rb'

describe Station do
  it 'will return station name' do
    new_station = Station.new('oxford', '3')
    expect(new_station.name).to eq 'oxford'
  end

  it 'will return zone number' do
    new_station = Station.new('oxford', '3')
    expect(new_station.zone).to eq '3'
  end

end
