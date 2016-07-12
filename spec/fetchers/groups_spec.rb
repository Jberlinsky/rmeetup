require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RMeetup::Fetcher::Groups, 'fetching some Groups with version 1' do
  before do
    @fetcher = RMeetup::Fetcher::Groups.new 1
    @fetcher.extend(RMeetup::FakeResponse::Groups)
  end
  
  it 'should return a collection of Groups in lowest api version' do
    @fetcher.fetch.each do |result|
      result.should be_kind_of(RMeetup::Type::V1::Group)
    end
  end
end

describe RMeetup::Fetcher::Groups, 'fetching some Groups with highest version' do
  before do
    @fetcher = RMeetup::Fetcher::Groups.new
    @fetcher.extend(RMeetup::FakeResponse::Groups)
  end

  it 'should return a collection of Groups version 2' do
    @fetcher.fetch.each do |result|
      result.should be_kind_of(RMeetup::Type::V2::Group)
    end
  end
end