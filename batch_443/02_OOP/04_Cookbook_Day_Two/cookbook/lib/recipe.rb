class Recipe
  attr_reader :name, :description, :prep_time, :is_done

  def initialize(name, description, prep_time, is_done)
    @name        = name
    @description = description
    @prep_time = prep_time
    @is_done = is_done
  end

  def done?
    @is_done
  end

  def done!
    @is_done = true
  end
end
