mkdir data
mkdir output
python generate_use_data.py --umls_dir ../umls --use_data_dir data
python generate_faiss_index.py --CODER_name GanjinZero/UMLSBert_ENG --save_dir data --phrase2idx_path data/phrase2idx.pkl
accelerate launch train.py --umls_dir path_to_umls_dir --model_name_or_path GanjinZero/UMLSBert_ENG --idx2phrase_path data/idx2phrase.pkl --phrase2idx_path data/phrase2idx.pkl --indices_path data/indices.npy --output_dir output --train_batch_size 4 --learning_rate 4e-5 --max_steps 2500000 --warmup_steps 10000 --save_step 50000 --faiss_step 250000 --use_multi_gpu True --nr_gpus 8