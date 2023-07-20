echo Generating features for each detection (using generate_detections script)
cd deep_sort/tools
echo Generating features for train
python .\generate_detections.py --model ../../model_data/mars-small128.pb --mot_dir ../../MOT20/train --output_dir ../../resources/detections/MOT20_train
pause
echo Making tracking for train sequences
cd ..
python .\deep_sort_app.py –-sequence_dir ../MOT20/train/MOT20-01 –-detection_file ../resources/detections/MOT20_train/MOT20-01.npy –-output_file ../DeepSort_predictions/MOT20-01.txt –-min_confidence 0.3 –-nn_budget 100 –-display True
python .\deep_sort_app.py –-sequence_dir ../MOT20/train/MOT20-02 –-detection_file ../resources/detections/MOT20_train/MOT20-02.npy –-output_file ../DeepSort_predictions/MOT20-02.txt –-min_confidence 0.3 –-nn_budget 100 –-display True
python .\deep_sort_app.py –-sequence_dir ../MOT20/train/MOT20-03 –-detection_file ../resources/detections/MOT20_train/MOT20-03.npy –-output_file ../DeepSort_predictions/MOT20-03.txt –-min_confidence 0.3 –-nn_budget 100 –-display True
python .\deep_sort_app.py –-sequence_dir ../MOT20/train/MOT20-05 –-detection_file ../resources/detections/MOT20_train/MOT20-05.npy –-output_file ../DeepSort_predictions/MOT20-05.txt –-min_confidence 0.3 –-nn_budget 100 –-display True
echo Trying to check motpy on MOT20-05 sequence (changed MOT16 for MOT20 in the mot16_challange.py)
cd motpy/examples
python mot16_challange.py --dataset_root=../../MOT20 --seq_id=05


