class Configura
  
  class AskForMissingValue
    def seek(key)
      value = ""
      begin 
        print "Please enter value for #{key}: "
        value = gets.chomp
      end while value.empty?
      value
    end
  end
  
  class FailWhenMissingValue
    def seek(key)
      raise "You must give a value for #{key}."
    end
  end
  
  def initialize()
    @file = "#{ENV['HOME']}/.configura"
    ensure_file_exists
    @missing_value_strategy = $stdout.tty? ? AskForMissingValue.new : FailWhenMissingValue.new
    load
  end
  
  def ensure_file_exists
    unless File.exists? @file
      @config = {}
      save
    end
  end
  
  def load
    @config ||= YAML::load(open(file))
    self
  end
  
  def [](key)
    load
    if @config[key].nil?
      @config[key] = @missing_value_strategy.seek(key)
      save
    end
    @config[key]
  end
  
  def []=(key, value)
    @config[key] = value
  end
  
  def delete(*keys)
    keys.each { |key| @config.delete(key) }
    save
    self
  end
  
  def update(c={})
    @config.merge!(c)
    save
    self
  end
  
  def save
    File.open(file, 'w') { |f| f.write(YAML.dump(@config)) }
    self
  end
end