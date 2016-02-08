class Product
  attr_reader :price
end

class PriceCalculator
  def add product
    products << product
  end

  def products
    @products ||= []
  end

  def final_price
    @products.map(&:price).inject(&:+)
  end
end

describe "Stubs" do
  let(:calculator) { PriceCalculator.new }

  it "provides stubs to simulate state" do
    product_stub = instance_double("Product")
    allow(product_stub).to receive(:price).and_return(1.0, 100.25)

    2.times { calculator.add product_stub }

    expect(calculator.final_price).to eq 101.25
  end

  it "provides mocks to assert on message passing" do
    product_mock = double(:product)
    expect(product_mock).to receive(:price).with(any_args)

    calculator.add product_mock
    calculator.final_price
  end
end