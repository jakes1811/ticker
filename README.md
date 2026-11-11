# Indian Stock Price Streaming Pipeline

This README explains how to run the Kafka stock producer and the PySpark
Silver streaming job on Windows.

## Project structure

``` text
Ticker/
├── silver/
│   ├── checkpoints/
│   │   ├── stock_silver/
│   │   └── stock_quarantine/
│   ├── data/
│   │   ├── stock_silver/
│   │   └── stock_quarantine/
│   └── stock_silver.py
├── silver_venv/
├── venv/
├── requirements.txt
├── stock_producer.py
└── README.md
```

## What each application does

-   `stock_producer.py` fetches prices for 13 Indian stocks. It
    refreshes prices approximately every 10 seconds and publishes the
    latest cached observations to Kafka every 100 milliseconds, after
    all 13 stocks have been fetched once.
-   `silver/stock_silver.py` reads the `stock-prices` Kafka topic,
    validates each message, and writes valid records and rejected
    records to separate Delta tables.
-   Kafka broker: `localhost:9092`
-   Kafka topic: `stock-prices`
-   Silver output: `silver/data/stock_silver`
-   Quarantine output: `silver/data/stock_quarantine`
-   Checkpoint: `silver/checkpoints/stock_silver`

## Prerequisites

-   Windows, Java 17, Python, and the configured Kafka installation.
-   Hadoop Windows utility at `C:\hadoop\bin\winutils.exe`.
-   The producer environment (`venv`) and Silver environment
    (`silver_venv`) with their required packages installed.
-   Current Silver versions: PySpark 4.1.4, Kafka connector 4.1.4, and
    compatible Delta Lake package.

## Run the applications

Use **three separate PowerShell terminals**. Start Kafka first, then the
producer, then Silver. Keep all three terminals open while the pipeline
runs.

### Terminal 1 --- Kafka broker

``` powershell
cd C:\kafka_2.13-4.4.0
.\bin\windows\kafka-server-start.bat .\config\server-new.properties
```

Use the same Kafka installation and KRaft configuration file that you
previously initialized. If your paths differ, substitute your actual
paths. Do not format existing Kafka storage or generate a new cluster
ID.

### Terminal 2 --- Stock producer

``` powershell
cd "C:\Users\2000209445\OneDrive - Hexaware Technologies\Desktop\Ticker"
.\venv\Scripts\Activate.ps1
```

If PowerShell blocks environment activation:

``` powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\venv\Scripts\Activate.ps1
```

If you have an IndianAPI key, set it in this terminal:

``` powershell
$env:INDIANAPI_KEY = "YOUR_INDIANAPI_KEY"
```

Run the producer:

``` powershell
python .\stock_producer.py
```

Wait until all 13 stocks have been fetched. The producer then publishes
the cached observations to Kafka. Keep this terminal running.

### Terminal 3 --- Silver streaming job

``` powershell
cd "C:\Users\2000209445\OneDrive - Hexaware Technologies\Desktop\Ticker"
.\silver_venv\Scripts\Activate.ps1
```

Configure Hadoop in this terminal:

``` powershell
$env:HADOOP_HOME = "C:\hadoop"
$env:PATH = "$env:HADOOP_HOME\bin;$env:PATH"
where.exe winutils
```

`where.exe winutils` should show:

``` text
C:\hadoop\bin\winutils.exe
```

Run Silver from the project root:

``` powershell
python .\silver\stock_silver.py
```

Expected startup messages include the Spark version, Kafka broker,
topic, output paths, and:

``` text
Silver streaming is running...
Press CTRL + C to stop.
```

Successful processing should produce messages similar to:

``` text
Micro-batch 0 processed successfully.
Micro-batch 1 processed successfully.
```

Keep this terminal running.

## Stop the pipeline

1.  Press `CTRL + C` in the Silver terminal.
2.  Press `CTRL + C` in the producer terminal.
3.  Press `CTRL + C` in the Kafka terminal last.

Keep `silver/checkpoints/stock_silver` if you want the Silver stream to
resume from its saved Kafka progress next time. Do not delete checkpoint
or Delta data folders while the applications are running.

## Output folders

``` text
silver/
├── data/
│   ├── stock_silver/
│   │   └── _delta_log/
│   └── stock_quarantine/
│       └── _delta_log/
└── checkpoints/
    └── stock_silver/
```

The two data directories are Delta tables (directories containing data
files and `_delta_log`), not single Parquet files.

## Troubleshooting

**Kafka connection error** - Confirm the Kafka broker is running at
`localhost:9092`. - Start Kafka before the producer and Silver job. -
Confirm the topic is named `stock-prices`.

**Producer is not publishing** - Check API and fallback-source errors in
the producer terminal. - Confirm all 13 stocks have been fetched. - Set
`INDIANAPI_KEY` if you intend to use IndianAPI.

**Hadoop / winutils error** - Set `HADOOP_HOME` and prepend its `bin`
directory to `PATH` in the Silver terminal. - These environment
variables must be set again in each new terminal session.

**Spark / Kafka connector error** - Confirm PySpark and the Kafka
connector versions match (currently 4.1.4). - Keep the Delta Lake
package compatible with the selected Spark version.

**Records are going to Quarantine** - Inspect `rejection_reason` in
`silver/data/stock_quarantine`. - The Silver job requires valid
`timestamp`, `fetched_at`, and `ingested_at` timestamps, among other
fields.

## Important producer-code check

In the supplied producer code, `fetch_indianapi()` returns `timestamp`
but does not currently return `fetched_at`. The Silver job expects
`fetched_at`, so IndianAPI-sourced messages will be rejected by Silver
for a missing/invalid fetched timestamp. Add this field to the IndianAPI
return dictionary:

``` python
"timestamp": get_timestamp(),
"fetched_at": get_timestamp()
```

The Yahoo Finance and Economic Times fallback functions already include
`fetched_at`.

## Quick checklist

-   [ ] Kafka broker is running.
-   [ ] Producer environment is active in Terminal 2.
-   [ ] API key is set if using IndianAPI.
-   [ ] Producer has fetched all 13 stocks and is publishing.
-   [ ] Silver environment is active in Terminal 3.
-   [ ] Hadoop environment variables are set in Terminal 3.
-   [ ] Silver streaming job is running.
-   [ ] Micro-batches are processing.
-   [ ] Delta output is appearing under `silver/data/`.
