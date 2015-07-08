require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RMeetup::Fetcher::Cities, 'fetching some Cities' do
  before do
    @fetcher = RMeetup::Fetcher::Cities.new
    @fetcher.extend(RMeetup::FakeResponse::Cities)
  end
  
  it 'should return a collection of Cities' do
    @fetcher.fetch.each do |result|
      result.should be_kind_of(RMeetup::Type::V1::City)
    end
  end
  
  it 'should parse a correct zip code' do
    @fetcher.fetch.first.zip.should eql('10001')
  end
end