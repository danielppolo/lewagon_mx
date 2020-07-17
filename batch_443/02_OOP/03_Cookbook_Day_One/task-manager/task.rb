class Task
  attr_reader :title

  def initialize(title, done = false)
    @title = title
    @done = done
  end

  def done?
    @done
  end

  def done!
    @done = true
  end
end
