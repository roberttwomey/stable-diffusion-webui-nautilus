#!/bin/bash

# Source directory
SRC_DIR="example"

names=("hank" "luke" "micah" "alex" "hannah" "marley" "jaevyn" "olli" 
"kylie" "michael" "jordan" "owen" "angelia")

# Loop from 2 through 12
for name in ${names[@]}; do
    
    # Destination directory name
    DEST_DIR="$name"

    echo "Copying $SRC_DIR to $DEST_DIR"
    cp -R "$SRC_DIR" "$DEST_DIR"

    # Check if the copy was successful
    if [ $? -eq 0 ]; then

        # Use sed to replace the string in the file
        sed -i '' "s/example-/$name-/g" $DEST_DIR/kustomization.yaml

        # Check if sed operation was successful
        if [ $? -eq 0 ]; then
            echo "String replacement successful."
        else
            echo "Error during string replacement."
        fi
        
    else
        echo "Error copying directory."
    fi
done

echo "Copy operation completed."