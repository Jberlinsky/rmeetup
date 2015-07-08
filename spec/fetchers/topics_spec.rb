require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RMeetup::Fetcher::Topics, 'fetching some Topics' do
  before do
    @fetcher = RMeetup::Fetcher::Topics.new
    @fetcher.extend(RMeetup::FakeResponse::Topics)
  end
  
  it 'should return a collection of Topics' do
    @fetcher.fetch.each do |result|
      result.should be_kind_of(RMeetup::Type::V1::Topic)
    end
  end
end