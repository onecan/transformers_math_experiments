#!/usr/bin/env zsh

python fc_loop.py \
  --num_initial_empty_objects 43 \
  --final_database_size 37 \
  --sample-only 26 \
  --nb_threads 4 \
  --nb_local_searches 51 \
  --max-steps 50 \
  --max_epochs 2 \
  --cpu true \
  --n_tokens 100 \
  --debug
#  --seed 19280873 \
#  --exp_id 2czb1xojf1 \
