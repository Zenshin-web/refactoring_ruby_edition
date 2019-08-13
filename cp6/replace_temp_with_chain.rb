class Select
  def self.with_option(option)
    select = self.new
    select.options << option
    select
  end

  def options
    @options ||= []
  end

  def add_option(arg)
    options << arg
    self
  end
end

select = Select.with_option(1999)
select.add_option(2000)
select.add_option(2001)
select.add_option(2002)
select # => #<Select:0x28708 @options=[1999, 2000, 2001, 2002]>
