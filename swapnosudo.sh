#!/bin/bash

# Size of the swap file (in MB)
SWAPSIZE=2048

echo "📦 Creating a ${SWAPSIZE}MB swap file..."

# 1. Create the swap file
fallocate -l ${SWAPSIZE}M /swapfile

# 2. Secure the swap file
chmod 600 /swapfile

# 3. Set up the swap space
mkswap /swapfile

# 4. Enable the swap
swapon /swapfile

# 5. Persist swap in /etc/fstab
'/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# 6. Verify
echo "✅ Swap added successfully. Here's the current swap summary:"
swapon --show
free -h
