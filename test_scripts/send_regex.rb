require 'bunny'

connection = Bunny.new("amqp://rabbitmq:rabbitmq@10.108.2.98:5672")
connection.start

channel = connection.create_channel
queue = channel.queue('rqueue', durable: true)

# message = ARGV.empty? ? 'No plate' : ARGV.join(' ')
message = 'DS[JU]6[25]3[89]'

queue.publish(message, persistent: true)
puts " [x] Sent #{message}"

connection.close
