# Keep this idempotent
# Create global gitignore
rm $HOME/.gitignore
touch $HOME/.gitignore
echo "# Typescript Projects
node_modules" >> $HOME/.gitignore
git config --global core.excludesFiles $HOME/.gitignore
