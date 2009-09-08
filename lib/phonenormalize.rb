class Phonenormalize
  attr_accessor :phone_number
  VERSION = '1.0.0'
  def initialize(pnum = nil)
    self.phone_number = pnum
  end

  def is_valid?
    begin
      self.normal_form
    rescue BadPhoneNumber => e
      false
    end
  end

  def normal_form
    _m = self.phone_number.gsub(/[^\d]/,"").match(/(1?[2-9][0-8][0-9])([0-9]{3})([0-9]{4})/)
    if _m
      sprintf("(%s) %s-%s",_m[1],_m[2],_m[3])
    else
      raise BadPhoneNumber.new("Coulnd't find valid phone number in #{self.phone_number}")
    end
  end
  #(555) 123 9453".gsub(/[^\w]/,"").match
end
