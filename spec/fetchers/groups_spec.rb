require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RMeetup::Fetcher::Groups, 'fetching some Groups' do
  before do
    @fetcher = RMeetup::Fetcher::Groups.new
    @fetcher.extend(RMeetup::FakeResponse::Groups)
  end
  
  it 'should return a collection of Groups' do
    @fetcher.fetch.each do |result|
      result.should be_kind_of(RMeetup::Type::V1::Group)
    end
  end
end