require 'spec_helper'

describe RMeetup::Client, 'trying to access the API before being configured' do
  it 'should throw an error trying to search' do
    lambda {
      RMeetup::Client.fetch(:topics)
    }.should raise_error(RMeetup::NotConfiguredError)
  end
end

describe RMeetup::Client, 'trying to fetch an unknown type' do
  before do
    RMeetup::Client.api_key = API_KEY
  end
  
  it 'should throw an error' do
    lambda {
      RMeetup::Client.fetch(:clowns)
    }.should raise_error(RMeetup::InvalidRequestTypeError)
  end
end

describe RMeetup::Client, 'fetching some topics' do
  before do
    RMeetup::Client.api_key = API_KEY
    @topics_fetcher = mock(RMeetup::Fetcher::Topics)
    @topics_fetcher.stub!(:fetch).and_return([])
    @type = :topics
  end
  
  it 'should try to get a Topic Fetcher' do
    RMeetup::Fetcher.should_receive(:for).with(@type, nil).and_return(@topics_fetcher)
    RMeetup::Client.fetch(@type,{})
  end
end

describe RMeetup::Client, 'fetching some topics with token' do
  before do
    RMeetup::Client.token = API_KEY
    @topics_fetcher = mock(RMeetup::Fetcher::Topics)
    @topics_fetcher.stub!(:fetch).and_return([])
    @type = :topics
  end

  it 'should try to get a Topic Fetcher' do
    RMeetup::Fetcher.should_receive(:for).with(@type, nil).and_return(@topics_fetcher)
    RMeetup::Client.fetch(@type,{})
  end
end