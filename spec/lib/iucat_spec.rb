require 'rails_helper'
require 'iucat'

# Dummy class for containing the IUCat module during testing
class IUCatTester
  attr_reader :search_result
end

describe 'IUCat Module' do
  before :each do
    @iucat = IUCatTester.new
    @iucat.extend(IUCat)
  end

  describe 'searching IUCat' do
    it 'can search IUCat using default values' do
      expect(@iucat.search.class).to equal(RestClient::Response)
    end
    it 'sets search_result as a class variable' do
      expect(@iucat.search_result).to be_nil
      @iucat.search
      expect(@iucat.search_result.class).to equal(String)
      expect(@iucat.search_result).not_to be_nil
    end
  end

  describe 'parsing IUCat responses' do
    before :each do
      @iucat.search
    end

    it 'can extract the documents from the search result' do
      expect(@iucat.result_documents.class).to eq(Nokogiri::XML::NodeSet)
    end

    xit 'raises some kind of error when Nokogiri cannot parse the supplied page' do
      # Could be because @search_result has not yet been set
      # Could be garbage in
    end
  end


end
