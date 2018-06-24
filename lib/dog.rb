class Dog
  attr_accessor :name, :breed
  attr_reader :id

  def initialize(name:, breed:, id: nil)
    @name = name
    @breed = breed
    @id = id
  end

  def create_table 
    sql <<-SQL 
      CREATE TABLE if NOT EXISTS students(
        id PRIMARY KEY,
        name TEXT,
        breed TEXT        
      )
    SQL
    DB[:conn].execute(sql)
  end 

end
