require 'rails_helper'
require 'changsha'

# Dummy class for containing the Changsha module during testing
class ChangshaHua
  attr_reader :mandarin_resp, :mandarin_body, :english_resp
end

describe 'Changsha Module' do

  before :each do
    @changsha = ChangshaHua.new
    @changsha.extend(Changsha)
  end

  describe 'Some tests working directly with the website' do
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

    xit 'raises an error when the website provides a 404' do
      # TODO How to do this?
    end
  end
end
