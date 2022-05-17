require 'minitest_helper'

describe ActiveRecord::PgReconnect do

  let(:connection) do
    ActiveRecord::Base.establish_connection 'postgres://postgres:password@localhost:5432/postgres'
    ActiveRecord::Base.connection
  end

  it 'Reconnect after fail' do
    refute connection.reconnection_required?

    connection.execute 'SELECT 1'

    refute connection.reconnection_required?

    connection.raw_connection.stub(:async_exec, ->(*args) { raise PG::ConnectionBad }) do
      assert_raises(ActiveRecord::StatementInvalid) { connection.execute 'SELECT 1' }
    end

    assert connection.reconnection_required?

    connection.execute 'SELECT 1'

    refute connection.reconnection_required?
  end

end