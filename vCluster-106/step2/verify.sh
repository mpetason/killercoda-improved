#!/bin/bash
vcluster list 2>/dev/null | grep -q shared-demo; [ $? -ne 0 ] && echo "done"
