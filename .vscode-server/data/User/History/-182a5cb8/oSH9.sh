#!/bin/bash
cd /home/ubuntu/dbt
source dbtenv/bin/activate
cd beamdata_dbt
dbt run
