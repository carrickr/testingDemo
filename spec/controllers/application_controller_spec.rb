require 'rails_helper'

describe ApplicationController do
  describe 'landing page' do
    it 'the landing page points to #index in ApplicationController' do
      expect(get: '/').to route_to(controller: 'application', action: 'index')
    end
  end
end
