require 'rest-client'
require 'nokogiri'

# A teaching module for interacting with the changsha.gov.cn
# @since 0.0.1
module Changsha
  # Fetches the Changsha city government website in English and Chinese
  # @return [Hash] A hash of the RestClient responses
  # @option return [RestClient::Response] :zh The response when requesting the Mandarin webpage
  # @option return [RestClient::Response] :en The response when requesting the English webpage
  def fetch_site
    # Clearly this is poorly coded since it forces both calls everytime
    @mandarin_resp = RestClient.get('http://www.changsha.gov.cn', timeout: 200)
    @english_resp = RestClient.get('http://en.changsha.gov.cn', timeout: 200)
    { zh: @mandarin_resp, en: @english_resp }
  end

  # Parses the body of the mandarin site as XML
  # @return [Nokogiri::XML::Document] A parsed XML document of the body
  def mandarin_body
    fetch_site if @mandarin_resp.nil?
    @mandarin_body = Nokogiri::XML(@mandarin_resp.body)
  end

  def english_body
    # TODO
  end

  # Determine if rest client was able to get content for the mandarin page
  # @return [Boolean]
  def mandarin_body_present?
    return !@mandarin_resp.body.empty? if @mandarin_resp.class == RestClient::Response
    false # You could just let it return nil here, but the explicit false was added for clarity
  end

  def english_body_present
    # TODO
  end


end
