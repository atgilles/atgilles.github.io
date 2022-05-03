#!/bin/sh
rm -vrf ./public/*
emacs -Q --script build-site.el
