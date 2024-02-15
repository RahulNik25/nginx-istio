- TO Test Traffic split use the following scrips based on the platform which you are using.
Using kaili dashboard you can determine the traffic split i.e. traffic going to version like v1 and v2.

- For Linux
/bin/bash test_traffic_split.sh "<app_endpoint>"
eg: /bin/bash test_traffic_split.sh "http://127.0.0.1:34969/"

- For Windows
.\test_traffic_split.ps1 "<app_endpoint>"
eg: .\test_traffic_split.ps1 "http://127.0.0.1:34969/"
