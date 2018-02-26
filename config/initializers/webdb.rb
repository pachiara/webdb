# Custom configuration
#config_webdev = Rails.application.config_for(:webdev)
WEBDEV = YAML.load_file("config/webdev.yml")[Rails.env]
