# API Service

| Category     | SLI                                                                                            | SLO                                                                                                         |
|--------------|------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Availability | Number of successful requests / total number of requests                                       | 99%                                                                                                         |
| Latency      | Response time of requests in a histogram showing the 90th percentile over the least 30 seconds | 90% of requests below 100ms                                                                                 |
| Error Budget | The percentage of the remaining error budget                                                                           | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   | Total number of successful requests per second                                                 | 5 RPS indicates the application is functioning                                                              |
                                                      |
