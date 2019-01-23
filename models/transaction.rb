require_relative('../db/sql_runner')
require('pry')

class Transaction

  attr_reader(:id, :merchant_id, :tag_id, :transaction_date, :transaction_time)
  attr_accessor(:amount)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_f
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @transaction_date = options['transaction_date']
    @transaction_time = options['transaction_time']
  end

  def save()
    sql = "INSERT INTO transactions
    (
      amount,
      merchant_id,
      tag_id,
      transaction_date,
      transaction_time
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@amount, @merchant_id, @tag_id, @transaction_date, @transaction_time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE transactions
    SET
    (
      amount,
      merchant_id,
      tag_id
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@amount, @merchant_id, @tag_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def total()
    sql = "SELECT SUM (amount) FROM transactions"
    result = SqlRunner.run(sql)
    return "£" + result[0]["sum"]
  end

  def merchant_name
    sql = "SELECT name FROM merchants INNER JOIN transactions ON merchants.id = transactions.merchant_id"
    result = SqlRunner.run(sql)
    return result
  end

  def tag_name
    sql = "SELECT name FROM tags INNER JOIN transactions ON tags.id = transactions.tag_id"
    result = SqlRunner.run(sql)
    return result
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    return results.map {|transaction| Transaction.new(transaction)}
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  # def self.destroy(id)
  #   sql = "DELETE FROM transactions
  #   WHERE id = $1"
  #   values = [id]
  #   SqlRunner.run( sql, values )
  # end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [@id]
    transaction = SqlRunner.run(sql, values)
    # binding.pry
    result = Transaction.new(transaction.first)
    return result
  end

  # def self.map_items(transaction_data)
  #   return transaction_data.map { |transaction| Transaction.new(transaction) }
  # end

end
