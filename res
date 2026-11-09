C:\kafka_2.13-4.4.0\bin\windows>.\kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic stock-prices --from-beginning
2026-11-09T17:44:35.553740700Z main ERROR Reconfiguration failed: No configuration found for '5e2de80c' at 'null' in 'null'
The consumer rebalance protocol (KIP-848) is production-ready! Set group.protocol=consumer to try it out. See https://kafka.apache.org/documentation/#consumer_rebalance_protocol
{"name": "Tata Steel", "current_price": 184.85}
{"name": "Tata Consultancy Services", "current_price": 2475.4}
{"name": "HDFC Bank", "current_price": 798.15}
{"name": "ICICI Bank", "current_price": 1589.0}
{"name": "Reliance Industries", "current_price": 1324.4}
{"name": "Infosys", "current_price": 1154.1}

