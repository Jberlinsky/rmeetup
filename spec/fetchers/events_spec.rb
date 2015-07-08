require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RMeetup::Fetcher::Events, 'fetching some Events' do
  before do
    @fetcher = RMeetup::Fetcher::Events.new
    @fetcher.extend(RMeetup::FakeResponse::Events)
  end
  
  it 'should return a collection of Events' do
    @fetcher.fetch.each do |result|
      result.should be_kind_of(RMeetup::Type::V2::Event)
    end
  end
end