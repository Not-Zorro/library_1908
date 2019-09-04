require './lib/book'
require './lib/author'
require 'minitest/autorun'
require 'minitest/pride'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_has_attributes
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books
  end

  def test_for_write
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_instance_of Book, jane_eyre
    assert_equal "Jane Eyre", jane_eyre.title
    @charlotte_bronte.write("Villette", "1853")
    assert_equal 2, @charlotte_bronte.books.length
  end
end