require 'spec_helper'

describe TrackCreator do
  before(:each) do
    @subject = TrackCreator.new('https://soundcloud.com/frangipane/transition')
  end

  describe "#resolve_url" do
    it "returns the right url" do
      @subject.resolve_url.should == 'http://api.soundcloud.com/resolve.json?url=https://soundcloud.com/frangipane/transition&client_id=7b0148ec311a1ffa34c7e0248ed2c9de'
    end
  end
end
