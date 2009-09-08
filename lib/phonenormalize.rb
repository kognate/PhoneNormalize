class Phonenormalize
  attr_accessor :phone_number, :normal_form_pattern
  VERSION = '1.0.1'
  def initialize(pnum = nil)
    self.phone_number = pnum
    self.normal_form_pattern = "(%A) %E-%C!{ %X}"
  end

  def is_valid?
    begin
      parse
      true
    rescue BadPhoneNumber => e
      false
    end
  end

  def normal_form
    _m = parse
    _res = self.normal_form_pattern.gsub(/%A/,_m[:area_code])
      _res.gsub!(/%E/,_m[:exchange])
      _res.gsub!(/%C/,_m[:num])
    if _m[:extension]
      _res.gsub!(/(\s*)!\{(.*)?%X(.*)?\}/,'\1\2'+_m[:extension]+'\3')
    else
      _res.gsub!(/!\{.*?\}/,"")
    end
    _res
  end

  def has_extension?
    _m = begin
           parse
         rescue BadPhoneNumber => e
           false
         end
    _m && _m[:extension]
  end

  protected
  def parse
    _sp = self.phone_number.split(/x|ext[^\d]*/)
    _num = _sp[0].gsub(/[^\d]/,"").match(/^(1?[2-9][0-8][0-9])([0-9]{3})([0-9]{4})/)
    _ext = _sp[1].nil? ? nil : _sp[1].gsub(/[^\d]/,"")
    raise BadPhoneNumber.new("Coulnd't find valid phone number in #{self.phone_number}") unless _num
    {:area_code => _num[1], :exchange => _num[2], :num => _num[3], :extension => _ext }
  end
  
end
