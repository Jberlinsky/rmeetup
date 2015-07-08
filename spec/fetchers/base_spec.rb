require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe RMeetup::Fetcher::Base, 'building an api url' do
  before do
    @fetcher = RMeetup::Fetcher::Base.new
    @options = {:key => 'seekret_api_key'}
  end
  
  it 'should build a correct to call.' do
    @options['search'] = 'ruby search'
    url = @fetcher.send(:build_url,@options)
    url.should eql("http://api.meetup.com/?key=seekret_api_key&search=ruby%20search")
  end
  
  it 'should generate a correct base url' do
    @fetcher.send(:base_url).should eql('http://api.meetup.com/')
  end
  
  it 'should uri encode options' do
    @options['with_spaces'] = 'i haz spaces'
    encoded = @fetcher.send(:encode_options, @options)
    encoded['with_spaces'].should eql('i%20haz%20spaces')
  end
  
  it 'should build a correct query string' do
    @options[:search] = 'ruby'
    params = @fetcher.send(:params_for, @options)
    params.should eql('?key=seekret_api_key&search=ruby')
  end
end

describe RMeetup::Fetcher::Base, 'getting an error back' do
  before do
    @fetcher = RMeetup::Fetcher::Base.new
    @fetcher.extend(RMeetup::FakeResponse::Error)
  end
  
  it 'should raise a detailed API error' do
    lambda {
      @fetcher.fetch
    }.should raise_error(RMeetup::Fetcher::ApiError,/Perhaps you're missing a required parameter/)
  end
end

describe RMeetup::Fetcher::Base, 'getting a collection back' do
  before do
    @fetcher = RMeetup::Fetcher::Base.new
    @fetcher.extend(RMeetup::FakeResponse::Topics)
  end
  
  it 'should get back a RMeetup::Collection' do
    @fetcher.fetch.should be_kind_of(RMeetup::Collection)
  end
  
  it 'should get a collection with all the response results' do
    @fetcher.fetch.size.should eql(29)
  end
end
