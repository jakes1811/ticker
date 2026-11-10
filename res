(.venv) C:\Users\2000209445\OneDrive - Hexaware Technologies\Desktop\TESTING>python stock_producer.py
==================================================
INDIAN STOCK PRICE PRODUCER
==================================================
Primary source: IndianAPI
Backup source: YFinance
Polling interval: 30 seconds
Total stocks: 10
Kafka topic: stock-prices

Fetching stock prices...
[INDIANAPI FAILED] Reliance Industries: 401 Client Error: Unauthorized for url: https://stock.indianapi.in/stock?name=Reliance+Industries
[BACKUP] Trying YFinance for Reliance Industries
Cookie/crumb fetch failed (CertificateVerifyError), continuing without crumb
$RELIANCE.NS: possibly delisted; no price data found  (period=1d)
[BACKUP FAILED] Reliance Industries: No intraday price available from YFinance
[INDIANAPI FAILED] Tata Consultancy Services: 401 Client Error: Unauthorized for url: https://stock.indianapi.in/stock?name=Tata+Consultancy+Services
[BACKUP] Trying YFinance for Tata Consultancy Services
Cookie/crumb fetch failed (CertificateVerifyError), continuing without crumb
$TCS.NS: possibly delisted; no price data found  (period=1d)
[BACKUP FAILED] Tata Consultancy Services: No intraday price available from YFinance
[INDIANAPI FAILED] Infosys: 401 Client Error: Unauthorized for url: https://stock.indianapi.in/stock?name=Infosys
[BACKUP] Trying YFinance for Infosys
Cookie/crumb fetch failed (CertificateVerifyError), continuing without crumb
$INFY.NS: possibly delisted; no price data found  (period=1d)
[BACKUP FAILED] Infosys: No intraday price available from YFinance
[INDIANAPI FAILED] HDFC Bank: 401 Client Error: Unauthorized for url: https://stock.indianapi.in/stock?name=HDFC+Bank
[BACKUP] Trying YFinance for HDFC Bank
Cookie/crumb fetch failed (CertificateVerifyError), continuing without crumb
$HDFCBANK.NS: possibly delisted; no price data found  (period=1d)
[BACKUP FAILED] HDFC Bank: No intraday price available from YFinance
[INDIANAPI FAILED] ICICI Bank: 401 Client Error: Unauthorized for url: https://stock.indianapi.in/stock?name=ICICI+Bank
[BACKUP] Trying YFinance for ICICI Bank
Cookie/crumb fetch failed (CertificateVerifyError), continuing without crumb
$ICICIBANK.NS: possibly delisted; no price data found  (period=1d)
[BACKUP FAILED] ICICI Bank: No intraday price available from YFinance
[INDIANAPI FAILED] Tata Steel: 401 Client Error: Unauthorized for url: https://stock.indianapi.in/stock?name=Tata+Steel
[BACKUP] Trying YFinance for Tata Steel
Cookie/crumb fetch failed (CertificateVerifyError), continuing without crumb
Failed to get ticker 'TATASTEEL.NS' reason: Failed to perform, curl: (60) SSL certificate OpenSSL verify result: self signed certificate in certificate chain (19). See https://curl.se/libcurl/c/libcurl-errors.html first for more details.
Cookie/crumb fetch failed (CertificateVerifyError), continuing without crumb
[BACKUP FAILED] Tata Steel: Failed to perform, curl: (60) SSL certificate OpenSSL verify result: self signed certificate in certificate chain (19). See https://curl.se/libcurl/c/libcurl-errors.html first for more details.
[INDIANAPI FAILED] State Bank of India: 401 Client Error: Unauthorized for url: https://stock.indianapi.in/stock?name=State+Bank+of+India
[BACKUP] Trying YFinance for State Bank of India
Cookie/crumb fetch failed (CertificateVerifyError), continuing without crumb
$SBIN.NS: possibly delisted; no price data found  (period=1d)
[BACKUP FAILED] State Bank of India: No intraday price available from YFinance
[INDIANAPI FAILED] ITC: 401 Client Error: Unauthorized for url: https://stock.indianapi.in/stock?name=ITC
[BACKUP] Trying YFinance for ITC
Cookie/crumb fetch failed (CertificateVerifyError), continuing without crumb
$ITC.NS: possibly delisted; no price data found  (period=1d)
[BACKUP FAILED] ITC: No intraday price available from YFinance
[INDIANAPI FAILED] Sun Pharmaceutical: 401 Client Error: Unauthorized for url: https://stock.indianapi.in/stock?name=Sun+Pharmaceutical
[BACKUP] Trying YFinance for Sun Pharmaceutical
Cookie/crumb fetch failed (CertificateVerifyError), continuing without crumb
$SUNPHARMA.NS: possibly delisted; no price data found  (period=1d)
[BACKUP FAILED] Sun Pharmaceutical: No intraday price available from YFinance
[INDIANAPI FAILED] Bharti Airtel: 401 Client Error: Unauthorized for url: https://stock.indianapi.in/stock?name=Bharti+Airtel
[BACKUP] Trying YFinance for Bharti Airtel
Cookie/crumb fetch failed (CertificateVerifyError), continuing without crumb
$BHARTIARTL.NS: possibly delisted; no price data found  (period=1d)
[BACKUP FAILED] Bharti Airtel: No intraday price available from YFinance

Waiting 30 seconds...

Stopping producer...
Producer stopped.

(.venv) C:\Users\2000209445\OneDrive - Hexaware Technologies\Desktop\TESTING>python scrape.py
Monitoring NSE symbols every 15 minutes for price and news updates.


[2026-11-10 04:45:40 UTC] PRICE UPDATE
[2026-11-10 04:45:40 UTC] RELIANCE.NS: 1324.4000244140625 | change: first reading
[2026-11-10 04:45:40 UTC] TCS.NS: 2475.39990234375 | change: first reading
[2026-11-10 04:45:40 UTC] INFY.NS: 1154.0999755859375 | change: first reading
[2026-11-10 04:45:40 UTC] HDFCBANK.NS: 798.1500244140625 | change: first reading
[2026-11-10 04:45:40 UTC] ICICIBANK.NS: 1589.0 | change: first reading
[2026-11-10 04:45:40 UTC] SBIN.NS: 1042.0 | change: first reading
[2026-11-10 04:45:40 UTC] ITC.NS: 278.79998779296875 | change: first reading
[2026-11-10 04:45:40 UTC] SUNPHARMA.NS: 1904.5 | change: first reading
[2026-11-10 04:45:40 UTC] BHARTIARTL.NS: 2072.10009765625 | change: first reading
[2026-11-10 04:45:40 UTC] WIPRO.NS: 199.0 | change: first reading
[2026-11-10 04:45:40 UTC] EQUITASBNK.NS: 56.099998474121094 | change: first reading

[2026-11-10 04:45:45 UTC] NEWS CHECK
[2026-11-10 04:45:45 UTC] Symbol: TCS.NS
[2026-11-10 04:45:45 UTC] Close: 2475.39990234375
[2026-11-10 04:45:45 UTC] Source: Google News
[2026-11-10 04:45:45 UTC] Title: Tata Consultancy Services Stock Price Forecast. Should You Buy TCS.NS? - StockInvest.us
[2026-11-10 04:45:45 UTC] Link: https://news.google.com/rss/articles/CBMiS0FVX3lxTE11MmU1YkdGeUxtM3MxYmJWaWU0a0pQUHZtYVZDVHVnTXRRN0ZsNVJIcDFEYXRLQXVBeW9QMVFiVUNfWXp6aTRhRmtOcw?oc=5
------------------------------------------------------------
[2026-11-10 04:45:45 UTC] Symbol: HDFCBANK.NS
[2026-11-10 04:45:45 UTC] Close: 798.1500244140625
[2026-11-10 04:45:45 UTC] Source: Google News
[2026-11-10 04:45:45 UTC] Title: HDFC Bank (HDFCBANK.NS) Ticks Up 1.30% to ₹734.95 as Private Banking Major Holds Above Key Support - Equity Put Call - https://www.siam.in/
[2026-11-10 04:45:45 UTC] Link: https://news.google.com/rss/articles/CBMizwFBVV95cUxQVTFMQXJIcV9lMXM2bWpHdmVZTkttcjBCMmhmTjBjWkJKMnltV1IyNjhSZVVVYl9JX2RrQ3AyVXFNc0lxcUFzOG9NSWtUSWdjYy1XeEU2Nnp6Q0ljQXBQdmxPU3Q5amIxanl6RFpLTVRCbXcyLU53a252MkpLeHE0Tm01VXMyNFlkLThJVlNzbFM5dU9JUGRvMnJwb2VjWjM3c3o3bXpzZTk4V01kS0NsVkdXbE9DM0dFQTBNV1RlV0tBNWcyQ3ZEQ1dveTZLLXc?oc=5
------------------------------------------------------------
[2026-11-10 04:45:45 UTC] Symbol: ITC.NS
[2026-11-10 04:45:45 UTC] Close: 278.79998779296875
[2026-11-10 04:45:45 UTC] Source: Google News
[2026-11-10 04:45:45 UTC] Title: ITC Limited (ITC.NS) Gains 2.23% to ₹280.0 as FMCG Major Tests Key Resistance Zone - KAMA Signal - https://www.siam.in/
[2026-11-10 04:45:45 UTC] Link: https://news.google.com/rss/articles/CBMiugFBVV95cUxPSzFQOVFHU3p5elVUeDE5SG1vbXpiRGx2cFo2X3g3RXY0MVkxOHBVUFBhVGl5blFGUTJRYUxMMG1tOWQ4cFlwYS1kekxwTXlWc2EtLU9fNGZyY3Y5S3VMdXRtZVp2QTZLZjlZejM4UGJXdGRrd29aZEROUUNrRzZscHhicE54a0kybFVKeVFSSl9lSVpRYW5pLXVYWk1PSHgzOEVEOGgtenVzQXBoVDFxMHVwS1VkdDhheUE?oc=5
------------------------------------------------------------
[2026-11-10 04:45:45 UTC] Symbol: SUNPHARMA.NS
[2026-11-10 04:45:45 UTC] Close: 1904.5
[2026-11-10 04:45:45 UTC] Source: Google News
[2026-11-10 04:45:45 UTC] Title: Sun Pharmaceutical (SUNPHARMA.NS) Extends Gains, Trades at ₹1862.2 as Pharma Major Tests Resistance Zone - Runaway Gap - siam.in
[2026-11-10 04:45:45 UTC] Link: https://news.google.com/rss/articles/CBMi2gFBVV95cUxNaEwteWNPcU5nNDQtYll2UVJQYUtESW4xWVFZQ09wUEFqOW0wN3ZmN2Q5NGItZzZFak5yakg3RVRpT1ZZN0NJZ09ZcVZ1OV9sSVV4alBHTnNwS1BQNHRZWjBTQlFlQm1ZNXNWbVg1THdXeFEwRjlCZVFnSkhNRU5BckRFelFielJfclJfX01oWXFXSExvczlVdkkydkYzLW1DT1dCeFRoTG0tcll2dDlrR1doczVuMnA4bWdrb0RYQ1Q3a1drbjJxaTQ3ZkQyaWhfSjFqcFZrSGk2Zw?oc=5
------------------------------------------------------------
[2026-11-10 04:45:45 UTC] Symbol: BHARTIARTL.NS
[2026-11-10 04:45:45 UTC] Close: 2072.10009765625
[2026-11-10 04:45:45 UTC] Source: Google News
[2026-11-10 04:45:45 UTC] Title: Bharti Airtel Stock Price Forecast. Should You Buy BHARTIARTL.NS? - StockInvest.us
[2026-11-10 04:45:45 UTC] Link: https://news.google.com/rss/articles/CBMiVEFVX3lxTFAyb1k0VGZWV0NldGFrODRKb3VPZVlWcjlqeGJ5ODNXdWQ2QXVqRnB5Z3lQbUFZUXpMS2p4YXExRVFDcVlrbHh0M1h4UzNNS18zNGZPNg?oc=5
------------------------------------------------------------
[2026-11-10 04:45:45 UTC] Symbol: WIPRO.NS
[2026-11-10 04:45:45 UTC] Close: 199.0
[2026-11-10 04:45:45 UTC] Source: Google News
[2026-11-10 04:45:45 UTC] Title: Wipro Limited (WIPRO.NS) Gains 1.98% to ₹198.4 as IT Stock Pushes Toward Upper Range - Range Breakout - https://www.siam.in/
[2026-11-10 04:45:45 UTC] Link: https://news.google.com/rss/articles/CBMivgFBVV95cUxPVFBaMmxvN2pmTkV2alVtcGJXN3p2eFFPcUhwSGRYQ0hDRUJFVGxtUjJvanR6b0YxNE5lcmR6R3NQbDcwcVJ1YXByQTRxWlJ5Vm9oRE9MeFpiWDVJS2Fzbnl4T1Zmb3pWenpUZ0RuVlRWOWFpd0JiSXJ6ak9UdXRTNXFVcDl3US1PSzBZTlc4QUxJTmxMYTZiemtYRkV1UWN4aUlhUE1sUlV5Z2F1c1ZieUxVd2dKdVcyZ3lBYVd3?oc=5
------------------------------------------------------------

[2026-11-10 04:45:57 UTC] Sleeping until 2026-11-10 05:00:57 UTC
Traceback (most recent call last):
  File "C:\Users\2000209445\OneDrive - Hexaware Technologies\Desktop\TESTING\scrape.py", line 295, in <module>
    time.sleep(900)
    ~~~~~~~~~~^^^^^
KeyboardInterrupt
