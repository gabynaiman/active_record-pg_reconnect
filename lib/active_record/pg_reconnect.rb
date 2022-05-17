require_relative 'pg_reconnect/version'

require 'active_record'
require 'active_record/connection_adapters/postgresql_adapter'

class ActiveRecord::ConnectionAdapters::PostgreSQLAdapter

  RECONNECTABLE_METHODS = [
    :execute,
    :exec_query,
    :exec_insert,
    :exec_update,
    :exec_delete,
    :query
  ].freeze

  RECONNECTABLE_METHODS.each do |method|
    unsafe_method = "__#{method}_without_reconnection__"

    alias_method unsafe_method, method

    private unsafe_method

    define_method method do |*args, &block|
      begin
        if reconnection_required?
          @reconnection_required = false
          reconnect!
        end
        send(unsafe_method, *args, &block)
      rescue ActiveRecord::StatementInvalid => ex
        @reconnection_required = ex.cause.is_a? PG::ConnectionBad
        raise ex
      end
    end
  end

  def reconnection_required?
    @reconnection_required ||= false
  end

end
