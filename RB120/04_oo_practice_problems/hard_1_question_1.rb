class SecretFile
  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    logger.create_log_entry
    @data
  end

  private

  attr_reader :logger
end

class SecurityLogger
  def create_log_entry
    puts 'Logging access'
    # ... implementation omitted ...
  end
end

key = SecretFile.new('secret-key', SecurityLogger.new)
key.data
