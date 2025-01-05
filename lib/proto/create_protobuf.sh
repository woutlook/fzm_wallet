#!/bin/sh
protoc --dart_out=../models/pb/ ./*.proto
