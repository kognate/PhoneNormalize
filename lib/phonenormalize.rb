class Phonenormalize
  attr_accessor :phone_number
  VERSION = '1.0.0'
  def initialize(pnum = nil)
    self.phone_number = pnum
  end

  def is_valid?
    true
  end
  #(555) 123 9453".gsub(/[^\w]/,"").match(/([2-9][0-8][0-9])([0-9]{3})([0-9]{4})/)
end
