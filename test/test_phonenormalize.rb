require 'test/unit'
require './lib/phonenormalize'
require './lib/bad_phone_number'

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

  def test_bad_number
    @pn.phone_number = "542"
    assert_raise BadPhoneNumber do
      @pn.normal_form
    end
    assert_equal false,@pn.is_valid?
  end

  def test_is_valid?
    assert @pn.respond_to?("is_valid?".to_sym)
    @pn.phone_number = "3129345394"
    assert @pn.is_valid?
  end

  def test_normal_form_pattern
    assert @pn.respond_to?(:normal_form_pattern)
    @pn.normal_form_pattern = "[%A]"
    @pn.phone_number="3129345393"
    assert_equal "[312]",@pn.normal_form
  end

  def test_handle_extensions
    @pn.phone_number="312-931-3459ext324"
    assert @pn.is_valid?
    assert_equal "(312) 931-3459 324",@pn.normal_form
    @pn.normal_form_pattern = "%A-%E-%C !{x%X}"
    assert_equal "312-931-3459 x324",@pn.normal_form
  end

  def test_has_extension?
    @pn.phone_number="312-931-3459ext324"
    assert @pn.has_extension?
  end

end
