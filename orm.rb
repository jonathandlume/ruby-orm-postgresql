require 'pg'
require 'active_support/inflector'
require 'dotenv/load'

class ORM
  SCHEMA_NAME = 'my_schema_name'  # Hardcoded schema name

  def self.connect_to_db
    db_username = ENV['DB_USERNAME']
    db_password = ENV['DB_PASSWORD']
    db_name = ENV['DB_NAME'] || 'my_db_name'
    db_host = ENV['DB_HOST'] || 'localhost'
    db_port = ENV['DB_PORT'] || 5432

    raise 'Environment variables DB_USERNAME, DB_PASSWORD must be set' if db_username.nil? || db_password.nil?

    @database_connection ||= PG.connect(
      dbname: db_name,
      user: db_username,
      password: db_password,
      host: db_host,
      port: db_port
    )

    @database_connection.exec("SET search_path TO #{SCHEMA_NAME};")
  end

  def self.inherited(subclass)
    subclass.instance_variable_set(:@table_name, subclass.name.tableize)
    subclass.instance_variable_set(:@columns, [])
    # Removed automatic table creation call
  end

  def self.table_name
    @table_name
  end

  def self.columns
    @columns
  end

  def self.database
    connect_to_db
    @database_connection
  end

  def self.create_table
    columns_definition = self.columns.join(', ')
    if columns_definition.empty?
      raise "Cannot create table #{table_name} without columns."
    end
    database.exec("CREATE TABLE IF NOT EXISTS #{table_name} (id SERIAL PRIMARY KEY, #{columns_definition})")
  end

  def self.table_exists?
    result = database.exec("SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = '#{SCHEMA_NAME}' AND table_name = '#{table_name}')")
    result.getvalue(0, 0) == 't'
  end

  def self.column(name, type)
    @columns << "#{name} #{type.upcase}"
    attr_accessor name
  end

  def self.setup_table
    create_table unless table_exists?
  end
end
