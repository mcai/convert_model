# Script to download a SD 1.5 model from Civitai and convert it to the format used by the diffuser
# Example:
# ./convert_model.sh realisticVisionV20_v20 29460

# Modify the following variables
export model_name=$1 # Name of the model
export civitai_model_id=$2 # ID of the model in Civitai

# Download model
wget -c https://civitai.com/api/download/models/$civitai_model_id -O $model_name.safetensors

# Install requirements
pip install -r requirements.txt

# Convert model
python convert_diffusers20_original_sd.py $model_name.safetensors models/$model_name --v1 --reference_model runwayml/stable-diffusion-v1-5

# Zip model
zip -r models/$model_name.zip models/$model_name/
