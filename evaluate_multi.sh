#!/bin/bash

model_args=$(cat <<- EOM
pretrained=${MCKPT_MODEL_PATH},\
trust_remote_code=True,\
use_accelerate=True
EOM
)
echo $model_args

langs=(zh vi id ta)

output_prefix='okapi'

for (( i=0; i<${#langs[@]}; i++ )); do
    lang=${langs[$i]}
	output_name="${output_prefix}_${lang}.json"
    lang_tasks=arc_${lang},hellaswag_${lang},mmlu_${lang}
	echo "Running okapi $lang_tasks, output file: $output_name"
	python main.py \
		--model_args="$model_args" \
		--tasks=$lang_tasks \
        --output_path=results/${MCKPT_RESULT_DIR}/${MCKPT_RESULT_SUBDIR}/${output_name} \
        --no_cache
done

