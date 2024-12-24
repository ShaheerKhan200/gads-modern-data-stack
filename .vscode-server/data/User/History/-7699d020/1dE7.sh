#!/bin/bash
cd /home/ubuntu/dbt
source /home/ubuntu/dbt/dbtenv/bin/activate
cd /home/ubuntu/dbt/beamdata_dbt
dbt run