require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "product_attrs_non_empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
  end
end
