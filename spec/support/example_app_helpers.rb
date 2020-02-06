# frozen_string_literal: true

require "bundler/inline"

require "active_record"
require "mysql-binuuid-rails"
require "yaml"

module ExampleAppHelpers
  def setup_example_app(initial_migration_klass)
    establish_database_connection
    perform_migration(initial_migration_klass)
  end

  def teardown_example_app
    ActiveRecord::Base.connection.execute("DROP DATABASE IF EXISTS #{database_configuration["database"]}")
  end

  def establish_database_connection
    ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)
    ActiveRecord::Base.establish_connection(database_configuration.except("database"))
    ActiveRecord::Base.connection.execute("CREATE DATABASE IF NOT EXISTS #{database_configuration["database"]}")
    ActiveRecord::Base.establish_connection(database_configuration)
  end

  def perform_migration(migration_klass)
    migration_klass.migrate(:up)
  end

  def database_configuration
    return @database_configuration if defined? @database_configuration

    db_config_file = File.open(File.expand_path(File.join(Dir.pwd, "spec", "support", "database.yml")))
    @database_configuration = YAML.safe_load(db_config_file)
  end
end
