require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RMeetup::Fetcher::Members, 'fetching some Members' do
  before do
    @fetcher = RMeetup::Fetcher::Members.new
    @fetcher.extend(RMeetup::FakeResponse::Members)
  end
  
  it 'should return a collection of Members' do
    @fetcher.fetch.each do |result|
      result.should be_kind_of(RMeetup::Type::V1::Member)
    end
  end
end