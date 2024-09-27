# To fix the weird duration metadata error for videos generated with IsaacSim
set -x

input_folder=.
# Iterate over each MP4 file in the input folder
for file in "$input_folder"/*.mp4; do
    # Extract the filename without extension
    filename=$(basename "$file")
    filename="${filename%.*}"

    ffmpeg -i "$file" -c copy "$input_folder/$filename-copy.mp4"
    mv "$input_folder/$filename-copy.mp4" "$file"
done
