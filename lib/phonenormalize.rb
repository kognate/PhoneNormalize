class Phonenormalize
  attr_accessor :phone_number, :normal_form_pattern
  VERSION = '1.0.0'
  def initialize(pnum = nil)
    self.phone_number = pnum
    self.normal_form_pattern = "(%A) %E-%C"
  end

  def is_valid?
    begin
      self.normal_form
    rescue BadPhoneNumber => e
      false
    end
  end

  def normal_form
    _m = self.phone_number.gsub(/[^\w]/,"").match(/^(1?[2-9][0-8][0-9])([0-9]{3})([0-9]{4})((x|ext[^\d]*)([\d]+))?$/)
    if _m
      _res = self.normal_form_pattern.gsub(/%A/,_m[1])
      _res.gsub!(/%E/,_m[2])
      _res.gsub!(/%C/,_m[3])
      if _m[6]
        _res.gsub!(/%X/,_m[6])
      else
        _res.gsub!(/%X/,"")
      end
      _res
    else
      raise BadPhoneNumber.new("Coulnd't find valid phone number in #{self.phone_number}")
    end
  end

  def has_extension?
    _m = self.phone_number.gsub(/[^\w]/,"").match(/^(1?[2-9][0-8][0-9])([0-9]{3})([0-9]{4})((x|ext[^\d]*)([\d]+))?$/)
    _m && _m[6]
  end
  
end
