require 'spec_helper'

describe App do
  describe "GET /" do
    it "returns OK" do
      get "/"
      last_response.should be_ok
    end
  end

  describe "GET /example-json-endpoint" do
    it "returns OK" do
      get "/example-json-endpoint"
      last_response.should be_ok
    end

    it "returns expected JSON" do
      get "/example-json-endpoint"
      JSON.parse(last_response.body).should == {"some" => "json"}
    end
  end
end
