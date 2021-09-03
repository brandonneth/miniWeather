#!/bin/bash

VERSION=$1

DynamicOutputDir=$VERSION-measurements

echo Profiling version $VERSION

echo Running dynamic profiling
hpcrun -o $DynamicOutputDir ./$VERSION

echo Examining program binary
hpcstruct ./$VERSION

echo Examining source code
hpcprof -o $VERSION-database -I ../+ -S ${VERSION}.hpcstruct $DynamicOutputDir

echo Done!

