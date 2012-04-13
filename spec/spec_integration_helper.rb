$TEST_MODE = true
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'redis'
require 'resque'
require 'timecop'
require 'redness'
require 'rack/test'
require 'redis_runner'

RSpec.configure do |config|
  config.before(:suite) do
    $redis = Redis.new(
      host: RedisRunner.host,
      port: RedisRunner.port,
      threadsafe: true
    )

    RedisRunner.start
  end

  config.after(:suite) do
    RedisRunner.stop
  end

  config.after(:each) do
    Timecop.return
    $redis.flushall
  end
end
