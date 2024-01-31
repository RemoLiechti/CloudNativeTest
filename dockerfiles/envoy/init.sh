export PROJECT_NAME=$(basename /workspaces/*)
cp /var/lib/envoy/launch.json /workspaces/$PROJECT_NAME
sed -i "s/_PROJECT_NAME_/$PROJECT_NAME/" /workspaces/$PROJECT_NAME/launch.json