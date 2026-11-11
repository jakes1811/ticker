INDIAN STOCK PRICE STREAMING PIPELINE

This guide explains how to run the Kafka stock producer and the PySpark
Silver streaming job on Windows.

1. PROJECT STRUCTURE

Ticker/ |– silver/ | |– checkpoints/ | | |– stock_silver/ | |
-- stock_quarantine/ |   |-- data/ |   |   |-- stock_silver/ |   |–
stock_quarantine/ |
-- stock_silver.py |-- silver_venv/ |-- venv/ |-- requirements.txt |-- stock_producer.py–
README.md

2. WHAT EACH APPLICATION DOES

-   stock_producer.py fetches prices for 13 Indian stocks.
-   Prices are refreshed approximately every 10 seconds.
-   The latest cached observations are published to Kafka every 100
    milliseconds, after all 13 stocks have been fetched once.
-   silver/stock_silver.py reads the stock-prices Kafka topic, validates
    messages, and writes valid and rejected records to separate Delta
    tables.

Kafka broker: localhost:9092 Kafka topic: stock-prices Silver output:
silver/data/stock_silver Quarantine output: silver/data/stock_quarantine
Checkpoint: silver/checkpoints/stock_silver

3. PREREQUISITES

-   Windows
-   Python
-   Java 17
-   Apache Kafka 4.4.0, already configured
-   Hadoop Windows utility at C:.exe
-   Producer virtual environment: venv
-   Silver virtual environment: silver_venv
-   Internet access for stock APIs and initial Spark dependency
    downloads

4. PYTHON PACKAGES

Producer environment (venv): kafka-python requests truststore

Silver environment (silver_venv): pyspark==4.1.4 delta-spark==4.3.1

Install producer packages: ..ps1 python -m pip install kafka-python
requests truststore

Install Silver packages: ._venv.ps1 python -m pip install pyspark==4.1.4
delta-spark==4.3.1

5. OPTIONAL INDIANAPI KEY

The producer reads the key from the INDIANAPI_KEY environment variable.
Set it in the producer terminal if you want to use IndianAPI:

    $env:INDIANAPI_KEY = "YOUR_INDIANAPI_KEY"

If no key is configured, the producer attempts its configured fallback
sources. Do not commit a real API key to Git or share it in screenshots.

6. RUN THE PIPELINE

Use THREE separate PowerShell terminals. Start Kafka first, then the
producer, then Silver. Keep all three terminals open while the pipeline
runs.

TERMINAL 1 - KAFKA BROKER

    cd C:\kafka_2.13-4.4.0
    .\bin\windows\kafka-server-start.bat .\config\server-new.properties

Use the same Kafka installation and KRaft configuration file that was
previously initialized. If your paths differ, use your actual paths. Do
not format existing Kafka storage or generate a new cluster ID.

TERMINAL 2 - STOCK PRODUCER

Move to the project root:

    cd "C:\Users\2000209445\OneDrive - Hexaware Technologies\Desktop\Ticker"

Activate the producer environment:

    .\venv\Scripts\Activate.ps1

If PowerShell blocks activation, run:

    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    .\venv\Scripts\Activate.ps1

If using IndianAPI, set the key:

    $env:INDIANAPI_KEY = "YOUR_INDIANAPI_KEY"

Run the producer:

    python .\stock_producer.py

Wait until all 13 stocks have been fetched. The producer then publishes
the cached observations to Kafka. Keep this terminal running.

TERMINAL 3 - SILVER STREAMING JOB

Move to the project root:

    cd "C:\Users\2000209445\OneDrive - Hexaware Technologies\Desktop\Ticker"

Activate the Silver environment:

    .\silver_venv\Scripts\Activate.ps1

Configure Hadoop in this terminal:

    $env:HADOOP_HOME = "C:\hadoop"
    $env:PATH = "$env:HADOOP_HOME\bin;$env:PATH"

Verify winutils:

    where.exe winutils

Expected path:

    C:\hadoop\bin\winutils.exe

Run Silver from the project root:

    python .\silver\stock_silver.py

Expected startup messages include the Spark version, Kafka broker,
topic, output paths, and:

    Silver streaming is running...
    Press CTRL + C to stop.

Successful micro-batches should print messages similar to:

    Micro-batch 0 processed successfully.
    Micro-batch 1 processed successfully.

Keep this terminal running.

7. STOP THE PIPELINE

1.  Press CTRL + C in the Silver terminal.
2.  Press CTRL + C in the producer terminal.
3.  Press CTRL + C in the Kafka terminal last.

Keep silver/checkpoints/stock_silver if you want Silver to resume from
its saved Kafka progress next time. Do not delete checkpoint or Delta
data folders while applications are running.

8. OUTPUT FOLDERS

silver/data/stock_silver Valid records stored as a Delta table.

silver/data/stock_quarantine Invalid records stored with rejection
reasons.

silver/checkpoints/stock_silver Streaming progress and recovery
information.

Delta tables are directories containing data files and a _delta_log
folder, not single Parquet files.

9. TROUBLESHOOTING

Kafka connection error: - Confirm Kafka is running at localhost:9092. -
Start Kafka before the producer and Silver job. - Confirm the topic is
named stock-prices.

Producer is not publishing: - Check API and fallback-source errors in
the producer terminal. - Confirm all 13 stocks have been fetched. - Set
INDIANAPI_KEY if you intend to use IndianAPI.

Hadoop / winutils error: - Set HADOOP_HOME and prepend its bin directory
to PATH in the Silver terminal. - These variables must be set again in
each new terminal session.

Spark / Kafka connector error: - Confirm PySpark and the Kafka connector
versions match (currently 4.1.4). - Keep Delta Lake compatible with the
selected Spark version. - The Silver code configures the Spark Kafka
connector and Delta package when Spark starts.

Records are going to Quarantine: - Inspect rejection_reason in
silver/data/stock_quarantine. - Silver requires valid timestamp,
fetched_at, and ingested_at timestamps, among other fields.

10. IMPORTANT PRODUCER-CODE CHECK

In the supplied producer code, fetch_indianapi() returns timestamp but
does not currently return fetched_at. The Silver job expects fetched_at,
so IndianAPI-sourced messages will be rejected for a missing or invalid
fetched timestamp.

Add this field to the IndianAPI return dictionary:

    "timestamp": get_timestamp(),
    "fetched_at": get_timestamp()

The Yahoo Finance and Economic Times fallback functions already include
fetched_at.

11. QUICK CHECKLIST

[ ] Kafka broker is running. [ ] Producer environment is active in
Terminal 2. [ ] API key is set if using IndianAPI. [ ] Producer has
fetched all 13 stocks and is publishing. [ ] Silver environment is
active in Terminal 3. [ ] Hadoop environment variables are set in
Terminal 3. [ ] Silver streaming job is running. [ ] Micro-batches are
processing. [ ] Delta output is appearing under silver/data/.
