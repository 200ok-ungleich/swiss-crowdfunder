class SelfConfig

  attr_accessor :config

  def initialize
    config1 = YAML.load(File.open("config/settings.yml")) || {}
    config2 = YAML.load(File.open("config/settings.local.yml")) || {}

    @config = config1.merge(config2)
  end

end
