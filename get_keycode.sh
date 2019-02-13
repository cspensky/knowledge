#!/bin/sh
xev | sed -ne '/^KeyPress/,/^$/p'
