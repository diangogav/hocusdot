A web app is being built that allows users to upload pictures, management would like to be able to track the size of uploaded pictures and report back the number of photos that were less than 10Mb, 50Mb, 100MB, 500MB, and 1Gb. What metric would be best for this?

Options: summary, gauge, histogram, counter
Response: Histograms should be used to calculate how long or how big something is and allows you to group observations into configurable bucket sizes

What metric should be used to report the amount of time a process has been running?
Options: summary, gauge, histogram, counter
Response: For this a counter metric would be used as it would count the number of seconds a process has been running for. The uptime of a process can never go down, so a gauge metric shouldn’t be used.

What metric should be used to report the current memory utilization?
Options: summary, gauge, histogram, counter
Response: gauge
