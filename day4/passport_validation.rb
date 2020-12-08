require "pry"
class PassportValidation
  def initialize(path: "./day4/input.txt")
    @passport_list = File.read(path).split("\n\n").map{ |data| ::Passport.new(data) }
  end

  def self.run(path: "./day4/input.txt")
    new(path: path).run
  end

  def run
    @passport_list.count do |passport| 
      passport.valid?
    end
  end
end

class Passport
  attr_reader :fields

  REQUIRED_FIELDS = %w[
    Byr
    Iyr 
    Eyr 
    Hgt 
    Hcl 
    Ecl 
    Pid 
  ]

  def initialize(data_string)
    @fields = data_string
      .split(/\s/)
      .map do |field_string| 
        name, value = field_string.split(":")
        Object.const_get(name.capitalize).new(value)
      end
  end

  def valid?
    REQUIRED_FIELDS.all? do |required_field|
      field = fields.select {|field| field.class == Object.const_get(required_field) }[0]

      !field.nil? && field.valid?
    end
  end
end

class Field
  attr_reader :value
  def initialize(value)
    @value = value
  end

  def valid?
    raise "Must be implemented on individual field type"
  end

  def valid_year?(earliest, latest)
    false if value.length == 4
    value.to_i >= earliest && value.to_i <= latest
  end
end

class Byr < Field
  def valid?
    valid_year?(1920, 2002)
  end
end

class Iyr < Field
  def valid?
    valid_year?(2010, 2020)
  end
end

class Eyr < Field
  def valid?
    valid_year?(2020, 2030)
  end 
end

class Hgt < Field
  def valid?
    false if !!value.match(/^\d+\D+$/)
    false if system.nil?

    if system == "in"
      digits >= 59 && digits <= 76  
    elsif system == "cm"
       digits >= 150 && digits <= 193
    else
     false
    end
  end

  def digits
    value.scan(/^\d+/).first&.to_i
  end

  def system
    value.scan(/\D{2}/).first&.downcase
  end
end

class Hcl < Field
  def valid?
    !!value.match(/#[a-f|\d]{6}/)
  end
end

class Ecl < Field
  def valid?
    %w[amb blu brn gry grn hzl oth].include?(value)
  end
end

class Pid < Field
  def valid?
    false if value.length != 9
    !!value.match(/^\d{9}$/)
  end
end

class Cid < Field
  def valid?
    true
  end
end