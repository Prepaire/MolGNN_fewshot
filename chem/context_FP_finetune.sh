#### GIN fine-tuning
runseed=$1
device=$2
experiment_date=0224_0
split=scaffold

input_model_file=trained_model/chemblFP_onehotMLP

epochs=100
eval_train=1
### for GIN

#for dataset in bace bbbp sider clintox  toxcast 
for dataset in  tox21  hiv muv
#for dataset in bbbp
do

python finetune.py --input_model_file ${input_model_file}  --split ${split} --filename ${dataset}_finetune_${experiment_date} \
--device $device --runseed $runseed  --dataset ${dataset} --epochs ${epochs} --eval_train ${eval_train} \
> outlogs0220/finetune_${experiment_date}_${dataset}_output.log 2>&1 &
echo "done ${dataset}_${experiment_date}"
done

