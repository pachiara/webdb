# Custom configuration
#config_webdb = Rails.application.config_for(:webdb)
WEBDB = YAML.load_file("config/webdb.yml")[Rails.env]
