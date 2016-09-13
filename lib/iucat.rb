require 'rest-client'
require 'nokogiri'

# A simple module for curling results off IUCat and parsing them
# @since 0.0.1
module IUCat
  @@iucat_url = 'http://www.iucat.iu.edu/'
  @@fields_mapping = {
    all: 'all_fields',
    author: 'author',
    title: 'title',
    subject: 'subject'
  }

  # Uses RestClient to search iucat and set the response body as @search_result
  # @param [Symbol] field The field to search, should be a key in @@fields_mapping
  # @param [String] query What you want to search IUCat for
  # @param [Int] results The number of results you want parse (IUCat caps at 100)
  # @return [RestClient::Response] The response from iucat
  def search(field: :all, query: ' ', results: 5)
    # TODO: raise an argument error if fields_mapping.keys.include(field) is_falseyhttp://www.iucat.iu.edu/?highlight=n&per_page=101&q=&search_field=author
    resp = RestClient.get("#{@@iucat_url}/?search_field=#{@@fields_mapping[field]}&q=#{query}&per_page=#{results}")
    # TODO: raise a runtime error if @search_result.code != 200
    @search_result = resp.body
    resp
  end

  # Takes a RestClient Response and sets @result_documents.  Assumes @search_results has been set
  # @return [Nokogiri::XML::NodeSet] All the documents found, as parsed by Nokogiri
  def result_documents
    @result_documents = Nokogiri::XML(@search_result).xpath('//div[@id="documents"]/*')
  end

  # Takes a NodeSet of blacklight documents and produces a hash.  Assumes @result_documents has been set
  def result_hash
    json = {}
    @result_documents.each do |doc|

      # TODO: DRY Offense
      id = doc.xpath('*/a')[0].value.split('/').last
      title = doc.xpath('*/a')[0].text
      # TODO: Go To Item Page and Fetch stuff

    end
  end
end
