#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import torch

def describe(x):
    print("Type {}".format(x.type()))
    print("Shape/size : {}".format(x.shape))
    print("Value: \n{}".format(x))
