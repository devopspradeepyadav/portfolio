#!/bin/bash

# Size of the swap file (in MB)
SWAPSIZE=2048

echo "📦 Creating a ${SWAPSIZE}MB swap file..."

# 1. Create the swap file
sudo fallocate -l ${SWAPSIZE}M /swapfile

# 2. Secure the swap file
sudo chmod 600 /swapfile

# 3. Set up the swap space
sudo mkswap /swapfile

# 4. Enable the swap
sudo swapon /swapfile

# 5. Persist swap in /etc/fstab
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# 6. Verify
echo "✅ Swap added successfully. Here's the current swap summary:"
swapon --show
free -h
