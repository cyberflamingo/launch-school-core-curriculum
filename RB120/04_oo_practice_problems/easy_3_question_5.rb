class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
# tv.manufacturer         # NoMethodError
tv.model                # Return whatever is in the instance method

Television.manufacturer # Return whatever is in the class method
# Television.model        # NoMethodError
