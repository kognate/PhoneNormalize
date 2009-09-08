require 'test/unit'
require './lib/phonenormalize'

class NormalTest < Test::Unit::TestCase
  def setup
    @pn = Phonenormalize.new
    @pn_with_arg = Phonenormalize.new("3123123322")
  end

  def test_init
    assert @pn
    assert @pn_with_arg
  end

  def test_set_phone_number
    assert @pn.phone_number.nil?
    assert @pn.phone_number = "3123123322"
    assert_equal "3123123322",@pn.phone_number
  end

end
