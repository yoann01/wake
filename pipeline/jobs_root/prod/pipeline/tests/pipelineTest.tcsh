#!/bin/tcsh -f
# Should be sourced

# Move to job root
jr

# Check contents of DB
echo "Testing MySQL table"
mysql -u pipeline -ppipeline << ENDCAT
use pipeline;
SELECT * FROM test_levels;
ENDCAT

# setenv PIPELINE_DEBUG 1

# Test error checking
echo "Running: pipeline make jib job1"
pipeline make jib job1

echo "Running: pipeline make sequence seq1"
pipeline make sequence seq1

echo "Running: pipeline make job job1"
pipeline make job job1

echo "Running: pipeline make sequence seq1"
pipeline make sequence seq1

echo "Running: pipeline make shot shot1"
pipeline make shot shot1

echo "Running: pipeline make element elem1"
pipeline make element elem1

echo "Running: pipeline make job job2"
pipeline make job job2

echo "Running: pipeline make sequence seq2"
pipeline make sequence seq2

echo "Running: pipeline make shot shot2"
pipeline make shot shot2

echo "Running: pipeline make element elem2"
pipeline make element elem2

echo "Running: pipeline make sequence seq3"
pipeline make sequence seq3

echo "Running: pipeline make sequence job1:seq4"
pipeline make sequence job1:seq4

echo "Running: pipeline make shot job1:seq4:shot3"
pipeline make shot job1:seq4:shot3

echo "Running: pipeline make element job1:seq4:shot3:elem4"
pipeline make element job1:seq4:shot3:elem4

echo "Running: pipeline make extra shot3:elem4:extra1"
pipeline make extra shot3:elem4:extra1


# Inspect hierarchy
echo "Running: tree -I prod"
tree -I prod

echo "Running: env | grep TEST"
env | grep TEST

# Clean up

# echo "Testing MySQL table"
# mysql -u pipeline -ppipeline << ENDCAT
# use pipeline;
# SELECT * FROM test_levels;
# ENDCAT


echo "Running: pipeline make remove job2:seq2:shot2:elem2"
pipeline remove element job2:seq2:shot2:elem2

# echo "Testing MySQL table"
# mysql -u pipeline -ppipeline << ENDCAT
# use pipeline;
# SELECT * FROM test_levels;
# ENDCAT


echo "Running: pipeline make remove job2:seq2:shot2"
pipeline remove shot job2:seq2:shot2

echo "Running: pipeline remove job job1"
pipeline remove job job1

echo "Running: pipeline remove job job2"
pipeline remove job job2

echo "Running: pipeline remove job job1"
pipeline remove job job1

echo "Running: env | grep TEST"
env | grep TEST

echo "Testing MySQL table"
mysql -u pipeline -ppipeline << ENDCAT
use pipeline;
SELECT * FROM test_levels;
ENDCAT


exit

