=begin
Update the Record class so that updates with either
a tainted name or a tainted value are ignored.
Do this first by explicitly checking the taint on a field.

Would this be sufficient if an attacker could control part of the code?
If not, how could the different taint modes be useful?
=end

class Record
  def initialize fields
    @fields = fields
  end

  def set_property name, value
    # Change if not tainted
    @fields[name] = value if not (name.tainted? or value.tainted?)
  end

  def get_property name
    @fields[name]
  end
end

r = Record.new 'fname' => 'Rick', 'lname' => 'Grimes', 'profession' => 'Police Officer'
r.set_property 'profession'.taint, 'Zombie Hunter'
r.set_property 'lname', 'Smith'.taint

p r.get_property 'profession'
p r.get_property 'lname'



__END__

No, this would not be sufficient because the taint level has not been changed to at least 3, which would prevent values from being untainted. Currently, an adversary could untaint the data they pass in, circumventing the taint check. The code should instead include `$SAFE = 3`, or 4.
