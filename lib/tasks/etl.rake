namespace :etl do
  require 'mysql2'
  require 'csv'
  require 'date'
  require 'fileutils'

  class << self
    def root
      File.expand_path("../../../", __FILE__)
    end
    def database
      ActiveRecord::Base.connection_config[:database]
    end
    def username
      ActiveRecord::Base.connection_config[:username]
    end
    def password
      ActiveRecord::Base.connection_config[:password]
    end
    def host
      ActiveRecord::Base.connection_config[:host]
    end
    def system!(*args)
      system(*args) || abort("\n== Command #{args} failed ==")
    end
  end

  task :debug => :environment do
    Rails.env="development"
    puts "database: #{database}"
    puts "usename:  #{username}"
    puts "password: #{password}"
    puts "host:     #{host}"
    puts "environment: #{Rails.env}"
    puts "root:     #{root}"
  end

  desc "WEBDB - leggo servizi in formato csv e scrivo su Mysql2"
  task :csv_import => :environment do |t, args|
    puts "Task csv_import: Aggiorno tabella servizi di environment #{Rails.env}"

    client = Mysql2::Client.new(:host => "#{host}", :username => "#{username}", :password => "#{password}", :database => "#{database}")
    puts "Elaboro il file: #{root}/Codice_Infrastruttura_applicazioni-v.01.csv"

    CSV.foreach("#{root}/Codice_Infrastruttura_applicazioni-v.01.csv", :headers => true) do |row|
    puts "#{row['CODICE']}"
    puts "#{row['NOME']}"
      client.query("INSERT INTO `services` (`code`, `description`, `created_at`, `updated_at`) VALUES
      ('#{row['CODICE']}', '#{row['NOME']}', '2018-02-14 19:52:51', '2018-02-14 19:52:51')")
    end

    client.close
  end

end
