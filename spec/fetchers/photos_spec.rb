require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RMeetup::Fetcher::Photos, 'fetching some Photos' do
  before do
    @fetcher = RMeetup::Fetcher::Photos.new
    @fetcher.extend(RMeetup::FakeResponse::Photos)
  end
  
  it 'should return a collection of Photos' do
    @fetcher.fetch.each do |result|
      result.should be_kind_of(RMeetup::Type::V1::Photo)
    end
  end
end