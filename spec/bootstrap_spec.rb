require "bootstrap"

describe Bootstrap do #define test case
  it "says hello" do #actual test
    #create a new instance called hello(method name) in Bootstrap class expecting include "Hello"
    expect(Bootstrap.new.hello).to include "Hello"
  end
end