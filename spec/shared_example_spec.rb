require "apis"

describe webAPI do
  it "has a url" do
    api = webAPI.new "http://localhost:9292"
    expect(api).to respond_to :url
  end
end