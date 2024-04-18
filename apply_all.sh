#!/bin/bash

# Directory containing all your hackteam folders
# names=("hank" "luke" "micah" "alex" "hannah" "marley" "jaevyn" "olli" 
# "kylie" "michael" "jordan" "owen" "angelia")

# names=("hank" "luke")

names=("micah" "alex" "hannah" "jaevyn" "olli" 
"kylie" "michael" "jordan" "owen" "angelia")


# Loop through each hackteam directory and apply the Kustomization
for team_dir in ${names[@]}; do
    echo "Applying Kustomization for directory: $team_dir"
    kubectl apply -k "$team_dir"
done

echo "All Kustomizations have been applied."