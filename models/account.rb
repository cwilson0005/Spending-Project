require_relative( '../db/sql_runner' )

class Account

  attr_reader(:id)
  attr_accessor(:first_name, :sur_name, :budget)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @sur_name = options['sur_name']
    @budget = options['budget'].to_i
  end

  def save()
    sql = "INSERT INTO accounts
    (
      first_name,
      sur_name,
      budget
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @sur_name, @budget]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM accounts"
    results = SqlRunner.run( sql )
    return results.map { |account| Account.new( account ) }
  end

  def self.delete_all()
    sql = "DELETE FROM accounts"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM accounts
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.map_items(account_data)
    return account_data.map { |account| Account.new(account) }
  end

  def update()
    sql = "UPDATE accounts
    SET
    (
      first_name,
      sur_name,
      budget
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@first_name, @last_name, @budget,@id]
    SqlRunner.run(sql, values)
  end

  def format_name()
    return "#{@first_name.capitalize} #{@sur_name.capitalize}"
  end

end
