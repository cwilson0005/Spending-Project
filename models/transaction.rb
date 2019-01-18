require_relative( '../db/sql_runner' )

class Transaction

  attr_reader(:id, :merchant_id, :tag_id, :transaction_date, :transaction_time)
  attr_accessor(:amount)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount']
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

  # def update()
  #   sql = "UPDATE transactions
  #   SET
  #   (
  #     amount,
  #     merchant_id,
  #     tag_id,
  #     transaction_date,
  #     transaction_time
  #   ) =
  #   (
  #     $1, $2, $3, $4, $5
  #   )
  #   WHERE id = $6"
  #   values = [@amount, @merchant_id, @tag_id, @transaction_date, @transaction_time, @id]
  #   SqlRunner.run(sql, values)
  # end

  def self.total()
    sql = "SELECT SUM (amount) FROM transactions"
    results = SqlRunner.run(sql)
    return results.first
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run( sql )
    return results.map {|transaction| Transaction.new(transaction)}
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    transaction = SqlRunner.run(sql, values)
    result = Transaction.new(transaction.first)
    return result
  end

  # def self.map_items(transaction_data)
  #   return transaction_data.map { |transaction| Transaction.new(transaction) }
  # end

end
