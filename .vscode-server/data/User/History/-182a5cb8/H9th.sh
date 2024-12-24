#!/bin/bash
cd /home/ubuntu
source dbtenv/bin/activate
cd beamdata_dbt
dbt run
