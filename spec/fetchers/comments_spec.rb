require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RMeetup::Fetcher::Comments, 'fetching some Comments' do
  before do
    @fetcher = RMeetup::Fetcher::Comments.new
    @fetcher.extend(RMeetup::FakeResponse::Comments)
  end
  
  it 'should return a collection of Comments' do
    @fetcher.fetch.each do |result|
      result.should be_kind_of(RMeetup::Type::V1::Comment)
    end
  end
end