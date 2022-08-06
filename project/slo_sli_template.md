# API Service

| Category     | SLI                                                                                            | SLO                                                                                                         |
|--------------|------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Availability | Number of successful requests / total number of requests                                       | 99%                                                                                                         |
| Latency      | Response time of requests in a histogram showing the 90th percentile over the least 30 seconds | 90% of requests below 100ms                                                                                 |
<<<<<<< HEAD
| Error Budget | 1 - availabiliy                                                                                | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
=======
| Error Budget | Number of unsuccessful HTTP requests / total number of requests                                                                              | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
>>>>>>> 896a5ffbd945986c8cab098ce3425f089316c949
| Throughput   | Total number of successful requests per second                                                 | 5 RPS indicates the application is functioning                                                              |
                                                      |
