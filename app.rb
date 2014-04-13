$LOAD_PATH << "."

require "pubnub"
require "json"
require "tasks"

publish_key   = ENV['PUBNUB_PUBLISH_KEY']
subscribe_key = ENV['PUBNUB_SUBSCRIBE_KEY']

pubnub = Pubnub.new(
     subscribe_key: subscribe_key,
     publish_key: publish_key,
)

pubnub.subscribe(:channel => 'home') do |envelope|
  message = JSON.parse(envelope.message)
  find_task_for(message).execute
end

loop {}
