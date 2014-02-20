require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  # test "the truth" do
  #   assert true
  # end
  test "product attribues must not be empty" do
    p = Product.new
    assert p.invalid?
    assert p.errors[:title].any?
    assert p.errors[:description].any?
    assert p.errors[:price].any?
    assert p.errors[:image_url].any?
  end

  test "prodcut price must be postive" do
    p = Product.new(title: "Book1",
                    description: "good book!!",
                    image_url: 'zzz.jpg')
    p.price = -1
    assert p.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      p.errors[:price]

    p.price = 0
    assert p.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    p.errors[:price]
    p.price = 1
    assert p.valid?
  end

  def new_product(image_url)
    Product.new(title: "My Book Title",
                description: "yyy",
                price: 1,
                image_url: image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
            http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

end
