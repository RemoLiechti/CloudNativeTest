export PROJECT_NAME=$(basename /workspaces/*)
mkdir -p /workspaces/$PROJECT_NAME/.vscode
cp /var/lib/envoy/launch.json /workspaces/$PROJECT_NAME/.vscode
sed -i "s/_PROJECT_NAME_/$PROJECT_NAME/" /workspaces/$PROJECT_NAME/.vscode/launch.json