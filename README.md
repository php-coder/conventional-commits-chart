# Conventional Commits Chart

`cc-chart.sh` analyzes project commits, extracts types of the commits and generates a link to a
chart with statistic.

## Example
```console
$ cc-chart.sh 0.4 HEAD
https://quickchart.io/chart?c={type:'bar',data:{labels:['build (10)','chore (49)','ci (33)','docs
(3)','feat (2)','fix (16)','refactor (60)','revert (3)','style (23)','test (28)','unknown
(12)'],datasets:[{label:'Number of commits: 0.4..HEAD',data:[10,49,33,3,2,16,60,3,23,28,12]}]}}
```
This is how the generated image is look like:
![Example of a chart](/example-chart.png)
