#!/bin/bash

groupadd -g 1500 nova
useradd -c "Nova" -g nova -G www-data nova
