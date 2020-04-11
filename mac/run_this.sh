#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

bash $parent_path/install_apps.sh
bash $parent_path/configs/install_configs.sh
