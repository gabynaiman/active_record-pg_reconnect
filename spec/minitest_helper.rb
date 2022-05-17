require 'coverage_helper'
require 'minitest/autorun'
require 'minitest/colorin'
require 'minitest/line/describe_track'
require 'pry-nav'

require 'active_record-pg_reconnect'

ActiveRecord::Base.establish_connection "postgres://postgres:password@localhost:5432/postgres"