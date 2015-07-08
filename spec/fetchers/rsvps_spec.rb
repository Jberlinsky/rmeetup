require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RMeetup::Fetcher::Rsvps, 'fetching some Rsvps' do
  before do
    @fetcher = RMeetup::Fetcher::Rsvps.new
    @fetcher.extend(RMeetup::FakeResponse::Rsvps)
  end
  
  it 'should return a collection of Rsvps' do
    @fetcher.fetch.each do |result|
      result.should be_kind_of(RMeetup::Type::V1::Rsvp)
    end
  end
end