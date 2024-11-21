#!/bin/bash

###############################################################################
#
#  A shell script used to get the local texmf directory.
#
#  Author: Haixing Hu
#  Copyright (C) 2009--2012 Haixing Hu
#
###############################################################################

TEXMF_DIR=$(kpsewhich --show-path=ls-R | tr : '\n' | grep 'texmf-local' | head -n 1);
if [[ ${TEXMF_DIR} == "" ]]; then
    TEXMF_DIR=$(kpsewhich --show-path=ls-R | tr : '\n' | grep 'local' | head -n 1);
fi
if [[ ${TEXMF_DIR} == "" ]]; then
    TEXMF_DIR=$(kpsewhich --show-path=ls-R | tr : '\n' | head -n 1);
fi
echo ${TEXMF_DIR};
