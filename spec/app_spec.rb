require 'spec_helper'

describe App do
  describe "GET /" do
    it "returns OK" do
      get "/"
      last_response.should be_ok
    end
  end
end
