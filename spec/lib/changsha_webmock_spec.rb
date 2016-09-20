require 'rails_helper'
require 'webmock/rspec'
require 'changsha'

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
end

# Dummy class for containing the Changsha module during testing
class ChangshaHua
  attr_reader :mandarin_resp, :mandarin_body, :english_resp
end

describe 'Changsha Module with Webmock' do

  # before :all do
  #   stub_request(:any, 'http://en.changsha.gov.cn/').to_return(status: 200, body: 'The City of Changsha')
  #   stub_request(:any, 'http://www.changsha.gov.cn/').to_return(status: 200, body: '长沙话')
  # end

  before :each do
    @changsha = ChangshaHua.new
    @changsha.extend(Changsha)
    # stub_request(:any, 'http://en.changsha.gov.cn/').to_return(status: 200, body: 'The City of Changsha')
    # stub_request(:any, 'http://www.changsha.gov.cn/').to_return(status: 200, body: '长沙话')
  end

  it 'can retrieve both the english and mandarin website without error' do
    expect { @changsha.fetch_site }.not_to raise_error
  end

  it 'can load both the english and mandarin website and set them within the class' do
    @changsha.fetch_site
    expect(@changsha.mandarin_resp).not_to be_nil
    expect(@changsha.english_resp).not_to be_nil
  end

  it 'gets a body for the mandarin website' do
    @changsha.fetch_site
    expect(@changsha.mandarin_body_present?).to be_truthy
  end

  it 'is falsey when there is no body text' do
    stub_request(:any, 'http://www.changsha.gov.cn/').to_return(status: 200, body: '')
    @changsha.fetch_site
    expect(@changsha.mandarin_body_present?).to be_falsey
  end

  xit 'raises an error when the website provides a 404' do
    # TODO How to do this?
  end

end
