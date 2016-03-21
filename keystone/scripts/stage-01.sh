#!/bin/bash

groupadd -g 1500 keystone
useradd -c "Keystone" -g keystone -G www-data keystone
