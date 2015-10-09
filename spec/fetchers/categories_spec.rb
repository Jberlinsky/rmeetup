require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RMeetup::Fetcher::Categories, 'fetching some Categories' do
  before do
    @fetcher = RMeetup::Fetcher::Categories.new
    @fetcher.extend(RMeetup::FakeResponse::Categories)
  end
  
  it 'should return a collection of Categories' do
    @fetcher.fetch.each do |result|
      result.id
    end
  end
end