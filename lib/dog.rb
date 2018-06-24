class Dog
  attr_accessor :name, :breed
  attr_reader :id

  def initialize(name:, breed:, id: nil)
    @name = name
    @breed = breed
    @id = id
  end

  def save
    if self.id
      self.update
    else
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      values (?,?)
    SQL
    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE if NOT EXISTS dogs(
        id PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE if EXISTS dogs
    SQL
    DB[:conn].execute(sql)
  end

end
