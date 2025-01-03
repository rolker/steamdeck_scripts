#!/bin/bash
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
echo "X11Forwarding yes" | sudo tee /etc/ssh/sshd_config.d/x11.conf

