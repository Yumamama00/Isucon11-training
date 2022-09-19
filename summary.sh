#!/bin/bash

# alpログ解析結果を出力
# 素のalp出力
sudo cat /var/log/nginx/access.log | alp ltsv > /tmp/alp.txt
# 正規表現でグルーピングしたalp出力
# 合計降順
sudo cat /var/log/nginx/access.log | alp ltsv -m '/api/condition/.*,/api/isu/.*/graph,/api/isu/.*/icon,/api/isu/.*,/isu/.*/graph,/isu/.*/condition,/isu/.*' --sort sum -r > /tmp/alp-grouped-sum.txt
# 平均降順
sudo cat /var/log/nginx/access.log | alp ltsv -m '/api/condition/.*,/api/isu/.*/graph,/api/isu/.*/icon,/api/isu/.*,/isu/.*/graph,/isu/.*/condition,/isu/.*' --sort avg -r > /tmp/alp-grouped-avg.txt

# スロークエリ解析結果を出力
sudo pt-query-digest /var/log/mysql/mysql-slow.log > /tmp/pt-query-digest.txt
