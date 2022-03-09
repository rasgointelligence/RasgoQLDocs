#!/bin/bash
# Bash Script to sync Transform Documentatiom from the RasgoTransforms repo
#
# The github repo for the RaghoTransforms MUST be in the same directory as this repo

# Loop through transform doc file in the RasgoTransforms repo
transform_doc_file_names=`ls ../RasgoTransforms/docs/*.md`
for transform_docs_file in $transform_doc_file_names; do
    file_path_parts=(${transform_docs_file//\// })
    md_file_name=${file_path_parts[3]}

    # Copy UDT Docs to gitbook repo
    docs_file_location="./transforms/all-transforms/$md_file_name"
    echo "Copying UDT doc to $docs_file_location"
    cp $transform_docs_file $docs_file_location
done
