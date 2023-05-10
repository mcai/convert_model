# Script to download a SD 1.5 model from Civitai and convert it to the format used by the diffuser
# Example:
# ./convert_model.sh models realisticVisionV20_v20 29460

# Modify the following variables
export output_dir=$1 # Directory where the converted model will be saved
export civitai_model_id=$2 # ID of the model in Civitai

# Download model
wget -c https://civitai.com/api/download/models/$civitai_model_id -O model.safetensors

# Install requirements
pip install -r requirements.txt

# Convert model
python convert_diffusers20_original_sd.py model.safetensors $output_dir --v1 --reference_model runwayml/stable-diffusion-v1-5

