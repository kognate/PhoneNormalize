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
  
  def test_parse_number
    assert @pn.respond_to?(:normal_form)
    @pn.phone_number = "3129345394"
    assert_equal "(312) 934-5394",@pn.normal_form
  end

  def test_is_valid?
    assert @pn.respond_to?("is_valid?".to_sym)
    _p = Phonenormalize.new "+1 (312 934 5394"
    assert _p.is_valid?
  end

end
