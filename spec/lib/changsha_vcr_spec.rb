require 'rails_helper'
require 'changsha'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.default_cassette_options = { record: :new_episodes, erb: true, re_record_interval: 21 }
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = false
end

# Dummy class for containing the Changsha module during testing
class ChangshaHua
  attr_reader :mandarin_resp, :mandarin_body, :english_resp
end

describe 'Changsha Module with Webmock' do

  before :each do
    @changsha = ChangshaHua.new
    @changsha.extend(Changsha)
  end

  it 'can retrieve both the english and mandarin website without error' do
    VCR.use_cassette('load_changsha_gov_site', re_record_interval: 7) do
      expect { @changsha.fetch_site }.not_to raise_error
    end
  end

  it 'can load both the english and mandarin website and set them within the class' do
    VCR.use_cassette('load_changsha_gov_site_ii') do
      @changsha.fetch_site
      expect(@changsha.mandarin_resp).not_to be_nil
      expect(@changsha.english_resp).not_to be_nil
    end
  end

  it 'gets a body for the mandarin website' do
    VCR.use_cassette('load_changsha_gov_site_ii') do
      @changsha.fetch_site
      expect(@changsha.mandarin_body_present?).to be_truthy
    end
  end

  it 'is falsey when there is no body text' do
    stub_request(:any, 'http://www.changsha.gov.cn/').to_return(status: 200, body: '')
    VCR.use_cassette('no_body_cassettte') do
      @changsha.fetch_site
    end
    expect(@changsha.mandarin_body_present?).to be_falsey
  end

  xit 'raises an error when the website provides a 404' do
    # TODO How to do this?
  end

end
