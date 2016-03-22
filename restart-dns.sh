#!/bin/bash
systemctl restart NetworkManager && nscd -i hosts && systemctl restart nscd
