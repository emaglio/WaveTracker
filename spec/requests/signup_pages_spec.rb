require 'spec_helper'

describe "SignupPages" do
  describe "GET /signup_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get signup_pages_index_path
      expect(response.status).to be(200)
    end
  end
end
