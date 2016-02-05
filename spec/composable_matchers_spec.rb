describe "Composable Matchers" do
  it "works with nested data" do
    class Product
      def initialize id, name, category
        @id = id
        @name = name
        @category = category
      end

      def serial_data
        [
          "X-",
          @name[0],
          @category[0],
          @id
        ]
      end
    end

    Product = Product.new 2346, "Tomato", "Fruit"

    expect(Product.serial_data).to match [
      a_string_starting_with("X-"),
      a_string_starting_with("T"),
      a_string_starting_with("F"),
      a_value < 5000
    ] #X-TF2456

    # Matchers
    # change
    # contain_exactly
    # include
    # yield_with_args(a_string_starting_with, a_hash_including())
    #
    # Matchers arguments
    # ------------------
    #
    # a_string_starting_with/ending_with
    # a_hash_including
    # a_value_within(0.05).of(3.145) // checking float number between 3.14 and 3.15
    # an_instance_of(Hash)
  end

  it "compound matchers" do
    string = "jose"

    expect(string).to start_with("j").and end_with("e")
    expect(50).to eq(20).or eq(50)
  end
end